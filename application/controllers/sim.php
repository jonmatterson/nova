<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/controllers/nova_sim.php';

class Sim extends Nova_sim {
	
	public function __construct()
	{
		parent::__construct();
	}
    
    public function missions($type = '', $id = false)
    {
        $this->_regions['nav_pills'] = $this->_regions['nav_sub'];
        $this->_regions['nav_sub'] = false;
        return parent::missions($type, $id);
    }
    
    public function listposts() 
    {
        $this->_regions['nav_pills'] = $this->_regions['nav_sub'];
        $this->_regions['nav_sub'] = false;
        parent::listposts();
    }
    
    public function listlogs($offset = 0)
    {
        $this->_regions['nav_pills'] = $this->_regions['nav_sub'];
        $this->_regions['nav_sub'] = false;
        return parent::listlogs($offset);
    }
    
    public function viewpost($id = false) 
    {
        $this->_regions['nav_pills'] = $this->_regions['nav_sub'];
        $this->_regions['nav_sub'] = false;
        return parent::viewpost($id);
    }
    
    public function viewlog($id = false)
    {
        $this->_regions['nav_pills'] = $this->_regions['nav_sub'];
        $this->_regions['nav_sub'] = false;
        return parent::viewlog($id);
    }
	
	public function departments()
    {
		$this->_regions['nav_sub'] = Menu::build('sub', 'main');
        return parent::departments();
    }
	
	public function tour($id = false)
    {
		$this->_regions['nav_sub'] = Menu::build('sub', 'main');
        return parent::tour($id);
    }
	
	public function specs($id = false)
    {
		$this->_regions['nav_sub'] = Menu::build('sub', 'main');
        return parent::specs($id);
    }
	
	public function decks($item = false)
    {
		$this->_regions['nav_sub'] = Menu::build('sub', 'main');
        return parent::decks($item);
    }
}
