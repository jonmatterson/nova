<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php echo form_open('login/check_login', 'class="form-horizontal"');?>


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
		<div class="controls">
			<label class="checkbox" for="remember">
				<?php echo form_checkbox($inputs['remember_me']);?>
				<?php echo $label['remember'];?>
			</label>
			<span class="help-block"><?php echo anchor('login/reset_password', lang('login_forgot'));?></span>
		</div>
	</div>
	
	<div class="form-actions">
		<?php echo form_hidden('submit', 'y');?>
		<?php 
		$button_login['class'] = 'btn btn-success btn-submit';
		echo form_button($button_login);
		?>
	</div>
	
<?php echo form_close();?>