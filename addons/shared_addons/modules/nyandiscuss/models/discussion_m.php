<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Discussion_m extends MY_Model
{

	protected $_group_table = 'chequest_discussion_group';
	protected $_topic_table = 'chequest_discussion_topic';
	protected $_post_table = 'chequest_discussion_post';
	protected $_moderator_table = 'chequest_discussion_moderator';

	function __construct(){
		parent::__construct();
	}
	
	/*	@param $limit 	number of limit
		@param $mode 	group mode (open,close,secret), false for showing all mode
	*/
	public function get_groups($limit = null, $mode = false){
		$this->db->from($this->_group_table)
				 ->where('status', 1);
		if($mode) $this->db->where('group_mode', $mode);
		if($limit) $this->db->limit($limit);

		return $this->db->order_by('updated','desc')
						->get()->result();
	}

	/*	@param $limit 	number of limit
		@param $parent 	parent ID, -1 for root parent
	*/
	public function get_topics($limit = null, $parent = false){
		$this->db->from($this->_topic_table .' t')
				->join($this->_group_table .' g', 'g.id = t.group_id')
				->where('t.status', 1);
		if($parent) $this->db->where('parent_id', $parent);
		if($limit) $this->db->limit($limit);

		return $this->db->order_by('t.updated','desc')
						->get()->result();
	}

	public function get_threads($limit = 10){
		return $this->db->from($this->_post_table)
						->where('status', 1)
						->limit($limit)
						->get()->result();
	}

	public function get_featured_threads($limit = 10){
		return $this->db->select('p.*, t.topic_title, t.topic_slug')
						->from($this->_post_table.' p')
						->join($this->_topic_table .' t', 't.id = p.topic_id')
						->where('p.status', 1)
						->where('p.featured', 1)
						->limit($limit)
						->order_by('p.updated','desc')
						->get()->result();
	}

	function create_group($data){
		$this->db->insert($this->_group_table, $data);
		return $this->db->insert_id();
	}
	function create_topic($data){
		$this->db->insert($this->_topic_table, $data);
		return $this->db->insert_id();
	}
	function create_thread($data){
		$this->db->insert($this->_thread_table, $data);
		return $this->db->insert_id();
	}

	function check_group_exists($value, $id){
		$this->db->where('group_slug', url_title(strtolower(trim($value))));
		if($id)
			$this->db->where('id', $id);
		return $this->db->get($this->_group_table)->row();
	}
	function check_topic_exists($value, $id){
		$this->db->where('topic_slug', url_title(strtolower(trim($value))));
		if($id)
			$this->db->where('id', $id);
		return $this->db->get($this->_topic_table)->row();
	}
	
	public function add($data){		
		return $this->insert($data);
	}
	
	public function delete_by($where){		
		$this->db->where($where)->delete($_table);
		return $this->db->affected_rows();
	}

}
