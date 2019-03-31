<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/libraries/Nova_controller_main.php';

class __extensions__chronological_mission_posts__sim extends Nova_controller_main
{
	public function __construct()
	{
		parent::__construct();

		$this->_regions['nav_sub'] = Menu::build('sub', 'sim');
	}
  
  public function readposts()
  {
		// load the resources
		$this->load->model('posts_model', 'posts');
		$this->load->model('missions_model', 'mis');
		$this->load->library('pagination');
    
		$mission_id = $this->uri->rsegment(4, false, true);
    
    if($mission_id === false)
    {
      // SKIP -- extension does not currently ordering across multiple missions
    }
    else
    {
      $data = [
				'mission_id' => $mission_id,
				'mission_url' => base_url('sim/missions/id/'.$mission_id),
				'title' => ucfirst(lang('global_missions')).' - '.$this->mis->get_mission($mission_id, 'mission_title'),
				'labels' => [
					'characters' => 'Featuring:',
					'location' => 'Location:',
					'timeline' => 'On:',
					'mission_link' => 'View Mission Details &raquo;'
				]
			];
      
      $offset = $this->uri->segment(7, 0, true);
      
			// initialize the pagination library
			$this->pagination->initialize([
        'base_url' => $this->extension['chronological_mission_posts']->url('sim/readposts/mission/'.$mission_id),
        'total_rows' => $this->posts->count_all_posts($mission),
        'per_page' => $this->options['list_posts_num'],
        'uri_segment' => 7,
        'full_tag_open' => '<p class="fontMedium bold">',
        'full_tag_close' => '</p>'
      ]);

			$data['pagination'] = $this->pagination->create_links();
      
      $data['posts'] = [];
      
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
          $data['posts'][] = [
            'id' => $post->post_id,
            'title' => $post->post_title,
            'characters' => $this->char->get_authors($post->post_authors, true, true),
            'timeline' => 'Mission Day '.$post->post_chronological_mission_post_day.' at '.$post->post_chronological_mission_post_time,
            'location' => $post->post_location,
            'content' => $post->post_content
          ];
        }
      }
      
      $this->_regions['javascript'] .= $this->extension['chronological_mission_posts']->inline_css('sim_readposts', 'main', $data);
      $this->_regions['title'] .= 'Read Story';
  		$this->_regions['content'] = $this->extension['chronological_mission_posts']
                                        ->view('sim_readposts', $this->skin, 'main', $data);
                                        
  		Template::assign($this->_regions);

  		Template::render();
    }
  }
}
