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
-- Table structure for table `ticket_info`
--

DROP TABLE IF EXISTS `ticket_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_info` (
  `ticket_id` varchar(20) NOT NULL DEFAULT '',
  `user_id` int(10) DEFAULT NULL,
  `bus_boarding_point` varchar(40) DEFAULT NULL,
  `bus_dropping_point` varchar(40) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `passenger_id` varchar(20) DEFAULT NULL,
  `bus_id` int(10) DEFAULT NULL,
  `transaction_id` varchar(10) DEFAULT NULL,
  `travel_duration` varchar(10) DEFAULT NULL,
  `seat_number` int(10) DEFAULT NULL,
  `seat_quantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `bus_id` (`bus_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `ticket_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_data` (`user_id`),
  CONSTRAINT `ticket_info_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `payment_details` (`transaction_id`),
  CONSTRAINT `ticket_info_ibfk_3` FOREIGN KEY (`bus_id`) REFERENCES `buses_info` (`bus_id`),
  CONSTRAINT `ticket_info_ibfk_4` FOREIGN KEY (`passenger_id`) REFERENCES `passenger_data` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_info`
--

LOCK TABLES `ticket_info` WRITE;
/*!40000 ALTER TABLE `ticket_info` DISABLE KEYS */;
INSERT INTO `ticket_info` VALUES ('tkt1',16273391,'Swargate','Maliwada','12:30:00','04:00:00','03h',1234,'xyz123','3h30m',6,1),('tkt2',12111798,'Swargate','Maliwada','12:30:00','04:00:00','ab9',1234,'xyz120','3h30m',12,1),('tkt3',12124690,'ShivajiNagar','Andheri','16:00:00','19:30:00','ty0',3662,'qr334','3h30m',19,1),('tkt4',12111291,'PaudPhata','Ghatkopar','05:00:00','08:00:00','x12',2018,'opp12','3h00m',4,1),('tkt5',12111442,'Thane','CollegeRd','05:30:00','11:00:00','fz1',2441,'mmk001','5h30m',1,2),('tkt6',12176564,'Aurangabad','NalStop','06:59:59','14:00:00','mm6',7490,'lj901','7h00m',22,1),('tkt7',12110446,'Swargate','Rankala','12:15:00','17:55:00','a01',5612,'abc221','04h25m',10,2);
/*!40000 ALTER TABLE `ticket_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 23:09:36
