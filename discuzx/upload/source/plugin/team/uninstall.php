<?php

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

$sql = <<<EOF

DELETE FROM pre_common_cron WHERE `name` = '�������ʷ���';

EOF;

runquery($sql);

$finish = TRUE;

?>