<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: class_image.php 12271 2010-07-02 08:02:05Z monkey $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

class image {

	var $source = '';
	var $target = '';
	var $imginfo = array();
	var $imagecreatefromfunc = '';
	var $imagefunc = '';
	var $tmpfile = '';
	var $libmethod = 0;
	var $param = array();
	var $errorcode = 0;

	function image($channel = array()) {
		if(!$channel) {
			global $_G;
			$channel[imageinfo] = &$_G['setting'];
		}
		$this->param = array(
			'imagelib'		=> $channel[imageinfo]['imagelib'],
			'imageimpath'		=> $channel[imageinfo]['imageimpath'],
			'thumbquality'		=> $channel[imageinfo]['thumbquality'],
			'watermarkstatus'	=> $channel[imageinfo]['watermarkstatus'],
			'watermarkminwidth'	=> $channel[imageinfo]['watermarkminwidth'],
			'watermarkminheight'	=> $channel[imageinfo]['watermarkminheight'],
			'watermarktype'		=> $channel[imageinfo]['watermarktype'],
			'watermarktext'		=> $channel[imageinfo]['watermarktext'],
			'watermarktrans'	=> $channel[imageinfo]['watermarktrans'],
			'watermarkquality'	=> $channel[imageinfo]['watermarkquality']
		);
	}

	function Thumb($source, $target, $thumbwidth, $thumbheight, $thumbtype = 1, $nosuffix = 0) {
		global $_G;
		$return = $this->init('thumb', $source, $target, $nosuffix);
		if($return <= 0) {
			return $this->returncode($return);
		}

		if($this->imginfo['animated']) {
			return $this->returncode(0);
		}
		$this->param['thumbwidth'] = $thumbwidth;
		$this->param['thumbheight'] = $thumbheight;
		$this->param['thumbtype'] = $thumbtype;

		$return = !$this->libmethod ? $this->Thumb_GD() : $this->Thumb_IM();
		$return = !$nosuffix ? $return : 0;

		return $this->sleep($return);
	}

	function Watermark($source, $target = '') {
		global $_G;
		$return = $this->init('watermask', $source, $target);
		if($return <= 0) {
			return $this->returncode($return);
		}

		if(!$this->param['watermarkstatus'] || ($this->param['watermarkminwidth'] && $this->imginfo['width'] <= $this->param['watermarkminwidth'] && $this->param['watermarkminheight'] && $this->imginfo['height'] <= $this->param['watermarkminheight'])) {
			return $this->returncode(0);
		}
		$this->param['watermarkfile'] = './static/image/common/'.($this->param['watermarktype'] == 'png' ? 'watermark_house.png' : 'watermark_house.gif');
		if(!is_readable($this->param['watermarkfile']) || ($this->param['watermarktype'] == 'text' && (!file_exists($this->param['watermarktext']['fontpath']) || !is_file($this->param['watermarktext']['fontpath'])))) {
			return $this->returncode(-3);
		}
		$return = !$this->libmethod ? $this->Watermark_GD() : $this->Watermark_IM();

		return $this->sleep($return);
	}

	function error() {
		return $this->errorcode;
	}

