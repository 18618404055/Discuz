--
-- ����: localhost
-- ��������: 2009 �� 11 �� 10 �� 06:49
--
-- ��Ľṹ 'pre_common_admingroup'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_admincp_cmenu;
CREATE TABLE pre_common_admincp_cmenu (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL COMMENT '�˵�����',
  `url` VARCHAR(255) NOT NULL COMMENT '�˵���ַ',
  `sort` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '�˵�����,����',
  `displayorder` TINYINT(3) NOT NULL COMMENT '��ʾ˳��',
  `clicks` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '1' COMMENT '�����,����',
  `uid` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT '����û�',
  `dateline` INT(10) UNSIGNED NOT NULL COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MYISAM COMMENT='��̨�˵��ղر�';


DROP TABLE IF EXISTS pre_common_admingroup;
CREATE TABLE pre_common_admingroup (
  admingid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '��������Ա����ID',
  alloweditpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����༭����',
  alloweditpoll tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����༭ͶƱ',
  allowstickthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������ö�����',
  allowmodpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������������',
  allowdelpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ɾ������',
  allowmassprune tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������ɾ��',
  allowrefund tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ǿ���˿�',
  allowcensorword tinyint(1) NOT NULL DEFAULT '0' COMMENT '�������ֶ�',
  allowviewip tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����鿴IP',
  allowbanip tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������ֹIP',
  allowedituser tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����༭�û�',
  allowmoduser tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������û�',
  allowbanuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������ֹ�û�����',
  allowbanvisituser tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������ֹ�û�����',
  allowpostannounce tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�������վ�㹫��',
  allowviewlog tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����鿴������־',
  allowbanpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�������������',
  supe_allowpushthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�������ֶ�',
  allowhighlightthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������������',
  allowdigestthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����������',
  allowrecommendthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������Ƽ�����',
  allowbumpthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�������������',
  allowclosethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ر�����',
  allowmovethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������ƶ�����',
  allowedittypethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����༭�������',
  allowstampthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������������ͼ��',
  allowstamplist tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������������ͼ��',
  allowcopythread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����������',
  allowmergethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ϲ�����',
  allowsplitthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ָ�����',
  allowrepairthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������޸�����',
  allowwarnpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����������',
  allowviewreport tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����鿴�û�����',
  alloweditforum tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����༭���',
  allowremovereward tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������Ƴ�����',
  allowedittrade tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����༭��Ʒ',
  alloweditactivity tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��������������',
  allowstickreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������ö�����',
  allowmanagearticle tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ����������������',
  allowaddtopic tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�������ר��',
  allowmanagetopic tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��������ר��',
  allowdiy tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����DIY',
  allowclearrecycle tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ɾ������վ������',
  allowmanagetag tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������ǩ',
  alloweditusertag tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������û���ǩ',
  managefeed tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��������̬(feed)',
  managedoing tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������¼',
  manageshare tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����������',
  manageblog tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ����������־',
  managealbum tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����������',
  managecomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ������������',
  managemagiclog tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ����������߼�¼',
  managereport tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��������ٱ�',
  managehotuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������Ƽ���Ա',
  managedefaultuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������Ƽ�����',
  managevideophoto tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ����������Ƶ��֤',
  managemagic tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�����������',
  manageclick tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���������̬����',
  allowmanagecollection tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ����������ר��',
  PRIMARY KEY (admingid)
) ENGINE=MyISAM COMMENT='�������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_adminnote'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_adminnote;
CREATE TABLE pre_common_adminnote (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '��̨����id',
  admin varchar(15) NOT NULL default '' COMMENT '����Ա����',
  access tinyint(3) NOT NULL default '0' COMMENT '������Կ�����Ϣ',
  adminid tinyint(3) NOT NULL default '0' COMMENT '����Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  message text NOT NULL COMMENT '��Ϣ',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='��̨���Ա�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_advertisement'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_advertisement;
CREATE TABLE pre_common_advertisement (
  advid mediumint(8) unsigned NOT NULL auto_increment COMMENT '���id',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  `type` varchar(50) NOT NULL default '0' COMMENT '����',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳��',
  title varchar(255) NOT NULL default '' COMMENT '������',
  targets text NOT NULL COMMENT 'Ͷ�ŷ�Χ',
  parameters text NOT NULL COMMENT '����\n���л���ŵ���������',
  `code` text NOT NULL COMMENT '����',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '��ʼʱ��',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  PRIMARY KEY  (advid)
) ENGINE=MyISAM COMMENT='������ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_advertisement_custom'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_advertisement_custom;
CREATE TABLE pre_common_advertisement_custom (
  `id` smallint(5) unsigned NOT NULL auto_increment COMMENT '�Զ���������id',
  `name` varchar(255) NOT NULL COMMENT '����',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM COMMENT='�Զ��������ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_banned'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_banned;
CREATE TABLE pre_common_banned (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '��ֹid',
  ip1 smallint(3) NOT NULL default '0' COMMENT 'IP�ֶ�1',
  ip2 smallint(3) NOT NULL default '0' COMMENT 'IP�ֶ�2',
  ip3 smallint(3) NOT NULL default '0' COMMENT 'IP�ֶ�3',
  ip4 smallint(3) NOT NULL default '0' COMMENT 'IP�ֶ�4',
  admin varchar(15) NOT NULL default '' COMMENT '����Ա����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��ֹʱ��',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='��ֹ���ʱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_cache'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_cache;
CREATE TABLE pre_common_cache (
  cachekey varchar(255) NOT NULL default '',
  cachevalue mediumblob NOT NULL,
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (cachekey)
) ENGINE=MyISAM COMMENT='ͨ�û����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_card'
--
-- ����ʱ��: 2010 �� 12 �� 16 �� 13:48
-- ������ʱ��: 2010 �� 12 �� 16 �� 14:48
--

DROP TABLE IF EXISTS pre_common_card;
CREATE TABLE pre_common_card (
  id char(255) NOT NULL default '' COMMENT '���ɵĿ�Ƭ����',
  typeid smallint(6) unsigned NOT NULL default '1' COMMENT '��Ƭ����',
  maketype tinyint(1) NOT NULL default '0' COMMENT '��Ƭ���ɵķ���',
  makeruid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ƭ������uid',
  `price` mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ƭ��ֵ',
  `extcreditskey` tinyint(1) NOT NULL default '0' COMMENT '��ֵ��������',
  `extcreditsval` int(10) NOT NULL default '0' COMMENT '��������',
  `status` tinyint(1) unsigned NOT NULL default '1' COMMENT '��Ƭ״̬(λ��):1:����,2:����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��Ƭ����ʱ��',
  cleardateline int(10) unsigned NOT NULL default '0' COMMENT '��Ƭ����ʱ��',
  useddateline int(10) unsigned NOT NULL default '0' COMMENT 'ʹ��ʱ��',
  uid mediumint(8)  unsigned NOT NULL default '0' COMMENT 'ʹ����',
  PRIMARY KEY  (id),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM COMMENT='��ֵ���ܱ�';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_card_log'
--
-- ����ʱ��: 2010 �� 12 �� 16 �� 13:48
-- ������ʱ��: 2010 �� 12 �� 16 �� 14:48
--

DROP TABLE IF EXISTS pre_common_card_log;
CREATE TABLE pre_common_card_log (
  id smallint(6) NOT NULL auto_increment COMMENT '���ɵĿ�Ƭ����',
  `uid` mediumint(8) NOT NULL default '0' COMMENT '��Ƭ������',
  `username` varchar(20) NOT NULL default '' COMMENT '��Ƭ������',
  cardrule varchar(255) NOT NULL default '' COMMENT '��Ƭ���ɹ���',
  `info` text NOT NULL COMMENT '��Ƭ����log',
  dateline INT(10) unsigned NOT NULL default '0' COMMENT '����log����ʱ��',
  description mediumtext NOT NULL COMMENT '��Ƭ����',
  operation tinyint(1) NOT NULL default '0' COMMENT '��������(λ��):1:����,2:��������,4:ɾ��,9:��Ƭ����',
  PRIMARY KEY  (id),
  KEY `dateline` (`dateline`),
  KEY `operation_dateline` (`operation`, `dateline`)
) ENGINE=MyISAM COMMENT='��ֵ���ܱ�';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_card_type'
--
-- ����ʱ��: 2010 �� 12 �� 16 �� 13:48
-- ������ʱ��: 2010 �� 12 �� 16 �� 14:48
--

DROP TABLE IF EXISTS pre_common_card_type;
CREATE TABLE pre_common_card_type (
  id smallint(6) NOT NULL auto_increment COMMENT '��Ƭ����ID',
  typename char(20) NOT NULL default '' COMMENT '��������',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='��Ƭ�����';

-- --------------------------------------------------------
--
-- ��Ľṹ `pre_common_credit_log`
--
DROP TABLE IF EXISTS pre_common_credit_log;
CREATE TABLE pre_common_credit_log (
  `uid` mediumint(8) unsigned NOT NULL default '0' COMMENT '�����û�uid',
  `operation` char(3) NOT NULL default '' COMMENT '��������',
  `relatedid` int(10) unsigned NOT NULL COMMENT '�������ID',
  `dateline` int(10) unsigned NOT NULL COMMENT '��¼ʱ��',
  `extcredits1` int(10) NOT NULL COMMENT '����1�仯ֵ',
  `extcredits2` int(10) NOT NULL COMMENT '����2�仯ֵ',
  `extcredits3` int(10) NOT NULL COMMENT '����3�仯ֵ',
  `extcredits4` int(10) NOT NULL COMMENT '����4�仯ֵ',
  `extcredits5` int(10) NOT NULL COMMENT '����5�仯ֵ',
  `extcredits6` int(10) NOT NULL COMMENT '����6�仯ֵ',
  `extcredits7` int(10) NOT NULL COMMENT '����7�仯ֵ',
  `extcredits8` int(10) NOT NULL COMMENT '����8�仯ֵ',
  KEY `uid` (`uid`),
  KEY `operation` (`operation`),
  KEY `relatedid` (`relatedid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM COMMENT='������־��';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_credit_rule_log'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_credit_rule_log;
CREATE TABLE pre_common_credit_rule_log (
  clid mediumint(8) unsigned NOT NULL auto_increment COMMENT '������־ID',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������־������uid',
  rid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ID',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '���ID',
  total mediumint(8) unsigned NOT NULL default '0' COMMENT '���Ա�ִ���ܴ���',
  cyclenum mediumint(8) unsigned NOT NULL default '0' COMMENT '���ڱ�ִ�д���',
  extcredits1 int(10) NOT NULL default '0' COMMENT '��չ1',
  extcredits2 int(10) NOT NULL default '0' COMMENT '��չ2',
  extcredits3 int(10) NOT NULL default '0' COMMENT '��չ3',
  extcredits4 int(10) NOT NULL default '0' COMMENT '��չ4',
  extcredits5 int(10) NOT NULL default '0' COMMENT '��չ5',
  extcredits6 int(10) NOT NULL default '0' COMMENT '��չ6',
  extcredits7 int(10) NOT NULL default '0' COMMENT '��չ7',
  extcredits8 int(10) NOT NULL default '0' COMMENT '��չ8',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '���ڿ�ʼʱ��',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�������ִ��ʱ��',
  PRIMARY KEY  (clid),
  KEY uid (uid,rid, fid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='���ֹ�����־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_credit_rule_log_field'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_credit_rule_log_field;
CREATE TABLE pre_common_credit_rule_log_field (
  clid mediumint(8) unsigned NOT NULL default '0' COMMENT '������־ID',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������־������uid',
  info text NOT NULL COMMENT '��¼��Ϣ����',
  `user` text NOT NULL COMMENT '��¼�û�����',
  app text NOT NULL COMMENT '��¼Ӧ�÷���',
  PRIMARY KEY  (uid, clid)
) ENGINE=MyISAM COMMENT='���ֹ�����־��չ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_credit_rule'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_credit_rule;
CREATE TABLE pre_common_credit_rule (
  rid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����ID',
  rulename varchar(20) NOT NULL default '' COMMENT '��������',
  `action` varchar(20) NOT NULL default '' COMMENT '����actionΨһKEY',
  cycletype tinyint(1) NOT NULL default '0' COMMENT '��������0:һ��;1:ÿ��;2:����;3:�������;4:����;',
  cycletime int(10) NOT NULL default '0' COMMENT '���ʱ��',
  rewardnum tinyint(2) NOT NULL default '1' COMMENT '��������',
  norepeat tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ȥ��1��ȥ��;0����ȥ��',
  extcredits1 int(10) NOT NULL default '0' COMMENT '��չ1',
  extcredits2 int(10) NOT NULL default '0' COMMENT '��չ2',
  extcredits3 int(10) NOT NULL default '0' COMMENT '��չ3',
  extcredits4 int(10) NOT NULL default '0' COMMENT '��չ4',
  extcredits5 int(10) NOT NULL default '0' COMMENT '��չ5',
  extcredits6 int(10) NOT NULL default '0' COMMENT '��չ6',
  extcredits7 int(10) NOT NULL default '0' COMMENT '��չ7',
  extcredits8 int(10) NOT NULL default '0' COMMENT '��չ8',
  fids text NOT NULL COMMENT '��¼�Զ�����԰��ID',
  PRIMARY KEY  (rid),
  UNIQUE KEY `action` (`action`)
) ENGINE=MyISAM COMMENT='���ֹ����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_cron'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_cron;
CREATE TABLE pre_common_cron (
  cronid smallint(6) unsigned NOT NULL auto_increment COMMENT '�ƻ�����id',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  `type` enum('user','system') NOT NULL default 'user' COMMENT '����',
  `name` char(50) NOT NULL default '' COMMENT '����',
  filename char(50) NOT NULL default '' COMMENT '��Ӧ�ļ�',
  lastrun int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ִ��ʱ��',
  nextrun int(10) unsigned NOT NULL default '0' COMMENT '�´�ִ��ʱ��',
  weekday tinyint(1) NOT NULL default '0' COMMENT '�ܼƻ�',
  `day` tinyint(2) NOT NULL default '0' COMMENT '�ռƻ�',
  `hour` tinyint(2) NOT NULL default '0' COMMENT 'Сʱ�ƻ�',
  `minute` char(36) NOT NULL default '' COMMENT '�ּƻ�',
  PRIMARY KEY  (cronid),
  KEY nextrun (available,nextrun)
) ENGINE=MyISAM COMMENT='�ƻ������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_domain'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_domain;
CREATE TABLE pre_common_domain (
  domain char(30) NOT NULL default '' COMMENT '����ǰ׺',
  domainroot char(60) NOT NULL default '' COMMENT '����������׺',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ӧ����id',
  idtype char(15) NOT NULL default '' COMMENT '��Ӧ��������subarea:������forum:��顢home:���˿ռ䡢group:Ⱥ�顢topic:ר�⡢channel:Ƶ��',
  PRIMARY KEY (id, idtype),
  KEY domain (domain, domainroot),
  KEY idtype (idtype)
) ENGINE=MyISAM COMMENT='����������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_failedlogin'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_failedlogin;
CREATE TABLE pre_common_failedlogin (
  ip char(15) NOT NULL default '' COMMENT 'ʧ��IP',
  username char(32) NOT NULL default '' COMMENT 'ʧ��ʱ���û���',
  count tinyint(1) unsigned NOT NULL default '0' COMMENT '���Դ���',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '���һ�γ���ʱ��',
  PRIMARY KEY  (ip,username)
) ENGINE=MyISAM COMMENT='ʧ�ܵ�¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_friendlink'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_friendlink;
CREATE TABLE pre_common_friendlink (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT 'id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳������',
  `name` varchar(100) NOT NULL default '' COMMENT '����',
  url varchar(255) NOT NULL default '' COMMENT 'url',
  description mediumtext NOT NULL COMMENT '����˵��',
  logo varchar(255) NOT NULL default '' COMMENT 'logo',
  `type` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='�������ӱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_relatedlink'
--
-- ����ʱ��: 2010 �� 11 �� 11 �� 14:47
-- ������ʱ��: 2010 �� 11 �� 11 �� 14:47
--

DROP TABLE IF EXISTS pre_common_relatedlink;
CREATE TABLE pre_common_relatedlink (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` varchar(100) NOT NULL default '' COMMENT '����',
  url varchar(255) NOT NULL default '' COMMENT 'url',
  `extent` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='�������ӱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_invite'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_invite;
CREATE TABLE pre_common_invite (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT 'ID',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������',
  `code` char(20) NOT NULL default '' COMMENT '������',
  fuid mediumint(8) unsigned NOT NULL default '0' COMMENT '������UID',
  fusername char(20) NOT NULL default '' COMMENT '����������',
  `type` tinyint(1) NOT NULL default '0' COMMENT '',
  email char(40) NOT NULL default '' COMMENT '����Email',
  inviteip char(15) NOT NULL default '' COMMENT '����IP',
  appid mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ӧ��ID',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����������ʱ��',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '���������ʱ��',
  regdateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ע��ʱ��',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '������״̬',
  orderid char(32) NOT NULL default '' COMMENT '����������Ķ�����id',
  PRIMARY KEY (id),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_mailcron'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_mailcron;
CREATE TABLE pre_common_mailcron (
  cid mediumint(8) unsigned NOT NULL auto_increment,
  touid mediumint(8) unsigned NOT NULL default '0',
  email varchar(100) NOT NULL default '',
  sendtime int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (cid),
  KEY sendtime (sendtime)
) ENGINE=MyISAM COMMENT='�ʼ��ƻ������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_mailqueue'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_mailqueue;
CREATE TABLE pre_common_mailqueue (
  qid mediumint(8) unsigned NOT NULL auto_increment,
  cid mediumint(8) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  message text NOT NULL,
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (qid),
  KEY mcid (cid,dateline)
) ENGINE=MyISAM COMMENT='�ʼ����б�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member;
CREATE TABLE pre_common_member (
  uid mediumint(8) unsigned NOT NULL auto_increment COMMENT '��Աid',
  email char(40) NOT NULL default '' COMMENT '����',
  username char(15) NOT NULL default '' COMMENT '�û���',
  `password` char(32) NOT NULL default '' COMMENT '����',
  `status` tinyint(1) NOT NULL default '0' COMMENT '�ж��û��Ƿ��Ѿ�ɾ�� ��Ҫdiscuz������жϣ���������������Ĺ��ܡ�ԭhome�ֶ�Ϊflag',
  emailstatus tinyint(1) NOT NULL default '0' COMMENT 'email�Ƿ񾭹���֤ home�ֶ�Ϊemailcheck',
  avatarstatus tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���ͷ�� home�ֶ�Ϊavatar',
  videophotostatus tinyint(1) NOT NULL default '0' COMMENT '��Ƶ��֤״̬ home',
  adminid tinyint(1) NOT NULL default '0' COMMENT '����Աid',
  groupid smallint(6) unsigned NOT NULL default '0' COMMENT '��Ա��id',
  groupexpiry int(10) unsigned NOT NULL default '0' COMMENT '�û�����Ч��',
  extgroupids char(20) NOT NULL default '' COMMENT '��չ�û���',
  regdate int(10) unsigned NOT NULL default '0' COMMENT 'ע��ʱ��',
  credits int(10) NOT NULL default '0' COMMENT '�ܻ���',
  notifysound tinyint(1) NOT NULL default '0' COMMENT '��������',
  timeoffset char(4) NOT NULL default '' COMMENT 'ʱ��У��',
  newpm smallint(6) unsigned NOT NULL default '0' COMMENT '�¶���Ϣ����',
  newprompt smallint(6) unsigned NOT NULL default '0' COMMENT '��������Ŀ',
  accessmasks tinyint(1) NOT NULL default '0' COMMENT '��־',
  allowadmincp tinyint(1) NOT NULL default '0' COMMENT '��־',
  onlyacceptfriendpm tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ֻ���պ��Ѷ���Ϣ',
  conisbind tinyint(1) unsigned NOT NULL default '0' COMMENT '�û��Ƿ��QC',
  PRIMARY KEY  (uid),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `conisbind` (`conisbind`)
) ENGINE=MyISAM COMMENT='�û�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_count'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_count;
CREATE TABLE pre_common_member_count (
  uid mediumint(8) unsigned NOT NULL COMMENT '��Աid',
  extcredits1 int(10) NOT NULL default '0' COMMENT '����',
  extcredits2 int(10) NOT NULL default '0' COMMENT '��Ǯ',
  extcredits3 int(10) NOT NULL default '0' COMMENT '��չ',
  extcredits4 int(10) NOT NULL default '0' COMMENT '��չ',
  extcredits5 int(10) NOT NULL default '0' COMMENT '��չ',
  extcredits6 int(10) NOT NULL default '0' COMMENT '��չ',
  extcredits7 int(10) NOT NULL default '0' COMMENT '��չ',
  extcredits8 int(10) NOT NULL default '0' COMMENT '��չ',
  friends smallint(6) unsigned NOT NULL default '0' COMMENT '���Ѹ��� home',
  posts mediumint(8) unsigned NOT NULL default '0' COMMENT '������',
  threads mediumint(8) unsigned NOT NULL default '0',
  digestposts smallint(6) unsigned NOT NULL default '0' COMMENT '������',
  doings smallint(6) unsigned NOT NULL default '0',
  blogs smallint(6) unsigned NOT NULL default '0',
  albums smallint(6) unsigned NOT NULL default '0',
  sharings smallint(6) unsigned NOT NULL default '0',
  attachsize int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�����ռ�õĿռ� home',
  views mediumint(8) unsigned NOT NULL default '0' COMMENT '�ռ�鿴��',
  oltime smallint(6) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  todayattachs smallint(6) unsigned NOT NULL default '0' COMMENT '�����ϴ�������',
  todayattachsize int(10) unsigned NOT NULL default '0' COMMENT '�����ϴ���������',
  feeds mediumint(8) unsigned NOT NULL default '0' COMMENT '�㲥��',
  follower mediumint(8) unsigned NOT NULL default '0' COMMENT '��������',
  following mediumint(8) unsigned NOT NULL default '0' COMMENT '��������',
  newfollower mediumint(8) unsigned NOT NULL default '0' COMMENT '������������',
  PRIMARY KEY  (uid),
  KEY posts (posts)
) ENGINE=MyISAM COMMENT='�û�ͳ�Ʊ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_field_forum'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_field_forum;
CREATE TABLE pre_common_member_field_forum (
  uid mediumint(8) unsigned NOT NULL COMMENT '��Աid',
  publishfeed tinyint(3) NOT NULL default '0' COMMENT '�û��Զ��巢����Щ���͵�feed(ԭ�ֶ�Ϊcustomaddfeed)',
  customshow tinyint(1) unsigned NOT NULL default '26' COMMENT '�Զ���������ʾģʽ',
  customstatus varchar(30) NOT NULL default '' COMMENT '�Զ���ͷ��',
  medals text NOT NULL COMMENT 'ѫ����Ϣ',
  sightml text NOT NULL COMMENT 'ǩ��',
  groupterms text NOT NULL COMMENT '�����û���',
  authstr varchar(20) NOT NULL default '' COMMENT '�һ�������֤��',
  groups mediumtext NOT NULL COMMENT '�û�����Ⱥ��',
  attentiongroup varchar(255) NOT NULL default '' COMMENT '�û�ƫ��',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='�û���̳�ֶα�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_field_home'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_field_home;
CREATE TABLE pre_common_member_field_home (
  uid mediumint(8) unsigned NOT NULL COMMENT '��Աid',
  videophoto varchar(255) NOT NULL default '' COMMENT '��Ƶ��֤��Ƭ��ַ home',
  spacename varchar(255) NOT NULL default '' COMMENT '�ռ�����',
  spacedescription varchar(255) NOT NULL default '' COMMENT '�ռ���',
  `domain` char(15) NOT NULL default '' COMMENT '�ռ�󶨶������� home',
  addsize int(10) unsigned NOT NULL default '0' COMMENT '����������ϴ��ռ� home',
  addfriend smallint(6) unsigned NOT NULL default '0' COMMENT '�����������ӵĺ����� home',
  menunum smallint(6) unsigned NOT NULL default '0' COMMENT 'Ӧ����ʾ����',
  theme varchar(20) NOT NULL default '' COMMENT '�ռ������� home',
  spacecss text NOT NULL COMMENT '���˿ռ��Զ���css home',
  blockposition text NOT NULL COMMENT '���˿ռ��Զ���ģ��λ�ü���ز��� home',
  recentnote text NOT NULL COMMENT '���һ����Ϊ��¼',
  spacenote text NOT NULL COMMENT '���һ��twitter',
  privacy text NOT NULL COMMENT 'home��˽����(ע��Ҫ����̳��feed�ȿ��ص����ý��)',
  feedfriend mediumtext NOT NULL COMMENT '����feed�ĺ��ѻ���',
  acceptemail text NOT NULL COMMENT '������֪ͨ�ʼ��������ʼ����ղ���',
  magicgift text NOT NULL COMMENT '���ߺ���������Ϣ',
  stickblogs text NOT NULL COMMENT '�ö�����־ID',
  PRIMARY KEY  (uid),
  KEY domain (domain)
) ENGINE=MyISAM COMMENT='�û���԰�ֶα�';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_member_profile'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_profile;
CREATE TABLE pre_common_member_profile (
  uid mediumint(8) unsigned NOT NULL COMMENT '��Աid',
  realname varchar(255) NOT NULL default '' COMMENT 'ʵ��',
  gender tinyint(1) NOT NULL default '0' COMMENT '�Ա�\n(0:���� 1:�� 2:Ů)',
  birthyear smallint(6) unsigned NOT NULL default '0',
  birthmonth tinyint(3) unsigned NOT NULL default '0',
  birthday tinyint(3) unsigned NOT NULL default '0',
  constellation varchar(255) NOT NULL default '' COMMENT '����(���������Զ�����)',
  zodiac varchar(255) NOT NULL default '' COMMENT '��Ф(���������Զ�����)',
  telephone varchar(255) NOT NULL default '' COMMENT '�̶��绰',
  mobile varchar(255) NOT NULL default '' COMMENT '�ֻ�',
  idcardtype varchar(255) NOT NULL default '' COMMENT '֤�����ͣ����֤ ���� ����֤��',
  idcard varchar(255) NOT NULL default '' COMMENT '֤������',
  address varchar(255) NOT NULL default '' COMMENT '�ʼĵ�ַ',
  zipcode varchar(255) NOT NULL default '' COMMENT '�ʱ�',
  nationality varchar(255) NOT NULL default '' COMMENT '����',
  birthprovince varchar(255) NOT NULL default '' COMMENT '����ʡ��',
  birthcity varchar(255) NOT NULL default '' COMMENT '��������',
  birthdist varchar(20) NOT NULL default '' COMMENT '����������/��',
  birthcommunity varchar(255) NOT NULL default '' COMMENT '����С��',
  resideprovince varchar(255) NOT NULL default '' COMMENT '��סʡ��',
  residecity varchar(255) NOT NULL default '' COMMENT '��ס����',
  residedist varchar(20) NOT NULL default '' COMMENT '��ס������/��',
  residecommunity varchar(255) NOT NULL default '' COMMENT '��סС��',
  residesuite varchar(255) NOT NULL default '' COMMENT 'С����д��¥���ƺ�',
  graduateschool varchar(255) NOT NULL default '' COMMENT '��ҵѧУ',
  company varchar(255) NOT NULL default '' COMMENT ' ��˾',
  education varchar(255) NOT NULL default '' COMMENT ' ѧ��',
  occupation varchar(255) NOT NULL default '' COMMENT ' ְҵ',
  `position` varchar(255) NOT NULL default '' COMMENT 'ְλ',
  revenue varchar(255) NOT NULL default '' COMMENT ' ������',
  affectivestatus varchar(255) NOT NULL default '' COMMENT ' ���״̬',
  lookingfor varchar(255) NOT NULL default '' COMMENT ' ����Ŀ�ģ��������ͣ�',
  bloodtype varchar(255) NOT NULL default '' COMMENT 'Ѫ��',
  height varchar(255) NOT NULL default '' COMMENT ' ���',
  weight varchar(255) NOT NULL default '' COMMENT ' ����',
  alipay varchar(255) NOT NULL default '' COMMENT '֧�����ʺ�',
  icq varchar(255) NOT NULL default '' COMMENT 'ICQ',
  qq varchar(255) NOT NULL default '' COMMENT 'QQ',
  yahoo varchar(255) NOT NULL default '' COMMENT 'YAHOO',
  msn varchar(255) NOT NULL default '' COMMENT 'MSN',
  taobao varchar(255) NOT NULL default '' COMMENT '��������',
  site varchar(255) NOT NULL default '' COMMENT '��ҳ',
  bio text NOT NULL COMMENT '���ҽ��� ������̳bio�ֶ�',
  interest text NOT NULL COMMENT '��Ȥ����',
  field1 text NOT NULL COMMENT '�Զ����ֶ�1',
  field2 text NOT NULL COMMENT '�Զ����ֶ�2',
  field3 text NOT NULL COMMENT '�Զ����ֶ�3',
  field4 text NOT NULL COMMENT '�Զ����ֶ�4',
  field5 text NOT NULL COMMENT '�Զ����ֶ�5',
  field6 text NOT NULL COMMENT '�Զ����ֶ�6',
  field7 text NOT NULL COMMENT '�Զ����ֶ�7',
  field8 text NOT NULL COMMENT '�Զ����ֶ�8',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='�û���Ŀ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_status'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_status;
CREATE TABLE pre_common_member_status (
  uid mediumint(8) unsigned NOT NULL COMMENT '��Աid',
  regip char(15) NOT NULL default '' COMMENT 'ע��IP',
  lastip char(15) NOT NULL default '' COMMENT '����¼IP',
  lastvisit int(10) unsigned NOT NULL default '0' COMMENT '������',
  lastactivity int(10) unsigned NOT NULL default '0' COMMENT '���',
  lastpost int(10) unsigned NOT NULL default '0' COMMENT '��󷢱�',
  lastsendmail int(10) unsigned NOT NULL default '0' COMMENT '�ϴη���emailʱ�� homeԭ�ֶ�Ϊlastsend',
  invisible tinyint(1) NOT NULL default '0' COMMENT '�Ƿ������¼',
  buyercredit smallint(6) NOT NULL default '0' COMMENT '������õȼ�������',
  sellercredit smallint(6) NOT NULL default '0' COMMENT '�������õȼ�������',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '���˿ռ��ղش���',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '���˿ռ�������',
  profileprogress tinyint(2) unsigned NOT NULL default '0' COMMENT '����������ɶ�',
  PRIMARY KEY  (uid),
  KEY lastactivity (lastactivity, invisible)
) ENGINE=MyISAM COMMENT='�û�״̬��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_stat_field'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_stat_field;
CREATE TABLE pre_common_member_stat_field (
  optionid  mediumint(8) unsigned NOT NULL auto_increment COMMENT '����ͳ���� id',
  fieldid varchar(255) NOT NULL default '' COMMENT '�������ֶα�־��',
  fieldvalue varchar(255) NOT NULL default '' COMMENT '�ֶ�ֵ' ,
  hash varchar(255) NOT NULL default '' COMMENT '��fieldid��fieldvalue���ɵ�hash',
  users mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ӧ�û���',
  updatetime int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  PRIMARY KEY (optionid),
  KEY fieldid (fieldid)
) ENGINE=MyISAM COMMENT='�û�����ͳ����';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_member_action_log'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_action_log;
CREATE TABLE pre_common_member_action_log (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '��¼id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�ID',
  `action` tinyint(5) NOT NULL default '0' COMMENT '��������',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY dateline (dateline, `action`, uid)
) ENGINE=MyISAM COMMENT='�û�������־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_follow'
--
-- ����ʱ��: 2011 �� 06 �� 08 �� 18:00
-- ������ʱ��: 2011 �� 06 �� 08 �� 18:00
--

DROP TABLE IF EXISTS pre_home_follow;
CREATE TABLE pre_home_follow (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�ID',
  username char(15) NOT NULL default '' COMMENT '�û���',
  followuid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ע�û�ID',
  fusername char(15) NOT NULL default '' COMMENT '����ע�û�����',
  bkname varchar(255) NOT NULL default '' COMMENT '�û���ע',
  `status` tinyint(1) NOT NULL default '0' COMMENT '0:���� 1:�����ע -1:�����ٹ�ע����',
  mutual tinyint(1) NOT NULL default '0' COMMENT '0:���� 1:�ѻ����ע',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (uid, followuid)
) ENGINE=MyISAM COMMENT='�û���ע��ϵ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_follow_feed'
--
-- ����ʱ��: 2011 �� 06 �� 08 �� 18:00
-- ������ʱ��: 2011 �� 06 �� 08 �� 18:00
--

DROP TABLE IF EXISTS pre_home_follow_feed;
CREATE TABLE pre_home_follow_feed (
  feedid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ע��ID',
  username varchar(15) NOT NULL default '' COMMENT '����ע�û���',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����tid',
  note varchar(255) NOT NULL default '' COMMENT 'ת������',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (feedid),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='����ע���¼���';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_follow_feed_archiver'
--
-- ����ʱ��: 2011 �� 06 �� 08 �� 18:00
-- ������ʱ��: 2011 �� 06 �� 08 �� 18:00
--

DROP TABLE IF EXISTS pre_home_follow_feed_archiver;
CREATE TABLE pre_home_follow_feed_archiver (
  feedid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ע��ID',
  username varchar(15) NOT NULL default '' COMMENT '����ע�û���',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����tid',
  note varchar(255) NOT NULL default '' COMMENT 'ת������',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (feedid),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='����ע���¼��浵';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_log'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_log;
CREATE TABLE pre_common_member_log (
  uid mediumint(8) unsigned NOT NULL default '0',
  `action` char(10) NOT NULL default '' COMMENT 'add,update,delete',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='�����û���־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_verify'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_verify;
CREATE TABLE pre_common_member_verify (
  uid mediumint(8) unsigned NOT NULL COMMENT '��Աid',
  verify1 tinyint(1) NOT NULL default '0' COMMENT '��֤1: -1:���ܾ� 0:����� 1:���ͨ��',
  verify2 tinyint(1) NOT NULL default '0' COMMENT '��֤2: -1:���ܾ� 0:����� 1:���ͨ��',
  verify3 tinyint(1) NOT NULL default '0' COMMENT '��֤3: -1:���ܾ� 0:����� 1:���ͨ��',
  verify4 tinyint(1) NOT NULL default '0' COMMENT '��֤4: -1:���ܾ� 0:����� 1:���ͨ��',
  verify5 tinyint(1) NOT NULL default '0' COMMENT '��֤5: -1:���ܾ� 0:����� 1:���ͨ��',
  verify6 tinyint(1) NOT NULL default '0' COMMENT 'ʵ����֤: -1:���ܾ� 0:����� 1:���ͨ��',
  verify7 tinyint(1) NOT NULL default '0' COMMENT '��Ƶ��֤: -1:���ܾ� 0:����� 1:���ͨ��',
  PRIMARY KEY (uid),
  KEY verify1 (verify1),
  KEY verify2 (verify2),
  KEY verify3 (verify3),
  KEY verify4 (verify4),
  KEY verify5 (verify5),
  KEY verify6 (verify6),
  KEY verify7 (verify7)
) ENGINE=MyISAM COMMENT='�û���֤��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_verify_info'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_verify_info;
CREATE TABLE pre_common_member_verify_info (
  vid mediumint(8) unsigned NOT NULL auto_increment COMMENT '���id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username varchar(30) NOT NULL default '' COMMENT '�û���',
  verifytype tinyint(1) NOT NULL default '0' COMMENT '�������0:�������, 1:��֤1, 2:��֤2, 3:��֤3, 4:��֤4, 5:��֤5',
  flag tinyint(1) NOT NULL default '0' COMMENT '-1:���ܾ� 0:����� 1:���ͨ��',
  field text NOT NULL COMMENT '���л��洢�仯ֵ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ύ����',
  PRIMARY KEY (vid),
  KEY verifytype (verifytype, flag),
  KEY uid (uid, verifytype, dateline)
) ENGINE=MyISAM COMMENT='������Ϣ�޸����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_profile_setting'
--

DROP TABLE IF EXISTS pre_common_member_profile_setting;
CREATE TABLE pre_common_member_profile_setting (
  fieldid varchar(255) NOT NULL default '' COMMENT 'profile�ֶα�־��',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  invisible tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  needverify tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Ҫ���',
  title varchar(255) NOT NULL default '' COMMENT '��Ŀ����',
  description varchar(255) NOT NULL default '' COMMENT '����˵��',
  displayorder smallint(6) unsigned NOT NULL default '0' COMMENT '��ʾ˳��',
  required tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��������',
  unchangeable tinyint(1) NOT NULL default '0' COMMENT '�����޸�',
  showincard tinyint(1) NOT NULL default '0' COMMENT '����Ƭ����ʾ',
  showinthread tinyint(1) NOT NULL default '0' COMMENT '����������ʾ',
  showinregister tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���ע��ҳ����ʾ',
  allowsearch tinyint(1) NOT NULL default '0' COMMENT '�Ƿ������',
  formtype varchar(255) NOT NULL COMMENT '��Ԫ������',
  size smallint(6) unsigned NOT NULL default '0' COMMENT '������󳤶�',
  choices text NOT NULL COMMENT 'ѡ������',
  validate text NOT NULL COMMENT '��֤���ݵ�������ʽ',
  PRIMARY KEY  (fieldid)
) ENGINE=MyISAM  COMMENT='������Ϣ��չ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_security'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_security;
CREATE TABLE pre_common_member_security (
  securityid mediumint(8) unsigned NOT NULL auto_increment COMMENT '�����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username varchar(255) NOT NULL default '' COMMENT '�û���',
  fieldid varchar(255) NOT NULL default '' COMMENT 'profile�ֶα�־��',
  oldvalue text NOT NULL COMMENT '�ɵ�profile�ֶ�ֵ',
  newvalue text NOT NULL COMMENT '�µ�profile�ֶ�ֵ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ύ����',
  PRIMARY KEY  (securityid),
  KEY uid (uid, fieldid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='������Ϣ�޸����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_validate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_validate;
CREATE TABLE pre_common_member_validate (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  submitdate int(10) unsigned NOT NULL default '0' COMMENT '�ύ����',
  moddate int(10) unsigned NOT NULL default '0' COMMENT '�������',
  admin varchar(15) NOT NULL default '' COMMENT '����Ա��',
  submittimes tinyint(3) unsigned NOT NULL default '0' COMMENT '�ύ�Ĵ���',
  `status` tinyint(1) NOT NULL default '0' COMMENT '״̬',
  message text NOT NULL COMMENT 'ע��ԭ��',
  remark text NOT NULL COMMENT '����Ա����',
  PRIMARY KEY  (uid),
  KEY `status` (`status`)
) ENGINE=MyISAM COMMENT='�û���˱�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_crime'
--
-- ����ʱ��: 2011 �� 06 �� 30 �� 14:47
-- ������ʱ��: 2011 �� 06 �� 30 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_crime;
CREATE TABLE pre_common_member_crime (
  cid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '���ͷ��������û�id',
  operatorid mediumint(8) unsigned NOT NULL default '0' COMMENT '���гͷ��������û�id',
  operator varchar(15) NOT NULL COMMENT '���гͷ��������û���',
  `action` tinyint(5) NOT NULL COMMENT '�ͷ���Ϊ',
  reason text NOT NULL COMMENT '�ͷ�����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ͷ�����ʱ��',
  PRIMARY KEY  (cid),
  KEY uid (uid,`action`,dateline)
) ENGINE=MyISAM COMMENT='�û��ͷ�������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_grouppm'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_grouppm;
CREATE TABLE pre_common_member_grouppm (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  gpmid smallint(6) unsigned NOT NULL auto_increment COMMENT '��Ϣid',
  status tinyint(1) NOT NULL default '0' COMMENT '0=δ�� 1=�Ѷ� -1=ɾ��',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�Ķ�ʱ��',
  PRIMARY KEY  (uid, gpmid)
) ENGINE=MyISAM COMMENT='Ⱥ������Ϣ�û���¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_grouppm'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_grouppm;
CREATE TABLE pre_common_grouppm (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '��Ϣid',
  authorid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  author varchar(15) NOT NULL default '' COMMENT '��������',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'ʱ��',
  message text NOT NULL COMMENT '��Ϣ',
  numbers mediumint(8) unsigned NOT NULL default '0' COMMENT '����',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='Ⱥ������Ϣ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_myapp'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_myapp;
CREATE TABLE pre_common_myapp (
  appid mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ӧ��id',
  appname varchar(60) NOT NULL default '' COMMENT 'Ӧ������',
  narrow tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���ʾΪխ��profile box',
  flag tinyint(1) NOT NULL default '0' COMMENT 'Ӧ��״̬���ڰ�������Ĭ��Ӧ�õȣ�',
  version mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ӧ�ð汾��',
  userpanelarea tinyint(1) NOT NULL default '0' COMMENT 'userabout��ʾ����1������2��������3Ӧ����',
  canvastitle varchar(60) NOT NULL default '' COMMENT 'canvasҳ�����',
  fullscreen tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���ȫ��Ӧ��',
  displayuserpanel tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���ʾӦ���Ҳ���û��˵�',
  displaymethod tinyint(1) NOT NULL default '0' COMMENT '��ʾ��ʽ��iframe/myml��',
  displayorder smallint(6) unsigned NOT NULL default '0' COMMENT '��ʾ˳��',
  appstatus tinyint(2) NOT NULL default '0' COMMENT '��ʶӦ��1:�¡�2:��',
  iconstatus tinyint(2) NOT NULL default '0' COMMENT 'Ӧ��ͼ���Ƿ������ص����ء�-1��ʧ�ܣ�0��δ���أ�1��������',
  icondowntime int(10) unsigned NOT NULL default '0' COMMENT 'Ӧ��ͼ�����ص�����ʱ��',
  PRIMARY KEY (appid),
  KEY flag (flag,displayorder)
) ENGINE=MyISAM COMMENT='����Ӧ�ñ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_myinvite'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_myinvite;
CREATE TABLE pre_common_myinvite (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  typename varchar(100) NOT NULL default '' COMMENT '��������',
  appid mediumint(8) NOT NULL default '0' COMMENT 'Ӧ��id',
  `type` tinyint(1) NOT NULL default '0' COMMENT '����(request ����/invite ����)',
  fromuid mediumint(8) unsigned NOT NULL default '0' COMMENT '������id',
  touid mediumint(8) unsigned NOT NULL default '0' COMMENT '������id',
  myml text NOT NULL COMMENT '��������',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '���������ʱ���',
  `hash` int(10) unsigned NOT NULL default '0' COMMENT 'hash���',
  PRIMARY KEY  (id),
  KEY `hash` (`hash`),
  KEY uid (touid,dateline)
) ENGINE=MyISAM COMMENT='�û������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_nav'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_nav;
CREATE TABLE pre_common_nav (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '��Ŀid',
  parentid smallint(6) unsigned NOT NULL default '0' COMMENT '�� id(navtype=0)',
  `name` varchar(255) NOT NULL COMMENT '��������',
  title varchar(255) NOT NULL COMMENT '����˵��',
  url varchar(255) NOT NULL COMMENT '��������',
  identifier varchar(255) NOT NULL COMMENT '���ӱ�ʶ/���ID',
  target tinyint(1) NOT NULL default '0' COMMENT 'Ŀ����\n(0:������ 1:�´���)',
  `type` tinyint(1) NOT NULL default '0' COMMENT '���� 0 ϵͳ  1 �Զ��� 3 ��� 4 Ƶ��',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  displayorder tinyint(3) NOT NULL COMMENT '��ʾ˳��',
  highlight tinyint(1) NOT NULL default '0' COMMENT '��ʽ(navtype=0)',
  `level` tinyint(1) NOT NULL default '0' COMMENT 'ʹ�õȼ�\n(0:�ο� 1:��Ա 2:���� 3:����Ա)',
  `subtype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '����������ʽ(navtype=0) ��������λ��(navtype=4)',
  `subcols` tinyint(1) NOT NULL DEFAULT '0' COMMENT '����һ����ʾ����Ŀ��(navtype=0)',
  `icon` varchar(255) NOT NULL COMMENT 'ͼ���ַ(navtype=1��3)',
  `subname` varchar(255) NOT NULL COMMENT '����������(navtype=1)',
  `suburl` varchar(255) NOT NULL COMMENT '��������ַ(navtype=1)',
  `navtype` tinyint(1) NOT NULL default '0' COMMENT '��������\n(0:������ 1:�ײ����� 2:��԰���� 3:��ݵ��� 4:��������)',
  logo varchar(255) NOT NULL COMMENT '�Զ��� Logo',
  PRIMARY KEY  (id),
  KEY `navtype` (`navtype`)
) ENGINE=MyISAM COMMENT='�Զ��嵼������';

-- --------------------------------------------------------

--
-- ��Ľṹ `pre_common_onlinetime`
--

DROP TABLE IF EXISTS pre_common_onlinetime;
CREATE TABLE pre_common_onlinetime (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  thismonth smallint(6) unsigned NOT NULL DEFAULT '0',
  total mediumint(8) unsigned NOT NULL DEFAULT '0',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (uid)
) ENGINE=MyISAM COMMENT='����ʱ���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_regip'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_regip;
CREATE TABLE pre_common_regip (
  ip char(15) NOT NULL default '' COMMENT 'IP��ַ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  count smallint(6) NOT NULL default '0' COMMENT '��������',
  KEY ip (ip)
) ENGINE=MyISAM COMMENT='ע��IP���Ʊ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_secquestion'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_secquestion;
CREATE TABLE pre_common_secquestion (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '��֤����id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '��֤��������',
  question text NOT NULL COMMENT '��֤����',
  answer varchar(255) NOT NULL COMMENT '�����',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='��֤�������ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_session'
--

DROP TABLE IF EXISTS pre_common_session;
CREATE TABLE pre_common_session (
  sid char(6) NOT NULL default '' COMMENT 'sid',
  ip1 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP��',
  ip2 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP��',
  ip3 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP��',
  ip4 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP��',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username char(15) NOT NULL default '' COMMENT '��Ա��',
  groupid smallint(6) unsigned NOT NULL default '0' COMMENT '��Ա��',
  invisible tinyint(1) NOT NULL default '0' COMMENT '�Ƿ������¼',
  `action` tinyint(1) unsigned NOT NULL default '0' COMMENT '��ǰ����',
  lastactivity int(10) unsigned NOT NULL default '0' COMMENT '���ʱ��',
  lastolupdate int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��������',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̳id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  UNIQUE KEY sid (sid),
  KEY uid (uid)
) ENGINE=MEMORY COMMENT='��Ա��֤��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_setting'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_setting;
CREATE TABLE pre_common_setting (
  skey varchar(255) NOT NULL default '' COMMENT '������',
  svalue text NOT NULL COMMENT 'ֵ',
  PRIMARY KEY  (skey)
) ENGINE=MyISAM COMMENT='���ñ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_smiley'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_smiley;
CREATE TABLE pre_common_smiley (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '����id',
  typeid smallint(6) unsigned NOT NULL COMMENT '������� id',
  displayorder tinyint(1) NOT NULL default '0' COMMENT '��ʾ˳��',
  `type` enum('smiley','stamp','stamplist') NOT NULL default 'smiley' COMMENT '����',
  `code` varchar(30) NOT NULL default '' COMMENT '���',
  url varchar(30) NOT NULL default '' COMMENT '·��',
  PRIMARY KEY  (id),
  KEY `type` (`type`, displayorder)
) ENGINE=MyISAM COMMENT='�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_stat'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_stat;
CREATE TABLE pre_common_stat (
  daytime int(10) unsigned NOT NULL default '0' COMMENT 'ʱ��',
  login int(10) unsigned NOT NULL default '0' COMMENT '��½',
  mobilelogin int(10) unsigned NOT NULL default '0' COMMENT '�ֻ���½',
  connectlogin int(10) unsigned NOT NULL default '0' COMMENT 'QQConnect��½',
  register int(10) unsigned NOT NULL default '0' COMMENT 'ע��',
  invite int(10) unsigned NOT NULL default '0' COMMENT '����',
  appinvite int(10) unsigned NOT NULL default '0' COMMENT 'Ӧ������',
  doing int(10) unsigned NOT NULL default '0' COMMENT '��¼',
  blog int(10) unsigned NOT NULL default '0' COMMENT '��־',
  pic int(10) unsigned NOT NULL default '0' COMMENT 'ͼƬ',
  poll int(10) unsigned NOT NULL default '0' COMMENT 'ͶƱ',
  activity int(10) unsigned NOT NULL default '0' COMMENT '�',
  `share` int(10) unsigned NOT NULL default '0' COMMENT '����',
  thread int(10) unsigned NOT NULL default '0' COMMENT '����',
  docomment int(10) unsigned NOT NULL default '0' COMMENT '��¼����',
  blogcomment int(10) unsigned NOT NULL default '0' COMMENT '��־����',
  piccomment int(10) unsigned NOT NULL default '0' COMMENT 'ͼƬ����',
  sharecomment int(10) unsigned NOT NULL default '0' COMMENT '��������',
  reward int(10) unsigned NOT NULL default '0' COMMENT '����',
  debate int(10) unsigned NOT NULL default '0' COMMENT '����',
  trade int(10) unsigned NOT NULL default '0' COMMENT '��Ʒ',
  `group` int(10) unsigned NOT NULL default '0' COMMENT 'Ⱥ��',
  groupjoin int(10) unsigned NOT NULL default '0' COMMENT '����Ⱥ��',
  groupthread int(10) unsigned NOT NULL default '0' COMMENT 'Ⱥ������',
  grouppost int(10) unsigned NOT NULL default '0' COMMENT 'Ⱥ��ظ�',
  post int(10) unsigned NOT NULL default '0' COMMENT '����ظ�',
  wall int(10) unsigned NOT NULL default '0' COMMENT '����',
  poke int(10) unsigned NOT NULL default '0' COMMENT '���к�',
  click int(10) unsigned NOT NULL default '0' COMMENT '��̬',
  sendpm int(10) unsigned NOT NULL default '0' COMMENT '����PM',
  friend int(10) unsigned NOT NULL default '0' COMMENT '��Ϊ����',
  addfriend int(10) unsigned NOT NULL default '0' COMMENT '��������',
  PRIMARY KEY  (daytime)
) ENGINE=MyISAM COMMENT='����ͳ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_statuser'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_statuser;
CREATE TABLE pre_common_statuser (
  uid mediumint(8) unsigned NOT NULL default '0',
  daytime int(10) unsigned NOT NULL default '0',
  `type` char(20) NOT NULL default '',
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='ͳ���û���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_style'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_style;
CREATE TABLE pre_common_style (
  styleid smallint(6) unsigned NOT NULL auto_increment COMMENT '���id',
  `name` varchar(20) NOT NULL default '' COMMENT '�������',
  available tinyint(1) NOT NULL default '1' COMMENT '����Ƿ����',
  templateid smallint(6) unsigned NOT NULL default '0' COMMENT '��Ӧģ��id',
  extstyle varchar(255) NOT NULL default '' COMMENT '��ɫ',
  PRIMARY KEY  (styleid)
) ENGINE=MyISAM COMMENT='����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_stylevar'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_stylevar;
CREATE TABLE pre_common_stylevar (
  stylevarid smallint(6) unsigned NOT NULL auto_increment COMMENT '������id',
  styleid smallint(6) unsigned NOT NULL default '0' COMMENT '���id',
  variable text NOT NULL COMMENT '������',
  substitute text NOT NULL COMMENT '������ֵ',
  PRIMARY KEY  (stylevarid),
  KEY styleid (styleid)
) ENGINE=MyISAM COMMENT='��������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_syscache'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_syscache;
CREATE TABLE pre_common_syscache (
  cname varchar(32) NOT NULL COMMENT '��������',
  `ctype` tinyint(3) unsigned NOT NULL COMMENT '�������� 0=value, serialize=1',
  dateline int(10) unsigned NOT NULL COMMENT '��������ʱ��',
  `data` mediumblob NOT NULL COMMENT '��������',
  PRIMARY KEY  (cname)
) ENGINE=MyISAM COMMENT='�������ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_template'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_template;
CREATE TABLE pre_common_template (
  templateid smallint(6) unsigned NOT NULL auto_increment COMMENT 'ģ��id',
  `name` varchar(30) NOT NULL default '' COMMENT '����',
  `directory` varchar(100) NOT NULL default '' COMMENT 'Ŀ¼',
  copyright varchar(100) NOT NULL default '' COMMENT '��Ȩ',
  PRIMARY KEY  (templateid)
) ENGINE=MyISAM COMMENT='ģ���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_usergroup'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_usergroup;
CREATE TABLE pre_common_usergroup (
  groupid smallint(6) unsigned NOT NULL auto_increment COMMENT '��Ա��id',
  radminid tinyint(3) NOT NULL default '0' COMMENT '�����ع�����',
  `type` enum('system','special','member') NOT NULL default 'member' COMMENT '����',
  system varchar(255) NOT NULL default 'private' COMMENT '��Ա�Ƿ�������ɽ���',
  grouptitle varchar(255) NOT NULL default '' COMMENT '��ͷ��',
  creditshigher int(10) NOT NULL default '0' COMMENT '����Ļ�������',
  creditslower int(10) NOT NULL default '0' COMMENT '����Ļ�������',
  stars tinyint(3) NOT NULL default '0' COMMENT '��������',
  color varchar(255) NOT NULL default '' COMMENT '��ͷ����ɫ',
  icon varchar(255) NOT NULL default '',
  allowvisit tinyint(1) NOT NULL default '0' COMMENT '�������',
  allowsendpm tinyint(1) NOT NULL default '1' COMMENT '�Ƿ������Ͷ���Ϣ',
  allowinvite tinyint(1) NOT NULL default '0' COMMENT '����ʹ������ע��',
  allowmailinvite tinyint(1) NOT NULL default '0' COMMENT '����ͨ����̳�ʼ�ϵͳ����������',
  maxinvitenum tinyint(3) unsigned NOT NULL default '0' COMMENT '���������ӵ������',
  inviteprice smallint(6) unsigned NOT NULL default '0' COMMENT '�����빺��۸�',
  maxinviteday smallint(6) unsigned NOT NULL default '0' COMMENT '��������Ч��',
  PRIMARY KEY  (groupid),
  KEY creditsrange (creditshigher,creditslower)
) ENGINE=MyISAM COMMENT='�û����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_usergroup_field'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_usergroup_field;
CREATE TABLE pre_common_usergroup_field (
  groupid smallint(6) unsigned NOT NULL COMMENT '��Ա��id',
  readaccess tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  allowpost tinyint(1) NOT NULL default '0' COMMENT '������',
  allowreply tinyint(1) NOT NULL default '0' COMMENT '����ظ�',
  allowpostpoll tinyint(1) NOT NULL default '0' COMMENT '������ͶƱ',
  allowpostreward tinyint(1) NOT NULL default '0' COMMENT '����������',
  allowposttrade tinyint(1) NOT NULL default '0' COMMENT '��������',
  allowpostactivity tinyint(1) NOT NULL default '0' COMMENT '������',
  allowdirectpost tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Ҫ���',
  allowgetattach tinyint(1) NOT NULL default '0' COMMENT '�������ظ���',
  allowgetimage tinyint(1) NOT NULL default '0' COMMENT '����鿴ͼƬ',
  allowpostattach tinyint(1) NOT NULL default '0' COMMENT '�����ϴ�����',
  allowpostimage tinyint(1) NOT NULL default '0' COMMENT '�����ϴ�ͼƬ',
  allowvote tinyint(1) NOT NULL default '0' COMMENT '�������ͶƱ',
  allowsearch tinyint(1) NOT NULL default '0' COMMENT '��������',
  allowcstatus tinyint(1) NOT NULL default '0' COMMENT '�����Զ���ͷ��',
  allowinvisible tinyint(1) NOT NULL default '0' COMMENT '���������¼',
  allowtransfer tinyint(1) NOT NULL default '0' COMMENT '�������ת��',
  allowsetreadperm tinyint(1) NOT NULL default '0' COMMENT '���������Ķ�Ȩ��',
  allowsetattachperm tinyint(1) NOT NULL default '0' COMMENT '�������ø���Ȩ��',
  allowposttag tinyint(1) NOT NULL default '0' COMMENT '����ʹ�ñ�ǩ',
  allowhidecode tinyint(1) NOT NULL default '0' COMMENT '����ʹ��hide����',
  allowhtml tinyint(1) NOT NULL default '0' COMMENT '����ʹ��html',
  allowanonymous tinyint(1) NOT NULL default '0' COMMENT '������������',
  allowsigbbcode tinyint(1) NOT NULL default '0' COMMENT '����ǩ��ʹ��bbcode',
  allowsigimgcode tinyint(1) NOT NULL default '0' COMMENT '����ʹ��img',
  allowmagics tinyint(1) unsigned NOT NULL COMMENT '����ʹ�õ���',
  disableperiodctrl tinyint(1) NOT NULL default '0' COMMENT '����ʱ�������',
  reasonpm tinyint(1) NOT NULL default '0' COMMENT '�������ɶ���֪ͨ����',
  maxprice smallint(6) unsigned NOT NULL default '0' COMMENT '��������ۼ�',
  maxsigsize smallint(6) unsigned NOT NULL default '0' COMMENT '���ǩ���ߴ�',
  maxattachsize mediumint(8) unsigned NOT NULL default '0' COMMENT '��󸽼��ߴ�',
  maxsizeperday int(10) unsigned NOT NULL default '0' COMMENT 'ÿ����󸽼��ܳߴ�',
  maxthreadsperhour tinyint(3) unsigned NOT NULL default '0' COMMENT 'ÿСʱ������������',
  maxpostsperhour tinyint(3) unsigned NOT NULL default '0' COMMENT 'ÿСʱ������������',
  attachextensions char(100) NOT NULL default '' COMMENT '������ĸ�������',
  raterange char(150) NOT NULL default '' COMMENT '���ַ�Χ',
  mintradeprice smallint(6) unsigned NOT NULL default '1' COMMENT '������С����',
  maxtradeprice smallint(6) unsigned NOT NULL default '0' COMMENT '����������',
  minrewardprice smallint(6) unsigned NOT NULL default '1' COMMENT '������С����',
  maxrewardprice smallint(6) unsigned NOT NULL default '0' COMMENT '����������',
  magicsdiscount tinyint(1) NOT NULL COMMENT '�����ۿ�',
  maxmagicsweight smallint(6) unsigned NOT NULL COMMENT '���߸������ֵ',
  allowpostdebate tinyint(1) NOT NULL default '0' COMMENT '���������',
  tradestick tinyint(1) unsigned NOT NULL COMMENT '����Ʒ�Ƽ���',
  exempt tinyint(1) unsigned NOT NULL COMMENT '�û�����ʽ',
  maxattachnum smallint(6) NOT NULL default '0' COMMENT '���ÿ�츽������',
  allowposturl tinyint(1) NOT NULL default '3' COMMENT '�Ƿ������ͺ� url ����',
  allowrecommend tinyint(1) unsigned NOT NULL default '1' COMMENT '�Ƿ�������������',
  allowpostrushreply TINYINT(1) NOT NULL DEFAULT '0' COMMENT '��������¥��',
  maxfriendnum smallint(6) unsigned NOT NULL default '0' COMMENT '��������',
  maxspacesize int(10) unsigned NOT NULL default '0' COMMENT '�ռ��С',
  allowcomment tinyint(1) NOT NULL default '0' COMMENT '��������/����',
  allowcommentarticle smallint(6) NOT NULL default '0' COMMENT '�������µ�����',
  searchinterval smallint(6) unsigned NOT NULL default '0' COMMENT '���������������',
  searchignore tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��������',
  allowblog tinyint(1) NOT NULL default '0' COMMENT '������־',
  allowdoing tinyint(1) NOT NULL default '0' COMMENT '�����¼',
  allowupload tinyint(1) NOT NULL default '0' COMMENT '�ϴ�ͼƬ',
  allowshare tinyint(1) NOT NULL default '0' COMMENT '��������',
  allowblogmod tinyint(1) unsigned NOT NULL default '0' COMMENT '������־��Ҫ���',
  allowdoingmod tinyint(1) unsigned NOT NULL default '0' COMMENT '�����¼��Ҫ���',
  allowuploadmod tinyint(1) unsigned NOT NULL default '0' COMMENT '�ϴ�ͼƬ��Ҫ���',
  allowsharemod tinyint(1) unsigned NOT NULL default '0' COMMENT '����������Ҫ���',
  allowcss tinyint(1) NOT NULL default '0' COMMENT '�����Զ���CSS',
  allowpoke tinyint(1) NOT NULL default '0' COMMENT '������к�',
  allowfriend tinyint(1) NOT NULL default '0' COMMENT '����Ӻ���',
  allowclick tinyint(1) NOT NULL default '0' COMMENT '�����̬',
  allowmagic tinyint(1) NOT NULL default '0' COMMENT '����ʹ�õ���',
  allowstat tinyint(1) NOT NULL default '0' COMMENT '����鿴����ͳ��',
  allowstatdata tinyint(1) NOT NULL default '0' COMMENT '����鿴ͳ�����ݱ���',
  videophotoignore tinyint(1) NOT NULL default '0' COMMENT '��Ƶ��֤����',
  allowviewvideophoto tinyint(1) NOT NULL default '0' COMMENT '����鿴��Ƶ��֤',
  allowmyop tinyint(1) NOT NULL default '0' COMMENT '����ʹ��Ӧ��',
  magicdiscount tinyint(1) NOT NULL default '0' COMMENT '��������ۿ�',
  domainlength smallint(6) unsigned NOT NULL default '0' COMMENT '����������̳���',
  seccode tinyint(1) NOT NULL default '1' COMMENT '��������������֤��',
  disablepostctrl tinyint(1) NOT NULL DEFAULT '0' COMMENT '�����Ƿ��ܷ���ˮ����',
  allowbuildgroup tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�������Ⱥ�飬0Ϊ������',
  allowgroupdirectpost tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�����ֱ����Ⱥ���з���',
  allowgroupposturl tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ�������Ⱥ���з�վ��URL',
  edittimelimit smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '�༭����ʱ������',
  allowpostarticle tinyint(1) NOT NULL default '0' COMMENT '����������',
  allowdownlocalimg tinyint(1) NOT NULL default '0' COMMENT '�������ر���ͼƬ',
  allowdownremoteimg tinyint(1) NOT NULL default '0' COMMENT '��������Զ��ͼƬ',
  allowpostarticlemod tinyint(1) unsigned NOT NULL default '0' COMMENT '���������Ƿ���Ҫ���',
  allowspacediyhtml tinyint(1) NOT NULL default '0' COMMENT '�����Զ���ģ��ʹ��HTML',
  allowspacediybbcode tinyint(1) NOT NULL default '0' COMMENT '�����Զ���ģ��ʹ��BBCODE',
  allowspacediyimgcode tinyint(1) NOT NULL default '0' COMMENT '�����Զ���ģ��ʹ��[img]',
  allowcommentpost tinyint(1) NOT NULL default '2' COMMENT '�������ӵ��� 0:��ֹ 1:¥�� 2:�ظ� 3:All',
  allowcommentitem tinyint(1) NOT NULL default '0' COMMENT '����������۵�',
  allowcommentreply tinyint(1) NOT NULL default '0' COMMENT '������ظ�����',
  allowreplycredit tinyint(1) NOT NULL default '0' COMMENT '�������û�������',
  ignorecensor tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ����Ҫ��˵Ĺؼ���',
  allowsendallpm tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ��ܡ�ֻ���պ��Ѷ���Ϣ�����õ�����',
  allowsendpmmaxnum smallint(6) unsigned NOT NULL default '0' COMMENT '24Сʱ����������Ϣ������',
  maximagesize mediumint(8) unsigned NOT NULL default '0' COMMENT '������������ͼƬ��С',
  allowmediacode tinyint(1) NOT NULL default '0' COMMENT '����ʹ�ö�ý�����',
  allowat smallint(6) unsigned NOT NULL default '0' COMMENT '����@�û� 0����ֹ n:����ʱ@������',
  allowsetpublishdate tinyint(1) unsigned NOT NULL default '0' COMMENT '����ʱ��������',
  allowfollowcollection tinyint(1) unsigned NOT NULL default '0' COMMENT '�����ע��ר����',
  allowcommentcollection tinyint(1) unsigned NOT NULL default '0' COMMENT '����������ר��',
  allowcreatecollection smallint(6) unsigned NOT NULL default '0' COMMENT '��������ר����',
  PRIMARY KEY  (groupid)
) ENGINE=MyISAM COMMENT='��Ա�û���Ȩ�ޱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_word'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_word;
CREATE TABLE pre_common_word (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '�ʻ�id',
  admin varchar(15) NOT NULL default '' COMMENT '����Ա��',
  type smallint(6) NOT NULL default '1' COMMENT '�ؼ��ʷ���',
  find varchar(255) NOT NULL default '' COMMENT '��������',
  replacement varchar(255) NOT NULL default '' COMMENT '�滻����',
  extra varchar(255) NOT NULL default '',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='������˱�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_word_type'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_word_type;
CREATE TABLE pre_common_word_type (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '������˷���id',
  typename varchar(15) NOT NULL default '' COMMENT '��������',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='������˷���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_tag'
--
-- ����ʱ��: 2010 �� 11 �� 09 �� 14:47
-- ������ʱ��: 2010 �� 11 �� 09 �� 14:47
--

DROP TABLE IF EXISTS pre_common_tag;
CREATE TABLE pre_common_tag (
  tagid smallint(6) unsigned NOT NULL auto_increment COMMENT '��ǩid',
  tagname char(20) NOT NULL default '' COMMENT '��ǩ��',
  status tinyint(1) NOT NULL default '0' COMMENT '��ʾ״̬\n(0:���� 1:�ر� 2:�Ƽ� 3:�û���ǩ)',
  PRIMARY KEY  (tagid),
  KEY tagname (tagname),
  KEY status (status, tagid)
) ENGINE=MyISAM COMMENT='��ǩ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_tagitem'
--
-- ����ʱ��: 2010 �� 11 �� 09 �� 14:47
-- ������ʱ��: 2010 �� 11 �� 09 �� 14:47
--

DROP TABLE IF EXISTS pre_common_tagitem;
CREATE TABLE pre_common_tagitem (
  tagid smallint(6) unsigned NOT NULL default '0' COMMENT '��ǩid',
  itemid mediumint(8) unsigned NOT NULL default '0' COMMENT 'itemid',
  idtype char(10) NOT NULL default '' COMMENT '��������',
  UNIQUE KEY item (tagid, itemid, idtype),
  KEY idtype (idtype, itemid)
) ENGINE=MyISAM COMMENT='��ǩ���ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_access'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_access;
CREATE TABLE pre_forum_access (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̳id',
  allowview tinyint(1) NOT NULL default '0' COMMENT '�������',
  allowpost tinyint(1) NOT NULL default '0' COMMENT '������',
  allowreply tinyint(1) NOT NULL default '0' COMMENT '����ظ�',
  allowgetattach tinyint(1) NOT NULL default '0' COMMENT '�������ظ���',
  allowgetimage tinyint(1) NOT NULL default '0' COMMENT '����鿴ͼƬ',
  allowpostattach tinyint(1) NOT NULL default '0' COMMENT '�����ϴ�����',
  allowpostimage tinyint(1) NOT NULL default '0' COMMENT '�����ϴ�ͼƬ',
  adminuser mediumint(8) unsigned NOT NULL default '0' COMMENT '����Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'ʱ��',
  PRIMARY KEY  (uid,fid),
  KEY listorder (fid,dateline)
) ENGINE=MyISAM COMMENT='����Ȩ�ޱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_activity'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_activity;
CREATE TABLE pre_forum_activity (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ͼƬid',
  cost mediumint(8) unsigned NOT NULL default '0' COMMENT 'ÿ�˻���',
  starttimefrom int(10) unsigned NOT NULL default '0' COMMENT '��ʼʱ��',
  starttimeto int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  place varchar(255) NOT NULL default '' COMMENT '�ص�',
  class varchar(255) NOT NULL default '' COMMENT '���',
  gender tinyint(1) NOT NULL default '0' COMMENT '�Ա�',
  number smallint(5) unsigned NOT NULL default '0' COMMENT '����',
  applynumber smallint(5) unsigned NOT NULL default '0' COMMENT '�Ѳμ�����',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '������ֹ����',
  ufield TEXT NOT NULL COMMENT '�û�������Ŀ',
  credit smallint(6) unsigned NOT NULL default '0' COMMENT '�����ĵĻ���',
  PRIMARY KEY  (tid),
  KEY uid (uid,starttimefrom),
  KEY starttimefrom (starttimefrom),
  KEY expiration (expiration),
  KEY applynumber (applynumber)
) ENGINE=MyISAM COMMENT='���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_activityapply'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_activityapply;
CREATE TABLE pre_forum_activityapply (
  applyid int(10) unsigned NOT NULL auto_increment COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  username varchar(255) NOT NULL default '' COMMENT '�û���',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  message varchar(255) NOT NULL default '' COMMENT '��Ϣ',
  verified tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����ͨ��\n(0:N 1:Y 2:����������)',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  payment mediumint(8) NOT NULL default '0' COMMENT 'ÿ�˻���',
  ufielddata TEXT NOT NULL COMMENT '�û�������Ŀ����',
  PRIMARY KEY  (applyid),
  KEY uid (uid),
  KEY tid (tid),
  KEY dateline (tid,dateline)
) ENGINE=MyISAM COMMENT='������';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_forum_announcement'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_announcement;
CREATE TABLE pre_forum_announcement (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '����id',
  author varchar(15) NOT NULL default '' COMMENT '��������',
  `subject` varchar(255) NOT NULL default '' COMMENT '�������',
  `type` tinyint(1) NOT NULL default '0' COMMENT '��������\n(0:���ֹ��� 1:��ַ����)',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳��',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '��ʼʱ��',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  message text NOT NULL COMMENT '��Ϣ',
  groups text NOT NULL COMMENT '�����û���',
  PRIMARY KEY  (id),
  KEY timespan (starttime,endtime)
) ENGINE=MyISAM COMMENT='�����';

DROP TABLE IF EXISTS pre_forum_threadimage;
CREATE TABLE pre_forum_threadimage (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  KEY tid (tid)
) ENGINE=MyISAM COMMENT='����ͼƬ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_attachment'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_attachment;
CREATE TABLE pre_forum_attachment (
  aid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  tableid tinyint(1) unsigned NOT NULL default '0' COMMENT '������id',
  downloads mediumint(8) NOT NULL default '0' COMMENT '���ش���',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='����������';

DROP TABLE IF EXISTS pre_forum_attachment_exif;
CREATE TABLE pre_forum_attachment_exif (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  exif text NOT NULL COMMENT 'exif��Ϣ',
  PRIMARY KEY (aid)
) ENGINE=MyISAM COMMENT='Exif�����';

DROP TABLE IF EXISTS pre_forum_attachment_unused;
CREATE TABLE pre_forum_attachment_unused (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  PRIMARY KEY (aid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='δʹ�ø�����';

DROP TABLE IF EXISTS pre_forum_attachment_0;
CREATE TABLE pre_forum_attachment_0 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_1;
CREATE TABLE pre_forum_attachment_1 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_2;
CREATE TABLE pre_forum_attachment_2 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_3;
CREATE TABLE pre_forum_attachment_3 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_4;
CREATE TABLE pre_forum_attachment_4 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_5;
CREATE TABLE pre_forum_attachment_5 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_6;
CREATE TABLE pre_forum_attachment_6 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_7;
CREATE TABLE pre_forum_attachment_7 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_8;
CREATE TABLE pre_forum_attachment_8 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';

DROP TABLE IF EXISTS pre_forum_attachment_9;
CREATE TABLE pre_forum_attachment_9 (
  aid mediumint(8) unsigned NOT NULL COMMENT '����id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  description varchar(255) NOT NULL COMMENT '˵��',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '�����۸�',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  picid mediumint(8) NOT NULL default '0' COMMENT '���ͼƬID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='������';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_attachtype'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_attachtype;
CREATE TABLE pre_forum_attachtype (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '����id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̳id',
  extension char(12) NOT NULL default '' COMMENT '��չ��',
  maxsize int(10) unsigned NOT NULL default '0' COMMENT '�����ϴ����ֵ',
  PRIMARY KEY  (id),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='�������ͱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_bbcode'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_bbcode;
CREATE TABLE pre_forum_bbcode (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����\n(0:������ 1:���õ�����ʾ 2:���ò���ʾ)',
  tag varchar(100) NOT NULL default '' COMMENT '��ǩ',
  icon varchar(255) NOT NULL COMMENT 'ͼ��',
  replacement text NOT NULL COMMENT '�滻����',
  example varchar(255) NOT NULL default '' COMMENT '����',
  explanation text NOT NULL COMMENT '����˵��',
  params tinyint(1) unsigned NOT NULL default '1' COMMENT '��������',
  prompt text NOT NULL COMMENT '��ǩ����',
  nest tinyint(3) unsigned NOT NULL default '1' COMMENT 'Ƕ�ײ��',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳��',
  perm text NOT NULL COMMENT '��Ȩʹ�õ��û���',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='Discuz! �����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_creditslog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_creditslog;
CREATE TABLE pre_forum_creditslog (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  fromto char(15) NOT NULL default '' COMMENT '����/��',
  sendcredits tinyint(1) NOT NULL default '0' COMMENT 'ת�������ֶ�',
  receivecredits tinyint(1) NOT NULL default '0' COMMENT '���ܻ����ֶ�',
  send int(10) unsigned NOT NULL default '0' COMMENT 'ת������',
  receive int(10) unsigned NOT NULL default '0' COMMENT '���ܻ���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'ת������',
  operation char(3) NOT NULL default '' COMMENT '����',
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='ת�ʼ�¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_debate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_debate;
CREATE TABLE pre_forum_debate (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������id',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '��ʼʱ��',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  affirmdebaters mediumint(8) unsigned NOT NULL default '0' COMMENT '������������',
  negadebaters mediumint(8) unsigned NOT NULL default '0' COMMENT '������������',
  affirmvotes mediumint(8) unsigned NOT NULL default '0' COMMENT '������Ʊ��',
  negavotes mediumint(8) unsigned NOT NULL default '0' COMMENT '������Ʊ��',
  umpire varchar(15) NOT NULL default '' COMMENT '�����û���',
  winner tinyint(1) NOT NULL default '0' COMMENT '��ʤ��\n(0:ƽ�� 1:Ϊ���� 2:Ϊ����)\n�������н��',
  bestdebater varchar(50) NOT NULL default '' COMMENT '��ѱ����û���',
  affirmpoint text NOT NULL COMMENT '�����۵�',
  negapoint text NOT NULL COMMENT '�����۵�',
  umpirepoint text NOT NULL COMMENT '���й۵㣬���н�������ʱ��д',
  affirmvoterids text NOT NULL COMMENT '����ͶƱ�˵� id ����',
  negavoterids text NOT NULL COMMENT '����ͶƱ�˵� id ����',
  affirmreplies mediumint(8) unsigned NOT NULL COMMENT '�����ظ�������������ҳ',
  negareplies mediumint(8) unsigned NOT NULL COMMENT '�����ظ�������������ҳ',
  PRIMARY KEY  (tid),
  KEY uid (uid,starttime)
) ENGINE=MyISAM COMMENT='���������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_debatepost'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_debatepost;
CREATE TABLE pre_forum_debatepost (
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  stand tinyint(1) NOT NULL default '0' COMMENT '����\n(0:���� 1:���� 2:Ϊ����)',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�����ʱ��',
  voters mediumint(10) unsigned NOT NULL default '0' COMMENT 'ͶƱ����',
  voterids text NOT NULL COMMENT 'ͶƱ�˵� id ����',
  PRIMARY KEY  (pid),
  KEY pid (pid,stand),
  KEY tid (tid,uid)
) ENGINE=MyISAM COMMENT='�������ӱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_faq'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_faq;
CREATE TABLE pre_forum_faq (
  id smallint(6) NOT NULL auto_increment COMMENT '����id',
  fpid smallint(6) unsigned NOT NULL default '0' COMMENT '������id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '����',
  identifier varchar(20) NOT NULL COMMENT '������ʶ',
  keyword varchar(50) NOT NULL COMMENT '�����ؼ���',
  title varchar(50) NOT NULL COMMENT '��������',
  message text NOT NULL COMMENT '��������',
  PRIMARY KEY  (id),
  KEY displayplay (displayorder)
) ENGINE=MyISAM COMMENT='��̳������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_postcache'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_postcache;
CREATE TABLE pre_forum_postcache (
  pid int(10) unsigned NOT NULL,
  comment text NOT NULL,
  rate text NOT NULL,
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='��̳���ӻ����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_favorite'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_favorite;
CREATE TABLE pre_home_favorite (
  favid mediumint(8) unsigned NOT NULL auto_increment COMMENT '�ղ�id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  id mediumint(8) unsigned NOT NULL default '0',
  idtype varchar(255) NOT NULL default '',
  spaceuid mediumint(8) unsigned NOT NULL default '0' COMMENT '�ռ��Աid',
  title varchar(255) NOT NULL default '',
  description text NOT NULL,
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (favid),
  KEY idtype (id,idtype),
  KEY uid (uid,idtype,dateline)
) ENGINE=MyISAM COMMENT='�ղر�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_forum'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_forum;
CREATE TABLE pre_forum_forum (
  fid mediumint(8) unsigned NOT NULL auto_increment COMMENT '��̳id',
  fup mediumint(8) unsigned NOT NULL default '0' COMMENT '�ϼ���̳id',
  `type` enum('group','forum','sub') NOT NULL default 'forum' COMMENT '����\n(group:���� forum:��ͨ��̳ sub:����̳)',
  `name` char(50) NOT NULL default '' COMMENT '����',
  `status` tinyint(1) NOT NULL default '0' COMMENT '��ʾ״̬\n(0:���� 1:���� 3:Ⱥ��)',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  styleid smallint(6) unsigned NOT NULL default '0' COMMENT '���id',
  threads mediumint(8) unsigned NOT NULL default '0' COMMENT '��������',
  posts mediumint(8) unsigned NOT NULL default '0' COMMENT '��������',
  todayposts mediumint(8) unsigned NOT NULL default '0' COMMENT '���շ�������',
  lastpost char(110) NOT NULL default '' COMMENT '��󷢱�',
  domain char(15) NOT NULL default '' COMMENT '�󶨵Ķ�������',
  allowsmilies tinyint(1) NOT NULL default '0' COMMENT '����ʹ�ñ���',
  allowhtml tinyint(1) NOT NULL default '0' COMMENT '����ʹ��html',
  allowbbcode tinyint(1) NOT NULL default '0' COMMENT '����bbcode',
  allowimgcode tinyint(1) NOT NULL default '0' COMMENT '����img',
  allowmediacode tinyint(1) NOT NULL default '0' COMMENT '����ʹ�ö�ý�����',
  allowanonymous tinyint(1) NOT NULL default '0' COMMENT '��������',
  allowpostspecial smallint(6) unsigned NOT NULL default '0' COMMENT '��������������',
  allowspecialonly tinyint(1) unsigned NOT NULL default '0' COMMENT 'ֻ��������������',
  allowappend tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ������Ӳ���',
  alloweditrules tinyint(1) NOT NULL default '0' COMMENT '��������޸���̳����',
  allowfeed tinyint(1) NOT NULL default '1' COMMENT '�������Ͷ�̬,Ĭ�����͹㲥',
  allowside tinyint(1) NOT NULL default '0' COMMENT '��ʾ����',
  recyclebin tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����û���վ',
  modnewposts tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���˷���',
  jammer tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����ø�����',
  disablewatermark tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ��������ˮӡ',
  inheritedmod tinyint(1) NOT NULL default '0' COMMENT '����̳����������Ȩ���̳е��¼���̳',
  autoclose smallint(6) NOT NULL default '0' COMMENT '�Զ��ر�����',
  forumcolumns tinyint(3) unsigned NOT NULL default '0' COMMENT '������̳ˮƽ��������',
  catforumcolumns tinyint(3) unsigned NOT NULL default '0' COMMENT '���ӷ������ˮƽ��������',
  threadcaches tinyint(1) NOT NULL default '0' COMMENT '���⻺�湦������',
  alloweditpost tinyint(1) unsigned NOT NULL default '1' COMMENT '����༭����',
  `simple` tinyint(1) unsigned NOT NULL default '0' COMMENT 'ֻ��ʾ�Ӱ��',
  modworks tinyint(1) unsigned NOT NULL default '0' COMMENT '�����д�����Ĺ�������',
  allowglobalstick tinyint(1) NOT NULL default '1' COMMENT '�Ƿ���ʾȫ���ö�',
  level smallint(6) NOT NULL default '0' COMMENT 'Ⱥ��ȼ�',
  commoncredits int(10) unsigned NOT NULL default '0' COMMENT 'Ⱥ�鹫������',
  `archive` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��д浵��',
  recommend smallint(6) unsigned NOT NULL default '0' COMMENT '�Ƽ����İ��',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '����Ⱥ����ղش���',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '����Ⱥ��ķ������',
  disablethumb tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��������ͼ',
  disablecollect tinyint(1) NOT NULL default '0' COMMENT '��ֹ����',
  PRIMARY KEY  (fid),
  KEY forum (`status`,`type`,displayorder),
  KEY fup_type (`fup`,`type`,displayorder),
  KEY fup (fup)
) ENGINE=MyISAM COMMENT='����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_forumfield'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_forumfield;
CREATE TABLE pre_forum_forumfield (
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '���id',
  description text NOT NULL COMMENT '����˵��',
  `password` varchar(12) NOT NULL default '' COMMENT '˽����̳����',
  icon varchar(255) NOT NULL default '' COMMENT 'ͼ��',
  redirect varchar(255) NOT NULL default '' COMMENT 'URLת��',
  attachextensions varchar(255) NOT NULL default '' COMMENT '�����ϴ���������',
  creditspolicy mediumtext NOT NULL COMMENT '�����ֲ���',
  formulaperm text NOT NULL COMMENT '���Ȩ�ޱ��ʽ',
  moderators text NOT NULL COMMENT '�����б���ʽ:admin',
  rules text NOT NULL COMMENT '������',
  threadtypes text NOT NULL COMMENT '������࣬���л���ŵ����ã���ʽΪһ������',
  threadsorts text NOT NULL COMMENT '������Ϣ�����л���ŵ����ã���ʽΪһ������',
  viewperm text NOT NULL COMMENT '�Ķ�Ȩ��, ��ʽ:	1	4	5',
  postperm text NOT NULL COMMENT '����Ȩ��, ��ʽ:	1	4	5',
  replyperm text NOT NULL COMMENT '�ظ�Ȩ��, ��ʽ:	1	4	5',
  getattachperm text NOT NULL COMMENT '���ظ���Ȩ��, ��ʽ:	1	4	5',
  postattachperm text NOT NULL COMMENT '�ϴ�����Ȩ��, ��ʽ:	1	4	5',
  postimageperm text NOT NULL COMMENT '�ϴ�ͼƬȨ��, ��ʽ:	1	4	5',
  spviewperm text NOT NULL COMMENT '�������ڰ�ȨȨ�ޱ��ʽ, ��ʽ:	1	4	5',
  seotitle text NOT NULL COMMENT '���seo����',
  keywords text NOT NULL COMMENT '���seo�ؼ���',
  seodescription text NOT NULL COMMENT '���seo����',
  supe_pushsetting text NOT NULL COMMENT 'supe�������ã����л�����������ݣ���ʽΪһ�����顣',
  modrecommend text NOT NULL COMMENT '�����Ƽ�����',
  threadplugin text NOT NULL COMMENT '��������������',
  extra TEXT NOT NULL,
  jointype tinyint(1) NOT NULL default '0' COMMENT '����Ⱥ�鷽ʽ -1Ϊ�رգ�0Ϊ������ 2����',
  gviewperm tinyint(1) unsigned NOT NULL default '0' COMMENT 'Ⱥ�����Ȩ�� 0:����Ա 1:�����û�',
  membernum smallint(6) unsigned NOT NULL default '0' COMMENT 'Ⱥ���Ա��',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'Ⱥ�鴴��ʱ��',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT 'Ⱥ��������ʱ��',
  activity int(10) unsigned NOT NULL default '0' COMMENT 'Ⱥ���Ծ��',
  founderuid mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ⱥ�鴴ʼ��UID',
  foundername varchar(255) NOT NULL default '' COMMENT 'Ⱥ�鴴ʼ������',
  banner varchar(255) NOT NULL default '' COMMENT 'Ⱥ��ͷͼƬ',
  groupnum smallint(6) unsigned NOT NULL default '0' COMMENT '�����µ�Ⱥ������',
  commentitem TEXT NOT NULL,
  relatedgroup TEXT NOT NULL,
  picstyle tinyint(1) NOT NULL default '0' COMMENT '�����б��Ƿ���ͼƬ��ʽ��ʾ 0:�� 1:��',
  widthauto tinyint(1) NOT NULL default '0' COMMENT 'Ĭ���Ƿ���� 0:ȫ�� -1:���� 1:խ��',
  PRIMARY KEY  (fid),
  KEY membernum (membernum),
  KEY dateline (dateline),
  KEY lastupdate (lastupdate),
  KEY activity (activity)
) ENGINE=MyISAM COMMENT='�����չ��';

-- --------------------------------------------------------

--
-- ��Ľṹ `pre_forum_forum_threadtable`
--

DROP TABLE IF EXISTS pre_forum_forum_threadtable;
CREATE TABLE pre_forum_forum_threadtable (
  `fid` smallint(6) unsigned NOT NULL COMMENT '���id',
  `threadtableid` smallint(6) unsigned NOT NULL COMMENT 'thread����id',
  `threads` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '������',
  `posts` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '������',
  PRIMARY KEY (`fid`,`threadtableid`)
) ENGINE=MyISAM COMMENT='���浵��Ϣ';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_forumrecommend'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_forumrecommend;
CREATE TABLE pre_forum_forumrecommend (
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '���id',
  tid mediumint(8) unsigned NOT NULL COMMENT '����id',
  typeid smallint(6) NOT NULL COMMENT '�Ƿ��и���ͼƬ',
  displayorder tinyint(1) NOT NULL COMMENT '�Ƽ�˳��',
  `subject` char(80) NOT NULL COMMENT '�Ƽ��������',
  author char(15) NOT NULL COMMENT '�Ƽ���������',
  authorid mediumint(8) NOT NULL COMMENT '�Ƽ���������id',
  moderatorid mediumint(8) NOT NULL COMMENT '�Ƽ�������Աid',
  expiration int(10) unsigned NOT NULL COMMENT '�Ƽ�������Ч��',
  position tinyint(1) NOT NULL default '0' COMMENT '��ʾλ��',
  highlight tinyint(1) NOT NULL default '0' COMMENT '������ɫ',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ID',
  filename char(100) NOT NULL default '' COMMENT '�����ļ�',
  PRIMARY KEY  (tid),
  KEY displayorder (fid,displayorder),
  KEY position (position)
) ENGINE=MyISAM COMMENT='�����Ƽ���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_imagetype'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_imagetype;
CREATE TABLE pre_forum_imagetype (
  typeid smallint(6) unsigned NOT NULL auto_increment COMMENT '����id',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  `name` char(20) NOT NULL COMMENT '��������',
  `type` enum('smiley','icon','avatar') NOT NULL default 'smiley' COMMENT '��������\n(smiley:���� icon:ͼ�� avatar:ͷ��)',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '����˳��',
  `directory` char(100) NOT NULL COMMENT 'ͼƬĿ¼',
  PRIMARY KEY  (typeid)
) ENGINE=MyISAM COMMENT='ͼƬ ���� ͷ��� ����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_medal'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_medal;
CREATE TABLE pre_forum_medal (
  medalid smallint(6) unsigned NOT NULL auto_increment COMMENT 'ѫ��id',
  `name` varchar(50) NOT NULL default '' COMMENT 'ѫ������',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  image varchar(255) NOT NULL default '' COMMENT 'ѫ��ͼƬ',
  `type` tinyint(1) NOT NULL default '0' COMMENT 'ѫ������',
  displayorder tinyint(3) NOT NULL default '0' COMMENT 'ѫ����ʾ˳��',
  description varchar(255) NOT NULL COMMENT 'ѫ������',
  expiration smallint(6) unsigned NOT NULL default '0' COMMENT 'ѫ����Ч��',
  permission mediumtext NOT NULL COMMENT 'ѫ�»���������ʽ',
  `credit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'ѫ�¹���ʹ�û���',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ѫ�¼۸�',
  PRIMARY KEY  (medalid),
  KEY displayorder (displayorder),
  KEY `available` (`available`,`displayorder`)
) ENGINE=MyISAM COMMENT='ѫ�±�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_medallog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_medallog;
CREATE TABLE pre_forum_medallog (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '��¼id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ѫ��ӵ�����û�id',
  medalid smallint(6) unsigned NOT NULL default '0' COMMENT 'ѫ��id',
  `type` tinyint(1) NOT NULL default '0' COMMENT 'ѫ������id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�䷢ʱ��id',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '��Ч��id',
  `status` tinyint(1) NOT NULL default '0' COMMENT 'ѫ��״̬id',
  PRIMARY KEY  (id),
  KEY `type` (`type`),
  KEY `status` (`status`,expiration),
  KEY uid (uid,medalid,`type`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM COMMENT='ѫ����־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_magic'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_magic;
CREATE TABLE pre_common_member_magic (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�uid',
  magicid smallint(6) unsigned NOT NULL default '0' COMMENT '����id',
  num smallint(6) unsigned NOT NULL default '0' COMMENT 'ӵ������',
   PRIMARY KEY (uid,magicid)
) ENGINE=MyISAM COMMENT='�û��������ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_member_medal'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_member_medal;
CREATE TABLE pre_common_member_medal (
  uid mediumint(8) unsigned NOT NULL,
  medalid smallint(6) unsigned NOT NULL,
  PRIMARY KEY (uid,medalid)
) ENGINE=MyISAM COMMENT='�û�ѫ�����ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_memberrecommend'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_memberrecommend;
CREATE TABLE pre_forum_memberrecommend (
  tid mediumint(8) unsigned NOT NULL COMMENT '����ID',
  recommenduid mediumint(8) unsigned NOT NULL COMMENT '�Ƽ���ԱID',
  dateline int(10) unsigned NOT NULL COMMENT '�Ƽ�ʱ��',
  KEY tid (tid),
  KEY uid (recommenduid)
) ENGINE=MyISAM COMMENT='�û��Ƽ���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_moderator'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_moderator;
CREATE TABLE pre_forum_moderator (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̳id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳��',
  inherited tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�̳�',
  PRIMARY KEY  (uid,fid)
) ENGINE=MyISAM COMMENT='������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_modwork'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_modwork;
CREATE TABLE pre_forum_modwork (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  modaction char(3) NOT NULL default '' COMMENT '����',
  dateline date NOT NULL default '2006-01-01' COMMENT 'ʱ���',
  count smallint(6) unsigned NOT NULL default '0' COMMENT '��¼����',
  posts smallint(6) unsigned NOT NULL default '0' COMMENT '������',
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='��̳����ͳ�Ʊ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_mytask'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_mytask;
CREATE TABLE pre_common_mytask (
  uid mediumint(8) unsigned NOT NULL COMMENT '�û�Uid',
  username char(15) NOT NULL default '' COMMENT '�û���',
  taskid smallint(6) unsigned NOT NULL COMMENT '����id',
  `status` tinyint(1) NOT NULL default '0' COMMENT '����״̬\n(-1:ʧ�� 0:������ 1:�����)',
  csc char(255) NOT NULL default '' COMMENT '�������',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��������ʱ��',
  PRIMARY KEY  (uid,taskid),
  KEY parter (taskid,dateline)
) ENGINE=MyISAM COMMENT='�ҵ������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_onlinelist'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_onlinelist;
CREATE TABLE pre_forum_onlinelist (
  groupid smallint(6) unsigned NOT NULL default '0' COMMENT '��Ա��id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳��',
  title varchar(30) NOT NULL default '' COMMENT '������',
  url varchar(30) NOT NULL default '' COMMENT 'ͼ��URL'
) ENGINE=MyISAM COMMENT='�����б���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_order'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_order;
CREATE TABLE pre_forum_order (
  orderid char(32) NOT NULL default '' COMMENT '������id',
  `status` char(3) NOT NULL default '' COMMENT '״̬',
  buyer char(50) NOT NULL default '' COMMENT '����������',
  admin char(15) NOT NULL default '' COMMENT '��������Ա����',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������id',
  amount int(10) unsigned NOT NULL default '0' COMMENT '����',
  price float(7,2) unsigned NOT NULL default '0.00' COMMENT '�۸�',
  submitdate int(10) unsigned NOT NULL default '0' COMMENT '�ύ����',
  confirmdate int(10) unsigned NOT NULL default '0' COMMENT 'ȷ������',
  email char(40) NOT NULL default '' COMMENT '����ʱ��Email',
  ip char(15) NOT NULL default '' COMMENT '����ʱ��IP',
  UNIQUE KEY orderid (orderid),
  KEY submitdate (submitdate),
  KEY uid (uid,submitdate)
) ENGINE=MyISAM COMMENT='������Ϣ��';


-- --------------------------------------------------------

--
-- ��Ľṹ `pre_forum_groupfield`
--

DROP TABLE IF EXISTS pre_forum_groupfield;
CREATE TABLE pre_forum_groupfield (
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ⱥ�����fid',
  privacy tinyint(1) unsigned NOT NULL default '0' COMMENT 'Ⱥ����˽����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��������ʱ��',
  type varchar(255) NOT NULL COMMENT '��������',
  data text NOT NULL COMMENT '��������',
  UNIQUE KEY types (fid,type),
  KEY fid (fid),
  KEY type (type)
) ENGINE = MyISAM COMMENT='Ⱥ����չ��Ϣ����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_paymentlog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_groupinvite;
CREATE TABLE pre_forum_groupinvite (
  fid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT 'Ⱥ��id',
  uid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '������id',
  inviteuid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '��������id',
  dateline INT( 10 ) UNSIGNED NOT NULL default '0' COMMENT '����ʱ��',
  UNIQUE KEY ids (fid,inviteuid),
  KEY dateline (dateline)
) ENGINE = MYISAM COMMENT='Ⱥ������';

-- --------------------------------------------------------

--
-- ��Ľṹ `pre_forum_groupranking`
--

DROP TABLE IF EXISTS pre_forum_groupranking;
CREATE TABLE pre_forum_groupranking (
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ⱥ��id',
  yesterday smallint(6) unsigned NOT NULL default '0' COMMENT '��������',
  today smallint(6) unsigned NOT NULL default '0' COMMENT '��������',
  trend tinyint(1) NOT NULL default '0' COMMENT '��������',
  PRIMARY KEY (fid),
  KEY today (today)
) ENGINE = MyISAM COMMENT='Ⱥ������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_groupuser'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_groupuser;
CREATE TABLE pre_forum_groupuser (
  fid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT 'Ⱥ�����fid',
  uid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '��Աid',
  username CHAR( 15 ) NOT NULL COMMENT '��Ա��',
  level TINYINT( 3 ) UNSIGNED NOT NULL default '0' COMMENT '��Ա�ȼ�\n(0:����� 1:Ⱥ�� 2:��Ⱥ�� 3:���ǳ�Ա 4:��ͨ��Ա)',
  threads MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '��Ա������',
  replies MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '��Ա�ظ���',
  joindateline INT( 10 ) UNSIGNED NOT NULL default '0' COMMENT '��Ա����Ⱥ��ʱ��',
  lastupdate INT( 10 ) UNSIGNED NOT NULL default '0' COMMENT '��Ա���ʱ��',
  privacy TINYINT( 1 ) UNSIGNED NOT NULL default '0' COMMENT '��Ա��˽����',
  PRIMARY KEY (fid,uid),
  KEY uid_lastupdate (uid,lastupdate),
  KEY userlist (fid,level,lastupdate)
) ENGINE = MYISAM COMMENT='Ⱥ���Ա';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_plugin'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_plugin;
CREATE TABLE pre_common_plugin (
  pluginid smallint(6) unsigned NOT NULL auto_increment COMMENT '���id',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  adminid tinyint(1) unsigned NOT NULL default '0' COMMENT '����Աid',
  `name` varchar(40) NOT NULL default '' COMMENT '����',
  identifier varchar(40) NOT NULL default '' COMMENT 'Ψһ��ʶ��',
  description varchar(255) NOT NULL default '' COMMENT '����˵��',
  datatables varchar(255) NOT NULL default '' COMMENT '������ݱ�',
  `directory` varchar(100) NOT NULL default '' COMMENT '���Ŀ¼',
  copyright varchar(100) NOT NULL default '' COMMENT '��Ȩ��Ϣ',
  modules text NOT NULL COMMENT '�����Ϣ',
  version varchar(20) NOT NULL default '' COMMENT '����汾',
  PRIMARY KEY  (pluginid),
  UNIQUE KEY identifier (identifier)
) ENGINE=MyISAM COMMENT='�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_pluginvar'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_pluginvar;
CREATE TABLE pre_common_pluginvar (
  pluginvarid mediumint(8) unsigned NOT NULL auto_increment COMMENT '�������id',
  pluginid smallint(6) unsigned NOT NULL default '0' COMMENT '���id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳��',
  title varchar(100) NOT NULL default '' COMMENT '����',
  description varchar(255) NOT NULL default '' COMMENT '����˵��',
  variable varchar(40) NOT NULL default '' COMMENT '������',
  `type` varchar(20) NOT NULL default 'text' COMMENT '����',
  `value` text NOT NULL COMMENT 'ֵ',
  extra text NOT NULL COMMENT '����',
  PRIMARY KEY  (pluginvarid),
  KEY pluginid (pluginid)
) ENGINE=MyISAM COMMENT='���������';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_thread_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_thread_moderate;
CREATE TABLE pre_forum_thread_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='����������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_post_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_post_moderate;
CREATE TABLE pre_forum_post_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='����������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_blog_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_blog_moderate;
CREATE TABLE pre_home_blog_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='��־������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_pic_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_pic_moderate;
CREATE TABLE pre_home_pic_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='ͼƬ������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_doing_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_doing_moderate;
CREATE TABLE pre_home_doing_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='��¼������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_share_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_share_moderate;
CREATE TABLE pre_home_share_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='����������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_article_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_portal_article_moderate;
CREATE TABLE pre_portal_article_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='����������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_comment_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_comment_moderate;
CREATE TABLE pre_home_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  idtype varchar(15) NOT NULL default '' COMMENT 'ID����',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY idtype (idtype, status, dateline)
) ENGINE=MyISAM COMMENT='��԰����������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_comment_moderate'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_portal_comment_moderate;
CREATE TABLE pre_portal_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  idtype varchar(15) NOT NULL default '' COMMENT 'ID����',
  status tinyint(3) NOT NULL default '0' COMMENT '״̬ 0 ����У�1 �Ѻ���',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY idtype (idtype, status, dateline)
) ENGINE=MyISAM COMMENT='����/ר������������ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_postlog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--
DROP TABLE IF EXISTS pre_forum_postlog;
CREATE TABLE pre_forum_postlog (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pid, tid),
  KEY fid (fid),
  KEY uid (uid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='����������־';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_threadlog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--
DROP TABLE IF EXISTS pre_forum_threadlog;
CREATE TABLE pre_forum_threadlog (
 `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
 `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
 `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
 `otherid` smallint(6) unsigned NOT NULL DEFAULT '0',
 `action` char(10) NOT NULL,
 `expiry` int(10) unsigned NOT NULL DEFAULT '0',
 `dateline` int(10) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (tid,fid,uid),
 KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='����������־';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_threadpreview'
--
-- ����ʱ��: 2011 �� 10 �� 21 �� 18:00
-- ������ʱ��: 2011 �� 10 �� 21 �� 18:00
--

DROP TABLE IF EXISTS pre_forum_threadpreview;
CREATE TABLE pre_forum_threadpreview (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  relay int(10) unsigned NOT NULL default '0' COMMENT 'ת������',
  content text NOT NULL COMMENT '��������Ԥ��',
  PRIMARY KEY (tid)
) ENGINE=MyISAM COMMENT='�����ڹ㲥';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_poll'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_poll;
CREATE TABLE pre_forum_poll (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  overt tinyint(1) NOT NULL default '0' COMMENT '�Ƿ񹫿�ͶƱ������',
  multiple tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��ѡ',
  visible tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͶƱ��ɼ�',
  maxchoices tinyint(3) unsigned NOT NULL default '0' COMMENT '����ѡ����',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  pollpreview varchar(255) NOT NULL default '' COMMENT 'ѡ������ǰ����Ԥ��',
  voters mediumint(8) unsigned NOT NULL default '0' COMMENT 'ͶƱ����',
  PRIMARY KEY  (tid)
) ENGINE=MyISAM COMMENT='ͶƱ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_pollvoter'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_pollvoter;
CREATE TABLE pre_forum_pollvoter (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username varchar(15) NOT NULL default '' COMMENT '��Ա��',
  `options` text NOT NULL COMMENT 'ѡ�� \t �ָ�',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  KEY tid (tid),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='ͶƱ�û���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_polloption'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_polloption;
CREATE TABLE pre_forum_polloption (
  polloptionid int(10) unsigned NOT NULL auto_increment COMMENT 'ѡ��id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  votes mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ʊ��',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '��ʾ˳��',
  polloption varchar(80) NOT NULL default '' COMMENT 'ѡ������',
  voterids mediumtext NOT NULL COMMENT 'ͶƱ��id',
  PRIMARY KEY  (polloptionid),
  KEY tid (tid,displayorder)
) ENGINE=MyISAM COMMENT='ͶƱѡ���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_post'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_post;
CREATE TABLE pre_forum_post (
  pid int(10) unsigned NOT NULL COMMENT '����id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̳id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  `first` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�������',
  author varchar(15) NOT NULL default '' COMMENT '��������',
  authorid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  `subject` varchar(80) NOT NULL default '' COMMENT '����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  message mediumtext NOT NULL COMMENT '��Ϣ',
  useip varchar(15) NOT NULL default '' COMMENT '������IP',
  invisible tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͨ�����',
  anonymous tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  usesig tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����ǩ��',
  htmlon tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����HTML',
  bbcodeoff tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ر�BBCODE',
  smileyoff tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�رձ���',
  parseurloff tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����ճ��URL',
  attachment tinyint(1) NOT NULL default '0' COMMENT '����',
  rate smallint(6) NOT NULL default '0' COMMENT '���ַ���',
  ratetimes tinyint(3) unsigned NOT NULL default '0' COMMENT '���ִ���',
  `status` int(10) NOT NULL default '0' COMMENT '����״̬',
  tags varchar(255) NOT NULL default '0' COMMENT '�����ֶΣ����ڴ��tag',
  `comment` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���ڵ���',
  replycredit int(10) NOT NULL default '0' COMMENT '������û��ּ�¼',
  `position` int(8) unsigned NOT NULL auto_increment COMMENT '����λ����Ϣ',
  PRIMARY KEY  (tid, `position`),
  KEY fid (fid),
  KEY authorid (authorid,invisible),
  KEY dateline (dateline),
  KEY invisible (invisible),
  KEY displayorder (tid,invisible,dateline),
  KEY `first` (tid,`first`),
  UNIQUE KEY pid (pid)
) ENGINE=MyISAM COMMENT='���ӱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ `pre_forum_postcomment`
--

DROP TABLE IF EXISTS pre_forum_postcomment;
CREATE TABLE pre_forum_postcomment (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL default '0' COMMENT '����ID',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '����ID',
  `author` varchar(15) NOT NULL default '' COMMENT '����',
  `authorid` mediumint(8) NOT NULL default '0' COMMENT '����ID x1.5�Ժ�0Ϊ�ο͡�-1Ϊ�۵�',
  `dateline` int(10) unsigned NOT NULL default '0' COMMENT 'ʱ��',
  `comment` varchar(255) NOT NULL default '' COMMENT '��������',
  `score` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���������۵�',
  `useip` varchar(15) NOT NULL default '' COMMENT '������IP',
  `rpid` int(10) unsigned NOT NULL default '0' COMMENT '����������ID',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY authorid (authorid),
  KEY score (score),
  KEY rpid (rpid),
  KEY `pid` (`pid`,`dateline`)
) ENGINE=MyISAM COMMENT='�������ӱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_post_location'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_post_location;
CREATE TABLE pre_forum_post_location (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned DEFAULT '0',
  `uid` mediumint(8) unsigned DEFAULT '0',
  `mapx` varchar(255) NOT NULL,
  `mapy` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM COMMENT='���ӵ���λ�ñ�';

-- --------------------------------------------------------

--
-- ��Ľṹ `pre_forum_post_tableid`
--

DROP TABLE IF EXISTS pre_forum_post_tableid;
CREATE TABLE pre_forum_post_tableid (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Post ID',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM  COMMENT='post�ֱ�Э����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_poststick'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--
DROP TABLE IF EXISTS pre_forum_poststick;
CREATE TABLE pre_forum_poststick (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`,`pid`),
  KEY `dateline` (`tid`,`dateline`)
) ENGINE=MyISAM COMMENT='�����ö���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_promotion'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_promotion;
CREATE TABLE pre_forum_promotion (
  ip char(15) NOT NULL default '' COMMENT 'IP��ַ',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username char(15) NOT NULL default '' COMMENT '��Ա��',
  PRIMARY KEY  (ip)
) ENGINE=MyISAM COMMENT='��̳�ƹ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_ratelog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_ratelog;
CREATE TABLE pre_forum_ratelog (
  pid int(10) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username char(15) NOT NULL default '' COMMENT '��Ա��',
  extcredits tinyint(1) unsigned NOT NULL default '0' COMMENT '�����ֶ�',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  score smallint(6) NOT NULL default '0' COMMENT '����',
  reason char(40) NOT NULL default '' COMMENT '��������',
  KEY pid (pid,dateline),
  KEY dateline (dateline),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='�������ּ�¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_relatedthread'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_relatedthread;
CREATE TABLE pre_forum_relatedthread (
  tid mediumint(8) NOT NULL default '0' COMMENT '����id',
  `type` enum('general','trade') NOT NULL default 'general' COMMENT '�ؼ�������',
  expiration int(10) NOT NULL default '0' COMMENT '����ʱ��',
  keywords varchar(255) NOT NULL default '' COMMENT '�ؼ���',
  relatedthreads text NOT NULL COMMENT '�����������',
  PRIMARY KEY  (tid,`type`)
) ENGINE=MyISAM COMMENT='��������';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_rsscache'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_rsscache;
CREATE TABLE pre_forum_rsscache (
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '������ʱ��',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̳id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  forum char(50) NOT NULL default '' COMMENT '��̳����',
  author char(15) NOT NULL default '' COMMENT '����',
  `subject` char(80) NOT NULL default '' COMMENT '����',
  description char(255) NOT NULL default '' COMMENT '����˵��',
  guidetype char(10) NOT NULL default '' COMMENT '�����е�����',
  UNIQUE KEY tid (tid),
  KEY fid (fid,dateline)
) ENGINE=MyISAM COMMENT='rss�����';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_replycredit'
--
-- ����ʱ��: 2010 �� 11 �� 29 �� 17:15
-- ������ʱ��: 2010 �� 12 �� 03 �� 13:15
--

DROP TABLE IF EXISTS pre_forum_replycredit;
CREATE TABLE pre_forum_replycredit (
  tid mediumint(6) unsigned NOT NULL COMMENT '����tid',
  extcredits mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '���λظ��������',
  extcreditstype tinyint(1) NOT NULL DEFAULT '0' COMMENT '�������½������ֵ�����',
  times smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '�ظ���������',
  membertimes smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '�����û��������',
  random tinyint(1) NOT NULL DEFAULT '0' COMMENT '�û����õĻ�����������',
  PRIMARY KEY  (tid)
) ENGINE=MyISAM COMMENT='���������û��ֹ����';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_searchindex'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_searchindex;
CREATE TABLE pre_common_searchindex (
  searchid int(10) unsigned NOT NULL auto_increment COMMENT '����id',
  srchmod tinyint(3) unsigned NOT NULL COMMENT 'modģ��',
  keywords varchar(255) NOT NULL default '' COMMENT '�ؼ���',
  searchstring text NOT NULL COMMENT '�����ַ���',
  useip varchar(15) NOT NULL default '' COMMENT '������IP',
  uid mediumint(10) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  threadsortid smallint(6) unsigned NOT NULL default '0' COMMENT '������Ϣid',
  num smallint(6) unsigned NOT NULL default '0' COMMENT '��������',
  ids text NOT NULL COMMENT '����id����',
  PRIMARY KEY  (searchid),
  KEY srchmod (srchmod)
) ENGINE=MyISAM COMMENT='���������';

DROP TABLE IF EXISTS pre_common_sphinxcounter;
CREATE TABLE pre_common_sphinxcounter (
  `indexid` tinyint(1) NOT NULL,
  `maxid` int(10) NOT NULL,
  PRIMARY KEY  (`indexid`)
) ENGINE=MyISAM COMMENT='Sphinx ����������¼��';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_spacecache'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_spacecache;
CREATE TABLE pre_forum_spacecache (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û� uid',
  variable varchar(20) NOT NULL COMMENT '�������������',
  `value` text NOT NULL COMMENT '���������ֵ',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  PRIMARY KEY  (uid,variable)
) ENGINE=MyISAM COMMENT='minispace�����';

-- --------------------------------------------------------

--
-- ��Ľṹ `pre_forum_statlog`
--

DROP TABLE IF EXISTS pre_forum_statlog;
CREATE TABLE pre_forum_statlog (
  `logdate` date NOT NULL COMMENT '��־����',
  `fid` mediumint(8) unsigned NOT NULL COMMENT '���ID',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '��¼���� -- 1:������',
  `value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��¼ֵ',
  PRIMARY KEY (`logdate`,`fid`)
) ENGINE=MyISAM COMMENT='���ͳ����־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_task'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_task;
CREATE TABLE pre_common_task (
  taskid smallint(6) unsigned NOT NULL auto_increment COMMENT '����id',
  relatedtaskid smallint(6) unsigned NOT NULL default '0' COMMENT '��������id\n���������������������������',
  available tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  `name` varchar(50) NOT NULL default '' COMMENT '��������',
  description text NOT NULL COMMENT '��������',
  icon varchar(150) NOT NULL default '' COMMENT '����ͼ��',
  applicants mediumint(8) unsigned NOT NULL default '0' COMMENT '�����������˴�',
  achievers mediumint(8) unsigned NOT NULL default '0' COMMENT '����������˴�',
  tasklimits mediumint(8) unsigned NOT NULL default '0' COMMENT '�������벢��ɸ�������˴�����',
  applyperm text NOT NULL COMMENT '��������������û���id, ��ʽ:	1	2	3',
  scriptname varchar(50) NOT NULL default '' COMMENT '����ű��ļ���',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '��������ʱ��',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '��������ʱ��',
  period int(10) unsigned NOT NULL default '0' COMMENT '�������� ��λ��Сʱ Ĭ��Ϊ0��ʾһ�������� ����Ϊ24��1���ʾ�ճ�����',
  periodtype tinyint(1) NOT NULL default '0' COMMENT '���������ڵ�λ 0:Сʱ 1:�� 2:�� 3:��',
  reward enum('credit','magic','medal','invite','group') NOT NULL default 'credit' COMMENT '��������\n(credit:���� magic:���� medal:ѫ�� invite:������ group:�����û���)',
  prize varchar(15) NOT NULL default '' COMMENT '��Ʒ: ��һ����չ����, ����id, ѫ��id,��������Ч�ڣ� �����û���id',
  bonus int(10) NOT NULL default '0' COMMENT '��Ʒ����/��Ч��: \n��������, ��������, ѫ����Ч��, �����������������û�����Ч��',
  displayorder smallint(6) unsigned NOT NULL default '0' COMMENT '��ʾ˳��',
  version varchar(15) NOT NULL default '' COMMENT '����ű��汾��',
  PRIMARY KEY  (taskid)
) ENGINE=MyISAM COMMENT='��̳�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_taskvar'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_taskvar;
CREATE TABLE pre_common_taskvar (
  taskvarid mediumint(8) unsigned NOT NULL auto_increment COMMENT '�������id',
  taskid smallint(6) unsigned NOT NULL default '0' COMMENT '����id',
  sort enum('apply','complete') NOT NULL default 'complete' COMMENT '�������\n(apply:������������ complete:�����������)',
  `name` varchar(100) NOT NULL default '' COMMENT '��������',
  description varchar(255) NOT NULL default '' COMMENT '��������',
  variable varchar(40) NOT NULL default '' COMMENT '������',
  `type` varchar(20) NOT NULL default 'text' COMMENT '��������',
  `value` text NOT NULL COMMENT '����ֵ',
  PRIMARY KEY  (taskvarid),
  KEY taskid (taskid)
) ENGINE=MyISAM COMMENT='��̳�������ñ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_thread'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_thread;
CREATE TABLE pre_forum_thread (
  tid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '�ϼ���̳',
  posttableid smallint(6) unsigned NOT NULL default '0' COMMENT '���ӱ�ID',
  typeid smallint(6) unsigned NOT NULL default '0' COMMENT '�������id',
  sortid smallint(6) unsigned NOT NULL default '0' COMMENT '������Ϣid',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '�Ķ�Ȩ��',
  price smallint(6) NOT NULL default '0' COMMENT '�۸�',
  author char(15) NOT NULL default '' COMMENT '��Ա��',
  authorid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  `subject` char(80) NOT NULL default '' COMMENT '����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  lastpost int(10) unsigned NOT NULL default '0' COMMENT '��󷢱�',
  lastposter char(15) NOT NULL default '' COMMENT '��󷢱���id',
  views int(10) unsigned NOT NULL default '0' COMMENT '�������',
  replies mediumint(8) unsigned NOT NULL default '0' COMMENT '�ظ�����',
  displayorder tinyint(1) NOT NULL default '0' COMMENT '��ʾ˳��',
  highlight tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  digest tinyint(1) NOT NULL default '0' COMMENT '�Ƿ񾫻�',
  rate tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  special tinyint(1) NOT NULL default '0' COMMENT '��������,1:ͶƱ;2:��Ʒ;3:����;4:�;5:������;127:������',
  attachment tinyint(1) NOT NULL default '0' COMMENT '����,0�޸��� 1��ͨ���� 2��ͼƬ����',
  moderated tinyint(1) NOT NULL default '0' COMMENT '�Ƿ񱻹���Ա�Ķ�',
  closed mediumint(8) unsigned NOT NULL default '0' COMMENT '�Ƿ�ر�',
  stickreply tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ��л����ö�',
  recommends smallint(6) NOT NULL default '0' COMMENT '�Ƽ�ָ��',
  recommend_add smallint(6) NOT NULL default '0' COMMENT '֧������',
  recommend_sub smallint(6) NOT NULL default '0' COMMENT '��������',
  heats int(10) unsigned NOT NULL default '0' COMMENT '�����ȶ�ֵ',
  status smallint(6) unsigned NOT NULL default '0' ,
  isgroup tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ΪȺ������',
  favtimes mediumint(8) NOT NULL default '0' COMMENT '�����ղش���',
  sharetimes mediumint(8) NOT NULL default '0' COMMENT '����������',
  `stamp` tinyint(3) NOT NULL default '-1' COMMENT '����ͼ��',
  `icon` tinyint(3) NOT NULL default '-1' COMMENT '����ͼ��',
  pushedaid mediumint(8) NOT NULL default '0' COMMENT '�����͵�������aid',
  cover smallint(6) NOT NULL default '0' COMMENT '�������  ����:Զ�̡�����:���� 0:�޷���',
  replycredit smallint(6) NOT NULL default '0' COMMENT '�����������������¼����ֵ',
  relatebytag char(255) NOT NULL default '0' COMMENT '�������ӱ�ǩȡ���������id (time /t tid,...)',
  maxposition int(8) unsigned NOT NULL default '0' COMMENT '������λ����Ϣ',
  PRIMARY KEY  (tid),
  KEY digest (digest),
  KEY sortid (sortid),
  KEY displayorder (fid,displayorder,lastpost),
  KEY typeid (fid,typeid,displayorder,lastpost),
  KEY recommends (recommends),
  KEY heats (heats),
  KEY authorid (authorid),
  KEY isgroup (isgroup, lastpost),
  KEY special (special)
) ENGINE=MyISAM COMMENT='�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_threadaddviews'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_threadaddviews;
CREATE TABLE pre_forum_threadaddviews (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  addviews int(10) unsigned NOT NULL default '0' COMMENT '�������',
  PRIMARY KEY (tid)
) ENGINE=MyISAM COMMENT='����鿴����ʱ���±�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_threadmod'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_threadmod;
CREATE TABLE pre_forum_threadmod (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username char(15) NOT NULL default '' COMMENT '��Ա��',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '��Чʱ��',
  `action` char(5) NOT NULL default '' COMMENT '����',
  `status` tinyint(1) NOT NULL default '0' COMMENT '״̬',
  magicid smallint(6) unsigned NOT NULL COMMENT 'ʹ�õ���id',
  `stamp` TINYINT(3) NOT NULL,
  reason char(40) NOT NULL DEFAULT '',
  KEY tid (tid,dateline),
  KEY expiration (expiration,`status`)
) ENGINE=MyISAM COMMENT='��������¼��';
-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_threadpartake'
--
-- ����ʱ��: 2010 �� 11 �� 08 �� 14:47
-- ������ʱ��: 2010 �� 11 �� 08 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_threadpartake;
CREATE TABLE pre_forum_threadpartake (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  KEY tid (tid,uid)
) ENGINE=MyISAM COMMENT='��������߼�¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_threadrush'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_threadrush;
CREATE TABLE pre_forum_threadrush (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  stopfloor mediumint(8) unsigned NOT NULL default '0' COMMENT '��ֹ¥��',
  starttimefrom int(10) unsigned NOT NULL default '0' COMMENT '��ʼʱ��',
  starttimeto int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  rewardfloor text NOT NULL default '' COMMENT '����¥��',
  creditlimit int(10) NOT NULL default '-996' COMMENT '��������',
  PRIMARY KEY  (tid)
) ENGINE=MyISAM COMMENT='��¥���ñ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_threadtype'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_threadtype;
CREATE TABLE pre_forum_threadtype (
  typeid smallint(6) unsigned NOT NULL auto_increment COMMENT '������Ϣid',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  `name` varchar(255) NOT NULL default '' COMMENT '����',
  description varchar(255) NOT NULL default '' COMMENT '����˵��',
  `icon` varchar(255) NOT NULL default '' COMMENT '����ͼ��URL',
  special smallint(6) NOT NULL default '0' COMMENT '����״̬',
  modelid smallint(6) unsigned NOT NULL default '0' COMMENT '����ģ��id',
  expiration tinyint(1) NOT NULL default '0' COMMENT '������Ч��',
  template text NOT NULL COMMENT '������Ϣ����ģ��',
  stemplate text NOT NULL COMMENT '������Ϣ����ģ��',
  ptemplate text NOT NULL COMMENT '������Ϣ����ģ��',
  btemplate text NOT NULL COMMENT '������Ϣģ�����ģ��',
  PRIMARY KEY (typeid)
) ENGINE=MyISAM COMMENT='������Ϣ��';

--
-- ��Ľṹ 'pre_forum_trade'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_trade;
CREATE TABLE pre_forum_trade (
  tid mediumint(8) unsigned NOT NULL COMMENT '����id',
  pid int(10) unsigned NOT NULL COMMENT '����id',
  typeid smallint(6) unsigned NOT NULL COMMENT '�������id',
  sellerid mediumint(8) unsigned NOT NULL COMMENT '����id',
  seller char(15) NOT NULL COMMENT '������',
  account char(50) NOT NULL COMMENT '�����ʺ�',
  tenpayaccount char(20) NOT NULL default '' COMMENT '���ҲƸ�ͨ�˺�',
  `subject` char(100) NOT NULL COMMENT '����',
  price decimal(8,2) NOT NULL COMMENT '�۸�',
  amount smallint(6) unsigned NOT NULL default '1' COMMENT '����',
  quality tinyint(1) unsigned NOT NULL default '0' COMMENT '��ɫ',
  locus char(20) NOT NULL COMMENT '���ڵ�',
  transport tinyint(1) NOT NULL default '0' COMMENT '������ʽ',
  ordinaryfee smallint(4) unsigned NOT NULL default '0' COMMENT 'ƽ�ʸ��ӷ�',
  expressfee smallint(4) unsigned NOT NULL default '0' COMMENT '��ݸ��ӷ�',
  emsfee smallint(4) unsigned NOT NULL default '0' COMMENT 'EMS���ӷ�',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '��Ʒ����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  lastbuyer char(15) NOT NULL COMMENT '�������û���',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '�����ʱ��',
  totalitems smallint(5) unsigned NOT NULL default '0' COMMENT '�ܽ�����',
  tradesum decimal(8,2) NOT NULL default '0.00' COMMENT '�ܽ��׶�',
  closed tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ر�',
  aid mediumint(8) unsigned NOT NULL COMMENT '��ƷͼƬ�� Aid',
  displayorder tinyint(1) NOT NULL COMMENT '��ʾ˳��',
  costprice decimal(8,2) NOT NULL COMMENT '��Ʒԭ��',
  credit int(10) unsigned NOT NULL default '0' COMMENT '���ּ۸�',
  costcredit int(10) unsigned NOT NULL default '0' COMMENT '����ԭ��',
  credittradesum int(10) unsigned NOT NULL default '0' COMMENT '�ܻ��ֽ��׶�',
  PRIMARY KEY  (tid,pid),
  KEY pid (pid),
  KEY sellerid (sellerid),
  KEY totalitems (totalitems),
  KEY tradesum (tradesum),
  KEY displayorder (tid,displayorder),
  KEY sellertrades (sellerid,tradesum,totalitems),
  KEY typeid (typeid),
  KEY credittradesum (credittradesum),
  KEY expiration (expiration)
) ENGINE=MyISAM COMMENT='��Ʒ���ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ `pre_forum_threadclass`
--
DROP TABLE IF EXISTS pre_forum_threadclass;
CREATE TABLE pre_forum_threadclass (
  `typeid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `fid` mediumint(8) unsigned NOT NULL COMMENT '�������ID',
  `name` varchar(255) NOT NULL COMMENT '��������',
  `displayorder` mediumint(9) NOT NULL COMMENT '��ʾ˳��',
  `icon` varchar(255) NOT NULL COMMENT '����ͼ��URL',
  `moderators` tinyint(1) NOT NULL default '0' COMMENT '�������߿���',
  PRIMARY KEY (`typeid`),
  KEY fid (fid, displayorder)
) ENGINE=MyISAM COMMENT='��������';


--
-- ��Ľṹ 'pre_forum_tradecomment'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_tradecomment;
CREATE TABLE pre_forum_tradecomment (
  id mediumint(8) NOT NULL auto_increment COMMENT 'id',
  orderid char(32) NOT NULL COMMENT '���� id',
  pid int(10) unsigned NOT NULL COMMENT '���� id',
  `type` tinyint(1) NOT NULL COMMENT '����',
  raterid mediumint(8) unsigned NOT NULL COMMENT '���۷���Աid',
  rater char(15) NOT NULL COMMENT '���۷��û���',
  rateeid mediumint(8) unsigned NOT NULL COMMENT '�����۷���Աid',
  ratee char(15) NOT NULL COMMENT '�����۷��û���',
  message char(200) NOT NULL COMMENT '��������',
  explanation char(200) NOT NULL COMMENT '����',
  score tinyint(1) NOT NULL COMMENT '����',
  dateline int(10) unsigned NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY  (id),
  KEY raterid (raterid,`type`,dateline),
  KEY rateeid (rateeid,`type`,dateline),
  KEY orderid (orderid)
) ENGINE=MyISAM COMMENT='��������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_tradelog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_tradelog;
CREATE TABLE pre_forum_tradelog (
  tid mediumint(8) unsigned NOT NULL COMMENT '����id',
  pid int(10) unsigned NOT NULL COMMENT '����id',
  orderid varchar(32) NOT NULL COMMENT '������id',
  tradeno varchar(32) NOT NULL COMMENT '֧����������',
  paytype tinyint(1) unsigned NOT NULL default '0' COMMENT '����֧����ʽ',
  `subject` varchar(100) NOT NULL COMMENT '����',
  price decimal(8,2) NOT NULL default '0.00' COMMENT '�۸�',
  quality tinyint(1) unsigned NOT NULL default '0' COMMENT '��ɫ',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '��Ʒ����',
  number smallint(5) unsigned NOT NULL default '0' COMMENT '����',
  tax decimal(6,2) unsigned NOT NULL default '0.00' COMMENT '����������',
  locus varchar(100) NOT NULL COMMENT '��Ʒ���ڵ�',
  sellerid mediumint(8) unsigned NOT NULL COMMENT '����id',
  seller varchar(15) NOT NULL COMMENT '������',
  selleraccount varchar(50) NOT NULL COMMENT '���ҽ����ʺ�',
  tenpayaccount varchar(20) NOT NULL default '0' COMMENT '���ҲƸ�ͨ�˺�',
  buyerid mediumint(8) unsigned NOT NULL COMMENT '���id',
  buyer varchar(15) NOT NULL COMMENT '�����',
  buyercontact varchar(50) NOT NULL COMMENT '�����ϵ��ʽ',
  buyercredits smallint(5) unsigned NOT NULL default '0' COMMENT '����ݿۻ���',
  buyermsg varchar(200) default NULL COMMENT '�������',
  `status` tinyint(1) NOT NULL default '0' COMMENT '״̬',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '״̬������',
  offline tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����߽���',
  buyername varchar(50) NOT NULL COMMENT '�������',
  buyerzip varchar(10) NOT NULL COMMENT '����ʱ�',
  buyerphone varchar(20) NOT NULL COMMENT '��ҵ绰',
  buyermobile varchar(20) NOT NULL COMMENT '����ֻ�',
  transport tinyint(1) NOT NULL default '0' COMMENT '���䷽ʽ',
  transportfee smallint(6) unsigned NOT NULL default '0' COMMENT '�������',
  baseprice decimal(8,2) NOT NULL COMMENT '��Ʒԭ��',
  discount tinyint(1) NOT NULL default '0' COMMENT '�ۿ�',
  ratestatus tinyint(1) NOT NULL default '0' COMMENT '����״̬',
  message text NOT NULL COMMENT '��������',
  credit int(10) unsigned NOT NULL default '0' COMMENT '���ּ۸�',
  basecredit int(10) unsigned NOT NULL default '0' COMMENT '����ԭ��',
  UNIQUE KEY orderid (orderid),
  KEY sellerid (sellerid),
  KEY buyerid (buyerid),
  KEY `status` (`status`),
  KEY buyerlog (buyerid,`status`,lastupdate),
  KEY sellerlog (sellerid,`status`,lastupdate),
  KEY tid (tid,pid),
  KEY pid (pid)
) ENGINE=MyISAM COMMENT='���׼�¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_typeoption'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_typeoption;
CREATE TABLE pre_forum_typeoption (
  optionid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '������Ϣ��ĿID',
  classid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '������Ϣ�ϼ���ĿID',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '������Ϣ����',
  expiration tinyint(1) NOT NULL COMMENT '������Ϣ��Ŀ�Ƿ�����Ч������',
  protect varchar(255) NOT NULL COMMENT '������Ϣ��Ŀ�Ƿ��Ǳ�����Ŀ',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '������Ϣ��Ŀ����',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '������Ϣ��Ŀ����',
  identifier varchar(255) NOT NULL DEFAULT '' COMMENT '������Ϣ��Ŀ��ʶ',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '������Ϣ��Ŀ����',
  unit varchar(255) NOT NULL COMMENT '������Ϣ��Ŀ��λ',
  rules mediumtext NOT NULL COMMENT '������Ϣ��Ŀ����',
  permprompt mediumtext NOT NULL COMMENT '������Ϣ��ĿȨ����ʾ',
  PRIMARY KEY (optionid),
  KEY classid (classid)
) ENGINE=MyISAM COMMENT='������Ϣ������Ŀ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_typeoptionvar'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_typeoptionvar;
CREATE TABLE pre_forum_typeoptionvar (
  sortid smallint(6) unsigned NOT NULL default '0' COMMENT '������Ϣid',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '������Ϣ���ݶ�Ӧ����id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '������Ϣ���ݶ�Ӧ���Ӱ��id',
  optionid smallint(6) unsigned NOT NULL default '0' COMMENT '������Ϣ���ݶ�Ӧѡ��id',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '������Ϣ������Ч��',
  `value` mediumtext NOT NULL COMMENT '������Ϣ������ֵ',
  KEY sortid (sortid),
  KEY tid (tid),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='������Ϣ��Ŀ���ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_typevar'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_typevar;
CREATE TABLE pre_forum_typevar (
  sortid smallint(6) NOT NULL default '0' COMMENT '������Ϣid',
  optionid smallint(6) NOT NULL default '0' COMMENT '������Ϣ��Ӧ��Ŀid',
  available tinyint(1) NOT NULL default '0' COMMENT '������Ϣ��Ӧ��Ŀ�Ƿ����',
  required tinyint(1) NOT NULL default '0' COMMENT '������Ϣ��Ӧ��Ŀ�Ƿ����',
  unchangeable tinyint(1) NOT NULL default '0' COMMENT '������Ϣ��Ӧ��Ŀ�Ƿ���޸�',
  search tinyint(1) NOT NULL default '0' COMMENT '������Ϣ��Ӧ��Ŀ�Ƿ������',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '������Ϣ��Ӧ��Ŀ˳��',
  subjectshow TINYINT(1) NOT NULL DEFAULT '0',
  UNIQUE KEY optionid (sortid,optionid),
  KEY sortid (sortid)
) ENGINE=MyISAM COMMENT='������Ϣ��Ӧ��Ŀ��';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_warning'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_warning;
CREATE TABLE pre_forum_warning (
  wid smallint(6) unsigned NOT NULL auto_increment COMMENT '��¼id',
  pid int(10) unsigned NOT NULL COMMENT '���� pid',
  operatorid mediumint(8) unsigned NOT NULL COMMENT '������ Uid',
  operator char(15) NOT NULL COMMENT '�������û���',
  authorid mediumint(8) unsigned NOT NULL COMMENT '�������� uid',
  author char(15) NOT NULL COMMENT '���������û���',
  dateline int(10) unsigned NOT NULL COMMENT '����ʱ��',
  reason char(40) NOT NULL COMMENT '����ԭ��',
  PRIMARY KEY  (wid),
  UNIQUE KEY pid (pid),
  KEY authorid (authorid)
) ENGINE=MyISAM COMMENT='�����¼��';


-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_album'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_album;
CREATE TABLE pre_home_album (
  albumid mediumint(8) unsigned NOT NULL auto_increment COMMENT '���ID ',
  albumname varchar(50) NOT NULL default '' COMMENT '�������',
  catid smallint(6) unsigned NOT NULL default '0' COMMENT '���ϵͳ����',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '����û�ID ',
  username varchar(15) NOT NULL default '' COMMENT '����û���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��Ὠ��ʱ���',
  updatetime int(10) unsigned NOT NULL default '0' COMMENT '�������޸�ʱ���',
  picnum smallint(6) unsigned NOT NULL default '0' COMMENT '�����Ƭ����',
  pic varchar(60) NOT NULL default '' COMMENT '��������Ƭ',
  picflag tinyint(1) NOT NULL default '0' COMMENT '����Ƿ���ͼƬ',
  friend tinyint(1) NOT NULL default '0' COMMENT '�����˽����:"0"ȫվ�û��ɼ�,"1"Ϊȫ���ѿɼ�,"2"Ϊ��ָ���ĺ��ѿɼ�,"3"Ϊ���Լ��ɼ�,"4"Ϊƾ����鿴 ',
  `password` varchar(10) NOT NULL default '' COMMENT '�������',
  target_ids text NOT NULL COMMENT '����鿴�����û�ID,����û�ID��"m"��� ',
  favtimes mediumint(8) unsigned NOT NULL COMMENT '����ղش���',
  sharetimes mediumint(8) unsigned NOT NULL COMMENT '���������',
  depict text NOT NULL COMMENT '������� ',
  PRIMARY KEY  (albumid),
  KEY uid (uid,updatetime),
  KEY updatetime (updatetime)
) ENGINE=MyISAM COMMENT='����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_appcreditlog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_appcreditlog;
CREATE TABLE pre_home_appcreditlog (
  logid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�id',
  appid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û���',
  appname varchar(60) NOT NULL default '' COMMENT 'Ӧ������',
  `type` tinyint(1) NOT NULL default '0' COMMENT '����ת��ת������',
  credit mediumint(8) unsigned NOT NULL default '0' COMMENT '������',
  note text NOT NULL COMMENT '��ע',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  PRIMARY KEY  (logid),
  KEY uid (uid,dateline),
  KEY appid (appid)
) ENGINE=MyISAM COMMENT='����Ӧ�û��ֲ�����¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_blacklist'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_blacklist;
CREATE TABLE pre_home_blacklist (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�ID ',
  buid mediumint(8) unsigned NOT NULL default '0' COMMENT '�����ε��û�ID ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�����ε�ʱ���',
  PRIMARY KEY  (uid,buid),
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='���κ�������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_block'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_block;
CREATE TABLE pre_common_block (
  bid mediumint(8) unsigned NOT NULL auto_increment COMMENT 'ģ��ID',
  blockclass varchar(255) NOT NULL default '0' COMMENT 'ģ����� article/pic/member/board/poll',
  blocktype tinyint(1) NOT NULL default '0' COMMENT '�������� 0Ϊģ����� 1Ϊjs����',
  `name` varchar(255) NOT NULL default '' COMMENT 'ģ�������',
  title text NOT NULL COMMENT 'ģ�������',
  classname varchar(255) NOT NULL default '' COMMENT 'ָ����ʽclass',
  summary text NOT NULL COMMENT 'ģ���Զ�������',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������û�ID ',
  username varchar(255) NOT NULL default '' COMMENT '�������û���',
  styleid smallint(6) unsigned NOT NULL default '0' COMMENT 'ģ����ID',
  blockstyle text NOT NULL COMMENT '�Զ�����',
  picwidth smallint(6) unsigned NOT NULL default '0' COMMENT '��ʾͼƬ����',
  picheight smallint(6) unsigned NOT NULL default '0' COMMENT '��ʾͼƬ���',
  target varchar(255) NOT NULL default '' COMMENT 'ģ�����Ӵ򿪷�ʽ: _blank, _self, _top',
  dateformat varchar(255) NOT NULL default '' COMMENT 'ʱ���ʽ�� H:i�� u�� Y-m-d��',
  dateuformat tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ʹ�ø��Ի�ʱ���ʽ',
  script varchar(255) NOT NULL default '' COMMENT 'ģ���ȡ���ݽű���',
  param text NOT NULL COMMENT 'ģ������������л��洢',
  shownum smallint(6) unsigned NOT NULL default '0' COMMENT '��ȡ������Ŀ',
  cachetime int(10) NOT NULL default '0' COMMENT 'ģ�黺�����ʱ����',
  cachetimerange char(5) NOT NULL default '' COMMENT 'ģ�黺�����ʱ������',
  punctualupdate tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��ϸ��ջ���ʱ����£������Ż���',
  hidedisplay tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��������',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'ģ�黺�洴��ʱ���',
  notinherited tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�̳�����ҳ��Ȩ��',
  isblank tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�Ϊ�հ�ģ�飬ֻ��ʾ׼������',
  PRIMARY KEY  (bid)
) ENGINE=MyISAM COMMENT='ģ���';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_block_style'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_block_style;
CREATE TABLE pre_common_block_style (
  styleid smallint(6) unsigned NOT NULL auto_increment COMMENT 'ģ����ʽID',
  blockclass varchar(255) NOT NULL default '' COMMENT 'ģ�����',
  `name` varchar(255) NOT NULL default '' COMMENT '��ʽ����',
  template text NOT NULL COMMENT '��ʽģ��',
  `hash` varchar(255) NOT NULL default '' COMMENT '��ʽhash��blockclass + template��',
  getpic tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Ҫ��ȡpic����',
  getsummary tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Ҫ��ȡsummary����',
  makethumb tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Ҫblock��������ͼ',
  settarget tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Ҫ�������Ӵ򿪷�ʽ',
  fields text NOT NULL COMMENT 'ģ�����õ���ģ������ֶ�',
  moreurl tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��и�������',
  PRIMARY KEY  (styleid),
  KEY `hash` (`hash`),
  KEY `blockclass` (`blockclass`)
) ENGINE=MyISAM COMMENT='ģ��ģ���';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_block_item'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_block_item;
CREATE TABLE pre_common_block_item (
  itemid int(10) unsigned NOT NULL auto_increment COMMENT '��ϢID',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ģ��ID',
  id int(10) unsigned NOT NULL default '0' COMMENT '��ԴID',
  idtype varchar(255) NOT NULL default '' COMMENT '��ԴID TYPE���ֹ��������Ϊrand',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '��Ϣ���� 0Ϊ�Զ� 1Ϊ�ֹ����� 2�ѱ༭',
  title varchar(255) NOT NULL default '' COMMENT '��Ϣ������',
  url varchar(255) NOT NULL default '' COMMENT '��Ϣ���ӵ�ַ',
  pic varchar(255) NOT NULL default '' COMMENT '��ϢͼƬ',
  picflag tinyint(1) NOT NULL default '0' COMMENT 'ͼƬ���� 0Ϊurl 1Ϊ���� 2 ΪftpԶ��',
  makethumb tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����������ͼ  1:���ɳɹ�; 2:����ʧ��',
  thumbpath varchar(255) NOT NULL default '' COMMENT '����ͼ��ַ',
  summary text NOT NULL COMMENT '��ϢժҪ',
  showstyle text NOT NULL COMMENT '��ʾ��ʽ',
  related text NOT NULL COMMENT '�������',
  `fields` text NOT NULL COMMENT '��Ϣ����num/author/authorid/dateline',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  startdate int(10) unsigned NOT NULL default '0' COMMENT '��ʼʱ���',
  enddate int(10) unsigned NOT NULL default '0' COMMENT '����ʱ���',
  PRIMARY KEY  (itemid),
  KEY bid (bid)
) ENGINE=MyISAM COMMENT='ģ�����ݱ�';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_block_pic'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_block_pic;
CREATE TABLE pre_common_block_pic (
  picid int(10) unsigned NOT NULL auto_increment COMMENT 'ͼƬID',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ģ��ID',
  itemid int(10) unsigned NOT NULL default '0' COMMENT '��ϢID',
  pic varchar(255) NOT NULL default '' COMMENT '��ϢͼƬ',
  picflag tinyint(1) NOT NULL default '0' COMMENT 'ͼƬ���� 0Ϊ���� 1ΪftpԶ��',
  `type` tinyint(1) NOT NULL default '0' COMMENT '��Ϣ���� 0Ϊģ������ͼ 1Ϊ�ϴ���ͼ',
  PRIMARY KEY  (picid),
  KEY bid (bid,itemid)
) ENGINE=MyISAM COMMENT='ģ��ʹ��ͼƬ��';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_block_item_data'
--
-- ����ʱ��: 2010 �� 2 �� 26 ��  11:08
DROP TABLE IF EXISTS pre_common_block_item_data;
CREATE TABLE pre_common_block_item_data (
  dataid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '�Ƽ���ϢID',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ģ��ID',
  id int(10) unsigned NOT NULL default '0' COMMENT '��ԴID',
  idtype varchar(255) NOT NULL default '' COMMENT '��ԴID TYPE',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '��Ϣ���� 0Ϊ�Զ� 1Ϊ�ֹ����� 3�Ƽ�����',
  title varchar(255) NOT NULL default '' COMMENT '��Ϣ������',
  url varchar(255) NOT NULL default '' COMMENT '��Ϣ���ӵ�ַ',
  pic varchar(255) NOT NULL default '' COMMENT '��ϢͼƬ',
  picflag tinyint(1) NOT NULL default '0' COMMENT 'ͼƬ���� 0Ϊurl 1Ϊ���� 2 ΪftpԶ��',
  makethumb tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����������ͼ',
  summary text NOT NULL COMMENT '��ϢժҪ',
  showstyle text NOT NULL COMMENT '��ʾ��ʽ',
  related text NOT NULL COMMENT '�������',
  `fields` text NOT NULL COMMENT '��Ϣ����num/author/authorid/dateline',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  startdate int(10) unsigned NOT NULL default '0' COMMENT '��ʼʱ���',
  enddate int(10) unsigned NOT NULL default '0' COMMENT '����ʱ���',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƽ��� UID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '�Ƽ����û���',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƽ�����',
  isverified tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ���ͨ�����',
  verifiedtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ͨ���������',
  stickgrade tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '�ö��ȼ��� 0��10',
  PRIMARY KEY (dataid),
  KEY bid (bid, stickgrade, verifiedtime)
) ENGINE=MyISAM COMMENT='ģ���Ƽ���Ϣ��';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_block_xml'
--
-- ����ʱ��: 2010 �� 2 �� 26 ��  11:08
DROP TABLE IF EXISTS pre_common_block_xml;
CREATE TABLE pre_common_block_xml (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'XML��չ ����',
  `version` varchar(255) NOT NULL COMMENT 'XML��չ �汾',
  `url` varchar(255) NOT NULL COMMENT 'XML��չ URL',
  `clientid` varchar(255) NOT NULL COMMENT '�ͻ���ID',
  `key` varchar(255) NOT NULL COMMENT 'ͨ����Կ',
  `signtype` varchar(255) NOT NULL COMMENT 'ǩ���ļ��ܷ�ʽ��Ŀǰֻ֧��MD5��ʽ����Ϊ��ʹ��ǩ����ֱ��ʹ��ͨ����Կ',
  `data` text NOT NULL COMMENT 'XML��չ ����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM COMMENT='ģ�� XML ��չ�����ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_block_favorite'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_block_favorite;
CREATE TABLE pre_common_block_favorite (
  favid mediumint(8) unsigned NOT NULL auto_increment COMMENT '�ղ�id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ģ��id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ղ�ʱ��',
  PRIMARY KEY (favid),
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='ģ���ղر�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_blog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_blog;
CREATE TABLE pre_home_blog (
  blogid mediumint(8) unsigned NOT NULL auto_increment COMMENT '��־ID',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��־�����û�ID ',
  username char(15) NOT NULL default '' COMMENT '��־�����û���',
  `subject` char(80) NOT NULL default '' COMMENT '��־����',
  classid smallint(6) unsigned NOT NULL default '0' COMMENT '���˷���id',
  catid smallint(6) unsigned NOT NULL default '0' COMMENT 'ϵͳ����id',
  viewnum mediumint(8) unsigned NOT NULL default '0' COMMENT '��־�鿴��',
  replynum mediumint(8) unsigned NOT NULL default '0' COMMENT '��־�ظ���',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '�ȶ�',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��־����ʱ��',
  picflag tinyint(1) NOT NULL default '0' COMMENT '��־�Ƿ���ͼƬ',
  noreply tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���������:"0"Ϊ����,"1"Ϊ������ ',
  friend tinyint(1) NOT NULL default '0' COMMENT '��־��˽����:"0"Ϊȫվ�û��ɼ�,"1"Ϊȫ���ѿɼ�,"2"Ϊ��ָ���ĺ��ѿɼ�,"3"Ϊ���Լ��ɼ�,"4"Ϊƾ����鿴 ',
  `password` char(10) NOT NULL default '' COMMENT '��־����',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '��־�ղش���',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '��־�������',
  `status` tinyint(1) unsigned NOT NULL default '0' COMMENT 'blog״̬ 1-���',
  click1 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬1 id',
  click2 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬2 id',
  click3 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬3 id',
  click4 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬4 id',
  click5 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬5 id',
  click6 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬6 id',
  click7 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬7 id',
  click8 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬8 id',
  PRIMARY KEY  (blogid),
  KEY uid (uid,dateline),
  KEY hot (hot),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='��־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_blogfield'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_blogfield;
CREATE TABLE pre_home_blogfield (
  blogid mediumint(8) unsigned NOT NULL default '0' COMMENT '��־id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��־�����û�ID ',
  pic varchar(255) NOT NULL default '' COMMENT '����ͼƬ',
  tag varchar(255) NOT NULL default '' COMMENT '��־TAG ',
  message mediumtext NOT NULL COMMENT '��־����',
  postip varchar(255) NOT NULL default '' COMMENT '������־��IP ',
  related text NOT NULL COMMENT '�����־��������Ϣ',
  relatedtime int(10) unsigned NOT NULL default '0' COMMENT '�����־����ʱ���',
  target_ids text NOT NULL COMMENT '����鿴��־���û�ID���ID��","��� ',
  hotuser text NOT NULL COMMENT '�ȵ��û�',
  magiccolor tinyint(6) NOT NULL default '0' COMMENT '���߲�ɫ��id',
  magicpaper tinyint(6) NOT NULL default '0' COMMENT '������ֽid',
  pushedaid mediumint(8) NOT NULL default '0' COMMENT '�����͵�������aid',
  PRIMARY KEY  (blogid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='��־�ֶα�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_class'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_class;
CREATE TABLE pre_home_class (
  classid mediumint(8) unsigned NOT NULL auto_increment COMMENT '���˷���id',
  classname char(40) NOT NULL default '' COMMENT '��������',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '���������û�ID ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '���ഴ��ʱ���',
  PRIMARY KEY  (classid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='��־���˷����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_click'
--
-- ����ʱ��: 2010 �� 01 �� 18 �� 13:22
-- ������ʱ��: 2010 �� 01 �� 18 �� 13:22
--

DROP TABLE IF EXISTS pre_home_click;
CREATE TABLE pre_home_click (
  clickid smallint(6) unsigned NOT NULL auto_increment COMMENT '��̬ID',
  `name` char(50) NOT NULL default '' COMMENT '��̬����',
  icon char(100) NOT NULL default '' COMMENT '��̬ͼ��',
  idtype char(15) NOT NULL default '' COMMENT '��̬����',
  available tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ���Ч',
  displayorder tinyint(6) unsigned NOT NULL default '0' COMMENT '����',
  PRIMARY KEY (clickid),
  KEY idtype (idtype, displayorder)
) ENGINE=MyISAM COMMENT='��̬����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_clickuser'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_clickuser;
CREATE TABLE pre_home_clickuser (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̬�û�id',
  username varchar(15) NOT NULL default '' COMMENT '��̬�û���',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '���ö���id',
  idtype varchar(15) NOT NULL default '' COMMENT '���ö���id����',
  clickid smallint(6) unsigned NOT NULL default '0' COMMENT '��̬id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�����̬ʱ���',
  KEY id (id,idtype,dateline),
  KEY uid (uid,idtype,dateline)
) ENGINE=MyISAM COMMENT='�û���̬��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_comment'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_comment;
CREATE TABLE pre_home_comment (
  cid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������۵��û�id',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '���۶���id',
  idtype varchar(20) NOT NULL default '' COMMENT '���۶����id���ͣ�blogid��picid��uid',
  authorid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ϊ�ظ�,�ظ������û�ID ',
  author varchar(15) NOT NULL default '' COMMENT '��Ϊ�ظ�,�ظ������û��� ',
  ip varchar(20) NOT NULL default '' COMMENT '����IP ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ���',
  message text NOT NULL COMMENT '��������',
  magicflicker tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ʹ���˵��߲ʺ���',
  status tinyint(1) NOT NULL default '0' COMMENT '����״̬ 1-���',
  PRIMARY KEY  (cid),
  KEY authorid (authorid,idtype),
  KEY id (id,idtype,dateline)
) ENGINE=MyISAM COMMENT='�û����۱�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_docomment'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_docomment;
CREATE TABLE pre_home_docomment (
  id int(10) unsigned NOT NULL auto_increment COMMENT '��¼�ظ�id',
  upid int(10) unsigned NOT NULL default '0' COMMENT '�ϼ���¼�ظ�id',
  doid mediumint(8) unsigned NOT NULL default '0' COMMENT '�����۵ļ�¼id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������¼���û�id',
  username varchar(15) NOT NULL default '' COMMENT '������¼���û���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��¼�ظ�ʱ���',
  message text NOT NULL COMMENT '��¼�ظ�����',
  ip varchar(20) NOT NULL default '' COMMENT '������¼ip',
  grade smallint(6) unsigned NOT NULL default '0' COMMENT '��¼�ظ��Ĳ㼶',
  PRIMARY KEY  (id),
  KEY doid (doid,dateline),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='�û���¼�ظ���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_doing'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_doing;
CREATE TABLE pre_home_doing (
  doid mediumint(8) unsigned NOT NULL auto_increment COMMENT '��¼id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��¼�������û�id',
  username varchar(15) NOT NULL default '' COMMENT '��¼�������û���',
  `from` varchar(20) NOT NULL default '' COMMENT '��¼�ķ�����Դ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '��¼����ʱ���',
  message text NOT NULL COMMENT '��¼����',
  ip varchar(20) NOT NULL default '' COMMENT '��¼����ip',
  replynum int(10) unsigned NOT NULL default '0' COMMENT '��¼�ظ���',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT '��¼״̬ 1-���',
  PRIMARY KEY  (doid),
  KEY uid (uid,dateline),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='�û���¼��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_feed'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_feed;
CREATE TABLE pre_home_feed (
  feedid int(10) unsigned NOT NULL auto_increment COMMENT 'feed��ID ',
  appid smallint(6) unsigned NOT NULL default '0' COMMENT 'Ӧ�ó���ID ',
  icon varchar(30) NOT NULL default '' COMMENT 'feedͼ�� ',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '����feed���û�ID ',
  username varchar(15) NOT NULL default '' COMMENT '����feed���û��� ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'feed����ʱ��� ',
  friend tinyint(1) NOT NULL default '0' COMMENT '����feed��Ϣ����˽���� ',
  hash_template varchar(32) NOT NULL default '' COMMENT 'ģ��hash:md5(title_template"\t"body_template) ',
  hash_data varchar(32) NOT NULL default '' COMMENT '��������hash:md5(title_templat"\t"title_data"\t"body_template"\t"body_data) ',
  title_template text NOT NULL COMMENT 'feed����ģ�� ',
  title_data text NOT NULL COMMENT 'feed���� ',
  body_template text NOT NULL COMMENT 'feed����ģ��  ',
  body_data text NOT NULL COMMENT 'feed���� ',
  body_general text NOT NULL COMMENT '�û���д����Ϣ ',
  image_1 varchar(255) NOT NULL default '' COMMENT 'feedͼ1',
  image_1_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����1',
  image_2 varchar(255) NOT NULL default '' COMMENT 'feedͼƬ2',
  image_2_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����2',
  image_3 varchar(255) NOT NULL default '' COMMENT 'feedͼƬ3',
  image_3_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����3',
  image_4 varchar(255) NOT NULL default '' COMMENT 'feedͼƬ4',
  image_4_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����4',
  target_ids text NOT NULL COMMENT '����feed��Ϣ����鿴�ĺ���ID ',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT 'feed��Ӧ����id',
  idtype varchar(15) NOT NULL default '' COMMENT 'feed��Ӧ��������',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '�ȶ�',
  PRIMARY KEY  (feedid),
  KEY uid (uid,dateline),
  KEY dateline (dateline),
  KEY hot (hot),
  KEY id (id,idtype)
) ENGINE=MyISAM COMMENT='վ��feed��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_feed_app'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_feed_app;
CREATE TABLE pre_home_feed_app (
  feedid int(10) unsigned NOT NULL auto_increment COMMENT 'Ӧ��feed id',
  appid smallint(6) unsigned NOT NULL default '0' COMMENT 'Ӧ�ó���ID',
  icon varchar(30) NOT NULL default '' COMMENT 'feedͼ�� ',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '����feed���û�ID ',
  username varchar(15) NOT NULL default '' COMMENT '����feed���û��� ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'feed����ʱ��� ',
  friend tinyint(1) NOT NULL default '0' COMMENT '����feed��Ϣ����˽���� ',
  hash_template varchar(32) NOT NULL default '' COMMENT 'ģ��hash:md5(title_template"\t"body_template) ',
  hash_data varchar(32) NOT NULL default '' COMMENT '��������hash:md5(title_templat"\t"title_data"\t"body_template"\t"body_data) ',
  title_template text NOT NULL COMMENT 'feed����ģ�� ',
  title_data text NOT NULL COMMENT 'feed���� ',
  body_template text NOT NULL COMMENT 'feed����ģ��  ',
  body_data text NOT NULL COMMENT 'feed���� ',
  body_general text NOT NULL COMMENT '�û���д����Ϣ ',
  image_1 varchar(255) NOT NULL default '' COMMENT 'feedͼ1',
  image_1_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����1',
  image_2 varchar(255) NOT NULL default '' COMMENT 'feedͼƬ2',
  image_2_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����2',
  image_3 varchar(255) NOT NULL default '' COMMENT 'feedͼƬ3',
  image_3_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����3',
  image_4 varchar(255) NOT NULL default '' COMMENT 'feedͼƬ4',
  image_4_link varchar(255) NOT NULL default '' COMMENT 'feedͼƬ����4',
  target_ids text NOT NULL COMMENT '����feed��Ϣ����鿴�ĺ���ID ',
  PRIMARY KEY  (feedid),
  KEY uid (uid,dateline),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='Ӧ��feed��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_friend'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_friend;
CREATE TABLE pre_home_friend (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�ID ',
  fuid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�����ID ',
  fusername varchar(15) NOT NULL default '' COMMENT '�û�������',
  gid smallint(6) unsigned NOT NULL default '0' COMMENT '�������ڵĺ�����ID ',
  num mediumint(8) unsigned NOT NULL default '0' COMMENT '����֮��������ϵ��',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�Ӻ��ѵ�ʱ���',
  note varchar(255) NOT NULL default '' COMMENT '���ѱ�ע',
  PRIMARY KEY  (uid,fuid),
  KEY fuid (fuid),
  KEY `uid` (uid,num,dateline)
) ENGINE=MyISAM COMMENT='�û����ѱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_friend_request'
--
-- ����ʱ��: 2009 �� 11 �� 16 �� 16:50
-- ������ʱ��: 2009 �� 11 �� 16 �� 16:50
--

DROP TABLE IF EXISTS pre_home_friend_request;
CREATE TABLE pre_home_friend_request (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�ID ',
  fuid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������û�ID ',
  fusername char(15) NOT NULL default '' COMMENT '�������û�����',
  gid smallint(6) unsigned NOT NULL default '0' COMMENT '�������ڵĺ�����ID ',
  note char(60) NOT NULL default '' COMMENT '���븽��',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�������ʱ���',
  PRIMARY KEY  (uid,fuid),
  KEY fuid (fuid),
  KEY `dateline` (uid, dateline)
) ENGINE=MyISAM COMMENT='������ѱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_friendlog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_friendlog;
CREATE TABLE pre_home_friendlog (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�ID ',
  fuid mediumint(8) unsigned NOT NULL default '0' COMMENT '�����û�ID ',
  `action` varchar(10) NOT NULL default '' COMMENT '���Ѷ���:"add"���,"update"���� ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '���Ѷ���ʱ��',
  PRIMARY KEY  (uid,fuid)
) ENGINE=MyISAM COMMENT='�û����Ѷ�����־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_magiclog'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_magiclog;
CREATE TABLE pre_common_magiclog (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�û�id',
  magicid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '����id',
  action tinyint(1) NOT NULL DEFAULT '0' COMMENT '�������� 1 ���� 2 ʹ�� 3 ����',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  amount smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  credit tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�����۸�',
  `targetid` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` char(6) DEFAULT NULL,
  targetuid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '����Ŀ��uid',
  KEY uid (uid,dateline),
  KEY `action` (`action`),
  KEY targetuid (targetuid,dateline),
  KEY magicid (magicid,dateline)
) ENGINE=MyISAM COMMENT='������־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_magic'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_magic;
CREATE TABLE pre_common_magic (
  magicid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ����',
  name varchar(50) NOT NULL COMMENT '����',
  identifier varchar(40) NOT NULL COMMENT 'Ψһ��ʶ',
  description varchar(255) NOT NULL COMMENT '����',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '˳��',
  credit tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ʹ�õĻ���',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�۸�',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  salevolume smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '������',
  supplytype tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Զ���������',
  supplynum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '�Զ���������',
  useperoid tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ʹ������',
  usenum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '����ʹ������',
  weight tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '����',
  magicperm text NOT NULL COMMENT 'Ȩ��',
  useevent tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:ֻ���ض�����ʹ�� 1:�����ڵ�������ʹ��',
  PRIMARY KEY  (magicid),
  UNIQUE KEY identifier (identifier),
  KEY displayorder (available,displayorder)
) ENGINE=MyISAM COMMENT='�������ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_notification'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_notification;
CREATE TABLE pre_home_notification (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '֪ͨID ',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '֪ͨ�û�ID ',
  `type` varchar(20) NOT NULL default '' COMMENT '֪ͨ����:"doing"��¼,"friend"��������,"sharenotice"���ѷ���,"post"����ظ�, ',
  `new` tinyint(1) NOT NULL default '0' COMMENT '֪ͨ�Ƿ�Ϊ��:"1"Ϊ��֪ͨ,"0"Ϊ֪ͨ�Ѷ� ',
  authorid mediumint(8) unsigned NOT NULL default '0' COMMENT '�����û�ID ',
  author varchar(15) NOT NULL default '' COMMENT '�û���',
  note text NOT NULL COMMENT '֪ͨ����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '֪ͨ������ʱ���',
  from_id mediumint(8) unsigned NOT NULL default '0' COMMENT '��Դ����id',
  from_idtype varchar(20) NOT NULL default '' COMMENT '��Դ��������',
  from_num mediumint(8) unsigned NOT NULL default '0' COMMENT '��Դ��',
  PRIMARY KEY  (id),
  KEY uid (uid,new,dateline),
  KEY from_id (from_id,from_idtype)
) ENGINE=MyISAM COMMENT='֪ͨ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_pic'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_pic;
CREATE TABLE pre_home_pic (
  picid mediumint(8) NOT NULL auto_increment COMMENT 'ͼƬID ',
  albumid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ͼƬ�������ID ',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ͼƬ�����û�ID ',
  username varchar(15) NOT NULL default '' COMMENT 'ͼƬ�����û���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'ͼƬ�ϴ�ʱ���',
  postip varchar(255) NOT NULL default '' COMMENT 'ͼƬ�ϴ�ip',
  filename varchar(255) NOT NULL default '' COMMENT 'ͼƬ�ļ���',
  title varchar(255) NOT NULL default '' COMMENT 'ͼƬ����',
  `type` varchar(255) NOT NULL default '' COMMENT 'ͼƬ����',
  size int(10) unsigned NOT NULL default '0' COMMENT 'ͼƬ��С',
  filepath varchar(255) NOT NULL default '' COMMENT 'ͼƬ·��',
  thumb tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  remote tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Զ��ͼƬ0:home����ͼƬ,1:homeԶ��ͼƬ,2:��̳����ͼƬ,3��̳Զ��ͼƬ',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '�ȶ�',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT 'ͼƬ�������',
  click1 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬1 id',
  click2 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬2 id',
  click3 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬3 id',
  click4 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬4 id',
  click5 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬5 id',
  click6 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬6 id',
  click7 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬7 id',
  click8 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬8 id',
  magicframe tinyint(6) NOT NULL default '0' COMMENT '����ʹ�����id',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT 'ͼƬ״̬ 1-���',
  PRIMARY KEY  (picid),
  KEY uid (uid),
  KEY albumid (albumid,dateline)
) ENGINE=MyISAM COMMENT='��԰ͼƬ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_picfield'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_picfield;
CREATE TABLE pre_home_picfield (
  picid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ͼƬid',
  hotuser text NOT NULL COMMENT 'ͼƬ��Ӧ�ȵ��û�',
  PRIMARY KEY  (picid)
) ENGINE=MyISAM COMMENT='��԰ͼƬ��չ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_poke'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_poke;
CREATE TABLE pre_home_poke (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '���к����û�ID ',
  fromuid mediumint(8) unsigned NOT NULL default '0' COMMENT '���к����û�ID ',
  fromusername varchar(15) NOT NULL default '' COMMENT '���к����û��� ',
  note varchar(255) NOT NULL default '' COMMENT '�к�����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '���к�ʱ���',
  iconid smallint(6) unsigned NOT NULL default '0' COMMENT '�к�ͼ��',
  PRIMARY KEY  (uid,fromuid),
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='�û��к���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_pokearchive'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_pokearchive;
CREATE TABLE pre_home_pokearchive (
  pid mediumint(8) NOT NULL auto_increment COMMENT '�к���ʷid',
  pokeuid int(10) unsigned NOT NULL default '0' COMMENT '',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '',
  fromuid mediumint(8) unsigned NOT NULL default '0' COMMENT '',
  note varchar(255) NOT NULL default '' COMMENT '�к�����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�к�ʱ���',
  iconid smallint(6) unsigned NOT NULL default '0' COMMENT '�к�ͼ��',
  PRIMARY KEY  (pid),
  KEY pokeuid (pokeuid)
) ENGINE=MyISAM COMMENT='�û��к��浵��';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_share'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_share;
CREATE TABLE pre_home_share (
  sid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  itemid mediumint(8) unsigned NOT NULL COMMENT '�����Ŀ��ID',
  `type` varchar(30) NOT NULL default '' COMMENT '��������',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������û�id',
  username varchar(15) NOT NULL default '' COMMENT '�������û���',
  fromuid mediumint(8) unsigned NOT NULL default '0' COMMENT '���������û�ID',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ���',
  title_template text NOT NULL COMMENT '�������ģ��',
  body_template text NOT NULL COMMENT '��������ģ��',
  body_data text NOT NULL COMMENT '������������',
  body_general text NOT NULL COMMENT '����˵��',
  image varchar(255) NOT NULL default '' COMMENT '�����ͼƬ',
  image_link varchar(255) NOT NULL default '' COMMENT '�����ͼƬ����',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '�ȶ�',
  hotuser text NOT NULL COMMENT '����ȵ��û�',
  status tinyint(1) NOT NULL COMMENT '������Ŀ״̬ 1-���',
  PRIMARY KEY  (sid),
  KEY uid (uid,dateline),
  KEY hot (hot),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='�û������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_show'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_show;
CREATE TABLE pre_home_show (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ҫ�ϰ��û�id',
  username varchar(15) NOT NULL default '' COMMENT '��Ҫ�ϰ��û���',
  unitprice int(10) unsigned NOT NULL default '1' COMMENT '���η��ʵ���',
  credit int(10) unsigned NOT NULL default '0' COMMENT '�ϰ��ܻ���',
  note varchar(100) NOT NULL default '' COMMENT '�ϰ�����',
  PRIMARY KEY  (uid),
  KEY unitprice (unitprice),
  KEY credit (credit)
) ENGINE=MyISAM COMMENT='�û��ϰ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_userapp'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_userapp;
CREATE TABLE pre_home_userapp (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ʹ��Ӧ�õ��û�ID ',
  appid mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ӧ��ID ',
  appname varchar(60) NOT NULL default '' COMMENT 'Ӧ����',
  privacy tinyint(1) NOT NULL default '0' COMMENT 'Ӧ���Ƿ񹫿�',
  allowsidenav tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��ڿ�ʼ�˵�����ʾ',
  allowfeed tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����Ӧ�ò���feed ',
  allowprofilelink tinyint(1) NOT NULL default '0' COMMENT 'ʱ����������ҳ��ʾ����',
  narrow tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��ڸ��˿ռ������ʾ',
  menuorder smallint(6) NOT NULL default '0' COMMENT '�˵�˳��',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  KEY uid (uid,appid),
  KEY menuorder (uid,menuorder),
  KEY displayorder (uid,displayorder)
) ENGINE=MyISAM COMMENT='�û�ʹ��Ӧ�ñ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_userappfield'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_userappfield;
CREATE TABLE pre_home_userappfield (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ʹ��Ӧ�õ��û�id',
  appid mediumint(8) unsigned NOT NULL default '0' COMMENT 'Ӧ��id',
  profilelink text NOT NULL COMMENT 'Ӧ������',
  myml text NOT NULL COMMENT 'myml��ʽ����ҳ��ʾ��Ϣ',
  KEY uid (uid,appid)
) ENGINE=MyISAM COMMENT='�û�ʹ��Ӧ����չ��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_visitor'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_home_visitor;
CREATE TABLE pre_home_visitor (
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�ܷ����û�id',
  vuid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������û�id',
  vusername char(15) NOT NULL default '' COMMENT '�������û���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ���',
  PRIMARY KEY  (uid,vuid),
  KEY vuid (vuid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='�ռ������־��';



-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_article_title'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_article_title;
CREATE TABLE pre_portal_article_title (
  aid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����ID',
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ŀid',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ģ��id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�id',
  username varchar(255) NOT NULL default '' COMMENT '�û���',
  title varchar(255) NOT NULL default '' COMMENT '����',
  highlight varchar(255) NOT NULL default '' COMMENT '������ʽ',
  author varchar(255) NOT NULL default '' COMMENT 'ԭ����',
  `from` varchar(255) NOT NULL default '' COMMENT '��Դ',
  fromurl varchar(255) NOT NULL default '' COMMENT '��ԴURL',
  url varchar(255) NOT NULL default '' COMMENT '����URL',
  summary varchar(255) NOT NULL default '' COMMENT 'ժҪ',
  pic varchar(255) NOT NULL default '' COMMENT '����ͼƬ',
  thumb tinyint(1) NOT NULL default '0' COMMENT '����ͼƬ�Ƿ�����',
  remote tinyint(1) NOT NULL default '0' COMMENT '����ͼƬ�Ƿ�Զ��',
  id int(10) unsigned NOT NULL default '0' COMMENT '��ԴID',
  idtype varchar(255) NOT NULL default '' COMMENT '��ԴID����',
  contents smallint(6) NOT NULL default '0' COMMENT '���ݷ�ҳ��',
  allowcomment tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���������',
  owncomment tinyint(1) NOT NULL default '0' COMMENT '�������͹��������£�1��ʹ���������ۣ�0��ͬ��ԭ����/��־������/����',
  click1 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬1 id',
  click2 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬2 id',
  click3 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬3 id',
  click4 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬4 id',
  click5 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬5 id',
  click6 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬6 id',
  click7 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬7 id',
  click8 smallint(6) unsigned NOT NULL default '0' COMMENT '��̬8 id',
  tag tinyint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�������ԣ�����λ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '���ʱ��',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT '����״̬ 0-����� 1-��Ҫ��� 2-�Ѻ���',
  showinnernav tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ���ʾ��ҳ����',
  PRIMARY KEY  (aid),
  KEY catid  (catid,dateline)
) ENGINE=MyISAM COMMENT='�Ż����±����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_article_content'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_article_content;
CREATE TABLE pre_portal_article_content (
  cid int(10) unsigned NOT NULL auto_increment COMMENT '����ID',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ID',
  id int(10) unsigned NOT NULL default '0' COMMENT '��ԴID',
  idtype varchar(255) NOT NULL default '' COMMENT '��ԴID����',
  title varchar(255) NOT NULL default '' COMMENT '����',
  content text NOT NULL COMMENT '��������',
  pageorder smallint(6) unsigned NOT NULL default '0' COMMENT '��ҳ����',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '���ʱ��',
  PRIMARY KEY  (cid),
  KEY aid  (aid,pageorder),
  KEY pageorder  (pageorder)
) ENGINE=MyISAM COMMENT='�Ż��������ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_article_count'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_article_count;
CREATE TABLE pre_portal_article_count (
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ID',
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Ŀid',
  viewnum mediumint(8) unsigned NOT NULL default '0' COMMENT '�鿴��',
  commentnum mediumint(8) unsigned NOT NULL default '0' COMMENT '������',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '�����ղش���',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '���·������',
  PRIMARY KEY  (aid)
) ENGINE=MyISAM COMMENT='�Ż�����ͳ�����ݱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_article_trash'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_article_trash;
CREATE TABLE pre_portal_article_trash (
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '��������ID',
  content text NOT NULL COMMENT '�������ݵ�seriallize�洢',
  PRIMARY KEY (aid)
) ENGINE=MyISAM COMMENT='�Ż����»���վ��';


-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_comment'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_comment;
CREATE TABLE pre_portal_comment (
  cid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������۵��û�id',
  username varchar(255) NOT NULL default '' COMMENT '�������۵��û���',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '���۶���id',
  idtype varchar(20) NOT NULL default '' COMMENT '���۶����id���ͣ�aid��topicid',
  postip varchar(255) NOT NULL default '' COMMENT '����IP ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ���',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT '����״̬ 1-���',
  message text NOT NULL COMMENT '��������',
  PRIMARY KEY  (cid),
  KEY idtype (id,idtype,dateline)
) ENGINE=MyISAM COMMENT='�Ż����۱�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_rsscache'
--
-- ����ʱ��: 2010 �� 11 �� 10 �� 17:06
-- ������ʱ��: 2010 �� 11 �� 10 �� 17:06
--

DROP TABLE IF EXISTS pre_portal_rsscache;
CREATE TABLE pre_portal_rsscache (
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '������ʱ��',
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '���·���id',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  catname char(50) NOT NULL default '' COMMENT '��������',
  author char(15) NOT NULL default '' COMMENT '����',
  subject char(80) NOT NULL default '' COMMENT '����',
  description char(255) NOT NULL default '' COMMENT '����˵��',
  UNIQUE KEY aid (aid),
  KEY catid (catid,dateline)
) ENGINE=MyISAM COMMENT='����rss�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_topic'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_topic;
CREATE TABLE pre_portal_topic (
  topicid mediumint(8) unsigned NOT NULL auto_increment COMMENT 'ר��ID',
  title varchar(255) NOT NULL default '' COMMENT 'ר�����',
  name varchar(255) NOT NULL default '' COMMENT '��̬������',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  summary text NOT NULL COMMENT 'ר�����',
  keyword text NOT NULL COMMENT 'SEO �ؼ���',
  cover varchar(255) NOT NULL default '' COMMENT 'ר�����',
  picflag tinyint(1) NOT NULL default '0' COMMENT 'ͼƬ���� 0Ϊurl 1Ϊ���� 2 ΪftpԶ��',
  primaltplname varchar(255) NOT NULL default '' COMMENT 'ԭģ���ַ',
  useheader tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ʹ����վ��������',
  usefooter tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ʹ����վβ����Ϣ',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '������UID',
  username varchar(255) NOT NULL default '' COMMENT '�������û���',
  viewnum mediumint(8) unsigned NOT NULL default '0' COMMENT '�鿴��',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  closed tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ر�״̬',
  allowcomment tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���������',
  commentnum mediumint(8) unsigned NOT NULL default '0' COMMENT '������',
  PRIMARY KEY  (topicid),
  KEY name (name)
) ENGINE=MyISAM COMMENT='�Ż�ר���';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_portal_topic_pic'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_topic_pic;
CREATE TABLE pre_portal_topic_pic (
  picid mediumint(8) NOT NULL auto_increment COMMENT 'ͼƬID ',
  topicid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ͼƬ����ר��ID ',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ͼƬ�����û�ID ',
  username varchar(15) NOT NULL default '' COMMENT 'ͼƬ�����û���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'ͼƬ�ϴ�ʱ���',
  filename varchar(255) NOT NULL default '' COMMENT 'ͼƬ�ļ���',
  title varchar(255) NOT NULL default '' COMMENT 'ͼƬ����',
  size int(10) unsigned NOT NULL default '0' COMMENT 'ͼƬ��С',
  filepath varchar(255) NOT NULL default '' COMMENT 'ͼƬ·��',
  thumb tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  remote tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Զ��ͼƬ',
  PRIMARY KEY  (picid),
  KEY topicid (topicid)
) ENGINE=MyISAM COMMENT='�Ż�ר��ͼƬ��';


-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_diy_data'
--
-- ����ʱ��: 2010 �� 03 �� 08 �� 14:47
-- ������ʱ��: 2010 �� 03 �� 08 �� 14:47
--

DROP TABLE IF EXISTS pre_common_diy_data;
CREATE TABLE pre_common_diy_data (
  targettplname varchar(255) NOT NULL default '' COMMENT 'Ŀ��ģ���ļ���',
  tpldirectory varchar(80) NOT NULL default '' COMMENT 'ԭģ������Ŀ¼',
  primaltplname varchar(255) NOT NULL default '' COMMENT 'ԭģ���ļ���',
  diycontent mediumtext NOT NULL COMMENT 'DIY������',
  `name` varchar(255) NOT NULL default '' COMMENT 'Ŀ��ģ��ҳ������',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username varchar(15) NOT NULL default '' COMMENT '�û���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  PRIMARY KEY (targettplname, tpldirectory)
) ENGINE=MyISAM COMMENT='DIYģ��ҳ�����ݵĴ浵��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_template_block'
--
-- ����ʱ��: 2010 �� 03 �� 08 �� 14:47
-- ������ʱ��: 2010 �� 03 �� 08 �� 14:47
--

DROP TABLE IF EXISTS pre_common_template_block;
CREATE TABLE pre_common_template_block (
  targettplname varchar(255) NOT NULL default '' COMMENT 'Ŀ��ģ���ļ���',
  tpldirectory varchar(80) NOT NULL default '' COMMENT 'ԭģ������Ŀ¼',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ģ��ID',
  PRIMARY KEY  (targettplname, tpldirectory, bid),
  KEY bid (bid)
) ENGINE=MyISAM COMMENT='ģ��ҳ���ģ��Ĺ�����';

-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_template_permission'
--
-- ����ʱ��: 2010 �� 2 �� 26 ��  11:08
DROP TABLE IF EXISTS pre_common_template_permission;
CREATE TABLE pre_common_template_permission (
  targettplname varchar(255) NOT NULL DEFAULT '' COMMENT 'Ŀ��ģ��',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '�������',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '�����Ƽ�',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƽ���Ҫ���',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '�̳��Ե�ģ������',
  PRIMARY KEY (targettplname,uid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='DIYģ��ҳ��Ȩ�ޱ�';

--
-- ��Ľṹ 'pre_common_block_permission'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_common_block_permission;
CREATE TABLE pre_common_block_permission (
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT 'ģ��ID',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '�������',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '�����Ƽ�',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƽ���Ҫ���',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '�̳��Ե�ģ������',
  PRIMARY KEY (bid, uid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='ģ��Ȩ�ޱ�';


-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_portal_category_permission'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_portal_category_permission;
CREATE TABLE pre_portal_category_permission (
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '����ID',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  allowpublish tinyint(1) NOT NULL default '0' COMMENT '����������',
  allowmanage tinyint(1) NOT NULL default '0' COMMENT '�����������',
  inheritedcatid mediumint(8) NOT NULL DEFAULT '0' COMMENT '�̳��Ե�Ƶ��ID',
  PRIMARY KEY (catid, uid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='���·���Ȩ�ޱ�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_category'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_category;
CREATE TABLE pre_portal_category (
  catid mediumint(8) unsigned NOT NULL auto_increment COMMENT '��Ŀid',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '�ϼ���Ŀid',
  catname varchar(255) NOT NULL default '' COMMENT '����',
  articles mediumint(8) unsigned NOT NULL default '0' COMMENT '������',
  allowcomment tinyint(1) NOT NULL default '1' COMMENT '�Ƿ���������',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  notinheritedarticle tinyint(1) NOT NULL default '0' COMMENT '�Ƿ񲻼̳��ϼ����¹���Ȩ��',
  notinheritedblock tinyint(1) NOT NULL default '0' COMMENT '�Ƿ񲻼̳��ϼ�DIYҳ���ģ��Ȩ��',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '�Զ�������',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '������ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '�������û���',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ�ر�',
  shownav tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��ڵ�����ʾ',
  description text NOT NULL COMMENT '������� SEO����',
  seotitle text NOT NULL COMMENT 'SEO ����',
  keyword text NOT NULL COMMENT 'SEO �ؼ���',
  primaltplname varchar(255) NOT NULL default '' COMMENT '�б�ҳԭģ���ַ',
  articleprimaltplname varchar(255) NOT NULL default '' COMMENT '����ҳԭģ���ַ',
  disallowpublish tinyint(1) NOT NULL DEFAULT '0' COMMENT '�Ƿ��ֹ��������',
  foldername varchar(255) NOT NULL DEFAULT '' COMMENT '�ļ�������',
  notshowarticlesummay varchar(255) NOT NULL DEFAULT '' COMMENT '��������ҳ�Ƿ���ʾժҪ',
  perpage smallint(6) NOT NULL default '0' COMMENT '�б�ÿҳ��ʾ������',
  maxpages smallint(6) NOT NULL default '0' COMMENT '�б�����ҳ��',
  PRIMARY KEY  (catid)
) ENGINE=MyISAM COMMENT='�Ż� ������Ŀ��';


-- --------------------------------------------------------
--
-- ��Ľṹ 'pre_common_process'
--
-- ����ʱ��: 2009 �� 12 �� 16 ��  11:08
DROP TABLE IF EXISTS pre_common_process;
CREATE TABLE pre_common_process (
  processid char(32) NOT NULL COMMENT '�����Ƶ�md5',
  expiry int(10) DEFAULT NULL COMMENT '���Ĺ���ʱ��',
  extra int(10) DEFAULT NULL COMMENT '���ĸ�����Ϣ',
  PRIMARY KEY (processid),
  KEY expiry (expiry)
) ENGINE=MEMORY COMMENT='����������';

--
-- ��Ľṹ 'pre_common_admincp_group'
--
DROP TABLE IF EXISTS pre_common_admincp_group;
CREATE TABLE pre_common_admincp_group (
 cpgroupid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '��̨��id',
 cpgroupname varchar(255) NOT NULL COMMENT '��̨������',
 PRIMARY KEY (cpgroupid)
) ENGINE=MyISAM COMMENT='��̨������';

--
-- ��Ľṹ 'pre_common_admincp_member'
--
DROP TABLE IF EXISTS pre_common_admincp_member;
CREATE TABLE pre_common_admincp_member (
 uid int(10) unsigned NOT NULL COMMENT '��Աuid',
 cpgroupid int(10) unsigned NOT NULL COMMENT '��Ա��id',
 customperm text NOT NULL COMMENT '�Զ������Ȩ��',
 PRIMARY KEY (uid)
) ENGINE=MyISAM COMMENT='��̨�����Ա';

--
-- ��Ľṹ 'pre_common_admincp_perm'
--
DROP TABLE IF EXISTS pre_common_admincp_perm;
CREATE TABLE pre_common_admincp_perm (
 cpgroupid smallint(6) unsigned NOT NULL COMMENT '��̨��id',
 perm varchar(255) NOT NULL COMMENT '��̨��Ȩ��',
 UNIQUE KEY cpgroupperm (cpgroupid,perm)
) ENGINE=MyISAM COMMENT='��̨Ȩ�ޱ�';

--
-- ��Ľṹ 'pre_common_admincp_session'
--
DROP TABLE IF EXISTS pre_common_admincp_session;
CREATE TABLE pre_common_admincp_session (
 uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�û�id',
 adminid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '������id',
 panel tinyint(1) NOT NULL DEFAULT '0' COMMENT '���λ��',
 ip varchar(15) NOT NULL DEFAULT '' COMMENT 'IP',
 dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�����ʱ��',
 errorcount tinyint(1) NOT NULL DEFAULT '0' COMMENT '��¼�������',
 storage mediumtext NOT NULL COMMENT '��ʱ���ݴ洢',
 PRIMARY KEY (uid,panel)
) ENGINE=MyISAM COMMENT='��̨session��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_attachment'
--
-- ����ʱ��: 2009 �� 11 �� 10 �� 14:47
-- ������ʱ��: 2009 �� 11 �� 10 �� 14:47
--

DROP TABLE IF EXISTS pre_portal_attachment;
CREATE TABLE pre_portal_attachment (
  attachid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����id',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ϴ�ʱ��',
  filename varchar(255) NOT NULL default '' COMMENT 'ԭ�ļ���',
  filetype varchar(255) NOT NULL default '' COMMENT '�ļ�����',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '�ļ���С',
  attachment varchar(255) NOT NULL default '' COMMENT '������·��',
  isimage tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ͼƬ',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�������ͼ',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '�Ƿ�Զ�̸���',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '����id',
  PRIMARY KEY  (attachid),
  KEY aid (aid,attachid)
) ENGINE=MyISAM COMMENT='�Ż����¸�����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_portal_article_related'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_portal_article_related;
CREATE TABLE pre_portal_article_related (
  aid mediumint(8) unsigned NOT NULL auto_increment COMMENT '����ID',
  raid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������ID',
  displayorder mediumint(8) unsigned NOT NULL default '0' COMMENT '��ʾ˳��',
  PRIMARY KEY  (aid,raid),
  KEY aid  (aid,displayorder)
) ENGINE=MyISAM COMMENT='�Ż��������';

--
-- ��Ľṹ 'pre_home_specialuser'
--
-- ����ʱ��: 2010 �� 2 �� 20 ��  10:08
-- ������ʱ��: 2010 �� 2 �� 20 ��  10:08
--

DROP TABLE IF EXISTS pre_home_specialuser;
CREATE TABLE pre_home_specialuser (
 uid mediumint(8) unsigned NOT NULL default '0' COMMENT '�û�ID',
 username varchar(15) NOT NULL default '' COMMENT '�û���',
 status tinyint(1) unsigned NOT NULL default '0' COMMENT '�û�����0Ϊ�Ƽ��û�1ΪĬ�Ϻ���',
 dateline int(10) NOT NULL default '0' COMMENT '����ʱ��',
 reason text NOT NULL COMMENT '����ԭ��',
 opuid mediumint(8) unsigned NOT NULL default '0' COMMENT '�������û�ID',
 opusername varchar(15) NOT NULL default '' COMMENT '�������û���',
 displayorder mediumint(8) unsigned NOT NULL default '0' COMMENT '��ʾ˳��',
 KEY uid (uid,status),
 KEY displayorder (status,displayorder)
) ENGINE=MyISAM COMMENT='�����û���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_district'
--
-- ����ʱ��: 2010 �� 03 �� 08 �� 14:47
-- ������ʱ��: 2010 �� 03 �� 08 �� 14:47
--

DROP TABLE IF EXISTS pre_common_district;
CREATE TABLE pre_common_district (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '����ID',
  `name` varchar(255) NOT NULL default '' COMMENT '��������',
  `level` tinyint(4) unsigned NOT NULL default '0' COMMENT '�����ȼ���1��ʡ����2���м���3���ؼ���4������',
  usetype tinyint(1) unsigned NOT NULL default '0' COMMENT 'ʹ�ö���0:��������; 1:������; 2:��ס��; 3:������',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '�ϼ�����ID',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  PRIMARY KEY  (id),
  KEY upid (upid,displayorder)
) ENGINE=MyISAM COMMENT='������';

-- --------------------------------------------------------

-- ��Ľṹ 'pre_forum_grouplevel'
--
-- ����ʱ��: 2010 �� 03 �� 08 �� 14:47
-- ������ʱ��: 2010 �� 03 �� 08 �� 14:47
--

DROP TABLE IF EXISTS pre_forum_grouplevel;
CREATE TABLE pre_forum_grouplevel (
  levelid smallint(6) unsigned NOT NULL auto_increment COMMENT '�ȼ�ID',
  `type` enum('special','default') NOT NULL default 'default' COMMENT '����',
  leveltitle varchar(255) NOT NULL default '' COMMENT 'Ⱥ��ȼ�����',
  creditshigher int(10) NOT NULL default '0' COMMENT '�õȼ��Ļ�������',
  creditslower int(10) NOT NULL default '0' COMMENT '�õȼ��Ļ�������',
  icon varchar(255) NOT NULL default '' COMMENT '�ȼ�ͼ��',
  creditspolicy text NOT NULL COMMENT '���ֲ���',
  postpolicy text NOT NULL COMMENT '���Ӳ���',
  specialswitch text NOT NULL COMMENT '���⿪�ܿ���',
  PRIMARY KEY (levelid),
  KEY creditsrange (creditshigher,creditslower)
) ENGINE=MyISAM COMMENT='Ⱥ��ȼ���';

--
-- ��Ľṹ 'pre_forum_groupcreditslog'
--
-- ����ʱ��: 2010 �� 03 �� 08 �� 14:47
-- ������ʱ��: 2010 �� 03 �� 08 �� 14:47
--
DROP TABLE IF EXISTS pre_forum_groupcreditslog;
CREATE TABLE pre_forum_groupcreditslog (
  fid mediumint(8) unsigned NOT NULL COMMENT 'Ⱥ��ID',
  uid mediumint(8) unsigned NOT NULL COMMENT '��ԱUID',
  logdate int(8) NOT NULL default '0' COMMENT '����/20100308',
  PRIMARY KEY  (fid,uid,logdate)
) ENGINE=MyISAM COMMENT='Ⱥ�������־��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_blog_category'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_home_blog_category;
CREATE TABLE pre_home_blog_category (
  catid mediumint(8) unsigned NOT NULL auto_increment COMMENT '��Ŀid',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '�ϼ���Ŀid',
  catname varchar(255) NOT NULL default '' COMMENT '����',
  num mediumint(8) unsigned NOT NULL default '0' COMMENT '��־��',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  PRIMARY KEY  (catid)
) ENGINE=MyISAM COMMENT='��־ϵͳ��Ŀ';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_home_album_category'
--
-- ����ʱ��: 2009 �� 11 �� 30 ��  11:08
-- ������ʱ��: 2009 �� 11 �� 30 ��  11:08
--

DROP TABLE IF EXISTS pre_home_album_category;
CREATE TABLE pre_home_album_category (
  catid mediumint(8) unsigned NOT NULL auto_increment COMMENT '��Ŀid',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '�ϼ���Ŀid',
  catname varchar(255) NOT NULL default '' COMMENT '����',
  num mediumint(8) unsigned NOT NULL default '0' COMMENT '�����',
  displayorder smallint(6) NOT NULL default '0' COMMENT '��ʾ˳��',
  PRIMARY KEY  (catid)
) ENGINE=MyISAM COMMENT='���ϵͳ��Ŀ';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_report'
--
-- ����ʱ��: 2010 �� 04 �� 07 ��  17:08
-- ������ʱ��: 2010 �� 04 �� 07 ��  17:08
--

DROP TABLE IF EXISTS pre_common_report;
CREATE TABLE pre_common_report (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '��¼id',
  urlkey char(32) NOT NULL default '' COMMENT '��ַmd5',
  url varchar(255) NOT NULL default '' COMMENT '��ַ',
  message text NOT NULL COMMENT '�ٱ�����',
  uid mediumint(8) unsigned NOT NULL default '0' COMMENT '��Աid',
  username varchar(15) NOT NULL default '' COMMENT '�û���',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '�ٱ�ʱ��',
  num smallint(6) unsigned NOT NULL default '1' COMMENT '�ٱ�����',
  opuid mediumint(8) unsigned NOT NULL default '0' COMMENT '����Աid',
  opname varchar(15) NOT NULL default '' COMMENT '����Ա����',
  optime int(10) unsigned NOT NULL default '0' COMMENT '����ʱ��',
  opresult varchar(255) NOT NULL default '' COMMENT '�Ծٱ��˵Ľ���',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '��̳id',
  PRIMARY KEY  (id),
  KEY urlkey (urlkey),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='�û��ٱ���';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_common_patch'
--
-- ����ʱ��: 2011 �� 07 �� 25 ��  17:08
-- ������ʱ��: 2011 �� 07 �� 25 ��  17:08
--

DROP TABLE IF EXISTS pre_common_patch;
CREATE TABLE pre_common_patch (
  serial varchar(10) NOT NULL default '' COMMENT '©�����',
  rule text NOT NULL COMMENT '�޲�����',
  note text NOT NULL COMMENT '©��˵��',
  `status` tinyint(1) NOT NULL default '0' COMMENT '�޲�״̬',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '©������ʱ��',
  PRIMARY KEY  (serial)
) ENGINE=MyISAM COMMENT='©��������';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_collection'
--
-- ����ʱ��: 2011 �� 10 �� 13 �� 06:14
-- ������: 2011 �� 10 �� 13 �� 06:14
--

DROP TABLE IF EXISTS pre_forum_collection;
CREATE TABLE pre_forum_collection (
  ctid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ר��ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '�û���',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'ר����',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  follownum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '������',
  threadnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '������',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '������',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '���',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '���䶯ʱ��',
  rate float NOT NULL DEFAULT '0' COMMENT '����',
  ratenum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '���ִ���',
  lastpost mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�������ID',
  lastsubject varchar(80) NOT NULL DEFAULT '' COMMENT '����������',
  lastposttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '�������ʱ��',
  lastposter varchar(15) NOT NULL DEFAULT '' COMMENT '������ⷢ����',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '������������',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT 'ר���ؼ���',
  PRIMARY KEY (ctid),
  KEY dateline (dateline),
  KEY hotcollection (threadnum,lastupdate),
  KEY follownum (follownum)
) ENGINE=MyISAM COMMENT='����ר����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_collectioncomment'
--
-- ����ʱ��: 2011 �� 09 �� 15 �� 09:03
-- ������: 2011 �� 10 �� 13 �� 05:27
--

DROP TABLE IF EXISTS pre_forum_collectioncomment;
CREATE TABLE pre_forum_collectioncomment (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '����ID',
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ר��ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '�û���',
  message text NOT NULL COMMENT '��������',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  useip varchar(16) NOT NULL DEFAULT '' COMMENT 'IP��ַ',
  rate float NOT NULL DEFAULT '0' COMMENT '����',
  PRIMARY KEY (cid),
  KEY ctid (ctid,dateline),
  KEY userrate (ctid,uid,rate)
) ENGINE=MyISAM COMMENT='�������۱�';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_collectionfollow'
--
-- ����ʱ��: 2011 �� 10 �� 13 �� 06:28
-- ������: 2011 �� 10 �� 13 �� 06:28
--

DROP TABLE IF EXISTS pre_forum_collectionfollow;
CREATE TABLE pre_forum_collectionfollow (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '�û�ID',
  username char(15) NOT NULL DEFAULT '' COMMENT '�û���',
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ר��ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��עʱ��',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '������ר��ʱ��',
  PRIMARY KEY (uid,ctid),
  KEY ctid (ctid,dateline)
) ENGINE=MyISAM COMMENT='������ע��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_collectioninvite'
--
-- ����ʱ��: 2011 �� 09 �� 07 �� 01:54
-- ������: 2011 �� 10 �� 13 �� 04:02
-- �����: 2011 �� 09 �� 07 �� 01:54
--

DROP TABLE IF EXISTS pre_forum_collectioninvite;
CREATE TABLE pre_forum_collectioninvite (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ר��ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '���������ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����ʱ��',
  PRIMARY KEY (ctid,uid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='���������ר��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_collectionrelated'
--
-- ����ʱ��: 2011 �� 09 �� 01 �� 06:14
-- ������: 2011 �� 10 �� 13 �� 06:02
--

DROP TABLE IF EXISTS pre_forum_collectionrelated;
CREATE TABLE pre_forum_collectionrelated (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '����ID',
  collection text NOT NULL COMMENT 'ר���б�',
  PRIMARY KEY (tid)
) ENGINE=MyISAM COMMENT='�������ⱻ����ר����';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_collectionteamworker'
--
-- ����ʱ��: 2011 �� 10 �� 13 �� 06:12
-- ������: 2011 �� 10 �� 13 �� 06:12
--

DROP TABLE IF EXISTS pre_forum_collectionteamworker;
CREATE TABLE pre_forum_collectionteamworker (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ר��ID',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '������ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'ר����',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '�û���',
  lastvisit int(8) unsigned NOT NULL DEFAULT '0' COMMENT '������ר��ʱ��',
  PRIMARY KEY (ctid,uid)
) ENGINE=MyISAM COMMENT='���������༭��';

-- --------------------------------------------------------

--
-- ��Ľṹ 'pre_forum_collectionthread'
--
-- ����ʱ��: 2011 �� 09 �� 14 �� 06:58
-- ������: 2011 �� 10 �� 13 �� 06:02
--

DROP TABLE IF EXISTS pre_forum_collectionthread;
CREATE TABLE pre_forum_collectionthread (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ר��ID',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ר��������ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '��������',
  reason varchar(255) NOT NULL DEFAULT '' COMMENT '�Ƽ�����',
  PRIMARY KEY (ctid,tid),
  KEY ctid (ctid,dateline)
) ENGINE=MyISAM COMMENT='�������������';
