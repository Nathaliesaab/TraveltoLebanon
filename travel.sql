-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: travel
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Category` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Location` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Image` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'National Museum of Beirut','Activities','Beirut','Lebanon\'s history told through exhibits','museum'),(2,'Raouche Rocks','Sites','Beirut','Towering seaside rock formations','Rouche'),(3,'Sursock Museum','Activities','Beirut','Modern art museum in a 1912 villa','Sursock'),(4,'Kadisha Valley','Activities','North Lebanon','Scenic gorge with monasteries & hiking','Kadisha'),(5,'Baatara Gorge Waterfall','Sites','North Lebanon','Natural wonder in a mountain cave','Baatara'),(6,'Mzaar Ski Resort ','Activities','Mount Lebanon','Sizable resort for skiers of all levels','Mzaar'),(7,'Temple of Bacchus','Sites','Baalbek','Iconic, well-preserved Roman temple','Bacchus'),(8,'Zaituna Bay','Activities','Beirut','Happening spot with shops & eateries','Zaituna'),(9,'Chateau Ksara','Activities','Beqaa','Upscale winery with caves & tours','Ksara'),(10,'Sidon Sea Castle','Sites','South Lebanon','13th-century fortress built by Crusaders','Sidon'),(11,'Tannourine Cedar Forest Nature Reserve','Sites','North Lebanon','Nature reserve, forest, ecotourism and nature','Tannourine'),(12,'Palms Island','Sites','North Lebanon ','Rabbit and nature','Island'),(13,'Paragliding','Activities','Jounie','Fly and view the breathtaking scenes of Jounieh bay.','paragliding'),(14,'Rock Climbing','Activities','Tannourine el tahta ','Ideal place for professional and beginner climbers.','climbing');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket_Country`
--

DROP TABLE IF EXISTS `Ticket_Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket_Country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_id` int DEFAULT NULL,
  `TicketNo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TicketNo_idx` (`TicketNo`),
  KEY `id_idx` (`country_id`),
  CONSTRAINT `countryId` FOREIGN KEY (`country_id`) REFERENCES `Country` (`id`),
  CONSTRAINT `TicketNb` FOREIGN KEY (`TicketNo`) REFERENCES `Tickets` (`TicketNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket_Country`
--

LOCK TABLES `Ticket_Country` WRITE;
/*!40000 ALTER TABLE `Ticket_Country` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ticket_Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `TicketNo` int NOT NULL,
  `Time` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Destination` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Departure` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Price` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`TicketNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES (2201,'9 am','Lebanon','USA','1500$'),(2202,'3 pm','Lebanon','Australia','2000$'),(2203,'2 am','Lebanon','Canada','1500$'),(2204,'5 pm','Lebanon','Japan','2000$'),(2205,'7 am ','Lebanon','London','3000$'),(2206,'6 pm','Lebanon','France','400$'),(2207,'4 am','Lebanon','Russia','600$'),(2208,'5 pm','Lebanon','Dubai','500$'),(2209,'6 am','Lebanon','Turkey','300$'),(2210,'5 am','Lebanon','Italy','3000$'),(2211,'6 pm','Lebanon','Iceland','2000$');
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Ticket`
--

DROP TABLE IF EXISTS `User_Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `TicketNo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `TicketNo_idx` (`TicketNo`),
  CONSTRAINT `id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TicketNo` FOREIGN KEY (`TicketNo`) REFERENCES `Tickets` (`TicketNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Ticket`
--

LOCK TABLES `User_Ticket` WRITE;
/*!40000 ALTER TABLE `User_Ticket` DISABLE KEYS */;
INSERT INTO `User_Ticket` VALUES (1,1,2208),(2,1,2209),(3,2,2209);
/*!40000 ALTER TABLE `User_Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Location` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'test','test','Italy','test@test.HOTMAIL.COM'),(2,'test2','test2','test','test@example.com'),(3,'test124','test1234','Canada','test2@example.com'),(4,'John','John1234','Italy','John@example.com'),(5,'Kevin','test','USA','Kevin@example.com'),(6,'test2','test2','France','test2@gmail.com'),(7,'test2','test2','France','test2@gmail.com'),(8,'Example','Example','Italy','Example@gmail.com'),(9,'Example','Example','Italy','Example@gmail.com');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 12:35:41
