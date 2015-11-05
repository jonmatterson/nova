<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

include dirname(__FILE__).'/write_missionpost_js/base.php';

require_once MODPATH.'core/views/_base/admin/js/write_missionpost_js.php';

try
{

    require_once dirname(__FILE__).'/etherpad/etherpad_lite_client.php';

    $etherpad_url = $this->config->item('collaborative_writing_etherpad_url') ?: 'http://0.0.0.0:9001';
    $etherpad_api_url = $etherpad_url.'/api';
    $etherpad_api_key = $this->config->item('collaborative_writing_etherpad_api_key') ?: '';
    
    $etherpad_client = new EtherpadLiteClient($etherpad_api_key, $etherpad_api_url);

    if($this->uri->segment(3))
    {
        $post = $this->posts->get_post($this->uri->segment(3));
        $pad_id = $this->posts->get_post_pad_id($this->uri->segment(3));
    }

    if(!isset($pad_id))
    {
        $pad_id = str_replace('.', '', uniqid('', true));
        $etherpad_client->createPad($pad_id, '');
    }
    else
    {
        $etherpad_client->checkToken();
    }

    $user_main_character_name = str_replace('\'', '\\\'', $this->char->get_character_name($this->user->get_user($this->session->userdata('userid'))->main_char));

    include dirname(__FILE__).'/write_missionpost_js/disable_locking.php';
    include dirname(__FILE__).'/write_missionpost_js/etherpad.php';

}
catch(Exception $e)
{
    // If this fails, do nothing, which will fall back to the default behavior 
    // of just using the textarea and the old style.
}