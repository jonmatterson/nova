<?php 

$this->event->listen(['location', 'view', 'data', 'main', 'sim_missions_one'], function($event){
  
  $event['data']['posts'] = [];
  
  $this->db->from('posts');
  $this->db->where('post_mission', $event['data']['mission']);
  $this->db->where('post_status', 'activated');
  $this->db->order_by('post_chronological_mission_post_day', 'desc');
  $this->db->order_by('post_chronological_mission_post_time', 'desc');
  $this->db->order_by('post_date', 'desc');
  $this->db->limit(25, 0);
  $posts = $this->db->get();

  if ($posts->num_rows() > 0)
  {
    foreach ($posts->result() as $post)
    {
      $event['data']['posts'][] = [
        'id' => $post->post_id,
        'title' => $post->post_title,
        'authors' => $this->char->get_authors($post->post_authors, true, true),
        'timeline' => 'Mission Day '.$post->post_chronological_mission_post_day.' at '.$post->post_chronological_mission_post_time,
        'location' => $post->post_location,
      ];
    }
  }
  
  $this->extension['jquery']['generator']->select('.page-head')->first()->after('aaa');
  
});

$this->event->listen(['template', 'render', 'data', 'sim', 'missions'], function($event){
  $event['data']['javascript'] .= $this->extension['chronological_mission_posts']->inline_css('sim_missions', 'main', $data);
});

$this->event->listen(['location', 'view', 'output', 'main', 'sim_missions_one'], function($event){
  $event['output'] .= $this->extension['jquery']['generator']
                           ->select('.page-head')
                           ->first()
                           ->before('<a href="'.$this->extension['chronological_mission_posts']->url('sim/readposts/mission/'.$event['data']['mission']).'" class="chronological_mission_posts--sim_missions--read-story"><button>Read Story</button></a>');
  $event['output'] .= $this->extension['jquery']['generator']
                           ->select('#two h2')
                           ->first()
                           ->after('<a href="'.$this->extension['chronological_mission_posts']->url('sim/readposts/mission/'.$event['data']['mission']).'"" class="bold">Read Story &raquo;</a>');
                           
});
