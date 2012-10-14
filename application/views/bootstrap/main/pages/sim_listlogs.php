<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php echo text_output($display, 'p', 'muted italics');?>

<?php if (isset($logs)): ?>

		<?php foreach ($logs as $log): ?>
			<div class="row-fluid">
				<div class="span5"><?php echo $log['date'];?></div>
				<div class="span7">
					<strong>
						<?php echo anchor('sim/viewlog/'. $log['id'], $log['title'], array('class' => 'bold'));?>
					</strong><br />
					<span class="muted"><?php echo $log['author'];?></span>
				</div>
			</div>
		<?php endforeach; ?>
		</tbody>
	</table>
	
	<?php echo $pagination;?>
<?php else: ?>
	<?php echo text_output($label['nologs'], 'h3', 'orange');?>
<?php endif; ?>