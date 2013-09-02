<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Redirect model
 *
 * @author 		PyroCMS Dev Team
 * @package 	PyroCMS\Core\Modules\Redirects\Models 
 */
class Redirect_m extends MY_Model
{

	public function get($id)
	{
		return $this->db->where($this->primary_key, $id)
			->where('site_id', SITE_ID)
			->get($this->_table)
			->row_array();
	}

	public function get_all()
	{
		$this->db->where('site_id', SITE_ID);
		return $this->db->get('redirects')->result();
	}

	public function get_from($from)
	{
		return $this->db
			->where('site_id', SITE_ID)
			->like('from', $from, 'none')
			->get($this->_table)
			->row();
	}

	public function count_all()
	{
		return $this->db->where('site_id', SITE_ID)->count_all_results('redirects');
	}

	public function insert($input = array(), $skip_validation = false)
	{
		return $this->db->insert('redirects', array(
			'`type`' => $input['type'],
			'`from`' => str_replace('*', '%', $input['from']),
			'`to`' => trim($input['to'], '/'),
			'`site_id`' => SITE_ID
		));
	}

	public function update($id, $input = array(), $skip_validation = false)
	{
		$this->db->where(array(
			'id' => $id,
			'site_id' => SITE_ID
		));

		return $this->db->update('redirects', array(
			'`type`' => $input['type'],
			'`from`' => str_replace('*', '%', $input['from']),
			'`to`' => trim($input['to'], '/')
		));
	}

	public function delete($id)
	{
		$this->db->delete('redirects', array(
			'id' => $id,
			'site_id' => SITE_ID
		));
		return $this->db->affected_rows();
	}

	// Callbacks
	public function check_from($from, $id = 0)
	{
		if($id > 0)
		{
			$this->db->where('id !=', $id);
		}

		return $this->db->where(array(
			'`from`' =>  str_replace('*', '%', $from),
			'`site_id`' => SITE_ID
		))->count_all_results('redirects');
	}
}