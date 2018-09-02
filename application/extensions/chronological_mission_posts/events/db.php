<?php

$this->event->listen(['db', 'insert', 'prepare', 'posts'], function($event){
  if(($day = $this->input->post('chronological_mission_post_day', true)) !== false)
    $event['data']['post_chronological_mission_post_day'] = $day;
  if(($time = $this->input->post('chronological_mission_post_time', true)) !== false)
    $event['data']['post_chronological_mission_post_time'] = $time;
});

$this->event->listen(['db', 'update', 'prepare', 'posts'], function($event){
  if(($day = $this->input->post('chronological_mission_post_day', true)) !== false)
    $event['data']['post_chronological_mission_post_day'] = $day;
  if(($time = $this->input->post('chronological_mission_post_time', true)) !== false)
    $event['data']['post_chronological_mission_post_time'] = $time;
});
