<?php 

$this->event->listen(['location', 'view', 'data', 'main', 'sim_listposts'], function($event){
  $mission_id = $this->uri->segment(4, false, true);
  if($mission === false){
    // SKIP -- extension does not currently ordering across multiple missions
  }else{
    $offset = $this->uri->segment(5, 0, true);
    
    $event['data']['posts'] = [];
    
    $this->db->from('posts');
    $this->db->where('post_mission', $mission_id);
    $this->db->where('post_status', 'activated');
    $this->db->order_by('post_chronological_mission_post_day', 'asc');
    $this->db->order_by('post_chronological_mission_post_time', 'asc');
    $this->db->order_by('post_date', 'asc');
    $this->db->limit($this->pagination->per_page, $offset);
    $posts = $this->db->get();

    if ($posts->num_rows() > 0)
    {
      foreach ($posts->result() as $post)
      {
        $event['data']['posts'][] = [
          'id' => $post->post_id,
          'title' => $post->post_title,
          'author' => $this->char->get_authors($post->post_authors, true, true),
          'date' => 'Mission Day '.$post->post_chronological_mission_post_day.' at '.$post->post_chronological_mission_post_time,
          'location' => $post->post_location,
          'mission' => $this->mis->get_mission($post->post_mission, 'mission_title'),
          'mission_id' => $mission_id
        ];
      }
    }

  }
});
