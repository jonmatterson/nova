<?php
/**
 * Write controller
 *
 * @package		Nova
 * @category	Controller
 * @author		Anodyne Productions
 * @copyright	2010-11 Anodyne Productions
 * @version		1.3
 *
 * Updated the flash message so they can be overridden by seamless substitution
 */

class Write_base extends Controller {

	/* set the variables */
	var $options;
	var $skin;
	var $rank;
	var $timezone;
	var $dst;

	function Write_base()
	{
		parent::Controller();
		
		/* load the system model */
		$this->load->model('system_model', 'sys');
		$installed = $this->sys->check_install_status();
		
		if ($installed === FALSE)
		{ /* check whether the system is installed */
			redirect('install/index', 'refresh');
		}
		
		/* load the session library */
		$this->load->library('session');
		
		/* load the models */
		$this->load->model('characters_model', 'char');
		$this->load->model('users_model', 'user');
		
		/* check to see if they are logged in */
		$logged_in = $this->auth->is_logged_in(TRUE);
		
		/* an array of the global we want to retrieve */
		$settings_array = array(
			'skin_admin',
			'display_rank',
			'timezone',
			'daylight_savings',
			'sim_name',
			'date_format',
			'email_subject',
			'system_email',
			'use_mission_notes'
		);
		
		/* grab the settings */
		$this->options = $this->settings->get_settings($settings_array);
		
		/* set the variables */
		$this->skin = $this->options['skin_admin'];
		$this->rank = $this->options['display_rank'];
		$this->timezone = $this->options['timezone'];
		$this->dst = (bool) $this->options['daylight_savings'];
		
		if ($this->auth->is_logged_in())
		{
			$this->skin = (file_exists(APPPATH .'views/'.$this->session->userdata('skin_admin').'/template_admin'.EXT))
				? $this->session->userdata('skin_admin')
				: $this->skin;
			$this->rank = $this->session->userdata('display_rank');
			$this->timezone = $this->session->userdata('timezone');
			$this->dst = (bool) $this->session->userdata('dst');
		}
		
		/* set and load the language file needed */
		$this->lang->load('app', $this->session->userdata('language'));
		
		/* set the template */
		$this->template->set_template('admin');
		$this->template->set_master_template($this->skin .'/template_admin.php');
		
		/* write the common elements to the template */
		$this->template->write('nav_main', $this->menu->build('main', 'main'), TRUE);
		$this->template->write('nav_sub', $this->menu->build('adminsub', 'write'), TRUE);
		$this->template->write('panel_1', $this->user_panel->panel_1(), TRUE);
		$this->template->write('panel_2', $this->user_panel->panel_2(), TRUE);
		$this->template->write('panel_3', $this->user_panel->panel_3(), TRUE);
		$this->template->write('panel_workflow', $this->user_panel->panel_workflow(), TRUE);
		$this->template->write('title', $this->options['sim_name'] . ' :: ');
		
		if ( ! is_array($this->session->userdata('characters')) && $this->uri->segment(2) != 'error')
		{
			redirect('write/error/1');
		}
	}

	function index()
	{
		/* check access */
		$this->auth->check_access();
		
		/* load the models */
		$this->load->model('posts_model', 'posts');
		$this->load->model('personallogs_model', 'logs');
		$this->load->model('news_model', 'news');
		$this->load->model('missions_model', 'mis');
		
		/* set the variables */
		$js_data['tab'] = 0;
		
		/* build the images array */
		$data['images'] = array(
			'post' => array(
				'src' => img_location('write-post.png', $this->skin, 'admin'),
				'class' => 'image inline_img_left',
				'alt' => ''),
			'log' => array(
				'src' => img_location('write-log.png', $this->skin, 'admin'),
				'class' => 'image inline_img_left',
				'alt' => ''),
			'news' => array(
				'src' => img_location('write-news.png', $this->skin, 'admin'),
				'class' => 'image inline_img_left',
				'alt' => ''),
			'new' => array(
				'src' => img_location('icon-green-small.png', $this->skin, 'admin'),
				'class' => 'image',
				'alt' => ''),
		);
		
		/* set the datestring */
		$datestring = $this->options['date_format'];
		
		/*
		|---------------------------------------------------------------
		| MY SAVED ENTRIES
		|---------------------------------------------------------------
		*/
		
		/* grab the data */
		$posts_saved = $this->posts->get_saved_posts($this->session->userdata('characters'));
		$logs_saved = $this->logs->get_saved_logs($this->session->userdata('characters'));
		$news_saved = $this->news->get_user_news($this->session->userdata('userid'), 0, 'saved');
		
		if ($posts_saved->num_rows() > 0)
		{
			$i = 1;
			foreach ($posts_saved->result() as $p)
			{
				$data['posts_saved'][$i]['title'] = $p->post_title;
				$data['posts_saved'][$i]['post_id'] = $p->post_id;
				$data['posts_saved'][$i]['date'] = mdate($datestring, gmt_to_local($p->post_date, $this->timezone, $this->dst));
				$data['posts_saved'][$i]['authors'] = $this->char->get_authors($p->post_authors);
				$data['posts_saved'][$i]['mission'] = $this->mis->get_mission($p->post_mission, 'mission_title');
				$data['posts_saved'][$i]['mission_id'] = $p->post_mission;
				$data['posts_saved'][$i]['saved'] = $p->post_saved;
				
				++$i;
			}
		}
		
		if ($logs_saved->num_rows() > 0)
		{
			$i = 1;
			foreach ($logs_saved->result() as $l)
			{
				$data['logs_saved'][$i]['title'] = $l->log_title;
				$data['logs_saved'][$i]['log_id'] = $l->log_id;
				$data['logs_saved'][$i]['date'] = mdate($datestring, gmt_to_local($l->log_date, $this->timezone, $this->dst));
				$data['logs_saved'][$i]['author'] = $this->char->get_character_name($l->log_author_character, TRUE);
				
				++$i;
			}
		}
		
		if ($news_saved->num_rows() > 0)
		{
			$i = 1;
			foreach ($news_saved->result() as $n)
			{
				$data['news_saved'][$i]['title'] = $n->news_title;
				$data['news_saved'][$i]['news_id'] = $n->news_id;
				$data['news_saved'][$i]['category'] = $n->newscat_name;
				$data['news_saved'][$i]['date'] = mdate($datestring, gmt_to_local($n->news_date, $this->timezone, $this->dst));
				
				++$i;
			}
		}
		
		if ($posts_saved->num_rows() == 0 && $logs_saved->num_rows() == 0 && $news_saved->num_rows() == 0)
		{
			$js_data['tab'] = 1;
		}
		
		/*
		|---------------------------------------------------------------
		| MY RECENT ENTRIES
		|---------------------------------------------------------------
		*/
		
		/* grab the data */
		$posts = $this->posts->get_character_posts($this->session->userdata('characters'), 5);
		$logs = $this->logs->get_character_logs($this->session->userdata('characters'), 5);
		$news = $this->news->get_user_news($this->session->userdata('userid'), 5);
		
		if ($posts->num_rows() > 0)
		{
			$i = 1;
			foreach ($posts->result() as $p)
			{
				$data['posts'][$i]['title'] = $p->post_title;
				$data['posts'][$i]['post_id'] = $p->post_id;
				$data['posts'][$i]['date'] = mdate($datestring, gmt_to_local($p->post_date, $this->timezone, $this->dst));
				$data['posts'][$i]['authors'] = $this->char->get_authors($p->post_authors);
				$data['posts'][$i]['mission'] = $this->mis->get_mission($p->post_mission, 'mission_title');
				$data['posts'][$i]['mission_id'] = $p->post_mission;
				
				++$i;
			}
		}
		
		if ($logs->num_rows() > 0)
		{
			$i = 1;
			foreach ($logs->result() as $l)
			{
				$data['logs'][$i]['title'] = $l->log_title;
				$data['logs'][$i]['log_id'] = $l->log_id;
				$data['logs'][$i]['date'] = mdate($datestring, gmt_to_local($l->log_date, $this->timezone, $this->dst));
				$data['logs'][$i]['author'] = $this->char->get_character_name($l->log_author_character, TRUE);
				
				++$i;
			}
		}
		
		if ($news->num_rows() > 0)
		{
			$i = 1;
			foreach ($news->result() as $n)
			{
				$data['news'][$i]['title'] = $n->news_title;
				$data['news'][$i]['news_id'] = $n->news_id;
				$data['news'][$i]['category'] = $n->newscat_name;
				$data['news'][$i]['date'] = mdate($datestring, gmt_to_local($n->news_date, $this->timezone, $this->dst));
				
				++$i;
			}
		}
		
		/*
		|---------------------------------------------------------------
		| ALL RECENT ENTRIES
		|---------------------------------------------------------------
		*/
		
		/* grab the data */		
		$posts_all = $this->posts->get_post_list('', 'desc', 5, 0, 'activated');
		$logs_all = $this->logs->get_log_list(5);
		$news_all = $this->news->get_news_items(5, $this->session->userdata('userid'));
		
		if ($posts_all->num_rows() > 0)
		{
			$i = 1;
			foreach ($posts_all->result() as $p)
			{
				$data['posts_all'][$i]['title'] = $p->post_title;
				$data['posts_all'][$i]['post_id'] = $p->post_id;
				$data['posts_all'][$i]['date'] = mdate($datestring, gmt_to_local($p->post_date, $this->timezone, $this->dst));
				$data['posts_all'][$i]['authors'] = $this->char->get_authors($p->post_authors);
				$data['posts_all'][$i]['mission'] = $this->mis->get_mission($p->post_mission, 'mission_title');
				$data['posts_all'][$i]['mission_id'] = $p->post_mission;
				
				++$i;
			}
		}
		
		if ($logs_all->num_rows() > 0)
		{
			$i = 1;
			foreach ($logs_all->result() as $l)
			{
				$data['logs_all'][$i]['title'] = $l->log_title;
				$data['logs_all'][$i]['log_id'] = $l->log_id;
				$data['logs_all'][$i]['date'] = mdate($datestring, gmt_to_local($l->log_date, $this->timezone, $this->dst));
				$data['logs_all'][$i]['author'] = $this->char->get_character_name($l->log_author_character, TRUE);
				
				++$i;
			}
		}
		
		if ($news_all->num_rows() > 0)
		{
			$i = 1;
			foreach ($news_all->result() as $n)
			{
				$data['news_all'][$i]['title'] = $n->news_title;
				$data['news_all'][$i]['news_id'] = $n->news_id;
				$data['news_all'][$i]['category'] = $n->newscat_name;
				$data['news_all'][$i]['author'] = $this->char->get_character_name($n->news_author_character, TRUE);
				$data['news_all'][$i]['date'] = mdate($datestring, gmt_to_local($n->news_date, $this->timezone, $this->dst));
				
				++$i;
			}
		}
		
		/* set the header */
		$data['header'] = ucwords(lang('labels_writing') .' '. lang('labels_controlpanel'));
		
		$data['label'] = array(
			'all' => ucwords(lang('labels_all') .' '. lang('status_recent') .' '. lang('labels_entries')),
			'by' => lang('labels_by'),
			'category' => ucfirst(lang('labels_category') .':'),
			'date' => ucfirst(lang('labels_date')),
			'mission' => ucfirst(lang('global_mission') .':'),
			'missionposts' => ucwords(lang('global_missionposts')),
			'newsitems' => ucwords(lang('global_newsitems')),
			'no_logs' => lang('error_no_logs'),
			'no_news' => lang('error_no_news'),
			'no_posts' => lang('error_no_posts'),
			'personallogs' => ucwords(lang('global_personallogs')),
			'recent' => ucwords(lang('labels_my') .' '. lang('status_recent') .' '. lang('labels_entries')),
			'saved' => ucwords(lang('labels_my') .' '. lang('status_saved') .' '. lang('labels_entries')),
			'title' => ucfirst(lang('labels_title')),
			'view_all_posts' => ucwords(lang('actions_viewall') .' '. lang('global_posts') .' '. RARROW),
			'view_all_logs' => ucwords(lang('actions_viewall') .' '. lang('global_personallogs') .' '. RARROW),
			'view_all_news' => ucwords(lang('actions_viewall') .' '. lang('global_newsitems') .' '. RARROW),
			'view_user_logs' => ucwords(lang('actions_viewall') .' '. lang('global_user_poss') .' '. 
				lang('global_logs') .' '. RARROW),
			'view_user_posts' => ucwords(lang('actions_viewall') .' '. lang('global_user_poss') .' '. 
				lang('global_posts') .' '. RARROW),
			'write_log' => ucwords(lang('actions_write') .' '. lang('global_personallog')),
			'write_news' => ucwords(lang('actions_write') .' '. lang('global_newsitem')),
			'write_post' => ucwords(lang('actions_write') .' '. lang('global_missionpost')),
		);
		
		/* figure out where the view files should be coming from */
		$view_loc = view_location('write_index', $this->skin, 'admin');
		$js_loc = js_location('write_index_js', $this->skin, 'admin');
		
		/* write the data to the template */
		$this->template->write_view('content', $view_loc, $data);
		$this->template->write_view('javascript', $js_loc, $js_data);
		$this->template->write('title', $data['header']);
		
		/* render the template */
		$this->template->render();
	}
	
