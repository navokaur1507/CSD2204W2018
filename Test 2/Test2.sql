-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `AccountNumber` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Zapp Brannigan'),(2,'Al Gore\'s Head'),(3,'Barbados Slim'),(4,'Ogden Wernstrom'),(5,'Leo Wong'),(6,'Lrrr'),(7,'John Zoidberg'),(8,'John Zoidfarb'),(9,'Morbo'),(10,'Judge John Whitey'),(11,'Calculon');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `Salary` double NOT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Phillip J. Fry','Delivery boy',7500,'Not to be confused with the Philip J. Fry from Hovering Squid World 97a'),(2,'Turanga Leela','Captain',10000,NULL),(3,'Bender Bending Rodriguez','Robot',7500,NULL),(4,'Hubert J. Farnsworth','CEO',20000,NULL),(5,'John A. Zoidberg','Physician',25,NULL),(6,'Amy Wong','Intern',5000,NULL),(7,'Hermes Conrad','Bureaucrat',10000,NULL),(8,'Scruffy Scruffington','Janitor',5000,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has_clearance`
--

DROP TABLE IF EXISTS `has_clearance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `has_clearance` (
  `Employee` int(11) NOT NULL,
  `Planet` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  PRIMARY KEY (`Employee`,`Planet`),
  KEY `Planet` (`Planet`),
  CONSTRAINT `has_clearance_ibfk_1` FOREIGN KEY (`Employee`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `has_clearance_ibfk_2` FOREIGN KEY (`Planet`) REFERENCES `planet` (`PlanetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has_clearance`
--

LOCK TABLES `has_clearance` WRITE;
/*!40000 ALTER TABLE `has_clearance` DISABLE KEYS */;
INSERT INTO `has_clearance` VALUES (1,1,2),(1,2,3),(2,3,2),(2,4,4),(3,5,2),(3,6,4),(4,7,1);
/*!40000 ALTER TABLE `has_clearance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `Shipment` int(11) NOT NULL,
  `PackageNumber` int(11) NOT NULL,
  `Contents` varchar(255) NOT NULL,
  `Weight` double NOT NULL,
  `Sender` int(11) NOT NULL,
  `Recipient` int(11) NOT NULL,
  PRIMARY KEY (`Shipment`,`PackageNumber`),
  KEY `Sender` (`Sender`),
  KEY `Recipient` (`Recipient`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`Shipment`) REFERENCES `shipment` (`ShipmentID`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`Sender`) REFERENCES `client` (`AccountNumber`),
  CONSTRAINT `package_ibfk_3` FOREIGN KEY (`Recipient`) REFERENCES `client` (`AccountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,'Undeclared',1.5,1,2),(2,1,'Undeclared',10,2,3),(2,2,'A bucket of krill',2,8,7),(3,1,'Undeclared',15,3,4),(3,2,'Undeclared',3,5,1),(3,3,'Undeclared',7,2,3),(4,1,'Undeclared',5,4,5),(4,2,'Undeclared',27,1,2),(5,1,'Undeclared',100,5,1);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planet`
--

DROP TABLE IF EXISTS `planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planet` (
  `PlanetID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Coordinates` double NOT NULL,
  PRIMARY KEY (`PlanetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planet`
--

LOCK TABLES `planet` WRITE;
/*!40000 ALTER TABLE `planet` DISABLE KEYS */;
INSERT INTO `planet` VALUES (1,'Omicron Persei 8',89475345.3545),(2,'Decapod X',65498463216.3466),(3,'Mars',32435021.65468),(4,'Omega III',98432121.5464),(5,'Tarantulon VI',849842198.354654),(6,'Cannibalon',654321987.21654),(7,'DogDoo VII',65498721354.688),(8,'Nintenduu 64',6543219894.1654),(9,'Amazonia',65432135979.6547);
/*!40000 ALTER TABLE `planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `ShipmentID` int(11) NOT NULL,
  `ShipmentDate` date DEFAULT NULL,
  `Manager` int(11) NOT NULL,
  `Planet` int(11) NOT NULL,
  PRIMARY KEY (`ShipmentID`),
  KEY `Manager` (`Manager`),
  KEY `Planet` (`Planet`),
  CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`Manager`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`Planet`) REFERENCES `planet` (`PlanetID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'3004-05-11',1,1),(2,'3004-05-11',1,2),(3,NULL,2,3),(4,NULL,2,4),(5,NULL,7,5);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v1`
--

DROP TABLE IF EXISTS `v1`;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v1` (
  `ShipmentID` tinyint NOT NULL,
  `ShipmentDate` tinyint NOT NULL,
  `Manager` tinyint NOT NULL,
  `Planet` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v3`
--

DROP TABLE IF EXISTS `v3`;
/*!50001 DROP VIEW IF EXISTS `v3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v3` (
  `Shipment` tinyint NOT NULL,
  `PackageNumber` tinyint NOT NULL,
  `Contents` tinyint NOT NULL,
  `Weight` tinyint NOT NULL,
  `Sender` tinyint NOT NULL,
  `Recipient` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v6`
--

DROP TABLE IF EXISTS `v6`;
/*!50001 DROP VIEW IF EXISTS `v6`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v6` (
  `ShipmentID` tinyint NOT NULL,
  `ShipmentDate` tinyint NOT NULL,
  `Manager` tinyint NOT NULL,
  `Planet` tinyint NOT NULL,
  `PlanetID` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `Coordinates` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v7`
--

DROP TABLE IF EXISTS `v7`;
/*!50001 DROP VIEW IF EXISTS `v7`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v7` (
  `name` tinyint NOT NULL,
  `contents` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v1`
--

/*!50001 DROP TABLE IF EXISTS `v1`*/;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v1` AS (select `shipment`.`ShipmentID` AS `ShipmentID`,`shipment`.`ShipmentDate` AS `ShipmentDate`,`shipment`.`Manager` AS `Manager`,`shipment`.`Planet` AS `Planet` from `shipment` where `shipment`.`Manager` in (select `employee`.`EmployeeID` from `employee` where (`employee`.`Name` = 'Turanga Leela'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v3`
--

/*!50001 DROP TABLE IF EXISTS `v3`*/;
/*!50001 DROP VIEW IF EXISTS `v3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v3` AS (select `package`.`Shipment` AS `Shipment`,`package`.`PackageNumber` AS `PackageNumber`,`package`.`Contents` AS `Contents`,`package`.`Weight` AS `Weight`,`package`.`Sender` AS `Sender`,`package`.`Recipient` AS `Recipient` from `package` where (`package`.`Recipient` in (1,5,6))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v6`
--

/*!50001 DROP TABLE IF EXISTS `v6`*/;
/*!50001 DROP VIEW IF EXISTS `v6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v6` AS (select `shipment`.`ShipmentID` AS `ShipmentID`,`shipment`.`ShipmentDate` AS `ShipmentDate`,`shipment`.`Manager` AS `Manager`,`shipment`.`Planet` AS `Planet`,`planet`.`PlanetID` AS `PlanetID`,`planet`.`Name` AS `Name`,`planet`.`Coordinates` AS `Coordinates` from (`shipment` join `planet` on((`shipment`.`Planet` = `planet`.`PlanetID`))) where (`planet`.`Name` in ('Mars','Decapod X'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v7`
--

/*!50001 DROP TABLE IF EXISTS `v7`*/;
/*!50001 DROP VIEW IF EXISTS `v7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v7` AS (select `client`.`Name` AS `name`,`package`.`Contents` AS `contents` from (`package` join `client` on((`client`.`AccountNumber` = `package`.`Sender`))) where (`package`.`Contents` = 'uncleared')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22 11:00:05
