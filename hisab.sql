-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.40


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema hisab
--

CREATE DATABASE IF NOT EXISTS hisab;
USE hisab;

--
-- Definition of table `hisab`
--

DROP TABLE IF EXISTS `hisab`;
CREATE TABLE `hisab` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amt` double DEFAULT NULL,
  `total_amt` double DEFAULT NULL,
  `paid_out` double DEFAULT NULL,
  `dew` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `descc` varchar(255) DEFAULT NULL,
  `total_amt_desc` varchar(255) DEFAULT NULL,
  `desc_desc` varchar(255) DEFAULT NULL,
  `ref_id` bigint(20) DEFAULT NULL,
  `status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hisab`
--

/*!40000 ALTER TABLE `hisab` DISABLE KEYS */;
INSERT INTO `hisab` (`id`,`name`,`amt`,`total_amt`,`paid_out`,`dew`,`date`,`descc`,`total_amt_desc`,`desc_desc`,`ref_id`,`status`) VALUES 
 (1,'aman',50,100,80,-30,'2024-01-11 00:00:00','rice,alu,potato,etc..','100','aman ->0 Dipankar ->0 -- 23',1,0),
 (2,'dipankar',50,100,20,30,'2024-01-11 00:00:00','rice,alu,potato,etc..','100','aman ->0 Dipankar ->0 -- 23',2,0),
 (3,'aman',50,100,50,0,'2024-01-11 00:00:00','rice,alu,potato,etc..','100','aman ->0 Dipankar ->0 -- 24',1,0),
 (4,'dipankar',50,100,50,0,'2024-01-11 00:00:00','rice,alu,potato,etc..','100','aman ->0 Dipankar ->0 -- 24',2,0),
 (5,'aman',73.5,180,180,-98.5,'2024-01-08 00:00:00','rice,alu,potato,etc..','180','aman ->8 Dipankar ->25 -- 25',1,0),
 (6,'dipankar',73.5,180,0,98.5,'2024-01-08 00:00:00','rice,alu,potato,etc..','180','aman ->8 Dipankar ->25 -- 25',2,0),
 (7,'aman',90,180,90,0,'2024-01-09 00:00:00','rice,alu,potato,etc..','180','aman ->0 Dipankar ->0 -- 26',1,0),
 (8,'dipankar',90,180,90,0,'2024-01-09 00:00:00','rice,alu,potato,etc..','180','aman ->0 Dipankar ->0 -- 26',2,0),
 (9,'aman',88,180,90,0,'2024-01-10 00:00:00','rice,alu,potato,etc..','180','aman ->2 Dipankar ->2 -- 27',1,0),
 (10,'dipankar',88,180,90,0,'2024-01-10 00:00:00','rice,alu,potato,etc..','180','aman ->2 Dipankar ->2 -- 27',2,0),
 (11,'aman',73.5,180,180,-98.5,'2024-01-02 00:00:00','double','180','aman ->8 Dipankar ->25 -- 28',1,0),
 (12,'dipankar',73.5,180,0,98.5,'2024-01-02 00:00:00','double','180','aman ->8 Dipankar ->25 -- 28',2,0),
 (13,'aman',60,120,50,10,'2024-01-10 00:00:00','double','120','aman ->0 Dipankar ->0 -- 29',1,0),
 (14,'dipankar',60,120,70,-10,'2024-01-10 00:00:00','double','120','aman ->0 Dipankar ->0 -- 29',2,0),
 (15,'aman',50,100,20,30,'2024-01-12 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 30',1,0),
 (16,'dipankar',50,100,80,-30,'2024-01-12 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 30',2,0),
 (17,'aman',50,100,1,49,'2024-01-20 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 31',1,0),
 (18,'dipankar',50,100,99,-49,'2024-01-20 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 31',2,0),
 (19,'aman',91,200,180,-81,'2024-01-10 00:00:00','rice,alu,potato,etc..','200','aman ->8 Dipankar ->10 -- 32',1,0),
 (20,'dipankar',91,200,20,81,'2024-01-10 00:00:00','rice,alu,potato,etc..','200','aman ->8 Dipankar ->10 -- 32',2,0),
 (21,'aman',81,180,180,-91,'2024-01-11 00:00:00','df','180','aman ->8 Dipankar ->10 -- 33',1,0),
 (22,'dipankar',81,180,50,41,'2024-01-11 00:00:00','df','180','aman ->8 Dipankar ->10 -- 33',2,0),
 (23,'aman',50,100,30,20,'2024-01-11 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 34',1,0),
 (24,'dipankar',50,100,70,-20,'2024-01-11 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 34',2,0),
 (25,'aman',50,100,50,0,'2024-01-11 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 35',1,0),
 (26,'dipankar',50,100,50,0,'2024-01-11 00:00:00','bb','100','aman ->0 Dipankar ->0 -- 35',2,0);
/*!40000 ALTER TABLE `hisab` ENABLE KEYS */;


--
-- Definition of table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`,`name`) VALUES 
 (1,'aman'),
 (2,'dipankar');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


--
-- Definition of table `random`
--

DROP TABLE IF EXISTS `random`;
CREATE TABLE `random` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `random` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `random`
--

/*!40000 ALTER TABLE `random` DISABLE KEYS */;
INSERT INTO `random` (`id`,`random`) VALUES 
 (1,12),
 (2,12),
 (3,12),
 (4,12),
 (5,12),
 (6,12),
 (7,12),
 (8,12),
 (9,12),
 (10,12),
 (11,12),
 (12,12),
 (13,12),
 (14,12),
 (15,12),
 (16,12),
 (17,12),
 (18,12),
 (19,12),
 (20,12),
 (21,12),
 (22,12),
 (23,12),
 (24,12),
 (25,12),
 (26,12),
 (27,12),
 (28,12),
 (29,12),
 (30,12),
 (31,12),
 (32,12),
 (33,12),
 (34,12),
 (35,12);
/*!40000 ALTER TABLE `random` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
