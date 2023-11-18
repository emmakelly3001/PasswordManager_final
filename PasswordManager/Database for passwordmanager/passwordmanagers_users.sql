-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: passwordmanagers
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kevin','test'),(2,'presley','pop'),(3,'brian','lol'),(4,'simon','$2a$10$Xz9FM8h1e7XEdboRzNjgfujPYA23C.L9rDhijo7HalwCZh8mrdkUm'),(5,'emma','$2a$10$WGULalr01eUoFro3sh68aOm/C9J.7k3bEzv4pEqah/YJm4f8Z.W7.'),(6,'aisha','$2a$10$0dzUND1pRPuv53mb./u/H./hkMUafF.UF/XnmQWgUD48cyUPVZMT6'),(7,'kkk','$2a$10$0UP1va5AUC9DGsGpfIhyQutK19ziftjqhqxBt10xtVooxfCQW8WkK'),(8,'kk','$2a$10$UvXZj4xkIqDuRPow5byHUOdBPqnu3aG/JtI.2DN5oRucDSOUVEOzy'),(9,'ke','$2a$10$hQYI8FRARgXhcEb6NOhZu.TX/NPoL8vKrkkfw4dpmQnpLxsjPnHxK'),(10,'kevinosifo','$2a$10$7.XdaWg9b6yMwDkJ379CzeGC9o9Ypq2aYB8MoAyCP3iMVs9oJncTy'),(11,'simon','$2a$10$cMxS0C4wqsNnOqAZGicSAeMO3w21dzSCJEf6d8gaAdd2goulf7oYm'),(12,'popup','$2a$10$pWWuSKnp6n.aj7gql1A60u4yJL7heGybOaNc3hyeVadkqBh.Dkw6m'),(13,'pop','$2a$10$7MQPpBo5SWHAHMl49A7RquAe0JEmesiCSMVDToIqHYXLo8.JL/irq'),(14,'simon','$2a$10$EFMspVAwJ5RtC/87SemcGO/.zP4iurvo65xcNi0scZBkX0o2xckPW'),(15,'kev','$2a$10$WqT1QNLBJvpnts2BoaSxkeR0goFSX7OTDnM6./qsYF5PPrJWSxyUW');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-18 14:23:35
