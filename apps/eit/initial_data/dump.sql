-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: bhp056
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.8

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can change message',4,'change_message'),(2,'Can change group',2,'change_group'),(3,'Can change permission',1,'change_permission'),(4,'Can delete user',3,'delete_user'),(5,'Can change user',3,'change_user'),(6,'Can delete permission',1,'delete_permission'),(7,'Can delete message',4,'delete_message'),(8,'Can add message',4,'add_message'),(9,'Can add permission',1,'add_permission'),(10,'Can delete group',2,'delete_group'),(11,'Can add user',3,'add_user'),(12,'Can add group',2,'add_group'),(13,'Can change content type',5,'change_contenttype'),(14,'Can delete content type',5,'delete_contenttype'),(15,'Can add content type',5,'add_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can delete session',6,'delete_session'),(18,'Can change session',6,'change_session'),(19,'Can delete site',7,'delete_site'),(20,'Can add site',7,'add_site'),(21,'Can change site',7,'change_site'),(22,'Can delete log entry',8,'delete_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can add log entry',8,'add_logentry'),(25,'Can change af004 reason off study',38,'change_af004reasonoffstudy'),(26,'Can delete af005 haart',48,'delete_af005haart'),(27,'Can change af006 provided information',52,'change_af006providedinformation'),(28,'Can delete af002 current status',19,'delete_af002currentstatus'),(29,'Can add af004 infant pre randomization',41,'add_af004infantprerandomization'),(30,'Can delete mp003 conditions',74,'delete_mp003conditions'),(31,'Can change af001 reason not start',13,'change_af001reasonnotstart'),(32,'Can add mp012 signi reason',109,'add_mp012signireason'),(33,'Can delete af005 study drug',46,'delete_af005studydrug'),(34,'Can add mp003 section four',79,'add_mp003sectionfour'),(35,'Can add mp009',96,'add_mp009'),(36,'Can add mp012',112,'add_mp012'),(37,'Can delete mp003 prior pregnancy',72,'delete_mp003priorpregnancy'),(38,'Can add en003 feeding choice',56,'add_en003feedingchoice'),(39,'Can delete af004 infant post randomization',40,'delete_af004infantpostrandomization'),(40,'Can add mp011 nvp days miss',100,'add_mp011nvpdaysmiss'),(41,'Can add af004 reason off study',38,'add_af004reasonoffstudy'),(42,'Can change mp003 cooking method',68,'change_mp003cookingmethod'),(43,'Can add mp011 reason discontinuing',102,'add_mp011reasondiscontinuing'),(44,'Can add mp011 reason discontinued',101,'add_mp011reasondiscontinued'),(45,'Can add subject consent',9,'add_subjectconsent'),(46,'Can delete mp004',82,'delete_mp004'),(47,'Can delete mp003',76,'delete_mp003'),(48,'Can add mp007',91,'add_mp007'),(49,'Can change mp003 toilet facility',69,'change_mp003toiletfacility'),(50,'Can change af004 mother',39,'change_af004mother'),(51,'Can change mp010 reason hospital',97,'change_mp010reasonhospital'),(52,'Can delete mp011 reason discontinued',101,'delete_mp011reasondiscontinued'),(53,'Can delete mp008 feeding after deliv',36,'delete_mp008feedingafterdeliv'),(54,'Can add mp010 vaccinations',98,'add_mp010vaccinations'),(55,'Can add mp012 if yes',107,'add_mp012ifyes'),(56,'Can add af004 mother',39,'add_af004mother'),(57,'Can change mp005 hospital',26,'change_mp005hospital'),(58,'Can delete af003',24,'delete_af003'),(59,'Can add mp003 toilet facility',69,'add_mp003toiletfacility'),(60,'Can change mp004 arv',83,'change_mp004arv'),(61,'Can add mp009 reason missed',94,'add_mp009reasonmissed'),(62,'Can add mp003 ethnicity',62,'add_mp003ethnicity'),(63,'Can change mp003 recruit source',73,'change_mp003recruitsource'),(64,'Can add af005 reason hospitalized',45,'add_af005reasonhospitalized'),(65,'Can add diagnosis',32,'add_diagnosis'),(66,'Can change mp003 house type',70,'change_mp003housetype'),(67,'Can add mp003 provides money',65,'add_mp003providesmoney'),(68,'Can change af005 reason hospitalized',45,'change_af005reasonhospitalized'),(69,'Can change af003',24,'change_af003'),(70,'Can change af001',14,'change_af001'),(71,'Can delete subject consent',9,'delete_subjectconsent'),(72,'Can change mp012',112,'change_mp012'),(73,'Can change af002 reason visit',20,'change_af002reasonvisit'),(74,'Can add mp012 rcv bm',108,'add_mp012rcvbm'),(75,'Can change af002 mother',21,'change_af002mother'),(76,'Can delete mp003 toilet facility',69,'delete_mp003toiletfacility'),(77,'Can change mp013',113,'change_mp013'),(78,'Can delete mp010',99,'delete_mp010'),(79,'Can change mp003 section two',77,'change_mp003sectiontwo'),(80,'Can add mp004 arv',83,'add_mp004arv'),(81,'Can delete mp012 rcv bm',108,'delete_mp012rcvbm'),(82,'Can delete af005 death cause cat',43,'delete_af005deathcausecat'),(83,'Can change mp003 section four',79,'change_mp003sectionfour'),(84,'Can delete mp004 arv list',80,'delete_mp004arvlist'),(85,'Can delete mp005 preg diagnosis',33,'delete_mp005pregdiagnosis'),(86,'Can add mp008 infant birth record',37,'add_mp008infantbirthrecord'),(87,'Can add af001',14,'add_af001'),(88,'Can delete mp012 if yes',107,'delete_mp012ifyes'),(89,'Can change en002 maternal eligiblity post partum',55,'change_en002maternaleligiblitypostpartum'),(90,'Can change af004 infant post randomization',40,'change_af004infantpostrandomization'),(91,'Can delete mp004 section two',86,'delete_mp004sectiontwo'),(92,'Can change diagnosis',32,'change_diagnosis'),(93,'Can delete mp012 signi reason',109,'delete_mp012signireason'),(94,'Can delete mp003 section three',78,'delete_mp003sectionthree'),(95,'Can add mp010 reason hospital',97,'add_mp010reasonhospital'),(96,'Can change mp012 signi reason',109,'change_mp012signireason'),(97,'Can add mp001 pre registration loss',59,'add_mp001preregistrationloss'),(98,'Can change mp003 conditions',74,'change_mp003conditions'),(99,'Can change mp003 marital status',61,'change_mp003maritalstatus'),(100,'Can delete mp009 reason stopped',95,'delete_mp009reasonstopped'),(101,'Can add mp003 know hiv stat',71,'add_mp003knowhivstat'),(102,'Can add af002 reason visit',20,'add_af002reasonvisit'),(103,'Can change mp008 feeding after deliv',36,'change_mp008feedingafterdeliv'),(104,'Can change mp011',104,'change_mp011'),(105,'Can add registered infant',12,'add_registeredinfant'),(106,'Can delete en003 feeding choice',56,'delete_en003feedingchoice'),(107,'Can add mp003',76,'add_mp003'),(108,'Can delete mp004 arv',83,'delete_mp004arv'),(109,'Can change mp003 water source',67,'change_mp003watersource'),(110,'Can add mp004 arv interruption',81,'add_mp004arvinterruption'),(111,'Can add mp001 reasons mother not reg',58,'add_mp001reasonsmothernotreg'),(112,'Can change mp007',91,'change_mp007'),(113,'Can add mp009 arv prophylaxis stat',93,'add_mp009arvprophylaxisstat'),(114,'Can delete mp014',114,'delete_mp014'),(115,'Can add af006',53,'add_af006'),(116,'Can add mp012 water use',106,'add_mp012wateruse'),(117,'Can delete registered mother',11,'delete_registeredmother'),(118,'Can change mp005 preg diagnosis',33,'change_mp005pregdiagnosis'),(119,'Can add af002 current status',19,'add_af002currentstatus'),(120,'Can delete mp001 pre registration loss',59,'delete_mp001preregistrationloss'),(121,'Can delete mp006 conditions',88,'delete_mp006conditions'),(122,'Can change mp005 supplements',31,'change_mp005supplements'),(123,'Can change registered infant',12,'change_registeredinfant'),(124,'Can add mp005 labour and delivery',34,'add_mp005labouranddelivery'),(125,'Can delete mp009',96,'delete_mp009'),(126,'Can change mp004 arv list',80,'change_mp004arvlist'),(127,'Can change mp001 pre registration loss',59,'change_mp001preregistrationloss'),(128,'Can delete mp005 labour and delivery',34,'delete_mp005labouranddelivery'),(129,'Can delete mp011 reason discontinuing',102,'delete_mp011reasondiscontinuing'),(130,'Can change mp005 labour hours',25,'change_mp005labourhours'),(131,'Can change mp007 haart',92,'change_mp007haart'),(132,'Can add af003',24,'add_af003'),(133,'Can add mp003 section two',77,'add_mp003sectiontwo'),(134,'Can delete locator information',60,'delete_locatorinformation'),(135,'Can change registered mother',11,'change_registeredmother'),(136,'Can add mp004',82,'add_mp004'),(137,'Can change mp010 vaccinations',98,'change_mp010vaccinations'),(138,'Can delete af004 mother',39,'delete_af004mother'),(139,'Can change mp006',89,'change_mp006'),(140,'Can change af002 mother appointment',15,'change_af002motherappointment'),(141,'Can add af006 provided information',52,'add_af006providedinformation'),(142,'Can add en003',57,'add_en003'),(143,'Can change mp012 cow milk',111,'change_mp012cowmilk'),(144,'Can delete af004 infant pre randomization',41,'delete_af004infantprerandomization'),(145,'Can add mp005 ob complications',30,'add_mp005obcomplications'),(146,'Can delete mp005 delivery mode',27,'delete_mp005deliverymode'),(147,'Can change mp004',82,'change_mp004'),(148,'Can delete mp003 prior arv',75,'delete_mp003priorarv'),(149,'Can add af001 reason not start',13,'add_af001reasonnotstart'),(150,'Can delete af002 infant',22,'delete_af002infant'),(151,'Can add mp005 labour hours',25,'add_mp005labourhours'),(152,'Can delete af005',50,'delete_af005'),(153,'Can change mp004 arv pregnancy',84,'change_mp004arvpregnancy'),(154,'Can delete mp011 nvp days miss',100,'delete_mp011nvpdaysmiss'),(155,'Can change mp009 reason missed',94,'change_mp009reasonmissed'),(156,'Can delete af001',14,'delete_af001'),(157,'Can add mp003 prior arv',75,'add_mp003priorarv'),(158,'Can add mp014',114,'add_mp014'),(159,'Can delete mp008 infant birth record',37,'delete_mp008infantbirthrecord'),(160,'Can change locator information',60,'change_locatorinformation'),(161,'Can delete mp003 house type',70,'delete_mp003housetype'),(162,'Can delete mp004 arv post partum',85,'delete_mp004arvpostpartum'),(163,'Can add af005 trad medicine',49,'add_af005tradmedicine'),(164,'Can add mp011',104,'add_mp011'),(165,'Can add mp005 hospital',26,'add_mp005hospital'),(166,'Can delete randomization',10,'delete_randomization'),(167,'Can change mp010',99,'change_mp010'),(168,'Can delete mp006 reason hospitalized',87,'delete_mp006reasonhospitalized'),(169,'Can change mp009',96,'change_mp009'),(170,'Can change af005 death cause cat',43,'change_af005deathcausecat'),(171,'Can delete mp004 arv interruption',81,'delete_mp004arvinterruption'),(172,'Can delete mp009 reason missed',94,'delete_mp009reasonmissed'),(173,'Can add mp010',99,'add_mp010'),(174,'Can delete mp011 marital status',103,'delete_mp011maritalstatus'),(175,'Can delete mp005 health conditions',28,'delete_mp005healthconditions'),(176,'Can change mp012 rcv bm',108,'change_mp012rcvbm'),(177,'Can add mp005 health conditions',28,'add_mp005healthconditions'),(178,'Can add mp005 supplements',31,'add_mp005supplements'),(179,'Can change mp005 ob complications',30,'change_mp005obcomplications'),(180,'Can add mp006',89,'add_mp006'),(181,'Can change mp005 delivery mode',27,'change_mp005deliverymode'),(182,'Can delete af001 reason not start',13,'delete_af001reasonnotstart'),(183,'Can change mp011 reason discontinuing',102,'change_mp011reasondiscontinuing'),(184,'Can delete af004 reason off study',38,'delete_af004reasonoffstudy'),(185,'Can add mp003 water source',67,'add_mp003watersource'),(186,'Can delete af006 survival status',51,'delete_af006survivalstatus'),(187,'Can delete af002 reason visit',20,'delete_af002reasonvisit'),(188,'Can delete mp005 medical history',35,'delete_mp005medicalhistory'),(189,'Can change mp012 water use',106,'change_mp012wateruse'),(190,'Can add randomization',10,'add_randomization'),(191,'Can delete mp003 recruit source',73,'delete_mp003recruitsource'),(192,'Can delete mp006',89,'delete_mp006'),(193,'Can add mp003 current occupation',64,'add_mp003currentoccupation'),(194,'Can delete mp001 reasons mother not reg',58,'delete_mp001reasonsmothernotreg'),(195,'Can delete mp010 vaccinations',98,'delete_mp010vaccinations'),(196,'Can add af005 death cause info',42,'add_af005deathcauseinfo'),(197,'Can add mp003 section three',78,'add_mp003sectionthree'),(198,'Can add af005 study drug',46,'add_af005studydrug'),(199,'Can delete mp005 hospital',26,'delete_mp005hospital'),(200,'Can add mp004 arv pregnancy',84,'add_mp004arvpregnancy'),(201,'Can change mp011 nvp days miss',100,'change_mp011nvpdaysmiss'),(202,'Can change mp003 current occupation',64,'change_mp003currentoccupation'),(203,'Can delete af002 source info',17,'delete_af002sourceinfo'),(204,'Can change en003',57,'change_en003'),(205,'Can add mp003 house type',70,'add_mp003housetype'),(206,'Can add mp009 reason stopped',95,'add_mp009reasonstopped'),(207,'Can delete mp003 high education',63,'delete_mp003higheducation'),(208,'Can add mp008 feeding after deliv',36,'add_mp008feedingafterdeliv'),(209,'Can delete mp007',91,'delete_mp007'),(210,'Can delete mp005 supplements',31,'delete_mp005supplements'),(211,'Can add locator information',60,'add_locatorinformation'),(212,'Can add mp003 cooking method',68,'add_mp003cookingmethod'),(213,'Can change mp012 reason rcv fm',105,'change_mp012reasonrcvfm'),(214,'Can change mp014',114,'change_mp014'),(215,'Can add mp005 preg diagnosis',33,'add_mp005pregdiagnosis'),(216,'Can change mp011 marital status',103,'change_mp011maritalstatus'),(217,'Can add af005 death cause cat',43,'add_af005deathcausecat'),(218,'Can change af002 infant',22,'change_af002infant'),(219,'Can delete mp003 ethnicity',62,'delete_mp003ethnicity'),(220,'Can delete mp013',113,'delete_mp013'),(221,'Can delete af002 infant appointment',16,'delete_af002infantappointment'),(222,'Can change af002 current status',19,'change_af002currentstatus'),(223,'Can delete mp007 haart reason',90,'delete_mp007haartreason'),(224,'Can add af006 survival status',51,'add_af006survivalstatus'),(225,'Can add af005',50,'add_af005'),(226,'Can delete mp003 marital status',61,'delete_mp003maritalstatus'),(227,'Can delete af002 infant info',18,'delete_af002infantinfo'),(228,'Can delete mp005 delivery complications',29,'delete_mp005deliverycomplications'),(229,'Can add registered mother',11,'add_registeredmother'),(230,'Can change mp003 section three',78,'change_mp003sectionthree'),(231,'Can change mp008 infant birth record',37,'change_mp008infantbirthrecord'),(232,'Can add mp003 conditions',74,'add_mp003conditions'),(233,'Can add af002 infant info',18,'add_af002infantinfo'),(234,'Can add en002 maternal eligiblity post partum',55,'add_en002maternaleligiblitypostpartum'),(235,'Can change mp006 reason hospitalized',87,'change_mp006reasonhospitalized'),(236,'Can add mp012 reason rcv fm',105,'add_mp012reasonrcvfm'),(237,'Can add mp013',113,'add_mp013'),(238,'Can change en001 maternal eligiblity ante natal',54,'change_en001maternaleligiblityantenatal'),(239,'Can delete mp004 arv pregnancy',84,'delete_mp004arvpregnancy'),(240,'Can change mp009 reason stopped',95,'change_mp009reasonstopped'),(241,'Can add mp005 medical history',35,'add_mp005medicalhistory'),(242,'Can change mp003 know hiv stat',71,'change_mp003knowhivstat'),(243,'Can add mp005 delivery mode',27,'add_mp005deliverymode'),(244,'Can add en001 maternal eligiblity ante natal',54,'add_en001maternaleligiblityantenatal'),(245,'Can delete mp010 reason hospital',97,'delete_mp010reasonhospital'),(246,'Can delete mp007 haart',92,'delete_mp007haart'),(247,'Can change mp004 arv interruption',81,'change_mp004arvinterruption'),(248,'Can change mp005 labour and delivery',34,'change_mp005labouranddelivery'),(249,'Can add af005 haart',48,'add_af005haart'),(250,'Can add af002 infant appointment',16,'add_af002infantappointment'),(251,'Can add af005 nevirapine',47,'add_af005nevirapine'),(252,'Can delete mp012 reason rcv fm',105,'delete_mp012reasonrcvfm'),(253,'Can change af002 infant appointment',16,'change_af002infantappointment'),(254,'Can change mp003',76,'change_mp003'),(255,'Can add mp007 haart',92,'add_mp007haart'),(256,'Can change mp006 conditions',88,'change_mp006conditions'),(257,'Can add mp003 prior pregnancy',72,'add_mp003priorpregnancy'),(258,'Can delete mp012 water',110,'delete_mp012water'),(259,'Can change mp003 money earned',66,'change_mp003moneyearned'),(260,'Can add af002 source info',17,'add_af002sourceinfo'),(261,'Can change af005 study drug',46,'change_af005studydrug'),(262,'Can change mp005 health conditions',28,'change_mp005healthconditions'),(263,'Can add mp003 money earned',66,'add_mp003moneyearned'),(264,'Can delete en003',57,'delete_en003'),(265,'Can add mp004 section two',86,'add_mp004sectiontwo'),(266,'Can change en003 feeding choice',56,'change_en003feedingchoice'),(267,'Can delete af005 death cause info',42,'delete_af005deathcauseinfo'),(268,'Can delete mp011',104,'delete_mp011'),(269,'Can add mp007 haart reason',90,'add_mp007haartreason'),(270,'Can delete mp012',112,'delete_mp012'),(271,'Can change af005 medical responsibility',44,'change_af005medicalresponsibility'),(272,'Can add mp006 reason hospitalized',87,'add_mp006reasonhospitalized'),(273,'Can change af002 infant info',18,'change_af002infantinfo'),(274,'Can change mp009 arv prophylaxis stat',93,'change_mp009arvprophylaxisstat'),(275,'Can change mp001 reasons mother not reg',58,'change_mp001reasonsmothernotreg'),(276,'Can add af003 reason discnt',23,'add_af003reasondiscnt'),(277,'Can add mp005 delivery complications',29,'add_mp005deliverycomplications'),(278,'Can delete mp009 arv prophylaxis stat',93,'delete_mp009arvprophylaxisstat'),(279,'Can delete registered infant',12,'delete_registeredinfant'),(280,'Can delete af006',53,'delete_af006'),(281,'Can delete mp003 know hiv stat',71,'delete_mp003knowhivstat'),(282,'Can add af004 infant post randomization',40,'add_af004infantpostrandomization'),(283,'Can delete mp012 water use',106,'delete_mp012wateruse'),(284,'Can delete mp003 section four',79,'delete_mp003sectionfour'),(285,'Can change mp005 medical history',35,'change_mp005medicalhistory'),(286,'Can change af005 trad medicine',49,'change_af005tradmedicine'),(287,'Can change randomization',10,'change_randomization'),(288,'Can change mp003 ethnicity',62,'change_mp003ethnicity'),(289,'Can add af002 infant',22,'add_af002infant'),(290,'Can add mp003 recruit source',73,'add_mp003recruitsource'),(291,'Can change mp004 section two',86,'change_mp004sectiontwo'),(292,'Can add mp011 marital status',103,'add_mp011maritalstatus'),(293,'Can delete mp003 current occupation',64,'delete_mp003currentoccupation'),(294,'Can delete mp005 labour hours',25,'delete_mp005labourhours'),(295,'Can add mp004 arv post partum',85,'add_mp004arvpostpartum'),(296,'Can change af002 source info',17,'change_af002sourceinfo'),(297,'Can change mp004 arv post partum',85,'change_mp004arvpostpartum'),(298,'Can delete af002 mother',21,'delete_af002mother'),(299,'Can delete af005 medical responsibility',44,'delete_af005medicalresponsibility'),(300,'Can change mp012 if yes',107,'change_mp012ifyes'),(301,'Can delete mp003 provides money',65,'delete_mp003providesmoney'),(302,'Can delete en002 maternal eligiblity post partum',55,'delete_en002maternaleligiblitypostpartum'),(303,'Can change af005',50,'change_af005'),(304,'Can change af005 haart',48,'change_af005haart'),(305,'Can delete mp003 water source',67,'delete_mp003watersource'),(306,'Can delete en001 maternal eligiblity ante natal',54,'delete_en001maternaleligiblityantenatal'),(307,'Can delete af006 provided information',52,'delete_af006providedinformation'),(308,'Can delete af005 reason hospitalized',45,'delete_af005reasonhospitalized'),(309,'Can change af004 infant pre randomization',41,'change_af004infantprerandomization'),(310,'Can change subject consent',9,'change_subjectconsent'),(311,'Can change mp003 high education',63,'change_mp003higheducation'),(312,'Can change mp012 water',110,'change_mp012water'),(313,'Can change mp003 prior arv',75,'change_mp003priorarv'),(314,'Can change af003 reason discnt',23,'change_af003reasondiscnt'),(315,'Can change af005 death cause info',42,'change_af005deathcauseinfo'),(316,'Can delete diagnosis',32,'delete_diagnosis'),(317,'Can change af006 survival status',51,'change_af006survivalstatus'),(318,'Can delete af003 reason discnt',23,'delete_af003reasondiscnt'),(319,'Can change mp003 prior pregnancy',72,'change_mp003priorpregnancy'),(320,'Can add af005 medical responsibility',44,'add_af005medicalresponsibility'),(321,'Can delete mp005 ob complications',30,'delete_mp005obcomplications'),(322,'Can add mp003 marital status',61,'add_mp003maritalstatus'),(323,'Can delete af005 nevirapine',47,'delete_af005nevirapine'),(324,'Can add mp006 conditions',88,'add_mp006conditions'),(325,'Can add mp004 arv list',80,'add_mp004arvlist'),(326,'Can delete af002 mother appointment',15,'delete_af002motherappointment'),(327,'Can delete mp003 section two',77,'delete_mp003sectiontwo'),(328,'Can add mp003 high education',63,'add_mp003higheducation'),(329,'Can change mp007 haart reason',90,'change_mp007haartreason'),(330,'Can add mp012 cow milk',111,'add_mp012cowmilk'),(331,'Can change mp011 reason discontinued',101,'change_mp011reasondiscontinued'),(332,'Can add af002 mother appointment',15,'add_af002motherappointment'),(333,'Can change af005 nevirapine',47,'change_af005nevirapine'),(334,'Can add mp012 water',110,'add_mp012water'),(335,'Can add af002 mother',21,'add_af002mother'),(336,'Can delete af005 trad medicine',49,'delete_af005tradmedicine'),(337,'Can change mp003 provides money',65,'change_mp003providesmoney'),(338,'Can delete mp012 cow milk',111,'delete_mp012cowmilk'),(339,'Can delete mp003 money earned',66,'delete_mp003moneyearned'),(340,'Can change af006',53,'change_af006'),(341,'Can delete mp003 cooking method',68,'delete_mp003cookingmethod'),(342,'Can change mp005 delivery complications',29,'change_mp005deliverycomplications'),(343,'Can delete subject identifier audit trail',115,'delete_subjectidentifieraudittrail'),(344,'Can add subject identifier audit trail',115,'add_subjectidentifieraudittrail'),(345,'Can change subject identifier audit trail',115,'change_subjectidentifieraudittrail'),(346,'Can add study specific',116,'add_studyspecific'),(347,'Can delete study specific',116,'delete_studyspecific'),(348,'Can change study specific',116,'change_studyspecific'),(349,'Can add diagnosis code',119,'add_diagnosiscode'),(350,'Can change medication code',121,'change_medicationcode'),(351,'Can change who clinical staging dx pediatric',118,'change_whoclinicalstagingdxpediatric'),(352,'Can delete who clinical staging dx pediatric',118,'delete_whoclinicalstagingdxpediatric'),(353,'Can change body site code',122,'change_bodysitecode'),(354,'Can change diagnosis code',119,'change_diagnosiscode'),(355,'Can delete organism code',123,'delete_organismcode'),(356,'Can change who clinical staging dx adult',117,'change_whoclinicalstagingdxadult'),(357,'Can delete signs symptoms code',120,'delete_signssymptomscode'),(358,'Can add who clinical staging dx pediatric',118,'add_whoclinicalstagingdxpediatric'),(359,'Can add organism code',123,'add_organismcode'),(360,'Can add body site code',122,'add_bodysitecode'),(361,'Can delete arv modification code',126,'delete_arvmodificationcode'),(362,'Can add arv modification code',126,'add_arvmodificationcode'),(363,'Can add who clinical staging dx adult',117,'add_whoclinicalstagingdxadult'),(364,'Can delete medication code',121,'delete_medicationcode'),(365,'Can delete who clinical staging dx adult',117,'delete_whoclinicalstagingdxadult'),(366,'Can add arv code',124,'add_arvcode'),(367,'Can add arv dose status',125,'add_arvdosestatus'),(368,'Can delete diagnosis code',119,'delete_diagnosiscode'),(369,'Can add medication code',121,'add_medicationcode'),(370,'Can delete arv code',124,'delete_arvcode'),(371,'Can delete arv dose status',125,'delete_arvdosestatus'),(372,'Can change arv dose status',125,'change_arvdosestatus'),(373,'Can add signs symptoms code',120,'add_signssymptomscode'),(374,'Can change signs symptoms code',120,'change_signssymptomscode'),(375,'Can change arv code',124,'change_arvcode'),(376,'Can change organism code',123,'change_organismcode'),(377,'Can change arv modification code',126,'change_arvmodificationcode'),(378,'Can delete body site code',122,'delete_bodysitecode'),(379,'Can change panel',127,'change_panel'),(380,'Can add lab receive',132,'add_labreceive'),(381,'Can change lab receive',132,'change_labreceive'),(382,'Can delete lab receive',132,'delete_labreceive'),(383,'Can delete lab aliquot',131,'delete_labaliquot'),(384,'Can delete lab aliquot type',129,'delete_labaliquottype'),(385,'Can add lab aliquot type',129,'add_labaliquottype'),(386,'Can add panel',127,'add_panel'),(387,'Can change lab aliquot',131,'change_labaliquot'),(388,'Can delete panel',127,'delete_panel'),(389,'Can change test',128,'change_test'),(390,'Can change lab aliquot type',129,'change_labaliquottype'),(391,'Can add lab aliquot',131,'add_labaliquot'),(392,'Can delete lab aliquot condition',130,'delete_labaliquotcondition'),(393,'Can change lab aliquot condition',130,'change_labaliquotcondition'),(394,'Can add lab aliquot condition',130,'add_labaliquotcondition'),(395,'Can delete test',128,'delete_test'),(396,'Can add test',128,'add_test');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'erikvw','','','ewidenfelt@bhp.org.bw','sha1$611ae$25b847188f4da255c3e56870c32d94b1a97795ae',1,1,1,'2011-01-19 20:11:48','2011-01-19 20:11:24');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_arvcode`
--

