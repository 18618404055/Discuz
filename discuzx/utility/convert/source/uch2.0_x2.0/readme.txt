====================================
UCenter Home 2.0 �ɯŦ� Discuz! X2.0 ����
====================================

�S�Oĵ��!!!
�ѩ�UCHome�PDiscuz!�����\��i��F��X�ʿĦX�A�]��UCHome�������\��A�b��X��Discuz! X��N�|�����ᥢ�A
�䤤�]�A�G
�ѩ�s�W�M�D�\��A��UCH���x�\��N���A����F
UCH�벼�BUCH���ʱN�P�׾§벼�K�B���ʶK���Φ��ĦX���@��A���ʬۥU�B���ʸs�ե\��N���A����F
UCH�s�ձN�H�s���s�ե\��s�b�A��s�լۥU�B�s�լ��ʥ\��N���A����F
�ӤH��ƶi��F�s���վ�AUCH��ӤH��Ƥ����ǮաB�u�@�H���N�ݭn���s��g�F
UCH��������W�\�ण�A����F

�Юھڦۤv�د��ݨD�A�v�ŨM�w�O�_�NUCHome�ഫ�ɯŨ�Discuz! X�C

I �ɯūe���ǳ�
---------------
1. �إߵ{�ǳƥ��ؿ��A�Ҧp old
2. �N��UCHome�Ҧ��{�ǲ��ʨ� old �ؿ���
3. �W�� Discuz! X ���~��upload�ؿ������{�Ǩ�UCHome�ؿ�
4. ����w�˵{�� /install
   �w�˪��ɭԽЫ��w��UCHome������UCenter Server�a�}�]�p�G UCenter�����C��1.6.0�A�ݥ��ɯ� UCenter �^

II �ɯ�UCHome�ƾ�
---------------
1. �w�˧����A����Discuz! X�i�H���`�B��H��A�W��convert �{�Ǩ�Discuz! X�ڥؿ�
2. ���� /convert
3. ��ܬ������{�Ǫ����A�}�l�ഫ
4. �ഫ�L�{�����i�զۤ��_�A����{�Ǧ۰ʰ��槹���C
5. �ഫ�L�{�i��ݭn�����ɶ��A�B���Ӹ��h�A�Ⱦ��귽�A�z�����ܪA�Ⱦ��Ŷ����ɭ԰���

III �ɯŧ���, �٭n�����X���
--------------------------
1. �s��sDiscuz! X�� config/config_global.php ���A�]�w�n�Щl�H
2. �����X�ݷsDiscuz! X�� admin.php
3. �ϥγЩl�H�b���n���A�i�J��x��s�w�s
4. �s�t�μW�[�F�ܦh�]�m���ءA�]�A�Τ��v���B���v���B�׾ªO�������A�z�ݭn�J�Ӫ����s�]�m�@���C
5. �ಾ�ª���ؿ���s���~�ڥؿ��]�b�ಾ���e�A�z���ʺA�B��x�B���סB�d�������e�����Ϥ��L�k���`��ܡ^
   a)�i�J old/attachment �ؿ�
   b)�N�Ҧ���󲾰ʨ� �sDiscuz! X���~ /data/attachment/album/ �ؿ���
   c)�P�ɡA�ק�@�U Discuz! X���N�X
	 ����x���e�����w�g���J���Ϥ��a�}�A�q�L�r�Ŧ�����A�אּ�̷s���Ϥ��a�}�A�ѨM��x���e�Ϥ��L�k��ܪ����D�C
	 ��k�p�U�G
	 ���}Discuz! X�� ./source/include/space/space_blog.php �{��
	 ���G
	 $blog['message'] = blog_bbcode($blog['message']);
	 �b�U���W�[�p�U�N�X�G
	 $home_url = 'http://your_home_site_url/'; // �бN���챵�a�}�אּ�z�� UCHome ���I�a�}�I�I�I
	 $bbs_url = 'http://your_bbs_site_url/'; // �бN���챵�a�}�אּ�z�� BBS ���I�a�}�I�I�I
	 $findarr = array(
		'<img src="attachment/',  //��uchmoe����Ϥ��ؿ�
		'<IMG src="'.$home_url.'attachment/',  // ��UCHome����Ϥ��ؿ�
		$bbs_url.'attachments/month',  // ��׾ª���Ϥ��ؿ�
	 );
	 $replacearr = array(
		'<img src="'.$_G['setting']['attachurl'].'album/',
		'<IMG src="'.$_G['setting']['attachurl'].'album/',
		$bbs_url.$_G['setting']['attachurl'].'forum/month',
	 );
	 $blog['message'] = str_replace($findarr, $replacearr, $blog['message']);

	 �p�G�A��UCHome�����󤣬O�s��b�q�{�� ./attachment �ؿ��A����
	 �ץ��W���N�X�� <img src="attachment/ ���� attachment ���A�ۤv������ؿ��W�r
6. �ಾ�¹Ϥ��ؿ���s���~�ڥؿ��]�b�ಾ���e�A�z���ʺA�B��x�B���סB�d�������e�������L�k���`��ܡ^
   a)�N old/image �ؿ��M�ؿ��U����� ���ʨ� �sDiscuz! X���~���ڥؿ���
7. ��_ space.php URL�a�}���X�ݡ]�b��_���e�A�z���ʺA���������H���챵�N���V�L�k�X�ݪ��a�}�^
   1)�N utility/oldprg/uchome/space.php ��󲾰ʨ� �sDiscuz! X���~���ڥؿ���
8. �R�� convert �{�ǡA�H�K���z��Discuz! X�w�˱a�����w
9. �ݴ��շsDiscuz! X���~���Ҧ��\�ৡ���`��A�i�H�R�� �ª��{�ǳƥ��M�ƾڳƥ