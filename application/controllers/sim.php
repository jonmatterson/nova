<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/controllers/nova_sim.php';

class Sim extends Nova_sim {
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function chat()
	{
		$data = array(
			'header'=>'Chat',
			'url'=>'http://widget.mibbit.com/?settings=c0696eb657ff8fd5838015b6b8b17796&amp;server=irc.aceirc.org&amp;channel=%23Enigma'
			);
		
		$this->_regions['content'] = Location::view('sim_chat', $this->skin, 'main', $data);
		$this->_regions['title'].= $data['header'];
		
		Template::assign($this->_regions);
		Template::render();
	}
	
	/**
	 * Put your own methods below this...
	 */
}
