<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: class_image.php 19369 2010-12-29 04:29:52Z zhengqingpeng $
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

	function image() {
		global $_G;
		$s = &$_G['setting'];
		$this->param = array(
			'imagelib'		=> $s['imagelib'],
			'imageimpath'		=> $s['imageimpath'],
			'thumbquality'		=> $s['thumbquality'],
			'watermarkstatus'	=> unserialize($s['watermarkstatus']),
			'watermarkminwidth'	=> unserialize($s['watermarkminwidth']),
			'watermarkminheight'	=> unserialize($s['watermarkminheight']),
			'watermarktype'		=> $s['watermarktype'],
			'watermarktext'		=> $s['watermarktext'],
			'watermarktrans'	=> unserialize($s['watermarktrans']),
			'watermarkquality'	=> unserialize($s['watermarkquality']),
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
		if($thumbwidth < 100 && $thumbheight < 100) {
			$this->param['thumbquality'] = 100;
		}

		$return = !$this->libmethod ? $this->Thumb_GD() : $this->Thumb_IM();
		$return = !$nosuffix ? $return : 0;

		return $this->sleep($return);
	}

	function Watermark($source, $target = '', $type = 'forum') {
		global $_G;
		$return = $this->init('watermask', $source, $target);
		if($return <= 0) {
			return $this->returncode($return);
		}

		if(!$this->param['watermarkstatus'][$type] || ($this->param['watermarkminwidth'][$type] && $this->imginfo['width'] <= $this->param['watermarkminwidth'][$type] && $this->param['watermarkminheight'][$type] && $this->imginfo['height'] <= $this->param['watermarkminheight'][$type])) {
			return $this->returncode(0);
		}
		$this->param['watermarkfile'][$type] = './static/image/common/'.($this->param['watermarktype'][$type] == 'png' ? 'watermark.png' : 'watermark.gif');
		if(!is_readable($this->param['watermarkfile'][$type]) || ($this->param['watermarktype'][$type] == 'text' && (!file_exists($this->param['watermarktext']['fontpath'][$type]) || !is_file($this->param['watermarktext']['fontpath'][$type])))) {
			return $this->returncode(-3);
		}

		$return = !$this->libmethod ? $this->Watermark_GD($type) : $this->Watermark_IM($type);

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
			$target = empty($target) ? (!$nosuffix ? getimgthumbname($source) : $source) : $_G['setting']['attachdir'].'./'.$target;
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

	// bluelovers
	/**
	 * @see http://www.php.net/manual/en/function.imagecopymerge.php#102844
	 **/
	function imagecopymerge_alpha($dst_im, $src_im, $dst_x, $dst_y, $src_x, $src_y, $src_w, $src_h, $pct, $trans = NULL)
		{
		$dst_w = imagesx($dst_im);
		$dst_h = imagesy($dst_im);

		// bounds checking
		$src_x = max($src_x, 0);
		$src_y = max($src_y, 0);
		$dst_x = max($dst_x, 0);
		$dst_y = max($dst_y, 0);
		if ($dst_x + $src_w > $dst_w)
			$src_w = $dst_w - $dst_x;
		if ($dst_y + $src_h > $dst_h)
			$src_h = $dst_h - $dst_y;

		for($x_offset = 0; $x_offset < $src_w; $x_offset++)
			for($y_offset = 0; $y_offset < $src_h; $y_offset++)
			{
				// get source & dest color
				$srccolor = imagecolorsforindex($src_im, imagecolorat($src_im, $src_x + $x_offset, $src_y + $y_offset));
				$dstcolor = imagecolorsforindex($dst_im, imagecolorat($dst_im, $dst_x + $x_offset, $dst_y + $y_offset));

				// apply transparency
				if (is_null($trans) || ($srccolor !== $trans))
				{
					$src_a = $srccolor['alpha'] * $pct / 100;
					// blend
					$src_a = 127 - $src_a;
					$dst_a = 127 - $dstcolor['alpha'];
					$dst_r = ($srccolor['red'] * $src_a + $dstcolor['red'] * $dst_a * (127 - $src_a) / 127) / 127;
					$dst_g = ($srccolor['green'] * $src_a + $dstcolor['green'] * $dst_a * (127 - $src_a) / 127) / 127;
					$dst_b = ($srccolor['blue'] * $src_a + $dstcolor['blue'] * $dst_a * (127 - $src_a) / 127) / 127;
					$dst_a = 127 - ($src_a + $dst_a * (127 - $src_a) / 127);
					$color = imagecolorallocatealpha($dst_im, $dst_r, $dst_g, $dst_b, $dst_a);
					// paint
					if (!imagesetpixel($dst_im, $dst_x + $x_offset, $dst_y + $y_offset, $color))
						return false;
					imagecolordeallocate($dst_im, $color);
				}
			}
		return true;
	}
	// bluelovers

	function Thumb_GD() {
		global $_G;

		if(!function_exists('imagecreatetruecolor') || !function_exists('imagecopyresampled') || !function_exists('imagejpeg') || !function_exists('imagecopymerge')) {
			return -4;
		}

		$imagefunc = &$this->imagefunc;
		$attach_photo = $this->loadsource();
		if($attach_photo < 0) {
			return $attach_photo;
		}
		$copy_photo = imagecreatetruecolor($this->imginfo['width'], $this->imginfo['height']);
		/*
		$bg = imagecolorallocate($copy_photo, 255, 255, 255);
		imagefill($copy_photo, 0, 0, $bg);
		*/

		// bluelovers
		imagealphablending($copy_photo, false);
		imagesavealpha($copy_photo, true);

//		imagecolortransparent($copy_photo, imagecolorallocatealpha($copy_photo, 0, 0, 0, 127));
		// bluelovers

		imagecopy($copy_photo, $attach_photo ,0, 0, 0, 0, $this->imginfo['width'], $this->imginfo['height']);
		$attach_photo = $copy_photo;

		switch($this->param['thumbtype']) {
			case 'fixnone':
			case 1:
				if($this->imginfo['width'] >= $this->param['thumbwidth'] || $this->imginfo['height'] >= $this->param['thumbheight']) {
					$thumb = array();
					list(,,$thumb['width'], $thumb['height']) = $this->sizevalue(0);
					$cx = $this->imginfo['width'];
					$cy = $this->imginfo['height'];
					$thumb_photo = imagecreatetruecolor($thumb['width'], $thumb['height']);

					// bluelovers
					imagealphablending($thumb_photo, false);
					imagesavealpha($thumb_photo, true);
					// bluelovers

					imagecopyresampled($thumb_photo, $attach_photo ,0, 0, 0, 0, $thumb['width'], $thumb['height'], $cx, $cy);
				}
				break;
			case 'fixwr':
			case 2:
				if(!($this->imginfo['width'] <= $this->param['thumbwidth'] || $this->imginfo['height'] <= $this->param['thumbheight'])) {
					list($startx, $starty, $cutw, $cuth) = $this->sizevalue(1);
					$dst_photo = imagecreatetruecolor($cutw, $cuth);

					// bluelovers
					// 加上此段代碼後可成功在 picasa 內正常顯示透明
					imagealphablending($dst_photo, false);
					imagesavealpha($dst_photo, true);

					// 此段代碼搭配 imagecopymerge_alpha 則可成功合併為透明圖
					$bg = imagecolortransparent($dst_photo, imagecolorallocatealpha($dst_photo, 255, 255, 255, 127));
				    imagefill($dst_photo, 0, 0, $bg);
				    imagefilledrectangle($dst_photo, 0, 0, $cutw, $cuth, $bg);
					// bluelovers

					/**
					 * 改用 imagecopymerge_alpha
					 * @see http://www.php.net/manual/en/function.imagecopymerge.php#102844
					 *
					 * 如果使用 GD 原生的 imagecopymerge 則透明的周邊會產生白色雜點
					 * 單靠 imagecopymerge_alpha 仍無法成功透明必須依賴上方的代碼
					 * @see http://www.php.net/manual/en/function.imagecopymerge.php#102496
					 **/
					$this->imagecopymerge_alpha($dst_photo, $attach_photo, 0, 0, $startx, $starty, $cutw, $cuth, 100);
					$thumb_photo = imagecreatetruecolor($this->param['thumbwidth'], $this->param['thumbheight']);

					// bluelovers
					imagealphablending($thumb_photo, false);
					imagesavealpha($thumb_photo, true);

					imagecolortransparent($thumb_photo, imagecolorallocatealpha($thumb_photo, 0, 0, 0, 127));
					// bluelovers

					imagecopyresampled($thumb_photo, $dst_photo ,0, 0, 0, 0, $this->param['thumbwidth'], $this->param['thumbheight'], $cutw, $cuth);
				} else {
					$thumb_photo = imagecreatetruecolor($this->param['thumbwidth'], $this->param['thumbheight']);

					// bluelovers
					imagealphablending($thumb_photo, false);
					imagesavealpha($thumb_photo, true);
					// bluelovers

					$bgcolor = imagecolortransparent($thumb_photo, imagecolorallocatealpha($thumb_photo, 255, 255, 255, 127));
					imagefill($thumb_photo, 0, 0, $bgcolor);

					// bluelovers
					imagefilledrectangle($thumb_photo, 0, 0, $this->param['thumbwidth'], $this->param['thumbheight'], $bgcolor);
					// bluelovers

					$startx = ($this->param['thumbwidth'] - $this->imginfo['width']) / 2;
					$starty = ($this->param['thumbheight'] - $this->imginfo['height']) / 2;
					$this->imagecopymerge_alpha($thumb_photo, $attach_photo, $startx, $starty, 0, 0, $this->imginfo['width'], $this->imginfo['height'], 100);
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
				if($this->imginfo['width'] >= $this->param['thumbwidth'] || $this->imginfo['height'] >= $this->param['thumbheight']) {
					$exec_str = $this->param['imageimpath'].'/convert -quality '.intval($this->param['thumbquality']).' -geometry '.$this->param['thumbwidth'].'x'.$this->param['thumbheight'].' '.$this->source.' '.$this->target;
					$return = $this->exec($exec_str);
					if($return < 0) {
						return $return;
					}
				}
				break;
			case 'fixwr':
			case 2:
				if(!($this->imginfo['width'] <= $this->param['thumbwidth'] || $this->imginfo['height'] <= $this->param['thumbheight'])) {
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

	function Watermark_GD($type = 'forum') {
		global $_G;

		if(!function_exists('imagecreatetruecolor')) {
			return -4;
		}

		$imagefunc = &$this->imagefunc;

		if($this->param['watermarktype'][$type] != 'text') {
			if(!function_exists('imagecopy') || !function_exists('imagecreatefrompng') || !function_exists('imagecreatefromgif') || !function_exists('imagealphablending') || !function_exists('imagecopymerge')) {
				return -4;
			}
			$watermarkinfo = @getimagesize($this->param['watermarkfile'][$type]);
			if($watermarkinfo === FALSE) {
				return -3;
			}
			$watermark_logo	= $this->param['watermarktype'][$type] == 'png' ? @imageCreateFromPNG($this->param['watermarkfile'][$type]) : @imageCreateFromGIF($this->param['watermarkfile'][$type]);
			if(!$watermark_logo) {
				return 0;
			}
			list($logo_w, $logo_h) = $watermarkinfo;
		} else {
			if(!function_exists('imagettfbbox') || !function_exists('imagettftext') || !function_exists('imagecolorallocate')) {
				return -4;
			}
			if(!class_exists('Chinese')) {
				include libfile('class/chinese');
			}

			$watermarktextcvt = pack("H*", $this->param['watermarktext']['text'][$type]);
			$box = imagettfbbox($this->param['watermarktext']['size'][$type], $this->param['watermarktext']['angle'][$type], $this->param['watermarktext']['fontpath'][$type], $watermarktextcvt);
			$logo_h = max($box[1], $box[3]) - min($box[5], $box[7]);
			$logo_w = max($box[2], $box[4]) - min($box[0], $box[6]);
			$ax = min($box[0], $box[6]) * -1;
			$ay = min($box[5], $box[7]) * -1;
		}
		$wmwidth = $this->imginfo['width'] - $logo_w;
		$wmheight = $this->imginfo['height'] - $logo_h;

		if($wmwidth > 10 && $wmheight > 10 && !$this->imginfo['animated']) {
			switch($this->param['watermarkstatus'][$type]) {
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
			if($this->imginfo['mime'] != 'image/png') {
				$color_photo = imagecreatetruecolor($this->imginfo['width'], $this->imginfo['height']);
			}
			$dst_photo = $this->loadsource();
			if($dst_photo < 0) {
				return $dst_photo;
			}
			imagealphablending($dst_photo, true);
			imagesavealpha($dst_photo, true);
			if($this->imginfo['mime'] != 'image/png') {
				imageCopy($color_photo, $dst_photo, 0, 0, 0, 0, $this->imginfo['width'], $this->imginfo['height']);
				$dst_photo = $color_photo;
			}
			if($this->param['watermarktype'][$type] == 'png') {
				imageCopy($dst_photo, $watermark_logo, $x, $y, 0, 0, $logo_w, $logo_h);
			} elseif($this->param['watermarktype'][$type] == 'text') {
				if(($this->param['watermarktext']['shadowx'][$type] || $this->param['watermarktext']['shadowy'][$type]) && $this->param['watermarktext']['shadowcolor'][$type]) {
					$shadowcolorrgb = explode(',', $this->param['watermarktext']['shadowcolor'][$type]);
					$shadowcolor = imagecolorallocate($dst_photo, $shadowcolorrgb[0], $shadowcolorrgb[1], $shadowcolorrgb[2]);
					imagettftext($dst_photo, $this->param['watermarktext']['size'][$type], $this->param['watermarktext']['angle'][$type], $x + $ax + $this->param['watermarktext']['shadowx'][$type], $y + $ay + $this->param['watermarktext']['shadowy'][$type], $shadowcolor, $this->param['watermarktext']['fontpath'][$type], $watermarktextcvt);
				}

				$colorrgb = explode(',', $this->param['watermarktext']['color'][$type]);
				$color = imagecolorallocate($dst_photo, $colorrgb[0], $colorrgb[1], $colorrgb[2]);
				imagettftext($dst_photo, $this->param['watermarktext']['size'][$type], $this->param['watermarktext']['angle'][$type], $x + $ax, $y + $ay, $color, $this->param['watermarktext']['fontpath'][$type], $watermarktextcvt);
			} else {
				imageAlphaBlending($watermark_logo, true);
				imageCopyMerge($dst_photo, $watermark_logo, $x, $y, 0, 0, $logo_w, $logo_h, $this->param['watermarktrans'][$type]);
			}

			clearstatcache();
			if($this->imginfo['mime'] == 'image/jpeg') {
				@$imagefunc($dst_photo, $this->target, $this->param['watermarkquality'][$type]);
			} else {
				@$imagefunc($dst_photo, $this->target);
			}
		}
		return 1;
	}

	function Watermark_IM($type = 'forum') {
		global $_G;

		switch($this->param['watermarkstatus'][$type]) {
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

		if($this->param['watermarktype'][$type] != 'text') {
			$exec_str = $this->param['imageimpath'].'/composite'.
				($this->param['watermarktype'][$type] != 'png' && $this->param['watermarktrans'][$type] != '100' ? ' -watermark '.$this->param['watermarktrans'][$type] : '').
				' -quality '.$this->param['watermarkquality'][$type].
				' -gravity '.$gravity.
				' '.$this->param['watermarkfile'][$type].' '.$this->source.' '.$this->target;
		} else {
			$watermarktextcvt = str_replace(array("\n", "\r", "'"), array('', '', '\''), pack("H*", $this->param['watermarktext']['text'][$type]));
			$angle = -$this->param['watermarktext']['angle'][$type];
			$translate = $this->param['watermarktext']['translatex'][$type] || $this->param['watermarktext']['translatey'][$type] ? ' translate '.$this->param['watermarktext']['translatex'][$type].','.$this->param['watermarktext']['translatey'][$type] : '';
			$skewX = $this->param['watermarktext']['skewx'][$type] ? ' skewX '.$this->param['watermarktext']['skewx'][$type] : '';
			$skewY = $this->param['watermarktext']['skewy'][$type] ? ' skewY '.$this->param['watermarktext']['skewy'][$type] : '';
			$exec_str = $this->param['imageimpath'].'/convert'.
				' -quality '.$this->param['watermarkquality'][$type].
				' -font "'.$this->param['watermarktext']['fontpath'][$type].'"'.
				' -pointsize '.$this->param['watermarktext']['size'][$type].
				(($this->param['watermarktext']['shadowx'][$type] || $this->param['watermarktext']['shadowy'][$type]) && $this->param['watermarktext']['shadowcolor'][$type] ?
					' -fill "rgb('.$this->param['watermarktext']['shadowcolor'][$type].')"'.
					' -draw "'.
						' gravity '.$gravity.$translate.$skewX.$skewY.
						' rotate '.$angle.
						' text '.$this->param['watermarktext']['shadowx'][$type].','.$this->param['watermarktext']['shadowy'][$type].' \''.$watermarktextcvt.'\'"' : '').
				' -fill "rgb('.$this->param['watermarktext']['color'][$type].')"'.
				' -draw "'.
					' gravity '.$gravity.$translate.$skewX.$skewY.
					' rotate '.$angle.
					' text 0,0 \''.$watermarktextcvt.'\'"'.
				' '.$this->source.' '.$this->target;
		}
		return $this->exec($exec_str);
	}

}