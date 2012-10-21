<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php echo text_output($msg);?><br />

<?php echo form_open('main/join', 'class="form-horizontal" id="joinForm"');?>

	<ul class="nav nav-tabs" id="bioTabs">
		<li class="active"><a href="#user_info" data-toggle="tab"><?php echo $label['user_info'];?></a></li>
		<li><a href="#character" data-toggle="tab"><?php echo $label['character'];?></a></li>
		<li><a href="#character_info" data-toggle="tab"><?php echo $label['character_info'];?></a></li>
		<?php if ($this->options['use_sample_post'] == 'y'): ?>
			<li><a href="#sample_post" data-toggle="tab"><?php echo $label['samplepost'];?></a></li>
		<?php endif;?>
	</ul>

	<div class="tab-content">

		<div class="tab-pane active" id="user_info">
			<?php echo text_output($label['user_info'], 'h3', 'page-subhead');?>
			<div class="indent-left">
				<div class="control-group">
					<label class="control-label"><?php echo $label['name'];?></label>
					<div class="controls">
					<?php echo form_input($inputs['name']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['email'];?></label>
					<div class="controls">
					<?php echo form_input($inputs['email']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['password'];?></label>
					<div class="controls">
					<?php echo form_password($inputs['password']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['dob'];?></label>
					<div class="controls">
					<?php echo form_input($inputs['dob']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['im'];?></label>
					<div class="controls">
					<?php echo text_output($label['im_inst'], 'span', 'fontSmall gray');?><br />
					<?php echo form_textarea($inputs['im']);?>
					</div>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="character">
			<?php echo text_output($label['character'], 'h3', 'page-subhead');?>

			<div class="indent-left">
				<div class="control-group">
					<label class="control-label"><?php echo $label['fname'];?></label>
					<div class="controls">
					<?php echo form_input($inputs['first_name']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['mname'];?></label>
					<div class="controls">
					<?php echo form_input($inputs['middle_name']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['lname'];?></label>
					<div class="controls">
					<?php echo form_input($inputs['last_name']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['suffix'];?></label>
					<div class="controls">
					<?php echo form_input($inputs['suffix']);?>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"><?php echo $label['position'];?></label>
					<div class="controls">
					<?php echo form_dropdown_position('position_1', $selected_position, 'id="position"', 'open');?>
					&nbsp; <span id="loading_update" class="hidden fontSmall gray"><?php echo img($loading);?></span>
					<p id="position_desc" class="fontSmall gray"><?php echo text_output($pos_desc, '');?></p>
					</div>
				</div>
			</div>
		</div>

		<div class="tab-pane" id="character_info">
			<?php if (isset($join)): ?>
				<?php foreach ($join as $a): ?>
					<?php if (isset($a['fields'])): ?>
						<?php echo text_output($a['name'], 'h3', 'page-subhead');?>

						<div class="indent-left">
							<?php foreach ($a['fields'] as $f): ?>
								<div class="control-group">
									<label class="control-label"><?php echo $f['field_label'];?></label>
									<div class="controls">
									<?php 
									echo $f['input'];
									?>
									</div>
								</div>
							<?php endforeach; ?>
						</div>
					<?php endif; ?>
				<?php endforeach; ?>
			<?php endif; ?>
		</div>

		<?php if ($this->options['use_sample_post'] == 'y'): ?>
			<div class="tab-pane" id="sample_post">
				<?php echo text_output($label['samplepost'], 'h3', 'page-subhead');?>

				<div class="indent-left">
					<?php echo text_output($sample_post_msg, 'p', 'bold gray');?>
					<?php echo form_textarea($inputs['sample_post']);?>
				</div>
			</div>
		<?php endif; ?>
	</div>
	
	<div class="form-actions">
		<?php echo form_hidden('submit', 'y');?>
		<?php 
		$button['submit']['class'] = 'btn btn-success btn-submit';
		echo form_button($button['submit']);
		?>
		&nbsp;
		<?php 
		$button['next']['class'] = 'btn btn-inverse btn-next-step';
		echo form_button($button['next']);
		?>
	</div>
<?php echo form_close();?>

<script>
$('.btn-next-step').click(function(){
	var $next = $('#bioTabs li.active').next();
	if($next.length > 0)
		$next.find('a').click();
	else
		$('.btn-submit').click();
})
</script>