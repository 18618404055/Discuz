<?php 
@require_once DISCUZ_ROOT.'source/plugin/qqcat_picexif/ver.php';
?>
<form id="form1" name="form1" method="post" action="<?=$p_url?>?a=bug&u=<?=$boardurl?>&pn=<?=$p_name?>&v=<?=$p_ver?>&dz=<?=$version?>">
  <table class="tb tb2 " id="tips3">
    <tr>
      <th  class="partition"><span style='float:right'><a href="http://www.rmbl.cn" target="_blank">���ײ��� www.rmbl.cn</a></span>˵��</th>
    </tr>
    <tr>
      <td class="tipsblock"><ul class="nofloat" ><li>�����Ὣ�¶Ա������Ҫ��Ľ����ύ������</li>
        <li>
        &nbsp;&nbsp;��̳��ַ��<?=$boardurl?> (�汾:<?=$version?>)<BR />
        &nbsp;&nbsp;������ƣ�
        <?=$p_name?> (�汾:<?=$p_ver?>)</li>
      </ul></td>
    </tr>
  </table>
  <table class="tb tb2 " id="tips">
<tr>
  <th  class="partition"><span style='float:right'><a href="http://www.rmbl.cn" target="_blank">���ײ��� www.rmbl.cn</a></span>��ϵ��ʽ��QQ/MSN/EMAIL/TEL</th>
</tr>
<tr><td class="tipsblock">
  <input name="tel" type="text" id="tel" size="80" maxlength="80" />
</td></tr></table>
<table class="tb tb2 " id="tips2">
  <tr>
    <th  class="partition"><span style='float:right'><a href="http://www.rmbl.cn" target="_blank">���ײ��� www.rmbl.cn</a></span>BUG�������� <a href="http://www.rmbl.cn/" target="_blank">������̳�����ר����</a></th>
  </tr>
  <tr>
    <td class="tipsblock"><textarea name="txt" cols="80" rows="10" id="txt"></textarea></td>
  </tr>
</table>
<input type="submit" class="btn" id="submit_bigqi_setting_submit" name="bigqi_setting_submit" title="�� Enter ������ʱ�ύ�����޸�" value="�ύ" />
</form>
