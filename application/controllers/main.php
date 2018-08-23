<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/controllers/nova_main.php';

class Main extends Nova_main {
	
	public function __construct()
	{
		parent::__construct();
	}
	
	/**
	 * Put your own methods below this...
	 */
	 
  public function policies($policy = null)
 	{
 		$this->load->helper('utility');
 	  $this->load->model('users_model', 'users');

 		$headers = array(
 			'privacy' => "Privacy Policy",
 			'cookie' => "Cookies Policy",
 			'do-not-track' => "Do Not Track Policy",
 			'california' => "Your California Privacy Rights Policy",
 			'coppa' => "COPPA Policy",
 			'ip' => "Intellectual Property Policy",
			'dmca' => "Copyright Infringement Notification Policy"
 		);
 		
 		if($policy){

 				$data['header'] = (array_key_exists($policy, $headers)) ? $headers[$policy] : "Policies";

 				$message = $this->msgs->get_message("policy-{$policy}");
 			
 		}else{
 			
 				$data['header'] = 'Policies';
 				
 				$message = $this->msgs->get_message('policies');
				$message .= '<ul class="bulleted">';
 				foreach($headers as $key => $value){
 					$message .= "<li>".anchor('main/policies/' . $key, $value)."</li>";
 				}
 				$message .= "</ul>";
 		}

 		$data['message'] = parse_dynamic_message($message, [
 			'sim_name' => $this->options['sim_name'],
 			'access_log_purge' => $this->options['access_log_purge'],
 			'hosting_company' => $this->options['hosting_company'],
 			'admin_email' => implode(' or ', $this->users->get_gm_emails())
 		]);
		
		$data['policy'] = $policy;

 		$data['policies'] = $headers;

 		$this->_regions['content'] = Location::view('main_policies', $this->skin, 'main', $data);
 		$this->_regions['title'] .= $data['header'];

 		Template::assign($this->_regions);

 		Template::render();
 	}
	 
}
