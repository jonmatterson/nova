<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div class="alert alert-<?php echo $status;?>">
	<?php 
	if($status == 'error') 
		echo '<strong>Error</strong><br>';
	elseif($status == 'success')
		echo '<strong>Success</strong><br>'
	?>
	<?php echo $message;?>
</div>