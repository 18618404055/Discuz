<?php
	if(!defined('IN_DISCUZ')) {
		exit('Access Denied');
	}
	include "config.php";

	if ( $AttachDownBysizeConfig['att_kg'] )
	{
		$att_downloads = $AttachDownBysizeConfig['att_downTime'];
		$dz_downloads  = $att_downloads>0 ? DB::result_first("SELECT downloads FROM ".DB::table('forum_attachment')." where aid='$attach[aid]'") : -1;
		
		if($dz_downloads <= $att_downloads){
			$extcreditkb  =  $AttachDownBysizeConfig['att_kb']; 				//�����ֶ�
			$authorfactor =  $AttachDownBysizeConfig['att_upnext'] * 0.01;  	//���߷ֳ�(��ʼֵ)
			$payfactor	  =  $AttachDownBysizeConfig[$_G['groupid']] * 0.01;	//֧������(��ʼֵ)
			$paymax		  =  $AttachDownBysizeConfig['att_paymax']; 
			$attsize      =  intval($attach['filesize'] / 1024); 	//������С,ʹ��K��λ��ʾ
			$paysize      =  $paymax>0 ? min($paymax, $attsize) : $attsize;
			$userhave     =  getuserprofile($extcreditkb);		//�û�ӵ������
			$paysize 	  =  intval($paysize * $payfactor);		//֧������
			$authorsize   =  intval($paysize * $authorfactor);	//��������
			 
			if ($userhave < $paysize)
			{
				showmessage("��û���㹻������֧������!��һ�������������<p><a href=home.php?mod=spacecp&ac=credit&op=exchange>��ʼ�һ�!</a></p>");
			}
			else
			{
				DB::query("UPDATE ".DB::table('common_member_count')." SET $extcreditkb=$extcreditkb-'$paysize' WHERE uid='$_G[uid]'", 'UNBUFFERED');//�û�֧��
				DB::query("UPDATE ".DB::table('common_member_count')." SET $extcreditkb=$extcreditkb+'$authorsize' WHERE uid='$attach[uid]'", 'UNBUFFERED');//��������������
			}
		}
	}
?>