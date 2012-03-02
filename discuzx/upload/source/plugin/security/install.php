<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: install.php 26608 2011-12-16 06:47:48Z monkey $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

$sql = <<<EOF

CREATE TABLE IF NOT EXISTS `pre_security_evilpost` (
  `pid` int(10) unsigned NOT NULL COMMENT '���lID',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�D�DID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '���l����',
  `evilcount` int(10) NOT NULL DEFAULT '0' COMMENT '�c�N����',
  `eviltype` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�c�N����',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�Ыخɶ�',
  `operateresult` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�ާ@���G�G1 �q�L 2 �R�� 3 ����',
  `isreported` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�O�_�w�g�W��',
  PRIMARY KEY (`pid`),
  KEY `type` (`tid`,`type`),
  KEY `operateresult` (`operateresult`,`createtime`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `pre_security_eviluser` (
  `uid` int(10) unsigned NOT NULL COMMENT '�Τ�ID',
  `evilcount` int(10) NOT NULL DEFAULT '0' COMMENT '�c�N����',
  `eviltype` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�c�N����',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�Ыخɶ�',
  `operateresult` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�ާ@���G�G1 ��_ 2 �R�� 3 ����',
  `isreported` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�O�_�w�g�W��',
  PRIMARY KEY (`uid`),
  KEY `operateresult` (`operateresult`,`createtime`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `pre_security_failedlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�D��',
  `reporttype` char(20) NOT NULL COMMENT '�W������',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'PID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `failcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�p��',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���Ѯɶ�',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�o���ɶ�/�W���o���ɶ�',
  `delreason` char(255) NOT NULL COMMENT '�B�z��]',
  `scheduletime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�p�����ծɶ�',
  `lastfailtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�W�����Ѯɶ�',
  `extra1` int(10) unsigned NOT NULL COMMENT '�㫬���X�i�r�q',
  `extra2` char(255) NOT NULL DEFAULT '0' COMMENT '�r���������X�i�r�q',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM

EOF;

runquery($sql);

$finish = true;

?>