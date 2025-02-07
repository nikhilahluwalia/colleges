-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: college_directory
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_manage_colleges`
--

DROP TABLE IF EXISTS `admin_manage_colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_manage_colleges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_type` varchar(100) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_manage_colleges`
--

LOCK TABLES `admin_manage_colleges` WRITE;
/*!40000 ALTER TABLE `admin_manage_colleges` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_manage_colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_fetch_colleges`
--

DROP TABLE IF EXISTS `api_fetch_colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fetch_colleges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filter_type` varchar(100) NOT NULL,
  `filter_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fetch_colleges`
--

LOCK TABLES `api_fetch_colleges` WRITE;
/*!40000 ALTER TABLE `api_fetch_colleges` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fetch_colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_manage_bookmarks`
--

DROP TABLE IF EXISTS `api_manage_bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_manage_bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `college_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_manage_bookmarks_ibfk_1` (`college_id`),
  CONSTRAINT `api_manage_bookmarks_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_manage_bookmarks`
--

LOCK TABLES `api_manage_bookmarks` WRITE;
/*!40000 ALTER TABLE `api_manage_bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_manage_bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `college_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_manage_bookmarks_ibfk_1` (`college_id`),
  CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `college_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `budget` int NOT NULL,
  `courses` varchar(255) NOT NULL,
  `placement` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `ranking` varchar(255) DEFAULT NULL,
  `facilities` varchar(255) DEFAULT NULL,
  `usp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`college_id`),
  UNIQUE KEY `name` (`name`,`location`,`courses`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (1,'Quantum University','Roorkee, UK',4,'MBA','7LPA','All','122','Foreign Country','nike yesbank amazon'),(2,'Accurate Clg','Greater Noida',4,'MBA','70%, 5LPA-13LPA','','','','Paid Internships, 13-15k for 6 Months'),(3,'Accurate','Greater Noida',6,'PGDM','70%','Internships','123','Laptop','Not Known'),(4,'Mangalmay','Greater Noida',3,'MBA','','','','',''),(5,'Mangalmay','Greater Noida',5,'MBA ++','100%','','','',''),(6,'Bennett university','Greater Noida',12,'MBA','12LPA','Multiple','134','68 acre campus,','multiple');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 18:58:13
