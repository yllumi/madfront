<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Nyandiscuss extends Public_Controller {

	private $site_ref;
	private $module_ref;
	private $group_table;
	private $topic_table;
	private $thread_table;
	private $comment_table;
	private $comment_owner_table;

	public function __construct()
    {
        parent::__construct();
		
		 // check if user has login
        if(!isset($this->current_user->id))
        	redirect('users/login');

		$this->load->model('nyandiscuss/discussion_m');
		$this->load->library('discuss');
		$this->lang->load('nyandiscuss');
		$this->load->driver('Streams');

		// set class properties
		$this->site_ref = SITE_REF.'_';
		$this->group_table = $this->site_ref.'nyan_groups';
		$this->topic_table = $this->site_ref.'nyan_topics';
		$this->thread_table = $this->site_ref.'nyan_threads';
		$this->comment_table = $this->site_ref.'nyan_comments';
		$this->comment_owner_table = $this->site_ref.'nyan_comments_owner';

		$this->module_ref = $this->module_details['slug'];
		
		// Load css/js
		$this->template
			 ->append_css('module::chequest.css')
			 ->append_js('module::holder.js')
			 ->append_js('module::jquery.slugify.js')
			 ->append_js('module::jquery.cookie.js')
			 ->append_js('module::scripts.js')
			 ->append_js('module::comment.js')
			 ->set('module_ref', $this->module_ref)
			 ->set_partial('notices', 'notices.php');
	}

	public function index($topic_id = 0)
	{
		// ambil data grup
		$groups_params = array(
		    'stream'    => 'groups',
		    'namespace' => 'streams',
		    'limit'		=> 5
		);
	 	$data['groups'] = $this->streams->entries->get_entries($groups_params);

	 	// ambil data topik terluar
	 	$topics_params = array(
		    'stream'    => 'topics',
		    'namespace' => 'streams',
		    'limit'		=> 50,
		    'paginate'	=> 'no',
		    'where'		=> "{$this->topic_table}.grup Is Null and {$this->topic_table}.status = 'on'",
		);
		$data['topics'] = $this->streams->entries->get_entries($topics_params);

		// ambil data thread terluar
	 	$threads_params = array(
		    'stream'    => 'threads',
		    'namespace' => 'streams',
		    'limit'		=> 10,
		    'paginate'	=> 'yes',
		    'pag_segment'=> 4,
		    'where'		=> "{$this->thread_table}.grup Is Null and {$this->thread_table}.status = 'on'",
		);
		if($topic_id)
			$threads_params['where'] .= " and {$this->thread_table}.topik = {$topic_id}";
		else
			$threads_params['where'] .= " and {$this->thread_table}.topik Is Null";

		$data['threads'] = $this->streams->entries->get_entries($threads_params);

		// ambil data topik yang aktif
		if($topic_id){
			$topic = $this->streams->entries->get_entry($topic_id, 'topics', 'streams');

			// kalo topik yang diminta tidak ada di database, show_404
			if(!$topic) show_404();
		} else
			$topic = array();

		$this->template
				->set('topic_id', $topic_id)
				->set('current_topic', $topic)
				->set_partial('topics', 'topics.php')
				->set_partial('groups', 'groups.php')
				->set_partial('content', 'threads.php')
				->build('home', $data);
	}

	/* ------------------------------
	 *  GROUP FUNCTIONS
	 * ------------------------------
	 */
	function group_threads($group_id, $topic_id = 0){
		$group = $this->streams->entries->get_entry($group_id, 'groups', 'streams');

		//cek dulu apakah grup memang ada
		if(!$group) show_404();

		// ambil data topik yang aktif
		if($topic_id){	
			$topic = $this->streams->entries->get_entry($topic_id, 'topics', 'streams');

			// cek dulu apakah topik yang dimaksud ada di dalam grup
			if($topic->grup != $group->id)
				show_404();

			$this->template->set('current_topic', $topic);
		}

		$topics_params = array(
		    'stream'    => 'topics',
		    'namespace' => 'streams',
		    'limit'		=> 50,
		    'paginate'	=> 'no',
		    'where'		=> "{$this->topic_table}.grup = {$group_id} and {$this->topic_table}.status = 'on'",
		);
		$data['topics'] = $this->streams->entries->get_entries($topics_params);
		//dump($data['threads']);

		$threads_params = array(
		    'stream'    => 'threads',
		    'namespace' => 'streams',
		    'limit'		=> 10,
		    'paginate'	=> 'yes',
		    'pag_segment'=> 5,
		    'where'		=> "{$this->thread_table}.grup = {$group_id} and {$this->thread_table}.status = 'on'",
		);
		if($topic_id)
			$threads_params['where'] .= " and {$this->thread_table}.topik = {$topic_id}";
		else
			$threads_params['where'] .= " and {$this->thread_table}.topik Is Null";
		$data['threads'] = $this->streams->entries->get_entries($threads_params);


		$this->template
				->set('group', $group)
				->set('topic_id', $topic_id)
				->set_partial('topics', 'topics.php')
				->set_partial('content', 'threads.php')
				->build('group', $data);
	}

	function group_members($group_id){

	}

	function thread($id)
	{
		$this->template->build('thread');	
	}

	/* ------------------------
	 *  FORM CREATE AND EDIT
	 * ------------------------ 
	 */
	function create_group()
	{
		$this->template->build('create_group');
	}

	function create_topic($group_id = null)
	{
		$data['return_link'] = $this->module_ref;
		if($group_id)
			$data['return_link'] .= '/group/'.$group_id;

		$this->template->build('create_topic', $data);
	}

	function create_thread($group_id = null, $topic_id = null)
	{
		$data['return_link'] = $this->module_ref;

		if($group_id)
			$data['return_link'] .= '/group/'.$group_id;

		if($topic_id)
			$data['return_link'] .= '/'.$topic_id;

		$this->template->build('create_thread', $data);
	}

	function edit_group($id = null)
	{
		$group = $this->streams->entries->get_entry($id, 'groups', 'streams');
		
		// cek apakah grup dengan id  yang dimaksud ada
		if(!$group) show_404();

		// cek apakah si user login pemilik grup ini untuk dapat mengedit
		if($group->created_by != $this->current_user->id) show_404();

		// kalo tidak ada masalah, tampilkan halaman edit
		$this->template->build('edit_group');
	}

	function edit_topic($group_id = null, $topic_id = null)
	{
		$topic = $this->streams->entries->get_entry($topic_id, 'topics', 'streams');
		
		// cek apakah grup dengan id  yang dimaksud ada
		if(!$topic) show_404();

		// cek apakah si user login pemilik grup ini untuk dapat mengedit
		if($topic->created_by != $this->current_user->id) show_404();

		$data['return_link'] = $this->module_ref;
		if($group_id)
			$data['return_link'] .= '/group/'.$group_id;

		$data['return_link'] .= '/'.$topic_id;		

		$this->template->build('edit_topic', $data);
	}

	function edit_thread($id = null)
	{
		$thread = $this->streams->entries->get_entry($id, 'threads', 'streams');
		
		// cek apakah grup dengan id  yang dimaksud ada
		if(!$thread) show_404();

		// cek apakah si user login pemilik grup ini untuk dapat mengedit
		if($thread->created_by != $this->current_user->id) show_404();

		$this->template->build('edit_thread');
	}

	/* ------------------------
	 *  Comments
	 * ------------------------ 
	 */
    
    function comment_form($thread_id, $owner_slug = 0, $for_ajax = 0)
    {
    	$data['thread'] = $thread_id;
    	if($owner_slug){
    		$owner = $this->db->where('slug', $owner_slug)->get($this->comment_owner_table)->row();
	    	$data['owner_id'] = $owner->id;
    	}

    	$form = $this->load->view('create_comment', $data, true);

    	if(! $for_ajax)
	    	return $form;

	    echo $form;
    }

    function add_comment($for_ajax = 1)
    {
    	$data['thread'] = $this->input->post('thread', true);
    	$data['comment_owner'] = $this->input->post('owner', true);
    	$data['konten'] = trim($this->input->post('konten', true));

    	$insert = $this->streams->entries->insert_entry($data, 'comments', 'streams', array('status'));
    	if($insert){
    		if(!$data['comment_owner'])
	    		$this->discuss->increase_counter($data['thread'], $this->thread_table, 'total_komentar');

    		$data['created'] = now();
    		$data['id'] = $insert;
    		$data['created_by']['user_id'] = $this->current_user->id;
    		$data['created_by']['display_name'] = $this->current_user->display_name;
    		$result['comments']['total'] = 1;
    		$result['comments']['entries'][0] = $data;
    		$result['module_ref'] = $this->module_ref;
    		$current_comment = $this->parser->parse_string($this->load->view('comments', $result, true));

    		if($for_ajax)
		    	echo $current_comment;
	    	else
	    		redirect(getenv('HTTP_REFERER'));
    	}

    	return false;
    }

    function comment_list($thread_id, $owner_slug = 0)
    {
		// by stream
    	$where = "{$this->comment_table}.thread = {$thread_id} and {$this->comment_table}.status = 'on' ";
    	if ($owner_slug) {
    		$owner = $this->db->where('slug', $owner_slug)->get($this->comment_owner_table)->row();
    		$where .= "and {$this->comment_table}.comment_owner = {$owner->id}";
    	}
    	$comments_params = array(
		    'stream'    => 'comments',
		    'namespace' => 'streams',
		    'limit'		=> 5,
		    'paginate'	=> 'yes',
		    'pag_segment'=> 5,
		    'where'		=> $where,
		    'sort'		=> 'desc'
		);
		$data['comments'] = $this->streams->entries->get_entries($comments_params);
		//dump($data['threads']);

		echo $comments = $this->load->view('comments', $data, true);
    }

    function delete_comment($comment_id, $for_ajax = 0)
    {
    	// cek dulu apakah pengguna ini memang pemilik komentar
    	$comment = $this->streams->entries->get_entry($comment_id, 'comments', 'streams');
    	if($comment->created_by == $this->current_user->id){	
    		$deleted = $this->streams->entries->delete_entry($comment_id, 'comments', 'streams');
    		if($deleted){
    			$this->discuss->decrease_counter($comment->thread, $this->thread_table, 'total_komentar');
	    		if(!$for_ajax)
		    		redirect(getenv('HTTP_REFERER'));
    			echo $deleted;	
    		}
    	}
    }

}