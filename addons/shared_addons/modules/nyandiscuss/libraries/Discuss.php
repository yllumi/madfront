<?php

/**
 * Global Chequest Library
 * 
 * Record all user stored activities
 *
 * @version    v1.0
 * @author     Toni Haryanto
 * @license    MIT License
 * @copyright  2011 Toni Haryanto
 * @package    modules\chequest\libraries\Acivity
 */

class Discuss {

	/**
	 * Loads in the config and sets the variables
	 */
	public function __construct()
	{
		$this->ci = get_instance();
	}

	/**
     * Gets a Files folder object based on the Product/Name slug.
     *
     * @param string $slug The Slug to query
     * @return object or boolean FALSE on failure
     * @access public
     */
	public function get_file_folder_by_slug($slug)
	{
		$result = $this->ci->db->where('slug', $slug)->get('file_folders');

		if( $result->num_rows() )
		{
			return array('data' => $result->row_array());
		}

		return FALSE;
	}

	public function check_stream_field($field_slug, $namespace){
        $data = $this->ci->db->from('data_fields')
                ->where('field_slug', $field_slug)
                ->where('field_namespace', $namespace)
                ->get();

        if($data->num_rows() > 0)
            return $data->row();

        return false;
    }

    function increase_counter($content_id, $table, $field_to_increase)
    {
    	$this->ci->db->set($field_to_increase, $field_to_increase.'+1', false);
    	$this->ci->db->where('id', $content_id);
    	$this->ci->db->update($table);
    	return $this->ci->db->affected_rows();
    }
    function decrease_counter($content_id, $table, $field_to_decrease)
    {
    	$this->ci->db->set($field_to_decrease, $field_to_decrease.'-1', false);
    	$this->ci->db->where('id', $content_id);
    	$this->ci->db->update($table);
    	return $this->ci->db->affected_rows();	
    }

}

/* End of file Activity.php */