DROP TABLE IF EXISTS `bhp_code_lists_arvcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_arvcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_arvcode`
--

LOCK TABLES `bhp_code_lists_arvcode` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_arvcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_arvcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_arvdosestatus`
--

DROP TABLE IF EXISTS `bhp_code_lists_arvdosestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_arvdosestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_arvdosestatus`
--

LOCK TABLES `bhp_code_lists_arvdosestatus` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_arvdosestatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_arvdosestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_arvmodificationcode`
--

DROP TABLE IF EXISTS `bhp_code_lists_arvmodificationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_arvmodificationcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_arvmodificationcode`
--

LOCK TABLES `bhp_code_lists_arvmodificationcode` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_arvmodificationcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_arvmodificationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_bodysitecode`
--

DROP TABLE IF EXISTS `bhp_code_lists_bodysitecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_bodysitecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_bodysitecode`
--

LOCK TABLES `bhp_code_lists_bodysitecode` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_bodysitecode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_bodysitecode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_diagnosiscode`
--

DROP TABLE IF EXISTS `bhp_code_lists_diagnosiscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_diagnosiscode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_diagnosiscode`
--

LOCK TABLES `bhp_code_lists_diagnosiscode` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_diagnosiscode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_diagnosiscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_medicationcode`
--

DROP TABLE IF EXISTS `bhp_code_lists_medicationcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_medicationcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_medicationcode`
--

LOCK TABLES `bhp_code_lists_medicationcode` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_medicationcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_medicationcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_organismcode`
--

DROP TABLE IF EXISTS `bhp_code_lists_organismcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_organismcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_organismcode`
--

LOCK TABLES `bhp_code_lists_organismcode` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_organismcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_organismcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_signssymptomscode`
--

DROP TABLE IF EXISTS `bhp_code_lists_signssymptomscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_signssymptomscode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_signssymptomscode`
--

LOCK TABLES `bhp_code_lists_signssymptomscode` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_signssymptomscode` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_signssymptomscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_whoclinicalstagingdxadult`
--

DROP TABLE IF EXISTS `bhp_code_lists_whoclinicalstagingdxadult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_whoclinicalstagingdxadult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_whoclinicalstagingdxadult`
--

LOCK TABLES `bhp_code_lists_whoclinicalstagingdxadult` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_whoclinicalstagingdxadult` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_whoclinicalstagingdxadult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_code_lists_whoclinicalstagingdxpediatric`
--

DROP TABLE IF EXISTS `bhp_code_lists_whoclinicalstagingdxpediatric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_code_lists_whoclinicalstagingdxpediatric` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `code` varchar(15) NOT NULL,
  `short_name` varchar(35) NOT NULL,
  `long_name` varchar(255) NOT NULL,
  `list_ref` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_code_lists_whoclinicalstagingdxpediatric`
--

