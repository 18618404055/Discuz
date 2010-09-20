<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: category.php 7024 2010-03-28 06:39:41Z cnteacher $
 */

// ����Ӧ�� ID
define('APPTYPEID', 99);
define('CURSCRIPT', 'category');

//====================================
// �����ļ����룬 �������������ļ����ܲ���Ҫ
// class_forum.php �� function_forum.php
// �����ʵ����Ҫȷ���Ƿ�����
//====================================

require './source/class/class_core.php';

$discuz = & discuz_core::instance();

//====================================
// ���غ��Ĵ���,����������ļ�������ͬ
//====================================
$discuz->init();

//=======================
//���� mod
//===================================
$modarray = array('index', 'list', 'view', 'post', 'misc', 'my', 'threadmod', 'usergroup');
// �ж� $mod �ĺϷ���
$mod = !in_array($_G['mod'], $modarray) ? 'index' : $_G['mod'];

require DISCUZ_ROOT.'./source/module/category/category_'.$mod.'.php';

?>