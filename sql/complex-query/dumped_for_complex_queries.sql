-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: glob_grab
-- ------------------------------------------------------
-- Server version	8.0.30

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'11',NULL,'Phaya Thai Rd','Wang Mai','Pathum Wan','Bangkok'),(2,'12',NULL,'Phaya Thai Rd','Wang Mai','Pathum Wan','Bangkok'),(3,'13',NULL,'Phaya Thai Rd','Wang Mai','Pathum Wan','Bangkok'),(4,'123',NULL,'Sukhumvit 63 Rd','Phra Khanong Nuea','Watthana','Bangkok'),(5,'228/24',NULL,'Lat Phrao Rd','Chom Phon','Chatuchak','Bangkok'),(6,'111',NULL,'Chaengwatthana Rd','Thung Song Hong','Laksi','Bangkok');
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
INSERT INTO `address_detail` VALUES ('Chom Phon','Chatuchak','Bangkok','10900'),('Phra Khanong Nuea','Watthana','Bangkok','10110'),('Thung Song Hong','Laksi','Bangkok','10210'),('Wang Mai','Pathum Wan','Bangkok','10330');
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
INSERT INTO `area` VALUES (1,'Wang Mai','Pathum Wan','Bangkok'),(2,'Phra Khanong Nuea','Watthana','Bangkok'),(3,'Chom Phon','Chatuchak','Bangkok'),(4,'Thung Song Hong','Laksi','Bangkok');
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
INSERT INTO `customer` VALUES (2,1),(13,1),(16,1),(20,1),(3,2),(4,2),(6,2),(12,2),(1,3),(8,3),(11,3),(15,3),(17,3),(5,4),(7,4),(9,4),(10,4),(14,4),(18,4),(19,4);
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
INSERT INTO `menu` VALUES (1,39,'Fried Chicken','best chicken ever',100,1),(2,40,'Fried Chicken with rice','best chicken rice ever 2',70,1),(3,33,'Fried Chicken','best chicken ever',119,1),(4,33,'Chicken Teriyaki','best chicken ever',98,1),(5,33,'Chicken soup','best soup ever',75,1),(6,36,'Chicken rice','best menu ever',85,1);
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
INSERT INTO `order` VALUES (1,'completed',1935),(2,'completed',267),(3,'completed',546),(4,'rejected',339),(5,'completed',1696),(6,'completed',1267),(7,'completed',820),(8,'rejected',0),(9,'completed',1677),(10,'completed',134);
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
INSERT INTO `payment_card` VALUES ('1234567898765432',12,24,123,1);
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
  PRIMARY KEY (`transaction_id`,`card_number`),
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
INSERT INTO `payment_record` VALUES (1,'1234567898765432','2022-11-20 05:20:00'),(2,'1234567898765432','2022-11-10 03:50:00'),(3,'1234567898765432','2022-11-06 06:32:00'),(4,'1234567898765432','2022-11-18 05:20:00'),(5,'1234567898765432','2022-11-18 05:55:00'),(6,'1234567898765432','2022-11-20 05:15:00');
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
INSERT INTO `place_order` VALUES (1,2,'2022-10-18 05:00:00'),(2,1,'2022-11-02 03:32:00'),(3,2,'2022-10-01 05:00:00'),(4,2,'2022-09-18 05:00:00'),(5,1,'2022-11-10 03:30:00'),(6,1,'2022-11-06 06:12:00'),(7,1,'2022-11-18 05:00:00'),(8,2,'2022-10-16 05:00:00'),(9,1,'2022-11-18 05:45:00'),(10,1,'2022-11-20 05:00:00');
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
INSERT INTO `restaurant` VALUES (31,4,'Closed'),(32,3,'Closed'),(33,1,'Open'),(34,5,'Open'),(35,4,'Open'),(36,6,'Open'),(37,5,'Open'),(38,4,'Open'),(39,1,'Open'),(40,6,'Open'),(41,4,'Closed'),(42,5,'Closed'),(43,4,'Closed'),(44,3,'Closed'),(45,6,'Open');
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
INSERT INTO `restaurant_order` VALUES (1,1,45,482),(2,5,37,271),(3,3,35,117),(4,9,31,779),(5,7,39,420),(6,10,34,75),(7,1,45,330),(8,5,41,286),(9,7,36,400),(10,5,36,302),(11,5,42,70),(12,1,45,207),(13,1,38,182),(14,4,45,122),(15,1,36,201),(16,3,34,173),(17,5,33,230),(18,9,37,898),(19,2,37,206),(20,5,45,156),(21,2,42,61),(22,4,35,101),(23,6,32,708),(24,3,37,256),(25,5,41,149),(26,6,35,559),(27,4,36,116),(28,10,42,59),(29,1,31,533),(30,5,45,232);
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
INSERT INTO `transaction` VALUES (1,2,267,1,80),(2,5,1696,1,508),(3,6,1267,1,380),(4,7,820,1,246),(5,9,1677,1,503),(6,10,134,1,40);
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Customer','cus001@test.com','cus001','0800000001'),(2,'Customer','cus002@test.com','cus002','0800000002'),(3,'Customer','cus003@test.com','cus003','0800000003'),(4,'Customer','cus004@test.com','cus004','0800000004'),(5,'Customer','cus005@test.com','cus005','0800000005'),(6,'Customer','cus006@test.com','cus006','0800000006'),(7,'Customer','cus007@test.com','cus007','0800000007'),(8,'Customer','cus008@test.com','cus008','0800000008'),(9,'Customer','cus009@test.com','cus009','0800000009'),(10,'Customer','cus010@test.com','cus010','0800000010'),(11,'Customer','cus011@test.com','cus011','0800000011'),(12,'Customer','cus012@test.com','cus012','0800000012'),(13,'Customer','cus013@test.com','cus013','0800000013'),(14,'Customer','cus014@test.com','cus014','0800000014'),(15,'Customer','cus015@test.com','cus015','0800000015'),(16,'Customer','cus016@test.com','cus016','0800000016'),(17,'Customer','cus017@test.com','cus017','0800000017'),(18,'Customer','cus018@test.com','cus018','0800000018'),(19,'Customer','cus019@test.com','cus019','0800000019'),(20,'Customer','cus020@test.com','cus020','0800000020'),(21,'Delivery Person','deli001@test.com','deli001','0610000001'),(22,'Delivery Person','deli002@test.com','deli002','0610000002'),(23,'Delivery Person','deli003@test.com','deli003','0610000003'),(24,'Delivery Person','deli004@test.com','deli004','0610000004'),(25,'Delivery Person','deli005@test.com','deli005','0610000005'),(26,'Delivery Person','deli006@test.com','deli006','0610000006'),(27,'Delivery Person','deli007@test.com','deli007','0610000007'),(28,'Delivery Person','deli008@test.com','deli008','0610000008'),(29,'Delivery Person','deli009@test.com','deli009','0610000009'),(30,'Delivery Person','deli010@test.com','deli010','0610000010'),(31,'Restaurant','res001@test.com','res001','0900000001'),(32,'Restaurant','res002@test.com','res002','0900000002'),(33,'Restaurant','res003@test.com','res003','0900000003'),(34,'Restaurant','res004@test.com','res004','0900000004'),(35,'Restaurant','res005@test.com','res005','0900000005'),(36,'Restaurant','res006@test.com','res006','0900000006'),(37,'Restaurant','res007@test.com','res007','0900000007'),(38,'Restaurant','res008@test.com','res008','0900000008'),(39,'Restaurant','res009@test.com','res009','0900000009'),(40,'Restaurant','res010@test.com','res010','0900000010'),(41,'Restaurant','res011@test.com','res011','0900000011'),(42,'Restaurant','res012@test.com','res012','0900000012'),(43,'Restaurant','res013@test.com','res013','0900000013'),(44,'Restaurant','res014@test.com','res014','0900000014'),(45,'Restaurant','res015@test.com','res015','0900000015');
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
INSERT INTO `user_account` VALUES ('cus001@test.com','$2b$12$b5xaMZzW./3o7Xs/AEcSiOvyfpwbo1SF5WIzKrPrvP3Hw1D3MzWq6','$2b$12$b5xaMZzW./3o7Xs/AEcSiO'),('cus002@test.com','$2b$12$pPxvDLOtMb.LZ0NIJi.wOe0vMPlf3gJoGcFUtDOAHyjUZU8KwwcRO','$2b$12$pPxvDLOtMb.LZ0NIJi.wOe'),('cus003@test.com','$2b$12$JOlXWVrTo2c9Em1AjTRbP.renPqwbrzOOuRQItB5USU2h1Oj./fha','$2b$12$JOlXWVrTo2c9Em1AjTRbP.'),('cus004@test.com','$2b$12$DQAZ4n/Uvt6lH7R2FyouguxxvKQQTYz4vZLmXnido0sjuqH385cyy','$2b$12$DQAZ4n/Uvt6lH7R2Fyougu'),('cus005@test.com','$2b$12$sXOV5Ys1r85ZklQHVP4BTeHSJzj9JySvRRkkAg/ijnHUplWRFT.EW','$2b$12$sXOV5Ys1r85ZklQHVP4BTe'),('cus006@test.com','$2b$12$4hvHzMJhDAnzEnfi9WjUMevCbPg8ElGDgmXB5/aIPOPhwhbfX4k2y','$2b$12$4hvHzMJhDAnzEnfi9WjUMe'),('cus007@test.com','$2b$12$cgV733iozPNmyAshw84i1Og0jOYc2SprroP7DxFCuBfoe5kPaNQvi','$2b$12$cgV733iozPNmyAshw84i1O'),('cus008@test.com','$2b$12$OLEYb8VcQj.h4za/5xf.he0GiCd2kDmeyKvVDs4BDaE6uCk3G1GQu','$2b$12$OLEYb8VcQj.h4za/5xf.he'),('cus009@test.com','$2b$12$JOxOIvcQ.ySWQrsiqL0EL.kQoo4zZ/4Dd//kE13MmtTS3XPx3YgWO','$2b$12$JOxOIvcQ.ySWQrsiqL0EL.'),('cus010@test.com','$2b$12$dHx.BiONWBKMO5oRIAYBhedfSZMciAyr60hRZP9I/7DWsCy.fHZsW','$2b$12$dHx.BiONWBKMO5oRIAYBhe'),('cus011@test.com','$2b$12$7Esz/Ex9xS88pzsuujJfZOklXgjcs10OKTCzKkXsLDGJYW/SaMapi','$2b$12$7Esz/Ex9xS88pzsuujJfZO'),('cus012@test.com','$2b$12$/nJpHltGN0VXC/16cy3efe2SAzXf/9Xhjxno5gyyt1Czcg7.d0VVi','$2b$12$/nJpHltGN0VXC/16cy3efe'),('cus013@test.com','$2b$12$XWpR3uaG2A4etHt3FTxX5u6Xb33PNdKs3YQfWHTKNmdif3zzanZ0W','$2b$12$XWpR3uaG2A4etHt3FTxX5u'),('cus014@test.com','$2b$12$yLCrcF9eZ53Dg1yrkZ9vlupG0EzB7gwSIRO37wD/bvOsB8kWJn1qC','$2b$12$yLCrcF9eZ53Dg1yrkZ9vlu'),('cus015@test.com','$2b$12$sRFRqYOz9dFMrN7kW3wxHeyLg18xEnh0koVJCWe/D17rvHJDYK.Fi','$2b$12$sRFRqYOz9dFMrN7kW3wxHe'),('cus016@test.com','$2b$12$dOmtIYZ3keduGLx55A23x.ou..97jrHkUWctufWk954/aESvy.uJu','$2b$12$dOmtIYZ3keduGLx55A23x.'),('cus017@test.com','$2b$12$9HiXJUtwQFfs..UzMlZzl.qu497nc50Dh90aYa/Kj/ZDId96b0e7W','$2b$12$9HiXJUtwQFfs..UzMlZzl.'),('cus018@test.com','$2b$12$B4Xun9oW7aGvq03kIGD3.uODnDeMcosvkplgsHrTpbM4fiNZ4XQbu','$2b$12$B4Xun9oW7aGvq03kIGD3.u'),('cus019@test.com','$2b$12$Dy/5OVeQZ5b7QRopBjOal.DANJd38IymxSD3L0knD4U3KBhnfapwW','$2b$12$Dy/5OVeQZ5b7QRopBjOal.'),('cus020@test.com','$2b$12$OIOx/skRfmO4ske5ZQQfDuifnbFwuoZ2bNoUp8v3vZ3SVe/WF66HS','$2b$12$OIOx/skRfmO4ske5ZQQfDu'),('deli001@test.com','$2b$12$CP1k/cy2l0.8iUmghtgTUutSK8AvGFvuyKcgYSVVQApAudINkUxny','$2b$12$CP1k/cy2l0.8iUmghtgTUu'),('deli002@test.com','$2b$12$iyreNY/hVVl1FUQ5L8pqZu86GKcQG5c6y6uE7PNujJxpkR8P0w8Ay','$2b$12$iyreNY/hVVl1FUQ5L8pqZu'),('deli003@test.com','$2b$12$ljrvuRHGTJlo/qpo6yWwze2BUqp0Ix227ngB5w6aNggCH61ms.U0e','$2b$12$ljrvuRHGTJlo/qpo6yWwze'),('deli004@test.com','$2b$12$xFtSSboegYcx1Q1Ywf4KJuPv6OpDdEFUBxgzkEMv4L3ba0ZMIJZii','$2b$12$xFtSSboegYcx1Q1Ywf4KJu'),('deli005@test.com','$2b$12$ryCW91.68uqj5mGpSSfJHuUFZQrp39hg35jVgudiDyUnXPJYJ1PMm','$2b$12$ryCW91.68uqj5mGpSSfJHu'),('deli006@test.com','$2b$12$v8C518DJLDBVs.m1OJ/TkeJ/kuGfYv68teuAIl76NjLW27d3HqrvS','$2b$12$v8C518DJLDBVs.m1OJ/Tke'),('deli007@test.com','$2b$12$hFbqw9gfXIBpv5Om3lqyhuR8TvHfU8rHvrFCdXshNitF8z4H.LJce','$2b$12$hFbqw9gfXIBpv5Om3lqyhu'),('deli008@test.com','$2b$12$UknOJYurGjpMuxYdzID5J.V1mO9kgsNh.VuWfTGBDjChooZvapK6a','$2b$12$UknOJYurGjpMuxYdzID5J.'),('deli009@test.com','$2b$12$Mu5BbGGW23MAUsH0.cUVYOMfEiEcVd3yVN2muPaEAmDz0Z4lRRwyG','$2b$12$Mu5BbGGW23MAUsH0.cUVYO'),('deli010@test.com','$2b$12$/vgJQtjdzord8HGHd9Xsxuchel5PPqLvItJiuBhcKxF7WMOB9C1tq','$2b$12$/vgJQtjdzord8HGHd9Xsxu'),('res001@test.com','$2b$12$0FktGXC0zHuwSGsqohjKEOMz/PjobkfTH6peVrQY1HsfNqNg1Y8Ni','$2b$12$0FktGXC0zHuwSGsqohjKEO'),('res002@test.com','$2b$12$TDiClSlUKtFU8fQ4nFT6L.NyjOGorDbi5ExOurHwpxP0TBAcytSg.','$2b$12$TDiClSlUKtFU8fQ4nFT6L.'),('res003@test.com','$2b$12$HUR5BOHG4F45z1iFqnd6we4Ky./Pp.IMOllU07pEL/GOnIQjW/2my','$2b$12$HUR5BOHG4F45z1iFqnd6we'),('res004@test.com','$2b$12$TsgQzJaHQyXL6pRUsI8bAOljJa4V12a1P/kAJvje2IM3T/yaQ18bi','$2b$12$TsgQzJaHQyXL6pRUsI8bAO'),('res005@test.com','$2b$12$iwEqAG5MYrHfyFD43w3Hlegys3rx46WsAQA04yWLSp6dj1h0LwHXm','$2b$12$iwEqAG5MYrHfyFD43w3Hle'),('res006@test.com','$2b$12$dtQdoHCJSSc.RAbuyYJH7eqLwJW7uScI4Z5VZkbEyxtjL7O0Yjixi','$2b$12$dtQdoHCJSSc.RAbuyYJH7e'),('res007@test.com','$2b$12$anRVbJjDrnaKp33rKvQdkeeomlQ5NygkGER.gch30tCnG2O26FbzK','$2b$12$anRVbJjDrnaKp33rKvQdke'),('res008@test.com','$2b$12$14YrN8hRq.rOSRFKom8rKeEO86jQevygvBbcmamJ9VtpWqcCvmH9y','$2b$12$14YrN8hRq.rOSRFKom8rKe'),('res009@test.com','$2b$12$VKsYAEm0n1BC8LKJnaajeOSGC1ShuVr1Y7GxQEwxs7bzZJBwGr1B6','$2b$12$VKsYAEm0n1BC8LKJnaajeO'),('res010@test.com','$2b$12$rXqTVfQNx4M3fEypYm/NT.Ekg0ME1XxAqOiJCWZGe0Jkjjsf5N44u','$2b$12$rXqTVfQNx4M3fEypYm/NT.'),('res011@test.com','$2b$12$9IuICVE/RaROlEhSijaJ0OurU7AsAw/kcQdc7c/pJlTJc37/GWx4u','$2b$12$9IuICVE/RaROlEhSijaJ0O'),('res012@test.com','$2b$12$ZSh73GLKgHsb9bw8axK5m./SjYuJFiK/C..82d18w.obDgV9YyqMC','$2b$12$ZSh73GLKgHsb9bw8axK5m.'),('res013@test.com','$2b$12$c9XxBJKUzQrLW5j1Nkn.D.vVSNKYMB5b8f/NRnQNIEU2X/1N8z8s6','$2b$12$c9XxBJKUzQrLW5j1Nkn.D.'),('res014@test.com','$2b$12$8IKX8yZ4dJKOeHALHi0kBOuBOVNev7AQjm8H6gmZ.tNs5xio6m7aa','$2b$12$8IKX8yZ4dJKOeHALHi0kBO'),('res015@test.com','$2b$12$q5gWo3YtQSRRFyjg/lzGZ.UtfNXPE9bMZ/gHEu5TDN22PuAzIUHG6','$2b$12$q5gWo3YtQSRRFyjg/lzGZ.');
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

-- Dump completed on 2022-11-22 16:10:19
