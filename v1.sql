/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.21 : Database - pos_store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pos_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pos_store`;

/*Table structure for table `tec_categories` */

DROP TABLE IF EXISTS `tec_categories`;

CREATE TABLE `tec_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tec_categories` */

insert  into `tec_categories`(`id`,`code`,`name`,`image`) values 
(1,'G01','General','no_image.png');

/*Table structure for table `tec_combo_items` */

DROP TABLE IF EXISTS `tec_combo_items`;

CREATE TABLE `tec_combo_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_combo_items` */

/*Table structure for table `tec_customers` */

DROP TABLE IF EXISTS `tec_customers`;

CREATE TABLE `tec_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tec_customers` */

insert  into `tec_customers`(`id`,`name`,`cf1`,`cf2`,`phone`,`email`,`store_id`) values 
(1,'Walk-in Client','','','012345678','customer@tecdiary.com',NULL);

/*Table structure for table `tec_expenses` */

DROP TABLE IF EXISTS `tec_expenses`;

CREATE TABLE `tec_expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_expenses` */

/*Table structure for table `tec_gift_cards` */

DROP TABLE IF EXISTS `tec_gift_cards`;

CREATE TABLE `tec_gift_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_gift_cards` */

/*Table structure for table `tec_groups` */

DROP TABLE IF EXISTS `tec_groups`;

CREATE TABLE `tec_groups` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tec_groups` */

insert  into `tec_groups`(`id`,`name`,`description`) values 
(1,'admin','Administrator'),
(2,'staff','Staff');

/*Table structure for table `tec_login_attempts` */

DROP TABLE IF EXISTS `tec_login_attempts`;

CREATE TABLE `tec_login_attempts` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tec_login_attempts` */

/*Table structure for table `tec_payments` */

DROP TABLE IF EXISTS `tec_payments`;

CREATE TABLE `tec_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tec_payments` */

insert  into `tec_payments`(`id`,`date`,`sale_id`,`customer_id`,`transaction_id`,`paid_by`,`cheque_no`,`cc_no`,`cc_holder`,`cc_month`,`cc_year`,`cc_type`,`amount`,`currency`,`created_by`,`attachment`,`note`,`pos_paid`,`pos_balance`,`gc_no`,`reference`,`updated_by`,`updated_at`,`store_id`) values 
(1,'2020-07-01 14:41:33',1,1,NULL,'cash','','','','','','',262.5000,NULL,1,NULL,'',262.5000,0.0000,'',NULL,NULL,NULL,1),
(2,'2020-07-01 14:42:27',2,1,NULL,'cash','','','','','','',105.0000,NULL,1,NULL,'',105.0000,0.0000,'',NULL,NULL,NULL,1),
(3,'2020-07-01 14:44:29',3,1,NULL,'cash','','','','','','',210.0000,NULL,1,NULL,'',210.0000,0.0000,'',NULL,NULL,NULL,1),
(4,'2020-07-01 14:46:23',4,1,NULL,'cash','','','','','','',157.5000,NULL,1,NULL,'',157.5000,0.0000,'',NULL,NULL,NULL,1),
(5,'2020-07-01 14:51:34',5,1,NULL,'cash','','','','','','',52.5000,NULL,1,NULL,'',52.5000,0.0000,'',NULL,NULL,NULL,1),
(6,'2020-07-01 14:54:07',6,1,NULL,'cash','','','','','','',157.5000,NULL,1,NULL,'',157.5000,0.0000,'',NULL,NULL,NULL,1),
(7,'2020-07-01 15:38:27',7,1,NULL,'cash','','','','','','',105.0000,NULL,1,NULL,'',105.0000,0.0000,'',NULL,NULL,NULL,1),
(8,'2020-07-01 15:46:40',8,1,NULL,'cash','','','','','','',105.0000,NULL,1,NULL,'',105.0000,0.0000,'',NULL,NULL,NULL,1),
(9,'2020-07-01 15:48:34',9,1,NULL,'cash','','','','','','',157.5000,NULL,1,NULL,'',157.5000,0.0000,'',NULL,NULL,NULL,1),
(10,'2020-07-01 15:49:10',10,1,NULL,'cash','','','','','','',157.5000,NULL,1,NULL,'',157.5000,0.0000,'',NULL,NULL,NULL,1);

/*Table structure for table `tec_printers` */

DROP TABLE IF EXISTS `tec_printers`;

CREATE TABLE `tec_printers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tec_printers` */

insert  into `tec_printers`(`id`,`title`,`type`,`profile`,`char_per_line`,`path`,`ip_address`,`port`) values 
(2,'MainPrinter','windows','default',48,'smb://host.docker.internal/POS-80C','',NULL);

/*Table structure for table `tec_product_store_qty` */

DROP TABLE IF EXISTS `tec_product_store_qty`;

CREATE TABLE `tec_product_store_qty` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `store_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tec_product_store_qty` */

insert  into `tec_product_store_qty`(`id`,`product_id`,`store_id`,`quantity`,`price`) values 
(1,1,1,72.0000,50.0000);

/*Table structure for table `tec_products` */

DROP TABLE IF EXISTS `tec_products`;

CREATE TABLE `tec_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `price` decimal(25,4) NOT NULL,
  `ws_price` decimal(25,4) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

/*Data for the table `tec_products` */

