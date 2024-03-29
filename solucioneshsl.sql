-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: solucioneshsl
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `documento_especificacion` varchar(60) NOT NULL,
  `codigo_fuente` varchar(140) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `tipo` varchar(60) NOT NULL,
  `codigo_tareas` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_tareas` (`codigo_tareas`),
  CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`codigo_tareas`) REFERENCES `tareas` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `cedula` int NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `telefono` varchar(22) DEFAULT NULL,
  `fecha_contratacion` datetime NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (29890437,'Elibeth','Curalli','Donde el diablo botó el sombrero','elibeth@gmail.com','0416-7351688','2023-01-01 00:00:00'),(30555724,'Henrry','Bourgeot','La morita 1, Urb. Villas de Aragua, C/ cuyagua, nro. 7','henrrybrgt@gmail.com','0414-4571302','2023-01-28 00:00:00');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_proyectos`
--

DROP TABLE IF EXISTS `empleado_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_proyectos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_proyecto` int NOT NULL,
  `cedula_empleado` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_proyecto` (`codigo_proyecto`),
  KEY `cedula_empleado` (`cedula_empleado`),
  CONSTRAINT `empleado_proyectos_ibfk_1` FOREIGN KEY (`codigo_proyecto`) REFERENCES `proyectos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `empleado_proyectos_ibfk_2` FOREIGN KEY (`cedula_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_proyectos`
--

LOCK TABLES `empleado_proyectos` WRITE;
/*!40000 ALTER TABLE `empleado_proyectos` DISABLE KEYS */;
INSERT INTO `empleado_proyectos` VALUES (1,1,30555724),(2,2,30555724),(3,2,29890437);
/*!40000 ALTER TABLE `empleado_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_tareas`
--

DROP TABLE IF EXISTS `empleado_tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_tareas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_tareas` int NOT NULL,
  `cedula_empleado` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cedula_empleado` (`cedula_empleado`),
  KEY `codigo_tareas` (`codigo_tareas`),
  CONSTRAINT `empleado_tareas_ibfk_1` FOREIGN KEY (`cedula_empleado`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `empleado_tareas_ibfk_2` FOREIGN KEY (`codigo_tareas`) REFERENCES `tareas` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_tareas`
--

LOCK TABLES `empleado_tareas` WRITE;
/*!40000 ALTER TABLE `empleado_tareas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotor`
--

DROP TABLE IF EXISTS `promotor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotor` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `cedula_empleado` int DEFAULT NULL,
  `codigo_proyecto` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cedula_empleado` (`cedula_empleado`),
  KEY `codigo_proyecto` (`codigo_proyecto`),
  CONSTRAINT `promotor_ibfk_1` FOREIGN KEY (`cedula_empleado`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `promotor_ibfk_2` FOREIGN KEY (`codigo_proyecto`) REFERENCES `proyectos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotor`
--

LOCK TABLES `promotor` WRITE;
/*!40000 ALTER TABLE `promotor` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotor_proyecto`
--

DROP TABLE IF EXISTS `promotor_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotor_proyecto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `cedula_empleado` int NOT NULL,
  `codigo_proyecto` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cedula_empleado` (`cedula_empleado`),
  KEY `codigo_proyecto` (`codigo_proyecto`),
  CONSTRAINT `promotor_proyecto_ibfk_1` FOREIGN KEY (`cedula_empleado`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `promotor_proyecto_ibfk_2` FOREIGN KEY (`codigo_proyecto`) REFERENCES `proyectos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotor_proyecto`
--

LOCK TABLES `promotor_proyecto` WRITE;
/*!40000 ALTER TABLE `promotor_proyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotor_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `denominacion_comercial` varchar(60) NOT NULL,
  `estado_actual` varchar(60) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `denominacion_comercial` (`denominacion_comercial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'sol-hsl','Soluciones HSL','Activo'),(2,'hsl','Proyecto HSL','Activo');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `duracion_estimada` varchar(10) DEFAULT NULL,
  `tipo` varchar(60) NOT NULL,
  `fecha_real` date DEFAULT NULL,
  `fecha_estimada` date DEFAULT NULL,
  `duracion_real` varchar(10) NOT NULL,
  `codigo_proyecto` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_proyecto` (`codigo_proyecto`),
  CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`codigo_proyecto`) REFERENCES `proyectos` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'Terminar','20:00:00','Código','2022-11-28','2023-01-28','23:59:00',1);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(60) NOT NULL,
  `password` varchar(16) NOT NULL,
  `administrador` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'hbourgeot','VeinteDeNota',1),(2,'henrrybrgt','solucion3sh5l',0),(3,'crimson','20deNota',1),(4,'metallica','crimson2208',0),(5,'profaponte','Tienen20',1),(6,'profgilberto','excelente2023',1),(7,'sharon','Joey2023',1),(8,'gamboa','proyecto2023',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `codigo_documentos` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_documentos` (`codigo_documentos`),
  CONSTRAINT `version_ibfk_1` FOREIGN KEY (`codigo_documentos`) REFERENCES `documentos` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-28 21:54:15