	function init($method, $source, $target, $nosuffix = 0) {
		global $_G;

		$this->errorcode = 0;
		if(empty($source)) {
			return -2;
		}
		$parse = parse_url($source);
		if(isset($parse['host'])) {
			if(empty($target)) {
				return -2;
			}
			$data = dfsockopen($source);
			$this->tmpfile = $source = tempnam($_G['setting']['attachdir'].'./temp/', 'tmpimg_');
			file_put_contents($source, $data);
			if(!$data || $source === FALSE) {
				return -2;
			}
		}
		if($method == 'thumb') {
			$target = empty($target) ?  $source.(!$nosuffix ? '.thumb.jpg' : '') : $_G['setting']['attachdir'].'./'.$target;
		} elseif($method == 'watermask') {
			$target = empty($target) ?  $source : $_G['setting']['attachdir'].'./'.$target;
		}
		$targetpath = dirname($target);
		dmkdir($targetpath);

		clearstatcache();
		if(!is_readable($source) || !is_writable($targetpath)) {
			return -2;
		}

		$imginfo = @getimagesize($source);
		if($imginfo === FALSE) {
			return -1;
		}

		$this->source = $source;
		$this->target = $target;
		$this->imginfo['width'] = $imginfo[0];
		$this->imginfo['height'] = $imginfo[1];
		$this->imginfo['mime'] = $imginfo['mime'];
		$this->imginfo['size'] = @filesize($source);
		$this->libmethod = $this->param['imagelib'] && $this->param['imageimpath'];

		if(!$this->libmethod) {
			switch($this->imginfo['mime']) {
				case 'image/jpeg':
					$this->imagecreatefromfunc = function_exists('imagecreatefromjpeg') ? 'imagecreatefromjpeg' : '';
					$this->imagefunc = function_exists('imagejpeg') ? 'imagejpeg' : '';
					break;
				case 'image/gif':
					$this->imagecreatefromfunc = function_exists('imagecreatefromgif') ? 'imagecreatefromgif' : '';
					$this->imagefunc = function_exists('imagegif') ? 'imagegif' : '';
					break;
				case 'image/png':
					$this->imagecreatefromfunc = function_exists('imagecreatefrompng') ? 'imagecreatefrompng' : '';
					$this->imagefunc = function_exists('imagepng') ? 'imagepng' : '';
					break;
			}
		} else {
			$this->imagecreatefromfunc = $this->imagefunc = TRUE;
		}

		if(!$this->libmethod && $this->imginfo['mime'] == 'image/gif') {
			if(!$this->imagecreatefromfunc) {
				return -4;
			}
			if(!($fp = @fopen($source, 'rb'))) {
				return -2;
			}
			$content = fread($fp, $this->imginfo['size']);
			fclose($fp);
			$this->imginfo['animated'] = strpos($content, 'NETSCAPE2.0') === FALSE ? 0 : 1;
		}

		return $this->imagecreatefromfunc ? 1 : 0;
	}

	function sleep($return) {
		if($this->tmpfile) {
			@unlink($this->tmpfile);
		}
		$this->imginfo['size'] = @filesize($this->target);
		return $this->returncode($return);
	}

	function returncode($return) {
		if($return > 0 && file_exists($this->target)) {
			return true;
		} else {
			$this->errorcode = $return;
			return false;
		}
	}

	function exec($execstr) {
		exec($execstr, $output, $return);
		if(!empty($return) || !empty($output)) {
			return -3;
		}
		return true;
	}

	function sizevalue($method) {
		$x = $y = $w = $h = 0;
		if($method > 0) {
			$imgratio = $this->imginfo['width'] / $this->imginfo['height'];
			$thumbratio = $this->param['thumbwidth'] / $this->param['thumbheight'];
			if($imgratio >= 1 && $imgratio >= $thumbratio || $imgratio < 1 && $imgratio > $thumbratio) {
				$h = $this->imginfo['height'];
				$w = $h * $thumbratio;
				$x = ($this->imginfo['width'] - $thumbratio * $this->imginfo['height']) / 2;
			} elseif($imgratio >= 1 && $imgratio <= $thumbratio || $imgratio < 1 && $imgratio < $thumbratio) {
				$w = $this->imginfo['width'];
				$h = $w / $thumbratio;
			}
		} else {
			$x_ratio = $this->param['thumbwidth'] / $this->imginfo['width'];
			$y_ratio = $this->param['thumbheight'] / $this->imginfo['height'];
			if(($x_ratio * $this->imginfo['height']) < $this->param['thumbheight']) {
				$h = ceil($x_ratio * $this->imginfo['height']);
				$w = $this->param['thumbwidth'];
			} else {
				$w = ceil($y_ratio * $this->imginfo['width']);
				$h = $this->param['thumbheight'];
			}
		}
		return array($x, $y, $w, $h);
	}

	function loadsource() {
		$imagecreatefromfunc = &$this->imagecreatefromfunc;
		$im = @$imagecreatefromfunc($this->source);
		if(!$im) {
			if(!function_exists('imagecreatefromstring')) {
				return -4;
			}
			$fp = @fopen($this->source, 'rb');
			$contents = @fread($fp, filesize($this->source));
			fclose($fp);
			$im = @imagecreatefromstring($contents);
			if($im == FALSE) {
				return -1;
			}
		}
		return $im;
	}

