# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: pc.mansionlai.tk (MySQL 5.7.21)
# Database: mrbs
# Generation Time: 2018-10-07 03:11:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table mrbs_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mrbs_area`;

CREATE TABLE `mrbs_area` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mrbs_area` WRITE;
/*!40000 ALTER TABLE `mrbs_area` DISABLE KEYS */;

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `sort_key`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_create_ahead_enabled`, `min_create_ahead_secs`, `max_create_ahead_enabled`, `max_create_ahead_secs`, `min_delete_ahead_enabled`, `min_delete_ahead_secs`, `max_delete_ahead_enabled`, `max_delete_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `max_duration_enabled`, `max_duration_secs`, `max_duration_periods`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `periods`, `confirmation_enabled`, `confirmed_default`)
VALUES
	(1,0,'客家學院大樓','',NULL,'mansion.lai.411@gmail.com,spyro12393@g.ncu.edu.tw',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,0,'綜教館','',NULL,'mansion.lai.411@gmail.com,spyro12393@g.ncu.edu.tw',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `mrbs_area` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mrbs_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mrbs_entry`;

CREATE TABLE `mrbs_entry` (
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
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
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
  KEY `idxEndTime` (`end_time`),
  CONSTRAINT `mrbs_entry_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `mrbs_entry_ibfk_2` FOREIGN KEY (`repeat_id`) REFERENCES `mrbs_repeat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mrbs_entry` WRITE;
/*!40000 ALTER TABLE `mrbs_entry` DISABLE KEYS */;

INSERT INTO `mrbs_entry` (`id`, `start_time`, `end_time`, `entry_type`, `repeat_id`, `room_id`, `timestamp`, `create_by`, `modified_by`, `name`, `type`, `description`, `status`, `reminded`, `info_time`, `info_user`, `info_text`, `ical_uid`, `ical_sequence`, `ical_recur_id`)
VALUES
	(2,1538796600,1538803800,0,NULL,1001,'2018-10-06 13:11:03','dept','dept','fdsaf','I','fdsa',0,NULL,NULL,NULL,NULL,'MRBS-5bb843cdde3b9-5c83f1cf@book.ncuisq.tk',1,NULL),
	(12,1538791200,1538794800,0,NULL,1010,'2018-10-06 13:16:52','user','user','fdsa','I','fdsa',0,NULL,NULL,NULL,NULL,'MRBS-5bb844f4ec950-7f7ba152@book.ncuisq.tk',2,NULL),
	(13,1538791200,1538794800,0,NULL,1011,'2018-10-06 13:16:52','user','user','fdsa','I','fdsa',0,NULL,NULL,NULL,NULL,'MRBS-5bb844f4ec950-7f7ba152@book.ncuisq.tk',2,NULL),
	(14,1538791200,1538794800,0,NULL,1012,'2018-10-06 13:16:52','user','user','fdsa','I','fdsa',0,NULL,NULL,NULL,NULL,'MRBS-5bb844f4ec950-7f7ba152@book.ncuisq.tk',2,NULL),
	(15,1538791200,1538794800,0,NULL,1013,'2018-10-06 13:16:52','user','user','fdsa','I','fdsa',0,NULL,NULL,NULL,NULL,'MRBS-5bb844f4ec950-7f7ba152@book.ncuisq.tk',2,NULL),
	(24,1538784000,1538787600,0,NULL,1001,'2018-10-06 13:20:22','user','dept','HIHI','I','fdfsa',0,NULL,NULL,NULL,NULL,'MRBS-5bb845be63b76-6f6c0b2e@book.ncuisq.tk',1,'.'),
	(25,1538780400,1538784000,0,NULL,1002,'2018-10-06 13:36:26','dept','','dept','I','fdsa',0,NULL,NULL,NULL,NULL,'MRBS-5bb849cee5683-d9d40367@book.ncuisq.tk',0,NULL),
	(26,1538780400,1538784000,0,NULL,1004,'2018-10-06 15:43:30','user','','Mansion','I','',0,NULL,NULL,NULL,NULL,'MRBS-5bb867160e7aa-ba430842@book.ncuisq.tk',1,NULL),
	(30,1538780400,1538784000,0,NULL,1005,'2018-10-06 16:23:00','user','','User','I','',0,NULL,NULL,NULL,NULL,'MRBS-5bb868fa75500-99d61607@book.ncuisq.tk',1,NULL),
	(31,1538755200,1538758800,0,NULL,1006,'2018-10-06 16:26:24','user2','','酷帥哥哥','I','',0,NULL,NULL,NULL,NULL,'MRBS-5bb8716953736-2d4826bf@book.ncuisq.tk',1,NULL),
	(32,1538802000,1538805600,0,NULL,1004,'2018-10-06 17:44:41','user','mrbs','gdsgd','I','gdsg',0,NULL,NULL,NULL,NULL,'MRBS-5bb8457ac1892-610c2fb2@book.ncuisq.tk',1,'.'),
	(33,1538784000,1538787600,0,NULL,1004,'2018-10-06 21:40:21','user','','Mansion','I','mansion',0,NULL,NULL,NULL,NULL,'MRBS-5bb8bb2e8946c-1deb32fd@localhost',1,NULL),
	(35,1538793000,1538796600,0,NULL,1008,'2018-10-07 09:58:46','user2','','Hello','I','',0,NULL,NULL,NULL,NULL,'MRBS-5bb8c8ba4bd9c-1bb95473@book.ncuisq.tk',1,NULL),
	(42,1538791200,1538794800,0,NULL,1004,'2018-10-06 23:09:26','user','','User','I','',0,NULL,NULL,NULL,NULL,'MRBS-5bb8cfb4c3dd8-a8e0d5e0@localhost',1,NULL),
	(43,1538872200,1538875800,0,NULL,1006,'2018-10-07 09:58:48','user','','Kiwi','I','',0,NULL,NULL,NULL,NULL,'MRBS-5bb8e412aca75-e0c935a5@localhost',1,NULL),
	(44,1538870400,1538915400,0,NULL,1011,'2018-10-07 09:59:59','user','','Mansion','I','',2,NULL,NULL,NULL,NULL,'MRBS-5bb9689231b07-df7cf3c4@book.ncuisq.tk',0,NULL);

/*!40000 ALTER TABLE `mrbs_entry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mrbs_repeat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mrbs_repeat`;

CREATE TABLE `mrbs_repeat` (
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
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reminded` int(11) DEFAULT NULL,
  `info_time` int(11) DEFAULT NULL,
  `info_user` varchar(80) DEFAULT NULL,
  `info_text` text,
  `ical_uid` varchar(255) NOT NULL DEFAULT '',
  `ical_sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `mrbs_repeat_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table mrbs_room
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mrbs_room`;

CREATE TABLE `mrbs_room` (
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
  KEY `idxSortKey` (`sort_key`),
  CONSTRAINT `mrbs_room_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `mrbs_area` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mrbs_room` WRITE;
/*!40000 ALTER TABLE `mrbs_room` DISABLE KEYS */;

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `custom_html`)
VALUES
	(1001,0,1,'103','','HK',30,'spyro12393@gmail.com, mansionlai411@gmail.com',NULL),
	(1002,0,1,'104','','HK',35,'',NULL),
	(1003,0,1,'106','','HK',140,'',NULL),
	(1004,0,1,'115','','HK',50,'',NULL),
	(1005,0,1,'116','','HK',38,'',NULL),
	(1006,0,1,'210','','HK',30,'',NULL),
	(1007,0,1,'211','','HK',15,'',NULL),
	(1008,0,1,'216','','HK',40,'',NULL),
	(1009,0,1,'219','','HK',39,'',NULL),
	(1010,0,1,'301','','HK',12,NULL,NULL),
	(1011,0,1,'302','','HK',20,NULL,NULL),
	(1012,0,1,'303','','HK',15,NULL,NULL),
	(1013,0,1,'304','','HK',12,NULL,NULL),
	(1014,0,1,'313','','HK',30,NULL,NULL),
	(1015,0,1,'315','','HK',40,NULL,NULL),
	(1016,0,1,'408','','HK',6,NULL,NULL),
	(1017,0,1,'411','','HK',6,NULL,NULL),
	(1018,0,1,'418','','HK',30,NULL,NULL),
	(1019,0,1,'501','','HK',6,NULL,NULL),
	(1020,0,1,'502','','HK',20,NULL,NULL),
	(1021,0,1,'503','','HK',8,NULL,NULL),
	(1022,0,1,'505','','HK',1,NULL,NULL),
	(1023,0,1,'507','','HK',1,NULL,NULL),
	(2001,0,2,'104','','O',50,NULL,NULL),
	(2002,0,2,'105','','O',50,NULL,NULL),
	(2003,0,2,'106','','O',50,NULL,NULL),
	(2004,0,2,'114','','O',130,NULL,NULL),
	(2005,0,2,'122','','O',135,NULL,NULL),
	(2006,0,2,'202','','O',24,NULL,NULL),
	(2007,0,2,'203-1','','O',75,NULL,NULL),
	(2008,0,2,'209','','O',122,NULL,NULL),
	(2009,0,2,'210','','O',46,NULL,NULL),
	(2010,0,2,'211','','O',46,NULL,NULL),
	(2011,0,2,'212','','O',50,NULL,NULL),
	(2012,0,2,'214','','O',134,NULL,NULL),
	(2013,0,2,'301','','O',2,NULL,NULL),
	(2014,0,2,'302','','O',18,NULL,NULL),
	(2015,0,2,'303','','O',21,NULL,NULL),
	(2016,0,2,'306','','O',0,NULL,NULL),
	(2017,0,2,'311-2','','O',12,NULL,NULL),
	(2018,0,2,'311-3','','O',12,NULL,NULL),
	(2019,0,2,'312','','O',52,NULL,NULL),
	(2020,0,2,'313','','O',52,NULL,NULL),
	(2021,0,2,'314','','O',25,NULL,NULL),
	(2022,0,2,'403','','O',50,NULL,NULL),
	(2023,0,2,'404','','O',50,NULL,NULL);

/*!40000 ALTER TABLE `mrbs_room` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mrbs_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mrbs_users`;

CREATE TABLE `mrbs_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mrbs_users` WRITE;
/*!40000 ALTER TABLE `mrbs_users` DISABLE KEYS */;

INSERT INTO `mrbs_users` (`id`, `level`, `name`, `password_hash`, `email`, `timestamp`)
VALUES
	(3,3,'mrbs','$2y$10$eRpDptunyKTgdOwraMP3Ge/5yYfcdZK/CKlacn1N3lhYK8CpJQevm','mrbs@reservation.ncu.edu.tw','2018-10-06 12:41:49'),
	(4,1,'user','$2y$10$/Yg5GUsoR.LQ9Cru/P9XhePrcTOOZfxEeOAQaAr/gOC.mUqfcNyNC','106423040@cc.ncu.edu.tw','2018-10-07 09:34:55'),
	(5,2,'dept','$2y$10$SbUDAzHZhrP6vafaqdq7NurkJRwAIupSifekCMTVV1VhZxevvMw86','spyro12393@g.ncu.edu.tw','2018-10-06 13:20:14'),
	(6,0,'none','$2y$10$u7sEyZfyJnbDvaWd/HRs8Or9sEdkF0JCKlx87MwS4hWSjB5dSaI2q','none@g.ncu.edu.tw','2018-10-06 13:20:03'),
	(8,1,'user2','$2y$10$2OXbppLh5tEJUahXvNJBg.EnWbDdGyYMPN0N4VAoj31eKydIhwdGy','106522066@cc.ncu.edu.tw','2018-10-07 09:35:05'),
	(9,1,'孟昇','$2y$10$YjOx8m/i3.uAeXbMohYSPObLvuq2v6mgZogRjqPciqqUhy9D4Z/xa','106522066@cc.ncu.edu.tw','2018-10-07 10:50:01');

/*!40000 ALTER TABLE `mrbs_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mrbs_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mrbs_variables`;

CREATE TABLE `mrbs_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(80) DEFAULT NULL,
  `variable_content` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_variable_name` (`variable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mrbs_variables` WRITE;
/*!40000 ALTER TABLE `mrbs_variables` DISABLE KEYS */;

INSERT INTO `mrbs_variables` (`id`, `variable_name`, `variable_content`)
VALUES
	(1,'db_version','53'),
	(2,'local_db_version','1');

/*!40000 ALTER TABLE `mrbs_variables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mrbs_zoneinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mrbs_zoneinfo`;

CREATE TABLE `mrbs_zoneinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timezone` varchar(255) NOT NULL DEFAULT '',
  `outlook_compatible` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `vtimezone` text,
  `last_updated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_timezone` (`timezone`,`outlook_compatible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mrbs_zoneinfo` WRITE;
/*!40000 ALTER TABLE `mrbs_zoneinfo` DISABLE KEYS */;

INSERT INTO `mrbs_zoneinfo` (`id`, `timezone`, `outlook_compatible`, `vtimezone`, `last_updated`)
VALUES
	(1,'Asia/Taipei',1,'BEGIN:VTIMEZONE\r\nTZID:Asia/Taipei\r\nTZURL:http://tzurl.org/zoneinfo-outlook/Asia/Taipei\r\nX-LIC-LOCATION:Asia/Taipei\r\nBEGIN:STANDARD\r\nTZOFFSETFROM:+0800\r\nTZOFFSETTO:+0800\r\nTZNAME:CST\r\nDTSTART:19700101T000000\r\nEND:STANDARD\r\nEND:VTIMEZONE',1538796510);

/*!40000 ALTER TABLE `mrbs_zoneinfo` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
