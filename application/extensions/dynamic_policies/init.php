<?php

$this->event->listen(['template', 'render', 'data', 'main', 'policies'], function($event){
    
    $this->load->helper('url');
    
    $url = $this->ci->uri->segment(3) 
            ? $this->extension['dynamic_policies']->url('view/policy/'.$this->ci->uri->segment(3))
            : $this->extension['dynamic_policies']->url('view/index');
    
    redirect($url, 'refresh');
    
});
