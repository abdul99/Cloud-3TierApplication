CREATE DATABASE  IF NOT EXISTS `customerdatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `customerdatabase`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: customerdatabase
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Smith'),(2,'Robert','Bosch'),(3,'Abdul','Gafur'),(4,'Mohammed','Ali'),(5,'Mark','Twain'),(6,'John','Doe'),(7,'Mark2','Twain2'),(8,'John2','Doe2'),(9,'5','Twain5'),(10,'John5','Doe5'),(11,'Abduln','Gafunr'),(12,'Abdulk','Gafurk'),(13,'Abdulk1','Gafurk1'),(14,'Abdulk2','Gafurk2'),(15,'Abduln1','Gafunr1'),(16,'Abdulk81','Gafurk81'),(17,'Abdulk27','Gafurk28'),(18,'Abdulk8h1','Gafurk8h1'),(19,'Abdulk2h7','Gafurk2h8'),(20,'Abdulk8h1','Gafurk8h1');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastModification` datetime DEFAULT NULL,
  `division` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `IsLDAPEmployee` tinyint(4) NOT NULL DEFAULT '0',
  `domain` varchar(255) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeegroup`
--

DROP TABLE IF EXISTS `employeegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeegroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastModification` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentGroup_id` bigint(20) DEFAULT NULL,
  `cn` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `isemailallowed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `employeegroup_name` (`name`),
  KEY `FK_h6vhyo1xn489t5ucbhk6eyeyi` (`parentGroup_id`),
  CONSTRAINT `FK_h6vhyo1xn489t5ucbhk6eyeyi` FOREIGN KEY (`parentGroup_id`) REFERENCES `employeegroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeegroup`
--

LOCK TABLES `employeegroup` WRITE;
/*!40000 ALTER TABLE `employeegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeprofile`
--

DROP TABLE IF EXISTS `employeeprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeprofile` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeprofile`
--

