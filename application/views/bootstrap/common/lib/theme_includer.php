<?php

class Theme_Includer 
{
	public static function view($file, $sec = 'common')
	{
		$path = dirname(dirname(dirname(__FILE__))).'/';
		if($sec)
			$path .= $sec.'/';
		$path .= 'views/'.$file.'.php';
		
		include_once($path);
	}
}