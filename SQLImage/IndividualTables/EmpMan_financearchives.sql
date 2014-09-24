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
-- Table structure for table `financearchives`
--

DROP TABLE IF EXISTS `financearchives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financearchives` (
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
  `Approver2EID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProjectID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Comments` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AdvancePaymentDate` date NOT NULL,
  `StatusID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HardCopyReceived` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ReqID`),
  KEY `financearchives_eid_foreign` (`EID`),
  KEY `financearchives_frid_foreign` (`FRID`),
  KEY `financearchives_approvereid_foreign` (`ApproverEID`),
  KEY `financearchives_approver2eid_foreign` (`Approver2EID`),
  KEY `financearchives_projectid_foreign` (`ProjectID`),
  KEY `financearchives_statusid_foreign` (`StatusID`),
  CONSTRAINT `financearchives_approver2eid_foreign` FOREIGN KEY (`Approver2EID`) REFERENCES `employees` (`EID`) ON DELETE CASCADE,
  CONSTRAINT `financearchives_approvereid_foreign` FOREIGN KEY (`ApproverEID`) REFERENCES `employees` (`EID`) ON DELETE CASCADE,
  CONSTRAINT `financearchives_eid_foreign` FOREIGN KEY (`EID`) REFERENCES `employees` (`EID`) ON DELETE CASCADE,
  CONSTRAINT `financearchives_frid_foreign` FOREIGN KEY (`FRID`) REFERENCES `finrequesttypes` (`FRID`) ON DELETE CASCADE,
  CONSTRAINT `financearchives_projectid_foreign` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`) ON DELETE CASCADE,
  CONSTRAINT `financearchives_statusid_foreign` FOREIGN KEY (`StatusID`) REFERENCES `statustypes` (`StatusID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financearchives`
--

LOCK TABLES `financearchives` WRITE;
/*!40000 ALTER TABLE `financearchives` DISABLE KEYS */;
/*!40000 ALTER TABLE `financearchives` ENABLE KEYS */;
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
