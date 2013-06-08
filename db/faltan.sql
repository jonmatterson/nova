-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2013 at 07:26 AM
-- Server version: 5.6.10
-- PHP Version: 5.4.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `faltan`
--

-- --------------------------------------------------------

--
-- Table structure for table `nova_access_groups`
--

CREATE TABLE IF NOT EXISTS `nova_access_groups` (
  `group_id` int(6) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_order` int(4) NOT NULL DEFAULT '99',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `nova_access_groups`
--

INSERT INTO `nova_access_groups` (`group_id`, `group_name`, `group_order`) VALUES
(1, 'General Admin', 0),
(2, 'Writing Features', 1),
(3, 'Site Management', 2),
(4, 'Data Management', 3),
(5, 'Reports', 4),
(6, 'Characters', 5),
(7, 'Users', 6),
(8, 'Wiki', 7);

-- --------------------------------------------------------

--
-- Table structure for table `nova_access_pages`
--

CREATE TABLE IF NOT EXISTS `nova_access_pages` (
  `page_id` int(6) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) NOT NULL DEFAULT '',
  `page_url` varchar(255) NOT NULL DEFAULT '',
  `page_level` varchar(3) NOT NULL DEFAULT '',
  `page_group` int(6) NOT NULL DEFAULT '0',
  `page_desc` text NOT NULL,
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `nova_access_pages`
--

INSERT INTO `nova_access_pages` (`page_id`, `page_name`, `page_url`, `page_level`, `page_group`, `page_desc`) VALUES
(1, 'Admin Control Panel', 'admin/index', '', 1, 'Can access the admin control panel with recent posts, stats and other information'),
(2, 'Upload Images', 'upload/index', '', 1, 'Can upload images to the server'),
(3, 'Manage Uploads', 'upload/manage', '', 1, 'Can delete upload records'),
(4, 'Private Messages', 'messages/index', '', 2, 'Can send and receive private messages'),
(5, 'Writing Control Panel', 'write/index', '', 2, 'Can access the writing control panel with saved entries and recent posts'),
(6, 'Write Mission Post', 'write/missionpost', '', 2, 'Can post a mission entry to the system'),
(7, 'Write Personal Log', 'write/personallog', '', 2, 'Can post a personal log to the system'),
(8, 'Write News Item', 'write/newsitem', '', 2, 'Can post a news items to the system'),
(9, 'Site Settings', 'site/settings', '', 3, 'Can add, delete or edit any of the system settings'),
(10, 'Site Messages', 'site/messages', '', 3, 'Can add, delete or edit any of the site messages for the system'),
(11, 'Role Access', 'site/roles', '', 3, 'Can add, delete or edit access roles including access page sections and access pages'),
(12, 'Bio/Join Form', 'site/bioform', '', 3, 'Can add to, edit or remove from the dynamic bio form including bio tabs and bio sections'),
(13, 'Specs Form', 'site/specsform', '', 3, 'Can add to, edit or remove from the dynamic specifications form including specs sections'),
(14, 'Tour Form', 'site/tourform', '', 3, 'Can add to, edit or remove from the dynamic tour form'),
(15, 'Docking Form', 'site/dockingform', '', 3, 'Can add to, edit or remove from the dynamic docking form'),
(16, 'Menus', 'site/menus', '', 3, 'Can add, delete and edit system menus'),
(17, 'System Catalogue - Ranks', 'site/catalogueranks', '', 3, 'Can add, delete and edit system ranks'),
(18, 'System Catalogue - Skins', 'site/catalogueskins', '', 3, 'Can add, delete and edit system skins'),
(19, 'Manage Sim Types', 'site/simtypes', '', 3, 'Can add, delete and edit the different sim types'),
(20, 'Specs', 'manage/specs', '', 4, 'Can update the specifications'),
(21, 'Deck Listing', 'manage/decks', '', 4, 'Can add to, edit or remove from the deck listing'),
(22, 'Manage Comments', 'manage/comments', '', 4, 'Can approve, delete and edit any comments'),
(23, 'Manage Positions', 'manage/positions', '', 4, 'Can add, delete and edit positions'),
(24, 'Manage Departments', 'manage/depts', '', 4, 'Can add, delete and edit departments'),
(25, 'Manage Ranks', 'manage/ranks', '', 4, 'Can add, delete and edit ranks'),
(26, 'Manage Awards', 'manage/awards', '', 4, 'Can add, delete and edit awards'),
(27, 'Manage Tour Items', 'manage/tour', '', 4, 'Can add, delete and edit tour items'),
(28, 'Manage Docked Items', 'manage/docked', '', 4, 'Can add, approve, delete, edit and reject docked items'),
(29, 'Manage Missions', 'manage/missions', '', 4, 'Can add, delete and edit missions'),
(30, 'Manage Mission Posts (Level 1)', 'manage/posts', '1', 4, 'Can delete and edit any of their own mission posts'),
(31, 'Manage Mission Posts (Level 2)', 'manage/posts', '2', 4, 'Can delete and edit all mission posts in the system'),
(32, 'Manage Personal Logs (Level 1)', 'manage/logs', '1', 4, 'Can delete and edit any of their own personal logs'),
(33, 'Manage Personal Logs (Level 2)', 'manage/logs', '2', 4, 'Can delete and edit all personal logs in the system'),
(34, 'Manage News Items (Level 1)', 'manage/news', '1', 4, 'Can delete and edit any of their own news items'),
(35, 'Manage News Items (Level 2)', 'manage/news', '2', 4, 'Can delete and edit all news items in the system'),
(36, 'Manage News Categories', 'manage/newscats', '', 4, 'Can manage all news categories available for news items'),
(37, 'LOA Report', 'report/loa', '', 5, 'Can view a report on LOAs taken over the life of the system'),
(38, 'System &amp; Versions', 'report/versions', '', 5, 'Can view a report on system information and all previous versions of the system'),
(39, 'Crew Activity', 'report/activity', '', 5, 'Can view a report on active crew''s activity levels'),
(40, 'Posting Levels', 'report/posting', '', 5, 'Can view a report on posting levels for all playing characters'),
(41, 'Moderation', 'report/moderation', '', 5, 'Can view a report on the moderation status of users'),
(42, 'Milestones', 'report/milestones', '', 5, 'Can view a report on the milestones of users'),
(43, 'Award Nominations', 'report/awardnominations', '', 5, 'Can view a report on all award nominations'),
(44, 'Applications', 'report/applications', '', 5, 'Can view a report on all applications submitted through the system'),
(45, 'Sim Statistics', 'report/stats', '', 5, 'Can view a report on sim statistics for the current and previous months'),
(46, 'Character Management', 'characters/index', '', 6, 'Can manage all playing characters including accepting and rejecting applicants'),
(47, 'NPC Management (Level 1)', 'characters/npcs', '1', 6, 'Can manage any non-playing characters in their primary department (first position only)'),
(48, 'NPC Management (Level 2)', 'characters/npcs', '2', 6, 'Can manage any non-playing characters in any of their departments (first and second positions)'),
(49, 'NPC Management (Level 3)', 'characters/npcs', '3', 6, 'Can manage all non-playing characters in the system'),
(50, 'Chain of Command', 'characters/coc', '', 6, 'Can add, delete and edit the chain of command'),
(51, 'Character Bio (Level 1)', 'characters/bio', '1', 6, 'Can edit the bio of any of their own characters'),
(52, 'Character Bio (Level 2)', 'characters/bio', '2', 6, 'Can edit the bio of any of their characters as well as any NPC in the system'),
(53, 'Character Bio (Level 3)', 'characters/bio', '3', 6, 'Can edit any character in the system, including rank and position'),
(54, 'Create Character (Level 1)', 'characters/create', '1', 6, 'Can create playing and non-playing characters but playing characters require approval'),
(55, 'Create Character (Level 2)', 'characters/create', '2', 6, 'Can create playing and non-playing characters without any approval'),
(56, 'Give/Remove Award', 'characters/awards', '', 6, 'Can give/remove awards to/from any character in the system'),
(57, 'User Account (Level 1)', 'user/account', '1', 7, 'Can update their own account settings'),
(58, 'User Account (Level 2)', 'user/account', '2', 7, 'Can update any account in the system including moderation flags and admin items'),
(59, 'Crew Award Nominations (Level 1)', 'user/nominate', '1', 7, 'Can nominate playing and non-playing characters for awards'),
(60, 'Crew Award Nominations (Level 2)', 'user/nominate', '2', 7, 'Can nominate playing and non-playing characters for awards as well as approving/rejecting pending award nominations'),
(61, 'Wiki Pages (Level 1)', 'wiki/page', '1', 8, 'Can create wiki pages and edit any pages they have created, including viewing history and reverting to previous drafts'),
(62, 'Wiki Pages (Level 2)', 'wiki/page', '2', 8, 'Can create wiki pages and edit all pages, including viewing history and reverting to previous drafts'),
(63, 'Wiki Pages (Level 3)', 'wiki/page', '3', 8, 'Can create, delete and edit all wiki pages (including system pages), including viewing history and reverting to previous drafts. Level 3 permissions can bypass all access restrictions on a wiki page.'),
(64, 'Wiki Categories', 'wiki/categories', '', 8, 'Can create, delete and edit wiki categories'),
(65, 'Ban Controls', 'site/bans', '', 3, 'Can add or remove site bans'),
(66, 'Site Manifests', 'site/manifests', '', 3, 'Can create, delete and edit site manifests');

-- --------------------------------------------------------

--
-- Table structure for table `nova_access_roles`
--

CREATE TABLE IF NOT EXISTS `nova_access_roles` (
  `role_id` int(5) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `role_access` text NOT NULL,
  `role_desc` text NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nova_access_roles`
--

INSERT INTO `nova_access_roles` (`role_id`, `role_name`, `role_access`, `role_desc`) VALUES
(1, 'System Administrator', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,31,33,35,36,37,38,39,40,41,42,43,44,45,46,49,50,53,55,56,58,60,63,64,65,66', 'System administrators can take any action in the system. Only give this access level out to people you implicitly trust.'),
(2, 'Basic Administrator', '1,2,3,4,5,6,7,8,20,21,22,27,31,33,35,37,39,40,41,42,43,44,45,46,49,53,54,58,59,63,64', 'Basic administrators have power to do some of the tasks system administrators do, but with more restrictions. This role is intended to be used for senior players on the RPG.'),
(3, 'Power User', '1,2,4,5,6,7,8,30,32,34,39,40,42,45,48,52,54,57,59,62', 'Power users are users that can take more action than a standard user. This role is intended to be used for senior players on the RPG (department heads for example).'),
(4, 'Standard User', '1,2,4,5,6,7,8,30,32,34,39,40,42,45,51,54,57,59,61', 'Standard users are generally the majority of players. This role gives them access to all the pieces they will need to play the game and use the system.'),
(5, 'Inactive User', '1,4,45,51,54,57', 'Inactive players are players that have left the RPG. Instead of being completely locked out, the player can log in and take some very limited actions.');

-- --------------------------------------------------------

--
-- Table structure for table `nova_applications`
--

CREATE TABLE IF NOT EXISTS `nova_applications` (
  `app_id` int(10) NOT NULL AUTO_INCREMENT,
  `app_email` varchar(255) NOT NULL DEFAULT '',
  `app_ip` varchar(45) NOT NULL DEFAULT '',
  `app_user` int(8) NOT NULL,
  `app_user_name` varchar(255) NOT NULL DEFAULT '',
  `app_character` int(8) NOT NULL,
  `app_character_name` text NOT NULL,
  `app_position` varchar(255) NOT NULL DEFAULT '',
  `app_date` bigint(20) NOT NULL,
  `app_action` varchar(100) NOT NULL DEFAULT '',
  `app_message` text NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_awards`
--

CREATE TABLE IF NOT EXISTS `nova_awards` (
  `award_id` int(5) NOT NULL AUTO_INCREMENT,
  `award_name` varchar(255) NOT NULL DEFAULT '',
  `award_image` varchar(100) NOT NULL DEFAULT '',
  `award_order` int(5) NOT NULL,
  `award_desc` text NOT NULL,
  `award_cat` enum('ic','ooc','both') NOT NULL DEFAULT 'ic',
  `award_display` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_awards_queue`
--

CREATE TABLE IF NOT EXISTS `nova_awards_queue` (
  `queue_id` int(8) NOT NULL AUTO_INCREMENT,
  `queue_receive_character` int(8) NOT NULL,
  `queue_receive_user` int(8) NOT NULL,
  `queue_nominate` int(8) NOT NULL,
  `queue_award` int(5) NOT NULL,
  `queue_reason` text NOT NULL,
  `queue_status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `queue_date` bigint(20) NOT NULL,
  PRIMARY KEY (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_awards_received`
--

CREATE TABLE IF NOT EXISTS `nova_awards_received` (
  `awardrec_id` int(8) NOT NULL AUTO_INCREMENT,
  `awardrec_user` int(8) NOT NULL,
  `awardrec_character` int(8) NOT NULL DEFAULT '0',
  `awardrec_nominated_by` int(8) NOT NULL DEFAULT '0',
  `awardrec_award` int(5) NOT NULL,
  `awardrec_date` bigint(20) NOT NULL,
  `awardrec_reason` text NOT NULL,
  PRIMARY KEY (`awardrec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_bans`
--

CREATE TABLE IF NOT EXISTS `nova_bans` (
  `ban_id` int(5) NOT NULL AUTO_INCREMENT,
  `ban_level` int(1) NOT NULL,
  `ban_ip` varchar(45) NOT NULL DEFAULT '',
  `ban_email` varchar(100) NOT NULL DEFAULT '',
  `ban_reason` text NOT NULL,
  `ban_date` bigint(20) NOT NULL,
  PRIMARY KEY (`ban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_catalogue_ranks`
--

CREATE TABLE IF NOT EXISTS `nova_catalogue_ranks` (
  `rankcat_id` int(5) NOT NULL AUTO_INCREMENT,
  `rankcat_name` varchar(100) NOT NULL DEFAULT '',
  `rankcat_location` varchar(100) NOT NULL DEFAULT '',
  `rankcat_preview` varchar(50) NOT NULL DEFAULT 'preview.png',
  `rankcat_blank` varchar(50) NOT NULL DEFAULT 'blank.png',
  `rankcat_extension` varchar(5) NOT NULL DEFAULT '.png',
  `rankcat_status` enum('active','inactive','development') NOT NULL DEFAULT 'active',
  `rankcat_credits` text NOT NULL,
  `rankcat_url` text NOT NULL,
  `rankcat_default` enum('y','n') NOT NULL DEFAULT 'n',
  `rankcat_genre` varchar(10) NOT NULL DEFAULT 'ds9',
  PRIMARY KEY (`rankcat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nova_catalogue_ranks`
--

INSERT INTO `nova_catalogue_ranks` (`rankcat_id`, `rankcat_name`, `rankcat_location`, `rankcat_preview`, `rankcat_blank`, `rankcat_extension`, `rankcat_status`, `rankcat_credits`, `rankcat_url`, `rankcat_default`, `rankcat_genre`) VALUES
(1, 'Dress Uniform', 'default', 'preview.png', 'blank.png', '.png', 'active', 'The rank sets used in Nova were created by Kuro-chan of Kuro-RPG. The ranksets can be found at <a href=''http://www.kuro-rpg.net'' target=''_blank''>Kuro-RPG</a>. Please do not copy or modify the images.', 'http://www.kuro-rpg.net/', 'y', 'ds9');

-- --------------------------------------------------------

--
-- Table structure for table `nova_catalogue_skins`
--

CREATE TABLE IF NOT EXISTS `nova_catalogue_skins` (
  `skin_id` int(5) NOT NULL AUTO_INCREMENT,
  `skin_name` varchar(100) NOT NULL DEFAULT '',
  `skin_location` varchar(100) NOT NULL DEFAULT '',
  `skin_credits` text NOT NULL,
  PRIMARY KEY (`skin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `nova_catalogue_skins`
--

INSERT INTO `nova_catalogue_skins` (`skin_id`, `skin_name`, `skin_location`, `skin_credits`) VALUES
(1, 'Pulsar', 'default', 'The Pulsar skin was created by Anodyne Productions. Edits are permissible as long as original credits stay intact. The Pulsar skin includes the jQuery BlockUI plugin by Malsup. More information can be found at <a href="http://malsup.com/jquery/block/">http://malsup.com/jquery/block/</a>.'),
(2, 'Titan', 'titan', 'The Titan skin was created by Anodyne Productions. Edits are permissible provided the original credits remain intact.'),
(4, 'Faltan', 'faltan', 'The Faltan skin provides a responsive Nova site powered by Twitter Bootstrap. It was created by Jon Matterson of Anodyne Productions. Edits are permissible provided the original credits remain intact.');

-- --------------------------------------------------------

--
-- Table structure for table `nova_catalogue_skinsecs`
--

CREATE TABLE IF NOT EXISTS `nova_catalogue_skinsecs` (
  `skinsec_id` int(10) NOT NULL AUTO_INCREMENT,
  `skinsec_section` varchar(50) NOT NULL DEFAULT '',
  `skinsec_skin` varchar(100) NOT NULL DEFAULT '',
  `skinsec_image_preview` varchar(50) NOT NULL DEFAULT '',
  `skinsec_status` enum('active','inactive','development') NOT NULL DEFAULT 'active',
  `skinsec_default` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`skinsec_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `nova_catalogue_skinsecs`
--

INSERT INTO `nova_catalogue_skinsecs` (`skinsec_id`, `skinsec_section`, `skinsec_skin`, `skinsec_image_preview`, `skinsec_status`, `skinsec_default`) VALUES
(1, 'main', 'default', 'preview-main.jpg', 'active', 'n'),
(2, 'admin', 'default', 'preview-admin.jpg', 'active', 'y'),
(3, 'wiki', 'default', 'preview-wiki.jpg', 'active', 'n'),
(4, 'login', 'default', 'preview-login.jpg', 'active', 'n'),
(5, 'main', 'titan', 'preview-main.jpg', 'active', 'n'),
(6, 'wiki', 'titan', 'preview-wiki.jpg', 'active', 'n'),
(7, 'login', 'titan', 'preview-login.jpg', 'active', 'n'),
(8, 'admin', 'titan', 'preview-admin.jpg', 'active', 'n'),
(9, 'main', 'faltan', 'preview-main.jpg', 'active', 'y'),
(10, 'login', 'faltan', 'preview-login.jpg', 'active', 'y'),
(11, 'wiki', 'faltan', 'preview-wiki.jpg', 'active', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters`
--

CREATE TABLE IF NOT EXISTS `nova_characters` (
  `charid` int(8) NOT NULL AUTO_INCREMENT,
  `user` int(8) NOT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `middle_name` varchar(50) NOT NULL DEFAULT '',
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `suffix` varchar(50) NOT NULL DEFAULT '',
  `crew_type` enum('active','inactive','pending','npc') NOT NULL DEFAULT 'active',
  `date_activate` bigint(20) NOT NULL,
  `date_deactivate` bigint(20) NOT NULL,
  `images` text NOT NULL,
  `rank` int(10) NOT NULL,
  `position_1` int(10) NOT NULL DEFAULT '1',
  `position_2` int(10) NOT NULL,
  `last_post` bigint(20) NOT NULL,
  PRIMARY KEY (`charid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `nova_characters`
--

INSERT INTO `nova_characters` (`charid`, `user`, `first_name`, `middle_name`, `last_name`, `suffix`, `crew_type`, `date_activate`, `date_deactivate`, `images`, `rank`, `position_1`, `position_2`, `last_post`) VALUES
(1, 1, 'Allison', '', 'Reyes', '', 'active', 1370191358, 0, '', 37, 1, 87, 0),
(2, 1, 'Jake', 'Daniel', 'Lewis', '', 'active', 0, 0, '', 73, 2, 92, 1370675192),
(3, 0, 'Charles', '', 'Ainsworth', '', 'npc', 0, 0, '', 50, 88, 0, 0),
(4, 0, 'Jaxon', '', 'Amolyae', '', 'npc', 0, 0, '', 102, 81, 94, 1370674895),
(5, 0, 'Robert', '', 'Chadwick', '', 'npc', 0, 0, '', 362, 133, 0, 0),
(6, 0, 'Jennifer', '', 'Russo', '', 'npc', 0, 0, '', 97, 142, 93, 0),
(7, 0, 'John', '', 'Miles', '', 'npc', 0, 0, '', 111, 99, 0, 0),
(8, 0, 'Mike', '', 'Brancer', '', 'npc', 0, 0, '', 54, 105, 0, 0),
(9, 0, 'Jack', '', 'Shannon', '', 'npc', 0, 0, '', 75, 85, 0, 0),
(10, 1, 'Vorelian', '', '', '', 'npc', 1370673714, 0, '', 384, 143, 0, 0),
(11, 1, 'Vorenus', '', '', '', 'npc', 1370673740, 0, '', 384, 143, 0, 1370675065),
(12, 0, 'Ariana', '', 't''Tellus', '', 'npc', 0, 0, '', 384, 143, 0, 1370675065),
(13, 0, 'Trevolok', '', '', '', 'npc', 0, 0, '', 385, 144, 0, 0),
(14, 1, 'Tarov', '', '', '', 'npc', 1370673733, 0, '', 385, 145, 0, 0),
(15, 1, 'Duranus', '', 'tr''Tal', '', 'npc', 1370673728, 0, '', 385, 146, 0, 0),
(16, 1, 'P''alas', '', '', '', 'npc', 1370673617, 0, '', 363, 147, 0, 1370674796),
(17, 0, 'Karlot', '', '', '', 'npc', 0, 0, '', 364, 149, 0, 0),
(18, 1, 'Sonara', '', 'T''Daran', '', 'npc', 1370674739, 0, '', 377, 153, 0, 1370674955),
(19, 1, 'Demonak', '', '', '', 'npc', 1370673708, 0, '', 379, 154, 0, 1370674955),
(20, 1, 'Talos', '', '', '', 'npc', 1370673695, 0, '', 372, 150, 0, 0),
(21, 1, 'Vorsa', '', '', '', 'npc', 1370673702, 0, '', 373, 148, 0, 1370674796),
(22, 0, 'Rhian', '', 'tr''Khev', '', 'npc', 0, 0, '', 373, 151, 0, 0),
(23, 1, 'Linara', '', '', '', 'npc', 1370673723, 0, '', 373, 152, 0, 0),
(24, 0, 'Alynna', '', 'Nechayev', '', 'npc', 0, 0, '', 1, 157, 0, 0),
(25, 0, 'Gordon', '', 'Evans', '', 'npc', 0, 0, '', 13, 156, 0, 1370675192),
(26, 0, 'Asuki', '', 'Sasin', '', 'npc', 0, 0, '', 25, 158, 0, 0),
(27, 0, 'Oliver', '', 'Tidwell', '', 'npc', 0, 0, '', 1, 159, 0, 0),
(28, 0, 'Kara', '', 'Thrace', '', 'npc', 0, 0, '', 25, 160, 0, 0),
(29, 1, 'Frank', '', 'DeVoe', '', 'npc', 1370673606, 0, '', 37, 155, 0, 0),
(30, 1, 'Tepora', '', '', '', 'npc', 1370674734, 0, '', 387, 124, 0, 1370674796);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_data`
--

CREATE TABLE IF NOT EXISTS `nova_characters_data` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_field` int(10) NOT NULL,
  `data_char` int(8) NOT NULL,
  `data_user` int(8) NOT NULL,
  `data_value` text NOT NULL,
  `data_updated` bigint(20) NOT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=653 ;

--
-- Dumping data for table `nova_characters_data`
--

INSERT INTO `nova_characters_data` (`data_id`, `data_field`, `data_char`, `data_user`, `data_value`, `data_updated`) VALUES
(1, 1, 1, 1, 'Female', 1370670962),
(2, 2, 1, 1, 'Human', 1370670962),
(3, 3, 1, 1, '41', 1370670962),
(4, 4, 1, 1, '', 1370670962),
(5, 5, 1, 1, '', 1370670962),
(6, 6, 1, 1, '', 1370670962),
(7, 7, 1, 1, '', 1370670962),
(8, 8, 1, 1, '', 1370670962),
(9, 9, 1, 1, '', 1370670962),
(12, 12, 1, 1, '', 1370670962),
(13, 13, 1, 1, '', 1370670962),
(14, 14, 1, 1, '', 1370670962),
(15, 15, 1, 1, '', 1370670962),
(16, 16, 1, 1, '', 1370670962),
(17, 17, 1, 1, '', 1370670962),
(18, 18, 1, 1, '', 1370670962),
(19, 19, 1, 1, '', 1370670962),
(20, 20, 1, 1, '', 1370670962),
(21, 21, 1, 1, '', 1370670962),
(22, 1, 2, 1, 'Male', 1370671421),
(23, 2, 2, 1, '', 1370671421),
(24, 3, 2, 1, '', 1370671421),
(25, 4, 2, 1, '', 1370671421),
(26, 5, 2, 1, '', 1370671421),
(27, 6, 2, 1, '', 1370671421),
(28, 7, 2, 1, '', 1370671421),
(29, 8, 2, 1, '', 1370671421),
(30, 9, 2, 1, '', 1370671421),
(33, 12, 2, 1, '', 1370671421),
(34, 13, 2, 1, '', 1370671421),
(35, 14, 2, 1, '', 1370671421),
(36, 15, 2, 1, '', 1370671421),
(37, 16, 2, 1, '', 1370671421),
(38, 17, 2, 1, '', 1370671421),
(39, 18, 2, 1, '', 1370671421),
(40, 19, 2, 1, '', 1370671421),
(41, 20, 2, 1, '', 1370671421),
(42, 21, 2, 1, '', 1370671421),
(43, 1, 3, 0, 'Male', 1370198898),
(44, 2, 3, 0, '', 1370198898),
(45, 3, 3, 0, '', 1370198898),
(46, 4, 3, 0, '', 1370198898),
(47, 5, 3, 0, '', 1370198898),
(48, 6, 3, 0, '', 1370198898),
(49, 7, 3, 0, '', 1370198898),
(50, 8, 3, 0, '', 1370198898),
(51, 9, 3, 0, '', 1370198898),
(54, 12, 3, 0, '', 1370198898),
(55, 13, 3, 0, '', 1370198898),
(56, 14, 3, 0, '', 1370198898),
(57, 15, 3, 0, '', 1370198898),
(58, 16, 3, 0, '', 1370198898),
(59, 17, 3, 0, '', 1370198898),
(60, 18, 3, 0, '', 1370198898),
(61, 19, 3, 0, '', 1370198898),
(62, 20, 3, 0, '', 1370198898),
(63, 21, 3, 0, '', 1370198898),
(64, 1, 4, 0, 'Male', 1370653447),
(65, 2, 4, 0, '', 1370653447),
(66, 3, 4, 0, '', 1370653447),
(67, 4, 4, 0, '', 1370653447),
(68, 5, 4, 0, '', 1370653447),
(69, 6, 4, 0, '', 1370653447),
(70, 7, 4, 0, '', 1370653447),
(71, 8, 4, 0, '', 1370653447),
(72, 9, 4, 0, '', 1370653447),
(75, 12, 4, 0, '', 1370653447),
(76, 13, 4, 0, '', 1370653447),
(77, 14, 4, 0, '', 1370653447),
(78, 15, 4, 0, '', 1370653447),
(79, 16, 4, 0, '', 1370653447),
(80, 17, 4, 0, '', 1370653447),
(81, 18, 4, 0, '', 1370653447),
(82, 19, 4, 0, '', 1370653447),
(83, 20, 4, 0, '', 1370653447),
(84, 21, 4, 0, '', 1370653447),
(85, 1, 5, 0, 'Male', 1370199314),
(86, 2, 5, 0, '', 1370199314),
(87, 3, 5, 0, '', 1370199314),
(88, 4, 5, 0, '', 1370199314),
(89, 5, 5, 0, '', 1370199314),
(90, 6, 5, 0, '', 1370199314),
(91, 7, 5, 0, '', 1370199314),
(92, 8, 5, 0, '', 1370199314),
(93, 9, 5, 0, '', 1370199314),
(96, 12, 5, 0, '', 1370199314),
(97, 13, 5, 0, '', 1370199314),
(98, 14, 5, 0, '', 1370199314),
(99, 15, 5, 0, '', 1370199314),
(100, 16, 5, 0, '', 1370199314),
(101, 17, 5, 0, '', 1370199314),
(102, 18, 5, 0, '', 1370199314),
(103, 19, 5, 0, '', 1370199314),
(104, 20, 5, 0, '', 1370199314),
(105, 21, 5, 0, '', 1370199314),
(106, 1, 6, 0, 'Male', 1370655989),
(107, 2, 6, 0, '', 1370655989),
(108, 3, 6, 0, '', 1370655989),
(109, 4, 6, 0, '', 1370655989),
(110, 5, 6, 0, '', 1370655989),
(111, 6, 6, 0, '', 1370655989),
(112, 7, 6, 0, '', 1370655989),
(113, 8, 6, 0, '', 1370655989),
(114, 9, 6, 0, '', 1370655989),
(117, 12, 6, 0, '', 1370655989),
(118, 13, 6, 0, '', 1370655989),
(119, 14, 6, 0, '', 1370655989),
(120, 15, 6, 0, '', 1370655989),
(121, 16, 6, 0, '', 1370655989),
(122, 17, 6, 0, '', 1370655989),
(123, 18, 6, 0, '', 1370655989),
(124, 19, 6, 0, '', 1370655989),
(125, 20, 6, 0, '', 1370655989),
(126, 21, 6, 0, '', 1370655989),
(127, 1, 7, 0, 'Male', 1370200373),
(128, 2, 7, 0, '', 1370200373),
(129, 3, 7, 0, '', 1370200373),
(130, 4, 7, 0, '', 1370200373),
(131, 5, 7, 0, '', 1370200373),
(132, 6, 7, 0, '', 1370200373),
(133, 7, 7, 0, '', 1370200373),
(134, 8, 7, 0, '', 1370200373),
(135, 9, 7, 0, '', 1370200373),
(138, 12, 7, 0, '', 1370200373),
(139, 13, 7, 0, '', 1370200373),
(140, 14, 7, 0, '', 1370200373),
(141, 15, 7, 0, '', 1370200373),
(142, 16, 7, 0, '', 1370200373),
(143, 17, 7, 0, '', 1370200373),
(144, 18, 7, 0, '', 1370200373),
(145, 19, 7, 0, '', 1370200373),
(146, 20, 7, 0, '', 1370200373),
(147, 21, 7, 0, '', 1370200373),
(148, 1, 8, 0, 'Male', 1370329128),
(149, 2, 8, 0, '', 1370329128),
(150, 3, 8, 0, '', 1370329128),
(151, 4, 8, 0, '', 1370329128),
(152, 5, 8, 0, '', 1370329128),
(153, 6, 8, 0, '', 1370329128),
(154, 7, 8, 0, '', 1370329128),
(155, 8, 8, 0, '', 1370329128),
(156, 9, 8, 0, '', 1370329128),
(159, 12, 8, 0, '', 1370329128),
(160, 13, 8, 0, '', 1370329128),
(161, 14, 8, 0, '', 1370329128),
(162, 15, 8, 0, '', 1370329128),
(163, 16, 8, 0, '', 1370329128),
(164, 17, 8, 0, '', 1370329128),
(165, 18, 8, 0, '', 1370329128),
(166, 19, 8, 0, '', 1370329128),
(167, 20, 8, 0, '', 1370329128),
(168, 21, 8, 0, '', 1370329128),
(169, 1, 9, 0, 'Male', 1370654087),
(170, 2, 9, 0, '', 1370654087),
(171, 3, 9, 0, '', 1370654087),
(172, 4, 9, 0, '', 1370654087),
(173, 5, 9, 0, '', 1370654087),
(174, 6, 9, 0, '', 1370654087),
(175, 7, 9, 0, '', 1370654087),
(176, 8, 9, 0, '', 1370654087),
(177, 9, 9, 0, '', 1370654087),
(180, 12, 9, 0, '', 1370654087),
(181, 13, 9, 0, '', 1370654087),
(182, 14, 9, 0, '', 1370654087),
(183, 15, 9, 0, '', 1370654087),
(184, 16, 9, 0, '', 1370654087),
(185, 17, 9, 0, '', 1370654087),
(186, 18, 9, 0, '', 1370654087),
(187, 19, 9, 0, '', 1370654087),
(188, 20, 9, 0, '', 1370654087),
(189, 21, 9, 0, '', 1370654087),
(190, 1, 10, 1, 'Male', 1370666608),
(191, 2, 10, 1, '', 1370666608),
(192, 3, 10, 1, '', 1370666608),
(193, 4, 10, 1, '', 1370666608),
(194, 5, 10, 1, '', 1370666608),
(195, 6, 10, 1, '', 1370666608),
(196, 7, 10, 1, '', 1370666608),
(197, 8, 10, 1, '', 1370666608),
(198, 9, 10, 1, '', 1370666608),
(201, 12, 10, 1, '', 1370666608),
(202, 13, 10, 1, '', 1370666608),
(203, 14, 10, 1, '', 1370666608),
(204, 15, 10, 1, '', 1370666608),
(205, 16, 10, 1, '', 1370666608),
(206, 17, 10, 1, '', 1370666608),
(207, 18, 10, 1, '', 1370666608),
(208, 19, 10, 1, '', 1370666608),
(209, 20, 10, 1, '', 1370666608),
(210, 21, 10, 1, '', 1370666608),
(211, 1, 11, 1, 'Male', 1370666621),
(212, 2, 11, 1, '', 1370666621),
(213, 3, 11, 1, '', 1370666621),
(214, 4, 11, 1, '', 1370666621),
(215, 5, 11, 1, '', 1370666621),
(216, 6, 11, 1, '', 1370666621),
(217, 7, 11, 1, '', 1370666621),
(218, 8, 11, 1, '', 1370666621),
(219, 9, 11, 1, '', 1370666621),
(222, 12, 11, 1, '', 1370666621),
(223, 13, 11, 1, '', 1370666621),
(224, 14, 11, 1, '', 1370666621),
(225, 15, 11, 1, '', 1370666621),
(226, 16, 11, 1, '', 1370666621),
(227, 17, 11, 1, '', 1370666621),
(228, 18, 11, 1, '', 1370666621),
(229, 19, 11, 1, '', 1370666621),
(230, 20, 11, 1, '', 1370666621),
(231, 21, 11, 1, '', 1370666621),
(232, 1, 12, 0, 'Male', 1370666639),
(233, 2, 12, 0, '', 1370666639),
(234, 3, 12, 0, '', 1370666639),
(235, 4, 12, 0, '', 1370666639),
(236, 5, 12, 0, '', 1370666639),
(237, 6, 12, 0, '', 1370666639),
(238, 7, 12, 0, '', 1370666639),
(239, 8, 12, 0, '', 1370666639),
(240, 9, 12, 0, '', 1370666639),
(243, 12, 12, 0, '', 1370666639),
(244, 13, 12, 0, '', 1370666639),
(245, 14, 12, 0, '', 1370666639),
(246, 15, 12, 0, '', 1370666639),
(247, 16, 12, 0, '', 1370666639),
(248, 17, 12, 0, '', 1370666639),
(249, 18, 12, 0, '', 1370666639),
(250, 19, 12, 0, '', 1370666639),
(251, 20, 12, 0, '', 1370666639),
(252, 21, 12, 0, '', 1370666639),
(253, 1, 13, 0, 'Male', 1370666666),
(254, 2, 13, 0, '', 1370666666),
(255, 3, 13, 0, '', 1370666666),
(256, 4, 13, 0, '', 1370666666),
(257, 5, 13, 0, '', 1370666666),
(258, 6, 13, 0, '', 1370666666),
(259, 7, 13, 0, '', 1370666666),
(260, 8, 13, 0, '', 1370666666),
(261, 9, 13, 0, '', 1370666666),
(264, 12, 13, 0, '', 1370666666),
(265, 13, 13, 0, '', 1370666666),
(266, 14, 13, 0, '', 1370666666),
(267, 15, 13, 0, '', 1370666666),
(268, 16, 13, 0, '', 1370666666),
(269, 17, 13, 0, '', 1370666666),
(270, 18, 13, 0, '', 1370666666),
(271, 19, 13, 0, '', 1370666666),
(272, 20, 13, 0, '', 1370666666),
(273, 21, 13, 0, '', 1370666666),
(274, 1, 14, 1, 'Male', 1370666682),
(275, 2, 14, 1, '', 1370666682),
(276, 3, 14, 1, '', 1370666682),
(277, 4, 14, 1, '', 1370666682),
(278, 5, 14, 1, '', 1370666682),
(279, 6, 14, 1, '', 1370666682),
(280, 7, 14, 1, '', 1370666682),
(281, 8, 14, 1, '', 1370666682),
(282, 9, 14, 1, '', 1370666682),
(285, 12, 14, 1, '', 1370666682),
(286, 13, 14, 1, '', 1370666682),
(287, 14, 14, 1, '', 1370666682),
(288, 15, 14, 1, '', 1370666682),
(289, 16, 14, 1, '', 1370666682),
(290, 17, 14, 1, '', 1370666682),
(291, 18, 14, 1, '', 1370666682),
(292, 19, 14, 1, '', 1370666682),
(293, 20, 14, 1, '', 1370666682),
(294, 21, 14, 1, '', 1370666682),
(295, 1, 15, 1, 'Male', 1370666700),
(296, 2, 15, 1, '', 1370666700),
(297, 3, 15, 1, '', 1370666700),
(298, 4, 15, 1, '', 1370666700),
(299, 5, 15, 1, '', 1370666700),
(300, 6, 15, 1, '', 1370666700),
(301, 7, 15, 1, '', 1370666700),
(302, 8, 15, 1, '', 1370666700),
(303, 9, 15, 1, '', 1370666700),
(306, 12, 15, 1, '', 1370666700),
(307, 13, 15, 1, '', 1370666700),
(308, 14, 15, 1, '', 1370666700),
(309, 15, 15, 1, '', 1370666700),
(310, 16, 15, 1, '', 1370666700),
(311, 17, 15, 1, '', 1370666700),
(312, 18, 15, 1, '', 1370666700),
(313, 19, 15, 1, '', 1370666700),
(314, 20, 15, 1, '', 1370666700),
(315, 21, 15, 1, '', 1370666700),
(316, 1, 16, 1, 'Male', 1370666750),
(317, 2, 16, 1, '', 1370666750),
(318, 3, 16, 1, '', 1370666750),
(319, 4, 16, 1, '', 1370666750),
(320, 5, 16, 1, '', 1370666750),
(321, 6, 16, 1, '', 1370666750),
(322, 7, 16, 1, '', 1370666750),
(323, 8, 16, 1, '', 1370666750),
(324, 9, 16, 1, '', 1370666750),
(327, 12, 16, 1, '', 1370666750),
(328, 13, 16, 1, '', 1370666750),
(329, 14, 16, 1, '', 1370666750),
(330, 15, 16, 1, '', 1370666750),
(331, 16, 16, 1, '', 1370666750),
(332, 17, 16, 1, '', 1370666750),
(333, 18, 16, 1, '', 1370666750),
(334, 19, 16, 1, '', 1370666750),
(335, 20, 16, 1, '', 1370666750),
(336, 21, 16, 1, '', 1370666750),
(337, 1, 17, 0, 'Male', 1370666768),
(338, 2, 17, 0, '', 1370666768),
(339, 3, 17, 0, '', 1370666768),
(340, 4, 17, 0, '', 1370666768),
(341, 5, 17, 0, '', 1370666768),
(342, 6, 17, 0, '', 1370666768),
(343, 7, 17, 0, '', 1370666768),
(344, 8, 17, 0, '', 1370666768),
(345, 9, 17, 0, '', 1370666768),
(348, 12, 17, 0, '', 1370666768),
(349, 13, 17, 0, '', 1370666768),
(350, 14, 17, 0, '', 1370666768),
(351, 15, 17, 0, '', 1370666768),
(352, 16, 17, 0, '', 1370666768),
(353, 17, 17, 0, '', 1370666768),
(354, 18, 17, 0, '', 1370666768),
(355, 19, 17, 0, '', 1370666768),
(356, 20, 17, 0, '', 1370666768),
(357, 21, 17, 0, '', 1370666768),
(358, 1, 18, 1, 'Male', 1370666789),
(359, 2, 18, 1, '', 1370666789),
(360, 3, 18, 1, '', 1370666789),
(361, 4, 18, 1, '', 1370666789),
(362, 5, 18, 1, '', 1370666789),
(363, 6, 18, 1, '', 1370666789),
(364, 7, 18, 1, '', 1370666789),
(365, 8, 18, 1, '', 1370666789),
(366, 9, 18, 1, '', 1370666789),
(369, 12, 18, 1, '', 1370666789),
(370, 13, 18, 1, '', 1370666789),
(371, 14, 18, 1, '', 1370666789),
(372, 15, 18, 1, '', 1370666789),
(373, 16, 18, 1, '', 1370666789),
(374, 17, 18, 1, '', 1370666789),
(375, 18, 18, 1, '', 1370666789),
(376, 19, 18, 1, '', 1370666789),
(377, 20, 18, 1, '', 1370666789),
(378, 21, 18, 1, '', 1370666789),
(379, 1, 19, 1, 'Male', 1370666803),
(380, 2, 19, 1, '', 1370666803),
(381, 3, 19, 1, '', 1370666803),
(382, 4, 19, 1, '', 1370666803),
(383, 5, 19, 1, '', 1370666803),
(384, 6, 19, 1, '', 1370666803),
(385, 7, 19, 1, '', 1370666803),
(386, 8, 19, 1, '', 1370666803),
(387, 9, 19, 1, '', 1370666803),
(390, 12, 19, 1, '', 1370666803),
(391, 13, 19, 1, '', 1370666803),
(392, 14, 19, 1, '', 1370666803),
(393, 15, 19, 1, '', 1370666803),
(394, 16, 19, 1, '', 1370666803),
(395, 17, 19, 1, '', 1370666803),
(396, 18, 19, 1, '', 1370666803),
(397, 19, 19, 1, '', 1370666803),
(398, 20, 19, 1, '', 1370666803),
(399, 21, 19, 1, '', 1370666803),
(400, 1, 20, 1, 'Male', 1370666835),
(401, 2, 20, 1, '', 1370666835),
(402, 3, 20, 1, '', 1370666835),
(403, 4, 20, 1, '', 1370666835),
(404, 5, 20, 1, '', 1370666835),
(405, 6, 20, 1, '', 1370666835),
(406, 7, 20, 1, '', 1370666835),
(407, 8, 20, 1, '', 1370666835),
(408, 9, 20, 1, '', 1370666835),
(411, 12, 20, 1, '', 1370666835),
(412, 13, 20, 1, '', 1370666835),
(413, 14, 20, 1, '', 1370666835),
(414, 15, 20, 1, '', 1370666835),
(415, 16, 20, 1, '', 1370666835),
(416, 17, 20, 1, '', 1370666835),
(417, 18, 20, 1, '', 1370666835),
(418, 19, 20, 1, '', 1370666835),
(419, 20, 20, 1, '', 1370666835),
(420, 21, 20, 1, '', 1370666835),
(421, 1, 21, 1, 'Male', 1370666868),
(422, 2, 21, 1, '', 1370666868),
(423, 3, 21, 1, '', 1370666868),
(424, 4, 21, 1, '', 1370666868),
(425, 5, 21, 1, '', 1370666868),
(426, 6, 21, 1, '', 1370666868),
(427, 7, 21, 1, '', 1370666868),
(428, 8, 21, 1, '', 1370666868),
(429, 9, 21, 1, '', 1370666868),
(432, 12, 21, 1, '', 1370666868),
(433, 13, 21, 1, '', 1370666868),
(434, 14, 21, 1, '', 1370666868),
(435, 15, 21, 1, '', 1370666868),
(436, 16, 21, 1, '', 1370666868),
(437, 17, 21, 1, '', 1370666868),
(438, 18, 21, 1, '', 1370666868),
(439, 19, 21, 1, '', 1370666868),
(440, 20, 21, 1, '', 1370666868),
(441, 21, 21, 1, '', 1370666868),
(442, 1, 22, 0, 'Male', 1370666902),
(443, 2, 22, 0, '', 1370666902),
(444, 3, 22, 0, '', 1370666902),
(445, 4, 22, 0, '', 1370666902),
(446, 5, 22, 0, '', 1370666902),
(447, 6, 22, 0, '', 1370666902),
(448, 7, 22, 0, '', 1370666902),
(449, 8, 22, 0, '', 1370666902),
(450, 9, 22, 0, '', 1370666902),
(453, 12, 22, 0, '', 1370666902),
(454, 13, 22, 0, '', 1370666902),
(455, 14, 22, 0, '', 1370666902),
(456, 15, 22, 0, '', 1370666902),
(457, 16, 22, 0, '', 1370666902),
(458, 17, 22, 0, '', 1370666902),
(459, 18, 22, 0, '', 1370666902),
(460, 19, 22, 0, '', 1370666902),
(461, 20, 22, 0, '', 1370666902),
(462, 21, 22, 0, '', 1370666902),
(463, 1, 23, 1, 'Male', 1370666918),
(464, 2, 23, 1, '', 1370666918),
(465, 3, 23, 1, '', 1370666918),
(466, 4, 23, 1, '', 1370666918),
(467, 5, 23, 1, '', 1370666918),
(468, 6, 23, 1, '', 1370666918),
(469, 7, 23, 1, '', 1370666918),
(470, 8, 23, 1, '', 1370666918),
(471, 9, 23, 1, '', 1370666918),
(474, 12, 23, 1, '', 1370666918),
(475, 13, 23, 1, '', 1370666918),
(476, 14, 23, 1, '', 1370666918),
(477, 15, 23, 1, '', 1370666918),
(478, 16, 23, 1, '', 1370666918),
(479, 17, 23, 1, '', 1370666918),
(480, 18, 23, 1, '', 1370666918),
(481, 19, 23, 1, '', 1370666918),
(482, 20, 23, 1, '', 1370666918),
(483, 21, 23, 1, '', 1370666918),
(484, 1, 24, 0, 'Male', 1370667502),
(485, 2, 24, 0, '', 1370667502),
(486, 3, 24, 0, '', 1370667502),
(487, 4, 24, 0, '', 1370667502),
(488, 5, 24, 0, '', 1370667502),
(489, 6, 24, 0, '', 1370667502),
(490, 7, 24, 0, '', 1370667502),
(491, 8, 24, 0, '', 1370667502),
(492, 9, 24, 0, '', 1370667502),
(495, 12, 24, 0, '', 1370667502),
(496, 13, 24, 0, '', 1370667502),
(497, 14, 24, 0, '', 1370667502),
(498, 15, 24, 0, '', 1370667502),
(499, 16, 24, 0, '', 1370667502),
(500, 17, 24, 0, '', 1370667502),
(501, 18, 24, 0, '', 1370667502),
(502, 19, 24, 0, '', 1370667502),
(503, 20, 24, 0, '', 1370667502),
(504, 21, 24, 0, '', 1370667502),
(505, 1, 25, 0, 'Male', 1370667544),
(506, 2, 25, 0, '', 1370667544),
(507, 3, 25, 0, '', 1370667544),
(508, 4, 25, 0, '', 1370667544),
(509, 5, 25, 0, '', 1370667544),
(510, 6, 25, 0, '', 1370667544),
(511, 7, 25, 0, '', 1370667544),
(512, 8, 25, 0, '', 1370667544),
(513, 9, 25, 0, '', 1370667544),
(516, 12, 25, 0, '', 1370667544),
(517, 13, 25, 0, '', 1370667544),
(518, 14, 25, 0, '', 1370667544),
(519, 15, 25, 0, '', 1370667544),
(520, 16, 25, 0, '', 1370667544),
(521, 17, 25, 0, '', 1370667544),
(522, 18, 25, 0, '', 1370667544),
(523, 19, 25, 0, '', 1370667544),
(524, 20, 25, 0, '', 1370667544),
(525, 21, 25, 0, '', 1370667544),
(526, 1, 26, 0, 'Male', 1370667608),
(527, 2, 26, 0, '', 1370667608),
(528, 3, 26, 0, '', 1370667608),
(529, 4, 26, 0, '', 1370667608),
(530, 5, 26, 0, '', 1370667608),
(531, 6, 26, 0, '', 1370667608),
(532, 7, 26, 0, '', 1370667608),
(533, 8, 26, 0, '', 1370667608),
(534, 9, 26, 0, '', 1370667608),
(537, 12, 26, 0, '', 1370667608),
(538, 13, 26, 0, '', 1370667608),
(539, 14, 26, 0, '', 1370667608),
(540, 15, 26, 0, '', 1370667608),
(541, 16, 26, 0, '', 1370667608),
(542, 17, 26, 0, '', 1370667608),
(543, 18, 26, 0, '', 1370667608),
(544, 19, 26, 0, '', 1370667608),
(545, 20, 26, 0, '', 1370667608),
(546, 21, 26, 0, '', 1370667608),
(547, 22, 24, 0, '', 1370667771),
(548, 22, 25, 0, '', 1370667771),
(549, 22, 26, 0, '', 1370667771),
(550, 22, 1, 1, 'Allison Reyes', 1370670962),
(551, 22, 3, 0, '', 1370667771),
(552, 22, 8, 0, '', 1370667771),
(553, 22, 2, 1, 'Jake Lewis', 1370671421),
(554, 22, 9, 0, '', 1370667771),
(555, 22, 6, 0, '', 1370667771),
(556, 22, 4, 0, '', 1370667771),
(557, 22, 7, 0, '', 1370667771),
(558, 22, 5, 0, '', 1370667771),
(559, 22, 16, 1, '', 1370667771),
(560, 22, 17, 0, '', 1370667771),
(561, 22, 20, 1, '', 1370667771),
(562, 22, 21, 1, '', 1370667771),
(563, 22, 22, 0, '', 1370667771),
(564, 22, 23, 1, '', 1370667771),
(565, 22, 18, 1, '', 1370667771),
(566, 22, 19, 1, '', 1370667771),
(567, 22, 10, 1, '', 1370667771),
(568, 22, 11, 1, '', 1370667771),
(569, 22, 12, 0, '', 1370667771),
(570, 22, 13, 0, '', 1370667771),
(571, 22, 14, 1, '', 1370667771),
(572, 22, 15, 1, '', 1370667771),
(573, 1, 27, 0, 'Male', 1370671197),
(574, 2, 27, 0, '', 1370671197),
(575, 3, 27, 0, '', 1370671197),
(576, 4, 27, 0, '', 1370671197),
(577, 5, 27, 0, '', 1370671197),
(578, 6, 27, 0, '', 1370671197),
(579, 7, 27, 0, '', 1370671197),
(580, 8, 27, 0, '', 1370671197),
(581, 9, 27, 0, '', 1370671197),
(582, 12, 27, 0, '', 1370671197),
(583, 13, 27, 0, '', 1370671197),
(584, 14, 27, 0, '', 1370671197),
(585, 15, 27, 0, '', 1370671197),
(586, 16, 27, 0, '', 1370671197),
(587, 17, 27, 0, '', 1370671197),
(588, 18, 27, 0, '', 1370671197),
(589, 19, 27, 0, '', 1370671197),
(590, 20, 27, 0, '', 1370671197),
(591, 21, 27, 0, '', 1370671197),
(592, 22, 27, 0, 'Oliver Tidwell', 1370671197),
(593, 1, 28, 0, 'Female', 1370671228),
(594, 2, 28, 0, '', 1370671228),
(595, 3, 28, 0, '', 1370671228),
(596, 4, 28, 0, '', 1370671228),
(597, 5, 28, 0, '', 1370671228),
(598, 6, 28, 0, '', 1370671228),
(599, 7, 28, 0, '', 1370671228),
(600, 8, 28, 0, '', 1370671228),
(601, 9, 28, 0, '', 1370671228),
(602, 12, 28, 0, '', 1370671228),
(603, 13, 28, 0, '', 1370671228),
(604, 14, 28, 0, '', 1370671228),
(605, 15, 28, 0, '', 1370671228),
(606, 16, 28, 0, '', 1370671228),
(607, 17, 28, 0, '', 1370671228),
(608, 18, 28, 0, '', 1370671228),
(609, 19, 28, 0, '', 1370671228),
(610, 20, 28, 0, '', 1370671228),
(611, 21, 28, 0, '', 1370671228),
(612, 22, 28, 0, 'Kara Thrace', 1370671228),
(613, 1, 29, 1, 'Female', 1370671257),
(614, 2, 29, 1, '', 1370671257),
(615, 3, 29, 1, '', 1370671257),
(616, 4, 29, 1, '', 1370671257),
(617, 5, 29, 1, '', 1370671257),
(618, 6, 29, 1, '', 1370671257),
(619, 7, 29, 1, '', 1370671257),
(620, 8, 29, 1, '', 1370671257),
(621, 9, 29, 1, '', 1370671257),
(622, 12, 29, 1, '', 1370671257),
(623, 13, 29, 1, '', 1370671257),
(624, 14, 29, 1, '', 1370671257),
(625, 15, 29, 1, '', 1370671257),
(626, 16, 29, 1, '', 1370671257),
(627, 17, 29, 1, '', 1370671257),
(628, 18, 29, 1, '', 1370671257),
(629, 19, 29, 1, '', 1370671257),
(630, 20, 29, 1, '', 1370671257),
(631, 21, 29, 1, '', 1370671257),
(632, 22, 29, 1, '', 1370671257),
(633, 1, 30, 1, 'Male', 1370674690),
(634, 2, 30, 1, '', 1370674690),
(635, 3, 30, 1, '', 1370674690),
(636, 4, 30, 1, '', 1370674690),
(637, 5, 30, 1, '', 1370674690),
(638, 6, 30, 1, '', 1370674690),
(639, 7, 30, 1, '', 1370674690),
(640, 8, 30, 1, '', 1370674690),
(641, 9, 30, 1, '', 1370674690),
(642, 12, 30, 1, '', 1370674690),
(643, 13, 30, 1, '', 1370674690),
(644, 14, 30, 1, '', 1370674690),
(645, 15, 30, 1, '', 1370674690),
(646, 16, 30, 1, '', 1370674690),
(647, 17, 30, 1, '', 1370674690),
(648, 18, 30, 1, '', 1370674690),
(649, 19, 30, 1, '', 1370674690),
(650, 20, 30, 1, '', 1370674690),
(651, 21, 30, 1, '', 1370674690),
(652, 22, 30, 1, '', 1370674690);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_fields`
--

CREATE TABLE IF NOT EXISTS `nova_characters_fields` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `field_type` enum('text','select','textarea') NOT NULL DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text NOT NULL,
  `field_label_page` text NOT NULL,
  `field_value` text NOT NULL,
  `field_order` int(5) NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int(3) NOT NULL DEFAULT '5',
  `field_section` int(8) NOT NULL DEFAULT '1',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `nova_characters_fields`
--

INSERT INTO `nova_characters_fields` (`field_id`, `field_type`, `field_name`, `field_fid`, `field_class`, `field_label_page`, `field_value`, `field_order`, `field_display`, `field_rows`, `field_section`) VALUES
(1, 'select', 'gender', 'gender', '', 'Gender', '', 1, 'y', 5, 1),
(2, 'text', 'species', 'species', '', 'Species', '', 2, 'y', 5, 1),
(3, 'text', 'age', 'age', 'small', 'Age', '', 3, 'y', 5, 1),
(4, 'text', 'height', 'height', 'medium', 'Height', '', 1, 'y', 5, 2),
(5, 'text', 'weight', 'weight', 'medium', 'Weight', '', 2, 'y', 5, 2),
(6, 'text', 'hair_color', 'hair_color', '', 'Hair Color', '', 3, 'y', 5, 2),
(7, 'text', 'eye_color', 'eye_color', '', 'Eye Color', '', 4, 'y', 5, 2),
(8, 'textarea', 'physical_desc', 'physical_desc', '', 'Physical Description', '', 5, 'y', 5, 2),
(9, 'textarea', 'personality', 'personality', '', 'Overview', '', 0, 'y', 5, 4),
(12, 'textarea', 'hobbies', 'hobbies', '', 'Interests', '', 1, 'y', 5, 4),
(13, 'text', 'spouse', 'spouse', '', 'Spouse', '', 0, 'y', 5, 3),
(14, 'textarea', 'children', 'children', '', 'Children', '', 1, 'y', 5, 3),
(15, 'text', 'father', 'father', '', 'Father', '', 2, 'y', 5, 3),
(16, 'text', 'mother', 'mother', '', 'Mother', '', 3, 'y', 5, 3),
(17, 'textarea', 'brothers', 'brothers', '', 'Brother(s)', '', 4, 'y', 5, 3),
(18, 'textarea', 'sisters', 'sisters', '', 'Sister(s)', '', 5, 'y', 5, 3),
(19, 'textarea', 'other_family', 'other_family', '', 'Other Family', '', 6, 'y', 5, 3),
(20, 'textarea', 'history', 'history', '', 'History', '', 0, 'y', 20, 5),
(21, 'textarea', 'service_record', 'service_record', '', 'Service Record', '', 1, 'y', 15, 5),
(22, 'text', 'bfinfobase', 'bfinfobase', '', 'Bravo Fleet Infobase', '', 0, 'y', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_promotions`
--

CREATE TABLE IF NOT EXISTS `nova_characters_promotions` (
  `prom_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prom_user` int(8) NOT NULL,
  `prom_char` int(8) NOT NULL,
  `prom_old_order` int(8) NOT NULL,
  `prom_old_rank` varchar(100) NOT NULL DEFAULT '',
  `prom_new_order` int(8) NOT NULL,
  `prom_new_rank` varchar(100) NOT NULL DEFAULT '',
  `prom_date` bigint(20) NOT NULL,
  PRIMARY KEY (`prom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_sections`
--

CREATE TABLE IF NOT EXISTS `nova_characters_sections` (
  `section_id` int(8) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) NOT NULL DEFAULT '',
  `section_order` int(5) NOT NULL,
  `section_tab` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nova_characters_sections`
--

INSERT INTO `nova_characters_sections` (`section_id`, `section_name`, `section_order`, `section_tab`) VALUES
(1, 'Character Information', 0, 1),
(2, 'Physical Appearance', 1, 1),
(3, 'Family', 2, 1),
(4, 'Personality &amp; Traits', 0, 2),
(5, '', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_tabs`
--

CREATE TABLE IF NOT EXISTS `nova_characters_tabs` (
  `tab_id` int(5) NOT NULL AUTO_INCREMENT,
  `tab_order` int(5) NOT NULL,
  `tab_name` varchar(100) NOT NULL DEFAULT '',
  `tab_link_id` varchar(50) NOT NULL DEFAULT 'one',
  `tab_display` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`tab_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nova_characters_tabs`
--

INSERT INTO `nova_characters_tabs` (`tab_id`, `tab_order`, `tab_name`, `tab_link_id`, `tab_display`) VALUES
(1, 1, 'Basic Info', 'one', 'y'),
(2, 2, 'Personality', 'two', 'y'),
(3, 3, 'History', 'three', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_characters_values`
--

CREATE TABLE IF NOT EXISTS `nova_characters_values` (
  `value_id` int(10) NOT NULL AUTO_INCREMENT,
  `value_field` int(10) NOT NULL,
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text NOT NULL,
  `value_order` int(5) NOT NULL,
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `nova_characters_values`
--

INSERT INTO `nova_characters_values` (`value_id`, `value_field`, `value_field_value`, `value_selected`, `value_content`, `value_order`) VALUES
(1, 1, 'Male', '', 'Male', 1),
(2, 1, 'Female', '', 'Female', 2),
(3, 1, 'Hermaphrodite', '', 'Hermaphrodite', 3),
(4, 1, 'Neuter', '', 'Neuter', 4);

-- --------------------------------------------------------

--
-- Table structure for table `nova_coc`
--

CREATE TABLE IF NOT EXISTS `nova_coc` (
  `coc_id` int(5) NOT NULL AUTO_INCREMENT,
  `coc_crew` int(8) NOT NULL,
  `coc_order` int(5) NOT NULL,
  PRIMARY KEY (`coc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `nova_coc`
--

INSERT INTO `nova_coc` (`coc_id`, `coc_crew`, `coc_order`) VALUES
(1, 1, 0),
(2, 2, 1),
(3, 6, 2),
(4, 4, 3),
(5, 3, 4),
(6, 8, 5),
(7, 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `nova_departments_ds9`
--

CREATE TABLE IF NOT EXISTS `nova_departments_ds9` (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL DEFAULT '',
  `dept_desc` text NOT NULL,
  `dept_order` int(5) NOT NULL,
  `dept_display` enum('y','n') NOT NULL DEFAULT 'y',
  `dept_type` enum('playing','nonplaying') NOT NULL DEFAULT 'playing',
  `dept_parent` int(10) NOT NULL DEFAULT '0',
  `dept_manifest` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `nova_departments_ds9`
--

INSERT INTO `nova_departments_ds9` (`dept_id`, `dept_name`, `dept_desc`, `dept_order`, `dept_display`, `dept_type`, `dept_parent`, `dept_manifest`) VALUES
(1, 'Faltan Command', 'Faltan Station personnel are responsible for overseeing Faltan Station, as well as supporting regional operations under Task Force 93, the Corps of Engineers, the Diplomatic Corps, the Marine Corps and others.', 0, 'y', 'playing', 0, 1),
(14, 'Faltan Station', 'Faltan Station personnel are responsible for the smooth flow of operations throughout the system, including Faltan Command and Faltan Engineering, as well as resolving differences between the Federation and the other residents of the system, including the Faltan peoples and the Caerus Mining Company. ', 2, 'y', 'playing', 0, 1),
(15, 'Starfleet Corps of Engineers, Raeyan Operations', 'The Raeyan Operations unit of the Starfleet Corps of Engineers was commissioned in September 2387 as a predominately greenfield infrastructure deployment operation to revitalize the Raeyan Sector and establish a permanent foothold in the Raeyan Transit Corridor. To this end, this division is under the direct oversight of Starfleet Research and Development, although it also provides Fleet support services from Raeyan Engineering, a set of docks and manufacturing facilities adjacent to the lunar colony above Faltan III.', 10, 'y', 'playing', 0, 1),
(16, '4th Marine Expeditionary Unit', '<p>The 4th Marine Expeditionary Unit is a specialized expeditionary quick reaction force with reinforced infantry, aviation, logistics and command elements. With a size of approximately 2500 personnel, it is barracked in a facility adjacent to Faltan Command on Faltan III.</p>', 30, 'y', 'playing', 0, 1),
(17, '93rd Marine Battalion', '<p>The 93rd Battalion is a reinforced infantry battalion currently operating under the 4th Marine Expeditionary Unit. It is comprised of approximately eleven hundred soldiers between three infantry companies, a weapons company and a command company.</p>', 1, 'y', 'playing', 16, 1),
(18, '58th Combat Logistics Battalion', '<p>The 58th Combat Logistics Battalion is a logistics battalion currently operating under the 4th Marine Expeditionary Unit. Before its current tenure as the Raeyan Sector marine logistics unit for Task Force 93, it was the primary marine logistics unit for Task Force 58.</p>', 20, 'y', 'playing', 16, 1),
(19, 'Marine Aviation Group 93', '<p>Marine Aviation Group 93 is a starfighter aviation unit comprised of one Javelin-class air superiority squadron, two Valkyrie-class multi-purpose squadrons, one Peregrine-class fighter/bomber squadron, two logistical squadrons of Arrow, Argo and Type-11 shuttles, and a ground support company.</p>', 10, 'y', 'playing', 16, 1),
(20, 'Federation Diplomatic Corps', '', 20, 'y', 'playing', 0, 1),
(21, 'Rapid Response Unit', '<p>The Rapid Response Unit is a full-function Starfleet mission unit deployed on an as-needed basis from one or more of the vessels assigned to Faltan Station. While its personnel originate from a number of separate structures including Task Force 93, the Starfleet Marine Corps, the Starfleet Corps of Engineers and the Federation Diplomatic Corps, when active, the Rapid Response Unit represents a unified command. When not active, members of the Unit typically hold secondary duties in another unit operating from Faltan Station.</p>', 11, 'y', 'playing', 0, 1),
(23, 'Analysis Division', 'The Analysis Division of the Rayean Rapid Response Unit is a cross-departmental unit including analysts, scientists, engineers, psychologists and others capable of performing mission-specialized analysis; because of their traditional functions for starships operations, the Analysis Unit also doubles as supporting the majority of critical ship functions. They are organized as a unified command under the Executive Officer, who may also represent a department head role within the the Division.', 10, 'y', 'playing', 21, 1),
(24, 'Tactical Division', 'The Tactical Division of the Raeyan Rapid Response Unit is a cross-departmental unit including tactical, intelligence and marine personnel capable of performing a range of tactical operations both from the deployment platform and beyond. They are organized as a unified command structure under a Tactical Division CO and then a series of department heads for the remainder of the departments not represented directly by the Tactical Division CO.', 5, 'y', 'playing', 21, 1),
(25, 'Faltan Government', '<p>Faltan Government is an autonomous government responsible for the Faltan Colony on Faltan III, including Armed Services, Diplomatic Services, and Support Services divisions.</p>\n\n<p>The Armed Services division primarily focuses on internal policing; however, they do maintain a formidable array of orbital defense systems and short-ranged tactical fighters capable of fending off incursions by raiders and small regional powers, as well as addressing issues if they arise on the lunar colony. Preferring to focus on survival instead of expansion, though, their only interstellar capabilities stem from a pair of medium cruisers and the experimental vessel that first brought them to the Raeyan Sector four hundred years ago. Seldom do these vessels ever travel beyond the Faltan system.</p>\n\n<p>Similarly, the Diplomatic Services division exists almost exclusively to liaise with the mining colony and the Federation. They have made contact with several nearby species but have chosen not to maintain any more than cursory connections with them.</p>', 40, 'y', 'playing', 0, 2),
(26, 'Caerus Mining Company', '<p>The Caerus Mining Company is an independent corporation initially founded in Federation space. The Faltan Lunar Colony is run by one of Caerus'' managing partners. The majority of all personnel are classed under Operational Services, with the exception of a small group of mercenaries classified as Security Services. With rampant crime among its workers, Security Services is both strict and brutal, although they often follow a very different playbook than Starfleet.</p>', 41, 'y', 'playing', 0, 2),
(27, 'Foreign Diplomatic Residents', '<p>Faltan Command includes an Diplomatic Corps facility where Starfleet has invited regional powers to set up permanent consulates. Several regional powers have accepted this invitation, while others only send temporary envoys when situations arise, and a few have not responded at all.</p>', 42, 'y', 'playing', 0, 2),
(29, 'Starfleet Command', '', 55, 'y', 'playing', 0, 3),
(31, 'Starfleet Fourth Fleet', '', 50, 'y', 'playing', 0, 3),
(32, 'Task Force 93', '', 52, 'n', 'playing', 31, 3),
(33, 'Romulan Star Empire', '', 60, 'y', 'playing', 0, 3),
(34, 'Romulan Government', '', 64, 'y', 'playing', 33, 3),
(35, 'Romulan Star Navy', '', 63, 'y', 'playing', 33, 3),
(36, 'Romulan Tal''Shiar', '', 64, 'y', 'playing', 33, 3),
(37, 'Klingon Empire', '', 70, 'y', 'playing', 0, 3),
(39, 'Starfleet Fourth Fleet Command', '', 51, 'y', 'playing', 31, 3);

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking`
--

CREATE TABLE IF NOT EXISTS `nova_docking` (
  `docking_id` int(5) NOT NULL AUTO_INCREMENT,
  `docking_sim_name` varchar(255) NOT NULL DEFAULT '',
  `docking_sim_url` text NOT NULL,
  `docking_gm_name` varchar(255) NOT NULL DEFAULT '',
  `docking_gm_email` varchar(255) NOT NULL DEFAULT '',
  `docking_status` enum('active','inactive','pending') NOT NULL DEFAULT 'pending',
  `docking_date` bigint(20) NOT NULL,
  PRIMARY KEY (`docking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_data`
--

CREATE TABLE IF NOT EXISTS `nova_docking_data` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_docking_item` int(5) NOT NULL,
  `data_field` int(10) NOT NULL,
  `data_value` text NOT NULL,
  `data_updated` bigint(20) NOT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_fields`
--

CREATE TABLE IF NOT EXISTS `nova_docking_fields` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `field_type` enum('text','select','textarea') NOT NULL DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text NOT NULL,
  `field_label_page` text NOT NULL,
  `field_value` text NOT NULL,
  `field_selected` varchar(20) NOT NULL DEFAULT '',
  `field_order` int(5) NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int(3) NOT NULL DEFAULT '5',
  `field_section` int(8) NOT NULL DEFAULT '1',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_sections`
--

CREATE TABLE IF NOT EXISTS `nova_docking_sections` (
  `section_id` int(8) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) NOT NULL DEFAULT '',
  `section_order` int(5) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_docking_values`
--

CREATE TABLE IF NOT EXISTS `nova_docking_values` (
  `value_id` int(10) NOT NULL AUTO_INCREMENT,
  `value_field` int(10) NOT NULL,
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text NOT NULL,
  `value_order` int(5) NOT NULL,
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_login_attempts`
--

CREATE TABLE IF NOT EXISTS `nova_login_attempts` (
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `login_ip` varchar(45) NOT NULL DEFAULT '',
  `login_email` varchar(100) NOT NULL DEFAULT '',
  `login_time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_manifests`
--

CREATE TABLE IF NOT EXISTS `nova_manifests` (
  `manifest_id` int(5) NOT NULL AUTO_INCREMENT,
  `manifest_name` varchar(255) NOT NULL DEFAULT '',
  `manifest_order` int(5) NOT NULL,
  `manifest_desc` text NOT NULL,
  `manifest_header_content` text NOT NULL,
  `manifest_display` enum('y','n') NOT NULL DEFAULT 'y',
  `manifest_default` enum('y','n') NOT NULL DEFAULT 'n',
  `manifest_view` text NOT NULL,
  PRIMARY KEY (`manifest_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `nova_manifests`
--

INSERT INTO `nova_manifests` (`manifest_id`, `manifest_name`, `manifest_order`, `manifest_desc`, `manifest_header_content`, `manifest_display`, `manifest_default`, `manifest_view`) VALUES
(1, 'Faltan Station', 0, 'Personnel under the Faltan Station command structure.', '', 'y', 'y', '$(''tr.active'').show();,$(''tr.npc'').show();'),
(2, 'Faltan Co-Resident Populations', 1, 'Residents of the Faltan System that are not under the Faltan Station command structure.', '', 'y', 'n', '$(''tr.active'').show();,$(''tr.npc'').show();'),
(3, 'Recurring Personnel', 2, 'Personnel that occasionally interact with Faltan Station but do not reside permanently in the system.', '', 'y', 'n', '$(''tr.active'').show();,$(''tr.npc'').show();');

-- --------------------------------------------------------

--
-- Table structure for table `nova_menu_categories`
--

CREATE TABLE IF NOT EXISTS `nova_menu_categories` (
  `menucat_id` int(5) NOT NULL AUTO_INCREMENT,
  `menucat_order` int(5) NOT NULL DEFAULT '1',
  `menucat_menu_cat` varchar(20) NOT NULL DEFAULT '',
  `menucat_name` varchar(100) NOT NULL DEFAULT '',
  `menucat_type` enum('sub','adminsub') NOT NULL DEFAULT 'sub',
  PRIMARY KEY (`menucat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `nova_menu_categories`
--

INSERT INTO `nova_menu_categories` (`menucat_id`, `menucat_order`, `menucat_menu_cat`, `menucat_name`, `menucat_type`) VALUES
(1, 0, 'main', 'Station', 'sub'),
(2, 1, 'personnel', 'Personnel', 'sub'),
(3, 2, 'sim', 'Mission', 'sub'),
(4, 3, 'admin', 'Admin Control Panel', 'adminsub'),
(5, 4, 'write', 'Write', 'adminsub'),
(6, 5, 'messages', 'Private Messages', 'adminsub'),
(7, 6, 'site', 'Site Management', 'adminsub'),
(8, 7, 'manage', 'Management', 'adminsub'),
(9, 8, 'characters', 'Characters', 'adminsub'),
(10, 9, 'user', 'User', 'adminsub'),
(11, 10, 'report', 'Reports', 'adminsub'),
(12, 11, 'wiki', 'Wiki', 'sub');

-- --------------------------------------------------------

--
-- Table structure for table `nova_menu_items`
--

CREATE TABLE IF NOT EXISTS `nova_menu_items` (
  `menu_id` int(8) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(150) NOT NULL DEFAULT '',
  `menu_group` int(4) NOT NULL,
  `menu_order` int(4) NOT NULL,
  `menu_link` text NOT NULL,
  `menu_link_type` enum('onsite','offsite') NOT NULL DEFAULT 'onsite',
  `menu_need_login` enum('y','n','none') NOT NULL DEFAULT 'none',
  `menu_use_access` enum('y','n') NOT NULL DEFAULT 'n',
  `menu_access` varchar(255) NOT NULL DEFAULT '',
  `menu_access_level` int(4) NOT NULL DEFAULT '0',
  `menu_type` enum('main','sub','adminsub') NOT NULL DEFAULT 'main',
  `menu_cat` varchar(20) NOT NULL DEFAULT '',
  `menu_display` enum('y','n') NOT NULL DEFAULT 'y',
  `menu_sim_type` int(5) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `nova_menu_items`
--

INSERT INTO `nova_menu_items` (`menu_id`, `menu_name`, `menu_group`, `menu_order`, `menu_link`, `menu_link_type`, `menu_need_login`, `menu_use_access`, `menu_access`, `menu_access_level`, `menu_type`, `menu_cat`, `menu_display`, `menu_sim_type`) VALUES
(1, 'Station', 0, 1, 'main/about', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(2, 'Personnel', 0, 2, 'personnel/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(3, 'Mission', 0, 3, 'sim/missions', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(4, 'Infobase', 0, 4, 'wiki/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(6, 'Control Panel', 0, 5, 'admin/index', 'onsite', 'y', 'n', '', 0, 'main', 'main', 'y', 1),
(7, 'Log In', 0, 7, 'login/index', 'onsite', 'n', 'n', '', 0, 'main', 'main', 'y', 1),
(8, 'Log Out', 0, 8, 'login/logout', 'onsite', 'y', 'n', '', 0, 'main', 'main', 'y', 1),
(9, 'Welcome', 0, 0, 'main/index', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(10, 'News', 0, 2, 'main/news', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(16, 'Manifest', 0, 0, 'personnel/index', 'onsite', 'none', 'n', '', 0, 'sub', 'personnel', 'y', 1),
(17, 'Chain of Command', 0, 4, 'personnel/coc', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(19, 'Join', 0, 7, 'main/join', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(20, 'The Sim', 0, 0, 'sim/index', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'n', 1),
(21, 'Missions', 0, 1, 'sim/missions', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(22, 'Mission Groups', 0, 2, 'sim/missions/group', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(23, 'Personal Logs', 0, 3, 'sim/listlogs', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(24, 'Stats', 0, 4, 'sim/stats', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'n', 1),
(25, 'Crew Awards', 0, 5, 'sim/awards', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'n', 1),
(26, 'Tour', 1, 6, 'sim/tour', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'n', 1),
(27, 'Specifications', 1, 1, 'sim/specs', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(28, 'Chat', 1, 5, 'main/chat', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(29, 'Departments', 1, 3, 'sim/departments', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(32, 'Main Page', 0, 0, 'wiki/index', 'onsite', 'none', 'n', '', 0, 'sub', 'wiki', 'y', 1),
(33, 'Recent Changes', 0, 1, 'wiki/recent', 'onsite', 'none', 'n', '', 0, 'sub', 'wiki', 'y', 1),
(34, 'Categories', 0, 2, 'wiki/categories', 'onsite', 'none', 'n', '', 0, 'sub', 'wiki', 'y', 1),
(35, 'Manage Pages', 1, 0, 'wiki/managepages', 'onsite', 'y', 'y', 'wiki/page', 0, 'sub', 'wiki', 'y', 1),
(36, 'Manage Categories', 1, 1, 'wiki/managecategories', 'onsite', 'y', 'y', 'wiki/categories', 0, 'sub', 'wiki', 'y', 1),
(37, 'Create New Page', 2, 0, 'wiki/page', 'onsite', 'y', 'y', 'wiki/page', 0, 'sub', 'wiki', 'y', 1),
(38, 'Control Panel', 0, 0, 'admin/index', 'onsite', 'none', 'y', 'admin/index', 0, 'adminsub', 'admin', 'y', 1),
(39, 'Writing Control Panel', 0, 0, 'write/index', 'onsite', 'none', 'y', 'write/index', 0, 'adminsub', 'write', 'y', 1),
(40, 'Write Mission Post', 0, 1, 'write/missionpost', 'onsite', 'none', 'y', 'write/missionpost', 0, 'adminsub', 'write', 'y', 1),
(41, 'Write Personal Log', 0, 2, 'write/personallog', 'onsite', 'none', 'y', 'write/personallog', 0, 'adminsub', 'write', 'y', 1),
(42, 'Write News Item', 0, 3, 'write/newsitem', 'onsite', 'none', 'y', 'write/newsitem', 0, 'adminsub', 'write', 'y', 1),
(43, 'Inbox', 0, 0, 'messages/index', 'onsite', 'none', 'y', 'messages/index', 0, 'adminsub', 'messages', 'y', 1),
(44, 'Sent Messages', 0, 1, 'messages/sent', 'onsite', 'none', 'y', 'messages/index', 0, 'adminsub', 'messages', 'y', 1),
(45, 'Write New Message', 0, 2, 'messages/write', 'onsite', 'none', 'y', 'messages/index', 0, 'adminsub', 'messages', 'y', 1),
(46, 'Settings', 0, 0, 'site/settings', 'onsite', 'none', 'y', 'site/settings', 0, 'adminsub', 'site', 'y', 1),
(47, 'Messages &amp; Titles', 0, 1, 'site/messages', 'onsite', 'none', 'y', 'site/messages', 0, 'adminsub', 'site', 'y', 1),
(48, 'Menu Items', 0, 2, 'site/menus', 'onsite', 'none', 'y', 'site/menus', 0, 'adminsub', 'site', 'y', 1),
(49, 'Access Roles', 0, 3, 'site/roles', 'onsite', 'none', 'y', 'site/roles', 0, 'adminsub', 'site', 'y', 1),
(50, 'Ban Controls', 0, 4, 'site/bans', 'onsite', 'none', 'y', 'site/bans', 0, 'adminsub', 'site', 'y', 1),
(51, 'Site Manifests', 0, 5, 'site/manifests', 'onsite', 'none', 'y', 'site/manifests', 0, 'adminsub', 'site', 'y', 1),
(52, 'Bio Form', 1, 0, 'site/bioform', 'onsite', 'none', 'y', 'site/bioform', 0, 'adminsub', 'site', 'y', 1),
(53, 'Specs Form', 1, 1, 'site/specsform', 'onsite', 'none', 'y', 'site/specsform', 0, 'adminsub', 'site', 'y', 1),
(54, 'Tour Form', 1, 2, 'site/tourform', 'onsite', 'none', 'y', 'site/tourform', 0, 'adminsub', 'site', 'y', 1),
(55, 'Docking Form', 1, 3, 'site/dockingform', 'onsite', 'none', 'y', 'site/dockingform', 0, 'adminsub', 'site', 'y', 3),
(56, 'Sim Types', 2, 0, 'site/simtypes', 'onsite', 'none', 'y', 'site/simtypes', 0, 'adminsub', 'site', 'y', 1),
(57, 'Rank Catalogue', 2, 1, 'site/catalogueranks', 'onsite', 'none', 'y', 'site/catalogueranks', 0, 'adminsub', 'site', 'y', 1),
(58, 'Skin Catalogue', 2, 2, 'site/catalogueskins', 'onsite', 'none', 'y', 'site/catalogueskins', 0, 'adminsub', 'site', 'y', 1),
(59, 'Awards', 0, 0, 'manage/awards', 'onsite', 'none', 'y', 'manage/awards', 0, 'adminsub', 'manage', 'y', 1),
(60, 'Departments', 0, 1, 'manage/depts', 'onsite', 'none', 'y', 'manage/depts', 0, 'adminsub', 'manage', 'y', 1),
(61, 'Positions', 0, 2, 'manage/positions', 'onsite', 'none', 'y', 'manage/positions', 0, 'adminsub', 'manage', 'y', 1),
(62, 'Ranks', 0, 3, 'manage/ranks', 'onsite', 'none', 'y', 'manage/ranks', 0, 'adminsub', 'manage', 'y', 1),
(63, 'Missions', 1, 0, 'manage/missions', 'onsite', 'none', 'y', 'manage/missions', 0, 'adminsub', 'manage', 'y', 1),
(64, 'Mission Groups', 1, 1, 'manage/missiongroups', 'onsite', 'none', 'y', 'manage/missions', 0, 'adminsub', 'manage', 'y', 1),
(65, 'Mission Posts', 1, 2, 'manage/posts', 'onsite', 'none', 'y', 'manage/posts', 0, 'adminsub', 'manage', 'y', 1),
(66, 'Personal Logs', 1, 3, 'manage/logs', 'onsite', 'none', 'y', 'manage/logs', 0, 'adminsub', 'manage', 'y', 1),
(67, 'News Items', 1, 4, 'manage/news', 'onsite', 'none', 'y', 'manage/news', 0, 'adminsub', 'manage', 'y', 1),
(68, 'News Categories', 1, 5, 'manage/newscats', 'onsite', 'none', 'y', 'manage/newscats', 0, 'adminsub', 'manage', 'y', 1),
(69, 'Comments', 1, 6, 'manage/comments', 'onsite', 'none', 'y', 'manage/comments', 0, 'adminsub', 'manage', 'y', 1),
(70, 'Specs', 2, 0, 'manage/specs', 'onsite', 'none', 'y', 'manage/specs', 0, 'adminsub', 'manage', 'y', 1),
(71, 'Tour', 2, 1, 'manage/tour', 'onsite', 'none', 'y', 'manage/tour', 0, 'adminsub', 'manage', 'y', 1),
(72, 'Deck Listing', 2, 2, 'manage/decks', 'onsite', 'none', 'y', 'manage/decks', 0, 'adminsub', 'manage', 'y', 1),
(73, 'Docked Items', 2, 3, 'manage/docked', 'onsite', 'none', 'y', 'manage/docked', 0, 'adminsub', 'manage', 'y', 3),
(74, 'Upload Images', 3, 0, 'upload/index', 'onsite', 'none', 'y', 'upload/index', 0, 'adminsub', 'manage', 'y', 1),
(75, 'Manage Uploads', 3, 1, 'upload/manage', 'onsite', 'none', 'y', 'upload/manage', 0, 'adminsub', 'manage', 'y', 1),
(76, 'All Characters', 0, 0, 'characters/index', 'onsite', 'none', 'y', 'characters/index', 0, 'adminsub', 'characters', 'y', 1),
(77, 'All NPCs', 0, 1, 'characters/npcs', 'onsite', 'none', 'y', 'characters/npcs', 0, 'adminsub', 'characters', 'y', 1),
(78, 'Create Character', 0, 2, 'characters/create', 'onsite', 'none', 'y', 'characters/create', 0, 'adminsub', 'characters', 'y', 1),
(79, 'Chain of Command', 1, 0, 'characters/coc', 'onsite', 'none', 'y', 'characters/coc', 0, 'adminsub', 'characters', 'y', 1),
(80, 'Give/Remove Awards', 1, 1, 'characters/awards', 'onsite', 'none', 'y', 'characters/awards', 0, 'adminsub', 'characters', 'y', 1),
(81, 'My Account', 0, 0, 'user/account', 'onsite', 'none', 'y', 'user/account', 0, 'adminsub', 'user', 'y', 1),
(82, 'My Bio', 0, 1, 'characters/bio', 'onsite', 'none', 'y', 'characters/bio', 0, 'adminsub', 'user', 'y', 1),
(83, 'Site Options', 1, 0, 'user/options', 'onsite', 'none', 'y', 'user/account', 0, 'adminsub', 'user', 'y', 1),
(84, 'Request LOA', 1, 1, 'user/status', 'onsite', 'none', 'y', 'user/account', 0, 'adminsub', 'user', 'y', 1),
(85, 'Award Nominations', 1, 2, 'user/nominate', 'onsite', 'none', 'y', 'user/nominate', 0, 'adminsub', 'user', 'y', 1),
(86, 'All Users', 1, 3, 'user/all', 'onsite', 'none', 'y', 'user/account', 2, 'adminsub', 'user', 'y', 1),
(87, 'Link Characters', 1, 4, 'user/characterlink', 'onsite', 'none', 'y', 'user/account', 2, 'adminsub', 'user', 'y', 1),
(88, 'Crew Activity', 0, 0, 'report/activity', 'onsite', 'none', 'y', 'report/activity', 0, 'adminsub', 'report', 'y', 1),
(89, 'Posting Levels', 0, 1, 'report/posting', 'onsite', 'none', 'y', 'report/posting', 0, 'adminsub', 'report', 'y', 1),
(90, 'Sim Statistics', 0, 2, 'report/stats', 'onsite', 'none', 'y', 'report/stats', 0, 'adminsub', 'report', 'y', 1),
(91, 'Moderation', 1, 0, 'report/moderation', 'onsite', 'none', 'y', 'report/moderation', 0, 'adminsub', 'report', 'y', 1),
(92, 'Milestones', 1, 1, 'report/milestones', 'onsite', 'none', 'y', 'report/milestones', 0, 'adminsub', 'report', 'y', 1),
(93, 'LOA Records', 1, 2, 'report/loa', 'onsite', 'none', 'y', 'report/loa', 0, 'adminsub', 'report', 'y', 1),
(94, 'Award Nominations', 1, 3, 'report/awardnominations', 'onsite', 'none', 'y', 'report/awardnominations', 0, 'adminsub', 'report', 'y', 1),
(95, 'Applications', 1, 4, 'report/applications', 'onsite', 'none', 'y', 'report/applications', 0, 'adminsub', 'report', 'y', 1),
(96, 'System &amp; Versions', 1, 5, 'report/versions', 'onsite', 'none', 'y', 'report/versions', 0, 'adminsub', 'report', 'y', 1),
(98, 'Join', 0, 6, 'main/join', 'onsite', 'n', 'n', '', 0, 'main', 'main', 'y', 1),
(101, 'About', 0, 1, 'main/about', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nova_messages`
--

CREATE TABLE IF NOT EXISTS `nova_messages` (
  `message_id` int(8) NOT NULL AUTO_INCREMENT,
  `message_key` varchar(255) NOT NULL DEFAULT '',
  `message_label` varchar(255) NOT NULL DEFAULT '',
  `message_content` text NOT NULL,
  `message_type` enum('title','message','other') NOT NULL DEFAULT 'message',
  `message_protected` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `nova_messages`
--

INSERT INTO `nova_messages` (`message_id`, `message_key`, `message_label`, `message_content`, `message_type`, `message_protected`) VALUES
(1, 'welcome_slideshow', 'Welcome: Slideshow', '', 'message', 'n'),
(2, 'rules', 'Rules Message', 'Define your sim''s rules through the Site Messages page.', 'message', 'n'),
(3, 'sim', 'Sim Message', 'Define your sim message through the Site Messages page.', 'message', 'n'),
(4, 'wiki_main', 'Wiki Main Page Message', 'Welcome to Thresher Release 1, Anodyne''s integrated mini-wiki included with Nova. You can change this message through the Site Messages page.', 'message', 'n'),
(5, 'credits_perm', 'Permanent Credits', 'Nova has been developed on the <a href=''http://www.codeigniter.com'' target=''_blank''>CodeIgniter</a> PHP framework by <a href=''http://www.ellislab.com'' target=''_blank''>EllisLab</a>.\r\n\r\nIcons used throughout Nova were created by <a href=''http://www.famfamfam.com''>FamFamFam</a> and <a href=''http://www.pinvoke.com''>Pinvoke</a>.', 'message', 'y'),
(6, 'credits', 'Credits', 'Define your site credits through the Site Messages page.', 'message', 'n'),
(7, 'join_disclaimer', 'Join Disclaimer', 'Members are expected to follow the rules and regulations of both the sim and fleet at all times, both in character and out of character. By continuing, you affirm that you will sim in a proper and adequate manner. Members who choose to make ultra short posts, post very infrequently, or post posts with explicit content (above PG-13) will be removed immediately, and by continuing, you agree to this. In addition, in compliance with the Children''s Online Privacy Protection Act of 1998 (COPPA), we do not accept players under the age of 13.  Any players found to be under the age of 13 will be immediately removed without question.  By agreeing to these terms, you are also saying that you are above the age of 13.', 'other', 'n'),
(8, 'join_instructions', 'Join Instructions', 'Define your join instructions through the Site Message page.', 'message', 'n'),
(9, 'join_post', 'Join Sample Post', 'Define your join sample post through the Site Message page.', 'other', 'n'),
(10, 'accept_message', 'User Acceptance Email', 'Define your user acceptance message through the Site Message page.', 'other', 'n'),
(11, 'reject_message', 'User Rejection Message', 'Define your user rejection message through the Site Messages page.', 'other', 'n'),
(12, 'docking_accept_message', 'Docking Acceptance Email', 'Define your docking acceptance message through the Site Message page.', 'other', 'n'),
(13, 'docking_reject_message', 'Docking Rejection Message', 'Define your docking rejection message through the Site Messages page.', 'other', 'n'),
(14, 'contact', 'Contact Instructions', '', 'message', 'n'),
(15, 'welcome_head', 'Welcome Header', '<center>Welcome to Faltan Station</center>', 'title', 'n'),
(16, 'main_credits_title', 'Site Credits Header', 'Site Credits', 'title', 'n'),
(17, 'main_join_title', 'Join Page Header', 'Join', 'title', 'n'),
(18, 'welcome_msg', 'Welcome: Message', '<p>Faltan Station is a set of facilities in the Raeyan Sector near the Raeyan Transit Corridor. Once a backwater administrative outpost, it has come a long way from its quiet roots. It is now the headquarters of Task Force 93 and additionally hosts a number of specialized units including a Starfleet Rapid Response Unit with several mobile deployment platforms, a Corps of Engineers division tasked with revitalizing Starfleet''s infrastructure in the region, a Diplomatic Corps detachment charged with keeping the peace in this fragile sector of space, and a Marine Expeditionary Unit with reinforced infantry, aviation and logistics elements.</p>', 'message', 'n'),
(19, 'welcome_facility', 'Welcome: Facility', '<h2>Facility</h2>\n\n<div class="left-thumbs-160-60">\n<a href=""><img src="[[asset:images/welcome/facility-command.png]]"></a>\n<div class="description">\n<h4><a href="">Faltan Command</a></h4>\n<p>An administrative facility roughly forty miles from the Faltan III Colony, Faltan Command hosts a Starfleet regional command center, a Diplomatic Corps complex including several foreign consulates, a Marine Corps garrison and more. <a href="">Continue reading...</a></p>\n</div>\n<a href=""><img src="[[asset:images/welcome/facility-engineering]]"></a>\n<div class="description">\n<h4><a href="">Faltan Engineering</a></h4>\n<p>On the outskirts of the Caerus Mining Outpost, Faltan Engineering is a Corps of Engineers facility including several refitted refineries and six old mining craters converted into docks capable of servicing any regional asset including capital ships. <a href="">Continue reading...</a></p>\n</div>\n</div>', 'message', 'n'),
(20, 'welcome_vessels', 'Welcome: Vessels', '<h2>Assigned Vessels</h2>\n\n<p>For rapid response scenarios, three vessels are permanently assigned to Faltan Station:</p>\n\n<div class="row-fluid">\n    <div class="span4" style="text-align: center">\n        <a href=""><img src="[[asset:images/welcome/vessel-osiris.png]]"></a>\n        <p class="tight-label">\n            <a href="">USS Osiris</a>\n            <small class="muted"><br>Diligent-class</small>\n        </p>\n    </div>\n    <div class="span4" style="text-align: center">\n        <a href=""><img src="[[asset:images/welcome/vessel-anubis.png]]"></a>\n        <p class="tight-label">\n            <a href="">USS Anubis</a>\n            <small class="muted"><br>Defiant-class</small>\n        </p>\n    </div>\n    <div class="span4" style="text-align: center">\n        <a href=""><img src="[[asset:images/welcome/vessel-isis.png]]"></a>\n        <p class="tight-label">\n            <a href="">USS Isis</a>\n            <small class="muted"><br>Nova-class</small>\n        </p>\n    </div>\n</div>', 'message', 'n'),
(21, 'welcome_staff', 'Welcome: Staff', '<h2>Command Staff</h2>\n<div class="right-thumbs-3-128 clearfix">\n    <div class="thumbs">\n        <div class="thumb">\n            <a href=""><img src="[[asset:images/welcome/staff-reyes.png]]"></a>\n            <p class="tight-label"><a href="">RADM Reyes</a><small class="muted"><br>Commanding Officer<br>Faltan Station</small></p>\n        </div>\n        <div class="thumb">\n            <a href=""><img src="[[asset:images/welcome/staff-lewis.png]]"></a>\n            <p class="tight-label"><a href="">CDR Lewis</a><small class="muted"><br>Executive Officer<br>Faltan Station</small></p>\n        </div>\n        <div class="thumb">\n            <a href=""><img src="[[asset:images/welcome/staff-chadwick.png]]"></a>\n            <p class="tight-label"><a href="">R. FADM Chadwick</a><small class="muted"><br>Ambassador-at-Large<br>Raeyan Sector</small></p>\n        </div>\n    </div>\n    <div class="description">\n        <p>Faltan Station is commanded by Rear Admiral Allison Reyes. As the Director of Starfleet Research and Development and the recently appointed Commanding Officer of Task Force 93, Reyes manages both Corps of Engineers and Task Force operations within the Raeyan Sector, the Raeyan Transit Corridor and along part of the Romulan Neutral Zone.</p>\n        <p>She is joined by Commander Jake Lewis, Station Executive Office and Rapid Response Unit Commanding Officer; Retired Fleet Admiral Robert Chadwick, Raeyan Sector Ambassador-at-Large; Commodore Charles Ainsworth, Deputy Director of Starfleet Research and Development; Brigadier General Mike Brancer, Commanding Officer of the 4th Marine Expeditionary Unit; and over fifty thousand officers, enlistees, marines, corpsmen, diplomats, and civilians, operating in a tenuous region of space nestled between several interstellar powers, alongside an alien colony, an opportunistic mining venture, and more.</p>\n    </div>\n</div>', 'message', 'n'),
(22, 'welcome_more', 'Welcome: More', '<h1 class="page-head"><center>Want to learn more?</center></h1>\n\n<div class="row-fluid" style="text-align:center">\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-station.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Station</h3>\n        </a>\n        <p class="muted">Faltan Station both lies at an interstellar crossroads and is home to a diverse group including Starfleet, the Faltan peoples, and the Caerus Mining Company.</p>\n    </div>\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-personnel.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Personnel</h3>\n        </a>\n        <p class="muted">Faltan Station is inhabited by a diverse group including officers, enlisteds, marines, diplomats, corpsmen and civilians.</p>\n    </div>\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-missions.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Missions</h3>\n        </a>\n        <p class="muted">From engineering development to tactical  engagements to regional diplomacy, the story of Faltan Station is rich and varied.</p>\n    </div>\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-apply.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Apply</h3>\n        </a>\n        <p class="muted">Faltan Station is the collaborative product of its writers. Are you interested in becoming part of the story?</p>\n    </div>\n</div>', 'message', 'n'),
(23, 'about_head', 'About Header', 'About', 'title', 'n'),
(24, 'about_premise', 'About: Premise', '<h2>The Story Up To Now</h2>\n\n<h3>The Tragedy of Algorab</h3>\n\n<p>In August 2387, the USS Enigma was dispatched to Algorab to provide security for a Romulan government summit meant to address the discontent of planetary governors who felt marginalized by the shift in power following the destruction of Romulus and the establishment of a new provisional government on Rator III. The mission did not go as planned. Caught up in a Tal''Shiar plot to achieve greater power within the Empire, the crew was implicated in the assassination of a Romulan Senator Vorelian on August 17, 2387. As they''d been covertly running surveillance on the summit for Starfleet Intelligence, they had proof that acquitted them. Fearing that an admonition they''d been spying on the delegates would destabilize the Federation''s altruistic image with the Empire, Starfleet Intelligence forbade them from demonstrating their innocence to either Fleet Command or the Romulan Empire. Instead, they were recalled and the Tal Diann was brought in to render security for the remainder of the Summit.</p>\n\n<p>Before the assassination, the political scene was divided, little common agreement between the various factions. However, after the assassination of Vorelian and the withdrawal of the USS Enigma, the summit underwent a change in tone, the delegates now united in their fear of the Starfleet''s meddling. It was unanimously concluded that the Empire''s borders must be closed to all outside influence. To support and enforce this shift, the Romulan Star Navy was dispatched to harden their borders with both the Federation and the Klingon Empire. Filling in the gap of internal security, Tal''Shiar Chairwoman Sonara T''Daran was given the seat she sought on the Continuing Committee and the Tal''Shiar was given greater responsibility for internal policing.</p>\n\n<h3>The Federation-Romulan Crisis of 2387</h3>\n\n<p>The Federation was immediately thrust into a diplomatic crisis. The closure of the Romulan borders would cut Starfleet off from the Raeyan Sector, given that the Hobus Event had destabilized the Raeyan Portal, and it also threatened possible Romulan aggression. Former Admiral and famed diplomat, Robert Chadwick was rushed from Earth on standby for what would come, while Fleet Admiral Oliver Tidwell set off across Federation territory from the Talarian region to oversee the operation.</p>\n\n<p>The USS Enigma, en route back from Algorab, knew not about these developments until Commander Lewis arrived at Deep Space 6 for a debriefing. However, instead of a face-to-face with Rear Admiral Bryl, he was instead carted to a conference room where he was debriefed by former Fleet Admiral Robert Chadwick, who informed him that he and his crew had been responsible for starting an interstellar crisis. Only then did the magnitude of the event set in with Commander Lewis. Retaining his fidelity to Starfleet Intelligence, Lewis maintained his innocence but did not inform the Fleet Admiral of the proof they had at their innocence.</p>\n\n<h3>The Treaty of Nelvana</h3>\n\n<p>On September 10, Starfleet was invited to Nelvana to discuss new terms regarding their activity within the Romulan Empire. Rear Admiral Bryl, Task Force 93 Commanding Officer, and former Fleet Admiral Robert Chadwick, Director of the Diplomatic Corps, departed at once from Deep Space 6, while Fleet Admiral Tidwell was still en route from across Federation space. The Fleet Admiral arrived at Deep Space 6 on September 18, just as negotiations on Nelvana were drawing to a close. Without time to reach Nelvana himself, Fleet Admiral Tidwell was kept abreast of the proceedings from Deep Space 6. The Treaty of Nelvana was signed two days later, closing the Romulan borders to the Federation while ceding a five light year wide corridor of territory on their border with the Klingon Empire to the Federation to allow continued transit to the Raeyan Sector.</p>\n\n<p>During his time on Deep Space 6, Tidwell started inquiring more deeply about what had transpired on Algorab. As he worked his way through the mirror maze of Starfleet Intelligence, he eventually reached Rear Admiral Frank DeVoe, the Deputy Chief of Intelligence Special Operations. The man admitted to the Fourth Fleet Commanding Officer that they had evidence not only acquitting the USS Enigma but also implicating the Tal''Shiar. The two agreed that this information would not be broadly shared, but it changed the Fleet Admiral''s opinion of Commander Lewis and his crew, a group who were now well out of favor with the Admiralty. In a face-to-face meeting with the Commander, Tidwell explained to Lewis that he''d and his crew were being reassigned to Faltan Station, a new Corps of Engineers base in the reactivated Raeyan Sector.</p>', 'message', 'n'),
(25, 'about_station', 'About: Station', '<h2>Faltan Station</h2>\n\n<p>With the advent of the Raeyan Transit Corridor, Starfleet recognized a deficit in coverage of Task Force 93''s newly expanded area of operations. While Deep Space 6 could service the task force''s old area of operations and the western side of the Corridor, there was no comparable base along the eastern edge of the Corridor in the Raeyan Sector. Most of the bases in Raeyan Sector had been decommissioned, with the exception of Hawkeye Island, and the Raeya System where it resided was simply too far from the Corridor to service the region. Starbase 911 might have served this purpose from the Union system, but, lacking foresight, it had been destroyed a year earlier when the Federation believed they were pulling out of the Raeyan Sector. The Faltan system, which formerly housed an administrative facility to oversee mining operations on the sole moon of Faltan III, was thus activated as the new regional operations facility.</p>\n\n<div style="width:455px; max-width:100%; margin:auto; margin-bottom:1em;text-align:center;" class="thumbnail"><img src="[[asset:images/welcome/facility-command-aerial.png]]"><small>Faltan Command Facility on the surface of Faltan III</small></div>\n<div style="float:clear;height:1px"></div>\n\n<p>The Faltan system is in a strategically important region of space, three light years from the eastern edge of the Raeyan Transit Corridor and ten light years from both the Romulan and Klingon borders.</p>\n\n<h3>Facility</h3>\n\n<p>Faltan Station is the name collectively given to a pair of facilities in the system, Faltan Command in a mountain river valley 40 miles from the Faltan colony, and Faltan Engineering, a Corps of Engineers facility on the outskirts of a lunar colony run by the Caerus Mining Company.</p>\n\n<ul>\n<li><div style="float:right; margin-left:20px; margin-bottom:20px; text-align:center;" class="thumbnail"><img src="[[asset:images/welcome/facility-command.png]]"><small>Faltan Command</small></div><strong>Faltan Command</strong> - An administrative facility built in a mountain river valley on Faltan III roughly forty miles from the Faltan colony, Faltan Command was originally constructed in 2380 by Starfleet to oversee mining operations on the Faltan lunar colony and liaise with the Faltans. In 2387, it has found new purpose as a command, engineering and diplomatic hub of Starfleet operations in the southern Raeyan Sector and eastern Raeyan Transit Corridor.</li>\n<li><div style="float:right; margin-left:20px; margin-bottom:20px; text-align:center;" class="thumbnail"><img src="[[asset:images/welcome/facility-engineering.png]]"><small>Faltan Engineering</small></div><strong>Faltan Engineering</strong> - Over their thirteen year stay, the mining colony has developed a large footprint across Faltan III''s sole moon. In 2387, the mining collective agreed to cede a region already stripped of deuterium deposits to the Corps of Enginers. Refitting an old refining plant as a manufacturing facility and building docking facilities in several old mining craters, the facility is now capable of supporting servicing any regional asset, including capital ships.</li>\n</ul>', 'message', 'n'),
(26, 'about_system', 'About: System', '<h2>Faltan System</h2>\n\n<p>Four hundred years ago, a technologically advanced humanoid species from the furthest reaches of the Delta Quadrant attempted to test a subspace folding technology. While the drive worked, it did so unpredictably and flung them over a 100,000 light years across the galaxy into the Raeyan Sector. Unwilling to risk another attempt, the crew elected to wait for rescue, setting up a small outpost in a large desert valley on the third planet of an otherwise uninhabited system.</p>\n\n<div style="float:right; margin-left:10px; margin-right:10px; margin-bottom:20px; text-align:center;" class="thumbnail"><img src="[[asset:images/welcome/faltan-colony.png]]"><small>Faltan Colony</small></div><p>Unfortunately, as the years went by, it became clear that there would be no rescue. They were on their own, forced to build a new society far from their home across the galaxy. Using advanced technologies from their vessel, the small outpost grew into a thriving metropolis, their original crew growing to over two hundred thousand across sixteen generations.</p>\n\n<p>In Federation common, this species became known as the Faltans, derived from the proto-Germanic word for "fold" based on their method of arrival in the region.</p>\n\n<p>In 2375, an independent mining company arrived in the system while surveying the sector. They found that the sole moon of Faltan III had highly concentrated deuterium deposits, and they wanted to set up a facility to refine the ore. However, the Faltans had already set up a facility on the moon to support the growth of their colony on the planet below. With technology appearing on par with that of the Federation, although very limited in scale, the decision was made to approach them directly to elicit mining rights. The Faltans shared a bit about their history and explained that they were focused on survival with little interest in the affairs of others. As such, they informed the mining company that they were free to set up shop so long as it didn''t interfere with their own vitality.</p>\n\n<div style="float:left; margin-left:10px; margin-right:10px; margin-bottom:5px;max-width:300px; text-align:center;" class="thumbnail"><img src="[[asset:images/welcome/faltan-mining.png]]"><small>Faltan Lunar Mining Facility</small></div><p>Unfortunately, as the mining colony grew, it quickly became a nuisance to its gracious hosts. With a population of workers growing to over fifty thousand, the lunar mining colony became ridden with crime, and their profit-focused techniques were considered dirty and wasteful by the Faltans. This tension came to a head by 2380, and Starfleet was brought into the region to mediate. In the outcome of this negotiation, it was decided that Starfleet would set up a small base on Faltan III to ensure that the lunar mining operations conformed with both Faltan and Federation standards. This base was located in a mountainous region roughly forty miles from the desert valley where the Faltan colony was located.</p>\n\n<p>At first, this arrangement seemed to have restored the peace. The Faltans co-existed well with the Federation, sharing many of their ideals, and the mining operation cleaned up its act. However, with the withdrawal from the Raeyan Sector in early 2386, only a small administrative staff was left on the Faltan III base to maintain order. The mining colony continued to sprawl out for new digs, and they began reverting to some of their old ways, tension returning between the Faltans, the Federation and the mining cooperative.</p>\n\n<p>Following the Treaty of Nelvana in late 2387, Faltan III became a subject of interest again as Task Force 93 needed a base that could service the eastern side of the Raeyan Transit Corridor and the southern portion of the Raeyan sector.</p>', 'message', 'n'),
(27, 'about_staff', 'About: Staff', '<h2>Command Staff</h2>\n\n<h3>Rear Admiral Allison Reyes</h3>\n\n<p>Rear Admiral Allison Reyes, Director of Starfleet R&D, has been assigned to Faltan Station as its commanding officer. She was viewed as a prime candidate for this role, given both a substantial technical background as well as demonstrated frontier experience given a long tenure with alien technologies as part of Starfleet Intelligence. Her primary role is to provide an operational Flag Officer presence in the region, overseeing both Corps of Engineers and Fleet tactical, diplomatic and exploratory operations in the region.</p>\n\n<h3>Commander Lewis and the Rapid Response Unit</h3>\n\n<p>Given the USS Enigma''s fall from favor following the Algorab Summit and the Treaty of Nelvana, the Starfleet Intelligence Special Operations unit has been shut down. Recognizing the versatility of the integrated command, much of the Enigma''s crew has been reassigned to Faltan Station as a Rapid Response Unit. This unit has at its disposal three assigned vessels, the USS Osiris, USS Anubis and USS Isis, capable of providing mobile support for a range of issues that may arise in the tumultuous region.</p>\n\n<h3>Ambassador-at-Large Robert Chadwick</h3>\n\n<p>After retiring from Starfleet in 2383 with the rank of Fleet Admiral as the Commanding Officer of the Fourth Fleet, Robert Chadwick continued to serve Starfleet in various roles both at Starfleet Command and in the field. In 2387, he was activated in emergency status to settle a dispute with the Romulan Empire on behalf of Starfleet and the Federation.  Following his successful mission, Robert was asked to maintain a presence at Faltan Station in the official capacity of Ambassador-at-Large for the United Federation of Planets in the Raeyan Sector.  Unofficially, Chadwick''s assignment to the station signaled a major shift in the importance of the region.  Fearing threats from within both Romulan space and the Klingon Empire, and recognizing the need for renewed diplomacy in the Raeyan Sector, Starfleet Command has tasked Chadwick with maintaining the peace, utilizing whatever resources he feels necessary to do so.</p>\n\n<h3>Commodore Charles Ainsworth</h3>\n\n<p>Commodore Charles Ainsworth, Deputy Director of Raeyan Sector Operations for the Starfleet Corps of Engineers, was assigned to Faltan Station to help oversee  operations within the sector. Given Rear Admiral Reyes'' dual role as Commanding Officer of regional operations, Commodore Ainsworth manages much of day-to-day operations Corps'' efforts in the Raeyan Sector. Prior to his posting at Faltan Charles was station at Utopia Planitia Shipyards as a senior project manager where he oversaw many projects and worked as lead designer. Charles has a background in scientific exploration equipment, and his expertise in the field will help lead Corps efforts to revitalize the Raeyan Sector.</p>\n\n<h3>Brigadier General Mike Brancer</h3>\n\n<p>Brigadier General Brancer, a former Commandant of the Starfleet Marine Corps, has been assigned to Faltan Station to run the 93rd Marine Expeditionary Unit. A veteran of the Gorn Crisis and several other rough periods of the Fleet''s history, his long tenure was viewed as well-suited to manage the specialized diversified quick reaction force, which includes approximately 2500 personnel organized into reinforced infantry, aviation, and logistical elements.</p>\n\n<h3>Visiting Flag Officers</h3>\n\n<p>As a regional operations center, Faltan Station also serves as a forward operations base for Task Force 93 and other Fleet efforts in the region. As such, from time to time, other Commanding Officers and members of the Bravo Fleet Admiralty take up residence at Faltan Station.</p>', 'message', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `nova_missions`
--

CREATE TABLE IF NOT EXISTS `nova_missions` (
  `mission_id` int(8) NOT NULL AUTO_INCREMENT,
  `mission_title` varchar(255) NOT NULL DEFAULT '',
  `mission_images` text NOT NULL,
  `mission_order` int(5) NOT NULL,
  `mission_group` int(5) NOT NULL,
  `mission_status` enum('upcoming','current','completed') NOT NULL DEFAULT 'upcoming',
  `mission_start` bigint(20) NOT NULL,
  `mission_end` bigint(20) NOT NULL,
  `mission_desc` text NOT NULL,
  `mission_summary` text NOT NULL,
  `mission_notes` text NOT NULL,
  `mission_notes_updated` bigint(20) NOT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nova_missions`
--

INSERT INTO `nova_missions` (`mission_id`, `mission_title`, `mission_images`, `mission_order`, `mission_group`, `mission_status`, `mission_start`, `mission_end`, `mission_desc`, `mission_summary`, `mission_notes`, `mission_notes_updated`) VALUES
(1, 'The Tragedy of Algorab', 'ussenigma.png', 1, 1, 'current', 1350542370, 1371278370, 'Tensions are running high between the Empire’s new seat of power on Rator III and some of its planetary governors who feel marginalized by the shift. As such, a summit is called to address their concerns; given fears of foul play, the Enigma is dispatched to assist with security.\n\nNOTE: This mission is comprised of excerpts from the USS Enigma''s mission "Walk Lightly".', 'Tensions were high with the opening of the Summit. A fire-eater of the Star Navy through up several substantial roadblocks, almost unhinging the mission before it began, but yet somehow a fragile peace was maintained as the Summit began. On the second day, though, things completely unravelled when Romulan Senator Vorelian was killed and the crew of the Enigma were falsely implicated, one of their own arrested for the crime. Although they had proof that they''d not performed the crime, collected via covert surveillance equipment, they could not reveal this fact because of the implications it would have that they''d been spying on the summit. The Enigma was forced to withdraw, and only through the assistance of a clandestine unit of Romulan military intelligence were they able to reclaim their captured crewman.\n\nThis death was a unifying moment for the Summit attendees: against a common threat, they demanded that the Starfleet leave their territory, aggressively deploying the Star Navy to their borders to defend against external threats and increasing the power of the Tal Shiar as an internal police force to make up for a void left by the relocation of the Star Navy. \n', '', 0),
(2, 'The Treaty of Nelvana', '0', 2, 1, 'current', 1371278321, 0, 'The events of the Algorab Summit threatened to destabilize the interstellar scene, and a meeting was convened on Nelvana to address the issue.', 'On September 20, 2387, Ambassador Robert Chadwick, representing the United Federation of Planets, and Admiral P’alas, representing the Romulan Star Empire, signed the Treaty of Nelvana. In the treaty, Starfleet acknowledged the Empire’s sovereign right to dictate border transit rights, closing off Federation access to the Romulan Empire and re-affirming the 3 LY-wide Neutral Zone. However, given that the Hobus event had destabilized the portal to the Raeyan Sector, the Romulan Empire also made a concession. They ceded a 5 LY-wide region of space along the Klingon border over to the Federation indefinitely, creating the Raeyan Transit Corridor. This corridor allowed the Federation to still reach the Raeyan Sector, although it came at the cost of having to administer a buffer between the Romulan and Klingon empires. Logistically, as several Romulan worlds lay within this region, the Empire was granted a five-year easement to relocate its colonies within the region. ', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nova_mission_groups`
--

CREATE TABLE IF NOT EXISTS `nova_mission_groups` (
  `misgroup_id` int(5) NOT NULL AUTO_INCREMENT,
  `misgroup_name` varchar(255) NOT NULL DEFAULT '',
  `misgroup_order` int(5) NOT NULL,
  `misgroup_desc` text NOT NULL,
  `misgroup_parent` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`misgroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nova_mission_groups`
--

INSERT INTO `nova_mission_groups` (`misgroup_id`, `misgroup_name`, `misgroup_order`, `misgroup_desc`, `misgroup_parent`) VALUES
(1, 'I. Prelude to Faltan', 1, 'On April 13, 2387, the <a href="http://wiki.bravofleet.com/index.php?title=Hobus" target="_blank">Hobus star went hypernova</a>, destroying Romulus and sending the Romulan Empire into turmoil. From its ashes, a newfound friendship arose between the Romulan Empire and the Federation, forged as the Bravo Fleet''s <a href="http://wiki.bravofleet.com/index.php?title=Task_Force_93" target="_blank">Task Force 93</a> provided aid to a struggling people and supported the Imperial Star Navy. However, such peace was not to last. In a turbulent set of events from August to October 2387, Starfleet was implicated in the assassination of a Romulan Senator at the <a href="http://wiki.bravofleet.com/index.php?title=Algorab_Summit" target="_blank">Algorab Summit</a>, the Romulan Empire closed its borders, and the <a href="http://wiki.bravofleet.com/index.php?title=Treaty_of_Nelvana" target="_blank">Treaty of Nelvana</a> was signed that fundamentally reshaped the region. \n\nThese are the stories that lead up to this new era, culminating with the activation of Faltan Station as the new headquarters of <a href="http://wiki.bravofleet.com/index.php?title=Task_Force_93" target="_blank">Task Force 93</a>, positioned on the edge of the <a href="http://wiki.bravofleet.com/index.php?title=Raeyan_Sector" target="_blank">Raeyan Sector</a> at the terminus of a new <a href="http://wiki.bravofleet.com/index.php?title=Raeyan_Transit_Corridor" target="_blank">Raeyan Transit Corridor</a> created to allow the Federation continued access to their assets in the <a href="http://wiki.bravofleet.com/index.php?title=Raeyan_Sector" target="_blank">Raeyan Sector</a> and to buffer the Romulan Empire against hostility from the Klingon Empire and pirates of the <a href="http://wiki.bravofleet.com/index.php?title=Triangle_Region" target="_blank">Triangle Region</a>.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `nova_news`
--

CREATE TABLE IF NOT EXISTS `nova_news` (
  `news_id` int(8) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) NOT NULL DEFAULT '',
  `news_author_user` int(8) NOT NULL,
  `news_author_character` int(8) NOT NULL,
  `news_cat` int(5) NOT NULL,
  `news_date` bigint(20) NOT NULL,
  `news_content` text NOT NULL,
  `news_status` enum('activated','saved','pending') NOT NULL DEFAULT 'activated',
  `news_private` enum('y','n') NOT NULL DEFAULT 'n',
  `news_tags` text NOT NULL,
  `news_last_update` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_news_categories`
--

CREATE TABLE IF NOT EXISTS `nova_news_categories` (
  `newscat_id` int(5) NOT NULL AUTO_INCREMENT,
  `newscat_name` varchar(255) NOT NULL DEFAULT '',
  `newscat_display` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`newscat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `nova_news_categories`
--

INSERT INTO `nova_news_categories` (`newscat_id`, `newscat_name`, `newscat_display`) VALUES
(1, 'General News', 'y'),
(2, 'Out of Character', 'y'),
(3, 'Sim Announcement', 'y'),
(4, 'Website Update', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_news_comments`
--

CREATE TABLE IF NOT EXISTS `nova_news_comments` (
  `ncomment_id` int(8) NOT NULL AUTO_INCREMENT,
  `ncomment_author_user` int(8) NOT NULL,
  `ncomment_author_character` int(8) NOT NULL,
  `ncomment_news` int(8) NOT NULL,
  `ncomment_content` text NOT NULL,
  `ncomment_date` bigint(20) NOT NULL,
  `ncomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`ncomment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_personallogs`
--

CREATE TABLE IF NOT EXISTS `nova_personallogs` (
  `log_id` int(5) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(255) NOT NULL DEFAULT '',
  `log_author_user` int(8) NOT NULL,
  `log_author_character` int(8) NOT NULL,
  `log_content` text NOT NULL,
  `log_date` bigint(20) NOT NULL,
  `log_status` enum('activated','saved','pending') NOT NULL DEFAULT 'activated',
  `log_tags` text NOT NULL,
  `log_last_update` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_personallogs_comments`
--

CREATE TABLE IF NOT EXISTS `nova_personallogs_comments` (
  `lcomment_id` int(8) NOT NULL AUTO_INCREMENT,
  `lcomment_author_user` int(8) NOT NULL,
  `lcomment_author_character` int(8) NOT NULL,
  `lcomment_log` int(8) NOT NULL,
  `lcomment_content` text NOT NULL,
  `lcomment_date` bigint(20) NOT NULL,
  `lcomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`lcomment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_positions_ds9`
--

CREATE TABLE IF NOT EXISTS `nova_positions_ds9` (
  `pos_id` int(10) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(255) NOT NULL DEFAULT '',
  `pos_desc` text NOT NULL,
  `pos_dept` int(10) NOT NULL,
  `pos_order` int(5) NOT NULL,
  `pos_open` int(5) NOT NULL,
  `pos_display` enum('y','n') NOT NULL DEFAULT 'y',
  `pos_type` enum('senior','officer','enlisted','other') NOT NULL DEFAULT 'officer',
  `pos_top_open` enum('y','n') NOT NULL DEFAULT 'n',
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=161 ;

--
-- Dumping data for table `nova_positions_ds9`
--

INSERT INTO `nova_positions_ds9` (`pos_id`, `pos_name`, `pos_desc`, `pos_dept`, `pos_order`, `pos_open`, `pos_display`, `pos_type`, `pos_top_open`) VALUES
(1, 'Commanding Officer', '', 1, 0, 0, 'y', 'senior', 'n'),
(2, 'Executive Officer', '', 1, 1, 0, 'y', 'senior', 'n'),
(3, 'Senior Watch Officer', '', 1, 2, 1, 'y', 'senior', 'n'),
(4, 'Command Master Chief', '', 1, 3, 1, 'y', 'enlisted', 'n'),
(79, 'Chief Strategic Operations Officer', '', 14, 99, 0, 'y', 'senior', 'n'),
(80, 'Chief Flight Operations Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(81, 'Chief Security Officer', '', 14, 99, 0, 'y', 'senior', 'n'),
(82, 'Chief Operations Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(83, 'Chief Engineering Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(84, 'Chief Science Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(85, 'Chief Medical Officer', '', 14, 99, 0, 'y', 'senior', 'n'),
(86, 'Chief Counselor', '', 14, 99, 1, 'y', 'senior', 'n'),
(87, 'Director of Research & Development', '', 15, 1, 0, 'y', 'senior', 'n'),
(88, 'Deputy Director of Research & Development', '', 15, 2, 0, 'y', 'senior', 'n'),
(89, 'Chief of Fleet Services', '', 15, 99, 1, 'y', 'senior', 'n'),
(90, 'Chief of Development Services', '', 15, 99, 1, 'y', 'senior', 'n'),
(91, 'Chief of Research Services', '', 15, 99, 1, 'y', 'senior', 'n'),
(92, 'Commanding Officer', '', 21, 1, 0, 'y', 'senior', 'n'),
(93, 'Executive Officer', '', 21, 2, 0, 'y', 'senior', 'n'),
(94, 'Division Commanding Officer', 'The company Commanding Officer of the company within the 4th MEU that is tasked with tactical support of the rapid response unit.', 24, 0, 0, 'y', 'senior', 'n'),
(95, 'Operator', '', 24, 20, 1, 'y', 'senior', 'n'),
(96, 'First Sergeant', '', 24, 12, 1, 'y', 'enlisted', 'n'),
(97, 'Chief Science Officer', '', 23, 99, 1, 'y', 'senior', 'n'),
(99, 'Chief Medical Officer', '', 23, 99, 1, 'y', 'senior', 'n'),
(100, 'Chief Engineering Officer', '', 23, 99, 1, 'y', 'senior', 'n'),
(101, 'Chief Tactical Officer', '', 24, 10, 1, 'y', 'senior', 'n'),
(102, 'Chief Operations Officer', '', 23, 99, 1, 'y', 'senior', 'n'),
(103, 'Chief Flight Control Officer', '', 23, 99, 1, 'y', 'senior', 'n'),
(104, 'Chief Intelligence Officer', '', 24, 11, 1, 'y', 'senior', 'n'),
(105, '4th MEU Commanding Officer', '', 16, 99, 0, 'y', 'senior', 'n'),
(106, 'Battalion Commanding Officer', '', 17, 99, 1, 'y', 'senior', 'n'),
(107, 'Battalion Executive Officer', '', 17, 99, 1, 'y', 'officer', 'n'),
(108, 'Battalion Sergeant', '', 17, 99, 1, 'y', 'enlisted', 'n'),
(109, 'Company Commanding Officer', '', 17, 99, 4, 'y', 'senior', 'n'),
(110, 'Group Commander', '', 19, 99, 1, 'y', 'senior', 'n'),
(111, 'Group Executive Officer', '', 19, 99, 1, 'y', 'officer', 'n'),
(112, 'Group Sergeant', '', 19, 99, 1, 'y', 'enlisted', 'n'),
(113, 'Squadron Leader', '', 19, 99, 6, 'y', 'officer', 'n'),
(114, 'Battalion Commanding Officer', '', 18, 99, 1, 'y', 'senior', 'n'),
(115, 'Battalion Executive Officer', '', 18, 99, 1, 'y', 'officer', 'n'),
(116, 'Battalion Sergeant', '', 18, 99, 1, 'y', 'senior', 'n'),
(117, 'Colonial Governor', '', 25, 1, 1, 'y', 'senior', 'n'),
(118, 'Chief of Armed Services', '', 25, 2, 1, 'y', 'senior', 'n'),
(119, 'Chief of Diplomatic Services', '', 25, 3, 1, 'y', 'senior', 'n'),
(120, 'Chief of Support Services', '', 25, 4, 1, 'y', 'senior', 'n'),
(121, 'Managing Partner', '', 26, 99, 1, 'y', 'senior', 'n'),
(122, 'Chief of Operations', '', 26, 99, 1, 'y', 'senior', 'n'),
(123, 'Chief of Security', '', 26, 99, 1, 'y', 'senior', 'n'),
(124, 'Romulan Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(125, 'Klingon Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(126, 'C''hakilian Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(127, 'Krazzle Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(128, 'Trigati Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(129, 'Raeyan Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(130, 'Sinelan Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(131, 'Karr Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(132, 'Miner''s Guild Representative', '', 27, 99, 1, 'y', 'other', 'n'),
(133, 'Ambassador-at-Large', '', 20, 99, 0, 'y', 'senior', 'n'),
(134, 'Chargé d''affaires', '', 20, 99, 1, 'y', 'officer', 'n'),
(135, 'Envoy', '', 20, 99, 1, 'y', 'enlisted', 'n'),
(136, 'Heavy Weapons Specialist', '', 24, 30, 2, 'y', 'enlisted', 'n'),
(137, 'Sniper', '', 24, 30, 1, 'y', 'enlisted', 'n'),
(138, 'Demolitions Specialist', '', 24, 31, 1, 'y', 'enlisted', 'n'),
(139, 'Field Medic', '', 24, 30, 1, 'y', 'enlisted', 'n'),
(140, 'Infiltration Specialist', '', 24, 31, 1, 'y', 'enlisted', 'n'),
(142, 'Chief Intelligence Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(143, 'Provisional Government', '', 34, 0, 0, 'y', 'senior', 'n'),
(144, 'Rator III', '', 34, 10, 0, 'y', 'senior', 'n'),
(145, 'Algorab', '', 34, 11, 0, 'y', 'senior', 'n'),
(146, 'Iccobar', '', 34, 12, 0, 'y', 'senior', 'n'),
(147, 'Commanding Officer, IRV T''Trix', '', 35, 10, 0, 'y', 'senior', 'n'),
(148, 'Tal Diann Operative, IRV T''Trix', '', 35, 11, 0, 'y', 'officer', 'n'),
(149, 'Commanding Officer, IRV Delevhas', '', 35, 50, 0, 'y', 'senior', 'n'),
(150, 'Commanding Officer, IRV Insidion', '', 35, 20, 0, 'y', 'senior', 'n'),
(151, 'Chief Tactical Officer, IRV Insidion', '', 35, 21, 0, 'y', 'officer', 'n'),
(152, 'Chief Strategic Intelligence Officer, IRV Insidion', '', 35, 22, 0, 'y', 'senior', 'n'),
(153, 'Chairwoman', '', 36, 0, 0, 'y', 'senior', 'n'),
(154, 'Operative', '', 36, 10, 0, 'y', 'officer', 'n'),
(155, 'Director, Starfleet Intelligence Special Operations', '', 29, 31, 0, 'y', 'senior', 'n'),
(156, 'Director, Starfleet Intelligence', '', 29, 11, 0, 'y', 'senior', 'n'),
(157, 'Commander-in-Chief', '', 29, 0, 0, 'y', 'senior', 'n'),
(158, 'Director, Starfleet Corps of Engineers', '', 29, 10, 0, 'y', 'senior', 'n'),
(159, 'Commanding Officer, Fourth Fleet', '', 39, 0, 0, 'y', 'senior', 'n'),
(160, 'Director of Intelligence, Fourth Fleet', '', 39, 10, 0, 'y', 'senior', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `nova_posts`
--

CREATE TABLE IF NOT EXISTS `nova_posts` (
  `post_id` int(8) NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL DEFAULT '',
  `post_location` varchar(255) NOT NULL DEFAULT '',
  `post_timeline` varchar(255) NOT NULL DEFAULT '',
  `post_date` bigint(20) NOT NULL,
  `post_authors` text NOT NULL,
  `post_authors_users` text NOT NULL,
  `post_mission` int(8) NOT NULL,
  `post_saved` int(11) NOT NULL,
  `post_status` enum('activated','saved','pending') NOT NULL DEFAULT 'activated',
  `post_content` text NOT NULL,
  `post_tags` text NOT NULL,
  `post_last_update` bigint(20) NOT NULL DEFAULT '0',
  `post_participants` text NOT NULL,
  `post_lock_user` int(8) NOT NULL,
  `post_lock_date` bigint(20) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nova_posts`
--

INSERT INTO `nova_posts` (`post_id`, `post_title`, `post_location`, `post_timeline`, `post_date`, `post_authors`, `post_authors_users`, `post_mission`, `post_saved`, `post_status`, `post_content`, `post_tags`, `post_last_update`, `post_participants`, `post_lock_user`, `post_lock_date`) VALUES
(1, 'Disagreeable Decisions and Deception', 'Admiral''s Ready Room, IRV T''Trix', 'Day 2 - 2000 Hours', 1370674796, '16,21,30', '1,1,1', 1, 0, 'activated', '"You mean to tell me you actually recommended this?" Admiral P’alas fumed at the curvy daughter of Ambassador Topas, waiving a PADD in her face. While he respected Topas, the Praetor’s Special Envoy, and appreciated the her presence in the task group, the same could not be said for her daughter Tepora. When he’d bestowed the title of ‘Ambassador of Troubled Colonies’ upon the young woman, it had been solely as a convenience for a mission; he hadn’t meant for it to stick, but it had. The young idealist now used it to give her a political voice.\n\n"We need to sit the provisional government and dissenting governors down together and iron out a compromise," Tepora replied confidently. "Governor Tarov is right."\n\nThe Admiral gave her a hard look. "Governor Tarov is not someone to be trifled with. Don’t be fooled by his diplomatic rhetoric. His motives lie with no one but himself. He is the overload of Algorab, right at the heart of our great Empire’s military-industrial complex." So far, Tarov had remained loyal to the Empire, but that was likely only because it suited him. His loyalty meant that military contracts continued to fill his coffers, but that didn’t mean he wouldn’t play both sides against the middle if he got the chance.\n\n"Regardless of his motives, this is an opportunity to quell the dissent and stop fighting all these backwater fires," countered the naive idealist.\n\nThe young woman’s insubordination greatly peeved the Admiral. Technically, she wasn’t military, but still, he was an EnRiov in the Imperial Star Navy and she was a mere Aide in the Ambassadorial Corps - or at least that was all she’d been until her recommendation to hold this summit floated through the bureaucratic halls of the Senate. "Well, this mess is now yours to figure out," the Admiral said flatly, handing Tepora the PADD. "The Senate has bestowed you with the title of Envoy and appointed you as moderator of the summit."\n\nThat caught the former aide by surprise. After a moment of dumbfoundedness, she accepted the PADD from P’alas and read it over. He wasn’t joking. They’d selected her, a woman who just passed her thirtieth year, as mediator to unite the loyalists and dissenters. For a moment, elation flooded over her, a great honor to be given the role. But then, fear started to set in. This could be her demise in political circles if she failed.\n\nThe Admiral was not oblivious to her shock. "The news got your tongue?" he asked with a sarcastic tone. "We will split off from the task group and depart for Algorab within a couple hours."\n\n"We?" she asked, regaining her senses.\n\n"Yes, you and I are taking the IRV T’Trix to Algorab, while Ambassador Topas and the rest of the task group continue firefighting out here," answered the Admiral.\n\nFor the past several months, they’d been putting out fire after fire. They’d been to Rowehl, Desica, and others, worlds whose loyalty no one would have questioned until recently. They were once in the core of Romulan territory, but the Hobus disaster had changed everything. With the shift in power from Romulus to Rator, far across the Empire, they now found themselves marginalized, a multi-week trip simply to come before the Senate.\n\nStill, all their work out here had been about tactical negotiation. This summit was completely different. This was a gathering of the big power players of the region, people who’d gotten to where they were through their connections, information networks and political wiles. It would involve the Senate, the Continuing Committee, loyalist and dissenting governors, Galae Command and the Tal’Shiar. In some ways, P’alas just wanted to throw the newly appointed Envoy to the wolves and watch her burn, but that wouldn’t be good for the Empire, and thus he’d volunteered to represent Galae Command at the Summit.\n\n"Rowehl might have been a bit of a mess," the Admiral offered, paying reference to a secessionist colony they’d recently dealt with, "but this will be a whole different beast." He lifted another PADD off his desk and handed it to Envoy Tepora. "Rator has sent over their dignitary list. Don’t expect much help from them. Reason and pragmatism aren’t the strong suite of this group." He’d already looked over the list. They most certainly weren’t going to present a unified stance from the perspective of the provisional government.\n\nAs Tepora took the list, the same thought dawned on her almost immediately. Right at the top was Governor Trevolok, a fire-eater who’d been instrumental in ensuring that Rator became the new seat of the Empire. He’d be a serious problem, along with those that fell into his camp. There were also a few sleazy politicians, men like Senator Vorelian, whose loyalties were anyone’s guess. The rest were mostly of people like Senator Vorenus, best categorized as politicians’ politicians, better known for appeasement than forcefulness. They would waive in the wind to try to satisfy everyone. When she thought about the others who would be at the meeting, the disenfranchised governors, the secessionists, and figures like Admiral P’alas and Tal’Shiar Chairwoman T’Daran, the magnitude of the task really started to set in.\n\n"It’s going to take some time to digest," she responded.\n\n"Then you better get to it." The Admiral gestured for the door firmly. Tepora took the hint and made her exit from the room, leaving P’alas standing alone. A moment later, though, a shadowy figure stepped out of the darkness from an adjoining side-room. He’d been there the whole time, listening quietly.\n\n"I don’t empathize with her one bit," stated P’alas, sensing the man’s presence yet not turning around to face him. "Her ideological boldness and her runaround of our chain of command created this mess."\n\n"I assume I’m coming along?"\n\n"Yes, your cover will be a diplomatic aide to Senator Vorenus," answered the Admiral, finally turning around to face Centurion Vorsa. "Too bad the solution here isn’t like Rowehl," he reflected, referring to a recent operation where Vorsa had sabotaged a prototype singularity-based power plant to destroy a dissenting colony that had requested protectorate status from the Federation.\n\n"What’s my mandate?"\n\n"Watch and observe, but no direct action." The Admiral had considered using the veteran Tal Diann operator to actually rid them of some dissenting governors. Vorsa was skillful enough that he could likely pull it off with no trace. Still, it was too risky of a play. Even if no one could prove the government had done it, there’d be allegations to that extent. It could backfire.\n\nVorsa nodded in silent agreement. He was not a man of many words.\n\n"Keep an eye on the security too," P’alas continued. "Even with my objections, the Senate and governors agreed with Tepora’s recommendation of using Starfleet as a non-biased security detail. I’d much rather have preferred your people."\n\nAgain, a nod was all Vorsa offered.', '', 1370675114, '', 0, 0),
(2, 'What Comes Next', 'Briefing Room, USS Enigma', 'Day 2 - 1200 Hours', 1370674895, '2,4', '1', 1, 0, 'activated', '"So, without further ado, our mission..." said Commander Lewis from his position standing at the head of the table. He picked up his PADD and queued up an image of Algorab on a large terminal across the room. "We''re deploying to Algorab, a highly-developed military-industrial complex world hosting a Romulan governmental summit to address disenchanted planetary governors who feel marginalized by the power shift to Rator III." Around the room, Lewis could see the wheels churning. What were they going to do? Some covert operation or something? "We''ve been asked to provide security."\n\n"We''re providing security? For a Romulan summit?" echoed Lieutenant JG Campbell, the acting head of the Special Operations Analysis Unit, wearing an astonished look on his face.\n\nCaptain Amolyae, the CO of the Special Operations Tactical Unit, had to repress a smile. So far, none of this was a shock to him. One of the perks of being the Commanding Officer of the ship''s only real combat-oriented team meant that sometimes, information came to you before everyone else. Maybe this job wouldn''t be so bad after all.\n\n"Yes, Lieutenant," answered Commander Lewis as he began to walk around the table towards the display panel opposite his chair at the head of the table. "Your reaction is much like mine was at first, but this request is very telling: things are looking pretty bleak within the Empire when Starfleet is more amenable to all parties involved than any of their own security units."\n\nChief Engineer Lieutenant Matthews was curious. He was familiar with Algorab, an industrial hub of the Empire. "Why this world, sir?" He waited a second, "Why this specific world, rather than say, Rator?"\n\n"Because," explained the Commander, "the dissenting governors would hardly see fit to travel to the seat of power they feel marginalized from. Many of these governors were used to being in the Imperial core. Romulus was only a quick hop from Desica, Nelvana, Rowehl, Algorab and others. They used to have a direct line to the Senate. Now, though, it''s a multi-week ordeal just to go before the Senate, and this region is in turmoil - not very confidence inspiring for them." Focusing then on Algorab, he continued: "Among the worlds out here, though, Governor Tarov is still the one most closely aligned with the Empire. Algorab is fueled by the military-industrial complex. As such, geographically, its well-positioned for the governors who feel marginalized, yet still comfortable for the provisional government."\n\nSlade considered and then thought back to some basic intelligence data about the region he was given in his transfer packet. "Is it possible that Tarov will use the summit to establish himself as the ruler of the Romulan Empire?"\n\nLewis shook his head: "That wouldn''t fit the personality profile we''ve got from Starfleet Intelligence. As far as we know, Tarov is an industrial overlord and that''s how he hopes to stay. While he''s interested in power and money, he''s not the sort of person to seek rule over the Empire. We believe his ultimate aim is simply to ensure that, however things shake out, he continues to be in a position of influence. Governmental collapse is no good for business." No, there''d certainly be others at the summit who would sell their soul to rule, but they were the easy ones to understand. People like Tarov were far more dangerous because they were wildcards.\n\nAfter a pause, the Commander brought the discussion back around: "But let''s start at the top..." His procession across the room ended at the terminal against the wall, and, when he tapped a button on it, the screen transformed into a timeline. "We will depart in four days time, roughly around 1800 hours. By this time, all departments should be at tactical readiness. While we expect smooth sailing to Algorab, I needn''t remind anyone that most of our trip will be well within Romulan territory."\n\nAround the room, a couple people glanced at each other. It still seemed a bit odd to say they''d just be cruising around Romulan territory.\n\n"At Warp 7.5, we should reach Algorab by the morning of the third transit day," Lewis continued, glancing at Lieutenant Ryan, his Flight Controller, who nodded an affirmation. They weren''t stretching the engines at that speed, and he could always add a bit more juice to keep to the timeline. Still, if memory served him right, Algorab was just over five light years away, so the Commander had set a reasonable timeline. "Once we get there, we''ll have two days to familiarize with the conference center and set up our equipment and protocols before the summit begins. It will then proceed for two days, and then we close up our stuff and depart." It all sounded so easy when put that way, but in reality, it would likely be anything but.\n\nLewis tapped the display again and the lights dimmed. "The facility is opulent and relatively large," he narrated as the screen changed to three-dimensional flyby that looped around the conference grounds. "It rests on the outskirts of Algorab''s capital city, used more often as a government retreat than anything else." Indeed, the animation showed a gorgeous building fashioned with marble walls and pillars, resting right alongside a set of high cliffs that overlooked the sea, a stark contrast to the industrial nature of the rest of the city. "Perimeter security isn''t bad, but it''s incredibly open on the inside." The flyby was replaced by a brief slideshow that highlighted beautiful marble and large outdoor courtyards, complete with well-kept gardens and gorgeous statues. Finally, the slideshow came to a close with a multi-layer floor plan that stayed fixed on the screen as the lights came back up.\n\n"Throughout the conference, most dignitaries and their staff will remain on the grounds in subterranean quarters beneath the facility," he said, motioning at the lowest level of the floor plan. "The ground floor of the facility," he continued, motioning at the main level of the floor plan, "includes a number of breakout rooms, one reserved for each dignitary and their staff, and then, of course, the main forum where proceedings will occur."\n\nLieutenant JG Campbell, doing his position in the Analysis Unit justice, was again the first one to speak up, although his question was not particularly deep. "Sir, forgive me, but how are our roughly twenty Tac-U guys going to cover this whole facility?"\n\n"They''re not," replied Lewis calmly in a matter-of-fact tone. "We''ll be deploying additional assets. Lieutenant Mozheir''s security teams will handle most of the day-to-day security-oriented matters, while the Captain Eden''s Tactical Unit focuses on particular aspects I''ll get to in a few moments." The astute ones among the staff could probably already guess where that was headed. "Operations and the Analysis Unit, meanwhile, will help with logistical management, and Engineering will be deployed to assist with equipment."\n\nThe Commander looked around the room, waiting for questions.\n\n"So, we''ll have less people on the ship to guard our own people and information?" Elana asked. She remembered very well how the Romulans had previously tried to steal information from the ship and that were people they were supposed to work together with. She could easily imagine that the parties present at the conference had even less hesitation to help themselves to Federation information.\n\nThat one had dawned on him as well, and he answered in kind: "Yes, that is correct. However, consider the attack vectors. If they try to sneak a small party on board, detection is key so sensors will just have to be monitored closely. If they try to storm the ship, though, it doesn''t matter how many we have aboard because we''re more than four light years inside Romulan territory orbiting a military-industrial hub of the Empire." The most valuable contents on the ship were those within its databanks, and consequently, he turned to his Chief Engineer: "Lieutenant, please set up a kill switch so that, in the event we are breached, it only takes the issuance of one command to erase all databanks of sensitive data."\n\nSlade didn''t like that request, there were ways to secure the information without erasing it. "Sir, if I may suggest something else?" He waited a moment for the Commander to nod, "There is an alternative. I could install positronic data couplers. A design pioneered by Geordi LaForge based on information left to him by Commander Data."\n\nAs a boy, Lewis had spent time in the engine bays of the Golddigger and the Luck of the Irish. It gave him a rough working knowledge of things one could fix with a hyperspanner. However, when it came to the finer points of starship technology, he was at a complete loss. "Go on?"\n\n"In essence, what they do it encrypt the data in positronic data layers. As it leaves one coupler, it is scrambled until it reaches another coupler. And because the couplers are sequenced with positronic wavelengths similar to Commander Data''s, they can''t be intercepted or forcibly decoded." He paused, then in anticipation of the question he knew would follow, "The Corps of Engineers, Starfleet Intelligence and Starfleet Strategic Intelligence Operations have all spent the last 8 or so years trying to find a way to break the coding to disprove the viability of the couplers. So far, no one has succeeded."\n\n"So why aren''t we using them everywhere?" countered Lewis. "Is there a catch?"\n\n"They haven''t been authorized for widespread distribution." Matthews hoped the man would leave it at that. His official record didn''t reflect the time he spent with R&D working on several classified projects over the preceding few years. This happened to be a project with which he was intimately familiar.\n\n"Alright Lieutenant, please go ahead and put together a report on both the kill switch and the positronic data couplers," replied Lewis. "I''d like to understand a bit more deeply before we play dice with our databanks." The thing was, Lewis doubted the Romulans would try to overwhelm the ship. It simply didn''t fit with the scenario. The government was reeling, trying to hold itself together. Inciting the Federation wasn''t right right move. Some of the planetary governors were threatening secession, might even call on the Federation for protectorate status, so again, attacking the ship didn''t make sense. There might be a few fringe elements that could try, but orbiting high above the planet with her shields up most of the time, it wasn''t as though getting aboard would be easy without naval assets.\n\nSlade nodded, "Aye, sir. You''ll have it this evening."\n\nThe Commander paused, looking around the room again to see if anyone had any questions thus far. The room was silent. They didn''t have more question - yet - but once they got to pour through the data a bit, he was sure they would. The briefing packet each of them would receive after the meeting adjourned had a lot of holes. It described the physical layout of the facility, but only by the telling of Governor Tarov of Algorab. If he wasn''t being entirely truthful about discrete aspects of the layout, they''d have no idea. Similarly, they had personnel jackets for most of the Romulan dignitaries, but many jackets were all but empty, just a name and a face, sometimes lacking even a face.\n\n"Everyone will have the next day or so to familiarize with the material in the briefing packet you all will receive upon the closing of this meeting. Department heads should work with Captain Amolyae to draw up a personnel and equipment placement strategy." Turning to his Tac-U CO, Lewis continued, "This should be on my desk by 1200 hours on Day 5, which will give us just over a day to secure any additional assets we need from Deep Space 6 before we depart."\n\nAs Lewis looked towards him, Jaxon turned his head down to the PADD he was holding, which was essentially blank. He used the new rank, and he didn''t like it. "And about the Tac-U''s assignments?" he asked.\n\n"This mission presents us with unprecedented access to officials within the Romulan government and military," explained Commander Lewis. "In placing personnel and equipment to secure the facility, we''re placing assets that can also surveil and observe to expand our intelligence on the current state of the Empire. While all personnel will be asked to keep their ears open, the Tactical Unit will be responsible for deeper surveillance in places where it wouldn''t make sense to place an overt camera - like living quarters, the dignitary staff rooms and when they leave the grounds."\n\nA satisfied smile appeared on Elana''s face. She had listened carefully to the discussion about protecting their data, but had decided that the outcome wasn''t for her to decide. As long as it was noted, she was fine with it. However gathering their own information was something she did like. It was part of what she had been originally trained for. "Anywhere specific we need to be, or anyone we need to keep a close eye on?"\n\n"No doubt we''ll know those kind of specifics when we get there," Jaxon replied, giving a look to Elana that told her she was asking too many need-less questions.\n\nThe Commander didn''t like the way that Amolyae kept suppressing his people. He''d invited them to the meeting because he wanted them involved in the planning. However, he did affirm part of the Captain''s statement: “Captain Amolyae is right that more will be coming later. We’re pretty darn short on specifics for the moment.” He hoped that would change before the mission began, but in some ways, he was doubtful. This mission was supposed to help piece some of that together. “However, I am prepared to highlight a few of the key players now, and more material will be disseminated on a need-to-know basis as it becomes available.”\n\nWith that, the Commander raised his PADD and keyed in a couple commands, bringing up the face of a particularly imposing Romulan man. "This is Governor Tarov, our gracious host,” Lewis said with irony, as his headshot looked anything but gracious, more like an overload than a benefactor. “Given the role his planet plays, expect him to push hard that dissension needs to stop. He’s likely going to come out on the side of the provisional government, but if his confidence in them waivers, he could be a wildcard. Ultimately, though, he’s one of a handful of players who intends to see a path to stability found by the end of the conference, one way or another.”\n\nThe Commander then swiped his hand across his PADD and Governor Tarov’s headshot vanished, replaced by that of a young Romulan woman who couldn’t be much over thirty. “And this,” continued Lewis, “is one of the other people heavily invested in actually finding a solution: Envoy Tepora. A proposal she made to the Senate was what spurned it on in the first place, and she was appointed as its mediator. The proposal speaks to the fact that she is young and idealistic and firmly believes that consensus can be found. However, we do not know how she had the influence to do this in the first place, nor much about her viewpoints, only that she is the daughter of Ambassador Topas and has been serving in part of a fire-fighting task group dealing with fringe colonies.”\n\nAgain, the image on the screen changed, this time to an older Romulan man dressed in military garb. “This is Admiral P’alas. He is the commander of the task group Tepora belongs to. He is a fervent loyalist to the Empire, a charismatic leader and a brilliant tactician. We only found out just yesterday that he’d be attending the summit, representing Galae Command. We should expect him to be a shepherd of sorts for the proceedings, although one with a firm hand that won’t fear bringing military might to bear if its necessary.” Of all the persons on the delegate list, P’alas was actually the one Starfleet had the most on, since they’d interacted with him on a somewhat regular basis since the Hobus event. He was also one of the men Lewis worried least about. He ultimately had the interests of the Empire at heart, and although he and Lewis might not reconstruct the Empire in the same way given the opportunity, ultimately he’d not be prone to undue fits of rage.\n\nAnother swipe brought with it a group of dossier images. “Beyond these folks, we’ve got a number of others on the radar, including both Senators and governors. Senator Vorenus, a member of the old guard, has spoken with the Task Force News Service several times, so we know he’s aligned strongly with finding consensus. Governor Trevolok, meanwhile, we know to be firey and anti-Federation - the fact that Rator hosts provisional government likely makes him a strong loyalist. Senator Vorelian, Senator Ariana, and all the others here, though, unfortunately the data on most of them is shaky on them so far - and it will be our job to help fill it out.”\n\nElana nodded, but she had gotten Amolyae''s hint as well and decided to shut up. It was the first time she was in a briefing like this, so she was still getting used to the specifics of how these went. Apparently getting the details straightened out wasn''t what was required here.\n\nThe Commander clasped his hands together as he waited for any questions. When none came, he promptly dismissed the meeting: "We all have a lot to do, so let''s get to it."', '', 0, '', 0, 0),
(3, 'Dark Plotting', 'IRV Acerbus', 'Day 2 - 2340 Hours', 1370674955, '18,19', '1', 1, 0, 'activated', 'A lone Shalimar-class heavy fighter wove through the wreckage. General Markov had a D’deridex and two Khellians at his disposal, along with many of the finest officers the Tal’Shiar had to offer. Somehow, though, that wretched Sub-Commander Talos and his Starfleet pet had managed to not only track them down but also defeat them with nothing more than a Valdore-class warbird and an Ares-class Starfleet tactical cruiser.\n\nAt least there was nothing to find amongst the wreckage, the damage had been so severe. The gravimetric distortions he’d picked up on his approach told that story well: the D’deridex had completely collapsed in on itself when somehow it’s singularity containment failed. That left the two Khelians, but in their defeat, they’d at least regained some semblance of honor by self-destructing rather than allowing themselves to be captured. Starfleet might not share their invasive methods of interrogation, but Talos wouldn’t have been so queasy of heart. As far as the lone pilot, Major Demonak, could tell, the truth about the rogues had at least been contained: the Tal’Shiar had not been found at the root of the scheme.\n\nStill, it was but one of many simultaneous plots they had going, and even if that one had been unravelled, he had little doubt that Chairwoman T’Daran could have deflected it. One General going rogue didn’t mean that the whole institution was operating out of bounds - although in reality, they were doing exactly that. In these troubled times, there was much to be seized.\n\nA beeping sound from his console alerted him to the arrival of another ship, the IRV Acerbus, right on time. Without hailing, Major Demonak brought the Shalimar around and headed for the rear hangar bay of the Valdore-class warbird.\n\nFive minutes later, he was walking down a long windowed corridor with General Sonara T’Daran herself. In the days of old, such a meeting would never have happened. There’d have been at least two layers of insulation between himself and the Chairwoman of the Tal’Shiar, but times had changed. Following the Hobus event, the Tal’Shiar had become more fluid, their hierarchy compressed as they stretched across numerous operations, operations that would better position themselves for the next era of the Empire.\n\n"It’s fitting we should be having this meeting here," T’Daran was saying, "floating amongst the debris of Markov’s task group, a reminder of just how high the stakes are."\n\nMajor Demonak did not blink, did not look to the ground, did not give any indication of concern about that statement. Instead, he nodded with his head held high. He knew she was right. Markov had been foolish. He’d slipped up. To a man who lived and breathed Tal’Shiar, who wore his duty with bashful pride, Demonak found the mistake intolerable.\n\n"It’s time we put our foot in the fight directly," she continued. "You and I, we’re going to Algorab to officially represent the Tal’Shiar at a governors summit called to address the dissension among local planetary governors." Much of this was the Tal’Shiar’s own doing. They’d been fermenting negative sentiments among marginalized worlds to fester dissent, for with dissent, the government would be forced eventually to turn to their shadowy brethren, the Tal’Shiar, to clean up the mess.\n\n"Officially?" asked Major Demonak. He didn’t regard himself a politician. He was too outspoken and brash, to willing to call others on their lack of stomach, and while he acted as a mouth for the Tal’Shiar for some of their contacts in the government, overtly representing the Tal’Shiar on the record wasn’t his strong suite.\n\n"Yes, officially. Markov and the others, they’ve sowed the seeds, but it’s time we tend the garden," replied the Chairwoman without any further explanation, to which Demonak was glad. The lack of more information meant that the Chairwoman planned on engaging in the political rhetoric herself. So what was he to be there for?\n\n"While we’re there, though, I need to enlist your expertise," she explained.\n\nAt that, the Major perked up.\n\n"Your dear friend Vorelian," she said with sarcasm, knowing full and well that he was no dear friend, just a tool, and one who’d fallen out of her favor, "he’ll be attending the summit as a representative of the Senate. It would be in our best interest that he is vocally negative about Starfleet’s presence at the summit."\n\nWhen T’Daran had read the initial proposal for a summit by Tepora, the ignorant daughter of Ambassador Topas, she’d been stunned by the call for Starfleet to provide non-biased security at the summit. She almost found herself agreeing with Admiral P’alas that it was a dreadful idea. Not liking the idea of being on the same side as P’alas, though, a plan had surfaced in her head, one that could get rid them of a serious thorn in their side. To make it happen, Starfleet indeed needed to be at the summit, and thus she’d pushed a few pawns to make sure that both the provisional government and the dissenting governors signed off on the idea.\n\nWhile Demonak did not know exactly where the Chairwoman was headed, he could make a guess: "I gather I won’t have to tolerate the slippery politician much longer?"\n\nThe Chairwoman simply nodded. ‘And I won’t have to tolerate Starfleet much longer either,’ she thought to herself. If she could show just how bad the dissent had gotten and simultaneously put an end to Starfleet’s meddling, the Tal’Shiar would be in a prime position.', '', 0, '', 0, 0);
INSERT INTO `nova_posts` (`post_id`, `post_title`, `post_location`, `post_timeline`, `post_date`, `post_authors`, `post_authors_users`, `post_mission`, `post_saved`, `post_status`, `post_content`, `post_tags`, `post_last_update`, `post_participants`, `post_lock_user`, `post_lock_date`) VALUES
(4, 'Kindred Spirits', 'Diplomatic Stateroom, IRV Delevhas', 'Day 5 - 1600 Hours', 1370675065, '11,12', '1', 1, 0, 'activated', 'Before they would arrive in the Algorab system Ariana wanted to make sure that her ideas on the issue were not too different from those of at least one other senator. Fortunately, Senator Vorenus had been an ally in more than one Senate meeting. He was the man of choice to discuss the situation before the meeting. It showed unity if two senators had no open differences. This always impressed the people. It was Ariana''s style to settle issues in informal meetings. Sure, this did not give her much opportunity to present herself as a great speaker or leader in public, but there was no necessity to do so. She had a seat by birthright. She could rely on the customs of the Founding Houses. The Founding Houses always settled their issues in private and stay united in public. Unfortunately, Vorenus was not of a Founding House, but he acted like one of such kind. This was one of the reasons why Ariana respected him.\n\nShe had asked him to meet for a cup of tea and some chat. He had agreed and invited her to his quarters. The VIP quarters on the Delevhas were large for a warbird and fit well to the needs of government officials. This was no surprise as the Delevhas was a Tal Prai''ex ship. Ariana was dressed in casual clothes, tailored trousers and a well-fitting tunic, both in a greenish grey, and comfortable shoes. Her shoulder-long hair was held together in a ponytail. Of course, her appearance had a cause. It showed that the meeting was really informal. Although everything looked casual, the clothes were custom-made of finest garments.\n\nAfter Vorenus opened the doors Ariana entered the office area of the quarters. "Jolan''tru, Vorenus," she said with a winning smile. "And thank you for your invitation. How are you?"\n\nOnce the door had shut, Senator Vorenus replied: “Farr Jolan.” A scholar of history, it seemed fitting to him. The phrase itself meant ‘peace awaits’, an optimistic hope he had for the Empire. At a deeper level, it was also reference to a minority peace movement of a previous era. Considering the list of dignitaries, he and Ariana would be a similar minority.”How goes life in the house of Tellus?”\n\nAlthough she knew the history of the Senate and especially her house, Ariana''s education in history was of average at most, so she missed the deeper meaning of the phrase. "Life is getting better. I just bought a little villa on Rator III. It''s not ready for occupancy yet, but the architect in charge of renovation promised me I can move into it within the next three weeks. You''re invited for the housewarming party." She smiled winningly again. Things were not bad really. Most inhabitants of the would consider the ''little villa'' a palatial estate, but it was nothing compared to the old castle that was her home on Romulus. It was not the comfort of the castle that made such a big difference. It was rather the fact that Rator was not her home. Rator was not Romulus.\n\n"Moving is never easy," answered Senator Vorenus as he gestured towards a pair of couches in the center of the office area. "I would be happy to attend," he continued with a smile. "For me, the thing I miss most is the water." Sure, Rator had oceans and lakes, but they weren''t as vast or plentiful as they''d been on Romulus. In fact, the older man spent almost an hour commuting into the capital each day just so he could live by the sea. In his younger days, he would have given up the water and lived in the capital just to be in the political fray, but in his elder years, it was returning to the waterfront after each long day that kept him at peace. So much contention had befallen the Empire, and Vorenus really did wonder where it would end.\n\nAriana went to the pair of couches and settled in one. "I miss the snowy peaks of the Kae''raktar mountains. And now I''ll be living in some hills." She shrugged. "Don''t take me wrong, it''s a beautiful place. It''s just not home... yet." She hoped this would be different once the villa was decorated according to her wishes. She crossed her legs and looked at Vorenus. "I would really enjoy sharing memories of Romulus with you," she said with low voice. Shaking her head slightly she continued. "Unfortunately, now is not the right time. The Star Empire is in motion. We have to make sure that it does not fall to bits. We just have to find a way to achieve this with minimum damage."\n\nWhile Ariana spoke, Vorenus strode across the office space to a side-table where a tray lay resting. On that tray, his staff had laid out a fine assortment of teas from every corner of the Empire and even well beyond. As Ariana mentioned how things were in motion, he found himself looking out the window, stars blurring by as they barreled through space at high warp. Indeed, things were in motion. After a moment, he returned to reality, picking up the tray and carrying it over to the table that sat between the couches. "Yes, never in my waking years have I seen things so turbulent," the elder Senator mused. There''d been a few rough patches along the way. The Dominion War had brought them to the brink, but that was an external stressor. Here, the problem was completely internal.\n\n"We need to do what we can to quell the dissent peacefully," he continued, looking grave, as he selected an herbal teabag from Desica and prepared his drink. "Cries for secession are not easily settled with a bludgeon. Unfortunately, our counterparts such as Governor Trevolok and Admiral P''alas will beg to differ." The Governor was a fire-eater, but he was also a respected war hero in a former career. And Admiral P''alas, meanwhile, no one could argue with the fact that he''d been more successful in dealing with the dissension through his fire-fighting task group than the entire Senate with all of their political ramblings.\n\nAriana nodded thoughtfully. "I agree. We can''t afford to use our forces inside the Star Empire, and against our people. Every ship used to fight separatists is one missing to protect our borders. At the same time, military action leads to distrust. Distrust creates rifts dividing our society. This makes things worse. No, only a peaceful solution helps to stabilise our Empire. The problem with any peaceful solution is that we have to concede. We both know that only those concessions are possible for which we can get a majority vote in the Senate." She took a cup of an aromatic tea from the Aihai on Romulus.\n\nVorenus agreed wholeheartedly. On all sides, interstellar powers had taken an interest in the struggling Empire. The Federation came with open arms, Starfleet’s Task Force 93 thus far proving of indispensable assistance. Not were all so welcoming though. The Star Navy had reported several brutal engagements with the Klingons, and any ship fighting fires within their borders was one that couldn’t defend against that clearly hostile force. Raiders and other opportunists had also moved in, and even the Cardassians had turned their eyes towards the Empire. Although there would be vast disagreements among the various participants, the elder Senator hoped that all would recognize this and understand that some compromise was needed. Unfortunately, men such as Trevolok would almost certainly disagree, and even Admiral P’alas might refuse depending on what sort of compromise was found.\n\n"I think that we could succeed with granting them more freedom when it comes to taxes for local development,” continued Ariana. “Imperial taxes should only be those for Imperial duties, like the military, foreign affairs, intelligence and subspace communications. Other taxes, like those for education, healthcare, police and so on could be put under direct control of the local governments. Decentralization is something we should do anyway." She took a sip of her tea. It had an excellent taste.\n\n“We ask for them to come together to let them drift apart,” mused Vorenus. “What you’re asking is a lot, and I fear that some will not have the infrastructure to support it.” A status report from Nelvana had recently floated across his desk, and the level of organization looked reminiscent to a Klingon targ farm. He knew the young woman was right, in an idealistic world, if the Empire was thriving. “But ultimately I don’t think this issue comes down to taxes. I think it comes down to confidence. Governor Duranus recently wrote a scathing review of the Star Navy after the third raider attack on his world in a month. In our Empire’s prime, that never would have happened.” The Fleets would have made an incursion into the lawless Triangle and set the raiders straight once and for all.\n\nAriana thought about Vorenus'' words for a moment. She had to admit that her knowledge on the state of the Empire was not as good as it should be. She was a member of the Foreign Affairs Committee. There had been a lot of work to do for the Committee, especially the coordination of Federation help. Ariana could not say for sure how many she had with Starfleet captains since Hobus. Maybe too much. "We have another option. As far as I understood the former core worlds fear marginalization, right? What if we offer them representation in the Senate? Not disproportional representation, but seats within reasonable limits. In principle, I can offer a model for a reform of the Senate. I developed it before Hobus, but I never felt I had a chance to get it through the Senate. Now, with things in motion, this may be different. If we could present it as a result of the negotiations, the chances for approval would be much better."\n\n"Now that," replied Vorenus, sipping on his Desican herbal, "is quite an idea. The Senate of today certainly doesn''t represent our member worlds. You''ll have my support, but remember that those in power do not easily give it up." The elder Senator''s mind drifted back to the various factions that would be in attendance: there were the hard-line loyalists like Governor Trevolok who wanted to maintain the status quo of power while using force to drag back the dissenting governors; there were the bleeding hearts like Envoy Tepora who wanted to appease the marginalized planets regardless of the cost to the Empire; there were some who even said that these people were more trouble than they were worth; and then there were others with agendas unknown. And these were only amongst the provisional government''s representatives. There would also be representatives from the Star Navy and the Tal''Shiar there, and they would certainly be vocal themselves.\n\n"Maybe an analysis of the Senate would help us to develop a strategy," Ariana started. She was half in thoughts, trying to assess the information in her mind while she was talking. "Of the fourty-four seats, eight are unoccupied. Five seats belong to the remaining five Founding Houses. They are not elected and they do not belong to any district. They are, if you want, my natural faction." Of course Vorenus knew that Ariana occupied one of those seats. "Although our political opinions may differ in details, us senators of the Founding Houses have one thing in common: We have a long-term perspective, for the common good of the people. Simply because we know that there is no need to shine so that our eldest child will succeed us as senator. However, we tend to be conservative when it comes to traditional rights of the Senate - and our houses. I guess these were no big news, right?" She smiled and sipped some tea.\n\n"No big news," chuckled Senator Vorenus. He was well-acquainted with the old houses. While he was not among them, he often found himself siding with them, taking the safe road over the bold, though possibly fortuitous one. Still, they were not always practical, and that''s where Vorenus found himself sometimes disagreeing with them. Sometimes, they''d prefer to maintain the status quo, even when the status quo was not working - like at this particular moment. They''d been all but silent regarding cries from the marginalized worlds following Hobus, possibly fearing the shaky ground on which the Empire currently rested.\n\n"The first really important faction is ours," Ariana continued, pointing at herself and Vorenus. "Traditional, yet not stuck thinking just in old-fashioned ways." There was no need to further explain this to Vorenus. For them, the Senate was the heart and soul of the Empire, but the Empire was a living organism. As long as the soul was kept pure, things could change. "I would say that we could get a majority within them. How many do you count towards our faction? Twelve? Retok, Tolaris, S''tarleya, Maec... well, maybe not Maec... the two uf us... well, without me as I am counted for the Founding Houses... three client houses of Tellus... hmm... How many do you count?"\n\nVorenus stroked his chin and took another sip of tea as he contemplated the question. "Part of the question is stellar geography," he replied. "Tuvar," he continued, referring to his own seat, "was not marginalized by the shift in power. In fact, if anything, the Senate became more accessible to us. The same is true for Retok, S''tarleya, Maec and Tellus - although Maec is not a rational man." At the thought of Senator Maec, he shook his head. That man, who would be attending the summit, was a timebomb, and an illogical one at that.\n\nReturning to the question, though, Vorenus continued: "If you count a few of the pragmatic Senators from the outer sectors, those that have seen no change with the shift in power, I''d say we get near twelve, if not to fifteen." The outer systems that Vorenus referred to were those that lay on the far edge of Romulan space in the Beta Quadrant, far from their borders with the Cardassians, the Federation or the Klingons. They''d never been close to the seat of power, and often fended for themselves, so the impact of Hobus was negligible for them in the broad scheme of things.\n\n"I would not count Tolaris among the amenable though," cautioned Vorenus. "His sector is too close to the Klingon border. Last time he and I had tea, it was clear that Governor Duranus'' criticisms of the Star Navy resonated with him. I wouldn''t label him a secessionist, but I would expect some dissent from him."\n\nAriana nodded. "Let us say twelve. And let us consider that I get at least two of the Founding Houses to support me..." She was very sure that she could achieve this. "Then we''re fourteen, plus my own vote, that''s fifteen. We have thirty-six occupied seats at the moment and this is a reform of the constitution, so we need at least twenty-four votes. We''re short of ten votes." She analyzed her last eight years of experience in the Senate. "I expect a group of eight senators to be completely against this reform. They are made of royalists, strong supporters of the Star Navy and those who represent worlds going to lose importance. I would count the senator of Algorab among them. If the marginalized worlds around Algorab get their own representative, even if it''s just as a sector, he will lose power. Finally, the last group we did not count are four or five senators who are more or less controlled by the Tal''Shiar. We can get their votes if we can offer something of value or importance to the Chairwoman of the Tal''Shiar."\n\nThe complexity of politics within the Senate was not something deaf on Vorenus. In a perfect world, all would have taken an objective step back, considered what would have actually been best for the Empire, and then voted based on that; but so was not the case. It was all factions and backroom deals. "Governor Tarov may not be among them. His influence isn''t political. Algorab is an economic powerhouse with the military-industrial complex as its lifeblood. I don''t believe a civil war or a fractured Empire would be good for business. He''s also someone the others in this region turn to. If nearby sectors got better representation, he might view that as additional votes that would caucus with him."\n\nSenator Vorenus leaned back in the chair and thought about who else might fall into the camp of strong dissent. "The same is not true for Governor Trevolok though. He will vocally and vehemently oppose your proposal - and his influence to at least eight," cautioned Vorenus. He''d been amassing a sphere of influence ever since the shift to Rator. At first, Vorenus hadn''t been too worried. The man had an esteemed past. However, as time went on, he seemed to grow more and more irrational. In a strange switch, he''d become outspokenly opposed to the presence of Starfleet, decrying the Empress as a Federation spy. Further, any time any proposal came before the Senate that might weaken his position, he''d struck it down as best he could.\n\n"Trevolok is a problem. I agree." It was a simple statement. There was no doubt for Ariana. Maybe she could bribe the governor with some more power. Perhaps she could offer him to support his election as proconsul or praetor?\n\n"As for the Tal''Shiar Chairwoman, just this morning I was alerted that Krein Sonara T''Daran will be at the Summit herself," he offered. It was strange she would present herself in such a public setting. She''d operated far more in the background since Hobus, but now the they were making an overt move. It was certainly a power grab, but the problem was that Vorenus didn''t see the strategy yet. "So don''t count on the Tal''Shiar-oriented Senators, not unless you want to make a deal with the devil." It was no surprise that Vorenus, a seasoned career politician, despised the Tal''Shiar.\n\nIt was interesting news that the Tal''Shiar Chairwoman herself was attending this meeting. Obviously the Tal''Shiar was extremely interesting in the outcome of this meeting. Ariana grinned. "Maybe I''m going to do just this." A deal with the devil. She did not know what she could offer, but Ariana knew that she was a strong figure in the political game. House Tellus was still powerful, mostly due to its networks and wealth. Just until now Ariana had preferred to stay behind and watch. There was no need to use her power yet. For the first time, she felt something like historic responsibility for the Senate and the Star Empire. Tellus, her ancestor, was one of the leaders of the group of Vulcans who had left their home to found the Romulan Star Empire. He also had been one of the twenty-four founders of the Senate. One of the first senators. Now it was her part to hold the Empire together and to ensure the Senate''s survival for the next two thousand years. It was her duty.\n\n"In the wake of Hobus, Sonara has not been conferred a seat on the Continuing Committee, although that is often customary," hinted Vorenus. He had no idea how well that would go over. If they did cut such a deal, it would gain them five votes in the Senate, which could be critical. The summit ultimately was just a sounding board. Most of the political factions had sent some representative, but ultimately, anything decided here still had to pass in the Senate afterwards upon their return to Rator. If they had fifteen votes, and they needed nine more, and the Tal''Shiar''s puppets could give them five.\n\nThis was a good idea. It was even less than what Ariana was willing to offer Sonara. Still, it would be sufficient. "I''m sure that she is rather unhappy that she is no Committee member." Espeacially as it was indeed often customary. "It just depends on Sonara. If she cooperates, she''ll get our support." Leaning back, she asked "Would you mind if I negotiate with Chairwoman Sonara?"\n\nThe elder man took a few moments to contemplate. Sonara was not a woman to be taken lightly. He knew his own presence would change the dynamic for the worse. His dealings with her had not been positive. He''d been fairly vocal about restricting the power of the Tal''Shiar. Ariana was a different case. She was new to the Senate, a face that Sonara D''Taran had not learned to hate yet. However, sending her into the wolves along was not wise: "Yes, once we arrive at Algorab, please broach the topic with her. I ask that you take my attaché Vorsa with you." In reality, Vorsa was no aide to the Senator. He was a Tal Diann operator who Vorenus had allowed Admiral P''alas to place on his staff. He would not admit this to Ariana though, even with the deal they''d just made. Maybe in time, but P''alas had been very clear.\n\nAriana smiled. "That''s very kind of you. Thank you." She looked into her cup, which was almost empty. "I would say that we found a general strategy for the gathering on Algorab. Do you have anything not discussed so far that needs to be addressed?" She emptied her cup and placed it on the table.\n\n"I''d say we seem to have covered most of the preliminaries," answered Vorenus, taking the last sip of his own tea. The old guard among the Senate weren''t always known for their willingness to compromise and embrace change, but this woman brought hope.', '', 0, '', 0, 0),
(5, 'Outside of Operating Parameters', 'Secure Conference Room, Deep Space 6', 'Day 3 - 2200 Hours', 1370675192, '2,25', '1', 1, 0, 'activated', 'As he headed toward the conference room, Lewis couldn’t help but think about how his last mission had gone so far afield from expectations. It was meant to be a cut-and-dry track and intercept, but it turned out to be anything but. The mission was almost lost before it even got underway, and tensions between them and their counterparts in the Tal Diann had almost boiled over. They had been thoroughly bested by a task group of renegade vessels and lost several of their crew to abduction. They were left to limp back to Deep Space 6 only days after their departure from Spacedock, having suffered nearly a 20% casualty rate and severely damaged the shiny new ship in a pitched battle with the rogue task group.\n\nNonetheless, Lewis considered the mission a success, and what was more was that Task Force Command seemed to agree. Furthermore, the new third gold pip that adorned his tunic collar and the words of encouragement he’d gotten from Commodore Bryl when he’d received it gave testament to his achievement. In the end, they had not only thwarted a numerically superior force who threatened the fragile confidence which existed between the Federation and the provisional Romulan government, but they also managed to demonstrate the Federation''s continued commitment to assisting the Empire through their dark hour of need. They also managed to unofficially make a strong ally with a veteran Tal Diann Sub Commander. It was because of the way the mission had ended that Lewis had requested this meeting with Rear Admiral Thrace to begin with. As the Director of Intelligence for the Fourth Fleet, Thrace was the person he’d hope to get a fresh perspective from on how things went with the Romulan operatives. \n\nLewis stepped through the threshold of the conference room and noted how small it seemed to be. The room was clearly not meant for conferences with a large number or personnel; instead, it was a smaller one intended for more intimate or sensitive meetings. Lewis had no doubt the room had likely been scrubbed by counter-surveillance teams only moments before his arrival. After all, a top level spook couldn’t just walk into a room and have a meeting otherwise, could she?\n\nLewis found the room empty upon his arrival, so he headed over to the replicator to queue up a black coffee. It was an ever frequent occurrence for him. Before he could, though, the doors suddenly swished open from behind him. Expecting to see Rear Admiral Thrace again, he nonchalantly looked over his shoulder, and quickly the blood drained from his face. The officer standing in the doorway was not Rear Admiral Thrace, but rather the Director of Starfleet Intelligence himself, Admiral Gordon Evans. At once, the Commander snapped to attention. He was not a fan of excessive protocol on his ship and would have chastised any officer that had done so there, but he knew the way of the bureaucracy well enough to know that here it was necessary.\n\n"As you were, Commander," Evans said as he made his way to his side of the conference table and sat down the PADD in his hand. "Let me see, you like your coffee strong and black, don’t you? Make it two."\n\nThe Commander loosened up at once, giving the Admiral a discrete once-over. "Wouldn''t you rather your''s with cream, sir?" he countered. While he''d never met the man personally, nor would he have gone out of his way to do so, he still knew a lot about the man - more so than even a personnel jacket would necessarily include. He made it a habit to keep up on the major figures of the Admiralty, and the man at the top of Starfleet Intelligence was certainly a subject of his interest.\n\nFor his part, Evans silently studied the Commander, questioning how a person in his position had both the time and the inclination to know such details about him, and how he could have possibly remembered them with all he’d been through in the past few weeks. "If you are trying to impress me, Commander, consider it accomplished. Although, I’m curious how the son of an archaeologist could have such a profound memory for such mundane information, especially in light of the seriousness of all he’s been through recently."\n\n"We are both in the business of Intelligence here, Admiral," replied the Commander without any further explanation. He then turned to the replicator, ordering up one coffee, strong and black, and another with cream. While he waited for the orders to materialize, he turned back towards the Admiral and continued to entertain the small talk, "By the way, how are the grandkids? Suzie and Adam, if memory serves me?"\n\n"Indeed they are, Commander. Suzie just happens to be a very precocious four years old now, and the apple of her grandfather’s eye. Adam is now seven, and has shown a keen ear for musical talent," he answered evenly. "Why don’t you just ask the question you really mean to?"\n\nBehind him, Lewis heard the replicator finish, so he snatched up the pair of mugs and carried them over to the table, handing the one with cream off to the Admiral and then taking a sip of his own strong black brew. The Admiral here was clearly straight down to business, and Lewis could respect that. "Forgive me sir, but I was expecting Rear Admiral Thrace," he said. "What brings you out here?" While the body language of the Commander hinted that he was relaxed, internally he was on high alert. The Enigma''s last mission had not gone quite according to plan, and, while Commodore Bryl had acknowledged its success on the whole, the presence of Starfleet''s Intelligence Chief did not necessarily bode well. There was always the possibility, that he was here about their next mission, one that offered Starfleet Intelligence quite a unique opportunity.\n\n"I think we both know there are details about your last mission that will never see the inside of an official report," the Admiral started off candidly. "Further, you managed to catch the attention of a lot more people than you could possibly know, and I don’t just mean in the Federation." Evans sat a moment to let that last part sink in a bit. "To be blunt, Commander, you’ve gotten the attention of several high ranking members of the Tal’Shiar. They think you may somehow be a threat to them. I didn’t just happen to be in the area. Let’s just say you have captured the attention of several key members of the Federation and leave it at that, shall we?\n\n"Well, I may be able to shed a bit of light about the Tal''Shiar," the Commander offered, although a bit surprised that news about the mission had travelled so quickly. He was hesitant to share the information, as he’d promised Sub-Commander Talos it would not leak into the wrong hands, but the Admiral here had not risen to his current position through carelessness.\n\n"In my official report, I stated that there was no solid evidence about the origin of the rogue task group. This is not entirely true," explained the Commander. "After the battle, Sub-Commander Talos confided in me that his Chief Tactical Officer, the one captured along with Lieutenant Mirren and I, identified our interrogator as none other than Krein Markov." Lewis didn’t know if Evans knew who Markov was, but the important part was the rank - Krien, rather than EnRiov, meant that he was Tal’Shiar. The fact that a faction of the government was attacking its own aid convoys meant there were dark plans at work indeed. Before the Admiral could reply, Lewis added a few extra words of caution, "Understandably, Talos asked that this information be kept quiet for the time being. In this last mission, we started to form a bond with our counterparts in the Empire, and the last thing we should do is break that trust so quickly - besides, if such information got out publicly, it could have a destabilizing effect on the Empire that would not be advantageous for any of us either."\n\n"But of course, we already knew that information Commander. I wouldn’t be here if we didn''t. There are many in Starfleet Command that disagree with what I’m about to tell you, but what I’m about to tell you has been approved by Fleet Admiral Necheyev herself. Not even your Fleet Commanding Officer has been briefed on this, and he likely won’t be. Do you understand that, Commander?"\n\nThe Commander didn''t understand how they knew that already. Lieutenant Mirren was dead, and the only others who carried that knowledge were Sub Commander Talos and his Chief Tactical Officer. Still, Intelligence worked in strange ways, and thus he affirmed, "Yes sir, I understand."\n\n"I hope so, Commander. If this information were to get out, it could greatly complicate relations between the Federation and the Romulans," Evan’s responded, carefully weighing the words he was choosing to use. "We have a job for you. There is an up and coming Romulan Governor we want silenced, and we don’t mean muzzled. To be frank, we want him assassinated. We don’t care how it’s done, but we want you to take care of it," he finished, knowing full well that if it were accomplished the Federation would likely be in a position to "counsel" the Romulans on a likely replacement who would be more friendly to Federation interests, and if for some reason it didn’t go so well... well, they’d have a scapegoat ready made. Of course, there was no way Evans was going to say that outright. Hopefully Lewis would be naive enough not to understand that.\n\nCommander Lewis didn''t know Evans, at least not beyond his personnel jacket, family history and a few personal preferences. To have such a request dropped on him, one that deviated so far outside of normal operating parameters, did not sit well, especially when given from the highest levels of Starfleet. When he''d been a shooter in Intelligence Special Operations, they''d toed the line between right and wrong carefully, sometimes making decisions that the ivory halls of Starfleet Command would never have condoned, but those decisions were made with plausible deniability. Here, the Admiral had come out straight and said it: they wanted the Enigma and her crew to assassinate an established member of the Romulan government.\n\n"Excuse me Admiral?" Lewis asked after a moment of contemplation, his expression neutral and completely unreadable. He was immediately in information-gathering mode, a defensive reflex he''d learned over the years when placed somewhere less than ideal. "This one is pretty far off the reservation. Who''s the target and why the final solution?" It just didn''t fit with Starfleet Command''s modus operandi. On the whole, he''d always known the bureaucrats to pride themselves in their ideals, and yet this was coldly the opposite. If for the right reason, it could be a pragmatic move. Assassination didn''t make him faint of heart. It was merely this particular situation that gave him pause.\n\nEvans stood up while listening to Lewis question him, and turned to face the stars on display outside the windows of the conference room. "We’ll get into that in a few minutes, Commander." \n\nThe Admiral turned slightly to face the Commander, giving him a quick once over, then turned away from his direct gaze. "You ****ed things up pretty good on your last assignment, wouldn’t you say? You don’t think Thrace drizzled you with all that praise on her own accord, do you? No, she did what any good little puppet would do, and she followed orders. The truth is, Commander, you are damn lucky to have a career after how that mess you call a mission turned out. If it weren’t for the connections that we have in the...," he stopped himself before he outed contacts on the other side. "You’ve received your orders, Commander. I’m not talking to you as your TFCO. I’m the damn Director of Starfleet Intelligence. You’d better figure out where your loyalties lay, Commander, and you’d better do it pretty damn quick. We didn’t train you as an intel man for all those years just to let you go to be a starship captain, now did we? Use your brains, Commander. There’s a mission to be done. Can we count on you to carry it out or not?"\n\nLewis stood there unmoving, his expression a poker face, his posture still calm and relaxed, yet his mind hard at work. The Director of Starfleet Intelligence was usually known for his positive outlook, at least publicly. Here, his words were biting and his tone demanding. "Admiral, if you know anything about my past, you know such threats won''t stick and that I''m not just going to take this blindly. Yes, I''m a spook. Yes, I''m willing to toe the gray line. And yes, I''m here to accomplish things that would be looked down upon by the very people we look to serve. But no, the amount of metal on your collar does not give you the right to demand something so far off the reservation. You''re going to have to give me more details, or you can find someone else."\n\nEvans turn a cold stare upon Lewis. "And if you knew me half as well as you thought you did, Commander, you''d know I''d sell those ''sweet'' little grandkids of mind out in a New York minute if I thought it would buy me any good hard intel. I don''t give a damn about your conscience. We are Intelligence Officers, not freakin'' science nerds. Do you know how to play hardball or not? If not, I''m going to recommend to Necheyev that we dump the blame for that sorry little mess you left us squarely into your lap. Otherwise, I''ll go to bat for you, and I''ll find some other patsy to blame for it. I need to know if you are on our side or not! I don''t want to hear any crap about Federation morals either. This is hardball. There are Romulan''s who would just as soon sell out their grandchildren as to standby while pissant Governors would dare to sell out their future. We need to know where you stand." \n\n"That mess, so you call it, rests squarely on the fact that we were deployed with a lack of intelligence," countered Lewis firmly. "And my report already reflects that." The Commander stared across the table into the Admiral''s eyes, as if issuing a challenge. He would not back down so easily.\n\nEvans wasn’t done playing hardball, not anywhere near yet. As he looked back at the eyes who were trying to so naively challenge him, he couldn’t help but be reminded by how cocky he had himself been when he was starting out in the industry. He answered back the eyeshot as if to say, ‘remember, you asked for this,’ then he responded with, "Commander, ever hear the name Raipax? Whether you know it or not, that is the name of the roque group’s flagship. I’m sure you are dying to know how I could possibly know that, but suffice it to say, I do. So, how about we stop playing around? We both know your report was doctored. We wouldn''t want your late friend Richard Eden to be posthumously dishonored, would we? Afterall, his recklessness almost killed all 139 crew members aboard the Enigma, and you''ve already gone far enough to cover up that illegal order of his, haven''t you?" he countered.\n\nThe Commander didn''t flinch, didn''t show any sign of a reaction, no tell that the Admiral was right, but both duelers knew he was backed into a corner. Lewis didn''t regard many as friends, but to those he did, he was intensely loyal - in life, and in death. Captain Eden had lived a life of honor, and, about those few transgressions at the end, Lewis had doctored them out because they would unduly taint an otherwise upstanding soldier for no purpose whatsoever. If Evans dragged them back out, it would destroy Eden''s reputation, and the fact that Lewis lied about it could bring him before a court martial as complicit in the act. There was nothing to be won here by falling on the sword, but the Commander remained still and quiet, waiting to see where the Admiral took it next. \n\nThere were few times in his long career that Evans enjoyed having the upper hand, and this was definitely one of them. Lewis was completely clueless how he had come to know the details he had, and it was painfully obvious the Commander wasn’t in a position to fight back any further than he had. "Why don’t you spare me your holier-than-thou attitude, Commander? We both know what happened. Your friend screwed up, and you wanted to salvage his memory, only you didn’t count on members of your own crew turning on you." It was a lie, but then Lewis would have no way of knowing that, would he? "So, you can either take on this assignment, or we can dump this whole thing in his lap. Oh, and we won’t stop there, Commander, not even close. By the time we are done, the good Captain Eden, and you if necessary, will be responsible for a good number of misgivings in Romulan territory. So, what will it be? Shall I give you your objectives or should I have the guard outside take you into custody now?" he finished as he smugly took a deep sip of his double strong coffee with cream, so arrogantly ordered for him only moments before by the young Commander who thought he’d had the upper hand.\n\nCommander Lewis did not back down easily, but he did know an unwinnable engagement when he saw one - and this was exactly it. It wasn''t like dieing in the line of duty. There, you could still win if your death had worthy purpose. Here, on the other hand, the only outcome was disgrace and dishonor, a fate far worse. "Very well, Admiral," was all Lewis offered in response. The conniving man across the table deserved no more than that.\n\n"Who''s the target?" Lewis transitioned, almost as if it was just business as usual. Lewis had killed before, that wasn''t the problem. He''d even killed when it wasn''t sanctioned. That wasn''t the problem. The problem was the way the Admiral was acting, the fact he would offer no explanation as to why they were even doing this. Something was very wrong here. \n\n"How would I know?" he asked, as if to add to the mystery behind the whole setup. "My aide will be with you in a moment. He will give you any pertinent details you may need. I’d suggest you listen, Commander," he said in a snarky tone as he stood to leave the room. "Oh, and Commander, this conversation never happened. I was never here, do we understand each other?"\n\n"Yes, sir." The response from Commander Lewis was flat and clearly not what he wanted to say, but it was his only option at this point. He vowed though that, if the opportunity presented itself, he''d make sure the Admiral felt the consequences for this. He continued to stare with cold eyes as the Admiral left the room. As soon as the door closed behind him, the veteran operator wished he could have assassinated the Admiral instance, but now was not the time. Someday, though, maybe he''d get the chance - at least to rip those pips off his collar.\n\nIt seemed like a long time passed after the Admiral had left the room, but within minutes, Captain Johannes Goragga entered the room to finish the briefing. Lewis was completely unfamiliar with Goragga, which seemed rather odd, because he thought he knew most of mid-level spooks in Starfleet. "Good morning, Commander," Goragga started in an oddly warm and friendly tone, "I hope he wasn’t too rough on you. He didn’t have much sleep on the journey... wait, forget I said that. I’m sure he gave you that whole, ''I wasn’t here,’ line."\n\n"Indeed," nodded the Commander, saying no more. The message was clear that he was neither happy with nor particularly interested in small talk. He just wanted the briefing to be over already and to get on with it already.\n\n"Alright, let’s get on with it," the Captain said, sliding over a PADD that had a series of images on it. "The mark is an up-and-coming Governor from an industrial planet in the Romulan Empire. His views are moderately anti-Federation, and we’ve got assurances from someone in the Empire that if we take him out, he’ll help us find someone who better shares our ideas on where the Empire should be going as they rebuild. The target''s name is Tarov. I can’t tell you who our contact is inside the Empire, at least not yet, but the information is considered highly credible, and confidence is high," he added before pausing to let the Commander cycle through the photos. "We don’t want you as the trigger man. If something goes south, we want you to have some level of plausible deniability should your ship be captured. Questions?"\n\nThe Commander had many questions, but there were few that he could not ask. The Admiral had already backed him into a corner here, and the best he could do was go along with it. "By Governor Tarov, you mean the host of this summit, do you not?" He saw that as being a tricky bit. Intelligence indicated that the Governor had been one of the mediating forces that had brought the two dissenting sides to the table, someone who had a voice listened to by the Senate and the Star Navy and yet was positioned such that he had the respect of the disenfranchised worlds in the region.\n\n"The same, except our source tells us Tarov has no desire to see the Federation on friendly terms with the provisional government, and is likely to do something to sabotage the process just as we are making useful progress, just to make us look bad."\n\nThat could be true, but it might also be a complete fabrication. "I understand," he said in apparent agreement. From the intelligence Lewis had seen though, Tarov was likely simply representing the interests of his world, one that had a key role to play in military-industrial complex. Civil war wasn''t good for that sort of a business, and, if unimpeded, the secessionist cries might rise to that level. He might see the Federation as delimiting the manufacturing requests flowing into his world, but at the moment, there was anything but a shortage of demands on his world.\n\n"There’s one more thing, Commander," Goragga said, looking up from his PADD to make sure Lewis was staring him straight in the eye, "Starfleet believes your report also left out strategic information. Fleet Admiral Necheyev believes you may have more information on who was behind the rogue attack on your ship. We already know you falsified your report regarding Marine Captain Eden’s actions, so why don’t you come clean?"\n\n"As I already explained to the Admiral, Krein Markov was in command of the rogue convoy," replied Lewis flatly. "That''s all we know." He could have offered analysis and supposition, but it was only that, guesses drawn from that one factoid. In more amenable times, he would have volunteered his thoughts, but he felt extorted out of this information. Still, he''d already been conned into telling the Admiral this, so repeating it to a henchman bore no additional harm.\n\n"I am sure it goes without saying, if you screw this up, you might as well not bother coming back to Federation space, because your career will be over, Commander. See to it you don’t screw up this mission like you did your last one. Oh, and if you even think of lying on another report," he said, but didn’t finish. He stood and left the conference room, leaving the PADDs behind which contained the rest of the mission intel that Lewis and his crew might need.\n\nCommander Lewis sat there silently, pondering the exchange. He''d come here expecting a mild lecture from Rear Admiral Thrace and then some additional orders about surveilling particular figures of interests and developing assets. Instead, he had found himself before the Director of Intelligence himself, taking a strong lashing and being given a kill order he could not contest. Something was very afoul here. Killing didn''t bother him particularly; refusing to do so would only bring harm to himself, his crew, and his departed friend; and they could just find someone else to do the deed - and thus, for the moment, he had no play but to proceed as ordered. He''d give the crew no indication about what had transpired. To do so would simply make them complicit, if the whole thing unravelled. The whole affair left a sour taste in his mouth. He vowed that, when the opportunity presented itself, he''d do something about it.', '', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nova_posts_comments`
--

CREATE TABLE IF NOT EXISTS `nova_posts_comments` (
  `pcomment_id` int(8) NOT NULL AUTO_INCREMENT,
  `pcomment_author_user` int(8) NOT NULL,
  `pcomment_author_character` int(8) NOT NULL,
  `pcomment_post` int(8) NOT NULL,
  `pcomment_content` text NOT NULL,
  `pcomment_date` bigint(20) NOT NULL,
  `pcomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`pcomment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_privmsgs`
--

CREATE TABLE IF NOT EXISTS `nova_privmsgs` (
  `privmsgs_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `privmsgs_author_user` int(8) NOT NULL,
  `privmsgs_author_character` int(8) NOT NULL,
  `privmsgs_date` bigint(20) NOT NULL,
  `privmsgs_subject` varchar(255) NOT NULL DEFAULT '',
  `privmsgs_content` text NOT NULL,
  `privmsgs_author_display` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`privmsgs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_privmsgs_to`
--

CREATE TABLE IF NOT EXISTS `nova_privmsgs_to` (
  `pmto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pmto_message` bigint(20) NOT NULL,
  `pmto_recipient_user` int(8) NOT NULL,
  `pmto_recipient_character` int(8) NOT NULL,
  `pmto_unread` enum('y','n') NOT NULL DEFAULT 'y',
  `pmto_display` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`pmto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_ranks_ds9`
--

CREATE TABLE IF NOT EXISTS `nova_ranks_ds9` (
  `rank_id` int(10) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(100) NOT NULL DEFAULT '',
  `rank_short_name` varchar(20) NOT NULL DEFAULT '',
  `rank_image` varchar(100) NOT NULL DEFAULT '',
  `rank_order` int(5) NOT NULL,
  `rank_display` enum('y','n') NOT NULL DEFAULT 'y',
  `rank_class` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=389 ;

--
-- Dumping data for table `nova_ranks_ds9`
--

INSERT INTO `nova_ranks_ds9` (`rank_id`, `rank_name`, `rank_short_name`, `rank_image`, `rank_order`, `rank_display`, `rank_class`) VALUES
(1, 'Fleet Admiral', 'FADM', 'r-a5', 0, 'y', 1),
(2, 'Fleet Admiral', 'FADM', 'y-a5', 0, 'y', 2),
(3, 'Fleet Admiral', 'FADM', 't-a5', 0, 'y', 3),
(4, 'Fleet Admiral', 'FADM', 's-a5', 0, 'y', 4),
(5, 'Fleet Admiral', 'FADM', 'v-a5', 0, 'y', 5),
(6, 'Field Marshal', 'FMSL', 'g-a5', 0, 'y', 6),
(7, 'Fleet Admiral', 'FADM', 'c-a5', 0, 'y', 7),
(8, 'Fleet Admiral', 'FADM', 'b-a5', 0, 'y', 8),
(9, 'Fleet Admiral', 'FADM', 'd-a5', 0, 'y', 9),
(10, 'Fleet Admiral', 'FADM', 'o-a5', 0, 'y', 10),
(11, 'Fleet Admiral', 'FADM', 'p-a5', 0, 'y', 11),
(12, 'Fleet Admiral', 'FADM', 'w-a5', 0, 'y', 12),
(13, 'Admiral', 'ADM', 'r-a4', 1, 'y', 1),
(14, 'Admiral', 'ADM', 'y-a4', 1, 'y', 2),
(15, 'Admiral', 'ADM', 't-a4', 1, 'y', 3),
(16, 'Admiral', 'ADM', 's-a4', 1, 'y', 4),
(17, 'Admiral', 'ADM', 'v-a4', 1, 'y', 5),
(18, 'General', 'GEN', 'g-a4', 1, 'y', 6),
(19, 'Admiral', 'ADM', 'c-a4', 1, 'y', 7),
(20, 'Admiral', 'ADM', 'b-a4', 1, 'y', 8),
(21, 'Admiral', 'ADM', 'd-a4', 1, 'y', 9),
(22, 'Admiral', 'ADM', 'o-a4', 1, 'y', 10),
(23, 'Admiral', 'ADM', 'p-a4', 1, 'y', 11),
(24, 'Admiral', 'ADM', 'w-a4', 1, 'y', 12),
(25, 'Vice Admiral', 'VADM', 'r-a3', 2, 'y', 1),
(26, 'Vice Admiral', 'VADM', 'y-a3', 2, 'y', 2),
(27, 'Vice Admiral', 'VADM', 't-a3', 2, 'y', 3),
(28, 'Vice Admiral', 'VADM', 's-a3', 2, 'y', 4),
(29, 'Vice Admiral', 'VADM', 'v-a3', 2, 'y', 5),
(30, 'Lieutenant General', 'LTGEN', 'g-a3', 2, 'y', 6),
(31, 'Vice Admiral', 'VADM', 'c-a3', 2, 'y', 7),
(32, 'Vice Admiral', 'VADM', 'b-a3', 2, 'y', 8),
(33, 'Vice Admiral', 'VADM', 'd-a3', 2, 'y', 9),
(34, 'Vice Admiral', 'VADM', 'o-a3', 2, 'y', 10),
(35, 'Vice Admiral', 'VADM', 'p-a3', 2, 'y', 11),
(36, 'Vice Admiral', 'VADM', 'w-a3', 2, 'y', 12),
(37, 'Rear Admiral', 'RADM', 'r-a2', 3, 'y', 1),
(38, 'Rear Admiral', 'RADM', 'y-a2', 3, 'y', 2),
(39, 'Rear Admiral', 'RADM', 't-a2', 3, 'y', 3),
(40, 'Rear Admiral', 'RADM', 's-a2', 3, 'y', 4),
(41, 'Rear Admiral', 'RADM', 'v-a2', 3, 'y', 5),
(42, 'Major General', 'MAJGEN', 'g-a2', 3, 'y', 6),
(43, 'Rear Admiral', 'RADM', 'c-a2', 3, 'y', 7),
(44, 'Rear Admiral', 'RADM', 'b-a2', 3, 'y', 8),
(45, 'Rear Admiral', 'RADM', 'd-a2', 3, 'y', 9),
(46, 'Rear Admiral', 'RADM', 'o-a2', 3, 'y', 10),
(47, 'Rear Admiral', 'RADM', 'p-a2', 3, 'y', 11),
(48, 'Rear Admiral', 'RADM', 'w-a2', 3, 'y', 12),
(49, 'Commodore', 'COM', 'r-a1', 4, 'y', 1),
(50, 'Commodore', 'COM', 'y-a1', 4, 'y', 2),
(51, 'Commodore', 'COM', 't-a1', 4, 'y', 3),
(52, 'Commodore', 'COM', 's-a1', 4, 'y', 4),
(53, 'Commodore', 'COM', 'v-a1', 4, 'y', 5),
(54, 'Brigadier General', 'BGEN', 'g-a1', 4, 'y', 6),
(55, 'Commodore', 'COM', 'c-a1', 4, 'y', 7),
(56, 'Commodore', 'COM', 'b-a1', 4, 'y', 8),
(57, 'Commodore', 'COM', 'd-a1', 4, 'y', 9),
(58, 'Commodore', 'COM', 'o-a1', 4, 'y', 10),
(59, 'Commodore', 'COM', 'p-a1', 4, 'y', 11),
(60, 'Commodore', 'COM', 'w-a1', 4, 'y', 12),
(61, 'Captain', 'CAPT', 'r-o6', 5, 'y', 1),
(62, 'Captain', 'CAPT', 'y-o6', 5, 'y', 2),
(63, 'Captain', 'CAPT', 't-o6', 5, 'y', 3),
(64, 'Captain', 'CAPT', 's-o6', 5, 'y', 4),
(65, 'Captain', 'CAPT', 'v-o6', 5, 'y', 5),
(66, 'Colonel', 'COL', 'g-o6', 5, 'y', 6),
(67, 'Captain', 'CAPT', 'c-o6', 5, 'y', 7),
(68, 'Captain', 'CAPT', 'b-o6', 5, 'y', 8),
(69, 'Captain', 'CAPT', 'd-o6', 5, 'y', 9),
(70, 'Captain', 'CAPT', 'o-o6', 5, 'y', 10),
(71, 'Captain', 'CAPT', 'p-o6', 5, 'y', 11),
(72, 'Captain', 'CAPT', 'w-o6', 5, 'y', 12),
(73, 'Commander', 'CMDR', 'r-o5', 6, 'y', 1),
(74, 'Commander', 'CMDR', 'y-o5', 6, 'y', 2),
(75, 'Commander', 'CMDR', 't-o5', 6, 'y', 3),
(76, 'Commander', 'CMDR', 's-o5', 6, 'y', 4),
(77, 'Commander', 'CMDR', 'v-o5', 6, 'y', 5),
(78, 'Lieutenant Colonel', 'LTCOL', 'g-o5', 6, 'y', 6),
(79, 'Commander', 'CMDR', 'c-o5', 6, 'y', 7),
(80, 'Commander', 'CMDR', 'b-o5', 6, 'y', 8),
(81, 'Commander', 'CMDR', 'd-o5', 6, 'y', 9),
(82, 'Commander', 'CMDR', 'o-o5', 6, 'y', 10),
(83, 'Commander', 'CMDR', 'p-o5', 6, 'y', 11),
(84, 'Commander', 'CMDR', 'w-o5', 6, 'y', 12),
(85, 'Lieutenant Commander', 'LTCMDR', 'r-o4', 7, 'y', 1),
(86, 'Lieutenant Commander', 'LTCMDR', 'y-o4', 7, 'y', 2),
(87, 'Lieutenant Commander', 'LTCMDR', 't-o4', 7, 'y', 3),
(88, 'Lieutenant Commander', 'LTCMDR', 's-o4', 7, 'y', 4),
(89, 'Lieutenant Commander', 'LTCMDR', 'v-o4', 7, 'y', 5),
(90, 'Major', 'MAJ', 'g-o4', 7, 'y', 6),
(91, 'Lieutenant Commander', 'LTCMDR', 'c-o4', 7, 'y', 7),
(92, 'Lieutenant Commander', 'LTCMDR', 'b-o4', 7, 'y', 8),
(93, 'Lieutenant Commander', 'LTCMDR', 'd-o4', 7, 'y', 9),
(94, 'Lieutenant Commander', 'LTCMDR', 'o-o4', 7, 'y', 10),
(95, 'Lieutenant Commander', 'LTCMDR', 'p-o4', 7, 'y', 11),
(96, 'Lieutenant Commander', 'LTCMDR', 'w-o4', 7, 'y', 12),
(97, 'Lieutenant', 'LT', 'r-o3', 8, 'y', 1),
(98, 'Lieutenant', 'LT', 'y-o3', 8, 'y', 2),
(99, 'Lieutenant', 'LT', 't-o3', 8, 'y', 3),
(100, 'Lieutenant', 'LT', 's-o3', 8, 'y', 4),
(101, 'Lieutenant', 'LT', 'v-o3', 8, 'y', 5),
(102, 'Captain', 'CAPT', 'g-o3', 8, 'y', 6),
(103, 'Lieutenant', 'LT', 'c-o3', 8, 'y', 7),
(104, 'Lieutenant', 'LT', 'b-o3', 8, 'y', 8),
(105, 'Lieutenant', 'LT', 'd-o3', 8, 'y', 9),
(106, 'Lieutenant', 'LT', 'o-o3', 8, 'y', 10),
(107, 'Lieutenant', 'LT', 'p-o3', 8, 'y', 11),
(108, 'Lieutenant', 'LT', 'w-o3', 8, 'y', 12),
(109, 'Lieutenant JG', 'LT(JG)', 'r-o2', 9, 'y', 1),
(110, 'Lieutenant JG', 'LT(JG)', 'y-o2', 9, 'y', 2),
(111, 'Lieutenant JG', 'LT(JG)', 't-o2', 9, 'y', 3),
(112, 'Lieutenant JG', 'LT(JG)', 's-o2', 9, 'y', 4),
(113, 'Lieutenant JG', 'LT(JG)', 'v-o2', 9, 'y', 5),
(114, '1st Lieutenant', '1LT', 'g-o2', 9, 'y', 6),
(115, 'Lieutenant JG', 'LT(JG)', 'c-o2', 9, 'y', 7),
(116, 'Lieutenant JG', 'LT(JG)', 'b-o2', 9, 'y', 8),
(117, 'Lieutenant JG', 'LT(JG)', 'd-o2', 9, 'y', 9),
(118, 'Lieutenant JG', 'LT(JG)', 'o-o2', 9, 'y', 10),
(119, 'Lieutenant JG', 'LT(JG)', 'p-o2', 9, 'y', 11),
(120, 'Lieutenant JG', 'LT(JG)', 'w-o2', 9, 'y', 12),
(121, 'Ensign', 'ENS', 'r-o1', 10, 'y', 1),
(122, 'Ensign', 'ENS', 'y-o1', 10, 'y', 2),
(123, 'Ensign', 'ENS', 't-o1', 10, 'y', 3),
(124, 'Ensign', 'ENS', 's-o1', 10, 'y', 4),
(125, 'Ensign', 'ENS', 'v-o1', 10, 'y', 5),
(126, '2nd Lieutenant', '2LT', 'g-o1', 10, 'y', 6),
(127, 'Ensign', 'ENS', 'c-o1', 10, 'y', 7),
(128, 'Ensign', 'ENS', 'b-o1', 10, 'y', 8),
(129, 'Ensign', 'ENS', 'd-o1', 10, 'y', 9),
(130, 'Ensign', 'ENS', 'o-o1', 10, 'y', 10),
(131, 'Ensign', 'ENS', 'p-o1', 10, 'y', 11),
(132, 'Ensign', 'ENS', 'w-o1', 10, 'y', 12),
(133, 'Chief Warrant Officer', 'CWO', 'r-w4', 11, 'y', 1),
(134, 'Chief Warrant Officer', 'CWO', 'y-w4', 11, 'y', 2),
(135, 'Chief Warrant Officer', 'CWO', 't-w4', 11, 'y', 3),
(136, 'Chief Warrant Officer', 'CWO', 's-w4', 11, 'y', 4),
(137, 'Chief Warrant Officer', 'CWO', 'v-w4', 11, 'y', 5),
(138, 'Chief Warrant Officer', 'CWO', 'g-w4', 11, 'y', 6),
(139, 'Chief Warrant Officer', 'CWO', 'c-w4', 11, 'y', 7),
(140, 'Chief Warrant Officer', 'CWO', 'b-w4', 11, 'y', 8),
(141, 'Chief Warrant Officer', 'CWO', 'd-w4', 11, 'y', 9),
(142, 'Chief Warrant Officer', 'CWO', 'o-w4', 11, 'y', 10),
(143, 'Chief Warrant Officer', 'CWO', 'p-w4', 11, 'y', 11),
(144, 'Chief Warrant Officer', 'CWO', 'w-w4', 11, 'y', 12),
(145, 'Master Warrant Officer', 'MWO', 'r-w3', 12, 'y', 1),
(146, 'Master Warrant Officer', 'MWO', 'y-w3', 12, 'y', 2),
(147, 'Master Warrant Officer', 'MWO', 't-w3', 12, 'y', 3),
(148, 'Master Warrant Officer', 'MWO', 's-w3', 12, 'y', 4),
(149, 'Master Warrant Officer', 'MWO', 'v-w3', 12, 'y', 5),
(150, 'Master Warrant Officer', 'MWO', 'g-w3', 12, 'y', 6),
(151, 'Master Warrant Officer', 'MWO', 'c-w3', 12, 'y', 7),
(152, 'Master Warrant Officer', 'MWO', 'b-w3', 12, 'y', 8),
(153, 'Master Warrant Officer', 'MWO', 'd-w3', 12, 'y', 9),
(154, 'Master Warrant Officer', 'MWO', 'o-w3', 12, 'y', 10),
(155, 'Master Warrant Officer', 'MWO', 'p-w3', 12, 'y', 11),
(156, 'Master Warrant Officer', 'MWO', 'w-w3', 12, 'y', 12),
(157, 'Staff Warrant Officer', 'SWO', 'r-w2', 13, 'y', 1),
(158, 'Staff Warrant Officer', 'SWO', 'y-w2', 13, 'y', 2),
(159, 'Staff Warrant Officer', 'SWO', 't-w2', 13, 'y', 3),
(160, 'Staff Warrant Officer', 'SWO', 's-w2', 13, 'y', 4),
(161, 'Staff Warrant Officer', 'SWO', 'v-w2', 13, 'y', 5),
(162, 'Staff Warrant Officer', 'SWO', 'g-w2', 13, 'y', 6),
(163, 'Staff Warrant Officer', 'SWO', 'c-w2', 13, 'y', 7),
(164, 'Staff Warrant Officer', 'SWO', 'b-w2', 13, 'y', 8),
(165, 'Staff Warrant Officer', 'SWO', 'd-w2', 13, 'y', 9),
(166, 'Staff Warrant Officer', 'SWO', 'o-w2', 13, 'y', 10),
(167, 'Staff Warrant Officer', 'SWO', 'p-w2', 13, 'y', 11),
(168, 'Staff Warrant Officer', 'SWO', 'w-w2', 13, 'y', 12),
(169, 'Warrant Officer', 'WO', 'r-w1', 14, 'y', 1),
(170, 'Warrant Officer', 'WO', 'y-w1', 14, 'y', 2),
(171, 'Warrant Officer', 'WO', 't-w1', 14, 'y', 3),
(172, 'Warrant Officer', 'WO', 's-w1', 14, 'y', 4),
(173, 'Warrant Officer', 'WO', 'v-w1', 14, 'y', 5),
(174, 'Warrant Officer', 'WO', 'g-w1', 14, 'y', 6),
(175, 'Warrant Officer', 'WO', 'c-w1', 14, 'y', 7),
(176, 'Warrant Officer', 'WO', 'b-w1', 14, 'y', 8),
(177, 'Warrant Officer', 'WO', 'd-w1', 14, 'y', 9),
(178, 'Warrant Officer', 'WO', 'o-w1', 14, 'y', 10),
(179, 'Warrant Officer', 'WO', 'p-w1', 14, 'y', 11),
(180, 'Warrant Officer', 'WO', 'w-w1', 14, 'y', 12),
(181, 'Master Chief Petty Officer', 'MCPO', 'r-e9', 15, 'y', 1),
(182, 'Master Chief Petty Officer', 'MCPO', 'y-e9', 15, 'y', 2),
(183, 'Master Chief Petty Officer', 'MCPO', 't-e9', 15, 'y', 3),
(184, 'Master Chief Petty Officer', 'MCPO', 's-e9', 15, 'y', 4),
(185, 'Master Chief Petty Officer', 'MCPO', 'v-e9', 15, 'y', 5),
(186, 'Sergeant Major', 'SGTMAJ', 'g-e9', 15, 'y', 6),
(187, 'Master Chief Petty Officer', 'MCPO', 'c-e9', 15, 'y', 7),
(188, 'Master Chief Petty Officer', 'MCPO', 'b-e9', 15, 'y', 8),
(189, 'Master Chief Petty Officer', 'MCPO', 'd-e9', 15, 'y', 9),
(190, 'Master Chief Petty Officer', 'MCPO', 'o-e9', 15, 'y', 10),
(191, 'Master Chief Petty Officer', 'MCPO', 'p-e9', 15, 'y', 11),
(192, 'Master Chief Petty Officer', 'MCPO', 'w-e9', 15, 'y', 12),
(193, 'Senior Chief Petty Officer', 'SCPO', 'r-e8', 16, 'y', 1),
(194, 'Senior Chief Petty Officer', 'SCPO', 'y-e8', 16, 'y', 2),
(195, 'Senior Chief Petty Officer', 'SCPO', 't-e8', 16, 'y', 3),
(196, 'Senior Chief Petty Officer', 'SCPO', 's-e8', 16, 'y', 4),
(197, 'Senior Chief Petty Officer', 'SCPO', 'v-e8', 16, 'y', 5),
(198, 'Master Sergeant', 'MSGT', 'g-e8', 16, 'y', 6),
(199, 'Senior Chief Petty Officer', 'SCPO', 'c-e8', 16, 'y', 7),
(200, 'Senior Chief Petty Officer', 'SCPO', 'b-e8', 16, 'y', 8),
(201, 'Senior Chief Petty Officer', 'SCPO', 'd-e8', 16, 'y', 9),
(202, 'Senior Chief Petty Officer', 'SCPO', 'o-e8', 16, 'y', 10),
(203, 'Senior Chief Petty Officer', 'SCPO', 'p-e8', 16, 'y', 11),
(204, 'Senior Chief Petty Officer', 'SCPO', 'w-e8', 16, 'y', 12),
(205, 'Chief Petty Officer', 'CPO', 'r-e7', 17, 'y', 1),
(206, 'Chief Petty Officer', 'CPO', 'y-e7', 17, 'y', 2),
(207, 'Chief Petty Officer', 'CPO', 't-e7', 17, 'y', 3),
(208, 'Chief Petty Officer', 'CPO', 's-e7', 17, 'y', 4),
(209, 'Chief Petty Officer', 'CPO', 'v-e7', 17, 'y', 5),
(210, 'Gunnery Sergeant', 'GYSGT', 'g-e7', 17, 'y', 6),
(211, 'Chief Petty Officer', 'CPO', 'c-e7', 17, 'y', 7),
(212, 'Chief Petty Officer', 'CPO', 'b-e7', 17, 'y', 8),
(213, 'Chief Petty Officer', 'CPO', 'd-e7', 17, 'y', 9),
(214, 'Chief Petty Officer', 'CPO', 'o-e7', 17, 'y', 10),
(215, 'Chief Petty Officer', 'CPO', 'p-e7', 17, 'y', 11),
(216, 'Chief Petty Officer', 'CPO', 'w-e7', 17, 'y', 12),
(217, 'Petty Officer 1st Class', 'PO1', 'r-e6', 18, 'y', 1),
(218, 'Petty Officer 1st Class', 'PO1', 'y-e6', 18, 'y', 2),
(219, 'Petty Officer 1st Class', 'PO1', 't-e6', 18, 'y', 3),
(220, 'Petty Officer 1st Class', 'PO1', 's-e6', 18, 'y', 4),
(221, 'Petty Officer 1st Class', 'PO1', 'v-e6', 18, 'y', 5),
(222, 'Staff Sergeant', 'SSGT', 'g-e6', 18, 'y', 6),
(223, 'Petty Officer 1st Class', 'PO1', 'c-e6', 18, 'y', 7),
(224, 'Petty Officer 1st Class', 'PO1', 'b-e6', 18, 'y', 8),
(225, 'Petty Officer 1st Class', 'PO1', 'd-e6', 18, 'y', 9),
(226, 'Petty Officer 1st Class', 'PO1', 'o-e6', 18, 'y', 10),
(227, 'Petty Officer 1st Class', 'PO1', 'p-e6', 18, 'y', 11),
(228, 'Petty Officer 1st Class', 'PO1', 'w-e6', 18, 'y', 12),
(229, 'Petty Officer 2nd Class', 'PO2', 'r-e5', 19, 'y', 1),
(230, 'Petty Officer 2nd Class', 'PO2', 'y-e5', 19, 'y', 2),
(231, 'Petty Officer 2nd Class', 'PO2', 't-e5', 19, 'y', 3),
(232, 'Petty Officer 2nd Class', 'PO2', 's-e5', 19, 'y', 4),
(233, 'Petty Officer 2nd Class', 'PO2', 'v-e5', 19, 'y', 5),
(234, 'Sergeant', 'SGT', 'g-e5', 19, 'y', 6),
(235, 'Petty Officer 2nd Class', 'PO2', 'c-e5', 19, 'y', 7),
(236, 'Petty Officer 2nd Class', 'PO2', 'b-e5', 19, 'y', 8),
(237, 'Petty Officer 2nd Class', 'PO2', 'd-e5', 19, 'y', 9),
(238, 'Petty Officer 2nd Class', 'PO2', 'o-e5', 19, 'y', 10),
(239, 'Petty Officer 2nd Class', 'PO2', 'p-e5', 19, 'y', 11),
(240, 'Petty Officer 2nd Class', 'PO2', 'w-e5', 19, 'y', 12),
(241, 'Petty Officer 3rd Class', 'PO3', 'r-e4', 20, 'y', 1),
(242, 'Petty Officer 3rd Class', 'PO3', 'y-e4', 20, 'y', 2),
(243, 'Petty Officer 3rd Class', 'PO3', 't-e4', 20, 'y', 3),
(244, 'Petty Officer 3rd Class', 'PO3', 's-e4', 20, 'y', 4),
(245, 'Petty Officer 3rd Class', 'PO3', 'v-e4', 20, 'y', 5),
(246, 'Corporal', 'CPL', 'g-e4', 20, 'y', 6),
(247, 'Petty Officer 3rd Class', 'PO3', 'c-e4', 20, 'y', 7),
(248, 'Petty Officer 3rd Class', 'PO3', 'b-e4', 20, 'y', 8),
(249, 'Petty Officer 3rd Class', 'PO3', 'd-e4', 20, 'y', 9),
(250, 'Petty Officer 3rd Class', 'PO3', 'o-e4', 20, 'y', 10),
(251, 'Petty Officer 3rd Class', 'PO3', 'p-e4', 20, 'y', 11),
(252, 'Petty Officer 3rd Class', 'PO3', 'w-e4', 20, 'y', 12),
(253, 'Crewman', 'CN', 'r-e3', 21, 'y', 1),
(254, 'Crewman', 'CN', 'y-e3', 21, 'y', 2),
(255, 'Crewman', 'CN', 't-e3', 21, 'y', 3),
(256, 'Crewman', 'CN', 's-e3', 21, 'y', 4),
(257, 'Crewman', 'CN', 'v-e3', 21, 'y', 5),
(258, 'Lance Corporal', 'LCPL', 'g-e3', 21, 'y', 6),
(259, 'Crewman', 'CN', 'c-e3', 21, 'y', 7),
(260, 'Crewman', 'CN', 'b-e3', 21, 'y', 8),
(261, 'Crewman', 'CN', 'd-e3', 21, 'y', 9),
(262, 'Crewman', 'CN', 'o-e3', 21, 'y', 10),
(263, 'Crewman', 'CN', 'p-e3', 21, 'y', 11),
(264, 'Crewman', 'CN', 'w-e3', 21, 'y', 12),
(265, 'Crewman Apprentice', 'CA', 'r-e2', 22, 'y', 1),
(266, 'Crewman Apprentice', 'CA', 'y-e2', 22, 'y', 2),
(267, 'Crewman Apprentice', 'CA', 't-e2', 22, 'y', 3),
(268, 'Crewman Apprentice', 'CA', 's-e2', 22, 'y', 4),
(269, 'Crewman Apprentice', 'CA', 'v-e2', 22, 'y', 5),
(270, 'Private 1st Class', 'PFC', 'g-e2', 22, 'y', 6),
(271, 'Crewman Apprentice', 'CA', 'c-e2', 22, 'y', 7),
(272, 'Crewman Apprentice', 'CA', 'b-e2', 22, 'y', 8),
(273, 'Crewman Apprentice', 'CA', 'd-e2', 22, 'y', 9),
(274, 'Crewman Apprentice', 'CA', 'o-e2', 22, 'y', 10),
(275, 'Crewman Apprentice', 'CA', 'p-e2', 22, 'y', 11),
(276, 'Crewman Apprentice', 'CA', 'w-e2', 22, 'y', 12),
(277, 'Crewman Recruit', 'CR', 'r-e1', 23, 'y', 1),
(278, 'Crewman Recruit', 'CR', 'y-e1', 23, 'y', 2),
(279, 'Crewman Recruit', 'CR', 't-e1', 23, 'y', 3),
(280, 'Crewman Recruit', 'CR', 's-e1', 23, 'y', 4),
(281, 'Crewman Recruit', 'CR', 'v-e1', 23, 'y', 5),
(282, 'Private', 'PVT', 'g-e1', 23, 'y', 6),
(283, 'Crewman Recruit', 'CR', 'c-e1', 23, 'y', 7),
(284, 'Crewman Recruit', 'CR', 'b-e1', 23, 'y', 8),
(285, 'Crewman Recruit', 'CR', 'd-e1', 23, 'y', 9),
(286, 'Crewman Recruit', 'CR', 'o-e1', 23, 'y', 10),
(287, 'Crewman Recruit', 'CR', 'p-e1', 23, 'y', 11),
(288, 'Crewman Recruit', 'CR', 'w-e1', 23, 'y', 12),
(289, 'Cadet Senior Grade', 'CDT(SR)', 'r-c4', 24, 'n', 1),
(290, 'Cadet Senior Grade', 'CDT(SR)', 'y-c4', 24, 'n', 2),
(291, 'Cadet Senior Grade', 'CDT(SR)', 't-c4', 24, 'n', 3),
(292, 'Cadet Senior Grade', 'CDT(SR)', 's-c4', 24, 'n', 4),
(293, 'Cadet Senior Grade', 'CDT(SR)', 'v-c4', 24, 'n', 5),
(294, 'Cadet Senior Grade', 'CDT(SR)', 'g-c4', 24, 'n', 6),
(295, 'Cadet Senior Grade', 'CDT(SR)', 'c-c4', 24, 'n', 7),
(296, 'Cadet Senior Grade', 'CDT(SR)', 'b-c4', 24, 'n', 8),
(297, 'Cadet Senior Grade', 'CDT(SR)', 'd-c4', 24, 'n', 9),
(298, 'Cadet Senior Grade', 'CDT(SR)', 'o-c4', 24, 'n', 10),
(299, 'Cadet Senior Grade', 'CDT(SR)', 'p-c4', 24, 'n', 11),
(300, 'Cadet Senior Grade', 'CDT(SR)', 'w-c4', 24, 'n', 12),
(301, 'Cadet Junior Grade', 'CDT(JR)', 'r-c3', 25, 'n', 1),
(302, 'Cadet Junior Grade', 'CDT(JR)', 'y-c3', 25, 'n', 2),
(303, 'Cadet Junior Grade', 'CDT(JR)', 't-c3', 25, 'n', 3),
(304, 'Cadet Junior Grade', 'CDT(JR)', 's-c3', 25, 'n', 4),
(305, 'Cadet Junior Grade', 'CDT(JR)', 'v-c3', 25, 'n', 5),
(306, 'Cadet Junior Grade', 'CDT(JR)', 'g-c3', 25, 'n', 6),
(307, 'Cadet Junior Grade', 'CDT(JR)', 'c-c3', 25, 'n', 7),
(308, 'Cadet Junior Grade', 'CDT(JR)', 'b-c3', 25, 'n', 8),
(309, 'Cadet Junior Grade', 'CDT(JR)', 'd-c3', 25, 'n', 9),
(310, 'Cadet Junior Grade', 'CDT(JR)', 'o-c3', 25, 'n', 10),
(311, 'Cadet Junior Grade', 'CDT(JR)', 'p-c3', 25, 'n', 11),
(312, 'Cadet Junior Grade', 'CDT(JR)', 'w-c3', 25, 'n', 12),
(313, 'Cadet Sophomore Grade', 'CDT(SO)', 'r-c2', 26, 'n', 1),
(314, 'Cadet Sophomore Grade', 'CDT(SO)', 'y-c2', 26, 'n', 2),
(315, 'Cadet Sophomore Grade', 'CDT(SO)', 't-c2', 26, 'n', 3),
(316, 'Cadet Sophomore Grade', 'CDT(SO)', 's-c2', 26, 'n', 4),
(317, 'Cadet Sophomore Grade', 'CDT(SO)', 'v-c2', 26, 'n', 5),
(318, 'Cadet Sophomore Grade', 'CDT(SO)', 'g-c2', 26, 'n', 6),
(319, 'Cadet Sophomore Grade', 'CDT(SO)', 'c-c2', 26, 'n', 7),
(320, 'Cadet Sophomore Grade', 'CDT(SO)', 'b-c2', 26, 'n', 8),
(321, 'Cadet Sophomore Grade', 'CDT(SO)', 'd-c2', 26, 'n', 9),
(322, 'Cadet Sophomore Grade', 'CDT(SO)', 'o-c2', 26, 'n', 10),
(323, 'Cadet Sophomore Grade', 'CDT(SO)', 'p-c2', 26, 'n', 11),
(324, 'Cadet Sophomore Grade', 'CDT(SO)', 'w-c2', 26, 'n', 12),
(325, 'Cadet Freshman Grade', 'CDT(FR)', 'r-c1', 27, 'n', 1),
(326, 'Cadet Freshman Grade', 'CDT(FR)', 'y-c1', 27, 'n', 2),
(327, 'Cadet Freshman Grade', 'CDT(FR)', 't-c1', 27, 'n', 3),
(328, 'Cadet Freshman Grade', 'CDT(FR)', 's-c1', 27, 'n', 4),
(329, 'Cadet Freshman Grade', 'CDT(FR)', 'v-c1', 27, 'n', 5),
(330, 'Cadet Freshman Grade', 'CDT(FR)', 'g-c1', 27, 'n', 6),
(331, 'Cadet Freshman Grade', 'CDT(FR)', 'c-c1', 27, 'n', 7),
(332, 'Cadet Freshman Grade', 'CDT(FR)', 'b-c1', 27, 'n', 8),
(333, 'Cadet Freshman Grade', 'CDT(FR)', 'd-c1', 27, 'n', 9),
(334, 'Cadet Freshman Grade', 'CDT(FR)', 'o-c1', 27, 'n', 10),
(335, 'Cadet Freshman Grade', 'CDT(FR)', 'p-c1', 27, 'n', 11),
(336, 'Cadet Freshman Grade', 'CDT(FR)', 'w-c1', 27, 'n', 12),
(337, 'Enlisted Cadet', 'CDT(EN)', 'r-c0', 28, 'n', 1),
(338, 'Enlisted Cadet', 'CDT(EN)', 'y-c0', 28, 'n', 2),
(339, 'Enlisted Cadet', 'CDT(EN)', 't-c0', 28, 'n', 3),
(340, 'Enlisted Cadet', 'CDT(EN)', 's-c0', 28, 'n', 4),
(341, 'Enlisted Cadet', 'CDT(EN)', 'v-c0', 28, 'n', 5),
(342, 'Enlisted Cadet', 'CDT(EN)', 'g-c0', 28, 'n', 6),
(343, 'Enlisted Cadet', 'CDT(EN)', 'c-c0', 28, 'n', 7),
(344, 'Enlisted Cadet', 'CDT(EN)', 'b-c0', 28, 'n', 8),
(345, 'Enlisted Cadet', 'CDT(EN)', 'd-c0', 28, 'n', 9),
(346, 'Enlisted Cadet', 'CDT(EN)', 'o-c0', 28, 'n', 10),
(347, 'Enlisted Cadet', 'CDT(EN)', 'p-c0', 28, 'n', 11),
(348, 'Enlisted Cadet', 'CDT(EN)', 'w-c0', 28, 'n', 12),
(349, '', '', 'r-blank', 29, 'y', 1),
(350, '', '', 'y-blank', 29, 'y', 2),
(351, '', '', 't-blank', 29, 'y', 3),
(352, '', '', 's-blank', 29, 'y', 4),
(353, '', '', 'v-blank', 29, 'y', 5),
(354, '', '', 'g-blank', 29, 'y', 6),
(355, '', '', 'c-blank', 29, 'y', 7),
(356, '', '', 'b-blank', 29, 'y', 8),
(357, '', '', 'd-blank', 29, 'y', 9),
(358, '', '', 'o-blank', 29, 'y', 10),
(359, '', '', 'p-blank', 29, 'y', 11),
(360, '', '', 'w-blank', 29, 'y', 12),
(361, '', '', 'blank', 0, 'y', 13),
(362, 'Fleet Admiral (retired)', 'Ret. FADM', 'r-a5', 1, 'y', 1),
(363, 'Admiral (EnRiov)', 'ER', '../romulan-navy/O-9', 1, 'y', 14),
(364, 'Commander (Riov)', 'R', '../romulan-navy/O-6', 1, 'y', 14),
(365, 'Sub-Commander (erie''Riov)', 'eR', '../romulan-navy/O-5', 2, 'y', 14),
(366, 'Centurion (EnArrian)', 'EA', '../romulan-navy/O-4', 3, 'y', 14),
(367, 'Lieutenant (Arrian)', 'A', '../romulan-navy/O-3', 4, 'y', 14),
(368, 'Sub-Lieutenant (erie''Arrian)', 'eA', '../romulan-navy/O-2', 5, 'y', 14),
(369, 'Uhlan', 'U', '../romulan-navy/O-1', 6, 'y', 14),
(370, 'Admiral (EnRiov)', 'ER', '../romulan-tal-diann/O-9', 0, 'y', 15),
(371, 'Commander (Riov)', 'R', '../romulan-tal-diann/O-6', 1, 'y', 15),
(372, 'Sub-Commander (erie''Riov)', 'eR', '../romulan-tal-diann/O-5', 2, 'y', 15),
(373, 'Centurion (EnArrian)', 'EA', '../romulan-tal-diann/O-4', 3, 'y', 15),
(374, 'Lieutenant (Arrian)', 'A', '../romulan-tal-diann/O-3', 4, 'y', 15),
(375, 'Sub-Lieutenant (erie''Arrian)', 'eA', '../romulan-tal-diann/O-2', 5, 'y', 15),
(376, 'Ulhan', 'U', '../romulan-tal-diann/O-1', 6, 'y', 15),
(377, 'General (Krein)', 'K', '../romulan-tal-shiar/O-9', 0, 'y', 16),
(378, 'Colonel (Ssiebb)', 'S', '../romulan-tal-shiar/O-6', 1, 'y', 16),
(379, 'Major (Aendeh)', 'A', '../romulan-tal-shiar/O-5', 2, 'y', 16),
(380, 'Captain (EnEredh)', 'EE', '../romulan-tal-shiar/O-4', 3, 'y', 16),
(381, 'Lieutenant (Eredh)', 'E', '../romulan-tal-shiar/O-3', 4, 'y', 16),
(382, 'Sub-Lieutenant (erie''Eredh)', 'eE', '../romulan-tal-shiar/O-2', 5, 'y', 16),
(383, 'Uhlan', 'U', '../romulan-tal-shiar/O-1', 6, 'y', 16),
(384, 'Senator', 'SEN', '../romulan/blank', 0, 'y', 17),
(385, 'Governor', 'GOV', '../romulan/blank', 10, 'y', 17),
(386, 'Ambassador', 'AMB', '../romulan/blank', 20, 'y', 17),
(387, 'Envoy', 'ENV', '../romulan/blank', 21, 'y', 17),
(388, 'Senator''s Aide', 'SEN-A', '../romulan/blank', 5, 'y', 17);

-- --------------------------------------------------------

--
-- Table structure for table `nova_security_questions`
--

CREATE TABLE IF NOT EXISTS `nova_security_questions` (
  `question_id` int(5) NOT NULL AUTO_INCREMENT,
  `question_value` text NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `nova_security_questions`
--

INSERT INTO `nova_security_questions` (`question_id`, `question_value`) VALUES
(1, 'What is your father''s middle name?'),
(2, 'What was the name of your first pet?'),
(3, 'What city were you born in?'),
(4, 'What is your favorite animal?'),
(5, 'Who was your favorite teacher?'),
(6, 'What is the last book you read?');

-- --------------------------------------------------------

--
-- Table structure for table `nova_sessions`
--

CREATE TABLE IF NOT EXISTS `nova_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL DEFAULT '',
  `last_activity` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nova_sessions`
--

INSERT INTO `nova_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('1f4c38f7a5cf6a9e3942effe931100b6', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko) Version/6.0.3 Safari/536.28.10', 1370676300, 'a:14:{s:9:"user_data";s:0:"";s:6:"userid";s:1:"1";s:9:"skin_main";s:6:"faltan";s:10:"skin_admin";s:7:"default";s:9:"skin_wiki";s:6:"faltan";s:12:"display_rank";s:7:"default";s:8:"language";s:7:"english";s:8:"timezone";s:3:"UM8";s:3:"dst";s:1:"0";s:9:"main_char";s:1:"1";s:10:"characters";a:2:{i:0;s:1:"1";i:1;s:1:"2";}s:4:"role";s:1:"1";s:6:"access";a:54:{s:11:"admin/index";i:0;s:12:"upload/index";i:0;s:13:"upload/manage";i:0;s:14:"messages/index";i:0;s:11:"write/index";i:0;s:17:"write/missionpost";i:0;s:17:"write/personallog";i:0;s:14:"write/newsitem";i:0;s:13:"site/settings";i:0;s:13:"site/messages";i:0;s:10:"site/roles";i:0;s:12:"site/bioform";i:0;s:14:"site/specsform";i:0;s:13:"site/tourform";i:0;s:16:"site/dockingform";i:0;s:10:"site/menus";i:0;s:19:"site/catalogueranks";i:0;s:19:"site/catalogueskins";i:0;s:13:"site/simtypes";i:0;s:12:"manage/specs";i:0;s:12:"manage/decks";i:0;s:15:"manage/comments";i:0;s:16:"manage/positions";i:0;s:12:"manage/depts";i:0;s:12:"manage/ranks";i:0;s:13:"manage/awards";i:0;s:11:"manage/tour";i:0;s:13:"manage/docked";i:0;s:15:"manage/missions";i:0;s:12:"manage/posts";s:1:"2";s:11:"manage/logs";s:1:"2";s:11:"manage/news";s:1:"2";s:15:"manage/newscats";i:0;s:10:"report/loa";i:0;s:15:"report/versions";i:0;s:15:"report/activity";i:0;s:14:"report/posting";i:0;s:17:"report/moderation";i:0;s:17:"report/milestones";i:0;s:23:"report/awardnominations";i:0;s:19:"report/applications";i:0;s:12:"report/stats";i:0;s:16:"characters/index";i:0;s:15:"characters/npcs";s:1:"3";s:14:"characters/coc";i:0;s:14:"characters/bio";s:1:"3";s:17:"characters/create";s:1:"2";s:17:"characters/awards";i:0;s:12:"user/account";s:1:"2";s:13:"user/nominate";s:1:"2";s:9:"wiki/page";s:1:"3";s:15:"wiki/categories";i:0;s:9:"site/bans";i:0;s:14:"site/manifests";i:0;}s:8:"my_links";a:1:{i:0;s:76:"<a href="http://localhost/bfio/faltan/index.php/user/status">Request LOA</a>";}}');

-- --------------------------------------------------------

--
-- Table structure for table `nova_settings`
--

CREATE TABLE IF NOT EXISTS `nova_settings` (
  `setting_id` int(5) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) NOT NULL DEFAULT '',
  `setting_value` text NOT NULL,
  `setting_label` varchar(255) NOT NULL DEFAULT '',
  `setting_user_created` enum('y','n') NOT NULL DEFAULT 'y',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `nova_settings`
--

INSERT INTO `nova_settings` (`setting_id`, `setting_key`, `setting_value`, `setting_label`, `setting_user_created`) VALUES
(1, 'sim_name', 'Faltan Station', '', 'n'),
(2, 'sim_year', '2387', '', 'n'),
(3, 'sim_type', '3', '', 'n'),
(4, 'maintenance', 'off', '', 'n'),
(5, 'skin_main', 'faltan', '', 'n'),
(6, 'skin_admin', 'default', '', 'n'),
(7, 'skin_wiki', 'faltan', '', 'n'),
(8, 'skin_login', 'faltan', '', 'n'),
(9, 'display_rank', 'default', '', 'n'),
(10, 'bio_num_awards', '10', '', 'n'),
(11, 'allowed_chars_playing', '40', '', 'n'),
(12, 'allowed_chars_npc', '200', '', 'n'),
(13, 'system_email', 'on', '', 'n'),
(14, 'email_subject', '[Faltan]', '', 'n'),
(15, 'timezone', 'UTC', '', 'n'),
(16, 'daylight_savings', 'false', '', 'n'),
(17, 'date_format', '%D %M %j%S, %Y @ %g:%i%a', '', 'n'),
(18, 'list_logs_num', '25', '', 'n'),
(19, 'list_posts_num', '25', '', 'n'),
(20, 'manifest_defaults', '$(''tr.active'').show();,$(''tr.npc'').show();', '', 'n'),
(21, 'updates', 'all', '', 'n'),
(22, 'show_news', 'y', '', 'n'),
(23, 'show_logs', 'y', '', 'n'),
(24, 'show_posts', 'y', '', 'n'),
(25, 'post_count_format', 'multiple', '', 'n'),
(26, 'use_sample_post', 'y', '', 'n'),
(27, 'default_email_name', '', '', 'n'),
(28, 'default_email_address', '', '', 'n'),
(29, 'use_mission_notes', 'y', '', 'n'),
(30, 'online_timespan', '5', '', 'n'),
(31, 'posting_requirement', '14', '', 'n'),
(32, 'use_post_participants', 'y', '', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `nova_sim_type`
--

CREATE TABLE IF NOT EXISTS `nova_sim_type` (
  `simtype_id` int(5) NOT NULL AUTO_INCREMENT,
  `simtype_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`simtype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `nova_sim_type`
--

INSERT INTO `nova_sim_type` (`simtype_id`, `simtype_name`) VALUES
(1, 'all'),
(2, 'ship'),
(3, 'base'),
(4, 'colony'),
(5, 'unit'),
(6, 'realm'),
(7, 'planet'),
(8, 'organization');

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs`
--

CREATE TABLE IF NOT EXISTS `nova_specs` (
  `specs_id` int(5) NOT NULL AUTO_INCREMENT,
  `specs_name` varchar(255) NOT NULL DEFAULT '',
  `specs_order` int(4) NOT NULL,
  `specs_display` enum('y','n') NOT NULL DEFAULT 'y',
  `specs_images` text NOT NULL,
  `specs_summary` text NOT NULL,
  PRIMARY KEY (`specs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `nova_specs`
--

INSERT INTO `nova_specs` (`specs_id`, `specs_name`, `specs_order`, `specs_display`, `specs_images`, `specs_summary`) VALUES
(1, '[Facility] Faltan Command', 0, 'y', '', 'An administrative facility built in a mountain river valley on Faltan III roughly forty miles from the Faltan colony, Faltan Command was originally constructed in 2380 by Starfleet to oversee mining operations on the Faltan lunar colony and liaise with the Faltans. In 2387, it has found new purpose as a command, engineering and diplomatic hub of Starfleet operations in the southern Raeyan Sector and eastern Raeyan Transit Corridor.'),
(2, '[Facility] Faltan Engineering', 1, 'y', '', 'Over their thirteen year stay, the mining colony has developed a large footprint across Faltan III''s sole moon. In 2387, the mining collective agreed to cede a region already stripped of deuterium deposits to the Corps of Enginers. Refitting an old refining plant as a manufacturing facility and building docking facilities in several old mining craters, the facility is now capable of supporting servicing any regional asset, including capital ships.'),
(3, '[Attached] USS Osiris', 10, 'y', '', 'Multi-purpose frigate used by the Faltan Station Rapid Response Unit.'),
(4, '[Attached] USS Anubis', 11, 'y', '', 'Tactical escort used by the Faltan Station Rapid Response Unit.'),
(5, '[Attached] USS Isis', 12, 'y', '', 'Science surveyor used by the Faltan Station Rapid Response Unit.'),
(6, '[Patrol] USS Farragut', 50, 'y', '', 'Vessel patrolling the entrance to the Raeyan Transit Corridor, used at times by Ambassador-at-Tidwell.');

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_data`
--

CREATE TABLE IF NOT EXISTS `nova_specs_data` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_item` int(5) NOT NULL,
  `data_field` int(10) NOT NULL,
  `data_value` text NOT NULL,
  `data_updated` bigint(20) NOT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- Dumping data for table `nova_specs_data`
--

INSERT INTO `nova_specs_data` (`data_id`, `data_item`, `data_field`, `data_value`, `data_updated`) VALUES
(1, 1, 1, 'Planetary Base', 1370659592),
(2, 1, 2, 'Regional Operations Center', 1370659592),
(3, 1, 3, '', 1370659592),
(4, 1, 4, '', 1370659592),
(5, 1, 5, '', 1370659592),
(6, 1, 6, '', 1370659592),
(7, 1, 7, '', 1370659592),
(8, 1, 8, '', 1370659592),
(9, 1, 9, '', 1370659592),
(10, 1, 10, '', 1370659592),
(11, 1, 11, '', 1370659592),
(12, 1, 12, '', 1370659592),
(13, 1, 13, '', 1370659592),
(14, 1, 14, '', 1370659592),
(15, 1, 15, '', 1370659592),
(16, 1, 16, '', 1370659592),
(17, 1, 17, '', 1370659592),
(18, 1, 18, '', 1370659592),
(19, 1, 19, '', 1370659592),
(20, 1, 20, '', 1370659592),
(21, 1, 21, '', 1370659592),
(22, 1, 22, '', 1370659592),
(23, 1, 23, '', 1370659592),
(24, 1, 24, '', 1370659592),
(25, 2, 1, 'Corps of Engineering Facility', 1370659601),
(26, 2, 2, '', 1370659601),
(27, 2, 3, '', 1370659601),
(28, 2, 4, '', 1370659601),
(29, 2, 5, '', 1370659601),
(30, 2, 6, '', 1370659601),
(31, 2, 7, '', 1370659601),
(32, 2, 8, '', 1370659601),
(33, 2, 9, '', 1370659601),
(34, 2, 10, '', 1370659601),
(35, 2, 11, '', 1370659601),
(36, 2, 12, '', 1370659601),
(37, 2, 13, '', 1370659601),
(38, 2, 14, '', 1370659601),
(39, 2, 15, '', 1370659601),
(40, 2, 16, '', 1370659601),
(41, 2, 17, '', 1370659601),
(42, 2, 18, '', 1370659601),
(43, 2, 19, '', 1370659601),
(44, 2, 20, '', 1370659601),
(45, 2, 21, '', 1370659601),
(46, 2, 22, '', 1370659601),
(47, 2, 23, '', 1370659601),
(48, 2, 24, '', 1370659601),
(49, 3, 1, 'Diligent', 1370659613),
(50, 3, 2, 'Multi-Purpose Frigate', 1370659613),
(51, 3, 3, '80 years', 1370659613),
(52, 3, 4, '1 year', 1370659613),
(53, 3, 5, '4 years', 1370659613),
(54, 3, 6, '187.5 meters', 1370659613),
(55, 3, 7, '103.7 meters', 1370659613),
(56, 3, 8, '37.2 meters', 1370659613),
(57, 3, 9, '8', 1370659613),
(58, 3, 10, '20', 1370659613),
(59, 3, 11, '85', 1370659613),
(60, 3, 12, '15', 1370659613),
(61, 3, 13, '0', 1370659613),
(62, 3, 14, '240', 1370659613),
(63, 3, 15, 'Warp 7', 1370659613),
(64, 3, 16, 'Warp 9.2', 1370659613),
(65, 3, 17, 'Warp 9.75', 1370659613),
(66, 3, 18, 'Multi-Layered Shielding System\nDuranium/Tritanium Double Hull\nAblative Armor', 1370659613),
(67, 3, 19, '11 Type-X phaser arrays\n5 Torpedo Launchers (2 forward, 3 aft)', 1370659613),
(68, 3, 20, '50 Quantum Torpedoes\n50 Photon Torpedoes\n2 Tri Cobalt Torpedoes', 1370659613),
(69, 3, 21, '1', 1370659613),
(70, 3, 22, '1 Type-9 Shuttle\n1 Type-11 Shuttle', 1370659613),
(71, 3, 23, '', 1370659613),
(72, 3, 24, '', 1370659613),
(73, 4, 1, 'Defiant', 1370659645),
(74, 4, 2, 'Tactical Escort', 1370659645),
(75, 4, 3, '55 years', 1370659645),
(76, 4, 4, '3 months', 1370659645),
(77, 4, 5, '4 years', 1370659645),
(78, 4, 6, '119.5 meters', 1370659645),
(79, 4, 7, '80.4 meters', 1370659645),
(80, 4, 8, '18.8 meters', 1370659645),
(81, 4, 9, '5', 1370659645),
(82, 4, 10, '15', 1370659645),
(83, 4, 11, '35', 1370659645),
(84, 4, 12, '0', 1370659645),
(85, 4, 13, '0', 1370659645),
(86, 4, 14, '80', 1370659645),
(87, 4, 15, 'Warp 7', 1370659645),
(88, 4, 16, 'Warp 9', 1370659645),
(89, 4, 17, 'Warp 9.5', 1370659645),
(90, 4, 18, 'Multi-Layered Shielding System\nDuranium/Tritanium Double Hull\nAblative Armor', 1370659645),
(91, 4, 19, '4 Type-XII pulse phasers\n3 Type-IX phaser arrays\n3 Torpedo Launchers (2 forward, 1 aft)', 1370659645),
(92, 4, 20, '90 Quantum Torpedoes', 1370659645),
(93, 4, 21, '1', 1370659645),
(94, 4, 22, '2 Type-9 Shuttles', 1370659645),
(95, 4, 23, '', 1370659645),
(96, 4, 24, '', 1370659645),
(97, 5, 1, 'Nova', 1370659662),
(98, 5, 2, 'Surveyor', 1370659662),
(99, 5, 3, '50 years', 1370659662),
(100, 5, 4, '6 months', 1370659662),
(101, 5, 5, '2 years', 1370659662),
(102, 5, 6, '165 meters', 1370659662),
(103, 5, 7, '62 meters', 1370659662),
(104, 5, 8, '34 meters', 1370659662),
(105, 5, 9, '8', 1370659662),
(106, 5, 10, '15', 1370659662),
(107, 5, 11, '65', 1370659662),
(108, 5, 12, '0', 1370659662),
(109, 5, 13, '5', 1370659662),
(110, 5, 14, '180', 1370659662),
(111, 5, 15, 'Warp 5', 1370659662),
(112, 5, 16, 'Warp 8', 1370659662),
(113, 5, 17, 'Warp 8.55', 1370659662),
(114, 5, 18, 'Regenerative Shielding System\nDuranium/Tritanium Double Hull', 1370659662),
(115, 5, 19, '11 Type-IX phaser arrays\n3 Torpedo Launchers (2 forward, 1 aft)', 1370659662),
(116, 5, 20, '15 Quantum Torpedoes\n30 Photon Torpedoes\n3 Tri Cobalt Torpedoes', 1370659662),
(117, 5, 21, '1', 1370659662),
(118, 5, 22, '1 Type-9 Shuttle\n1 Type-11 Shuttle', 1370659662),
(119, 5, 23, '', 1370659662),
(120, 5, 24, '1 Waverider-class Runabout', 1370659662),
(121, 6, 1, 'Nebula', 1370660836),
(122, 6, 2, 'Heavy Cruiser', 1370660836),
(123, 6, 3, '100 years', 1370660836),
(124, 6, 4, '3 years', 1370660836),
(125, 6, 5, '10 years', 1370660836),
(126, 6, 6, '422.23 meters', 1370660836),
(127, 6, 7, '453 meters', 1370660836),
(128, 6, 8, '130.43 meters', 1370660836),
(129, 6, 9, '42', 1370660836),
(130, 6, 10, '130', 1370660836),
(131, 6, 11, '550', 1370660836),
(132, 6, 12, '25', 1370660836),
(133, 6, 13, '30', 1370660836),
(134, 6, 14, '2500', 1370660836),
(135, 6, 15, 'Warp 6', 1370660836),
(136, 6, 16, 'Warp 9.1', 1370660836),
(137, 6, 17, 'Warp 9.6', 1370660836),
(138, 6, 18, 'Multi-layered Shielding System\nDuranium/Tritanium Double Hull', 1370660836),
(139, 6, 19, '8 Type-X phaser arrays\n2 Torpedo Launchers (1 forward, 1 aft)', 1370660836),
(140, 6, 20, '100 Quantum Torpedoes\n200 Photon Torpedoes\n4 Tri Cobalt Torpedoes', 1370660836),
(141, 6, 21, '2', 1370660836),
(142, 6, 22, '10 Assorted Shuttles', 1370660836),
(143, 6, 23, '', 1370660836),
(144, 6, 24, '4 Assorted Shuttles', 1370660836);

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_fields`
--

CREATE TABLE IF NOT EXISTS `nova_specs_fields` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `field_type` enum('text','select','textarea') NOT NULL DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text NOT NULL,
  `field_label_page` text NOT NULL,
  `field_value` text NOT NULL,
  `field_selected` varchar(20) NOT NULL DEFAULT '',
  `field_order` int(5) NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int(3) NOT NULL DEFAULT '5',
  `field_section` int(8) NOT NULL DEFAULT '1',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `nova_specs_fields`
--

INSERT INTO `nova_specs_fields` (`field_id`, `field_type`, `field_name`, `field_fid`, `field_class`, `field_label_page`, `field_value`, `field_selected`, `field_order`, `field_display`, `field_rows`, `field_section`) VALUES
(1, 'text', 'class', 'class', '', 'Class', '', '', 0, 'y', 5, 1),
(2, 'text', 'role', 'role', '', 'Role', '', '', 1, 'y', 5, 1),
(3, 'text', 'duration', 'duration', '', 'Duration', '', '', 2, 'y', 5, 1),
(4, 'text', 'refit', 'refit', '', 'Time Between Refits', '', '', 3, 'y', 5, 1),
(5, 'text', 'resupply', 'resupply', '', 'Time Between Resupply', '', '', 4, 'y', 5, 1),
(6, 'text', 'length', 'length', '', 'Length', '', '', 0, 'y', 5, 2),
(7, 'text', 'width', 'width', '', 'Width', '', '', 1, 'y', 5, 2),
(8, 'text', 'height', 'height', '', 'Height', '', '', 2, 'y', 5, 2),
(9, 'text', 'decks', 'decks', 'medium', 'Decks', '', '', 3, 'y', 5, 2),
(10, 'text', 'compliment_officers', 'compliment_officers', 'medium', 'Officers', '', '', 0, 'y', 5, 3),
(11, 'text', 'compliment_enlisted', 'compliment_enlisted', 'medium', 'Enlisted Crew', '', '', 1, 'y', 5, 3),
(12, 'text', 'compliment_marines', 'compliment_marines', 'medium', 'Marines', '', '', 2, 'y', 5, 3),
(13, 'text', 'compliment_civilians', 'compliment_civilians', 'medium', 'Civilians', '', '', 3, 'y', 5, 3),
(14, 'text', 'compliment_emergency', 'compliment_emergency', 'medium', 'Emergency Capacity', '', '', 4, 'y', 5, 3),
(15, 'text', 'speed_normal', 'speed_normal', 'medium', 'Cruise Speed', '', '', 0, 'y', 5, 4),
(16, 'text', 'speed_max', 'speed_max', 'medium', 'Maximum Speed', '', '', 1, 'y', 5, 4),
(17, 'text', 'speed_emergency', 'speed_emergency', 'medium', 'Emergency Speed', '', '', 2, 'y', 5, 4),
(18, 'textarea', 'defensive', 'defensive', '', 'Shields', '', '', 0, 'y', 5, 5),
(19, 'textarea', 'weapons', 'weapons', '', 'Weapon Systems', '', '', 1, 'y', 5, 5),
(20, 'textarea', 'armament', 'armament', '', 'Armament', '', '', 2, 'y', 5, 5),
(21, 'text', 'shuttlebays', 'shuttlebays', 'small', 'Shuttlebays', '', '', 0, 'y', 5, 6),
(22, 'textarea', 'shuttles', 'shuttles', '', 'Shuttles', '', '', 1, 'y', 5, 6),
(23, 'textarea', 'fighters', 'fighters', '', 'Fighters', '', '', 2, 'y', 5, 6),
(24, 'textarea', 'runabouts', 'runabouts', '', 'Runabouts', '', '', 3, 'y', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_sections`
--

CREATE TABLE IF NOT EXISTS `nova_specs_sections` (
  `section_id` int(8) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) NOT NULL DEFAULT '',
  `section_order` int(5) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `nova_specs_sections`
--

INSERT INTO `nova_specs_sections` (`section_id`, `section_name`, `section_order`) VALUES
(1, 'General', 0),
(2, 'Dimensions', 1),
(3, 'Personnel', 2),
(4, 'Speed', 3),
(5, 'Weapons &amp; Defensive Systems', 4),
(6, 'Auxiliary Craft', 5);

-- --------------------------------------------------------

--
-- Table structure for table `nova_specs_values`
--

CREATE TABLE IF NOT EXISTS `nova_specs_values` (
  `value_id` int(10) NOT NULL AUTO_INCREMENT,
  `value_field` int(10) NOT NULL,
  `value_type` enum('option') NOT NULL DEFAULT 'option',
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text NOT NULL,
  `value_order` int(5) NOT NULL,
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_system_info`
--

CREATE TABLE IF NOT EXISTS `nova_system_info` (
  `sys_id` int(4) NOT NULL AUTO_INCREMENT,
  `sys_uid` varchar(32) NOT NULL DEFAULT '',
  `sys_install_date` bigint(20) NOT NULL,
  `sys_last_update` bigint(20) NOT NULL,
  `sys_version_major` int(1) NOT NULL,
  `sys_version_minor` int(2) NOT NULL,
  `sys_version_update` int(4) NOT NULL,
  `sys_version_ignore` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`sys_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nova_system_info`
--

INSERT INTO `nova_system_info` (`sys_id`, `sys_uid`, `sys_install_date`, `sys_last_update`, `sys_version_major`, `sys_version_minor`, `sys_version_update`, `sys_version_ignore`) VALUES
(1, 'b7Rmlah0cpz2yrYteyYdTTeyPliOaPda', 1370191224, 0, 2, 2, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour`
--

CREATE TABLE IF NOT EXISTS `nova_tour` (
  `tour_id` int(5) NOT NULL AUTO_INCREMENT,
  `tour_name` varchar(255) NOT NULL DEFAULT '',
  `tour_order` int(4) NOT NULL,
  `tour_display` enum('y','n') NOT NULL DEFAULT 'y',
  `tour_images` text NOT NULL,
  `tour_summary` text NOT NULL,
  `tour_spec_item` int(5) NOT NULL,
  PRIMARY KEY (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_data`
--

CREATE TABLE IF NOT EXISTS `nova_tour_data` (
  `data_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_tour_item` int(5) NOT NULL,
  `data_field` int(10) NOT NULL,
  `data_value` text NOT NULL,
  `data_updated` bigint(20) NOT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_decks`
--

CREATE TABLE IF NOT EXISTS `nova_tour_decks` (
  `deck_id` int(10) NOT NULL AUTO_INCREMENT,
  `deck_name` varchar(255) NOT NULL DEFAULT '',
  `deck_order` int(10) NOT NULL,
  `deck_content` text NOT NULL,
  `deck_item` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`deck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_fields`
--

CREATE TABLE IF NOT EXISTS `nova_tour_fields` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `field_type` enum('text','select','textarea') NOT NULL DEFAULT 'text',
  `field_name` varchar(100) NOT NULL DEFAULT '',
  `field_fid` varchar(100) NOT NULL DEFAULT '',
  `field_class` text NOT NULL,
  `field_label_page` text NOT NULL,
  `field_value` text NOT NULL,
  `field_selected` varchar(20) NOT NULL DEFAULT '',
  `field_order` int(5) NOT NULL,
  `field_display` enum('y','n') NOT NULL DEFAULT 'y',
  `field_rows` int(3) NOT NULL DEFAULT '5',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `nova_tour_fields`
--

INSERT INTO `nova_tour_fields` (`field_id`, `field_type`, `field_name`, `field_fid`, `field_class`, `field_label_page`, `field_value`, `field_selected`, `field_order`, `field_display`, `field_rows`) VALUES
(1, 'text', 'location', 'location', '', 'Location', '', '', 0, 'y', 5),
(2, 'textarea', 'long_desc', 'long_desc', '', 'Description', '', '', 1, 'y', 8);

-- --------------------------------------------------------

--
-- Table structure for table `nova_tour_values`
--

CREATE TABLE IF NOT EXISTS `nova_tour_values` (
  `value_id` int(10) NOT NULL AUTO_INCREMENT,
  `value_field` int(10) NOT NULL,
  `value_field_value` varchar(255) NOT NULL DEFAULT '',
  `value_selected` varchar(10) NOT NULL DEFAULT '',
  `value_content` text NOT NULL,
  `value_order` int(5) NOT NULL,
  PRIMARY KEY (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_uploads`
--

CREATE TABLE IF NOT EXISTS `nova_uploads` (
  `upload_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `upload_filename` text NOT NULL,
  `upload_mime_type` varchar(255) NOT NULL DEFAULT '',
  `upload_resource_type` varchar(100) NOT NULL DEFAULT '',
  `upload_user` int(8) NOT NULL,
  `upload_ip` varchar(45) NOT NULL DEFAULT '',
  `upload_date` bigint(20) NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nova_uploads`
--

INSERT INTO `nova_uploads` (`upload_id`, `upload_filename`, `upload_mime_type`, `upload_resource_type`, `upload_user`, `upload_ip`, `upload_date`) VALUES
(1, 'ussenigma.png', 'image/png', 'mission', 1, '::1', 1370672830);

-- --------------------------------------------------------

--
-- Table structure for table `nova_users`
--

CREATE TABLE IF NOT EXISTS `nova_users` (
  `userid` int(8) NOT NULL AUTO_INCREMENT,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'active',
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `date_of_birth` varchar(50) NOT NULL DEFAULT '',
  `instant_message` text NOT NULL,
  `main_char` int(5) NOT NULL,
  `access_role` int(5) NOT NULL,
  `is_sysadmin` enum('y','n') NOT NULL DEFAULT 'n',
  `is_game_master` enum('y','n') NOT NULL DEFAULT 'n',
  `is_webmaster` enum('y','n') NOT NULL DEFAULT 'n',
  `is_firstlaunch` enum('y','n') NOT NULL DEFAULT 'y',
  `timezone` varchar(5) NOT NULL DEFAULT 'UTC',
  `daylight_savings` varchar(1) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT 'english',
  `join_date` bigint(20) NOT NULL,
  `leave_date` bigint(20) NOT NULL,
  `last_post` bigint(20) NOT NULL,
  `last_login` bigint(20) NOT NULL,
  `loa` enum('active','loa','eloa') NOT NULL DEFAULT 'active',
  `display_rank` varchar(100) NOT NULL DEFAULT 'default',
  `skin_main` varchar(100) NOT NULL DEFAULT 'default',
  `skin_wiki` varchar(100) NOT NULL DEFAULT 'default',
  `skin_admin` varchar(100) NOT NULL DEFAULT 'default',
  `location` text NOT NULL,
  `interests` text NOT NULL,
  `bio` text NOT NULL,
  `security_question` int(5) NOT NULL,
  `security_answer` varchar(40) NOT NULL DEFAULT '',
  `password_reset` int(1) NOT NULL DEFAULT '0',
  `moderate_posts` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_logs` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_news` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_post_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_log_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_news_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `moderate_wiki_comments` enum('y','n') NOT NULL DEFAULT 'n',
  `my_links` text NOT NULL,
  `last_update` bigint(20) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nova_users`
--

INSERT INTO `nova_users` (`userid`, `status`, `name`, `email`, `password`, `date_of_birth`, `instant_message`, `main_char`, `access_role`, `is_sysadmin`, `is_game_master`, `is_webmaster`, `is_firstlaunch`, `timezone`, `daylight_savings`, `language`, `join_date`, `leave_date`, `last_post`, `last_login`, `loa`, `display_rank`, `skin_main`, `skin_wiki`, `skin_admin`, `location`, `interests`, `bio`, `security_question`, `security_answer`, `password_reset`, `moderate_posts`, `moderate_logs`, `moderate_news`, `moderate_post_comments`, `moderate_log_comments`, `moderate_news_comments`, `moderate_wiki_comments`, `my_links`, `last_update`) VALUES
(1, 'active', 'Jon Matterson', 'jonm@bravofleet.com', 'f05b9c64c26f7431f556f88b916e6729ad7df28e', 'May 4, 1989', '', 1, 1, 'y', 'y', 'y', 'y', 'UM8', '0', 'english', 1370191358, 0, 1370675192, 1370329635, 'active', 'default', 'faltan', 'faltan', 'default', '', '', '', 2, '3d86fa0fce495ea07d119f7e381e1c857b69de29', 0, 'n', 'n', 'n', 'n', 'n', 'n', 'n', '84', 1370674739);

-- --------------------------------------------------------

--
-- Table structure for table `nova_user_loa`
--

CREATE TABLE IF NOT EXISTS `nova_user_loa` (
  `loa_id` int(10) NOT NULL AUTO_INCREMENT,
  `loa_user` int(8) NOT NULL,
  `loa_start_date` bigint(20) NOT NULL,
  `loa_end_date` bigint(20) NOT NULL,
  `loa_duration` text NOT NULL,
  `loa_reason` text NOT NULL,
  `loa_type` enum('active','loa','eloa') NOT NULL DEFAULT 'loa',
  PRIMARY KEY (`loa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_user_prefs`
--

CREATE TABLE IF NOT EXISTS `nova_user_prefs` (
  `pref_id` int(5) NOT NULL AUTO_INCREMENT,
  `pref_key` varchar(100) NOT NULL DEFAULT '',
  `pref_label` varchar(255) NOT NULL DEFAULT '',
  `pref_default` text NOT NULL,
  PRIMARY KEY (`pref_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `nova_user_prefs`
--

INSERT INTO `nova_user_prefs` (`pref_id`, `pref_key`, `pref_label`, `pref_default`) VALUES
(1, 'email_new_news_comments', 'Email News Comments', 'y'),
(2, 'email_new_log_comments', 'Email Log Comments', 'y'),
(3, 'email_new_post_comments', 'Email Post Comments', 'y'),
(4, 'email_new_wiki_comments', 'Email Wiki Comments', 'y'),
(5, 'email_private_message', 'Email Private Messages', 'y'),
(6, 'email_personal_logs', 'Email Personal Logs', 'y'),
(7, 'email_news_items', 'Email News Items', 'y'),
(8, 'email_mission_posts', 'Email Mission Posts', 'y'),
(9, 'email_mission_posts_save', 'Email Mission Post Saved Notifications', 'y'),
(10, 'email_mission_posts_delete', 'Email Mission Post Delete Notifications', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_user_prefs_values`
--

CREATE TABLE IF NOT EXISTS `nova_user_prefs_values` (
  `prefvalue_id` int(5) NOT NULL AUTO_INCREMENT,
  `prefvalue_user` int(8) NOT NULL,
  `prefvalue_key` varchar(100) NOT NULL DEFAULT '',
  `prefvalue_value` text NOT NULL,
  PRIMARY KEY (`prefvalue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `nova_user_prefs_values`
--

INSERT INTO `nova_user_prefs_values` (`prefvalue_id`, `prefvalue_user`, `prefvalue_key`, `prefvalue_value`) VALUES
(1, 1, 'email_new_news_comments', 'y'),
(2, 1, 'email_new_log_comments', 'y'),
(3, 1, 'email_new_post_comments', 'y'),
(4, 1, 'email_new_wiki_comments', 'y'),
(5, 1, 'email_private_message', 'y'),
(6, 1, 'email_personal_logs', 'y'),
(7, 1, 'email_news_items', 'y'),
(8, 1, 'email_mission_posts', 'y'),
(9, 1, 'email_mission_posts_save', 'y'),
(10, 1, 'email_mission_posts_delete', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_categories`
--

CREATE TABLE IF NOT EXISTS `nova_wiki_categories` (
  `wikicat_id` int(8) NOT NULL AUTO_INCREMENT,
  `wikicat_name` varchar(100) NOT NULL DEFAULT '',
  `wikicat_desc` text NOT NULL,
  PRIMARY KEY (`wikicat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_comments`
--

CREATE TABLE IF NOT EXISTS `nova_wiki_comments` (
  `wcomment_id` int(10) NOT NULL AUTO_INCREMENT,
  `wcomment_author_user` int(8) NOT NULL,
  `wcomment_author_character` int(8) NOT NULL,
  `wcomment_page` int(10) NOT NULL,
  `wcomment_date` bigint(20) NOT NULL,
  `wcomment_content` text NOT NULL,
  `wcomment_status` enum('activated','pending') NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`wcomment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_drafts`
--

CREATE TABLE IF NOT EXISTS `nova_wiki_drafts` (
  `draft_id` int(10) NOT NULL AUTO_INCREMENT,
  `draft_id_old` int(10) NOT NULL,
  `draft_title` varchar(255) NOT NULL DEFAULT '',
  `draft_author_user` int(8) NOT NULL,
  `draft_author_character` int(8) NOT NULL,
  `draft_summary` text NOT NULL,
  `draft_content` longtext NOT NULL,
  `draft_page` int(10) NOT NULL,
  `draft_created_at` bigint(20) NOT NULL,
  `draft_categories` text NOT NULL,
  `draft_changed_comments` text NOT NULL,
  PRIMARY KEY (`draft_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nova_wiki_drafts`
--

INSERT INTO `nova_wiki_drafts` (`draft_id`, `draft_id_old`, `draft_title`, `draft_author_user`, `draft_author_character`, `draft_summary`, `draft_content`, `draft_page`, `draft_created_at`, `draft_categories`, `draft_changed_comments`) VALUES
(1, 0, 'Welcome to Thresher', 0, 0, 'This is the main wiki system page.', '<p>Welcome to Thresher R2. Thresher is Nova''s built-in mini-wiki to help your RPG collaborate and share information easily. You can change this message by editing the system page from the Wiki Page Management page.</p>', 1, 1370191224, '', ''),
(2, 0, 'Create Wiki Page', 0, 0, '', '', 2, 1370191224, '', ''),
(3, 0, 'Edit Wiki Page', 0, 0, '', '', 3, 1370191224, '', ''),
(4, 0, 'Wiki Categories', 0, 0, 'Categories in Thresher allow pages to be broken up in to different subject matters and categorized in a way that makes sense. Below is the complete list of categories. Clicking on one of the categories will show all pages associated with that category.', '', 4, 1370191224, '', ''),
(5, 0, 'Wiki Category Page', 0, 0, '', '', 5, 1370191224, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `nova_wiki_pages` (
  `page_id` int(10) NOT NULL AUTO_INCREMENT,
  `page_draft` int(10) NOT NULL,
  `page_created_at` bigint(20) NOT NULL,
  `page_created_by_user` int(8) NOT NULL,
  `page_created_by_character` int(8) NOT NULL,
  `page_updated_at` bigint(20) NOT NULL,
  `page_updated_by_user` int(8) NOT NULL,
  `page_updated_by_character` int(8) NOT NULL,
  `page_comments` enum('open','closed') NOT NULL DEFAULT 'open',
  `page_type` enum('standard','system') NOT NULL DEFAULT 'standard',
  `page_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nova_wiki_pages`
--

INSERT INTO `nova_wiki_pages` (`page_id`, `page_draft`, `page_created_at`, `page_created_by_user`, `page_created_by_character`, `page_updated_at`, `page_updated_by_user`, `page_updated_by_character`, `page_comments`, `page_type`, `page_key`) VALUES
(1, 1, 1370191224, 0, 0, 0, 0, 0, 'closed', 'system', 'index'),
(2, 2, 1370191224, 0, 0, 0, 0, 0, 'closed', 'system', 'create'),
(3, 3, 1370191224, 0, 0, 0, 0, 0, 'closed', 'system', 'edit'),
(4, 4, 1370191224, 0, 0, 0, 0, 0, 'closed', 'system', 'categories'),
(5, 5, 1370191224, 0, 0, 0, 0, 0, 'closed', 'system', 'category');

-- --------------------------------------------------------

--
-- Table structure for table `nova_wiki_restrictions`
--

CREATE TABLE IF NOT EXISTS `nova_wiki_restrictions` (
  `restr_id` int(10) NOT NULL AUTO_INCREMENT,
  `restr_page` int(10) NOT NULL,
  `restr_created_at` bigint(20) NOT NULL,
  `restr_created_by` int(8) NOT NULL,
  `restr_updated_at` bigint(20) NOT NULL,
  `restr_updated_by` int(8) NOT NULL,
  `restrictions` text NOT NULL,
  PRIMARY KEY (`restr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
