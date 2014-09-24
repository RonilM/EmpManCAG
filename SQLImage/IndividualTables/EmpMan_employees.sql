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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-23 16:17:04
