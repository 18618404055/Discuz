<?php
    if(!defined('IN_DISCUZ') || !defined('IN_ADMINCP')) {
	   exit('Access Denied');
    }
    
    include 'source/plugin/v63ht/config.inc.php';
     if($_GET['pdo'] =='xgsz'){
        $config = "<?php \r\n 
        \$setting = array(
        'isopen'=>'".$_POST['isopen']."',
        'ispop'=>'".$_POST['ispop']."',
        'qz'=>'".$_POST['qz']."',
        'htid'=>'".$_POST['htid']."',
        'httitle'=>'".$_POST['httitle']."',
        'description'=>'".$_POST['description']."'
    );";
        $file_pointer = fopen("source/plugin/v63ht/config.inc.php","w+");        
        fwrite($file_pointer,$config);
        fclose($file_pointer);
        
     cpmsg('�޸ĳɹ�', 'action=plugins&operation=config&do='.$pluginid.'&identifier=v63ht&pmod=admin');
    }
    
    showformheader('plugins&operation=config&do='.$pluginid.'&identifier=v63ht&pmod=admin&pdo=xgsz');
    showtableheader();
    showtitle("ÿ�ջ�������(��ʹ�ù��������κ��������¼www.v63app.com���� @��ǿ)");
    
    showsetting('�Ƿ����õ���', 'ispop', $setting['ispop'], 'radio');
    
    showsetting('�Ƿ�ǿ�Ʋ���', 'qz', $setting['qz'], 'radio');
    
    showsetting('������ID', 'htid',$setting['htid'], 'text','',0,'���еĻ����������Ի�������ʽ�ظ�������');
    showsetting('��������', 'httitle',$setting['httitle'], 'text','',0,'');
    showsetting('�������','description',$setting['description'],'textarea','',0,'֧��html');
    showsubmit('submit');
    showtablefooter();
    showformfooter();
?>