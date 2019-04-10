<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/config/nova_extensions.php';

// Utility Extensions
$config['extensions']['enabled'][] = 'jquery';
$config['extensions']['enabled'][] = 'timepicker';
$config['extensions']['enabled'][] = 'ci_route_body_class';

// Functionality Extensions
$config['extensions']['enabled'][] = 'bfms_character';
$config['extensions']['enabled'][] = 'chronological_mission_posts';
$config['extensions']['enabled'][] = 'manifest_char_images';
$config['extensions']['enabled'][] = 'dynamic_policies';

// Site Extension
$config['extensions']['enabled'][] = 'khonsu';


// Extension-specific configurations

$config['extensions']['manifest_char_images'] = [
    'blend' => 'white'    
];

$config['extensions']['chronological_mission_posts'] = [];

$config['extensions']['chronological_mission_posts']['timepicker_options'] = [
   'interval' => 30
];

$config['extensions']['chronological_mission_posts']['post_order_column_fallback'] = 'post_timeline';

$config['extensions']['chronological_mission_posts']['label_edit_day'] = 'Mission Day';
$config['extensions']['chronological_mission_posts']['label_edit_time'] = 'Time';
$config['extensions']['chronological_mission_posts']['label_view_prefix'] = 'Mission Day';
$config['extensions']['chronological_mission_posts']['label_view_concat'] = 'at';
$config['extensions']['chronological_mission_posts']['label_view_suffix'] = '';
$config['extensions']['chronological_mission_posts']['label_story_character_list'] = 'Featuring:';
$config['extensions']['chronological_mission_posts']['label_story_location'] = 'Location:';
$config['extensions']['chronological_mission_posts']['label_story_timeline'] = 'On:';
$config['extensions']['chronological_mission_posts']['label_story_back_to_mission'] = 'View Mission Details &raquo;';
$config['extensions']['chronological_mission_posts']['label_mission_read_story_link'] = 'Read Story &raquo;';
$config['extensions']['chronological_mission_posts']['label_mission_read_story_button'] = 'Read Story';
