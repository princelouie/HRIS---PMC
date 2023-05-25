-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (x86_64)
--
-- Host: localhost    Database: db_hrm
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ac_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ac_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_company_id_foreign` (`company_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `accounts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,2,'Account 1','John Doe','123456789','123456789','California',160000.00,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'default','created','App\\Models\\Company\\Company',1,NULL,NULL,'{\"attributes\": {\"id\": 1, \"name\": \"Super Admin\", \"email\": \"superadmin@demo.com\", \"phone\": \"+8801910077628\", \"status_id\": 1, \"company_name\": \"Company1\", \"business_type\": \"Service\", \"total_employee\": 10, \"trade_licence_id\": null, \"trade_licence_number\": null}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,'default','created','App\\Models\\Company\\Company',2,NULL,NULL,'{\"attributes\": {\"id\": 2, \"name\": \"Admin\", \"email\": \"admin@onesttech.com\", \"phone\": \"+880177777777\", \"status_id\": 1, \"company_name\": \"Admin\", \"business_type\": \"Service\", \"total_employee\": 400, \"trade_licence_id\": null, \"trade_licence_number\": null}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(3,'default','created','App\\Models\\Hrm\\Shift\\Shift',1,NULL,NULL,'{\"attributes\": {\"id\": 1, \"title\": null, \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(4,'default','created','App\\Models\\Hrm\\Shift\\Shift',2,NULL,NULL,'{\"attributes\": {\"id\": 2, \"title\": null, \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(5,'default','created','App\\Models\\Hrm\\Shift\\Shift',3,NULL,NULL,'{\"attributes\": {\"id\": 3, \"title\": null, \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(6,'default','created','App\\Models\\Hrm\\Shift\\Shift',4,NULL,NULL,'{\"attributes\": {\"id\": 4, \"title\": null, \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(7,'default','created','App\\Models\\Hrm\\Shift\\Shift',5,NULL,NULL,'{\"attributes\": {\"id\": 5, \"title\": null, \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(8,'default','created','App\\Models\\Hrm\\Shift\\Shift',6,NULL,NULL,'{\"attributes\": {\"id\": 6, \"title\": null, \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(9,'default','created','App\\Models\\Hrm\\Designation\\Designation',1,NULL,NULL,'{\"attributes\": {\"id\": 1, \"title\": \"MD\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(10,'default','created','App\\Models\\Hrm\\Designation\\Designation',2,NULL,NULL,'{\"attributes\": {\"id\": 2, \"title\": \"CEO\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(11,'default','created','App\\Models\\Hrm\\Designation\\Designation',3,NULL,NULL,'{\"attributes\": {\"id\": 3, \"title\": \"CIO\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(12,'default','created','App\\Models\\Hrm\\Designation\\Designation',4,NULL,NULL,'{\"attributes\": {\"id\": 4, \"title\": \"HR Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(13,'default','created','App\\Models\\Hrm\\Designation\\Designation',5,NULL,NULL,'{\"attributes\": {\"id\": 5, \"title\": \"IT Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(14,'default','created','App\\Models\\Hrm\\Designation\\Designation',6,NULL,NULL,'{\"attributes\": {\"id\": 6, \"title\": \"Marketing Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(15,'default','created','App\\Models\\Hrm\\Designation\\Designation',7,NULL,NULL,'{\"attributes\": {\"id\": 7, \"title\": \"Sales Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(16,'default','created','App\\Models\\Hrm\\Designation\\Designation',8,NULL,NULL,'{\"attributes\": {\"id\": 8, \"title\": \"Accounts Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(17,'default','created','App\\Models\\Hrm\\Designation\\Designation',9,NULL,NULL,'{\"attributes\": {\"id\": 9, \"title\": \"Finance Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(18,'default','created','App\\Models\\Hrm\\Designation\\Designation',10,NULL,NULL,'{\"attributes\": {\"id\": 10, \"title\": \"Team Lead\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(19,'default','created','App\\Models\\Hrm\\Designation\\Designation',11,NULL,NULL,'{\"attributes\": {\"id\": 11, \"title\": \"Customer Service Executive (CSR)\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(20,'default','created','App\\Models\\Hrm\\Designation\\Designation',12,NULL,NULL,'{\"attributes\": {\"id\": 12, \"title\": \"Production Approval Analyst\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(21,'default','created','App\\Models\\Hrm\\Designation\\Designation',13,NULL,NULL,'{\"attributes\": {\"id\": 13, \"title\": \"Designer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(22,'default','created','App\\Models\\Hrm\\Designation\\Designation',14,NULL,NULL,'{\"attributes\": {\"id\": 14, \"title\": \"Project Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(23,'default','created','App\\Models\\Hrm\\Designation\\Designation',15,NULL,NULL,'{\"attributes\": {\"id\": 15, \"title\": \"Web Developer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(24,'default','created','App\\Models\\Hrm\\Designation\\Designation',16,NULL,NULL,'{\"attributes\": {\"id\": 16, \"title\": \"Sr. Web Developer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(25,'default','created','App\\Models\\Hrm\\Designation\\Designation',17,NULL,NULL,'{\"attributes\": {\"id\": 17, \"title\": \"Mobile Application Developer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(26,'default','created','App\\Models\\Hrm\\Designation\\Designation',18,NULL,NULL,'{\"attributes\": {\"id\": 18, \"title\": \"UI UX Designer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(27,'default','created','App\\Models\\Hrm\\Designation\\Designation',19,NULL,NULL,'{\"attributes\": {\"id\": 19, \"title\": \"Software Quality Assurance (SQA)\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(28,'default','created','App\\Models\\Hrm\\Designation\\Designation',20,NULL,NULL,'{\"attributes\": {\"id\": 20, \"title\": \"Inventory Control Executive\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(29,'default','created','App\\Models\\Hrm\\Designation\\Designation',21,NULL,NULL,'{\"attributes\": {\"id\": 21, \"title\": \"Business Operation Officer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(30,'default','created','App\\Models\\Hrm\\Designation\\Designation',22,NULL,NULL,'{\"attributes\": {\"id\": 22, \"title\": \"Social Communication Executive\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(31,'default','created','App\\Models\\Hrm\\Designation\\Designation',23,NULL,NULL,'{\"attributes\": {\"id\": 23, \"title\": \"Marketing Executive\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(32,'default','created','App\\Models\\Hrm\\Designation\\Designation',24,NULL,NULL,'{\"attributes\": {\"id\": 24, \"title\": \"Production Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(33,'default','created','App\\Models\\Hrm\\Designation\\Designation',25,NULL,NULL,'{\"attributes\": {\"id\": 25, \"title\": \"Digital Marketing Executive\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(34,'default','created','App\\Models\\Hrm\\Designation\\Designation',26,NULL,NULL,'{\"attributes\": {\"id\": 26, \"title\": \"Vendor Executive\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(35,'default','created','App\\Models\\Hrm\\Designation\\Designation',27,NULL,NULL,'{\"attributes\": {\"id\": 27, \"title\": \"Business Analyst\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(36,'default','created','App\\Models\\Hrm\\Designation\\Designation',28,NULL,NULL,'{\"attributes\": {\"id\": 28, \"title\": \"Content Writer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(37,'default','created','App\\Models\\Hrm\\Designation\\Designation',29,NULL,NULL,'{\"attributes\": {\"id\": 29, \"title\": \"PR & Media Branding Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(38,'default','created','App\\Models\\Hrm\\Designation\\Designation',30,NULL,NULL,'{\"attributes\": {\"id\": 30, \"title\": \"MD\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(39,'default','created','App\\Models\\Hrm\\Designation\\Designation',31,NULL,NULL,'{\"attributes\": {\"id\": 31, \"title\": \"CEO\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(40,'default','created','App\\Models\\Hrm\\Designation\\Designation',32,NULL,NULL,'{\"attributes\": {\"id\": 32, \"title\": \"CIO\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(41,'default','created','App\\Models\\Hrm\\Designation\\Designation',33,NULL,NULL,'{\"attributes\": {\"id\": 33, \"title\": \"HR Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(42,'default','created','App\\Models\\Hrm\\Designation\\Designation',34,NULL,NULL,'{\"attributes\": {\"id\": 34, \"title\": \"IT Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(43,'default','created','App\\Models\\Hrm\\Designation\\Designation',35,NULL,NULL,'{\"attributes\": {\"id\": 35, \"title\": \"Marketing Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(44,'default','created','App\\Models\\Hrm\\Designation\\Designation',36,NULL,NULL,'{\"attributes\": {\"id\": 36, \"title\": \"Sales Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(45,'default','created','App\\Models\\Hrm\\Designation\\Designation',37,NULL,NULL,'{\"attributes\": {\"id\": 37, \"title\": \"Accounts Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(46,'default','created','App\\Models\\Hrm\\Designation\\Designation',38,NULL,NULL,'{\"attributes\": {\"id\": 38, \"title\": \"Finance Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(47,'default','created','App\\Models\\Hrm\\Designation\\Designation',39,NULL,NULL,'{\"attributes\": {\"id\": 39, \"title\": \"Team Lead\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(48,'default','created','App\\Models\\Hrm\\Designation\\Designation',40,NULL,NULL,'{\"attributes\": {\"id\": 40, \"title\": \"Customer Service Executive (CSR)\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(49,'default','created','App\\Models\\Hrm\\Designation\\Designation',41,NULL,NULL,'{\"attributes\": {\"id\": 41, \"title\": \"Production Approval Analyst\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(50,'default','created','App\\Models\\Hrm\\Designation\\Designation',42,NULL,NULL,'{\"attributes\": {\"id\": 42, \"title\": \"Designer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(51,'default','created','App\\Models\\Hrm\\Designation\\Designation',43,NULL,NULL,'{\"attributes\": {\"id\": 43, \"title\": \"Project Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(52,'default','created','App\\Models\\Hrm\\Designation\\Designation',44,NULL,NULL,'{\"attributes\": {\"id\": 44, \"title\": \"Web Developer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(53,'default','created','App\\Models\\Hrm\\Designation\\Designation',45,NULL,NULL,'{\"attributes\": {\"id\": 45, \"title\": \"Sr. Web Developer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(54,'default','created','App\\Models\\Hrm\\Designation\\Designation',46,NULL,NULL,'{\"attributes\": {\"id\": 46, \"title\": \"Mobile Application Developer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(55,'default','created','App\\Models\\Hrm\\Designation\\Designation',47,NULL,NULL,'{\"attributes\": {\"id\": 47, \"title\": \"UI UX Designer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(56,'default','created','App\\Models\\Hrm\\Designation\\Designation',48,NULL,NULL,'{\"attributes\": {\"id\": 48, \"title\": \"Software Quality Assurance (SQA)\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(57,'default','created','App\\Models\\Hrm\\Designation\\Designation',49,NULL,NULL,'{\"attributes\": {\"id\": 49, \"title\": \"Inventory Control Executive\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(58,'default','created','App\\Models\\Hrm\\Designation\\Designation',50,NULL,NULL,'{\"attributes\": {\"id\": 50, \"title\": \"Business Operation Officer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(59,'default','created','App\\Models\\Hrm\\Designation\\Designation',51,NULL,NULL,'{\"attributes\": {\"id\": 51, \"title\": \"Social Communication Executive\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(60,'default','created','App\\Models\\Hrm\\Designation\\Designation',52,NULL,NULL,'{\"attributes\": {\"id\": 52, \"title\": \"Marketing Executive\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(61,'default','created','App\\Models\\Hrm\\Designation\\Designation',53,NULL,NULL,'{\"attributes\": {\"id\": 53, \"title\": \"Production Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(62,'default','created','App\\Models\\Hrm\\Designation\\Designation',54,NULL,NULL,'{\"attributes\": {\"id\": 54, \"title\": \"Digital Marketing Executive\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(63,'default','created','App\\Models\\Hrm\\Designation\\Designation',55,NULL,NULL,'{\"attributes\": {\"id\": 55, \"title\": \"Vendor Executive\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(64,'default','created','App\\Models\\Hrm\\Designation\\Designation',56,NULL,NULL,'{\"attributes\": {\"id\": 56, \"title\": \"Business Analyst\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(65,'default','created','App\\Models\\Hrm\\Designation\\Designation',57,NULL,NULL,'{\"attributes\": {\"id\": 57, \"title\": \"Content Writer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(66,'default','created','App\\Models\\Hrm\\Designation\\Designation',58,NULL,NULL,'{\"attributes\": {\"id\": 58, \"title\": \"PR & Media Branding Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(67,'default','created','App\\Models\\Hrm\\Department\\Department',1,NULL,NULL,'{\"attributes\": {\"id\": 1, \"title\": \"Management\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(68,'default','created','App\\Models\\Hrm\\Department\\Department',2,NULL,NULL,'{\"attributes\": {\"id\": 2, \"title\": \"HR\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(69,'default','created','App\\Models\\Hrm\\Department\\Department',3,NULL,NULL,'{\"attributes\": {\"id\": 3, \"title\": \"IT\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(70,'default','created','App\\Models\\Hrm\\Department\\Department',4,NULL,NULL,'{\"attributes\": {\"id\": 4, \"title\": \"Marketing\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(71,'default','created','App\\Models\\Hrm\\Department\\Department',5,NULL,NULL,'{\"attributes\": {\"id\": 5, \"title\": \"Sales\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(72,'default','created','App\\Models\\Hrm\\Department\\Department',6,NULL,NULL,'{\"attributes\": {\"id\": 6, \"title\": \"Accounts\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(73,'default','created','App\\Models\\Hrm\\Department\\Department',7,NULL,NULL,'{\"attributes\": {\"id\": 7, \"title\": \"Finance\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(74,'default','created','App\\Models\\Hrm\\Department\\Department',8,NULL,NULL,'{\"attributes\": {\"id\": 8, \"title\": \"Admin\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(75,'default','created','App\\Models\\Hrm\\Department\\Department',9,NULL,NULL,'{\"attributes\": {\"id\": 9, \"title\": \"Customer Service\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(76,'default','created','App\\Models\\Hrm\\Department\\Department',10,NULL,NULL,'{\"attributes\": {\"id\": 10, \"title\": \"Approval\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(77,'default','created','App\\Models\\Hrm\\Department\\Department',11,NULL,NULL,'{\"attributes\": {\"id\": 11, \"title\": \"Graphics & Arts\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(78,'default','created','App\\Models\\Hrm\\Department\\Department',12,NULL,NULL,'{\"attributes\": {\"id\": 12, \"title\": \"Inverntory\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(79,'default','created','App\\Models\\Hrm\\Department\\Department',13,NULL,NULL,'{\"attributes\": {\"id\": 13, \"title\": \"Business\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(80,'default','created','App\\Models\\Hrm\\Department\\Department',14,NULL,NULL,'{\"attributes\": {\"id\": 14, \"title\": \"Content Writer\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(81,'default','created','App\\Models\\Hrm\\Department\\Department',15,NULL,NULL,'{\"attributes\": {\"id\": 15, \"title\": \"Manager\", \"status_id\": 1, \"company_id\": 1}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(82,'default','created','App\\Models\\Hrm\\Department\\Department',16,NULL,NULL,'{\"attributes\": {\"id\": 16, \"title\": \"Management\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(83,'default','created','App\\Models\\Hrm\\Department\\Department',17,NULL,NULL,'{\"attributes\": {\"id\": 17, \"title\": \"HR\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(84,'default','created','App\\Models\\Hrm\\Department\\Department',18,NULL,NULL,'{\"attributes\": {\"id\": 18, \"title\": \"IT\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(85,'default','created','App\\Models\\Hrm\\Department\\Department',19,NULL,NULL,'{\"attributes\": {\"id\": 19, \"title\": \"Marketing\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(86,'default','created','App\\Models\\Hrm\\Department\\Department',20,NULL,NULL,'{\"attributes\": {\"id\": 20, \"title\": \"Sales\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(87,'default','created','App\\Models\\Hrm\\Department\\Department',21,NULL,NULL,'{\"attributes\": {\"id\": 21, \"title\": \"Accounts\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(88,'default','created','App\\Models\\Hrm\\Department\\Department',22,NULL,NULL,'{\"attributes\": {\"id\": 22, \"title\": \"Finance\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(89,'default','created','App\\Models\\Hrm\\Department\\Department',23,NULL,NULL,'{\"attributes\": {\"id\": 23, \"title\": \"Admin\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(90,'default','created','App\\Models\\Hrm\\Department\\Department',24,NULL,NULL,'{\"attributes\": {\"id\": 24, \"title\": \"Customer Service\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(91,'default','created','App\\Models\\Hrm\\Department\\Department',25,NULL,NULL,'{\"attributes\": {\"id\": 25, \"title\": \"Approval\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(92,'default','created','App\\Models\\Hrm\\Department\\Department',26,NULL,NULL,'{\"attributes\": {\"id\": 26, \"title\": \"Graphics & Arts\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(93,'default','created','App\\Models\\Hrm\\Department\\Department',27,NULL,NULL,'{\"attributes\": {\"id\": 27, \"title\": \"Inverntory\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(94,'default','created','App\\Models\\Hrm\\Department\\Department',28,NULL,NULL,'{\"attributes\": {\"id\": 28, \"title\": \"Business\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(95,'default','created','App\\Models\\Hrm\\Department\\Department',29,NULL,NULL,'{\"attributes\": {\"id\": 29, \"title\": \"Content Writer\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(96,'default','created','App\\Models\\Hrm\\Department\\Department',30,NULL,NULL,'{\"attributes\": {\"id\": 30, \"title\": \"Manager\", \"status_id\": 1, \"company_id\": 2}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(97,'default','created','App\\Models\\Role\\Role',1,NULL,NULL,'{\"attributes\": {\"name\": \"Superadmin\", \"slug\": \"superadmin\", \"status_id\": 1, \"company_id\": 1, \"permissions\": [\"company_read\", \"company_create\", \"company_update\", \"company_delete\", \"user_banned\", \"user_unbanned\", \"general_settings_read\", \"general_settings_update\", \"email_settings_read\", \"email_settings_update\", \"storage_settings_update\", \"user_read\", \"user_edit\", \"user_update\", \"content_update\", \"subscriptions_read\"]}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(98,'default','created','App\\Models\\Role\\Role',2,NULL,NULL,'{\"attributes\": {\"name\": \"Admin\", \"slug\": \"admin\", \"status_id\": 1, \"company_id\": 1, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"hr_menu\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_store\", \"leave_request_update\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"generate_qr_code\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"location_create\", \"location_store\", \"location_edit\", \"location_update\", \"location_delete\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"project_menu\", \"project_create\", \"project_store\", \"project_edit\", \"project_update\", \"project_delete\", \"project_view\", \"project_list\", \"project_activity_view\", \"project_member_view\", \"project_member_delete\", \"project_complete\", \"project_payment\", \"project_invoice_view\", \"project_discussion_create\", \"project_discussion_store\", \"project_discussion_edit\", \"project_discussion_update\", \"project_discussion_delete\", \"project_discussion_view\", \"project_discussion_list\", \"project_discussion_comment\", \"project_discussion_reply\", \"project_file_create\", \"project_file_store\", \"project_file_edit\", \"project_file_update\", \"project_file_delete\", \"project_file_view\", \"project_file_list\", \"project_file_download\", \"project_file_comment\", \"project_file_reply\", \"project_notes_create\", \"project_notes_store\", \"project_notes_edit\", \"project_notes_update\", \"project_notes_delete\", \"project_notes_list\", \"client_menu\", \"client_create\", \"client_store\", \"client_edit\", \"client_update\", \"client_delete\", \"client_view\", \"client_list\", \"task_menu\", \"task_create\", \"task_store\", \"task_edit\", \"task_update\", \"task_delete\", \"task_view\", \"task_list\", \"task_activity_view\", \"task_assign_view\", \"task_assign_delete\", \"task_complete\", \"task_discussion_create\", \"task_discussion_store\", \"task_discussion_edit\", \"task_discussion_update\", \"task_discussion_delete\", \"task_discussion_view\", \"task_discussion_list\", \"task_discussion_comment\", \"task_discussion_reply\", \"task_file_create\", \"task_file_store\", \"task_file_edit\", \"task_file_update\", \"task_file_delete\", \"task_file_view\", \"task_file_list\", \"task_file_download\", \"task_file_comment\", \"task_file_reply\", \"task_notes_create\", \"task_notes_store\", \"task_notes_edit\", \"task_notes_update\", \"task_notes_delete\", \"task_notes_list\", \"task_files_comment\", \"award_type_menu\", \"award_type_create\", \"award_type_store\", \"award_type_edit\", \"award_type_update\", \"award_type_delete\", \"award_type_view\", \"award_type_list\", \"award_menu\", \"award_create\", \"award_store\", \"award_edit\", \"award_update\", \"award_delete\", \"award_list\", \"travel_type_menu\", \"travel_type_create\", \"travel_type_store\", \"travel_type_edit\", \"travel_type_update\", \"travel_type_delete\", \"travel_type_view\", \"travel_type_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_approve\", \"travel_payment\", \"performance_menu\", \"performance_settings\", \"performance_indicator_menu\", \"performance_indicator_list\", \"performance_indicator_create\", \"performance_indicator_store\", \"performance_indicator_edit\", \"performance_indicator_update\", \"performance_indicator_delete\", \"performance_appraisal_menu\", \"performance_appraisal_create\", \"performance_appraisal_store\", \"performance_appraisal_edit\", \"performance_appraisal_update\", \"performance_appraisal_delete\", \"performance_appraisal_list\", \"performance_appraisal_view\", \"performance_goal_type_menu\", \"performance_goal_type_create\", \"performance_goal_type_store\", \"performance_goal_type_edit\", \"performance_goal_type_update\", \"performance_goal_type_delete\", \"performance_goal_type_list\", \"performance_goal_menu\", \"performance_goal_create\", \"performance_goal_store\", \"performance_goal_edit\", \"performance_goal_update\", \"performance_goal_delete\", \"performance_goal_view\", \"performance_goal_list\", \"performance_competence_type_list\", \"performance_competence_type_menu\", \"performance_competence_type_create\", \"performance_competence_type_store\", \"performance_competence_type_edit\", \"performance_competence_type_update\", \"performance_competence_type_delete\", \"performance_competence_type_view\", \"performance_competence_menu\", \"performance_competence_create\", \"performance_competence_store\", \"performance_competence_edit\", \"performance_competence_update\", \"performance_competence_delete\", \"performance_competence_view\", \"performance_competence_list\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"]}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(99,'default','created','App\\Models\\Role\\Role',3,NULL,NULL,'{\"attributes\": {\"name\": \"Hr\", \"slug\": \"hr\", \"status_id\": 1, \"company_id\": 1, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_view\", \"travel_approve\", \"travel_invoice\", \"travel_pay\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"]}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(100,'default','created','App\\Models\\Role\\Role',4,NULL,NULL,'{\"attributes\": {\"name\": \"Staff\", \"slug\": \"staff\", \"status_id\": 1, \"company_id\": 1, \"permissions\": [\"dashboard\", \"profile_view\", \"attendance_menu\", \"user_update\", \"attendance_read\", \"attendance_create\", \"leave_request_read\", \"leave_request_create\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"]}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(101,'default','created','App\\Models\\Role\\Role',5,NULL,NULL,'{\"attributes\": {\"name\": \"Admin\", \"slug\": \"admin\", \"status_id\": 1, \"company_id\": 2, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"hr_menu\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_store\", \"leave_request_update\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"generate_qr_code\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"location_create\", \"location_store\", \"location_edit\", \"location_update\", \"location_delete\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"project_menu\", \"project_create\", \"project_store\", \"project_edit\", \"project_update\", \"project_delete\", \"project_view\", \"project_list\", \"project_activity_view\", \"project_member_view\", \"project_member_delete\", \"project_complete\", \"project_payment\", \"project_invoice_view\", \"project_discussion_create\", \"project_discussion_store\", \"project_discussion_edit\", \"project_discussion_update\", \"project_discussion_delete\", \"project_discussion_view\", \"project_discussion_list\", \"project_discussion_comment\", \"project_discussion_reply\", \"project_file_create\", \"project_file_store\", \"project_file_edit\", \"project_file_update\", \"project_file_delete\", \"project_file_view\", \"project_file_list\", \"project_file_download\", \"project_file_comment\", \"project_file_reply\", \"project_notes_create\", \"project_notes_store\", \"project_notes_edit\", \"project_notes_update\", \"project_notes_delete\", \"project_notes_list\", \"client_menu\", \"client_create\", \"client_store\", \"client_edit\", \"client_update\", \"client_delete\", \"client_view\", \"client_list\", \"task_menu\", \"task_create\", \"task_store\", \"task_edit\", \"task_update\", \"task_delete\", \"task_view\", \"task_list\", \"task_activity_view\", \"task_assign_view\", \"task_assign_delete\", \"task_complete\", \"task_discussion_create\", \"task_discussion_store\", \"task_discussion_edit\", \"task_discussion_update\", \"task_discussion_delete\", \"task_discussion_view\", \"task_discussion_list\", \"task_discussion_comment\", \"task_discussion_reply\", \"task_file_create\", \"task_file_store\", \"task_file_edit\", \"task_file_update\", \"task_file_delete\", \"task_file_view\", \"task_file_list\", \"task_file_download\", \"task_file_comment\", \"task_file_reply\", \"task_notes_create\", \"task_notes_store\", \"task_notes_edit\", \"task_notes_update\", \"task_notes_delete\", \"task_notes_list\", \"task_files_comment\", \"award_type_menu\", \"award_type_create\", \"award_type_store\", \"award_type_edit\", \"award_type_update\", \"award_type_delete\", \"award_type_view\", \"award_type_list\", \"award_menu\", \"award_create\", \"award_store\", \"award_edit\", \"award_update\", \"award_delete\", \"award_list\", \"travel_type_menu\", \"travel_type_create\", \"travel_type_store\", \"travel_type_edit\", \"travel_type_update\", \"travel_type_delete\", \"travel_type_view\", \"travel_type_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_approve\", \"travel_payment\", \"performance_menu\", \"performance_settings\", \"performance_indicator_menu\", \"performance_indicator_list\", \"performance_indicator_create\", \"performance_indicator_store\", \"performance_indicator_edit\", \"performance_indicator_update\", \"performance_indicator_delete\", \"performance_appraisal_menu\", \"performance_appraisal_create\", \"performance_appraisal_store\", \"performance_appraisal_edit\", \"performance_appraisal_update\", \"performance_appraisal_delete\", \"performance_appraisal_list\", \"performance_appraisal_view\", \"performance_goal_type_menu\", \"performance_goal_type_create\", \"performance_goal_type_store\", \"performance_goal_type_edit\", \"performance_goal_type_update\", \"performance_goal_type_delete\", \"performance_goal_type_list\", \"performance_goal_menu\", \"performance_goal_create\", \"performance_goal_store\", \"performance_goal_edit\", \"performance_goal_update\", \"performance_goal_delete\", \"performance_goal_view\", \"performance_goal_list\", \"performance_competence_type_list\", \"performance_competence_type_menu\", \"performance_competence_type_create\", \"performance_competence_type_store\", \"performance_competence_type_edit\", \"performance_competence_type_update\", \"performance_competence_type_delete\", \"performance_competence_type_view\", \"performance_competence_menu\", \"performance_competence_create\", \"performance_competence_store\", \"performance_competence_edit\", \"performance_competence_update\", \"performance_competence_delete\", \"performance_competence_view\", \"performance_competence_list\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"]}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(102,'default','created','App\\Models\\Role\\Role',6,NULL,NULL,'{\"attributes\": {\"name\": \"Hr\", \"slug\": \"hr\", \"status_id\": 1, \"company_id\": 2, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_view\", \"travel_approve\", \"travel_invoice\", \"travel_pay\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"]}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(103,'default','created','App\\Models\\Role\\Role',7,NULL,NULL,'{\"attributes\": {\"name\": \"Staff\", \"slug\": \"staff\", \"status_id\": 1, \"company_id\": 2, \"permissions\": [\"dashboard\", \"profile_view\", \"attendance_menu\", \"user_update\", \"attendance_read\", \"attendance_create\", \"leave_request_read\", \"leave_request_create\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"]}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(104,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',1,NULL,NULL,'{\"attributes\": {\"name\": \"saturday\", \"status_id\": 1, \"company_id\": 1, \"is_weekend\": \"yes\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(105,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',2,NULL,NULL,'{\"attributes\": {\"name\": \"sunday\", \"status_id\": 1, \"company_id\": 1, \"is_weekend\": \"yes\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(106,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',3,NULL,NULL,'{\"attributes\": {\"name\": \"monday\", \"status_id\": 1, \"company_id\": 1, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(107,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',4,NULL,NULL,'{\"attributes\": {\"name\": \"tuesday\", \"status_id\": 1, \"company_id\": 1, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(108,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',5,NULL,NULL,'{\"attributes\": {\"name\": \"wednesday\", \"status_id\": 1, \"company_id\": 1, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(109,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',6,NULL,NULL,'{\"attributes\": {\"name\": \"thursday\", \"status_id\": 1, \"company_id\": 1, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(110,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',7,NULL,NULL,'{\"attributes\": {\"name\": \"friday\", \"status_id\": 1, \"company_id\": 1, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(111,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',8,NULL,NULL,'{\"attributes\": {\"name\": \"saturday\", \"status_id\": 1, \"company_id\": 2, \"is_weekend\": \"yes\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(112,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',9,NULL,NULL,'{\"attributes\": {\"name\": \"sunday\", \"status_id\": 1, \"company_id\": 2, \"is_weekend\": \"yes\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(113,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',10,NULL,NULL,'{\"attributes\": {\"name\": \"monday\", \"status_id\": 1, \"company_id\": 2, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(114,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',11,NULL,NULL,'{\"attributes\": {\"name\": \"tuesday\", \"status_id\": 1, \"company_id\": 2, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(115,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',12,NULL,NULL,'{\"attributes\": {\"name\": \"wednesday\", \"status_id\": 1, \"company_id\": 2, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(116,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',13,NULL,NULL,'{\"attributes\": {\"name\": \"thursday\", \"status_id\": 1, \"company_id\": 2, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(117,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',14,NULL,NULL,'{\"attributes\": {\"name\": \"friday\", \"status_id\": 1, \"company_id\": 2, \"is_weekend\": \"no\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(118,'default','created','App\\Models\\Hrm\\Attendance\\DutySchedule',1,NULL,NULL,'{\"attributes\": {\"hour\": 8, \"end_time\": \"17:00:00\", \"shift_id\": 4, \"status_id\": 1, \"company_id\": 2, \"start_time\": \"09:00:00\", \"consider_time\": \"15\"}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(119,'default','created','App\\Models\\User',1,NULL,NULL,'{\"attributes\": {\"tin\": null, \"name\": \"Super Admin\", \"email\": \"superadmin@demo.com\", \"grade\": null, \"phone\": \"+8801910077628\", \"gender\": null, \"address\": null, \"role_id\": 1, \"password\": \"$2y$10$7qFuDMTq/evOYGzjfTl9Veur6dS6.G9mUpRgxKz86QI89nsd8ek/.\", \"religion\": \"Islam\", \"avatar_id\": null, \"bank_name\": null, \"social_id\": null, \"status_id\": 1, \"birth_date\": null, \"company_id\": 1, \"manager_id\": null, \"blood_group\": null, \"employee_id\": null, \"nationality\": null, \"nid_card_id\": null, \"permissions\": [\"company_read\", \"company_create\", \"company_update\", \"company_delete\", \"user_banned\", \"user_unbanned\", \"general_settings_read\", \"general_settings_update\", \"email_settings_read\", \"email_settings_update\", \"storage_settings_update\", \"user_read\", \"user_edit\", \"user_update\", \"content_update\", \"subscriptions_read\"], \"social_type\": null, \"bank_account\": null, \"basic_salary\": 0, \"device_token\": null, \"joining_date\": null, \"login_access\": 1, \"department_id\": 1, \"employee_type\": \"On Probation\", \"facebook_link\": null, \"last_login_at\": null, \"last_login_ip\": null, \"linkedin_link\": null, \"designation_id\": 1, \"emergency_name\": null, \"instagram_link\": null, \"last_logout_at\": null, \"marital_status\": \"Unmarried\", \"password_hints\": null, \"remember_token\": \"g7qQvsSHeu\", \"nid_card_number\": null, \"passport_number\": null, \"passport_file_id\": null, \"email_verified_at\": \"2022-09-10T03:33:32.000000Z\", \"is_email_verified\": \"verified\", \"is_phone_verified\": \"verified\", \"phone_verified_at\": null, \"verification_code\": null, \"email_verify_token\": \"iQvDSuJlQx\", \"phone_verify_token\": null, \"emergency_mobile_number\": null, \"emergency_mobile_relationship\": null}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(120,'default','created','App\\Models\\User',2,NULL,NULL,'{\"attributes\": {\"tin\": null, \"name\": \"Admin\", \"email\": \"admin@onesttech.com\", \"grade\": null, \"phone\": \"+880177777777\", \"gender\": null, \"address\": null, \"role_id\": 5, \"password\": \"$2y$10$/3vwm/l17SjVk68guuqZDeUzFQRpesdXs8Dj07m75K8/Z8qhFPjji\", \"religion\": \"Islam\", \"avatar_id\": null, \"bank_name\": null, \"social_id\": null, \"status_id\": 1, \"birth_date\": null, \"company_id\": 2, \"manager_id\": null, \"blood_group\": null, \"employee_id\": null, \"nationality\": null, \"nid_card_id\": null, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"hr_menu\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_store\", \"leave_request_update\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"generate_qr_code\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"location_create\", \"location_store\", \"location_edit\", \"location_update\", \"location_delete\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"project_menu\", \"project_create\", \"project_store\", \"project_edit\", \"project_update\", \"project_delete\", \"project_view\", \"project_list\", \"project_activity_view\", \"project_member_view\", \"project_member_delete\", \"project_complete\", \"project_payment\", \"project_invoice_view\", \"project_discussion_create\", \"project_discussion_store\", \"project_discussion_edit\", \"project_discussion_update\", \"project_discussion_delete\", \"project_discussion_view\", \"project_discussion_list\", \"project_discussion_comment\", \"project_discussion_reply\", \"project_file_create\", \"project_file_store\", \"project_file_edit\", \"project_file_update\", \"project_file_delete\", \"project_file_view\", \"project_file_list\", \"project_file_download\", \"project_file_comment\", \"project_file_reply\", \"project_notes_create\", \"project_notes_store\", \"project_notes_edit\", \"project_notes_update\", \"project_notes_delete\", \"project_notes_list\", \"client_menu\", \"client_create\", \"client_store\", \"client_edit\", \"client_update\", \"client_delete\", \"client_view\", \"client_list\", \"task_menu\", \"task_create\", \"task_store\", \"task_edit\", \"task_update\", \"task_delete\", \"task_view\", \"task_list\", \"task_activity_view\", \"task_assign_view\", \"task_assign_delete\", \"task_complete\", \"task_discussion_create\", \"task_discussion_store\", \"task_discussion_edit\", \"task_discussion_update\", \"task_discussion_delete\", \"task_discussion_view\", \"task_discussion_list\", \"task_discussion_comment\", \"task_discussion_reply\", \"task_file_create\", \"task_file_store\", \"task_file_edit\", \"task_file_update\", \"task_file_delete\", \"task_file_view\", \"task_file_list\", \"task_file_download\", \"task_file_comment\", \"task_file_reply\", \"task_notes_create\", \"task_notes_store\", \"task_notes_edit\", \"task_notes_update\", \"task_notes_delete\", \"task_notes_list\", \"task_files_comment\", \"award_type_menu\", \"award_type_create\", \"award_type_store\", \"award_type_edit\", \"award_type_update\", \"award_type_delete\", \"award_type_view\", \"award_type_list\", \"award_menu\", \"award_create\", \"award_store\", \"award_edit\", \"award_update\", \"award_delete\", \"award_list\", \"travel_type_menu\", \"travel_type_create\", \"travel_type_store\", \"travel_type_edit\", \"travel_type_update\", \"travel_type_delete\", \"travel_type_view\", \"travel_type_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_approve\", \"travel_payment\", \"performance_menu\", \"performance_settings\", \"performance_indicator_menu\", \"performance_indicator_list\", \"performance_indicator_create\", \"performance_indicator_store\", \"performance_indicator_edit\", \"performance_indicator_update\", \"performance_indicator_delete\", \"performance_appraisal_menu\", \"performance_appraisal_create\", \"performance_appraisal_store\", \"performance_appraisal_edit\", \"performance_appraisal_update\", \"performance_appraisal_delete\", \"performance_appraisal_list\", \"performance_appraisal_view\", \"performance_goal_type_menu\", \"performance_goal_type_create\", \"performance_goal_type_store\", \"performance_goal_type_edit\", \"performance_goal_type_update\", \"performance_goal_type_delete\", \"performance_goal_type_list\", \"performance_goal_menu\", \"performance_goal_create\", \"performance_goal_store\", \"performance_goal_edit\", \"performance_goal_update\", \"performance_goal_delete\", \"performance_goal_view\", \"performance_goal_list\", \"performance_competence_type_list\", \"performance_competence_type_menu\", \"performance_competence_type_create\", \"performance_competence_type_store\", \"performance_competence_type_edit\", \"performance_competence_type_update\", \"performance_competence_type_delete\", \"performance_competence_type_view\", \"performance_competence_menu\", \"performance_competence_create\", \"performance_competence_store\", \"performance_competence_edit\", \"performance_competence_update\", \"performance_competence_delete\", \"performance_competence_view\", \"performance_competence_list\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"], \"social_type\": null, \"bank_account\": null, \"basic_salary\": 0, \"device_token\": null, \"joining_date\": null, \"login_access\": 1, \"department_id\": 16, \"employee_type\": \"On Probation\", \"facebook_link\": null, \"last_login_at\": null, \"last_login_ip\": null, \"linkedin_link\": null, \"designation_id\": 30, \"emergency_name\": null, \"instagram_link\": null, \"last_logout_at\": null, \"marital_status\": \"Unmarried\", \"password_hints\": null, \"remember_token\": \"JIQBvOepGB\", \"nid_card_number\": null, \"passport_number\": null, \"passport_file_id\": null, \"email_verified_at\": \"2022-09-10T03:33:32.000000Z\", \"is_email_verified\": \"verified\", \"is_phone_verified\": \"verified\", \"phone_verified_at\": null, \"verification_code\": null, \"email_verify_token\": \"0zNBgi5ZZt\", \"phone_verify_token\": null, \"emergency_mobile_number\": null, \"emergency_mobile_relationship\": null}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(121,'default','created','App\\Models\\User',3,NULL,NULL,'{\"attributes\": {\"tin\": null, \"name\": \"Hr Manager\", \"email\": \"hr@onesttech.com\", \"grade\": null, \"phone\": \"+88014555887\", \"gender\": null, \"address\": null, \"role_id\": 3, \"password\": \"$2y$10$RbZoX6KR6SlgkMBpIx2z7.gtQWi1/k4HUkdVXeraWBEdC5E3cW5t.\", \"religion\": \"Islam\", \"avatar_id\": null, \"bank_name\": null, \"social_id\": null, \"status_id\": 1, \"birth_date\": null, \"company_id\": 2, \"manager_id\": null, \"blood_group\": null, \"employee_id\": null, \"nationality\": null, \"nid_card_id\": null, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_view\", \"travel_approve\", \"travel_invoice\", \"travel_pay\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"], \"social_type\": null, \"bank_account\": null, \"basic_salary\": 0, \"device_token\": null, \"joining_date\": null, \"login_access\": 1, \"department_id\": 17, \"employee_type\": \"On Probation\", \"facebook_link\": null, \"last_login_at\": null, \"last_login_ip\": null, \"linkedin_link\": null, \"designation_id\": 33, \"emergency_name\": null, \"instagram_link\": null, \"last_logout_at\": null, \"marital_status\": \"Unmarried\", \"password_hints\": null, \"remember_token\": \"rJXhC4n6Oi\", \"nid_card_number\": null, \"passport_number\": null, \"passport_file_id\": null, \"email_verified_at\": \"2022-09-10T03:33:32.000000Z\", \"is_email_verified\": \"verified\", \"is_phone_verified\": \"verified\", \"phone_verified_at\": null, \"verification_code\": null, \"email_verify_token\": \"feSz7uG4OF\", \"phone_verify_token\": null, \"emergency_mobile_number\": null, \"emergency_mobile_relationship\": null}}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(122,'default','created','App\\Models\\User',4,NULL,NULL,'{\"attributes\": {\"tin\": null, \"name\": \"Staff\", \"email\": \"staff@onesttech.com\", \"grade\": null, \"phone\": \"+8855412547\", \"gender\": null, \"address\": null, \"role_id\": 7, \"password\": \"$2y$10$1XmQytDKd6rRf6hvpwR4huuNhvBLf43qQb6PeP08WUztkBaHU8dva\", \"religion\": \"Islam\", \"avatar_id\": null, \"bank_name\": null, \"social_id\": null, \"status_id\": 1, \"birth_date\": null, \"company_id\": 2, \"manager_id\": null, \"blood_group\": null, \"employee_id\": null, \"nationality\": null, \"nid_card_id\": null, \"permissions\": [\"dashboard\", \"profile_view\", \"attendance_menu\", \"user_update\", \"attendance_read\", \"attendance_create\", \"leave_request_read\", \"leave_request_create\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"], \"social_type\": null, \"bank_account\": null, \"basic_salary\": 0, \"device_token\": null, \"joining_date\": null, \"login_access\": 1, \"department_id\": 18, \"employee_type\": \"On Probation\", \"facebook_link\": null, \"last_login_at\": null, \"last_login_ip\": null, \"linkedin_link\": null, \"designation_id\": 44, \"emergency_name\": null, \"instagram_link\": null, \"last_logout_at\": null, \"marital_status\": \"Unmarried\", \"password_hints\": null, \"remember_token\": \"bPdrURl8cE\", \"nid_card_number\": null, \"passport_number\": null, \"passport_file_id\": null, \"email_verified_at\": \"2022-09-10T03:33:33.000000Z\", \"is_email_verified\": \"verified\", \"is_phone_verified\": \"verified\", \"phone_verified_at\": null, \"verification_code\": null, \"email_verify_token\": \"fH13Mbyg5b\", \"phone_verify_token\": null, \"emergency_mobile_number\": null, \"emergency_mobile_relationship\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(123,'default','created','App\\Models\\coreApp\\Setting\\Setting',1,NULL,NULL,'{\"attributes\": {\"name\": \"company_name\", \"value\": \"HRM\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(124,'default','created','App\\Models\\coreApp\\Setting\\Setting',2,NULL,NULL,'{\"attributes\": {\"name\": \"company_logo_backend\", \"value\": \"public/uploads/settings/logo/logo_white.png\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(125,'default','created','App\\Models\\coreApp\\Setting\\Setting',3,NULL,NULL,'{\"attributes\": {\"name\": \"company_logo_frontend\", \"value\": \"public/uploads/settings/logo/logo_black.png\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(126,'default','created','App\\Models\\coreApp\\Setting\\Setting',4,NULL,NULL,'{\"attributes\": {\"name\": \"company_icon\", \"value\": \"public/uploads/settings/logo/favicon.png\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(127,'default','created','App\\Models\\coreApp\\Setting\\Setting',5,NULL,NULL,'{\"attributes\": {\"name\": \"android_url\", \"value\": \"https://play.google.com/store/apps/details?id=com.worx24hour.hrm\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(128,'default','created','App\\Models\\coreApp\\Setting\\Setting',6,NULL,NULL,'{\"attributes\": {\"name\": \"ios_url\", \"value\": \"https://apps.apple.com/us/app/24hourworx/id1620313188\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(129,'default','created','App\\Models\\coreApp\\Setting\\Setting',7,NULL,NULL,'{\"attributes\": {\"name\": \"language\", \"value\": \"en\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(130,'default','created','App\\Models\\coreApp\\Setting\\Setting',8,NULL,NULL,'{\"attributes\": {\"name\": \"emailSettingsProvider\", \"value\": \"smtp\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(131,'default','created','App\\Models\\coreApp\\Setting\\Setting',9,NULL,NULL,'{\"attributes\": {\"name\": \"emailSettings_from_name\", \"value\": \"hrm@onest.com\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(132,'default','created','App\\Models\\coreApp\\Setting\\Setting',10,NULL,NULL,'{\"attributes\": {\"name\": \"emailSettings_from_email\", \"value\": \"hrm@onest.com\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(133,'default','created','App\\Models\\coreApp\\Setting\\Setting',11,NULL,NULL,'{\"attributes\": {\"name\": \"site_under_maintenance\", \"value\": \"0\", \"context\": \"app\", \"company_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(134,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',1,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(135,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',2,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 2}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(136,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',3,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 3}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(137,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',4,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 4}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(138,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',5,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 5}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(139,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',6,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 6}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(140,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',7,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 7}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(141,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',8,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 8}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(142,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',9,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 9}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(143,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',10,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 10}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(144,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',11,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 11}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(145,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',12,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 12}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(146,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',13,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 13}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(147,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',14,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 14}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(148,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',15,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 1, \"status_id\": 1, \"company_id\": 1, \"department_id\": 15}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(149,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',16,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(150,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',17,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 2}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(151,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',18,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 3}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(152,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',19,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 4}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(153,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',20,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 5}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(154,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',21,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 6}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(155,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',22,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 7}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(156,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',23,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 8}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(157,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',24,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 9}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(158,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',25,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 10}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(159,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',26,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 11}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(160,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',27,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 12}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(161,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',28,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 13}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(162,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',29,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 14}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(163,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',30,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 2, \"status_id\": 1, \"company_id\": 1, \"department_id\": 15}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(164,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',31,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(165,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',32,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 2}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(166,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',33,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 3}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(167,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',34,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 4}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(168,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',35,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 5}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(169,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',36,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 6}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(170,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',37,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 7}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(171,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',38,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 8}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(172,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',39,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 9}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(173,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',40,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 10}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(174,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',41,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 11}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(175,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',42,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 12}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(176,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',43,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 13}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(177,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',44,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 14}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(178,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',45,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 3, \"status_id\": 1, \"company_id\": 1, \"department_id\": 15}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(179,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',46,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(180,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',47,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 2}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(181,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',48,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 3}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(182,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',49,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 4}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(183,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',50,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 5}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(184,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',51,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 6}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(185,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',52,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 7}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(186,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',53,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 8}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(187,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',54,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 9}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(188,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',55,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 10}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(189,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',56,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 11}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(190,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',57,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 12}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(191,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',58,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 13}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(192,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',59,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 14}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(193,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',60,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 4, \"status_id\": 1, \"company_id\": 1, \"department_id\": 15}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(194,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',61,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 1}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(195,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',62,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 2}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(196,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',63,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 3}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(197,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',64,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 4}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(198,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',65,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 5}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(199,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',66,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 6}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(200,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',67,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 7}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(201,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',68,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 8}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(202,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',69,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 9}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(203,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',70,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 10}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(204,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',71,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 11}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(205,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',72,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 12}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(206,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',73,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 13}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(207,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',74,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 14}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(208,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',75,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 5, \"status_id\": 1, \"company_id\": 1, \"department_id\": 15}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(209,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',76,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 16}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(210,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',77,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 17}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(211,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',78,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 18}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(212,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',79,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 19}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(213,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',80,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 20}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(214,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',81,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 21}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(215,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',82,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 22}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(216,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',83,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 23}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(217,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',84,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 24}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(218,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',85,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 25}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(219,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',86,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 26}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(220,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',87,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 27}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(221,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',88,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 28}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(222,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',89,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 29}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(223,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',90,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 6, \"status_id\": 1, \"company_id\": 2, \"department_id\": 30}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(224,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',91,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 16}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(225,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',92,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 17}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(226,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',93,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 18}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(227,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',94,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 19}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(228,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',95,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 20}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(229,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',96,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 21}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(230,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',97,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 22}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(231,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',98,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 23}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(232,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',99,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 24}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(233,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',100,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 25}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(234,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',101,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 26}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(235,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',102,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 27}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(236,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',103,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 28}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(237,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',104,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 29}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(238,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',105,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 7, \"status_id\": 1, \"company_id\": 2, \"department_id\": 30}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(239,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',106,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 16}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(240,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',107,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 17}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(241,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',108,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 18}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(242,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',109,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 19}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(243,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',110,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 20}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(244,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',111,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 21}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(245,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',112,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 22}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(246,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',113,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 23}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(247,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',114,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 24}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(248,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',115,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 25}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(249,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',116,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 26}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(250,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',117,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 27}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(251,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',118,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 28}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(252,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',119,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 29}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(253,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',120,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 8, \"status_id\": 1, \"company_id\": 2, \"department_id\": 30}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(254,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',121,NULL,NULL,'{\"attributes\": {\"days\": 14, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 16}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(255,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',122,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 17}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(256,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',123,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 18}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(257,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',124,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 19}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(258,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',125,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 20}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(259,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',126,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 21}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(260,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',127,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 22}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(261,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',128,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 23}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(262,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',129,NULL,NULL,'{\"attributes\": {\"days\": 11, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 24}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(263,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',130,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 25}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(264,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',131,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 26}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(265,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',132,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 27}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(266,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',133,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 28}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(267,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',134,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 29}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(268,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',135,NULL,NULL,'{\"attributes\": {\"days\": 15, \"type_id\": 9, \"status_id\": 1, \"company_id\": 2, \"department_id\": 30}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(269,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',136,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 16}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(270,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',137,NULL,NULL,'{\"attributes\": {\"days\": 19, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 17}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(271,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',138,NULL,NULL,'{\"attributes\": {\"days\": 20, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 18}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(272,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',139,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 19}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(273,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',140,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 20}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(274,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',141,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 21}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(275,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',142,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 22}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(276,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',143,NULL,NULL,'{\"attributes\": {\"days\": 10, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 23}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(277,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',144,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 24}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(278,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',145,NULL,NULL,'{\"attributes\": {\"days\": 12, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 25}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(279,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',146,NULL,NULL,'{\"attributes\": {\"days\": 18, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 26}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(280,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',147,NULL,NULL,'{\"attributes\": {\"days\": 13, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 27}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(281,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',148,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 28}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(282,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',149,NULL,NULL,'{\"attributes\": {\"days\": 16, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 29}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(283,'default','created','App\\Models\\Hrm\\Leave\\AssignLeave',150,NULL,NULL,'{\"attributes\": {\"days\": 17, \"type_id\": 10, \"status_id\": 1, \"company_id\": 2, \"department_id\": 30}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(284,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',1,NULL,NULL,'{\"attributes\": {\"title\": \"New Year\", \"end_date\": \"2022-01-01\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-01-01\", \"description\": \"\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(285,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',2,NULL,NULL,'{\"attributes\": {\"title\": \"Martin Luther King Jr Day\", \"end_date\": \"2022-01-17\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-01-17\", \"description\": \"3rd Monday in January\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(286,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',3,NULL,NULL,'{\"attributes\": {\"title\": \"Washington\'s Birthday\", \"end_date\": \"2022-02-21\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-02-21\", \"description\": \"3rd Monday in February\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(287,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',4,NULL,NULL,'{\"attributes\": {\"title\": \"Memorial Day\", \"end_date\": \"2022-05-26\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-05-26\", \"description\": \"Last Monday in May\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(288,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',5,NULL,NULL,'{\"attributes\": {\"title\": \"Independence Day\", \"end_date\": \"2022-07-04\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-07-04\", \"description\": \"\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(289,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',6,NULL,NULL,'{\"attributes\": {\"title\": \"Labor Day\", \"end_date\": \"2022-09-01\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-09-01\", \"description\": \"1st Monday in September\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(290,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',7,NULL,NULL,'{\"attributes\": {\"title\": \"Columbus Day\", \"end_date\": \"2022-10-13\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-10-13\", \"description\": \"2nd Monday in October\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(291,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',8,NULL,NULL,'{\"attributes\": {\"title\": \"Veterans Day\", \"end_date\": \"2022-11-11\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-11-11\", \"description\": \"11th November\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(292,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',9,NULL,NULL,'{\"attributes\": {\"title\": \"Thanksgiving Day\", \"end_date\": \"2022-11-24\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-11-24\", \"description\": \"4th Thursday in November\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(293,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',10,NULL,NULL,'{\"attributes\": {\"title\": \"Christmas Day\", \"end_date\": \"2022-12-25\", \"status_id\": 1, \"company_id\": 1, \"start_date\": \"2022-12-25\", \"description\": \"\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(294,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',11,NULL,NULL,'{\"attributes\": {\"title\": \"New Year\", \"end_date\": \"2022-01-01\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-01-01\", \"description\": \"\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(295,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',12,NULL,NULL,'{\"attributes\": {\"title\": \"Martin Luther King Jr Day\", \"end_date\": \"2022-01-17\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-01-17\", \"description\": \"3rd Monday in January\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(296,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',13,NULL,NULL,'{\"attributes\": {\"title\": \"Washington\'s Birthday\", \"end_date\": \"2022-02-21\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-02-21\", \"description\": \"3rd Monday in February\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(297,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',14,NULL,NULL,'{\"attributes\": {\"title\": \"Memorial Day\", \"end_date\": \"2022-05-26\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-05-26\", \"description\": \"Last Monday in May\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(298,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',15,NULL,NULL,'{\"attributes\": {\"title\": \"Independence Day\", \"end_date\": \"2022-07-04\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-07-04\", \"description\": \"\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(299,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',16,NULL,NULL,'{\"attributes\": {\"title\": \"Labor Day\", \"end_date\": \"2022-09-01\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-09-01\", \"description\": \"1st Monday in September\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(300,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',17,NULL,NULL,'{\"attributes\": {\"title\": \"Columbus Day\", \"end_date\": \"2022-10-13\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-10-13\", \"description\": \"2nd Monday in October\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(301,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',18,NULL,NULL,'{\"attributes\": {\"title\": \"Veterans Day\", \"end_date\": \"2022-11-11\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-11-11\", \"description\": \"11th November\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(302,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',19,NULL,NULL,'{\"attributes\": {\"title\": \"Thanksgiving Day\", \"end_date\": \"2022-11-24\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-11-24\", \"description\": \"4th Thursday in November\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(303,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',20,NULL,NULL,'{\"attributes\": {\"title\": \"Christmas Day\", \"end_date\": \"2022-12-25\", \"status_id\": 1, \"company_id\": 2, \"start_date\": \"2022-12-25\", \"description\": \"\", \"attachment_id\": null}}','2022-09-10 03:33:33','2022-09-10 03:33:33'),(304,'default','updated','App\\Models\\User',2,'App\\Models\\User',2,'{\"old\": {\"tin\": null, \"name\": \"Admin\", \"email\": \"admin@onesttech.com\", \"grade\": null, \"phone\": \"+880177777777\", \"gender\": null, \"address\": null, \"role_id\": 5, \"password\": \"$2y$10$/3vwm/l17SjVk68guuqZDeUzFQRpesdXs8Dj07m75K8/Z8qhFPjji\", \"religion\": \"Islam\", \"avatar_id\": null, \"bank_name\": null, \"social_id\": null, \"status_id\": 1, \"birth_date\": null, \"company_id\": 2, \"manager_id\": null, \"blood_group\": null, \"employee_id\": null, \"nationality\": null, \"nid_card_id\": null, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"hr_menu\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_store\", \"leave_request_update\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"generate_qr_code\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"location_create\", \"location_store\", \"location_edit\", \"location_update\", \"location_delete\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"project_menu\", \"project_create\", \"project_store\", \"project_edit\", \"project_update\", \"project_delete\", \"project_view\", \"project_list\", \"project_activity_view\", \"project_member_view\", \"project_member_delete\", \"project_complete\", \"project_payment\", \"project_invoice_view\", \"project_discussion_create\", \"project_discussion_store\", \"project_discussion_edit\", \"project_discussion_update\", \"project_discussion_delete\", \"project_discussion_view\", \"project_discussion_list\", \"project_discussion_comment\", \"project_discussion_reply\", \"project_file_create\", \"project_file_store\", \"project_file_edit\", \"project_file_update\", \"project_file_delete\", \"project_file_view\", \"project_file_list\", \"project_file_download\", \"project_file_comment\", \"project_file_reply\", \"project_notes_create\", \"project_notes_store\", \"project_notes_edit\", \"project_notes_update\", \"project_notes_delete\", \"project_notes_list\", \"client_menu\", \"client_create\", \"client_store\", \"client_edit\", \"client_update\", \"client_delete\", \"client_view\", \"client_list\", \"task_menu\", \"task_create\", \"task_store\", \"task_edit\", \"task_update\", \"task_delete\", \"task_view\", \"task_list\", \"task_activity_view\", \"task_assign_view\", \"task_assign_delete\", \"task_complete\", \"task_discussion_create\", \"task_discussion_store\", \"task_discussion_edit\", \"task_discussion_update\", \"task_discussion_delete\", \"task_discussion_view\", \"task_discussion_list\", \"task_discussion_comment\", \"task_discussion_reply\", \"task_file_create\", \"task_file_store\", \"task_file_edit\", \"task_file_update\", \"task_file_delete\", \"task_file_view\", \"task_file_list\", \"task_file_download\", \"task_file_comment\", \"task_file_reply\", \"task_notes_create\", \"task_notes_store\", \"task_notes_edit\", \"task_notes_update\", \"task_notes_delete\", \"task_notes_list\", \"task_files_comment\", \"award_type_menu\", \"award_type_create\", \"award_type_store\", \"award_type_edit\", \"award_type_update\", \"award_type_delete\", \"award_type_view\", \"award_type_list\", \"award_menu\", \"award_create\", \"award_store\", \"award_edit\", \"award_update\", \"award_delete\", \"award_list\", \"travel_type_menu\", \"travel_type_create\", \"travel_type_store\", \"travel_type_edit\", \"travel_type_update\", \"travel_type_delete\", \"travel_type_view\", \"travel_type_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_approve\", \"travel_payment\", \"performance_menu\", \"performance_settings\", \"performance_indicator_menu\", \"performance_indicator_list\", \"performance_indicator_create\", \"performance_indicator_store\", \"performance_indicator_edit\", \"performance_indicator_update\", \"performance_indicator_delete\", \"performance_appraisal_menu\", \"performance_appraisal_create\", \"performance_appraisal_store\", \"performance_appraisal_edit\", \"performance_appraisal_update\", \"performance_appraisal_delete\", \"performance_appraisal_list\", \"performance_appraisal_view\", \"performance_goal_type_menu\", \"performance_goal_type_create\", \"performance_goal_type_store\", \"performance_goal_type_edit\", \"performance_goal_type_update\", \"performance_goal_type_delete\", \"performance_goal_type_list\", \"performance_goal_menu\", \"performance_goal_create\", \"performance_goal_store\", \"performance_goal_edit\", \"performance_goal_update\", \"performance_goal_delete\", \"performance_goal_view\", \"performance_goal_list\", \"performance_competence_type_list\", \"performance_competence_type_menu\", \"performance_competence_type_create\", \"performance_competence_type_store\", \"performance_competence_type_edit\", \"performance_competence_type_update\", \"performance_competence_type_delete\", \"performance_competence_type_view\", \"performance_competence_menu\", \"performance_competence_create\", \"performance_competence_store\", \"performance_competence_edit\", \"performance_competence_update\", \"performance_competence_delete\", \"performance_competence_view\", \"performance_competence_list\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"], \"social_type\": null, \"bank_account\": null, \"basic_salary\": 0, \"device_token\": null, \"joining_date\": null, \"login_access\": 1, \"department_id\": 16, \"employee_type\": \"On Probation\", \"facebook_link\": null, \"last_login_at\": null, \"last_login_ip\": null, \"linkedin_link\": null, \"designation_id\": 30, \"emergency_name\": null, \"instagram_link\": null, \"last_logout_at\": null, \"marital_status\": \"Unmarried\", \"password_hints\": null, \"remember_token\": \"JIQBvOepGB\", \"nid_card_number\": null, \"passport_number\": null, \"passport_file_id\": null, \"email_verified_at\": \"2022-09-10T03:33:32.000000Z\", \"is_email_verified\": \"verified\", \"is_phone_verified\": \"verified\", \"phone_verified_at\": null, \"verification_code\": null, \"email_verify_token\": \"0zNBgi5ZZt\", \"phone_verify_token\": null, \"emergency_mobile_number\": null, \"emergency_mobile_relationship\": null}, \"attributes\": {\"tin\": null, \"name\": \"Admin\", \"email\": \"admin@onesttech.com\", \"grade\": null, \"phone\": \"+880177777777\", \"gender\": null, \"address\": null, \"role_id\": 5, \"password\": \"$2y$10$/3vwm/l17SjVk68guuqZDeUzFQRpesdXs8Dj07m75K8/Z8qhFPjji\", \"religion\": \"Islam\", \"avatar_id\": null, \"bank_name\": null, \"social_id\": null, \"status_id\": 1, \"birth_date\": null, \"company_id\": 2, \"manager_id\": null, \"blood_group\": null, \"employee_id\": null, \"nationality\": null, \"nid_card_id\": null, \"permissions\": [\"team_menu\", \"team_list\", \"team_create\", \"team_update\", \"team_edit\", \"team_delete\", \"team_member_view\", \"team_member_create\", \"team_member_edit\", \"team_member_delete\", \"team_member_assign\", \"team_member_unassign\", \"dashboard\", \"hr_menu\", \"designation_read\", \"designation_create\", \"designation_update\", \"designation_delete\", \"shift_read\", \"shift_create\", \"shift_update\", \"shift_delete\", \"department_read\", \"department_create\", \"department_update\", \"department_delete\", \"user_menu\", \"user_read\", \"profile_view\", \"user_create\", \"user_edit\", \"user_update\", \"user_delete\", \"user_banned\", \"user_unbanned\", \"make_hr\", \"role_read\", \"role_create\", \"role_update\", \"role_delete\", \"leave_menu\", \"leave_type_read\", \"leave_type_create\", \"leave_type_update\", \"leave_type_delete\", \"leave_assign_read\", \"leave_assign_create\", \"leave_assign_update\", \"leave_assign_delete\", \"leave_request_read\", \"leave_request_create\", \"leave_request_store\", \"leave_request_update\", \"leave_request_approve\", \"leave_request_reject\", \"leave_request_delete\", \"appointment_read\", \"appointment_create\", \"appointment_approve\", \"appointment_reject\", \"appointment_delete\", \"weekend_read\", \"weekend_update\", \"attendance_update\", \"holiday_read\", \"holiday_create\", \"holiday_update\", \"holiday_delete\", \"schedule_read\", \"schedule_create\", \"schedule_update\", \"schedule_delete\", \"attendance_menu\", \"attendance_read\", \"attendance_create\", \"attendance_update\", \"attendance_delete\", \"generate_qr_code\", \"leave_settings_read\", \"leave_settings_update\", \"company_settings_read\", \"company_settings_update\", \"locationApi\", \"company_setup_menu\", \"company_setup_activation\", \"company_setup_configuration\", \"company_setup_ip_whitelist\", \"company_setup_location\", \"location_create\", \"location_store\", \"location_edit\", \"location_update\", \"location_delete\", \"ip_read\", \"ip_create\", \"ip_update\", \"ip_delete\", \"attendance_report_read\", \"live_tracking_read\", \"report_menu\", \"report\", \"claim_read\", \"claim_create\", \"claim_update\", \"claim_delete\", \"payment_read\", \"payment_create\", \"payment_update\", \"payment_delete\", \"visit_menu\", \"visit_read\", \"visit_view\", \"visit_update\", \"payroll_menu\", \"list_payroll_item\", \"create_payroll_item\", \"store_payroll_item\", \"update_payroll_item\", \"delete_payroll_item\", \"view_payroll_item\", \"payroll_item_menu\", \"list_payroll_set\", \"create_payroll_set\", \"store_payroll_set\", \"update_payroll_set\", \"delete_payroll_set\", \"view_payroll_set\", \"edit_payroll_set\", \"payroll_set_menu\", \"advance_salaries_menu\", \"advance_salaries_create\", \"advance_salaries_store\", \"advance_salaries_edit\", \"advance_salaries_update\", \"advance_salaries_delete\", \"advance_salaries_view\", \"advance_salaries_approve\", \"advance_salaries_list\", \"advance_salaries_pay\", \"advance_salaries_invoice\", \"advance_salaries_search\", \"payslip_menu\", \"salary_generate\", \"salary_view\", \"salary_delete\", \"salary_edit\", \"salary_update\", \"salary_payment\", \"payslip_list\", \"advance_type_menu\", \"advance_type_create\", \"advance_type_store\", \"advance_type_edit\", \"advance_type_update\", \"advance_type_delete\", \"advance_type_view\", \"advance_type_list\", \"salary_menu\", \"salary_store\", \"salary_edit\", \"salary_update\", \"salary_delete\", \"salary_view\", \"salary_list\", \"salary_search\", \"salary_pay\", \"salary_invoice\", \"salary_approve\", \"salary_generate\", \"salary_calculate\", \"account_menu\", \"account_create\", \"account_store\", \"account_edit\", \"account_update\", \"account_delete\", \"account_view\", \"account_list\", \"account_search\", \"deposit_menu\", \"deposit_create\", \"deposit_store\", \"deposit_edit\", \"deposit_update\", \"deposit_delete\", \"deposit_list\", \"expense_menu\", \"expense_create\", \"expense_store\", \"expense_edit\", \"expense_update\", \"expense_delete\", \"expense_list\", \"expense_view\", \"expense_approve\", \"expense_invoice\", \"expense_pay\", \"transaction_menu\", \"transaction_create\", \"transaction_store\", \"transaction_edit\", \"transaction_update\", \"transaction_delete\", \"transaction_view\", \"transaction_list\", \"deposit_category_menu\", \"deposit_category_create\", \"deposit_category_store\", \"deposit_category_edit\", \"deposit_category_update\", \"deposit_category_delete\", \"deposit_category_list\", \"payment_method_menu\", \"payment_method_create\", \"payment_method_store\", \"payment_method_edit\", \"payment_method_update\", \"payment_method_delete\", \"payment_method_list\", \"project_menu\", \"project_create\", \"project_store\", \"project_edit\", \"project_update\", \"project_delete\", \"project_view\", \"project_list\", \"project_activity_view\", \"project_member_view\", \"project_member_delete\", \"project_complete\", \"project_payment\", \"project_invoice_view\", \"project_discussion_create\", \"project_discussion_store\", \"project_discussion_edit\", \"project_discussion_update\", \"project_discussion_delete\", \"project_discussion_view\", \"project_discussion_list\", \"project_discussion_comment\", \"project_discussion_reply\", \"project_file_create\", \"project_file_store\", \"project_file_edit\", \"project_file_update\", \"project_file_delete\", \"project_file_view\", \"project_file_list\", \"project_file_download\", \"project_file_comment\", \"project_file_reply\", \"project_notes_create\", \"project_notes_store\", \"project_notes_edit\", \"project_notes_update\", \"project_notes_delete\", \"project_notes_list\", \"client_menu\", \"client_create\", \"client_store\", \"client_edit\", \"client_update\", \"client_delete\", \"client_view\", \"client_list\", \"task_menu\", \"task_create\", \"task_store\", \"task_edit\", \"task_update\", \"task_delete\", \"task_view\", \"task_list\", \"task_activity_view\", \"task_assign_view\", \"task_assign_delete\", \"task_complete\", \"task_discussion_create\", \"task_discussion_store\", \"task_discussion_edit\", \"task_discussion_update\", \"task_discussion_delete\", \"task_discussion_view\", \"task_discussion_list\", \"task_discussion_comment\", \"task_discussion_reply\", \"task_file_create\", \"task_file_store\", \"task_file_edit\", \"task_file_update\", \"task_file_delete\", \"task_file_view\", \"task_file_list\", \"task_file_download\", \"task_file_comment\", \"task_file_reply\", \"task_notes_create\", \"task_notes_store\", \"task_notes_edit\", \"task_notes_update\", \"task_notes_delete\", \"task_notes_list\", \"task_files_comment\", \"award_type_menu\", \"award_type_create\", \"award_type_store\", \"award_type_edit\", \"award_type_update\", \"award_type_delete\", \"award_type_view\", \"award_type_list\", \"award_menu\", \"award_create\", \"award_store\", \"award_edit\", \"award_update\", \"award_delete\", \"award_list\", \"travel_type_menu\", \"travel_type_create\", \"travel_type_store\", \"travel_type_edit\", \"travel_type_update\", \"travel_type_delete\", \"travel_type_view\", \"travel_type_list\", \"travel_menu\", \"travel_create\", \"travel_store\", \"travel_edit\", \"travel_update\", \"travel_delete\", \"travel_list\", \"travel_approve\", \"travel_payment\", \"performance_menu\", \"performance_settings\", \"performance_indicator_menu\", \"performance_indicator_list\", \"performance_indicator_create\", \"performance_indicator_store\", \"performance_indicator_edit\", \"performance_indicator_update\", \"performance_indicator_delete\", \"performance_appraisal_menu\", \"performance_appraisal_create\", \"performance_appraisal_store\", \"performance_appraisal_edit\", \"performance_appraisal_update\", \"performance_appraisal_delete\", \"performance_appraisal_list\", \"performance_appraisal_view\", \"performance_goal_type_menu\", \"performance_goal_type_create\", \"performance_goal_type_store\", \"performance_goal_type_edit\", \"performance_goal_type_update\", \"performance_goal_type_delete\", \"performance_goal_type_list\", \"performance_goal_menu\", \"performance_goal_create\", \"performance_goal_store\", \"performance_goal_edit\", \"performance_goal_update\", \"performance_goal_delete\", \"performance_goal_view\", \"performance_goal_list\", \"performance_competence_type_list\", \"performance_competence_type_menu\", \"performance_competence_type_create\", \"performance_competence_type_store\", \"performance_competence_type_edit\", \"performance_competence_type_update\", \"performance_competence_type_delete\", \"performance_competence_type_view\", \"performance_competence_menu\", \"performance_competence_create\", \"performance_competence_store\", \"performance_competence_edit\", \"performance_competence_update\", \"performance_competence_delete\", \"performance_competence_view\", \"performance_competence_list\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"announcement_menu\", \"notice_menu\", \"notice_list\", \"notice_create\", \"notice_update\", \"notice_edit\", \"notice_delete\", \"send_sms_menu\", \"send_sms_list\", \"send_sms_create\", \"send_sms_update\", \"send_sms_edit\", \"send_sms_delete\", \"send_email_menu\", \"send_email_list\", \"send_email_create\", \"send_email_update\", \"send_email_edit\", \"send_email_delete\", \"send_notification_menu\", \"send_notification_list\", \"send_notification_create\", \"send_notification_update\", \"send_notification_edit\", \"send_notification_delete\", \"support_menu\", \"support_read\", \"support_create\", \"support_reply\", \"support_delete\"], \"social_type\": null, \"bank_account\": null, \"basic_salary\": 0, \"device_token\": null, \"joining_date\": null, \"login_access\": 1, \"department_id\": 16, \"employee_type\": \"On Probation\", \"facebook_link\": null, \"last_login_at\": null, \"last_login_ip\": null, \"linkedin_link\": null, \"designation_id\": 30, \"emergency_name\": null, \"instagram_link\": null, \"last_logout_at\": null, \"marital_status\": \"Unmarried\", \"password_hints\": null, \"remember_token\": \"RxGujqknEPfSexwlIjYA9BCsZ5IOPVVSy35prfVVgldfPldAp8WNabBUtEfR\", \"nid_card_number\": null, \"passport_number\": null, \"passport_file_id\": null, \"email_verified_at\": \"2022-09-10T03:33:32.000000Z\", \"is_email_verified\": \"verified\", \"is_phone_verified\": \"verified\", \"phone_verified_at\": null, \"verification_code\": null, \"email_verify_token\": \"0zNBgi5ZZt\", \"phone_verify_token\": null, \"emergency_mobile_number\": null, \"emergency_mobile_relationship\": null}}','2022-09-24 06:00:25','2022-09-24 06:00:25');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_salaries`
--

DROP TABLE IF EXISTS `advance_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `advance_type_id` bigint unsigned NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `company_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `request_amount` double(16,2) NOT NULL DEFAULT '0.00',
  `paid_amount` double(16,2) NOT NULL DEFAULT '0.00',
  `due_amount` double(16,2) NOT NULL DEFAULT '0.00',
  `recovery_mode` tinyint NOT NULL DEFAULT '1' COMMENT '1=Installment, 2=One Time',
  `recovery_cycle` tinyint NOT NULL DEFAULT '1' COMMENT '1=Monthly, 2=Yearly',
  `installment_amount` double(16,2) NOT NULL DEFAULT '0.00',
  `recover_from` date NOT NULL,
  `pay` bigint unsigned NOT NULL DEFAULT '9',
  `status_id` bigint unsigned NOT NULL DEFAULT '2',
  `approver_id` bigint unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `return_status` bigint unsigned NOT NULL DEFAULT '22',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advance_salaries_company_id_foreign` (`company_id`),
  KEY `advance_salaries_id_amount_date_index` (`id`,`amount`,`date`),
  KEY `advance_type_id` (`advance_type_id`),
  KEY `user_id` (`user_id`),
  KEY `pay` (`pay`),
  KEY `status_id` (`status_id`),
  KEY `approver_id` (`approver_id`),
  KEY `return_status` (`return_status`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `advance_salaries_advance_type_id_foreign` FOREIGN KEY (`advance_type_id`) REFERENCES `advance_types` (`id`),
  CONSTRAINT `advance_salaries_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salaries_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `advance_salaries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salaries_pay_foreign` FOREIGN KEY (`pay`) REFERENCES `statuses` (`id`),
  CONSTRAINT `advance_salaries_return_status_foreign` FOREIGN KEY (`return_status`) REFERENCES `statuses` (`id`),
  CONSTRAINT `advance_salaries_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `advance_salaries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salaries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salaries`
--

LOCK TABLES `advance_salaries` WRITE;
/*!40000 ALTER TABLE `advance_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_salary_logs`
--

DROP TABLE IF EXISTS `advance_salary_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_salary_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `is_pay` tinyint NOT NULL DEFAULT '0' COMMENT '0=Company Pay, 1= Staff Pay',
  `advance_salary_id` bigint unsigned NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advance_salary_logs_id_amount_index` (`id`,`amount`),
  KEY `advance_salary_id` (`advance_salary_id`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `advance_salary_logs_advance_salary_id_foreign` FOREIGN KEY (`advance_salary_id`) REFERENCES `advance_salaries` (`id`),
  CONSTRAINT `advance_salary_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salary_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salary_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salary_logs`
--

LOCK TABLES `advance_salary_logs` WRITE;
/*!40000 ALTER TABLE `advance_salary_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_salary_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_types`
--

DROP TABLE IF EXISTS `advance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advance_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advance_types_company_id_foreign` (`company_id`),
  KEY `advance_types_id_index` (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `advance_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `advance_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_types`
--

LOCK TABLES `advance_types` WRITE;
/*!40000 ALTER TABLE `advance_types` DISABLE KEYS */;
INSERT INTO `advance_types` VALUES (1,'Salary Advance',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Loan',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `advance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_contents`
--

DROP TABLE IF EXISTS `all_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_contents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `all_contents_title_unique` (`title`),
  UNIQUE KEY `all_contents_slug_unique` (`slug`),
  KEY `all_contents_company_id_foreign` (`company_id`),
  KEY `all_contents_user_id_foreign` (`user_id`),
  KEY `all_contents_created_by_foreign` (`created_by`),
  KEY `all_contents_updated_by_foreign` (`updated_by`),
  KEY `all_contents_type_title_slug_index` (`type`,`title`,`slug`),
  CONSTRAINT `all_contents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `all_contents_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `all_contents_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `all_contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_contents`
--

LOCK TABLES `all_contents` WRITE;
/*!40000 ALTER TABLE `all_contents` DISABLE KEYS */;
INSERT INTO `all_contents` VALUES (1,1,1,'page','About Us','about-us','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id.</p>','About Us','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id.','about, us, about us','',1,1,'2022-03-22 00:39:40','2022-03-22 00:39:40'),(2,1,1,'page','Contact Us','contact-us','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id.</p>','Contact Us','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id.','contact, us, contact us','',1,1,'2022-03-22 00:39:40','2022-03-22 00:39:40'),(3,1,1,'page','Introduction','privacy-policy','<p>This 24HOURX Privacy Policy includes how we collect, use, disclose, transfer, and store your personal data for the activities mentioned-below, including your visit to 24HOURX website that links to this page, your attendance to our marketing and learning events both online and offline, and for our business account management. Your choices and rights related to your personal data are extensively described here.</p>\r\n\r\n<p>We are very expressive towards our firm commitment to help our users comprehend what information we collect about them and what may happen to that information through this Privacy Policy.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>Privacy Policy</strong></span></p>\r\n\r\n<p>Your privacy is valuable and 24HOURX values it. In this Privacy Policy, we describe the information that we collect about you when you visit our website, 24hourx (the &quot;Website&quot;) and use the services available on the Website (&quot;Services&quot;), and how we use and disclose that information.</p>\r\n\r\n<p>If you have any questions or comments about the Privacy Policy, please contact us at info@24hourx. This Policy is incorporated into and is subject to the 24HOURX Terms of Use, which can be accessed at 24hourx /terms-and-condition. Your use of the Website and/or Services and any personal information you provide on the Website remains subject to the terms of the Policy and 24HOURX &#39;s Terms of Use.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>A.</strong> </span><span style=\"font-size:22pt\"><strong>TYPE OF INFORMATION WE COLLECT</strong></span><a name=\"_GoBack\"></a></p>\r\n\r\n<p><strong>1. PERSONAL INFORMATION</strong></p>\r\n\r\n<p>&quot;Personal information&quot; is defined to include information that whether on its own or in combination with other information may be used to readily identify or contact you such as: name, address, email address, phone number etc.</p>\r\n\r\n<p>We collect personal information from Service Professionals offering their products and services. This information is partially or completely accessible to all visitors using 24HOURX &#39;s website or mobile application, either directly or by submitting a request for a service. Service Professionals and customers are required to create an account to be able to access certain portions of our Website, such as to submit questions, participate in polls or surveys, to request a quote, to submit a bid in response to a quote, and request information. - Service Professionals, if and when they create and use an account with 24HOURX, will be required to disclose and provide to 24HOURX information including personal contact details, bank details, personal identification details and participate in polls or surveys or feedbacks etc. Such information gathered shall be utilized to ensure greater customer satisfaction and help a customer satiate their needs.</p>\r\n\r\n<p>The type of personal information that we collect from you varies based on your particular interaction with our Website or mobile application.</p>\r\n\r\n<p><strong>Consumers</strong>: During the Account registration process and during your usage of 24HOURX &#39;s website or application, we will collect information such as your name, postal code, telephone email address and other personal information. You also may provide us with your, mailing address, and demographic information (e.g., gender, age, political preference, education, race or ethnic origin, and other information relevant to user surveys and/or offers). We may also collect personal information that you post in your Offer, Profile, Wants, or Feedback, and any comments or discussions you post in any blog, chat room, or other correspondence site on the Website or mobile application, or any comments you provide during dispute resolution with other users of the Website or mobile application.</p>\r\n\r\n<p>Service Professionals: If you are a Service Professional and would like to post any information about yourself, we will require you to register for an Account. During the Account registration process, we will collect your business name, telephone number, address, zip code, travel preferences, a description of your services, a headline for your profile, first and last name, and email address. Other information may also be required to be provided to 24HOURX whilst you avail and use 24HOURX &rsquo;s website or application. In addition, you may require to provide other content or information about your business, including photographs and videos.</p>\r\n\r\n<p>24HOURX reserves the right to record the conversations between service professionals and consumers facilitated by 24HOURX through the messaging/chat mechanism on the platform or the calls made through the virtual numbers provided to safeguard the privacy of consumers and service professionals. All the chat/messaging logs or call recordings can be used to but not limited to monitor and prohibit abuse, safeguard the rights of consumers and service professionals, resolve disputes.</p>\r\n\r\n<p><strong>2. PERSONAL INFORMATION FROM SOCIAL NETWORKING SITES</strong></p>\r\n\r\n<p>You may log into our Website through your Facebook account. If you do so, you must enter the email address and password that you use for your Facebook account. We will ask that you grant us permission to access and collect your Facebook basic information (this includes your name, profile picture, gender, networks, user IDs, list of friends, date of birth, email address, and any other information you have set to public on your Facebook account). If you allow us to have access to this information, then we will have access to this information even if you have chosen not to make that information public.</p>\r\n\r\n<p>We store the information that we receive from Facebook with other information that we collect from you or receive about you.</p>\r\n\r\n<p><strong>3. AUTOMATIC INFORMATION, USE OF COOKIES AND OTHER TRACKING DEVICES</strong></p>\r\n\r\n<p>We and our third party service providers, which include ad networks, use cookies, web beacons, and other tracking technologies to collect information about your use of our Website and Services, such as your browser type, your ISP or operating system, your domain name, your access time, the URL of the previous website you visited, your page views, your IP address, and the type of device that you use. We also track how frequently you visit our Website and use our Services. We use this information (including the information collected by our third party service providers) for Website analytics (including to determine which portions of our Website are used most frequently, what our users like/do not like), to assist us in determining relevant advertising) both on and off our Website), to evaluate the success of our advertising campaigns, and as otherwise described in this policy. Currently, we do not honor browser requests not to be tracked.</p>\r\n\r\n<p>We may obtain your device ID, which is sent to 24HOURX &#39;s servers and used in fraud prevention efforts.</p>\r\n\r\n<p><strong>Cookies</strong>: We and our third party service providers collect information from you by using cookies. A cookie is a small file stored on user&#39;s computer hard drive containing information about the user. The cookie helps us analyze web traffic or informs you about your use of a particular website. Cookies allow web applications to respond to you as an individual, tailoring its operations to your needs, likes and dislikes by gathering and remembering information about your preferences. When you visit the Website, we may send one or more cookies (i.e., a small text file containing a string of alphanumeric characters) to your computer that identifies your browser.</p>\r\n\r\n<p>Some of these cookies may be connected to third-party companies or websites. The terms of use of such cookies are governed by this Policy and the privacy policy of the relevant third party company or website. For example, Google measures the performance of advertisements by placing cookies on your computer when you click on ads. If you visit the Website when you have such cookies on your computer, we and Google will be able to tell that you saw the ad delivered by Google. The terms of use of these cookies are governed by this Policy and Google&#39;s Privacy Policy.</p>\r\n\r\n<p><strong>Disabling Cookies</strong>: You can choose to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer. If you disable cookies, you may be prevented from taking full advantage of the Website because it may not function properly if the ability to accept cookies is disabled.</p>\r\n\r\n<p>Clear GIFs, pixel tags and other technologies. Clear GIFs are tiny graphics with a unique identifier, similar in function to cookies. In contrast to cookies, which are stored on your computer&#39;s hard drive, clear GIFs are embedded invisibly on web pages. We may use clear GIFs (a.k.a. web beacons, web bugs or pixel tags), in connection with our Website to, among other things, track the activities of Website visitors, help us manage content, and compile statistics about Website usage. We and our third party service providers also use clear GIFs in HTML emails to our customers, to help us track email response rates, identify when our emails are viewed, and track whether our emails are forwarded.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>B. Usage of the Information We Collect</strong></span></p>\r\n\r\n<p><strong>1.Use of your PERSONAL INFORMATION</strong></p>\r\n\r\n<p>We collect your personal information and aggregate information about the use of our Website and Services to better understand your needs and to provide you with a better Website experience. Specifically, we may use your personal information for any of the following reasons:</p>\r\n\r\n<p>To provide our Services to you, including registering you for our Services, verifying your identity and authority to use our Services, and to otherwise enable you to use our Website and our Services;</p>\r\n\r\n<p>For customer support and to respond to your inquiries;</p>\r\n\r\n<p>For internal record-keeping purposes;</p>\r\n\r\n<p>To process billing and payment, including sharing with third party payment gateways in connection with Website and/or 24HOURX &#39;s products and Services;</p>\r\n\r\n<p>To improve and maintain our Website and our Services (for example, we track information entered through the &quot;Search&quot; function; this helps us determine which areas of our Website users like best and areas that we may want to enhance; we also will use for trouble-shooting purposes, where applicable);</p>\r\n\r\n<p>To periodically send promotional emails to the email address you provide regarding new products from 24HOURX, special offers from 24HOURX or other information about 24HOURX that we think you may find interesting;</p>\r\n\r\n<p>To contact you via email, telephone, facsimile or mail, or, where requested, by text message, to deliver certain services or information you have requested;</p>\r\n\r\n<p>For 24HOURX &lsquo;s market research purposes, including, but not limited to, the customization of the Website according to your interests;</p>\r\n\r\n<p>We may use your demographic information (i.e., age, postal code, residential and commercial addresses, and other various data) to more effectively facilitate the promotion of goods and services to appropriate target audiences and for other research and analytical purposes;</p>\r\n\r\n<p>To resolve disputes, to protect ourselves and other users of our Website and Services, and to enforce our Terms of Use;</p>\r\n\r\n<p>We also may compare personal information collected through the Website and Services to verify its accuracy with personal information collected from third parties;</p>\r\n\r\n<p>We may combine aggregate data with the personal information we collect about you.</p>\r\n\r\n<p>From time to time, 24HOURX may use personal information for new and unanticipated uses not previously disclosed in our Privacy Policy. If our information practices change regarding information previously collected, 24HOURX shall make reasonable efforts to provide notice and obtain consent of any such uses as may be required by law.</p>\r\n\r\n<p>For a better experience, while using our service, we may require you to provide us with certain personally identifiable information e.g. users name, address, location, phone number, device information. The information that We request will be retained by us and used as described in this privacy policy. The app does use third party services that may collect information used to identify you. Link to privacy policy of third party service providers used by the app</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>C. E-mail Newsletters, Referral, Votes and Surveys</strong></span></p>\r\n\r\n<p>At our sole discretion, 24HOURX may offer any of the following free services on the Website, which you may select to use or receive at your option. Certain of the following services may require you to provide additional personal information as detailed below:</p>\r\n\r\n<p><strong>1. E-mail NEWSLETTERS</strong></p>\r\n\r\n<p>We may offer a free electronic newsletter to users. We will gather the email addresses of users who sign up for 24HOURX for the newsletter mailing list. Users may remove themselves from this mailing list by opting out of receiving newsletters during the registration process, by following the link provided in each newsletter that points users to a subscription management page where the user can unsubscribe from receiving newsletters or by changing their preferences in their Profile Settings page.</p>\r\n\r\n<p><strong>2.&quot;REFER TO A FRIEND&quot;</strong></p>\r\n\r\n<p>Our Website users can voluntarily choose to electronically forward a link, page, or document to someone else by clicking &quot;send to a friend.&quot; To do so, the user must provide his or her email address, as well as the email address of the recipient. The user&#39;s email address is used only in the case of transmission errors and, of course, to let the recipient know who sent the email. The information is not used for any other purpose.</p>\r\n\r\n<p><strong>3.VOTING</strong></p>\r\n\r\n<p>We may offer interactive polls to users so they can easily share their opinions with other users and see what our audience thinks about important issues, Services, and/or the Website. Opinions or other responses to polls are aggregated and are not identifiable to any particular user. We may use a system to &quot;tag&quot; users after they have voted, so they can vote only once on a particular question. This tag is not correlated with information about individual users.</p>\r\n\r\n<p><strong>4.SURVEYS</strong></p>\r\n\r\n<p>We may conduct user surveys from time to time to better target our content to our Website users. We will not share individual responses from these surveys with any third party. We will share aggregate data with third party service providers, partners, and other third parties. We also will post aggregate data containing survey responses on our Website; that data may be viewed and downloaded by other users of our Website.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>D. Security</strong></span></p>\r\n\r\n<p>We employ procedural and technological security measures, which are reasonably designed to help protect your personal information from unauthorized access or disclosure. 24HOURX may use encryption, passwords, and physical security measures to help protect your personal information against unauthorized access and disclosure. No security measures, however, are 100% complete. Therefore, we do not promise and cannot guarantee, and thus you should not expect, that your personal information or private communications will not be collected and used by others. You should take steps to protect against unauthorized access to your password, phone, and computer by, among other things, signing off after using a shared computer, choosing a robust password that nobody else knows or can easily guess, and keeping your log-in and password private. 24HOURX is not responsible for the unauthorized use of your information or for any lost, stolen, compromised passwords, or for any activity on your Account via unauthorized password activity.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>E. Disclosure</strong></span></p>\r\n\r\n<p>We may share the information that we collect about you, including your personal information, as follows:</p>\r\n\r\n<p><strong>1. DISCLOSING INFORMATION TO PROTECT US AND OTHERS </strong></p>\r\n\r\n<p>We may disclose your information including Personal Information if: (i) 24HOURX reasonably believes that disclosure is necessary in order to comply with a legal process (such as a court order, search warrant, etc.) or other legal requirement of any governmental authority, (ii) disclosure would potentially mitigate our liability in an actual or potential lawsuit, (iii) reasonably necessary to enforce this Privacy Policy, our Terms of Use etc. (iv) disclosure is intended to help investigate or prevent unauthorized transactions or other illegal activities, or (v) necessary or appropriate to protect our rights or property, or the rights or property of any person or entity.</p>\r\n\r\n<p><strong>2. DISCLOSING INFORMATION TO THIRD PARTY SERVICE PROVIDERS AND BUSINESS PARTNERS </strong></p>\r\n\r\n<p>We may contract with various third parties for the provision and maintenance of the Website, Services and our business operations, and 24HOURX may need to share your personal information and data generated by cookies and aggregate information (collectively, &quot;information&quot;) with these vendors and service agencies. For example, we may provide your information to a credit card processing company to process your payment. The vendors and service agencies will not receive any right to use your personal information beyond what is necessary to perform its obligations to provide the Services to you. If you complete a survey, we also may share your information with the survey provider; if we offer a survey in conjunction with another entity, we also will disclose the results to that entity.</p>\r\n\r\n<p><strong>3.DISCLOSURE TO NON-AFFILIATED THIRD PARTIES IN FURTHERANCE OF YOUR REQUEST</strong></p>\r\n\r\n<p>Your request for services may be shared with third party websites with whom we have a contractual relationship in order to provide your request with maximum exposure. The post on the third party website will include the details of your request, including your location, and other contact details. Interested bidders, however, will be able to click on your request on such third party site, and will be directed to our Website where they will have access to your contact details (Partial or complete), as would any other service provider on our Website interested in bidding on your request.</p>\r\n\r\n<p><strong>4.DISCLOSING TO OTHER USERS OF OUR WEBSITE</strong></p>\r\n\r\n<p>If you are a Service Professional, the information that you post (other than your payment information) is available to other users of our Website and our Services. Comments that users post to our Website also will be available to other visitors to our Website (see our discussion of User Generated Content below). In addition, we will post the results (in aggregate form) of surveys to our Website. If you are a consumer, name, and location, as well as the details of your request, are available to all visitors to our Website. Bidding professionals also will be permitted to see the consumer&#39;s full name, telephone number, email address and the -location</p>\r\n\r\n<p><strong>5.DISCLOSURE OF THE INFORMATION TO LAW ENFORCEMENT OR GOVERNMENT OFFICIALS</strong></p>\r\n\r\n<p>We will disclose your information, including, without limitation, your name, city, state, telephone number, email address, user ID history, quoting and listing history, and fraud complaints, to law enforcement or other government officials if we are required to do so by law, regulation or other government authority or otherwise in cooperation with an investigation of a governmental authority.</p>\r\n\r\n<p><strong>6.DURING THE CHANGE OF CONTROL OR BANKRUPTCY</strong></p>\r\n\r\n<p>In the event that 24HOURX undergoes a change in control, including, without limitation, a merger or sale of all or substantially all of 24HOURX&#39;s assets to which this Website relates or other corporate reorganization in which 24HOURX participates, and is thus merged with or acquired by a third party entity (a &quot;Successor&quot;), 24HOURX hereby reserves the right to transfer the information we have collected from the users of the Website and/or Services to such Successor.</p>\r\n\r\n<p>In addition, in the event of 24HOURX&#39;s bankruptcy, reorganization, receivership, or assignment for the benefit of creditors, or the application or laws or equitable principles affecting creditors&#39; rights generally, 24HOURX may not be able to control how your information is transferred, used, or treated and reserves the right to transfer the information we have collected from the users of the Website and/or Services to non-affiliated third parties in such event.</p>\r\n\r\n<p><strong>7.PROPOSE FOR INFORMATION DISCLOSURE</strong></p>\r\n\r\n<p>We may share your personal information with other Registered Users to whom you explicitly ask us to send your information or if you explicitly consent to such disclosure upon receipt of a specific Service. For instance, when you contract for a specific Service with another Registered User, 24HOURX will send that Registered User a notice that includes the personal information that you have chosen to allow 24HOURX to reveal to users with whom you contract.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>F. EXTERNAL WEBSITES LINKS</strong></span></p>\r\n\r\n<p>The Website may contain links to other websites or resources over which 24HOURX does not have any control. Such links do not constitute an endorsement by 24HOURX of those external websites. You acknowledge that 24HOURX is providing these links to you only as a convenience, and further agree that 24HOURX is not responsible for the content of such external websites. We are not responsible for the protection and privacy of any information which you provide while visiting such external websites and such sites are not governed by this Policy. Your use of any external website is subject to the terms of use and privacy policy located on the linked to external website.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>G. EDIT YOUR PERSONAL INFORMATION</strong></span></p>\r\n\r\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\r\n\r\n<p>You can review, correct and delete your personal information by logging into the Website and navigating to your preferences page in &quot;Edit Profile.&quot; You must promptly update your personal information if it changes or is inaccurate. Typically, we will not manually alter your personal information because it is very difficult to verify your identity remotely. Nonetheless, upon your request we will close your Account and remove your personal information from view as soon as reasonably possible based on your Account activity and in accordance with applicable law. We do retain information from closed Accounts in order to comply with the law, prevent fraud, collect any fees owed, resolve disputes, troubleshoot problems, assist with any investigations of any Registered User, enforce our Terms of Use, and take any other actions otherwise permitted by law that we deem necessary in our sole and absolute discretion. You should understand, however, that once you publicly post a Request, Offer, Want, Feedback, or any other information onto the Website, you may not be able to change or remove it. Once we have deleted or removed your Account, you agree that 24HOURX shall not be responsible for any personal information that was not included within your deleted and/or removed Account that remains on the Website.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>H. CHOICES YOU HAVE DURING THE USE OF YOUR PERSONAL INFORMATION?</strong></span></p>\r\n\r\n<p>We may send periodic promotional or informational emails to you. You may opt-out of such communications by following the opt-out instructions contained in the email. Please note that it may take up to 10 business days for us to process opt-out requests. If you opt-out of receiving emails about recommendations or other information we think may interest you, we may still send you emails about your Account or any Services you have requested or received from us.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>I. AD NETWORKS BY THIRD PARTIES</strong></span></p>\r\n\r\n<p>We participate in third party ad networks that may display advertisements on other websites based on your visits to our Site as well as other websites. This enables us and these third parties to target advertisements by displaying ads for products and services in which you might be interested. Third party ad network providers, advertisers, sponsors and/or traffic measurement services may use cookies, JavaScript, web beacons (including clear GIFs), Flash LSOs and other technologies to measure the effectiveness of their ads and to personalize advertising content to you. These third party cookies and other technologies are governed by each third party&#39;s specific privacy policy, and not by 24HOURX &#39;s Policy. We may provide these third-party advertisers with information about your usage of our Site and our services, as well as aggregate or non-personally identifiable information about visitors to our Site and users of our service.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>J. YOUR FULL NAME AND USE OF 24HOURX INFORMATION </strong></span></p>\r\n\r\n<p><strong>1. FULL NAME OF YOURS</strong></p>\r\n\r\n<p>As a Registered User of the Website you will select a Full Name during the registration process. All of your activities on the Website will be traceable to your Full Name. Certain other people, including other Registered Users with whom you have transacted business via the Website, can see a large part of your activity on the Website. If you book a service with a Registered User, cancel a scheduled service with a Registered User, receive an offer on your posted service from a Registered User, or have posted a service, 24HOURX may send a notice to you or the appropriate Registered User that includes your Full Name. Thus, if you associate your real name with your Full Name, the people to whom you have revealed your name may be able to personally identify your Website activities.</p>\r\n\r\n<p><strong>2.USING INFORMATION FROM 24HOURX </strong></p>\r\n\r\n<p>The Website facilitates your sharing of personal information with others in order to negotiate, provide, and use the Services. If you agree to contract for a service with another Registered User, you may need to reveal your name, email, phone number, or personal address to that individual so that the service may be performed. Please respect the privacy of others. You agree to use the information of other users solely for the following purposes: (a) 24HOURX -transaction-related purposes; and (b) using Services offered through the Website.</p>\r\n\r\n<p><strong>3. PROTECT YOUR ACCOUNT</strong></p>\r\n\r\n<p>Your password is the key to your Account. When creating your password, you should use unique numbers, letters, special characters, and combinations thereof. In addition, DO NOT disclose your password to anyone. If you do share your password or your personal information with others, you are solely responsible for all actions taken via your Account. If you lose control of your password, you may lose substantial control over your personal information and be subject to legally binding actions taken on your behalf. Thus, IF YOUR PASSWORD HAS BEEN COMPROMISED FOR ANY REASON, YOU MUST IMMEDIATELY NOTIFY 24HOURX TO CHANGE YOUR PASSWORD.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>K. CONTENT GENERATED BY USERS</strong></span></p>\r\n\r\n<p>We invite you to post content on our Website, including your comments, feedback, pictures, and any other information that you would like to be available on our Website. If you post content to our Website, all of the information that you post will be available to all visitors to our Website. If you post your own content on our Website or Services, your posting may become public and 24HOURX cannot prevent such information from being used in a manner that may violate this Policy, the law, or your personal privacy.</p>\r\n\r\n<p><span style=\"font-size:22pt\"><strong>L. UPDATES OF PRIVACY POLICY</strong></span></p>\r\n\r\n<p>THIS POLICY IS CURRENT AS OF THE EFFECTIVE DATE SET FORTH ABOVE. 24HOURX MAY, IN ITS SOLE AND ABSOLUTE DISCRETION, CHANGE THIS POLICY FROM TIME TO TIME BY UPDATING THIS DOCUMENT. 24HOURX WILL POST ITS UPDATED POLICY ON THE WEBSITE ON THIS PAGE. 24HOURX ENCOURAGES YOU TO REVIEW THIS POLICY REGULARLY FOR ANY CHANGES. YOUR CONTINUED USE OF THIS WEBSITE AND/OR CONTINUED PROVISION OF PERSONAL INFORMATION TO US WILL BE SUBJECT TO THE TERMS OF THE THEN-CURRENT POLICY.</p>\r\n\r\n<p>&copy;2022 24hourx All Rights Reserved</p>\r\n\r\n<p><br />\r\n&nbsp;</p>','Privacy Policy',NULL,'privacy, policy, privacy policy','',1,1,'2022-03-22 00:39:40','2022-03-26 18:59:57'),(4,1,1,'page','Support 24/7','support-24-7','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id.</p>','Terms of Use','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra nec, mattis ac neque. Duis vulputate commodo lectus, ac blandit elit tincidunt id.','supports, 24, 7, support 24/7','',1,1,'2022-03-22 00:39:40','2022-03-22 00:39:40'),(5,1,1,'page','Terms of Use','terms-of-use','<p><span style=\"font-size:22pt\"><strong>Terms and Conditions</strong></span><br />\r\n24hourworx, along with its subsidiaries and affiliates provides the information and services on its World Wide Web site(s) &quot; www.24hourworx.com&quot; under the following terms and conditions (the &ldquo;T &amp; C&rdquo;). By accessing and/or using the Site, you indicate your acceptance of these Terms.</p>\r\n\r\n<p>By using our Site, you agree to not knowingly circumvent, evade, or fail to comply with all applicable Terms to the extent that they apply to you.</p>\r\n\r\n<p><strong>Laws and Regulations</strong></p>\r\n\r\n<p>Access to the site and use of it are subject to all applicable international, federal, state and local laws and regulations. User agrees not to use the Site in any way that violates such laws or regulations.</p>\r\n\r\n<p><strong>Copyright and Trademarks</strong></p>\r\n\r\n<p>The information available on or through this Site is the property of 24hourworx, or its licensors, and is protected by copyright, trademark, and other intellectual property laws. Users may not modify, copy, distribute, transmit, display, publish, sell, license, create derivative works or otherwise use any content or information available on or through this Site, directly or indirectly, for commercial or public purposes. Users may not use the trademarks, logos and service marks (&quot;Marks&quot;) for any purpose including, but not limited to use as &quot;hot links&quot; or meta tags in other pages or sites on the World Wide Web without the written permission of 24hourworx or such third party that may own the Mark.</p>\r\n\r\n<p><strong>TAMPERING</strong></p>\r\n\r\n<p>User agrees not to modify, move, add to, delete, tamper, manipulate, or otherwise disrupt 24hourworx Web site or the information contained in 24hourworx &#39;s Web site, including by not circumventing 24hourworx technical controls and security measures. User also agrees not to decompile, reverse engineer, disassemble or unlawfully use, modify, copy or reproduce any of the software, copyrighted or trademarked material, trade secrets, or other proprietary or confidential information contained in the Site.</p>\r\n\r\n<p>By using or accessing this web site you agree that other than with respect to the non-scheduled, non-recurring collection of data done with the express consent of the applicable company or individual, you will not access the Site in a manner that sends more requests to 24hourworx servers than a human can reasonably produce in the same period of time or collect or harvest any personally identifiable information.</p>\r\n\r\n<p><strong>THIRD PARTY INFORMATION</strong></p>\r\n\r\n<p>Although 24hourworx monitors the information on the Site, some of the information is supplied by independent third parties. While 24hourworx makes every effort to insure the accuracy of all information on the Site, 24hourworx makes no warranty as to the accuracy of any such information.</p>\r\n\r\n<p><strong>LINKS TO THIRD PARTY SITES</strong></p>\r\n\r\n<p>This Site may contain links that will let you access other Web sites that are not under the control of 24hourworx. The links are only provided as a convenience and 24hourworx does not endorse any of these sites. 24hourworx assumes no responsibility or liability for any material that may accessed on other Web sites reached through this Site, nor does 24hourworx make any representation regarding the quality of any product or service contained at any such site.</p>\r\n\r\n<p><strong>LINKS FROM THIRD PARTY SITES</strong></p>\r\n\r\n<p>24hourworx prohibits unauthorized links to the Site and the framing of any information contained on the site or any portion of the Site. 24hourworx reserves the right to disable any unauthorized links or frames. 24hourworx has no responsibility or liability for any material on other Web sites that may contain links to this Site.</p>\r\n\r\n<p><strong>NO WARRANTIES</strong></p>\r\n\r\n<p>Information and documents provided on this Site are provided &quot;as is&quot; without warranty of any kind, either express or implied, including without limitation warranties of merchantability, fitness for a particular purpose, and non-infringement. 24hourworx uses reasonable efforts to include accurate and up-to-date information on this Site; it does not, however, make any warranties or representations as to its accuracy or completeness. 24hourworx periodically adds, changes, improves, or updates the information and documents on this Site without notice. 24hourworx assumes no liability or responsibility for any errors or omissions in the content of this Site. Your use of this Site is at your own risk.</p>\r\n\r\n<p><strong>PRIVACY</strong></p>\r\n\r\n<p>Protecting the privacy of our clients and users of our Sites is important to 24hourworx. The 24hourworx Web Site Privacy Statement describes how we use and protect information you provide to us. Please visit our PRIVACY POLICY for more information.</p>\r\n\r\n<p><strong>SECURITY</strong></p>\r\n\r\n<p>Data transmitted to and from 24hourworx client Sites is encrypted for the user&#39;s protection. However, the security of information transmitted through the Internet can never be guaranteed. 24hourworx is not responsible for any interception or interruption of any communications through the Internet or for changes to or losses of data. User is responsible for maintaining the security and confidentiality of any password, user name or ID, or other form of user authentication required by 24hourworx (&ldquo;Authentication&rdquo;) involved in obtaining access to password protected or secure areas of 24hourworx sites and shall not disclose any confidential account access credentials or confidential information to Unauthorized Third Parties. An &ldquo;Unauthorized Third Party&rdquo; refers to any third party or business that seeks to access or accesses 24hourworx sites or systems using the account credentials (e.g., username and password) of an 24hourworx client or client employee, regardless of the their purported consent, in order to access, copy or obtain 24hourworx information, whether such information is accessed, copied or obtained by an automated data gathering program or by other means, including data scrapers, data aggregators and any third parties seeking to monetize data obtained from 24hourworx without 24hourworx&rsquo;s express consent. In order to protect you and your data, 24hourworx may suspend your use of a client site, without notice, pending an investigation, if any such unauthorized disclosure or use or breach of security is suspected.</p>\r\n\r\n<p><strong>TRANSMISSION OF PERSONAL DATA</strong></p>\r\n\r\n<p>User acknowledges and agrees that by providing 24hourworx with any personal information through the Site, user consents to the transmission of such personal user information over international borders as necessary for processing in accordance with 24hourworx&#39;s standard business practices and the 24hourworx Web Site Privacy Statement.</p>\r\n\r\n<p><strong>ACCESS TO PASSWORD PROTECTED/SECURE AREAS</strong></p>\r\n\r\n<p>Access to and use of password protected and/or secure area of the Site is restricted to authorized users only. Unauthorized access, including any access by Unauthorized Third Parties, to such areas is prohibited and may lead to criminal prosecution.</p>\r\n\r\n<p><span style=\"font-size:14pt\"><strong>Fees and Payment</strong></span></p>\r\n\r\n<p>All charges associated with Customer&rsquo;s Account (&ldquo;Fees&rdquo;) are set forth in the applicable SOF or Website, and are due and payable in full within thirty (30) days from the invoice date or as stated in the applicable SOF. Payment obligations are non-cancelable, regardless of utilization by the Customer and except as expressly permitted in this Agreement, Fees paid are non-refundable. Customer will pay the Fees through an accepted payment method as specified in the applicable SOF or Website. Unless otherwise set forth in the SOF, Customer&rsquo;s subscription to the Services will renew automatically for a Subscription Term in accordance with the renewal terms and conditions set forth in Section 6(b) below. During the Term, the Customer may not reduce their Service Plan or User count.</p>\r\n\r\n<p><strong>Late</strong> <strong>Payments</strong>-&nbsp;If undisputed Fees are more than thirty (30) days overdue, then, following written notification from 24hourworx, 24hourworx may suspend Customer&rsquo;s access to the 24hourworx Technology, including, without limitation, Customer&rsquo;s Account, until such unpaid Fees are paid in full.</p>\r\n\r\n<p><strong>Payment</strong> <strong>Disputes</strong>-&nbsp;24hourworx will not exercise its rights under Section 5(b) (Late Payments), 6(d) (Termination for Cause) or Section 6(c)(i) (Suspension of Service) with respect to non-payment by Customer if Customer is disputing the applicable charges reasonably and in good faith and is cooperating diligently to resolve the dispute. If the parties are unable to resolve such a dispute within thirty (30) days, each party will have the right to seek any remedies it may have under this Agreement, at law or in equity, irrespective of any terms that would limit remedies on account of a dispute. For clarity, any undisputed amounts must be paid in full.</p>\r\n\r\n<p><strong>Orders</strong> <strong>by</strong> <strong>Affiliates</strong>-&nbsp;Customer&rsquo;s Affiliates may purchase Services directly from 24hourworx by executing an SOF which is governed by the terms of this Agreement. Such SOF will establish a new and separate agreement between the Customer&rsquo;s Affiliate and the 24hourworx entity signing such SOF. If the Affiliate resides in a different country than Customer, then the SOF may include modifications to terms applicable to the transaction(s) (including but not limited to tax terms and governing law).</p>\r\n\r\n<p><span style=\"font-size:12pt\"><strong>Term, Termination and Suspension</strong></span></p>\r\n\r\n<p><strong>Term</strong>-&nbsp;This Agreement is effective as of the Effective Date (or, for online Customers, the date of sign up on the Website) and will continue through the then-current Subscription Term. Service Plans commence on the start date specified in the relevant SOF (or, for online Customers, the date of sign up on the Website) and continue for the Subscription Term specified therein.</p>\r\n\r\n<p><strong>Renewal</strong>-&nbsp; Unless a party gives written notice of non-renewal at least sixty (60) days prior to the expiration of the relevant Subscription Term, Service Plans will automatically renew for a period equal to the previous Subscription Term or one year (whichever is shorter). 24hourworx reserves the right to increase the Fees at the beginning of each Subscription Term.</p>\r\n\r\n<p><strong>Suspension</strong>-&nbsp;24hourworx may suspend Customer&rsquo;s access to the Services, Software, Mobile Apps and/or Customer&rsquo;s Account, on the following grounds: (i) late payment/non-payment of undisputed Fees, per the process noted above; (ii) non-renewal of the Services by Customer; (iii) Customer&rsquo;s or its Users&rsquo; breach of Section 2 (Use Restrictions); or (iv) in the event suspension is deemed necessary by 24hourworx to prevent or address the introduction of Malicious Software (as defined in Section&nbsp; 8.b below), a security incident, or other harm to Customer, 24hourworx, or 24hourworx&#39; other customers.&nbsp; 24hourworx will notify Customer of any such suspension. 24hourworx will use diligent efforts to attempt to limit, where commercially feasible, the suspension to affected Users or 24hourworx Technology, and will immediately restore the availability of the same as soon as the issues leading to the suspension are resolved.&nbsp; Such suspension will in no way affect Customer&rsquo;s other obligations under this Agreement.</p>\r\n\r\n<p><strong>Termination</strong> <strong>for</strong> <strong>Cause</strong>-&nbsp;Either party may terminate this Agreement by written notice to the other party in the event that (i) such other party materially breaches this Agreement and does not cure such breach within thirty (30) days of such notice, or (ii) immediately in the event the other party becomes the subject of a petition in bankruptcy or any other proceeding relating to insolvency, receivership, liquidation or assignment for the benefit of creditors.</p>\r\n\r\n<p><strong>Free</strong> <strong>Trial</strong> <strong>Customers</strong>-&nbsp;Upon the expiration of Customer&rsquo;s free trial, 24hourworx may immediately suspend Customer&rsquo;s access to the Services. Customer must export Customer Data before the end of the free trial or Customer Data will be permanently deleted. 24hourworx will have no obligation to maintain, store or otherwise retain Customer Data beyond the end of the free trial period.</p>\r\n\r\n<p><strong>Data</strong> <strong>Export</strong>-&nbsp;Upon termination or expiration of this Agreement or any SOF for any reason, Customer&rsquo;s access to the Services, Software, Mobile Apps, APIs and other 24hourworx Technology will terminate.&nbsp; 24hourworx strongly recommends that Customer export all Customer Data before Customer closes Customer&rsquo;s Account. Customer agrees, following the termination or expiration of this Agreement or an unrenewed Subscription Term, that Customer Data will be retained or deleted in accordance with the Supplemental Terms, as applicable to Customer. Where Customer Data is retained by 24hourworx and can be exported, and provided that Customer is current on its payment obligations as described in Section 5, Customer may contact 24hourworx within fourteen (14) days following the effective date of termination to have 24hourworx export Customer&rsquo;s Customer Data. Customer Data cannot be recovered once it is deleted.</p>\r\n\r\n<p><strong>Confidentiality</strong>-&nbsp;Each party will protect the other&rsquo;s Confidential Information from unauthorized use, access, or disclosure in the same manner as it protects its own Confidential Information of similar nature or importance, and in any event, using no less than reasonable care. Except as otherwise expressly permitted pursuant to this Agreement, the receiving party may use the disclosing party&rsquo;s Confidential Information solely to exercise its respective rights and perform its respective obligations under this Agreement, and will disclose such Confidential Information solely to those of its respective employees, representatives and agents who have a need to know such Confidential Information for such purposes and who are bound by obligations to maintain the confidentiality of, and not misuse, such Confidential Information.&nbsp; The provisions of this section will supersede any non-disclosure agreement by and between the parties entered into prior to this Agreement that would purport to address the confidentiality of any information shared by the parties, including Customer Data, and such agreement will have no further force or effect with respect to the foregoing.&nbsp; If the receiving party is required by law or court order to disclose Confidential Information of the disclosing party, then the receiving party will, to the extent legally permitted, provide the disclosing party with advance written notification and cooperate in any effort to obtain confidential treatment of the Confidential Information.&nbsp; The receiving party acknowledges that disclosure of Confidential Information would cause substantial harm for which damages alone would not be a sufficient remedy, and therefore that upon any such disclosure by the receiving party, the disclosing party will be entitled to seek appropriate equitable relief in addition to whatever other remedies it might have at law.&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><strong>Warranties/Disclaimer of Warranties</strong></span></p>\r\n\r\n<p><strong>Service</strong> <strong>Warranty</strong>-&nbsp;24hourworx warrants that the Services, Software or Mobile Apps will perform in all material respects in accordance with the Documentation. Provided that Customer provides written notice of a claim within thirty (30) days after first becoming aware of a breach of the foregoing warranty, 24hourworx will use diligent efforts to correct the Services, Software, or &nbsp;Mobile Apps so the foregoing warranty is met, and if 24hourworx is unable to make such corrections in a timely manner, either party may terminate the applicable SOF, and Customer, as its sole and exclusive remedy, will be entitled to receive a refund of any unused Fees that Customer has pre-paid for the applicable Services, Software or Mobile Apps purchased thereunder. This warranty will not apply if the error or non-conformance was caused by Customer&rsquo;s breach of this Agreement or Customer&rsquo;s or its Users&rsquo; misuse of the Services, Software, and Mobile Apps, modifications to the Services, Software, and Mobile Apps by anyone other than 24hourworx or its representatives, or third-party hardware, software, or services used in connection with the Services, Software, and Mobile Apps.</p>\r\n\r\n<p><strong>Malware</strong> <strong>Warranty</strong>-&nbsp;24hourworx warrants that the Services hosted by 24hourworx will be monitored using commercially available means to attempt to detect and prevent the introduction of any computer instructions, circuitry or other technology means whose purpose or effect is to disrupt, damage or interfere with the authorized use of, or allow access to, the computer and communications facilities or equipment of 24hourworx or Customer, including, without limitation, any code containing viruses, Trojan horses, worms, backdoors, trap doors, time-out devices or similar destructive or harmful code or code that self-replicates (collectively, &ldquo;Malicious Software&rdquo;).</p>\r\n\r\n<p><strong>Warranty</strong> <strong>Disclaimer</strong>-&nbsp;Except as expressly set forth in this agreement, neither party makes any other warranties, express or implied, statutory or otherwise, and all such warranties are hereby disclaimed, including but not limited to warranties of merchant ability, title, fitness for a particular purpose, or non-infringement.&nbsp;</p>\r\n\r\n<p><span style=\"font-size:14pt\"><strong>Indemnification</strong></span></p>\r\n\r\n<p><strong>Indemnification by Customer</strong>-&nbsp;Customer will defend 24hourworx and its Affiliates from any third party claim (&ldquo;Claim&rdquo;), and will indemnify and hold harmless&nbsp; 24hourworx and its Affiliates from and against any damages and costs awarded against 24hourworx and its Affiliates, or agreed in settlement by Customer (including reasonable attorneys&rsquo; fees) resulting from such Claim, to the extent caused by: (i) Customer&rsquo;s or its Affiliate&rsquo;s unauthorized supply, disclosure, or processing of Customer Data, including Personal Data therein, or (ii) Customer&rsquo;s or its Affiliate&rsquo;s violation of laws applicable to Customer&rsquo;s or its Affiliate&rsquo;s business.</p>\r\n\r\n<p><strong>Indemnification Procedures</strong>-&nbsp;In the event of a potential indemnity obligation, the indemnified party will: (i) promptly notify the indemnifying party in writing of the claim, (ii) allow the indemnifying party the right to control the investigation, defense and settlement (if applicable) of such claim at the indemnifying party&rsquo;s sole cost and expense, and (iii) upon request of the indemnifying party, provide all necessary cooperation at the indemnifying party&rsquo;s expense. Failure by the indemnified party to notify the indemnifying party of a claim under this Section will not relieve the indemnifying party of its obligations under this Section, however, the indemnifying party will not be liable for any litigation expenses that the indemnified party incurred prior to the time when notice is given or for any damages and/or costs resulting from any material prejudice caused by the delay or failure to provide notice to the indemnifying party in accordance with this Section. The indemnifying party may not settle any claim that would bind the indemnified party to any obligation (other than payment covered by the indemnifying party or ceasing to use infringing materials) or require any admission of fault by the indemnified party, without the indemnified party&rsquo;s prior written consent, such consent not to be unreasonably withheld, conditioned or delayed. Any indemnification obligation under this Section 10 will not apply if the indemnified party settles or makes any admission with respect to a claim without the indemnifying party&rsquo;s prior written consent.&nbsp;</p>\r\n\r\n<p><span style=\"font-size:14pt\"><strong>Miscellaneous</strong></span></p>\r\n\r\n<p>&nbsp;<strong>Use</strong> <strong>of</strong> <strong>Third Parties for Payment Processing</strong>-&nbsp;24hourworx may use a third-party service provider to manage payment processing provided that such service provider is not permitted to store, retain, or use Customer&rsquo;s payment account information except to process Customer&rsquo;s payment information for 24hourworx. Customer must notify 24hourworx of any change in Customer&rsquo;s payment account information, either by updating Customer&rsquo;s Account or by e-mailing 24hourworx at support @24hourworx.com.</p>\r\n\r\n<p><strong>Assignment</strong>-&nbsp;Neither party may assign any of its rights or obligations hereunder, whether by operation of law or otherwise, without the other party&rsquo;s prior written consent (not to be unreasonably withheld); provided, however, either party may assign this Agreement in its entirety (including all SOFs), without the other party&rsquo;s consent to its Affiliate or in connection with a merger, acquisition, corporate reorganization, or sale of all or substantially all of its assets. Any attempted assignment in violation of this section will be null and void.</p>\r\n\r\n<p><strong>Entire Agreement</strong>-&nbsp;This Agreement, together with any SOF, the Privacy Notice, and Supplemental Terms, constitutes the entire agreement and supersedes any and all prior agreements or communications between Customer and 24hourworx regarding the subject matter hereof. In the event of a conflict between&nbsp;the Privacy Notice, the Supplemental Terms, or any SOF or purchase order and this Agreement, the order of precedence will be, first, the Privacy Notice, second, the SOF, third, the Supplemental Terms, and fourth, this Agreement.&nbsp; If any provision in this Agreement is held by a court of competent jurisdiction to be unenforceable, such provision will be modified by the court and interpreted so as to best accomplish the original provision, and the remaining provisions of this Agreement will remain in effect.</p>\r\n\r\n<p><strong>Publicity</strong> <strong>Right</strong>-&nbsp;24hourworx may identify Customer as a 24hourworx customer in its promotional materials.&nbsp; Customer may request that 24hourworx stop doing so by submitting an email &nbsp;at any time. Please note that it may take us up to thirty (30) days to process a request.</p>\r\n\r\n<p><strong>Relationship</strong> <strong>of</strong> <strong>the</strong> <strong>Parties</strong>-&nbsp;The parties are independent contractors. This Agreement does not create a partnership, franchise, joint venture, agency, fiduciary or employment relationship among the parties.</p>\r\n\r\n<p><strong>Anti-Corruption</strong>-&nbsp;Neither party has received or been offered any illegal or improper bribe, kickback, payment, gift, or thing of value from an employee or agent of the other party in connection with this Agreement. Reasonable gifts and entertainment provided in the ordinary course of business do not violate the above restriction. If Customer learns of any violation of the above restriction, Customer will use reasonable efforts to promptly notify 24hourworx.</p>\r\n\r\n<p><strong>Governing</strong> <strong>Law</strong>-&nbsp;This Agreement is governed by the laws of the State of California without regard to conflict of laws principles. The parties hereby submit to the exclusive personal jurisdiction of the federal and state courts of the State of California, San Francisco County for any claims or dispute relating to this Agreement.</p>\r\n\r\n<p><strong>Dispute</strong> <strong>Resolution</strong></p>\r\n\r\n<p>Any dispute, claim or controversy arising out of or relating to this Agreement or the breach, termination, enforcement, interpretation, or validity thereof, including the determination of the scope or applicability of this Agreement to arbitrate, will be determined by arbitration in San Francisco, California. The arbitration will be administered by JAMS pursuant to its arbitration rules and procedures. Judgment on the Award may be entered in any court having jurisdiction. This section will not preclude parties from seeking provisional remedies in aid of arbitration from a court of appropriate jurisdiction.&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16pt\"><strong>Definitions</strong></span></p>\r\n\r\n<p>&ldquo;Account&rdquo;&nbsp;means any accounts or instances created by or on behalf of Customer for access to and use of any of the Services.</p>\r\n\r\n<p>&ldquo;Affiliate&quot; or &quot;Subsidiary&quot;&nbsp;&nbsp;means, with respect to a party to this Agreement, any entity that directly or indirectly controls, is controlled by, or is under common control with such party, where &ldquo;control&rdquo; means the possession, directly or indirectly, of the power to direct, or cause the direction of the management and policies of such entity, whether through the ownership of voting securities, by contract, or otherwise.</p>\r\n\r\n<p>&ldquo;Confidential Information&rdquo;&nbsp;means all information disclosed by one party to the other party, orally, in writing or electronically, that is designated as &ldquo;confidential&rdquo; (or with a similar legend), or which a reasonable person should understand to be confidential given the nature of the information and circumstances of disclosure. Confidential Information does not include any information that: (a)&nbsp;was publicly known and made generally available in the public domain prior to the time of disclosure by the disclosing party; (b)&nbsp;becomes publicly known and made generally available through no action or inaction of the receiving party; (c)&nbsp;is already in the possession of the receiving party at the time of disclosure by the disclosing party; (d)&nbsp;is obtained by the receiving party from a third party without a breach of such third party&rsquo;s obligations of confidentiality; (e)&nbsp;is independently developed by the receiving party without use of or reference to the disclosing party&rsquo;s Confidential Information.</p>\r\n\r\n<p>&ldquo;Customer Data&rdquo;&nbsp;means, all electronic data, text, messages or other materials, including, without limitation, Personal Data of Users and End Users, submitted to the Services by Customer or its Users through Customer&rsquo;s Account in connection with Customer&rsquo; use of the Services.</p>\r\n\r\n<p>&ldquo;Documentation&rdquo;&nbsp;means, the then-current, generally available user documentation provided by 24hourworx detailing the functionalities of the Software and the Services.</p>\r\n\r\n<p>&ldquo;End User&rdquo;&nbsp;means, any person or entity other than Customer or Customer&rsquo;s Users with whom Customer interacts using the Services.</p>\r\n\r\n<p>&ldquo;24hourworx Technology&rdquo;&nbsp;means, (i) the Services, Software, Mobile Apps, Documentation, 24hourworx&rsquo; APIs, 24hourworx&rsquo; website(s) and any content published on the 24hourworx&rsquo; websites, (ii) any training materials, support materials, templates, tools, methodologies or know-how, (iii) 24hourworx&rsquo; Confidential Information and (iv) any modifications or derivative works of the foregoing.</p>\r\n\r\n<p>&ldquo;Mobile App&rdquo;&nbsp;means, the 24hourworx-branded Software applications provided by 24hourworx to enable access and use of the Services through mobile or other handheld devices (such as apps on iOS or Android devices).</p>\r\n\r\n<p>&ldquo;Personal Data&rdquo;&nbsp;means, data relating to an individual who is or can be identified either from the data or from the data in conjunction with other information that is in, or is likely to come into, the possession of the data controller (as defined under applicable data protection laws).</p>\r\n\r\n<p>&ldquo;Service Order Form&nbsp;or&nbsp;SOF&rdquo;&nbsp;means, (i) any&nbsp;service order referencing this Agreement and executed by Customer and 24hourworx, or&nbsp;(ii) any online ordering document or process completed by Customer, including any online registration through a Website,&nbsp;each of which detail, the Services subscribed to and corresponding Service Plans, the number of Users authorized to use the Services, Fees payable to 24hourworx, the applicable Subscription Term, and any relevant additional terms and conditions. This may also include any change order forms.</p>\r\n\r\n<p>&ldquo;Services&rdquo;&nbsp;means, the 24hourworx software-based service offerings identified on the SOF and any Updates, including any Software, API or Documentation made available by 24hourworx with such offering, but excludes any applications or APIs separately provided by third parties.</p>\r\n\r\n<p>&ldquo;Service Plans&rdquo;&nbsp;means, the pricing plans and other packaged offering limitations for and the applicable Services for which Customer subscribes with respect to any User.</p>\r\n\r\n<p>&ldquo;Software&rdquo;&nbsp;means the generally available software provided by 24hourworx in connection with Customer&rsquo;s use of the Services, and includes Mobile Apps, but excludes any applications or APIs that are provided by third parties.</p>\r\n\r\n<p>&ldquo;Subscription Term&rdquo;&nbsp;means, the period stated on a SOF during which Customer subscribes to the Services.</p>\r\n\r\n<p>&ldquo;Supplemental Terms&rdquo; means, the Services specific terms found, which are located currently at www.24hourworx.com.</p>\r\n\r\n<p>&ldquo;Update&rdquo;&nbsp;means, the generally available updates, upgrades, hot fixes, patches, workarounds to the Software or Service provided by 24hourworx to all subscribing customers, but&nbsp;excludes separately priced new products or modules.</p>\r\n\r\n<p>&ldquo;User&rdquo; or &ldquo;Agent&rdquo;&nbsp;means, any individual who is authorized by Customer to use the Services, including an Account administrator, employees, consultants, contractors, and agents of Customer or its Affiliates, and third parties with which Customer or its Affiliates transact business.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&copy; Copyright&nbsp;2022 24hourworx, Inc. ALL RIGHTS RESERVED.</p>','Terms of Use',NULL,'terms, of, use, terms of use','',1,1,'2022-03-22 00:39:40','2022-03-26 19:08:52');
/*!40000 ALTER TABLE `all_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_setups`
--

DROP TABLE IF EXISTS `api_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endpoint` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docs_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_setups_company_id_foreign` (`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `api_setups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `api_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_setups`
--

LOCK TABLES `api_setups` WRITE;
/*!40000 ALTER TABLE `api_setups` DISABLE KEYS */;
INSERT INTO `api_setups` VALUES (1,'google',NULL,NULL,NULL,NULL,1,1,NULL,NULL),(2,'barikoi',NULL,NULL,NULL,NULL,1,4,NULL,NULL),(3,'google',NULL,NULL,NULL,NULL,2,1,NULL,NULL),(4,'barikoi',NULL,NULL,NULL,NULL,2,4,NULL,NULL);
/*!40000 ALTER TABLE `api_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_screens`
--

DROP TABLE IF EXISTS `app_screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_screens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_screens_status_id_foreign` (`status_id`),
  CONSTRAINT `app_screens_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_screens`
--

LOCK TABLES `app_screens` WRITE;
/*!40000 ALTER TABLE `app_screens` DISABLE KEYS */;
INSERT INTO `app_screens` VALUES (1,'Support','support','1','public/uploads/appSettings/icon/support.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Attendance','attendance','2','public/uploads/appSettings/icon/attendance.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'Notice','notice','3','public/uploads/appSettings/icon/notice.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,'Expense','expense','4','public/uploads/appSettings/icon/expense.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,'Leave','leave','5','public/uploads/appSettings/icon/leave.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,'Approval','approval','6','public/uploads/appSettings/icon/approval.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(7,'Phonebook','phonebook','7','public/uploads/appSettings/icon/phonebook.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(8,'Visit','visit','8','public/uploads/appSettings/icon/visit.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(9,'Appointments','appointments','9','public/uploads/appSettings/icon/appointments.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(10,'Break','break','10','public/uploads/appSettings/icon/break.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(11,'Report','report','11','public/uploads/appSettings/icon/report.svg',1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `app_screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appoinment_participants`
--

DROP TABLE IF EXISTS `appoinment_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appoinment_participants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` bigint unsigned NOT NULL,
  `appoinment_id` bigint unsigned NOT NULL,
  `is_agree` tinyint NOT NULL DEFAULT '0' COMMENT '0: Not agree, 1: Agree',
  `is_present` tinyint NOT NULL DEFAULT '0' COMMENT '0: Absent, 1: Present',
  `present_at` datetime DEFAULT NULL,
  `appoinment_started_at` datetime DEFAULT NULL,
  `appoinment_ended_at` datetime DEFAULT NULL,
  `appoinment_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'appoinment duration in minutes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appoinment_participants_participant_id_foreign` (`participant_id`),
  KEY `appoinment_participants_appoinment_id_foreign` (`appoinment_id`),
  CONSTRAINT `appoinment_participants_appoinment_id_foreign` FOREIGN KEY (`appoinment_id`) REFERENCES `appoinments` (`id`),
  CONSTRAINT `appoinment_participants_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appoinment_participants`
--

LOCK TABLES `appoinment_participants` WRITE;
/*!40000 ALTER TABLE `appoinment_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `appoinment_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appoinments`
--

DROP TABLE IF EXISTS `appoinments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appoinments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `appoinment_with` bigint unsigned NOT NULL,
  `appoinment_start_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appoinment_end_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appoinments_company_id_foreign` (`company_id`),
  KEY `appoinments_created_by_foreign` (`created_by`),
  KEY `appoinments_appoinment_with_foreign` (`appoinment_with`),
  KEY `appoinments_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `appoinments_appoinment_with_foreign` FOREIGN KEY (`appoinment_with`) REFERENCES `users` (`id`),
  CONSTRAINT `appoinments_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appoinments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `appoinments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `appoinments_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appoinments`
--

LOCK TABLES `appoinments` WRITE;
/*!40000 ALTER TABLE `appoinments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appoinments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisals`
--

DROP TABLE IF EXISTS `appraisals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appraisals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rates` json DEFAULT NULL,
  `rating` double(8,2) DEFAULT '0.00',
  `user_id` bigint unsigned NOT NULL,
  `added_by` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appraisals_company_id_foreign` (`company_id`),
  KEY `appraisals_user_id_foreign` (`user_id`),
  KEY `appraisals_added_by_foreign` (`added_by`),
  CONSTRAINT `appraisals_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisals`
--

LOCK TABLES `appraisals` WRITE;
/*!40000 ALTER TABLE `appraisals` DISABLE KEYS */;
INSERT INTO `appraisals` VALUES (1,2,'Project Management','[{\"id\": 1, \"rating\": 1}, {\"id\": 2, \"rating\": 1}, {\"id\": 3, \"rating\": 1}, {\"id\": 4, \"rating\": 1}, {\"id\": 5, \"rating\": 1}, {\"id\": 6, \"rating\": 1}]',1.00,4,2,'2022-09-10',NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `appraisals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appreciates`
--

DROP TABLE IF EXISTS `appreciates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appreciates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `appreciate_by` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appreciates_user_id_foreign` (`user_id`),
  KEY `appreciates_appreciate_by_foreign` (`appreciate_by`),
  CONSTRAINT `appreciates_appreciate_by_foreign` FOREIGN KEY (`appreciate_by`) REFERENCES `users` (`id`),
  CONSTRAINT `appreciates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appreciates`
--

LOCK TABLES `appreciates` WRITE;
/*!40000 ALTER TABLE `appreciates` DISABLE KEYS */;
/*!40000 ALTER TABLE `appreciates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign_leaves`
--

DROP TABLE IF EXISTS `assign_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign_leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `type_id` bigint unsigned NOT NULL,
  `days` int NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assign_leaves_type_id_foreign` (`type_id`),
  KEY `assign_leaves_department_id_foreign` (`department_id`),
  KEY `assign_leaves_status_id_foreign` (`status_id`),
  KEY `assign_leaves_company_id_type_id_department_id_status_id_index` (`company_id`,`type_id`,`department_id`,`status_id`),
  CONSTRAINT `assign_leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assign_leaves_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assign_leaves_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `assign_leaves_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_leaves`
--

LOCK TABLES `assign_leaves` WRITE;
/*!40000 ALTER TABLE `assign_leaves` DISABLE KEYS */;
INSERT INTO `assign_leaves` VALUES (1,1,1,13,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(2,1,1,18,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(3,1,1,19,3,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(4,1,1,14,4,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(5,1,1,13,5,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(6,1,1,19,6,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(7,1,1,16,7,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(8,1,1,20,8,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(9,1,1,16,9,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(10,1,1,17,10,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(11,1,1,10,11,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(12,1,1,11,12,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(13,1,1,11,13,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(14,1,1,11,14,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(15,1,1,14,15,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(16,1,2,20,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(17,1,2,13,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(18,1,2,11,3,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(19,1,2,15,4,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(20,1,2,13,5,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(21,1,2,16,6,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(22,1,2,20,7,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(23,1,2,17,8,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(24,1,2,10,9,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(25,1,2,15,10,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(26,1,2,20,11,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(27,1,2,17,12,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(28,1,2,16,13,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(29,1,2,11,14,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(30,1,2,19,15,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(31,1,3,17,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(32,1,3,10,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(33,1,3,15,3,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(34,1,3,16,4,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(35,1,3,16,5,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(36,1,3,15,6,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(37,1,3,16,7,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(38,1,3,11,8,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(39,1,3,15,9,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(40,1,3,15,10,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(41,1,3,14,11,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(42,1,3,16,12,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(43,1,3,15,13,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(44,1,3,20,14,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(45,1,3,20,15,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(46,1,4,13,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(47,1,4,11,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(48,1,4,10,3,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(49,1,4,13,4,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(50,1,4,20,5,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(51,1,4,18,6,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(52,1,4,14,7,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(53,1,4,20,8,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(54,1,4,12,9,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(55,1,4,18,10,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(56,1,4,18,11,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(57,1,4,12,12,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(58,1,4,13,13,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(59,1,4,12,14,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(60,1,4,10,15,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(61,1,5,18,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(62,1,5,19,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(63,1,5,19,3,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(64,1,5,12,4,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(65,1,5,11,5,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(66,1,5,10,6,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(67,1,5,19,7,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(68,1,5,16,8,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(69,1,5,15,9,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(70,1,5,12,10,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(71,1,5,11,11,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(72,1,5,15,12,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(73,1,5,20,13,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(74,1,5,16,14,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(75,1,5,15,15,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(76,2,6,20,16,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(77,2,6,11,17,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(78,2,6,15,18,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(79,2,6,19,19,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(80,2,6,12,20,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(81,2,6,12,21,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(82,2,6,15,22,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(83,2,6,15,23,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(84,2,6,11,24,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(85,2,6,12,25,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(86,2,6,15,26,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(87,2,6,15,27,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(88,2,6,11,28,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(89,2,6,11,29,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(90,2,6,11,30,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(91,2,7,13,16,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(92,2,7,20,17,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(93,2,7,12,18,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(94,2,7,16,19,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(95,2,7,17,20,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(96,2,7,10,21,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(97,2,7,19,22,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(98,2,7,18,23,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(99,2,7,19,24,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(100,2,7,18,25,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(101,2,7,14,26,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(102,2,7,20,27,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(103,2,7,20,28,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(104,2,7,18,29,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(105,2,7,14,30,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(106,2,8,12,16,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(107,2,8,10,17,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(108,2,8,10,18,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(109,2,8,13,19,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(110,2,8,17,20,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(111,2,8,10,21,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(112,2,8,14,22,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(113,2,8,11,23,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(114,2,8,12,24,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(115,2,8,10,25,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(116,2,8,20,26,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(117,2,8,14,27,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(118,2,8,14,28,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(119,2,8,10,29,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(120,2,8,17,30,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(121,2,9,14,16,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(122,2,9,17,17,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(123,2,9,19,18,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(124,2,9,16,19,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(125,2,9,20,20,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(126,2,9,17,21,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(127,2,9,11,22,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(128,2,9,11,23,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(129,2,9,11,24,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(130,2,9,18,25,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(131,2,9,15,26,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(132,2,9,16,27,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(133,2,9,19,28,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(134,2,9,19,29,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(135,2,9,15,30,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(136,2,10,19,16,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(137,2,10,19,17,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(138,2,10,20,18,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(139,2,10,13,19,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(140,2,10,12,20,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(141,2,10,13,21,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(142,2,10,13,22,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(143,2,10,10,23,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(144,2,10,16,24,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(145,2,10,12,25,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(146,2,10,18,26,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(147,2,10,13,27,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(148,2,10,16,28,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(149,2,10,16,29,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(150,2,10,17,30,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL);
/*!40000 ALTER TABLE `assign_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `check_in` timestamp NULL DEFAULT NULL,
  `check_out` timestamp NULL DEFAULT NULL,
  `stay_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `late_time` int NOT NULL DEFAULT '0',
  `in_status` enum('OT','L','A') COLLATE utf8mb4_unicode_ci DEFAULT 'OT' COMMENT 'OT=On Time, L=Late, A=Absent',
  `out_status` enum('LT','LE','LL') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'LT=Left Timely, LE=Left Early, LL = Left Later',
  `checkin_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkout_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_mode_in` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = home , 1 = office',
  `remote_mode_out` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = home , 1 = office',
  `check_in_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_in_latitude` double DEFAULT NULL COMMENT 'check in latitude',
  `check_in_longitude` double DEFAULT NULL COMMENT 'check in longitude',
  `check_out_latitude` double DEFAULT NULL COMMENT 'check out latitude',
  `check_out_longitude` double DEFAULT NULL COMMENT 'check out longitude',
  `check_in_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'city',
  `check_in_country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'countryCode',
  `check_in_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Bangladesh' COMMENT 'country',
  `check_out_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'city',
  `check_out_country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'countryCode',
  `check_out_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Bangladesh' COMMENT 'country',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_company_id_foreign` (`company_id`),
  KEY `attendances_user_id_foreign` (`user_id`),
  KEY `attendances_status_id_foreign` (`status_id`),
  CONSTRAINT `attendances_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_infos`
--

DROP TABLE IF EXISTS `author_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `authorable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorable_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `approved_by` bigint unsigned DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_by` bigint unsigned DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` bigint unsigned DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `published_by` bigint unsigned DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `unpublished_by` bigint unsigned DEFAULT NULL,
  `unpublished_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `archived_by` bigint unsigned DEFAULT NULL,
  `archived_at` timestamp NULL DEFAULT NULL,
  `restored_by` bigint unsigned DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `referred_by` bigint unsigned DEFAULT NULL,
  `referred_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_infos_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`),
  KEY `author_infos_created_by_foreign` (`created_by`),
  KEY `author_infos_updated_by_foreign` (`updated_by`),
  KEY `author_infos_approved_by_foreign` (`approved_by`),
  KEY `author_infos_rejected_by_foreign` (`rejected_by`),
  KEY `author_infos_cancelled_by_foreign` (`cancelled_by`),
  KEY `author_infos_published_by_foreign` (`published_by`),
  KEY `author_infos_unpublished_by_foreign` (`unpublished_by`),
  KEY `author_infos_deleted_by_foreign` (`deleted_by`),
  KEY `author_infos_archived_by_foreign` (`archived_by`),
  KEY `author_infos_restored_by_foreign` (`restored_by`),
  KEY `author_infos_referred_by_foreign` (`referred_by`),
  CONSTRAINT `author_infos_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_archived_by_foreign` FOREIGN KEY (`archived_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_published_by_foreign` FOREIGN KEY (`published_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_referred_by_foreign` FOREIGN KEY (`referred_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_rejected_by_foreign` FOREIGN KEY (`rejected_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_restored_by_foreign` FOREIGN KEY (`restored_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_unpublished_by_foreign` FOREIGN KEY (`unpublished_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_infos`
--

LOCK TABLES `author_infos` WRITE;
/*!40000 ALTER TABLE `author_infos` DISABLE KEYS */;
INSERT INTO `author_infos` VALUES (1,'App\\Models\\User',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,'App\\Models\\User',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(3,'App\\Models\\User',3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(4,'App\\Models\\User',4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `author_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award_types`
--

DROP TABLE IF EXISTS `award_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `award_types_company_id_foreign` (`company_id`),
  KEY `award_types_id_index` (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `award_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `award_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_types`
--

LOCK TABLES `award_types` WRITE;
/*!40000 ALTER TABLE `award_types` DISABLE KEYS */;
INSERT INTO `award_types` VALUES (1,'Award 1',2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Award 2',2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'Award 3',2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `award_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `award_type_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `gift` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `gift_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `attachment` bigint unsigned DEFAULT NULL,
  `goal_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `awards_company_id_foreign` (`company_id`),
  KEY `awards_user_id_foreign` (`user_id`),
  KEY `awards_created_by_foreign` (`created_by`),
  KEY `awards_award_type_id_foreign` (`award_type_id`),
  KEY `awards_attachment_foreign` (`attachment`),
  KEY `awards_goal_id_foreign` (`goal_id`),
  KEY `awards_id_award_type_id_company_id_status_id_user_id_index` (`id`,`award_type_id`,`company_id`,`status_id`,`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `awards_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `awards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,2,2,2,1,'2020-01-01','Gift 1',100.00,'Gift info 1','<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,NULL,NULL,'2019-12-31 18:00:00','2019-12-31 18:00:00');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Account Number',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bank Name',
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bank branch name',
  `ifsc_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'IFSC Code',
  `account_type` enum('savings','current') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'savings',
  `account_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT NULL,
  `author_info_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_accounts_account_number_unique` (`account_number`),
  KEY `bank_accounts_user_id_index` (`user_id`),
  KEY `bank_accounts_status_id_index` (`status_id`),
  KEY `bank_accounts_author_info_id_index` (`author_info_id`),
  CONSTRAINT `bank_accounts_author_info_id_foreign` FOREIGN KEY (`author_info_id`) REFERENCES `author_infos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bank_accounts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bank_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'name',
  `type` tinyint NOT NULL COMMENT '1=income 2=expense',
  `serial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'serial',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'description',
  `status_id` bigint unsigned DEFAULT NULL,
  `author_info_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_name_type_serial_index` (`name`,`type`,`serial`),
  KEY `categories_status_id_index` (`status_id`),
  KEY `categories_author_info_id_index` (`author_info_id`),
  CONSTRAINT `categories_author_info_id_foreign` FOREIGN KEY (`author_info_id`) REFERENCES `author_infos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `company_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`),
  KEY `clients_company_id_foreign` (`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `clients_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `clients_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'John Doe','john@gmail.com','123456789','123 Main St','New York','NY','10001','USA','www.john.com',NULL,1,2,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '1: addition, 2: deduction',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commissions_company_id_foreign` (`company_id`),
  KEY `commissions_id_index` (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `commissions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `commissions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commissions`
--

LOCK TABLES `commissions` WRITE;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
INSERT INTO `commissions` VALUES (1,'Bonus',2,1,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Penalty',2,2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_employee` int DEFAULT NULL,
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_licence_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_licence_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `is_main_company` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_email_unique` (`email`),
  UNIQUE KEY `companies_phone_unique` (`phone`),
  KEY `companies_country_id_foreign` (`country_id`),
  KEY `trade_licence_id` (`trade_licence_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `companies_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `companies_trade_licence_id_foreign` FOREIGN KEY (`trade_licence_id`) REFERENCES `uploads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,17,'Super Admin','Company1','superadmin@demo.com','+8801910077628',10,'Service',NULL,NULL,1,'yes','2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,223,'Admin','Admin','admin@onesttech.com','+880177777777',400,'Service',NULL,NULL,1,'no','2022-09-10 03:33:32','2022-09-10 03:33:32');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_configs`
--

DROP TABLE IF EXISTS `company_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_configs_company_id_foreign` (`company_id`),
  CONSTRAINT `company_configs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_configs`
--

LOCK TABLES `company_configs` WRITE;
/*!40000 ALTER TABLE `company_configs` DISABLE KEYS */;
INSERT INTO `company_configs` VALUES (1,'date_format','d-m-Y',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'time_format','h',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'ip_check','0',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,'currency_symbol','$',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,'location_service','0',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,'app_sync_time','',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(7,'live_data_store_time','',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(8,'lang','en',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(9,'multi_checkin','0',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(10,'currency','2',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(11,'timezone','Asia/Dhaka',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(12,'currency_code','USD',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(13,'location_check','0',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(14,'attendance_method','N',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(15,'date_format','d-m-Y',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(16,'time_format','h',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(17,'ip_check','0',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(18,'currency_symbol','$',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(19,'location_service','0',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(20,'app_sync_time','',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(21,'live_data_store_time','',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(22,'lang','en',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(23,'multi_checkin','0',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(24,'currency','2',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(25,'timezone','Asia/Dhaka',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(26,'currency_code','USD',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(27,'location_check','0',2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(28,'attendance_method','N',2,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `company_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competence_types`
--

DROP TABLE IF EXISTS `competence_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competence_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competence_types_company_id_foreign` (`company_id`),
  KEY `competence_types_id_status_id_company_id_index` (`id`,`status_id`,`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `competence_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `competence_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence_types`
--

LOCK TABLES `competence_types` WRITE;
/*!40000 ALTER TABLE `competence_types` DISABLE KEYS */;
INSERT INTO `competence_types` VALUES (1,'Organizational Competencies',2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Technical Competencies',2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'Behavioural Competencies',2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `competence_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competences`
--

DROP TABLE IF EXISTS `competences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `competence_type_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `competences_competence_type_id_foreign` (`competence_type_id`),
  KEY `competences_company_id_foreign` (`company_id`),
  KEY `competences_id_status_id_company_id_index` (`id`,`status_id`,`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `competences_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `competences_competence_type_id_foreign` FOREIGN KEY (`competence_type_id`) REFERENCES `competence_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `competences_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competences`
--

LOCK TABLES `competences` WRITE;
/*!40000 ALTER TABLE `competences` DISABLE KEYS */;
INSERT INTO `competences` VALUES (1,'Leadership',1,2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Project Management',1,2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'Allocating Resources',2,2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,'Team Work',2,2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,'Business Process',3,2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,'Oral Communication',3,2,1,2,2,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `competences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_for` int NOT NULL DEFAULT '0' COMMENT '0 for support,1 for query',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_status` tinyint NOT NULL DEFAULT '0' COMMENT '0 for unread,1 for read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `type` enum('notification','message') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'notification' COMMENT 'notification: notification, message: message',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `read_at` timestamp NULL DEFAULT NULL,
  `image_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversations_sender_id_foreign` (`sender_id`),
  KEY `conversations_receiver_id_foreign` (`receiver_id`),
  KEY `conversations_image_id_foreign` (`image_id`),
  CONSTRAINT `conversations_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `conversations_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_country_code_unique` (`country_code`),
  UNIQUE KEY `countries_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan','Asia/Kabul',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,'AL','Albania','Europe/Tirane',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(3,'DZ','Algeria','Africa/Algiers',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(4,'AD','Andorra','Europe/Andorra',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(5,'AO','Angola','Africa/Luanda',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(6,'AI','Anguilla','America/Anguilla',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(7,'AQ','Antarctica','Antarctica/Casey',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(8,'AG','Antigua and Barbuda','America/Antigua',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(9,'AR','Argentina','America/Argentina/Buenos_Aires',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(10,'AM','Armenia','Asia/Yerevan',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(11,'AW','Aruba','America/Aruba',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(12,'AU','Australia','Antarctica/Macquarie',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(13,'AT','Austria','Europe/Vienna',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(14,'AZ','Azerbaijan','Asia/Baku',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(15,'BS','Bahamas','America/Nassau',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(16,'BH','Bahrain','Asia/Bahrain',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(17,'BD','Bangladesh','Asia/Dhaka',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(18,'BB','Barbados','America/Barbados',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(19,'BY','Belarus','Europe/Minsk',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(20,'BE','Belgium','Europe/Brussels',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(21,'BZ','Belize','America/Belize',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(22,'BJ','Benin','Africa/Porto-Novo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(23,'BM','Bermuda','Atlantic/Bermuda',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(24,'BT','Bhutan','Asia/Thimphu',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(25,'BO','Bolivia','America/La_Paz',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(26,'BA','Bosnia and Herzegovina','Europe/Sarajevo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(27,'BW','Botswana','Africa/Gaborone',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(28,'BR','Brazil','America/Araguaina',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(29,'IO','British Indian Ocean Territory','Indian/Chagos',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(30,'BN','Brunei Darussalam','Asia/Brunei',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(31,'BG','Bulgaria','Europe/Sofia',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(32,'BF','Burkina Faso','Africa/Ouagadougou',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(33,'BI','Burundi','Africa/Bujumbura',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(34,'KH','Cambodia','Asia/Phnom_Penh',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(35,'CM','Cameroon','Africa/Douala',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(36,'CA','Canada','America/Atikokan',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(37,'CV','Cape Verde','Atlantic/Cape_Verde',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(38,'KY','Cayman Islands','America/Cayman',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(39,'CF','Central African Republic','Africa/Bangui',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(40,'TD','Chad','Africa/Ndjamena',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(41,'CL','Chile','America/Punta_Arenas',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(42,'CN','China','Asia/Shanghai',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(43,'CX','Christmas Island','Indian/Christmas',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(44,'CC','Cocos (Keeling) Islands','Indian/Cocos',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(45,'CO','Colombia','America/Bogota',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(46,'KM','Comoros','Indian/Comoro',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(47,'CD','Democratic Republic of the Congo','Africa/Kinshasa',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(48,'CG','Republic of Congo','Africa/Brazzaville',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(49,'CK','Cook Islands','Pacific/Rarotonga',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(50,'CR','Costa Rica','America/Costa_Rica',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(51,'HR','Croatia (Hrvatska)','Europe/Zagreb',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(52,'CU','Cuba','America/Havana',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(53,'CY','Cyprus','Asia/Famagusta',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(54,'CZ','Czech Republic','Europe/Prague',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(55,'DK','Denmark','Europe/Copenhagen',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(56,'DJ','Djibouti','Africa/Djibouti',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(57,'DM','Dominica','America/Dominica',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(58,'DO','Dominican Republic','America/Santo_Domingo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(59,'EC','Ecuador','America/Guayaquil',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(60,'EG','Egypt','Africa/Cairo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(61,'SV','El Salvador','America/El_Salvador',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(62,'GQ','Equatorial Guinea','Africa/Malabo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(63,'ER','Eritrea','Africa/Asmara',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(64,'EE','Estonia','Europe/Tallinn',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(65,'ET','Ethiopia','Africa/Addis_Ababa',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(66,'FK','Falkland Islands (Malvinas)','Atlantic/Stanley',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(67,'FO','Faroe Islands','Atlantic/Faroe',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(68,'FJ','Fiji','Pacific/Fiji',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(69,'FI','Finland','Europe/Helsinki',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(70,'FR','France','Europe/Paris',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(71,'GF','French Guiana','America/Cayenne',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(72,'PF','French Polynesia','Pacific/Gambier',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(73,'TF','French Southern Territories','Indian/Kerguelen',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(74,'GA','Gabon','Africa/Libreville',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(75,'GM','Gambia','Africa/Banjul',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(76,'GE','Georgia','Asia/Tbilisi',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(77,'DE','Germany','Europe/Berlin',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(78,'GH','Ghana','Africa/Accra',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(79,'GI','Gibraltar','Europe/Gibraltar',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(80,'GR','Greece','Europe/Athens',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(81,'GL','Greenland','America/Danmarkshavn',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(82,'GD','Grenada','America/Grenada',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(83,'GP','Guadeloupe','America/Guadeloupe',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(84,'GU','Guam','Pacific/Guam',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(85,'GT','Guatemala','America/Guatemala',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(86,'GN','Guinea','Africa/Conakry',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(87,'GW','Guinea-Bissau','Africa/Bissau',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(88,'GY','Guyana','America/Guyana',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(89,'HT','Haiti','America/Port-au-Prince',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(90,'HN','Honduras','America/Tegucigalpa',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(91,'HK','Hong Kong','Asia/Hong_Kong',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(92,'HU','Hungary','Europe/Budapest',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(93,'IS','Iceland','Atlantic/Reykjavik',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(94,'IN','India','Asia/Kolkata',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(95,'IM','Isle of Man','Europe/Isle_of_Man',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(96,'ID','Indonesia','Asia/Jakarta',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(97,'IR','Iran (Islamic Republic of)','Asia/Tehran',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(98,'IQ','Iraq','Asia/Baghdad',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(99,'IE','Ireland','Europe/Dublin',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(100,'IL','Israel','Asia/Jerusalem',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(101,'IT','Italy','Europe/Rome',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(102,'CI','Ivory Coast','Africa/Abidjan',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(103,'JE','Jersey','Europe/Jersey',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(104,'JM','Jamaica','America/Jamaica',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(105,'JP','Japan','Asia/Tokyo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(106,'JO','Jordan','Asia/Amman',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(107,'KZ','Kazakhstan','Asia/Almaty',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(108,'KE','Kenya','Africa/Nairobi',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(109,'KI','Kiribati','Pacific/Kanton',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(110,'KP','Korea, Democratic People\'s Republic of','Asia/Pyongyang',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(111,'KR','Korea, Republic of','Asia/Seoul',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(112,'KW','Kuwait','Asia/Kuwait',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(113,'KG','Kyrgyzstan','Asia/Bishkek',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(114,'LA','Lao People\'s Democratic Republic','Asia/Vientiane',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(115,'LV','Latvia','Europe/Riga',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(116,'LB','Lebanon','Asia/Beirut',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(117,'LS','Lesotho','Africa/Maseru',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(118,'LR','Liberia','Africa/Monrovia',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(119,'LY','Libyan Arab Jamahiriya','Africa/Tripoli',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(120,'LI','Liechtenstein','Europe/Vaduz',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(121,'LT','Lithuania','Europe/Vilnius',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(122,'LU','Luxembourg','Europe/Luxembourg',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(123,'MO','Macau','Asia/Macau',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(124,'MK','North Macedonia','Europe/Skopje',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(125,'MG','Madagascar','Indian/Antananarivo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(126,'MW','Malawi','Africa/Blantyre',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(127,'MY','Malaysia','Asia/Kuala_Lumpur',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(128,'MV','Maldives','Indian/Maldives',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(129,'ML','Mali','Africa/Bamako',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(130,'MT','Malta','Europe/Malta',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(131,'MH','Marshall Islands','Pacific/Kwajalein',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(132,'MQ','Martinique','America/Martinique',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(133,'MR','Mauritania','Africa/Nouakchott',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(134,'MU','Mauritius','Indian/Mauritius',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(135,'MX','Mexico','America/Bahia_Banderas',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(136,'FM','Micronesia, Federated States of','Pacific/Chuuk',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(137,'MD','Moldova, Republic of','Europe/Chisinau',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(138,'MC','Monaco','Europe/Monaco',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(139,'MN','Mongolia','Asia/Choibalsan',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(140,'ME','Montenegro','Europe/Podgorica',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(141,'MS','Montserrat','America/Montserrat',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(142,'MA','Morocco','Africa/Casablanca',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(143,'MZ','Mozambique','Africa/Maputo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(144,'MM','Myanmar','Asia/Yangon',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(145,'NA','Namibia','Africa/Windhoek',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(146,'NR','Nauru','Pacific/Nauru',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(147,'NP','Nepal','Asia/Kathmandu',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(148,'NL','Netherlands','Europe/Amsterdam',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(149,'NC','New Caledonia','Pacific/Noumea',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(150,'NZ','New Zealand','Pacific/Auckland',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(151,'NI','Nicaragua','America/Managua',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(152,'NE','Niger','Africa/Niamey',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(153,'NG','Nigeria','Africa/Lagos',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(154,'NU','Niue','Pacific/Niue',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(155,'NF','Norfolk Island','Pacific/Norfolk',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(156,'MP','Northern Mariana Islands','Pacific/Saipan',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(157,'NO','Norway','Europe/Oslo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(158,'OM','Oman','Asia/Muscat',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(159,'PK','Pakistan','Asia/Karachi',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(160,'PW','Palau','Pacific/Palau',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(161,'PS','Palestine','Asia/Gaza',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(162,'PA','Panama','America/Panama',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(163,'PG','Papua New Guinea','Pacific/Bougainville',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(164,'PY','Paraguay','America/Asuncion',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(165,'PE','Peru','America/Lima',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(166,'PH','Philippines','Asia/Manila',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(167,'PN','Pitcairn','Pacific/Pitcairn',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(168,'PL','Poland','Europe/Warsaw',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(169,'PT','Portugal','Atlantic/Azores',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(170,'PR','Puerto Rico','America/Puerto_Rico',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(171,'QA','Qatar','Asia/Qatar',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(172,'RE','Reunion','Indian/Reunion',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(173,'RO','Romania','Europe/Bucharest',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(174,'RU','Russian Federation','Asia/Anadyr',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(175,'RW','Rwanda','Africa/Kigali',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(176,'KN','Saint Kitts and Nevis','America/St_Kitts',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(177,'LC','Saint Lucia','America/St_Lucia',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(178,'VC','Saint Vincent and the Grenadines','America/St_Vincent',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(179,'WS','Samoa','Pacific/Apia',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(180,'SM','San Marino','Europe/San_Marino',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(181,'ST','Sao Tome and Principe','Africa/Sao_Tome',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(182,'SA','Saudi Arabia','Asia/Riyadh',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(183,'SN','Senegal','Africa/Dakar',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(184,'RS','Serbia','Europe/Belgrade',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(185,'SC','Seychelles','Indian/Mahe',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(186,'SL','Sierra Leone','Africa/Freetown',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(187,'SG','Singapore','Asia/Singapore',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(188,'SK','Slovakia','Europe/Bratislava',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(189,'SI','Slovenia','Europe/Ljubljana',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(190,'SB','Solomon Islands','Pacific/Guadalcanal',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(191,'SO','Somalia','Africa/Mogadishu',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(192,'ZA','South Africa','Africa/Johannesburg',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(193,'SS','South Sudan','Africa/Juba',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(194,'GS','South Georgia South Sandwich Islands','Atlantic/South_Georgia',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(195,'ES','Spain','Africa/Ceuta',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(196,'LK','Sri Lanka','Asia/Colombo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(197,'SH','St. Helena','Atlantic/St_Helena',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(198,'PM','St. Pierre and Miquelon','America/Miquelon',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(199,'SD','Sudan','Africa/Khartoum',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(200,'SR','Suriname','America/Paramaribo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(201,'SJ','Svalbard and Jan Mayen Islands','Arctic/Longyearbyen',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(202,'SZ','Swaziland','Africa/Mbabane',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(203,'SE','Sweden','Europe/Stockholm',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(204,'CH','Switzerland','Europe/Zurich',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(205,'SY','Syrian Arab Republic','Asia/Damascus',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(206,'TW','Taiwan','Asia/Taipei',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(207,'TJ','Tajikistan','Asia/Dushanbe',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(208,'TZ','Tanzania, United Republic of','Africa/Dar_es_Salaam',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(209,'TH','Thailand','Asia/Bangkok',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(210,'TG','Togo','Africa/Lome',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(211,'TK','Tokelau','Pacific/Fakaofo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(212,'TO','Tonga','Pacific/Tongatapu',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(213,'TT','Trinidad and Tobago','America/Port_of_Spain',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(214,'TN','Tunisia','Africa/Tunis',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(215,'TR','Turkey','Europe/Istanbul',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(216,'TM','Turkmenistan','Asia/Ashgabat',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(217,'TC','Turks and Caicos Islands','America/Grand_Turk',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(218,'TV','Tuvalu','Pacific/Funafuti',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(219,'UG','Uganda','Africa/Kampala',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(220,'UA','Ukraine','Europe/Kiev',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(221,'AE','United Arab Emirates','Asia/Dubai',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(222,'GB','United Kingdom','Europe/London',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(223,'US','United States','America/Adak',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(224,'UM','United States minor outlying islands','Pacific/Midway',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(225,'UY','Uruguay','America/Montevideo',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(226,'UZ','Uzbekistan','Asia/Samarkand',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(227,'VU','Vanuatu','Pacific/Efate',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(228,'VA','Vatican City State','Europe/Vatican',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(229,'VE','Venezuela','America/Caracas',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(230,'VN','Vietnam','Asia/Ho_Chi_Minh',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(231,'VG','Virgin Islands (British)','America/Tortola',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(232,'VI','Virgin Islands (U.S.)','America/St_Thomas',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(233,'WF','Wallis and Futuna Islands','Pacific/Wallis',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(234,'EH','Western Sahara','Africa/El_Aaiun',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(235,'YE','Yemen','Asia/Aden',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(236,'ZM','Zambia','Africa/Lusaka',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(237,'ZW','Zimbabwe','Africa/Harare',NULL,NULL,NULL,NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Leke','ALL','Lek','2022-09-10 03:33:25','2022-09-10 03:33:25'),(2,'Dollars','USD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(3,'Afghanis','AFN','؋','2022-09-10 03:33:25','2022-09-10 03:33:25'),(4,'Pesos','ARS','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(5,'Guilders','AWG','ƒ','2022-09-10 03:33:25','2022-09-10 03:33:25'),(6,'Dollars','AUD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(7,'New Manats','AZN','ман','2022-09-10 03:33:25','2022-09-10 03:33:25'),(8,'Dollars','BSD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(9,'Dollars','BBD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(10,'Rubles','BYR','p.','2022-09-10 03:33:25','2022-09-10 03:33:25'),(11,'Euro','EUR','€','2022-09-10 03:33:25','2022-09-10 03:33:25'),(12,'Dollars','BZD','BZ$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(13,'Dollars','BMD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(14,'Bolivianos','BOB','$b','2022-09-10 03:33:25','2022-09-10 03:33:25'),(15,'Convertible Marka','BAM','KM','2022-09-10 03:33:25','2022-09-10 03:33:25'),(16,'Pula','BWP','P','2022-09-10 03:33:25','2022-09-10 03:33:25'),(17,'Leva','BGN','лв','2022-09-10 03:33:25','2022-09-10 03:33:25'),(18,'Reais','BRL','R$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(19,'Pounds','GBP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(20,'Dollars','BND','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(21,'Riels','KHR','៛','2022-09-10 03:33:25','2022-09-10 03:33:25'),(22,'Dollars','CAD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(23,'Dollars','KYD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(24,'Pesos','CLP','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(25,'Yuan Renminbi','CNY','¥','2022-09-10 03:33:25','2022-09-10 03:33:25'),(26,'Pesos','COP','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(27,'Colón','CRC','₡','2022-09-10 03:33:25','2022-09-10 03:33:25'),(28,'Kuna','HRK','kn','2022-09-10 03:33:25','2022-09-10 03:33:25'),(29,'Pesos','CUP','₱','2022-09-10 03:33:25','2022-09-10 03:33:25'),(30,'Koruny','CZK','Kč','2022-09-10 03:33:25','2022-09-10 03:33:25'),(31,'Kroner','DKK','kr','2022-09-10 03:33:25','2022-09-10 03:33:25'),(32,'Pesos','DOP ','RD$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(33,'Dollars','XCD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(34,'Pounds','EGP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(35,'Colones','SVC','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(36,'Pounds','FKP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(37,'Dollars','FJD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(38,'Cedis','GHC','¢','2022-09-10 03:33:25','2022-09-10 03:33:25'),(39,'Pounds','GIP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(40,'Quetzales','GTQ','Q','2022-09-10 03:33:25','2022-09-10 03:33:25'),(41,'Pounds','GGP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(42,'Dollars','GYD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(43,'Lempiras','HNL','L','2022-09-10 03:33:25','2022-09-10 03:33:25'),(44,'Dollars','HKD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(45,'Forint','HUF','Ft','2022-09-10 03:33:25','2022-09-10 03:33:25'),(46,'Kronur','ISK','kr','2022-09-10 03:33:25','2022-09-10 03:33:25'),(47,'Rupees','INR','₹','2022-09-10 03:33:25','2022-09-10 03:33:25'),(48,'Rupiahs','IDR','Rp','2022-09-10 03:33:25','2022-09-10 03:33:25'),(49,'Rials','IRR','﷼','2022-09-10 03:33:25','2022-09-10 03:33:25'),(50,'Pounds','IMP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(51,'New Shekels','ILS','₪','2022-09-10 03:33:25','2022-09-10 03:33:25'),(52,'Dollars','JMD','J$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(53,'Yen','JPY','¥','2022-09-10 03:33:25','2022-09-10 03:33:25'),(54,'Pounds','JEP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(55,'Tenge','KZT','лв','2022-09-10 03:33:25','2022-09-10 03:33:25'),(56,'Won','KPW','₩','2022-09-10 03:33:25','2022-09-10 03:33:25'),(57,'Won','KRW','₩','2022-09-10 03:33:25','2022-09-10 03:33:25'),(58,'Soms','KGS','лв','2022-09-10 03:33:25','2022-09-10 03:33:25'),(59,'Kips','LAK','₭','2022-09-10 03:33:25','2022-09-10 03:33:25'),(60,'Lati','LVL','Ls','2022-09-10 03:33:25','2022-09-10 03:33:25'),(61,'Pounds','LBP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(62,'Dollars','LRD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(63,'Switzerland Francs','CHF','CHF','2022-09-10 03:33:25','2022-09-10 03:33:25'),(64,'Litai','LTL','Lt','2022-09-10 03:33:25','2022-09-10 03:33:25'),(65,'Denars','MKD','ден','2022-09-10 03:33:25','2022-09-10 03:33:25'),(66,'Ringgits','MYR','RM','2022-09-10 03:33:25','2022-09-10 03:33:25'),(67,'Rupees','MUR','₨','2022-09-10 03:33:25','2022-09-10 03:33:25'),(68,'Pesos','MXN','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(69,'Tugriks','MNT','₮','2022-09-10 03:33:25','2022-09-10 03:33:25'),(70,'Meticais','MZN','MT','2022-09-10 03:33:25','2022-09-10 03:33:25'),(71,'Dollars','NAD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(72,'Rupees','NPR','₨','2022-09-10 03:33:25','2022-09-10 03:33:25'),(73,'Guilders','ANG','ƒ','2022-09-10 03:33:25','2022-09-10 03:33:25'),(74,'Dollars','NZD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(75,'Cordobas','NIO','C$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(76,'Nairas','NGN','₦','2022-09-10 03:33:25','2022-09-10 03:33:25'),(77,'Krone','NOK','kr','2022-09-10 03:33:25','2022-09-10 03:33:25'),(78,'Rials','OMR','﷼','2022-09-10 03:33:25','2022-09-10 03:33:25'),(79,'Rupees','PKR','₨','2022-09-10 03:33:25','2022-09-10 03:33:25'),(80,'Balboa','PAB','B/.','2022-09-10 03:33:25','2022-09-10 03:33:25'),(81,'Guarani','PYG','Gs','2022-09-10 03:33:25','2022-09-10 03:33:25'),(82,'Nuevos Soles','PEN','S/.','2022-09-10 03:33:25','2022-09-10 03:33:25'),(83,'Pesos','PHP','Php','2022-09-10 03:33:25','2022-09-10 03:33:25'),(84,'Zlotych','PLN','zł','2022-09-10 03:33:25','2022-09-10 03:33:25'),(85,'Rials','QAR','﷼','2022-09-10 03:33:25','2022-09-10 03:33:25'),(86,'New Lei','RON','lei','2022-09-10 03:33:25','2022-09-10 03:33:25'),(87,'Rubles','RUB','руб','2022-09-10 03:33:25','2022-09-10 03:33:25'),(88,'Pounds','SHP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(89,'Riyals','SAR','﷼','2022-09-10 03:33:25','2022-09-10 03:33:25'),(90,'Dinars','RSD','Дин.','2022-09-10 03:33:25','2022-09-10 03:33:25'),(91,'Rupees','SCR','₨','2022-09-10 03:33:25','2022-09-10 03:33:25'),(92,'Dollars','SGD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(93,'Dollars','SBD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(94,'Shillings','SOS','S','2022-09-10 03:33:25','2022-09-10 03:33:25'),(95,'Rand','ZAR','R','2022-09-10 03:33:25','2022-09-10 03:33:25'),(96,'Rupees','LKR','₨','2022-09-10 03:33:25','2022-09-10 03:33:25'),(97,'Kronor','SEK','kr','2022-09-10 03:33:25','2022-09-10 03:33:25'),(98,'Dollars','SRD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(99,'Pounds','SYP','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(100,'New Dollars','TWD','NT$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(101,'Baht','THB','฿','2022-09-10 03:33:25','2022-09-10 03:33:25'),(102,'Dollars','TTD','TT$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(103,'Lira','TRY','TL','2022-09-10 03:33:25','2022-09-10 03:33:25'),(104,'Liras','TRL','£','2022-09-10 03:33:25','2022-09-10 03:33:25'),(105,'Dollars','TVD','$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(106,'Hryvnia','UAH','₴','2022-09-10 03:33:25','2022-09-10 03:33:25'),(107,'Pesos','UYU','$U','2022-09-10 03:33:25','2022-09-10 03:33:25'),(108,'Sums','UZS','лв','2022-09-10 03:33:25','2022-09-10 03:33:25'),(109,'Bolivares Fuertes','VEF','Bs','2022-09-10 03:33:25','2022-09-10 03:33:25'),(110,'Dong','VND','₫','2022-09-10 03:33:25','2022-09-10 03:33:25'),(111,'Rials','YER','﷼','2022-09-10 03:33:25','2022-09-10 03:33:25'),(112,'Taka','BDT','৳','2022-09-10 03:33:25','2022-09-10 03:33:25'),(113,'Zimbabwe Dollars','ZWD','Z$','2022-09-10 03:33:25','2022-09-10 03:33:25'),(114,'Kenya','KES','KSh','2022-09-10 03:33:25','2022-09-10 03:33:25'),(115,'Nigeria','naira','₦','2022-09-10 03:33:25','2022-09-10 03:33:25'),(116,'Ghana','GHS','GH₵','2022-09-10 03:33:25','2022-09-10 03:33:25'),(117,'Ethiopian','ETB','Br','2022-09-10 03:33:25','2022-09-10 03:33:25'),(118,'Tanzania','TZS','TSh','2022-09-10 03:33:25','2022-09-10 03:33:25'),(119,'Uganda','UGX','USh','2022-09-10 03:33:25','2022-09-10 03:33:25'),(120,'Rwandan','FRW','FRw','2022-09-10 03:33:25','2022-09-10 03:33:25');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_leaves`
--

DROP TABLE IF EXISTS `daily_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `approved_by_tl` bigint unsigned DEFAULT NULL,
  `approved_at_tl` timestamp NULL DEFAULT NULL,
  `approved_by_hr` bigint unsigned DEFAULT NULL,
  `approved_at_hr` timestamp NULL DEFAULT NULL,
  `rejected_by_tl` bigint unsigned DEFAULT NULL,
  `rejected_at_tl` timestamp NULL DEFAULT NULL,
  `rejected_by_hr` bigint unsigned DEFAULT NULL,
  `rejected_at_hr` timestamp NULL DEFAULT NULL,
  `leave_type` enum('early_leave','late_arrive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_leaves_company_id_foreign` (`company_id`),
  KEY `daily_leaves_user_id_foreign` (`user_id`),
  KEY `daily_leaves_approved_by_tl_foreign` (`approved_by_tl`),
  KEY `daily_leaves_approved_by_hr_foreign` (`approved_by_hr`),
  KEY `daily_leaves_rejected_by_tl_foreign` (`rejected_by_tl`),
  KEY `daily_leaves_rejected_by_hr_foreign` (`rejected_by_hr`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `daily_leaves_approved_by_hr_foreign` FOREIGN KEY (`approved_by_hr`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_approved_by_tl_foreign` FOREIGN KEY (`approved_by_tl`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_rejected_by_hr_foreign` FOREIGN KEY (`rejected_by_hr`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_rejected_by_tl_foreign` FOREIGN KEY (`rejected_by_tl`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `daily_leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_leaves`
--

LOCK TABLES `daily_leaves` WRITE;
/*!40000 ALTER TABLE `daily_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_backups`
--

DROP TABLE IF EXISTS `database_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_backups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_backups`
--

LOCK TABLES `database_backups` WRITE;
/*!40000 ALTER TABLE `database_backups` DISABLE KEYS */;
INSERT INTO `database_backups` VALUES (1,'public/db/export_1664011226_22-09-24.sql','2022-09-24 09:20:26','2022-09-24 09:20:26');
/*!40000 ALTER TABLE `database_backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date_formats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `normal_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_by` int unsigned DEFAULT '1',
  `updated_by` int unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_formats`
--

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
INSERT INTO `date_formats` VALUES (1,'jS M, Y','17th May, 2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(2,'Y-m-d','2019-05-17',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(3,'Y-d-m','2019-17-05',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(4,'d-m-Y','17-05-2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(5,'m-d-Y','05-17-2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(6,'Y/m/d','2019/05/17',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(7,'Y/d/m','2019/17/05',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(8,'d/m/Y','17/05/2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(9,'m/d/Y','05/17/2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(10,'l jS \\of F Y','Monday 17th of May 2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(11,'jS \\of F Y','17th of May 2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(12,'g:ia \\o\\n l jS F Y','12:00am on Monday 17th May 2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(13,'F j, Y, g:i a','May 7, 2019, 6:20 pm',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(14,'F j, Y','May 17, 2019',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(15,'\\i\\t \\i\\s \\t\\h\\e jS \\d\\a\\y','it is the 17th day',1,1,1,'2022-09-10 03:33:25','2022-09-10 03:33:25');
/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_company_id_foreign` (`company_id`),
  KEY `departments_status_id_foreign` (`status_id`),
  CONSTRAINT `departments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `departments_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'Management',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(2,1,'HR',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(3,1,'IT',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(4,1,'Marketing',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(5,1,'Sales',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(6,1,'Accounts',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(7,1,'Finance',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(8,1,'Admin',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(9,1,'Customer Service',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(10,1,'Approval',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(11,1,'Graphics & Arts',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(12,1,'Inverntory',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(13,1,'Business',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(14,1,'Content Writer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(15,1,'Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(16,2,'Management',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(17,2,'HR',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(18,2,'IT',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(19,2,'Marketing',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(20,2,'Sales',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(21,2,'Accounts',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(22,2,'Finance',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(23,2,'Admin',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(24,2,'Customer Service',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(25,2,'Approval',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(26,2,'Graphics & Arts',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(27,2,'Inverntory',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(28,2,'Business',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(29,2,'Content Writer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(30,2,'Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `income_expense_category_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `request_amount` double(16,2) NOT NULL DEFAULT '0.00',
  `ref` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `pay` bigint unsigned NOT NULL DEFAULT '9',
  `status_id` bigint unsigned NOT NULL DEFAULT '2',
  `approver_id` bigint unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `attachment` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deposits_income_expense_category_id_foreign` (`income_expense_category_id`),
  KEY `deposits_company_id_foreign` (`company_id`),
  KEY `deposits_attachment_foreign` (`attachment`),
  KEY `deposits_id_amount_date_index` (`id`,`amount`,`date`),
  KEY `user_id` (`user_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `pay` (`pay`),
  KEY `status_id` (`status_id`),
  KEY `approver_id` (`approver_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `deposits_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `deposits_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposits_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `deposits_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposits_pay_foreign` FOREIGN KEY (`pay`) REFERENCES `statuses` (`id`),
  CONSTRAINT `deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `deposits_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `deposits_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `deposits_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designations_company_id_foreign` (`company_id`),
  KEY `designations_status_id_foreign` (`status_id`),
  CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `designations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
INSERT INTO `designations` VALUES (1,1,'MD',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(2,1,'CEO',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(3,1,'CIO',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(4,1,'HR Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(5,1,'IT Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(6,1,'Marketing Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(7,1,'Sales Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(8,1,'Accounts Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(9,1,'Finance Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(10,1,'Team Lead',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(11,1,'Customer Service Executive (CSR)',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(12,1,'Production Approval Analyst',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(13,1,'Designer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(14,1,'Project Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(15,1,'Web Developer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(16,1,'Sr. Web Developer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(17,1,'Mobile Application Developer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(18,1,'UI UX Designer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(19,1,'Software Quality Assurance (SQA)',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(20,1,'Inventory Control Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(21,1,'Business Operation Officer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(22,1,'Social Communication Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(23,1,'Marketing Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(24,1,'Production Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(25,1,'Digital Marketing Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(26,1,'Vendor Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(27,1,'Business Analyst',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(28,1,'Content Writer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(29,1,'PR & Media Branding Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(30,2,'MD',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(31,2,'CEO',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(32,2,'CIO',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(33,2,'HR Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(34,2,'IT Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(35,2,'Marketing Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(36,2,'Sales Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(37,2,'Accounts Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(38,2,'Finance Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(39,2,'Team Lead',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(40,2,'Customer Service Executive (CSR)',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(41,2,'Production Approval Analyst',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(42,2,'Designer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(43,2,'Project Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(44,2,'Web Developer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(45,2,'Sr. Web Developer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(46,2,'Mobile Application Developer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(47,2,'UI UX Designer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(48,2,'Software Quality Assurance (SQA)',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(49,2,'Inventory Control Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(50,2,'Business Operation Officer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(51,2,'Social Communication Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(52,2,'Marketing Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(53,2,'Production Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(54,2,'Digital Marketing Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(55,2,'Vendor Executive',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(56,2,'Business Analyst',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(57,2,'Content Writer',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(58,2,'PR & Media Branding Manager',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL);
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_comments`
--

DROP TABLE IF EXISTS `discussion_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` tinyint NOT NULL DEFAULT '1' COMMENT '0=no,1=yes',
  `discussion_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussion_comments_company_id_foreign` (`company_id`),
  KEY `discussion_comments_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_comments_user_id_foreign` (`user_id`),
  KEY `discussion_comments_attachment_foreign` (`attachment`),
  KEY `discussion_comments_id_discussion_id_company_id_user_id_index` (`id`,`discussion_id`,`company_id`,`user_id`),
  CONSTRAINT `discussion_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `discussion_comments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_comments_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_comments`
--

LOCK TABLES `discussion_comments` WRITE;
/*!40000 ALTER TABLE `discussion_comments` DISABLE KEYS */;
INSERT INTO `discussion_comments` VALUES (1,NULL,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,4,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,1,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,3,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `discussion_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `show_to_customer` bigint unsigned NOT NULL DEFAULT '22',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_company_id_foreign` (`company_id`),
  KEY `discussions_project_id_foreign` (`project_id`),
  KEY `discussions_user_id_foreign` (`user_id`),
  KEY `discussions_id_project_id_company_id_status_id_user_id_index` (`id`,`project_id`,`company_id`,`status_id`,`user_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `discussions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussions_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `discussions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
INSERT INTO `discussions` VALUES (1,2,'Discussion 1','<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4,33,1,'2022-09-10 03:33:33','2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duty_schedules`
--

DROP TABLE IF EXISTS `duty_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duty_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `shift_id` bigint unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `consider_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `hour` int NOT NULL DEFAULT '0',
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_on_same_date` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `duty_schedules_company_id_foreign` (`company_id`),
  KEY `duty_schedules_shift_id_foreign` (`shift_id`),
  KEY `duty_schedules_status_id_foreign` (`status_id`),
  KEY `duty_schedules_id_index` (`id`),
  CONSTRAINT `duty_schedules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `duty_schedules_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `duty_schedules_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duty_schedules`
--

LOCK TABLES `duty_schedules` WRITE;
/*!40000 ALTER TABLE `duty_schedules` DISABLE KEYS */;
INSERT INTO `duty_schedules` VALUES (1,2,4,'09:00:00','17:00:00','15',8,1,'2022-09-10 03:33:32','2022-09-10 03:33:32',1);
/*!40000 ALTER TABLE `duty_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_breaks`
--

DROP TABLE IF EXISTS `employee_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_breaks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `break_time` time DEFAULT NULL,
  `back_time` time DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_breaks_company_id_foreign` (`company_id`),
  KEY `employee_breaks_user_id_foreign` (`user_id`),
  CONSTRAINT `employee_breaks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_breaks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_breaks`
--

LOCK TABLES `employee_breaks` WRITE;
/*!40000 ALTER TABLE `employee_breaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_breaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tasks`
--

DROP TABLE IF EXISTS `employee_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `assigned_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `due_date` date DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_tasks_assigned_id_foreign` (`assigned_id`),
  KEY `employee_tasks_created_by_foreign` (`created_by`),
  KEY `employee_tasks_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `employee_tasks_assigned_id_foreign` FOREIGN KEY (`assigned_id`) REFERENCES `users` (`id`),
  CONSTRAINT `employee_tasks_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `employee_tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tasks`
--

LOCK TABLES `employee_tasks` WRITE;
/*!40000 ALTER TABLE `employee_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_claim_details`
--

DROP TABLE IF EXISTS `expense_claim_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_claim_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `hrm_expense_id` bigint unsigned NOT NULL,
  `expense_claim_id` bigint unsigned NOT NULL,
  `amount` double(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_claim_details_company_id_foreign` (`company_id`),
  KEY `expense_claim_details_user_id_foreign` (`user_id`),
  KEY `expense_claim_details_hrm_expense_id_foreign` (`hrm_expense_id`),
  KEY `expense_claim_details_expense_claim_id_foreign` (`expense_claim_id`),
  CONSTRAINT `expense_claim_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claim_details_expense_claim_id_foreign` FOREIGN KEY (`expense_claim_id`) REFERENCES `expense_claims` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claim_details_hrm_expense_id_foreign` FOREIGN KEY (`hrm_expense_id`) REFERENCES `hrm_expenses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claim_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_claim_details`
--

LOCK TABLES `expense_claim_details` WRITE;
/*!40000 ALTER TABLE `expense_claim_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_claim_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_claims`
--

DROP TABLE IF EXISTS `expense_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_claims` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'invoice number',
  `claim_date` date DEFAULT NULL COMMENT 'date of claim',
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'remarks of payment',
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'amount of payment',
  `due_amount` double(10,2) DEFAULT NULL COMMENT 'due amount of payment',
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expense_claims_invoice_number_unique` (`invoice_number`),
  KEY `expense_claims_company_id_foreign` (`company_id`),
  KEY `expense_claims_user_id_foreign` (`user_id`),
  KEY `expense_claims_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `expense_claims_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claims_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claims_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `expense_claims_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_claims`
--

LOCK TABLES `expense_claims` WRITE;
/*!40000 ALTER TABLE `expense_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `income_expense_category_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `request_amount` double(16,2) NOT NULL DEFAULT '0.00',
  `pay` bigint unsigned NOT NULL DEFAULT '9',
  `status_id` bigint unsigned NOT NULL DEFAULT '2',
  `ref` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `approver_id` bigint unsigned DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `attachment` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_income_expense_category_id_foreign` (`income_expense_category_id`),
  KEY `expenses_company_id_foreign` (`company_id`),
  KEY `expenses_attachment_foreign` (`attachment`),
  KEY `expenses_id_amount_date_index` (`id`,`amount`,`date`),
  KEY `user_id` (`user_id`),
  KEY `pay` (`pay`),
  KEY `status_id` (`status_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `approver_id` (`approver_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `expenses_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `expenses_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `expenses_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_pay_foreign` FOREIGN KEY (`pay`) REFERENCES `statuses` (`id`),
  CONSTRAINT `expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `expenses_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `expenses_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `expenses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('company_growth','advance_features','awesome_features') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` longtext COLLATE utf8mb4_unicode_ci,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `features_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `features_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `features_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,'company_growth',NULL,'Employee-Centric','Make the lives of your employees less problematic. Try to create an atmosphere where your employees feel like giving their best every day. You can only expect more work efficiency if you are able to keep your employees happier.','Make the lives of your employees less problematic. Try to create an atmosphere where your employees feel like giving their best every day. You can only expect more work efficiency if you are able to keep your employees happier.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'company_growth',NULL,'Development-Centric','To meet your business demands, it is very crucial to meet current and future growth requirements. For fulfilling them, employees’ development is a must. Through your agile strategies and planning it out beforehand can be helpful to reach your goals.','To meet your business demands, it is very crucial to meet current and future growth requirements. For fulfilling them, employees’ development is a must. Through your agile strategies and planning it out beforehand can be helpful to reach your goals.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'company_growth',NULL,'Individual Progress','Having the ability to develop individual relationships with the employees can be beneficial for any company. You can easily get to know their general behavior, social aspects of life, emotional well- being and act upon it to improve employee experience.','Having the ability to develop individual relationships with the employees can be beneficial for any company. You can easily get to know their general behavior, social aspects of life, emotional well- being and act upon it to improve employee experience.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,'company_growth',NULL,'Decision Making','It is very essential to know how to use data rather than just collecting them. Crunching data after getting helpful information can make an impact on decision-making. Easily dive into future possibilities, also analyze potential outcomes beforehand.','It is very essential to know how to use data rather than just collecting them. Crunching data after getting helpful information can make an impact on decision-making. Easily dive into future possibilities, also analyze potential outcomes beforehand.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,'company_growth',NULL,'Continuity','It may occur to anybody, even the HR management people can get sick. Keeping constant workflow and overcome such disruptions, it is vital to get notified earlier or get to know employees’ health condition, effectiveness, feelings towards their job.','It may occur to anybody, even the HR management people can get sick. Keeping constant workflow and overcome such disruptions, it is vital to get notified earlier or get to know employees’ health condition, effectiveness, feelings towards their job.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,'company_growth',NULL,'Universal','Universality is the most vital feature for HRM software. It really doesn’t matter if you are running only a two-person job or a company of 500+ employees, this software is applicable for any. It is truly reliable for any type of organization.','Universality is the most vital feature for HRM software. It really doesn’t matter if you are running only a two-person job or a company of 500+ employees, this software is applicable for any. It is truly reliable for any type of organization.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(7,'advance_features',NULL,'Leave','Employees can express their Leave Type, Find Assigned Leaves and get Leave Request approval. They can also submit necessary documents to ensure the validity of their leave.','Employees can express their Leave Type, Find Assigned Leaves and get Leave Request approval. They can also submit necessary documents to ensure the validity of their leave.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(8,'advance_features',NULL,'Attendance','Records employees’ In /Out time, Working hours, Overtime automatically in its system. Whether they are working from home or office, their activities can be easily traceable to authority.','Records employees’ In /Out time, Working hours, Overtime automatically in its system. Whether they are working from home or office, their activities can be easily traceable to authority.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(9,'advance_features',NULL,'Expense','For any additional expenses, managing legal claims or keeping track on payment history can be easily done in few clicks. You can also Keep an updated routine for any additional disbursement.','For any additional expenses, managing legal claims or keeping track on payment history can be easily done in few clicks. You can also Keep an updated routine for any additional disbursement.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(10,'advance_features',NULL,'Visit','For outdoor visits or participating in crucial meetings, employees can input their check in/out timings too. Also such visits can be monitored by the officials anytime of the day.','For outdoor visits or participating in crucial meetings, employees can input their check in/out timings too. Also such visits can be monitored by the officials anytime of the day.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(11,'advance_features',NULL,'Notice','Let everyone aware of any upcoming events, disciplinary, holidays at once. You can also update any notice for individuals, departmental wise or even for all without any effort.','Let everyone aware of any upcoming events, disciplinary, holidays at once. You can also update any notice for individuals, departmental wise or even for all without any effort.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(12,'advance_features',NULL,'Report','Collects data of individuals -Working days/On time/Late Comings/Early Leave/Overtime and creates monthly/half-yearly, annual report based on their regular performance.','Collects data of individuals -Working days/On time/Late Comings/Early Leave/Overtime and creates monthly/half-yearly, annual report based on their regular performance.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(13,'awesome_features',NULL,'Employee Data','Records everything that indicates all necessary information for any of the employees.','Records everything that indicates all necessary information for any of the employees.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(14,'awesome_features',NULL,'Custom Permission','Provide accessibility to the designated personnel for further analysis of any individual.','Provide accessibility to the designated personnel for further analysis of any individual.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(15,'awesome_features',NULL,'Employee Onboarding','Onboard employees online and make a remarkable first impression during the process.','Onboard employees online and make a remarkable first impression during the process.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(16,'awesome_features',NULL,'Announcement','Celebrate special moments with everyone in the company with a few words.','Celebrate special moments with everyone in the company with a few words.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(17,'awesome_features',NULL,'Custom Profile','You can also get to customize your own profile as you may seem right for the company.','You can also get to customize your own profile as you may seem right for the company.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(18,'awesome_features',NULL,'Project & Tasks','Allows transparent access to overview employee’s assigned tasks for daily reports.','Allows transparent access to overview employee’s assigned tasks for daily reports.',1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `front_teams`
--

DROP TABLE IF EXISTS `front_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `front_teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` bigint unsigned DEFAULT NULL,
  `fb_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ln_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sky_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `front_teams_attachment_foreign` (`attachment`),
  KEY `front_teams_user_id_foreign` (`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `front_teams_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `front_teams_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `front_teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_teams`
--

LOCK TABLES `front_teams` WRITE;
/*!40000 ALTER TABLE `front_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `front_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_types`
--

DROP TABLE IF EXISTS `goal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goal_types_company_id_foreign` (`company_id`),
  KEY `goal_types_id_status_id_company_id_index` (`id`,`status_id`,`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `goal_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goal_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_types`
--

LOCK TABLES `goal_types` WRITE;
/*!40000 ALTER TABLE `goal_types` DISABLE KEYS */;
INSERT INTO `goal_types` VALUES (1,'Employee Experience',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Objective',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'Target',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,'KPI',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,'Measure',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,'Indicator',2,1,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `goal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goal_type_id` bigint unsigned DEFAULT NULL,
  `progress` int DEFAULT '0',
  `status_id` bigint unsigned NOT NULL DEFAULT '24',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `rating` int DEFAULT '0',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goals_company_id_foreign` (`company_id`),
  KEY `goals_goal_type_id_foreign` (`goal_type_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `goals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goals_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `goals_goal_type_id_foreign` FOREIGN KEY (`goal_type_id`) REFERENCES `goal_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goals_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,2,'Employee Experience','Employee Experience',1,1,24,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','2022-09-10','2023-09-10',0,2,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `attachment_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidays_company_id_foreign` (`company_id`),
  KEY `holidays_attachment_id_foreign` (`attachment_id`),
  KEY `holidays_status_id_foreign` (`status_id`),
  KEY `holidays_id_index` (`id`),
  CONSTRAINT `holidays_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `holidays_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,1,'New Year','Federal Holiday','','2022-01-01','2022-01-01',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,1,'Martin Luther King Jr Day','Federal Holiday','3rd Monday in January','2022-01-17','2022-01-17',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,1,'Washington\'s Birthday','Federal Holiday','3rd Monday in February','2022-02-21','2022-02-21',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,1,'Memorial Day','Federal Holiday','Last Monday in May','2022-05-26','2022-05-26',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,1,'Independence Day','Federal Holiday','','2022-07-04','2022-07-04',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,1,'Labor Day','Federal Holiday','1st Monday in September','2022-09-01','2022-09-01',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(7,1,'Columbus Day','Federal Holiday','2nd Monday in October','2022-10-13','2022-10-13',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(8,1,'Veterans Day','Federal Holiday','11th November','2022-11-11','2022-11-11',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(9,1,'Thanksgiving Day','Federal Holiday','4th Thursday in November','2022-11-24','2022-11-24',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(10,1,'Christmas Day','Federal Holiday','','2022-12-25','2022-12-25',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(11,2,'New Year','Federal Holiday','','2022-01-01','2022-01-01',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(12,2,'Martin Luther King Jr Day','Federal Holiday','3rd Monday in January','2022-01-17','2022-01-17',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(13,2,'Washington\'s Birthday','Federal Holiday','3rd Monday in February','2022-02-21','2022-02-21',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(14,2,'Memorial Day','Federal Holiday','Last Monday in May','2022-05-26','2022-05-26',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(15,2,'Independence Day','Federal Holiday','','2022-07-04','2022-07-04',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(16,2,'Labor Day','Federal Holiday','1st Monday in September','2022-09-01','2022-09-01',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(17,2,'Columbus Day','Federal Holiday','2nd Monday in October','2022-10-13','2022-10-13',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(18,2,'Veterans Day','Federal Holiday','11th November','2022-11-11','2022-11-11',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(19,2,'Thanksgiving Day','Federal Holiday','4th Thursday in November','2022-11-24','2022-11-24',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(20,2,'Christmas Day','Federal Holiday','','2022-12-25','2022-12-25',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_pages`
--

DROP TABLE IF EXISTS `home_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contents` json DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `home_pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `home_pages_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `home_pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_pages`
--

LOCK TABLES `home_pages` WRITE;
/*!40000 ALTER TABLE `home_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrm_expenses`
--

DROP TABLE IF EXISTS `hrm_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hrm_expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `income_expense_category_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL COMMENT 'date of expense',
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'remarks of expense',
  `amount` double(10,2) DEFAULT NULL COMMENT 'amount of expense',
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `is_claimed_status_id` bigint unsigned NOT NULL,
  `claimed_approved_status_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hrm_expenses_company_id_foreign` (`company_id`),
  KEY `hrm_expenses_user_id_foreign` (`user_id`),
  KEY `hrm_expenses_income_expense_category_id_foreign` (`income_expense_category_id`),
  KEY `hrm_expenses_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  KEY `claimed_status_id` (`is_claimed_status_id`),
  KEY `claimed_approved_status_id` (`claimed_approved_status_id`),
  CONSTRAINT `hrm_expenses_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hrm_expenses_claimed_approved_status_id_foreign` FOREIGN KEY (`claimed_approved_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `hrm_expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hrm_expenses_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hrm_expenses_is_claimed_status_id_foreign` FOREIGN KEY (`is_claimed_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `hrm_expenses_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `hrm_expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrm_expenses`
--

LOCK TABLES `hrm_expenses` WRITE;
/*!40000 ALTER TABLE `hrm_expenses` DISABLE KEYS */;
INSERT INTO `hrm_expenses` VALUES (1,1,1,1,'2022-09-10','remarks',184.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,1,1,3,'2022-09-10','remarks',185.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,1,1,5,'2022-09-10','remarks',178.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,1,1,7,'2022-09-10','remarks',125.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,1,1,9,'2022-09-10','remarks',176.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,1,1,11,'2022-09-10','remarks',172.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(7,1,1,13,'2022-09-10','remarks',145.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(8,1,1,15,'2022-09-10','remarks',200.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(9,1,1,17,'2022-09-10','remarks',104.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(10,1,1,19,'2022-09-10','remarks',150.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(11,1,1,21,'2022-09-10','remarks',127.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(12,1,1,23,'2022-09-10','remarks',199.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(13,1,1,25,'2022-09-10','remarks',114.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(14,1,1,27,'2022-09-10','remarks',140.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(15,1,1,29,'2022-09-10','remarks',173.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(16,1,1,31,'2022-09-10','remarks',157.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(17,1,1,33,'2022-09-10','remarks',194.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(18,1,1,35,'2022-09-10','remarks',166.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(19,1,1,37,'2022-09-10','remarks',180.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(20,1,1,39,'2022-09-10','remarks',164.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(21,1,1,41,'2022-09-10','remarks',139.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(22,1,1,43,'2022-09-10','remarks',174.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(23,1,1,45,'2022-09-10','remarks',164.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(24,1,1,47,'2022-09-10','remarks',194.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(25,2,2,2,'2022-09-10','remarks',200.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(26,2,2,4,'2022-09-10','remarks',128.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(27,2,2,6,'2022-09-10','remarks',150.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(28,2,2,8,'2022-09-10','remarks',110.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(29,2,2,10,'2022-09-10','remarks',109.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(30,2,2,12,'2022-09-10','remarks',186.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(31,2,2,14,'2022-09-10','remarks',150.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(32,2,2,16,'2022-09-10','remarks',151.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(33,2,2,18,'2022-09-10','remarks',146.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(34,2,2,20,'2022-09-10','remarks',153.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(35,2,2,22,'2022-09-10','remarks',186.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(36,2,2,24,'2022-09-10','remarks',160.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(37,2,2,26,'2022-09-10','remarks',149.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(38,2,2,28,'2022-09-10','remarks',200.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(39,2,2,30,'2022-09-10','remarks',118.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(40,2,2,32,'2022-09-10','remarks',134.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(41,2,2,34,'2022-09-10','remarks',177.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(42,2,2,36,'2022-09-10','remarks',195.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(43,2,2,38,'2022-09-10','remarks',197.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(44,2,2,40,'2022-09-10','remarks',137.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(45,2,2,42,'2022-09-10','remarks',167.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(46,2,2,44,'2022-09-10','remarks',125.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(47,2,2,46,'2022-09-10','remarks',120.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(48,2,2,48,'2022-09-10','remarks',151.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(49,2,3,2,'2022-09-10','remarks',135.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(50,2,3,4,'2022-09-10','remarks',172.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(51,2,3,6,'2022-09-10','remarks',189.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(52,2,3,8,'2022-09-10','remarks',184.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(53,2,3,10,'2022-09-10','remarks',177.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(54,2,3,12,'2022-09-10','remarks',197.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(55,2,3,14,'2022-09-10','remarks',172.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(56,2,3,16,'2022-09-10','remarks',126.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(57,2,3,18,'2022-09-10','remarks',175.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(58,2,3,20,'2022-09-10','remarks',182.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(59,2,3,22,'2022-09-10','remarks',168.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(60,2,3,24,'2022-09-10','remarks',186.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(61,2,3,26,'2022-09-10','remarks',141.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(62,2,3,28,'2022-09-10','remarks',128.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(63,2,3,30,'2022-09-10','remarks',141.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(64,2,3,32,'2022-09-10','remarks',108.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(65,2,3,34,'2022-09-10','remarks',181.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(66,2,3,36,'2022-09-10','remarks',127.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(67,2,3,38,'2022-09-10','remarks',191.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(68,2,3,40,'2022-09-10','remarks',150.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(69,2,3,42,'2022-09-10','remarks',186.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(70,2,3,44,'2022-09-10','remarks',161.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(71,2,3,46,'2022-09-10','remarks',122.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(72,2,3,48,'2022-09-10','remarks',116.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(73,2,4,2,'2022-09-10','remarks',169.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(74,2,4,4,'2022-09-10','remarks',123.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(75,2,4,6,'2022-09-10','remarks',194.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(76,2,4,8,'2022-09-10','remarks',168.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(77,2,4,10,'2022-09-10','remarks',150.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(78,2,4,12,'2022-09-10','remarks',186.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(79,2,4,14,'2022-09-10','remarks',176.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(80,2,4,16,'2022-09-10','remarks',193.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(81,2,4,18,'2022-09-10','remarks',174.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(82,2,4,20,'2022-09-10','remarks',178.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(83,2,4,22,'2022-09-10','remarks',107.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(84,2,4,24,'2022-09-10','remarks',153.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(85,2,4,26,'2022-09-10','remarks',150.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(86,2,4,28,'2022-09-10','remarks',199.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(87,2,4,30,'2022-09-10','remarks',185.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(88,2,4,32,'2022-09-10','remarks',152.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(89,2,4,34,'2022-09-10','remarks',160.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(90,2,4,36,'2022-09-10','remarks',125.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(91,2,4,38,'2022-09-10','remarks',112.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(92,2,4,40,'2022-09-10','remarks',151.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(93,2,4,42,'2022-09-10','remarks',126.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(94,2,4,44,'2022-09-10','remarks',171.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(95,2,4,46,'2022-09-10','remarks',166.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(96,2,4,48,'2022-09-10','remarks',198.00,NULL,1,11,9,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `hrm_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrm_languages`
--

DROP TABLE IF EXISTS `hrm_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hrm_languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int NOT NULL,
  `is_default` int NOT NULL DEFAULT '0',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `hrm_languages_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrm_languages`
--

LOCK TABLES `hrm_languages` WRITE;
/*!40000 ALTER TABLE `hrm_languages` DISABLE KEYS */;
INSERT INTO `hrm_languages` VALUES (1,19,1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `hrm_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_expense_categories`
--

DROP TABLE IF EXISTS `income_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_expense_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_income` tinyint NOT NULL DEFAULT '0' COMMENT '0=Expense, 1=Income',
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `income_expense_categories_company_id_foreign` (`company_id`),
  KEY `income_expense_categories_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `income_expense_categories_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `income_expense_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `income_expense_categories_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_expense_categories`
--

LOCK TABLES `income_expense_categories` WRITE;
/*!40000 ALTER TABLE `income_expense_categories` DISABLE KEYS */;
INSERT INTO `income_expense_categories` VALUES (1,1,'Advance Salary',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,2,'Advance Salary',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,1,'Employee Loan',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,2,'Employee Loan',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,1,'Advertising',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,2,'Advertising',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(7,1,'Bank Charges',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(8,2,'Bank Charges',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(9,1,'Business Development',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(10,2,'Business Development',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(11,1,'Business Travel',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(12,2,'Business Travel',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(13,1,'Communication',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(14,2,'Communication',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(15,1,'Customer Service',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(16,2,'Customer Service',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(17,1,'Delivery',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(18,2,'Delivery',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(19,1,'Events',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(20,2,'Events',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(21,1,'Food & Beverage',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(22,2,'Food & Beverage',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(23,1,'Gifts',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(24,2,'Gifts',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(25,1,'Hospitality',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(26,2,'Hospitality',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(27,1,'Human Resources',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(28,2,'Human Resources',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(29,1,'Maintenance',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(30,2,'Maintenance',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(31,1,'Marketing',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(32,2,'Marketing',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(33,1,'Meeting',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(34,2,'Meeting',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(35,1,'Office Supplies',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(36,2,'Office Supplies',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(37,1,'Purchasing',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(38,2,'Purchasing',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(39,1,'Public Relations',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(40,2,'Public Relations',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(41,1,'Food',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(42,2,'Food',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(43,1,'Others',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(44,2,'Others',0,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(45,1,'Project',1,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(46,2,'Project',1,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(47,1,'Income',1,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(48,2,'Income',1,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `income_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indicators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `shift_id` bigint unsigned DEFAULT NULL,
  `designation_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rates` json DEFAULT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `added_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indicators_company_id_foreign` (`company_id`),
  KEY `indicators_department_id_foreign` (`department_id`),
  KEY `indicators_shift_id_foreign` (`shift_id`),
  KEY `indicators_designation_id_foreign` (`designation_id`),
  KEY `indicators_added_by_foreign` (`added_by`),
  CONSTRAINT `indicators_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
INSERT INTO `indicators` VALUES (1,2,18,4,43,'Project Management','[{\"id\": 1, \"rating\": 1}, {\"id\": 2, \"rating\": 1}, {\"id\": 3, \"rating\": 1}, {\"id\": 4, \"rating\": 1}, {\"id\": 5, \"rating\": 1}, {\"id\": 6, \"rating\": 1}]',1.00,2,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_setups`
--

DROP TABLE IF EXISTS `ip_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `company_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_setups_status_id_foreign` (`status_id`),
  KEY `ip_setups_company_id_foreign` (`company_id`),
  CONSTRAINT `ip_setups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ip_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_setups`
--

LOCK TABLES `ip_setups` WRITE;
/*!40000 ALTER TABLE `ip_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jitsi_meetings`
--

DROP TABLE IF EXISTS `jitsi_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jitsi_meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` text COLLATE utf8mb4_unicode_ci,
  `time_start_before` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jitsi_meetings`
--

LOCK TABLES `jitsi_meetings` WRITE;
/*!40000 ALTER TABLE `jitsi_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `jitsi_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '1',
  `json_exist` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'af','Afrikaans','Afrikaans',0,0,0,0,NULL,NULL),(2,'am','Amharic','አማርኛ',0,0,0,0,NULL,NULL),(3,'ar','Arabic','العربية',1,1,0,0,NULL,NULL),(4,'ay','Aymara','Aymar',0,0,0,0,NULL,NULL),(5,'az','Azerbaijani','Azərbaycanca / آذربايجان',0,0,0,0,NULL,NULL),(6,'be','Belarusian','Беларуская',0,0,0,0,NULL,NULL),(7,'bg','Bulgarian','Български',0,0,0,0,NULL,NULL),(8,'bi','Bislama','Bislama',0,0,0,0,NULL,NULL),(9,'bn','Bengali','বাংলা',0,1,0,0,NULL,NULL),(10,'bs','Bosnian','Bosanski',0,0,0,0,NULL,NULL),(11,'ca','Catalan','Català',0,0,0,0,NULL,NULL),(12,'ch','Chamorro','Chamoru',0,0,0,0,NULL,NULL),(13,'cs','Czech','Česky',0,0,0,0,NULL,NULL),(14,'da','Danish','Dansk',0,0,0,0,NULL,NULL),(15,'de','German','Deutsch',0,0,0,0,NULL,NULL),(16,'dv','Divehi','ދިވެހިބަސް',1,0,0,0,NULL,NULL),(17,'dz','Dzongkha','ཇོང་ཁ',0,0,0,0,NULL,NULL),(18,'el','Greek','Ελληνικά',0,0,0,0,NULL,NULL),(19,'en','English','English',0,1,0,1,NULL,'2022-09-10 03:33:28'),(20,'es','Spanish','Español',0,1,0,0,NULL,NULL),(21,'et','Estonian','Eesti',0,0,0,0,NULL,NULL),(22,'eu','Basque','Euskara',0,0,0,0,NULL,NULL),(23,'fa','Persian','فارسی',1,0,0,0,NULL,NULL),(24,'ff','Peul','Fulfulde',0,0,0,0,NULL,NULL),(25,'fi','Finnish','Suomi',0,0,0,0,NULL,NULL),(26,'fj','Fijian','Na Vosa Vakaviti',0,0,0,0,NULL,NULL),(27,'fo','Faroese','Føroyskt',0,0,0,0,NULL,NULL),(28,'fr','French','Français',0,0,0,0,NULL,NULL),(29,'ga','Irish','Gaeilge',0,0,0,0,NULL,NULL),(30,'gl','Galician','Galego',0,0,0,0,NULL,NULL),(31,'gn','Guarani','Avañe\'ẽ',0,0,0,0,NULL,NULL),(32,'gv','Manx','Gaelg',0,0,0,0,NULL,NULL),(33,'he','Hebrew','עברית',1,0,0,0,NULL,NULL),(34,'hi','Hindi','हिन्दी',0,0,0,0,NULL,NULL),(35,'hr','Croatian','Hrvatski',0,0,0,0,NULL,NULL),(36,'ht','Haitian','Krèyol ayisyen',0,0,0,0,NULL,NULL),(37,'hu','Hungarian','Magyar',0,0,0,0,NULL,NULL),(38,'hy','Armenian','Հայերեն',0,0,0,0,NULL,NULL),(39,'indo','Indonesian','Bahasa Indonesia',0,0,0,0,NULL,NULL),(40,'is','Icelandic','Íslenska',0,0,0,0,NULL,NULL),(41,'it','Italian','Italiano',0,0,0,0,NULL,NULL),(42,'ja','Japanese','日本語',0,0,0,0,NULL,NULL),(43,'ka','Georgian','ქართული',0,0,0,0,NULL,NULL),(44,'kg','Kongo','KiKongo',0,0,0,0,NULL,NULL),(45,'kk','Kazakh','Қазақша',0,0,0,0,NULL,NULL),(46,'kl','Greenlandic','Kalaallisut',0,0,0,0,NULL,NULL),(47,'km','Cambodian','ភាសាខ្មែរ',0,0,0,0,NULL,NULL),(48,'ko','Korean','한국어',0,0,0,0,NULL,NULL),(49,'ku','Kurdish','Kurdî / كوردی',1,0,0,0,NULL,NULL),(50,'ky','Kirghiz','Kırgızca / Кыргызча',0,0,0,0,NULL,NULL),(51,'la','Latin','Latina',0,0,0,0,NULL,NULL),(52,'lb','Luxembourgish','Lëtzebuergesch',0,0,0,0,NULL,NULL),(53,'ln','Lingala','Lingála',0,0,0,0,NULL,NULL),(54,'lo','Laotian','ລາວ / Pha xa lao',0,0,0,0,NULL,NULL),(55,'lt','Lithuanian','Lietuvių',0,0,0,0,NULL,NULL),(56,'lu','Luxembourg','Luxembourg',0,0,0,0,NULL,NULL),(57,'lv','Latvian','Latviešu',0,0,0,0,NULL,NULL),(58,'mg','Malagasy','Malagasy',0,0,0,0,NULL,NULL),(59,'mh','Marshallese','Kajin Majel / Ebon',0,0,0,0,NULL,NULL),(60,'mi','Maori','Māori',0,0,0,0,NULL,NULL),(61,'mk','Macedonian','Македонски',0,0,0,0,NULL,NULL),(62,'mn','Mongolian','Монгол',0,0,0,0,NULL,NULL),(63,'ms','Malay','Bahasa Melayu',0,0,0,0,NULL,NULL),(64,'mt','Maltese','bil-Malti',0,0,0,0,NULL,NULL),(65,'my','Burmese','မြန်မာစာ',0,0,0,0,NULL,NULL),(66,'na','Nauruan','Dorerin Naoero',0,0,0,0,NULL,NULL),(67,'nb','Bokmål','Bokmål',0,0,0,0,NULL,NULL),(68,'nd','North Ndebele','Sindebele',0,0,0,0,NULL,NULL),(69,'ne','Nepali','नेपाली',0,0,0,0,NULL,NULL),(70,'nl','Dutch','Nederlands',0,0,0,0,NULL,NULL),(71,'nn','Norwegian Nynorsk','Norsk (nynorsk)',0,0,0,0,NULL,NULL),(72,'no','Norwegian','Norsk (bokmål / riksmål)',0,0,0,0,NULL,NULL),(73,'nr','South Ndebele','isiNdebele',0,0,0,0,NULL,NULL),(74,'ny','Chichewa','Chi-Chewa',0,0,0,0,NULL,NULL),(75,'oc','Occitan','Occitan',0,0,0,0,NULL,NULL),(76,'pa','Panjabi / Punjabi','ਪੰਜਾਬੀ / पंजाबी / پنجابي',0,0,0,0,NULL,NULL),(77,'pl','Polish','Polski',0,0,0,0,NULL,NULL),(78,'ps','Pashto','پښتو',1,0,0,0,NULL,NULL),(79,'pt','Portuguese','Português',0,0,0,0,NULL,NULL),(80,'qu','Quechua','Runa Simi',0,0,0,0,NULL,NULL),(81,'rn','Kirundi','Kirundi',0,0,0,0,NULL,NULL),(82,'ro','Romanian','Română',0,0,0,0,NULL,NULL),(83,'ru','Russian','Русский',0,0,0,0,NULL,NULL),(84,'rw','Rwandi','Kinyarwandi',0,0,0,0,NULL,NULL),(85,'sg','Sango','Sängö',0,0,0,0,NULL,NULL),(86,'si','Sinhalese','සිංහල',0,0,0,0,NULL,NULL),(87,'sk','Slovak','Slovenčina',0,0,0,0,NULL,NULL),(88,'sl','Slovenian','Slovenščina',0,0,0,0,NULL,NULL),(89,'sm','Samoan','Gagana Samoa',0,0,0,0,NULL,NULL),(90,'sn','Shona','chiShona',0,0,0,0,NULL,NULL),(91,'so','Somalia','Soomaaliga',0,0,0,0,NULL,NULL),(92,'sq','Albanian','Shqip',0,0,0,0,NULL,NULL),(93,'sr','Serbian','Српски',0,0,0,0,NULL,NULL),(94,'ss','Swati','SiSwati',0,0,0,0,NULL,NULL),(95,'st','Southern Sotho','Sesotho',0,0,0,0,NULL,NULL),(96,'sv','Swedish','Svenska',0,0,0,0,NULL,NULL),(97,'sw','Swahili','Kiswahili',0,0,0,0,NULL,NULL),(98,'ta','Tamil','தமிழ்',0,0,0,0,NULL,NULL),(99,'tg','Tajik','Тоҷикӣ',0,0,0,0,NULL,NULL),(100,'th','Thai','ไทย / Phasa Thai',0,0,0,0,NULL,NULL),(101,'ti','Tigrinya','ትግርኛ',0,0,0,0,NULL,NULL),(102,'tk','Turkmen','Туркмен /تركمن ',0,0,0,0,NULL,NULL),(103,'tn','Tswana','Setswana',0,0,0,0,NULL,NULL),(104,'to','Tonga','Lea Faka-Tonga',0,0,0,0,NULL,NULL),(105,'tr','Turkish','Türkçe',0,0,0,0,NULL,NULL),(106,'ts','Tsonga','Xitsonga',0,0,0,0,NULL,NULL),(107,'uk','Ukrainian','Українська',0,0,0,0,NULL,NULL),(108,'ur','Urdu','اردو',1,0,0,0,NULL,NULL),(109,'uz','Uzbek','Ўзбек',0,0,0,0,NULL,NULL),(110,'ve','Venda','Tshivenḓa',0,0,0,0,NULL,NULL),(111,'vi','Vietnamese','Tiếng Việt',0,0,0,0,NULL,NULL),(112,'xh','Xhosa','isiXhosa',0,0,0,0,NULL,NULL),(113,'zh','Chinese','中文',0,0,0,0,NULL,NULL),(114,'zu','Zulu','isiZulu',0,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `late_in_out_reasons`
--

DROP TABLE IF EXISTS `late_in_out_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `late_in_out_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `attendance_id` bigint unsigned NOT NULL,
  `type` enum('in','out') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in' COMMENT 'in = late in reason out = late out reason',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `late_in_out_reasons_company_id_foreign` (`company_id`),
  KEY `late_in_out_reasons_attendance_id_foreign` (`attendance_id`),
  CONSTRAINT `late_in_out_reasons_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `late_in_out_reasons_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `late_in_out_reasons`
--

LOCK TABLES `late_in_out_reasons` WRITE;
/*!40000 ALTER TABLE `late_in_out_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `late_in_out_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `assign_leave_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `apply_date` date NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `days` int NOT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  `substitute_id` bigint unsigned DEFAULT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL,
  `author_info_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_requests_company_id_foreign` (`company_id`),
  KEY `leave_requests_assign_leave_id_foreign` (`assign_leave_id`),
  KEY `leave_requests_user_id_foreign` (`user_id`),
  KEY `leave_requests_substitute_id_foreign` (`substitute_id`),
  KEY `leave_requests_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `leave_requests_status_id_foreign` (`status_id`),
  KEY `leave_requests_author_info_id_foreign` (`author_info_id`),
  CONSTRAINT `leave_requests_assign_leave_id_foreign` FOREIGN KEY (`assign_leave_id`) REFERENCES `assign_leaves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_requests_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `leave_requests_author_info_id_foreign` FOREIGN KEY (`author_info_id`) REFERENCES `author_infos` (`id`),
  CONSTRAINT `leave_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_requests_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `leave_requests_substitute_id_foreign` FOREIGN KEY (`substitute_id`) REFERENCES `users` (`id`),
  CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_settings`
--

DROP TABLE IF EXISTS `leave_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `sandwich_leave` tinyint(1) NOT NULL DEFAULT '0',
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `prorate_leave` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_settings_company_id_foreign` (`company_id`),
  CONSTRAINT `leave_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_settings`
--

LOCK TABLES `leave_settings` WRITE;
/*!40000 ALTER TABLE `leave_settings` DISABLE KEYS */;
INSERT INTO `leave_settings` VALUES (1,1,0,'1',0,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,2,0,'1',0,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `leave_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_types_company_id_foreign` (`company_id`),
  KEY `leave_types_status_id_foreign` (`status_id`),
  KEY `leave_types_name_status_id_index` (`name`,`status_id`),
  CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
INSERT INTO `leave_types` VALUES (1,1,'Casual Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(2,1,'Sick Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(3,1,'Maternity Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(4,1,'Paternity Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(5,1,'Leave Without Pay',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(6,2,'Casual Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(7,2,'Sick Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(8,2,'Maternity Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(9,2,'Paternity Leave',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(10,2,'Leave Without Pay',1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL);
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_binds`
--

DROP TABLE IF EXISTS `location_binds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_binds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `latitude` double DEFAULT NULL COMMENT 'latitude',
  `longitude` double DEFAULT NULL COMMENT 'longitude',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'address',
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_binds_user_id_foreign` (`user_id`),
  KEY `location_binds_company_id_foreign` (`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `location_binds_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `location_binds_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `location_binds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_binds`
--

LOCK TABLES `location_binds` WRITE;
/*!40000 ALTER TABLE `location_binds` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_binds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_logs`
--

DROP TABLE IF EXISTS `location_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `distance` double(10,2) DEFAULT NULL COMMENT 'in km',
  `latitude` double DEFAULT NULL COMMENT 'latitude',
  `longitude` double DEFAULT NULL COMMENT 'longitude',
  `speed` double DEFAULT NULL COMMENT 'speed',
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'heading',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'city',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'address',
  `countryCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'countryCode',
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Bangladesh' COMMENT 'country',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_logs_user_id_foreign` (`user_id`),
  KEY `location_logs_company_id_foreign` (`company_id`),
  KEY `location_logs_id_user_id_company_id_date_index` (`id`,`user_id`,`company_id`,`date`),
  CONSTRAINT `location_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `location_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_logs`
--

LOCK TABLES `location_logs` WRITE;
/*!40000 ALTER TABLE `location_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_members`
--

DROP TABLE IF EXISTS `meeting_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `is_present` tinyint NOT NULL DEFAULT '0',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `meeting_members_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_members`
--

LOCK TABLES `meeting_members` WRITE;
/*!40000 ALTER TABLE `meeting_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_participants`
--

DROP TABLE IF EXISTS `meeting_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_participants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` bigint unsigned NOT NULL,
  `meeting_id` bigint unsigned NOT NULL,
  `is_going` tinyint NOT NULL DEFAULT '0' COMMENT '0: Not going, 1: Going',
  `is_present` tinyint NOT NULL DEFAULT '0' COMMENT '0: Absent, 1: Present',
  `present_at` datetime DEFAULT NULL,
  `meeting_started_at` datetime DEFAULT NULL,
  `meeting_ended_at` datetime DEFAULT NULL,
  `meeting_duration` time DEFAULT NULL COMMENT 'Meeting duration in minutes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_participants_participant_id_foreign` (`participant_id`),
  KEY `meeting_participants_meeting_id_foreign` (`meeting_id`),
  CONSTRAINT `meeting_participants_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_participants_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_participants`
--

LOCK TABLES `meeting_participants` WRITE;
/*!40000 ALTER TABLE `meeting_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_setups`
--

DROP TABLE IF EXISTS `meeting_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `company_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_setups_company_id_foreign` (`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `meeting_setups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_setups`
--

LOCK TABLES `meeting_setups` WRITE;
/*!40000 ALTER TABLE `meeting_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `location` text COLLATE utf8mb4_unicode_ci,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meetings_company_id_foreign` (`company_id`),
  KEY `meetings_user_id_foreign` (`user_id`),
  KEY `meetings_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `meetings_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `meetings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `all_content_id` int DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '1=menu,2=footer',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `menus_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_information`
--

DROP TABLE IF EXISTS `meta_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('all_shop','all_brand','all_search','login','registration','student_registration','affiliate_registration','be_a_seller','compare_list','add_to_cart','about_us','faqs','contact_us','careers','return_refund','support_policy','privacy_policy','terms_condition') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_information_created_by_foreign` (`created_by`),
  KEY `meta_information_updated_by_foreign` (`updated_by`),
  KEY `meta_information_id_type_index` (`id`,`type`),
  CONSTRAINT `meta_information_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meta_information_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_information`
--

LOCK TABLES `meta_information` WRITE;
/*!40000 ALTER TABLE `meta_information` DISABLE KEYS */;
INSERT INTO `meta_information` VALUES (1,'all_shop','all_shop-title','all_shop-description','all_shop-image','all_shop-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(2,'all_brand','all_brand-title','all_brand-description','all_brand-image','all_brand-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(3,'all_search','all_search-title','all_search-description','all_search-image','all_search-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(4,'login','login-title','login-description','login-image','login-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(5,'registration','registration-title','registration-description','registration-image','registration-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(6,'student_registration','student_registration-title','student_registration-description','student_registration-image','student_registration-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(7,'affiliate_registration','affiliate_registration-title','affiliate_registration-description','affiliate_registration-image','affiliate_registration-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(8,'be_a_seller','be_a_seller-title','be_a_seller-description','be_a_seller-image','be_a_seller-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(9,'compare_list','compare_list-title','compare_list-description','compare_list-image','compare_list-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(10,'add_to_cart','add_to_cart-title','add_to_cart-description','add_to_cart-image','add_to_cart-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(11,'about_us','about_us-title','about_us-description','about_us-image','about_us-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(12,'faqs','faqs-title','faqs-description','faqs-image','faqs-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(13,'contact_us','contact_us-title','contact_us-description','contact_us-image','contact_us-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(14,'careers','careers-title','careers-description','careers-image','careers-keywors',NULL,NULL,'2022-09-10 03:33:25','2022-09-10 03:33:25');
/*!40000 ALTER TABLE `meta_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_10_11_000000_create_countries_table',1),(2,'2014_01_11_000000_create_statuses_table',1),(3,'2014_10_11_000001_create_activity_log_table',1),(4,'2014_10_11_000002_create_uploads_table',1),(5,'2014_10_11_000003_create_companies_table',1),(6,'2014_10_11_000004_create_roles_table',1),(7,'2014_10_11_000004_create_shifts_table',1),(8,'2014_10_11_000005_create_departments_table',1),(9,'2014_10_11_000005_create_designations_table',1),(10,'2014_10_12_000000_create_users_table',1),(11,'2014_10_12_000001_create_author_infos_table',1),(12,'2014_10_12_100000_create_password_resets_table',1),(13,'2019_05_03_000001_create_customer_columns',1),(14,'2019_05_03_000002_create_subscriptions_table',1),(15,'2019_05_03_000003_create_subscription_items_table',1),(16,'2019_08_19_000000_create_failed_jobs_table',1),(17,'2020_06_01_130821_create_settings_table',1),(18,'2020_06_01_130822_create_permissions_table',1),(19,'2020_06_01_130824_create_role_users_table',1),(20,'2021_09_24_050720_create_bank_accounts_table',1),(21,'2021_09_25_070000_create_payment_types_table',1),(22,'2021_09_25_080345_create_categories_table',1),(23,'2021_10_31_121218_create_translations_table',1),(24,'2021_11_03_044301_create_social_identities_table',1),(25,'2021_11_14_070513_create_notifications_old_table',1),(26,'2021_11_14_070607_create_conversations_table',1),(27,'2022_01_05_105820_create_leave_types_table',1),(28,'2022_01_05_111318_create_assign_leaves_table',1),(29,'2022_01_05_112116_create_leave_requests_table',1),(30,'2022_01_23_165353_create_weekends_table',1),(31,'2022_01_23_165357_create_holidays_table',1),(32,'2022_01_26_104953_create_duty_schedules_table',1),(33,'2022_02_07_144952_create_attendances_table',1),(34,'2022_02_07_175133_create_leave_settings_table',1),(35,'2022_02_10_151245_create_late_in_out_reasons_table',1),(36,'2022_03_01_174425_create_company_configs_table',1),(37,'2022_03_02_170908_create_ip_setups_table',1),(38,'2022_03_05_000002_create_expense_categories_table',1),(39,'2022_03_05_050001_create_payment_methods_table',1),(40,'2022_03_05_060051_create_accounts_table',1),(41,'2022_03_05_060052_create_transactions_table',1),(42,'2022_03_05_061025_create_expenses_table',1),(43,'2022_03_05_061055_create_deposits_table',1),(44,'2022_03_05_100003_create_hrm_expenses_table',1),(45,'2022_03_05_100004_create_expense_claims_table',1),(46,'2022_03_05_100006_create_expense_claim_details_table',1),(47,'2022_03_05_100007_create_payment_histories_table',1),(48,'2022_03_05_100008_create_payment_history_details_table',1),(49,'2022_03_05_100009_create_payment_history_logs_table',1),(50,'2022_03_06_101527_create_visits_table',1),(51,'2022_03_06_103136_create_visit_images_table',1),(52,'2022_03_06_104118_create_visit_notes_table',1),(53,'2022_03_06_104139_create_visit_schedules_table',1),(54,'2022_03_09_174416_create_subscription_plans_table',1),(55,'2022_03_10_110216_create_app_screens_table',1),(56,'2022_03_10_114654_create_support_tickets_table',1),(57,'2022_03_10_131726_create_notices_table',1),(58,'2022_03_10_132017_create_notice_view_logs_table',1),(59,'2022_03_12_114157_create_appreciates_table',1),(60,'2022_03_13_104916_create_meetings_table',1),(61,'2022_03_13_112149_create_meeting_participants_table',1),(62,'2022_03_13_112853_create_appoinments_table',1),(63,'2022_03_13_112914_create_appoinment_participants_table',1),(64,'2022_03_13_113319_create_employee_tasks_table',1),(65,'2022_03_13_123151_create_employee_breaks_table',1),(66,'2022_03_15_131235_create_all_contents_table',1),(67,'2022_03_16_104248_create_contacts_table',1),(68,'2022_03_30_061715_create_features_table',1),(69,'2022_03_30_113900_create_testimonials_table',1),(70,'2022_03_31_140233_create_teams_table',1),(71,'2022_03_31_140552_create_team_members_table',1),(72,'2022_04_06_042459_create_sms_logs_table',1),(73,'2022_04_07_035721_create_user_devices_table',1),(74,'2022_04_07_044946_create_notification_types_table',1),(75,'2022_04_12_065957_create_ticket_replies_table',1),(76,'2022_05_16_071031_create_notifications_table',1),(77,'2022_05_17_062749_create_daily_leaves_table',1),(78,'2022_05_19_055538_create_notice_departments_table',1),(79,'2022_06_05_101104_create_meta_information_table',1),(80,'2022_06_09_093509_create_time_zones_table',1),(81,'2022_06_11_075042_create_date_formats_table',1),(82,'2022_06_12_080741_create_api_setups_table',1),(83,'2022_06_12_100839_create_currencies_table',1),(84,'2022_06_15_090457_create_advance_types_table',1),(85,'2022_06_15_130017_create_advance_salaries_table',1),(86,'2022_06_15_131620_create_advance_salary_logs_table',1),(87,'2022_06_16_115529_create_commissions_table',1),(88,'2022_06_16_122623_create_salary_setups_table',1),(89,'2022_06_16_122641_create_salary_setup_details_table',1),(90,'2022_06_16_122709_create_salary_generates_table',1),(91,'2022_06_16_122750_create_salary_payment_logs_table',1),(92,'2022_06_18_154114_create_languages_table',1),(93,'2022_06_18_155339_create_hrm_languages_table',1),(94,'2022_06_21_055621_add_lang_column_to_users_table',1),(95,'2022_06_23_030258_create_location_logs_table',1),(96,'2022_06_25_080155_create_database_backups_table',1),(97,'2022_06_27_115744_create_meeting_setups_table',1),(98,'2022_06_27_121222_create_virtual_meetings_table',1),(99,'2022_06_27_121626_create_meeting_members_table',1),(100,'2022_06_27_123238_create_jitsi_meetings_table',1),(101,'2022_07_18_113807_database_updates_for_v_3_1',1),(102,'2022_07_21_132450_create_location_binds_table',1),(103,'2022_07_25_160849_create_clients_table',1),(104,'2022_07_25_160850_create_goal_types_table',1),(105,'2022_07_25_160851_create_goals_table',1),(106,'2022_07_26_160617_create_projects_table',1),(107,'2022_07_26_160618_create_project_membars_table',1),(108,'2022_07_26_165806_create_discussions_table',1),(109,'2022_07_26_165807_create_discussion_comments_table',1),(110,'2022_07_26_165908_create_notes_table',1),(111,'2022_07_26_170007_create_project_files_table',1),(112,'2022_07_26_170008_create_project_file_comments_table',1),(113,'2022_07_26_170031_create_project_activities_table',1),(114,'2022_07_26_170205_create_project_payments_table',1),(115,'2022_08_01_140657_create_tasks_table',1),(116,'2022_08_01_140658_create_task_members_table',1),(117,'2022_08_01_141239_create_task_discussions_table',1),(118,'2022_08_01_141255_create_task_discussion_comments_table',1),(119,'2022_08_01_141323_create_task_notes_table',1),(120,'2022_08_01_141341_create_task_files_table',1),(121,'2022_08_01_141401_create_task_file_comments_table',1),(122,'2022_08_01_142250_create_task_activities_table',1),(123,'2022_08_03_130453_create_award_types_table',1),(124,'2022_08_03_130519_create_awards_table',1),(125,'2022_08_04_101142_create_travel_types_table',1),(126,'2022_08_04_101522_create_travel_table',1),(127,'2022_08_04_161248_create_competence_types_table',1),(128,'2022_08_04_161249_create_competences_table',1),(129,'2022_08_04_161325_create_indicators_table',1),(130,'2022_08_04_161344_create_appraisals_table',1),(131,'2022_08_10_132731_database_update_for_v33',1),(132,'2022_09_04_172317_add_is_default_column_to_languages_table',1),(133,'2022_09_19_104223_create_services_table',2),(134,'2022_09_19_104344_create_portfolios_table',2),(135,'2022_09_19_105655_create_front_teams_table',2),(136,'2022_09_19_112019_create_menus_table',2),(137,'2022_09_19_112527_create_home_pages_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` bigint unsigned NOT NULL DEFAULT '22',
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_company_id_foreign` (`company_id`),
  KEY `notes_project_id_foreign` (`project_id`),
  KEY `notes_user_id_foreign` (`user_id`),
  KEY `notes_id_project_id_company_id_status_id_user_id_index` (`id`,`project_id`,`company_id`,`status_id`,`user_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notes_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `notes_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_departments`
--

DROP TABLE IF EXISTS `notice_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `noticeable_id` int NOT NULL,
  `noticeable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_departments`
--

LOCK TABLES `notice_departments` WRITE;
/*!40000 ALTER TABLE `notice_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_view_logs`
--

DROP TABLE IF EXISTS `notice_view_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_view_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `notice_id` bigint unsigned NOT NULL,
  `is_view` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notice_view_logs_company_id_foreign` (`company_id`),
  KEY `notice_view_logs_user_id_foreign` (`user_id`),
  KEY `notice_view_logs_notice_id_foreign` (`notice_id`),
  CONSTRAINT `notice_view_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `notice_view_logs_notice_id_foreign` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`),
  CONSTRAINT `notice_view_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_view_logs`
--

LOCK TABLES `notice_view_logs` WRITE;
/*!40000 ALTER TABLE `notice_view_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_view_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_by` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notices_created_by_foreign` (`created_by`),
  KEY `notices_company_id_foreign` (`company_id`),
  KEY `notices_department_id_foreign` (`department_id`),
  KEY `notices_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `notices_status_id_foreign` (`status_id`),
  CONSTRAINT `notices_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `notices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `notices_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `notices_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `icon` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_types_type_unique` (`type`),
  KEY `notification_types_icon_foreign` (`icon`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `notification_types_icon_foreign` FOREIGN KEY (`icon`) REFERENCES `uploads` (`id`),
  CONSTRAINT `notification_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_types`
--

LOCK TABLES `notification_types` WRITE;
/*!40000 ALTER TABLE `notification_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_old`
--

DROP TABLE IF EXISTS `notifications_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_old` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `receiver_id` bigint unsigned DEFAULT NULL,
  `type` enum('notification','message') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'notification' COMMENT 'notification: notification, message: message',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `image_id` bigint unsigned DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_old_sender_id_foreign` (`sender_id`),
  KEY `notifications_old_receiver_id_foreign` (`receiver_id`),
  KEY `notifications_old_image_id_foreign` (`image_id`),
  CONSTRAINT `notifications_old_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_old_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_old_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_old`
--

LOCK TABLES `notifications_old` WRITE;
/*!40000 ALTER TABLE `notifications_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_histories`
--

DROP TABLE IF EXISTS `payment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `expense_claim_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'invoice number',
  `payment_date` date DEFAULT NULL COMMENT 'date of payment',
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'remarks of payment',
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'amount of payment',
  `paid_amount` double(10,2) DEFAULT NULL COMMENT 'paid amount of payment',
  `due_amount` double(10,2) DEFAULT NULL COMMENT 'due amount of payment',
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `payment_status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_histories_code_unique` (`code`),
  KEY `payment_histories_company_id_foreign` (`company_id`),
  KEY `payment_histories_user_id_foreign` (`user_id`),
  KEY `payment_histories_expense_claim_id_foreign` (`expense_claim_id`),
  KEY `payment_histories_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`payment_status_id`),
  CONSTRAINT `payment_histories_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_histories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_histories_expense_claim_id_foreign` FOREIGN KEY (`expense_claim_id`) REFERENCES `expense_claims` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_histories_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `payment_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_histories`
--

LOCK TABLES `payment_histories` WRITE;
/*!40000 ALTER TABLE `payment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history_details`
--

DROP TABLE IF EXISTS `payment_history_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `payment_history_id` bigint unsigned NOT NULL,
  `payment_method_id` bigint unsigned NOT NULL,
  `payment_details` longtext COLLATE utf8mb4_unicode_ci COMMENT 'remarks of payment',
  `payment_status_id` bigint unsigned NOT NULL,
  `payment_date` date DEFAULT NULL COMMENT 'date of payment',
  `paid_by_id` bigint unsigned DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bank name',
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bank branch',
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bank account number',
  `bank_account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bank account name',
  `bank_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bank transaction number',
  `bank_transaction_date` date DEFAULT NULL COMMENT 'bank transaction date',
  `bank_transaction_ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'bank transaction ref',
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cheque number',
  `cheque_date` date DEFAULT NULL COMMENT 'cheque date',
  `cheque_bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cheque bank name',
  `cheque_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cheque branch',
  `cheque_ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cheque ref',
  `cash_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cash number',
  `cash_date` date DEFAULT NULL COMMENT 'cash date',
  `cash_ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cash ref',
  `paid_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `due_amount` double(15,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_history_details_company_id_foreign` (`company_id`),
  KEY `payment_history_details_user_id_foreign` (`user_id`),
  KEY `payment_history_details_payment_history_id_foreign` (`payment_history_id`),
  KEY `payment_history_details_payment_method_id_foreign` (`payment_method_id`),
  KEY `payment_history_details_paid_by_id_foreign` (`paid_by_id`),
  KEY `payment_status_id` (`payment_status_id`),
  CONSTRAINT `payment_history_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_details_paid_by_id_foreign` FOREIGN KEY (`paid_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_details_payment_history_id_foreign` FOREIGN KEY (`payment_history_id`) REFERENCES `payment_histories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_details_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_details_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `payment_history_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history_details`
--

LOCK TABLES `payment_history_details` WRITE;
/*!40000 ALTER TABLE `payment_history_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_history_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history_logs`
--

DROP TABLE IF EXISTS `payment_history_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `payment_history_id` bigint unsigned NOT NULL,
  `expense_claim_id` bigint unsigned NOT NULL,
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'amount of payment',
  `paid_amount` double(10,2) DEFAULT NULL COMMENT 'paid amount of payment',
  `due_amount` double(10,2) DEFAULT NULL COMMENT 'due amount of payment',
  `date` date DEFAULT NULL,
  `paid_by_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_history_logs_user_id_foreign` (`user_id`),
  KEY `payment_history_logs_company_id_foreign` (`company_id`),
  KEY `payment_history_logs_payment_history_id_foreign` (`payment_history_id`),
  KEY `payment_history_logs_expense_claim_id_foreign` (`expense_claim_id`),
  KEY `payment_history_logs_paid_by_id_foreign` (`paid_by_id`),
  CONSTRAINT `payment_history_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_logs_expense_claim_id_foreign` FOREIGN KEY (`expense_claim_id`) REFERENCES `expense_claims` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_logs_paid_by_id_foreign` FOREIGN KEY (`paid_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_logs_payment_history_id_foreign` FOREIGN KEY (`payment_history_id`) REFERENCES `payment_histories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history_logs`
--

LOCK TABLES `payment_history_logs` WRITE;
/*!40000 ALTER TABLE `payment_history_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_history_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_methods_company_id_foreign` (`company_id`),
  KEY `payment_methods_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `payment_methods_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_methods_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,1,'Cash',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(2,2,'Cash',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(3,1,'Cheque',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(4,2,'Cheque',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(5,1,'Bank Transfer',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(6,2,'Bank Transfer',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(7,1,'Credit Card',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(8,2,'Credit Card',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(9,1,'Debit Card',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(10,2,'Debit Card',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(11,1,'Paypal',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(12,2,'Paypal',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(13,1,'Stripe',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(14,2,'Stripe',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(15,1,'Payoneer',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(16,2,'Payoneer',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(17,1,'Paytm',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(18,2,'Paytm',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(19,1,'Amazon Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(20,2,'Amazon Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(21,1,'Google Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(22,2,'Google Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(23,1,'Apple Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(24,2,'Apple Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(25,1,'Phone Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(26,2,'Phone Pay',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(27,1,'Other',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL),(28,2,'Other',NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '1 - cash, 2 - credit card, 3 - debit card, 4 - bank',
  `status_id` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_types_status_id_index` (`status_id`),
  CONSTRAINT `payment_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'hr_menu','{\"menu\":\"hr_menu\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,'designations','{\"read\":\"designation_read\",\"create\":\"designation_create\",\"update\":\"designation_update\",\"delete\":\"designation_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(3,'departments','{\"read\":\"department_read\",\"create\":\"department_create\",\"update\":\"department_update\",\"delete\":\"department_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(4,'users','{\"read\":\"user_read\",\"profile\":\"profile_view\",\"create\":\"user_create\",\"edit\":\"user_edit\",\"update\":\"user_update\",\"delete\":\"user_delete\",\"menu\":\"user_menu\",\"make_hr\":\"make_hr\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(5,'roles','{\"read\":\"role_read\",\"create\":\"role_create\",\"update\":\"role_update\",\"delete\":\"role_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(6,'leave_type','{\"read\":\"leave_type_read\",\"create\":\"leave_type_create\",\"update\":\"leave_type_update\",\"delete\":\"leave_type_delete\",\"menu\":\"leave_menu\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(7,'leave_assign','{\"read\":\"leave_assign_read\",\"create\":\"leave_assign_create\",\"update\":\"leave_assign_update\",\"delete\":\"leave_assign_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(8,'leave_request','{\"read\":\"leave_request_read\",\"update\":\"leave_request_update\",\"store\":\"leave_request_store\",\"create\":\"leave_request_create\",\"approve\":\"leave_request_approve\",\"reject\":\"leave_request_reject\",\"delete\":\"leave_request_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(9,'weekend','{\"read\":\"wekeend_read\",\"update\":\"wekeend_update\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(10,'holiday','{\"read\":\"holiday_read\",\"create\":\"holiday_create\",\"update\":\"holiday_update\",\"delete\":\"holiday_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(11,'schedule','{\"read\":\"schedule_read\",\"create\":\"schedule_create\",\"update\":\"schedule_update\",\"delete\":\"schedule_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(12,'attendance','{\"read\":\"attendance_read\",\"create\":\"attendance_create\",\"update\":\"attendance_update\",\"delete\":\"attendance_delete\",\"menu\":\"attendance_menu\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(13,'shift','{\"read\":\"shift_read\",\"create\":\"shift_create\",\"update\":\"shift_update\",\"delete\":\"shift_delete\",\"menu\":\"shift_menu\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(14,'payroll','{\"menu\":\"payroll_menu\",\"payroll_item read\":\"list_payroll_item\",\"payroll_item create\":\"create_payroll_item\",\"payroll_item store\":\"store_payroll_item\",\"payroll_item edit\":\"edit_payroll_item\",\"payroll_item update\":\"update_payroll_item\",\"payroll_item delete\":\"delete_payroll_item\",\"payroll_item view\":\"view_payroll_item\",\"payroll_item menu\":\"payroll_item_menu\",\"list_payroll_set \":\"list_payroll_set\",\"create_payroll_set\":\"create_payroll_set\",\"store_payroll_set\":\"store_payroll_set\",\"edit_payroll_set\":\"edit_payroll_set\",\"update_payroll_set\":\"update_payroll_set\",\"delete_payroll_set\":\"delete_payroll_set\",\"view_payroll_set\":\"view_payroll_set\",\"payroll_set_menu\":\"payroll_set_menu\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(15,'payslip','{\"menu\":\"payslip_menu\",\"salary_generate\":\"salary_generate\",\"salary_view\":\"salary_view\",\"salary_delete\":\"salary_delete\",\"salary_edit\":\"salary_edit\",\"salary_update\":\"salary_update\",\"salary_payment\":\"salary_payment\",\"payslip_list\":\"payslip_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(16,'advance_type','{\"menu\":\"advance_type_menu\",\"advance_type_create\":\"advance_type_create\",\"advance_type_store\":\"advance_type_store\",\"advance_type_edit\":\"advance_type_edit\",\"advance_type_update\":\"advance_type_update\",\"advance_type_delete\":\"advance_type_delete\",\"advance_type_view\":\"advance_type_view\",\"advance_type_list\":\"advance_type_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(17,'advance_pay','{\"menu\":\"advance_salaries_menu\",\"advance_salaries_create\":\"advance_salaries_create\",\"advance_salaries_store\":\"advance_salaries_store\",\"advance_salaries_edit\":\"advance_salaries_edit\",\"advance_salaries_update\":\"advance_salaries_update\",\"advance_salaries_delete\":\"advance_salaries_delete\",\"advance_salaries_view\":\"advance_salaries_view\",\"advance_salaries_approve\":\"advance_salaries_approve\",\"advance_salaries_list\":\"advance_salaries_list\",\"advance_salaries_pay\":\"advance_salaries_pay\",\"advance_salaries_invoice\":\"advance_salaries_invoice\",\"advance_salaries_search\":\"advance_salaries_search\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(18,'salary','{\"menu\":\"salary_menu\",\"salary_store\":\"salary_store\",\"salary_edit\":\"salary_edit\",\"salary_update\":\"salary_update\",\"salary_delete\":\"salary_delete\",\"salary_view\":\"salary_view\",\"salary_list\":\"salary_list\",\"salary_pay\":\"salary_pay\",\"salary_invoice\":\"salary_invoice\",\"salary_approve\":\"salary_approve\",\"salary_generate\":\"salary_generate\",\"salary_calculate\":\"salary_calculate\",\"salary_search\":\"salary_search\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(19,'account','{\"menu\":\"account_menu\",\"account_create\":\"account_create\",\"account_store\":\"account_store\",\"account_edit\":\"account_edit\",\"account_update\":\"account_update\",\"account_delete\":\"account_delete\",\"account_view\":\"account_view\",\"account_list\":\"account_list\",\"account_search\":\"account_search\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(20,'deposit','{\"menu\":\"deposit_menu\",\"deposit_create\":\"deposit_create\",\"deposit_store\":\"deposit_store\",\"deposit_edit\":\"deposit_edit\",\"deposit_update\":\"deposit_update\",\"deposit_delete\":\"deposit_delete\",\"deposit_list\":\"deposit_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(21,'expense','{\"menu\":\"expense_menu\",\"expense_create\":\"expense_create\",\"expense_store\":\"expense_store\",\"expense_edit\":\"expense_edit\",\"expense_update\":\"expense_update\",\"expense_delete\":\"expense_delete\",\"expense_list\":\"expense_list\",\"expense_approve\":\"expense_approve\",\"expense_invoice\":\"expense_invoice\",\"expense_pay\":\"expense_pay\",\"expense_view\":\"expense_view\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(22,'deposit_category','{\"menu\":\"deposit_category_menu\",\"deposit_category_create\":\"deposit_category_create\",\"deposit_category_store\":\"deposit_category_store\",\"deposit_category_edit\":\"deposit_category_edit\",\"deposit_category_update\":\"deposit_category_update\",\"deposit_category_delete\":\"deposit_category_delete\",\"deposit_category_list\":\"deposit_category_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(23,'payment_method','{\"menu\":\"payment_method_menu\",\"payment_method_create\":\"payment_method_create\",\"payment_method_store\":\"payment_method_store\",\"payment_method_edit\":\"payment_method_edit\",\"payment_method_update\":\"payment_method_update\",\"payment_method_delete\":\"payment_method_delete\",\"payment_method_list\":\"payment_method_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(24,'transaction','{\"menu\":\"transaction_menu\",\"transaction_create\":\"transaction_create\",\"transaction_store\":\"transaction_store\",\"transaction_edit\":\"transaction_edit\",\"transaction_update\":\"transaction_update\",\"transaction_delete\":\"transaction_delete\",\"transaction_view\":\"transaction_view\",\"transaction_list\":\"transaction_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(25,'project','{\"menu\":\"project_menu\",\"project_create\":\"project_create\",\"project_store\":\"project_store\",\"project_edit\":\"project_edit\",\"project_update\":\"project_update\",\"project_delete\":\"project_delete\",\"project_view\":\"project_view\",\"project_list\":\"project_list\",\"project_activity_view\":\"project_activity_view\",\"project_member_view\":\"project_member_view\",\"project_member_delete\":\"project_member_delete\",\"project_complete\":\"project_complete\",\"project_payment\":\"project_payment\",\"project_invoice_view\":\"project_invoice_view\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(26,'project_discussion','{\"project_discussion_create\":\"project_discussion_create\",\"project_discussion_store\":\"project_discussion_store\",\"project_discussion_edit\":\"project_discussion_edit\",\"project_discussion_update\":\"project_discussion_update\",\"project_discussion_delete\":\"project_discussion_delete\",\"project_discussion_view\":\"project_discussion_view\",\"project_discussion_list\":\"project_discussion_list\",\"project_discussion_comment\":\"project_discussion_comment\",\"project_discussion_reply\":\"project_discussion_reply\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(27,'project_file','{\"project_file_create\":\"project_file_create\",\"project_file_store\":\"project_file_store\",\"project_file_edit\":\"project_file_edit\",\"project_file_update\":\"project_file_update\",\"project_file_delete\":\"project_file_delete\",\"project_file_view\":\"project_file_view\",\"project_file_list\":\"project_file_list\",\"project_file_download\":\"project_file_download\",\"project_file_comment\":\"project_file_comment\",\"project_file_reply\":\"project_file_reply\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(28,'project_notes','{\"project_notes_create\":\"project_notes_create\",\"project_notes_store\":\"project_notes_store\",\"project_notes_edit\":\"project_notes_edit\",\"project_notes_update\":\"project_notes_update\",\"project_notes_delete\":\"project_notes_delete\",\"project_notes_list\":\"project_notes_list\",\"project_files_comment\":\"project_files_comment\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(29,'task','{\"menu\":\"task_menu\",\"task_create\":\"task_create\",\"task_store\":\"task_store\",\"task_edit\":\"task_edit\",\"task_update\":\"task_update\",\"task_delete\":\"task_delete\",\"task_view\":\"task_view\",\"task_list\":\"task_list\",\"task_activity_view\":\"task_activity_view\",\"task_assign_view\":\"task_assign_view\",\"task_assign_delete\":\"task_assign_delete\",\"task_complete\":\"task_complete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(30,'task_discussion','{\"task_discussion_create\":\"task_discussion_create\",\"task_discussion_store\":\"task_discussion_store\",\"task_discussion_edit\":\"task_discussion_edit\",\"task_discussion_update\":\"task_discussion_update\",\"task_discussion_delete\":\"task_discussion_delete\",\"task_discussion_view\":\"task_discussion_view\",\"task_discussion_list\":\"task_discussion_list\",\"task_discussion_comment\":\"task_discussion_comment\",\"task_discussion_reply\":\"task_discussion_reply\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(31,'task_file','{\"task_file_create\":\"task_file_create\",\"task_file_store\":\"task_file_store\",\"task_file_edit\":\"task_file_edit\",\"task_file_update\":\"task_file_update\",\"task_file_delete\":\"task_file_delete\",\"task_file_view\":\"task_file_view\",\"task_file_list\":\"task_file_list\",\"task_file_download\":\"task_file_download\",\"task_file_comment\":\"task_file_comment\",\"task_file_reply\":\"task_file_reply\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(32,'task_notes','{\"task_notes_create\":\"task_notes_create\",\"task_notes_store\":\"task_notes_store\",\"task_notes_edit\":\"task_notes_edit\",\"task_notes_update\":\"task_notes_update\",\"task_notes_delete\":\"task_notes_delete\",\"task_notes_list\":\"task_notes_list\",\"task_files_comment\":\"task_files_comment\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(33,'award_type','{\"menu\":\"award_type_menu\",\"award_type_create\":\"award_type_create\",\"award_type_store\":\"award_type_store\",\"award_type_edit\":\"award_type_edit\",\"award_type_update\":\"award_type_update\",\"award_type_delete\":\"award_type_delete\",\"award_type_list\":\"award_type_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(34,'award','{\"menu\":\"award_menu\",\"award_create\":\"award_create\",\"award_store\":\"award_store\",\"award_edit\":\"award_edit\",\"award_update\":\"award_update\",\"award_delete\":\"award_delete\",\"award_view\":\"award_view\",\"award_list\":\"award_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(35,'travel_type','{\"menu\":\"travel_type_menu\",\"travel_type_create\":\"travel_type_create\",\"travel_type_store\":\"travel_type_store\",\"travel_type_edit\":\"travel_type_edit\",\"travel_type_update\":\"travel_type_update\",\"travel_type_delete\":\"travel_type_delete\",\"travel_type_list\":\"travel_type_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(36,'travel','{\"menu\":\"travel_menu\",\"travel_create\":\"travel_create\",\"travel_store\":\"travel_store\",\"travel_edit\":\"travel_edit\",\"travel_update\":\"travel_update\",\"travel_delete\":\"travel_delete\",\"travel_view\":\"travel_view\",\"travel_list\":\"travel_list\",\"travel_approve\":\"travel_approve\",\"travel_payment\":\"travel_payment\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(37,'performance','{\"menu\":\"performance_menu\",\"settings\":\"performance_settings\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(38,'performance_indicator','{\"menu\":\"performance_indicator_menu\",\"performance_indicator_create\":\"performance_indicator_create\",\"performance_indicator_store\":\"performance_indicator_store\",\"performance_indicator_edit\":\"performance_indicator_edit\",\"performance_indicator_update\":\"performance_indicator_update\",\"performance_indicator_delete\":\"performance_indicator_delete\",\"performance_indicator_list\":\"performance_indicator_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(39,'performance_appraisal','{\"menu\":\"performance_appraisal_menu\",\"performance_appraisal_create\":\"performance_appraisal_create\",\"performance_appraisal_store\":\"performance_appraisal_store\",\"performance_appraisal_edit\":\"performance_appraisal_edit\",\"performance_appraisal_update\":\"performance_appraisal_update\",\"performance_appraisal_delete\":\"performance_appraisal_delete\",\"performance_appraisal_list\":\"performance_appraisal_list\",\"performance_appraisal_view\":\"performance_appraisal_view\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(40,'performance_goal_type','{\"menu\":\"performance_goal_type_menu\",\"performance_goal_type_create\":\"performance_goal_type_create\",\"performance_goal_type_store\":\"performance_goal_type_store\",\"performance_goal_type_edit\":\"performance_goal_type_edit\",\"performance_goal_type_update\":\"performance_goal_type_update\",\"performance_goal_type_delete\":\"performance_goal_type_delete\",\"performance_goal_type_list\":\"performance_goal_type_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(41,'performance_goal','{\"menu\":\"performance_goal_menu\",\"performance_goal_create\":\"performance_goal_create\",\"performance_goal_store\":\"performance_goal_store\",\"performance_goal_edit\":\"performance_goal_edit\",\"performance_goal_update\":\"performance_goal_update\",\"performance_goal_delete\":\"performance_goal_delete\",\"performance_goal_view\":\"performance_goal_view\",\"performance_goal_list\":\"performance_goal_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(42,'performance_competence_type','{\"menu\":\"performance_competence_type_menu\",\"performance_competence_type_create\":\"performance_competence_type_create\",\"performance_competence_type_store\":\"performance_competence_type_store\",\"performance_competence_type_edit\":\"performance_competence_type_edit\",\"performance_competence_type_update\":\"performance_competence_type_update\",\"performance_competence_type_delete\":\"performance_competence_type_delete\",\"performance_competence_type_list\":\"performance_competence_type_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(43,'performance_competence','{\"menu\":\"performance_competence_menu\",\"performance_competence_create\":\"performance_competence_create\",\"performance_competence_store\":\"performance_competence_store\",\"performance_competence_edit\":\"performance_competence_edit\",\"performance_competence_update\":\"performance_competence_update\",\"performance_competence_delete\":\"performance_competence_delete\",\"performance_competence_list\":\"performance_competence_list\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(44,'report','{\"attendance_report\":\"attendance_report_read\",\"live_tracking_read\":\"live_tracking_read\",\"menu\":\"report_menu\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(45,'leave_settings','{\"read\":\"leave_settings_read\",\"update\":\"leave_settings_update\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(46,'ip','{\"read\":\"ip_read\",\"create\":\"ip_create\",\"update\":\"ip_update\",\"delete\":\"ip_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(47,'company_setup','{\"menu\":\"company_setup_menu\",\"activation_read\":\"company_setup_activation\",\"activation_update\":\"company_setup_activation_update\",\"configuration_read\":\"company_setup_configuration\",\"configuration_update\":\"company_setup_configuration_update\",\"ip_whitelist_read\":\"company_setup_ip_whitelist\",\"location_read\":\"company_setup_location\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(48,'location','{\"location_create\":\"location_create\",\"location_store\":\"location_store\",\"location_edit\":\"location_edit\",\"location_update\":\"location_update\",\"location_delete\":\"location_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(49,'api_setup','{\"read\":\"locationApi\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(50,'claim','{\"read\":\"claim_read\",\"create\":\"claim_create\",\"update\":\"claim_update\",\"delete\":\"claim_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(51,'payment','{\"read\":\"payment_read\",\"create\":\"payment_create\",\"update\":\"payment_update\",\"delete\":\"payment_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(52,'visit','{\"menu\":\"visit_menu\",\"read\":\"visit_read\",\"update\":\"visit_update\",\"view\":\"visit_view\"}','2022-09-10 03:33:32','2022-09-10 03:33:32'),(53,'support','{\"support_menu\":\"support_menu\",\"support_read\":\"support_read\",\"support_create\":\"support_create\",\"support_reply\":\"support_reply\",\"support_delete\":\"support_delete\"}','2022-09-10 03:33:32','2022-09-10 03:33:32');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolios_attachment_foreign` (`attachment`),
  KEY `portfolios_user_id_foreign` (`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `portfolios_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `portfolios_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `portfolios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_activities`
--

DROP TABLE IF EXISTS `project_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_activities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_activities_company_id_foreign` (`company_id`),
  KEY `project_activities_project_id_foreign` (`project_id`),
  KEY `project_activities_user_id_foreign` (`user_id`),
  KEY `project_activities_id_project_id_company_id_user_id_index` (`id`,`project_id`,`company_id`,`user_id`),
  CONSTRAINT `project_activities_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_activities_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_activities`
--

LOCK TABLES `project_activities` WRITE;
/*!40000 ALTER TABLE `project_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_file_comments`
--

DROP TABLE IF EXISTS `project_file_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_file_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` tinyint NOT NULL DEFAULT '1' COMMENT '0=no,1=yes',
  `project_file_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_file_comments_company_id_foreign` (`company_id`),
  KEY `project_file_comments_project_file_id_foreign` (`project_file_id`),
  KEY `project_file_comments_user_id_foreign` (`user_id`),
  KEY `project_file_comments_attachment_foreign` (`attachment`),
  KEY `project_file_comments_id_project_file_id_user_id_index` (`id`,`project_file_id`,`user_id`),
  CONSTRAINT `project_file_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `project_file_comments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_file_comments_project_file_id_foreign` FOREIGN KEY (`project_file_id`) REFERENCES `project_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_file_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_file_comments`
--

LOCK TABLES `project_file_comments` WRITE;
/*!40000 ALTER TABLE `project_file_comments` DISABLE KEYS */;
INSERT INTO `project_file_comments` VALUES (1,NULL,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,4,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,1,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,3,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `project_file_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` bigint unsigned NOT NULL DEFAULT '22',
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_files_company_id_foreign` (`company_id`),
  KEY `project_files_project_id_foreign` (`project_id`),
  KEY `project_files_user_id_foreign` (`user_id`),
  KEY `project_files_attachment_foreign` (`attachment`),
  KEY `project_files_id_project_id_company_id_status_id_user_id_index` (`id`,`project_id`,`company_id`,`status_id`,`user_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `project_files_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `project_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_files_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `project_files_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_files`
--

LOCK TABLES `project_files` WRITE;
/*!40000 ALTER TABLE `project_files` DISABLE KEYS */;
INSERT INTO `project_files` VALUES (1,2,'Demo File',22,1,3,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_membars`
--

DROP TABLE IF EXISTS `project_membars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_membars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `added_by` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_membars_company_id_foreign` (`company_id`),
  KEY `project_membars_project_id_foreign` (`project_id`),
  KEY `project_membars_user_id_foreign` (`user_id`),
  KEY `project_membars_added_by_foreign` (`added_by`),
  KEY `project_membars_id_project_id_company_id_status_id_user_id_index` (`id`,`project_id`,`company_id`,`status_id`,`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `project_membars_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_membars_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_membars_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_membars_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `project_membars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_membars`
--

LOCK TABLES `project_membars` WRITE;
/*!40000 ALTER TABLE `project_membars` DISABLE KEYS */;
INSERT INTO `project_membars` VALUES (1,2,1,4,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `project_membars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_payments`
--

DROP TABLE IF EXISTS `project_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `project_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `paid_by` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_payments_project_id_foreign` (`project_id`),
  KEY `project_payments_company_id_foreign` (`company_id`),
  KEY `project_payments_id_amount_index` (`id`,`amount`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `paid_by` (`paid_by`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `project_payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_payments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `project_payments_paid_by_foreign` FOREIGN KEY (`paid_by`) REFERENCES `clients` (`id`),
  CONSTRAINT `project_payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `project_payments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `project_payments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_payments`
--

LOCK TABLES `project_payments` WRITE;
/*!40000 ALTER TABLE `project_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `progress_from_tasks` int DEFAULT '1',
  `progress` int DEFAULT '0',
  `billing_type` enum('hourly','fixed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_rate` double(16,2) DEFAULT NULL,
  `total_rate` double(16,2) DEFAULT NULL,
  `estimated_hour` double(16,2) DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '24',
  `priority` bigint unsigned NOT NULL DEFAULT '24',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `payment` bigint unsigned NOT NULL DEFAULT '9',
  `amount` double(16,2) DEFAULT NULL,
  `paid` double(16,2) NOT NULL DEFAULT '0.00',
  `due` double(16,2) NOT NULL DEFAULT '0.00',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `notify_all_users` tinyint NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `notify_all_users_email` tinyint NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `goal_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_client_id_foreign` (`client_id`),
  KEY `projects_company_id_foreign` (`company_id`),
  KEY `projects_goal_id_foreign` (`goal_id`),
  KEY `projects_id_client_id_company_id_status_id_index` (`id`,`client_id`,`company_id`,`status_id`),
  KEY `status_id` (`status_id`),
  KEY `priority` (`priority`),
  KEY `payment` (`payment`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_payment_foreign` FOREIGN KEY (`payment`) REFERENCES `statuses` (`id`),
  CONSTRAINT `projects_priority_foreign` FOREIGN KEY (`priority`) REFERENCES `statuses` (`id`),
  CONSTRAINT `projects_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'eCommerce Project','1',1,2,'2022-09-10',1,1,'hourly',15.00,0.00,300.00,26,29,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','2022-09-10','2022-10-10',9,4500.00,0.00,4500.00,2,0,0,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_foreign` (`user_id`),
  KEY `role_users_role_id_foreign` (`role_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
INSERT INTO `role_users` VALUES (1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,2,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(3,3,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(4,4,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_company_id_foreign` (`company_id`),
  KEY `roles_status_id_foreign` (`status_id`),
  CONSTRAINT `roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `roles_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,1,'superadmin','superadmin','[\"company_read\",\"company_create\",\"company_update\",\"company_delete\",\"user_banned\",\"user_unbanned\",\"general_settings_read\",\"general_settings_update\",\"email_settings_read\",\"email_settings_update\",\"storage_settings_update\",\"user_read\",\"user_edit\",\"user_update\",\"content_update\",\"subscriptions_read\"]',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(2,1,'admin','admin','[\"team_menu\",\"team_list\",\"team_create\",\"team_update\",\"team_edit\",\"team_delete\",\"team_member_view\",\"team_member_create\",\"team_member_edit\",\"team_member_delete\",\"team_member_assign\",\"team_member_unassign\",\"dashboard\",\"hr_menu\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"shift_read\",\"shift_create\",\"shift_update\",\"shift_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_menu\",\"user_read\",\"profile_view\",\"user_create\",\"user_edit\",\"user_update\",\"user_delete\",\"user_banned\",\"user_unbanned\",\"make_hr\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"leave_menu\",\"leave_type_read\",\"leave_type_create\",\"leave_type_update\",\"leave_type_delete\",\"leave_assign_read\",\"leave_assign_create\",\"leave_assign_update\",\"leave_assign_delete\",\"leave_request_read\",\"leave_request_create\",\"leave_request_store\",\"leave_request_update\",\"leave_request_approve\",\"leave_request_reject\",\"leave_request_delete\",\"appointment_read\",\"appointment_create\",\"appointment_approve\",\"appointment_reject\",\"appointment_delete\",\"weekend_read\",\"weekend_update\",\"attendance_update\",\"holiday_read\",\"holiday_create\",\"holiday_update\",\"holiday_delete\",\"schedule_read\",\"schedule_create\",\"schedule_update\",\"schedule_delete\",\"attendance_menu\",\"attendance_read\",\"attendance_create\",\"attendance_update\",\"attendance_delete\",\"generate_qr_code\",\"leave_settings_read\",\"leave_settings_update\",\"company_settings_read\",\"company_settings_update\",\"locationApi\",\"company_setup_menu\",\"company_setup_activation\",\"company_setup_configuration\",\"company_setup_ip_whitelist\",\"company_setup_location\",\"location_create\",\"location_store\",\"location_edit\",\"location_update\",\"location_delete\",\"ip_read\",\"ip_create\",\"ip_update\",\"ip_delete\",\"attendance_report_read\",\"live_tracking_read\",\"report_menu\",\"report\",\"claim_read\",\"claim_create\",\"claim_update\",\"claim_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"visit_menu\",\"visit_read\",\"visit_view\",\"visit_update\",\"payroll_menu\",\"list_payroll_item\",\"create_payroll_item\",\"store_payroll_item\",\"update_payroll_item\",\"delete_payroll_item\",\"view_payroll_item\",\"payroll_item_menu\",\"list_payroll_set\",\"create_payroll_set\",\"store_payroll_set\",\"update_payroll_set\",\"delete_payroll_set\",\"view_payroll_set\",\"edit_payroll_set\",\"payroll_set_menu\",\"advance_salaries_menu\",\"advance_salaries_create\",\"advance_salaries_store\",\"advance_salaries_edit\",\"advance_salaries_update\",\"advance_salaries_delete\",\"advance_salaries_view\",\"advance_salaries_approve\",\"advance_salaries_list\",\"advance_salaries_pay\",\"advance_salaries_invoice\",\"advance_salaries_search\",\"payslip_menu\",\"salary_generate\",\"salary_view\",\"salary_delete\",\"salary_edit\",\"salary_update\",\"salary_payment\",\"payslip_list\",\"advance_type_menu\",\"advance_type_create\",\"advance_type_store\",\"advance_type_edit\",\"advance_type_update\",\"advance_type_delete\",\"advance_type_view\",\"advance_type_list\",\"salary_menu\",\"salary_store\",\"salary_edit\",\"salary_update\",\"salary_delete\",\"salary_view\",\"salary_list\",\"salary_search\",\"salary_pay\",\"salary_invoice\",\"salary_approve\",\"salary_generate\",\"salary_calculate\",\"account_menu\",\"account_create\",\"account_store\",\"account_edit\",\"account_update\",\"account_delete\",\"account_view\",\"account_list\",\"account_search\",\"deposit_menu\",\"deposit_create\",\"deposit_store\",\"deposit_edit\",\"deposit_update\",\"deposit_delete\",\"deposit_list\",\"expense_menu\",\"expense_create\",\"expense_store\",\"expense_edit\",\"expense_update\",\"expense_delete\",\"expense_list\",\"expense_view\",\"expense_approve\",\"expense_invoice\",\"expense_pay\",\"transaction_menu\",\"transaction_create\",\"transaction_store\",\"transaction_edit\",\"transaction_update\",\"transaction_delete\",\"transaction_view\",\"transaction_list\",\"deposit_category_menu\",\"deposit_category_create\",\"deposit_category_store\",\"deposit_category_edit\",\"deposit_category_update\",\"deposit_category_delete\",\"deposit_category_list\",\"payment_method_menu\",\"payment_method_create\",\"payment_method_store\",\"payment_method_edit\",\"payment_method_update\",\"payment_method_delete\",\"payment_method_list\",\"project_menu\",\"project_create\",\"project_store\",\"project_edit\",\"project_update\",\"project_delete\",\"project_view\",\"project_list\",\"project_activity_view\",\"project_member_view\",\"project_member_delete\",\"project_complete\",\"project_payment\",\"project_invoice_view\",\"project_discussion_create\",\"project_discussion_store\",\"project_discussion_edit\",\"project_discussion_update\",\"project_discussion_delete\",\"project_discussion_view\",\"project_discussion_list\",\"project_discussion_comment\",\"project_discussion_reply\",\"project_file_create\",\"project_file_store\",\"project_file_edit\",\"project_file_update\",\"project_file_delete\",\"project_file_view\",\"project_file_list\",\"project_file_download\",\"project_file_comment\",\"project_file_reply\",\"project_notes_create\",\"project_notes_store\",\"project_notes_edit\",\"project_notes_update\",\"project_notes_delete\",\"project_notes_list\",\"client_menu\",\"client_create\",\"client_store\",\"client_edit\",\"client_update\",\"client_delete\",\"client_view\",\"client_list\",\"task_menu\",\"task_create\",\"task_store\",\"task_edit\",\"task_update\",\"task_delete\",\"task_view\",\"task_list\",\"task_activity_view\",\"task_assign_view\",\"task_assign_delete\",\"task_complete\",\"task_discussion_create\",\"task_discussion_store\",\"task_discussion_edit\",\"task_discussion_update\",\"task_discussion_delete\",\"task_discussion_view\",\"task_discussion_list\",\"task_discussion_comment\",\"task_discussion_reply\",\"task_file_create\",\"task_file_store\",\"task_file_edit\",\"task_file_update\",\"task_file_delete\",\"task_file_view\",\"task_file_list\",\"task_file_download\",\"task_file_comment\",\"task_file_reply\",\"task_notes_create\",\"task_notes_store\",\"task_notes_edit\",\"task_notes_update\",\"task_notes_delete\",\"task_notes_list\",\"task_files_comment\",\"award_type_menu\",\"award_type_create\",\"award_type_store\",\"award_type_edit\",\"award_type_update\",\"award_type_delete\",\"award_type_view\",\"award_type_list\",\"award_menu\",\"award_create\",\"award_store\",\"award_edit\",\"award_update\",\"award_delete\",\"award_list\",\"travel_type_menu\",\"travel_type_create\",\"travel_type_store\",\"travel_type_edit\",\"travel_type_update\",\"travel_type_delete\",\"travel_type_view\",\"travel_type_list\",\"travel_menu\",\"travel_create\",\"travel_store\",\"travel_edit\",\"travel_update\",\"travel_delete\",\"travel_list\",\"travel_approve\",\"travel_payment\",\"performance_menu\",\"performance_settings\",\"performance_indicator_menu\",\"performance_indicator_list\",\"performance_indicator_create\",\"performance_indicator_store\",\"performance_indicator_edit\",\"performance_indicator_update\",\"performance_indicator_delete\",\"performance_appraisal_menu\",\"performance_appraisal_create\",\"performance_appraisal_store\",\"performance_appraisal_edit\",\"performance_appraisal_update\",\"performance_appraisal_delete\",\"performance_appraisal_list\",\"performance_appraisal_view\",\"performance_goal_type_menu\",\"performance_goal_type_create\",\"performance_goal_type_store\",\"performance_goal_type_edit\",\"performance_goal_type_update\",\"performance_goal_type_delete\",\"performance_goal_type_list\",\"performance_goal_menu\",\"performance_goal_create\",\"performance_goal_store\",\"performance_goal_edit\",\"performance_goal_update\",\"performance_goal_delete\",\"performance_goal_view\",\"performance_goal_list\",\"performance_competence_type_list\",\"performance_competence_type_menu\",\"performance_competence_type_create\",\"performance_competence_type_store\",\"performance_competence_type_edit\",\"performance_competence_type_update\",\"performance_competence_type_delete\",\"performance_competence_type_view\",\"performance_competence_menu\",\"performance_competence_create\",\"performance_competence_store\",\"performance_competence_edit\",\"performance_competence_update\",\"performance_competence_delete\",\"performance_competence_view\",\"performance_competence_list\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(3,1,'hr','hr','[\"team_menu\",\"team_list\",\"team_create\",\"team_update\",\"team_edit\",\"team_delete\",\"team_member_view\",\"team_member_create\",\"team_member_edit\",\"team_member_delete\",\"team_member_assign\",\"team_member_unassign\",\"dashboard\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"shift_read\",\"shift_create\",\"shift_update\",\"shift_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_menu\",\"user_read\",\"profile_view\",\"user_create\",\"user_edit\",\"user_update\",\"user_delete\",\"user_banned\",\"user_unbanned\",\"make_hr\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"leave_menu\",\"leave_type_read\",\"leave_type_create\",\"leave_type_update\",\"leave_type_delete\",\"leave_assign_read\",\"leave_assign_create\",\"leave_assign_update\",\"leave_assign_delete\",\"leave_request_read\",\"leave_request_create\",\"leave_request_approve\",\"leave_request_reject\",\"leave_request_delete\",\"appointment_read\",\"appointment_create\",\"appointment_approve\",\"appointment_reject\",\"appointment_delete\",\"weekend_read\",\"weekend_update\",\"attendance_update\",\"holiday_read\",\"holiday_create\",\"holiday_update\",\"holiday_delete\",\"schedule_read\",\"schedule_create\",\"schedule_update\",\"schedule_delete\",\"attendance_menu\",\"attendance_read\",\"attendance_create\",\"attendance_update\",\"attendance_delete\",\"leave_settings_read\",\"leave_settings_update\",\"company_settings_read\",\"company_settings_update\",\"locationApi\",\"company_setup_menu\",\"company_setup_activation\",\"company_setup_configuration\",\"company_setup_ip_whitelist\",\"company_setup_location\",\"ip_read\",\"ip_create\",\"ip_update\",\"ip_delete\",\"attendance_report_read\",\"live_tracking_read\",\"report_menu\",\"report\",\"claim_read\",\"claim_create\",\"claim_update\",\"claim_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"visit_menu\",\"visit_read\",\"visit_view\",\"visit_update\",\"payroll_menu\",\"list_payroll_item\",\"create_payroll_item\",\"store_payroll_item\",\"update_payroll_item\",\"delete_payroll_item\",\"view_payroll_item\",\"payroll_item_menu\",\"list_payroll_set\",\"create_payroll_set\",\"store_payroll_set\",\"update_payroll_set\",\"delete_payroll_set\",\"view_payroll_set\",\"edit_payroll_set\",\"payroll_set_menu\",\"advance_salaries_menu\",\"advance_salaries_create\",\"advance_salaries_store\",\"advance_salaries_edit\",\"advance_salaries_update\",\"advance_salaries_delete\",\"advance_salaries_view\",\"advance_salaries_approve\",\"advance_salaries_list\",\"advance_salaries_pay\",\"advance_salaries_invoice\",\"advance_salaries_search\",\"payslip_menu\",\"salary_generate\",\"salary_view\",\"salary_delete\",\"salary_edit\",\"salary_update\",\"salary_payment\",\"payslip_list\",\"advance_type_menu\",\"advance_type_create\",\"advance_type_store\",\"advance_type_edit\",\"advance_type_update\",\"advance_type_delete\",\"advance_type_view\",\"advance_type_list\",\"salary_menu\",\"salary_store\",\"salary_edit\",\"salary_update\",\"salary_delete\",\"salary_view\",\"salary_list\",\"salary_search\",\"salary_pay\",\"salary_invoice\",\"salary_approve\",\"salary_generate\",\"salary_calculate\",\"account_menu\",\"account_create\",\"account_store\",\"account_edit\",\"account_update\",\"account_delete\",\"account_view\",\"account_list\",\"account_search\",\"deposit_menu\",\"deposit_create\",\"deposit_store\",\"deposit_edit\",\"deposit_update\",\"deposit_delete\",\"deposit_list\",\"expense_menu\",\"expense_create\",\"expense_store\",\"expense_edit\",\"expense_update\",\"expense_delete\",\"expense_list\",\"expense_view\",\"expense_approve\",\"expense_invoice\",\"expense_pay\",\"transaction_menu\",\"transaction_create\",\"transaction_store\",\"transaction_edit\",\"transaction_update\",\"transaction_delete\",\"transaction_view\",\"transaction_list\",\"deposit_category_menu\",\"deposit_category_create\",\"deposit_category_store\",\"deposit_category_edit\",\"deposit_category_update\",\"deposit_category_delete\",\"deposit_category_list\",\"payment_method_menu\",\"payment_method_create\",\"payment_method_store\",\"payment_method_edit\",\"payment_method_update\",\"payment_method_delete\",\"payment_method_list\",\"travel_menu\",\"travel_create\",\"travel_store\",\"travel_edit\",\"travel_update\",\"travel_delete\",\"travel_list\",\"travel_view\",\"travel_approve\",\"travel_invoice\",\"travel_pay\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(4,1,'staff','staff','[\"dashboard\",\"profile_view\",\"attendance_menu\",\"user_update\",\"attendance_read\",\"attendance_create\",\"leave_request_read\",\"leave_request_create\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(5,2,'admin','admin','[\"team_menu\",\"team_list\",\"team_create\",\"team_update\",\"team_edit\",\"team_delete\",\"team_member_view\",\"team_member_create\",\"team_member_edit\",\"team_member_delete\",\"team_member_assign\",\"team_member_unassign\",\"dashboard\",\"hr_menu\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"shift_read\",\"shift_create\",\"shift_update\",\"shift_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_menu\",\"user_read\",\"profile_view\",\"user_create\",\"user_edit\",\"user_update\",\"user_delete\",\"user_banned\",\"user_unbanned\",\"make_hr\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"leave_menu\",\"leave_type_read\",\"leave_type_create\",\"leave_type_update\",\"leave_type_delete\",\"leave_assign_read\",\"leave_assign_create\",\"leave_assign_update\",\"leave_assign_delete\",\"leave_request_read\",\"leave_request_create\",\"leave_request_store\",\"leave_request_update\",\"leave_request_approve\",\"leave_request_reject\",\"leave_request_delete\",\"appointment_read\",\"appointment_create\",\"appointment_approve\",\"appointment_reject\",\"appointment_delete\",\"weekend_read\",\"weekend_update\",\"attendance_update\",\"holiday_read\",\"holiday_create\",\"holiday_update\",\"holiday_delete\",\"schedule_read\",\"schedule_create\",\"schedule_update\",\"schedule_delete\",\"attendance_menu\",\"attendance_read\",\"attendance_create\",\"attendance_update\",\"attendance_delete\",\"generate_qr_code\",\"leave_settings_read\",\"leave_settings_update\",\"company_settings_read\",\"company_settings_update\",\"locationApi\",\"company_setup_menu\",\"company_setup_activation\",\"company_setup_configuration\",\"company_setup_ip_whitelist\",\"company_setup_location\",\"location_create\",\"location_store\",\"location_edit\",\"location_update\",\"location_delete\",\"ip_read\",\"ip_create\",\"ip_update\",\"ip_delete\",\"attendance_report_read\",\"live_tracking_read\",\"report_menu\",\"report\",\"claim_read\",\"claim_create\",\"claim_update\",\"claim_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"visit_menu\",\"visit_read\",\"visit_view\",\"visit_update\",\"payroll_menu\",\"list_payroll_item\",\"create_payroll_item\",\"store_payroll_item\",\"update_payroll_item\",\"delete_payroll_item\",\"view_payroll_item\",\"payroll_item_menu\",\"list_payroll_set\",\"create_payroll_set\",\"store_payroll_set\",\"update_payroll_set\",\"delete_payroll_set\",\"view_payroll_set\",\"edit_payroll_set\",\"payroll_set_menu\",\"advance_salaries_menu\",\"advance_salaries_create\",\"advance_salaries_store\",\"advance_salaries_edit\",\"advance_salaries_update\",\"advance_salaries_delete\",\"advance_salaries_view\",\"advance_salaries_approve\",\"advance_salaries_list\",\"advance_salaries_pay\",\"advance_salaries_invoice\",\"advance_salaries_search\",\"payslip_menu\",\"salary_generate\",\"salary_view\",\"salary_delete\",\"salary_edit\",\"salary_update\",\"salary_payment\",\"payslip_list\",\"advance_type_menu\",\"advance_type_create\",\"advance_type_store\",\"advance_type_edit\",\"advance_type_update\",\"advance_type_delete\",\"advance_type_view\",\"advance_type_list\",\"salary_menu\",\"salary_store\",\"salary_edit\",\"salary_update\",\"salary_delete\",\"salary_view\",\"salary_list\",\"salary_search\",\"salary_pay\",\"salary_invoice\",\"salary_approve\",\"salary_generate\",\"salary_calculate\",\"account_menu\",\"account_create\",\"account_store\",\"account_edit\",\"account_update\",\"account_delete\",\"account_view\",\"account_list\",\"account_search\",\"deposit_menu\",\"deposit_create\",\"deposit_store\",\"deposit_edit\",\"deposit_update\",\"deposit_delete\",\"deposit_list\",\"expense_menu\",\"expense_create\",\"expense_store\",\"expense_edit\",\"expense_update\",\"expense_delete\",\"expense_list\",\"expense_view\",\"expense_approve\",\"expense_invoice\",\"expense_pay\",\"transaction_menu\",\"transaction_create\",\"transaction_store\",\"transaction_edit\",\"transaction_update\",\"transaction_delete\",\"transaction_view\",\"transaction_list\",\"deposit_category_menu\",\"deposit_category_create\",\"deposit_category_store\",\"deposit_category_edit\",\"deposit_category_update\",\"deposit_category_delete\",\"deposit_category_list\",\"payment_method_menu\",\"payment_method_create\",\"payment_method_store\",\"payment_method_edit\",\"payment_method_update\",\"payment_method_delete\",\"payment_method_list\",\"project_menu\",\"project_create\",\"project_store\",\"project_edit\",\"project_update\",\"project_delete\",\"project_view\",\"project_list\",\"project_activity_view\",\"project_member_view\",\"project_member_delete\",\"project_complete\",\"project_payment\",\"project_invoice_view\",\"project_discussion_create\",\"project_discussion_store\",\"project_discussion_edit\",\"project_discussion_update\",\"project_discussion_delete\",\"project_discussion_view\",\"project_discussion_list\",\"project_discussion_comment\",\"project_discussion_reply\",\"project_file_create\",\"project_file_store\",\"project_file_edit\",\"project_file_update\",\"project_file_delete\",\"project_file_view\",\"project_file_list\",\"project_file_download\",\"project_file_comment\",\"project_file_reply\",\"project_notes_create\",\"project_notes_store\",\"project_notes_edit\",\"project_notes_update\",\"project_notes_delete\",\"project_notes_list\",\"client_menu\",\"client_create\",\"client_store\",\"client_edit\",\"client_update\",\"client_delete\",\"client_view\",\"client_list\",\"task_menu\",\"task_create\",\"task_store\",\"task_edit\",\"task_update\",\"task_delete\",\"task_view\",\"task_list\",\"task_activity_view\",\"task_assign_view\",\"task_assign_delete\",\"task_complete\",\"task_discussion_create\",\"task_discussion_store\",\"task_discussion_edit\",\"task_discussion_update\",\"task_discussion_delete\",\"task_discussion_view\",\"task_discussion_list\",\"task_discussion_comment\",\"task_discussion_reply\",\"task_file_create\",\"task_file_store\",\"task_file_edit\",\"task_file_update\",\"task_file_delete\",\"task_file_view\",\"task_file_list\",\"task_file_download\",\"task_file_comment\",\"task_file_reply\",\"task_notes_create\",\"task_notes_store\",\"task_notes_edit\",\"task_notes_update\",\"task_notes_delete\",\"task_notes_list\",\"task_files_comment\",\"award_type_menu\",\"award_type_create\",\"award_type_store\",\"award_type_edit\",\"award_type_update\",\"award_type_delete\",\"award_type_view\",\"award_type_list\",\"award_menu\",\"award_create\",\"award_store\",\"award_edit\",\"award_update\",\"award_delete\",\"award_list\",\"travel_type_menu\",\"travel_type_create\",\"travel_type_store\",\"travel_type_edit\",\"travel_type_update\",\"travel_type_delete\",\"travel_type_view\",\"travel_type_list\",\"travel_menu\",\"travel_create\",\"travel_store\",\"travel_edit\",\"travel_update\",\"travel_delete\",\"travel_list\",\"travel_approve\",\"travel_payment\",\"performance_menu\",\"performance_settings\",\"performance_indicator_menu\",\"performance_indicator_list\",\"performance_indicator_create\",\"performance_indicator_store\",\"performance_indicator_edit\",\"performance_indicator_update\",\"performance_indicator_delete\",\"performance_appraisal_menu\",\"performance_appraisal_create\",\"performance_appraisal_store\",\"performance_appraisal_edit\",\"performance_appraisal_update\",\"performance_appraisal_delete\",\"performance_appraisal_list\",\"performance_appraisal_view\",\"performance_goal_type_menu\",\"performance_goal_type_create\",\"performance_goal_type_store\",\"performance_goal_type_edit\",\"performance_goal_type_update\",\"performance_goal_type_delete\",\"performance_goal_type_list\",\"performance_goal_menu\",\"performance_goal_create\",\"performance_goal_store\",\"performance_goal_edit\",\"performance_goal_update\",\"performance_goal_delete\",\"performance_goal_view\",\"performance_goal_list\",\"performance_competence_type_list\",\"performance_competence_type_menu\",\"performance_competence_type_create\",\"performance_competence_type_store\",\"performance_competence_type_edit\",\"performance_competence_type_update\",\"performance_competence_type_delete\",\"performance_competence_type_view\",\"performance_competence_menu\",\"performance_competence_create\",\"performance_competence_store\",\"performance_competence_edit\",\"performance_competence_update\",\"performance_competence_delete\",\"performance_competence_view\",\"performance_competence_list\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(6,2,'hr','hr','[\"team_menu\",\"team_list\",\"team_create\",\"team_update\",\"team_edit\",\"team_delete\",\"team_member_view\",\"team_member_create\",\"team_member_edit\",\"team_member_delete\",\"team_member_assign\",\"team_member_unassign\",\"dashboard\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"shift_read\",\"shift_create\",\"shift_update\",\"shift_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_menu\",\"user_read\",\"profile_view\",\"user_create\",\"user_edit\",\"user_update\",\"user_delete\",\"user_banned\",\"user_unbanned\",\"make_hr\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"leave_menu\",\"leave_type_read\",\"leave_type_create\",\"leave_type_update\",\"leave_type_delete\",\"leave_assign_read\",\"leave_assign_create\",\"leave_assign_update\",\"leave_assign_delete\",\"leave_request_read\",\"leave_request_create\",\"leave_request_approve\",\"leave_request_reject\",\"leave_request_delete\",\"appointment_read\",\"appointment_create\",\"appointment_approve\",\"appointment_reject\",\"appointment_delete\",\"weekend_read\",\"weekend_update\",\"attendance_update\",\"holiday_read\",\"holiday_create\",\"holiday_update\",\"holiday_delete\",\"schedule_read\",\"schedule_create\",\"schedule_update\",\"schedule_delete\",\"attendance_menu\",\"attendance_read\",\"attendance_create\",\"attendance_update\",\"attendance_delete\",\"leave_settings_read\",\"leave_settings_update\",\"company_settings_read\",\"company_settings_update\",\"locationApi\",\"company_setup_menu\",\"company_setup_activation\",\"company_setup_configuration\",\"company_setup_ip_whitelist\",\"company_setup_location\",\"ip_read\",\"ip_create\",\"ip_update\",\"ip_delete\",\"attendance_report_read\",\"live_tracking_read\",\"report_menu\",\"report\",\"claim_read\",\"claim_create\",\"claim_update\",\"claim_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"visit_menu\",\"visit_read\",\"visit_view\",\"visit_update\",\"payroll_menu\",\"list_payroll_item\",\"create_payroll_item\",\"store_payroll_item\",\"update_payroll_item\",\"delete_payroll_item\",\"view_payroll_item\",\"payroll_item_menu\",\"list_payroll_set\",\"create_payroll_set\",\"store_payroll_set\",\"update_payroll_set\",\"delete_payroll_set\",\"view_payroll_set\",\"edit_payroll_set\",\"payroll_set_menu\",\"advance_salaries_menu\",\"advance_salaries_create\",\"advance_salaries_store\",\"advance_salaries_edit\",\"advance_salaries_update\",\"advance_salaries_delete\",\"advance_salaries_view\",\"advance_salaries_approve\",\"advance_salaries_list\",\"advance_salaries_pay\",\"advance_salaries_invoice\",\"advance_salaries_search\",\"payslip_menu\",\"salary_generate\",\"salary_view\",\"salary_delete\",\"salary_edit\",\"salary_update\",\"salary_payment\",\"payslip_list\",\"advance_type_menu\",\"advance_type_create\",\"advance_type_store\",\"advance_type_edit\",\"advance_type_update\",\"advance_type_delete\",\"advance_type_view\",\"advance_type_list\",\"salary_menu\",\"salary_store\",\"salary_edit\",\"salary_update\",\"salary_delete\",\"salary_view\",\"salary_list\",\"salary_search\",\"salary_pay\",\"salary_invoice\",\"salary_approve\",\"salary_generate\",\"salary_calculate\",\"account_menu\",\"account_create\",\"account_store\",\"account_edit\",\"account_update\",\"account_delete\",\"account_view\",\"account_list\",\"account_search\",\"deposit_menu\",\"deposit_create\",\"deposit_store\",\"deposit_edit\",\"deposit_update\",\"deposit_delete\",\"deposit_list\",\"expense_menu\",\"expense_create\",\"expense_store\",\"expense_edit\",\"expense_update\",\"expense_delete\",\"expense_list\",\"expense_view\",\"expense_approve\",\"expense_invoice\",\"expense_pay\",\"transaction_menu\",\"transaction_create\",\"transaction_store\",\"transaction_edit\",\"transaction_update\",\"transaction_delete\",\"transaction_view\",\"transaction_list\",\"deposit_category_menu\",\"deposit_category_create\",\"deposit_category_store\",\"deposit_category_edit\",\"deposit_category_update\",\"deposit_category_delete\",\"deposit_category_list\",\"payment_method_menu\",\"payment_method_create\",\"payment_method_store\",\"payment_method_edit\",\"payment_method_update\",\"payment_method_delete\",\"payment_method_list\",\"travel_menu\",\"travel_create\",\"travel_store\",\"travel_edit\",\"travel_update\",\"travel_delete\",\"travel_list\",\"travel_view\",\"travel_approve\",\"travel_invoice\",\"travel_pay\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL),(7,2,'staff','staff','[\"dashboard\",\"profile_view\",\"attendance_menu\",\"user_update\",\"attendance_read\",\"attendance_create\",\"leave_request_read\",\"leave_request_create\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',1,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_generates`
--

DROP TABLE IF EXISTS `salary_generates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_generates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `company_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `gross_salary` double(16,2) NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '9',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `total_working_day` int DEFAULT NULL,
  `present` int DEFAULT NULL,
  `absent` int DEFAULT NULL,
  `late` int DEFAULT NULL,
  `left_early` int DEFAULT NULL,
  `is_calculated` tinyint NOT NULL DEFAULT '0',
  `adjust` double(16,2) DEFAULT NULL,
  `absent_amount` double(16,2) DEFAULT NULL,
  `advance_amount` double(16,2) DEFAULT NULL,
  `advance_details` json DEFAULT NULL,
  `allowance_amount` double(16,2) DEFAULT NULL,
  `allowance_details` json DEFAULT NULL,
  `deduction_amount` double(16,2) DEFAULT NULL,
  `deduction_details` json DEFAULT NULL,
  `net_salary` double(16,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_generates_company_id_foreign` (`company_id`),
  KEY `salary_generates_id_amount_date_index` (`id`,`amount`,`date`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_generates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_generates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_generates_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `salary_generates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_generates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_generates`
--

LOCK TABLES `salary_generates` WRITE;
/*!40000 ALTER TABLE `salary_generates` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_generates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_payment_logs`
--

DROP TABLE IF EXISTS `salary_payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `salary_generate_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `transaction_id` bigint unsigned DEFAULT NULL,
  `payment_method_id` bigint unsigned DEFAULT NULL,
  `paid_by` bigint unsigned NOT NULL DEFAULT '1',
  `user_id` bigint unsigned DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_payment_logs_salary_generate_id_foreign` (`salary_generate_id`),
  KEY `salary_payment_logs_company_id_foreign` (`company_id`),
  KEY `salary_payment_logs_id_amount_index` (`id`,`amount`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `paid_by` (`paid_by`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_payment_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_payment_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_payment_logs_paid_by_foreign` FOREIGN KEY (`paid_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_payment_logs_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `salary_payment_logs_salary_generate_id_foreign` FOREIGN KEY (`salary_generate_id`) REFERENCES `salary_generates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_payment_logs_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `salary_payment_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_payment_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_payment_logs`
--

LOCK TABLES `salary_payment_logs` WRITE;
/*!40000 ALTER TABLE `salary_payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_setup_details`
--

DROP TABLE IF EXISTS `salary_setup_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_setup_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `salary_setup_id` bigint unsigned NOT NULL DEFAULT '1',
  `commission_id` bigint unsigned NOT NULL DEFAULT '1',
  `amount` double(16,2) NOT NULL,
  `amount_type` tinyint NOT NULL DEFAULT '1' COMMENT '1=fixed, 2=percentage',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_setup_details_company_id_foreign` (`company_id`),
  KEY `salary_setup_details_id_amount_index` (`id`,`amount`),
  KEY `user_id` (`user_id`),
  KEY `salary_setup_id` (`salary_setup_id`),
  KEY `commission_id` (`commission_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_setup_details_commission_id_foreign` FOREIGN KEY (`commission_id`) REFERENCES `commissions` (`id`),
  CONSTRAINT `salary_setup_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_setup_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setup_details_salary_setup_id_foreign` FOREIGN KEY (`salary_setup_id`) REFERENCES `salary_setups` (`id`),
  CONSTRAINT `salary_setup_details_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `salary_setup_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setup_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_setup_details`
--

LOCK TABLES `salary_setup_details` WRITE;
/*!40000 ALTER TABLE `salary_setup_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_setup_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_setups`
--

DROP TABLE IF EXISTS `salary_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '1',
  `gross_salary` double(16,2) NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_setups_company_id_foreign` (`company_id`),
  KEY `salary_setups_id_gross_salary_index` (`id`,`gross_salary`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_setups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_setups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `salary_setups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_setups`
--

LOCK TABLES `salary_setups` WRITE;
/*!40000 ALTER TABLE `salary_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_user_id_foreign` (`user_id`),
  KEY `services_attachment_foreign` (`attachment`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `services_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `services_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'app',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_company_id_foreign` (`company_id`),
  KEY `settings_name_value_context_index` (`name`,`value`,`context`),
  CONSTRAINT `settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,1,'company_name','HRM','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,1,'company_logo_backend','public/uploads/settings/logo/logo_white.png','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,1,'company_logo_frontend','public/uploads/settings/logo/logo_black.png','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,1,'company_icon','public/uploads/settings/logo/favicon.png','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(5,1,'android_url','https://play.google.com/store/apps/details?id=com.worx24hour.hrm','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(6,1,'ios_url','https://apps.apple.com/us/app/24hourworx/id1620313188','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(7,1,'language','en','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(8,1,'emailSettingsProvider','smtp','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(9,1,'emailSettings_from_name','hrm@onest.com','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(10,1,'emailSettings_from_email','hrm@onest.com','app','2022-09-10 03:33:33','2022-09-10 03:33:33'),(11,1,'site_under_maintenance','0','app','2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shifts_company_id_foreign` (`company_id`),
  KEY `shifts_status_id_foreign` (`status_id`),
  CONSTRAINT `shifts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `shifts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,1,'Day',1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,1,'Evening',1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(3,1,'Night',1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(4,2,'Day',1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(5,2,'Evening',1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(6,2,'Night',1,'2022-09-10 03:33:32','2022-09-10 03:33:32');
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_logs`
--

DROP TABLE IF EXISTS `sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `receiver_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_logs`
--

LOCK TABLES `sms_logs` WRITE;
/*!40000 ALTER TABLE `sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_identities`
--

DROP TABLE IF EXISTS `social_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_identities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_identities_provider_id_unique` (`provider_id`),
  KEY `social_identities_user_id_foreign` (`user_id`),
  CONSTRAINT `social_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_identities`
--

LOCK TABLES `social_identities` WRITE;
/*!40000 ALTER TABLE `social_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'hare name=status situation',
  `class` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'hare class=what type of class name property like success,danger,info,purple',
  `color_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statuses_name_class_index` (`name`,`class`),
  KEY `statuses_name_index` (`name`),
  KEY `statuses_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Active','success','449d44',NULL,NULL),(2,'Pending','warning','ec971f',NULL,NULL),(3,'Suspended','danger','c9302c',NULL,NULL),(4,'Inactive','danger','c9302c',NULL,NULL),(5,'Approve','success','449d44',NULL,NULL),(6,'Reject','danger','c9302c',NULL,NULL),(7,'Cancel','danger','c9302c',NULL,NULL),(8,'Paid','success','449d44',NULL,NULL),(9,'Unpaid','danger','c9302c',NULL,NULL),(10,'Claimed','primary','337ab7',NULL,NULL),(11,'Not Claimed','danger','c9302c',NULL,NULL),(12,'Open','danger','ffFD815B',NULL,NULL),(13,'Close','success','449d44',NULL,NULL),(14,'High','danger','c9302c',NULL,NULL),(15,'Medium','primary','337ab7',NULL,NULL),(16,'Low','warning','ec971f',NULL,NULL),(17,'Referred','warning','ec971f',NULL,NULL),(18,'Debit','danger','ffFD815B',NULL,NULL),(19,'Credit','success','449d44',NULL,NULL),(20,'Partially Paid','info','9DBBCE',NULL,NULL),(21,'Partially Returned','warning','ec971f',NULL,NULL),(22,'No','danger','c9302c',NULL,NULL),(23,'Returned','success','449d44',NULL,NULL),(24,'Not Started','warning','ec971f',NULL,NULL),(25,'On Hold','info','9DBBCE',NULL,NULL),(26,'In Progress','main','7F58FE',NULL,NULL),(27,'Completed','success','449d44',NULL,NULL),(28,'Cancelled','danger','c9302c',NULL,NULL),(29,'Urgent','danger','c9302c',NULL,NULL),(30,'High','danger','c9302c',NULL,NULL),(31,'Medium','primary','337ab7',NULL,NULL),(32,'Low','warning','ec971f',NULL,NULL),(33,'Yes','primary','337ab7',NULL,NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_plans`
--

DROP TABLE IF EXISTS `subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_plans_identifier_unique` (`identifier`),
  UNIQUE KEY `subscription_plans_stripe_id_unique` (`stripe_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `subscription_plans_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_plans`
--

LOCK TABLES `subscription_plans` WRITE;
/*!40000 ALTER TABLE `subscription_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `assigned_id` bigint unsigned DEFAULT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `type_id` bigint unsigned NOT NULL DEFAULT '12' COMMENT '12 = open , 13 = close',
  `priority_id` bigint unsigned NOT NULL DEFAULT '14' COMMENT '14 = high , 15 = medium , 16 = low',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `support_tickets_company_id_foreign` (`company_id`),
  KEY `support_tickets_user_id_foreign` (`user_id`),
  KEY `support_tickets_assigned_id_foreign` (`assigned_id`),
  KEY `support_tickets_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `support_tickets_status_id_foreign` (`status_id`),
  KEY `support_tickets_type_id_foreign` (`type_id`),
  KEY `support_tickets_priority_id_foreign` (`priority_id`),
  CONSTRAINT `support_tickets_assigned_id_foreign` FOREIGN KEY (`assigned_id`) REFERENCES `users` (`id`),
  CONSTRAINT `support_tickets_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `support_tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `support_tickets_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `support_tickets_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
INSERT INTO `support_tickets` VALUES (1,2,'2022-09-10','test-678',4,3,NULL,'test','test',1,12,14,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_activities`
--

DROP TABLE IF EXISTS `task_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_activities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_activities_company_id_foreign` (`company_id`),
  KEY `task_activities_task_id_foreign` (`task_id`),
  KEY `task_activities_user_id_foreign` (`user_id`),
  KEY `task_activities_id_task_id_company_id_user_id_index` (`id`,`task_id`,`company_id`,`user_id`),
  CONSTRAINT `task_activities_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_activities_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_activities`
--

LOCK TABLES `task_activities` WRITE;
/*!40000 ALTER TABLE `task_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_discussion_comments`
--

DROP TABLE IF EXISTS `task_discussion_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_discussion_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` tinyint NOT NULL DEFAULT '1' COMMENT '0=no,1=yes',
  `task_discussion_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_discussion_comments_company_id_foreign` (`company_id`),
  KEY `task_discussion_comments_task_discussion_id_foreign` (`task_discussion_id`),
  KEY `task_discussion_comments_user_id_foreign` (`user_id`),
  KEY `task_discussion_comments_attachment_foreign` (`attachment`),
  KEY `task_discussion_comments_id_task_discussion_id_company_id_index` (`id`,`task_discussion_id`,`company_id`),
  CONSTRAINT `task_discussion_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `task_discussion_comments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussion_comments_task_discussion_id_foreign` FOREIGN KEY (`task_discussion_id`) REFERENCES `task_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussion_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_discussion_comments`
--

LOCK TABLES `task_discussion_comments` WRITE;
/*!40000 ALTER TABLE `task_discussion_comments` DISABLE KEYS */;
INSERT INTO `task_discussion_comments` VALUES (1,NULL,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,4,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,1,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,3,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `task_discussion_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_discussions`
--

DROP TABLE IF EXISTS `task_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_discussions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `show_to_customer` bigint unsigned NOT NULL DEFAULT '22',
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_discussions_company_id_foreign` (`company_id`),
  KEY `task_discussions_task_id_foreign` (`task_id`),
  KEY `task_discussions_user_id_foreign` (`user_id`),
  KEY `task_discussions_id_task_id_company_id_status_id_user_id_index` (`id`,`task_id`,`company_id`,`status_id`,`user_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_discussions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussions_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_discussions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_discussions`
--

LOCK TABLES `task_discussions` WRITE;
/*!40000 ALTER TABLE `task_discussions` DISABLE KEYS */;
INSERT INTO `task_discussions` VALUES (1,2,'Discussion 1','<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',1,4,33,1,'2022-09-10 03:33:33','2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `task_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_file_comments`
--

DROP TABLE IF EXISTS `task_file_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_file_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` tinyint NOT NULL DEFAULT '1' COMMENT '0=no,1=yes',
  `task_file_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_file_comments_company_id_foreign` (`company_id`),
  KEY `task_file_comments_task_file_id_foreign` (`task_file_id`),
  KEY `task_file_comments_user_id_foreign` (`user_id`),
  KEY `task_file_comments_attachment_foreign` (`attachment`),
  KEY `task_file_comments_id_task_file_id_user_id_index` (`id`,`task_file_id`,`user_id`),
  CONSTRAINT `task_file_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `task_file_comments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_file_comments_task_file_id_foreign` FOREIGN KEY (`task_file_id`) REFERENCES `task_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_file_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_file_comments`
--

LOCK TABLES `task_file_comments` WRITE;
/*!40000 ALTER TABLE `task_file_comments` DISABLE KEYS */;
INSERT INTO `task_file_comments` VALUES (1,NULL,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,4,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,1,2,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',33,1,3,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `task_file_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_files`
--

DROP TABLE IF EXISTS `task_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` bigint unsigned NOT NULL DEFAULT '22',
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_files_company_id_foreign` (`company_id`),
  KEY `task_files_task_id_foreign` (`task_id`),
  KEY `task_files_user_id_foreign` (`user_id`),
  KEY `task_files_attachment_foreign` (`attachment`),
  KEY `task_files_id_task_id_company_id_status_id_user_id_index` (`id`,`task_id`,`company_id`,`status_id`,`user_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_files_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `task_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_files_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_files_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_files`
--

LOCK TABLES `task_files` WRITE;
/*!40000 ALTER TABLE `task_files` DISABLE KEYS */;
INSERT INTO `task_files` VALUES (1,2,'Demo File',22,1,3,NULL,1,'2022-09-10 03:33:33','2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `task_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_members`
--

DROP TABLE IF EXISTS `task_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `added_by` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_members_company_id_foreign` (`company_id`),
  KEY `task_members_task_id_foreign` (`task_id`),
  KEY `task_members_user_id_foreign` (`user_id`),
  KEY `task_members_added_by_foreign` (`added_by`),
  KEY `task_members_id_task_id_company_id_status_id_user_id_index` (`id`,`task_id`,`company_id`,`status_id`,`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_members_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_members_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_members_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_members_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_members`
--

LOCK TABLES `task_members` WRITE;
/*!40000 ALTER TABLE `task_members` DISABLE KEYS */;
INSERT INTO `task_members` VALUES (1,2,1,4,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `task_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_notes`
--

DROP TABLE IF EXISTS `task_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_to_customer` bigint unsigned NOT NULL DEFAULT '22',
  `task_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_notes_company_id_foreign` (`company_id`),
  KEY `task_notes_task_id_foreign` (`task_id`),
  KEY `task_notes_user_id_foreign` (`user_id`),
  KEY `task_notes_id_task_id_company_id_status_id_user_id_index` (`id`,`task_id`,`company_id`,`status_id`,`user_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_notes_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_notes_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_notes_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_notes`
--

LOCK TABLES `task_notes` WRITE;
/*!40000 ALTER TABLE `task_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `progress` int DEFAULT '0',
  `status_id` bigint unsigned NOT NULL DEFAULT '24',
  `priority` bigint unsigned NOT NULL DEFAULT '24',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `notify_all_users` tinyint NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `notify_all_users_email` tinyint NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `type` tinyint NOT NULL DEFAULT '0' COMMENT '0=Regular , 1= Project',
  `project_id` bigint unsigned DEFAULT NULL,
  `reminder` tinyint NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `goal_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_company_id_foreign` (`company_id`),
  KEY `tasks_goal_id_foreign` (`goal_id`),
  KEY `tasks_id_company_id_status_id_index` (`id`,`company_id`,`status_id`),
  KEY `status_id` (`status_id`),
  KEY `priority` (`priority`),
  KEY `created_by` (`created_by`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_priority_foreign` FOREIGN KEY (`priority`) REFERENCES `statuses` (`id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'eCommerce task',2,'2022-09-10',1,26,29,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','2022-09-10','2022-10-10',2,0,0,0,NULL,0,NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_members_team_id_foreign` (`team_id`),
  KEY `team_members_user_id_foreign` (`user_id`),
  CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_file_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `user_id` bigint unsigned NOT NULL,
  `team_lead_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `teams_company_id_foreign` (`company_id`),
  KEY `teams_user_id_foreign` (`user_id`),
  KEY `teams_team_lead_id_foreign` (`team_lead_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `teams_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teams_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teams_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `teams_team_lead_id_foreign` FOREIGN KEY (`team_lead_id`) REFERENCES `users` (`id`),
  CONSTRAINT `teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `testimonials_company_id_foreign` (`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `testimonials_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `testimonials_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,' Never felt this much relaxed in last couple of years It’s quiet comprehensible and helped me manage things very easily. A great software indeed!',1,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `support_ticket_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_support_ticket_id_foreign` (`support_ticket_id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`),
  CONSTRAINT `ticket_replies_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zones`
--

DROP TABLE IF EXISTS `time_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_zones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zones`
--

LOCK TABLES `time_zones` WRITE;
/*!40000 ALTER TABLE `time_zones` DISABLE KEYS */;
INSERT INTO `time_zones` VALUES (1,'AD','Europe/Andorra',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(2,'AE','Asia/Dubai',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(3,'AF','Asia/Kabul',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(4,'AG','America/Antigua',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(5,'AI','America/Anguilla',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(6,'AL','Europe/Tirane',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(7,'AM','Asia/Yerevan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(8,'AO','Africa/Luanda',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(9,'AQ','Antarctica/McMurdo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(10,'AQ','Antarctica/Casey',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(11,'AQ','Antarctica/Davis',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(12,'AQ','Antarctica/DumontDUrville',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(13,'AQ','Antarctica/Mawson',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(14,'AQ','Antarctica/Palmer',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(15,'AQ','Antarctica/Rothera',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(16,'AQ','Antarctica/Syowa',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(17,'AQ','Antarctica/Troll',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(18,'AQ','Antarctica/Vostok',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(19,'AR','America/Argentina/Buenos_Aires',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(20,'AR','America/Argentina/Cordoba',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(21,'AR','America/Argentina/Salta',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(22,'AR','America/Argentina/Jujuy',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(23,'AR','America/Argentina/Tucuman',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(24,'AR','America/Argentina/Catamarca',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(25,'AR','America/Argentina/La_Rioja',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(26,'AR','America/Argentina/San_Juan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(27,'AR','America/Argentina/Mendoza',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(28,'AR','America/Argentina/San_Luis',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(29,'AR','America/Argentina/Rio_Gallegos',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(30,'AR','America/Argentina/Ushuaia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(31,'AS','Pacific/Pago_Pago',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(32,'AT','Europe/Vienna',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(33,'AU','Australia/Lord_Howe',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(34,'AU','Antarctica/Macquarie',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(35,'AU','Australia/Hobart',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(36,'AU','Australia/Currie',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(37,'AU','Australia/Melbourne',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(38,'AU','Australia/Sydney',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(39,'AU','Australia/Broken_Hill',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(40,'AU','Australia/Brisbane',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(41,'AU','Australia/Lindeman',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(42,'AU','Australia/Adelaide',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(43,'AU','Australia/Darwin',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(44,'AU','Australia/Perth',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(45,'AU','Australia/Eucla',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(46,'AW','America/Aruba',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(47,'AX','Europe/Mariehamn',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(48,'AZ','Asia/Baku',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(49,'BA','Europe/Sarajevo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(50,'BB','America/Barbados',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(51,'BD','Asia/Dhaka',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(52,'BE','Europe/Brussels',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(53,'BF','Africa/Ouagadougou',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(54,'BG','Europe/Sofia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(55,'BH','Asia/Bahrain',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(56,'BI','Africa/Bujumbura',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(57,'BJ','Africa/Porto-Novo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(58,'BL','America/St_Barthelemy',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(59,'BM','Atlantic/Bermuda',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(60,'BN','Asia/Brunei',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(61,'BO','America/La_Paz',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(62,'BQ','America/Kralendijk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(63,'BR','America/Noronha',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(64,'BR','America/Belem',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(65,'BR','America/Fortaleza',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(66,'BR','America/Recife',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(67,'BR','America/Araguaina',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(68,'BR','America/Maceio',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(69,'BR','America/Bahia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(70,'BR','America/Sao_Paulo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(71,'BR','America/Campo_Grande',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(72,'BR','America/Cuiaba',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(73,'BR','America/Santarem',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(74,'BR','America/Porto_Velho',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(75,'BR','America/Boa_Vista',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(76,'BR','America/Manaus',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(77,'BR','America/Eirunepe',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(78,'BR','America/Rio_Branco',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(79,'BS','America/Nassau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(80,'BT','Asia/Thimphu',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(81,'BW','Africa/Gaborone',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(82,'BY','Europe/Minsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(83,'BZ','America/Belize',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(84,'CA','America/St_Johns',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(85,'CA','America/Halifax',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(86,'CA','America/Glace_Bay',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(87,'CA','America/Moncton',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(88,'CA','America/Goose_Bay',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(89,'CA','America/Blanc-Sablon',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(90,'CA','America/Toronto',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(91,'CA','America/Nipigon',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(92,'CA','America/Thunder_Bay',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(93,'CA','America/Iqaluit',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(94,'CA','America/Pangnirtung',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(95,'CA','America/Atikokan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(96,'CA','America/Winnipeg',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(97,'CA','America/Rainy_River',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(98,'CA','America/Resolute',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(99,'CA','America/Rankin_Inlet',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(100,'CA','America/Regina',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(101,'CA','America/Swift_Current',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(102,'CA','America/Edmonton',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(103,'CA','America/Cambridge_Bay',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(104,'CA','America/Yellowknife',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(105,'CA','America/Inuvik',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(106,'CA','America/Creston',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(107,'CA','America/Dawson_Creek',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(108,'CA','America/Fort_Nelson',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(109,'CA','America/Vancouver',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(110,'CA','America/Whitehorse',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(111,'CA','America/Dawson',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(112,'CC','Indian/Cocos',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(113,'CD','Africa/Kinshasa',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(114,'CD','Africa/Lubumbashi',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(115,'CF','Africa/Bangui',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(116,'CG','Africa/Brazzaville',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(117,'CH','Europe/Zurich',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(118,'CI','Africa/Abidjan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(119,'CK','Pacific/Rarotonga',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(120,'CL','America/Santiago',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(121,'CL','America/Punta_Arenas',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(122,'CL','Pacific/Easter',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(123,'CM','Africa/Douala',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(124,'CN','Asia/Shanghai',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(125,'CN','Asia/Urumqi',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(126,'CO','America/Bogota',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(127,'CR','America/Costa_Rica',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(128,'CU','America/Havana',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(129,'CV','Atlantic/Cape_Verde',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(130,'CW','America/Curacao',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(131,'CX','Indian/Christmas',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(132,'CY','Asia/Nicosia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(133,'CY','Asia/Famagusta',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(134,'CZ','Europe/Prague',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(135,'DE','Europe/Berlin',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(136,'DE','Europe/Busingen',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(137,'DJ','Africa/Djibouti',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(138,'DK','Europe/Copenhagen',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(139,'DM','America/Dominica',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(140,'DO','America/Santo_Domingo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(141,'DZ','Africa/Algiers',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(142,'EC','America/Guayaquil',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(143,'EC','Pacific/Galapagos',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(144,'EE','Europe/Tallinn',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(145,'EG','Africa/Cairo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(146,'EH','Africa/El_Aaiun',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(147,'ER','Africa/Asmara',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(148,'ES','Europe/Madrid',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(149,'ES','Africa/Ceuta',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(150,'ES','Atlantic/Canary',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(151,'ET','Africa/Addis_Ababa',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(152,'FI','Europe/Helsinki',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(153,'FJ','Pacific/Fiji',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(154,'FK','Atlantic/Stanley',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(155,'FM','Pacific/Chuuk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(156,'FM','Pacific/Pohnpei',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(157,'FM','Pacific/Kosrae',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(158,'FO','Atlantic/Faroe',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(159,'FR','Europe/Paris',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(160,'GA','Africa/Libreville',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(161,'GB','Europe/London',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(162,'GD','America/Grenada',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(163,'GE','Asia/Tbilisi',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(164,'GF','America/Cayenne',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(165,'GG','Europe/Guernsey',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(166,'GH','Africa/Accra',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(167,'GI','Europe/Gibraltar',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(168,'GL','America/Godthab',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(169,'GL','America/Danmarkshavn',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(170,'GL','America/Scoresbysund',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(171,'GL','America/Thule',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(172,'GM','Africa/Banjul',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(173,'GN','Africa/Conakry',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(174,'GP','America/Guadeloupe',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(175,'GQ','Africa/Malabo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(176,'GR','Europe/Athens',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(177,'GS','Atlantic/South_Georgia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(178,'GT','America/Guatemala',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(179,'GU','Pacific/Guam',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(180,'GW','Africa/Bissau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(181,'GY','America/Guyana',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(182,'HK','Asia/Hong_Kong',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(183,'HN','America/Tegucigalpa',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(184,'HR','Europe/Zagreb',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(185,'HT','America/Port-au-Prince',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(186,'HU','Europe/Budapest',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(187,'ID','Asia/Jakarta',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(188,'ID','Asia/Pontianak',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(189,'ID','Asia/Makassar',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(190,'ID','Asia/Jayapura',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(191,'IE','Europe/Dublin',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(192,'IL','Asia/Jerusalem',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(193,'IM','Europe/Isle_of_Man',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(194,'IN','Asia/Kolkata',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(195,'IO','Indian/Chagos',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(196,'IQ','Asia/Baghdad',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(197,'IR','Asia/Tehran',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(198,'IS','Atlantic/Reykjavik',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(199,'IT','Europe/Rome',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(200,'JE','Europe/Jersey',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(201,'JM','America/Jamaica',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(202,'JO','Asia/Amman',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(203,'JP','Asia/Tokyo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(204,'KE','Africa/Nairobi',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(205,'KG','Asia/Bishkek',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(206,'KH','Asia/Phnom_Penh',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(207,'KI','Pacific/Tarawa',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(208,'KI','Pacific/Enderbury',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(209,'KI','Pacific/Kiritimati',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(210,'KM','Indian/Comoro',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(211,'KN','America/St_Kitts',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(212,'KP','Asia/Pyongyang',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(213,'KR','Asia/Seoul',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(214,'KW','Asia/Kuwait',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(215,'KY','America/Cayman',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(216,'KZ','Asia/Almaty',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(217,'KZ','Asia/Qyzylorda',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(218,'KZ','Asia/Aqtobe',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(219,'KZ','Asia/Aqtau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(220,'KZ','Asia/Atyrau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(221,'KZ','Asia/Oral',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(222,'LA','Asia/Vientiane',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(223,'LB','Asia/Beirut',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(224,'LC','America/St_Lucia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(225,'LI','Europe/Vaduz',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(226,'LK','Asia/Colombo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(227,'LR','Africa/Monrovia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(228,'LS','Africa/Maseru',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(229,'LT','Europe/Vilnius',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(230,'LU','Europe/Luxembourg',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(231,'LV','Europe/Riga',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(232,'LY','Africa/Tripoli',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(233,'MA','Africa/Casablanca',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(234,'MC','Europe/Monaco',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(235,'MD','Europe/Chisinau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(236,'ME','Europe/Podgorica',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(237,'MF','America/Marigot',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(238,'MG','Indian/Antananarivo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(239,'MH','Pacific/Majuro',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(240,'MH','Pacific/Kwajalein',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(241,'MK','Europe/Skopje',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(242,'ML','Africa/Bamako',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(243,'MM','Asia/Yangon',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(244,'MN','Asia/Ulaanbaatar',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(245,'MN','Asia/Hovd',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(246,'MN','Asia/Choibalsan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(247,'MO','Asia/Macau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(248,'MP','Pacific/Saipan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(249,'MQ','America/Martinique',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(250,'MR','Africa/Nouakchott',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(251,'MS','America/Montserrat',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(252,'MT','Europe/Malta',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(253,'MU','Indian/Mauritius',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(254,'MV','Indian/Maldives',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(255,'MW','Africa/Blantyre',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(256,'MX','America/Mexico_City',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(257,'MX','America/Cancun',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(258,'MX','America/Merida',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(259,'MX','America/Monterrey',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(260,'MX','America/Matamoros',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(261,'MX','America/Mazatlan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(262,'MX','America/Chihuahua',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(263,'MX','America/Ojinaga',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(264,'MX','America/Hermosillo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(265,'MX','America/Tijuana',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(266,'MX','America/Bahia_Banderas',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(267,'MY','Asia/Kuala_Lumpur',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(268,'MY','Asia/Kuching',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(269,'MZ','Africa/Maputo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(270,'NA','Africa/Windhoek',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(271,'NC','Pacific/Noumea',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(272,'NE','Africa/Niamey',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(273,'NF','Pacific/Norfolk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(274,'NG','Africa/Lagos',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(275,'NI','America/Managua',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(276,'NL','Europe/Amsterdam',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(277,'NO','Europe/Oslo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(278,'NP','Asia/Kathmandu',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(279,'NR','Pacific/Nauru',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(280,'NU','Pacific/Niue',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(281,'NZ','Pacific/Auckland',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(282,'NZ','Pacific/Chatham',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(283,'OM','Asia/Muscat',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(284,'PA','America/Panama',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(285,'PE','America/Lima',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(286,'PF','Pacific/Tahiti',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(287,'PF','Pacific/Marquesas',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(288,'PF','Pacific/Gambier',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(289,'PG','Pacific/Port_Moresby',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(290,'PG','Pacific/Bougainville',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(291,'PH','Asia/Manila',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(292,'PK','Asia/Karachi',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(293,'PL','Europe/Warsaw',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(294,'PM','America/Miquelon',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(295,'PN','Pacific/Pitcairn',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(296,'PR','America/Puerto_Rico',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(297,'PS','Asia/Gaza',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(298,'PS','Asia/Hebron',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(299,'PT','Europe/Lisbon',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(300,'PT','Atlantic/Madeira',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(301,'PT','Atlantic/Azores',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(302,'PW','Pacific/Palau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(303,'PY','America/Asuncion',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(304,'QA','Asia/Qatar',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(305,'RE','Indian/Reunion',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(306,'RO','Europe/Bucharest',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(307,'RS','Europe/Belgrade',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(308,'RU','Europe/Kaliningrad',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(309,'RU','Europe/Moscow',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(310,'RU','Europe/Simferopol',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(311,'RU','Europe/Volgograd',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(312,'RU','Europe/Kirov',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(313,'RU','Europe/Astrakhan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(314,'RU','Europe/Saratov',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(315,'RU','Europe/Ulyanovsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(316,'RU','Europe/Samara',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(317,'RU','Asia/Yekaterinburg',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(318,'RU','Asia/Omsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(319,'RU','Asia/Novosibirsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(320,'RU','Asia/Barnaul',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(321,'RU','Asia/Tomsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(322,'RU','Asia/Novokuznetsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(323,'RU','Asia/Krasnoyarsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(324,'RU','Asia/Irkutsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(325,'RU','Asia/Chita',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(326,'RU','Asia/Yakutsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(327,'RU','Asia/Khandyga',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(328,'RU','Asia/Vladivostok',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(329,'RU','Asia/Ust-Nera',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(330,'RU','Asia/Magadan',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(331,'RU','Asia/Sakhalin',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(332,'RU','Asia/Srednekolymsk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(333,'RU','Asia/Kamchatka',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(334,'RU','Asia/Anadyr',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(335,'RW','Africa/Kigali',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(336,'SA','Asia/Riyadh',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(337,'SB','Pacific/Guadalcanal',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(338,'SC','Indian/Mahe',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(339,'SD','Africa/Khartoum',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(340,'SE','Europe/Stockholm',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(341,'SG','Asia/Singapore',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(342,'SH','Atlantic/St_Helena',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(343,'SI','Europe/Ljubljana',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(344,'SJ','Arctic/Longyearbyen',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(345,'SK','Europe/Bratislava',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(346,'SL','Africa/Freetown',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(347,'SM','Europe/San_Marino',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(348,'SN','Africa/Dakar',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(349,'SO','Africa/Mogadishu',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(350,'SR','America/Paramaribo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(351,'SS','Africa/Juba',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(352,'ST','Africa/Sao_Tome',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(353,'SV','America/El_Salvador',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(354,'SX','America/Lower_Princes',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(355,'SY','Asia/Damascus',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(356,'SZ','Africa/Mbabane',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(357,'TC','America/Grand_Turk',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(358,'TD','Africa/Ndjamena',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(359,'TF','Indian/Kerguelen',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(360,'TG','Africa/Lome',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(361,'TH','Asia/Bangkok',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(362,'TJ','Asia/Dushanbe',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(363,'TK','Pacific/Fakaofo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(364,'TL','Asia/Dili',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(365,'TM','Asia/Ashgabat',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(366,'TN','Africa/Tunis',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(367,'TO','Pacific/Tongatapu',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(368,'TR','Europe/Istanbul',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(369,'TT','America/Port_of_Spain',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(370,'TV','Pacific/Funafuti',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(371,'TW','Asia/Taipei',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(372,'TZ','Africa/Dar_es_Salaam',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(373,'UA','Europe/Kiev',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(374,'UA','Europe/Uzhgorod',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(375,'UA','Europe/Zaporozhye',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(376,'UG','Africa/Kampala',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(377,'UM','Pacific/Midway',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(378,'UM','Pacific/Wake',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(379,'US','America/New_York',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(380,'US','America/Detroit',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(381,'US','America/Kentucky/Louisville',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(382,'US','America/Kentucky/Monticello',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(383,'US','America/Indiana/Indianapolis',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(384,'US','America/Indiana/Vincennes',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(385,'US','America/Indiana/Winamac',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(386,'US','America/Indiana/Marengo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(387,'US','America/Indiana/Petersburg',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(388,'US','America/Indiana/Vevay',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(389,'US','America/Chicago',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(390,'US','America/Indiana/Tell_City',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(391,'US','America/Indiana/Knox',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(392,'US','America/Menominee',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(393,'US','America/North_Dakota/Center',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(394,'US','America/North_Dakota/New_Salem',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(395,'US','America/North_Dakota/Beulah',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(396,'US','America/Denver',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(397,'US','America/Boise',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(398,'US','America/Phoenix',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(399,'US','America/Los_Angeles',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(400,'US','America/Anchorage',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(401,'US','America/Juneau',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(402,'US','America/Sitka',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(403,'US','America/Metlakatla',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(404,'US','America/Yakutat',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(405,'US','America/Nome',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(406,'US','America/Adak',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(407,'US','Pacific/Honolulu',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(408,'UY','America/Montevideo',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(409,'UZ','Asia/Samarkand',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(410,'UZ','Asia/Tashkent',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(411,'VA','Europe/Vatican',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(412,'VC','America/St_Vincent',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(413,'VE','America/Caracas',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(414,'VG','America/Tortola',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(415,'VI','America/St_Thomas',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(416,'VN','Asia/Ho_Chi_Minh',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(417,'VU','Pacific/Efate',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(418,'WF','Pacific/Wallis',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(419,'WS','Pacific/Apia',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(420,'YE','Asia/Aden',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(421,'YT','Indian/Mayotte',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(422,'ZA','Africa/Johannesburg',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(423,'ZM','Africa/Lusaka',1,'2022-09-10 03:33:25','2022-09-10 03:33:25'),(424,'ZW','Africa/Harare',1,'2022-09-10 03:33:25','2022-09-10 03:33:25');
/*!40000 ALTER TABLE `time_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `transaction_type` bigint unsigned NOT NULL DEFAULT '18',
  `status_id` bigint unsigned NOT NULL DEFAULT '9',
  `created_by` bigint unsigned NOT NULL DEFAULT '1',
  `updated_by` bigint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_company_id_foreign` (`company_id`),
  KEY `transactions_account_id_foreign` (`account_id`),
  KEY `transaction_type` (`transaction_type`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `transactions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `transactions_transaction_type_foreign` FOREIGN KEY (`transaction_type`) REFERENCES `statuses` (`id`),
  CONSTRAINT `transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `default` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `bn` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `travel_type_id` bigint unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `expect_amount` double(16,2) DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` bigint unsigned DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` enum('bus','train','plane') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goal_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_company_id_foreign` (`company_id`),
  KEY `travel_user_id_foreign` (`user_id`),
  KEY `travel_created_by_foreign` (`created_by`),
  KEY `travel_travel_type_id_foreign` (`travel_type_id`),
  KEY `travel_attachment_foreign` (`attachment`),
  KEY `travel_goal_id_foreign` (`goal_id`),
  KEY `travel_id_travel_type_id_company_id_status_id_user_id_index` (`id`,`travel_type_id`,`company_id`,`status_id`,`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `travel_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `travel_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `travel_travel_type_id_foreign` FOREIGN KEY (`travel_type_id`) REFERENCES `travel_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
INSERT INTO `travel` VALUES (1,2,2,2,1,'2022-09-10','2022-09-17',1,100.00,100.00,'<strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',NULL,'test','test','bus',NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_types`
--

DROP TABLE IF EXISTS `travel_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned NOT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_types_company_id_foreign` (`company_id`),
  KEY `travel_types_id_status_id_company_id_index` (`id`,`status_id`,`company_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `travel_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_types`
--

LOCK TABLES `travel_types` WRITE;
/*!40000 ALTER TABLE `travel_types` DISABLE KEYS */;
INSERT INTO `travel_types` VALUES (1,'Business',2,1,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(2,'Personal',2,1,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(3,'Vacation',2,1,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33'),(4,'Other',2,1,2,1,'2022-09-10 03:33:33','2022-09-10 03:33:33');
/*!40000 ALTER TABLE `travel_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `file_original_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1920 x 1080',
  `small_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '300 x 300',
  `thumbnail_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '500 x 400',
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `status_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_status_id_index` (`status_id`),
  CONSTRAINT `uploads_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `device_token` longtext COLLATE utf8mb4_unicode_ci COMMENT 'device_token from firebase',
  `device_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'device_name from firebase',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_devices_user_id_foreign` (`user_id`),
  CONSTRAINT `user_devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_devices`
--

LOCK TABLES `user_devices` WRITE;
/*!40000 ALTER TABLE `user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `country_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `face_recognition` tinyint DEFAULT '1',
  `face_data` longtext COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_hr` tinyint DEFAULT NULL,
  `role_id` bigint unsigned DEFAULT NULL,
  `department_id` bigint unsigned DEFAULT NULL,
  `shift_id` bigint unsigned DEFAULT NULL,
  `designation_id` bigint unsigned DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `verification_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email verification code',
  `manager_id` bigint unsigned DEFAULT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_type` enum('Permanent','On Probation','Contractual','Intern') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'On Probation',
  `grade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_card_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_card_id` bigint unsigned DEFAULT NULL COMMENT 'this will be uploaded file',
  `facebook_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_file_id` bigint unsigned DEFAULT NULL COMMENT 'this will be passport file',
  `tin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin_id_front_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin_id_back_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_mobile_relationship` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verify_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email verify token',
  `is_email_verified` enum('verified','non-verified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'verified',
  `email_verified_at` timestamp NULL DEFAULT NULL COMMENT 'email verified at',
  `phone_verify_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'phone verify token',
  `is_phone_verified` enum('verified','non-verified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'verified',
  `phone_verified_at` timestamp NULL DEFAULT NULL COMMENT 'phone verified at',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hints` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user can set a password hint for easy remember',
  `avatar_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'last login at',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'last logout at',
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'last login ip',
  `device_token` longtext COLLATE utf8mb4_unicode_ci COMMENT 'device_token from firebase',
  `login_access` tinyint NOT NULL DEFAULT '1' COMMENT '0 = off, 1 = on',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female','Unisex','Others') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion` enum('Islam','Hindu','Christan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Islam',
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `basic_salary` double(16,2) NOT NULL DEFAULT '0.00',
  `marital_status` enum('Married','Unmarried') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unmarried',
  `contract_start_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `payslip_type` tinyint NOT NULL DEFAULT '1' COMMENT '1 = monthly, 2 = weekly, 3 = daily',
  `late_check_in` int NOT NULL DEFAULT '0',
  `early_check_out` int NOT NULL DEFAULT '0',
  `extra_leave` int NOT NULL DEFAULT '0',
  `monthly_leave` int NOT NULL DEFAULT '0',
  `is_free_location` tinyint NOT NULL DEFAULT '0',
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `users_company_id_foreign` (`company_id`),
  KEY `users_country_id_foreign` (`country_id`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_department_id_foreign` (`department_id`),
  KEY `users_shift_id_foreign` (`shift_id`),
  KEY `users_designation_id_foreign` (`designation_id`),
  KEY `users_manager_id_foreign` (`manager_id`),
  KEY `users_nid_card_id_foreign` (`nid_card_id`),
  KEY `users_passport_file_id_foreign` (`passport_file_id`),
  KEY `users_avatar_id_foreign` (`avatar_id`),
  KEY `users_status_id_index` (`status_id`),
  KEY `users_stripe_id_index` (`stripe_id`),
  CONSTRAINT `users_avatar_id_foreign` FOREIGN KEY (`avatar_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_nid_card_id_foreign` FOREIGN KEY (`nid_card_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_passport_file_id_foreign` FOREIGN KEY (`passport_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,17,'Super Admin',NULL,1,NULL,'superadmin@demo.com','+8801910077628','1',0,1,1,1,1,'[\"company_read\",\"company_create\",\"company_update\",\"company_delete\",\"user_banned\",\"user_unbanned\",\"general_settings_read\",\"general_settings_update\",\"email_settings_read\",\"email_settings_update\",\"storage_settings_update\",\"user_read\",\"user_edit\",\"user_update\",\"content_update\",\"subscriptions_read\"]',NULL,NULL,NULL,'On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'iQvDSuJlQx','verified','2022-09-10 03:33:32',NULL,'verified',NULL,'$2y$10$7qFuDMTq/evOYGzjfTl9Veur6dS6.G9mUpRgxKz86QI89nsd8ek/.',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,NULL,NULL,'g7qQvsSHeu',NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL,NULL,NULL,NULL,NULL),(2,2,17,'Admin',NULL,1,NULL,'admin@onesttech.com','+880177777777','1',0,5,16,4,30,'[\"team_menu\",\"team_list\",\"team_create\",\"team_update\",\"team_edit\",\"team_delete\",\"team_member_view\",\"team_member_create\",\"team_member_edit\",\"team_member_delete\",\"team_member_assign\",\"team_member_unassign\",\"dashboard\",\"hr_menu\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"shift_read\",\"shift_create\",\"shift_update\",\"shift_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_menu\",\"user_read\",\"profile_view\",\"user_create\",\"user_edit\",\"user_update\",\"user_delete\",\"user_banned\",\"user_unbanned\",\"make_hr\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"leave_menu\",\"leave_type_read\",\"leave_type_create\",\"leave_type_update\",\"leave_type_delete\",\"leave_assign_read\",\"leave_assign_create\",\"leave_assign_update\",\"leave_assign_delete\",\"leave_request_read\",\"leave_request_create\",\"leave_request_store\",\"leave_request_update\",\"leave_request_approve\",\"leave_request_reject\",\"leave_request_delete\",\"appointment_read\",\"appointment_create\",\"appointment_approve\",\"appointment_reject\",\"appointment_delete\",\"weekend_read\",\"weekend_update\",\"attendance_update\",\"holiday_read\",\"holiday_create\",\"holiday_update\",\"holiday_delete\",\"schedule_read\",\"schedule_create\",\"schedule_update\",\"schedule_delete\",\"attendance_menu\",\"attendance_read\",\"attendance_create\",\"attendance_update\",\"attendance_delete\",\"generate_qr_code\",\"leave_settings_read\",\"leave_settings_update\",\"company_settings_read\",\"company_settings_update\",\"locationApi\",\"company_setup_menu\",\"company_setup_activation\",\"company_setup_configuration\",\"company_setup_ip_whitelist\",\"company_setup_location\",\"location_create\",\"location_store\",\"location_edit\",\"location_update\",\"location_delete\",\"ip_read\",\"ip_create\",\"ip_update\",\"ip_delete\",\"attendance_report_read\",\"live_tracking_read\",\"report_menu\",\"report\",\"claim_read\",\"claim_create\",\"claim_update\",\"claim_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"visit_menu\",\"visit_read\",\"visit_view\",\"visit_update\",\"payroll_menu\",\"list_payroll_item\",\"create_payroll_item\",\"store_payroll_item\",\"update_payroll_item\",\"delete_payroll_item\",\"view_payroll_item\",\"payroll_item_menu\",\"list_payroll_set\",\"create_payroll_set\",\"store_payroll_set\",\"update_payroll_set\",\"delete_payroll_set\",\"view_payroll_set\",\"edit_payroll_set\",\"payroll_set_menu\",\"advance_salaries_menu\",\"advance_salaries_create\",\"advance_salaries_store\",\"advance_salaries_edit\",\"advance_salaries_update\",\"advance_salaries_delete\",\"advance_salaries_view\",\"advance_salaries_approve\",\"advance_salaries_list\",\"advance_salaries_pay\",\"advance_salaries_invoice\",\"advance_salaries_search\",\"payslip_menu\",\"salary_generate\",\"salary_view\",\"salary_delete\",\"salary_edit\",\"salary_update\",\"salary_payment\",\"payslip_list\",\"advance_type_menu\",\"advance_type_create\",\"advance_type_store\",\"advance_type_edit\",\"advance_type_update\",\"advance_type_delete\",\"advance_type_view\",\"advance_type_list\",\"salary_menu\",\"salary_store\",\"salary_edit\",\"salary_update\",\"salary_delete\",\"salary_view\",\"salary_list\",\"salary_search\",\"salary_pay\",\"salary_invoice\",\"salary_approve\",\"salary_generate\",\"salary_calculate\",\"account_menu\",\"account_create\",\"account_store\",\"account_edit\",\"account_update\",\"account_delete\",\"account_view\",\"account_list\",\"account_search\",\"deposit_menu\",\"deposit_create\",\"deposit_store\",\"deposit_edit\",\"deposit_update\",\"deposit_delete\",\"deposit_list\",\"expense_menu\",\"expense_create\",\"expense_store\",\"expense_edit\",\"expense_update\",\"expense_delete\",\"expense_list\",\"expense_view\",\"expense_approve\",\"expense_invoice\",\"expense_pay\",\"transaction_menu\",\"transaction_create\",\"transaction_store\",\"transaction_edit\",\"transaction_update\",\"transaction_delete\",\"transaction_view\",\"transaction_list\",\"deposit_category_menu\",\"deposit_category_create\",\"deposit_category_store\",\"deposit_category_edit\",\"deposit_category_update\",\"deposit_category_delete\",\"deposit_category_list\",\"payment_method_menu\",\"payment_method_create\",\"payment_method_store\",\"payment_method_edit\",\"payment_method_update\",\"payment_method_delete\",\"payment_method_list\",\"project_menu\",\"project_create\",\"project_store\",\"project_edit\",\"project_update\",\"project_delete\",\"project_view\",\"project_list\",\"project_activity_view\",\"project_member_view\",\"project_member_delete\",\"project_complete\",\"project_payment\",\"project_invoice_view\",\"project_discussion_create\",\"project_discussion_store\",\"project_discussion_edit\",\"project_discussion_update\",\"project_discussion_delete\",\"project_discussion_view\",\"project_discussion_list\",\"project_discussion_comment\",\"project_discussion_reply\",\"project_file_create\",\"project_file_store\",\"project_file_edit\",\"project_file_update\",\"project_file_delete\",\"project_file_view\",\"project_file_list\",\"project_file_download\",\"project_file_comment\",\"project_file_reply\",\"project_notes_create\",\"project_notes_store\",\"project_notes_edit\",\"project_notes_update\",\"project_notes_delete\",\"project_notes_list\",\"client_menu\",\"client_create\",\"client_store\",\"client_edit\",\"client_update\",\"client_delete\",\"client_view\",\"client_list\",\"task_menu\",\"task_create\",\"task_store\",\"task_edit\",\"task_update\",\"task_delete\",\"task_view\",\"task_list\",\"task_activity_view\",\"task_assign_view\",\"task_assign_delete\",\"task_complete\",\"task_discussion_create\",\"task_discussion_store\",\"task_discussion_edit\",\"task_discussion_update\",\"task_discussion_delete\",\"task_discussion_view\",\"task_discussion_list\",\"task_discussion_comment\",\"task_discussion_reply\",\"task_file_create\",\"task_file_store\",\"task_file_edit\",\"task_file_update\",\"task_file_delete\",\"task_file_view\",\"task_file_list\",\"task_file_download\",\"task_file_comment\",\"task_file_reply\",\"task_notes_create\",\"task_notes_store\",\"task_notes_edit\",\"task_notes_update\",\"task_notes_delete\",\"task_notes_list\",\"task_files_comment\",\"award_type_menu\",\"award_type_create\",\"award_type_store\",\"award_type_edit\",\"award_type_update\",\"award_type_delete\",\"award_type_view\",\"award_type_list\",\"award_menu\",\"award_create\",\"award_store\",\"award_edit\",\"award_update\",\"award_delete\",\"award_list\",\"travel_type_menu\",\"travel_type_create\",\"travel_type_store\",\"travel_type_edit\",\"travel_type_update\",\"travel_type_delete\",\"travel_type_view\",\"travel_type_list\",\"travel_menu\",\"travel_create\",\"travel_store\",\"travel_edit\",\"travel_update\",\"travel_delete\",\"travel_list\",\"travel_approve\",\"travel_payment\",\"performance_menu\",\"performance_settings\",\"performance_indicator_menu\",\"performance_indicator_list\",\"performance_indicator_create\",\"performance_indicator_store\",\"performance_indicator_edit\",\"performance_indicator_update\",\"performance_indicator_delete\",\"performance_appraisal_menu\",\"performance_appraisal_create\",\"performance_appraisal_store\",\"performance_appraisal_edit\",\"performance_appraisal_update\",\"performance_appraisal_delete\",\"performance_appraisal_list\",\"performance_appraisal_view\",\"performance_goal_type_menu\",\"performance_goal_type_create\",\"performance_goal_type_store\",\"performance_goal_type_edit\",\"performance_goal_type_update\",\"performance_goal_type_delete\",\"performance_goal_type_list\",\"performance_goal_menu\",\"performance_goal_create\",\"performance_goal_store\",\"performance_goal_edit\",\"performance_goal_update\",\"performance_goal_delete\",\"performance_goal_view\",\"performance_goal_list\",\"performance_competence_type_list\",\"performance_competence_type_menu\",\"performance_competence_type_create\",\"performance_competence_type_store\",\"performance_competence_type_edit\",\"performance_competence_type_update\",\"performance_competence_type_delete\",\"performance_competence_type_view\",\"performance_competence_menu\",\"performance_competence_create\",\"performance_competence_store\",\"performance_competence_edit\",\"performance_competence_update\",\"performance_competence_delete\",\"performance_competence_view\",\"performance_competence_list\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',NULL,NULL,NULL,'On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0zNBgi5ZZt','verified','2022-09-10 03:33:32',NULL,'verified',NULL,'$2y$10$/3vwm/l17SjVk68guuqZDeUzFQRpesdXs8Dj07m75K8/Z8qhFPjji',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,NULL,NULL,'RxGujqknEPfSexwlIjYA9BCsZ5IOPVVSy35prfVVgldfPldAp8WNabBUtEfR',NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL,NULL,NULL,NULL,NULL),(3,2,17,'Hr Manager',NULL,1,NULL,'hr@onesttech.com','+88014555887','0',1,3,17,4,33,'[\"team_menu\",\"team_list\",\"team_create\",\"team_update\",\"team_edit\",\"team_delete\",\"team_member_view\",\"team_member_create\",\"team_member_edit\",\"team_member_delete\",\"team_member_assign\",\"team_member_unassign\",\"dashboard\",\"designation_read\",\"designation_create\",\"designation_update\",\"designation_delete\",\"shift_read\",\"shift_create\",\"shift_update\",\"shift_delete\",\"department_read\",\"department_create\",\"department_update\",\"department_delete\",\"user_menu\",\"user_read\",\"profile_view\",\"user_create\",\"user_edit\",\"user_update\",\"user_delete\",\"user_banned\",\"user_unbanned\",\"make_hr\",\"role_read\",\"role_create\",\"role_update\",\"role_delete\",\"leave_menu\",\"leave_type_read\",\"leave_type_create\",\"leave_type_update\",\"leave_type_delete\",\"leave_assign_read\",\"leave_assign_create\",\"leave_assign_update\",\"leave_assign_delete\",\"leave_request_read\",\"leave_request_create\",\"leave_request_approve\",\"leave_request_reject\",\"leave_request_delete\",\"appointment_read\",\"appointment_create\",\"appointment_approve\",\"appointment_reject\",\"appointment_delete\",\"weekend_read\",\"weekend_update\",\"attendance_update\",\"holiday_read\",\"holiday_create\",\"holiday_update\",\"holiday_delete\",\"schedule_read\",\"schedule_create\",\"schedule_update\",\"schedule_delete\",\"attendance_menu\",\"attendance_read\",\"attendance_create\",\"attendance_update\",\"attendance_delete\",\"leave_settings_read\",\"leave_settings_update\",\"company_settings_read\",\"company_settings_update\",\"locationApi\",\"company_setup_menu\",\"company_setup_activation\",\"company_setup_configuration\",\"company_setup_ip_whitelist\",\"company_setup_location\",\"ip_read\",\"ip_create\",\"ip_update\",\"ip_delete\",\"attendance_report_read\",\"live_tracking_read\",\"report_menu\",\"report\",\"claim_read\",\"claim_create\",\"claim_update\",\"claim_delete\",\"payment_read\",\"payment_create\",\"payment_update\",\"payment_delete\",\"visit_menu\",\"visit_read\",\"visit_view\",\"visit_update\",\"payroll_menu\",\"list_payroll_item\",\"create_payroll_item\",\"store_payroll_item\",\"update_payroll_item\",\"delete_payroll_item\",\"view_payroll_item\",\"payroll_item_menu\",\"list_payroll_set\",\"create_payroll_set\",\"store_payroll_set\",\"update_payroll_set\",\"delete_payroll_set\",\"view_payroll_set\",\"edit_payroll_set\",\"payroll_set_menu\",\"advance_salaries_menu\",\"advance_salaries_create\",\"advance_salaries_store\",\"advance_salaries_edit\",\"advance_salaries_update\",\"advance_salaries_delete\",\"advance_salaries_view\",\"advance_salaries_approve\",\"advance_salaries_list\",\"advance_salaries_pay\",\"advance_salaries_invoice\",\"advance_salaries_search\",\"payslip_menu\",\"salary_generate\",\"salary_view\",\"salary_delete\",\"salary_edit\",\"salary_update\",\"salary_payment\",\"payslip_list\",\"advance_type_menu\",\"advance_type_create\",\"advance_type_store\",\"advance_type_edit\",\"advance_type_update\",\"advance_type_delete\",\"advance_type_view\",\"advance_type_list\",\"salary_menu\",\"salary_store\",\"salary_edit\",\"salary_update\",\"salary_delete\",\"salary_view\",\"salary_list\",\"salary_search\",\"salary_pay\",\"salary_invoice\",\"salary_approve\",\"salary_generate\",\"salary_calculate\",\"account_menu\",\"account_create\",\"account_store\",\"account_edit\",\"account_update\",\"account_delete\",\"account_view\",\"account_list\",\"account_search\",\"deposit_menu\",\"deposit_create\",\"deposit_store\",\"deposit_edit\",\"deposit_update\",\"deposit_delete\",\"deposit_list\",\"expense_menu\",\"expense_create\",\"expense_store\",\"expense_edit\",\"expense_update\",\"expense_delete\",\"expense_list\",\"expense_view\",\"expense_approve\",\"expense_invoice\",\"expense_pay\",\"transaction_menu\",\"transaction_create\",\"transaction_store\",\"transaction_edit\",\"transaction_update\",\"transaction_delete\",\"transaction_view\",\"transaction_list\",\"deposit_category_menu\",\"deposit_category_create\",\"deposit_category_store\",\"deposit_category_edit\",\"deposit_category_update\",\"deposit_category_delete\",\"deposit_category_list\",\"payment_method_menu\",\"payment_method_create\",\"payment_method_store\",\"payment_method_edit\",\"payment_method_update\",\"payment_method_delete\",\"payment_method_list\",\"travel_menu\",\"travel_create\",\"travel_store\",\"travel_edit\",\"travel_update\",\"travel_delete\",\"travel_list\",\"travel_view\",\"travel_approve\",\"travel_invoice\",\"travel_pay\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"announcement_menu\",\"notice_menu\",\"notice_list\",\"notice_create\",\"notice_update\",\"notice_edit\",\"notice_delete\",\"send_sms_menu\",\"send_sms_list\",\"send_sms_create\",\"send_sms_update\",\"send_sms_edit\",\"send_sms_delete\",\"send_email_menu\",\"send_email_list\",\"send_email_create\",\"send_email_update\",\"send_email_edit\",\"send_email_delete\",\"send_notification_menu\",\"send_notification_list\",\"send_notification_create\",\"send_notification_update\",\"send_notification_edit\",\"send_notification_delete\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',NULL,NULL,NULL,'On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'feSz7uG4OF','verified','2022-09-10 03:33:32',NULL,'verified',NULL,'$2y$10$RbZoX6KR6SlgkMBpIx2z7.gtQWi1/k4HUkdVXeraWBEdC5E3cW5t.',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,NULL,NULL,'rJXhC4n6Oi',NULL,'2022-09-10 03:33:32','2022-09-10 03:33:32',NULL,NULL,NULL,NULL,NULL),(4,2,17,'Staff',NULL,1,NULL,'staff@onesttech.com','+8855412547','0',0,7,18,4,44,'[\"dashboard\",\"profile_view\",\"attendance_menu\",\"user_update\",\"attendance_read\",\"attendance_create\",\"leave_request_read\",\"leave_request_create\",\"support_menu\",\"support_read\",\"support_create\",\"support_reply\",\"support_delete\"]',NULL,NULL,NULL,'On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'fH13Mbyg5b','verified','2022-09-10 03:33:33',NULL,'verified',NULL,'$2y$10$1XmQytDKd6rRf6hvpwR4huuNhvBLf43qQb6PeP08WUztkBaHU8dva',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,NULL,NULL,'bPdrURl8cE',NULL,'2022-09-10 03:33:33','2022-09-10 03:33:33',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_meetings`
--

DROP TABLE IF EXISTS `virtual_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtual_meetings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` int DEFAULT '0' COMMENT '0 means unlimited',
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'jitsi',
  `description` text COLLATE utf8mb4_unicode_ci,
  `datetime` text COLLATE utf8mb4_unicode_ci,
  `status_id` bigint unsigned NOT NULL DEFAULT '1',
  `company_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `virtual_meetings_company_id_foreign` (`company_id`),
  KEY `virtual_meetings_created_by_foreign` (`created_by`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `virtual_meetings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `virtual_meetings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `virtual_meetings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_meetings`
--

LOCK TABLES `virtual_meetings` WRITE;
/*!40000 ALTER TABLE `virtual_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_images`
--

DROP TABLE IF EXISTS `visit_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `imageable_id` int unsigned NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_images`
--

LOCK TABLES `visit_images` WRITE;
/*!40000 ALTER TABLE `visit_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_notes`
--

DROP TABLE IF EXISTS `visit_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` bigint unsigned NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('created','started','reached') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visit_notes_visit_id_foreign` (`visit_id`),
  CONSTRAINT `visit_notes_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_notes`
--

LOCK TABLES `visit_notes` WRITE;
/*!40000 ALTER TABLE `visit_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_schedules`
--

DROP TABLE IF EXISTS `visit_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visit_id` bigint unsigned NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('created','started','reached','end') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
  `started_at` timestamp NULL DEFAULT NULL,
  `reached_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visit_schedules_visit_id_foreign` (`visit_id`),
  CONSTRAINT `visit_schedules_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_schedules`
--

LOCK TABLES `visit_schedules` WRITE;
/*!40000 ALTER TABLE `visit_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `status` enum('created','started','reached','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'created',
  `cancel_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visits_company_id_foreign` (`company_id`),
  KEY `visits_user_id_foreign` (`user_id`),
  CONSTRAINT `visits_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `visits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekends`
--

DROP TABLE IF EXISTS `weekends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weekends` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint unsigned NOT NULL,
  `name` enum('saturday','sunday','monday','tuesday','wednesday','thursday','friday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int DEFAULT NULL,
  `is_weekend` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `status_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned DEFAULT '1',
  `updated_by` bigint unsigned DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `weekends_company_id_foreign` (`company_id`),
  KEY `weekends_status_id_foreign` (`status_id`),
  KEY `weekends_id_index` (`id`),
  CONSTRAINT `weekends_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `weekends_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekends`
--

LOCK TABLES `weekends` WRITE;
/*!40000 ALTER TABLE `weekends` DISABLE KEYS */;
INSERT INTO `weekends` VALUES (1,1,'saturday',NULL,'yes',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(2,1,'sunday',NULL,'yes',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(3,1,'monday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(4,1,'tuesday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(5,1,'wednesday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(6,1,'thursday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(7,1,'friday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(8,2,'saturday',NULL,'yes',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(9,2,'sunday',NULL,'yes',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(10,2,'monday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(11,2,'tuesday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(12,2,'wednesday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(13,2,'thursday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32'),(14,2,'friday',NULL,'no',1,1,1,'2022-09-10 03:33:32','2022-09-10 03:33:32');
/*!40000 ALTER TABLE `weekends` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-24 15:20:29
