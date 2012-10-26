<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<style type="text/css">
	a.image { display: inline-block; }
	a.image span { padding: 0px; display: inline-block; }
	a.image span img { margin: 0px; padding: 0px; }
</style>

<?php echo text_output($header, 'h1', 'page-head');?>

<p><?php echo anchor('sim/missions', $label['missions'], array('class' => 'bold'));?></p>

<?php if (isset($mission_img['src'])): ?>
	<div id="gallery">
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

<div id="tabs">
	<ul>
		<li><a href="#one"><span>Info &amp; Summary</span></a></li>
		<li><a href="#two"><span><?php echo $label['posts'];?></span></a></li>
	</ul>
	
	<div id="one">
		<?php if (isset($basic)): ?>
			<?php echo text_output($info_header, 'h2', 'page-subhead');?>
				<h4><?php echo $label['status'];?></h4>
				<p><?php echo $basic['status'] .' '. $label['mission'];?></p>
				<h4><?php echo $label['desc'];?></h4>
				<?php echo text_output($basic['desc'], 'p');?>
				<?php if (is_array($basic['group'])): ?>
					<h4><?php echo $label['group'];?></h4>
					<p><?php echo anchor('sim/missions/group/'. $basic['group']['misgroup_id'], $basic['group']['misgroup_name']);?></p>
				<?php endif;?>
					<h4><?php echo $label['date_start'];?></h4>
					<p><?php echo $basic['start'];?></p>
				<?php if (isset($basic['end'])): ?>
					<h4><?php echo $label['date_end'];?></h4>
					<p><?php echo $basic['end'];?></p>
				<?php endif; ?>
			</table><br />
		<?php endif; ?>
		<?php if (isset($summary)): ?>
			<?php echo text_output($summary['title'], 'h2', 'page-subhead');?>
			<?php echo text_output($summary['content']);?>
		<?php else: ?>
			<?php echo text_output($label['nosummary'], 'h3', 'orange');?>
		<?php endif; ?>
	</div>
	
	<div id="two">
		<?php if (isset($posts)): ?>
			
		<div style="float:right">
			<button id="toggle-missionTime" class="button-main">Order by Mission Time</button><button id="toggle-postTime" class="button-main">Order by Post Time</button>
		</div>
			
			<?php echo text_output($posts_header, 'h2', 'page-subhead');?>
			<p><?php echo anchor('sim/listposts/mission/'. $mission, $label['view_all_posts'], array('class' => 'bold'));?></p> 
			
			<table class="table100 zebra" id="mission-posts" cellspacing="0" cellpadding="3">
				<thead>
					<tr>
						<th><?php echo $label['title'];?></th>
						<th><?php echo $label['timeline'];?></th>
						<th><?php echo $label['location'];?></th>
					</tr>
				</thead>
				<tbody>
				<?php foreach ($posts as $post): ?>
					<tr>
						<td class="col_50pct">
							<strong>
								<?php echo anchor('sim/viewpost/'. $post['id'], $post['title'], array('class' => 'bold'));?>
							</strong><br />
							<span class="fontSmall gray">
								<?php echo $label['by'] .' '. $post['authors'];?>
							</span>
						</td>
						<td class="col_25pct timeline"><?php echo $post['timeline'];?></td>
						<td class="col_25pct"><?php echo $post['location'];?></td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
		<?php else: ?>
			<?php echo text_output($label['noposts'], 'h3', 'orange');?>
		<?php endif; ?>
	</div>
</div>

<script type="text/javascript">
(function(){
	
	var original = $('#mission-posts tr')
	
	var orderPostTime = function(){

		$(original).detach().each(function(){
			$('#mission-posts').append(this)
		})
		
	}

	var orderMissionTime = function(){
		var timeline = []
		var other = []
		$('#mission-posts tr').each(function(){

			var timestamp = $(this).find('.timeline').first().html();
			if(timestamp){

				timestamp = timestamp.split('-')
				if(timestamp.length == 1){
					other.push($(this))
					return
				}

				matches = timestamp[0].match(/Day ([-]?[0-9][0-9]*)/);
				if(!matches){
					other.push($(this))
					return
				}

				console.log(JSON.stringify(matches))

				var day = parseInt(matches[1])
				hours = parseInt(timestamp[1].replace(/ 0*/, ''))
				timeline.push([day,hours,$(this)])
			}
		})

		timeline.sort(function(x,y){
			return y[0]*2400 + y[1] - x[0]*2400 - x[1];
		});

		$(timeline).each(function(){
			$('#mission-posts').append(this[2])
		})

		$(other).each(function(){
			$('#mission-posts').append(this)
		})
	}
	
	var reflowAlt = function(){
		var alt = false
		$('#mission-posts tr').each(function(){
			if(!alt){
				$(this).addClass('alt')
				alt = true
			}else{
				$(this).removeClass('alt')
				alt = false
			}
		})
	}
	
	$('#toggle-missionTime').click(function(e){
		orderMissionTime();
		reflowAlt();
		e.preventDefault();
		$('#toggle-missionTime').hide()
		$('#toggle-postTime').show()
	})
	
	$('#toggle-postTime').click(function(e){
		orderPostTime()
		reflowAlt()
		e.preventDefault()
		$('#toggle-postTime').hide()
		$('#toggle-missionTime').show()
		
	})
	
	orderMissionTime()
	$('#toggle-missionTime').hide()
	
})();
</script>