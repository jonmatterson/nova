<?php

include_once(dirname(__FILE__).'/global.php');

// load the panel helper
$this->load->helper('panel');

$button_login = array(
	'class' => 'button-signin',
	'value' => 'submit',
	'type' => 'submit',
	'name' => 'submit',
	'content' => ucwords(lang('actions_login'))
);

?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><?php echo $title;?></title>
		
		<meta name="description" content="<?php echo $this->config->item('meta_desc');?>" />
		<meta name="keywords" content="<?php echo $this->config->item('meta_keywords');?>" />
		<meta name="author" content="<?php echo $this->config->item('meta_author');?>" />
		
		<?php echo $_redirect;?>
		
		<link rel="stylesheet" href="<?php echo Theme_URL::css('bootstrap.css'); ?>">
		<link rel="stylesheet" href="<?php echo Theme_URL::css('bootstrap-responsive.css'); ?>">
		<link rel="stylesheet" href="<?php echo Theme_URL::css('template.css'); ?>">
		<link rel="stylesheet" href="<?php echo Theme_URL::css('styles.css', 'wiki'); ?>">
		
		<!--[if lt IE 9]>
		<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		
		<?php include_once($this->config->item('include_head_main'));?>
		
		<script type="text/javascript" src="<?php echo Theme_URL::js('jquery.blockUI.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-dropdown.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-collapse.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-transition.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-tab.js'); ?>"></script>
		<script type="text/javascript" src="<?php echo Theme_URL::js('bootstrap-modal.js'); ?>"></script>
		
		<?php echo $javascript;?>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('body').click(function(event){
					if (! $(event.target).closest('div').hasClass('signin-panel'))
					{
						$.unblockUI();
					}
				});
				
				$('a#userpanel').unbind('click').click(function(){
					$.blockUI({
						message: $('#panel'),
						css: { 
							border: '0', 
							cursor: 'cursor',
							background: 'transparent',
							width: '800px',
							top: '10%',
							left: '50%',
							margin: '0 0 0 -400px'
						}
					});
					
					return false;
				});
			});
			
			// if the escape key is pressed, close the menu
			$(document).keyup(function(event){
				if (event.keyCode == 27) {
					$.unblockUI();
				}
			});
		</script>
		
	</head>
	
	<body>
		
		<noscript>
			<div class="system_warning"><?php echo lang_output('text_javascript_off', '');?></div>
		</noscript>
		
		<?php if (Auth::is_logged_in()): ?>
			<div class="modal hide fade" id="dashboardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Dashboard</h3>
				</div>
				<div class="modal-body">
					<div class="row-fluid">
						<div class="span4"><?php echo $panel_1;?></div>
						<div class="span4"><?php echo $panel_2;?></div>
						<div class="span4"><?php echo $panel_3;?></div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">Close</a>
				</div>
			</div>
		<?php endif;?>
		
		<header>
			
			<nav>
				<?php echo Theme_Transformer::nav_bar($nav_main);?>
			</nav>
			
		</header>
		
		<div class="container-fluid">
			
			<div class="row-fluid">
			
				<nav class="span3">
					<?php Theme_Includer::view('signin-panel'); ?>
					<?php echo Theme_Transformer::nav_sub($nav_sub);?>
					<?php if ( ! Auth::is_logged_in()): ?>
					<div class="well">
						<?php echo form_open('login/check_login');?>

							<label class="control-label"><?php echo ucwords(lang('labels_email_address'));?></label>
							<input type="text" name="email" class="span12">
							<label class="control-label"><?php echo ucfirst(lang('labels_password'));?></label>
							<input type="password" name="password" class="span12">
							<div>
							<label class="checkbox"><input id="remember" type="checkbox" name="remember" value="yes"><?php echo ucfirst(lang('actions_remember').' '.lang('labels_me'));?></label>
							</div>
							<input type="submit" class="btn btn-success section">
							<span class="help-block"><?php echo anchor('login/reset_password', lang('login_forgot'));?></span>

						<?php echo form_close();?>
					</div>
				<?php endif;?>
				</nav>

				<div class="span9">
					<?php echo $flash_message;?>
					<?php echo $content;?>
					<?php echo $ajax;?>

					<div style="clear:both;"></div>
				</div>
				
			</div>

			<footer>
				Powered by <strong><?php echo APP_NAME;?></strong> from <a href="http://www.anodyne-productions.com" target="_blank">Anodyne Productions</a> | <?php echo anchor('main/credits', 'Site Credits');?>
			</footer>
			
		</div>
		
	</body>
</html>