<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

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