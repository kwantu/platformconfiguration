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
USE `mobile1_8`;

/*Data for the table `community` */

INSERT  INTO `community`(`communityId`,`communityName`,`description`,`accessType`,`replicate`,`rcordSeq`,`webhookSeq`,`communityCode`) VALUES ('29000','Root community','Root community','1',1,NULL,NULL,25);

/*Data for the table `feedprocessor` */

/*Data for the table `follow` */

/*Data for the table `log_feedProcessor` */

/*Data for the table `notification` */

/*Data for the table `roles` */

INSERT  INTO `roles`(`roleId`,`roleName`,`description`) VALUES (1,'Admin','Admin'),(2,'Member','Member');

/*Data for the table `uniqueindicator` */

/*Data for the table `uniqueindicatorapproved` */

/*Data for the table `user_` */

INSERT  INTO `user_`(`userId`,`firstname`,`lastname`,`title`,`username`,`password`,`isActive`,`forcePwChange`,`syncUsername`,`syncPassword`,`createDate`,`emailId`,`buildAccess`) VALUES ('38','Kwantu','Administrator','','GIZ','7931badd1031b38d1280dac5ebeb7054',1,0,'giz','7931badd1031b38d1280dac5ebeb7054',NULL,'rob@kwantu.net',1);

/*Data for the table `user_roles_map` */

INSERT  INTO `user_roles_map`(`roleMapId`,`userId`,`communityId`,`roleId`,`status`) VALUES (39,'38','29000',1,'approved'),(9256,'38','29000',2,'approved');

/*Data for the table `worker_logs` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
