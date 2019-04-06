/*
SQLyog Ultimate v12.4.2 (64 bit)
MySQL - 5.6.43 : Database - mobile1_8
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mobile1_8` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mobile1_8`;

/*Table structure for table `community` */

CREATE TABLE `community` (
  `communityId` VARCHAR(200) COLLATE utf8_unicode_ci NOT NULL,
  `communityName` VARCHAR(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessType` VARCHAR(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replicate` TINYINT(4) DEFAULT '1',
  `rcordSeq` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `webhookSeq` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `communityCode` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`communityId`),
  KEY `communityCode` (`communityCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3014 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `feedprocessor` */

CREATE TABLE `feedprocessor` (
  `fieldId` bigint(20) NOT NULL AUTO_INCREMENT,
  `communityId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seq` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `jobId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`fieldId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `follow` */

CREATE TABLE `follow` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `communityId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profileId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subprofileId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UNIQUE` (`userId`,`communityId`,`applicationId`,`profileId`)
) ENGINE=InnoDB AUTO_INCREMENT=12377 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `log_feedProcessor` */

CREATE TABLE `log_feedProcessor` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `documentId` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seq` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isError` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jobId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=516290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `notification` */

CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `workerId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `recipientUserId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `communityId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `profileId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `subprofileId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `senderUserId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `subprocessUUID` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38125 DEFAULT CHARSET=latin1;

/*Table structure for table `roles` */

CREATE TABLE `roles` (
  `roleId` int(11) NOT NULL,
  `roleName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `uniqueindicator` */

CREATE TABLE `uniqueindicator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `communityId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `setId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elementId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indicatorId` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2845 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `uniqueindicatorapproved` */

CREATE TABLE `uniqueindicatorapproved` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `communityId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `setId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `elementId` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indicatorId` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1332 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `user_` */

CREATE TABLE `user_` (
  `userId` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT '1',
  `forcePwChange` tinyint(4) DEFAULT '0',
  `syncUsername` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `syncPassword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `emailId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buildAccess` int(1) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `Username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `user_roles_map` */

CREATE TABLE `user_roles_map` (
  `roleMapId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `communityId` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roleMapId`),
  UNIQUE KEY `Unique` (`userId`,`communityId`,`roleId`),
  KEY `communityId_fk` (`communityId`),
  CONSTRAINT `communityId_fk` FOREIGN KEY (`communityId`) REFERENCES `community` (`communityId`),
  CONSTRAINT `userId_fk` FOREIGN KEY (`userId`) REFERENCES `user_` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9578 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `worker_logs` */

CREATE TABLE `worker_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `worker` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profileId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `communityId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subprocessId` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isError` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workerName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286667 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
