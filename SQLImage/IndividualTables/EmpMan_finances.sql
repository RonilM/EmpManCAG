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
-- Table structure for table `finances`
--

DROP TABLE IF EXISTS `finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finances` (
  `ReqID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FRID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfExpense` date NOT NULL,
  `Amount` float(8,2) NOT NULL,
  `DescriptionOfExpense` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PaymentCategory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PaymentMadeTo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BillNumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BillType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BillFilePath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ApproverEID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Approver2EID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProjectID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comments` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AdvancePaymentDate` date NOT NULL,
  `StatusID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HardCopyReceived` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ReqID`),
  KEY `finances_eid_foreign` (`EID`),
  KEY `finances_frid_foreign` (`FRID`),
  KEY `finances_statusid_foreign` (`StatusID`),
  KEY `finances_approver2eid_foreign` (`Approver2EID`),
  KEY `finances_projectid_foreign` (`ProjectID`),
  KEY `finances_approvereid_foreign` (`ApproverEID`),
  CONSTRAINT `finances_approvereid_foreign` FOREIGN KEY (`ApproverEID`) REFERENCES `employees` (`EID`) ON DELETE CASCADE,
  CONSTRAINT `finances_approver2eid_foreign` FOREIGN KEY (`Approver2EID`) REFERENCES `employees` (`EID`) ON DELETE CASCADE,
  CONSTRAINT `finances_eid_foreign` FOREIGN KEY (`EID`) REFERENCES `employees` (`EID`) ON DELETE CASCADE,
  CONSTRAINT `finances_frid_foreign` FOREIGN KEY (`FRID`) REFERENCES `finrequesttypes` (`FRID`) ON DELETE CASCADE,
  CONSTRAINT `finances_statusid_foreign` FOREIGN KEY (`StatusID`) REFERENCES `statustypes` (`StatusID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances`
--

LOCK TABLES `finances` WRITE;
/*!40000 ALTER TABLE `finances` DISABLE KEYS */;
INSERT INTO `finances` VALUES ('F54058f13a85b3','E1','1','2014-09-11',5.00,'test','Travel','test','test','Hard Copy','','E2',NULL,'P1','test','0000-00-00','S4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F540591be0dbf0','E1','1','2014-09-11',1221.00,'test','Travel','test','123','Hard Copy','','E2',NULL,'P1','test','0000-00-00','S3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F540598f44b5aa','E1','1','2014-09-11',1000.00,'test','Travel','test','222','Soft Copy','BillCopies/E1_2014-09-11_1409652980.png','E2',NULL,'P1','test','0000-00-00','S3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F5405991aaba8b','E1','1','2014-09-11',123.00,'test','Travel','test','222','Soft Copy','BillCopies/E1_2014-09-11_1409653018.png','E2',NULL,'P1','test','0000-00-00','S8',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F5405a13fd5a54','E1','1','2014-09-03',9.00,'test','Travel','test','test','Hard Copy','','E2',NULL,'P1','','0000-00-00','S2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F5405a17e5aca3','E1','1','2014-09-24',100.00,'test','Travel','te','te','Hard Copy','','E2',NULL,'P1','','0000-00-00','S8',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F5405a2f7e4407','E1','2','0000-00-00',32000.00,'test','Travel','test','NA','NA','','E2',NULL,'P1','test','2014-09-17','S7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F540f07d9669bd','E1','2','0000-00-00',42000.00,'Salary','Other','Nobody','NA','NA','','E2',NULL,'P1','','2014-10-07','S8',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F54100A5AE09E7','E1','1','2014-09-24',2000.00,'Travel','Travel','Red Bus','12213453','Soft Copy','BillCopies/E1_2014-09-24_1410337370.jpg','E2',NULL,'P1','','0000-00-00','S8',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F541014F5E6BEB','E1','2','0000-00-00',100.00,'Leni hai gaddi','Travel','Tata','NA','NA','','E2',NULL,'P1','','2014-09-25','S8',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F54104EE61D614','E1','1','2011-01-01',100.00,'self','Food','xyz','12345','Hard Copy','','E2',NULL,'P1','asdf','0000-00-00','S7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F54129A09DD545','E3','2','0000-00-00',1200.00,'','Other','Ronil','NA','NA','','E1',NULL,'P1','','2014-09-26','S5',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F5412CFB0C61F6','E2','2','0000-00-00',10200.00,'sassy','Other','sassy','NA','NA','','E1',NULL,'P1','','2014-09-25','S1',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('F542146BD1E1A9','CAG59','1','2014-02-04',8000.00,'poker','Other','Rishabh','xyz','Hard Copy','','CAG159',NULL,'P1','xyz','0000-00-00','S3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `finances` ENABLE KEYS */;
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
