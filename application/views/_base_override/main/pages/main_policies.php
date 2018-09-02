<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php if($policy): ?>

<div class="fontSmall line_height_18" style="margin-bottom: 12px;">
	<strong>Policies - </strong>
	<?php $i = 1; ?>
	<?php foreach ($policies as $key => $value) : ?>
		<?php if($key == $policy): echo '<strong>'; endif; ?>
		<?php echo anchor('main/policies/' . $key, $value); ?>
		<?php if($key == $policy): echo '</strong>'; endif; ?>
		<?php if ($i < count($policies)) : ?>
			&middot;
		<?php endif; ?>
		<?php ++$i; ?>
	<?php endforeach; ?>
</div>

<?php endif; ?>

<?php echo text_output($header, 'h1', 'page-head'); ?>

<?php echo text_output($message); ?>
