<?php 

$this->event->listen(['template', 'render', 'data'], function($event){
  $event['data']['javascript'] 
        .= '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">'
         . '<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>'
         . $this->extension['timepicker']->inline_js('timepicker', 'global');
});
