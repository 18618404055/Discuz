<?php

$config = loadconfig();
$db_source = new db_mysql($config['source']);
$db_source->connect();

$db_target = new db_mysql($config['target']);
$db_target->connect();

$db_uc = new db_mysql($config['ucenter']);
if($setting['config']['ucenter']) {
	$db_uc->connect();
}

$process = load_process('main');
if(empty($process)) {
	showmessage("�Э�������ഫ�{��", "index.php?action=select&source=$source");
}

$prg = getgpc('prg');

$prg_dir['tables'] = DISCUZ_ROOT.'./source/'.$source.'/table/';
$prg_dir['start'] = DISCUZ_ROOT.'./source/'.$source.'/';
$prg_dir['steps'] = DISCUZ_ROOT.'./source/'.$source.'/';

$prg_done = 0;
$prg_next = '';
$prg_total = $prg_total = count($process['tables']) + count($process['start']) + count($process['steps']);

foreach (array('start', 'tables', 'steps') as $program) {
	if(!empty($process[$program]) && !$process[$program.'_is_end']) {
		foreach ($process[$program] as $k => $v) {
			if($v) {
				$prg_done ++;
			} elseif ($prg_next == '') {
				$prg_next = $k;
			}
		}
		if($prg_next) {
			if(empty($prg) || !file_exists($prg_dir[$program].$prg)) {
				$prg = $prg_next;
			}
			$prg_done ++;

			list($rday, $rhour, $rmin, $rsec) = remaintime(time() - $process['timestart']);
			$stime = gmdate('Y-m-d H:i:s', $process['timestart'] + 3600* 8);
			$timetodo = "�ɯŶ}�l�ɶ��G<strong>$stime</strong>, �ɯŵ{�Ǥw�g����F <strong>$rday</strong>�� <strong>$rhour</strong>�p�� <strong>$rmin</strong>�� <strong>$rsec</strong>��";
			$timetodo .= "<br><br>�ثe���b�����ഫ�{��( $prg_done / $prg_total ) <strong>$prg</strong>�A�ഫ�L�{���ݭn�h������A�Ф������s�����C";
			$timetodo .= "<br><br>�p�G�{�Ǥ��_�Ϊ̻ݭn���s�}�l��e�{�ǡA���I�� (<a href=\"index.php?a=convert&source=$source&prg=$prg\">���s�}�l</a>)";

			showtips($timetodo);
			if(file_exists($prg_dir[$program].$prg)) {
				define('PROGRAM_TYPE', $program);
				require $prg_dir[$program].$prg;
				save_process_main($prg);
				showmessage("�ഫ�{�� $prg ���槹���A �{�b�����U�@�ӵ{��", "index.php?a=convert&source=$source", null, 500);
			} else {
				showmessage('�ƾ��ഫ���_! �L�k����ഫ�{�� '.$prg);
			}
		} else {
			$process[$program.'_is_end'] = 1;
			save_process('main', $process);
		}
	} else {
		$prg_done = $prg_done + count($process[$program]);
	}
}

showmessage('�ഫ�{�ǥ����B�槹��', "index.php?action=finish&source=$source");

function save_process_main($prg = '') {
	global $process;
	if(defined('PROGRAM_TYPE')) {
		$prg = empty($prg) ? $GLOBALS['prg'] : $prg;
		$process[PROGRAM_TYPE][$prg] = 1;
	}
	save_process('main', $process);
}
?>