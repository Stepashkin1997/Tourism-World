CREATE DATABASE  IF NOT EXISTS `tourismweb` /*!40100 DEFAULT CHARACTER SET cp1251 */;
USE `tourismweb`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: tourismweb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cities_name` varchar(100) NOT NULL,
  `id_country` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cities_country_idx` (`id_country`),
  CONSTRAINT `cities_country` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'London',1),(2,'Paris',4),(3,'Madrid',3),(4,'Brasilia  ',5),(5,'Ankara',2),(6,'Istanbul',2),(7,'New-York',6),(8,'Beijing',7),(9,'Rome',12),(10,'Dubai',10),(11,'Milan',12),(12,'Alania',2),(13,'New Delhi ',8),(14,'Pataya',9),(15,'Athens',11),(16,'Las Vegas',6);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) NOT NULL,
  `img_src` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'England','icobritan.png'),(2,'Turkey','icoturkey.png'),(3,'Spain','icospain.png'),(4,'France','icofrance.png'),(5,'Brazil','icobrazil.png'),(6,'USA','icousa.png'),(7,'China','icochina.png'),(8,'India','icoindia.png'),(9,'Thailand','icothailand.png'),(10,'UAE','icouae.png'),(11,'Greece','icogreez.png'),(12,'Italy','icoitaly.png');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(100) NOT NULL,
  `id_cities` int(11) NOT NULL,
  `img_src` varchar(100) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `about` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `hotels_cities_idx` (`id_cities`),
  CONSTRAINT `hotels_cities` FOREIGN KEY (`id_cities`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Queens Park Hotel',1,'QPH.jpg',3,64,'<p><span>One of our bestsellers in London! </span>Just metres from <span>Queensway</span> and Bayswater London Underground Stations and close to <span>Hyde Park</span> and <span>Kensington Gardens</span>, the Queens Park Hotel offers comfortable en suite rooms.</p><p>Situated in <span >Bayswater</span>, just off the <span>Bayswater Road</span>, the Queens Park Hotel has a <span>good location</span>, within <span>easy</span> reach of some of London\'s most popular attractions.</p><p>The hotel is just a few minutes\' walk from Queensway, with its late-night shopping, cosmopolitan <span>restaurants</span> and the famous Whiteley\'s shopping centre. <span>Oxford Street</span> is less than 2.4 km away.</p>'),(2,'Hilton Paris Charles de Gaulle Airport',2,'HiltonParis.jpg',4,203,'<p>Hilton Paris Charles De Gaulle Airport is only 1 minute from the free CDGVAL shuttle, offering access to all terminals of Charles de Gaulle Airport. It is 30 minutes from Paris via the nearby CDG 1-3 RER Train Station. The property offers free access to an indoor, heated swimming pool, sauna and fitness centre.</p><p>Hilton Paris Charles de Gaulle Airport offers spacious and bright rooms with large, soundproofed windows and a flat-screen TV. Private bathrooms are equipped with a bathtub and a separate walk-in shower. Guests staying in Executive Rooms will have access to the Executive Lounge, where they will be able to enjoy refreshments and a free continental breakfast.</p>'),(3,'Hostal Suites Alhambra',3,'HostalSA.jpg',3,123,'<p><span>One of our top picks in Madrid.</span>Hostal <span>Alhambra Suites</span> is just 30 m off the central square of Puerta del Sol. The property offers free WiFi and flat-screen TVs in rooms.</p>'),(4,'Vision Hplus Express',4,'VisionHplusE.jpg',3,137,'    <p><span>One of our top picks in Brasilia.</span>Featuring a fitness centre, an outdoor and an indoor pool, Vision Hplus Express + offers accommodation in Brasilia, 100 m from Conjunto Nacional Mall. Free WiFi is available.</p>'),(5,'Hotel Cinnah',5,'HotelCinnah.jpg',2,42,'<p><span>One of our top picks in Ankara.</span>Located in the heart of Ankara, Hotel Cinnah is 100 m from Kugulu Park. It is also within walking distance to many shops are shopping area. Free WiFi is available throughout the property. Guests can benefit free private parking on site.</p>'),(6,'Raffles Istanbul',6,'RafflesIstan.jpg',5,697,'    <p>Located in Zorlu Centre, Raffles Istanbul offers an outdoor pool, indoor pool and a terrace. Free WiFi access is available throughout the premises. The property features an array of facilities like sauna, fitness centre, massage and Turkish bath.</p>'),(7,'Courtyard by Marriott New York Manhattan / Central Park',7,'CourtyardByMarriottNY.jpg',3,169,'<p><span>One of our top picks in New York.</span>Offering a fitness centre and <span>free WiFi</span>, Courtyard by Marriott New York Manhattan/Central <span>Park</span> is <span>located</span> 966 m from from Rockefeller Center, 644 m from Time Square and 483 m from Central Park.</p>'),(8,'Prime Hotel Beijing Wangfujing',8,'PrimeHotelBej.jpg',5,131,'<p><span>One of our top picks in Beijing.</span>Located on Wangfujing Street, Prime Hotel offers 5 dining options, an indoor pool and free parking. Rooms feature free WiFi and city views. It is a 5-minute walk from the Jiade Artistic Center and the National Art Museum of China.</p>'),(9,'Sheraton Parco de\' Medici Rome Hotel',9,'SheratonParcoRome.jpg',4,72,'<p>Surrounded by landscaped gardens, Sheraton Parco De\' Medici Rome Hotel  features a 27-hole <span>golf course</span> and an <span>outdoor pool</span>. It is 10 km from Fiumicino Airport and 5 minutes\' drive from Rome\'s A90 ring road.</p>'),(10,'JW Marriott Marquis Hotel Dubai',10,'JWMarriottMHDubai.jpg',5,133,'<p><span>One of our top picks in Dubai.</span>Spread across two iconic towers, the spectacular <span>JW Marriott Marquis</span> Hotel features an enticing array of 14 award-winning restaurants, bars and lounges and the sublime Saray Spa and Health Club. For leisure travellers, the hotel is ideally placed between <span>Dubai Mall</span> and <span>Mall</span> of the Emirates, next to Business Bay Metro Station and enjoys a spectacular <span>location</span> directly beside the new Dubai Water Canal extension. The JW Marriott Marquis Dubai offers free WiFi and an outdoor swimming pool.</p>'),(11,'Ramada Plaza Milano',11,'RamadaPlazaMilano.jpg',4,86,'<p><span>One of our top picks in Milan.</span>Ramada Plaza is located 700 m from Turro Metro Station. It offers a fitness centre, a seasonal outdoor pool, and a free scheduled shuttle to Milan Train Station all week. Free bikes are available to explore the Martesana cycle route.</p>'),(12,'Long Beach Resort Hotel & Spa',12,'LongBeachResortHotel.jpg',5,35,'<p>Located on the shore of Wong Amart Beach, Long Beach Garden Hotel and Spa is a 1-hour drive from Suvarnabhumi Airport. It features a pool with waterfall and 5 dining options. Free Wi-Fi is available in the lobby.</p>'),(13,'Holiday Inn New Delhi International Airport',13,'HInnNEWD.jpg',5,86,'<p><span>One of our top picks in New Delhi.</span>Offering an outdoor <span>swimming pool</span>, a fitness centre and a spa and wellness centre, Holiday Inn New Delhi International Airport is located in <span>New Delhi</span>. Free WiFi access is available. The <span>property</span> provides complimentary 2-way <span>airport</span> <span>transfers</span>.</p>'),(14,'Sutus Court 2',14,'SutusCourt2.jpg',2,21,'<p><span>One of our bestsellers in Pattaya Central! </span>Offering free Wi-Fi and spacious rooms with wood flooring, ample storage space and a private balcony is Sutus Court 2. It is located within 300 m of Pattaya Beach and a 5-minute drive from shopping and nightlife options.</p>'),(15,'Hotel Grande Bretagne, a Luxury Collection Hotel',15,'HotelGrandeBL.jpg',5,309,'<p><strong>Location.</strong><br /> Hotel Grande Bretagne, a Luxury Collection Hotel, Athens is a 19th-century palace facing the main Syntagma Square and adjacent to the Parliament Building. The Acropolis, the New Acropolis Museum and the labyrinthine Plaka (old town) are within 0.6 miles (1 kilometer). Syntagma metro station is 0.2 miles (300 meters) from the hotel. </p>');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'a','1'),(2,'b','2'),(3,'c','3'),(4,'d','4');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel` int(11) NOT NULL,
  `date` date NOT NULL,
  `id_person` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `hotel_purchase_idx` (`hotel`),
  KEY `person_purchase_idx` (`id_person`),
  CONSTRAINT `hotel_purchase` FOREIGN KEY (`hotel`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `person_purchase` FOREIGN KEY (`id_person`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=cp1251;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,15,'2019-04-22',1),(2,4,'2019-04-22',2),(3,13,'2019-04-22',1),(4,4,'2019-04-22',1);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-01 19:42:16
