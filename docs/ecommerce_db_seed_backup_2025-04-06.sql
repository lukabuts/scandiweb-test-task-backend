-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: scandiweb_project
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `attribute_item`
--

DROP TABLE IF EXISTS `attribute_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_item` (
  `attribute_id` int NOT NULL,
  `item_id` varchar(255) NOT NULL,
  PRIMARY KEY (`attribute_id`,`item_id`),
  KEY `attribute_item_ibfk_2` (`item_id`),
  CONSTRAINT `attribute_item_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `attribute_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_item`
--

LOCK TABLES `attribute_item` WRITE;
/*!40000 ALTER TABLE `attribute_item` DISABLE KEYS */;
INSERT INTO `attribute_item` VALUES (1,'1T'),(7,'256GB'),(3,'40'),(3,'41'),(3,'42'),(3,'43'),(1,'512G'),(7,'512GB'),(2,'Black'),(2,'Blue'),(2,'Cyan'),(6,'Extra Large'),(2,'Green'),(6,'Large'),(6,'Medium'),(4,'No'),(5,'No'),(6,'Small'),(2,'White'),(4,'Yes'),(5,'Yes');
/*!40000 ALTER TABLE `attribute_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_order`
--

DROP TABLE IF EXISTS `attribute_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `attribute_id` int DEFAULT NULL,
  `order_id` int NOT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `attribute_order_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_order_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_order`
--

LOCK TABLES `attribute_order` WRITE;
/*!40000 ALTER TABLE `attribute_order` DISABLE KEYS */;
INSERT INTO `attribute_order` VALUES (267,7,202,'256GB'),(268,4,202,'No'),(269,5,202,'No'),(270,3,203,'42'),(271,3,204,'42'),(272,3,205,'42'),(273,6,206,'Medium'),(274,6,207,'Medium'),(275,6,208,'Medium'),(276,7,211,'256GB'),(277,4,211,'No'),(278,5,211,'No'),(279,7,213,'256GB'),(280,4,213,'No'),(281,5,213,'No'),(282,1,214,'1T'),(283,2,214,'Black'),(284,1,215,'1T'),(285,2,215,'Black'),(286,1,217,'1T'),(287,2,217,'Black'),(288,3,218,'40');
/*!40000 ALTER TABLE `attribute_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_product`
--

DROP TABLE IF EXISTS `attribute_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) NOT NULL,
  `attribute_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `attribute_id` (`attribute_id`),
  CONSTRAINT `attribute_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `attribute_product_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_product`
--

LOCK TABLES `attribute_product` WRITE;
/*!40000 ALTER TABLE `attribute_product` DISABLE KEYS */;
INSERT INTO `attribute_product` VALUES (1,'huarache-x-stussy-le',3),(2,'jacket-canada-goosee',6),(3,'ps-5',1),(4,'ps-5',2),(5,'xbox-series-s',1),(6,'xbox-series-s',2),(7,'apple-imac-2021',7),(8,'apple-imac-2021',4),(9,'apple-imac-2021',5),(10,'apple-iphone-12-pro',1),(11,'apple-iphone-12-pro',2);
/*!40000 ALTER TABLE `attribute_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_types`
--

DROP TABLE IF EXISTS `attribute_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_types`
--

LOCK TABLES `attribute_types` WRITE;
/*!40000 ALTER TABLE `attribute_types` DISABLE KEYS */;
INSERT INTO `attribute_types` VALUES (1,'text'),(2,'swatch');
/*!40000 ALTER TABLE `attribute_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `attributes_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `attribute_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Capacity',1),(2,'Color',2),(3,'Size',1),(4,'Touch ID in keyboard',1),(5,'With USB 3 ports',1),(6,'Size',1),(7,'Capacity',1),(8,'Capacity',1);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (4,'Apple'),(1,'Canada Goose'),(3,'Microsoft'),(5,'Nike x Stussy'),(2,'Sony');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'all'),(2,'clothes'),(3,'tech');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'USD','$');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` varchar(255) NOT NULL,
  `display_value` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('1T','1T','1T'),('256GB','256GB','256GB'),('40','40','40'),('41','41','41'),('42','42','42'),('43','43','43'),('512G','512G','512G'),('512GB','512GB','512GB'),('Black','Black','#000000'),('Blue','Blue','#030BFF'),('Cyan','Cyan','#03FFF7'),('Extra Large','Extra Large','XL'),('Green','Green','#44FF03'),('Large','Large','L'),('Medium','Medium','M'),('No','No','No'),('Small','Small','S'),('White','White','#FFFFFF'),('Yes','Yes','Yes');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_id` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `currency_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product` (`product_id`),
  KEY `fk_orders_currency` (`currency_id`),
  CONSTRAINT `fk_orders_currency` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (202,1688.03,'2025-04-19 12:58:33','2025-04-19 12:58:33','apple-imac-2021',1,1),(203,144.69,'2025-04-19 12:58:33','2025-04-19 12:58:33','huarache-x-stussy-le',1,1),(204,144.69,'2025-04-19 12:58:45','2025-04-19 12:58:45','huarache-x-stussy-le',1,1),(205,144.69,'2025-04-19 12:58:46','2025-04-19 12:58:46','huarache-x-stussy-le',1,1),(206,518.47,'2025-04-19 13:01:46','2025-04-19 13:01:46','jacket-canada-goosee',1,1),(207,518.47,'2025-04-19 13:01:50','2025-04-19 13:01:50','jacket-canada-goosee',1,1),(208,518.47,'2025-04-19 13:01:51','2025-04-19 13:01:51','jacket-canada-goosee',1,1),(209,120.57,'2025-04-22 09:36:43','2025-04-22 09:36:43','apple-airtag',1,1),(210,120.57,'2025-04-22 09:44:37','2025-04-22 09:44:37','apple-airtag',1,1),(211,1688.03,'2025-04-22 09:44:50','2025-04-22 09:44:50','apple-imac-2021',1,1),(212,361.71,'2025-04-22 11:09:29','2025-04-22 11:09:29','apple-airtag',3,1),(213,3376.06,'2025-04-22 11:09:29','2025-04-22 11:09:29','apple-imac-2021',2,1),(214,1000.76,'2025-04-22 11:09:29','2025-04-22 11:09:29','apple-iphone-12-pro',1,1),(215,844.02,'2025-04-22 11:09:29','2025-04-22 11:09:29','ps-5',1,1),(216,361.71,'2025-04-23 08:57:24','2025-04-23 08:57:24','apple-airtag',3,1),(217,1000.76,'2025-04-23 08:57:24','2025-04-23 08:57:24','apple-iphone-12-pro',1,1),(218,144.69,'2025-04-23 08:57:24','2025-04-23 08:57:24','huarache-x-stussy-le',1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `currency_id` int DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_id` (`currency_id`),
  KEY `prices_ibfk_1` (`product_id`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,144.69,1,'huarache-x-stussy-le'),(2,518.47,1,'jacket-canada-goosee'),(3,844.02,1,'ps-5'),(4,333.99,1,'xbox-series-s'),(5,1688.03,1,'apple-imac-2021'),(6,1000.76,1,'apple-iphone-12-pro'),(7,300.23,1,'apple-airpods-pro'),(8,120.57,1,'apple-airtag');
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `gallery` json DEFAULT NULL,
  `description` text,
  `category_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `fk_brand_id` (`brand_id`),
  CONSTRAINT `fk_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('apple-airpods-pro','AirPods Pro',0,'[\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634795000\"]','<h3>Magic like you’ve never heard</h3><p>AirPods Pro have been designed to deliver Active Noise Cancellation...</p>',3,4),('apple-airtag','AirTag',1,'[\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761672000\"]','<h1>Lose your knack for losing things.</h1><p>AirTag is an easy way to keep track of your stuff...</p>',3,4),('apple-imac-2021','iMac 2021',1,'[\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000\"]','The new iMac!',3,4),('apple-iphone-12-pro','iPhone 12 Pro',1,'[\"https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&amp;hei=1112&amp;fmt=jpeg&amp;qlt=80&amp;.v=1604021663000\"]','This is iPhone 12. Nothing else to say.',3,4),('huarache-x-stussy-le','Nike Air Huarache Le',1,'[\"https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087\", \"https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087\", \"https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087\", \"https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087\", \"https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087\"]','<p>Great sneakers for everyday use!</p>',2,5),('jacket-canada-goosee','Jacket',1,'[\"https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg\", \"https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg\", \"https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg\", \"https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg\", \"https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg\", \"https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058169/product-image/2409L_61_o.png\", \"https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png\"]','<p>Awesome winter jacket</p>',2,1),('ps-5','PlayStation 5',1,'[\"https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg\"]','<p>A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha</p>',3,2),('xbox-series-s','Xbox Series S 512GB',0,'[\"https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg\", \"https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg\"]','<div><ul><li><span>Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer</span></li><li><span>Spiele Games mit bis zu 120 Bilder pro Sekunde</span></li><li><span>Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen.</span></li><li><span>Xbox Smart Delivery stellt sicher, dass du die beste Version deines Spiels spielst, egal, auf welcher Konsole du spielst</span></li><li><span>Spiele deine Xbox One-Spiele auf deiner Xbox Series S weiter...</span></li></ul></div>',3,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 19:30:26