LOCK TABLES `bhp_code_lists_whoclinicalstagingdxpediatric` WRITE;
/*!40000 ALTER TABLE `bhp_code_lists_whoclinicalstagingdxpediatric` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_code_lists_whoclinicalstagingdxpediatric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_consent_subjectidentifieraudittrail`
--

DROP TABLE IF EXISTS `bhp_consent_subjectidentifieraudittrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_consent_subjectidentifieraudittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `subject_identifier` varchar(25) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `initials` varchar(3) NOT NULL,
  `date_allocated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_consent_subjectidentifieraudittrail`
--

LOCK TABLES `bhp_consent_subjectidentifieraudittrail` WRITE;
/*!40000 ALTER TABLE `bhp_consent_subjectidentifieraudittrail` DISABLE KEYS */;
INSERT INTO `bhp_consent_subjectidentifieraudittrail` VALUES (1,'2011-01-19 20:19:35','2011-01-19 20:19:35','1','','s100','s100','ab2b3316-23f8-11e0-9ed9-001d72b88a3a','056-1100126-5','MARTHA','ML','2011-01-19 20:19:35');
/*!40000 ALTER TABLE `bhp_consent_subjectidentifieraudittrail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_lab_labaliquot`
--

DROP TABLE IF EXISTS `bhp_lab_labaliquot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_lab_labaliquot` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `aliquot_identifier` varchar(25) NOT NULL,
  `id_int` int(11) NOT NULL,
  `id_seed` int(11) NOT NULL,
  `lab_aliquot_type_id` int(11) NOT NULL,
  `aliquot_volume` decimal(10,2) NOT NULL,
  `lab_aliquot_condition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `aliquot_identifier` (`aliquot_identifier`),
  KEY `bhp_lab_labaliquot_71fc4b12` (`lab_aliquot_type_id`),
  KEY `bhp_lab_labaliquot_158f571c` (`lab_aliquot_condition_id`),
  CONSTRAINT `lab_aliquot_condition_id_refs_id_6ce267f9` FOREIGN KEY (`lab_aliquot_condition_id`) REFERENCES `bhp_lab_labaliquotcondition` (`id`),
  CONSTRAINT `lab_aliquot_type_id_refs_id_26e78521` FOREIGN KEY (`lab_aliquot_type_id`) REFERENCES `bhp_lab_labaliquottype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_lab_labaliquot`
--

LOCK TABLES `bhp_lab_labaliquot` WRITE;
/*!40000 ALTER TABLE `bhp_lab_labaliquot` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_lab_labaliquot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_lab_labaliquotcondition`
--

DROP TABLE IF EXISTS `bhp_lab_labaliquotcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_lab_labaliquotcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_lab_labaliquotcondition`
--

LOCK TABLES `bhp_lab_labaliquotcondition` WRITE;
/*!40000 ALTER TABLE `bhp_lab_labaliquotcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_lab_labaliquotcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_lab_labaliquottype`
--

DROP TABLE IF EXISTS `bhp_lab_labaliquottype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_lab_labaliquottype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_lab_labaliquottype`
--

LOCK TABLES `bhp_lab_labaliquottype` WRITE;
/*!40000 ALTER TABLE `bhp_lab_labaliquottype` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_lab_labaliquottype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_lab_labreceive`
--

DROP TABLE IF EXISTS `bhp_lab_labreceive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_lab_labreceive` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `lab_aliquot_id` varchar(36) NOT NULL,
  `datetime_received` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `datetime_drawn` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lab_aliquot_id` (`lab_aliquot_id`),
  KEY `bhp_lab_labreceive_504d356c` (`subject_consent_id`),
  CONSTRAINT `lab_aliquot_id_refs_id_4c266cb3` FOREIGN KEY (`lab_aliquot_id`) REFERENCES `bhp_lab_labaliquot` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_504a2de` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_lab_labreceive`
--

LOCK TABLES `bhp_lab_labreceive` WRITE;
/*!40000 ALTER TABLE `bhp_lab_labreceive` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_lab_labreceive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_lab_panel`
--

DROP TABLE IF EXISTS `bhp_lab_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_lab_panel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(25) NOT NULL,
  `comment` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_lab_panel`
--

LOCK TABLES `bhp_lab_panel` WRITE;
/*!40000 ALTER TABLE `bhp_lab_panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_lab_panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_lab_test`
--

DROP TABLE IF EXISTS `bhp_lab_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_lab_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `test_code` varchar(10) NOT NULL,
  `test_name` varchar(25) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `panel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_code` (`test_code`),
  KEY `bhp_lab_test_130efbb7` (`panel_id`),
  CONSTRAINT `panel_id_refs_id_4159be16` FOREIGN KEY (`panel_id`) REFERENCES `bhp_lab_panel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_lab_test`
--

LOCK TABLES `bhp_lab_test` WRITE;
/*!40000 ALTER TABLE `bhp_lab_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `bhp_lab_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bhp_variables_studyspecific`
--

DROP TABLE IF EXISTS `bhp_variables_studyspecific`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bhp_variables_studyspecific` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `protocol_number` varchar(10) NOT NULL,
  `protocol_title` varchar(100) NOT NULL,
  `research_title` varchar(250) NOT NULL,
  `study_start_datetime` datetime NOT NULL,
  `subject_identifier_seed` int(11) NOT NULL,
  `subject_identifier_prefix` varchar(3) NOT NULL,
  `subject_identifier_modulus` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `protocol_number` (`protocol_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bhp_variables_studyspecific`
--

LOCK TABLES `bhp_variables_studyspecific` WRITE;
/*!40000 ALTER TABLE `bhp_variables_studyspecific` DISABLE KEYS */;
INSERT INTO `bhp_variables_studyspecific` VALUES (1,'2011-01-19 20:13:06','2011-01-19 20:13:06','','','s100','s100','BHP056','MPEPU','-','2011-01-04 06:00:00',1000,'056',7,26);
/*!40000 ALTER TABLE `bhp_variables_studyspecific` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-01-19 20:13:06',1,116,'1','BHP056: MPEPU started on 2011-01-04 06:00:00',1,''),(2,'2011-01-19 20:19:35',1,9,'ab297620-23f8-11e0-9ed9-001d72b88a3a',' MARTHA (ML)',1,''),(3,'2011-01-19 20:21:01',1,55,'de91bf5e-23f8-11e0-9ed9-001d72b88a3a','En002MaternalEligiblityPostPartum object',1,''),(4,'2011-01-19 20:25:17',1,34,'772ef34e-23f9-11e0-b573-001d72b88a3a','MARTHA 056-1100126-5 registered on 2011-01-19 20:21:01 delivered on 2011-01-19 20:21:24',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'subject consent','mpepu','subjectconsent'),(10,'randomization','mpepu','randomization'),(11,'registered mother','mpepu','registeredmother'),(12,'registered infant','mpepu','registeredinfant'),(13,'af001 reason not start','mpepu','af001reasonnotstart'),(14,'af001','mpepu','af001'),(15,'af002 mother appointment','mpepu','af002motherappointment'),(16,'af002 infant appointment','mpepu','af002infantappointment'),(17,'af002 source info','mpepu','af002sourceinfo'),(18,'af002 infant info','mpepu','af002infantinfo'),(19,'af002 current status','mpepu','af002currentstatus'),(20,'af002 reason visit','mpepu','af002reasonvisit'),(21,'af002 mother','mpepu','af002mother'),(22,'af002 infant','mpepu','af002infant'),(23,'af003 reason discnt','mpepu','af003reasondiscnt'),(24,'af003','mpepu','af003'),(25,'mp005 labour hours','mpepu','mp005labourhours'),(26,'mp005 hospital','mpepu','mp005hospital'),(27,'mp005 delivery mode','mpepu','mp005deliverymode'),(28,'mp005 health conditions','mpepu','mp005healthconditions'),(29,'mp005 delivery complications','mpepu','mp005deliverycomplications'),(30,'mp005 ob complications','mpepu','mp005obcomplications'),(31,'mp005 supplements','mpepu','mp005supplements'),(32,'diagnosis','mpepu','diagnosis'),(33,'mp005 preg diagnosis','mpepu','mp005pregdiagnosis'),(34,'mp005 labour and delivery','mpepu','mp005labouranddelivery'),(35,'mp005 medical history','mpepu','mp005medicalhistory'),(36,'mp008 feeding after deliv','mpepu','mp008feedingafterdeliv'),(37,'mp008 infant birth record','mpepu','mp008infantbirthrecord'),(38,'af004 reason off study','mpepu','af004reasonoffstudy'),(39,'af004 mother','mpepu','af004mother'),(40,'af004 infant post randomization','mpepu','af004infantpostrandomization'),(41,'af004 infant pre randomization','mpepu','af004infantprerandomization'),(42,'af005 death cause info','mpepu','af005deathcauseinfo'),(43,'af005 death cause cat','mpepu','af005deathcausecat'),(44,'af005 medical responsibility','mpepu','af005medicalresponsibility'),(45,'af005 reason hospitalized','mpepu','af005reasonhospitalized'),(46,'af005 study drug','mpepu','af005studydrug'),(47,'af005 nevirapine','mpepu','af005nevirapine'),(48,'af005 haart','mpepu','af005haart'),(49,'af005 trad medicine','mpepu','af005tradmedicine'),(50,'af005','mpepu','af005'),(51,'af006 survival status','mpepu','af006survivalstatus'),(52,'af006 provided information','mpepu','af006providedinformation'),(53,'af006','mpepu','af006'),(54,'en001 maternal eligiblity ante natal','mpepu','en001maternaleligiblityantenatal'),(55,'en002 maternal eligiblity post partum','mpepu','en002maternaleligiblitypostpartum'),(56,'en003 feeding choice','mpepu','en003feedingchoice'),(57,'en003','mpepu','en003'),(58,'mp001 reasons mother not reg','mpepu','mp001reasonsmothernotreg'),(59,'mp001 pre registration loss','mpepu','mp001preregistrationloss'),(60,'locator information','mpepu','locatorinformation'),(61,'mp003 marital status','mpepu','mp003maritalstatus'),(62,'mp003 ethnicity','mpepu','mp003ethnicity'),(63,'mp003 high education','mpepu','mp003higheducation'),(64,'mp003 current occupation','mpepu','mp003currentoccupation'),(65,'mp003 provides money','mpepu','mp003providesmoney'),(66,'mp003 money earned','mpepu','mp003moneyearned'),(67,'mp003 water source','mpepu','mp003watersource'),(68,'mp003 cooking method','mpepu','mp003cookingmethod'),(69,'mp003 toilet facility','mpepu','mp003toiletfacility'),(70,'mp003 house type','mpepu','mp003housetype'),(71,'mp003 know hiv stat','mpepu','mp003knowhivstat'),(72,'mp003 prior pregnancy','mpepu','mp003priorpregnancy'),(73,'mp003 recruit source','mpepu','mp003recruitsource'),(74,'mp003 conditions','mpepu','mp003conditions'),(75,'mp003 prior arv','mpepu','mp003priorarv'),(76,'mp003','mpepu','mp003'),(77,'mp003 section two','mpepu','mp003sectiontwo'),(78,'mp003 section three','mpepu','mp003sectionthree'),(79,'mp003 section four','mpepu','mp003sectionfour'),(80,'mp004 arv list','mpepu','mp004arvlist'),(81,'mp004 arv interruption','mpepu','mp004arvinterruption'),(82,'mp004','mpepu','mp004'),(83,'mp004 arv','mpepu','mp004arv'),(84,'mp004 arv pregnancy','mpepu','mp004arvpregnancy'),(85,'mp004 arv post partum','mpepu','mp004arvpostpartum'),(86,'mp004 section two','mpepu','mp004sectiontwo'),(87,'mp006 reason hospitalized','mpepu','mp006reasonhospitalized'),(88,'mp006 conditions','mpepu','mp006conditions'),(89,'mp006','mpepu','mp006'),(90,'mp007 haart reason','mpepu','mp007haartreason'),(91,'mp007','mpepu','mp007'),(92,'mp007 haart','mpepu','mp007haart'),(93,'mp009 arv prophylaxis stat','mpepu','mp009arvprophylaxisstat'),(94,'mp009 reason missed','mpepu','mp009reasonmissed'),(95,'mp009 reason stopped','mpepu','mp009reasonstopped'),(96,'mp009','mpepu','mp009'),(97,'mp010 reason hospital','mpepu','mp010reasonhospital'),(98,'mp010 vaccinations','mpepu','mp010vaccinations'),(99,'mp010','mpepu','mp010'),(100,'mp011 nvp days miss','mpepu','mp011nvpdaysmiss'),(101,'mp011 reason discontinued','mpepu','mp011reasondiscontinued'),(102,'mp011 reason discontinuing','mpepu','mp011reasondiscontinuing'),(103,'mp011 marital status','mpepu','mp011maritalstatus'),(104,'mp011','mpepu','mp011'),(105,'mp012 reason rcv fm','mpepu','mp012reasonrcvfm'),(106,'mp012 water use','mpepu','mp012wateruse'),(107,'mp012 if yes','mpepu','mp012ifyes'),(108,'mp012 rcv bm','mpepu','mp012rcvbm'),(109,'mp012 signi reason','mpepu','mp012signireason'),(110,'mp012 water','mpepu','mp012water'),(111,'mp012 cow milk','mpepu','mp012cowmilk'),(112,'mp012','mpepu','mp012'),(113,'mp013','mpepu','mp013'),(114,'mp014','mpepu','mp014'),(115,'subject identifier audit trail','bhp_consent','subjectidentifieraudittrail'),(116,'study specific','bhp_variables','studyspecific'),(117,'who clinical staging dx adult','bhp_code_lists','whoclinicalstagingdxadult'),(118,'who clinical staging dx pediatric','bhp_code_lists','whoclinicalstagingdxpediatric'),(119,'diagnosis code','bhp_code_lists','diagnosiscode'),(120,'signs symptoms code','bhp_code_lists','signssymptomscode'),(121,'medication code','bhp_code_lists','medicationcode'),(122,'body site code','bhp_code_lists','bodysitecode'),(123,'organism code','bhp_code_lists','organismcode'),(124,'arv code','bhp_code_lists','arvcode'),(125,'arv dose status','bhp_code_lists','arvdosestatus'),(126,'arv modification code','bhp_code_lists','arvmodificationcode'),(127,'panel','bhp_lab','panel'),(128,'test','bhp_lab','test'),(129,'lab aliquot type','bhp_lab','labaliquottype'),(130,'lab aliquot condition','bhp_lab','labaliquotcondition'),(131,'lab aliquot','bhp_lab','labaliquot'),(132,'lab receive','bhp_lab','labreceive');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00eed3b6364e6157403b42c2e969cedc','NjlkMTEwZGFkM2JkOTY4YzM3YTNhZmJkYWFjYjI2YzBiNGQxNjg4NjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2011-02-02 20:11:48');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af001`
--

DROP TABLE IF EXISTS `mpepu_af001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af001` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `registered_infant_id` varchar(36) NOT NULL,
  `started_drug` varchar(25) NOT NULL,
  `date_first_dose` date NOT NULL,
  `reason_not_start_id` int(11) NOT NULL,
  `reason_not_start_other` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registered_infant_id` (`registered_infant_id`),
  KEY `mpepu_af001_2fe5cad3` (`reason_not_start_id`),
  CONSTRAINT `reason_not_start_id_refs_id_710a621c` FOREIGN KEY (`reason_not_start_id`) REFERENCES `mpepu_af001reasonnotstart` (`id`),
  CONSTRAINT `registered_infant_id_refs_id_5ede3fc4` FOREIGN KEY (`registered_infant_id`) REFERENCES `mpepu_registeredinfant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af001`
--

LOCK TABLES `mpepu_af001` WRITE;
/*!40000 ALTER TABLE `mpepu_af001` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af001` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af001reasonnotstart`
--

DROP TABLE IF EXISTS `mpepu_af001reasonnotstart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af001reasonnotstart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af001reasonnotstart`
--

LOCK TABLES `mpepu_af001reasonnotstart` WRITE;
/*!40000 ALTER TABLE `mpepu_af001reasonnotstart` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af001reasonnotstart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002currentstatus`
--

DROP TABLE IF EXISTS `mpepu_af002currentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002currentstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002currentstatus`
--

LOCK TABLES `mpepu_af002currentstatus` WRITE;
/*!40000 ALTER TABLE `mpepu_af002currentstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002currentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002infant`
--

DROP TABLE IF EXISTS `mpepu_af002infant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002infant` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `visit_datetime` datetime NOT NULL,
  `visit_code` decimal(5,1) NOT NULL,
  `source_info_id` int(11) NOT NULL,
  `source_info_other` varchar(35) DEFAULT NULL,
  `reason_visit_id` int(11) NOT NULL,
  `reason_missed` varchar(35) DEFAULT NULL,
  `comments` longtext,
  `registered_infant_id` varchar(36) NOT NULL,
  `infant_info_id` int(11) NOT NULL,
  `infant_info_other` varchar(35) DEFAULT NULL,
  `current_status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mpepu_af002infant_3936b421` (`source_info_id`),
  KEY `mpepu_af002infant_22ef2100` (`reason_visit_id`),
  KEY `mpepu_af002infant_6d6dae96` (`registered_infant_id`),
  KEY `mpepu_af002infant_4a393974` (`infant_info_id`),
  KEY `mpepu_af002infant_191f34f2` (`current_status_id`),
  CONSTRAINT `current_status_id_refs_id_7d132233` FOREIGN KEY (`current_status_id`) REFERENCES `mpepu_af002currentstatus` (`id`),
  CONSTRAINT `infant_info_id_refs_id_471dc803` FOREIGN KEY (`infant_info_id`) REFERENCES `mpepu_af002infantinfo` (`id`),
  CONSTRAINT `reason_visit_id_refs_id_632731f5` FOREIGN KEY (`reason_visit_id`) REFERENCES `mpepu_af002reasonvisit` (`id`),
  CONSTRAINT `registered_infant_id_refs_id_429919` FOREIGN KEY (`registered_infant_id`) REFERENCES `mpepu_registeredinfant` (`id`),
  CONSTRAINT `source_info_id_refs_id_7e169bca` FOREIGN KEY (`source_info_id`) REFERENCES `mpepu_af002sourceinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002infant`
--

LOCK TABLES `mpepu_af002infant` WRITE;
/*!40000 ALTER TABLE `mpepu_af002infant` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002infant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002infantappointment`
--

DROP TABLE IF EXISTS `mpepu_af002infantappointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002infantappointment` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `scheduled_visit_datetime` datetime NOT NULL,
  `visit_code` decimal(5,1) NOT NULL,
  `registered_infant_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registered_infant_id` (`registered_infant_id`,`visit_code`),
  KEY `mpepu_af002infantappointment_6d6dae96` (`registered_infant_id`),
  CONSTRAINT `registered_infant_id_refs_id_3a090d4d` FOREIGN KEY (`registered_infant_id`) REFERENCES `mpepu_registeredinfant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002infantappointment`
--

LOCK TABLES `mpepu_af002infantappointment` WRITE;
/*!40000 ALTER TABLE `mpepu_af002infantappointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002infantappointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002infantinfo`
--

DROP TABLE IF EXISTS `mpepu_af002infantinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002infantinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002infantinfo`
--

LOCK TABLES `mpepu_af002infantinfo` WRITE;
/*!40000 ALTER TABLE `mpepu_af002infantinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002infantinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002mother`
--

DROP TABLE IF EXISTS `mpepu_af002mother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002mother` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `visit_datetime` datetime NOT NULL,
  `visit_code` decimal(5,1) NOT NULL,
  `source_info_id` int(11) NOT NULL,
  `source_info_other` varchar(35) DEFAULT NULL,
  `reason_visit_id` int(11) NOT NULL,
  `reason_missed` varchar(35) DEFAULT NULL,
  `comments` longtext,
  `registered_mother_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mpepu_af002mother_3936b421` (`source_info_id`),
  KEY `mpepu_af002mother_22ef2100` (`reason_visit_id`),
  KEY `mpepu_af002mother_61e12f9f` (`registered_mother_id`),
  CONSTRAINT `reason_visit_id_refs_id_7567321a` FOREIGN KEY (`reason_visit_id`) REFERENCES `mpepu_af002reasonvisit` (`id`),
  CONSTRAINT `registered_mother_id_refs_id_7d285d2d` FOREIGN KEY (`registered_mother_id`) REFERENCES `mpepu_registeredmother` (`id`),
  CONSTRAINT `source_info_id_refs_id_28e179a9` FOREIGN KEY (`source_info_id`) REFERENCES `mpepu_af002sourceinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002mother`
--

LOCK TABLES `mpepu_af002mother` WRITE;
/*!40000 ALTER TABLE `mpepu_af002mother` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002mother` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002motherappointment`
--

DROP TABLE IF EXISTS `mpepu_af002motherappointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002motherappointment` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `scheduled_visit_datetime` datetime NOT NULL,
  `visit_code` decimal(5,1) NOT NULL,
  `registered_mother_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registered_mother_id` (`registered_mother_id`,`visit_code`),
  KEY `mpepu_af002motherappointment_61e12f9f` (`registered_mother_id`),
  CONSTRAINT `registered_mother_id_refs_id_4fbc284d` FOREIGN KEY (`registered_mother_id`) REFERENCES `mpepu_registeredmother` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002motherappointment`
--

LOCK TABLES `mpepu_af002motherappointment` WRITE;
/*!40000 ALTER TABLE `mpepu_af002motherappointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002motherappointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002reasonvisit`
--

DROP TABLE IF EXISTS `mpepu_af002reasonvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002reasonvisit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002reasonvisit`
--

LOCK TABLES `mpepu_af002reasonvisit` WRITE;
/*!40000 ALTER TABLE `mpepu_af002reasonvisit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002reasonvisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af002sourceinfo`
--

DROP TABLE IF EXISTS `mpepu_af002sourceinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af002sourceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af002sourceinfo`
--

LOCK TABLES `mpepu_af002sourceinfo` WRITE;
/*!40000 ALTER TABLE `mpepu_af002sourceinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af002sourceinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af003`
--

DROP TABLE IF EXISTS `mpepu_af003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af003` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `source_information` date NOT NULL,
  `reason_discontinuing_id` int(11) NOT NULL,
  `reason_discontinuing_other` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_af003_3434657b` (`reason_discontinuing_id`),
  CONSTRAINT `reason_discontinuing_id_refs_id_116bf2c6` FOREIGN KEY (`reason_discontinuing_id`) REFERENCES `mpepu_af003reasondiscnt` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_6d9d7386` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af003`
--

LOCK TABLES `mpepu_af003` WRITE;
/*!40000 ALTER TABLE `mpepu_af003` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af003` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af003reasondiscnt`
--

DROP TABLE IF EXISTS `mpepu_af003reasondiscnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af003reasondiscnt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af003reasondiscnt`
--

LOCK TABLES `mpepu_af003reasondiscnt` WRITE;
/*!40000 ALTER TABLE `mpepu_af003reasondiscnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af003reasondiscnt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af004infantpostrandomization`
--

DROP TABLE IF EXISTS `mpepu_af004infantpostrandomization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af004infantpostrandomization` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `registered_infant_id` varchar(36) NOT NULL,
  `reason_off_study_id` int(11) NOT NULL,
  `reason_off_study_other` varchar(35) DEFAULT NULL,
  `comment` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registered_infant_id` (`registered_infant_id`),
  KEY `mpepu_af004infantpostrandomization_5bcc6df8` (`reason_off_study_id`),
  CONSTRAINT `reason_off_study_id_refs_id_55d170a3` FOREIGN KEY (`reason_off_study_id`) REFERENCES `mpepu_af004reasonoffstudy` (`id`),
  CONSTRAINT `registered_infant_id_refs_id_6263e989` FOREIGN KEY (`registered_infant_id`) REFERENCES `mpepu_registeredinfant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af004infantpostrandomization`
--

LOCK TABLES `mpepu_af004infantpostrandomization` WRITE;
/*!40000 ALTER TABLE `mpepu_af004infantpostrandomization` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af004infantpostrandomization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af004infantprerandomization`
--

DROP TABLE IF EXISTS `mpepu_af004infantprerandomization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af004infantprerandomization` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp008_id` varchar(36) NOT NULL,
  `reason_off_study_id` int(11) NOT NULL,
  `reason_off_study_other` varchar(35) DEFAULT NULL,
  `comment` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp008_id` (`mp008_id`),
  KEY `mpepu_af004infantprerandomization_5bcc6df8` (`reason_off_study_id`),
  CONSTRAINT `mp008_id_refs_id_16421826` FOREIGN KEY (`mp008_id`) REFERENCES `mpepu_mp008infantbirthrecord` (`id`),
  CONSTRAINT `reason_off_study_id_refs_id_6425f73d` FOREIGN KEY (`reason_off_study_id`) REFERENCES `mpepu_af004reasonoffstudy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af004infantprerandomization`
--

LOCK TABLES `mpepu_af004infantprerandomization` WRITE;
/*!40000 ALTER TABLE `mpepu_af004infantprerandomization` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af004infantprerandomization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af004mother`
--

DROP TABLE IF EXISTS `mpepu_af004mother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af004mother` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `registered_mother_id` varchar(36) NOT NULL,
  `reason_off_study_id` int(11) NOT NULL,
  `reason_off_study_other` varchar(35) DEFAULT NULL,
  `comment` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registered_mother_id` (`registered_mother_id`),
  KEY `mpepu_af004mother_5bcc6df8` (`reason_off_study_id`),
  CONSTRAINT `reason_off_study_id_refs_id_16b69724` FOREIGN KEY (`reason_off_study_id`) REFERENCES `mpepu_af004reasonoffstudy` (`id`),
  CONSTRAINT `registered_mother_id_refs_id_1b6b95cf` FOREIGN KEY (`registered_mother_id`) REFERENCES `mpepu_registeredmother` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af004mother`
--

LOCK TABLES `mpepu_af004mother` WRITE;
/*!40000 ALTER TABLE `mpepu_af004mother` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af004mother` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af004reasonoffstudy`
--

DROP TABLE IF EXISTS `mpepu_af004reasonoffstudy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af004reasonoffstudy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af004reasonoffstudy`
--

LOCK TABLES `mpepu_af004reasonoffstudy` WRITE;
/*!40000 ALTER TABLE `mpepu_af004reasonoffstudy` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af004reasonoffstudy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005`
--

DROP TABLE IF EXISTS `mpepu_af005`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `death_date` date NOT NULL,
  `death_cause_info_id` int(11) NOT NULL,
  `death_cause_info_other` varchar(35) DEFAULT NULL,
  `perform_autopsy` varchar(3) NOT NULL,
  `death_cause` varchar(35) NOT NULL,
  `death_cause_cat_id` int(11) NOT NULL,
  `death_cause_other` varchar(35) DEFAULT NULL,
  `death_cause_code_id` int(11) NOT NULL,
  `illness_duration` int(11) NOT NULL,
  `medical_responsibility_id` int(11) NOT NULL,
  `participant_hospitalized` varchar(3) NOT NULL,
  `reason_hospitalized_id` int(11) NOT NULL,
  `days_hospitalized` int(11) NOT NULL,
  `your_assessment` varchar(25) NOT NULL,
  `study_drug_id` int(11) NOT NULL,
  `nevirapine_id` int(11) NOT NULL,
  `haart_id` int(11) NOT NULL,
  `trad_medicine_id` int(11) NOT NULL,
  `comment` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_af005_2afa91a1` (`death_cause_info_id`),
  KEY `mpepu_af005_658113d4` (`death_cause_cat_id`),
  KEY `mpepu_af005_e2b6ab2` (`death_cause_code_id`),
  KEY `mpepu_af005_30512f84` (`medical_responsibility_id`),
  KEY `mpepu_af005_266f5d94` (`reason_hospitalized_id`),
  KEY `mpepu_af005_5faa877a` (`study_drug_id`),
  KEY `mpepu_af005_e871bb` (`nevirapine_id`),
  KEY `mpepu_af005_1babb963` (`haart_id`),
  KEY `mpepu_af005_42b2448b` (`trad_medicine_id`),
  CONSTRAINT `death_cause_cat_id_refs_id_47eaddfd` FOREIGN KEY (`death_cause_cat_id`) REFERENCES `mpepu_af005deathcausecat` (`id`),
  CONSTRAINT `death_cause_code_id_refs_id_6de60a8b` FOREIGN KEY (`death_cause_code_id`) REFERENCES `bhp_code_lists_diagnosiscode` (`id`),
  CONSTRAINT `death_cause_info_id_refs_id_e8cbbba` FOREIGN KEY (`death_cause_info_id`) REFERENCES `mpepu_af005deathcauseinfo` (`id`),
  CONSTRAINT `haart_id_refs_id_72afd2d8` FOREIGN KEY (`haart_id`) REFERENCES `mpepu_af005haart` (`id`),
  CONSTRAINT `medical_responsibility_id_refs_id_3027e0b5` FOREIGN KEY (`medical_responsibility_id`) REFERENCES `mpepu_af005medicalresponsibility` (`id`),
  CONSTRAINT `nevirapine_id_refs_id_190ae444` FOREIGN KEY (`nevirapine_id`) REFERENCES `mpepu_af005nevirapine` (`id`),
  CONSTRAINT `reason_hospitalized_id_refs_id_6fd64465` FOREIGN KEY (`reason_hospitalized_id`) REFERENCES `mpepu_af005reasonhospitalized` (`id`),
  CONSTRAINT `study_drug_id_refs_id_34672c75` FOREIGN KEY (`study_drug_id`) REFERENCES `mpepu_af005studydrug` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_486259c8` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`),
  CONSTRAINT `trad_medicine_id_refs_id_3f2baca` FOREIGN KEY (`trad_medicine_id`) REFERENCES `mpepu_af005tradmedicine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005`
--

LOCK TABLES `mpepu_af005` WRITE;
/*!40000 ALTER TABLE `mpepu_af005` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005deathcausecat`
--

DROP TABLE IF EXISTS `mpepu_af005deathcausecat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005deathcausecat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005deathcausecat`
--

LOCK TABLES `mpepu_af005deathcausecat` WRITE;
/*!40000 ALTER TABLE `mpepu_af005deathcausecat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005deathcausecat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005deathcauseinfo`
--

DROP TABLE IF EXISTS `mpepu_af005deathcauseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005deathcauseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005deathcauseinfo`
--

LOCK TABLES `mpepu_af005deathcauseinfo` WRITE;
/*!40000 ALTER TABLE `mpepu_af005deathcauseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005deathcauseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005haart`
--

DROP TABLE IF EXISTS `mpepu_af005haart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005haart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005haart`
--

LOCK TABLES `mpepu_af005haart` WRITE;
/*!40000 ALTER TABLE `mpepu_af005haart` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005haart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005medicalresponsibility`
--

DROP TABLE IF EXISTS `mpepu_af005medicalresponsibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005medicalresponsibility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005medicalresponsibility`
--

LOCK TABLES `mpepu_af005medicalresponsibility` WRITE;
/*!40000 ALTER TABLE `mpepu_af005medicalresponsibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005medicalresponsibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005nevirapine`
--

DROP TABLE IF EXISTS `mpepu_af005nevirapine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005nevirapine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005nevirapine`
--

LOCK TABLES `mpepu_af005nevirapine` WRITE;
/*!40000 ALTER TABLE `mpepu_af005nevirapine` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005nevirapine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005reasonhospitalized`
--

DROP TABLE IF EXISTS `mpepu_af005reasonhospitalized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005reasonhospitalized` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005reasonhospitalized`
--

LOCK TABLES `mpepu_af005reasonhospitalized` WRITE;
/*!40000 ALTER TABLE `mpepu_af005reasonhospitalized` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005reasonhospitalized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005studydrug`
--

DROP TABLE IF EXISTS `mpepu_af005studydrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005studydrug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005studydrug`
--

LOCK TABLES `mpepu_af005studydrug` WRITE;
/*!40000 ALTER TABLE `mpepu_af005studydrug` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005studydrug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af005tradmedicine`
--

DROP TABLE IF EXISTS `mpepu_af005tradmedicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af005tradmedicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af005tradmedicine`
--

LOCK TABLES `mpepu_af005tradmedicine` WRITE;
/*!40000 ALTER TABLE `mpepu_af005tradmedicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af005tradmedicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af006`
--

DROP TABLE IF EXISTS `mpepu_af006`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af006` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `survival_status_id` int(11) NOT NULL,
  `provided_information_id` int(11) NOT NULL,
  `provided_information_other` varchar(35) DEFAULT NULL,
  `comments` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_af006_3838c18c` (`survival_status_id`),
  KEY `mpepu_af006_19c706b6` (`provided_information_id`),
  CONSTRAINT `provided_information_id_refs_id_4fb1c37b` FOREIGN KEY (`provided_information_id`) REFERENCES `mpepu_af006providedinformation` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_3d949a1` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`),
  CONSTRAINT `survival_status_id_refs_id_23b0c563` FOREIGN KEY (`survival_status_id`) REFERENCES `mpepu_af006survivalstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af006`
--

LOCK TABLES `mpepu_af006` WRITE;
/*!40000 ALTER TABLE `mpepu_af006` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af006` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af006providedinformation`
--

DROP TABLE IF EXISTS `mpepu_af006providedinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af006providedinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af006providedinformation`
--

LOCK TABLES `mpepu_af006providedinformation` WRITE;
/*!40000 ALTER TABLE `mpepu_af006providedinformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af006providedinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_af006survivalstatus`
--

DROP TABLE IF EXISTS `mpepu_af006survivalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_af006survivalstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_af006survivalstatus`
--

LOCK TABLES `mpepu_af006survivalstatus` WRITE;
/*!40000 ALTER TABLE `mpepu_af006survivalstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_af006survivalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_diagnosis`
--

DROP TABLE IF EXISTS `mpepu_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_diagnosis` (
  `diagnosiscode_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`diagnosiscode_ptr_id`),
  CONSTRAINT `diagnosiscode_ptr_id_refs_id_2ec60770` FOREIGN KEY (`diagnosiscode_ptr_id`) REFERENCES `bhp_code_lists_diagnosiscode` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_diagnosis`
--

LOCK TABLES `mpepu_diagnosis` WRITE;
/*!40000 ALTER TABLE `mpepu_diagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_en001maternaleligiblityantenatal`
--

DROP TABLE IF EXISTS `mpepu_en001maternaleligiblityantenatal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_en001maternaleligiblityantenatal` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `registered_mother_id` varchar(36) NOT NULL,
  `hiv_positive` varchar(3) NOT NULL,
  `on_arv` varchar(3) NOT NULL,
  `agree_follow_up` varchar(3) NOT NULL,
  `gestational_age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_en001maternaleligiblityantenatal_61e12f9f` (`registered_mother_id`),
  CONSTRAINT `registered_mother_id_refs_id_3463d9ca` FOREIGN KEY (`registered_mother_id`) REFERENCES `mpepu_registeredmother` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_11e52215` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_en001maternaleligiblityantenatal`
--

LOCK TABLES `mpepu_en001maternaleligiblityantenatal` WRITE;
/*!40000 ALTER TABLE `mpepu_en001maternaleligiblityantenatal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_en001maternaleligiblityantenatal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_en002maternaleligiblitypostpartum`
--

DROP TABLE IF EXISTS `mpepu_en002maternaleligiblitypostpartum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_en002maternaleligiblitypostpartum` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `registered_mother_id` varchar(36) NOT NULL,
  `hiv_positive` varchar(3) NOT NULL,
  `on_arv` varchar(3) NOT NULL,
  `agree_follow_up` varchar(3) NOT NULL,
  `days_pnc` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_en002maternaleligiblitypostpartum_61e12f9f` (`registered_mother_id`),
  CONSTRAINT `registered_mother_id_refs_id_6feb0cf1` FOREIGN KEY (`registered_mother_id`) REFERENCES `mpepu_registeredmother` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_783530d6` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_en002maternaleligiblitypostpartum`
--

LOCK TABLES `mpepu_en002maternaleligiblitypostpartum` WRITE;
/*!40000 ALTER TABLE `mpepu_en002maternaleligiblitypostpartum` DISABLE KEYS */;
INSERT INTO `mpepu_en002maternaleligiblitypostpartum` VALUES ('2011-01-19 20:21:01','2011-01-19 20:21:01','erikvw','','s100','s100','de91bf5e-23f8-11e0-9ed9-001d72b88a3a','2011-01-19 20:20:53','ab297620-23f8-11e0-9ed9-001d72b88a3a','de903bb6-23f8-11e0-9ed9-001d72b88a3a','Yes','Yes','Yes',22);
/*!40000 ALTER TABLE `mpepu_en002maternaleligiblitypostpartum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_en003`
--

DROP TABLE IF EXISTS `mpepu_en003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_en003` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp008_id` varchar(36) NOT NULL,
  `registered_infant_id` varchar(36) NOT NULL,
  `hiv_status` date NOT NULL,
  `ctx_contra` int(11) NOT NULL,
  `congen_anomaly` varchar(3) NOT NULL,
  `arv_72hrs` varchar(3) NOT NULL,
  `feeding_method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp008_id` (`mp008_id`),
  UNIQUE KEY `registered_infant_id` (`registered_infant_id`),
  KEY `mpepu_en003_4c557382` (`feeding_method_id`),
  CONSTRAINT `feeding_method_id_refs_id_5cd66727` FOREIGN KEY (`feeding_method_id`) REFERENCES `mpepu_en003feedingchoice` (`id`),
  CONSTRAINT `mp008_id_refs_id_7ee98f57` FOREIGN KEY (`mp008_id`) REFERENCES `mpepu_mp008infantbirthrecord` (`id`),
  CONSTRAINT `registered_infant_id_refs_id_6229d72` FOREIGN KEY (`registered_infant_id`) REFERENCES `mpepu_registeredinfant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_en003`
--

LOCK TABLES `mpepu_en003` WRITE;
/*!40000 ALTER TABLE `mpepu_en003` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_en003` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_en003feedingchoice`
--

DROP TABLE IF EXISTS `mpepu_en003feedingchoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_en003feedingchoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_en003feedingchoice`
--

LOCK TABLES `mpepu_en003feedingchoice` WRITE;
/*!40000 ALTER TABLE `mpepu_en003feedingchoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_en003feedingchoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_locatorinformation`
--

DROP TABLE IF EXISTS `mpepu_locatorinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_locatorinformation` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `date_signed` date NOT NULL,
  `mail_address` varchar(35) NOT NULL,
  `contact_clinic` varchar(35) NOT NULL,
  `home_visit_permission` varchar(25) NOT NULL,
  `follow_up_call` varchar(25) NOT NULL,
  `cell_number` int(11) NOT NULL,
  `tel_number` int(11) NOT NULL,
  `work_call` varchar(25) NOT NULL,
  `work_name` varchar(35) NOT NULL,
  `contact_someone` varchar(25) NOT NULL,
  `name_contact` varchar(35) NOT NULL,
  `relationship` varchar(35) NOT NULL,
  `physical_address` varchar(35) NOT NULL,
  `phone_1` int(11) NOT NULL,
  `phone_2` int(11) NOT NULL,
  `resposible_person` varchar(25) NOT NULL,
  `responsible_names` varchar(35) NOT NULL,
  `number_1` int(11) NOT NULL,
  `number_2` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  CONSTRAINT `subject_consent_id_refs_id_4397ff79` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_locatorinformation`
--

LOCK TABLES `mpepu_locatorinformation` WRITE;
/*!40000 ALTER TABLE `mpepu_locatorinformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_locatorinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp001preregistrationloss`
--

DROP TABLE IF EXISTS `mpepu_mp001preregistrationloss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp001preregistrationloss` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `comments` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  CONSTRAINT `subject_consent_id_refs_id_7c961486` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp001preregistrationloss`
--

LOCK TABLES `mpepu_mp001preregistrationloss` WRITE;
/*!40000 ALTER TABLE `mpepu_mp001preregistrationloss` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp001preregistrationloss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp001preregistrationloss_reason_not_reg`
--

DROP TABLE IF EXISTS `mpepu_mp001preregistrationloss_reason_not_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp001preregistrationloss_reason_not_reg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp001preregistrationloss_id` varchar(36) NOT NULL,
  `mp001reasonsmothernotreg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp001preregistrationloss_id` (`mp001preregistrationloss_id`,`mp001reasonsmothernotreg_id`),
  KEY `mpepu_mp001preregistrationloss_reason_not_reg_2b93a6af` (`mp001preregistrationloss_id`),
  KEY `mpepu_mp001preregistrationloss_reason_not_reg_42add1f1` (`mp001reasonsmothernotreg_id`),
  CONSTRAINT `mp001preregistrationloss_id_refs_id_40bd16c6` FOREIGN KEY (`mp001preregistrationloss_id`) REFERENCES `mpepu_mp001preregistrationloss` (`id`),
  CONSTRAINT `mp001reasonsmothernotreg_id_refs_id_190e68a6` FOREIGN KEY (`mp001reasonsmothernotreg_id`) REFERENCES `mpepu_mp001reasonsmothernotreg` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp001preregistrationloss_reason_not_reg`
--

LOCK TABLES `mpepu_mp001preregistrationloss_reason_not_reg` WRITE;
/*!40000 ALTER TABLE `mpepu_mp001preregistrationloss_reason_not_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp001preregistrationloss_reason_not_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp001reasonsmothernotreg`
--

DROP TABLE IF EXISTS `mpepu_mp001reasonsmothernotreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp001reasonsmothernotreg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp001reasonsmothernotreg`
--

LOCK TABLES `mpepu_mp001reasonsmothernotreg` WRITE;
/*!40000 ALTER TABLE `mpepu_mp001reasonsmothernotreg` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp001reasonsmothernotreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003`
--

DROP TABLE IF EXISTS `mpepu_mp003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `participant_interview` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  CONSTRAINT `subject_consent_id_refs_id_5899507c` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003`
--

LOCK TABLES `mpepu_mp003` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003conditions`
--

DROP TABLE IF EXISTS `mpepu_mp003conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003conditions`
--

LOCK TABLES `mpepu_mp003conditions` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003cookingmethod`
--

DROP TABLE IF EXISTS `mpepu_mp003cookingmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003cookingmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003cookingmethod`
--

LOCK TABLES `mpepu_mp003cookingmethod` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003cookingmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003cookingmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003currentoccupation`
--

DROP TABLE IF EXISTS `mpepu_mp003currentoccupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003currentoccupation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003currentoccupation`
--

LOCK TABLES `mpepu_mp003currentoccupation` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003currentoccupation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003currentoccupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003ethnicity`
--

DROP TABLE IF EXISTS `mpepu_mp003ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003ethnicity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003ethnicity`
--

LOCK TABLES `mpepu_mp003ethnicity` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003ethnicity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003ethnicity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003higheducation`
--

DROP TABLE IF EXISTS `mpepu_mp003higheducation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003higheducation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003higheducation`
--

LOCK TABLES `mpepu_mp003higheducation` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003higheducation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003higheducation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003housetype`
--

DROP TABLE IF EXISTS `mpepu_mp003housetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003housetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003housetype`
--

LOCK TABLES `mpepu_mp003housetype` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003housetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003housetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003knowhivstat`
--

DROP TABLE IF EXISTS `mpepu_mp003knowhivstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003knowhivstat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003knowhivstat`
--

LOCK TABLES `mpepu_mp003knowhivstat` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003knowhivstat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003knowhivstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003maritalstatus`
--

DROP TABLE IF EXISTS `mpepu_mp003maritalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003maritalstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003maritalstatus`
--

LOCK TABLES `mpepu_mp003maritalstatus` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003maritalstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003maritalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003moneyearned`
--

DROP TABLE IF EXISTS `mpepu_mp003moneyearned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003moneyearned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003moneyearned`
--

LOCK TABLES `mpepu_mp003moneyearned` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003moneyearned` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003moneyearned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003priorarv`
--

DROP TABLE IF EXISTS `mpepu_mp003priorarv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003priorarv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003priorarv`
--

LOCK TABLES `mpepu_mp003priorarv` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003priorarv` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003priorarv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003priorpregnancy`
--

DROP TABLE IF EXISTS `mpepu_mp003priorpregnancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003priorpregnancy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003priorpregnancy`
--

LOCK TABLES `mpepu_mp003priorpregnancy` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003priorpregnancy` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003priorpregnancy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003providesmoney`
--

DROP TABLE IF EXISTS `mpepu_mp003providesmoney`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003providesmoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003providesmoney`
--

LOCK TABLES `mpepu_mp003providesmoney` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003providesmoney` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003providesmoney` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003recruitsource`
--

DROP TABLE IF EXISTS `mpepu_mp003recruitsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003recruitsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003recruitsource`
--

LOCK TABLES `mpepu_mp003recruitsource` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003recruitsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003recruitsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003sectionfour`
--

DROP TABLE IF EXISTS `mpepu_mp003sectionfour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003sectionfour` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp003_id` varchar(36) NOT NULL,
  `recruit_source_id` int(11) NOT NULL,
  `recruit_source_other` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp003_id` (`mp003_id`),
  KEY `mpepu_mp003sectionfour_2d0a2f54` (`recruit_source_id`),
  CONSTRAINT `mp003_id_refs_id_8b206af` FOREIGN KEY (`mp003_id`) REFERENCES `mpepu_mp003` (`id`),
  CONSTRAINT `recruit_source_id_refs_id_5d608537` FOREIGN KEY (`recruit_source_id`) REFERENCES `mpepu_mp003recruitsource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003sectionfour`
--

LOCK TABLES `mpepu_mp003sectionfour` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003sectionfour` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003sectionfour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003sectionthree`
--

DROP TABLE IF EXISTS `mpepu_mp003sectionthree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003sectionthree` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp003_id` varchar(36) NOT NULL,
  `prior_health_haart` varchar(25) NOT NULL,
  `date_haart` date NOT NULL,
  `preg_on_haart` varchar(25) NOT NULL,
  `haart_regimens` int(11) NOT NULL,
  `prior_preg_id` int(11) NOT NULL,
  `prev_pregnancy_arv` varchar(25) NOT NULL,
  `prev_preg_azt` varchar(25) NOT NULL,
  `prev_sdnvp_labour` varchar(25) NOT NULL,
  `prev_preg_haart` varchar(25) NOT NULL,
  `azt3tc_post_delivery` varchar(25) NOT NULL,
  `cd4_count` int(11) NOT NULL,
  `cd4_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp003_id` (`mp003_id`),
  KEY `mpepu_mp003sectionthree_2ef97b91` (`prior_preg_id`),
  CONSTRAINT `mp003_id_refs_id_c0fe4be` FOREIGN KEY (`mp003_id`) REFERENCES `mpepu_mp003` (`id`),
  CONSTRAINT `prior_preg_id_refs_id_70cdb785` FOREIGN KEY (`prior_preg_id`) REFERENCES `mpepu_mp003priorpregnancy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003sectionthree`
--

LOCK TABLES `mpepu_mp003sectionthree` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003sectionthree` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003sectionthree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003sectionthree_conditions`
--

DROP TABLE IF EXISTS `mpepu_mp003sectionthree_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003sectionthree_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp003sectionthree_id` varchar(36) NOT NULL,
  `mp003priorarv_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp003sectionthree_id` (`mp003sectionthree_id`,`mp003priorarv_id`),
  KEY `mpepu_mp003sectionthree_conditions_665c4e38` (`mp003sectionthree_id`),
  KEY `mpepu_mp003sectionthree_conditions_37ae7caa` (`mp003priorarv_id`),
  CONSTRAINT `mp003priorarv_id_refs_id_3f1c8795` FOREIGN KEY (`mp003priorarv_id`) REFERENCES `mpepu_mp003priorarv` (`id`),
  CONSTRAINT `mp003sectionthree_id_refs_id_70ea5191` FOREIGN KEY (`mp003sectionthree_id`) REFERENCES `mpepu_mp003sectionthree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003sectionthree_conditions`
--

LOCK TABLES `mpepu_mp003sectionthree_conditions` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003sectionthree_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003sectionthree_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003sectiontwo`
--

DROP TABLE IF EXISTS `mpepu_mp003sectiontwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003sectiontwo` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp003_id` varchar(36) NOT NULL,
  `prev_pregnancies` int(11) NOT NULL,
  `preg_24wks` int(11) NOT NULL,
  `lost_before_24wks` int(11) NOT NULL,
  `lost_after_24wks` int(11) NOT NULL,
  `live_children` int(11) NOT NULL,
  `dead_children` int(11) NOT NULL,
  `ongoing_conditions` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp003_id` (`mp003_id`),
  CONSTRAINT `mp003_id_refs_id_52d066e2` FOREIGN KEY (`mp003_id`) REFERENCES `mpepu_mp003` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003sectiontwo`
--

LOCK TABLES `mpepu_mp003sectiontwo` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003sectiontwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003sectiontwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003sectiontwo_conditions`
--

DROP TABLE IF EXISTS `mpepu_mp003sectiontwo_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003sectiontwo_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp003sectiontwo_id` varchar(36) NOT NULL,
  `mp003conditions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp003sectiontwo_id` (`mp003sectiontwo_id`,`mp003conditions_id`),
  KEY `mpepu_mp003sectiontwo_conditions_6313def8` (`mp003sectiontwo_id`),
  KEY `mpepu_mp003sectiontwo_conditions_68768773` (`mp003conditions_id`),
  CONSTRAINT `mp003conditions_id_refs_id_3b08564c` FOREIGN KEY (`mp003conditions_id`) REFERENCES `mpepu_mp003conditions` (`id`),
  CONSTRAINT `mp003sectiontwo_id_refs_id_1f44836b` FOREIGN KEY (`mp003sectiontwo_id`) REFERENCES `mpepu_mp003sectiontwo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003sectiontwo_conditions`
--

LOCK TABLES `mpepu_mp003sectiontwo_conditions` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003sectiontwo_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003sectiontwo_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003toiletfacility`
--

DROP TABLE IF EXISTS `mpepu_mp003toiletfacility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003toiletfacility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003toiletfacility`
--

LOCK TABLES `mpepu_mp003toiletfacility` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003toiletfacility` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003toiletfacility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp003watersource`
--

DROP TABLE IF EXISTS `mpepu_mp003watersource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp003watersource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp003watersource`
--

LOCK TABLES `mpepu_mp003watersource` WRITE;
/*!40000 ALTER TABLE `mpepu_mp003watersource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp003watersource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp004`
--

DROP TABLE IF EXISTS `mpepu_mp004`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp004` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `recv_arv_pregnancy` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  CONSTRAINT `subject_consent_id_refs_id_6afe1db7` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp004`
--

LOCK TABLES `mpepu_mp004` WRITE;
/*!40000 ALTER TABLE `mpepu_mp004` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp004` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp004arv`
--

DROP TABLE IF EXISTS `mpepu_mp004arv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp004arv` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp004_id` varchar(36) NOT NULL,
  `arv_code_id` int(11) NOT NULL,
  `arv_start_date` date NOT NULL,
  `arv_stop_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mpepu_mp004arv_18955f84` (`mp004_id`),
  KEY `mpepu_mp004arv_7c2859e1` (`arv_code_id`),
  CONSTRAINT `arv_code_id_refs_id_5e8d71cd` FOREIGN KEY (`arv_code_id`) REFERENCES `mpepu_mp004arvlist` (`id`),
  CONSTRAINT `mp004_id_refs_id_4fc47d41` FOREIGN KEY (`mp004_id`) REFERENCES `mpepu_mp004` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp004arv`
--

LOCK TABLES `mpepu_mp004arv` WRITE;
/*!40000 ALTER TABLE `mpepu_mp004arv` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp004arv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp004arvinterruption`
--

DROP TABLE IF EXISTS `mpepu_mp004arvinterruption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp004arvinterruption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp004arvinterruption`
--

LOCK TABLES `mpepu_mp004arvinterruption` WRITE;
/*!40000 ALTER TABLE `mpepu_mp004arvinterruption` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp004arvinterruption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp004arvlist`
--

DROP TABLE IF EXISTS `mpepu_mp004arvlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp004arvlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp004arvlist`
--

LOCK TABLES `mpepu_mp004arvlist` WRITE;
/*!40000 ALTER TABLE `mpepu_mp004arvlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp004arvlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp004arvpostpartum`
--

DROP TABLE IF EXISTS `mpepu_mp004arvpostpartum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp004arvpostpartum` (
  `mp004arv_ptr_id` varchar(36) NOT NULL,
  PRIMARY KEY (`mp004arv_ptr_id`),
  CONSTRAINT `mp004arv_ptr_id_refs_id_43dc84de` FOREIGN KEY (`mp004arv_ptr_id`) REFERENCES `mpepu_mp004arv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp004arvpostpartum`
--

LOCK TABLES `mpepu_mp004arvpostpartum` WRITE;
/*!40000 ALTER TABLE `mpepu_mp004arvpostpartum` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp004arvpostpartum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp004arvpregnancy`
--

DROP TABLE IF EXISTS `mpepu_mp004arvpregnancy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp004arvpregnancy` (
  `mp004arv_ptr_id` varchar(36) NOT NULL,
  PRIMARY KEY (`mp004arv_ptr_id`),
  CONSTRAINT `mp004arv_ptr_id_refs_id_34660865` FOREIGN KEY (`mp004arv_ptr_id`) REFERENCES `mpepu_mp004arv` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp004arvpregnancy`
--

LOCK TABLES `mpepu_mp004arvpregnancy` WRITE;
/*!40000 ALTER TABLE `mpepu_mp004arvpregnancy` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp004arvpregnancy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp004sectiontwo`
--

DROP TABLE IF EXISTS `mpepu_mp004sectiontwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp004sectiontwo` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp004_id` varchar(36) NOT NULL,
  `arv_interruption_id` int(11) NOT NULL,
  `sdnvp` varchar(3) NOT NULL,
  `date_discharged` date NOT NULL,
  `arv_start_pp` varchar(3) NOT NULL,
  `comments` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp004_id` (`mp004_id`),
  KEY `mpepu_mp004sectiontwo_2d83eb1` (`arv_interruption_id`),
  CONSTRAINT `arv_interruption_id_refs_id_2e3d7ef5` FOREIGN KEY (`arv_interruption_id`) REFERENCES `mpepu_mp004arvinterruption` (`id`),
  CONSTRAINT `mp004_id_refs_id_2a8c7b50` FOREIGN KEY (`mp004_id`) REFERENCES `mpepu_mp004` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp004sectiontwo`
--

LOCK TABLES `mpepu_mp004sectiontwo` WRITE;
/*!40000 ALTER TABLE `mpepu_mp004sectiontwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp004sectiontwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005deliverycomplications`
--

DROP TABLE IF EXISTS `mpepu_mp005deliverycomplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005deliverycomplications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005deliverycomplications`
--

LOCK TABLES `mpepu_mp005deliverycomplications` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005deliverycomplications` DISABLE KEYS */;
INSERT INTO `mpepu_mp005deliverycomplications` VALUES (1,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Prolonged rapture of membranes','prolonged rapture of membranes',10,NULL,''),(2,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Preterm labour ','preterm labour ',20,NULL,''),(3,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Postpartum hemorhager','postpartum hemorhager',30,NULL,''),(4,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Retained placenta','retained placenta',40,NULL,''),(5,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Uterine perforation/rupture ','uterine perforation/rupture ',50,NULL,''),(6,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Nuchal cord ','nuchal cord ',60,NULL,''),(7,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Other, describe','other, describe',99,NULL,'');
/*!40000 ALTER TABLE `mpepu_mp005deliverycomplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005deliverymode`
--

DROP TABLE IF EXISTS `mpepu_mp005deliverymode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005deliverymode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005deliverymode`
--

LOCK TABLES `mpepu_mp005deliverymode` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005deliverymode` DISABLE KEYS */;
INSERT INTO `mpepu_mp005deliverymode` VALUES (1,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Vaginal delivery ','vaginal delivery ',10,NULL,''),(2,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Elective cesarean section ','elective cesarean section ',20,NULL,''),(3,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Emergent cesarean section ','emergent cesarean section ',30,NULL,'');
/*!40000 ALTER TABLE `mpepu_mp005deliverymode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005healthconditions`
--

DROP TABLE IF EXISTS `mpepu_mp005healthconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005healthconditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005healthconditions`
--

LOCK TABLES `mpepu_mp005healthconditions` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005healthconditions` DISABLE KEYS */;
INSERT INTO `mpepu_mp005healthconditions` VALUES (1,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Asthma','asthma',10,NULL,''),(2,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Depression ','depression ',20,NULL,''),(3,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Chronic Hepatits Diagnosed prior to this pregnancy: Hepatitis B surface antigen positive ','chronic hepatits diagnosed prior to this pregnancy: hepatitis b surface antigen positive ',30,NULL,''),(4,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Chronic Hepatits Diagnosed prior to this pregnancy: Chronic Hep B carrier ','chronic hepatits diagnosed prior to this pregnancy: chronic hep b carrier ',40,NULL,''),(5,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Chronic Hepatits Diagnosed prior to this pregnancy: Hepatitis C ','chronic hepatits diagnosed prior to this pregnancy: hepatitis c ',50,NULL,''),(6,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Chronic Hepatits Diagnosed prior to this pregnancy: Other/Unknown ','chronic hepatits diagnosed prior to this pregnancy: other/unknown ',60,NULL,''),(7,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Other (list)','other (list)',99,NULL,'');
/*!40000 ALTER TABLE `mpepu_mp005healthconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005hospital`
--

DROP TABLE IF EXISTS `mpepu_mp005hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005hospital`
--

LOCK TABLES `mpepu_mp005hospital` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005hospital` DISABLE KEYS */;
INSERT INTO `mpepu_mp005hospital` VALUES (1,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Gaborone(PMH) ','gaborone(pmh) ',10,NULL,''),(2,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Molepolole(SLH) ','molepolole(slh) ',20,NULL,''),(3,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Lobatse(Athlone) ','lobatse(athlone) ',30,NULL,''),(4,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Other health facilities not associated with study site,(specify in 4a) ','other health facilities not associated with study site,(specify in 4a) ',40,NULL,''),(5,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Home ','home ',50,NULL,''),(6,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Lands ','lands ',60,NULL,''),(7,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Other location','other location',99,NULL,'');
/*!40000 ALTER TABLE `mpepu_mp005hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005labouranddelivery`
--

DROP TABLE IF EXISTS `mpepu_mp005labouranddelivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005labouranddelivery` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `registered_mother_id` varchar(36) NOT NULL,
  `delivery_datetime` datetime NOT NULL,
  `delivery_time_is_estimated` varchar(3) NOT NULL,
  `labour_hrs_id` int(11) NOT NULL,
  `delivery_mode_id` int(11) NOT NULL,
  `delivery_hosp_id` int(11) NOT NULL,
  `delivery_hosp_other` varchar(35) NOT NULL,
  `has_urine_tenderness` varchar(3) NOT NULL,
  `labour_max_temp` decimal(4,1) NOT NULL,
  `has_chorioamnionitis` varchar(3) NOT NULL,
  `has_delivery_complications` varchar(3) NOT NULL,
  `live_infants` int(11) NOT NULL,
  `still_borns` int(11) NOT NULL,
  `still_born_has_congen_abn` varchar(3) NOT NULL,
  `still_born_congen_abn` varchar(35) DEFAULT NULL,
  `delivery_comment` longtext,
  `comment` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registered_mother_id` (`registered_mother_id`),
  KEY `mpepu_mp005labouranddelivery_31d4e7ef` (`labour_hrs_id`),
  KEY `mpepu_mp005labouranddelivery_6900faad` (`delivery_mode_id`),
  KEY `mpepu_mp005labouranddelivery_4be21a4` (`delivery_hosp_id`),
  CONSTRAINT `delivery_hosp_id_refs_id_253d6e4c` FOREIGN KEY (`delivery_hosp_id`) REFERENCES `mpepu_mp005hospital` (`id`),
  CONSTRAINT `delivery_mode_id_refs_id_baa6e0b` FOREIGN KEY (`delivery_mode_id`) REFERENCES `mpepu_mp005deliverymode` (`id`),
  CONSTRAINT `labour_hrs_id_refs_id_53fb7aa5` FOREIGN KEY (`labour_hrs_id`) REFERENCES `mpepu_mp005labourhours` (`id`),
  CONSTRAINT `registered_mother_id_refs_id_f55a7ee` FOREIGN KEY (`registered_mother_id`) REFERENCES `mpepu_registeredmother` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005labouranddelivery`
--

LOCK TABLES `mpepu_mp005labouranddelivery` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005labouranddelivery` DISABLE KEYS */;
INSERT INTO `mpepu_mp005labouranddelivery` VALUES ('2011-01-19 20:25:17','2011-01-19 20:25:17','erikvw','','s100','s100','772ef34e-23f9-11e0-b573-001d72b88a3a','de903bb6-23f8-11e0-9ed9-001d72b88a3a','2011-01-19 20:21:24','No',2,1,1,'','Yes','96.4','No','Yes',1,0,'N/A','','','');
/*!40000 ALTER TABLE `mpepu_mp005labouranddelivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005labouranddelivery_delivery_complications`
--

DROP TABLE IF EXISTS `mpepu_mp005labouranddelivery_delivery_complications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005labouranddelivery_delivery_complications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp005labouranddelivery_id` varchar(36) NOT NULL,
  `mp005deliverycomplications_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp005labouranddelivery_id` (`mp005labouranddelivery_id`,`mp005deliverycomplications_id`),
  KEY `mpepu_mp005labouranddelivery_delivery_complications_bc24e8e` (`mp005labouranddelivery_id`),
  KEY `mpepu_mp005labouranddelivery_delivery_complications_65a10115` (`mp005deliverycomplications_id`),
  CONSTRAINT `mp005deliverycomplications_id_refs_id_138bbccc` FOREIGN KEY (`mp005deliverycomplications_id`) REFERENCES `mpepu_mp005deliverycomplications` (`id`),
  CONSTRAINT `mp005labouranddelivery_id_refs_id_56b96de3` FOREIGN KEY (`mp005labouranddelivery_id`) REFERENCES `mpepu_mp005labouranddelivery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005labouranddelivery_delivery_complications`
--

LOCK TABLES `mpepu_mp005labouranddelivery_delivery_complications` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005labouranddelivery_delivery_complications` DISABLE KEYS */;
INSERT INTO `mpepu_mp005labouranddelivery_delivery_complications` VALUES (1,'772ef34e-23f9-11e0-b573-001d72b88a3a',2);
/*!40000 ALTER TABLE `mpepu_mp005labouranddelivery_delivery_complications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005labourhours`
--

DROP TABLE IF EXISTS `mpepu_mp005labourhours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005labourhours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005labourhours`
--

LOCK TABLES `mpepu_mp005labourhours` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005labourhours` DISABLE KEYS */;
INSERT INTO `mpepu_mp005labourhours` VALUES (1,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','0-<6hours ','0-<6hours ',10,NULL,''),(2,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','6-<12hours ','6-<12hours ',20,NULL,''),(3,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','12-24hours ','12-24hours ',30,NULL,''),(4,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','>24hours ','>24hours ',40,NULL,'');
/*!40000 ALTER TABLE `mpepu_mp005labourhours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005medicalhistory`
--

DROP TABLE IF EXISTS `mpepu_mp005medicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005medicalhistory` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp005_id` varchar(36) NOT NULL,
  `has_health_conditions` varchar(3) NOT NULL,
  `has_ob_complications` varchar(3) NOT NULL,
  `has_preg_diagnoses` varchar(3) NOT NULL,
  `has_who_dx` varchar(3) NOT NULL,
  `has_cd4` varchar(3) NOT NULL,
  `cd4_date` date DEFAULT NULL,
  `cd4_result` varchar(35) DEFAULT NULL,
  `has_vl` varchar(3) NOT NULL,
  `vl_date` date DEFAULT NULL,
  `vl_result` varchar(35) DEFAULT NULL,
  `has_mother_weight` varchar(3) NOT NULL,
  `mother_weight` decimal(3,1) NOT NULL,
  `has_supplements_taken` varchar(3) NOT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp005_id` (`mp005_id`),
  CONSTRAINT `mp005_id_refs_id_343b974d` FOREIGN KEY (`mp005_id`) REFERENCES `mpepu_mp005labouranddelivery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005medicalhistory`
--

LOCK TABLES `mpepu_mp005medicalhistory` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005medicalhistory_health_conditions`
--

DROP TABLE IF EXISTS `mpepu_mp005medicalhistory_health_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005medicalhistory_health_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp005medicalhistory_id` varchar(36) NOT NULL,
  `mp005healthconditions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp005medicalhistory_id` (`mp005medicalhistory_id`,`mp005healthconditions_id`),
  KEY `mpepu_mp005medicalhistory_health_conditions_48cae11c` (`mp005medicalhistory_id`),
  KEY `mpepu_mp005medicalhistory_health_conditions_53ddcd05` (`mp005healthconditions_id`),
  CONSTRAINT `mp005healthconditions_id_refs_id_2e730c38` FOREIGN KEY (`mp005healthconditions_id`) REFERENCES `mpepu_mp005healthconditions` (`id`),
  CONSTRAINT `mp005medicalhistory_id_refs_id_63e4cd65` FOREIGN KEY (`mp005medicalhistory_id`) REFERENCES `mpepu_mp005medicalhistory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005medicalhistory_health_conditions`
--

LOCK TABLES `mpepu_mp005medicalhistory_health_conditions` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_health_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_health_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005medicalhistory_ob_complications`
--

DROP TABLE IF EXISTS `mpepu_mp005medicalhistory_ob_complications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005medicalhistory_ob_complications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp005medicalhistory_id` varchar(36) NOT NULL,
  `mp005obcomplications_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp005medicalhistory_id` (`mp005medicalhistory_id`,`mp005obcomplications_id`),
  KEY `mpepu_mp005medicalhistory_ob_complications_48cae11c` (`mp005medicalhistory_id`),
  KEY `mpepu_mp005medicalhistory_ob_complications_26952e8c` (`mp005obcomplications_id`),
  CONSTRAINT `mp005medicalhistory_id_refs_id_6a365a3a` FOREIGN KEY (`mp005medicalhistory_id`) REFERENCES `mpepu_mp005medicalhistory` (`id`),
  CONSTRAINT `mp005obcomplications_id_refs_id_4320c036` FOREIGN KEY (`mp005obcomplications_id`) REFERENCES `mpepu_mp005obcomplications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005medicalhistory_ob_complications`
--

LOCK TABLES `mpepu_mp005medicalhistory_ob_complications` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_ob_complications` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_ob_complications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005medicalhistory_preg_diagnosis`
--

DROP TABLE IF EXISTS `mpepu_mp005medicalhistory_preg_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005medicalhistory_preg_diagnosis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp005medicalhistory_id` varchar(36) NOT NULL,
  `mp005pregdiagnosis_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp005medicalhistory_id` (`mp005medicalhistory_id`,`mp005pregdiagnosis_id`),
  KEY `mpepu_mp005medicalhistory_preg_diagnosis_48cae11c` (`mp005medicalhistory_id`),
  KEY `mpepu_mp005medicalhistory_preg_diagnosis_102abf7f` (`mp005pregdiagnosis_id`),
  CONSTRAINT `mp005medicalhistory_id_refs_id_77269e3d` FOREIGN KEY (`mp005medicalhistory_id`) REFERENCES `mpepu_mp005medicalhistory` (`id`),
  CONSTRAINT `mp005pregdiagnosis_id_refs_id_44296c6a` FOREIGN KEY (`mp005pregdiagnosis_id`) REFERENCES `mpepu_mp005pregdiagnosis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005medicalhistory_preg_diagnosis`
--

LOCK TABLES `mpepu_mp005medicalhistory_preg_diagnosis` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_preg_diagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_preg_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005medicalhistory_supplements`
--

DROP TABLE IF EXISTS `mpepu_mp005medicalhistory_supplements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005medicalhistory_supplements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp005medicalhistory_id` varchar(36) NOT NULL,
  `mp005supplements_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp005medicalhistory_id` (`mp005medicalhistory_id`,`mp005supplements_id`),
  KEY `mpepu_mp005medicalhistory_supplements_48cae11c` (`mp005medicalhistory_id`),
  KEY `mpepu_mp005medicalhistory_supplements_394200fc` (`mp005supplements_id`),
  CONSTRAINT `mp005medicalhistory_id_refs_id_17af03d6` FOREIGN KEY (`mp005medicalhistory_id`) REFERENCES `mpepu_mp005medicalhistory` (`id`),
  CONSTRAINT `mp005supplements_id_refs_id_50c5fbc2` FOREIGN KEY (`mp005supplements_id`) REFERENCES `mpepu_mp005supplements` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005medicalhistory_supplements`
--

LOCK TABLES `mpepu_mp005medicalhistory_supplements` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_supplements` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_supplements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005medicalhistory_who_dx`
--

DROP TABLE IF EXISTS `mpepu_mp005medicalhistory_who_dx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005medicalhistory_who_dx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp005medicalhistory_id` varchar(36) NOT NULL,
  `whoclinicalstagingdxadult_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp005medicalhistory_id` (`mp005medicalhistory_id`,`whoclinicalstagingdxadult_id`),
  KEY `mpepu_mp005medicalhistory_who_dx_48cae11c` (`mp005medicalhistory_id`),
  KEY `mpepu_mp005medicalhistory_who_dx_6fb53497` (`whoclinicalstagingdxadult_id`),
  CONSTRAINT `mp005medicalhistory_id_refs_id_58fdce9c` FOREIGN KEY (`mp005medicalhistory_id`) REFERENCES `mpepu_mp005medicalhistory` (`id`),
  CONSTRAINT `whoclinicalstagingdxadult_id_refs_id_5ab4e731` FOREIGN KEY (`whoclinicalstagingdxadult_id`) REFERENCES `bhp_code_lists_whoclinicalstagingdxadult` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005medicalhistory_who_dx`
--

LOCK TABLES `mpepu_mp005medicalhistory_who_dx` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_who_dx` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp005medicalhistory_who_dx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005obcomplications`
--

DROP TABLE IF EXISTS `mpepu_mp005obcomplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005obcomplications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005obcomplications`
--

LOCK TABLES `mpepu_mp005obcomplications` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005obcomplications` DISABLE KEYS */;
INSERT INTO `mpepu_mp005obcomplications` VALUES (1,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Asthma exacerbation requiring treatment (PO or IV steroids) ','asthma exacerbation requiring treatment (po or iv steroids) ',10,NULL,''),(2,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Pregnancy induced hypertension (hypertension diagnosed in this pregnancy) ','pregnancy induced hypertension (hypertension diagnosed in this pregnancy) ',20,NULL,''),(3,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Preeclampsia','preeclampsia',30,NULL,''),(4,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Chronic diabetes ','chronic diabetes ',40,NULL,''),(5,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Gestational diabetes (diabetes diagnosed during this pregnancy)','gestational diabetes (diabetes diagnosed during this pregnancy)',50,NULL,''),(6,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Vaginal bleeding ','vaginal bleeding ',60,NULL,''),(7,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Oligohydramnios','oligohydramnios',70,NULL,''),(8,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Premature rapture of membranes','premature rapture of membranes',80,NULL,''),(9,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Placenta abruption ','placenta abruption ',90,NULL,''),(10,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Placenta previa ','placenta previa ',100,NULL,''),(11,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Preterm labour ','preterm labour ',110,NULL,''),(12,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Chorioamnionitis ','chorioamnionitis ',120,NULL,''),(13,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','STI:cervicitis unspecified ','sti:cervicitis unspecified ',130,NULL,''),(14,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','STI:Herpes ','sti:herpes ',140,NULL,''),(15,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','STI:Chlamydia','sti:chlamydia',150,NULL,''),(16,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','STI:Gonorhea','sti:gonorhea',160,NULL,''),(17,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','STI:Syphilis ','sti:syphilis ',170,NULL,''),(18,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Other(specify)','other(specify)',180,NULL,'');
/*!40000 ALTER TABLE `mpepu_mp005obcomplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005pregdiagnosis`
--

DROP TABLE IF EXISTS `mpepu_mp005pregdiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005pregdiagnosis` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `diagnosis_id` int(11) NOT NULL,
  `grade` varchar(3) NOT NULL,
  `hosptalized` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mpepu_mp005pregdiagnosis_33d9d18e` (`diagnosis_id`),
  CONSTRAINT `diagnosis_id_refs_diagnosiscode_ptr_id_66f8ff9e` FOREIGN KEY (`diagnosis_id`) REFERENCES `mpepu_diagnosis` (`diagnosiscode_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005pregdiagnosis`
--

LOCK TABLES `mpepu_mp005pregdiagnosis` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005pregdiagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp005pregdiagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp005supplements`
--

DROP TABLE IF EXISTS `mpepu_mp005supplements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp005supplements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp005supplements`
--

LOCK TABLES `mpepu_mp005supplements` WRITE;
/*!40000 ALTER TABLE `mpepu_mp005supplements` DISABLE KEYS */;
INSERT INTO `mpepu_mp005supplements` VALUES (1,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Prenatal vitamins ','prenatal vitamins ',10,NULL,''),(2,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Ferrous (separate from prenatal vitamins) ','ferrous (separate from prenatal vitamins) ',20,NULL,''),(3,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Cotrimoxazole ','cotrimoxazole ',30,NULL,''),(4,'2011-01-19 20:11:37','2011-01-19 20:11:37','cabel','cabel','','','Isoniazid ','isoniazid ',40,NULL,'');
/*!40000 ALTER TABLE `mpepu_mp005supplements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp006`
--

DROP TABLE IF EXISTS `mpepu_mp006`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp006` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `postnatal_followup` varchar(3) NOT NULL,
  `mother_weight` varchar(3) NOT NULL,
  `enter_weight` decimal(3,1) NOT NULL,
  `breastfeeding` varchar(3) NOT NULL,
  `mastitis` varchar(3) NOT NULL,
  `mother_new` varchar(3) NOT NULL,
  `chronic_conditions` varchar(3) NOT NULL,
  `diagnoses` varchar(3) NOT NULL,
  `mp006_diagnosis_id` varchar(36) NOT NULL,
  `who_clinical_stage` varchar(3) NOT NULL,
  `who_diagnosis` varchar(35) DEFAULT NULL,
  `cd4_perform` varchar(3) NOT NULL,
  `viraload_perform` varchar(3) NOT NULL,
  `medical_record` varchar(3) NOT NULL,
  `date` date NOT NULL,
  `result` int(11) NOT NULL,
  `comments` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_mp006_5060ff2` (`mp006_diagnosis_id`),
  CONSTRAINT `subject_consent_id_refs_id_6827b9fd` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp006`
--

LOCK TABLES `mpepu_mp006` WRITE;
/*!40000 ALTER TABLE `mpepu_mp006` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp006` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp006_conditions`
--

DROP TABLE IF EXISTS `mpepu_mp006_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp006_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mp006_id` varchar(36) NOT NULL,
  `mp006conditions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp006_id` (`mp006_id`,`mp006conditions_id`),
  KEY `mpepu_mp006_conditions_3bab2752` (`mp006_id`),
  KEY `mpepu_mp006_conditions_537bcc6a` (`mp006conditions_id`),
  CONSTRAINT `mp006conditions_id_refs_id_46b6aa05` FOREIGN KEY (`mp006conditions_id`) REFERENCES `mpepu_mp006conditions` (`id`),
  CONSTRAINT `mp006_id_refs_id_4a292ca9` FOREIGN KEY (`mp006_id`) REFERENCES `mpepu_mp006` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp006_conditions`
--

LOCK TABLES `mpepu_mp006_conditions` WRITE;
/*!40000 ALTER TABLE `mpepu_mp006_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp006_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp006conditions`
--

DROP TABLE IF EXISTS `mpepu_mp006conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp006conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp006conditions`
--

LOCK TABLES `mpepu_mp006conditions` WRITE;
/*!40000 ALTER TABLE `mpepu_mp006conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp006conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp006reasonhospitalized`
--

DROP TABLE IF EXISTS `mpepu_mp006reasonhospitalized`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp006reasonhospitalized` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp006reasonhospitalized`
--

LOCK TABLES `mpepu_mp006reasonhospitalized` WRITE;
/*!40000 ALTER TABLE `mpepu_mp006reasonhospitalized` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp006reasonhospitalized` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp007`
--

DROP TABLE IF EXISTS `mpepu_mp007`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp007` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `last_haart` varchar(25) NOT NULL,
  `haart_reason_id` int(11) NOT NULL,
  `regimen_changes` varchar(25) NOT NULL,
  `comments` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_mp007_1ef4c207` (`haart_reason_id`),
  CONSTRAINT `haart_reason_id_refs_id_5526398e` FOREIGN KEY (`haart_reason_id`) REFERENCES `mpepu_mp007haartreason` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_65cc9420` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp007`
--

LOCK TABLES `mpepu_mp007` WRITE;
/*!40000 ALTER TABLE `mpepu_mp007` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp007` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp007haart`
--

DROP TABLE IF EXISTS `mpepu_mp007haart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp007haart` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `arv_code_id` int(11) NOT NULL,
  `dose_status_id` int(11) NOT NULL,
  `modification_date` date NOT NULL,
  `modification_code_id` int(11) NOT NULL,
  `mp007_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mpepu_mp007haart_7c2859e1` (`arv_code_id`),
  KEY `mpepu_mp007haart_7e662ce7` (`dose_status_id`),
  KEY `mpepu_mp007haart_1d74e317` (`modification_code_id`),
  KEY `mpepu_mp007haart_3f744b09` (`mp007_id`),
  CONSTRAINT `arv_code_id_refs_id_4f805b1e` FOREIGN KEY (`arv_code_id`) REFERENCES `bhp_code_lists_arvcode` (`id`),
  CONSTRAINT `dose_status_id_refs_id_5e79f7f2` FOREIGN KEY (`dose_status_id`) REFERENCES `bhp_code_lists_arvdosestatus` (`id`),
  CONSTRAINT `modification_code_id_refs_id_15effa92` FOREIGN KEY (`modification_code_id`) REFERENCES `bhp_code_lists_arvmodificationcode` (`id`),
  CONSTRAINT `mp007_id_refs_id_ff6b33a` FOREIGN KEY (`mp007_id`) REFERENCES `mpepu_mp007` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp007haart`
--

LOCK TABLES `mpepu_mp007haart` WRITE;
/*!40000 ALTER TABLE `mpepu_mp007haart` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp007haart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp007haartreason`
--

DROP TABLE IF EXISTS `mpepu_mp007haartreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp007haartreason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp007haartreason`
--

LOCK TABLES `mpepu_mp007haartreason` WRITE;
/*!40000 ALTER TABLE `mpepu_mp007haartreason` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp007haartreason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp008feedingafterdeliv`
--

DROP TABLE IF EXISTS `mpepu_mp008feedingafterdeliv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp008feedingafterdeliv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp008feedingafterdeliv`
--

LOCK TABLES `mpepu_mp008feedingafterdeliv` WRITE;
/*!40000 ALTER TABLE `mpepu_mp008feedingafterdeliv` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp008feedingafterdeliv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp008infantbirthrecord`
--

DROP TABLE IF EXISTS `mpepu_mp008infantbirthrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp008infantbirthrecord` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `mp005_id` varchar(36) NOT NULL,
  `infant_identifier` varchar(25) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `delivery_date` date NOT NULL,
  `newborn_date` date NOT NULL,
  `newborn_time` time NOT NULL,
  `newborn_sex` varchar(6) NOT NULL,
  `general_activity` varchar(100) NOT NULL,
  `gen_activity_other` varchar(35) DEFAULT NULL,
  `infant_weight` decimal(2,2) NOT NULL,
  `infant_length` decimal(2,2) NOT NULL,
  `head_circumference` decimal(2,2) NOT NULL,
  `physical_exam_result` varchar(35) NOT NULL,
  `heent_exam` varchar(3) NOT NULL,
  `heent_no_other` varchar(35) DEFAULT NULL,
  `resp_exam` varchar(3) NOT NULL,
  `resp_exam_other` varchar(35) DEFAULT NULL,
  `cardiac_exam` varchar(3) NOT NULL,
  `cardiac_exam_other` varchar(35) DEFAULT NULL,
  `abdominal_exam` varchar(3) NOT NULL,
  `abdominal_exam_other` varchar(35) DEFAULT NULL,
  `skin_exam` varchar(3) NOT NULL,
  `mac_pap_rash` varchar(3) NOT NULL,
  `neuro_exam` varchar(3) NOT NULL,
  `neuro_exam_other` varchar(35) DEFAULT NULL,
  `congenital_anomalities` varchar(3) NOT NULL,
  `apgar_score` varchar(3) NOT NULL,
  `apgar_score_min_1` int(11) NOT NULL,
  `apgar_score_min_5` int(11) NOT NULL,
  `apgar_score_min_10` int(11) NOT NULL,
  `other_info` varchar(100) DEFAULT NULL,
  `infant_azt` varchar(3) NOT NULL,
  `azt__first_dose` date NOT NULL,
  `azt_additional_dose` varchar(3) NOT NULL,
  `nvp_after_birth` varchar(3) NOT NULL,
  `nvp__first_dose` date NOT NULL,
  `additional_nvp_doses` varchar(3) NOT NULL,
  `azt_after_discharge` varchar(3) NOT NULL,
  `nvp_after_discharge` varchar(3) NOT NULL,
  `feeding_after_deliv_id` int(11) NOT NULL,
  `comments` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `infant_identifier` (`infant_identifier`),
  KEY `mpepu_mp008infantbirthrecord_2b038295` (`mp005_id`),
  KEY `mpepu_mp008infantbirthrecord_2e86b527` (`feeding_after_deliv_id`),
  CONSTRAINT `feeding_after_deliv_id_refs_id_8023a33` FOREIGN KEY (`feeding_after_deliv_id`) REFERENCES `mpepu_mp008feedingafterdeliv` (`id`),
  CONSTRAINT `mp005_id_refs_id_53c3a510` FOREIGN KEY (`mp005_id`) REFERENCES `mpepu_mp005labouranddelivery` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp008infantbirthrecord`
--

LOCK TABLES `mpepu_mp008infantbirthrecord` WRITE;
/*!40000 ALTER TABLE `mpepu_mp008infantbirthrecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp008infantbirthrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp009`
--

DROP TABLE IF EXISTS `mpepu_mp009`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp009` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `arv_prophylaxis_stat_id` int(11) NOT NULL,
  `baby_nvp` varchar(3) NOT NULL,
  `missed_prophy_nvp` int(11) NOT NULL,
  `reason_missed_id` int(11) NOT NULL,
  `reason_missed_other` varchar(35) DEFAULT NULL,
  `reason_stopped_id` int(11) NOT NULL,
  `reason_stopped_other` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_mp009_5f541a7e` (`arv_prophylaxis_stat_id`),
  KEY `mpepu_mp009_182390a1` (`reason_missed_id`),
  KEY `mpepu_mp009_2af75428` (`reason_stopped_id`),
  CONSTRAINT `arv_prophylaxis_stat_id_refs_id_1313a853` FOREIGN KEY (`arv_prophylaxis_stat_id`) REFERENCES `mpepu_mp009arvprophylaxisstat` (`id`),
  CONSTRAINT `reason_missed_id_refs_id_17cf5f58` FOREIGN KEY (`reason_missed_id`) REFERENCES `mpepu_mp009reasonmissed` (`id`),
  CONSTRAINT `reason_stopped_id_refs_id_1bc3106f` FOREIGN KEY (`reason_stopped_id`) REFERENCES `mpepu_mp009reasonstopped` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_49738b9a` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp009`
--

LOCK TABLES `mpepu_mp009` WRITE;
/*!40000 ALTER TABLE `mpepu_mp009` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp009` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp009arvprophylaxisstat`
--

DROP TABLE IF EXISTS `mpepu_mp009arvprophylaxisstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp009arvprophylaxisstat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp009arvprophylaxisstat`
--

LOCK TABLES `mpepu_mp009arvprophylaxisstat` WRITE;
/*!40000 ALTER TABLE `mpepu_mp009arvprophylaxisstat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp009arvprophylaxisstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp009reasonmissed`
--

DROP TABLE IF EXISTS `mpepu_mp009reasonmissed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp009reasonmissed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp009reasonmissed`
--

LOCK TABLES `mpepu_mp009reasonmissed` WRITE;
/*!40000 ALTER TABLE `mpepu_mp009reasonmissed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp009reasonmissed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp009reasonstopped`
--

DROP TABLE IF EXISTS `mpepu_mp009reasonstopped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp009reasonstopped` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp009reasonstopped`
--

LOCK TABLES `mpepu_mp009reasonstopped` WRITE;
/*!40000 ALTER TABLE `mpepu_mp009reasonstopped` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp009reasonstopped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp010`
--

DROP TABLE IF EXISTS `mpepu_mp010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp010` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `child_brought` varchar(25) NOT NULL,
  `child_alive` varchar(25) NOT NULL,
  `weight` decimal(2,1) NOT NULL,
  `height` decimal(3,1) NOT NULL,
  `physical_abnormal` varchar(35) DEFAULT NULL,
  `hosp_days` int(11) NOT NULL,
  `diagnosis_code_id` varchar(36) NOT NULL,
  `new_diagnosis` varchar(25) NOT NULL,
  `date_started` date NOT NULL,
  `new_medications` varchar(25) NOT NULL,
  `heart_rate` int(11) NOT NULL,
  `resp_rate` int(11) NOT NULL,
  `temperature` int(11) NOT NULL,
  `new_dx` varchar(25) NOT NULL,
  `new_stage_dx` varchar(25) NOT NULL,
  `child_hospitalized` varchar(25) NOT NULL,
  `reason_hospital_id` int(11) NOT NULL,
  `days_hospitalised` int(11) NOT NULL,
  `new_meds` varchar(25) NOT NULL,
  `vaccinations_id` int(11) NOT NULL,
  `comment` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_mp010_26368181` (`diagnosis_code_id`),
  KEY `mpepu_mp010_78d06caa` (`reason_hospital_id`),
  KEY `mpepu_mp010_41574b6e` (`vaccinations_id`),
  CONSTRAINT `reason_hospital_id_refs_id_237d5125` FOREIGN KEY (`reason_hospital_id`) REFERENCES `mpepu_mp010reasonhospital` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_6c658760` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`),
  CONSTRAINT `vaccinations_id_refs_id_13a4d017` FOREIGN KEY (`vaccinations_id`) REFERENCES `mpepu_mp010vaccinations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp010`
--

LOCK TABLES `mpepu_mp010` WRITE;
/*!40000 ALTER TABLE `mpepu_mp010` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp010` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp010reasonhospital`
--

DROP TABLE IF EXISTS `mpepu_mp010reasonhospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp010reasonhospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp010reasonhospital`
--

LOCK TABLES `mpepu_mp010reasonhospital` WRITE;
/*!40000 ALTER TABLE `mpepu_mp010reasonhospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp010reasonhospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp010vaccinations`
--

DROP TABLE IF EXISTS `mpepu_mp010vaccinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp010vaccinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp010vaccinations`
--

LOCK TABLES `mpepu_mp010vaccinations` WRITE;
/*!40000 ALTER TABLE `mpepu_mp010vaccinations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp010vaccinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp011`
--

DROP TABLE IF EXISTS `mpepu_mp011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp011` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `received_nvp` varchar(25) NOT NULL,
  `taking_nvp` varchar(25) NOT NULL,
  `current_dose` int(11) NOT NULL,
  `date_last_dose` date NOT NULL,
  `bf_occured` varchar(25) NOT NULL,
  `npv_doses_miss` int(11) NOT NULL,
  `tot_miss_doses` int(11) NOT NULL,
  `nvp_days_miss_id` int(11) NOT NULL,
  `miss_dose_days` int(11) NOT NULL,
  `nvp_discont` varchar(25) NOT NULL,
  `reason_discont_id` int(11) NOT NULL,
  `reason_discont_other` varchar(35) DEFAULT NULL,
  `nvp_discont_now` varchar(25) NOT NULL,
  `reason_discont_now_id` int(11) NOT NULL,
  `reason_discont_now_other` varchar(35) DEFAULT NULL,
  `comment` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_mp011_3bb79ea0` (`nvp_days_miss_id`),
  KEY `mpepu_mp011_5f595da3` (`reason_discont_id`),
  KEY `mpepu_mp011_71e416e2` (`reason_discont_now_id`),
  CONSTRAINT `nvp_days_miss_id_refs_id_3d52fc8a` FOREIGN KEY (`nvp_days_miss_id`) REFERENCES `mpepu_mp011maritalstatus` (`id`),
  CONSTRAINT `reason_discont_id_refs_id_25216b56` FOREIGN KEY (`reason_discont_id`) REFERENCES `mpepu_mp011reasondiscontinued` (`id`),
  CONSTRAINT `reason_discont_now_id_refs_id_61731c44` FOREIGN KEY (`reason_discont_now_id`) REFERENCES `mpepu_mp011reasondiscontinuing` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_55874bc3` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp011`
--

LOCK TABLES `mpepu_mp011` WRITE;
/*!40000 ALTER TABLE `mpepu_mp011` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp011` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp011maritalstatus`
--

DROP TABLE IF EXISTS `mpepu_mp011maritalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp011maritalstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp011maritalstatus`
--

LOCK TABLES `mpepu_mp011maritalstatus` WRITE;
/*!40000 ALTER TABLE `mpepu_mp011maritalstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp011maritalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp011nvpdaysmiss`
--

DROP TABLE IF EXISTS `mpepu_mp011nvpdaysmiss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp011nvpdaysmiss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp011nvpdaysmiss`
--

LOCK TABLES `mpepu_mp011nvpdaysmiss` WRITE;
/*!40000 ALTER TABLE `mpepu_mp011nvpdaysmiss` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp011nvpdaysmiss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp011reasondiscontinued`
--

DROP TABLE IF EXISTS `mpepu_mp011reasondiscontinued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp011reasondiscontinued` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp011reasondiscontinued`
--

LOCK TABLES `mpepu_mp011reasondiscontinued` WRITE;
/*!40000 ALTER TABLE `mpepu_mp011reasondiscontinued` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp011reasondiscontinued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp011reasondiscontinuing`
--

DROP TABLE IF EXISTS `mpepu_mp011reasondiscontinuing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp011reasondiscontinuing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp011reasondiscontinuing`
--

LOCK TABLES `mpepu_mp011reasondiscontinuing` WRITE;
/*!40000 ALTER TABLE `mpepu_mp011reasondiscontinuing` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp011reasondiscontinuing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012`
--

DROP TABLE IF EXISTS `mpepu_mp012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `eval_interview` varchar(3) NOT NULL,
  `last_att_sche_visit` date NOT NULL,
  `other_bm` varchar(3) NOT NULL,
  `fm_intro_occur` varchar(3) NOT NULL,
  `fm_date` date NOT NULL,
  `reason_rcv_fm_id` int(11) NOT NULL,
  `reason_rcv_fm_other` varchar(35) DEFAULT NULL,
  `water_use_id` int(11) NOT NULL,
  `formula` varchar(3) NOT NULL,
  `water` varchar(3) NOT NULL,
  `juice` varchar(3) NOT NULL,
  `cow_milk` varchar(3) NOT NULL,
  `cow_milk_yes_id` int(11) NOT NULL,
  `other_milk_animal` date NOT NULL,
  `milk_boiled` varchar(3) NOT NULL,
  `fruits_veg` varchar(3) NOT NULL,
  `cereal_porridge` varchar(3) NOT NULL,
  `solid_liquid` varchar(3) NOT NULL,
  `other_milk` varchar(3) NOT NULL,
  `ever_breastfeed` varchar(3) NOT NULL,
  `complete_weaning` varchar(3) NOT NULL,
  `weaned_72h` varchar(3) NOT NULL,
  `most_recent_bm` date NOT NULL,
  `rcv_bm_id` int(11) NOT NULL,
  `list_comments` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  KEY `mpepu_mp012_229f8417` (`reason_rcv_fm_id`),
  KEY `mpepu_mp012_5961a590` (`water_use_id`),
  KEY `mpepu_mp012_7a2d49bb` (`cow_milk_yes_id`),
  KEY `mpepu_mp012_3797870b` (`rcv_bm_id`),
  CONSTRAINT `cow_milk_yes_id_refs_id_7d8cab3e` FOREIGN KEY (`cow_milk_yes_id`) REFERENCES `mpepu_mp012cowmilk` (`id`),
  CONSTRAINT `rcv_bm_id_refs_id_14b2a46e` FOREIGN KEY (`rcv_bm_id`) REFERENCES `mpepu_mp012rcvbm` (`id`),
  CONSTRAINT `reason_rcv_fm_id_refs_id_26a802e8` FOREIGN KEY (`reason_rcv_fm_id`) REFERENCES `mpepu_mp012reasonrcvfm` (`id`),
  CONSTRAINT `subject_consent_id_refs_id_6fc01002` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`),
  CONSTRAINT `water_use_id_refs_id_8cbbd69` FOREIGN KEY (`water_use_id`) REFERENCES `mpepu_mp012water` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012`
--

LOCK TABLES `mpepu_mp012` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012cowmilk`
--

DROP TABLE IF EXISTS `mpepu_mp012cowmilk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012cowmilk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012cowmilk`
--

LOCK TABLES `mpepu_mp012cowmilk` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012cowmilk` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012cowmilk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012ifyes`
--

DROP TABLE IF EXISTS `mpepu_mp012ifyes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012ifyes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012ifyes`
--

LOCK TABLES `mpepu_mp012ifyes` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012ifyes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012ifyes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012rcvbm`
--

DROP TABLE IF EXISTS `mpepu_mp012rcvbm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012rcvbm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012rcvbm`
--

LOCK TABLES `mpepu_mp012rcvbm` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012rcvbm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012rcvbm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012reasonrcvfm`
--

DROP TABLE IF EXISTS `mpepu_mp012reasonrcvfm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012reasonrcvfm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012reasonrcvfm`
--

LOCK TABLES `mpepu_mp012reasonrcvfm` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012reasonrcvfm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012reasonrcvfm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012signireason`
--

DROP TABLE IF EXISTS `mpepu_mp012signireason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012signireason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012signireason`
--

LOCK TABLES `mpepu_mp012signireason` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012signireason` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012signireason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012water`
--

DROP TABLE IF EXISTS `mpepu_mp012water`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012water` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012water`
--

LOCK TABLES `mpepu_mp012water` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012water` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012water` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp012wateruse`
--

DROP TABLE IF EXISTS `mpepu_mp012wateruse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp012wateruse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `short_name` varchar(250) NOT NULL,
  `display_index` int(11) NOT NULL,
  `field_name` varchar(25) DEFAULT NULL,
  `version` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `short_name` (`short_name`),
  UNIQUE KEY `display_index` (`display_index`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp012wateruse`
--

LOCK TABLES `mpepu_mp012wateruse` WRITE;
/*!40000 ALTER TABLE `mpepu_mp012wateruse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp012wateruse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp013`
--

DROP TABLE IF EXISTS `mpepu_mp013`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp013` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `last_illness` varchar(100) NOT NULL,
  `death_cause` varchar(100) NOT NULL,
  `last_ill_signs` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  CONSTRAINT `subject_consent_id_refs_id_6a4c73f7` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp013`
--

LOCK TABLES `mpepu_mp013` WRITE;
/*!40000 ALTER TABLE `mpepu_mp013` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp013` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_mp014`
--

DROP TABLE IF EXISTS `mpepu_mp014`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_mp014` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `report_datetime` datetime NOT NULL,
  `subject_consent_id` varchar(36) NOT NULL,
  `reportable_events` varchar(100) NOT NULL,
  `source_docs` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_consent_id` (`subject_consent_id`),
  CONSTRAINT `subject_consent_id_refs_id_1742a3bc` FOREIGN KEY (`subject_consent_id`) REFERENCES `mpepu_subjectconsent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_mp014`
--

LOCK TABLES `mpepu_mp014` WRITE;
/*!40000 ALTER TABLE `mpepu_mp014` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_mp014` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_randomization`
--

DROP TABLE IF EXISTS `mpepu_randomization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_randomization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `sid` int(11) NOT NULL,
  `site` varchar(10) NOT NULL,
  `feeding_choice` varchar(2) NOT NULL,
  `haart_status` varchar(10) NOT NULL,
  `rx` varchar(7) NOT NULL,
  `feeding_duration` int(11) NOT NULL,
  `registration_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_randomization`
--

LOCK TABLES `mpepu_randomization` WRITE;
/*!40000 ALTER TABLE `mpepu_randomization` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_randomization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_registeredinfant`
--

DROP TABLE IF EXISTS `mpepu_registeredinfant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_registeredinfant` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `infant_identifier` varchar(25) NOT NULL,
  `registration_datetime` datetime NOT NULL,
  `randomization_id` int(11) NOT NULL,
  `registered_mother_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `infant_identifier` (`infant_identifier`),
  UNIQUE KEY `randomization_id` (`randomization_id`),
  KEY `mpepu_registeredinfant_61e12f9f` (`registered_mother_id`),
  CONSTRAINT `randomization_id_refs_id_36d97145` FOREIGN KEY (`randomization_id`) REFERENCES `mpepu_randomization` (`id`),
  CONSTRAINT `registered_mother_id_refs_id_7c097610` FOREIGN KEY (`registered_mother_id`) REFERENCES `mpepu_registeredmother` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_registeredinfant`
--

LOCK TABLES `mpepu_registeredinfant` WRITE;
/*!40000 ALTER TABLE `mpepu_registeredinfant` DISABLE KEYS */;
/*!40000 ALTER TABLE `mpepu_registeredinfant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_registeredmother`
--

DROP TABLE IF EXISTS `mpepu_registeredmother`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_registeredmother` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `subject_consent_id` varchar(100) DEFAULT NULL,
  `subject_identifier` varchar(25) DEFAULT NULL,
  `first_name` varchar(250) NOT NULL,
  `initials` varchar(3) NOT NULL,
  `registration_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_registeredmother`
--

LOCK TABLES `mpepu_registeredmother` WRITE;
/*!40000 ALTER TABLE `mpepu_registeredmother` DISABLE KEYS */;
INSERT INTO `mpepu_registeredmother` VALUES ('2011-01-19 20:21:01','2011-01-19 20:21:01','erikvw','','s100','s100','de903bb6-23f8-11e0-9ed9-001d72b88a3a','ab297620-23f8-11e0-9ed9-001d72b88a3a','056-1100126-5','MARTHA','ML','2011-01-19 20:21:01');
/*!40000 ALTER TABLE `mpepu_registeredmother` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mpepu_subjectconsent`
--

DROP TABLE IF EXISTS `mpepu_subjectconsent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mpepu_subjectconsent` (
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_created` varchar(250) NOT NULL,
  `user_modified` varchar(250) NOT NULL,
  `hostname_created` varchar(50) NOT NULL,
  `hostname_modified` varchar(50) NOT NULL,
  `id` varchar(36) NOT NULL,
  `subject_identifier` varchar(25) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `omang` varchar(250) NOT NULL,
  `initials` varchar(3) NOT NULL,
  `consent_datetime` datetime NOT NULL,
  `may_store_samples` varchar(3) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `is_dob_estimated` varchar(25) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `site` int(11) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject_identifier` (`subject_identifier`),
  UNIQUE KEY `omang` (`omang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mpepu_subjectconsent`
--

LOCK TABLES `mpepu_subjectconsent` WRITE;
/*!40000 ALTER TABLE `mpepu_subjectconsent` DISABLE KEYS */;
INSERT INTO `mpepu_subjectconsent` VALUES ('2011-01-19 20:19:35','2011-01-19 20:19:35','erikvw','erikvw','s100','s100','ab297620-23f8-11e0-9ed9-001d72b88a3a','056-1100126-5','MARTHA','LUDWIG','234234234','ML','2011-01-19 20:19:23','Yes','F','-','',1,'1953-01-19');
/*!40000 ALTER TABLE `mpepu_subjectconsent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-19 22:18:20
