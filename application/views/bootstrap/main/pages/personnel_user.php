<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<?php echo text_output($header, 'h1', 'page-head');?>

<p><?php echo link_to_if($edit_valid, 'user/account/'. $userid, str_replace(array('[',']'), array('',''), $label['edit']), array('class' => 'btn btn-primary btn-small'));?></p>

<?php if (isset($msg_error)): ?>
	<?php echo text_output($msg_error, 'p', 'text-warning');?>
<?php else: ?>
	<div class="section">
		<div class="row-fluid">
			<div class="span3"><?php echo $label['name'];?></div>
			<?php echo $name;?>
		</div>
		<div class="row-fluid">
			<div class="span3"><?php echo $label['email'];?></div>
			<?php echo $email;?>
		</div>
		<div class="row-fluid">
			<div class="span3"><?php echo $label['timezone'];?></div>
			<?php echo $timezone;?>
			<div class="fontSmall gray bold"><?php echo $timezone_span;?></div>
		</div>
	</div>
	
	<nav>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#one" data-toggle="tab"><span><?php echo $label['basicinfo'];?></span></a></li>
			<li><a href="#two" data-toggle="tab"><span><?php echo $label['stats'];?></span></a></li>
			<li><a href="#three" data-toggle="tab"><span><?php echo $label['charinfo'];?></span></a></li>
			<li><a href="#four" data-toggle="tab"><span><?php echo $label['rankhistory'];?></span></a></li>
			<li><a href="#five" data-toggle="tab"><span><?php echo $label['postinginfo'];?></span></a></li>
			<li><a href="#six" data-toggle="tab"><span><?php echo $label['awards'];?></span></a></li>
		</ul>
	</nav>

	<div class="tab-content">

		<!-- BASIC INFO -->
		<div class="tab-pane active" id="one">
			<?php if ( ! empty($dob)): ?>
				<div class="row-fluid">
					<div class="span3"><strong><?php echo $label['dob'];?></strong></div>
					<div class="span9"><?php echo $dob;?></div>
				</div>
			<?php endif;?>

			<?php if ( ! empty($location)): ?>
				<div class="row-fluid">
					<div class="span3"><strong><?php echo $label['location'];?></strong></div>
					<div class="span9"><?php echo $location;?></div>
				</div>
			<?php endif;?>

			<?php if (count($im) > 0): ?>
				<div class="row-fluid">
					<div class="span3"><strong><?php echo $label['im'];?></strong></div>
					<div class="span9"><ul class="unstyled">
					<?php foreach ($im as $value): ?>
						<li><?php echo $value;?></li>
					<?php endforeach;?>
					</ul></div>
				</div>
			<?php endif;?>

			<?php if ( ! empty($interests)): ?>
				<div class="row-fluid">
					<div class="span3"><strong><?php echo $label['interests'];?></strong></div>
					<div class="span9"><?php echo text_output($interests, '');?></div>
				</div>
			<?php endif;?>

			<?php if ( ! empty($bio)): ?>
				<div class="row-fluid">
					<div class="span3"><strong><?php echo $label['bio'];?></strong></div>
					<div class="span9"><?php echo text_output($bio, '');?></div>
				</div>
			<?php endif;?>

			<?php if (empty($dob) and empty($location) and count($im) == 0 and empty($interests) and empty($bio)): ?>
				<?php echo text_output($label['nobasic'], 'p', 'text-warning');?>
			<?php endif;?>
		</div> <!-- end BASIC INFO -->

		<!-- STATS -->
		<div class="tab-pane" id="two">
			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['joined'];?></strong></div>
				<div class="span9"><?php echo $join_date_time;?>
				<span class="fontSmall gray">(<?php echo $join_date;?>)</span>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['lastlogin'];?></strong></div>
				<div class="span9"><?php if (isset($last_login_time)): ?>
					<?php echo $last_login_time;?>
					<span class="fontSmall gray">(<?php echo $last_login;?>)</span>
				<?php else: ?>
					<?php echo text_output($label['nologin'], 'span', 'orange bold');?>
				<?php endif;?>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['lastpost'];?></strong></div>
				<div class="span9"><?php if (isset($last_post_time)): ?>
					<?php echo $last_post_time;?>
					<span class="fontSmall gray">(<?php echo $last_post;?>)</span>
				<?php else: ?>
					<?php echo text_output($label['nopost'], 'span', 'orange bold');?>
				<?php endif;?>
				</div>
			</div>

			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['totalposts'];?></strong></div>
				<div class="span9"><?php echo $post_count;?>
				<span class="fontSmall gray">(<?php echo $label['average'].' '.$avg_posts.' '.$label['perweek'];?>)</span>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['totallogs'];?></strong></div>
				<div class="span9">
				<?php echo $log_count;?>
				<span class="fontSmall gray">(<?php echo $label['average'].' '.$avg_logs.' '.$label['perweek'];?>)</span>
				</div>
			</div>
		</div> <!-- end STATS -->

		<!-- CHARACTER INFO -->
		<div class="tab-pane" id="three">
			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['activechars'];?></strong></div>
				<div class="span9">
				<?php if (isset($characters['active'])): ?>
					<ul class="unstyled">
					<?php foreach ($characters['active'] as $a): ?>
						<li>
							<?php echo anchor('personnel/character/'.$a['id'], $a['name'], array('class' => 'bold'));?>
							<div class="fontSmall gray">
								<?php echo $label['activefor'] .' '. $a['active_time'];?>
							</div>
							<div class="fontSmall gray italic">
								<?php echo $a['active_date'];?>
							</div>
						</li>
					<?php endforeach; ?>
					</ul>
				<?php else: ?>
					<?php echo text_output($label['none'], 'span', 'orange bold');?>
				<?php endif;?>
				</div>
			</div>

			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['npcs'];?></strong></div>
				<div class="span9">
				<?php if (isset($characters['npcs'])): ?>
					<?php foreach ($characters['npcs'] as $n): ?>
						<?php echo anchor('personnel/character/'.$n['id'], $n['name'], array('class' => 'bold'));?>
					<?php endforeach; ?>
				<?php else: ?>
					<?php echo text_output($label['none'], 'span', 'orange bold');?>
				<?php endif;?>
				</div>
			</div>

			<div class="row-fluid">
				<div class="span3"><strong><?php echo $label['inactivechars'];?></strong></div>
				<div class="span9"><?php if (isset($characters['inactive'])): ?>
					<?php foreach ($characters['inactive'] as $i): ?>
						<?php echo anchor('personnel/character/'.$i['id'], $i['name'], array('class' => 'bold'));?>
					<?php endforeach; ?>
				<?php else: ?>
					<?php echo text_output($label['none'], 'span', 'orange bold');?>
				<?php endif;?>
				</div>
			</div>
		</div> <!-- end CHARACTER INFO -->

		<!-- RANK HISTORY -->
		<div class="tab-pane" id="four">
			<?php if (is_array($rank_history) and count($rank_history) > 0): ?>
				<?php foreach ($rank_history as $row): ?>
					<h4><?php echo $row['name'];?></h4>

					<?php foreach ($row['history'] as $item): ?>
						<div class="row-fluid section">
							<div class="span4"><?php echo $item['date'];?></div>
							<div class="span8">
								<?php if ($item['old_order'] > $item['new_order']): ?>
									<?php echo $label['promoted'];?>
									<?php echo $item['new_rank'];?>
									<?php echo $label['from'];?>
									<?php echo $item['old_rank'];?>
								<?php else: ?>
									<?php echo $label['demoted'];?>
									<?php echo $item['old_rank'];?>
									<?php echo $label['to'];?>
									<?php echo $item['new_rank'];?>
								<?php endif;?>
							</div>
						</div>
					<?php endforeach;?>
					</table>
				<?php endforeach;?>
			<?php else: ?>
				<?php echo text_output($label['norankhistory'], 'p', 'text-warning');?>
			<?php endif;?>
		</div> <!-- end RANK HISTORY -->

		<!-- POSTING INFO -->
		<div class="tab-pane" id="five">
			<?php echo text_output($label['missionposts'], 'h3');?>
			<?php if (isset($posts)): ?>
				<p class="bold"><?php echo anchor('personnel/viewposts/u/'. $userid, $label['viewposts']);?></p>
				<?php foreach ($posts as $p): ?>
					<div class="row-fluid condensed">
						<div class="span4">
							<?php echo $p['date'];?>
						</div>
						<div class="span8">
							<strong><?php echo anchor('sim/viewpost/'. $p['post_id'], $p['title'], array('class' => 'bold'));?></strong>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4"><em><?php echo anchor('sim/missions/id/'. $p['mission_id'], $p['mission']);?></em></div>
						<div class="span8 muted"><?php echo $label['by'] .' '. $p['authors'];?>
						</div>
					</div>
				<?php endforeach; ?>
			<?php else: ?>
				<?php echo text_output($label['noposts'], 'p', 'text-warning');?>
			<?php endif; ?>

			<?php echo text_output($label['personallogs'], 'h3');?>
			<?php if (isset($logs)): ?>
				<p class="bold"><?php echo anchor('personnel/viewlogs/u/'. $userid, $label['viewlogs']);?></p>
					<?php foreach ($logs as $l): ?>
						<div class="row-fluid condensed">
							<div class="span4"><?php echo $l['date'];?></div>
							<div class="span8">
								<strong><?php echo anchor('sim/viewlog/'. $l['log_id'], $l['title'], array('class' => 'bold'));?></strong>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span4 hidden-phone"></div>
							<div class="span8 muted"><?php echo $label['by'] .' '. $l['author'];?></div>
						</div>
					<?php endforeach; ?>
			<?php else: ?>
				<?php echo text_output($label['nologs'], 'p', 'text-warning');?>
			<?php endif; ?>
		</div> <!-- end POSTING INFO -->

		<!-- AWARDS -->
		<div class="tab-pane" id="six">
			<?php if (isset($awards)): ?>
			
					<?php foreach ($awards as $a): ?>
						<div class="row-fluid">
							<div class="span4"><?php echo $a['given'];?></div>
							<div class="span8">
								<strong><?php echo anchor('sim/awards/'. $a['award_id'], $a['award'], array('class' => 'bold'));?></strong>
								<br>
								<?php echo $label['receivedby'] .' '. $a['name'];?>
								<br>
								<em><?php echo text_output($a['reason'], '');?></em>
							</div>
						</div>
					<?php endforeach; ?>

				<p class="bold"><?php echo anchor('personnel/viewawards/u/'. $userid, $label['viewawards']);?></div>
			<?php else: ?>
				<?php echo text_output($label['noawards'], 'p', 'text-warning');?>
			<?php endif; ?>
		</div> <!-- end AWARDS -->
	</div>
<?php endif; ?>