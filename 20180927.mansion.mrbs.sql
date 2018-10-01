-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 27, 2018 at 06:30 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_area`
--

DROP TABLE IF EXISTS `mrbs_area`;
CREATE TABLE IF NOT EXISTS `mrbs_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `area_name` varchar(30) DEFAULT NULL,
  `sort_key` varchar(30) NOT NULL DEFAULT '',
  `timezone` varchar(50) DEFAULT NULL,
  `area_admin_email` text,
  `resolution` int(11) DEFAULT NULL,
  `default_duration` int(11) DEFAULT NULL,
  `default_duration_all_day` tinyint(1) NOT NULL DEFAULT '0',
  `morningstarts` int(11) DEFAULT NULL,
  `morningstarts_minutes` int(11) DEFAULT NULL,
  `eveningends` int(11) DEFAULT NULL,
  `eveningends_minutes` int(11) DEFAULT NULL,
  `private_enabled` tinyint(1) DEFAULT NULL,
  `private_default` tinyint(1) DEFAULT NULL,
  `private_mandatory` tinyint(1) DEFAULT NULL,
  `private_override` varchar(32) DEFAULT NULL,
  `min_create_ahead_enabled` tinyint(1) DEFAULT NULL,
  `min_create_ahead_secs` int(11) DEFAULT NULL,
  `max_create_ahead_enabled` tinyint(1) DEFAULT NULL,
  `max_create_ahead_secs` int(11) DEFAULT NULL,
  `min_delete_ahead_enabled` tinyint(1) DEFAULT NULL,
  `min_delete_ahead_secs` int(11) DEFAULT NULL,
  `max_delete_ahead_enabled` tinyint(1) DEFAULT NULL,
  `max_delete_ahead_secs` int(11) DEFAULT NULL,
  `max_per_day_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_day` int(11) NOT NULL DEFAULT '0',
  `max_per_week_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_week` int(11) NOT NULL DEFAULT '0',
  `max_per_month_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_month` int(11) NOT NULL DEFAULT '0',
  `max_per_year_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_year` int(11) NOT NULL DEFAULT '0',
  `max_per_future_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_per_future` int(11) NOT NULL DEFAULT '0',
  `max_duration_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_duration_secs` int(11) NOT NULL DEFAULT '0',
  `max_duration_periods` int(11) NOT NULL DEFAULT '0',
  `custom_html` text,
  `approval_enabled` tinyint(1) DEFAULT NULL,
  `reminders_enabled` tinyint(1) DEFAULT NULL,
  `enable_periods` tinyint(1) DEFAULT NULL,
  `periods` text,
  `confirmation_enabled` tinyint(1) DEFAULT NULL,
  `confirmed_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_area_name` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_area`
--

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `sort_key`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_create_ahead_enabled`, `min_create_ahead_secs`, `max_create_ahead_enabled`, `max_create_ahead_secs`, `min_delete_ahead_enabled`, `min_delete_ahead_secs`, `max_delete_ahead_enabled`, `max_delete_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `max_duration_enabled`, `max_duration_secs`, `max_duration_periods`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `periods`, `confirmation_enabled`, `confirmed_default`) VALUES
(1, 0, '客家學院大樓', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 0, '綜教館', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_entry`
--

