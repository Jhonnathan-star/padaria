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
  `id_horarios` int NOT NULL AUTO_INCREMENT,
  `id_telas_vendidas3` int NOT NULL,
  `tipo_pao` enum('grossa','fina') NOT NULL,
  `turno` varchar(6) NOT NULL,
  `horario` time DEFAULT NULL,
  PRIMARY KEY (`id_horarios`),
  KEY `id_telas_vendidas3_idx` (`id_telas_vendidas3`),
  CONSTRAINT `id_telas_vendidas3` FOREIGN KEY (`id_telas_vendidas3`) REFERENCES `telas_vendidas3` (`id_telas_vendidas3`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,1,'grossa','manhã','11:00:00'),(2,3,'grossa','manhã','09:40:00'),(3,5,'grossa','manhã','10:00:00'),(4,6,'grossa','manhã','11:00:00'),(5,7,'grossa','manhã','09:45:00'),(6,8,'grossa','manhã','09:10:00'),(7,9,'grossa','manhã','10:00:00'),(8,14,'grossa','manhã','09:00:00'),(9,15,'grossa','manhã','10:00:00'),(10,17,'grossa','manhã','10:10:00'),(11,18,'grossa','manhã','09:40:00'),(12,22,'grossa','manhã','11:00:00'),(13,23,'grossa','manhã','09:00:00'),(14,24,'grossa','manhã','09:00:00'),(15,25,'grossa','manhã','09:20:00'),(16,28,'grossa','manhã','09:00:00'),(17,30,'grossa','manhã','09:10:00'),(18,36,'grossa','manhã','11:00:00'),(19,37,'grossa','manhã','09:00:00'),(20,38,'grossa','manhã','09:50:00'),(21,39,'grossa','manhã','10:05:00'),(22,40,'grossa','manhã','11:00:00'),(23,41,'grossa','manhã','11:00:00'),(24,42,'grossa','manhã','10:00:00'),(32,2,'grossa','manhã',NULL),(33,4,'grossa','manhã',NULL),(34,10,'grossa','manhã',NULL),(35,11,'grossa','manhã',NULL),(36,12,'grossa','manhã',NULL),(37,13,'grossa','manhã',NULL),(38,16,'grossa','manhã',NULL),(39,19,'grossa','manhã',NULL),(40,20,'grossa','manhã',NULL),(41,21,'grossa','manhã',NULL),(42,26,'grossa','manhã',NULL),(43,27,'grossa','manhã',NULL),(44,29,'grossa','manhã',NULL),(45,31,'grossa','manhã',NULL),(46,32,'grossa','manhã',NULL),(47,33,'grossa','manhã',NULL),(48,34,'grossa','manhã',NULL),(49,35,'grossa','manhã',NULL),(63,1,'grossa','tarde','19:30:00'),(64,3,'grossa','tarde','18:30:00'),(65,5,'grossa','tarde','19:00:00'),(66,6,'grossa','tarde','19:15:00'),(67,8,'grossa','tarde','19:00:00'),(68,9,'grossa','tarde','19:00:00'),(69,10,'grossa','tarde','19:10:00'),(70,11,'grossa','tarde','19:00:00'),(71,12,'grossa','tarde','18:50:00'),(72,15,'grossa','tarde','18:40:00'),(73,16,'grossa','tarde','10:00:00'),(74,18,'grossa','tarde','19:00:00'),(75,20,'grossa','tarde','18:20:00'),(76,21,'grossa','tarde','19:00:00'),(77,22,'grossa','tarde','18:40:00'),(78,25,'grossa','tarde','18:50:00'),(79,27,'grossa','tarde','19:10:00'),(80,28,'grossa','tarde','18:45:00'),(81,29,'grossa','tarde','18:50:00'),(82,30,'grossa','tarde','18:50:00'),(83,32,'grossa','tarde','18:50:00'),(84,33,'grossa','tarde','19:00:00'),(85,35,'grossa','tarde','19:10:00'),(86,36,'grossa','tarde','18:30:00'),(87,37,'grossa','tarde','19:30:00'),(88,40,'grossa','tarde','19:10:00'),(89,42,'grossa','tarde','18:50:00'),(94,4,'grossa','tarde',NULL),(95,13,'grossa','tarde',NULL),(98,19,'grossa','tarde',NULL),(99,23,'grossa','tarde',NULL),(100,26,'grossa','tarde',NULL),(101,34,'grossa','tarde',NULL),(103,39,'grossa','tarde',NULL),(104,41,'grossa','tarde',NULL),(109,3,'fina','manhã','10:00:00'),(110,17,'fina','manhã','10:30:00'),(111,24,'fina','manhã','10:00:00'),(112,38,'fina','manhã','10:30:00'),(116,1,'fina','manhã',NULL),(117,2,'fina','manhã',NULL),(118,4,'fina','manhã',NULL),(119,5,'fina','manhã',NULL),(120,6,'fina','manhã',NULL),(121,7,'fina','manhã',NULL),(122,8,'fina','manhã',NULL),(123,9,'fina','manhã',NULL),(124,10,'fina','manhã',NULL),(125,11,'fina','manhã',NULL),(126,12,'fina','manhã',NULL),(127,13,'fina','manhã',NULL),(128,14,'fina','manhã',NULL),(129,15,'fina','manhã',NULL),(130,16,'fina','manhã',NULL),(131,18,'fina','manhã',NULL),(132,19,'fina','manhã',NULL),(133,20,'fina','manhã',NULL),(134,21,'fina','manhã',NULL),(135,22,'fina','manhã',NULL),(136,23,'fina','manhã',NULL),(137,25,'fina','manhã',NULL),(138,26,'fina','manhã',NULL),(139,27,'fina','manhã',NULL),(140,28,'fina','manhã',NULL),(141,29,'fina','manhã',NULL),(142,30,'fina','manhã',NULL),(143,31,'fina','manhã',NULL),(144,32,'fina','manhã',NULL),(145,33,'fina','manhã',NULL),(146,34,'fina','manhã',NULL),(147,35,'fina','manhã',NULL),(148,36,'fina','manhã',NULL),(149,37,'fina','manhã',NULL),(150,39,'fina','manhã',NULL),(151,40,'fina','manhã',NULL),(152,41,'fina','manhã',NULL),(153,42,'fina','manhã',NULL),(249,3,'fina','tarde','19:00:00'),(250,12,'fina','tarde','19:00:00'),(251,15,'fina','tarde','19:20:00'),(252,20,'fina','tarde','19:00:00'),(253,21,'fina','tarde','19:20:00'),(254,25,'fina','tarde','19:10:00'),(255,27,'fina','tarde','19:20:00'),(256,28,'fina','tarde','19:20:00'),(257,32,'fina','tarde','19:30:00'),(258,35,'fina','tarde','19:20:00'),(264,1,'fina','tarde',NULL),(265,4,'fina','tarde',NULL),(266,5,'fina','tarde',NULL),(267,6,'fina','tarde',NULL),(268,8,'fina','tarde',NULL),(269,9,'fina','tarde',NULL),(270,10,'fina','tarde',NULL),(271,11,'fina','tarde',NULL),(272,13,'fina','tarde',NULL),(273,16,'fina','tarde',NULL),(274,18,'fina','tarde',NULL),(275,19,'fina','tarde',NULL),(276,22,'fina','tarde',NULL),(277,23,'fina','tarde',NULL),(278,26,'fina','tarde',NULL),(279,29,'fina','tarde',NULL),(280,30,'fina','tarde',NULL),(281,33,'fina','tarde',NULL),(282,34,'fina','tarde',NULL),(283,36,'fina','tarde',NULL),(284,37,'fina','tarde',NULL),(286,39,'fina','tarde',NULL),(287,40,'fina','tarde',NULL),(288,41,'fina','tarde',NULL),(289,42,'fina','tarde',NULL),(344,43,'grossa','manha',NULL),(345,43,'fina','manha',NULL),(346,43,'grossa','tarde','19:10:00'),(347,43,'fina','tarde',NULL),(350,44,'grossa','manha','11:00:00'),(351,44,'fina','manha',NULL),(352,44,'grossa','tarde',NULL),(353,44,'fina','tarde',NULL),(354,45,'grossa','manha',NULL),(355,45,'fina','manha',NULL),(356,45,'grossa','tarde','18:40:00'),(357,45,'fina','tarde','19:30:00'),(358,46,'grossa','manha','09:30:00'),(359,46,'fina','manha',NULL),(360,46,'grossa','tarde','19:15:00'),(361,46,'fina','tarde',NULL),(362,47,'grossa','manha','09:50:00'),(363,47,'fina','manha',NULL),(364,47,'grossa','tarde','19:00:00'),(365,47,'fina','tarde',NULL),(366,48,'grossa','manha','10:20:00'),(367,48,'fina','manha','09:50:00'),(368,49,'grossa','manha',NULL),(369,49,'fina','manha',NULL),(370,49,'grossa','tarde',NULL),(371,49,'fina','tarde',NULL),(372,50,'grossa','manha','11:00:00'),(373,50,'fina','manha',NULL),(374,50,'grossa','tarde','19:30:00'),(375,50,'fina','tarde',NULL),(376,51,'grossa','manha',NULL),(377,51,'fina','manha',NULL),(378,51,'grossa','tarde','19:25:00'),(379,51,'fina','tarde',NULL),(380,52,'grossa','manha','09:30:00'),(381,52,'fina','manha',NULL),(382,52,'grossa','tarde','19:15:00'),(383,52,'fina','tarde',NULL),(384,53,'grossa','manha',NULL),(385,53,'fina','manha',NULL),(386,53,'grossa','tarde','19:30:00'),(387,53,'fina','tarde',NULL),(388,54,'grossa','manha','11:00:00'),(389,54,'fina','manha',NULL),(390,54,'grossa','tarde',NULL),(391,54,'fina','tarde',NULL),(392,55,'grossa','manha','09:30:00'),(393,55,'fina','manha',NULL),(473,56,'grossa','manha','09:00:00'),(474,56,'fina','manha',NULL),(475,56,'grossa','tarde','19:00:00'),(476,56,'fina','tarde','19:30:00'),(477,57,'grossa','manha',NULL),(478,57,'fina','manha',NULL),(479,57,'grossa','tarde',NULL),(480,57,'fina','tarde',NULL),(481,58,'grossa','manha','09:10:00'),(482,58,'fina','manha',NULL),(483,58,'grossa','tarde','19:00:00'),(484,58,'fina','tarde','19:20:00'),(485,59,'grossa','manha',NULL),(486,59,'fina','manha',NULL),(487,59,'grossa','tarde',NULL),(488,59,'fina','tarde',NULL),(489,60,'grossa','manha','11:00:00'),(490,60,'fina','manha',NULL),(491,60,'grossa','tarde','19:00:00'),(492,60,'fina','tarde',NULL),(509,61,'grossa','manha','11:00:00'),(510,61,'fina','manha',NULL),(511,61,'grossa','tarde','18:40:00'),(512,61,'fina','tarde','19:10:00'),(513,62,'grossa','manha','09:05:00'),(514,62,'fina','manha',NULL),(515,62,'grossa','tarde','19:00:00'),(516,62,'fina','tarde','19:20:00'),(517,63,'grossa','manha','09:10:00'),(518,63,'fina','manha',NULL),(519,63,'grossa','tarde','19:04:00'),(520,63,'fina','tarde','19:28:00'),(521,64,'grossa','manha','08:05:00'),(522,64,'fina','manha',NULL),(523,64,'grossa','tarde','19:30:00'),(524,64,'fina','tarde',NULL),(525,65,'grossa','manha',NULL),(526,65,'fina','manha',NULL),(527,65,'grossa','tarde','19:30:00'),(528,65,'fina','tarde',NULL),(529,66,'grossa','manha',NULL),(530,66,'fina','manha',NULL),(531,66,'grossa','tarde',NULL),(532,66,'fina','tarde',NULL),(533,67,'grossa','manha','09:15:00'),(534,67,'fina','manha',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telas`
--

LOCK TABLES `telas` WRITE;
/*!40000 ALTER TABLE `telas` DISABLE KEYS */;
INSERT INTO `telas` VALUES (4,'2025-03-01','sábado',45,30,27,28),(5,'2025-03-02','domingo',56,0,36,0),(6,'2025-03-05','quarta-feira',45,50,30,32),(7,'2025-03-06','quinta-feira',42,48,30,42),(8,'2025-03-07','sexta-feira',38,50,37,38),(9,'2025-03-08','sábado',44,34,33,34),(10,'2025-03-09','domingo',54,0,35,0),(11,'2025-03-10','segunda-feira',44,54,30,35),(12,'2025-03-11','terça-feira',40,46,29,37),(13,'2025-03-12','quarta-feira',40,50,28,42),(14,'2025-03-13','quinta-feira',40,44,32,45),(15,'2025-03-14','sexta-feira',38,50,28,34),(16,'2025-03-15','sábado',44,34,29,34),(17,'2025-03-16','domingo',55,0,39,0),(18,'2025-03-17','segunda-feira',44,56,29,38),(22,'2025-02-01','sábado',42,36,31,32),(23,'2025-02-02','domingo',54,0,33,0),(24,'2025-02-03','segunda-feira',44,56,30,36),(25,'2025-02-04','terça-feira',44,50,30,37),(26,'2025-02-05','quarta-feira',38,46,32,38),(27,'2025-02-06','quinta-feira',42,46,28,31),(28,'2025-02-07','sexta-feira',40,42,28,40),(29,'2025-02-08','sábado',42,36,28,29),(30,'2025-02-09','domingo',54,0,38,0),(31,'2025-02-10','segunda-feira',46,56,30,32),(32,'2025-02-11','terça-feira',42,46,28,40),(33,'2025-02-12','quarta-feira',36,50,30,36),(34,'2025-02-13','quinta-feira',40,46,25,33),(35,'2025-02-14','sexta-feira',40,46,28,39),(36,'2025-02-15','sábado',44,34,30,32),(37,'2025-02-16','domingo',56,0,34,0),(38,'2025-02-17','segunda-feira',46,56,30,40),(39,'2025-02-18','terça-feira',40,44,28,43),(40,'2025-02-19','quarta-feira',36,48,41,39),(41,'2025-02-20','quinta-feira',38,50,25,30),(42,'2025-02-21','sexta-feira',38,48,25,44),(43,'2025-02-22','sábado',44,36,30,26),(44,'2025-02-23','domingo',54,0,31,0),(45,'2025-02-24','segunda-feira',44,56,30,33),(46,'2025-02-25','terça-feira',40,46,21,34),(47,'2025-02-26','quarta-feira',36,46,26,37),(48,'2025-02-27','quinta-feira',36,48,26,38),(115,'2025-03-18','terça-feira',42,46,25,39),(117,'2025-03-19','quarta-feira',40,50,31,41),(118,'2025-03-20','quinta-feira',38,44,35,30),(119,'2025-03-21','sexta-feira',36,52,25,36),(120,'2025-03-22','sábado',42,34,31,29),(121,'2025-03-23','domingo',56,0,34,0),(122,'2025-03-24','segunda-feira',44,58,30,39),(123,'2025-03-25','terça-feira',40,48,28,36),(124,'2025-03-26','quarta-feira',36,50,29,42),(125,'2025-03-27','quinta-feira',38,46,34,40),(126,'2025-03-28','sexta-feira',38,50,35,37),(127,'2025-03-29','sábado',44,35,32,37),(128,'2025-03-30','domingo',56,0,37,0),(202,'2025-03-31','segunda-feira',40,54,29,36),(203,'2025-04-01','terça-feira',40,48,25,34),(204,'2025-04-02','quarta-feira',35,48,31,42),(205,'2025-04-03','quinta-feira',40,48,25,36),(206,'2025-04-04','sexta-feira',38,48,29,30),(240,'2025-04-07','segunda-feira',42,56,28,35),(242,'2025-04-08','terça-feira',38,48,25,34),(243,'2025-04-09','quarta-feira',36,48,25,30),(244,'2025-04-10','quinta-feira',37,46,28,34),(245,'2025-04-11','sexta-feira',38,53,30,45),(246,'2025-04-12','sábado',46,33,35,37),(247,'2025-04-13','domingo',57,0,43,0),(338,'2025-04-21','Monday',43,56,24,35),(339,'2025-04-22','Tuesday',40,47,21,30),(340,'2025-04-23','Wednesday',37,48,22,32),(341,'2025-04-24','Thursday',38,47,22,31),(342,'2025-04-25','Friday',38,49,20,33),(343,'2025-04-26','Saturday',44,33,25,24),(344,'2025-04-27','Sunday',55,0,32,0),(345,'2025-04-14','segunda-feira',42,58,29,40);
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telas_vendidas3`
--

LOCK TABLES `telas_vendidas3` WRITE;
/*!40000 ALTER TABLE `telas_vendidas3` DISABLE KEYS */;
INSERT INTO `telas_vendidas3` VALUES (1,4,'2025-03-01','sábado',45,30,24,20),(2,5,'2025-03-02','domingo',56,0,26,0),(3,6,'2025-03-05','quarta-feira',45,50,30,32),(4,7,'2025-03-06','quinta-feira',42,48,21,27),(5,8,'2025-03-07','sexta-feira',38,50,19,33),(6,9,'2025-03-08','sábado',44,34,24,24),(7,10,'2025-03-09','domingo',54,0,30,0),(8,11,'2025-03-10','segunda-feira',44,54,28,34),(9,12,'2025-03-11','terça-feira',40,46,22,34),(10,13,'2025-03-12','quarta-feira',40,50,18,25),(11,14,'2025-03-13','quinta-feira',40,44,17,32),(12,15,'2025-03-14','sexta-feira',38,50,18,34),(13,16,'2025-03-15','sábado',44,34,20,19),(14,17,'2025-03-16','domingo',55,0,35,0),(15,18,'2025-03-17','segunda-feira',44,56,23,38),(16,22,'2025-02-01','sábado',42,36,19,27),(17,23,'2025-02-02','domingo',54,0,33,0),(18,24,'2025-02-03','segunda-feira',44,56,25,34),(19,25,'2025-02-04','terça-feira',44,50,21,20),(20,26,'2025-02-05','quarta-feira',38,46,23,38),(21,27,'2025-02-06','quinta-feira',42,46,27,31),(22,28,'2025-02-07','sexta-feira',40,42,20,37),(23,29,'2025-02-08','sábado',42,36,26,18),(24,30,'2025-02-09','domingo',54,0,38,0),(25,31,'2025-02-10','segunda-feira',46,56,25,32),(26,32,'2025-02-11','terça-feira',42,46,20,30),(27,33,'2025-02-12','quarta-feira',36,50,23,36),(28,34,'2025-02-13','quinta-feira',40,46,24,33),(29,35,'2025-02-14','sexta-feira',40,46,18,33),(30,36,'2025-02-15','sábado',44,34,28,28),(31,37,'2025-02-16','domingo',56,0,29,0),(32,38,'2025-02-17','segunda-feira',46,56,22,40),(33,39,'2025-02-18','terça-feira',40,44,19,30),(34,40,'2025-02-19','quarta-feira',36,48,32,29),(35,41,'2025-02-20','quinta-feira',38,50,24,30),(36,42,'2025-02-21','sexta-feira',38,48,19,39),(37,43,'2025-02-22','sábado',44,36,29,25),(38,44,'2025-02-23','domingo',54,0,31,0),(39,45,'2025-02-24','segunda-feira',44,56,27,32),(40,46,'2025-02-25','terça-feira',40,46,19,33),(41,47,'2025-02-26','quarta-feira',36,46,20,31),(42,48,'2025-02-27','quinta-feira',36,48,20,36),(43,115,'2025-03-18','terça-feira',38,46,16,32),(44,117,'2025-03-19','quarta-feira',40,44,20,30),(45,118,'2025-03-20','quinta-feira',37,44,25,30),(46,119,'2025-03-21','sexta-feira',36,52,20,33),(47,120,'2025-03-22','sábado',42,29,22,27),(48,121,'2025-03-23','domingo',56,0,34,0),(49,122,'2025-03-24','segunda-feira',39,54,20,35),(50,123,'2025-03-25','terça-feira',40,48,21,32),(51,124,'2025-03-26','quarta-feira',35,50,17,32),(52,125,'2025-03-27','quinta-feira',38,46,20,30),(53,126,'2025-03-28','sexta-feira',36,50,27,30),(54,127,'2025-03-29','sábado',44,33,27,27),(55,128,'2025-03-30','domingo',56,0,33,0),(56,202,'2025-03-31','segunda-feira',40,54,23,36),(57,203,'2025-04-01','terça-feira',36,46,20,28),(58,204,'2025-04-02','quarta-feira',35,48,21,42),(59,205,'2025-04-03','quinta-feira',37,44,18,32),(60,206,'2025-04-04','sexta-feira',38,48,20,25),(61,240,'2025-04-07','segunda-feira',42,56,25,35),(62,242,'2025-04-08','terça-feira',38,48,23,34),(63,243,'2025-04-09','quarta-feira',36,48,23,30),(64,244,'2025-04-10','quinta-feira',37,53,24,33),(65,245,'2025-04-11','sexta-feira',38,53,20,30),(66,246,'2025-04-12','sábado',41,30,21,19),(67,247,'2025-04-13','domingo',57,0,34,0);
/*!40000 ALTER TABLE `telas_vendidas3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztelas_predicion`
--

DROP TABLE IF EXISTS `ztelas_predicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ztelas_predicion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_P` date DEFAULT NULL,
  `semana_P` varchar(13) DEFAULT NULL,
  `telas_grossa_manha_P` int DEFAULT NULL,
  `telas_grossa_tarde_P` int DEFAULT NULL,
  `telas_fina_manha_P` int DEFAULT NULL,
  `telas_fina_tarde_P` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztelas_predicion`
--

LOCK TABLES `ztelas_predicion` WRITE;
/*!40000 ALTER TABLE `ztelas_predicion` DISABLE KEYS */;
INSERT INTO `ztelas_predicion` VALUES (52,'2025-04-15','Tuesday',40,47,25,32),(53,'2025-04-16','Wednesday',41,48,26,33),(54,'2025-04-17','Thursday',40,47,25,32),(55,'2025-04-18','Friday',40,47,26,33),(56,'2025-04-19','Saturday',37,44,22,29),(57,'2025-04-20','Sunday',52,NULL,38,NULL),(65,'2025-04-14','Monday',44,56,30,36),(66,'2025-04-15','Tuesday',41,47,27,37),(67,'2025-04-16','Wednesday',38,49,30,38),(68,'2025-04-17','Thursday',39,47,29,36),(69,'2025-04-18','Friday',38,49,29,38),(70,'2025-04-19','Saturday',54,34,31,32),(71,'2025-04-20','Sunday',55,0,36,0),(72,'2025-04-14','segunda-feira',42,58,29,40),(73,'2025-04-15','terça-feira',40,50,30,37),(74,'2025-04-16','quarta-feira',38,50,32,40),(75,'2025-04-17','quinta-feira',36,48,34,32),(76,'2025-04-19','sábado',46,30,30,25),(77,'2025-04-20','domingo',58,0,35,0);
/*!40000 ALTER TABLE `ztelas_predicion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-01 17:13:00
