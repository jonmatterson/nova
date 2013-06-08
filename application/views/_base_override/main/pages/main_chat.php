<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<p><a href="<?php echo $url ?>" target="_blank">Click here</a> to launch chat client in a new window.</p>
<iframe width="100%" height="550" src="<?php echo $url ?>"></iframe>