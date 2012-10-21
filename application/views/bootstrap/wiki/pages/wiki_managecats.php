<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<p class="bold">
	<a href="#" class="addtoggle image"><?php echo img($images['add']) .' '. $label['add'];?></a>
</p>

<?php echo form_open('wiki/managecategories/add', 'class="form-horizontal hidden addform"');?>
	
	<div class="control-group">
		<div class="control-label">
			<label><?php echo $label['name'];?></label>
		</div>
		<div class="controls">
			<?php echo form_input($inputs['name']);?>
		</div>
	</div>

	<div class="control-group">
		<div class="control-label">
			<label><?php echo $label['desc'];?></label>
		</div>
		<div class="controls">
			<?php echo form_textarea($inputs['desc'], '', 'class="span10"');?>
		</div>
	</div>

	<div class="control-group">
		<div class="controls">
			<?php 
			$buttons['add']['class'] = 'btn btn-success';
			echo form_button($buttons['add']);
			?>
		</div>
	</div>
<?php echo form_close();?>

<script type="text/javascript">
$('.addtoggle').click(function(){
	$(this).parent('p').remove()
	$('.addform').removeClass('hidden')
})
</script>

<?php if (isset($categories)): ?>
	<hr size="1" />
	
	<?php foreach ($categories as $c): ?>
		<div class="row-fluid section">
			<div class="span3"><?php echo text_output($c['name'], 'strong');?></div>
			<div class="span8">
				<?php 
				if(strlen(trim($c['desc'])) > 0)
					echo $c['desc'];
				else
					echo '<em class="muted">No description provided</em>';
				?>
			</div>
			<div class="span1">
				<a href="#" rel="facebox" myAction="delete" myID="<?php echo $c['id'];?>" class="image"><?php echo img($images['delete']);?></a>
				&nbsp;
				<a href="#" rel="facebox" myAction="edit" myID="<?php echo $c['id'];?>" class="image"><?php echo img($images['edit']);?></a>
			</div>
		</div>
	<?php endforeach;?>

<?php else: ?>
	<?php echo text_output($label['nocats'], 'p', 'italics text-warning');?>
<?php endif;?>