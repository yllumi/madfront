<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * PyroStreams WYSIWYG Field Type
 *
 * @package		PyroCMS\Core\Modules\Streams Core\Field Types
 * @author		Parse19
 * @copyright	Copyright (c) 2011 - 2012, Parse19
 * @license		http://parse19.com/pyrostreams/docs/license
 * @link		http://parse19.com/pyrostreams
 */
class Field_formatted_wysiwyg
{
	public $field_type_name			= 'Formatted WYSIWYG';

	public $field_type_slug			= 'formatted_wysiwyg';
	
	public $db_col_type				= 'longtext';
	
	public $custom_parameters 		= array('editor_type');

	public $version					= '1.0';

	public $author					= array('name'=>'AI Web Systems, Inc.', 'url'=>'http://aiwebsystems.com');
	
	// --------------------------------------------------------------------------

	/**
	 * Event
	 *
	 * Called before the form is built.
	 *
	 * @access	public
	 * @return	void
	 */
	public function event()
	{
		if (defined('ADMIN_THEME'))
		{
			$this->CI->type->add_misc($this->CI->type->load_view('wysiwyg', 'wysiwyg_admin', null));
		}
		else
		{
			$this->CI->type->add_misc($this->CI->type->load_view('wysiwyg', 'wysiwyg_entry_form', null));
		}
	}

	// --------------------------------------------------------------------------

	/**
	 * Output form input
	 *
	 * @param	array
	 * @param	array
	 * @return	string
	 */
	public function form_output($data)
	{
		// Set editor type
		if (isset($data['custom']['editor_type']))
		{
			$options['class']	= 'wysiwyg-'.$data['custom']['editor_type'];
		}
		else
		{
			$options['class']	= 'wysiwyg-simple';
		}
	
		$options['name'] 	= $data['form_slug'];
		$options['id']		= $data['form_slug'];
		$options['value']	= $data['value'];
		
		return form_textarea($options);
	}

	// --------------------------------------------------------------------------

	/**
	 * Pre-Save
	 *
	 * Called before the input is saved.
	 *
	 * @access	public
	 * @return	void
	 */
	public function pre_save($input)
	{
		return $input;
	}

	// --------------------------------------------------------------------------

	/**
	 * Process before outputting for the plugin
	 *
	 * This creates an array of data to be merged with the
	 * tag array so relationship data can be called with
	 * a {field.column} syntax
	 *
	 * @access	public
	 * @param	string
	 * @param	string
	 * @param	array
	 * @return	array
	 */
	public function pre_output_plugin($input, $params)
	{

		// Return a formatted array with cool options
		return array(
			'normal' => $input,
			'plain_text' => strip_tags($input),
			'stripped' => str_replace("\n", " ", strip_tags($input)),
			'decode_entities' => html_entity_decode($input),
			);
	}

	// --------------------------------------------------------------------------
	
	/**
	 * Editor Type Param
	 *
	 * Choose the type of editor.
	 */
	public function param_editor_type($value = null)
	{
		$types = array(
			'simple'	=> lang('streams.formatted_wysiwyg.simple'),
			'advanced'	=> lang('streams.formatted_wysiwyg.advanced')
		);
	
		return form_dropdown('editor_type', $types, $value);
	}	

}