<?php
//error_reporting(E_ALL);
/*
[qqcat_picexif] (C) QQCAT 2009-2010
$File: hooks.class.php, v1.0.0
$url: http://www.0718i.cn
*/

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

class plugin_qqcat_picexif {
  function plugin_qqcat_picexif() {
    global $_G,$lang;
    $this->identifier = 'qqcat_picexif';
    $this->mode = $_G['cache']['plugin'][$this->identifier]['mode'];
    $this->contentid = $_G['cache']['plugin'][$this->identifier]['contentid'];
    $this->content = $_G['cache']['plugin'][$this->identifier]['content'];
    $this->forums = @unserialize($_G['cache']['plugin'][$this->identifier]['forums']);
    $this->isset = 1;
    $this->plugdir = $discuz_root.'source/plugin/'.$this->identifier;
        
		//if(!isset($lang[temp])) {
			require_once $this->plugdir.'/lang.inc.php';
			$this->lang = $lang;
		//}

		$this->contentid = max(1,intval($this->contentid));
		if ($this->contentid==1){
		}else{
			$this->content = $this->lang[temp][$this->contentid];
		}

		$this->forums = is_array($this->forums) && $this->forums ? $this->forums : array();
		
  }
    	
	function global_footer(){
		return @$this->show_exifinfo();
	}
	
	private function show_exifinfo(){
		global $postlist, $_G, $post;
//print_r($post);

		$postlist = is_array($postlist) ? $postlist : array();
		//print_r($postlist);

		if(!$this->isset) {
			return '';
		}

		if(!in_array($_G[fid], $this->forums)) {
			return '';
		}

//		if(!is_array($thread) || empty($thread['attachment'])) {
//			return '';
//		}

//print_r($postlist);
		foreach($postlist as $pid => $post) {
			$newmsg = $postlist[$pid]['message'];
			$newlist = $postlist[$pid]['attachlist'];
			$newimglst = $postlist[$pid]['imagelist'];
			//print_r($postlist[$pid]);
			foreach($post['attachments'] as $a_key => $a_value) {
				$attachfile = $discuz_root.$a_value['url'].$a_value['attachment'];
				if ($a_value['isimage']!=0 && file_exists($attachfile)) {
					$exif = @$this->getExif($a_value['ext'],$attachfile,$a_key,$this->content);
					//echo $exif;
					if ($exif){
						$postlist[$pid]['exif'] = $exif;
						$exiftxt = $exif;
						$search = "/(<.*img.*id=\"aimg_".$a_key."\".*\/>)/i";
						$replace = "\\1".$exiftxt;
						if ($newmsg) $newmsg = preg_replace($search, $replace, $newmsg);
						$newlist = preg_replace($search, $replace, $newlist);
						$newimglst = preg_replace($search, $replace, $newimglst);
					}
				}
			}
			$postlist[$pid]['message'] = $newmsg;
			$postlist[$pid]['attachlist'] = $newlist;
			$postlist[$pid]['imagelist'] = $newimglst;
		}
//print_r($postlist[$pid]['message']);
		return '';
	}

