<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<style type="text/css">
	a.image { display: inline-block; }
	a.image span { padding: 0px; display: inline-block; }
	a.image span img { margin: 0px; padding: 0px; }
</style>

<?php echo text_output($header, 'h1', 'page-head');?>

<?php if ($count > 1): ?>
	<p><?php echo anchor('sim/specs', $label['back'], array('class' => 'bold'));?></p>
<?php endif;?>

<?php echo text_output($label['summary'], 'h2', 'page-subhead');?>
<?php echo text_output($summary);?><br />

<?php if (isset($images['main_img'])): ?>
	<div id="gallery">
		<?php echo text_output($label['opengallery'], 'p', 'muted italics');?>
		<a href="<?php echo base_url() . $images['main_img']['src'];?>" class="image" rel="prettyPhoto[gallery]"><?php echo img($images['main_img']);?></a>
		
		<div class="hidden">
			<?php if (count($images['image_array']) > 0): ?>
				<?php foreach ($images['image_array'] as $image): ?>
					<a href="<?php echo base_url() . $image['src'];?>" class="image" rel="prettyPhoto[gallery]"><?php echo img($image);?></a>
				<?php endforeach; ?>
			<?php endif; ?>
		</div><br />
	</div>
<?php endif; ?>

<?php if (isset($sections)): ?>
	<?php foreach ($sections as $section): ?>
		<?php echo text_output($section['title'], 'h3', 'page-subhead');?>
		
		<?php if (isset($section['fields'])): ?>
			<?php foreach ($section['fields'] as $field): ?>
				<div class="row-fluid">
					<div class="span3"><strong><?php echo $field['field'];?></strong></div>
					<div class="span9"><?php echo text_output($field['data'], '');?></div>
				</div>
			<?php endforeach; ?>
		<?php else: ?>
			<?php echo text_output($label['nospecs_all'], 'h4', 'orange');?>
		<?php endif; ?>
	<?php endforeach; ?>
<?php else: ?>
	<?php echo text_output($label['nospecs_all'], 'h3', 'orange');?>
<?php endif; ?>