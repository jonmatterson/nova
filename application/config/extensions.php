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

$config['extensions']['manifest_char_images'] = [
    'blend' => 'white'
];
