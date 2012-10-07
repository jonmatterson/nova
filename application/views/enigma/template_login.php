<?php

include_once(dirname(__FILE__).'/global.php');
$SKIN_ENIGMA = Skin_Enigma::instance();
$current_skin = $SKIN_ENIGMA->paths->skin_dir;

$sec = 'login';

?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><?php echo $title;?></title>
		
		<meta name="description" content="<?php echo $this->config->item('meta_desc');?>" />
		<meta name="keywords" content="<?php echo $this->config->item('meta_keywords');?>" />
		<meta name="author" content="<?php echo $this->config->item('meta_author');?>" />
		
		<?php echo $_redirect;?>
		
		<?php echo $SKIN_ENIGMA->assets->get_inherited_link_tags($sec);;?>
		
		<!--[if lt IE 9]>
		<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<?php include_once($this->config->item('include_head_login'));?>
		
		<script type="text/javascript" src="<?php echo $SKIN_ENIGMA->paths->get_inherited_url('jquery.blockUI.js'); ?>"></script>
		
		<?php echo $javascript;?>
		
		<?php echo $SKIN_ENIGMA->assets->get_link_tags($sec); ?>
		
	</head>
	<body>
		<h1 id="name"><?php echo $this->options['sim_name'];?></h1>
		<section>
			<div class="wrapper">
				
				<div class="content login">
					<?php echo $flash_message;?>
					<?php echo $content;?>
					<div class="sub">
						<?php if ($this->uri->segment(2) and $this->uri->segment(2) !== 'index'): ?>
							<strong><?php echo anchor('login/index', ucwords(lang('actions_login') .' '. lang('time_now')));?></strong>
							&nbsp; | &nbsp;
						<?php endif; ?>

						<?php if ($this->uri->segment(2) !== 'reset_password'): ?>
							<strong><?php echo anchor('login/reset_password', ucwords(lang('actions_reset') .' '. lang('labels_password')));?></strong>
							&nbsp; | &nbsp;
						<?php endif; ?>

						<strong><?php echo anchor('main/index', ucfirst(lang('actions_back') .' '. lang('labels_to') .' '. lang('labels_site')));?></strong>
					</div>
					
				</div>

				<footer>
					Powered by <strong><?php echo APP_NAME;?></strong> from <a href="http://www.anodyne-productions.com" target="_blank">Anodyne Productions</a> | 
					<?php echo anchor('main/credits', 'Site Credits');?>
				</footer>
				
			</div>
		</section>
	</body>
</html>