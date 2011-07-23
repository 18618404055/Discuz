<?php

/* �����̵��������� For Discuz X2.0
   $Id:shop.func.php 2011-07-20 Rufey_Lau
 */
 
if(!defined('IN_DISCUZ')&&!defined('IN_BKSHOP')){
	exit('Access Denied!');
}

//���ֺ���
function credit($_this = ''){
	global $_G;
	foreach($_G['setting']['extcredits'] as $id => $val){
		if($_this == $id){	
			$selected = 'selected="selected"';	
		}else{
			$selected = '';
		}
		$str .= "<option value=\"{$id}\" {$selected}>".$val['title']."</option>";
	}
	return $str;
}

//�������ƻ�ȡ����
function getcreditname($id, $echo = TRUE){
	global $_G;
	$return = $_G['setting']['extcredits'][$id]['title'];
	if($echo){
		echo $return;
	}else{
		return $return;
	}
}

//�����ַ��������������
function limitstr($str, $lenmax){
	$strlen = strlen($str);
	if($lenmax > $strlen){
		return $str;
	}else{
		$character = 0;
		for($i = 0; $i < $lenmax; $i++){
			if(ord(substr($str, $i, 1)) <= 128){
				$character++;
			}
		}
		if(($lenmax%2 == 1)&&($character%2 == 0)){
			$lenmax++;
		}
		if(($lenmax%2 == 0)&&($character%2 == 1)){
			$lenmax++;
		}
		$return = substr($str, 0, $lenmax);
		return $return;
	}
}

//�Զ��б�������
function datalist($table, $condition = '', $rows = 10, $ispage = TRUE, $orderby = '', $pageurl = '', $order = 'desc', $startpage = 0){
	global $_G;
	$result = array();
	if($ispage){
		$page = max(1, $_G['gp_page']);
		$start = ($page - 1) * $rows;
		$limit = "limit $start,$rows";
	}else{
		$limit = '';
	}
	if($orderby!==''){
		$theorder = "order by `$orderby` $order";
	}else{
		$theorder = '';
	}
	$query = DB::query("SELECT * FROM ".DB::table($table)." $condition $theorder $limit");
	while($fetch = DB::fetch($query)){
		$result[] = $fetch;	
	}
	$count = DB::result_first("SELECT COUNT(*) FROM ".DB::table($table)." $condition");
	$multi = multi($count, $rows, $page, $pageurl);
	$return = array($result,$multi);
	return $return;
}

function fetch($bid){
	$query = DB::fetch_first("SELECT * FROM ".DB::table('bkshop')." WHERE `id` = '$bid'");
	return $query;
}

//�û����ú���
function config($switch = 1, $repeat = 0, $level = 3, $vertical = 1){
	$true = 'selected="selected"';
	if($switch == 1){
		$on = $true;
		$off = '';
	}else{
		$on = '';
		$off = $true;
	}
	echo '<p>��������&#65306;<select name="switch" style="width:80px;">
	<option value="1" '.$on.'>��</option>
	<option value="0" '.$off.'>��</option>
	</select></p>';
	if($repeat == 1){
		$repeat = $true;
		$norepeat = '';
		$repeatx = '';
		$repeaty = '';
	}elseif($repeat == 0){
		$repeat = '';
		$norepeat = $true;
		$repeatx = '';
		$repeaty = '';
	}elseif($repeat == 2){
		$repeat = '';
		$norepeat = '';
		$repeatx = $true;
		$repeaty = '';
	}else{
		$repeat = '';
		$norepeat = '';
		$repeatx = '';
		$repeaty = $true;
	}
	echo '<p>�����ظ�&#65306;<select name="repeat" style="width:80px;">
	<option value="1" '.$repeat.'>��</option>
	<option value="0" '.$norepeat.'>��</option>
	<option value="2" '.$repeatx.'>����</option>
	<option value="3" '.$repeaty.'>����</option>	
	</select></p>';
	if($level == 1){
		$left = $true;
		$center = '';
		$right = '';
	}elseif($level == 2){
		$left = '';
		$center = $true;
		$right = '';
	}else{
		$left = '';
		$center = '';
		$right = $true;
	}
	echo '<p>ˮƽλ��&#65306;<select name="level" style="width:80px;">
	<option value="1" '.$left.'>��</option>
	<option value="2" '.$center.'>��</option>
	<option value="3" '.$right.'>��</option>
	</select></p>';	
	if($vertical == 1){
		$up = $true;
		$middle = '';
		$down = '';
	}elseif($vertical == 2){
		$up = '';
		$middle = $true;
		$down = '';
	}else{
		$up = '';
		$middle = '';
		$down = $true;
	}
	echo '<p>��ֱλ��&#65306;<select name="vertical" style="width:80px;">
	<option value="1" '.$up.'>��</option>
	<option value="2" '.$middle.'>��</option>
	<option value="3" '.$down.'>��</option>
	</select>
	</p>';	
}

?>