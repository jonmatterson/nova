<?php 

$this->event->listen(['template', 'render', 'data'], function($event){
  
  $event['data']['javascript'] .= '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript">
function initializeTimepicker(ele){
  var options = JSON.parse($(ele).attr("data-timepicker"));
  if(!$.isPlainObject(options)) options = {};
  $(ele).timepicker(options)
}
$(document).ready(function(){
  $("[data-timepicker]").each(function(){
    initializeTimepicker(this)
  })
});
</script>';
  
});
