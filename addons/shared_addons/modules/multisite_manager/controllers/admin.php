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
class Admin extends Admin_Controller
{
	protected $section = 'items';

	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('madfront_multisite_manager_m');
		$this->load->library('form_validation');
		$this->lang->load('madfront_multisite_manager');

		// $this->load->library('files/files');
		// $this->load->model('files/file_folders_m');

		// Set the validation rules
		$this->item_validation_rules = array(
			array(
					'field' => 'site_name',
					'label' => 'Site Name',
					'rules' => 'required|trim|is_unique|xss_clean',
				),
array(
					'field' => 'domain',
					'label' => 'Domain',
					'rules' => 'required|trim|is_unique|xss_clean',
				),
array(
					'field' => 'active',
					'label' => 'Active',
					'rules' => 'integer',
				),

		);

		// We'll set the partials and metadata here since they're used everywhere
		$this->template->append_js('module::admin.js')
						->append_css('module::admin.css');
	}

	/**
	 * List all items
	 */
	public function index()
	{
		$madfront_multisite_manager = $this->madfront_multisite_manager_m->order_by('order')->get_all();
			$this->template
		->title($this->module_details['name'])
		->set('madfront_multisite_manager', $madfront_multisite_manager)
		->build('admin/index');
	}

	public function create()
	{
		$madfront_multisite_manager = new StdClass();
		// $folder = $this->file_folders_m->get_by('name', 'madfront_multisite_manager');
		// $this->data->files = Files::folder_contents($folder->id);
		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if($this->form_validation->run())
		{
			// See if the model can create the record
			if($this->madfront_multisite_manager_m->create($this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('madfront_multisite_manager.success'));
				redirect('admin/madfront_multisite_manager');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('madfront_multisite_manager.error'));
				redirect('admin/madfront_multisite_manager/create');
			}
		}
		$madfront_multisite_manager->data = new StdClass();
		foreach ($this->item_validation_rules AS $rule)
		{
			$madfront_multisite_manager->data->{$rule['field']} = $this->input->post($rule['field']);
		}
		$this->_form_data();
		// Build the view using sample/views/admin/form.php
		$this->template->title($this->module_details['name'], lang('madfront_multisite_manager.new_item'))
						->build('admin/form', $madfront_multisite_manager->data);
	}

	public function edit($id = 0)
	{
		$this->data = $this->madfront_multisite_manager_m->get($id);

		// $this->load->model('files/file_folders_m');
		// $folder = $this->file_folders_m->get_by('name', 'madfront_multisite_manager');
		// $this->data->files = Files::folder_contents($folder->id);

		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if($this->form_validation->run())
		{
			// get rid of the btnAction item that tells us which button was clicked.
			// If we don't unset it MY_Model will try to insert it
			unset($_POST['btnAction']);

			// See if the model can create the record
			if($this->madfront_multisite_manager_m->edit($id, $this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('madfront_multisite_manager.success'));
				redirect('admin/madfront_multisite_manager');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('madfront_multisite_manager.error'));
				redirect('admin/madfront_multisite_manager/create');
			}
		}
		// starting point for file uploads
		// $this->data->fileinput = json_decode($this->data->fileinput);
		$this->_form_data();
		// Build the view using sample/views/admin/form.php
		$this->template->title($this->module_details['name'], lang('madfront_multisite_manager.edit'))
						->build('admin/form', $this->data);
	}

	public function _form_data()
	{
		// $this->load->model('pages/page_m');
		// $this->template->pages = array_for_select($this->page_m->get_page_tree(), 'id', 'title');
	}

	public function delete($id = 0)
	{
		// make sure the button was clicked and that there is an array of ids
		if (isset($_POST['btnAction']) AND is_array($_POST['action_to']))
		{
			// pass the ids and let MY_Model delete the items
			$this->madfront_multisite_manager_m->delete_many($this->input->post('action_to'));
		}
		elseif (is_numeric($id))
		{
			// they just clicked the link so we'll delete that one
			$this->madfront_multisite_manager_m->delete($id);
		}
		redirect('admin/madfront_multisite_manager');
	}
	public function order() {
		$items = $this->input->post('items');
		$i = 0;
		foreach($items as $item) {
			$item = substr($item, 5);
			$this->madfront_multisite_manager_m->update($item, array('order' => $i));
			$i++;
		}
	}
}
