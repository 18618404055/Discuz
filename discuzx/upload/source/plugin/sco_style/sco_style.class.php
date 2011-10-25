<?php

/**
 * @author bluelovers
 * @copyright 2011
 */

include_once libfile('class/sco_dx_plugin', 'source', 'extensions/');

class plugin_sco_style extends _sco_dx_plugin {

	public function __construct() {
		$this->_init($this->_get_identifier(__CLASS__));

		$this->_this(&$this);
	}

}

class plugin_sco_style_home extends plugin_sco_style {

	function space_() {
		if (!$this->_my_check_in_space_style()) {
			return;
		}

		$this->_my_hook_return_add('global_header_javascript_before_body', $this->_my_global_header_javascript_before_body());
	}

	function _my_global_header_javascript_before_body() {
		return '<style id="diy_style_plugin">body { color: red; }</style>';
	}

	function _my_hook_return_add($hookkey, $return) {
		global $_G;

		if(is_array($return)) {
			if(!isset($_G['setting']['pluginhooks'][$hookkey]) || is_array($_G['setting']['pluginhooks'][$hookkey])) {
				foreach($return as $k => $v) {
					$_G['setting']['pluginhooks'][$hookkey][$k] .= $v;
				}
			}
		} else {
			if(!is_array($_G['setting']['pluginhooks'][$hookkey])) {
				$_G['setting']['pluginhooks'][$hookkey] .= $return;
			} else {
				foreach($_G['setting']['pluginhooks'][$hookkey] as $k => $v) {
					$_G['setting']['pluginhooks'][$hookkey][$k] .= $return;
				}
			}
		}

		return $this;
	}

	function _my_check_in_space_style() {
		global $_G;

		$ret = false;

		if (
			(
				CURMODULE == 'space'
				&& $_G['setting']['homestatus']
			)
		) {
			$ret = true;
		}

		return $ret;
	}

}

?>