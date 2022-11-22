-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (arm64)
--
-- Host: localhost    Database: db_proj
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` bigint NOT NULL AUTO_INCREMENT,
  `house_number` varchar(16) NOT NULL,
  `building_name` varchar(100) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `sub_district` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `sub_district` (`sub_district`,`district`,`province`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`sub_district`, `district`, `province`) REFERENCES `address_detail` (`sub_district`, `district`, `province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_detail`
--

DROP TABLE IF EXISTS `address_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_detail` (
  `sub_district` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  PRIMARY KEY (`sub_district`,`district`,`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_detail`
--

LOCK TABLES `address_detail` WRITE;
/*!40000 ALTER TABLE `address_detail` DISABLE KEYS */;
INSERT INTO `address_detail` VALUES ('e','A','X','10200'),('f','B','X','10300'),('g','C','X','10400'),('h','D','X','10500');
/*!40000 ALTER TABLE `address_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `area_id` bigint NOT NULL,
  `sub_district` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`sub_district`,`district`,`province`),
  KEY `area_id_index` (`area_id`),
  CONSTRAINT `area_ibfk_1` FOREIGN KEY (`sub_district`, `district`, `province`) REFERENCES `address_detail` (`sub_district`, `district`, `province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'e','A','X'),(2,'f','B','X'),(3,'g','C','X'),(4,'h','D','X');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `chat_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `chat_id` bigint NOT NULL,
  `message_id` bigint NOT NULL,
  `timestamp` timestamp NOT NULL,
  `message` varchar(10000) NOT NULL,
  PRIMARY KEY (`chat_id`,`message_id`),
  CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `uid` bigint NOT NULL,
  `address_id` bigint NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_order`
--

DROP TABLE IF EXISTS `delivery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_order` (
  `delivery_person_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`delivery_person_id`,`order_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `delivery_order_ibfk_1` FOREIGN KEY (`delivery_person_id`) REFERENCES `delivery_person` (`uid`),
  CONSTRAINT `delivery_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_order`
--

LOCK TABLES `delivery_order` WRITE;
/*!40000 ALTER TABLE `delivery_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_person`
--

DROP TABLE IF EXISTS `delivery_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_person` (
  `uid` bigint NOT NULL,
  `driver_license` varchar(5) NOT NULL,
  `status` enum('not accepting','waiting for restaurant','delivery') NOT NULL,
  `area_id` bigint NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `delivery_person_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `delivery_person_ibfk_2` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person`
--

LOCK TABLES `delivery_person` WRITE;
/*!40000 ALTER TABLE `delivery_person` DISABLE KEYS */;
INSERT INTO `delivery_person` VALUES (1,'UX200','not accepting',1),(2,'UX300','not accepting',1),(3,'UX400','delivery',2),(4,'UX500','waiting for restaurant',2),(5,'UX600','not accepting',3),(6,'UX700','not accepting',3),(7,'UX800','not accepting',2),(8,'UX900','not accepting',2),(9,'UX901','not accepting',1),(10,'UX902','not accepting',1),(11,'UX903','not accepting',4),(12,'UX904','not accepting',4),(13,'UX905','not accepting',2),(14,'UX906','not accepting',2),(15,'UX907','not accepting',4),(16,'UX908','not accepting',4),(17,'UX909','not accepting',1),(18,'UX910','not accepting',1),(19,'UX911','not accepting',1),(20,'UX912','not accepting',1),(21,'UX913','not accepting',1),(22,'UX914','not accepting',1);
/*!40000 ALTER TABLE `delivery_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` bigint NOT NULL,
  `restaurant_id` bigint NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`menu_id`,`restaurant_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` bigint NOT NULL,
  `status` enum('pending','rejected','preparing','delivery','completed') NOT NULL,
  `grand_total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_card`
--

DROP TABLE IF EXISTS `payment_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_card` (
  `card_number` varchar(16) NOT NULL,
  `expiry_month` tinyint NOT NULL,
  `expiry_year` int NOT NULL,
  `cvv` int NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`card_number`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `payment_card_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_card`
--

LOCK TABLES `payment_card` WRITE;
/*!40000 ALTER TABLE `payment_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_record`
--

DROP TABLE IF EXISTS `payment_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_record` (
  `transaction_id` bigint NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `card_number` (`card_number`),
  CONSTRAINT `payment_record_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `payment_record_ibfk_2` FOREIGN KEY (`card_number`) REFERENCES `payment_card` (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_record`
--

LOCK TABLES `payment_record` WRITE;
/*!40000 ALTER TABLE `payment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_order`
--

DROP TABLE IF EXISTS `place_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_order` (
  `order_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `timestamp` timestamp NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `place_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_order`
--

LOCK TABLES `place_order` WRITE;
/*!40000 ALTER TABLE `place_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `uid` bigint NOT NULL,
  `address_id` bigint NOT NULL,
  `status` enum('Closed','Open') NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_order`
--

DROP TABLE IF EXISTS `restaurant_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_order` (
  `rest_order_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `restaurant_id` bigint NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`rest_order_id`),
  KEY `order_id` (`order_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `restaurant_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `restaurant_order_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_order`
--

LOCK TABLES `restaurant_order` WRITE;
/*!40000 ALTER TABLE `restaurant_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_order_menu`
--

DROP TABLE IF EXISTS `restaurant_order_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_order_menu` (
  `rest_order_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `quantity` bigint NOT NULL,
  PRIMARY KEY (`rest_order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `restaurant_order_menu_ibfk_1` FOREIGN KEY (`rest_order_id`) REFERENCES `restaurant_order` (`rest_order_id`),
  CONSTRAINT `restaurant_order_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_order_menu`
--

LOCK TABLES `restaurant_order_menu` WRITE;
/*!40000 ALTER TABLE `restaurant_order_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_order_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `profit` decimal(10,0) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `type` enum('Delivery Person','Restaurant','Customer') NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  PRIMARY KEY (`uid`,`email`),
  UNIQUE KEY `user_email_unique` (`email`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user_account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Delivery Person','em0@mail.com','Khun A','08xxxxxxxx'),(2,'Delivery Person','em2@mail.com','Khun B','08xxxxxxxx'),(3,'Delivery Person','em3@mail.com','Khun C','08xxxxxxxx'),(4,'Delivery Person','em4@mail.com','Khun D','08xxxxxxxx'),(5,'Delivery Person','em5@mail.com','Khun E','08xxxxxxxx'),(6,'Delivery Person','em6@mail.com','Khun F','08xxxxxxxx'),(7,'Delivery Person','em7@mail.com','Khun G','08xxxxxxxx'),(8,'Delivery Person','em8@mail.com','Khun H','08xxxxxxxx'),(9,'Delivery Person','em9@mail.com','Khun I','08xxxxxxxx'),(10,'Delivery Person','em10@mail.com','Khun J','08xxxxxxxx'),(11,'Delivery Person','em11@mail.com','Khun K','08xxxxxxxx'),(12,'Delivery Person','em12@mail.com','Khun L','08xxxxxxxx'),(13,'Delivery Person','em13@mail.com','Khun M','08xxxxxxxx'),(14,'Delivery Person','em14@mail.com','Khun N','08xxxxxxxx'),(15,'Delivery Person','em15@mail.com','Khun O','08xxxxxxxx'),(16,'Delivery Person','em16@mail.com','Khun P','08xxxxxxxx'),(17,'Delivery Person','em17@mail.com','Khun Q','08xxxxxxxx'),(18,'Delivery Person','em18@mail.com','Khun R','08xxxxxxxx'),(19,'Delivery Person','em19@mail.com','Khun S','08xxxxxxxx'),(20,'Delivery Person','em20@mail.com','Khun T','08xxxxxxxx'),(21,'Delivery Person','em21@mail.com','Khun Q','08xxxxxxxx'),(22,'Delivery Person','em22@mail.com','Khun R','08xxxxxxxx');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `email` varchar(100) NOT NULL,
  `hashed_password` varchar(60) NOT NULL,
  `salt` varchar(29) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES ('em0@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em10@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em11@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em12@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em13@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em14@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em15@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em16@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em17@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em18@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em19@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em2@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em20@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em21@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em22@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em3@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em4@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em5@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em6@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em7@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em8@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e'),('em9@mail.com','$2b$12$IiTWRJVxx.3f6oJp4eeu3ec42/4mWmv5mxA6JwYnSZx2nDec.yyHO','$2b$12$IiTWRJVxx.3f6oJp4eeu3e');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-22 16:12:55
