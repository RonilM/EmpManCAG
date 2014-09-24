CREATE DATABASE  IF NOT EXISTS `empman` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `EmpMan`;
-- MySQL dump 10.13  Distrib 5.6.11, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: EmpMan
-- ------------------------------------------------------
-- Server version	5.5.33

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
-- Table structure for table `statustypes`
--

DROP TABLE IF EXISTS `statustypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statustypes` (
  `StatusID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `StatusName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`StatusID`),
  UNIQUE KEY `statustypes_statusname_unique` (`StatusName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statustypes`
--

LOCK TABLES `statustypes` WRITE;
/*!40000 ALTER TABLE `statustypes` DISABLE KEYS */;
INSERT INTO `statustypes` VALUES ('S1','Submitted','0000-00-00 00:00:00','0000-00-00 00:00:00'),('S2','Bill Rejected by Manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),('S3','Bill Amount Revised and Forwarded By manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),('S4','Bill Approved By Manager','0000-00-00 00:00:00','0000-00-00 00:00:00'),('S5','Bill Rejected by Finance Department','0000-00-00 00:00:00','0000-00-00 00:00:00'),('S6','Bill Amount Revised and Approved By Finance Department','0000-00-00 00:00:00','0000-00-00 00:00:00'),('S7','Bill Approved by Finance Department','0000-00-00 00:00:00','0000-00-00 00:00:00'),('S8','Bill Processed','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `statustypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-23 16:17:04
