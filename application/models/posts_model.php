<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/models/nova_posts_model.php';
require_once APPPATH.'third_party/collaborative_writing/posts_model_traits.php';

class Posts_model extends Nova_posts_model {

	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * Put your own methods below this...
	 */
    
    use Collaborative_Writing_Posts_Model_Trait;
}
