-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2013 at 04:42 PM
-- Server version: 5.5.32
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phddb`
--
CREATE DATABASE `phddb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phddb`;

-- --------------------------------------------------------

--
-- Table structure for table `jos_ak_profiles`
--

CREATE TABLE IF NOT EXISTS `jos_ak_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_ak_profiles`
--

INSERT INTO `jos_ak_profiles` (`id`, `description`, `configuration`, `filters`) VALUES
(1, 'Default Backup Profile', '[global]\n[akeeba]\nquota.enable_size_quota="0"\nquota.size_quota="15728640"\nquota.enable_count_quota="0"\nquota.count_quota="3"\ntuning.min_exec_time="2000"\ntuning.max_exec_time="14"\ntuning.run_time_bias="75"\nbasic.output_directory="/home/roberto/workspace/sciprod/administrator/components/com_akeeba/backup"\nbasic.temporary_directory="/home/roberto/workspace/sciprod/tmp"\nbasic.log_level="4"\nbasic.archive_name="site-[HOST]-[DATE]-[TIME]"\nbasic.backup_type="full"\nadvanced.dump_engine="native"\nadvanced.scan_engine="smart"\nadvanced.archiver_engine="jpa"\nadvanced.proc_engine="none"\nadvanced.writer_engine="direct"\nadvanced.embedded_installer="abi"\nadvanced.virtual_folder="external_files"\n[engine]\narchiver.common.dereference_symlinks="0"\narchiver.common.part_size="0"\narchiver.common.chunk_size="1048576"\narchiver.common.big_file_threshold="1048576"\narchiver.zip.cd_glue_chunk_size="1048576"\narchiver.directftp.host=""\narchiver.directftp.port="21"\narchiver.directftp.user=""\narchiver.directftp.pass=""\narchiver.directftp.initial_directory=""\narchiver.directftp.ftps="0"\narchiver.directftp.passive_mode="1"\narchiver.directftp.ftp_test="0"\ndump.common.mysql_compatibility="0"\ndump.common.extended_inserts="0"\ndump.common.packet_size="131072"\ndump.common.splitsize="524288"\ndump.common.batchsize="1000"\ndump.native.advanced_entitites="0"\nscan.smart.large_dir_threshold="100"\n', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_ak_stats`
--

CREATE TABLE IF NOT EXISTS `jos_ak_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') NOT NULL DEFAULT 'run',
  `origin` enum('backend','frontend','cli') NOT NULL DEFAULT 'backend',
  `type` enum('full','dbonly','extradbonly','alldb','fileonly') NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_ak_stats`
--

INSERT INTO `jos_ak_stats` (`id`, `description`, `comment`, `backupstart`, `backupend`, `status`, `origin`, `type`, `profile_id`, `archivename`, `absolute_path`, `multipart`) VALUES
(1, 'Backup taken on Monday, 30 August 2010 13:46', '<p>Complete</p>', '2010-08-30 11:47:11', '2010-08-30 11:47:25', 'complete', 'backend', 'full', 1, 'site-localhost-20100830-134711.jpa', '/home/roberto/workspace/sciprod/administrator/components/com_akeeba/backup/site-localhost-20100830-134711.jpa', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`) VALUES
(1, 1, 'banner', 'OSM 1', 'osm-1', 0, 43, 0, 'osmbanner1.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 1, 'banner', 'OSM 2', 'osm-2', 0, 49, 0, 'osmbanner2.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 1, '', 'Joomla!', 'joomla', 0, 22, 0, '', 'http://www.joomla.org', '2006-05-29 14:21:28', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}?phpMyAdmin=860e5404aa23be2636389a8770875ba0&phpMyAdmin=f9c3bc650a8abf0b2b4562e19788d0a1" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! The most popular and widely used Open Source CMS Project in the world.', 14, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(4, 1, '', 'JoomlaCode', 'joomlacode', 0, 22, 0, '', 'http://joomlacode.org', '2006-05-29 14:19:26', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}?phpMyAdmin=860e5404aa23be2636389a8770875ba0&phpMyAdmin=f9c3bc650a8abf0b2b4562e19788d0a1" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomlaCode, development and distribution made easy.', 14, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(5, 1, '', 'Joomla! Extensions', 'joomla-extensions', 0, 17, 0, '', 'http://extensions.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}?phpMyAdmin=860e5404aa23be2636389a8770875ba0&phpMyAdmin=f9c3bc650a8abf0b2b4562e19788d0a1" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! Components, Modules, Plugins and Languages by the bucket load.', 14, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(6, 1, '', 'Joomla! Shop', 'joomla-shop', 0, 17, 0, '', 'http://shop.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}?phpMyAdmin=860e5404aa23be2636389a8770875ba0&phpMyAdmin=f9c3bc650a8abf0b2b4562e19788d0a1" target="_blank">{NAME}</a>\r\n<br/>\r\nFor all your Joomla! merchandise.', 14, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, 1, '', 'Joomla! Promo Shop', 'joomla-promo-shop', 0, 11, 1, 'shop-ad.jpg', 'http://shop.joomla.org', '2007-09-19 17:26:24', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 1, '', 'Joomla! Promo Books', 'joomla-promo-books', 0, 14, 0, 'shop-ad-books.jpg', 'http://shop.joomla.org/amazoncom-bookstores.html', '2007-09-19 17:28:01', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'Open Source Matters', 'Administrator', 'admin@opensourcematters.org', '', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'Latest', '', 'latest-news', 'taking_notes.jpg', '1', 'left', 'The latest news from the Joomla! Team', 1, 0, '0000-00-00 00:00:00', '', 1, 0, 1, ''),
(2, 0, 'Joomla! Specific Links', '', 'joomla-specific-links', 'clock.jpg', 'com_weblinks', 'left', 'A selection of links that are all related to the Joomla! Project.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(3, 0, 'Newsflash', '', 'newsflash', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', '', 2, 0, 0, ''),
(4, 0, 'Joomla!', '', 'joomla', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(5, 0, 'Free and Open Source Software', '', 'free-and-open-source-software', '', 'com_newsfeeds', 'left', 'Read the latest news about free and open source software from some of its leading advocates.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(6, 0, 'Related Projects', '', 'related-projects', '', 'com_newsfeeds', 'left', 'Joomla builds on and collaborates with many other free and open source projects. Keep up with the latest news from some of them.', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(12, 0, 'Contacts', '', 'contacts', '', 'com_contact_details', 'left', 'Contact Details for this Web site', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(13, 0, 'Joomla', '', 'joomla', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(14, 0, 'Text Ads', '', 'text-ads', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(15, 0, 'Features', '', 'features', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(17, 0, 'Benefits', '', 'benefits', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(18, 0, 'Platforms', '', 'platforms', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(19, 0, 'Other Resources', '', 'other-resources', '', 'com_weblinks', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(33, 0, 'Joomla! Promo', '', 'joomla-promo', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=0\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(49, 'ADMINISTER_BACKUP_FILES', '', 0, 46, 'option=com_akeeba&view=buadmin', 'ADMINISTER_BACKUP_FILES', 'com_akeeba', 2, 'components/com_akeeba/assets/images/bufa-16.png', 0, '', 1),
(48, 'CONFIGURATION', '', 0, 46, 'option=com_akeeba&view=config', 'CONFIGURATION', 'com_akeeba', 1, 'components/com_akeeba/assets/images/config-16.png', 0, '', 1),
(46, 'Akeeba Backup', 'option=com_akeeba', 0, 0, 'option=com_akeeba', 'Akeeba Backup', 'com_akeeba', 0, 'components/com_akeeba/assets/images/akeeba-16.png', 0, 'siteurl=http://localhost/sciprod/\njversion=1.5\n\n', 1),
(47, 'BACKUP_NOW', '', 0, 46, 'option=com_akeeba&view=backup', 'BACKUP_NOW', 'com_akeeba', 0, 'components/com_akeeba/assets/images/backup-16.png', 0, '', 1),
(50, 'Update Manager', 'option=com_jupdateman', 0, 0, 'option=com_jupdateman', 'Update Manager', 'com_jupdateman', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(78, 'Version', '', 0, 51, 'option=com_phd&controller=version&task=display', 'Version', 'com_phd', 2, 'js/ThemeOffice/component.png', 0, '', 1),
(77, 'Excel file', '', 0, 51, 'option=com_phd&view=applicants&format=raw', 'Excel file', 'com_phd', 1, 'js/ThemeOffice/component.png', 0, '', 1),
(76, 'Programmes', '', 0, 51, 'option=com_phd&view=programmes', 'Programmes', 'com_phd', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(51, 'PhD', 'option=com_phd', 0, 0, 'option=com_phd', 'PhD', 'com_phd', 0, 'js/ThemeOffice/component.png', 0, 'phdConfig_AdminName=Patricia Nadal\nphdConfig_AdminEmail=phd@irbbarcelona.org\nphdConfig_LiveSite=http://phd.irbbarcelona.org\nphdConfig_ClosingDateTime=2011-06-02 23:59:00\nphdConfig_LimitAge=99\nphdConfig_DocsPath=/docs_phd/\nphdConfig_MaxNumberOfFiles=5\nphdConfig_SendBCC=0\nphdConfig_Application=1\nphdConfig_FirstChoice=1\nphdConfig_EmailRefereeSubject=Email from IRB Barcelona\nphdConfig_EmailRefereeBody=<html>\\n<head>\\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\\n<title>email</title>\\n</head>\\n<body>\\n\\n<p>Dear #referee#,</p>\\n\\n<p>The student #name# has applied for a PhD position at the Institute for Research in Biomedicine in Barcelona and has been asked to forward this letter to you requesting a letter of recommendation. We would be grateful if you could give us your opinion about the suitability of the candidate as a PhD student.</p>\\n<p>Please, indicate your relation with the student and evaluate the applicant according to the following criteria: theoretical knowledge, technical proficiency, interaction with colleagues, adaptability and flexibility, motivation and commitment, ability to work independently and communication skills. Please include an overall rating, from 1 (lowest) to 10 (highest) of all the students you have encountered, and indicate the time period in which you interacted with the student and in which capacity (as a teacher, advisor, employer, etc.).</p>\\n<p>Your letter of reference can be uploaded directly by copying this address into your browser: #link#</p>\\n\\n<p>Otherwise, it should be sent by fax or mail before <strong>June 2, 2011</strong> to the address indicated below.</p>\\n\\nPlease, notice that only letters with official letterhead and signature will be accepted.\\n\\n<p>Thank you in advance for your help.</p>\\n<p>Yours sincerely,</p>\\n<p>Patricia Nadal Jorda<br>\\nResearch and Academic Administration Department<br>\\n    Institute for Research in Biomedicine<br>\\n    Parc Científic de Barcelona<br>\\n    c/ Baldiri Reixac, 10-12<br>\\n    08028 Barcelona – Spain<br>\\n    Tel +34 93 4031120; fax +34 93 4037114<br>\\n    <a href="mailto:phd@irbbarcelona.org">phd@irbbarcelona.org</a><br>\\n    <a href="http://www.irbbarcelona.org">http://www.irbbarcelona.org</a></p>\\n</body>\\n</html>\\n\nphdConfig_EmailApplicantSubject1=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody1=Dear #name#,\\nThis email is to inform you that IRB Barcelona has not yet received one of the two letters of recommendation requested for application to IRB Barcelona PhD fellowships. We remind you that these letters must be sent directly to us by your referees (either by e-mail to phd@irbbarcelona.org, by airmail or by fax to our contact address) and that the deadline for receipt is 25 January 2009.Please, notice that only letters with official letterhead and signature will be accepted.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject2=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody2=Dear #name#,\\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\\nThis e-mail is to confirm that your application has been submitted correctly. You will hear back from us once the call closes and the first part of the evaluation process has been completed, around February 2009.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject3=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody3=Dear #name#,\\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject4=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody4=Dear #name#,\\nThank you once again for your recent application for a PhD grant at IRB Barcelona. After careful evaluation of your merits, I am pleased to inform you that you have been short-listed as a potential candidate for one of the grants currently on offer. You will soon receive an official letter with the invitation to visit our Institute on 4 and 5 April 2011 for interviews.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject5=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody5=Dear #name#,\\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\\nYours sincerely,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject6=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody6=Dear #name#,\\nAfter completion of the selection process, it is our pleasure to offer you a PhD fellowship at IRB Barcelona. We congratulate you on this achievement. As you know there was considerable competition for these fellowships and the number and quality of applicants were exceptionally high.\\nWe will officially contact you in the near future with more details of our offer.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject7=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody7=Dear #name#,\\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\\nWe regret to inform you that we have received no recommendations letters. You have therefore been excluded from the selection process.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\n\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'Name', 'name', 'Position', 'Street', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', 'Miscellanous info', 'powered_by.png', 'top', 'email@email.com', 1, 1, 0, '0000-00-00 00:00:00', 1, 'show_name=1\r\nshow_position=1\r\nshow_email=0\r\nshow_street_address=1\r\nshow_suburb=1\r\nshow_state=1\r\nshow_postcode=1\r\nshow_country=1\r\nshow_telephone=1\r\nshow_mobile=1\r\nshow_fax=1\r\nshow_webpage=1\r\nshow_misc=1\r\nshow_image=1\r\nallow_vcard=0\r\ncontact_icons=0\r\nicon_address=\r\nicon_email=\r\nicon_telephone=\r\nicon_fax=\r\nicon_misc=\r\nshow_email_form=1\r\nemail_description=1\r\nshow_email_copy=1\r\nbanned_email=\r\nbanned_subject=\r\nbanned_text=', 0, 12, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(46, 'Testing and Process Recommendations for Software Engineering', 'testing-and-process-recommendations-for-software-engineering', '', '<p><strong>Overview</strong> <br /> Many small software engineering organizations have problems cooperating and communicating on projects. A primary reason for this is that these small organizations often grow out of the individual efforts of  the one or two initial programmers.   Projects undertaken by an individual programmer are small enough for that one person to understand the requirements,  write the code, find the bugs, produce the deliverable, and provide the ongoing support,  often without really being aware that these are separate tasks.   As a result, comments in the code and user documentation are usually sparse. Other engineering processes and artifacts  - such as repeatable (documented and/or automated) tests, requirement and specification documents,  and records of bugs that were found and fixed - are often extremely informal or completely absent. <br /> <br /> Reasons why this happens include:</p>\r\n<ul>\r\n<li> Many software developers have not had appropriate education in software processes.   Many students have had courses in the details of specific languages and general programming constructs  (linked lists, hash tables, and so on), but few have had specific instruction in how to write a requirements document,  how to think about developing unit tests, etc. </li>\r\n<li> Small projects can and do succeed without these extra documents and processes,  so the need for those processes are not perceived.   An individual engineer who is working on a project small enough to keep in his or her head, may reach  a state that he or she can call "deliverable" much more quickly without producing requirements documents, unit tests, etc.   He or she may not perceive post-delivery support as part of the engineering cost and may not keep careful track  of how much time is spent on that part of the project.   (This is especially true if the end users come to expect and accept low-quality work and don’t bother  the engineer with reports of annoying but non-critical bugs.)   The engineer may therefore not believe in the value of these additional processes and may in fact be openly disdainful. </li>\r\n</ul>\r\n<p>As a software engineering organization achieves successes, it will tend to tackle more ambitious projects.   Soon there are two features of the projects that were extremely minimal or absent earlier on:</p>\r\n<ul>\r\n<li> The organization is working with customers that require some useful estimate of when the project will  be completed and how much it will cost.   Too many inaccurate estimates will ruin the organization’s reputation and could bankrupt it. </li>\r\n<li> Several engineers (and sometimes a newly-promoted or newly-hired engineering team leader or manager)  will have to cooperate closely on facets of the project, and must therefore be able to communicate openly,  freely, and in high detail. </li>\r\n</ul>\r\n<p>These two factors drive the need for improved engineering processes in a small project group. <br /> <br /> The question then is: what processes will provide the payoffs (better cost and time estimates and  efficient cooperation among engineers) without requiring too much overhead (thereby spending more  money and time than will be saved)? <br /> <br /> It is recommended that a small organization should implement lightweight, informal versions  of the following processes:</p>\r\n<ul>\r\n<li> Record user requirements, the engineering organization’s later questions about those requirements,  and subsequent resolutions of those requirements. </li>\r\n<li> Provide source control of tools, deliverables, and documentation. </li>\r\n<li> Record and track bugs. </li>\r\n<li> Record the tests that are to be run against the deliverable. </li>\r\n<li> Record the details of each test run. </li>\r\n<li> Establish standardized coding and commenting guidelines. </li>\r\n<li> Conduct peer code review. </li>\r\n</ul>\r\n<p>This is enough process to show quick payoff without too much time expenditure.   Attempting to implement more process than this too early in the maturation of an engineering organization  is likely to fail.   Individual engineers may be confused and annoyed at the imposition of too much "overhead",  and engineering leadership may not have the time to educate and enforce additional process.   Attempting to implement more processes than can be taught and enforced is a sure road to failure. <br /> <br /> Let’s look at each of those recommendations in a little more detail.   Each recommendation will be kept as separate as possible.   This way, an organization that quickly comes to agreement about how to implement any of these  suggestions can do so without having to implement them all at the same time.   This is extremely important!   The goal is to help the organization be more productive through slow and steady change, and not  to spend all your time implementing and arguing about engineering process improvements. <br /> <br /> <strong>Requirements Documentation</strong> <br /> One problem, which is not unique to small organizations, but which tends to affect them much more  than individual programmers, is incomplete communication and understanding of customer requirements.   One person talks to the customer and finds out what they want, and other people end up writing the actual code.   This results not only in cases where the first person wasn’t clearly communicating with the customer,  but cases where the engineers within the organization weren’t clearly communicating with each other. <br /> <br /> The first step towards solving this problem is to maintain a written users requirements document.   This means more than just the initial document that the first customer contact person writes  while discussing the project with the customer!   All subsequent questions and amendments should be recorded directly in the same document. There are two reasons to do this. <br /> <br /> First, at some point in your organization’s growth and maturation, you will want to be sure that  the customer cannot continually withhold payment with claims of "That wasn’t what I wanted."   Maintaining a customer requirements document means that, at some point, you can easily derive a  contract from the users requirements document, by adding some language like  "...and anything that is not specified above can be implemented in any way we like." <br /> <br /> Second, by recording the questions and amendments to customers’ requirements document,  you build a body of data that can be reviewed before future customer contacts,  so that your people know what issues to clarify in subsequent projects. <br /> <br /> Specific detail about any particular format for these customers’ requirements document will not be discussed.   It is much more important that the document be written down in full, and that subsequent questions and amendments  be written into the same document, than that the document follow any particular format. <br /> <br /> It is strongly recommend that you combine this detailed tracking of customer requirements with source control,  as discussed in the next section. <br /> <br /> <strong>Source Control of Tools, Deliverables, and Documentation</strong> <br /> One problem that crops up when multiple people cooperate on a project is that they are simultaneously  changing the files that make up the project.   This may result in cases where engineers lose each other’s changes, nobody knows which of multiple  versions of the project are the "current" one, etc.   This problem affects not only the actual deliverable product, but also internal documents and tools  used to build, test, and describe that product. <br /> <br /> It is recommend that a small organization use a simple source code control tool -  say SourceSafe for Windows or RCS for Unix - to allow engineers to more easily find (and discuss)  the versions of these files. <br /> <br /> The organization should keep a central version of the project on a server.   This central version should include all source files, internal tools, documentation, and the  fully built version of the product that corresponds exactly to the versions of those files. <br /> <br /> Each engineer should keep a local copy of the entire project on his or her own machine.   When the engineer performs some identifiable chunk of work, the engineer should build the project  on his or her own machine and check for problems.   <br /> <br /> Then he or she should warn the organization that he or she is going to be changing the central repository.   It is very important that only one engineer have the right to update the central repository at one time!   There should be a note on a central whiteboard, or a toy that gets passed around indicating the right to  change the central repository, or some such physical representation of this right.   Once the engineer gains the right to change the repository, he or she should then update their local copy of  the project with any changes that happened to the central repository while he was doing this work,  and build again and check for problems.   Then he or she should submit the changes to the central repository, build again there, and check for problems.   Once the central repository builds with no problems, the engineer should tell the organization that he or she is  done with this batch of work and relinquish the right to change the repository. <br /> <br /> Note that in this section there has been no discussion on what exactly the engineer should do to check for problems.   That is a separate issue.   It is strongly recommend that a small engineering organization be sure to separate the discussion of  source code control from the discussion of how to check for problems! <br /> <br /> The project should be arranged so those tools used to build the project and the documentation about  the project are parallel to the source files for the project.   For example, a simple project that has source files, database definition file(s) for a standard commercial  database, and some documentation, might be arranged with the following directories: <br /> <br /> MyProject/src:  a directory containing all the source files (this directory may of course have additional  structure inside it) <br /> <br /> MyProject/bin:   a directory that starts out empty, into which the executables are placed when the project is built.   (Opinions vary on whether intermediate files - object files etc. - should go into this directory or into the  source directory as the project is being built.) <br /> <br /> MyProject/doc:  a directory that contains documentation relating to the project.   This directory might have further structure to it - for example, if you have some documentation intended for  internal use only, and other documentation intended for end users, you might create a MyProject/doc/internal  directory and a MyProject/doc/external directory.   If you are recording user requirements with the rigor recommended in the previous section, there should  be a MyProject/doc/requirements directory as well. <br /> <br /> MyProject/database:  a directory containing the database-related file(s). <br /> <br /> MyProject/tools:  a directory containing tools relating to the project (test helper programs,  documentation readers, etc.) <br /> <br /> MyProject/tests:  a directory containing the tests. <br /> <br /> Someone in the organization should understand the source code control system well enough to "own"  problems with it, provide information and tools that speed up everyone’s ability to get fresh versions  of the project and build them, etc.   One tool that this person should provide is a single command that will retrieve a clean copy of any version  of the product and copy it into a clean local area on the developer’s machine.   This command might first just completely blow away anything in that local area on the developer’s machine,  or to save time it might simply blow away any built pieces (object files, executables, etc.)  and retrieve source files only.   The source code control system owner will be in the best position to decide how to do this.</p>\r\n<p><strong><br /></strong></p>\r\n<p><strong>Bug tracking</strong> <br /> Bug identification and tracking can be a controversial subject in a small organization.   On the one hand, engineers may not like it when others point out errors in their code.   (Or, to put it another way, they may worry that records of their mistakes may be used against them  in subsequent performance reviews.)   On the other hand, recording bugs helps make sure that a bug, once discovered, is not forgotten.   It’s a delicate balancing act. <br /> <br /> It is recommended that a small organization’s first efforts to track bugs should be extremely informal.   One specific way to do this might be to implement internal newsgroups for the discussion of bugs related to the project(s). <br /> <br /> So, for example, if OurCompany.com is working on a project called Project1, you might want to make two internal  newsgroups in which you can discuss issues relating to that project: <br /> <br /> oc.project1 -- for discussion relating to Project1 <br /> oc.project1.bugs -- for discussion of bugs found in Project1 <br /> <br /> A bug report might then be a message to the bugs newsgroup that looks something like this: <br /> <br /> Subject:  BUG: [jsmith] Tab order in customer-data screen is broken <br /> When you go to the Customer Data screen, click in any of the text fields, and hit the tab key repeatedly,  the order in which the fields get the keyboard focus jumps all around the screen, rather than progressing  through the screen in an orderly fashion. <br /> <br /> The subject line indicates that this is a new bug report, that the reporter thinks that jsmith is the person  who will need to fix it, and includes a short description of the bug. <br /> <br /> Discussion of the bug ticket should be done with the ‘reply’ mechanism, so that the discussion of each bug  is segregated into its own thread. <br /> <br /> Then, when jsmith fixes the bug, he should reply to a message in this bug thread and change the subject line: <br /> <br /> Subject:  FIX: [jsmith]  Tab order in customer-data screen is broken <br /> I found and fixed the problem.  See MyProject/src/customer/foo.asp.   The fix is in the central repository as of 2pm today. <br /> <br /> By using the subject field this way, the discussion of a bug will look like this: <br /> Mary Jones    BUG: [jsmith] Tab order in customer-data screen is broken<br /> John Smith    :Re: BUG: [jsmith] Tab order in customer-data screen is broken<br /> Mary Jones    Re: Re: BUG: [jsmith] Tab order in customer-data screen is broken<br /> John Smith    FIX: [jsmith] Tab order in customer-data screen is broken <br /> <br /> Anyone reading these discussions can easily see which bugs have been fixed and which ones haven’t. <br /> <br /> It is predicted that, some time after the organization is trained to use internal newsgroups  this way, people will want to answer additional questions about bugs:</p>\r\n<ul>\r\n<li> How many bugs are open against the current project? </li>\r\n<li> What bug should I be working on first? </li>\r\n<li> Did John Smith’s fix to this bug really fix the problem? </li>\r\n<li> How many bugs have we been finding against this project, both now and at various times in the past? </li>\r\n</ul>\r\n<p>Be aware that a commercial bug-tracking system will make it easier to answer those questions - but at some cost.   Everyone in the organization has to be consistent in how they report and track bugs.   It often takes a little longer to report, comment on, and move bugs around in the system than with this newsgroup method.   So it is recommended that you wait until you are sure you are spending too much time manually sifting through  newsgroup discussions before you go looking for a commercial bug-tracking solution. By the time you know you are ready for a commercial bug tracking system, you will know how to identify one that  suits your needs (or at least how to start looking). <br /> <br /> <strong>Written Test Scripts and Test Automation</strong> <br /> Finding bugs often begins as a time-consuming and haphazard process.   The easiest (and, in some ways, best) way to find bugs is to have someone use the program exactly as your end users will. Each engineer should run the product in his or her own area after making any significant changes before  committing the results to the central repository.  Engineering organizations soon learn that testing is a costly but unavoidable part of the process.   You must do a lot of testing because usually your organization does not fully appreciate  how "interconnected" everything in the product is.   Changes made in one directory or module may not seem to have effects elsewhere, when they actually do.   Unexpected inter-relationships among modules may result in bugs popping up in unexpected places. <br /> <br /> An organization’s first response should be to have a periodic review of the version of the product in the  central repository, where engineers (and maybe even other people in the organization) play around with  the product in order to find and report bugs. <br /> <br /> After you go through this stage a few times, you will probably notice that "coverage" is haphazard.   Bugs can lurk around for quite a while before being discovered.   The same testing tasks may be repeated many times before other tasks are attempted the first time. <br /> <br /> One way to make this "manual" testing effort more efficient and effective is to write down "scripts"  that are to be periodically executed against the software.   These test scripts should be placed under source code control, just like any other file associated with the project.   The test script should be written in plain English such that someone who is computer-aware but not necessarily  a developer can understand and carry it out. <br /> <br /> For example, consider a simple web page where there are two fields and an "OK" button.   The intention is that the users will type a number into each of the text fields and then hit the "OK" button.   This should cause another page, which says "the sum of your numbers is (whatever)", to load. <br /> <br /> The test script might start out like this: <br /> 1. For each of the following combinations below, enter the first string in the first field, and then  the second string in the second field, and then click OK.  Make sure that the next page shows the correct sum. <br /> a. 3   1<br /> b. 1.2   3.<br /> c. .3   0.2<br /> d. -4   -.3 <br /> <br /> 2. For each of the following combinations below, enter the first string in the first field, and then  the second string in the second field, and then hit OK.  Make sure that an error dialog comes up saying  "Illegal value" and that you can dismiss that error dialog by hitting its OK button. <br /> a.  a   3.0<br /> b. 1.2  #<br /> c. 0   ‘<br /> d. --4   2<br /> e. 3   3..<br /> f. (blank)   4.0<br /> g. 2.1   (blank)<br /> h. (blank)   (blank) <br /> <br /> It might then go on to include test cases for more complicated cases, tab ordering, hitting forward and  back on the browser, etc. <br /> <br /> There are many reasons to produce and use test scripts like this:</p>\r\n<ul>\r\n<li> Written test scripts can be reviewed for ideas that can apply to other test scripts. </li>\r\n<li> Multiple people can more easily discuss and cooperate in testing when a significant portion of the test work  is written down. </li>\r\n<li> Members of your organization who are not programmers can run test scripts and learn how  to write very good test scripts. </li>\r\n</ul>\r\n<p>Note that even when you have test scripts, you should encourage people to do some "free play" with the  product during test cycles.  Encourage people to keep some kind of record of what they’re doing.   Then bugs that are discovered can be more readily reproduced and isolated, and the techniques used  to uncover those bugs can make their way into subsequent versions of test scripts.   "Free play" testing is very valuable. <br /> <br /> After the organization has produced good test scripts and developed the habit of performing periodic tests,  it will become evident that some (or many) of the tests had great value in their first few iterations,  but are much less likely to actually discover bugs later.   You can decrease the rate at which you run those tests, so as not to spend more time (and money)  running those tests than they’re worth.  Another way to attack this problem is by automating those tests. <br /> <br /> Test automation is a fairly sophisticated technique.   It is strongly suggested that your organization go through a few projects with increasingly rigorous  manual test scripts before you embark on any kind of significant test automation plan.   You need to understand many things about your engineering process before you can make a good decision  about test automation. <br /> <br /> It is suggested at this point that, when the time comes to consider test automation,  you think along the lines of purchasing a commercial capture-and-playback test automation tool  (like Segue’s QAPartner/SilkTest package) to automate the rigorous manual test scripts that you have developed.   By the time it is a good business idea to do this test automation, you will recognize the need and  will have had plenty of practice with engineering process improvement.  Do your test automation slowly and carefully! <br /> <br /> <strong>Written Test Results</strong> <br /> Each time someone carries out a test script, or performs some free form testing, he or she should write down  what script was run, what version of the product it was run against, and what the results were.   If you have implemented the simple newsgroup model discussed above, then a test results report might  look something like this: <br /> <br /> Newsgroup: oc.project1<br /> Subject: Test Results - User Data Script 5/13/00 vs. Project1 v1.2.63 <br /> <br /> I ran the User Data script dated 5/13/00 on Project1 version 1.2.63 (the version in the central repository  as of today at 3pm). <br /> <br /> All tests passed except 2c. (the single quote test).    I checked the bugs newsgroup and saw that there is an open bug on this already so I didn’t file a new one. <br /> <br /> Note the distinction between the test script and the test results report.   The script should be submitted to the central repository and versioned the same as source code.   The test results reports can be sent to the project newsgroup. <br /> <br /> These test results reports help engineers reproduce and isolate bugs by eliminating any possible confusion  over when a particular bug was first discovered. <br /> <br /> <strong>Coding and Commenting Guidelines</strong> <br /> Standardized guidelines ensure that code and documentation is uniform in appearance, concept, and presentation,  regardless of who actually does the programming.  In addition, guidelines truly add professionalism to the coding process. <br /> <br /> A set of coding guidelines should be defined for all of the computer languages and technologies that are used inhouse.  It is recommended that the guidelines be arrived at by mutual agreement with all the programmers.  Equally important, is a standardized format for commenting code. Indeed, uncommented code could prove to be a potential financial liability in the future,  while properly commented code will make it easier for developers   to become acquainted with legacy code or code created by other programmers. <br /> <br /> For development environments/languages that offer it,  automated formatting tools can be purchased to help in the application of the standards.   <br /> <br /> <strong>Code Reviews</strong> <br /> It is recommended that code reviews be performed immediately after each significant program module  or function is created.  Ideally, two reviewers should peruse the code independently.  At a minimum, the reviewers should examine the code with respect to:</p>\r\n<ul>\r\n<li> The code must adhere to the coding and comments guidelines. </li>\r\n<li> The code must be clear and understandable. </li>\r\n<li> The code must be efficient and logical. </li>\r\n</ul>\r\n<p>Next, they should meet with the developer to discuss the code and recommend changes.    Such a meeting should stress both the positive and problematic aspects of the code.  All of the agreed upon changes, if any, should be documented.  The developer should then implement the changes and this should then be verified by either one of the  reviewers or a third person.   Finally, the review case is marked closed.   <br /> <br /> As you can gather, the code review process is essentialy treated in the same way as bug reports.  Issues should be properly documented, they should be marked complete once they have been addressed,  and the product should not ship until all matters have been addressed.  <br /> <br /> <strong>Conclusion</strong> <br /> These are the steps that are recommended for a small engineering organization to take in order to make the  difficult transition from individual effort to collaborative effort.   These recommendations have been casted as informally as possible.   It is critical that, for each process improvement, the first step be sufficiently small that you don’t  end up with the organization in an uproar about how exactly to go about implementing the process improvement!   Remember, each of these steps is an attempt to improve the ease with which people can cooperate at their actual work.   None of these processes should grow to dominate over the actual work of designing, implementing, debugging,  and shipping the actual product. <br /> <br /> The <strong>Guru</strong> wishes to thank <strong>J. Michael Hammond</strong> for this article.</p>', '', -2, 1, 0, 1, '2009-10-16 13:16:51', 62, '', '2009-11-26 15:47:55', 62, 0, '0000-00-00 00:00:00', '2009-10-16 13:16:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 0, '', '', 0, 1, 'robots=\nauthor='),
(47, 'Users, profiles and pass', 'users-profiles-and-pass', '', '<p>Demo</p>', '', -2, 1, 0, 1, '2009-11-26 15:48:02', 62, '', '2010-09-14 14:05:04', 62, 0, '0000-00-00 00:00:00', '2009-11-26 15:48:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(48, 'Test Collaboration', 'test-collaboration', '', '<table style="width: 100%;" border="0">\r\n<tbody>\r\n<tr>\r\n<td><strong>Profile Administrator: </strong></td>\r\n<td></td>\r\n<td></td>\r\n</tr>\r\n<tr style="text-align: center;">\r\n<td style="text-align: left;">View Table Collaboration</td>\r\n<td style="text-align: left;"><em> comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2">COLLABORATION_DELETE_OK label, de donde sale???</td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n<tr>\r\n<td><strong>Profile Part_administrator: (Reader)</strong></td>\r\n<td></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td>View Table Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td>-</td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2">COLLABORATION_DELETE_KO ????<br /></td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n<tr>\r\n<td><strong>Group Leaders:<br /></strong></td>\r\n<td><strong>(Only own)</strong></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td>View Table Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2"><br /></td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n<tr>\r\n<td><strong>Reader:</strong></td>\r\n<td></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td>View Table Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td><em>-<br /></em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2"><br /></td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br />Microsoft Explorer-&gt; Mas o menos es correcto, pero los titulos Collaboration details form y Collaboration data casi no se ven ! (estan en blanco)<br /><br />link edit<br />index.php?option=com_science&amp;view=collaboration&amp;id=6&amp;Itemid=64<br /><br />link delete<br />index.php?option=com_science&amp;controller=collaborations&amp;task=delete&amp;id=5&amp;Itemid=64</p>\r\n<p> </p>\r\n<p>NOTA General, la estetica no flipa!</p>', '', -2, 1, 0, 1, '2009-12-16 18:59:15', 62, '', '2009-12-16 19:22:22', 62, 0, '0000-00-00 00:00:00', '2009-12-16 18:59:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(49, 'IRB Barcelona Scientific Production Database', 'irb-barcelona-scientific-production-database', '', '<p>Welcome to the IRB Barcelona Scientific Production database user  interface. Here you can enter and update the information relative to the  scientific activity of your research group. You will provide  information on publications, collaborations, projects, PhD theses,  patents and awards. This information will be used for IRB Barcelona''s  annual reports and other statistics that we are required to gather for  specific purposes. <br /><br /> Steps:</p>\r\n<ul>\r\n<li>Log in with your user name and password (same as the one you use to access IRB Barcelona''s server space)</li>\r\n<li>Fill out the information in EACH of the 6 categories in the blue tabs  in the menu at the top of this page. You can view and download reports  of your information under the "Reports" tab.</li>\r\n<li>The information  you enter will be stored in the system as you go along. You can complete  the information in different sessions.</li>\r\n</ul>\r\n<p><br />The deadline  for completing your information is XXXX. It is important that you  respect this deadline - whatever is in the database at that time will be  included in the Annual Report for 2009.</p>', '', -2, 0, 0, 0, '2010-09-09 14:30:23', 62, '', '2010-09-13 11:53:53', 62, 0, '0000-00-00 00:00:00', '2010-09-09 14:30:23', '0000-00-00 00:00:00', '', '', 'show_title=0\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 0, '', '', 0, 0, 'robots=\nauthor='),
(50, 'Application Guidelines', 'application-guidelines', '', '<p><span style="color: #397cc6;"><span style="font-size: large;"><span style="font-family: trebuchet ms,geneva;">The application form must be filled in by all applicants.</span></span></span></p>\r\n<p><span style="color: #397cc6;"><span style="font-size: large;">To access it, please enter a username and password on the right hand side of the page.</span></span></p>\r\n<p>Complete and submit the PhD application form that you will find in the PhD Menu on the right hand side of this link once you have registered. You will be asked to attach the following documents:</p>\r\n<ul>\r\n<li>Curriculum vitae</li>\r\n<li>A statement of purpose</li>\r\n<li>Scanned Certified Academic Records. If your University Provides a grading system explanation you should also attach it.</li>\r\n<li>Any additional files you consider relevant to your application</li>\r\n<li>Two recommendation letters from university lecturers or scientists with who the applicant has studied or worked</li>\r\n</ul>\r\n<p>Recommendation letters must be sent directly to us by your referees directly from the application. Only letters with official letterhead and signature will be accepted. Referees may upload their letters directly into the application proceeding as indicated in the instructions.  Alternatively, referees may send the letters instructions either by e-mail to <a href="mailto:phd@irbbarcelona.org" target="_blank">phd(at)irbbarcelona.org</a> or by airmail to our contact address.</p>\r\n<p>You are responsible for ensuring that referees submit their letters. Fill in the section reserved on the application form for the names of the referees contacted and click into “Sent letter” button to send an automatic email to your referees asking for your recommendation. Otherwise, download instructions for the referees (the link is in the application form) and forward these instructions on to them.</p>\r\n<p>Please provide a 3-line summary of work experience you have had and indicate the programme(s) to which you wish to apply (maximum of 2 programmes).</p>\r\n<p>We suggest that you attach and submit all the information you can in English  (CV, motivation letter, summary of work experience). If the certified academic records aren''t in Catalan, Spanish or English you should also attach a sworn translation in one of the above mentioned languages.</p>\r\n<p>Back to the <a href="http://irbbarcelona.org/index.php/en/training-and-jobs" target="_blank">IRB Barcelona - Training and Jobs site</a>.</p>', '', 1, 1, 0, 1, '2010-09-28 09:28:58', 62, '', '2011-04-21 14:09:15', 86, 0, '0000-00-00 00:00:00', '2010-09-28 09:28:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 1, '', '', 0, 242, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(46, 4),
(48, 3),
(49, 2),
(50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=860 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(34, 'users', '86', 0, 'phdadmin', 0),
(612, 'users', '665', 0, 'phdadmin2', 0),
(859, 'users', '912', 0, 'Coll', 0),
(858, 'users', '911', 0, 'Roberto Bartolomé', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 858),
(18, '', 859),
(25, '', 10),
(25, '', 34),
(25, '', 612);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'IRB Barcelona Scientific Production', 'irb-barcelona-scientific-production', 'index.php?option=com_science&view=science', 'component', -2, 0, 34, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'send_emails=\npage_title=IRB Barcelona Scientific Production\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(2, 'mainmenu', 'Joomla! License', 'joomla-license', 'index.php?option=com_content&view=article&id=5', 'component', -2, 0, 20, 0, 31, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(41, 'mainmenu', 'FAQ', 'faq', 'index.php?option=com_content&view=section&id=3', 'component', -2, 0, 20, 0, 30, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1', 0, 0, 0),
(11, 'othermenu', 'Joomla! Home', 'joomla-home', 'http://www.joomla.org', 'url', -2, 0, 0, 0, 18, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(12, 'othermenu', 'Joomla! Forums', 'joomla-forums', 'http://forum.joomla.org', 'url', -2, 0, 0, 0, 19, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(13, 'othermenu', 'Joomla! Documentation', 'joomla-documentation', 'http://docs.joomla.org', 'url', -2, 0, 0, 0, 20, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(14, 'othermenu', 'Joomla! Community', 'joomla-community', 'http://community.joomla.org', 'url', -2, 0, 0, 0, 21, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(15, 'othermenu', 'Joomla! Magazine', 'joomla-community-magazine', 'http://community.joomla.org/magazine.html', 'url', -2, 0, 0, 0, 22, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(16, 'othermenu', 'OSM Home', 'osm-home', 'http://www.opensourcematters.org', 'url', -2, 0, 0, 0, 23, 0, '0000-00-00 00:00:00', 0, 0, 0, 6, 'menu_image=-1\n\n', 0, 0, 0),
(17, 'othermenu', 'Administrator', 'administrator', 'administrator/', 'url', -2, 0, 0, 0, 24, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\n\n', 0, 0, 0),
(18, 'topmenu', 'News', 'news', 'index.php?option=com_newsfeeds&view=newsfeed&id=1&feedid=1', 'component', -2, 0, 11, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'show_page_title=1\npage_title=News\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_other_cats=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 0, 0, 0),
(20, 'usermenu', 'Your Details', 'your-details', 'index.php?option=com_user&view=user&task=edit', 'component', 1, 0, 14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(24, 'usermenu', 'Logout', 'logout', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(27, 'mainmenu', 'Joomla! Overview', 'joomla-overview', 'index.php?option=com_content&view=article&id=19', 'component', -2, 0, 20, 0, 29, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(28, 'topmenu', 'Testing', 'testing', 'index.php?option=com_content&view=article&id=46', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(29, 'topmenu', 'Features', 'features', 'index.php?option=com_content&view=article&id=22', 'component', -2, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(30, 'topmenu', 'The Community', 'the-community', 'index.php?option=com_content&view=article&id=27', 'component', -2, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(34, 'mainmenu', 'What''s New in 1.5?', 'what-is-new-in-1-5', 'index.php?option=com_content&view=article&id=22', 'component', -2, 0, 20, 0, 28, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(37, 'mainmenu', 'More about Joomla!', 'more-about-joomla', 'index.php?option=com_content&view=section&id=4', 'component', -2, 0, 20, 0, 27, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1', 0, 0, 0),
(53, 'othermenu', 'Test controller', 'test-controller', 'index.php?option=com_science&view=science', 'component', -2, 0, 34, 0, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(44, 'congress-manager', 'Section Blog', 'section-blog', 'index.php?option=com_content&view=section&layout=blog&id=3', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Section Blog layout (FAQ section)\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(45, 'congress-manager', 'Section Table', 'section-table', 'index.php?option=com_content&view=section&id=3', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Table Blog layout (FAQ section)\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nnlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(46, 'congress-manager', 'Category Blog', 'categoryblog', 'index.php?option=com_content&view=category&layout=blog&id=31', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Category Blog layout (FAQs/General category)\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(47, 'congress-manager', 'Category Table', 'category-table', 'index.php?option=com_content&view=category&id=32', 'component', -2, 0, 20, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Example of Category Table layout (FAQs/Languages category)\nshow_headings=1\nshow_date=0\ndate_format=\nfilter=1\nfilter_type=title\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_sec=\nshow_pagination=1\nshow_pagination_limit=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(48, 'mainmenu', 'Web Links', 'web-links', 'index.php?option=com_weblinks&view=categories', 'component', -2, 0, 4, 0, 26, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=Weblinks\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 0, 0, 0),
(49, 'mainmenu', 'News Feeds', 'news-feeds', 'index.php?option=com_newsfeeds&view=categories', 'component', -2, 0, 11, 0, 25, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Newsfeeds\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_other_cats=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 0, 0, 0),
(50, 'mainmenu', 'The News', 'the-news', 'index.php?option=com_content&view=category&layout=blog&id=1', 'component', -2, 0, 20, 0, 23, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=The News\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(51, 'usermenu', 'Submit an Article', 'submit-an-article', 'index.php?option=com_content&view=article&layout=form', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 2, 0, '', 0, 0, 0),
(52, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', 'index.php?option=com_weblinks&view=weblink&layout=form', 'component', 1, 0, 4, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 2, 0, '', 0, 0, 0),
(54, 'mainmenu', 'Theses', 'theses', 'index.php?option=com_science&view=theses', 'component', -2, 0, 34, 0, 34, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(55, 'othermenu', 'Theses', 'theses', 'index.php?option=com_science&view=theses', 'component', 1, 0, 34, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(56, 'othermenu', 'Theses 2', 'theses-2', 'index.php?option=com_science&view=theses', 'url', -2, 0, 0, 0, 17, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(57, 'othermenu', 'Theses al controller directo', 'theses-al-controller-directo', 'index.php?option=com_science&controller=theses&task=display', 'url', -2, 0, 0, 0, 14, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(58, 'mainmenu', 'IRBGoogle', 'irbgoogle', 'index.php?option=com_irbgoogle&view=irbgoogle', 'component', -2, 0, 36, 0, 32, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(60, 'othermenu', 'report theses', 'report-theses', 'index.php?option=com_science&view=reporttheses', 'component', -2, 0, 34, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(59, 'mainmenu', 'IRBGoogle to view', 'irbgoogle-to-view', 'index.php?option=com_irbgoogle&view=default', 'url', -2, 0, 0, 0, 33, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(61, 'othermenu', 'Reports', 'reports', 'index.php?option=com_science&view=reports', 'component', 1, 0, 34, 0, 16, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(62, 'google-list', 'IRB Google', 'irb-google', 'index.php?option=com_irbgoogle&view=default', 'component', 1, 0, 36, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(63, 'othermenu', 'Collaboration', 'collaboration', 'index.php?option=com_science&view=collaboration', 'component', -2, 0, 34, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=COLLABORATION TEMPLATE\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(64, 'othermenu', 'Collaborations', 'collaborations', 'index.php?option=com_science&view=collaborations', 'component', 1, 0, 34, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(65, 'othermenu', 'Project', 'project', 'index.php?option=com_science&view=project', 'component', -2, 0, 34, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(66, 'othermenu', 'Publication', 'publication', 'index.php?option=com_science&view=publication', 'component', -2, 0, 34, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(67, 'othermenu', 'Award', 'award', 'index.php?option=com_science&view=award', 'component', -2, 0, 34, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(68, 'othermenu', 'Patent', 'patent', 'index.php?option=com_science&view=patent', 'component', -2, 0, 34, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(69, 'othermenu', 'Awards', 'awards', 'index.php?option=com_science&view=awards', 'component', 1, 0, 34, 0, 15, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(70, 'othermenu', 'Projects', 'projects', 'index.php?option=com_science&view=projects', 'component', 1, 0, 34, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(71, 'othermenu', 'Publications', 'publications', 'index.php?option=com_science&view=publications', 'component', 1, 0, 43, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'scienceConfig_ImpactFactorStartYear=2008\nscienceConfig_ImpactFactorEndtYear=2028\nsend_emails=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(72, 'othermenu', 'Thesis', 'thesis', 'index.php?option=com_science&view=thesis', 'component', -2, 0, 34, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(73, 'othermenu', 'Patents', 'patents', 'index.php?option=com_science&view=patents', 'component', 1, 0, 34, 0, 13, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(74, 'mainmenu', 'Scientific Production', 'scientific-production', '', 'separator', -2, 0, 0, 0, 19, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(75, 'mainmenu', 'Theses', 'theses', 'index.php?option=com_science&view=theses', 'component', -2, 0, 34, 0, 18, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(76, 'mainmenu', 'Reports', 'reports', 'index.php?option=com_science&view=reports', 'component', -2, 0, 34, 0, 17, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(77, 'mainmenu', 'Collaborations', 'collaborations', 'index.php?option=com_science&view=collaborations', 'component', -2, 0, 34, 0, 16, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(78, 'mainmenu', 'Awards', 'awards', 'index.php?option=com_science&view=awards', 'component', -2, 0, 34, 0, 15, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(79, 'mainmenu', 'Projects', 'projects', 'index.php?option=com_science&view=projects', 'component', -2, 0, 34, 0, 20, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(80, 'mainmenu', 'Publications', 'publications', 'index.php?option=com_science&view=publications', 'component', -2, 0, 34, 0, 21, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(81, 'mainmenu', 'Patents', 'patents', 'index.php?option=com_science&view=patents', 'component', -2, 0, 34, 0, 22, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(82, 'mainmenu', 'Theses', 'theses', 'index.php?option=com_science&view=theses', 'component', -2, 0, 34, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(83, 'mainmenu', 'Reports', 'reports', 'index.php?option=com_science&view=reports', 'component', -2, 0, 34, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(84, 'mainmenu', 'Collaborations', 'collaborations', 'index.php?option=com_science&view=collaborations', 'component', -2, 0, 34, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(85, 'mainmenu', 'Awards', 'awards', 'index.php?option=com_science&view=awards', 'component', -2, 0, 34, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(86, 'mainmenu', 'Projects', 'projects', 'index.php?option=com_science&view=projects', 'component', -2, 0, 34, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(87, 'mainmenu', 'Publications', 'publications', 'index.php?option=com_science&view=publications', 'component', -2, 0, 34, 0, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(88, 'mainmenu', 'Patents', 'patents', 'index.php?option=com_science&view=patents', 'component', -2, 0, 34, 0, 13, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(89, 'mainmenu', 'PhD Programme Management', 'phd-application', '', 'separator', -2, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 'menu_image=-1\n\n', 0, 0, 0),
(90, 'mainmenu', 'List of Applicants', 'list-of-applicants', 'index.php?option=com_phd&view=applicants', 'component', -2, 0, 38, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_ClosingDateTime=2010-06-01\nphdConfig_LimitAge=30\nphdConfig_DocsPath=/docs_phd/\nphdConfig_MaxNumberOfFiles=5\nphdConfig_Application=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(91, 'mainmenu', 'PhD Programme Form', 'phd-programme-form', 'index.php?option=com_phd&view=applicant', 'component', -2, 0, 38, 0, 14, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_ClosingDateTime=\nphdConfig_LimitAge=30\nphdConfig_Programme=\nphdConfig_DocsPath=/docs_phd/\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(92, 'mainmenu', 'PhD Programme Menu', 'phd-programme-menu', '', 'separator', -2, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 'menu_image=-1\n\n', 0, 0, 0),
(93, 'mainmenu', 'Application form', 'application-form', 'index.php?option=com_phd&view=applicant', 'component', -2, 0, 38, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_LiveSite=\nphdConfig_ClosingDateTime=\nphdConfig_LimitAge=\nphdConfig_DocsPath=\nphdConfig_MaxNumberOfFiles=\nphdConfig_SendBCC=\nphdConfig_Application=\nphdConfig_EmailRefereeSubject=\nphdConfig_EmailRefereeBody=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(94, 'mainmenu', 'IRB Barcelona PhD Programme', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 24, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(95, 'mainmenu', 'PhD application form', 'phd-application-form', 'index.php?option=com_phd&view=applicant', 'component', -2, 0, 51, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_LiveSite=\nphdConfig_ClosingDateTime=2020-01-01 23:59:00\nphdConfig_LimitAge=30\nphdConfig_DocsPath=/docs_phd/\nphdConfig_MaxNumberOfFiles=5\nphdConfig_SendBCC=\nphdConfig_Application=\nphdConfig_EmailRefereeSubject=\nphdConfig_EmailRefereeBody=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(96, 'mainmenu', 'Applicants list', 'applicants-list', 'index.php?option=com_phd&view=applicants', 'component', 1, 94, 51, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_LiveSite=\nphdConfig_ClosingDateTime=2020-01-01 23:59:00\nphdConfig_LimitAge=30\nphdConfig_DocsPath=/docs_phd/\nphdConfig_MaxNumberOfFiles=5\nphdConfig_SendBCC=\nphdConfig_Application=\nphdConfig_EmailRefereeSubject=\nphdConfig_EmailRefereeBody=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(97, 'mainmenu', 'PhD application form', 'phd-application-form', 'index.php?option=com_phd&view=applicant', 'component', 1, 94, 51, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_LiveSite=\nphdConfig_ClosingDateTime=\nphdConfig_LimitAge=\nphdConfig_DocsPath=\nphdConfig_MaxNumberOfFiles=\nphdConfig_SendBCC=\nphdConfig_Application=\nphdConfig_EmailRefereeSubject=\nphdConfig_EmailRefereeBody=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged in Users'),
(3, 'topmenu', 'Top Menu', 'Top level navigation'),
(4, 'othermenu', 'Scientific Production', 'Scientific Production'),
(5, 'congress-manager', 'Congress Manager', 'Congress Manager'),
(7, 'google-list', 'Google List', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 1, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmoduleclass_sfx=_menu\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(17, 'User Menu', '', 6, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu\nmoduleclass_sfx=_menu\ncache=1', 1, 0, ''),
(18, 'Login Form', '', 0, 'ja-login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 1, 0, ''),
(19, 'Latest News', '', 1, 'user1', 0, '0000-00-00 00:00:00', 0, 'mod_latestnews', 0, 0, 1, 'cache=1', 1, 0, ''),
(25, 'Newsflash', '', 1, 'top', 0, '0000-00-00 00:00:00', 0, 'mod_newsflash', 0, 0, 1, 'catid=3\r\nstyle=random\r\nitems=\r\nmoduleclass_sfx=', 0, 0, ''),
(27, 'Search', '', 1, 'user4', 0, '0000-00-00 00:00:00', 0, 'mod_search', 0, 0, 0, 'cache=1', 0, 0, ''),
(29, 'Top Menu', '', 1, 'user3', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 0, 'cache=1\nmenutype=topmenu\nmenu_style=list_flat\nmenu_images=n\nmenu_images_align=left\nexpand_menu=n\nclass_sfx=-nav\nmoduleclass_sfx=\nindent_image1=0\nindent_image2=0\nindent_image3=0\nindent_image4=0\nindent_image5=0\nindent_image6=0', 1, 0, ''),
(31, 'Scientific Production', '', 0, 'ja-slideshow', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=othermenu\nmenu_style=horiz_flat\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=1\nmenu_images_align=0\nmenu_images_link=1\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=2\nindent_image1=arrow.png\nindent_image2=con_info.png\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer= \\|\nend_spacer=\n\n', 0, 0, ''),
(33, 'Footer', '', 1, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 0, 'cache=1\n\n', 1, 0, ''),
(44, 'Congress Manager', '', 5, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=congress-manager\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(41, 'Welcome to Joomla!', '<div style="padding: 5px">  <p>   Congratulations on choosing Joomla! as your content management system. To   help you get started, check out these excellent resources for securing your   server and pointers to documentation and other helpful resources. </p> <p>   <strong>Security</strong><br /> </p> <p>   On the Internet, security is always a concern. For that reason, you are   encouraged to subscribe to the   <a href="http://feedburner.google.com/fb/a/mailverify?uri=JoomlaSecurityNews" target="_blank">Joomla!   Security Announcements</a> for the latest information on new Joomla! releases,   emailed to you automatically. </p> <p>   If this is one of your first Web sites, security considerations may   seem complicated and intimidating. There are three simple steps that go a long   way towards securing a Web site: (1) regular backups; (2) prompt updates to the   <a href="http://www.joomla.org/download.html" target="_blank">latest Joomla! release;</a> and (3) a <a href="http://docs.joomla.org/Security_Checklist_2_-_Hosting_and_Server_Setup" target="_blank" title="good Web host">good Web host</a>. There are many other important security considerations that you can learn about by reading the <a href="http://docs.joomla.org/Category:Security_Checklist" target="_blank" title="Joomla! Security Checklist">Joomla! Security Checklist</a>. </p> <p>If you believe your Web site was attacked, or you think you have discovered a security issue in Joomla!, please do not post it in the Joomla! forums. Publishing this information could put other Web sites at risk. Instead, report possible security vulnerabilities to the <a href="http://developer.joomla.org/security/contact-the-team.html" target="_blank" title="Joomla! Security Task Force">Joomla! Security Task Force</a>.</p><p><strong>Learning Joomla!</strong> </p> <p>   A good place to start learning Joomla! is the   "<a href="http://docs.joomla.org/beginners" target="_blank">Absolute Beginner''s   Guide to Joomla!.</a>" There, you will find a Quick Start to Joomla!   <a href="http://help.joomla.org/ghop/feb2008/task048/joomla_15_quickstart.pdf" target="_blank">guide</a>   and <a href="http://help.joomla.org/ghop/feb2008/task167/index.html" target="_blank">video</a>,   amongst many other tutorials. The   <a href="http://community.joomla.org/magazine/view-all-issues.html" target="_blank">Joomla!   Community Magazine</a> also has   <a href="http://community.joomla.org/magazine/article/522-introductory-learning-joomla-using-sample-data.html" target="_blank">articles   for new learners</a> and experienced users, alike. A great place to look for   answers is the   <a href="http://docs.joomla.org/Category:FAQ" target="_blank">Frequently Asked   Questions (FAQ)</a>. If you are stuck on a particular screen in the   Administrator (which is where you are now), try clicking the Help toolbar   button to get assistance specific to that page. </p> <p>   If you still have questions, please feel free to use the   <a href="http://forum.joomla.org/" target="_blank">Joomla! Forums.</a> The forums   are an incredibly valuable resource for all levels of Joomla! users. Before   you post a question, though, use the forum search (located at the top of each   forum page) to see if the question has been asked and answered. </p> <p>   <strong>Getting Involved</strong> </p> <p>   <a name="twjs" title="twjs"></a> If you want to help make Joomla! better, consider getting   involved. There are   <a href="http://www.joomla.org/about-joomla/contribute-to-joomla.html" target="_blank">many ways   you can make a positive difference.</a> Have fun using Joomla!.</p></div>', 0, 'cpanel', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 2, 1, 'moduleclass_sfx=\n\n', 1, 1, ''),
(42, 'Joomla! Security Newsfeed', '', 6, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_feed', 0, 0, 1, 'cache=1\ncache_time=15\nmoduleclass_sfx=\nrssurl=http://feeds.joomla.org/JoomlaSecurityNews\nrssrtl=0\nrsstitle=1\nrssdesc=0\nrssimage=1\nrssitems=1\nrssitemdesc=1\nword_count=0\n\n', 0, 1, ''),
(45, 'Google List', '', 4, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=google-list\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(49, 'you_are_here', '', 0, 'breadcrumbs', 0, '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 0, 0, 0, 'showHome=1\nhomeText=Home\nshowLast=1\nseparator=\nmoduleclass_sfx=\ncache=0\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(17, 0),
(18, 0),
(19, 1),
(19, 2),
(19, 4),
(19, 27),
(19, 36),
(25, 0),
(27, 0),
(29, 0),
(31, 0),
(33, 0),
(40, 0),
(44, 0),
(45, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `jos_newsfeeds`
--

INSERT INTO `jos_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`) VALUES
(4, 1, 'Joomla! Announcements', 'joomla-official-news', 'http://feeds.joomla.org/JoomlaAnnouncements', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(4, 2, 'Joomla! Core Team Blog', 'joomla-core-team-blog', 'http://feeds.joomla.org/JoomlaCommunityCoreTeamBlog', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(4, 3, 'Joomla! Community Magazine', 'joomla-community-magazine', 'http://feeds.joomla.org/JoomlaMagazine', '', 1, 20, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(4, 4, 'Joomla! Developer News', 'joomla-developer-news', 'http://feeds.joomla.org/JoomlaDeveloper', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(4, 5, 'Joomla! Security News', 'joomla-security-news', 'http://feeds.joomla.org/JoomlaSecurityNews', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(5, 6, 'Free Software Foundation Blogs', 'free-software-foundation-blogs', 'http://www.fsf.org/blogs/RSS', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(5, 7, 'Free Software Foundation', 'free-software-foundation', 'http://www.fsf.org/news/RSS', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(5, 8, 'Software Freedom Law Center Blog', 'software-freedom-law-center-blog', 'http://www.softwarefreedom.org/feeds/blog/', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(5, 9, 'Software Freedom Law Center News', 'software-freedom-law-center', 'http://www.softwarefreedom.org/feeds/news/', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(5, 10, 'Open Source Initiative Blog', 'open-source-initiative-blog', 'http://www.opensource.org/blog/feed', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(6, 11, 'PHP News and Announcements', 'php-news-and-announcements', 'http://www.php.net/feed.atom', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(6, 12, 'Planet MySQL', 'planet-mysql', 'http://www.planetmysql.org/rss20.xml', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(6, 13, 'Linux Foundation Announcements', 'linux-foundation-announcements', 'http://www.linuxfoundation.org/press/rss20.xml', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(6, 14, 'Mootools Blog', 'mootools-blog', 'http://feeds.feedburner.com/mootools-blog', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applicant_ethical_issue`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applicant_ethical_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `ethical_issue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applicant_programme`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applicant_programme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `programme_id` int(11) DEFAULT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=429 ;

--
-- Dumping data for table `jos_phd_applicant_programme`
--

INSERT INTO `jos_phd_applicant_programme` (`id`, `applicant_id`, `programme_id`, `order`) VALUES
(1, 1, 3, 1),
(2, 1, 1, 2),
(32, 19, 0, 2),
(31, 19, 5, 1),
(10, 4, 5, 2),
(9, 4, 2, 1),
(274, 6, 0, 2),
(273, 6, 5, 1),
(13, 7, 10, 1),
(14, 7, 3, 2),
(15, 8, 8, 1),
(16, 8, 0, 2),
(36, 20, 2, 2),
(35, 20, 6, 1),
(66, 14, 3, 2),
(65, 14, 2, 1),
(21, 17, 10, 1),
(22, 17, 3, 2),
(30, 18, 3, 2),
(29, 18, 2, 1),
(37, 22, 10, 1),
(38, 22, 5, 2),
(42, 23, 10, 2),
(41, 23, 3, 1),
(43, 26, 5, 1),
(44, 26, 3, 2),
(58, 27, 1, 2),
(57, 27, 4, 1),
(62, 30, 6, 2),
(61, 30, 8, 1),
(63, 33, 5, 1),
(64, 33, 10, 2),
(110, 34, 8, 2),
(109, 34, 9, 1),
(69, 35, 4, 1),
(70, 35, 3, 2),
(71, 37, 8, 1),
(72, 37, 6, 2),
(204, 13, 3, 2),
(203, 13, 4, 1),
(75, 39, 10, 1),
(76, 39, 5, 2),
(82, 40, 0, 2),
(81, 40, 9, 1),
(86, 41, 2, 2),
(85, 41, 3, 1),
(87, 43, 2, 1),
(88, 43, 5, 2),
(89, 36, 3, 1),
(90, 36, 10, 2),
(96, 46, 3, 2),
(95, 46, 5, 1),
(182, 42, 10, 2),
(181, 42, 3, 1),
(99, 47, 1, 1),
(100, 47, 9, 2),
(107, 51, 9, 1),
(108, 51, 1, 2),
(370, 52, 1, 2),
(369, 52, 2, 1),
(115, 54, 5, 1),
(116, 54, 3, 2),
(117, 57, 5, 1),
(118, 57, 10, 2),
(119, 59, 3, 1),
(120, 59, 1, 2),
(121, 61, 4, 1),
(122, 61, 10, 2),
(152, 56, 10, 2),
(151, 56, 3, 1),
(130, 63, 5, 2),
(129, 63, 3, 1),
(134, 29, 2, 2),
(133, 29, 3, 1),
(135, 66, 5, 1),
(136, 66, 6, 2),
(140, 25, 2, 2),
(139, 25, 10, 1),
(141, 48, 5, 1),
(142, 48, 10, 2),
(196, 68, 3, 2),
(195, 68, 10, 1),
(145, 69, 5, 1),
(146, 69, 1, 2),
(147, 70, 8, 1),
(148, 70, 6, 2),
(224, 72, 8, 2),
(223, 72, 6, 1),
(153, 73, 8, 1),
(154, 73, 6, 2),
(155, 74, 5, 1),
(156, 74, 0, 2),
(157, 65, 2, 1),
(158, 65, 10, 2),
(268, 75, 6, 2),
(267, 75, 8, 1),
(356, 67, 2, 2),
(355, 67, 5, 1),
(175, 76, 5, 1),
(176, 76, 6, 2),
(177, 77, 5, 1),
(178, 77, 4, 2),
(179, 49, 5, 1),
(180, 49, 2, 2),
(186, 78, 0, 2),
(185, 78, 3, 1),
(372, 79, 2, 2),
(371, 79, 6, 1),
(191, 81, 8, 1),
(192, 81, 6, 2),
(197, 80, 8, 1),
(198, 80, 6, 2),
(202, 82, 0, 2),
(201, 82, 10, 1),
(208, 64, 2, 2),
(207, 64, 5, 1),
(209, 84, 2, 1),
(210, 84, 5, 2),
(214, 83, 10, 2),
(213, 83, 2, 1),
(218, 86, 10, 2),
(217, 86, 3, 1),
(222, 85, 0, 2),
(221, 85, 2, 1),
(225, 87, 4, 1),
(226, 87, 10, 2),
(250, 62, 4, 2),
(249, 62, 5, 1),
(229, 88, 2, 1),
(230, 88, 3, 2),
(234, 89, 6, 2),
(233, 89, 8, 1),
(342, 31, 3, 2),
(341, 31, 5, 1),
(237, 90, 10, 1),
(238, 90, 3, 2),
(239, 91, 1, 1),
(240, 91, 9, 2),
(244, 95, 2, 2),
(243, 95, 5, 1),
(248, 94, 2, 2),
(247, 94, 5, 1),
(324, 96, 4, 2),
(323, 96, 3, 1),
(253, 97, 2, 1),
(254, 97, 5, 2),
(260, 93, 2, 2),
(259, 93, 5, 1),
(264, 53, 2, 2),
(263, 53, 5, 1),
(265, 100, 5, 1),
(266, 100, 2, 2),
(269, 101, 2, 1),
(270, 101, 5, 2),
(292, 103, 3, 2),
(291, 103, 2, 1),
(300, 104, 3, 2),
(299, 104, 2, 1),
(364, 105, 10, 2),
(363, 105, 5, 1),
(303, 106, 10, 1),
(304, 106, 3, 2),
(305, 107, 5, 1),
(306, 107, 0, 2),
(307, 108, 9, 1),
(308, 108, 1, 2),
(309, 110, 8, 1),
(310, 110, 6, 2),
(311, 109, 5, 1),
(312, 109, 3, 2),
(313, 112, 5, 1),
(314, 112, 3, 2),
(315, 113, 3, 1),
(316, 113, 5, 2),
(322, 115, 1, 2),
(321, 115, 9, 1),
(330, 116, 3, 2),
(329, 116, 2, 1),
(334, 117, 10, 2),
(333, 117, 5, 1),
(331, 119, 10, 1),
(332, 119, 6, 2),
(340, 120, 4, 2),
(339, 120, 5, 1),
(343, 111, 10, 1),
(344, 111, 5, 2),
(348, 98, 5, 2),
(347, 98, 10, 1),
(382, 60, 5, 2),
(381, 60, 2, 1),
(361, 122, 8, 1),
(362, 122, 0, 2),
(365, 92, 5, 1),
(366, 92, 10, 2),
(378, 123, 4, 2),
(377, 123, 3, 1),
(379, 124, 3, 1),
(380, 124, 4, 2),
(383, 126, 3, 1),
(384, 126, 5, 2),
(388, 128, 1, 2),
(387, 128, 10, 1),
(389, 130, 9, 1),
(390, 130, 6, 2),
(391, 132, 4, 1),
(392, 132, 10, 2),
(393, 138, 6, 1),
(394, 138, 3, 2),
(400, 141, 6, 2),
(399, 141, 2, 1),
(414, 143, 10, 2),
(413, 143, 2, 1),
(406, 144, 2, 2),
(405, 144, 3, 1),
(407, 145, 1, 1),
(408, 145, 10, 2),
(412, 146, 5, 2),
(411, 146, 2, 1),
(420, 149, 8, 2),
(419, 149, 9, 1),
(421, 150, 5, 1),
(422, 150, 0, 2),
(423, 153, 2, 1),
(424, 153, 3, 2),
(428, 151, 3, 2),
(427, 151, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applicants`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `passport` varchar(20) NOT NULL DEFAULT '',
  `birth_date` date NOT NULL DEFAULT '0000-00-00',
  `birth_country_id` int(11) NOT NULL,
  `street` varchar(40) NOT NULL DEFAULT '',
  `city` varchar(40) NOT NULL DEFAULT '',
  `postalcode` varchar(10) NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL,
  `telephone` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL,
  `wheredidu_id` int(11) NOT NULL DEFAULT '0',
  `other_fellowships` tinyint(1) DEFAULT NULL,
  `other_fellowships_text` text NOT NULL,
  `career_breaks` tinyint(1) DEFAULT NULL,
  `career_breaks_text` text NOT NULL,
  `career_breaks_filename` varchar(255) DEFAULT NULL,
  `additional_info` text,
  `additional_info_filename` varchar(255) NOT NULL,
  `phd_thesis` text NOT NULL,
  `research_experience` text NOT NULL,
  `ethical_issue` tinyint(1) NOT NULL,
  `user_username` varchar(150) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `submit_date` datetime DEFAULT NULL,
  `committee_username` varchar(150) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=157 ;

--
-- Dumping data for table `jos_phd_applicants`
--

INSERT INTO `jos_phd_applicants` (`id`, `firstname`, `lastname`, `gender_id`, `passport`, `birth_date`, `birth_country_id`, `street`, `city`, `postalcode`, `country_id`, `telephone`, `email`, `wheredidu_id`, `other_fellowships`, `other_fellowships_text`, `career_breaks`, `career_breaks_text`, `career_breaks_filename`, `additional_info`, `additional_info_filename`, `phd_thesis`, `research_experience`, `ethical_issue`, `user_username`, `status_id`, `submit_date`, `committee_username`, `modified`) VALUES
(1, 'Roberto', 'Bartolome', 1, '72573264F', '1990-12-11', 199, 'Joan Oms, 13', 'Canet de Mar', '08360', 199, '628934749', 'roberto.bartolome.medina@gmail.com', 2, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'roberto', 1, NULL, NULL, '2011-04-21 13:50:55'),
(19, 'Elena', 'Fernandez Fernandez', 2, '74692148 Q', '1987-01-30', 199, 'Plaza Jose Tovar 10', 'PUlianas (Granada)', '18197', 199, '958426428', 'elenarocks@hotmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Elenaf', 1, NULL, NULL, '2011-05-11 11:02:29'),
(3, 'Graciela', 'Ruiz', 2, '553215', '1984-06-15', 138, 'Cuicuilco 131', 'Mexico City', '03600', 138, '55 56 74 35 62', 'ruragr@gmail.com', 4, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'graciela', 1, NULL, NULL, '2011-04-28 19:37:10'),
(4, 'Khalid', 'Alfarouk', 1, 'P00204679', '1983-08-13', 201, 'Obeid Khtim', 'Khartoum', '11123', 201, '00249912148466', 'Alfarouk@Hala-Alfarouk.org', 3, 0, '', 0, '', 'e-mail Toni Gabaldon.pdf', 'The applicant has the ECTS credits and the average grade necessary to apply to the usual fellowships (FPI,FPU;PFIS;FI). \r\nShe should be able to apply to FPU, and FI.\r\nHowever it is not clear whether this applicant may apply for the FPI and PFIS fellowships as her BsC finish BEFORE 1/01/2009 although his MsC degree that gives access to the doctoral studies finish after 2009. \r\nThe degree of this candidate is not adapted to the European Higher Education Area, therefore his eligibility to apply to FPU/FPI/PFIS/FI will depend on whether he will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'Alfarouk', 3, '2011-04-30 08:39:11', NULL, '2011-07-08 09:06:52'),
(5, 'Elizabeth', 'Escobar', 2, '43168308', '1979-10-02', 47, 'Carrera 79A # 52-38', 'Medellin', '0000', 47, '574-2648237', 'liz99esc@gmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'liz99esc', 1, NULL, NULL, '2011-05-01 16:26:20'),
(6, 'Joanna', 'Latasiewicz', 2, 'AGF243107', '1986-11-06', 171, 'Arianska 2', 'Gorlice', '38-300', 171, '0048 507298432', 'j.latasiewicz@gmail.com', 1, 1, 'I applied/and intend to apply for the fellowship in:\r\n- Dublin, BioAT PhD Programme\r\n- (Grenoble) EMBL International PhD Programme\r\n- Dresden, International PhD Program\r\n- Zurich, the Life Science Zurich Graduate School\r\n- Munster, The CEDAD-IMPRS Graduate Program\r\n- Krakow, ISD MOL-MED PhD Programme', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'JLatasiewicz', 3, '2011-06-01 23:04:26', NULL, '2011-07-08 09:03:15'),
(7, 'Hector', 'Roldan Roldan', 1, '75138007c', '1984-06-11', 199, 'c/ A. Garzon Barrero nº 10', 'La Zubia (Granada)', '18140', 199, '958590473', 'hectorrr17@hotmail.com', 1, 0, '', 0, '', 'curriculum investigacion.pdf', NULL, '', '', '', 0, 'hectorrr17', 1, NULL, NULL, '2011-05-09 07:30:12'),
(8, 'Daniel', 'Byrom', 1, '801484638', '1987-04-07', 225, 'Muntaner', 'Barcelona', '08036', 199, '652353784', 'daniel.byrom09@imperial.ac.uk', 1, 1, 'irb la caixa', 0, '', NULL, 'LA CAIXA 2011 INTERVIEWED CANDIDATE \r\n\r\nAccording to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits and studies ending''s date necessary to apply) but the average grade may not fulfill the requirements of certain fellowships depending on the call.', '', '', '', 0, 'danbyrom', 5, '2011-05-30 13:46:35', NULL, '2011-07-26 10:46:38'),
(20, 'Adele', 'Alagia', 2, 'AR7703680', '1983-01-12', 105, 'Calle Raurich 8 2-1', 'Barcelona', '08002', 199, '+34675227411', 'adele.alagia@gmail.com', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'aalagia', 6, '2011-05-24 11:14:33', NULL, '2011-07-26 10:46:13'),
(10, 'GERSON DIRCEU', 'LÓPEZ MUÑOZ', 1, '16377487', '1984-06-02', 47, 'The 4th Avenue West  # 12 B-26', 'Cali', '25360', 47, '0572-8944045 ', 'dirceu84@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'DIRCEU', 1, NULL, NULL, '2011-05-09 16:57:05'),
(11, 'GERSON DIRCEU', 'LÓPEZ MUÑOZ', 1, '16377487', '1984-06-02', 47, 'The 4th Avenue West  # 12 B-26', 'Cali', '25360', 47, '0572-8944045 ', 'dirceu84@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'DIRCEU', 1, NULL, NULL, '2011-05-09 16:57:05'),
(12, 'GERSON DIRCEU', 'LÓPEZ MUÑOZ', 1, '16377487', '1984-06-02', 47, 'Avenida 4 Bis Oeste  # 12 B-26', 'Cali', '25360', 47, '(0572) : 894 40 45 / 894 41 43', 'dirceu84@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'DIRCEU', 1, NULL, NULL, '2011-05-09 17:13:38'),
(13, 'Simone', 'Battaglia', 1, 'B574129', '1986-09-29', 105, 'Arnaldo da Brescia, 4', 'Sale (AL)', '15045', 105, '+393469777838', 's86.battaglia@tiscali.it', 3, 1, 'Novartis PhD program, Siena Italy & University of Pavia, Italy.', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'battaglia', 3, '2011-05-31 22:51:14', NULL, '2011-07-08 09:02:10'),
(14, 'Tamanna', 'Rahman', 2, 'B 0663171', '1982-01-01', 18, '12, Enderby Square , Beeston', 'Nottingham', 'NG9 2TQ', 18, '07551861207', 'iamdithi@live.com', 3, 1, '', 0, '', NULL, 'The applicant has the ECTS credits and the average grade necessary to apply to the usual fellowships (FPI,FPU;PFIS;FI). \r\nShe should be able to apply to FPU, and FI.\r\nHowever it is not clear whether this applicant may apply for the FPI and PFIS fellowships as her BsC finish BEFORE 1/01/2009 although her MsC degree that gives access to the doctoral studies finish after 2009. \r\nThe degree of this candidate is not adapted to the European Higher Education Area, therefore his eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not. \r\nIf this applicant is selected she will need a VISA to study in Spain which may take 2 months to have it. Therefore her incorporation may not be on 1 September although her first year fellowship will end on 31 August 2011.', '', '', '', 0, 'Iamdithi', 3, '2011-05-14 15:16:04', NULL, '2011-06-20 06:38:47'),
(15, 'Adrián', 'García Prado', 1, '17756295L', '0000-00-00', 199, 'C/Alejandro Casona n17 3B', 'Zaragoza', '50018', 199, '34658032642', 'garciaprado.adrian@gmail.com', 2, 0, '', 0, '', 'CV_Adrian-Garcia.pdf', NULL, '', '', '', 0, 'Adrian.GP', 1, NULL, NULL, '2011-05-09 20:38:22'),
(16, 'Ivan David Meza Canales', 'Meza Canales', 1, 'G02713118', '1983-06-17', 138, 'Punchan 4776', 'Zapopan ', '45054', 138, '+523336287968', 'idavidmc@hotmail.com', 1, 0, '', 1, 'To do some international volunteer work.', NULL, NULL, '', '', '', 0, 'IDavidMC', 1, NULL, NULL, '2011-05-09 21:11:07'),
(17, 'CLAUDIA', 'ESCALE GARRELL', 2, 'BD049110E', '1986-03-05', 199, '7359 EADS AVENUE', 'LA JOLLA, SAN DIEGO', '92037', 226, '8588883793', 'claudia.escale@gmail.com', 1, 0, '', 0, '', 'Recommendation_letter_Stephane.pdf', 'The applicant has an average grade below 1.6, therefore she is not eligible to apply for FPU, FI and PFIS.', '', '', '', 0, 'claudiaescale', 3, '2011-05-10 18:51:43', NULL, '2011-06-20 06:42:31'),
(18, 'Kliment', 'Sandjakoski', 1, 'A0439484', '1983-08-30', 126, 'st. Cvetan Arsov  3', 'Veles', '1400', 126, '0038943228969', 'Kliment_s830830@yahoo.com', 1, 0, '', 0, '', 'toefl ibt official score report.pdf', 'The degree of this candidate is not adapted to the European Higher Education Area, therefore his eligibility to apply to FPU/FPI/PFIS/FI will depend on whether he will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'preast830830', 3, '2011-05-10 19:20:47', NULL, '2011-07-08 09:07:01'),
(21, 'Roshan', 'Pandey', 1, 'J4076810', '1985-05-16', 99, 'X/3678 Street No. 7 Shanti Mohalla ', 'Gandhi Nagar Delhi', '110031', 99, '+91-9582588973', 'roshu007@yahoo.co.in', 2, 0, '', 0, '', 'roshan_CV.doc', NULL, '', '', '', 0, 'roshu007', 1, NULL, NULL, '2011-05-11 12:33:29'),
(22, 'Hripsime', 'Snkhchyan', 2, 'AG0221426', '1987-10-30', 11, 'Khaghagh-Don str. 19/1', 'Yerevan ', '0087', 11, '+37455571668', 'hripsimesnkhchyan@yandex.com', 4, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'hripsime87', 1, NULL, NULL, '2011-05-11 13:40:14'),
(23, 'vinodkumar', 'gajendran', 1, 'H2277991', '1988-04-01', 99, '32 Maypits', 'ashford', 'TN23 5PJ', 225, '07518627082', 'gajendran.vinodkumar@gmail.com', 1, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not. \r\nIf this applicant is selected she will need a VISA to study in Spain which may take 2 months to have it. Therefore his incorporation may not be on 1 September although his first year fellowship will end on 31 August 2011.', '', '', '', 0, 'vinod', 3, '2011-05-12 01:10:23', NULL, '2011-06-20 06:42:55'),
(24, 'Dr Md Nazrul', 'Islam', 1, 'B0330251', '1979-06-10', 18, 'Plot# 15, Block# B, Bashundhara', 'Dhaka', '1229', 18, '+8801914744781', 'doctornazrul@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'dr.nazrul', 1, NULL, NULL, '2011-05-12 07:04:47'),
(25, 'Fatemeh ', 'Zare', 2, 'E15910615', '1984-07-07', 101, 'Mardrid', 'Barcelona', '08014', 199, '627419068', 'fateme_9494@yahoo.com', 1, 1, 'JAE-pre fellowship', 0, '', NULL, 'The applicant has the ECTS credits and the average grade necessary to apply to the usual fellowships (FPI,FPU;PFIS;FI). \r\nShe should be able to apply to FPU, and FI.\r\nHowever it is not clear whether this applicant may apply for the FPI and PFIS fellowships as her BsC finish BEFORE 1/01/2009 although his MsC degree that gives access to the doctoral studies finish after 2009. \r\n\r\nThe degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'fateme_9494', 5, '2011-05-30 16:13:01', NULL, '2011-07-26 10:43:29'),
(26, 'Ievgeniia', 'Savchenko', 2, 'EC779649', '1988-02-13', 223, '55, Lomonosova', 'Kiev', '03022', 223, '+38 0503638867', 'savchenko_88@inbox.ru', 1, 1, 'Jacobs University Bremen gGmbH', 0, '', 'CV.pdf', NULL, '', '', '', 0, 'Savchenko', 1, NULL, NULL, '2011-05-12 11:42:55'),
(27, 'Pavankumar Reddy', 'Varanasi', 1, 'H1873101', '0000-00-00', 99, '189A Radford Road', 'Nottingham', 'NG7 5GT', 225, '00447803170765', 'varanasipavanreddy@gmail.com', 2, 1, 'EUVIRNIA', 0, '', NULL, NULL, '', '', '', 0, 'pavanreddy', 1, NULL, NULL, '2011-05-12 11:45:09'),
(28, 'Adriana', 'Villaverde Monar', 2, '71449396B', '1986-11-16', 199, 'Jardiel Poncela 2 3G', 'Villaobispo', '24195', 199, '0034 699 783 283', 'adrekxia_@msn.com', 1, 1, 'IRB Barcelona (La caixa)', 0, '', NULL, NULL, '', '', '', 0, 'adrekxia', 1, NULL, NULL, '2011-05-12 11:59:42'),
(29, 'Carolina', 'Alves', 2, 'H663539', '1982-06-29', 172, 'Rua Amélia Rey Colaço 7 12ºESQ', 'Portela-LRS', '2685-185', 172, '(+351) 91 4009938', 'carolinabalves@hotmail.com', 4, 1, 'German Cancer Research Center (Heildelberg)', 0, '', NULL, 'The applicant has an average grade below 1.6 (Generalitat grading system for foreign certificates), therefore she may not be eligible to apply for FPU, FI and PFIS.', '', '', '', 0, 'CarolinaAlves', 3, '2011-05-31 12:15:46', NULL, '2011-07-08 09:03:39'),
(30, 'Pol', 'Sanllehí Figuerola', 1, '45649745-N', '1986-11-03', 199, 'Sant Llorenç 38', 'Matadepera', '08230', 199, '629632240', 'pol.sanllehi@gmail.com', 3, 1, 'ICIQ (Institut Català d''Investigació Química), Tarragona (Spain)', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he does not have the 60ECTS of the masters.', '', '', '', 0, 'polsanllehi', 3, '2011-05-12 17:21:42', NULL, '2011-07-08 09:05:46'),
(31, 'Raffaella', 'Iurlaro', 2, 'AS 3696510', '1985-10-21', 105, 'Via Giosuè Carducci 118', 'Francavilla Fontana (BR)', '72021', 105, '00393335898001', 'raffa.iurlaro@gmail.com', 1, 0, '', 0, '', NULL, 'The applicant has the ECTS credits and the average grade necessary to apply to the usual fellowships (FPI,FPU;PFIS;FI). \r\nShe should be able to apply to FPU, and FI.\r\nHowever it is not clear whether this applicant may apply for the FPI and PFIS fellowships as his BsC finish BEFORE 1/01/2009 although his MsC degree that gives access to the doctoral studies finish after 2009.', '', '', '', 0, 'Raffy85', 3, '2011-06-02 01:52:28', NULL, '2011-07-08 09:03:28'),
(32, 'María del Carmen', 'Ovejero Mayoral', 2, '47485443B', '1980-07-11', 199, 'Julio Romero 8', 'Mostoles', '28932', 199, '645591282', 'maricarmen_ovejero@yahoo.es', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'maricarmen_ovejero', 1, NULL, NULL, '2011-05-12 19:20:35'),
(33, 'Ester', 'Reina Torres', 2, '47761114G', '1986-04-07', 199, 'Disseminat 97', 'Roda de Barà', '43883', 199, '678064080', 'esterreina4@gmail.com', 2, 1, 'King''s college London, Health schools\r\nUniversity college London, Institute of childs health', 1, 'When I finished my Master in Bristol last September, it was to late to apply for a PhD. Then I came back home and I have been working in a local library', NULL, 'The applicant has an average grade below 1.6, therefore she is not eligible to apply for FPU, FI and PFIS.', '', '', '', 0, 'ester_reina', 3, '2011-05-19 20:09:02', NULL, '2011-06-20 06:43:15'),
(34, 'Namachivayam', 'Karthik', 1, 'G8982688', '1986-07-06', 99, '108,Old Cuddalore Main Road,Panruti ', 'Cuddalore', '607 106', 99, '+91-9952443523', 'karthiknamachivayam@gmail.com', 3, 0, '', 0, '', 'KARTHIK_NAMACHIVAYA.doc', NULL, '', '', '', 0, 'karthiknamachivayam', 1, NULL, NULL, '2011-05-19 04:02:59'),
(35, 'Yanin', 'Jaiyen', 2, 'N803254', '1983-05-27', 211, 'Clifton Boulevard', 'Nottingham', 'NG7 2JH', 225, '+447548589790', 'jaiyen.y@gmail.com', 3, 1, 'the University of Nottingham, England.', 0, '', NULL, NULL, '', '', '', 0, 'yanin.jaiyen', 3, '2011-05-15 23:35:33', NULL, '2011-06-20 06:39:12'),
(36, 'Pankaj', 'Deo', 1, '3463074', '1978-10-06', 149, '13Hangkong Rd,Tongji Med College', 'Wuhan', '430030', 44, '15827447724', 'pankajrock1@gmail.com', 1, 0, '', 0, '', 'Pankaj Passport.pdf', NULL, '', '', '', 0, 'pankaj', 1, NULL, NULL, '2011-05-15 03:47:59'),
(37, 'sandeep', 'gholap', 1, 'G3342018', '1982-03-03', 99, 'AT-HANAMNTHGOAN,POST-PATHARE BK', 'AHMEDNAGAR', '413711', 99, '+919922580648', 'sandeepgholap@gmail.com', 1, 0, '', 0, '', 'Statement Of Purpose.docx', NULL, '', '', '', 0, 'sandeepgholap', 3, '2011-05-21 19:02:50', NULL, '2011-06-20 06:39:37'),
(38, 'Pablo', 'Puente', 1, '32393678', '1986-08-10', 10, 'calle 136 n 92', 'La Plata', '1900', 10, '+54221154772724', 'pablo.puente.lp@gmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'PPuente', 1, NULL, NULL, '2011-05-15 16:52:16'),
(39, 'INMACULADA', 'LLORENS GUMBAU', 2, '44800263N', '1983-07-18', 199, 'PLAÇA DELS FURS, 1-4-8', 'SAGUNTO', '46500', 199, '(+34)695289912', 'inllogum@alumni.uv.es', 2, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'inmallorens', 1, NULL, NULL, '2011-05-15 19:19:59'),
(40, 'Tiago', 'Gomes', 1, 'Y0195913-J', '1980-06-01', 172, 'Carrer Milla i Fontanals 82, 2o 1a', 'Barcelona', '08012', 199, '622231938', 'tiagogomes89@gmail.com', 3, 1, 'FPU', 0, '', NULL, NULL, '', '', '', 0, 'Tiagogomes', 1, NULL, NULL, '2011-05-16 12:54:41'),
(41, 'Susana', 'Eibes González', 2, '45871962A', '1988-02-11', 199, 'Av. Mestra victoria Míguez 52', 'Santiago de Compostela', '15706', 199, '+34659239392', 'susanaeibes@msn.com', 3, 1, 'University of Santiago de Compostela', 0, '', NULL, NULL, '', '', '', 0, 'Susana_Eibes', 8, '2011-05-16 17:59:03', NULL, '2011-07-26 10:45:56'),
(42, 'Gerard', 'Hernández Mir', 1, 'AAA190556', '1985-11-15', 199, 'Avinguda Torre de la Vila 25-27 4-1', 'Sant Boi de Llobregat', '08830', 199, '+34 619032235', 'gerardhernandez@hotmail.com', 3, 0, '', 0, '', NULL, 'LA CAIXA 2011 INTERVIEWED CANDIDATE. According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he/she does not have the 60ECTS of the masters.', '', '', '', 0, 'gzhernan', 3, '2011-05-27 13:37:08', NULL, '2011-07-08 09:04:33'),
(43, 'Claudia Fernanda', 'García Castro', 2, '4724665', '1983-10-28', 168, 'c/fraternitat nº3 piso 1 puerta 1', 'terrassa barcelona', '08225', 199, '636082386', 'clafe19_3@hotmail.com', 1, 0, '', 0, '', NULL, 'The applicant has an average grade below 1.6 (Generalitat grading system for foreign certificates), therefore she may not be eligible to apply for FPU, FI and PFIS.', '', '', '', 0, 'clafe', 3, '2011-05-20 22:28:14', NULL, '2011-07-08 09:07:20'),
(44, 'Rocio', 'Vicario', 2, '31957935', '0000-00-00', 10, 'Rivadavia 3026 1A', 'Mar del Plata', '7600', 10, '0054-223-4794698', 'rociovicario@gmail.com', 1, 1, 'DKFZ Heidelberg, Germany. I was pre-selected for the 2011 winter selection.\r\nIRB La Caixa', 0, '', NULL, NULL, '', '', '', 0, 'rociovicario', 1, NULL, NULL, '2011-05-16 23:25:40'),
(45, 'Sarjil', 'Dwivedi', 1, 'E0544960', '1984-12-27', 99, '10 Jockey Lane', 'Harrogate', 'HG5 0HF', 225, '(0044)-07809444651', 'sarjil84@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Dwivedi', 1, NULL, NULL, '2011-05-17 10:23:47'),
(46, 'Asad', 'Mumtaz', 1, 'KD736404', '1985-07-09', 162, 'Rua calouste gulbenkian', 'Aveiro', '3810078', 172, '+923454671990', 'shmu_10@yahoo.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'shmu04', 3, '2011-05-17 22:24:15', NULL, '2011-06-20 06:39:57'),
(47, 'Nino', 'Spataro', 1, 'YA1577289', '1984-11-06', 105, 'via Guttuso 24', 'Cattolica Eraclea', '92011', 105, '0039 0922849565', 'spatariello@yahoo.it', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'spatariello', 3, '2011-05-18 12:34:59', NULL, '2011-07-08 09:05:34'),
(48, 'Abdelghani', 'Kharbouch', 1, 'T643586', '1986-08-11', 144, 'c guadiana 1 bj2', 'TERRASSA', '08223', 199, '672662370', 'akharbouch8@gmail.com', 1, 1, 'to increase the chance to accepted in un laboratory', 0, '', NULL, 'The applicant has the ECTS credits and the average grade necessary to apply to the usual fellowships (FPI,FPU;PFIS;FI). \r\nShe should be able to apply to FPU, and FI.\r\nHowever it is not clear whether this applicant may apply for the FPI and PFIS fellowships as her BsC finish BEFORE 1/01/2009 although his MsC degree that gives access to the doctoral studies finish after 2009.', '', '', '', 0, 'kharbouch', 3, '2011-05-24 12:20:21', NULL, '2011-06-20 06:44:03'),
(49, 'Samuel', 'Álvarez', 1, '72997552Z', '1988-02-22', 199, 'Avda. Pablo Gargallo', 'Zaragoza', '50003', 199, '686298111', 'samuelalvarez2013@gmail.com', 3, 1, 'University of Zaragoza\r\nSpanish Society of Biochemistry and Molecular Biology (SEBBM)', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he/she does not have the 60ECTS of the masters.', '', '', '', 0, 'samuel.alvarez', 3, '2011-05-26 23:23:23', NULL, '2011-06-20 06:44:27'),
(50, 'Simone', 'Pieretti', 1, 'AR8284633', '1984-11-30', 105, 'via Angelita 20', 'Recanati                            (MC)', '62019', 105, '00393336703584', 'simonepieretti@libero.it', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'simo84p', 1, NULL, NULL, '2011-05-18 13:20:21'),
(51, 'Andrea', 'Berardi', 1, '01', '1986-08-29', 105, 'Via Santo Stefano 144', 'Bologna', '40125', 105, '3928690007', 'andrea.berardi7@gmail.com', 1, 1, 'IRB, Barcelona', 0, '', NULL, 'LA CAIXA 2011 INTERVIEWED CANDIDATE. According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'Berardi', 3, '2011-05-24 12:02:35', NULL, '2011-07-08 09:06:40'),
(52, 'Mauro Alejandro', 'Rodriguez clavijo', 1, '1030543939', '1988-01-22', 47, 'Carrer Besalu # 50', 'Barcelona', '08026', 199, '630759005', 'marcmao10@hotmail.com', 3, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he does not have the 60ECTS of the masters. He is still attending MsC Courses.', '', '', '', 0, 'Rodriguez Clavijo', 3, '2011-06-02 22:58:04', NULL, '2011-07-08 09:04:50'),
(53, 'Ester', 'Cannizzaro', 2, 'AN1335523', '1986-03-09', 105, 'C.da Valle S.Andrea 8/F', 'Aiello del Sabato (Avellino)', '83020', 105, '320 9003532', 'ester9386@yahoo.it', 3, 1, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'Cannizzaro', 3, '2011-05-31 20:16:59', NULL, '2011-07-08 09:02:41'),
(54, 'JUAN LUIS', 'QUEVEDO MARIN', 1, '23041498Y', '1983-02-06', 199, 'C/ Ramón y Cajal Nº 13 5ºA', 'CARTAGENA', '30205', 199, '+34 620331899', 'juanluis.quevedo@gmail.com', 1, 1, 'Becas FPI de la UAM.', 0, '', NULL, NULL, '', '', '', 0, 'Juanluchi', 1, NULL, NULL, '2011-05-27 11:32:23'),
(55, 'JUAN LUIS', 'QUEVEDO MARIN', 1, '23041498Y', '0000-00-00', 199, 'C/ Ramón y Cajal Nº 13 5ºA', 'CARTAGENA', '30205', 199, '+34 620331899', 'juanluis.quevedo@gmail.com', 1, 1, 'Becas FPI de la UAM.', 0, '', NULL, NULL, '', '', '', 0, 'Juanluchi', 1, NULL, NULL, '2011-05-20 11:05:04'),
(56, 'alexandre', 'glentis', 1, '1009ATH00064', '1985-05-28', 73, '39 rue st Maur', 'paris', '75011', 73, '0033685887491', 'a_glentis@msn.com', 1, 1, 'Curie Institute, Ecole Doctorale CDV', 0, '', NULL, NULL, '', '', '', 0, 'alex', 1, NULL, NULL, '2011-05-27 11:49:22'),
(57, 'ALBA', 'DOMENECH GUIL', 2, '77788967T', '0000-00-00', 199, 'C/MESTRAL, 38', 'FALSET', '43730', 199, '977 830276', 'albadg85@gmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'albadg', 1, NULL, NULL, '2011-05-20 14:09:34'),
(58, 'ARITRA', 'DAS', 1, 'PUNE', '1987-01-03', 99, 'LIG 44, VAISHALI NAGAR', 'BHILAI', '490023', 99, '+918698087125', 'genericky@gmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'aritra', 1, NULL, NULL, '2011-05-21 14:16:28'),
(59, 'Bagher', 'Golzarroshan', 1, 'N14003058', '1984-01-25', 101, 'Indu Fortune Field Gardenia- KPHB colony', 'Hyderabad', '500072', 99, '0091 9550561105', 'armin_golzar1984@yahoo.com', 1, 1, 'Germany', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not. \r\n\r\nIf this applicant is selected she will need a VISA to study in Spain which may take 2 months to have it. Therefore his incorporation may not be on 1 September although his first year fellowship will end on 31 August 2011.', '', '', '', 0, 'armin_golzar1984', 3, '2011-05-30 14:03:51', NULL, '2011-06-20 06:44:53'),
(60, 'Simona', 'Francia', 2, 'A06313840', '1985-05-26', 105, 'Via Trivulzio 8a', 'Parma', '43022', 105, '+393398287563', 'francia.simona@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'francia', 5, '2011-06-02 15:47:11', NULL, '2011-07-26 10:45:28'),
(61, 'Sumit', 'Jaiswal', 1, 'G6488408', '1984-10-07', 99, 'Fresnostrasse 6a', 'Muenster', '48159', 80, '+4917632021717', 'sumit.jaiswal@biotec.tu-dresden.de', 3, 1, 'Medical Life Science and Technology, TU Munich', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'sumitj', 5, '2011-06-01 04:53:42', NULL, '2011-07-26 10:46:50'),
(62, 'Anya', 'Jones', 2, '706519920', '1985-06-27', 225, 'Hippodroomlaan 36', 'Sterrebeek', '1933', 21, '+32 27319011', 'anya.c.jones@gmail.com', 1, 1, '"La Caixa" - CNIO International PhD Programme', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'anyajones', 3, '2011-05-30 17:13:20', NULL, '2011-07-08 09:01:32'),
(63, 'Georgina', 'Ormaza', 2, '78942400Y', '1987-04-22', 199, 'Landatxueta 48', 'Loiu', '48180', 199, '635759194', 'ormaza.georgina@gmail.com', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever she cannot apply this year to FI (AGAUR) because he/she does not have the 60ECTS of the masters.', '', '', '', 0, 'georgina', 3, '2011-05-30 17:11:51', NULL, '2011-07-08 09:04:12'),
(64, 'DANIEL', 'SORONELLAS VALLESPÍ', 1, 'BD211987', '1985-08-21', 199, 'JOSEP CANUDAS I BUSQUETS 9A', 'CARDEDEU', '08440', 199, '686323227', 'daniel.soronellas@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'DSoronellas', 3, '2011-05-28 13:05:51', NULL, '2011-06-20 06:40:19'),
(65, 'Victor', 'Martin', 1, 'XDA336994', '1988-03-03', 199, 'Avenida Salto del Caroni', 'Caracas', '1080', 231, '0058-414-1786428', 'victorm_88@hotmail.com', 1, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'victorm', 5, '2011-06-02 05:27:15', NULL, '2011-07-26 10:45:47'),
(66, 'Marcela Roxana', 'Del Pozo', 2, '29193821N', '1981-12-02', 10, '11 de Septiembre N° 4807', 'Villa Ballester, San Martín, Bs As', '1653', 10, '+54 11 48491085 ; +54 11 1555081995', 'mrdelpozo@yahoo.com.ar', 1, 1, 'Eurotango Scholarships	, \r\n                         November 2010', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'marrobcn', 3, '2011-05-24 06:07:15', NULL, '2011-06-20 06:45:19'),
(67, 'Israel', 'Blasco Ruano', 1, 'AAB 427913', '1984-01-05', 199, 'Camp de mar 117', 'Premia de mar', '08330', 199, '669720001', 'israel.blasruan@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Blasco Ruano', 3, '2011-06-02 11:16:05', NULL, '2011-06-20 06:40:41'),
(68, 'Carole', 'Sousa', 2, 'PPL672527', '1983-02-11', 74, 'Rua Bouça do Cabo nº6', 'Braga', '4715-419', 172, '(+351) 914980607', 'carole.sousa@gmail.com', 2, 1, 'Portugal, Switzerland', 0, '', NULL, NULL, '', '', '', 0, 'carole', 3, '2011-05-27 18:41:15', NULL, '2011-06-20 06:45:42'),
(69, 'Malgorzata', 'Wardzynska', 2, 'APM503612', '1987-05-31', 171, 'Bialy Dwor 14', 'Orneta', '11-130', 171, '+48667623105', 'm.wardzynska87@gmail.com', 1, 0, '', 0, '', NULL, 'Licenciatura 2 Faltan notas de master que esta acabando, sin ello solo demuestra 180ECTS', '', '', '', 0, 'gosiaczek3105', 3, '2011-06-02 22:06:41', NULL, '2011-07-08 09:01:56'),
(70, 'ROHIT', 'BANSAL', 1, 'J6582928', '1985-09-17', 99, 'B-103, DEPT OF MED CHEM, NIPER SAS NAGAR', 'MOHALI', '160062', 99, '(91) 9023073771', 'rb_niper@hotmail.com', 4, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.\r\nIf this applicant is selected she will need a VISA to study in Spain which may take 2 months to have it. Therefore his incorporation may not be on 1 September although his first year fellowship will end on 31 August 2011.', '', '', '', 0, 'RB', 3, '2011-05-27 20:26:00', NULL, '2011-06-20 06:46:01'),
(71, 'Gagandeep Singh', 'Joshi', 1, 'clermont-ferrand', '1988-02-17', 99, 'baljit Singh, 17 Rue rue des hautes de c', 'clermont-ferrand', '63100', 99, '3634293755', 'gagandeepsinghj777@gmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Gavy786', 1, NULL, NULL, '2011-05-24 22:42:19'),
(72, 'Ramesh', 'Gannimani', 1, 'F9603243', '1985-06-01', 99, 'K.Hanchinala camp', 'Sindhnoor, Raichur', '584128', 99, '+919764160778', 'ramorgano@gmail.com', 1, 0, '', 1, 'Due to the financial problems, I couldn''t continue my studies during the period 2006-2007, that is after finishing my undergraduate studies.', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not. \r\n\r\nIf this applicant is selected she will need a VISA to study in Spain which may take 2 months to have it. Therefore his incorporation may not be on 1 September although his first year fellowship will end on 31 August 2011.', '', '', '', 0, 'ramorgano', 3, '2011-05-29 13:25:26', NULL, '2011-07-08 09:05:57'),
(73, 'Amol', 'Dehade', 1, 'H2013669', '1984-05-10', 99, '20/2,Sakura appartment,K.P.Nagar', 'Dhankawadi,Pune', '411043', 99, '+919890844897', 'amol.dehade@rediffmail.com', 1, 0, '', 0, '', 'NO BREAK.rtf', NULL, '', '', '', 0, 'amol.dehade', 3, '2011-05-31 17:00:07', NULL, '2011-06-20 06:41:07'),
(74, 'Irene', 'Pradas Barriga', 2, 'AC990399', '1987-07-03', 199, 'C/ Sta. Mª Josefa 15 5ºC', 'León', '24007', 199, '635068482', 'irene.pradas@gmail.com', 1, 1, 'Regenerative Medicine Fellowship in Granada,  Spain.\r\n\r\nNew Advancements in Diagnosis, Therapy and Biomedical Research Fellowship in Málaga, Spain.', 0, '', NULL, NULL, '', '', '', 0, 'IrenePB', 3, '2011-05-30 21:20:58', NULL, '2011-06-20 06:41:25'),
(75, 'Sílvia', 'Orgué', 2, '47107659W', '1985-09-20', 199, '2 1 156 Valencia', 'Barcelona', '08011', 199, '654115280', 'silvia.orgue@gmail.com', 1, 1, 'JAE-predoc (CSIC)', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade) but she''s still studying MsC degree. Therefore, she would be eligible for FI grant if she finishes the MsC by this year.', '', '', '', 0, 'silvia.orgue', 6, '2011-06-01 18:03:12', NULL, '2011-07-26 10:43:47'),
(76, 'Daniel', 'Pérez Clos', 1, 'AAC955186', '1988-01-11', 199, 'Ali Bei 117 5è 4a', 'Barcelona', '08013', 199, '680621190', 'dani_111pc@hotmail.com', 3, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he does not have the 60ECTS of the masters.', '', '', '', 0, 'dani', 3, '2011-05-26 16:47:24', NULL, '2011-07-08 09:04:22'),
(77, 'Cristina-Ileana', 'Ureche', 2, 'SB499443', '1987-01-24', 176, 'Stefan cel Mare, Nr.147', 'Sibiu', '550316', 176, '+40745179124', 'ureche.cristinai@gmail.com', 1, 1, 'Vienna Biocenter, ETH Zurich', 0, '', NULL, 'Finishing MsC\r\nAccording to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'ureche.cristina', 5, '2011-05-27 20:49:15', NULL, '2011-07-26 10:45:13'),
(78, 'Adeel ', 'Asghar', 1, 'AL1823301', '1986-01-16', 162, 'Yo-kylä 16B 7C', 'Turku', '20540', 72, '+358 466130759', 'adeel.asghar057@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'adeelasghar', 3, '2011-05-30 18:55:47', NULL, '2011-06-20 06:41:42'),
(79, 'Franziska', 'Kundel', 2, '685775702', '1987-07-22', 80, '38/4 Spottiswoode Street', 'Edinburgh', 'EH9 1DG', 225, '+44 7570968595', 'fkundel@gmx.de', 1, 1, 'Marie Curie Fellowship', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'fkundel', 3, '2011-06-02 23:56:29', NULL, '2011-07-08 09:08:03'),
(80, 'Mauro', 'Cortigiani', 1, 'AN1507788', '1985-02-21', 105, 'Via Nazionale n. 404,Villafranca Tirrena', 'Messina', '98049', 105, '+393405258024', 'maurocort@hotmail.it', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'mau.1985', 3, '2011-05-29 22:28:54', NULL, '2011-07-08 09:07:10'),
(81, 'Mauro', 'Cortigiani', 1, 'AN1507788', '1985-02-21', 105, 'Via Nazionale n. 404,Villafranca Tirrena', 'Messina', '98049', 105, '+393405258024', 'maurocort@hotmail.it', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'mau.1985', 1, NULL, NULL, '2011-05-27 15:38:24'),
(82, 'Juan', 'Tur Torres', 1, '47253632V', '1988-05-17', 199, 'C/Gaspar Puig nº15 3º2ª', 'Ibiza', '07800', 199, '625969802', 'joantur88@hotmail.com', 3, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he/she does not have the 60ECTS of the masters.', '', '', '', 0, 'joantur88', 6, '2011-05-27 19:25:38', NULL, '2011-07-26 10:44:58'),
(83, 'Stelios', 'Pavlou', 1, 'E376762', '1986-01-22', 56, '4 Zaloggou Street', 'Larnaca', '7550', 56, '0035797655918', 'steliosp86@gmail.com', 2, 1, 'King''s College London\r\nMax Delbrück Center for Molecular Medicine\r\nEuropean Molecular Biology Laboratory\r\nBrunel University', 0, '', NULL, 'The applicant has an average grade below 1.6 (Generalitat grading system for foreign certificates), therefore she may not be eligible to apply for FPU, FI and PFIS.', '', '', '', 0, 'Pavlou', 3, '2011-05-30 19:23:20', NULL, '2011-07-08 09:20:15'),
(84, 'Margarita', 'Pereira', 2, '28957368N', '1981-08-10', 10, 'Avenida Bustamante Nº 5646', 'Posadas', '3300', 10, '03752-464720', 'marguibelen@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Margaret', 1, NULL, NULL, '2011-05-28 15:58:48'),
(85, 'Fahrettin', 'Haczeyni', 1, 'U 00516477', '1985-10-20', 218, 'MOBGAM Binasi ITU Ayazaga Kampus, Maslak', 'Istanbul', '34469', 218, '+905350204085', 'fhaczeyni@gmail.com', 1, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'fhaczeyni', 3, '2011-05-28 21:17:38', NULL, '2011-07-08 09:07:53'),
(86, 'Akash', 'Sharma', 1, 'J4934131', '1985-07-19', 99, 'C-220/S, IInd Floor-A, Savitri Nagar', 'New Delhi', '110017', 99, '+91-7838451215', 'akashgenomics@gmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'akashgenomics', 3, '2011-05-28 20:54:40', NULL, '2011-06-20 06:42:06'),
(87, 'Manu', 'Jain', 2, 'J5916569', '1988-08-31', 99, '68-A, Indra colony', 'Kota (Rajasthan)', '324002', 99, '9414932293, 0744-2462727', 'jain.manu31@gmail.com', 1, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.\r\n\r\nIf this applicant is selected she will need a VISA to study in Spain which may take 2 months to have it. Therefore his incorporation may not be on 1 September although his first year fellowship will end on 31 August 2011.', '', '', '', 0, 'manu jain', 3, '2011-05-30 15:12:34', NULL, '2011-06-20 06:46:36'),
(88, 'Ulises', 'Rodriguez', 1, 'G05206270', '1987-07-14', 138, 'Padua', 'México', '54140', 138, '0445518137700', 'usesco@hotmail.com', 1, 1, '"La CAIXA"/IRB Barcelona International PhD Programme fellowship', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he/she does not have the 60ECTS of the masters.\r\n\r\n\r\nThe degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'ulises', 3, '2011-06-02 03:16:38', NULL, '2011-06-20 06:47:02'),
(89, 'Nayan', 'Sharma', 1, 'F8816466', '1986-08-04', 99, '14/70, Malviya Nagar', 'Jaipur, Rajasthan', '302017', 99, '+91-9772460708', 'nayan.iiser@gmail.com', 1, 1, 'DAAD', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether he will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'nayan', 3, '2011-05-30 00:52:58', NULL, '2011-07-08 09:07:41'),
(90, 'Mugdha', 'Sawant', 2, 'B3652785', '1987-05-03', 99, '7 Tejaswi Chs , Govandi (E)', 'Mumbai', '400088', 99, '+919833132105', 'mugdha_as@yahoo.co.in', 1, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'mugdha_as', 3, '2011-05-30 13:03:24', NULL, '2011-06-20 06:47:23'),
(91, 'Fabian', 'Gruß', 1, 'LG6300ZF9', '1985-11-19', 80, 'Gebbertstraße 28', 'Erlangen', '91052', 80, '0049-160-94962296', 'fabian.gruss@gmx.de', 1, 1, 'SGBM Freiburg\r\nEMBL (Heidelberg, Grenoble)\r\nLife Science Zurich Graduate School	\r\nBiozentrum Basel fellowship Werner Siemens-Foundation\r\nUni Genf Basic and Applied Molecular Life Sciences', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade) but he''s still studying MsC. Therefore, FI fellowship eligibility will depend on the MsC finishing date.', '', '', '', 0, 'fabian.gruss', 5, '2011-06-02 18:53:20', NULL, '2011-07-26 10:44:46'),
(92, 'Rubbini', 'Davide', 1, 'C223131', '1985-01-31', 105, 'via Copernico 9', 'Malalbergo (BO)', '40051', 105, '+393384370951', 'davide.rubbini@gmail.com', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'davide.rubbini', 3, '2011-06-02 22:48:47', NULL, '2011-07-08 09:20:36'),
(93, 'Elena', 'Fillat Acín', 2, '18172133-V', '1984-10-09', 199, 'Av/ Escuela Militar de Montaña, 21', 'Jaca', '22700', 199, '653561451', 'efillatacin@gmail.com', 1, 0, '', 0, '', 'CV 2.doc', NULL, '', '', '', 0, 'efillat', 3, '2011-05-31 00:25:11', NULL, '2011-06-20 06:47:49'),
(94, 'Marta', 'Cases Villar', 2, 'AA26750445', '1987-10-31', 199, 'C/ Convento Jerusalén . 26-9ª', 'Valencia', '46007', 199, '617342125', 'vetmartacases@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'vetmartacases', 3, '2011-05-31 15:31:48', NULL, '2011-06-20 06:48:07'),
(95, 'Marta', 'Cases Villar', 2, 'AA26750445', '1987-10-31', 199, 'C/ Convento Jerusalén . 26-9ª', 'Valencia', '46007', 199, '617342125', 'vetmartacases@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'vetmartacases', 1, NULL, NULL, '2011-05-30 13:32:37'),
(96, 'Ana', 'Soares', 2, '13242409', '1987-12-15', 172, 'Rua Dr.Rui Acácio Silva Luz, Lt-11, 3ºDt', 'Leiria', '2410-163', 172, '+351918856142', 'soares.amr@gmail.com', 3, 1, 'If not accepted by this programme will apply to EMBL, Max Plank,  Dresden.', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'soares.amr', 3, '2011-06-01 13:06:56', NULL, '2011-07-08 09:21:39'),
(111, 'Davide', 'Pisu', 1, 'E442542', '1984-08-15', 105, 'Via L. Pirandello 31', 'Oristano', '09170', 105, '+39 349 2518918', 'davidepisu@gmail.com', 3, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'davidepisu', 3, '2011-06-02 20:14:52', NULL, '2011-07-08 09:01:44'),
(97, 'MARTA', 'BOMBARDÓ AYATS ', 2, '43633064 V ', '1987-03-04', 199, 'C/ Davallada ', 'Girona ', '17142', 199, '646762273', 'marta.bombardo@gmail.com', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever she cannot apply this year to FI (AGAUR) because she does not have the 60ECTS of the masters.', '', '', '', 0, 'marta', 3, '2011-05-30 23:00:51', NULL, '2011-06-20 06:48:38'),
(98, 'Sergio', 'Montaner', 1, 'XDA168722', '1986-02-15', 199, '116', 'Valencia', '2001', 231, '00584144245435', 'sergiok3@gmail.com', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he does not have the 60ECTS of the masters.\r\n\r\nThe degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'sergiok3', 3, '2011-06-02 05:56:41', NULL, '2011-07-08 09:05:00'),
(99, 'YOGESH ', 'NARKHEDE', 1, 'G0956248', '1987-03-22', 99, '609/4, Near Bank of Maharashtra, Upnagar', 'NASHIK', '422006', 99, '91-253-2416587', 'yogesh.pi.niper@gmail.com', 1, 1, '', 1, '', NULL, NULL, '', '', '', 0, 'yogeshbn87', 1, NULL, NULL, '2011-05-31 06:14:05'),
(100, 'Mireia', 'Llobet', 2, '43549377-G', '1987-06-29', 199, 'Berenguer de Palou 47-49 5º 2ª', 'Barcelona', '08027', 199, '650284727', 'mireiona19@gmail.com', 3, 1, 'Formación Personal Investigador del Ministerio de Ciencia e Innovación', 0, '', NULL, NULL, '', '', '', 0, 'mireiona19', 1, NULL, NULL, '2011-05-31 06:51:50'),
(101, 'Gaia Maria', 'Anelli', 2, 'AM5037865', '1985-05-09', 105, 'VIA PRINCIPE EUGENIO 37', 'MILANO', '20155', 105, '0039 335 8025983', 'gaiarings@hotmail.it', 1, 1, 'Zurich, Switzerland', 0, '', 'Curriculum Vitae Gaia Maria Anelli.pdf', 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'gaiarings', 3, '2011-05-31 12:25:34', NULL, '2011-07-08 09:20:49'),
(102, 'Philipp', 'Dietrich', 1, 'C4N13F1N2', '1985-08-19', 80, '2/7 Albert St', 'Randwick', '2031', 13, '+61434047829', 'pdietrich@ccia.unsw.edu.au', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'philippdietrich', 1, NULL, NULL, '2011-05-31 11:16:30'),
(103, 'Francesca', 'Nardi', 2, 'AN 6809067', '1986-09-25', 105, 'via Francesco Rosaspina 78', 'Rome', '00133', 105, '+39 062000504', 'nardi.frn@gmail.com', 1, 1, 'EMBL\r\nUniversity of Dundee', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'franardi', 5, '2011-05-31 18:02:39', NULL, '2011-07-26 10:45:38'),
(104, 'Estefânia', 'Martins', 2, '12832547', '1985-10-29', 172, 'Avenida Dr. António Fonseca', 'Vale de Cambra', '3730-303', 172, '351 918127714', 'estmartins@gmail.com', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'emartins', 3, '2011-05-31 18:40:23', NULL, '2011-07-08 09:06:30'),
(105, 'Aura Dulcinea', 'Herrera Martinez', 2, '039041564', '1986-07-06', 231, 'Paseo Hipico avenue', 'Barquisimeto', '3001', 231, '005841415304204', 'aurita.dhm@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'auraherrera', 3, '2011-06-02 13:59:28', NULL, '2011-06-20 06:48:57'),
(106, 'Preeti', 'Dabas', 2, 'University of Hydera', '1987-01-05', 99, 'H.No-771, Sector-21', 'Gurgaon', '122016', 99, '+91-124-4006197', 'preetid2005@yahoo.co.in', 3, 0, '', 1, 'I took one year break during 2005-2006 to prepare for All India medical examinations.', NULL, NULL, '', '', '', 0, 'preetid', 1, NULL, NULL, '2011-05-31 15:53:36'),
(107, 'Antoni', 'Parcerisas', 1, '47794301W', '1987-05-20', 199, 'St. Andreu 16 2n 1era', 'Tona', '08551', 199, '699372640', 't.parcerisas@gmail.com', 1, 0, '', 0, '', NULL, 'According to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual fellowships (FPI,FPU;PFIS, FI). (ECTS credits, average grade, and studies ending''s date necessary to apply).', '', '', '', 0, 'antoni.parcerisas', 6, '2011-05-31 23:11:43', NULL, '2011-07-26 10:43:12'),
(108, 'Carlos Fernando', 'Sánchez Arcos', 1, '76330363', '1978-11-22', 47, 'cll 43 # 4-40 apto 505 Ed. Ana', 'Bogotá', '110231', 47, '57 3014312288', 'c.sancheza@javeriana.edu.co', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'cfsancheza', 1, NULL, NULL, '2011-05-31 19:12:20'),
(109, 'SANIRBANDHA', 'CHOUDHURY', 1, 'H9273674', '1987-03-30', 99, '55 Moulana Azad Sarani', 'DURGAPUR', '713216', 99, '09476324793', 'sanirbandha.choudhury@learner.manipal.edu', 1, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether she will be admitted to a doctoral programme in Spain or not. \r\n\r\nIf this applicant is selected she will need a VISA to study in Spain which may take 2 months to have it. Therefore his incorporation may not be on 1 September although his first year fellowship will end on 31 August 2011.', '', '', '', 0, 'sanirbandha', 3, '2011-05-31 22:55:59', NULL, '2011-06-20 06:49:16'),
(110, 'Amir', 'Seddik', 1, 'NUH598CH3', '1983-12-26', 150, 'Peizerweg 9', 'Groningen', '9726JA', 150, '+31645137099', 'amir.imb@gmail.com', 1, 1, 'IRB, Vienna University, University of Liverpool', 0, '', NULL, 'The applicant has an average grade below 1.6, therefore she is not eligible to apply for FPU, FI and PFIS.\r\n\r\nThe degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether he will be admitted to a doctoral programme in Spain or not.', '', '', '', 0, 'amir1983', 3, '2011-06-01 10:55:20', NULL, '2011-07-08 09:05:11'),
(112, 'Ilario', 'Mennella', 1, 'AR 4677677', '1984-06-23', 105, 'Contrada Macchia', 'Roccagloriosa', '84060', 105, '00390818825078', 'Ilario1984@libero.it', 1, 1, 'Instituto Gulbekian de ciencia, phd in "integrative biology".', 0, '', NULL, NULL, '', '', '', 0, 'Ilario Mennella', 3, '2011-06-02 20:05:36', NULL, '2011-06-20 06:49:39');
INSERT INTO `jos_phd_applicants` (`id`, `firstname`, `lastname`, `gender_id`, `passport`, `birth_date`, `birth_country_id`, `street`, `city`, `postalcode`, `country_id`, `telephone`, `email`, `wheredidu_id`, `other_fellowships`, `other_fellowships_text`, `career_breaks`, `career_breaks_text`, `career_breaks_filename`, `additional_info`, `additional_info_filename`, `phd_thesis`, `research_experience`, `ethical_issue`, `user_username`, `status_id`, `submit_date`, `committee_username`, `modified`) VALUES
(113, 'Pankaj', 'Kalita', 1, 'H0845027', '1982-04-17', 99, '5/60, Parishram Apartments, Shivranjani', 'Satellite Road, Ahmedabad', '380015', 99, '+91-9979896977', 'pankaj407kalita@yahoo.co.in', 4, 0, '', 0, '', 'Blank.pdf', NULL, '', '', '', 0, 'p kalita', 3, '2011-06-02 03:15:57', NULL, '2011-06-20 06:50:35'),
(114, 'Héctor', 'Anta', 1, '71018259D', '1988-03-24', 199, '3, Arrabal Street', 'Puebla de Sanabria', '49300', 199, '679741187', 'hectanta@gmail.com', 1, 1, '"La Caixa" Fellowship to carry out a master in Spain. I applied for carrying out the Biomedicine master at the University of Barcelona.', 0, '', NULL, NULL, '', '', '', 0, 'hectanta', 1, NULL, NULL, '2011-06-01 01:18:53'),
(115, 'Manivannan', 'Sethurajan', 1, 'G 1022949', '1985-02-04', 99, '79, Nirmal Raj street', 'Pudukkottai', '622001', 99, '00914322270178', 'biotek_mani@yahoo.co.in', 1, 0, '', 0, '', NULL, 'The degree of this candidate is not adapted to the European Higher Education Area, therefore her eligibility to apply to FPU/FPI/PFIS/FI will depend on whether he will be admitted to a doctoral programme in Spain or not.\r\nIf this applicant is selected he will need a VISA to study in Spain which may take 2 months to have it. Therefore his incorporation may not be on 1 September although his first year fellowship will end on 31 August 2011.', '', '', '', 0, 'Sethurajan', 3, '2011-06-01 08:44:14', NULL, '2011-07-08 09:03:51'),
(116, 'Elisa', 'Vergari', 2, 'AA4177971', '1985-07-20', 105, 'Kipsdorfer Strasse 105', 'Dresden', ' 01277', 80, '+ 49 01639096112', 'elisa.vergari@biotec.tu-dresden.de', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'elisav', 3, '2011-06-01 19:10:45', NULL, '2011-07-08 08:52:18'),
(117, 'Ivana', 'Cosic', 2, '036570616', '1987-03-15', 54, 'Stitarska 1', 'Zagreb', '10000', 54, '00385915721959', 'riibiicaa@gmail.com', 1, 1, 'DK-MCD "Metabolic and Cardiovascular Disease", Medical University of Graz, Graz, Austria', 0, '', 'Ivana Cosic_Scan of Honors.pdf', NULL, '', '', '', 0, 'ivanacosic', 3, '2011-06-01 23:54:37', NULL, '2011-06-20 06:50:57'),
(118, 'Ivana', 'Cosic', 2, '036570616', '1987-03-15', 54, 'Stitarska 1', 'Zagreb', '10000', 54, '00385915721959', 'riibiicaa@gmail.com', 1, 0, '', 0, '', 'Ivana Cosic_Scan of Honors.pdf', NULL, '', '', '', 0, 'ivanacosic', 1, NULL, NULL, '2011-06-01 16:13:42'),
(119, 'Annick', 'Giral', 2, '05HF77557', '1986-02-06', 73, 'Rue Theophile Gautier', 'Avignon', '84000', 73, '0670593504', 'annick_giral@hotmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Annick Giral', 3, '2011-06-01 23:24:25', NULL, '2011-06-20 06:51:21'),
(120, 'Raquel', 'Barros', 2, '12768551', '1985-11-27', 172, 'Rua Prof. Antonio Cruz 263 4º direito', 'Porto', '4200-001', 172, '00351963595679', 'raquelcruzbarros@gmail.com', 2, 0, '', 0, '', NULL, 'The applicant has an average grade below 1.6, therefore she is not eligible to apply for FPU, FI and PFIS.', '', '', '', 0, 'Barros', 3, '2011-06-02 00:46:26', NULL, '2011-06-20 06:50:01'),
(121, 'Mireia', 'Borràs', 2, '47696798L', '1987-03-02', 199, 'Carrer Torrent de Can Piquer nº 13, àtic', 'Barcelona', '08016', 199, '646689528', 'mireiaborras2@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'mireiaborras', 1, NULL, NULL, '2011-06-01 22:22:43'),
(122, 'Anna', 'Montaner Domènech', 2, '47886621T', '1988-03-02', 199, 'Ausiàs Marc 25 2n 1a', 'Barcelona', '08010', 199, '+34 678 82 69 79 ', 'anna.montaner@irbbarcelona.org', 3, 0, '', 0, '', NULL, 'CANDIDANCY FOR XAVIER SALVATELLA\r\n\r\nAccording to the calls published in the BOE last year, the applicant fulfills the requirements needed to apply to the usual minsiterial fellowships (FPI,FPU;PFIS). (licenciatura, average grade, and studies ending''s date necessary to apply).\r\nHowever he cannot apply this year to FI (AGAUR) because he/she does not have the 60ECTS of the masters.', '', '', '', 0, 'anna.montaner', 2, '2011-09-05 14:48:58', NULL, '2011-09-05 12:48:58'),
(123, 'ELIANA', 'CLAURE ARENALES', 2, '6279877SC', '1985-07-29', 26, 'C/ ARENALES 1126', 'SANTA CRUZ DE LA SIERRA', 'SANTA CRUZ', 26, '(+591) 3605516; (+591)79823584', 'eliclaren@hotmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, '200314289', 1, NULL, NULL, '2011-06-11 19:05:51'),
(124, 'Nikitha', 'Kendyala', 2, 'J0654735', '1987-09-12', 99, 'Plot. No-86, Siri Nagar Colony, L.B Naga', 'Hyderabad', '500074', 99, '00919059841198', 'nikitha@ccmb.res.in', 2, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Nikitha', 1, NULL, NULL, '2011-06-17 01:32:02'),
(125, 'SULTAN', 'PATHAN', 1, 'J0679063', '1983-03-24', 99, 'EVOTEC INDIA, DIL COMPLEX,', 'THANE W', '400610', 99, '+919970022573', 'pathansultan@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'pathansultan', 1, NULL, NULL, '2011-07-15 14:32:05'),
(126, 'Ajay', 'Devendran', 1, 'F4406214', '1987-10-25', 99, '110/91 Gopalan Street, Vasudevan Nagar,', 'Chennai', '600083', 99, '+919445453421', 'ajaydevendran.2510@gmail.com', 1, 1, 'I intend to apply for scholarship that are being provided by the university departments who pursue PhD in its university departments', 0, '', NULL, NULL, '', '', '', 0, 'AJAY', 1, NULL, NULL, '2011-07-28 17:43:25'),
(127, 'prashant', 'sharma', 1, 'j7313218', '1985-07-18', 99, 'New Delhi', 'New Delhi', '110044', 99, '09560713669', 'prashant.bio@gmail.com', 2, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'prashant.bio', 1, NULL, NULL, '2011-07-30 11:12:32'),
(128, 'Mohamed', 'Ahmed', 1, 'A01509327', '1986-02-17', 63, '95 El takaful St, El Tawon, El Haram', 'Giza', '02', 63, '002(0)103565198', 'mohamed.mysara@nottingham.ac.uk', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Mysara', 1, NULL, NULL, '2011-09-27 07:43:56'),
(129, 'Saeedeh', 'Ghazaey', 2, 'R15835854', '1981-05-05', 101, 'Ahmadabad', 'Mashhad', '91837- 174', 101, '+989155859391', 'Ghazaeys@gmail.com', 2, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Ghazaey', 1, NULL, NULL, '2011-09-28 17:33:14'),
(130, 'Roberto ', 'Trujillo Govea ', 1, 'G02317598', '1988-06-14', 138, 'Valle de Guayangareo ', 'Morelia ', '58066', 138, '+52(443)104 3216', 'qfb_trujillo@hotmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, '0331804D', 1, NULL, NULL, '2011-10-13 20:14:28'),
(131, 'Natalia', 'Gorron Serrano', 2, '1114814045', '1986-09-01', 47, 'Calle 8 # 5-68', 'El cerrito', '0000', 47, '57 2 2565708', 'NATALIAGO0186@GMAIL.COM', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'natalialoseg', 1, NULL, NULL, '2011-10-16 04:57:43'),
(132, 'Prakamya', 'Gupta', 1, 'F9507323', '1986-07-02', 99, 'B-1/A, 33C JANAK PURI', 'NEW DELHI', '110058', 99, '919891331357', 'prakamya1986@gmail.com', 1, 0, '', 0, '', 'DSC_5997 copy.jpg', NULL, '', '', '', 0, 'prakamya1986', 1, NULL, NULL, '2011-10-24 14:00:47'),
(133, 'Maria Angeles', 'García', 2, '72135889T', '1981-04-09', 199, 'Alonso Astulez nº 10 2ºD', 'TORRELAVEGA', '39300', 199, '34626391786', 'mariangfpuerto@hotmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'marian', 1, NULL, NULL, '2011-10-24 15:06:10'),
(134, 'Tanveer', 'Batth', 1, '426691447', '1986-09-24', 226, '61 Gull View Ct', 'Oakley', '94561', 226, '19253607714', 'tsbatthucd@gmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'tsbatth', 1, NULL, NULL, '2011-10-25 03:19:56'),
(135, 'Rebeca', 'Pouso Blanco', 2, '46913177P', '1982-10-27', 199, 'Salvador Allende nº1 2ºH', 'A Coruña', '15011', 199, '675511235', 'rbk82qui@hotmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Pouso Blanco', 1, NULL, NULL, '2011-10-26 20:50:28'),
(136, 'Pankaj', 'Deo', 1, '3463074', '1978-10-06', 149, 'College of Biomedical Engineering and Ap', 'Kathmandu', '12521', 149, '97721471355', 'Pankajrock1@gmail.com', 1, 0, '', 0, '', 'Pankaj CV.pdf', NULL, '', '', '', 0, 'pankajrock', 1, NULL, NULL, '2011-11-01 02:38:40'),
(137, 'Pankaj', 'Deo', 1, '3463074', '1978-10-06', 149, 'College of Biomedical Engineering and Ap', 'Kathmandu', '12521', 149, '97721471355', 'Pankajrock1@gmail.com', 1, 0, '', 0, '', 'Pankaj CV.pdf', NULL, '', '', '', 0, 'pankajrock', 1, NULL, NULL, '2011-11-01 02:51:23'),
(138, 'sunil kumar', 'chilukuri', 1, 'g7569056', '0000-00-00', 99, '36', 'leeds', 'ls6 1nq', 225, '00447834369177', 'placebosunil@yahoo.com', 1, 0, '', 1, 'Msc at university of leeds', 'degree.pdf', NULL, '', '', '', 0, 'sanlui19', 1, NULL, NULL, '2011-11-01 12:14:35'),
(139, 'Oscar ', 'Mariño', 1, '53190742E', '1986-12-25', 199, 'Salvador Allende, 2, 2ºB', 'Vigo', '36210', 199, '635910666', 'oscarmarinocrespo@hotmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Oscar MC', 1, NULL, NULL, '2011-11-02 12:47:39'),
(140, 'Mehdi', 'Asghari', 1, '89741212122', '1982-08-24', 101, 'Jalale Ale Ahmad', 'tehran', '14115/177', 101, '00989147708079', 'm.poursheikh@yahoo.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'poursheikh', 1, NULL, NULL, '2011-11-03 13:48:51'),
(141, 'ANKUR', 'SHAH', 1, 'F8933361', '1982-11-01', 99, 'I-21/21, MAHAVIR NAGAR, KANDIVALI WEST', 'MUMBAI', '400067', 99, '+912228064129', 'dr.ankurshah82@gmail.com', 1, 0, '', 0, '', 'AnkurShahResume.docx', NULL, '', '', '', 0, 'mrxas10', 1, NULL, NULL, '2011-11-03 19:08:06'),
(142, 'Agnieszka', 'Janska', 2, 'EB 0190795', '1989-10-17', 171, 'Zebcowska 16', 'Ostrow Wielkopolski', '63400', 171, '07895094716', 'aj265@st-andrews.ac.uk', 1, 1, 'London Research Institute\r\nPaterson Institute for Cancer Research', 0, '', NULL, NULL, '', '', '', 0, 'aj265', 1, NULL, NULL, '2011-11-04 16:10:00'),
(143, 'FARZANEH', 'KHOSHNEVISZADEH', 2, '13003422', '1978-01-15', 101, 'TELEVISION GATAN 15,VÄSTRA FRÖLUNDA', 'GÖTEBORG', '421 35', 205, '0046737296748', 'farzaneh.khoshnevis@gmail.com', 1, 1, '', 1, '', NULL, NULL, '', '', '', 0, 'FARZANEH.KH', 1, NULL, NULL, '2011-11-05 19:09:46'),
(144, 'arumugam', 'balasubramanian', 1, 'j5770801', '1989-06-05', 99, 'no.25,cheran st,mayilarasu nagar,chrompe', 'chennai', '600044', 99, '+919790283161', 'arumugambiomedgene@gmail.com', 1, 0, '', 0, '', 'ARUMUGAM CV.docx', NULL, '', '', '', 0, 'arugene', 1, NULL, NULL, '2011-11-06 08:07:17'),
(145, 'Ridhima', 'Lal', 2, 'F9155014', '1986-01-12', 99, '145, 4th Main, 3rd Block,3rd Stage, ', 'Bangalore', '560079', 99, '0091-9845785821', 'ridhima.lal@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'ridhima', 1, NULL, NULL, '2011-11-11 09:31:16'),
(146, 'Ingrid Isabel', 'Valencia Lozano', 2, '1032407488', '1988-03-16', 199, 'Carrer de Sants, 407', 'Barcelona', '08028', 199, '57673818721', 'ivalenlo7@alumnes.ub.edu', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'ingridvalo', 1, NULL, NULL, '2011-11-17 17:10:46'),
(147, 'LAURA', 'MARIÑO', 2, '76044225S', '1987-04-06', 199, 'VALENCIA, 2', 'BARCELONA', '08015', 199, '605556010', 'laurishinan14@hotmail.com', 2, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'LAURA', 1, NULL, NULL, '2011-11-18 17:50:57'),
(148, 'Joan', 'Gibert Fernández', 1, '53635543', '1988-04-01', 199, 'Av/ Catalunya 2 ', 'Sant Adrià de Besòs', '08930', 199, '+34 607324200', 'joangibert14@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Gibert Fernández', 1, NULL, NULL, '2011-11-21 11:54:31'),
(149, 'Sonia', 'Ciudad Fernández', 2, '47847134-G', '1986-03-06', 199, 'C/ Santiago Rusiñol nº16', 'Barcelona', '08540', 199, '659793168', 'sonia_cf86@hotmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'Sonia', 1, NULL, NULL, '2011-12-01 09:13:58'),
(150, 'Sin Man June', 'Au', 2, 'K00161998', '1988-06-03', 96, 'Room 3917, Ming Yu House', 'Kin Ming Estate, TKO, Hong Kong', '852', 96, '(852) 9513-1425', 'ausinman@yahoo.com.hk', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'ausinman', 1, NULL, NULL, '2011-12-03 05:37:09'),
(151, 'LEIRE', 'CASAS', 2, '44645040Q', '1988-05-15', 199, 'Paula de Aguirre y Gamara nº1', 'Estella-Lizarra', '31200', 199, '646261405', 'leirecas@estumail.ucm.es', 1, 1, 'Other ''la caixa'' fellowhips', 0, '', 'english_curriculum_vitae.pdf', NULL, '', '', '', 0, 'LEIRECAS', 1, NULL, NULL, '2011-12-11 17:54:57'),
(152, 'Mehrzad', 'Maarefi', 1, '16775977', '0000-00-00', 101, '-West Ferdous Blvd.Sattary Highway', 'Tehran', '1384976981', 101, '00989122187261', 'mehrzad_maarefi@yahoo.com', 1, 0, '', 1, '', 'resume_Maarefi1.doc', NULL, '', '', '', 0, 'm.maarefi', 1, NULL, NULL, '2011-12-07 19:11:04'),
(153, 'Ankit', 'Jain', 1, 'J0319517', '1987-06-11', 99, '101, Yamuna Building, R. L. Park', 'Sillod', '431112', 99, '+91 8686853939', 'jainankit1106@gmail.com', 2, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'jainankit', 1, NULL, NULL, '2011-12-09 05:38:23'),
(154, 'Mahesh', 'Sherkar', 1, 'G0356232', '1976-06-03', 99, 'Nagar-Manmad Highway,A/P-Kolhar (Bk.),', 'Tal-Rahata,Dist-Ahmednagar,Maharashtra', '413710', 99, '+91-9960009381', 'maheshrsherkar@gmail.com', 1, 0, '', 1, 'Worked in Maxkos pharmaceuticals', NULL, NULL, '', '', '', 0, 'maheshrsherkar', 1, NULL, NULL, '2011-12-13 03:45:50'),
(155, 'Susana', 'Hernández Duran', 2, 'BF506524', '1988-03-24', 199, 'C/ Agustina Saragossa 15-21 3ºA', 'Barcelona', '08017', 199, '699561150', 'susanahernandezduran@gmail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'soozy24', 1, NULL, NULL, '2011-12-14 15:53:12'),
(156, 'Erkan', 'Yuca', 1, '529912', '1983-06-28', 218, '7901 Cambridge st Unit 108', 'Houston - TEXAS', '77054', 226, '17137052147', 'erkanyuca@hotmail.com', 3, 0, '', 0, '', NULL, NULL, '', '', '', 0, 'erkanyuca', 1, NULL, NULL, '2011-12-15 01:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applications`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phd_applications`
--

INSERT INTO `jos_phd_applications` (`id`, `description`) VALUES
(1, 'phd'),
(2, 'postdoc');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_countries`
--

CREATE TABLE IF NOT EXISTS `jos_phd_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `printable_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `jos_phd_countries`
--

INSERT INTO `jos_phd_countries` (`id`, `iso`, `name`, `printable_name`, `iso3`, `numcode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152),
(44, 'CN', 'CHINA', 'China', 'CHN', 156),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352),
(99, 'IN', 'INDIA', 'India', 'IND', 356),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
(168, 'PE', 'PERU', 'Peru', 'PER', 604),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_degrees`
--

CREATE TABLE IF NOT EXISTS `jos_phd_degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `degree` text NOT NULL,
  `university` text NOT NULL,
  `institution` text NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `country_id` smallint(11) DEFAULT NULL,
  `director_name` varchar(50) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=333 ;

--
-- Dumping data for table `jos_phd_degrees`
--

INSERT INTO `jos_phd_degrees` (`id`, `applicant_id`, `type`, `degree`, `university`, `institution`, `start_date`, `end_date`, `country_id`, `director_name`, `modified`) VALUES
(2, 1, 'academic', 'Demo', 'Demo', '', NULL, NULL, NULL, NULL, '2011-04-21 13:49:18'),
(29, 19, 'academic', 'Biology degree', 'University of Granada', '', NULL, NULL, NULL, NULL, '2011-05-11 10:59:57'),
(5, 3, 'academic', 'Master in molecular biology', 'CINVESTAV, MEXICO', '', NULL, NULL, NULL, NULL, '2011-04-28 19:38:08'),
(8, 4, 'academic', 'Master of Philosophy in Pharmaceutics', 'University of Khartoum', '', NULL, NULL, NULL, NULL, '2011-04-30 05:40:17'),
(7, 3, 'academic', 'Biotechnology engineer', 'UPIBI del Instituto Politecnico Nacionl IPN', '', NULL, NULL, NULL, NULL, '2011-04-28 19:52:22'),
(9, 5, 'academic', 'Quimica', 'Universidad de Antioquia', '', NULL, NULL, NULL, NULL, '2011-05-01 16:34:33'),
(10, 5, 'academic', 'Masgister en Quimica', 'Universidad de Antioquia', '', NULL, NULL, NULL, NULL, '2011-05-01 16:34:56'),
(11, 1, 'academic', 'Demo2', 'Demo2', '', NULL, NULL, NULL, NULL, '2011-05-09 06:32:07'),
(12, 7, 'academic', 'Lic. Bioquimica', 'Universidad de Granada', '', NULL, NULL, NULL, NULL, '2011-05-09 07:30:35'),
(13, 7, 'academic', 'Master Biomedicina Regenerativa', 'Universidad de Granada', '', NULL, NULL, NULL, NULL, '2011-05-09 07:33:00'),
(14, 8, 'academic', 'BSc Chemistry', 'Newcastle University', '', NULL, NULL, NULL, NULL, '2011-05-09 12:33:18'),
(15, 8, 'academic', 'MRes', 'Imperial College London', '', NULL, NULL, NULL, NULL, '2011-05-09 12:33:25'),
(31, 20, 'academic', 'Pharmaceutical Biotechnologies', 'University of Naples "Federico II"', '', NULL, NULL, NULL, NULL, '2011-05-11 11:28:14'),
(30, 20, 'academic', 'Biotechnologies for Healthcare', 'University of Naples "Federico II"', '', NULL, NULL, NULL, NULL, '2011-05-11 11:27:25'),
(20, 12, 'academic', 'Chemistry', 'Universidad del Valle', '', NULL, NULL, NULL, NULL, '2011-05-09 17:08:50'),
(21, 10, 'academic', 'Chemistry', 'Universidad del Valle', '', NULL, NULL, NULL, NULL, '2011-05-09 17:22:14'),
(22, 14, 'academic', 'MSc in Clinical Microbiology', 'University of Nottingham', '', NULL, NULL, NULL, NULL, '2011-05-09 19:36:39'),
(23, 14, 'academic', 'MBBS', 'Rajshahi University', '', NULL, NULL, NULL, NULL, '2011-05-09 19:37:07'),
(24, 15, 'academic', 'Licenciado en Física', 'UNiversidad de Zaragoza', '', NULL, NULL, NULL, NULL, '2011-05-09 20:38:49'),
(25, 17, 'academic', 'BIOTECNOLOGIA', 'UNIVERSITAT DE VIC', '', NULL, NULL, NULL, NULL, '2011-05-10 16:37:16'),
(26, 17, 'academic', 'MASTER BIOMEDICINA I BIOLOGIA MOLECULAR', 'UAB', '', NULL, NULL, NULL, NULL, '2011-05-10 16:46:20'),
(27, 18, 'academic', 'Medical Doctor (MD)', 'SS. CYRIL AND METHODIUS UNIVERSITY IN SKOPJE -Medical Faculty', '', NULL, NULL, NULL, NULL, '2011-05-10 16:52:35'),
(36, 23, 'academic', 'Msc.Biomedical sciences', 'University of Wales Institute, cardiff', '', NULL, NULL, NULL, NULL, '2011-05-11 23:01:10'),
(32, 21, 'academic', 'Masters', 'All India Institute of Medical Sciences', '', NULL, NULL, NULL, NULL, '2011-05-11 12:34:13'),
(33, 21, 'academic', 'Bachelors', 'Delhi University', '', NULL, NULL, NULL, NULL, '2011-05-11 12:34:36'),
(34, 22, 'academic', 'Master', 'Yerevan State University', '', NULL, NULL, NULL, NULL, '2011-05-11 13:40:28'),
(37, 23, 'academic', 'Bsc.Biotechnology', 'VIT university', '', NULL, NULL, NULL, NULL, '2011-05-11 23:01:22'),
(38, 24, 'academic', 'MPH (Masters in Public Health)', 'North South University', '', NULL, NULL, NULL, NULL, '2011-05-12 07:05:45'),
(40, 24, 'academic', 'MBBS (Bachelor of Medicine & Surgery)', 'University of Rajshahi', '', NULL, NULL, NULL, NULL, '2011-05-12 07:08:42'),
(41, 26, 'academic', 'MSc of Physics', 'Shevchenko National University of Ukraine', '', NULL, NULL, NULL, NULL, '2011-05-12 11:31:20'),
(42, 26, 'academic', 'BSc of Physics', 'Dnepropetrovsk National University, Ukraine', '', NULL, NULL, NULL, NULL, '2011-05-12 11:32:19'),
(43, 27, 'academic', 'MSc Molecular Cell Biology', 'Nottingham Trent University', '', NULL, NULL, NULL, NULL, '2011-05-12 11:46:40'),
(44, 28, 'academic', 'LDO en Biotecnología', 'Universidad de León', '', NULL, NULL, NULL, NULL, '2011-05-12 12:00:09'),
(45, 27, 'academic', 'BSc Biotechnology', 'University of Madras', '', NULL, NULL, NULL, NULL, '2011-05-12 12:03:38'),
(46, 29, 'academic', 'Masters (Cancer Biology)', 'Kingston University London (UK)', '', NULL, NULL, NULL, NULL, '2011-05-12 13:03:16'),
(47, 29, 'academic', 'Applied Chemistry/Biotechnology Diploma', 'Faculty of Science and Technology, New University of Lisbon (Portugal)', '', NULL, NULL, NULL, NULL, '2011-05-12 13:04:22'),
(51, 30, 'academic', 'Chemistry (Specialization in Organic Chemistry)', 'Institut Químic de Sarrià (IQS), Universitat Ramón Llull, Barcelona (Spain)', '', NULL, NULL, NULL, NULL, '2011-05-12 14:36:36'),
(103, 13, 'academic', 'Master degree in Experimental and Applied Biology', 'University of Pavia, Italy', '', NULL, NULL, NULL, NULL, '2011-05-19 17:38:01'),
(102, 13, 'academic', 'First Level degree in Biology Science', 'University of Pavia, Italy', '', NULL, NULL, NULL, NULL, '2011-05-19 17:37:43'),
(52, 32, 'academic', 'Ingeniero Superior en Telecomunicaciones', 'Universidad Politécnica de Madrid', '', NULL, NULL, NULL, NULL, '2011-05-12 19:21:02'),
(53, 32, 'academic', 'Diploma de -Estudios Avanzados', 'Universidad Autónoma de Madrid', '', NULL, NULL, NULL, NULL, '2011-05-12 19:21:27'),
(54, 32, 'academic', 'Diplome de Specialisation en Radiocommunication', 'SUPELEC', '', NULL, NULL, NULL, NULL, '2011-05-12 19:21:57'),
(56, 33, 'academic', 'BSc in Biotechnology', 'Universitat de Vic', '', NULL, NULL, NULL, NULL, '2011-05-14 09:33:06'),
(57, 33, 'academic', 'MSc Biomedical Sciences Research', 'University of Bristol', '', NULL, NULL, NULL, NULL, '2011-05-14 09:34:22'),
(58, 33, 'academic', 'Master experimental en química biològica, ambiental i tecnologies relacionades', 'Consejo Superior de Investigaciones cinetíficas', '', NULL, NULL, NULL, NULL, '2011-05-14 09:46:03'),
(60, 34, 'academic', 'M.Sc (Integrated )Chemistry', 'Annamalai University,Chidambaram,India', '', NULL, NULL, NULL, NULL, '2011-05-14 14:15:10'),
(61, 34, 'academic', 'M.Phil(Organic Chemistry)', 'Annamalai University,Chidambaram,India', '', NULL, NULL, NULL, NULL, '2011-05-14 14:15:37'),
(63, 35, 'academic', 'BSc in Biotechnology', 'Mahidol University, Thailand', '', NULL, NULL, NULL, NULL, '2011-05-14 16:45:47'),
(64, 35, 'academic', 'MSc in Microbiology (International programme)', 'Mahidol University, Thailand', '', NULL, NULL, NULL, NULL, '2011-05-14 16:46:17'),
(66, 35, 'academic', 'MSc in Molecular Medical Microbiology (will graduate in Aug 2011)', 'The University of Nottingham, the United Kingdom', '', NULL, NULL, NULL, NULL, '2011-05-14 17:38:12'),
(67, 36, 'academic', 'Masters degree by research in clinical laboratory science', 'Huazhong university of science and technology,Union Hopital,Tongji medical college', '', NULL, NULL, NULL, NULL, '2011-05-15 03:48:44'),
(68, 37, 'academic', 'MASTER OF SCIENCE', 'UNIVERSITY OF PUNE,INDIA', '', NULL, NULL, NULL, NULL, '2011-05-15 08:18:25'),
(69, 37, 'academic', 'Bacholar of Science', 'UNIVERSITY OF PUNE,INDIA', '', NULL, NULL, NULL, NULL, '2011-05-15 08:28:01'),
(70, 39, 'academic', 'BIOLOGY', 'UNIVERSITAT DE VALÈNCIA', '', NULL, NULL, NULL, NULL, '2011-05-15 19:20:22'),
(71, 39, 'academic', 'MASTER BIOMECICAL BIOTECHNOLOGY', 'UNIVERSITAT POLITÈCNICA DE VALÈNCIA', '', NULL, NULL, NULL, NULL, '2011-05-15 19:25:32'),
(72, 40, 'academic', 'Master in chemistry', 'Instituto superior técnico', '', NULL, NULL, NULL, NULL, '2011-05-16 12:55:09'),
(73, 40, 'academic', 'Bachelor`s in chemistry', 'Instituto superior técnico', '', NULL, NULL, NULL, NULL, '2011-05-16 12:55:35'),
(74, 41, 'academic', 'Degree in Biology (Licenciada)', 'University of Santiago de Compostela', '', NULL, NULL, NULL, NULL, '2011-05-16 15:18:44'),
(75, 42, 'academic', 'Biology (Clinical Modality)', 'Universitat de Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-16 17:50:37'),
(76, 42, 'academic', 'Biochemistry', 'Universitat de Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-16 17:50:46'),
(77, 42, 'academic', 'Official Master in Molecular Biotechnology', 'Universitat de Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-16 17:51:03'),
(78, 43, 'academic', 'Licenciado Veterinario Zootecnista', 'Universidad Peruana Cayetano Heredia', '', NULL, NULL, NULL, NULL, '2011-05-16 19:09:03'),
(79, 43, 'academic', 'Master en Investigación Veterinaria', 'Universidad Autónoma de Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-16 19:09:39'),
(80, 44, 'academic', 'Licentiate Degree in Biology', 'Universidad Nacional de Mar del Plata', '', NULL, NULL, NULL, NULL, '2011-05-16 23:26:10'),
(81, 44, 'academic', 'Licentiate Degree in Biology', 'Universidad Nacional de Mar del Plata', '', NULL, NULL, NULL, NULL, '2011-05-16 23:31:08'),
(83, 36, 'academic', 'Bachelor in Medical Laboratory Technology', 'Institute of Medicine,Tribhuvan University', '', NULL, NULL, NULL, NULL, '2011-05-16 23:49:36'),
(84, 45, 'academic', 'Bachelors in Biochemistry', 'Gujarat University, India', '', NULL, NULL, NULL, NULL, '2011-05-17 10:24:28'),
(85, 45, 'academic', 'Masters in Pharmacology and Biotechnology', 'Sheffield Hallam University, United Kingdom', '', NULL, NULL, NULL, NULL, '2011-05-17 10:24:59'),
(86, 46, 'academic', 'Bachelor of Medicine/Surgery (5 years)', 'Hamdard University Karachi, (Pakistan)', '', NULL, NULL, NULL, NULL, '2011-05-17 20:09:15'),
(87, 46, 'academic', 'Certificate in Family Medicine (Neurology)', 'Aga Khan University Karachi', '', NULL, NULL, NULL, NULL, '2011-05-17 20:09:43'),
(90, 47, 'academic', 'Bachelor''s Degree in Molecular and Cellular Biology', 'University of Study of Rome ''Tor Vergata''', '', NULL, NULL, NULL, NULL, '2011-05-18 09:37:54'),
(91, 47, 'academic', 'Master''s Degree in Bioinformatics', 'University of Study of Rome ''Tor Vergata''', '', NULL, NULL, NULL, NULL, '2011-05-18 09:38:03'),
(92, 48, 'academic', 'Mastery Degree in Biotechnology.', 'Faculty Science & Technology of University Abdel Malek Essaâdi Tángier (FSTT), Morocco', '', NULL, NULL, NULL, NULL, '2011-05-18 10:33:19'),
(93, 48, 'academic', 'Master Degree in Advance Biotechnology', 'Faculty Biosciences of University Autónoma de Barcelona (UAB).Spain', '', NULL, NULL, NULL, NULL, '2011-05-18 10:34:45'),
(94, 49, 'academic', 'Biochemistry', 'University of Zaragoza', '', NULL, NULL, NULL, NULL, '2011-05-18 10:44:06'),
(95, 50, 'academic', 'Master degree in Chemistry and Pharmaceutical Technology', 'University of Bologna, Alma Mater Studiorum', '', NULL, NULL, NULL, NULL, '2011-05-18 13:22:02'),
(96, 51, 'academic', 'Bachelor Degree in Biotechnology', 'Bologna', '', NULL, NULL, NULL, NULL, '2011-05-18 22:27:08'),
(97, 51, 'academic', 'Master Degree in Molecular and Industrial Biotechnology', 'Bologna', '', NULL, NULL, NULL, NULL, '2011-05-18 22:28:00'),
(98, 52, 'academic', 'Biology', 'Pontificia Universidad Javeriana ', '', NULL, NULL, NULL, NULL, '2011-05-19 12:39:00'),
(100, 53, 'academic', 'Bachelor Degree in Biotechnologies', 'University of Bologna', '', NULL, NULL, NULL, NULL, '2011-05-19 17:33:32'),
(101, 53, 'academic', 'Master Degree in Molecular and Industrial Biotechnologies', 'University of Bologna', '', NULL, NULL, NULL, NULL, '2011-05-19 17:34:07'),
(104, 54, 'academic', 'Licenciatura en Bioquímica ', 'Universidad de Murcia', '', NULL, NULL, NULL, NULL, '2011-05-20 11:00:20'),
(109, 56, 'academic', 'Master 1, Molecular and Cellular Biology (2010)', 'University of Pierre et Marie Curie (UPMC), Paris 6, France', '', NULL, NULL, NULL, NULL, '2011-05-20 12:09:44'),
(108, 56, 'academic', 'Master 2, Molecular and Cellular Biology, Stem Cell Speciality (2011)', 'University of Pierre et Marie Curie (UPMC), Paris 6, France', '', NULL, NULL, NULL, NULL, '2011-05-20 12:09:28'),
(110, 57, 'academic', 'HUMAN BIOLOGY', 'UPF', '', NULL, NULL, NULL, NULL, '2011-05-20 14:10:04'),
(111, 58, 'academic', 'MASTER OF SCIENCE', 'BANARAS HINDU UNIVERSITY, INDIA', '', NULL, NULL, NULL, NULL, '2011-05-21 14:17:04'),
(112, 59, 'academic', 'MS.c Biotechnology ', 'Jawaharlal Nehru Technological University of Hyderabad ', '', NULL, NULL, NULL, NULL, '2011-05-22 09:45:50'),
(113, 59, 'academic', 'BS.c Agriculture (Agronomy and Plant Breeding)', 'Islamic Azad University of Takestan', '', NULL, NULL, NULL, NULL, '2011-05-22 10:50:49'),
(114, 60, 'academic', 'MS degree in Molecular and Industrial Biotechnology', 'University of Bologna, Italy', '', NULL, NULL, NULL, NULL, '2011-05-22 16:09:08'),
(115, 60, 'academic', 'Bachelor degree in Biotechnology ', 'University of Parma, Italy', '', NULL, NULL, NULL, NULL, '2011-05-22 16:09:55'),
(231, 114, 'academic', 'Biotechnology', 'University of León', '', NULL, NULL, NULL, NULL, '2011-06-01 01:19:16'),
(228, 61, 'academic', 'Bachelor of Technology in Biotechnology', 'Vellore Institute of Technology (VIT) University, India', '', NULL, NULL, NULL, NULL, '2011-06-01 00:34:52'),
(252, 6, 'academic', 'Master degree in the field of Biology with Cell Biology specialisation', 'Jagiellonian University; Krakow, Poland', '', NULL, NULL, NULL, NULL, '2011-06-01 21:00:56'),
(120, 62, 'academic', 'MSc Forensic Science', 'Universiteit van Amsterdam ', '', NULL, NULL, NULL, NULL, '2011-05-23 13:21:36'),
(121, 62, 'academic', 'BSc Biology with Spanish', 'University of Sussex', '', NULL, NULL, NULL, NULL, '2011-05-23 13:21:57'),
(122, 63, 'academic', 'Bachelor´s degree in Biochemistry', 'University of the Basque country', '', NULL, NULL, NULL, NULL, '2011-05-23 15:03:07'),
(123, 64, 'academic', 'Biotechnology ', 'University of Vic', '', NULL, NULL, NULL, NULL, '2011-05-23 22:26:30'),
(124, 65, 'academic', 'Degree in Biology', 'Central University of Venezuela', '', NULL, NULL, NULL, NULL, '2011-05-24 00:31:23'),
(125, 66, 'academic', 'Bachelor''s Degree in Biotechnology', 'National University of General San Martin - Biotechnological Research Institute (UNSAM-IIB) ', '', NULL, NULL, NULL, NULL, '2011-05-24 02:51:52'),
(126, 66, 'academic', 'Degree in Exact and Natural Sciences ', 'National University of General San Martin - Biotechnological Research Institute (UNSAM-IIB) ', '', NULL, NULL, NULL, NULL, '2011-05-24 02:53:28'),
(127, 25, 'academic', 'Master of Molecular Biotechnology', 'Barcelona University', '', NULL, NULL, NULL, NULL, '2011-05-24 09:05:08'),
(128, 25, 'academic', 'Master of Marine Biology', 'Guilan University', '', NULL, NULL, NULL, NULL, '2011-05-24 09:05:39'),
(129, 25, 'academic', 'Bachelor of Marine Biology', 'Shahid Beheshti University', '', NULL, NULL, NULL, NULL, '2011-05-24 09:06:05'),
(135, 67, 'academic', 'Biochemestry', 'University of Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-24 11:37:40'),
(136, 68, 'academic', 'Master', 'University of Minho - Portugal', '', NULL, NULL, NULL, NULL, '2011-05-24 14:55:45'),
(137, 68, 'academic', 'Graduation', 'University of Minho - Portugal', '', NULL, NULL, NULL, NULL, '2011-05-24 14:56:15'),
(138, 69, 'academic', 'Bachelor of Science', 'Univesity of Warmia and Mazury in Olsztyn, Poland', '', NULL, NULL, NULL, NULL, '2011-05-24 19:20:24'),
(141, 70, 'academic', 'M.S. (PHARM.) MEDICINAL CHEMISTRY', 'NATIONAL INSTITUTE OF PHARMACEUTICAL EDUCATION AND RESEARCH (NIPER), SAS NAGAR', '', NULL, NULL, NULL, NULL, '2011-05-24 19:33:46'),
(142, 70, 'academic', 'BACHELORS OF PHARMACY', 'MAHARISHI DAYANAND UNIVERSITY', '', NULL, NULL, NULL, NULL, '2011-05-24 19:34:08'),
(143, 70, 'academic', 'DIPLOMA IN PHARMACY', 'DELHI INSTITUTE OF PHARMACEUTICAL EDUCATION AND RESEARCH (DELHI UNIVERSITY)', '', NULL, NULL, NULL, NULL, '2011-05-24 19:35:22'),
(144, 71, 'academic', 'Master 2 Research Physics in Materials and Nanostructures', 'University Blaise Pascal,Clermont-Ferrand,France.', '', NULL, NULL, NULL, NULL, '2011-05-24 22:44:20'),
(145, 71, 'academic', 'Master 1 of Physics (hons)', 'Guru Nanak Dev University,Amritsar,India', '', NULL, NULL, NULL, NULL, '2011-05-24 22:45:40'),
(146, 71, 'academic', 'Bachelor of Science', 'Guru Nanak Dev University,Amritsar,India', '', NULL, NULL, NULL, NULL, '2011-05-24 22:46:11'),
(147, 0, 'academic', 'Master of Science in Molecular biology', '¸Faculty of Science, University of Zagreb', '', NULL, NULL, NULL, NULL, '2011-05-25 06:34:41'),
(148, 72, 'academic', 'Master of Science', 'University of Pune', '', NULL, NULL, NULL, NULL, '2011-05-25 06:36:51'),
(150, 72, 'academic', 'Bachelor of Science', 'Andhra University', '', NULL, NULL, NULL, NULL, '2011-05-25 06:41:31'),
(151, 73, 'academic', 'Master Of Drug Chemistry', 'University Of Pune', '', NULL, NULL, NULL, NULL, '2011-05-25 17:39:13'),
(152, 73, 'academic', 'Bachelor of Science', 'UniverSity Of Pune', '', NULL, NULL, NULL, NULL, '2011-05-25 17:40:03'),
(153, 73, 'academic', 'Higher Secoundary Education', 'University of Pune', '', NULL, NULL, NULL, NULL, '2011-05-25 17:41:06'),
(154, 74, 'academic', 'Bachelor of Biotechnology', 'University of León', '', NULL, NULL, NULL, NULL, '2011-05-25 18:14:55'),
(156, 75, 'academic', 'Degree in Chemistry', 'University of Barcelona (UB)', '', NULL, NULL, NULL, NULL, '2011-05-26 07:50:55'),
(157, 76, 'academic', 'Chemistry', 'Universitat de Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-26 14:20:59'),
(158, 77, 'academic', 'M.Sc.', 'Superior Normal School of Bucharest', '', NULL, NULL, NULL, NULL, '2011-05-26 16:36:22'),
(159, 77, 'academic', 'BSc', 'University of Bucharest, Faculty of Chemistry, Biotehnology section', '', NULL, NULL, NULL, NULL, '2011-05-26 16:37:40'),
(160, 52, 'academic', 'Master Molecular Biotechnology', 'Barcelona University', '', NULL, NULL, NULL, NULL, '2011-05-26 18:54:40'),
(162, 78, 'academic', 'M.Sc in Molecular Medicine and Biotechnology', 'University of Eastern Finland, Kuopio Finland', '', NULL, NULL, NULL, NULL, '2011-05-27 11:57:16'),
(163, 78, 'academic', 'B.Sc(Hons) Biological Sciences', 'Forman Christian College University', '', NULL, NULL, NULL, NULL, '2011-05-27 11:58:02'),
(166, 79, 'academic', 'Bachelor of Science in Life Science', 'University of Konstanz', '', NULL, NULL, NULL, NULL, '2011-05-27 14:32:12'),
(165, 79, 'academic', 'Master of Science by Research in Biomedical Sciences', 'University of Edinburgh', '', NULL, NULL, NULL, NULL, '2011-05-27 14:31:44'),
(167, 81, 'academic', 'Master''s degree Course in Pharmaceutical Chemistry and technology(5 years), Faculty of Pharmacy', 'Messina', '', NULL, NULL, NULL, NULL, '2011-05-27 15:40:27'),
(168, 82, 'academic', 'Biology', 'University of Barcelona (UB)', '', NULL, NULL, NULL, NULL, '2011-05-27 16:51:10'),
(169, 71, 'academic', 'Master 2 Research Physics in Materials and Nanostructures', 'University Blaise Pascal,Clermont-Ferrand,France.', '', NULL, NULL, NULL, NULL, '2011-05-28 06:22:35'),
(170, 83, 'academic', 'MSc Human Molecular Genetics', 'Imperial College London', '', NULL, NULL, NULL, NULL, '2011-05-28 14:29:47'),
(171, 83, 'academic', 'BSc Biological Sciences', 'University of Leicester', '', NULL, NULL, NULL, NULL, '2011-05-28 14:30:16'),
(172, 84, 'academic', 'Licenciada en Genética', 'Universidad Nacional de Misiones', '', NULL, NULL, NULL, NULL, '2011-05-28 15:59:38'),
(174, 85, 'academic', 'Molecular Biology Genetics and Biotechnology - Master''s degree', 'Istanbul Technical University', '', NULL, NULL, NULL, NULL, '2011-05-28 16:58:45'),
(175, 85, 'academic', 'Molecular Biology and Genetics - Bachelor''s degree', 'Halic University', '', NULL, NULL, NULL, NULL, '2011-05-28 17:04:22'),
(176, 86, 'academic', 'M.Phil (Master of Philosophy)', 'University of Delhi', '', NULL, NULL, NULL, NULL, '2011-05-28 18:36:07'),
(177, 86, 'academic', 'M.Sc (Master of Science)', 'Jiwaji University', '', NULL, NULL, NULL, NULL, '2011-05-28 18:37:01'),
(179, 87, 'academic', 'M.Sc Biotechnology', 'Jaipur National University, Jaipur, India ', '', NULL, NULL, NULL, NULL, '2011-05-29 16:32:37'),
(180, 87, 'academic', 'B.Sc Biotechnology', 'Mohanlal Sukhadia University, Udaipur, India', '', NULL, NULL, NULL, NULL, '2011-05-29 16:33:16'),
(181, 88, 'academic', 'Biotechnology Engineering', 'Unidad Profesional Interdisciplinaria de Biotecnologia - IPN', '', NULL, NULL, NULL, NULL, '2011-05-29 18:50:36'),
(182, 89, 'academic', 'M.S', 'Indian Institute of Science Education and Research-Kolkata', '', NULL, NULL, NULL, NULL, '2011-05-29 19:19:16'),
(183, 80, 'academic', 'Master’s degree Course in Pharmaceutical Chemistry and technology (5 years)', 'Messina, faculty of pharmacy', '', NULL, NULL, NULL, NULL, '2011-05-29 19:52:52'),
(184, 90, 'academic', 'Msc', 'University of Mumbai', '', NULL, NULL, NULL, NULL, '2011-05-30 07:39:53'),
(185, 90, 'academic', 'Bsc', 'University of Mumbai', '', NULL, NULL, NULL, NULL, '2011-05-30 07:40:32'),
(187, 91, 'academic', 'B.Sc. Biology', 'University Erlangen-Nürnberg', '', NULL, NULL, NULL, NULL, '2011-05-30 10:29:08'),
(188, 91, 'academic', 'M.Sc. Cellular and Molecular Biology (not yet finished)', 'University Erlangen-Nürnberg', '', NULL, NULL, NULL, NULL, '2011-05-30 10:29:30'),
(189, 93, 'academic', 'Licenciada en Bioquímica', 'Zaragoza', '', NULL, NULL, NULL, NULL, '2011-05-30 11:57:25'),
(190, 93, 'academic', 'Diploma de Estudios Avanzados en Química Orgánica', 'Zaragoza', '', NULL, NULL, NULL, NULL, '2011-05-30 11:57:58'),
(191, 94, 'academic', 'Veterinary Medicine', 'Cardenal Herrera CEU', '', NULL, NULL, NULL, NULL, '2011-05-30 13:21:48'),
(192, 95, 'academic', 'Veterinary Medicine', 'Cardenal Herrera CEU', '', NULL, NULL, NULL, NULL, '2011-05-30 13:32:57'),
(241, 96, 'academic', 'Masters Degree in Biomedical Research', 'Faculty of Medicine, University of Coimbra', '', NULL, NULL, NULL, NULL, '2011-06-01 10:57:05'),
(194, 97, 'academic', 'Human Biology ', 'Pompeu Fabra University ', '', NULL, NULL, NULL, NULL, '2011-05-30 20:21:32'),
(195, 98, 'academic', 'Licenciado en Biología', 'Universidad de Carabobo', '', NULL, NULL, NULL, NULL, '2011-05-30 22:43:28'),
(196, 99, 'academic', 'M.S. (Pharm.) Pharmacoinformatics', 'National Institute of Pharmaceutical Education and Research', '', NULL, NULL, NULL, NULL, '2011-05-31 06:14:53'),
(197, 99, 'academic', 'Bachelor of Pharmacy', 'College of Pharamacy (Nashik), (University of Pune)', '', NULL, NULL, NULL, NULL, '2011-05-31 06:16:04'),
(202, 96, 'academic', 'Licenciatura Degree in Clinical Analysis and Public Health', 'Escola Superior de Tecnologias da Saúde de Coimbra', '', NULL, NULL, NULL, NULL, '2011-05-31 09:38:44'),
(201, 101, 'academic', 'Bachelor Degree in Medical Biotechnologies', 'Università degli Studi di Milano, Italy', '', NULL, NULL, NULL, NULL, '2011-05-31 09:02:35'),
(200, 101, 'academic', 'Master Degree in Medical Biotechnology and Molecular Medicine, curriculum Internal Medicine', 'Università degli Studi di Milano, Italy', '', NULL, NULL, NULL, NULL, '2011-05-31 09:01:25'),
(203, 102, 'academic', 'Bachelor of Advanced Science (Honours)', 'University of New South Wales', '', NULL, NULL, NULL, NULL, '2011-05-31 11:14:28'),
(204, 103, 'academic', 'Second level degree in Cellular and Molecular Biology', 'University of Rome "Tor Vergata"', '', NULL, NULL, NULL, NULL, '2011-05-31 14:01:29'),
(205, 103, 'academic', 'First level degree in Biotechnologies', 'University of Rome "Tor Vergata"', '', NULL, NULL, NULL, NULL, '2011-05-31 14:02:41'),
(207, 104, 'academic', 'Graduation gegree in Biology', 'University of Aveiro, Portugal', '', NULL, NULL, NULL, NULL, '2011-05-31 15:19:48'),
(208, 104, 'academic', 'Master degree in Forensic Genetics', 'University of Porto, Portugal', '', NULL, NULL, NULL, NULL, '2011-05-31 15:19:56'),
(209, 105, 'academic', 'Medical Doctor', 'Universidad Centroccidental Lisandro Alvarado', '', NULL, NULL, NULL, NULL, '2011-05-31 15:50:37'),
(210, 106, 'academic', 'M.Sc.', 'University of Hyderabad', '', NULL, NULL, NULL, NULL, '2011-05-31 15:53:56'),
(211, 106, 'academic', 'B.Sc', 'University of Delhi', '', NULL, NULL, NULL, NULL, '2011-05-31 15:54:14'),
(212, 107, 'academic', 'Biochemistry', 'University of Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-31 17:44:15'),
(213, 107, 'academic', 'Chemistry', 'University of Barcelona', '', NULL, NULL, NULL, NULL, '2011-05-31 17:44:31'),
(214, 108, 'academic', 'Master Degree in Biochemistry', 'Francisco de Vitoria', '', NULL, NULL, NULL, NULL, '2011-05-31 19:13:09'),
(215, 108, 'academic', 'Specilization degree in Biotechnology', 'Francisco de Vitoria', '', NULL, NULL, NULL, NULL, '2011-05-31 19:13:54'),
(216, 108, 'academic', 'bachelor in Chemistry', 'Universidad del Valle', '', NULL, NULL, NULL, NULL, '2011-05-31 19:14:24'),
(218, 109, 'academic', 'M.Sc IN REGENERATIVE MEDICINE', 'MANIPAL UNIVERSITY', '', NULL, NULL, NULL, NULL, '2011-05-31 20:21:05'),
(219, 109, 'academic', 'B.Sc(hons) IN BIOTECHNOLOGY', 'UNIVERSITY OF KALYANI', '', NULL, NULL, NULL, NULL, '2011-05-31 20:22:42'),
(222, 110, 'academic', 'Master of Science in Drug Innovation', 'Utrecht University, the Netherlands', '', NULL, NULL, NULL, NULL, '2011-05-31 20:56:02'),
(223, 110, 'academic', 'Bachelor of Science in Chemistry', 'Utrecht University, the Netherlands', '', NULL, NULL, NULL, NULL, '2011-05-31 20:56:25'),
(224, 61, 'academic', 'Master of Science in Molecular Bioengineering', 'Technische Universität Dresden (TUD), Germany', '', NULL, NULL, NULL, NULL, '2011-05-31 23:40:04'),
(238, 31, 'academic', 'Master'' s degree in Pharmaceutical Biotechnology 2007-2010', 'Alma Mater Studiorum, University of Bologna, Italy', '', NULL, NULL, NULL, NULL, '2011-06-01 09:06:53'),
(237, 31, 'academic', 'Bachelor'' s degree in Biotechnology 2004-2007', 'Alma Mater Studiorum, University of Bologna, Italy', '', NULL, NULL, NULL, NULL, '2011-06-01 09:06:14'),
(229, 113, 'academic', 'Master of Science', 'Gauhati University', '', NULL, NULL, NULL, NULL, '2011-06-01 00:57:33'),
(230, 113, 'academic', 'Bachelor of Science', 'Cotton College, Gauhati University', '', NULL, NULL, NULL, NULL, '2011-06-01 00:58:02'),
(232, 114, 'academic', 'Biotechnology', 'University of León', '', NULL, NULL, NULL, NULL, '2011-06-01 01:26:52'),
(233, 111, 'academic', 'Master''s Degree in Biotechnology for Human Health', 'University of Siena', '', NULL, NULL, NULL, NULL, '2011-06-01 01:43:42'),
(234, 111, 'academic', 'Degree in Biotechnology', 'University of Sassari', '', NULL, NULL, NULL, NULL, '2011-06-01 01:44:06'),
(235, 115, 'academic', 'M.Tech Biotechnology', 'Anna University, India', '', NULL, NULL, NULL, NULL, '2011-06-01 06:11:54'),
(236, 115, 'academic', 'B.Tech Biotechnology', 'Anna University, India', '', NULL, NULL, NULL, NULL, '2011-06-01 06:12:13'),
(239, 112, 'academic', 'Food and Health', 'University of Naples "Federico II"', '', NULL, NULL, NULL, NULL, '2011-06-01 09:47:11'),
(240, 112, 'academic', 'Food technology', 'University of Naples "Federico II"', '', NULL, NULL, NULL, NULL, '2011-06-01 09:47:56'),
(244, 116, 'academic', 'BSc biotechnology (2008)', 'University of Urbino', '', NULL, NULL, NULL, NULL, '2011-06-01 15:32:08'),
(253, 119, 'academic', 'DEUG Bioquimica Molecular y Celular (240 creditos europeos)', 'Université de Montpellier', '', NULL, NULL, NULL, NULL, '2011-06-01 21:16:36'),
(246, 118, 'academic', 'Master of Science in  Molecular Biology', 'Faculty of Science, University of Zagreb, Croatia', '', NULL, NULL, NULL, NULL, '2011-06-01 16:03:39'),
(247, 118, 'academic', 'Bachelor of Science in Molecular Biology', 'Faculty of Science, University of Zagreb, Croatia', '', NULL, NULL, NULL, NULL, '2011-06-01 16:04:18'),
(249, 117, 'academic', 'Master of Science in  Molecular Biology', 'Faculty of Science, University of Zagreb, Croatia', '', NULL, NULL, NULL, NULL, '2011-06-01 16:51:59'),
(250, 117, 'academic', 'Bachelor of Science in Molecular Biology', 'Faculty of Science, University of Zagreb, Croatia', '', NULL, NULL, NULL, NULL, '2011-06-01 16:52:08'),
(251, 116, 'academic', 'Masters Molecular Bioengineering  (expected September 2011)', 'Technische Universität Dresden (TU-Dresden)', '', NULL, NULL, NULL, NULL, '2011-06-01 17:07:07'),
(254, 119, 'academic', 'Licenciatura en gestion de produccion agroalimentaria', 'Université d''Avignon', '', NULL, NULL, NULL, NULL, '2011-06-01 21:16:47'),
(255, 120, 'academic', 'BSc in Biochemistry', 'Porto', '', NULL, NULL, NULL, NULL, '2011-06-01 21:50:52'),
(256, 121, 'academic', 'Biotechnology', 'Universitat de Lleida', '', NULL, NULL, NULL, NULL, '2011-06-01 22:23:02'),
(257, 121, 'academic', 'Master of Advanced Microbiology', 'Universitat de Barcelona', '', NULL, NULL, NULL, NULL, '2011-06-01 22:23:24'),
(258, 120, 'academic', 'MSc (finish in July) in Biomedical Engineering', 'Porto', '', NULL, NULL, NULL, NULL, '2011-06-01 22:43:29'),
(259, 122, 'academic', 'Degree in Human Biology', 'Universitat Pompeu Fabra (Barcelona)', '', NULL, NULL, NULL, NULL, '2011-06-02 09:24:35'),
(260, 92, 'academic', 'Bachelor degree in Biotecnologies', 'Alma Mater Studiorum - University of Bologna', '', NULL, NULL, NULL, NULL, '2011-06-02 20:24:56'),
(261, 92, 'academic', 'Master degree in Molecular Biotecnologies', 'Alma Mater Studiorum - University of Bologna', '', NULL, NULL, NULL, NULL, '2011-06-02 20:25:34'),
(263, 123, 'academic', 'LICENCIATURA EN FARMACIA', 'UNIVERSIDAD AUTONOMA GABRIEL RENE MORENO', '', NULL, NULL, NULL, NULL, '2011-06-11 19:08:22'),
(264, 123, 'academic', 'DIPLOMADO EN SALUD PUBLICA CON MENCION EN GERENCIA', 'UNIVERSIDAD AUTONOMA GABRIEL RENE MORENO', '', NULL, NULL, NULL, NULL, '2011-06-11 19:09:16'),
(265, 124, 'academic', 'Masters(M.Sc in Biotechnology)', 'Jawaharlal Nehru Technological University', '', NULL, NULL, NULL, NULL, '2011-06-17 01:32:45'),
(268, 125, 'academic', 'M.Sc. Organic Chemistry', 'UNIVERSITY OF PUNE', '', NULL, NULL, NULL, NULL, '2011-07-15 14:33:57'),
(267, 124, 'academic', 'Bachelors(BSc in Biotechnology, Bioinformatics and Chemistry)', 'R.B.V.R.R Women''s College. Osmania University', '', NULL, NULL, NULL, NULL, '2011-06-17 01:34:14'),
(269, 125, 'academic', 'B.Sc. Chemistry', 'UNIVERSITY OF PUNE', '', NULL, NULL, NULL, NULL, '2011-07-15 14:34:52'),
(270, 126, 'academic', 'Master of Technology', 'Anna University', '', NULL, NULL, NULL, NULL, '2011-07-28 17:43:49'),
(271, 126, 'academic', 'Bachelor of Technology', 'Anna University', '', NULL, NULL, NULL, NULL, '2011-07-28 17:44:07'),
(272, 128, 'academic', 'Master of Science in Information Technology', 'the University of Nottingham- school of computer science', '', NULL, NULL, NULL, NULL, '2011-09-27 03:22:00'),
(280, 130, 'academic', 'Lic. Químico Farmacobiólogo', 'Universidad Michoacana de San Nicolás de Hidalgo', '', NULL, NULL, NULL, NULL, '2011-10-11 22:46:40'),
(274, 128, 'academic', 'Clinical Pharmacy Post graduate academic Diploma', 'Ain Shams University', '', NULL, NULL, NULL, NULL, '2011-09-27 03:24:04'),
(277, 128, 'academic', 'BSc in Pharmaceutical Sciences', 'Cairo University', '', NULL, NULL, NULL, NULL, '2011-09-27 03:24:49'),
(278, 129, 'academic', 'Master', 'Razi', '', NULL, NULL, NULL, NULL, '2011-09-28 17:36:27'),
(279, 129, 'academic', 'bachelor', 'Shiraz', '', NULL, NULL, NULL, NULL, '2011-09-28 17:37:20'),
(281, 131, 'academic', 'Chemistry', 'Universidad del Valle', '', NULL, NULL, NULL, NULL, '2011-10-16 04:58:31'),
(283, 132, 'academic', 'Masters by Research', 'University of Edinburgh', '', NULL, NULL, NULL, NULL, '2011-10-24 13:58:30'),
(284, 132, 'academic', 'B.Tech (Biotechnology)', 'Jaypee Institute of Information Technology', '', NULL, NULL, NULL, NULL, '2011-10-24 13:59:03'),
(285, 133, 'academic', 'Licenciado Quimico', 'País Vasco UPV-EHU', '', NULL, NULL, NULL, NULL, '2011-10-24 15:08:06'),
(286, 133, 'academic', 'Master en Nuevos Materiales', 'Universidad del País Vasco UPV-EHU/ Univesidad de Cantabria UC', '', NULL, NULL, NULL, NULL, '2011-10-24 15:09:29'),
(287, 133, 'academic', 'Master en Nuevos Materiales', 'Universidad del País Vasco UPV-EHU/ Univesidad de Cantabria UC', '', NULL, NULL, NULL, NULL, '2011-10-24 15:13:33'),
(289, 134, 'academic', 'Bachelor of Science, Biochemistry & Molecular Biology', 'University of California, Davis', '', NULL, NULL, NULL, NULL, '2011-10-25 03:21:46'),
(290, 138, 'academic', 'Msc pharmaceutical sciences & engineering', 'university of Leeds', '', NULL, NULL, NULL, NULL, '2011-11-01 12:15:12'),
(291, 141, 'academic', 'MD (DOCTOR OF MEDICINE)', 'MUHS NASHIK, INDIA', '', NULL, NULL, NULL, NULL, '2011-11-03 19:08:43'),
(292, 141, 'academic', 'MSc', 'UNIVERSITY OF NOTTINGHAM', '', NULL, NULL, NULL, NULL, '2011-11-03 19:08:59'),
(294, 141, 'academic', 'MBBS', 'MUHS NASHIK, INDIA', '', NULL, NULL, NULL, NULL, '2011-11-03 19:10:20'),
(295, 139, 'academic', 'Licenciatura en Biología', 'Universidad de Vigo', '', NULL, NULL, NULL, NULL, '2011-11-04 11:38:15'),
(296, 142, 'academic', 'Bsc Biomolecular Science', 'University of St Andrews', '', NULL, NULL, NULL, NULL, '2011-11-04 16:10:26'),
(297, 143, 'academic', 'Master  of Biomedicine ', 'University of Skövde ,Skövde ,Sweden', '', NULL, NULL, NULL, NULL, '2011-11-05 19:11:52'),
(298, 143, 'academic', 'Master of Molecular biology', 'University of Skövde ,Skövde ,Sweden', '', NULL, NULL, NULL, NULL, '2011-11-05 19:12:37'),
(299, 144, 'academic', 'MSc in Biomedical genetics', 'vit university', '', NULL, NULL, NULL, NULL, '2011-11-06 08:07:52'),
(300, 144, 'academic', 'BSc in Biotechnnology', 'BHARATHIYAR UNIVERSITY', '', NULL, NULL, NULL, NULL, '2011-11-06 08:08:23'),
(301, 145, 'academic', 'Masters in Science ( Biotechnology)', 'University of Abertay Dundee', '', NULL, NULL, NULL, NULL, '2011-11-11 09:31:54'),
(302, 145, 'academic', 'Bachelors in Science( BIotechnology)', 'Bangalore University ( Mount Carmel College)', '', NULL, NULL, NULL, NULL, '2011-11-11 09:32:44'),
(303, 146, 'academic', 'Physics', 'Universidad de los Andes', '', NULL, NULL, NULL, NULL, '2011-11-17 17:11:10'),
(305, 146, 'academic', 'Master Biomedical Engineering (Now)', 'Universitat de Barcelona', '', NULL, NULL, NULL, NULL, '2011-11-17 17:12:43'),
(306, 147, 'academic', 'BIOLOGY', 'SALAMANCA ', '', NULL, NULL, NULL, NULL, '2011-11-18 17:53:19'),
(307, 148, 'academic', 'Biotechnology', 'Universitat Rovirai Virgili', '', NULL, NULL, NULL, NULL, '2011-11-21 11:54:57'),
(308, 148, 'academic', 'Biochemistry', 'Universitat Rovira i Virgili', '', NULL, NULL, NULL, NULL, '2011-11-21 11:55:34'),
(314, 149, 'academic', 'Master''s degree in Fine Chemical Experimentation', 'Autonomous University of Barcelona', '', NULL, NULL, NULL, NULL, '2011-12-01 09:15:46'),
(315, 149, 'academic', 'Bachelor''s degree in Chemistry', 'Autonomous University of Barcelona', '', NULL, NULL, NULL, NULL, '2011-12-01 09:16:20'),
(316, 149, 'academic', 'Theoretic part of Graduate in Innovation Management (15 ECTS)', 'Autonomous University of Barcelona', '', NULL, NULL, NULL, NULL, '2011-12-01 09:17:08'),
(317, 150, 'academic', 'Master of Philosophy in Biology', 'The Chinese University of Hong Kong', '', NULL, NULL, NULL, NULL, '2011-12-03 05:37:48'),
(318, 150, 'academic', 'Bachelor of Science in Biology', 'The Chinese University of Hong Kong', '', NULL, NULL, NULL, NULL, '2011-12-03 05:38:08'),
(319, 151, 'academic', 'BIOCHEMISTRY', 'UNIVERSITY OF NAVARRA', '', NULL, NULL, NULL, NULL, '2011-12-06 18:23:02'),
(320, 151, 'academic', 'BIOLOGY', 'UNIVERSITY OF NAVARRA', '', NULL, NULL, NULL, NULL, '2011-12-06 18:23:15'),
(321, 151, 'academic', 'DIPLOMA IN BIOINFORMATICS', 'UNIVERSITY OF NAVARRA', '', NULL, NULL, NULL, NULL, '2011-12-06 18:24:34'),
(322, 151, 'academic', 'MASTER IN BIOCHEMISTY, MOLECULAR BIOLOGY AND BIOMEDICINE', 'COMPLUTENSE UNIVERSITY OF MADRID', '', NULL, NULL, NULL, NULL, '2011-12-06 18:25:11'),
(323, 152, 'academic', 'Master of international law(LLM)', 'Islamic Azad University  Of Tehran', '', NULL, NULL, NULL, NULL, '2011-12-07 19:13:20'),
(324, 152, 'academic', 'Bachelor of Judicial law', 'Islamic Azad University of Tehran', '', NULL, NULL, NULL, NULL, '2011-12-07 19:17:25'),
(325, 153, 'academic', 'Master of Science', 'Nirma University, Ahmedabad, India', '', NULL, NULL, NULL, NULL, '2011-12-09 05:38:51'),
(326, 153, 'academic', 'Bachelor of Science', 'Devi Ahilya Vishwa Vidyalaya, Indore, India', '', NULL, NULL, NULL, NULL, '2011-12-09 05:39:26'),
(329, 155, 'academic', 'Nutrition and Metabolism', 'Universitat de Barcelona', '', NULL, NULL, NULL, NULL, '2011-12-14 15:53:57'),
(330, 155, 'academic', 'Human Nutrition and Dietetics', 'Universitat Ramon Llull', '', NULL, NULL, NULL, NULL, '2011-12-14 15:54:24'),
(331, 156, 'academic', 'MS in Biology', 'Stephen F Austin State University', '', NULL, NULL, NULL, NULL, '2011-12-15 01:55:29'),
(332, 156, 'academic', 'BS in Biology', 'Ataturk University', '', NULL, NULL, NULL, NULL, '2011-12-15 01:55:57');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_doc_types`
--

CREATE TABLE IF NOT EXISTS `jos_phd_doc_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `short_description` varchar(30) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_phd_doc_types`
--

INSERT INTO `jos_phd_doc_types` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Curriculum Vitae', 'Curriculum Vitae', 1),
(2, 'Motivation letter', 'Motivation letter', 2),
(3, 'Academic record', 'Academic record', 3),
(4, 'Recommendation letter', 'Recommendation letter', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_docs`
--

CREATE TABLE IF NOT EXISTS `jos_phd_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_type_id` int(11) NOT NULL DEFAULT '0',
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=535 ;

--
-- Dumping data for table `jos_phd_docs`
--

INSERT INTO `jos_phd_docs` (`id`, `doc_type_id`, `applicant_id`, `filename`, `description`, `modified`) VALUES
(1, 1, 1, 'how to execute script', 'demo', '2011-04-21 14:46:37'),
(2, 1, 2, 'IRB call_11_selectionprocedure_v2.doc', 'CV', '2011-04-28 09:05:41'),
(3, 2, 2, 'listadoGLs Interesados.docx', 'Motivation Letter IRB', '2011-04-28 09:05:51'),
(4, 3, 2, 'PhDnationalcall2011.pdf', 'wdaq', '2011-04-28 09:05:58'),
(5, 1, 4, 'Curriculum vitae.pdf', 'Curriculum Vitae', '2011-04-30 06:03:49'),
(6, 2, 4, 'Motivation letter.pdf', 'Motvation Letter', '2011-04-30 06:04:19'),
(7, 3, 4, 'Bachelor Certificates.pdf', 'Bachelor Certificates', '2011-04-30 06:06:14'),
(478, 3, 4, 'Master.pdf', 'Master certif.', '2011-06-10 06:45:06'),
(9, 3, 4, 'Rome meeting .pdf', 'ISPDC Membership', '2011-04-30 06:10:26'),
(10, 3, 8, 'Byrom transcript.pdf', 'Newcastle Transcript', '2011-05-09 12:41:56'),
(11, 1, 8, 'Dan Byrom CV 1_2011.pdf', 'CV', '2011-05-09 12:46:47'),
(12, 2, 8, 'IRB Mot Letter.pdf', 'Motivation Letter', '2011-05-09 12:47:08'),
(13, 3, 8, 'Supplementary Information.pdf', 'Imperial Transcript plus supporting Info', '2011-05-09 12:47:36'),
(14, 1, 9, 'SCIENTIFIC PROGRAMMES.doc', 'curribulum', '2011-05-09 13:49:07'),
(15, 2, 9, 'Programs  Group Leaders.doc', 'vzdfzcvzxvczcx', '2011-05-09 13:49:58'),
(16, 3, 9, 'Presupuesto Partido 8 de marzo 2.docx', 'zvcvzxcbvzxc', '2011-05-09 13:50:14'),
(17, 2, 15, 'Covering_letter.pdf', 'Carta de motivación', '2011-05-09 20:41:35'),
(18, 3, 16, 'MSc-Records Ivan Meza.pdf', 'MSc diploma, exam degree certificate and MSc transcripts', '2011-05-09 21:15:35'),
(19, 1, 16, 'IVAN MEZA CV.pdf', 'CV-abr2011', '2011-05-09 21:16:50'),
(20, 1, 17, 'cv_english11.pdf', 'Curriculum vitae Claudia Escale', '2011-05-10 16:38:31'),
(21, 3, 17, 'expedient english.pdf', 'Academic records', '2011-05-10 16:41:10'),
(22, 2, 17, 'motivation letter IRBB.doc', 'Motivation Letter Claudia Escale', '2011-05-10 16:50:16'),
(23, 3, 18, 'Diploma University translation.pdf', 'University diploma - official translation', '2011-05-10 16:54:02'),
(25, 1, 18, 'KLIMENT_SANDJAKOSKI CV and Motivation letter.pdf', 'CV and Motivation letter', '2011-05-10 16:57:16'),
(26, 3, 18, 'Certification of graduation with grades.docx', 'Certification of graduation with GRADES', '2011-05-10 16:58:35'),
(27, 3, 18, 'credits from the cirriculum of Medical Faculty.docx', 'Credits from ciriculum of the Medical Faculty', '2011-05-10 17:00:07'),
(29, 2, 18, 'KLIMENT_SANDJAKOSKI Motivation letter.pdf', 'Motivation letter', '2011-05-10 17:20:38'),
(30, 3, 20, 'AC BD.pdf', 'Academic Records Bachelor Degree', '2011-05-11 11:29:09'),
(31, 3, 20, 'AC MD.pdf', 'Academic Records Master Degree', '2011-05-11 11:29:38'),
(32, 1, 20, 'CV.pdf', 'CV', '2011-05-11 11:29:50'),
(33, 2, 20, 'Letter of motivation Adele Alagia.doc', 'Motivation Letter', '2011-05-11 11:45:03'),
(34, 1, 22, 'Snkhchyan_CV.pdf', 'CV', '2011-05-11 13:42:57'),
(35, 3, 22, 'Degrees and Grades.pdf', 'Degrees', '2011-05-11 13:55:24'),
(36, 3, 23, 'Masters.pdf', 'Masters provisional result', '2011-05-11 23:02:40'),
(37, 3, 23, 'Degree.pdf', 'degree', '2011-05-11 23:03:24'),
(38, 3, 23, 'IELTS.pdf', 'English language report', '2011-05-11 23:04:23'),
(50, 1, 23, 'cv.pdf', 'Curriculum Vitae', '2011-05-12 13:30:57'),
(40, 2, 23, 'phd motivation.docx', 'letter of motivation', '2011-05-11 23:05:30'),
(41, 2, 24, 'Motivation Letter_IRB Barcelona.pdf', 'motivation', '2011-05-12 07:17:39'),
(42, 1, 24, 'Europass-CV-Dr-Nazrul.pdf', 'CV', '2011-05-12 07:19:44'),
(43, 3, 24, 'diplomastranscript_MBBSMPH.pdf', 'Academic', '2011-05-12 07:21:40'),
(44, 2, 26, 'motivation letter.pdf', 'Motivation Letter ', '2011-05-12 11:34:55'),
(45, 3, 26, 'BSc DiplomaMSc rec book.pdf', 'BSc Diploma in Physics (completed), MSc Record Book (MSc degree will be completed at the end of June, 2011)', '2011-05-12 11:48:00'),
(46, 1, 27, 'CV.doc', 'Full CV', '2011-05-12 11:49:13'),
(47, 2, 27, 'letter of Motivation.doc', 'Detailed Motivation letter', '2011-05-12 11:51:23'),
(48, 3, 27, 'MSc Transcript.pdf', 'Masters Transcripts', '2011-05-12 11:53:14'),
(49, 3, 27, 'BSc Transcripts.pdf', 'BSc Biotechnology Transcripts', '2011-05-12 11:53:46'),
(51, 1, 30, 'CV.pdf', 'CV', '2011-05-12 14:42:44'),
(52, 2, 30, 'Motivation.pdf', 'Motivation Letter', '2011-05-12 14:43:22'),
(53, 3, 30, 'Academic.pdf', 'Certified Academic Record', '2011-05-12 14:44:13'),
(55, 1, 30, 'Experience.pdf', 'Short Description of Previous Research', '2011-05-12 15:20:28'),
(56, 1, 14, 'CV Dithi.pdf', 'Curriculum Vitae ', '2011-05-14 11:18:28'),
(57, 3, 14, 'Transcript.jpg', 'Transcript of MBBS', '2011-05-14 11:27:32'),
(58, 3, 14, 'MBBS.jpg', 'Certificate of MBBS', '2011-05-14 11:30:38'),
(59, 3, 14, 'lasr IELTS.JPG', 'Result of IELTS', '2011-05-14 11:32:11'),
(60, 2, 14, 'Cover letter of D1.pdf', 'Motivation letter', '2011-05-14 13:15:07'),
(61, 1, 34, 'KARTHIK_NAMACHIVAYAM.doc', 'About myself', '2011-05-14 14:22:31'),
(62, 2, 34, 'Motivation_letter.doc', 'Strength and Weakness', '2011-05-14 14:23:47'),
(64, 1, 33, 'CV_EReina_eng.pdf', 'CV', '2011-05-14 16:54:53'),
(65, 3, 33, 'EReina_BSc_grades.pdf', 'BSc grades', '2011-05-14 16:56:09'),
(72, 3, 35, 'MU_MSc_Trans.jpg', 'Yanin Jaiyen''s MSc in Microbiology (International programme) transcription from Mahidol University', '2011-05-14 17:26:22'),
(71, 3, 35, 'BSc Transc.jpg', 'Yanin Jaiyen''s BSc in Biotechnology transcription', '2011-05-14 17:20:57'),
(69, 1, 35, 'CV_YaninJ.pdf', 'Yanin Jaiyen''s curriculum vitae', '2011-05-14 17:15:50'),
(70, 2, 35, 'ML_YaninJ.pdf', 'Yanin Jaiyen''s motivation letter', '2011-05-14 17:16:52'),
(73, 1, 36, 'Pankaj CV.pdf', 'CV', '2011-05-15 03:49:31'),
(74, 2, 36, '1Cover letter for  pdf', 'Motivation Letter', '2011-05-15 03:50:03'),
(75, 1, 37, 'cvs.doc', 'CV', '2011-05-15 08:19:22'),
(76, 2, 37, 'Statement Of Purpose.pdf', 'STATEMENT OF PURPOSE', '2011-05-15 08:20:17'),
(77, 3, 37, 'trans_crpit_2.pdf', 'TRANSCRIPT', '2011-05-15 08:21:40'),
(78, 1, 39, 'Curriculumplantilla.doc', 'cv', '2011-05-15 19:29:11'),
(79, 3, 39, 'asignaturas y nota media.pdf', 'notes', '2011-05-15 19:31:06'),
(80, 2, 39, 'Dear Sir or Madam.docx', 'letter', '2011-05-15 19:42:16'),
(81, 3, 35, 'IELTS_Yanin.pdf', 'Yanin Jaiyen''s IELTS score', '2011-05-15 20:29:06'),
(82, 3, 17, 'Certificat Master.pdf', 'Certificació realització master', '2011-05-16 08:35:56'),
(83, 1, 40, 'CurriculumTiagoLopesGomes.pdf', 'CV of applicant', '2011-05-16 12:58:19'),
(84, 2, 41, 'CLetter.pdf', 'Cover Letter', '2011-05-16 15:22:40'),
(85, 1, 41, 'CV.pdf', 'CV, 2 pages', '2011-05-16 15:23:49'),
(86, 3, 41, 'exp.pdf', 'Academic record, 2 pages', '2011-05-16 15:38:17'),
(87, 1, 43, 'CV ingles.pdf', 'CV', '2011-05-16 19:10:32'),
(88, 3, 43, 'grades.pdf', 'GRADES', '2011-05-16 19:11:37'),
(89, 2, 43, 'carta.doc', 'LETTER', '2011-05-16 19:16:51'),
(92, 3, 43, 'degree certificate final.pdf', 'diploma y homologación', '2011-05-16 20:33:35'),
(91, 3, 43, 'master certificate.pdf', 'master certificate', '2011-05-16 19:19:52'),
(93, 1, 44, 'R.Vicario.CVact.pdf', 'CV', '2011-05-16 23:26:47'),
(94, 3, 44, 'analit.pdf', 'Academic Record', '2011-05-16 23:35:31'),
(95, 3, 36, 'Pankaj_Bachelor_BMLT Certificate.pdf', 'Bachelor degree transcript', '2011-05-17 00:17:20'),
(96, 3, 36, 'Pankaj_Deo_certificate_Masters in MLSTranscript.pdf', 'Master degree transcript', '2011-05-17 00:20:20'),
(97, 3, 36, 'MyTOEFL Score.pdf', 'English Language Certificate', '2011-05-17 00:25:49'),
(98, 1, 46, 'Europass-CV-110206-DrAsad-1.pdf', 'CV', '2011-05-17 20:15:17'),
(99, 2, 46, 'MotivationLetter.doc', 'Motivation Letter', '2011-05-17 20:15:50'),
(107, 3, 46, 'degree mark and table.pdf', 'Degree marks and time table', '2011-05-18 14:37:13'),
(101, 3, 46, 'neurology.jpg', 'Neuro', '2011-05-17 20:17:44'),
(102, 3, 46, 'refernce2.pdf', 'Reference Letter', '2011-05-17 20:18:30'),
(103, 1, 47, 'CV Nino Spataro.pdf', 'Nino Spataro Curriculm Vitae', '2011-05-18 09:38:28'),
(104, 3, 47, 'Bachelor_Academic_Records.pdf', 'Bachelor''s Degree Academic Records', '2011-05-18 09:39:43'),
(105, 3, 47, 'Masters Degree Academic Records.pdf', 'Master''s Degree Academic Records', '2011-05-18 09:40:28'),
(106, 2, 47, 'motivation letter.doc', 'Motivation Letter', '2011-05-18 09:42:07'),
(108, 2, 13, 'Motivation Letter.pdf', 'My personal motivation letter', '2011-05-18 16:44:44'),
(128, 3, 13, 'Accademic Certificate - First level Degree.pdf', 'This is the original degree certificate of First level degree: contains the list of exams with the corresponding assessments and even the final score', '2011-05-19 19:50:07'),
(129, 3, 13, 'Accademic Certificate - Master Degree.pdf', 'This is the original degree certificates of Master degree: contains the list of exams with the corresponding assessments and even the final score', '2011-05-19 19:52:34'),
(112, 1, 42, 'English CV.pdf', 'Curriculum Vitae', '2011-05-18 18:20:34'),
(113, 3, 42, 'Record - Biology.pdf', 'Biology Record', '2011-05-18 18:25:29'),
(114, 3, 42, 'Record - Biochemistry.pdf', 'Biochemistry Record', '2011-05-18 18:31:49'),
(115, 3, 42, 'Record - Molecular Biotechnology.pdf', 'Molecular Biotechnology Record', '2011-05-18 18:32:55'),
(116, 1, 51, 'CV.pdf', 'CV', '2011-05-18 22:05:54'),
(120, 3, 51, 'Andrea Brerardi_Master Degree_english.pdf', 'Master Degree Certification (english)', '2011-05-18 22:20:14'),
(118, 3, 51, 'DS ANDREA BERARDI L 403451103081.pdf', 'Bechelor Degree', '2011-05-18 22:07:38'),
(119, 3, 51, 'Andrea Berardi_Master Degree_italian.pdf', 'Master Degree Certification (italian)', '2011-05-18 22:08:39'),
(121, 2, 51, 'Letter.pdf', 'Cover Letter', '2011-05-18 22:20:34'),
(122, 2, 42, 'Motivation Letter.pdf', 'Motivation Letter', '2011-05-18 23:24:04'),
(125, 2, 33, 'EReina cover letter.pdf', 'Motivation letter', '2011-05-19 18:06:17'),
(130, 1, 49, 'Curriculum cientifico.pdf', 'Curriculum vitae', '2011-05-19 21:39:33'),
(131, 3, 33, 'MSc grades_EReina.pdf', 'MsC marks', '2011-05-20 12:51:59'),
(132, 3, 33, 'Diploma CSIC.pdf', 'CSIC master', '2011-05-20 12:52:26'),
(133, 3, 49, 'Certificado academico.pdf', 'Academic Record ', '2011-05-20 21:19:58'),
(134, 1, 59, 'CV.pdf', 'Curriculum Vitae', '2011-05-22 16:08:43'),
(135, 2, 59, 'motivation.pdf', 'Motivation Letter ', '2011-05-22 16:09:05'),
(136, 3, 59, 'Records.pdf', 'Diploma and Academic Records', '2011-05-22 16:14:37'),
(137, 3, 60, 'MS degrees exam Simona Francia.pdf', 'Learning activities successfully completed during MS degree in Molecular and Industrial Biotechnology', '2011-05-22 16:18:58'),
(138, 1, 61, 'CV Sumit Jaiswal.pdf', 'CV in pdf format', '2011-05-23 01:14:37'),
(139, 3, 62, 'MSc-BSc Anya Jones.pdf', 'Transcript Diploma MSc & BSc', '2011-05-23 13:27:31'),
(140, 1, 62, 'CVACe_Anya C. Jones.docx', 'CV', '2011-05-23 14:27:10'),
(141, 1, 56, 'CV Glentis Alexandros English.pdf', 'GLENTIS ALEXANDROS 39, rue st Maur                                                                                                                      75011, PARIS, France 0148065090 0685887491 										Nationaliy : Greek a_glentis@msn.com         ', '2011-05-23 14:30:15'),
(143, 2, 56, 'Motivation letter Glentis.pdf', 'Institute for Research in Biomedicine, Barcelona					Paris, 23 of May, 2011  Motivation letter  Dear Madame, dear Sir,  I am writing to express my great interest in following a PHD project in the Institute of Research in Biomedicine (IRB) in Barcelon', '2011-05-23 15:10:44'),
(144, 3, 63, 'expediente academico.pdf', 'Transcript of records in Spanish', '2011-05-23 15:57:38'),
(145, 1, 63, 'CV English. Georgina Ormaza.pdf', 'CV in English ', '2011-05-23 15:59:25'),
(146, 2, 63, 'Motivation letter. IRB Barcelona.pdf', 'Motivation letter (English)', '2011-05-23 17:46:59'),
(147, 1, 29, 'CV_AlvesC.pdf', 'Detailed CV (English)', '2011-05-23 20:31:39'),
(148, 3, 29, 'Kingston.pdf', 'Kingston University London Masters ', '2011-05-23 20:33:34'),
(149, 3, 29, 'FCT.pdf', 'New University of Lisbon Degree Record', '2011-05-23 21:15:22'),
(150, 1, 64, 'CV2011eng2.pdf', 'CV', '2011-05-23 22:27:44'),
(151, 3, 64, 'expediente_academico.pdf', 'Academic record', '2011-05-23 22:28:26'),
(225, 3, 65, 'AcademicR.pdf', 'Grades obtained during undergraduate studies.', '2011-05-28 03:08:28'),
(153, 1, 66, 'Curriculum vitae - May 2011.pdf', 'Curriculum Vitae - Marcela Del Pozo - May 2011', '2011-05-24 02:55:59'),
(154, 2, 66, 'Motivation letter.pdf', 'Motivation Letter - Marcela Del Pozo - May 2011 ', '2011-05-24 02:58:09'),
(155, 3, 66, 'Certified Academic Record.pdf', 'Academic Record - Marcela Del Pozo - November 2010', '2011-05-24 03:01:08'),
(156, 1, 48, 'CV.pdf', 'CV', '2011-05-24 09:50:16'),
(157, 2, 48, 'motivation letter.pdf', ' motivation  letter', '2011-05-24 09:58:30'),
(158, 3, 48, 'expediente academico de master.pdf', 'expediente academico del master', '2011-05-24 10:07:09'),
(159, 3, 48, 'MST1.pdf', 'Mastery Degree in Biotechnology', '2011-05-24 10:10:54'),
(160, 2, 25, 'Motivation lettre.pdf', 'Motivation Letter', '2011-05-24 10:38:37'),
(161, 1, 25, 'CV.pdf', 'Curriculum Vitae', '2011-05-24 10:39:19'),
(162, 3, 25, 'Bachelor.pdf', 'Bachelor in Marine Biology Certificate', '2011-05-24 10:56:37'),
(163, 1, 67, 'English CURRICULUM VITAE.pdf', 'Curriculum Vitae', '2011-05-24 11:32:07'),
(453, 3, 67, 'academic records.pdf', 'Academic record', '2011-06-02 14:52:46'),
(330, 1, 67, 'reference letter from Hospital of Cruces.pdf', 'Reference letter from Hospital of Cruces', '2011-05-31 17:09:00'),
(188, 3, 67, 'certificado categoria B experimentacion animal.pdf', 'B Category animal experimentation certified', '2011-05-26 11:33:20'),
(167, 1, 70, 'resume.pdf', 'RESUME', '2011-05-24 19:37:17'),
(168, 2, 70, 'motivation.pdf', 'letter describes my interest, motivation, subjects studied', '2011-05-24 20:09:57'),
(169, 3, 70, 'cert.pdf', 'masters, bachelors, gate, diploma', '2011-05-24 20:16:09'),
(172, 1, 70, 'Summary.pdf', 'research summary', '2011-05-24 20:20:18'),
(185, 2, 49, 'Motivation letter.pdf', 'Motivation letter', '2011-05-25 19:38:46'),
(224, 2, 29, 'Motivation_Letter.pdf', 'Statement of purpose and presentation', '2011-05-27 19:11:45'),
(175, 1, 72, 'CV.pdf', 'Detailed report of Academic background and research experience', '2011-05-25 06:44:37'),
(176, 2, 67, 'motivation letter.pdf', 'covering letter', '2011-05-25 09:21:53'),
(177, 2, 72, 'Motivation letter.pdf', 'Statement of Purpose', '2011-05-25 12:18:13'),
(178, 3, 72, 'MSc Transcript.pdf', 'M.Sc Transcript', '2011-05-25 12:22:51'),
(187, 3, 72, 'CSIR-JRF  GATE.pdf', 'CSIR-JRF and GATE qualifying certificates', '2011-05-26 10:28:43'),
(186, 3, 72, 'B.Sc Trascript.pdf', 'B.Sc Transcripts', '2011-05-26 10:27:27'),
(181, 2, 73, 'Letter Of Motivation.pdf', 'Letter Of Motivation', '2011-05-25 17:46:47'),
(278, 1, 74, 'CV Irene Pradas.pdf', 'Irene Pradas Curriculum Vitae', '2011-05-30 12:37:40'),
(183, 3, 74, 'Certificado Notas.pdf', 'Irene Pradas Academic Certification', '2011-05-25 18:19:28'),
(184, 3, 74, 'Certificado Titutlo.pdf', 'Irene Pradas Degree Certification', '2011-05-25 18:20:13'),
(189, 1, 76, 'currculum.odt', 'currículum', '2011-05-26 14:21:57'),
(190, 2, 76, 'Motivation letter.docx', 'no need', '2011-05-26 14:22:22'),
(191, 3, 76, 'academic record.docx', 'chemistry', '2011-05-26 14:24:30'),
(318, 1, 73, 'Curriculum Vitae.pdf', 'Curriculum Vitae', '2011-05-31 14:42:38'),
(193, 3, 73, 'Msc Trans script.pdf', 'MSc.Transcript', '2011-05-26 17:11:29'),
(194, 3, 73, 'Bsc Transcript.pdf', 'BSc.Transcript', '2011-05-26 17:12:42'),
(195, 3, 73, 'IELTS certificate  experience certificate.pdf', 'Language & experience Certificate', '2011-05-26 17:17:10'),
(196, 3, 49, 'Certificado ASPANOA.pdf', 'Asociación de Padres de Niños Oncológicos de Aragón en la cual participo como ', '2011-05-27 07:41:52'),
(197, 3, 77, 'master_courses_for_academic_year_2009_2010.pdf', 'master_courses_for_academic_year_2009_2010', '2011-05-27 08:22:59'),
(198, 3, 77, 'bachelor_diploma.pdf', 'bachelor_diploma', '2011-05-27 08:23:19'),
(222, 1, 77, 'CV Ureche Cristina.pdf', 'CV', '2011-05-27 18:48:18'),
(223, 2, 77, 'presentation letter.pdf', 'Motivation letter', '2011-05-27 18:48:47'),
(200, 3, 77, 'Bachelor_Diploma_Suppliment_Part2.pdf', 'bachelor_diploma_supplement_part2', '2011-05-27 08:26:43'),
(204, 2, 54, 'Motivation Letter.pdf', 'MOTIVATION LETTER ', '2011-05-27 11:52:22'),
(203, 1, 54, 'C.V. ESPAOL.pdf', 'CURRICULUM VITAE EN ESPAÑOL ', '2011-05-27 11:51:26'),
(205, 3, 78, 'Masters transcript 2011.pdf', 'M.Sc transcript- till today', '2011-05-27 11:56:30'),
(206, 3, 54, 'Expediente acadmico Compulsado.pdf', 'EXPEDIENTE ACADÉMICO ', '2011-05-27 12:04:30'),
(467, 1, 79, 'CV Kundel.pdf', 'CV', '2011-06-02 21:50:10'),
(209, 3, 79, 'BSc Certpdf', 'Bachelor of Science Certificate', '2011-05-27 15:17:43'),
(210, 3, 79, 'BSc Trpdf', 'Bachelor of Science Transcript of Records', '2011-05-27 15:18:22'),
(211, 2, 68, 'LetterMotivation_IRB.pdf', 'Motivation letter', '2011-05-27 16:18:42'),
(212, 1, 68, 'cv.SousaCarole.GB-2011.05.pdf', 'cv', '2011-05-27 16:19:50'),
(213, 3, 68, 'DiplomaSupplement.pdf', 'Degree Record', '2011-05-27 16:20:13'),
(214, 3, 68, 'MasterCertificate.pdf', 'Master Certificate', '2011-05-27 16:20:39'),
(215, 1, 82, 'curriculum english.pdf', 'My curriculum vitae', '2011-05-27 16:51:41'),
(216, 2, 82, 'Motivation letter 1.pdf', 'Statement of purpose', '2011-05-27 16:52:03'),
(217, 3, 82, 'Academic record.pdf', 'Academic record (last few credits to finish this june)', '2011-05-27 16:53:40'),
(243, 1, 53, 'CV Ester Cannizzaro IRB.pdf', 'Curriculum Vitae', '2011-05-28 19:16:22'),
(220, 1, 13, 'Curriculum Vitae Simone Battaglia.pdf', 'My academic qualifications and a summary of my work experience and skills', '2011-05-27 17:31:14'),
(227, 3, 65, 'MagnaCL.pdf', 'Magna Cum Laude Degree awarded.', '2011-05-28 03:13:25'),
(228, 2, 64, 'Presentation Letter5.pdf', 'A motivation letter', '2011-05-28 11:05:11'),
(229, 3, 83, 'CCF28052011_00001.jpg', 'MSc Academic Record Imperial College London', '2011-05-28 14:32:39'),
(230, 3, 83, 'CCF28052011_00000.jpg', 'MSc Academic Record Imperial College London', '2011-05-28 14:33:21'),
(231, 3, 83, 'CCF28052011_00003.jpg', 'BSc Academic record University of Leicester', '2011-05-28 14:34:33'),
(232, 1, 83, 'Stelios Pavlou CV UCY_1.pdf', 'Curriculum Vitae', '2011-05-28 16:43:44'),
(233, 1, 85, 'CV.pdf', 'Curriculum Vitae', '2011-05-28 17:06:16'),
(234, 2, 85, 'Motivation Letter.pdf', 'Motivation Letter', '2011-05-28 17:07:29'),
(235, 3, 85, 'Transcript Masters.pdf', 'Master''s transcript', '2011-05-28 17:12:23'),
(236, 3, 85, 'Transcript Bachelors.pdf', 'Bachelor''s transcript', '2011-05-28 17:18:54'),
(238, 3, 85, 'Student Certificates.rar', 'Student certificates', '2011-05-28 17:30:35'),
(239, 1, 86, 'CV.pdf', 'CV', '2011-05-28 18:37:46'),
(240, 2, 86, 'Motivation Letter.pdf', 'Motivation Letter', '2011-05-28 18:43:58'),
(241, 3, 86, 'Mphil_Degree.pdf', 'Mphil Degree', '2011-05-28 18:44:46'),
(242, 3, 86, 'MSc_Degree.pdf', 'MSc Degree', '2011-05-28 18:45:17'),
(308, 2, 53, 'Motivation Letter.pdf', 'Motivation Letter', '2011-05-31 09:34:20'),
(245, 3, 53, 'Academic Record Bachelor Degree.pdf', 'Academc Record Bachelor Degree', '2011-05-28 20:00:02'),
(246, 3, 53, 'Academic Record Master Degree.pdf', 'Academic Record Master Degree', '2011-05-28 20:00:49'),
(247, 3, 75, 'Academic.Record.SlviaOrgu.pdf', 'Academic record from University of Barcelona', '2011-05-29 12:21:09'),
(248, 1, 87, 'CV.pdf', 'complete profile of manu jain', '2011-05-29 17:02:19'),
(249, 3, 87, 'Academic award.pdf', 'Certificate of academic award', '2011-05-29 17:22:30'),
(250, 2, 87, 'Motivation letter.docx', 'purpose letter why I want to pursue a PhD at IRB Barcelona', '2011-05-29 17:24:35'),
(251, 1, 88, 'CV.pdf', 'cv', '2011-05-29 18:52:39'),
(252, 2, 88, 'motive letter.pdf', '2 pages describing why I want to be part of your prestigious institution', '2011-05-29 18:56:24'),
(253, 3, 88, 'academic record.pdf', 'final academic record', '2011-05-29 19:02:09'),
(254, 1, 89, 'CV.pdf', 'CV showing my academic achievements', '2011-05-29 19:35:29'),
(255, 2, 89, 'SOP.doc', ' Motivation Letter for pursuing PhD in IRB Barcelona', '2011-05-29 19:38:58'),
(256, 1, 80, 'Europass-CV-110513-Cortigiani.pdf', 'Curriculum Vitae', '2011-05-29 19:54:34'),
(257, 3, 80, 'Degree certificate.pdf', 'Degree certificate', '2011-05-29 19:56:03'),
(258, 3, 89, 'Transcript.pdf', 'My integrated MS academic record', '2011-05-29 19:56:50'),
(452, 3, 80, 'Academic records.pdf', 'Academic records', '2011-06-02 14:33:31'),
(260, 3, 89, 'Course Structure and Grade System.pdf', 'Courses name and grading system of my University', '2011-05-29 20:00:44'),
(261, 2, 80, 'Personal Statement - Barcellona.docx', 'Motivation letter', '2011-05-29 20:01:44'),
(262, 1, 78, 'Adeel AsgharCV.pdf', 'Adeel Asghar CV ', '2011-05-29 20:03:32'),
(263, 3, 78, 'B.Sc degree  transcript.pdf', 'B.Sc degree and transcript', '2011-05-29 20:04:48'),
(264, 3, 80, 'scientific report.pdf', 'Scientific report (Noscira)', '2011-05-29 20:05:38'),
(265, 2, 62, 'IRB PhD Programme_Motivation Letter.docx', 'Motivation Letter', '2011-05-29 20:46:26'),
(267, 3, 89, 'Publications.pdf', 'Publication in Synlett 2009 and Tetrahedron Asymmetry 2010', '2011-05-29 22:20:30'),
(268, 1, 90, 'MugdhaCV11.doc', 'CV', '2011-05-30 07:43:46'),
(269, 2, 78, 'Motivation Letter to IRB.pdf', 'motivation letter', '2011-05-30 08:38:22'),
(270, 3, 90, 'Msc transcript.pdf', 'Msc Transcript', '2011-05-30 08:42:47'),
(271, 3, 90, 'Bsc transcript.pdf', 'Bsc Transcript', '2011-05-30 08:43:20'),
(273, 2, 90, 'sop irb.doc', 'motivation letter', '2011-05-30 11:02:07'),
(274, 2, 74, 'Motivation letter.pdf', 'Irene Pradas Motivation letter', '2011-05-30 11:45:15'),
(275, 3, 93, 'exped.elena.doc', 'Expediente de la licenciatura', '2011-05-30 11:59:30'),
(276, 3, 93, 'expediente Doct.docx', 'Expediente del DEA', '2011-05-30 12:01:13'),
(277, 1, 93, 'CV.doc', 'CV in Spanish', '2011-05-30 12:03:12'),
(279, 3, 87, 'transcripts.pdf', 'Masters and Bachelors academic record', '2011-05-30 13:11:51'),
(280, 1, 94, 'Marta Cases CV.doc', 'Curriculum Vitae', '2011-05-30 13:22:24'),
(281, 2, 94, 'Motivation letter - Marta Cases.pdf', 'Motivation letter', '2011-05-30 13:30:21'),
(282, 3, 94, 'Academic record.pdf', 'Academic record', '2011-05-30 13:31:32'),
(283, 1, 95, 'Marta Cases CV.doc', 'Curriculum Vitae', '2011-05-30 13:33:17'),
(284, 2, 95, 'Motivation letter - Marta Cases.pdf', 'Motivation letter', '2011-05-30 13:33:44'),
(285, 3, 95, 'Academic record.pdf', 'Academic record', '2011-05-30 13:34:14'),
(287, 3, 25, 'Master.pdf', 'Academic Record', '2011-05-30 13:36:46'),
(288, 2, 83, 'Personal Statement IRB.pdf', 'Motivation Letter', '2011-05-30 17:23:13'),
(290, 3, 60, 'MS degree in Molecular and Industrial Biotechnology.pdf', 'Simona Francia MS degree in Molecular and Industrial Biotechnology ', '2011-05-30 19:25:07'),
(401, 2, 6, 'motivationLetterLatasiewicz.pdf', 'motivation letter', '2011-06-01 21:02:06'),
(292, 2, 97, 'carta de motivaci.pdf', 'Motivation letter ', '2011-05-30 20:31:34'),
(293, 1, 97, 'CVc.pdf', 'curriculum vitae', '2011-05-30 20:35:43'),
(294, 3, 97, 'Academic marks.pdf', 'academic marks', '2011-05-30 20:58:49'),
(295, 2, 93, 'CARTA DE PRESENTACIN.docx', 'Carta de presentación en español', '2011-05-30 22:09:23'),
(296, 1, 98, 'SMontanerCV.pdf', 'In the attachment you will find the English translation of my Resume', '2011-05-30 22:47:34'),
(297, 3, 98, 'S Montaner. Notas Puesto de promocion y acta de grado.pdf', 'En el adjunto encontraran las notas obtenidas en la licenciatura, el acta de grado autorizada por la rectora de la Universidad de Carabobo y el puesto de promocion obtenido.', '2011-05-30 23:18:38'),
(299, 1, 75, 'cv-SlviaOrgu.pdf', 'CV. Sílvia Orgué', '2011-05-31 08:58:04'),
(300, 2, 75, 'Motivation.letter-SlviaOrgu.pdf', 'Motivation letter. Sílvia Orgué ', '2011-05-31 08:58:38'),
(475, 3, 101, 'Bachelor Certificate and List of Exams.pdf', 'Bachelor transcript and title', '2011-06-08 10:13:17'),
(311, 1, 101, 'Curriculum Vitae Gaia Anelli.pdf', 'CV Gaia Anelli', '2011-05-31 10:23:59'),
(474, 3, 101, 'MasterDegree.pdf', 'Master transcripts and certif.', '2011-06-08 10:12:49'),
(473, 3, 101, 'English titles.pdf', 'Certificates in English', '2011-06-08 10:12:29'),
(305, 1, 31, 'CV Raffaella Iurlaro.doc', 'CV Raffaella Iurlaro', '2011-05-31 09:21:01'),
(306, 1, 75, 'Erasmus Project Research Abstract-SlviaOrgu.pdf', 'Erasmus Project Abstract', '2011-05-31 09:28:16'),
(307, 1, 75, 'Projecte.Mster.Abstract.pdf', 'Projecte Màster Abstract', '2011-05-31 09:29:08'),
(309, 1, 19, 'CURRICULUM VITAE  Elena Inglesdocx', 'Curriculum Vitae', '2011-05-31 09:42:17'),
(310, 2, 101, 'Motivation Letter Gaia Anelli IRB.doc', 'Motivation Letter for PhD Programme', '2011-05-31 09:53:38'),
(312, 3, 69, 'Diploma.pdf', 'Diploma B', '2011-05-31 10:43:49'),
(313, 3, 69, 'Diploma A.pdf', 'Diploma A', '2011-05-31 10:45:46'),
(314, 1, 102, 'dietrich_p_cv.doc', 'cv philipp dietrich', '2011-05-31 11:15:35'),
(315, 2, 102, 'dietrich_p_cover letter.docx', 'letter philipp dietrich', '2011-05-31 11:16:05'),
(316, 2, 103, 'Statement.docx', 'Here I present my statement of purpose', '2011-05-31 14:19:15'),
(317, 1, 103, 'CV.doc', 'Here I present my curriculum vitae', '2011-05-31 14:33:13'),
(319, 1, 104, 'Europass-CV-Estefnia Martins.pdf', 'Curriculum Vittae_Estefânia Martins', '2011-05-31 15:20:52'),
(320, 2, 104, 'Cover Letter PhD.pdf', 'Cover Letter_Estefânia Martins', '2011-05-31 15:21:22'),
(321, 3, 104, 'Certificado de habilitaes.pdf', 'Degree certificate in Biology', '2011-05-31 15:21:52'),
(471, 3, 104, 'Certificado Mestrado and Master Grades.pdf', 'Certificado Mestrado and Master Grades', '2011-06-07 09:49:26'),
(323, 1, 6, 'JoannaLatasiewiczCV.pdf', 'Curriculum Vitae', '2011-05-31 15:45:11'),
(324, 3, 103, '1level.pdf', 'Here I present exams mark and final mark of the first level degree', '2011-05-31 15:46:54'),
(325, 3, 103, '2level.pdf', 'Here I present exams mark and final mark of the second level degree', '2011-05-31 15:47:29'),
(326, 3, 6, 'AcademicRecordsJLatasiewicz.pdf', 'Diploma and Suplement, Certificate of attendance from Barcelona Science Park', '2011-05-31 15:48:00'),
(327, 1, 106, 'Curriculum Vitae 1.pdf', 'Curriculum itae', '2011-05-31 15:55:06'),
(328, 3, 106, 'academic transcripts.pdf', 'Academic transcripts include High School transcripts, B.Sc. transcripts, Bachelor''s degree and M.Sc. transcripts till third semester', '2011-05-31 16:00:12'),
(331, 1, 107, 'CV_AntoniParcerisasMosqueda.pdf', 'Curriculum Vitae', '2011-05-31 17:49:02'),
(332, 2, 107, 'Motivation_letter_AntoniParcerisas.pdf', 'motivation letter', '2011-05-31 17:49:27'),
(333, 3, 107, 'expedientbioqumicaiqumica.pdf', 'It includes both Certified Academic Records', '2011-05-31 17:50:03'),
(334, 1, 107, 'certificatestadaPCB.pdf', 'Passa l''estiu al Parc Certificate', '2011-05-31 17:51:08'),
(335, 1, 107, 'certificatbecacollaboraci.pdf', 'Certificate Collaboration Fellowship ', '2011-05-31 17:51:38'),
(336, 1, 108, 'Carlos Fernando Snchez Arcos _English_.pdf', 'CV Carlos Fernando Sanchez Arcos', '2011-05-31 19:26:21'),
(337, 2, 108, 'cover letter Carlos F Snchez.pdf', 'cover letter carlos sánchez', '2011-05-31 19:27:04'),
(338, 3, 108, 'carlos snchez.pdf', 'academic record carlos sánchez', '2011-05-31 19:32:54'),
(339, 1, 109, 'SANIRBANDHA CV.pdf', 'DETAILED CURRICULAM VITAE', '2011-05-31 20:23:59'),
(340, 3, 109, 'masters transcript scan-sunny_opt.pdf', 'M.Sc TRANSCRIPT-MANIPAL UNIVERSITY', '2011-05-31 20:26:06'),
(341, 2, 109, 'STATEMENT OF PURPOSE_opt.pdf', 'STATEMENT OF PURPOSE', '2011-05-31 20:31:46'),
(342, 3, 109, 'TOEFL score.pdf', 'PROOF OF ENGLISH', '2011-05-31 20:33:33'),
(343, 3, 13, 'Sworn Translation.pdf', 'This file is the sworn translation of my two accademics certificates ', '2011-05-31 20:43:37'),
(344, 1, 110, 'Curriculum vitae.pdf', 'CV', '2011-05-31 20:49:21'),
(345, 2, 110, 'Letter.pdf', 'Letter of Motivation', '2011-05-31 20:49:40'),
(346, 3, 110, 'MSC_grades.pdf', 'Master of Science grades and scoring', '2011-05-31 20:50:33'),
(347, 3, 110, 'BSC_grades.pdf', 'Bachelor of Science Grades', '2011-05-31 20:53:07'),
(351, 2, 96, 'MLetter.pdf', 'Motivation Letter', '2011-05-31 21:26:28'),
(352, 3, 96, 'Certif.pdf', 'Bachelor, Licenciatura and Masters Degree Certificates and respective academic records.', '2011-05-31 21:28:06'),
(353, 3, 96, 'Erasmus.pdf', 'Studies period certificate Lifelong programme Erasmus and academic records.', '2011-05-31 21:29:24'),
(377, 1, 96, 'CV.pdf', 'Curriculum Vitae', '2011-06-01 11:06:43'),
(355, 2, 65, 'MLetter.pdf', 'Statement of purpose.', '2011-05-31 21:31:57'),
(364, 3, 61, 'Academic degree and transcripts_Sumit.pdf', 'Bachelor Degree, Transcript of grades in all 8 semesters in Bachelor (191 credits), Transcript of grades so far in Master', '2011-06-01 01:32:25'),
(365, 3, 61, 'Academic certifications_Sumit.pdf', 'Certificate of participations and presentation in International conference and workshop', '2011-06-01 01:33:39'),
(360, 2, 113, 'Pankaj k.pdf', 'motivation letter', '2011-06-01 01:14:02'),
(361, 1, 114, 'Curriculum.pdf', 'Curriculum vitae', '2011-06-01 01:22:59'),
(362, 3, 114, 'Academic.pdf', 'Academic record', '2011-06-01 01:28:51'),
(368, 2, 61, 'Motivation Letter_Sumit.pdf', 'Motivation letter for application towards PhD fellowship at IRB, Barcelona', '2011-06-01 01:43:49'),
(369, 3, 113, 'Transcript.pdf', 'Transcript', '2011-06-01 02:23:34'),
(370, 3, 113, 'TOEFL.pdf', 'TOEFL', '2011-06-01 02:24:10'),
(371, 3, 61, 'Project Work Details_Sumit.pdf', 'A more detailed overview of research and project work carried out in Bachelor and Master so far', '2011-06-01 02:52:33'),
(372, 1, 115, 'Manivannan Sethurajan CV.pdf', 'CV', '2011-06-01 06:17:23'),
(373, 3, 115, 'Sethurajan_Manivannan_Exam Masters.pdf', 'Masters transcrips', '2011-06-01 06:20:06'),
(374, 3, 115, 'Sethurajan_Manivannan_Exam Bachelors.pdf', 'Bachelors transcrips', '2011-06-01 06:22:50'),
(375, 2, 115, 'Letter of Motivation.pdf', 'Letter of motivation', '2011-06-01 06:28:49'),
(376, 3, 115, 'Certificate.pdf', 'Experience / training certificates', '2011-06-01 06:37:12'),
(389, 1, 116, 'Curriculum_Elisa_Vergari.pdf', 'Curriculum Vitae', '2011-06-01 17:06:30'),
(382, 2, 116, 'Motivation_Letter_Elisa_Vergari.pdf', 'Statement of purpose', '2011-06-01 16:28:11'),
(380, 1, 118, 'Ivana_Cosic_CV.pdf', 'General Curriculum Vitae', '2011-06-01 16:05:10'),
(381, 3, 118, 'Ivana Cosic_Scan of academic record.pdf', 'Scan of my academic record, during my Undergraduate and Graduate study of Molecular Biology', '2011-06-01 16:06:49'),
(384, 3, 116, 'Transcript_Elisa_Vergari_english.pdf', 'This is my Academic Record (english version) update to Dicember 2010. Unfortunately I could not get an update Academic Record because I am not in my University at the moment.', '2011-06-01 16:32:46'),
(385, 3, 116, 'Transcript_Elisa_Vergari.pdf', 'This is the German version of my Academic Transcript. It is the only update version I could download from my University account.', '2011-06-01 16:34:05'),
(386, 1, 117, 'IvanaCosicCV.pdf', 'General Curriculum Vitae', '2011-06-01 16:53:40'),
(387, 2, 117, 'Motivation letter_Ivana Cosic.docx', 'Motivation letter and statement of purpose', '2011-06-01 16:53:58'),
(388, 3, 117, 'Ivana Cosic_ academic record.pdf', 'Scan of academic record', '2011-06-01 16:54:28'),
(391, 2, 91, 'MotLet.pdf', 'My motivation letter', '2011-06-01 18:23:30'),
(392, 1, 91, 'CV.pdf', 'my CV', '2011-06-01 18:34:22'),
(394, 3, 91, 'BScToR.pdf', 'My B.Sc. transcript of records', '2011-06-01 18:36:52'),
(397, 3, 91, 'MScToR.pdf', 'My grades of the M.Sc. course so far in German original. What is more, in the meantime I have passed the English exam (15 ECTS) but this has not yet been updated to my online transcript of records.', '2011-06-01 18:46:42'),
(407, 3, 91, 'MScToRTrans.pdf', 'I translated the important part of the M.Sc. transcript of records into English. This is NOT an original.', '2011-06-01 21:27:43'),
(412, 3, 111, 'bsc_doc.pdf', 'Bachelor''s Degree Documentation', '2011-06-01 22:55:06'),
(477, 3, 60, 'Simona Francia Bachelor degree grades.pdf', 'Bachelor with transcript', '2011-06-09 08:40:30'),
(402, 1, 60, 'Curriculum Vitae Simona Francia.pdf', 'Curriculum Vitae Simona Francia', '2011-06-01 21:08:29'),
(403, 1, 119, 'Annick_GIRAL_Esp1.pdf', 'Curriculum Vitae Annick Giral', '2011-06-01 21:20:04'),
(404, 2, 119, 'Carta de motivacion.pdf', 'Carta de motivacion Annick Giral', '2011-06-01 21:20:33'),
(405, 3, 119, 'annick lettre recommandation.pdf', 'Carta de recomendacion IRD', '2011-06-01 21:20:58'),
(406, 3, 119, 'LettreAnnick250511.pdf', 'Carta de recomendacion INRA', '2011-06-01 21:21:25'),
(408, 1, 120, 'Europass-CV-01_06_11-Barros.pdf', 'CV_Raquel Barros', '2011-06-01 21:52:25'),
(409, 3, 120, 'certificado de cadeiras FEUP.pdf', 'In progress: MSc in Biomedical Engineering', '2011-06-01 21:54:03'),
(410, 2, 120, 'Motivation letter.pdf', 'Letter', '2011-06-01 22:02:54'),
(411, 3, 120, 'certificado e certidao.pdf', 'Certificate of degree in Biochemistry', '2011-06-01 22:45:46'),
(413, 3, 111, 'msc_doc.pdf', 'Master''s Degree Documentation', '2011-06-01 23:35:41'),
(414, 2, 31, 'Motivation letter Raffaella Iurlaro.pdf', 'Motivation letter', '2011-06-01 23:41:14'),
(415, 3, 31, 'Academic record English.pdf', 'Academic record in english explaining the italian grading system', '2011-06-01 23:51:00'),
(416, 1, 65, 'CV.pdf', 'Curriculum Vitae.', '2011-06-02 01:15:08'),
(417, 1, 113, 'Pankaj Kalita.pdf', 'Curriculum Vitae', '2011-06-02 01:15:50'),
(444, 2, 111, 'mot_letter.pdf', 'Presentation Letter', '2011-06-02 11:34:21'),
(419, 2, 98, 'Carta de Motivacion Sergio Montaner.pdf', 'En el adjunto se encuentra la carta de motivacion. La escribi de forma breve pero directa acerca de lo que me parece importante realtar a la hora de preguntar por que deseo ingresar al programa de doctorado del IRB', '2011-06-02 03:53:59'),
(420, 1, 105, 'Curriculum Vitae.pdf', 'A summary of my academic performance and work experience', '2011-06-02 04:23:52'),
(421, 3, 105, 'escanear0001.jpg', 'MD title', '2011-06-02 04:25:24'),
(422, 3, 105, 'escanear0002.jpg', 'Recognition to outstanding performance during the Medicine carreer', '2011-06-02 04:27:30'),
(423, 3, 92, 'DS_DAVIDE_RUBBINI_LT.pdf', 'Bachelor''s Degree Diploma Supplement', '2011-06-02 08:28:32'),
(424, 3, 92, 'DS_DAVIDE_RUBBINI_LS.pdf', 'Master''s Degree Diploma Supplement', '2011-06-02 08:29:22'),
(425, 1, 122, 'CVAnnaMont.pdf', 'Curriculum Vitae Anna_Montaner_Domènech', '2011-06-02 09:31:21'),
(440, 2, 122, 'MOT.LEAnna.pdf', 'Motivation letter Anna_Montaner_Domènech', '2011-06-02 10:56:24'),
(439, 3, 31, 'Second degree  sworn translation.pdf', 'Second degree + translation', '2011-06-02 10:06:07'),
(437, 3, 122, 'AR.Anna.zip', 'Academic record Anna_Montaner_Domènech (compressed file containing 5 documents)', '2011-06-02 10:01:33'),
(438, 3, 31, 'First degree  sworn translation.pdf', 'First degree + translation', '2011-06-02 10:05:44'),
(441, 2, 52, 'Carta de intencion y justificacion.pdf', 'Presentation Letter Spanish', '2011-06-02 11:04:20'),
(468, 3, 52, 'Certificado de Academico.pdf', 'Certificado de academico', '2011-06-03 08:57:52'),
(443, 3, 52, 'Apostilla Certificado academico.pdf', 'Certification academic record', '2011-06-02 11:08:33'),
(445, 3, 109, 'BACHELORS COLLATED.pdf', 'BSC Transcript', '2011-06-02 11:38:35'),
(446, 2, 105, 'Application Letter.pdf', 'Application letter', '2011-06-02 11:49:03'),
(447, 3, 122, 'advance.pdf', 'Advanced Certificate in English Anna_Montaner_Domènech', '2011-06-02 12:52:41'),
(448, 3, 104, 'Grade and translation.pdf', 'Grade and translation', '2011-06-02 13:07:10'),
(449, 2, 60, 'Simona Francia Motivation letter.pdf', 'Motivation letter SImona Francia', '2011-06-02 13:46:16'),
(459, 1, 111, 'CV-Davide.pdf', 'Curriculum Vitae', '2011-06-02 18:07:44'),
(451, 3, 122, 'F021.pdf', 'workshop que vaig fer al BSC ', '2011-06-02 14:27:36'),
(454, 1, 112, 'M.I. CV.pdf', 'Curriculum vitae Ilario Mennella', '2011-06-02 17:40:30'),
(456, 2, 112, 'Cover letter.pdf', 'cover letter Ilario Mennella', '2011-06-02 17:52:54'),
(457, 3, 112, 'diploma di laurea in inglese con ssd 1.pdf', 'Bachelor degree record', '2011-06-02 17:54:34'),
(458, 3, 112, 'diploma di laurea in inglese con ssd.pdf', 'Second cycle degree record', '2011-06-02 17:56:06'),
(460, 1, 92, 'Curriculum Vitae.doc', 'Curriculum vitae', '2011-06-02 18:07:52'),
(461, 1, 52, 'CV Mauro Rodriguez.pdf', 'Curriculum Vitae', '2011-06-02 19:43:53'),
(462, 1, 52, 'Mencion De reconocmiento.pdf', 'Mencion de Reconocimiento Meritorio', '2011-06-02 19:45:25'),
(463, 1, 69, 'Malgorzata Wardzynska CV.doc', 'Curriculum Vitae', '2011-06-02 20:01:10'),
(464, 2, 69, 'Malgorzata Wardzynska Motivation letter.doc', 'Motivation letter', '2011-06-02 20:03:17'),
(465, 2, 92, 'Motivational Letter.pdf', 'Motivational letter', '2011-06-02 20:26:26'),
(466, 2, 79, 'motivation.pdf', 'Motivation letter', '2011-06-02 21:47:43'),
(469, 3, 120, 'Report on Raquel stage at UB in 2008.pdf', 'Report stage UB', '2011-06-03 09:40:52'),
(470, 3, 79, 'MSc IT.pdf', 'MsC marks transcript', '2011-06-07 09:42:34'),
(472, 3, 112, 'Certificates of grades.pdf', 'Grades certificates', '2011-06-07 11:13:09'),
(476, 3, 68, 'MasterCertificate_fulltrans.pdf', 'Master Transcript and translation', '2011-06-08 14:24:32'),
(479, 3, 86, 'BSc.pdf', 'Degree and transcript BSC', '2011-06-15 13:07:40'),
(480, 1, 124, 'Resume 1.pdf', 'CV with reference details', '2011-06-17 01:35:13'),
(482, 3, 124, 'MSc transcripts.pdf', 'transcripts of Msc', '2011-06-17 01:39:30'),
(483, 3, 124, 'DEGRE MEMO-.pdf', 'Bachelor memorandum.', '2011-06-17 01:40:25'),
(486, 1, 126, 'AJAY DEVENDRAN _resume with details of referee.pdf', 'Curriculum Vitae with details of academic referees', '2011-07-28 17:45:18'),
(485, 1, 125, 'Curriculum Vitae_Sultan_.pdf', 'Curriculum Vitae', '2011-07-15 14:36:47'),
(487, 2, 126, 'SOP .pdf', 'Letter of Motivation', '2011-07-28 17:47:25'),
(488, 3, 126, 'masters _scores.pdf', 'Masters program score cards with course completion certificate', '2011-07-28 17:48:31'),
(489, 3, 126, 'Bachelors _Academic Transcripts .pdf', 'Bachelors Score Cards with Degree certificates', '2011-07-28 17:49:26'),
(490, 1, 128, 'Mohamed_Mysara_CV.doc', 'CV and Publication Abstract', '2011-09-27 07:45:26'),
(491, 3, 128, 'Trancscript andCertificates__.pdf', 'Transcripts and Certificates ', '2011-09-27 08:02:34'),
(492, 2, 128, 'Motivation letter.docx', 'Motivation Letter', '2011-09-27 08:25:14'),
(493, 1, 130, 'CV.1 escolar.pdf', 'Academic Curriculum Vitae ', '2011-10-11 22:57:10'),
(494, 1, 132, 'Resume.pdf', 'cv', '2011-10-24 14:01:32'),
(495, 3, 132, 'docs.pdf', 'Degree Certificates', '2011-10-24 14:06:12'),
(496, 3, 132, 'transcripts.pdf', 'Transcripts', '2011-10-24 14:10:18'),
(497, 3, 132, 'ielts.pdf', 'IELTS certificate', '2011-10-24 14:11:40'),
(498, 1, 133, 'Europass-CV-GarcaFernndez.pdf', 'Curriculum Vitae', '2011-10-24 15:11:30'),
(499, 3, 133, 'EXPEDIENTE.doc.pdf', 'Academic record', '2011-10-24 15:12:18'),
(500, 3, 134, 'transcript.pdf', 'Transcript', '2011-10-25 03:22:39'),
(501, 1, 138, 'sunil.pdf', 'c v', '2011-11-01 12:15:56'),
(502, 2, 138, 'motivation.pdf', 'motivation', '2011-11-01 12:16:24'),
(503, 3, 141, 'MBBS Transcript.PDF', 'MBBS TRANSCRIPT', '2011-11-03 19:13:57'),
(504, 3, 141, 'Masters_Transcript.pdf', 'MSc TRANSCRIPT', '2011-11-03 19:14:45'),
(505, 3, 141, 'MD_Biochemistry.pdf', 'MD CERTIFICATE', '2011-11-03 19:15:16'),
(506, 2, 141, 'ANKUR SHAH SOP.pdf', 'STATEMENT OF PURPOSE', '2011-11-03 19:16:49'),
(507, 1, 142, 'CV Agnieszka Janska.pdf', 'CV_Agnieszka_Janska', '2011-11-04 16:11:19'),
(508, 1, 143, 'CURRICULUM VITAE.Farzaneh.docx', 'CV updated in September 2011', '2011-11-05 19:16:41'),
(509, 2, 143, 'SOP.docx', 'Purpose of applying for a PhD position', '2011-11-05 19:24:02'),
(510, 3, 144, 'msc degree.pdf', 'MSc degree', '2011-11-06 08:09:41'),
(511, 3, 144, 'MSc transcript.pdf', 'MSc transcript', '2011-11-06 08:10:34'),
(512, 3, 144, 'Bsc degree1.pdf', 'BsC DEGREE', '2011-11-06 08:11:18'),
(513, 3, 144, 'proj and traini.pdf', 'PROJECT AND TRAINING', '2011-11-06 08:12:46'),
(514, 2, 144, 'I am responding to your advertisement for a PhD position Cancer and Immunology.docx', 'MOTIVATION LETTER', '2011-11-06 08:13:14'),
(515, 1, 145, 'Curriculum Vitae.doc', 'CV', '2011-11-11 09:34:17'),
(516, 3, 145, 'MastersDegree1.pdf', 'Masters Certificate', '2011-11-11 09:35:08'),
(517, 3, 145, 'Bachelors certificate.pdf', 'Bachelors Certificate', '2011-11-11 09:35:52'),
(518, 3, 145, 'IELTS_Certificate.pdf', 'IELTS Certificate', '2011-11-11 09:36:51'),
(519, 2, 145, 'Statement of Purpose.doc', 'Statement of Purpose', '2011-11-11 09:45:59'),
(520, 1, 146, 'CVIngridValenciaE-Spain.pdf', 'CV-English', '2011-11-17 19:26:46'),
(521, 3, 150, '_Bachelor Certificate_01.pdf', 'Academic certificate of Bachelor degree', '2011-12-03 05:44:21'),
(522, 1, 150, '_undergraduate_transcript_02.pdf', 'Academic transcript of Bachelor degree', '2011-12-03 05:46:40'),
(523, 1, 150, '_Mphil Transcript 01.pdf', 'Academic transcript of Master degree', '2011-12-03 05:47:04'),
(524, 3, 152, '  .jpg', 'Master degree', '2011-12-07 19:26:30'),
(525, 3, 152, ' .jpg', 'Bachelor degree', '2011-12-07 19:27:58'),
(526, 3, 152, '     .jpg', 'Teaching', '2011-12-07 19:39:41'),
(527, 3, 151, 'ACADEMICO.pdf', 'ACADEMIC RECORD', '2011-12-11 18:03:24'),
(528, 1, 151, 'curriculum_vitae ENGLISH.pdf', 'CURRICULUM VITAE', '2011-12-11 18:04:31'),
(529, 1, 156, 'ResumeErkanYuca2011.pdf', 'CV', '2011-12-15 01:56:21'),
(530, 3, 156, 'Transcript Graduate Degree SFASU.pdf', 'Transcript of Graduate Degree', '2011-12-15 01:59:34'),
(531, 3, 156, 'Transcript Undergraduate Degree.pdf', 'Transcript of Undergraduate Degree', '2011-12-15 02:00:13'),
(533, 2, 151, 'MOTIVATION LETTER.pdf', 'MOTIVATION LETTER', '2011-12-16 08:30:44'),
(534, 3, 151, 'IRB_ELIGIBILITY AKNOWLEDGE FORM.pdf', 'ELEGIBILIY AKNOWLEDGE FORM', '2011-12-16 08:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_ethical_issues`
--

CREATE TABLE IF NOT EXISTS `jos_phd_ethical_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_phd_ethical_issues`
--

INSERT INTO `jos_phd_ethical_issues` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Research involving interventions in humans or research using human materials (primary cells, tissues, DNA, RNA, etc., but NOT established cell lines!)', 'Research involving humans', 1),
(2, 'Research on experimental (vertebrate) animals', 'Research on animals', 2),
(3, 'Research involving embryonic stem cells', 'Research involving embryonic stem cells', 3),
(4, 'Research involving biological agents including, genetically modified organisms.', 'Research involving biological agents including, genetically modified organisms.', 4),
(5, 'Research involving data protection and privacy', 'Research involving data protection and privacy', 5);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_genders`
--

CREATE TABLE IF NOT EXISTS `jos_phd_genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  `short_description` varchar(10) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phd_genders`
--

INSERT INTO `jos_phd_genders` (`id`, `description`, `short_description`, `order`) VALUES
(2, 'Female', 'Female', 2),
(1, 'Male', 'Male', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_logs`
--

CREATE TABLE IF NOT EXISTS `jos_phd_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

--
-- Dumping data for table `jos_phd_logs`
--

INSERT INTO `jos_phd_logs` (`id`, `applicant_id`, `text`, `old_status_id`, `new_status_id`, `modified`) VALUES
(1, 14, 'Dear Tamanna Rahman,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:38:47'),
(2, 35, 'Dear Yanin Jaiyen,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:39:13'),
(3, 37, 'Dear sandeep gholap,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:39:37'),
(4, 46, 'Dear Asad Mumtaz,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:39:57'),
(5, 64, 'Dear DANIEL SORONELLAS VALLESPÍ,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:40:19'),
(6, 67, 'Dear Israel Blasco Ruano,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:40:41'),
(7, 73, 'Dear Amol Dehade,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:41:07'),
(8, 74, 'Dear Irene Pradas Barriga,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:41:25'),
(9, 78, 'Dear Adeel  Asghar,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:41:42'),
(10, 86, 'Dear Akash Sharma,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:42:06'),
(11, 17, 'Dear CLAUDIA ESCALE GARRELL,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:42:31'),
(12, 23, 'Dear vinodkumar gajendran,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:42:55'),
(13, 33, 'Dear Ester Reina Torres,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:43:15'),
(14, 48, 'Dear Abdelghani Kharbouch,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:44:03'),
(15, 49, 'Dear Samuel Álvarez,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:44:27'),
(16, 59, 'Dear Bagher Golzarroshan,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:44:53'),
(17, 66, 'Dear Marcela Roxana Del Pozo,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:45:19'),
(18, 68, 'Dear Carole Sousa,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:45:42'),
(19, 70, 'Dear ROHIT BANSAL,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:46:01'),
(20, 87, 'Dear Manu Jain,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:46:36'),
(21, 88, 'Dear Ulises Rodriguez,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:47:02'),
(22, 90, 'Dear Mugdha Sawant,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:47:23'),
(23, 93, 'Dear Elena Fillat Acín,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:47:49'),
(24, 94, 'Dear Marta Cases Villar,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:48:07'),
(25, 97, 'Dear MARTA BOMBARDÓ AYATS ,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:48:38'),
(26, 105, 'Dear Aura Dulcinea Herrera Martinez,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:48:57'),
(27, 109, 'Dear SANIRBANDHA CHOUDHURY,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:49:16'),
(28, 112, 'Dear Ilario Mennella,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:49:39'),
(29, 120, 'Dear Raquel Barros,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:50:01'),
(30, 113, 'Dear Pankaj Kalita,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:50:36'),
(31, 117, 'Dear Ivana Cosic,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:50:57'),
(32, 119, 'Dear Annick Giral,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2011 and the first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 2, 3, '2011-06-20 06:51:21'),
(33, 14, 'Dear Tamanna Rahman,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:22:07'),
(34, 23, 'Dear vinodkumar gajendran,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:22:59'),
(35, 33, 'Dear Ester Reina Torres,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:23:29'),
(36, 35, 'Dear Yanin Jaiyen,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:23:53'),
(37, 37, 'Dear sandeep gholap,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:24:09'),
(38, 46, 'Dear Asad Mumtaz,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:24:29'),
(39, 48, 'Dear Abdelghani Kharbouch,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:24:58'),
(40, 49, 'Dear Samuel Álvarez,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:25:18'),
(41, 59, 'Dear Bagher Golzarroshan,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:25:39'),
(42, 64, 'Dear DANIEL SORONELLAS VALLESPÍ,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:26:00'),
(43, 66, 'Dear Marcela Roxana Del Pozo,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:26:22'),
(44, 67, 'Dear Israel Blasco Ruano,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:26:44'),
(45, 68, 'Dear Carole Sousa,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:27:14'),
(46, 70, 'Dear ROHIT BANSAL,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:27:35'),
(47, 73, 'Dear Amol Dehade,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:28:03'),
(48, 74, 'Dear Irene Pradas Barriga,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:28:18'),
(49, 78, 'Dear Adeel  Asghar,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:28:50'),
(50, 86, 'Dear Akash Sharma,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:29:20'),
(51, 87, 'Dear Manu Jain,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:29:47'),
(52, 88, 'Dear Ulises Rodriguez,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:30:10'),
(53, 90, 'Dear Mugdha Sawant,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:30:35'),
(54, 93, 'Dear Elena Fillat Acín,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:30:59'),
(55, 94, 'Dear Marta Cases Villar,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:31:32'),
(56, 97, 'Dear MARTA BOMBARDÓ AYATS ,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:31:50'),
(57, 105, 'Dear Aura Dulcinea Herrera Martinez,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:32:14'),
(58, 109, 'Dear SANIRBANDHA CHOUDHURY,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:32:34'),
(59, 111, 'Dear Davide Pisu,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:32:59'),
(60, 113, 'Dear Pankaj Kalita,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:33:16'),
(61, 117, 'Dear Ivana Cosic,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:33:50'),
(62, 119, 'Dear Annick Giral,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:34:09'),
(63, 120, 'Dear Raquel Barros,\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The first part of the selection process has now been completed.\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\nBest regards,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 3, 3, '2011-07-11 08:34:33'),
(64, 25, 'Dear Fatemeh  Zare,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:43:29'),
(65, 91, 'Dear Fabian Gruß,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:44:46'),
(66, 77, 'Dear Cristina-Ileana Ureche,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:45:13'),
(67, 60, 'Dear Simona Francia,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:45:28'),
(68, 103, 'Dear Francesca Nardi,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:45:38'),
(69, 65, 'Dear Victor Martin,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:45:47'),
(70, 8, 'Dear Daniel Byrom,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:46:38'),
(71, 61, 'Dear Sumit Jaiswal,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 4, 5, '2011-07-26 10:46:50'),
(72, 61, 'Dear Sumit Jaiswal,\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\nYours sincerely,\nIRB Barcelona PhD Programme\nThis is an automatically generated message. Please do not answer.', 5, 5, '2011-08-03 07:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_programmes`
--

CREATE TABLE IF NOT EXISTS `jos_phd_programmes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `short_description` varchar(50) NOT NULL,
  `user_username` varchar(150) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_phd_programmes`
--

INSERT INTO `jos_phd_programmes` (`id`, `description`, `short_description`, `user_username`, `order`) VALUES
(1, 'Miquel Coll: Proteins, Nucleic Acids and Molecular Machines', 'Miquel Coll: Proteins, Nucleic Acids and Molecular', 'mcoll', 1),
(2, 'Antonio Zorzano: Heterogenic and Polygenic Diseases', 'Antonio Zorzano: Heterogenic and Polygenic Disease', 'azorzano', 2),
(3, 'Carme Caelles: Cell Signalling', 'Carme Caelles: Cell Signalling', 'ccaelles', 3),
(4, 'Lluis Ribas de Pouplana: Gene Translation Laboratory', 'Lluis Ribas de Pouplana: Gene Translation Laborato', 'lribas', 4),
(5, 'Eduardo Soriano: Neurobiology and Regeneration', 'Eduardo Soriano: Neurobiology and Regeneration', 'esoriano', 5),
(6, 'Ramon Eritja: Nucleic Acid Chemistry', 'Ramon Eritja: Nucleic Acid Chemistry', 'reritja', 6),
(8, 'Antoni Riera: Asymmetric Synthesis', 'Antoni Riera: Asymmetric Synthesis', 'ariera', 7),
(9, 'Maria J. Macias: Protein NMR Spectroscopy Laboratory', 'Maria J. Macias: Protein NMR Spectroscopy Laborato', 'mmacias', 8),
(10, 'Antonio Celada: Gene Expression ', 'Antonio Celada: Gene Expression ', 'acelada', 9);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_referees`
--

CREATE TABLE IF NOT EXISTS `jos_phd_referees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `upload_code` varchar(50) DEFAULT NULL,
  `sent_mail` date DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=362 ;

--
-- Dumping data for table `jos_phd_referees`
--

INSERT INTO `jos_phd_referees` (`id`, `applicant_id`, `firstname`, `lastname`, `email`, `filename`, `upload_code`, `sent_mail`, `modified`) VALUES
(1, 1, 'Roberto', 'Bartolome', 'roberto.bartolome.medina@gmail.com', 'h4.png', '1008107154', '2011-04-28', '2011-04-28 13:07:15'),
(4, 4, 'Stephan', 'Reshkin', 'reshkin@biologia.uniba.it', NULL, '508331515', '2011-05-11', '2011-05-11 15:48:55'),
(5, 4, 'Robert', 'Gatenby', 'robert.gatenby@moffitt.org', 'Khalid Alfarouk LOR 5.6.11.pdf', '1686769389', '2011-05-09', '2011-05-09 13:47:34'),
(6, 4, 'Toni', 'Gabaldon', 'toni.gabaldon@crg.eu', 'letter_support_Khalid.pdf', '115595185', '2011-05-09', '2011-05-09 12:31:56'),
(7, 4, 'Carlo', 'Maley', 'carlo.maley@ucsf.edu', 'Khalid-Maley-Barcelona-rec.pdf', '2076076934', '2011-05-09', '2011-05-11 04:50:05'),
(8, 4, 'Stefano', 'Fais', 'stefano.fais@iss.it', NULL, '1089171885', '2011-05-11', '2011-05-11 15:48:48'),
(297, 37, 'Milind', 'Nikalje', 'mmilind_1221@rediffmail.com', 'ref.letter Dr. Milind Nikalje.pdf', '487600947', NULL, '2011-06-03 08:00:14'),
(11, 12, 'Rodrigo ', 'Abonía Gonzalez', 'rodrigo.abonia@correounivalle.edu.co', NULL, '832857896', '2011-05-09', '2011-05-09 17:00:03'),
(12, 12, 'Luz Marina', 'Jaramillo Gómez', 'luz.m.jaramillo@correounivalle.edu.co', NULL, '1906996981', '2011-05-09', '2011-05-09 17:01:26'),
(13, 17, 'Stephane', 'Paris', 'stephane.paris@almirall.com', 'Recommendation letter_Claudia Escale_ IRB.doc', '769146586', '2011-05-18', '2011-06-01 14:58:17'),
(15, 17, 'Jaume', 'Farres', 'Jaume.Farres@uab.cat', NULL, '698414978', '2011-05-18', '2011-05-18 00:31:44'),
(16, 18, 'Vesela ', 'Maleska - Ivanovska', 'veselavan@yahoo.com', 'Recommendation letterKliment Sandjakoski.pdf', '23615599', '2011-05-10', '2011-05-11 09:35:40'),
(17, 18, 'Mirko', 'Spiroski', 'mirko_spiroski@yahoo.com', 'Reference.pdf', '43396666', '2011-05-10', '2011-05-11 09:47:06'),
(18, 13, 'Paolo', 'Iadarola', 'piadarol@unipv.it', NULL, '42963665', '2011-05-10', '2011-05-10 21:16:33'),
(295, 20, 'Aldo ', 'Galeone', 'galeone@unina.it', 'Dr.galeone.pdf', '1053994202', NULL, '2011-06-03 07:53:58'),
(22, 13, 'Edda', 'De Rossi', 'edda.derossi@unipv.it', 'Battaglia_Reference.pdf', '537794098', '2011-05-12', '2011-05-27 19:57:59'),
(23, 23, 'Julia', 'Rey-Nores', 'jreynores@uwic.ac.uk', NULL, '1040767464', '2011-05-11', '2011-05-11 23:06:12'),
(24, 23, 'Delia', 'Ripley', 'dripley@uwic.ac.uk', NULL, '147796294', '2011-05-11', '2011-05-11 23:06:16'),
(25, 23, 'sendhilvel', 'vaithiyanathan', 'veltnau@rediffmail.com', NULL, '1153230514', '2011-05-11', '2011-05-11 23:07:02'),
(26, 27, 'Philip', 'Bonner', 'philip.bonner@ntu.ac.uk', NULL, '1850443905', '2011-05-12', '2011-05-12 11:56:04'),
(27, 27, 'Prabakaran', 'Narayanappa', 'prabakaran.narayanappa@ntu.ac.uk', NULL, '857208777', '2011-05-13', '2011-05-13 15:49:01'),
(28, 30, 'Carme', 'Brosa Ballesteros', 'carme.brosa@iqs.url.edu', NULL, '1189735737', '2011-05-22', '2011-05-22 14:05:50'),
(29, 30, 'David', 'Sánchez García', 'david.sanchez@iqs.url.edu', NULL, '369441101', '2011-05-22', '2011-05-22 14:05:53'),
(30, 33, 'Gemma', 'Frias', 'gemma.fabrias@iqac.csic.es', NULL, '1022389532', '2011-05-25', '2011-05-25 18:19:56'),
(31, 33, 'Gabi', 'Braun', 'G.Braun@bristol.ac.uk', NULL, '1374944367', '2011-05-31', '2011-05-31 10:12:27'),
(32, 14, 'Miguel', 'Camara', 'Miguel.Camara@nottingham.ac.uk', NULL, '1243635464', '2011-05-14', '2011-05-14 11:51:33'),
(33, 14, 'Mathew', 'Diggle', 'mathew.diggle@nuh.nhs.uk', NULL, '2010282100', '2011-05-14', '2011-05-14 11:51:41'),
(34, 26, 'Vladimir ', 'Makara ', 'V_A_Makara@univ.kiev.ua', NULL, '1335386390', '2011-05-14', '2011-05-14 11:46:27'),
(35, 26, 'Yury', 'Pivovarenko', 'shevchenko@univ.kiev.ua', NULL, '1312995735', NULL, '2011-05-14 11:46:16'),
(36, 14, 'Karl', 'Wooldridge', 'Karl.wooldridge@nottingham.ac.uk', NULL, '2098819642', '2011-05-14', '2011-05-14 11:57:01'),
(37, 34, 'Thiru', 'Sridhar', 'tmsridhar@gmail.com', 'karthik namachivayam.jpg', '54010390', '2011-05-14', '2011-05-30 02:11:51'),
(38, 35, 'Paul', 'Williams', 'paul.williams@nottingham.ac.uk', 'Yanin Jaiyen Reference.pdf', '1914904661', '2011-05-15', '2011-05-24 21:51:15'),
(39, 35, 'Sukathida', 'Ubol', 'scsul@mahidol.ac.th', NULL, '147357575', '2011-05-18', '2011-05-18 21:29:01'),
(41, 37, 'DIGIMBER', 'ZINZAD', 'zinzaddg@yahoo.co.in', 'ref_-1.pdf', '1370169532', '2011-05-24', '2011-05-24 12:45:54'),
(42, 39, 'FRANCESCO', 'NONNIS MARZANO', 'francesco.nonnismarzano@unipr.it', NULL, '241649797', '2011-05-15', '2011-05-15 19:24:34'),
(44, 41, 'Jose Luis', 'Blázquez Caeiro', 'b.caeiro@yahoo.com', 'IRB SUSANA EIUBES GONZALEZ.doc', '926613809', '2011-05-16', '2011-05-29 17:09:32'),
(298, 47, 'Manuela', 'Helmer-Citterich', 'citterich@uniroma2.it', 'NinoSpataro_IRB.pdf', '1007621076', NULL, '2011-06-03 08:13:18'),
(45, 43, 'Rosmarie ', 'Hardmeier', 'rhardm89@live.at', 'Ref.letter Claudia Garcia IRB.docx', '775106833', '2011-05-16', '2011-05-17 21:10:21'),
(46, 43, 'Joaquim', 'Vives Armengol', 'jvives@bstcat.net', 'Claudia Fernanda Garca Castro.pdf', '1039354547', '2011-05-16', '2011-05-24 11:40:59'),
(47, 36, 'Lihua', 'Hu', '839157894@qq.com', NULL, '1078260577', NULL, '2011-05-17 00:26:34'),
(48, 36, 'Yirong', 'Li', '1283017740@qq.com', NULL, '381418779', NULL, '2011-05-17 00:27:35'),
(49, 14, 'Miguel ', 'Cámara', 'miguel.camara@nottingham.ac.uk', 'Tamanna Rahman-Barcelona 2.pdf', '309266854', NULL, '2011-05-17 08:00:19'),
(153, 34, 'Ramaya', 'Sreenivasan ', 'rssvasan1973@yahoo.co.in', NULL, '1145222713', '2011-05-30', '2011-05-30 09:09:39'),
(51, 46, 'Prof Dr Mutti-ullah', 'Khan', 'muttiullahmutti@gmail.com', NULL, '1720308426', NULL, '2011-05-17 20:20:11'),
(52, 46, 'Prof Dr Sadaqat', 'Ali Khan', 'drsadaqat@hotmail.com', NULL, '186458676', NULL, '2011-05-17 20:24:06'),
(53, 31, 'Robert', 'Kypta', 'rkypta@cicbiogune.es', 'Robert Kypta letter for Raffaellla signed.pdf', '91950927', '2011-05-17', '2011-05-18 14:55:21'),
(54, 31, 'Olivier', 'Sordet', 'sordet.olivier@claudiusregaud.fr', NULL, '554898933', '2011-05-30', '2011-05-30 20:58:04'),
(299, 47, 'Gabriele', 'Ausiello', 'gabriele.ausiello@uniroma2.it.it', 'Spataro recommendation letter.pdf', '1122700553', NULL, '2011-06-03 08:15:07'),
(300, 51, 'Alejandro', 'Hochkoeppler', 'hochko@ms.fci.unibo.it.it', 'Dr.Hochkoepper.pdf', '408479284', NULL, '2011-06-03 08:28:11'),
(58, 49, 'Clementina ', 'Rodellar', 'rodellar@unizar.es', NULL, '1316270121', '2011-05-23', '2011-05-23 10:58:27'),
(59, 49, 'Isabel ', 'Marzo', 'imarzo@unizar.es', NULL, '1699784690', '2011-05-23', '2011-05-23 10:58:32'),
(60, 51, 'Stefano ', 'Ciurli ', 'stefano.ciurli@unibo.it', 'IRB_Berardi.pdf', '1502328594', '2011-05-18', '2011-05-20 14:04:16'),
(62, 51, 'Diana ', 'Di Gioia ', 'diana.digioia@unibo.it', 'Recommendation letter-Andrea Berardi.doc', '984018973', '2011-05-27', '2011-05-27 13:54:19'),
(301, 60, 'Roberto ', 'Tirindelli', 'robertin@unipr.it.it', 'Simona Francia.doc', '1742279424', NULL, '2011-06-03 08:37:19'),
(63, 53, 'Antonio', 'Contestabile', 'antonio.contestabile@unibo.it', 'reference letter.rtfd.zip', '668438832', '2011-05-31', '2011-06-01 15:30:13'),
(64, 53, 'Maria Gabriella', 'Campadelli', 'gabriella.campadelli@unibo.it', 'Cannizzaro ester .doc', '1546338306', '2011-05-27', '2011-05-30 12:10:20'),
(65, 42, 'Anne', 'Leppänen', 'anne.leppanen@helsinki.fi', NULL, '1232035998', '2011-05-22', '2011-05-22 19:38:29'),
(66, 42, 'Miquel', 'Llobera', 'millobera@ub.edu', 'certificat 2011 ANGL.pdf', '397880314', '2011-05-22', '2011-05-30 12:47:36'),
(67, 42, 'Eduardo', 'Osinaga', 'eosinaga@fmed.edu.uy', NULL, '2065457473', '2011-05-22', '2011-05-22 19:38:19'),
(68, 56, 'Charles', 'Durand', 'cdurand@snv.jussieu.fr', NULL, '965654672', '2011-05-27', '2011-05-27 11:53:18'),
(69, 59, 'Archana', 'Giri', 'archanagiriin@jntuh.ac.in', NULL, '1852563300', '2011-05-28', '2011-05-28 06:19:57'),
(102, 59, 'Uma', 'A', 'vedavathi1@gmail.com', NULL, '129585118', '2011-05-28', '2011-05-28 06:20:03'),
(71, 61, 'Erik ', 'Storkebaum', 'erik.storkebaum@mpi-muenster.mpg.de', NULL, '784087839', NULL, '2011-05-23 01:02:40'),
(121, 79, 'Alison', 'Hulme', 'Alison.Hulme@ed.ac.uk', NULL, '539450153', '2011-06-01', '2011-06-01 11:37:37'),
(74, 6, 'Zbigniew', 'Madeja', 'z.madeja@uj.edu.pl', NULL, '1242473794', '2011-05-23', '2011-05-23 08:11:24'),
(75, 43, 'Rosmarie', 'Hardmeier ', 'rhardmeier@embaperuaustria.at', 'Ref  letter Claudia Garcia Castro.pdf', '1831430669', NULL, '2011-05-23 16:02:10'),
(76, 29, 'Helmout', 'Modjtahedi', 'h.modjtahedi@kingston.ac.uk', 'Carolina Alves PhD application to Barcelona 24 May 2011.pdf', '688010600', '2011-05-23', '2011-05-24 09:08:48'),
(78, 66, 'Marcela ', 'Brocco', 'marcelabrocco2002@gmail.com', 'RefLett Brocco to Del Pozo.pdf', '549423423', '2011-06-20', '2011-06-20 19:38:35'),
(79, 66, 'Clara Isabel', 'Marín-Briggiler', 'clarisamarin@gmail.com', 'letter of recommendation for M Del Pozo.pdf', '462805224', '2011-05-24', '2011-05-29 19:33:12'),
(80, 63, 'Elzbieta', 'Glaser', 'e_glaser@dbb.su.se', NULL, '212583975', '2011-05-30', '2011-05-30 07:09:04'),
(81, 6, 'Tytus', 'Bernas', 'tytusbernas@rcsi.ie', '3005_j_latasiewicz_ref_lett.pdf', '375516949', '2011-05-24', '2011-05-31 15:55:29'),
(82, 23, 'Julia', 'Rey-Nores', 'jreynores@uwic.ac.uk', 'letter Julia Rey.pdf', '1987501735', NULL, '2011-05-24 08:22:11'),
(83, 25, 'Anna', 'Aragay', 'aarbmc@ibmb.csic.es', 'fatemehletter.pdf', '1387442131', '2011-05-24', '2011-05-30 15:53:23'),
(311, 53, 'Maria Gabriella', 'Campadelli', 'gabriella.campadelli@unibo.it', 'Cannizzaro ester letterheaded.pdf', '242493498', NULL, '2011-06-07 09:52:33'),
(85, 48, 'Amin', 'Laglaoui', 'laglaouiamin@yahoo.fr', NULL, '1294349346', NULL, '2011-05-24 10:17:13'),
(86, 48, 'Olga', 'Sánchez', 'olga.sanchez@uab.es', NULL, '1311743714', NULL, '2011-05-24 10:18:16'),
(88, 67, 'Matilde', ' Parreño', 'mparreno@santpau.es', 'Letter of recomendation-_Israel Blasco.doc', '1367108933', '2011-05-26', '2011-06-01 20:12:51'),
(90, 69, 'Bozena', 'Szafranska', 'szafran@uwm.edu.pl', 'REF_Wardzynska_ANG.pdf', '882439450', '2011-05-27', '2011-06-01 11:32:42'),
(91, 69, 'Grzegorz', 'Panasiewicz', 'panasg@uwm.edu.pl', 'Reference Letter Wardzynska.pdf', '700471518', '2011-05-27', '2011-06-01 07:07:58'),
(92, 70, 'Prof. Asit K.', 'Chakraborti', 'akchakraborti@niper.ac.in', NULL, '1780906541', '2011-05-29', '2011-05-29 11:07:44'),
(93, 70, 'Prof. K. P. R. ', 'Kartha', 'rkartha@niper.ac.in', NULL, '991407099', '2011-05-31', '2011-05-31 19:01:16'),
(94, 60, 'Pasquale', 'Chieco', 'pasquale.chieco@unibo.it', 'RefSimonaFrancia_Jorda5_11.pdf', '1054098329', '2011-05-26', '2011-05-30 08:57:12'),
(95, 67, 'Ramon', 'Mangues', 'rmangues@santpau.es', '2011 R.Mangues Reference letter Isreal Blasco PhD programme.doc', '658526653', '2011-05-26', '2011-05-31 12:56:52'),
(97, 41, 'José Carlos', 'Zapata Blabío', 'c.zapata@usc.es', 'Ref Letter Eibes Gonz.pdf', '666930380', NULL, '2011-05-25 10:39:48'),
(98, 63, 'Mª Ángeles ', 'Urbaneja', 'gbpurarm@lg.ehu.es', NULL, '1867736801', '2011-05-30', '2011-05-30 07:15:05'),
(99, 65, 'Alexander', 'Laurentin', 'alexander.laurentin@ciens.ucv.ve', NULL, '829624017', '2011-05-30', '2011-05-30 17:33:44'),
(100, 72, 'Dr. Suresh B.', 'waghmode', 'suresh@chem.unipune.ac.in', 'Recoletter.pdf', '678673439', '2011-05-26', '2011-05-26 12:53:23'),
(101, 72, 'Prof. Mukund G.', 'Kulkarni', 'mgkulkarni@chem.unipune.ac.in', 'Recommendation1.pdf', '1322713177', '2011-05-27', '2011-05-28 07:57:54'),
(103, 59, 'R .S', 'Rathore ', 'ravindranath_rathore@yahoo.com', 'Armin_recommendation_letter_PhD_program.jpg', '2077302447', '2011-05-28', '2011-05-30 07:04:56'),
(104, 75, 'Rodolfo', 'Márquez', 'R.Marquez@chem.gla.ac.uk', NULL, '2117527850', '2011-05-26', '2011-05-26 07:47:07'),
(105, 75, 'Antonio ', 'Delgado', 'antonio.delgado@ub.edu', 'recomendacin-Silvia.pdf', '755809360', '2011-05-26', '2011-05-27 06:25:47'),
(106, 35, 'Sukathida', 'Ubol', 'scsul@mahidol.ac.th', 'recommendation-Yanin.docx', '1418663453', NULL, '2011-05-26 08:39:53'),
(271, 75, 'Rodolfo', 'Márquez', 'R.Marquez@chem.gla.ac.uk', 'SilviaOrgueGassol-IRB.pdf', '1060932547', NULL, '2011-06-02 09:01:47'),
(270, 70, 'Dr.K.P.Ravindranathan', 'Kartha', 'rkartha@niper.ac.in', 'Recommendation for Rohit Bansal.pdf', '2038974453', NULL, '2011-06-02 09:00:12'),
(107, 76, 'Carme ', 'Lluis Biset', 'clluis@ub.edu', NULL, '209051885', '2011-05-30', '2011-05-30 11:32:32'),
(108, 76, 'M. Dolores', 'Pujol Dilme', 'mdpujol@ub.edu', 'Daniel Perez-2011.pdf', '1021506453', '2011-05-30', '2011-05-30 12:11:08'),
(109, 65, 'Elizabeth', 'Valdivieso', 'elizabeth.valdivieso@ciens.ucv.ve', NULL, '246155695', '2011-05-30', '2011-05-30 17:33:57'),
(110, 20, 'Meritxell', 'Carrio', 'mcarrio@cmrb.eu', 'letter Meritxell Carrio.pdf', '1625050788', NULL, '2011-05-26 15:55:09'),
(111, 73, 'Ramdas ', 'Borhade', 'ramdas.b@saiadvantium.com', 'Amol.pdf', '1227775447', '2011-05-26', '2011-05-30 13:47:05'),
(211, 73, 'Anil', 'Bhise', 'adbhise74@gmail.com', 'Recommendation Letter.pdf', '1763177694', '2011-05-31', '2011-05-31 14:46:30'),
(113, 52, 'Carlos Javier', 'Almeciga Diaz', 'donisaid@yahoo.com', 'Mauro Alejandro Rodriguez.pdf', '1038031338', '2011-06-02', '2011-06-02 21:24:49'),
(114, 77, 'Cosmin', 'Saveanu', 'cosmin.saveanu@pasteur.fr', NULL, '1244564798', NULL, '2011-05-27 08:30:32'),
(115, 77, 'Stefan', 'Szedlacsek', 'stefan@biochim.ro', NULL, '1304820', NULL, '2011-05-27 08:33:17'),
(116, 49, 'Clementina ', 'Rodellar', 'rodellar@unizar.es', 'CARTA DE PRESENTACIN A FAVOR DE  SAMUEL LVAREZ ARGUEDAS.pdf', '1182566914', NULL, '2011-05-27 09:44:52'),
(117, 49, 'Isabel', 'Marzo', 'imarzo@unizar.es', 'Carta SamuelIRB.pdf', '976094915', NULL, '2011-05-27 09:46:06'),
(118, 56, 'Anne-Marie', 'Pret', 'pret@cgm.cnrs-gif.fr', NULL, '976566812', '2011-05-27', '2011-05-27 11:53:23'),
(119, 61, 'Gilbert', 'Weidinger', 'gilbert.weidinger@biotec.tu-dresden.de', NULL, '1379240102', '2011-05-27', '2011-05-27 14:14:19'),
(122, 79, 'Dominic', 'Campopiano', 'Dominic.Campopiano@ed.ac.uk', NULL, '1492019249', '2011-06-01', '2011-06-01 11:37:40'),
(123, 68, 'Jorge', 'Pedrosa', 'jpedrosa@ecsaude.uminho.pt', NULL, '581632576', '2011-05-27', '2011-05-27 16:06:42'),
(124, 68, 'margarida', 'saraiva', 'msaraiva@ecsaude.uminho.pt', NULL, '1306063010', NULL, '2011-05-27 16:05:55'),
(125, 68, 'António Gil', 'Castro', 'acastro@ecsaude.uminho.pt', NULL, '1917602039', '2011-05-27', '2011-05-27 16:06:53'),
(126, 82, 'Jorge', 'Lloberas', 'jorge.lloberas@irbbarcelona.org', 'Carta Joan Tur.pdf', '1227209091', '2011-05-27', '2011-05-31 17:16:32'),
(127, 82, 'Mònica', 'Comalada', 'monica.comalada@irbbarcelona.org', 'Recommendation letter for JUAN TUR.pdf', '419325337', '2011-05-27', '2011-05-31 10:11:23'),
(139, 29, 'Duarte ', 'Barral', 'duarte.barral@fcm.unl.pt', NULL, '1027086845', '2011-05-30', '2011-05-30 12:44:38'),
(129, 71, 'Lakhwant', 'Singh', 'lakhwant@yahoo.com', NULL, '1722581368', NULL, '2011-05-28 06:25:51'),
(302, 20, 'Ciro Roberto', 'Rinaldi', 'ciro.rinaldi@ulh.nhs.uk', 'Dr.Rinaldi ref.letter.pdf', '1586987740', NULL, '2011-06-03 08:44:14'),
(131, 64, 'Ester', 'Goutan Roura', 'ester.goutan@uvic.cat', NULL, '2012035821', '2011-05-28', '2011-05-28 11:06:03'),
(132, 64, 'Antonio', 'Gomez Moruno', 'antonio.gomez@uvic.cat', NULL, '1421793008', '2011-05-28', '2011-05-28 11:06:08'),
(133, 83, 'Philippos ', 'Patsalis', 'patsalis@cing.ac.cy', 'Stelios Pavlou 01 06 11.pdf', '534881017', '2011-05-30', '2011-06-02 12:31:33'),
(135, 85, 'Christian', 'Maercker', 'c.maercker@hs-mannheim.de', NULL, '1364778172', NULL, '2011-05-28 17:32:15'),
(136, 85, 'Dirk', 'Breitkreutz', 'dirkbtz@gmx.de', NULL, '736509446', NULL, '2011-05-28 17:33:09'),
(137, 86, 'Dr. Mahesh ', 'C. Kaushik', 'mkaushik@resourcelifesciences.com', 'mahesh reco.pdf', '1578149279', '2011-05-31', '2011-06-02 10:15:22'),
(188, 78, 'Marko', 'Kallio', 'marko.kallio@vtt.fi', NULL, '269862112', '2011-05-30', '2011-05-30 16:51:09'),
(142, 87, 'Dr. Gulab', 'Kanwar', 'gulabcp@gmail.com', NULL, '1098945707', '2011-05-29', '2011-05-29 16:38:15'),
(303, 91, 'Yves', 'Muller', 'ymuller@biologie.uni-erlangen.de.de', 'Referenz_Gruss.pdf', '884856391', NULL, '2011-06-03 09:03:54'),
(143, 89, 'Dr. Balaram ', 'Mukhopadhyay', 'sugarnet73@hotmail.com', 'Nayan IRB 1.pdf', '1479254226', '2011-05-29', '2011-05-30 07:00:09'),
(144, 89, 'Dr. Subhajit', 'Bandyopadhyay', 'sb1@iiserkol.ac.in', 'Nayan IRB SB.pdf', '2128975986', '2011-05-29', '2011-05-30 07:44:05'),
(145, 80, 'Alba', 'Chimirri', 'chimirri@pharma.unime.it', NULL, '2115339895', '2011-06-08', '2011-06-08 00:13:04'),
(146, 80, 'Jorge ', 'Sànchez Quesada', 'jsanchez@noscira.com', 'MCortigiani_Ref_Lett_IRB.pdf', '92075877', '2011-06-02', '2011-06-03 07:57:51'),
(147, 88, 'Agustin', 'Badillo', 'badillo@ipn.mx', NULL, '235473210', NULL, '2011-05-29 21:18:30'),
(148, 88, 'Irma', 'Silva', 'irma.silvazolezi@rdls.nestle.com', NULL, '595094112', NULL, '2011-05-29 21:20:51'),
(149, 78, 'Mikko', 'Turunen', 'mikko.turunen@uef.fi', NULL, '636318584', '2011-05-30', '2011-05-30 08:40:28'),
(151, 90, 'Sorab ', 'Dalal', 'sdalal@actrec.gov.in', 'Mugdha letter 2.doc', '1910522904', '2011-05-30', '2011-05-30 10:49:19'),
(152, 90, 'Prashant', 'Ratnaparkhi', 'prashant.ratnaparkhi@xaviers.edu', 'mudha.doc', '562702235', '2011-05-30', '2011-06-01 18:42:55'),
(154, 34, 'Panchamurthy', 'Rajasekar', 'rajasekar.panchamurthy@gmail.com', NULL, '1816172008', '2011-05-30', '2011-05-30 09:10:44'),
(155, 68, 'Jorge', 'Pedrosa', 'jpedrosa@ecsaude.uminho.pt', 'Carole Sousas IRB PhD Application.pdf', '1956215375', NULL, '2011-05-30 09:29:58'),
(156, 68, 'Margarida ', 'Saraiva', 'msaraiva@ecsaude.uminho.pt', 'Rec Letter Carole Sousa_BarcelonaPhD.pdf', '893285104', NULL, '2011-05-30 09:32:11'),
(157, 30, 'David', 'Sánchez -García', 'david.sanchez@iqs.url.edu', 'RL-Pol Sanlleh.pdf', '1684215346', NULL, '2011-05-30 09:44:24'),
(158, 68, 'António Gil', 'Pereira Castro', 'acastro@ecsaude.unimho.pt', 'Rec Letter Carole Sousa_BarcelonaPhD IRB.pdf', '677607410', NULL, '2011-05-30 09:50:01'),
(161, 91, 'Madhumati', 'Sevvana', 'msevvana@biologie.uni-erlangen.de', NULL, '241278607', '2011-05-31', '2011-05-31 09:52:47'),
(304, 91, 'Madhumati', 'Sevvana', 'msevvanna@biologie.uni-erlangen.de', 'fabian_recommendation12 small.pdf', '1020098735', NULL, '2011-06-03 09:12:21'),
(162, 92, 'Juan', 'Valcarcel', 'juan.valcarcel@crg.es', 'Davide Rubbini rec may 11.doc', '841303672', '2011-05-30', '2011-05-30 12:58:56'),
(163, 92, 'Alessandro', 'Ripalti', 'alessandro.ripalti@unibo.it', 'Presentazione Dr Rubbini.pdf', '1055981906', '2011-05-30', '2011-05-31 21:15:49'),
(164, 8, 'Chris', 'Braddock', 'daniel.byrom09@imperial.ac.uk', NULL, '2070584638', '2011-05-30', '2011-05-30 11:46:24'),
(165, 74, 'Miguel Angel', 'Chinchetru', 'machim@unileon.es', NULL, '1643074788', '2011-05-31', '2011-05-31 19:14:41'),
(167, 8, 'Jason', 'Hallett', 'daniel.byrom09@imperial.ac.uk', NULL, '1388553591', '2011-05-31', '2011-05-31 11:46:01'),
(168, 74, 'Mª Teresa ', 'Blay Olivè', 'mteresa.blay@urv.cat', NULL, '794441679', '2011-05-30', '2011-05-30 12:21:37'),
(169, 95, 'Santiago', 'Vega', 'svega@uch.ceu.es', NULL, '1521266835', NULL, '2011-05-30 13:34:33'),
(170, 95, 'Jose', 'Terrado', 'jterrado@uch.ceu.es', NULL, '1025492054', NULL, '2011-05-30 13:34:53'),
(171, 95, 'Angel', 'García', 'angel@uch.ceu.es', NULL, '1525326996', NULL, '2011-05-30 13:35:12'),
(172, 33, 'Gemma ', 'Fabrias', 'gemma.fabrias@iqac.csic.es', 'recom_let_Ester Reina.pdf', '485461168', NULL, '2011-05-30 13:46:20'),
(173, 76, 'Carme', 'Lluis', 'clluis@ub.edu', 'Daniel Perez.pdf', '1364994218', NULL, '2011-05-30 13:51:02'),
(174, 4, 'Stephan', 'J.Reshkin', 'reshkin@biologia.uniba.it', 'letter K O  Alfarouk.jpg', '1571460276', NULL, '2011-05-30 13:58:14'),
(175, 94, 'Santiago', 'Vega', 'svega@uch.ceu.es', NULL, '304062190', NULL, '2011-05-30 14:30:36'),
(176, 94, 'Angel', 'García', 'angel@uch.ceu.es', NULL, '668160407', NULL, '2011-05-30 14:30:58'),
(177, 94, 'Jose', 'Terrado', 'jterrado@uch.ceu.es', NULL, '1119944058', NULL, '2011-05-30 14:31:10'),
(178, 62, 'John', 'Rubery', 'John.RUBERY@ec.europa.eu', NULL, '1229723681', '2011-05-30', '2011-05-30 14:35:36'),
(179, 25, 'Josefa ', 'Badia', 'josefabadia@ub.edu', 'fatemeth.pdf', '1040696133', NULL, '2011-05-30 14:39:23'),
(180, 62, 'Werner ', 'Schiessl', 'Werner.Schiessl@ec.europa.eu', NULL, '242147276', '2011-05-30', '2011-05-30 14:50:27'),
(181, 59, 'Uma', 'A', 'vedavathi1@gmail.com', 'Recommendation letter from Dr1  A  Uma.pdf', '795226660', NULL, '2011-05-30 14:49:07'),
(182, 62, 'Ian ', 'Dadour', 'ian.dadour@uwa.edu.au', NULL, '1456354392', NULL, '2011-05-30 14:49:56'),
(183, 8, 'Chris', 'Braddock', 'daniel.byrom09@imperial.ac.uk', 'Byrom.pdf', '1630845566', NULL, '2011-05-30 14:54:33'),
(184, 8, 'Jason', 'Hallett', 'daniel.byrom09@imperial.ac.uk', 'Letterhead Danx.pdf', '1646375188', NULL, '2011-05-30 14:55:03'),
(317, 41, 'José Luis', 'Blázquez Caeiro', 'b.caeiro@yahoo.com', 'Mail y carta JL Blazquez.pdf', '1291800288', NULL, '2011-06-07 13:38:59'),
(186, 63, 'Elzbieta ', 'Glaser', 'e_glaser@dbb.su.se', 'Georgina Ormaza Hernndez.pdf', '1015583315', NULL, '2011-05-30 15:22:23'),
(187, 62, 'Ian', 'Dadour', 'ian.dadour@uwa.edu.au', 'Jones general ref.pdf', '195278192', NULL, '2011-05-30 15:29:18'),
(214, 103, 'Gianni', 'Cesareni', 'cesareni@uniroma2.it', NULL, '1349230504', '2011-06-01', '2011-06-01 10:25:42'),
(306, 97, 'Rafael', 'Maldonado ', 'rafael.maldonado@upf.edu.edu', 'Marta Bombardo_Report stage_Enero 2011.pdf', '762705493', NULL, '2011-06-03 09:25:24'),
(192, 97, 'Manuel ', 'Guzman', 'mgp@solea.quim.ucm.es', NULL, '596109657', NULL, '2011-05-30 20:54:11'),
(194, 93, 'Fernando ', 'Muñoz', 'fmunnozp@aragon.es', NULL, '130663993', '2011-06-02', '2011-06-02 21:50:20'),
(195, 93, 'Federico ', 'Fillat Estaqué', 'ffillat@ipe.csic.es', NULL, '10071503', '2011-06-02', '2011-06-02 21:50:29'),
(196, 98, 'Zoraida', 'Fernandez', 'zfernandez@gmail.com', 'Letter of Recommendation.pdf', '184847308', '2011-05-30', '2011-06-02 01:18:26'),
(197, 98, 'Ronaldo', 'Toma', 'rtkuna1@gmail.com', 'Recommendation letter  _Sergio Montaer_.pdf', '1106840152', '2011-05-30', '2011-06-02 01:59:55'),
(198, 99, 'C Gopi', 'Mohan', 'cmohan@niper.ac.in', NULL, '353540650', '2011-05-31', '2011-05-31 06:17:18'),
(199, 99, 'Abhay', 'Sangamwar', 'abhays@niper.ac.in', NULL, '1234477428', '2011-05-31', '2011-05-31 06:17:23'),
(200, 62, 'Werner', 'Schiessl', 'werner.schiessl@ec.europa.eu', 'Anya Jones - letter of recommendation.pdf', '2022763828', NULL, '2011-05-31 07:56:03'),
(316, 85, 'Christian', 'Maercker', 'c.maercker@hs-manheim.de', 'Fahrettin_Maercker110530.pdf', '502383337', NULL, '2011-06-07 11:35:17'),
(203, 30, 'Carme', 'Brosa Ballesteros', 'carme.brosa@iqs.url.edu', 'Recommendation Letter Pol Sanlleh.pdf', '966366481', NULL, '2011-05-31 08:49:57'),
(212, 104, 'Luísa', 'Azevedo', 'lazevedo@ipatimup.pt', 'Recomm letter E Martins.pdf', '104936675', '2011-05-31', '2011-06-01 11:15:56'),
(207, 101, 'Duga', 'Stefano', 'stefano.duga@unimi.it', 'Reference letter Gaia Anelli Barcellona 2011.doc', '1823227436', '2011-05-31', '2011-05-31 10:27:13'),
(206, 101, 'Rosanna', 'Asselta', 'rosanna.asselta@unimi.it', 'Reference letter for Gaia Anelli.pdf', '248808212', '2011-05-31', '2011-05-31 10:23:03'),
(208, 29, 'Duarte', 'Barral', 'duarte.barral@fcm.unl.pt', 'Reference letter IRB 2.pdf', '725951396', NULL, '2011-05-31 10:30:40'),
(209, 86, 'Dr. Digpal', 'Singh Gour', 'digpalgour@gmail.com', 'LETTER OF RECOMMENDATION 2.pdf', '1300677568', NULL, '2011-05-31 10:43:38'),
(210, 102, 'Karen', 'MacKenzie', 'k.mackenzie@ccia.unsw.edu.au', NULL, '2137349423', NULL, '2011-05-31 11:17:30'),
(213, 104, 'António', 'Amorim', 'aamorim@ipatimup.pt', 'parec Estefania Martins.docx', '23137248', '2011-05-31', '2011-06-01 15:24:12'),
(215, 103, 'Luisa', 'Castagnoli', 'castagnoli@uniroma2.it', NULL, '1934052363', '2011-06-01', '2011-06-01 10:26:08'),
(217, 106, 'Prof. Aparna', 'Dutta Gupta', 'apdgsl@uohyd.ernet.in', NULL, '1795344717', '2011-05-31', '2011-05-31 16:11:28'),
(218, 106, 'Prof. P. Prakash', 'Babu', 'ppbsl@uohyd.ernet.in', NULL, '1324073825', '2011-05-31', '2011-05-31 16:11:39'),
(219, 108, 'Pablo', 'Lunello', 'pablo.lunello@agrenvec.es', NULL, '1459117471', '2011-05-31', '2011-05-31 19:35:18'),
(220, 108, 'Ricardo ', 'Vera Bravo', 'verar@javeriana.edu.co', NULL, '1615900666', '2011-05-31', '2011-05-31 19:35:30'),
(308, 113, 'Giassudin', 'Ahmed', 'gahmed32@gmail.com.com', 'giasuddin.pdf', '14300583', NULL, '2011-06-03 09:38:39'),
(222, 109, 'Dr. Sudha', 'Warrier', 'sudha.warrier@gmail.com', NULL, '1084605194', '2011-05-31', '2011-05-31 20:50:40'),
(223, 109, 'Dr. Bibha', 'Choudhary', 'vibhachou@gmail.com', 'Sanirbandha reco.doc', '820568923', '2011-05-31', '2011-06-01 04:06:32'),
(224, 107, 'Francisco Jose', 'Muñoa', 'fmunoa@ub.edu', NULL, '542279596', NULL, '2011-05-31 20:53:15'),
(307, 110, 'Paul', 'Alewood', 'p.alewood@uq.edu.au.au', 'paulalewood.pdf', '1172301182', NULL, '2011-06-03 09:36:40'),
(226, 107, 'Fernando', 'Albericio', 'fernando.albericio@irbbarcelona.org', NULL, '1313502045', NULL, '2011-05-31 20:54:47'),
(227, 107, 'Fernando', 'Aguado ', 'faguado@ub.edu', NULL, '181879386', NULL, '2011-05-31 20:55:52'),
(228, 107, 'Eduardo', 'Soriano', 'eduardo.soriano@irbbarcelona.org', NULL, '559043288', NULL, '2011-05-31 20:56:41'),
(230, 113, 'Ashu', 'Shah', 'ashushah2006@gmail.com', NULL, '395159780', '2011-06-01', '2011-06-01 01:01:29'),
(309, 120, 'Paula ', 'Gomes', 'pgomes@fc.up.pt', 'Reccomendation Letter Raquel Cruz.pdf', '730021360', NULL, '2011-06-03 09:41:19'),
(231, 111, 'Marco Maria', 'D''Andrea', 'mdandrea@unisi.it', 'RefLettDavidePisu.pdf', '258739065', '2011-06-01', '2011-06-01 15:03:56'),
(232, 111, 'Antonio', 'Giordano', 'giordano12@unisi.it', 'Reference Letter for Davide Pisu.pdf', '328064398', '2011-06-01', '2011-06-01 08:54:43'),
(233, 112, 'Vincenzo', 'Fogliano', 'fogliano@unina.it', NULL, '96766507', '2011-06-01', '2011-06-01 06:11:21'),
(234, 115, 'Ramalaingam ', 'Gounder', 'gobiram@hotmail.com', 'Reference letter - Manivannan sethurajan.pdf', '1061428419', '2011-06-01', '2011-06-02 07:41:24'),
(235, 115, 'Dr.Sankaranarayanan', 'Sadasivam', 'sadacpmb@rediffmail.com', 'letter - Manivannan sethurajan.pdf', '929830903', '2011-06-02', '2011-06-02 10:20:32'),
(236, 107, 'Francisco José', 'Muñoa', 'fmunoa@ub.edu', 'Recomendacion Antoni Parcerisas.pdf', '428294983', NULL, '2011-06-01 08:05:34'),
(237, 107, 'Fernando', 'Aguado', 'faguado@ub.edu', 'Toni Parcerisas.pdf', '1387236838', NULL, '2011-06-01 08:06:23'),
(238, 61, 'Erik', 'Storkebaum', 'erik.storkebaum@mpi-muenster.mpg.de', 'reference letter Sumit Jaiswal IRB.pdf', '156469456', '2011-06-01', '2011-06-01 20:14:54'),
(239, 13, 'Paolo ', 'Iadarola', 'piadarol@unipv.it', 'letter Paolo Iadarola.pdf', '1345327865', NULL, '2011-06-01 09:04:53'),
(240, 112, 'Anna Maria', 'Canudas', 'canudas@ub.edu', NULL, '1935593991', '2011-06-01', '2011-06-01 09:08:10'),
(241, 110, 'Martien', 'Kas', 'm.j.h.kas@umcutrecht.nl', 'recommendation_letter_Amir_Seddik.pdf', '215970244', NULL, '2011-06-01 09:27:07'),
(242, 61, 'Gilbert ', 'Weidinger', 'gilbert.weidinger@biotec.tu-dresden.de', 'Reference letter for Sumit Jaiswal PhD v3.pdf', '890756448', NULL, '2011-06-01 09:32:25'),
(243, 87, 'Dr. P.S.', 'Nirwan', 'drpsn52@gmail.com', 'Ref.letter PS Nirwan.pdf', '72923574', NULL, '2011-06-01 09:40:05'),
(244, 77, 'Stefan', 'Szeadlacsek', 'stefan@biochim.ro', 'SupportLetter for Ureche Cristina_leana.pdf', '426859575', NULL, '2011-06-01 09:44:02'),
(245, 96, 'Marília', 'Dourado', 'mdourado.uc@gmail.com', 'PhD Letter of Recommendation- Ana Soares1-2.docx', '1601930672', '2011-06-01', '2011-06-01 11:42:04'),
(246, 62, 'John', 'Rubery', 'John.RUBERY@ec.europa.eu', 'anya jones.pdf', '986485689', NULL, '2011-06-01 12:17:22'),
(247, 103, 'Luisa', 'Castagnoli', 'castagnoli@uniroma2.it', 'Nardi-barcellona.doc', '1945980204', NULL, '2011-06-01 12:47:30'),
(248, 107, 'Fernando', 'Albericio', 'fernando.albericio@irbbarcelona.org', 'Antoni Parcerisas _2_.pdf', '1623451443', NULL, '2011-06-01 13:44:21'),
(249, 103, 'Gianni', 'Cesareni', 'cesareni@uniroma2.it', 'FrancescaNardi.pdf', '257820429', NULL, '2011-06-01 15:14:24'),
(250, 42, 'Eduardo', 'Osinaga', 'eosinaga@fmed.edu.uy', 'Gerard Hernandez - Letter Eduardo Osinaga - June 2011.pdf', '1616433202', NULL, '2011-06-01 15:19:37'),
(251, 116, 'Michele ', 'Solimena', 'michele.solimena@tu-dresden.de', NULL, '873472242', '2011-06-06', '2011-06-06 16:56:44'),
(252, 116, 'Patrick', 'MacDonald', 'pmacdonald@ualberta.ca', NULL, '36185093', '2011-06-06', '2011-06-06 16:56:48'),
(254, 118, 'Silva', 'Katusic- Hecimovic', 'silva.hecimovic@irb.hr', NULL, '346082471', '2011-06-01', '2011-06-01 16:11:29'),
(255, 118, 'Jasminka', 'Stefulj', 'jasminka.stefulj@irb.hr', NULL, '72586472', '2011-06-01', '2011-06-01 16:11:35'),
(256, 117, 'Silva', 'Katusic- Hecimovic', 'silva.hecimovic@irb.hr', NULL, '23005138', '2011-06-01', '2011-06-01 16:56:54'),
(257, 117, 'Jasminka', 'Stefulj', 'jasminka.stefulj@irb.hr', NULL, '1341070117', '2011-06-01', '2011-06-01 16:56:57'),
(321, 105, 'Jose', ' Guirnaldos', 'josefguirnaldos@gmail.com', 'Recomendation Letter Aura Herrera.pdf', '443714115', NULL, '2011-06-08 09:43:39'),
(258, 119, 'Marilyne', 'Uzest', 'uzest@supagro.inra.fr', NULL, '1896338209', '2011-06-06', '2011-06-06 20:39:36'),
(259, 119, 'Erhan', 'Yalcindag', 'erhan.yalcindag@mpl.ird.fr', NULL, '1849439610', '2011-06-06', '2011-06-06 20:39:44'),
(260, 119, 'Christian', 'Dumas', 'Christian.Dumas@cbs.cnrs.fr', NULL, '1333332953', '2011-06-03', '2011-06-03 09:47:53'),
(261, 119, 'Jean-Benoit', 'Morel', 'jean-benoit.morel@cirad.fr', NULL, '1685723985', '2011-06-03', '2011-06-03 09:47:55'),
(262, 120, 'Catarina', 'Almeida', 'cralmeid@ineb.up.pt', NULL, '1007169644', '2011-06-01', '2011-06-01 22:28:23'),
(263, 120, 'Ernesto', 'Nicolas', 'enicolas@ub.edu', 'Raquel Barros.pdf', '180738799', '2011-06-01', '2011-06-02 05:19:47'),
(264, 120, 'Paula', 'Gomes', 'pgomes@fc.up.pt', NULL, '1448410267', '2011-06-01', '2011-06-01 22:28:53'),
(265, 120, 'Mário', 'Barbosa', 'mbarbosa@ineb.up.pt', 'Parecer_RBarros_2Jun2011.docx.pdf', '1474722516', '2011-06-01', '2011-06-02 21:38:47'),
(273, 120, 'Catarina', 'Almeida', 'cralmeid@ineb.up.pt', 'recomendation letter Raquel Barros.pdf', '990181080', NULL, '2011-06-02 09:23:28'),
(267, 88, 'Agustin', 'Badillo', 'badillo@ipn.mx', 'carta Dr .pdf', '125356704', NULL, '2011-06-02 08:51:26'),
(268, 88, 'Irma ', 'Silva', 'irma.silvaolezi@rdls.nestle.com', 'carta Dra .pdf', '1314064764', NULL, '2011-06-02 08:51:50'),
(269, 33, 'Gabriele', 'Braun', 'G.Braun@bristol.ac.uk', 'Ester Reina i Torres .pdf', '524534664', NULL, '2011-06-02 08:54:06'),
(272, 83, 'Yuri', 'Dubrova', 'yed2@le.ac.uk', 'Stelios Pavlou PhD Barcelona 11.doc', '1337952870', NULL, '2011-06-02 09:17:12'),
(274, 6, 'Zbigniew', 'Madeja', 'z.madeja@uj.edu.pl', 'JLatasiewiczReference.pdf', '1686350897', NULL, '2011-06-02 10:00:50'),
(275, 122, 'Toni ', 'Pacual ', 'jap@imim.es', NULL, '127372231', NULL, '2011-06-02 10:04:23'),
(276, 122, 'Elena ', 'Bosch', 'elena.bosch@upf.edu', NULL, '1912603844', NULL, '2011-06-02 10:04:47'),
(287, 122, 'Elena', 'Bosch', 'elena.bosch@upf.edu', 'AnnaMontaner-1.pdf', '814890858', NULL, '2011-06-02 12:58:25'),
(278, 31, 'Olivier', 'Sordet', 'sordet.olivier@claudiusregaud.fr', 'Letter Raffaella Iurlaro - IRB-OS.pdf', '1308011937', NULL, '2011-06-02 10:06:44'),
(279, 65, 'Alexander ', 'Laurentin', 'alexander.laurentin@ciens.ucv.ve', 'letter_instructions2011.pdf', '1922103823', NULL, '2011-06-02 10:11:48'),
(280, 67, 'MªIsabel', 'Tejada Mínguez', 'MARIAISABEL.TEJADAMINGUEZ@osakidetza.net.', 'reference letter-Cruces Hospital.pdf', '2058590345', NULL, '2011-06-02 10:18:39'),
(281, 77, 'Cosmin', 'Saveanu', 'cosmin.saveanu@pasteur.fr', 'SupportLetter for Ureche Cristina_leana pasteur.pdf', '1984964387', NULL, '2011-06-02 11:04:39'),
(282, 109, 'Dr. Sudha ', 'Warrier', 'sudha.warrier@gmail.com', 'reference 1-Dr  Sudha Warrier.pdf', '85996547', NULL, '2011-06-02 11:37:39'),
(283, 105, 'Pedro', 'Estrada', 'pestrada@ucla.edu.ve', NULL, '2135916001', '2011-06-02', '2011-06-02 11:57:04'),
(284, 105, 'Pedro E', 'Estrada', 'ordepnomar@hotmail.com', NULL, '720302423', '2011-06-02', '2011-06-02 11:57:21'),
(286, 122, 'Xavier', 'Salvatella', 'xavier.salvatella@irbbarcelona.org', 'reflettersalvatella.pdf', '1190638820', NULL, '2011-06-02 12:53:51'),
(288, 122, 'Jose A.', 'Pascual', 'jap@imim.es', 'Carta Anna Montaner.pdf', '936845279', NULL, '2011-06-02 12:59:16'),
(289, 65, 'Elizabeth ', 'Valdivieso', 'elizabeth.valdivieso@ciens.ucv.ve', 'Letter Recommendation V Martin.pdf', '1540220514', NULL, '2011-06-02 14:23:40'),
(290, 52, 'Olga Yaneth', 'Echeverri Peña', 'oyep26@gmail.com', 'Mauro Alejandro1.pdf', '2047070050', '2011-06-02', '2011-06-02 21:18:34'),
(291, 112, 'Vincenzo', 'Fogliano', 'fogliano@unina.it', 'Ref letter Ilario 2 2.pdf', '380385882', NULL, '2011-06-03 07:06:13'),
(292, 112, 'Anna Maria', 'Canudas', 'canudas@ub.edu', 'Untitled 10.pdf', '1074216797', NULL, '2011-06-03 07:07:02'),
(293, 79, 'Dominic', 'Campopiano', 'Dominic.Campopiano@ed.ac.uk', 'Kundel letter of support Campopiano.doc', '369038577', NULL, '2011-06-03 07:09:03'),
(294, 79, 'Alison', 'Hulme', 'Alison.Hulme@ed.ac.uk', 'Microsoft Office Outlook - Memo Style.pdf', '188590082', NULL, '2011-06-03 07:11:08'),
(305, 97, 'Blanca', 'Rubi', 'bbblanca.rubi@gmail.com', 'MartaBombard-RecLetter-IRB.pdf', '1347818274', NULL, '2011-06-03 09:23:27'),
(310, 48, 'Olga', 'Sánchez', 'olga.sanchez@uab.es', 'carta Kharbouch.pdf', '965783868', NULL, '2011-06-03 10:57:14'),
(322, 105, 'Pedro', 'Estrada', 'pestrada@ucla.edu.ve', 'CARTA CERTIFICACIN ACADMICA AURA-1.pdf', '476830127', NULL, '2011-06-08 09:44:11'),
(312, 23, 'Sendhilvel', 'Vaithiyanathan', 'veltnay@rediffmail.com', 'letter V.Sendhilvel.pdf', '247684414', NULL, '2011-06-07 09:57:15'),
(313, 70, 'Prof.Asit K.', 'Chakraborti', 'akchakraborti@niper.ac.in', 'Recommendation -Rohit Bansal.pdf', '1565606396', NULL, '2011-06-07 10:00:04'),
(315, 85, 'Dirk', 'Breikreutz', 'dirkbtz@gmx.de', 'Fahrettin 2011 RecLETshort0517 all.pdf', '1273083099', NULL, '2011-06-07 11:34:52'),
(318, 41, 'José Carlos', 'Zapata Blabío', 'c.zapata@usc.es', 'Mail y carta C Zapata.pdf', '55046666', NULL, '2011-06-07 13:39:44'),
(319, 63, 'Elzbieta ', 'Glaser', 'e_glaser@dbb.su.se', 'Elzbieta Glaser e-mail y carta.pdf', '1438076450', NULL, '2011-06-07 13:43:04'),
(320, 96, 'Sukalyan', 'Chatterjee', 'sukalyan@yahoo.com', 'Anas recomendation to Barcelona.pdf', '718455279', NULL, '2011-06-07 15:14:23'),
(323, 116, 'Michele', 'Solimena', 'michele.solimena@tu-dresden.de', 'Ref. letter Michele Solimena.pdf', '1568322234', NULL, '2011-06-08 09:48:03'),
(324, 116, 'Patrick ', 'MacDonald', 'pmacdonald@ualberta.ca', 'Vergari Letter.pdf', '646659707', NULL, '2011-06-08 09:48:34'),
(325, 80, 'Alba', 'Chimirri', 'chimirri@pharma.unime.it', 'x cortigiani.pdf', '1149704915', NULL, '2011-06-09 13:14:46'),
(326, 124, 'Rajan ', 'Sriraman', 'rajan@indiimmune.com', NULL, '306305605', '2011-06-17', '2011-06-17 01:42:29'),
(327, 124, 'Archana ', 'Giri', 'archanagiriin@jntu.ac.in', NULL, '1042544466', '2011-06-17', '2011-06-17 01:43:57'),
(328, 128, 'Jon ', 'Garibaldi', 'jmg@cs.nott.ac.uk', NULL, '1956474276', NULL, '2011-09-27 03:25:31'),
(329, 128, 'Mahmoud', 'ElHefnawi', 'mahef@aucegypt.edu', NULL, '2117336464', NULL, '2011-09-27 03:26:34'),
(330, 131, 'Walter', 'Torres', 'walter.torres@correounivalle.edu.co', NULL, '379268607', NULL, '2011-10-20 02:30:10'),
(331, 131, 'Maria ', 'Corena', 'pilarcorena@aol.com', NULL, '461367650', NULL, '2011-10-20 02:30:49'),
(332, 132, 'Dr. Amy', 'Buck', 'email-a.buck@ed.ac.uk', NULL, '2074206256', '2011-10-24', '2011-10-24 14:16:35'),
(333, 132, 'Prof. Deepak ', 'Kaul', 'email-dkaul_24@hotmail.com', NULL, '48196687', '2011-10-24', '2011-10-24 19:29:41'),
(334, 138, 'Dr Girish', 'Kale', 'g.m.kale@leeds.ac.uk', NULL, '902453327', '2011-11-01', '2011-11-01 12:18:22'),
(335, 138, 'Dr . Xiajoun', 'lai', 'x.lai@leeds.ac.uk', NULL, '2049551965', '2011-11-01', '2011-11-01 12:19:08'),
(336, 138, 'Dr.Robert', 'hammond', 'r.b.hammond@leeds.ac.uk', NULL, '1618060924', '2011-11-01', '2011-11-01 12:20:01'),
(338, 141, 'JAYSHREE', 'BARDAPURKAR', 'drbardapurkar@rediffmail.com', NULL, '1538188015', '2011-11-04', '2011-11-04 20:01:51'),
(342, 141, 'VAIJYANTI', 'HARDAS', 'dr.vmhardas@gmail.com', 'reco1.pdf', '640224367', '2011-11-04', '2011-11-04 18:49:43'),
(339, 142, 'Stuart', 'MacNeill', 'sam31@st-andrews.ac.uk', NULL, '447409345', NULL, '2011-11-04 16:11:56'),
(340, 142, 'Morven', 'Shearer', 'mcs6@st-andrews.ac.uk', NULL, '1177738437', NULL, '2011-11-04 16:12:29'),
(341, 142, 'Timothy', 'Hughes', 't.hughes@utoronto.ca', NULL, '473595992', NULL, '2011-11-04 16:12:55'),
(343, 141, 'JAYSHREE', 'BARDAPURKAR', 'drbardapurkar@rediffmail.com', NULL, '577582859', '2011-11-16', '2011-11-16 00:18:14'),
(357, 148, 'Lluís ', 'Arola Ferrer', 'lluis.arola@urv.cat', NULL, '1374121756', '2011-12-13', '2011-12-13 10:36:27'),
(345, 144, 'kannabiran', 'k', 'kkb@vit.ac.in', NULL, '2070518078', NULL, '2011-11-06 08:13:43'),
(346, 144, 'abilash', 'vasala gopalakrishnan', 'abilash.vg@vit.ac.in', NULL, '1811701132', NULL, '2011-11-06 08:15:16'),
(350, 145, ' Dr. Jean-Christophe ', ' Bourdon ', 'j.bourdon@dundee.ac.uk', NULL, '1981356035', '2011-11-11', '2011-11-11 09:47:55'),
(351, 145, ' Dr. Nia ', ' White ', 'N.A.White@Abertay.ac.uk', NULL, '469066961', NULL, '2011-11-11 09:47:45'),
(352, 146, 'Bernardo', 'Gomez', 'bgomez@uniandes.edu.co', NULL, '1817009740', '2011-11-17', '2011-11-17 19:22:28'),
(355, 143, 'Prof.Karin', 'Klinga Levan', 'karin.klinga.levan@his.se', NULL, '1899890742', NULL, '2011-11-28 19:57:19'),
(354, 146, 'Carlos', 'Ávila', 'director-fisica@uniandes.edu.co', 'Carta_referencia_Ingrid_Valencia.pdf', '793659164', '2011-11-17', '2011-12-16 13:51:16'),
(356, 143, 'Prof.afrouz', 'Behboudi', 'Afrouz.behboudi@his.se', NULL, '59121705', NULL, '2011-11-28 19:58:56'),
(358, 156, 'Bulent', 'Ozpolat', 'bozpolat@mdanderson.org', NULL, '397465635', NULL, '2011-12-15 02:51:18'),
(359, 156, 'Gabriel', 'Lopez-Berestein', 'glopez@mdanderson.org', NULL, '738967168', NULL, '2011-12-15 02:53:50'),
(360, 151, 'JAVIER', 'NOVO', 'fnovo@unav.es', NULL, '1292758705', '2011-12-16', '2011-12-16 08:42:06'),
(361, 151, 'Claudio', 'Fernandez Acevedo', 'ana.esparza@lurederra.es', NULL, '1148132400', '2011-12-16', '2011-12-16 08:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_rights`
--

CREATE TABLE IF NOT EXISTS `jos_phd_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phd_rights`
--

INSERT INTO `jos_phd_rights` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Read', 'read', 1),
(2, 'Write', 'write', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_role_tab_right`
--

CREATE TABLE IF NOT EXISTS `jos_phd_role_tab_right` (
  `role_id` int(11) NOT NULL,
  `tab_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`tab_id`,`right_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_phd_role_tab_right`
--

INSERT INTO `jos_phd_role_tab_right` (`role_id`, `tab_id`, `right_id`) VALUES
(1, 1, 2),
(1, 2, 2),
(1, 3, 2),
(1, 4, 2),
(1, 5, 2),
(1, 6, 2),
(1, 7, 2),
(1, 8, 2),
(1, 9, 2),
(1, 10, 2),
(2, 1, 2),
(2, 2, 2),
(2, 3, 2),
(2, 4, 2),
(2, 5, 2),
(2, 6, 2),
(2, 7, 2),
(2, 8, 2),
(2, 9, 2),
(2, 10, 2),
(3, 1, 1),
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(3, 10, 1),
(4, 1, 2),
(4, 2, 2),
(4, 3, 2),
(4, 4, 2),
(4, 5, 2),
(4, 6, 2),
(4, 7, 2),
(4, 8, 2),
(4, 9, 2),
(4, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_roles`
--

CREATE TABLE IF NOT EXISTS `jos_phd_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_phd_roles`
--

INSERT INTO `jos_phd_roles` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Administrator', 'Administrator', 1),
(2, 'Group Leader', 'Group Leader', 2),
(3, 'Committee', 'Committee', 3),
(4, 'Applicant', 'Applicant', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_status`
--

CREATE TABLE IF NOT EXISTS `jos_phd_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  `short_description` varchar(40) NOT NULL,
  `mail_subject` varchar(100) NOT NULL,
  `mail_body` text NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_phd_status`
--

INSERT INTO `jos_phd_status` (`id`, `description`, `short_description`, `mail_subject`, `mail_body`, `order`) VALUES
(1, 'Editing', 'Editing', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThis email is to inform you that IRB Barcelona has not yet received one of the two letters of recommendation requested for application to IRB Barcelona PhD fellowships. We remind you that these letters must be sent directly to us by your referees (either by e-mail to phd@irbbarcelona.org , by airmail or by fax to our contact address) and that the deadline for receipt is 25 January 2009.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 1),
(2, 'Submitted', 'Submitted', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\r\n\r\nThis e-mail is to confirm that your application has been submitted correctly. You will hear back from us once the call closes and the first part of the evaluation process has been completed, around February 2009.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 2),
(3, 'Not invited for interviews', 'Not invited for interviews', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2009 and the first part of the selection process has now been completed.\r\n\r\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\r\n\r\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 3),
(4, 'Invited for interviews', 'Invited for interviews', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThank you once again for your recent application for a PhD grant at IRB Barcelona. After careful evaluation of your merits, I am pleased to inform you that you have been short-listed as a potential candidate for one of the grants currently on offer. You will soon receive an official letter with the invitation to visit our Institute on 30 and 31 of March 2009 for interviews.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 4),
(5, 'Not accepted', 'Not accepted', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\r\n\r\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\r\n\r\nYours sincerely,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 5),
(6, 'Accepted', 'Accepted', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nAfter completion of the selection process, it is our pleasure to offer you a PhD fellowship at IRB Barcelona. We congratulate you on this achievement. As you know there was considerable competition for these fellowships and the number and quality of applicants were exceptionally high.\r\n\r\nWe will officially contact you in the near future with more details of our offer.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 6),
(7, 'Discarded', 'Discarded', 'News from IRB Barcelona PhD Programme', 'Dear #name#,\r\n\r\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\r\n\r\nWe regret to inform you that we have received no recommendations letters. You have therefore been excluded from the selection process.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 7),
(8, 'Waiting list', 'Waiting list', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_tab_application`
--

CREATE TABLE IF NOT EXISTS `jos_phd_tab_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `jos_phd_tab_application`
--

INSERT INTO `jos_phd_tab_application` (`id`, `tab_id`, `application_id`, `show`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 1, 1),
(5, 5, 1, 1),
(6, 6, 1, 0),
(7, 7, 1, 0),
(8, 8, 1, 1),
(9, 9, 1, 1),
(10, 10, 1, 1),
(11, 1, 2, 1),
(12, 2, 2, 1),
(13, 3, 2, 1),
(14, 4, 2, 1),
(15, 5, 2, 1),
(16, 6, 2, 1),
(17, 7, 2, 1),
(18, 8, 2, 1),
(19, 9, 2, 1),
(20, 10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_tabs`
--

CREATE TABLE IF NOT EXISTS `jos_phd_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_phd_tabs`
--

INSERT INTO `jos_phd_tabs` (`id`, `description`) VALUES
(1, 'personal_data'),
(2, 'academic_info'),
(3, 'files'),
(4, 'referees'),
(5, 'work_experiences'),
(6, 'summary_of_thesis'),
(7, 'summary_of_research'),
(8, 'programmes'),
(9, 'ethical_issues'),
(10, 'status');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_users`
--

CREATE TABLE IF NOT EXISTS `jos_phd_users` (
  `id` int(11) NOT NULL,
  `user_username` varchar(150) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_phd_users`
--

INSERT INTO `jos_phd_users` (`id`, `user_username`, `role_id`) VALUES
(1, 'phdadmin', 1),
(2, 'phdadmin2', 1),
(3, 'mcoll', 2),
(4, 'azorzano', 2),
(5, 'ccaelles', 2),
(6, 'lribas', 2),
(7, 'esoriano', 2),
(8, 'reritja', 2),
(9, 'ariera', 2),
(10, 'mmacias', 2),
(11, 'acelada', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_wheredidu`
--

CREATE TABLE IF NOT EXISTS `jos_phd_wheredidu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  `short_description` varchar(40) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_phd_wheredidu`
--

INSERT INTO `jos_phd_wheredidu` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'IRB Barcelona Website', 'IRB Barcelona Website', 1),
(2, 'Email announcement', 'Email announcement', 2),
(3, 'Through a friend/professor/researcher', 'Through a friend/professor/researcher', 3),
(4, 'Poster', 'Poster', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_work_experiences`
--

CREATE TABLE IF NOT EXISTS `jos_phd_work_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `experience` text NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=265 ;

--
-- Dumping data for table `jos_phd_work_experiences`
--

INSERT INTO `jos_phd_work_experiences` (`id`, `applicant_id`, `experience`, `modified`) VALUES
(1, 1, 'Demo', '2011-04-21 13:49:50'),
(11, 20, 'From the beginning of my internship (from 2007 to 2009) I was involved in a project regarding the influence of inversion polarity sites on structural features of G-quadruplex structures and introduction of ODNs modified. \r\nDuring this period I worked extensively in the lab, providing my organisational and practical skills and intellectual capability; joining in lab’s meetings in which I introduced results and future perspectives and I took part in several congress and scientific days.\r\nI improved my knowledge by synthesis, purification and spectroscopic/kinetic analysis of ODNs, with several chemical approaches. (H-NMR, Mass spectrometry, NOESY, UV,CD, HPLC, dHPLC, Chemical synthesis)\r\nMy biological background allows me to suggest a project focused on the close correlation between some cancer diseases and the potential presence of abasic site in a G-quadruplex. \r\nThe aim of my thesis was to investigate the effects of the introduction of abasic site on structural, thermodynamic and kinetic properties of G-quadruplex (V. Esposito doi: 10.1093/nar/gkp1087).\r\nIn details my investigation concerned 5 ODNs based on the sequence d(TGGGGGT), in which all G have been replaced, one at a time, by an abasic site mimic d(S). The result show that all sequences preserve their ability to form quadruplexes; both spectroscopic and kinetic experiments point to sequence-dependent different effects on the structural flexibility and stability. d(TSGGGGT) and d(TGGGGST) form quite stable quadruplexes; for the other sequences, the introduction of the S in proximity of the 3''-end decreases the stability more than the 5''-end. d(TGSGGGT) forms a G-quadruplex where dS doesn’t hamper the stacking between the tetrads adjacent to it.\r\nAfter my master thesis internship in the Galeone’s Lab Group, at university of Naples Federico II, I chose to undertake a more biological path for my studies and I asked to begin a period of internship at CEINGE, in Naples, a good centre of investigation, that provided all the equipments, instruments and facilities suitable to develop my own project and cultivate my research interest.\r\nI worked in  the oncohematologic laboratory under the supervision of MD Ciro R. Rinaldi, I maturated a great interest in the studies and understanding of myeloproliferative diseases, in their drugs treatments and both molecular and cellular pathogenesis. Also I increased and broadened my technical and theoretical in the field of the signalling pathways involved in the control of the gene expression. Furthermore I had the opportunity to grow in a culturally and scientifically stimulating environment and to collaborate in a very interesting and ambitious project by which I published my first brief report (Preferential nuclear accumulation of JAK2V617F in CD34+ but not in granulocytic, megakaryocytic, or erythroid cells of patients with Philadelphia-negative myeloproliferative neoplasia. Ciro R. Rinaldi, Paola Rinaldi, Adele Alagia, Marica Gemei, Nicola Esposito, Fabio Formiggini, Vincenzo Martinelli, Vitalyi Senyuk, Giuseppina Nucifora, and Fabrizio Pane.  Blood, 23 December 2010, Vol. 116, No. 26, pp. 6023-6026.).\r\nAt the moment I direct my attention to the study of reprogramming and the induction of pluripotent stem cells from adult human fibroblasts by different factors. \r\nThese experiences have encourage me to further grow as a researcher with a PhD project in a great Institution such as IRB, so that’s why I would now like to register to your PhD programme. \r\n', '2011-05-11 11:53:12'),
(3, 4, 'My original focus was on infectious disease but I became intrigued by that fact that some antibacterial and antiprotozoal agents e.g. Metronidazole and Artemether have selective toxicity for both infectious agents and cancer cells.  The similarity of the more primitive phenotype of cancer cells to unicellular microorganisms served as the basis of my work for Masters Degree which I have successfully completed. I would now like to further pursue my interest in cancer biology and therapy by obtaining a PhD.', '2011-04-30 06:21:37'),
(4, 15, 'Beca de colaboración.\r\n\r\nDesarrollo del análisis de misión del satélite ESEO, satélite dentro del programa\r\naeroespacial de la ESA. Cálculos de inserción en órbita y mantenimiento de la\r\nórbita durante toda la misión. El satélite European Student Earth Orbiter (ESEO),\r\nes un micro satélite con órbita baja, dedicado a tomar fotografías y medidas de\r\nniveles de radiación, con el fin de aplicar estas tecnologías a futuros satélites.\r\nhttp://www.esa.int/esaMI/Education/SEMA0NEMKBF_0.html\r\n\r\nDr. Alberto Abad. Grupo de Mecánica Espacial.\r\nFacultad Ciencias de la Universidad de Zaragoza (área Matemáticas)\r\n', '2011-05-09 21:52:50'),
(5, 15, 'Técnico de ventas (El Corte Inglés).\r\nDurante las rebajas de verano, trabaje como técnico de ventas en la sección de\r\npunto caballero de El Corte Inglés.\r\n', '2011-05-09 21:53:00'),
(6, 17, 'Research Department Inova Diagnsotics (CA)\r\nI+D Almirall (BCN)\r\nBIOKIT S.A (BCN)', '2011-05-10 16:49:35'),
(8, 18, 'provided help in maintaining a local medical biochemistry laboratory( as part of recommended experience for students) that worked on broad spectrum of different analysis (2002-2007)', '2011-05-10 17:10:55'),
(9, 18, 'As a student 3.5 weeks work experience in practicing medicine and First aid in USA (FL).', '2011-05-10 17:11:34'),
(10, 18, 'In between there are activities like getting active participation in making master thesis , presentations, voluntaring...', '2011-05-10 17:12:11'),
(12, 23, 'Research and Teaching assistant, Microlabs Institute of research, 05/2008-06/2009.\r\n\r\nResponsibilities include:\r\nLab quality management\r\ndemonstrating basic lab experiments\r\nTeaching microbiology and biochemistry', '2011-05-11 23:08:47'),
(13, 27, 'Molecular Cell Biology plays a vital role in widening the knowledge in understanding the molecular structures, functions of genes, expression of proteins and sequencing of genes. I have done my project in Characteristics of Transglutaminase in Germinating Wheat Aleurone Layers, which mainly involves in the analyzing the activity of Transglutaminase in germinating Wheat Aleurone layers by different practical approaches such as SDS PAGE, Western blot, Dot blot, Chemiluminescence’s and Histochemical staining. \r\n\r\nDuring analysis and interpretation of my project results, I have been through many journals which gave me wide knowledge about the techniques which I have used in my project and other techniques such as Mass Spectroscopy, 2D SDS PAGE , staining of RNA, Gene sequencing and protein sequencing which I have not used in my project. I would have used all these techniques in my project to improve the results, but due to the scarcity of time I couldn’t bring my thoughts into application. My laboratory work, punctuality and innovating ideas were appreciated by my supervisor. He guided me and inspired me to move towards PhD.\r\n', '2011-05-12 12:05:05'),
(14, 30, '1) July 2010 – Present. Institut Químic de Sarrià (IQS):\r\n\r\nOne year project performing research focused on:\r\n\r\n- Synthesis of new brassinolide analogues with potential plant growth promoting activity\r\n\r\n- Synthesis of steroidal substrates for the identification and characterization of genes involved in the biosynthetic pathway of cardiac glycosides from Digitalis.\r\n\r\n2) October 2010 – Present. Institut Químic de Sarrià (IQS):\r\n\r\nCoordination and supervision of 5th year organic chemistry laboratory students (Laboratory Assistant)\r\n\r\n3) July 2009 – September 2009. Flubetech, S.L.:\r\n\r\n- Preparation of multifunctional magnetic nanoparticles for biomedical applications \r\n\r\n- Characterization of coated CaCO3 nanoparticles by contact angle measurement\r\n\r\n(Laboratory technician)', '2011-05-12 15:04:37'),
(15, 14, 'I have worked as a research officer in Immunology Lab in BIRDEM (Bangladesh Institute of Research and Rehabilitation in Diabetes, Endocrine and Metabolic Disorders) From May 2009- July 2010. My responsibility was to conduct different Immunological tests mainly ELISA based. For example- detection of  HbsAg, cardiac marker, Cancer marker, Anti Rubella antibody,  Anticardiolipin antibody and other agglutination tests. I was also involved in two research projects on diabetic patients related to this Lab which gave me firsthand experience in the field of research. I have also conduct and participate different seminars from this Immunology lab.', '2011-05-14 12:15:53'),
(39, 34, '1.Working as a Lecturer at Rajalakshmi Engineering College,Chennai,India.\r\nFrom 17-06-2010 to Till date.\r\n2.M.Phil .,Research Scholar in Department of Chemistry at Annamalai University,Chidambaram,India.\r\nFrom25-08-2008 to 25-12-2009.', '2011-05-17 08:51:05'),
(18, 33, 'During my undergraduate degree I took practical lessons in almost all subjects, I did practices in microbiology, virology, cell culture, biochemistry, immunology, proteomics, genetics engineering, statistics and bioinformatics to mention a few. As I studied in a small university we had very small working groups and I could learn a lot from my professors and classmates. Moreover, the labs were brand new and I could work with updated technologies and materials.\r\n\r\nIn 2006 I did an internship at Ernest&Jackson Co. Ltd in Crediton (UK), working in the control quality laboratory during 5 weeks full time. My function there was to prepare samples of medicated confectionery in order to determine the excipients by chromatography as well as perform analysis of weight, moisture, flavour and shape. There I learnt how to be organised at work, as I had to handle lots of samples. Furthermore, it was my first experience abroad, very enriching experience.\r\n\r\nIn 2007 I did an Internship at Faculty of Medicine at University of Barcelona for 6 weeks full time working in the group of Dr. Raúl Estévez, who studied the MLC1 gene, which is involved in megalencephalic leukoencephalopathy with subcortical cysts disease. My task there was to optimize the method Multisite Gateway, used in order to produce fusion proteins. I had to produce fluorescent fusion proteins that had to be expressed in zebra fish in order to localize MLC1 expression. Due to schedule issues I just had time to create the plasmids, analyze them by PCR, sequencing and express them in HeLa cells in order to determine efficiency by FACS. I the report handed in afterwards I had to contrast this method with the classic on using restriction enzymes. That was the first time I had to write a scientific paper (just a model, not for publication) and I got some communication and writing skills, apart from the lab work done previously.\r\n\r\nIn 2009 I did a Research Master in Biological and Environmental Chemistry and Related technologies (1500 hours) organized by the Spanish council for scientific research (CSIC). I did the practical project at Institute of advanced Chemistry of Catalonia (IQAC) in the group Research Unit of BioActive Molecules (RUBAM) under supervision of Dr. Gemma Fabriàs. My project was about the Sphyngosine-1-phosphate lyase enzyme. In a first stage I had to purify the protein from E. Coli cultures, the techniques I used were miniprep, transfection, Ni-colums purification and western blotting. In a second stage I had to optimize two methods of activity determination and to define the kinetic parameters of the enzyme. In order to achieve that I had to express the enzyme into fibroblast cells and measure the activity by colorimetric methods and gas chromatography. This has been my largest experience working in the lab.\r\n\r\nFinally, in 2010 I did the research project of Msc in Biomedical Sciences research during 15 weeks full time in the School of medical sciences, Dept. of cellular and molecular medicine at University of Bristol in the group of Dr. Gabi Braun. My task was to study the role of VEGF delivered by microvesicules (MV) in Aged-related macular degeneration. Specifically, I had to purify MV from retinal pigmented epithelial cells cultures and treat endothelial cells with them in order to measure improvements in proliferation and migration, the measurements were performed using BrdU incorporation and Boyden chambers respectibly. Furthermore, I studied the effect of several products on MV production, mostly by Western Blotting, immunostaining and fluorescent staining techniques.', '2011-05-14 17:04:23'),
(36, 40, 'Masters Degree, as a one year internship, at the Protein NMR laboratory of Dr Maria Macias in the institute for research in biomedicine, Barcelona. Currently working as a researcher at the Protein NMR laboratory of Dr Maria Macias in the institute for research in biomedicine, Barcelona.', '2011-05-16 13:03:05'),
(37, 41, 'I had made an initiation to a research project about association between genetic polymorphisms and prostate cancer. We use techniques like PCR, electrophoresis and DNA extraxtion. This is my third year in Physical Anthropology Laboratory, in USC and I am very satisfied with my work there. This experience showed me that I am really sure about being a researcher in biomedicine area and gave me confidence about myself. ', '2011-05-16 15:55:45'),
(70, 37, ' I have total 6 yrs experience in organic synthesis in the different projects in the Pharmaceutical research centre i.e Lupin Pharma ltd,Glenmark Pharma ltd and National Chemical Laboratory. e.g Antibacterial ,anti diabetic, anti inflammatory and obesity projects. During handling these project,  i am interested to join your group as a PH.D student,I carried out no. of reactions such as rearrangement reaction, handling of air sensitive reaction ,oxidising and reducing reagents and their properties .dehydrating reagents, coupling reaction ,air oxidation reaction,hydrogenation, solvent free reaction Micro wave assisted reactions.I am working on different methods to cleavage of DNA. I have handled many inorganic complexes in the stereo selective synthesis and asymmetric synthesis.\r\n\r\nI also  have a sufficient Knowledge of characterisation of the molecules by NMR,IR,HPLC,GC.I am sending my CV and research synopsis with attachment.\r\n ', '2011-05-21 17:00:12'),
(31, 39, 'Leonardo''s Grant. Università degli studi di Parma. Molecular Biology', '2011-05-15 19:22:14'),
(38, 36, 'Clinical Experiences:\r\n\r\n•	February 2005 to January 2006: Medical Laboratory In-charge at Curex diagnostic centre, putalisadak, Kathmandu, Nepal\r\n•	March 2005 to August 2007 Medical Laboratory Technologist at Department of Pathology, Om Hospital and Research Centre, Chabahil, Kathmandu, Nepal\r\n•	October 2006 to August 2007: Medical Technologist, Department of Pathology, Kathmandu Medical College and Teaching Hospital, Kathmandu, Nepal.\r\n\r\nTeaching Experiences:\r\n\r\n•2008- 2010: Lecturer, Department of Biochemistry, Hubei University of Chinese Medicine, Wuhan, China.\r\n•2006-2007: Tutor, Department of Microbiology, Om Health Campus, Purbanchal University, Kathmandu, Nepal\r\n•2007 Clinical Instructor, Nobel Medical College, Pokhara University, Kathmandu, Nepal.\r\n', '2011-05-17 00:30:50'),
(34, 35, 'I had worked as a research assistant for almost 2 years at virology laboratory in which Assist Prof Arunee Thitithanyanont is a head of the laboratory room at Department of Microbiology, Faculty of Science, Mahidol University, Bangkok, Thailand. I was assigned to mainly responsible for 2 projects. First project is a study of HIV recombinants in Thai patients. To find and analyse HIV recombinants in the patients, I did almost full-length genome sequencing from the genomic DNA samples. I learned how to use Vector NTI and RIP software and learned cloning practically. Lastly, surveillance of H5N1 virus in open-billed in Nakornsawan province was the other project I was responsible for. I worked in P2 plus laboratory to obtain and manage the samples, isolate the viral RNA and detect the viral RNA using RT-qPCR. If a sample with positive result was found, its RT-qPCR product would be cloned, sequenced and analysed. During doing this H5N1 study, I learned to be more organised because I had approximately 50 to 100 samples in each time and we usually received the samples twice a month. Besides that this study had been done for 3 years, I therefore dealt with huge data. Moreover, I had miscellaneous duties, such as preparing chemical reagents and competent cells, ordering reagents/kits/etc., doing account. I did everything thoroughly otherwise my mistake would effect to experiments of my colleagues. In conclusion, during working I developed my practice skills in RT-qPCR, cloning including preparing competent cells, sequencing analyse using mainly Vector NTI. I also had duties in miscellaneous issues. Therefore, I am organised, multi-tasker and thoughtful.', '2011-05-15 21:33:42'),
(40, 46, 'Practising Medical Doctor in Surgery and Medicine\r\nServices Hospital Lahore\r\n5180 Lahore (Pakistan)', '2011-05-17 20:21:43'),
(42, 47, 'Master''s Degree Thesis:\r\n‘Prediction of nucleotide binding sites in protein of known structure’\r\n', '2011-05-18 10:27:18'),
(43, 47, 'Under the supervision of Manuela Helmer-Citterich and Gabriele Ausiello, Centre for Molecular Bioinformatics\r\nDepartment of Biology\r\nUniversity of Rome ‘Tor Vergata’\r\n\r\n', '2011-05-18 10:27:39'),
(44, 47, 'From 10-2009 until 09-2010 I developed a new bioinformatics method able to identify nucleotides binding sites in proteins of known structure. The method is based on the chemical modularity of the nucleotide ligands, so in this method it is considered a nucleotide binding site a protein region formed by 3 consecutive sub-regions structurally able to bind the 3 different moieties of a nucleotide ligand.', '2011-05-18 10:28:03'),
(45, 47, 'I generated the binding pockets for the 3 different moieties of the nucleotides. The pockets have been created using SMART strings in order to identify the nitrogenous base and the ribose rings in the PDB files.I clustered the pockets for each specific moiety considering both evolutionary and structural criteria. ', '2011-05-18 10:29:00'),
(47, 47, 'The 3 clusters of pockets were then roto-translated on a set of 92 well-defined protein structures, obtained from the database LigASite. If a pocket create a structural match with a protein region, that region is considered able to bind the specific moiety of the ligand and the ligand fragment of the pockets is roto-translated on the protein surface. After roto-translating the different clusters of pockets, it is considered a nucleotide binding site the region where the roto-translated fragments have a distance that is compatible with the nucleotide conformation.', '2011-05-18 10:29:56'),
(48, 47, 'All the computing programs to do the described operations were written by me. \r\nThis research experience has been fundamental for my personal and professional development, indeed I learned the usage of many important bioinformatics tools and how to work in a bioinformatics team and a scientific stimulating environment.\r\n', '2011-05-18 10:30:23'),
(51, 47, '\r\n\r\n\r\nBachelor Degree Thesis:\r\n"Analysis of molecular determinants for recognition of phosphorylation sites in proteins of known structure"\r\n\r\n\r\n', '2011-05-18 10:33:01'),
(52, 47, 'Under the supervision of Allegra Via and Manuela Helmer-Citterich,\r\nCentre for Molecular Bioinformatics\r\nDepartment of Biology\r\nUniversity of Rome "Tor Vergata"\r\n\r\n', '2011-05-18 10:33:18'),
(53, 47, 'From 25-09-2007 until 30-01-2008 I collaborated to a statistical analysis of the amino acid composition of the space surrounding the 3 different phosphorylation sites. In this work I analyzed the features of the amino acids surrounding the serine, threonine and tyrosine amino acids, in order to understand and to discover possible structural profiles that allow amino acid phosphorylation.\r\nThis experience has been very important since it has been my first contact with the bioinformatics world. Thanks to this research I understood the research field in which I would like to work in the next future.\r\n', '2011-05-18 10:33:35'),
(54, 51, 'In my Master Degree training in Molecular and Industrial Biotechnology I have studied the method for protein cloning, expression (in E. coli), purification and engineering (mutagenic PCR, DNA shuffling, mutants screening). I’ve carried out the experimental part of my thesis in the Bioinorganic Chemistry group at the Department of Agro-Enviromental Science and Technology, coordinated by Prof. Stefano Ciurli.\r\nIn particular, my research activity focused on Helicobacter pylori UreF, a protein chaperone involved in activation of nickel-containing enzyme urease. I have expressed and purified the protein in its native form. I set up an “ad hoc” protocol to resolve the expression and solubility problems shown by this chaperone. In addition I have utilized several biochemical and spectroscopic techniques for protein characterization, such as light scattering, circular dichroism (CD), NMR spectroscopy, and ITC calorimetry to study protein-ligand and protein–protein interactions.', '2011-05-18 22:24:26'),
(56, 42, 'While finishing my both Studies in Biology and Biochemistry at Universitat de Barcelona I enrolled LPL laboratory (Facultat de Biologia) to gain expertise resides academic practical labwork. I joined this group after taking Regulation of Metabolism subject, taught by Miquel Llobera. I started as an assistant, performing basic assays, like ELISAS, arrays and performing some kit-based detections, and learning how to write properly my first reports and data show ups. Little by little I was gaining responsibilities and I had my own project, in addition to setting up some techniques. During this learning period I was granted with a collaboration scholarship for one semester (“beca de col•laboració”).', '2011-05-19 17:46:37'),
(57, 42, 'My staying in LPL lab was complemented by enrolling different mobility programs in order to practice abroad, both subject and (mainly) practical laboratory training. This way I moved to University of Helsinki to work at Anne Leppänen’s laboratory at the Biochemistry and Immunology department of the Faculty of Biosciences. There I focused my studies in glycobiology, studying different mucin-type proteins but getting as the main topic the most complete (up to date) characterization of CD34 glycan moieties, publishing those results in Blood.', '2011-05-19 17:46:49'),
(58, 42, 'Back to Barcelona, I closed both degree files and enrolled the official Master of Molecular Biotechnology (Facultat de Farmàcia / Universitat de Barcelona), in order to widen my biological knowledge from another point of view, and to fulfil the requirements in order to get access to a PhD programme. I performed this 60 credits Master within one year but separated in two phases (by semester). First part, I performed the training part back to Finland in order to carry out some unfinished work with PSGL-1, an important binding protein in immunology.\r\n', '2011-05-19 17:47:08'),
(60, 42, 'During this new internship I got higher responsibilities and could define my own experiments and work in a more independent way. I performed cell culturing and harvesting, as well as I purified human neutrophils straight away from fresh human blood samples, besides common molecular biology techniques.', '2011-05-19 17:52:26'),
(61, 42, 'Second semester I dedicated a high amount of hours to attend and study the theoretical part of the master, while I was working most of the day at LPL lab, in what was my pre PhD project. I studied the effect of Nitric Oxide (NO) on LPL in an in vitro system based on affinity columns, and NO donors. This effect was measured quantitative and qualitative ways, both by common molecular biology techniques and radioactive assays.', '2011-05-19 17:52:40'),
(62, 42, 'Due to my glycobiology background I was asked to perform my PhD thesis at LPL lab. Thus, I started studying the glycobiological basis of the different LPL pI isoforms. In order to get more expertise in the glycobiology field I moved to Uruguay to work at Eduardo Osinaga’s laboratory, thanks to Erasmus Mundus mobility programme. There I worked in both, Faculty of Medicine and Institut Pasteur de Montevideo where the group is splitted in two laboratories: Molecular Oncology and Tumoral Glycobiology. I setted up a bidimensional electrophoresis to visualize qualitatively the different glycoproteome pattern in both wild-type tumoral cell lines and those where some glycobiology-important proteins were silenced. In order to achieve so, I deepen my practical knowledge in genetic tools and techniques, such as transfections, QRT-PCRs and sequencing.', '2011-05-19 17:52:54'),
(63, 42, 'After finishing my internship in Uruguay I couldn’t join my former group since all PhD projects were cancelled due to lack of funds. Hence, I started a new project in Neurobiology under the supervision of Professor Jordi Llorens. I am currently studying the potential neurotoxicity of different nitriles on a isomeric basis, and characterizing whether this toxicity is only vestibular (and related to different tropical diseases) or if they also affect central nervous system.', '2011-05-19 17:53:14'),
(69, 43, 'First I would like to express my appreciation for this opportunity to apply for the IRB PhD fellowship in Barcelona. I hold a Master degree in Experimental Veterinary from the Universidad Autónoma de Barcelona and I have finish my undergraduate studies at the Universidad Peruana Cayetano Heredia.Part of my last years of work have been dedicated to study implantation of autologus mesenquimal stem cells and transduction mechanisms in regeneration of knee cartilage in sheeps. \r\nOur goal was to follow up the improvement of MACT scaffolds transplantations seeded with stem cells in an animal model with the implication to find bases for preventive diagnostics. I became proficient in different types of technology in order to evaluate the study: Biochemical and molecular methods, imaging techniques (MIR, X-rays, ultrasound) as well as clinical issues like Arthroscopy and pain evaluation.\r\nI started my research in this area during my master studies in the Universidad Autónoma de Barcelona. Before I was involved in Infection of animal diseases and finish my university carrier with the thesis “Evidence of infections for Shigella sp. in not human primates in Huachipa''s Zoological garden”. I also have been involved in animal surgery and worked as assistant in different veterinary hospitals. \r\n With the background knowledge I have in the biological sciences, I found suitable and motivating the areas of training and programs offered by the IRB.\r\nI strongly feel that a PhD will be very relevant to my carrier. I plan to work with research based groups in applied Biomedical sector as well as in local universities.\r\nIn addition I will get a chance through IRB scholarship to interact with students from diverse professional and cultural backgrounds drawn from all over the world. Finally I am determined to make the most out of the PhD studies benefits. Once again I am grateful for considering my application and I look forward to a favorable reply. \r\n', '2011-05-20 20:26:21'),
(71, 59, 'Spring 2006 Agriculture Crusade of Hamedan (Hamedan, Iran)\r\nAssistant in Agronomy Section ', '2011-05-22 10:53:25'),
(72, 59, '2006 -2008: Collaborated with Agriculture Crusade of Asadabad (Hamedan, Iran)\r\nPlant Breeding ( wheat) ', '2011-05-22 10:54:44'),
(74, 59, '6 months project in University of Hyderabad (Modeling Formyl Peptide Receptors Investigations on Interactions of FPRs with fMLP Inhibitors). 2011', '2011-05-22 10:56:17'),
(78, 63, 'I have participated in two different investigation projects. In the first one (7.5 ECTS), I studied the interaction of the nuclear transport machinery with linker histones in the Biophysics Unit, Leioa, Vizcaya. In the second project (37.5 ECTS), I participated full time in the Characterization of the human mitochondrial presequence degrading protease, hPreP in Stockholm University, Sweden. During the time I worked on those projects I improved my skills on Molecular Biology techniques and I learnt how important working in group is when researching. After that, I feel more comfortable when working in the lab and autosufficient. ', '2011-05-23 16:39:06'),
(104, 77, 'Once I completed my degree I thought that first I have to detain  good molecular biology knowledge and skills including general cloning techniques, DNA manipulation, protein expression, so I did my M.Sc thesys at the Institut of Biochemistry, from the Romanian Academy, Enzymology Department. \r\n\r\nM.Sc. Thesis title:	Cloning, expression and purification of N-terminal domain of the human Eya protein.\r\n\r\nMy study was done on the N-terminal region of the human Eya protein (WT and a splice variant), a tyrosine phosphatases protein and included DNA extraction (mini-prep, midi-prep), PCR, cloning, bacterial isolation and culture, agarose gel electrophoresis, bacterial transformation, SDS-PAGE, protein purification (FPLC: Affinity chromatography, Ion-exchange chromatography), enzyme assay, Western blot analysis, preparation and identification of nucleic acids and kinetics assay.\r\nThe study was done in 5 months, but my internship lasted 1 year, because I helped one of the PhD student with some experiments for her thesis.\r\nBecause we had good results, we have a manuscript in preparation - Pascaru(Mentel) M., Ureche C.I., Szedlacsek SE\r\n\r\n\r\n\r\nIn the context of sustainability, during this last year of my master, I decided to do an internship in the Molecular Epidemiology Department of the Cantacuzino Institut (January 2011 - present), because I wanted to learn more about the virology world. Here I had the opportunity to work with various viruses and bacteria , like: HCV, HBV, Corynebacterium diphtheriae, Bordetella pertussis; to master DNA/RNA extraction, purification, PCR,  agarose gel electrophoresis, RT-PCR, real time PCR and DNA sequencing.\r\nPublications:\r\n1. Oprisan G, Dinu S, Tanase AM, Dima S, Dumitrascu T, Ureche CI, Marchio A, Pineau P and Popescu I (2011). Identification of mutations in the core gene of hepatitis C virus with implications in carcinogenesis and resistance to treatment. Bucharest - Symposium "Academician Nicolae Cajal" VI ed.,23.\r\n2. Manuscript in preparation: "A new distribution of Hepatitis C virus genotypes in Romania",  Sultana,C., Ruta,S., Vagu,C., Temereanca,A., Grancea,C., Dinu,S., Ureche,C.I., Teleman,M. and Oprisan,G.\r\n\r\n\r\n\r\n\r\nDiploma thesis title: Effect of Aequorine overexpression upon the phenotype of Saccharomyces cerevisiae cells lacking the transcription factor Yap1p.\r\nMain activities: yeast culture (Saccharomyces cerevisiae), S. cerevisiae transformation\r\n', '2011-05-26 16:59:48'),
(117, 13, 'My first laboratory work experience was at Functional and structural Biochemistry of protein laboratory’s, under the supervision of Prof. Iadarola. This experience was my training program for the first level degree curriculum. My research was directed to the studies of enzyme with elastolytic activity, Cathepsin G (CatG) and the Human neutrophil elastasis (HNE), in samples of sputum sol phase obtained from patients affected by cystic fibrosis. Degradation of extracellular matrix components is one of the results of the concerted action of large numbers of enzymes with elastolytic activity generally involved in the onset of obstructive pulmonary disease as cystic fibrosis. Understanding the contribution of each protease in determining this process is thus of great utility in elucidating the pathogenesis of the disease. The aim of my work was to verify the general applicability of micelle electrokinetic chromatographic (MECK) technique for the direct determination of free serine- and iron-proteinases in biological matrices.\r\n	During my first year of master degree I spent six months in the Human molecular genetics 	laboratory coordinated by Dr. G. Camerino and Dr. O. Radi to carry out of universitary 	credits. During this time I was involved in the study on mutational genetics with use of PCR 	and RT-PCR of different genes that regulate the determination of sex in human and 	development of gonads. I was learned well the genetic approach for the mutation of human 	genes studies. During my master Degree I did my internship in the general Microbiology 	laboratory coordinated by Prof. E. DeRossi. The scope of my work has been the 	identification and characterization of BM212 target in M. smegmatis. To this aim, resistant 	mutants were isolated and their genomic libraries were screened for BM212 resistance, 	allowing the identification of three proteins as possible BM212 targets.  Mutations were 	identified in the mmpL3 gene; since mutations in the target gene are responsible for drug 	resistance, the MmpL3 protein seems to be the cellular target of BM212. MmpL proteins 	show similarity with RND family of efflux pumps, able to extrude structurally and 	functionally unrelated compounds out of the cell. Experiments demonstrated that MmpL3 	does not extrude BM212, suggesting that this protein is not an efflux pump. A genetic study 	of the role of mmpL3 gene’s of M. smegmatis as possible target of anti-tuberculosis drugs. I 	had used a particular technique, based on the use a suicide plasmid, to inactivate mmpL3 	gene to allow us to demonstrate not only if the MmpL3 protein is the target of BM 212, but 	also if it is an essential target, as well as to determine its function. This year, from January, I 	have started a fellowship of six months at the Biocrystallography Unit, coordinated by Prof. 	M. Degano at 	DIBIT, Biotechnology Science Park- S. Raffaele in Milan. My fellowship period will end in June 2011. I’m learning different technique of biochemistry, as protein purification and crystallization.\r\n', '2011-05-27 17:21:14'),
(86, 29, '(2008-2009) Prokaryotes Molecular Genetics Laboratory (Faculty of Science and Technology, New University of Lisbon, Portugal). The project involved the genotypic and phenotypic characterisation of Streptococcus pyogenes antibiotic-resistance genes in assymptomatic carriers. Main activities were in genetics, microbiology and molecular biology. The work developed undoubtedly allowed my to be independent in the laboratory, as well as working in team and more importantly launch my scientific interests and perspectives.', '2011-05-24 22:19:12'),
(95, 56, 'January – May 2009: Master 1 internship, National and Kapodistrian University Hospital Aretaieion, Department of Biochemistry and Microbiology, Athens, Greece. Director: Pr. E. Kouskouni, supervisor: Dr. G. Kaparos (captenkap@yahoo.gr .\r\n Project:  Molecular techniques in a clinical practice. Detection and identification of HPV virus ‘’Screening Test ‘’ and ‘’Genotyping Test’’ and Detection of Chlamydia trachomatis ‘’CT Test’’ \r\n\r\nIn this internship I discovered how research is advancing in Greece, my country of origin, and I was able to compare different scientific mentalities, having studied in France. I was introduced in a laboratory team for the first time and the experience I took from it, got me eager to follow my ', '2011-05-25 11:21:07'),
(81, 66, 'Over two years of experience in laboratory animals management and in the handling of biological samples. Futhermore, I learned to apply molecular biology techniques for their use in functional testing.\r\n\r\nWORKING EXPERIENCE IN THE SCIENTIFIC FIELD:\r\n1) Institute of Biology and Experimental Medicine,\r\nLaboratory of Cellular Interaction Studies in Reproduction and Cancer, \r\nHead: Doctor Mónica H. Vazquez-Levin,\r\nCo-head: Doctor Clara Isabel Marín-Briggiler,\r\nPosition: Intern in Biotechnology Bachelorship, \r\nThesis Subject: “Neural cadherin in the human gametes and their role in fertilization”,\r\nAcquired knowledge:\r\n- Handling of human semen sample,\r\n- Hamster manipulation (hormonal treatment of females, collection of oocytes),\r\n- Gamete culture for their use in functional testing,\r\n- Immunocytochemistry technique of fluorescence. \r\n2) Faculty of Agronomy - University of Buenos Aires,\r\nLaboratory of Animal Biotechnology - Animal Production Department,\r\nHead: Doctor Daniel F. Salamone,\r\nPosition: Intern, \r\nWork Subject: “Isolation and culture of stem cells in mice embryos”,\r\nAcquired knowledge:\r\n - Mice manipulation (hormonal treatment of females, matings, collection of blastocysts and isolation of fetal fibroblasts),\r\n - Culture of embryos and explants.\r\n3) NAF SA \r\nLaboratory of dental products for oral care,\r\nHead: Doctor Héctor Noriega,\r\nPosition: Intern in the area of quality control,\r\nTasks carried out:  \r\n -“Formulation of products for oral mucous treatments”,\r\n - Process control,\r\n - Water analysis,\r\n - Other tasks: treatment of goods’ refunds, control and filing of departure records, assistant to the control of the deposits of raw material and goods.\r\n\r\nPersonally, this work helped me to make questions and to think the way for answer them.\r\n', '2011-05-24 04:00:51'),
(93, 56, 'February – May 2010: Master 1 internship, Centre of Molecular Genetics CNRS/UPR 2167,\r\nDepartment of Development of Cellular Dynamics, Gif-sur-Yvette, France.\r\n Director: Anne-Marie Prêt (pret@cgm.cnrs-gif.fr).\r\n Project:  The role of apoptosis of polar cells in drosophila ovaries, in the ovarioles structures, that\r\nleads to two pairs of polar cells per follicule.\r\nDuring this internship I worked with experimental biologists and I had the opportunity to study drosophila melanogaster, one of the best model organisms in developmental biology. I dissected drosophila ovaries and effectuated immunostaining techniques in order to observe their cellular structure in epifluorescence and confocal microscopy.  Working in a CNRS unit is very important for a young researcher in France as it provides all the theoretical and practical tools that one may need to understand and progress in biology research.\r\n', '2011-05-25 10:21:59'),
(92, 56, 'November 2010- July 2011: Master 2 internship, Institut Curie/CNRS UMR144, \r\nCellular Signalling and Morphogenesis, Paris, France. Director: Pr. Daniel Louvard, supervisor:\r\nDanijela Vignjevic (Danijela.Vignjevic@curie.fr). \r\nProject:  The role of carcinoma-associated fibroblasts in the initiation of colon cancer cell invasion\r\nand migration.\r\nDuring my current internship I was introduced into the practice of cellular biology research. I was familiarized with the following techniques:\r\nCellular culture: established epithelial cancer line, human isolated fibroblasts.\r\nIsolation of human cells from tumorous and normal tissue.\r\nMolecular biology techniques: Western blot, immunofluorescence.\r\nIn vitro co-culture experiments: Boyden transwell invasion and migration assay,				                               Spheroids embedded in a 3D collagen matrix.\r\nIn vivo experiments: subcutaneous and intrasplenic co-injection of human cells in mice, measurement and dissection of tumors.\r\n\r\nThis internship has so far contributed to broaden my knowledge in cellular biology, as well as understanding how human cells are isolated and cultured in vitro. Working with human material is very interesting because it gives the opportunity to study cancer directly in the human context and testing these cells in vitro and in vivo is a thrilling experience and a very good training for a young researcher like me. The Curie Institute gives the opportunity to interact with great scientists providing great scientific interaction and high technology equipment to work with. For all these reasons, I developed a great interest in cellular and cancer biology research which motivates me to keep on studying and working in this field.\r\n', '2011-05-25 10:21:42'),
(96, 70, 'I, Rohit Bansal, am pursuing M.S. in Medicinal Chemistry and would be graduated in June 2011. In M.S. the diverse curriculum comprises of subjects like Logic in organic synthesis, Structure & function of biomolecules, Stereochemistry, Pharmacological screening & assays, Industrial process & scale up, Spectral analysis, and a one year research project. These courses offer both depth and breadth across this field. While the topics in 1st& 2nd Semester strengthened the scientific understanding, the practical acquainted me with certain technical skills like handling various types of reactions, Computational chemistry, separation techniques, and Biostatistics etc. 3rd& 4th semester encompassed an independent research project and subsequent presentations and report submission. A one year independent research project is mandatory requirement for M.S. program.					\r\n				The objective of my project is “The Design and Synthesis of structurally diverse scaffolds as potential HIF-Prolyl Hydroxylase inhibitors”. The work involves the synthesis of series of molecules based on different heterocyclic motifs. I gained extensive experience in organic synthesis, structure elucidation of compounds synthesized, GLP’s, literature search and experienced handling of various instruments. This allowed me to develop scientific knowledge and skills to carry out a research project either individually or in collaboration. I also did allied projects to hone my technical skills that can be published in future. The drafting and filing of a patent for work done in the laboratory also abetted me to acquire the knowledge in the field of IPR. I also learned molecular modeling software to design the scaffolds relevant for synthesis. \r\nIn my undergraduate years, I’ve acquired a strong background in the fundamentals of basic pharmacy subjects like Medicinal Chemistry, Organic Chemistry, Pharmacology, Pharmaceutics, Biotechnology, Microbiology and Management. These fostered interdisciplinary skills in me. I acquired knowledge in drug design & development, organic synthesis, formulation, drug’s mode of action and drug delivery etc. Here, I realized the vastness and scope of Chemistry in Drug Discovery & Development. This kindled my interest in Chemistry and to choose it as a career. The desire to delve deeper into this subject persuaded me to take GATE and NIPER Entrance test to get admission to a premier institute of INDIA, NIPER, SAS Nagar.\r\nI have also been a keen participant in extra-curricular activities throughout my school and university days. I am also a coordinator of weekly seminar club organized by our department and also active member of hostel’s core committee and other recreational activities. I did three months training in hospital pharmacy where I interacted with the staff and customers. A two months training at Synmedics laboratories exposed me to the work culture of an industry. All these experiences were very helpful in improving my ability to co-operate and communicate effectively.\r\n', '2011-05-25 17:24:51'),
(127, 73, 'Sr.Research Chemist: Sai-Advantium Pharmaceutical Ltd, Pune. From 1st Mar 2008-till Date', '2011-05-28 06:43:55'),
(123, 73, 'M.Sc PROJECT:- Isolation, extraction of secondary metabolite from Plan & identification of that component in Sci-molecules India PVT.LTD.', '2011-05-28 06:34:17'),
(102, 67, '2008-2010 Hospital de Cruces, Barakaldo. Dr. M ª Isabel Tejada Minguez (Head of Molecular Genetics Laboratory)\r\n\r\nResearch grant for the development of a project carrying out the genetic support in the Laboratory of Molecular Genetics.\r\nWorking with different medical disciplines in a translational project helped me to get an overview of research and I learned all aspects, such as purchasing, reports, protocol writing ...\r\n\r\n2008 Hospital de la Santa Creu i Sant Pau, Barcelona. Dr. Matilde Parreño (Research Associate).\r\n\r\nContract as a lab technician in Oncogenesis and antitumor Group within Biomedical Research Centre Network in Bioengineering, Biomaterials and Nanomedicine.\r\nI acquired skills in laboratory techniques, group and independent organization.\r\n\r\n2007-2008 Institut Municipal d''Investigació Mèdica (PRBB), Barcelona.\r\nDr. Pilar Navarro (Head of Molecular Mechanisms of tumorigenesis Group)\r\n\r\nPractices supporting drug tests on models of Alzheimer''s disease.\r\nIt helped me launch my career and meet the scientific work from within.\r\n', '2011-05-26 10:44:11'),
(112, 29, '(2010) SWan Biotechnology Laboratory (Kingston University London, UK). The Masters Research Project involved the production of monoclonal antibodies by the hybridoma technology and its purification for assessment of specificity to HER-2 proteins in cancer cells for evaluation of its possible use as anti-cancer agents. The project allowed me to develop skills in cell culture, acknowledge the molecular biology in maneuvering/studying cancer cells, hybridomas and respective antibodies. Furthermore, the abroad experience permitted me to enhance my english skills and more importantly my laboratory skills and competences. ', '2011-05-27 15:26:12'),
(107, 49, '2009- Blazar Game Center SL: Monitor. Aprendi a trabajar con grandes grupos de personas, preferentemente niños en un ambiente lúdico. \r\n2008- Sociedad ExpoAgua Zaragoza 2008: Supervisor de la Unidad de Acción del Departamento de Planificación, Gestión y Acción Voluntaria. Aprendí a trabajar gestionando grupos de personas en el terreno y a solucionar problemas surgidos durante el día a día. \r\n2006- El Corte Ingles: Mozo de almacén. Descubrí el mundo laboral junto con el saber estar que requiere el trabajo de cara al público.', '2011-05-26 21:23:09'),
(129, 78, 'I worked on project “angiogenesis assay of THP1 cells stimulated with VEGF-A, VEGF-D and IFN-gamma”. The purpose was to observe type of protein expression level after stimulation with VEGF-A, VEGF-D and IFN-gamma in THP1 cells. VEGF´s play important role in angiogenic cancer spread which is one of the hallmarks of cancer. Besides growth factors, macrophages have also been involved in cancer development. The goal was to understand the growth factors and their role in cancer. \r\nThe second project was “Effects of berry extracts on mitotic checkpoint”. Mitotic abnormalities represent another area by which development of cancer occurs. The objective of this study was to know more about SAC (spindle assembly checkpoint) and effects of these compounds on cells. We found out that these compounds had growth regression effects on HeLa-H2B-GFP cell line with high concentration as well as these extract could not rescue cells from mitotic arrest by Taxol. I did experimental work for these projects. \r\nI am doing my master’s thesis at VTT (Technical Centre of Finland) which is the biggest multi-technological organization of Northern Europe. My research involves certain genes (FMOD, WARS and PRSS8) essential for mitosis and cytokinesis and SAC and defects in these genes can cause cell division defects and cancer. I have spent more than a year for research related activities in the laboratory and in addition I am working on my thesis since February 2011. \r\nI also have experience of molecular biology techniques like Protein and RNA extraction and conc. estimation, SDS-PAGE, DNA Gel Electrophoresis, Western Blotting, ELISA, Cell culture transfection, Flow cytometery, siRNA knockdowns, Microscopy, Quantitative PCR, and I am willing to learn more.  \r\n', '2011-05-28 08:15:42'),
(111, 29, '(2011) CEDOC- Chronic Diseases Research Centre (Faculty of Medical Sciences, Lisbon, Portugal). The project involved Arl13b protein (GTPase protein relevant in cilia assembly and function) expression trials in E. coli strains. Protein purification and quantification was performed for crystallography and immunoprecipitation assays. The work clearly enhanced my molecular biology techniques, mainly within proteins, busted my scientific thinking and rationales and furthermore my presentation skills.  ', '2011-05-27 15:20:22'),
(115, 68, 'I’ve done my graduate internship at ICVS, University of Minho, in the Microbiology and Infection Domain Laboratory during my graduate degree in Applied Biology. The aim of this project was the study of the dynamics of Th1, Th17 and regulatory T cells during a Listeria monocytogenes infection, and was supervised by Doctor António Gil Castro and co-supervised by Doctor Andrea Cruz.\r\nIn 2009 I’ve finished a post-graduation in molecular genetics at the same laboratory. My master thesis was entitled”Characterization of the in vitro cytokine response of phagocytes to Mycobacteria”, and it was supervised by Doctor Jorge Pedrosa and co-supervised by Doctor Margarida Saraiva.\r\nFrom 2008 to the present, I’ve a fellowship in this laboratory where I developed skills and experience in cellular and molecular immunological methods, namely: tissue culture, differentiation of bone marrow derived macrophages/ dendritic cells/ neutrophils, RNA and protein analysis, immunofluorescence, flow cytometry, and animal laboratory sciences (F.E.L.A.S.A. - level C). I also work with several experimental models: since in vitro to in vivo models, and also with different types of microrganisms (Listeria monocytogenes, different strains of Mycobacterium tuberculosis and M. bovis BCG. Since I work with pathological microorganisms, I´ve also have instruction and practice in BSL2 and BSL3 working conditions. \r\n', '2011-05-27 16:09:49');
INSERT INTO `jos_phd_work_experiences` (`id`, `applicant_id`, `experience`, `modified`) VALUES
(119, 82, 'Summer 2009: "Conselleria de Sanitat i Consum d''Eivissa i Formentera" doing microbiological and chemical analysis of food and waters. With this work I could see how is work in a serious laboratory. I adquired some experience and I learnt some things about lab equipment maintaining.\r\n\r\nFebruary 2011 to June 2011 as a visiting student (doing a "Beca de col·laboració UB") at Dr. Antonio Celada''s group of Macrophage biology at the IRB. In this laboratory I have learnt how is the world of the investigation, and overall, I convinced me that this is what I want to do. In this period of time I have learnt lots of techniques and knowledge about the branch of immunology. ', '2011-05-27 17:24:21'),
(120, 53, 'For my Bachelor Degree in Biotechnologies I worked in the Cellular Physiology laboratory of prof. Antonio Contestabile, at the University of Bologna. I spent three months in that lab and I worked on a cancer cell line, Medulloblastoma’s cells, to investigate the role of nitrogen monoxide donor compounds on vitality and proliferation of these cells. \r\nMedulloblastoma is a malignant tumor of the cerebellum, common in pediatric ages. It origins by cerebellar granul neural progenitors (CGNPs), the principal cell line in cerebellum. Most of genetic alteration involved in this tumor are responsible of the destruction of the developmental programme of CGNPs. Among these, alteration of the Shh , Wnt and receptors Notch pathways are widespread. Moreover, recent studies dimostrated a correlation between activation of metabotropic glutamate receptor mGluR4 and the reduction of proliferation of cancer cells. Also, ornithine decarboxilase is an enzyme whose action is frequently involved in cancerogenesis. Nitrogen monoxide is sinthetized by nitric oxide synthase (NOS) and it has pleiotropic effects on different tissues. In nervous system it is sinthetized by neural NOS and it is implicated in many different signaling pathways involved in neuroprotection or acting as a neurotransmitter. Recent studies demonstrated a potential antiproliferative role for nitrogen monoxide on CGNPs and neuroblastoma cells. We demonstrated that DNO (DETA-NONO ate), a donor of nitrogen monoxide, can cause reduction of proliferation and vitality of a medulloblastoma cell line (DAOY), suggesting a new perspective in pharmaceutical research in cancer treatment.\r\nDuring this experimental experience, my first one, I could learn about basic techniques of cellular biology and biochemistry.\r\n', '2011-05-27 17:24:34'),
(168, 93, 'Estudiante en prácticas en CITA llevando a cabo el estudio sobre "Trazabilidad mediante biomarcadores en ganado ovino"', '2011-05-30 22:19:26'),
(144, 53, 'In latest years it has been demonstrated that many viruses can use endocytic pathways to gain entry into host cells. Herpes Simplex Virus 1 is an enveloped virus that can enter cell by at least two different ways: direct fusion at the plasmatic membrane and endocytosis. Recent studies demonstrated that this virus can enter some cell types by different endocytic mechanisms, such as macropinocytotic or phagocytotic-like ones. Because the choice of the viral entry pathway seems to be directed by the specific cell line, it’s common knowledge that there are cellular determinants of it. Integrins are trans-membrane proteins involved in cell adhesion at the extra-cellular matrix. Many virus use integrins as receptors or co-receptors in infection. Integrin alphav beta3 has been considered a probable determinant for HSV-1 entry. We demonstrated that in different cell lines over-expressing integrin alpha v beta 3 the virus enters cells by a specific way depending on cholesterol-rich domain and dynamin-2. Also, integrin alphav beta3 is a dispensable determinant of entry of HSV-1: the absence of this membrane protein does not abolish infection that is characterized by some signaling events, (such as activation of proteins FAK, Akt, Cdc42 and formation of filopodia-like membrane structures), irrespective of its expression.\r\nDuring this experimental experience I could learn about techniques of molecular biology, general virology and biochemistry. In particular I became familiar with the use of some techniques like: plasmidic DNA extraction, transfection of cells, Immunofluorescence, CELL-Elisa and Western Blot. \r\nThese two experiences allowed me to improve my skills in scientific field and to learn some basic features of this job.', '2011-05-30 05:59:53'),
(124, 73, 'Research Chemist: TCG LIFE SCIENCES Ltd [Chembiotek research international Pune]. From Jun 2006 -Feb.2008', '2011-05-28 06:35:51'),
(130, 64, 'Virginia Bioinformatics Institute, Virginia Tech, USA (June ‘10 – September ‘10)\r\nInternship as a Research Assistant\r\nGenotyping using PCR. Animal experimentation procedures. Tissue samples process for cell counting. mRNA isolation and quantification for cDNA synthesis.', '2011-05-28 10:30:02'),
(131, 64, 'Blood and Tissue Bank of Barcelona (June ‘09 – September ‘09)\r\nLaboratory Technician\r\nTotal blood separation in plasmas, Buffy coat and packed blood cells. Labeling and storage under specific conditions of plasmas and packed blood cells. Responsible of special products arriving in the lab (plasmapheresis filtration and autotransfusion control). Incidence control and its logging in the internal database (packed blood cells, plasmas or plateletpheresis).', '2011-05-28 10:30:24'),
(132, 64, 'Laborti Veterinària, SL. (June ‘08 – September ‘08)\r\nLaboratory Technician\r\nSubstitutions for the areas of: organization, preparation and conservation of samples. Hematology. Microbiology. Biochemistry.', '2011-05-28 10:30:36'),
(133, 64, 'Vall Hebrón University Hospital (2004 – 2005)\r\nInternship as a Laboratory Technician\r\nDepartments: Emergency biochemistry. Hematology. Immunoanalysis. Central Cell of Reception and Sample Sending (C.C.R.S.). Semenologic Analysis. Cell cultures and cytology.', '2011-05-28 10:30:47'),
(134, 83, 'My experience as a researcher has started in the final year of my undergraduate studies in the University of Leicester. That was a 3-month laboratory based research project studying the possible transgenerational instability caused by chemotherapeutic drugs. The project involved techniques such as PCR, southern blot, in situ hybridization, gel electrophoresis. Through PCR amplification and southern blotting, mutations were detected in an ESTR (Expanded Simple Tandem Repeats) region of the paternal and the offspring''s genome in mice. The results were compared between un-exposed and exposed mice to the anticancer drugs. This short but really intriguing research project evoked my interest in human molecular genetics and their relation to disease.\r\n\r\nFollowing the completion of my undergraduate degree I got a place to do a post-graduate MSc degree in Human Molecular Genetics at Imperial College London. A 6-month research project was part of my MSc course. The aim of this project was the identification and determination possible causal genomic variants of dementia within Parkinson''s disease. It involved DNA exraction from 300 human brain samples obtained from the Parkinson''s disease brain bank (Imperial College London). The SNPs (Single Nucleotide Polymorphisms) were genotyped through high-throughput genotyping (Sequenom MassARRAy platform) and high-throughput sequencing. Other genotyping methods involved the identification of a deletion consistent with one of the haplotypes studied, through standard PCR and gel electrophoresis. The above project was novel since it was a genetic association study involving brain samples from Parkinson''s disease patients and the results of the association study were correlated with the neuropathology of the samples. The overall course and especially my research project made me realize how crucial biomedical research is. The hard work, dedication and effort one has to put to his research field of interest. \r\n\r\nSince the 1st of February 2011 I have been working at the Cyprus Institute of Neurology and Genetics on a voluntarily basis. I am actively involved in a research project studying chromosomal abnormalities of the X-chromosome through oligonucleotide aCGH, Real Time-PCR, Long Range-PCR and sequencing in individuals with mental retardation syndromes. It has been a unique experience so far that gave me the opportunity to broaden my knowledge in copy number variation and the various methods currently employed to detect and analyse them. Apart from the technical aspect of it, this internship gave me the opportunity to work with great and inspiring scientists localized in my country and made me realize that entering a Phd program would fulfill me as person and drive my scientific career to the next level.\r\n', '2011-05-28 17:42:02'),
(136, 86, 'In Bachelor of Science (B.Sc) I have completed 3 objectives:\r\n1. Study the genetic variability in two freshwater chelonian species viz., Lissemys punctata and\r\nAsperidetes gangeticus using mitochondrial cytochrome b marker.\r\n2. Study of genetic variability in river population of L. punctata with RAPD fingerprinting.\r\n3. Development of Forensic marker for endangered freshwater turtle species viz., Lissemys punctata with RAPD fingerprinting.\r\n\r\nIn my M.sc dissertation I have designed a primer against superoxide dismutase (SOD)\r\nenzyme and amplify the sequence using gradient gel electrophoresis and then sequenced\r\nit. I have also done lymphocyte culture & chromosome preparation. Fish chromosome\r\npreparation is obtained using direct method and cultures of various tissues and organs. The blood lymphocyte culture is probably the most useful technique having some potential advantages including non-deleterious collection of blood, repeated blood sampling from one individual.\r\n\r\nIn my M.Phil thesis, I have expertised in various fruitful techniques such as Lymphocyte culture, Protein purification, Immunohistochemistry, Immunofluorescence, SDS PAGE, electrophoresis, Western blotting & Southern blotting, Transformation, Microbial culture,\r\nReal time PCR (qRT-PCR), RAPD, RFLP, DNA isolation (Genomic, Plasmid), RNA\r\nisolation, cDNA library preparation, Chromosome preparation, Perfusion fixation and tissue processing for histology, Histochemical Staining, Image Analysis, HPLC, ELISA through the part of this course. My major worked is on reproductive biology of fishes.\r\n\r\nNow I am working as a Senior Research Fellow (SRF) in VMMC & Safdurjung Hospital,\r\nNew Delhi, Here my research topic is on "Wnt/β-catenin signaling pathway in cervical\r\ncancer and its association with HPV".', '2011-05-28 18:54:01'),
(138, 85, 'I chose mol. biology and genetics to study as my bachelor’s degree. I took a great risk by deciding to study in Istanbul. As a result of not being in touch with my father, I was not ready economically. However, with my ambitious personality, I easily adapted to Istanbul. I earned my life by working in addition to my education. As I like working much, I did not complain about it. Sometimes it was so tiring, but I think I acquired some important values with this life style such as a sense of responsibility and being focused on solutions, not the problems.\r\n\r\nDuring my bachelor’s, I found chance to work on different subjects such as molecular genetics of enzymes, plant cell cultures, nutrigenetics and molecular cardiology (via SNP recognitions). I learned important techniques practically and theoretically, but most importantly I found my interest which I want to study at my future. However, after graduation, I moved to another city due to my economical concerns and I started to work at R&D department of a plant biotechnology company. I learned plant cell cultivation but I was not happy of the reason I was away what I wanted to do, so after saving some money, I went back to Istanbul to apply for the master studies. Fortunately, I was admitted to Istanbul Technical University, one of the top universities in Turkey.\r\n\r\nAgain due to my economical concerns, I started to work at ITUBEM biotech and environmental microbiology laboratory parallel to my studies. I was analyzing almost all the samples of Istanbul Municipality (soil, pool /sea water etc.) and also working on different issues such analyzing bactericidal capacity of PVC materials. Mean time, I supervised thesis of two bachelor’s students. Besides, I could be able to write an abstract and send a poster to Seattle, International Society for Microbial Ecology. During this timeline, I effectively used microbial analyze methods, PCR and electrophoresis techniques.\r\n\r\nBeginning of my thesis stage, I won the Erasmus Mundus Scholarship and I got a chance to work on what I wanted. During the year, I have been working on my thesis in three different institution (Mannheim University of Applied Sciences, German Cancer Research Center and Heidelberg University Medical School) İn Germany. I have learnt and performed important techniques such as gene expression analysis, direct/indirect immunofluorescence imaging, stem cell culture and differentiation assays. I have had precious supervision of Prof. Christian Maercker and PD Dr. Dirk Breitkreutz but I was independent kind of like a PhD student.\r\n\r\nI worked on four different cell strains (bone marrow and adipose tissue – derived mesenchymal stem cells and dermal fibroblast) and set up cell cultures for both gene expression analysis and fluorescence staining. I have performed gene expression analysis via RNA molecules by having cDNAs with rt reaction. All these cultures were also set up for osteogenesis and all the analyses were done for those type of cells, however, due to a disharmony between the osteogenic primers and the probes, we could not be able to use those data. I also analyzed the effects of some extracellular matrix proteins on adipogenic differentiation. Accordingly, I coated flask surfaces with collagen type I and type IV, fibronectin and laminin proteins and differentiated a MSC strain on these surfaces. Afterwards I analyzed the cells with phase-contrast and fluorescence microscopy and relative gene expression analysis. Working with plenty of cell cultures in three different institutions and performing different experiments at the same time was a challenging process, besides, there was not someone directly caring about me, but at the end I carried out the experiments successfully and gained the data which was also kind of a confirmation of impedance measurement experiments in my group. I learnt important techniques, but more important thing is that I learnt taking responsibility and being well organized and productive as much as I can.', '2011-05-28 19:14:18'),
(140, 72, 'As a part of curriculum of my masters, I worked on the project entitled ‘studies towards the total synthesis of Brassinolide’ under the supervision of Prof. M.G.Kulkarni at University of Pune, one of the most prestigious institutes in India which is collaborated with National chemical Laboratory of Pune.     Witting olefination followed by Claisen rearrangement protocol is the key step in this scheme. The four months of lab experience made me to develop good experimental hand over basic laboratory techniques as well as exposed me to the research environment for the very first time. Having realized that research experience is one of the deciding factors to get admission in any foreign university, I further continued my candidature as Research Assistant under the guidance of Prof M.G Kulkarni and successfully participated in the efficient synthesis of “hexahydrofuro[2,4-b] furan-3-ol” derivative (accepted for publication in Tetrahedron Asymmetry) and Novel approach for “3-methyl quinoline-4-carbaldehyde” synthesis (communicated to Beilstein Journal of Organic Chemistry). Recently we found out a new combination of reagents for the single step conversion of organic halides into carbonyl compounds. We successfully applied this method on different benzylic halides. We are trying to generalize this method. My other synthetic targets are Quinic acid, Shikimic acid and Stagonolide-F. We are following chiran pool approach to synthesize these molecules by using D-Mannitol as starting material. In sum I have research experience of two years in synthetic organic chemistry. The projects I have undertaken have given me a first-hand experience in formulating new problems, writing research papers etc, which are although auxiliary but unavoidable aspects of research work. My research experience and symposiums I attended have helped me stay abreast the changing trends of the Chemical sciences.  Through collaborating with people coming from academia and industry, my teamwork ability and the efficiency in real problem solving with critical thinking was greatly enhanced.', '2011-05-29 11:22:35'),
(141, 62, '•	The research for my Master thesis I undertook at the Centre for Forensic Science (CFS) at the University of Western Australia (UWA). I chose the centre for  its world-leading facilities and unique academic expertise. My supervisor was Prof Ian Dadour. I investigated the effect of fire on decomposition and arthropod succession and the implications for post-mortem interval estimations. I applied my knowledge of forensic entomology. This included biological and behavioural aspects, as well as an understanding of correct identification of entomological specimen.\r\n•	Traineeship in Directorate-General Research (DG RTD), Unit I.2 Environment - Sustainable Development. My supervisor was Peter De Smedt. I designed and carried out a scoping study on the ‘Research for Impact Assessment (IA)’ with an emphasis on the use of IA tools. My work consisted of research and interviews with different stakeholders, including European Commission officials. The traineeship provided me with the opportunity to acquire specialised knowledge and practical experience of EU practises and policies, regulatory and legislative affairs and procedures, and the general activities of the European Commission. \r\n•	BSc Project in Developmental Genetics at the University of Sussex (US), in Brighton, UK. My supervisor was Dr. Juan Pablo Couso in the Developmental Genetics Research Group. My research area was developmental genetics, studying the model organism Drosophila melanogaster (fruitfly). I carried out site-directed mutagenesis to isolate and characterise the phenotype of mutants in a specific gene, presumed to be involved in leg development.\r\nI was able to practically use my biological and genetic background by working with Drosophila as a model organism. \r\n•	Erasmus year in Madrid, Spain, at the Instituto de Investigaciones Biomédicas (IIBM) in the Department of Oncology and Human Diseases. My supervisor was Dr Rosario Perona Abellón in the Department for Experimental Models of Human Diseases. I established and characterised cisplatin resistant genetic sublines (NSCLC) H-23. It taught me to work with human cell cultures and I was able to consolidate my practical skills in the biomedical sciences.\r\n•	Pathology Placement at the T.U. Munich - Division: Institute of General Pathology and Pathological Anatomy). I gained insight into laboratory procedures and the investigative steps employed in cancer research. I observed and assisted in the preparation of cancerous tissue and attended autopsies.\r\n', '2011-05-29 20:58:05'),
(143, 89, 'Development of methodology: \r\nH2SO4–Silica Promoted Direct Formation of β-Glycosides of N-Acetyl Glycosylamines under Microwave Conditions Synlett 2009, 3111–3114.  N-Acetyl glycosamines is an important sugar unit owing to its abundance in various biologically active oligosaccharides. Inspired by the work of a research group I tried the methodology for Direct Formation of β-Glycosides of N-Acetyl Glycosylamines under Microwave Conditions with H2SO4–Silica as promoter and to my happiness this promoter showed better results. This methodology was advantageous over other methodologies that have been used so far for the direct formation of β-Glycosides of N Acetyl Glycosylamines since it was inexpensive and non toxic and catalyst can be easily removed from the product by filtration. During my work I did a lot of study on β-Glycosides of N Acetyl Glycosylamines, their importance and methods used so far for synthesizing them, how the development of methodologies got better and better with time, chemistry behind  the reactions, their positive and negative aspects. This not only increased my knowledge but developed my interest towards synthetic chemistry. I was fascinated by the world of synthetic chemistry. Because of my growing interest in synthetic chemistry I did my master’s thesis project on synthetic chemistry. 2.Synthesis of a tetrasaccharide related to the triterpenoid saponin Bellisoside isolated from Bellis perennis (compositae): Tetrahedron: Asymmetry 2010, 21, 2172–2176.  Triterpenoid saponins are plant secondary metabolites synthesized routinely in the growth and development program in plants. Due to their intense anti-fungal properties, it is believed that these classes of molecules act as a chemical barrier against fungal attacks in plants. In addition to their role in the defence mechanism, triterpenoid saponins are used as a source of drugs against various diseases, mainly in the form of traditional medicines. Recently, Asada et al.reported the isolation and characterization of six new triterpenoid saponins (Bellisosides) from Bellis perennis (compositae), the common Daisy. It is reported that the extracts are already being used in traditional medicines for the treatment of rheumatism and as expectorants. Moreover, these saponins have shown cytotoxicity against HL-60 human promyelocytic leukemia cells. I successfully synthesize  the tetrasaccharide related to the saponins Bellisoside from commercially available monosaccharides through rational protecting group manipulation and stereoselective glycosylations. I learned a lot about synthesis and handling the lab stuffs during the synthesis of this small compound. This work enhanced my interest towards synthetic chemistry to many folds. Biological active compounds are the backbone of drugs and synthesizing them chemically is of great need and importance. This is where synthetic chemistry comes into play. Synthesizing a biologically active molecule increased my interest and confidence to work in this field. It introduced me to a whole new world of drugs and drug designing. Methodologies and synthesis of biologically active compounds are just a part of synthetic chemistry. I also worked on the following topics: Preparation of bis-triazole amide derivatives, Synthesis of 9-Hydroxyphenalenone, an Organic Conductor precursor, Synthesis of 3,4-Dimethylthiophene and electro polymerization of EDOT, Preparation of Mn8(III)Mn4(IV)O(CH3CO2)6(H2O)4, Mn2(III)Mn(II)O(CH3CO2)6(Py)3, Mn3O(CH3COO)6(Py)3](ClO4), K2 [Pt(DMSO)2Cl2.  \r\n Working on the above fields broaden not only my knowledge but also my vision and thinking. Dealing  with carbohydrates introduced me the whole new world of drugs and encouraged me to go for interdisciplinary fields\r\n', '2011-05-29 22:47:29'),
(167, 97, '2008-pres: Barcelona Biomedical Research Park - Pompeu Fabra University, Department of Experimental and Health Sciences, Laboratory of Pharmacology (Professor Rafael Maldonado and Dr. Blanca Rubí). Barcelona \r\n	Position: Student trainee. \r\n	Function: “Neuronal effects on endocrine pancreas: role of dopamine and cannabinoids”.\r\n\r\nJuly and August 2010: AstraZeneca (UK). Macclesfield. \r\n            Position: Trainee in metabolism research. \r\n            Function: “The effect of dopamine and clozapine in dopaminergic pathways on pancreatic islets apoptosis induced by iL-B and others cytokines.”\r\n\r\n 2005-2007:	 Barcelona Biomedical Research Park - Pompeu Fabra University, Department of Experimental and Health Sciences, Laboratory Behaviour (Professor Olga Valverde), Barcelona.\r\n	 Position:  Student trainee. \r\n             Function: Characterization of the molecular basis of cannabinoid action in an experimental mouse model. \r\n2010-2011: Teacher (Tutor) of problem-based learning (“Aprendizaje basado en Problemas”), Pompeu Fabra University; Barcelona. \r\n	\r\n2010-2011: Collaborator with the group of educational research in health sciences (GRECS) supporting research where the main objective is the approach of science to young people; Barcelona. \r\n\r\n2010-2011: Organizing Escolab''s, between Pompeu Fabra University, Barcelona City Council (Ajuntament de Barcelona) and Barcelona Biomedical Research Park (PRBB); Barcelona. \r\n', '2011-05-30 20:46:47'),
(147, 90, ') Project Title: Effect of Hibiscus Rosa sinensis flower petals on the copper induced lipid    peroxidation and gill damage in Cyprinus carpio\r\n   Place:  University of Mumbai, India\r\n   Time Period: July-February 2009-2010\r\n   Project Guide:  Dr. Ujwala Jadhav.\r\n\r\nHeavy metals, such as Copper (Cu), due to their bio-accumulative and non-biodegradable properties constitute a core group of aquatic pollutants. One of the major forms of damage caused by Cu toxicity in fish is due to oxidative stress in which cells lose their ability to reduce the Reactive Oxygen Intermediates (ROS) and repair the resulting damage. Lipid peroxidation ie. oxidative degradation of lipids is considered to be an important indicator of oxidative stress in fish. This is because the mechanism of lipid peroxidation mainly targets the poly-unsaturated fatty acids (PUFA) which are abundant in fish as an adaptation to maintain the membrane fluidity under water. This study was conducted using a model aquatic organism, Cyprinus carpio in view of understanding not only whether animals are detrimentally affected by Copper exposure, but also to understand the mode of action of the toxicant. Assay of the lipid peroxidation products was done spectrophotometrically at 550nm using Thiobabarbituric acid and the gill damage was observed by optical microscopy. Attempt was also made to carry out heavy metal detoxification in the fish Cyprinus carpio by using feed prepared from flower petals of Hibiscus rosa sinensis. Results indicated that the copper induced lipid peroxidation was significantly lower in the brain , liver gills and muscles of the fish fed with Hibiscus flowers as compared to the copper exposed fish, not fed with Hibiscus. Hibiscus rosa sinensis diet also showed a significant decrease in the lipid peroxidation, irrespective of copper exposure. Extensive damage to the gills of the common carp, Cyprinus capio was observed on exposure to copper in a dose dependent manner in the form of excessive mucous production, degeneration of the primary lamellae, fusion of the secondary lamellae at the tips and also depletion of the secondary lamellae at higher concentrations. This damage was greatly reduced in fish with the Hibiscus diet. High Performance Thin Layer Chromatography (HPTLC) of the Hibiscus flowers was done showing the presence of many phytochemicals such as coumarins, essential oils, alkaloids and saponins which have been reported to function as antioxidants.Thus, the potential of using Hibiscus flower extracts in formulating a feed for the fish exposed to heavy metal pollution was successfully proved. \r\n', '2011-05-30 09:01:29'),
(148, 90, '1)	Project Title: Production and purification of polyclonal antibodies towards Plakophilin3 and to clone its deletion mutants.\r\nPlace: ACTREC (Advanced Centre for Treatment, Research and Education in Cancer, Navi Mumbai, India) \r\nTime period:  May-June 2007\r\nProject guide: Dr. Sorab Dalal.\r\nDesmosomes are adherens junctions which help maintain the mechanical integrity in epithelial tisuues. Plakophilin3 (PKP3) is a desmosomal plaque protein. Plakophilin3 levelsare reduced in most of the oral tumor samples, suggesting that loss or reduction of Plakophilin3 might lead to cellular transformation. In order to observe the localisation of PKP3 and its co-localisation with other proteins, polyclonal antibodies to PKP3 were prepared. To begin with, the ( Glutathione-S-transferase) GST tagged PKP3 was affinity purified using glutathione sepharose beads and injected in the rabbit. The polyclonal serum collected after a month was then used to isolate antibodies to PKP3 using an immunoaffinity column prepared by cross-linking the GST-PKP3 protein with the glutathione sepharose beads. Apart from this, serial deletion mutants of PKP3 were cloned which would help in investigating the region of PKP3 significant for its function.\r\n', '2011-05-30 09:01:50'),
(149, 90, 'I am currently working as a Research Intern  in Cancer Research Institute (CRI), ACTREC , India, under the guidance of Dr. Sorab Dalal for a period of one year. I am addressing questions based on two projects which are as follows:\r\n One of the projects involves the investigation of the role of 14-3-3 proteins in mouse growth and development. It is known that the 14-3-3 proteins regulate several cellular signaling pathways by forming a complex with proteins containing phosphorylated serine residues in a specific consensus sequence. I have been addressing questions proving the necessity of 14-3-3 specific isoforms in stem cell lines and mice lacking 14-3-3 epsilon and 14-3-3 gamma, generated in the lab. Sorab  Lab  has generated a novel, faster and efficient technique to generate knockdown mice using Lentiviral mediated shRNA expression. \r\nIt was found that mice expressing shRNA for 14-3-3 epsilon die at 160 dpc and also exhibit enlarged spleens. Immunohistochemistry and immunophenotyping of the spleen from these mice show increase in the activated T cells as compared to the wild type, thereby suggesting that 14-3-3 epsilon has a role in regulation of T cell activation. Further, it is seen that, SLP76,a key molecule in T cell signalling shows binding with 14-3-3 epsilon but only in the presence of  Haematopoetic kinase 1 (HPK1), using Immunoprecipitation in HEK293 cells. I am currently generating 14-3-3 epsilon knockdown Jurkat cell line (T cell lymphoma cell line) to see if the observations can be extended in vitro.\r\nThe mice injected with the shRNA for 14-3-3 gamma show sterility. Immunohistochemistry of the testis of these mice shows arrest in most of the developing spermatocytes at stage VIII. Apart from this, adhesion defects in the spermatocytes in the testis of 14-3-3 gamma knockdown mice, are also observed. These results suggest that the loss of 14-3-3in the testes lead to a decrease in transport of spermatocytes to the epididymis, inhibition of spermatocyte differentiation and loss of cell-cell adhesion between sertoli cells leading to defects in Blood Testis Barrier (BTB) formation, which inhibits spermatocyte differentiation. Moreover, HCT116 derived 14-3-3 gamma knockdown clones shows alteration in the cell- cell adhesion properties as seen by the Hanging drop assay, confirming that 14-3-3 gamma plays a role in cell-cell adhesion. Further, decrease in the staining of desmosomal proteins is also observed in these 14-3-3 gamma knockdown clones by Immunofluorescence..Experiments are now being performed to analyse the expression patterns of various desmosomal proteins in the 14-3-3 gamma knockdown clones in HCT116\r\nThe other project is based on a finding in the lab that knockdown of PKP3, a desmosomal plaque protein, in HCT116, results in a transformed phenotype along with increase in the expression of K8. Thus, this project involves looking at the role of  Keratin8 (K8)  in causing neoplastic progression in Plakophilin3 (PKP3) knockdown cells with in vitro as well as in vivo approach using PKP3 and K8 double knockdown cell lines and mice, respectively, both generated by lentiviral mediated shRNA delivery. The in vitro transformation assays such as cell-cell adhesion, cell migration and soft agar colony formation in PKP3 and K8 double knockdown cell lines showed decrease in the transforming abilities as compared to the PKP3 knockdown cell lines. In vivo experiments in PKP3 and K8 double knockdown mice further strengthened the above results by showing decreased tumor formation and also metastasis as compared to the PKP3 knockdown mice. To confirm the decreased lung metastasis in PKP3 and K8 double knockdown mice as compared to the PKP3 knockdown mice, a PCR based strategy was developed to identify human cells in lung tissues in xenograft experiments in immune compromised mouse models of tumour progression and metastasis.   Also, analysis of expression and post translational modification patterns (such as phosphorylation and glycosylation) of K8, which may play a role in stabilising it, are being done in the PKP3 and K8 double knockdown cell lines. Apart from this, rescue experiments by re-expressing PKP3 in PKP3 knockdown cell lines are also being done to further confirm the results obtained.            \r\n', '2011-05-30 09:02:33'),
(150, 8, 'Masters Degree; Worked as part of a research group on an organic chemistry project towards my final masters report. This helped me to develop my practical techniques learnt in my undergraduate degree.\r\n\r\nLab Technician: I am currently working as a lab technician which gives me the opportunity to practice a wide variety of reaction and methods, and to become a more fluent chemist.\r\n', '2011-05-30 11:44:24'),
(151, 87, 'M.Sc thesis project: To clone the Neomycin resistant gene into pSuper-EGFP-mir21 and pSuper-EGFP-mir125b to generate the GFP-Neomycin expressing mammalian cell lines.\r\nAdvisor: Dr. Partho Sarothi Ray, IISER Kolkata, India January – May, 2011\r\nDescription of the work: Here I cloned Neomycin resistance marker in pSuper_egfp_miR-125b and\r\npSuper_egfp_miR-21 constructs. MCF-7 cells were transfected using these constructs and stable\r\ntransfectant for each was selected using Neomycin. These stable transfectants will be used to study the\r\neffect of RNA binding protein HuR on microRNA (miR-125b and miR-21) mediated translational\r\nrepression of their targets (p53 and PDCD4).', '2011-05-30 13:06:06'),
(160, 95, 'Scholar of the Anatomy and Embriology department in the UCH-CEU Veterinary Hospital (2008-09).\r\nEmployer: Jose Terrado at the Cardenal Herrera University.\r\nThis was my first job at the University, I find interesting to mention it because it gave me the sense of responsibility. I had to classify the different bone''s species, made bones extractions, arrange the Anatomy and Embriology laboratory according to the students needs and review the student''s knowlegdes. I apply for the job to help in the fee payment while I was studing, and I think study and use part of my studing time working has contributed to built me up.', '2011-05-30 14:00:17'),
(161, 95, 'Professional training at the Public Health Center of Valencia.\r\nEmployer: Ángel García.\r\nI decided to do my professional training at the Public Health Center because I had never expected to focuse my career just in one field, I wanted to try the most fields as possible during my studies to made a good choice at the time I would have my degree. My work experience was fantastic, I learn a lot of things about the food industry, some lab techniques and the importance of the veterinary role in this field.', '2011-05-30 14:07:44'),
(162, 25, 'During my education I used to work in different labs Guilan university and a Medical laboratory under supervision of Dr.Behrooz Heidari. I believe this experience has been so useful for me since I learned to work with different laboratory equipments, various assays and techniques and how to perform a group job at laboratory which i think plays an important role in becoming professional at my field.I have already explained the exact techniques I learned at this period in my motivation letter, that i think have influenced my knowledge deeply. From my point of view working at lab as a part of a group improve personality since you need to share every thing with your co-workers and you also learn a lot from them , that was exactly the same for me in my job experience.', '2011-05-30 14:11:31'),
(163, 74, 'During my bachelor, I have participated in some research projects in different laboratories.\r\n\r\n In Tarragona, I was working for a year in the Nutrigenomic Department of the University Rovira i Virgili (URV) studying procyanidins effects in chronic and acute inflammation. In this time I learn how to use a confocal microscopy, inmunodetection techniques and I earn experiences with cell cultures and basic techniques of a biology molecular laboratory, such as electrophoresis, western blott, DNA and RNA extraction…\r\n\r\nIn the personal field, work in the URV was an amazing experience that I never forget, my tutor helped me and supported at all times. Furthermore, work with other students and PhD. as a team was very rewarding, we compare results and we help each other to find solutions to a problem.\r\n\r\nAlso in Tarragona, I worked in the Hospital Joan XXIII for a summer in a study of apolipoprotein C3 gene expression in obese patients with non-alcoholic fatty liver disease. Thanks to this projects I could see the development of a clinical study and how is work with human samples, from the collection and labeling, to the necessary treatments for analysis. In the hospital, I had the chance to work with professionals in the field of biomedicine, and see the differences of working in a project within a department, to work in a hospital.\r\n\r\nFor the other hand, in the last year of my bachelor I was doing a collaboration grant in the Institute of Biomedicine (IBIOMED) in Leon. More specifically in the Immunology Department studying DEC-205 receptor modification to induce periphery tolerance in T CD8 cells. In this year I''ve been working primarily with cell cultures, I learned to make genetic constructs based on techniques of molecular biology and genetic engineering, bacterial transformation and cell transfection using different systems.\r\n\r\nIn summary, my research experience has helped me to perform techniques previously only known in theory, has taught me how to plan an experiment and to resolve to any problems that may arise.  Not only a growth in the professional level, but also in personal.\r\n', '2011-05-30 19:17:27'),
(218, 60, 'During my Bachelor Degree I have acquired a good knowledge about structure, function and activity of biomolecules involved in fundamental processes; specifically, I became familiar with molecular techniques aimed to their identification and purification. My training comprised both theoretical lessons and technical applications, including Molecular Biology, Virology, Genetics, Microbiology and Biochemistry. Moreover, I improved my skills on both proteins and nucleic acids software’s and database search tools for sequence/structural analysis and comparisons, such as ClustalW, BLAST, RasMol, DeepView, RCSB Protein DataBank (PDB), NCBI, Swiss Prot.\r\nI have started my research career in March 2007, at the Department of Neuroscience - Institute of Human Physiology, directed by Professor Giacomo Rizzolatti, joining the group coordinated by Professor Roberto Tirindelli. My Bachelor Degree’s project entailed the heterologous expression and purification of two peptides, the C-termini regions of two mouse vomeronasal receptors. These molecules were employed for antibodies production to investigate pheromonal signal transduction in mouse vomeronasal organ (VNO). In this period, I have learned basic molecular techniques, such as gene cloning and transformation in E. coli, DNA gel electrophoresis, mono-dimensional SDS-PAGE, affinity chromatography purification of peptides and solubility tests. Moreover, I have carried out preparation of histological tissues and morphological and functional immuno-histochemistry analysis on mouse VNO tissue sections.\r\nIn March 2010 I have started my MS degree’s experimental project, at the Center for Applied Biomedical Research (CRBA) in Bologna, as a member of the group coordinated by Professor Luigi Bolondi. My research aimed at the characterisation of miRNAs’ aberrant expression in hepatocellular carcinoma (HCC) and their influence on proliferation, differentiation and apoptosis. In particular, DNA methylation profile was analyzed by gene-specific amplification using in vitro transcription coupled to MALDI-TOF (matrix-assisted laser desorption/ionization time-of-flight) mass spectrometry (MassARRAY platform, Sequenom). This approach allows a quantitative determination of CpG doublets methylation levels within a miRNA’s target sequence.\r\nFurthermore, I have employed Chromatin Immuno-Precipitation (ChIP) analysis to assess possible role of p53 in the expression of specific miRNA sequences. In order to characterize the involvement of miRNA in hepatocancirogenesis and to identify their targets, I have carried out miRNA, antago-miRNA and siRNA transfections of HCC cell lines. I have also performed Real Time PCR analysis to monitor miRNA expression in HCC cell lines and human livers tissues (normal, cyrrotic and HCC). Luciferase assays were performed to evaluate the interaction between miRNA and their targets, which control survival, differentiation and apoptosis pathways. In particular, apoptosis markers were evaluated through Western Blot and flow cytofluorimetry experiments, providing information about cell modulation. \r\nAt the moment, I am working at the Department of Neuroscience – in the group coordinated by Professor Roberto Tirindelli. I am taking part in a project focused on the investigation of a new class of chemosensory neurons and vomeronasal receptors in animal models. I am involved in the design of vomeronasal RNA probes for in situ hybridization and immunohistochemistry. \r\n', '2011-06-02 11:32:01'),
(169, 93, 'Profesora de Academia y de clases particulares, en las que ayudo a niños desde Educación Primaria hasta Universidad.', '2011-05-30 22:20:35'),
(171, 101, 'Master Degree Internship at Università degli Studi di Milano. Department of Biology and Genetics for Medical Sciences/Medical Faculty\r\nSupevisors: Prof. Stefano Duga, Dr. Rosanna Asselta\r\nTopic: the double-faced association of PRKCA gene with Multiple Sclerosis (MS) in an Italian cohort of 358 cases and 662 controls. In particular, the aim of the project is to characterize two polymorphic traits in PRKCA gene. The first was a microsatellite mapping in the promoter region showing a protective effect with MS, then a risk haplotype located in the intron 3 of PRKCA: both showed a nominal evidence of association with MS.Interestingly, the risk haplotype includes an exon characterizing an alternative PRKCA transcript, further object of the study.\r\n\r\nBachelor Degree Internship at Università degli Studi di Milano/ Department of Occupational and Environmental Health\r\nSupevisors: Prof. P.Alberto Bertazzi, Dr. Letizia Tarantini\r\nTopic: I took part in a research project on the short and long term effects of PM [Pm10] exposure on DNA methylation in workers of an electric furnace steel plant. Study on the epigenetic alteration in global (Alu and LINE-1 sequences) and gene specific methylation (gene iNOS) and their hypothetical effects in cardiovascular associated diseases.', '2011-05-31 10:12:32'),
(172, 94, 'Scholar at the Anatomy and Embriology Department at the Veterinary Hospital UCH-CEU (2008-09).\r\nEmployer: José Terrado.\r\nI find important to mention this work because it has been my first job at the university, as I had to organised myself employing part of my study time working, it has bring me the sense of responsibility. My work consisted in bone classification, bone extractions, preparing and managing the laboratory and help students in their reviews. This work was already important because it helped me to pay my fees, in my opinion this work has built me up in my professional experience.', '2011-05-31 13:04:59'),
(173, 94, 'Professional training in the Public Health Center (2010).\r\nEmployer: Ángel García.\r\nDuring my career I had never wanted to focuse myself in just one field, but to try the most fields as possible to make the good choice after my degree obtention. By the way, I try to work in the branch of food security. My work experience was fantastic as I learnt a lot of lab techniques, inspections application in slaughterhouse as well as in food industries, and traceability management. This work meant to me that I was able to do this kind of job, our supervisor bring us up in the best way, and at the end of my training I felt that I could do this work by my best. ', '2011-05-31 13:17:26'),
(174, 94, 'Veterinary Hospital Mediterráneo (2010).\r\nEmployer: Alejandro Fort.\r\nThis time I decided to try out with the clinical field. I thing that it was essential to try this branch of the Veterinary Medicine, as the most part of veterinarians work in clinics. In my opinion, I developed quite surgery experience in this work, that I find it is important in some experimental techniques. In the same way, I worked my ability to face medical and toxicology emergencies, that I find essential to be able to make hard decisions quickly, and I think this is an advantage in the experimentation field as I had developed the way to focuse the problem, to find many solutions, and to select one of them to resolve the problem: applicated in the experimentation field, it would let me to have a wide perspective in the project, the aims research, and the ways to reach them.', '2011-05-31 13:30:49'),
(177, 6, 'The first research experience I gained at the University of Manchester. I conducted my own research project in the Cancer Biology lab. My project was to address a specific mechanism of resistance to the chemotherapy agent Temozolomide, caused by MGMT (DNA repair enzyme) in Zebrafish.\r\nDuring these 5 months I acquired a variety of techniques (e.g. RNA extraction, RT PCR, TUNEL protocol, Zebrafish husbandry and drug treatment), which allowed me to detect the MGMT expression in Zebrafish tissues and visualise the level of apoptosis in their embryos, after the combined chemotherapy treatment. The results confirmed the role of MGMT in resistance to the metylating agents and were a promising beginning for the further investigation.', '2011-05-31 15:17:25'),
(178, 6, 'I also participated in the programme “Spend the summer at the Park” organised by the Barcelona Scientific Park in 2009. I spent 2 months in the Neuroscience Technologies S.L.P Company, where I was involved in the studies of neuropathic pain. I performed immunohistochemistry staining of unmyelinated intraepidermal nerve fibers in rat skin biopsies, and as a part of the research group I conducted behavioral tests on rats and learnt the basics of electrophysiological recordings.', '2011-05-31 15:17:44'),
(179, 6, 'The research project for my Master’s degree thesis I carried out in the Department of Cell Biology at the Jagiellonian University. I conducted experiments (proliferation tests, migration analysis, fluorescent staining and cell culture) to establish the effect of                                       1-methylnicotinamide (MNA) on DU-145 (human prostate cancer) cells, treated with cyclophosphamide (CPA). \r\nMNA is a compound of great potency and varied effects, but still the exact mechanism of its action is not fully understood. Previous works suggested the positive influence of MNA on hair cycle in a murine model of chemotherapy induced alopecia. However, it was not clear if the protective MNA effect on hair cycle does not interfere with CPA chemotherapeutic activity. Therefore, due to this contradictory information on the role of MNA in the regulation of cell growth and apoptosis, I verified its influence on cancer cells in the combined treatment with CPA. MNA does not interfere with CPA chemotherapeutic effect on proliferation and migration of DU-145 cells. Used alone it inhibits proliferation (but not due to its cytotoxic effect) and blocks cell migration. I also investigated the MNA potential on human skin fibroblasts and keratinocytes, but it does not show the positive influence on their growth and motility. We suspect that its therapeutic effect on hair cycle is more dependent on the general organism response.', '2011-05-31 15:19:06'),
(180, 6, 'Since July 2010 I have been employed as a biologist in the Division of Cell Biophysics Lab, where I am involved in the project: “Quantitative recording, analysis and interpretation of microscopic biological data”. The main objective is to create a standard calibrator, which enables quantitative measurements of intensity of the fluorescent dyes in biological samples. It gave me the opportunity to learn confocal microscopy imaging techniques and versatile immunofluorescent assays (FLIM, FRAP, Click it DNA and Tyramide Signal Amplification Kits).', '2011-05-31 15:19:52'),
(181, 104, 'I have a degree in Biology since 2008. I worked at genomics unit in BIOCANT (http://www.biocant.pt/Default.aspx), where I acquired molecular and microbiology methods and knowledge. After that I improved my professional competences and I did a master in Forensic Genetics at University of Porto. With my master degree I learnt new molecular and statistical methods. My thesis was about Phenylketonuria. The main goal of my work was the study of genetic diversity associated with the phenylalanine hydroxylase gene (PAH) in normal and phenylketonuria population. I am currently working on Scientific Diffusion Unit of IPATIMUP (http://www.ipatimup.pt/Site/). ', '2011-05-31 15:23:02');
INSERT INTO `jos_phd_work_experiences` (`id`, `applicant_id`, `experience`, `modified`) VALUES
(182, 103, 'From March 2010 to March 2011, I performed a twelve months experimental training in the Laboratory of Molecular Genetics at the University of Rome “Tor Vergata”. My thesis work focused on the link of tyrosine phosphatase SHP-2 (Src Homology 2 domain‐containing Protein tyrosine Phosphatase 2) to the MAP kinases ERK1/2 pathway. I proved that these MAP kinases are positive regulators of SHP-2 tyrosine phosphorylation. In addition, I demonstrated a physical interaction between SHP-2 and ERK1/2 kinases both in vitro and in vivo.', '2011-05-31 15:53:23'),
(183, 106, 'M.Sc. Project (April 2010-11)\r\n\r\nProject Title:\r\nExpression and purification of chimeric Cry IEC and evaluation of its insecticidal property.\r\nSupervisor:\r\nProf. Aparna Dutta Gupta\r\nIntroduction:\r\nThe Bt strains belonging to Bacillus thuringiensis subsp. kurstaki were found to be effective against many Lepidopteran pests like Helicoverpa, Achaea janata, Plutella. However, the toxicity of Bt strains against Spodoptera is very moderate. Spodoptera is a predominant polyphagous pest in Indian subcontinent and crop loss due to Spodoptera infestation is very high. Cry IC has been reported to show significant toxicity to Spodoptera sp. at reasonably low level in larval diet. Cry IE resembles cry IC to an extent of about 70% but does not show any significant toxicity but appears to bind receptors different from cry IC. \r\nSignificance:\r\nChimeric cry IEC was prepared by right combination of effective receptor binding domain (domain II) from cry 1C and toxic domain from cry 1E (domain I and III) for effective control of Spodoptera insects.\r\nObjectives:\r\n•	Modification of restriction sites and cloning of chimeric cry IEC in pTZ.\r\n•	Cloning of chimeric cry IEC in pRSETA and pGEX.\r\n•	Expression and purification of Cry IEC.\r\n•	Evaluation of the insecticidal property of Cry I EC.\r\nImportant results:\r\n•	Chimeric cry IEC was successfully modifies by incorporation of Bam HI restriction enzyme sites on both ends of the gene sequence and cloned in TA vector, ie. pTZ.\r\n•	cry IEC was successfully cloned in pRSET-A and pGEX-4T1 expression vectors.\r\n•	Cry IEC was successfully expressed in E.coli expression hosts, BL-21 and arctic express.\r\n•	Cry IEC was purified using GST-tag affinity chromatography.\r\n•	Optimum toxicity was anticipated from Toxin bioassay performed on Spodoptera litura 2nd instar larvae as they stopped growing compared to control.\r\n\r\n\r\n', '2011-05-31 16:13:06'),
(184, 106, 'B.Sc. Project (May 2008-July 2008)\r\nAll the work was carrie out by me with my the help of my senior.\r\n\r\nProject Title:\r\nCloning of bca gene (Bovine carbonic anhydrase) from bacterial host and expression of Bca.\r\n\r\nSupervisor:\r\nDr. Biswajit Kundu, IIT, Delhi, India\r\n\r\nIntroduction:\r\nCarbonic anhydrase (CA) is a protein found in almost all animals and photosynthesizing organisms. In animals, its major function is to catalyze the reversible conversion of carbon dioxide to carbonic acid in red blood cells where it is found in abundance. CA is important for its extremely high turnover rate. Being a single domain, small, -sheet rich, globular protein, BCA is a preferred enzyme for doing protein folding/unfolding/refolding studies as well as for studying the phenomenon of protein aggregation. Protein unfolding and misfolding cause proteins to aggregate into fibrillar masses, neurodegenerative diseases. \r\n\r\nSignificance:\r\nTo investigate the phenomenon of protein aggregation during refolding, the study of the model protein system, bovine carbonic anhydrase is undertaken since BCA has a well-characterized refolding pathway.\r\n\r\nObejectives:\r\nTo clone bca II gene in E. coli expression system with an ultimate motive of expressing protein in large amount.\r\n\r\nImportant results:\r\n1. Clone of bca was successfully obtained in pET 28 a vector.\r\n2. Expression of Bca was successfully obtained with 1mM IPTG at 37˚C.\r\n', '2011-05-31 16:13:53'),
(185, 109, '• Worked for  6  months on the topic “Isolation and charecterization of Mesenchymal stem cells from Amniotic Memebrane” in MIRM, bangalore.  \r\n• worked for 2 months on the topic “Serial Homogenous passaging of Sarcoma-180 cell line” under Dr. Sujata Law in School of Tropical Medicine, Kolkata   \r\n• Worked on “A comparative study on the effect of pollution on mango plant(Mangifera indica) ” in bachelors as a part of 6th\r\nsemester project \r\n• Submitted a thesis on “genetic diversity of himalyan black bear(Ursus \r\nthibetanus)” as a part of my bachelors degree. \r\n', '2011-05-31 20:54:22'),
(186, 110, 'I have studied Chemistry at Utrecht University and during my Master Program Drug Innovation, I have specialized myself in pharmacochemical research:\r\n\r\nDuring my last research project abroad at the Molecular Institute for Bioscience, Australia, I participated in a drug lead discovery project. I synthesized a toxic peptide by using Fmoc-chemistry on solid phase. This peptide was previously found to lower pain sensitization by acting on a certain class of pain receptors (prokineticins).\r\nAt the same time, I synthesized a fluorescent molecule and characterized it with different NMR techniques (proton, carbon, HSQC, NOESY, gCOSY). Then I ligated this fluorescent compound to my peptide, after using palladium-assisted deprotection methods. I purified the fluorescent product and became accustomed to reverse-phase analytical and (semi-)preparative HPLC columns, and MS apparatuses (ESI-MS and MALDI-ToF). I was glad that my product could be used to perform FRET studies for analgesic drug discovery.\r\n\r\nDuring a bachelor''s research project, I obtained my first project experience with organic chemistry: I made polycationic dendrimers by starting to make a Si-core using radical initiators and an organolithium reagent. Then I attached self-made organohalide wedges to the core by an amine quaternization reaction, which yielded my product.\r\n\r\nDuring my Bachelor Chemistry program I have also learned the basics of cell culture and enzymology: \r\nI learned to over-express a certain protein (GLTP) by culturing E.Coli cells in an incubator. I want to improve these skills and eventually test macromolecules of interest myself.\r\n\r\nAt the moment I am a trainee at a university spin-off company in Groningen, the Netherlands. The company is called Syncom and performs the synthesis and separation enantiomeric drug leads. My task at the moment is operating LC/MS systems to determine the purity of bioactive molecules that have been synthesized. The next month I will also obtain learn working on ToF-MS and chiral HPLC. I am glad with this traineeship because I keep up with my Chemistry skills and I know that I can use these skills in a PhD project.', '2011-05-31 20:54:37'),
(187, 107, 'I was in Dr. Soriano''s lab last summer because I had the "Passa l''estiu al Parc" scholarship. Currently, I hold a "collaboration fellowship" (MEC) in the same lab. ', '2011-05-31 21:00:48'),
(188, 96, 'Clinical Analysis of human body fluids (through microbiological, haematological techniques), Blood group analysis, Compatibility testing, Alloimmunity testing, Work on cancer cell lines/ tissue culture, Western Blot, Flow Cytometry of cells and protein markers, Plasmid construction, Recombinant work with the use of siRNA, preliminary immunohistochemistry, Aminoacids analisys by HPLC using ionic exchange, RT-PCR/ QRT-PCR.', '2011-05-31 21:04:15'),
(194, 31, 'During the Bachelor’s Degree, from April 2007 to September 2007, I worked at the Department of Biochemistry "G.Moruzzi", University of Bologna, in the laboratory of Molecular Biology of Professor G. Capranico, evaluating  the effects of the camptothecin, an antitumoral drug, on DNA-damage checkpoints proteins, being confident with most molecular biology techniques and mammalian cell culture. I studied the cytotoxicity of camptothecin on HCT 116 cell line and the effects of the drug on the phosphorylation state of RNA Polymerase II, histone ɣ-H2AX, kinase CHK2 and p53, in co-treatment experiments with aphidicolin and caffeine.\r\nFor my Master’s Diploma Research I worked for 11 months in the contest of a joint project between the group of Professor G. Capranico, University of Bologna, and the one lead by Professor Olivier Sordet at the Insitute Claudius Regaud of Toulouse, France, from April 2009 to March 2010.  The aim of the project was to define the intracellular localization of sense and antisense HIF-1α gene transcripts in human cancer cells treated with camptothecin and to understand the regulation mechanism of the antisense RNAs on HIF-1α mRNA transcription. During this period I worked with different molecular biology techniques: bacterial culture and transformation, DNA purification, clonation, human cancer cell culture, immunofluorescence. In particular, I improved the RNA-FISH technique (RNA-fluorescence in situ hybridization) to examine gene transcripts of my interest, being confident with the use of fluorescence and confocal microscopy. I found that a novel 5’ long non coding antisense of HIF-1α was localized in the perinuclear region of cells, suggesting a regulation of sense transport to the cytoplasm. \r\nOn April 2010 I got an award funded by AIRC (Associazione Italiana Per la Ricerca sul Cancro), Milan, to the best student with experience in RNA-FISH tecniques at the Department of Biochemistry of the University of Bologna, that gave me the possibility to work in the laboratory of  Professor G. Capranico from April 2010 to July 2010 to complete my master’s work. During this time, I provided further evidences of the perinuclear localization of 5’ long non coding antisense of HIF-1α supported by FISH experiments coupled with immunostaining for Lamin B1 and Nucleoporin 62 that showed a co-localization of the two signals. \r\nOn September 2010, I won a fellowship “Leonardo Da Vinci Programme” from ‘La Sapienza’, University of Rome, Italy, to do a training in the Cell Biology and Stem Cells Unit at the CIC bioGUNE of Bilbao, Spain, from October 2010 to March 2011 in the laboratory of Professor Robert Kypta. The aim of the project was to determine the unique functions of the two isoforms GSK-3β1 and GSK-3β2 in neuronal differentiation by using a GSK-3α/β double-knockout mouse embryonic stem cell line (DKO mES cells). \r\nI studied the effects on Wnt signaling of ectopic expression of GSK-3β1 and GSK-3β2 in DKO mES cells using β-catenin/TCF reporter assays and on the phosphorylation of Tau, a microtubule-associated protein involved in axon growth and regulated by GSK-3, by western blottings. \r\nI further analyzed the role of each isoform of GSK-3 in neuronal differentiation by re-introducing each of them alone in DKO mES cells and inducing the differentiation by treatment with retinoic-acid, being confident with embryonic stem cell culture and detection of early neuronal markers.\r\nMy area of expertise is principally cellular and molecular biology and I was always interested in the study of molecular mechanisms involved in cancer progression. In spite of this I am a very eclectic person, for instance I worked in Bilbao on a topic totally different from my diploma’s work.\r\nThanks to working in different countries such as Italy, Spain, France, I understood that a good researcher must be a dynamic person, because science progression is based also on critical discussions in an international environment.\r\n', '2011-06-01 09:01:03'),
(191, 113, 'My dissertation work focused on the use of various molecular biology techniques. Here isolation of DNA, \r\nperformance of various PCR techniques, agarose gel electrophoresis were performed and learnt. Also efforts were undertaken to perform RAPD and RFLP for some strains of Salmonella in order to know about the differences in the genotype of the various serotypes. The isolation of Salmonella entailed the use of microbiological techniques. I was able to take up most of the microbiological work related to the selective isolation of microorganisms from the samples. The isolation was possible by use of various techniques like differences in sugar fermentation, morphology, use of selective media and serotyping. The above techniques really helped me to have a foundation in the biological sciences.  \r\nSince February 2006 I have been working in the Research arm of the Bio-pharmaceutical company Zydus Cadila. Here my education and internship experience have assisted me in making a contribution to this successful and well regarded research laboratory. I am assigned to the department of biotechnology and my present work involves the conducting of various cell and animal based experiments.The experiments conducted are used to study the efficacy of various pharmaceutical entities. I was successfully able to design and perform various assays to determine cytotoxicity, antiviral effect, accumulation of cAMP in the presence of various ligands. The work done will help in determining the efficacy and the stability of various drug products. In addition, I was also able to perform animal assays using both rat and mice. I have been involved with growing different solid tumor cells for development of cancer models in Nude mice. Apart from the training I have attended various forums regarding use of biohazardous materials, safe use of radioisotopes and the ethical performance of animal experiments. ', '2011-06-01 01:21:38'),
(192, 61, '16 months as student assistant (Hiwi).\r\n\r\nResearch work:\r\nMaster Thesis (March 2011 to September 2011): Generation and characterization of Drosophila models for YARS, GARS and AARS associated Charcot-Marie Tooth disease (CMT).\r\n-Max Planck Institute for Molecular Biomedicine, Münster, Germany.\r\n\r\nObjectives and methodology:\r\n1-	Mutagenesis and cloning of the targeting vectors for Drosophila transgenesis:\r\n    Mutations have been introduced in cDNAs for YARS, GARS and AARS followed with cloning to generate 11 transgenesis constructs (wild type and mutant) followed with embryo injection in UAS lines.\r\n2-	Selection, expansion and balancing of transgenic Drosophila lines:\r\n    Fly genetics approaches are used for single and double copy of transgene to be inserted.\r\n3-	Characterization of transgenic lines:\r\n    Different GAL4 driver lines with weak, strong and selective expression, behavioural assay, immunohistochemistry and microscopic analysis of defects in neuronal morphology will be done.\r\n\r\nHoward lab’s project (October 2010 to February 2011): \r\n\r\nTopic:  Establishment of Gene Bank.\r\n\r\n-Max Planck Institute of Molecular Cell Biology and Genetics (MPI-CBG), Dresden, Germany.\r\n\r\n     The project aimed at creating and updating the database with all the plasmids and vectors used for kinesin-related experiments in the lab. After some final cloning steps, sequencing of plasmid and vector preps were done for analysis of position of tags and point mutations (if present) in the ORF (open reading frame). The project included techniques of bacterial transformation, primer design, sequencing and analysis of retrieved sequences for point mutation.\r\n\r\n*Project was handed with an employment contract of 6 months as a student assistant (Hiwi).\r\n\r\nCRTD Summer project (2010): Cell Culture project on cytokine signaling with IL-2 and IL-4 receptor.\r\n-Center for Regenerative Therapies Dresden (CRTD) - Cluster of Excellence\r\nBiotechnologisches Zentrum, Dresden, Germany.\r\n\r\n    The project was taken with an aim to learn and understand various cloning strategies and techniques used in Genetic Engineering. Cloning of IL-2 receptor gene into E. coli plasmid vector pJet1.2 and IL-4 into pc2 was done using various cloning strategies including fusion PCR and optimization of protocol.\r\n\r\n\r\nTechnical assistance in Gilbert Weidinger’s Lab (November 2009 – August 2010):\r\n\r\n-Biotec, Biotechnologisches Zentrum, Dresden, Germany.\r\n\r\n    The technical work was carried out around the project on conditional gene expression in zebrafish, the spatial and temporal control of which are important in its developmental studies. Technical aspects of the project were covered, basically involving genotyping, DNA preps, immunohistochemistry, embryo harvesting and studying the phenotypes from the crosses.\r\n\r\n*This work was handed over to me with an employment contract of 10 months as a student assistant.\r\n\r\nReference paper to which assistance was contributed:\r\nFranziska Knopf, Kristin Schnabel, Christa Haase, Katja Pfeifer, Konstantinos Anastassiadis  and Gilbert Weidinger (2010). Dual-inducible TetON systems for tissue-specific conditional gene expression in zebrafish. PNAS 107(46), 19933-8.\r\n\r\n\r\nBachelor thesis (December 2008- May 2009): Screening, Production, Optimization and Bioinformatic Analysis of Pigment Producing Actinomycetes from Rice Straw Rich soil. \r\n-VIT University, 632014 Vellore, India.\r\n\r\n    Under this project, for the isolation of the pigment producing Actinomycetes, a protocol was designed for the media composition and its optimization. For screening, MTCC (Microbial type culture collection and Gene Bank, a national facility in India) data were used. For characterization, temperature and pH specific growth optimization of pink and red pigment producing group was performed. Induced mutation was done for the strain improvement. TLC and HPLC purification was used to extract and characterize the protein, followed with Bioinformatic analysis of effect of induced mutation in the strain of interest. ', '2011-06-01 02:45:53'),
(193, 115, 'From 1, December 2009 to 31, March 2010, I was worked as a Research Trainee in X ray Crystallography Laboratory, Department of Biological Sciences, National University of Singapore, Singapore. From 1, August 2010, to 31, January 2011, I was worked as a Short term Visiting researcher in Department for Computational and Structural Biology, MAx F Perutz Laboratories, University of Vienna, Austria The various techniques that I learnt and the projects that I handled during this period allowed me to integrate different scientific problems. This opportunity exposed me to a wider scientific community and I have been able to develop very good project management skills by working in diverse and challenging projects.\r\nAfter completing my Under-graduation in 2006,in Industrial biotechnology at ANNA University,Chennai, India, I worked as a Patent Research Engineer and IP Research executive - Biotechnology in two private concerns. The nature of my job is to read and completely analyzes the given abstracts with the existing patents, publications and other prior arts. There I had ample opportunities to study world class articles (journals) and patents related to Biology. Later, I developed a passion of reading molecular and structural biology related articles.', '2011-06-01 06:40:19'),
(195, 116, '01.01.2010-28.02.2011 Student Assistant in Solimena''s Lab, Molecular Diabetology, TU-Dresden', '2011-06-01 15:07:29'),
(197, 75, 'I joined the laboratory of Dr Rodolfo Marquez (University of Glasgow) as undergraduate student where I carried out a 6 months full-time research project in the field of synthetic organic chemistry. During this period I learnt how to work in an organic synthesis laboratory. I synthesized, purified and characterized a sort of different compounds learning some techniques such as column chromatography and distillation. Most of the experiments required inert conditions and carefully manipulation due to the use of some dangerous compounds, such difficulties I learnt how to deal with.\r\n\r\nI lately collaborated as a graduate student at the laboratory of Dr Antonio Delgado where I performed a research work involved in the Master of Organic Chemistry (UB). My project was full of unexpected results and I had to deeply analyze NMR spectra in order to understand my experiments. I also had to look for some methods that could in principle allowed me to figure out where the problem was. I learnt how to redesign a project when surprising problems come out.\r\n\r\nDuring my projects I have taken part of many group meetings that gave me the opportunity of getting used to present my results and to analyze them carefully.  I had the chance of learning from my colleague’s presentations and results.\r\nI also have attended many conferences in the field of organic and inorganic chemistry. \r\n', '2011-06-01 16:03:04'),
(198, 116, '01.03.2011-31.08.2011 Master''s thesis project, University of Alberta (Canada)', '2011-06-01 16:37:40'),
(199, 119, 'A lo largo de mi formación he aprendido a dominar, tanto de un punto de vista teórico que practico, varias técnicas de biología molecular, bioquímica y biología celular habitualmente utilizadas en laboratorio. Para poder poner ampliar mis conocimientos, tome la iniciativa de hacer varias prácticas profesionales voluntarias en diferentes laboratorios. Es así como me he construido una experiencia profesional, al igual que sólidos conocimientos en este campo de investigación. En un primer tiempo, hice una práctica de dos meses, en el Centre de Biochimie Structurale (CBS) en Montpellier, Francia. Mi misión consistía en purificar el Cauliflower Mosaic Virus (CaMV) para poder afinar las condiciones de cristalización ya obtenidas anteriormente. También tuve que buscar condiciones de cristalización de la proteína P2 la cual es indispensable a la transmisión del CaMV. Para llevar a cabo mi misión tuve que hacer varias pruebas, utilizando la técnica de gota suspendida para el virus y utilizando dos robots de cristalización para la proteína P2. Los resultados obtenidos son muy satisfactorios ya que los cristales de CaMV son más estables que los ya obtenidos. Para P2 los análisis permitieron encontrar indicios que podrían ser temas de futuras investigaciones. En un segundo tiempo, hice una practica profesional de cuatro meses en el Institut de Recherche pour le Développement (IRD) de Montpellier, Francia. Mi misión consistió en estudiar la diversidad de poblaciones de los genes responsables del desarrollo infeccioso del paludismo en el hombre. Para llevar a cabo mi misión tuve que diseñar primers específicos de los tres genes candidatos. Fue gracias a ellos que pude amplificar y secuenciar el ADN de distintas populaciones mundiales. El análisis de las regiones específicas del genoma me permitió establecer una región de polimorfismo de Plasmodium Falciparum. Un artículo con mis resultados va a ser publicado próximamente. En un tercer tiempo, hice una práctica profesional de cuatro meses en el Intitut National de Recherche Agronomique (INRA) en el cual el tema de investigación fue el estudio de la proteína P3 del CaMV y sus interacciones en el proceso de trasmisión por insecto vector. Durante este tiempo tuve a mi cargo la creación, producción y purificación de proteínas recombinantes, al igual que el análisis de las propiedades biológicas de los diferentes mutantes obtenidos. Los resultados obtenidos concuerdan con la primera hipótesis, pero un gran número de repeticiones de los test son necesarias para asegurarse de que la mutación no será alterada por el virus. Los ensayos siguen en estos momentos. Gracias a los buenos resultados obtenidos en mis prácticas profesionales, particularmente en las clonaciones, me contrataron por dos meses en el mismo laboratorio (INRA). El tema de investigación fue el estudio e identificación de los genes de resistencia del arroz a la pyriculariosis por Magnaporthe Grisae. Durante estos dos meses tuve que analizar los QTLs de resistencia en varias poblaciones, pero también cosechar granos de arroz, y tomar muestras de plantas presentando diferentes síntomas de resistencia. También fui responsable de los cultivos de hongos, y de la clonación de los genes de resistencia por medio del sistema Gateway. Estas experiencias me han permitido de desarrollar cualidades profesionales esenciales hoy en día en el mundo del trabajo. Las cualidades personales que he podido desarrollar como la autonomía, la rápida integración en los diferentes equipos y la reactividad a las diferentes problemáticas, han aumentado mis capacidades relacionales. Al igual, los sólidos conocimientos que he podido adquirir, no han hecho más que aumentar mi pasión por la investigación. Es por eso que hoy he decidido postular en su laboratorio para seguir con mis estudios, aumentar estos conocimientos, y seguir con mi pasión. ', '2011-06-01 21:22:35'),
(201, 117, 'I worked on my Master`s research and thesis in the Laboratory for Molecular Neuropharmacology, Department of Molecular Medicine, Rudjer Boskovic Institute, Zagreb, Croatia, with Silva Katusic Hecimovic, PhD as my mentor for more than a year (14 months). The primary focus of this laboratory is on Alzheimer`s and other neurodegenerative diseases, although they do some molecular diagnostics, too (primarily Friederich ataxia). The purpose of my research was to determine the mechanisms and cellular localization of ƴ-secretase cleavage. Ƴ-secretase is an multienzyme complex that cleaves proteins within their transmembrane domain (TM). The complex of ƴ-secretase consists of proteins such as: Aph1 and Pen2 which act as cofactors, nicastrin (Nct) which binds the substrate and proteins presenilin 1 (PS1) and presenilin 2 (PS2) which represent the catalytic centre of the complex. The role of ƴ-secretse is not yet clear, but it is assumed that it plays a significant role in cell signaling. Ƴ-secretase cleaves proteins in two sites: in the middle of the transmembrane domain (TM) or at a site closer to the C terminus of the TM. Recent studies indicate that this cleavage is dislocated within the cell, that is: the cleavage in the middle of the TM (which generates amyloid β peptides, the key factor in the development of Alzheimer`s disease) seems to occur in endosomes and the cleavage at the site closer to the C terminus of the TM occurs on the cell surface. I was to investigate how the inhibtion of endocytosis in tTA HeLa model cells inducibly expressing a dominant negative form of dynamin 1 (the expression of Dyn1 was regulated by a tetracycline transactivator, a Tet-off system) effects ƴ-secretase cleavage, that is how it effects the generation of  peptides (primarily amyloid ). According to relevant data and studies, the inhibtion of endocytosis was supposed to dramatically reduce the generation of   peptides, since they are a product of ƴ-secretase cleavage  in endosomes. My research involved work with cell cultures (maintaining cell lines, transient transfection, treatment with certain chemicals), work with bacterial cell lines (transformation of competent bacterial cells in order to obtain desired DNA- plasmid), common biochemical (protein) methods (Western blot), immunological methods (ELISA, immunoprecipitation), DNA methods (isolation- mini and maxi prep, isolation from various sources, such as blood and cell suspension; PCR), confocal microscopy etc. My research showed that the inhibtion of endocytosis has no effect on ƴ-secretase cleavage and the generation of  peptides. The results I got comply with recent studies indicating that the dual ƴ-secretase cleavage is not dislocated within the cell, physically apart, but rather temporarily separated and occur in a sequential manner (first at the dite closer to the C-terminus of the TM and then in the middle of the TM of the substrate). I have learned a lot during my work at this laboratory and have been acquainted with many methods of molecular biology. During my work there I have been basically completely independent and have only discussed my results with my mentor and PhD students at the lab (at journal clubs and data clubs). I am currently employed in a pharmaceutical company, as a part-time employee, substituting a Senior Clinical Research Associate on maternity leave. The job includes organization, overseeing, monitoring and conducting clinical trials, mostly those of clinical phase III, in the medical fields of Diabetes and Haemophilia.', '2011-06-01 21:52:16'),
(202, 120, 'My BSc working experience was in peptide synthesis for pharmalogical therapies. My master''s thesis is in Tissue Regeneration research, where I am working with Mesenchymal Stem Cells and biomaterials. This PhD fellowship has many areas of interest, mainly regeneration of the nervous system, which will allow me the opportunity to further improve my experience gained in Biochemistry and Biomedical Engineering. ', '2011-06-01 22:34:28'),
(203, 98, 'Universidad de Carabobo, Facultad de Ciencias y Tecnología, Departamento de Biología.\r\nAsistente de Profesor y entrenador de estudiantes (Desde 21 de Enero de 2004 hasta Diciembre de 2009)\r\nMi trabajo como asistente de profesor fue un trabajo realmente grato en el que adquirí capacidad docente ya que mi tarea principal fue interactuar directamente con los estudiantes en la asignatura biología general tomando en cuenta diversos temas que se encuentran dentro del programa académico de la asignatura. Esta asignatura es dictada por periodos anuales y basa su programa en el aprendizaje de temas relacionados con la biología que serán examinados con mayor profundidad a lo largo de la carrera. Es por ello que se necesita un conocimiento global de la biología para poder asistir a los docentes en la facilitación de las herramientas necesarias para el aprendizaje. Como asistentes de docencia nos correspondía dirigir prácticas de laboratorio que afianzaran las clases teóricas, evaluar el desempeño estudiantil y garantizar el avance progresivo de los mismos al siguiente curso académico de la carrera.\r\nPara poder concursar para el cargo de asistente de docencia se debe poseer un promedio superior a 16 puntos (escala 1-20) o encontrarse entre los mejores estudiantes del Departamento de Biología. Me desempeñe con la labor básica de un profesor siendo aun un estudiante, lo que me permitió combinar los mejores aspectos de cada uno para llegar de forma más directa a los estudiantes a mi cargo y mejorar su desempeño dentro del Departamento de Biología de la Facultad de Ciencias y Tecnología. En la actualidad la capacidad docente (transmitir conocimientos con facilidad) es una cualidad sumamente necesaria y que debe cultivarse ya que no solo basta con generar conocimiento si no se sabe transmitir de manera practica y sencilla que permita su comprensión. En este puesto de trabajo crecí como docente aprovechando tanto la formación de mis profesores como mi habilidad de transmitir lo aprendido a mis estudiantes.\r\n', '2011-06-02 02:09:22'),
(204, 98, 'Instituto de Investigaciones Biomédicas de la Universidad de Carabobo. Laboratorio #4 Vigilancia Epidemiológica de Arbovirus, Sección de Biología Molecular.\r\nAsistente de Investigación. (Desde septiembre de 2007 hasta agosto de 2009)\r\n\r\nComo asistente de investigación en el Instituto de Investigaciones Biomédicas de la Universidad de Carabobo realice diversas tareas. En primer lugar se acondiciono el insectario del instituto para la realización de infecciones artificiales en vectores como el Aedes aegypti. Además, se llevo a cabo el equipamiento y la estandarización del protocolo de infección para el virus dengue dicho espacio. A su vez, desempeñe labores técnicas dentro del laboratorio de vigilancia epidemiológica, utilizando metodologías como extracción de ADN y ARN, purificación de ácidos nucleicos, SSCP, procesos de PCR convencional, PCR anidada, RT-PCR, PCR en tiempo real, enzimas de restricción y cultivos celulares y virales ya que estas son tareas de rutina dentro del laboratorio de vigilancia epidemiológica. \r\nDentro de este trabajo aprendí el manejo de técnicas complejas de biología molecular así como el manejo de cepas virales, control de calidad, y la importancia de la vigilancia de enfermedades infecciosas como el Dengue en países tropicales como Venezuela. Este entrenamiento y desempeño en el área de Biología Molecular me permitió ampliar mis conocimientos de técnicas que podrían ser aplicadas en distintos aspectos, como por ejemplo, monitoreo de expresión genética mediante PCR convencional y tiempo real, cuantificación de partículas virales en pacientes infectados, determinación de tiempos de infección y ciclo replicativo viral, entre otros que facilitan el trabajo de vigilancia tanto de la casuística como del proceso de infección tanto dentro de un vector como de un paciente.\r\nAl avanzar en el entrenamiento y en el desempeño laboral se me permitió también asesorar trabajos de tesis que se estaban llevando a cabo dentro del laboratorio, realizando sugerencias sobre técnicas a utilizar, entrenando personal nuevo en la rutina del laboratorio, integrando conocimientos para solucionar inconvenientes y plantear soluciones estratégicas y nuevos proyectos para mantener la línea de investigación abierta y en la vanguardia. \r\n', '2011-06-02 02:09:49'),
(205, 98, 'Genética Galeno C.A. y Laboratorio Clínico Galeno C.A.\r\nBiólogo Molecular y Asesor metodológico (Desde 06 de agosto de 2009 hasta la fecha).\r\nGenética Galeno es un laboratorio privado de Diagnostico de enfermedades infecciosas utilizando técnicas de Biología Molecular como PCR, PCR en tiempo Real y Enzimas de restricción. En esta institución mi labor es la de Biólogo Molecular, centrando mi trabajo en el procesamiento de muestras provenientes de Clínicas, Hospitales, Laboratorios externos, entre otros y en la estandarización de nuevos métodos de diagnostico para enfermedades infecciosas presentes y emergentes. Aquí realizo a diario extracción de DNA y RNA mediante tecnología de silica paramagnética y las pruebas están repartidas en dos tecnologías (tanto PCR como PCR tiempo real – Tecnología NASBA).  \r\nEste trabajo a diario con clínicas y hospitales permite una comunicación directa entre los médicos tratantes de pacientes con enfermedades infecciosas de distintos tipos y nuestra figura como laboratorio de referencia en el diagnostico precoz. Es por ello que no solo he podido poner en practica lo aprendido sobre biología molecular y diagnostico de enfermedades, sino que también he podido relacionar los hallazgos de laboratorio con la clínica del paciente, entrando un poco mas profundo en el campo de la Biomedicina, permitiendo un enfoque global a la hora de sugerir al medico un siguiente paso en el diagnostico. El trabajo en Genética Galeno ha ido complementando mi formación profesional tanto en las técnicas de biología molecular aprendidas como en el diagnostico y clínica de las enfermedades infecciosas tropicales.\r\n', '2011-06-02 02:10:08'),
(206, 65, 'I have worked as a Teaching Assistant and as a Professor at the Central University of Venezuela. Both positions have contributed to improve my theoretical knowledge, research abilities and technical skills. These positions have also contributed to improve my social communication skills since they involve a lot of interactions with students and colleagues. ', '2011-06-02 03:24:08'),
(208, 105, 'Universidad Centroccidental Lisandro Alvarado: teacher instructor in Anatomy: During five years I had the opportunity of teach anatomy to medical student, this job showed me the importance of a good education and preparation in the formation of people in medical science. It also gave me the opportunity of working with several people with different character and to learn about people that surround you in the work area.', '2011-06-02 04:29:08'),
(209, 105, ' Rafael Rangel Hospital: Intern Doctor: I work at the adults and pediatric emergency in day and night shifts every six days, at the same time, during the other mornings I have rotations at gynecology, surgery, internal medicine and pediatric services. This job gives me the opportunity of make clinical diagnosis, treat patients and specially to learn about diseases, complications and prevention.', '2011-06-02 04:29:36'),
(210, 105, 'Acosta Ortiz Clinic: Intermediate Care Unit Resident: in this job I treat patients with acute and severe diseases with technology and modern treatments, I am trained by the best specialists of the city. I have been increasing my knowledge in modern treatments in patients that require special attention and evaluation. ', '2011-06-02 04:30:04'),
(222, 60, 'Abstract MS degree project: My MS degree project aimed to elucidate the contribution of miR-519d to hepatocarcinogenesis; miR-519d belongs to the chromosome 19 miRNA cluster (C19MC). We identified the overexpression of miR-519d in hepatocellular carcinoma (HCC). Aiming to investigate the molecular mechanisms involved in miR-519d aberrant regulation, we discovered a hypomethylation profile of several CpG islands interspersed in the C19MC, including those close to miR-519d region, that correlates with miR-519d increased expression in HCC tissues and in HCC-derived cells. Conversely, normal liver and cirrhotic tissues which homogeneously display low miR-519d levels, are hypermethylated at the C19MC region. Furthermore, a p53-binding site was identified upstream to miR-519d coding region and p53 was assessed as a regulator of miR-519d expression. Both indirect (Luciferasy assay) and direct (ChIP) evidences support the role of p53 in the regulation of miR-519d. An increase of miR-519d expression occurs following p53 upregulation while a decrease of its expression follows p53 inhibition. Remarkably, the ChIP assay proved direct binding of p53 to its hypothetical consensus sequence, suggesting the direct involvement of p53 in the regulation of miR-519d. In this study, we proposed the existence of an epigenetic mechanism that acts synergistically with the transcription factor p53 to regulate the expression of miR-519d.\r\n\r\n\r\n', '2011-06-02 11:36:12'),
(221, 60, 'Abstract Bachelor project: \r\nMy Bachelor Degree project was designed to carry out the heterologous expression and purification of two peptides, the C-termini regions of two mouse vomeronasal receptors. Mouse vomeronasal organ (VNO) is a chemosensory structure involved in the detection of pheromones and it is conserved in most mammals. VNO’s receptors, located in the apical and in the basal regions, are classified in four Families: A, B, C and D. In this study, two peptides, Vmn2r4 and Vmn2r3, which belongs to the C Family, were employed in antibodies production aiming at the investigation of pheromonal signal transduction in mouse. Briefly, the coding sequences of these peptides were cloned into a GST-Tag expression vector and then trasfected in E.coli. We used two different techniques for peptides purification: Vmn2r4 was purified with affinity chromatography while Vmn2r3 was eluted by electrophoresis from polyacrylamide gel slices. After the purification Vmn2r4 and Vmn2r3 were employed in immunization experiments in order to produce rabbit antibodies against C-termini VNO receptors. Afterward, rabbit serum was used in immuno-histochemistry experiments on mouse VNO tissue sections. As a result, we were able to identify the presence of these antibodies bound to the VNO receptors, which allowed us to investigate the pheromonal signal transduction in VNO.\r\n\r\n\r\n', '2011-06-02 11:35:24'),
(214, 122, 'JULY–AUGUST 2009. EVOLUTIONARY POPULATION GENETICS LABORATORY (EVOLUTIONARY BIOLOGY UNIT, UNIVERSITAT POMPEU FABRA DE BARCELONA)\r\n\r\nThe project I worked in during the short stay in Elena Bosch’s lab focused on determining whether a specific candidate region of the gene FOXI1 had been under human-specific selection, i.e. had evolved differently among three different human populations. My job implied cloning a number of 2kb amplicons along this candidate region in sixty individuals from the three human populations mentioned. \r\n', '2011-06-02 10:12:10'),
(215, 122, 'JANUARY–JUNE 2011. LABORATORY OF MOLECULAR BIOPHYSICS (INSTITUT DE RECERCA BIOMÈDICA, PARC CIENTÍFIC DE BARCELONA)\r\n\r\nThe title of my degree research project is “Characterization of the structure and dynamics of the hinge region (HR) of the androgen receptor (AR)”. The androgen receptor is a transcription factor of 919 aminoacids and its superactivation is related to the development of prostate cancer. Although there are already drugs for inhibiting the transactivation of the AR, thus for preventing the spread of the tumour, all patients relapse after five years of treatment due to an apparent insensibilization of the androgen receptor towards the drug. \r\nThe hinge region is a non-conserved disordered region of about 60 aminoacids that links the DNA-binding domain (DBD) and the ligand-binding domain (LBD) in the AR. Because of this apparent lack of secondary structure and function, little attention has been given to it and research on drug design has mainly focused on the DBD and the LBD. However, recently, this region has been discovered to be a multifunctional domain being responsible for the translocation of the androgen receptor to the nucleus and playing an inhibitory role on its transactivation. \r\nTo fully comprehend the mechanism by which the HR is able to perform the mentioned functions, functional studies must be complemented with structural studies, which might enable, in the future, designing more specific drugs for treating prostate cancer. For this reason, the aim of my project was to characterise this region from a strictly structural point of view using NMR. Before the structural characterization by NMR, I designed and performed specific protocols for cloning (Gateway System), expression and purification of the hinge region. That means I performed PCRs, agarose and acrylamide gels, transformation and culture of E.coli cells, and ion exchange and size-exclusion chromatography. The structural characterization allowed me to build a model of the DBD, the HR and the LBD to study the correlation between the movement of the DBD and the LBD in order to highlight possible inter and intra-domain interactions.\r\nFor this research I spent 6 months (full time, January – June 2011) at the Laboratory of Molecular Biophysics of Xavier Salvatella (Chemistry and Molecular Pharmacology Programme), located in the IRB (Institut de Recerca Biomèdica).\r\n\r\n', '2011-06-02 10:12:42'),
(224, 91, 'Work: bachelor thesis; Employer: Prof. Yves Muller, head of the division of biotechnology, university Erlangen-Nürnberg; The goal of my project during my bachelor thesis was the crystallization and structure solution of the bacterial transcriptional repressor protein TetR in complex with newly found inducing peptides. These peptides trigger an allosteric conformational switch of TetR upon binding, just like the natural inducer tetracycline. Even though the project went very well, I got to know some of the difficulties one is confronted with in X-ray crystallography, as for instance obtaining well diffracting crystals. Besides the techniques and methods applied in the process, I learned that structural biology is a challenging field that interests me a lot. This affected my choice of modules in the M.Sc. course cellular and molecular biology. ', '2011-06-02 16:10:18'),
(225, 91, 'Work: master thesis; Employer: Prof. Yves Muller, head of the division of biotechnology, university Erlangen-Nürnberg; The project of my master thesis is related to the one of my bachelor thesis. It is about crystallization and structure solution of AmtR, a member of the TetR-family of bacterial transcriptional repressors, in its induced state. AmtR plays an important role in the nitrogen control of Corynebacterium glutamicum and its regulation is much more complex than the one of TetR. Unlike other TetR-type transcriptional repressors, AmtR is not induced by a low molecular weight compound, but by another protein, namely GlnK, which has to be adenylylated at a special tyrosine residue. This modification of GlnK is conducted by GlnD, an ATase, upon nitrogen starvation. The first attempt to get the induced structure of AmtR was to co-crystallize it with synthesized adenylylated GlnK-peptides. Even though several crystals were obtained and several structures could be solved, none of them showed electron density for a bound peptide or an alternated conformation of AmtR. Consequently, I tried to over-express adenylylated GlnK in C. glutamicum. Obtaining a high yield of modified GlnK and its purification turned out to be very difficult and a protocol could not yet been established. With this difficult project I improved my skills of X-ray crystallography techniques and several molecular biology methods. Additionally, I learned to cope with difficult projects that do not rapidly lead to ultimate results but can be promoted step by step by experience and new ideas.', '2011-06-02 16:11:15'),
(238, 91, 'Work: programming as a working student for Siemens; Employer: Siemens AG, Healthcare sector, Oncology Care Systems; Besides the work I have done in the university, I experienced working for a big company in a division of moderate size for about 2 years. The task of the division I worked for was to test the linear accelerators used to treat tumors in clinical radiation therapy. My project was to create and maintain a tool that gathers information on the tests, which is stored in a database, and writes it into special official documents. Therefore, my work was an important part of the process and I was part of a team that interacted with other teams, trying to implement the requests of different people and to contribute with own ideas. The work was both challenging and very interesting. It certainly improved my team working skills, my Visual Basic programming skills and my communication in English, since the division contained international experts.', '2011-06-02 16:48:48'),
(240, 111, 'As a student who has just graduated, my work experience is directly related to the academic world and more specifically to my traineeship experience. During my academic career, I have had the opportunity to participate in two internships through which I learned many of the methodologies required to undertake a research project in the fields of molecular biology, cell biology and microbiology. I took part in my first internship during my Bsc thesis, at the University of Sassari, beside the laboratory of molecular Biology, under the supervision of Prof.ssa Claudia Crosio and Dr. Ciro Iaccarino. The aim of the project was to construct an eukaryotic expression vector for the human parkin cDNA, useful to study the protein and its interaction partners. As a result of working on this project I learned both the basic methods used to work with and manipulate the DNA and the basic methods of protein analysis. I partecipated in my second internship during my Msc thesis, at the University of Siena, beside the laboratory of Microorganism’s Physiology and Biotechnology, under the supervision of Prof. Gian Maria Rossolini and Dr. Marco Maria D’Andrea . The rationale of the research was to develop a high-throughput screening system that in an one-time experiment gives the possibility to screen the presence of the most known resistance genes in the genome of specific bacterial strains. For that reason I focused in the development and optimization of a microarray platform for the genotypization of resistance genes in Gram-negative clinical isolates. As a result of working on this project I learned some advanced molecular biology techniques and the basic bioinformatic procedures for microarray processing and data interpretation. However, from these work experiences I have learned not only the methodologies needed to carry out a research, but they have also contributed to my personal and professional development. I learned how to work in a research team and how to stay in a laboratory, and particularly I learned to organize my work habits and time management even in relation to the needs of the people working with me in the same laboratory. Moreover after these work experiences I feel much more confident in working independently and in managing a research project without the need of direct supervision.', '2011-06-02 17:59:43'),
(241, 112, 'Since May 2010 until March 2011 I worked as quality control in a food industry. Here, in two months, thanks to my knowledge, to the ability to manage group and to solve practical problems  I was able to get the head of the office in two months. This period was very important for me because I improve my capacity to coordinate people, to write projects by myself and most of all to take important decisions quickly. ', '2011-06-02 18:02:20'),
(242, 69, 'I completed a vocational practice of 4 weeks in Diagnostic Lab MSWiA Hospital with Oncological Centre in Olsztyn. This practice let me extend my knowledge of basic techniques used in analytical medicine and hospital procedures. Additional, during my study I took a part in several projects under supervision of  professor Bozena Szafranska and dr Grzegorz Pansiewicz which was focusing on PAG (Pregnancy associated glycoprotein) gene family and so far I am a co-author of one publication and 3 abstract which I mentioned in my CV. Also writing my bachelor’s and master’s thesis gives me an opportunity to took almost three year practice in molecular laboratory at Animal Physiology Department of Warmia and Mazury University also under supervision of professor Bozena Szafranska and dr Grzegorz Panasiewicz. During this time I achieved a high level of skills in basic molecular biology techniques, including gene and protein isolation and characterization. I also learned how to work in research team.     ', '2011-06-02 20:04:54');
INSERT INTO `jos_phd_work_experiences` (`id`, `applicant_id`, `experience`, `modified`) VALUES
(243, 92, 'Basically my work experience concerns only the periods I spent in a laboratory for the preparation of the final thesis to obtain Bachelor and Master degrees, plus a short internship as a graduate student. In 2007 I worked in Alessandro Ripalti’s lab at S.Orsola-Malpighi General Hospital of Bologna. It was my first lab experience and it gave me a general idea of what biology research means, and stimulated my attitude to address issues and questions of biomedical relevance.\r\nIn 2009, I prepared my MS thesis at the CRG of Barcelona under the supervision of the professor Juan Valcárcel. The project I carried out was mainly focused on the splicing regulation by a specific protein: was a great opportunity to learn really how to work with RNA and to use the fundamental techniques required in the molecular biology field. I''ve worked in a culturally and scientifically stimulating environment, which enriched my knowledge and taught me techniques and methods of primal importance for a biomedical researcher.\r\nFrom March 2011 I am working in Francisco Tejedor’s lab in the Istituto de Neurociencias of Alicante. As the aim of the Institute the project I am working on is focused on Neuroscience, and in particular I had the opportunity to learn so much about confocal microscope analysis and time lapse studies. Furthermore I had to face myself with working with animals and hippocampal dissection from mouse brains.', '2011-06-02 20:48:17'),
(246, 52, 'Finalizando la carrera de biología, me integre al Instituto de Errores Innatos del Metabolismo (IEIM), inicialmente ocupe la posición de practicante, en donde aborde conocimientos teóricos y prácticos de procesos biotecnológicos que allí se llevan acabo, trabaje  prestando asistencia técnica a diferentes investigadores quienes realizan investigación en proyectos encaminados a la  elaboración de anticuerpos, producción y purificación de proteínas recombinantes, terapia génica, terapia celular, terapia de reemplazo enzimático, diagnostico de enfermedades metabólicas y desarrollo de técnicas ELISA.\r\n\r\n\r\nPosteriormente fui admitido como Tesista en el IEIM, donde gestioné un trabajo de investigación en el área de Biotecnología. En este trabajo realicé la clonación y caracterización de un gen que codifica para una enzima involucrada en la síntesis de compuestos prebióticos, en adición, realicé la caracterización molecular de la enzima codificada por dicho gen, propuse su estructura terciaria y el modelo general de su actividad catalítica. En el desarrollo de este proyecto adquirí habilidades e implementando técnicas y métodos de laboratorio como: Reacciones PCRs, y RT-PCRs técnicas para el análisis de ácidos nucleídos y proteínas, técnicas estériles para la manipulación de cultivos celulares eucariotas y procariotas, métodos para la  extracción de ARN y ADN, transformación de células competentes y clonación de genes mediante la construcción de librerías de cDNA y genómicas. Adicionalmente aprendí a reconocer y a utilizar distintas herramientas y software de bioinformatica, fortalecí y desarrolle habilidades en el análisis de datos e interpretación de resultados. Adquirí autonomía y suficiencia para elaborar y diseñar experimentos relacionados con los objetivos planteados, fortalecí conocimientos asociados  con las disciplinas implicadas en el desarrollo del proyecto.\r\n\r\n\r\nAl ingresar al Máster en Biotecnología Molecular de la Universidad de Barcelona, me integre al Departamento de Ingeniería Textil y Papelera como estudiante en prácticas. Allí, estoy participando en un proyecto de trabajo con intereses biotecnológicos en la industria textil y papelera, donde me encuentro caracterizando la reacción catalítica de una enzima lacasa en presencia de diferentes moléculas mediadoras de la reacción, con el fin de optimizar el proceso de blanqueo a través de la oxidación de lignina. Durante esta experiencia he adquirido habilidades en el monitoreo y análisis de reacciones de oxidorreducción y técnicas espectrofotométricas.\r\n\r\n\r\nEl paso por los diferentes grupos de trabajo en los que he participado, me ha permitido enriquecer mi vida profesional, ya que he abordado el desarrollo de la Biotecnología desde diferentes punto de su aplicabilidad, esto me ha permitido comprender el potencial uso que esta tiene en el desarrollo de nuevas tecnologías y en el consecuente fortalecimiento del sector industrial y productivo. Por otro lado la continua relación con grupos multidisciplinarios me ha permitido en lo personal, diversificar y enriquecer mis conocimientos académicos, identificar las diferentes formas de abordar los problemas, establecer buenas relaciones de trabajo partiendo del la tolerancia y el respeto por las diferencias de pensamiento, solucionar discrepancias siempre con el objetivo de encontrar un camino para la satisfacción de ambas partes, y valorar la opinión que se ofrece por cualquier miembro del grupo de trabajo. \r\n', '2011-06-02 20:57:29'),
(249, 79, 'Description of Conducted Research Projects \r\n\r\nInfluence of the Ubiquitin-Specific E3-Ligase TRIM11 on the Turnover of p62/SQSTM1(University of Konstanz, Germany)\r\nIn this project I investigated the post-translational regulation of the autophagosomal marker p62 by the E3-ligase TRIM11. By protein overexpression and siRNA-mediated knock-down I showed a negative regulation of p62 by the ligase in HEK293 cells. Furthermore, I investigated the potential interaction between the proteins and the ubiquitinylation of p62 by immunoprecipitations.\r\n\r\n\r\nThe Role of SUMOylation of Nucleophosmin in Aspirin Mediated Apoptosis of Colorectal Cancer Cells (University of Edinburgh, United Kingdom)\r\nRegular intake of aspirin reduces the risk of developing colorectal cancer. The host lab is investigating the pathway mediating this process. I studied the induction of SUMOylation of the protein nucleophosmin, its resulting cellular localization and its interaction with other proteins within the pathway after aspirin treatment. Techniques included protein overexpression/knock-down/immunoprecipition, immunocytochemistry and live cell imaging.\r\n\r\n\r\nDesign and Synthesis of Novel Biotinidase Resistant MRI Contrast Agents (University of Edinburgh, United Kingdom)\r\nMany common biotinylated MRI contrast agents are found to be instable in human blood due to degradation by the enzyme biotinidase. I synthesized novel biotinylating agents by standard organic synthesis which enabled me to synthesize three novel biotinidase resistant contrast agents by “click” chemistry.\r\n\r\n\r\nBiotinidase: Development of Enzyme-Resistant Contrast Agents and Active Site Probes (University of Edinburgh, United Kingdom)\r\nCurrently I am conducting biological testing of the contrast agents synthesized in my previous project (evaluation of binding kinetics to avidin/streptavidin and serum stability). Furthermore, I will purify biotinidase from human blood and conduct a screening with synthesized substrate analogues to investigate the active site of the protein. Techniques include organic synthesis, protein purification by different chromatographic techniques, assay development/optimisation and interpretation of kinetic measurements.\r\n\r\n\r\n', '2011-06-02 21:55:48'),
(253, 128, '•	(August/2011-present) The Nile University. Job responsibility include, conducting background study, designing tools and scripts that introduced new functionality or integrate several tools in an automated workflow using programming languages, testing and evaluating various tools, Data analysis using Advanced Excel skills and various datamining/artificial intelligence tools, writing reports, publication and conferences presentation and work closely with various people', '2011-09-27 08:27:58'),
(254, 128, '•	(Oct/2010-July/2011) National Research Center (NRC) as a full time assistant researcher in Drug Design project and as a part time in Hepatitis C virus. In addition, teaching bioinformatics courses to others. ', '2011-09-27 08:28:24'),
(255, 128, '•	(June/2011-Present) Co-Editor in the book titled "Recurrent Neural Network", ISBN 979-953-307-546-3, published by InTech.\r\n', '2011-09-27 08:28:44'),
(256, 138, 'senior executive - Dr.Reddy''s Labs , Hyderabad, India', '2011-11-01 12:20:50'),
(258, 141, '1. Work experience Clinical Biochemist Government Medical College, Aurangabad, India May 2007 – June 2010  Working in central clinical laboratory of the hospital and do all the routine, emergency and special investigations  Giving lectures and conducting practical for undergraduate students, assisting in on-going lab (research) work and giving demonstrations and seminars  8 weeks intense training in pathology, microbiology and medicine department each  Working with GLPs (Good Laboratory Practices) and follow SOPs (Standard Operating Procedures)\r\n2. Internship: BYL Nair Medical College, Mumbai, India Jan 2005 – April 2006  One year rotatory medical internship in departments of Medicine, Surgery, Gynecology, Pediatrics, Skin VD, Radiology, Psychiatry, Ophthalmology and ENT and 3 months of peripheral posting in rural areas  Conducting health camps, blood donation camps, awareness camps, education and counseling of masses, assisting in conducting seminars and presentations  Presentation of cases, their reporting and documentation  Working with GCPs (Good Clinical Practice)\r\n Skills:  Analyze and interpret investigative data  Skills of solving scientific and clinical problems and decision making  Competence in basic concept of research methodology and be able to critically analyze relevant published research literature ', '2011-11-03 19:22:54'),
(262, 145, 'Research Fellow : Indian Institute of Science (IISc)\r\nI have been working as a part of Prof Saumitra Das group on the translation regulation of p53 gene. The group has earlier shown that the expression of p53 is regulated by an alternate translation mechanism (IRES) .Two IRESs were identified in P53 namely the Full length (1-251) and the p53 (1-134).My work essentially is identification of  new ITAFs (Transacting factor like PTB) which bind specifically to the Full length IRES and to elucidate the effect of their interaction on the translational mechanism and its effect on the p53 protein production . The aim of study is to explore novel pathways for p53-dependent drug development. I am also studying the effect of newly identified ITAF, AnnexinA2 on the FL p53 IRES. For this study I employ techniques like RNA affinity purification, Mass spectrometry/ MALDI,UV cross linking, Preparation of translation grade cytoplasmic extracts, Silver Staining, Tissue culturing and the basic Molecular techniques.\r\nWorking at IISc has brought me a step closer to scientist in me.I have got a lot of technical experience, Trouble Shooting ,and experience on proteomics such as MALDI.I have also been sucessful in both the projects that i am handling.Personally i have got a lot of work satisfaction and professionally i have attended a couple of conferences and also met many eminent researchers and got to learn a lot from them.I have recently met India` s previous President Dr A.P,J Abdul Kalam who himself is from IISc.My Work here has made me competant to take up PhD.I have also sharpened my leadership skills as i have taken up of some responsibilities.', '2011-11-11 10:08:35'),
(261, 145, 'Research Student: University of Dundee\r\nAs a part of Dr J C Bourdon`s Group in Sir David Lane`s Laboratory I have worked on an Isoform of p53 (ﻻ p53) and studied its behavioural pattern. My work comprised of extensive molecular biology techniques such as cell culturing ( U2Os ,H1299 & Bcl2), immuno precipitation, cloning, growing of stable cell lines, Dual luciferase reporter assay, cloning, western blotting, apoptosis assay, protein separation, Polyclonal antibody production, Western blotting ,siRNA silencing,DNA isolation, drugging cells, preparing cell lystates , Confocal and Fluorescent microscopy,Uv rosslinking, filter binding RNA affinity, Transfection, PCR, SDS PAGE. The experiments were carried out in excellent GLP environment.\r\nSince my aim & goal is to contribute towards finding a cure for cancer i took up this project. I totally enjoyed my work and stayed on even after my masters project.This experience has not only made me independent in my work but has even honed my skills as a researcher.With the help of this experience i could find a place as Research Fellow at the prestigious Indian Institute of Sciences.', '2011-11-11 09:59:24'),
(263, 151, 'I always thought that going to the university not only involves hard study to pass the exams. So I have done everything I could to see how research work is.\r\nAbout practices held at my university (University of Navarra) I cannot complain. We have done many hours of practice with an excellent material to work where we can put into practice everything learned in the theoretical hours.\r\nMy university offers the possibility to access a university department as a helper student. There they teach us the actions of the desired department. In my case, when I was in third and fourth career year I were in the department of pharmaceuticals and organic chemistry. They taught us the daily management of the laboratory. I have learned how organic syntheses do. During this period I was assigned to a girl that was doing her PhD, I helped her doing her experiments, and she taught me everything I she was doing.\r\nI have also done internships. During the month of July in 2009 and the months of June and July in 2010 (full-time) in L''Urederra technology center at Los Arcos (Navarra). It is a center that has its own line of research works and it tries to solve problems that may companies have and help them in their I+D development. I worked in environment department. I have collaborated with several projects being carried at that time. I have worked on the purification of highly polluted water, in another project trying to get biogas from organic waste collected from recycling plants and farm’s wastes from the region. I also worked in various projects involving private companies. It is true that this area of biology is not what interests me most, but I did not hesitate when I decided to repeat the practice in this company as they give you the opportunity to see how the work as a biologist is, and you can learn many things and implement things learned at university.\r\nRight now I am doing a Master  degree in biochemistry, molecular biology and biomedicine in the Complutense University of Madrid. I am doing my project at the veterinary school of the same university, there I am studying the acquired immunity in blood malaria in animal model (mouse). Here I am learning to work with laboratory animals, because my  experiments are performed in vivo. During this period I am putting into practice the techniques learned at university abourt the study of proteins (western blot, ELISA), since our goal is to isolate and characterize Plasmodium antigens and the immunized animal immunoglobulins. Also, thanks to the same department there are different experiments  performed on the same line of study of malaria, I''m having the opportunity to see various things like the study of cerebral malaria.\r\n', '2011-12-11 21:17:45'),
(264, 156, 'I have been working on the projects with regard to cancer biology utilizing in vitro and in vivo models. This studies include apoptosis and autophagy as cellular death mechanisms and related laboratory techniques, including cell culture, western blotting annexin V/PI, acridin orange staining, cell cycle analysis, RT-PCR fluorescent microscopy, and flow cytometry applications. Complete list of the techniques; \r\n\r\n\r\nCancer biology\r\n\r\nIn vitro \r\n\r\n•	2-D cell culture\r\n•	Cell proliferation and death assays (MTT, MTS, Trypan blue exclusion assay), clonogenic assay\r\n•	RNA interference applications (siRNA, shRNA)\r\n•	Bacterial transformation, plasmid isolation and transfection\r\n•	SiRNA Liposome preparation\r\n•	FACS applications\r\no	Apoptosis detection (Annexin V staining)\r\no	Autophagy detection (Acridine Orange staining)\r\no	Cell cycle analysis (PI staining)\r\n•	Western blotting \r\n•	Invasion assay\r\n\r\nIn Vivo\r\n•	Orthothopic breast and ovarian cancer models with nude mice\r\n•	Subqutaneous tumor models (ovarian, breast and prostate models)\r\n•	Mouse handling, IV and IP injections.\r\n\r\n•	Laboratory safety rules\r\n•	Reagent and buffer preparations\r\n\r\n•	Volume, weight, pH measuring\r\n•	Spectroscopy\r\n•	Electrophoresis\r\n•	Cell Culture Techniques\r\nAseptic Techniques, Culturing Bacteria, Preparation of Competent Cells\r\n•	Sample preparation\r\n•	Polymerase Chain Reaction\r\nRegular and Real-Time PCR\r\n•	Microscopy\r\nLight, Immune Florescence, Scanning Electron, Transmission Electron', '2011-12-15 02:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'host=irbsvr4.irb.pcb.ub.es\nport=389\nuse_ldapV3=1\nnegotiate_tls=0\nno_referrals=0\nauth_method=search\nbase_dn=o=irbbarcelona\nsearch_string=uid=[search]\nusers_dn=\nusername=cn=admin,o=irbbarcelona\npassword=this_is_the_password\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=extended\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=0\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=0\ncontextmenu=1\ninlinepopups=1\nsafari=0\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 14, 'Community Sites', 2),
(2, 14, 'Public Brand Sites', 3),
(3, 14, 'eCommerce', 1),
(4, 14, 'Blogs', 0),
(5, 14, 'Intranets', 0),
(6, 14, 'Photo and Media Sites', 2),
(7, 14, 'All of the Above!', 3),
(8, 14, '', 0),
(9, 14, '', 0),
(10, 14, '', 0),
(11, 14, '', 0),
(12, 14, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_poll_date`
--

INSERT INTO `jos_poll_date` (`id`, `date`, `vote_id`, `poll_id`) VALUES
(1, '2006-10-09 13:01:58', 1, 14),
(2, '2006-10-10 15:19:43', 7, 14),
(3, '2006-10-11 11:08:16', 7, 14),
(4, '2006-10-11 15:02:26', 2, 14),
(5, '2006-10-11 15:43:03', 7, 14),
(6, '2006-10-11 15:43:38', 7, 14),
(7, '2006-10-12 00:51:13', 2, 14),
(8, '2007-05-10 19:12:29', 3, 14),
(9, '2007-05-14 14:18:00', 6, 14),
(10, '2007-06-10 15:20:29', 6, 14),
(11, '2007-07-03 12:37:53', 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(14, 'Joomla! is used for?', 'joomla-is-used-for', 11, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'News', '', 'news', 'articles.jpg', 'content', 'right', 'Select a news topic from the list below, then select a news article to read.', 1, 0, '0000-00-00 00:00:00', 3, 0, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('admin', '1379428397', '2rmsvlk2kkbtjhbpp7kfn89911', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:8;s:19:"session.timer.start";i:1379428357;s:18:"session.timer.last";i:1379428390;s:17:"session.timer.now";i:1379428397;s:22:"session.client.browser";s:74:"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:3:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:30:"clara.caminal@irbbarcelona.org";s:8:"password";s:65:"b38d4d3e666bd3f2c27975afb7b88584:74OqSrClCw7sQFTbANXsjJoBZxQIqNYH";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2009-10-08 18:40:28";s:13:"lastvisitDate";s:19:"2013-07-09 14:49:12";s:10:"activation";s:45:"e143ef01e986212d6137c7a46c8572ea:$1$e56e4a67$";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:67:"/home/roberto/workspace/phd/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"0";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"c6c2053c23acbfe0b907054f1f7a14bd";}'),
('', '1379428341', '6hsccoiqu7786d5q7h9ue6sp60', 1, 0, '', 0, 0, '__default|a:9:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1379428341;s:18:"session.timer.last";i:1379428341;s:17:"session.timer.now";i:1379428341;s:22:"session.client.browser";s:74:"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:67:"/home/roberto/workspace/phd/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:16:"com_mailto.links";a:1:{s:40:"10dc5a045d37f57679f9a82cc7941ee0ce34df8b";O:8:"stdClass":2:{s:4:"link";s:111:"http://localhost/phd/index.php?option=com_content&view=article&id=50:application-guidelines&catid=1:latest-news";s:6:"expiry";i:1379428342;}}s:13:"session.token";s:32:"3ca7b773ef6e6c3433fb78f14a045833";}'),
('', '1379428362', 'hhg4h2s83q57lhcut6v8kol8r6', 1, 0, '', 0, 1, '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1379428357;s:18:"session.timer.last";i:1379428357;s:17:"session.timer.now";i:1379428357;s:22:"session.client.browser";s:74:"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:67:"/home/roberto/workspace/phd/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"c6c2053c23acbfe0b907054f1f7a14bd";}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('ja_nickel', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=913 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'clara.caminal@irbbarcelona.org', 'b38d4d3e666bd3f2c27975afb7b88584:74OqSrClCw7sQFTbANXsjJoBZxQIqNYH', 'Super Administrator', 0, 1, 25, '2009-10-08 18:40:28', '2013-09-17 14:32:45', 'e143ef01e986212d6137c7a46c8572ea:$1$e56e4a67$', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(86, 'phdadmin', 'phdadmin', 'patricia.nadal@irbbarcelona.org', '74ae30523ec720b84b6cf76f79444449:aKolz5yQgQBxdbB1G2DzNm5Ynz5yKaIR', 'Super Administrator', 0, 0, 25, '2010-04-22 14:50:10', '2011-09-08 06:57:09', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(665, 'phdadmin2', 'phdadmin2', 'ccaminal@irbbarcelona.org', '52d34905af14de9bf1a0073689a5ee83:mXDDldvX9Dt3uIU7lKQOH44ZMOvuegVF', 'Super Administrator', 0, 0, 25, '2011-04-21 12:55:10', '2011-09-30 11:32:07', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=1\n\n'),
(912, 'Coll', 'mcoll', 'mcoll@mail.com', 'b8072695c4c60e83708d1c191b470eab:WyBYV3uiuPYhntsVhd5jb4aIDPDA6NJB', 'Registered', 0, 0, 18, '2013-07-09 14:50:38', '2013-07-09 14:50:54', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=1\n\n'),
(911, 'Roberto Bartolomé', 'roberto', 'roberto@mail.com', '536665fbeba75147c8cb72198a3e0eaf:04sz4XT6kNqI2wPbhCRAJpYA6EQ2sbjt', 'Registered', 0, 0, 18, '2013-05-31 11:57:49', '2013-05-31 11:58:19', '62248c9b68a225b26ebc18d746d4888b', '\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_weblinks`
--

INSERT INTO `jos_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `published`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `params`) VALUES
(1, 2, 0, 'Joomla!', 'joomla', 'http://www.joomla.org', 'Home of Joomla!', '2005-02-14 15:19:02', 3, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 'target=0'),
(2, 2, 0, 'php.net', 'php', 'http://www.php.net', 'The language that Joomla! is developed in', '2004-07-07 11:33:24', 6, 1, 0, '0000-00-00 00:00:00', 3, 0, 1, ''),
(3, 2, 0, 'MySQL', 'mysql', 'http://www.mysql.com', 'The database that Joomla! uses', '2004-07-07 10:18:31', 1, 1, 0, '0000-00-00 00:00:00', 5, 0, 1, ''),
(4, 2, 0, 'OpenSourceMatters', 'opensourcematters', 'http://www.opensourcematters.org', 'Home of OSM', '2005-02-14 15:19:02', 11, 1, 0, '0000-00-00 00:00:00', 2, 0, 1, 'target=0'),
(5, 2, 0, 'Joomla! - Forums', 'joomla-forums', 'http://forum.joomla.org', 'Joomla! Forums', '2005-02-14 15:19:02', 4, 1, 0, '0000-00-00 00:00:00', 4, 0, 1, 'target=0'),
(6, 2, 0, 'Ohloh Tracking of Joomla!', 'ohloh-tracking-of-joomla', 'http://www.ohloh.net/projects/20', 'Objective reports from Ohloh about Joomla''s development activity. Joomla! has some star developers with serious kudos.', '2007-07-19 09:28:31', 1, 1, 0, '0000-00-00 00:00:00', 6, 0, 1, 'target=0\n\n');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