	function getExif($extension,$attach,$aid,$content){
		$searchs = array(
		'{aid}','{����ͺ�}','{�ع�ʱ��}','{��Ȧ}',
		'{�عⲹ��}','{�ع�ģʽ}','{��ƽ��}','{ISO}',
		'{����}','{����ʱ��}','{�ֱ���}','{�����}',
		'{�������}'
		);
		if ($this->mode == '1'){
			/*EXIF��ȡphpexif.php*/
			require_once($this->plugdir.'/phpexif.php');
			if (($extension == 'jpg' || $extension == 'jpeg')){
				$er=new EXIF();
				$er->get_exif($attach);
				$exif = $er->TAG->get_all_tag();
				//print_r($exif);
				if($exif['DateTimeOriginal']!='δ��¼' && $exif['DateTimeOriginal']!=''){
					$imginfo=getimagesize($attach);
					$_x=$imginfo[0];
					$_y=$imginfo[1];

					$replaces = array(
					$aid,$exif[Model],$exif[ExposureTime],$exif[FNumber],
					$exif[ExposureBiasValue],$exif[ExposureProgram],$exif[WhiteBalance],$exif[ISOSpeedRatings],
					$exif[FocalLength],$exif[DateTimeOriginal],$_x.'*'.$_y,$exif[FlashMode],
					$exif[Maker]);
					$writedata = str_replace($searchs, $replaces, $content);
//print_r($writedata);
					return $writedata;
				}

			}
			}elseif ($this->mode == '2'){
			/*EXIF��ȡMODEL*/
			if (($extension == 'jpg' || $extension == 'jpeg') && function_exists ('read_exif_data')){
				$exif = @read_exif_data($attach,0,true);
				if ($exif['EXIF']['ExifVersion']){
					//print_r($exif);
					$FLASH_MODE_cname = array(
					0x00 => "�ر�",
					0x01 => "����",
					0x05 => "��(��̽�ⷵ�ع���)",
					0x07 => "��(̽�ⷵ�ع���)",
					0x09 => "��(ǿ��)",
					0x0D => "��(ǿ��/��̽�ⷵ�ع���)",
					0x0F => "��(ǿ��/̽�ⷵ�ع���)",
					0x10 => "�ر�(ǿ��)",
					0x18 => "�ر�(�Զ�)",
					0x19 => "��(�Զ�)",
					0x1D => "��(�Զ�/��̽�ⷵ�ع���)",
					0x1F => "��(�Զ�/̽�ⷵ�ع���)",
					0x20 => "û�����⹦��",
					0x41 => "��(������)",
					0x45 => "��(������/��̽�ⷵ�ع���)",
					0x47 => "��(������/̽�ⷵ�ع���)",
					0x49 => "��(ǿ��/������)",
					0x4D => "��(ǿ��/������/��̽�ⷵ�ع���)",
					0x4F => "��(ǿ��/������/̽�ⷵ�ع���)",
					0x59 => "��(�Զ�/������)",
					0x5D => "��(�Զ�/������/��̽�ⷵ�ع���)",
					0x5F => "��(�Զ�/������/̽�ⷵ�ع���)"
					);
					$FlashMode = $FLASH_MODE_cname[$exif[EXIF][Flash]];
					$replaces = array(
					$aid,$exif['IFD0']['Model'],$exif['EXIF']['ExposureTime'],$exif['COMPUTED']['ApertureFNumber'],
					$exif['EXIF']['ExposureBiasValue'],$exif['EXIF']['ExposureMode']==1?"�ֶ�":"�Զ�",$exif[EXIF][WhiteBalance]==1?"�ֶ�":"�Զ�",$exif['EXIF'][ISOSpeedRatings],
					$exif[EXIF][FocalLength]*1,$exif[EXIF][DateTimeOriginal],$exif[COMPUTED][Width].'*'.$exif[COMPUTED][Height],$FlashMode,
					$exif[IFD0][Make]);
					$writedata = str_replace($searchs, $replaces, $content);
					//$attach_exif = "<font color=red> ����ͺţ�</font>".$exif['IFD0']['Model']."<br>"."<font color=red> �ع�ʱ�䣺</font>".$exif['EXIF']['ExposureTime']."<font color=red> �� Ȧ��</font>".$exif['COMPUTED']['ApertureFNumber']."<font color=red> �عⲹ����</font>".$exif['EXIF']['ExposureBiasValue']."EV"."<font color=red> �ع�ģʽ��</font>".$exif=($exif['EXIF']['ExposureMode']==1?"�ֶ�":"�Զ�")."<br>"."<font color=red> �� ƽ �⣺</font>".$exif=($exif[EXIF][WhiteBalance]==1?"�ֶ�":"�Զ�")."<font color=red> ISO�й�ȣ�</font>".$exif['EXIF'][ISOSpeedRatings]."<font color=red> ���ࣺ</font>".$exif[EXIF][FocalLength]."mm"."<br>"."<font color=red> ����ʱ�䣺</font>".$exif[EXIF][DateTimeOriginal]."<font color=red> �� �� �ʣ�</font>".$exif[COMPUTED][Width]."*".$exif[COMPUTED][Height];
					return $writedata;
				}
			}
		}
		elseif ($this->mode == '3'){
			/*EXIF��ȡiExif.inc.php*/
			require_once($this->plugdir.'/iExif.lang.php');
			require_once($this->plugdir.'/iExif.inc.php');
			if (($extension == 'jpg' || $extension == 'jpeg')){
				$er=new YzuoCom_ExifInfo($attach,$lang);
				$er->API_ProcessFile();
				$exif = $er->API_ShowExifInfo();

				if($exif['tag_datetime']!=''){
					$exif['tag_exposure_program'] = $exif['tag_exposure_program']==1?"�ֶ�":"�Զ�";
					$exif['tag_whitebalance'] = $exif['tag_whitebalance']==1?"�ֶ�":"�Զ�";

					$replaces = array(
					$aid,$exif[tag_model],$exif[tag_exposure_time],$exif[tag_Fnumber],
					$exif[tag_exposure_bias],$exif[tag_exposure_program],$exif[tag_whitebalance],$exif[tag_iso_exuivalent],
					$exif[tag_focal_length],$exif[tag_datetime],$exif[tag_width].'*'.$exif[tag_height],$exif[tag_flash],
					$exif[tag_make]);
					$writedata = str_replace($searchs, $replaces, $content);

					return $writedata;
				}
			}
		}
		return false;
	}
	
}

//ȡ��EXIF��Ϣ
function get_image_exif1($extension,$attach,$aid){
	$exif = new plugin_qqcat_picexif;
	$result = $exif->getExif($extension,$attach,$aid,$exif->content);
	return $result;
}

function get_image_exif($attach){
	global $_G;
	$exif = new plugin_qqcat_picexif;
		if(!$exif->isset) {
			return '';
		}

		if(!in_array($_G[fid], $exif->forums)) {
			return '';
		}
	$result = $exif->getExif($attach['ext'],$discuz_root.$attach['url'].$attach['attachment'],$attach['aid'],$exif->content);
	//echo $result;
	return $result;
}
?>