LOCK TABLES `employeeprofile` WRITE;
/*!40000 ALTER TABLE `employeeprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeesettings`
--

DROP TABLE IF EXISTS `employeesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeesettings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lastModification` datetime DEFAULT NULL,
  `employee` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nhmi700t2fqsnu152c7gk3xna` (`employee`),
  CONSTRAINT `FK_nhmi700t2fqsnu152c7gk3xna` FOREIGN KEY (`employee`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesettings`
--

LOCK TABLES `employeesettings` WRITE;
/*!40000 ALTER TABLE `employeesettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeesettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeesettings_settings`
--

DROP TABLE IF EXISTS `employeesettings_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeesettings_settings` (
  `EmployeeSettings_id` bigint(20) NOT NULL,
  `settings` varchar(255) DEFAULT NULL,
  `settings_KEY` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`EmployeeSettings_id`,`settings_KEY`),
  CONSTRAINT `FK_igrihiniretne03fo62udo3u2` FOREIGN KEY (`EmployeeSettings_id`) REFERENCES `employeesettings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesettings_settings`
--

LOCK TABLES `employeesettings_settings` WRITE;
/*!40000 ALTER TABLE `employeesettings_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeesettings_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flexboxactivity`
--

DROP TABLE IF EXISTS `flexboxactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flexboxactivity` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizationId` bigint(20) NOT NULL,
  `operationId` int(11) NOT NULL,
  `shiftId` tinyint(4) DEFAULT NULL,
  `capacitystatus` tinyint(4) NOT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_organizationid_idx` (`organizationId`),
  KEY `Fk_operationId_idx` (`operationId`),
  KEY `Fk_shift_idx` (`shiftId`),
  CONSTRAINT `Fk_operations` FOREIGN KEY (`operationId`) REFERENCES `operations` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_shift` FOREIGN KEY (`shiftId`) REFERENCES `shift` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flexboxactivity`
--

LOCK TABLES `flexboxactivity` WRITE;
/*!40000 ALTER TABLE `flexboxactivity` DISABLE KEYS */;
INSERT INTO `flexboxactivity` VALUES (1,1,4,1,1,'2016-04-25','2016-04-26'),(2,1,5,2,2,'2016-04-28','2016-04-29'),(6,1,4,1,2,'2016-04-28','2016-04-29'),(7,1,5,2,2,'2016-04-28','2016-04-28');
/*!40000 ALTER TABLE `flexboxactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flexboxmail`
--

DROP TABLE IF EXISTS `flexboxmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flexboxmail` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flexboxactivityId` bigint(20) NOT NULL,
  `orgoperationmailId` bigint(20) NOT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '1-sent 2-failed',
  `datetime` datetime NOT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_flexboxactivityId_idx` (`flexboxactivityId`),
  KEY `Fk_orgoperationmailid_idx` (`orgoperationmailId`),
  CONSTRAINT `Fk_flexboxactivityId` FOREIGN KEY (`flexboxactivityId`) REFERENCES `flexboxactivity` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_orgoperationmailid` FOREIGN KEY (`orgoperationmailId`) REFERENCES `orgoperationemail` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flexboxmail`
--

LOCK TABLES `flexboxmail` WRITE;
/*!40000 ALTER TABLE `flexboxmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `flexboxmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Drill milling truring',
  `description` varchar(250) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
INSERT INTO `operations` VALUES (4,'Milling','Milling','2016-04-13 21:49:02','2016-04-13 21:49:02','\0'),(5,'Turning','Turning','2016-04-13 21:49:02','2016-04-13 21:49:02','\0'),(6,'Drilling','Drilling','2016-04-13 21:49:02','2016-04-13 21:49:02','\0');
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizationclassId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `parentId` (`parentId`),
  KEY `Fk_OrganizationClass_OrganizationclassId_idx` (`organizationclassId`),
  CONSTRAINT `FK_organization_organization` FOREIGN KEY (`parentId`) REFERENCES `organization` (`Id`),
  CONSTRAINT `Fk_OrganizationClass_OrganizationclassId` FOREIGN KEY (`organizationclassId`) REFERENCES `organizationclass` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,1,'Logistic Incoming','line1',NULL,'2016-04-13 21:48:00','2016-04-13 21:48:00','\0'),(2,1,'Production Stroge','line2',NULL,'2016-04-13 21:48:00','2016-04-13 21:48:00','\0'),(3,1,'Production','line3',NULL,'2016-04-13 21:48:00','2016-04-13 21:48:00','\0'),(4,1,'Assembly','line4',NULL,'2016-04-13 21:48:00','2016-04-13 21:48:00','\0'),(5,1,'Logistic outgoing','line5',NULL,'2016-04-13 21:48:00','2016-04-13 21:48:00','\0'),(6,2,'MFV_1_Production','Station1',3,'2016-04-13 21:48:42','2016-04-13 21:48:42','\0'),(7,2,'MFV22_Production','Station2',3,'2016-04-13 21:48:42','2016-04-13 21:48:42','\0'),(8,2,'MFV4_Production','Station3',3,'2016-04-13 21:48:42','2016-04-13 21:48:42','\0'),(9,2,'MOE21_3_Galvanics','Station3',3,'2016-04-13 21:48:42','2016-04-13 21:48:42','\0'),(10,1,'testprod','station4',4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizationclass`
--

DROP TABLE IF EXISTS `organizationclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizationclass` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '1-incident 2-flexbox',
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizationclass`
--

LOCK TABLES `organizationclass` WRITE;
/*!40000 ALTER TABLE `organizationclass` DISABLE KEYS */;
INSERT INTO `organizationclass` VALUES (1,2,'Stattion','Station',NULL,NULL,NULL),(2,2,'Line','Line',NULL,NULL,NULL),(3,2,'Line','line','2016-04-13 20:51:20','2016-04-13 20:51:20','\0'),(4,2,'Station','Station','2016-04-13 20:51:20','2016-04-13 20:51:20','\0');
/*!40000 ALTER TABLE `organizationclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgoperationassociation`
--

DROP TABLE IF EXISTS `orgoperationassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgoperationassociation` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organizationId` bigint(11) NOT NULL,
  `operationId` int(11) NOT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `organizationId` (`organizationId`),
  KEY `Fk_operationId_idx` (`operationId`),
  CONSTRAINT `Fk-organizationId` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_operationId` FOREIGN KEY (`operationId`) REFERENCES `operations` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgoperationassociation`
--

LOCK TABLES `orgoperationassociation` WRITE;
/*!40000 ALTER TABLE `orgoperationassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgoperationassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgoperationemail`
--

DROP TABLE IF EXISTS `orgoperationemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgoperationemail` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgoperationId` bigint(20) NOT NULL,
  `emailId` varchar(100) NOT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Fk_organizationoperationmail_orgassociationid_idx` (`orgoperationId`),
  CONSTRAINT `Fk_organizationoperationmail_orgassociationid` FOREIGN KEY (`orgoperationId`) REFERENCES `orgoperationassociation` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgoperationemail`
--

LOCK TABLES `orgoperationemail` WRITE;
/*!40000 ALTER TABLE `orgoperationemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgoperationemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `IMAGEURL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Uzumaki Naruto','Konoha','http://img1.wikia.nocookie.net/__cb20140523045537/naruto/images/thumb/3/36/Naruto_Uzumaki.png/300px-Naruto_Uzumaki.png'),(2,'Hatake Kakashi','Konoha','http://img1.wikia.nocookie.net/__cb20140616090940/naruto/images/thumb/b/b3/KakashiHatake.png/300px-KakashiHatake.png'),(3,'Haruno Sakura','Konoha','http://vignette2.wikia.nocookie.net/naruto/images/b/ba/Sakurap2.png/revision/latest/scale-to-width-down/300?cb=20150825101949'),(4,'Uchiha Sasuke','Missing-nin','http://img1.wikia.nocookie.net/__cb20150110232732/naruto/images/c/c3/Sasuke_headshot.png'),(5,'Gaara','Sunagakure','http://img3.wikia.nocookie.net/__cb20130910220958/naruto/images/thumb/0/0f/Gaara_Part_II.png/300px-Gaara_Part_II.png'),(6,'Killer Bee','Kumogakure','http://vignette3.wikia.nocookie.net/naruto/images/6/63/Killer_B.png/revision/latest/scale-to-width-down/300?cb=20150917075056'),(7,'Jiraya','Konoha','http://img2.wikia.nocookie.net/__cb20120925123905/naruto/images/thumb/2/21/Profile_Jiraiya.PNG/300px-Profile_Jiraiya.PNG'),(8,'Namikaze Minato','Konoha','http://img4.wikia.nocookie.net/__cb20140209115534/naruto/images/thumb/1/1f/Minato_Namikaze.PNG/300px-Minato_Namikaze.PNG'),(9,'Uchiha Madara','Missing-nin','http://img2.wikia.nocookie.net/__cb20140724225045/naruto/images/thumb/c/cf/Madara_newshot.png/300px-Madara_newshot.png'),(10,'Senju Hashirama','Konoha','http://img2.wikia.nocookie.net/__cb20120915132454/naruto/images/thumb/7/7e/Hashirama_Senju.png/300px-Hashirama_Senju.png'),(11,'Might Guy','Konoha','http://img1.wikia.nocookie.net/__cb20150401084456/naruto/images/3/31/Might_Guy.png'),(12,'Hyuga Neji','Konoha','http://img1.wikia.nocookie.net/__cb20150123214015/naruto/images/6/63/Neji_Part_2.png'),(13,'Rock Lee','Konoha','http://img1.wikia.nocookie.net/__cb20131029112352/naruto/images/thumb/7/7d/Lee_timeskip.png/300px-Lee_timeskip.png'),(14,'Uchiha Obito','Missing-nin','http://img1.wikia.nocookie.net/__cb20140616090247/naruto/images/thumb/a/a0/Obito_Uchiha2.png/300px-Obito_Uchiha2.png'),(15,'Kurama','Tailed Beast','http://img1.wikia.nocookie.net/__cb20140818171718/naruto/images/thumb/7/7b/Kurama2.png/300px-Kurama2.png'),(16,'Uzumaki Kushina','Konoha','http://img4.wikia.nocookie.net/__cb20121006054451/naruto/images/thumb/4/4d/Kushina_2.png/300px-Kushina_2.png'),(17,'Nara Shikamaru','Konoha','http://img1.wikia.nocookie.net/__cb20130917013425/naruto/images/thumb/9/9a/Shikamaru_Nara.png/300px-Shikamaru_Nara.png'),(18,'Sarutobi Hiruzen','Konoha','http://img4.wikia.nocookie.net/__cb20120912121115/naruto/images/thumb/e/e4/Hiruzen_Sarutobi.png/300px-Hiruzen_Sarutobi.png'),(19,'Tsunade','Konoha','http://img4.wikia.nocookie.net/__cb20150108211132/naruto/images/b/b3/Tsunade_infobox2.png'),(20,'Orochimaru','Missing-nin','http://vignette2.wikia.nocookie.net/naruto/images/1/14/Orochimaru_Infobox.png/revision/latest/scale-to-width-down/300?cb=20150925223113'),(21,'Uchicha Itachi','Missing-nin','http://vignette2.wikia.nocookie.net/naruto/images/b/bb/Itachi.png/revision/latest/scale-to-width-down/300?cb=20150602102445'),(22,'Uzumaki Naruto','Konoha','http://img1.wikia.nocookie.net/__cb20140523045537/naruto/images/thumb/3/36/Naruto_Uzumaki.png/300px-Naruto_Uzumaki.png'),(23,'Uzumaki Naruto','Konoha','http://img1.wikia.nocookie.net/__cb20140523045537/naruto/images/thumb/3/36/Naruto_Uzumaki.png/300px-Naruto_Uzumaki.png'),(24,'AbdulGafur','Testforcloud','http://test.img'),(25,'AbdulD','testfromchrome','http://test.img'),(26,'AbdulG','testfrommoz','http://test.png'),(27,'AbdulS','testfromIe','http://test.img'),(31,'MohammedAli','MyName','http://test.img'),(33,'MohammedAli','testfromchrome','http://test2.img'),(34,'JavaJ2ee','Mydes','http://tes2t.img'),(35,'cloudapp','mycloudapp','http://test.img');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `Id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `lastModifiedDateTime` datetime DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'Morning','Shift1','2016-04-13 21:49:27','2016-04-13 21:49:27','\0'),(2,'Afternoon','Shift2','2016-04-13 21:49:27','2016-04-13 21:49:27','\0'),(3,'Night','Shift3','2016-04-13 21:49:27','2016-04-13 21:49:27','\0');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `university_id` bigint(20) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_university` (`university_id`),
  CONSTRAINT `student_university` FOREIGN KEY (`university_id`) REFERENCES `university` (`university_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,12345,'JOHN','KELLY','A'),(2,45678,'RAVI','KUMAR','B');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `university` (
  `university_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  PRIMARY KEY (`university_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45679 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (12345,'SKU','india'),(45678,'SVU','india');
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekday`
--

DROP TABLE IF EXISTS `weekday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekday` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `Id` bigint(20) NOT NULL,
  `day1` int(11) DEFAULT NULL,
  `day2` int(11) DEFAULT NULL,
  `day3` int(11) DEFAULT NULL,
  `day4` int(11) DEFAULT NULL,
  `day5` int(11) DEFAULT NULL,
  `weekId` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekday`
--

LOCK TABLES `weekday` WRITE;
/*!40000 ALTER TABLE `weekday` DISABLE KEYS */;
INSERT INTO `weekday` VALUES (1,1,1,1,1,1,1,19),(2,2,NULL,NULL,NULL,2,2,19),(3,1,1,1,NULL,NULL,NULL,20);
/*!40000 ALTER TABLE `weekday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekdays`
--

DROP TABLE IF EXISTS `weekdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekdays` (
  `Id` bigint(20) DEFAULT NULL,
  `weekId` int(11) DEFAULT NULL,
  `day1` varchar(45) DEFAULT NULL,
  `day2` varchar(45) DEFAULT NULL,
  `day3` varchar(45) DEFAULT NULL,
  `day4` varchar(45) DEFAULT NULL,
  `day5` varchar(45) DEFAULT NULL,
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `rid_UNIQUE` (`rid`),
  KEY `Id_idx` (`Id`),
  CONSTRAINT `Id` FOREIGN KEY (`Id`) REFERENCES `flexboxactivity` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekdays`
--

LOCK TABLES `weekdays` WRITE;
/*!40000 ALTER TABLE `weekdays` DISABLE KEYS */;
INSERT INTO `weekdays` VALUES (1,19,'1','1','1','0','0',1),(2,19,NULL,NULL,NULL,'2','2',2),(1,19,'1','1','1',NULL,NULL,3),(1,19,'1','1','1','0','0',4);
/*!40000 ALTER TABLE `weekdays` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-01 12:38:57
