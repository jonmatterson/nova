<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<p><?php echo link_to_if($edit_valid, 'manage/missions', str_replace(array('[',']'), '', $label['edit']), array('class' => 'btn btn-primary btn-small'));?></p>


<ul class="nav nav-tabs">
	<li class="active"><a href="#one" data-toggle="tab"><span><?php echo $label['s_current'];?></span></a></li>
	<li><a href="#two" data-toggle="tab"><span><?php echo $label['s_upcoming'];?></span></a></li>
	<li><a href="#three" data-toggle="tab"><span><?php echo $label['s_completed'];?></span></a></li>
</ul>

<div class="tab-content">

	<div class="tab-pane active" id="one">
		<?php if (isset($missions['current'])): ?>
			<?php foreach ($missions['current'] as $cur): ?>
				<h3><?php echo anchor('sim/missions/id/'. $cur['id'], $cur['title']);?></h3>
				<strong class="fontSmall gray"><?php echo $label['count'] .' '. $cur['count'];?></strong>
				<?php echo text_output($cur['desc']);?>

				<?php if (is_array($cur['group'])): ?>
					<p class="fontSmall gray italic">
						<?php echo $label['partof'] .' '. anchor('sim/missions/group/'. $cur['group']['misgroup_id'], $cur['group']['misgroup_name']);?>
					</p>
				<?php endif;?>
			<?php endforeach; ?>
		<?php else: ?>
			<?php echo text_output($label['nomissions'], 'p', 'text-warning');?>
		<?php endif; ?>
	</div>

	<div class="tab-pane" id="two">
		<?php if (isset($missions['upcoming'])): ?>
			<?php foreach ($missions['upcoming'] as $upc): ?>
				<h3><?php echo anchor('sim/missions/id/'. $upc['id'], $upc['title']);?></h3>
				<strong class="fontSmall gray"><?php echo $label['count'] .' '. $upc['count'];?></strong>
				<?php echo text_output($upc['desc']);?>

				<?php if (is_array($upc['group'])): ?>
					<p class="fontSmall gray italic">
						<?php echo $label['partof'] .' '. anchor('sim/missions/group/'. $upc['group']['misgroup_id'], $upc['group']['misgroup_name']);?>
					</p>
				<?php endif;?>
			<?php endforeach; ?>
		<?php else: ?>
			<?php echo text_output($label['nomissions'], 'p', 'text-warning');?>
		<?php endif; ?>
	</div>

	<div class="tab-pane" id="three">
		<?php if (isset($missions['completed'])): ?>
			<?php foreach ($missions['completed'] as $com): ?>
				<h3><?php echo anchor('sim/missions/id/'. $com['id'], $com['title']);?></h3>
				<strong class="fontSmall gray"><?php echo $label['count'] .' '. $com['count'];?></strong>
				<?php echo text_output($com['desc']);?>

				<?php if (is_array($com['group'])): ?>
					<p class="fontSmall gray italic">
						<?php echo $label['partof'] .' '. anchor('sim/missions/group/'. $com['group']['misgroup_id'], $com['group']['misgroup_name']);?>
					</p>
				<?php endif;?>
			<?php endforeach; ?>
		<?php else: ?>
			<?php echo text_output($label['nomissions'], 'p', 'text-warning');?>
		<?php endif; ?>
	</div>
	
</div>