	function Thumb_GD() {
		global $_G;

		if(!function_exists('imagecreatetruecolor') || !function_exists('imagecopyresampled') || !function_exists('imagejpeg') || !function_exists('imagecopymerge')) {
			return -4;
		}

		$imagefunc = &$this->imagefunc;

		switch($this->param['thumbtype']) {
			case 'fixnone':
			case 1:
				if($this->imginfo['width'] >= $this->param['thumbwidth'] || $this->imginfo['height'] >= $this->param['thumbheight']) {
					$attach_photo = $this->loadsource();
					if($attach_photo < 0) {
						return $attach_photo;
					}
					$thumb = array();
					list(,,$thumb['width'], $thumb['height']) = $this->sizevalue(0);
					$cx = $this->imginfo['width'];
					$cy = $this->imginfo['height'];
					$thumb_photo = imagecreatetruecolor($thumb['width'], $thumb['height']);
					$bg = imagecolorallocate($thumb_photo, 0, 0, 0);
					imagecolortransparent($thumb_photo, $bg);
					imagecopyresampled($thumb_photo, $attach_photo ,0, 0, 0, 0, $thumb['width'], $thumb['height'], $cx, $cy);
				}
				break;
			case 'fixwr':
			case 2:
				$attach_photo = $this->loadsource();
				if($attach_photo < 0) {
					return $attach_photo;
				}
				if(!($this->imginfo['width'] < $this->param['thumbwidth'] || $this->imginfo['height'] < $this->param['thumbheight'])) {
					list($startx, $starty, $cutw, $cuth) = $this->sizevalue(1);
					$dst_photo = imagecreatetruecolor($cutw, $cuth);
					imagecopymerge($dst_photo, $attach_photo, 0, 0, $startx, $starty, $cutw, $cuth, 100);
					$thumb_photo = imagecreatetruecolor($this->param['thumbwidth'], $this->param['thumbheight']);
					$bg = imagecolorallocate($thumb_photo, 0, 0, 0);
					imagecolortransparent($thumb_photo, $bg);
					imagecopyresampled($thumb_photo, $dst_photo ,0, 0, 0, 0, $this->param['thumbwidth'], $this->param['thumbheight'], $cutw, $cuth);
				} else {
					$thumb_photo = imagecreatetruecolor($this->param['thumbwidth'], $this->param['thumbheight']);
					$bg = imagecolorallocate($thumb_photo, 0, 0, 0);
					imagecolortransparent($thumb_photo, $bg);
					$bgcolor = imagecolorallocate($thumb_photo, 255, 255, 255);
					imagefill($thumb_photo, 0, 0, $bgcolor);
					$startx = ($this->param['thumbwidth'] - $this->imginfo['width']) / 2;
					$starty = ($this->param['thumbheight'] - $this->imginfo['height']) / 2;
					imagecopymerge($thumb_photo, $attach_photo, $startx, $starty, 0, 0, $this->imginfo['width'], $this->imginfo['height'], 100);
				}
				break;
		}
		clearstatcache();
		if($this->imginfo['mime'] == 'image/jpeg') {
			@$imagefunc($thumb_photo, $this->target, $this->param['thumbquality']);
		} else {
			@$imagefunc($thumb_photo, $this->target);
		}
		return 1;
	}

