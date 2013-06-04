<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<ul class="nav nav-tabs">
	<li><?php echo anchor('wiki/recent/updates', $label['updates']);?></li>
	<li><?php echo anchor('wiki/recent/created', $label['created']);?></li>
</ul>

<?php if (isset($recent['updates'])): ?>
		<?php foreach ($recent['updates'] as $r): ?>
			<div class="row-fluid section">
				<div class="span6">
					<p>
					<?php if ($r['type'] == 'system'): ?>
						<?php echo text_output($label['system'], 'span', 'label-system muted italics');?><br>
					<?php endif;?>
						<strong>
						<?php if ($r['type'] == 'system'): ?>
							<?php echo $r['title'];?>
						<?php else: ?>
							<?php echo anchor('wiki/view/page/'. $r['id'], $r['title']);?>
						<?php endif;?>
						</strong>
						<br>
						<span class="muted italics">
							<?php echo $label['by'] .' '. $r['author'] .' '. $r['timespan'] .' '. $label['ago'];?>
						</span>
					</p>
				</div>
				<div class="span6 muted">
					<?php if (!empty($r['comments'])): ?>
						<em><?php echo text_output($r['comments'], '');?></em>
					<?php endif;?>
				</div>
			</div>
		<?php endforeach;?>
	<p><?php echo anchor('feed/wiki/updated', img($images['feed']), array('class' => 'image'));?></p>
<?php endif;?>

<?php if (isset($recent['created'])): ?>
		<?php foreach ($recent['created'] as $r): ?>
			<div class="row-fluid section">
				<div class="span6">
					<p>
					<?php if ($r['type'] == 'system'): ?>
						<?php echo text_output($label['system'], 'span', 'label-system muted italics');?>
						<br>
					<?php endif;?>
					<strong>
						<?php if ($r['type'] == 'system'): ?>
							<?php echo $r['title'];?>
						<?php else: ?>
							<?php echo anchor('wiki/view/page/'. $r['id'], $r['title']);?>
						<?php endif;?>
					</strong>
					
					<?php if ($r['type'] == 'standard'): ?>
						<br />
						<span class="fontSmall gray">
							<?php echo $label['by'] .' '. $r['author'] .' '. $r['timespan'] .' '. $label['ago'];?>
						</span>
					<?php endif;?>
					</p>
				</div>
				<div class="span6 muted">
					<?php if (!empty($r['summary'])): ?>
						<em><?php echo text_output($r['summary'], '');?></em>
					<?php endif;?>
				</div>
			</div>
		<?php endforeach;?>
	<p><?php echo anchor('feed/wiki/created', img($images['feed']), array('class' => 'image'));?></p>
<?php endif;?>