	function error()
	{
		$id = $this->uri->segment(3);
		
		switch ($id)
		{
			case 1:
				$error = sprintf(
					lang('error_wcp_1'),
					lang('global_character'),
					lang('global_character'),
					lang('global_character')
				);
			break;
		}
		
		$data['header'] = lang('head_admin_error');
		
		$data['error'] = $error;
		
		$view_loc = view_location('error', $this->skin, 'admin');
		
		$this->template->write('title', lang('head_admin_error'));
		$this->template->write_view('content', $view_loc, $data);
		
		$this->template->render();
	}
	
	function missionpost()
	{
		/* check access */
		$this->auth->check_access();
		
		/* load the models */
		$this->load->model('posts_model', 'posts');
		$this->load->model('missions_model', 'mis');
		
		if ($this->options['system_email'] == 'off')
		{
			$flash['status'] = 'info';
			$flash['message'] = lang_output('flash_system_email_off');
			
			// set the location of the flash view
			$flashloc = view_location('flash', $this->skin, 'admin');
			
			// write everything to the template
			$this->template->write_view('flash_message', $flashloc, $flash);
		}
		
		/* set the variables */
		$id = $this->uri->segment(3, FALSE, TRUE);
		
		$data['key'] = array(
			'all' => '0',
			'missions' => ''
		);
		
		$data['to'] = '0';
		
		$content = FALSE;
		$title = FALSE;
		$tags = FALSE;
		$timeline = FALSE;
		$location = FALSE;
		$mission = FALSE;
		
		if (isset($_POST['submit']))
		{
			/* define the POST variables */
			$tags = $this->input->post('tags', TRUE);
			$title = $this->input->post('title', TRUE);
			$content = $this->input->post('content', TRUE);
			$mission = $this->input->post('mission', TRUE);
			$timeline = $this->input->post('timeline', TRUE);
			$location = $this->input->post('location', TRUE);
			
			$authors = $this->input->post('authors', TRUE);
			$authors_list = $this->input->post('to', TRUE);
			
			$action = strtolower($this->input->post('submit', TRUE));
			$status = FALSE;
			$flash = FALSE;
			$illegalpost = FALSE;
			
			if ($this->uri->segment(3) != 'missionCreate')
			{
				if ($authors == '0' && $authors_list == '0')
				{
					$flash['status'] = 'error';
					$flash['message'] = lang_output('flash_missionposts_no_author');
					
					// set the location of the flash view
					$flashloc = view_location('flash', $this->skin, 'admin');
					
					// write everything to the template
					$this->template->write_view('flash_message', $flashloc, $flash);
				}
				else
				{
					if ($authors_list == "0")
					{
						$authors_list = $authors;
					}
					
					/* put the authors into an array */
					$author_array_final = explode(',', $authors_list);
					
					$users = array();
					
					foreach ($author_array_final as $key => $value)
					{ /* make sure there aren't any empty values */
						if (!is_numeric($value) || $value < 1)
						{
							unset($author_array_final[$key]);
						}
						
						/* get the user ID */
						$pid = $this->sys->get_item('characters', 'charid', $value, 'user');
						
						/* put the users into an array */
						$users[] = ($pid !== FALSE) ? $pid : NULL;
					}
					
					foreach ($users as $a => $b)
					{
						if (!is_numeric($b) || $b < 1)
						{
							unset($users[$a]);
						}
					}
					
					/* make sure the array doesn't the same ID multiple times */
					$users = array_unique($users);
					
					/* set the authors string */
					$authors_string = implode(',', $author_array_final);
					$users_string = implode(',', $users);
					
					/* make sure the person posting is actually part of the post */
					if (!in_array($this->session->userdata('userid'), $users))
					{
						$illegalpost = TRUE;
						$action = lang('actions_save');
					}
					
					switch ($action)
					{
						case 'delete':
							/* get the log information */
							$row = $this->posts->get_post($id);
							
							if ($row !== FALSE)
							{
								if ($row->post_status == 'saved')
								{
									$valid = array();
				
									foreach ($this->session->userdata('characters') as $check)
									{
										if (strstr($row->post_authors, $check) === FALSE)
										{
											$valid[] = FALSE;
										}
										else
										{
											$valid[] = TRUE;
										}
									}
									
									if (!in_array(TRUE, $valid))
									{
										redirect('admin/error/4');
									}
									
									/* delete the log */
									$delete = $this->posts->delete_post($id);
									
									if ($delete > 0)
									{
										$message = sprintf(
											lang('flash_success'),
											ucfirst(lang('global_missionpost')),
											lang('actions_deleted'),
											''
										);
	
										$flash['status'] = 'success';
										$flash['message'] = text_output($message);
										
										if (count($author_array_final) > 1)
										{
											/* set the array of data for the email */
											$email_data = array(
												'authors' => $authors_string,
												'title' => $title
											);
											
											/* send the email */
											$email = ($this->options['system_email'] == 'on') ? $this->_email('post_delete', $email_data) : FALSE;
										}
									}
									else
									{
										$message = sprintf(
											lang('flash_failure'),
											ucfirst(lang('global_missionpost')),
											lang('actions_deleted'),
											''
										);
	
										$flash['status'] = 'error';
										$flash['message'] = text_output($message);
									}
								}
								
								/* add an automatic redirect */
								$this->template->add_redirect('write/index');
							}
						break;
							
						case 'save':
							if ($id !== FALSE)
							{ /* if there is an ID, it is a previously saved post */
								$update_array = array(
									'post_authors' => $authors_string,
									'post_authors_users' => $users_string,
									'post_date' => now(),
									'post_title' => $title,
									'post_content' => $content,
									'post_tags' => $tags,
									'post_status' => 'saved',
									'post_timeline' => $timeline,
									'post_location' => $location,
									'post_mission' => $mission,
									'post_saved' => $this->session->userdata('main_char')
								);
								
								/* do the update */
								$update = $this->posts->update_post($id, $update_array);
								
								if ($update > 0)
								{
									$message = sprintf(
										lang('flash_success'),
										ucfirst(lang('global_missionpost')),
										lang('actions_saved'),
										($illegalpost === TRUE) ? ' '. lang('error_illegal_post') : ''
									);
	
									$flash['status'] = 'success';
									$flash['message'] = text_output($message);
								}
								else
								{
									$message = sprintf(
										lang('flash_failure'),
										ucfirst(lang('global_missionpost')),
										lang('actions_saved'),
										($illegalpost === TRUE) ? ' '. lang('error_illegal_post') : ''
									);
	
									$flash['status'] = 'error';
									$flash['message'] = text_output($message);
								}
							}
							else
							{
								/* build the insert array */
								$insert_array = array(
									'post_authors' => $authors_string,
									'post_authors_users' => $users_string,
									'post_date' => now(),
									'post_title' => $title,
									'post_content' => $content,
									'post_tags' => $tags,
									'post_status' => 'saved',
									'post_timeline' => $timeline,
									'post_location' => $location,
									'post_mission' => $mission,
									'post_saved' => $this->session->userdata('main_char')
								);
								
								/* do the insert */
								$insert = $this->posts->create_mission_entry($insert_array);
								
								/* grab the insert id */
								$insert_id = $this->db->insert_id();
								
								/* optimize the table */
								$this->sys->optimize_table('posts');
								
								if ($insert > 0)
								{
									$message = sprintf(
										lang('flash_success'),
										ucfirst(lang('global_missionpost')),
										lang('actions_saved'),
										($illegalpost === TRUE) ? ' '. lang('error_illegal_post') : ''
									);
	
									$flash['status'] = 'success';
									$flash['message'] = text_output($message);
								}
								else
								{
									$message = sprintf(
										lang('flash_failure'),
										ucfirst(lang('global_missionpost')),
										lang('actions_saved'),
										($illegalpost === TRUE) ? ' '. lang('error_illegal_post') : ''
									);
	
									$flash['status'] = 'error';
									$flash['message'] = text_output($message);
								}
								
								/* add a quick redirect */
								$this->template->add_redirect('write/missionpost/'. $insert_id);
							}
							
							if (count($author_array_final) > 1)
							{ /* only send the saved notification if there's more than one author */
								/* set the array of data for the email */
								$email_data = array(
									'authors' => $authors_string,
									'title' => $title,
									'timeline' => $timeline,
									'location' => $location,
									'content' => $content,
									'mission' => $this->mis->get_mission($mission, 'mission_title')
								);
								
								/* send the email */
								$email = ($this->options['system_email'] == 'on') ? $this->_email('post_save', $email_data) : FALSE;
							}
							
							/* reset the fields if everything worked */
							$content = FALSE;
							$title = FALSE;
							$tags = FALSE;
							$timeline = FALSE;
							$location = FALSE;
							$mission = FALSE;
						break;
							
						case 'post':
							/* check the moderation status */
							$status = $this->user->checking_moderation('post', $authors_string);
							
							if ($id !== FALSE)
							{ /* if there is an ID, it is a previously saved post */
								$update_array = array(
									'post_authors' => $authors_string,
									'post_authors_users' => $users_string,
									'post_date' => now(),
									'post_title' => $title,
									'post_content' => $content,
									'post_tags' => $tags,
									'post_status' => $status,
									'post_timeline' => $timeline,
									'post_location' => $location,
									'post_mission' => $mission,
									'post_saved' => $this->session->userdata('main_char')
								);
								
								/* do the update */
								$update = $this->posts->update_post($id, $update_array);
								
								if ($update > 0)
								{
									$string = explode(',', $authors_string);
									
									foreach ($string as $s)
									{
										$userid = $this->char->get_character($s, 'user');
										
										$array = array('last_post' => now());
										$this->user->update_user($userid, $array);
										$this->char->update_character($s, $array);
									}
									
									$message = sprintf(
										lang('flash_success'),
										ucfirst(lang('global_missionpost')),
										lang('actions_posted'),
										''
									);
	
									$flash['status'] = 'success';
									$flash['message'] = text_output($message);
									
									/* set the array of data for the email */
									$email_data = array(
										'authors' => $authors_string,
										'title' => $title,
										'timeline' => $timeline,
										'location' => $location,
										'content' => $content,
										'mission' => $this->mis->get_mission($mission, 'mission_title')
									);
									
									if ($status == 'pending')
									{
										/* send the email */
										$email = ($this->options['system_email'] == 'on') ? $this->_email('post_pending', $email_data) : FALSE;
									}
									else
									{
										/* send the email */
										$email = ($this->options['system_email'] == 'on') ? $this->_email('post', $email_data) : FALSE;
									}
								}
								else
								{
									$message = sprintf(
										lang('flash_failure'),
										ucfirst(lang('global_missionpost')),
										lang('actions_posted'),
										''
									);
	
									$flash['status'] = 'error';
									$flash['message'] = text_output($message);
								}
							}
							else
							{
								/* build the insert array */
								$insert_array = array(
									'post_authors' => $authors_string,
									'post_authors_users' => $users_string,
									'post_date' => now(),
									'post_title' => $title,
									'post_content' => $content,
									'post_tags' => $tags,
									'post_status' => $status,
									'post_timeline' => $timeline,
									'post_location' => $location,
									'post_mission' => $mission
								);
								
								/* do the insert */
								$insert = $this->posts->create_mission_entry($insert_array);
								
								if ($insert > 0)
								{
									$string = explode(',', $authors_string);
									
									foreach ($string as $s)
									{
										$userid = $this->char->get_character($s, 'user');
										
										$array = array('last_post' => now());
										$this->user->update_user($userid, $array);
										$this->char->update_character($s, $array);
									}
									
									$message = sprintf(
										lang('flash_success'),
										ucfirst(lang('global_missionpost')),
										lang('actions_posted'),
										''
									);
	
									$flash['status'] = 'success';
									$flash['message'] = text_output($message);
									
									/* set the array of data for the email */
									$email_data = array(
										'authors' => $authors_string,
										'title' => $title,
										'timeline' => $timeline,
										'location' => $location,
										'content' => $content,
										'mission' => $this->mis->get_mission($mission, 'mission_title')
									);
									
									if ($status == 'pending')
									{
										/* send the email */
										$email = ($this->options['system_email'] == 'on') ? $this->_email('post_pending', $email_data) : FALSE;
									}
									else
									{
										/* send the email */
										$email = ($this->options['system_email'] == 'on') ? $this->_email('post', $email_data) : FALSE;
									}
									
									/* reset the fields if everything worked */
									$content = FALSE;
									$title = FALSE;
									$tags = FALSE;
									$timeline = FALSE;
									$location = FALSE;
								}
								else
								{
									$message = sprintf(
										lang('flash_failure'),
										ucfirst(lang('global_missionpost')),
										lang('actions_posted'),
										''
									);
	
									$flash['status'] = 'error';
									$flash['message'] = text_output($message);
								}
							}
						break;
							
						default:
							$flash['status'] = 'error';
							$flash['message'] = lang_output('error_generic', '');
						break;
					}
					
					// set the location of the flash view
					$flashloc = view_location('flash', $this->skin, 'admin');
					
					// write everything to the template
					$this->template->write_view('flash_message', $flashloc, $flash);
				}
			}
		}
		
		/* grab all the characters */
		$all = $this->char->get_all_characters('user_npc');
		
		/* get the current missions */
		$missions = $this->mis->get_all_missions('current');
		
		if ($all->num_rows() > 0)
		{
			foreach ($all->result() as $a)
			{
				if (in_array($a->charid, $this->session->userdata('characters')))
				{
					$label = ucwords(lang('labels_my') .' '. lang('global_characters'));
				}
				else
				{
					if ($a->crew_type == 'active' || $a->crew_type == 'npc')
					{
						if ($a->crew_type == 'active' && !in_array($a->charid, $this->session->userdata('characters')))
						{
							$label = ucwords(lang('status_playing') .' '. lang('global_characters'));
						}
						else
						{
							if ($a->user > 0)
							{
								$label = ucwords(lang('labels_linked') .' '. lang('abbr_npcs'));
							}
							else
							{
								$label = ucwords(lang('labels_unlinked') .' '. lang('abbr_npcs'));
							}
						}
					}
				}
				
				/* toss them in the array */
				$allchars[$label][$a->charid] = $this->char->get_character_name($a->charid, TRUE);
			}
			
			$data['all'] = array(
				0 => ucwords(lang('labels_please') .' '. lang('actions_select') .' '. lang('labels_an') .' '. lang('labels_author')),
			);
			
			$key = ucwords(lang('labels_my') .' '. lang('global_characters'));
			if (isset($allchars[$key]))
			{
				$data['all'][$key] = $allchars[$key];
			}
			
			$key = ucwords(lang('status_playing') .' '. lang('global_characters'));
			if (isset($allchars[$key]))
			{
				$data['all'][$key] = $allchars[$key];
			}
			
			$key = ucwords(lang('labels_linked') .' '. lang('abbr_npcs'));
			if (isset($allchars[$key]))
			{
				$data['all'][$key] = $allchars[$key];
			}
			
			$key = ucwords(lang('labels_unlinked') .' '. lang('abbr_npcs'));
			if (isset($allchars[$key]))
			{
				$data['all'][$key] = $allchars[$key];
			}
		}
		else
		{
			$data['all'] = FALSE;
		}
		
		/* build the remove image */
		$remove = array(
			'src' => img_location('minus-circle.png', $this->skin, 'admin'),
			'class' => 'image fontSmall inline_img_left',
			'alt' => ucfirst(lang('actions_remove'))
		);
		
		/* prep the data for sending to the js view */
		$js_data['remove'] = img($remove);
		
		/* get the data if it is not a new PM */
		$row = ($id !== FALSE) ? $this->posts->get_post($id) : FALSE;
		
		if ($row !== FALSE)
		{ /* make sure the info object exists */
			$valid = array();
			
			foreach ($this->session->userdata('characters') as $check)
			{
				if (strstr($row->post_authors, $check) === FALSE)
				{
					$valid[] = FALSE;
				}
				else
				{
					$valid[] = TRUE;
				}
			}
			
			if (!in_array(TRUE, $valid))
			{ /* sorry, you aren't one of the others, so you have to leave */
				redirect('admin/error/4');
			}
			
			if (!isset($action) && ($row->post_status == 'pending' || $row->post_status == 'activated'))
			{ /* sorry, if the item is pending or activated, you're not allowed here */
				redirect('admin/error/5');
			}
			
			/* set the hidden TO field */
			$data['to'] = $row->post_authors;
			
			/* send an array to the js view for disabling items in the list */
			$js_data['replyall'] = explode(',', $data['to']);
			
			/* set the recipients list */
			$to_array = explode(',', $data['to']);
			
			$i = 1;
			foreach ($to_array as $value)
			{
				$to_name = $this->char->get_character_name($value, TRUE);
				
				$data['recipient_list'][$i] = '<span class="'. $value .'">';
				$data['recipient_list'][$i].= '<a href="#" id="remove_author" class="image" myID="'. $value .'" myName="'.  $to_name .'">';
				$data['recipient_list'][$i].= img($remove) .'</a>';
				$data['recipient_list'][$i].= $to_name .'<br /></span>';
				
				++$i;
			}
			
			/* fill the content in */
			$title = $row->post_title;
			$content = $row->post_content;
			$tags = $row->post_tags;
			$timeline = $row->post_timeline;
			$location = $row->post_location;
		}
		
		/* set the data used by the view */
		$data['inputs'] = array(
			'title' => array(
				'name' => 'title',
				'id' => 'title',
				'value' => $title),
			'content' => array(
				'name' => 'content',
				'id' => 'content',
				'rows' => 20,
				'value' => $content),
			'tags' => array(
				'name' => 'tags',
				'id' => 'tags',
				'value' => $tags),
			'timeline' => array(
				'name' => 'timeline',
				'id' => 'timeline',
				'value' => $timeline),
			'location' => array(
				'name' => 'location',
				'id' => 'location',
				'value' => $location),
			'mission' => ($id !== FALSE && $row !== FALSE) ? $row->post_mission : FALSE,
			'post' => array(
				'type' => 'submit',
				'class' => 'button-main',
				'name' => 'submit',
				'value' => 'post',
				'id' => 'submitPost',
				'content' => ucwords(lang('actions_post'))),
			'save' => array(
				'type' => 'submit',
				'class' => 'button-sec',
				'name' => 'submit',
				'value' => 'save',
				'content' => ucwords(lang('actions_save'))),
			'delete' => array(
				'type' => 'submit',
				'class' => 'button-sec',
				'name' => 'submit',
				'value' => 'delete',
				'id' => 'submitDelete',
				'content' => ucwords(lang('actions_delete')))
		);
		
		if ($missions->num_rows() > 0)
		{
			if ($missions->num_rows() > 1)
			{
				foreach ($missions->result() as $mission)
				{
					$data['missions'][$mission->mission_id] = $mission->mission_title;
					$data['mission_notes'][$mission->mission_id]['title'] = $mission->mission_title;
					$data['mission_notes'][$mission->mission_id]['notes'] = $mission->mission_notes;
				}
				
				$js_data['missionCount'] = $missions->num_rows();
			}
			else
			{
				$row = $missions->row();
				
				$data['mission']['id'] = $row->mission_id;
				$data['mission']['title'] = $row->mission_title;
				$data['mission']['notes'] = $row->mission_notes;
				
				$js_data['missionCount'] = 1;
			}
		}
		else
		{
			$data['missions'] = FALSE;
			$data['inputs']['post']['disabled'] = 'yes';
			$data['inputs']['save']['disabled'] = 'yes';
			$data['inputs']['delete']['disabled'] = 'yes';
			
			$js_data['missionCount'] = 0;
		}
		
		$js_data['authorized'] = $this->auth->check_access('manage/missions', FALSE);
		
		$nomission = sprintf(
			lang('error_no_mission_fail'),
			lang('global_missions'),
			lang('global_missionpost'),
			anchor('manage/missions', lang('global_mission'))
		);
		
		/* set the header */
		$data['header'] = ucwords(lang('actions_write') .' '. lang('global_missionpost'));
		
		/* set the form location */
		$data['form_action'] = ($id !== FALSE) ? 'write/missionpost/'. $id : 'write/missionpost';
		
		$data['label'] = array(
			'addauthor' => ucwords(lang('actions_add') .' '. lang('labels_author')),
			'authors' => ucfirst(lang('labels_authors')),
			'content' => ucfirst(lang('labels_content')),
			'location' => ucfirst(lang('labels_location')),
			'mission' => ucfirst(lang('global_mission')),
			'mission_notes' => ucwords(lang('global_mission') .' '. lang('labels_notes')),
			'myauthor' => ucwords(lang('labels_my') .' '. lang('labels_author')),
			'no_mission' => $nomission,
			'otherauthors' => ucwords(lang('labels_other') .' '. lang('labels_authors')),
			'showhide' => ucfirst(lang('actions_show')) .'/'. ucfirst(lang('actions_hide')),
			'tags' => ucfirst(lang('labels_tags')),
			'tags_sep' => lang('tags_separated'),
			'timeline' => ucfirst(lang('labels_timeline')),
			'title' => ucfirst(lang('labels_title')),
		);
		
		/* figure out where the view files should be coming from */
		$view_loc = view_location('write_missionpost', $this->skin, 'admin');
		$js_loc = js_location('write_missionpost_js', $this->skin, 'admin');
		
		/* write the data to the template */
		$this->template->write_view('content', $view_loc, $data);
		$this->template->write_view('javascript', $js_loc, $js_data);
		$this->template->write('title', $data['header']);
		
		/* render the template */
		$this->template->render();
	}
	
