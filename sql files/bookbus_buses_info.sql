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
-- Table structure for table `buses_info`
--

DROP TABLE IF EXISTS `buses_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buses_info` (
  `bus_id` int(10) NOT NULL DEFAULT '0',
  `bus_name` varchar(40) DEFAULT NULL,
  `bus_source` varchar(40) DEFAULT NULL,
  `bus_destination` varchar(40) DEFAULT NULL,
  `bus_date` date DEFAULT NULL,
  `bus_day` varchar(10) DEFAULT NULL,
  `bus_time` time DEFAULT NULL,
  `avl_seats` int(10) DEFAULT NULL,
  `bus_route` varchar(100) DEFAULT NULL,
  `Ac_Non` varchar(5) DEFAULT NULL,
  `sleeper_non` varchar(10) DEFAULT NULL,
  `luxury_non` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses_info`
--

LOCK TABLES `buses_info` WRITE;
/*!40000 ALTER TABLE `buses_info` DISABLE KEYS */;
INSERT INTO `buses_info` VALUES (1234,'Glide','Pune','Sangli','2022-11-04','Tuesday','12:30:00',10,'none','Ac','non','non'),(2018,'ABCtravels','Pune','Mumbai','2022-11-01','Saturday','05:00:00',30,'none','Ac','non','non'),(2181,'Glide','Pune','Mumbai','2022-11-02','Sunday','07:30:00',10,'none','Ac','sleeper','luxury'),(2441,'ABCtravels','Mumbai','Nashik','2022-10-20','Thursday','05:30:00',17,'none','Ac','non','luxury'),(3662,'BlueLink','Pune','Mumbai','2022-11-01','Saturday','16:00:00',30,'none','Ac','sleeper','luxury'),(3690,'Dolphin','Sangli','Mumbai','2022-10-20','Thursday','06:59:59',15,'none','Non','non','luxury'),(3732,'Caprrion','Mumbai','Pune','2022-10-30','Friday','07:00:00',27,'none','Non','non','non'),(3760,'Vishwa','Sangli','Nashik','2022-10-21','Friday','05:30:00',35,'none','Non','sleeper','luxury'),(4200,'Hercules','Sangli','Mumbai','2022-01-02','Tuesday','06:59:59',32,'none','Ac','non','non'),(5263,'BlueLink','Pune','Nashik','2022-10-20','Thursday','08:00:00',8,'none','Ac','sleeper','luxury'),(5612,'Glide','Nashik','Pune','2022-11-02','Wednesday','12:15:00',11,'none','Non','non','non'),(7490,'Karma','Sangli','Pune','2022-07-24','Thursday','06:59:59',24,'none','Non','non','non'),(7833,'Caprrion','Nashik','Mumbai','2022-10-22','Saturday','11:30:00',21,'none','Ac','sleeper','luxury');
/*!40000 ALTER TABLE `buses_info` ENABLE KEYS */;
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
