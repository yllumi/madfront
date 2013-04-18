<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * madfront_multisite_manager Events Class
 *
 * @author      Toni Haryanto
 * @website     http://toniharyanto.com
 * @package     PyroCMS
 * @subpackage  Madfront
 * @copyright   MIT
 */
class Events_madfront_multisite_manager {

    protected $ci;

    public function __construct()
    {
        $this->ci =& get_instance();

        //register the public_controller event
        Events::register('public_controller', array($this, 'run'));

		//register a second event that can be called any time.
		// To execute the "run" method below you would use: Events::trigger('madfront_multisite_manager_event');
		// in any php file within PyroCMS, even another module.
		Events::register('madfront_multisite_manager_event', array($this, 'run'));
    }

    public function run()
    {
        $this->ci->load->model('madfront_multisite_manager/madfront_multisite_manager_m');

        // we're fetching this data on each front-end load. You'd probably want to do something with it IRL
        $this->ci->madfront_multisite_manager_m->limit(5)->get_all();
    }

}
/* End of file events.php */