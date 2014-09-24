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
-- Table structure for table `CreateProjecttoleadmapping`
--

DROP TABLE IF EXISTS `CreateProjecttoleadmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CreateProjecttoleadmapping` (
  `ProjectID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProjectLeadEID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  KEY `createprojecttoleadmapping_projectid_foreign` (`ProjectID`),
  KEY `createprojecttoleadmapping_projectleadeid_foreign` (`ProjectLeadEID`),
  CONSTRAINT `createprojecttoleadmapping_projectid_foreign` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`) ON DELETE CASCADE,
  CONSTRAINT `createprojecttoleadmapping_projectleadeid_foreign` FOREIGN KEY (`ProjectLeadEID`) REFERENCES `employees` (`EID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreateProjecttoleadmapping`
--

LOCK TABLES `CreateProjecttoleadmapping` WRITE;
/*!40000 ALTER TABLE `CreateProjecttoleadmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `CreateProjecttoleadmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `EMail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Date Of Joining` date NOT NULL,
  `ProjectID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Salary` float(8,2) NOT NULL,
  `TID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Approver1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Approver2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`EID`),
  UNIQUE KEY `employees_email_unique` (`EMail`),
  KEY `employees_tid` (`TID`),
  KEY `Project_PID` (`ProjectID`),
  KEY `ApproverEID_FK_idx` (`Approver1`),
  CONSTRAINT `ApproverEID_FK` FOREIGN KEY (`Approver1`) REFERENCES `employees` (`EID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employees_tid` FOREIGN KEY (`TID`) REFERENCES `tiers` (`TID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Project_PID` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('CAG106','SUJESH KHARE','1988-10-13','sujesh.khare@indiancag.org','','2001-02-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG11','PIYUSH JALAN','1988-08-24','piyush.jalan@indiancag.org','','2005-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG116','RITESH KUMAR SINGH','1980-04-01','ritesh.singh@indiancag.org','','2001-02-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG12','SHUBHRASTHA','1988-11-29','shubhrastha@indiancag.org','','2005-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG13','PAWAN KAIPA','1989-06-19','pawan.kaipa@indiancag.org','','2009-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG135','SHASHWAT YADAV','1990-07-21','shashwat.yadav@indiancag.org','','2003-02-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG137','BRAHMANANDA PATRA','1988-06-15','b.patra@indiancag.org','','2004-02-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG138','MRINAL CHARAN','1981-07-06','mrinal.charan@indiancag.org','','2005-02-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG139','KANAKESHWAR KANAKRAJ DEVANGAN','1986-05-12','kanakeshwar@indiancag.org','','2006-02-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG146','SIDDHARTH MAHESHWARI','1989-03-25','siddharth.maheshwari@indiancag.org','','2013-02-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG147','VISHAL RANE','1985-05-05','vishal.rane@indiancag.org','','2014-02-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG148','VIJAY KOTUR','1986-09-25','vijay.kotur@indiancag.org','','2015-02-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG15','ASHWINI ANAND','1984-10-11','ashwini.anand@indiancag.org','','2011-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG150','TARUN BHATIA','1990-02-16','tarun.bhatia@indiancag.org','','2017-02-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG158','KASHYAP JUTHANI','1983-11-24','kashyap.juthani@indiancag.org','','2027-02-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG159','RONIL MEHTA','1990-03-15','ronil.mehta@indiancag.org','','2027-02-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG162','DHARA GANUSINGHANI','1990-06-11','dhara@indiancag.org','','2001-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG166','PUSHKAR DHARAP','1983-08-23','pushkar.dharap@indiancag.org','','2001-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG17','RISHIRAJ SINGH','1989-07-11','rishi.singh@indiancag.org','','2013-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG2','ELA BODAS','1990-12-28','ela.bodas@indiancag.org','','2027-05-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG20','NANDAN JHA','1992-09-18','nandan.jha@indiancag.org','','2016-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG216','BADAL CHETAN','1987-10-27','badal.chetan@indiancag.org','','2005-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG218','MANISH SRIVASTAVA','1986-07-31','manish.srivastava@indiancag.org','','2006-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG220','AMRESH SINHA','1984-03-17','amresh.sinha@indiancag.org','','2007-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG221','ALANKRIT PODDAR','1989-09-26','alankrit.poddar@indiancag.org','','2009-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG223','VINESH CHANDEL','1986-08-25','vinesh.chandel@indiancag.org','','2010-03-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG227','AVINASH MOHAN CHETTY','1990-06-25','avinash.chetty@indiancag.org','','2010-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG23','AKSHAT MITTAL','1990-09-02','akshat.mittal@indiancag.org','','2021-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG231','KUMAR SAMEER','1985-01-27','kumar.sameer@indiancag.org','','2010-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG233','DIGGAJ MOGRA','1989-08-19','diggaj.mogra@indiancag.org','','2010-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG234','SACHIN DAS ATMA','1986-09-08','sachin.das@indiancag.org','','2010-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG238','ASAD ALI','1987-07-30','asad.ali@indiancag.org','','2011-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG24','ESHA SINGH ALAGH','1989-08-25','esha.alagh@indiancag.org','','2021-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG246','AKASH SURESH','1989-04-29','akash.suresh@indiancag.org','','2013-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG248','POOJA GOEL','1989-10-08','pooja.goel@indiancag.org','','2014-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG250','SATHYA VIBHU','1986-10-29','sathya.vibhu@indiancag.org','','2014-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG263','ZULFIKAR SHAIKH','1988-12-10','zulfikar.shaikh@indiancag.org','','2015-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG27','SIDDHARTH WALIA','1987-07-03','siddharth.walia@indiancag.org','','2023-07-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG287','NISHEETA SRIVASTAVA','1988-12-09','nisheeta.shrivastava@indiancag.org','','2018-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG3','GAURAV BHATELE','1988-03-05','gaurav.bhatele@indiancag.org','','2003-06-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG30','AKHIL HANDA','1985-12-11','akhil.handa@indiancag.org','','2001-08-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG301','SAUMYA CHAKRAVORTY','1988-12-03','saumya.chakravorty@indiancag.org','','2020-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG303','MANISH DWIVEDI','1981-09-17','manish.dwivedi@indiancag.org','','2020-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG31','ANISH BHARADWAJ','1990-06-10','anish.bharadwaj@indiancag.org','','2001-08-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG33','RAJAT GOEL','1992-09-11','rajat.goel@indiancag.org','','2001-08-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG336','SASANK TATINENI','1986-05-05','sasank.tatineni@indiancag.org','','2026-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG337','SAURABH SINGH','1991-09-15','saurabh.singh@indiancag.org','','2026-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG341','RAVINDRA GUPTA','1984-07-30','ravindra.gupta@indiancag.org','','2027-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG342','GAURAV MOONAT','1985-11-28','gaurav.moonat@indiancag.org','','2027-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG35','SATYARTHA DIXIT','1986-06-22','satyartha.dixit@indiancag.org','','2001-08-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG356','SATISH CHAND SINGH','1990-03-21','satish.chand@indiancag.org','','2028-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG368','SUMIT GOYAL','1987-01-15','sumit.goyal@indiancag.org','','2030-03-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG37','RUSHIRAJ PATEL','1989-04-22','rushiraj.patel@indiancag.org','','2006-08-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG39','HEMANT GAULE','1987-03-12','hemant.gaule@indiancag.org','','2015-08-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG4','SAIBAL DAS MAHAPATRA','1988-01-08','saibal@indiancag.org','','2003-06-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG400','PRASHANT SHARMA','1985-04-29','prashant.sharma@indiancag.org','','2007-07-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG401','SHIVANSHU MISHRA','1982-03-25','shivanshu.mishra@indiancag.org','','2001-03-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG402','MADHULIKA RAI','1989-07-18','madhulika@indiancag.org','','2001-03-14','P1',12000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG403','PRACHI JOSHI','1987-07-05','prachi.joshi@indiancag.org','','2005-12-13','P1',16000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG405','BHAVIN MISTRY','1969-08-25','bhavin.mistry@indiancag.org','','2001-03-14','P1',12000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG406','HARPREET SINGH','1983-07-07','harpreet.singh@indiancag.org','','2013-08-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG407','KHUSHBOO SHARMA','1986-09-15','khushboo.sharma@indiancag.org','','2001-09-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG408','DHIRENDRA MEENA','1984-07-13','dhirendra.meena@indiancag.org','','2008-09-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG409','HARSH AGGARWAL','1985-08-04','Harsh.aggarwal@indiancag.org','','2008-09-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG41','BHARAT MUNDHRA','1985-11-06','bharat.mundhra@indiancag.org','','2019-08-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG43','RAVI MEHTA','1989-07-13','ravi.mehta@indiancag.org','','2001-09-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG44','RAHUL GUPTA','1987-02-25','rahul.gupta@indiancag.org','','2002-09-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG45','RISHABH GUPTA','1985-12-09','rishabh.gupta@indiancag.org','','2008-09-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG46','PRATIK JAIN','1989-11-15','pratik.jain@indiancag.org','','2009-09-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG48','ANKIT GULLIYA','1990-10-06','ankit.gulliya@indiancag.org','','2024-09-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG49','HARSHIT SHARMA','1990-01-12','harshit.sharma@indiancag.org','','2007-10-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG5','ALKESH ROCHWANI','1984-09-22','alkesh.rochwani@indiancag.org','','2006-06-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG51','AMRITA DWIVEDI','1991-08-26','amrita.dwivedi@indiancag.org','','2014-11-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG52','ANANT TIWARI','1990-09-03','anant.tiwari@indiancag.org','','2016-11-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG54','AARTI PILLAI','1987-04-12','aarti.pillai@indiancag.org','','2002-12-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG55','SHASHANK MEHTA','1991-06-11','shashank.mehta@indiancag.org','','2005-12-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG56','NISHANT KHANDURI','1979-08-30','nishant.khanduri@indiancag.org','','2009-12-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG57','ROBIN SHARMA','1987-03-17','robin.sharma@indiancag.org','','2018-12-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG59','BHUVAN BATRA','1992-01-04','bhuvan.batra@indiancag.org','','2027-12-13','P1',30000.00,'T1','CAG159','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG60','MARSHAL SONAVANE','1987-08-25','marshal.sonavane@indiancag.org','','2028-12-13','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG63','APARAJITA TRIPATHI','1985-09-07','aparajita.tripathi@indiancag.org','','2006-01-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG75','MANEESH KUMAR','1975-04-21','maneeshk@indiancag.org','','2022-01-14','P1',50000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('CAG76','ABHIMANYU BHARTI','1989-08-03','abhimanyu.bharti@indiancag.org','','2023-01-14','P1',30000.00,'T1','CAG11','','2014-09-22 18:30:00','2014-09-22 18:30:00'),('E1','Test','0000-00-00','roni.almighty@gmail.com','test','0000-00-00','P1',0.00,'T3','E2','','0000-00-00 00:00:00','0000-00-00 00:00:00'),('E2','Test','0000-00-00','ronil.meht@indiancag.org','test','0000-00-00','P1',0.00,'T3','E1','','0000-00-00 00:00:00','0000-00-00 00:00:00'),('E3','Ron','0000-00-00','ronilvmehta@gmail.com','','0000-00-00','P1',0.00,'T1','E1','','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `finrequesttypes`
--

DROP TABLE IF EXISTS `finrequesttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finrequesttypes` (
  `FRID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RequestName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RequestDescription` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`FRID`),
  UNIQUE KEY `finrequesttypes_requestname_unique` (`RequestName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finrequesttypes`
--

LOCK TABLES `finrequesttypes` WRITE;
/*!40000 ALTER TABLE `finrequesttypes` DISABLE KEYS */;
INSERT INTO `finrequesttypes` VALUES ('1','Reimbursement Request',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('2','Advanced Claim Request',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('3','Pending Requests',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('4','Processed requests',0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('5','Rejected Requests',0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `finrequesttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_08_28_062002_create_tiers_table',1),('2014_08_28_062054_create_statuses_table',1),('2014_08_28_062148_create_projects_table',1),('2014_08_28_062250_create_employees_table',1),('2014_08_28_065610_create_finrequesttypes_table',1),('2014_08_28_065627_create_finances_table',1),('2014_08_28_065808_create_financearchives_table',1),('2014_09_01_120853_create_projecttoleadmapping_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `ProjectID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProjectName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES ('P1','Free Resource','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tiers`
--

DROP TABLE IF EXISTS `tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiers` (
  `TID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TierName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TierLevel` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`TID`),
  UNIQUE KEY `tiers_tierlevel_unique` (`TierLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiers`
--

LOCK TABLES `tiers` WRITE;
/*!40000 ALTER TABLE `tiers` DISABLE KEYS */;
INSERT INTO `tiers` VALUES ('T1','FTM',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('T2','PL',2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),('T3','Finance Team',3,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tiers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-23 16:17:58
