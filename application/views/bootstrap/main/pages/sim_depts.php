<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php if ($edit_valid_dept === TRUE || $edit_valid_pos === TRUE): ?>
	<p>
	<?php echo link_to_if($edit_valid_dept, 'manage/depts', str_replace(array('[',']'), '', $label['edit_dept']), array('class' => 'btn btn-small btn-primary'));?>
	<?php echo link_to_if($edit_valid_pos, 'manage/positions', str_replace(array('[',']'), '', $label['edit_pos']), array('class' => 'btn btn-small btn-info'));?>
	</p>
<?php endif;?>

<?php if (isset($msg_error)): ?>
	<?php echo $msg_error;?>
<?php else: ?>
		
	<?php foreach ($depts as $value): ?>
		<div class="row-fluid">
			<?php echo text_output($value['name'], 'h4');?>
			<?php echo text_output($value['desc']);?>
			
			<?php if (isset($value['positions'])): ?>
				<div id="<?php echo $value['id'];?>" class="position" style="display:none">
					<?php foreach ($value['positions'] as $pos1): ?>
						<div class="row-fluid">
							<div class="span4"><small><?php echo $pos1['name'];?></small></div>
							<div class="span8"><small><?php echo text_output($pos1['desc'], '');?></small></div>
						</div>
					<?php endforeach; ?>
				</div>
				<p><?php echo anchor('#', $label['toggle'], array('class' => 'btn btn-small toggle-positions'));?></p>
			<?php endif; ?>
			
			<?php if (isset($value['subs'])): ?>
				<div class="row-fluid">
					<div class="span1 hidden-phone"></div>
					<div class="span11">
					<?php foreach ($value['subs'] as $sub): ?>
							<h5><?php echo $sub['name'];?></h5>
							<p><?php echo $sub['desc'];?></p>

							<?php if (isset($sub['positions'])): ?>
								<div id="<?php echo $sub['id'];?>" class="position" style="display:none">
									<?php foreach ($sub['positions'] as $pos2): ?>
										<div class="row-fluid">
											<div class="span4"><small><?php echo $pos2['name'];?></small></div>
											<div class="span8"><small><?php echo text_output($pos1['desc'], '');?></small></div>
										</div>
									<?php endforeach; ?>
								</div>
								<p><?php echo anchor('#', $label['toggle'], array('class' => 'btn btn-small toggle-positions'));?></p>
							<?php endif; ?>

						</li>
					<?php endforeach; ?>
					</div>
				</div>
			<?php endif; ?>
		</li>
	<?php endforeach; ?>
	
<?php endif; ?>

<script>
	$('.toggle-positions').click(function(e){
		$(this).parent().prev('.position').slideToggle();
		if($(this).html() == 'Show Positions')
			$(this).html('Hide Positions');
		else if($(this).html() == 'Hide Positions')
			$(this).html('Show Positions')
		e.preventDefault();
	})
</script>