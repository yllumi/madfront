<?php defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Multisite Manager for Madfront
 *
 * @author 		Toni Haryanto
 * @website		http://toniharyanto.com
 * @package 	PyroCMS
 * @subpackage 	Madfront
 * @copyright 	MIT
 */
class Plugin_madfront_multisite_manager extends Plugin
{
	/**
	 * Item List
	 * Usage:
	 *
	 * {{ madfront_multisite_manager:items limit="5" order="asc" }}
	 *      {{ id }} {{ name }} {{ slug }}
	 * {{ /madfront_multisite_manager:items }}
	 *
	 * @return	array
	 */
	function items()
	{
		$this->load->model('madfront_multisite_manager/madfront_multisite_manager_m');
		return $this->madfront_multisite_manager_m->get_all();
	}
}

/* End of file plugin.php */