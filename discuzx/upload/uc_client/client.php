<?php

/*
	[UCenter] (C)2001-2099 Comsenz Inc.
	This is NOT a freeware, use is subject to license terms

	$Id: client.php 1079 2011-04-02 07:29:36Z zhengqingpeng $
*/

if(!defined('UC_API')) {
	exit('Access denied');
}

error_reporting(0);

define('IN_UC', TRUE);
define('UC_CLIENT_VERSION', '1.6.0');
define('UC_CLIENT_RELEASE', '20110501');
define('UC_ROOT', substr(__FILE__, 0, -10));
define('UC_DATADIR', UC_ROOT.'./data/');
define('UC_DATAURL', UC_API.'/data');
define('UC_API_FUNC', UC_CONNECT == 'mysql' ? 'uc_api_mysql' : 'uc_api_post');
$GLOBALS['uc_controls'] = array();

function uc_addslashes($string, $force = 0, $strip = FALSE) {
	!defined('MAGIC_QUOTES_GPC') && define('MAGIC_QUOTES_GPC', get_magic_quotes_gpc());
	if(!MAGIC_QUOTES_GPC || $force) {
		if(is_array($string)) {
			foreach($string as $key => $val) {
				$string[$key] = uc_addslashes($val, $force, $strip);
			}
		} else {
			$string = addslashes($strip ? stripslashes($string) : $string);
		}
	}
	return $string;
}

if(!function_exists('daddslashes')) {
	function daddslashes($string, $force = 0) {
		return uc_addslashes($string, $force);
	}
}

function uc_stripslashes($string) {
	!defined('MAGIC_QUOTES_GPC') && define('MAGIC_QUOTES_GPC', get_magic_quotes_gpc());
	if(MAGIC_QUOTES_GPC) {
		return stripslashes($string);
	} else {
		return $string;
	}
}

/**
 *  dfopen �覡�����w���Ҷ��M�ʧ@���ƾ�
 *
 * @param string $module	�ШD���Ҷ�
 * @param string $action 	�ШD���ʧ@
 * @param array $arg		�Ѽơ]�|�[�K���覡�ǰe�^
 * @return string
 */
function uc_api_post($module, $action, $arg = array()) {
	$s = $sep = '';
	foreach($arg as $k => $v) {
		$k = urlencode($k);
		if(is_array($v)) {
			$s2 = $sep2 = '';
			foreach($v as $k2 => $v2) {
				$k2 = urlencode($k2);
				$s2 .= "$sep2{$k}[$k2]=".urlencode(uc_stripslashes($v2));
				$sep2 = '&';
			}
			$s .= $sep.$s2;
		} else {
			$s .= "$sep$k=".urlencode(uc_stripslashes($v));
		}
		$sep = '&';
	}
	$postdata = uc_api_requestdata($module, $action, $s);
	return uc_fopen2(UC_API.'/index.php', 500000, $postdata, '', TRUE, UC_IP, 20);
}

/**
 * �c�y�o�e���Τᤤ�ߪ��ШD�ƾ�
 *
 * @param string $module	�ШD���Ҷ�
 * @param string $action	�ШD���ʧ@
 * @param string $arg		�Ѽơ]�|�[�K���覡�ǰe�^
 * @param string $extra		���[�Ѽơ]�ǰe�ɤ��[�K�^
 * @return string
 */
function uc_api_requestdata($module, $action, $arg='', $extra='') {
	$input = uc_api_input($arg);
	$post = "m=$module&a=$action&inajax=2&release=".UC_CLIENT_RELEASE."&input=$input&appid=".UC_APPID.$extra;
	return $post;
}

function uc_api_url($module, $action, $arg='', $extra='') {
	$url = UC_API.'/index.php?'.uc_api_requestdata($module, $action, $arg, $extra);
	return $url;
}

function uc_api_input($data) {
	$s = urlencode(uc_authcode($data.'&agent='.md5($_SERVER['HTTP_USER_AGENT'])."&time=".time(), 'ENCODE', UC_KEY));
	return $s;
}

/**
 * MYSQL �覡�����w���Ҷ��M�ʧ@���ƾ�
 *
 * @param string $model		�ШD���Ҷ�
 * @param string $action	�ШD���ʧ@
 * @param string $args		�Ѽơ]�|�[�K���覡�ǰe�^
 * @return mix
 */
function uc_api_mysql($model, $action, $args=array()) {
	global $uc_controls;
	if(empty($uc_controls[$model])) {
		include_once UC_ROOT.'./lib/db.class.php';
		include_once UC_ROOT.'./model/base.php';
		include_once UC_ROOT."./control/$model.php";
		eval("\$uc_controls['$model'] = new {$model}control();");
	}
	if($action{0} != '_') {
		$args = uc_addslashes($args, 1, TRUE);
		$action = 'on'.$action;
		$uc_controls[$model]->input = $args;
		return $uc_controls[$model]->$action($args);
	} else {
		return '';
	}
}

function uc_serialize($arr, $htmlon = 0) {
	include_once UC_ROOT.'./lib/xml.class.php';
	return xml_serialize($arr, $htmlon);
}

