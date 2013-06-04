<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<style type="text/css">
	.error-icon {
		margin-left: 1px;
		padding-left: 22px;
		background: transparent url('<?php echo base_url().APPFOLDER;?>/assets/images/exclamation-red.png') no-repeat left center;
	}
</style>
<?php echo text_output($header, 'h1', 'page-head');?>

<?php if ($this->options['system_email'] == 'on'): ?>
	<?php echo text_output($msg);?>
	
	<?php echo form_open('main/contact', 'class="form-horizontal"');?>
		<div class="control-group <?php if(form_error('name')) echo 'error'; ?>">
			<label class="control-label" for="iName"><?php echo $label['name'];?></label>
			<div class="controls">
				<?php
				$inputs['name']['id'] = 'iName';
				$inputs['name']['placeholder'] = 'Name';
				echo form_input($inputs['name']);
				if(form_error('name'))
					echo '<span class="help-block">'.strip_tags(form_error('name')).'</span>';
				?>
			</div>
		</div>
		<div class="control-group <?php if(form_error('email')) echo 'error'; ?>">
			<label class="control-label" for="iEmail"><?php echo $label['email'];?></label>
			<div class="controls">
				<?php
				$inputs['email']['id'] = 'iEmail';
				$inputs['email']['placeholder'] = 'Email Address';
				echo form_input($inputs['email']);
				if(form_error('email'))
					echo '<span class="help-block">'.strip_tags(form_error('email')).'</span>';
				?>
			</div>
		</div>
		<div class="control-group <?php if(form_error('subject')) echo 'error'; ?>">
			<label class="control-label" for="iSubject"><?php echo $label['subject'];?></label>
			<div class="controls">
				<?php
				$inputs['subject']['id'] = 'iSubject';
				$inputs['subject']['class'] = 'span12';
				$inputs['subject']['placeholder'] = 'Message Subject';
				echo form_input($inputs['subject']);
				if(form_error('subject'))
					echo '<span class="help-block">'.strip_tags(form_error('subject')).'</span>';
				?>
			</div>
		</div>
		<div class="control-group <?php if(form_error('message')) echo 'error'; ?>">
			<label class="control-label" for="iMessage"><?php echo $label['message'];?></label>
			<div class="controls">
				<?php 
				$inputs['message']['id'] = 'iMessage';
				$inputs['message']['class'] = 'span12';
				$inputs['message']['placeholder'] = 'Message Contents...';
				echo form_textarea($inputs['message']);
				if(form_error('message'))
					echo '<span class="help-block">'.strip_tags(form_error('message')).'</span>';
				?>
			</div>
		</div>
		
		<div class="form-actions">
			<?php 
			$button['submit']['class'] .= ' btn btn-success btn-large';
			echo form_button($button['submit']);
			?>
		</div>
</div>
		</p>
	<?php echo form_close();?>
<?php else: ?>
	<?php echo text_output($label['nosubmit'], 'h4', 'orange');?>
<?php endif;?>