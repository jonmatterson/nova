<?php 

$this->event->listen(['location', 'view', 'data', 'main', 'sim_viewpost'], function($event){
  $id = (is_numeric($this->uri->segment(3))) ? $this->uri->segment(3) : false;
  $post = $id ? $this->posts->get_post($id) : null;
  if($post)
    $event['data']['timeline'] = 'Mission Day '.$post->post_chronological_mission_post_day.' at '.$post->post_chronological_mission_post_time;
});
