<?php
/*
 * Kilofox Services
 * SimStock v1.0
 * Plug-in for Discuz!
 * Last Updated: 2011-07-19
 * Author: Glacier
 * Copyright (C) 2005 - 2011 Kilofox Services Studio
 * www.Kilofox.Net
 */
class Tools
{
	public function kfsmReset()
	{
		global $baseScript;
		$kfsclass = new kfsclass;
		$kfsclass::kfsmReset();
		$baseScript .= '&mod=tools';
		cpmsg('�������������ɹ�', $baseScript, 'succeed');
	}
	public function udRank()
	{
		global $baseScript;
		$kfsclass = new kfsclass;
		$kfsclass::updateRank();
		$baseScript .= '&mod=tools';
		cpmsg('�����񵥸��³ɹ�', $baseScript, 'succeed');
	}
}
?>
