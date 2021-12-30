/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.6.44 : Database - hotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hotel`;

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(18) NOT NULL,
  `userpass` char(32) NOT NULL,
  `realname` varchar(32) NOT NULL,
  `empnum` varchar(12) NOT NULL,
  `super_admin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `empnum` (`empnum`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`admin_id`,`username`,`userpass`,`realname`,`empnum`,`super_admin`) values (1,'123','202cb962ac59075b964b07152d234b70','202cb962ac59075b964b07152d234b70','3',1);

/*Table structure for table `tb_comment` */

DROP TABLE IF EXISTS `tb_comment`;

CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `pub_date` datetime NOT NULL,
  `room_info_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_user_fk` (`user_id`),
  KEY `comment_room_info_fk` (`room_info_id`),
  CONSTRAINT `comment_room_info_fk` FOREIGN KEY (`room_info_id`) REFERENCES `tb_room_info` (`room_info_id`),
  CONSTRAINT `comment_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_comment` */

insert  into `tb_comment`(`comment_id`,`content`,`pub_date`,`room_info_id`,`user_id`) values (1,'这房型很好','2021-10-05 15:27:39',1,1);

/*Table structure for table `tb_history_order` */

DROP TABLE IF EXISTS `tb_history_order`;

CREATE TABLE `tb_history_order` (
  `histoty_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `checkOutDate` datetime NOT NULL,
  PRIMARY KEY (`histoty_order_id`),
  KEY `history_order_admin_fk` (`admin_id`),
  KEY `history_order_reservation_fk` (`reservation_id`),
  CONSTRAINT `history_order_admin_fk` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`),
  CONSTRAINT `history_order_reservation_fk` FOREIGN KEY (`reservation_id`) REFERENCES `tb_reservation` (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tb_history_order` */

/*Table structure for table `tb_promotion` */

DROP TABLE IF EXISTS `tb_promotion`;

CREATE TABLE `tb_promotion` (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_promotion` */

insert  into `tb_promotion`(`promotion_id`,`title`,`content`,`pub_date`) values (1,'买一送一','预购大床房买一送一','2021-10-05 14:48:45'),(2,'520主题日','预订五折','2021-10-06 08:45:53');

/*Table structure for table `tb_reservation` */

DROP TABLE IF EXISTS `tb_reservation`;

CREATE TABLE `tb_reservation` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `order_time` datetime NOT NULL,
  `days` int(11) NOT NULL DEFAULT '1',
  `check_in_time` datetime NOT NULL,
  `check_in_name` varchar(32) NOT NULL,
  `check_in_phone` char(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_info_id` int(11) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `reservation_user_fk` (`user_id`),
  KEY `reservation_room_info_id_fk` (`room_info_id`),
  CONSTRAINT `reservation_room_info_id_fk` FOREIGN KEY (`room_info_id`) REFERENCES `tb_room_info` (`room_info_id`),
  CONSTRAINT `reservation_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_reservation` */

insert  into `tb_reservation`(`reservation_id`,`status`,`order_time`,`days`,`check_in_time`,`check_in_name`,`check_in_phone`,`user_id`,`room_info_id`) values (1,0,'2021-10-05 15:06:47',2,'2021-10-05 15:06:00','李丑逼','15534481057',1,2),(2,2,'2021-10-05 15:29:58',2,'2021-10-05 16:29:00','李帅哥','15534481079',1,1),(3,2,'2021-10-06 08:44:39',4,'2021-10-06 08:44:00','李帅哥','15532114567',2,4);

/*Table structure for table `tb_room_catalog` */

DROP TABLE IF EXISTS `tb_room_catalog`;

CREATE TABLE `tb_room_catalog` (
  `room_catalog_id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog` varchar(32) NOT NULL,
  PRIMARY KEY (`room_catalog_id`),
  UNIQUE KEY `catalog` (`catalog`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_room_catalog` */

insert  into `tb_room_catalog`(`room_catalog_id`,`catalog`) values (3,'双人床'),(1,'大床房'),(2,'情侣房');

/*Table structure for table `tb_room_info` */

DROP TABLE IF EXISTS `tb_room_info`;

CREATE TABLE `tb_room_info` (
  `room_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_num` varchar(32) NOT NULL,
  `area` int(11) NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `room_catalog_id` int(11) DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `version` bigint(20) DEFAULT '1',
  PRIMARY KEY (`room_info_id`),
  UNIQUE KEY `room_num` (`room_num`),
  KEY `room_info_catalog_fk` (`room_catalog_id`),
  CONSTRAINT `room_info_catalog_fk` FOREIGN KEY (`room_catalog_id`) REFERENCES `tb_room_catalog` (`room_catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tb_room_info` */

insert  into `tb_room_info`(`room_info_id`,`room_num`,`area`,`photo_path`,`intro`,`price`,`room_catalog_id`,`status`,`version`) values (1,'1',10,'1.jpg','环境优雅','12.00',1,2,3),(2,'2',20,'2.jpg','非常nice','16.00',1,0,3),(3,'3',10,'40','','12.00',2,0,1),(4,'36',123,'89c481b6ffad170bdefd2930370d207744a618b1.jpg','123','123.00',NULL,2,3),(5,'3123',123,'89c481b6ffad170bdefd2930370d207744a618b1.jpg','123','123.00',1,0,1),(6,'55',123,'9ca833c8a8a787bc470188c1fa03bbbdf6c95aed.jpg','123','123.00',1,0,1),(7,'123',123,'default.jpg','312','123.00',1,0,1),(8,'123123',123,'default.jpg','123','123.00',1,0,1),(9,'777',14,'b107d9d63c7d61ed695fe67b7a9ab4faccd77de6.jpg','很大的床','13.00',1,0,1);

/*Table structure for table `tb_room_photo` */

DROP TABLE IF EXISTS `tb_room_photo`;

CREATE TABLE `tb_room_photo` (
  `room_photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_path` varchar(255) NOT NULL,
  `room_info_id` int(11) NOT NULL,
  PRIMARY KEY (`room_photo_id`),
  KEY `room_info_photo_fk` (`room_info_id`),
  CONSTRAINT `room_info_photo_fk` FOREIGN KEY (`room_info_id`) REFERENCES `tb_room_info` (`room_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tb_room_photo` */

insert  into `tb_room_photo`(`room_photo_id`,`photo_path`,`room_info_id`) values (1,'007f0fb1c374c1280eff8877de0b3c8fd4518c42.jpg',1);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(18) NOT NULL,
  `userpass` char(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` char(11) NOT NULL,
  `realname` varchar(32) NOT NULL,
  `gender` char(3) NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`userpass`,`email`,`phone`,`realname`,`gender`,`photo_path`,`status`) values (1,'q2933824981','202cb962ac59075b964b07152d234b70','1244224501@qq.com','15534481057','李丑逼','男','9ca833c8a8a787bc470188c1fa03bbbdf6c95aed.jpg',1),(2,'q1244224324','202cb962ac59075b964b07152d234b70','1244324501@qq.com','15535581057','李帅哥','男','89c481b6ffad170bdefd2930370d207744a618b1.jpg',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
