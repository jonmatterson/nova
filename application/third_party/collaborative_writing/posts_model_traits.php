<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * In application/models/posts_model.php,
 * 
 *    add the following before the class definition:
 * 
 *      require_once APPPATH.'third_party/collaborative_writing/posts_model_traits.php';
 * 
 *    and add the following in the class definition:
 * 
 *      use Collaborative_Writing_Posts_Model_Trait;
 * 
 * Alternatively, copy the posts_model_traits.php source code directly into the 
 * class definition in application/models/posts_model.php if your version of PHP
 * does not support traits.
 */

trait Collaborative_Writing_Posts_Model_Trait
{
    protected $deferred_pad_id_for_next_post = null;
    protected $deferred_post_pad_ids = [];
    
    public function create_mission_entry($data = '')
	{
        $affected_rows = parent::create_mission_entry($data);
        
        $id = $this->db->insert_id();
        
        if($this->deferred_pad_id_for_next_post)
        {
            $this->deferred_post_pad_ids[$id] = $this->deferred_pad_id_for_next_post;
            $this->unset_pad_id_for_next_post();
        }
        
        return $affected_rows;
	}
	
	public function update_post($id = '', $data = '')
	{
        $query = parent::update_post($id, $data);
        
        if($this->deferred_pad_id_for_next_post)
        {
            $this->deferred_post_pad_ids[$id] = $this->deferred_pad_id_for_next_post;
            $this->unset_pad_id_for_next_post();
        }
        
        return $query;
	}
    
    public function set_pad_id_for_next_post($pad_id)
    {
        $this->deferred_pad_id_for_next_post = $pad_id;
    }
    
    public function unset_pad_id_for_next_post()
    {
        $this->deferred_pad_id_for_next_post = null;
    }
    
    public function set_deferred_post_pads()
    {
        foreach($this->deferred_post_pad_ids as $post_id => $pad_id)
        {
            $this->set_post_pad($post_id, $pad_id);
        }
    }
    
    public function get_post_pad_id($post_id)
    {
        $query = $this->db->get_where('posts_pad', array('ppad_post' => $post_id));
		
		return $query->num_rows() > 0 ? $query->row()->ppad_id : false;
    }
    
    public function set_post_pad($post_id, $pad_id)
    {
        $query = $this->db->delete('posts_pad', array('ppad_post' => $post_id));
        
		$query = $this->db->insert('posts_pad', [
            'ppad_id' => $pad_id,
            'ppad_post' => $post_id
        ]);
		
		return $query;
    }
}