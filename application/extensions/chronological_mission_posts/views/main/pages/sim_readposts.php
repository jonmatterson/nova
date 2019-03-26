<?php echo text_output($title, 'h1', 'page-head');?>

<p><a href="<?php echo $mission_url; ?>" class="bold"><?php echo $labels['mission_link']; ?></a></p>

<?php foreach($posts as $post): ?>
  
  <article class="chronological_mission_posts--sim_readposts">
  
    <?php echo text_output($post['title'], 'h3', 'chronological_mission_posts--sim_readposts--post-title');?>
    
    <div class="chronological_mission_posts--sim_readposts--details">
      <div class="chronological_mission_posts--sim_readposts--characters">
        <span class="chronological_mission_posts--sim_readposts--details-label">
          <?php echo $labels['characters'] ?>
        </span> 
        <?php echo $post['characters'] ?>
      </div>
      <div class="chronological_mission_posts--sim_readposts--location">
        <span class="chronological_mission_posts--sim_readposts--details-label">
          <?php echo $labels['location'] ?>
        </span> 
        <?php echo $post['location'] ?>
      </div>
      <div class="chronological_mission_posts--sim_readposts--timeline">
        <span class="chronological_mission_posts--sim_readposts--details-label">
          <?php echo $labels['timeline'] ?>
        </span> 
        <?php echo $post['timeline'] ?>
      </div>
    </div>
    
    <?php echo text_output($post['content']);?>
  
  </article>
  
<?php endforeach; ?>

<?php echo $pagination;?>
