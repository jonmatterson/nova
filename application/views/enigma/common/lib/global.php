<?php

class Skin_Enigma
{
	/** @var Theme_Enigma_Paths */
	public $paths;
	
	/** @var Theme_Enigma_Assets */
	public $assets;
	
	private static $_instance = null;
	private function __construct(){}
	private function __clone(){}
	
	/** @return Theme_Enigma */
	public static function instance(){
		if(self::$_instance === null)
			self::$_instance = new Skin_Enigma();
		return self::$_instance;
	}
}

$ENIGMA = Skin_Enigma::instance();

include_once(dirname(__FILE__).'/paths.php');
include_once(dirname(__FILE__).'/assets.php');

$ENIGMA->paths = new Skin_Enigma_Paths();
$ENIGMA->assets = new Skin_Enigma_Assets();

include_once(dirname(dirname(dirname(__FILE__))).'/config.php');