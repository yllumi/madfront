<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');


$module_ref = 'nyandiscuss';

$route[$module_ref.'/(:num)']					= $module_ref.'/index/$1';
$route[$module_ref.'/(:num)/(:num)']			= $module_ref.'/index/$1/$2';

// group
$route[$module_ref.'/group/create']				= $module_ref.'/create_group';
$route[$module_ref.'/group/(:num)']				= $module_ref.'/group_threads/$1';
$route[$module_ref.'/group/(:num)/(:any)']		= $module_ref.'/group_threads/$1/$2';
$route[$module_ref.'/group/member/(:any)']		= $module_ref.'/group_members/$1';
$route[$module_ref.'/group/edit/(:num)']		= $module_ref.'/edit_group/$1';

// topic
$route[$module_ref.'/topic/create']				= $module_ref.'/create_topic';
$route[$module_ref.'/topic/create/(:num)']		= $module_ref.'/create_topic/$1';
$route[$module_ref.'/topic/edit/(:num)/(:num)']	= $module_ref.'/edit_topic/$1/$2';

// thread
$route[$module_ref.'/thread/create']			= $module_ref.'/create_thread';
$route[$module_ref.'/thread/create/(:any)']		= $module_ref.'/create_thread/$1';
$route[$module_ref.'/thread/(:num)/(:any)']		= $module_ref.'/thread/$1/$2';
$route[$module_ref.'/thread/edit/(:num)']		= $module_ref.'/edit_thread/$1';

// comment
$route[$module_ref.'/comment/delete/(:any)']	= $module_ref.'/delete_comment/$1';
