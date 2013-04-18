<?php defined('BASEPATH') or exit('No direct script access allowed');
/**
 * Multisite Manager for Madfront
 *
 * @author      Toni Haryanto
 * @website     http://toniharyanto.com
 * @package     PyroCMS
 * @subpackage  Madfront
 * @copyright   MIT
 */
class multisite_manager extends Public_Controller
{

    /**
     * The constructor
     * @access public
     * @return void
     */
    public function __construct()
    {
      parent::__construct();
      $this->lang->load('madfront_multisite_manager');
      $this->load->model('madfront_multisite_manager_m');
      $this->template->append_css('module::madfront_multisite_manager.css');
    }
     /**
     * List all madfront_multisite_managers
     *
     *
     * @access  public
     * @return  void
     */
     public function index()
     {
      // bind the information to a key
      $data['madfront_multisite_manager'] = (array)$this->madfront_multisite_manager_m->get_all();
      // Build the page
      $this->template->title($this->module_details['name'])
      ->build('index', $data);
    }

  }

/* End of file madfront_multisite_manager.php */