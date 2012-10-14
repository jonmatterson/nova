<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php echo text_output($display, 'p', 'muted italics');?>

<?php if (isset($posts)): ?>

		<?php foreach ($posts as $post): ?>
			<div class="row-fluid section">
				<div class="span5">
					<?php echo $post['date'];?>
					<br>
					<em><?php echo anchor('sim/missions/id/'. $post['mission_id'], $post['mission']);?></em>
				</div>
				<div class="span7">
					<strong>
						<?php echo anchor('sim/viewpost/'. $post['id'], $post['title'], array('class' => 'bold'));?>
					</strong><br />
					<span class="muted">
						<?php echo $label['by'] .' '. $post['author'];?><br />
						
					</span>
				</div>
			</div>
		<?php endforeach; ?>
	
	<?php echo $pagination;?>
<?php else: ?>
	<?php echo text_output($label['noposts'], 'h3', 'orange');?>
<?php endif; ?>