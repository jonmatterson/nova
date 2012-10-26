<?php

class Skin_Enigma_Paths
{
	const SKIN = 'SKIN';
	const SKIN_INHERITED = 'SKIN_INHERITED';
	public $skin_dir;
	public $inherit_skin_dir;
	public $skin_base_dir;
	public $inherit_skin_base_dir;
	
	public function __construct()
	{
		$this->skin_dir = 'ds10';
		$this->inherit_skin_dir = 'default';
		$this->skin_base_dir = APPFOLDER.'/views';
		$this->inherit_skin_base_dir = APPFOLDER.'/views';
	}
	
	public function get_url($name, $type = false, $sec = false, $which = Skin_Enigma_Paths::SKIN)
	{
		switch($which)
		{
			case self::SKIN: 
				$path = $this->skin_base_dir.'/'.$this->skin_dir; 
				break;
			case self::SKIN_INHERITED: 
				$path = $this->inherit_skin_base_dir.'/'.$this->inherit_skin_dir; 
				break;
			default:
				throw new Exception('Invalid $which parameter');
		}
		
		if($sec) $path .= '/'.$sec;
		if($type) $path .= '/'.$type;
		
		return self::to_absolute_url($path.'/'.$name);
	}
	
	public function get_inherited_url($name, $type = false, $sec = false)
	{
		return $this->get_url($name, $type, $sec, Skin_Enigma_Paths::SKIN_INHERITED);
	}
	
	public static function to_absolute_url($url)
	{
		global $CI;
		return strpos($url, '://') === FALSE ? ($CI->config->slash_item('base_url').$url) : $url; 
	}
}