	function Thumb_IM() {
		global $_G;

		switch($this->param['thumbtype']) {
			case 'fixnone':
			case 1:
				$exec_str = $this->param['imageimpath'].'/convert -quality '.intval($this->param['thumbquality']).' -geometry '.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].' '.$this->source.' '.$this->target;
				$return = $this->exec($exec_str);
				if($return < 0) {
					return $return;
				}
				break;
			case 'fixwr':
			case 2:
				if(!($this->imginfo['width'] < $this->param['thumbwidth'] || $this->imginfo['height'] < $this->param['thumbheight'])) {
					list($startx, $starty, $cutw, $cuth) = $this->sizevalue(1);
					$exec_str = $this->param['imageimpath'].'/convert -quality '.intval($this->param['thumbquality']).' -crop '.$cutw.'x'.$cuth.'+'.$startx.'+'.$starty.' '.$this->source.' '.$this->target;
					$return = $this->exec($exec_str);
					if($return < 0) {
						return $return;
					}
					$exec_str = $this->param['imageimpath'].'/convert -quality '.intval($this->param['thumbquality']).' -thumbnail \''.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].'>\' -resize '.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].' -gravity center -extent '.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].' '.$this->target.' '.$this->target;
					$return = $this->exec($exec_str);
					if($return < 0) {
						return $return;
					}
				} else {
					$startx = -($this->param['thumbwidth'] - $this->imginfo['width']) / 2;
					$starty = -($this->param['thumbheight'] - $this->imginfo['height']) / 2;
					$exec_str = $this->param['imageimpath'].'/convert -quality '.intval($this->param['thumbquality']).' -crop '.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].'+'.$startx.'+'.$starty.' '.$this->source.' '.$this->target;
					$return = $this->exec($exec_str);
					if($return < 0) {
						return $return;
					}
					$exec_str = $this->param['imageimpath'].'/convert -quality '.intval($this->param['thumbquality']).' -thumbnail \''.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].'>\' -gravity center -extent '.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].' '.$this->target.' '.$this->target;
					$return = $this->exec($exec_str);
					if($return < 0) {
						return $return;
					}
				}
				break;
		}
		return 1;
	}

	function Watermark_GD() {
		global $_G;

		if(!function_exists('imagecreatetruecolor')) {
			return -4;
		}

		$imagefunc = &$this->imagefunc;

		if($this->param['watermarktype'] != 'text') {
			if(!function_exists('imagecopy') || !function_exists('imagecreatefrompng') || !function_exists('imagecreatefromgif') || !function_exists('imagealphablending') || !function_exists('imagecopymerge')) {
				return -4;
			}
			$watermarkinfo = @getimagesize($this->param['watermarkfile']);
			if($watermarkinfo === FALSE) {
				return -3;
			}
			$watermark_logo	= $this->param['watermarktype'] == 'png' ? @imageCreateFromPNG($this->param['watermarkfile']) : @imageCreateFromGIF($this->param['watermarkfile']);
			if(!$watermark_logo) {
				return 0;
			}
			list($logo_w, $logo_h) = $watermarkinfo;
		} else {
			if(!function_exists('imagettfbbox') || !function_exists('imagettftext') || !function_exists('imagecolorallocate')) {
				return -4;
			}
			$watermarktextcvt = pack("H*", $this->param['watermarktext']['text']);
			$box = imagettfbbox($this->param['watermarktext']['size'], $this->param['watermarktext']['angle'], $this->param['watermarktext']['fontpath'], $watermarktextcvt);
			$logo_h = max($box[1], $box[3]) - min($box[5], $box[7]);
			$logo_w = max($box[2], $box[4]) - min($box[0], $box[6]);
			$ax = min($box[0], $box[6]) * -1;
			$ay = min($box[5], $box[7]) * -1;
		}
		$wmwidth = $this->imginfo['width'] - $logo_w;
		$wmheight = $this->imginfo['height'] - $logo_h;

		if($wmwidth > 10 && $wmheight > 10 && !$this->imginfo['animated']) {
			switch($this->param['watermarkstatus']) {
				case 1:
					$x = 5;
					$y = 5;
					break;
				case 2:
					$x = ($this->imginfo['width'] - $logo_w) / 2;
					$y = 5;
					break;
				case 3:
					$x = $this->imginfo['width'] - $logo_w - 5;
					$y = 5;
					break;
				case 4:
					$x = 5;
					$y = ($this->imginfo['height'] - $logo_h) / 2;
					break;
				case 5:
					$x = ($this->imginfo['width'] - $logo_w) / 2;
					$y = ($this->imginfo['height'] - $logo_h) / 2;
					break;
				case 6:
					$x = $this->imginfo['width'] - $logo_w;
					$y = ($this->imginfo['height'] - $logo_h) / 2;
					break;
				case 7:
					$x = 5;
					$y = $this->imginfo['height'] - $logo_h - 5;
					break;
				case 8:
					$x = ($this->imginfo['width'] - $logo_w) / 2;
					$y = $this->imginfo['height'] - $logo_h - 5;
					break;
				case 9:
					$x = $this->imginfo['width'] - $logo_w - 5;
					$y = $this->imginfo['height'] - $logo_h - 5;
					break;
			}

			$dst_photo = imagecreatetruecolor($this->imginfo['width'], $this->imginfo['height']);
			$bg = imagecolorallocate($dst_photo, 0, 0, 0);
			imagecolortransparent($dst_photo, $bg);
			$target_photo = $this->loadsource();
			if($target_photo < 0) {
				return $target_photo;
			}
			imageCopy($dst_photo, $target_photo, 0, 0, 0, 0, $this->imginfo['width'], $this->imginfo['height']);

			if($this->param['watermarktype'] == 'png') {
				imageCopy($dst_photo, $watermark_logo, $x, $y, 0, 0, $logo_w, $logo_h);
			} elseif($this->param['watermarktype'] == 'text') {
				if(($this->param['watermarktext']['shadowx'] || $this->param['watermarktext']['shadowy']) && $this->param['watermarktext']['shadowcolor']) {
					$shadowcolorrgb = explode(',', $this->param['watermarktext']['shadowcolor']);
					$shadowcolor = imagecolorallocate($dst_photo, $shadowcolorrgb[0], $shadowcolorrgb[1], $shadowcolorrgb[2]);
					imagettftext($dst_photo, $this->param['watermarktext']['size'], $this->param['watermarktext']['angle'], $x + $ax + $this->param['watermarktext']['shadowx'], $y + $ay + $this->param['watermarktext']['shadowy'], $shadowcolor, $this->param['watermarktext']['fontpath'], $watermarktextcvt);
				}
				$colorrgb = explode(',', $this->param['watermarktext']['color']);
				$color = imagecolorallocate($dst_photo, $colorrgb[0], $colorrgb[1], $colorrgb[2]);
				imagettftext($dst_photo, $this->param['watermarktext']['size'], $this->param['watermarktext']['angle'], $x + $ax, $y + $ay, $color, $this->param['watermarktext']['fontpath'], $watermarktextcvt);
			} else {
				imageAlphaBlending($watermark_logo, true);
				imageCopyMerge($dst_photo, $watermark_logo, $x, $y, 0, 0, $logo_w, $logo_h, $this->param['watermarktrans']);
			}

			clearstatcache();
			if($this->imginfo['mime'] == 'image/jpeg') {
				@$imagefunc($dst_photo, $this->target, $this->param['watermarkquality']);
			} else {
				@$imagefunc($dst_photo, $this->target);
			}
		}
		return 1;
	}

	function Watermark_IM() {
		global $_G;

		switch($this->param['watermarkstatus']) {
			case 1:
				$gravity = 'NorthWest';
				break;
			case 2:
				$gravity = 'North';
				break;
			case 3:
				$gravity = 'NorthEast';
				break;
			case 4:
				$gravity = 'West';
				break;
			case 5:
				$gravity = 'Center';
				break;
			case 6:
				$gravity = 'East';
				break;
			case 7:
				$gravity = 'SouthWest';
				break;
			case 8:
				$gravity = 'South';
				break;
			case 9:
				$gravity = 'SouthEast';
				break;
		}

		if($this->param['watermarktype'] != 'text') {
			$exec_str = $this->param['imageimpath'].'/composite'.
				($this->param['watermarktype'] != 'png' && $this->param['watermarktrans'] != '100' ? ' -watermark '.$this->param['watermarktrans'] : '').
				' -quality '.$this->param['watermarkquality'].
				' -gravity '.$gravity.
				' '.$this->param['watermarkfile'].' '.$this->source.' '.$this->target;
		} else {
			$watermarktextcvt = str_replace(array("\n", "\r", "'"), array('', '', '\''), pack("H*", $this->param['watermarktext']['text']));
			$angle = -$this->param['watermarktext']['angle'];
			$translate = $this->param['watermarktext']['translatex'] || $this->param['watermarktext']['translatey'] ? ' translate '.$this->param['watermarktext']['translatex'].','.$this->param['watermarktext']['translatey'] : '';
			$skewX = $this->param['watermarktext']['skewx'] ? ' skewX '.$this->param['watermarktext']['skewx'] : '';
			$skewY = $this->param['watermarktext']['skewy'] ? ' skewY '.$this->param['watermarktext']['skewy'] : '';
			$exec_str = $this->param['imageimpath'].'/convert'.
				' -quality '.$this->param['watermarkquality'].
				' -font "'.$this->param['watermarktext']['fontpath'].'"'.
				' -pointsize '.$this->param['watermarktext']['size'].
				(($this->param['watermarktext']['shadowx'] || $this->param['watermarktext']['shadowy']) && $this->param['watermarktext']['shadowcolor'] ?
					' -fill "rgb('.$this->param['watermarktext']['shadowcolor'].')"'.
					' -draw "'.
						' gravity '.$gravity.$translate.$skewX.$skewY.
						' rotate '.$angle.
						' text '.$this->param['watermarktext']['shadowx'].','.$this->param['watermarktext']['shadowy'].' \''.$watermarktextcvt.'\'"' : '').
				' -fill "rgb('.$this->param['watermarktext']['color'].')"'.
				' -draw "'.
					' gravity '.$gravity.$translate.$skewX.$skewY.
					' rotate '.$angle.
					' text 0,0 \''.$watermarktextcvt.'\'"'.
				' '.$this->source.' '.$this->target;
		}
		return $this->exec($exec_str);
	}

}