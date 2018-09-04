<?php 

$this->event->listen(['location', 'view', 'data', 'main', 'personnel_index'], function($event){
  if(!empty($event['data']['depts'])){
    foreach($event['data']['depts'] as $d_id => $dept){
      if(!empty($dept['pos'])){
        foreach($dept['pos'] as $p_id => $pos){
          if(!empty($pos['chars'])){
            foreach($pos['chars'] as $c_id => $char){
              $character = $this->char->get_character($char['char_id']);
              if ($character->images > '')
        			{
        				// get the images
        				$images = explode(',', $character->images);
        				$images_count = count($images);
        				
        				$src = (strstr($images[0], 'http://') !== false)
        					? $images[0]
        					: base_url().Location::asset('images/characters', trim($images[0]));
                $event['data']['depts'][$d_id]['pos'][$p_id]['chars'][$c_id]['name'] .= '<img src="'.$src.'" style="display:none;" class="char_image">';
              }
            }
          }
        }
      }
    }
  }
});

$this->event->listen(['location', 'view', 'output', 'main', 'personnel_index'], function($event){
  $event['output'] .= '<script type="text/javascript">
  $(".char_image").each(function(){
    $(this).closest("tr").find("img[src*=\'ranks\']").before(
      $(this).css("display", "inline-block").css("max-width","120px").css("max-height","120px")
    ).closest("td").css("text-align","center");
  });
  </script>';
});
