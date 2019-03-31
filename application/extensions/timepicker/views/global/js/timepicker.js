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
