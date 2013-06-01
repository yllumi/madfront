<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Nyandiscuss extends Module {
	
	public $version = '0.1';
	
	public function __construct()
	{
		parent::__construct();
	}

	public function information()
	{

		$info = array(
			'name' => array(
				'en' => 'nyanDiscuss'
			),
			'description' => array(
				'en' => 'Nyankod Forum Discussion module'
			),
			'frontend'	=> TRUE,
			'backend'	=> TRUE,
			'author'   	=> 'Toni Haryanto',
			'roles' => array(
				'view_contents', 'edit_contents', 'block_contents', 'remove_contents',
				'block_users', 'block_groups', 'view_stats', 'edit_settings',
				'create_topic', 'create_group'
			),
			'sections' => array(
				'dashboard' => array(
					'name'	=> 'nyandiscuss:sections:dashboard',
					'uri'	=> 'admin/nyandiscuss'
				)
			)
		);
		
		return $info;
	}

	public function admin_menu(&$menu)
	{
		$menu['nyanStream'] = array();
		add_admin_menu_place('nyanStream', 2);
	   	$menu['nyanStream'] += array(
	    	'nyanDiscuss' => 'admin/nyandiscuss'
		);
	}
	
	public function install()
	{
		
		// Load required items
		$this->load->driver('Streams');
		$this->load->language('nyandiscuss/nyandiscuss');
		$this->load->library('nyandiscuss/discuss');
		$this->load->library('files/files');

		// create image folder files
		if(! $folder = $this->discuss->get_file_folder_by_slug('nyandiscuss'))
			$folder = $this->files->create_folder(0, 'Nyandiscuss');
		$image_id = $folder['id'];

		############
		## GROUPS ##
		############
		// create groups stream

		$stream_name = 'Grup';
		$module_slug = 'groups';
		$stream_desc = 'Grup Diskusi';

		$stream_namespace = 'streams';

		// Create Grooups stream
		if( !$this->streams->streams->add_stream($stream_name, $module_slug, $stream_namespace, 'nyan_', $stream_desc)) return FALSE;
		
		// Get stream data
		$group = $this->streams->streams->get_stream($module_slug, $stream_namespace);
	
		// Add fields
		$fields   = array();
		$template = array('namespace' => $stream_namespace, 'assign' => $module_slug, 'type' => 'text', 'title_column' => FALSE, 'required' => TRUE, 'unique' => FALSE);

		$fields[] = array('name' => 'Gambar Grup', 'slug' => 'gambar_grup', 'type' => 'image', 'required'=> FALSE, 'extra' => array('folder' => $image_id, 'resize_width' => 400, 'resize_height' => 400, 'allowed_types' => 'jpg|jpeg|png'));
		$fields[] = array('name' => 'Judul', 'slug' => 'judul', 'title_column' => TRUE);
		$fields[] = array('name' => 'Slug', 'slug' => 'slug', 'type' => 'slug', 'extra' => array('space_type' => '-', 'slug_field' => 'judul'));
		$fields[] = array('name' => 'Deskripsi', 'slug' => 'deskripsi', 'type' => 'textarea');
		$fields[] = array('name' => 'Status', 'slug' => 'status', 'type' => 'choice', 'required' => FALSE, 'extra' => array('choice_data' => "on : On\nof : Off", 'choice_type' => 'dropdown', 'default_value' => 'on'));
		$fields[] = array('name' => 'Total Topik', 'slug' => 'total_topik', 'type' => 'integer', 'required' => FALSE, 'extra' => array('max_length' => 11, 'default_value' => 0));
		$fields[] = array('name' => 'Total Thread', 'slug' => 'total_thread', 'type' => 'integer', 'required' => FALSE, 'extra' => array('max_length' => 11, 'default_value' => 0));
		$fields[] = array('name' => 'Mode Grup', 'slug' => 'mode_grup', 'type' => 'choice', 'extra' => array('choice_data' => "publik : Publik\nprivat : Privat", 'choice_type' => 'dropdown', 'default_value' => 'publik'));


		// Combine
		foreach( $fields AS $key => $field ) { $fields[$key] = array_merge($template, $field); }
	
		// Add fields to stream
		foreach($fields as $field){
			if($this->discuss->check_stream_field($field['slug'], $stream_namespace))
				$this->streams->fields->assign_field($stream_namespace, $module_slug, $field['slug'], array('required' => $field['required'], 'unique' => $field['unique']));
			else
				$this->streams->fields->add_field($field);
		}
		################## end groups
		
		############
		## TOPICS ##
		############
		// create topics stream

		$stream_name = 'Topik';
		$module_slug = 'topics';
		$stream_desc = 'Topik Diskusi';

		$stream_namespace = 'streams';

		// Create BOARD PROGRESS stream
		if( !$this->streams->streams->add_stream($stream_name, $module_slug, $stream_namespace, 'nyan_', $stream_desc)) return FALSE;
		
		// Get stream data
		$topic = $this->streams->streams->get_stream($module_slug, $stream_namespace);
	
		// Add fields
		$fields   = array();
		$template = array('namespace' => $stream_namespace, 'assign' => $module_slug, 'type' => 'text', 'title_column' => FALSE, 'required' => TRUE, 'unique' => FALSE);

		$fields[] = array('name' => 'Judul', 'slug' => 'judul', 'title_column' => TRUE);
		$fields[] = array('name' => 'Slug', 'slug' => 'slug', 'type' => 'slug', 'extra' => array('space_type' => '-', 'slug_field' => 'judul'));
		$fields[] = array('name' => 'Deskripsi', 'slug' => 'deskripsi', 'type' => 'textarea');
		$fields[] = array('name' => 'Grup', 'slug' => 'grup', 'type' => 'relationship', 'required' => FALSE, 'extra' => array('choose_stream' => $group->id));
		$fields[] = array('name' => 'Status', 'slug' => 'status', 'type' => 'choice', 'required' => FALSE, 'extra' => array('choice_data' => "on : On\nof : Off", 'choice_type' => 'dropdown', 'default_value' => 'on'));
		$fields[] = array('name' => 'Total Thread', 'slug' => 'total_thread', 'type' => 'integer', 'required' => FALSE, 'extra' => array('max_length' => 11, 'default_value' => 0));

		// Combine
		foreach( $fields AS $key => $field ) { $fields[$key] = array_merge($template, $field); }
	
		// Add fields to stream
		foreach($fields as $field){
			if($this->discuss->check_stream_field($field['slug'], $stream_namespace))
				$this->streams->fields->assign_field($stream_namespace, $module_slug, $field['slug'], array('required' => $field['required'], 'unique' => $field['unique']));
			else
				$this->streams->fields->add_field($field);
		}
		################## end topics

		#############
		## THREADS ##
		#############
		// create thread stream

		$stream_name = 'Thread';
		$module_slug = 'threads';
		$stream_desc = 'Thread Diskusi';

		$stream_namespace = 'streams';

		// Create threads stream
		if( !$this->streams->streams->add_stream($stream_name, $module_slug, $stream_namespace, 'nyan_', $stream_desc)) return FALSE;
		
		// Get stream data
		$thread = $this->streams->streams->get_stream($module_slug, $stream_namespace);
	
		// Add fields
		$fields   = array();
		$template = array('namespace' => $stream_namespace, 'assign' => $module_slug, 'type' => 'text', 'title_column' => FALSE, 'required' => TRUE, 'unique' => FALSE);

		$fields[] = array('name' => 'Judul', 'slug' => 'judul', 'title_column' => TRUE);
		$fields[] = array('name' => 'Slug', 'slug' => 'slug', 'type' => 'slug', 'extra' => array('space_type' => '-', 'slug_field' => 'judul'));
		$fields[] = array('name' => 'Grup', 'slug' => 'grup', 'type' => 'relationship', 'required' => FALSE, 'extra' => array('choose_stream' => $group->id));
		$fields[] = array('name' => 'Topik', 'slug' => 'topik', 'type' => 'relationship', 'required' => FALSE, 'extra' => array('choose_stream' => $topic->id));
		$fields[] = array('name' => 'Konten', 'slug' => 'konten', 'type' => 'formatted_wysiwyg', 'extra' => array('editor_type' => 'simple'));
		$fields[] = array('name' => 'Status', 'slug' => 'status', 'type' => 'choice', 'required' => FALSE, 'extra' => array('choice_data' => "on : On\nof : Off", 'choice_type' => 'dropdown', 'default_value' => 'on'));
		$fields[] = array('name' => 'Total Komentar', 'slug' => 'total_komentar', 'type' => 'integer', 'required' => FALSE, 'extra' => array('max_length' => 11, 'default_value' => 0));

		// Combine
		foreach( $fields AS $key => $field ) { $fields[$key] = array_merge($template, $field); }
	
		// Add fields to stream
		foreach($fields as $field){
			if($this->discuss->check_stream_field($field['slug'], $stream_namespace))
				$this->streams->fields->assign_field($stream_namespace, $module_slug, $field['slug'], array('required' => $field['required'], 'unique' => $field['unique']));
			else
				$this->streams->fields->add_field($field);
		}
		################## end threads

		####################
		## COMMENTS OWNER ##
		####################
		// create thread stream

		$stream_name = 'Komentar Owner';
		$module_slug = 'comments_owner';
		$stream_desc = 'Stream atau tabel yang menggunakan fitur komentar';

		$stream_namespace = 'streams';

		// Create Komentar Owner stream
		if( !$this->streams->streams->add_stream($stream_name, $module_slug, $stream_namespace, 'nyan_', $stream_desc)) return FALSE;
		
		// Get stream data
		$comment_owner = $this->streams->streams->get_stream($module_slug, $stream_namespace);
	
		// Add fields
		$fields   = array();
		$template = array('namespace' => $stream_namespace, 'assign' => $module_slug, 'type' => 'text', 'title_column' => FALSE, 'required' => TRUE, 'unique' => FALSE);

		$fields[] = array('name' => 'Judul', 'slug' => 'judul', 'title_column' => TRUE, 'unique' => TRUE);
		$fields[] = array('name' => 'Slug', 'slug' => 'slug', 'type' => 'slug', 'unique' => TRUE, 'extra' => array('space_type' => '-', 'slug_field' => 'judul'));

		// Combine
		foreach( $fields AS $key => $field ) { $fields[$key] = array_merge($template, $field); }
	
		// Add fields to stream
		foreach($fields as $field){
			if($this->discuss->check_stream_field($field['slug'], $stream_namespace))
				$this->streams->fields->assign_field($stream_namespace, $module_slug, $field['slug'], array('required' => $field['required'], 'unique' => $field['unique']));
			else
				$this->streams->fields->add_field($field);
		}
		################## end komentar owner

		##############
		## COMMENTS ##
		##############
		// create thread stream

		$stream_name = 'Komentar';
		$module_slug = 'comments';
		$stream_desc = 'Komentar Thread';

		$stream_namespace = 'streams';

		// Create Comments stream
		if( !$this->streams->streams->add_stream($stream_name, $module_slug, $stream_namespace, 'nyan_', $stream_desc)) return FALSE;
		
		// Get stream data
		// $comment = $this->streams->streams->get_stream($module_slug, $stream_namespace);
	
		// Add fields
		$fields   = array();
		$template = array('namespace' => $stream_namespace, 'assign' => $module_slug, 'type' => 'text', 'title_column' => FALSE, 'required' => TRUE, 'unique' => FALSE);

		$fields[] = array('name' => 'Thread', 'slug' => 'thread', 'type' => 'relationship', 'extra' => array('choose_stream' => $thread->id));
		$fields[] = array('name' => 'Konten', 'slug' => 'konten', 'type' => 'formatted_wysiwyg', 'extra' => array('editor_type' => 'simple'));
		$fields[] = array('name' => 'Status', 'slug' => 'status', 'type' => 'choice', 'required' => FALSE, 'extra' => array('choice_data' => "on : On\nof : Off", 'choice_type' => 'dropdown', 'default_value' => 'on'));
		$fields[] = array('name' => 'Komentar Owner', 'slug' => 'comment_owner', 'type' => 'relationship', 'required' => FALSE, 'extra' => array('choose_stream' => $comment_owner->id));

		// Combine
		foreach( $fields AS $key => $field ) { $fields[$key] = array_merge($template, $field); }
	
		// Add fields to stream
		foreach($fields as $field){
			if($this->discuss->check_stream_field($field['slug'], $stream_namespace))
				$this->streams->fields->assign_field($stream_namespace, $module_slug, $field['slug'], array('required' => $field['required'], 'unique' => $field['unique']));
			else
				$this->streams->fields->add_field($field);
		}
		################## end comment

		// last complete bug 'default_value' => 0 settings on some fields
		$siteref = SITE_REF;
		$this->db->query("ALTER TABLE `{$siteref}_nyan_threads` CHANGE `total_komentar` `total_komentar` INT( 11 ) NULL DEFAULT '0'");
		$this->db->query("ALTER TABLE `{$siteref}_nyan_topics` CHANGE `total_thread` `total_thread` INT( 11 ) NULL DEFAULT '0'");
		$this->db->query("ALTER TABLE `{$siteref}_nyan_groups` CHANGE `total_topik` `total_topik` INT( 11 ) NULL DEFAULT '0', CHANGE `total_thread` `total_thread` INT( 11 ) NULL DEFAULT '0'");

		
		return TRUE;
	}

	public function uninstall()
	{
	
		// Load required items
		$this->load->driver('Streams');
	
		// Remove settings
		// $this->settings('remove');

		// Remove email templates
		// $this->templates('remove');
		
		// Remove streams
		$this->streams->streams->delete_stream('groups', 'streams');
		$this->streams->streams->delete_stream('topics', 'streams');
		$this->streams->streams->delete_stream('threads', 'streams');
		$this->streams->streams->delete_stream('comments', 'streams');
		$this->streams->streams->delete_stream('comments_owner', 'streams');
		$this->streams->fields->delete_field('grup', 'streams');
		$this->streams->fields->delete_field('topik', 'streams');
		$this->streams->fields->delete_field('thread', 'streams');
		$this->streams->fields->delete_field('comment_owner', 'streams');

		// Return
		return TRUE;
	}

	public function upgrade($old_version)
	{

		// Add settings
		$this->settings('remove');
		$this->settings('add');

		return TRUE;
	}

	public function help()
	{

		return "Some Help Stuff";
	}
	
	public function settings($action)
	{
	
		// Variables
		$return     = TRUE;
		$settings   = array();
		
		// Tax
		$settings[] = array(
			'slug' 		  	=> 'chequest_tax',
			'title' 	  	=> 'Tax Percentage',
			'description' 	=> 'The percentage of tax to be applied to the products',
			'default'		=> '20',
			'value'			=> '20',
			'type' 			=> 'text',
			'options'		=> '',
			'is_required' 	=> 1,
			'is_gui'		=> 1,
			'module' 		=> 'chequest'
		);

		// Perform	
		if( $action == 'add' )
		{
			if( !$this->db->insert_batch('settings', $settings) )
			{
				$return = FALSE;
			}
		}
		elseif( $action == 'remove' )
		{
			// we do not delete all settings with module = chequest because
			// we don't want other chequest addon module settings deleted
			foreach ($settings as $setting)
			{
				if( !$this->db->delete('settings', array('slug' => $setting['slug'])) )
				{
					$return = FALSE;
				}
			}
		}
		
		return $return;	
	}

	public function templates($action)
	{

		$templates = array('order-complete-admin', 'order-complete-user');
		$sql = "INSERT INTO `" . SITE_REF . "_email_templates` (`slug`, `name`, `description`, `subject`, `body`, `lang`, `is_default`, `module`) VALUES
				('order-complete-admin', 'Order Complete (Admin)', 'Sent to the site admin once an order has been completed', '{{ settings:site_name }} :: An order has been complete', 'Email body', 'en', 0, ''),
				('order-complete-user', 'Order Complete (User)', 'Sent to the user once an order has been completed', '{{ settings:site_name }} :: Your Order Confirmation', 'Email body', 'en', 0, '');";

		if( $action == 'add' )
		{
			$this->db->query($sql);
		}
		else
		{
			$this->db->where_in('slug', $templates)->delete('email_templates');
		}

	}

	public function info()
	{
		return $this->information();
	}

}
