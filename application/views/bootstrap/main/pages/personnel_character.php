<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>


<?php if (isset($character)): ?>
<?php echo text_output($header, 'h3', 'page-head');?>
		
<ul class="nav nav-pills">
	<?php if ($postcount > 0): ?>
		<li><?php echo anchor('personnel/viewposts/c/'.$character['id'], $label['view_all_posts']);?></li>
	<?php endif;?>

	<?php if ($logcount > 0): ?>
		<li><?php echo anchor('personnel/viewlogs/c/'.$character['id'], $label['view_all_logs']);?></li>
	<?php endif;?>

	<?php if ($awardcount > 0): ?>
		<li><?php echo anchor('personnel/viewawards/c/'.$character['id'], $label['view_all_awards']);?></li>
	<?php endif;?>

	<?php if (Auth::is_logged_in() and $character['user'] !== null): ?>
		<li><?php echo anchor('personnel/user/'.$character['user'], $label['view_user']);?></li>
	<?php endif;?>

	<?php if ($edit_valid): ?>
		<li><?php echo anchor('characters/bio/'.$character['id'], $label['edit']);?></li>
	<?php endif;?>
</ul>

<div class="row-fluid">
	
	<div class="span4">
		
		<?php if (isset($character['image']['src'])): ?>
			<ul class="gallery unstyled">
				<li><a href="<?php echo $character['image']['src'];?>" class="image" rel="prettyPhoto[gallery]"><?php echo img($character['image']);?></a></li>

				<?php if (count($character['image_array']) > 0): ?>
					<?php foreach ($character['image_array'] as $image): ?>
						<li class="hidden"><a href="<?php echo $image['src'];?>" class="image" rel="prettyPhoto[gallery]"><?php echo img($image);?></a></li>
					<?php endforeach; ?>
				<?php endif; ?>
			</ul>
		<?php else: ?>
			<div id="gallery">
				<p><?php echo img($character['noavatar']);?></p>
			</div>
		<?php endif;?>
		
	</div>
	
	<div class="span8">
		
		<?php if (isset($msg_error)): ?>
			<?php echo text_output($msg_error, 'h3', 'red');?>
		<?php endif; ?>

		<?php if (isset($character_info)): ?>
			<?php foreach ($character_info as $a): ?>
				<?php if ( ! empty($a['value'])): ?>
					<h4><?php echo $a['label'];?></h4>
					<p><?php echo $a['value'];?></p>
				<?php endif; ?>
			<?php endforeach; ?>
		<?php endif;?>
					
	</div>
	
</div>

<div class="row-fluid">
	<div class="span12">
		<?php if (isset($tabs)): ?>
			<ul class="nav nav-tabs" id="bioTabs">
				<?php 
				$first = true;
				foreach ($tabs as $value): 
					if($first)
					{
						echo '<li class="active">';
						$first = false;
					}
					else
					{
						echo '<li>';
					}
				?>
					<a id="target-<?php echo $value['link'];?>"><?php echo $value['name'];?></a></li>
				<?php endforeach; ?>
			</ul>
			<?php foreach ($tabs as $id): ?>
				<div id="<?php echo $id['link'];?>" class="bioTab">
					<?php if (isset($sections)): ?>
						<?php foreach ($sections[$id['id']] as $a): ?>
							<h3><?php echo $a['name'];?></h3>

							<?php if (isset($fields[$a['id']])): ?>

								<?php foreach ($fields[$a['id']] as $b): ?>
									<?php if(strlen(trim($b['value'])) == 0): continue; ?>
									<?php elseif(strpos($b['value'], PHP_EOL) === false): ?>
										<div class="row-fluid">
											<div class="span3"><strong><?php echo $b['label'];?></strong></div>
											<div class="span9"><?php echo text_output($b['value'], '');?></div>
										</div>
									<?php else: ?>
										<p><strong><?php echo $b['label'];?></strong></p>
										<?php echo text_output($b['value'], '');?>
									<?php endif; ?>
								<?php endforeach; ?>

							<?php endif; ?>
						<?php endforeach; ?>
					<?php endif; ?>
				</div>
			<?php endforeach; ?>
		<script>
		$('#bioTabs a').click(function(){
			var $li = $(this).closest('li');
			$li.addClass('active');
			$li.siblings().removeClass('active');
			$('.bioTab').hide();
			$('#'+$(this).attr('id').split('-')[1]).show();
		})
		$('#bioTabs a').first().click();
		</script>
		
		<?php else: ?>
				<?php if (isset($sections)): ?>
					<?php foreach ($sections as $a): ?>
						<h3><?php echo $a['name'];?></h3>
						
						<?php if (isset($fields[$a['id']])): ?>
								
							<?php foreach ($fields[$a['id']] as $b): ?>
								<div class="row-fluid">
									<div class="span3"><?php echo $b['label'];?></div>
									<div class="span9"><?php echo $b['value'];?></div>
								</div>
							<?php endforeach; ?>
							
						<?php endif; ?>
					<?php endforeach; ?>
				<?php endif; ?>
			<?php endif; ?>
		</div>
	</div>
</div>

<?php else: ?>	
<div class="row-fluid">
	<div class="span12">
		<?php echo text_output($header, 'h1', 'red');?>
		<?php echo text_output($msg_error);?>
	</div>
</div>
<?php endif;?>