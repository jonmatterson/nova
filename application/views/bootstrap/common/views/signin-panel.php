<div>
	<?php if ( ! Auth::is_logged_in()): ?>
		<div>
			<?php echo form_open('login/check_login');?>
			<table>
				<tbody>
					<tr>
						<td>
							<?php echo ucwords(lang('labels_email_address'));?><br>
							<input type="text" name="email" class="signin-panel-input">
						</td>
						<td>
							<?php echo ucfirst(lang('labels_password'));?><br>
							<input type="password" name="password" class="signin-panel-input">
						</td>
						<td class="align_bottom"><?php echo form_button($button_login);?></td>
					</tr>
					<tr>
						<td>
							<input id="remember" type="checkbox" name="remember" value="yes">
							<label for="remember"><?php echo ucfirst(lang('actions_remember').' '.lang('labels_me'));?></label>
						</td>
						<td><?php echo anchor('login/reset_password', lang('login_forgot'));?></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<?php echo form_close();?>
		</div>
	<?php else: ?>
		<a href="<?php echo site_url('login/logout');?>">
			<?php echo ucfirst(lang('actions_logout'));?>
		</a>
		<div>
			<?php if (Auth::is_logged_in()): ?>
				<?php echo panel_inbox(true, true, false, '(x)', img($panel['inbox']));?> &nbsp;
				<?php echo panel_writing(true, true, false, '(x)', img($panel['writing']));?> &nbsp;
				<?php echo panel_dashboard(false, img($panel['dashboard']));?>
			<?php endif;?>
		</div>
	<?php endif;?>
</div>