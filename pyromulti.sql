-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 02, 2013 at 02:10 PM
-- Server version: 5.5.22
-- PHP Version: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pyromulti`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_domains`
--

CREATE TABLE IF NOT EXISTS `core_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `site_id` int(11) NOT NULL,
  `type` enum('park','redirect') NOT NULL DEFAULT 'park',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`domain`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_settings`
--

CREATE TABLE IF NOT EXISTS `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

--
-- Dumping data for table `core_settings`
--

INSERT INTO `core_settings` (`slug`, `default`, `value`) VALUES
('date_format', 'g:ia -- m/d/y', 'g:ia -- m/d/y'),
('lang_direction', 'ltr', 'ltr'),
('status_message', 'This site has been disabled by a super-administrator.', 'This site has been disabled by a super-administrator.');

-- --------------------------------------------------------

--
-- Table structure for table `core_sites`
--

CREATE TABLE IF NOT EXISTS `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `core_sites`
--

INSERT INTO `core_sites` (`id`, `name`, `ref`, `domain`, `active`, `created_on`, `updated_on`) VALUES
(1, 'Default Site', 'default', 'madfrontdev.com', 1, 1365315931, 0),
(2, 'Site Two', 'sitetwo', 'madfrontdev2.com', 1, 1365315931, 1366333377);

-- --------------------------------------------------------

--
-- Table structure for table `core_users`
--

CREATE TABLE IF NOT EXISTS `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `core_users`
--

INSERT INTO `core_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'toha.samba@gmail.com', '86a4303fb2e3c9d343228ab55b0d274df4214082', 'f13e9', 1, '', 1, '', 1365315928, 1365315928, 'yllumi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_api_keys`
--

CREATE TABLE IF NOT EXISTS `default_api_keys` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `level` varchar(2) COLLATE utf8_unicode_ci DEFAULT '1',
  `ignore_limits` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `default_api_logs`
--

CREATE TABLE IF NOT EXISTS `default_api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `params` text COLLATE utf8_unicode_ci,
  `api_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `authorized` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_key` (`api_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `default_api_logs`
--

INSERT INTO `default_api_logs` (`id`, `uri`, `method`, `params`, `api_key`, `ip_address`, `time`, `authorized`) VALUES
(1, 'pages/api', 'get', NULL, '', '127.0.0.1', 1367124357, 0);

-- --------------------------------------------------------

--
-- Table structure for table `default_blog`
--

CREATE TABLE IF NOT EXISTS `default_blog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gambar_blog` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `default_blog`
--

INSERT INTO `default_blog` (`id`, `site_id`, `created`, `updated`, `created_by`, `ordering_count`, `intro`, `title`, `slug`, `category_id`, `body`, `parsed`, `keywords`, `author_id`, `created_on`, `updated_on`, `comments_enabled`, `status`, `type`, `preview_hash`, `gambar_blog`) VALUES
(1, 1, '2013-04-20 19:16:00', '2013-04-20 19:16:00', 10, 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores accusamus ex illo expedita voluptas error commodi sunt necessitatibus magnam dolorem atque nemo autem id. Ratione laborum nisi dolorum iste illum.', 'First Post Siteone', 'first-post-siteone', 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae fugit sit reprehenderit reiciendis nihil. Dolorem eius consequatur ullam dolor qui minima itaque facere porro a quia deleniti ratione dolore unde?<br />\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt odit voluptates rerum id tempora nulla atque quam at voluptatum dignissimos officia ullam cum libero odio eius consequatur iure? Commodi quasi.', '', '1a015b4efdc115351ad0d10e184b1482', 10, 1366478160, 1366478160, '3 months', 'live', 'wysiwyg-advanced', '', 'ff48008499d6113'),
(2, 2, '2013-04-20 19:53:00', NULL, 2, 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'First Post Sitetwo', 'first-post-sitetwo', 1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '', 'b663b3c85f1ac6df9d633df46a002c0d', 2, 1366480380, 0, '3 months', 'live', 'wysiwyg-advanced', '', NULL),
(3, 1, '2013-06-01 13:10:00', '2013-06-01 13:10:00', 11, 3, 'sfg dfhgsgfsgs', 'Jojojo', 'jojojo', 0, 'dsfgs dfsg fsg afsfd', '', '', 11, 1370085000, 1370085000, '3 months', 'live', 'wysiwyg-advanced', '', 'dummy');

-- --------------------------------------------------------

--
-- Table structure for table `default_blog_categories`
--