	function newsitem()
	{
		/* check access */
		$this->auth->check_access();
		
		/* load the models */
		$this->load->model('news_model', 'news');
		
		if ($this->options['system_email'] == 'off')
		{
			$flash['status'] = 'info';
			$flash['message'] = lang_output('flash_system_email_off');
			
			// set the location of the flash view
			$flashloc = view_location('flash', $this->skin, 'admin');
			
			// write everything to the template
			$this->template->write_view('flash_message', $flashloc, $flash);
		}
		
		/* set the variables */
		$id = $this->uri->segment(3, FALSE, TRUE);
		$data['key'] = array('private' => 'n', 'cat' => 0);
		$content = FALSE;
		$title = FALSE;
		$tags = FALSE;
		$private = FALSE;
		
		if (isset($_POST['submit']))
		{
			/* define the POST variables */
			$title = $this->input->post('title', TRUE);
			$content = $this->input->post('content', TRUE);
			$author = $this->input->post('author', TRUE);
			$tags = $this->input->post('tags', TRUE);
			$action = strtolower($this->input->post('submit', TRUE));
			$category = $this->input->post('newscat', TRUE);
			$private = $this->input->post('private', TRUE);
			$status = FALSE;
			$flash = FALSE;
			
			switch ($action)
			{
				case 'delete':
					/* get the log information */
					$row = $this->news->get_news_item($id);
					
					if ($row !== FALSE)
					{
						if ($row->news_status == 'saved' &&
								$row->news_author_user == $this->session->userdata('userid'))
						{
							/* delete the log */
							$delete = $this->news->delete_news_item($id);
							
							if ($delete > 0)
							{
								$message = sprintf(
									lang('flash_success'),
									ucfirst(lang('global_newsitem')),
									lang('actions_deleted'),
									''
								);

								$flash['status'] = 'success';
								$flash['message'] = text_output($message);
							}
							else
							{
								$message = sprintf(
									lang('flash_failure'),
									ucfirst(lang('global_newsitem')),
									lang('actions_deleted'),
									''
								);

								$flash['status'] = 'error';
								$flash['message'] = text_output($message);
							}
						}
						else
						{
							redirect('admin/error/4');
						}
						
						/* add an automatic redirect */
						$this->template->add_redirect('write/index');
					}
				break;
					
				case 'save':
					if ($id !== FALSE)
					{ /* if there is an ID, it is a previously saved post */
						$update_array = array(
							'news_author_user' => $this->session->userdata('userid'),
							'news_author_character' => $this->session->userdata('main_char'),
							'news_date' => now(),
							'news_title' => $title,
							'news_content' => $content,
							'news_tags' => $tags,
							'news_status' => 'saved',
							'news_cat' => $category,
							'news_private' => $private
						);
						
						/* do the update */
						$update = $this->news->update_news_item($id, $update_array);
						
						if ($update > 0)
						{
							$message = sprintf(
								lang('flash_success'),
								ucfirst(lang('global_newsitem')),
								lang('actions_saved'),
								''
							);

							$flash['status'] = 'success';
							$flash['message'] = text_output($message);
						}
						else
						{
							$message = sprintf(
								lang('flash_failure'),
								ucfirst(lang('global_newsitem')),
								lang('actions_saved'),
								''
							);

							$flash['status'] = 'error';
							$flash['message'] = text_output($message);
						}
					}
					else
					{
						/* build the insert array */
						$insert_array = array(
							'news_author_user' => $this->session->userdata('userid'),
							'news_author_character' => $this->session->userdata('main_char'),
							'news_date' => now(),
							'news_title' => $title,
							'news_content' => $content,
							'news_tags' => $tags,
							'news_status' => 'saved',
							'news_cat' => $category,
							'news_private' => $private
						);
						
						/* do the insert */
						$insert = $this->news->create_news_item($insert_array);
						
						/* grab the insert id */
						$insert_id = $this->db->insert_id();
						
						/* optimize the table */
						$this->sys->optimize_table('news');
						
						if ($insert > 0)
						{
							$message = sprintf(
								lang('flash_success'),
								ucfirst(lang('global_newsitem')),
								lang('actions_saved'),
								''
							);

							$flash['status'] = 'success';
							$flash['message'] = text_output($message);
							
							/* reset the fields if everything worked */
							$content = FALSE;
							$title = FALSE;
							$tags = FALSE;
							$data['key'] = array('private' => 'n', 'cat' => 0);
						}
						else
						{
							$message = sprintf(
								lang('flash_failure'),
								ucfirst(lang('global_newsitem')),
								lang('actions_saved'),
								''
							);

							$flash['status'] = 'error';
							$flash['message'] = text_output($message);
						}
						
						/* add a quick redirect */
						$this->template->add_redirect('write/newsitem/'. $insert_id);
					}
				break;
					
				case 'post':
					/* check the moderation status */
					$status = $this->user->checking_moderation('news', $this->session->userdata('userid'));
					
					if ($id !== FALSE)
					{ /* if there is an ID, it is a previously saved post */
						$update_array = array(
							'news_author_user' => $this->session->userdata('userid'),
							'news_author_character' => $this->session->userdata('main_char'),
							'news_date' => now(),
							'news_title' => $title,
							'news_content' => $content,
							'news_tags' => $tags,
							'news_status' => $status,
							'news_cat' => $category,
							'news_private' => $private
						);
						
						/* do the update */
						$update = $this->news->update_news_item($id, $update_array);
						
						if ($update > 0)
						{
							$message = sprintf(
								lang('flash_success'),
								ucfirst(lang('global_newsitem')),
								lang('actions_posted'),
								''
							);

							$flash['status'] = 'success';
							$flash['message'] = text_output($message);
							
							/* set the array of data for the email */
							$email_data = array(
								'author' => $this->session->userdata('main_char'),
								'title' => $title,
								'category' => $this->news->get_news_category($category, 'newscat_name'),
								'content' => $content
							);
							
							if ($status == 'pending')
							{
								/* send the email */
								$email = ($this->options['system_email'] == 'on') ? $this->_email('news_pending', $email_data) : FALSE;
							}
							else
							{
								/* send the email */
								$email = ($this->options['system_email'] == 'on') ? $this->_email('news', $email_data) : FALSE;
							}
						}
						else
						{
							$message = sprintf(
								lang('flash_failure'),
								ucfirst(lang('global_newsitem')),
								lang('actions_posted'),
								''
							);

							$flash['status'] = 'error';
							$flash['message'] = text_output($message);
						}
					}
					else
					{
						/* build the insert array */
						$insert_array = array(
							'news_author_user' => $this->session->userdata('userid'),
							'news_author_character' => $this->session->userdata('main_char'),
							'news_date' => now(),
							'news_title' => $title,
							'news_content' => $content,
							'news_tags' => $tags,
							'news_status' => $status,
							'news_cat' => $category,
							'news_private' => $private
						);
						
						/* do the insert */
						$insert = $this->news->create_news_item($insert_array);
						
						if ($insert > 0)
						{
							$message = sprintf(
								lang('flash_success'),
								ucfirst(lang('global_newsitem')),
								lang('actions_posted'),
								''
							);

							$flash['status'] = 'success';
							$flash['message'] = text_output($message);
							
							/* set the array of data for the email */
							$email_data = array(
								'author' => $this->session->userdata('main_char'),
								'title' => $title,
								'category' => $this->news->get_news_category($category, 'newscat_name'),
								'content' => $content
							);
							
							if ($status == 'pending')
							{
								/* send the email */
								$email = ($this->options['system_email'] == 'on') ? $this->_email('news_pending', $email_data) : FALSE;
							}
							else
							{
								/* send the email */
								$email = ($this->options['system_email'] == 'on') ? $this->_email('news', $email_data) : FALSE;
							}
							
							/* reset the fields if everything worked */
							$content = FALSE;
							$title = FALSE;
							$tags = FALSE;
							$data['key'] = array('private' => 'n', 'cat' => 0);
						}
						else
						{
							$message = sprintf(
								lang('flash_failure'),
								ucfirst(lang('global_newsitem')),
								lang('actions_posted'),
								''
							);

							$flash['status'] = 'error';
							$flash['message'] = text_output($message);
						}
					}
				break;
					
				default:
					$flash['status'] = 'error';
					$flash['message'] = lang_output('error_generic', '');
				break;
			}
			
			// set the location of the flash view
			$flashloc = view_location('flash', $this->skin, 'admin');
			
			// write everything to the template
			$this->template->write_view('flash_message', $flashloc, $flash);
		}
		
		/* set the ID and name */
		$data['character']['id'] = $this->session->userdata('main_char');
		$data['character']['name'] = $this->char->get_character_name($this->session->userdata('main_char'), TRUE);
		
		/* get the data */
		$row = ($id !== FALSE) ? $this->news->get_news_item($id) : FALSE;
		
		if ($row !== FALSE)
		{
			if ($row->news_author_user != $this->session->userdata('userid'))
			{ /* sorry, if you aren't the author, you're not allowed here */
				redirect('admin/error/4');
			}
			
			if (!isset($action) && ($row->news_status == 'pending' || $row->news_status == 'activated'))
			{ /* sorry, if the item is pending or activated, you're not allowed here */
				redirect('admin/error/5');
			}
			
			/* fill the content in */
			$title = $row->news_title;
			$content = $row->news_content;
			$tags = $row->news_tags;
			$data['key']['cat'] = $row->news_cat;
			$data['key']['private'] = $row->news_private;
		}
		
		/* set the data used by the view */
		$data['inputs'] = array(
			'title' => array(
				'name' => 'title',
				'id' => 'title',
				'value' => $title),
			'content' => array(
				'name' => 'content',
				'id' => 'content',
				'rows' => 20,
				'value' => $content),
			'tags' => array(
				'name' => 'tags',
				'id' => 'tags',
				'value' => $tags),
			'post' => array(
				'type' => 'submit',
				'class' => 'button-main',
				'name' => 'submit',
				'value' => 'post',
				'id' => 'submitPost',
				'content' => ucwords(lang('actions_post'))),
			'save' => array(
				'type' => 'submit',
				'class' => 'button-sec',
				'name' => 'submit',
				'value' => 'save',
				'content' => ucwords(lang('actions_save'))),
			'delete' => array(
				'type' => 'submit',
				'class' => 'button-sec',
				'name' => 'submit',
				'value' => 'delete',
				'id' => 'submitDelete',
				'content' => ucwords(lang('actions_delete')))
		);
		
		/* values */
		$data['values']['private'] = array(
			'n' => 'Public',
			'y' => 'Private'
		);
		
		/* grab the categories */
		$cats = $this->news->get_news_categories();
		
		if ($cats->num_rows() > 0)
		{ /* throw the categories into the values array */
			foreach ($cats->result() as $cat)
			{
				$data['values']['category'][$cat->newscat_id] = $cat->newscat_name;
			}
		}
		
		/* set the header */
		$data['header'] = ucwords(lang('actions_write') .' '. lang('global_newsitem'));
		
		/* set the form location */
		$data['form_action'] = ($id !== FALSE) ? 'write/newsitem/'. $id : 'write/newsitem';
		
		$data['label'] = array(
			'author' => ucfirst(lang('labels_author')),
			'category' => ucfirst(lang('labels_category')),
			'content' => ucfirst(lang('labels_content')),
			'tags' => ucfirst(lang('labels_tags')),
			'tags_sep' => lang('tags_separated'),
			'title' => ucfirst(lang('labels_title')),
			'type' => ucfirst(lang('labels_type')),
		);
		
		/* figure out where the view files should be coming from */
		$view_loc = view_location('write_newsitem', $this->skin, 'admin');
		$js_loc = js_location('write_newsitem_js', $this->skin, 'admin');
		
		/* write the data to the template */
		$this->template->write_view('content', $view_loc, $data);
		$this->template->write_view('javascript', $js_loc);
		$this->template->write('title', $data['header']);
		
		/* render the template */
		$this->template->render();
	}
	
