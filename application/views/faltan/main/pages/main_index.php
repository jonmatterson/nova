<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div class="index-slideshow-welcome">
	<?php echo map2url($slideshow_welcome);?>
</div>

<?php echo text_output($header, 'h1', 'page-head');?>

<div class="index-msg-welcome">
	<?php echo map2url($msg_welcome);?>
</div>

<?php if(count($lists) > 1): ?>

	<ul class="nav nav-tabs" id="messageTabs">
		<?php if (isset($lists['news'])): ?>
			<li class="active"><a href="#news" data-toggle="tab">News</a></li>
		<?php endif;?>
		<?php if (isset($lists['posts'])): ?>
			<li <?php if(!isset($lists['news'])) echo 'class="active"'; ?>><a href="#posts" data-toggle="tab">Mission Posts</a></li>
		<?php endif;?>
		<?php if (isset($lists['logs'])): ?>
			<li><a href="#logs" data-toggle="tab">Personal Logs</a></li>
		<?php endif; ?>
	</ul>

	<div class="tab-content">
		
		<?php if (isset($lists['news'])): ?>
		<div class="tab-pane active" id="news">
			<?php echo text_output($label['news'], 'h2', 'page-subhead');?>

			<?php foreach ($lists['news'] as $value): ?>
				<h4><?php echo anchor('main/viewnews/' . $value['id'], RARROW .' '. $value['title']);?></h4>

				<p class="gray fontSmall">
					<?php echo $label['posted'] .' '. $value['date'];?>
					<?php echo $label['by'] .' '. $value['author'];?>
					<?php echo $label['in'] .' '. $value['category'];?></p>

				<?php echo text_output($value['content'], 'p');?><br />
			<?php endforeach; ?>
		</div>
		<?php endif;?>
		
		<?php if (isset($lists['posts'])): ?>
		<div class="tab-pane <?php if(!isset($lists['news'])) echo 'active'; ?>" id="posts">
			<?php echo text_output($label['posts'], 'h2', 'page-subhead');?>

			<?php foreach ($lists['posts'] as $value): ?>
				<h4><?php echo anchor('sim/viewpost/' . $value['id'], RARROW .' '. $value['title']);?></h4>

				<p class="gray fontSmall">
					<strong><?php echo $label['mission'].':</strong> '.$value['mission'];?><br />
					<?php echo $label['posted'] .' '. $value['date'];?>
					<?php echo $label['by'] .' '. $value['authors'];?></p>

				<?php echo text_output($value['content'], 'p');?><br />
			<?php endforeach; ?>
		</div>
		<?php endif;?>
		
		<?php if (isset($lists['logs'])): ?>
		<div class="tab-pane" id="logs">
			<?php echo text_output($label['logs'], 'h2', 'page-subhead');?>

			<?php foreach ($lists['logs'] as $value): ?>
				<h4><?php echo anchor('sim/viewlog/' . $value['id'], RARROW .' '. $value['title']);?></h4>

				<p class="gray fontSmall">
					<?php echo $label['posted'] .' '. $value['date'];?>
					<?php echo $label['by'] .' '. $value['author'];?></p>

				<?php echo text_output($value['content'], 'p');?><br />
			<?php endforeach; ?>
		</div>
		<?php endif;?>
		
	</div>

<?php else: ?>

	<?php if (isset($lists['news'])): ?>
		<?php echo text_output($label['news'], 'h2', 'page-subhead');?>
		
		<?php foreach ($lists['news'] as $value): ?>
			<h4><?php echo anchor('main/viewnews/' . $value['id'], RARROW .' '. $value['title']);?></h4>
			
			<p class="gray fontSmall">
				<?php echo $label['posted'] .' '. $value['date'];?>
				<?php echo $label['by'] .' '. $value['author'];?>
				<?php echo $label['in'] .' '. $value['category'];?></p>
			
			<?php echo text_output($value['content'], 'p');?><br />
		<?php endforeach; ?>
	<?php endif;?>
	
	<?php if (isset($lists['posts'])): ?>
		<?php echo text_output($label['posts'], 'h2', 'page-subhead');?>
		
		<?php foreach ($lists['posts'] as $value): ?>
			<h4><?php echo anchor('sim/viewpost/' . $value['id'], RARROW .' '. $value['title']);?></h4>
			
			<p class="gray fontSmall">
				<strong><?php echo $label['mission'].':</strong> '.$value['mission'];?><br />
				<?php echo $label['posted'] .' '. $value['date'];?>
				<?php echo $label['by'] .' '. $value['authors'];?></p>
			
			<?php echo text_output($value['content'], 'p');?><br />
		<?php endforeach; ?>
	<?php endif;?>
	
	<?php if (isset($lists['logs'])): ?>
		<?php echo text_output($label['logs'], 'h2', 'page-subhead');?>
		
		<?php foreach ($lists['logs'] as $value): ?>
			<h4><?php echo anchor('sim/viewlog/' . $value['id'], RARROW .' '. $value['title']);?></h4>
			
			<p class="gray fontSmall">
				<?php echo $label['posted'] .' '. $value['date'];?>
				<?php echo $label['by'] .' '. $value['author'];?></p>
			
			<?php echo text_output($value['content'], 'p');?><br />
		<?php endforeach; ?>
	<?php endif;?>

<?php endif; ?>
