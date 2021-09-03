-- MySQL dump 10.16  Distrib 10.1.48-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cocorico
-- ------------------------------------------------------
-- Server version	10.1.48-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` smallint(6) NOT NULL,
  `validated` tinyint(1) NOT NULL,
  `amount` decimal(8,0) NOT NULL,
  `amount_fee_as_asker` decimal(8,0) NOT NULL,
  `amount_fee_as_offerer` decimal(8,0) NOT NULL,
  `amount_total` decimal(8,0) NOT NULL,
  `cancellation_policy` smallint(6) NOT NULL,
  `new_booking_at` datetime DEFAULT NULL,
  `payed_booking_at` datetime DEFAULT NULL,
  `refused_booking_at` datetime DEFAULT NULL,
  `canceled_asker_booking_at` datetime DEFAULT NULL,
  `alerted_expiring` tinyint(1) NOT NULL,
  `alerted_imminent` tinyint(1) NOT NULL,
  `invoice_number` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refund_invoice_number` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `time_zone_asker` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time_zone_offerer` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E00CEDDEA76ED395` (`user_id`),
  KEY `IDX_E00CEDDED4619D1A` (`listing_id`),
  KEY `start_idx` (`start`),
  KEY `end_idx` (`end`),
  KEY `start_time_idx` (`start_time`),
  KEY `end_time_idx` (`end_time`),
  KEY `status_idx` (`status`),
  KEY `validated_idx` (`validated`),
  KEY `new_booking_at_idx` (`new_booking_at`),
  KEY `alerted_expiring_idx` (`alerted_expiring`),
  KEY `alerted_imminent_idx` (`alerted_imminent`),
  KEY `created_at_idx` (`createdAt`),
  KEY `updated_at_idx` (`updatedAt`),
  KEY `invoice_number_idx` (`invoice_number`),
  KEY `refund_invoice_number_idx` (`refund_invoice_number`),
  CONSTRAINT `FK_E00CEDDEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E00CEDDED4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_bank_wire`
--

DROP TABLE IF EXISTS `booking_bank_wire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_bank_wire` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `amount` decimal(8,0) NOT NULL,
  `payed_at` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8929A0B83301C60` (`booking_id`),
  KEY `IDX_8929A0B8A76ED395` (`user_id`),
  KEY `status_bbw_idx` (`status`),
  KEY `created_at_bbw_idx` (`createdAt`),
  CONSTRAINT `FK_8929A0B83301C60` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8929A0B8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_bank_wire`
--

