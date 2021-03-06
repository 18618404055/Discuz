<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: task_avatar.php 16433 2010-09-07 00:04:33Z monkey $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

class task_avatar {

	var $version = '1.0';
	var $name = 'avatar_name';
	var $description = 'avatar_desc';
	/*
	var $copyright = '<a href="http://www.comsenz.com" target="_blank">Comsenz Inc.</a>';
	*/
	// bluelovers
	var $copyright = '<a href="http://bluelovers.net" target="_blank">Bluelovers Net.</a>';
	// bluelovers
	var $icon = '';
	var $period = '';
	var $periodtype = 0;
	var $conditions = array();

	function csc($task = array()) {
		global $_G;

		// bluelovers
		if ($_G['member']['uid'] && empty($_G['member']['avatarstatus'])) {

			loaducenter();

			if (uc_check_avatar($_G['member']['uid'])) {

				DB::update('common_member', array('avatarstatus' => '1'), array('uid' => $_G['member']['uid']));

				/*
				updatecreditbyaction('setavatar');

				manyoulog('user', $_G['uid'], 'update');
				*/

				$_G['member']['avatarstatus'] = 1;

			}

		}
		// bluelovers

		if(!empty($_G['member']['avatarstatus'])) {
			return true;
		} else {
			return array('csc' => 0, 'remaintime' => 0);
		}
	}

	function view() {
		return lang('task/avatar', 'avatar_view');
	}

}

?>