CREATE TABLE IF NOT EXISTS `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `default_blog_categories`
--

INSERT INTO `default_blog_categories` (`id`, `site_id`, `slug`, `title`) VALUES
(1, 2, 'kategori-sitetwo', 'Kategori Sitetwo'),
(2, 1, 'kategori-siteone', 'Kategori Siteone');

-- --------------------------------------------------------

--
-- Table structure for table `default_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_ci_sessions`
--

INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('04583028d864beeedf7563794db2838f', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365308767, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('3b5dc5dc2d65f198b2c5bdac142f1276', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365308783, ''),
('1a3d6e8f18eb87ecf374445eb097807c', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365322866, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('755f1d4a925bc1396dcfd52c2e006655', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365322897, ''),
('31327836d086a24f48b5abb8fc9bcc1f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365387849, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('15132020a22e73122b399e48cd20cf9d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365329737, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('911877cc422c495b4305679cdc19c07b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365329738, ''),
('804e0e4fb0ea74d9dcf5b661becae735', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365329739, ''),
('c25c113bf7b03c554903b6e42657674e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365329745, ''),
('bc952ba4de21f6ba5c60d56a6aca0602', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1365329746, ''),
('b0451e04a74c38e86b3c28287e05cef8', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366206315, ''),
('4f056375312e6884aee7750c5a908868', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366248624, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('0b2a39f873c108a01103e1aff3484f0b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366207692, ''),
('239a3a83972aecc08c079b1964731932', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366206430, ''),
('2fbf190b998c9b158457401bda76fd0c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366480420, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('3dae8b2041de10317d812cae278254c7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366253946, ''),
('40435c4a8713eaea1cb976e91e57ade3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366254108, ''),
('3a22f09ca5c9f9a6587f394cdbf2ff1d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366254145, ''),
('fb85f818aa4748c4e0816ff0ee6bc6da', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366254329, ''),
('e7dfd0e4b1554e3afdb1a0347cf5367d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366254395, ''),
('b6a04bdc5fcb1f47b28b08d2c60f0433', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366254431, ''),
('9081310668b6defe373c64c2bc51d03d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366256008, ''),
('48a3dd4e316708e502a35c34fe28d449', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366256127, ''),
('6f91bdfaada7c081e99961c6363ce27a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366256168, ''),
('20f979d11007fb618c7335addc410f0e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366261820, ''),
('eea84fcbcfa67c3d2f98d13396cdcf60', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366261979, ''),
('39a83fbf4704f14ee924b5d37e40c70b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366261985, ''),
('f0c4fc3c7ee2e96fd65b598b17163114', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262042, ''),
('96ce94e6a90bbb9c63daff1555aa510e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262052, ''),
('ce1efec802613c421415deac9f0e4040', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262122, ''),
('d90dfd3608d7e29ae5ac192b6e49b107', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262127, ''),
('73480e2286b1e6283fc19919ab7bb5ca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262182, ''),
('d1900cd661185912f4e78cf2175824ca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262191, ''),
('19d0c3c66f41c21d57047c075cf8e3fc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262203, ''),
('eb8956f7ce94f8140840f916e2771c0e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262214, ''),
('8f01546298f3c233555d2915309f3462', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262218, ''),
('ba75a961b473606922115a552b4ab905', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262232, ''),
('502514cda23b50b2c9df180d72aaf407', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262298, ''),
('bb8bc5e7dda7fd7c98788d3c168ed3e6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262314, ''),
('9bfb37b0c35da14c2238d1e99937d3b0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262329, ''),
('2e5cd3cdb11ac730d35c4aacb9d1eede', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262399, ''),
('9c7d141efc267e4f2d7d4ea79356a098', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262424, ''),
('5da6a071e0ba259ff2ec24392db08511', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262430, ''),
('a503e9c3f06c228cccf0de19a217ba6c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262926, ''),
('5fc40cb09cc99bc8ac88a118e8e153a4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262952, ''),
('08011f21b9fe70b9506bc3a311895d92', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366262967, ''),
('eb76ef0b39cf2c8a8f44580b3bd4670e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366263089, ''),
('eb066ed54918ee8d906a04e6c3adfb84', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366263185, ''),
('04a29d1b77f0eafe5110e4010f038a97', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366263241, ''),
('3c316b9b401e8c830fe43ac7309de0fe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366263291, ''),
('2dfe590a257ee46f1145e25ca46f3943', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366263316, ''),
('a08f82aff0ceebc73f9c0464fdf18588', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366263540, ''),
('3c4d7d17bce19ad506dab5afdb450575', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366264103, ''),
('0fcc06d950d9dba6cbde14d51753cdd7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366264138, ''),
('b8361ef0e733f741da7a4db26d76b806', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366264164, ''),
('16ae47aeed926c702eab76121888248b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265242, ''),
('e2cf075041826daa8d3bd72312f0b1ae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265261, ''),
('03ad358f0c84ad46bc3ea67edd385731', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265695, ''),
('d1fbb2f620b9e17c4229ce75f923e5b2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265744, ''),
('8972017404890862fe3f04141a963551', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366326410, ''),
('49023a83d9a29a6ce6dc352e52f24b3b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265776, ''),
('40da7197b1703810b847d7eaae4c905a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265835, ''),
('037e9bab174e16912824583ca17789ca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265865, ''),
('728c84ddd37d99a5f63314410bb8d81d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265875, ''),
('f7aad6b6ef03159b2d7f5a7a797e3edd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265906, ''),
('f92e6786fba4f3bdbde2fbf7b81c1945', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265934, ''),
('64cd3447e8c17633572182fa219e390b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265947, ''),
('d5fd6c55ea307196b619cf4afd501d6e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265957, ''),
('3da79c0a72fa691312b5202c02af89ac', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265982, ''),
('539ec28937c9a85aa1c52856ef2f90ab', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366265997, ''),
('b61f15dac553973bdf2928c124594667', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266028, ''),
('3d9eda9b45f7720b458cd158737046f4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266043, ''),
('a02a7762397451e0dfa38df0b2b197b8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266059, ''),
('097b0aec0ebe910bfc02b48a3212490c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266064, ''),
('1fb86050729b4904bef6854ddac7b1ff', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266072, ''),
('004134807e68a1aa0b7dd6174d2e7496', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266084, ''),
('6e0166898b8c580585f085809a4c5b65', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266415, ''),
('6ec9ef8d202040fc13e3361c493f7187', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266426, ''),
('53b44b8175cc2aee03d0beba647e7397', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266457, ''),
('dedc8cf4e6ea0fa51c6797c10b1f0205', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266460, ''),
('86caf30c80af8cde149a52dd7d35e327', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266474, ''),
('1e03c8a30f4e314d4eb9db0aa6e639a5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266483, ''),
('a59da878630bc841bdc8e0c565bfd59c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366266491, ''),
('8fd716a9b6f6c609419e76d9ba4c51f5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366267608, ''),
('9969a1fd4977d4e94ed6d7c6f3272c94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366267627, ''),
('bbeb904a1d6ffa76086a133f85230779', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366267682, ''),
('01b098c3b64af5e5b50200baf7bde78f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366267693, ''),
('2af6ed47cda1bf2fbee48c1ce75cd1fb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366267709, ''),
('234d2f44f446c44676fa0cb7c6c5621c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366267789, ''),
('d18a3e71df31e39cca873407314ab499', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366267843, ''),
('9de561e9f19eede538fae2c56c4033bc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270018, ''),
('e1c9dd1d2edfce8b94563454be92a5ff', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270167, ''),
('fa1b512c08a8e43f2b39028753c60123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270295, ''),
('b38e68d8b69633ec5d18e4cd950ef7e5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270414, ''),
('a3f5f572f73a4f4cd9040ca67d7ba8e7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270429, ''),
('8ea91b8aa7c0237c57290c0b7dc589ec', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270446, ''),
('8c84720f0c1ceb87fe119ab9d0d59943', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270469, ''),
('31e79e4aa3e9ad8a10058239298d1780', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270489, ''),
('3bc00e49b3324e022ff14c381a657842', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366270501, ''),
('96544cfef14550058e4263bd9801ca29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271277, ''),
('3c74d7c0d85cc0508f4436fcbab98911', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271380, ''),
('1c2616ffe281b224d2b72b5e8a24369b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271395, ''),
('ea66faae7a20623b6c9d0fb760d823a2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271420, ''),
('7dd572498628732d1f473d66d7e493e7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271480, ''),
('2f2c573560fb83881057178a406b0c22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271481, ''),
('6355d88ef649d3e4de4ad6e2abd31a4a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271518, ''),
('9f8fbbbb574cf45134b6c7d26924a333', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271526, ''),
('09ff1911d06a4e40feeafc3dd23af0a7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271670, ''),
('2cecd2b27084acdf69ff3a52ec9b8ad1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271671, ''),
('80ef5142af3e259d678465b44450ea13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366271675, ''),
('8ff9a6fc8b9b53ede037846c1ce60b80', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366278923, ''),
('64c99901f913a651e82799b6bb9a5f83', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366278967, ''),
('8df81b27fded75691c3a6a87cb2e8b4f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366279014, ''),
('bd487052843fa4a69bbedc12e1fa0d41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366279015, ''),
('bac713ea55bbdf83d748702c4c00a008', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366279141, ''),
('12e1f29e1ccc9f5fca96780ceeadc0fd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366280130, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('837d8b9a2fa9655e3db5373c4487486a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366281948, ''),
('a1c548caa31f0ea00e6382e410a249d9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366281958, ''),
('140c1160a5a48fb9e6b6644cafa15c44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366282014, ''),
('43bbeebc4723a855e82eaa799d38268c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366282238, ''),
('54c2f4578b9cbdb7279c90b1bb926a3c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366283250, ''),
('9c36bb699e2b1ad0dde92beeca8e989c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366283329, ''),
('bed54fe54513f50bff8b156f223ac4ad', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366283479, ''),
('b0e8bb08b0374cbc86931e652c5faf6d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366283497, ''),
('3bb95ccd46e2bad89908cec50ac7b494', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366283498, ''),
('4d5e75a3fff17c014d8ec9e6e85a0ae3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366283955, ''),
('7ee49235098188788ff6511f405be859', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366285909, ''),
('a5103ea3dc8a3cd949063b9c78aaad3b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366287144, ''),
('adc3419f02c8cdb61ed9dbbf9e7f3e94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366287224, ''),
('eda5106c5fbd21d5399a483f935d45dd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366287397, ''),
('31fb470230a951f2f5590f8ae79b85ca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366287466, ''),
('ca62b8d096fcea7061516c00002fd23f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366287533, ''),
('9a775a660641d92003b89e5b8f3ee19d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366287648, ''),
('76f5bad01fbb8e4a8e7feb29d917a48e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366287718, ''),
('4fc5184b8fc8483f9a454f775048e652', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366326326, ''),
('db417aded8808fe3659a0d5b13159e08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366326363, ''),
('0d184f9d654738561b651ec99b7f10b5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366326522, ''),
('deca8ad499d95acb8ea13c0aaff3e0f0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366327014, ''),
('8c032ad8a7a37977452b12b951bcf826', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366327277, ''),
('919b59a248dd93f4419e0e4450bb73c7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366480426, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('9e99b7e8a488bff34c15fbdbcd846e22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366332630, ''),
('5acf8ebfdd36b4e28601b159e2b8001d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366332744, ''),
('fb4e96bb3453e565708a18556954b1ff', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366332878, ''),
('515edca454edfdeaf3bae5cc92479681', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366332965, ''),
('10d50cb22412d3b6825ce07936490770', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333136, ''),
('5767db621189e2846a092c15efaacde3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333148, ''),
('b37ecdb2bac87d0e661384c79a282d19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333157, ''),
('c5e3eede4c4dba59ac5d5e3c89d51d72', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333161, ''),
('6e5a2e8aff56614e26936e643733845d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333169, ''),
('b58deb40a099cb8fecec3142e61bd36b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333242, ''),
('eee70538f0737b153ac5e95a21ea5eca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333319, ''),
('20e0b66367896eb2f04602990c51668d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333371, ''),
('6e49aaf46c223ddc66c1e709da0a91d3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333410, ''),
('e4eebfee63fbac28ee17e0f7f0bf4936', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333378, ''),
('59f43c2e7d93263746b09ee6255b57e6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333379, ''),
('ba4a0ce8d9622f6fa080ab55e27a8565', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333381, ''),
('edb7bbf1d1813d831b5b1b77effe1c9e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333383, ''),
('e3ab166e41ee68f1d780537f47c5b5f9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333384, ''),
('c4fdd5319289226abc81c1e55a004cbe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333403, ''),
('ff08c2117b9676a7f35fe513759f186b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333432, ''),
('df9e6140a3d480cc1b8da836c2641c41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333437, ''),
('a37e2ebcfc5dbeb9a7838da158de1d86', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333462, ''),
('9981b7f6d3bbe5de841f3dbd48cd8aee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333470, ''),
('79db488b55b1e9ea39e02b4354c2bde0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333494, ''),
('8a978925b6031b7b4c1305c7ea28894a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366333762, ''),
('d5499b077dd1ad5dcce19f1c60ed80f6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334263, ''),
('2d0c075fe38f975964c1fdd1db8d6f81', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334264, ''),
('4371a262c115b0be9bee05a01a5c4ee8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334364, ''),
('bc331c85a69ae1b0c85dfb8ac578b2a2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334366, ''),
('47a1de2ff2df7fbd2e8ae537160d9abe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334412, ''),
('ace0a99b7d4a24f5b35275cebe9f9986', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334436, ''),
('a7c255213df0c3f2451ec8c89aabfa7d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334447, ''),
('cd5ebba8d41478ce0a4fdce963d260cc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366334711, ''),
('dff03c1f1725177c776c20a90ea7d56f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335275, ''),
('a59a8b12dcf3c7fb14dc1967c07a193a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335366, ''),
('f7fb27bd74330ca918dd0594ce12ebc7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335382, ''),
('9d0fc6b78d00c6a8d455c4e294449505', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335394, ''),
('eabdc7e78ec620e65993181f4747544d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335414, ''),
('5b2c67d737d9908e2b2560b7acdedc3f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335445, ''),
('d0a7eed2657f0d7c224760d0e2cffcea', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335470, ''),
('3fda12df721dca1c90a5563a2a94961e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335516, ''),
('83510e5ee92bae26d471ebd397f11cad', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335523, ''),
('5586107bd375643a946a42e06057799d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335637, ''),
('57530c0537574a3816141f166befd60d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335654, ''),
('f5db234e3cc13ec54bd65d5ba6dd6e15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335657, ''),
('8b063c9c0083120b0c35dfd84c8c81c4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335676, ''),
('42968395bcba9352085a63e261dc8069', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335803, ''),
('20acd90099db85ce6a92e2e05f4122ae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366473184, ''),
('9acd8439762b8579934aee55d371547a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335903, ''),
('58ad558959597d9e411c9d841f1cbef0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366473160, ''),
('f3196e67420f4fdaa4e3eadb610b5eff', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366335904, ''),
('d658621f170dec5715ecdfc903281756', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474406, ''),
('ff3c86ba7f685a7e597ce88e356f182f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366473518, ''),
('cdaf4cd4fd9ecba6281ace16f13528bd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366473584, ''),
('8f3711da8da069bfc513a568ed234321', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366473601, ''),
('faf068aa9f1d066336322174e5594aec', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366473620, ''),
('bdcf33542c2e6dddef4aa20d62c823b5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366473714, ''),
('97f1056696a56b5ad45cec90795a5170', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474087, ''),
('198ce95fde96f1180541358de2257463', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474119, ''),
('13b383511817fafed8de86fafa71d1e5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474385, ''),
('574779bfecfd909d8f5bb7fdc54e95d5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474403, ''),
('a9daf07e691e0128cfb8a7cfc5fa1276', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474477, ''),
('6660587629fd4b5a2237b36912a4940f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474480, ''),
('076de22a810bf5dc2b4b70e40fa24782', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474610, ''),
('a449939afac7374c6cded8a7214e9385', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474612, ''),
('b67b27396a0c4fe0fc02122fa7559e6b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474982, ''),
('75750da8204b37978419d5146c398b9d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474943, ''),
('57c8d17ebcd4702b32e329ba109c59fc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366474986, ''),
('d941953e13a6803bb04ce104d711ef74', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475125, ''),
('bd807406787ca5e77d617f22ecd9f5f2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475318, ''),
('dba95c58c3dac60319637265ea9d180b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475370, ''),
('8f8ef43223c5617e40c66026c228e293', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475374, ''),
('0a1faabadd3e1d50d9e7bd6788df19e2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475378, ''),
('0f67942d335521b483bbf5e7b41f8242', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475422, ''),
('3bd1da0fc45bffd23a679994985dbf2c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475417, ''),
('24587ea6cb01ac8dd3886debbc25e450', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475419, ''),
('3ae2c42a58a95816b20690734972c1ad', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475467, ''),
('12abefab66f0fbb6c89ac364a1b5b191', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475984, ''),
('0884dfa587e2476a263c44475a3bbf8f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366475471, ''),
('bba92ba900c3333e4c6d6a28be72cb1c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477410, ''),
('a2f2bf1a675cfad329f29c6f7fdc958a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366476056, ''),
('f5d09f159fc6311c0d71d63bbcdd4f3e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477550, ''),
('64641dbd321cd253691a95db8dce4983', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477600, ''),
('4aac6c4fa1d85feacd3319e710a5d747', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477721, ''),
('e1ac93d040e04d91aea42200f08a20e0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477723, ''),
('230deef484f55f13edd06f19bb664cde', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477727, ''),
('e9d42a4d402e438028622043e5687af7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477729, ''),
('8fac400bdb53b9b6c54720c12da8540d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477763, ''),
('046eb2516462f32058434ddd3a66b537', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477826, ''),
('55702fdefba8d7585973956084afd96c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366477871, ''),
('657677b1cc93b95feb543e7d3f6ffc05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366478293, ''),
('9300e026b84cf71f87bb8f976cda3a7d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366478362, ''),
('0d3669596bd034ecd2cff050ed6694d3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366478434, ''),
('b1708c913aa2fdc43d6eb00c0ec96f4a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366478442, ''),
('f1c25984dfde5a5ce8c3600ed8a03d28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366478443, ''),
('168024622407606f05160cd84a45bbc9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366478443, ''),
('d411c86aae914b7321cb6c943852b8c2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366478449, ''),
('8554c28c8ea3ed040a43eaf34955915c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366480498, ''),
('1741c0d5e9556a429e7571eb48bce468', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366480504, ''),
('c8197bf5f16803337883cef3963e9fbb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366879851, ''),
('114dc3ab2d6111a218349556813e72a9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366882968, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('048489b7bc9b089d2c634f4e2cbb74b8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366880089, ''),
('c2adbaf811ce2853ae2e5baa896d1251', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366880153, ''),
('ef36ad61ef87ea15f85a3b2103f6b73d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366880790, ''),
('4ad03d69d77fb3489d06161601e7e4a3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366880914, ''),
('ea90ae1ee3bd1ac74c5832edaef3c5ae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366880917, ''),
('f53d28f2627f4c837f02e328802c0fd4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366880920, ''),
('81ada101f667ede9a9e2658109238463', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366881228, ''),
('1ee32c96dbb8bc02cfbec708a715eeb3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366882969, ''),
('15ab3608dcf033d4777fea893e04e472', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1366882977, ''),
('94eb0856492c8ea107ede4f50deec6fb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367156677, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('8616d72eaf0a8d4daad95ff91f803d6f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367107313, ''),
('d5a87af10aa0bd84b1f9e484bc5e1678', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367107393, ''),
('3548f60be7087f36042e7d696418bb6b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367156707, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('c7edf403862751b8349b933f87e769a8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367141370, ''),
('83101cb424761430927449ca5cc3025b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367141371, ''),
('2b19c878ee623398cd2abcd31e0d61b8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152493, ''),
('fb6cc88b001c9a87957a7f5b22b38785', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152626, ''),
('c95d2fa2a20b6360b462e8e6c13d4a44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152706, ''),
('24161eefd61cbedcb41b76ab9b33b0da', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152714, ''),
('ac14943de3ba2ef2a25822d1d9c947eb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152730, ''),
('891df1ec426a53eeb13dc016b5dbe40a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152773, ''),
('02b59aedd82821411313314d531f4c43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152956, ''),
('1cd0dd53531ec0c597fd8dedc08d600c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367152978, ''),
('cf2a228e489f612c3196251fb9ff6513', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367153064, ''),
('57033aed13031db73f7d4503a24e9183', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367153068, ''),
('7769cf2f8bfa1809ff8f74658425683a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367153196, ''),
('bdd246038d8ec515cf5a8fd797a9473e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367153645, ''),
('77e30a9450a14c771f89125f62f26aa3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367153844, ''),
('381f2032e8a870a0c2a56d4d9950e6b8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367153907, ''),
('2b1413214f8e1b05458e01aa7ff16960', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155601, ''),
('1f8de254891daf324149bd8cabff4354', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155605, ''),
('72b89a117ac5862305cd72724b298875', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155758, ''),
('4da3690a687dd3db94870d5f5d61c974', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155758, ''),
('a710ac0f3a6da4d3297addbc3b04da3d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155759, ''),
('301496858c8ab8e1bb6c9fd04d7e63a0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155773, ''),
('03592ab323e1efa985f8aa94fe5a2d88', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155887, ''),
('c8e954ae5ec04b8d807cb01c3b013f50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155887, ''),
('d77886b793036caa8942ba2f6df0d4b6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155888, ''),
('d850de5c8f5681836ddbd2eaf1fe514b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367155891, ''),
('f6a6ce60e0e97c322bcbd69daf5405f0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367156726, ''),
('3060179e30f44719be2dc79c9ba144d1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367156704, ''),
('5836e8525aaee5d886065b527ddab574', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367122017, '');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('ee4b33f0ae460f2c6be50ed0f799ebf7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367122024, ''),
('a9d1d95e0531d29876c1107de5da4b5c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123260, ''),
('4ff295db83b4cf6f407703d666db68a3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123267, ''),
('ad849035ca9e93fb01571ac2f9a97a05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123529, ''),
('7f164e44dbd10b765bb1e5319d61423f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123320, ''),
('6fc3253a8a78c6fab6a7d8bd80a890f8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123366, ''),
('bd35c975cd1c85b7918f8c59ef6fe727', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123531, ''),
('9fb636651d396aa92c9c557588858382', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123586, ''),
('c9442dae6d5b52fcbcf1ec1bb971799b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367123698, ''),
('c2e580bd2ce2060b787fc3a25d95d6d0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367124142, ''),
('cd6bca19bb7ae7cf65b1372234245e15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367124146, ''),
('6575302bda5e7a0fb047e37a50ef8144', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367124357, ''),
('272a88308d1286df05ac45b9d92605dc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329622, 'a:5:{s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('0813b09b50e94a401510a519509675e7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367222201, ''),
('39616d2cb4e17de1ff6ed89c0b2b7cbc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368130, ''),
('2092f45db17099b2ae5aff97c735500c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360583, ''),
('11e21a94721447bac27efb9fa5bab400', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360520, ''),
('2759de6cc9757a3b8099a964b0278679', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367222204, ''),
('b6056887848f2db69739906f2d4622ec', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360904, ''),
('66068bc9121ad209ca1a0b82fa49250e', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367222225, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('8ee60e2b0ff80e1cdfb96686aa02dcf0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367222571, ''),
('c4289182cb3029115ecc5c81366a05cc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367223319, ''),
('99a24754e787a212de23cf256aa6d601', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367223332, ''),
('358c290a26007a3cd6aa45b5a50c3f38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367223780, ''),
('345dcc3a69a820d8de787b0c19ee1c6e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367224100, ''),
('2e0bab2ffc17d9fbf8f3487218097425', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367224883, ''),
('a713b2e8625d4b8d962b8c3b0b4de886', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367224967, ''),
('5aa6bf615af5d273cf198fdb97822750', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225212, ''),
('f2623c6d30b71e18617a2889151e797c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225244, ''),
('3d4e40d88ff35ac258258f455f4dbdaa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225339, ''),
('70c23e7c1633a1ccbb7e52f9f534a1aa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225294, ''),
('7a185ea5989c30067a6d144c2dfabe0d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225333, ''),
('d6d8f1be2912c815e12f72b120b42a0a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225367, ''),
('eb46da25067aa241f5751e450715d541', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225399, ''),
('c4ce2e526c337db429996ae8c3ae96f9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225637, ''),
('6d45bb595688215518cc798266e3ee3e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225650, ''),
('628ac6c3bf3bf4026e4c9849868f5a68', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225688, ''),
('c39afa15692f0a06f4ece1e379295b48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225690, ''),
('1c663ae67c79371eb52a019f3306bbd0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225855, ''),
('b73c6ef5664dc554f9ec1a8583bcaf01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367225868, ''),
('d09fccb86cec2f53e074ab93f264ccfe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367226007, ''),
('faeaf2f027c9ba5d99544865d70b1fe6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367226020, ''),
('e0561184802e511de0df5bc8eea607f1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367226611, ''),
('fa3880b0f5c73845e510940db2586593', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367226616, ''),
('e004dbf91db7d11b330b2bfdfab67eb7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367226616, ''),
('e571918d36b9cebb5f303d5687b8dd57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367227075, ''),
('b8ed4db0d50c658bf5b4a1a54b15ea0b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228703, ''),
('8a236d7d49123200abd9cfc07d1392f8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228705, ''),
('249f6a0a65846af05d13b169922c1510', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228798, ''),
('06458305ae6cd6a1f7fdf71e5c077f15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228707, ''),
('4720ad6d9ba61559a266239a59476661', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228718, ''),
('d6fc55e80157070ee57f1dafba70aaac', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228712, ''),
('34aaa4631cd588e66524fe3fd7cd1625', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228713, ''),
('8271480a30ab68f8c656fd79c5c0e453', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228812, ''),
('80e919625e069372787eb5193354f260', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228834, ''),
('3b767e08ad66563e24c18012f86f5140', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228824, ''),
('e4051f501b003aff24e5bab4bed9d6f3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228825, ''),
('0a997b966c6db3911cc5dc015859d7b5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228851, ''),
('2aff0d0eade98052d132e76bbe7cc0f1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228849, ''),
('820c42148b89a93e999a8c7de8a70806', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228865, ''),
('5c24615c97d0144800d10b47eabe15f6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228869, ''),
('c621c02ab12d4125e977aa0bb6025206', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367229335, ''),
('a9f278dc75cce00bd0a957ea79c494a0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228882, ''),
('9de261944622845655d667e04e452266', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367228883, ''),
('4b92760d61536b971dad57e4169207fa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367229343, ''),
('6b71d4556324e7849bf3e93eb65fb4fe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367229496, ''),
('861b9d466e254c9c538f081b53b7a0ed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367229501, ''),
('46d46655967351b6849daf762e4fe6c2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367229962, ''),
('deae8bdae0752bbcbe66c8dcd854d38d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367229971, ''),
('594c98b8b40973bc016cbf4e650e5c59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367229994, ''),
('b2b59124cdc1afa68f42cd0133a69992', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367234295, ''),
('051b976155a80a3997e204b84cd39600', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367235028, ''),
('cde4a765aaa593a36aeeeffcd64013c6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367235095, ''),
('e8a0ad1a205d6a5857e3f7fc79d50ef0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367235103, ''),
('c7246f52acdfe05e7d17c982efccdabb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367235115, ''),
('fd939c3482da71c8c0f740fcb3cad395', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236140, ''),
('526d143357a9a9facfe4120fb3b79844', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236162, ''),
('ec4bf570e17cb743aee5db7dd5418c19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236168, ''),
('c593a4e80c48e6c19ca15a99b8401929', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236173, ''),
('cb208cf21054971e26b43de5489551e9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236177, ''),
('38574d0f29de39c82a6707671011ecd9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236224, ''),
('be29dd7d47cd06648a76ba611abc1124', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236181, ''),
('94e079a695a008b8e934c3489bf821cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236183, ''),
('9397053549c3a565d90924c1c48270f2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236240, ''),
('cf8e6f160d5cccba71664593c0d95e26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236821, ''),
('2a300232a5d524b6a515a95c0584296b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367236829, ''),
('8dc91a4bbb35c92052fea7a0127ccebb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237051, ''),
('e80c37e507c8d596c0e094921ae5612f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237134, ''),
('1da93e6448d52810b9c98e4f60e19295', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237180, ''),
('d5434089e6441373e0d4d00015b7a94b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237411, ''),
('3c308b6886f9fdbbe8d3623d8924e360', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237418, ''),
('ce590639bbb2190a7684aa8f87eb8dc8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237466, ''),
('4c0d66b1f353c69a285f0c3fa3e83d96', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237509, ''),
('2e4d2bbdad78babfc955cb71b40eb3a0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237512, ''),
('e00e9c0ffc692fa5d5ebbdde41abc259', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237520, ''),
('b25f24c03fa5734e5f430ee77d57eea3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237534, ''),
('425c84af71b7ba38e408df754e293887', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237573, ''),
('cc29bd2fdbbbeab4c62c6e5e4ba66881', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237661, ''),
('7dacbe976948e75853a13198aa4e845c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237697, ''),
('a46766771195d174a33117f5e73503b6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237705, ''),
('ac8711aea0c5888529da0cd51385d74c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237720, ''),
('d3d0184cef85f4bec789620c06797e43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237741, ''),
('f5da80ce89f58327bfea0e26b041e782', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237751, ''),
('3db9b2fa1c9802839a618ee2a2c09df7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237790, ''),
('383983011cc68a0de50229f10dd67fcf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237804, ''),
('3ecf694976be8f3d2d82b7f3d63e75ff', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367237806, ''),
('0bb5ffb75623a3cbf5cac46f7a4dbb34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238297, ''),
('6cb2ef6b3c78b50731a7a3f81153f1c8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238312, ''),
('13f428c977ee34f2da28b58f03f6884c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238402, ''),
('60cdb188619ce76445897c7de17beb06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238453, ''),
('f07408221714f8ac7444098cda38bc17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238509, ''),
('8287c5e84f44bd722909a746378cdd7a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238533, ''),
('900ab2631da1ed21f72200c9a523c5fe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238534, ''),
('9da72c1b6e638fe4dbaeef0a930fb48c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238709, ''),
('2b0fcd7526d716e76d2a86ec420d172a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238769, ''),
('0bca47e81583c4b40f8dc3d77347038d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367238826, ''),
('d59ac4dbb5c5ea4bbe6939f5e7ba5db2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239203, ''),
('75f314ebed2eca25e28a5304faefe3e9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239207, ''),
('91b5f1c76f327d6a319376d58d0bb6a8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239208, ''),
('c606b8d92020e966243dbb2cf47325d4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239229, ''),
('5f8b3307d509988df4c43407bfaafa46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239226, ''),
('dc79607cb4ff1995a12cdb3dff11fa31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239228, ''),
('960a9606ff5dc7f825ade15cc707b8f0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239230, ''),
('7ff9861a0a7fa120254690c6d4a93cd9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239244, ''),
('0e071742f374c51f8e1d7f5996bf0482', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239240, ''),
('38c92458701f082dab062a0ede5f436a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239243, ''),
('9951e39dad900c8b495d1cb498a2dec7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239243, ''),
('52d23a89b88cc381ce79a8fb5e4b436e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239337, ''),
('4483c8563dd82c5eb608c8629c66b357', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367239390, ''),
('79e3f73686b4f8d8ac1bdc4cf5c601b4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367270921, ''),
('697cd7e5308e8f680767c7743f14c586', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271003, ''),
('4dd2fa47e7c7c32a3fba2e92bad5e991', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367270966, ''),
('3d00338d843711992891be285f7a5bce', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367270988, ''),
('8a0cce3d45f4bcef4d01cb10defd96f9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271230, ''),
('a5e5f4991ba228ca6c9cfd497e6607c1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271236, ''),
('4063a72be9ba6c62dbddedc5a5b95dbe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367295924, ''),
('d09dbe667afb27884f1aff3ef61ab1ea', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271246, ''),
('02965a8201fe564c69e76eb431183f74', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271248, ''),
('92c547ab65282f110897373995a606b1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271287, ''),
('97053846844f0c08dcaceef47139e246', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271332, ''),
('1de3a03d62dd89ba378d403d8c8d6794', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271333, ''),
('2a9eb8bf0339777bc70f4e8cefc08aa8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271362, ''),
('2a53e1c3f00a9f0ad020a0e7c4d4842b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271400, ''),
('7819d1c62a620fa6c868e3dd3855c6c5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271416, ''),
('c445edeef739bc5fda588031fb54cdc0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271566, ''),
('c3d6a3bca65492a1d504330cf03e9119', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271568, ''),
('f47cb96477626b3227c302398679f516', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271592, ''),
('da2e881e230d0898c1e3d7ca7b6fb7e1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271593, ''),
('82291ab40a93050c813df8c159687c91', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271718, ''),
('acbd625c78c5af5377512ce313fb75a6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271768, ''),
('11a42a743820bab4d1b76e254d659ca7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271774, ''),
('3a7b1ed784d45622d8f768e5ec6c29e7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367271779, ''),
('02a9bb11d15eeee9d408b3477d859c7c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367295924, ''),
('eadfc581532f11a045f3c7fe00bff5b5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313074, ''),
('c05c20e931ef49f3211fd7b9e18fb3ba', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313262, ''),
('27815b89a2921da9c333f321fa704523', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313265, ''),
('c455956d5f0250653ca0bbce5e07f666', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313275, ''),
('f99e52c8b4d5e664bb849f86ee597aa3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313297, ''),
('a525db9319d500117b8a7e7684627f9d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313282, ''),
('e3912a7e6c6bef408d28cc5fe5c82fc5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313283, ''),
('e43fb5d39463af3fa745eb5796a5f74c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313292, ''),
('c3d03ea18db5fd43bb865ebfb74be195', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313292, ''),
('5ade5db699fbccaadcf50a7b11a6e73c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313648, ''),
('c018e6b3472d4077b3531f11e8e60d7f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313683, ''),
('e5f2b4731a4ed4f4fcc4fb70254db1f3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313698, ''),
('105d2becdbf17f3ebe4867c3c0c9bf1c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367313870, ''),
('469cbebc4b4e14c53373ff33d17c4ee6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314096, ''),
('69a9395d4ed7f490e1388880e2f79763', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314123, ''),
('8a503e11cc2944e1657a93dc4a2dcaa7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314110, ''),
('4496194cbd3862c403aed6b9cf6918bf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314156, ''),
('d0989a33a4fd2e901a5f4797b5aabe6c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314153, ''),
('de2db8c35d9e0350c1b5e97cf535582d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314207, ''),
('de9837a87142d67494d4b780f1526f95', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314181, ''),
('0ad3291adce092032d67a538976e0ead', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314182, ''),
('9f892d37ffae8b59d15d5475251b2e35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314217, ''),
('c14f5ead6d70ff1189eebd5423aadda4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314220, ''),
('3f210e32685eb06a1c32026940e434a1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314225, ''),
('f7f12540dacbc6ba265695ee7af41d6e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314229, ''),
('4f0c40b3785aa829697e59798ebe7f40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367314333, ''),
('cb1471d0aae90e76409a99f2a877a286', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367316213, ''),
('4ddf8bb0e22372103b492e4da49692fd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367316226, ''),
('ce6db5c17a89d7051d2edcd1d5e87a64', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367316260, ''),
('9e4477d387bf0bc022d05d1b368d23bd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367316489, ''),
('3ce38d09bb40edb30a3ab0d142e00882', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367316485, ''),
('f89f9a4969170615330a79351433f14d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317706, ''),
('5dffed51e636f1d831170a051e6f7fd9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317757, ''),
('7f3089e50eae1e05a399d610a92792e3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317759, ''),
('016d99bf9763aef459f6dbd0c4f0946f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317767, ''),
('7aa083dfebbd65955071537c12129720', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317797, ''),
('5dc91aff2e95c75a6f4997c8c6c94bcd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317884, ''),
('67b5cc2bf2ff38e55582ee0f6de4807e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317920, ''),
('8106dc62a8f5b7eb1c7cec9fed4d9548', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317949, ''),
('66a274d9f7f3e6945a2d39216b500ac8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317950, ''),
('b107a2b5321d527d9f291bd1dcf56873', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317980, ''),
('e1b2318d3a1ef7d642a936f51481caca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317976, ''),
('74c72059b936da2dd1ac76051498a14a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317977, ''),
('6fd72b4513427344629dced2fcefbd23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367317998, ''),
('a289d982e59f413a54f5c0abafdcf054', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318255, ''),
('42cbf5d13cdc3eb1fff903df4a42750c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318257, ''),
('73e425948b27f9980494370b1754212b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318264, ''),
('c8248c774c4e5f783455116b39f31ad4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318270, ''),
('7b7a3164f930a7ecc616cc5e249df2c3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318275, ''),
('16fa38942a3e3c2d38ab704250c85635', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318314, ''),
('ef8fd19eced13702335c723567b91f6a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318316, ''),
('d490542c5669ee5ac1b0afdd7c2372ca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318330, ''),
('05e23e06c522a77dd2e74ba884f3ffe8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318382, ''),
('5a347e005a0ec14046a00febf3e9ca28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318420, ''),
('abbc3481ae1c1c72ee25a0532054f7d9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367318431, ''),
('3718e68a795da4cd288eaf4a95992496', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367320254, ''),
('e2fe11a9bb3f4a1130eb84597368e748', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367321175, ''),
('0ab8534c85a7d6ae9ff35adfc31c53be', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367321182, ''),
('58a4eaaacde0077e41b1538317cf32cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367321187, ''),
('c99dabb0a83e2e2143e47c79479a8b21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367322938, ''),
('a75a323c29b8211caa88f87617fb070a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323016, ''),
('4361ca34a35c373907f4f4f4289e9271', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323883, ''),
('203c6e66fa2d534a3f794e1873b79bdf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323888, ''),
('5599ca1e0829655d432fe2c90ba94d47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323891, ''),
('dd3f653f74c2deac8f86e39b106cb2ee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323897, ''),
('53e0343c249e920ded76e85d206b36bb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323916, ''),
('22cf0f92a9a83f7d7a7d75c258283b7d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323927, ''),
('882c937627c9bbf8400f653a693fead9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367323934, ''),
('615babd171ae2901cf6f391e5c65887b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324034, ''),
('755eb89059a3f160dac953eecbff715d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324064, ''),
('aea47bc9873bfddc54acefe8cd49de94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324076, ''),
('b2e6e5d20eb2732c94357750ec8327df', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324101, ''),
('b23e5699d507f7861a1298e771f8fba9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324102, ''),
('6dae556daa95816dc86ad69adad94967', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324114, ''),
('4a5d894beedc6bbbe20236824c005cec', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324174, ''),
('b5a9bd154249f1e6aa03d9b6ae484945', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367324176, ''),
('2f56d5c6e801768792567650ae86dc76', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327227, ''),
('46916c600694462df1803d3500909657', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327243, ''),
('ce6f1a8551f7acfcef81470d5b28dcae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327319, ''),
('70a16a791b006bffb27a6b2e4cdce831', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329217, ''),
('6ca8e004e73b2ce7c622fc4de0189db6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327381, ''),
('3861303cc324a5dc2ce794752f462952', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327383, ''),
('93a32e695851064d3736c8ab494e6df0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327390, ''),
('9dc32ae94711cebe9d5b6577a0df985f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327484, ''),
('3e26eb432168ea62fddfe6dc13274b62', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327486, ''),
('90fc806d728d3fd6b638864dcb317121', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327489, ''),
('21558fa97bf208233230294b9b889833', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327954, ''),
('7685168d2ccbf078cd9f6e5937945a18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327956, ''),
('7bd8000e5e7cbb68eb7966b7d92b705b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367327965, ''),
('1777193ff115794c211d3ef00a8352af', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367328382, ''),
('528737489925cea20e90815b862e5a97', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367328385, ''),
('8bbb2eb541efa5f1c72bfb09a2e5dfc0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329021, ''),
('46d8d3ce34c975a9b6ecf9ce0b8189db', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329024, ''),
('4d0eac395516fb03fbdfac4b2e51e330', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329026, ''),
('d4b951675d592acd952a1f234e629a96', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329694, ''),
('4839714d1a90f81a4db0d0f7de223024', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329231, ''),
('9cf1ddad519b6ccb74558c812b2d3777', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329233, ''),
('3db679d11b2f622c756c976bcfe796fe', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329239, ''),
('30cd8c61964b950384ce5df217cd1ca6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329617, ''),
('37aa8704708374a98cce1c04b4ebc77c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329620, ''),
('284a682af75746ce28a8e848be98bd06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360895, ''),
('80fce1568e022937984ef59b6d6d8e80', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360517, ''),
('b1924adb5d84823e1782230cf30cb60c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329623, ''),
('845ac86344d92153484bc1f5493f7c28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329624, ''),
('1181ba278ff81e65def7d3087c9c05ba', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360930, ''),
('69bf73594742aaffe979e30093b1d856', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360921, ''),
('6a7c7d6cd2ad5e2199c301df888ccb3d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329627, ''),
('b7691c58307778c5471fc676335b5336', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329628, ''),
('9448421a0b7c46463c50472caeea6936', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329656, ''),
('7096a952811fdc7a9668ac16316879cd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329658, ''),
('8e1d9cd2ea23c3c5552d99b83cfd1943', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329705, ''),
('c6285dc848b9eb07dc50f3971ea5ea2e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329936, ''),
('c95b10e062ca78aafa66f9a08e93d99c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329710, ''),
('8004bb9f79e199a635928e13347bf140', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329712, ''),
('dddfa5028301713a8ceab9e437f2cb54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329757, ''),
('d5ed1731af4f324b4a0168dd7be6b514', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329761, ''),
('2b88a87fc4b1d268035b910c4095d324', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329828, ''),
('682571342715085338df6bf921111a9c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329834, ''),
('280c65d4b4dd1696a4830a9c43b29f00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329838, ''),
('15279cbe32fa776759ab819c42d4de87', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367329940, ''),
('534b34ecf0201780f8b44107a101dda5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330324, ''),
('e48fa44380a5b1eca4e7d810add408ce', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330201, ''),
('8c248b1f220aef6f617e03ba173f9182', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330320, ''),
('574fd60ea900564fcec1d1ac7f690de5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330453, ''),
('2299552588f03f405de686cd88c2cc32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330441, ''),
('08282da96a19f27a4e70d09cf7d4ee45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330388, ''),
('668fa8eed6da1ee4096ee8062ce93b7d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330615, ''),
('65c15c654cc8c82944f7319570e02087', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330468, ''),
('eab436e0c860b07db1df1f48062c2475', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330611, ''),
('dc91edabe86bb8b852c37810acf998ba', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330643, ''),
('365fff8e68624ef8507b04b0e793e5d8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330663, ''),
('3fd531ae340385e28a4282de5a733750', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330666, ''),
('27639e882920ab036b3399f64fc9dc09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367330835, ''),
('dd9a4c14f58e9244f472a3f552fdb616', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332503, ''),
('3f0a50e295d44bd8f0c0ccd2e65ae276', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332507, ''),
('8767a7361e1ebded00098e316cdb2e6e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332580, ''),
('a0c390fc3d293df257ae5839a404844f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332573, ''),
('bca1b79c17bcf7b7f246b79badb111c4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332574, ''),
('be2ab7b8ebf6b09a87a9bf390bd2c048', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332588, '');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('20f2eccd624bb1899e20380662060d3d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332631, ''),
('db70e8542c9c199df2082d83228f89c2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332638, ''),
('cf8a6d19d1f93c69fc29bf9ebe98c47f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332650, ''),
('6ae8e7e37e711b074f14cb7d54291199', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332646, ''),
('9d3037c84648ba5892b18764dea5d5d1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332647, ''),
('2ef6ba1f5d462425bcee0fe2c0ba42a0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332657, ''),
('763db83b78faf7f98833f25a5fade493', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332660, ''),
('bcb27eb90b41a2273226ab82dcc2dc2e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332671, ''),
('f6ef72a1a347df40ccbdb64047376bc8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332673, ''),
('37965f5f2eb29b62e907fd3a78342f7c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367332679, ''),
('3d124ee63a9e89eda2abcb5b949a0dd3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356264, ''),
('41b1834912a439d61ddf3fab16c9ec74', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356265, ''),
('1155a816462c5219c0f7b83f60600cfc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356294, ''),
('6fa3c959e2ef93b2dcf9924931aba0b3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356547, ''),
('bcf5ef5001685c1db9f93d8ed6eafd94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356564, ''),
('f99b194a3113f7c0c69fe31caecfeb7a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356591, ''),
('ff85d11abaebb37cf4c4092dedfe2eff', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356596, ''),
('e607d516474f78343156708fc8927a55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356629, ''),
('53ef181d25f699dd54a99c13e6f4c2ec', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356633, ''),
('b479deab90bfd76f14212f52f7b4b777', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356637, ''),
('67d286469a2ba5197840508f38a1679b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356641, ''),
('73e687551ff276f8ffbed7350a43ddb6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356646, ''),
('56648f9c91b63abd058613c2891cdd70', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356752, ''),
('5f4766509aa99e5b3ea376ec8f6233ea', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356755, ''),
('bd9aaecb892473a3cd70d110ca4986f0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356844, ''),
('c61d9c4951d10967bd0afe571b9dd578', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356878, ''),
('497d10ed32d9d06241ff293c88a13cf1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356917, ''),
('58f7050f1a57c698028ba2e3f2b4c371', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356904, ''),
('a3ac837321475fd8f46d133b51a50977', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356905, ''),
('317201fec7f081cb6041e4245c884862', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356964, ''),
('a295231e87cd4bd0c7359951932b12d1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357030, ''),
('bf07f82ff75035ab30314d4304f6b0d4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356972, ''),
('fc609f61deacedce76e88c21405af8a6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356973, ''),
('d7baa26dc54bc44206d57a0a594dca5a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356982, ''),
('a746faeb78ea372c4c1af098ff249c24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367356997, ''),
('4c06a34369871aa19fba4d0d3a377ff3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357001, ''),
('f461fc4b53e5440660a247be0ad10a5d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357007, ''),
('42a0c1d941cc979bd6a57cabc784802a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357010, ''),
('3b9824780d097429239496603cb35dc5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357024, ''),
('51c52e15d2d8349e7376aa59a0943c76', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357026, ''),
('6e0b390a2c73e3d9c06582c059bb865a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357033, ''),
('dfc2d73ff73f41fe407251ba5c65a6b6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357076, ''),
('67572b0efe88e498d46bb67008339356', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357042, ''),
('bc7d2092a7a3a23d748c5067fb353fb7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357044, ''),
('a095c70572d30aef551d0e15c72bde34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357066, ''),
('994595feea0ce5c56bf21e77224b3d00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357068, ''),
('88acd16261788587758b3e24c29e558c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357223, ''),
('c62e1429120e528c86b2d0659f4fd150', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357224, ''),
('e27387eca82ea09d1194828d04351677', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357231, ''),
('14f7b0a28122e434fbbde349c8fecf89', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357350, ''),
('b4569427b96a0ab61d18074e98c50dc6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357292, ''),
('ff0b9cb6a653381d3270b0d11082f906', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357293, ''),
('d214c15221cc66480c3316f00bb0a892', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357378, ''),
('5851f2dfab41311d15b4d22ee0902903', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357360, ''),
('e65c80b5c70b8d024e411f9b18577433', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357362, ''),
('cc1915edd649d18fde3e8e5ce4cd7ed3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357368, ''),
('f141a5d4bbace11786b3e1e5802879f2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357409, ''),
('2f4540096c0c04ef02b543caf974d7b1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357414, ''),
('ca771c3e10d2faba581c7c6786486d6c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367357419, ''),
('2f9e6a6e4b10fa61dffb5f620290e786', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360520, ''),
('3ef17cbd60a009f8bafc7febc24da849', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360524, ''),
('d5bef7a4ceee1acce8e3897f893d045c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360527, ''),
('b8aeb38baf9064c8fce49f6bb7a3ea0c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360596, ''),
('83b672f82bf683083446d868911ff2dc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360658, ''),
('6f8389cc0420327c9ef72f74498190a2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360684, ''),
('ccb679a6cb434c90a9ba4ca31e6dff0b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360699, ''),
('337b17c7868d608e655f3ec672e22b6f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360773, ''),
('9a144ea46f2fa69c6aa191e31cce4e6a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360823, ''),
('a4a1d1b1debedb23e226fb38c9e4aaee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361573, ''),
('ccf344d6b2c4d234f60afe1be244c12a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360875, ''),
('892751e4ea8337eb96cc9b2bd3483849', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360877, ''),
('db92bab77a12661509f994384d1aa70d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360882, ''),
('b9c7151aaf0228d43d1a83b73436462f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360886, ''),
('9890db8d6ac75da8de555cbe60d0d457', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360968, ''),
('b1ee191108ccf99e5b9418df05ae45e2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360898, ''),
('55fad5b101cdda2ddf6574517a4c2145', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360900, ''),
('504edd5b9fa4df81f6f67e97be871dc0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360905, ''),
('7314e12efc7fd30aa218d3c99bed6e92', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367119, ''),
('98202bc6cd74ebc0dd4809e291da9160', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360911, ''),
('59819ed39a19dcc4fb0900f198d62697', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360914, ''),
('26a147b86239bfac4bba0a1eb7ab2d64', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360922, ''),
('0f1d71d081bf5b8abb7c574b2a36db91', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367727, ''),
('b88051d85a1d0dbe7c6f89d30c9c0d8e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360954, ''),
('d0a4e54557cc3649bca76e7fc7dcdaea', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360956, ''),
('de5eb4bbd6d0eefa05a19c4f6df77723', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360969, ''),
('2671b263fefc1d6b8d4771e1ae4011ac', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372521, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('d0db0971446cbcaa36cb42d5bfbca11a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360972, ''),
('9b938454b4ab10344e75b0f01f745ea0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367360973, ''),
('e05f0041e07be0329e8379f1fb5a08c7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361239, ''),
('c35e290c1752ec125e4870a3ec5f6e65', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361248, ''),
('10199b13744e1c470a76351a09f116db', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361468, ''),
('2075a299dacd52397ae0d4c15b3c16e3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361484, ''),
('6dd9ac2d5be7da681b4ce545eca8ffd9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361575, ''),
('fe0db1d1b5a1c654a6b463408b94dcb5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367645, ''),
('3dbb6cff81706aa783b4807ef2b3cca1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361577, ''),
('9590e957123c25b31fce59f20c21ffc3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361579, ''),
('9b0462b08b1383b6b1b8722bbee3c111', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361583, ''),
('9c17218edebbeb594891605baa7ae8e0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361675, ''),
('8801002c9f943d04b7de71f48a8f9408', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361677, ''),
('f2f0be8d212635a1240c435e117bb285', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367361709, ''),
('71c54f53f48aec01e05bfc4a0fbae267', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367362644, ''),
('bebbb073855bc36900a802081737eea1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367362647, ''),
('37e1da46eb40a78d99802054c7dd1e63', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367362650, ''),
('db26c58596376ace5f56f3be843d64a1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367362652, ''),
('b39215c9fbf3e524053c531db959a734', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367363256, ''),
('f12493a7c968b2aa5b62842a8a039313', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367362660, ''),
('24bcbfd96fdb799ccfc0ce4366e0b119', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367362661, ''),
('ec41cf9823fe2cb70eb8b38f513e85f3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367362664, ''),
('f7c3bd523f08c25abea05b6e6668c31c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367363170, ''),
('cc7414bca382062e28e993d2d671750c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367363247, ''),
('aad5eed421f394e44031858b843e8169', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367363248, ''),
('42679227205796ca0bd5d0b396dd9380', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364822, ''),
('d4be210e38031b10b89e0d03bb1cca7a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364836, ''),
('8630af420d7d73ea9ca77998504f4d94', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364840, ''),
('b57ddc0f2de3c1dc9f8c565e6b4ab0cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364842, ''),
('f079de5696235d4f49aa55de1ec3265e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364849, ''),
('23cac6ea488bdd02c10ffa89843fc2fd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364873, ''),
('da7f310cddb3b52df3ac683d2270e339', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364865, ''),
('95b5611f41f301377b4c33df1b3008d2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364868, ''),
('3e6bd727fccc8f735c57826f8fd4cca9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364890, ''),
('40d04205e41e385d0f38eed45629c5b9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364909, ''),
('df2bf919b511bd277c911bfdbbdad65f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364912, ''),
('fe2c182ee5d29702e9e9ba4a535bc750', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364975, ''),
('14b5ba4c68b7d6b817083c0385af2844', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364917, ''),
('f2c2dfbca30abc67552d137f5cc37263', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364920, ''),
('0039152e0efb9ed658aa78d1c44dba46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364994, ''),
('13217518d8a6d6f0fbf02708bb9ed186', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364988, ''),
('644af1a9e0b94725b1cd3bcc756ef2d0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367364991, ''),
('12c7a2a39e6a7086edd360b305fdb230', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365033, ''),
('a2e811f2375cc572ace83e579fb246ed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365012, ''),
('50cea7fcba261732d905c5c9a97f47c0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365014, ''),
('bf3058e14b8c10ae6d36222ff76d65fa', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365069, ''),
('12ba6597c366c33ee5e5e9fffbb9994c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365073, ''),
('e5dd4cd5c1f6fce3f3cbb83acb3d8bbd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365146, ''),
('ae5e03a1d9d7a3603f478fc01520849a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365088, ''),
('85c9550a47bceab7b97292b7f24ddf0f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365091, ''),
('7f5f05860dcbbeb39ea6f72ade407927', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365109, ''),
('36b5de3b3aa85f22625d3271cd122c0b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365110, ''),
('2c90df0b066fddb50a56aae903672f44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365139, ''),
('7f1e1f2e041b45c6cce89cba1e902f1e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365140, ''),
('88eb64463b9bcac243582bfc0148f747', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365156, ''),
('e05e66687cf6d8dbeb300733a1324eaf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365171, ''),
('87b1d573ef301d091eed428bb2b5bba9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365179, ''),
('d512e5a362b6d49ff63e2a4e282f0e16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365182, ''),
('f59857f94613774a3e01592c53204138', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365222, ''),
('24584c407350eb05a5d5464e12cf73cd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365210, ''),
('b839d1abe1a1981202aee00b2ccd0a3f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365211, ''),
('a52aa7a32f7dfc13dac14f876ba1f2e7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365243, ''),
('3a2fa21690bd978e7f2b5e848dee7553', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365260, ''),
('155d5a87c6735a1b6f7be4daa7a27f47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365257, ''),
('0fa321afd21b11592a960937b0519b02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365258, ''),
('de6735e0d7941880db39b303ea41c812', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365264, ''),
('79b323b2ab3716f81e0a3d30a0718207', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365360, ''),
('2c7b04535f6a8f9a87c1bdf0f86cc0eb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365287, ''),
('cf1a6478382267a094488fea40efcf8c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365292, ''),
('91a0cc6b19d97b559e92dd575d9fd1a1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365304, ''),
('137e454eebdf9cce9627f756ecfe6f9f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365305, ''),
('da6202b4e8eea7f64744f67a9ba60f9c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365345, ''),
('f4f8e24beed02c70ba83d60d99d9e9f8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367365348, ''),
('75dbe019c4a023b2243c45f52a8c5913', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366793, ''),
('714a42ea1d83742d641e4a69f4c46d98', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366798, ''),
('9fa654da08f1d860f6cb41b354929f0b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366812, ''),
('32d1444a549dafcc422b283ae4c3ce52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366799, ''),
('53bd6c19f1e1c166181835b956270a5b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366802, ''),
('73a67bdef32c8dcf56fb88b220198192', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367080, ''),
('0659428bc89ba88ac6a0e957f2cdd688', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366967, ''),
('654e97e5fec8218fbf3963f5b6bf7580', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366968, ''),
('88da526c7c818c1c88d4d46b865293a4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366976, ''),
('e41fe3d6784c1e7b69af46676462cde1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366978, ''),
('55d86f5d81c7d4949b594fcce40be70f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366982, ''),
('a2c676245134d8a38697a3a60fb3a637', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366984, ''),
('952a3518ea1daf66402eb04891d23449', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366990, ''),
('fb99a1738ab630ed76bf3d223491c5c2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366992, ''),
('573cdf963c8d0c0489b917cecc469d76', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366994, ''),
('e9648a5d0e887ec622b56db8f970d7ee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367366996, ''),
('ac0f81e5255876f517eb3c7b05e725a7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367083, ''),
('9359d570c459d57024396cde94d5d79b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367094, ''),
('3131ecc14479325144b84910c3e2b1e8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367088, ''),
('ac59dcfc7c16d2c072123b925fb3546e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367090, ''),
('e2a0f17af8ab5a896ba0fe7440d71b8c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367102, ''),
('9ece6c0f5ed236e4b5204d2b94b3a2ad', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367106, ''),
('50968f13c378da8687869579383c9fee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367107, ''),
('7bbfa33dedf9d3b9a1e0ad0c26828ca3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367120, ''),
('5283f5a4b15cc51bba73e05c87fe05b2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367126, ''),
('71ce169320816474361d5675cebbd98e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367131, ''),
('30aff09e15e59b58b0eb0f5c7953fd66', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367136, ''),
('a0fa6f55abe25c2d3e3e3562bf867bca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367143, ''),
('f9ff94773a0780024940aeac56bdd550', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367146, ''),
('8e8590d4c3187fd53137ba4770aca6ea', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367152, ''),
('29ae050dceafc9d111c6bd2c0aa7f8cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367160, ''),
('c677574e2377ac5f9793768be06f3a4e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367164, ''),
('73aa0b36069166febd3f715d3844e2cf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367177, ''),
('bf516f82450f223416ca69975ec3c8fb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367183, ''),
('767e7690df6b70298d99f81295e5198e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367188, ''),
('daad8f6a97e20dd89b408b5498578073', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367195, ''),
('5c03404f1fb86a520dfda0ec550896da', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367198, ''),
('29766354be9467a12ae7598238034de5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367325, ''),
('0ebbda021abaa07394a81458bd0d4d3d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367204, ''),
('470dc619c9ef2ae589c2e2589e457ed8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367206, ''),
('af2d2e18ed4357799823648ab6962251', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367215, ''),
('95807efea6bb2d877279bdaf9de70151', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367220, ''),
('6954d0f7abca0cef6925b35e1a8a5b36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367391, ''),
('274915cb474e2d4f22131a95d96bbd98', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367593, ''),
('3114cbf5bc473d0c4f2e99aa9b95b1ae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367603, ''),
('59ee4a3ff2d119dd0c5ece6e88d9b50d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367648, ''),
('89e333090debdeba8eb197ce6fbe7004', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372652, ''),
('aca8eab4a73639c85200548c817663a9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367651, ''),
('2f4376cceb8471128e3af3db32f5dedc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367654, ''),
('c0b3bbc07bd344c95dda45e10320d9ae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367658, ''),
('aa11dad930c98534de75a0ca8781eb80', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367698, ''),
('b7e126e425e988ae44c6b4d67875f619', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367702, ''),
('afaf15f5b5a93cea77f714da70ce0bde', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367729, ''),
('04713eb81526aa6159d618b96abf687d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367716, ''),
('b8ba639e0519ffada2bd0ceac84d47ad', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367719, ''),
('afef29a00f279a56379dfac43c153e54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367733, ''),
('d7e693c419393201e4a004a62d217622', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367807, ''),
('1dfaffd9beab1145e1b94e001ae2a892', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367811, ''),
('b6c0c7edde4a83f94a97bd941ea7b79e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367857, ''),
('f96f1ae609ac9c10f3d25cfa177271ce', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367940, ''),
('9af3c67f457dedf2d5cc334a4d7e52a3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367948, ''),
('c9e497f110876518fb304f5931d42009', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367954, ''),
('9dea0c52dd6dadbf849e2e74621d4cbd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367367991, ''),
('85057e7720a4feabe2b5f6c585f8c726', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368008, ''),
('ddfc4a8cd329cfddf98d3a3d9932fae2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368887, ''),
('935aaa8657da77bdb43159e4c5de49c7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368020, ''),
('2b53f2d57678c54c9248ad4b9a324a71', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368024, ''),
('7775566a9dba4c486e6e075061d55803', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368032, ''),
('0398ab9f011f44fc3798f25457c66258', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368044, ''),
('9f6400a86d7e8654a46051e3a439b70c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368054, ''),
('b859af1673c522798d009fc6de4b23f6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368120, ''),
('96adb1f68102e222c6ccab5adb1aec89', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368123, ''),
('e9c6dff983ca6ef5d7c9d8ae63db6c80', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368131, ''),
('63eb48d45b0ab629279148e5f0aa05e8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367370152, ''),
('2933ff4d40b372c4bf7a871ec5e20daf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368137, ''),
('42c9f83ac31610717cabc73622670b68', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368140, ''),
('3c822626c9f3d6108e071a647b1e9c90', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368144, ''),
('2efc00a4c943dd83a7d87b15498cf698', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368397, ''),
('d2597400bee3ff905290abcb26650d62', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368867, ''),
('191c321588056e480b52267cd36fcfe0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368870, ''),
('1db3cb643593c89c1b549519209365b2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368891, ''),
('5b6a553d0d2076e2941cfebe036fa1b1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372634, ''),
('5aa0cba079660b23fcc5d165e1e151b9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368909, ''),
('c5a173c61f7692981a6d1b6b96fac43e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368910, ''),
('013104fec8087cf11120a49d5073e8c6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368917, ''),
('e52e4ebe8c7e8782ef20434e96b6a872', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368933, ''),
('7bfd81e83357cec138a0e95c829a81e2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368925, ''),
('17ffa98f099872046a8c3f6b02df2ff0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368927, ''),
('38d7c2d6e06aa9d468b3bf376df1d77e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367369043, ''),
('d98af401fc96e5a448f45170f4b4cd92', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368957, ''),
('20f9a07d7772956a6a6b772b36edee60', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368959, ''),
('1440624144650890ee8fd8165a254a75', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368995, ''),
('8b80b37841c60074d3f5500b9e2aed4b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367368998, ''),
('cc12e36adb34d949f8a79e12707f673c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367369034, ''),
('8403f3eb1aca9c8cda6f0718fda13972', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367369047, ''),
('a5da340d2309999c20e61dade77770b4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367369058, ''),
('68656696cbd40e02c1599f4d052b00e2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367369052, ''),
('9fd5365d6e5e4f4035685932de1a0ca5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367369053, ''),
('31294ab2d8a825ab865b32203107a8f9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367370159, ''),
('2f010c4e19a4de19e532f8729587eeb8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372680, ''),
('02fe66b9d8bd61f4f7050077ceac98f2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367370166, ''),
('f5409e8addeae618c656bcb5fabc628a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367370170, ''),
('9d9daa1cba267d0d988fc5e026f813f6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367370180, ''),
('3105f72abf3e291e5b0d2e9584bebdae', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367371548, ''),
('1b8f1eea7a2f4009e01bfe086383025c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367371928, ''),
('fcae65b1dc6bbbf9e8e5884f90e9bb54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367371941, ''),
('0c3201e7a6af60dccd23ef35083dbd5b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367371970, ''),
('76d0ccc64b6e61c17c427a4e1a3247cc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372548, ''),
('a151d068906910fb7ac7b067caad573d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372177, ''),
('89a58e10becd3793d39766942b6c6395', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372179, ''),
('f9aee6eaa535b95775eaafb43d36a3d5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372522, ''),
('a22cfac5d5874fbe5b50498e304e6b88', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372524, ''),
('0c670c2ae325438f67c2e7b2b9875851', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372570, ''),
('f1040c20e8a3dac9f74bf24eb44f2051', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372608, ''),
('01016b5cff0238d627ed311715cbf1f5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372601, ''),
('7643a12fe9ab8cc68ea67af8d5056960', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372605, ''),
('0773dd3ea56d0e9590bb8e3a6828343d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372642, ''),
('248eeba19bf6dc865c4c4eacfb615409', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372679, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('08b262dc51817871be6aa3d03205c69c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372670, ''),
('f6246a211c59dc572b829c695e2a93d0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372675, ''),
('23620a01bd30fc430ef62ded427ddfed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372687, ''),
('3157e36ad16641c86678e302df866f33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372693, ''),
('67563cc88b6e3f5b915c1ce53299fae1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372697, ''),
('a9ecd6ed76c9b2e4f5ad30a7d6f6e04b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372704, ''),
('125956c258d992a413ed232c24b83679', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372732, ''),
('087fada14965b00f59cb95bf1a3f69bd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372736, ''),
('2273f851747207e9ab2ed97c56dcd90f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372734, ''),
('6ba2efadfa96124a9c57ca95edc0daed', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372787, ''),
('b37ead481a46f3389865c126529e5b1d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372783, ''),
('8c1373ddb8841a26bdb26ea0d4dc2757', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372791, ''),
('eca5d32590df4d3b86095d297dc092bc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372809, ''),
('8f5dcf13cc4773486493f7d73227e73e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372814, '');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('ac84e5b4749c0e5b4042fac292d73582', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367372827, ''),
('b579f32da9ec53e207e612b52f1421e0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589135, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('bc475fca6d17282d2bb2752a4b5ec071', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589138, ''),
('60718770ccaeebb42772487c604308fd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589139, ''),
('9dce2b9db4e986bbb927426bd22e857f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589162, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('013b66cd0c220e83570b68b541ce8775', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589163, ''),
('7a7f1a5275c842b7bd04765aae1079c0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589164, ''),
('40277e1557394f58c5463e4ea375c9e6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589168, ''),
('9459ea1768a071204b82e8690b0a22f8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589178, ''),
('7997bca5976b863bf339b13d84f7f4f0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589188, ''),
('e91289866d22801b94662800ab78dead', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367589189, ''),
('c2e666ee71842880f27b747389b4b706', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367875483, ''),
('9ed0b9a257a692e4f33d8e65c3c5442b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1367875489, ''),
('cafcbb4c3aca85609ecf3f6099514564', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369442721, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('8cc6f1db322a5fa97a39223d329531d1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369453035, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('a200d48d4e67aafc4374fc535f97081c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369442919, ''),
('2e86d2f2f749da492ea64c925c3927a8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369442925, ''),
('491e4e16ee4110a174bb1d8961607d87', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369442926, ''),
('13b5ea7b083d1236f0d55359d28cc438', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369442928, ''),
('a453632c5c0aba21bd00ef2472bb863e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369442939, ''),
('300d6b7073949b4f94935c093d564acc', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369443548, ''),
('dd9554e9f9874154775d38c7fbd63e01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369443584, ''),
('9787f7a5f8e6bf5a9cb9ecab83165615', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369443602, ''),
('4ff191ce92cca7e1f3c9bda001fbc3e8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369443610, ''),
('9beed3a9fd7df5d3ee6c46fcd765d4fd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369443625, ''),
('48b7d954ef1d29dd4e877852a208b240', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369443641, ''),
('54ae766e6128bb042f0f0f51fd0718c7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369443643, ''),
('85cd3823e14e23c9446c0fa314b2ed90', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31', 1369453043, ''),
('2b8d045e3ff8ba58530a6cb8e791515f', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 1369982136, ''),
('f05833656faf817090bf0488f92049b2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 1369982160, ''),
('0f5687c20b8a25946eff16e66e118e86', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 1370121300, 'a:6:{s:8:"username";s:7:"adminis";s:5:"email";s:15:"admin@gmail.com";s:2:"id";s:2:"11";s:7:"user_id";s:2:"11";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('efd3ea673e651d6f81b32d5acce16da3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 1370088633, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('b2f72c17bff9d060100eee152c859e6a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 1370121302, 'a:5:{s:5:"email";s:15:"admin@gmail.com";s:2:"id";s:2:"11";s:7:"user_id";s:2:"11";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('9a66d0acad5d0d6f7dff3944197f9898', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371898989, 'a:5:{s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('05522d2e6487f512777dd1d76d498edf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371899208, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('48ec4d6322542e25f60f7bc18c351e5c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371862095, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('149cfc998de4bce0b9d1de7b05572b92', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 1370752812, ''),
('18ad18cc3aa019894adbf872dfd37dbf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 1370754058, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('1baf322c46db872580113b41418c13cb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 1370982751, ''),
('f7dff4a0b70c4990b3544be2f22e562d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 1371504091, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('66b6ca9ac81e5dbb3299a3edca643e12', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371862078, ''),
('8165f3e887ee3ddb447c165fb06e2d49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36', 1370215217, 'a:8:{s:8:"category";s:0:"";s:13:"cart_contents";a:3:{s:10:"cart_total";d:14.6039999999999992041921359486877918243408203125;s:11:"total_items";d:1;s:32:"17f41f05fdcd60388b29d084a0f047df";a:16:{s:2:"id";s:1:"2";s:4:"code";s:10:"oreo-wh-BI";s:3:"qty";d:1;s:5:"price";d:14.6039999999999992041921359486877918243408203125;s:8:"tax_band";s:1:"1";s:4:"name";s:23:"Oreo White Cream - Biru";s:4:"slug";s:21:"oreo-white-cream-biru";s:4:"ship";s:1:"1";s:6:"weight";s:4:"0.00";s:5:"image";b:0;s:7:"options";a:3:{i:1;a:6:{s:6:"mod_id";s:1:"1";s:6:"var_id";s:1:"1";s:4:"type";s:1:"1";s:5:"title";s:5:"Warna";s:5:"value";s:4:"Biru";s:5:"price";s:1:"5";}i:2;a:6:{s:6:"mod_id";s:1:"2";s:6:"var_id";s:0:"";s:4:"type";s:1:"2";s:5:"title";s:14:"Jumlah Kancing";s:5:"value";s:0:"";s:5:"price";N;}i:3;a:6:{s:6:"mod_id";s:1:"3";s:6:"var_id";s:1:"3";s:4:"type";s:1:"3";s:5:"title";s:6:"Atasan";s:5:"value";s:23:"Oreo White Cream - Biru";s:5:"price";s:2:"25";}}s:6:"parent";s:1:"1";s:5:"rowid";s:32:"17f41f05fdcd60388b29d084a0f047df";s:8:"subtotal";d:14.6039999999999992041921359486877918243408203125;s:9:"old_price";d:39.60000000000000142108547152020037174224853515625;s:7:"old_sub";s:5:"39.60";}}s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('31776d4b884f1f8a9aacd8e93365e656', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.110 Safari/537.36', 1370752812, ''),
('f70aed7f8e1816c3d13297e9ecf79259', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371947021, 'a:5:{s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('1a3c2f1a693e32224540322b591435d8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371946972, 'a:5:{s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('7a794e3d7eb5175271f0eaa1f0ee2813', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371998491, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('440bc9cadce31177ffd0f247d1fdbccf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1371994313, 'a:6:{s:8:"username";s:4:"toha";s:5:"email";s:20:"toha.samba@yahoo.com";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"3";s:5:"group";s:5:"owner";}'),
('3a6d3841a3a13da758bfe02bb9101605', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36', 1372457149, ''),
('674be1cb3758aa57b595206d3e921d98', '::1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36', 1376357569, ''),
('424dd24483b76eeebda7874e37502358', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36', 1376360862, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('4776276a1bd3fc94fa4d21cd0415ad70', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36', 1376359809, ''),
('ef4efda7750839961ad93e57d2c0750f', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36', 1378103850, ''),
('a5375f4f5f6ecfb0746f30d9385881a9', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36', 1378105712, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('d92f240dbb8c00a680ef8148adae526f', '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.95 Safari/537.36', 1378105724, 'a:6:{s:8:"username";s:6:"yllumi";s:5:"email";s:20:"toha.samba@gmail.com";s:2:"id";s:2:"10";s:7:"user_id";s:2:"10";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}');

-- --------------------------------------------------------

--
-- Table structure for table `default_comments`
--

CREATE TABLE IF NOT EXISTS `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `default_comments`
--

