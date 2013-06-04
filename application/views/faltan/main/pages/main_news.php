<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>

<div id="loader" class="loader">
	<?php echo img($loader);?>
	<?php echo text_output($label['loading'], 'h3', 'gray');?>
</div>

<?php if (isset($news)): ?>
	<div id="news" class="hidden">
		<?php if (isset($categories)): ?>
			<ul class="nav nav-tabs" id="messageTabs">
				<li class="active">
					<a href="#" class="all" myTitle="<?php echo $header;?>"><?php echo $label['all_news'];?></a>
				</li>
				<?php foreach ($categories as $cat): ?>
				<li>
					<a href="#" class="show" myID="<?php echo $cat['id'];?>" myTitle="<?php echo $header .' '. NDASH .' '. $cat['name'];?>">
						<?php echo $cat['name'];?>
					</a>
				</li>
				<?php endforeach; ?>
			</ul>
		<script>
			$('#messageTabs a').click(function(){
				var $li = $(this).closest('li');
				$li.addClass('active');
				$li.siblings().removeClass('active');
				$('.news-title').html($(this).html());
			});
		</script>
		<?php endif; ?>

		<?php echo text_output($header, 'h1', 'news-title');?>
		
		<?php foreach ($news as $value): ?>
			<div class="news <?php echo $value['cat_id'];?>">
				<?php echo text_output(anchor('main/viewnews/'. $value['id'], $value['title']), 'h3');?>
				<?php echo text_output(word_limiter($value['content'], 50));?>
				
				<p class="fontSmall gray">
					<strong><?php echo $label['author'] .'</strong> '. $value['author'];?><br />
					<strong><?php echo $label['posted_on'] .'</strong> '. $value['date'];?><br />
					<strong><?php echo $label['category'] .'</strong> '. $value['category'];?>
					
					<?php if ($value['comment_count'] > 0): ?>
						<br /><em><?php echo $value['comment_count'] .' '. $label['comments'];?></em>
					<?php endif; ?>
				</p>
			</div>
		<?php endforeach; ?>
	</div>
<?php else: ?>
	<?php echo text_output($label['nonews'], 'h3', 'orange');?>
	
	<?php if (Auth::is_logged_in()): ?>
		<?php echo text_output($label['createnews'], 'p', 'bold gray');?>
	<?php endif;?>
<?php endif;?>