	function personallog()
	{
		/* check access */
		$this->auth->check_access();
		
		/* load the models */
		$this->load->model('personallogs_model', 'logs');
		
		if ($this->options['system_email'] == 'off')
		{
			$flash['status'] = 'info';
			$flash['message'] = lang_output('flash_system_email_off');
			
			// set the location of the flash view
			$flashloc = view_location('flash', $this->skin, 'admin');
			
			// write everything to the template
			$this->template->write_view('flash_message', $flashloc, $flash);
		}
		
		/* set the variables */
		$id = $this->uri->segment(3, FALSE, TRUE);
		$data['key'] = '';
		$content = FALSE;
		$title = FALSE;
		$tags = FALSE;
		
		if (isset($_POST['submit']))
		{
			/* define the POST variables */
			$title = $this->input->post('title', TRUE);
			$content = $this->input->post('content', TRUE);
			$author = $this->input->post('author', TRUE);
			$tags = $this->input->post('tags', TRUE);
			$action = strtolower($this->input->post('submit', TRUE));
			$status = FALSE;
			$flash = FALSE;
			
			if ($author == 0)
			{
				$flash['status'] = 'error';
				$flash['message'] = lang_output('flash_personallogs_no_author');
				
				// set the location of the flash view
				$flashloc = view_location('flash', $this->skin, 'admin');
				
				// write everything to the template
				$this->template->write_view('flash_message', $flashloc, $flash);
			}
			else
			{
				switch ($action)
				{
					case 'delete':
						/* get the log information */
						$row = $this->logs->get_log($id);
						
						if ($row !== FALSE)
						{
							if ($row->log_status == 'saved' &&
									$row->log_author_user == $this->session->userdata('userid'))
							{
								/* delete the log */
								$delete = $this->logs->delete_log($id);
								
								if ($delete > 0)
								{
									$message = sprintf(
										lang('flash_success'),
										ucfirst(lang('global_personallog')),
										lang('actions_deleted'),
										''
									);

									$flash['status'] = 'success';
									$flash['message'] = text_output($message);
								}
								else
								{
									$message = sprintf(
										lang('flash_failure'),
										ucfirst(lang('global_personallog')),
										lang('actions_deleted'),
										''
									);

									$flash['status'] = 'error';
									$flash['message'] = text_output($message);
								}
							}
							else
							{
								redirect('admin/error/4');
							}
							
							/* add an automatic redirect */
							$this->template->add_redirect('write/index');
						}
					break;
						
					case 'save':
						if ($id !== FALSE)
						{ /* if there is an ID, it is a previously saved post */
							$update_array = array(
								'log_author_user' => $this->session->userdata('userid'),
								'log_author_character' => $author,
								'log_title' => $title,
								'log_content' => $content,
								'log_tags' => $tags,
								'log_status' => 'saved',
								'log_last_update' => now(),
								'log_date' => now(),
							);
							
							/* do the update */
							$update = $this->logs->update_log($id, $update_array);
							
							if ($update > 0)
							{
								$message = sprintf(
									lang('flash_success'),
									ucfirst(lang('global_personallog')),
									lang('actions_saved'),
									''
								);

								$flash['status'] = 'success';
								$flash['message'] = text_output($message);
							}
							else
							{
								$message = sprintf(
									lang('flash_failure'),
									ucfirst(lang('global_personallog')),
									lang('actions_saved'),
									''
								);

								$flash['status'] = 'error';
								$flash['message'] = text_output($message);
							}
						}
						else
						{
							/* build the insert array */
							$insert_array = array(
								'log_author_user' => $this->session->userdata('userid'),
								'log_author_character' => $author,
								'log_title' => $title,
								'log_content' => $content,
								'log_tags' => $tags,
								'log_status' => 'saved',
								'log_last_update' => now(),
								'log_date' => now(),
							);
							
							/* do the insert */
							$insert = $this->logs->create_personal_log($insert_array);
							
							/* grab the insert id */
							$insert_id = $this->db->insert_id();
							
							/* optimize the table */
							$this->sys->optimize_table('personallogs');
							
							if ($insert > 0)
							{
								$message = sprintf(
									lang('flash_success'),
									ucfirst(lang('global_personallog')),
									lang('actions_saved'),
									''
								);

								$flash['status'] = 'success';
								$flash['message'] = text_output($message);
								
								/* reset the fields if everything worked */
								$content = FALSE;
								$title = FALSE;
								$tags = FALSE;
							}
							else
							{
								$message = sprintf(
									lang('flash_failure'),
									ucfirst(lang('global_personallog')),
									lang('actions_saved'),
									''
								);

								$flash['status'] = 'error';
								$flash['message'] = text_output($message);
							}
							
							/* add a quick redirect */
							$this->template->add_redirect('write/personallog/'. $insert_id);
						}
					break;
						
					case 'post':
						/* check the moderation status */
						$status = $this->user->checking_moderation('log', $this->session->userdata('userid'));
						
						if ($id !== FALSE)
						{ /* if there is an ID, it is a previously saved post */
							$update_array = array(
								'log_author_user' => $this->session->userdata('userid'),
								'log_author_character' => $author,
								'log_date' => now(),
								'log_title' => $title,
								'log_content' => $content,
								'log_tags' => $tags,
								'log_status' => $status,
								'log_last_update' => now()
							);
							
							/* do the update */
							$update = $this->logs->update_log($id, $update_array);
							
							if ($update > 0)
							{
								$array = array('last_post' => now());
								$this->user->update_user($this->session->userdata('userid'), $array);
								$this->char->update_character($author, $array);
								
								$message = sprintf(
									lang('flash_success'),
									ucfirst(lang('global_personallog')),
									lang('actions_posted'),
									''
								);

								$flash['status'] = 'success';
								$flash['message'] = text_output($message);
								
								/* set the array of data for the email */
								$email_data = array(
									'author' => $author,
									'title' => $title,
									'content' => $content
								);
								
								if ($status == 'pending')
								{
									/* send the email */
									$email = ($this->options['system_email'] == 'on') ? $this->_email('log_pending', $email_data) : FALSE;
								}
								else
								{
									/* send the email */
									$email = ($this->options['system_email'] == 'on') ? $this->_email('log', $email_data) : FALSE;
								}
							}
							else
							{
								$message = sprintf(
									lang('flash_failure'),
									ucfirst(lang('global_personallog')),
									lang('actions_posted'),
									''
								);

								$flash['status'] = 'error';
								$flash['message'] = text_output($message);
							}
						}
						else
						{
							/* build the insert array */
							$insert_array = array(
								'log_author_user' => $this->session->userdata('userid'),
								'log_author_character' => $author,
								'log_date' => now(),
								'log_title' => $title,
								'log_content' => $content,
								'log_tags' => $tags,
								'log_status' => $status,
								'log_last_update' => now()
							);
							
							/* do the insert */
							$insert = $this->logs->create_personal_log($insert_array);
							
							if ($insert > 0)
							{
								$array = array('last_post' => now());
								$this->user->update_user($this->session->userdata('userid'), $array);
								$this->char->update_character($author, $array);
								
								$message = sprintf(
									lang('flash_success'),
									ucfirst(lang('global_personallog')),
									lang('actions_posted'),
									''
								);

								$flash['status'] = 'success';
								$flash['message'] = text_output($message);
								
								/* set the array of data for the email */
								$email_data = array(
									'author' => $author,
									'title' => $title,
									'content' => $content
								);
								
								if ($status == 'pending')
								{
									/* send the email */
									$email = ($this->options['system_email'] == 'on') ? $this->_email('log_pending', $email_data) : FALSE;
								}
								else
								{
									/* send the email */
									$email = ($this->options['system_email'] == 'on') ? $this->_email('log', $email_data) : FALSE;
								}
								
								/* reset the fields if everything worked */
								$content = FALSE;
								$title = FALSE;
								$tags = FALSE;
							}
							else
							{
								$message = sprintf(
									lang('flash_failure'),
									ucfirst(lang('global_personallog')),
									lang('actions_posted'),
									''
								);

								$flash['status'] = 'error';
								$flash['message'] = text_output($message);
							}
						}
					break;
						
					default:
						$flash['status'] = 'error';
						$flash['message'] = lang_output('error_generic', '');
					break;
				}
				
				// set the location of the flash view
				$flashloc = view_location('flash', $this->skin, 'admin');
				
				// write everything to the template
				$this->template->write_view('flash_message', $flashloc, $flash);
			}
		}
		
		/* run the methods */
		$char = $this->session->userdata('characters');
		
		if (count($char) > 1)
		{ /* only continue if there's more than 1 character in the array */
			$data['characters'][0] = ucwords(lang('labels_please') .' '. lang('actions_select')
				.' '. lang('labels_an') .' '. lang('labels_author'));
			
			foreach ($char as $item)
			{ /* loop through all the characters */
				$type = $this->char->get_character($item, 'crew_type');
				
				if ($type == 'active' || $type == 'npc')
				{ /* split the characters out between active and npcs */
					if ($type == 'active')
					{
						$label = ucwords(lang('status_playing') .' '. lang('global_characters'));
					}
					else
					{
						$label = ucwords(lang('abbr_npcs'));
					}
					
					/* toss them in the array */
					$data['characters'][$label][$item] = $this->char->get_character_name($item, TRUE);
				}
			}
		}
		else
		{
			/* set the ID and name */
			$data['character']['id'] = $char[0];
			$data['character']['name'] = $this->char->get_character_name($char[0], TRUE);
		}
		
		/* get the data if it is not a new PM */
		$row = ($id !== FALSE) ? $this->logs->get_log($id) : FALSE;
		
		if ($row !== FALSE)
		{
			if ($row->log_author_user != $this->session->userdata('userid'))
			{ /* sorry, if you aren't the author, you're not allowed here */
				redirect('admin/error/4');
			}
			
			if (!isset($action) && ($row->log_status == 'pending' || $row->log_status == 'activated'))
			{ /* sorry, if the item is pending or activated, you're not allowed here */
				redirect('admin/error/5');
			}
			
			/* fill the content in */
			$title = $row->log_title;
			$content = $row->log_content;
			$tags = $row->log_tags;
		
			/* set the key in prep for searching */
			$data['key'] = 0;
			
			if (isset($data['characters']) && $data['key'] == 0)
			{ /* if there are multiple characters and the key hasn't been set already */
				foreach ($data['characters'] as $a)
				{ /* go through each part of the array */
					if (is_array($a))
					{ /* make sure the item is an array and then look for the author in that array */
						$data['key'] = (array_key_exists($row->log_author_character, $a)) ? $row->log_author_character : 0;
					}
				}
			}
		}
		
		/* set the data used by the view */
		$data['inputs'] = array(
			'title' => array(
				'name' => 'title',
				'id' => 'title',
				'value' => $title),
			'content' => array(
				'name' => 'content',
				'id' => 'content',
				'rows' => 20,
				'value' => $content),
			'tags' => array(
				'name' => 'tags',
				'id' => 'tags',
				'value' => $tags),
			'post' => array(
				'type' => 'submit',
				'class' => 'button-main',
				'name' => 'submit',
				'value' => 'post',
				'id' => 'submitPost',
				'content' => ucwords(lang('actions_post'))),
			'save' => array(
				'type' => 'submit',
				'class' => 'button-sec',
				'name' => 'submit',
				'value' => 'save',
				'content' => ucwords(lang('actions_save'))),
			'delete' => array(
				'type' => 'submit',
				'class' => 'button-sec',
				'name' => 'submit',
				'value' => 'delete',
				'id' => 'submitDelete',
				'content' => ucwords(lang('actions_delete')))
		);
		
		/* set the header */
		$data['header'] = ucwords(lang('actions_write') .' '. lang('global_personallog'));
		
		/* set the form location */
		$data['form_action'] = ($id !== FALSE) ? 'write/personallog/'. $id : 'write/personallog';
		
		$data['label'] = array(
			'author' => ucwords(lang('labels_author')),
			'content' => ucwords(lang('labels_content')),
			'tags' => ucwords(lang('labels_tags')),
			'tags_sep' => lang('tags_separated'),
			'title' => ucwords(lang('labels_title')),
		);
		
		/* figure out where the view files should be coming from */
		$view_loc = view_location('write_personallog', $this->skin, 'admin');
		$js_loc = js_location('write_personallog_js', $this->skin, 'admin');
		
		/* write the data to the template */
		$this->template->write_view('content', $view_loc, $data);
		$this->template->write_view('javascript', $js_loc);
		$this->template->write('title', $data['header']);
		
		/* render the template */
		$this->template->render();
	}
	
