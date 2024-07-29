-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: netopia_django
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add department',7,'add_department'),(26,'Can change department',7,'change_department'),(27,'Can delete department',7,'delete_department'),(28,'Can view department',7,'view_department'),(29,'Can add speed test',8,'add_speedtest'),(30,'Can change speed test',8,'change_speedtest'),(31,'Can delete speed test',8,'delete_speedtest'),(32,'Can view speed test',8,'view_speedtest');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments_department`
--

DROP TABLE IF EXISTS `departments_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `manager_id` bigint DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `departments_departme_manager_id_54b667cc_fk_users_cus` (`manager_id`),
  KEY `departments_departme_parent_id_cc8b848e_fk_departmen` (`parent_id`),
  CONSTRAINT `departments_departme_manager_id_54b667cc_fk_users_cus` FOREIGN KEY (`manager_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `departments_departme_parent_id_cc8b848e_fk_departmen` FOREIGN KEY (`parent_id`) REFERENCES `departments_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_department`
--

LOCK TABLES `departments_department` WRITE;
/*!40000 ALTER TABLE `departments_department` DISABLE KEYS */;
INSERT INTO `departments_department` VALUES (1,'IT',19018,NULL),(2,'Achizitii',440022,NULL),(3,'Vanzari',19015,2);
/*!40000 ALTER TABLE `departments_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-07-29 07:08:21.627925','18','SpeedTest object (18)',3,'',8,440022),(2,'2024-07-29 07:08:21.631102','17','SpeedTest object (17)',3,'',8,440022),(3,'2024-07-29 07:08:21.637017','16','SpeedTest object (16)',3,'',8,440022),(4,'2024-07-29 07:08:21.640243','15','SpeedTest object (15)',3,'',8,440022),(5,'2024-07-29 07:08:21.642978','14','SpeedTest object (14)',3,'',8,440022),(6,'2024-07-29 07:08:21.645318','13','SpeedTest object (13)',3,'',8,440022),(7,'2024-07-29 07:08:21.646915','12','SpeedTest object (12)',3,'',8,440022),(8,'2024-07-29 07:08:21.648290','11','SpeedTest object (11)',3,'',8,440022),(9,'2024-07-29 07:08:21.653810','10','SpeedTest object (10)',3,'',8,440022),(10,'2024-07-29 07:08:21.656148','9','SpeedTest object (9)',3,'',8,440022),(11,'2024-07-29 07:08:21.658816','8','SpeedTest object (8)',3,'',8,440022),(12,'2024-07-29 07:08:21.660257','7','SpeedTest object (7)',3,'',8,440022),(13,'2024-07-29 07:08:21.661857','6','SpeedTest object (6)',3,'',8,440022),(14,'2024-07-29 07:08:21.663401','5','SpeedTest object (5)',3,'',8,440022),(15,'2024-07-29 07:08:21.665285','4','SpeedTest object (4)',3,'',8,440022),(16,'2024-07-29 07:08:21.669622','3','SpeedTest object (3)',3,'',8,440022),(17,'2024-07-29 07:08:21.671622','2','SpeedTest object (2)',3,'',8,440022),(18,'2024-07-29 07:08:21.673462','1','SpeedTest object (1)',3,'',8,440022),(19,'2024-07-29 08:34:24.312969','53','SpeedTest object (53)',3,'',8,440022),(20,'2024-07-29 08:34:24.315590','52','SpeedTest object (52)',3,'',8,440022),(21,'2024-07-29 08:34:24.321257','51','SpeedTest object (51)',3,'',8,440022),(22,'2024-07-29 08:34:24.324680','50','SpeedTest object (50)',3,'',8,440022),(23,'2024-07-29 08:34:24.327581','49','SpeedTest object (49)',3,'',8,440022),(24,'2024-07-29 08:34:24.329293','48','SpeedTest object (48)',3,'',8,440022),(25,'2024-07-29 08:34:24.330833','47','SpeedTest object (47)',3,'',8,440022),(26,'2024-07-29 08:34:24.332259','46','SpeedTest object (46)',3,'',8,440022),(27,'2024-07-29 08:34:24.336428','45','SpeedTest object (45)',3,'',8,440022),(28,'2024-07-29 08:34:24.338864','44','SpeedTest object (44)',3,'',8,440022),(29,'2024-07-29 08:34:24.340102','43','SpeedTest object (43)',3,'',8,440022),(30,'2024-07-29 08:34:24.341770','42','SpeedTest object (42)',3,'',8,440022),(31,'2024-07-29 08:34:24.342869','41','SpeedTest object (41)',3,'',8,440022),(32,'2024-07-29 08:34:24.343974','40','SpeedTest object (40)',3,'',8,440022),(33,'2024-07-29 08:34:24.345530','39','SpeedTest object (39)',3,'',8,440022),(34,'2024-07-29 08:34:24.346710','38','SpeedTest object (38)',3,'',8,440022),(35,'2024-07-29 08:34:24.347981','37','SpeedTest object (37)',3,'',8,440022),(36,'2024-07-29 08:34:24.352161','36','SpeedTest object (36)',3,'',8,440022),(37,'2024-07-29 08:34:24.354444','35','SpeedTest object (35)',3,'',8,440022),(38,'2024-07-29 08:34:24.355878','34','SpeedTest object (34)',3,'',8,440022),(39,'2024-07-29 08:34:24.357461','33','SpeedTest object (33)',3,'',8,440022),(40,'2024-07-29 08:34:24.358670','32','SpeedTest object (32)',3,'',8,440022),(41,'2024-07-29 08:34:24.359782','31','SpeedTest object (31)',3,'',8,440022),(42,'2024-07-29 08:34:24.361298','30','SpeedTest object (30)',3,'',8,440022),(43,'2024-07-29 08:34:24.362514','29','SpeedTest object (29)',3,'',8,440022),(44,'2024-07-29 08:34:24.363842','28','SpeedTest object (28)',3,'',8,440022),(45,'2024-07-29 08:34:24.365875','27','SpeedTest object (27)',3,'',8,440022),(46,'2024-07-29 08:34:24.368846','26','SpeedTest object (26)',3,'',8,440022),(47,'2024-07-29 08:34:24.370913','25','SpeedTest object (25)',3,'',8,440022),(48,'2024-07-29 08:34:24.372384','24','SpeedTest object (24)',3,'',8,440022),(49,'2024-07-29 08:34:24.373929','23','SpeedTest object (23)',3,'',8,440022),(50,'2024-07-29 08:34:24.375181','22','SpeedTest object (22)',3,'',8,440022),(51,'2024-07-29 08:34:24.376827','21','SpeedTest object (21)',3,'',8,440022),(52,'2024-07-29 08:34:24.378591','20','SpeedTest object (20)',3,'',8,440022),(53,'2024-07-29 08:34:24.379824','19','SpeedTest object (19)',3,'',8,440022),(54,'2024-07-29 09:32:01.964903','69','SpeedTest object (69)',3,'',8,440022),(55,'2024-07-29 09:32:01.970350','68','SpeedTest object (68)',3,'',8,440022),(56,'2024-07-29 09:32:01.976660','67','SpeedTest object (67)',3,'',8,440022),(57,'2024-07-29 09:32:01.984114','66','SpeedTest object (66)',3,'',8,440022),(58,'2024-07-29 09:32:01.991156','65','SpeedTest object (65)',3,'',8,440022),(59,'2024-07-29 09:32:01.998312','64','SpeedTest object (64)',3,'',8,440022),(60,'2024-07-29 09:32:02.003043','63','SpeedTest object (63)',3,'',8,440022),(61,'2024-07-29 09:32:02.007351','62','SpeedTest object (62)',3,'',8,440022),(62,'2024-07-29 09:32:02.016036','61','SpeedTest object (61)',3,'',8,440022),(63,'2024-07-29 09:32:02.019572','60','SpeedTest object (60)',3,'',8,440022),(64,'2024-07-29 09:32:02.023398','59','SpeedTest object (59)',3,'',8,440022),(65,'2024-07-29 09:32:02.029812','58','SpeedTest object (58)',3,'',8,440022),(66,'2024-07-29 09:32:02.033294','57','SpeedTest object (57)',3,'',8,440022),(67,'2024-07-29 09:32:02.036117','56','SpeedTest object (56)',3,'',8,440022),(68,'2024-07-29 09:32:02.039874','55','SpeedTest object (55)',3,'',8,440022),(69,'2024-07-29 09:32:02.045524','54','SpeedTest object (54)',3,'',8,440022);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'departments','department'),(5,'sessions','session'),(6,'users','customuser'),(8,'users','speedtest');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'departments','0001_initial','2024-07-27 13:25:54.515864'),(2,'contenttypes','0001_initial','2024-07-27 13:25:54.565161'),(3,'contenttypes','0002_remove_content_type_name','2024-07-27 13:25:54.611176'),(4,'auth','0001_initial','2024-07-27 13:25:54.749117'),(5,'auth','0002_alter_permission_name_max_length','2024-07-27 13:25:54.789347'),(6,'auth','0003_alter_user_email_max_length','2024-07-27 13:25:54.796201'),(7,'auth','0004_alter_user_username_opts','2024-07-27 13:25:54.803467'),(8,'auth','0005_alter_user_last_login_null','2024-07-27 13:25:54.813682'),(9,'auth','0006_require_contenttypes_0002','2024-07-27 13:25:54.816139'),(10,'auth','0007_alter_validators_add_error_messages','2024-07-27 13:25:54.825219'),(11,'auth','0008_alter_user_username_max_length','2024-07-27 13:25:54.831409'),(12,'auth','0009_alter_user_last_name_max_length','2024-07-27 13:25:54.837639'),(13,'auth','0010_alter_group_name_max_length','2024-07-27 13:25:54.887725'),(14,'auth','0011_update_proxy_permissions','2024-07-27 13:25:54.896459'),(15,'auth','0012_alter_user_first_name_max_length','2024-07-27 13:25:54.902993'),(16,'users','0001_initial','2024-07-27 13:25:55.100084'),(17,'admin','0001_initial','2024-07-27 13:25:55.199356'),(18,'admin','0002_logentry_remove_auto_add','2024-07-27 13:25:55.210582'),(19,'admin','0003_logentry_add_action_flag_choices','2024-07-27 13:25:55.221727'),(20,'departments','0002_initial','2024-07-27 13:25:55.325332'),(21,'sessions','0001_initial','2024-07-27 13:25:55.361484'),(22,'users','0002_speedtest','2024-07-29 06:35:36.443683'),(23,'users','0003_alter_customuser_options_and_more','2024-07-29 06:51:20.032768'),(24,'users','0004_alter_speedtest_source','2024-07-29 07:13:36.944256'),(25,'users','0005_alter_speedtest_source','2024-07-29 07:48:43.067353');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('sgpsdrwf51h1fvs39z6g1qn6tvfjjawf','.eJxVyzsOwjAQhOG7uEaR7azXMSUS57DG8a4c8SgwqRB3h0gpoPz1zbxMxvpsee3yyEs1R0Nkrffm8AsF80Xum27Zh737cL5huZ52_bs09Pbdw0uoCje5EMsc4VMRl2yp6mNhdTUKUZiYhBRITLCQqKMdWUJQNu8PVqM0GA:1sYKSi:v41HIOdhpzkL8EeMec5VCWjbh0HZ7G41Gt9KjIYV6Qo','2024-08-12 07:06:28.486811');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `department_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `users_custo_departm_fce76f_idx` (`department_id`),
  CONSTRAINT `users_customuser_department_id_6025b80c_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `departments_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=440023 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser`
--

LOCK TABLES `users_customuser` WRITE;
/*!40000 ALTER TABLE `users_customuser` DISABLE KEYS */;
INSERT INTO `users_customuser` VALUES (19007,'ubMXQMSR8p',NULL,0,'16f965a4-6125-4601-b81f-58285ead47f1',0,1,'2024-07-27 17:08:42.911291','cassandra20@example.com','Allen','Romero',1),(19008,'UkYTRGa86q',NULL,0,'6e7e962c-40ff-419d-9c64-2b2517c48df3',0,1,'2024-07-27 17:08:42.911454','spencerbrian@example.org','Edward','Hopkins',2),(19009,'w2fQK3jPwJ',NULL,0,'f4384ab3-67f9-41ae-91d9-6a3bcd77030e',0,1,'2024-07-27 17:08:42.911660','hayescynthia@example.com','Victor','Haney',2),(19010,'HcpQXfp2SK',NULL,0,'88e4334f-295e-44e8-bd9e-f957c3ddd3df',0,1,'2024-07-27 17:08:42.911834','woodsscott@example.net','Brandon','Duke',1),(19011,'zG5Jc7wqKT',NULL,0,'12577b60-3318-4a3d-9d9b-405ebfc67aaf',0,1,'2024-07-27 17:08:42.912008','danielburgess@example.org','Mary','Martin',2),(19012,'ZT6d9UfTJ9',NULL,0,'2d21bdd7-cb30-480f-8db6-8bb43a4ea49c',0,1,'2024-07-27 17:08:42.912223','sarahtucker@example.com','Stephanie','Bender',3),(19013,'f84H2D5c6R',NULL,0,'758ee5d7-7c21-4c31-8363-f972075707fe',0,1,'2024-07-27 17:08:42.912361','rphillips@example.com','Craig','Deleon',3),(19014,'FBzUTGZgzS',NULL,0,'c357dc8e-2919-4173-acc7-cad614d6faa1',0,1,'2024-07-27 17:08:42.912532','cassandramcdowell@example.net','Brandy','Wiley',1),(19015,'PMtmB4VBBc',NULL,0,'707e136d-1750-4d1a-9c3e-95d6b8b55f9f',0,1,'2024-07-27 17:08:42.912695','christopher85@example.org','Jennifer','Jenkins',3),(19016,'36yr5EhwwY',NULL,0,'804d63d5-1c36-40e4-a60b-140172f98e61',0,1,'2024-07-27 17:08:42.912883','tylerallison@example.org','Leslie','Smith',1),(19017,'unBhgravpc',NULL,0,'261c6f38-7a8f-416c-a20c-208f7f7d7361',0,1,'2024-07-27 17:08:42.913058','saramccarthy@example.com','Alyssa','Williams',3),(19018,'JuBjHdG7Cu',NULL,0,'89b10da0-4985-4e91-af10-8a706b408586',0,1,'2024-07-27 17:08:42.913230','conniemcdonald@example.com','Allison','Thompson',1),(19019,'yy8NKMT3Z3',NULL,0,'93376cab-9d58-47da-af8d-02c523e01a7b',0,1,'2024-07-27 17:08:42.913401','weeksfrank@example.net','James','Marquez',2),(19020,'NUrKtkEcbR',NULL,0,'87ed2328-6259-40d2-afda-b9a72a11c6f8',0,1,'2024-07-27 17:08:42.913536','cynthia75@example.net','Jessica','Solomon',3),(19021,'zZqGfUxxT4',NULL,0,'4c1e0399-af43-48fa-b601-1a018e0c4a29',0,1,'2024-07-27 17:08:42.913722','nschultz@example.net','Kyle','Evans',1),(19022,'xm5x6eUXE3',NULL,0,'7b7ec5e1-f5ab-491d-9a2e-44a42d2fa041',0,1,'2024-07-27 17:08:42.914049','trevormartin@example.org','Caleb','Nichols',1),(19023,'NpFAnH7PBj',NULL,0,'b0faeeb4-5c0c-4479-a58a-e1112a2fc517',0,1,'2024-07-27 17:08:42.914267','katherinenicholson@example.net','Kelly','Williams',1),(19024,'rudeKKFrMy',NULL,0,'4455e1bd-a312-4a4a-a74c-4884782b16fa',0,1,'2024-07-27 17:08:42.914421','leon11@example.net','Lisa','Cox',3),(19025,'3nf6qgMUYt',NULL,0,'752e7f8c-1d21-48f5-8051-b44b53ce5ff9',0,1,'2024-07-27 17:08:42.914669','barbarahenry@example.org','Nathan','Gilmore',1),(19026,'9JFPpduWq4',NULL,0,'d5cefda0-472b-4173-8787-107a6890faa6',0,1,'2024-07-27 17:08:42.914885','kari27@example.com','Shawn','Bennett',2),(19027,'NyDgnUcAry',NULL,0,'a28434de-97bf-490c-a77f-4e3bc599a8a3',0,1,'2024-07-27 17:08:42.915112','mirandamelissa@example.com','Jonathan','Rodriguez',3),(19028,'DZUuwuzD59',NULL,0,'f1e250b9-43b9-4d39-9043-b7dfa9bb80ab',0,1,'2024-07-27 17:08:42.915323','williamhunt@example.net','Andrew','Miller',3),(19029,'2uQCfQdq6n',NULL,0,'7755dfb2-36ff-42e1-9bcd-9a971e8b0bf5',0,1,'2024-07-27 17:08:42.915487','wtodd@example.net','Lisa','Mooney',3),(19030,'j4Zzdqp6gw',NULL,0,'5b1a4389-e6fe-41ab-842c-d6433d73291b',0,1,'2024-07-27 17:08:42.915706','paigemorales@example.com','Amy','Smith',3),(19031,'4kbUvGadxe',NULL,0,'4d0c2494-ff21-4ee5-bec2-b2f896ee0c36',0,1,'2024-07-27 17:08:42.915879','ohenderson@example.com','Mary','Ingram',3),(19032,'ERfkWC83LJ',NULL,0,'457f2af3-0bf4-4c4f-9d9f-92f6feeac2b0',0,1,'2024-07-27 17:08:42.916056','sarabarron@example.com','Tracy','Mooney',2),(19033,'akSwPuCzEF',NULL,0,'46a5f8e0-d6bc-43e1-80ee-5a6ade3af43e',0,1,'2024-07-27 17:08:42.916254','bentonrobert@example.net','Melissa','Campbell',3),(19034,'whbCXmdyHw',NULL,0,'0b3cfdf9-baae-4b58-96be-96a2b44cb9b4',0,1,'2024-07-27 17:08:42.916434','brookstara@example.net','Sean','Williams',1),(19035,'YNayYdwSvb',NULL,0,'f4ea15fc-27ed-4836-88d0-172baad9733b',0,1,'2024-07-27 17:08:42.916573','acook@example.com','Tiffany','Hanna',1),(19036,'568FE8TMWm',NULL,0,'0915eb7e-086e-4408-9967-f7a7999e4d3b',0,1,'2024-07-27 17:08:42.916701','karen54@example.org','Erin','Rivera',1),(19037,'Y447uehbU4',NULL,0,'1441a669-8fe7-4827-beb3-5de1bf2068de',0,1,'2024-07-27 17:08:42.916838','rkey@example.org','Thomas','Maxwell',2),(19038,'YMGSbkzgcE',NULL,0,'1478e6a2-76ab-49e3-a739-8ffee13438d5',0,1,'2024-07-27 17:08:42.916978','gpowell@example.org','Marisa','Rivera',1),(19039,'uTLfQpG5Pv',NULL,0,'2c642151-2905-47eb-98d2-00054ee7bc21',0,1,'2024-07-27 17:08:42.917113','daniel36@example.com','Emily','Chavez',3),(19040,'sGYMHURXXX',NULL,0,'e90e0ba8-f8ff-4a77-aefd-bb88edabcaca',0,1,'2024-07-27 17:08:42.917335','mckinneyjasmine@example.com','Jason','Love',1),(19041,'8HMfU7LB5M',NULL,0,'f152a4aa-e2db-4a9d-8c7b-ba89efdb8ef8',0,1,'2024-07-27 17:08:42.917585','greendavid@example.com','Carrie','Allen',1),(19042,'w7Q7qfnkSN',NULL,0,'f5b271d7-bc48-4eeb-8164-98951f9bea8b',0,1,'2024-07-27 17:08:42.917863','michaelacosta@example.net','Laura','Burke',3),(19043,'akV7EH2aRq',NULL,0,'2b8670f3-3717-4119-9383-b132c7831590',0,1,'2024-07-27 17:08:42.918082','qolson@example.net','Jose','Simmons',2),(19044,'bjxKUUe5Hy',NULL,0,'9bede625-596b-4eba-8c29-5cd631d455ae',0,1,'2024-07-27 17:08:42.918283','michaelwalsh@example.org','Holly','Anderson',2),(19045,'eHaBVj29HD',NULL,0,'fb648da9-70a9-4e7f-b906-d90cc664f7d9',0,1,'2024-07-27 17:08:42.918449','laurawright@example.net','Don','Weaver',1),(19046,'4pkVVsB7YE',NULL,0,'6e2ac0d6-725f-4c1c-8d16-11141e064e99',0,1,'2024-07-27 17:08:42.918623','johnstonchristine@example.org','Erica','Johnson',3),(19047,'wunbY2QSyE',NULL,0,'7e507c41-eaa6-4d37-bb72-5b4021517d8b',0,1,'2024-07-27 17:08:42.918786','kellipeters@example.net','Christina','Powell',3),(19048,'ApHFc2fyDy',NULL,0,'06786e64-05c9-4e17-8261-148336df7af9',0,1,'2024-07-27 17:08:42.918951','angelahaas@example.com','Jeffrey','Nelson',2),(19049,'7pkDzzyDbT',NULL,0,'76c33656-1688-4afe-9468-182a05ff043b',0,1,'2024-07-27 17:08:42.919114','barbaramoore@example.com','Leonard','Powers',3),(19050,'YZz49JagBA',NULL,0,'b4026ffc-8058-4f00-a1ce-090d16c62552',0,1,'2024-07-27 17:08:42.919287','jessica30@example.net','Edward','Sexton',2),(19051,'yEW7cbBuJ4',NULL,0,'1119d4eb-5c2a-4e3a-a7a4-aa657b1254f9',0,1,'2024-07-27 17:08:42.919428','dana58@example.com','Jerry','Brown',2),(19052,'WWEwwsYPvG',NULL,0,'f6e05c83-3590-47b3-8ae9-4e1a7109cc06',0,1,'2024-07-27 17:08:42.919725','petersondarrell@example.org','Cassidy','Baker',2),(19053,'UUheH3YPT9',NULL,0,'3633d434-5640-4a96-ba38-297d83d96c96',0,1,'2024-07-27 17:08:42.919908','alexanderjames@example.com','Jacob','Parks',3),(19054,'QynAv9FwUC',NULL,0,'bde65e6e-ec66-42f9-8b2f-c080538cc777',0,1,'2024-07-27 17:08:42.920076','billyhuerta@example.com','Jonathan','Cook',3),(19055,'CxH8eGxxks',NULL,0,'f3eb7c6c-7493-4da8-9dd2-c26744dfd65b',0,1,'2024-07-27 17:08:42.920344','troystokes@example.com','Alexander','Lynn',3),(19056,'GyDVGChk7n',NULL,0,'bebba30a-8924-4f83-939c-48171ee6158b',0,1,'2024-07-27 17:08:42.920575','hjenkins@example.com','Melissa','Smith',2),(19057,'W8jJUME3XM',NULL,0,'bf1047a3-d843-46d0-98e9-9dfaaf0738f1',0,1,'2024-07-27 17:08:42.920717','jenna85@example.org','Willie','Johnson',1),(19058,'Jw7PQ2GVG7',NULL,0,'5baf4a40-a8e3-434e-ac1e-d15376a6e384',0,1,'2024-07-27 17:08:42.920864','ebailey@example.net','Nicole','Martinez',1),(19059,'QNeCkjQj62',NULL,0,'26f46f06-8b03-4b38-b483-6029c5289d77',0,1,'2024-07-27 17:08:42.921001','jared62@example.org','Mary','Lindsey',2),(19060,'ad79QDmRtS',NULL,0,'729bdadf-0084-4e66-aeb3-b38ef919ad74',0,1,'2024-07-27 17:08:42.921148','hfigueroa@example.org','Jennifer','Johnson',1),(19061,'hB9ZcA6QKU',NULL,0,'777f5285-e382-4bf2-b934-39479024b599',0,1,'2024-07-27 17:08:42.921360','pamelawolf@example.com','Shelby','Coleman',3),(19062,'w48puWJDVm',NULL,0,'02bf6c50-bb2d-4077-b84f-139da85c9f5f',0,1,'2024-07-27 17:08:42.921530','josephescobar@example.net','Rachel','Davis',3),(19063,'PKyHcJJm4w',NULL,0,'36e4594e-3e59-4ece-bc8f-3de758e0acb8',0,1,'2024-07-27 17:08:42.921664','tammy72@example.org','Stacey','Ortiz',3),(19064,'D5PTqVNQTK',NULL,0,'acf4b263-21c9-478f-b82b-97a7563623c8',0,1,'2024-07-27 17:08:42.921897','castillodominique@example.org','Justin','Wilkerson',2),(19065,'HRECCYDuWm',NULL,0,'018453a2-99b5-436b-86f7-285d45f2c4b5',0,1,'2024-07-27 17:08:42.922264','ellenlopez@example.com','Cassidy','Powell',1),(19066,'BjXJCrz7S8',NULL,0,'b7984abb-3c7c-4b46-bfa6-c2370647605c',0,1,'2024-07-27 17:08:42.922446','april35@example.com','Cheryl','Ramirez',2),(19067,'9LrFtxfca7',NULL,0,'55a9cafd-add4-4caa-a32e-eb72ba3a66c3',0,1,'2024-07-27 17:08:42.922591','kristi16@example.net','John','Walton',1),(19068,'cYsHrHWVey',NULL,0,'3a5462f7-c887-4a75-9b64-c23014f0b0ed',0,1,'2024-07-27 17:08:42.922771','marydiaz@example.net','Autumn','Esparza',3),(19069,'bpKZzz3NDR',NULL,0,'fe436ed9-ff53-48a5-9147-a50358549ade',0,1,'2024-07-27 17:08:42.923003','meredithroberts@example.net','Bobby','Foster',2),(19070,'TDP36xmYxc',NULL,0,'e14dbe01-5540-4624-9cb2-c421bad74be4',0,1,'2024-07-27 17:08:42.923290','dennisburton@example.net','Kari','Schneider',1),(19071,'P2AqfXwR6P',NULL,0,'bd613df9-54f1-44bc-bc64-42b087bf97ac',0,1,'2024-07-27 17:08:42.923511','bakereric@example.com','Samantha','Davis',2),(19072,'KNr7EDCj2J',NULL,0,'0f7b325a-7aae-4fa2-bfc7-66afa368e30b',0,1,'2024-07-27 17:08:42.923672','kharper@example.com','Gina','Davidson',3),(19073,'rexnqdvdwJ',NULL,0,'fe7c0a0d-30c5-4bb6-825a-1d207b048d65',0,1,'2024-07-27 17:08:42.923820','wendy48@example.net','Maria','Bowman',3),(19074,'VGf6YpYGhs',NULL,0,'66c6d18a-c13c-43c5-8383-c2b4e995b5e4',0,1,'2024-07-27 17:08:42.923971','tblack@example.net','Cynthia','Jarvis',3),(19075,'auDJj839r8',NULL,0,'10ba1218-9096-4e32-b315-fd8fad8084cd',0,1,'2024-07-27 17:08:42.924156','vanessalyons@example.com','Kathy','Brown',3),(19076,'d5MNSzffdg',NULL,0,'85a90095-e214-42d2-aede-b99c6aed4478',0,1,'2024-07-27 17:08:42.924349','mcbridekristin@example.org','Dennis','Schaefer',3),(19077,'HP9J7hnK4U',NULL,0,'f9144883-4e49-4f77-9c1f-430f02da138d',0,1,'2024-07-27 17:08:42.924482','james32@example.net','Tammy','Baker',2),(19078,'TRvuPURrUv',NULL,0,'bd14e9f2-06a6-4c93-9136-4a7d3a0d97da',0,1,'2024-07-27 17:08:42.924624','echase@example.net','Lori','Johnson',3),(19079,'3Q72YKTU9Z',NULL,0,'6ba0e152-9de8-4772-b327-9c298f7acfb7',0,1,'2024-07-27 17:08:42.924764','rwade@example.com','Chad','Simon',1),(19080,'5uD3uPscRY',NULL,0,'49e47354-416a-4883-93e1-93b0154e062a',0,1,'2024-07-27 17:08:42.924893','thomas73@example.com','David','Martinez',1),(19081,'pszpDWMnra',NULL,0,'da70a930-eb35-4742-9d25-e50a23f90d64',0,1,'2024-07-27 17:08:42.925038','qmontoya@example.com','Margaret','Hale',1),(19082,'tGJpUS9tYQ',NULL,0,'2f422028-31cd-4077-9074-2aec190b55a8',0,1,'2024-07-27 17:08:42.925220','stacyhill@example.net','Melissa','Murphy',2),(19083,'6MsuW3VkjA',NULL,0,'880750ac-8cb0-4acc-8212-ba99cd831d26',0,1,'2024-07-27 17:08:42.925396','henrysmith@example.org','Mary','West',3),(19084,'XdHCLvgXxX',NULL,0,'3d327fb3-a236-47b2-8286-5e3086b280d1',0,1,'2024-07-27 17:08:42.925540','czavala@example.net','Alexis','Baird',2),(19085,'XqmQKeEbUQ',NULL,0,'33a21699-2db7-425e-ba87-d46969d52965',0,1,'2024-07-27 17:08:42.925712','jamesmarc@example.net','Glenn','Henry',2),(19086,'CxVqkmXWjQ',NULL,0,'b7066a77-65ef-47c5-9d37-95a09abc652f',0,1,'2024-07-27 17:08:42.925860','vlarsen@example.net','Sheri','Rogers',2),(19087,'BARnxWecUJ',NULL,0,'2ac20718-1938-4d11-8c54-18ca33e7521d',0,1,'2024-07-27 17:08:42.926065','sgreen@example.net','Lori','Reed',2),(19088,'hMrNtL2GYJ',NULL,0,'64ecb5e3-7aa8-48f4-8da3-05570193eb7d',0,1,'2024-07-27 17:08:42.926303','crystal83@example.org','Amanda','Roberts',3),(19089,'dWAFeBU8Uh',NULL,0,'35fbf458-45fc-4552-9462-f93fee8059b3',0,1,'2024-07-27 17:08:42.926496','thomasdonna@example.net','Douglas','Bartlett',3),(19090,'GThxsdwrdC',NULL,0,'a47b36db-2214-4be5-bb1d-09442a113f84',0,1,'2024-07-27 17:08:42.926630','christian37@example.com','Joshua','Hunt',1),(19091,'bn8FqXL5yW',NULL,0,'a7afd72a-5249-49c7-aa89-065122729fc4',0,1,'2024-07-27 17:08:42.926770','fcobb@example.org','Francisco','Harris',2),(19092,'UPcsaDYWhy',NULL,0,'18dc66be-a509-4b16-ac71-059e2bf7ff52',0,1,'2024-07-27 17:08:42.926940','kellyjennifer@example.com','Tracy','Oliver',2),(19093,'jAqU5ungDw',NULL,0,'41f4cc33-d244-43d6-829e-ae6bd9a1cc1e',0,1,'2024-07-27 17:08:42.927076','sandra81@example.net','Tammy','Morales',1),(19094,'4EMCyycxW5',NULL,0,'66b28d9f-9202-4084-9c9e-83a28a89750a',0,1,'2024-07-27 17:08:42.927318','murphyaudrey@example.net','Deborah','Burch',3),(19095,'fYEVdG5LtA',NULL,0,'a9ff1535-d859-4b60-961c-998516a6fabb',0,1,'2024-07-27 17:08:42.927558','bauerderek@example.org','Carla','Bryant',3),(19096,'VuZ9xrT8Rd',NULL,0,'d9113561-c56a-44c1-86ec-7d9ac79030e5',0,1,'2024-07-27 17:08:42.927767','owenssierra@example.net','Carol','Cunningham',3),(19097,'EcvRB3sqnK',NULL,0,'50efbe55-eef8-47dd-8043-8d71f8da07b9',0,1,'2024-07-27 17:08:42.927942','jasonjones@example.com','Linda','Wall',2),(19098,'L2rxUGgdHn',NULL,0,'edd72b6a-d111-461d-9c11-5c4957a2fa0d',0,1,'2024-07-27 17:08:42.928081','melanie63@example.net','Anthony','Collins',1),(19099,'rEnreBhbFH',NULL,0,'c8b0fe6c-c95c-48da-9f6d-50f74dbf49b0',0,1,'2024-07-27 17:08:42.928418','chadgarcia@example.com','Kayla','Duncan',1),(19100,'uVyAR2qYxW',NULL,0,'8bc2b50c-a803-4919-b0a7-245c1ae540bb',0,1,'2024-07-27 17:08:42.928560','karen83@example.com','Heather','Boyer',1),(19101,'74Vf9gFJaD',NULL,0,'9d634aa2-a5f5-415d-a7dd-900a13c0bc86',0,1,'2024-07-27 17:08:42.928734','russellmargaret@example.com','Blake','Walker',2),(19102,'MEy99DuDrf',NULL,0,'5fa18268-a875-4de1-aef1-5d4476a04bbb',0,1,'2024-07-27 17:08:42.928902','lawrencecrawford@example.com','Holly','Rivera',2),(19103,'ygDRp8PZqe',NULL,0,'e6581345-b3a4-4fc0-850b-76d2d4c13584',0,1,'2024-07-27 17:08:42.929068','robbinskenneth@example.net','Mark','Dalton',2),(19104,'SQ45MDHaCb',NULL,0,'cd6c6b56-c4b1-4050-a770-225f481639ee',0,1,'2024-07-27 17:08:42.929217','edwin96@example.com','Matthew','Diaz',3),(19105,'bzBWFB4Xea',NULL,0,'cfa27804-8130-4ac5-9ac9-2188b78d7cee',0,1,'2024-07-27 17:08:42.929418','yfigueroa@example.net','Gina','Thompson',3),(19106,'T2uHEe5X4G',NULL,0,'6a704231-19ed-441a-9e63-b3ba266761b7',0,0,'2024-07-27 17:08:42.929604','christophermccoy@example.com','Mathew','Mitchell',1),(440022,'pbkdf2_sha256$720000$BJWdrjui3vcYwk3EKhkCHo$bbSzE4vpkYJ44joPMnhY710F1zg3lYFRVk9ZVh/S/QY=','2024-07-29 07:06:28.481196',1,'5d0b8d57-018e-49a7-9f76-c9c0d9890486',1,1,'2024-07-29 07:06:10.755192','gardcristian@gmail.com','Cristian','Gard',2);
/*!40000 ALTER TABLE `users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_user_permissions`
--

LOCK TABLES `users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_speedtest`
--

DROP TABLE IF EXISTS `users_speedtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_speedtest` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `source` varchar(20) NOT NULL,
  `speed` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_speedtest`
--

LOCK TABLES `users_speedtest` WRITE;
/*!40000 ALTER TABLE `users_speedtest` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_speedtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'netopia_django'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetDepartmentsByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetDepartmentsByUser`(IN user_id INT)
BEGIN
    
    SELECT d.id, d.name, d.manager_id, d.parent_id
    FROM departments_department d
    INNER JOIN users_customuser u ON d.id = u.department_id
    WHERE u.id = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersByDepartment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersByDepartment`(IN departmentId INT)
BEGIN
    SELECT id, password, last_login, is_superuser, username, is_staff, is_active, date_joined, email, first_name, last_name, department_id
    FROM users_customuser
    WHERE department_id = departmentId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 13:28:41
