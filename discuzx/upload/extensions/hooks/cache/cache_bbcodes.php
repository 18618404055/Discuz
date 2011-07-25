<?php

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

if (!discuz_core::$plugin_support['Scorpio_Event']) return false;

Scorpio_Hook::add('Func_build_cache_bbcodes:Before_init_regexp', '_eFunc_build_cache_bbcodes_Before_init_regexp');

function _eFunc_build_cache_bbcodes_Before_init_regexp(&$conf) {
	// 供 discuz_core::$_cache_data['bbcodes']['regexp_ex'] 替換參數用的原始字串
	discuz_core::$_cache_data['bbcodes']['regexp_base'] = array(
		1 => "/\[{bbtag}\]{1}\[\/{bbtag}\]/is",
		2 => "/\[{bbtag}=(['\"]?){1}(['\"]?)\]{2}\[\/{bbtag}\]/is",
		3 => "/\[{bbtag}=(['\"]?){1}(['\"]?),(['\"]?){2}(['\"]?)\]{3}\[\/{bbtag}\]/is",
	);

	discuz_core::$_cache_data['bbcodes']['regexp_ex'] = array(
		'([^\"\[]+?)'	// dz 預設
		,'(\w+)'		// 英文+數字
		,'(\d+)'		// 數字
		, '([a-zA-Z]+)'	// 英文
		, '(.+?)'		// 任何字
		, '(.+)'		// 任何字(非空)
	);
}

Scorpio_Hook::add('Func_build_cache_bbcodes:Before_define1', '_eFunc_build_cache_bbcodes_Before_define1');

function _eFunc_build_cache_bbcodes_Before_define1(&$conf) {
	extract($conf, EXTR_REFS);

	$search = str_replace('{bbtag}', $bbcode['tag'], $regexp[$bbcode['params']]);
	// 追加清除 \t
	$bbcode['replacement'] = preg_replace("/([\t\r\n])/", '', $bbcode['replacement']);

	// 替換 {bbtag} 為 bbcode 名稱
	$bbcode['replacement'] = str_replace('{bbtag}', $bbcode['tag'], $bbcode['replacement']);

	$switchstop = 1;
}

Scorpio_Hook::add('Func_build_cache_bbcodes:Before_define3', '_eFunc_build_cache_bbcodes_Before_define3');

function _eFunc_build_cache_bbcodes_Before_define3(&$conf) {
	extract($conf, EXTR_REFS);

	$bbcode['replacement'] = str_replace('{bbtag}', $bbcode['tag'], $bbcode['replacement']);
}

?>