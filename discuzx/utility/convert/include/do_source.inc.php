<?php

$datadir = DISCUZ_ROOT.'./source/';

showtips('<li><strong>�b�}�l�ഫ���e�A�нT�O���{�ǥؿ��U�� data �ؿ����i�g�v���A�_�h�L�k�s�x�ഫ�]�m</strong></li><li><strong>�p�G��Discuz!�MUChome�P�ɻݭn�ɯšA�аȥ����ɯ�Discuz!�׾�</strong></li><li>�Х��T����ഫ�{�ǡA�_�h�i��y���L�k�ഫ���\</li><li>���ഫ�{�Ǥ��|�}�a��l�ƾڡA�ҥH�ഫ�ݭn2�����l�ƾڪŶ�</li>');

if(is_dir($datadir)) {

	$cdir = dir($datadir);
	show_table_header();
	show_table_row(array(
			'��l����',
			'�ؼЪ���',
			array('width="50%"', '²��'),
			array('width="5%"', '����'),
			array('width="5%"', '�]�m'),
			array('width="5%"', ''),
		), 'header title');
	while(($entry = $cdir->read()) !== false) {
		if(($entry != '.' && $entry != '..') && is_dir($datadir.$entry)) {
			$settingfile = $datadir.$entry.'/setting.ini';
			$readmefile = $datadir.$entry.'/readme.txt';

			$readme = file_exists($readmefile) ? '<a target="_blank" href="source/'.$entry.'/readme.txt">�d��</a>' : '';

			if(file_exists($settingfile) && $setting = loadsetting($entry)) {
				$trclass = $trclass == 'bg1' ? 'bg2' : 'bg1';
				show_table_row(
					array(
						$setting['program']['source'],
						$setting['program']['target'],
						$setting['program']['introduction'],
						array('align="center"', $readme),
						array('align="center"', '<a href="index.php?a=setting&source='.rawurlencode($entry).'">�ק�</a>'),
						array('align="center"', '<a href="index.php?a=config&source='.rawurlencode($entry).'">�}�l</a>'),
					), $trclass
				);
			}
		}
	}
	$cdir->close();
	show_table_footer();
} else {
	showmessage('config_child_error');
}