<?php

class Theme_URL 
{
	const THEME_NAME = 'bootstrap';
	
	public static function index()
	{
		global $CI;
		return $CI->config->slash_item('base_url');
	}
	
	public static function get($file, $type = false, $sec = 'common')
	{
		global $CI;
		$url = APPFOLDER.'/views/'.self::THEME_NAME.'/'.$sec.'/';
		if($type) $url .= $type.'/';
		return $CI->config->slash_item('base_url').$url.$file;
	}
	
	public static function css($file, $sec = 'common')
	{
		return self::get($file, 'css', $sec);
	}
	
	public static function js($file, $sec = 'common')
	{
		return self::get($file, 'js', $sec);
	}
	
	public static function img($file, $sec = 'common')
	{
		return self::get($file, 'img', $sec);
	}
}