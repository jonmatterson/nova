<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/libraries/Nova_controller_main.php';

class __extensions__dynamic_policies__view extends Nova_controller_main
{
	public function __construct()
	{
		parent::__construct();

		$this->_regions['nav_sub'] = Menu::build('sub', 'sim');
	}
    
    public function policy($name)
    {
        $this->load->helper('utility');
        $this->load->model('users_model', 'users');
        
        $headers = [];
        
        foreach ($this->msgs->get_all_messages()->result() as $row)
        {
            if(strpos($row->message_key, 'policy-') === 0){
                $headers[substr($row->message_key, 7)] = $row->message_label;
            }
            
            if(substr($row->message_key, 7) == $name){
                $message = $row->message_content;
            }
        }
		
		asort($headers);
        
        $data = [];
        
        $data['header'] = $headers[$name];
        
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
    
    public function index()
 	{
        $this->load->helper('utility');
        $this->load->model('users_model', 'users');
        
        $headers = [];
        
        foreach ($this->msgs->get_all_messages()->result() as $row)
        {
            if(strpos($row->message_key, 'policy-') === 0){
                $headers[substr($row->message_key, 7)] = $row->message_label;
            }
        }
		
		asort($headers);
        
        $data = [];
        
        $data['header'] = 'Policies';

        $message = $this->msgs->get_message('policies');
		
        if(!$message)
            $message = '';
        
        $message .= '<ul class="bulleted">';
        foreach($headers as $key => $value){
            $message .= "<li>".anchor($this->extension['dynamic_policies']->url('view/policy/' . $key), $value)."</li>";
        }
        $message .= "</ul>";
        
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