DROP TABLE IF EXISTS `mrbs_entry`;
CREATE TABLE IF NOT EXISTS `mrbs_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `entry_type` int(11) NOT NULL DEFAULT '0',
  `repeat_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) NOT NULL DEFAULT '',
  `modified_by` varchar(80) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) DEFAULT NULL,
  `info_text` text,
  `ical_uid` varchar(255) NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT '0',
  `ical_recur_id` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  KEY `repeat_id` (`repeat_id`),
  KEY `idxStartTime` (`start_time`),
  KEY `idxEndTime` (`end_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_repeat`
--

DROP TABLE IF EXISTS `mrbs_repeat`;
CREATE TABLE IF NOT EXISTS `mrbs_repeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `rep_type` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `rep_opt` varchar(32) NOT NULL DEFAULT '',
  `room_id` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) NOT NULL DEFAULT '',
  `modified_by` varchar(80) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text,
  `rep_num_weeks` smallint(6) DEFAULT NULL,
  `month_absolute` smallint(6) DEFAULT NULL,
  `month_relative` varchar(4) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) DEFAULT NULL,
  `info_text` text,
  `ical_uid` varchar(255) NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_room`
--

DROP TABLE IF EXISTS `mrbs_room`;
CREATE TABLE IF NOT EXISTS `mrbs_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `area_id` int(11) NOT NULL DEFAULT '0',
  `room_name` varchar(25) NOT NULL DEFAULT '',
  `sort_key` varchar(25) NOT NULL DEFAULT '',
  `description` varchar(60) DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT '0',
  `room_admin_email` text,
  `custom_html` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_room_name` (`area_id`,`room_name`),
  KEY `idxSortKey` (`sort_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2024 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_room`
--

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `custom_html`) VALUES
(1001, 0, 1, '103', '', 'HK', 30, NULL, NULL),
(1002, 0, 1, '104', '', 'HK', 35, NULL, NULL),
(1003, 0, 1, '106', '', 'HK', 140, NULL, NULL),
(1004, 0, 1, '115', '', 'HK', 50, NULL, NULL),
(1005, 0, 1, '116', '', 'HK', 38, NULL, NULL),
(1006, 0, 1, '210', '', 'HK', 30, NULL, NULL),
(1007, 0, 1, '211', '', 'HK', 15, NULL, NULL),
(1008, 0, 1, '216', '', 'HK', 40, NULL, NULL),
(1009, 0, 1, '219', '', 'HK', 39, NULL, NULL),
(1010, 0, 1, '301', '', 'HK', 12, NULL, NULL),
(1011, 0, 1, '302', '', 'HK', 20, NULL, NULL),
(1012, 0, 1, '303', '', 'HK', 15, NULL, NULL),
(1013, 0, 1, '304', '', 'HK', 12, NULL, NULL),
(1014, 0, 1, '313', '', 'HK', 30, NULL, NULL),
(1015, 0, 1, '315', '', 'HK', 40, NULL, NULL),
(1016, 0, 1, '408', '', 'HK', 6, NULL, NULL),
(1017, 0, 1, '411', '', 'HK', 6, NULL, NULL),
(1018, 0, 1, '418', '', 'HK', 30, NULL, NULL),
(1019, 0, 1, '501', '', 'HK', 6, NULL, NULL),
(1020, 0, 1, '502', '', 'HK', 20, NULL, NULL),
(1021, 0, 1, '503', '', 'HK', 8, NULL, NULL),
(1022, 0, 1, '505', '', 'HK', 1, NULL, NULL),
(1023, 0, 1, '507', '', 'HK', 1, NULL, NULL),
(2001, 0, 2, '104', '', 'O', 50, NULL, NULL),
(2002, 0, 2, '105', '', 'O', 50, NULL, NULL),
(2003, 0, 2, '106', '', 'O', 50, NULL, NULL),
(2004, 0, 2, '114', '', 'O', 130, NULL, NULL),
(2005, 0, 2, '122', '', 'O', 135, NULL, NULL),
(2006, 0, 2, '202', '', 'O', 24, NULL, NULL),
(2007, 0, 2, '203-1', '', 'O', 75, NULL, NULL),
(2008, 0, 2, '209', '', 'O', 122, NULL, NULL),
(2009, 0, 2, '210', '', 'O', 46, NULL, NULL),
(2010, 0, 2, '211', '', 'O', 46, NULL, NULL),
(2011, 0, 2, '212', '', 'O', 50, NULL, NULL),
(2012, 0, 2, '214', '', 'O', 134, NULL, NULL),
(2013, 0, 2, '301', '', 'O', 2, NULL, NULL),
(2014, 0, 2, '302', '', 'O', 18, NULL, NULL),
(2015, 0, 2, '303', '', 'O', 21, NULL, NULL),
(2016, 0, 2, '306', '', 'O', 0, NULL, NULL),
(2017, 0, 2, '311-2', '', 'O', 12, NULL, NULL),
(2018, 0, 2, '311-3', '', 'O', 12, NULL, NULL),
(2019, 0, 2, '312', '', 'O', 52, NULL, NULL),
(2020, 0, 2, '313', '', 'O', 52, NULL, NULL),
(2021, 0, 2, '314', '', 'O', 25, NULL, NULL),
(2022, 0, 2, '403', '', 'O', 50, NULL, NULL),
(2023, 0, 2, '404', '', 'O', 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_users`
--

DROP TABLE IF EXISTS `mrbs_users`;
CREATE TABLE IF NOT EXISTS `mrbs_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_users`
--

INSERT INTO `mrbs_users` (`id`, `level`, `name`, `password_hash`, `email`, `timestamp`) VALUES
(3, 2, 'mrbs', '$2y$10$eRpDptunyKTgdOwraMP3Ge/5yYfcdZK/CKlacn1N3lhYK8CpJQevm', 'mrbs@reservation.ncu.edu.tw', '2018-09-27 03:36:34');

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_variables`
--

DROP TABLE IF EXISTS `mrbs_variables`;
CREATE TABLE IF NOT EXISTS `mrbs_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(80) DEFAULT NULL,
  `variable_content` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_variable_name` (`variable_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mrbs_variables`
--

INSERT INTO `mrbs_variables` (`id`, `variable_name`, `variable_content`) VALUES
(1, 'db_version', '53'),
(2, 'local_db_version', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mrbs_zoneinfo`
--

DROP TABLE IF EXISTS `mrbs_zoneinfo`;
CREATE TABLE IF NOT EXISTS `mrbs_zoneinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) NOT NULL DEFAULT '',
  `outlook_compatible` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `vtimezone` text,
  `last_updated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_timezone` (`timezone`,`outlook_compatible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  ADD CONSTRAINT `mrbs_entry_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mrbs_entry_ibfk_2` FOREIGN KEY (`repeat_id`) REFERENCES `mrbs_repeat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  ADD CONSTRAINT `mrbs_repeat_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `mrbs_room`
--
ALTER TABLE `mrbs_room`
  ADD CONSTRAINT `mrbs_room_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `mrbs_area` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
