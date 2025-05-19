CREATE DATABASE  IF NOT EXISTS `padaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `padaria`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: padaria
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_telas` int NOT NULL,
  `tipo_pao` enum('grossa','fina') NOT NULL,
  `turno` varchar(6) NOT NULL,
  `horario` time DEFAULT NULL,
  `quantidade_vendida` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `horarios_ibfk_1` (`id_telas`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_telas`) REFERENCES `telas` (`id_telas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,4,'grossa','manhã','11:00:00',45),(2,6,'grossa','manhã','09:40:00',45),(3,8,'grossa','manhã','10:00:00',38),(4,9,'grossa','manhã','11:00:00',44),(5,10,'grossa','manhã','09:45:00',54),(6,11,'grossa','manhã','09:10:00',44),(7,12,'grossa','manhã','10:00:00',40),(8,17,'grossa','manhã','09:00:00',55),(9,18,'grossa','manhã','10:00:00',44),(10,23,'grossa','manhã','10:10:00',54),(11,24,'grossa','manhã','09:40:00',44),(12,28,'grossa','manhã','11:00:00',40),(13,29,'grossa','manhã','09:00:00',42),(14,30,'grossa','manhã','09:00:00',54),(15,31,'grossa','manhã','09:20:00',46),(16,34,'grossa','manhã','09:00:00',40),(17,36,'grossa','manhã','09:10:00',44),(18,42,'grossa','manhã','11:00:00',38),(19,43,'grossa','manhã','09:00:00',44),(20,44,'grossa','manhã','09:50:00',54),(21,45,'grossa','manhã','10:05:00',44),(22,46,'grossa','manhã','11:00:00',40),(23,47,'grossa','manhã','11:00:00',36),(24,48,'grossa','manhã','10:00:00',36),(32,5,'grossa','manhã',NULL,56),(33,7,'grossa','manhã',NULL,42),(34,13,'grossa','manhã',NULL,40),(35,14,'grossa','manhã',NULL,40),(36,15,'grossa','manhã',NULL,38),(37,16,'grossa','manhã',NULL,44),(38,22,'grossa','manhã',NULL,42),(39,25,'grossa','manhã',NULL,44),(40,26,'grossa','manhã',NULL,38),(41,27,'grossa','manhã',NULL,42),(42,32,'grossa','manhã',NULL,42),(43,33,'grossa','manhã',NULL,36),(44,35,'grossa','manhã',NULL,40),(45,37,'grossa','manhã',NULL,56),(46,38,'grossa','manhã',NULL,46),(47,39,'grossa','manhã',NULL,40),(48,40,'grossa','manhã',NULL,36),(49,41,'grossa','manhã',NULL,38),(63,4,'grossa','tarde','19:30:00',30),(64,6,'grossa','tarde','18:30:00',50),(65,8,'grossa','tarde','19:00:00',50),(66,9,'grossa','tarde','19:15:00',34),(67,11,'grossa','tarde','19:00:00',54),(68,12,'grossa','tarde','19:00:00',46),(69,13,'grossa','tarde','19:10:00',50),(70,14,'grossa','tarde','19:00:00',44),(71,15,'grossa','tarde','18:50:00',50),(72,18,'grossa','tarde','18:40:00',56),(73,22,'grossa','tarde','10:00:00',36),(74,24,'grossa','tarde','19:00:00',56),(75,26,'grossa','tarde','18:20:00',46),(76,27,'grossa','tarde','19:00:00',46),(77,28,'grossa','tarde','18:40:00',42),(78,31,'grossa','tarde','18:50:00',56),(79,33,'grossa','tarde','19:10:00',50),(80,34,'grossa','tarde','18:45:00',46),(81,35,'grossa','tarde','18:50:00',46),(82,36,'grossa','tarde','18:50:00',34),(83,38,'grossa','tarde','18:50:00',56),(84,39,'grossa','tarde','19:00:00',44),(85,41,'grossa','tarde','19:10:00',50),(86,42,'grossa','tarde','18:30:00',48),(87,43,'grossa','tarde','19:30:00',36),(88,46,'grossa','tarde','19:10:00',46),(89,48,'grossa','tarde','18:50:00',48),(94,7,'grossa','tarde',NULL,48),(95,16,'grossa','tarde',NULL,34),(98,25,'grossa','tarde',NULL,50),(99,29,'grossa','tarde',NULL,36),(100,32,'grossa','tarde',NULL,46),(101,40,'grossa','tarde',NULL,48),(103,45,'grossa','tarde',NULL,56),(104,47,'grossa','tarde',NULL,46),(109,6,'fina','manhã','10:00:00',30),(110,23,'fina','manhã','10:30:00',33),(111,30,'fina','manhã','10:00:00',38),(112,44,'fina','manhã','10:30:00',31),(116,4,'fina','manhã',NULL,24),(117,5,'fina','manhã',NULL,26),(118,7,'fina','manhã',NULL,21),(119,8,'fina','manhã',NULL,19),(410,355,'grossa','manha',NULL,38),(411,355,'fina','manha','11:00:00',30),(412,355,'grossa','tarde',NULL,46),(413,355,'fina','tarde',NULL,23),(428,363,'grossa','manha',NULL,34),(429,363,'fina','manha',NULL,18),(430,363,'grossa','tarde',NULL,46),(431,363,'fina','tarde',NULL,26),(432,364,'grossa','manha',NULL,35),(433,364,'fina','manha',NULL,20),(434,364,'grossa','tarde','19:30:00',48),(435,364,'fina','tarde',NULL,27),(436,365,'grossa','manha','08:30:00',46),(437,365,'fina','manha','10:00:00',30),(438,365,'grossa','tarde','19:30:00',30),(439,365,'fina','tarde','19:30:00',25),(442,367,'grossa','manha',NULL,57),(443,367,'fina','manha',NULL,28),(444,375,'grossa','manha','10:30:00',44),(445,375,'fina','manha',NULL,26),(446,375,'grossa','tarde','18:30:00',50),(447,375,'fina','tarde','19:00:00',34),(448,376,'grossa','manha',NULL,34),(449,376,'fina','manha',NULL,19),(450,376,'grossa','tarde','19:05:00',46),(451,376,'fina','tarde',NULL,33),(452,377,'grossa','manha','09:30:00',36),(453,377,'fina','manha',NULL,31),(454,377,'grossa','tarde','19:25:00',48),(455,377,'fina','tarde',NULL,15),(456,378,'grossa','manha','08:30:00',38),(457,378,'fina','manha',NULL,23),(458,378,'grossa','tarde','19:20:00',48),(459,378,'fina','tarde',NULL,31),(460,380,'grossa','manha',NULL,44),(461,380,'fina','manha',NULL,23),(462,380,'grossa','tarde','18:20:00',30),(463,380,'fina','tarde',NULL,29),(464,381,'grossa','manha','10:30:00',58),(465,381,'fina','manha',NULL,33),(474,404,'grossa','manha','09:30:00',44),(475,404,'fina','manha',NULL,24),(476,404,'grossa','tarde',NULL,52),(477,404,'fina','tarde',NULL,29),(478,405,'grossa','manha','09:30:00',40),(479,405,'fina','manha',NULL,20),(480,405,'grossa','tarde','18:30:00',50),(481,405,'fina','tarde',NULL,32),(482,406,'grossa','manha','08:30:00',36),(483,406,'fina','manha',NULL,22),(484,406,'grossa','tarde','18:40:00',47),(485,406,'fina','tarde',NULL,33),(486,407,'grossa','manha','10:00:00',48),(487,407,'fina','manha','10:00:00',29),(488,408,'grossa','manha','08:30:00',44),(489,408,'fina','manha',NULL,24),(490,408,'grossa','tarde','18:30:00',48),(491,408,'fina','tarde',NULL,28),(492,409,'grossa','manha','09:30:00',58),(493,409,'fina','manha',NULL,40),(494,410,'grossa','manha','09:30:00',42),(495,410,'fina','manha','11:00:00',26),(496,410,'grossa','tarde','18:30:00',58),(497,410,'fina','tarde','19:00:00',32),(498,411,'grossa','manha',NULL,37),(499,411,'fina','manha',NULL,18),(500,411,'grossa','tarde',NULL,48),(501,411,'fina','tarde',NULL,29),(502,412,'grossa','manha',NULL,36),(503,412,'fina','manha',NULL,21),(504,412,'grossa','tarde','19:15:00',50),(505,412,'fina','tarde',NULL,31),(506,413,'grossa','manha',NULL,37),(507,413,'fina','manha',NULL,22),(508,413,'grossa','tarde',NULL,40),(509,413,'fina','tarde','19:30:00',30),(510,414,'grossa','manha',NULL,36),(511,414,'fina','manha',NULL,17),(512,414,'grossa','tarde','19:00:00',50),(513,414,'fina','tarde',NULL,32),(514,415,'grossa','manha','10:15:00',46),(515,415,'fina','manha',NULL,20),(516,415,'grossa','tarde','18:30:00',34),(517,415,'fina','tarde',NULL,15),(518,416,'grossa','manha','09:00:00',58),(519,416,'fina','manha',NULL,40),(520,417,'grossa','manha',NULL,43),(521,417,'fina','manha',NULL,18),(522,417,'grossa','tarde',NULL,52),(523,417,'fina','tarde',NULL,30),(524,418,'grossa','manha','10:40:00',40),(525,418,'fina','manha',NULL,21),(526,418,'grossa','tarde','18:30:00',47),(527,418,'fina','tarde','19:00:00',35),(528,419,'grossa','manha',NULL,38),(529,419,'fina','manha',NULL,11),(530,419,'grossa','tarde',NULL,43),(531,419,'fina','tarde',NULL,30),(532,420,'grossa','manha','11:00:00',38),(533,420,'fina','manha',NULL,17),(534,420,'grossa','tarde','18:50:00',40),(535,420,'fina','tarde',NULL,36),(536,491,'grossa','manha','09:30:00',38),(537,491,'fina','manha',NULL,20),(538,491,'grossa','tarde',NULL,47),(539,491,'fina','tarde',NULL,26),(540,492,'grossa','manha','10:15:00',46),(541,492,'fina','manha',NULL,22),(542,492,'grossa','tarde',NULL,34),(543,492,'fina','tarde',NULL,17),(544,493,'grossa','manha','09:45:00',58),(545,493,'fina','manha',NULL,36);
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedidos` int NOT NULL AUTO_INCREMENT,
  `Data` date NOT NULL,
  `Grossa (PCT)` int NOT NULL,
  `Fina (PCT)` int NOT NULL,
  `Valor R$` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2025-02-02',30,20,3200.00),(2,'2025-02-04',25,25,3200.00),(3,'2025-02-06',40,30,4480.00),(4,'2025-02-11',25,25,3200.00),(5,'2025-02-16',25,20,2880.00),(6,'2025-02-18',30,30,3840.00),(7,'2025-02-20',35,20,3520.00),(8,'2025-02-25',25,25,3200.00),(9,'2025-03-07',35,30,4160.00),(10,'2025-03-11',25,25,3200.00),(11,'2025-03-13',40,30,4480.00),(12,'2025-03-16',30,20,3200.00);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predicion`
