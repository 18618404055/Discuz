====================================
SupeSite 7.5 �ɯŦ� Discuz! X2.0 ����
====================================

�S�Oĵ��!!!
Discuz! X2.0���å����SupeSite 7.5���������\��A
���ഫ�{�ǡA���ഫSupeSite 7.5������T�����B��T�峹�ƾڨ� Discuz! X2.0���~���峹�t�Τ��C
��L�ƾڱN���i���ഫ�C
�]���A�ƾ��ഫ��ADiscuz! X2.0���~�s�b�즳SupeSite�\��ᥢ�M�ƾڥᥢ���D�A�Цۦ��v�ŨM�w�O�_�ഫ�ɯšC


I �ɯūe���ǳ�
---------------
1. �إߵ{�ǳƥ��ؿ��A�Ҧp old
2. �N��SupeSite�Ҧ��{�ǲ��ʨ� old �ؿ���
3. �W�� Discuz! X2.0 ���~��upload�ؿ������{�Ǩ�SupeSite�ؿ�
4. ����w�˵{�� /install
   �w�˪��ɭԽЫ��w��SupeSite������UCenter Server�a�}�]�p�G UCenter�����C��1.6.0�A�ݥ��ɯ� UCenter �^

II �ɯ�SupeSite�ƾ�
---------------
1. �w�˧����A����Discuz! X2.0�i�H���`�B��H��A�W��convert �{�Ǩ�Discuz! X2.0�ڥؿ�
2. ���� /convert
3. ��ܬ������{�Ǫ����A�}�l�ഫ
4. �ഫ�L�{�����i�զۤ��_�A����{�Ǧ۰ʰ��槹���C
5. �ഫ�L�{�i��ݭn�����ɶ��A�B���Ӹ��h�A�Ⱦ��귽�A�z�����ܪA�Ⱦ��Ŷ����ɭ԰���

III �ɯŧ���, �٭n�����X���
--------------------------
1. �s��sDiscuz! X2.0�� config/config_global.php ���A�]�w�n�Щl�H
2. �����X�ݷsDiscuz! X2.0�� admin.php
3. �ϥγЩl�H�b���n���A�i�J��x��s�w�s
4. �s�t�μW�[�F�ܦh�]�m���ءA�]�A�Τ��v���B���v���B�׾ªO�������A�z�ݭn�J�Ӫ����s�]�m�@���C
5. �ಾ�ª���ؿ���s���~�ڥؿ��]�b�ಾ���e�A�z����T���e�����Ϥ��L�k���`��ܡ^
   a)�N old/attachments �ؿ��M�ؿ��U����� �������ʨ� �sDiscuz! X2.0���~��/data/attachment/portal/�ؿ���
   b) �b�� SS7 ���X�U���ϼ� images/base/attachment.gif�A��b Disucuz�I X2.0 ���ؿ� static/image/filetype/ �U�F
   c) ��� source/module/portal/portal_view.php ���A�b�N�X�u$content['content'] = blog_bbcode($content['content']);�v�ᴫ��K�[�H�U�N�X�G

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

6. �ಾ�¹Ϥ��ؿ���s���~�ڥؿ��]�b�ಾ���e�A�z����T���e�������L�k���`��ܡ^
   a)�N old/images �ؿ��M�ؿ��U����� ���ʨ� �sDiscuz! X2.0���~���ڥؿ���
7. �R�� convert �{�ǡA�H�K���z��Discuz! X2.0�w�˱a�����w�C