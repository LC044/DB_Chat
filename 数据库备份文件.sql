-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: chat_2020303457
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `username` varchar(20) NOT NULL,
  `conRemark` varchar(45) DEFAULT NULL,
  `type` int NOT NULL,
  `addTime` datetime NOT NULL,
  `contactId` varchar(20) NOT NULL,
  `cID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cID`),
  KEY `f_u_idx` (`username`),
  KEY `f_cu_idx` (`contactId`),
  CONSTRAINT `f_cu` FOREIGN KEY (`contactId`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_uc` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('','周帅康',3,'2022-12-19 21:03:13','2020303457',7),('2020303457','空账号',3,'2022-12-19 21:22:52','',9),('863909694','空账号',3,'2022-12-22 16:27:06','',10),('','啊对对',3,'2022-12-23 01:19:05','863909694',15),('2020303457','啊对对对',3,'2022-12-23 11:19:14','863909694',31),('2020303458','司小远',3,'2022-12-23 14:26:30','2020303457',32),('','DB测试0',3,'2022-12-24 21:04:00','2020303458',35);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contact_view_`
--

DROP TABLE IF EXISTS `contact_view_`;
/*!50001 DROP VIEW IF EXISTS `contact_view_`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contact_view_202030001`
--

DROP TABLE IF EXISTS `contact_view_202030001`;
/*!50001 DROP VIEW IF EXISTS `contact_view_202030001`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_202030001` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contact_view_20203002`
--

DROP TABLE IF EXISTS `contact_view_20203002`;
/*!50001 DROP VIEW IF EXISTS `contact_view_20203002`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_20203002` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contact_view_2020303457`
--

DROP TABLE IF EXISTS `contact_view_2020303457`;
/*!50001 DROP VIEW IF EXISTS `contact_view_2020303457`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_2020303457` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contact_view_2020303458`
--

DROP TABLE IF EXISTS `contact_view_2020303458`;
/*!50001 DROP VIEW IF EXISTS `contact_view_2020303458`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_2020303458` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contact_view_2020303459`
--

DROP TABLE IF EXISTS `contact_view_2020303459`;
/*!50001 DROP VIEW IF EXISTS `contact_view_2020303459`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_2020303459` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contact_view_2020303460`
--

DROP TABLE IF EXISTS `contact_view_2020303460`;
/*!50001 DROP VIEW IF EXISTS `contact_view_2020303460`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_2020303460` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `contact_view_863909694`
--

DROP TABLE IF EXISTS `contact_view_863909694`;
/*!50001 DROP VIEW IF EXISTS `contact_view_863909694`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contact_view_863909694` AS SELECT 
 1 AS `contactId`,
 1 AS `conRemark`,
 1 AS `type`,
 1 AS `addTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `g_id` int NOT NULL,
  `g_name` varchar(20) NOT NULL,
  `g_admin` varchar(20) NOT NULL,
  `g_notice` varchar(150) DEFAULT NULL,
  `g_intro` varchar(150) DEFAULT NULL,
  `g_time` datetime NOT NULL,
  PRIMARY KEY (`g_id`),
  KEY `f_username_g_idx` (`g_admin`),
  CONSTRAINT `f_guid` FOREIGN KEY (`g_admin`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (32978,'演示','',NULL,'在这里介绍你的群聊（不超过150字）','2022-12-23 13:05:36'),(61067,'请输入群名','',NULL,'在这里介绍你的群聊（不超过150字）','2022-12-21 00:01:41'),(70539,'DB实验','2020303457',NULL,'测试群','2022-12-22 23:15:08'),(82091,'测试','',NULL,'在这里介绍你的群聊（不超过150字）','2022-12-23 14:28:49');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_message`
--

DROP TABLE IF EXISTS `group_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_message` (
  `gm_id` int NOT NULL AUTO_INCREMENT,
  `g_id` int NOT NULL,
  `gm_type` int NOT NULL DEFAULT '3',
  `gm_content` varchar(150) NOT NULL,
  `gm_time` datetime NOT NULL,
  `gm_talker` varchar(20) NOT NULL,
  `gm_isSend` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`gm_id`),
  KEY `f_uid_gm_idx` (`gm_talker`),
  KEY `f_gid_gm_idx` (`g_id`),
  CONSTRAINT `f_gid_gm` FOREIGN KEY (`g_id`) REFERENCES `group` (`g_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_uid_gm` FOREIGN KEY (`gm_talker`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_message`
--

LOCK TABLES `group_message` WRITE;
/*!40000 ALTER TABLE `group_message` DISABLE KEYS */;
INSERT INTO `group_message` VALUES (1,61067,3,'有人没？','2022-12-22 00:29:10','',1),(2,61067,3,'okok','2022-12-22 00:31:08','',1),(3,61067,3,'不行额','2022-12-22 00:31:58','',1),(4,61067,3,'这次可以了','2022-12-22 00:32:48','',1),(5,61067,3,'还有人没','2022-12-22 15:42:59','2020303457',1),(6,61067,3,'要上课了','2022-12-22 15:43:08','2020303457',1),(7,61067,3,'123','2022-12-22 15:49:53','863909694',1),(8,61067,3,'456','2022-12-22 15:49:58','',1),(9,61067,3,'789','2022-12-22 15:51:40','',1),(10,61067,3,'101112','2022-12-22 15:51:45','',1),(11,61067,3,'有人没？','2022-12-22 15:54:34','2020303457',1),(12,61067,3,'在的','2022-12-22 16:00:11','',1),(13,61067,3,'。','2022-12-22 16:02:20','',1),(14,61067,3,'123','2022-12-22 16:10:58','2020303457',1),(15,61067,3,'456','2022-12-22 16:13:55','2020303457',1),(16,61067,3,'789','2022-12-22 16:14:24','2020303457',1),(17,61067,3,'9','2022-12-22 16:16:18','2020303457',1),(18,61067,3,'10','2022-12-22 16:17:02','2020303457',1),(19,61067,3,'11','2022-12-22 16:18:39','2020303457',1),(20,61067,3,'12','2022-12-22 16:19:07','2020303457',1),(21,61067,3,'12','2022-12-22 16:20:54','',1),(22,61067,3,'34','2022-12-22 16:21:21','2020303457',1),(23,61067,3,'56','2022-12-22 16:21:50','863909694',1),(24,61067,3,'78','2022-12-22 16:22:10','2020303457',1),(25,61067,3,'910','2022-12-22 16:22:37','863909694',1),(26,61067,3,'...','2022-12-22 16:22:45','2020303457',1),(27,61067,3,'555','2022-12-22 16:23:57','',1),(28,61067,3,'谁在','2022-12-22 23:11:45','',1),(29,61067,3,'1','2022-12-22 23:11:55','863909694',1),(30,61067,3,'2','2022-12-22 23:12:00','',1),(31,61067,3,'3','2022-12-22 23:12:04','863909694',1),(32,61067,3,'4','2022-12-22 23:13:19','2020303457',1),(33,61067,3,'5','2022-12-22 23:13:48','',1),(34,61067,3,'6','2022-12-22 23:14:04','',1),(35,61067,3,'7','2022-12-22 23:14:10','863909694',1),(36,61067,3,'8','2022-12-22 23:14:14','2020303457',1),(37,61067,3,'9','2022-12-22 23:14:20','',1),(38,61067,3,'10','2022-12-22 23:14:24','863909694',1),(39,61067,3,'11','2022-12-22 23:14:29','2020303457',1),(40,70539,3,'1','2022-12-23 12:52:22','',1),(41,70539,3,'2','2022-12-23 12:52:26','2020303457',1),(42,70539,3,'3','2022-12-23 12:52:54','',1),(43,70539,3,'4','2022-12-23 12:53:05','2020303457',1),(44,70539,3,'6','2022-12-23 12:53:15','',1),(45,61067,3,'12','2022-12-23 12:54:07','',1),(46,61067,3,'13','2022-12-23 12:54:11','2020303457',1),(47,61067,3,'14','2022-12-23 12:54:18','863909694',1),(48,61067,3,'456','2022-12-23 14:28:21','2020303457',1),(49,82091,3,'1234','2022-12-23 14:30:00','2020303457',1),(50,82091,3,'789','2022-12-23 14:30:08','',1),(51,61067,3,'有人没','2022-12-24 21:18:44','',1);
/*!40000 ALTER TABLE `group_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_users` (
  `gu_id` int NOT NULL AUTO_INCREMENT,
  `gu_uid` varchar(20) NOT NULL,
  `gu_gid` int NOT NULL,
  `gu_time` datetime NOT NULL,
  `gu_nickname` varchar(45) DEFAULT NULL,
  `gu_type` int NOT NULL,
  PRIMARY KEY (`gu_id`),
  KEY `f_gid_idx` (`gu_gid`),
  KEY `f_uid_idx` (`gu_uid`),
  CONSTRAINT `f_gid` FOREIGN KEY (`gu_gid`) REFERENCES `group` (`g_id`) ON DELETE CASCADE,
  CONSTRAINT `f_uid` FOREIGN KEY (`gu_uid`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
INSERT INTO `group_users` VALUES (3,'2020303457',61067,'2022-12-22 15:41:04','司小远',2),(4,'863909694',61067,'2022-12-22 15:46:54','啊对对对',2),(5,'2020303457',70539,'2022-12-22 23:15:08','司小远',1),(7,'',70539,'2022-12-23 13:04:53','空账号',2),(30,'',61067,'2022-12-24 20:54:16','空账号',2),(31,'',82091,'2022-12-24 21:06:00','空账号',2);
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `group_view_`
--

DROP TABLE IF EXISTS `group_view_`;
/*!50001 DROP VIEW IF EXISTS `group_view_`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_view_202030001`
--

DROP TABLE IF EXISTS `group_view_202030001`;
/*!50001 DROP VIEW IF EXISTS `group_view_202030001`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_202030001` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_view_20203002`
--

DROP TABLE IF EXISTS `group_view_20203002`;
/*!50001 DROP VIEW IF EXISTS `group_view_20203002`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_20203002` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_view_2020303457`
--

DROP TABLE IF EXISTS `group_view_2020303457`;
/*!50001 DROP VIEW IF EXISTS `group_view_2020303457`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_2020303457` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_view_2020303458`
--

DROP TABLE IF EXISTS `group_view_2020303458`;
/*!50001 DROP VIEW IF EXISTS `group_view_2020303458`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_2020303458` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_view_2020303459`
--

DROP TABLE IF EXISTS `group_view_2020303459`;
/*!50001 DROP VIEW IF EXISTS `group_view_2020303459`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_2020303459` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_view_2020303460`
--

DROP TABLE IF EXISTS `group_view_2020303460`;
/*!50001 DROP VIEW IF EXISTS `group_view_2020303460`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_2020303460` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `group_view_863909694`
--

DROP TABLE IF EXISTS `group_view_863909694`;
/*!50001 DROP VIEW IF EXISTS `group_view_863909694`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `group_view_863909694` AS SELECT 
 1 AS `g_id`,
 1 AS `g_name`,
 1 AS `gu_nickname`,
 1 AS `gu_type`,
 1 AS `gu_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `msgId` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '3',
  `IsSend` int NOT NULL,
  `createTime` datetime NOT NULL,
  `content` varchar(150) NOT NULL,
  `talkerId` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`msgId`),
  KEY `f_username_m_idx` (`talkerId`),
  KEY `f_u_idx` (`username`),
  CONSTRAINT `f_u` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_username_m` FOREIGN KEY (`talkerId`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (5,3,0,'2022-12-19 21:20:17','hello','','2020303457'),(7,3,0,'2022-12-19 21:21:10','怎么样','','2020303457'),(9,3,0,'2022-12-19 21:21:57','还行吧','','2020303457'),(11,3,0,'2022-12-19 21:22:21','好像不太行','','863909694'),(12,3,1,'2022-12-19 21:23:12','你在狗叫什么','','2020303457'),(15,3,0,'2022-12-19 21:23:32','你在说啥','','2020303457'),(19,3,0,'2022-12-19 23:29:21','在不在不','',''),(20,3,1,'2022-12-19 23:29:21','在不在不','','2020303457'),(21,3,1,'2022-12-19 23:30:03','在不在','','2020303457'),(23,3,1,'2022-12-19 23:34:18','能不能收到','','2020303457'),(24,3,0,'2022-12-19 23:34:18','能不能收到','',''),(26,3,1,'2022-12-19 23:37:53','能收到','','2020303457'),(29,3,1,'2022-12-19 23:39:50','能不能收到','','2020303457'),(32,3,0,'2022-12-19 23:39:55','可以','','2020303457'),(34,3,0,'2022-12-19 23:40:05','这就行了吧','','2020303457'),(35,3,1,'2022-12-19 23:40:12','应该是行了','','2020303457'),(37,3,1,'2022-12-19 23:40:36','行了','','2020303457'),(39,3,1,'2022-12-19 23:40:47','okok','','2020303457'),(41,3,1,'2022-12-19 23:41:08','怎么回事','','2020303457'),(44,3,1,'2022-12-19 23:50:03','你在不在','','2020303457'),(45,3,1,'2022-12-19 23:54:47','在线不','','2020303457'),(47,3,1,'2022-12-19 23:55:50','在线不','','2020303457'),(51,3,1,'2022-12-19 23:58:47','123456','','2020303457'),(52,3,1,'2022-12-20 00:00:11','123','','2020303457'),(56,3,1,'2022-12-20 00:04:42','666','','2020303457'),(58,3,1,'2022-12-20 00:05:33','888','','2020303457'),(61,3,1,'2022-12-20 00:07:51','456','','2020303457'),(62,3,1,'2022-12-20 00:11:10','最后一次了\n','','2020303457'),(65,3,0,'2022-12-20 00:12:03','好像还可以','','2020303457'),(67,3,0,'2022-12-20 00:12:43','收到没','','2020303457'),(68,3,1,'2022-12-20 00:12:47','收到了','','2020303457'),(73,3,1,'2022-12-20 21:22:59','在不','','2020303457'),(76,3,0,'2022-12-20 21:23:10','在的','','2020303457'),(78,3,0,'2022-12-20 21:23:28','okok','','2020303457'),(80,3,0,'2022-12-20 21:23:46','怎么回事','','2020303457'),(82,3,0,'2022-12-20 21:23:59','为什么在后面','','2020303457'),(83,3,1,'2022-12-20 21:24:17','我也不知道啊','','2020303457'),(86,3,0,'2022-12-20 21:25:43','可不可以','','2020303457'),(87,3,1,'2022-12-20 21:25:48','好像可以了','','2020303457'),(89,3,1,'2022-12-20 21:25:57','那就好','','2020303457'),(92,3,0,'2022-12-20 21:27:11','<div>','','2020303457'),(93,3,1,'2022-12-20 21:27:19','','','2020303457'),(96,3,0,'2022-12-20 21:29:45','怎么样','','2020303457'),(98,3,0,'2022-12-20 21:33:45','OK哦','','2020303457'),(99,3,1,'2022-12-21 23:35:44','可以说话不','','2020303457'),(101,3,1,'2022-12-22 23:11:07','在不在不？\n','','863909694'),(104,3,0,'2022-12-22 23:11:16','在的在的','','863909694'),(105,3,1,'2022-12-22 23:12:36','在不？\n','','2020303457'),(107,3,1,'2022-12-22 23:12:57','在的','','2020303457'),(110,3,0,'2022-12-22 23:13:03','？','','2020303457'),(111,3,1,'2022-12-23 11:11:09','20','','2020303457'),(112,3,0,'2022-12-23 11:11:09','20','2020303457',''),(113,3,1,'2022-12-23 11:11:14','34','','2020303457'),(114,3,0,'2022-12-23 11:11:14','34','2020303457',''),(115,3,1,'2022-12-23 11:11:17','78','2020303457',''),(116,3,0,'2022-12-23 11:11:17','78','','2020303457'),(117,3,1,'2022-12-23 12:49:51','10','','2020303457'),(118,3,0,'2022-12-23 12:49:51','10','2020303457',''),(119,3,1,'2022-12-23 12:49:57','11','2020303457',''),(120,3,0,'2022-12-23 12:49:57','11','','2020303457'),(121,3,1,'2022-12-23 12:53:50','1','863909694',''),(122,3,0,'2022-12-23 12:53:50','1','','863909694'),(123,3,1,'2022-12-23 14:24:35','45','2020303457',''),(124,3,0,'2022-12-23 14:24:35','45','','2020303457'),(125,3,1,'2022-12-23 14:24:41','56','','2020303457'),(126,3,0,'2022-12-23 14:24:41','56','2020303457',''),(127,3,1,'2022-12-23 14:24:56','56','','2020303457'),(128,3,0,'2022-12-23 14:24:56','56','2020303457',''),(130,3,0,'2022-12-23 14:26:58','12','2020303457','2020303458'),(131,3,1,'2022-12-23 14:32:07','周帅康','','2020303457'),(132,3,0,'2022-12-23 14:32:07','周帅康','2020303457',''),(133,3,1,'2022-12-23 14:35:28','?','','2020303457'),(134,3,0,'2022-12-23 14:35:28','?','2020303457',''),(135,3,1,'2022-12-23 14:35:51','￼ \n','2020303457',''),(136,3,0,'2022-12-23 14:35:51','￼ \n','','2020303457');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `msg_view_`
--

DROP TABLE IF EXISTS `msg_view_`;
/*!50001 DROP VIEW IF EXISTS `msg_view_`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `msg_view_202030001`
--

DROP TABLE IF EXISTS `msg_view_202030001`;
/*!50001 DROP VIEW IF EXISTS `msg_view_202030001`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_202030001` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `msg_view_20203002`
--

DROP TABLE IF EXISTS `msg_view_20203002`;
/*!50001 DROP VIEW IF EXISTS `msg_view_20203002`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_20203002` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `msg_view_2020303457`
--

DROP TABLE IF EXISTS `msg_view_2020303457`;
/*!50001 DROP VIEW IF EXISTS `msg_view_2020303457`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_2020303457` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `msg_view_2020303458`
--

DROP TABLE IF EXISTS `msg_view_2020303458`;
/*!50001 DROP VIEW IF EXISTS `msg_view_2020303458`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_2020303458` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `msg_view_2020303459`
--

DROP TABLE IF EXISTS `msg_view_2020303459`;
/*!50001 DROP VIEW IF EXISTS `msg_view_2020303459`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_2020303459` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `msg_view_2020303460`
--

DROP TABLE IF EXISTS `msg_view_2020303460`;
/*!50001 DROP VIEW IF EXISTS `msg_view_2020303460`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_2020303460` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `msg_view_863909694`
--

DROP TABLE IF EXISTS `msg_view_863909694`;
/*!50001 DROP VIEW IF EXISTS `msg_view_863909694`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `msg_view_863909694` AS SELECT 
 1 AS `msgId`,
 1 AS `type`,
 1 AS `IsSend`,
 1 AS `createTime`,
 1 AS `content`,
 1 AS `talkerId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `username` varchar(20) NOT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `gender` enum('男','女') DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `signsture` varchar(45) DEFAULT NULL,
  `status` int DEFAULT '-1',
  PRIMARY KEY (`username`),
  CONSTRAINT `f_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES ('','空账号','男',NULL,'商丘','河南','191','123','test',-1),('202030001','DB测试',NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),('2020303457','司小远','男',NULL,'商丘','河南','','','',-1),('2020303458','DB测试',NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),('2020303459','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),('2020303460','AI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,-1),('863909694','啊对对对','男',NULL,'','','','','',-1);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('','','2022-12-19 20:27:07'),('202030001','123456','2022-12-24 23:42:34'),('2020303457','123456','2022-12-19 20:27:28'),('2020303458','123456','2022-12-23 14:25:31'),('2020303459','','2022-12-24 21:01:42'),('2020303460','123456','2022-12-25 00:01:33'),('863909694','123456','2022-12-19 20:27:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `contact_view_`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view_202030001`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_202030001`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_202030001` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '202030001') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view_20203002`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_20203002`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_20203002` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '20203002') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view_2020303457`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_2020303457`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_2020303457` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '2020303457') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view_2020303458`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_2020303458`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_2020303458` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '2020303458') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view_2020303459`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_2020303459`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_2020303459` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '2020303459') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view_2020303460`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_2020303460`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_2020303460` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '2020303460') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view_863909694`
--

/*!50001 DROP VIEW IF EXISTS `contact_view_863909694`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view_863909694` AS select `contact`.`contactId` AS `contactId`,`contact`.`conRemark` AS `conRemark`,`contact`.`type` AS `type`,`contact`.`addTime` AS `addTime` from `contact` where (`contact`.`username` = '863909694') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_`
--

/*!50001 DROP VIEW IF EXISTS `group_view_`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_202030001`
--

/*!50001 DROP VIEW IF EXISTS `group_view_202030001`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_202030001` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '202030001') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_20203002`
--

/*!50001 DROP VIEW IF EXISTS `group_view_20203002`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_20203002` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '20203002') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_2020303457`
--

/*!50001 DROP VIEW IF EXISTS `group_view_2020303457`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_2020303457` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '2020303457') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_2020303458`
--

/*!50001 DROP VIEW IF EXISTS `group_view_2020303458`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_2020303458` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '2020303458') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_2020303459`
--

/*!50001 DROP VIEW IF EXISTS `group_view_2020303459`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_2020303459` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '2020303459') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_2020303460`
--

/*!50001 DROP VIEW IF EXISTS `group_view_2020303460`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_2020303460` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '2020303460') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `group_view_863909694`
--

/*!50001 DROP VIEW IF EXISTS `group_view_863909694`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = gbk */;
/*!50001 SET character_set_results     = gbk */;
/*!50001 SET collation_connection      = gbk_chinese_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `group_view_863909694` AS select `group`.`g_id` AS `g_id`,`group`.`g_name` AS `g_name`,`group_users`.`gu_nickname` AS `gu_nickname`,`group_users`.`gu_type` AS `gu_type`,`group_users`.`gu_time` AS `gu_time` from (`group_users` join `group`) where ((`group_users`.`gu_uid` = '863909694') and (`group_users`.`gu_gid` = `group`.`g_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '') order by `message`.`msgId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_202030001`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_202030001`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_202030001` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '202030001') order by `message`.`msgId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_20203002`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_20203002`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_20203002` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '20203002') order by `message`.`msgId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_2020303457`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_2020303457`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_2020303457` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '2020303457') order by `message`.`msgId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_2020303458`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_2020303458`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_2020303458` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '2020303458') order by `message`.`msgId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_2020303459`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_2020303459`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_2020303459` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '2020303459') order by `message`.`msgId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_2020303460`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_2020303460`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_2020303460` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '2020303460') order by `message`.`msgId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `msg_view_863909694`
--

/*!50001 DROP VIEW IF EXISTS `msg_view_863909694`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `msg_view_863909694` AS select `message`.`msgId` AS `msgId`,`message`.`type` AS `type`,`message`.`IsSend` AS `IsSend`,`message`.`createTime` AS `createTime`,`message`.`content` AS `content`,`message`.`talkerId` AS `talkerId` from `message` where (`message`.`username` = '863909694') order by `message`.`msgId` */;
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

-- Dump completed on 2022-12-25  0:32:11
