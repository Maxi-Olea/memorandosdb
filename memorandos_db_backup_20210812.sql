CREATE DATABASE  IF NOT EXISTS `memorandos_db` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `memorandos_db`;
-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: memorandos_db
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idciudad` int NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PAIS_idpais` char(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `PAIS_idpais_idx` (`PAIS_idpais`),
  CONSTRAINT `PAIS_idpais` FOREIGN KEY (`PAIS_idpais`) REFERENCES `pais` (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (2,'Buenos Aires','ARG'),(3,'Cordoba','ARG'),(4,'San Luis','ARG'),(5,'Mendoza','ARG'),(6,'Rosario','ARG'),(7,'Santa Fe','ARG'),(8,'Corrientes','ARG'),(9,'Entre Rios','ARG'),(10,'Posadas','ARG'),(11,'San Salvador de Jujuy','ARG'),(12,'Salta','ARG'),(13,'San Miguel de Tucuman','ARG'),(14,'Santiago del Estero','ARG'),(15,'La Rioja','ARG'),(16,'Rio Negro','ARG'),(17,'Santa Cruz','ARG'),(18,'Ushuaia','ARG'),(19,'Santiago','CHL'),(20,'Viña del Mar','CHL'),(21,'Antofagasta','CHL'),(22,'Montevideo','URY'),(23,'Colonia del Sacramento','URY'),(24,'Asunción','PRY'),(25,'La Paz','BOL'),(26,'Santa Cruz de la Sierra','BOL'),(27,'San Pablo','BRA'),(28,'Rio de Janeiro','BRA'),(29,'Porto Alegre','BRA'),(30,'Lima','PER'),(31,'Quito','ECU'),(32,'Caracas','VEN'),(33,'Panamá','PAN'),(34,'Ciudad de Mexico','MEX'),(35,'Nueva York','USA'),(36,'Los Angeles','USA'),(37,'Miami','USA'),(38,'Chicago','USA'),(39,'Toronto','CAN'),(40,'Barcelona','ESP'),(41,'Paris','FRA'),(42,'Roma','ITA'),(43,'Berlin','DEU'),(44,'Londres','GBR'),(45,'Sidney','AUT'),(46,'Auckland','NZL'),(47,'Moscu','RUS'),(48,'Pekin','CHN'),(49,'Osaka','JPN'),(50,'Tokio','JPN'),(51,'Kioto','JPN');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinatario`
--

DROP TABLE IF EXISTS `destinatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinatario` (
  `MEMORANDO_idmemorando` int NOT NULL,
  `USUARIO_destinatario` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `USUARIO_destinatario_idx` (`USUARIO_destinatario`),
  KEY `MEMORANDO_idmemorando_idx` (`MEMORANDO_idmemorando`),
  CONSTRAINT `MEMORANDO_idmemorando` FOREIGN KEY (`MEMORANDO_idmemorando`) REFERENCES `memorando` (`idmemorando`),
  CONSTRAINT `USUARIO_destinatario` FOREIGN KEY (`USUARIO_destinatario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinatario`
--

LOCK TABLES `destinatario` WRITE;
/*!40000 ALTER TABLE `destinatario` DISABLE KEYS */;
INSERT INTO `destinatario` VALUES (1,4,1),(2,4,2),(2,5,3),(3,4,5),(4,2,6),(6,2,7),(7,2,9),(13,2,10),(14,4,11),(15,4,12),(16,10,13),(17,2,14),(18,4,15),(19,6,16),(20,2,17),(21,11,18),(22,9,19),(23,2,20),(24,10,21),(25,9,22),(26,6,23),(27,10,24);
/*!40000 ALTER TABLE `destinatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memorando`
--

DROP TABLE IF EXISTS `memorando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memorando` (
  `idmemorando` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(144) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `USUARIO_remitente` int NOT NULL,
  `fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`idmemorando`),
  KEY `USUARIO_remitente_idx` (`USUARIO_remitente`),
  CONSTRAINT `USUARIO_remitente` FOREIGN KEY (`USUARIO_remitente`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memorando`
--

LOCK TABLES `memorando` WRITE;
/*!40000 ALTER TABLE `memorando` DISABLE KEYS */;
INSERT INTO `memorando` VALUES (1,'Mensaje de prueba',2,'2021-06-17 20:03:39'),(2,'mensaje de prueba 2',2,'2021-07-29 20:02:15'),(3,'mensaje de prueba 3',2,'2021-07-29 20:04:08'),(4,'mensaje de prueba 4',5,'2021-07-29 20:06:06'),(6,'Este es un mensaje de prueba',4,'2021-08-05 19:35:41'),(7,'Este es otro mensaje de prueba',2,'2021-08-05 19:42:15'),(8,'Este es un memorando creado desde Postman',4,'2021-08-05 20:48:51'),(9,'Este es un memorando creado desde Postman',4,'2021-08-06 00:22:24'),(10,'Este es otro memorando creado desde Postman',2,'2021-08-06 00:32:18'),(11,'Este es otro memorando creado desde Postman 2',5,'2021-08-06 00:40:21'),(12,'Este es otro memorando creado desde Postman 2 con destinatario vinculado',5,'2021-08-06 00:58:33'),(13,'Este es otro memorando creado desde Postman 3 con destinatario vinculado',5,'2021-08-06 01:04:51'),(14,'Este es otro memorando creado desde Postman 4 con destinatario vinculado',2,'2021-08-08 01:39:00'),(15,'Mensaje de Maxi para Pablo',2,'2021-08-08 02:02:47'),(16,'Hola Maria, por favor revisar las tareas asignadas en el tablero de control',2,'2021-08-08 15:41:06'),(17,'Ok! Mensaje de respuesta',10,'2021-08-08 16:04:17'),(18,'Mensaje a Pablo, probando el mensajero',10,'2021-08-08 16:05:47'),(19,'Hola Pedro, de Maria',10,'2021-08-08 16:12:56'),(20,'Este es el primer mensaje que envía Cosme Fulanito',11,'2021-08-12 01:20:34'),(21,'Bienvenido!',2,'2021-08-12 01:22:02'),(22,'Mensaje para Laura',2,'2021-08-12 14:07:16'),(23,'Respuesta de Laura para Maxi',9,'2021-08-12 14:09:05'),(24,'Mensaje de Laura para María',9,'2021-08-12 14:34:34'),(25,'Hola Laura, de Maria',10,'2021-08-12 14:35:25'),(26,'Hola Pedro, mensaje de Maria',10,'2021-08-13 00:24:34'),(27,'Hola María, mensaje de Pedro Gómez. En este mensaje vamos a llegar a los 144 caracteres, limite máximo de caracteres permitidos por memorando!!!',6,'2021-08-13 00:28:01');
/*!40000 ALTER TABLE `memorando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idpais` char(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pais` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('ARG','Argentina'),('AUT','Australia'),('BOL','Bolivia'),('BRA','Brasil'),('CAN','Canada'),('CHL','Chile'),('CHN','China'),('COL','Colombia'),('DEU','Alemania'),('ECU','Ecuador'),('ESP','España'),('FRA','Francia'),('GBR','Reino Unido'),('ITA','Italia'),('JPN','Japon'),('MEX','Mexico'),('NZL','Nueva Zelanda'),('PAN','Panama'),('PER','Peru'),('PRY','Paraguay'),('RUS','Rusia'),('URY','Uruguay'),('USA','Estados Unidos'),('VEN','Venezuela');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(65) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CIUDAD_idciudad` int NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `CIUDAD_idciudad_idx` (`CIUDAD_idciudad`),
  CONSTRAINT `CIUDAD_idciudad` FOREIGN KEY (`CIUDAD_idciudad`) REFERENCES `ciudad` (`idciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'Maxi','Olea','admin','$2b$10$Wkv/HxukhyYtNA4FTyr4geqSyLGReRNYH1mBLd0edpEwa4BgT2Jym',3,'admin@admin.com'),(4,'Pablo','Perez','pperez','$2b$10$4Kj27Ks8IcbowNRGWOBmT.Qa0cflz.76j0T5AWLipQw8LEuKbCc4i',2,'pperez@mail.com'),(5,'Juan','Perez','jperez','$2b$10$/csHLo0qn.9bozxQtjWM/OO/56eG27e7YgF.S1fk4hGBcPKKTZL76',3,'jperez@mail.com'),(6,'Pedro','Gomez','pgomez','$2b$10$vWfhhNyCi6AoZHrPdwdbzuMVKrhBn5MMIOttDiZcv6Je/z3FcirtK',40,'pgomez@mail.com'),(8,'Pedro','Juarez','pjuarez','$2b$10$F/2POGrv.0WzU0MT7SXpluiEOvTMDvH.pdsOImG..8KI5mL00EHMS',28,'pjuarez@mail.com'),(9,'Laura','Garcia','lgarcia','$2b$10$2qYA2KKZoj1cUH.aVKkLDeTYsuEm565tZBACXsXEwdoUeyoMbn9qq',46,'lgarcia@mail.com'),(10,'Maria','Garcia','mgarcia','$2b$10$s4pEEHlcQD/isUMZmPg1NOSFmjCPkkWM0VInUQWRAl1YDGYHb4Q5C',3,'mgarcia@mail.com'),(11,'Cosme','Fulanito','cfulanito','$2b$10$8GEnFxP.x9UBxDfpH7AGDePTBee5RxSDpAXoCfI/zuocHCnZS21Um',3,'cfulanito@mail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'memorandos_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `memorandos_enviados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `memorandos_enviados`(IN id_remi INT)
BEGIN
	SELECT CONCAT(u.nombre, ' ', u.apellido) destinatario, m.mensaje, m.fecha_hora, d.id FROM memorando m 
	INNER JOIN destinatario d ON d.MEMORANDO_idmemorando = m.idmemorando 
	INNER JOIN usuario u ON u.idusuario = d.USUARIO_destinatario WHERE m.USUARIO_remitente = id_remi
    ORDER BY m.fecha_hora DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `memorandos_recibidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `memorandos_recibidos`(IN id_dest INT)
BEGIN
	SELECT CONCAT(u.nombre, ' ', u.apellido) remitente, m.fecha_hora, m.mensaje, d.id FROM usuario u 
	INNER JOIN memorando m ON m.USUARIO_remitente = u.idusuario
	INNER JOIN destinatario d ON d.MEMORANDO_idmemorando = m.idmemorando
	WHERE d.USUARIO_destinatario = id_dest
    ORDER BY m.fecha_hora DESC;
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

-- Dump completed on 2021-08-12 22:12:03