INSERT INTO `default_comments` (`id`, `site_id`, `is_active`, `user_id`, `user_name`, `user_email`, `user_website`, `comment`, `parsed`, `module`, `entry_id`, `entry_title`, `entry_key`, `entry_plural`, `uri`, `cp_uri`, `created_on`, `ip_address`) VALUES
(1, 1, 1, 1, '', '', '', 'sipsip', '<p>sipsip</p>\n', 'blog', '1', 'First Post Siteone', 'blog:post', 'blog:posts', 'blog/2013/04/first-post-siteone', NULL, 1367228711, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `default_comment_blacklists`
--

CREATE TABLE IF NOT EXISTS `default_comment_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `default_contact_log`
--

CREATE TABLE IF NOT EXISTS `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `default_data_fields`
--

CREATE TABLE IF NOT EXISTS `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_namespace` (`field_namespace`),
  KEY `field_slug` (`field_slug`),
  KEY `field_type` (`field_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `default_data_fields`
--

INSERT INTO `default_data_fields` (`id`, `field_name`, `field_slug`, `field_namespace`, `field_type`, `field_data`, `view_options`, `is_locked`) VALUES
(1, 'lang:blog:intro_label', 'intro', 'blogs', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a363a2273696d706c65223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(2, 'lang:pages:body_label', 'body', 'pages', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a383a22616476616e636564223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(3, 'lang:user:first_name_label', 'first_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(4, 'lang:user:last_name_label', 'last_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(5, 'lang:profile_company', 'company', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3130303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(6, 'lang:profile_bio', 'bio', 'users', 'textarea', 0x613a323a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b7d, NULL, 'no'),
(7, 'lang:user:lang', 'lang', 'users', 'pyro_lang', 0x613a313a7b733a31323a2266696c7465725f7468656d65223b733a333a22796573223b7d, NULL, 'no'),
(8, 'lang:profile_dob', 'dob', 'users', 'datetime', 0x613a353a7b733a383a227573655f74696d65223b733a323a226e6f223b733a31303a2273746172745f64617465223b733a353a222d31303059223b733a383a22656e645f64617465223b4e3b733a373a2273746f72616765223b733a343a22756e6978223b733a31303a22696e7075745f74797065223b733a383a2264726f70646f776e223b7d, NULL, 'no'),
(9, 'lang:profile_gender', 'gender', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33343a22203a204e6f742054656c6c696e670a6d203a204d616c650a66203a2046656d616c65223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(10, 'lang:profile_phone', 'phone', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(11, 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(12, 'lang:profile_address_line1', 'address_line1', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(13, 'lang:profile_address_line2', 'address_line2', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(14, 'lang:profile_address_line3', 'address_line3', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(15, 'lang:profile_address_postcode', 'postcode', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(16, 'lang:profile_website', 'website', 'users', 'url', NULL, NULL, 'no'),
(17, 'lang:api:api_key', 'key', 'api', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a34303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(18, 'lang:global:user', 'user_id', 'api', 'user', 0x613a313a7b733a31343a2272657374726963745f67726f7570223b4e3b7d, NULL, 'no'),
(19, 'lang:api:key_level', 'level', 'api', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a323b733a31333a2264656661756c745f76616c7565223b733a313a2231223b7d, NULL, 'no'),
(20, 'lang:api:key_ignore_limits', 'ignore_limits', 'api', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33383a2230203a206c616e673a676c6f62616c3a6e6f0a31203a206c616e673a676c6f62616c3a796573223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a313a2230223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(21, 'lang:api:key_is_active', 'active', 'api', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33383a2230203a206c616e673a676c6f62616c3a6e6f0a31203a206c616e673a676c6f62616c3a796573223b733a31313a2263686f6963655f74797065223b733a353a22726164696f223b733a31333a2264656661756c745f76616c7565223b733a313a2230223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(22, 'Gambar Grup', 'gambar_grup', 'streams', 'image', 0x613a353a7b733a363a22666f6c646572223b4e3b733a31323a22726573697a655f7769647468223b693a3430303b733a31333a22726573697a655f686569676874223b693a3430303b733a31303a226b6565705f726174696f223b4e3b733a31333a22616c6c6f7765645f7479706573223b733a31323a226a70677c6a7065677c706e67223b7d, NULL, 'no'),
(23, 'Judul', 'judul', 'streams', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(24, 'Slug', 'slug', 'streams', 'slug', 0x613a323a7b733a31303a2273706163655f74797065223b733a313a222d223b733a31303a22736c75675f6669656c64223b733a353a226a7564756c223b7d, NULL, 'no'),
(25, 'Deskripsi', 'deskripsi', 'streams', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(26, 'Status', 'status', 'streams', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a31363a226f6e203a204f6e0a6f66203a204f6666223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b733a323a226f6e223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(27, 'Total Topik', 'total_topik', 'streams', 'integer', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31313b733a31333a2264656661756c745f76616c7565223b693a303b7d, NULL, 'no'),
(28, 'Total Thread', 'total_thread', 'streams', 'integer', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31313b733a31333a2264656661756c745f76616c7565223b693a303b7d, NULL, 'no'),
(29, 'Mode Grup', 'mode_grup', 'streams', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33313a227075626c696b203a205075626c696b0a707269766174203a20507269766174223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b733a363a227075626c696b223b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(32, 'Konten', 'konten', 'streams', 'formatted_wysiwyg', 0x613a313a7b733a31313a22656469746f725f74797065223b733a363a2273696d706c65223b7d, NULL, 'no'),
(33, 'Total Komentar', 'total_komentar', 'streams', 'integer', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a31313b733a31333a2264656661756c745f76616c7565223b693a303b7d, NULL, 'no'),
(36, 'Front Content', 'front_content', 'pages', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b733a303a22223b733a31303a22616c6c6f775f74616773223b733a313a2279223b733a31323a22636f6e74656e745f74797065223b733a343a2268746d6c223b7d, NULL, 'no'),
(37, 'Gambar Blog', 'gambar_blog', 'blogs', 'image', 0x613a353a7b733a363a22666f6c646572223b733a313a2238223b733a31323a22726573697a655f7769647468223b733a333a22333030223b733a31333a22726573697a655f686569676874223b733a303a22223b733a31303a226b6565705f726174696f223b733a333a22796573223b733a31333a22616c6c6f7765645f7479706573223b733a31323a226a70677c6a7065677c706e67223b7d, NULL, 'no'),
(38, 'Avatar', 'avatar', 'users', 'image', 0x613a353a7b733a363a22666f6c646572223b733a313a2231223b733a31323a22726573697a655f7769647468223b733a333a22323030223b733a31333a22726573697a655f686569676874223b733a333a22323030223b733a31303a226b6565705f726174696f223b733a333a22796573223b733a31333a22616c6c6f7765645f7479706573223b733a31323a226a70677c6a7065677c706e67223b7d, NULL, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `default_data_field_assignments`
--

CREATE TABLE IF NOT EXISTS `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_id` (`stream_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=51 ;

--
-- Dumping data for table `default_data_field_assignments`
--

INSERT INTO `default_data_field_assignments` (`id`, `sort_order`, `stream_id`, `field_id`, `is_required`, `is_unique`, `instructions`, `field_name`) VALUES
(1, 1, 1, 1, 'yes', 'no', NULL, NULL),
(2, 1, 2, 2, 'no', 'no', NULL, NULL),
(3, 1, 3, 3, 'yes', 'no', NULL, NULL),
(4, 2, 3, 4, 'yes', 'no', NULL, NULL),
(5, 3, 3, 5, 'no', 'no', NULL, NULL),
(6, 4, 3, 6, 'no', 'no', NULL, NULL),
(7, 5, 3, 7, 'no', 'no', NULL, NULL),
(8, 6, 3, 8, 'no', 'no', NULL, NULL),
(9, 7, 3, 9, 'no', 'no', NULL, NULL),
(10, 8, 3, 10, 'no', 'no', NULL, NULL),
(11, 9, 3, 11, 'no', 'no', NULL, NULL),
(12, 10, 3, 12, 'no', 'no', NULL, NULL),
(13, 11, 3, 13, 'no', 'no', NULL, NULL),
(14, 12, 3, 14, 'no', 'no', NULL, NULL),
(15, 13, 3, 15, 'no', 'no', NULL, NULL),
(16, 14, 3, 16, 'no', 'no', NULL, NULL),
(17, 1, 4, 17, 'yes', 'yes', NULL, NULL),
(18, 2, 4, 18, 'yes', 'no', NULL, NULL),
(19, 3, 4, 19, 'yes', 'no', NULL, NULL),
(20, 4, 4, 20, 'no', 'no', NULL, NULL),
(48, 1, 10, 36, 'yes', 'no', '', NULL),
(49, 2, 1, 37, 'no', 'no', '', NULL),
(50, 15, 3, 38, 'no', 'no', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_data_streams`
--

CREATE TABLE IF NOT EXISTS `default_data_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_slug` (`stream_slug`),
  KEY `stream_namespace` (`stream_namespace`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `default_data_streams`
--

INSERT INTO `default_data_streams` (`id`, `stream_name`, `stream_slug`, `stream_namespace`, `stream_prefix`, `about`, `view_options`, `title_column`, `sorting`, `permissions`, `is_hidden`, `menu_path`) VALUES
(1, 'lang:blog:blog_title', 'blog', 'blogs', NULL, NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(2, 'Default', 'def_page_fields', 'pages', NULL, 'A simple page type with a WYSIWYG editor that will get you started adding content.', 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(3, 'lang:user_profile_fields_label', 'profiles', 'users', NULL, 'Profiles for users module', 0x613a313a7b693a303b733a31323a22646973706c61795f6e616d65223b7d, 'display_name', 'title', NULL, 'no', NULL),
(4, 'lang:api:api_keys', 'keys', 'api', 'api_', NULL, 0x613a353a7b693a303b733a323a226964223b693a313b733a333a226b6579223b693a323b733a373a22757365725f6964223b693a333b733a353a226c6576656c223b693a343b733a373a2263726561746564223b7d, 'key', 'title', NULL, 'no', NULL),
(10, 'Page Type Front Page', 'front_page', 'pages', 'pages_', NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, 'front_content', 'title', NULL, 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_data_stream_searches`
--

CREATE TABLE IF NOT EXISTS `default_data_stream_searches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stream_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `search_term` text COLLATE utf8_unicode_ci,
  `ip_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_results` int(11) NOT NULL,
  `query_string` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `default_def_page_fields`
--

CREATE TABLE IF NOT EXISTS `default_def_page_fields` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `default_def_page_fields`
--

INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`) VALUES
(2, '2013-04-07 08:25:46', NULL, 1, NULL, '<p>To contact us please fill out the form below.</p>\r\n				{{ contact:form name="text|required" email="text|required|valid_email" subject="dropdown|Support|Sales|Feedback|Other" message="textarea" attachment="file|zip" }}\r\n					<div><label for="name">Name:</label>{{ name }}</div>\r\n					<div><label for="email">Email:</label>{{ email }}</div>\r\n					<div><label for="subject">Subject:</label>{{ subject }}</div>\r\n					<div><label for="message">Message:</label>{{ message }}</div>\r\n					<div><label for="attachment">Attach  a zip file:</label>{{ attachment }}</div>\r\n				{{ /contact:form }}'),
(3, '2013-04-07 08:25:46', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}'),
(4, '2013-04-07 08:25:46', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for "{{ query }}".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href="{{ url }}">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}'),
(5, '2013-04-07 08:25:46', '2013-04-29 12:42:08', 1, NULL, '<p>We cannot find the page you are looking for, please click <a href="{{ pages:url id=''1'' }}" title="Home">here</a> to go to the homepage.</p>\r\n'),
(6, '2013-04-07 08:25:46', '2013-04-29 12:43:34', 1, NULL, '<p>Welcome to our Sitetwo homepage. We have not quite finished setting up our website yet, but please add us to your bookmarks and come back soon.</p>\r\n'),
(7, '2013-04-29 12:02:27', '2013-04-29 12:43:08', 2, 1, 'Bismillah. ini halaman sagala two (baca: tuwow)'),
(9, '2013-04-30 14:32:56', NULL, 2, 1, 'Halaman yang Anda cari tidak ada.');

-- --------------------------------------------------------

--
-- Table structure for table `default_email_templates`
--

CREATE TABLE IF NOT EXISTS `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `default_email_templates`
--

INSERT INTO `default_email_templates` (`id`, `slug`, `name`, `description`, `subject`, `body`, `lang`, `is_default`, `module`) VALUES
(1, 'comments', 'Comment Notification', 'Email that is sent to admin when someone creates a comment', 'You have just received a comment from {{ name }}', '<h3>You have received a comment from {{ name }}</h3>\r\n				<p>\r\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\r\n				<strong>Operating System: {{ sender_os }}<br/>\r\n				<strong>User Agent: {{ sender_agent }}</strong>\r\n				</p>\r\n				<p>{{ comment }}</p>\r\n				<p>View Comment: {{ redirect_url }}</p>', 'en', 1, 'comments'),
(2, 'contact', 'Contact Notification', 'Template for the contact form', '{{ settings:site_name }} :: {{ subject }}', 'This message was sent via the contact form on with the following details:\r\n				<hr />\r\n				IP Address: {{ sender_ip }}\r\n				OS {{ sender_os }}\r\n				Agent {{ sender_agent }}\r\n				<hr />\r\n				{{ message }}\r\n\r\n				{{ name }},\r\n\r\n				{{ email }}', 'en', 1, 'pages'),
(3, 'registered', 'New User Registered', 'Email sent to the site contact e-mail when a new user registers', '{{ settings:site_name }} :: You have just received a registration from {{ name }}', '<h3>You have received a registration from {{ name }}</h3>\r\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\r\n				<strong>Operating System: {{ sender_os }}</strong><br/>\r\n				<strong>User Agent: {{ sender_agent }}</strong>\r\n				</p>', 'en', 1, 'users'),
(4, 'activation', 'Activation Email', 'The email which contains the activation code that is sent to a new user', '{{ settings:site_name }} - Account Activation', '<p>Hello {{ user:first_name }},</p>\r\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\r\n				<p><a href="{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\r\n				<p>&nbsp;</p>\r\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\r\n				<p><a href="{{ url:site }}users/activate">{{ url:site }}users/activate</a></p>\r\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>', 'en', 1, 'users'),
(5, 'forgotten_password', 'Forgotten Password Email', 'The email that is sent containing a password reset code', '{{ settings:site_name }} - Forgotten Password', '<p>Hello {{ user:first_name }},</p>\r\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href="{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\r\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>', 'en', 1, 'users'),
(6, 'new_password', 'New Password Email', 'After a password is reset this email is sent containing the new password', '{{ settings:site_name }} - New Password', '<p>Hello {{ user:first_name }},</p>\r\n				<p>Your new password is: {{ new_password }}</p>\r\n				<p>After logging in you may change your password by visiting <a href="{{ url:site }}edit-profile">{{ url:site }}edit-profile</a></p>', 'en', 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `default_files`
--

CREATE TABLE IF NOT EXISTS `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `folder_id` (`folder_id`),
  KEY `filename` (`filename`),
  KEY `type` (`type`),
  KEY `extension` (`extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_files`
--

INSERT INTO `default_files` (`id`, `site_id`, `folder_id`, `user_id`, `type`, `name`, `filename`, `path`, `description`, `extension`, `mimetype`, `keywords`, `width`, `height`, `filesize`, `alt_attribute`, `download_count`, `date_added`, `sort`) VALUES
('09b88ea4d667216', 1, 19, 10, 'i', '1-thumb.jpg', 'c03bb9d1cde03c89443ad8ee741c9370.jpg', '{{ url:site }}files/large/c03bb9d1cde03c89443ad8ee741c9370.jpg', '', '.jpg', 'image/jpeg', '', 170, 160, 37, '', 0, 1370138630, 2),
('26819885fb0c025', 1, 19, 10, 'i', 'cross.png', '603630e3d4cbc971265b62bacd06e59d.png', '{{ url:site }}files/large/603630e3d4cbc971265b62bacd06e59d.png', '', '.png', 'image/png', '', 200, 194, 10, '', 0, 1370138133, 1),
('2fe547336467ca5', 2, 5, 2, 'd', 'urls.txt', '41be507cf4bdeb449d1f8fee26b1085c.txt', '{{ url:site }}files/download/2fe547336467ca5', '', '.txt', 'text/plain', '', 0, 0, 0, 'undefined', 0, 1367153078, 0),
('3325887a754b646', 1, 1, 2, 'd', 'Statistik Pengguna Internet', 'e8b97038f5483100a04b7ef3c925b2c4.pdf', '{{ url:site }}files/download/3325887a754b646', '', '.pdf', 'application/pdf', '', 0, 0, 2081, 'undefined', 2, 1367141356, 0),
('40d569131c2c85b', 1, 18, 10, 'i', 'cross.png', '603630e3d4cbc971265b62bacd06e59d.png', '{{ url:site }}files/large/603630e3d4cbc971265b62bacd06e59d.png', '', '.png', 'image/png', '', 200, 194, 10, '', 0, 1370138133, 1),
('505fe6e59e4d8a7', 1, 20, 10, 'i', 'cross.png', 'a9e88627bf844590525311d94be99eda.png', '{{ url:site }}files/large/a9e88627bf844590525311d94be99eda.png', '', '.png', 'image/png', '', 200, 194, 10, '', 0, 1370156273, 0),
('65e4ad06f5fdb49', 1, 1, 10, 'i', 'large.jpg', '8c43768e880d190490087c570ee67421.jpg', '{{ url:site }}files/large/8c43768e880d190490087c570ee67421.jpg', '', '.jpg', 'image/jpeg', '', 200, 200, 206, '', 0, 1370128535, 0),
('69469def9ee7467', 1, 12, 10, 'i', 'Saatnya Syiar ke Luar Organisasi.jpg', 'c124a4cb4f4e5880feda46143393998f.jpg', '{{ url:site }}files/large/c124a4cb4f4e5880feda46143393998f.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cum necessitatibus voluptatem laborum atque maxime totam nostrum quae a eaque doloribus distinctio hic placeat quis voluptatum sint libero vero officia molestiae.\n<a href="#">Selengkapnya..</a>', '.jpg', 'image/jpeg', '', 640, 250, 24, '', 0, 1370046333, 0),
('71e5ab353bf3fc9', 1, 1, 10, 'i', '100_7757.jpg', '089497a96d484f24e5e07d06d391bc5f.jpg', '{{ url:site }}files/large/089497a96d484f24e5e07d06d391bc5f.jpg', '', '.jpg', 'image/jpeg', '', 668, 891, 452, '', 0, 1370128331, 0),
('7309a155d1dd826', 1, 18, 10, 'i', 'large.jpg', '8fd109b032971a440b3e518f6e7cc35b.jpg', '{{ url:site }}files/large/8fd109b032971a440b3e518f6e7cc35b.jpg', '', '.jpg', 'image/jpeg', '', 952, 952, 206, '', 0, 1370138617, 0),
('8eb7f156a3e6d6d', 1, 19, 10, 'i', 'large.jpg', '8fd109b032971a440b3e518f6e7cc35b.jpg', '{{ url:site }}files/large/8fd109b032971a440b3e518f6e7cc35b.jpg', '', '.jpg', 'image/jpeg', '', 952, 952, 206, '', 0, 1370138617, 0),
('8ecb565b39d1e73', 2, 5, 2, 'd', 'evaluasi madfront v1.0.txt', 'd8c88442c602e4238228d8b6c96a91f5.txt', '{{ url:site }}files/download/8ecb565b39d1e73', '', '.txt', 'text/plain', '', 0, 0, 8, 'undefined', 0, 1367152941, 0),
('9517fd0bf8faa65', 2, 5, 2, 'd', 'knowledge base bisnis website.doc', '0663e2713c4a03396ca0afc1f059130c.doc', '{{ url:site }}files/download/9517fd0bf8faa65', '', '.doc', 'application/msword', '', 0, 0, 46, 'undefined', 0, 1367152962, 0),
('9efe985b3bfe79c', 1, 12, 10, 'i', 'Menakar Idealisme Organisasi.jpg', '371d3b6212dc24efb21105b4c9f65dcb.jpg', '{{ url:site }}files/large/371d3b6212dc24efb21105b4c9f65dcb.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis quam maiores placeat repudiandae rerum tempora cumque aliquam sit quia modi nam voluptas! Ullam itaque id accusantium pariatur consectetur quasi nulla.\n<a href="#">Selengkapnya..</a>', '.jpg', 'image/jpeg', '', 640, 250, 31, '', 0, 1370046342, 0),
('9f28d460943870d', 1, 18, 10, 'i', 'avatar-2.jpg', '07f6c28489bcea0c8f188e5af68fa855.jpg', '{{ url:site }}files/large/07f6c28489bcea0c8f188e5af68fa855.jpg', '', '.jpg', 'image/jpeg', '', 225, 225, 66, '', 0, 1370138675, 3),
('aaff557a86846e0', 2, 9, 2, 'i', '539515-sunakobefore_super.jpg', '1abf09ac65775ab79ec0fe6f08d22b3b.jpg', '{{ url:site }}files/large/1abf09ac65775ab79ec0fe6f08d22b3b.jpg', '', '.jpg', 'image/jpeg', '', 147, 447, 20, '', 0, 1367156503, 0),
('bebb8165b4f552b', 1, 19, 10, 'i', 'avatar-2.jpg', '07f6c28489bcea0c8f188e5af68fa855.jpg', '{{ url:site }}files/large/07f6c28489bcea0c8f188e5af68fa855.jpg', '', '.jpg', 'image/jpeg', '', 225, 225, 66, '', 0, 1370138675, 3),
('cff3481c143e510', 1, 18, 10, 'i', '1-thumb.jpg', 'c03bb9d1cde03c89443ad8ee741c9370.jpg', '{{ url:site }}files/large/c03bb9d1cde03c89443ad8ee741c9370.jpg', '', '.jpg', 'image/jpeg', '', 170, 160, 37, '', 0, 1370138630, 2),
('f48a1e03bbffee0', 1, 1, 10, 'i', '1-thumb.jpg', '26048e210a59a0a441cc394725125d7a.jpg', '{{ url:site }}files/large/26048e210a59a0a441cc394725125d7a.jpg', '', '.jpg', 'image/jpeg', '', 200, 189, 37, '', 0, 1370128732, 0),
('fdd1970298d5d2c', 2, 5, 2, 'i', 'sunade', '1419e8c54c79430e3fad755e969612e7.jpg', '{{ url:site }}files/large/1419e8c54c79430e3fad755e969612e7.jpg', '', '.jpg', 'image/jpeg', '', 480, 640, 44, '', 0, 1367156546, 0),
('ff48008499d6113', 1, 8, 10, 'i', 'saatnya-syiar-ke-luar-organisasi.jpg', '7391db612646f0073a73cec8efbd34f6.jpg', '{{ url:site }}files/large/7391db612646f0073a73cec8efbd34f6.jpg', '', '.jpg', 'image/jpeg', '', 300, 118, 24, '', 0, 1370047554, 0);

-- --------------------------------------------------------

--
-- Table structure for table `default_file_folders`
--

CREATE TABLE IF NOT EXISTS `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `default_file_folders`
--

INSERT INTO `default_file_folders` (`id`, `site_id`, `parent_id`, `slug`, `name`, `location`, `remote_container`, `date_added`, `sort`, `hidden`) VALUES
(1, 1, 0, 'folderone', 'folderone', 'local', '', 1367141317, 1367141317, 0),
(5, 2, 0, 'aaaa', 'aaaa', 'local', '', 1367152930, 1367152930, 0),
(8, 1, 1, 'baru', 'baru', 'local', '', 1367153323, 0, 0),
(9, 2, 0, 'b', 'b', 'local', '', 1367153899, 1367153899, 0),
(10, 1, 0, 'nyandiscuss', 'Nyandiscuss', 'local', '', 1370043055, 1370043055, 0),
(11, 1, 0, 'sliders-module', 'Sliders Module', 'local', '', 1370046239, 0, 0),
(12, 1, 11, 'frontslide', 'Frontslide', 'local', '', 1370046281, 1370046281, 0),
(15, 1, 0, 'brand-images', 'Brand Images', 'local', '', 1370137880, 1370137880, 0),
(16, 1, 0, 'product-images', 'Product Images', 'local', '', 1370137881, 1370137881, 0),
(17, 1, 16, 'oreo-white-cream', 'Oreo White Cream', 'local', '', 1370138133, 1370138133, 0),
(18, 1, 17, 'oreo-white-cream-2', 'Oreo White Cream (2)', 'local', '', 1370155514, 1370155514, 0),
(19, 1, 17, 'oreo-white-cream-3', 'Oreo White Cream (3)', 'local', '', 1370155543, 1370155543, 0),
(20, 1, 15, 'ibm', 'IBM', 'local', '', 1370156273, 1370156273, 0);

-- --------------------------------------------------------

--
-- Table structure for table `default_groups`
--

CREATE TABLE IF NOT EXISTS `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `default_groups`
--

INSERT INTO `default_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'user', 'User'),
(3, 'owner', 'Owner');

-- --------------------------------------------------------

--
-- Table structure for table `default_keywords`
--

CREATE TABLE IF NOT EXISTS `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `default_keywords`
--

INSERT INTO `default_keywords` (`id`, `name`) VALUES
(1, 'tagone'),
(2, 'tagtwo');

-- --------------------------------------------------------

--
-- Table structure for table `default_keywords_applied`
--

CREATE TABLE IF NOT EXISTS `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `default_keywords_applied`
--

INSERT INTO `default_keywords_applied` (`id`, `hash`, `keyword_id`) VALUES
(2, 'b663b3c85f1ac6df9d633df46a002c0d', 2),
(5, '1a015b4efdc115351ad0d10e184b1482', 1);

-- --------------------------------------------------------

--
-- Table structure for table `default_migrations`
--

CREATE TABLE IF NOT EXISTS `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `default_migrations`
--

INSERT INTO `default_migrations` (`version`) VALUES
(128);

-- --------------------------------------------------------

--
-- Table structure for table `default_modules`
--

CREATE TABLE IF NOT EXISTS `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=48 ;

--
-- Dumping data for table `default_modules`
--

INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(1, 'a:25:{s:2:"en";s:8:"Settings";s:2:"ar";s:18:"الإعدادات";s:2:"br";s:15:"Configurações";s:2:"pt";s:15:"Configurações";s:2:"cs";s:10:"Nastavení";s:2:"da";s:13:"Indstillinger";s:2:"de";s:13:"Einstellungen";s:2:"el";s:18:"Ρυθμίσεις";s:2:"es";s:15:"Configuraciones";s:2:"fa";s:14:"تنظیمات";s:2:"fi";s:9:"Asetukset";s:2:"fr";s:11:"Paramètres";s:2:"he";s:12:"הגדרות";s:2:"id";s:10:"Pengaturan";s:2:"it";s:12:"Impostazioni";s:2:"lt";s:10:"Nustatymai";s:2:"nl";s:12:"Instellingen";s:2:"pl";s:10:"Ustawienia";s:2:"ru";s:18:"Настройки";s:2:"sl";s:10:"Nastavitve";s:2:"tw";s:12:"網站設定";s:2:"cn";s:12:"网站设定";s:2:"hu";s:14:"Beállítások";s:2:"th";s:21:"ตั้งค่า";s:2:"se";s:14:"Inställningar";}', 'settings', '1.0.0', NULL, 'a:25:{s:2:"en";s:89:"Allows administrators to update settings like Site Name, messages and email address, etc.";s:2:"ar";s:161:"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.";s:2:"br";s:120:"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.";s:2:"pt";s:113:"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.";s:2:"cs";s:102:"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.";s:2:"da";s:90:"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.";s:2:"de";s:92:"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.";s:2:"el";s:230:"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.";s:2:"es";s:131:"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.";s:2:"fa";s:105:"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود";s:2:"fi";s:105:"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.";s:2:"fr";s:118:"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.";s:2:"he";s:116:"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו";s:2:"id";s:112:"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.";s:2:"it";s:109:"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.";s:2:"lt";s:104:"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.";s:2:"nl";s:114:"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.";s:2:"pl";s:103:"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.";s:2:"ru";s:135:"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.";s:2:"sl";s:98:"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.";s:2:"tw";s:99:"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。";s:2:"cn";s:99:"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。";s:2:"hu";s:125:"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...";s:2:"th";s:232:"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น";s:2:"se";s:84:"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.";}', 1, 0, 1, 'settings', 1, 1, 1, 1378105477),
(2, 'a:11:{s:2:"en";s:12:"Streams Core";s:2:"pt";s:14:"Núcleo Fluxos";s:2:"fr";s:10:"Noyau Flux";s:2:"el";s:23:"Πυρήνας Ροών";s:2:"se";s:18:"Streams grundmodul";s:2:"tw";s:14:"Streams 核心";s:2:"cn";s:14:"Streams 核心";s:2:"ar";s:31:"الجداول الأساسية";s:2:"it";s:12:"Streams Core";s:2:"fa";s:26:"هسته استریم ها";s:2:"fi";s:13:"Striimit ydin";}', 'streams_core', '1.0.0', NULL, 'a:11:{s:2:"en";s:29:"Core data module for streams.";s:2:"pt";s:37:"Módulo central de dados para fluxos.";s:2:"fr";s:32:"Noyau de données pour les Flux.";s:2:"el";s:113:"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.";s:2:"se";s:50:"Streams grundmodul för enklare hantering av data.";s:2:"tw";s:29:"Streams 核心資料模組。";s:2:"cn";s:29:"Streams 核心资料模组。";s:2:"ar";s:57:"وحدة البيانات الأساسية للجداول";s:2:"it";s:17:"Core dello Stream";s:2:"fa";s:48:"ماژول مرکزی برای استریم ها";s:2:"fi";s:48:"Ydin datan hallinoiva moduuli striimejä varten.";}', 1, 0, 0, '0', 1, 1, 1, 1378105477),
(3, 'a:25:{s:2:"en";s:7:"Add-ons";s:2:"ar";s:16:"الإضافات";s:2:"br";s:12:"Complementos";s:2:"pt";s:12:"Complementos";s:2:"cs";s:8:"Doplňky";s:2:"da";s:7:"Add-ons";s:2:"de";s:13:"Erweiterungen";s:2:"el";s:16:"Πρόσθετα";s:2:"es";s:9:"Agregados";s:2:"fa";s:17:"افزونه ها";s:2:"fi";s:9:"Lisäosat";s:2:"fr";s:10:"Extensions";s:2:"he";s:12:"תוספות";s:2:"id";s:7:"Pengaya";s:2:"it";s:7:"Add-ons";s:2:"lt";s:7:"Priedai";s:2:"nl";s:7:"Add-ons";s:2:"pl";s:12:"Rozszerzenia";s:2:"ru";s:20:"Дополнения";s:2:"sl";s:11:"Razširitve";s:2:"tw";s:12:"附加模組";s:2:"cn";s:12:"附加模组";s:2:"hu";s:14:"Bővítmények";s:2:"th";s:27:"ส่วนเสริม";s:2:"se";s:8:"Tillägg";}', 'addons', '2.0.0', NULL, 'a:25:{s:2:"en";s:59:"Allows admins to see a list of currently installed modules.";s:2:"ar";s:91:"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.";s:2:"br";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"pt";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"cs";s:68:"Umožňuje administrátorům vidět seznam nainstalovaných modulů.";s:2:"da";s:63:"Lader administratorer se en liste over de installerede moduler.";s:2:"de";s:56:"Zeigt Administratoren alle aktuell installierten Module.";s:2:"el";s:152:"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.";s:2:"es";s:71:"Permite a los administradores ver una lista de los módulos instalados.";s:2:"fa";s:93:"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت";s:2:"fi";s:60:"Listaa järjestelmänvalvojalle käytössä olevat moduulit.";s:2:"fr";s:66:"Permet aux administrateurs de voir la liste des modules installés";s:2:"he";s:160:"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים";s:2:"id";s:57:"Memperlihatkan kepada admin daftar modul yang terinstall.";s:2:"it";s:83:"Permette agli amministratori di vedere una lista dei moduli attualmente installati.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:79:"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.";s:2:"pl";s:81:"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.";s:2:"ru";s:83:"Список модулей, которые установлены на сайте.";s:2:"sl";s:65:"Dovoljuje administratorjem pregled trenutno nameščenih modulov.";s:2:"tw";s:54:"管理員可以檢視目前已經安裝模組的列表";s:2:"cn";s:54:"管理员可以检视目前已经安装模组的列表";s:2:"hu";s:79:"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.";s:2:"th";s:162:"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน";s:2:"se";s:67:"Gör det möjligt för administratören att se installerade mouler.";}', 0, 0, 1, '0', 1, 1, 1, 1378105477),
(4, 'a:17:{s:2:"en";s:4:"Blog";s:2:"ar";s:16:"المدوّنة";s:2:"br";s:4:"Blog";s:2:"pt";s:4:"Blog";s:2:"el";s:18:"Ιστολόγιο";s:2:"fa";s:8:"بلاگ";s:2:"he";s:8:"בלוג";s:2:"id";s:4:"Blog";s:2:"lt";s:6:"Blogas";s:2:"pl";s:4:"Blog";s:2:"ru";s:8:"Блог";s:2:"tw";s:6:"文章";s:2:"cn";s:6:"文章";s:2:"hu";s:4:"Blog";s:2:"fi";s:5:"Blogi";s:2:"th";s:15:"บล็อก";s:2:"se";s:5:"Blogg";}', 'blog', '2.0.0', NULL, 'a:25:{s:2:"en";s:18:"Post blog entries.";s:2:"ar";s:48:"أنشر المقالات على مدوّنتك.";s:2:"br";s:30:"Escrever publicações de blog";s:2:"pt";s:39:"Escrever e editar publicações no blog";s:2:"cs";s:49:"Publikujte nové články a příspěvky na blog.";s:2:"da";s:17:"Skriv blogindlæg";s:2:"de";s:47:"Veröffentliche neue Artikel und Blog-Einträge";s:2:"sl";s:23:"Objavite blog prispevke";s:2:"fi";s:28:"Kirjoita blogi artikkeleita.";s:2:"el";s:93:"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.";s:2:"es";s:54:"Escribe entradas para los artículos y blog (web log).";s:2:"fa";s:44:"مقالات منتشر شده در بلاگ";s:2:"fr";s:34:"Poster des articles d''actualités.";s:2:"he";s:19:"ניהול בלוג";s:2:"id";s:15:"Post entri blog";s:2:"it";s:36:"Pubblica notizie e post per il blog.";s:2:"lt";s:40:"Rašykite naujienas bei blog''o įrašus.";s:2:"nl";s:41:"Post nieuwsartikelen en blogs op uw site.";s:2:"pl";s:27:"Dodawaj nowe wpisy na blogu";s:2:"ru";s:49:"Управление записями блога.";s:2:"tw";s:42:"發表新聞訊息、部落格等文章。";s:2:"cn";s:42:"发表新闻讯息、部落格等文章。";s:2:"th";s:48:"โพสต์รายการบล็อก";s:2:"hu";s:32:"Blog bejegyzések létrehozása.";s:2:"se";s:18:"Inlägg i bloggen.";}', 1, 1, 1, 'content', 1, 1, 1, 1378105477),
(5, 'a:25:{s:2:"en";s:8:"Comments";s:2:"ar";s:18:"التعليقات";s:2:"br";s:12:"Comentários";s:2:"pt";s:12:"Comentários";s:2:"cs";s:11:"Komentáře";s:2:"da";s:11:"Kommentarer";s:2:"de";s:10:"Kommentare";s:2:"el";s:12:"Σχόλια";s:2:"es";s:11:"Comentarios";s:2:"fi";s:9:"Kommentit";s:2:"fr";s:12:"Commentaires";s:2:"fa";s:10:"نظرات";s:2:"he";s:12:"תגובות";s:2:"id";s:8:"Komentar";s:2:"it";s:8:"Commenti";s:2:"lt";s:10:"Komentarai";s:2:"nl";s:8:"Reacties";s:2:"pl";s:10:"Komentarze";s:2:"ru";s:22:"Комментарии";s:2:"sl";s:10:"Komentarji";s:2:"tw";s:6:"回應";s:2:"cn";s:6:"回应";s:2:"hu";s:16:"Hozzászólások";s:2:"th";s:33:"ความคิดเห็น";s:2:"se";s:11:"Kommentarer";}', 'comments', '1.1.0', NULL, 'a:25:{s:2:"en";s:76:"Users and guests can write comments for content like blog, pages and photos.";s:2:"ar";s:152:"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.";s:2:"br";s:97:"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"pt";s:100:"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"cs";s:100:"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.";s:2:"da";s:83:"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.";s:2:"de";s:65:"Benutzer und Gäste können für fast alles Kommentare schreiben.";s:2:"el";s:224:"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.";s:2:"es";s:130:"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.";s:2:"fa";s:168:"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند";s:2:"fi";s:107:"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.";s:2:"fr";s:130:"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.";s:2:"he";s:94:"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו";s:2:"id";s:100:"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.";s:2:"it";s:85:"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:52:"Gebruikers en gasten kunnen reageren op bijna alles.";s:2:"pl";s:93:"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.";s:2:"ru";s:187:"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.";s:2:"sl";s:89:"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike";s:2:"tw";s:75:"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。";s:2:"cn";s:75:"用户和访客可以针对新闻、页面与照片等内容发表回应。";s:2:"hu";s:117:"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).";s:2:"th";s:240:"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย";s:2:"se";s:98:"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.";}', 0, 0, 1, 'content', 1, 1, 1, 1378105477),
(6, 'a:25:{s:2:"en";s:7:"Contact";s:2:"ar";s:14:"الإتصال";s:2:"br";s:7:"Contato";s:2:"pt";s:8:"Contacto";s:2:"cs";s:7:"Kontakt";s:2:"da";s:7:"Kontakt";s:2:"de";s:7:"Kontakt";s:2:"el";s:22:"Επικοινωνία";s:2:"es";s:8:"Contacto";s:2:"fa";s:18:"تماس با ما";s:2:"fi";s:13:"Ota yhteyttä";s:2:"fr";s:7:"Contact";s:2:"he";s:17:"יצירת קשר";s:2:"id";s:6:"Kontak";s:2:"it";s:10:"Contattaci";s:2:"lt";s:18:"Kontaktinė formą";s:2:"nl";s:7:"Contact";s:2:"pl";s:7:"Kontakt";s:2:"ru";s:27:"Обратная связь";s:2:"sl";s:7:"Kontakt";s:2:"tw";s:12:"聯絡我們";s:2:"cn";s:12:"联络我们";s:2:"hu";s:9:"Kapcsolat";s:2:"th";s:18:"ติดต่อ";s:2:"se";s:7:"Kontakt";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:"en";s:112:"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.";s:2:"ar";s:157:"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.";s:2:"br";s:139:"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.";s:2:"pt";s:116:"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.";s:2:"cs";s:149:"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.";s:2:"da";s:123:"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse";s:2:"de";s:119:"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.";s:2:"el";s:273:"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.";s:2:"fa";s:239:"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.";s:2:"es";s:156:"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.";s:2:"fi";s:128:"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.";s:2:"fr";s:122:"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.";s:2:"he";s:155:"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות";s:2:"id";s:149:"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka";s:2:"it";s:119:"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.";s:2:"lt";s:124:"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.";s:2:"nl";s:125:"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.";s:2:"pl";s:126:"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.";s:2:"ru";s:234:"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.";s:2:"sl";s:113:"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.";s:2:"tw";s:147:"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。";s:2:"cn";s:147:"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。";s:2:"th";s:316:"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา";s:2:"hu";s:156:"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.";s:2:"se";s:53:"Lägger till ett kontaktformulär till din webbplats.";}', 0, 0, 0, '0', 1, 1, 1, 1378105477),
(7, 'a:24:{s:2:"en";s:5:"Files";s:2:"ar";s:16:"الملفّات";s:2:"br";s:8:"Arquivos";s:2:"pt";s:9:"Ficheiros";s:2:"cs";s:7:"Soubory";s:2:"da";s:5:"Filer";s:2:"de";s:7:"Dateien";s:2:"el";s:12:"Αρχεία";s:2:"es";s:8:"Archivos";s:2:"fa";s:13:"فایل ها";s:2:"fi";s:9:"Tiedostot";s:2:"fr";s:8:"Fichiers";s:2:"he";s:10:"קבצים";s:2:"id";s:4:"File";s:2:"it";s:4:"File";s:2:"lt";s:6:"Failai";s:2:"nl";s:9:"Bestanden";s:2:"ru";s:10:"Файлы";s:2:"sl";s:8:"Datoteke";s:2:"tw";s:6:"檔案";s:2:"cn";s:6:"档案";s:2:"hu";s:7:"Fájlok";s:2:"th";s:12:"ไฟล์";s:2:"se";s:5:"Filer";}', 'files', '2.0.0', NULL, 'a:24:{s:2:"en";s:40:"Manages files and folders for your site.";s:2:"ar";s:50:"إدارة ملفات ومجلّدات موقعك.";s:2:"br";s:53:"Permite gerenciar facilmente os arquivos de seu site.";s:2:"pt";s:59:"Permite gerir facilmente os ficheiros e pastas do seu site.";s:2:"cs";s:43:"Spravujte soubory a složky na vašem webu.";s:2:"da";s:41:"Administrer filer og mapper for dit site.";s:2:"de";s:35:"Verwalte Dateien und Verzeichnisse.";s:2:"el";s:100:"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.";s:2:"es";s:43:"Administra archivos y carpetas en tu sitio.";s:2:"fa";s:79:"مدیریت فایل های چند رسانه ای و فولدر ها سایت";s:2:"fi";s:43:"Hallitse sivustosi tiedostoja ja kansioita.";s:2:"fr";s:46:"Gérer les fichiers et dossiers de votre site.";s:2:"he";s:47:"ניהול תיקיות וקבצים שבאתר";s:2:"id";s:42:"Mengatur file dan folder dalam situs Anda.";s:2:"it";s:38:"Gestisci file e cartelle del tuo sito.";s:2:"lt";s:28:"Katalogų ir bylų valdymas.";s:2:"nl";s:41:"Beheer bestanden en mappen op uw website.";s:2:"ru";s:78:"Управление файлами и папками вашего сайта.";s:2:"sl";s:38:"Uredi datoteke in mape na vaši strani";s:2:"tw";s:33:"管理網站中的檔案與目錄";s:2:"cn";s:33:"管理网站中的档案与目录";s:2:"hu";s:41:"Fájlok és mappák kezelése az oldalon.";s:2:"th";s:141:"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ";s:2:"se";s:45:"Hanterar filer och mappar för din webbplats.";}', 0, 0, 1, 'content', 1, 1, 1, 1378105477),
(8, 'a:24:{s:2:"en";s:6:"Groups";s:2:"ar";s:18:"المجموعات";s:2:"br";s:6:"Grupos";s:2:"pt";s:6:"Grupos";s:2:"cs";s:7:"Skupiny";s:2:"da";s:7:"Grupper";s:2:"de";s:7:"Gruppen";s:2:"el";s:12:"Ομάδες";s:2:"es";s:6:"Grupos";s:2:"fa";s:13:"گروه ها";s:2:"fi";s:7:"Ryhmät";s:2:"fr";s:7:"Groupes";s:2:"he";s:12:"קבוצות";s:2:"id";s:4:"Grup";s:2:"it";s:6:"Gruppi";s:2:"lt";s:7:"Grupės";s:2:"nl";s:7:"Groepen";s:2:"ru";s:12:"Группы";s:2:"sl";s:7:"Skupine";s:2:"tw";s:6:"群組";s:2:"cn";s:6:"群组";s:2:"hu";s:9:"Csoportok";s:2:"th";s:15:"กลุ่ม";s:2:"se";s:7:"Grupper";}', 'groups', '1.0.0', NULL, 'a:24:{s:2:"en";s:54:"Users can be placed into groups to manage permissions.";s:2:"ar";s:100:"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.";s:2:"br";s:72:"Usuários podem ser inseridos em grupos para gerenciar suas permissões.";s:2:"pt";s:74:"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.";s:2:"cs";s:77:"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.";s:2:"da";s:49:"Brugere kan inddeles i grupper for adgangskontrol";s:2:"de";s:85:"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.";s:2:"el";s:168:"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.";s:2:"es";s:75:"Los usuarios podrán ser colocados en grupos para administrar sus permisos.";s:2:"fa";s:149:"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد";s:2:"fi";s:84:"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.";s:2:"fr";s:82:"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.";s:2:"he";s:62:"נותן אפשרות לאסוף משתמשים לקבוצות";s:2:"id";s:68:"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.";s:2:"it";s:69:"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.";s:2:"lt";s:67:"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.";s:2:"nl";s:73:"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.";s:2:"ru";s:134:"Пользователей можно объединять в группы, для управления правами доступа.";s:2:"sl";s:64:"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj";s:2:"tw";s:45:"用戶可以依群組分類並管理其權限";s:2:"cn";s:45:"用户可以依群组分类并管理其权限";s:2:"hu";s:73:"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.";s:2:"th";s:84:"สามารถวางผู้ใช้ลงในกลุ่มเพื่";s:2:"se";s:76:"Användare kan delas in i grupper för att hantera roller och behörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1378105477),
(9, 'a:17:{s:2:"en";s:8:"Keywords";s:2:"ar";s:21:"كلمات البحث";s:2:"br";s:14:"Palavras-chave";s:2:"pt";s:14:"Palavras-chave";s:2:"da";s:9:"Nøgleord";s:2:"el";s:27:"Λέξεις Κλειδιά";s:2:"fa";s:21:"کلمات کلیدی";s:2:"fr";s:10:"Mots-Clés";s:2:"id";s:10:"Kata Kunci";s:2:"nl";s:14:"Sleutelwoorden";s:2:"tw";s:6:"鍵詞";s:2:"cn";s:6:"键词";s:2:"hu";s:11:"Kulcsszavak";s:2:"fi";s:10:"Avainsanat";s:2:"sl";s:15:"Ključne besede";s:2:"th";s:15:"คำค้น";s:2:"se";s:9:"Nyckelord";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:"en";s:71:"Maintain a central list of keywords to label and organize your content.";s:2:"ar";s:124:"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.";s:2:"br";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"pt";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"da";s:72:"Vedligehold en central liste af nøgleord for at organisere dit indhold.";s:2:"el";s:181:"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.";s:2:"fa";s:110:"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا";s:2:"fr";s:87:"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.";s:2:"id";s:71:"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.";s:2:"nl";s:91:"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.";s:2:"tw";s:64:"集中管理可用於標題與內容的鍵詞(keywords)列表。";s:2:"cn";s:64:"集中管理可用于标题与内容的键词(keywords)列表。";s:2:"hu";s:65:"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.";s:2:"fi";s:92:"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.";s:2:"sl";s:82:"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.";s:2:"th";s:189:"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ";s:2:"se";s:61:"Hantera nyckelord för att organisera webbplatsens innehåll.";}', 0, 0, 1, 'data', 1, 1, 1, 1378105477),
(10, 'a:15:{s:2:"en";s:11:"Maintenance";s:2:"pt";s:12:"Manutenção";s:2:"ar";s:14:"الصيانة";s:2:"el";s:18:"Συντήρηση";s:2:"hu";s:13:"Karbantartás";s:2:"fa";s:15:"نگه داری";s:2:"fi";s:9:"Ylläpito";s:2:"fr";s:11:"Maintenance";s:2:"id";s:12:"Pemeliharaan";s:2:"it";s:12:"Manutenzione";s:2:"se";s:10:"Underhåll";s:2:"sl";s:12:"Vzdrževanje";s:2:"th";s:39:"การบำรุงรักษา";s:2:"tw";s:6:"維護";s:2:"cn";s:6:"维护";}', 'maintenance', '1.0.0', NULL, 'a:15:{s:2:"en";s:63:"Manage the site cache and export information from the database.";s:2:"pt";s:68:"Gerir o cache do seu site e exportar informações da base de dados.";s:2:"ar";s:81:"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.";s:2:"el";s:142:"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.";s:2:"id";s:60:"Mengatur cache situs dan mengexport informasi dari database.";s:2:"it";s:65:"Gestisci la cache del sito e esporta le informazioni dal database";s:2:"fa";s:73:"مدیریت کش سایت و صدور اطلاعات از دیتابیس";s:2:"fr";s:71:"Gérer le cache du site et exporter les contenus de la base de données";s:2:"fi";s:59:"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.";s:2:"hu";s:66:"Az oldal gyorsítótár kezelése és az adatbázis exportálása.";s:2:"se";s:76:"Underhåll webbplatsens cache och exportera data från webbplatsens databas.";s:2:"sl";s:69:"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.";s:2:"th";s:150:"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล";s:2:"tw";s:45:"經由管理介面手動刪除暫存資料。";s:2:"cn";s:45:"经由管理介面手动删除暂存资料。";}', 0, 0, 1, 'data', 1, 1, 1, 1378105477),
(11, 'a:25:{s:2:"en";s:10:"Navigation";s:2:"ar";s:14:"الروابط";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"cs";s:8:"Navigace";s:2:"da";s:10:"Navigation";s:2:"de";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"es";s:11:"Navegación";s:2:"fa";s:11:"منو ها";s:2:"fi";s:10:"Navigointi";s:2:"fr";s:10:"Navigation";s:2:"he";s:10:"ניווט";s:2:"id";s:8:"Navigasi";s:2:"it";s:11:"Navigazione";s:2:"lt";s:10:"Navigacija";s:2:"nl";s:9:"Navigatie";s:2:"pl";s:9:"Nawigacja";s:2:"ru";s:18:"Навигация";s:2:"sl";s:10:"Navigacija";s:2:"tw";s:12:"導航選單";s:2:"cn";s:12:"导航选单";s:2:"th";s:36:"ตัวช่วยนำทาง";s:2:"hu";s:11:"Navigáció";s:2:"se";s:10:"Navigation";}', 'navigation', '1.1.0', NULL, 'a:25:{s:2:"en";s:78:"Manage links on navigation menus and all the navigation groups they belong to.";s:2:"ar";s:85:"إدارة روابط وقوائم ومجموعات الروابط في الموقع.";s:2:"br";s:91:"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.";s:2:"pt";s:93:"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.";s:2:"cs";s:73:"Správa odkazů v navigaci a všech souvisejících navigačních skupin.";s:2:"da";s:82:"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.";s:2:"de";s:76:"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen";s:2:"el";s:207:"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.";s:2:"es";s:102:"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.";s:2:"fa";s:68:"مدیریت منو ها و گروه های مربوط به آنها";s:2:"fi";s:91:"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.";s:2:"fr";s:97:"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.";s:2:"he";s:73:"ניהול שלוחות תפריטי ניווט וקבוצות ניווט";s:2:"id";s:73:"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.";s:2:"it";s:97:"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.";s:2:"lt";s:95:"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.";s:2:"nl";s:92:"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.";s:2:"pl";s:95:"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.";s:2:"ru";s:136:"Управление ссылками в меню навигации и группах, к которым они принадлежат.";s:2:"sl";s:64:"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.";s:2:"tw";s:72:"管理導航選單中的連結，以及它們所隸屬的導航群組。";s:2:"cn";s:72:"管理导航选单中的连结，以及它们所隶属的导航群组。";s:2:"th";s:108:"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง";s:2:"se";s:33:"Hantera länkar och länkgrupper.";s:2:"hu";s:100:"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.";}', 0, 0, 1, 'structure', 1, 1, 1, 1378105477),
(12, 'a:25:{s:2:"en";s:5:"Pages";s:2:"ar";s:14:"الصفحات";s:2:"br";s:8:"Páginas";s:2:"pt";s:8:"Páginas";s:2:"cs";s:8:"Stránky";s:2:"da";s:5:"Sider";s:2:"de";s:6:"Seiten";s:2:"el";s:14:"Σελίδες";s:2:"es";s:8:"Páginas";s:2:"fa";s:14:"صفحه ها ";s:2:"fi";s:5:"Sivut";s:2:"fr";s:5:"Pages";s:2:"he";s:8:"דפים";s:2:"id";s:7:"Halaman";s:2:"it";s:6:"Pagine";s:2:"lt";s:9:"Puslapiai";s:2:"nl";s:13:"Pagina&apos;s";s:2:"pl";s:6:"Strony";s:2:"ru";s:16:"Страницы";s:2:"sl";s:6:"Strani";s:2:"tw";s:6:"頁面";s:2:"cn";s:6:"页面";s:2:"hu";s:7:"Oldalak";s:2:"th";s:21:"หน้าเพจ";s:2:"se";s:5:"Sidor";}', 'pages', '2.2.0', NULL, 'a:25:{s:2:"en";s:55:"Add custom pages to the site with any content you want.";s:2:"ar";s:99:"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.";s:2:"br";s:82:"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.";s:2:"pt";s:86:"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.";s:2:"cs";s:74:"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.";s:2:"da";s:71:"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.";s:2:"de";s:49:"Füge eigene Seiten mit anpassbaren Inhalt hinzu.";s:2:"el";s:152:"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.";s:2:"es";s:77:"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.";s:2:"fa";s:96:"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید";s:2:"fi";s:47:"Lisää mitä tahansa sisältöä sivustollesi.";s:2:"fr";s:89:"Permet d''ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.";s:2:"he";s:35:"ניהול דפי תוכן האתר";s:2:"id";s:75:"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.";s:2:"it";s:73:"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.";s:2:"lt";s:46:"Pridėkite nuosavus puslapius betkokio turinio";s:2:"nl";s:70:"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.";s:2:"pl";s:53:"Dodaj własne strony z dowolną treścią do witryny.";s:2:"ru";s:134:"Управление информационными страницами сайта, с произвольным содержимым.";s:2:"sl";s:44:"Dodaj stran s kakršno koli vsebino želite.";s:2:"tw";s:39:"為您的網站新增自定的頁面。";s:2:"cn";s:39:"为您的网站新增自定的页面。";s:2:"th";s:168:"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ";s:2:"hu";s:67:"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.";s:2:"se";s:39:"Lägg till egna sidor till webbplatsen.";}', 1, 1, 1, 'content', 1, 1, 1, 1378105477),
(13, 'a:25:{s:2:"en";s:11:"Permissions";s:2:"ar";s:18:"الصلاحيات";s:2:"br";s:11:"Permissões";s:2:"pt";s:11:"Permissões";s:2:"cs";s:12:"Oprávnění";s:2:"da";s:14:"Adgangskontrol";s:2:"de";s:14:"Zugriffsrechte";s:2:"el";s:20:"Δικαιώματα";s:2:"es";s:8:"Permisos";s:2:"fa";s:15:"اجازه ها";s:2:"fi";s:16:"Käyttöoikeudet";s:2:"fr";s:11:"Permissions";s:2:"he";s:12:"הרשאות";s:2:"id";s:9:"Perizinan";s:2:"it";s:8:"Permessi";s:2:"lt";s:7:"Teisės";s:2:"nl";s:15:"Toegangsrechten";s:2:"pl";s:11:"Uprawnienia";s:2:"ru";s:25:"Права доступа";s:2:"sl";s:10:"Dovoljenja";s:2:"tw";s:6:"權限";s:2:"cn";s:6:"权限";s:2:"hu";s:14:"Jogosultságok";s:2:"th";s:18:"สิทธิ์";s:2:"se";s:13:"Behörigheter";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:"en";s:68:"Control what type of users can see certain sections within the site.";s:2:"ar";s:127:"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.";s:2:"br";s:68:"Controle quais tipos de usuários podem ver certas seções no site.";s:2:"pt";s:75:"Controle quais os tipos de utilizadores podem ver certas secções no site.";s:2:"cs";s:93:"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.";s:2:"da";s:72:"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.";s:2:"de";s:70:"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.";s:2:"el";s:180:"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.";s:2:"es";s:81:"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.";s:2:"fa";s:59:"مدیریت اجازه های گروه های کاربری";s:2:"fi";s:72:"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.";s:2:"fr";s:104:"Permet de définir les autorisations des groupes d''utilisateurs pour afficher les différentes sections.";s:2:"he";s:75:"ניהול הרשאות כניסה לאיזורים מסוימים באתר";s:2:"id";s:76:"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.";s:2:"it";s:78:"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.";s:2:"lt";s:72:"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.";s:2:"nl";s:71:"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.";s:2:"pl";s:79:"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.";s:2:"ru";s:209:"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.";s:2:"sl";s:85:"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.";s:2:"tw";s:81:"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。";s:2:"cn";s:81:"用来控制不同类别的用户，设定其浏览特定网站内容的权限。";s:2:"hu";s:129:"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.";s:2:"th";s:117:"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง";s:2:"se";s:27:"Hantera gruppbehörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1378105477),
(14, 'a:24:{s:2:"en";s:9:"Redirects";s:2:"ar";s:18:"التوجيهات";s:2:"br";s:17:"Redirecionamentos";s:2:"pt";s:17:"Redirecionamentos";s:2:"cs";s:16:"Přesměrování";s:2:"da";s:13:"Omadressering";s:2:"el";s:30:"Ανακατευθύνσεις";s:2:"es";s:13:"Redirecciones";s:2:"fa";s:17:"انتقال ها";s:2:"fi";s:18:"Uudelleenohjaukset";s:2:"fr";s:12:"Redirections";s:2:"he";s:12:"הפניות";s:2:"id";s:8:"Redirect";s:2:"it";s:11:"Reindirizzi";s:2:"lt";s:14:"Peradresavimai";s:2:"nl";s:12:"Verwijzingen";s:2:"ru";s:30:"Перенаправления";s:2:"sl";s:12:"Preusmeritve";s:2:"tw";s:6:"轉址";s:2:"cn";s:6:"转址";s:2:"hu";s:17:"Átirányítások";s:2:"pl";s:14:"Przekierowania";s:2:"th";s:42:"เปลี่ยนเส้นทาง";s:2:"se";s:14:"Omdirigeringar";}', 'redirects', '1.0.0', NULL, 'a:24:{s:2:"en";s:33:"Redirect from one URL to another.";s:2:"ar";s:47:"التوجيه من رابط URL إلى آخر.";s:2:"br";s:39:"Redirecionamento de uma URL para outra.";s:2:"pt";s:40:"Redirecionamentos de uma URL para outra.";s:2:"cs";s:43:"Přesměrujte z jedné adresy URL na jinou.";s:2:"da";s:35:"Omadresser fra en URL til en anden.";s:2:"el";s:81:"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη";s:2:"es";s:34:"Redireccionar desde una URL a otra";s:2:"fa";s:63:"انتقال دادن یک صفحه به یک آدرس دیگر";s:2:"fi";s:45:"Uudelleenohjaa käyttäjän paikasta toiseen.";s:2:"fr";s:34:"Redirection d''une URL à un autre.";s:2:"he";s:43:"הפניות מכתובת אחת לאחרת";s:2:"id";s:40:"Redirect dari satu URL ke URL yang lain.";s:2:"it";s:35:"Reindirizza da una URL ad un altra.";s:2:"lt";s:56:"Peradresuokite puslapį iš vieno adreso (URL) į kitą.";s:2:"nl";s:38:"Verwijs vanaf een URL naar een andere.";s:2:"ru";s:78:"Перенаправления с одного адреса на другой.";s:2:"sl";s:44:"Preusmeritev iz enega URL naslova na drugega";s:2:"tw";s:33:"將網址轉址、重新定向。";s:2:"cn";s:33:"将网址转址、重新定向。";s:2:"hu";s:38:"Egy URL átirányítása egy másikra.";s:2:"pl";s:44:"Przekierowanie z jednego adresu URL na inny.";s:2:"th";s:123:"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง";s:2:"se";s:38:"Omdirigera från en URL till en annan.";}', 0, 0, 1, 'structure', 1, 1, 1, 1378105477),
(15, 'a:9:{s:2:"en";s:6:"Search";s:2:"fr";s:9:"Recherche";s:2:"se";s:4:"Sök";s:2:"ar";s:10:"البحث";s:2:"tw";s:6:"搜尋";s:2:"cn";s:6:"搜寻";s:2:"it";s:7:"Ricerca";s:2:"fa";s:10:"جستجو";s:2:"fi";s:4:"Etsi";}', 'search', '1.0.0', NULL, 'a:9:{s:2:"en";s:72:"Search through various types of content with this modular search system.";s:2:"fr";s:84:"Rechercher parmi différents types de contenus avec système de recherche modulaire.";s:2:"se";s:36:"Sök igenom olika typer av innehåll";s:2:"ar";s:102:"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.";s:2:"tw";s:63:"此模組可用以搜尋網站中不同類型的資料內容。";s:2:"cn";s:63:"此模组可用以搜寻网站中不同类型的资料内容。";s:2:"it";s:71:"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare";s:2:"fa";s:115:"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.";s:2:"fi";s:76:"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.";}', 0, 0, 0, '0', 1, 1, 1, 1378105477),
(16, 'a:20:{s:2:"en";s:7:"Sitemap";s:2:"ar";s:23:"خريطة الموقع";s:2:"br";s:12:"Mapa do Site";s:2:"pt";s:12:"Mapa do Site";s:2:"de";s:7:"Sitemap";s:2:"el";s:31:"Χάρτης Ιστότοπου";s:2:"es";s:14:"Mapa del Sitio";s:2:"fa";s:17:"نقشه سایت";s:2:"fi";s:10:"Sivukartta";s:2:"fr";s:12:"Plan du site";s:2:"id";s:10:"Peta Situs";s:2:"it";s:14:"Mappa del sito";s:2:"lt";s:16:"Svetainės medis";s:2:"nl";s:7:"Sitemap";s:2:"ru";s:21:"Карта сайта";s:2:"tw";s:12:"網站地圖";s:2:"cn";s:12:"网站地图";s:2:"th";s:21:"ไซต์แมพ";s:2:"hu";s:13:"Oldaltérkép";s:2:"se";s:9:"Sajtkarta";}', 'sitemap', '1.3.0', NULL, 'a:21:{s:2:"en";s:87:"The sitemap module creates an index of all pages and an XML sitemap for search engines.";s:2:"ar";s:120:"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.";s:2:"br";s:102:"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"pt";s:102:"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"da";s:86:"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.";s:2:"de";s:92:"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.";s:2:"el";s:190:"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.";s:2:"es";s:111:"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.";s:2:"fa";s:150:"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد";s:2:"fi";s:82:"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.";s:2:"fr";s:106:"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.";s:2:"id";s:110:"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.";s:2:"it";s:104:"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.";s:2:"lt";s:86:"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.";s:2:"nl";s:89:"De sitemap module maakt een index van alle pagina''s en een XML sitemap voor zoekmachines.";s:2:"ru";s:144:"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.";s:2:"tw";s:84:"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。";s:2:"cn";s:84:"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。";s:2:"th";s:202:"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.";s:2:"hu";s:94:"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.";s:2:"se";s:86:"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.";}', 0, 1, 0, 'content', 1, 1, 1, 1378105477),
(17, 'a:21:{s:2:"en";s:15:"Email Templates";s:2:"ar";s:48:"قوالب الرسائل الإلكترونية";s:2:"br";s:17:"Modelos de e-mail";s:2:"pt";s:17:"Modelos de e-mail";s:2:"da";s:16:"Email skabeloner";s:2:"el";s:22:"Δυναμικά email";s:2:"es";s:19:"Plantillas de email";s:2:"fa";s:26:"قالب های ایمیل";s:2:"fr";s:17:"Modèles d''emails";s:2:"he";s:12:"תבניות";s:2:"id";s:14:"Template Email";s:2:"lt";s:22:"El. laiškų šablonai";s:2:"nl";s:15:"Email sjablonen";s:2:"ru";s:25:"Шаблоны почты";s:2:"sl";s:14:"Email predloge";s:2:"tw";s:12:"郵件範本";s:2:"cn";s:12:"邮件范本";s:2:"hu";s:15:"E-mail sablonok";s:2:"fi";s:25:"Sähköposti viestipohjat";s:2:"th";s:33:"แม่แบบอีเมล";s:2:"se";s:12:"E-postmallar";}', 'templates', '1.1.0', NULL, 'a:21:{s:2:"en";s:46:"Create, edit, and save dynamic email templates";s:2:"ar";s:97:"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.";s:2:"br";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"pt";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"da";s:49:"Opret, redigér og gem dynamiske emailskabeloner.";s:2:"el";s:108:"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.";s:2:"es";s:54:"Crear, editar y guardar plantillas de email dinámicas";s:2:"fa";s:92:"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا";s:2:"fr";s:61:"Créer, éditer et sauver dynamiquement des modèles d''emails";s:2:"he";s:54:"ניהול של תבניות דואר אלקטרוני";s:2:"id";s:55:"Membuat, mengedit, dan menyimpan template email dinamis";s:2:"lt";s:58:"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.";s:2:"nl";s:49:"Maak, bewerk, en beheer dynamische emailsjablonen";s:2:"ru";s:127:"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны";s:2:"sl";s:52:"Ustvari, uredi in shrani spremenljive email predloge";s:2:"tw";s:61:"新增、編輯與儲存可顯示動態資料的 email 範本";s:2:"cn";s:61:"新增、编辑与储存可显示动态资料的 email 范本";s:2:"hu";s:63:"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat";s:2:"fi";s:66:"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.";s:2:"th";s:129:"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก";s:2:"se";s:49:"Skapa, redigera och spara dynamiska E-postmallar.";}', 1, 0, 1, 'structure', 1, 1, 1, 1378105477);
INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(18, 'a:25:{s:2:"en";s:5:"Users";s:2:"ar";s:20:"المستخدمون";s:2:"br";s:9:"Usuários";s:2:"pt";s:12:"Utilizadores";s:2:"cs";s:11:"Uživatelé";s:2:"da";s:7:"Brugere";s:2:"de";s:8:"Benutzer";s:2:"el";s:14:"Χρήστες";s:2:"es";s:8:"Usuarios";s:2:"fa";s:14:"کاربران";s:2:"fi";s:12:"Käyttäjät";s:2:"fr";s:12:"Utilisateurs";s:2:"he";s:14:"משתמשים";s:2:"id";s:8:"Pengguna";s:2:"it";s:6:"Utenti";s:2:"lt";s:10:"Vartotojai";s:2:"nl";s:10:"Gebruikers";s:2:"pl";s:12:"Użytkownicy";s:2:"ru";s:24:"Пользователи";s:2:"sl";s:10:"Uporabniki";s:2:"tw";s:6:"用戶";s:2:"cn";s:6:"用户";s:2:"hu";s:14:"Felhasználók";s:2:"th";s:27:"ผู้ใช้งาน";s:2:"se";s:10:"Användare";}', 'users', '1.1.0', NULL, 'a:25:{s:2:"en";s:81:"Let users register and log in to the site, and manage them via the control panel.";s:2:"ar";s:133:"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.";s:2:"br";s:125:"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.";s:2:"pt";s:125:"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.";s:2:"cs";s:103:"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.";s:2:"da";s:89:"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.";s:2:"de";s:108:"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.";s:2:"el";s:208:"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.";s:2:"es";s:138:"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.";s:2:"fa";s:151:"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید";s:2:"fi";s:126:"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.";s:2:"fr";s:112:"Permet aux utilisateurs de s''enregistrer et de se connecter au site et de les gérer via le panneau de contrôle";s:2:"he";s:62:"ניהול משתמשים: רישום, הפעלה ומחיקה";s:2:"id";s:102:"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.";s:2:"it";s:95:"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.";s:2:"lt";s:106:"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.";s:2:"nl";s:88:"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.";s:2:"pl";s:87:"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.";s:2:"ru";s:155:"Управление зарегистрированными пользователями, активирование новых пользователей.";s:2:"sl";s:96:"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče";s:2:"tw";s:87:"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。";s:2:"cn";s:87:"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。";s:2:"th";s:210:"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม";s:2:"hu";s:120:"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.";s:2:"se";s:111:"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.";}', 0, 0, 1, '0', 1, 1, 1, 1378105477),
(19, 'a:25:{s:2:"en";s:9:"Variables";s:2:"ar";s:20:"المتغيّرات";s:2:"br";s:10:"Variáveis";s:2:"pt";s:10:"Variáveis";s:2:"cs";s:10:"Proměnné";s:2:"da";s:8:"Variable";s:2:"de";s:9:"Variablen";s:2:"el";s:20:"Μεταβλητές";s:2:"es";s:9:"Variables";s:2:"fa";s:16:"متغییرها";s:2:"fi";s:9:"Muuttujat";s:2:"fr";s:9:"Variables";s:2:"he";s:12:"משתנים";s:2:"id";s:8:"Variabel";s:2:"it";s:9:"Variabili";s:2:"lt";s:10:"Kintamieji";s:2:"nl";s:10:"Variabelen";s:2:"pl";s:7:"Zmienne";s:2:"ru";s:20:"Переменные";s:2:"sl";s:13:"Spremenljivke";s:2:"tw";s:12:"系統變數";s:2:"cn";s:12:"系统变数";s:2:"th";s:18:"ตัวแปร";s:2:"se";s:9:"Variabler";s:2:"hu";s:10:"Változók";}', 'variables', '1.0.0', NULL, 'a:25:{s:2:"en";s:59:"Manage global variables that can be accessed from anywhere.";s:2:"ar";s:97:"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.";s:2:"br";s:61:"Gerencia as variáveis globais acessíveis de qualquer lugar.";s:2:"pt";s:58:"Gerir as variáveis globais acessíveis de qualquer lugar.";s:2:"cs";s:56:"Spravujte globální proměnné přístupné odkudkoliv.";s:2:"da";s:51:"Håndtér globale variable som kan tilgås overalt.";s:2:"de";s:74:"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.";s:2:"el";s:129:"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.";s:2:"es";s:50:"Manage global variables to access from everywhere.";s:2:"fa";s:136:"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند";s:2:"fi";s:66:"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.";s:2:"fr";s:92:"Gérer des variables globales pour pouvoir y accéder depuis n''importe quel endroit du site.";s:2:"he";s:96:"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר";s:2:"id";s:59:"Mengatur variabel global yang dapat diakses dari mana saja.";s:2:"it";s:58:"Gestisci le variabili globali per accedervi da ogni parte.";s:2:"lt";s:64:"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.";s:2:"nl";s:54:"Beheer globale variabelen die overal beschikbaar zijn.";s:2:"pl";s:86:"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.";s:2:"ru";s:136:"Управление глобальными переменными, которые доступны в любом месте сайта.";s:2:"sl";s:53:"Urejanje globalnih spremenljivk za dostop od kjerkoli";s:2:"th";s:148:"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.";s:2:"tw";s:45:"管理此網站內可存取的全局變數。";s:2:"cn";s:45:"管理此网站内可存取的全局变数。";s:2:"hu";s:62:"Globális változók kezelése a hozzáféréshez, bárhonnan.";s:2:"se";s:66:"Hantera globala variabler som kan avändas över hela webbplatsen.";}', 0, 0, 1, 'data', 1, 1, 1, 1378105477),
(20, 'a:23:{s:2:"en";s:7:"Widgets";s:2:"br";s:7:"Widgets";s:2:"pt";s:7:"Widgets";s:2:"cs";s:7:"Widgety";s:2:"da";s:7:"Widgets";s:2:"de";s:7:"Widgets";s:2:"el";s:7:"Widgets";s:2:"es";s:7:"Widgets";s:2:"fa";s:13:"ویجت ها";s:2:"fi";s:9:"Vimpaimet";s:2:"fr";s:7:"Widgets";s:2:"id";s:6:"Widget";s:2:"it";s:7:"Widgets";s:2:"lt";s:11:"Papildiniai";s:2:"nl";s:7:"Widgets";s:2:"ru";s:14:"Виджеты";s:2:"sl";s:9:"Vtičniki";s:2:"tw";s:9:"小組件";s:2:"cn";s:9:"小组件";s:2:"hu";s:9:"Widget-ek";s:2:"th";s:21:"วิดเจ็ต";s:2:"se";s:8:"Widgetar";s:2:"ar";s:14:"الودجتس";}', 'widgets', '1.2.0', NULL, 'a:23:{s:2:"en";s:69:"Manage small sections of self-contained logic in blocks or "Widgets".";s:2:"ar";s:132:"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ"ودجتس".";s:2:"br";s:77:"Gerenciar pequenas seções de conteúdos em bloco conhecidos como "Widgets".";s:2:"pt";s:74:"Gerir pequenas secções de conteúdos em bloco conhecidos como "Widgets".";s:2:"cs";s:56:"Spravujte malé funkční části webu neboli "Widgety".";s:2:"da";s:74:"Håndter små sektioner af selv-opretholdt logik i blokke eller "Widgets".";s:2:"de";s:62:"Verwaltet kleine, eigentständige Bereiche, genannt "Widgets".";s:2:"el";s:149:"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή "Widgets".";s:2:"es";s:75:"Manejar pequeñas secciones de lógica autocontenida en bloques o "Widgets"";s:2:"fa";s:76:"مدیریت قسمت های کوچکی از سایت به طور مستقل";s:2:"fi";s:81:"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai "Vimpaimia".";s:2:"fr";s:41:"Gérer des mini application ou "Widgets".";s:2:"id";s:101:"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah "Widget".";s:2:"it";s:70:"Gestisci piccole sezioni di logica a se stante in blocchi o "Widgets".";s:2:"lt";s:43:"Nedidelių, savarankiškų blokų valdymas.";s:2:"nl";s:75:"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel "Widgets".";s:2:"ru";s:91:"Управление небольшими, самостоятельными блоками.";s:2:"sl";s:61:"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)";s:2:"tw";s:103:"可將小段的程式碼透過小組件來管理。即所謂 "Widgets"，或稱為小工具、部件。";s:2:"cn";s:103:"可将小段的程式码透过小组件来管理。即所谓 "Widgets"，或称为小工具、部件。";s:2:"hu";s:56:"Önálló kis logikai tömbök vagy widget-ek kezelése.";s:2:"th";s:152:"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต";s:2:"se";s:83:"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.";}', 1, 0, 1, 'content', 1, 1, 1, 1378105477),
(21, 'a:9:{s:2:"en";s:7:"WYSIWYG";s:2:"fa";s:7:"WYSIWYG";s:2:"fr";s:7:"WYSIWYG";s:2:"pt";s:7:"WYSIWYG";s:2:"se";s:15:"HTML-redigerare";s:2:"tw";s:7:"WYSIWYG";s:2:"cn";s:7:"WYSIWYG";s:2:"ar";s:27:"المحرر الرسومي";s:2:"it";s:7:"WYSIWYG";}', 'wysiwyg', '1.0.0', NULL, 'a:10:{s:2:"en";s:60:"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.";s:2:"fa";s:73:"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. ";s:2:"fr";s:63:"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor";s:2:"pt";s:61:"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.";s:2:"el";s:113:"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.";s:2:"se";s:37:"Redigeringsmodul för HTML, CKEditor.";s:2:"tw";s:83:"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。";s:2:"cn";s:83:"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。";s:2:"ar";s:76:"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.";s:2:"it";s:57:"Fornisce l''editor WYSIWYG per PtroCMS creato con CKEditor";}', 0, 0, 0, '0', 1, 1, 1, 1378105477),
(26, 'a:1:{s:2:"en";s:26:"Madfront Multisite Manager";}', 'multisite_manager', '1.0', NULL, 'a:1:{s:2:"en";s:30:"Multisite Manager for Madfront";}', 0, 1, 1, '0', 1, 1, 0, 1378105477),
(27, 'a:4:{s:2:"en";s:14:"API Management";s:2:"el";s:24:"Διαχείριση API";s:2:"fr";s:18:"Gestionnaire d''API";s:2:"hu";s:12:"API Kezelés";}', 'api', '1.0.0', NULL, 'a:4:{s:2:"en";s:66:"Set up a RESTful API with API Keys and out in JSON, XML, CSV, etc.";s:2:"el";s:129:"Ρυθμίσεις για ένα RESTful API με κλειδιά API και αποτελέσματα σε JSON, XML, CSV, κτλ.";s:2:"fr";s:79:"Paramétrage d''une API RESTgul avec clés API et export en JSON, XML, CSV, etc.";s:2:"hu";s:159:"Körültekintően állítsd be az API-t (alkalmazásprogramozási felület) az API Kulcsokkal együtt és küldd JSON-ba, XML-be, CSV-be, vagy bármi egyébbe.";}', 0, 1, 1, 'utilities', 1, 1, 0, 1378105477),
(40, 'a:1:{s:2:"en";s:11:"nyanDiscuss";}', 'nyandiscuss', '0.1', NULL, 'a:1:{s:2:"en";s:31:"Nyankod Forum Discussion module";}', 0, 1, 1, '0', 0, 0, 0, 1378105477),
(47, 'a:2:{s:2:"en";s:7:"Sliders";s:2:"fr";s:7:"Sliders";}', 'sliders', '1.1.0', NULL, 'a:2:{s:2:"en";s:59:"Add Nivo Sliders to your site and display featured content.";s:2:"fr";s:68:"Ajoutez un slider à votre site et affichez du contenu promotionnel.";}', 0, 0, 1, 'content', 0, 0, 0, 1378105481),
(30, 'a:3:{s:2:"en";s:6:"Routes";s:2:"fr";s:6:"Routes";s:2:"it";s:6:"Routes";}', 'routes', '1.2', NULL, 'a:3:{s:2:"en";s:21:"Manage custom routes.";s:2:"fr";s:34:"Gèrez vos routes personnalisées.";s:2:"it";s:43:"Gestisci i percorsi (routes) personalizzati";}', 0, 0, 1, 'utilities', 1, 1, 0, 1378105477),
(31, 'a:6:{s:2:"en";s:7:"Streams";s:2:"es";s:7:"Streams";s:2:"de";s:7:"Streams";s:2:"el";s:8:"Ροές";s:2:"lt";s:7:"Srautai";s:2:"fr";s:7:"Streams";}', 'streams', '2.3', NULL, 'a:6:{s:2:"en";s:36:"Manage, structure, and display data.";s:2:"es";s:41:"Administra, estructura, y presenta datos.";s:2:"de";s:49:"Verwalte, strukturiere und veröffentliche Daten.";s:2:"el";s:106:"Διαχείριση, δόμηση και προβολή πληροφοριών και δεδομένων.";s:2:"lt";N;s:2:"fr";s:43:"Gérer, structurer et afficher des données";}', 0, 0, 1, 'content', 1, 1, 0, 1370130402),
(46, 'a:8:{s:2:"en";s:8:"FireSale";s:2:"br";s:8:"FireSale";s:2:"fr";s:8:"FireSale";s:2:"id";s:8:"FireSale";s:2:"it";s:8:"FireSale";s:2:"lt";s:8:"FireSale";s:2:"pl";s:8:"FireSale";s:2:"es";s:8:"FireSale";}', 'firesale', '1.2.2-dev', NULL, 'a:8:{s:2:"en";s:59:"The lightweight & extensible eCommerce platform for PyroCMS";s:2:"br";s:59:"The lightweight & extensible eCommerce platform for PyroCMS";s:2:"fr";s:33:"Plateforme eCommerce pour PyroCMS";s:2:"id";s:59:"The lightweight & extensible eCommerce platform for PyroCMS";s:2:"it";s:45:"Una leggera piattaforma eCommerce per PyroCMS";s:2:"lt";s:59:"The lightweight & extensible eCommerce platform for PyroCMS";s:2:"pl";s:50:"Lekka i elastyczna platforma eCommerce dla PyroCMS";s:2:"es";s:59:"The lightweight & extensible eCommerce platform for PyroCMS";}', 0, 1, 1, '0', 0, 0, 0, 1371897858),
(44, 'a:3:{s:2:"en";s:15:"FireSale Brands";s:2:"fr";s:16:"FireSale Marques";s:2:"it";s:15:"FireSale Marche";}', 'firesale_brands', '1.0.1', NULL, 'a:3:{s:2:"en";s:16:"Brand Management";s:2:"fr";s:19:"Gestion des marques";s:2:"it";s:15:"Gestione Marche";}', 0, 0, 1, '0', 0, 0, 0, 1371897828),
(43, 'a:2:{s:2:"en";s:15:"FireSale Design";s:2:"it";s:15:"FireSale Design";}', 'firesale_design', '1.0.1', NULL, 'a:2:{s:2:"en";s:61:"Complete control over your page layouts, style and javascript";s:2:"it";s:72:"Controllo completo sul layout della pagina, sugli stili e sul javascript";}', 0, 0, 0, 'FireSale', 0, 0, 0, 1371897820),
(39, 'a:3:{s:2:"en";s:17:"FireSale Shipping";s:2:"fr";s:20:"FireSale Expédition";s:2:"it";s:19:"FireSale Spedizioni";}', 'firesale_shipping', '1.2.1', NULL, 'a:3:{s:2:"en";s:33:"Basic band-based shipping options";s:2:"fr";s:35:"Gestionnaire de modes d''expédition";s:2:"it";s:30:"Gestione base delle spedizioni";}', 0, 0, 1, '0', 0, 0, 0, 1370156188),
(45, 'a:2:{s:2:"en";s:19:"FireSale Attributes";s:2:"it";s:18:"FireSale Attributi";}', 'firesale_attributes', '1.0.1', NULL, 'a:2:{s:2:"en";s:29:"Product attribute management.";s:2:"it";s:31:"Gestione attributi dei prodotti";}', 0, 0, 0, 'FireSale', 0, 0, 0, 1371897833),
(42, 'a:2:{s:2:"en";s:23:"FireSale Dispatch Notes";s:2:"it";s:27:"FireSale note di spedizione";}', 'firesale_dispatch_notes', '1.0.0', NULL, 'a:2:{s:2:"en";s:36:"Print dispatch notes for your orders";s:2:"it";s:43:"Stampa le note di spedizione per gli ordini";}', 0, 0, 0, 'FireSale', 0, 0, 0, 1371897815),
(41, 'a:3:{s:2:"en";s:15:"FireSale Search";s:2:"fr";s:18:"FireSale Recherche";s:2:"it";s:16:"FireSale Ricerca";}', 'firesale_search', '1.2.1', NULL, 'a:3:{s:2:"en";s:50:"Product and category search with ajax capabilities";s:2:"fr";s:66:"Recherche dans les produits et la catégories, dynamisée par AJAX";s:2:"it";s:53:"Ricerca di prodotti e categorie, compatibile con AJAX";}', 0, 1, 0, '0', 0, 0, 0, 1371897807);

-- --------------------------------------------------------

--
-- Table structure for table `default_navigation_groups`
--

CREATE TABLE IF NOT EXISTS `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `default_navigation_groups`
--

INSERT INTO `default_navigation_groups` (`id`, `site_id`, `title`, `abbrev`) VALUES
(1, 1, 'Header', 'header'),
(2, 1, 'Sidebar', 'sidebar'),
(3, 1, 'Footer', 'footer'),
(5, 2, 'Header', 'header'),
(6, 2, 'Sidebar', 'sidebar');

-- --------------------------------------------------------

--
-- Table structure for table `default_navigation_links`
--

CREATE TABLE IF NOT EXISTS `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `default_navigation_links`
--

INSERT INTO `default_navigation_links` (`id`, `site_id`, `title`, `parent`, `link_type`, `page_id`, `module_name`, `url`, `uri`, `navigation_group_id`, `position`, `target`, `restricted_to`, `class`) VALUES
(2, 1, 'News', 0, 'uri', 0, '', '', 'news', 1, 1, '', '0', ''),
(3, 1, 'Contact', 0, 'page', 2, '', '', '', 1, 3, NULL, NULL, ''),
(5, 1, 'Discussion', 0, 'module', 0, 'nyandiscuss', '', '', 1, 2, '', '0', ''),
(6, 2, 'Home', NULL, 'page', 6, '', '', '', 5, 1, '', '0', ''),
(8, 2, 'Sagala', NULL, 'uri', 0, '', '', 'dgh', 5, 2, '', '0', ''),
(9, 2, 'Supaya', NULL, 'uri', 0, '', '', 'fsdg', 3, 1, '', '0', ''),
(10, 2, 'supagaw', NULL, 'uri', 0, '', '', 'dgshfj', 5, 3, '', '0', ''),
(11, 2, 'Jabaww', NULL, 'uri', 0, '', '', 'wadfa', 6, 1, '', '0', ''),
(12, 1, 'Home', 0, 'page', 10, '', '', '', 1, 0, '', '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `default_pages`
--

CREATE TABLE IF NOT EXISTS `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  `meta_robots_no_index` tinyint(1) NOT NULL DEFAULT '0',
  `meta_robots_no_follow` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `default_pages`
--

INSERT INTO `default_pages` (`id`, `site_id`, `slug`, `class`, `title`, `uri`, `parent_id`, `type_id`, `entry_id`, `css`, `js`, `meta_title`, `meta_keywords`, `meta_description`, `rss_enabled`, `comments_enabled`, `status`, `created_on`, `updated_on`, `restricted_to`, `is_home`, `strict_uri`, `order`, `meta_robots_no_index`, `meta_robots_no_follow`) VALUES
(2, 1, 'contact', '', 'Contact', 'contact', 0, '1', '2', '', '', '', '', '', 0, 0, 'live', 1365315946, 1367223219, '0', 0, 1, 2, 0, 0),
(3, 1, 'search', '', 'Search', 'search', 0, '1', '3', '', '', '', '', '', 0, 0, 'live', 1365315946, 1367223219, '0', 0, 1, 3, 0, 0),
(4, 1, 'results', '', 'Results', 'search/results', 3, '1', '4', '', '', '', '', '', 0, 0, 'live', 1365315946, 1367223219, '0', 0, 1, 0, 0, 0),
(5, 1, '404', '', 'Page Missing', '404', 0, '1', '5', '', '', '', '', '', 0, 0, 'live', 1365315946, 1367224928, '0', 0, 1, 4, 0, 0),
(6, 2, 'home', '', 'Home', 'home', 0, '1', '6', '', '', '', '', '', 0, 0, 'live', 1365315946, 1367225014, '0', 1, 1, 1365315946, 0, 0),
(7, 2, 'sagala-two', '', 'Sagala Two', 'sagala-two', 0, '1', '7', '', '', '', '', '', 0, 0, 'live', 1367222547, 1367224988, '0', 0, 1, 1367222547, 0, 0),
(9, 2, '404', '', 'Page Missing', '404', 0, '1', '9', '', '', '', '', '', 0, 0, 'live', 1367317976, 0, '0', 0, 1, 1367317976, 0, 0),
(10, 1, 'beranda', '', 'Beranda Nyandiscuss', 'beranda', 0, '2', '1', '', '', '', '', '', 0, 0, 'live', 1370045845, 1371990424, '0', 0, 1, 1, 0, 0),
(11, 1, 'home', '', 'Home', 'home', 0, '2', '2', '', '', '', '', '', 0, 0, 'live', 1371990398, 1371990405, '0', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `default_pages_front_page`
--

CREATE TABLE IF NOT EXISTS `default_pages_front_page` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `front_content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `default_pages_front_page`
--

INSERT INTO `default_pages_front_page` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `front_content`) VALUES
(1, '2013-06-01 04:17:25', '2013-06-23 16:27:04', 10, 1, '<div class="span4">\r\n<h3>Artikel Terbaru</h3>\r\n{{ blog:posts limit="5" order-by="created_on" order-dir="asc"	}}\r\n<div class="post">\r\n<h4><a href="{{ url }}">{{ title }}</a></h4>\r\n<img src="{{ gambar_blog:image }}" />\r\n<p>{{ intro }}</p>\r\n<div class="date">\r\ndiposkan pada tanggal {{ helper:date format="d/m/Y" timestamp=created_on }}\r\n</div>\r\n</div>\r\n{{ /blog:posts }}\r\n</div>\r\n\r\n<div class="span4">\r\n<h3>Thread Terbaru</h3>\r\n{{ streams:cycle stream="threads" limit="5" where="`default_nyan_threads`.`grup` Is Null" }}\r\n{{ entries }}\r\n<div class="thread">\r\n<h5><a href="{{ url:site }}">{{ judul }}</a></h5>\r\n<div class="date">\r\ndiposkan pada tanggal {{ helper:date format="d F Y" timestamp=created }} \r\noleh {{ created_by:first_name }}{{ created_by:username }}\r\n{{ if topik:judul }}\r\n<br>topik {{ topik:judul }}\r\n{{ endif }}\r\n</div>\r\n</div>\r\n{{ /entries }}\r\n{{ /streams:cycle }}\r\n</div>'),
(2, '2013-06-23 16:26:38', '2013-06-23 16:26:45', 10, 2, 'Welcome!');

-- --------------------------------------------------------

--
-- Table structure for table `default_page_types`
--

CREATE TABLE IF NOT EXISTS `default_page_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `default_page_types`
--

INSERT INTO `default_page_types` (`id`, `slug`, `title`, `description`, `stream_id`, `meta_title`, `meta_keywords`, `meta_description`, `body`, `css`, `js`, `theme_layout`, `updated_on`, `save_as_files`, `content_label`, `title_label`) VALUES
(1, 'default', 'Default', 'A simple page type with a WYSIWYG editor that will get you started adding content.', 2, '', NULL, '', '<div class="span12">\r\n	<h1>{{ page:title }}</h1>\r\n<br>\r\n	{{ body }}\r\n</div>', '', '', 'default.html', 1370045130, 'n', '', ''),
(2, 'front_page', 'Front Page', 'Front page only', 10, '', NULL, '', '<div class="span9" id="main-content">\r\n     {{ widgets:area slug="tengah" }}\r\n     {{ front_content }}\r\n</div>\r\n<div class="span3" id="sidebar-content">\r\n     {{ widgets:area slug="sidebar" }}\r\n</div>', '', '', 'default.html', 1370045207, 'n', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `default_permissions`
--

CREATE TABLE IF NOT EXISTS `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=363 ;

--
-- Dumping data for table `default_permissions`
--

INSERT INTO `default_permissions` (`id`, `group_id`, `module`, `roles`) VALUES
(48, 1, 'users', '{"admin_profile_fields":"1","add_user":"1"}'),
(350, 3, 'blog', '{"put_live":"1","put_all_live":"1","edit_live":"1","delete_live":"1"}'),
(351, 3, 'files', '{"wysiwyg":"1","upload":"1","download_file":"1","edit_file":"1","delete_file":"1","create_folder":"1","set_location":"1","synchronize":"1","edit_folder":"1","delete_folder":"1"}'),
(352, 3, 'pages', '{"put_live":"1","edit_live":"1","delete_live":"1"}'),
(353, 3, 'comments', NULL),
(354, 3, 'navigation', NULL),
(355, 3, 'settings', NULL),
(356, 3, 'addons', '{"themes":"1","plugins":"1"}'),
(357, 3, 'users', '{"add_user":"1"}'),
(358, 3, 'redirects', NULL),
(359, 3, 'routes', NULL),
(360, 3, 'templates', NULL),
(361, 3, 'variables', NULL),
(362, 3, 'widgets', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_profiles`
--

CREATE TABLE IF NOT EXISTS `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  `avatar` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `company`, `lang`, `bio`, `dob`, `gender`, `phone`, `mobile`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `website`, `updated_on`, `avatar`) VALUES
(11, '2013-05-01 05:43:20', NULL, 10, 4, 11, 'AingAdmin', 'Aing', 'Admin', NULL, 'en', '', -3600, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1370084894, NULL),
(2, '2013-04-18 14:13:35', NULL, 1, 1, 2, 'Toha', 'Toha', 'Taymullah', NULL, 'en', '', -3600, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1367369051, NULL),
(10, '2013-05-01 04:42:37', NULL, 2, 3, 10, 'Yllumi', 'Toni', 'Haryanto', NULL, 'en', '', 600303600, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1370128732, 'f48a1e03bbffee0'),
(8, '2013-05-01 03:40:56', NULL, 2, 2, 8, 'kresna', 'kresna', 'galuh', NULL, 'en', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `default_redirects`
--

CREATE TABLE IF NOT EXISTS `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `default_redirects`
--

INSERT INTO `default_redirects` (`id`, `site_id`, `from`, `to`, `type`) VALUES
(1, 1, 'kontak', 'contact', 302),
(3, 2, 'kontak', 'sgh', 302);

-- --------------------------------------------------------

--
-- Table structure for table `default_routes`
--

CREATE TABLE IF NOT EXISTS `default_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `route_key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `route_value` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `when_added` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `default_routes`
--

INSERT INTO `default_routes` (`id`, `site_id`, `name`, `route_key`, `route_value`, `when_added`, `last_updated`, `added_by`) VALUES
(1, 1, 'Blog to News', 'news(:any)', 'blog$1', '2013-06-01 06:41:17', '2013-06-09 08:46:12', 10),
(2, 1, 'Blog to News', 'news', 'blog', '2013-06-02 03:59:06', '2013-06-09 08:46:20', 10),
(3, 2, 'Blog to Article', 'articles(:any)', 'blog$1', '2013-06-22 15:07:30', NULL, 2),
(4, 2, 'Blog to Article', 'articles', 'blog', '2013-06-22 15:07:57', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `default_search_index`
--

CREATE TABLE IF NOT EXISTS `default_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190)),
  FULLTEXT KEY `full search` (`title`,`description`,`keywords`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `default_search_index`
--

INSERT INTO `default_search_index` (`id`, `title`, `description`, `keywords`, `keyword_hash`, `module`, `entry_key`, `entry_plural`, `entry_id`, `uri`, `cp_edit_uri`, `cp_delete_uri`) VALUES
(2, 'Contact', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '2', 'contact', 'admin/pages/edit/2', 'admin/pages/delete/2'),
(3, 'Search', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '3', 'search', 'admin/pages/edit/3', 'admin/pages/delete/3'),
(4, 'Results', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '4', 'search/results', 'admin/pages/edit/4', 'admin/pages/delete/4'),
(13, 'Page Missing', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '5', '404', 'admin/pages/edit/5', 'admin/pages/delete/5'),
(27, 'First Post Siteone', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae fugit sit reprehenderit reiciendis nihil. Dolorem eius consequatur ullam dolor qui minima itaque facere porro a quia deleniti ratione dolore unde?\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt odit voluptates rerum id tempora nulla atque quam at voluptatum dignissimos officia ullam cum libero odio eius consequatur iure? Commodi quasi.', 'tagone', '1a015b4efdc115351ad0d10e184b1482', 'blog', 'blog:post', 'blog:posts', '1', 'blog/2013/04/first-post-siteone', 'admin/blog/edit/1', 'admin/blog/delete/1'),
(7, 'First Post Sitetwo', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'tagtwo', 'b663b3c85f1ac6df9d633df46a002c0d', 'blog', 'blog:post', 'blog:posts', '2', 'blog/2013/04/first-post-sitetwo', 'admin/blog/edit/2', 'admin/blog/delete/2'),
(40, 'Beranda Nyandiscuss', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '10', 'beranda', 'admin/pages/edit/10', 'admin/pages/delete/10'),
(15, 'Home', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '6', 'home', 'admin/pages/edit/6', 'admin/pages/delete/6'),
(18, 'Page Missing', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '9', '404', 'admin/pages/edit/9', 'admin/pages/delete/9'),
(25, 'Jojojo', 'dsfgs dfsg fsg afsfd', NULL, NULL, 'blog', 'blog:post', 'blog:posts', '3', 'blog/2013/06/jojojo', 'admin/blog/edit/3', 'admin/blog/delete/3'),
(37, 'Oreo White Cream', 'This is new product of Oreo.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas assumenda consequuntur mollitia deserunt vel voluptates aspernatur aliquid qui quasi rem nam obcaecati expedita laboriosam. Vel a quaerat quo sed ducimus.', NULL, NULL, 'firesale', 'firesale:product', 'firesale:products', '1', 'product/oreo-white-cream', 'admin/firesale/products/edit/1', 'admin/firesale/products/delete/1'),
(39, 'Home', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '11', 'home', 'admin/pages/edit/11', 'admin/pages/delete/11');

-- --------------------------------------------------------

--
-- Table structure for table `default_settings`
--

CREATE TABLE IF NOT EXISTS `default_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=111 ;

--
-- Dumping data for table `default_settings`
--

INSERT INTO `default_settings` (`id`, `site_id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `is_gui`, `module`, `order`) VALUES
(1, 1, 'activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '', '0=activate_by_admin|1=activate_by_email|2=no_activation', 0, 1, 'users', 961),
(2, 1, 'addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', 1, 0, '', 0),
(3, 1, 'admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', 1, 1, '', 0),
(4, 1, 'admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', 1, 0, '', 0),
(5, 1, 'akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', 0, 1, 'integration', 981),
(6, 1, 'api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '1', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
(7, 1, 'api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
(8, 1, 'auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 964),
(9, 1, 'blog_caption', 'Blog Caption', 'The caption for blog module. You can put it as "blog", "news", "article", or whatever.', 'text', 'blog', 'news', '', 0, 1, '', 993),
(10, 1, 'cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', 0, 1, 'integration', 999),
(11, 1, 'ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target="_blank" href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">CKEditor''s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(''textarea#intro.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''pyroimages''],\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\r\n	  ],\r\n	extraPlugins: ''pyroimages'',\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(''textarea.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\r\n	  ],\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(''textarea.wysiwyg-advanced'').ckeditor({\r\n	toolbar: [\r\n		[''Maximize''],\r\n		[''pyroimages'', ''pyrofiles''],\r\n		[''Cut'',''Copy'',''Paste'',''PasteFromWord''],\r\n		[''Undo'',''Redo'',''-'',''Find'',''Replace''],\r\n		[''Link'',''Unlink''],\r\n		[''Table'',''HorizontalRule'',''SpecialChar''],\r\n		[''Bold'',''Italic'',''StrikeThrough''],\r\n		[''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl''],\r\n		[''Format'', ''FontSize'', ''Subscript'',''Superscript'', ''NumberedList'',''BulletedList'',''Outdent'',''Indent'',''Blockquote''],\r\n		[''ShowBlocks'', ''RemoveFormat'', ''Source'']\r\n	],\r\n	extraPlugins: ''pyroimages,pyrofiles'',\r\n	width: ''99%'',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	removePlugins: ''elementspath'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});', '', 1, 1, 'wysiwyg', 993),
(12, 1, 'comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', 1, 1, 'comments', 965),
(13, 1, 'comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', 1, 1, 'comments', 966),
(14, 1, 'contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'toha.samba@gmail.com', '', '', 1, 1, 'email', 979),
(15, 1, 'currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', 1, 1, '', 994),
(16, 1, 'dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', 0, 1, '', 990),
(17, 1, 'dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
(18, 1, 'date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target="_blank" href="http://php.net/manual/en/function.date.php">date format</a> from PHP - OR - Using the format of <a target="_blank" href="http://php.net/manual/en/function.strftime.php">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', 1, 1, '', 995),
(19, 1, 'default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'himsiskota', 'func:get_themes', 1, 0, '', 0),
(20, 1, 'enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 968),
(21, 1, 'enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', 1, 1, 'users', 963),
(22, 1, 'enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
(23, 1, 'files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', 1, 1, 'files', 986),
(24, 1, 'files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', 0, 1, 'files', 989),
(25, 1, 'files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href="https://manage.rackspacecloud.com/APIAccess.do">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 990),
(26, 1, 'files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', 0, 1, 'files', 994),
(27, 1, 'files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href="https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 993),
(28, 1, 'files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', 1, 1, 'files', 991),
(29, 1, 'files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', 0, 1, 'files', 992),
(30, 1, 'files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon''s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', 0, 1, 'files', 991),
(31, 1, 'files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', 1, 1, 'files', 987),
(32, 1, 'frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', 1, 1, '', 988),
(33, 1, 'ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', 0, 1, 'integration', 983),
(34, 1, 'ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href="https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US" target="_blank">Authorized Access to your Google Account</a>', 'password', '', '', '', 0, 1, 'integration', 982),
(35, 1, 'ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', 0, 1, 'integration', 984),
(36, 1, 'ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', 0, 1, 'integration', 985),
(37, 1, 'mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', 0, 1, 'email', 972),
(38, 1, 'mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'mail', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', 1, 1, 'email', 977),
(39, 1, 'mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', 0, 1, 'email', 972),
(40, 1, 'mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', '', '', 0, 1, 'email', 976),
(41, 1, 'mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', '', '', 0, 1, 'email', 975),
(42, 1, 'mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '', '', 0, 1, 'email', 974),
(43, 1, 'mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', '', '', 0, 1, 'email', 973),
(44, 1, 'meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Just another PyroCMS Website', '', 0, 1, '', 998),
(45, 1, 'moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 967),
(46, 1, 'profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', '', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', 0, 1, 'users', 960),
(47, 1, 'records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
(48, 1, 'registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 962),
(49, 1, 'rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
(50, 1, 'server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', 1, 1, 'email', 978),
(51, 1, 'site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 997),
(52, 1, 'site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'Site One', '', 1, 1, '', 1000),
(53, 1, 'site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 996),
(54, 1, 'site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'Just another PyroCMS Website', '', 0, 1, '', 999),
(55, 1, 'unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '', '', 0, 1, '', 987),
(56, 2, 'activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '', '0=activate_by_admin|1=activate_by_email|2=no_activation', 0, 1, 'users', 961),
(57, 2, 'addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', 1, 0, '', 0),
(58, 2, 'admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', 1, 1, '', 0),
(59, 2, 'admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', 1, 0, '', 0),
(60, 2, 'akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', 0, 1, 'integration', 981),
(61, 2, 'api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '1', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
(62, 2, 'api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
(63, 2, 'auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 964),
(64, 2, 'blog_caption', 'Blog Caption', 'The caption for blog module. You can put it as "blog", "news", "article", or whatever.', 'text', 'blog', 'news', '', 0, 1, '', 993),
(65, 2, 'cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', 0, 1, 'integration', 999),
(66, 2, 'ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target="_blank" href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">CKEditor''s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(''textarea#intro.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''pyroimages''],\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\r\n	  ],\r\n	extraPlugins: ''pyroimages'',\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(''textarea.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\r\n	  ],\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(''textarea.wysiwyg-advanced'').ckeditor({\r\n	toolbar: [\r\n		[''Maximize''],\r\n		[''pyroimages'', ''pyrofiles''],\r\n		[''Cut'',''Copy'',''Paste'',''PasteFromWord''],\r\n		[''Undo'',''Redo'',''-'',''Find'',''Replace''],\r\n		[''Link'',''Unlink''],\r\n		[''Table'',''HorizontalRule'',''SpecialChar''],\r\n		[''Bold'',''Italic'',''StrikeThrough''],\r\n		[''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl''],\r\n		[''Format'', ''FontSize'', ''Subscript'',''Superscript'', ''NumberedList'',''BulletedList'',''Outdent'',''Indent'',''Blockquote''],\r\n		[''ShowBlocks'', ''RemoveFormat'', ''Source'']\r\n	],\r\n	extraPlugins: ''pyroimages,pyrofiles'',\r\n	width: ''99%'',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	removePlugins: ''elementspath'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});', '', 1, 1, 'wysiwyg', 993),
(67, 2, 'comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', 1, 1, 'comments', 965),
(68, 2, 'comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', 1, 1, 'comments', 966),
(69, 2, 'contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'toha.samba@gmail.com', '', '', 1, 1, 'email', 979),
(70, 2, 'currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', 1, 1, '', 994),
(71, 2, 'dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', 0, 1, '', 990),
(72, 2, 'dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
(73, 2, 'date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target="_blank" href="http://php.net/manual/en/function.date.php">date format</a> from PHP - OR - Using the format of <a target="_blank" href="http://php.net/manual/en/function.strftime.php">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', 1, 1, '', 995),
(74, 2, 'default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'minimal', 'func:get_themes', 1, 0, '', 0),
(75, 2, 'enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 968),
(76, 2, 'enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', 1, 1, 'users', 963),
(77, 2, 'enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
(78, 2, 'files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', 1, 1, 'files', 986),
(79, 2, 'files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', 0, 1, 'files', 989),
(80, 2, 'files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href="https://manage.rackspacecloud.com/APIAccess.do">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 990),
(81, 2, 'files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', 0, 1, 'files', 994),
(82, 2, 'files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href="https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 993),
(83, 2, 'files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', 1, 1, 'files', 991),
(84, 2, 'files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', 0, 1, 'files', 992),
(85, 2, 'files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon''s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', 0, 1, 'files', 991),
(86, 2, 'files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', 1, 1, 'files', 987),
(87, 2, 'frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', 1, 1, '', 988),
(88, 2, 'ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', 0, 1, 'integration', 983),
(89, 2, 'ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href="https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US" target="_blank">Authorized Access to your Google Account</a>', 'password', '', '', '', 0, 1, 'integration', 982),
(90, 2, 'ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', 0, 1, 'integration', 984),
(91, 2, 'ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', 0, 1, 'integration', 985),
(92, 2, 'mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', 0, 1, 'email', 972),
(93, 2, 'mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'mail', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', 1, 1, 'email', 977),
(94, 2, 'mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', 0, 1, 'email', 972),
(95, 2, 'mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', '', '', 0, 1, 'email', 976),
(96, 2, 'mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', '', '', 0, 1, 'email', 975),
(97, 2, 'mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '', '', 0, 1, 'email', 974),
(98, 2, 'mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', '', '', 0, 1, 'email', 973),
(99, 2, 'meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Add your slogan here', '', 0, 1, '', 998),
(100, 2, 'moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 967),
(101, 2, 'profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', '', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', 0, 1, 'users', 960),
(102, 2, 'records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
(103, 2, 'registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 962),
(104, 2, 'rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
(105, 2, 'server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', 1, 1, 'email', 978),
(106, 2, 'site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 997),
(107, 2, 'site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'Site Two', '', 1, 1, '', 1000),
(108, 2, 'site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'en', 'func:get_supported_lang', 1, 1, '', 996),
(109, 2, 'site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'Add your slogan here', '', 0, 1, '', 999),
(110, 2, 'unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '', '', 0, 1, '', 987);

-- --------------------------------------------------------

--
-- Table structure for table `default_theme_options`
--

CREATE TABLE IF NOT EXISTS `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `default_theme_options`
--

INSERT INTO `default_theme_options` (`id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `theme`) VALUES
(1, 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(2, 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(3, 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(4, 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(5, 'show_breadcrumbs', 'Show Breadcrumbs', 'Would you like to display breadcrumbs?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'default'),
(6, 'layout', 'Layout', 'Which type of layout shall we use?', 'select', '2 column', '2 column', '2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page', 1, 'default'),
(7, 'cufon_enabled', 'Use Cufon', 'Would you like to use Cufon for titles?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'default'),
(8, 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'fabric', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', 1, 'base'),
(9, 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(10, 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', 1, 'base'),
(11, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base');

-- --------------------------------------------------------

--
-- Table structure for table `default_users`
--

CREATE TABLE IF NOT EXISTS `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `default_users`
--

INSERT INTO `default_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(2, 'toha.samba@yahoo.com', '9a3829b9b150710b1b4e33e13e65c56f5428e9ac', '7827b8', 3, '127.0.0.1', 1, NULL, 1366280015, 1371991604, 'toha', NULL, 'dd31b3200884723287eb288a30f7e10278c310ca'),
(8, 'kresnagaluh@gmail.com', '506c1cc04463db92b41909e8ea4ae1995044e5c1', '95756d', 3, '127.0.0.1', 1, NULL, 1367365256, 1367365256, 'kresna', NULL, NULL),
(10, 'toha.samba@gmail.com', '2602ba61ecc8e3847fbde6c417f4c08d8100ee37', '3b458e', 1, '127.0.0.1', 1, NULL, 1367368957, 1378105730, 'yllumi', NULL, '4b0f305acda6f0c01e5e46023391c02f0f5ee74b'),
(11, 'admin@gmail.com', '8229f608edde81cd03c28b79e454910725cb34e4', '16ccb2', 3, '127.0.0.1', 1, NULL, 1367372600, 1370121303, 'adminis', NULL, '50a0be2b2acaed26760019d45e4ceef8e799f77d');

-- --------------------------------------------------------

--
-- Table structure for table `default_users_site`
--

CREATE TABLE IF NOT EXISTS `default_users_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`site_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `default_users_site`
--

INSERT INTO `default_users_site` (`id`, `user_id`, `site_id`) VALUES
(15, 10, 1),
(14, 10, 2),
(3, 2, 2),
(10, 8, 2),
(16, 11, 1),
(17, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `default_variables`
--

CREATE TABLE IF NOT EXISTS `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `default_variables`
--

INSERT INTO `default_variables` (`id`, `site_id`, `name`, `data`) VALUES
(1, 1, 'one', 'Hiji'),
(2, 2, 'Two', 'Duo');

-- --------------------------------------------------------

--
-- Table structure for table `default_widgets`
--

CREATE TABLE IF NOT EXISTS `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `default_widgets`
--

INSERT INTO `default_widgets` (`id`, `slug`, `title`, `description`, `author`, `website`, `version`, `enabled`, `order`, `updated_on`) VALUES
(1, 'google_maps', 'a:10:{s:2:"en";s:11:"Google Maps";s:2:"el";s:19:"Χάρτης Google";s:2:"nl";s:11:"Google Maps";s:2:"br";s:11:"Google Maps";s:2:"pt";s:11:"Google Maps";s:2:"ru";s:17:"Карты Google";s:2:"id";s:11:"Google Maps";s:2:"fi";s:11:"Google Maps";s:2:"fr";s:11:"Google Maps";s:2:"fa";s:17:"نقشه گوگل";}', 'a:10:{s:2:"en";s:32:"Display Google Maps on your site";s:2:"el";s:78:"Προβάλετε έναν Χάρτη Google στον ιστότοπό σας";s:2:"nl";s:27:"Toon Google Maps in uw site";s:2:"br";s:34:"Mostra mapas do Google no seu site";s:2:"pt";s:34:"Mostra mapas do Google no seu site";s:2:"ru";s:80:"Выводит карты Google на страницах вашего сайта";s:2:"id";s:37:"Menampilkan Google Maps di Situs Anda";s:2:"fi";s:39:"Näytä Google Maps kartta sivustollasi";s:2:"fr";s:42:"Publiez un plan Google Maps sur votre site";s:2:"fa";s:59:"نمایش داده نقشه گوگل بر روی سایت ";}', 'Gregory Athons', 'http://www.gregathons.com', '1.0.0', 1, 1, 1367229993),
(2, 'html', 's:4:"HTML";', 'a:10:{s:2:"en";s:28:"Create blocks of custom HTML";s:2:"el";s:80:"Δημιουργήστε περιοχές με δικό σας κώδικα HTML";s:2:"br";s:41:"Permite criar blocos de HTML customizados";s:2:"pt";s:41:"Permite criar blocos de HTML customizados";s:2:"nl";s:30:"Maak blokken met maatwerk HTML";s:2:"ru";s:83:"Создание HTML-блоков с произвольным содержимым";s:2:"id";s:24:"Membuat blok HTML apapun";s:2:"fi";s:32:"Luo lohkoja omasta HTML koodista";s:2:"fr";s:36:"Créez des blocs HTML personnalisés";s:2:"fa";s:58:"ایجاد قسمت ها به صورت اچ تی ام ال";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 2, 1367229993),
(3, 'login', 'a:10:{s:2:"en";s:5:"Login";s:2:"el";s:14:"Σύνδεση";s:2:"nl";s:5:"Login";s:2:"br";s:5:"Login";s:2:"pt";s:5:"Login";s:2:"ru";s:22:"Вход на сайт";s:2:"id";s:5:"Login";s:2:"fi";s:13:"Kirjautuminen";s:2:"fr";s:9:"Connexion";s:2:"fa";s:10:"لاگین";}', 'a:10:{s:2:"en";s:36:"Display a simple login form anywhere";s:2:"el";s:96:"Προβάλετε μια απλή φόρμα σύνδεσης χρήστη οπουδήποτε";s:2:"br";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"pt";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"nl";s:32:"Toon overal een simpele loginbox";s:2:"ru";s:72:"Выводит простую форму для входа на сайт";s:2:"id";s:32:"Menampilkan form login sederhana";s:2:"fi";s:52:"Näytä yksinkertainen kirjautumislomake missä vain";s:2:"fr";s:54:"Affichez un formulaire de connexion où vous souhaitez";s:2:"fa";s:70:"نمایش یک لاگین ساده در هر قسمتی از سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 3, 1367229993),
(4, 'navigation', 'a:10:{s:2:"en";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"nl";s:9:"Navigatie";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"ru";s:18:"Навигация";s:2:"id";s:8:"Navigasi";s:2:"fi";s:10:"Navigaatio";s:2:"fr";s:10:"Navigation";s:2:"fa";s:10:"منوها";}', 'a:10:{s:2:"en";s:40:"Display a navigation group with a widget";s:2:"el";s:100:"Προβάλετε μια ομάδα στοιχείων πλοήγησης στον ιστότοπο";s:2:"nl";s:38:"Toon een navigatiegroep met een widget";s:2:"br";s:62:"Exibe um grupo de links de navegação como widget em seu site";s:2:"pt";s:62:"Exibe um grupo de links de navegação como widget no seu site";s:2:"ru";s:88:"Отображает навигационную группу внутри виджета";s:2:"id";s:44:"Menampilkan grup navigasi menggunakan widget";s:2:"fi";s:37:"Näytä widgetillä navigaatio ryhmä";s:2:"fr";s:47:"Affichez un groupe de navigation dans un widget";s:2:"fa";s:71:"نمایش گروهی از منوها با استفاده از ویجت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 4, 1367229993),
(5, 'rss_feed', 'a:10:{s:2:"en";s:8:"RSS Feed";s:2:"el";s:24:"Τροφοδοσία RSS";s:2:"nl";s:8:"RSS Feed";s:2:"br";s:8:"Feed RSS";s:2:"pt";s:8:"Feed RSS";s:2:"ru";s:31:"Лента новостей RSS";s:2:"id";s:8:"RSS Feed";s:2:"fi";s:10:"RSS Syöte";s:2:"fr";s:8:"Flux RSS";s:2:"fa";s:19:"خبر خوان RSS";}', 'a:10:{s:2:"en";s:41:"Display parsed RSS feeds on your websites";s:2:"el";s:82:"Προβάλετε τα περιεχόμενα μιας τροφοδοσίας RSS";s:2:"nl";s:28:"Toon RSS feeds op uw website";s:2:"br";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"pt";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"ru";s:94:"Выводит обработанную ленту новостей на вашем сайте";s:2:"id";s:42:"Menampilkan kutipan RSS feed di situs Anda";s:2:"fi";s:39:"Näytä purettu RSS syöte sivustollasi";s:2:"fr";s:39:"Affichez un flux RSS sur votre site web";s:2:"fa";s:46:"نمایش خوراک های RSS در سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 5, 1367229993),
(6, 'social_bookmark', 'a:10:{s:2:"en";s:15:"Social Bookmark";s:2:"el";s:35:"Κοινωνική δικτύωση";s:2:"nl";s:19:"Sociale Bladwijzers";s:2:"br";s:15:"Social Bookmark";s:2:"pt";s:15:"Social Bookmark";s:2:"ru";s:37:"Социальные закладки";s:2:"id";s:15:"Social Bookmark";s:2:"fi";s:24:"Sosiaalinen kirjanmerkki";s:2:"fr";s:13:"Liens sociaux";s:2:"fa";s:52:"بوکمارک های شبکه های اجتماعی";}', 'a:10:{s:2:"en";s:47:"Configurable social bookmark links from AddThis";s:2:"el";s:111:"Παραμετροποιήσιμα στοιχεία κοινωνικής δικτυώσης από το AddThis";s:2:"nl";s:43:"Voeg sociale bladwijzers toe vanuit AddThis";s:2:"br";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"pt";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"ru";s:90:"Конфигурируемые социальные закладки с сайта AddThis";s:2:"id";s:60:"Tautan social bookmark yang dapat dikonfigurasi dari AddThis";s:2:"fi";s:59:"Konfiguroitava sosiaalinen kirjanmerkki linkit AddThis:stä";s:2:"fr";s:43:"Liens sociaux personnalisables avec AddThis";s:2:"fa";s:71:"تنظیم و نمایش لینک های شبکه های اجتماعی";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 6, 1367229993),
(7, 'archive', 'a:8:{s:2:"en";s:7:"Archive";s:2:"br";s:15:"Arquivo do Blog";s:2:"fa";s:10:"آرشیو";s:2:"pt";s:15:"Arquivo do Blog";s:2:"el";s:33:"Αρχείο Ιστολογίου";s:2:"fr";s:16:"Archives du Blog";s:2:"ru";s:10:"Архив";s:2:"id";s:7:"Archive";}', 'a:8:{s:2:"en";s:64:"Display a list of old months with links to posts in those months";s:2:"br";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"fa";s:101:"نمایش لیست ماه های گذشته به همراه لینک به پست های مربوطه";s:2:"pt";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"el";s:155:"Προβάλλει μια λίστα μηνών και συνδέσμους σε αναρτήσεις που έγιναν σε κάθε από αυτούς";s:2:"fr";s:95:"Permet d''afficher une liste des mois passés avec des liens vers les posts relatifs à ces mois";s:2:"ru";s:114:"Выводит список по месяцам со ссылками на записи в этих месяцах";s:2:"id";s:63:"Menampilkan daftar bulan beserta tautan post di setiap bulannya";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 7, 1367229992),
(8, 'blog_categories', 'a:8:{s:2:"en";s:15:"Blog Categories";s:2:"br";s:18:"Categorias do Blog";s:2:"pt";s:18:"Categorias do Blog";s:2:"el";s:41:"Κατηγορίες Ιστολογίου";s:2:"fr";s:19:"Catégories du Blog";s:2:"ru";s:29:"Категории Блога";s:2:"id";s:12:"Kateori Blog";s:2:"fa";s:28:"مجموعه های بلاگ";}', 'a:8:{s:2:"en";s:30:"Show a list of blog categories";s:2:"br";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"pt";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"el";s:97:"Προβάλει την λίστα των κατηγοριών του ιστολογίου σας";s:2:"fr";s:49:"Permet d''afficher la liste de Catégories du Blog";s:2:"ru";s:57:"Выводит список категорий блога";s:2:"id";s:35:"Menampilkan daftar kategori tulisan";s:2:"fa";s:55:"نمایش لیستی از مجموعه های بلاگ";}', 'Stephen Cozart', 'http://github.com/clip/', '1.0.0', 1, 8, 1367229992),
(9, 'latest_posts', 'a:8:{s:2:"en";s:12:"Latest posts";s:2:"br";s:24:"Artigos recentes do Blog";s:2:"fa";s:26:"آخرین ارسال ها";s:2:"pt";s:24:"Artigos recentes do Blog";s:2:"el";s:62:"Τελευταίες αναρτήσεις ιστολογίου";s:2:"fr";s:17:"Derniers articles";s:2:"ru";s:31:"Последние записи";s:2:"id";s:12:"Post Terbaru";}', 'a:8:{s:2:"en";s:39:"Display latest blog posts with a widget";s:2:"br";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"fa";s:65:"نمایش آخرین پست های وبلاگ در یک ویجت";s:2:"pt";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"el";s:103:"Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας";s:2:"fr";s:68:"Permet d''afficher la liste des derniers posts du blog dans un Widget";s:2:"ru";s:100:"Выводит список последних записей блога внутри виджета";s:2:"id";s:51:"Menampilkan posting blog terbaru menggunakan widget";}', 'Erik Berman', 'http://www.nukleo.fr', '1.0.0', 1, 9, 1367229993),
(10, 'slider', 'a:1:{s:2:"en";s:6:"Slider";}', 'a:1:{s:2:"en";s:38:"Display a Nivo Slider on your website.";}', 'Michael Giuliana', 'http://rpnzl.com', '1.1', 1, 10, 1370046224),
(11, 'firesale_cart', 's:13:"FireSale Cart";', 's:35:"Display the current cart for a user";', 'Jamie Holdroyd', 'http://www.getfiresale.org', '1.2.0', 1, 11, 1371994364),
(12, 'firesale_categories', 's:19:"FireSale Categories";', 's:44:"Display Categories in a structured tree list";', 'Jamie Holdroyd', 'http://www.getfiresale.org', '1.1.0', 1, 12, 1371994364),
(13, 'firesale_products', 's:17:"FireSale Products";', 's:44:"Display Products based on a range of options";', 'Jamie Holdroyd', 'http://www.getfiresale.org', '1.1.0', 1, 13, 1371994364);

-- --------------------------------------------------------

--
-- Table structure for table `default_widget_areas`
--

CREATE TABLE IF NOT EXISTS `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `default_widget_areas`
--

INSERT INTO `default_widget_areas` (`id`, `site_id`, `slug`, `title`) VALUES
(1, 1, 'sidebar', 'Sidebar'),
(3, 2, 'sidebar', 'Sidebars'),
(4, 1, 'tengah', 'Tengah');

-- --------------------------------------------------------

--
-- Table structure for table `default_widget_instances`
--

CREATE TABLE IF NOT EXISTS `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `default_widget_instances`
--

INSERT INTO `default_widget_instances` (`id`, `site_id`, `title`, `widget_id`, `widget_area_id`, `options`, `order`, `created_on`, `updated_on`) VALUES
(2, 1, 'Login Anggota', 2, 1, 'a:2:{s:10:"show_title";s:1:"1";s:4:"html";s:1137:"<form action="{{ url:site }}users/login" method="post" accept-charset="utf-8" id="login">\r\n<div style="display:none;">\r\n<input type="hidden" name="redirect_to" value="">\r\n</div><ul style="\r\n    list-style: none;\r\n    margin: 20px 0 0;\r\n">\r\n	<li>\r\n		<label for="email">E-mail</label>\r\n		<input type="text" name="email" value="" style="\r\n    width: 183px;\r\n">\r\n	</li>\r\n	<li>\r\n		<label for="password">Password</label>\r\n		<input type="password" id="password" name="password" maxlength="20" style="\r\n    width: 185px;\r\n">\r\n	</li>\r\n	<li id="remember_me">\r\n		\r\n		<input type="checkbox" name="remember" value="1" style="\r\n    display: inline-block;\r\n    vertical-align: top;\r\n">\r\n	<label style="\r\n    display: inline-block;  vertical-align: top;\r\n    margin-left: 5px;\r\n">Ingat Saya</label></li>\r\n	<li class="form_buttons" style="\r\n    margin-top: 20px;\r\n">\r\n		<input type="submit" value="Masuk" name="btnLogin" class="btn btn-success"> <span class="register"><a class="btn" href="{{ url:site }}register">Registrasi</a></span>\r\n	</li>\r\n	<li class="reset_pass">\r\n		<a href="{{ url:site }}users/reset_pass">Lupa Password?</a>	</li>\r\n</ul>\r\n</form>";}', 1, 1370046026, 1370046550),
(3, 1, 'Front Slide', 10, 4, 'a:16:{s:9:"slider_id";s:2:"12";s:5:"theme";s:7:"default";s:8:"captions";s:4:"true";s:6:"effect";s:4:"fade";s:9:"animSpeed";s:3:"500";s:9:"pauseTime";s:4:"5000";s:12:"directionNav";s:4:"true";s:16:"directionNavHide";s:4:"true";s:10:"controlNav";s:4:"true";s:16:"controlNavThumbs";s:5:"false";s:11:"keyboardNav";s:4:"true";s:12:"pauseOnHover";s:4:"true";s:13:"manualAdvance";s:5:"false";s:6:"slices";s:2:"15";s:7:"boxCols";s:1:"8";s:7:"boxRows";s:1:"4";}', 1, 1370046441, 1370047364);

-- --------------------------------------------------------

--
-- Table structure for table `sitetwo_migrations`
--

CREATE TABLE IF NOT EXISTS `sitetwo_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitetwo_migrations`
--

INSERT INTO `sitetwo_migrations` (`version`) VALUES
(120);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
