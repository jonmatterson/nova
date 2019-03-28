<?php 

$this->event->listen(['template', 'render', 'data'], function($event){
  
  $seg1 = $this->uri->segment(1);
  if(empty($seg1))
    $seg1 = 'main';
  $seg2 = $this->uri->segment(2);
  if(empty($seg2))
    $seg2 = 'index';
  
  $event['data']['javascript'] .= '<script type="text/javascript">
    $(document ).ready(function() {
        $("body").addClass("ci-route--'.$seg1.'--'.$seg2.'");
    });
</script>';
  
});
