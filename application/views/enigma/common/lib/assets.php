<?php

class Skin_Enigma_Assets 
{
	public $css_dir = 'css';
	public $js_dir = 'js';
	public $link_properties = array('rel'     => 'stylesheet',
									'type'    => 'text/css',
									'media'   => 'screen',
									'charset' => 'utf-8');
	public $inherited_link_files = array(
										'admin' => array('structure.css',
														'skin.css'),
										'login' => array('structure.css',
														'skin.css'),
										'main'	=> array('structure.css',
														'skin.css'),
										'wiki'  => array('structure.css',
														'skin.css',
														'wiki.css')
										);
	
	public $link_files = array(
								'common' => array('template.css','color.css','jquery.ui.tabs.css'),
								'main'   => array('structure.css')
								);
	
	public function get_link_tag($name, $sec = false, $which = Skin_Enigma_Paths::SKIN)
	{
		$properties = $this->link_properties;
		$properties['href'] = Skin_Enigma::instance()->paths->get_url($name, $this->css_dir, $sec, $which);
		return link_tag($properties);
	}
	
	public function get_inherited_link_tags($sec = false)
	{
		$tags = '';
		if($sec && isset($this->inherited_link_files[$sec]))
			foreach($this->inherited_link_files[$sec] as $file)
				$tags .= $this->get_link_tag($file, $sec, Skin_Enigma_Paths::SKIN_INHERITED);
		return $tags;
	}
	
	public function get_link_tags($sec = false, $include_common = true)
	{
		$tags = '';
		if($include_common && isset($this->link_files['common']))
			foreach($this->link_files['common'] as $file)
				$tags .= $this->get_link_tag($file, 'common', Skin_Enigma_Paths::SKIN);
		if($sec && isset($this->link_files[$sec]))
			foreach($this->link_files[$sec] as $file)
				$tags .= $this->get_link_tag($file, $sec, Skin_Enigma_Paths::SKIN);
		return $tags;
	}
}