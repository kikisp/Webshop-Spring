-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: webshop
-- ------------------------------------------------------
-- Server version	5.6.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Soft Drinks',''),(2,'Alchocholic Drinks',''),(3,'Wines',''),(4,'Beers','');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `uuid` varchar(128) NOT NULL,
  `username` varchar(45) NOT NULL,
  `ordertime` datetime NOT NULL,
  `products` varchar(256) NOT NULL,
  `product_number` int(11) NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `index` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('3564','admin','2015-07-21 23:06:30','Coca Cola  , ',4,500),('4773','admin','2015-07-21 15:39:59','Coca Cola Staropramen',14,1300),('6053','admin','2015-07-21 15:45:51','Cockta , Staropramen , ',7,588),('6308','admin','2015-07-21 15:44:47','Fanta, Nestea, ',6,696),('9474','admin','2015-07-21 15:43:23','Coca Cola ,Fanta,',5,595);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `squantity` int(11) NOT NULL,
  `oquantity` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL,
  `category` int(11) NOT NULL,
  `packaging` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Coca Cola ',40,NULL,125,'Coca-Cola is a carbonated soft drink sold in stores, restaurants, and vending machines throughout the world. It is produced by The Coca-Cola Company of Atlanta, Georgia, and is often referred to simply as Coke.','coke.png',1,'2l'),(2,'Fanta',69,NULL,115,'Fanta originated as a result of difficulties importing Coca-Cola syrup into Nazi Germany during World War II due to a trade embargo.','fanta.png',1,'2l'),(3,'Sprite',40,NULL,115,'Sprite is a colorless, lemon and lime flavored, caffeine-free soft drink, created by the Coca-Cola Company. It was developed in West Germany in 1959 as Fanta Klare Zitrone (\"Clear Lemon Fanta\").','sprite.png',1,'2l'),(4,'Nestea',27,NULL,117,'Nestea is a brand of iced tea manufactured by Ognjen O. Company and distributed by Nestlé company\'s beverage department in the United States and by Beverage Partners Worldwide (BPW).','nestea.png',1,'1,5l'),(5,'Cockta',68,NULL,94,'Cockta is a soft drink from Slovenia. Its main ingredient comes from the dog rose hip. The other ingredients come from 11 different herbs, lemon and orange.','cockta.png',1,'1,5l'),(6,'Staropramen',79,NULL,80,'The flagship product of Staropramen\'s brewery,premium beer lager of 5% abv.','stp.png',4,'0,5l'),(7,'Jack Daniel\'s',15,NULL,2300,'Jack Daniel\'s is a brand of Tennessee whiskey and the highest selling American whiskey in the world.It is produced in Lynchburg, Tennessee, by the Jack Daniel Distillery.','jd.png',2,'0,7l'),(8,'Dom Pérignon',10,NULL,19000,'Dom Pérignon is a brand of vintage Champagne produced by the Champagne house Moët & Chandon and serves as that house\'s prestige champagne. It is named after Dom Pérignon.','dp.png',3,'0,75l');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','Partizan1','kikisp1@gmail.com'),(3,'kikisp1','Partizan1','kikisp1@gmail.com'),(4,'kikijevazena','Karisdimbi88','sandra.simic88@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-22  0:11:12
