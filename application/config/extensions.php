<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once MODPATH.'core/config/nova_extensions.php';

// Utility Extensions
$config['extensions']['enabled'][] = 'jquery';
$config['extensions']['enabled'][] = 'timepicker';

// Functionality Extensions
$config['extensions']['enabled'][] = 'bfms_character';
$config['extensions']['enabled'][] = 'chronological_mission_posts';
$config['extensions']['enabled'][] = 'manifest_char_images';

// Site Extension
$config['extensions']['enabled'][] = 'khonsu';
