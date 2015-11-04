<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/controllers/nova_write.php';
require_once APPPATH.'third_party/collaborative_writing/write_controller_missionpost_method_trait.php';

class Write extends Nova_write {

	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * Put your own methods below this...
	 */
    
    use Collaborative_Writing_Write_Controller_Missionpost_Method_Trait;
    
}
