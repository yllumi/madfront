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
class Multisite_manager_m extends MY_Model {

	private $folder;

	public function __construct()
	{
		parent::__construct();
		$this->db->set_dbprefix('core_');
		$this->_table = 'sites';
		// $this->load->model('files/file_folders_m');
		// $this->load->library('files/files');
		// $this->folder = $this->file_folders_m->get_by('name', 'madfront_multisite_manager');
	}

	//create a new item
	public function create($input)
	{
		// $fileinput = Files::upload($this->folder->id, FALSE, 'fileinput');
		$to_insert = array(
			// 'fileinput' => json_encode($fileinput);
			'name' => $input['site_name'],
			'ref' => 'default',
			'domain' => $input['domain'],
			'active' => $input['active'],
			'created_on' => time()
		);

		return $this->db->insert($this->_table, $to_insert);
	}

	//edit a new item
	public function edit($id = 0, $input)
	{
		// $fileinput = Files::upload($this->folder->id, FALSE, 'fileinput');
		$to_insert = array(
			'name' => $input['site_name'],
			'ref' => 'default',
			'domain' => $input['domain'],
			'active' => $input['active'],
			'updated_on' => time()
		);

		// if ($fileinput['status']) {
		// 	$to_insert['fileinput'] = json_encode($fileinput);
		// }

		return $this->db->where('id', $id)->update($this->_table, $to_insert);
	}
}
