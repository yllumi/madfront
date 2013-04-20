<?php defined('BASEPATH') or exit('No direct script access allowed');

class Module_Multisite_Manager extends Module {

	public $version = '1.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Madfront Multisite Manager'
				),
			'description' => array(
				'en' => 'Multisite Manager for Madfront'
				),
			'frontend' => true,
			'backend' => true,
			'sections' => array(
				'items' => array(
					'name' 	=> 'multisite_manager:items', // These are translated from your language file
					'uri' 	=> 'admin/multisite_manager',
					'shortcuts' => array(
						'create' => array(
							'name' 	=> 'multisite_manager:create',
							'uri' 	=> 'admin/multisite_manager/create',
							'class' => 'add'
							)
						)
					)
				)
			);
	}

	public function admin_menu(&$menu)
	{
		if(!isset($menu['Madfront']))
			$menu['Madfront'] = array();
	   	$menu['Madfront'] += array(
	    	'Multisite Manager' => 'admin/multisite_manager'
		);
	}

	public function install()
	{
		// delete unique ref from core_sites and set default value for it
		$this->db->query("ALTER TABLE `core_sites` CHANGE `ref` `ref` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default'");

		// alter for unique field in blog categories
		$this->db->query("ALTER TABLE `default_blog_categories` DROP INDEX `unique_title`");
		$this->db->query("ALTER TABLE `default_blog_categories` DROP INDEX `unique_slug`");

		// add site_id dield to some table
		$multisite_tables = array(
				'default_blog',
				'default_blog_categories',
				'default_comments',
				'default_contact_log',
				'default_files',
				'default_file_folders',
				'default_navigation_groups',
				'default_navigation_links',
				'default_pages',
				'default_redirects',
				'default_search_index',
				'default_variables',
				'default_widget_areas',
				'default_widget_instances'
			);
		foreach ($multisite_tables as $table) {
			$this->db->query('ALTER TABLE  `{$table}` ADD `site_id` INT NOT NULL DEFAULT 1 AFTER `id`');
		}

		// add site_id to default_settings too
		$this->db->query('ALTER TABLE  `default_settings` ADD `site_id` INT NOT NULL DEFAULT 1');

		return TRUE;
	}

	public function uninstall()
	{
		return true;
	}


	public function upgrade($old_version)
	{
		// Your Upgrade Logic
		return TRUE;
	}

	public function help()
	{
		// Return a string containing help info
		// You could include a file and return it here.
		return "No documentation has been added for this module.<br />Contact the module developer for assistance.";
	}
}
/* End of file details.php */
