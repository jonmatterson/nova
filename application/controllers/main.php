<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/controllers/nova_main.php';

class Main extends Nova_main {
	
	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		// header and welcome message
		$this->_regions['nav_sub'] = false;
        
        $data['slideshow_welcome'] = $this->msgs->get_message('welcome_slideshow');
		$data['header'] = $this->msgs->get_message('welcome_head');
		$data['msg_welcome'] = $this->msgs->get_message('welcome_msg').$this->msgs->get_message('welcome_facility').$this->msgs->get_message('welcome_vessels').$this->msgs->get_message('welcome_staff').$this->msgs->get_message('welcome_more');
		
		$this->_regions['content'] = Location::view('main_index', $this->skin, 'main', $data);
		$this->_regions['javascript'] = Location::js('main_index_js', $this->skin, 'main');
		$this->_regions['title'].= ucfirst(lang('labels_main'));
		
		Template::assign($this->_regions);
		
		Template::render();
	}
    
    public function about()
    {
		$data['header'] = $this->msgs->get_message('about_head');
		$data['msg_about'] = $this->msgs->get_message('about_station').$this->msgs->get_message('about_system').$this->msgs->get_message('about_premise').$this->msgs->get_message('about_staff');
		
		$this->_regions['content'] = Location::view('main_about', $this->skin, 'main', $data);
		$this->_regions['title'].= ucfirst(lang('labels_main'));
		
		Template::assign($this->_regions);
		
		Template::render();
        
    }
}
