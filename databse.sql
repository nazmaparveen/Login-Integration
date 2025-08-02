-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: medication_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('a09e01ae-d447-4f1e-9819-ae5cb66b9e42','d5a56c3729bd680d643b98c14a40ede3f2880fed549fbbb0dc235ebe759d39df','2025-07-16 19:47:13.983','20250713181342_init',NULL,NULL,'2025-07-16 19:47:13.647',1),('eff27719-9ad9-4483-936c-3401c3d3a374','a3da03b51b858cc7b138d8e01463b21c0ba92137433f5cb4f3bf9e08190f4a8e',NULL,'20250728073922_add_user_model','A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20250728073922_add_user_model\n\nDatabase error code: 1826\n\nDatabase error:\nDuplicate foreign key constraint name \'Assignment_medicationId_fkey\'\n\nPlease check the query number 4 from the migration file.\n\n   0: sql_schema_connector::apply_migration::apply_script\n           with migration_name=\"20250728073922_add_user_model\"\n             at schema-engine\\connectors\\sql-schema-connector\\src\\apply_migration.rs:113\n   1: schema_commands::commands::apply_migrations::Applying migration\n           with migration_name=\"20250728073922_add_user_model\"\n             at schema-engine\\commands\\src\\commands\\apply_migrations.rs:91\n   2: schema_core::state::ApplyMigrations\n             at schema-engine\\core\\src\\state.rs:236',NULL,'2025-07-28 07:39:22.907',0);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patientId` int NOT NULL,
  `medicationId` int NOT NULL,
  `startDate` datetime(3) NOT NULL,
  `endDate` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Assignment_medicationId_fkey` (`medicationId`),
  CONSTRAINT `Assignment_medicationId_fkey` FOREIGN KEY (`medicationId`) REFERENCES `medication` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (14,1,3,'2025-07-09 00:00:00.000','2025-07-22 00:00:00.000');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dosage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (1,'Nazma parveen','100mg','Twice daily'),(3,'shwz','400mg','once daily'),(4,'sony','100mg','once daily'),(5,'Sabiha','500mg','once daily');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Patient_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'naz','naz@example.com','1995-04-15 08:30:00.000'),(4,'n','n@gmail.com','1992-06-30 09:00:00.000'),(5,'naz','naz@gmail.com','1992-06-30 09:00:00.000');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_username_key` (`username`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'naz','nazabc2002@gmail.com','$2b$10$sh1AWGUuP3.OzTBREr5R5OYz6aXSZsXxFr.V27cZ/1HSBoKNw8xGq','2025-07-28 17:42:23.053','2025-07-28 17:42:23.053'),(5,'naz@123gmail.com','nazabc2020@gmail.com','$2b$10$GyBZ4BJvB.mqjWONMyKpF.T/eIpbtCNYvqQj..UD5eM8O8apuUkHm','2025-07-28 19:27:16.607','2025-07-28 19:27:16.607'),(8,'n','n@gmail.com','$2b$10$Rhu4GbXQocCQlLxNRI9qQu7wR6fxrNH9cn3Yywl21Dfhh4Ey3WeMS','2025-07-29 17:25:21.777','2025-07-29 17:25:21.777'),(15,'sony','sony@gmail.com','$2b$10$tNf0IpQNVLYPcgh/6nDJDu.g.VCdid5RWBWdDQjr6wi64tLAO3AhK','2025-07-30 07:00:57.026','2025-07-30 07:00:57.026'),(16,'sh','sh@gmail.com','$2b$10$2ik26YHJ/RdgXNp3UnpJk.u099eEEt.bel27zFb015mSJ2ybjEAyG','2025-08-01 06:16:13.505','2025-08-01 06:16:13.505'),(21,'shwz','sh@gmailo.com','$2b$10$39JiX2Zq8OBCLgljUR64P.PKP1KFaeRCzauLg8aEG8nLxQt5AJZLa','2025-08-01 06:42:13.433','2025-08-01 06:42:13.433'),(22,'test','test@example.com','$2b$10$gPEVM.GhdVFlgDHMssmPP.Obi68P2ZMt63I9Q2olTDd7Tj/Gpl4Ie','2025-08-01 10:01:14.532','2025-08-01 10:01:14.532'),(23,'helo','helo@gmail.com','$2b$10$Bk5LLMf/HSkttR80uDKV3eLUOwvL5qrPQGrqhT7XOlrsz7DWsIgam','2025-08-01 11:41:46.502','2025-08-01 11:41:46.502'),(24,'hiii','hi@example.com','$2b$10$i5v8xpHFsKTJitJNJTS5neIWJfCBmjtQcRBDN4KRNv88VHYLS.8Ym','2025-08-01 15:16:21.091','2025-08-01 15:16:21.091'),(25,'akla','alka@example.com','$2b$10$SE0.e7hCfA2KokVSdLFdJeI83XQDr5n5QbTM8t3fY4/I2lxOnvYr6','2025-08-01 15:53:20.392','2025-08-01 15:53:20.392'),(26,'shsh','nazsony@123gmail.com','$2b$10$3zAKhOb5gdxaALHMys9DKe8q6ObYpU.ze6/ix9PXbF8PphwYe5qkq','2025-08-01 18:22:24.718','2025-08-01 18:22:24.718'),(27,'tfhg','ggfh@gmail.com','$2b$10$LjDD0oTNIuqZ73XMbinatOZBqqV8wB.7geJqlwid9aZdGtzmcRhCW','2025-08-01 18:41:27.193','2025-08-01 18:41:27.193'),(28,'fbh','gfdfg@gmail.com','$2b$10$YkjSLsllkyEHXSeuwvkP4eXJR4Ug/66Xy9qwb97qqbenzJoCWNY8m','2025-08-01 19:02:28.527','2025-08-01 19:02:28.527'),(29,'john_doe','user@example.com','$2b$10$KJOsXOy4k5Q.Eje2fvYHa.rRfq3Z1TmkmzmmJlmXI2wYqw6VBImK.','2025-08-02 06:51:46.354','2025-08-02 06:51:46.354'),(30,'john','john@example.com','$2b$10$GVP35TW6Blv1tOups.n37OaLg4mOSl0ecw52mgPmytZDQIkmPM3eG','2025-08-02 06:56:17.733','2025-08-02 06:56:17.733');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-02 12:46:54
