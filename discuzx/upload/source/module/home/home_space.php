<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: home_space.php 22839 2011-05-25 08:05:18Z monkey $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

$uid = empty($_GET['uid']) ? 0 : intval($_GET['uid']);

if($_GET['username']) {
	$member = DB::fetch_first("SELECT uid FROM ".DB::table('common_member')." WHERE username='$_GET[username]' LIMIT 1");
	if(empty($member)) {
		showmessage('space_does_not_exist');
	}
	$uid = $member['uid'];
}

$dos = array('index', 'doing', 'blog', 'album', 'friend', 'wall',
	'notice', 'share', 'home', 'pm', 'videophoto', 'favorite',
	'thread', 'trade', 'poll', 'activity', 'debate', 'reward', 'profile', 'plugin');

$do = (!empty($_GET['do']) && in_array($_GET['do'], $dos))?$_GET['do']:'index';

// bluelovers
/**
 * [bugfix] 修正 x2 只能 hook 命名只能用 space_ 才能掛載在 home_space 內的 BUG
 *
 * 借用以下說明
 * 吐槽：该死的discuz不知道怎么修改了嵌入点的命名规则，导致出现了这么诡异的函数名。。。p.s.仅适用于X2，此函数命名不得修改
 */
$_GET['do'] = $_G['gp_do'] = $do;
// bluelovers

if(in_array($do, array('home', 'doing', 'blog', 'album', 'share', 'wall'))) {
	if(!$_G['setting']['homestatus']) {
		showmessage('home_status_off');
	}
} else {
	$_G['mnid'] = 'mn_common';
}

if(empty($uid) || in_array($do, array('notice', 'pm'))) $uid = $_G['uid'];

if($uid) {
	$space = getspace($uid);
	if(empty($space)) {
		showmessage('space_does_not_exist');
	}
}

if(empty($space)) {
	if(in_array($do, array('doing', 'blog', 'album', 'share', 'home', 'thread', 'trade', 'poll', 'activity', 'debate', 'reward', 'group'))) {
		$_GET['view'] = 'all';
		$space['uid'] = 0;
	} else {
		showmessage('login_before_enter_home', null, array(), array('showmsg' => true, 'login' => 1));
	}
} else {

	$navtitle = $space['username'];

	if($space['status'] == -1 && $_G['adminid'] != 1) {
		showmessage('space_has_been_locked');
	}

	if(in_array($space['groupid'], array(4, 5, 6)) && ($_G['adminid'] != 1 && $space['uid'] != $_G['uid'])) {
		$_GET['do'] = $do = 'profile';
	}

	if($do != 'profile' && $do != 'index' && !ckprivacy($do, 'view')) {
		$_G['privacy'] = 1;
		require_once libfile('space/profile', 'include');
		include template('home/space_privacy');
		exit();
	}

	if(!$space['self'] && $_GET['view'] != 'eccredit') $_GET['view'] = 'me';

	get_my_userapp();

	get_my_app();
}

$diymode = 0;

$seccodecheck = $_G['setting']['seccodestatus'] & 4;
$secqaacheck = $_G['setting']['secqaa']['status'] & 2;

require_once libfile('space/'.$do, 'include');

?>