function uc_unserialize($s) {
	include_once UC_ROOT.'./lib/xml.class.php';
	return xml_unserialize($s);
}

/**
 * �r�Ŧ�[�K�H�θѱK���
 *
 * @param string $string	���Ϊ̱K��
 * @param string $operation	�ާ@(ENCODE | DECODE), �w�]�� DECODE
 * @param string $key		�K�_
 * @param int $expiry		�K�妳�Ĵ�, �[�K�ɭԦ��ġA ��� ��A0 ���ä[����
 * @return string		�B�z�᪺ ���Ϊ� �g�L base64_encode �B�z�᪺�K��
 *
 * @example
 *
 * 	$a = authcode('abc', 'ENCODE', 'key');
 * 	$b = authcode($a, 'DECODE', 'key');  // $b(abc)
 *
 * 	$a = authcode('abc', 'ENCODE', 'key', 3600);
 * 	$b = authcode('abc', 'DECODE', 'key'); // �b�@�Ӥp�ɤ��A$b(abc)�A�_�h $b ����
 */
function uc_authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {

	$ckey_length = 4;	//note �H���K�_���� ���� 0-32;
				//note �[�J�H���K�_�A�i�H�O�K��L����W�ߡA�Y�K�O���M�K�_�����ۦP�A�[�K���G�]�|�C�����P�A�W�j�}�����סC
				//note ���ȶV�j�A�K���ܰʳW�߶V�j�A�K���ܤ� = 16 �� $ckey_length ����
				//note ���Ȭ� 0 �ɡA�h�������H���K�_

	$key = md5($key ? $key : UC_KEY);
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE') {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		return $keyc.str_replace('=', '', base64_encode($result));
	}
}

/**
 *  ���{���}URL
 *  @param string $url		���}��url�A�@�p http://www.baidu.com/123.htm
 *  @param int $limit		����^���ƾڪ�����
 *  @param string $post		�n�o�e�� POST �ƾڡA�puid=1&password=1234
 *  @param string $cookie	�n������ COOKIE �ƾڡA�puid=123&auth=a2323sd2323
 *  @param bool $bysocket	TRUE/FALSE �O�_�q�LSOCKET���}
 *  @param string $ip		IP�a�}
 *  @param int $timeout		�s���W�ɮɶ�
 *  @param bool $block		�O�_������Ҧ�
 *  @return			���쪺�r�Ŧ�
 */
function uc_fopen2($url, $limit = 0, $post = '', $cookie = '', $bysocket = FALSE, $ip = '', $timeout = 15, $block = TRUE) {
	$__times__ = isset($_GET['__times__']) ? intval($_GET['__times__']) + 1 : 1;
	if($__times__ > 2) {
		return '';
	}
	$url .= (strpos($url, '?') === FALSE ? '?' : '&')."__times__=$__times__";
	return uc_fopen($url, $limit, $post, $cookie, $bysocket, $ip, $timeout, $block);
}

function uc_fopen($url, $limit = 0, $post = '', $cookie = '', $bysocket = FALSE, $ip = '', $timeout = 15, $block = TRUE) {
	$return = '';
	$matches = parse_url($url);
	!isset($matches['host']) && $matches['host'] = '';
	!isset($matches['path']) && $matches['path'] = '';
	!isset($matches['query']) && $matches['query'] = '';
	!isset($matches['port']) && $matches['port'] = '';
	$host = $matches['host'];
	$path = $matches['path'] ? $matches['path'].($matches['query'] ? '?'.$matches['query'] : '') : '/';
	$port = !empty($matches['port']) ? $matches['port'] : 80;
	if($post) {
		$out = "POST $path HTTP/1.0\r\n";
		$out .= "Accept: */*\r\n";
		//$out .= "Referer: $boardurl\r\n";
		$out .= "Accept-Language: zh-cn\r\n";
		$out .= "Content-Type: application/x-www-form-urlencoded\r\n";
		$out .= "User-Agent: $_SERVER[HTTP_USER_AGENT]\r\n";
		$out .= "Host: $host\r\n";
		$out .= 'Content-Length: '.strlen($post)."\r\n";
		$out .= "Connection: Close\r\n";
		$out .= "Cache-Control: no-cache\r\n";
		$out .= "Cookie: $cookie\r\n\r\n";
		$out .= $post;
	} else {
		$out = "GET $path HTTP/1.0\r\n";
		$out .= "Accept: */*\r\n";
		//$out .= "Referer: $boardurl\r\n";
		$out .= "Accept-Language: zh-cn\r\n";
		$out .= "User-Agent: $_SERVER[HTTP_USER_AGENT]\r\n";
		$out .= "Host: $host\r\n";
		$out .= "Connection: Close\r\n";
		$out .= "Cookie: $cookie\r\n\r\n";
	}

	if(function_exists('fsockopen')) {
		$fp = @fsockopen(($ip ? $ip : $host), $port, $errno, $errstr, $timeout);
	} elseif (function_exists('pfsockopen')) {
		$fp = @pfsockopen(($ip ? $ip : $host), $port, $errno, $errstr, $timeout);
	} else {
		$fp = false;
	}

	if(!$fp) {
		return '';
	} else {
		stream_set_blocking($fp, $block);
		stream_set_timeout($fp, $timeout);
		@fwrite($fp, $out);
		$status = stream_get_meta_data($fp);
		if(!$status['timed_out']) {
			while (!feof($fp)) {
				if(($header = @fgets($fp)) && ($header == "\r\n" ||  $header == "\n")) {
					break;
				}
			}

			$stop = false;
			while(!feof($fp) && !$stop) {
				$data = fread($fp, ($limit == 0 || $limit > 8192 ? 8192 : $limit));
				$return .= $data;
				if($limit) {
					$limit -= strlen($data);
					$stop = $limit <= 0;
				}
			}
		}
		@fclose($fp);
		return $return;
	}
}

