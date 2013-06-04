<?php

// set up the locations of the icons
$panel = array(
	'inbox'		=> array('src' => APPFOLDER.'/views/default/main/images/panel-mail.png'),
	'writing'	=> array('src' => APPFOLDER.'/views/default/main/images/panel-writing.png'),
	'dashboard'	=> array('src' => APPFOLDER.'/views/default/main/images/panel-dashboard.png'),
);

?>

<div>
	<?php if (Auth::is_logged_in()): ?>
		<div class="section">
			<?php if (Auth::is_logged_in()): ?>
				<?php echo panel_inbox(true, true, false, '(x)', img($panel['inbox']));?> &nbsp;
				<?php echo panel_writing(true, true, false, '(x)', img($panel['writing']));?> &nbsp;
				<a href="#dashboardModal" role="button" data-toggle="modal"><?php echo img($panel['dashboard']); ?></a>
			<?php endif;?>
		</div>
	<?php endif;?>
</div>
		
<?php if (Auth::is_logged_in()): ?>
	<div class="modal hide fade" id="dashboardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span4"><?php echo $panel_1;?></div>
				<div class="span4"><?php echo $panel_2;?></div>
				<div class="span4"><?php echo $panel_3;?></div>
			</div>
		</div>
	</div>
<?php endif;?>
