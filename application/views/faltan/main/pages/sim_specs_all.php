<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php if ($edit_valid === TRUE || $edit_valid_form === TRUE): ?>
	<p>
		<?php echo link_to_if($edit_valid, 'manage/specs', $label['edit'], array('class' => 'edit fontSmall bold'));?>
		<?php echo link_to_if($edit_valid_form, 'site/specsform', $label['edit_form'], array('class' => 'edit fontSmall bold'));?>
	</p>
<?php endif;?>

<?php if (isset($items)): ?>
    <?php foreach ($items as $item): ?>
    <h3><?php echo anchor('sim/specs/'. $item['id'], $item['name'], array('class' => 'bold'));?></h3>
    <?php echo text_output($item['summary'].' '.anchor('sim/specs/'. $item['id'], 'Continue reading...', array('class' => 'bold')), '');?>
    <?php endforeach; ?>

<?php else: ?>
	<?php echo text_output($label['nospecs_all'], 'h3', 'orange');?>
<?php endif; ?>