insert  into `tec_products`(`id`,`code`,`name`,`category_id`,`price`,`ws_price`,`image`,`tax`,`cost`,`tax_method`,`quantity`,`barcode_symbology`,`type`,`details`,`alert_quantity`) values 
(1,'2354364326565','4 Cousins Sweet Red  (1.5ltr)',1,1500.0000,1400.0000,'no_image.png',NULL,1350.0000,1,6.0000,'code39','standard',NULL,0.0000),
(2,'2354364326566','4 Cousins Sweet Red  (750mls)',1,800.0000,700.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(3,'2354364326567','4 Cousins Sweet White  (1.5mls)',1,1500.0000,1400.0000,'no_image.png',NULL,1350.0000,1,6.0000,'code39','standard',NULL,0.0000),
(4,'2354364326568','4 Cousins Sweet White   (750mls)',1,800.0000,700.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(5,'2354364326570','4th Street Rose  (1.5ltrs)',1,1500.0000,1400.0000,'no_image.png',NULL,1350.0000,1,0.0000,'code39','standard',NULL,0.0000),
(6,'2354364326571','4th Street Rose  (750mls)',1,800.0000,730.0000,'no_image.png',NULL,680.0000,1,6.0000,'code39','standard',NULL,0.0000),
(7,'2354364326572','4th Street Sweet Red  (5lts)',1,3200.0000,3170.0000,'no_image.png',NULL,2700.0000,1,4.0000,'code39','standard',NULL,0.0000),
(8,'2354364326573','4th Street Sweet Red  (1.5ltrs)',1,1500.0000,1400.0000,'no_image.png',NULL,1350.0000,1,6.0000,'code39','standard',NULL,0.0000),
(9,'2354364326574','4th Street Sweet Red  (750mls)',1,800.0000,700.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(10,'2354364326575','4th Street Sweet White  (5lts)',1,3200.0000,3170.0000,'no_image.png',NULL,2700.0000,1,4.0000,'code39','standard',NULL,0.0000),
(11,'2354364326576','4th Street Sweet White  (1.5ltrs)',1,1500.0000,1400.0000,'no_image.png',NULL,1350.0000,1,0.0000,'code39','standard',NULL,0.0000),
(12,'2354364326577','4th Street Sweet White  (750mls)',1,800.0000,700.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(13,'2354364326578','All Seasons  (250mls)',2,300.0000,280.0000,'no_image.png',NULL,260.0000,1,0.0000,'code39','standard',NULL,0.0000),
(14,'2354364326579','All Seasons  (375mls)',2,400.0000,380.0000,'no_image.png',NULL,350.0000,1,0.0000,'code39','standard',NULL,0.0000),
(15,'2354364326580','All Seasons  (750mls)',2,800.0000,780.0000,'no_image.png',NULL,750.0000,1,12.0000,'code39','standard',NULL,0.0000),
(16,'2354364326581','Amarula Cream  (1000mls)',2,2200.0000,2100.0000,'no_image.png',NULL,1950.0000,1,6.0000,'code39','standard',NULL,0.0000),
(17,'2354364326582','Amarula Cream  (750mls)',2,1900.0000,1720.0000,'no_image.png',NULL,1500.0000,1,6.0000,'code39','standard',NULL,0.0000),
(18,'2354364326583','Amarula Cream  (375mls)',2,1050.0000,1030.0000,'no_image.png',NULL,950.0000,1,12.0000,'code39','standard',NULL,0.0000),
(19,'2354364326586','Baileys ORIGINAL  (750mls)',2,1900.0000,1792.0000,'no_image.png',NULL,1720.0000,1,12.0000,'code39','standard',NULL,0.0000),
(20,'2354364326587','Baileys ORIGINAL  (375mls)',2,1050.0000,NULL,'no_image.png',NULL,880.0000,1,12.0000,'code39','standard',NULL,0.0000),
(21,'2354364326588','Beach House Chardonnay White (750mls)',1,1200.0000,1170.0000,'no_image.png',NULL,1100.0000,1,6.0000,'code39','standard',NULL,0.0000),
(22,'2354364326589','Beach House Rose Rose (750mls)',1,1200.0000,1170.0000,'no_image.png',NULL,1100.0000,1,6.0000,'code39','standard',NULL,0.0000),
(23,'2354364326590','Beach House Sauvignon Blanc White (750mls)',1,1200.0000,1170.0000,'no_image.png',NULL,1100.0000,1,6.0000,'code39','standard',NULL,0.0000),
(24,'2354364326591','Beach House Shiraz Red (750mls)',1,1200.0000,1170.0000,'no_image.png',NULL,1100.0000,1,6.0000,'code39','standard',NULL,0.0000),
(25,'2354364326592','Black & White  (375mls)',2,490.0000,NULL,'no_image.png',NULL,440.0000,1,24.0000,'code39','standard',NULL,0.0000),
(26,'2354364326593','Black & White  (750mls)',2,920.0000,NULL,'no_image.png',NULL,840.0000,1,18.0000,'code39','standard',NULL,0.0000),
(27,'2354364326594','Black & White  (1ltr)',2,1250.0000,NULL,'no_image.png',NULL,1120.0000,1,12.0000,'code39','standard',NULL,0.0000),
(28,'2354364326595','Blue Moon  (250mls)',2,180.0000,200.0000,'no_image.png',NULL,140.0000,1,60.0000,'code39','standard',NULL,0.0000),
(29,'2354364326596','Blue Moon  (350mls)',2,300.0000,280.0000,'no_image.png',NULL,200.0000,1,15.0000,'code39','standard',NULL,0.0000),
(30,'2354364326597','Blue Moon  (750mls)',2,500.0000,450.0000,'no_image.png',NULL,400.0000,1,4.0000,'code39','standard',NULL,0.0000),
(31,'2354364326598','Blue Moon Apple  (750mls)',2,500.0000,450.0000,'no_image.png',NULL,400.0000,1,1.0000,'code39','standard',NULL,0.0000),
(32,'2354364326599','Blue Moon Mango  (750mls)',2,500.0000,450.0000,'no_image.png',NULL,400.0000,1,1.0000,'code39','standard',NULL,0.0000),
(33,'2354364326600','Bombay Sapphire  � �  (750mls)',2,2130.0000,1970.0000,'no_image.png',NULL,1700.0000,1,6.0000,'code39','standard',NULL,0.0000),
(34,'2354364326601','Bond 7 Whisky  (250mls)',2,400.0000,NULL,'no_image.png',NULL,336.0000,1,40.0000,'code39','standard',NULL,0.0000),
(35,'2354364326602','Bond 7 Whisky  (350mls)',2,550.0000,NULL,'no_image.png',NULL,464.0000,1,24.0000,'code39','standard',NULL,0.0000),
(36,'2354364326603','Camino Clear  � � � � � � �   (750mls)',2,1750.0000,1650.0000,'no_image.png',NULL,1450.0000,1,6.0000,'code39','standard',NULL,0.0000),
(37,'2354364326604','Caprice Dry Red  (1ltr)',1,600.0000,580.0000,'no_image.png',NULL,530.0000,1,34.0000,'code39','standard',NULL,0.0000),
(38,'2354364326605','Caprice Dry White  (1ltr)',1,600.0000,580.0000,'no_image.png',NULL,530.0000,1,6.0000,'code39','standard',NULL,0.0000),
(39,'2354364326606','Caprice Sweet Red  (1ltr)',1,600.0000,580.0000,'no_image.png',NULL,530.0000,1,8.0000,'code39','standard',NULL,0.0000),
(40,'2354364326607','Captain Morgan Gold  (250mls)',2,280.0000,NULL,'no_image.png',NULL,248.0000,1,40.0000,'code39','standard',NULL,0.0000),
(41,'2354364326608','Captain Morgan Gold  (750mls)',2,800.0000,NULL,'no_image.png',NULL,696.0000,1,12.0000,'code39','standard',NULL,0.0000),
(42,'2354364326609','Cellar Cask Sweet Red  (750mls)',1,800.0000,760.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(43,'2354364326610','Cellar Cask Sweet White  (5Ltr)',1,3500.0000,3270.0000,'no_image.png',NULL,2900.0000,1,4.0000,'code39','standard',NULL,0.0000),
(44,'2354364326611','Cellar Cask Sweet White  (750mls)',1,800.0000,760.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(45,'2354364326612','Cellar Cask Sweet Red  (5ltr)',1,3500.0000,3270.0000,'no_image.png',NULL,2900.0000,1,4.0000,'code39','standard',NULL,0.0000),
(46,'2354364326613','Chrome Vodka  (250mls)',2,190.0000,NULL,'no_image.png',NULL,176.0000,1,42.0000,'code39','standard',NULL,0.0000),
(47,'2354364326614','Chrome Vodka  (750mls)',2,520.0000,NULL,'no_image.png',NULL,480.0000,1,24.0000,'code39','standard',NULL,0.0000),
(48,'2354364326615','Chrome Vodka Lemon  (250mls)',2,190.0000,NULL,'no_image.png',NULL,176.0000,1,40.0000,'code39','standard',NULL,0.0000),
(49,'2354364326616','Delmonte  (1ltr)',3,230.0000,215.0000,'no_image.png',NULL,190.0000,1,144.0000,'code39','standard',NULL,0.0000),
(50,'2354364326617','Drosty Hof Claret  (5ltr)',1,3500.0000,3270.0000,'no_image.png',NULL,2900.0000,1,4.0000,'code39','standard',NULL,0.0000),
(51,'2354364326618','Drosty Hof Claret  (750mls)',1,800.0000,700.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(52,'2354364326619','Drosty Hof Grand Cru  (5ltr)',1,3500.0000,3270.0000,'no_image.png',NULL,2900.0000,1,4.0000,'code39','standard',NULL,0.0000),
(53,'2354364326620','Drosty Hof Grand Cru  (750mls)',1,800.0000,700.0000,'no_image.png',NULL,650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(54,'2354364326621','Famous Grouse  (750mls)',2,1750.0000,1500.0000,'no_image.png',NULL,1350.0000,1,6.0000,'code39','standard',NULL,0.0000),
(55,'2354364326622','Famous Grouse  (375mls)',2,1150.0000,1050.0000,'no_image.png',NULL,900.0000,1,4.0000,'code39','standard',NULL,0.0000),
(56,'2354364326624','Frontera Cabernet Sauvignon Red (750mls)',1,800.0000,780.0000,'no_image.png',NULL,730.0000,1,6.0000,'code39','standard',NULL,0.0000),
(57,'2354364326625','Frontera Cabernet Sauvignon Red (1.5ltrs)',1,1400.0000,1370.0000,'no_image.png',NULL,1250.0000,1,6.0000,'code39','standard',NULL,0.0000),
(58,'2354364326626','Frontera Chardonnay White (750mls)',1,800.0000,780.0000,'no_image.png',NULL,730.0000,1,6.0000,'code39','standard',NULL,0.0000),
(59,'2354364326627','Frontera Merlot Red (750mls)',1,800.0000,780.0000,'no_image.png',NULL,730.0000,1,6.0000,'code39','standard',NULL,0.0000),
(60,'2354364326628','Frontera Sauvignon Blanc White (750mls)',1,800.0000,780.0000,'no_image.png',NULL,730.0000,1,6.0000,'code39','standard',NULL,0.0000),
(61,'2354364326629','Frontera Sauvignon Blanc White (1.5ltrs)',1,1400.0000,1370.0000,'no_image.png',NULL,1250.0000,1,6.0000,'code39','standard',NULL,0.0000),
(62,'2354364326630','Gato Negro Cab Sauv Merlot Red (750mls)',1,850.0000,812.0000,'no_image.png',NULL,790.0000,1,6.0000,'code39','standard',NULL,0.0000),
(63,'2354364326631','Gato Negro Cabernet Sauvignon Red (750mls)',1,850.0000,812.0000,'no_image.png',NULL,790.0000,1,6.0000,'code39','standard',NULL,0.0000),
(64,'2354364326632','Gato Negro Cabernet Sauvignon Red (1.5ltrs)',1,1500.0000,1400.0000,'no_image.png',NULL,1360.0000,1,6.0000,'code39','standard',NULL,0.0000),
(65,'2354364326633','Gato Negro Chardonnay White (750mls)',1,850.0000,812.0000,'no_image.png',NULL,790.0000,1,6.0000,'code39','standard',NULL,0.0000),
(66,'2354364326634','Gato Negro Merlot Red (750mls)',1,850.0000,812.0000,'no_image.png',NULL,790.0000,1,6.0000,'code39','standard',NULL,0.0000),
(67,'2354364326635','Gato Negro Merlot Red (1.5ltrs)',1,1500.0000,1400.0000,'no_image.png',NULL,1360.0000,1,6.0000,'code39','standard',NULL,0.0000),
(68,'2354364326636','Gato Negro Sauvignon Blanc White (750mls)',1,850.0000,812.0000,'no_image.png',NULL,790.0000,1,6.0000,'code39','standard',NULL,0.0000),
(69,'2354364326637','Gato Negro Sauvignon Blanc Red (1.5ltrs)',1,1500.0000,1400.0000,'no_image.png',NULL,1360.0000,1,6.0000,'code39','standard',NULL,0.0000),
(70,'2354364326638','Gato Negro Semi Sweet Red Red (750mls)',1,850.0000,812.0000,'no_image.png',NULL,770.0000,1,6.0000,'code39','standard',NULL,0.0000),
(71,'2354364326639','Gato Negro Semi Sweet White White (750mls)',1,850.0000,812.0000,'no_image.png',NULL,770.0000,1,6.0000,'code39','standard',NULL,0.0000),
(72,'2354364326640','Gilbeys Gin  (250mls)',2,400.0000,NULL,'no_image.png',NULL,336.0000,1,0.0000,'code39','standard',NULL,0.0000),
(73,'2354364326641','Gilbeys Gin  (375mls)',2,550.0000,NULL,'no_image.png',NULL,464.0000,1,0.0000,'code39','standard',NULL,0.0000),
(74,'2354364326642','Gilbeys Gin  (750mls)',2,1200.0000,NULL,'no_image.png',NULL,960.0000,1,12.0000,'code39','standard',NULL,0.0000),
(75,'2354364326643','Glenfiddich 12 years �   (750mls)',2,3470.0000,3370.0000,'no_image.png',NULL,3200.0000,1,6.0000,'code39','standard',NULL,0.0000),
(76,'2354364326645','Grants  (750mls)',2,1300.0000,1200.0000,'no_image.png',NULL,1150.0000,1,12.0000,'code39','standard',NULL,0.0000),
(77,'2354364326646','Grants  (375mls)',2,900.0000,800.0000,'no_image.png',NULL,650.0000,1,6.0000,'code39','standard',NULL,0.0000),
(78,'2354364326648','Hennessy VS  (700mls)',2,3500.0000,3167.0000,'no_image.png',NULL,3000.0000,1,6.0000,'code39','standard',NULL,0.0000),
(79,'2354364326649','J&B Rare  (375mls)',2,925.0000,NULL,'no_image.png',NULL,840.0000,1,24.0000,'code39','standard',NULL,0.0000),
(80,'2354364326650','J&B Rare  (750mls)',2,1650.0000,NULL,'no_image.png',NULL,1520.0000,1,6.0000,'code39','standard',NULL,0.0000),
(81,'2354364326651','Jack Daniels  (1000ml)',2,3200.0000,3050.0000,'no_image.png',NULL,2800.0000,1,12.0000,'code39','standard',NULL,0.0000),
(82,'2354364326652','Jack Daniels  (700mls)',2,2450.0000,2350.0000,'no_image.png',NULL,2200.0000,1,12.0000,'code39','standard',NULL,0.0000),
(83,'2354364326653','Jagermeister  (700mls)',2,2150.0000,2000.0000,'no_image.png',NULL,1650.0000,1,6.0000,'code39','standard',NULL,0.0000),
(84,'2354364326654','Jagermeister  (1000ml)',2,2800.0000,2450.0000,'no_image.png',NULL,1900.0000,1,6.0000,'code39','standard',NULL,0.0000),
(85,'2354364326655','Jameson � � � � �   (375mls)',2,1150.0000,1050.0000,'no_image.png',NULL,950.0000,1,12.0000,'code39','standard',NULL,0.0000),
(86,'2354364326656','Jameson � � � � � � �   (750mls)',2,1900.0000,1750.0000,'no_image.png',NULL,1650.0000,1,12.0000,'code39','standard',NULL,0.0000),
(87,'2354364326657','Jameson � � � � � � � � �   (1000mls)',2,2200.0000,2050.0000,'no_image.png',NULL,1900.0000,1,6.0000,'code39','standard',NULL,0.0000),
(88,'2354364326658','Johnnie Walker Black Label  (750mls)',2,3200.0000,2600.0000,'no_image.png',NULL,2330.0000,1,12.0000,'code39','standard',NULL,0.0000),
(89,'2354364326659','Johnnie Walker Black Label  (375mls)',2,1400.0000,NULL,'no_image.png',NULL,1200.0000,1,24.0000,'code39','standard',NULL,0.0000),
(90,'2354364326661','Johnnie Walker Green  (750mls)',2,5500.0000,NULL,'no_image.png',NULL,4800.0000,1,1.0000,'code39','standard',NULL,0.0000),
(91,'2354364326662','Johnnie Walker Red Label  (750mls)',2,1600.0000,1300.0000,'no_image.png',NULL,1250.0000,1,12.0000,'code39','standard',NULL,0.0000),
(92,'2354364326663','Johnnie Walker Red Label  (375mls)',2,880.0000,NULL,'no_image.png',NULL,760.0000,1,24.0000,'code39','standard',NULL,0.0000),
(93,'2354364326664','Kane Extra Golden  (250mls)',2,170.0000,NULL,'no_image.png',NULL,160.0000,1,42.0000,'code39','standard',NULL,0.0000),
(94,'2354364326665','Kane Extra Golden  (750mls)',2,490.0000,NULL,'no_image.png',NULL,456.0000,1,24.0000,'code39','standard',NULL,0.0000),
(95,'2354364326666','Kenya Cane  (250mls)',2,230.0000,NULL,'no_image.png',NULL,208.0000,1,44.0000,'code39','standard',NULL,0.0000),
(96,'2354364326667','Kenya Cane  (350mls)',2,320.0000,NULL,'no_image.png',NULL,280.0000,1,48.0000,'code39','standard',NULL,0.0000),
(97,'2354364326668','Kenya Cane  (750mls)',2,620.0000,NULL,'no_image.png',NULL,560.0000,1,24.0000,'code39','standard',NULL,0.0000),
(98,'2354364326669','Kenya Cane Coconut  (250mls)',2,230.0000,NULL,'no_image.png',NULL,208.0000,1,40.0000,'code39','standard',NULL,0.0000),
(99,'2354364326670','Kenya Cane Coconut  (750mls)',2,620.0000,NULL,'no_image.png',NULL,560.0000,1,12.0000,'code39','standard',NULL,0.0000),
(100,'2354364326671','Kenya Cane Pineapple  (250mls)',2,230.0000,NULL,'no_image.png',NULL,208.0000,1,40.0000,'code39','standard',NULL,0.0000),
(101,'2354364326672','Kenya Cane Pineapple  (750mls)',2,620.0000,NULL,'no_image.png',NULL,560.0000,1,12.0000,'code39','standard',NULL,0.0000),
(102,'2354364326674','Kibao Vodka  (250mls)',2,190.0000,170.0000,'no_image.png',NULL,165.0000,1,48.0000,'code39','standard',NULL,0.0000),
(103,'2354364326675','Kibao Vodka  (350mls)',2,280.0000,270.0000,'no_image.png',NULL,245.0000,1,24.0000,'code39','standard',NULL,0.0000),
(104,'2354364326676','Kibao Vodka  (750mls)',2,500.0000,460.0000,'no_image.png',NULL,445.0000,1,24.0000,'code39','standard',NULL,0.0000),
(105,'2354364326677','Konyagi  (250mls)',2,220.0000,190.0000,'no_image.png',NULL,175.0000,1,35.0000,'code39','standard',NULL,0.0000),
(106,'2354364326678','Konyagi  (500mls)',2,450.0000,430.0000,'no_image.png',NULL,370.0000,1,32.0000,'code39','standard',NULL,0.0000),
(107,'2354364326679','Konyagi  (750mls)',2,620.0000,600.0000,'no_image.png',NULL,530.0000,1,6.0000,'code39','standard',NULL,0.0000),
(108,'2354364326680','Legend Brandy  (350mls)',2,300.0000,280.0000,'no_image.png',NULL,220.0000,1,0.0000,'code39','standard',NULL,0.0000),
(109,'2354364326681','Legend Brandy  (250mls)',2,280.0000,270.0000,'no_image.png',NULL,250.0000,1,30.0000,'code39','standard',NULL,0.0000),
(110,'2354364326682','Malibu Rum � � � � � � � � � � � �  (700mls)',2,1500.0000,1400.0000,'no_image.png',NULL,1300.0000,1,6.0000,'code39','standard',NULL,0.0000),
(111,'2354364326683','Meakins Vodka  (250mls)',2,170.0000,155.0000,'no_image.png',NULL,150.0000,1,48.0000,'code39','standard',NULL,0.0000),
(112,'2354364326684','Meakins vodka  (750mls)',2,520.0000,500.0000,'no_image.png',NULL,480.0000,1,24.0000,'code39','standard',NULL,0.0000),
(113,'2354364326685','Monster Energy  (Can )',3,200.0000,180.0000,'no_image.png',NULL,150.0000,1,48.0000,'code39','standard',NULL,0.0000),
(114,'2354364326686','Namaqua Johannisberger  Red Sweet Red (5lts)',1,3560.0000,3460.0000,'no_image.png',NULL,3250.0000,1,4.0000,'code39','standard',NULL,0.0000),
(115,'2354364326687','Namaqua Johannisberger White Sweet White (5lts)',1,3560.0000,3460.0000,'no_image.png',NULL,3250.0000,1,4.0000,'code39','standard',NULL,0.0000),
(116,'2354364326688','Namaqua Natural Sweet Red Red (750mls)',1,860.0000,830.0000,'no_image.png',NULL,760.0000,1,6.0000,'code39','standard',NULL,0.0000),
(117,'2354364326689','Namaqua Sweet White White (750mls)',1,860.0000,830.0000,'no_image.png',NULL,760.0000,1,6.0000,'code39','standard',NULL,0.0000),
(118,'2354364326690','Nederberg Carbanet Sauvignon  (750mls)',1,1700.0000,1500.0000,'no_image.png',NULL,1250.0000,1,6.0000,'code39','standard',NULL,0.0000),
(119,'2354364326691','Nederberg Merlot  (750mls)',1,1700.0000,1500.0000,'no_image.png',NULL,1250.0000,1,4.0000,'code39','standard',NULL,0.0000),
(120,'2354364326694','Red Bull  (Can)',3,160.0000,145.0000,'no_image.png',NULL,135.0000,1,240.0000,'code39','standard',NULL,0.0000),
(121,'2354364326695','Richot Brandy  (250mls)',2,400.0000,NULL,'no_image.png',NULL,336.0000,1,20.0000,'code39','standard',NULL,0.0000),
(122,'2354364326696','Richot Brandy  (375mls)',2,550.0000,NULL,'no_image.png',NULL,464.0000,1,24.0000,'code39','standard',NULL,0.0000),
(123,'2354364326697','Richot Brandy  (750mls)',2,1200.0000,NULL,'no_image.png',NULL,960.0000,1,12.0000,'code39','standard',NULL,0.0000),
(124,'2354364326698','Safari Cane  (250mls)',2,225.0000,195.0000,'no_image.png',NULL,175.0000,1,48.0000,'code39','standard',NULL,0.0000),
(125,'2354364326699','Safari Cane  (750mls)',2,620.0000,600.0000,'no_image.png',NULL,550.0000,1,6.0000,'code39','standard',NULL,0.0000),
(126,'2354364326700','Safari Rum  (750mls)',2,650.0000,630.0000,'no_image.png',NULL,590.0000,1,6.0000,'code39','standard',NULL,0.0000),
(127,'2354364326701','Safari Whiskey  (750mls)',2,650.0000,630.0000,'no_image.png',NULL,590.0000,1,6.0000,'code39','standard',NULL,0.0000),
(128,'2354364326702','Singleton Dufftown (12 yr)  (750mls)',2,4400.0000,4000.0000,'no_image.png',NULL,3840.0000,1,6.0000,'code39','standard',NULL,0.0000),
(129,'2354364326703','Singleton Dufftown (15 yr)  (700mls)',2,5500.0000,NULL,'no_image.png',NULL,4800.0000,1,2.0000,'code39','standard',NULL,0.0000),
(130,'2354364326704','Singleton Dufftown (18 yr)  (700mls)',2,6600.0000,NULL,'no_image.png',NULL,6240.0000,1,2.0000,'code39','standard',NULL,0.0000),
(131,'2354364326705','Smirnoff Red Vodka  (250mls)',2,400.0000,NULL,'no_image.png',NULL,336.0000,1,40.0000,'code39','standard',NULL,0.0000),
(132,'2354364326706','Smirnoff Red Vodka  (375mls)',2,550.0000,NULL,'no_image.png',NULL,456.0000,1,24.0000,'code39','standard',NULL,0.0000),
(133,'2354364326707','Smirnoff Red Vodka  (750mls)',2,1200.0000,NULL,'no_image.png',NULL,960.0000,1,12.0000,'code39','standard',NULL,0.0000),
(134,'2354364326708','Southern Comfort   (1000mls)',2,2150.0000,2000.0000,'no_image.png',NULL,1950.0000,1,6.0000,'code39','standard',NULL,0.0000),
(135,'2354364326709','Southern Comfort   (700mls)',2,1700.0000,1630.0000,'no_image.png',NULL,1500.0000,1,6.0000,'code39','standard',NULL,0.0000),
(136,'2354364326710','St Celine Red (750mls)',1,850.0000,830.0000,'no_image.png',NULL,700.0000,1,6.0000,'code39','standard',NULL,0.0000),
(137,'2354364326711','St. Anna White (750mls)',1,850.0000,830.0000,'no_image.png',NULL,700.0000,1,6.0000,'code39','standard',NULL,0.0000),
(138,'2354364326712','Tall Horse Cabernet Sauvignon Red (750mls)',1,1000.0000,970.0000,'no_image.png',NULL,850.0000,1,6.0000,'code39','standard',NULL,0.0000),
(139,'2354364326713','Tall Horse Chardonnay  (750mls)',1,1000.0000,970.0000,'no_image.png',NULL,850.0000,1,6.0000,'code39','standard',NULL,0.0000),
(140,'2354364326714','Tall Horse Merlot Red (750mls)',1,1000.0000,970.0000,'no_image.png',NULL,850.0000,1,6.0000,'code39','standard',NULL,0.0000),
(141,'2354364326717','Tall Horse Sauvignon-Blanc White \'White (750mls)',1,1000.0000,970.0000,'no_image.png',NULL,850.0000,1,6.0000,'code39','standard',NULL,0.0000),
(142,'2354364326719','Triple Ace  (250mls)',2,160.0000,NULL,'no_image.png',NULL,144.0000,1,42.0000,'code39','standard',NULL,0.0000),
(143,'2354364326720','Triple Ace  (750mls)',2,460.0000,NULL,'no_image.png',NULL,416.0000,1,12.0000,'code39','standard',NULL,0.0000),
(144,'2354364326721','VAT 69  (375mls)',2,850.0000,NULL,'no_image.png',NULL,656.0000,1,24.0000,'code39','standard',NULL,0.0000),
(145,'2354364326722','VAT 69  (750mls)',2,1250.0000,NULL,'no_image.png',NULL,1120.0000,1,12.0000,'code39','standard',NULL,0.0000),
(146,'2354364326723','Viceroy Brandy  (250mls)',2,400.0000,350.0000,'no_image.png',NULL,326.0000,1,48.0000,'code39','standard',NULL,0.0000),
(147,'2354364326724','Viceroy Brandy  (375mls)',2,600.0000,550.0000,'no_image.png',NULL,500.0000,1,24.0000,'code39','standard',NULL,0.0000),
(148,'2354364326725','Viceroy Brandy  (750mls)',2,1200.0000,1090.0000,'no_image.png',NULL,1050.0000,1,12.0000,'code39','standard',NULL,0.0000),
(149,'2354364326726','White Pearl  (250mls)',2,160.0000,150.0000,'no_image.png',NULL,145.0000,1,48.0000,'code39','standard',NULL,0.0000),
(150,'2354364326727','White Pearl  (750mls)',2,500.0000,480.0000,'no_image.png',NULL,440.0000,1,12.0000,'code39','standard',NULL,0.0000),
(151,'2354364326728','William Lawson   (750mls)',2,1100.0000,1043.0000,'no_image.png',NULL,980.0000,1,12.0000,'code39','standard',NULL,0.0000),
(152,'2354364326729','William Lawson � � � �   (1000mls)',2,1450.0000,1343.0000,'no_image.png',NULL,1300.0000,1,6.0000,'code39','standard',NULL,0.0000),
(153,'2354364326730','Zappa Original  (750mls)',2,1500.0000,1400.0000,'no_image.png',NULL,1250.0000,1,6.0000,'code39','standard',NULL,0.0000),
(154,'2354364326731','Balozi  (500mls)',4,145.0000,NULL,'no_image.png',NULL,136.0000,1,50.0000,'code39','standard',NULL,0.0000),
(155,'2354364326732','Cider  (500mls)',4,158.0000,NULL,'no_image.png',NULL,154.0000,1,50.0000,'code39','standard',NULL,0.0000),
(156,'2354364326733','Cider Can  (500mls)',4,180.0000,NULL,'no_image.png',NULL,165.0000,1,48.0000,'code39','standard',NULL,0.0000),
(157,'2354364326734','Alvaro   (330mls)',3,75.0000,NULL,'no_image.png',NULL,70.0000,1,0.0000,'code39','standard',NULL,0.0000),
(158,'2354364326735','Alvaro can  (Can)',3,85.0000,NULL,'no_image.png',NULL,79.0000,1,0.0000,'code39','standard',NULL,0.0000),
(159,'2354364326736','Guiness Can  (Can)',4,190.0000,NULL,'no_image.png',NULL,173.0000,1,42.0000,'code39','standard',NULL,0.0000),
(160,'2354364326737','Guiness Kubwa  (500mls)',4,180.0000,NULL,'no_image.png',NULL,163.0000,1,50.0000,'code39','standard',NULL,0.0000),
(161,'2354364326738','Guiness smooth 500ml  (500mls)',4,160.0000,NULL,'no_image.png',NULL,145.0000,1,25.0000,'code39','standard',NULL,0.0000),
(162,'2354364326739','Pilsner  (500mls)',4,160.0000,NULL,'no_image.png',NULL,145.0000,1,50.0000,'code39','standard',NULL,0.0000),
(163,'2354364326740','Pilsner Can  (Can)',4,160.0000,NULL,'no_image.png',NULL,140.0000,1,36.0000,'code39','standard',NULL,0.0000),
(164,'2354364326741','Smirnoff Ice (Black)  (330mls)',4,125.0000,NULL,'no_image.png',NULL,117.6000,1,0.0000,'code39','standard',NULL,0.0000),
(165,'2354364326742','Smirnoff Ice (Black)   (Can)',4,150.0000,NULL,'no_image.png',NULL,135.0000,1,0.0000,'code39','standard',NULL,0.0000),
(166,'2354364326743','Snapp Apple  (330mls)',4,125.0000,NULL,'no_image.png',NULL,117.6000,1,25.0000,'code39','standard',NULL,0.0000),
(167,'2354364326744','Snapp Can  (Can)',4,150.0000,NULL,'no_image.png',NULL,135.0000,1,48.0000,'code39','standard',NULL,0.0000),
(168,'2354364326745','Tusker Lager  (500mls)',4,160.0000,NULL,'no_image.png',NULL,145.0000,1,75.0000,'code39','standard',NULL,0.0000),
(169,'2354364326746','Tusker Lager   (Can)',4,170.0000,NULL,'no_image.png',NULL,156.0000,1,48.0000,'code39','standard',NULL,0.0000),
(170,'2354364326747','Tusker Lite 330 ml  (330mls)',4,160.0000,NULL,'no_image.png',NULL,145.0000,1,50.0000,'code39','standard',NULL,0.0000),
(171,'2354364326748','Tusker Lite  (Can)',4,180.0000,NULL,'no_image.png',NULL,165.0000,1,42.0000,'code39','standard',NULL,0.0000),
(172,'2354364326749','Tusker Malt 330 ml  (330mls)',4,160.0000,NULL,'no_image.png',NULL,145.0000,1,25.0000,'code39','standard',NULL,0.0000),
(173,'2354364326750','Tusker Malt   (Can)',4,180.0000,NULL,'no_image.png',NULL,165.0000,1,36.0000,'code39','standard',NULL,0.0000),
(174,'2354364326751','White Cap  (500mls)',4,170.0000,NULL,'no_image.png',NULL,154.0000,1,75.0000,'code39','standard',NULL,0.0000),
(175,'2354364326752','White Cap Can  (Can)',4,180.0000,NULL,'no_image.png',NULL,165.0000,1,42.0000,'code39','standard',NULL,0.0000),
(176,'2354364326753','Guarana 330mls  (Can)',4,150.0000,NULL,'no_image.png',NULL,135.0000,1,48.0000,'code39','standard',NULL,0.0000),
(177,'2354364326754','Guarana 440mls  (Can)',4,170.0000,NULL,'no_image.png',NULL,159.0000,1,24.0000,'code39','standard',NULL,0.0000);

/*Table structure for table `tec_purchase_items` */

DROP TABLE IF EXISTS `tec_purchase_items`;

CREATE TABLE `tec_purchase_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchase_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_purchase_items` */

/*Table structure for table `tec_purchases` */

DROP TABLE IF EXISTS `tec_purchases`;

CREATE TABLE `tec_purchases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int NOT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_purchases` */

/*Table structure for table `tec_registers` */

DROP TABLE IF EXISTS `tec_registers`;

CREATE TABLE `tec_registers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int DEFAULT NULL,
  `total_cc_slips` int DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int DEFAULT NULL,
  `total_cc_slips_submitted` int DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tec_registers` */

/*Table structure for table `tec_sale_items` */

DROP TABLE IF EXISTS `tec_sale_items`;

CREATE TABLE `tec_sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT '0.0000',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tec_sale_items` */

/*Table structure for table `tec_sales` */

DROP TABLE IF EXISTS `tec_sales`;

CREATE TABLE `tec_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `customer_id` int NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(10,4) DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  `hold_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `tec_sales` */

/*Table structure for table `tec_sessions` */

DROP TABLE IF EXISTS `tec_sessions`;

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_sessions` */

insert  into `tec_sessions`(`id`,`ip_address`,`timestamp`,`data`) values 
('l5tdquq1895ag4nfbu6gtdr2i147ljbj','::1',1598858240,'__ci_last_regenerate|i:1598858240;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:18:\"admin@tecdiary.com\";user_id|s:1:\"1\";first_name|s:5:\"Admin\";last_name|s:5:\"Admin\";created_on|s:24:\"Thu 25 Jun 2015 06:59 AM\";old_last_login|s:10:\"1593599022\";last_ip|s:10:\"172.25.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";store_id|N;has_store_id|N;message|s:38:\"<p>You are successfully logged in.</p>\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}'),
('nvbcvo682gpobo4a3dh5oo2o2mgasdve','::1',1598857930,'__ci_last_regenerate|i:1598857930;'),
('r8p78irlmu8qht8mne0cut3ekr44oi3p','::1',1598857591,'__ci_last_regenerate|i:1598857591;'),
('rqcqmdb95ghd7qj88fopmvnlmbklouut','::1',1598858242,'__ci_last_regenerate|i:1598858240;identity|s:5:\"admin\";username|s:5:\"admin\";email|s:18:\"admin@tecdiary.com\";user_id|s:1:\"1\";first_name|s:5:\"Admin\";last_name|s:5:\"Admin\";created_on|s:24:\"Thu 25 Jun 2015 06:59 AM\";old_last_login|s:10:\"1593599022\";last_ip|s:10:\"172.25.0.1\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";store_id|N;has_store_id|N;');

/*Table structure for table `tec_settings` */

DROP TABLE IF EXISTS `tec_settings`;

CREATE TABLE `tec_settings` (
  `setting_id` int NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int NOT NULL,
  `total_rows` int NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint NOT NULL,
  `display_kb` tinyint NOT NULL,
  `default_category` int NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT '1',
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT '2',
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_settings` */

insert  into `tec_settings`(`setting_id`,`logo`,`site_name`,`tel`,`dateformat`,`timeformat`,`default_email`,`language`,`version`,`theme`,`timezone`,`protocol`,`smtp_host`,`smtp_user`,`smtp_pass`,`smtp_port`,`smtp_crypto`,`mmode`,`captcha`,`mailpath`,`currency_prefix`,`default_customer`,`default_tax_rate`,`rows_per_page`,`total_rows`,`header`,`footer`,`bsty`,`display_kb`,`default_category`,`default_discount`,`item_addition`,`barcode_symbology`,`pro_limit`,`decimals`,`thousands_sep`,`decimals_sep`,`focus_add_item`,`add_customer`,`toggle_category_slider`,`cancel_sale`,`suspend_sale`,`print_order`,`print_bill`,`finalize_sale`,`today_sale`,`open_hold_bills`,`close_register`,`java_applet`,`receipt_printer`,`pos_printers`,`cash_drawer_codes`,`char_per_line`,`rounding`,`pin_code`,`stripe`,`stripe_secret_key`,`stripe_publishable_key`,`purchase_code`,`envato_username`,`theme_style`,`after_sale_page`,`overselling`,`multi_store`,`qty_decimals`,`symbol`,`sac`,`display_symbol`,`remote_printing`,`printer`,`order_printers`,`auto_print`,`local_printers`,`rtl`,`print_img`) values 
(1,'logo1.png','Store','0105292122','D j M Y','h:i A','kusinitavern@gmail.com','english','4.0.29','default','Asia/Kuala_Lumpur','mail','pop.gmail.com','kusinitavern@gmail.com','','25','',0,0,NULL,'KES',1,'5%',10,30,NULL,NULL,3,0,1,'0',1,NULL,10,2,',','.','ALT+F1','ALT+F2','ALT+F10','ALT+F5','ALT+F6','ALT+F11','ALT+F12','ALT+F8','Ctrl+F1','Ctrl+F2','ALT+F7',0,'','','',42,1,'2122',0,'','','59e211bc-6b9d-497f-8abe-a87efe812b97','bytebrain','green',1,1,0,2,'',0,0,0,2,'null',1,1,0,0);

/*Table structure for table `tec_stores` */

DROP TABLE IF EXISTS `tec_stores`;

CREATE TABLE `tec_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `receipt_header` text,
  `receipt_footer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tec_stores` */

/*Table structure for table `tec_suppliers` */

DROP TABLE IF EXISTS `tec_suppliers`;

CREATE TABLE `tec_suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tec_suppliers` */

/*Table structure for table `tec_suspended_items` */

DROP TABLE IF EXISTS `tec_suspended_items`;

CREATE TABLE `tec_suspended_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suspend_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_suspended_items` */

/*Table structure for table `tec_suspended_sales` */

DROP TABLE IF EXISTS `tec_suspended_sales`;

CREATE TABLE `tec_suspended_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `customer_id` int NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tec_suspended_sales` */

/*Table structure for table `tec_user_logins` */

DROP TABLE IF EXISTS `tec_user_logins`;

CREATE TABLE `tec_user_logins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tec_user_logins` */

insert  into `tec_user_logins`(`id`,`user_id`,`company_id`,`ip_address`,`login`,`time`) values 
(1,1,NULL,'172.25.0.1','admin','2020-07-01 10:23:42'),
(2,1,NULL,'::1','admin','2020-08-31 10:15:47');

/*Table structure for table `tec_users` */

DROP TABLE IF EXISTS `tec_users`;

CREATE TABLE `tec_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int unsigned NOT NULL,
  `last_login` int unsigned DEFAULT NULL,
  `active` tinyint unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int unsigned NOT NULL DEFAULT '2',
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tec_users` */

insert  into `tec_users`(`id`,`last_ip_address`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`,`company`,`phone`,`avatar`,`gender`,`group_id`,`store_id`) values 
(1,'::1','127.0.0.1','admin','95eaa3a9721437ecd30f80c71e92e66d7c4b51f9',NULL,'admin@tecdiary.com',NULL,NULL,NULL,'5b8b4d2eee53c77d30b61621a0f49b57feb8ec04',1435204774,1598858146,1,'Admin','Admin','Tecdiary','012345678',NULL,'male',1,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
