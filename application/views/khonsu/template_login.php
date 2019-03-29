<?php

$KHONSU__TEMPLATE_CONTEXT = 'login';

$sec = 'login';
$css = 'main.css';

$path = explode('/', dirname(__FILE__));

// Windows servers user back slashes, so we have to capture for that
if (count($path) <= 1)
	$path = explode('\\', dirname(__FILE__));

$pcount = count($path);
$skin_loc = $pcount -1;
$current_skin = $path[$skin_loc];

// set the final style location
$style_loc = APPFOLDER.'/views/'.$current_skin.'/'.$sec.'/css/'. $css;

// set up the link tag parameters
$link = array(
	'href'	=> 	$style_loc,
	'rel'	=> 	'stylesheet',
	'type'	=> 	'text/css',
	'media'		=> 'screen',
	'charset'	=> 'utf-8'
);

?><!DOCTYPE html>
<html lang="en">
	<head>
		<?php include(dirname(__FILE__).'/base/includes/_template_head.php'); ?>
	</head>
	<body>
		<section>
			<div class="login-wrapper">
				<div class="content">
					<?php echo $flash_message;?>
					<?php echo $content;?>
				</div>
				
				<footer>
					<?php if ($this->uri->segment(2) and $this->uri->segment(2) !== 'index'): ?>
						<strong><?php echo anchor('login/index', ucwords(lang('actions_login') .' '. lang('time_now')));?></strong>
						&nbsp; | &nbsp;
					<?php endif; ?>

					<?php if ($this->uri->segment(2) !== 'reset_password'): ?>
						<strong><?php echo anchor('login/reset_password', ucwords(lang('actions_reset') .' '. lang('labels_password')));?></strong>
						&nbsp; | &nbsp;
					<?php endif; ?>

					<strong><?php echo anchor('main/index', ucfirst(lang('actions_back') .' '. lang('labels_to') .' '. lang('labels_site')));?></strong>
					
				</footer>
				
				<?php include(dirname(__FILE__).'/base/includes/_template_footer.php'); ?>
				
			</div>
		</section>
	</body>
</html>
