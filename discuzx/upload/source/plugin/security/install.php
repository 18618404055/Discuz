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
  `pid` int(10) unsigned NOT NULL COMMENT '����ID',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '��������',
  `evilcount` int(10) NOT NULL DEFAULT '0' COMMENT '�������',
  `eviltype` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `operateresult` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '���������1 ͨ�� 2 ɾ�� 3 ����',
  `isreported` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��Ѿ��ϱ�',
  PRIMARY KEY (`pid`),
  KEY `type` (`tid`,`type`),
  KEY `operateresult` (`operateresult`,`createtime`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `pre_security_eviluser` (
  `uid` int(10) unsigned NOT NULL COMMENT '�û�ID',
  `evilcount` int(10) NOT NULL DEFAULT '0' COMMENT '�������',
  `eviltype` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  `operateresult` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '���������1 �ָ� 2 ɾ�� 3 ����',
  `isreported` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��Ѿ��ϱ�',
  PRIMARY KEY (`uid`),
  KEY `operateresult` (`operateresult`,`createtime`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `pre_security_failedlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `reporttype` char(20) NOT NULL COMMENT '�ϱ�����',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'TID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'PID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UID',
  `failcount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ʧ��ʱ��',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��/�ϴη���ʱ��',
  `delreason` char(255) NOT NULL COMMENT '����ԭ��',
  `scheduletime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ƻ�����ʱ��',
  `lastfailtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�ϴ�ʧ��ʱ��',
  `extra1` int(10) unsigned NOT NULL COMMENT '���͵���չ�ֶ�',
  `extra2` char(255) NOT NULL DEFAULT '0' COMMENT '�ַ����͵���չ�ֶ�',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM

EOF;

runquery($sql);

$finish = true;

?>