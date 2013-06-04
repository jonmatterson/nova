<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php 
if(!is_numeric($display))
{
	$arr = current($manifests);
	$display = $arr['id'];
}
?>

<div id="loader" class="loader">
	<?php echo img($loader);?>
	<?php echo text_output($label['loading'], 'h3', 'gray');?>
</div>
	
<?php echo text_output($header, 'h1', 'page-head');?>

<ul class="nav nav-tabs">
	<?php if (isset($manifests)): ?>
		<?php foreach ($manifests as $m): ?>
			<li <?php if($m['id'] == $display) echo 'class="active"' ?>>
			<?php echo anchor('personnel/index/'.$m['id'], $m['name'], array('rel' => 'tooltip', 'title' => $m['desc']));?>
			</li>
		<?php endforeach;?>
	<?php endif;?>
</ul>

<ul class="nav nav-pills" id="manifest-toggles">
	<li class="active"><?php echo anchor('#', $label['playing_chars'], array('id' => 'active'));?></li>
	<li class="active"><?php echo anchor('#', $label['npcs'], array('id' => 'npc'));?></li>
	<li><?php echo anchor('#', $label['open'], array('id' => 'open'));?></li>
	<!-- <li><?php echo anchor('#', $label['inactive_chars'], array('id' => 'inactive'));?></li> -->
</ul>

<div class="container-fluid" id="manifest">
	<?php if (isset($depts)): ?>
		<?php foreach ($depts as $dept): ?>
			<div class="row-fluid department">
				<div class="span12"><h3><?php echo $dept['name'];?></h3></div>
			</div>
		
			<?php if (isset($dept['pos'])): ?>
				<?php foreach ($dept['pos'] as $pos): ?>
				
					<?php if (isset($pos['chars'])): ?>
						<?php foreach ($pos['chars'] as $char): ?>
							<?php if ($char['crew_type'] == 'inactive'): ?>
								<?php $display = ' hidden'; ?>
							<?php else: ?>
								<?php $display = ''; ?>
							<?php endif; ?>
					
							<div class="row-fluid position <?php echo $char['crew_type'] . $display;?>">
								<div class="span3"><?php echo img($char['rank_img']);?></div>
								<div class="span6">
									<strong><?php echo $char['name'];?></strong><br />
									<?php echo $pos['name'];?>
									
									<?php if ($char['crew_type'] == 'npc'): ?>
										<br /><?php echo text_output($label['npc'], 'span', 'gray');?>
									<?php elseif ($char['crew_type'] == 'inactive'): ?>
										<br /><?php echo text_output($label['inactive'], 'span', 'gray');?>
									<?php endif; ?>
								</div>
								<div class="span1">
									<?php echo anchor('personnel/character/'. $char['char_id'], img($char['combadge']), array('class' => 'bold image'));?>
								</div>
							</div>
						<?php endforeach; ?>
					<?php endif; ?>
				
					<?php if ($pos['open'] > 0 && $dept['type'] == 'playing'): ?>
						<div class="row-fluid position open">
							<div class="span3"><?php echo img($pos['blank_img']);?></div>
							<div class="span6">
								<strong><?php echo $pos['name'];?></strong><br />
								<?php echo anchor('main/join/'. $pos['pos_id'], $label['apply']);?>
							</div>
						</div>
					<?php endif; ?>
				
				<?php endforeach; ?>
			<?php endif; ?>
		
			<?php if (isset($dept['sub'])): ?>
				<?php foreach ($dept['sub'] as $sub): ?>
					<div class="row-fluid department">
						<div class="span1 hidden-phone"></div>
						<div class="span9"><h4><?php echo $sub['name'];?></h4></div>
					</div>
				
					<?php if (isset($sub['pos'])): ?>
						<?php foreach ($sub['pos'] as $spos): ?>
						
							<?php if (isset($spos['chars'])): ?>
								<?php foreach ($spos['chars'] as $char): ?>
									<?php if ($char['crew_type'] == 'inactive'): ?>
										<?php $display = ' hidden'; ?>
									<?php else: ?>
										<?php $display = ''; ?>
									<?php endif; ?>
							
									<div class="row-fluid position <?php echo $char['crew_type'] . $display;?>">
										<div class="span1 hidden-phone"></div>
										<div class="span3"><?php echo img($char['rank_img']);?></div>
										<div class="span5">
											<strong><?php echo $char['name'];?></strong><br />
											<?php echo $spos['name'];?>
											
											<?php if ($char['crew_type'] == 'npc'): ?>
												<br /><?php echo text_output($label['npc'], 'span', 'gray');?>
											<?php elseif ($char['crew_type'] == 'inactive'): ?>
												<br /><?php echo text_output($label['inactive'], 'span', 'gray');?>
											<?php endif; ?>
										</div>
										<div class="span1">
											<?php echo anchor('personnel/character/'. $char['char_id'], img($char['combadge']), array('class' => 'bold image'));?>
										</div>
									</div>
								<?php endforeach; ?>
							<?php endif; ?>
						
							<?php if ($spos['open'] > 0 && $sub['type'] == 'playing'): ?>
								<div class="row-fluid position open">
									<div class="span1 hidden-phone"></div>
									<div class="span3"><?php echo img($spos['blank_img']);?></div>
									<div class="span5">
										<strong><?php echo $spos['name'];?></strong><br />
										<?php echo anchor('main/join/'. $spos['pos_id'], $label['apply']);?>
									</div>
								</div>
							<?php endif; ?>
					
						<?php endforeach; ?>
					<?php endif; ?>
				
				<?php endforeach; ?>
			<?php endif; ?>
		
		<?php endforeach; ?>
	
		</table>
	<?php endif; ?>
</div>

<script>
$('.position.open').hide();
$('#manifest-toggles a').click(function(){
	var id = $(this).attr('id')
	var $li = $(this).closest('li')
	if($li.hasClass('active')){
		$li.removeClass('active')
		$('.position.'+id).hide()
	}else{
		$li.addClass('active')
		$('.position.'+id).show()
	}
})
</script>