	function _email($type = '', $data = '')
	{
		/* load the libraries */
		$this->load->library('email');
		$this->load->library('parser');
		
		/* define the variables */
		$email = FALSE;
		
		switch ($type)
		{
			case 'news':
				/* set some variables */
				$from_name = $this->char->get_character_name($data['author'], TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $data['author']);
				$subject = $data['category'] .' - '. $data['title'];
				
				/* set the content */
				$content = sprintf(
					lang('email_content_news_item'),
					$from_name,
					$data['content']
				);
				
				/* set the email data */
				$email_data = array(
					'email_subject' => $subject,
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);
				
				/* where should the email be coming from */
				$em_loc = email_location('write_newsitem', $this->email->mailtype);
				
				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);
				
				/* get the email addresses */
				$emails = $this->user->get_crew_emails(TRUE, 'email_news_items');
				
				/* make a string of email addresses */
				$to = implode(',', $emails);
				
				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. $subject);
				$this->email->message($message);
			break;
				
			case 'news_pending':
				/* set some variables */
				$from_name = $this->char->get_character_name($data['author'], TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $data['author']);
				$subject = $data['category'] .' - '. $data['title'];

				/* set the content */
				$content = sprintf(
					lang('email_content_entry_pending'),
					lang('global_newsitem'),
					$data['title'],
					$from_name,
					lang('global_newsitem'),
					$data['content'],
					lang('global_newsitem'),
					site_url('login/index')
				);