--

DROP TABLE IF EXISTS `predicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predicion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_P` date DEFAULT NULL,
  `semana_P` varchar(13) DEFAULT NULL,
  `telas_grossa_manha_P` int DEFAULT NULL,
  `telas_grossa_tarde_P` int DEFAULT NULL,
  `telas_fina_manha_P` int DEFAULT NULL,
  `telas_fina_tarde_P` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predicion`
--

LOCK TABLES `predicion` WRITE;
/*!40000 ALTER TABLE `predicion` DISABLE KEYS */;
INSERT INTO `predicion` VALUES (128,'2025-04-21','Monday',43,55,24,35),(129,'2025-04-22','Tuesday',40,47,20,30),(130,'2025-04-23','Wednesday',37,48,22,32),(131,'2025-04-24','Thursday',38,47,22,31),(132,'2025-04-25','Friday',38,49,20,33),(133,'2025-04-26','Saturday',43,33,25,24),(134,'2025-04-27','Sunday',55,0,32,0),(135,'2025-04-28','Monday',43,55,24,35),(136,'2025-04-29','Tuesday',40,47,21,31),(137,'2025-04-30','Wednesday',37,48,22,32),(138,'2025-05-01','Thursday',38,47,23,30),(139,'2025-05-02','Friday',38,49,20,32),(140,'2025-05-03','Saturday',44,33,24,24),(141,'2025-05-04','Sunday',56,0,32,0),(142,'2025-05-05','Monday',43,55,24,35),(143,'2025-05-06','Tuesday',40,47,21,31),(144,'2025-05-07','Wednesday',37,48,22,32),(145,'2025-05-08','Thursday',39,43,23,27),(146,'2025-05-09','Friday',39,49,21,32),(147,'2025-05-10','Saturday',44,33,24,24),(148,'2025-05-11','Sunday',56,0,33,0),(149,'2025-05-12','Monday',43,55,24,34),(150,'2025-05-13','Tuesday',40,47,20,31),(151,'2025-05-14','Wednesday',37,48,22,32),(152,'2025-05-15','Thursday',39,43,23,28),(153,'2025-05-16','Friday',38,49,20,32),(154,'2025-05-17','Saturday',44,33,24,23),(155,'2025-05-18','Sunday',56,0,33,0);
/*!40000 ALTER TABLE `predicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telas`
--

DROP TABLE IF EXISTS `telas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telas` (
  `id_telas` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `semana` varchar(13) DEFAULT NULL,
  `telas_grossa_manha` int DEFAULT NULL,
  `telas_grossa_tarde` int DEFAULT NULL,
  `telas_fina_manha` int DEFAULT NULL,
  `telas_fina_tarde` int DEFAULT NULL,
  PRIMARY KEY (`id_telas`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telas`
