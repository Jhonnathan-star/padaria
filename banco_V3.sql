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
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,4,'grossa','manhã','11:00:00',45),(2,6,'grossa','manhã','09:40:00',45),(3,8,'grossa','manhã','10:00:00',38),(4,9,'grossa','manhã','11:00:00',44),(5,10,'grossa','manhã','09:45:00',54),(6,11,'grossa','manhã','09:10:00',44),(7,12,'grossa','manhã','10:00:00',40),(8,17,'grossa','manhã','09:00:00',55),(9,18,'grossa','manhã','10:00:00',44),(10,23,'grossa','manhã','10:10:00',54),(11,24,'grossa','manhã','09:40:00',44),(12,28,'grossa','manhã','11:00:00',40),(13,29,'grossa','manhã','09:00:00',42),(14,30,'grossa','manhã','09:00:00',54),(15,31,'grossa','manhã','09:20:00',46),(16,34,'grossa','manhã','09:00:00',40),(17,36,'grossa','manhã','09:10:00',44),(18,42,'grossa','manhã','11:00:00',38),(19,43,'grossa','manhã','09:00:00',44),(20,44,'grossa','manhã','09:50:00',54),(21,45,'grossa','manhã','10:05:00',44),(22,46,'grossa','manhã','11:00:00',40),(23,47,'grossa','manhã','11:00:00',36),(24,48,'grossa','manhã','10:00:00',36),(32,5,'grossa','manhã',NULL,56),(33,7,'grossa','manhã',NULL,42),(34,13,'grossa','manhã',NULL,40),(35,14,'grossa','manhã',NULL,40),(36,15,'grossa','manhã',NULL,38),(37,16,'grossa','manhã',NULL,44),(38,22,'grossa','manhã',NULL,42),(39,25,'grossa','manhã',NULL,44),(40,26,'grossa','manhã',NULL,38),(41,27,'grossa','manhã',NULL,42),(42,32,'grossa','manhã',NULL,42),(43,33,'grossa','manhã',NULL,36),(44,35,'grossa','manhã',NULL,40),(45,37,'grossa','manhã',NULL,56),(46,38,'grossa','manhã',NULL,46),(47,39,'grossa','manhã',NULL,40),(48,40,'grossa','manhã',NULL,36),(49,41,'grossa','manhã',NULL,38),(63,4,'grossa','tarde','19:30:00',30),(64,6,'grossa','tarde','18:30:00',50),(65,8,'grossa','tarde','19:00:00',50),(66,9,'grossa','tarde','19:15:00',34),(67,11,'grossa','tarde','19:00:00',54),(68,12,'grossa','tarde','19:00:00',46),(69,13,'grossa','tarde','19:10:00',50),(70,14,'grossa','tarde','19:00:00',44),(71,15,'grossa','tarde','18:50:00',50),(72,18,'grossa','tarde','18:40:00',56),(73,22,'grossa','tarde','10:00:00',36),(74,24,'grossa','tarde','19:00:00',56),(75,26,'grossa','tarde','18:20:00',46),(76,27,'grossa','tarde','19:00:00',46),(77,28,'grossa','tarde','18:40:00',42),(78,31,'grossa','tarde','18:50:00',56),(79,33,'grossa','tarde','19:10:00',50),(80,34,'grossa','tarde','18:45:00',46),(81,35,'grossa','tarde','18:50:00',46),(82,36,'grossa','tarde','18:50:00',34),(83,38,'grossa','tarde','18:50:00',56),(84,39,'grossa','tarde','19:00:00',44),(85,41,'grossa','tarde','19:10:00',50),(86,42,'grossa','tarde','18:30:00',48),(87,43,'grossa','tarde','19:30:00',36),(88,46,'grossa','tarde','19:10:00',46),(89,48,'grossa','tarde','18:50:00',48),(94,7,'grossa','tarde',NULL,48),(95,16,'grossa','tarde',NULL,34),(98,25,'grossa','tarde',NULL,50),(99,29,'grossa','tarde',NULL,36),(100,32,'grossa','tarde',NULL,46),(101,40,'grossa','tarde',NULL,48),(103,45,'grossa','tarde',NULL,56),(104,47,'grossa','tarde',NULL,46),(109,6,'fina','manhã','10:00:00',30),(110,23,'fina','manhã','10:30:00',33),(111,30,'fina','manhã','10:00:00',38),(112,44,'fina','manhã','10:30:00',31),(116,4,'fina','manhã',NULL,24),(117,5,'fina','manhã',NULL,26),(118,7,'fina','manhã',NULL,21),(119,8,'fina','manhã',NULL,19),(410,355,'grossa','manha',NULL,38),(411,355,'fina','manha','11:00:00',30),(412,355,'grossa','tarde',NULL,46),(413,355,'fina','tarde',NULL,23),(428,363,'grossa','manha',NULL,34),(429,363,'fina','manha',NULL,18),(430,363,'grossa','tarde',NULL,46),(431,363,'fina','tarde',NULL,26),(432,364,'grossa','manha',NULL,35),(433,364,'fina','manha',NULL,20),(434,364,'grossa','tarde','19:30:00',48),(435,364,'fina','tarde',NULL,27),(436,365,'grossa','manha','08:30:00',46),(437,365,'fina','manha','10:00:00',30),(438,365,'grossa','tarde','19:30:00',30),(439,365,'fina','tarde','19:30:00',25),(442,367,'grossa','manha',NULL,57),(443,367,'fina','manha',NULL,28),(444,375,'grossa','manha','10:30:00',44),(445,375,'fina','manha',NULL,26),(446,375,'grossa','tarde','18:30:00',50),(447,375,'fina','tarde','19:00:00',34),(448,376,'grossa','manha',NULL,34),(449,376,'fina','manha',NULL,19),(450,376,'grossa','tarde','19:05:00',46),(451,376,'fina','tarde',NULL,33),(452,377,'grossa','manha','09:30:00',36),(453,377,'fina','manha',NULL,31),(454,377,'grossa','tarde','19:25:00',48),(455,377,'fina','tarde',NULL,15),(456,378,'grossa','manha','08:30:00',38),(457,378,'fina','manha',NULL,23),(458,378,'grossa','tarde','19:20:00',48),(459,378,'fina','tarde',NULL,31),(460,380,'grossa','manha',NULL,44),(461,380,'fina','manha',NULL,23),(462,380,'grossa','tarde','18:20:00',30),(463,380,'fina','tarde',NULL,29),(464,381,'grossa','manha','10:30:00',58),(465,381,'fina','manha',NULL,33);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predicion`
--

LOCK TABLES `predicion` WRITE;
/*!40000 ALTER TABLE `predicion` DISABLE KEYS */;
INSERT INTO `predicion` VALUES (65,'2025-04-14','Monday',44,56,30,36),(66,'2025-04-15','Tuesday',41,47,27,37),(67,'2025-04-16','Wednesday',38,49,30,38),(68,'2025-04-17','Thursday',39,47,29,36),(69,'2025-04-18','Friday',38,49,29,38),(70,'2025-04-19','Saturday',54,34,31,32),(71,'2025-04-20','Sunday',55,0,36,0),(74,'2025-04-16','quarta-feira',38,50,32,40),(79,'2025-04-22','Tuesday',40,47,20,30),(80,'2025-04-23','Wednesday',37,48,22,32),(81,'2025-04-24','Thursday',38,47,22,31),(82,'2025-04-25','Friday',38,49,20,33),(83,'2025-04-26','Saturday',43,33,25,24),(84,'2025-04-27','Sunday',55,0,32,0),(86,'2025-04-28','Monday',43,55,24,35),(87,'2025-04-29','Tuesday',40,47,21,31),(88,'2025-04-30','Wednesday',37,48,22,32),(89,'2025-05-01','Thursday',38,47,23,30),(90,'2025-05-02','Friday',38,49,20,32),(91,'2025-05-03','Saturday',44,33,24,24),(92,'2025-05-04','Sunday',56,0,32,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telas`
--

