<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php echo text_output($message, 'p');?><br />

<?php echo form_open('login/reset_password', 'class="form-horizontal"');?>

	<div class="control-group">
		<label class="control-label"><?php echo $label['email'];?></label>
		<div class="controls">
		<?php echo form_input($inputs['email']);?>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label"><?php echo $label['question'];?></label>
		<div class="controls">
			<?php echo form_dropdown('question', $questions);?>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label"><?php echo $label['answer'];?></label>
		<div class="controls">
			<?php echo form_input($inputs['answer']);?>
		</div>
	</div>
	
	<div class="form-actions">
		<?php echo form_hidden('submit', 'y');?>
		<?php 
		$button_submit['class'] = 'btn btn-success btn-submit';
		echo form_button($button_submit);
		?>
	</div>
	
<?php echo form_close();?>