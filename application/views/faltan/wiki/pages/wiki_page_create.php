<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<p class="bold"><?php echo anchor('wiki/managepages', $label['back']);?></p>

<?php echo form_open('wiki/page/0/create', 'class="form-horizontal"');?>


	<div class="control-group">
		<label class="control-label"><?php echo $label['title'];?></label>
		<div class="controls">
		<?php echo form_input($inputs['title']);?>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label"><?php echo $label['summary'];?></label>
		<div class="controls">
		<?php
		$inputs['summary']['class'] = 'span12';
		echo form_textarea($inputs['summary']);
		?>
		</div>
	</div>

	<div class="control-group">
		<div class="controls">
		<?php 
		$inputs['content']['class'] = 'span12';
		echo form_textarea($inputs['content']);
		?>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label"><?php echo text_output($label['categories']);?></label>
		<div class="controls">
			<div id="category-panel">
				<?php if (Auth::check_access('wiki/categories')): ?>
					<div class="category-panel-header">
						<input type="text" id="category-panel-name" placeholder="<?php echo $label['addcategory'];?>" value="" />
						<button id="category-panel-create"><span></span></button>
					</div>
				<?php endif;?>

				<div class="category-panel-content">
					<div id="category-panel-content-tags">
						<?php if (isset($cats)): ?>
							<?php foreach ($cats as $c): ?>
								<?php $catclass = (is_array($inputs['categories']) and in_array($c['id'], $inputs['categories'])) ? ' tag-active' : '';?>
								<nobr><span class="tag<?php echo $catclass;?>" id="<?php echo $c['id'];?>"><?php echo $c['name'];?></span></nobr>
							<?php endforeach;?>
							<input type="hidden" name="categories" value=",<?php echo $inputs['category_string'];?>," />
						<?php endif;?>
					</div>

					<div id="category-panel-content-message">
						<?php if ( ! isset($cats)): ?>
							<h3><?php echo $label['pleaseadd'];?></h3>
							<h4><?php echo $label['pleaseadd_supp'];?></h4>
						<?php endif;?>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="control-group">
		<label class="control-label"><?php echo $label['comments'];?></label>
		<div class="controls">
			<label class="radio" for="comments_open">
				<?php echo form_radio($inputs['comments_open']);?>
				<?php echo $label['open'];?>
			</label>
		</div>
		<div class="controls">
			<label class="radio" for="comments_closed">
				<?php echo form_radio($inputs['comments_closed']);?>
				<?php echo $label['closed'];?>
			</label>
		</div>
	</div>

	<div class="form-actions">
		<?php 
		$buttons['add']['class'] = 'btn btn-success btn-submit';
		echo form_button($buttons['add']);
		?>
	</div>

<?php echo form_close();?>