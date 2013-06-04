-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2013 at 07:07 AM
-- Server version: 5.6.10
-- PHP Version: 5.4.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `nova_characters`
--

INSERT INTO `nova_characters` (`charid`, `user`, `first_name`, `middle_name`, `last_name`, `suffix`, `crew_type`, `date_activate`, `date_deactivate`, `images`, `rank`, `position_1`, `position_2`, `last_post`) VALUES
(1, 1, 'Allison', '', 'Reyes', '', 'active', 1370191358, 0, '', 37, 1, 87, 0),
(2, 1, 'Jake', 'Daniel', 'Lewis', '', 'active', 0, 0, '', 73, 2, 92, 0),
(3, 0, 'Charles', '', 'Ainsworth', '', 'npc', 0, 0, '', 50, 88, 0, 0),
(4, 0, 'Jaxon', '', 'Amolyae', '', 'npc', 0, 0, '', 102, 94, 109, 0),
(5, 0, 'Robert', '', 'Chadwick', '', 'npc', 0, 0, '', 362, 133, 0, 0),
(6, 0, 'Jennifer', '', 'Russo', '', 'npc', 0, 0, '', 97, 79, 93, 0),
(7, 0, 'John', '', 'Miles', '', 'npc', 0, 0, '', 111, 99, 0, 0),
(8, 0, 'Mike', '', 'Brancer', '', 'npc', 0, 0, '', 54, 105, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=169 ;

--
-- Dumping data for table `nova_characters_data`
--

INSERT INTO `nova_characters_data` (`data_id`, `data_field`, `data_char`, `data_user`, `data_value`, `data_updated`) VALUES
(1, 1, 1, 1, 'Male', 1370200852),
(2, 2, 1, 1, '', 1370200852),
(3, 3, 1, 1, '', 1370200852),
(4, 4, 1, 1, '', 1370200852),
(5, 5, 1, 1, '', 1370200852),
(6, 6, 1, 1, '', 1370200852),
(7, 7, 1, 1, '', 1370200852),
(8, 8, 1, 1, '', 1370200852),
(9, 9, 1, 1, '', 1370200852),
(10, 10, 1, 1, '', 1370200852),
(11, 11, 1, 1, '', 1370200852),
(12, 12, 1, 1, '', 1370200852),
(13, 13, 1, 1, '', 1370200852),
(14, 14, 1, 1, '', 1370200852),
(15, 15, 1, 1, '', 1370200852),
(16, 16, 1, 1, '', 1370200852),
(17, 17, 1, 1, '', 1370200852),
(18, 18, 1, 1, '', 1370200852),
(19, 19, 1, 1, '', 1370200852),
(20, 20, 1, 1, '', 1370200852),
(21, 21, 1, 1, '', 1370200852),
(22, 1, 2, 0, 'Male', 1370198800),
(23, 2, 2, 0, '', 1370198800),
(24, 3, 2, 0, '', 1370198800),
(25, 4, 2, 0, '', 1370198800),
(26, 5, 2, 0, '', 1370198800),
(27, 6, 2, 0, '', 1370198800),
(28, 7, 2, 0, '', 1370198800),
(29, 8, 2, 0, '', 1370198800),
(30, 9, 2, 0, '', 1370198800),
(31, 10, 2, 0, '', 1370198800),
(32, 11, 2, 0, '', 1370198800),
(33, 12, 2, 0, '', 1370198800),
(34, 13, 2, 0, '', 1370198800),
(35, 14, 2, 0, '', 1370198800),
(36, 15, 2, 0, '', 1370198800),
(37, 16, 2, 0, '', 1370198800),
(38, 17, 2, 0, '', 1370198800),
(39, 18, 2, 0, '', 1370198800),
(40, 19, 2, 0, '', 1370198800),
(41, 20, 2, 0, '', 1370198800),
(42, 21, 2, 0, '', 1370198800),
(43, 1, 3, 0, 'Male', 1370198898),
(44, 2, 3, 0, '', 1370198898),
(45, 3, 3, 0, '', 1370198898),
(46, 4, 3, 0, '', 1370198898),
(47, 5, 3, 0, '', 1370198898),
(48, 6, 3, 0, '', 1370198898),
(49, 7, 3, 0, '', 1370198898),
(50, 8, 3, 0, '', 1370198898),
(51, 9, 3, 0, '', 1370198898),
(52, 10, 3, 0, '', 1370198898),
(53, 11, 3, 0, '', 1370198898),
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
(64, 1, 4, 0, 'Male', 1370198946),
(65, 2, 4, 0, '', 1370198946),
(66, 3, 4, 0, '', 1370198946),
(67, 4, 4, 0, '', 1370198946),
(68, 5, 4, 0, '', 1370198946),
(69, 6, 4, 0, '', 1370198946),
(70, 7, 4, 0, '', 1370198946),
(71, 8, 4, 0, '', 1370198946),
(72, 9, 4, 0, '', 1370198946),
(73, 10, 4, 0, '', 1370198946),
(74, 11, 4, 0, '', 1370198946),
(75, 12, 4, 0, '', 1370198946),
(76, 13, 4, 0, '', 1370198946),
(77, 14, 4, 0, '', 1370198946),
(78, 15, 4, 0, '', 1370198946),
(79, 16, 4, 0, '', 1370198946),
(80, 17, 4, 0, '', 1370198946),
(81, 18, 4, 0, '', 1370198946),
(82, 19, 4, 0, '', 1370198946),
(83, 20, 4, 0, '', 1370198946),
(84, 21, 4, 0, '', 1370198946),
(85, 1, 5, 0, 'Male', 1370199314),
(86, 2, 5, 0, '', 1370199314),
(87, 3, 5, 0, '', 1370199314),
(88, 4, 5, 0, '', 1370199314),
(89, 5, 5, 0, '', 1370199314),
(90, 6, 5, 0, '', 1370199314),
(91, 7, 5, 0, '', 1370199314),
(92, 8, 5, 0, '', 1370199314),
(93, 9, 5, 0, '', 1370199314),
(94, 10, 5, 0, '', 1370199314),
(95, 11, 5, 0, '', 1370199314),
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
(106, 1, 6, 0, 'Male', 1370200289),
(107, 2, 6, 0, '', 1370200289),
(108, 3, 6, 0, '', 1370200289),
(109, 4, 6, 0, '', 1370200289),
(110, 5, 6, 0, '', 1370200289),
(111, 6, 6, 0, '', 1370200289),
(112, 7, 6, 0, '', 1370200289),
(113, 8, 6, 0, '', 1370200289),
(114, 9, 6, 0, '', 1370200289),
(115, 10, 6, 0, '', 1370200289),
(116, 11, 6, 0, '', 1370200289),
(117, 12, 6, 0, '', 1370200289),
(118, 13, 6, 0, '', 1370200289),
(119, 14, 6, 0, '', 1370200289),
(120, 15, 6, 0, '', 1370200289),
(121, 16, 6, 0, '', 1370200289),
(122, 17, 6, 0, '', 1370200289),
(123, 18, 6, 0, '', 1370200289),
(124, 19, 6, 0, '', 1370200289),
(125, 20, 6, 0, '', 1370200289),
(126, 21, 6, 0, '', 1370200289),
(127, 1, 7, 0, 'Male', 1370200373),
(128, 2, 7, 0, '', 1370200373),
(129, 3, 7, 0, '', 1370200373),
(130, 4, 7, 0, '', 1370200373),
(131, 5, 7, 0, '', 1370200373),
(132, 6, 7, 0, '', 1370200373),
(133, 7, 7, 0, '', 1370200373),
(134, 8, 7, 0, '', 1370200373),
(135, 9, 7, 0, '', 1370200373),
(136, 10, 7, 0, '', 1370200373),
(137, 11, 7, 0, '', 1370200373),
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
(157, 10, 8, 0, '', 1370329128),
(158, 11, 8, 0, '', 1370329128),
(159, 12, 8, 0, '', 1370329128),
(160, 13, 8, 0, '', 1370329128),
(161, 14, 8, 0, '', 1370329128),
(162, 15, 8, 0, '', 1370329128),
(163, 16, 8, 0, '', 1370329128),
(164, 17, 8, 0, '', 1370329128),
(165, 18, 8, 0, '', 1370329128),
(166, 19, 8, 0, '', 1370329128),
(167, 20, 8, 0, '', 1370329128),
(168, 21, 8, 0, '', 1370329128);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

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
(9, 'textarea', 'personality', 'personality', '', 'General Overview', '', 0, 'y', 5, 4),
(10, 'textarea', 'strengths', 'strengths', '', 'Strengths &amp; Weaknesses', '', 1, 'y', 5, 4),
(11, 'textarea', 'ambitions', 'ambitions', '', 'Ambitions', '', 2, 'y', 5, 4),
(12, 'textarea', 'hobbies', 'hobbies', '', 'Hobbies &amp; Interests', '', 3, 'y', 5, 4),
(13, 'text', 'spouse', 'spouse', '', 'Spouse', '', 0, 'y', 5, 3),
(14, 'textarea', 'children', 'children', '', 'Children', '', 1, 'y', 5, 3),
(15, 'text', 'father', 'father', '', 'Father', '', 2, 'y', 5, 3),
(16, 'text', 'mother', 'mother', '', 'Mother', '', 3, 'y', 5, 3),
(17, 'textarea', 'brothers', 'brothers', '', 'Brother(s)', '', 4, 'y', 5, 3),
(18, 'textarea', 'sisters', 'sisters', '', 'Sister(s)', '', 5, 'y', 5, 3),
(19, 'textarea', 'other_family', 'other_family', '', 'Other Family', '', 6, 'y', 5, 3),
(20, 'textarea', 'history', 'history', '', 'Personal History', '', 0, 'y', 15, 5),
(21, 'textarea', 'service_record', 'service_record', '', 'Service Record', '', 1, 'y', 15, 5);

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
(3, 3, 2),
(4, 8, 3),
(5, 6, 4),
(6, 4, 5),
(7, 7, 6);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `nova_departments_ds9`
--

INSERT INTO `nova_departments_ds9` (`dept_id`, `dept_name`, `dept_desc`, `dept_order`, `dept_display`, `dept_type`, `dept_parent`, `dept_manifest`) VALUES
(1, 'Command', '', 0, 'y', 'playing', 0, 1),
(14, 'Raeyan Station', '', 2, 'y', 'playing', 0, 1),
(15, 'Corps of Engineers', '', 10, 'y', 'playing', 0, 1),
(16, '4th Marine Expeditionary Unit', '<p>The 4th Marine Expeditionary Unit is a specialized expeditionary quick reaction force with reinforced infantry, aviation, logistics and command elements. With a size of approximately 2500 personnel, it is barracked in a facility adjacent to Faltan Command on Faltan III.</p>', 30, 'y', 'playing', 0, 1),
(17, '93rd Marine Battalion', '<p>The 93rd Battalion is a reinforced infantry battalion currently operating under the 4th Marine Expeditionary Unit. It is comprised of approximately eleven hundred soldiers between three infantry companies, a weapons company and a command company.</p>', 1, 'y', 'playing', 16, 1),
(18, '58th Combat Logistics Battalion', '<p>The 58th Combat Logistics Battalion is a logistics battalion currently operating under the 4th Marine Expeditionary Unit. Before its current tenure as the Raeyan Sector marine logistics unit for Task Force 93, it was the primary marine logistics unit for Task Force 58.</p>', 20, 'y', 'playing', 16, 1),
(19, 'Marine Aviation Group 93', '<p>Marine Aviation Group 93 is a starfighter aviation unit comprised of one Javelin-class air superiority squadron, two Valkyrie-class multi-purpose squadrons, one Peregrine-class fighter/bomber squadron, two logistical squadrons of Arrow, Argo and Type-11 shuttles, and a ground support company.</p>', 10, 'y', 'playing', 16, 1),
(20, 'Federation Diplomatic Corps', '', 20, 'y', 'playing', 0, 1),
(21, 'Rapid Response Unit', '<p>The Rapid Response Unit is a full-function Starfleet mission unit deployed on an as-needed basis from one or more of the vessels assigned to Faltan Station. While its personnel originate from a number of separate structures including Task Force 93, the Starfleet Marine Corps, the Starfleet Corps of Engineers and the Federation Diplomatic Corps, when active, the Rapid Response Unit represents a unified command.</p>\n\n<p>The Unit is split into three divisions: the Command Division; the Analysis Division,  which includes Departments responsible for starship operations and mission-specialized analysis; the Tactical Division, which includes Department Heads essential to tactical operations often beyond the deployment platform itself.</p>\n\n<p>When active, the Unit may include some or all of its personnel, as well as supplementary personnel attached for the duration of the mission, depending on the mission parameters. When not active, all members of the Unit hold secondary duties on Faltan Station.</p>', 11, 'y', 'playing', 0, 1),
(23, 'Analysis Division', '', 10, 'y', 'playing', 21, 1),
(24, 'Tactical Division', '', 5, 'y', 'playing', 21, 1),
(25, 'Faltan Government', '<p>Faltan Government is an autonomous government responsible for the Faltan Colony on Faltan III, including Armed Services, Diplomatic Services, and Support Services divisions.</p>\n\n<p>The Armed Services division primarily focuses on internal policing; however, they do maintain a formidable array of orbital defense systems and short-ranged tactical fighters capable of fending off incursions by raiders and small regional powers, as well as addressing issues if they arise on the lunar colony. Preferring to focus on survival instead of expansion, though, their only interstellar capabilities stem from a pair of medium cruisers and the experimental vessel that first brought them to the Raeyan Sector four hundred years ago. Seldom do these vessels ever travel beyond the Faltan system.</p>\n\n<p>Similarly, the Diplomatic Services division exists almost exclusively to liaise with the mining colony and the Federation. They have made contact with several nearby species but have chosen not to maintain any more than cursory connections with them.</p>', 70, 'y', 'playing', 0, 1),
(26, 'Caerus Mining Company', '<p>The Caerus Mining Company is an independent corporation initially founded in Federation space. The Faltan Lunar Colony is run by one of Caerus'' managing partners. The majority of all personnel are classed under Operational Services, with the exception of a small group of mercenaries classified as Security Services. With rampant crime among its workers, Security Services is both strict and brutal, although they often follow a very different playbook than Starfleet.</p>', 80, 'y', 'playing', 0, 1),
(27, 'Foreign Diplomatic Residents', '<p>Faltan Command includes an Diplomatic Corps facility where Starfleet has invited regional powers to set up permanent consulates. Several regional powers have accepted this invitation, while others only send temporary envoys when situations arise, and a few have not responded at all.</p>', 99, 'y', 'playing', 0, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `nova_manifests`
--

INSERT INTO `nova_manifests` (`manifest_id`, `manifest_name`, `manifest_order`, `manifest_desc`, `manifest_header_content`, `manifest_display`, `manifest_default`, `manifest_view`) VALUES
(1, 'Primary Manifest', 0, 'This is the primary manifest used by the sim.', 'Update your manifest header content from the manifest management page.', 'y', 'y', '$(''tr.active'').show();,$(''tr.npc'').show();');

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
(3, 'Mission', 0, 3, 'sim/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(4, 'Infobase', 0, 4, 'wiki/index', 'onsite', 'none', 'n', '', 0, 'main', 'main', 'y', 1),
(6, 'Control Panel', 0, 5, 'admin/index', 'onsite', 'y', 'n', '', 0, 'main', 'main', 'y', 1),
(7, 'Log In', 0, 7, 'login/index', 'onsite', 'n', 'n', '', 0, 'main', 'main', 'y', 1),
(8, 'Log Out', 0, 8, 'login/logout', 'onsite', 'y', 'n', '', 0, 'main', 'main', 'y', 1),
(9, 'Welcome', 0, 0, 'main/index', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(10, 'News', 0, 2, 'main/news', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(16, 'Manifest', 0, 0, 'personnel/index', 'onsite', 'none', 'n', '', 0, 'sub', 'personnel', 'y', 1),
(17, 'Chain of Command', 0, 4, 'personnel/coc', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(19, 'Join', 0, 7, 'main/join', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(20, 'The Sim', 0, 0, 'sim/index', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(21, 'Missions', 0, 1, 'sim/missions', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(22, 'Mission Groups', 0, 2, 'sim/missions/group', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(23, 'Personal Logs', 0, 3, 'sim/listlogs', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'y', 1),
(24, 'Stats', 0, 4, 'sim/stats', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'n', 1),
(25, 'Crew Awards', 0, 5, 'sim/awards', 'onsite', 'none', 'n', '', 0, 'sub', 'sim', 'n', 1),
(26, 'Tour', 1, 6, 'sim/tour', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'n', 1),
(27, 'Specifications', 1, 1, 'sim/specs', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'y', 1),
(28, 'Deck Listing', 1, 5, 'sim/decks', 'onsite', 'none', 'n', '', 0, 'sub', 'main', 'n', 1),
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
(18, 'welcome_msg', 'Welcome: Message', '<p>Faltan Station is a regional operations center within Bravo Fleet’s Task Force 93. Home to a unit responsible for rapid response scenarios in the Raeyan Sector and Raeyan Transit Corridor, a Corps of Engineering division tasked with revitalizing Starfleet’s presence in the region, and Diplomatic Corps detachment charged with keeping the peace in this fragile sector of space, Faltan Station has come a long way from its quiet roots as a backwater administrative outpost.</p>', 'message', 'n'),
(19, 'welcome_facility', 'Welcome: Facility', '<h2>Facility</h2>\n\n<p>Faltan Station is a name collectively given to a pair of facilities in the Faltan System:</p>\n\n<div class="left-thumbs-160-60">\n<a href=""><img src="[[asset:images/welcome/facility-command.png]]"></a>\n<div class="description">\n<h4><a href="">Faltan Command</a></h4>\n<p>An administrative facility roughly forty miles from the Faltan III Colony, Faltan Command hosts a Starfleet regional command center, a Diplomatic Corps complex including several foreign consulates, a Marine Corps garrison and more. <a href="">Continue reading...</a></p>\n</div>\n<a href=""><img src="[[asset:images/welcome/facility-engineering]]"></a>\n<div class="description">\n<h4><a href="">Faltan Engineering</a></h4>\n<p>On the outskirts of the Caerus Mining Outpost, Faltan Engineering is a Corps of Engineers facility including several refitted refineries and six old mining craters converted into docks capable of servicing any regional asset including capital ships. <a href="">Continue reading...</a></p>\n</div>\n</div>', 'message', 'n'),
(20, 'welcome_vessels', 'Welcome: Vessels', '<h2>Assigned Vessels</h2>\n\n<p>For rapid response scenarios, three vessels are permanently assigned to Faltan Station:</p>\n\n<div class="row-fluid">\n    <div class="span4" style="text-align: center">\n        <a href=""><img src="[[asset:images/welcome/vessel-osiris.png]]"></a>\n        <p class="tight-label">\n            <a href="">USS Osiris</a>\n            <small class="muted"><br>Diligent-class</small>\n        </p>\n    </div>\n    <div class="span4" style="text-align: center">\n        <a href=""><img src="[[asset:images/welcome/vessel-anubis.png]]"></a>\n        <p class="tight-label">\n            <a href="">USS Anubis</a>\n            <small class="muted"><br>Defiant-class</small>\n        </p>\n    </div>\n    <div class="span4" style="text-align: center">\n        <a href=""><img src="[[asset:images/welcome/vessel-isis.png]]"></a>\n        <p class="tight-label">\n            <a href="">USS Isis</a>\n            <small class="muted"><br>Nova-class</small>\n        </p>\n    </div>\n</div>', 'message', 'n'),
(21, 'welcome_staff', 'Welcome: Staff', '<h2>Command Staff</h2>\n<div class="right-thumbs-3-128 clearfix">\n    <div class="thumbs">\n        <div class="thumb">\n            <a href=""><img src="[[asset:images/welcome/staff-reyes.png]]"></a>\n            <p class="tight-label"><a href="">RADM Reyes</a><small class="muted"><br>Commanding Officer<br>Faltan Station</small></p>\n        </div>\n        <div class="thumb">\n            <a href=""><img src="[[asset:images/welcome/staff-lewis.png]]"></a>\n            <p class="tight-label"><a href="">CDR Lewis</a><small class="muted"><br>Executive Officer<br>Faltan Station</small></p>\n        </div>\n        <div class="thumb">\n            <a href=""><img src="[[asset:images/welcome/staff-chadwick.png]]"></a>\n            <p class="tight-label"><a href="">R. FADM Chadwick</a><small class="muted"><br>Ambassador-at-Large<br>Raeyan Sector</small></p>\n        </div>\n    </div>\n    <div class="description">\n        <p>Faltan Station is commanded by Rear Admiral Allison Reyes. As Director of Starfleet Research and Development, Reyes manages Corps of Engineers operations in the Raeyan Sector and Transit Corridor, as well as oversees Fleet operations within the regional theater.</p>\n        <p>She is joined by Commander Jake Lewis, Station Executive Office and Rapid Response Unit Commanding Officer; Retired Fleet Admiral Robert Chadwick, Raeyan Sector Consul-General; Commodore Charles Ainsworth, Command Adjutant of Starfleet Research and Development; Brigadier General Mike Brancer, Commanding Officer of the 93rd Marine Expeditionary Unit; and over fifteen thousand officers, marines, corpsmen, diplomats, and civilians, operating in a tenuous region of space nestled between several interstellar powers, alongside an alien colony, an opportunistic mining venture, and more.</p>\n    </div>\n</div>', 'message', 'n'),
(22, 'welcome_more', 'Welcome: More', '<h1 class="page-head"><center>Want to learn more?</center></h1>\n\n<div class="row-fluid" style="text-align:center">\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-station.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Station</h3>\n        </a>\n        <p class="muted">Faltan Station both lies at an interstellar crossroads and is home to a diverse group including Starfleet, the Faltan peoples, and the Caerus Mining Company.</p>\n    </div>\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-personnel.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Personnel</h3>\n        </a>\n        <p class="muted">Faltan Station is inhabited by a diverse group including officers, enlisteds, marines, diplomats, corpsmen and civilians.</p>\n    </div>\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-missions.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Missions</h3>\n        </a>\n        <p class="muted">From engineering development to tactical  engagements to regional diplomacy, the story of Faltan Station is rich and varied.</p>\n    </div>\n    <div class="span3">\n        <a href="" style="text-decoration:none;">\n        <img src="[[asset:images/welcome/more-apply.png]]" style="opacity:0.4">\n        <h3 class="page-subhead" style="line-height:18px;height:18px;">Apply</h3>\n        </a>\n        <p class="muted">Faltan Station is the collaborative product of its writers. Are you interested in becoming part of the story?</p>\n    </div>\n</div>', 'message', 'n'),
(23, 'about_head', 'About Header', 'About', 'title', 'n'),
(24, 'about_premise', 'About: Premise', '<h2>The Story Up To Now</h2>\n\n<h3>The Tragedy of Algorab</h3>\n\n<p>In August 2387, the USS Enigma was dispatched to Algorab to provide security for a Romulan government summit meant to address the discontent of planetary governors who felt marginalized by the shift in power following the destruction of Romulus and the establishment of a new provisional government on Rator III. The mission did not go as planned. Caught up in a Tal''Shiar plot to achieve greater power within the Empire, the crew was implicated in the assassination of a Romulan Senator Vorelian on August 17, 2387. As they''d been covertly running surveillance on the summit for Starfleet Intelligence, they had proof that acquitted them. Fearing that an admonition they''d been spying on the delegates would destabilize the Federation''s altruistic image with the Empire, Starfleet Intelligence forbade them from demonstrating their innocence to either Fleet Command or the Romulan Empire. Instead, they were recalled and the Tal Diann was brought in to render security for the remainder of the Summit.</p>\n\n<p>Before the assassination, the political scene was divided, little common agreement between the various factions. However, after the assassination of Vorelian and the withdrawal of the USS Enigma, the summit underwent a change in tone, the delegates now united in their fear of the Starfleet''s meddling. It was unanimously concluded that the Empire''s borders must be closed to all outside influence. To support and enforce this shift, the Romulan Star Navy was dispatched to harden their borders with both the Federation and the Klingon Empire. Filling in the gap of internal security, Tal''Shiar Chairwoman Sonara T''Daran was given the seat she sought on the Continuing Committee and the Tal''Shiar was given greater responsibility for internal policing.</p>\n\n<h3>The Federation-Romulan Crisis of 2387</h3>\n\n<p>The Federation was immediately thrust into a diplomatic crisis. The closure of the Romulan borders would cut Starfleet off from the Raeyan Sector, given that the Hobus Event had destabilized the Raeyan Portal, and it also threatened possible Romulan aggression. Former Admiral and famed diplomat, Robert Chadwick was rushed from Earth on standby for what would come, while Fleet Admiral Oliver Tidwell set off across Federation territory from the Talarian region to oversee the operation.</p>\n\n<p>The USS Enigma, en route back from Algorab, knew not about these developments until Commander Lewis arrived at Deep Space 6 for a debriefing. However, instead of a face-to-face with Rear Admiral Bryl, he was instead carted to a conference room where he was debriefed by former Fleet Admiral Robert Chadwick, who informed him that he and his crew had been responsible for starting an interstellar crisis. Only then did the magnitude of the event set in with Commander Lewis. Retaining his fidelity to Starfleet Intelligence, Lewis maintained his innocence but did not inform the Fleet Admiral of the proof they had at their innocence.</p>\n\n<h3>The Treaty of Nelvana</h3>\n\n<p>On September 10, Starfleet was invited to Nelvana to discuss new terms regarding their activity within the Romulan Empire. Rear Admiral Bryl, Task Force 93 Commanding Officer, and former Fleet Admiral Robert Chadwick, Director of the Diplomatic Corps, departed at once from Deep Space 6, while Fleet Admiral Tidwell was still en route from across Federation space. The Fleet Admiral arrived at Deep Space 6 on September 18, just as negotiations on Nelvana were drawing to a close. Without time to reach Nelvana himself, Fleet Admiral Tidwell was kept abreast of the proceedings from Deep Space 6. The Treaty of Nelvana was signed two days later, closing the Romulan borders to the Federation while ceding a five light year wide corridor of territory on their border with the Klingon Empire to the Federation to allow continued transit to the Raeyan Sector.</p>\n\n<p>During his time on Deep Space 6, Tidwell started inquiring more deeply about what had transpired on Algorab. As he worked his way through the mirror maze of Starfleet Intelligence, he eventually reached Rear Admiral Frank DeVoe, the Deputy Chief of Intelligence Special Operations. The man admitted to the Fourth Fleet Commanding Officer that they had evidence not only acquitting the USS Enigma but also implicating the Tal''Shiar. The two agreed that this information would not be broadly shared, but it changed the Fleet Admiral''s opinion of Commander Lewis and his crew, a group who were now well out of favor with the Admiralty. In a face-to-face meeting with the Commander, Tidwell explained to Lewis that he''d and his crew were being reassigned to Faltan Station, a new Corps of Engineers base in the reactivated Raeyan Sector.</p>', 'message', 'n'),
(25, 'about_station', 'About: Station', '<h2>Faltan Station</h2>\n\n<p>With the advent of the Raeyan Transit Corridor, Starfleet recognized a deficit in coverage of the region. The Task Force 93 headquarters were moved to Draken, a system on the western edge of the Raeyan Transit Corridor. While this base could service Task Force 93''s old area of operations and the western side of the Raeyan Transit Corridor, there was no comparable base along the eastern edge of the Raeyan Transit Corridor in the Raeyan Sector. Most of the bases in Raeyan Sector had been decommissioned, with the exception of Hawkeye Island, and the Raeya System where it resided was simply too far from the Corridor to service the region. Starbase 911 might have served this purpose from the Union system, but, lacking foresight, it had been destroyed a year earlier when the Federation believed they were pulling out of the Raeyan Sector. The Faltan system, which formerly housed an administrative facility to oversee mining operations on the sole moon of Faltan III, was thus activated as the new regional operations facility.</p>\n\n<p>The Faltan system is in a strategically important region of space, three light years from the eastern edge of the Raeyan Transit Corridor and ten light years from both the Romulan and Klingon borders.</p>\n\n<h3>Facility</h3>\n\n<p>Faltan Station is the name collectively given to a pair of facilities in the system, Faltan Command in a mountain river valley 40 miles from the Faltan colony, and Faltan Engineering, a Corps of Engineers facility on the outskirts of the lunar mining colony.</p>\n\n<ul>\n<li>Faltan Command - An administrative facility built in a mountain river valley on Faltan III roughly forty miles from the Faltan colony, Faltan Command was originally constructed in 2380 by Starfleet to oversee mining operations on the Faltan lunar colony and liaise with the Faltans. In 2387, it has found new purpose as a command, engineering and diplomatic hub of Starfleet operations in the southern Raeyan Sector and eastern Raeyan Transit Corridor.</li>\n<li>Faltan Engineering - Over their thirteen year stay, the mining colony has developed a large footprint across Faltan III''s sole moon. In 2387, the mining collective agreed to cede a region already stripped of deuterium deposits to the Corps of Enginers. Refitting an old refining plant as a manufacturing facility and building docking facilities in several old mining craters, the facility is now capable of supporting servicing any regional asset, including capital ships.</li>\n</ul>', 'message', 'n'),
(26, 'about_system', 'About: System', '<h2>Faltan System</h2>\n\n<p>Four hundred years ago, a technologically advanced humanoid species from the furthest reaches of the Delta Quadrant attempted to test a subspace folding technology. While the drive worked, it did so unpredictably and flung them over a 100,000 light years across the galaxy into the Raeyan Sector. Unwilling to risk another attempt, the crew elected to wait for rescue, setting up a small outpost in a large desert valley on the third planet of an otherwise uninhabited system.</p>\n\n<p>Unfortunately, as the years went by, it became clear that there would be no rescue. They were on their own, forced to build a new society far from their home across the galaxy. Using advanced technologies from their vessel, the small outpost grew into a thriving metropolis, their original crew growing to over two hundred thousand across sixteen generations.</p>\n\n<p>In Federation common, this species became known as the Faltans, derived from the proto-Germanic word for "fold" based on their method of arrival in the region.</p>\n\n<p>In 2375, an independent mining company arrived in the system while surveying the sector. They found that the sole moon of Faltan III had highly concentrated deuterium deposits, and they wanted to set up a facility to refine the ore. However, the Faltans had already set up a facility on the moon to support the growth of their colony on the planet below. With technology appearing on par with that of the Federation, although very limited in scale, the decision was made to approach them directly to elicit mining rights. The Faltans shared a bit about their history and explained that they were focused on survival with little interest in the affairs of others. As such, they informed the mining company that they were free to set up shop so long as it didn''t interfere with their own vitality.</p>\n\n<p>Unfortunately, as the mining colony grew, it quickly became a nuisance to its gracious hosts. With a population of workers growing to over fifty thousand, the lunar mining colony became ridden with crime, and their profit-focused techniques were considered dirty and wasteful by the Faltans. This tension came to a head by 2380, and Starfleet was brought into the region to mediate. In the outcome of this negotiation, it was decided that Starfleet would set up a small base on Faltan III to ensure that the lunar mining operations conformed with both Faltan and Federation standards. This base was located in a mountainous region roughly forty miles from the desert valley where the Faltan colony was located.</p>\n\n<p>At first, this arrangement seemed to have restored the peace. The Faltans co-existed well with the Federation, sharing many of their ideals, and the mining operation cleaned up its act. However, with the withdrawal from the Raeyan Sector in early 2386, only a small administrative staff was left on the Faltan III base to maintain order. The mining colony continued to sprawl out for new digs, and they began reverting to some of their old ways, tension returning between the Faltans, the Federation and the mining cooperative.</p>\n\n<p>Following the Treaty of Nelvana in late 2387, Faltan III became a subject of interest again as Task Force 93 needed a base that could service the eastern side of the Raeyan Transit Corridor and the southern portion of the Raeyan sector.</p>', 'message', 'n'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=142 ;

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
(81, 'Chief Security Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(82, 'Chief Operations Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(83, 'Chief Engineering Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(84, 'Chief Science Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(85, 'Chief Medical Officer', '', 14, 99, 1, 'y', 'senior', 'n'),
(86, 'Chief Counselor', '', 14, 99, 1, 'y', 'senior', 'n'),
(87, 'Director', '', 15, 1, 0, 'y', 'senior', 'n'),
(88, 'Deputy Director', '', 15, 2, 0, 'y', 'senior', 'n'),
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
(105, 'Unit Commanding Officer', '', 16, 99, 0, 'y', 'senior', 'n'),
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
(140, 'Infiltration Specialist', '', 24, 31, 1, 'y', 'enlisted', 'n');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=363 ;

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
(362, 'Fleet Admiral (retired)', 'Ret. FADM', 'r-a5', 1, 'y', 1);

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
('72179d690c94341784f018cbb647508d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko) Version/6.0.3 Safari/536.28.10', 1370329628, 'a:14:{s:9:"user_data";s:0:"";s:6:"userid";s:1:"1";s:9:"skin_main";s:6:"faltan";s:10:"skin_admin";s:7:"default";s:9:"skin_wiki";s:6:"faltan";s:12:"display_rank";s:7:"default";s:8:"language";s:7:"english";s:8:"timezone";s:3:"UM8";s:3:"dst";s:1:"0";s:9:"main_char";s:1:"1";s:10:"characters";a:2:{i:0;s:1:"1";i:1;s:1:"2";}s:4:"role";s:1:"1";s:6:"access";a:54:{s:11:"admin/index";i:0;s:12:"upload/index";i:0;s:13:"upload/manage";i:0;s:14:"messages/index";i:0;s:11:"write/index";i:0;s:17:"write/missionpost";i:0;s:17:"write/personallog";i:0;s:14:"write/newsitem";i:0;s:13:"site/settings";i:0;s:13:"site/messages";i:0;s:10:"site/roles";i:0;s:12:"site/bioform";i:0;s:14:"site/specsform";i:0;s:13:"site/tourform";i:0;s:16:"site/dockingform";i:0;s:10:"site/menus";i:0;s:19:"site/catalogueranks";i:0;s:19:"site/catalogueskins";i:0;s:13:"site/simtypes";i:0;s:12:"manage/specs";i:0;s:12:"manage/decks";i:0;s:15:"manage/comments";i:0;s:16:"manage/positions";i:0;s:12:"manage/depts";i:0;s:12:"manage/ranks";i:0;s:13:"manage/awards";i:0;s:11:"manage/tour";i:0;s:13:"manage/docked";i:0;s:15:"manage/missions";i:0;s:12:"manage/posts";s:1:"2";s:11:"manage/logs";s:1:"2";s:11:"manage/news";s:1:"2";s:15:"manage/newscats";i:0;s:10:"report/loa";i:0;s:15:"report/versions";i:0;s:15:"report/activity";i:0;s:14:"report/posting";i:0;s:17:"report/moderation";i:0;s:17:"report/milestones";i:0;s:23:"report/awardnominations";i:0;s:19:"report/applications";i:0;s:12:"report/stats";i:0;s:16:"characters/index";i:0;s:15:"characters/npcs";s:1:"3";s:14:"characters/coc";i:0;s:14:"characters/bio";s:1:"3";s:17:"characters/create";s:1:"2";s:17:"characters/awards";i:0;s:12:"user/account";s:1:"2";s:13:"user/nominate";s:1:"2";s:9:"wiki/page";s:1:"3";s:15:"wiki/categories";i:0;s:9:"site/bans";i:0;s:14:"site/manifests";i:0;}s:8:"my_links";a:1:{i:0;s:76:"<a href="http://localhost/bfio/faltan/index.php/user/status">Request LOA</a>";}}'),
('ffe5acd5dfb8e49dd761dbd08b3bba47', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.28.10 (KHTML, like Gecko) Version/6.0.3 Safari/536.28.10', 1370316814, 'a:14:{s:9:"user_data";s:0:"";s:6:"userid";s:1:"1";s:9:"skin_main";s:6:"faltan";s:10:"skin_admin";s:7:"default";s:9:"skin_wiki";s:6:"faltan";s:12:"display_rank";s:7:"default";s:8:"language";s:7:"english";s:8:"timezone";s:3:"UM8";s:3:"dst";s:1:"0";s:9:"main_char";s:1:"1";s:10:"characters";a:2:{i:0;s:1:"1";i:1;s:1:"2";}s:4:"role";s:1:"1";s:6:"access";a:54:{s:11:"admin/index";i:0;s:12:"upload/index";i:0;s:13:"upload/manage";i:0;s:14:"messages/index";i:0;s:11:"write/index";i:0;s:17:"write/missionpost";i:0;s:17:"write/personallog";i:0;s:14:"write/newsitem";i:0;s:13:"site/settings";i:0;s:13:"site/messages";i:0;s:10:"site/roles";i:0;s:12:"site/bioform";i:0;s:14:"site/specsform";i:0;s:13:"site/tourform";i:0;s:16:"site/dockingform";i:0;s:10:"site/menus";i:0;s:19:"site/catalogueranks";i:0;s:19:"site/catalogueskins";i:0;s:13:"site/simtypes";i:0;s:12:"manage/specs";i:0;s:12:"manage/decks";i:0;s:15:"manage/comments";i:0;s:16:"manage/positions";i:0;s:12:"manage/depts";i:0;s:12:"manage/ranks";i:0;s:13:"manage/awards";i:0;s:11:"manage/tour";i:0;s:13:"manage/docked";i:0;s:15:"manage/missions";i:0;s:12:"manage/posts";s:1:"2";s:11:"manage/logs";s:1:"2";s:11:"manage/news";s:1:"2";s:15:"manage/newscats";i:0;s:10:"report/loa";i:0;s:15:"report/versions";i:0;s:15:"report/activity";i:0;s:14:"report/posting";i:0;s:17:"report/moderation";i:0;s:17:"report/milestones";i:0;s:23:"report/awardnominations";i:0;s:19:"report/applications";i:0;s:12:"report/stats";i:0;s:16:"characters/index";i:0;s:15:"characters/npcs";s:1:"3";s:14:"characters/coc";i:0;s:14:"characters/bio";s:1:"3";s:17:"characters/create";s:1:"2";s:17:"characters/awards";i:0;s:12:"user/account";s:1:"2";s:13:"user/nominate";s:1:"2";s:9:"wiki/page";s:1:"3";s:15:"wiki/categories";i:0;s:9:"site/bans";i:0;s:14:"site/manifests";i:0;}s:8:"my_links";a:1:{i:0;s:76:"<a href="http://localhost/bfio/faltan/index.php/user/status">Request LOA</a>";}}');

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
(2, 'sim_year', '', '', 'n'),
(3, 'sim_type', '2', '', 'n'),
(4, 'maintenance', 'off', '', 'n'),
(5, 'skin_main', 'faltan', '', 'n'),
(6, 'skin_admin', 'default', '', 'n'),
(7, 'skin_wiki', 'faltan', '', 'n'),
(8, 'skin_login', 'faltan', '', 'n'),
(9, 'display_rank', 'default', '', 'n'),
(10, 'bio_num_awards', '10', '', 'n'),
(11, 'allowed_chars_playing', '2', '', 'n'),
(12, 'allowed_chars_npc', '10', '', 'n'),
(13, 'system_email', 'on', '', 'n'),
(14, 'email_subject', '[Faltan]', '', 'n'),
(15, 'timezone', 'UTC', '', 'n'),
(16, 'daylight_savings', 'FALSE', '', 'n'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `nova_specs`
--

INSERT INTO `nova_specs` (`specs_id`, `specs_name`, `specs_order`, `specs_display`, `specs_images`, `specs_summary`) VALUES
(1, 'Faltan Command', 0, 'y', '', 'An administrative facility built in a mountain river valley on Faltan III roughly forty miles from the Faltan colony, Faltan Command was originally constructed in 2380 by Starfleet to oversee mining operations on the Faltan lunar colony and liaise with the Faltans. In 2387, it has found new purpose as a command, engineering and diplomatic hub of Starfleet operations in the southern Raeyan Sector and eastern Raeyan Transit Corridor.'),
(2, 'Faltan Engineering', 1, 'y', '', 'Over their thirteen year stay, the mining colony has developed a large footprint across Faltan III''s sole moon. In 2387, the mining collective agreed to cede a region already stripped of deuterium deposits to the Corps of Enginers. Refitting an old refining plant as a manufacturing facility and building docking facilities in several old mining craters, the facility is now capable of supporting servicing any regional asset, including capital ships.'),
(3, 'USS Osiris', 10, 'y', '', 'Multi-purpose frigate used by the Faltan Station Rapid Response Unit.'),
(4, 'USS Anubis', 11, 'y', '', 'Tactical escort used by the Faltan Station Rapid Response Unit.'),
(5, 'USS Isis', 12, 'y', '', 'Science surveyor used by the Faltan Station Rapid Response Unit.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `nova_specs_data`
--

INSERT INTO `nova_specs_data` (`data_id`, `data_item`, `data_field`, `data_value`, `data_updated`) VALUES
(1, 1, 1, 'Planetary Base', 1370327438),
(2, 1, 2, 'Regional Operations Center', 1370327438),
(3, 1, 3, '', 1370327438),
(4, 1, 4, '', 1370327438),
(5, 1, 5, '', 1370327438),
(6, 1, 6, '', 1370327438),
(7, 1, 7, '', 1370327438),
(8, 1, 8, '', 1370327438),
(9, 1, 9, '', 1370327438),
(10, 1, 10, '', 1370327438),
(11, 1, 11, '', 1370327438),
(12, 1, 12, '', 1370327438),
(13, 1, 13, '', 1370327438),
(14, 1, 14, '', 1370327438),
(15, 1, 15, '', 1370327438),
(16, 1, 16, '', 1370327438),
(17, 1, 17, '', 1370327438),
(18, 1, 18, '', 1370327438),
(19, 1, 19, '', 1370327438),
(20, 1, 20, '', 1370327438),
(21, 1, 21, '', 1370327438),
(22, 1, 22, '', 1370327438),
(23, 1, 23, '', 1370327438),
(24, 1, 24, '', 1370327438),
(25, 2, 1, 'Corps of Engineering Facility', 1370327481),
(26, 2, 2, '', 1370327481),
(27, 2, 3, '', 1370327481),
(28, 2, 4, '', 1370327481),
(29, 2, 5, '', 1370327481),
(30, 2, 6, '', 1370327481),
(31, 2, 7, '', 1370327481),
(32, 2, 8, '', 1370327481),
(33, 2, 9, '', 1370327481),
(34, 2, 10, '', 1370327481),
(35, 2, 11, '', 1370327481),
(36, 2, 12, '', 1370327481),
(37, 2, 13, '', 1370327481),
(38, 2, 14, '', 1370327481),
(39, 2, 15, '', 1370327481),
(40, 2, 16, '', 1370327481),
(41, 2, 17, '', 1370327481),
(42, 2, 18, '', 1370327481),
(43, 2, 19, '', 1370327481),
(44, 2, 20, '', 1370327481),
(45, 2, 21, '', 1370327481),
(46, 2, 22, '', 1370327481),
(47, 2, 23, '', 1370327481),
(48, 2, 24, '', 1370327481),
(49, 3, 1, 'Diligent', 1370328229),
(50, 3, 2, 'Multi-Purpose Frigate', 1370328229),
(51, 3, 3, '80 years', 1370328229),
(52, 3, 4, '1 year', 1370328229),
(53, 3, 5, '4 years', 1370328229),
(54, 3, 6, '187.5 meters', 1370328229),
(55, 3, 7, '103.7 meters', 1370328229),
(56, 3, 8, '37.2 meters', 1370328229),
(57, 3, 9, '8', 1370328229),
(58, 3, 10, '20', 1370328229),
(59, 3, 11, '85', 1370328229),
(60, 3, 12, '15', 1370328229),
(61, 3, 13, '0', 1370328229),
(62, 3, 14, '240', 1370328229),
(63, 3, 15, 'Warp 7', 1370328229),
(64, 3, 16, 'Warp 9.2', 1370328229),
(65, 3, 17, 'Warp 9.75', 1370328229),
(66, 3, 18, 'Multi-Layered Shielding System\nDuranium/Tritanium Double Hull\nAblative Armor', 1370328229),
(67, 3, 19, '11 Type-X phaser arrays\n5 Torpedo Launchers (2 forward, 3 aft)', 1370328229),
(68, 3, 20, '50 Quantum Torpedoes\n50 Photon Torpedoes\n2 Tri Cobalt Torpedoes', 1370328229),
(69, 3, 21, '1', 1370328229),
(70, 3, 22, '1 Type-9 Shuttle\n1 Type-11 Shuttle', 1370328229),
(71, 3, 23, '', 1370328229),
(72, 3, 24, '', 1370328229),
(73, 4, 1, 'Defiant', 1370328055),
(74, 4, 2, 'Tactical Escort', 1370328055),
(75, 4, 3, '55 years', 1370328055),
(76, 4, 4, '3 months', 1370328055),
(77, 4, 5, '4 years', 1370328055),
(78, 4, 6, '119.5 meters', 1370328055),
(79, 4, 7, '80.4 meters', 1370328055),
(80, 4, 8, '18.8 meters', 1370328055),
(81, 4, 9, '5', 1370328055),
(82, 4, 10, '15', 1370328055),
(83, 4, 11, '35', 1370328055),
(84, 4, 12, '0', 1370328055),
(85, 4, 13, '0', 1370328055),
(86, 4, 14, '80', 1370328055),
(87, 4, 15, 'Warp 7', 1370328055),
(88, 4, 16, 'Warp 9', 1370328055),
(89, 4, 17, 'Warp 9.5', 1370328055),
(90, 4, 18, 'Multi-Layered Shielding System\nDuranium/Tritanium Double Hull\nAblative Armor', 1370328055),
(91, 4, 19, '4 Type-XII pulse phasers\n3 Type-IX phaser arrays\n3 Torpedo Launchers (2 forward, 1 aft)', 1370328055),
(92, 4, 20, '90 Quantum Torpedoes', 1370328055),
(93, 4, 21, '1', 1370328055),
(94, 4, 22, '2 Type-9 Shuttles', 1370328055),
(95, 4, 23, '', 1370328055),
(96, 4, 24, '', 1370328055),
(97, 5, 1, 'Nova', 1370328206),
(98, 5, 2, 'Surveyor', 1370328206),
(99, 5, 3, '50 years', 1370328206),
(100, 5, 4, '6 months', 1370328206),
(101, 5, 5, '2 years', 1370328206),
(102, 5, 6, '165 meters', 1370328206),
(103, 5, 7, '62 meters', 1370328206),
(104, 5, 8, '34 meters', 1370328206),
(105, 5, 9, '8', 1370328206),
(106, 5, 10, '15', 1370328206),
(107, 5, 11, '65', 1370328206),
(108, 5, 12, '0', 1370328206),
(109, 5, 13, '5', 1370328206),
(110, 5, 14, '180', 1370328206),
(111, 5, 15, 'Warp 5', 1370328206),
(112, 5, 16, 'Warp 8', 1370328206),
(113, 5, 17, 'Warp 8.55', 1370328206),
(114, 5, 18, 'Regenerative Shielding System\nDuranium/Tritanium Double Hull', 1370328206),
(115, 5, 19, '11 Type-IX phaser arrays\n3 Torpedo Launchers (2 forward, 1 aft)', 1370328206),
(116, 5, 20, '15 Quantum Torpedoes\n30 Photon Torpedoes\n3 Tri Cobalt Torpedoes', 1370328206),
(117, 5, 21, '1', 1370328206),
(118, 5, 22, '1 Type-9 Shuttle\n1 Type-11 Shuttle', 1370328206),
(119, 5, 23, '', 1370328206),
(120, 5, 24, '1 Waverider-class Runabout', 1370328206);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
(1, 'active', 'Jon Matterson', 'jonm@bravofleet.com', 'f05b9c64c26f7431f556f88b916e6729ad7df28e', 'May 4, 1989', '', 1, 1, 'y', 'y', 'y', 'y', 'UM8', '0', 'english', 1370191358, 0, 0, 1370329635, 'active', 'default', 'faltan', 'faltan', 'default', '', '', '', 2, '3d86fa0fce495ea07d119f7e381e1c857b69de29', 0, 'n', 'n', 'n', 'n', 'n', 'n', 'n', '84', 1370329623);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
