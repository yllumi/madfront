<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * IPro Board Event Class
 *
 * Currently, this plugs into the admin_notification to use PyroStreams validation.
 * Especially, this event is for Points Bidder Checks
 * 
 * @package		PyroStreams
 * @category	events
 * @author		Widianto Gilang Ramadhan
 * @copyright	Copyright (c) 2011 - 2012, Parse19
 */
class Events_Nyandiscuss {
    
    protected $CI;
 
  	// --------------------------------------------------------------------------
   
    public function __construct()
    {
        $this->CI =& get_instance();

        // Delete the row_m and streams cache on create/update/delete
        Events::register('streams_post_insert_entry', array($this, 'run'));
        $this->CI->load->library('nyandiscuss/Discuss');
    }

    // --------------------------------------------------------------------------

    /**
     * Empty PyroStreams Cache 
     *
     * Both the tag cache and the row_m cache.
     *
     * @access  public
     * @return  void
     */
    public function run($passed)
    {
        // ambil data stream yang baru disubmit tersebut
        $entry_id = $passed['entry_id'];
        $data = $passed['insert_data'];
        $user_id = $data['created_by'];            

        // kalo stream yang disimpan adalah stream topik
        if($passed['stream']->stream_slug == 'topics'){
            if(isset($data['grup']))
               	$this->CI->discuss->increase_counter($data['grup'], SITE_REF.'_nyan_groups', 'total_topik');
        }

        if($passed['stream']->stream_slug == 'threads'){
            if(isset($data['topik']))
                $this->CI->discuss->increase_counter($data['topik'], SITE_REF.'_nyan_topics', 'total_thread');
            if(isset($data['grup']))
                $this->CI->discuss->increase_counter($data['grup'], SITE_REF.'_nyan_groups', 'total_thread');
        }

    }

}