				/* set the email data */
				$email_data = array(
					'email_subject' => $subject,
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);

				/* where should the email be coming from */
				$em_loc = email_location('entry_pending', $this->email->mailtype);

				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);

				/* get the email addresses */
				$emails = $this->user->get_crew_emails(TRUE, 'email_news_items');

				/* make a string of email addresses */
				$to = implode(',', $this->user->get_emails_with_access('manage/news', 2));

				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. lang('email_subject_news_pending'));
				$this->email->message($message);
			break;
				
			case 'log':
				/* set some variables */
				$from_name = $this->char->get_character_name($data['author'], TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $data['author']);
				$subject = $from_name ."'s ". lang('email_subject_personal_log') ." - ". $data['title'];
				
				/* set the content */
				$content = sprintf(
					lang('email_content_personal_log'),
					$from_name,
					$data['content']
				);
				
				/* set the email data */
				$email_data = array(
					'email_subject' => $subject,
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);
				
				/* where should the email be coming from */
				$em_loc = email_location('write_personallog', $this->email->mailtype);
				
				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);
				
				/* get the email addresses */
				$emails = $this->user->get_crew_emails(TRUE, 'email_personal_logs');
				
				/* make a string of email addresses */
				$to = implode(',', $emails);
				
				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. $subject);
				$this->email->message($message);
			break;
				
			case 'log_pending':
				/* set some variables */
				$from_name = $this->char->get_character_name($data['author'], TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $data['author']);
				$subject = $from_name ."'s ". lang('email_subject_personal_log') ." - ". $data['title'];

				/* set the content */
				$content = sprintf(
					lang('email_content_entry_pending'),
					lang('global_personallog'),
					$data['title'],
					$from_name,
					lang('global_personallog'),
					$data['content'],
					lang('global_personallog'),
					site_url('login/index')
				);

				/* set the email data */
				$email_data = array(
					'email_subject' => $subject,
					'email_from' => $from_name,
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);

				/* where should the email be coming from */
				$em_loc = email_location('entry_pending', $this->email->mailtype);

				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);

				/* get the email addresses */
				$to = implode(',', $this->user->get_emails_with_access('manage/logs', 2));

				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. lang('email_subject_log_pending'));
				$this->email->message($message);
			break;
				
			case 'post':
				/* set some variables */
				$subject = $data['mission'] ." - ". $data['title'];
				$mission = lang('email_content_post_mission') . $data['mission'];
				$authors = lang('email_content_post_author') . $this->char->get_authors($data['authors'], TRUE);
				$timeline = lang('email_content_post_timeline') . $data['timeline'];
				$location = lang('email_content_post_location') . $data['location'];
				
				// get an array of authors
				$authorsArr = explode(',', $data['authors']);
				
				// find out what's the same
				$same = array_values(array_intersect($authorsArr, $this->session->userdata('characters')));
				
				// figure out who it should come from
				$from = (in_array($this->session->userdata('main_char'), $same)) ? $this->session->userdata('main_char') : $same[0];
				
				/* set who the email is coming from */
				$from_name = $this->char->get_character_name($from, TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $from);
				
				/* set the content */
				$content = sprintf(
					lang('email_content_mission_post'),
					$authors,
					$mission,
					$location,
					$timeline,
					$data['content']
				);
				
				/* set the email data */
				$email_data = array(
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);
				
				/* where should the email be coming from */
				$em_loc = email_location('write_missionpost', $this->email->mailtype);
				
				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);
				
				/* get the email addresses */
				$emails = $this->user->get_crew_emails(TRUE, 'email_mission_posts');
				
				/* make a string of email addresses */
				$to = implode(',', $emails);
				
				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. $subject);
				$this->email->message($message);
			break;
				
			case 'post_delete':
				/* set some variables */
				$subject = lang('email_subject_deleted_post');

				// get an array of authors
				$authors = explode(',', $data['authors']);
				
				// find out what's the same
				$same = array_values(array_intersect($authors, $this->session->userdata('characters')));
				
				// figure out who it should come from
				$from = (in_array($this->session->userdata('main_char'), $same)) ? $this->session->userdata('main_char') : $same[0];
				
				/* set who the email is coming from */
				$from_name = $this->char->get_character_name($from, TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $from);

				/* set the content */
				$content = sprintf(
					lang('email_content_mission_post_deleted'),
					$data['title'],
					$from_name
				);

				/* set the email data */
				$email_data = array(
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);

				/* where should the email be coming from */
				$em_loc = email_location('write_missionpost_deleted', $this->email->mailtype);

				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);

				/* get the email addresses */
				$emails = $this->char->get_character_emails($data['authors']);

				foreach ($emails as $key => $value)
				{
					$pref = $this->user->get_pref('email_mission_posts_delete', $key);

					if ($pref == 'y')
					{
						/* don't do anything */
					}
					else
					{
						unset($emails[$key]);
					}
				}

				/* make a string of email addresses */
				$to = implode(',', $emails);

				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. $subject);
				$this->email->message($message);
			break;
				
			case 'post_pending':
				// get an array of authors
				$authors = explode(',', $data['authors']);
				
				// find out what's the same
				$same = array_values(array_intersect($authors, $this->session->userdata('characters')));
				
				// figure out who it should come from
				$from = (in_array($this->session->userdata('main_char'), $same)) ? $this->session->userdata('main_char') : $same[0];
				
				/* set who the email is coming from */
				$from_name = $this->char->get_character_name($from, TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $from);
				$subject = $data['mission'] ." - ". $data['title'];

				/* set the content */
				$content = sprintf(
					lang('email_content_entry_pending'),
					lang('global_missionpost'),
					$data['title'],
					$from_name,
					lang('global_missionpost'),
					$data['content'],
					lang('global_missionpost'),
					site_url('login/index')
				);

				/* set the email data */
				$email_data = array(
					'email_subject' => $subject,
					'email_from' => $from_name,
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);

				/* where should the email be coming from */
				$em_loc = email_location('entry_pending', $this->email->mailtype);

				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);

				/* get the email addresses */
				$to = implode(',', $this->user->get_emails_with_access('manage/posts', 2));

				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. lang('email_subject_post_pending'));
				$this->email->message($message);
			break;
				
			case 'post_save':
				/* set some variables */
				$subject = $data['mission'] ." - ". $data['title'] . lang('email_subject_saved_post');
				$mission = lang('email_content_post_mission') . $data['mission'];
				$authors = lang('email_content_post_author') . $this->char->get_authors($data['authors'], TRUE);
				$timeline = lang('email_content_post_timeline') . $data['timeline'];
				$location = lang('email_content_post_location') . $data['location'];
				
				// get an array of authors
				$authorsArr = explode(',', $data['authors']);
				
				// find out what's the same
				$same = array_values(array_intersect($authorsArr, $this->session->userdata('characters')));
				
				// figure out who it should come from
				$from = (in_array($this->session->userdata('main_char'), $same)) ? $this->session->userdata('main_char') : $same[0];
				
				/* set who the email is coming from */
				$from_name = $this->char->get_character_name($from, TRUE, TRUE);
				$from_email = $this->user->get_email_address('character', $from);
				
				/* set the content */
				$content = sprintf(
					lang('email_content_mission_post_saved'),
					$data['title'],
					site_url('login/index'),
					$authors,
					$mission,
					$location,
					$timeline,
					$data['content']
				);
				
				/* set the email data */
				$email_data = array(
					'email_content' => ($this->email->mailtype == 'html') ? nl2br($content) : $content
				);
				
				/* where should the email be coming from */
				$em_loc = email_location('write_missionpost_saved', $this->email->mailtype);
				
				/* parse the message */
				$message = $this->parser->parse($em_loc, $email_data, TRUE);
				
				/* get the email addresses */
				$emails = $this->char->get_character_emails($data['authors']);
				
				foreach ($emails as $key => $value)
				{
					$pref = $this->user->get_pref('email_mission_posts_save', $key);
					
					if ($pref == 'y')
					{
						/* don't do anything */
					}
					else
					{
						unset($emails[$key]);
					}
				}
				
				/* make a string of email addresses */
				$to = implode(',', $emails);
				
				/* set the parameters for sending the email */
				$this->email->from($from_email, $from_name);
				$this->email->to($to);
				$this->email->subject($this->options['email_subject'] .' '. $subject);
				$this->email->message($message);
			break;
		}
		
		/* send the email */
		$email = $this->email->send();
		
		/* return the email variable */
		return $email;
	}
}