LOCK TABLES `booking_bank_wire` WRITE;
/*!40000 ALTER TABLE `booking_bank_wire` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_bank_wire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_payin_refund`
--

DROP TABLE IF EXISTS `booking_payin_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_payin_refund` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `amount` decimal(8,0) NOT NULL,
  `payed_at` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2CD4E82D3301C60` (`booking_id`),
  KEY `IDX_2CD4E82DA76ED395` (`user_id`),
  KEY `status_pr_idx` (`status`),
  KEY `created_at_pr_idx` (`createdAt`),
  CONSTRAINT `FK_2CD4E82D3301C60` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2CD4E82DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_payin_refund`
--

LOCK TABLES `booking_payin_refund` WRITE;
/*!40000 ALTER TABLE `booking_payin_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_payin_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_user_address`
--

DROP TABLE IF EXISTS `booking_user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B7DC90443301C60` (`booking_id`),
  CONSTRAINT `FK_B7DC90443301C60` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_user_address`
--

LOCK TABLES `booking_user_address` WRITE;
/*!40000 ALTER TABLE `booking_user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at_c_idx` (`createdAt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer`
--

DROP TABLE IF EXISTS `footer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `footer_published_idx` (`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer`
--

LOCK TABLES `footer` WRITE;
/*!40000 ALTER TABLE `footer` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer_translation`
--

DROP TABLE IF EXISTS `footer_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footer_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` bigint(20) DEFAULT NULL,
  `url` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `footer_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_439793442C2AC5D3` (`translatable_id`),
  KEY `footer_url_hash_idx` (`url_hash`),
  CONSTRAINT `FK_439793442C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `footer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer_translation`
--

LOCK TABLES `footer_translation` WRITE;
/*!40000 ALTER TABLE `footer_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `footer_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_area`
--

DROP TABLE IF EXISTS `geo_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `geocoding_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D3B312683A405C9` (`geocoding_id`),
  KEY `IDX_D3B31268F92F3E70` (`country_id`),
  CONSTRAINT `FK_D3B312683A405C9` FOREIGN KEY (`geocoding_id`) REFERENCES `geo_geocoding` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_D3B31268F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `geo_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_area`
--

LOCK TABLES `geo_area` WRITE;
/*!40000 ALTER TABLE `geo_area` DISABLE KEYS */;
INSERT INTO `geo_area` VALUES (2,2,NULL);
/*!40000 ALTER TABLE `geo_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_area_translation`
--

DROP TABLE IF EXISTS `geo_area_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_area_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_area_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_7A5BDDAB2C2AC5D3` (`translatable_id`),
  KEY `name_gat_idx` (`name`),
  CONSTRAINT `FK_7A5BDDAB2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `geo_area` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_area_translation`
--

LOCK TABLES `geo_area_translation` WRITE;
/*!40000 ALTER TABLE `geo_area_translation` DISABLE KEYS */;
INSERT INTO `geo_area_translation` VALUES (3,2,'Île-de-France','en','ile-de-france'),(4,2,'Île-de-France','fr','ile-de-france');
/*!40000 ALTER TABLE `geo_area_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_city`
--

DROP TABLE IF EXISTS `geo_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `geocoding_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_297C2D343A405C9` (`geocoding_id`),
  KEY `IDX_297C2D34F92F3E70` (`country_id`),
  KEY `IDX_297C2D34BD0F409C` (`area_id`),
  KEY `IDX_297C2D34AE80F5DF` (`department_id`),
  CONSTRAINT `FK_297C2D343A405C9` FOREIGN KEY (`geocoding_id`) REFERENCES `geo_geocoding` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_297C2D34AE80F5DF` FOREIGN KEY (`department_id`) REFERENCES `geo_department` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_297C2D34BD0F409C` FOREIGN KEY (`area_id`) REFERENCES `geo_area` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_297C2D34F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `geo_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_city`
--

LOCK TABLES `geo_city` WRITE;
/*!40000 ALTER TABLE `geo_city` DISABLE KEYS */;
INSERT INTO `geo_city` VALUES (2,2,2,2,NULL);
/*!40000 ALTER TABLE `geo_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_city_translation`
--

DROP TABLE IF EXISTS `geo_city_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_city_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_city_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_72D469D42C2AC5D3` (`translatable_id`),
  KEY `name_gct_idx` (`name`),
  CONSTRAINT `FK_72D469D42C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `geo_city` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_city_translation`
--

LOCK TABLES `geo_city_translation` WRITE;
/*!40000 ALTER TABLE `geo_city_translation` DISABLE KEYS */;
INSERT INTO `geo_city_translation` VALUES (3,2,'Paris','en','paris'),(4,2,'Paris','fr','paris');
/*!40000 ALTER TABLE `geo_city_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_coordinate`
--

DROP TABLE IF EXISTS `geo_coordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_coordinate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `lat` decimal(11,7) NOT NULL,
  `lng` decimal(11,7) NOT NULL,
  `zip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B2E13D99F92F3E70` (`country_id`),
  KEY `IDX_B2E13D99BD0F409C` (`area_id`),
  KEY `IDX_B2E13D99AE80F5DF` (`department_id`),
  KEY `IDX_B2E13D998BAC62AF` (`city_id`),
  KEY `coordinate_idx` (`lat`,`lng`),
  CONSTRAINT `FK_B2E13D998BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `geo_city` (`id`),
  CONSTRAINT `FK_B2E13D99AE80F5DF` FOREIGN KEY (`department_id`) REFERENCES `geo_department` (`id`),
  CONSTRAINT `FK_B2E13D99BD0F409C` FOREIGN KEY (`area_id`) REFERENCES `geo_area` (`id`),
  CONSTRAINT `FK_B2E13D99F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `geo_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_coordinate`
--

LOCK TABLES `geo_coordinate` WRITE;
/*!40000 ALTER TABLE `geo_coordinate` DISABLE KEYS */;
INSERT INTO `geo_coordinate` VALUES (2,2,2,2,2,48.8697174,2.3509855,'75002','Rue de la Lune','9','9 Rue de la Lune, 75002 Paris, France','2021-09-03 07:02:49','2021-09-03 07:02:49');
/*!40000 ALTER TABLE `geo_coordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_country`
--

DROP TABLE IF EXISTS `geo_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geocoding_id` int(11) DEFAULT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E46544643A405C9` (`geocoding_id`),
  KEY `code_idx` (`code`),
  CONSTRAINT `FK_E46544643A405C9` FOREIGN KEY (`geocoding_id`) REFERENCES `geo_geocoding` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_country`
--

LOCK TABLES `geo_country` WRITE;
/*!40000 ALTER TABLE `geo_country` DISABLE KEYS */;
INSERT INTO `geo_country` VALUES (2,NULL,'FR');
/*!40000 ALTER TABLE `geo_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_country_translation`
--

DROP TABLE IF EXISTS `geo_country_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_country_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_country_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_F705D5582C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_F705D5582C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `geo_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_country_translation`
--

LOCK TABLES `geo_country_translation` WRITE;
/*!40000 ALTER TABLE `geo_country_translation` DISABLE KEYS */;
INSERT INTO `geo_country_translation` VALUES (3,2,'France','en','france'),(4,2,'France','fr','france');
/*!40000 ALTER TABLE `geo_country_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_department`
--

DROP TABLE IF EXISTS `geo_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `geocoding_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B46066043A405C9` (`geocoding_id`),
  KEY `IDX_B4606604F92F3E70` (`country_id`),
  KEY `IDX_B4606604BD0F409C` (`area_id`),
  CONSTRAINT `FK_B46066043A405C9` FOREIGN KEY (`geocoding_id`) REFERENCES `geo_geocoding` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B4606604BD0F409C` FOREIGN KEY (`area_id`) REFERENCES `geo_area` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B4606604F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `geo_country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_department`
--

LOCK TABLES `geo_department` WRITE;
/*!40000 ALTER TABLE `geo_department` DISABLE KEYS */;
INSERT INTO `geo_department` VALUES (2,2,2,NULL);
/*!40000 ALTER TABLE `geo_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_department_translation`
--

DROP TABLE IF EXISTS `geo_department_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_department_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `geo_department_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_95DC05742C2AC5D3` (`translatable_id`),
  KEY `name_gdt_idx` (`name`),
  CONSTRAINT `FK_95DC05742C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `geo_department` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_department_translation`
--

LOCK TABLES `geo_department_translation` WRITE;
/*!40000 ALTER TABLE `geo_department_translation` DISABLE KEYS */;
INSERT INTO `geo_department_translation` VALUES (3,2,'Paris','en','paris'),(4,2,'Paris','fr','paris');
/*!40000 ALTER TABLE `geo_department_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_geocoding`
--

DROP TABLE IF EXISTS `geo_geocoding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_geocoding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` decimal(11,7) NOT NULL,
  `lng` decimal(11,7) NOT NULL,
  `viewport` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address_type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_geocoding`
--

LOCK TABLES `geo_geocoding` WRITE;
/*!40000 ALTER TABLE `geo_geocoding` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_geocoding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lexik_currency`
--

DROP TABLE IF EXISTS `lexik_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lexik_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lexik_currency`
--

LOCK TABLES `lexik_currency` WRITE;
/*!40000 ALTER TABLE `lexik_currency` DISABLE KEYS */;
INSERT INTO `lexik_currency` VALUES (9,'EUR',1.0000),(10,'USD',1.1846),(11,'JPY',130.3100),(12,'GBP',0.8592),(13,'CHF',1.0848),(14,'RUB',86.2301),(15,'AUD',1.6038),(16,'CAD',1.4944);
/*!40000 ALTER TABLE `lexik_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  `price` decimal(8,0) NOT NULL,
  `certified` tinyint(1) DEFAULT NULL,
  `min_duration` smallint(6) DEFAULT NULL,
  `max_duration` smallint(6) DEFAULT NULL,
  `cancellation_policy` smallint(6) NOT NULL,
  `average_rating` smallint(6) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `admin_notation` decimal(3,1) DEFAULT NULL,
  `availabilities_updated_at` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CB0048D464D218E` (`location_id`),
  KEY `IDX_CB0048D4A76ED395` (`user_id`),
  KEY `created_at_l_idx` (`createdAt`),
  KEY `status_l_idx` (`status`),
  KEY `price_idx` (`price`),
  KEY `type_idx` (`type`),
  KEY `min_duration_idx` (`min_duration`),
  KEY `max_duration_idx` (`max_duration`),
  KEY `average_rating_idx` (`average_rating`),
  KEY `admin_notation_idx` (`admin_notation`),
  CONSTRAINT `FK_CB0048D464D218E` FOREIGN KEY (`location_id`) REFERENCES `listing_location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CB0048D4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing`
--

LOCK TABLES `listing` WRITE;
/*!40000 ALTER TABLE `listing` DISABLE KEYS */;
INSERT INTO `listing` VALUES (1726435368,885572173,2,2,NULL,10000,1,NULL,NULL,1,NULL,0,NULL,NULL,'2021-09-03 07:02:49','2021-09-03 07:02:49');
/*!40000 ALTER TABLE `listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_category`
--

DROP TABLE IF EXISTS `listing_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E0307BBB727ACA70` (`parent_id`),
  CONSTRAINT `FK_E0307BBB727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `listing_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_category`
--

LOCK TABLES `listing_category` WRITE;
/*!40000 ALTER TABLE `listing_category` DISABLE KEYS */;
INSERT INTO `listing_category` VALUES (8,NULL,1,0,6,8),(9,8,2,1,3,8),(10,8,4,1,5,8),(11,NULL,1,0,8,11),(12,11,2,1,5,11),(13,12,3,2,4,11),(14,11,6,1,7,11);
/*!40000 ALTER TABLE `listing_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_category_translation`
--

DROP TABLE IF EXISTS `listing_category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_category_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_category_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_606EDC1F2C2AC5D3` (`translatable_id`),
  KEY `name_idx` (`name`),
  CONSTRAINT `FK_606EDC1F2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `listing_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_category_translation`
--

LOCK TABLES `listing_category_translation` WRITE;
/*!40000 ALTER TABLE `listing_category_translation` DISABLE KEYS */;
INSERT INTO `listing_category_translation` VALUES (15,8,'Category1','en','category1'),(16,8,'Categorie1','fr','categorie1'),(17,9,'Category1_1','en','category1-1'),(18,9,'Categorie1_1','fr','categorie1-1'),(19,10,'Category1_2','en','category1-2'),(20,10,'Categorie1_2','fr','categorie1-2'),(21,11,'Category2','en','category2'),(22,11,'Categorie2','fr','categorie2'),(23,12,'Category2_1','en','category2-1'),(24,12,'Categorie2_1','fr','categorie2-1'),(25,13,'Category2_1_1','en','category2-1-1'),(26,13,'Categorie2_1_1','fr','categorie2-1-1'),(27,14,'Category2_2','en','category2-2'),(28,14,'Categorie2_2','fr','categorie2-2');
/*!40000 ALTER TABLE `listing_category_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_characteristic`
--

DROP TABLE IF EXISTS `listing_characteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_characteristic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_characteristic_type_id` int(11) NOT NULL,
  `listing_characteristic_group_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_97E210EC3A0F8087` (`listing_characteristic_type_id`),
  KEY `IDX_97E210ECE4714E36` (`listing_characteristic_group_id`),
  KEY `position_idx` (`position`),
  CONSTRAINT `FK_97E210EC3A0F8087` FOREIGN KEY (`listing_characteristic_type_id`) REFERENCES `listing_characteristic_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_97E210ECE4714E36` FOREIGN KEY (`listing_characteristic_group_id`) REFERENCES `listing_characteristic_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_characteristic`
--

LOCK TABLES `listing_characteristic` WRITE;
/*!40000 ALTER TABLE `listing_characteristic` DISABLE KEYS */;
INSERT INTO `listing_characteristic` VALUES (5,4,3,1),(6,5,3,2),(7,6,4,3),(8,6,4,4);
/*!40000 ALTER TABLE `listing_characteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_characteristic_group`
--

DROP TABLE IF EXISTS `listing_characteristic_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_characteristic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_62B4C3E4462CE4F5` (`position`),
  KEY `position_lcg_idx` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_characteristic_group`
--

LOCK TABLES `listing_characteristic_group` WRITE;
/*!40000 ALTER TABLE `listing_characteristic_group` DISABLE KEYS */;
INSERT INTO `listing_characteristic_group` VALUES (3,1),(4,2);
/*!40000 ALTER TABLE `listing_characteristic_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_characteristic_group_translation`
--

DROP TABLE IF EXISTS `listing_characteristic_group_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_characteristic_group_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_characteristic_group_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_6C8407162C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_6C8407162C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `listing_characteristic_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_characteristic_group_translation`
--

LOCK TABLES `listing_characteristic_group_translation` WRITE;
/*!40000 ALTER TABLE `listing_characteristic_group_translation` DISABLE KEYS */;
INSERT INTO `listing_characteristic_group_translation` VALUES (5,3,'Group_1','en'),(6,3,'Groupe_1','fr'),(7,4,'Group_2','en'),(8,4,'Groupe_2','fr');
/*!40000 ALTER TABLE `listing_characteristic_group_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_characteristic_translation`
--

DROP TABLE IF EXISTS `listing_characteristic_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_characteristic_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_characteristic_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_945E8F882C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_945E8F882C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `listing_characteristic` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_characteristic_translation`
--

LOCK TABLES `listing_characteristic_translation` WRITE;
/*!40000 ALTER TABLE `listing_characteristic_translation` DISABLE KEYS */;
INSERT INTO `listing_characteristic_translation` VALUES (9,5,'Characteristic_1','Characteristic_1 description','en'),(10,5,'Caractéristique_1','Description de la Caractéristique_1','fr'),(11,6,'Characteristic_2','Characteristic_2 description','en'),(12,6,'Caractéristique_2','Description de la Caractéristique_2','fr'),(13,7,'Characteristic_3','Characteristic_3 description','en'),(14,7,'Caractéristique_3','Description de la Caractéristique_3','fr'),(15,8,'Characteristic_4','Characteristic_4 description','en'),(16,8,'Caractéristique_4','Description de la Caractéristique_4','fr');
/*!40000 ALTER TABLE `listing_characteristic_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_characteristic_type`
--

DROP TABLE IF EXISTS `listing_characteristic_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_characteristic_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_characteristic_type`
--

LOCK TABLES `listing_characteristic_type` WRITE;
/*!40000 ALTER TABLE `listing_characteristic_type` DISABLE KEYS */;
INSERT INTO `listing_characteristic_type` VALUES (4,'Yes/No'),(5,'Quantity'),(6,'Custom_1');
/*!40000 ALTER TABLE `listing_characteristic_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_characteristic_value`
--

DROP TABLE IF EXISTS `listing_characteristic_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_characteristic_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_characteristic_type_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1203DF153A0F8087` (`listing_characteristic_type_id`),
  KEY `position_lcv_idx` (`position`),
  CONSTRAINT `FK_1203DF153A0F8087` FOREIGN KEY (`listing_characteristic_type_id`) REFERENCES `listing_characteristic_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_characteristic_value`
--

LOCK TABLES `listing_characteristic_value` WRITE;
/*!40000 ALTER TABLE `listing_characteristic_value` DISABLE KEYS */;
INSERT INTO `listing_characteristic_value` VALUES (8,4,1),(9,4,2),(10,5,1),(11,5,2),(12,5,3),(13,6,1),(14,6,2);
/*!40000 ALTER TABLE `listing_characteristic_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_characteristic_value_translation`
--

DROP TABLE IF EXISTS `listing_characteristic_value_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_characteristic_value_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_characteristic_value_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_8BC9A0F42C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_8BC9A0F42C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `listing_characteristic_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_characteristic_value_translation`
--

LOCK TABLES `listing_characteristic_value_translation` WRITE;
/*!40000 ALTER TABLE `listing_characteristic_value_translation` DISABLE KEYS */;
INSERT INTO `listing_characteristic_value_translation` VALUES (15,8,'Yes','en'),(16,8,'Oui','fr'),(17,9,'No','en'),(18,9,'Non','fr'),(19,10,'1','en'),(20,10,'1','fr'),(21,11,'2','en'),(22,11,'2','fr'),(23,12,'3','en'),(24,12,'3','fr'),(25,13,'Custom value 1','en'),(26,13,'Valeur personnalisée 1','fr'),(27,14,'Custom value 2','en'),(28,14,'Valeur personnalisée 2','fr');
/*!40000 ALTER TABLE `listing_characteristic_value_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_discount`
--

DROP TABLE IF EXISTS `listing_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL,
  `discount` smallint(6) NOT NULL,
  `from_quantity` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discount_unique` (`listing_id`,`from_quantity`),
  KEY `IDX_79CD674D4619D1A` (`listing_id`),
  KEY `discount_idx` (`discount`),
  KEY `from_quantity_idx` (`from_quantity`),
  CONSTRAINT `FK_79CD674D4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_discount`
--

LOCK TABLES `listing_discount` WRITE;
/*!40000 ALTER TABLE `listing_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `listing_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_image`
--

DROP TABLE IF EXISTS `listing_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_33D3DCD3D4619D1A` (`listing_id`),
  KEY `position_li_idx` (`position`),
  CONSTRAINT `FK_33D3DCD3D4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_image`
--

LOCK TABLES `listing_image` WRITE;
/*!40000 ALTER TABLE `listing_image` DISABLE KEYS */;
INSERT INTO `listing_image` VALUES (3,1726435368,'default-listing.png',1),(4,1726435368,'default-listing.png',2);
/*!40000 ALTER TABLE `listing_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_listing_category`
--

DROP TABLE IF EXISTS `listing_listing_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_listing_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL,
  `listing_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1AFD54EAD4619D1A` (`listing_id`),
  KEY `IDX_1AFD54EA455844B0` (`listing_category_id`),
  CONSTRAINT `FK_1AFD54EA455844B0` FOREIGN KEY (`listing_category_id`) REFERENCES `listing_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1AFD54EAD4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_listing_category`
--

LOCK TABLES `listing_listing_category` WRITE;
/*!40000 ALTER TABLE `listing_listing_category` DISABLE KEYS */;
INSERT INTO `listing_listing_category` VALUES (2,1726435368,9);
/*!40000 ALTER TABLE `listing_listing_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_listing_characteristic`
--

DROP TABLE IF EXISTS `listing_listing_characteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_listing_characteristic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL,
  `listing_characteristic_id` int(11) NOT NULL,
  `listing_characteristic_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2FD5B3B6D4619D1A` (`listing_id`),
  KEY `IDX_2FD5B3B6C27F7D66` (`listing_characteristic_id`),
  KEY `IDX_2FD5B3B6E3052CD3` (`listing_characteristic_value_id`),
  CONSTRAINT `FK_2FD5B3B6C27F7D66` FOREIGN KEY (`listing_characteristic_id`) REFERENCES `listing_characteristic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2FD5B3B6D4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2FD5B3B6E3052CD3` FOREIGN KEY (`listing_characteristic_value_id`) REFERENCES `listing_characteristic_value` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_listing_characteristic`
--

LOCK TABLES `listing_listing_characteristic` WRITE;
/*!40000 ALTER TABLE `listing_listing_characteristic` DISABLE KEYS */;
INSERT INTO `listing_listing_characteristic` VALUES (5,1726435368,5,8),(6,1726435368,6,11),(7,1726435368,7,13),(8,1726435368,8,10);
/*!40000 ALTER TABLE `listing_listing_characteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_location`
--

DROP TABLE IF EXISTS `listing_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) DEFAULT NULL,
  `coordinate_id` int(11) NOT NULL,
  `country` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B8E2EBB1D4619D1A` (`listing_id`),
  KEY `IDX_B8E2EBB198BBE953` (`coordinate_id`),
  CONSTRAINT `FK_B8E2EBB198BBE953` FOREIGN KEY (`coordinate_id`) REFERENCES `geo_coordinate` (`id`),
  CONSTRAINT `FK_B8E2EBB1D4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_location`
--

LOCK TABLES `listing_location` WRITE;
/*!40000 ALTER TABLE `listing_location` DISABLE KEYS */;
INSERT INTO `listing_location` VALUES (2,1726435368,2,'FR','Paris','75002','rue de la Lune','9');
/*!40000 ALTER TABLE `listing_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_translation`
--

DROP TABLE IF EXISTS `listing_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `rules` text COLLATE utf8_unicode_ci,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_E3779C3D2C2AC5D3` (`translatable_id`),
  KEY `slug_idx` (`slug`),
  CONSTRAINT `FK_E3779C3D2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_translation`
--

LOCK TABLES `listing_translation` WRITE;
/*!40000 ALTER TABLE `listing_translation` DISABLE KEYS */;
INSERT INTO `listing_translation` VALUES (3,1726435368,'Listing One','Listing One Description',NULL,'en','listing-one-1726435368'),(4,1726435368,'Annonce une','Description de l\'annonce une',NULL,'fr','annonce-une-1726435368');
/*!40000 ALTER TABLE `listing_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FE2904019` (`thread_id`),
  KEY `IDX_B6BD307FF624B39D` (`sender_id`),
  CONSTRAINT `FK_B6BD307FE2904019` FOREIGN KEY (`thread_id`) REFERENCES `message_thread` (`id`),
  CONSTRAINT `FK_B6BD307FF624B39D` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_metadata`
--

DROP TABLE IF EXISTS `message_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4632F005537A1329` (`message_id`),
  KEY `IDX_4632F0059D1C3019` (`participant_id`),
  CONSTRAINT `FK_4632F005537A1329` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`),
  CONSTRAINT `FK_4632F0059D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_metadata`
--

LOCK TABLES `message_metadata` WRITE;
/*!40000 ALTER TABLE `message_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_thread`
--

DROP TABLE IF EXISTS `message_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `isSpam` tinyint(1) NOT NULL,
  `createdBy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_607D18C3301C60` (`booking_id`),
  KEY `IDX_607D18C3174800F` (`createdBy_id`),
  KEY `IDX_607D18CD4619D1A` (`listing_id`),
  CONSTRAINT `FK_607D18C3174800F` FOREIGN KEY (`createdBy_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_607D18C3301C60` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_607D18CD4619D1A` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_thread`
--

LOCK TABLES `message_thread` WRITE;
/*!40000 ALTER TABLE `message_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_thread_metadata`
--

DROP TABLE IF EXISTS `message_thread_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_thread_metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) DEFAULT NULL,
  `participant_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `last_participant_message_date` datetime DEFAULT NULL,
  `last_message_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_38FC293EE2904019` (`thread_id`),
  KEY `IDX_38FC293E9D1C3019` (`participant_id`),
  CONSTRAINT `FK_38FC293E9D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_38FC293EE2904019` FOREIGN KEY (`thread_id`) REFERENCES `message_thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_thread_metadata`
--

LOCK TABLES `message_thread_metadata` WRITE;
/*!40000 ALTER TABLE `message_thread_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_thread_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `published_idx` (`published`),
  KEY `created_at_p_idx` (`createdAt`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (7,1,'2021-09-03 07:02:49','2021-09-03 07:02:49'),(8,1,'2021-09-03 07:02:49','2021-09-03 07:02:49'),(9,1,'2021-09-03 07:02:49','2021-09-03 07:02:49'),(10,1,'2021-09-03 07:02:49','2021-09-03 07:02:49'),(11,1,'2021-09-03 07:02:49','2021-09-03 07:02:49'),(12,1,'2021-09-03 07:02:49','2021-09-03 07:02:49');
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_translation`
--

DROP TABLE IF EXISTS `page_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` bigint(20) DEFAULT NULL,
  `meta_title` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_A3D51B1D2C2AC5D3` (`translatable_id`),
  KEY `slug_pt_idx` (`slug`),
  CONSTRAINT `FK_A3D51B1D2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `page` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_translation`
--

LOCK TABLES `page_translation` WRITE;
/*!40000 ALTER TABLE `page_translation` DISABLE KEYS */;
INSERT INTO `page_translation` VALUES (13,7,'Who we are?','in progress','Who we are?','<p>We are Cocorico of course!</p>\n            <h3>What is it?</h3>\n            <p>Cocorico is an open source project dedicated to building a powerful (and free) solution for rental and service marketplaces.</p>\n            <h3>Who&rsquo;s paying for all of this?</h3>\n            <p><a href=\"http://www.sofracs.com\" target=\"_blank\" title=\"marketplace solution\">SOFRACS</a>&nbsp;is. They are a Paris based web agency specialised in building collaborative marketplaces for the rental and service industry. Over the years they decided to share their work by funding the development of Cocorico.</p>\n            <h3>What did you use to build Cocorico?</h3>\n            <p>Cocorico is based on Symfony 2.</p>\n            <h3>Where can I get it?</h3>\n            <p>Here: <a target=\"_blank\" href=\"https://github.com/Cocolabs-SAS/cocorico\">https://github.com/Cocolabs-SAS/cocorico</a></p>\n            <h3>Do you have a mascot?</h3>\n            <p>Here&rsquo;s a video of our cute hen &ldquo;Cocotte&rdquo;: <a href=\"http://cocorico.rocks/\">http://cocorico.rocks/</a></p>\n            ','en','who-we-are'),(14,7,'Qui sommes nous?','en cours','Qui sommes nous?','<p>Nous sommes Cocorico bien s&ucirc;r !</p>\n            <h3>Qu&#39;est-ce que c&#39;est?</h3>\n            <p>Cocorico est un projet open source d&eacute;di&eacute; &agrave; la r&eacute;alisation d&#39;une solution puissante (et gratuite) pour les places de march&eacute; collaboratives (ou pas &agrave; vrai dire).</p>\n            <h3>Qui finance tout &ccedil;a ?</h3>\n            <p>La <a href=\"http://www.sofracs.com\" title=\"création de marketplace\">SOFRACS</a>. C&rsquo;est une agence web bas&eacute;e &agrave; Paris sp&eacute;cialis&eacute;e dans la r&eacute;alisation de places de march&eacute; collaboratives de location, de services, et de vente. Au fil des ans, ils ont d&eacute;cid&eacute; de partager leurs connaissances en finan&ccedil;ant le d&eacute;veloppement de Cocorico.</p>\n            <h3>Qu&rsquo;utilisez-vous sur Cocorico ?</h3>\n            <p>Cocorico utilise Symfony 2.</p>\n            <h3>O&ugrave; puis-je l&rsquo;obtenir?</h3>\n            <p>Ici : <a target=\"_blank\" href=\"https://github.com/Cocolabs-SAS/cocorico\">https://github.com/Cocolabs-SAS/cocorico</a></p>\n            <h3>Avez-vous une mascotte ?</h3>\n            <p>Voici une vid&eacute;o de &quot;Cocotte&quot;&nbsp;: <a href=\"http://cocorico.rocks/\">http://cocorico.rocks/</a></p>','fr','qui-sommes-nous'),(15,8,'How it works?','in progress','How it works?','in progress','en','how-it-works'),(16,8,'Comment ca marche?','en cours','Comment ca marche?','en cours','fr','comment-ca-marche'),(17,9,'The team','in progress','The team','in progress','en','the-team'),(18,9,'L\'équipe','en cours','L\'équipe','en cours','fr','lequipe'),(19,10,'FAQ','in progress','FAQ','in progress','en','faq'),(20,10,'FAQ','en cours','FAQ','en cours','fr','faq'),(21,11,'Legal notices','in progress','Legal notices','in progress','en','legal-notices'),(22,11,'Mentions légales','en cours','Mentions légales','en cours','fr','mentions-legales'),(23,12,'Terms of use','in progress','Terms of use','in progress','en','terms-of-use'),(24,12,'Conditions générales d\'utilisation','en cours','Conditions générales d\'utilisation','en cours','fr','conditions-generales-dutilisation');
/*!40000 ALTER TABLE `page_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2A9791105E237E06` (`name`),
  KEY `value_idx` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter`
--

LOCK TABLES `parameter` WRITE;
/*!40000 ALTER TABLE `parameter` DISABLE KEYS */;
INSERT INTO `parameter` VALUES (4,'cocorico.fee_as_asker',NULL,'percent'),(5,'cocorico.fee_as_offerer',NULL,'percent'),(6,'cocorico.check_translation',NULL,'text');
/*!40000 ALTER TABLE `parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter_audit`
--

DROP TABLE IF EXISTS `parameter_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameter_audit` (
  `id` bigint(20) NOT NULL,
  `rev` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revtype` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`rev`),
  KEY `rev_18ff1bc70fa013efdfd97381695123b4_idx` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_audit`
--

LOCK TABLES `parameter_audit` WRITE;
/*!40000 ALTER TABLE `parameter_audit` DISABLE KEYS */;
INSERT INTO `parameter_audit` VALUES (1,1,'cocorico.fee_as_asker',NULL,'percent','INS'),(2,1,'cocorico.fee_as_offerer',NULL,'percent','INS'),(3,1,'cocorico.check_translation',NULL,'text','INS'),(4,2,'cocorico.fee_as_asker',NULL,'percent','INS'),(5,2,'cocorico.fee_as_offerer',NULL,'percent','INS'),(6,2,'cocorico.check_translation',NULL,'text','INS');
/*!40000 ALTER TABLE `parameter_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `review_by` int(11) NOT NULL,
  `review_to` int(11) NOT NULL,
  `rating` smallint(6) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_794381C63301C60` (`booking_id`),
  KEY `IDX_794381C6BEDC2389` (`review_by`),
  KEY `IDX_794381C65690230F` (`review_to`),
  KEY `created_at_r_idx` (`createdAt`),
  CONSTRAINT `FK_794381C63301C60` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_794381C65690230F` FOREIGN KEY (`review_to`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_794381C6BEDC2389` FOREIGN KEY (`review_by`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,'2021-09-03 06:54:21',''),(2,'2021-09-03 07:02:49','');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `person_type` smallint(6) NOT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_prefix` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `nationality` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_of_residence` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profession` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_owner_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_owner_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `annual_income` decimal(10,2) DEFAULT NULL,
  `phone_verified` tinyint(1) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `id_card_verified` tinyint(1) DEFAULT NULL,
  `nb_bookings_offerer` smallint(6) DEFAULT NULL,
  `nb_bookings_asker` smallint(6) DEFAULT NULL,
  `fee_as_asker` smallint(6) DEFAULT NULL,
  `fee_as_offerer` smallint(6) DEFAULT NULL,
  `average_rating_as_asker` smallint(6) DEFAULT NULL,
  `average_rating_as_offerer` smallint(6) DEFAULT NULL,
  `mother_tongue` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_delay` int(11) DEFAULT NULL,
  `time_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`),
  KEY `created_at_u_idx` (`createdAt`),
  KEY `slug_u_idx` (`slug`),
  KEY `enabled_idx` (`enabled`),
  KEY `email_idx` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (885572173,'offerer@cocorico.rocks','offerer@cocorico.rocks','offerer@cocorico.rocks','offerer@cocorico.rocks',1,'wX0on4h7f.5ulDqu0Vy82w5AArBN5fyY6zjPhzr4Zso','WS3bThXaM3Q9cGlw7f29SsdaIM5WjRAr3pTVwJAAY/i6EA3xaQ0FJdcuEhkLo69Q8N07J9m8pWBbKzlq+1s4XQ==',NULL,NULL,NULL,'a:0:{}',1,NULL,'OffererName','OffererFirstName','+33',NULL,'1973-05-29','FR','FR',NULL,NULL,NULL,NULL,NULL,1000.00,0,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'en',NULL,'Europe/Paris','2021-09-03 07:02:49','2021-09-03 07:02:49','offererfirstname'),(1090410042,'super-admin@cocorico.rocks','super-admin@cocorico.rocks','super-admin@cocorico.rocks','super-admin@cocorico.rocks',1,'b.AqKI6j61g9z9HXVcKnsg.VCUMychDE.By80zYunEU','mcgcuLnsFiqc+zNI/tWBpnOsrxyJUY8Frz3i+jjR0U6Ogz4BuWyV9whCujGosIwNYL6QCdSPqyqsPSR0RkA6lw==','2021-09-03 09:08:23',NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',1,NULL,'super-admin','super-admin','+33',NULL,'1978-07-01','FR','FR',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Europe/Paris','2021-09-03 07:02:49','2021-09-03 09:08:23','super-admin-1090410042'),(1619915390,'asker@cocorico.rocks','asker@cocorico.rocks','asker@cocorico.rocks','asker@cocorico.rocks',1,'fk1zrz.zNiIJ37awBPEHGokOgfy/tE/l6TO/5bRvveY','r6i4e3MpwUFY/b63C0mDouVk+G7dM+8izA/4rNcyJEbWdCzKI7rjzdbXG+GIP+f2f1SSPt7RkE9yj0of4j98TQ==',NULL,NULL,NULL,'a:0:{}',1,NULL,'AskerName','AskerFirstName','+33',NULL,'1975-08-27','FR','FR',NULL,NULL,NULL,NULL,NULL,1000.00,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'en',NULL,'Europe/Paris','2021-09-03 07:02:49','2021-09-03 07:02:49','askerfirstname'),(2140243193,'disableuser@cocorico.rocks','disableuser@cocorico.rocks','disableuser@cocorico.rocks','disableuser@cocorico.rocks',0,'Gr29bCJpX3NkOIOQHGhCnJy8shnkmGqWpOVC7lsE0uA','6rSMEykH85WswR87UL07shl4SpIHxv0aI5Gs0xtbbb8bRk7Z1YAodOQQXAUEwigtBbfc5Lbm2DOQWli1AwGi6A==',NULL,NULL,NULL,'a:0:{}',1,NULL,'DisableUserLastName','DisableUserFirstName','+33',NULL,'1978-08-27','FR','FR',NULL,NULL,NULL,NULL,NULL,1000.00,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'en',NULL,'Europe/Paris','2021-09-03 07:02:49','2021-09-03 07:02:49','disableuserfirstname');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '1',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5543718BA76ED395` (`user_id`),
  KEY `user_address_type_idx` (`type`),
  CONSTRAINT `FK_5543718BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_facebook`
--

DROP TABLE IF EXISTS `user_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_facebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `facebook_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hometown_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nb_friends` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF92CE0A76ED395` (`user_id`),
  KEY `facebook_id_idx` (`facebook_id`),
  CONSTRAINT `FK_8BF92CE0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_facebook`
--

LOCK TABLES `user_facebook` WRITE;
/*!40000 ALTER TABLE `user_facebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_8F02BF9DA76ED395` (`user_id`),
  KEY `IDX_8F02BF9DFE54D947` (`group_id`),
  CONSTRAINT `FK_8F02BF9DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8F02BF9DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_image`
--

DROP TABLE IF EXISTS `user_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_27FFFF07A76ED395` (`user_id`),
  KEY `position_u_idx` (`position`),
  CONSTRAINT `FK_27FFFF07A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_image`
--

LOCK TABLES `user_image` WRITE;
/*!40000 ALTER TABLE `user_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_language`
--

DROP TABLE IF EXISTS `user_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `code` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_345695B5A76ED395` (`user_id`),
  CONSTRAINT `FK_345695B5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_language`
--

LOCK TABLES `user_language` WRITE;
/*!40000 ALTER TABLE `user_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_translation`
--

DROP TABLE IF EXISTS `user_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translatable_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_translation_unique_translation` (`translatable_id`,`locale`),
  KEY `IDX_1D728CFA2C2AC5D3` (`translatable_id`),
  CONSTRAINT `FK_1D728CFA2C2AC5D3` FOREIGN KEY (`translatable_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_translation`
--

LOCK TABLES `user_translation` WRITE;
/*!40000 ALTER TABLE `user_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_translation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-03 11:17:38
