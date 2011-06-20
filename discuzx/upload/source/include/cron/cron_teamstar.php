<?php

/*
* 
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
*/

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}
global $_G;
loadcache('plugin');
$team = $_G['cache']['plugin']['team'];
$open = $team['open'];
if ($open == '1') {
$money = "extcredits".$team['money'];
$moneyname = $_G['setting']['extcredits'][$team['money']]['title'];
$moneynum = $team['moneynum'];
$moneymax = $team['moneymax'];
$monthpostnum = $team['monthpostnum'];
$digestpostnum = $team['digestpostnum'];
$modactionnum = $team['modactionnum'];
$thismonthnum = $team['thismonthnum'];
$gjdata = $team['gjdata'];
$adminidgroup = $team['adminidgroup'];
$date=date("Y-m");

$query = DB::query("SELECT uid, username, adminid FROM ".DB::table('common_member')." WHERE adminid IN ($adminidgroup)");
while($member = DB::fetch($query)) {
$uid = $member['uid'];
$username = $member['username'];
$authorid = $uid;
$timeago=$_G['timestamp']-86400*30;
$monthpost = DB::result_first("SELECT count(*) FROM ".DB::table("forum_post")." WHERE `authorid` ='$uid' AND `dateline` >='$timeago'");
$starttime = gmdate("Y-m-1", TIMESTAMP-86400*30);
$modactions = DB::result_first("SELECT sum(count) AS actioncount FROM ".DB::table('forum_modwork')." WHERE uid ='$uid' AND dateline>='$starttime'");
$digestposts = DB::result_first("SELECT count(*) FROM ".DB::table("forum_thread")." WHERE `authorid` ='$uid' AND digest IN (1, 2, 3) AND `dateline` >='$timeago'");
$thismonth = DB::result_first("SELECT thismonth FROM ".DB::table("common_onlinetime")." WHERE uid ='$uid'");
$thismonth = round($thismonth / 60, 2);
$modactions += 0;
$alldata += 0;
if( $modactions >= $gjdata  ){
	$alldata=$money + ($monthpost * $monthpostnum) + ($modactions * $modactionnum) + ($digestposts * $digestpostnum) + ($thismonth * $thismonthnum);
	$alldata=min($alldata,$moneymax);
	updatemembercount($uid , array($money => $alldata));
}
notification_add($uid,0,'�𾴵� '.$_G['setting']['bbname'].' �����Ա '.$username.'���������� '.$date.' �ݵĹ����档<br>�������� '.$thismonth.' Сʱ�������� '.$monthpost.' ƪ���ӣ����о����� '.$digestposts.' ƪ������������� '.$modactions.' �Ρ�<br>�������� '.$date.' �ݵı��� '.$_G['setting']['bbname'].' �ŶӸ������Ž��� '.$moneyname.' + '.$alldata.' ����<br>( ���㹫ʽ: �������� '.$moneyname.' '.$moneynum.' �� + ������ '.$monthpost.' x '.$monthpostnum.' + ������ '.$modactions.' x '.$modactionnum.' + ������ '.$digestposts.' x '.$digestpostnum.' + ���� '.$thismonth.' x '.$thismonthnum.' )��<br>��л�����͵Ĺ���������ÿ��ͳ��1�Σ�����ÿ�·���1�Σ���������Ŭ��Ϊ '.$_G['setting']['bbname'].' �ķ�չ�������๱�ף�<br>ע��ÿ�±��볬��'.$gjdata.'�����Ϲ�����н�������߽������� '.$moneyname.' '.$moneymax.' ����<br><br>'.$_G['setting']['bbname'].'�����顣',0,1);
}
}
?>