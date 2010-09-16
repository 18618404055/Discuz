<?php

/**
 *      [Discuz! XPlus] (C)2001-2010 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: config_global_default.php 548 2010-09-01 09:59:56Z yexinhao $
 */

$_config = array();

// ���ݿ����������
$_config['db']['map'] = array();
$_config['db'][1]['dbhost']  		= 'localhost';		// ��������ַ
$_config['db'][1]['dbuser']  		= 'root';		// �û�
$_config['db'][1]['dbpw'] 	 	= 'root';		// ����
$_config['db'][1]['dbcharset'] 		= 'utf8';		// �ַ���
$_config['db'][1]['pconnect'] 		= 0;			// �Ƿ��������
$_config['db'][1]['dbname']  		= 'ultrax';		// ���ݿ�
$_config['db'][1]['tablepre'] 		= 'xplus_';		// ����ǰ׺

// �ڴ�������Ż����ã�����������ҪPHP��չ���֧�֣����� memcache �������������ã��� memcache �޷�����ʱ�����Զ���������������Ż�ģʽ��
//  -----------------  CONFIG MEMORY  ----------------- //
$_config['memory']['prefix'] = 'xplus_';
$_config['memory']['eaccelerator'] = 1;				// ������ eaccelerator ��֧��
$_config['memory']['xcache'] = 0;				// ������ xcache ��֧��
$_config['memory']['memcache']['server'] = '';			// memcache ��������ַ
$_config['memory']['memcache']['port'] = 11211;			// memcache �������˿�
$_config['memory']['memcache']['pconnect'] = 1;			// memcache �Ƿ񳤾�����
$_config['memory']['memcache']['timeout'] = 1;			// memcache ���������ӳ�ʱ

//  -----------------  CONFIG CACHE  ----------------- //
$_config['cache']['main']['type'] = '';

//  -----------------  CONFIG default CACHE  ----------------- //
$_config['cache']['main']['file']['path'] = 'data/xpluscache';
$_config['cache']['type'] 			= 'sql';	// �������� file=�ļ�����, sql=���ݿ⻺��

// ҳ���������
$_config['output']['charset'] 			= 'utf-8';	// ҳ���ַ���
$_config['output']['forceheader']		= 1;		// ǿ�����ҳ���ַ��������ڱ���ĳЩ��������
$_config['output']['gzip'] 			= 0;		// �Ƿ���� Gzip ѹ�����
$_config['output']['tplrefresh'] 		= 1;		// ģ���Զ�ˢ�¿��� 0=�ر�, 1=��
$_config['output']['language'] 			= 'zh_cn';	// ҳ������ zh_cn/zh_tw
$_config['output']['staticurl'] 		= 'static/';	// վ�㾲̬�ļ�·������/����β

// COOKIE ����
$_config['cookie']['cookiepre'] 		= 'uchome_'; 	// COOKIEǰ׺
$_config['cookie']['cookiedomain'] 		= ''; 		// COOKIE������
$_config['cookie']['cookiepath'] 		= '/'; 		// COOKIE����·��

// Ĭ�ϳ����Լ�����������
$_config['app']['default']			= '';
$_config['app']['domain']['default']		= '';		// ��ȥ���������֮��ĵ�ַ�󶨵�����

// վ�㰲ȫ����
$_config['security']['authkey']			= 'c46b90xHlZAj7FuH';	// վ�������Կ
$_config['security']['urlxssdefend']		= true;		// ���� URL XSS ����
$_config['security']['attackevasive']		= 0;		// CC �������� 1|2|4

$_config['admincp']['founder']			= '1';		// վ�㴴ʼ�ˣ�ӵ��վ������̨�����Ȩ�ޣ�ÿ��վ��������� 1���������ʼ��
								// ����ʹ��uid��Ҳ����ʹ���û����������ʼ��֮����ʹ�ö���",���ֿ�;
$_config['admincp']['forcesecques']		= 0;		// ������Ա�������ð�ȫ���ʲ��ܽ���ϵͳ���� 0=��, 1=��[��ȫ]
$_config['admincp']['checkip']			= 1;		// ��̨��������Ƿ���֤����Ա�� IP, 1=��[��ȫ], 0=�񡣽��ڹ���Ա�޷���½��̨ʱ���� 0��
$_config['admincp']['runquery']			= 1;		// �Ƿ������̨���� SQL ��� 1=�� 0=��[��ȫ]
$_config['admincp']['dbimport']			= 1;		// �Ƿ������̨�ָ���̳����  1=�� 0=��[��ȫ]

?>