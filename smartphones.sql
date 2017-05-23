-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: safetyfirstSmartphones
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `accesscode` varchar(255) DEFAULT NULL,
  `loginid` int(11) NOT NULL,
  PRIMARY KEY (`loginid`),
  CONSTRAINT `FK_ffpdvbvdhpn953d5t9el5s8ua` FOREIGN KEY (`loginid`) REFERENCES `login` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('1234',4);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `student_bookingid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `FK_8ovprg6vgqgm855cwekx3762w` (`student_bookingid`),
  CONSTRAINT `FK_8ovprg6vgqgm855cwekx3762w` FOREIGN KEY (`student_bookingid`) REFERENCES `student` (`loginid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedule` (
  `scheduleid` int(11) NOT NULL AUTO_INCREMENT,
  `departureDate` varchar(255) DEFAULT NULL,
  `departureTime` varchar(255) DEFAULT NULL,
  `vehicleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`scheduleid`),
  KEY `FK_dvovufv8vqqr8xvsugo9b8bui` (`vehicleID`),
  CONSTRAINT `FK_dvovufv8vqqr8xvsugo9b8bui` FOREIGN KEY (`vehicleID`) REFERENCES `vehicle` (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
INSERT INTO `Schedule` VALUES (1,'2017-04-29','7:00 PM',2),(2,'2017-04-29','8:00 PM',3),(3,'2017-04-30','7:00 PM',2),(4,'2017-04-30','8:00 PM',3);
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'disha','Student','disha'),(2,'veh1','Vehicle','veh1'),(3,'veh2','Vehicle','veh2'),(4,'admin','Admin','admin'),(5,'rucha','Student','rucha');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_student`
--

DROP TABLE IF EXISTS `schedule_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_student` (
  `scheduleid` int(11) NOT NULL,
  `loginid` int(11) NOT NULL,
  PRIMARY KEY (`scheduleid`,`loginid`),
  KEY `FK_dnsfwmkk8hp1doyxshm851rh9` (`loginid`),
  CONSTRAINT `FK_dnsfwmkk8hp1doyxshm851rh9` FOREIGN KEY (`loginid`) REFERENCES `student` (`loginid`),
  CONSTRAINT `FK_rsd2udes1o8p6udxlwultmqxa` FOREIGN KEY (`scheduleid`) REFERENCES `Schedule` (`scheduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_student`
--

LOCK TABLES `schedule_student` WRITE;
/*!40000 ALTER TABLE `schedule_student` DISABLE KEYS */;
INSERT INTO `schedule_student` VALUES (1,1),(2,1),(3,1),(4,1),(3,5);
/*!40000 ALTER TABLE `schedule_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `fine` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `nuid` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `loginid` int(11) NOT NULL,
  PRIMARY KEY (`loginid`),
  CONSTRAINT `FK_1hpj40ffi7yuqvka6i3754sva` FOREIGN KEY (`loginid`) REFERENCES `login` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('5','Disha','Akarte','001620835','8572689331',1),('5','Rucha','Akarte','001620836','8572689331',5);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `capacity` varchar(255) DEFAULT NULL,
  `vehicleNumber` varchar(255) DEFAULT NULL,
  `loginid` int(11) NOT NULL,
  PRIMARY KEY (`loginid`),
  CONSTRAINT `FK_gt2p063fdu4tuy1pnt1gs6xc` FOREIGN KEY (`loginid`) REFERENCES `login` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('10','1234',2),('11','2345',3);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-29 12:05:21
