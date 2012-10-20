<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php echo text_output($message);?>

<script type="text/javascript">
(function(){
	var cdv = 5;
	var cdf = function(){
		if(cdv > 0){
			$('#countdown').html(cdv)
			setTimeout(cdf, 1000)
			cdv--;
		}
	}
	cdf();
})()
</script>