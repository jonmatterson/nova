<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<p><?php echo anchor('sim/missions', $label['missions'], array('class' => 'bold'));?></p>

<?php if (isset($mission_img['src'])): ?>
	<div id="gallery" class="section">
		<?php echo text_output($label['open_gallery'], 'p', 'fontSmall gray bold');?>
		<a href="<?php echo base_url() . $mission_img['src'];?>" class="image" rel="prettyPhoto[gallery]"><?php echo img($mission_img);?></a>
		
		<div class="hidden">
			<?php if (count($image_array) > 0): ?>
				<?php foreach ($image_array as $image): ?>
					<a href="<?php echo base_url() . $image['src'];?>" class="image" rel="prettyPhoto[gallery]"><?php echo img($image);?></a>
				<?php endforeach; ?>
			<?php endif; ?>
		</div>
	</div>
<?php endif; ?>

<ul class="nav nav-tabs">
	<li class="active"><a href="#one" data-toggle="tab"><span><?php echo $label['basicinfo'];?></span></a></li>
	<li><a href="#two" data-toggle="tab"><span><?php echo $label['posts'];?></span></a></li>
	<li><a href="#three" data-toggle="tab"><span><?php echo $label['summary'];?></span></a></li>
</ul>
	
<div class="tab-content">
	<div class="tab-pane active" id="one">
		<?php if (isset($basic)): ?>
			<?php echo text_output($info_header, 'h3', 'page-subhead');?>
				<div class="row-fluid">
					<div class="span2"><strong><?php echo $label['status'];?></strong></div>
					<div class="span10"><?php echo $basic['status'] .' '. $label['mission'];?></div>
				</div>
				<?php echo table_row_spacer(3, 10);?>
				<div class="row-fluid section">
					<div class="span2"><strong><?php echo $label['desc'];?></strong></div>
					<div class="span10"><?php echo $basic['desc'];?></div>
				</div>
				<?php if (is_array($basic['group'])): ?>
					<?php echo table_row_spacer(3, 10);?>
					<div class="row-fluid">
						<div class="span2"><strong><?php echo $label['group'];?></strong></div>
						<div class="span10"><?php echo anchor('sim/missions/group/'. $basic['group']['misgroup_id'], $basic['group']['misgroup_name']);?></div>
					</div>
				<?php endif;?>
				
				<?php echo table_row_spacer(3, 10);?>
				<div class="row-fluid">
					<div class="span2"><strong><?php echo $label['date_start'];?></strong></div>
					<div class="span10"><?php echo $basic['start'];?></div>
				</div>
				
				<?php if (isset($basic['end'])): ?>
					<div class="row-fluid">
						<div class="span2"><strong><?php echo $label['date_end'];?></strong></div>
						<div class="span10"><?php echo $basic['end'];?></div>
					</div>
				<?php endif; ?>
		<?php endif; ?>
	</div>
	
	<div class="tab-pane" id="two">
		<?php if (isset($posts)): ?>
			<?php echo text_output($posts_header, 'h3', 'page-subhead');?>
			<p><?php echo anchor('sim/listposts/mission/'. $mission, $label['view_all_posts'], array('class' => 'bold'));?></p>
			<?php foreach ($posts as $post): ?>
				<div class="row-fluid section">
					<div class="span4">
						<?php echo $post['timeline'];?>
						<br>
					</div>
					<div class="span8">
						<strong>
							<?php echo anchor('sim/viewpost/'. $post['id'], $post['title'], array('class' => 'bold'));?>
						</strong><br>
						<?php echo $label['by'] .' '. $post['authors'];?>
						<br>
						<span class="muted"><?php echo $post['location'];?></span>
					</div>
				</div>
			<?php endforeach; ?>
		<?php else: ?>
			<?php echo text_output($label['noposts'], 'p', 'text-warning');?>
		<?php endif; ?>
	</div>
	
	<div class="tab-pane" id="three">
		<?php if (isset($summary)): ?>
			<?php echo text_output($summary['title'], 'h3', 'page-subhead');?>
			<?php echo text_output($summary['content']);?>
		<?php else: ?>
			<?php echo text_output($label['nosummary'], 'p', 'text-warning');?>
		<?php endif; ?>
	</div>
</div>