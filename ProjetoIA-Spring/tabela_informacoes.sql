-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: api_6sem
-- ------------------------------------------------------
-- Server version	8.0.36

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

--P
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'area 1','descricao da area 1',1),(2,'area 222','descricao kkkk',1);
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_redzone`
--

DROP TABLE IF EXISTS `entrada_redzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_redzone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_redzone` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_redzone_entrada_idx` (`id_redzone`),
  CONSTRAINT `id_redzone_entrada` FOREIGN KEY (`id_redzone`) REFERENCES `redzone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_redzone`
--

LOCK TABLES `entrada_redzone` WRITE;
/*!40000 ALTER TABLE `entrada_redzone` DISABLE KEYS */;
INSERT INTO `entrada_redzone` VALUES (5,'2024-05-02 01:03:46',5),(6,'2024-05-01 12:03:46',5),(7,'2024-04-30 01:03:46',5),(8,'2024-04-29 01:03:46',5),(9,'2024-04-28 01:03:46',6),(10,'2024-04-27 01:03:46',6),(11,'2024-05-01 01:03:46',7),(12,'2024-05-19 01:03:46',7),(13,'2024-04-19 01:03:46',8),(14,'2024-04-26 01:03:46',5),(15,'2024-04-26 01:03:46',6),(16,'2024-05-04 01:03:46',10),(17,'2024-05-04 01:03:46',10),(18,'2024-05-04 01:03:46',10),(19,'2024-05-05 12:00:10',11),(20,'2024-05-05 16:21:00',12);
/*!40000 ALTER TABLE `entrada_redzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papel`
--

DROP TABLE IF EXISTS `papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papel`
--

LOCK TABLES `papel` WRITE;
/*!40000 ALTER TABLE `papel` DISABLE KEYS */;
INSERT INTO `papel` VALUES (1,'Administrador','Papel do Administrador'),(2,'Gerente de Segurança','Papel do Gerente de Segurança'),(3,'Segurança','Papel do Segurança');
/*!40000 ALTER TABLE `papel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redzone`
--

DROP TABLE IF EXISTS `redzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redzone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `id_area` bigint DEFAULT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_area_in_redzone_fk_idx` (`id_area`),
  CONSTRAINT `id_area_in_redzone_fk` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redzone`
--

LOCK TABLES `redzone` WRITE;
/*!40000 ALTER TABLE `redzone` DISABLE KEYS */;
INSERT INTO `redzone` VALUES (5,'redzone 2','redzone 2','2024-05-02 01:21:02',NULL,0),(6,'redzone 3','redzone 3','2024-05-01 01:21:09',NULL,1),(7,'redzone 4','redzone 4','2024-04-30 01:21:13',NULL,1),(8,'redzone 5','redzone 5','2024-04-29 01:21:18',NULL,1),(9,'teste front','aa','2024-04-28 17:27:29',NULL,1),(10,'teste redzone status alterando ao deletar','oi teste','2024-05-04 00:37:13',NULL,1),(11,'teste redzone com area','descricao teste','2024-05-11 01:56:37',1,1),(12,'C','C','2024-05-13 17:35:43',1,1),(13,'Teste redzone atualizado','Tteste atualiazdo','2024-05-13 17:41:31',2,0),(14,'teste redzone com area :)','teste descricao redzone com area','2024-05-13 18:10:12',2,0);
/*!40000 ALTER TABLE `redzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saida_redzone`
--

DROP TABLE IF EXISTS `saida_redzone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saida_redzone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `id_redzone` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_redzone_saida_idx` (`id_redzone`),
  CONSTRAINT `id_redzone_saida` FOREIGN KEY (`id_redzone`) REFERENCES `redzone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saida_redzone`
--

LOCK TABLES `saida_redzone` WRITE;
/*!40000 ALTER TABLE `saida_redzone` DISABLE KEYS */;
INSERT INTO `saida_redzone` VALUES (1,'2024-04-18 01:03:46',5),(2,'2024-04-18 01:03:46',5),(3,'2024-04-18 01:03:46',5),(4,'2024-04-18 01:03:46',5),(5,'2024-04-18 01:03:46',7),(6,'2024-04-18 01:03:46',7);
/*!40000 ALTER TABLE `saida_redzone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `id_papel` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_papel_em_usuario_idx` (`id_papel`),
  CONSTRAINT `id_papel_em_usuario` FOREIGN KEY (`id_papel`) REFERENCES `papel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 15:23:46
