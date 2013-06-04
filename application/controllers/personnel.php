<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/controllers/nova_personnel.php';

class Personnel extends Nova_personnel {

	public function __construct()
	{
		parent::__construct();
		$this->_regions['nav_sub'] = false;
	}
	
	public function coc()
    {
		$this->_regions['nav_sub'] = Menu::build('sub', 'main');
        return parent::coc();
    }
}
