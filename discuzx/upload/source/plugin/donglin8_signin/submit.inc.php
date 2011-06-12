<?php

/*
	ÿ����¥ǩ�� for DX 1.5
	Powered by Donglin8.Com 2010.10
*/

if(!defined('IN_DISCUZ')) {
		exit('Access Denied');
}
$tid = intval($_G['gp_tid']);
if (!$_G['uid']) {
	showmessage('�οͲ�����ȡ�����뷵�ء�', NULL, 'HALTED');
}
loadcache('plugin');
$config=$_G['cache']['plugin']['donglin8_signin'];	
$thread = db::fetch_first("SELECT * FROM ".DB::table('forum_thread')." WHERE tid = '$tid'");
if (!$thread) {
	header('HTTP/1.0 404 Not Found');
	showmessage('thread_nonexistence');
}

if (!class_exists('threadplugin_donglin8_signin')) {
	require_once dirname(__FILE__).'/donglin8_signin.class.php';
}

$gsobj = new threadplugin_donglin8_signin();

$todayzero = strtotime('today');
$signin_begint = $config['donglin8_begin'] * 3600 + $todayzero;
$signin_endt = $config['donglin8_end'] * 3600 + $todayzero;

if ($thread['dateline'] < $todayzero) {
	showmessage('��ֻ���ڽ��յ�ǩ��������ȡ�����뷵�ء�', NULL, 'HALTED');
}

$rpost = db::fetch_first("SELECT p.*, gs.bonused FROM ".DB::table('forum_post')." AS p
	LEFT JOIN ".DB::table('forum_donglin8_signin')." AS gs ON(gs.pid = p.pid)
	WHERE p.tid = '$tid' AND p.authorid = '$_G[uid]' ORDER BY p.dateline ASC LIMIT 1");
if (!$rpost) {
	showmessage('����û��ǩ����������ȡ�������ȷ��أ�����ظ���ǩ��������֡�', NULL, 'HALTED');
}

if ($rpost['first'] == 1 || $rpost['authorid'] == $thread['authorid']) {
	showmessage('����¥������Ľ�����������¥��ʱ��ϵͳ���Ѿ����ϣ��뷵�ء�', NULL, 'HALTED');
}

if ($rpost['bonused'] > 0) {
	showmessage('�������Ѿ���������ˣ��뷵�ء�', NULL, 'HALTED');
}

if ($rpost['dateline'] < $signin_begint) {
	showmessage('δ���콱ʱ�䣬�����ڱ��� '. $gsobj->config['donglin8_begin'].' �������ǩ�����뷵�ء�');
} elseif ($rpost['dateline'] > $signin_endt) {
	showmessage('�ѳ����콱ʱ�ޣ��������磬�뷵�ء�', NULL, 'HALTED');
}
        
$query = db::query("SELECT COUNT(p.pid) FROM ".DB::table('forum_post')." AS p
	LEFT JOIN ".DB::table('forum_donglin8_signin')." AS gs ON(gs.pid = p.pid)
	WHERE p.tid = '$tid' AND gs.bonused > 0 GROUP BY p.authorid");
$ecount = db::num_rows($query);

//ǩ������
$signin_bonus = $ecount < 10 ? $config['donglin8_bonus_top10'] : $config['donglin8_bonus'];
if (in_array($config['donglin8_extcreditx'], range(1,8))) {
	$ext3 = "extcredits".$config["donglin8_extcreditx"];
	DB::query("UPDATE ".DB::table('common_member_count')." SET ".$ext3. "= ".$ext3."+ ".$signin_bonus." WHERE uid='".$_G[uid]."'");
}
$timer = $_G['timestamp'] + 28757;
db::query("REPLACE INTO ".DB::table('forum_donglin8_signin')." (pid, bonused, bdateline) VALUES ('$rpost[pid]', '$signin_bonus', '".$timer."')", 'UNBUFFERED');
db::query("UPDATE ".DB::table('forum_post')." SET rate=rate+($signin_bonus), ratetimes=ratetimes+5 WHERE pid = '$rpost[pid]'", 'UNBUFFERED');
db::query("INSERT INTO ".DB::table('forum_ratelog')." (pid, uid, username, extcredits, dateline, score, reason)
	VALUES ('$rpost[pid]', '0', 'ϵͳ����', '".$config['donglin8_extcreditx']."', '".$timer."', '$signin_bonus', '')", 'UNBUFFERED');
        
showmessage('��ϲ������ȡ����ɹ���', 'forum.php?mod=viewthread&tid='.$tid);

?>