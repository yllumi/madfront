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
class madfront_multisite_manager_m extends MY_Model {

	private $folder;

	public function __construct()
	{
		parent::__construct();
		$this->_table = 'madfront_multisite_manager';
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
			'site_name' => $input['site_name'],
'domain' => $input['domain'],
'active' => $input['active'],

		);

		return $this->db->insert('madfront_multisite_manager', $to_insert);
	}

	//edit a new item
	public function edit($id = 0, $input)
	{
		// $fileinput = Files::upload($this->folder->id, FALSE, 'fileinput');
		$to_insert = array(
			'site_name' => $input['site_name'],
'domain' => $input['domain'],
'active' => $input['active'],

		);

		// if ($fileinput['status']) {
		// 	$to_insert['fileinput'] = json_encode($fileinput);
		// }

		return $this->db->where('id', $id)->update('madfront_multisite_manager', $to_insert);
	}
}
