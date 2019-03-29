<?php

$KHONSU__TEMPLATE_CONTEXT = 'admin';

$sec = 'admin';
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

// load the panel helper
$this->load->helper('panel');

// set up the locations of the icons
$panel = array(
	'inbox'		=> array('src' => APPFOLDER.'/views/'.$current_skin.'/'.$sec.'/images/panel-mail.png'),
	'writing'	=> array('src' => APPFOLDER.'/views/'.$current_skin.'/'.$sec.'/images/panel-writing.png'),
	'dashboard'	=> array('src' => APPFOLDER.'/views/'.$current_skin.'/'.$sec.'/images/panel-dashboard.png'),
);

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
		<?php include(dirname(__FILE__).'/_template_head.php'); ?>
	</head>
	<body>
		<noscript>
			<div class="system_warning"><?php echo lang_output('text_javascript_off', '');?></div>
		</noscript>

		<?php if (Auth::is_logged_in()): ?>
			<div id="panel" class="hidden">
				<div class="panel-body">
					<table class="table100">
						<tbody>
							<tr>
								<td class="panel_1 align_top"><?php echo $panel_1;?></td>
								<td class="panel_spacer"></td>
								<td class="panel_2 align_top"><?php echo $panel_2;?></td>
								<td class="panel_spacer"></td>
								<td class="panel_3 align_top"><?php echo $panel_3;?></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		<?php endif;?>
		
		<?php include(dirname(__FILE__).'/_template_header.php'); ?>

		<div class="wrapper">
			<div id="body">
				<div class="nav-sub">
					<?php echo $nav_sub;?>
				</div>

				<div class="content">
					<?php echo $flash_message;?>
					<?php echo $content;?>
					<?php echo $ajax;?>

					<div style="clear:both;"></div>
				</div>

				<?php include(dirname(__FILE__).'/_template_footer.php'); ?>
				
			</div>
		</div>
	</body>
</html>
