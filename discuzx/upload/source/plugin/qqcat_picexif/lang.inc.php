<?php
$langtemp = <<<EOF
<div class="t_smallfont cl" style="font-size: 12px">
<font color=red> ����ͺţ�</font>{����ͺ�}<br>
<font color=red> �ع�ʱ�䣺</font>{�ع�ʱ��}
<font color=red> �� Ȧ��</font>{��Ȧ}
<font color=red> �عⲹ����</font>{�عⲹ��}EV
<font color=red> �ع�ģʽ��</font>{�ع�ģʽ}<br>
<font color=red> �� ƽ �⣺</font>{��ƽ��}
<font color=red> ISO�й�ȣ�</font>{ISO}
<font color=red> ���ࣺ</font>{����}mm<br>
<font color=red> ����ʱ�䣺</font>{����ʱ��}
<font color=red> �� �� �ʣ�</font>{�ֱ���}
</div>
EOF;
$lang[temp][2] = $langtemp;

$langtemp = <<<EOF
<div class="t_smallfont cl" style="font-size: 12px;margin:0; padding:0 0 5px 20px;background:transparent url(static/image/common/info_small.gif) no-repeat;">
<font color=red>����ͺţ�</font>{����ͺ�}
<a onclick="toggle_collapse('exif_info_{aid}');" alt="����/չ��" title="����/չ��" ><B>�鿴����Exif��Ϣ&raquo;</B></a>
<div id='exif_info_{aid}' style="display:none;">
<font color=red> �ع�ʱ�䣺</font>{�ع�ʱ��}
<font color=red> �� Ȧ��</font>{��Ȧ}
<font color=red> �عⲹ����</font>{�عⲹ��}EV
<font color=red> �ع�ģʽ��</font>{�ع�ģʽ}<br>
<font color=red> �� ƽ �⣺</font>{��ƽ��}
<font color=red> ISO�й�ȣ�</font>{ISO}
<font color=red> ���ࣺ</font>{����}mm<br>
<font color=red> ����ʱ�䣺</font>{����ʱ��}
<font color=red> �� �� �ʣ�</font>{�ֱ���}
</div>
</div>
EOF;
$lang[temp][3] = $langtemp;

$langtemp = <<<EOF
<div id="exif_{aid}" class="t_smallfont cl" onmouseover="showMenu({'ctrlid':this.id,'pos':'12'})" style="font-size: 12px;margin:0; padding:0 0 5px 20px;background:transparent url(static/image/common/info_small.gif) no-repeat;">
<B>����ͺţ�</B>{����ͺ�}
<a title="��ʾ����EXIF��Ϣ" style="cursor:pointer"><B>&raquo;����</B></a>
</div>
<div id="exif_{aid}_menu" class="p_pop cl" style="position: absolute;display:none;width:auto;white-space:nowrap;color:#000;font-size: 12px;">
<B> �ع�ʱ�䣺</B>{�ع�ʱ��}
<B> �� Ȧ��</B>{��Ȧ}
<B> �عⲹ����</B>{�عⲹ��}EV
<B> �ع�ģʽ��</B>{�ع�ģʽ}<br>
<B> �� ƽ �⣺</B>{��ƽ��}
<B> ISO�й�ȣ�</B>{ISO}
<B> ���ࣺ</B>{����}mm<br>
<B> ����ʱ�䣺</B>{����ʱ��}
<B> �� �� �ʣ�</B>{�ֱ���}
</div>
EOF;
$lang[temp][4] = $langtemp;

$langtemp = <<<EOF
<div class="t_smallfont cl">
<div id="exif_{aid}" onmouseover="showMenu({'ctrlid':this.id,'pos':'12'})" style="font-size: 12px;float:left;margin:0; padding:0 0 5px 20px;background:transparent url(static/image/common/info_small.gif) no-repeat;">
<B>����ͺţ�</B>{����ͺ�}
<a onclick="toggle_collapse('exif_info_{aid}');" title="��ʾ����EXIF��Ϣ" style="cursor:pointer"><B>&raquo;����</B></a>
</div></div>
<div id="exif_{aid}_menu" class="p_pop cl" style="position: absolute;display:none;width:auto;white-space:nowrap;color:#000;font-size: 12px;">
<B> �ع�ʱ�䣺</B>{�ع�ʱ��}
<B> �� Ȧ��</B>{��Ȧ}
<B> �عⲹ����</B>{�عⲹ��}EV
<B> �ع�ģʽ��</B>{�ع�ģʽ}<br>
<B> �� ƽ �⣺</B>{��ƽ��}
<B> ISO�й�ȣ�</B>{ISO}
<B> ���ࣺ</B>{����}mm<br>
<B> ����ʱ�䣺</B>{����ʱ��}
<B> �� �� �ʣ�</B>{�ֱ���}
</div>
EOF;
$lang[temp][5] = $langtemp;
?>