--

LOCK TABLES `telas` WRITE;
/*!40000 ALTER TABLE `telas` DISABLE KEYS */;
INSERT INTO `telas` VALUES (4,'2025-03-01','Saturday',45,30,27,28),(5,'2025-03-02','Sunday',56,0,36,0),(6,'2025-03-05','Wednesday',45,50,30,32),(7,'2025-03-06','Thursday',42,48,30,42),(8,'2025-03-07','Friday',38,50,37,38),(9,'2025-03-08','Saturday',44,34,33,34),(10,'2025-03-09','Sunday',54,0,35,0),(11,'2025-03-10','Monday',44,54,30,35),(12,'2025-03-11','Tuesday',40,46,29,37),(13,'2025-03-12','Wednesday',40,50,28,42),(14,'2025-03-13','Thursday',40,44,32,45),(15,'2025-03-14','Friday',38,50,28,34),(16,'2025-03-15','Saturday',44,34,29,34),(17,'2025-03-16','Sunday',55,0,39,0),(18,'2025-03-17','Monday',44,56,29,38),(22,'2025-02-01','Saturday',42,36,31,32),(23,'2025-02-02','Sunday',54,0,33,0),(24,'2025-02-03','Monday',44,56,30,36),(25,'2025-02-04','Tuesday',44,50,30,37),(26,'2025-02-05','Wednesday',38,46,32,38),(27,'2025-02-06','Thursday',42,46,28,31),(28,'2025-02-07','Friday',40,42,28,40),(29,'2025-02-08','Saturday',42,36,28,29),(30,'2025-02-09','Sunday',54,0,38,0),(31,'2025-02-10','Monday',46,56,30,32),(32,'2025-02-11','Tuesday',42,46,28,40),(33,'2025-02-12','Wednesday',36,50,30,36),(34,'2025-02-13','Thursday',40,46,25,33),(35,'2025-02-14','Friday',40,46,28,39),(36,'2025-02-15','Saturday',44,34,30,32),(37,'2025-02-16','Sunday',56,0,34,0),(38,'2025-02-17','Monday',46,56,30,40),(39,'2025-02-18','Tuesday',40,44,28,43),(40,'2025-02-19','Wednesday',36,48,41,39),(41,'2025-02-20','Thursday',38,50,25,30),(42,'2025-02-21','Friday',38,48,25,44),(43,'2025-02-22','Saturday',44,36,30,26),(44,'2025-02-23','Sunday',54,0,31,0),(45,'2025-02-24','Monday',44,56,30,33),(46,'2025-02-25','Tuesday',40,46,21,34),(47,'2025-02-26','Wednesday',36,46,26,37),(48,'2025-02-27','Thursday',36,48,26,38),(115,'2025-03-18','Tuesday',42,46,25,39),(117,'2025-03-19','Wednesday',40,50,31,41),(118,'2025-03-20','Thursday',38,44,35,30),(119,'2025-03-21','Friday',36,52,25,36),(120,'2025-03-22','Saturday',42,34,31,29),(121,'2025-03-23','Sunday',56,0,34,0),(122,'2025-03-24','Monday',44,58,30,39),(123,'2025-03-25','Tuesday',40,48,28,36),(124,'2025-03-26','Wednesday',36,50,29,42),(125,'2025-03-27','Thursday',38,46,34,40),(126,'2025-03-28','Friday',38,50,35,37),(127,'2025-03-29','Saturday',44,35,32,37),(128,'2025-03-30','Sunday',56,0,37,0),(202,'2025-03-31','Monday',40,54,29,36),(203,'2025-04-01','Tuesday',40,48,25,34),(204,'2025-04-02','Wednesday',35,48,31,42),(205,'2025-04-03','Thursday',40,48,25,36),(206,'2025-04-04','Friday',38,48,29,30),(240,'2025-04-07','Monday',42,56,28,35),(242,'2025-04-08','Tuesday',38,48,25,34),(243,'2025-04-09','Wednesday',36,48,25,30),(244,'2025-04-10','Thursday',37,46,28,34),(245,'2025-04-11','Friday',38,53,30,45),(246,'2025-04-12','Saturday',46,33,35,37),(247,'2025-04-13','Sunday',57,0,43,0),(354,'2025-04-14','Monday',42,58,29,40),(355,'2025-04-15','Tuesday',40,50,30,37),(363,'2025-04-16','Wednesday',38,50,32,40),(364,'2025-04-17','Thursday',36,48,34,32),(365,'2025-04-19','Saturday',46,30,30,25),(367,'2025-04-20','Sunday',58,0,35,0),(375,'2025-04-22','Tuesday',44,50,31,34),(376,'2025-04-23','Wednesday',36,46,28,41),(377,'2025-04-24','Thursday',36,48,32,31),(378,'2025-04-25','Friday',38,48,31,36),(380,'2025-04-26','Saturday',46,30,33,35),(381,'2025-04-27','Sunday',58,0,38,0),(404,'2025-04-28','Monday',44,58,25,35),(405,'2025-04-29','Tuesday',40,50,28,35),(406,'2025-04-30','Wednesday',36,47,27,34),(407,'2025-05-01','Thursday',48,0,29,0),(408,'2025-05-02','Friday',44,48,25,31),(409,'2025-05-04','Sunday',58,0,41,0),(410,'2025-05-05','Monday',42,58,26,32),(411,'2025-05-06','Tuesday',44,54,28,40),(412,'2025-05-07','Wednesday',40,50,31,39),(413,'2025-05-08','Thursday',38,48,32,30),(414,'2025-05-09','Friday',40,50,20,37),(415,'2025-05-10','Saturday',46,34,30,35),(416,'2025-05-11','Sunday',58,0,40,0),(417,'2025-05-12','Monday',46,58,30,42),(418,'2025-05-13','Tuesday',40,47,36,35),(419,'2025-05-14','Wednesday',40,50,20,39),(420,'2025-05-15','Thursday',38,40,29,42),(491,'2025-05-16','Friday',38,48,31,41),(492,'2025-05-17','Saturday',46,36,39,41),(493,'2025-05-18','Sunday',58,0,42,0);
/*!40000 ALTER TABLE `telas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telas_vendidas3`
--

DROP TABLE IF EXISTS `telas_vendidas3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telas_vendidas3` (
  `id_telas_vendidas3` int NOT NULL AUTO_INCREMENT,
  `id_telas` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `semana` varchar(13) DEFAULT NULL,
  `telas_grossa_manha` int DEFAULT NULL,
  `telas_grossa_tarde` int DEFAULT NULL,
  `telas_fina_manha` int DEFAULT NULL,
  `telas_fina_tarde` int DEFAULT NULL,
  PRIMARY KEY (`id_telas_vendidas3`),
  KEY `id_telas_idx` (`id_telas`),
  CONSTRAINT `fk_telas_vendidas3_telas` FOREIGN KEY (`id_telas`) REFERENCES `telas` (`id_telas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telas_vendidas3`
--

LOCK TABLES `telas_vendidas3` WRITE;
/*!40000 ALTER TABLE `telas_vendidas3` DISABLE KEYS */;
INSERT INTO `telas_vendidas3` VALUES (1,4,'2025-03-01','Saturday',45,30,24,20),(2,5,'2025-03-02','Sunday',56,0,26,0),(3,6,'2025-03-05','Wednesday',45,50,30,32),(4,7,'2025-03-06','Thursday',42,48,21,27),(5,8,'2025-03-07','Friday',38,50,19,33),(6,9,'2025-03-08','Saturday',44,34,24,24),(7,10,'2025-03-09','Sunday',54,0,30,0),(8,11,'2025-03-10','Monday',44,54,28,34),(9,12,'2025-03-11','Tuesday',40,46,22,34),(10,13,'2025-03-12','Wednesday',40,50,18,25),(11,14,'2025-03-13','Thursday',40,44,17,32),(12,15,'2025-03-14','Friday',38,50,18,34),(13,16,'2025-03-15','Saturday',44,34,20,19),(14,17,'2025-03-16','Sunday',55,0,35,0),(15,18,'2025-03-17','Monday',44,56,23,38),(16,22,'2025-02-01','Saturday',42,36,19,27),(17,23,'2025-02-02','Sunday',54,0,33,0),(18,24,'2025-02-03','Monday',44,56,25,34),(19,25,'2025-02-04','Tuesday',44,50,21,20),(20,26,'2025-02-05','Wednesday',38,46,23,38),(21,27,'2025-02-06','Thursday',42,46,27,31),(22,28,'2025-02-07','Friday',40,42,20,37),(23,29,'2025-02-08','Saturday',42,36,26,18),(24,30,'2025-02-09','Sunday',54,0,38,0),(25,31,'2025-02-10','Monday',46,56,25,32),(26,32,'2025-02-11','Tuesday',42,46,20,30),(27,33,'2025-02-12','Wednesday',36,50,23,36),(28,34,'2025-02-13','Thursday',40,46,24,33),(29,35,'2025-02-14','Friday',40,46,18,33),(30,36,'2025-02-15','Saturday',44,34,28,28),(31,37,'2025-02-16','Sunday',56,0,29,0),(32,38,'2025-02-17','Monday',46,56,22,40),(33,39,'2025-02-18','Tuesday',40,44,19,30),(34,40,'2025-02-19','Wednesday',36,48,32,29),(35,41,'2025-02-20','Thursday',38,50,24,30),(36,42,'2025-02-21','Friday',38,48,19,39),(37,43,'2025-02-22','Saturday',44,36,29,25),(38,44,'2025-02-23','Sunday',54,0,31,0),(39,45,'2025-02-24','Monday',44,56,27,32),(40,46,'2025-02-25','Tuesday',40,46,19,33),(41,47,'2025-02-26','Wednesday',36,46,20,31),(42,48,'2025-02-27','Thursday',36,48,20,36),(43,115,'2025-03-18','Tuesday',38,46,16,32),(44,117,'2025-03-19','Wednesday',40,44,20,30),(45,118,'2025-03-20','Thursday',37,44,25,30),(46,119,'2025-03-21','Friday',36,52,20,33),(47,120,'2025-03-22','Saturday',42,29,22,27),(48,121,'2025-03-23','Sunday',56,0,34,0),(49,122,'2025-03-24','Monday',39,54,20,35),(50,123,'2025-03-25','Tuesday',40,48,21,32),(51,124,'2025-03-26','Wednesday',35,50,17,32),(52,125,'2025-03-27','Thursday',38,46,20,30),(53,126,'2025-03-28','Friday',36,50,27,30),(54,127,'2025-03-29','Saturday',44,33,27,27),(55,128,'2025-03-30','Sunday',56,0,33,0),(56,202,'2025-03-31','Monday',40,54,23,36),(57,203,'2025-04-01','Tuesday',36,46,20,28),(58,204,'2025-04-02','Wednesday',35,48,21,42),(59,205,'2025-04-03','Thursday',37,44,18,32),(60,206,'2025-04-04','Friday',38,48,20,25),(61,240,'2025-04-07','Monday',42,56,25,35),(62,242,'2025-04-08','Tuesday',38,48,23,34),(63,243,'2025-04-09','Wednesday',36,48,23,30),(64,244,'2025-04-10','Thursday',37,53,24,33),(65,245,'2025-04-11','Friday',38,53,20,30),(66,246,'2025-04-12','Saturday',41,30,21,19),(67,247,'2025-04-13','Sunday',57,0,34,0),(131,363,'2025-04-16','Wednesday',34,46,18,26),(132,364,'2025-04-17','Thursday',35,48,20,27),(133,365,'2025-04-19','Saturday',46,30,30,25),(135,367,'2025-04-20','Sunday',57,0,28,0),(199,375,'2025-04-22','Tuesday',44,50,26,34),(200,376,'2025-04-23','Wednesday',34,46,19,33),(201,377,'2025-04-24','Thursday',36,48,31,25),(202,378,'2025-04-25','Friday',38,48,23,31),(203,380,'2025-04-26','Saturday',44,30,23,29),(204,381,'2025-04-27','Sunday',58,0,33,0),(206,404,'2025-04-28','Monday',44,52,24,29),(207,405,'2025-04-29','Tuesday',40,50,20,32),(208,406,'2025-04-30','Wednesday',36,47,22,33),(209,407,'2025-05-01','Thursday',48,48,29,28),(210,408,'2025-05-02','Friday',44,48,24,28),(211,409,'2025-05-04','Sunday',58,0,40,0),(213,410,'2025-05-05','Monday',42,58,26,32),(214,411,'2025-05-06','Tuesday',37,48,18,29),(215,412,'2025-05-07','Wednesday',36,50,21,31),(216,413,'2025-05-08','Thursday',37,40,22,30),(217,414,'2025-05-09','Friday',36,50,17,32),(218,415,'2025-05-10','Saturday',46,34,20,15),(219,416,'2025-05-11','Sunday',58,0,40,0),(220,417,'2025-05-12','Monday',43,52,18,30),(221,418,'2025-05-13','Tuesday',40,47,21,35),(222,419,'2025-05-14','Wednesday',38,43,20,30),(223,420,'2025-05-15','Thursday',38,40,17,36),(224,491,'2025-05-16','Friday',38,47,20,26),(225,492,'2025-05-17','Saturday',46,34,22,17),(226,493,'2025-05-18','Sunday',58,0,36,0);
/*!40000 ALTER TABLE `telas_vendidas3` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 19:40:29
