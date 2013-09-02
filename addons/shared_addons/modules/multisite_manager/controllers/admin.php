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

	protected $item_validation_rules = array(
		array(
				'field' => 'name',
				'label' => 'Site Name',
				'rules' => 'required|trim|xss_clean',
			),
		array(
				'field' => 'ref',
				'label' => 'Reference',
				'rules' => 'required|trim|xss_clean',
			),
		array(
				'field' => 'domain',
				'label' => 'Domain',
				'rules' => 'required|trim|xss_clean',
			),
		array(
				'field' => 'active',
				'label' => 'Active',
				'rules' => 'integer',
			),
	);

	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('multisite_manager_m');
		$this->load->library('form_validation');
		$this->lang->load('multisite_manager');

		$this->template->append_js('module::admin.js')
					->append_css('module::admin.css');
	}

	/**
	 * List all items
	 */
	public function index()
	{
		$sites = $this->multisite_manager_m->get_sites();

		$this->template
			->title($this->module_details['name'])
			->set('sites', $sites)
			->build('admin/index');
	}

	public function create()
	{
		$sites = new StdClass();

		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if($this->form_validation->run())
		{
			// See if the model can create the record
			if($this->multisite_manager_m->create($this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('multisite_manager:success'));
				redirect('admin/multisite_manager');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('multisite_manager:error'));
				redirect('admin/multisite_manager/create');
			}
		}

		$sites->data = new StdClass();
		foreach ($this->item_validation_rules AS $rule)
		{
			$sites->data->{$rule['field']} = $this->input->post($rule['field']);
		}
		$this->_form_data();
		// Build the view using sample/views/admin/form.php
		$this->template->title($this->module_details['name'], lang('multisite_manager:new_item'))
						->build('admin/form', $sites->data);
	}

	public function edit($id = 0)
	{
		$data = $this->multisite_manager_m->get($id);

		if(!$data) redirect('admin/'.$this->module_details['slug']);

		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if($this->form_validation->run())
		{
			// get rid of the btnAction item that tells us which button was clicked.
			// If we don't unset it MY_Model will try to insert it
			unset($_POST['btnAction']);

			// See if the model can create the record
			if($this->multisite_manager_m->edit($id, $this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('multisite_manager:success'));
				redirect('admin/multisite_manager');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('multisite_manager:error'));
				redirect('admin/multisite_manager/create');
			}
		}

		// Build the view using sample/views/admin/form.php
		$this->template->title($this->module_details['name'], lang('multisite_manager:edit'))
						->build('admin/form', $data);
	}

	public function delete($id = 0)
	{
		// make sure the button was clicked and that there is an array of ids
		if (isset($_POST['btnAction']) AND is_array($_POST['action_to']))
		{
			// pass the ids and let MY_Model delete the items
			$this->multisite_manager_m->delete_many($this->input->post('action_to'));
		}
		elseif (is_numeric($id))
		{
			// they just clicked the link so we'll delete that one
			$this->multisite_manager_m->delete($id);
		}
		redirect('admin/multisite_manager');
	}
	public function order() {
		$items = $this->input->post('items');
		$i = 0;
		foreach($items as $item) {
			$item = substr($item, 5);
			$this->multisite_manager_m->update($item, array('order' => $i));
			$i++;
		}
	}
}
