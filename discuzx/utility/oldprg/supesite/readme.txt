===============================
SS7 �ഫ�� Discuz�I X1 �`�N�ƶ�
===============================

���D�G�ഫ�᪺�Ϥ��Ϊ���a�}����H
��סG �B�J�p�U�G
1. �b�� SS7 ���X�U���ϼ� images/base/attachment.gif�A��b Disucuz�I X1 ���ؿ� static/image/filetype/ �U�F
2. ��� source/module/portal/portal_view.php ���A�b�N�X�u$content['content'] = blog_bbcode($content['content']);�v�ᴫ��K�[�H�U�N�X�G

$ss_url = 'http://your_ss_site_url/'; // �бN���챵�a�}�אּ�z�� SS ���I�a�}�I�I�I
$findarr = array(
	$ss_url.'batch.download.php?aid=', // ����U���a�}
	$ss_url.'attachments/',  // ����Ϥ��ؿ�
	$ss_url.'images/base/attachment.gif'  // ����U���ϼ�
);
$replacearr = array(
	'porta.php?mod=attachment&id=',
	$_G['setting']['attachurl'].'/portal/',
	STATICURL.'image/filetype/attachment.gif'
);
$content['content'] = str_replace($findarr, $replacearr, $content['content']);


