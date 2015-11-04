<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * In application/controllers/write.php,
 * 
 *    add the following before the class definition:
 * 
 *      require_once APPPATH.'third_party/collaborative_writing/write_controller_missionpost_method_trait.php';
 * 
 *    and add the following in the class definition:
 * 
 *      use Collaborative_Writing_Write_Controller_Missionpost_Method_Trait;
 * 
 * Alternatively, copy the write_controller_missionpost_method_trait.php source
 * code directly into the class definition in application/controllers/write.php
 * if your version of PHP does not support traits.
 * 
 */

trait Collaborative_Writing_Write_Controller_Missionpost_Method_Trait
{
    public function missionpost($id = false)
    {
        $this->config->load('collaborative_writing', false, true);
        
        if (isset($_POST['submit']) && $pad_id = $this->input->post('pad_id', true)) 
        {
            $this->posts->set_pad_id_for_next_post($this->input->post('pad_id', true));
        }
        
        ob_start();
        parent::missionpost($id);
		$buffer = ob_get_contents();
		ob_end_clean();
        
        $this->posts->set_deferred_post_pads();
        
        if($buffer)
            echo $buffer;
    }
}