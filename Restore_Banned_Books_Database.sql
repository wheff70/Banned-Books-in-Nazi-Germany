CREATE DATABASE  IF NOT EXISTS `bannedbooks_group5_backup` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bannedbooks_group5_backup`;


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
-- Temporary view structure for view `austrian_books`
--

DROP TABLE IF EXISTS `austrian_books`;
/*!50001 DROP VIEW IF EXISTS `austrian_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `austrian_books` AS SELECT 
 1 AS `Country of Origin`,
 1 AS `Number of Books`,
 1 AS `Average Number of Chapters`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `Author_ID` int NOT NULL AUTO_INCREMENT,
  `Gender` varchar(45) DEFAULT NULL,
  `Age` varchar(45) DEFAULT NULL,
  `Nationality` varchar(45) DEFAULT NULL,
  `Race/ethnicity` varchar(45) DEFAULT NULL,
  `First_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Author_ID`),
  UNIQUE KEY `Author_ID_UNIQUE` (`Author_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Male','72','French','Caucasian','Erich',' Remarque'),(2,'Male','76','Austrian','Caucasian','Felix ','Salten'),(3,'Male','79','British','Caucasian','H.G. ','Wells'),(4,'Male','40','Czeh','Caucasian','Franz ','Kafka'),(5,'Male','61','American','Caucasian','Ernest ','Hemingway'),(6,'Male','40','American','Caucasian','Jack ','London'),(7,'Female','87','American','Caucasian','Helen ','Keller'),(8,'Male','74','Prussian\n','Caucasian','Friedrich ','Engels'),(9,'Male','76','German','Caucasian','Albert ','Einstein'),(10,'Female','72','American','Caucasian','Vicki ','Baum'),(11,'Male','83','Austrian','Caucasian','Sigmund ','Freud'),(12,'Male','64','German','Caucasian','Karl ','Marx'),(13,'Male','59','Austrian','Caucasian','Georg ','Jellinek'),(14,'Male','53','Rusian','Caucasian','Vladimir ','Lenin'),(15,'Male','51','French','Caucasian','Marcel ','Proust');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ban_books`
--

DROP TABLE IF EXISTS `ban_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ban_books` (
  `Book_ID` int unsigned NOT NULL,
  `Ban_ID` int NOT NULL,
  UNIQUE KEY `idBan_Books_UNIQUE` (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ban_books`
--

LOCK TABLES `ban_books` WRITE;
/*!40000 ALTER TABLE `ban_books` DISABLE KEYS */;
INSERT INTO `ban_books` VALUES (1,5),(2,4),(3,10),(4,1),(5,13),(6,2),(7,3),(8,14),(9,10),(10,12),(11,6),(12,11),(13,7),(14,7),(15,8),(16,3),(17,10),(18,7),(19,9),(20,7),(21,13),(22,6),(23,4),(24,15),(25,4),(26,8),(27,14),(28,1),(29,12),(30,2);
/*!40000 ALTER TABLE `ban_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ban_categorization`
--

DROP TABLE IF EXISTS `ban_categorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ban_categorization` (
  `Ban_category_id` int NOT NULL AUTO_INCREMENT,
  `Reason_for_Ban` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Ban_category_id`),
  UNIQUE KEY `Ban_category_id_UNIQUE` (`Ban_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ban_categorization`
--

LOCK TABLES `ban_categorization` WRITE;
/*!40000 ALTER TABLE `ban_categorization` DISABLE KEYS */;
INSERT INTO `ban_categorization` VALUES (1,'Dangerous/Deemed un-German'),(2,'Jewish Author'),(3,'Free Speech'),(4,'Socialist/Pacifist/Communist Ideologies');
/*!40000 ALTER TABLE `ban_categorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ban_information`
--

DROP TABLE IF EXISTS `ban_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ban_information` (
  `Ban_ID` int NOT NULL AUTO_INCREMENT,
  `Ban_year` varchar(45) DEFAULT NULL,
  `Ban_repealed_year` varchar(45) DEFAULT NULL,
  `Ban_category_id` int NOT NULL,
  PRIMARY KEY (`Ban_ID`),
  UNIQUE KEY `Ban_ID_UNIQUE` (`Ban_ID`),
  KEY `fk_Ban_Information_Ban_Categorization1_idx` (`Ban_category_id`),
  CONSTRAINT `fk_Ban_Information_Ban_Categorization1` FOREIGN KEY (`Ban_category_id`) REFERENCES `ban_categorization` (`Ban_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ban_information`
--

LOCK TABLES `ban_information` WRITE;
/*!40000 ALTER TABLE `ban_information` DISABLE KEYS */;
INSERT INTO `ban_information` VALUES (1,'1935','1945',1),(2,'1938','1945',4),(3,'1939','1943',3),(4,'1941','1945',3),(5,'1943','1945',2),(6,'1941','1945',4),(7,'1938','1945',1),(8,'1940','1944',2),(9,'1937','1945',1),(10,'1945','1945',3),(11,'1943','1945',4),(12,'1939','1945',2),(13,'1939','1944',3),(14,'1940','1945',1),(15,'1936','1945',1);
/*!40000 ALTER TABLE `ban_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bigpublisherbooks`
--

DROP TABLE IF EXISTS `bigpublisherbooks`;
/*!50001 DROP VIEW IF EXISTS `bigpublisherbooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bigpublisherbooks` AS SELECT 
 1 AS `Book_Name`,
 1 AS `Publisher`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `Book_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Book_Name` varchar(100) NOT NULL,
  `Chapters` int DEFAULT NULL,
  `Copies_sold` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `ForewordOrPrologue` varchar(45) DEFAULT NULL,
  `Epilogue` varchar(45) DEFAULT NULL,
  `Perspective` varchar(45) DEFAULT NULL,
  `Genre_ID` int NOT NULL,
  `Country_ID` int NOT NULL,
  PRIMARY KEY (`Book_ID`),
  UNIQUE KEY `Book_ID_UNIQUE` (`Book_ID`),
  UNIQUE KEY `Name_UNIQUE` (`Book_Name`),
  KEY `fk_Books_Genres1_idx` (`Genre_ID`),
  KEY `fk_Books_Country1_idx` (`Country_ID`),
  CONSTRAINT `fk_Books_Country1` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`Country_ID`),
  CONSTRAINT `fk_Books_Genres1` FOREIGN KEY (`Genre_ID`) REFERENCES `genres` (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'All Quiet on the Western Front',32,293799,4,'Yes','Yes','3',10,1),(2,'Bambi',43,67849,4,'No','Yes','1',7,3),(3,'The Time Machine',50,35799,3,'No','Yes','3',6,3),(4,'The Metamorphosis',30,125000,5,'No','No','3',3,4),(5,'The Sun Also Rises',47,43993,5,'Yes','Yes','1',5,5),(6,'The Call of the Wild',27,55555,4,'No','No','3',15,6),(7,'The War of the Worlds',26,178668,2,'Yes','No','2',12,7),(8,'A Farewell to Arms',40,39289,3,'No','Yes','1',7,5),(9,'White Fang',25,48979,3,'No','Yes','1',8,9),(10,'To Build a Fire',22,56723,4,'Yes','Yes','2',15,1),(11,'The Story of My LIfe',48,98926,5,'No','Yes','3',10,11),(12,'The Origin of Family',42,900932,5,'No','No','2',3,3),(13,'Relativity, the Special and the General Theory',29,365476,2,'No','No','3',5,13),(14,'The Trial',28,120743,3,'Yes','Yes','1',8,14),(15,'Socialism: Utopian and Scientific',68,67829,2,'Yes','No','3',2,15),(16,'The Communist Manifesto',33,329475,2,'Yes','No','1',14,1),(17,'Swann\'s Way',37,293743,2,'No','No','2',10,10),(18,'The Declaration of the Rights of Man and of Citizens',29,1207389,5,'No','No','3',6,8),(19,'The State and Revolution',26,13890,2,'Yes','Yes','3',4,7),(20,'The Sea Wolf',46,567799,3,'Yes','Yes','1',10,4),(21,'The Invisible Man',40,398427,3,'No','No','1',12,2),(22,'The Island of Dr. Moreau',45,59078,5,'No','Yes','1',3,1),(23,'Grand Hotel',57,63783,1,'Yes','No','1',7,13),(24,'The Condition of of the Working Class in England',69,120898,1,'Yes','No','1',8,1),(25,'The 42nd Parallel',39,558903,5,'Yes','No','3',15,8),(26,'The Threepenny Opera',47,1357632,4,'No','Yes','3',9,12),(27,'The Immoralist',50,387993,1,'Yes','Yes','1',5,10),(28,'The Ego and the Id',45,783292,4,'No','No','3',11,8),(29,'The Good Soldier Svejk',32,1189743,3,'Yes','Yes','3',6,5),(30,'The Basic Writings of Sigmund Freud',60,328843,1,'Yes','Yes','1',1,2);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_authors`
--

DROP TABLE IF EXISTS `books_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_authors` (
  `Book_ID` int unsigned NOT NULL,
  `Author_ID` int NOT NULL,
  UNIQUE KEY `idBooks_Authors_UNIQUE` (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_authors`
--

LOCK TABLES `books_authors` WRITE;
/*!40000 ALTER TABLE `books_authors` DISABLE KEYS */;
INSERT INTO `books_authors` VALUES (1,15),(2,4),(3,3),(4,8),(5,5),(6,1),(7,7),(8,3),(9,5),(10,15),(11,11),(12,5),(13,13),(14,6),(15,11),(16,3),(17,10),(18,7),(19,9),(20,7),(21,13),(22,6),(23,4),(24,15),(25,4),(26,8),(27,14),(28,1),(29,12),(30,2);
/*!40000 ALTER TABLE `books_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `books_banid3`
--

DROP TABLE IF EXISTS `books_banid3`;
/*!50001 DROP VIEW IF EXISTS `books_banid3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `books_banid3` AS SELECT 
 1 AS `Book_Name`,
 1 AS `Ban_year`,
 1 AS `Copies_sold`,
 1 AS `Reason_For_Ban`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `books_bigcopies`
--

DROP TABLE IF EXISTS `books_bigcopies`;
/*!50001 DROP VIEW IF EXISTS `books_bigcopies`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `books_bigcopies` AS SELECT 
 1 AS `Book_Name`,
 1 AS `Ban_year`,
 1 AS `Copies_sold`,
 1 AS `Reason_For_Ban`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `Country_ID` int NOT NULL AUTO_INCREMENT,
  `Country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Country_ID`),
  UNIQUE KEY `Country_ID_UNIQUE` (`Country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Germany'),(2,'Austria'),(3,'United Kingdom'),(4,'Germany'),(5,'United States'),(6,'Canada'),(7,'Italy'),(8,'Ukraine'),(9,'Hungary'),(10,'Switzerland '),(11,'Finland'),(12,'Norway'),(13,'Ireland'),(14,'Croatia'),(15,'Albania');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `Genre_ID` int NOT NULL AUTO_INCREMENT,
  `Genre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Genre_ID`),
  UNIQUE KEY `Genre_ID_UNIQUE` (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fantasy'),(2,'Children\'s Fiction'),(3,'Science Fiction'),(4,'Novella'),(5,'Dystopian'),(6,'Adventure Fiction'),(7,'Autobiography'),(8,'Philosophy'),(9,'Physics'),(10,'Psychology'),(11,'History'),(12,'Nonfiction'),(13,'Politics'),(14,'Literature'),(15,'Sociology');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `high_rated_bannedbooks`
--

DROP TABLE IF EXISTS `high_rated_bannedbooks`;
/*!50001 DROP VIEW IF EXISTS `high_rated_bannedbooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `high_rated_bannedbooks` AS SELECT 
 1 AS `Country of Origin`,
 1 AS `Number of Books`,
 1 AS `Average Number of Chapters`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `Book_Name`,
 1 AS `Ban_year`,
 1 AS `Reason_for_Ban`,
 1 AS `author`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `publishing`
--

DROP TABLE IF EXISTS `publishing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishing` (
  `Publisher_ID` int NOT NULL AUTO_INCREMENT,
  `Publisher` varchar(45) DEFAULT NULL,
  `Volumes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Publisher_ID`),
  UNIQUE KEY `Publisher_ID_UNIQUE` (`Publisher_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishing`
--

LOCK TABLES `publishing` WRITE;
/*!40000 ALTER TABLE `publishing` DISABLE KEYS */;
INSERT INTO `publishing` VALUES (1,'Ballantine Books','27'),(2,'Alladin','39'),(3,'Signet Classics','400'),(4,'Bantam Classics','700'),(5,'Pan Books','285'),(6,'Scholastic','5567'),(7,'Simon and Schuster','3632'),(8,'University Press of the Pacific','300'),(9,'Penguin','8765'),(10,'Barnes & Noble','9400'),(11,'HardPress','2500'),(12,'Kessinger','1200'),(13,'Aemeron','150'),(14,'Arcade Publishing','999'),(15,'Mariner Books','1400');
/*!40000 ALTER TABLE `publishing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishing_books`
--

DROP TABLE IF EXISTS `publishing_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishing_books` (
  `Book_ID` int unsigned NOT NULL,
  `Publisher_ID` int NOT NULL,
  UNIQUE KEY `Book_ID_UNIQUE` (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishing_books`
--

LOCK TABLES `publishing_books` WRITE;
/*!40000 ALTER TABLE `publishing_books` DISABLE KEYS */;
INSERT INTO `publishing_books` VALUES (1,1),(2,6),(3,2),(4,7),(5,10),(6,3),(7,13),(8,8),(9,14),(10,4),(11,15),(12,11),(13,12),(14,9),(15,5),(16,6),(17,12),(18,5),(19,9),(20,6),(21,15),(22,10),(23,2),(24,1),(25,7),(26,8),(27,14),(28,11),(29,4),(30,5);
/*!40000 ALTER TABLE `publishing_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_5`
--

DROP TABLE IF EXISTS `view_5`;
/*!50001 DROP VIEW IF EXISTS `view_5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_5` AS SELECT 
 1 AS `author`,
 1 AS `Age`,
 1 AS `Number of Banned Books`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `austrian_books`
--

/*!50001 DROP VIEW IF EXISTS `austrian_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `austrian_books` AS select `country`.`Country` AS `Country of Origin`,count(`books`.`Book_Name`) AS `Number of Books`,avg(`books`.`Chapters`) AS `Average Number of Chapters` from (`books` join `country` on((`books`.`Country_ID` = `country`.`Country_ID`))) where (`books`.`Country_ID` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bigpublisherbooks`
--

/*!50001 DROP VIEW IF EXISTS `bigpublisherbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bigpublisherbooks` AS select `books`.`Book_Name` AS `Book_Name`,`publishing`.`Publisher` AS `Publisher` from ((`books` join `publishing_books` on((`books`.`Book_ID` = `publishing_books`.`Book_ID`))) join `publishing` on((`publishing_books`.`Publisher_ID` = `publishing`.`Publisher_ID`))) where `publishing`.`Publisher` in (select `publishing`.`Publisher` from `publishing` where (`publishing`.`Volumes` >= 1000)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `books_banid3`
--

/*!50001 DROP VIEW IF EXISTS `books_banid3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `books_banid3` AS select `books`.`Book_Name` AS `Book_Name`,`ban_information`.`Ban_year` AS `Ban_year`,`books`.`Copies_sold` AS `Copies_sold`,`ban_categorization`.`Reason_for_Ban` AS `Reason_For_Ban` from (((`books` join `ban_books` on((`books`.`Book_ID` = `ban_books`.`Book_ID`))) join `ban_information` on((`ban_books`.`Ban_ID` = `ban_information`.`Ban_ID`))) join `ban_categorization` on((`ban_information`.`Ban_category_id` = `ban_categorization`.`Ban_category_id`))) where (`books`.`Copies_sold` > 100000) order by `ban_information`.`Ban_year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `books_bigcopies`
--

/*!50001 DROP VIEW IF EXISTS `books_bigcopies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `books_bigcopies` AS select `books`.`Book_Name` AS `Book_Name`,`ban_information`.`Ban_year` AS `Ban_year`,`books`.`Copies_sold` AS `Copies_sold`,`ban_categorization`.`Reason_for_Ban` AS `Reason_For_Ban` from (((`books` join `ban_books` on((`books`.`Book_ID` = `ban_books`.`Book_ID`))) join `ban_information` on((`ban_books`.`Ban_ID` = `ban_information`.`Ban_ID`))) join `ban_categorization` on((`ban_information`.`Ban_category_id` = `ban_categorization`.`Ban_category_id`))) where (`books`.`Copies_sold` > 100000) order by `ban_information`.`Ban_year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `high_rated_bannedbooks`
--

/*!50001 DROP VIEW IF EXISTS `high_rated_bannedbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `high_rated_bannedbooks` AS select `country`.`Country` AS `Country of Origin`,count(`books`.`Book_Name`) AS `Number of Books`,avg(`books`.`Chapters`) AS `Average Number of Chapters` from (`books` join `country` on((`books`.`Country_ID` = `country`.`Country_ID`))) where (`books`.`Country_ID` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `books`.`Book_Name` AS `Book_Name`,`ban_information`.`Ban_year` AS `Ban_year`,`ban_categorization`.`Reason_for_Ban` AS `Reason_for_Ban`,concat(`authors`.`First_Name`,' ',`authors`.`Last_Name`) AS `author` from (((((`books` join `ban_books` on((`books`.`Book_ID` = `ban_books`.`Book_ID`))) join `ban_information` on((`ban_books`.`Ban_ID` = `ban_information`.`Ban_ID`))) join `ban_categorization` on((`ban_information`.`Ban_category_id` = `ban_categorization`.`Ban_category_id`))) join `books_authors` on((`books`.`Book_ID` = `books_authors`.`Book_ID`))) join `authors` on((`books_authors`.`Author_ID` = `authors`.`Author_ID`))) where (`ban_information`.`Ban_year` >= 1939) order by `ban_information`.`Ban_year`,`ban_categorization`.`Reason_for_Ban` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_5`
--

/*!50001 DROP VIEW IF EXISTS `view_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_5` AS select concat(`authors`.`First_Name`,' ',`authors`.`Last_Name`) AS `author`,`authors`.`Age` AS `Age`,count(`books_authors`.`Book_ID`) AS `Number of Banned Books` from (`authors` join `books_authors` on((`authors`.`Author_ID` = `books_authors`.`Author_ID`))) group by `authors`.`Author_ID` order by count(`books_authors`.`Book_ID`) desc */;
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

