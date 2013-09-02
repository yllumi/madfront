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
class Multisite_manager_m extends CI_Model {

	protected $_table;

	public function __construct()
	{
		parent::__construct();
	}

	public function get_sites()
	{
		$query = "SELECT * FROM `core_sites` ORDER BY `created_on` DESC";
		return $this->db->query($query)->result();
	}

	public function get($id = 0)
	{
		$query = "SELECT * FROM `core_sites` WHERE `id` = ".$this->db->escape($id);
		return $this->db->query($query)->row();
	}

	//create a new item
	public function create($input)
	{
		$sql = "INSERT INTO `core_sites` (`name`,`ref`,`domain`,`active`, `created_on`) 
				VALUES(".$this->db->escape($input['name']).",
					".$this->db->escape($input['ref']).",
					".$this->db->escape($input['domain']).",
					".$this->db->escape($input['active']).",
					".$this->db->escape(now()).")";

		return $this->db->query($sql);
	}

	//edit a new item
	public function edit($id = 0, $input)
	{
		$sql = "UPDATE `core_sites` 
				SET `name` = ".$this->db->escape($input['name']).",
				`domain` = ".$this->db->escape($input['domain']).",
				`active` = ".$this->db->escape($input['active']).",
				`updated_on` = ".$this->db->escape(now())."
				WHERE `id` = ".$this->db->escape($id);

		return $this->db->query($sql);
	}
}
