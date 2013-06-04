<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<p><?php echo link_to_if($edit_valid, 'characters/coc', $label['edit'], array('class' => 'edit fontSmall bold'));?></p>

<?php if (isset($coc)): ?>
<div id="manifest">
	<?php foreach ($coc as $v): ?>
		<div class="row-fluid position">
			<div class="span3">
				<?php echo img($v['img_rank']);?>
			</div>
			<div class="span6">
				<strong><?php echo $v['name'];?></strong><br />
				<span class="fontSmall"><?php echo $v['position'];?></span>
			</div>
			<div class="span1"><?php echo anchor('personnel/character/'. $v['id'], img($v['img_bio']), array('class' => 'image bold'));?></div>
		</div>
	<?php endforeach; ?>
</div>
<?php else: ?>
	<?php echo text_output($error, 'h3', 'orange');?>
<?php endif; ?>