function uc_app_ls() {
	$return = call_user_func(UC_API_FUNC, 'app', 'ls', array());
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * �K�[ feed
 *
 * @param string $icon			�ϼ�
 * @param string $uid			uid
 * @param string $username		�Τ�W
 * @param string $title_template	���D�ҪO
 * @param array  $title_data		���D���e
 * @param string $body_template		���e�ҪO
 * @param array  $body_data		���e���e
 * @param string $body_general		�O�d
 * @param string $target_ids		�O�d
 * @param array $images		�Ϥ�
 * 	�榡��:
 * 		array(
 * 			array('url'=>'http://domain1/1.jpg', 'link'=>'http://domain1'),
 * 			array('url'=>'http://domain2/2.jpg', 'link'=>'http://domain2'),
 * 			array('url'=>'http://domain3/3.jpg', 'link'=>'http://domain3'),
 * 		)
 * 	�ܨ�:
 * 		$feed['images'][] = array('url'=>$vthumb1, 'link'=>$vthumb1);
 * 		$feed['images'][] = array('url'=>$vthumb2, 'link'=>$vthumb2);
 * @return int feedid
 */
function uc_feed_add($icon, $uid, $username, $title_template='', $title_data='', $body_template='', $body_data='', $body_general='', $target_ids='', $images = array()) {
	return call_user_func(UC_API_FUNC, 'feed', 'add',
		array(  'icon'=>$icon,
			'appid'=>UC_APPID,
			'uid'=>$uid,
			'username'=>$username,
			'title_template'=>$title_template,
			'title_data'=>$title_data,
			'body_template'=>$body_template,
			'body_data'=>$body_data,
			'body_general'=>$body_general,
			'target_ids'=>$target_ids,
			'image_1'=>$images[0]['url'],
			'image_1_link'=>$images[0]['link'],
			'image_2'=>$images[1]['url'],
			'image_2_link'=>$images[1]['link'],
			'image_3'=>$images[2]['url'],
			'image_3_link'=>$images[2]['link'],
			'image_4'=>$images[3]['url'],
			'image_4_link'=>$images[3]['link']
		)
	);
}

/**
 * �C�����h�ֱ�
 *
 * @param int $limit
 * @return array()
 */
function uc_feed_get($limit = 100, $delete = TRUE) {
	$return = call_user_func(UC_API_FUNC, 'feed', 'get', array('limit'=>$limit, 'delete'=>$delete));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * �K�[�n��
 *
 * @param int $uid		�Τ�ID
 * @param int $friendid		�n��ID
 * @return
 * 	>0 ���\
 * 	<=0 ����
 */
function uc_friend_add($uid, $friendid, $comment='') {
	return call_user_func(UC_API_FUNC, 'friend', 'add', array('uid'=>$uid, 'friendid'=>$friendid, 'comment'=>$comment));
}

/**
 * �R���n��
 *
 * @param int $uid		�Τ�ID
 * @param array $friendids	�n��ID
 * @return
 * 	>0 ���\
 * 	<=0 ����,�Ϊ̦n�ͤw�g�R��
 */
function uc_friend_delete($uid, $friendids) {
	return call_user_func(UC_API_FUNC, 'friend', 'delete', array('uid'=>$uid, 'friendids'=>$friendids));
}

/**
 * �n���`��
 * @param int $uid		�Τ�ID
 * @return int
 */
function uc_friend_totalnum($uid, $direction = 0) {
	return call_user_func(UC_API_FUNC, 'friend', 'totalnum', array('uid'=>$uid, 'direction'=>$direction));
}

/**
 * �n�ͦC��
 *
 * @param int $uid		�Τ�ID
 * @param int $page		��e��
 * @param int $pagesize		�C�����ؼ�
 * @param int $totalnum		�`��
 * @param int $direction	�w�]�����V. ���V:1 , �ϦV:2 , ���V:3
 * @return array
 */
function uc_friend_ls($uid, $page = 1, $pagesize = 10, $totalnum = 10, $direction = 0) {
	$return = call_user_func(UC_API_FUNC, 'friend', 'ls', array('uid'=>$uid, 'page'=>$page, 'pagesize'=>$pagesize, 'totalnum'=>$totalnum, 'direction'=>$direction));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * �Τ���U
 *
 * @param string $username 	�Τ�W
 * @param string $password 	�K�X
 * @param string $email		Email
 * @param int $questionid	�w������
 * @param string $answer 	�w�����ݵ���
 * @return int
	-1 : �Τ�W���X�k
	-2 : �]�t�����\���U�����y
	-3 : �Τ�W�w�g�s�b
	-4 : email �榡���~
	-5 : email �����\���U
	-6 : �� email �w�g�Q���U
	>1 : ��ܦ��\�A�ƭȬ� UID
*/
function uc_user_register($username, $password, $email, $questionid = '', $answer = '', $regip = '') {
	return call_user_func(UC_API_FUNC, 'user', 'register', array('username'=>$username, 'password'=>$password, 'email'=>$email, 'questionid'=>$questionid, 'answer'=>$answer, 'regip' => $regip));
}

/**
 * �Τ�n���ˬd
 *
 * @param string $username	�Τ�W/uid
 * @param string $password	�K�X
 * @param int $isuid		�O�_��uid
 * @param int $checkques	�O�_�ϥ��ˬd�w���ݵ�
 * @param int $questionid	�w������
 * @param string $answer 	�w�����ݵ���
 * @return array (uid/status, username, password, email)
 	�ƲղĤ@��
 	1  : ���\
	-1 : �Τᤣ�s�b,�Ϊ̳Q�R��
	-2 : �K�X��
*/
function uc_user_login($username, $password, $isuid = 0, $checkques = 0, $questionid = '', $answer = '') {
	$isuid = intval($isuid);
	$return = call_user_func(UC_API_FUNC, 'user', 'login', array('username'=>$username, 'password'=>$password, 'isuid'=>$isuid, 'checkques'=>$checkques, 'questionid'=>$questionid, 'answer'=>$answer));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * �i�J�P�B�n�J�N�X
 *
 * @param int $uid		�Τ�ID
 * @return string 		HTML�N�X
 */
function uc_user_synlogin($uid) {
	$uid = intval($uid);
	if(@include UC_ROOT.'./data/cache/apps.php') {
		if(count($_CACHE['apps']) > 1) {
			$return = uc_api_post('user', 'synlogin', array('uid'=>$uid));
		} else {
			$return = '';
		}
	}
	return $return;
}

/**
 * �i�J�P�B�n�X�N�X
 *
 * @return string 		HTML�N�X
 */
function uc_user_synlogout() {
	if(@include UC_ROOT.'./data/cache/apps.php') {
		if(count($_CACHE['apps']) > 1) {
			$return = uc_api_post('user', 'synlogout', array());
		} else {
			$return = '';
		}
	}
	return $return;
}

/**
 * �s��Τ�
 *
 * @param string $username	�Τ�W
 * @param string $oldpw		�±K�X
 * @param string $newpw		�s�K�X
 * @param string $email		Email
 * @param int $ignoreoldpw 	�O�_�����±K�X, �����±K�X, �h���i���±K�X����.
 * @param int $questionid	�w������
 * @param string $answer 	�w�����ݵ���
 * @return int
 	1  : �ק令�\
 	0  : �S������ק�
  	-1 : �±K�X�����T
	-4 : email �榡���~
	-5 : email �����\���U
	-6 : �� email �w�g�Q���U
	-7 : �S��������ק�
	-8 : ���O�@���Τ�A�S���v���ק�
*/
function uc_user_edit($username, $oldpw, $newpw, $email, $ignoreoldpw = 0, $questionid = '', $answer = '') {
	return call_user_func(UC_API_FUNC, 'user', 'edit', array('username'=>$username, 'oldpw'=>$oldpw, 'newpw'=>$newpw, 'email'=>$email, 'ignoreoldpw'=>$ignoreoldpw, 'questionid'=>$questionid, 'answer'=>$answer));
}

/**
 * �R���Τ�
 *
 * @param string/array $uid	�Τ᪺ UID
 * @return int
 	>0 : ���\
 	0 : ����
 */
function uc_user_delete($uid) {
	return call_user_func(UC_API_FUNC, 'user', 'delete', array('uid'=>$uid));
}

/**
 * �R���Τ��Y��
 *
 * @param string/array $uid	�Τ᪺ UID
 */
function uc_user_deleteavatar($uid) {
	uc_api_post('user', 'deleteavatar', array('uid'=>$uid));
}

/**
 * �ˬd�Τ�W�O�_���X�k
 *
 * @param string $username	�Τ�W
 * @return int
 	 1 : �X�k
	-1 : �Τ�W���X�k
	-2 : �]�t�n���\���U�����y
	-3 : �Τ�W�w�g�s�b
 */
function uc_user_checkname($username) {
	return call_user_func(UC_API_FUNC, 'user', 'check_username', array('username'=>$username));
}

/**
 * �ˬdEmail�a�}�O�_���T
 *
 * @param string $email		Email
 * @return
 *  	1  : ���\
 * 	-4 : email �榡���~
 * 	-5 : email �����\���U
 * 	-6 : �� email �w�g�Q���U
 */
function uc_user_checkemail($email) {
	return call_user_func(UC_API_FUNC, 'user', 'check_email', array('email'=>$email));
}

/**
 * �K�[�O�@�Τ�
 *
 * @param string/array $username �O�@�Τ�W
 * @param string $admin    �ާ@���޲z��
 * @return
 * 	-1 : ����
 * 	 1 : ���\
 */
function uc_user_addprotected($username, $admin='') {
	return call_user_func(UC_API_FUNC, 'user', 'addprotected', array('username'=>$username, 'admin'=>$admin));
}

/**
 * �R���O�@�Τ�
 *
 * @param string/array $username �O�@�Τ�W
 * @return
 * 	-1 : ����
 * 	 1 : ���\
 */
function uc_user_deleteprotected($username) {
	return call_user_func(UC_API_FUNC, 'user', 'deleteprotected', array('username'=>$username));
}

/**
 * �o����O�@���Τ�W�C��
 *
 * @param empty
 * @return
 * 	����O�@���Τ�W�C��
 *  	array()
 */
function uc_user_getprotected() {
	$return = call_user_func(UC_API_FUNC, 'user', 'getprotected', array('1'=>1));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * ���o�Τ�ƾ�
 *
 * @param string $username	�Τ�W
 * @param int $isuid	�O�_��UID
 * @return array (uid, username, email)
 */
function uc_get_user($username, $isuid=0) {
	$return = call_user_func(UC_API_FUNC, 'user', 'get_user', array('username'=>$username, 'isuid'=>$isuid));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * �Τ�X�ֳ̫᪺�B�z
 *
 * @param string $oldusername	�ѥΤ�W
 * @param string $newusername	�s�Τ�W
 * @param string $uid		��UID
 * @param string $password	�K�X
 * @param string $email		Email
 * @return int
	-1 : �Τ�W���X�k
	-2 : �]�t�����\���U�����y
	-3 : �Τ�W�w�g�s�b
	>1 : ��ܦ��\�A�ƭȬ� UID
 */
function uc_user_merge($oldusername, $newusername, $uid, $password, $email) {
	return call_user_func(UC_API_FUNC, 'user', 'merge', array('oldusername'=>$oldusername, 'newusername'=>$newusername, 'uid'=>$uid, 'password'=>$password, 'email'=>$email));
}

/**
 * ���h�X�֥Τ�O��
 * @param string $username	�Τ�W
 */
function uc_user_merge_remove($username) {
	return call_user_func(UC_API_FUNC, 'user', 'merge_remove', array('username'=>$username));
}

/**
 * ������w���Ϊ����w�Τ�n����
 * @param int $appid	����Id
 * @param int $uid	�Τ�Id
 * @param int $credit	�n���s��
 */
function uc_user_getcredit($appid, $uid, $credit) {
	return uc_api_post('user', 'getcredit', array('appid'=>$appid, 'uid'=>$uid, 'credit'=>$credit));
}

/**
 * �i�J�u�T���ɭ�
 *
 * @param int $uid	�Τ�ID
 * @param int $newpm	�O�_�����i�Jnewpm
 */
function uc_pm_location($uid, $newpm = 0) {
	$apiurl = uc_api_url('pm_client', 'ls', "uid=$uid", ($newpm ? '&folder=newbox' : ''));
	@header("Expires: 0");
	@header("Cache-Control: private, post-check=0, pre-check=0, max-age=0", FALSE);
	@header("Pragma: no-cache");
	@header("location: $apiurl");
}

/**
 * �ˬd�s�u�T��
 *
 * @param  int $uid	�Τ�ID
 * @param  int $more	�ԲӫH��
 * @return int	 	�O�_�s�b�s�u�T��
 * 	2	�Բ�	(�u�T���ơB���@�T���ơB�̫�T���ɶ�, �̫�T�����e)
 * 	1	²��	(�u�T���ơB���@�T���ơB�̫�T���ɶ�)
 * 	0	�_
 */
function uc_pm_checknew($uid, $more = 0) {
	$return = call_user_func(UC_API_FUNC, 'pm', 'check_newpm', array('uid'=>$uid, 'more'=>$more));
	return (!$more || UC_CONNECT == 'mysql') ? $return : uc_unserialize($return);
}

/**
 * �o�e�u�T��
 *
 * @param int $fromuid		�o��Huid 0 ���t�ΰT��
 * @param mix $msgto		����H uid/username �h�ӳr������
 * @param mix $subject		���D
 * @param mix $message		���e
 * @param int $instantly	�ߧY�o�e 1 �ߧY�o�e(�w�])  0 �i�J�u�T���o�e�ɭ�
 * @param int $replypid		�^�Ъ��T��Id
 * @param int $isusername	0 = $msgto �� uid�B1 = $msgto �� username
 * @return
 * 	>1	�o�e���\���H��
 * 	0	����H���s�b
 */
function uc_pm_send($fromuid, $msgto, $subject, $message, $instantly = 1, $replypmid = 0, $isusername = 0) {
	if($instantly) {
		$replypmid = @is_numeric($replypmid) ? $replypmid : 0;
		return call_user_func(UC_API_FUNC, 'pm', 'sendpm', array('fromuid'=>$fromuid, 'msgto'=>$msgto, 'subject'=>$subject, 'message'=>$message, 'replypmid'=>$replypmid, 'isusername'=>$isusername, 'type' => $type));
	} else {
		$fromuid = intval($fromuid);
		$subject = rawurlencode($subject);
		$msgto = rawurlencode($msgto);
		$message = rawurlencode($message);
		$replypmid = @is_numeric($replypmid) ? $replypmid : 0;
		$replyadd = $replypmid ? "&pmid=$replypmid&do=reply" : '';
		$apiurl = uc_api_url('pm_client', 'send', "uid=$fromuid", "&msgto=$msgto&subject=$subject&message=$message$replyadd");
		@header("Expires: 0");
		@header("Cache-Control: private, post-check=0, pre-check=0, max-age=0", FALSE);
		@header("Pragma: no-cache");
		@header("location: ".$apiurl);
	}
}

/**
 * �R���u�T��
 *
 * @param int $uid		�Τ�Id
 * @param string $folder	���}���ؿ� inbox=����c�Aoutbox=�o��c
 * @param array	$pmids		�n�R�����T��ID�Ʋ�
 * @return
 * 	>0 ���\
 * 	<=0 ����
 */
function uc_pm_delete($uid, $folder, $pmids) {
	return call_user_func(UC_API_FUNC, 'pm', 'delete', array('uid'=>$uid, 'pmids'=>$pmids));
}

/**
 * ���ӥΤ�R���u�T��
 *
 * @param int $uid		�Τ�Id
 * @param array	$uids		�n�R�����T���Τ�ID�Ʋ�
 * @return
 * 	>0 ���\
 * 	<=0 ����
 */
function uc_pm_deleteuser($uid, $touids) {
	return call_user_func(UC_API_FUNC, 'pm', 'deleteuser', array('uid'=>$uid, 'touids'=>$touids));
}

function uc_pm_deletechat($uid, $plids, $type = 0) {
	return call_user_func(UC_API_FUNC, 'pm', 'deletechat', array('uid'=>$uid, 'plids'=>$plids, 'type'=>$type));
}

/**
 * �аO�wŪ/��Ū���A
 *
 * @param int $uid		�Τ�Id
 * @param array	$uids		�n�аO�wŪ���A���Τ�ID�Ʋ�
 * @param array	$pmids		�n�аO�wŪ���A���T��ID�Ʋ�
 * @param int $status		1 �wŪ 0 ��Ū
 */
function uc_pm_readstatus($uid, $uids, $plids = array(), $status = 0) {
	return call_user_func(UC_API_FUNC, 'pm', 'readstatus', array('uid'=>$uid, 'uids'=>$uids, 'plids'=>$plids, 'status'=>$status));
}

/**
 * ����u�T���C��
 *
 * @param int $uid		�Τ�Id
 * @param int $page 		��e��
 * @param int $pagesize 	�C���̤j���ؼ�
 * @param string $folder	���}���ؿ� newbox=��Ū�T���Ainbox=����c�Aoutbox=�o��c
 * @param string $filter	�L�o�覡 newpm=��Ū�T���Asystempm=�t�ΰT���Aannouncepm=���@�T��
 				$folder		$filter
 				--------------------------
 				newbox
 				inbox		newpm
 						systempm
 						announcepm
 				outbox		newpm
 				searchbox	*
 * @param string $msglen 	�I�����T����r����
 * @return array('count' => �T���`��, 'data' => �u�T���ƾ�)
 */
function uc_pm_list($uid, $page = 1, $pagesize = 10, $folder = 'inbox', $filter = 'newpm', $msglen = 0) {
	$uid = intval($uid);
	$page = intval($page);
	$pagesize = intval($pagesize);
	$return = call_user_func(UC_API_FUNC, 'pm', 'ls', array('uid'=>$uid, 'page'=>$page, 'pagesize'=>$pagesize, 'filter'=>$filter, 'msglen'=>$msglen));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * ������Ū�T������
 *
 * @param int $uid		�Τ�Id
 */
function uc_pm_ignore($uid) {
	$uid = intval($uid);
	return call_user_func(UC_API_FUNC, 'pm', 'ignore', array('uid'=>$uid));
}

/**
 * ����u�T�����e
 *
 * @param int $uid		�Τ�Id
 * @param int $pmid		�T��Id
 * @param int $touid		�T�����Τ�Id
 * @param int $daterange	����d�� 1=����,2=�Q��,3=�e��,4=�W�P,5=��
 * @return array() �u�T�����e�Ʋ�
 */
function uc_pm_view($uid, $pmid = 0, $touid = 0, $daterange = 1, $page = 0, $pagesize = 10, $type = 0, $isplid = 0) {
	$uid = intval($uid);
	$touid = intval($touid);
	$page = intval($page);
	$pagesize = intval($pagesize);
	$pmid = @is_numeric($pmid) ? $pmid : 0;
	$return = call_user_func(UC_API_FUNC, 'pm', 'view', array('uid'=>$uid, 'pmid'=>$pmid, 'touid'=>$touid, 'daterange'=>$daterange, 'page' => $page, 'pagesize' => $pagesize, 'type'=>$type, 'isplid'=>$isplid));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

function uc_pm_view_num($uid, $touid, $isplid) {
	$uid = intval($uid);
	$touid = intval($touid);
	$isplid = intval($isplid);
	return call_user_func(UC_API_FUNC, 'pm', 'viewnum', array('uid' => $uid, 'touid' => $touid, 'isplid' => $isplid));
}

/**
 * �������u�T�����e
 *
 * @param int $uid		�Τ�Id
 * @param int $pmid		�T��Id
 * @param int $type		0 = ������w����T��
 				1 = ������w�Τ�o���̫����T��
 				2 = ������w�Τ᦬���̫����T��
 * @return array() �u�T�����e�Ʋ�
 */
function uc_pm_viewnode($uid, $type, $pmid) {
	$uid = intval($uid);
	$type = intval($type);
	$pmid = @is_numeric($pmid) ? $pmid : 0;
	$return = call_user_func(UC_API_FUNC, 'pm', 'viewnode', array('uid'=>$uid, 'type'=>$type, 'pmid'=>$pmid));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

function uc_pm_chatpmmemberlist($uid, $plid = 0) {
	$uid = intval($uid);
	$plid = intval($plid);
	$return = call_user_func(UC_API_FUNC, 'pm', 'chatpmmemberlist', array('uid'=>$uid, 'plid'=>$plid));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

function uc_pm_kickchatpm($plid, $uid, $touid) {
	$uid = intval($uid);
	$plid = intval($plid);
	$touid = intval($touid);
	return call_user_func(UC_API_FUNC, 'pm', 'kickchatpm', array('uid'=>$uid, 'plid'=>$plid, 'touid'=>$touid));
}

function uc_pm_appendchatpm($plid, $uid, $touid) {
	$uid = intval($uid);
	$plid = intval($plid);
	$touid = intval($touid);
	return call_user_func(UC_API_FUNC, 'pm', 'appendchatpm', array('uid'=>$uid, 'plid'=>$plid, 'touid'=>$touid));
}

/**
 * ����¦W��
 *
 * @param int $uid		�Τ�Id
 * @return string �¦W�椺�e
 */
function uc_pm_blackls_get($uid) {
	$uid = intval($uid);
	return call_user_func(UC_API_FUNC, 'pm', 'blackls_get', array('uid'=>$uid));
}

/**
 * �]�m�¦W��
 *
 * @param int $uid		�Τ�Id
 * @param int $blackls		�¦W�椺�e
 */
function uc_pm_blackls_set($uid, $blackls) {
	$uid = intval($uid);
	return call_user_func(UC_API_FUNC, 'pm', 'blackls_set', array('uid'=>$uid, 'blackls'=>$blackls));
}

/**
 * �K�[�¦W�涵��
 *
 * @param int $uid		�Τ�Id
 * @param int $username		�Τ�W
 */
function uc_pm_blackls_add($uid, $username) {
	$uid = intval($uid);
	return call_user_func(UC_API_FUNC, 'pm', 'blackls_add', array('uid'=>$uid, 'username'=>$username));
}

/**
 * �R���¦W�涵��
 *
 * @param int $uid		�Τ�Id
 * @param int $username		�Τ�W
 */
function uc_pm_blackls_delete($uid, $username) {
	$uid = intval($uid);
	return call_user_func(UC_API_FUNC, 'pm', 'blackls_delete', array('uid'=>$uid, 'username'=>$username));
}

/**
 * �����W�ѪR��
 *
 * @return array()
 */
function uc_domain_ls() {
	$return = call_user_func(UC_API_FUNC, 'domain', 'ls', array('1'=>1));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * �n���I���ШD
 *
 * @param int $uid		�Τ�ID
 * @param int $from		��n��
 * @param int $to		�ؼпn��
 * @param int $toappid		�ؼ�����ID
 * @param int $amount		�n�����B
 * @return
 *  	1  : ���\
 *	0  : ����
 */
function uc_credit_exchange_request($uid, $from, $to, $toappid, $amount) {
	$uid = intval($uid);
	$from = intval($from);
	$toappid = intval($toappid);
	$to = intval($to);
	$amount = intval($amount);
	return uc_api_post('credit', 'request', array('uid'=>$uid, 'from'=>$from, 'to'=>$to, 'toappid'=>$toappid, 'amount'=>$amount));
}

/**
 * ��^���w������TAG�ƾ�
 *
 * @param string $tagname	TAG�W��
 * @param int $totalnum		��^�ƾڪ����ؼ�
 * @return array() �ǦC�ƹL���ƲաA�Ʋդ��e����e�Ψ�L���Ϊ�����TAG�ƾ�
 */
function uc_tag_get($tagname, $nums = 0) {
	$return = call_user_func(UC_API_FUNC, 'tag', 'gettag', array('tagname'=>$tagname, 'nums'=>$nums));
	return UC_CONNECT == 'mysql' ? $return : uc_unserialize($return);
}

/**
 * �ק��Y��
 *
 * @param	int		$uid	�Τ�ID
 * @param	string	$type	�Y������ real OR virtual �w�]�� virtual
 * @return	string
 */
function uc_avatar($uid, $type = 'virtual', $returnhtml = 1) {
	$uid = intval($uid);
	$uc_input = uc_api_input("uid=$uid");
	$uc_avatarflash = UC_API.'/images/camera.swf?inajax=1&appid='.UC_APPID.'&input='.$uc_input.'&agent='.md5($_SERVER['HTTP_USER_AGENT']).'&ucapi='.urlencode(str_replace('http://', '', UC_API)).'&avatartype='.$type.'&uploadSize=2048';
	if($returnhtml) {
		return '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="450" height="253" id="mycamera" align="middle">
			<param name="allowScriptAccess" value="always" />
			<param name="scale" value="exactfit" />
			<param name="wmode" value="transparent" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />
			<param name="movie" value="'.$uc_avatarflash.'" />
			<param name="menu" value="false" />
			<embed src="'.$uc_avatarflash.'" quality="high" bgcolor="#ffffff" width="450" height="253" name="mycamera" align="middle" allowScriptAccess="always" allowFullScreen="false" scale="exactfit"  wmode="transparent" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
		</object>';
	} else {
		return array(
			'width', '450',
			'height', '253',
			'scale', 'exactfit',
			'src', $uc_avatarflash,
			'id', 'mycamera',
			'name', 'mycamera',
			'quality','high',
			'bgcolor','#ffffff',
			'menu', 'false',
			'swLiveConnect', 'true',
			'allowScriptAccess', 'always'
		);
	}
}

/**
 * �l�󶤦C
 *
 * @param	string	$uids		�Τ�Wid�A�h�ӥγr��(,)�j�}
 * @param	string	$emails		�l��a�}�A�h�ӥγr���j�}
 * @param	string	$subject	�l����D
 * @param	string	$message	�l�󤺮e
 * @param	string	$charset	�l��r�Ŷ��A�i��ѼơA�w�]��gbk
 * @param	boolean	$htmlon		�O�_��html�榡�o�e�l��A�i��ѼơA�w�]���_
 * @param	integer $level		�l��ŧO�A�i��ѼơA����0-127�A�w�]��1�A�V�j�o�e���u���ŶV���A��0�ɤ��J�w�A�����o�e�A�|�v�T��e�i�{�t�סA�V��
 * @return	integer
 *		=0 : ����
 *		>0 : ���\�A��^���J�O����id�A�p�G�O�h���h��^�̫�@���O����id�A�Ylevel����0�A�h��^1
 */
function uc_mail_queue($uids, $emails, $subject, $message, $frommail = '', $charset = 'gbk', $htmlon = FALSE, $level = 1) {
	return call_user_func(UC_API_FUNC, 'mail', 'add', array('uids' => $uids, 'emails' => $emails, 'subject' => $subject, 'message' => $message, 'frommail' => $frommail, 'charset' => $charset, 'htmlon' => $htmlon, 'level' => $level));
}

/**
 * �˴��O�_�s�b���w�Y��
 * @param	integer		$uid	�Τ�id
 * @param	string		$size	�Y���ؤo�A���Ƚd��(big,middle,small)�A�w�]�� middle
 * @param	string		$type	�Y�������A���Ƚd��(virtual,real)�A�w�]��virtual
 * @return	boolean
 *		true : �Y���s�b
 *		false: �Y�����s�b
 */
function uc_check_avatar($uid, $size = 'middle', $type = 'virtual') {
	$url = UC_API."/avatar.php?uid=$uid&size=$size&type=$type&check_file_exists=1";
	$res = uc_fopen2($url, 500000, '', '', TRUE, UC_IP, 20);
	if($res == 1) {
		return 1;
	} else {
		return 0;
	}
}

/**
 * �˴�uc_server���ƾڮw�����M�{�Ǫ���
 * @return mixd
 *		array('db' => 'xxx', 'file' => 'xxx');
 *		null �L�k�եΨ챵�f
 *		string ��󪩥��C��1.5
 */
function uc_check_version() {
	$return = uc_api_post('version', 'check', array());
	$data = uc_unserialize($return);
	return is_array($data) ? $data : $return;
}

// bluelovers
function uc_api_call($module, $action, $arg = array()) {
	$return = call_user_func(UC_API_FUNC, $module, $action, $arg);

	if (UC_CONNECT != 'mysql' && strpos($return, '<?xml') !== FALSE) {
		$return2 = null;
		$return2 = @uc_unserialize($return);
		$return = $return2 === null ? $return : $return2;
	}

	return $return;
}
// bluelovers

?>