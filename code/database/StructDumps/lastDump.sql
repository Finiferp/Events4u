-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 192.168.131.123    Database: Events4uAuditLogs
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.23.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Events4uAuditLogs`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Events4uAuditLogs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Events4uAuditLogs`;

--
-- Table structure for table `AttendsAudit`
--

DROP TABLE IF EXISTS `AttendsAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AttendsAudit` (
  `idAttendsAudit` int NOT NULL AUTO_INCREMENT,
  `event_code_attends_PKFK` int NOT NULL,
  `user_code_attends_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idAttendsAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AttendsAudit`
--

LOCK TABLES `AttendsAudit` WRITE;
/*!40000 ALTER TABLE `AttendsAudit` DISABLE KEYS */;
INSERT INTO `AttendsAudit` VALUES (1,2,1,'2024-03-06 10:09:44','DELETE'),(2,2,1,'2024-03-06 10:10:04','DELETE'),(3,2,7,'2024-03-10 10:42:42','DELETE'),(4,2,1,'2024-03-11 08:12:05','UPDATE'),(5,2,7,'2024-03-13 06:56:19','DELETE'),(6,11,7,'2024-03-13 06:57:49','DELETE'),(7,2,8,'2024-03-26 06:45:16','DELETE'),(8,3,8,'2024-03-26 06:45:16','DELETE'),(9,3,8,'2024-03-26 07:56:43','DELETE');
/*!40000 ALTER TABLE `AttendsAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BelongsAudit`
--

DROP TABLE IF EXISTS `BelongsAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BelongsAudit` (
  `idBelongsAudit` int NOT NULL AUTO_INCREMENT,
  `event_code_belongs_PKFK` int NOT NULL,
  `category_code_belongs_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idBelongsAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BelongsAudit`
--

LOCK TABLES `BelongsAudit` WRITE;
/*!40000 ALTER TABLE `BelongsAudit` DISABLE KEYS */;
INSERT INTO `BelongsAudit` VALUES (2,6,10,'2024-03-04 13:19:02','UPDATE'),(3,6,11,'2024-03-08 07:40:25','DELETE'),(4,6,9,'2024-03-08 07:42:13','DELETE'),(5,6,11,'2024-03-08 07:42:13','DELETE'),(6,6,9,'2024-03-08 07:46:22','DELETE'),(7,6,11,'2024-03-08 07:46:22','DELETE'),(8,6,9,'2024-03-08 07:47:31','DELETE'),(9,6,11,'2024-03-08 07:47:31','DELETE'),(10,6,9,'2024-03-08 07:48:10','DELETE'),(11,6,11,'2024-03-08 07:48:10','DELETE'),(12,6,9,'2024-03-08 07:48:48','DELETE'),(13,6,11,'2024-03-08 07:48:48','DELETE'),(14,6,9,'2024-03-08 07:50:42','DELETE'),(15,6,11,'2024-03-08 07:50:42','DELETE'),(16,6,9,'2024-03-08 07:51:04','DELETE'),(17,6,11,'2024-03-08 07:51:04','DELETE'),(18,6,9,'2024-03-08 07:52:22','DELETE'),(19,6,11,'2024-03-08 07:52:22','DELETE'),(20,6,9,'2024-03-08 07:53:57','DELETE'),(21,6,11,'2024-03-08 07:53:57','DELETE'),(22,2,7,'2024-03-08 07:54:27','DELETE'),(23,2,8,'2024-03-08 07:54:27','DELETE'),(24,12,12,'2024-03-18 08:51:04','DELETE'),(25,10,7,'2024-03-22 07:18:18','DELETE'),(26,10,8,'2024-03-22 07:18:18','DELETE'),(27,10,7,'2024-03-22 07:18:53','DELETE'),(28,10,8,'2024-03-22 07:18:53','DELETE'),(29,10,8,'2024-03-22 07:23:31','DELETE'),(30,10,8,'2024-03-22 07:24:48','DELETE'),(31,10,8,'2024-03-22 07:25:05','DELETE'),(32,10,8,'2024-03-22 07:26:22','DELETE'),(33,10,8,'2024-03-22 07:27:06','DELETE'),(34,8,8,'2024-03-22 07:38:27','DELETE'),(35,8,9,'2024-03-22 07:38:27','DELETE'),(36,7,8,'2024-03-22 07:40:32','DELETE'),(37,7,12,'2024-03-22 07:40:32','DELETE'),(38,4,11,'2024-03-22 07:43:19','DELETE'),(39,3,9,'2024-03-22 07:47:42','DELETE'),(40,2,7,'2024-03-22 07:49:18','DELETE'),(41,2,8,'2024-03-22 07:49:18','DELETE'),(42,11,7,'2024-03-22 07:52:10','DELETE'),(43,11,8,'2024-03-22 07:52:10','DELETE'),(44,11,7,'2024-03-22 07:54:01','DELETE'),(45,11,8,'2024-03-22 07:54:01','DELETE'),(46,13,8,'2024-03-22 09:22:49','DELETE'),(47,13,11,'2024-03-22 09:22:49','DELETE'),(48,13,8,'2024-03-22 09:22:58','DELETE'),(49,13,11,'2024-03-22 09:22:58','DELETE'),(50,13,8,'2024-03-22 09:23:14','DELETE'),(51,13,11,'2024-03-22 09:23:14','DELETE'),(52,13,8,'2024-03-22 09:23:31','DELETE'),(53,13,11,'2024-03-22 09:23:31','DELETE'),(54,13,8,'2024-03-22 09:24:05','DELETE'),(55,13,11,'2024-03-22 09:24:05','DELETE'),(56,13,8,'2024-03-22 09:24:22','DELETE'),(57,13,11,'2024-03-22 09:24:22','DELETE'),(58,10,8,'2024-03-22 09:40:04','DELETE'),(59,3,8,'2024-03-25 10:50:36','DELETE'),(60,3,8,'2024-03-25 10:52:55','DELETE'),(61,3,8,'2024-03-25 10:52:55','DELETE'),(62,3,8,'2024-03-25 10:52:56','DELETE'),(63,3,8,'2024-03-25 10:56:36','DELETE'),(64,3,8,'2024-03-25 10:58:05','DELETE'),(65,3,8,'2024-03-25 11:00:04','DELETE'),(66,3,8,'2024-03-25 11:05:07','DELETE'),(67,19,8,'2024-03-25 11:55:38','DELETE'),(68,19,10,'2024-03-25 11:55:38','DELETE');
/*!40000 ALTER TABLE `BelongsAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoryAudit`
--

DROP TABLE IF EXISTS `CategoryAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoryAudit` (
  `idCategoryAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `label` varchar(450) NOT NULL,
  `date_Audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idCategoryAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoryAudit`
--

LOCK TABLES `CategoryAudit` WRITE;
/*!40000 ALTER TABLE `CategoryAudit` DISABLE KEYS */;
INSERT INTO `CategoryAudit` VALUES (2,13,'Other','2024-03-04 13:19:23','UPDATE');
/*!40000 ALTER TABLE `CategoryAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventAudit`
--

DROP TABLE IF EXISTS `EventAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventAudit` (
  `idEventAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `title` varchar(450) NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  `price` int NOT NULL,
  `created` datetime NOT NULL,
  `owner_FK` int NOT NULL,
  `imageUrl` varchar(450) NOT NULL,
  `isVisible` tinyint NOT NULL,
  `location_FK` int NOT NULL,
  `group_view_FK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idEventAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventAudit`
--

LOCK TABLES `EventAudit` WRITE;
/*!40000 ALTER TABLE `EventAudit` DISABLE KEYS */;
INSERT INTO `EventAudit` VALUES (1,4,'TEst','2024-02-26 09:00:00','2024-02-26 13:00:00',12,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-04 13:32:40','UPDATE'),(2,7,'TEst','2024-02-26 09:00:00','2024-02-26 13:00:00',12,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-07 09:23:15','UPDATE'),(3,6,'gamescon','2024-02-26 07:00:00','2024-02-26 11:00:00',12,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,2,'2024-03-07 12:38:44','UPDATE'),(4,6,'gamescon','2024-02-26 07:00:00','2024-02-26 11:00:00',12,'2024-03-08 07:09:58',1,'assets/images/dow.jpg',1,1,2,'2024-03-07 12:39:07','UPDATE'),(5,7,'simple event','2024-02-26 09:00:00','2024-02-26 13:00:00',12,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-07 12:50:46','UPDATE'),(6,10,'Updated Event','2024-02-26 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:28',1,'http://127.0.0.1:3000/assets/images/Updated Event/1709709988477-Updated Event.png',1,1,1,'2024-03-07 12:51:25','UPDATE'),(7,10,'Updated Event','2024-03-08 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:28',1,'http://127.0.0.1:3000/assets/images/Updated Event/1709709988477-Updated Event.png',1,1,1,'2024-03-07 13:13:01','UPDATE'),(8,2,'Updated Event','2024-02-26 09:00:00','2024-02-26 13:00:00',25,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-07 13:13:01','UPDATE'),(9,6,'gamescon','2024-02-26 07:00:00','2024-02-26 11:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,2,'2024-03-08 07:40:25','UPDATE'),(10,6,'gamescon','2024-02-26 06:00:00','2024-02-26 10:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:42:13','UPDATE'),(11,6,'gamescon','2024-02-26 05:00:00','2024-02-26 09:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:46:22','UPDATE'),(12,6,'gamescon','2024-02-26 04:00:00','2024-02-26 08:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:47:31','UPDATE'),(13,6,'gamescon','2024-02-26 03:00:00','2024-02-26 07:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:48:10','UPDATE'),(14,6,'gamescon','2024-02-26 02:00:00','2024-02-26 06:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:48:48','UPDATE'),(15,6,'gamescon','2024-02-26 01:00:00','2024-02-26 05:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:50:42','UPDATE'),(16,6,'gamescon','2024-02-26 00:00:00','2024-02-26 04:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:51:04','UPDATE'),(17,6,'gamescon','2024-02-25 23:00:00','2024-02-26 03:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:52:22','UPDATE'),(18,6,'gamescon','2024-02-25 22:00:00','2024-02-26 02:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:53:57','UPDATE'),(19,2,'Updated Event','2024-03-08 09:00:00','2024-02-26 13:00:00',25,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-08 07:54:27','UPDATE'),(20,2,'Updated Event','2024-03-08 08:00:00','2024-02-26 12:00:00',25,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-09 09:33:35','UPDATE'),(21,3,'Group Test','2024-02-26 08:00:00','2024-02-26 12:00:00',12,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,3,'2024-03-09 09:33:35','UPDATE'),(22,4,'Audit Test','2024-02-26 09:00:00','2024-02-26 13:00:00',12,'2024-02-21 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-09 09:33:35','UPDATE'),(23,6,'gamescon','2024-02-25 21:00:00','2024-02-26 01:00:00',12,'2024-03-09 07:09:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-09 09:33:35','UPDATE'),(24,7,'simple event','2024-03-08 09:00:00','2024-02-26 13:00:00',12,'2024-03-09 07:08:58',1,'assets/images/dow.jpg',1,1,1,'2024-03-09 09:33:35','UPDATE'),(25,8,'gamescon','2024-02-01 02:41:00','2024-02-08 10:41:00',54,'2024-02-26 15:33:09',1,'http://127.0.0.1:3000/assets/images/gamescon/1709108744312-gamescon.png',1,1,1,'2024-03-09 09:33:35','UPDATE'),(26,10,'Updated Event copied','2024-03-08 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:28',1,'http://127.0.0.1:3000/assets/images/Updated Event/1709709988477-Updated Event.png',1,1,1,'2024-03-09 09:33:35','UPDATE'),(27,11,'Cpoied Event','2024-02-26 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:42',1,'http://127.0.0.1:3000/assets/images/Cpoied Event/1709710003071-Cpoied Event.png',1,1,1,'2024-03-09 09:33:35','UPDATE'),(28,11,'Cpoied Event','2024-02-26 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:42',7,'http://127.0.0.1:3000/assets/images/Cpoied Event/1709710003071-Cpoied Event.png',1,1,1,'2024-03-11 12:29:20','UPDATE'),(29,3,'Group Test','2024-02-26 08:00:00','2024-02-26 12:00:00',12,'2024-02-21 07:09:58',7,'assets/images/dow.jpg',1,1,3,'2024-03-13 08:16:24','UPDATE'),(30,3,'Group Test','2024-02-26 08:00:00','2024-02-26 12:00:00',12,'2024-02-21 07:09:58',2,'assets/images/dow.jpg',1,1,3,'2024-03-13 08:16:58','UPDATE'),(31,8,'gamescon','2024-02-01 02:41:00','2024-02-08 10:41:00',54,'2024-02-26 15:33:09',7,'http://127.0.0.1:3000/assets/images/gamescon/1709108744312-gamescon.png',1,1,1,'2024-03-13 09:20:50','UPDATE'),(32,10,'Updated Event copied','2024-03-08 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:28',7,'http://127.0.0.1:3000/assets/images/Updated Event/1709709988477-Updated Event.png',1,1,1,'2024-03-13 09:20:50','UPDATE'),(33,11,'Cpoied Event','2024-02-26 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:42',2,'http://127.0.0.1:3000/assets/images/Cpoied Event/1709710003071-Cpoied Event.png',1,1,1,'2024-03-13 09:20:50','UPDATE'),(34,12,'lol','2024-03-13 09:33:00','2024-03-08 09:33:00',78,'2024-03-18 08:49:20',7,'http://192.168.129.237:3000/assets/images/lol/1710751761156-lol.png',1,5,1,'2024-03-18 08:51:04','UPDATE'),(35,6,'gamescon','2024-02-25 21:00:00','2024-02-26 01:00:00',12,'2024-03-09 07:09:58',7,'assets/images/dow.jpg',1,1,1,'2024-03-18 08:51:34','DELETE'),(36,12,'lol finals','2024-03-13 08:33:00','2024-03-08 08:33:00',78,'2024-03-18 08:49:20',7,'http://192.168.129.237:3000/assets/images/lol/1710751761156-lol.png',1,5,1,'2024-03-21 09:33:36','UPDATE'),(37,10,'Updated Event copied','2024-03-08 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237:3000/assets/images/Updated Event/1709709988477-Updated Event.png',1,1,1,'2024-03-22 07:18:18','UPDATE'),(38,10,'Updated Event copied','2024-03-08 07:00:00','2024-02-26 11:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237:3000/assets/images/Updated Event/1709709988477-Updated Event.png',1,1,1,'2024-03-22 07:18:53','UPDATE'),(39,10,'Tomorrowland','2024-03-08 06:00:00','2024-02-26 10:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237/assets/images/Tomorrowland/1711091935452-Tomorrowland.png',1,1,1,'2024-03-22 07:23:31','UPDATE'),(40,10,'Tomorrowland','2024-03-08 05:00:00','2024-02-26 09:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237/assets/images/Tomorrowland/1711092212656-Tomorrowland.png',1,1,1,'2024-03-22 07:24:48','UPDATE'),(41,10,'Tomorrowland','2024-03-08 04:00:00','2024-02-26 08:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237/assets/images/Tomorrowland/1711092289860-Tomorrowland.png',1,1,1,'2024-03-22 07:25:05','UPDATE'),(42,10,'Tomorrowland','2024-03-08 03:00:00','2024-02-26 07:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237/assets/images/Tomorrowland/1711092307051-Tomorrowland.png',1,1,1,'2024-03-22 07:26:22','UPDATE'),(43,10,'Tomorrowland','2024-03-08 02:00:00','2024-02-26 06:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237/assets/images/Tomorrowland/1711092384446-Tomorrowland.png',1,1,1,'2024-03-22 07:27:06','UPDATE'),(44,8,'gamescon','2024-02-01 02:41:00','2024-02-08 10:41:00',54,'2024-02-26 15:33:09',7,'http://192.168.129.237:3000/assets/images/gamescon/1709108744312-gamescon.png',1,1,1,'2024-03-22 07:38:27','UPDATE'),(45,7,'simple event','2024-03-08 09:00:00','2024-02-26 13:00:00',12,'2024-03-09 07:08:58',7,'assets/images/dow.jpg',1,1,1,'2024-03-22 07:40:32','UPDATE'),(46,4,'Audit Test','2024-02-26 09:00:00','2024-02-26 13:00:00',12,'2024-02-21 07:09:58',7,'assets/images/dow.jpg',1,1,1,'2024-03-22 07:43:19','UPDATE'),(47,3,'Group Test','2024-02-26 08:00:00','2024-02-26 12:00:00',12,'2024-02-21 07:09:58',7,'assets/images/dow.jpg',1,1,3,'2024-03-22 07:47:42','UPDATE'),(48,2,'Updated Event','2024-03-08 08:00:00','2024-02-26 12:00:00',25,'2024-02-21 07:09:58',7,'assets/images/dow.jpg',1,1,1,'2024-03-22 07:49:18','UPDATE'),(49,12,'lol finals','2024-03-13 08:33:00','2024-03-08 08:33:00',78,'2024-03-18 08:49:20',8,'http://192.168.129.237:3000/assets/images/lol/1710751761156-lol.png',1,5,1,'2024-03-22 07:50:19','UPDATE'),(50,11,'Cpoied Event','2024-02-26 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:42',2,'http://192.168.129.237:3000/assets/images/Cpoied Event/1709710003071-Cpoied Event.png',1,1,1,'2024-03-22 07:50:19','UPDATE'),(51,11,'Cpoied Event','2024-02-26 08:00:00','2024-02-26 12:00:00',25,'2024-03-06 07:26:42',7,'http://192.168.129.237:3000/assets/images/Cpoied Event/1709710003071-Cpoied Event.png',1,1,1,'2024-03-22 07:52:10','UPDATE'),(52,11,'Olympic Games','2024-02-26 07:00:00','2024-02-26 11:00:00',25,'2024-03-06 07:26:42',7,'http://192.168.129.237:3000/assets/images/Olympic Games/1711093932162-Olympic Games.png',1,1,1,'2024-03-22 07:54:01','UPDATE'),(53,2,'Brasil Game Show','2024-03-08 07:00:00','2024-02-26 11:00:00',25,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Brasil Game Show/1711093760166-Brasil Game Show.png',1,1,1,'2024-03-22 08:00:09','UPDATE'),(54,13,'Wacken','2024-07-31 10:00:00','2024-08-03 12:59:00',100,'2024-03-22 09:12:16',8,'http://192.168.129.237:3000/assets/images/Wacken/1711098738162-Wacken.png',1,6,1,'2024-03-22 09:22:49','UPDATE'),(55,13,'Wacken','2024-07-31 08:00:00','2024-08-03 10:59:00',100,'2024-03-22 09:12:16',8,'http://192.168.129.237:3000/assets/images/Wacken/1711099371024-Wacken.png',1,6,1,'2024-03-22 09:22:58','UPDATE'),(56,13,'Wacken','2024-07-31 06:00:00','2024-08-03 08:59:00',100,'2024-03-22 09:12:16',8,'http://192.168.129.237:3000/assets/images/Wacken/1711099380630-Wacken.png',1,6,1,'2024-03-22 09:23:14','UPDATE'),(57,13,'Wacken','2024-07-31 04:00:00','2024-08-03 06:59:00',10,'2024-03-22 09:12:16',8,'http://192.168.129.237:3000/assets/images/Wacken/1711099396753-Wacken.png',1,6,1,'2024-03-22 09:23:31','UPDATE'),(58,13,'Wacken','2024-07-31 02:00:00','2024-08-03 04:59:00',100,'2024-03-22 09:12:16',8,'http://192.168.129.237:3000/assets/images/Wacken/1711099413156-Wacken.png',1,6,1,'2024-03-22 09:24:05','UPDATE'),(59,13,'Wacken','2024-07-31 00:00:00','2024-08-03 02:59:00',300,'2024-03-22 09:12:16',8,'http://192.168.129.237:3000/assets/images/Wacken/1711099447149-Wacken.png',1,6,1,'2024-03-22 09:24:22','UPDATE'),(60,13,'Wacken','2024-07-30 22:00:00','2024-08-03 00:59:00',300,'2024-03-22 09:12:16',8,'http://192.168.129.237:3000/assets/images/Wacken/1711099447149-Wacken.png',0,6,1,'2024-03-22 09:24:47','DELETE'),(61,10,'Tomorrowland','2024-03-08 01:00:00','2024-02-26 05:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237:3000/assets/images/Tomorrowland/1711092428426-Tomorrowland.png',1,1,1,'2024-03-22 09:40:04','UPDATE'),(62,11,'Olympic Games','2024-02-26 06:00:00','2024-02-26 10:00:00',25,'2024-03-06 07:26:42',7,'http://192.168.129.237:3000/assets/images/Olympic Games/1711094043148-Olympic Games.png',1,1,1,'2024-03-22 09:47:38','UPDATE'),(63,2,'Brasil Game Show','2024-03-08 07:00:00','2024-02-26 11:00:00',25,'2024-02-21 07:09:58',8,'http://192.168.129.237:3000/assets/images/Brasil Game Show/1711093760166-Brasil Game Show.png',1,1,1,'2024-03-22 09:58:24','UPDATE'),(64,15,'josi','2024-03-21 13:07:00','2024-03-22 14:07:00',342,'2024-03-22 12:08:19',7,'http://192.168.129.237:3000/assets/images/josi/1711109301297-JOSI.png',1,2,1,'2024-03-22 12:11:01','DELETE'),(65,16,'JOSI','2024-03-22 13:11:00','2024-03-22 13:11:00',9,'2024-03-22 12:11:29',7,'http://192.168.129.237:3000/assets/images/JOSI/1711109491593-JOSI.png',1,2,1,'2024-03-22 12:12:07','DELETE'),(66,17,'Josi','2024-03-22 13:12:00','2024-03-22 13:12:00',9,'2024-03-22 12:12:27',7,'http://192.168.129.237:3000/assets/images/JOSI/1711109549620-JOSI.png',1,2,1,'2024-03-22 12:13:34','DELETE'),(67,3,'Fête de la Musique Dudelange','2024-02-26 07:00:00','2024-02-26 11:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1,'2024-03-25 10:50:36','UPDATE'),(68,3,'Fête de la Musique Dudelange','2024-02-26 06:00:00','2024-02-26 10:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1,'2024-03-25 10:52:55','UPDATE'),(69,3,'Fête de la Musique Dudelange','2024-02-26 05:00:00','2024-02-26 09:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1,'2024-03-25 10:56:36','UPDATE'),(70,3,'Fête de la Musique Dudelange','2024-02-26 04:00:00','2024-02-26 08:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1,'2024-03-25 10:58:05','UPDATE'),(71,3,'Fête de la Musique Dudelange','2024-02-26 03:00:00','2024-02-26 07:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1,'2024-03-25 11:00:04','UPDATE'),(72,3,'Fête de la Musique Dudelange','2024-02-26 02:00:00','2024-02-26 06:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1,'2024-03-25 11:05:07','UPDATE'),(73,2,'Brasil Game Show','2024-03-23 07:00:00','2024-02-26 11:00:00',25,'2024-02-21 07:09:58',8,'http://192.168.129.237:3000/assets/images/Brasil Game Show/1711093760166-Brasil Game Show.png',1,1,1,'2024-03-25 11:30:18','UPDATE'),(74,18,'dsad','2024-03-02 12:51:00','2024-03-06 12:51:00',4,'2024-03-25 11:51:33',8,'http://192.168.129.237:3000/assets/images/DSAD/1711367494413-DSAD.png',1,2,1,'2024-03-25 11:54:29','DELETE'),(75,19,'tert','2024-03-25 12:54:00','2024-03-25 12:54:00',9,'2024-03-25 11:54:51',8,'http://192.168.129.237:3000/assets/images/TERT/1711367692140-TERT.png',1,6,1,'2024-03-25 11:55:38','UPDATE'),(76,19,'tert','2024-03-25 11:54:00','2024-03-25 11:54:00',9,'2024-03-25 11:54:51',8,'http://192.168.129.237:3000/assets/images/TERT/1711367738784-TERT.png',1,6,1,'2024-03-25 11:56:02','DELETE'),(77,20,'ewq','2024-03-25 12:56:00','2024-03-25 12:56:00',9,'2024-03-25 11:56:19',8,'http://192.168.129.237:3000/assets/images/EWQ/1711367779835-EWQ.png',1,2,1,'2024-03-25 11:56:41','DELETE'),(78,22,'test1','2024-03-25 11:56:00','2024-03-25 11:56:00',9,'2024-03-25 12:01:51',8,'http://192.168.129.237:3000/assets/images/WQE/1711367828119-WQE.png',1,2,1,'2024-03-25 12:02:21','DELETE'),(79,23,'test2','2024-03-25 11:56:00','2024-03-25 11:56:00',9,'2024-03-25 12:02:05',8,'http://192.168.129.237:3000/assets/images/TEST2/1711368126412-TEST2.png',1,2,1,'2024-03-25 12:02:26','DELETE'),(80,21,'wqe','2024-03-25 12:56:00','2024-03-25 12:56:00',9,'2024-03-25 11:57:07',8,'http://192.168.129.237:3000/assets/images/WQE/1711367828119-WQE.png',1,2,1,'2024-03-25 12:02:31','DELETE'),(81,24,'Fête de la Musique Dudelange 2.0','2024-02-26 00:00:00','2024-02-26 04:00:00',12,'2024-03-28 12:14:21',7,'http://192.168.131.123:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1,'2024-03-28 12:14:29','DELETE'),(82,2,'Brasil Game Show','2024-03-26 07:00:00','2024-02-26 11:00:00',25,'2024-02-21 07:09:58',8,'http://192.168.129.237:3000/assets/images/Brasil Game Show/1711093760166-Brasil Game Show.png',1,1,1,'2024-03-28 12:24:52','UPDATE');
/*!40000 ALTER TABLE `EventAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FavoriteAudit`
--

DROP TABLE IF EXISTS `FavoriteAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FavoriteAudit` (
  `idFavoriteAudit` int NOT NULL AUTO_INCREMENT,
  `user_code_favorite_PKFK` int NOT NULL,
  `event_code_favorite_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idFavoriteAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FavoriteAudit`
--

LOCK TABLES `FavoriteAudit` WRITE;
/*!40000 ALTER TABLE `FavoriteAudit` DISABLE KEYS */;
INSERT INTO `FavoriteAudit` VALUES (1,1,2,'2024-03-08 15:57:25','DELETE'),(2,1,2,'2024-03-10 10:10:10','DELETE'),(3,7,2,'2024-03-10 10:42:29','DELETE'),(4,7,11,'2024-03-14 07:22:38','DELETE'),(5,8,11,'2024-03-19 10:43:45','DELETE'),(6,7,3,'2024-03-22 10:18:50','DELETE');
/*!40000 ALTER TABLE `FavoriteAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupAudit`
--

DROP TABLE IF EXISTS `GroupAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GroupAudit` (
  `idGroupAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `name` varchar(450) NOT NULL,
  `owner_FK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idGroupAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupAudit`
--

LOCK TABLES `GroupAudit` WRITE;
/*!40000 ALTER TABLE `GroupAudit` DISABLE KEYS */;
INSERT INTO `GroupAudit` VALUES (1,2,'Informatics',1,'2024-03-11 07:58:34','UPDATE'),(2,3,'BTSi',1,'2024-03-11 07:58:34','UPDATE'),(3,3,'BTSi',7,'2024-03-13 07:49:59','UPDATE'),(4,3,'BTSi',2,'2024-03-13 08:01:35','UPDATE'),(5,3,'BTSi',7,'2024-03-13 08:13:56','UPDATE'),(6,3,'BTSi',2,'2024-03-13 08:14:39','UPDATE');
/*!40000 ALTER TABLE `GroupAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InterestedAudit`
--

DROP TABLE IF EXISTS `InterestedAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InterestedAudit` (
  `idInterestedAudit` int NOT NULL AUTO_INCREMENT,
  `event_code_interested_PKFK` int NOT NULL,
  `user_code_attends_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idInterestedAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InterestedAudit`
--

LOCK TABLES `InterestedAudit` WRITE;
/*!40000 ALTER TABLE `InterestedAudit` DISABLE KEYS */;
INSERT INTO `InterestedAudit` VALUES (1,7,7,'2024-03-12 08:35:48','DELETE');
/*!40000 ALTER TABLE `InterestedAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LocationAudit`
--

DROP TABLE IF EXISTS `LocationAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LocationAudit` (
  `idLocationAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `adress` varchar(450) NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idLocationAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LocationAudit`
--

LOCK TABLES `LocationAudit` WRITE;
/*!40000 ALTER TABLE `LocationAudit` DISABLE KEYS */;
INSERT INTO `LocationAudit` VALUES (1,1,'test','2024-03-11 08:23:08','UPDATE'),(2,3,'test loc','2024-03-11 08:23:08','UPDATE'),(3,5,'test123','2024-03-11 08:23:08','UPDATE');
/*!40000 ALTER TABLE `LocationAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartOfAudit`
--

DROP TABLE IF EXISTS `PartOfAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PartOfAudit` (
  `idPartOfAudit` int NOT NULL AUTO_INCREMENT,
  `code_group_partOf_PKFK` int NOT NULL,
  `code_user_partOf_PKFK` int NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idPartOfAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartOfAudit`
--

LOCK TABLES `PartOfAudit` WRITE;
/*!40000 ALTER TABLE `PartOfAudit` DISABLE KEYS */;
INSERT INTO `PartOfAudit` VALUES (1,1,1,'2024-03-12 08:24:41','UPDATE'),(2,1,2,'2024-03-12 08:24:46','UPDATE'),(3,3,7,'2024-03-13 08:16:40','UPDATE');
/*!40000 ALTER TABLE `PartOfAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewAudit`
--

DROP TABLE IF EXISTS `ReviewAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewAudit` (
  `idReviewAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `stars` int NOT NULL,
  `review` text NOT NULL,
  `user_code_review_FK` int NOT NULL,
  `event_code_describes_FK` int NOT NULL,
  `creationDate` date NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idReviewAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewAudit`
--

LOCK TABLES `ReviewAudit` WRITE;
/*!40000 ALTER TABLE `ReviewAudit` DISABLE KEYS */;
INSERT INTO `ReviewAudit` VALUES (1,1,3,'test',1,2,'2024-02-29','2024-03-12 08:42:35','UPDATE'),(2,1,3,'test',7,2,'2024-02-29','2024-03-18 09:03:13','DELETE'),(3,2,1,'wd',1,2,'2024-02-29','2024-03-18 09:03:13','DELETE'),(4,3,5,'Best event I\'ever been',7,12,'2024-03-18','2024-03-18 09:03:13','DELETE'),(5,4,5,'Best event I\'ever been on.',7,12,'2024-03-18','2024-03-18 09:03:13','DELETE'),(6,5,1,'fd',7,12,'2024-03-18','2024-03-18 09:03:13','DELETE'),(7,6,2,'er',7,12,'2024-03-18','2024-03-18 09:09:49','DELETE'),(8,7,2,'rt',7,12,'2024-03-18','2024-03-18 09:09:49','DELETE');
/*!40000 ALTER TABLE `ReviewAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TokenAudit`
--

DROP TABLE IF EXISTS `TokenAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TokenAudit` (
  `idTokenAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `type` varchar(450) NOT NULL,
  `created` datetime NOT NULL,
  `user_FK` int NOT NULL,
  `date_Audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idTokenAudit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TokenAudit`
--

LOCK TABLES `TokenAudit` WRITE;
/*!40000 ALTER TABLE `TokenAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `TokenAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAudit`
--

DROP TABLE IF EXISTS `UserAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserAudit` (
  `idUserAudit` int NOT NULL AUTO_INCREMENT,
  `code_PK` int NOT NULL,
  `firstName` varchar(450) NOT NULL,
  `lastName` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `isAdmin` tinyint NOT NULL,
  `date_audit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_audit` varchar(450) NOT NULL,
  PRIMARY KEY (`idUserAudit`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAudit`
--

LOCK TABLES `UserAudit` WRITE;
/*!40000 ALTER TABLE `UserAudit` DISABLE KEYS */;
INSERT INTO `UserAudit` VALUES (1,1,'Daniel','Batista','qwe',0,'2024-03-07 09:37:48','UPDATE'),(2,3,'Finiferp','B','noemail',0,'2024-03-07 09:37:48','UPDATE'),(3,4,'John','Doe','1',0,'2024-03-07 09:37:48','UPDATE'),(4,6,'Finiferp','Batista','docda940@school.lu',0,'2024-03-08 10:21:58','DELETE'),(5,1,'Daniel','Batista','docda940@school.lu',1,'2024-03-08 10:21:58','UPDATE'),(6,2,'Ultra','Admin','docda940@school.lu',1,'2024-03-08 10:21:58','UPDATE'),(7,3,'Finiferp','B','docda940@school.lu',0,'2024-03-08 10:21:58','UPDATE'),(8,4,'John','Doe','docda940@school.lu',0,'2024-03-08 10:21:58','UPDATE'),(9,7,'Daniel','Do Canto Batista','daniel-batista22@hotmail.com',0,'2024-03-11 08:00:44','UPDATE'),(10,5,'Finiferp','Batista','docda940@school.lu',0,'2024-03-15 11:04:51','UPDATE'),(11,1,'Daniel','Batista','docda940@school.lu1',1,'2024-03-18 09:30:36','DELETE'),(12,3,'Finiferp','B','docda940@school.lu3',0,'2024-03-18 09:30:36','DELETE'),(13,4,'John','Doe','docda940@school.lu4',0,'2024-03-18 09:30:36','DELETE'),(14,5,'Finiferp','Batista','docda940@school.lu0',0,'2024-03-18 09:30:36','DELETE'),(15,2,'Ultra','Admin','docda940@school.lu2',1,'2024-03-18 09:30:36','UPDATE'),(16,7,'Daniel','Do Canto Batista','daniel-batista22@hotmail.com',1,'2024-03-18 09:31:48','UPDATE'),(17,2,'Ultra','Admin','docda940@school.lu',1,'2024-03-18 09:39:04','UPDATE'),(18,7,'Daniel','Do Canto Batista','daniel-batista22@hotmail.com',0,'2024-03-19 10:39:37','UPDATE'),(19,7,'Daniel','Batista','daniel-batista22@hotmail.com',0,'2024-03-22 10:16:33','UPDATE'),(20,9,'Sarah','THOSS','david.thoss@btsi.lu',0,'2024-03-28 06:17:50','DELETE'),(22,12,'Sarah','THOSS','david.thoss@btsi.lu',0,'2024-03-28 07:13:17','DELETE'),(23,14,'Jossi','Tester','deng@asd.de',0,'2024-03-28 07:22:59','DELETE'),(24,15,'Josi','rst','q2@e.de',0,'2024-03-28 07:23:51','DELETE'),(25,16,'Daniel','Do Canto Batista','daniel-batista2002@hotmail.com',0,'2024-03-28 09:36:14','DELETE'),(26,17,'Max ','Mustermann','docda940@school.lu',0,'2024-03-28 10:36:57','DELETE'),(27,18,'eqw','eqwe','daniel-batista2002@hotmail.com',0,'2024-03-28 10:42:30','DELETE'),(28,20,'324','asd','daniel-batista2002@hotmail.com',0,'2024-03-28 10:52:02','DELETE'),(29,19,'Max','Mustermann','docda940@school.lu',0,'2024-03-28 10:52:02','DELETE'),(30,13,'Sarah','THOSS','david.thoss@btsi.lu',0,'2024-03-28 12:08:40','DELETE');
/*!40000 ALTER TABLE `UserAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Events4uAuditLogs'
--

--
-- Dumping routines for database 'Events4uAuditLogs'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAttendsAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getAttendsAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idAttendsAudit', idAttendsAudit,
            'event_code_attends_PKFK', event_code_attends_PKFK,
            'user_code_attends_PKFK', user_code_attends_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM AttendsAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getBelongsAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getBelongsAudit`(OUT ouputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idBelongsAudit', idBelongsAudit,
            'event_code_belongs_PKFK', event_code_belongs_PKFK,
            'category_code_belongs_PKFK', category_code_belongs_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM `BelongsAudit`);
    SET ouputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCategoryAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getCategoryAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idCategoryAudit', idCategoryAudit,
            'code_PK', code_PK,
            'label', label,
            'date_Audit', date_Audit,
            'action_audit', action_audit
        )
    ) FROM CategoryAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEventAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getEventAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idEventAudit', idEventAudit,
            'code_PK', code_PK,
            'title', title,
            'startDateTime', startDateTime,
            'endDateTime', endDateTime,
            'price', price,
            'created', created,
            'owner_FK', owner_FK,
            'imageURL', imageURL,
            'isVisible', isVisible,
            'location_FK', location_FK,
            'group_view_FK', group_view_FK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM EventAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getFavoriteAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getFavoriteAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idFavoriteAudit', idFavoriteAudit,
            'user_code_favorite_PKFK', user_code_favorite_PKFK,
            'event_code_favorite_PKFK', event_code_favorite_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM FavoriteAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getGroupAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idGroupAudit', idGroupAudit,
            'code_PK', code_PK,
            'name', name,
            'owner_FK', owner_FK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM GroupAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getInterestedAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getInterestedAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;

    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idInterestedAudit', idInterestedAudit,
            'event_code_interested_PKFK', event_code_interested_PKFK,
            'user_code_attends_PKFK', user_code_attends_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM InterestedAudit);

    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getLocationAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getLocationAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idLocationAudit', idLocationAudit,
            'code_PK', code_PK,
            'adress', adress,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM LocationAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getPartOfAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getPartOfAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idPartOfAudit', idPartOfAudit,
            'code_group_partOf_PKFK', code_group_partOf_PKFK,
            'code_user_partOf_PKFK', code_user_partOf_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM PartOfAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getReviewAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getReviewAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idReviewAudit', idReviewAudit,
            'code_PK', code_PK,
            'stars', stars,
            'review', review,
            'user_code_review_FK', user_code_review_FK,
            'event_code_describes_FK', event_code_describes_FK,
            'creationDate', creationDate,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM ReviewAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getUserAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idUserAudit', idUserAudit,
            'code_PK', code_PK,
            'firstName', firstName,
            'lastName', lastName,
            'email', email,
            'isAdmin', isAdmin,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM UserAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getViewAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getViewAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idViewAudit', idViewAudit,
            'code_group_view_PKFK', code_group_view_PKFK,
            'code_event_view_PKFK', code_event_view_PKFK,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM ViewAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `Events4u`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Events4u` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Events4u`;

--
-- Table structure for table `AplliedFor`
--

DROP TABLE IF EXISTS `AplliedFor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AplliedFor` (
  `user_code_appliedFor_PKFK` int NOT NULL,
  `group_code_appliedFor_PKFK` int NOT NULL,
  `message` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`user_code_appliedFor_PKFK`,`group_code_appliedFor_PKFK`),
  KEY `group_code_appliedFor_PKFK_idx` (`group_code_appliedFor_PKFK`),
  CONSTRAINT `group_code_appliedFor_PKFK` FOREIGN KEY (`group_code_appliedFor_PKFK`) REFERENCES `Group` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_appliedFor_PKFK` FOREIGN KEY (`user_code_appliedFor_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AplliedFor`
--

LOCK TABLES `AplliedFor` WRITE;
/*!40000 ALTER TABLE `AplliedFor` DISABLE KEYS */;
/*!40000 ALTER TABLE `AplliedFor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attends`
--

DROP TABLE IF EXISTS `Attends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attends` (
  `event_code_attends_PKFK` int NOT NULL,
  `user_code_attends_PKFK` int NOT NULL,
  PRIMARY KEY (`event_code_attends_PKFK`,`user_code_attends_PKFK`),
  KEY `user_code_interested_PKFK_idx` (`user_code_attends_PKFK`),
  KEY `event_code_attends_PKFK_idx` (`event_code_attends_PKFK`),
  CONSTRAINT `event_code_attends_PKFK` FOREIGN KEY (`event_code_attends_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_attends_PKFK` FOREIGN KEY (`user_code_attends_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attends`
--

LOCK TABLES `Attends` WRITE;
/*!40000 ALTER TABLE `Attends` DISABLE KEYS */;
INSERT INTO `Attends` VALUES (2,2),(3,7),(2,8);
/*!40000 ALTER TABLE `Attends` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_attendsBeforeUpdate` BEFORE UPDATE ON `Attends` FOR EACH ROW BEGIN
    IF NOT(
        NEW.event_code_attends_PKFK <=> OLD.event_code_attends_PKFK AND
        NEW.user_code_attends_PKFK <=> OLD.user_code_attends_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`AttendsAudit`
        VALUES (
            NULL,
            OLD.event_code_attends_PKFK,
            OLD.user_code_attends_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_attendsBeforeDelete` BEFORE DELETE ON `Attends` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`AttendsAudit`
    VALUES (
        NULL,
        OLD.event_code_attends_PKFK,
        OLD.user_code_attends_PKFK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Belongs`
--

DROP TABLE IF EXISTS `Belongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Belongs` (
  `event_code_belongs_PKFK` int NOT NULL,
  `category_code_belongs_PKFK` int NOT NULL,
  PRIMARY KEY (`event_code_belongs_PKFK`,`category_code_belongs_PKFK`),
  KEY `category_code_belongs_PKFK_idx` (`category_code_belongs_PKFK`),
  CONSTRAINT `category_code_belongs_PKFK` FOREIGN KEY (`category_code_belongs_PKFK`) REFERENCES `Category` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_code_belongs_PKFK` FOREIGN KEY (`event_code_belongs_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Belongs`
--

LOCK TABLES `Belongs` WRITE;
/*!40000 ALTER TABLE `Belongs` DISABLE KEYS */;
INSERT INTO `Belongs` VALUES (11,7),(2,8),(3,8),(7,8),(10,8),(11,8),(8,9),(2,10),(8,10),(4,11),(7,12),(12,12),(14,12);
/*!40000 ALTER TABLE `Belongs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_belongsBeforeUpdate` BEFORE UPDATE ON `Belongs` FOR EACH ROW BEGIN
    IF NOT(
        NEW.event_code_belongs_PKFK <=> OLD.event_code_belongs_PKFK AND
        NEW.category_code_belongs_PKFK <=> OLD.category_code_belongs_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`BelongsAudit`
        VALUES (
            NULL,
            OLD.event_code_belongs_PKFK,
            OLD.category_code_belongs_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_belongsBeforeDelete` BEFORE DELETE ON `Belongs` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`BelongsAudit`
    VALUES (
        NULL,
        OLD.event_code_belongs_PKFK,
        OLD.category_code_belongs_PKFK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `label` varchar(450) NOT NULL,
  PRIMARY KEY (`code_PK`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (7,'Business'),(8,'Concert'),(9,'Exhibition'),(10,'Mettup'),(11,'Party & Nightlife'),(12,'Sport'),(13,'Other ');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_categoryBeforeUpdate` BEFORE UPDATE ON `Category` FOR EACH ROW BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.label <=> OLD.label
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`CategoryAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.label,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_categoryBeforeDelete` BEFORE DELETE ON `Category` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`CategoryAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.label,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `title` varchar(450) NOT NULL,
  `startDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `owner_FK` int NOT NULL,
  `imageUrl` varchar(450) NOT NULL,
  `isVisible` tinyint NOT NULL DEFAULT '1',
  `location_FK` int NOT NULL,
  `group_view_FK` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_PK`),
  KEY `owner_FK_idx` (`owner_FK`),
  KEY `location_FK_idx` (`location_FK`),
  KEY `group_view_FK_idx` (`group_view_FK`),
  CONSTRAINT `group_view_FK` FOREIGN KEY (`group_view_FK`) REFERENCES `Group` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loaction_FK` FOREIGN KEY (`location_FK`) REFERENCES `Location` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `owner_FK` FOREIGN KEY (`owner_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (2,'Brasil Game Show','2024-03-29 07:00:00','2024-02-26 11:00:00',25,'2024-02-21 07:09:58',8,'http://192.168.129.237:3000/assets/images/Brasil Game Show/1711093760166-Brasil Game Show.png',1,1,1),(3,'Fête de la Musique Dudelange','2024-02-26 01:00:00','2024-02-26 05:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Fête de la Musique Dudelange/1711093664172-Fête de la Musique Dudelange.png',1,1,1),(4,'Nuit de la Culture','2024-02-26 08:00:00','2024-02-26 12:00:00',12,'2024-02-21 07:09:58',7,'http://192.168.129.237:3000/assets/images/Nuit de la Culture/1711093401101-Nuit de la Culture.png',1,1,1),(7,'Dudelange on Wheels','2024-03-08 08:00:00','2024-02-26 12:00:00',12,'2024-03-09 07:08:58',7,'assets/images/dow.jpg',1,1,1),(8,'Gamescon','2024-02-01 01:41:00','2024-02-08 09:41:00',54,'2024-02-26 15:33:09',7,'http://192.168.129.237:3000/assets/images/Gamescon/1711093109314-Gamescon.png',1,1,1),(10,'Tomorrowland','2024-03-08 00:00:00','2024-02-26 04:00:00',25,'2024-03-06 07:26:28',7,'http://192.168.129.237:3000/assets/images/Tomorrowland/1711092428426-Tomorrowland.png',1,7,1),(11,'Olympic Games','2024-02-26 06:00:00','2024-02-26 10:00:00',25,'2024-03-06 07:26:42',7,'http://192.168.129.237:3000/assets/images/Olympic Games/1711094043148-Olympic Games.png',1,1,3),(12,'League of Legends World Championship','2024-03-13 08:33:00','2024-03-08 08:33:00',78,'2024-03-18 08:49:20',8,'http://192.168.129.237:3000/assets/images/lol/1710751761156-lol.png',1,5,1),(14,'League of Legends Season 2024','2024-03-13 07:33:00','2024-03-08 07:33:00',78,'2024-03-22 10:11:46',8,'http://192.168.129.237:3000/assets/images/League of Legends Season 2024/1711102308051-League of Legends Season 2024.png',1,5,1);
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_eventBeforeUpdate` BEFORE UPDATE ON `Event` FOR EACH ROW BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.title <=> OLD.title AND
        NEW.startDateTime <=> OLD.startDateTime AND
        NEW.endDateTime <=> OLD.endDateTime AND
        NEW.price <=> OLD.price AND
        NEW.created <=> OLD.created AND
        NEW.owner_FK <=> OLD.owner_FK AND
        NEW.imageUrl <=> OLD.imageUrl AND
        NEW.isVisible <=> OLD.isVisible ANd
        NEW.location_FK <=> OLD.location_FK AND
        NEW.group_view_FK <=> OLD.group_view_FK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`EventAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.title,
            OLD.startDateTime,
            OLD.endDateTime,
            OLD.price,
            OLD.created,
            OLD.owner_FK,
            OLD.imageUrl,
            OLD.isVisible,
            OLD.location_FK,
            OLD.group_view_FK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_eventBeforeDelete` BEFORE DELETE ON `Event` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`EventAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.title,
        OLD.startDateTime,
        OLD.endDateTime,
        OLD.price,
        OLD.created,
        OLD.owner_FK,
        OLD.imageUrl,
        OLD.isVisible,
        OLD.location_FK,
        OLD.group_view_FK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Favorite`
--

DROP TABLE IF EXISTS `Favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Favorite` (
  `user_code_favorite_PKFK` int NOT NULL,
  `event_code_favorite_PKFK` int NOT NULL,
  PRIMARY KEY (`user_code_favorite_PKFK`,`event_code_favorite_PKFK`),
  KEY `event_code_favorite_PKFK_idx` (`event_code_favorite_PKFK`),
  CONSTRAINT `event_code_favorite_PKFK` FOREIGN KEY (`event_code_favorite_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_favorite_PKFK` FOREIGN KEY (`user_code_favorite_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorite`
--

LOCK TABLES `Favorite` WRITE;
/*!40000 ALTER TABLE `Favorite` DISABLE KEYS */;
INSERT INTO `Favorite` VALUES (7,2),(8,3),(7,4);
/*!40000 ALTER TABLE `Favorite` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_favorietBeforeDelete` BEFORE DELETE ON `Favorite` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`FavoriteAudit`
    VALUES (
        NULL,
        OLD.user_code_favorite_PKFK,
        OLD.event_code_favorite_PKFK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Group` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `owner_FK` int NOT NULL,
  PRIMARY KEY (`code_PK`),
  KEY `owner_group_FK_idx` (`owner_FK`),
  CONSTRAINT `owner_group_FK` FOREIGN KEY (`owner_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Group`
--

LOCK TABLES `Group` WRITE;
/*!40000 ALTER TABLE `Group` DISABLE KEYS */;
INSERT INTO `Group` VALUES (1,'All',2),(2,'Informatics',7),(3,'BTSi',7),(4,'Presentaion-Events4U',8);
/*!40000 ALTER TABLE `Group` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_groupBeforeUpdate` BEFORE UPDATE ON `Group` FOR EACH ROW BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.name <=> OLD.name AND
        NEW.owner_FK <=> OLD.owner_FK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`GroupAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.name,
            OLD.owner_FK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_groupBeforeDelete` BEFORE DELETE ON `Group` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`GroupAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.name,
        OLD.owner_FK,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Interested`
--

DROP TABLE IF EXISTS `Interested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interested` (
  `event_code_interested_PKFK` int NOT NULL,
  `user_code_interested_PKFK` int NOT NULL,
  PRIMARY KEY (`event_code_interested_PKFK`,`user_code_interested_PKFK`),
  KEY `user_code_interested_PKFK_idx` (`user_code_interested_PKFK`),
  KEY `event_code_interested_PKFK_idx` (`event_code_interested_PKFK`),
  CONSTRAINT `event_code_interested_PKFK` FOREIGN KEY (`event_code_interested_PKFK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_interested_PKFK` FOREIGN KEY (`user_code_interested_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interested`
--

LOCK TABLES `Interested` WRITE;
/*!40000 ALTER TABLE `Interested` DISABLE KEYS */;
INSERT INTO `Interested` VALUES (11,7);
/*!40000 ALTER TABLE `Interested` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_interestedBeforeUpdate` BEFORE UPDATE ON `Interested` FOR EACH ROW BEGIN
    IF NOT(
        NEW.user_code_interested_PKFK <=> OLD.user_code_interested_PKFK AND
        NEW.user_code_interested_PKFK <=> OLD.user_code_interested_PKFK
    ) THEN
        INSERT INTO `Events4uAuditLogs`.`InterestedAudit`
        VALUES (
            NULL,
            OLD.user_code_interested_PKFK,
            OLD.user_code_interested_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_interestedBeforeDelete` BEFORE DELETE ON `Interested` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`InterestedAudit`
       VALUES (
          NULL,
          OLD.user_code_interested_PKFK,
          OLD.user_code_interested_PKFK,
          CURRENT_TIMESTAMP,
          "DELETE"
       );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `adress` varchar(450) NOT NULL,
  PRIMARY KEY (`code_PK`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'2 rue René Hartmann, 3425 Dudelange'),(2,'123 Main St'),(3,'26 Rue Pierre Dupong, 3449 Dudelange'),(5,'55 Rue Stade John F. Kennedy, 3502 Dudelange'),(6,'WOA Festival GmbH, Schenefelder Str. 17, 25596 Wacken, Germany'),(7,'PRC de Schorre Schommelei 2850 Boom, Belgium');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_locationBeforeUpdate` BEFORE UPDATE ON `Location` FOR EACH ROW BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.adress <=> OLD.adress
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`LocationAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.adress,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_locationBeforeDelete` BEFORE DELETE ON `Location` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`LocationAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.adress,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `LuxId_Mapping`
--

DROP TABLE IF EXISTS `LuxId_Mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LuxId_Mapping` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `sub` varchar(500) NOT NULL,
  `userMapping_FK` int NOT NULL,
  PRIMARY KEY (`code_PK`),
  KEY `userMapping_FK_idx` (`userMapping_FK`),
  CONSTRAINT `userMapping_FK` FOREIGN KEY (`userMapping_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LuxId_Mapping`
--

LOCK TABLES `LuxId_Mapping` WRITE;
/*!40000 ALTER TABLE `LuxId_Mapping` DISABLE KEYS */;
INSERT INTO `LuxId_Mapping` VALUES (1,'8170deaf-39d0-4a8c-bf66-a6f90e1ec05d',8),(4,'36830e25-00d8-42f4-a114-8051ba267fd1',24);
/*!40000 ALTER TABLE `LuxId_Mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartOf`
--

DROP TABLE IF EXISTS `PartOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PartOf` (
  `code_group_partOf_PKFK` int NOT NULL,
  `code_user_partOf_PKFK` int NOT NULL,
  PRIMARY KEY (`code_group_partOf_PKFK`,`code_user_partOf_PKFK`),
  KEY `code_user_partOf_PKFK_idx` (`code_user_partOf_PKFK`),
  CONSTRAINT `code_group_partOf_PKFK` FOREIGN KEY (`code_group_partOf_PKFK`) REFERENCES `Group` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `code_user_partOf_PKFK` FOREIGN KEY (`code_user_partOf_PKFK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartOf`
--

LOCK TABLES `PartOf` WRITE;
/*!40000 ALTER TABLE `PartOf` DISABLE KEYS */;
INSERT INTO `PartOf` VALUES (3,8);
/*!40000 ALTER TABLE `PartOf` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_partOfBeforeUpdate` BEFORE UPDATE ON `PartOf` FOR EACH ROW BEGIN
    IF NOT(
        NEW.code_group_partOf_PKFK <=> OLD.code_group_partOf_PKFK AND
        NEW.code_user_partOf_PKFK <=> OLD.code_user_partOf_PKFK
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`PartOfAudit`
        VALUES (
            NULL,
            OLD.code_group_partOf_PKFK,
            OLD.code_user_partOf_PKFK,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `stars` int NOT NULL DEFAULT '1',
  `review` text NOT NULL,
  `user_code_review_FK` int NOT NULL,
  `event_code_describes_FK` int NOT NULL,
  `creationDate` date NOT NULL,
  PRIMARY KEY (`code_PK`),
  KEY `event_code_describes_FK_idx` (`event_code_describes_FK`),
  KEY `user_code_review_FK_idx` (`user_code_review_FK`),
  CONSTRAINT `event_code_describes_FK` FOREIGN KEY (`event_code_describes_FK`) REFERENCES `Event` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_code_review_FK` FOREIGN KEY (`user_code_review_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (8,3,'Best cpoied event',7,11,'2024-03-18'),(9,4,'This was a very good event.',8,3,'2024-03-22'),(10,5,'Best Gaming event ever.',8,3,'2024-03-25'),(11,5,'Good music',7,3,'2024-03-25'),(12,5,'The best gaming event I´ve ever been to.',7,12,'2024-03-28');
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_reviewBeforeUpdate` BEFORE UPDATE ON `Review` FOR EACH ROW BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.stars <=> OLD.stars AND
        NEW.review <=> OLD.review AND
        NEW.user_code_review_FK <=> OLD.user_code_review_FK AND
        NEW.event_code_describes_FK <=> OLD.event_code_describes_FK AND
        NEW.creationDate <=> OLD.creationDate
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`ReviewAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.stars,
            OLD.review,
            OLD.user_code_review_FK,
            OLD.event_code_describes_FK,
            OLD.creationDate,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_reviewBeforeDelete` BEFORE DELETE ON `Review` FOR EACH ROW BEGIN
     INSERT INTO `Events4uAuditLogs`.`ReviewAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.stars,
            OLD.review,
            OLD.user_code_review_FK,
            OLD.event_code_describes_FK,
            OLD.creationDate,
            CURRENT_TIMESTAMP,
            "DELETE"
        );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Token`
--

DROP TABLE IF EXISTS `Token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Token` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `type` varchar(1000) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_FK` int NOT NULL,
  PRIMARY KEY (`code_PK`),
  KEY `user_FK_idx` (`user_FK`),
  CONSTRAINT `user_FK` FOREIGN KEY (`user_FK`) REFERENCES `User` (`code_PK`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Token`
--

LOCK TABLES `Token` WRITE;
/*!40000 ALTER TABLE `Token` DISABLE KEYS */;
INSERT INTO `Token` VALUES (144,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmllbC1iYXRpc3RhMjJAaG90bWFpbC5jb20iLCJ1c2VySUQiOjcsImV4cCI6MTcxMTY2NDgwOSwiaWF0IjoxNzExNjIxNjA5fQ.KZXC3mE0ERkpfGbpkxkKfkmQxO4uqh33TFnggk95W5w','2024-03-28 10:26:48',7),(146,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRhbmllbC1iYXRpc3RhMjJAaG90bWFpbC5jb20iLCJ1c2VySUQiOjcsImV4cCI6MTcxMTY2NzUwMywiaWF0IjoxNzExNjI0MzAzfQ.L1DAZ-hfOc5sLLFfOory0rlZCibnMfWBngBW-Vuq0fQ','2024-03-28 11:11:43',7),(147,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImV2ZW50NHVAZGF2aWQtbmVyZHNwYWNlLm5ldCIsInVzZXJJRCI6MiwiZXhwIjoxNzExNjcyNzU2LCJpYXQiOjE3MTE2Mjk1NTZ9.hP4xVeyejBCsnnYp8g4obQ1OBnW6HeyeDVWuP-IKA9o','2024-03-28 12:39:16',2);
/*!40000 ALTER TABLE `Token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `code_PK` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(450) NOT NULL,
  `lastName` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  `salt` varchar(450) DEFAULT NULL,
  `password` varchar(10000) DEFAULT NULL,
  `acceptsNotifications` tinyint NOT NULL DEFAULT '1',
  `haveConcent` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_PK`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (2,'Ultra','Admin','event4u@david-nerdspace.net',1,'061da78552938e656c26bcb056d0a4b7d5659e95f235d6741f7a2efc6b8ed279','e17570d3af539ccab84ea3fa063886314bc27eb4f848b1c8e6be1529fae870b49d37809f7dc1fec5ed21da482a41e6baebca84ca72c5a8b551cc32336a3a1e69c436b64a3075f547ee69845ca221e0a619350dc988ee85a17dfd33e3c3a25251549adf1faabe0effc95cfffb354a4ff41af55108e588c6acaec7a3d68bc96dca',1,1),(7,'Daniel','Batista','daniel-batista22@hotmail.com',1,'a8ccfbf23b153a7bede417c4ce0181777bb4a4197143edb63b1a34b173ac85ac','4de8d79c042ed2d5960d8dd305c8f140106801e46dcf1ab2599776b9e50fb11553c1c490e8352ed7f699c107127e4a6ae06a2fdad3c617049cb3cf36d6c01f86c8c62c08031571c791a203bf53599ae00bfa36f303627348caac8b9c3ca9790d3f1506d82c6408f933915e3e2bb5296405c440ca7f7b17e0abb730f1d3dc1b49',0,1),(8,'Daniel','DO CANTO BATISTA','daniel.batista@btsi.lu',0,NULL,NULL,1,1),(11,'John','Mustermann','Mustermann@mail.lu',0,'c088e9f4d8e3980c544cddf4b7f2dcd739da49bb3a10736e628a7c904481f552','45dcf4ca7d082863e3ecf2ee0486601dc42ed75e6a605a9eee8e1f5bf4e0703ccb7a7000c1282c4206f358a75d4fdcff423ce2e3926bbb5401ff8d770c844c4718543e88e5c8d4ec44b04f8974578179f9f4f6799c7b2f61e2a6032cd13a55e479b84682645587cebaf49e68dead0cc7ab648d54c3b7c32fe39f6b9673700d27',1,1),(21,'Max','Mustermann','docda940@school.lu',0,'54664a87ac2dad7d237ed60f00de35146c44ca5bdb62a9ef098e870fae931770','d31edab50803be124a32e0507ceaef12ac29a1d18ca9264344178e01de0d0ad9aaba528605261c13605827ff0529f11c74638a8d6efd665adf9f92fb6ef65a0bf8d7276b6b7ab3a6e84503a0f9f326b9297a732356bdbb80c68714eafcf81ab5321bfe0eaa67dc8ebd65245bee12fb0f21e93bf4957055b3d5c804294456f85c',1,1),(24,'Sarah','THOSS','david.thoss@btsi.lu',0,NULL,NULL,1,1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_userBeforeUpdate` BEFORE UPDATE ON `User` FOR EACH ROW BEGIN
    IF NOT(
        NEW.code_PK <=> OLD.code_PK AND
        NEW.firstName <=> OLD.firstName AND
        NEW.lastName <=> OLD.lastName AND
        NEW.email <=> OLD.email AND
        NEW.isAdmin <=> OLD.isAdmin
    ) THEN 
        INSERT INTO `Events4uAuditLogs`.`UserAudit`
        VALUES (
            NULL,
            OLD.code_PK,
            OLD.firstName,
            OLD.lastName,
            OLD.email,
            OLD.isAdmin,
            CURRENT_TIMESTAMP,
            "UPDATE"
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`daniel`@`%`*/ /*!50003 TRIGGER `tr_userBeforeDelete` BEFORE DELETE ON `User` FOR EACH ROW BEGIN
    INSERT INTO `Events4uAuditLogs`.`UserAudit`
    VALUES (
        NULL,
        OLD.code_PK,
        OLD.firstName,
        OLD.lastName,
        OLD.email,
        OLD.isAdmin,
        CURRENT_TIMESTAMP,
        "DELETE"
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'Events4u'
--

--
-- Dumping routines for database 'Events4u'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_addReview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_addReview`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_stars INT;
    DECLARE input_review TEXT;
    DECLARE input_date TEXT;
    DECLARE input_userID INT;
    DECLARE input_eventID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "stars": {"type": "number"}, 
                                    "review": {"type": "string"},
                                    "date": {"type": "string"},
                                    "userID": {"type": "number"},
                                    "eventID": {"type": "number"}
                                }, 
                                "required": ["stars", "review", "userID", "eventID", "date"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_stars = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.stars'));
        SET input_review = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.review'));
        SET input_date = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.date'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        INSERT INTO Review (stars, review, user_code_review_FK, event_code_describes_FK, creationDate) 
        VALUES (input_stars, input_review, input_userID, input_eventID, input_date);
        SET response_message = 'Review created successfully';
        SET response_code = 200;
    END IF;
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_addUserAndMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_addUserAndMapping`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_userId INT;
    DECLARE input_firstName VARCHAR(450);
    DECLARE input_lastName VARCHAR(450);
    DECLARE input_email VARCHAR(450);
    DECLARE input_sub VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT DEFAULT 200;
    DECLARE response_message VARCHAR(255) DEFAULT 'User and mapping created successfully';
    -- Define JSON Schema for input validation
    SET v_JSONSchema = '{"type": "object", 
                            "properties": {
                                "firstName": {"type": "string"},
                                "lastName": {"type": "string"},
                                "email": {"type": "string"},
                                "sub": {"type": "string"}
                            }, "required": ["firstName", "lastName", "email", "sub"]}';
    -- Validate input JSON
    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format';
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                     'message', response_message);
    ELSE
        -- Extract values from input JSON
        SET input_firstName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.firstName'));
        SET input_lastName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.lastName'));
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_sub = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.sub'));
        -- Insert new User
        INSERT INTO User(firstName, lastName, email)
        VALUES (input_firstName, input_lastName, input_email);
        -- Get the ID of the newly inserted User
        SET v_userId = LAST_INSERT_ID();
        -- Insert new LuxId_Mapping
        INSERT INTO LuxId_Mapping(sub, userMapping_FK)
        VALUES (input_sub, v_userId);
        -- Prepare output JSON
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                     'message', response_message,
                                     'data', JSON_OBJECT('userId', v_userId));
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_addUserToGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_addUserToGroup`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE groupID INT;
    DECLARE userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    DECLARE v_groupExists INT;
    DECLARE v_userExists INT;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"},
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["groupID", "userID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SELECT COUNT(*) INTO v_groupExists FROM `Group` WHERE code_PK = groupID;
        IF v_groupExists = 0 THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
        ELSE
            SELECT COUNT(*) INTO v_userExists FROM `User` WHERE code_PK = userID;
            IF v_userExists = 0 THEN
                SET response_code = 404;
                SET response_message = 'User does not exist';
            ELSE
                IF EXISTS (SELECT 1 FROM `PartOf` WHERE code_group_partOf_PKFK = groupID AND code_user_partOf_PKFK = userID) THEN
                    SET response_code = 400;
                    SET response_message = 'User is already part of the group';
                ELSE
                    INSERT INTO `PartOf` (code_group_partOf_PKFK, code_user_partOf_PKFK) VALUES (groupID, userID);
                    SET response_code = 200;
                    SET response_message = 'User added to the group successfully';
                END IF;
            END IF;
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_applyForGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_applyForGroup`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_userID INT;
    DECLARE input_groupID INT;
    DECLARE input_message VARCHAR(450);
    SET v_JSONSchema ='{"type": "object",
                              "properties": {
                                  "userID": {"type": "number"},
                                  "groupID" : {"type": "number"},
                                  "message" : {"type": "string"}
                              }, 
                              "required": ["userID", "groupID"] 
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = "Invalid JSON format";
        SET outputJSON = JSON_OBJECT("code", response_code, "message", response_message);
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, "$.userID"));
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, "$.groupID"));
        SET input_message = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, "$.message"));
        INSERT INTO AplliedFor (user_code_appliedFor_PKFK, group_code_appliedFor_PKFK,message)
        VALUES (input_userID, input_groupID, input_message);
        SET response_code = 200;
        SET response_message = "Applied for group successfully";
        SET outputJSON = JSON_OBJECT("status_code", response_code, "message", response_message);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkIfAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_checkIfAdmin`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_activeUser INT;
    DECLARE response_code INT;
    DECLARE isAdminStatus INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "activeUser": {"type": "number"}
                                }, 
                                "required": ["activeUser"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_OBJECT());
    ELSE
        SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.activeUser'));
        SET response_code = 200;
        SET response_message = 'Success';
        SELECT isAdmin INTO isAdminStatus FROM `User` WHERE code_PK = input_activeUser;
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message,
                                    'data', JSON_OBJECT(
                                        'isAdmin', isAdminStatus
                                    )
                                );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkIfLuxIdExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_checkIfLuxIdExists`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE userId INT;
    DECLARE input_sub VARCHAR(255);
    DECLARE existsFlag INT DEFAULT 0;
    SET v_JSONSchema = '{"type": "object", 
                            "properties": {
                                "sub": {"type": "string"}
                            },
                        "required": ["sub"]
                        }';
    IF NOT JSON_SCHEMA_VALID(JSON_EXTRACT(inputJSON, '$'), v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format';
    ELSE
        SET input_sub = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.sub'));
        -- Check if sub exists
        SELECT COUNT(*) INTO existsFlag
        FROM LuxId_Mapping
        WHERE sub = input_sub;
        IF existsFlag = 0 THEN
            SET response_code = 404;
            SET response_message = 'Not found';
            SET response_data = JSON_OBJECT('exists', 'false',
                                            'userId', "-1" );
        ELSE
            SELECT userMapping_FK into userId
            FROM LuxId_Mapping
            WHERE sub = input_sub;
            SET response_code = 200;
            SET response_message = 'OK';
            SET response_data = JSON_OBJECT('userId', userId,
                                            'exists', 'true' );
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkIfUserExists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_checkIfUserExists`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_email VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "email": {"type": "string"}
                                },
                                "required": ["email"]
                        }';
        IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
            SET outputJSON = JSON_OBJECT(
                'status_code', 400,
                'message', 'Invalid JSON format or structure'
            );
        ELSE
            SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
            IF EXISTS(SELECT * FROM User WHERE email = input_email) THEN
                SET outputJSON = JSON_OBJECT(
                    'status_code', 200,
                    'message', 'User exists'
                );
            ELSE
                SET outputJSON = JSON_OBJECT(
                    'status_code', 404,
                    'message', 'User does not exist'
                );
            END IF;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_checkToken`(IN p_token VARCHAR(1000), OUT outputJSON JSON)
BEGIN
    DECLARE token_exists INT;
    DECLARE token_ID INT;
    SELECT COUNT(*) INTO  token_exists
    FROM Token
    WHERE type = p_token;
    SELECT code_PK INTO token_ID
    FROM Token
    WHERE type = p_token;
    SET outputJSON = JSON_OBJECT('result', token_exists, 'id', token_ID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_createEvent`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_title VARCHAR(450);
    DECLARE input_startDateTime DATETIME;
    DECLARE input_endDateTime DATETIME;
    DECLARE input_price INT;
    DECLARE input_location INT;
    DECLARE input_ownerID INT;
    DECLARE input_imageUrl VARCHAR(450);
    DECLARE input_group INT;
    DECLARE v_last_eventID INT;
    DECLARE category_list VARCHAR(10000);
    DECLARE category_name VARCHAR(450);
    DECLARE category_id INT;
    DECLARE category_cursor CURSOR FOR SELECT code_PK FROM Category WHERE label = category_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET category_id = NULL;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "title": {"type": "string"}, 
                                    "startDateTime": {"type": "string"},
                                    "endDateTime": {"type": "string"},
                                    "price": {"type": "number"},
                                    "location_FK": {"type": "number"},
                                    "ownerId": {"type": "number"},
                                    "categories": {"type": "string"},
                                    "imageUrl": {"type": "string"},
                                    "group": {"type": "number"}
                                }, 
                                "required": ["title", "startDateTime", "endDateTime", "price", "location_FK", "ownerId", "categories", "imageUrl", "group" ] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_title = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.title'));
        SET input_startDateTime = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.startDateTime'));
        SET input_endDateTime = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.endDateTime'));
        SET input_price = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.price'));
        SET input_location = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.location_FK'));
        SET input_ownerID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.ownerId'));
        SET category_list = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.categories'));
        SET input_imageUrl = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.imageUrl'));
        SET input_group = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.group'));
        START TRANSACTION;
            INSERT INTO Event (title, startDateTime, endDateTime, price, location_FK, owner_FK, imageUrl, group_view_FK) 
            VALUES (input_title, input_startDateTime, input_endDateTime, input_price, input_location, input_ownerID, input_imageUrl, input_group);
            SET v_last_eventID = LAST_INSERT_ID();
            category_loop: LOOP
                SET category_name = TRIM(SUBSTRING_INDEX(category_list, ',', 1));
                IF category_name = '' THEN
                    LEAVE category_loop;
                END IF;
                OPEN category_cursor;
                FETCH category_cursor INTO category_id;
                CLOSE category_cursor;
                IF category_id IS NOT NULL THEN
                    INSERT INTO Belongs (event_code_belongs_PKFK, category_code_belongs_PKFK)
                    VALUES (v_last_eventID, category_id);
                END IF;
                SET category_list = TRIM(BOTH ',' FROM SUBSTRING(category_list, LENGTH(category_name) + 2));
            END LOOP category_loop;
        COMMIT;
            SET response_message = 'Event created successfully';
            SET response_code = 200;
        END IF;
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_createGroup`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_name VARCHAR(255);
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "name": {"type": "string"},
                                    "userID": {"type": "number"}
                                },
                                "required": ["name", "userID"]
                        }';
   IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        );
    ELSE
        SET input_name = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.name'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
            INSERT INTO  `Group` (`name`, owner_FK) VALUES (input_name, input_userID);
        SET response_message = 'Group created successfully';
        SET response_code = 200;
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_createLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_createLocation`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_adress VARCHAR(450);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "adress": {"type": "string"}
                                }, 
                                "required": ["adress"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_adress = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.adress'));
        INSERT INTO Location (adress) 
        VALUES (input_adress);
        SET response_message = 'Adress created successfully';
        SET response_code = 200;
    END IF;
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_declineGroupDemands` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_declineGroupDemands`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_groupID INT;
    DECLARE input_userID INT;
    DECLARE v_JSONSchema JSON;
     SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"},
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["groupID", "userID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        DELETE FROM `AplliedFor`
        WHERE `group_code_appliedFor_PKFK` = input_groupID AND `user_code_appliedFor_PKFK` = input_userID;
        SET response_code = 200;
        SET response_message = 'Success';
    END IF;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_deleteEvent`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
      DECLARE v_JSONSchema JSON;
      DECLARE response_code INT;
      DECLARE response_message VARCHAR(255);
      DECLARE input_eventID INT;
      SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventID": {"type": "number"}
                                }, 
                                "required": ["eventID"] 
                        }';
      IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
            SET response_code = 400;
            SET response_message = 'Invalid JSON format or structure';
      ELSE
            SET input_eventID = JSON_EXTRACT(inputJSON, '$.eventID');
            DELETE FROM Event WHERE code_PK = input_eventID;
            IF ROW_COUNT() > 0 THEN
                  SET response_message = 'Event deleted successfully';
                  SET response_code = 200;
            ELSE
                  SET response_message = 'Event not found or already deleted';
                  SET response_code = 404;
            END IF;
      END IF;
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_deleteToken`(IN inputJSON JSON)
BEGIN
    DECLARE input_id INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "id": {"type": "number"}
                                },
                                "required": ["id"]
                        }';
        IF JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN

            SET input_id = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.id'));
            DELETE FROM Token t WHERE t.code_PK = input_id;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_exportList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_exportList`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE attending_users_json JSON;
    DECLARE interested_users_json JSON;
    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"}
                              },
                              "required": ["eventID"]
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET response_code = 200;
        SET response_message = 'Success';
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET attending_users_json = (
            SELECT JSON_OBJECT(
                'attending_users', JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                )
            )
            FROM User u
            JOIN Attends a ON u.code_PK = a.user_code_attends_PKFK
            WHERE a.event_code_attends_PKFK = input_eventID
        );
        SET interested_users_json = (
            SELECT JSON_OBJECT(
                'interested_users', JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                )
            )
            FROM User u
            JOIN Interested i ON u.code_PK = i.user_code_interested_PKFK
            WHERE i.event_code_interested_PKFK = input_eventID
        );
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message,
                                    'attending_users', attending_users_json,
                                    'interested_users', interested_users_json);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAllGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getAllGroups`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_userID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';
   IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = "Invalid JSON format";
        SET response_data = NULL;
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SET response_code = 200;
        SET response_message = 'OK';
        SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'group_code_PK', g.code_PK,
                        'group_name', g.name,
                        'owner_name', CONCAT(u.firstName, ' ', u.lastName),
                        'applied_for',( 
                                CASE 
                                    WHEN af.user_code_appliedFor_PKFK IS NOT NULL THEN TRUE 
                                    ELSE FALSE 
                                END
                            )
                    )
                ) INTO response_data
                FROM `Group` g
                JOIN User u ON g.owner_FK = u.code_PK
               LEFT JOIN AplliedFor af ON g.code_PK = af.group_code_appliedFor_PKFK AND af.user_code_appliedFor_PKFK = input_userID

                WHERE g.`code_PK` <> 1;
    END IF;
    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', response_data);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAppliedUsersForGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getAppliedUsersForGroup`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_groupID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"}
                                }, 
                                "required": ["groupID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = "Invalid JSON format";
        SET response_data = NULL;
    ELSE
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET response_code = 200;
        SET response_message = 'OK';
        SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'userID', u.code_PK,
                        'username', CONCAT(u.firstName, ' ', u.lastName),
                        'message', af.message
                    )
                ) INTO response_data
                FROM User u
                JOIN AplliedFor af ON u.code_PK = af.user_code_appliedFor_PKFK
                WHERE af.group_code_appliedFor_PKFK = input_groupID;
    END IF;
    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', response_data);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAttendedEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getAttendedEvents`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_activeUser INT;
    DECLARE isFavorited INT;
    DECLARE currentEventID INT;
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR
        SELECT e.code_PK
        FROM Event e;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                },
                                "required": ["userID"]
                        }';
    OPEN cur;
    FETCH cur INTO currentEventID;
    SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
    SET response_code = 200;
    SET response_message = 'Success';
    SET response_data = JSON_ARRAY();
    eventLoop: LOOP
        IF done THEN
            LEAVE eventLoop;
        END IF;
         IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Favorite WHERE user_code_favorite_PKFK = input_activeUser AND event_code_favorite_PKFK = currentEventID) THEN
            SET isFavorited = 1;
        ELSE
            SET isFavorited = 0;
        END IF;
        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Attends WHERE user_code_attends_PKFK = input_activeUser AND event_code_attends_PKFK = currentEventID) THEN
            SET response_data = JSON_ARRAY_APPEND(response_data, '$', JSON_OBJECT(
                'eventCode', currentEventID,
                'eventTitle', (SELECT title FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
                'eventPrice', (SELECT price FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
                'eventIsVisible', (SELECT isVisible FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
                'eventLocation', (SELECT l.adress FROM Location l JOIN Event e ON e.location_FK = l.code_PK WHERE e.code_PK = currentEventID AND group_view_FK = 1),
                'eventImage', (SELECT imageUrl FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
                'isFavorited', isFavorited

            ));
        END IF;
        FETCH cur INTO currentEventID;
    END LOOP eventLoop;
    CLOSE cur;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code, 
        'message', response_message, 
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getCategories`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data TEXT;
    SET response_code = 200;
    SET response_message = 'Success';
    SET outputJSON = (
        SELECT JSON_OBJECT(
            'status_code', response_code,
            'message', response_message,
            'data', JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', c.code_PK,
                    'name', c.label
                )
            )
        )
        FROM Category c
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getEvent`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_eventId INT;
    DECLARE input_activeUser INT;
    DECLARE isFavorited INT DEFAULT 0;
    DECLARE isAttending INT DEFAULT 0;
    DECLARE isInterested INT DEFAULT 0;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data TEXT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventId": {"type": "integer"},
                                    "activeUser": {"type": "integer"}
                                }, 
                                "required": ["eventId", "activeUser"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_OBJECT());
    ELSE
        SET input_eventId = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventId'));
        SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.activeUser'));
        SET response_code = 200;
        SET response_message = 'Success';
        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Favorite WHERE user_code_favorite_PKFK = input_activeUser AND event_code_favorite_PKFK = input_eventId) THEN
            SET isFavorited = 1;
        ELSE
            SET isFavorited = 0;
        END IF;
        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Attends WHERE user_code_attends_PKFK = input_activeUser AND event_code_attends_PKFK = input_eventId) THEN
            SET isAttending = 1;
        ELSE
            SET isAttending = 0;
        END IF;
        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Interested WHERE user_code_interested_PKFK = input_activeUser AND event_code_interested_PKFK = input_eventId) THEN
            SET isInterested = 1;
        ELSE
            SET isInterested = 0;
        END IF;
        SET outputJSON = (
            SELECT JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', JSON_OBJECT(
                    'eventCode', e.code_PK,
                    'eventTitle', e.title,
                    'startDateTime', e.startDateTime,
                    'endDateTime', e.endDateTime,
                    'eventPrice', e.price,
                    'eventLocation', l.adress,
                    'eventLocationCode', e.location_FK,
                    'eventImage', e.imageUrl,
                    'isVisible', e.isVisible,
                    'ownerName', CONCAT(u.firstName, ' ', u.lastName),
                    'ownerCode', u.code_PK,
                    'isFavorited', isFavorited,
                    'isAttending', isAttending,
                    'isInterested', isInterested,
                    'categories', (
                        SELECT JSON_ARRAYAGG(c.label)
                        FROM Category c
                        JOIN Belongs b ON c.code_PK = b.category_code_belongs_PKFK
                        WHERE b.event_code_belongs_PKFK = e.code_PK
                    )
                )
            )
            FROM Event e
            JOIN User u ON e.owner_FK = u.code_PK
            JOIN Location l ON e.location_FK = l.code_PK
            WHERE e.code_PK = input_eventId
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getEvents`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_activeUser INT;
    DECLARE currentEventID INT;
    DECLARE isFavorited INT;
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR 
        SELECT e.code_PK
        FROM Event e;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "activeUser": {"type": "number"}
                                }, 
                                "required": ["activeUser"] 
                        }';
    OPEN cur;
    FETCH cur INTO currentEventID;
    SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.activeUser'));
    SET response_code = 200;
    SET response_message = 'Success';
    SET response_data = JSON_ARRAY();
    eventLoop: LOOP
        IF done THEN
            LEAVE eventLoop;
        END IF;
        IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Favorite WHERE user_code_favorite_PKFK = input_activeUser AND event_code_favorite_PKFK = currentEventID) THEN
            SET isFavorited = 1;
        ELSE
            SET isFavorited = 0;
        END IF;
        SET response_data = JSON_ARRAY_APPEND(response_data, '$', JSON_OBJECT(
            'eventCode', currentEventID,
            'eventTitle', (SELECT title FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'startDateTime', (SELECT startDateTime FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'endDateTime', (SELECT endDateTime FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'eventPrice', (SELECT price FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'eventIsVisible', (SELECT isVisible FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'eventLocation', (SELECT l.adress FROM Location l JOIN Event e ON e.location_FK = l.code_PK WHERE e.code_PK = currentEventID AND group_view_FK = 1),
            'eventImage', (SELECT imageUrl FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1),
            'ownerName', (SELECT CONCAT(firstName, ' ', lastName) FROM User WHERE code_PK = (SELECT owner_FK FROM Event WHERE code_PK = currentEventID AND group_view_FK = 1)),
            'isFavorited', isFavorited
        ));
        FETCH cur INTO currentEventID;
    END LOOP eventLoop;
    CLOSE cur;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code, 
        'message', response_message, 
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getEventsOnCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getEventsOnCategories`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_activeUser INT;
    DECLARE input_category INT;
    DECLARE input_title VARCHAR(255);
    DECLARE currentEventID INT;
    DECLARE isFavorited INT;
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR 
        SELECT e.code_PK
        FROM Event e;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "activeUser": {"type": "integer"},
                                    "category": {"type": "integer"},
                                    "title": {"type": "string"}
                                }, 
                                "required": ["activeUser"] 
                        }';
    OPEN cur;
    FETCH cur INTO currentEventID;
    SET input_activeUser = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.activeUser'));
    SET input_category = COALESCE(NULLIF(JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.category')), ''), -1);
    SET input_title = COALESCE(NULLIF(JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.title')), ''), '');
    SET response_code = 200;
    SET response_message = 'Success';
    SET response_data = JSON_ARRAY();
    eventLoop: LOOP
        IF done THEN
            LEAVE eventLoop;
        END IF;
        IF (input_category = -1 OR EXISTS (SELECT 1 FROM Belongs WHERE category_code_belongs_PKFK = input_category AND event_code_belongs_PKFK = currentEventID))
            AND (input_title = '' OR EXISTS (SELECT 1 FROM Event WHERE title LIKE CONCAT('%', input_title, '%') AND code_PK = currentEventID)) THEN

            IF input_activeUser <> -1 AND EXISTS (SELECT 1 FROM Favorite WHERE user_code_favorite_PKFK = input_activeUser AND event_code_favorite_PKFK = currentEventID) THEN
                  SET isFavorited = 1;
            ELSE
                  SET isFavorited = 0;
            END IF;
            SET response_data = JSON_ARRAY_APPEND(response_data, '$', JSON_OBJECT(
                  'eventCode', currentEventID,
                  'eventTitle', (SELECT title FROM Event WHERE code_PK = currentEventID AND title LIKE CONCAT('%', input_title, '%') AND group_view_FK = 1),
                  'startDateTime', (SELECT startDateTime FROM Event WHERE code_PK = currentEventID AND title LIKE CONCAT('%', input_title, '%') AND group_view_FK = 1),
                  'endDateTime', (SELECT endDateTime FROM Event WHERE code_PK = currentEventID AND title LIKE CONCAT('%', input_title, '%') AND group_view_FK = 1),
                  'eventPrice', (SELECT price FROM Event WHERE code_PK = currentEventID AND title LIKE CONCAT('%', input_title, '%') AND group_view_FK = 1),
                  'eventIsVisible', (SELECT isVisible FROM Event WHERE code_PK = currentEventID AND title LIKE CONCAT('%', input_title, '%') AND group_view_FK = 1),
                  'eventLocation', (SELECT l.adress FROM Location l JOIN Event e ON e.location_FK = l.code_PK WHERE e.code_PK = currentEventID AND e.title LIKE CONCAT('%', input_title, '%') AND e.group_view_FK = 1),
                  'eventImage', (SELECT imageUrl FROM Event WHERE code_PK = currentEventID AND title LIKE CONCAT('%', input_title, '%') AND group_view_FK = 1),
                  'ownerName', (SELECT CONCAT(firstName, ' ', lastName) FROM User WHERE code_PK = (SELECT owner_FK FROM Event WHERE code_PK = currentEventID AND title LIKE CONCAT('%', input_title, '%') AND group_view_FK = 1)),
                  'isFavorited', isFavorited
            ));
        END IF;
        FETCH cur INTO currentEventID;
    END LOOP eventLoop;
    CLOSE cur;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code, 
        'message', response_message, 
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getGroup`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_GroupID INT;
    DECLARE response_code INT;
    DECLARE response_data JSON;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"}
                                }, 
                                "required": ["groupID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_GroupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = input_GroupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
        ELSE
            SET response_message = 'Group information retrieved successfully';
            SET response_code = 200;
            SELECT JSON_OBJECT(
                    'group_code_PK', g.code_PK,
                    'group_name', g.name,
                    'owner_name', CONCAT(u.firstName, ' ', u.lastName)
                ) INTO response_data
            FROM `Group` g
            JOIN `User` u ON g.owner_FK = u.code_PK
            WHERE g.code_PK = input_GroupID;
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', response_data
            );
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getGroupEvents`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON DEFAULT NULL;
    DECLARE inputGroupID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                            "properties": {
                                "groupID": {"type": "number"}
                            },
                            "required": ["groupID"]
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET inputGroupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = inputGroupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
        ELSE
            SET response_message = 'Events retrieved successfully';
            SET response_code = 200;
            SELECT JSON_ARRAYAGG(
                       JSON_OBJECT(
                           'code_PK', e.code_PK,
                           'title', e.title,
                           'startDateTime', e.startDateTime,
                           'endDateTime', e.endDateTime,
                           'price', e.price,
                           'created', e.created,
                           'owner_FK', e.owner_FK,
                           'ownerName', CONCAT(u.firstName, ' ', u.lastName),
                           'imageUrl', e.imageUrl,
                           'isVisible', e.isVisible,
                           'location_FK', e.location_FK,
                           'group_view_FK', e.group_view_FK
                       )
                   ) INTO response_data
            FROM `Event` e
            JOIN `User` u ON e.owner_FK = u.code_PK
            WHERE e.group_view_FK = inputGroupID;
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getGroups`(IN inputJSON JSON, OUT outputJSON JSON
)
BEGIN
    DECLARE input_UserID INT;
    DECLARE response_code INT;
    DECLARE response_data JSON;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_UserID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF NOT EXISTS (SELECT 1 FROM `User` WHERE code_PK = input_UserID) THEN
            SET response_code = 404;
            SET response_message = 'User does not exist';
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
        ELSE
            SET response_message = 'Groups retrieved successfully';
            SET response_code = 200;
            SET response_data = (SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'group_code_PK', g.code_PK,
                        'group_name', g.name,
                        'owner_name', CONCAT(u.firstName, ' ', u.lastName),
                        'is_owner', CASE WHEN g.owner_FK = input_UserID THEN TRUE ELSE FALSE END

                    )
                )
            FROM `Group` g
            JOIN `User` u ON g.owner_FK = u.code_PK
            WHERE g.owner_FK = input_UserID
            OR g.code_PK IN (SELECT code_group_partOf_PKFK
                                FROM PartOf
                                WHERE code_user_partOf_PKFK = input_UserID)
            AND g.`code_PK`<>1);
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', response_data
            );
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getGroupUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getGroupUsers`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_GroupID INT;
    DECLARE response_code INT;
    DECLARE response_data JSON;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"}
                                }, 
                                "required": ["groupID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_GroupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = input_GroupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
        ELSE
            SET response_message = 'Users of the group retrieved successfully';
            SET response_code = 200;
            SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'user_code_PK', u.code_PK,
                        'user_name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                ) INTO response_data
            FROM `User` u
            JOIN `PartOf` p ON u.code_PK = p.code_user_partOf_PKFK
            WHERE p.code_group_partOf_PKFK = input_GroupID;
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', response_data
            );
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getLocationAudit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getLocationAudit`(OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    SET response_code = 200;
    SET response_message = 'Successfully retrieved';
    SET response_data = (SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
            'idLocationAudit', idLocationAudit,
            'code_PK', code_PK,
            'address', adress,
            'date_audit', date_audit,
            'action_audit', action_audit
        )
    ) FROM LocationAudit);
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getLocationEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getLocationEvents`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_locationID INT;
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "locationID": {"type": "number"},
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["locationID", "userID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
    ELSE
        SET input_locationID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.locationID'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF EXISTS (SELECT 1 FROM Location WHERE code_PK = input_locationID) THEN
            SET response_code = 200;
            SET response_message = 'Success';
            SET outputJSON = (
                SELECT JSON_OBJECT(
                    'status_code', response_code,
                    'message', response_message,
                    'data', JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'eventCode', e.code_PK,
                            'eventTitle', e.title,
                            'startDateTime', e.startDateTime,
                            'endDateTime', e.endDateTime,
                            'eventPrice', e.price,
                            'eventLocation', l.adress,
                            'eventLocationCode', e.location_FK,
                            'eventImage', e.imageUrl,
                            'eventIsVisible', e.isVisible,
                            'ownerName', CONCAT(u.firstName, ' ', u.lastName),
                            'isFavorited', IFNULL((
                                SELECT 1 
                                FROM Favorite 
                                WHERE user_code_favorite_PKFK = input_userID 
                                AND event_code_favorite_PKFK = e.code_PK
                                LIMIT 1
                            ), 0)
                        )
                    )
                )
                FROM Event e
                JOIN User u ON e.owner_FK = u.code_PK
                JOIN Location l ON e.location_FK = l.code_PK
                WHERE l.code_PK = input_locationID
                AND group_view_FK = 1
            );
        ELSE
            SET response_code = 404;
            SET response_message = 'Location not found';
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getLocations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getLocations`(OUT outputJSON JSON)
BEGIN
   SET outputJSON = (
        SELECT JSON_OBJECT(
            "status_code", "200",
            "message", "Sucessfully retirved all the locations",
            "data", JSON_ARRAYAGG(
                JSON_OBJECT(
                    "id", l.code_PK,
                    "adress", l.adress
                )
            )
        )
        FROM Location l
   );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getMyGroups` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getMyGroups`(IN inputJSON JSON, OUT outputJSON JSON
)
BEGIN
    DECLARE input_UserID INT;
    DECLARE response_code INT;
    DECLARE response_data JSON;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_UserID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF NOT EXISTS (SELECT 1 FROM `User` WHERE code_PK = input_UserID) THEN
            SET response_code = 404;
            SET response_message = 'User does not exist';
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message
            );
        ELSE
            SET response_message = 'Groups retrieved successfully';
            SET response_code = 200;
            SET response_data = (SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'group_code_PK', g.code_PK,
                        'group_name', g.name,
                        'owner_name', CONCAT(u.firstName, ' ', u.lastName)
                    )
                )
            FROM `Group` g
            JOIN `User` u ON g.owner_FK = u.code_PK
            WHERE g.owner_FK = input_UserID
            AND g.`code_PK` <> 1);
            SET outputJSON = JSON_OBJECT(
                'status_code', response_code,
                'message', response_message,
                'data', response_data
            );
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getReviews`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE currentReviewID INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE input_eventID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventID": {"type": "number"}
                                }, 
                                "required": ["eventID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET response_message = 'Review retrieved successfully';
        SET response_code = 200;
        SELECT JSON_ARRAYAGG(
               JSON_OBJECT(
                   'stars', r.stars,
                   'text', r.review,
                   'user', CONCAT(u.firstName, ' ', u.lastName),
                   'date', r.creationDate
               )
           ) INTO response_data
        FROM Review r
        JOIN User u ON r.user_code_review_FK = u.code_PK
        WHERE r.event_code_describes_FK = input_eventID;
    END IF;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message,
        'data', response_data
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSalt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getSalt`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_email VARCHAR(255);
    DECLARE stored_salt VARCHAR(255);
    DECLARE stored_userID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "email": {"type": "string"}
                                },
                                "required": ["email"]
                            }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        IF input_email = '' THEN
            SET response_code = 400;
            SET response_message = 'Invalid input';
        ELSE
            SET response_code = 200;
            SET response_message = 'OK';
            SELECT salt,code_PK INTO stored_salt,stored_userID FROM User WHERE email = input_email;
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT('response_code', response_code,
                                'response_message', response_message,
                                'salt', stored_salt,
                                'userID', stored_userID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getTokens` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getTokens`(OUT outputJSON JSON)
BEGIN
    SET outputJSON = (
        SELECT JSON_OBJECT(
            "status_code", "200",
            "message", "Sucessfully retirved all the tokens",
            "data", JSON_ARRAYAGG(
                JSON_OBJECT(
                    "token", t.type,
                    "id", t.code_PK
                )
            )
        )
        FROM Token t
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getUser`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE response_data JSON;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{ "type": "object",
                            "properties": {
                                "userID": { "type": "number" }
                            },
                            "required": ["userID"]
                        }';
    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF input_userID IS NULL THEN
            SET response_code = 400;
            SET response_message = 'Missing user ID';
        ELSE
            SET response_code = 200;
            SET response_message = 'Success';
           SELECT JSON_OBJECT(
                'userID', code_PK, 
                'firstName', firstName, 
                'lastName', lastName,
                'email', email,
                'isAdmin', isAdmin,
                'acceptsNotifications', acceptsNotifications,
                'haveConcent', haveConcent 
            )
            INTO response_data
            FROM User
            WHERE code_PK = input_userID;
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message,
                                    'data', response_data);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getUserEvents`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF EXISTS (SELECT 1 FROM User WHERE code_PK = input_userID) THEN
            SET response_code = 200;
            SET response_message = 'Success';
            SET outputJSON = (
                SELECT JSON_OBJECT(
                    'status_code', response_code,
                    'message', response_message,
                    'data', JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'eventCode', e.code_PK,
                            'eventTitle', e.title,
                            'startDateTime', e.startDateTime,
                            'endDateTime', e.endDateTime,
                            'eventPrice', e.price,
                            'eventLocation', l.adress,
                            'eventLocationCode', e.location_FK,
                            'eventImage', e.imageUrl,
                            'isVisible', e.isVisible,
                            'ownerName', CONCAT(u.firstName, ' ', u.lastName)
                        )
                    )
                )
                FROM Event e
                JOIN User u ON e.owner_FK = u.code_PK
                JOIN Location l ON e.location_FK = l.code_PK
                WHERE u.code_PK = input_userID
            );
        ELSE
            SET response_code = 404;
            SET response_message = 'User not found';
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserFavorites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getUserFavorites`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_userID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["userID"] 
                        }';
     IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF NOT EXISTS (SELECT 1 FROM `User` WHERE code_PK = input_userID) THEN
            SET response_code = 404;
            SET response_message = 'User not found';
            SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message, 'data', JSON_ARRAY());
        ELSE
            SET response_code = 200;
            SET response_message = 'Success';
            SET outputJSON = (
                SELECT JSON_OBJECT(
                    'status_code', response_code,
                    'message', response_message,
                    'data', JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'eventCode', e.code_PK,
                            'eventTitle', e.title,
                            'startDateTime', e.startDateTime,
                            'endDateTime', e.endDateTime,
                            'eventPrice', e.price,
                            'eventLocation', l.adress,
                            'eventLocationCode', e.location_FK,
                            'eventImage', e.imageUrl,
                            'eventIsVisible', e.isVisible,
                            'ownerName', CONCAT(u.firstName, ' ', u.lastName)
                        )
                    )
                )
                FROM Event e
                JOIN User u ON e.owner_FK = u.code_PK
                JOIN Favorite f ON e.code_PK = f.event_code_favorite_PKFK
                JOIN Location l ON e.location_FK = l.code_PK
                WHERE f.user_code_favorite_PKFK = input_userID
            );
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_getUsers`(OUT outputJSON JSON)
BEGIN
      DECLARE response_code INT;
      DECLARE response_message VARCHAR(255);
      DECLARE response_data JSON;
      SET response_code = 200;
      SET response_message = 'Success';
      SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
            'user_code_PK', code_PK,
            'user_name', CONCAT(firstName, ' ', lastName)
            )
        ) INTO response_data
      FROM `User`
      WHERE code_PK <> 2;
      SET outputJSON = JSON_OBJECT(
          'status_code', response_code,
          'message', response_message,
          'data', response_data
      );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_login`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_email VARCHAR(450);
    DECLARE input_password VARCHAR(450);
    DECLARE input_token VARCHAR(450);
    DECLARE stored_password VARCHAR(450);
    DECLARE stored_userID INT;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "email": {"type": "string"},
                                    "password": {"type": "string"},
                                    "token": {"type": "string"}
                                },
                                "required": ["email", "password"]
                            }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_password = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.password'));
        SET input_token = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.token'));
        IF NOT EXISTS (SELECT 1 FROM User WHERE email = input_email) THEN
            SET response_code = 404;
            SET response_message = 'User not found';
        ELSE
            SELECT code_PK, password INTO stored_userID, stored_password FROM User WHERE email = input_email;
            IF input_password = stored_password THEN
                INSERT INTO Token (type, user_FK) VALUES (input_token, stored_userID);
                SET response_code = 200;
                SET response_message = 'Login successful';
            ELSE
                SET response_code = 401;
                SET response_message = 'Wrong password';
            END IF;
        END IF;
    END IF;
    IF response_code = 200 THEN
        SET outputJSON = JSON_OBJECT(
                                'status_code', response_code,
                                'message', response_message,
                                'user', JSON_OBJECT(
                                    'userID', stored_userID,
                                    'email', input_email
                                ),
                                'token_out', input_token
                            );
    ELSE
        SET outputJSON = JSON_OBJECT('status_code', response_code,
                                    'message', response_message);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_register`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(450);
    DECLARE input_firstName VARCHAR(450);
    DECLARE input_lastName VARCHAR(450);
    DECLARE input_email VARCHAR(450);
    DECLARE input_salt VARCHAR(450);
    DECLARE input_password VARCHAR(450);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "firstName": {"type": "string"},
                                    "lastName": {"type": "string"},
                                    "email": {"type": "string"},
                                    "salt": {"type": "string"},
                                    "password": {"type": "string"}
                                },
                                "required": ["firstName", "lastName", "email", "salt", "password"]
                            }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_firstName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.firstName'));
        SET input_lastName = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.lastName'));
        SET input_email = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.email'));
        SET input_salt = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.salt'));
        SET input_password = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.password'));
        IF input_firstName = '' OR input_lastName = '' OR input_email = '' OR input_salt = '' OR input_password = '' THEN
            SET response_code = 400;
            SET response_message = 'Invalid input';
        ELSE
            SET response_code = 200;
            SET response_message = 'OK';
            INSERT INTO User (firstName, lastName, email, salt, password)
            VALUES (input_firstName, input_lastName, input_email, input_salt, input_password);
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT('status_code', response_code,
                                'message', response_message);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_reminderData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_reminderData`(OUT outputJSON JSON)
BEGIN
    DECLARE event_attendees_json JSON;
     SET event_attendees_json = (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'event_name', e.title,
                'event_code', e.code_PK,
                'attending_users', (
                    SELECT JSON_ARRAYAGG(
                        JSON_OBJECT(
                            'email', u.email,
                            'name', CONCAT(u.firstName, ' ', u.lastName)
                        )
                    )
                    FROM Attends a
                    JOIN User u ON a.user_code_attends_PKFK = u.code_PK
                    WHERE a.event_code_attends_PKFK = e.code_PK
                )
            )
        )
        FROM Event e
        WHERE DATE(e.startDateTime) = DATE_ADD(CURDATE(), INTERVAL 1 DAY)
    );
    SET outputJSON = JSON_OBJECT(
        'events', event_attendees_json
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_removeUserFromGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_removeUserFromGroup`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE groupID INT;
    DECLARE userID INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    DECLARE v_groupExists INT;
    DECLARE v_userExists INT;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"},
                                    "userID": {"type": "number"}
                                }, 
                                "required": ["groupID", "userID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SELECT COUNT(*) INTO v_groupExists FROM `Group` WHERE code_PK = groupID;
        IF v_groupExists = 0 THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
        ELSE
            SELECT COUNT(*) INTO v_userExists FROM `User` WHERE code_PK = userID;
            IF v_userExists = 0 THEN
                SET response_code = 404;
                SET response_message = 'User does not exist';
            ELSE
                IF NOT EXISTS (SELECT 1 FROM `PartOf` WHERE code_group_partOf_PKFK = groupID AND code_user_partOf_PKFK = userID) THEN
                    SET response_code = 400;
                    SET response_message = 'User is not part of the group';
                ELSE
                    DELETE FROM `PartOf` WHERE code_group_partOf_PKFK = groupID AND code_user_partOf_PKFK = userID;
                    SET response_code = 200;
                    SET response_message = 'User removed from the group successfully';
                END IF;
            END IF;
        END IF;
    END IF;
    SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_toggleAsAttending` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_toggleAsAttending`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_isAttending INT;
    DECLARE input_userID INT;
    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"},
                                  "isAttending" : {"type": "number"},
                                  "userID": {"type": "number"}
                              },
                              "required": ["eventID", "isAttending", "userID"]
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET input_isAttending = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isAttending'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF input_isAttending = 1 THEN  -- True
            INSERT INTO Attends (user_code_attends_PKFK, event_code_attends_PKFK)
            VALUES (input_userID, input_eventID);
        ELSE
            DELETE FROM Attends WHERE user_code_attends_PKFK = input_userID AND event_code_attends_PKFK = input_eventID;
        END IF;
        SET response_message = 'Attending update successfully';
        SET response_code = 200;
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_toggleAsInterested` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_toggleAsInterested`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_isInterested INT;
    DECLARE input_userID INT;
    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"},
                                  "isInterested" : {"type": "number"},
                                  "userID": {"type": "number"}
                              },
                              "required": ["eventID", "isInterested", "userID"]
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET input_isInterested = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isInterested'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF input_isInterested = 1 THEN  -- True
            INSERT INTO Interested (user_code_interested_PKFK, event_code_interested_PKFK)
            VALUES (input_userID, input_eventID);
        ELSE
            DELETE FROM Interested WHERE user_code_interested_PKFK = input_userID AND event_code_interested_PKFK = input_eventID;
        END IF;
        SET response_message = 'Interested update successfully';
        SET response_code = 200;
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_toggleFavorite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_toggleFavorite`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_isFavorited INT;
    DECLARE input_userID INT;
    SET v_JSONSchema = '{"type": "object",
                              "properties": {
                                  "eventID": {"type": "number"},
                                  "isFavorited" : {"type": "number"},
                                  "userID": {"type": "number"}
                              }, 
                              "required": ["eventID", "isFavorited", "userID"] 
                      }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET input_isFavorited = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isFavorited'));
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        IF input_isFavorited = 1 THEN  -- True
            INSERT INTO Favorite (user_code_favorite_PKFK, event_code_favorite_PKFK)
            VALUES (input_userID, input_eventID);
        ELSE
            DELETE FROM Favorite WHERE user_code_favorite_PKFK = input_userID AND event_code_favorite_PKFK = input_eventID;
        END IF;
        SET response_message = 'Favorite update successfully';
        SET response_code = 200;
        SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateConcent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_updateConcent`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE input_haveConcent INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{ "type": "object",
                            "properties": {
                                "userID": { "type": "number" },
                                "haveConcent": { "type": "number" }
                            },
                            "required": ["userID", "haveConcent"]
                        }';
    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SET input_haveConcent = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.haveConcent'));
        SET response_code = 200;
        SET response_message = 'Success';
        UPDATE User 
        SET haveConcent = input_haveConcent 
        WHERE code_PK = input_userID;
        DELETE FROM Attends
        WHERE user_code_attends_PKFK = input_userID;
        DELETE FROM Interested
        WHERE user_code_interested_PKFK = input_userID;
    END IF;
    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_updateEvent`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE v_JSONSchema JSON;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE input_eventID INT;
    DECLARE input_title VARCHAR(450);
    DECLARE input_startDateTime DATETIME;
    DECLARE input_endDateTime DATETIME;
    DECLARE input_price INT;
    DECLARE input_location INT;
    DECLARE input_imageUrl VARCHAR(450);
    DECLARE input_isVisible TINYINT;
    DECLARE input_group INT;
    DECLARE category_list VARCHAR(10000);
    DECLARE category_name VARCHAR(450);
    DECLARE category_id INT;
    DECLARE category_cursor CURSOR FOR SELECT code_PK FROM Category WHERE label = category_name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET category_id = NULL;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventID": {"type": "number"},
                                    "title": {"type": "string"}, 
                                    "startDateTime": {"type": "string"},
                                    "endDateTime": {"type": "string"},
                                    "price": {"type": "number"},
                                    "location": {"type": "number"},
                                    "categories": {"type": "string"},
                                    "imageUrl": {"type": "string"},
                                    "isVisible": {"type": "number"},
                                    "group": {"type": "number"}
                                }, 
                                "required": ["eventID", "title", "startDateTime", "endDateTime", "price", "location", "categories", "imageUrl", "isVisible"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_title = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.title'));
        SET input_startDateTime = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.startDateTime'));
        SET input_endDateTime = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.endDateTime'));
        SET input_price = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.price'));
        SET input_location = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.location'));
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET category_list = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.categories'));
        SET input_imageUrl = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.imageUrl'));
        SET input_isVisible = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.isVisible'));
        SET input_group = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.group'));
        START TRANSACTION;
            UPDATE Event 
            SET title = input_title, 
                startDateTime = input_startDateTime, 
                endDateTime = input_endDateTime, 
                price = input_price, 
                location_FK = input_location,
                imageUrl = input_imageUrl,
                isVisible = input_isVisible,
                group_view_FK = input_group
            WHERE code_PK = input_eventID;
             DELETE FROM Belongs WHERE event_code_belongs_PKFK = input_eventID;
            category_loop: LOOP
                SET category_name = TRIM(SUBSTRING_INDEX(category_list, ',', 1));
                IF category_name = '' THEN
                    LEAVE category_loop;
                END IF;
                OPEN category_cursor;
                FETCH category_cursor INTO category_id;
                CLOSE category_cursor;
                IF category_id IS NOT NULL THEN
                    INSERT INTO Belongs (event_code_belongs_PKFK, category_code_belongs_PKFK)
                    VALUES (input_eventID, category_id);
                END IF;
                SET category_list = TRIM(BOTH ',' FROM SUBSTRING(category_list, LENGTH(category_name) + 2));
            END LOOP category_loop;
        COMMIT;
            SET response_message = 'Event updated successfully';
            SET response_code = 200;
    END IF;
        SET outputJSON = JSON_OBJECT(
            'status_code', response_code,
            'message', response_message,
            'updated_eventID', input_eventID
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_updateGroup`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_groupID INT;
    DECLARE input_name VARCHAR(255);
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "groupID": {"type": "number"},
                                    "name": {"type": "string"}
                                }, 
                                "required": ["groupID", "name"]
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON format or structure';
    ELSE
        SET input_groupID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.groupID'));
        SET input_name = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.name'));
        IF NOT EXISTS (SELECT 1 FROM `Group` WHERE code_PK = input_groupID) THEN
            SET response_code = 404;
            SET response_message = 'Group does not exist';
        ELSE
            UPDATE `Group` SET name = input_name WHERE code_PK = input_groupID;
            SET response_code = 200;
            SET response_message = 'Group updated successfully';
        END IF;
    END IF;
        SET outputJSON = JSON_OBJECT(
        'status_code', response_code,
        'message', response_message
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateMailer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_updateMailer`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_eventID INT;
    DECLARE event_attendees_json JSON;
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{"type": "object",
                                "properties": {
                                    "eventID": {"type": "number"}
                                }, 
                                "required": ["eventID"] 
                        }';
    IF NOT JSON_SCHEMA_VALID(v_JSONSchema, inputJSON) THEN
        SET outputJSON = JSON_OBJECT("message", "Invalid JSON format or structure");
    ELSE
        SET input_eventID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.eventID'));
        SET event_attendees_json = (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'event_name', e.title,
                    'event_code', e.code_PK,
                    'attending_users', (
                        SELECT JSON_ARRAYAGG(
                            JSON_OBJECT(
                                'email', u.email,
                                'name', CONCAT(u.firstName, ' ', u.lastName)
                            )
                        )
                        FROM Attends a
                        JOIN User u ON a.user_code_attends_PKFK = u.code_PK
                        WHERE a.event_code_attends_PKFK = e.code_PK
                    )
                )
            )
            FROM Event e
            WHERE e.code_PK = input_eventID
        );
        SET outputJSON = JSON_OBJECT("events", event_attendees_json);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateMailPreferences` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`daniel`@`%` PROCEDURE `sp_updateMailPreferences`(IN inputJSON JSON, OUT outputJSON JSON)
BEGIN
    DECLARE input_userID INT;
    DECLARE input_acceptsNotifications INT;
    DECLARE response_code INT;
    DECLARE response_message VARCHAR(255);
    DECLARE v_JSONSchema JSON;
    SET v_JSONSchema = '{ "type": "object",
                            "properties": {
                                "userID": { "type": "number" },
                                "acceptsNotifications": { "type": "number" }
                            },
                            "required": ["userID", "acceptsNotifications"]
                        }';
    IF NOT JSON_SCHEMA_VALID(inputJSON, v_JSONSchema) THEN
        SET response_code = 400;
        SET response_message = 'Invalid JSON';
    ELSE
        SET input_userID = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.userID'));
        SET input_acceptsNotifications = JSON_UNQUOTE(JSON_EXTRACT(inputJSON, '$.acceptsNotifications'));
        SET response_code = 200;
        SET response_message = 'Success';
        UPDATE User 
        SET acceptsNotifications = input_acceptsNotifications 
        WHERE code_PK = input_userID;
    END IF;
    SET outputJSON = JSON_OBJECT('status_code', response_code, 'message', response_message);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 14:22:22
