CREATE DATABASE  IF NOT EXISTS `bookbus` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookbus`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: bookbus
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_details` (
  `transaction_id` varchar(10) NOT NULL DEFAULT '',
  `base_fare` varchar(10) DEFAULT NULL,
  `reservation_fee` varchar(10) DEFAULT NULL,
  `gst` varchar(10) DEFAULT NULL,
  `other_charges` varchar(10) DEFAULT NULL,
  `total_payable` varchar(10) DEFAULT NULL,
  `payment_mode` varchar(20) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES ('abc221','Rs600','Rs12','Rs15','Rs1','Rs628','Gpay',12110446),('lj901','Rs288','Rs10','Rs15','Rs1','Rs314','Gpay',12176564),('mmk001','Rs576','Rs12','Rs15','Rs1','Rs604','Gpay',12111442),('opp12','Rs250','Rs10','Rs15','Rs1','Rs276','CreditCard',12111291),('qr334','Rs250','Rs10','Rs15','Rs1','Rs276','DebitCard',12124690),('xyz120','Rs330','Rs10','Rs15','Rs1','Rs356','NetBanking',12111798),('xyz123','Rs330','Rs10','Rs15','Rs1','Rs356','Gpay',16273391);
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 23:09:37