LOCK TABLES `telas` WRITE;
/*!40000 ALTER TABLE `telas` DISABLE KEYS */;
INSERT INTO `telas` VALUES (4,'2025-03-01','sábado',45,30,27,28),(5,'2025-03-02','domingo',56,0,36,0),(6,'2025-03-05','quarta-feira',45,50,30,32),(7,'2025-03-06','quinta-feira',42,48,30,42),(8,'2025-03-07','sexta-feira',38,50,37,38),(9,'2025-03-08','sábado',44,34,33,34),(10,'2025-03-09','domingo',54,0,35,0),(11,'2025-03-10','segunda-feira',44,54,30,35),(12,'2025-03-11','terça-feira',40,46,29,37),(13,'2025-03-12','quarta-feira',40,50,28,42),(14,'2025-03-13','quinta-feira',40,44,32,45),(15,'2025-03-14','sexta-feira',38,50,28,34),(16,'2025-03-15','sábado',44,34,29,34),(17,'2025-03-16','domingo',55,0,39,0),(18,'2025-03-17','segunda-feira',44,56,29,38),(22,'2025-02-01','sábado',42,36,31,32),(23,'2025-02-02','domingo',54,0,33,0),(24,'2025-02-03','segunda-feira',44,56,30,36),(25,'2025-02-04','terça-feira',44,50,30,37),(26,'2025-02-05','quarta-feira',38,46,32,38),(27,'2025-02-06','quinta-feira',42,46,28,31),(28,'2025-02-07','sexta-feira',40,42,28,40),(29,'2025-02-08','sábado',42,36,28,29),(30,'2025-02-09','domingo',54,0,38,0),(31,'2025-02-10','segunda-feira',46,56,30,32),(32,'2025-02-11','terça-feira',42,46,28,40),(33,'2025-02-12','quarta-feira',36,50,30,36),(34,'2025-02-13','quinta-feira',40,46,25,33),(35,'2025-02-14','sexta-feira',40,46,28,39),(36,'2025-02-15','sábado',44,34,30,32),(37,'2025-02-16','domingo',56,0,34,0),(38,'2025-02-17','segunda-feira',46,56,30,40),(39,'2025-02-18','terça-feira',40,44,28,43),(40,'2025-02-19','quarta-feira',36,48,41,39),(41,'2025-02-20','quinta-feira',38,50,25,30),(42,'2025-02-21','sexta-feira',38,48,25,44),(43,'2025-02-22','sábado',44,36,30,26),(44,'2025-02-23','domingo',54,0,31,0),(45,'2025-02-24','segunda-feira',44,56,30,33),(46,'2025-02-25','terça-feira',40,46,21,34),(47,'2025-02-26','quarta-feira',36,46,26,37),(48,'2025-02-27','quinta-feira',36,48,26,38),(115,'2025-03-18','terça-feira',42,46,25,39),(117,'2025-03-19','quarta-feira',40,50,31,41),(118,'2025-03-20','quinta-feira',38,44,35,30),(119,'2025-03-21','sexta-feira',36,52,25,36),(120,'2025-03-22','sábado',42,34,31,29),(121,'2025-03-23','domingo',56,0,34,0),(122,'2025-03-24','segunda-feira',44,58,30,39),(123,'2025-03-25','terça-feira',40,48,28,36),(124,'2025-03-26','quarta-feira',36,50,29,42),(125,'2025-03-27','quinta-feira',38,46,34,40),(126,'2025-03-28','sexta-feira',38,50,35,37),(127,'2025-03-29','sábado',44,35,32,37),(128,'2025-03-30','domingo',56,0,37,0),(202,'2025-03-31','segunda-feira',40,54,29,36),(203,'2025-04-01','terça-feira',40,48,25,34),(204,'2025-04-02','quarta-feira',35,48,31,42),(205,'2025-04-03','quinta-feira',40,48,25,36),(206,'2025-04-04','sexta-feira',38,48,29,30),(240,'2025-04-07','segunda-feira',42,56,28,35),(242,'2025-04-08','terça-feira',38,48,25,34),(243,'2025-04-09','quarta-feira',36,48,25,30),(244,'2025-04-10','quinta-feira',37,46,28,34),(245,'2025-04-11','sexta-feira',38,53,30,45),(246,'2025-04-12','sábado',46,33,35,37),(247,'2025-04-13','domingo',57,0,43,0),(354,'2025-04-14','segunda-feira',42,58,29,40),(355,'2025-04-15','terça-feira',40,50,30,37),(363,'2025-04-16','quarta-feira',38,50,32,40),(364,'2025-04-17','quinta-feira',36,48,34,32),(365,'2025-04-19','sábado',46,30,30,25),(367,'2025-04-20','domingo',58,0,35,0),(375,'2025-04-22','terça-feira',44,50,31,34),(376,'2025-04-23','quarta-feira',36,46,28,41),(377,'2025-04-24','quinta-feira',36,48,32,31),(378,'2025-04-25','sexta-feira',38,48,31,36),(380,'2025-04-26','sábado',46,30,33,35),(381,'2025-04-27','domingo',58,0,38,0),(382,'2025-04-28','Monday',43,55,24,35),(383,'2025-04-29','Tuesday',40,47,21,31),(384,'2025-04-30','Wednesday',37,48,22,32),(385,'2025-05-01','Thursday',38,47,23,30),(386,'2025-05-02','Friday',38,49,20,32),(387,'2025-05-03','Saturday',44,33,24,24),(388,'2025-05-04','Sunday',56,0,32,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telas_vendidas3`
--

LOCK TABLES `telas_vendidas3` WRITE;
/*!40000 ALTER TABLE `telas_vendidas3` DISABLE KEYS */;
INSERT INTO `telas_vendidas3` VALUES (1,4,'2025-03-01','sábado',45,30,24,20),(2,5,'2025-03-02','domingo',56,0,26,0),(3,6,'2025-03-05','quarta-feira',45,50,30,32),(4,7,'2025-03-06','quinta-feira',42,48,21,27),(5,8,'2025-03-07','sexta-feira',38,50,19,33),(6,9,'2025-03-08','sábado',44,34,24,24),(7,10,'2025-03-09','domingo',54,0,30,0),(8,11,'2025-03-10','segunda-feira',44,54,28,34),(9,12,'2025-03-11','terça-feira',40,46,22,34),(10,13,'2025-03-12','quarta-feira',40,50,18,25),(11,14,'2025-03-13','quinta-feira',40,44,17,32),(12,15,'2025-03-14','sexta-feira',38,50,18,34),(13,16,'2025-03-15','sábado',44,34,20,19),(14,17,'2025-03-16','domingo',55,0,35,0),(15,18,'2025-03-17','segunda-feira',44,56,23,38),(16,22,'2025-02-01','sábado',42,36,19,27),(17,23,'2025-02-02','domingo',54,0,33,0),(18,24,'2025-02-03','segunda-feira',44,56,25,34),(19,25,'2025-02-04','terça-feira',44,50,21,20),(20,26,'2025-02-05','quarta-feira',38,46,23,38),(21,27,'2025-02-06','quinta-feira',42,46,27,31),(22,28,'2025-02-07','sexta-feira',40,42,20,37),(23,29,'2025-02-08','sábado',42,36,26,18),(24,30,'2025-02-09','domingo',54,0,38,0),(25,31,'2025-02-10','segunda-feira',46,56,25,32),(26,32,'2025-02-11','terça-feira',42,46,20,30),(27,33,'2025-02-12','quarta-feira',36,50,23,36),(28,34,'2025-02-13','quinta-feira',40,46,24,33),(29,35,'2025-02-14','sexta-feira',40,46,18,33),(30,36,'2025-02-15','sábado',44,34,28,28),(31,37,'2025-02-16','domingo',56,0,29,0),(32,38,'2025-02-17','segunda-feira',46,56,22,40),(33,39,'2025-02-18','terça-feira',40,44,19,30),(34,40,'2025-02-19','quarta-feira',36,48,32,29),(35,41,'2025-02-20','quinta-feira',38,50,24,30),(36,42,'2025-02-21','sexta-feira',38,48,19,39),(37,43,'2025-02-22','sábado',44,36,29,25),(38,44,'2025-02-23','domingo',54,0,31,0),(39,45,'2025-02-24','segunda-feira',44,56,27,32),(40,46,'2025-02-25','terça-feira',40,46,19,33),(41,47,'2025-02-26','quarta-feira',36,46,20,31),(42,48,'2025-02-27','quinta-feira',36,48,20,36),(43,115,'2025-03-18','terça-feira',38,46,16,32),(44,117,'2025-03-19','quarta-feira',40,44,20,30),(45,118,'2025-03-20','quinta-feira',37,44,25,30),(46,119,'2025-03-21','sexta-feira',36,52,20,33),(47,120,'2025-03-22','sábado',42,29,22,27),(48,121,'2025-03-23','domingo',56,0,34,0),(49,122,'2025-03-24','segunda-feira',39,54,20,35),(50,123,'2025-03-25','terça-feira',40,48,21,32),(51,124,'2025-03-26','quarta-feira',35,50,17,32),(52,125,'2025-03-27','quinta-feira',38,46,20,30),(53,126,'2025-03-28','sexta-feira',36,50,27,30),(54,127,'2025-03-29','sábado',44,33,27,27),(55,128,'2025-03-30','domingo',56,0,33,0),(56,202,'2025-03-31','segunda-feira',40,54,23,36),(57,203,'2025-04-01','terça-feira',36,46,20,28),(58,204,'2025-04-02','quarta-feira',35,48,21,42),(59,205,'2025-04-03','quinta-feira',37,44,18,32),(60,206,'2025-04-04','sexta-feira',38,48,20,25),(61,240,'2025-04-07','segunda-feira',42,56,25,35),(62,242,'2025-04-08','terça-feira',38,48,23,34),(63,243,'2025-04-09','quarta-feira',36,48,23,30),(64,244,'2025-04-10','quinta-feira',37,53,24,33),(65,245,'2025-04-11','sexta-feira',38,53,20,30),(66,246,'2025-04-12','sábado',41,30,21,19),(67,247,'2025-04-13','domingo',57,0,34,0),(131,363,'2025-04-16','quarta-feira',34,46,18,26),(132,364,'2025-04-17','quinta-feira',35,48,20,27),(133,365,'2025-04-19','sábado',46,30,30,25),(135,367,'2025-04-20','domingo',57,0,28,0),(136,375,'2025-04-22','terça-feira',44,50,26,34),(137,376,'2025-04-23','quarta-feira',34,46,19,33),(138,377,'2025-04-24','quinta-feira',36,48,31,15),(139,378,'2025-04-25','sexta-feira',38,48,23,31),(140,380,'2025-04-26','sábado',44,30,23,29),(141,381,'2025-04-27','domingo',58,0,33,0);
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

-- Dump completed on 2025-05-01 22:16:51
