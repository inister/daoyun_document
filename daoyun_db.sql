/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - daoyun_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`daoyun_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `daoyun_db`;

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(20) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`class_id`),
  KEY `FK_Reference_9` (`creator`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `class` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `dic_id` int(11) NOT NULL,
  `dic_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dictionary` */

/*Table structure for table `dictionary_data` */

DROP TABLE IF EXISTS `dictionary_data`;

CREATE TABLE `dictionary_data` (
  `data_id` int(11) NOT NULL,
  `dic_id` int(11) DEFAULT NULL,
  `value` varchar(10) DEFAULT NULL,
  `dic_name` varchar(255) DEFAULT NULL,
  `is_modify` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `FK_Reference_14` (`dic_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`dic_id`) REFERENCES `dictionary` (`dic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dictionary_data` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `perm_id` int(11) NOT NULL,
  `par_id` int(11) DEFAULT NULL,
  `menu_name` varchar(20) DEFAULT NULL,
  `is_page` tinyint(4) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`perm_id`),
  KEY `FK_Reference_1` (`par_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`par_id`) REFERENCES `permission` (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `creator` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  KEY `FK_Reference_2` (`creator`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `rolepermission` */

DROP TABLE IF EXISTS `rolepermission`;

CREATE TABLE `rolepermission` (
  `role_id` int(11) DEFAULT NULL,
  `perm_id` int(11) DEFAULT NULL,
  KEY `FK_Reference_5` (`perm_id`),
  KEY `FK_Reference_6` (`role_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`perm_id`) REFERENCES `permission` (`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rolepermission` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` int(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `emile` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `class` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `userclass` */

DROP TABLE IF EXISTS `userclass`;

CREATE TABLE `userclass` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  KEY `FK_Reference_7` (`user_id`),
  KEY `FK_Reference_8` (`class_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userclass` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
