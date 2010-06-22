-- MySQL dump 10.11
--
-- Host: localhost    Database: cacti
-- ------------------------------------------------------
-- Server version	5.0.68

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
-- Table structure for table `cdef`
--

DROP TABLE IF EXISTS `cdef`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cdef` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cdef`
--

LOCK TABLES `cdef` WRITE;
/*!40000 ALTER TABLE `cdef` DISABLE KEYS */;
INSERT INTO `cdef` VALUES (3,'3d352eed9fa8f7b2791205b3273708c7','Make Stack Negative'),(4,'e961cc8ec04fda6ed4981cf5ad501aa5','Make Per 5 Minutes'),(12,'f1ac79f05f255c02f914c920f1038c54','Total All Data Sources'),(2,'73f95f8b77b5508157d64047342c421e','Turn Bytes into Bits'),(14,'634a23af5e78af0964e8d33b1a4ed26b','Multiply by 1024'),(15,'068984b5ccdfd2048869efae5166f722','Total All Data Sources, Multiply by 1024'),(16,'44b1a38ad2c55531a2dc0cf668fd3681','Minus 1'),(17,'562a31fc8370bc5607e3252c7a69695a','By Percentage'),(18,'07d573a5b60c6b1acb4bd98805c8aed9','Divide by 1024'),(19,'5591cb158726d3cf97c5eb136a4e37d6','1000 minus DS'),(20,'03dcbf486b7250be9737720e3d9bf076','Apache - Calculate Bytes / Request'),(21,'23f031762605be1be0b97ebbe9672b8f','Apache - Clean value for DEF a'),(22,'2d55210f8e6e5a17db479b1d48cf06d6','Apache - Clean value for DEF b'),(23,'562ed094d445988e6d6a7e199b84204d','Apache - Limit output to zero min and max'),(24,'d93920f15a5e018e6c112b45f196cc94','Apache - A plus B'),(25,'288c17031852907f2c3b03d40b5996ad','Apache - Calculate A as % of C'),(26,'8e6b7e9acf4ea6a34e4dedc92e9a41d6','Apache - Calculate B as % of C'),(27,'ee0c7a8db4d87389d7955b7f5bc7e1b5','Trend');
/*!40000 ALTER TABLE `cdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdef_items`
--

DROP TABLE IF EXISTS `cdef_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cdef_items` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `cdef_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(2) NOT NULL default '0',
  `value` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `cdef_id` (`cdef_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cdef_items`
--

LOCK TABLES `cdef_items` WRITE;
/*!40000 ALTER TABLE `cdef_items` DISABLE KEYS */;
INSERT INTO `cdef_items` VALUES (7,'9bbf6b792507bb9bb17d2af0970f9be9',2,1,4,'CURRENT_DATA_SOURCE'),(9,'a4b8eb2c3bf4920a3ef571a7a004be53',2,2,6,'8'),(8,'caa4e023ac2d7b1c4b4c8c4adfd55dfe',2,3,2,'3'),(10,'c888c9fe6b62c26c4bfe23e18991731d',3,1,4,'CURRENT_DATA_SOURCE'),(11,'1e1d0b29a94e08b648c8f053715442a0',3,3,2,'3'),(12,'4355c197998c7f8b285be7821ddc6da4',3,2,6,'-1'),(13,'40bb7a1143b0f2e2efca14eb356236de',4,1,4,'CURRENT_DATA_SOURCE'),(14,'42686ea0925c0220924b7d333599cd67',4,3,2,'3'),(15,'faf1b148b2c0e0527362ed5b8ca1d351',4,2,6,'300'),(16,'0ef6b8a42dc83b4e43e437960fccd2ea',12,1,4,'ALL_DATA_SOURCES_NODUPS'),(18,'86370cfa0008fe8c56b28be80ee39a40',14,1,4,'CURRENT_DATA_SOURCE'),(19,'9a35cc60d47691af37f6fddf02064e20',14,2,6,'1024'),(20,'5d7a7941ec0440b257e5598a27dd1688',14,3,2,'3'),(21,'44fd595c60539ff0f5817731d9f43a85',15,1,4,'ALL_DATA_SOURCES_NODUPS'),(22,'aa38be265e5ac31783e57ce6f9314e9a',15,2,6,'1024'),(23,'204423d4b2598f1f7252eea19458345c',15,3,2,'3'),(24,'f832f9315bfe3024e883d58e65e78a4a',16,1,4,'CURRENT_DATA_SOURCE'),(25,'6bbdf4b0d75cb11e1eed51543ee958f8',16,2,6,'1'),(26,'e58fecd6539d4e50c1a977c560ad6fb5',16,3,2,'2'),(27,'bf02ceaf54ea6b19b9c0c78c52a00cc0',17,1,6,'b'),(28,'06694ba0dbcb5c28fb15941c7eb3923b',17,2,6,'a'),(29,'a5ef727174f75f3ad938628fd2a0b4f3',17,3,2,'4'),(30,'9d85ef16967e9a4c835509ffc5f3b6ba',17,4,6,'100'),(31,'0b7dd22264f08db59f8c0db78c2b56ef',17,5,2,'3'),(32,'decf6b6a55b29b6de42abb35201ff979',18,1,4,'CURRENT_DATA_SOURCE'),(33,'9e1f3e43afb611346231a3670b7b975b',18,2,6,'1024'),(34,'9e316a1af8c3da3c6028d47f9761d3ef',18,3,2,'4'),(35,'e44cbf0fb4b9f21ca69f4b8793d67dae',19,1,6,'1000'),(36,'7be69cf3ce82d246fa41d8c66f847f59',19,2,4,'CURRENT_DATA_SOURCE'),(37,'3f730cc029cdb35121796cd8df988f0d',19,3,2,'2'),(38,'cb0f7bcef79f91c202f60a0eedba020a',20,1,6,'cdefb,0,EQ,0,cdefa,1024,*,cdefb,/,IF'),(39,'95d9de2c812b286e795c3fb305e0a1e5',20,2,6,'0,1000000,LIMIT'),(40,'b4398e3eeadedabbff9e9ff0cb821a2a',21,1,6,'a,UN,0,a,100000,GT,0,a,IF,IF'),(41,'b35e926c49cda8e034cbd66fc8b561bd',22,1,6,'b,UN,0,b,100000,GT,0,b,IF,IF'),(42,'8d0a50b319631bbbb4389e93c2fb45ec',23,1,6,'CURRENT_DATA_SOURCE,0,0,LIMIT'),(43,'7739411885778eab29be7de14d38870d',24,1,6,'cdefa,cdefb,+'),(44,'428b310439e29a7a936a186d5dbb8a0b',25,1,6,'cdefc,0,EQ,0,cdefa,100,*,cdefc,/,IF'),(45,'9e85271c07c2e7b120a9b52b4dad50a5',25,2,6,'0,110,LIMIT'),(46,'c17568a0caf5f3afa1e9f4a781d78407',26,1,6,'cdefc,0,EQ,0,cdefb,100,*,cdefc,/,IF'),(47,'f463bbc0bc0cddb7bccafa2a3ae32e5f',26,2,6,'0,110,LIMIT'),(48,'88424e20bbd7038ec89995e9821012fe',27,1,4,'CURRENT_DATA_SOURCE'),(49,'ec07bce934d5c01c828c6df62b0f331b',27,2,6,'1800'),(50,'cc9a478dcb35540cc1d8e3b69f89d671',27,3,6,'TREND');
/*!40000 ALTER TABLE `cdef_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `colors` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hex` varchar(6) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'000000'),(2,'FFFFFF'),(4,'FAFD9E'),(5,'C0C0C0'),(6,'74C366'),(7,'6DC8FE'),(8,'EA8F00'),(9,'FF0000'),(10,'4444FF'),(11,'FF00FF'),(12,'00FF00'),(13,'8D85F3'),(14,'AD3B6E'),(15,'EACC00'),(16,'12B3B5'),(17,'157419'),(18,'C4FD3D'),(19,'817C4E'),(20,'002A97'),(21,'0000FF'),(22,'00CF00'),(24,'F9FD5F'),(25,'FFF200'),(26,'CCBB00'),(27,'837C04'),(28,'EAAF00'),(29,'FFD660'),(30,'FFC73B'),(31,'FFAB00'),(33,'FF7D00'),(34,'ED7600'),(35,'FF5700'),(36,'EE5019'),(37,'B1441E'),(38,'FFC3C0'),(39,'FF897C'),(40,'FF6044'),(41,'FF4105'),(42,'DA4725'),(43,'942D0C'),(44,'FF3932'),(45,'862F2F'),(46,'FF5576'),(47,'562B29'),(48,'F51D30'),(49,'DE0056'),(50,'ED5394'),(51,'B90054'),(52,'8F005C'),(53,'F24AC8'),(54,'E8CDEF'),(55,'D8ACE0'),(56,'A150AA'),(57,'750F7D'),(58,'8D00BA'),(59,'623465'),(60,'55009D'),(61,'3D168B'),(62,'311F4E'),(63,'D2D8F9'),(64,'9FA4EE'),(65,'6557D0'),(66,'4123A1'),(67,'4668E4'),(68,'0D006A'),(69,'00004D'),(70,'001D61'),(71,'00234B'),(72,'002A8F'),(73,'2175D9'),(74,'7CB3F1'),(75,'005199'),(76,'004359'),(77,'00A0C1'),(78,'007283'),(79,'00BED9'),(80,'AFECED'),(81,'55D6D3'),(82,'00BBB4'),(83,'009485'),(84,'005D57'),(85,'008A77'),(86,'008A6D'),(87,'00B99B'),(88,'009F67'),(89,'00694A'),(90,'00A348'),(91,'00BF47'),(92,'96E78A'),(93,'00BD27'),(94,'35962B'),(95,'7EE600'),(96,'6EA100'),(97,'CAF100'),(98,'F5F800'),(99,'CDCFC4'),(100,'BCBEB3'),(101,'AAABA1'),(102,'8F9286'),(103,'797C6E'),(104,'2E3127'),(105,'00aa00'),(106,'FF5F00'),(107,'FFFF00');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input`
--

DROP TABLE IF EXISTS `data_input`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_input` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `name` varchar(200) NOT NULL default '',
  `input_string` varchar(255) default NULL,
  `type_id` tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_input`
--

LOCK TABLES `data_input` WRITE;
/*!40000 ALTER TABLE `data_input` DISABLE KEYS */;
INSERT INTO `data_input` VALUES (1,'3eb92bb845b9660a7445cf9740726522','Get SNMP Data','',2),(2,'bf566c869ac6443b0c75d1c32b5a350e','Get SNMP Data (Indexed)','',3),(3,'274f4685461170b9eb1b98d22567ab5e','Unix - Get Free Disk Space','<path_cacti>/scripts/diskfree.sh <partition>',1),(4,'95ed0993eb3095f9920d431ac80f4231','Unix - Get Load Average','/usr/bin/perl <path_cacti>/scripts/loadavg_multi.pl',1),(5,'79a284e136bb6b061c6f96ec219ac448','Unix - Get Logged In Users','/usr/bin/perl <path_cacti>/scripts/unix_users.pl <username>',1),(6,'362e6d4768937c4f899dd21b91ef0ff8','Linux - Get Memory Usage','/usr/bin/perl <path_cacti>/scripts/linux_memory.pl <grepstr>',1),(7,'a637359e0a4287ba43048a5fdf202066','Unix - Get System Processes','/usr/bin/perl <path_cacti>/scripts/unix_processes.pl',1),(8,'47d6bfe8be57a45171afd678920bd399','Unix - Get TCP Connections','/usr/bin/perl <path_cacti>/scripts/unix_tcp_connections.pl <grepstr>',1),(9,'cc948e4de13f32b6aea45abaadd287a3','Unix - Get Web Hits','/usr/bin/perl <path_cacti>/scripts/webhits.pl <log_path>',1),(10,'8bd153aeb06e3ff89efc73f35849a7a0','Unix - Ping Host','/usr/bin/perl <path_cacti>/scripts/ping.pl <ip>',1),(11,'80e9e4c4191a5da189ae26d0e237f015','Get Script Data (Indexed)','',4),(12,'332111d8b54ac8ce939af87a7eac0c06','Get Script Server Data (Indexed)','',6),(13,'4b7c41aef3c9c7b7cd457c373cfac84d','Local - Poller Statistics','<path_cacti>/scripts/ss_poller.php ss_poller',5),(14,'bf254919c41c22573b7791015f4e7364','Localhost - Syslog Messages','/usr/bin/php -q <path_cacti>/plugins/syslog/syslog_counter.php',1),(15,'b555ff5eb803a050cfc8578178e0722c','teMySQL - Replication','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tereplication <hostname> <username> <password>',1),(16,'26a6edcc5360ce922c7f856c0c428677','teMySQL - Volatile Queries','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tevolatilequery <hostname> <username> <password>',1),(17,'94718b15732230fcfcf75e57e9189202','teMySQL - Volatile Handler','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tevolatilehandler <hostname> <username> <password>',1),(18,'df90bcc28b0fcbd6b2d266943d2a39ca','teMySQL - Select Queries','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php teselectquery <hostname> <username> <password>',1),(19,'ca19b62ad13be9fe4b5cbe79b7a816de','teMySQL - Select Handler','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php teselecthandler <hostname> <username> <password>',1),(20,'d4666a1b9fe8d586f3e9c11cfb6d6252','teMySQL - Index Usage','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php teindexusage <hostname> <username> <password>',1),(21,'6c8a5fa1bf14c3b2fe6dad908da0b5c7','teMySQL - Query Cache','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tequerycache <hostname> <username> <password>',1),(22,'3ad87aa11226abc5a391eaba532cf274','teMySQL - Network Usage','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tenetwork <hostname> <username> <password>',1),(23,'db35361003c2ee35dc638bb9f758e6dc','teMySQL - Sorts','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tesorts <hostname> <username> <password>',1),(24,'7d9c35fac4215cd2b46a39ec59ee6d7f','teMySQL - Locking and Slow','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php telockingandslow <hostname> <username> <password>',1),(25,'111bfab5b6b237b0b2ef9b1b21d136d8','teMySQL - Temporary Objects','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tetempobjects <hostname> <username> <password>',1),(26,'55b5cf2ebe44814fa6a17b45bb86be42','teMySQL - Threads/Abends','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php tethreadsabends <hostname> <username> <password>',1),(27,'863954df2762fa6a3dd443e7434dc245','MySQL - Command statistics','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php command <hostname> <username> <password>',1),(28,'f59964d2b1649f28cdacffd68b68b469','MySQL - Handler statistics','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php handler <hostname> <username> <password>',1),(29,'39f137b87b354c0b09e000c16179a44b','teMySQL - InnoDB Row Operations','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php innodb <hostname> <username> <password>',1),(30,'f7adf1ac3929095b2ff2447b3731e734','teMySQL - InnoDB Buffers','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php innodb <hostname> <username> <password>',1),(31,'75e1892753867ac2079a93aff96f76a0','teMySQL - InnoDB Locks','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php innodb <hostname> <username> <password>',1),(32,'960f0377a341e0ab45ba7a5a2f76cc5f','teMySQL - InnoDB File I/O','<path_php_binary> -q <path_cacti>/scripts/mysql_stats.php innodb <hostname> <username> <password>',1),(33,'a2807028d1974e0e6e358b44b0ec48df','memcached - Extended Stats','<path_php_binary> -q <path_cacti>/scripts/dumpMemcachedStats.php <hostname>',1),(34,'26978444a1291c4f42194d85e6b01a2e','HTTP Response Time','perl <path_cacti>/scripts/http_response_time.pl <ip>',1),(35,'25882fa63f317beb122b458b2dcac511','TCP Reponse Time','perl <path_cacti>/scripts/tcp_response_time.pl <ip> <port>',1),(36,'affee612f49db3cb014c570c184eddc2','Unix - Multi Ping Host','perl <path_cacti>/scripts/multi_ping.pl',1),(37,'96733f93159b81f457a66741a96c8e33','HTTP Response Time nrpe','perl <path_cacti>/scripts/nrpe_http.pl <ip>',1),(38,'7895295416dd39117e9d688c09e01c7c','WebServer - Apache Statistics','/usr/bin/perl <path_cacti>/scripts/ws_apachestats.pl <hostname>',1);
/*!40000 ALTER TABLE `data_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input_data`
--

DROP TABLE IF EXISTS `data_input_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_input_data` (
  `data_input_field_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_data_id` mediumint(8) unsigned NOT NULL default '0',
  `t_value` char(2) default NULL,
  `value` text,
  PRIMARY KEY  (`data_input_field_id`,`data_template_data_id`),
  KEY `t_value` (`t_value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_input_data`
--

LOCK TABLES `data_input_data` WRITE;
/*!40000 ALTER TABLE `data_input_data` DISABLE KEYS */;
INSERT INTO `data_input_data` VALUES (14,1,'on',''),(13,1,'on',''),(12,1,'on',''),(14,2,'on',''),(13,2,'on',''),(12,2,'on',''),(14,3,'on',''),(13,3,'on',''),(12,3,'on',''),(1,4,'',''),(1,5,'',''),(1,6,'',''),(14,7,'on',''),(13,7,'on',''),(12,7,'on',''),(14,8,'on',''),(13,8,'on',''),(12,8,'on',''),(14,9,'on',''),(13,9,'on',''),(12,9,'on',''),(14,10,'on',''),(13,10,'on',''),(12,10,'on',''),(22,12,'','Buffers:'),(22,13,'','MemFree:'),(22,14,'','^Cached:'),(22,15,'','SwapFree:'),(29,18,'',''),(1,19,'',''),(2,19,'',''),(6,21,'','.1.3.6.1.2.1.25.3.3.1.2.1'),(1,27,'',''),(6,28,'','.1.3.6.1.4.1.9.9.109.1.1.1.1.3.1'),(6,29,'','.1.3.6.1.4.1.9.9.109.1.1.1.1.4.1'),(1,30,'',''),(1,31,'',''),(1,32,'',''),(1,33,'',''),(1,34,'',''),(14,35,'on',''),(13,35,'on',''),(12,35,'on',''),(14,36,'on',''),(13,36,'on',''),(12,36,'on',''),(1,22,'',''),(1,23,'',''),(1,24,'',''),(1,25,'',''),(1,26,'',''),(33,37,'on',''),(32,37,'on',''),(31,37,'on',''),(14,38,'on',''),(13,38,'on',''),(12,38,'on',''),(14,39,'on',''),(13,39,'on',''),(12,39,'on',''),(14,40,'on',''),(13,40,'on',''),(12,40,'on',''),(14,41,'on',''),(13,41,'on',''),(12,41,'on',''),(14,55,'on',''),(13,55,'on',''),(12,55,'on',''),(37,56,'on',''),(36,56,'on',''),(35,56,'on',''),(37,57,'on',''),(36,57,'on',''),(35,57,'on',''),(1,58,'',''),(1,59,'',''),(1,20,'',''),(5,6,'',''),(22,102,'','MemFree:'),(4,6,'',''),(3,6,'',''),(2,6,'',''),(6,69,'on',''),(1,68,'',''),(2,68,'',''),(6,6,'','.1.3.6.1.4.1.2021.11.51.0'),(2,27,'',''),(3,27,'',''),(4,27,'',''),(5,27,'',''),(6,27,'','.1.3.6.1.4.1.9.2.1.58.0'),(2,59,'',''),(3,59,'',''),(4,59,'',''),(5,59,'',''),(6,59,'','.1.3.6.1.2.1.25.1.5.0'),(2,58,'',''),(3,58,'',''),(4,58,'',''),(5,58,'',''),(6,58,'','.1.3.6.1.2.1.25.1.6.0'),(2,24,'',''),(3,24,'',''),(4,24,'',''),(5,24,'',''),(6,24,'','.1.3.6.1.4.1.23.2.28.2.5.0'),(2,25,'',''),(3,25,'',''),(4,25,'',''),(5,25,'',''),(6,25,'','.1.3.6.1.4.1.23.2.28.2.6.0'),(2,22,'',''),(3,22,'',''),(4,22,'',''),(5,22,'',''),(6,22,'','.1.3.6.1.4.1.23.2.28.2.1.0'),(2,23,'',''),(3,23,'',''),(4,23,'',''),(5,23,'',''),(6,23,'','.1.3.6.1.4.1.23.2.28.2.2.0'),(2,26,'',''),(3,26,'',''),(4,26,'',''),(5,26,'',''),(6,26,'','.1.3.6.1.4.1.23.2.28.2.7.0'),(2,20,'',''),(3,20,'',''),(4,20,'',''),(5,20,'',''),(6,20,'','.1.3.6.1.4.1.23.2.28.3.2.0'),(3,19,'',''),(4,19,'',''),(5,19,'',''),(6,19,'','.1.3.6.1.4.1.23.2.28.3.1'),(2,4,'',''),(3,4,'',''),(4,4,'',''),(5,4,'',''),(6,4,'','.1.3.6.1.4.1.2021.11.52.0'),(2,5,'',''),(3,5,'',''),(4,5,'',''),(5,5,'',''),(6,5,'','.1.3.6.1.4.1.2021.11.50.0'),(2,30,'',''),(3,30,'',''),(4,30,'',''),(5,30,'',''),(6,30,'','.1.3.6.1.4.1.2021.10.1.3.1'),(2,32,'',''),(3,32,'',''),(4,32,'',''),(5,32,'',''),(6,32,'','.1.3.6.1.4.1.2021.10.1.3.3'),(2,31,'',''),(3,31,'',''),(4,31,'',''),(5,31,'',''),(6,31,'','.1.3.6.1.4.1.2021.10.1.3.2'),(2,33,'',''),(3,33,'',''),(4,33,'',''),(5,33,'',''),(6,33,'','.1.3.6.1.4.1.2021.4.14.0'),(3,68,'',''),(4,68,'',''),(5,68,'',''),(6,68,'','.1.3.6.1.4.1.2021.4.15.0'),(2,34,'',''),(3,34,'',''),(4,34,'',''),(5,34,'',''),(6,34,'','.1.3.6.1.4.1.2021.4.6.0'),(20,17,'',''),(22,103,'','SwapFree:'),(35,71,'on',''),(36,71,'on',''),(37,71,'on',''),(6,75,'','.1.3.6.1.4.1.3076.2.1.2.17.1.7.0'),(5,75,'',''),(4,75,'',''),(1,75,'',''),(2,75,'',''),(3,75,'',''),(6,76,'','.1.3.6.1.4.1.3076.2.1.2.17.1.8.0'),(5,76,'',''),(4,76,'',''),(3,76,'',''),(2,76,'',''),(1,76,'',''),(6,77,'','.1.3.6.1.4.1.3076.2.1.2.17.1.9.0'),(5,77,'',''),(4,77,'',''),(3,77,'',''),(2,77,'',''),(1,77,'',''),(6,78,'','.1.3.6.1.4.1.3076.2.1.2.17.1.1.0'),(5,78,'',''),(4,78,'',''),(3,78,'',''),(2,78,'',''),(1,78,'',''),(6,79,'','.1.3.6.1.4.1.311.1.7.3.1.2.0'),(5,79,'',''),(4,79,'',''),(3,79,'',''),(2,79,'',''),(1,79,'',''),(6,80,'','.1.3.6.1.4.1.311.1.7.3.1.4.0'),(5,80,'',''),(4,80,'',''),(3,80,'',''),(2,80,'',''),(1,80,'',''),(6,81,'','.1.3.6.1.4.1.9.9.273.1.1.2.1.1.1'),(4,81,'',''),(3,81,'',''),(2,81,'',''),(1,81,'',''),(5,81,'',''),(1,82,'',''),(6,82,'','.1.3.6.1.4.1.9.9.109.1.1.1.1.4.9'),(5,82,'',''),(4,82,'',''),(3,82,'',''),(2,82,'',''),(5,83,'',''),(4,83,'',''),(3,83,'',''),(2,83,'',''),(1,83,'',''),(6,83,'','.1.3.6.1.4.1.9.9.109.1.1.1.1.5.9'),(6,84,'','.1.3.6.1.4.1.9.9.109.1.1.1.1.3.9'),(5,84,'',''),(4,84,'',''),(3,84,'',''),(2,84,'',''),(1,84,'',''),(6,85,'','.1.3.6.1.4.1.9.5.1.1.8.0'),(5,85,'',''),(4,85,'',''),(3,85,'',''),(2,85,'',''),(1,85,'',''),(1,86,'',''),(2,86,'',''),(3,86,'',''),(4,86,'',''),(5,86,'',''),(6,86,'','.1.3.6.1.4.1.9.9.48.1.1.1.5.1'),(6,87,'','1.3.6.1.4.1.9.9.48.1.1.1.6.2'),(6,88,'','1.3.6.1.4.1.9.9.48.1.1.1.6.1'),(6,89,'','.1.3.6.1.4.1.3076.2.1.2.25.1.2.0'),(6,90,'','.1.3.6.1.4.1.3076.2.1.2.22.1.33.0'),(6,91,'','.1.3.6.1.4.1.3076.2.1.2.17.1.1.0'),(6,92,'','.1.3.6.1.4.1.3076.2.1.2.17.1.6.0'),(20,107,'',''),(235,488,'',''),(29,487,NULL,'10.32.18.97'),(20,486,'',''),(31,484,'',''),(33,484,'',''),(49,483,NULL,'161'),(49,482,NULL,'161'),(49,481,NULL,'161'),(6,483,'','.1.3.6.1.4.1.2021.4.6.0'),(5,483,NULL,'1'),(4,483,NULL,''),(3,483,NULL,''),(2,483,NULL,'public'),(1,483,NULL,'10.32.18.97'),(6,482,'','.1.3.6.1.4.1.2021.4.15.0'),(5,482,NULL,'1'),(32,484,'',''),(3,482,NULL,''),(4,482,NULL,''),(1,482,NULL,'10.32.18.97'),(2,482,NULL,'public'),(6,481,'','.1.3.6.1.4.1.2021.4.14.0'),(5,481,NULL,'1'),(4,481,NULL,''),(3,481,NULL,''),(2,481,NULL,'public'),(1,481,NULL,'10.32.18.97'),(49,480,NULL,'161'),(49,479,NULL,'161'),(49,478,NULL,'161'),(6,480,'','.1.3.6.1.4.1.2021.10.1.3.2'),(5,480,NULL,'1'),(4,480,NULL,''),(3,480,NULL,''),(2,480,NULL,'public'),(1,480,NULL,'10.32.18.97'),(6,479,'','.1.3.6.1.4.1.2021.10.1.3.3'),(5,479,NULL,'1'),(4,479,NULL,''),(3,479,NULL,''),(2,479,NULL,'public'),(1,479,NULL,'10.32.18.97'),(6,478,'','.1.3.6.1.4.1.2021.10.1.3.1'),(5,478,NULL,'1'),(4,478,NULL,''),(3,478,NULL,''),(2,478,NULL,'public'),(1,478,NULL,'10.32.18.97'),(48,477,NULL,'161'),(11,477,NULL,'1'),(10,477,NULL,''),(9,477,NULL,''),(8,477,NULL,'public'),(7,477,NULL,'10.32.18.97'),(12,477,'',''),(13,477,'',''),(14,477,'',''),(22,476,'','SwapFree:'),(22,475,'','MemFree:'),(49,473,NULL,'161'),(49,472,NULL,'161'),(49,471,NULL,'161'),(6,473,'','.1.3.6.1.4.1.2021.11.50.0'),(5,473,NULL,'1'),(4,473,NULL,''),(3,473,NULL,''),(2,473,NULL,'public'),(1,473,NULL,'10.32.18.97'),(6,472,'','.1.3.6.1.4.1.2021.11.52.0'),(5,472,NULL,'1'),(4,472,NULL,''),(3,472,NULL,''),(2,472,NULL,'public'),(1,472,NULL,'10.32.18.97'),(6,471,'','.1.3.6.1.4.1.2021.11.51.0'),(2,471,NULL,'public'),(3,471,NULL,''),(4,471,NULL,''),(5,471,NULL,'1'),(1,471,NULL,'10.32.18.97'),(29,470,NULL,'172.31.250.6'),(29,469,NULL,'172.16.254.111'),(29,468,NULL,'172.16.254.69'),(29,467,NULL,'172.25.129.253'),(29,466,NULL,'172.31.250.140'),(29,465,NULL,'172.25.0.120'),(29,464,NULL,'172.16.63.1'),(29,463,NULL,'172.16.66.1'),(29,462,NULL,'172.16.64.5'),(29,461,NULL,'172.16.61.5'),(29,460,NULL,'172.16.62.2'),(29,459,NULL,'10.125.127.1'),(29,458,NULL,'10.125.127.2'),(29,457,NULL,'10.125.127.4'),(20,456,'',''),(20,454,'',''),(29,450,NULL,'10.32.18.190'),(29,449,NULL,'172.22.44.251'),(29,448,NULL,'172.22.4.3'),(29,447,NULL,'172.22.64.5'),(29,446,NULL,'172.16.201.39'),(29,445,NULL,'10.12.12.81'),(29,443,NULL,'10.12.12.18'),(29,442,NULL,'10.12.12.115'),(29,444,NULL,'10.12.12.97'),(29,440,NULL,'10.12.12.49'),(29,439,NULL,'10.12.12.33'),(29,437,NULL,'172.29.18.147'),(29,436,NULL,'172.16.254.5'),(29,434,NULL,'172.29.21.2'),(29,433,NULL,'172.29.20.15'),(29,432,NULL,'172.16.253.12'),(29,431,NULL,'172.29.16.222'),(29,430,NULL,'172.29.22.2'),(57,423,NULL,'172.16.203.11'),(58,423,'','radspeedy2'),(59,423,'','telkomspeedy2'),(66,422,NULL,'172.16.203.11'),(67,422,'','radspeedy2'),(68,422,'','telkomspeedy2'),(139,421,NULL,'172.16.203.11'),(140,421,'','radspeedy2'),(141,421,'','telkomspeedy2'),(133,420,NULL,'172.16.203.11'),(134,420,'','radspeedy2'),(135,420,'','telkomspeedy2'),(119,419,NULL,'172.16.203.11'),(120,419,'','radspeedy2'),(121,419,'','telkomspeedy2'),(75,418,NULL,'172.16.203.11'),(76,418,'','radspeedy2'),(77,418,'','telkomspeedy2'),(84,417,NULL,'172.16.203.11'),(85,417,'','radspeedy2'),(86,417,'','telkomspeedy2'),(50,416,NULL,'172.16.203.11'),(51,416,'','radspeedy2'),(52,416,'','telkomspeedy2'),(100,415,NULL,'172.16.203.11'),(101,415,'','radspeedy2'),(102,415,'','telkomspeedy2'),(156,414,NULL,'172.16.203.11'),(157,414,'','radspeedy2'),(158,414,'','telkomspeedy2'),(148,413,NULL,'172.16.203.11'),(149,413,'','radspeedy2'),(150,413,'','telkomspeedy2'),(111,412,NULL,'172.16.203.11'),(112,412,'','radspeedy2'),(113,412,'','telkomspeedy2'),(126,411,NULL,'172.16.203.11'),(127,411,'','radspeedy2'),(129,411,'','telkomspeedy2'),(49,410,NULL,'161'),(49,409,NULL,'161'),(49,408,NULL,'161'),(1,410,NULL,'172.16.203.11'),(2,410,NULL,'public'),(3,410,NULL,''),(4,410,NULL,''),(5,410,NULL,'1'),(6,410,'','.1.3.6.1.4.1.2021.10.1.3.2'),(1,409,NULL,'172.16.203.11'),(2,409,NULL,'public'),(3,409,NULL,''),(4,409,NULL,''),(5,409,NULL,'1'),(6,409,'','.1.3.6.1.4.1.2021.10.1.3.3'),(1,408,NULL,'172.16.203.11'),(2,408,NULL,'public'),(3,408,NULL,''),(4,408,NULL,''),(5,408,NULL,'1'),(6,408,'','.1.3.6.1.4.1.2021.10.1.3.1'),(168,407,NULL,'172.16.203.11'),(169,407,'','radspeedy2'),(170,407,'','telkomspeedy2'),(186,406,NULL,'172.16.203.11'),(187,406,'','radspeedy2'),(188,406,'','telkomspeedy2'),(175,405,NULL,'172.16.203.11'),(176,405,'','radspeedy2'),(177,405,'','telkomspeedy2'),(194,404,'','radspeedy2'),(195,404,'','telkomspeedy2'),(198,404,NULL,'172.16.203.11'),(175,403,NULL,'172.16.203.11'),(176,403,'','radspeedy2'),(177,403,'','telkomspeedy2'),(93,402,NULL,'172.16.203.11'),(94,402,'','radspeedy2'),(95,402,'','telkomspeedy2'),(49,401,NULL,'161'),(49,400,NULL,'161'),(49,399,NULL,'161'),(6,401,'','.1.3.6.1.4.1.2021.11.50.0'),(5,401,NULL,'1'),(4,401,NULL,''),(3,401,NULL,''),(2,401,NULL,'public'),(1,401,NULL,'172.16.203.11'),(6,400,'','.1.3.6.1.4.1.2021.11.52.0'),(5,400,NULL,'1'),(4,400,NULL,''),(3,400,NULL,''),(2,400,NULL,'public'),(1,400,NULL,'172.16.203.11'),(6,399,'','.1.3.6.1.4.1.2021.11.51.0'),(2,399,NULL,'public'),(3,399,NULL,''),(4,399,NULL,''),(5,399,NULL,'1'),(1,399,NULL,'172.16.203.11'),(229,388,'on',''),(48,386,NULL,'161'),(11,386,NULL,'1'),(10,386,NULL,''),(9,386,NULL,''),(8,386,NULL,'public'),(7,386,NULL,'172.16.203.11'),(12,386,'','ifDescr'),(13,386,'','sit0'),(14,386,'','13'),(48,385,NULL,'161'),(11,385,NULL,'1'),(10,385,NULL,''),(9,385,NULL,''),(8,385,NULL,'public'),(7,385,NULL,'172.16.203.11'),(12,385,'','ifDescr'),(13,385,'','lo'),(14,385,'','13'),(57,384,NULL,'os3.divre2.telkom.co.id'),(58,384,'','os3'),(59,384,'','telkombaru'),(66,383,NULL,'os3.divre2.telkom.co.id'),(67,383,'','os3'),(68,383,'','telkombaru'),(139,382,NULL,'os3.divre2.telkom.co.id'),(140,382,'','os3'),(141,382,'','telkombaru'),(133,381,NULL,'os3.divre2.telkom.co.id'),(134,381,'','os3'),(135,381,'','telkombaru'),(119,380,NULL,'os3.divre2.telkom.co.id'),(120,380,'','os3'),(121,380,'','telkombaru'),(3,361,NULL,''),(4,361,NULL,''),(5,361,NULL,'1'),(6,361,'','.1.3.6.1.4.1.2021.11.52.0'),(1,362,NULL,'os3.divre2.telkom.co.id'),(2,362,NULL,'public'),(3,362,NULL,''),(4,362,NULL,''),(5,362,NULL,'1'),(6,362,'','.1.3.6.1.4.1.2021.11.50.0'),(12,358,'','ifDescr'),(7,358,NULL,'os3.divre2.telkom.co.id'),(8,358,NULL,'public'),(9,358,NULL,''),(10,358,NULL,''),(11,358,NULL,'1'),(48,358,NULL,'161'),(14,359,'','13'),(13,359,'','sit0'),(12,359,'','ifDescr'),(7,359,NULL,'os3.divre2.telkom.co.id'),(8,359,NULL,'public'),(9,359,NULL,''),(10,359,NULL,''),(11,359,NULL,'1'),(48,359,NULL,'161'),(1,360,NULL,'os3.divre2.telkom.co.id'),(8,356,NULL,'public'),(75,379,NULL,'os3.divre2.telkom.co.id'),(29,438,NULL,'10.12.12.65'),(217,349,'',''),(218,349,'on','80'),(215,348,'',''),(57,347,NULL,'localhost'),(58,347,'','cactiuser'),(59,347,'','CactiMadeEZ'),(66,346,NULL,'localhost'),(67,346,'','cactiuser'),(68,346,'','CactiMadeEZ'),(139,345,NULL,'localhost'),(140,345,'','cactiuser'),(141,345,'','CactiMadeEZ'),(50,344,NULL,'localhost'),(51,344,'','cactiuser'),(52,344,'','CactiMadeEZ'),(156,343,NULL,'localhost'),(157,343,'','cactiuser'),(158,343,'','CactiMadeEZ'),(148,342,NULL,'localhost'),(149,342,'','cactiuser'),(150,342,'','CactiMadeEZ'),(126,341,NULL,'localhost'),(127,341,'','cactiuser'),(129,341,'','CactiMadeEZ'),(49,340,NULL,'161'),(49,339,NULL,'161'),(49,338,NULL,'161'),(1,340,NULL,'localhost'),(2,340,NULL,'public'),(3,340,NULL,''),(4,340,NULL,''),(5,340,NULL,'2'),(6,340,'','.1.3.6.1.4.1.2021.10.1.3.2'),(1,339,NULL,'localhost'),(2,339,NULL,'public'),(3,339,NULL,''),(4,339,NULL,''),(5,339,NULL,'2'),(6,339,'','.1.3.6.1.4.1.2021.10.1.3.3'),(1,338,NULL,'localhost'),(2,338,NULL,'public'),(3,338,NULL,''),(4,338,NULL,''),(5,338,NULL,'2'),(6,338,'','.1.3.6.1.4.1.2021.10.1.3.1'),(168,337,NULL,'localhost'),(169,337,'','cactiuser'),(170,337,'','CactiMadeEZ'),(186,336,NULL,'localhost'),(187,336,'','cactiuser'),(188,336,'','CactiMadeEZ'),(175,335,NULL,'localhost'),(176,335,'','cactiuser'),(177,335,'','CactiMadeEZ'),(194,334,'','cactiuser'),(195,334,'','CactiMadeEZ'),(198,334,NULL,'localhost'),(175,333,NULL,'localhost'),(176,333,'','cactiuser'),(177,333,'','CactiMadeEZ'),(93,332,NULL,'10.32.18.97'),(94,332,'','cactiuser'),(95,332,'','CactiMadeEZ'),(49,331,NULL,'161'),(49,330,NULL,'161'),(49,329,NULL,'161'),(6,331,'','.1.3.6.1.4.1.2021.11.50.0'),(5,331,NULL,'1'),(4,331,NULL,''),(3,331,NULL,''),(2,331,NULL,'public'),(1,331,NULL,'10.32.18.97'),(6,330,'','.1.3.6.1.4.1.2021.11.52.0'),(5,330,NULL,'1'),(4,330,NULL,''),(3,330,NULL,''),(2,330,NULL,'public'),(1,330,NULL,'10.32.18.97'),(6,329,'','.1.3.6.1.4.1.2021.11.51.0'),(2,329,NULL,'public'),(3,329,NULL,''),(4,329,NULL,''),(5,329,NULL,'1'),(1,329,NULL,'10.32.18.97'),(48,328,NULL,'161'),(11,328,NULL,'1'),(10,328,NULL,''),(9,328,NULL,''),(8,328,NULL,'public'),(7,328,NULL,'10.32.18.97'),(12,328,'','ifDescr'),(13,328,'','sit0'),(14,328,'','13'),(48,327,NULL,'161'),(11,327,NULL,'1'),(10,327,NULL,''),(9,327,NULL,''),(8,327,NULL,'public'),(7,327,NULL,'10.32.18.97'),(12,327,'','ifDescr'),(13,327,'','lo'),(14,327,'','13'),(133,326,NULL,'localhost'),(134,326,'','cactiuser'),(135,326,'','CactiMadeEZ'),(119,325,NULL,'localhost'),(120,325,'','cactiuser'),(121,325,'','CactiMadeEZ'),(75,324,NULL,'localhost'),(76,324,'','cactiuser'),(77,324,'','CactiMadeEZ'),(84,323,NULL,'localhost'),(85,323,'','cactiuser'),(86,323,'','CactiMadeEZ'),(100,322,NULL,'localhost'),(101,322,'','cactiuser'),(102,322,'','CactiMadeEZ'),(111,321,NULL,'localhost'),(112,321,'','cactiuser'),(113,321,'','CactiMadeEZ'),(93,320,NULL,'localhost'),(94,320,'','cactiuser'),(95,320,'','CactiMadeEZ'),(49,319,NULL,'161'),(49,318,NULL,'161'),(49,317,NULL,'161'),(6,319,'','.1.3.6.1.4.1.2021.11.50.0'),(5,319,NULL,'2'),(4,319,NULL,''),(3,319,NULL,''),(2,319,NULL,'public'),(1,319,NULL,'localhost'),(6,318,'','.1.3.6.1.4.1.2021.11.52.0'),(5,318,NULL,'2'),(4,318,NULL,''),(3,318,NULL,''),(2,318,NULL,'public'),(1,318,NULL,'localhost'),(6,317,'','.1.3.6.1.4.1.2021.11.51.0'),(2,317,NULL,'public'),(3,317,NULL,''),(4,317,NULL,''),(5,317,NULL,'2'),(1,317,NULL,'localhost'),(48,316,NULL,'161'),(11,316,NULL,'2'),(10,316,NULL,''),(9,316,NULL,''),(8,316,NULL,'public'),(7,316,NULL,'localhost'),(12,316,'','ifDescr'),(13,316,'','lo'),(14,316,'','13'),(48,315,NULL,'161'),(11,315,NULL,'2'),(10,315,NULL,''),(9,315,NULL,''),(8,315,NULL,'public'),(7,315,NULL,'localhost'),(12,315,'','ifDescr'),(13,315,'','eth0'),(14,315,'','13'),(48,314,NULL,'161'),(11,314,NULL,'1'),(10,314,NULL,''),(9,314,NULL,''),(8,314,NULL,'public'),(7,314,NULL,'172.16.203.21'),(12,314,'','ifDescr'),(13,314,'','eth0'),(14,314,'','13'),(48,313,NULL,'161'),(11,313,NULL,'1'),(10,313,NULL,''),(9,313,NULL,''),(8,313,NULL,'public'),(7,313,NULL,'172.16.203.22'),(12,313,'','ifDescr'),(13,313,'','eth0'),(14,313,'','13'),(48,312,NULL,'161'),(11,312,NULL,'1'),(10,312,NULL,''),(9,312,NULL,''),(8,312,NULL,'public'),(7,312,NULL,'172.16.203.11'),(12,312,'','ifDescr'),(13,312,'','eth3'),(14,312,'','13'),(48,311,NULL,'161'),(11,311,NULL,'1'),(10,311,NULL,''),(9,311,NULL,''),(8,311,NULL,'public'),(7,311,NULL,'172.16.203.11'),(12,311,'','ifDescr'),(13,311,'','eth2'),(14,311,'','13'),(48,310,NULL,'161'),(11,310,NULL,'1'),(10,310,NULL,''),(9,310,NULL,''),(8,310,NULL,'public'),(7,310,NULL,'172.16.203.11'),(12,310,'','ifDescr'),(13,310,'','eth1'),(14,310,'','13'),(48,309,NULL,'161'),(11,309,NULL,'1'),(10,309,NULL,''),(9,309,NULL,''),(8,309,NULL,'public'),(7,309,NULL,'172.16.203.11'),(12,309,'','ifDescr'),(13,309,'','eth0'),(14,309,'','13'),(48,308,NULL,'161'),(11,308,NULL,'1'),(10,308,NULL,''),(9,308,NULL,''),(8,308,NULL,'public'),(7,308,NULL,'172.16.203.12'),(12,308,'','ifDescr'),(13,308,'','eth0'),(14,308,'','13'),(93,307,NULL,'10.32.18.97'),(94,307,'','os3'),(95,307,'','telkombaru'),(49,306,NULL,'161'),(49,305,NULL,'161'),(49,304,NULL,'161'),(6,306,'','.1.3.6.1.4.1.2021.11.50.0'),(5,306,NULL,'1'),(4,306,NULL,''),(3,306,NULL,''),(2,306,NULL,'public'),(1,306,NULL,'10.32.18.97'),(6,305,'','.1.3.6.1.4.1.2021.11.52.0'),(5,305,NULL,'1'),(4,305,NULL,''),(3,305,NULL,''),(2,305,NULL,'public'),(1,305,NULL,'10.32.18.97'),(6,304,'','.1.3.6.1.4.1.2021.11.51.0'),(2,304,NULL,'public'),(3,304,NULL,''),(4,304,NULL,''),(5,304,NULL,'1'),(1,304,NULL,'10.32.18.97'),(48,303,NULL,'161'),(11,303,NULL,'1'),(10,303,NULL,''),(9,303,NULL,''),(8,303,NULL,'public'),(7,303,NULL,'10.32.18.97'),(12,303,'','ifDescr'),(13,303,'','eth1'),(14,303,'','13'),(48,302,NULL,'161'),(11,302,NULL,'1'),(10,302,NULL,''),(9,302,NULL,''),(8,302,NULL,'public'),(7,302,NULL,'10.32.18.97'),(12,302,'','ifDescr'),(13,302,'','eth0'),(14,302,'','13'),(10,357,NULL,''),(9,357,NULL,''),(8,357,NULL,'public'),(7,357,NULL,'os3.divre2.telkom.co.id'),(12,357,'','ifDescr'),(13,357,'','eth0'),(14,357,'','13'),(48,356,NULL,'161'),(11,356,NULL,'1'),(10,356,NULL,''),(9,356,NULL,''),(7,356,NULL,'os3.divre2.telkom.co.id'),(12,356,'','ifDescr'),(13,356,'','lo'),(14,356,'','13'),(52,249,'on',''),(51,249,'on',''),(50,249,'',''),(59,250,'on',''),(58,250,'on',''),(57,250,'',''),(68,251,'on',''),(67,251,'on',''),(66,251,'',''),(77,252,'on',''),(76,252,'on',''),(75,252,'',''),(86,253,'on',''),(85,253,'on',''),(84,253,'',''),(95,254,'on',''),(94,254,'on',''),(93,254,'',''),(102,255,'on',''),(101,255,'on',''),(100,255,'',''),(113,256,'on',''),(112,256,'on',''),(111,256,'',''),(121,257,'on',''),(120,257,'on',''),(119,257,'',''),(129,258,'on',''),(127,258,'on',''),(126,258,'',''),(135,259,'on',''),(134,259,'on',''),(133,259,'',''),(141,260,'on',''),(140,260,'on',''),(139,260,'',''),(150,261,'on',''),(149,261,'on',''),(148,261,'',''),(158,262,'on',''),(157,262,'on',''),(156,262,'',''),(6,263,'','.1.3.6.1.4.1.2021.10.1.3.1'),(5,263,'',''),(4,263,'',''),(3,263,'',''),(2,263,'',''),(1,263,'',''),(6,264,'','.1.3.6.1.4.1.2021.10.1.3.2'),(5,264,'',''),(4,264,'',''),(3,264,'',''),(2,264,'',''),(1,264,'',''),(6,265,'','.1.3.6.1.4.1.2021.10.1.3.3'),(5,265,'',''),(4,265,'',''),(3,265,'',''),(2,265,'',''),(1,265,'',''),(170,266,'on',''),(169,266,'on',''),(168,266,'',''),(177,267,'on',''),(176,267,'on',''),(175,267,'',''),(188,268,'on',''),(187,268,'on',''),(186,268,'',''),(177,269,'on',''),(176,269,'on',''),(175,269,'',''),(198,270,'',''),(195,270,'on',''),(194,270,'on',''),(200,271,'',''),(200,272,'',''),(200,273,'',''),(101,376,'','os3'),(100,376,NULL,'os3.divre2.telkom.co.id'),(52,377,'','telkombaru'),(51,377,'','os3'),(50,377,NULL,'os3.divre2.telkom.co.id'),(157,375,'','os3'),(158,375,'','telkombaru'),(148,374,NULL,'os3.divre2.telkom.co.id'),(76,379,'','os3'),(77,379,'','telkombaru'),(84,378,NULL,'os3.divre2.telkom.co.id'),(156,375,NULL,'os3.divre2.telkom.co.id'),(150,374,'','telkombaru'),(149,374,'','os3'),(102,376,'','telkombaru'),(111,373,NULL,'os3.divre2.telkom.co.id'),(85,378,'','os3'),(86,378,'','telkombaru'),(112,373,'','os3'),(113,373,'','telkombaru'),(126,372,NULL,'os3.divre2.telkom.co.id'),(127,372,'','os3'),(129,372,'','telkombaru'),(49,371,NULL,'161'),(49,370,NULL,'161'),(49,369,NULL,'161'),(1,371,NULL,'os3.divre2.telkom.co.id'),(2,371,NULL,'public'),(3,371,NULL,''),(4,371,NULL,''),(5,371,NULL,'1'),(6,371,'','.1.3.6.1.4.1.2021.10.1.3.2'),(1,370,NULL,'os3.divre2.telkom.co.id'),(2,370,NULL,'public'),(1,369,NULL,'os3.divre2.telkom.co.id'),(2,369,NULL,'public'),(3,369,NULL,''),(4,369,NULL,''),(5,369,NULL,'1'),(168,368,NULL,'os3.divre2.telkom.co.id'),(6,369,'','.1.3.6.1.4.1.2021.10.1.3.1'),(4,370,NULL,''),(5,370,NULL,'1'),(6,370,'','.1.3.6.1.4.1.2021.10.1.3.3'),(3,370,NULL,''),(169,368,'','os3'),(170,368,'','telkombaru'),(186,367,NULL,'os3.divre2.telkom.co.id'),(187,367,'','os3'),(188,367,'','telkombaru'),(175,366,NULL,'os3.divre2.telkom.co.id'),(176,366,'','os3'),(177,366,'','telkombaru'),(194,365,'','os3'),(195,365,'','telkombaru'),(198,365,NULL,'os3.divre2.telkom.co.id'),(175,364,NULL,'os3.divre2.telkom.co.id'),(176,364,'','os3'),(177,364,'','telkombaru'),(93,363,NULL,'os3.divre2.telkom.co.id'),(94,363,'','os3'),(95,363,'','telkombaru'),(49,362,NULL,'161'),(49,361,NULL,'161'),(49,360,NULL,'161'),(2,361,NULL,'public'),(1,361,NULL,'os3.divre2.telkom.co.id'),(6,360,'','.1.3.6.1.4.1.2021.11.51.0'),(2,360,NULL,'public'),(3,360,NULL,''),(4,360,NULL,''),(5,360,NULL,'1'),(13,358,'','eth1'),(14,358,'','13'),(48,357,NULL,'161'),(11,357,NULL,'1');
/*!40000 ALTER TABLE `data_input_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input_fields`
--

DROP TABLE IF EXISTS `data_input_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_input_fields` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `data_input_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `data_name` varchar(50) NOT NULL default '',
  `input_output` char(3) NOT NULL default '',
  `update_rra` char(2) default '0',
  `sequence` smallint(5) NOT NULL default '0',
  `type_code` varchar(40) default NULL,
  `regexp_match` varchar(200) default NULL,
  `allow_nulls` char(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `data_input_id` (`data_input_id`),
  KEY `type_code` (`type_code`)
) ENGINE=MyISAM AUTO_INCREMENT=248 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_input_fields`
--

LOCK TABLES `data_input_fields` WRITE;
/*!40000 ALTER TABLE `data_input_fields` DISABLE KEYS */;
INSERT INTO `data_input_fields` VALUES (1,'92f5906c8dc0f964b41f4253df582c38',1,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(2,'32285d5bf16e56c478f5e83f32cda9ef',1,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(3,'ad14ac90641aed388139f6ba86a2e48b',1,'SNMP Username','snmp_username','in','',0,'snmp_username','','on'),(4,'9c55a74bd571b4f00a96fd4b793278c6',1,'SNMP Password','snmp_password','in','',0,'snmp_password','','on'),(5,'012ccb1d3687d3edb29c002ea66e72da',1,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','','on'),(6,'4276a5ec6e3fe33995129041b1909762',1,'OID','oid','in','',0,'snmp_oid','',''),(7,'617cdc8a230615e59f06f361ef6e7728',2,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(8,'acb449d1451e8a2a655c2c99d31142c7',2,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(9,'f4facc5e2ca7ebee621f09bc6d9fc792',2,'SNMP Username (v3)','snmp_username','in','',0,'snmp_username','','on'),(10,'1cc1493a6781af2c478fa4de971531cf',2,'SNMP Password (v3)','snmp_password','in','',0,'snmp_password','','on'),(11,'b5c23f246559df38662c255f4aa21d6b',2,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','',''),(12,'6027a919c7c7731fbe095b6f53ab127b',2,'Index Type','index_type','in','',0,'index_type','',''),(13,'cbbe5c1ddfb264a6e5d509ce1c78c95f',2,'Index Value','index_value','in','',0,'index_value','',''),(14,'e6deda7be0f391399c5130e7c4a48b28',2,'Output Type ID','output_type','in','',0,'output_type','',''),(15,'edfd72783ad02df128ff82fc9324b4b9',3,'Disk Partition','partition','in','',1,'','',''),(16,'8b75fb61d288f0b5fc0bd3056af3689b',3,'Kilobytes Free','kilobytes','out','on',0,'','',''),(17,'363588d49b263d30aecb683c52774f39',4,'1 Minute Average','1min','out','on',0,'','',''),(18,'ad139a9e1d69881da36fca07889abf58',4,'5 Minute Average','5min','out','on',0,'','',''),(19,'5db9fee64824c08258c7ff6f8bc53337',4,'10 Minute Average','10min','out','on',0,'','',''),(20,'c0cfd0beae5e79927c5a360076706820',5,'Username (Optional)','username','in','',1,'','','on'),(21,'52c58ad414d9a2a83b00a7a51be75a53',5,'Logged In Users','users','out','on',0,'','',''),(22,'05eb5d710f0814871b8515845521f8d7',6,'Grep String','grepstr','in','',1,'','',''),(23,'86cb1cbfde66279dbc7f1144f43a3219',6,'Result (in Kilobytes)','kilobytes','out','on',0,'','',''),(24,'d5a8dd5fbe6a5af11667c0039af41386',7,'Number of Processes','proc','out','on',0,'','',''),(25,'8848cdcae831595951a3f6af04eec93b',8,'Grep String','grepstr','in','',1,'','','on'),(26,'3d1288d33008430ce354e8b9c162f7ff',8,'Connections','connections','out','on',0,'','',''),(27,'c6af570bb2ed9c84abf32033702e2860',9,'(Optional) Log Path','log_path','in','',1,'','','on'),(28,'f9389860f5c5340c9b27fca0b4ee5e71',9,'Web Hits','webhits','out','on',0,'','',''),(29,'5fbadb91ad66f203463c1187fe7bd9d5',10,'IP Address','ip','in','',1,'hostname','',''),(30,'6ac4330d123c69067d36a933d105e89a',10,'Milliseconds','out_ms','out','on',0,'','',''),(31,'d39556ecad6166701bfb0e28c5a11108',11,'Index Type','index_type','in','',0,'index_type','',''),(32,'3b7caa46eb809fc238de6ef18b6e10d5',11,'Index Value','index_value','in','',0,'index_value','',''),(33,'74af2e42dc12956c4817c2ef5d9983f9',11,'Output Type ID','output_type','in','',0,'output_type','',''),(34,'8ae57f09f787656bf4ac541e8bd12537',11,'Output Value','output','out','on',0,'','',''),(35,'172b4b0eacee4948c6479f587b62e512',12,'Index Type','index_type','in','',0,'index_type','',''),(36,'30fb5d5bcf3d66bb5abe88596f357c26',12,'Index Value','index_value','in','',0,'index_value','',''),(37,'31112c85ae4ff821d3b288336288818c',12,'Output Type ID','output_type','in','',0,'output_type','',''),(38,'5be8fa85472d89c621790b43510b5043',12,'Output Value','output','out','on',0,'','',''),(39,'03ffd37fd55813d2d25bcd34967f2bcb',13,'Number of all processed rrds','RRDsProcessed','out','on',0,'','',''),(40,'15cfbcb8b34f83e6f088103ee83b22a8',13,'Number of all data sources','DataSources','out','on',0,'','',''),(41,'c39772d17f7cd0ba6ae330bb1bdbf607',13,'Hosts per Process','HostsPerProcess','out','on',0,'','',''),(42,'fdd660a8c8cee48696c6265882f0c14c',13,'Number of all Hosts','Hosts','out','on',0,'','',''),(43,'a63f6464addc92837bde2a091eb25b64',13,'Maximum Threads per Process','Threads','out','on',0,'','',''),(44,'cc25e6d384d698c928db02d43c16aeed',13,'Maximum Concurrent Poller Processes','Processes','out','on',0,'','',''),(45,'4b9d7d50fbef23d98e4445b444aa76e9',13,'Time for last poller run','Time','out','on',0,'','',''),(46,'67ce63580ef0eab26d6f87ff025664dc',14,'New Messages','total','out','on',0,'','',''),(47,'e1552e9d99522b2770316a5f1972ecba',14,'Processed Messages','incoming','out','on',0,'','',''),(48,'c1f36ee60c3dc98945556d57f26e475b',2,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(49,'fc64b99742ec417cc424dbf8c7692d36',1,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(50,'e649b938a9a949c75f8f6868d96e9a21',15,'Host name','hostname','in','',0,'hostname','','on'),(51,'000cb79ce421f507a3c7362e174b91a1',15,'User name','username','in','',0,'','','on'),(52,'321b02d089307c0ac17024a92a0c4214',15,'Password','password','in','',0,'','','on'),(53,'ce0d669c0b9a1cf0ec820911f1f690d9',15,'Binlog_cache_disk_use','Binlog_cache_disk_use','out','on',0,'','',''),(54,'68f43e3559a2edbf6347ac2d4f0742b3',15,'Binlog_cache_use','Binlog_cache_use','out','on',0,'','',''),(55,'dfbbee8a9587d08b058bcc9d296db9ec',15,'Seconds_Behind_Master','Seconds_Behind_Master','out','on',0,'','',''),(56,'a72bc89485b3a406edcc084c7c4f00f1',15,'Read_Exec_Log_Pos_Diff','Read_Exec_Log_Pos_Diff','out','on',0,'','',''),(57,'0dbd166eb883db9d47a3a857d5c413a8',16,'Host name','hostname','in','',0,'hostname','','on'),(58,'b022f6297cb2cd6d4e511aa00cc41b09',16,'User name','username','in','',0,'','','on'),(59,'0a54b17b90c297d95e6d92837764646b',16,'Password','password','in','',0,'','','on'),(60,'0efc9df618211f11a08db554c424453d',16,'Com_delete','Com_delete','out','on',0,'','',''),(61,'6973ef91ab85f7fed55b657801f62c75',16,'Com_insert','Com_insert','out','on',0,'','',''),(62,'3902b8e3ae6bfda3313062875d18e463',16,'Com_insert_select','Com_insert_select','out','on',0,'','',''),(63,'09237e7e22685de04af4e34c953e2442',16,'Com_truncate','Com_truncate','out','on',0,'','',''),(64,'2ccb9814080465e3b10baa49afe3cdf2',16,'Com_update','Com_update','out','on',0,'','',''),(65,'80311f7cdb164786a9f88ce196e5e73b',16,'Com_update_multi','Com_update_multi','out','on',0,'','',''),(66,'74d9ed1376f06e0fba98965e918fecc1',17,'Host name','hostname','in','',0,'hostname','','on'),(67,'b20e00fbee71aab7dee228e826bedff9',17,'User','username','in','',0,'','','on'),(68,'7953e8810afb21b493f2775fbfff7f10',17,'Password','password','in','',0,'','','on'),(69,'eaf6c22422fcd0c270621832455bbc38',17,'Handler_commit','Handler_commit','out','on',0,'','',''),(70,'fa0f2398e9095391e532b01c39f0a62d',17,'Handler_delete','Handler_delete','out','on',0,'','',''),(71,'a29baf1e3fdb5a1ea4205648b5e0faf9',17,'Handler_discover','Handler_discover','out','on',0,'','',''),(72,'fbbee63aa015658ff27c839e932155da',17,'Handler_rollback','Handler_rollback','out','on',0,'','',''),(73,'40b3cf7999989dfd042377ecb7156f8b',17,'Handler_update','Handler_update','out','on',0,'','',''),(74,'3e1920d0bb41c36e14d3790b0299e109',17,'Handler_write','Handler_write','out','on',0,'','',''),(75,'c5bf9b6bccc8b15df6d360e7e6baee6b',18,'Host name','hostname','in','',0,'hostname','','on'),(76,'ea5cc5a2e7762699f8a083068148620f',18,'User name','username','in','',0,'','','on'),(77,'107f3bb3eb6a6333e6186d3974345baa',18,'Password','password','in','',0,'','','on'),(78,'fa67e8f8cbfb8b87615692dbc20fb72f',18,'Com_select','Com_select','out','on',0,'','',''),(79,'3deef28e23134a1f2e7d83e85f4f964f',18,'Select_full_join','Select_full_join','out','on',0,'','',''),(80,'bdcc00d8f0a0bd0d30333c1978fd799e',18,'Select_full_range_join','Select_full_range_join','out','on',0,'','',''),(81,'8bd493672dec0b32963bb8752dcc286f',18,'Select_range','Select_range','out','on',0,'','',''),(82,'d0767fcd33ee0aa0b43d2ab84e98fb8c',18,'Select_range_check','Select_range_check','out','on',0,'','',''),(83,'c9d4ceb43bc1de0c3ab8c3403bc75e0b',18,'Select_scan','Select_scan','out','on',0,'','',''),(84,'2ca8bd2062a5a3edd012c24c6e44effc',19,'Host name','hostname','in','',0,'hostname','','on'),(85,'d492c32dfb95f2486dac01eff6c2c9da',19,'User name','username','in','',0,'','','on'),(86,'77ba0ff4d5081ac04db2ffb2a5d4f776',19,'Password','password','in','',0,'','','on'),(87,'8b07ecc9ebbeba091f4661d3d6a6c3fe',19,'Handler_read_first','Handler_read_first','out','on',0,'','',''),(88,'f0f8af4ed3fde71670e816ad08c770a1',19,'Handler_read_key','Handler_read_key','out','on',0,'','',''),(89,'470046a84c36ed458013a7c8fa1b9d6c',19,'Handler_read_next','Handler_read_next','out','on',0,'','',''),(90,'a0d83448ce6a2ad711eaa429c2de10c5',19,'Handler_read_prev','Handler_read_prev','out','on',0,'','',''),(91,'54662a98df03039ced8071c56f5b8a1b',19,'Handler_read_rnd','Handler_read_rnd','out','on',0,'','',''),(92,'9f70fadb2499b3bb3c25e60c8dbb39fe',19,'Handler_read_rnd_next','Handler_read_rnd_next','out','on',0,'','',''),(93,'f15137683a9d7e98f09bf4fc673dd5e1',20,'Host name','hostname','in','',0,'hostname','','on'),(94,'f8f6c64b5c34157963cc1b2b39ad1395',20,'User name','username','in','',0,'','','on'),(95,'7e94bd7ac3178f6a66844b4ee63f17ef',20,'Password','password','in','',0,'','','on'),(96,'7257049fe42e3cc00953ab52f6cade29',20,'Key_read_requests','Key_read_requests','out','on',0,'','',''),(97,'8c46c27313d7c4b317de70486d945ee3',20,'Key_reads','Key_reads','out','on',0,'','',''),(98,'332315177784519bee8dc994b2cc2aa2',20,'Key_write_requests','Key_write_requests','out','on',0,'','',''),(99,'7192cfedda53f2d094cbb8964859f8ab',20,'Key_writes','Key_writes','out','on',0,'','',''),(100,'762661403a546bb3a795ab937d8486a5',21,'Host name','hostname','in','',0,'hostname','','on'),(101,'9f2adcfe3fe4dfd6d38574fdb8e9aacc',21,'User name','username','in','',0,'','','on'),(102,'e8ea50ec0c8d719a44379619f7246726',21,'Password','password','in','',0,'','','on'),(103,'55502c3fac6539073fc83b71164aadea',21,'Qcache_free_blocks','Qcache_free_blocks','out','on',0,'','',''),(104,'2ce6ef32257e0e1b5a1aca0a2290209b',21,'Qcache_free_memory','Qcache_free_memory','out','on',0,'','',''),(105,'e21fe68c6e9a64deabf95eeb29fff158',21,'Qcache_hits','Qcache_hits','out','on',0,'','',''),(106,'2c7f886365cc84ccc018ed78ffd5ab11',21,'Qcache_inserts','Qcache_inserts','out','on',0,'','',''),(107,'5a417c7dc8f2b39ff2ce6e362b12d2cb',21,'Qcache_lowmem_prunes','Qcache_lowmem_prunes','out','on',0,'','',''),(108,'4fc9a1093a538e793aaae79c3305ed0c',21,'Qcache_not_cached','Qcache_not_cached','out','on',0,'','',''),(109,'8fea815088b875858225859a81b9ec13',21,'Qcache_queries_in_cache','Qcache_queries_in_cache','out','on',0,'','',''),(110,'7a1e1d10bf6bf0a6386f96d568f80620',21,'Qcache_total_blocks','Qcache_total_blocks','out','on',0,'','',''),(111,'60664ffef5a1db5c8013a11acaac8149',22,'Host name','hostname','in','',0,'hostname','','on'),(112,'740d58ed0de36cf0f90945dd920803a4',22,'User name','username','in','',0,'','','on'),(113,'8dc62ffd84e74f6d90e08487975bad06',22,'Password','password','in','',0,'','','on'),(114,'5553162fceec749a281dfc315c0630ad',22,'Questions','Questions','out','on',0,'','',''),(115,'d9d56a7ad99718742f027c812069b415',22,'Bytes_received','Bytes_received','out','on',0,'','',''),(116,'89532cf76ab8d6e096de63a4bc845e9f',22,'Bytes_sent','Bytes_sent','out','on',0,'','',''),(117,'dadedd4be3fd32bc976b354478153965',22,'Connections','Connections','out','on',0,'','',''),(118,'7e30c885a50d2bf32502fa4205b77d12',22,'Max_used_connections','Max_used_connections','out','on',0,'','',''),(119,'aae8a6a38ed0f8feccd08cdcc40d48fe',23,'Host name','hostname','in','',0,'hostname','','on'),(120,'acab3682e42b4f41e4a44926841dabb5',23,'User name','username','in','',0,'','','on'),(121,'c12de3ab4b0f5ee9ae674fbb7a741528',23,'Password','password','in','',0,'','','on'),(122,'eee8e651331c5473fd3bf9227932d55d',23,'Sort_merge_passes','Sort_merge_passes','out','on',0,'','',''),(123,'89361df05dd898c643ee6340d8a9cfd3',23,'Sort_range','Sort_range','out','on',0,'','',''),(124,'4673af1c6bd76dff85aa05158aece0d7',23,'Sort_rows','Sort_rows','out','on',0,'','',''),(125,'3a447d84acb3a5d11f30df61b4eb9320',23,'Sort_scan','Sort_scan','out','on',0,'','',''),(126,'486005ffbdc6facec23a498d30ddd648',24,'Host name','hostname','in','',0,'hostname','','on'),(127,'aea70ddd5ccab6e5a1aabc287ed6bbc2',24,'User name','username','in','',0,'','','on'),(128,'b1727d4b080e98d85aa623c3a0098564',24,'Table_locks_immediate','Table_locks_immediate','out','on',0,'','',''),(129,'fbbeebbebb1d3b1c5a64dc2e65db4a49',24,'Password','password','in','',0,'','','on'),(130,'996d4b1aa0aaf9d8dc68a7d652360c04',24,'Table_locks_waited','Table_locks_waited','out','on',0,'','',''),(131,'66c03776a9f1de79b8162ff5bff183fe',24,'Slow_launch_threads','Slow_launch_threads','out','on',0,'','',''),(132,'2b7db917495fac2adf9d85d77533991d',24,'Slow_queries','Slow_queries','out','on',0,'','',''),(133,'e32f03d1b8e491e1518fd664c8338491',25,'Host name','hostname','in','',0,'hostname','','on'),(134,'007efa9ac20caf699af8117a0d09e54c',25,'User name','username','in','',0,'','','on'),(135,'5e4709e0546ef0c8113650a5d97a4b39',25,'Password','password','in','',0,'','','on'),(136,'e26064997278fe682c5c6f65c5cf710f',25,'Created_tmp_disk_tables','Created_tmp_disk_tables','out','on',0,'','',''),(137,'0549bb35c6f50c726a746b292848fc9e',25,'Created_tmp_files','Created_tmp_files','out','on',0,'','',''),(138,'6b35555b40707d1cbff65754d14659c1',25,'Created_tmp_tables','Created_tmp_tables','out','on',0,'','',''),(139,'938bd0b303428354fcbe35a3e9719a1a',26,'Host name','hostname','in','',0,'hostname','','on'),(140,'674bf0e710550e6b484a8c91da15aeaa',26,'User name','username','in','',0,'','','on'),(141,'9e4467e6f9a67a4b55685e0468b1fb1b',26,'Password','password','in','',0,'','','on'),(142,'bbd00d2d1b1886331820d3ee743bace4',26,'Threads_cached','Threads_cached','out','on',0,'','',''),(143,'e7f104ba2a631ec57a7a614e0777f95b',26,'Threads_connected','Threads_connected','out','on',0,'','',''),(144,'002a7bbc212f186b42464433ed76675c',26,'Threads_created','Threads_created','out','on',0,'','',''),(145,'46273168ac57894b2fb696f8c2c64f96',26,'Threads_running','Threads_running','out','on',0,'','',''),(146,'bfe20365a2cadff0514a5181ac3141ba',26,'Aborted_clients','Aborted_clients','out','on',0,'','',''),(147,'11efc6d29c7347a5859b27bf09aee75e',26,'Aborted_connects','Aborted_connects','out','on',0,'','',''),(148,'95c92614a8bbb7188b59423f83fab58e',27,'Database Host','hostname','in','',0,'hostname','',''),(149,'3b68f282e1393d3307c3ccc4d07216c8',27,'Database User','username','in','',0,'','',''),(150,'c834e1ff20c8114f68f08e50d718d4b0',27,'Database Password','password','in','',0,'','',''),(151,'083674933462d93ac50d67544f08f34c',27,'change_db','change_db','out','on',0,'','',''),(152,'cf64e81368a5ef4eea8cf519620b14c0',27,'delete','delete','out','on',0,'','',''),(153,'8e8a6808471ec853912354a2a67724be',27,'insert','insert','out','on',0,'','',''),(154,'7b5c92dc02888a65ffe2033bf8e4bec8',27,'select','select','out','on',0,'','',''),(155,'d353cb182439bcfb45532536515f9d83',27,'update','update','out','on',0,'','',''),(156,'7939ce23d58fb376d6a950040a16b577',28,'Database Host','hostname','in','',0,'hostname','',''),(157,'51343772a380bad06aebd1546bd16f79',28,'Database User','username','in','',0,'','',''),(158,'aa0449db44ab26c7cd86cd7309df4d07',28,'Database Password','password','in','',0,'','',''),(159,'7e9fde2dab4b885128da3467996b888d',28,'Handler delete','delete','out','on',0,'','',''),(160,'f3547487d5cbcabc3adc60f865d6031f',28,'Handler read_first','read_first','out','on',0,'','',''),(161,'56344a606aeccfba0ee359e31e3bc026',28,'Handler read_key','read_key','out','on',0,'','',''),(162,'3a0e59a4182ebc572043c2d69b59f4a6',28,'Handler read_next','read_next','out','on',0,'','',''),(163,'bcbcf82c29c181e85c3e4e969d0cf621',28,'Handler read_prev','read_prev','out','on',0,'','',''),(164,'163dfe660241749c11b4559aadfae9d6',28,'Handler read_rnd','read_rnd','out','on',0,'','',''),(165,'7c8718f897cab8b2383eabfdb909bcb9',28,'Handler read_rnd_next','read_rnd_next','out','on',0,'','',''),(166,'030bd3511e404b82d1bb1c3ea8bf5b17',28,'Handler update','update','out','on',0,'','',''),(167,'b6dada0f29795a9c54ede88154597867',28,'Handler write','write','out','on',0,'','',''),(168,'0c9b4c8b44a3fdec58bcf8a3a1403e76',29,'Host name','hostname','in','',0,'hostname','','on'),(169,'ed0e4d30f1b12b0c2fbce482c7a09064',29,'User name','username','in','',0,'','','on'),(170,'6acba2fbaf326372de0cdaf0505a409b',29,'Password','password','in','',0,'','','on'),(171,'3f71b24f7642696ff1b749730d4e5a43',29,'rows_inserted','rows_inserted','out','on',0,'','',''),(172,'1d2d422234e09ab62d83000d82049dba',29,'rows_updated','rows_updated','out','on',0,'','',''),(173,'fcf33c01254ea0a2361511d277982fb4',29,'rows_deleted','rows_deleted','out','on',0,'','',''),(174,'fbf44cd9868c0364e2d209afd095e97e',29,'rows_read','rows_read','out','on',0,'','',''),(175,'c9b76b66ae8fd93eb68caa759ba697df',30,'Host name','hostname','in','',0,'hostname','',''),(176,'6a970078267adc2255264d595baf5bc3',30,'User name','username','in','',0,'','','on'),(177,'47f153b23a5f2377501b519d7010e6b7',30,'Password','password','in','',0,'','','on'),(178,'87916bb4ba36e9c6843ed61c5e62c62b',30,'insert_buffer_inserts','insert_buffer_inserts','out','on',0,'','',''),(179,'8d19f051b520f4ead1dd60abd140c7c3',30,'insert_buffer_merged','insert_buffer_merged','out','on',0,'','',''),(180,'7ebd6544a017932752c935e5b6c19b5e',30,'insert_buffer_merges','insert_buffer_merges','out','on',0,'','',''),(181,'f2a07afff5d871459f29527f0cbe9372',30,'buffer_pool_size','buffer_pool_size','out','on',0,'','',''),(182,'b3894ef268ad2f17216f159d65800b59',30,'buffer_free_pages','buffer_free_pages','out','on',0,'','',''),(183,'68b5c7f65cf91f196b1e730813781c33',30,'buffer_database_pages','buffer_database_pages','out','on',0,'','',''),(184,'b80ca81f522853fd828e20de54077ba2',30,'buffer_modified_pages','buffer_modified_pages','out','on',0,'','',''),(185,'35f0ce0832e454b5ee7fab7f742a2fc0',30,'buffer_hit_rate','buffer_hit_rate','out','on',0,'','',''),(186,'aa55c1ad5244adc70031b9f3a1f09409',31,'Host name','hostname','in','',0,'hostname','','on'),(187,'0e592b97bf8075512d6e4c26f793d819',31,'User name','username','in','',0,'','','on'),(188,'54846a7d1d11270d963af6699cb1f420',31,'Password','password','in','',0,'','','on'),(189,'1a5fb464ab5b94afb04f439d09f6bc04',31,'spin_waits','spin_waits','out','on',0,'','',''),(190,'47899a60f3ceb9868458fe49bd8a85d3',31,'spin_rounds','spin_rounds','out','on',0,'','',''),(191,'51870370b2b955154151119feff1bd91',31,'os_waits','os_waits','out','on',0,'','',''),(192,'d9c0a5260bae14510958a2206e575a82',32,'log_writes','log_writes','out','on',0,'','',''),(193,'473d7b907819f09ff0596574a8ac3c4a',32,'file_fsyncs','file_fsyncs','out','on',0,'','',''),(194,'79633b5df386ef89ec7871270d232141',32,'User name','username','in','',0,'','','on'),(195,'bb3e47814690a8055e55627377b924d6',32,'Password','password','in','',0,'','','on'),(196,'639323d08e34b7c4b553a40b5f479aac',32,'file_reads','file_reads','out','on',0,'','',''),(197,'f86f01a6bcf4557b72da6b4f9df41135',32,'file_writes','file_writes','out','on',0,'','',''),(198,'f21f14ad48e0012d7e42a91446acacf5',32,'Host name','hostname','in','',0,'hostname','','on'),(199,'1461b67012fcb015c6a4586e0a54198b',33,'rusage_system','rusage_system','out','on',0,'','',''),(200,'573b9295e7cdb43c08b7c8d6c5383888',33,'Hostname','hostname','in','',0,'hostname','',''),(201,'c5003ae89498300b544d58197c0a718a',33,'rusage_user','rusage_user','out','on',0,'','',''),(202,'cb471764f378fbd5a3af8220923dbaa8',33,'bytes','bytes','out','on',0,'','',''),(203,'b3df38d7939307d20009564796ea32ce',33,'total_items','total_items','out','on',0,'','',''),(204,'a38662696f49b14252c7467b3ff76450',33,'total_connections','total_connections','out','on',0,'','',''),(205,'4db51bee59b73d6de15b4b9176e6b130',33,'curr_items','curr_items','out','on',0,'','',''),(206,'3d846422ce3da2c84d7343d684dc9c53',33,'curr_connections','curr_connections','out','on',0,'','',''),(207,'d8dc7049f9c07d7d231d0d82caa0b9dd',33,'connection_structures','connection_structures','out','on',0,'','',''),(208,'f97e6feb0cc7689a7456c58e0a77eae7',33,'cmd_get','cmd_get','out','on',0,'','',''),(209,'0e8bae4cd90c69980e472ff77d578637',33,'cmd_set','cmd_set','out','on',0,'','',''),(210,'e331011c62fca3d8cdedfb1de81cc268',33,'get_hits','get_hits','out','on',0,'','',''),(211,'efeb918a9394b25efeee4b0d673f518f',33,'get_misses','get_misses','out','on',0,'','',''),(212,'4afcc9f2681bf8f4107951e28ff52348',33,'bytes_read','bytes_read','out','on',0,'','',''),(213,'fe67edba26bdf0169d4e75a693284280',33,'bytes_written','bytes_written','out','on',0,'','',''),(214,'d36ac48f37c8381a88d53255624c6043',33,'limit_maxbytes','limit_maxbytes','out','on',0,'','',''),(215,'3ee43c0c7bd7c39f41d2a2edc6f29c17',34,'IP Address','ip','in','',0,'hostname','',''),(216,'e3dcc17e53bf376e97e3121286da897c',34,'Milliseconds','avg','out','on',0,'','',''),(217,'0584e3abde8bbe0181e9005c1f4e843f',35,'IP Address','ip','in','',0,'hostname','',''),(218,'e861257cc22c5bcdf480058aaa31fbf6',35,'TCP Port to check','port','in','',0,'','',''),(219,'ea21897bd61e02cdb1ae31c0f8626eff',35,'Milliseconds','avg','out','on',0,'','',''),(220,'d3ff20dcb12b5f09181e44ec8ed5c370',36,'IP1','ip_one','out','on',0,'','',''),(221,'571b4efad8340cd85d664758cd3c74ab',36,'IP2','ip_two','out','on',0,'','',''),(222,'5616dea2c43a04ab24910af05818df73',36,'IP3','ip_three','out','on',0,'','',''),(223,'78e8cc6de953ab933798fb484718393b',36,'IP4','ip_four','out','on',0,'','',''),(224,'0ee539aeca729ce5ca99679be238e617',36,'IP5','ip_five','out','on',0,'','',''),(225,'d228449ab02d250373798945a6b87a27',36,'IP6','ip_six','out','on',0,'','',''),(226,'70e18d9b372b62c4bf916c5a47e8dd65',36,'IP7','ip_seven','out','on',0,'','',''),(227,'2d53930a3ca1b7fde196396db17d8df4',36,'IP8','ip_eight','out','on',0,'','',''),(228,'aa644659814828ad7a9db8d8a4a92e13',36,'IP9','ip_nine','out','on',0,'','',''),(229,'14f431204230ad156be5b39e2beaf722',37,'IP Address','ip','in','',1,'hostname','',''),(230,'9ea2c02774f004aaacb4091b107ca658',37,'Milliseconds','avg','out','on',0,'','',''),(231,'05290829bfc8ec4e9eaf6d44017fc36f',38,'Total kBytes','apache_total_kbytes','out','on',0,'','',''),(232,'520a8a46df2c98bdf1516316fe75ba0e',38,'Total Accesses','apache_total_hits','out','on',0,'','',''),(233,'e9352d98994d5bdf6ca06fe1c0ff3c19',38,'Busy Worker Threads','apache_busy_workers','out','on',0,'','',''),(234,'e1def5c3f87bfe5853eb72eac7c5ff49',38,'Idle Worker Threads','apache_idle_workers','out','on',0,'','',''),(235,'f44130aaf667a8d5e21817eeef5bf74d',38,'Host to be queried for \"/server-status?auto\"','hostname','in','',1,'hostname','','on'),(236,'c9180156d963cd0159460b6b374c4d42',38,'thread representing starting up','threadS','out','on',0,'','',''),(237,'9e1241e9537b9e0e8a5beee9d340fe13',38,'thread representing reading request','threadR','out','on',0,'','',''),(238,'1b6f2dd159101aad22346f9396de5c10',38,'thread representing logging','threadL','out','on',0,'','',''),(239,'9b8c7d78f6960dc1fb7268f385f213ae',38,'thread representing keepalive','threadK','out','on',0,'','',''),(240,'f1f00e0651aeb50100ee51d65869098e',38,'thread representing idle cleanup','threadI','out','on',0,'','',''),(241,'af515fa6ff4d316f8acd2955e17d38e0',38,'thread representing graceful finishing','threadG','out','on',0,'','',''),(242,'ee5c41332c973f49d53b616b36759a3e',38,'thread representing DNS lookup','threadD','out','on',0,'','',''),(243,'126948fcf3f7efb011698bbe174d1f7a',38,'thread representing closing connections','threadC','out','on',0,'','',''),(244,'5c2a70684736079187d0fa859452d50b',38,'thread representing open slots','thread_O','out','on',0,'','',''),(245,'4f773f6bf4780287bee71b269b46cc0b',38,'thread representing sending reply','threadW','out','on',0,'','',''),(246,'153216041a58d0f754cbd16bf5974c6c',38,'thread representing waiting','thread_W','out','on',0,'','',''),(247,'25ca706fe7cdc5f9713d4f864dd3f7fa',38,'CPU Load of Web Server','apache_cpuload','out','on',0,'','','');
/*!40000 ALTER TABLE `data_input_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_local`
--

DROP TABLE IF EXISTS `data_local`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_local` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) NOT NULL default '0',
  `snmp_index` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=376 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_local`
--

LOCK TABLES `data_local` WRITE;
/*!40000 ALTER TABLE `data_local` DISABLE KEYS */;
INSERT INTO `data_local` VALUES (20,15,1,0,''),(21,49,1,0,''),(19,13,1,0,''),(22,51,1,0,''),(23,11,1,0,''),(24,17,1,0,''),(25,16,1,0,''),(375,18,10,0,''),(374,17,10,0,''),(373,11,10,0,''),(372,37,10,0,''),(371,34,10,0,''),(370,47,10,0,''),(369,33,10,0,''),(368,31,10,0,''),(367,32,10,0,''),(366,30,10,0,''),(365,3,10,0,''),(364,15,10,0,''),(363,13,10,0,''),(362,16,10,0,''),(361,5,10,0,''),(360,4,10,0,''),(359,6,10,0,''),(358,18,56,0,''),(357,18,54,0,''),(356,18,53,0,''),(355,18,52,0,''),(354,18,51,0,''),(353,18,50,0,''),(352,18,48,0,''),(351,18,47,0,''),(350,18,46,0,''),(349,18,45,0,''),(348,18,44,0,''),(347,18,43,0,''),(346,18,42,0,''),(345,18,41,0,''),(344,17,8,0,''),(343,16,9,0,''),(342,17,9,0,''),(341,11,9,0,''),(340,16,8,0,''),(339,11,8,0,''),(338,18,8,0,''),(337,18,37,0,''),(336,18,36,0,''),(335,18,35,0,''),(334,18,33,0,''),(333,18,28,0,''),(331,18,31,0,''),(330,18,32,0,''),(332,18,27,0,''),(328,18,29,0,''),(327,18,25,0,''),(325,18,18,0,''),(324,18,23,0,''),(322,18,19,0,''),(321,18,20,0,''),(318,18,24,0,''),(311,71,12,0,''),(310,72,12,0,''),(309,81,12,0,''),(308,80,12,0,''),(307,78,12,0,''),(306,73,12,0,''),(305,74,12,0,''),(304,70,12,0,''),(303,76,12,0,''),(302,83,12,0,''),(301,82,12,0,''),(300,77,12,0,''),(299,79,12,0,''),(298,85,12,0,''),(297,86,12,0,''),(296,84,12,0,''),(295,87,12,0,''),(294,89,12,0,''),(293,90,12,0,''),(292,91,12,0,''),(291,88,12,0,''),(290,75,12,0,''),(289,5,12,0,''),(288,4,12,0,''),(287,6,12,0,''),(320,18,21,0,''),(319,18,22,0,''),(276,41,12,1,'6'),(275,41,12,1,'1'),(274,71,5,0,''),(273,72,5,0,''),(272,81,5,0,''),(271,80,5,0,''),(326,18,26,0,''),(239,71,1,0,''),(238,72,1,0,''),(237,81,1,0,''),(236,70,1,0,''),(235,83,1,0,''),(234,82,1,0,''),(233,79,1,0,''),(232,85,1,0,''),(231,86,1,0,''),(230,84,1,0,''),(229,87,1,0,''),(194,41,10,1,'2'),(195,41,10,1,'3'),(196,6,10,0,''),(197,4,10,0,''),(198,5,10,0,''),(199,75,10,0,''),(200,41,11,1,'4'),(201,41,12,1,'2'),(202,41,12,1,'3'),(203,41,12,1,'4'),(204,41,12,1,'5'),(205,41,15,1,'4'),(206,41,14,1,'2'),(207,41,1,1,'2'),(208,41,1,1,'1'),(209,6,1,0,''),(210,4,1,0,''),(211,5,1,0,''),(212,75,1,0,''),(213,77,1,0,''),(214,76,1,0,''),(215,74,1,0,''),(216,73,1,0,''),(217,78,1,0,''),(218,80,1,0,''),(219,41,10,1,'1'),(220,41,10,1,'4'),(221,6,10,0,''),(222,4,10,0,''),(223,5,10,0,''),(224,75,10,0,''),(225,88,1,0,''),(226,91,1,0,''),(227,90,1,0,''),(228,89,1,0,''),(253,75,5,0,''),(246,41,5,1,'1'),(247,41,5,1,'2'),(248,41,5,1,'3'),(249,41,5,1,'4'),(250,6,5,0,''),(251,4,5,0,''),(252,5,5,0,''),(270,78,5,0,''),(269,73,5,0,''),(268,74,5,0,''),(267,70,5,0,''),(266,76,5,0,''),(265,83,5,0,''),(264,82,5,0,''),(263,77,5,0,''),(262,79,5,0,''),(261,85,5,0,''),(260,86,5,0,''),(259,84,5,0,''),(258,87,5,0,''),(257,89,5,0,''),(256,90,5,0,''),(255,91,5,0,''),(254,88,5,0,'');
/*!40000 ALTER TABLE `data_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template`
--

DROP TABLE IF EXISTS `data_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_template` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `name` varchar(150) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_template`
--

LOCK TABLES `data_template` WRITE;
/*!40000 ALTER TABLE `data_template` DISABLE KEYS */;
INSERT INTO `data_template` VALUES (3,'c8a8f50f5f4a465368222594c5709ede','ucd/net - Hard Drive Space'),(4,'cdfed2d401723d2f41fc239d4ce249c7','teMySQL - CPU System'),(5,'a27e816377d2ac6434a87c494559c726','teMySQL - CPU User'),(6,'c06c3d20eccb9598939dc597701ff574','teMySQL - CPU Nice'),(7,'a14f2d6f233b05e64263ff03a5b0b386','Karlnet - Noise Level'),(8,'def1a9019d888ed2ad2e106aa9595ede','Karlnet - Signal Level'),(9,'513a99ae3c9c4413609c1534ffc36eab','Karlnet - Wireless Transmits'),(10,'77404ae93c9cc410f1c2c717e7117378','Karlnet - Wireless Re-Transmits'),(11,'9e72511e127de200733eb502eb818e1d','Unix - Load Average'),(13,'dc33aa9a8e71fb7c61ec0e7a6da074aa','Linux - Memory - Free'),(15,'41f55087d067142d702dd3c73c98f020','Linux - Memory - Free Swap'),(16,'9b8c92d3c32703900ff7dd653bfc9cd8','Unix - Processes'),(17,'c221c2164c585b6da378013a7a6a2c13','Unix - Logged in Users'),(18,'a30a81cb1de65b52b7da542c8df3f188','Unix - Ping Host'),(19,'0de466a1b81dfe581d44ac014b86553a','Netware - Total Users'),(20,'bbe2da0708103029fbf949817d3a4537','Netware - Total Logins'),(22,'e4ac5d5fe73e3c773671c6d0498a8d9d','Netware - File System Reads'),(23,'f29f8c998425eedd249be1e7caf90ceb','Netware - File System Writes'),(24,'7a6216a113e19881e35565312db8a371','Netware - Cache Checks'),(25,'1dbd1251c8e94b334c0e6aeae5ca4b8d','Netware - Cache Hits'),(26,'1a4c5264eb27b5e57acd3160af770a61','Netware - Open Files'),(27,'e9def3a0e409f517cb804dfeba4ccd90','Cisco Router - 5 Minute CPU'),(30,'9b82d44eb563027659683765f92c9757','ucd/net - Load Average - 1 Minute'),(31,'87847714d19f405ff3c74f3341b3f940','ucd/net - Load Average - 5 Minute'),(32,'308ac157f24e2763f8cd828a80b3e5ff','ucd/net - Load Average - 15 Minute'),(33,'797a3e92b0039841b52e441a2823a6fb','ucd/net - Memory - Buffers'),(34,'fa15932d3cab0da2ab94c69b1a9f5ca7','ucd/net - Memory - Free'),(35,'6ce4ab04378f9f3b03ee0623abb6479f','Netware - Volumes'),(36,'03060555fab086b8412bbf9951179cd9','Netware - Directory Entries'),(37,'e4ac6919d4f6f21ec5b281a1d6ac4d4e','Unix - Hard Drive Space'),(38,'36335cd98633963a575b70639cd2fdad','Interface - Errors/Discards'),(39,'2f654f7d69ac71a5d56b1db8543ccad3','Interface - Unicast Packets'),(40,'c84e511401a747409053c90ba910d0fe','Interface - Non-Unicast Packets'),(41,'6632e1e0b58a565c135d7ff90440c335','Interface - Traffic'),(42,'1d17325f416b262921a0b55fe5f7e31d','Netware - CPU Utilization'),(43,'d814fa3b79bd0f8933b6e0834d3f16d0','Host MIB - Hard Drive Space'),(44,'f6e7d21c19434666bbdac00ccef9932f','Host MIB - CPU Utilization'),(45,'f383db441d1c246cff8482f15e184e5f','Host MIB - Processes'),(46,'2ef027cc76d75720ee5f7a528f0f1fda','Host MIB - Logged in Users'),(47,'a274deec1f78654dca6c446ba75ebca4','ucd/net - Memory - Cache'),(48,'d429e4a6019c91e6e84562593c1968ca','SNMP - Generic OID Template'),(49,'e6b434046f851853292fac0b514c7947','Local - Poller Statistics'),(50,'ce5e522013999d902afcbd1c93e9afa6','Win Services'),(51,'dc0147f0499341197c6f4e6c387c91b5','Localhost - Syslog Messages'),(52,'16953299c816e3fcec10861d2ec8c2d5','Cisco 3000 - Sessions (Lan2Lan)'),(53,'7caac5ea003eff62a7e2d4972e3c6eac','Cisco 3000 - Sessions (Management)'),(54,'d3dbadd342cc435689dcacf4ce1056b1','Cisco 3000 - Sessions (Remote Access)'),(55,'c48ed0af8d18298827de98a206fba15d','Cisco 3000 - Sessions (Total)'),(56,'881b165483b732eb3d71e06b409e3c6b','IIS - Bytes Sent'),(57,'e3e046d922c50ff95321e725614ab547','IIS - Bytes Received'),(58,'c75b81f26e79c46205ac2b7cde4a2023','Cisco Aironet 1200 - Associations'),(59,'a0a93dbcd4f2eeba09127e967dc7eb43','Cisco Switch - 1 Minute CPU CatOS'),(60,'ddb4d59f65214d7853110b57a4fbc602','Cisco Switch- 5 Minute CPU CatOS'),(61,'9c1ae8553b4c930ae4fbc55f09facbbb','Cisco Switch - 5 second cpu CatOS'),(62,'5026bd72d798b75b994e5924eda06c5b','Cisco Switch Load'),(63,'3bb3025535e598b7c84fd2105723f165','Cisco router - ProcMem usage'),(64,'03aaaddc697e9a04cc38491c9a1035f0','Cisco Router - I/O Mem Free'),(65,'1024a5279553445e2e9f1a86fe67dfab','Cisco Router - Proc Mem Free'),(66,'5c00764e1b182c1357aaf487b883b5b1','Cisco VPN - 5 Minute CPU'),(67,'cc0f225ced4da6759f1f481625b1b722','Cisco VPN - 5 Minute Temp Current'),(68,'015fa021dccfcd820f729b82386b257b','Cisco VPN - Actives Session Count'),(69,'d57b89981b05f1ffb47afe9a5be326fa','Cisco VPN - Actives Session Count Max'),(70,'a29f91bacb9868dde6dc7fd620b42359','teMySQL - Replication'),(71,'f3e4f8455e9bf137bde9c420a4b54583','teMySQL - Volatile Queries'),(72,'c6aff2cc948041d9c01ed1772cf187e4','teMySQL - Volatile Handler'),(73,'4cd8f188aa594f06f6b09240a08ec49f','teMySQL - Select Queries'),(74,'072bd5f771d82e75b2a4213e25867b16','teMySQL - Select Handler'),(75,'acf7b61b15de003e53474e0ca979f6a0','teMySQL - Index Usage'),(76,'1069b79147575b2390b5b9e8ed70448e','teMySQL - Query Cache'),(77,'ddafd3fc96f37bfd171606c86721e989','teMySQL - Network Usage'),(78,'f482816eb9e88d11410745c2841b31b3','teMySQL - Sorts'),(79,'3bd9ee6874e3d14a72992d6bfe1b6b94','teMySQL - Locking and Slow'),(80,'d6c7d8b124d421c57ed69dfb9a4c5058','teMySQL - Temporary Objects'),(81,'1e57d4bfb48684ce82700efd421a45ae','teMySQL - Threads/Abends'),(82,'ff2afbe04fbd223aac99e293d2e79367','MySQL - Command statistics'),(83,'f8934333d8237bbd4608b18a6fb8f068','MySQL - Handler statistics'),(84,'a9323be2d01efea461d38586c3e45cd0','teMySQL - Load Average_1'),(85,'bbdbd29d87854b481aee8fd11e1291ca','teMySQL - Load Average_5'),(86,'e8f0933cbdc86521b7cff7a4cb40ed36','teMySQL - Load Average_15'),(87,'fe19f1af739ee6897464f1b1ac1d70f7','teMySQL - InnoDB Row'),(88,'70addac1afdb397f4aefd67f8bce5385','teMySQL - InnoDB Buffer Pages/Mem'),(89,'45a0b8da8406fbb431677ccbaa415ee0','teMySQL - InnoDB Locks'),(90,'595e328807065c7525e868ebf537c7ef','teMySQL - InnoDB InsBuffer'),(91,'9e50eb776015eb6d92423757750fe829','teMySQL - InnoDB File I/O'),(92,'df69152aba554b7446ca03bf6074d1a2','memcached - Resource Usage'),(93,'81d4ed993862bb82ebc377a0bc3e2f14','memcached - Count Stats'),(94,'480c31002e10a6f43eddf87e1e5a3b03','memcached - Memory/Structures'),(95,'62fe4db2c4c3653ba45dc19bca29eaa5','HTTP Reponse Time'),(96,'baf84a3e18db7bca70cef0129ed194a9','TCP Reponse Time'),(97,'3ccf6aed08420ea699b67091d1bdfdcf','Unix - Multi Ping Host'),(98,'587c560e4feeb037f573398093f8a3b6','HTTP Reponse Time (nrpe)'),(99,'544a959aa7d9d89a6421f8c79ba65eba','WebServer - Apache Statistics');
/*!40000 ALTER TABLE `data_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template_data`
--

DROP TABLE IF EXISTS `data_template_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_template_data` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `local_data_template_data_id` mediumint(8) unsigned NOT NULL default '0',
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_input_id` mediumint(8) unsigned NOT NULL default '0',
  `t_name` char(2) default NULL,
  `name` varchar(250) NOT NULL default '',
  `name_cache` varchar(255) NOT NULL default '',
  `data_source_path` varchar(255) default NULL,
  `t_active` char(2) default NULL,
  `active` char(2) default NULL,
  `t_rrd_step` char(2) default NULL,
  `rrd_step` mediumint(8) unsigned NOT NULL default '0',
  `t_rra_id` char(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=489 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_template_data`
--

LOCK TABLES `data_template_data` WRITE;
/*!40000 ALTER TABLE `data_template_data` DISABLE KEYS */;
INSERT INTO `data_template_data` VALUES (3,0,0,3,2,'on','|host_description| - Hard Drive Space','',NULL,'','on','',300,''),(4,0,0,4,1,'','|host_description| - teMySQL - CPU System','',NULL,'','on','',60,''),(5,0,0,5,1,'','|host_description| - teMySQL - CPU User','',NULL,'','on','',60,''),(6,0,0,6,1,'','|host_description| teMySQL - CPU Nice','',NULL,'','on','',60,''),(7,0,0,7,2,'on','|host_description| - Noise Level','',NULL,'','on','',300,''),(8,0,0,8,2,'on','|host_description| - Signal Level','',NULL,'','on','',300,''),(9,0,0,9,2,'on','|host_description| - Wireless Transmits','',NULL,'','on','',300,''),(10,0,0,10,2,'on','|host_description| - Wireless Re-Transmits','',NULL,'','on','',300,''),(11,0,0,11,4,'','|host_description| - Load Average','',NULL,'','on','',60,''),(13,0,0,13,6,'','|host_description| - Memory - Free','',NULL,'','on','',60,''),(15,0,0,15,6,'','|host_description| - Memory - Free Swap','',NULL,'','on','',60,''),(16,0,0,16,7,'','|host_description| - Processes','',NULL,'','on','',60,''),(17,0,0,17,5,'','|host_description| - Logged in Users','',NULL,'','on','',300,''),(18,0,0,18,10,'','|host_description| - Ping Host','',NULL,'','on','',300,''),(19,0,0,19,1,'','|host_description| - Total Users','',NULL,'','on','',300,''),(20,0,0,20,1,'','|host_description| - Total Logins','',NULL,'','on','',300,''),(58,0,0,45,1,'','|host_description| - Processes','',NULL,'','on','',300,''),(22,0,0,22,1,'','|host_description| - File System Reads','',NULL,'','on','',300,''),(23,0,0,23,1,'','|host_description| - File System Writes','',NULL,'','on','',300,''),(24,0,0,24,1,'','|host_description| - Cache Checks','',NULL,'','on','',300,''),(25,0,0,25,1,'','|host_description| - Cache Hits','',NULL,'','on','',300,''),(26,0,0,26,1,'','|host_description| - Open Files','',NULL,'','on','',300,''),(27,0,0,27,1,'','|host_description| - 5 Minute CPU','',NULL,'','on','',300,''),(69,0,0,48,1,'on','|host_description| -','',NULL,'','on','',300,''),(68,0,0,47,1,'','|host_description| - Memory - Cache','',NULL,'','on','',300,''),(30,0,0,30,1,'','|host_description| - Load Average - 1 Minute','',NULL,'','on','',300,''),(31,0,0,31,1,'','|host_description| - Load Average - 5 Minute','',NULL,'','on','',300,''),(32,0,0,32,1,'','|host_description| - Load Average - 15 Minute','',NULL,'','on','',300,''),(33,0,0,33,1,'','|host_description| - Memory - Buffers','',NULL,'','on','',300,''),(34,0,0,34,1,'','|host_description| - Memory - Free','',NULL,'','on','',300,''),(35,0,0,35,2,'on','|host_description| - Volumes','',NULL,'','on','',300,''),(36,0,0,36,2,'on','|host_description| - Directory Entries','',NULL,'','on','',300,''),(37,0,0,37,11,'on','|host_description| - Hard Drive Space','',NULL,'','on','',300,''),(38,0,0,38,2,'on','|host_description| - Errors/Discards','',NULL,'','on','',300,''),(39,0,0,39,2,'on','|host_description| - Unicast Packets','',NULL,'','on','',300,''),(40,0,0,40,2,'on','|host_description| - Non-Unicast Packets','',NULL,'','on','',300,''),(41,0,0,41,2,'on','|host_description| - Traffic','',NULL,'','on','',60,''),(55,0,0,42,2,'','|host_description| - CPU Utilization','',NULL,'','on','',300,''),(56,0,0,43,12,'','|host_description| - Hard Drive Space','',NULL,'','on','',300,''),(57,0,0,44,12,'','|host_description| - CPU Utilization','',NULL,'','on','',300,''),(59,0,0,46,1,'','|host_description| - Logged in Users','',NULL,'','on','',300,''),(106,11,23,11,4,NULL,'|host_description| - Load Average','Localhost - Load Average','<path_rra>/localhost_load_1min_23.rrd',NULL,'on',NULL,60,NULL),(107,17,24,17,5,NULL,'|host_description| - Logged in Users','Localhost - Logged in Users','<path_rra>/localhost_users_24.rrd',NULL,'on',NULL,300,NULL),(108,16,25,16,7,NULL,'|host_description| - Processes','Localhost - Processes','<path_rra>/localhost_proc_25.rrd',NULL,'on',NULL,60,NULL),(103,15,20,15,6,NULL,'|host_description| - Memory - Free Swap','Localhost - Memory - Free Swap','<path_rra>/localhost_mem_swap_20.rrd',NULL,'on',NULL,60,NULL),(104,70,21,49,13,NULL,'Local - Poller Statistics','Local - Poller Statistics','<path_rra>/localhost_rrdsprocessed_21.rrd',NULL,'on',NULL,60,NULL),(70,0,0,49,13,'','Local - Poller Statistics','',NULL,'','on','',60,''),(71,0,0,50,12,'on','|host_description| - Services','',NULL,'','on','',300,''),(73,0,0,51,14,'','|host_description| - Syslog Messages','',NULL,'','on','',60,''),(75,0,0,52,1,'','|host_description| - Sessions (Lan2Lan)','',NULL,'','on','',300,''),(76,0,0,53,1,'','|host_description| - Sessions (Management)','',NULL,'','on','',300,''),(77,0,0,54,1,'','|host_description| - Sessions (Remote Access)','',NULL,'','on','',300,''),(78,0,0,55,1,'','|host_description| - Sessions (Total)','',NULL,'','on','',300,''),(79,0,0,56,1,'','|host_description| - IIS Bytes Sent','',NULL,'','on','',300,''),(80,0,0,57,1,'','|host_description| - IIS Bytes Received','',NULL,'','on','',300,''),(81,0,0,58,1,'','|host_description| - Associations','',NULL,'','on','',300,''),(82,0,0,59,1,'on','|host_description| - 1 Minute CPU','',NULL,'','on','',300,''),(83,0,0,60,1,'on','|host_description| - 5 Minute CPU','',NULL,'','on','',300,''),(84,0,0,61,1,'on','|host_description| - 5 second cpu','',NULL,'','on','',300,''),(85,0,0,62,1,'on','|host_description| - switch load','',NULL,'','on','',300,''),(86,0,0,63,1,'','|host_description| - ProcMem usage','',NULL,'','on','',300,''),(87,0,0,64,1,'on','|host_description| - I/O Mem Free','',NULL,'','on','',300,''),(88,0,0,65,1,'on','|host_description| - Proc Mem Free','',NULL,'','on','',300,''),(89,0,0,66,1,'on','|host_description| - 5 Minute CPU','',NULL,'','on','',300,''),(90,0,0,67,1,'','|host_description| - 5 Minute Temperature','',NULL,'','on','',300,''),(91,0,0,68,1,'','|host_description| - Actives Session Count','',NULL,'','on','',300,''),(92,0,0,69,1,'','|host_description| - Actives Session Count Max','',NULL,'','on','',300,''),(105,73,22,51,14,NULL,'|host_description| - Syslog Messages','Localhost - Syslog Messages','<path_rra>/localhost_total_22.rrd',NULL,'on',NULL,60,NULL),(102,13,19,13,6,NULL,'|host_description| - Memory - Free','Localhost - Memory - Free','<path_rra>/localhost_mem_buffers_19.rrd',NULL,'on',NULL,60,NULL),(411,258,299,79,24,NULL,'|host_description| - Locking and Slow','JATINEGARA 1 - Locking and Slow','<path_rra>/jatinegara_1_table_locks_immedia_299.rrd',NULL,'on',NULL,60,NULL),(409,265,297,86,1,NULL,'|host_description| - teMySQL - Load Average_15','JATINEGARA 1 - teMySQL - Load Average_15','<path_rra>/jatinegara_1_loadavg_15_297.rrd',NULL,'on',NULL,60,NULL),(410,264,298,85,1,NULL,'|host_description| - teMySQL - Load Average_5','JATINEGARA 1 - teMySQL - Load Average_5','<path_rra>/jatinegara_1_loadavg_5_298.rrd',NULL,'on',NULL,60,NULL),(408,263,296,84,1,NULL,'|host_description| - teMySQL - Load Average_1','JATINEGARA 1 - teMySQL - Load Average_1','<path_rra>/jatinegara_1_loadavg_1_296.rrd',NULL,'on',NULL,60,NULL),(407,266,295,87,29,NULL,'|host_description| - InnoDB Row','JATINEGARA 1 - InnoDB Row','<path_rra>/jatinegara_1_rows_read_295.rrd',NULL,'on',NULL,60,NULL),(406,268,294,89,31,NULL,'|host_description| - InnoDB Locks','JATINEGARA 1 - InnoDB Locks','<path_rra>/jatinegara_1_os_waits_294.rrd',NULL,'on',NULL,60,NULL),(405,269,293,90,30,NULL,'|host_description| - teMySQL - InnoDB InsBuffer','JATINEGARA 1 - teMySQL - InnoDB InsBuffer','<path_rra>/jatinegara_1_insbuffer_merged_293.rrd',NULL,'on',NULL,60,NULL),(404,270,292,91,32,NULL,'|host_description| - InnoDB File I/O','JATINEGARA 1 - InnoDB File I/O','<path_rra>/jatinegara_1_file_writes_292.rrd',NULL,'on',NULL,60,NULL),(403,267,291,88,30,NULL,'|host_description| - teMySQL - InnoDB Buffer PgMem','JATINEGARA 1 - teMySQL - InnoDB Buffer PgMem','<path_rra>/jatinegara_1_free_pages_291.rrd',NULL,'on',NULL,60,NULL),(402,254,290,75,20,NULL,'|host_description| - IndexUsage','JATINEGARA 1 - IndexUsage','<path_rra>/jatinegara_1_key_read_requests_290.rrd',NULL,'on',NULL,60,NULL),(401,5,289,5,1,NULL,'|host_description| - teMySQL - CPU User','JATINEGARA 1 - teMySQL - CPU User','<path_rra>/jatinegara_1_cpu_user_289.rrd',NULL,'on',NULL,60,NULL),(400,4,288,4,1,NULL,'|host_description| - teMySQL - CPU System','JATINEGARA 1 - teMySQL - CPU System','<path_rra>/jatinegara_1_cpu_system_288.rrd',NULL,'on',NULL,60,NULL),(461,18,349,18,10,NULL,'|host_description| - Ping Host','EMS D6 BPP - Ping Host','<path_rra>/ems_d6_bpp_ping_349.rrd',NULL,'on',NULL,300,NULL),(399,6,287,6,1,NULL,'|host_description| teMySQL - CPU Nice','JATINEGARA 1 teMySQL - CPU Nice','<path_rra>/jatinegara_1_cpu_nice_287.rrd',NULL,'on',NULL,60,NULL),(460,18,348,18,10,NULL,'|host_description| - Ping Host','EMS D6 BJM - Ping Host','<path_rra>/ems_d6_bjm_ping_348.rrd',NULL,'on',NULL,300,NULL),(387,0,0,97,36,'','|host_description| - Multi Ping','',NULL,'','on','',60,''),(388,0,0,98,37,'','<ip> - HTTP Reponse Time (nrpe)','',NULL,'','on','',60,''),(386,41,276,41,2,NULL,'|host_description| - Traffic - sit0','JATINEGARA 1 - Traffic - sit0','<path_rra>/jatinegara_1_traffic_in_276.rrd',NULL,'on',NULL,60,NULL),(385,41,275,41,2,NULL,'|host_description| - Traffic - 127.0.0.1 - lo','JATINEGARA 1 - Traffic - 127.0.0.1 - lo','<path_rra>/jatinegara_1_traffic_in_275.rrd',NULL,'on',NULL,60,NULL),(384,250,274,71,16,NULL,'|host_description| - Volatile Queries','OS3  Divre 2 - Volatile Queries','<path_rra>/os3_divre_2_com_delete_274.rrd',NULL,'on',NULL,60,NULL),(383,251,273,72,17,NULL,'|host_description| - Volatile Handler','OS3  Divre 2 - Volatile Handler','<path_rra>/os3_divre_2_handler_commit_273.rrd',NULL,'on',NULL,60,NULL),(382,260,272,81,26,NULL,'|host_description| - Threads and Abends','OS3  Divre 2 - Threads and Abends','<path_rra>/os3_divre_2_threads_cached_272.rrd',NULL,'on',NULL,60,NULL),(381,259,271,80,25,NULL,'|host_description| - Temp Objects','OS3  Divre 2 - Temp Objects','<path_rra>/os3_divre_2_createdtmpdisktable_271.rrd',NULL,'on',NULL,60,NULL),(438,18,326,18,10,NULL,'|host_description| - Ping Host','EMS D2 BEKASI - Ping Host','<path_rra>/ems_d2_bekasi_huawei_ping_326.rrd',NULL,'on',NULL,300,NULL),(380,257,270,78,23,NULL,'|host_description| - Sorts','OS3  Divre 2 - Sorts','<path_rra>/os3_divre_2_sort_merge_passes_270.rrd',NULL,'on',NULL,60,NULL),(348,0,0,95,34,'','|host_description| - HTTP Reponse Time','',NULL,'','on','',60,''),(349,0,0,96,35,'','|host_description| - TCP Reponse Time','',NULL,'','on','',60,''),(347,250,239,71,16,NULL,'|host_description| - Volatile Queries','Localhost - Volatile Queries','<path_rra>/localhost_com_delete_239.rrd',NULL,'on',NULL,60,NULL),(346,251,238,72,17,NULL,'|host_description| - Volatile Handler','Localhost - Volatile Handler','<path_rra>/localhost_handler_commit_238.rrd',NULL,'on',NULL,60,NULL),(345,260,237,81,26,NULL,'|host_description| - Threads and Abends','Localhost - Threads and Abends','<path_rra>/localhost_threads_cached_237.rrd',NULL,'on',NULL,60,NULL),(344,249,236,70,15,NULL,'|host_description| - teMySQL - Replication','Localhost - teMySQL - Replication','<path_rra>/localhost_binlogcacheuse_236.rrd',NULL,'on',NULL,60,NULL),(343,262,235,83,28,NULL,'|host_description| - MySQL - Handler statistics','Localhost - MySQL - Handler statistics','<path_rra>/localhost_read_key_235.rrd',NULL,'on',NULL,60,NULL),(342,261,234,82,27,NULL,'|host_description| - MySQL - Command statistics','Localhost - MySQL - Command statistics','<path_rra>/localhost_select_234.rrd',NULL,'on',NULL,60,NULL),(341,258,233,79,24,NULL,'|host_description| - Locking and Slow','Localhost - Locking and Slow','<path_rra>/localhost_table_locks_immedia_233.rrd',NULL,'on',NULL,60,NULL),(340,264,232,85,1,NULL,'|host_description| - teMySQL - Load Average_5','Localhost - teMySQL - Load Average_5','<path_rra>/localhost_loadavg_5_232.rrd',NULL,'on',NULL,60,NULL),(339,265,231,86,1,NULL,'|host_description| - teMySQL - Load Average_15','Localhost - teMySQL - Load Average_15','<path_rra>/localhost_loadavg_15_231.rrd',NULL,'on',NULL,60,NULL),(338,263,230,84,1,NULL,'|host_description| - teMySQL - Load Average_1','Localhost - teMySQL - Load Average_1','<path_rra>/localhost_loadavg_1_230.rrd',NULL,'on',NULL,60,NULL),(337,266,229,87,29,NULL,'|host_description| - InnoDB Row','Localhost - InnoDB Row','<path_rra>/localhost_rows_read_229.rrd',NULL,'on',NULL,60,NULL),(336,268,228,89,31,NULL,'|host_description| - InnoDB Locks','Localhost - InnoDB Locks','<path_rra>/localhost_os_waits_228.rrd',NULL,'on',NULL,60,NULL),(335,269,227,90,30,NULL,'|host_description| - teMySQL - InnoDB InsBuffer','Localhost - teMySQL - InnoDB InsBuffer','<path_rra>/localhost_insbuffer_merged_227.rrd',NULL,'on',NULL,60,NULL),(334,270,226,91,32,NULL,'|host_description| - InnoDB File I/O','Localhost - InnoDB File I/O','<path_rra>/localhost_file_writes_226.rrd',NULL,'on',NULL,60,NULL),(333,267,225,88,30,NULL,'|host_description| - teMySQL - InnoDB Buffer PgMem','Localhost - teMySQL - InnoDB Buffer PgMem','<path_rra>/localhost_free_pages_225.rrd',NULL,'on',NULL,60,NULL),(332,254,224,75,20,NULL,'|host_description| - IndexUsage','DEV-OS3-V2 - DIVRE 2  - IndexUsage','<path_rra>/dev-os3-v2_-_divre_2__key_read_requests_224.rrd',NULL,'on',NULL,60,NULL),(331,5,223,5,1,NULL,'|host_description| - teMySQL - CPU User','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU User','<path_rra>/dev-os3-v2_-_divre_2__cpu_user_223.rrd',NULL,'on',NULL,60,NULL),(330,4,222,4,1,NULL,'|host_description| - teMySQL - CPU System','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU System','<path_rra>/dev-os3-v2_-_divre_2__cpu_system_222.rrd',NULL,'on',NULL,60,NULL),(329,6,221,6,1,NULL,'|host_description| teMySQL - CPU Nice','DEV-OS3-V2 - DIVRE 2  teMySQL - CPU Nice','<path_rra>/dev-os3-v2_-_divre_2__cpu_nice_221.rrd',NULL,'on',NULL,60,NULL),(328,41,220,41,2,NULL,'|host_description| - Traffic - sit0','DEV-OS3-V2 - DIVRE 2  - Traffic - sit0','<path_rra>/dev-os3-v2_-_divre_2__traffic_in_220.rrd',NULL,'on',NULL,60,NULL),(327,41,219,41,2,NULL,'|host_description| - Traffic - 127.0.0.1/lo','DEV-OS3-V2 - DIVRE 2  - Traffic - 127.0.0.1/lo','<path_rra>/dev-os3-v2_-_divre_2__traffic_in_219.rrd',NULL,'on',NULL,60,NULL),(326,259,218,80,25,NULL,'|host_description| - Temp Objects','Localhost - Temp Objects','<path_rra>/localhost_createdtmpdisktable_218.rrd',NULL,'on',NULL,60,NULL),(325,257,217,78,23,NULL,'|host_description| - Sorts','Localhost - Sorts','<path_rra>/localhost_sort_merge_passes_217.rrd',NULL,'on',NULL,60,NULL),(324,252,216,73,18,NULL,'|host_description| - Select Queries','Localhost - Select Queries','<path_rra>/localhost_com_select_216.rrd',NULL,'on',NULL,60,NULL),(323,253,215,74,19,NULL,'|host_description| - Select Handler','Localhost - Select Handler','<path_rra>/localhost_handler_read_first_215.rrd',NULL,'on',NULL,60,NULL),(322,255,214,76,21,NULL,'|host_description| - Query Cache','Localhost - Query Cache','<path_rra>/localhost_qcache_free_blocks_214.rrd',NULL,'on',NULL,60,NULL),(321,256,213,77,22,NULL,'|host_description| - Network Usage','Localhost - Network Usage','<path_rra>/localhost_questions_213.rrd',NULL,'on',NULL,60,NULL),(320,254,212,75,20,NULL,'|host_description| - IndexUsage','Localhost - IndexUsage','<path_rra>/localhost_key_read_requests_212.rrd',NULL,'on',NULL,60,NULL),(318,4,210,4,1,NULL,'|host_description| - teMySQL - CPU System','Localhost - teMySQL - CPU System','<path_rra>/localhost_cpu_system_210.rrd',NULL,'on',NULL,60,NULL),(319,5,211,5,1,NULL,'|host_description| - teMySQL - CPU User','Localhost - teMySQL - CPU User','<path_rra>/localhost_cpu_user_211.rrd',NULL,'on',NULL,60,NULL),(317,6,209,6,1,NULL,'|host_description| teMySQL - CPU Nice','Localhost teMySQL - CPU Nice','<path_rra>/localhost_cpu_nice_209.rrd',NULL,'on',NULL,60,NULL),(316,41,208,41,2,NULL,'|host_description| - Traffic - 127.0.0.1/lo','Localhost - Traffic - 127.0.0.1/lo','<path_rra>/localhost_traffic_in_208.rrd',NULL,'on',NULL,60,NULL),(315,41,207,41,2,NULL,'|host_description| - Traffic - 10.32.18.200/eth0','Localhost - Traffic - 10.32.18.200/eth0','<path_rra>/localhost_traffic_in_207.rrd',NULL,'on',NULL,60,NULL),(314,41,206,41,2,NULL,'|host_description| - Traffic - 172.16.203.21 - eth0','GAMBIR 1 - Traffic - 172.16.203.21 - eth0','<path_rra>/gambir_1_traffic_in_206.rrd',NULL,'on',NULL,60,NULL),(313,41,205,41,2,NULL,'|host_description| - Traffic - 172.16.203.22 - eth0','GAMBIR 2 - Traffic - 172.16.203.22 - eth0','<path_rra>/gambir_2_traffic_in_205.rrd',NULL,'on',NULL,60,NULL),(312,41,204,41,2,NULL,'|host_description| - Traffic - eth3','JATINEGARA 1 - Traffic - eth3','<path_rra>/jatinegara_1_traffic_in_204.rrd',NULL,'on',NULL,60,NULL),(311,41,203,41,2,NULL,'|host_description| - Traffic - eth2','JATINEGARA 1 - Traffic - eth2','<path_rra>/jatinegara_1_traffic_in_203.rrd',NULL,'on',NULL,60,NULL),(310,41,202,41,2,NULL,'|host_description| - Traffic - eth1','JATINEGARA 1 - Traffic - eth1','<path_rra>/jatinegara_1_traffic_in_202.rrd',NULL,'on',NULL,60,NULL),(309,41,201,41,2,NULL,'|host_description| - Traffic - 172.16.203.11 - eth0','JATINEGARA 1 - Traffic - 172.16.203.11 - eth0','<path_rra>/jatinegara_1_traffic_in_201.rrd',NULL,'on',NULL,60,NULL),(308,41,200,41,2,NULL,'|host_description| - Traffic - 172.16.203.12 - eth0','JATINEGARA 2 - Traffic - 172.16.203.12 - eth0','<path_rra>/jatinegara_1_traffic_in_200.rrd',NULL,'on',NULL,60,NULL),(307,254,199,75,20,NULL,'|host_description| - IndexUsage','DEV-OS3-V2 - DIVRE 2  - IndexUsage','<path_rra>/dev-os3-v2_-_divre_2__key_read_requests_199.rrd',NULL,'on',NULL,60,NULL),(306,5,198,5,1,NULL,'|host_description| - teMySQL - CPU User','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU User','<path_rra>/dev-os3-v2_-_divre_2__cpu_user_198.rrd',NULL,'on',NULL,60,NULL),(305,4,197,4,1,NULL,'|host_description| - teMySQL - CPU System','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU System','<path_rra>/dev-os3-v2_-_divre_2__cpu_system_197.rrd',NULL,'on',NULL,60,NULL),(304,6,196,6,1,NULL,'|host_description| teMySQL - CPU Nice','DEV-OS3-V2 - DIVRE 2  teMySQL - CPU Nice','<path_rra>/dev-os3-v2_-_divre_2__cpu_nice_196.rrd',NULL,'on',NULL,60,NULL),(303,41,195,41,2,NULL,'|host_description| - Traffic - 172.16.203.69/eth1','DEV-OS3-V2 - DIVRE 2  - Traffic - 172.16.203.69/eth1','<path_rra>/dev-os3-v2_-_divre_2__traffic_in_195.rrd',NULL,'on',NULL,60,NULL),(302,41,194,41,2,NULL,'|host_description| - Traffic - 10.32.18.97/eth0','DEV-OS3-V2 - DIVRE 2  - Traffic - 10.32.18.97/eth0','<path_rra>/dev-os3-v2_-_divre_2__traffic_in_194.rrd',NULL,'on',NULL,60,NULL),(249,0,0,70,15,'','|host_description| - teMySQL - Replication','',NULL,'','on','',60,''),(462,18,350,18,10,NULL,'|host_description| - Ping Host','EMS D6 PLK - Ping Host','<path_rra>/ems_d6_plk_ping_350.rrd',NULL,'on',NULL,300,NULL),(463,18,351,18,10,NULL,'|host_description| - Ping Host','  EMS D6 PTK - Ping Host','<path_rra>/_ems_d6_ptk_ping_351.rrd',NULL,'on',NULL,300,NULL),(464,18,352,18,10,NULL,'|host_description| - Ping Host','EMS D6 SMR - Ping Host','<path_rra>/ems_d6_smr_ping_352.rrd',NULL,'on',NULL,300,NULL),(465,18,353,18,10,NULL,'|host_description| - Ping Host','EMS D7 BALI - Ping Host','<path_rra>/ems_d7_bali_ping_353.rrd',NULL,'on',NULL,300,NULL),(466,18,354,18,10,NULL,'|host_description| - Ping Host','EMS D7 GORONTALO - Ping Host','<path_rra>/ems_d7_gorontalo_ping_354.rrd',NULL,'on',NULL,300,NULL),(467,18,355,18,10,NULL,'|host_description| - Ping Host','EMS D7 KENDARI - Ping Host','<path_rra>/ems_d6_kendari_ping_355.rrd',NULL,'on',NULL,300,NULL),(412,256,300,77,22,NULL,'|host_description| - Network Usage','JATINEGARA 1 - Network Usage','<path_rra>/jatinegara_1_questions_300.rrd',NULL,'on',NULL,60,NULL),(413,261,301,82,27,NULL,'|host_description| - MySQL - Command statistics','JATINEGARA 1 - MySQL - Command statistics','<path_rra>/jatinegara_1_select_301.rrd',NULL,'on',NULL,60,NULL),(414,262,302,83,28,NULL,'|host_description| - MySQL - Handler statistics','JATINEGARA 1 - MySQL - Handler statistics','<path_rra>/jatinegara_1_read_key_302.rrd',NULL,'on',NULL,60,NULL),(415,255,303,76,21,NULL,'|host_description| - Query Cache','JATINEGARA 1 - Query Cache','<path_rra>/jatinegara_1_qcache_free_blocks_303.rrd',NULL,'on',NULL,60,NULL),(416,249,304,70,15,NULL,'|host_description| - teMySQL - Replication','JATINEGARA 1 - teMySQL - Replication','<path_rra>/jatinegara_1_binlogcacheuse_304.rrd',NULL,'on',NULL,60,NULL),(417,253,305,74,19,NULL,'|host_description| - Select Handler','JATINEGARA 1 - Select Handler','<path_rra>/jatinegara_1_handler_read_first_305.rrd',NULL,'on',NULL,60,NULL),(418,252,306,73,18,NULL,'|host_description| - Select Queries','JATINEGARA 1 - Select Queries','<path_rra>/jatinegara_1_com_select_306.rrd',NULL,'on',NULL,60,NULL),(419,257,307,78,23,NULL,'|host_description| - Sorts','JATINEGARA 1 - Sorts','<path_rra>/jatinegara_1_sort_merge_passes_307.rrd',NULL,'on',NULL,60,NULL),(420,259,308,80,25,NULL,'|host_description| - Temp Objects','JATINEGARA 1 - Temp Objects','<path_rra>/jatinegara_1_createdtmpdisktable_308.rrd',NULL,'on',NULL,60,NULL),(421,260,309,81,26,NULL,'|host_description| - Threads and Abends','JATINEGARA 1 - Threads and Abends','<path_rra>/jatinegara_1_threads_cached_309.rrd',NULL,'on',NULL,60,NULL),(422,251,310,72,17,NULL,'|host_description| - Volatile Handler','JATINEGARA 1 - Volatile Handler','<path_rra>/jatinegara_1_handler_commit_310.rrd',NULL,'on',NULL,60,NULL),(423,250,311,71,16,NULL,'|host_description| - Volatile Queries','JATINEGARA 1 - Volatile Queries','<path_rra>/jatinegara_1_com_delete_311.rrd',NULL,'on',NULL,60,NULL),(430,18,318,18,10,NULL,'|host_description| - Ping Host','EMS D1 BATAM - Ping Host','<path_rra>/ems_d1_batam_ping_318.rrd',NULL,'on',NULL,300,NULL),(431,18,319,18,10,NULL,'|host_description| - Ping Host','EMS D1 NAD - Ping Host','<path_rra>/ems_d1_nad_ping_319.rrd',NULL,'on',NULL,300,NULL),(432,18,320,18,10,NULL,'|host_description| - Ping Host','EMS D1 PALEMBANG - Ping Host','<path_rra>/ems_d1_palembang_ping_320.rrd',NULL,'on',NULL,300,NULL),(433,18,321,18,10,NULL,'|host_description| - Ping Host','EMS D1 RIDAR - Ping Host','<path_rra>/ems_d1_ridar_ping_321.rrd',NULL,'on',NULL,300,NULL),(434,18,322,18,10,NULL,'|host_description| - Ping Host','EMS D1 SUMBAR - Ping Host','<path_rra>/ems_d1_sumbar_ping_322.rrd',NULL,'on',NULL,300,NULL),(436,18,324,18,10,NULL,'|host_description| - Ping Host','EMS D1 MEDAN - Ping Host','<path_rra>/ems_d1_medan_ping_324.rrd',NULL,'on',NULL,300,NULL),(437,18,325,18,10,NULL,'|host_description| - Ping Host','EMS D1 SUMUT - Ping Host','<path_rra>/ems_d1_sumut_ping_325.rrd',NULL,'on',NULL,300,NULL),(471,6,359,6,1,NULL,'|host_description| teMySQL - CPU Nice','DEV-OS3-V2 - DIVRE 2  teMySQL - CPU Nice','<path_rra>/dev-os3-v2_-_divre_2__cpu_nice_359.rrd',NULL,'on',NULL,60,NULL),(439,18,327,18,10,NULL,'|host_description| - Ping Host','EMS D2 BOGOR - Ping Host','<path_rra>/ems_d2_bogor_huawei_ping_327.rrd',NULL,'on',NULL,300,NULL),(440,18,328,18,10,NULL,'|host_description| - Ping Host','EMS D2 KEBAYORAN - Ping Host','<path_rra>/ems_d2_kebayoran_huawei_ping_328.rrd',NULL,'on',NULL,300,NULL),(444,18,332,18,10,NULL,'|host_description| - Ping Host','EMS D2 GAMBIR - Ping Host','<path_rra>/ems_d2_gambir_huawei_ping_332.rrd',NULL,'on',NULL,300,NULL),(442,18,330,18,10,NULL,'|host_description| - Ping Host','EMS D2 TANGERANG - Ping Host','<path_rra>/ems_d2_tangerang_huawei_ping_330.rrd',NULL,'on',NULL,300,NULL),(443,18,331,18,10,NULL,'|host_description| - Ping Host','EMS D2 SEMANGGI2 - Ping Host','<path_rra>/ems_d2_semanggi2_huawei_ping_331.rrd',NULL,'on',NULL,300,NULL),(445,18,333,18,10,NULL,'|host_description| - Ping Host','EMS D2 JATINEGARA - Ping Host','<path_rra>/ems_d2_jatinegara_huawei_ping_333.rrd',NULL,'on',NULL,300,NULL),(446,18,334,18,10,NULL,'|host_description| - Ping Host','EMS D3 BANDUNG - Ping Host','<path_rra>/ems_d3_bandung_ping_334.rrd',NULL,'on',NULL,300,NULL),(447,18,335,18,10,NULL,'|host_description| - Ping Host','EMS D4 PURWOKERTO - Ping Host','<path_rra>/ems_d4_purwokerto_ping_335.rrd',NULL,'on',NULL,300,NULL),(448,18,336,18,10,NULL,'|host_description| - Ping Host','EMS D4 SEMARANG - Ping Host','<path_rra>/ems_d4_semarang_ping_336.rrd',NULL,'on',NULL,300,NULL),(449,18,337,18,10,NULL,'|host_description| - Ping Host','EMS D4 SOLO - Ping Host','<path_rra>/ems_d4_solo_ping_337.rrd',NULL,'on',NULL,300,NULL),(450,18,338,18,10,NULL,'|host_description| - Ping Host','OS3NAS - APP01 - Ping Host','<path_rra>/os3nas_-_01_ping_338.rrd',NULL,'on',NULL,300,NULL),(451,11,339,11,4,NULL,'|host_description| - Load Average','OS3NAS - APP01 - Load Average','<path_rra>/os3nas_-_01_load_1min_339.rrd',NULL,'on',NULL,60,NULL),(452,16,340,16,7,NULL,'|host_description| - Processes','OS3NAS - APP01 - Processes','<path_rra>/os3nas_-_01_proc_340.rrd',NULL,'on',NULL,60,NULL),(453,11,341,11,4,NULL,'|host_description| - Load Average','OS3NAS - APP02 - Load Average','<path_rra>/os3nas_-_app02_load_1min_341.rrd',NULL,'on',NULL,60,NULL),(454,17,342,17,5,NULL,'|host_description| - Logged in Users','OS3NAS - APP02 - Logged in Users','<path_rra>/os3nas_-_app02_users_342.rrd',NULL,'on',NULL,300,NULL),(455,16,343,16,7,NULL,'|host_description| - Processes','OS3NAS - APP02 - Processes','<path_rra>/os3nas_-_app02_proc_343.rrd',NULL,'on',NULL,60,NULL),(456,17,344,17,5,NULL,'|host_description| - Logged in Users','OS3NAS - APP01 - Logged in Users','<path_rra>/os3nas_-_app01_users_344.rrd',NULL,'on',NULL,300,NULL),(457,18,345,18,10,NULL,'|host_description| - Ping Host','EMS D5 MALANG - Ping Host','<path_rra>/ems_d5_malang_ping_345.rrd',NULL,'on',NULL,300,NULL),(458,18,346,18,10,NULL,'|host_description| - Ping Host','EMS D5 SBB - Ping Host','<path_rra>/ems_d5_sbb_ping_346.rrd',NULL,'on',NULL,300,NULL),(459,18,347,18,10,NULL,'|host_description| - Ping Host','EMS D5 SBT - Ping Host','<path_rra>/ems_d5_sbt_ping_347.rrd',NULL,'on',NULL,300,NULL),(357,41,247,41,2,NULL,'|host_description| - Traffic - 10.32.18.99/eth0','OS3  Divre 2 - Traffic - 10.32.18.99/eth0','<path_rra>/os3_divre_2_traffic_in_247.rrd',NULL,'on',NULL,60,NULL),(356,41,246,41,2,NULL,'|host_description| - Traffic - 127.0.0.1/lo','OS3  Divre 2 - Traffic - 127.0.0.1/lo','<path_rra>/os3_divre_2_traffic_in_246.rrd',NULL,'on',NULL,60,NULL),(250,0,0,71,16,'','|host_description| - Volatile Queries','',NULL,'','on','',60,''),(251,0,0,72,17,'','|host_description| - Volatile Handler','',NULL,'','on','',60,''),(252,0,0,73,18,'','|host_description| - Select Queries','',NULL,'','on','',60,''),(253,0,0,74,19,'','|host_description| - Select Handler','',NULL,'','on','',60,''),(254,0,0,75,20,'','|host_description| - IndexUsage','',NULL,'','on','',60,''),(255,0,0,76,21,'','|host_description| - Query Cache','',NULL,'','on','',60,''),(256,0,0,77,22,'','|host_description| - Network Usage','',NULL,'','on','',60,''),(257,0,0,78,23,'','|host_description| - Sorts','',NULL,'','on','',60,''),(258,0,0,79,24,'','|host_description| - Locking and Slow','',NULL,'','on','',60,''),(259,0,0,80,25,'','|host_description| - Temp Objects','',NULL,'','on','',60,''),(260,0,0,81,26,'','|host_description| - Threads and Abends','',NULL,'','on','',60,''),(261,0,0,82,27,'','|host_description| - MySQL - Command statistics','',NULL,'','on','',60,''),(262,0,0,83,28,'','|host_description| - MySQL - Handler statistics','',NULL,'','on','',60,''),(263,0,0,84,1,'','|host_description| - teMySQL - Load Average_1','',NULL,'','on','',60,''),(264,0,0,85,1,'','|host_description| - teMySQL - Load Average_5','',NULL,'','on','',60,''),(265,0,0,86,1,'','|host_description| - teMySQL - Load Average_15','',NULL,'','on','',60,''),(266,0,0,87,29,'','|host_description| - InnoDB Row','',NULL,'','on','',60,''),(267,0,0,88,30,'','|host_description| - teMySQL - InnoDB Buffer PgMem','',NULL,'','on','',60,''),(268,0,0,89,31,'','|host_description| - InnoDB Locks','',NULL,'','on','',60,''),(269,0,0,90,30,'','|host_description| - teMySQL - InnoDB InsBuffer','',NULL,'','on','',60,''),(270,0,0,91,32,'','|host_description| - InnoDB File I/O','',NULL,'','on','',60,''),(271,0,0,92,33,'','|host_description| - memcached - Resource Usage','',NULL,'','on','',60,''),(272,0,0,93,33,'','|host_description| - memcached - Count Stats','',NULL,'','on','',60,''),(273,0,0,94,33,'','|host_description| - memcached - Memory/Structures','',NULL,'','on','',60,''),(379,252,269,73,18,NULL,'|host_description| - Select Queries','OS3  Divre 2 - Select Queries','<path_rra>/os3_divre_2_com_select_269.rrd',NULL,'on',NULL,60,NULL),(377,249,267,70,15,NULL,'|host_description| - teMySQL - Replication','OS3  Divre 2 - teMySQL - Replication','<path_rra>/os3_divre_2_binlogcacheuse_267.rrd',NULL,'on',NULL,60,NULL),(378,253,268,74,19,NULL,'|host_description| - Select Handler','OS3  Divre 2 - Select Handler','<path_rra>/os3_divre_2_handler_read_first_268.rrd',NULL,'on',NULL,60,NULL),(376,255,266,76,21,NULL,'|host_description| - Query Cache','OS3  Divre 2 - Query Cache','<path_rra>/os3_divre_2_qcache_free_blocks_266.rrd',NULL,'on',NULL,60,NULL),(375,262,265,83,28,NULL,'|host_description| - MySQL - Handler statistics','OS3  Divre 2 - MySQL - Handler statistics','<path_rra>/os3_divre_2_read_key_265.rrd',NULL,'on',NULL,60,NULL),(374,261,264,82,27,NULL,'|host_description| - MySQL - Command statistics','OS3  Divre 2 - MySQL - Command statistics','<path_rra>/os3_divre_2_select_264.rrd',NULL,'on',NULL,60,NULL),(373,256,263,77,22,NULL,'|host_description| - Network Usage','OS3  Divre 2 - Network Usage','<path_rra>/os3_divre_2_questions_263.rrd',NULL,'on',NULL,60,NULL),(372,258,262,79,24,NULL,'|host_description| - Locking and Slow','OS3  Divre 2 - Locking and Slow','<path_rra>/os3_divre_2_table_locks_immedia_262.rrd',NULL,'on',NULL,60,NULL),(370,265,260,86,1,NULL,'|host_description| - teMySQL - Load Average_15','OS3  Divre 2 - teMySQL - Load Average_15','<path_rra>/os3_divre_2_loadavg_15_260.rrd',NULL,'on',NULL,60,NULL),(371,264,261,85,1,NULL,'|host_description| - teMySQL - Load Average_5','OS3  Divre 2 - teMySQL - Load Average_5','<path_rra>/os3_divre_2_loadavg_5_261.rrd',NULL,'on',NULL,60,NULL),(369,263,259,84,1,NULL,'|host_description| - teMySQL - Load Average_1','OS3  Divre 2 - teMySQL - Load Average_1','<path_rra>/os3_divre_2_loadavg_1_259.rrd',NULL,'on',NULL,60,NULL),(368,266,258,87,29,NULL,'|host_description| - InnoDB Row','OS3  Divre 2 - InnoDB Row','<path_rra>/os3_divre_2_rows_read_258.rrd',NULL,'on',NULL,60,NULL),(367,268,257,89,31,NULL,'|host_description| - InnoDB Locks','OS3  Divre 2 - InnoDB Locks','<path_rra>/os3_divre_2_os_waits_257.rrd',NULL,'on',NULL,60,NULL),(366,269,256,90,30,NULL,'|host_description| - teMySQL - InnoDB InsBuffer','OS3  Divre 2 - teMySQL - InnoDB InsBuffer','<path_rra>/os3_divre_2_insbuffer_merged_256.rrd',NULL,'on',NULL,60,NULL),(365,270,255,91,32,NULL,'|host_description| - InnoDB File I/O','OS3  Divre 2 - InnoDB File I/O','<path_rra>/os3_divre_2_file_writes_255.rrd',NULL,'on',NULL,60,NULL),(364,267,254,88,30,NULL,'|host_description| - teMySQL - InnoDB Buffer PgMem','OS3  Divre 2 - teMySQL - InnoDB Buffer PgMem','<path_rra>/os3_divre_2_free_pages_254.rrd',NULL,'on',NULL,60,NULL),(363,254,253,75,20,NULL,'|host_description| - IndexUsage','OS3  Divre 2 - IndexUsage','<path_rra>/os3_divre_2_key_read_requests_253.rrd',NULL,'on',NULL,60,NULL),(362,5,252,5,1,NULL,'|host_description| - teMySQL - CPU User','OS3  Divre 2 - teMySQL - CPU User','<path_rra>/os3_divre_2_cpu_user_252.rrd',NULL,'on',NULL,60,NULL),(360,6,250,6,1,NULL,'|host_description| teMySQL - CPU Nice','OS3  Divre 2 teMySQL - CPU Nice','<path_rra>/os3_divre_2_cpu_nice_250.rrd',NULL,'on',NULL,60,NULL),(361,4,251,4,1,NULL,'|host_description| - teMySQL - CPU System','OS3  Divre 2 - teMySQL - CPU System','<path_rra>/os3_divre_2_cpu_system_251.rrd',NULL,'on',NULL,60,NULL),(359,41,249,41,2,NULL,'|host_description| - Traffic - sit0','OS3  Divre 2 - Traffic - sit0','<path_rra>/os3_divre_2_traffic_in_249.rrd',NULL,'on',NULL,60,NULL),(358,41,248,41,2,NULL,'|host_description| - Traffic - 172.16.203.67/eth1','OS3  Divre 2 - Traffic - 172.16.203.67/eth1','<path_rra>/os3_divre_2_traffic_in_248.rrd',NULL,'on',NULL,60,NULL),(468,18,356,18,10,NULL,'|host_description| - Ping Host','EMS D7 MDO - Ping Host','<path_rra>/ems_d7_mdo_ping_356.rrd',NULL,'on',NULL,300,NULL),(469,18,357,18,10,NULL,'|host_description| - Ping Host','EMS D7 MKS - Ping Host','<path_rra>/ems_d7_mks_ping_357.rrd',NULL,'on',NULL,300,NULL),(470,18,358,18,10,NULL,'|host_description| - Ping Host','EMS D7 PAREPARE - Ping Host','<path_rra>/ems_d7_parepare_ping_358.rrd',NULL,'on',NULL,300,NULL),(472,4,360,4,1,NULL,'|host_description| - teMySQL - CPU System','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU System','<path_rra>/dev-os3-v2_-_divre_2__cpu_system_360.rrd',NULL,'on',NULL,60,NULL),(473,5,361,5,1,NULL,'|host_description| - teMySQL - CPU User','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU User','<path_rra>/dev-os3-v2_-_divre_2__cpu_user_361.rrd',NULL,'on',NULL,60,NULL),(474,16,362,16,7,NULL,'|host_description| - Processes','DEV-OS3-V2 - DIVRE 2  - Processes','<path_rra>/dev-os3-v2_-_divre_2__proc_362.rrd',NULL,'on',NULL,60,NULL),(475,13,363,13,6,NULL,'|host_description| - Memory - Free','DEV-OS3-V2 - DIVRE 2  - Memory - Free','<path_rra>/dev-os3-v2_-_divre_2__mem_buffers_363.rrd',NULL,'on',NULL,60,NULL),(476,15,364,15,6,NULL,'|host_description| - Memory - Free Swap','DEV-OS3-V2 - DIVRE 2  - Memory - Free Swap','<path_rra>/dev-os3-v2_-_divre_2__mem_swap_364.rrd',NULL,'on',NULL,60,NULL),(477,3,365,3,2,NULL,'|host_description| - Hard Drive Space','DEV-OS3-V2 - DIVRE 2  - Hard Drive Space','<path_rra>/dev-os3-v2_-_divre_2__hdd_free_365.rrd',NULL,'on',NULL,300,NULL),(478,30,366,30,1,NULL,'|host_description| - Load Average - 1 Minute','DEV-OS3-V2 - DIVRE 2  - Load Average - 1 Minute','<path_rra>/dev-os3-v2_-_divre_2__load_1min_366.rrd',NULL,'on',NULL,300,NULL),(479,32,367,32,1,NULL,'|host_description| - Load Average - 15 Minute','DEV-OS3-V2 - DIVRE 2  - Load Average - 15 Minute','<path_rra>/dev-os3-v2_-_divre_2__load_15min_367.rrd',NULL,'on',NULL,300,NULL),(480,31,368,31,1,NULL,'|host_description| - Load Average - 5 Minute','DEV-OS3-V2 - DIVRE 2  - Load Average - 5 Minute','<path_rra>/dev-os3-v2_-_divre_2__load_5min_368.rrd',NULL,'on',NULL,300,NULL),(481,33,369,33,1,NULL,'|host_description| - Memory - Buffers','DEV-OS3-V2 - DIVRE 2  - Memory - Buffers','<path_rra>/dev-os3-v2_-_divre_2__mem_buffers_369.rrd',NULL,'on',NULL,300,NULL),(482,68,370,47,1,NULL,'|host_description| - Memory - Cache','DEV-OS3-V2 - DIVRE 2  - Memory - Cache','<path_rra>/dev-os3-v2_-_divre_2__mem_cache_370.rrd',NULL,'on',NULL,300,NULL),(483,34,371,34,1,NULL,'|host_description| - Memory - Free','DEV-OS3-V2 - DIVRE 2  - Memory - Free','<path_rra>/dev-os3-v2_-_divre_2__mem_free_371.rrd',NULL,'on',NULL,300,NULL),(484,37,372,37,11,NULL,'|host_description| - Hard Drive Space','DEV-OS3-V2 - DIVRE 2  - Hard Drive Space','<path_rra>/dev-os3-v2_-_divre_2__hdd_free_372.rrd',NULL,'on',NULL,300,NULL),(485,11,373,11,4,NULL,'|host_description| - Load Average','DEV-OS3-V2 - DIVRE 2  - Load Average','<path_rra>/dev-os3-v2_-_divre_2__load_1min_373.rrd',NULL,'on',NULL,60,NULL),(486,17,374,17,5,NULL,'|host_description| - Logged in Users','DEV-OS3-V2 - DIVRE 2  - Logged in Users','<path_rra>/dev-os3-v2_-_divre_2__users_374.rrd',NULL,'on',NULL,300,NULL),(487,18,375,18,10,NULL,'|host_description| - Ping Host','DEV-OS3-V2 - DIVRE 2  - Ping Host','<path_rra>/dev-os3-v2_-_divre_2__ping_375.rrd',NULL,'on',NULL,300,NULL),(488,0,0,99,38,'','|host_description| - Apache Statistics','',NULL,'','on','',60,'');
/*!40000 ALTER TABLE `data_template_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template_data_rra`
--

DROP TABLE IF EXISTS `data_template_data_rra`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_template_data_rra` (
  `data_template_data_id` mediumint(8) unsigned NOT NULL default '0',
  `rra_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`data_template_data_id`,`rra_id`),
  KEY `data_template_data_id` (`data_template_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_template_data_rra`
--

LOCK TABLES `data_template_data_rra` WRITE;
/*!40000 ALTER TABLE `data_template_data_rra` DISABLE KEYS */;
INSERT INTO `data_template_data_rra` VALUES (3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(4,4),(4,5),(5,1),(5,2),(5,3),(5,4),(5,5),(6,1),(6,2),(6,3),(6,4),(6,5),(7,1),(7,2),(7,3),(7,4),(8,1),(8,2),(8,3),(8,4),(9,1),(9,2),(9,3),(9,4),(10,1),(10,2),(10,3),(10,4),(11,1),(11,2),(11,3),(11,4),(11,5),(13,1),(13,2),(13,3),(13,4),(13,5),(15,1),(15,2),(15,3),(15,4),(15,5),(16,1),(16,2),(16,3),(16,4),(16,5),(17,1),(17,2),(17,3),(17,4),(18,1),(18,2),(18,3),(18,4),(19,1),(19,2),(19,3),(19,4),(20,1),(20,2),(20,3),(20,4),(22,1),(22,2),(22,3),(22,4),(23,1),(23,2),(23,3),(23,4),(24,1),(24,2),(24,3),(24,4),(25,1),(25,2),(25,3),(25,4),(26,1),(26,2),(26,3),(26,4),(27,1),(27,2),(27,3),(27,4),(30,1),(30,2),(30,3),(30,4),(31,1),(31,2),(31,3),(31,4),(32,1),(32,2),(32,3),(32,4),(33,1),(33,2),(33,3),(33,4),(34,1),(34,2),(34,3),(34,4),(35,1),(35,2),(35,3),(35,4),(36,1),(36,2),(36,3),(36,4),(37,1),(37,2),(37,3),(37,4),(38,1),(38,2),(38,3),(38,4),(39,1),(39,2),(39,3),(39,4),(40,1),(40,2),(40,3),(40,4),(41,1),(41,2),(41,3),(41,4),(41,5),(55,1),(55,2),(55,3),(55,4),(56,1),(56,2),(56,3),(56,4),(57,1),(57,2),(57,3),(57,4),(58,1),(58,2),(58,3),(58,4),(59,1),(59,2),(59,3),(59,4),(68,1),(68,2),(68,3),(68,4),(69,1),(69,2),(69,3),(69,4),(70,1),(70,2),(70,3),(70,4),(70,5),(71,1),(71,2),(71,3),(71,4),(73,1),(73,2),(73,3),(73,4),(73,5),(75,1),(75,2),(75,3),(75,4),(76,1),(76,2),(76,3),(76,4),(77,1),(77,2),(77,3),(77,4),(78,1),(78,2),(78,3),(78,4),(79,1),(79,2),(79,3),(79,4),(80,1),(80,2),(80,3),(80,4),(81,1),(81,2),(81,3),(81,4),(82,1),(82,2),(82,3),(82,4),(83,1),(83,2),(83,3),(83,4),(84,1),(84,2),(84,3),(84,4),(85,1),(85,2),(85,3),(85,4),(86,1),(86,2),(86,3),(86,4),(87,1),(87,2),(87,3),(87,4),(88,1),(88,2),(88,3),(88,4),(89,1),(89,2),(89,3),(89,4),(90,1),(90,2),(90,3),(90,4),(91,1),(91,2),(91,3),(91,4),(92,1),(92,2),(92,3),(92,4),(102,1),(102,2),(102,3),(102,4),(102,5),(103,1),(103,2),(103,3),(103,4),(103,5),(104,1),(104,2),(104,3),(104,4),(104,5),(105,1),(105,2),(105,3),(105,4),(105,5),(106,1),(106,2),(106,3),(106,4),(106,5),(107,1),(107,2),(107,3),(107,4),(108,1),(108,2),(108,3),(108,4),(108,5),(249,1),(249,2),(249,3),(249,4),(249,5),(250,1),(250,2),(250,3),(250,4),(250,5),(251,1),(251,2),(251,3),(251,4),(251,5),(252,1),(252,2),(252,3),(252,4),(252,5),(253,1),(253,2),(253,3),(253,4),(253,5),(254,1),(254,2),(254,3),(254,4),(254,5),(255,1),(255,2),(255,3),(255,4),(255,5),(256,1),(256,2),(256,3),(256,4),(256,5),(257,1),(257,2),(257,3),(257,4),(257,5),(258,1),(258,2),(258,3),(258,4),(258,5),(259,1),(259,2),(259,3),(259,4),(259,5),(260,1),(260,2),(260,3),(260,4),(260,5),(261,1),(261,2),(261,3),(261,4),(261,5),(262,1),(262,2),(262,3),(262,4),(262,5),(263,1),(263,2),(263,3),(263,4),(263,5),(264,1),(264,2),(264,3),(264,4),(264,5),(265,1),(265,2),(265,3),(265,4),(265,5),(266,1),(266,2),(266,3),(266,4),(266,5),(267,1),(267,2),(267,3),(267,4),(267,5),(268,1),(268,2),(268,3),(268,4),(268,5),(269,1),(269,2),(269,3),(269,4),(269,5),(270,1),(270,2),(270,3),(270,4),(270,5),(271,1),(271,2),(271,3),(271,4),(271,5),(272,1),(272,2),(272,3),(272,4),(272,5),(273,1),(273,2),(273,3),(273,4),(273,5),(302,1),(302,2),(302,3),(302,4),(302,5),(303,1),(303,2),(303,3),(303,4),(303,5),(304,1),(304,2),(304,3),(304,4),(304,5),(305,1),(305,2),(305,3),(305,4),(305,5),(306,1),(306,2),(306,3),(306,4),(306,5),(307,1),(307,2),(307,3),(307,4),(307,5),(308,1),(308,2),(308,3),(308,4),(308,5),(309,1),(309,2),(309,3),(309,4),(309,5),(310,1),(310,2),(310,3),(310,4),(310,5),(311,1),(311,2),(311,3),(311,4),(311,5),(312,1),(312,2),(312,3),(312,4),(312,5),(313,1),(313,2),(313,3),(313,4),(313,5),(314,1),(314,2),(314,3),(314,4),(314,5),(315,1),(315,2),(315,3),(315,4),(315,5),(316,1),(316,2),(316,3),(316,4),(316,5),(317,1),(317,2),(317,3),(317,4),(317,5),(318,1),(318,2),(318,3),(318,4),(318,5),(319,1),(319,2),(319,3),(319,4),(319,5),(320,1),(320,2),(320,3),(320,4),(320,5),(321,1),(321,2),(321,3),(321,4),(321,5),(322,1),(322,2),(322,3),(322,4),(322,5),(323,1),(323,2),(323,3),(323,4),(323,5),(324,1),(324,2),(324,3),(324,4),(324,5),(325,1),(325,2),(325,3),(325,4),(325,5),(326,1),(326,2),(326,3),(326,4),(326,5),(327,1),(327,2),(327,3),(327,4),(327,5),(328,1),(328,2),(328,3),(328,4),(328,5),(329,1),(329,2),(329,3),(329,4),(329,5),(330,1),(330,2),(330,3),(330,4),(330,5),(331,1),(331,2),(331,3),(331,4),(331,5),(332,1),(332,2),(332,3),(332,4),(332,5),(333,1),(333,2),(333,3),(333,4),(333,5),(334,1),(334,2),(334,3),(334,4),(334,5),(335,1),(335,2),(335,3),(335,4),(335,5),(336,1),(336,2),(336,3),(336,4),(336,5),(337,1),(337,2),(337,3),(337,4),(337,5),(338,1),(338,2),(338,3),(338,4),(338,5),(339,1),(339,2),(339,3),(339,4),(339,5),(340,1),(340,2),(340,3),(340,4),(340,5),(341,1),(341,2),(341,3),(341,4),(341,5),(342,1),(342,2),(342,3),(342,4),(342,5),(343,1),(343,2),(343,3),(343,4),(343,5),(344,1),(344,2),(344,3),(344,4),(344,5),(345,1),(345,2),(345,3),(345,4),(345,5),(346,1),(346,2),(346,3),(346,4),(346,5),(347,1),(347,2),(347,3),(347,4),(347,5),(348,1),(348,2),(348,3),(348,4),(348,5),(349,1),(349,2),(349,3),(349,4),(349,5),(356,1),(356,2),(356,3),(356,4),(356,5),(357,1),(357,2),(357,3),(357,4),(357,5),(358,1),(358,2),(358,3),(358,4),(358,5),(359,1),(359,2),(359,3),(359,4),(359,5),(360,1),(360,2),(360,3),(360,4),(360,5),(361,1),(361,2),(361,3),(361,4),(361,5),(362,1),(362,2),(362,3),(362,4),(362,5),(363,1),(363,2),(363,3),(363,4),(363,5),(364,1),(364,2),(364,3),(364,4),(364,5),(365,1),(365,2),(365,3),(365,4),(365,5),(366,1),(366,2),(366,3),(366,4),(366,5),(367,1),(367,2),(367,3),(367,4),(367,5),(368,1),(368,2),(368,3),(368,4),(368,5),(369,1),(369,2),(369,3),(369,4),(369,5),(370,1),(370,2),(370,3),(370,4),(370,5),(371,1),(371,2),(371,3),(371,4),(371,5),(372,1),(372,2),(372,3),(372,4),(372,5),(373,1),(373,2),(373,3),(373,4),(373,5),(374,1),(374,2),(374,3),(374,4),(374,5),(375,1),(375,2),(375,3),(375,4),(375,5),(376,1),(376,2),(376,3),(376,4),(376,5),(377,1),(377,2),(377,3),(377,4),(377,5),(378,1),(378,2),(378,3),(378,4),(378,5),(379,1),(379,2),(379,3),(379,4),(379,5),(380,1),(380,2),(380,3),(380,4),(380,5),(381,1),(381,2),(381,3),(381,4),(381,5),(382,1),(382,2),(382,3),(382,4),(382,5),(383,1),(383,2),(383,3),(383,4),(383,5),(384,1),(384,2),(384,3),(384,4),(384,5),(385,1),(385,2),(385,3),(385,4),(385,5),(386,1),(386,2),(386,3),(386,4),(386,5),(387,1),(387,2),(387,3),(387,4),(387,5),(388,1),(388,2),(388,3),(388,4),(388,5),(399,1),(399,2),(399,3),(399,4),(399,5),(400,1),(400,2),(400,3),(400,4),(400,5),(401,1),(401,2),(401,3),(401,4),(401,5),(402,1),(402,2),(402,3),(402,4),(402,5),(403,1),(403,2),(403,3),(403,4),(403,5),(404,1),(404,2),(404,3),(404,4),(404,5),(405,1),(405,2),(405,3),(405,4),(405,5),(406,1),(406,2),(406,3),(406,4),(406,5),(407,1),(407,2),(407,3),(407,4),(407,5),(408,1),(408,2),(408,3),(408,4),(408,5),(409,1),(409,2),(409,3),(409,4),(409,5),(410,1),(410,2),(410,3),(410,4),(410,5),(411,1),(411,2),(411,3),(411,4),(411,5),(412,1),(412,2),(412,3),(412,4),(412,5),(413,1),(413,2),(413,3),(413,4),(413,5),(414,1),(414,2),(414,3),(414,4),(414,5),(415,1),(415,2),(415,3),(415,4),(415,5),(416,1),(416,2),(416,3),(416,4),(416,5),(417,1),(417,2),(417,3),(417,4),(417,5),(418,1),(418,2),(418,3),(418,4),(418,5),(419,1),(419,2),(419,3),(419,4),(419,5),(420,1),(420,2),(420,3),(420,4),(420,5),(421,1),(421,2),(421,3),(421,4),(421,5),(422,1),(422,2),(422,3),(422,4),(422,5),(423,1),(423,2),(423,3),(423,4),(423,5),(430,1),(430,2),(430,3),(430,4),(431,1),(431,2),(431,3),(431,4),(432,1),(432,2),(432,3),(432,4),(433,1),(433,2),(433,3),(433,4),(434,1),(434,2),(434,3),(434,4),(436,1),(436,2),(436,3),(436,4),(437,1),(437,2),(437,3),(437,4),(438,1),(438,2),(438,3),(438,4),(439,1),(439,2),(439,3),(439,4),(440,1),(440,2),(440,3),(440,4),(442,1),(442,2),(442,3),(442,4),(443,1),(443,2),(443,3),(443,4),(444,1),(444,2),(444,3),(444,4),(445,1),(445,2),(445,3),(445,4),(446,1),(446,2),(446,3),(446,4),(447,1),(447,2),(447,3),(447,4),(448,1),(448,2),(448,3),(448,4),(449,1),(449,2),(449,3),(449,4),(450,1),(450,2),(450,3),(450,4),(451,1),(451,2),(451,3),(451,4),(451,5),(452,1),(452,2),(452,3),(452,4),(452,5),(453,1),(453,2),(453,3),(453,4),(453,5),(454,1),(454,2),(454,3),(454,4),(455,1),(455,2),(455,3),(455,4),(455,5),(456,1),(456,2),(456,3),(456,4),(457,1),(457,2),(457,3),(457,4),(458,1),(458,2),(458,3),(458,4),(459,1),(459,2),(459,3),(459,4),(460,1),(460,2),(460,3),(460,4),(461,1),(461,2),(461,3),(461,4),(462,1),(462,2),(462,3),(462,4),(463,1),(463,2),(463,3),(463,4),(464,1),(464,2),(464,3),(464,4),(465,1),(465,2),(465,3),(465,4),(466,1),(466,2),(466,3),(466,4),(467,1),(467,2),(467,3),(467,4),(468,1),(468,2),(468,3),(468,4),(469,1),(469,2),(469,3),(469,4),(470,1),(470,2),(470,3),(470,4),(471,1),(471,2),(471,3),(471,4),(471,5),(472,1),(472,2),(472,3),(472,4),(472,5),(473,1),(473,2),(473,3),(473,4),(473,5),(474,1),(474,2),(474,3),(474,4),(474,5),(475,1),(475,2),(475,3),(475,4),(475,5),(476,1),(476,2),(476,3),(476,4),(476,5),(477,1),(477,2),(477,3),(477,4),(478,1),(478,2),(478,3),(478,4),(479,1),(479,2),(479,3),(479,4),(480,1),(480,2),(480,3),(480,4),(481,1),(481,2),(481,3),(481,4),(482,1),(482,2),(482,3),(482,4),(483,1),(483,2),(483,3),(483,4),(484,1),(484,2),(484,3),(484,4),(485,1),(485,2),(485,3),(485,4),(485,5),(486,1),(486,2),(486,3),(486,4),(487,1),(487,2),(487,3),(487,4),(488,1),(488,2),(488,3),(488,4),(488,5);
/*!40000 ALTER TABLE `data_template_data_rra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template_rrd`
--

DROP TABLE IF EXISTS `data_template_rrd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `data_template_rrd` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `local_data_template_rrd_id` mediumint(8) unsigned NOT NULL default '0',
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `t_rrd_maximum` char(2) default NULL,
  `rrd_maximum` varchar(20) NOT NULL default '0',
  `t_rrd_minimum` char(2) default NULL,
  `rrd_minimum` varchar(20) NOT NULL default '0',
  `t_rrd_heartbeat` char(2) default NULL,
  `rrd_heartbeat` mediumint(6) NOT NULL default '0',
  `t_data_source_type_id` char(2) default NULL,
  `data_source_type_id` smallint(5) NOT NULL default '0',
  `t_data_source_name` char(2) default NULL,
  `data_source_name` varchar(19) NOT NULL default '',
  `t_data_input_field_id` char(2) default NULL,
  `data_input_field_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `local_data_template_rrd_id` (`local_data_template_rrd_id`),
  KEY `data_source_name` (`data_source_name`)
) ENGINE=MyISAM AUTO_INCREMENT=1174 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `data_template_rrd`
--

LOCK TABLES `data_template_rrd` WRITE;
/*!40000 ALTER TABLE `data_template_rrd` DISABLE KEYS */;
INSERT INTO `data_template_rrd` VALUES (3,'2d53f9c76767a2ae8909f4152fd473a4',0,0,3,'','0','','0','',600,'',1,'','hdd_free','',0),(4,'93d91aa7a3cc5473e7b195d5d6e6e675',0,0,3,'','0','','0','',600,'',1,'','hdd_used','',0),(5,'7bee7987bbf30a3bc429d2a67c6b2595',0,0,4,'','1100','','0','',120,'',3,'','cpu_system','',0),(6,'ddccd7fbdece499da0235b4098b87f9e',0,0,5,'','1100','','0','',120,'',3,'','cpu_user','',0),(7,'122ab2097f8c6403b7b90cde7b9e2bc2',0,0,6,'','1100','','0','',120,'',3,'','cpu_nice','',0),(8,'34f50c820092ea0fecba25b4b94a7946',0,0,7,'','100','','0','',600,'',1,'','wrls_noise','',0),(9,'830b811d1834e5ba0e2af93bd92db057',0,0,8,'','100','','0','',600,'',1,'','wrls_signal','',0),(10,'2f1b016a2465eef3f7369f6313cd4a94',0,0,9,'','1000000','','0','',600,'',2,'','wrls_transmits','',0),(11,'28ffcecaf8b50e49f676f2d4a822685d',0,0,10,'','1000000','','0','',600,'',2,'','wrls_retransmits','',0),(12,'8175ca431c8fe50efff5a1d3ae51b55d',0,0,11,'','500','','0','',120,'',1,'','load_1min','',17),(13,'a2eeb8acd6ea01cd0e3ac852965c0eb6',0,0,11,'','500','','0','',120,'',1,'','load_5min','',18),(14,'9f951b7fb3b19285a411aebb5254a831',0,0,11,'','500','','0','',120,'',1,'','load_15min','',19),(16,'a4df3de5238d3beabee1a2fe140d3d80',0,0,13,'','0','','0','',120,'',1,'','mem_buffers','',23),(18,'7fea6acc9b1a19484b4cb4cef2b6c5da',0,0,15,'','0','','0','',120,'',1,'','mem_swap','',23),(19,'f1ba3a5b17b95825021241398bb0f277',0,0,16,'','1000','','0','',120,'',1,'','proc','',24),(20,'46a5afe8e6c0419172c76421dc9e304a',0,0,17,'','500','','0','',600,'',1,'','users','',21),(21,'962fd1994fe9cae87fb36436bdb8a742',0,0,18,'','5000','','0','',600,'',1,'','ping','',30),(22,'7a8dd1111a8624369906bf2cd6ea9ca9',0,0,19,'','100000','','0','',600,'',1,'','total_users','',0),(23,'ddb6e74d34d2f1969ce85f809dbac23d',0,0,20,'','100000','','0','',600,'',1,'','total_logins','',0),(80,'50ccbe193c6c7fc29fb9f726cd6c48ee',0,0,45,'','1000','','0','',600,'',1,'','proc','',0),(25,'289311d10336941d33d9a1c48a7b11ee',0,0,22,'','10000000','','0','',600,'',2,'','fs_reads','',0),(26,'02216f036cca04655ee2f67fedb6f4f0',0,0,23,'','10000000','','0','',600,'',2,'','fs_writes','',0),(27,'9e402c0f29131ef7139c20bd500b4e8a',0,0,24,'','10000000','','0','',600,'',2,'','cache_checks','',0),(28,'46717dfe3c8c030d8b5ec0874f9dbdca',0,0,25,'','1000000','','0','',600,'',2,'','cache_hits','',0),(29,'7a88a60729af62561812c43bde61dfc1',0,0,26,'','100000','','0','',600,'',1,'','open_files','',0),(30,'3c0fd1a188b64a662dfbfa985648397b',0,0,27,'','100','','0','',600,'',1,'','5min_cpu','',0),(33,'ed44c2438ef7e46e2aeed2b6c580815c',0,0,30,'','500','','0','',600,'',1,'','load_1min','',0),(34,'9b3a00c9e3530d9e58895ac38271361e',0,0,31,'','500','','0','',600,'',1,'','load_5min','',0),(35,'6746c2ed836ecc68a71bbddf06b0e5d9',0,0,32,'','500','','0','',600,'',1,'','load_15min','',0),(36,'9835d9e1a8c78aa2475d752e8fa74812',0,0,33,'','10000000','','0','',600,'',1,'','mem_buffers','',0),(37,'9c78dc1981bcea841b8c827c6dc0d26c',0,0,34,'','10000000','','0','',600,'',1,'','mem_free','',0),(38,'62a56dc76fe4cd8566a31b5df0274cc3',0,0,35,'','0','','0','',600,'',1,'','vol_total','',0),(39,'2e366ab49d0e0238fb4e3141ea5a88c3',0,0,35,'','0','','0','',600,'',1,'','vol_free','',0),(40,'dceedc84718dd93a5affe4b190bca810',0,0,35,'','0','','0','',600,'',1,'','vol_freeable','',0),(42,'93330503f1cf67db00d8fe636035e545',0,0,36,'','100000000000','','0','',600,'',1,'','dir_total','',0),(43,'6b0fe4aa6aaf22ef9cfbbe96d87fa0d7',0,0,36,'','100000000000','','0','',600,'',1,'','dir_used','',0),(44,'4c82df790325d789d304e6ee5cd4ab7d',0,0,37,'','0','','0','',600,'',1,'','hdd_free','',0),(54,'2df25c57022b0c7e7d0be4c035ada1a0',0,0,41,'on','100000000','','0','',120,'',2,'','traffic_in','',0),(46,'c802e2fd77f5b0a4c4298951bf65957c',0,0,38,'','10000000','','0','',600,'',2,'','errors_in','',0),(47,'4e2a72240955380dc8ffacfcc8c09874',0,0,38,'','10000000','','0','',600,'',2,'','discards_in','',0),(48,'636672962b5bb2f31d86985e2ab4bdfe',0,0,39,'','1000000000','','0','',600,'',2,'','unicast_in','',0),(49,'18ce92c125a236a190ee9dd948f56268',0,0,39,'','1000000000','','0','',600,'',2,'','unicast_out','',0),(50,'13ebb33f9cbccfcba828db1075a8167c',0,0,38,'','10000000','','0','',600,'',2,'','discards_out','',0),(51,'31399c3725bee7e09ec04049e3d5cd17',0,0,38,'','10000000','','0','',600,'',2,'','errors_out','',0),(52,'7be68cbc4ee0b2973eb9785f8c7a35c7',0,0,40,'','1000000000','','0','',600,'',2,'','nonunicast_out','',0),(53,'93e2b6f59b10b13f2ddf2da3ae98b89a',0,0,40,'','1000000000','','0','',600,'',2,'','nonunicast_in','',0),(55,'721c0794526d1ac1c359f27dc56faa49',0,0,41,'on','100000000','','0','',120,'',2,'','traffic_out','',0),(56,'07175541991def89bd02d28a215f6fcc',0,0,37,'','0','','0','',600,'',1,'','hdd_used','',0),(76,'07492e5cace6d74e7db3cb1fc005a3f3',0,0,42,'','100','','0','',600,'',1,'','cpu','',0),(92,'165a0da5f461561c85d092dfe96b9551',0,0,43,'','0','','0','',600,'',1,'','hdd_total','',0),(78,'0ee6bb54957f6795a5369a29f818d860',0,0,43,'','0','','0','',600,'',1,'','hdd_used','',0),(79,'9825aaf7c0bdf1554c5b4b86680ac2c0',0,0,44,'','100','','0','',600,'',1,'','cpu','',0),(81,'9464c91bcff47f23085ae5adae6ab987',0,0,46,'','5000','','0','',600,'',1,'','users','',0),(164,'',112,22,51,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'total',NULL,46),(157,'',97,21,49,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'RRDsProcessed',NULL,39),(155,'',16,19,13,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'mem_buffers',NULL,23),(156,'',18,20,15,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'mem_swap',NULL,23),(96,'224b83ea73f55f8a861bcf4c9bea0472',0,0,48,'on','100','','0','',600,'on',1,'','snmp_oid','',0),(95,'7a6ca455bbeff99ca891371bc77d5cf9',0,0,47,'','10000000','','0','',600,'',1,'','mem_cache','',0),(97,'e96673b4ff97d0e0127c71726c86d2db',0,0,49,'','0','','0','',120,'',1,'','RRDsProcessed','',39),(98,'878803580685cc6b6174a7864fe0fd07',0,0,49,'','0','','0','',120,'',1,'','DataSources','',40),(99,'d107e27befbe4a1fc861f4f97a0f363e',0,0,49,'','0','','0','',120,'',1,'','HostsPerProcess','',41),(100,'dfe4825f22716f75cbfd7e636ae232ac',0,0,49,'','0','','0','',120,'',1,'','Hosts','',42),(101,'0532007849f0e7ff7c16e250125aa847',0,0,49,'','100','','0','',120,'',1,'','Threads','',43),(102,'1d2d7bb2353049b46e4002b9e1495805',0,0,49,'','100','','0','',120,'',1,'','Processes','',44),(103,'5d041918ba1a17fd0a3d569c9f4dc135',0,0,49,'','300','','0','',120,'',1,'','Time','',45),(104,'7176219b3a0b0a51487bba2019acd230',0,0,50,'','0','','0','',600,'',1,'','service_state','',0),(170,'',19,25,16,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'proc',NULL,24),(169,'',20,24,17,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(168,'',14,23,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_15min',NULL,19),(167,'',13,23,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_5min',NULL,18),(166,'',12,23,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_1min',NULL,17),(160,'',100,21,49,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'Hosts',NULL,42),(112,'84bd627cff9525c9c20a6307ded2e7f3',0,0,51,'','0','','0','',120,'',1,'','total','',46),(113,'7b1b95bff8dbb0926122c888073ba66e',0,0,51,'','0','','0','',120,'',1,'','incoming','',47),(161,'',101,21,49,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Threads',NULL,43),(116,'f3fb46a14a303bf5598dadb1abdb23f3',0,0,52,'','0','','0','',600,'',1,'','lan2lan','',0),(117,'995db5acd9172391505f3eae944bb961',0,0,53,'','0','','0','',600,'',1,'','management','',0),(118,'971312f542aa08d1f2e751c94dc6c9e4',0,0,54,'','0','','0','',600,'',1,'','ras','',0),(119,'3cab9974b9750da01ad1198cc0f53c0f',0,0,55,'','0','','0','',600,'',1,'','total','',0),(120,'ec7d23dbb8a0117ccf1f02d811c3842c',0,0,56,'','0','','0','',600,'',2,'','Sent','',0),(121,'56a14594842157b8b32ef6193cb7b034',0,0,57,'','0','','0','',600,'',2,'','Received','',0),(122,'f852105a7fe71e297e019b7b01e508d2',0,0,58,'','2007','','0','',600,'',1,'','Aironet_Assoc','',0),(123,'92ae85e7693e4bbea139514291397df6',0,0,59,'','100','','0','',600,'',1,'','1min_cpu_cat','',0),(124,'bacb1e720c367a56dd5ddffc525c9571',0,0,60,'','100','','0','',600,'',1,'','5min_cpu_cat','',0),(125,'cf25784f3bc661f325ccfefcbf5d0df4',0,0,61,'','100','','0','',600,'',1,'','5sec_cpu_cat','',0),(126,'66ab13037dba4937558c7e869d22090e',0,0,62,'','100','','0','',600,'',1,'','switch_load','',0),(127,'2979808564585fa167429a75f0a26e15',0,0,63,'','1000000000','','0','',600,'',1,'','ProcMem','',0),(128,'3893fa1ae7b903ab3eac1d4976db28cd',0,0,64,'','0','','0','',600,'',1,'','cisco_iomem','',0),(129,'3ebed6a96afbfbb3dc4fae44935e2fdc',0,0,65,'','0','','0','',600,'',1,'','cisco_procmem','',0),(130,'ad395069b67aed86270efdce101f3fba',0,0,66,'','100','','0','',600,'',1,'','vpn5min_cpu','',0),(131,'23d0823e00d67cc11214f84a9f15779c',0,0,67,'','1000000000000','','0','',600,'',1,'','cvpn_tempcur','',0),(132,'ed63ed459975f8c70a0746dea74ffcf9',0,0,68,'','1000000000000','','0','',600,'',1,'','alactiv_count','',0),(133,'bf98a480502950fdd6a6d23efa5f10cf',0,0,69,'','1000000000000','','0','',600,'',1,'','alactive_countmax','',0),(134,'1ca09699f97ec19241c25acc85704d7d',0,0,43,'','100','','0','',600,'',1,'','hdd_percent','',0),(163,'',103,21,49,NULL,'300',NULL,'0',NULL,120,NULL,1,NULL,'Time',NULL,45),(162,'',102,21,49,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Processes',NULL,44),(158,'',98,21,49,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'DataSources',NULL,40),(159,'',99,21,49,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'HostsPerProcess',NULL,41),(165,'',113,22,51,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'incoming',NULL,47),(784,'',523,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_rnd',NULL,164),(783,'',522,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_prev',NULL,163),(782,'',521,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_first',NULL,160),(781,'',520,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'delete',NULL,159),(780,'',519,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_next',NULL,162),(779,'',518,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_key',NULL,161),(778,'',517,234,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'delete',NULL,152),(777,'',516,234,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'change_db',NULL,151),(776,'',515,234,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'update',NULL,155),(775,'',514,234,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'insert',NULL,153),(774,'',513,234,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'select',NULL,154),(773,'',503,233,79,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Slow_queries',NULL,132),(772,'',502,233,79,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Slow_launch_threads',NULL,131),(771,'',501,233,79,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Table_locks_waited',NULL,130),(770,'',500,233,79,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Table_locks_immedia',NULL,128),(769,'',528,232,85,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_5',NULL,0),(768,'',529,231,86,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_15',NULL,0),(767,'',527,230,84,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_1',NULL,0),(766,'',533,229,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_inserted',NULL,171),(765,'',532,229,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_deleted',NULL,173),(764,'',531,229,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_updated',NULL,172),(763,'',530,229,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_read',NULL,174),(762,'',541,228,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'spin_rounds',NULL,190),(761,'',540,228,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'spin_waits',NULL,189),(760,'',539,228,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'os_waits',NULL,191),(759,'',544,227,90,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_inserts',NULL,178),(758,'',543,227,90,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_merges',NULL,180),(757,'',542,227,90,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_merged',NULL,179),(756,'',548,226,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'reads',NULL,196),(755,'',547,226,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'fsyncs',NULL,193),(754,'',546,226,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'log_writes',NULL,192),(753,'',545,226,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'file_writes',NULL,197),(752,'',538,225,88,NULL,'1000000',NULL,'0',NULL,120,NULL,1,NULL,'database_pages',NULL,183),(751,'',537,225,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'pool_size',NULL,181),(750,'',536,225,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'modified_pages',NULL,184),(749,'',535,225,88,NULL,'10000',NULL,'0',NULL,120,NULL,1,NULL,'hit_rate',NULL,185),(748,'',534,225,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'free_pages',NULL,182),(747,'',482,224,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_writes',NULL,99),(746,'',481,224,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_write_requests',NULL,98),(745,'',480,224,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_reads',NULL,97),(744,'',479,224,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_read_requests',NULL,96),(743,'',6,223,5,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_user',NULL,0),(742,'',5,222,4,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_system',NULL,0),(741,'',7,221,6,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_nice',NULL,0),(740,'',55,220,41,NULL,'0',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(739,'',54,220,41,NULL,'0',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(738,'',55,219,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(737,'',54,219,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(736,'',506,218,80,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Created_tmp_tables',NULL,138),(735,'',505,218,80,NULL,'100000000',NULL,'0',NULL,120,NULL,3,NULL,'Created_tmp_files',NULL,137),(734,'',504,218,80,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Createdtmpdisktable',NULL,136),(733,'',499,217,78,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_scan',NULL,125),(732,'',498,217,78,NULL,'100000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_rows',NULL,124),(731,'',497,217,78,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_range',NULL,123),(730,'',496,217,78,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_merge_passes',NULL,122),(729,'',472,216,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_scan',NULL,83),(728,'',471,216,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_range_check',NULL,82),(727,'',470,216,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_range',NULL,81),(726,'',469,216,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Selectfullrangejoin',NULL,80),(725,'',468,216,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_full_join',NULL,79),(724,'',467,216,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_select',NULL,78),(723,'',478,215,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handlerreadrndnext',NULL,92),(722,'',477,215,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_rnd',NULL,91),(721,'',476,215,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_prev',NULL,90),(720,'',475,215,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_next',NULL,89),(719,'',474,215,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_key',NULL,88),(718,'',473,215,74,NULL,'5000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_first',NULL,87),(717,'',490,214,76,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_total_blocks',NULL,110),(716,'',489,214,76,NULL,'500000',NULL,'1',NULL,120,NULL,1,NULL,'Qcachequeriesincach',NULL,109),(715,'',488,214,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_not_cached',NULL,108),(714,'',487,214,76,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Qcachelowmemprunes',NULL,107),(713,'',486,214,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_inserts',NULL,106),(712,'',485,214,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_hits',NULL,105),(711,'',484,214,76,NULL,'10000000000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_free_memory',NULL,104),(710,'',483,214,76,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_free_blocks',NULL,103),(709,'',495,213,77,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Max_used_connection',NULL,118),(708,'',494,213,77,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Connections',NULL,117),(707,'',493,213,77,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Bytes_sent',NULL,116),(706,'',492,213,77,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Bytes_received',NULL,115),(705,'',491,213,77,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Questions',NULL,114),(704,'',482,212,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_writes',NULL,99),(703,'',481,212,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_write_requests',NULL,98),(702,'',480,212,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_reads',NULL,97),(701,'',479,212,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_read_requests',NULL,96),(700,'',6,211,5,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_user',NULL,0),(699,'',5,210,4,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_system',NULL,0),(698,'',7,209,6,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_nice',NULL,0),(697,'',55,208,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(696,'',54,208,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(695,'',55,207,41,NULL,'1000000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(694,'',54,207,41,NULL,'1000000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(693,'',55,206,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(692,'',54,206,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(691,'',55,205,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(690,'',54,205,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(689,'',55,204,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(688,'',54,204,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(687,'',55,203,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(686,'',54,203,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(685,'',55,202,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(684,'',54,202,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(683,'',55,201,41,NULL,'1000000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(682,'',54,201,41,NULL,'1000000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(681,'',55,200,41,NULL,'1000000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(680,'',54,200,41,NULL,'1000000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(679,'',482,199,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_writes',NULL,99),(678,'',481,199,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_write_requests',NULL,98),(677,'',480,199,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_reads',NULL,97),(676,'',479,199,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_read_requests',NULL,96),(675,'',6,198,5,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_user',NULL,0),(674,'',5,197,4,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_system',NULL,0),(669,'',54,194,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(670,'',55,194,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(671,'',54,195,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(672,'',55,195,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(673,'',7,196,6,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_nice',NULL,0),(452,'c5a05a85104fcdca5eac99cead66aed2',0,0,70,'','10000000','','0','',120,'',1,'','BinlogCacheUse','',54),(791,'',454,236,70,NULL,'100000',NULL,'0',NULL,120,NULL,1,NULL,'SecondsBehindMaster',NULL,55),(789,'',451,236,70,NULL,'100000000',NULL,'0',NULL,120,NULL,1,NULL,'ReadExecLogPosDiff',NULL,56),(790,'',453,236,70,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'BinlogCacheDiskUse',NULL,53),(785,'',524,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_rnd_next',NULL,165),(786,'',525,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'update',NULL,166),(787,'',526,235,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'write',NULL,167),(788,'',452,236,70,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'BinlogCacheUse',NULL,54),(451,'a360fd8b3abc668569212a63cf2cb518',0,0,70,'','100000000','','0','',120,'',1,'','ReadExecLogPosDiff','',56),(797,'',512,237,81,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Aborted_connects',NULL,147),(796,'',511,237,81,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Aborted_clients',NULL,146),(802,'',465,238,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_update',NULL,73),(801,'',464,238,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_rollback',NULL,72),(800,'',463,238,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_discover',NULL,71),(794,'',509,237,81,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Threads_created',NULL,144),(792,'',507,237,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_cached',NULL,142),(793,'',508,237,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_connected',NULL,143),(795,'',510,237,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_running',NULL,145),(799,'',462,238,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_delete',NULL,70),(798,'',461,238,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_commit',NULL,69),(807,'',458,239,71,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Com_truncate',NULL,63),(808,'',459,239,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_update',NULL,64),(915,'',461,273,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_commit',NULL,69),(914,'',512,272,81,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Aborted_connects',NULL,147),(805,'',456,239,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_insert',NULL,61),(803,'',466,238,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_write',NULL,74),(804,'',455,239,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_delete',NULL,60),(809,'',460,239,71,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_update_multi',NULL,65),(806,'',457,239,71,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_insert_select',NULL,62),(913,'',511,272,81,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Aborted_clients',NULL,146),(810,'bce5695fef05c22644d5f69cc3cc244c',0,0,95,'','500','','0','',120,'',1,'','avg','',216),(811,'bf9a56ba358844e7f60ddb8110868e0d',0,0,96,'','500','','0','',120,'',1,'','avg','',219),(912,'',510,272,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_running',NULL,145),(911,'',509,272,81,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Threads_created',NULL,144),(1111,'',21,337,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(904,'',498,270,78,NULL,'100000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_rows',NULL,124),(905,'',499,270,78,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_scan',NULL,125),(906,'',504,271,80,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Createdtmpdisktable',NULL,136),(907,'',505,271,80,NULL,'100000000',NULL,'0',NULL,120,NULL,3,NULL,'Created_tmp_files',NULL,137),(908,'',506,271,80,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Created_tmp_tables',NULL,138),(909,'',507,272,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_cached',NULL,142),(910,'',508,272,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_connected',NULL,143),(920,'',466,273,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_write',NULL,74),(919,'',465,273,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_update',NULL,73),(926,'',460,274,71,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_update_multi',NULL,65),(925,'',459,274,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_update',NULL,64),(924,'',458,274,71,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Com_truncate',NULL,63),(923,'',457,274,71,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_insert_select',NULL,62),(917,'',463,273,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_discover',NULL,71),(916,'',462,273,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_delete',NULL,70),(921,'',455,274,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_delete',NULL,60),(918,'',464,273,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_rollback',NULL,72),(922,'',456,274,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_insert',NULL,61),(821,'',55,247,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(820,'',54,247,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(819,'',55,246,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(818,'',54,246,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(453,'b0b8d0e9a2b2902c2cbbffde23c38b86',0,0,70,'','10000000','','0','',120,'',1,'','BinlogCacheDiskUse','',53),(454,'6eb4a6f87e0393f9d57c751fdd036a7f',0,0,70,'','100000','','0','',120,'',1,'','SecondsBehindMaster','',55),(455,'cc1622e7fa1f195fa240adb90f2a3037',0,0,71,'','10000000','','0','',120,'',3,'','Com_delete','',60),(456,'7edcb46a9d8350861867cf1fcb183119',0,0,71,'','10000000','','0','',120,'',3,'','Com_insert','',61),(457,'3a3d73d6eadbb019187914119f8fe2fb',0,0,71,'','1000000','','0','',120,'',3,'','Com_insert_select','',62),(458,'a8637eabd6817b58ffd1bf62c7e66e19',0,0,71,'','100000','','0','',120,'',3,'','Com_truncate','',63),(459,'2ee2553fb7a82ae5294bf2ef11239159',0,0,71,'','10000000','','0','',120,'',3,'','Com_update','',64),(460,'3b69141aec21dad852bc6cd79ff0b624',0,0,71,'','1000000','','0','',120,'',3,'','Com_update_multi','',65),(461,'7bd438f37586d37aea1d8cc8b2542f88',0,0,72,'','1000000','','0','',120,'',3,'','Handler_commit','',69),(462,'5a65a05cc948ac00ec3c71d5516a6131',0,0,72,'','10000000','','0','',120,'',3,'','Handler_delete','',70),(463,'09df5dcfbba4948bc21bb76ba9cb332f',0,0,72,'','1000000','','0','',120,'',3,'','Handler_discover','',71),(464,'f3fccb60e612c52c7000fc0c6f742a73',0,0,72,'','1000000','','0','',120,'',3,'','Handler_rollback','',72),(465,'68c66057d398f47099825de483234b6c',0,0,72,'','10000000','','0','',120,'',3,'','Handler_update','',73),(466,'b481b78f6b4dc9609063c4610f38d947',0,0,72,'','10000000','','0','',120,'',3,'','Handler_write','',74),(467,'848d6adfaae49b701334c757837c69a8',0,0,73,'','10000000','','0','',120,'',3,'','Com_select','',78),(468,'28bbd5fdf757431a15719306edec6d5c',0,0,73,'','10000000','','0','',120,'',3,'','Select_full_join','',79),(469,'ab230c5c0b916db29e3ffadaf9a0a8c0',0,0,73,'','10000000','','0','',120,'',3,'','Selectfullrangejoin','',80),(470,'fd4dad000330b96473ec8e72b6bcde8b',0,0,73,'','10000000','','0','',120,'',3,'','Select_range','',81),(471,'e6cd08ad909dfd79431aa6e0b1c17754',0,0,73,'','10000000','','0','',120,'',3,'','Select_range_check','',82),(472,'a41bd5bb906f0ed6470024a08a692454',0,0,73,'','10000000','','0','',120,'',3,'','Select_scan','',83),(473,'e001abf58fe058d15e885e6303c5134e',0,0,74,'','5000000','','0','',120,'',3,'','Handler_read_first','',87),(474,'558d068193b60b9de2be428f2963322e',0,0,74,'','10000000','','0','',120,'',3,'','Handler_read_key','',88),(475,'20ac9c35e99e59105092801f766139e2',0,0,74,'','10000000','','0','',120,'',3,'','Handler_read_next','',89),(476,'5c0e29767a43c5959c7a40fc5f675b92',0,0,74,'','10000000','','0','',120,'',3,'','Handler_read_prev','',90),(477,'2e2a65312f296b98e484ba9dcb73a4f8',0,0,74,'','10000000','','0','',120,'',3,'','Handler_read_rnd','',91),(478,'8420b87b28932145ee86e8cc61218638',0,0,74,'','10000000','','0','',120,'',3,'','Handlerreadrndnext','',92),(479,'bf33ff87da2af0d65a90a6f91d5164c8',0,0,75,'','10000000000','','0','',120,'',3,'','Key_read_requests','',96),(480,'3967c9daa1c87d38419700826103f37b',0,0,75,'','10000000000','','0','',120,'',3,'','Key_reads','',97),(481,'3053bd727e3cb3c57a9f3231b87d2d12',0,0,75,'','10000000000','','0','',120,'',3,'','Key_write_requests','',98),(482,'f2b90de62421e3061f5ca82ca2ad8f32',0,0,75,'','10000000000','','0','',120,'',3,'','Key_writes','',99),(483,'a89227a8112b67b131ae47a7967d800c',0,0,76,'','100000','','1','',120,'',1,'','Qcache_free_blocks','',103),(484,'54795bf10d028682a9a1316d4aaabe05',0,0,76,'','10000000000','','1','',120,'',1,'','Qcache_free_memory','',104),(485,'912b9e7087252ca9908829792b34f11f',0,0,76,'','1000000','','0','',120,'',3,'','Qcache_hits','',105),(486,'6db5f0666141b3f21d08266be3257607',0,0,76,'','1000000','','0','',120,'',3,'','Qcache_inserts','',106),(487,'2a90e2bfc80b4a2cff92edc7139e0136',0,0,76,'','100000','','0','',120,'',3,'','Qcachelowmemprunes','',107),(488,'8c043b0f9ce56ce2d78f7fce9c418c3b',0,0,76,'','1000000','','0','',120,'',3,'','Qcache_not_cached','',108),(489,'f4805d399c9214143c57d23e376ff314',0,0,76,'','500000','','1','',120,'',1,'','Qcachequeriesincach','',109),(490,'17627255ed14a85277308907131a02d1',0,0,76,'','100000','','1','',120,'',1,'','Qcache_total_blocks','',110),(491,'c786fb8f3015e1049d96f27f64329675',0,0,77,'','100000','','0','',120,'',3,'','Questions','',114),(492,'57fff95818cb0dcfe6c9b346643d30f9',0,0,77,'','10000000','','0','',120,'',3,'','Bytes_received','',115),(493,'6ba10c273f0b15cddb420984cd3778c4',0,0,77,'','10000000','','0','',120,'',3,'','Bytes_sent','',116),(494,'b506840f6f74c9b683cca065c9d3137c',0,0,77,'','10000','','0','',120,'',3,'','Connections','',117),(495,'b299f487b958ab19d4afc560afda9bd9',0,0,77,'','100000','','1','',120,'',1,'','Max_used_connection','',118),(496,'2816d7aea979e05254fdd31534aad6b1',0,0,78,'','1000000','','0','',120,'',3,'','Sort_merge_passes','',122),(497,'82357fce26b80343d9b9c7e17522499d',0,0,78,'','10000000','','0','',120,'',3,'','Sort_range','',123),(498,'d2e6db4f80e9da7d4d6f214feef22b53',0,0,78,'','100000000','','0','',120,'',3,'','Sort_rows','',124),(499,'ab610191a0652453e9ae403057a96344',0,0,78,'','1000000','','0','',120,'',3,'','Sort_scan','',125),(500,'bb6193faacaf14525e243c824ba2ac28',0,0,79,'','1000000','','0','',120,'',3,'','Table_locks_immedia','',128),(501,'964af825b5a7e29b2645c20fbd0f58c0',0,0,79,'','1000000','','0','',120,'',3,'','Table_locks_waited','',130),(502,'0995f155f7a6e3a696ab1f166c27ce3b',0,0,79,'','10000','','0','',120,'',3,'','Slow_launch_threads','',131),(503,'1bebd60d171740e4e831080eaf45d9ee',0,0,79,'','10000','','0','',120,'',3,'','Slow_queries','',132),(504,'09a2b0e39cb5e6d13c53bbb5fc753809',0,0,80,'','1000000','','0','',120,'',3,'','Createdtmpdisktable','',136),(505,'e82bffd5b961c16294afc0def7b130bd',0,0,80,'','100000000','','0','',120,'',3,'','Created_tmp_files','',137),(506,'4022cb4b63f253bae4c5b5bba332dd29',0,0,80,'','1000000','','0','',120,'',3,'','Created_tmp_tables','',138),(507,'2ef75836f73330ee0c4b99877477ace8',0,0,81,'','100000','','1','',120,'',1,'','Threads_cached','',142),(508,'5146ace9a7d4ad6248e76d757a238bda',0,0,81,'','100000','','1','',120,'',1,'','Threads_connected','',143),(509,'83cf30cc056c5187d86ca5da2ff4e733',0,0,81,'','100000','','0','',120,'',3,'','Threads_created','',144),(510,'d586e1435f20a85a29ac94de73edcdcc',0,0,81,'','100000','','1','',120,'',1,'','Threads_running','',145),(511,'8e727ce5b0d22bfa28821da5ce6c40c2',0,0,81,'','100000','','0','',120,'',3,'','Aborted_clients','',146),(512,'d9615352b999d289b0d6de1de7f2f9e1',0,0,81,'','1000000','','0','',120,'',3,'','Aborted_connects','',147),(513,'7dd258e86254765e228a3069fbdb86b1',0,0,82,'','10000000000','','0','',120,'',3,'','select','',154),(514,'6a1e04e8ead1fd32ea209c0609928bfb',0,0,82,'','10000000000','','0','',120,'',3,'','insert','',153),(515,'ea8ff4140f74cfd02d52f21f52741155',0,0,82,'','10000000000','','0','',120,'',3,'','update','',155),(516,'4072ece18565cab96d0dfcb5bcb2640b',0,0,82,'','10000000000','','0','',120,'',3,'','change_db','',151),(517,'35e9e24bcf0e5460424b47be8c59e7ab',0,0,82,'','10000000000','','0','',120,'',3,'','delete','',152),(518,'8883a24fdcfad2476bd5bd8061f0dee8',0,0,83,'','10000000000','','0','',120,'',3,'','read_key','',161),(519,'2e278c2a5d57217bb787be40232da352',0,0,83,'','10000000000','','0','',120,'',3,'','read_next','',162),(520,'a7a01b733e697f755a5d199852545df3',0,0,83,'','10000000000','','0','',120,'',3,'','delete','',159),(521,'8ace1fe5afe615b7f93d77215189bd9a',0,0,83,'','10000000000','','0','',120,'',3,'','read_first','',160),(522,'1b7b1c8c03a80d361cf3d92f961b957b',0,0,83,'','10000000000','','0','',120,'',3,'','read_prev','',163),(523,'ea0954b57e124eb7ccef0bec780c3ea5',0,0,83,'','10000000000','','0','',120,'',3,'','read_rnd','',164),(524,'af6f807aac100b5a9d0fe1788a097af8',0,0,83,'','10000000000','','0','',120,'',3,'','read_rnd_next','',165),(525,'42364f79f6dc801375ddfbdddacd9022',0,0,83,'','10000000000','','0','',120,'',3,'','update','',166),(526,'8ce30fb1002e640de56a2d05e24fd5f5',0,0,83,'','10000000000','','0','',120,'',3,'','write','',167),(527,'5abd5eaf93309e78257d0dcb2343cc6f',0,0,84,'','200','','0','',120,'',1,'','loadavg_1','',0),(528,'515a522746163dc5fe5f5ea32cc9f61b',0,0,85,'','200','','0','',120,'',1,'','loadavg_5','',0),(529,'d331ab6cbaf90cb4ada9decaf8f3dafb',0,0,86,'','200','','0','',120,'',1,'','loadavg_15','',0),(530,'5faffe347a7c04959e974fa8ec7e3e75',0,0,87,'','10000000','','0','',120,'',3,'','rows_read','',174),(531,'85b5fcd456ded2471ce0fd968504dd4d',0,0,87,'','10000000','','0','',120,'',3,'','rows_updated','',172),(532,'4e15ab4b88e7f4277a0fd09421b54021',0,0,87,'','10000000','','0','',120,'',3,'','rows_deleted','',173),(533,'c6c49d558b40965cb95baf34d5e85d6f',0,0,87,'','10000000','','0','',120,'',3,'','rows_inserted','',171),(534,'ce4cfe97b982adbbdcd20a2562ef646d',0,0,88,'','10000000','','0','',120,'',1,'','free_pages','',182),(535,'c316c36fb3aa827f3184b0842347d0ae',0,0,88,'','10000','','0','',120,'',1,'','hit_rate','',185),(536,'aa08f28a55bf07569fcf531a596b7a68',0,0,88,'','10000000','','0','',120,'',1,'','modified_pages','',184),(537,'5dfc827ccf05cdddd24dc6d1c3d54fbe',0,0,88,'','10000000','','0','',120,'',1,'','pool_size','',181),(538,'4a179d7ecb54a976ec17516b4ee119fb',0,0,88,'','1000000','','0','',120,'',1,'','database_pages','',183),(539,'ac7ad0a029a5591d95087e5ebbc3d6ba',0,0,89,'','10000000','','0','',120,'',3,'','os_waits','',191),(540,'d9192cd3c5583232599240794cf4778b',0,0,89,'','10000000','','0','',120,'',3,'','spin_waits','',189),(541,'1a4ad353a9d1e7112980bae82dca12ff',0,0,89,'','10000000','','0','',120,'',3,'','spin_rounds','',190),(542,'099f12855ac73c5a3fd8a785ad474195',0,0,90,'','10000000','','0','',120,'',3,'','insbuffer_merged','',179),(543,'e5ea4016e1b1927d50354ae7c8795a96',0,0,90,'','10000000','','0','',120,'',3,'','insbuffer_merges','',180),(544,'97452c906bb36e2825c85e8523542314',0,0,90,'','1000000','','0','',120,'',3,'','insbuffer_inserts','',178),(545,'65d91b021e9feba571cca553b067fc5b',0,0,91,'','10000000','','0','',120,'',3,'','file_writes','',197),(546,'a26ea7d40a84023ef6608e4a93298e22',0,0,91,'','10000000','','0','',120,'',3,'','log_writes','',192),(547,'1a08d6e555688c557fdae8d250ff1898',0,0,91,'','10000000','','0','',120,'',3,'','fsyncs','',193),(548,'1facc66bbce9faa4fb4b07f2ed351eed',0,0,91,'','10000000','','0','',120,'',3,'','reads','',196),(549,'57088d405bf3fa329e07186356cbf4e2',0,0,92,'','10000000000','','0','',120,'',3,'','rusage_system','',199),(550,'345ac5bce0029aad2662e0ea5be9fd70',0,0,92,'','10000000000','','0','',120,'',3,'','rusage_user','',201),(551,'9dcc160bb05c507e7977c4ec54b8f7b9',0,0,93,'','10000000000','','0','',120,'',1,'','total_items','',203),(552,'5ef8ed1a0c06ad92207ce60403420386',0,0,93,'','10000000000','','0','',120,'',1,'','total_connections','',204),(553,'21187f3e6e62b9c3666edcf011fcc04c',0,0,93,'','10000000000','','0','',120,'',3,'','cmd_set','',209),(554,'00226b7b8555560fa977ed5f3ca0e338',0,0,93,'','10000000000','','0','',120,'',3,'','cmd_get','',208),(555,'5f46c519912429dec846aabd83884366',0,0,93,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'get_misses',NULL,211),(556,'01157ee928497526698c6c930680c878',0,0,93,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'get_hits',NULL,210),(557,'108afbaa661f3a75f09f98285e7e76ce',0,0,93,'','10000000000','','0','',120,'',1,'','curr_items','',205),(558,'6229b139f489070291c5a124f27e6fbe',0,0,93,'','100000','','0','',120,'',1,'','curr_connections','',206),(559,'0549e0cedb76b276cd39fbb639d17671',0,0,94,'','10000000000','','0','',120,'',3,'','bytes','',202),(560,'22345b0daac3dbea96362fcbc0daaa96',0,0,94,'','10000000000','','0','',120,'',3,'','bytes_read','',212),(561,'5d9528d73fb5f4f5122e09583ebc120a',0,0,94,'','10000000000','','0','',120,'',3,'','bytes_written','',213),(562,'ac84bc5650b6b0c87d733e8ce05fab52',0,0,94,'','10000000000','','0','',120,'',3,'','limit_maxbytes','',214),(563,'5165c2f4b301a51e21ecd6448af8b90e',0,0,94,'','10000000000','','0','',120,'',3,'','connection_structur','',207),(564,'1227c4fd861d7a03fb322bf2770152c1',0,0,94,'','10000000000','','0','',120,'',3,'','curr_items','',205),(903,'',497,270,78,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_range',NULL,123),(901,'',472,269,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_scan',NULL,83),(902,'',496,270,78,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_merge_passes',NULL,122),(900,'',471,269,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_range_check',NULL,82),(899,'',470,269,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_range',NULL,81),(898,'',469,269,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Selectfullrangejoin',NULL,80),(897,'',468,269,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_full_join',NULL,79),(896,'',467,269,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_select',NULL,78),(895,'',478,268,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handlerreadrndnext',NULL,92),(894,'',477,268,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_rnd',NULL,91),(893,'',476,268,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_prev',NULL,90),(892,'',475,268,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_next',NULL,89),(891,'',474,268,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_key',NULL,88),(890,'',473,268,74,NULL,'5000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_first',NULL,87),(889,'',454,267,70,NULL,'100000',NULL,'0',NULL,120,NULL,1,NULL,'SecondsBehindMaster',NULL,55),(888,'',453,267,70,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'BinlogCacheDiskUse',NULL,53),(887,'',451,267,70,NULL,'100000000',NULL,'0',NULL,120,NULL,1,NULL,'ReadExecLogPosDiff',NULL,56),(886,'',452,267,70,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'BinlogCacheUse',NULL,54),(885,'',490,266,76,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_total_blocks',NULL,110),(884,'',489,266,76,NULL,'500000',NULL,'1',NULL,120,NULL,1,NULL,'Qcachequeriesincach',NULL,109),(883,'',488,266,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_not_cached',NULL,108),(882,'',487,266,76,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Qcachelowmemprunes',NULL,107),(881,'',486,266,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_inserts',NULL,106),(880,'',485,266,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_hits',NULL,105),(879,'',484,266,76,NULL,'10000000000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_free_memory',NULL,104),(878,'',483,266,76,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_free_blocks',NULL,103),(877,'',526,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'write',NULL,167),(876,'',525,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'update',NULL,166),(875,'',524,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_rnd_next',NULL,165),(874,'',523,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_rnd',NULL,164),(873,'',522,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_prev',NULL,163),(872,'',521,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_first',NULL,160),(871,'',520,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'delete',NULL,159),(870,'',519,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_next',NULL,162),(869,'',518,265,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_key',NULL,161),(868,'',517,264,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'delete',NULL,152),(867,'',516,264,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'change_db',NULL,151),(866,'',515,264,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'update',NULL,155),(865,'',514,264,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'insert',NULL,153),(864,'',513,264,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'select',NULL,154),(863,'',495,263,77,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Max_used_connection',NULL,118),(862,'',494,263,77,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Connections',NULL,117),(861,'',493,263,77,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Bytes_sent',NULL,116),(860,'',492,263,77,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Bytes_received',NULL,115),(859,'',491,263,77,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Questions',NULL,114),(858,'',503,262,79,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Slow_queries',NULL,132),(857,'',502,262,79,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Slow_launch_threads',NULL,131),(856,'',501,262,79,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Table_locks_waited',NULL,130),(855,'',500,262,79,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Table_locks_immedia',NULL,128),(854,'',528,261,85,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_5',NULL,0),(853,'',529,260,86,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_15',NULL,0),(852,'',527,259,84,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_1',NULL,0),(851,'',533,258,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_inserted',NULL,171),(850,'',532,258,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_deleted',NULL,173),(849,'',531,258,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_updated',NULL,172),(848,'',530,258,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_read',NULL,174),(847,'',541,257,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'spin_rounds',NULL,190),(846,'',540,257,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'spin_waits',NULL,189),(845,'',539,257,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'os_waits',NULL,191),(844,'',544,256,90,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_inserts',NULL,178),(843,'',543,256,90,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_merges',NULL,180),(842,'',542,256,90,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_merged',NULL,179),(841,'',548,255,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'reads',NULL,196),(840,'',547,255,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'fsyncs',NULL,193),(839,'',546,255,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'log_writes',NULL,192),(838,'',545,255,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'file_writes',NULL,197),(837,'',538,254,88,NULL,'1000000',NULL,'0',NULL,120,NULL,1,NULL,'database_pages',NULL,183),(836,'',537,254,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'pool_size',NULL,181),(835,'',536,254,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'modified_pages',NULL,184),(834,'',535,254,88,NULL,'10000',NULL,'0',NULL,120,NULL,1,NULL,'hit_rate',NULL,185),(833,'',534,254,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'free_pages',NULL,182),(832,'',482,253,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_writes',NULL,99),(831,'',481,253,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_write_requests',NULL,98),(830,'',480,253,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_reads',NULL,97),(829,'',479,253,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_read_requests',NULL,96),(828,'',6,252,5,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_user',NULL,0),(827,'',5,251,4,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_system',NULL,0),(826,'',7,250,6,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_nice',NULL,0),(825,'',55,249,41,NULL,'0',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(824,'',54,249,41,NULL,'0',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(823,'',55,248,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(822,'',54,248,41,NULL,'100000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(927,'',54,275,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(928,'',55,275,41,NULL,'10000000',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(929,'',54,276,41,NULL,'0',NULL,'0',NULL,120,NULL,2,NULL,'traffic_in',NULL,0),(930,'',55,276,41,NULL,'0',NULL,'0',NULL,120,NULL,2,NULL,'traffic_out',NULL,0),(931,'b8c751a67175da1b78e3fc69f3af6aa9',0,0,97,'','10000','','0','',120,'',1,'','ip_one','',220),(932,'d97107f9937a55f1a6a10fa849f35c9c',0,0,97,'','10000','','0','',120,'',1,'','ip_nine','',228),(933,'cd8c2546d02b3feb9392dae73c10c633',0,0,97,'','10000','','0','',120,'',1,'','ip_five','',224),(934,'24faa3a6aafa7ec94b6d80d467ce91e8',0,0,97,'','10000','','0','',120,'',1,'','ip_six','',225),(935,'6bd2397440420a703c31824ec01f3b55',0,0,97,'','10000','','0','',120,'',1,'','ip_seven','',226),(936,'6a37cbdd9a124429d532eacfaf111ebf',0,0,97,'','10000','','0','',120,'',1,'','ip_eight','',227),(937,'e3d464160d1908550dd746ba355f7bdf',0,0,97,'','10000','','0','',120,'',1,'','ip_four','',223),(938,'4ecfcfca73d9f02560eaf72cee25412c',0,0,97,'','10000','','0','',120,'',1,'','ip_two','',221),(939,'16eeaf975292ce3abdf6a75e61d902fc',0,0,97,'','10000','','0','',120,'',1,'','ip_three','',222),(940,'b8ae6692a0d4b0ed80d5eb1067b46bd6',0,0,98,'','20000','','0','',120,'',1,'','avg','',230),(1110,'',21,336,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1109,'',21,335,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1108,'',21,334,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1107,'',21,333,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1105,'',21,331,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1104,'',21,330,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1106,'',21,332,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1102,'',21,328,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1101,'',21,327,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1099,'',21,325,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1098,'',21,324,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1096,'',21,322,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1095,'',21,321,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1100,'',21,326,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1092,'',21,318,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1093,'',21,319,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1094,'',21,320,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(980,'',481,290,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_write_requests',NULL,98),(979,'',480,290,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_reads',NULL,97),(978,'',479,290,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_read_requests',NULL,96),(977,'',6,289,5,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_user',NULL,0),(976,'',5,288,4,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_system',NULL,0),(975,'',7,287,6,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_nice',NULL,0),(981,'',482,290,75,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'Key_writes',NULL,99),(982,'',534,291,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'free_pages',NULL,182),(983,'',535,291,88,NULL,'10000',NULL,'0',NULL,120,NULL,1,NULL,'hit_rate',NULL,185),(984,'',536,291,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'modified_pages',NULL,184),(985,'',537,291,88,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'pool_size',NULL,181),(986,'',538,291,88,NULL,'1000000',NULL,'0',NULL,120,NULL,1,NULL,'database_pages',NULL,183),(987,'',545,292,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'file_writes',NULL,197),(988,'',546,292,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'log_writes',NULL,192),(989,'',547,292,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'fsyncs',NULL,193),(990,'',548,292,91,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'reads',NULL,196),(991,'',542,293,90,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_merged',NULL,179),(992,'',543,293,90,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_merges',NULL,180),(993,'',544,293,90,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'insbuffer_inserts',NULL,178),(994,'',539,294,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'os_waits',NULL,191),(995,'',540,294,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'spin_waits',NULL,189),(996,'',541,294,89,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'spin_rounds',NULL,190),(997,'',530,295,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_read',NULL,174),(998,'',531,295,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_updated',NULL,172),(999,'',532,295,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_deleted',NULL,173),(1000,'',533,295,87,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'rows_inserted',NULL,171),(1001,'',527,296,84,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_1',NULL,0),(1002,'',529,297,86,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_15',NULL,0),(1003,'',528,298,85,NULL,'200',NULL,'0',NULL,120,NULL,1,NULL,'loadavg_5',NULL,0),(1004,'',500,299,79,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Table_locks_immedia',NULL,128),(1005,'',501,299,79,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Table_locks_waited',NULL,130),(1006,'',502,299,79,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Slow_launch_threads',NULL,131),(1007,'',503,299,79,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Slow_queries',NULL,132),(1008,'',491,300,77,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Questions',NULL,114),(1009,'',492,300,77,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Bytes_received',NULL,115),(1010,'',493,300,77,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Bytes_sent',NULL,116),(1011,'',494,300,77,NULL,'10000',NULL,'0',NULL,120,NULL,3,NULL,'Connections',NULL,117),(1012,'',495,300,77,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Max_used_connection',NULL,118),(1013,'',513,301,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'select',NULL,154),(1014,'',514,301,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'insert',NULL,153),(1015,'',515,301,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'update',NULL,155),(1016,'',516,301,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'change_db',NULL,151),(1017,'',517,301,82,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'delete',NULL,152),(1018,'',518,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_key',NULL,161),(1019,'',519,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_next',NULL,162),(1020,'',520,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'delete',NULL,159),(1021,'',521,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_first',NULL,160),(1022,'',522,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_prev',NULL,163),(1023,'',523,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_rnd',NULL,164),(1024,'',524,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'read_rnd_next',NULL,165),(1025,'',525,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'update',NULL,166),(1026,'',526,302,83,NULL,'10000000000',NULL,'0',NULL,120,NULL,3,NULL,'write',NULL,167),(1027,'',483,303,76,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_free_blocks',NULL,103),(1028,'',484,303,76,NULL,'10000000000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_free_memory',NULL,104),(1029,'',485,303,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_hits',NULL,105),(1030,'',486,303,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_inserts',NULL,106),(1031,'',487,303,76,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Qcachelowmemprunes',NULL,107),(1032,'',488,303,76,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Qcache_not_cached',NULL,108),(1033,'',489,303,76,NULL,'500000',NULL,'1',NULL,120,NULL,1,NULL,'Qcachequeriesincach',NULL,109),(1034,'',490,303,76,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Qcache_total_blocks',NULL,110),(1035,'',452,304,70,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'BinlogCacheUse',NULL,54),(1036,'',451,304,70,NULL,'100000000',NULL,'0',NULL,120,NULL,1,NULL,'ReadExecLogPosDiff',NULL,56),(1037,'',453,304,70,NULL,'10000000',NULL,'0',NULL,120,NULL,1,NULL,'BinlogCacheDiskUse',NULL,53),(1038,'',454,304,70,NULL,'100000',NULL,'0',NULL,120,NULL,1,NULL,'SecondsBehindMaster',NULL,55),(1039,'',473,305,74,NULL,'5000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_first',NULL,87),(1040,'',474,305,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_key',NULL,88),(1041,'',475,305,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_next',NULL,89),(1042,'',476,305,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_prev',NULL,90),(1043,'',477,305,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_read_rnd',NULL,91),(1044,'',478,305,74,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handlerreadrndnext',NULL,92),(1045,'',467,306,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_select',NULL,78),(1046,'',468,306,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_full_join',NULL,79),(1047,'',469,306,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Selectfullrangejoin',NULL,80),(1048,'',470,306,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_range',NULL,81),(1049,'',471,306,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_range_check',NULL,82),(1050,'',472,306,73,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Select_scan',NULL,83),(1051,'',496,307,78,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_merge_passes',NULL,122),(1052,'',497,307,78,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_range',NULL,123),(1053,'',498,307,78,NULL,'100000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_rows',NULL,124),(1054,'',499,307,78,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Sort_scan',NULL,125),(1055,'',504,308,80,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Createdtmpdisktable',NULL,136),(1056,'',505,308,80,NULL,'100000000',NULL,'0',NULL,120,NULL,3,NULL,'Created_tmp_files',NULL,137),(1057,'',506,308,80,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Created_tmp_tables',NULL,138),(1058,'',507,309,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_cached',NULL,142),(1059,'',508,309,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_connected',NULL,143),(1060,'',509,309,81,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Threads_created',NULL,144),(1061,'',510,309,81,NULL,'100000',NULL,'1',NULL,120,NULL,1,NULL,'Threads_running',NULL,145),(1062,'',511,309,81,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Aborted_clients',NULL,146),(1063,'',512,309,81,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Aborted_connects',NULL,147),(1064,'',461,310,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_commit',NULL,69),(1065,'',462,310,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_delete',NULL,70),(1066,'',463,310,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_discover',NULL,71),(1067,'',464,310,72,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_rollback',NULL,72),(1068,'',465,310,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_update',NULL,73),(1069,'',466,310,72,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Handler_write',NULL,74),(1070,'',455,311,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_delete',NULL,60),(1071,'',456,311,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_insert',NULL,61),(1072,'',457,311,71,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_insert_select',NULL,62),(1073,'',458,311,71,NULL,'100000',NULL,'0',NULL,120,NULL,3,NULL,'Com_truncate',NULL,63),(1074,'',459,311,71,NULL,'10000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_update',NULL,64),(1075,'',460,311,71,NULL,'1000000',NULL,'0',NULL,120,NULL,3,NULL,'Com_update_multi',NULL,65),(1120,'',20,342,17,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(1119,'',14,341,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_15min',NULL,19),(1118,'',13,341,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_5min',NULL,18),(1117,'',12,341,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_1min',NULL,17),(1116,'',19,340,16,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'proc',NULL,24),(1115,'',14,339,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_15min',NULL,19),(1114,'',13,339,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_5min',NULL,18),(1113,'',12,339,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_1min',NULL,17),(1112,'',21,338,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1121,'',19,343,16,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'proc',NULL,24),(1122,'',20,344,17,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(1123,'',21,345,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1124,'',21,346,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1125,'',21,347,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1126,'',21,348,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1127,'',21,349,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1128,'',21,350,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1129,'',21,351,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1130,'',21,352,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1131,'',21,353,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1132,'',21,354,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1133,'',21,355,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1134,'',21,356,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1135,'',21,357,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1136,'',21,358,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1137,'',7,359,6,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_nice',NULL,0),(1138,'',5,360,4,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_system',NULL,0),(1139,'',6,361,5,NULL,'1100',NULL,'0',NULL,120,NULL,3,NULL,'cpu_user',NULL,0),(1140,'',19,362,16,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'proc',NULL,24),(1141,'',16,363,13,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'mem_buffers',NULL,23),(1142,'',18,364,15,NULL,'0',NULL,'0',NULL,120,NULL,1,NULL,'mem_swap',NULL,23),(1143,'',3,365,3,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_free',NULL,0),(1144,'',4,365,3,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(1145,'',33,366,30,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_1min',NULL,0),(1146,'',35,367,32,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_15min',NULL,0),(1147,'',34,368,31,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'load_5min',NULL,0),(1148,'',36,369,33,NULL,'10000000',NULL,'0',NULL,600,NULL,1,NULL,'mem_buffers',NULL,0),(1149,'',95,370,47,NULL,'10000000',NULL,'0',NULL,600,NULL,1,NULL,'mem_cache',NULL,0),(1150,'',37,371,34,NULL,'10000000',NULL,'0',NULL,600,NULL,1,NULL,'mem_free',NULL,0),(1151,'',44,372,37,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_free',NULL,0),(1152,'',56,372,37,NULL,'0',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(1153,'',12,373,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_1min',NULL,17),(1154,'',13,373,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_5min',NULL,18),(1155,'',14,373,11,NULL,'500',NULL,'0',NULL,120,NULL,1,NULL,'load_15min',NULL,19),(1156,'',20,374,17,NULL,'500',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(1157,'',21,375,18,NULL,'5000',NULL,'0',NULL,600,NULL,1,NULL,'ping',NULL,30),(1158,'48c575bc1b7ba184ec9d029b7f7b8993',0,0,99,'','500','','0','',120,'',1,'','apache_busy_workers','',233),(1159,'85afbca1efca0f3310a3308aa5f0d4bb',0,0,99,'','10000','','0','',120,'',2,'','apache_total_hits','',232),(1160,'2e2ee1de2140c582c82766deac9635ac',0,0,99,'','40000','','0','',120,'',2,'','apache_total_kbytes','',231),(1161,'ad8f866fdb0f4c32ff5e762725ddc0da',0,0,99,'','1000','','0','',120,'',1,'','apache_idle_workers','',234),(1162,'262e0621d6f2426cf05ec2ffeffa3fbb',0,0,99,'','500','','0','',120,'',1,'','threadC','',243),(1163,'2eaf08230432a646cbdc87f467c55b48',0,0,99,'','500','','0','',120,'',1,'','thread_O','',244),(1164,'b076ce1c04e1a5f26e2962fffe5e66b5',0,0,99,'','500','','0','',120,'',1,'','threadD','',242),(1165,'339958d3c642605177c53735d3f11bf7',0,0,99,'','100','','0','',120,'',1,'','threadK','',239),(1166,'f165abae647861c2c9b718206016c16f',0,0,99,'','500','','0','',120,'',1,'','threadI','',240),(1167,'8dd8ee0a5661b67d418ad8436cd96de0',0,0,99,'','500','','0','',120,'',1,'','threadG','',241),(1168,'526a934ad03be0d8a4ee426c08fc903c',0,0,99,'','500','','0','',120,'',1,'','threadL','',238),(1169,'f5646c48df43e349b8fea534675a31a7',0,0,99,'','500','','0','',120,'',1,'','threadW','',245),(1170,'2751f9d4c0a502f078b315dedd9b7e8e',0,0,99,'','500','','0','',120,'',1,'','threadS','',236),(1171,'5b0314625dba894f379e9ca040c30159',0,0,99,'','500','','0','',120,'',1,'','threadR','',237),(1172,'4fe64569124da972e0df7ee93167a13c',0,0,99,'','500','','0','',120,'',1,'','thread_W','',246),(1173,'702a23816f2e3bd5db58d8fb49b7c283',0,0,99,'','100','','0','',120,'',1,'','apache_cpuload','',247);
/*!40000 ALTER TABLE `data_template_rrd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_local`
--

DROP TABLE IF EXISTS `graph_local`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_local` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) NOT NULL default '0',
  `snmp_index` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `host_id` (`host_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `snmp_query_id` (`snmp_query_id`),
  KEY `snmp_index` (`snmp_index`)
) ENGINE=MyISAM AUTO_INCREMENT=331 DEFAULT CHARSET=latin1 COMMENT='Creates a relationship for each item in a custom graph.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_local`
--

LOCK TABLES `graph_local` WRITE;
/*!40000 ALTER TABLE `graph_local` DISABLE KEYS */;
INSERT INTO `graph_local` VALUES (20,8,1,0,''),(19,10,1,0,''),(18,9,1,0,''),(17,37,1,0,''),(16,35,1,0,''),(15,12,1,0,''),(330,7,10,0,''),(329,10,10,0,''),(328,9,10,0,''),(327,21,10,0,''),(326,13,10,0,''),(325,11,10,0,''),(324,3,10,0,''),(323,12,10,0,''),(322,8,10,0,''),(321,4,10,0,''),(320,7,56,0,''),(319,7,54,0,''),(318,7,53,0,''),(317,7,52,0,''),(316,7,51,0,''),(315,7,50,0,''),(314,7,48,0,''),(313,7,47,0,''),(312,7,46,0,''),(311,7,45,0,''),(310,7,44,0,''),(309,7,43,0,''),(308,7,42,0,''),(307,7,41,0,''),(306,10,8,0,''),(305,8,9,0,''),(304,10,9,0,''),(303,9,9,0,''),(302,8,8,0,''),(301,9,8,0,''),(300,7,8,0,''),(299,7,37,0,''),(298,7,36,0,''),(297,7,35,0,''),(296,7,33,0,''),(295,7,28,0,''),(293,7,31,0,''),(292,7,32,0,''),(294,7,27,0,''),(290,7,29,0,''),(289,7,25,0,''),(287,7,18,0,''),(286,7,23,0,''),(284,7,19,0,''),(283,7,20,0,''),(280,7,24,0,''),(273,49,12,0,''),(272,50,12,0,''),(271,59,12,0,''),(270,58,12,0,''),(269,56,12,0,''),(268,51,12,0,''),(267,52,12,0,''),(266,48,12,0,''),(265,54,12,0,''),(264,62,12,0,''),(263,61,12,0,''),(262,55,12,0,''),(261,57,12,0,''),(260,63,12,0,''),(259,64,12,0,''),(258,66,12,0,''),(257,67,12,0,''),(256,68,12,0,''),(255,65,12,0,''),(254,53,12,0,''),(253,60,12,0,''),(282,7,21,0,''),(281,7,22,0,''),(242,2,12,1,'6'),(241,2,12,1,'1'),(240,49,5,0,''),(239,50,5,0,''),(238,59,5,0,''),(288,7,26,0,''),(209,49,1,0,''),(208,50,1,0,''),(207,59,1,0,''),(206,48,1,0,''),(205,62,1,0,''),(204,61,1,0,''),(172,2,10,1,'2'),(173,2,10,1,'3'),(174,60,10,0,''),(175,53,10,0,''),(176,2,11,1,'4'),(177,2,12,1,'2'),(178,2,12,1,'3'),(179,2,12,1,'4'),(180,2,12,1,'5'),(181,2,15,1,'4'),(182,2,14,1,'2'),(183,2,1,1,'2'),(184,2,1,1,'1'),(185,60,1,0,''),(186,53,1,0,''),(187,55,1,0,''),(188,54,1,0,''),(189,52,1,0,''),(190,51,1,0,''),(191,56,1,0,''),(192,58,1,0,''),(193,2,10,1,'1'),(194,2,10,1,'4'),(195,60,10,0,''),(196,53,10,0,''),(197,65,1,0,''),(198,68,1,0,''),(199,67,1,0,''),(200,66,1,0,''),(201,64,1,0,''),(202,63,1,0,''),(203,57,1,0,''),(217,2,5,1,'2'),(216,2,5,1,'1'),(237,58,5,0,''),(236,56,5,0,''),(235,51,5,0,''),(234,52,5,0,''),(233,48,5,0,''),(232,54,5,0,''),(231,62,5,0,''),(230,61,5,0,''),(229,55,5,0,''),(228,57,5,0,''),(227,63,5,0,''),(226,64,5,0,''),(225,66,5,0,''),(224,67,5,0,''),(223,68,5,0,''),(222,65,5,0,''),(221,53,5,0,''),(220,60,5,0,''),(219,2,5,1,'4'),(218,2,5,1,'3');
/*!40000 ALTER TABLE `graph_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_template_input`
--

DROP TABLE IF EXISTS `graph_template_input`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_template_input` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` text,
  `column_name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=270 DEFAULT CHARSET=latin1 COMMENT='Stores the names for graph item input groups.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_template_input`
--

LOCK TABLES `graph_template_input` WRITE;
/*!40000 ALTER TABLE `graph_template_input` DISABLE KEYS */;
INSERT INTO `graph_template_input` VALUES (3,'e9d4191277fdfd7d54171f153da57fb0',2,'Inbound Data Source','','task_item_id'),(4,'7b361722a11a03238ee8ab7ce44a1037',2,'Outbound Data Source','','task_item_id'),(5,'b33eb27833614056e06ee5952c3e0724',3,'Available Disk Space Data Source','','task_item_id'),(6,'ef8799e63ee00e8904bcc4228015784a',3,'Used Disk Space Data Source','','task_item_id'),(7,'2662ef4fbb0bf92317ffd42c7515af37',5,'Signal Level Data Source','','task_item_id'),(8,'a6edef6624c796d3a6055305e2e3d4bf',5,'Noise Level Data Source','','task_item_id'),(9,'b0e902db1875e392a9d7d69bfbb13515',5,'Signal Level Color','','color_id'),(10,'24632b1d4a561e937225d0a5fbe65e41',5,'Noise Level Color','','color_id'),(11,'6d078f1d58b70ad154a89eb80fe6ab75',6,'Transmissions Data Source','','task_item_id'),(12,'878241872dd81c68d78e6ff94871d97d',6,'Re-Transmissions Data Source','','task_item_id'),(13,'f8fcdc3a3f0e8ead33bd9751895a3462',6,'Transmissions Color','','color_id'),(14,'394ab4713a34198dddb5175aa40a2b4a',6,'Re-Transmissions Color','','color_id'),(15,'433f328369f9569446ddc59555a63eb8',7,'Ping Host Data Source','','task_item_id'),(16,'a1a91c1514c65152d8cb73522ea9d4e6',7,'Legend Color','','color_id'),(17,'2fb4deb1448379b27ddc64e30e70dc42',7,'Legend Text','','text_format'),(18,'592cedd465877bc61ab549df688b0b2a',8,'Processes Data Source','','task_item_id'),(19,'1d51dbabb200fcea5c4b157129a75410',8,'Legend Color','','color_id'),(20,'8cb8ed3378abec21a1819ea52dfee6a3',9,'1 Minute Data Source','','task_item_id'),(21,'5dfcaf9fd771deb8c5430bce1562e371',9,'5 Minute Data Source','','task_item_id'),(22,'6f3cc610315ee58bc8e0b1f272466324',9,'15 Minute Data Source','','task_item_id'),(23,'b457a982bf46c6760e6ef5f5d06d41fb',10,'Logged in Users Data Source','','task_item_id'),(24,'bd4a57adf93c884815b25a8036b67f98',10,'Legend Color','','color_id'),(25,'d7cdb63500c576e0f9f354de42c6cf3a',11,'1 Minute Data Source','','task_item_id'),(26,'a23152f5ec02e7762ca27608c0d89f6c',11,'5 Minute Data Source','','task_item_id'),(27,'2cc5d1818da577fba15115aa18f64d85',11,'15 Minute Data Source','','task_item_id'),(30,'6273c71cdb7ed4ac525cdbcf6180918c',12,'Free Data Source','','task_item_id'),(31,'5e62dbea1db699f1bda04c5863e7864d',12,'Swap Data Source','','task_item_id'),(32,'4d52e112a836d4c9d451f56602682606',4,'System CPU Data Source','','task_item_id'),(33,'f0310b066cc919d2f898b8d1ebf3b518',4,'User CPU Data Source','','task_item_id'),(34,'d9eb6b9eb3d7dd44fd14fdefb4096b54',4,'Nice CPU Data Source','','task_item_id'),(35,'f45def7cad112b450667aa67262258cb',13,'Memory Free Data Source','','task_item_id'),(36,'f8c361a8c8b7ad80e8be03ba7ea5d0d6',13,'Memory Buffers Data Source','','task_item_id'),(37,'03d11dce695963be30bd744bd6cbac69',14,'Cache Hits Data Source','','task_item_id'),(38,'9cbc515234779af4bf6cdf71a81c556a',14,'Cache Checks Data Source','','task_item_id'),(39,'2c4d561ee8132a8dda6de1104336a6ec',15,'CPU Utilization Data Source','','task_item_id'),(40,'6e1cf7addc0cc419aa903552e3eedbea',16,'File System Reads Data Source','','task_item_id'),(41,'7ea2aa0656f7064d25a36135dd0e9082',16,'File System Writes Data Source','','task_item_id'),(42,'63480bca78a38435f24a5b5d5ed050d7',17,'Current Logins Data Source','','task_item_id'),(44,'31fed1f9e139d4897d0460b10fb7be94',15,'Legend Color','','color_id'),(45,'bb9d83a02261583bc1f92d9e66ea705d',18,'CPU Usage Data Source','','task_item_id'),(46,'51196222ed37b44236d9958116028980',18,'Legend Color','','color_id'),(47,'fd26b0f437b75715d6dff983e7efa710',19,'Free Space Data Source','','task_item_id'),(48,'a463dd46862605c90ea60ccad74188db',19,'Total Space Data Source','','task_item_id'),(49,'9977dd7a41bcf0f0c02872b442c7492e',19,'Freeable Space Data Source','','task_item_id'),(51,'a7a69bbdf6890d6e6eaa7de16e815ec6',20,'Used Directory Entries Data Source','','task_item_id'),(52,'0072b613a33f1fae5ce3e5903dec8fdb',20,'Available Directory Entries Data Source','','task_item_id'),(53,'940beb0f0344e37f4c6cdfc17d2060bc',21,'Available Disk Space Data Source','','task_item_id'),(54,'7b0674dd447a9badf0d11bec688028a8',21,'Used Disk Space Data Source','','task_item_id'),(55,'fa83cd3a3b4271b644cb6459ea8c35dc',22,'Discards In Data Source','','task_item_id'),(56,'7946e8ee1e38a65462b85e31a15e35e5',22,'Errors In Data Source','','task_item_id'),(57,'00ae916640272f5aca54d73ae34c326b',23,'Unicast Packets Out Data Source','','task_item_id'),(58,'1bc1652f82488ebfb7242c65d2ffa9c7',23,'Unicast Packets In Data Source','','task_item_id'),(59,'e3177d0e56278de320db203f32fb803d',24,'Non-Unicast Packets In Data Source','','task_item_id'),(60,'4f20fba2839764707f1c3373648c5fef',24,'Non-Unicast Packets Out Data Source','','task_item_id'),(61,'e5acdd5368137c408d56ecf55b0e077c',22,'Discards Out Data Source','','task_item_id'),(62,'a028e586e5fae667127c655fe0ac67f0',22,'Errors Out Data Source','','task_item_id'),(63,'2764a4f142ba9fd95872106a1b43541e',25,'Inbound Data Source','','task_item_id'),(64,'f73f7ddc1f4349356908122093dbfca2',25,'Outbound Data Source','','task_item_id'),(65,'86bd8819d830a81d64267761e1fd8ec4',26,'Total Disk Space Data Source','','task_item_id'),(66,'6c8967850102202de166951e4411d426',26,'Used Disk Space Data Source','','task_item_id'),(67,'bdad718851a52b82eca0a310b0238450',27,'CPU Utilization Data Source','','task_item_id'),(68,'e7b578e12eb8a82627557b955fd6ebd4',27,'Legend Color','','color_id'),(69,'37d09fb7ce88ecec914728bdb20027f3',28,'Logged in Users Data Source','','task_item_id'),(70,'699bd7eff7ba0c3520db3692103a053d',28,'Legend Color','','color_id'),(71,'df905e159d13a5abed8a8a7710468831',29,'Processes Data Source','','task_item_id'),(72,'8ca9e3c65c080dbf74a59338d64b0c14',29,'Legend Color','','color_id'),(73,'69ad68fc53af03565aef501ed5f04744',30,'Open Files Data Source','','task_item_id'),(74,'562726cccdb67d5c6941e9e826ef4ef5',31,'Inbound Data Source','','task_item_id'),(75,'82426afec226f8189c8928e7f083f80f',31,'Outbound Data Source','','task_item_id'),(76,'69a23877302e7d142f254b208c58b596',32,'Inbound Data Source','','task_item_id'),(77,'f28013abf8e5813870df0f4111a5e695',32,'Outbound Data Source','','task_item_id'),(78,'8644b933b6a09dde6c32ff24655eeb9a',33,'Outbound Data Source','','task_item_id'),(79,'49c4b4800f3e638a6f6bb681919aea80',33,'Inbound Data Source','','task_item_id'),(80,'e0b395be8db4f7b938d16df7ae70065f',13,'Cache Memory Data Source','','task_item_id'),(81,'2dca37011521501b9c2b705d080db750',34,'Data Source [snmp_oid]',NULL,'task_item_id'),(82,'b8d8ade5f5f3dd7b12f8cc56bbb4083e',34,'Legend Color','','color_id'),(83,'ac2355b4895c37e14df827f969f31c12',34,'Legend Text','','text_format'),(84,'9a54ddc4619a61652af4f23dc46d4b0e',35,'Data Source [Time]','','task_item_id'),(85,'9ff6b2de9138ff464a2899c6d80bb1d4',35,'Data Source [Processes]','','task_item_id'),(86,'a4230cf161fce6ec32dfa65fbdf6098d',35,'Data Source [Threads]','','task_item_id'),(87,'2600aa2b55802194593075079b3ff217',35,'Data Source [Hosts]','','task_item_id'),(88,'6dab3c8fa41460ad4391286f9bd57396',35,'Data Source [HostsPerProcess]','','task_item_id'),(89,'c0860da34323e413a419e9afc09fc359',35,'Data Source [DataSources]','','task_item_id'),(90,'8927c4521a78f76a09a3dff2f825be80',35,'Data Source [RRDsProcessed]','','task_item_id'),(91,'998365f537fc20c18617a9e6d092cbef',36,'Data Source [service_state]','show service state','task_item_id'),(92,'7c084deaebac22c800fed716695f603e',37,'Data Source [total]','','task_item_id'),(93,'4ee32a9ba66d9adf6e99fe5295cd2bee',37,'Data Source [incoming]','','task_item_id'),(94,'8180e205d4f30099956ef12efa5871f3',38,'Data Source [ras]','','task_item_id'),(95,'b915d58b9349a13638c9d3500e305db9',38,'Data Source [management]','','task_item_id'),(96,'80426f757bdc0ecf02bee48e55b1f2c1',38,'Data Source [lan2lan]','','task_item_id'),(97,'a2c7394293f0a11b95465c5e3efd7d2a',38,'Data Source [total]','','task_item_id'),(98,'c90750b5972181beda312d1ab0d03082',39,'Data Source [Sent]','','task_item_id'),(99,'a30e08a2af0f5e1ffdee7ea4b2a8fd91',39,'Data Source [Received]','','task_item_id'),(100,'acf6064a5017feb8646446f572e24bf4',40,'Data Source [Aironet_Assoc]','','task_item_id'),(101,'7808069bc77417941c845b5f42b01c69',41,'CPU Usage Data Source','','task_item_id'),(102,'7f21cfc9b075552a535081fce81a9200',41,'Legend Color','','color_id'),(103,'86b359de28bed5de2d060646b9a5a549',41,'Data Source [1min_cpu]','','task_item_id'),(104,'b7cf57c4f91685eeacad6d595a3b6ee7',41,'Data Source [5sec_cpu]','','task_item_id'),(105,'cdc70c79a587b5385f1883b2dd0e12c6',42,'Data Source [switch_load]','','task_item_id'),(106,'5275d696d2810c9918722c3f7611d4d0',43,'Data Source [ProcMem]','','task_item_id'),(107,'973295f6e70151a4c758b683623e1fd1',44,'Graph Variable 1','','task_item_id'),(108,'b456e163de2afac2c74e885049c0ddd7',44,'Graph Variable 2','','task_item_id'),(109,'4da311ec63e3378fd31d3f7450b803c4',45,'CPU Usage Data Source','','task_item_id'),(110,'533686e10504e882704816ec8ee8ac86',45,'Legend Color','','color_id'),(111,'31872dba1d9852814ee7c07561444e81',46,'TEMP Usage Data Source','','task_item_id'),(112,'39e2240f810fc5a3829091c31935bba2',46,'Legend Color','','color_id'),(113,'8ffe4b0bca4701406949bfc1b80c5559',47,'actives session max count','','task_item_id'),(114,'22a263eb6557ef904a1750dbea7bbe4f',47,'actives session','','task_item_id'),(115,'54b185fe2277cb4060e8242adcee8584',26,'Percent Disk Space Data Source','','task_item_id'),(116,'2833c481e6c201f76ace42901c23964b',26,'Total Disk Space Data Source','','task_item_id'),(117,'0cb05806ef724ac7c0109f6fb3089c9d',48,'Data Source [BinlogCacheUse]','','task_item_id'),(118,'3b89fdc961d42652f4e03f040d37d8a5',48,'Data Source [BinlogCacheDiskUse]','','task_item_id'),(119,'bf7c39fa9b291079372083b98209b076',48,'Data Source [SecondsBehindMaster]','','task_item_id'),(120,'63d652459712253021865f74561b220e',48,'Data Source [ReadExecLogPosDiff]','','task_item_id'),(121,'ded080c756c376b6cccde7fad9b3a48a',49,'Data Source [Com_delete]','','task_item_id'),(122,'0650bdd6d5b1a4d08596ca41f0aed8cd',49,'Data Source [Com_insert]','','task_item_id'),(123,'8237927036ae4202af7e06fe31a3bfdc',49,'Data Source [Com_insert_select]','','task_item_id'),(124,'980a501882ec9beb284482db36059da0',49,'Data Source [Com_truncate]','','task_item_id'),(125,'50814938676f05978017e9c6bd83c849',49,'Data Source [Com_update]','','task_item_id'),(126,'cafaf3c2206b589c4590956ec1747fb6',49,'Data Source [Com_update_multi]','','task_item_id'),(127,'53e8a0be1adc05f9a4c83cc9c06f43e6',50,'Data Source [Handler_delete]','','task_item_id'),(128,'d8f73cab05ddc66800806c9dd0e79dd8',50,'Data Source [Handler_commit]','','task_item_id'),(129,'71dea44b0b209e126b25bb20c93321bb',50,'Data Source [Handler_discover]','','task_item_id'),(130,'2935dfe4f2f91d85515497e6f9a31ad1',50,'Data Source [Handler_rollback]','','task_item_id'),(131,'2d55859882858a513315412bee96faa4',50,'Data Source [Handler_update]','','task_item_id'),(132,'2c6de7e5ae52330d5042c662e2ec0181',50,'Data Source [Handler_write]','','task_item_id'),(133,'4c9ae78d82ef777863b2e496591b0037',51,'Data Source [Com_select]','','task_item_id'),(134,'3e1f6534e3fd620d99502f140668a6bb',51,'Data Source [Selectfullrangejoin]','','task_item_id'),(135,'41f898006f57b731edcbdb0ab374faec',51,'Data Source [Select_full_join]','','task_item_id'),(136,'99600e6d24defa5ef0c93d5201f79c40',51,'Data Source [Select_range]','','task_item_id'),(137,'a403f1823869e7364210c3cbfe18b5cd',51,'Data Source [Select_range_check]','','task_item_id'),(138,'bb0f22a18bf4e495b822027b083266ea',51,'Data Source [Select_scan]','','task_item_id'),(139,'7f82e59b806ac0101937e540e6b858ff',52,'Data Source [Handler_read_first]','','task_item_id'),(140,'4c1f70f33b1c14d834fef29b4277027d',52,'Data Source [Handler_read_key]','','task_item_id'),(141,'4191ac3e2dd80e8959f5f3e940602020',52,'Data Source [Handler_read_next]','','task_item_id'),(142,'6590ba75ff49cea1ff220ff2628ddbfb',52,'Data Source [Handler_read_prev]','','task_item_id'),(143,'62033a456893f88e98719af3c7a5a067',52,'Data Source [Handler_read_rnd]','','task_item_id'),(144,'3a33bed728030e25148261ca38dd227c',52,'Data Source [Handler_read_rnd_ne]','','task_item_id'),(145,'4cc6e9f4b847f8a675c73fdd76415a71',53,'Data Source [Key_reads]','','task_item_id'),(146,'2cf787999ceb863e6b495dd2325feef3',53,'Data Source [Key_read_requests]','','task_item_id'),(147,'36399150ac8beded296ad5b0817a5121',53,'Data Source [Key_writes]','','task_item_id'),(148,'fd5f4fca16ba531eabc4c57b80653d82',53,'Data Source [Key_write_requests]','','task_item_id'),(149,'8150629987908ee954d1ea56c63461c0',54,'Data Source [Qcachelowmemprunes]','','task_item_id'),(150,'77ba062088d5b4717bf0748401764e53',54,'Data Source [Qcachequeriesincach]','','task_item_id'),(151,'80fba21c03e2af3b5881d52a89cb9764',54,'Data Source [Qcache_free_blocks]','','task_item_id'),(152,'56bdb50bf4cf16cc135e2cad08661070',54,'Data Source [Qcache_free_memory]','','task_item_id'),(153,'1f8c057b618c85482ec9a12d97857b63',54,'Data Source [Qcache_hits]','','task_item_id'),(154,'bf2dbc830297f3d2997ae324f5385330',54,'Data Source [Qcache_inserts]','','task_item_id'),(155,'172303f4773e2016c5abfc2285bceefa',54,'Data Source [Qcache_not_cached]','','task_item_id'),(156,'e7eb92acd7b24648d70beb88fad87ac5',54,'Data Source [Qcache_total_blocks]','','task_item_id'),(157,'f62687a62b9c4396384a84399bc8423b',55,'Data Source [Connections]','','task_item_id'),(158,'dd277923ae227a56fbc146c69b2c5154',55,'Data Source [Bytes_received]','','task_item_id'),(159,'f07b0059b0db01ce570c7c872729595f',55,'Data Source [Bytes_sent]','','task_item_id'),(160,'7c1a02140049d2a50f04301a09baa202',55,'Data Source [Max_used_connection]','','task_item_id'),(161,'0dcdde3dfdee080fad26eda45fd08d72',55,'Data Source [Questions]','','task_item_id'),(162,'a19462d48521c4bb542915e22e3bdc21',56,'Data Source [Sort_merge_passes]','','task_item_id'),(163,'7c05be88d6414d9ba808874d5f087bcf',56,'Data Source [Sort_range]','','task_item_id'),(164,'8e2c366a781b4c2f4abf59b90ae3bf3f',56,'Data Source [Sort_rows]','','task_item_id'),(165,'810c6c8a5ad6ba4773ec5fe114536723',56,'Data Source [Sort_scan]','','task_item_id'),(166,'5e2aa76b9abc8c990c40765a3b54e689',57,'Data Source [Slow_launch_threads]','','task_item_id'),(167,'28e9e98d58e1833fdd7278ba6dcae35a',57,'Data Source [Slow_queries]','','task_item_id'),(168,'bdaf814432289ad7efe1f4225d492985',57,'Data Source [Table_locks_immedia]','','task_item_id'),(169,'b09a43fa6f1c21dadcd7f21c4cd01e73',57,'Data Source [Table_locks_waited]','','task_item_id'),(170,'5507ff5a13fb803bdca1277f1d4a30d3',58,'Data Source [Createdtmpdisktable]','','task_item_id'),(171,'fe6f24cd726cdda49c0b490f96c19e5e',58,'Data Source [Created_tmp_files]','','task_item_id'),(172,'c247881101220c4de60ac2399ac40810',58,'Data Source [Created_tmp_tables]','','task_item_id'),(173,'5e72934bbe1964f7f055685314afcb0e',59,'Data Source [Aborted_clients]','','task_item_id'),(174,'0c9891388be369952f8854425ee1d39b',59,'Data Source [Aborted_connects]','','task_item_id'),(175,'b64a64cb55b48fc7b81f5dfa4a754e02',59,'Data Source [Threads_cached]','','task_item_id'),(176,'6b6acc790b0533298a4398c711576728',59,'Data Source [Threads_connected]','','task_item_id'),(177,'0e491a5ceba0eebb12aca2a5f0ace52d',59,'Data Source [Threads_created]','','task_item_id'),(178,'8fc4354d7380c2aa4f01125cfc3bab09',59,'Data Source [Threads_running]','','task_item_id'),(179,'d7b3e6cf77eb608465a06b2dbfc6c198',60,'System CPU Data Source','','task_item_id'),(180,'581d76ea7811ccf807ca165f9ccb346a',60,'User CPU Data Source','','task_item_id'),(181,'c04a74a89ccd18413437d0762e570520',60,'Nice CPU Data Source','','task_item_id'),(182,'47125f191823931bb81121cdcb9d545e',61,'Data Source [change_db]','','task_item_id'),(183,'2466612e9b60a014b75e7d998a30813e',61,'Data Source [delete]','','task_item_id'),(184,'83723c779500d49833713bb23b56b0f3',61,'Data Source [insert]','','task_item_id'),(185,'5f41ca5092cded1da9a2f93bd767fc3d',61,'Data Source [select]','','task_item_id'),(186,'1086f288ef0a446cd8ea4dfd28900430',61,'Data Source [update]','','task_item_id'),(187,'26eec40f6c16c4e67e99ef84b584e102',62,'Data Source [read_next]','','task_item_id'),(188,'b80fd73c408b1fc7cf521c37f2bebb64',62,'Data Source [read_key]','','task_item_id'),(189,'d49e5eb50d554f8b628c21c483a0e38b',62,'Data Source [read_first]','','task_item_id'),(190,'9c8d7066da15a5c943a38ca2d3283b8c',62,'Data Source [read_prev]','','task_item_id'),(191,'0e4b29a6357703d75dfa1f98c07a9bc0',62,'Data Source [read_rnd]','','task_item_id'),(192,'0c9bd3a0e096c5b8df81d96d15185243',62,'Data Source [read_rnd_next]','','task_item_id'),(193,'a1fb995276b85cf42f3e218531d8f63c',62,'Data Source [delete]','','task_item_id'),(194,'82ed5b40a540457ba6fe7868925675c7',62,'Data Source [update]','','task_item_id'),(195,'8c2a459baa6c398875fb9fd0e3bf19ec',62,'Data Source [write]','','task_item_id'),(196,'5d3681dcdd2277578fc26cfcb4319cdf',63,'Data Source [loadavg_15]','','task_item_id'),(197,'c744b0d91604f89d5057e1fab3b6591b',63,'Data Source [loadavg_1]','','task_item_id'),(198,'65422f9d29558c55be9f442b00d44e61',63,'Data Source [loadavg_5]','','task_item_id'),(199,'2c36c17005a2ef00c855f4a92dc81502',64,'Data Source [rows_read]','','task_item_id'),(200,'a674542aaa92ff6a5c17732f7f5c8840',64,'Data Source [rows_deleted]','','task_item_id'),(201,'38f08bab58bc1f672d04b1b9aa5956e1',64,'Data Source [rows_inserted]','','task_item_id'),(202,'e67c13276784998536e738e9b721fbce',64,'Data Source [rows_updated]','','task_item_id'),(203,'5ce4672162dda3a2a2383324b7b5db50',65,'Data Source [database_pages]','','task_item_id'),(204,'1f8a0e7ee142ba6b6e51f26352800050',65,'Data Source [free_pages]','','task_item_id'),(205,'3ec14794fba13efef80c63839a33910b',65,'Data Source [modified_pages]','','task_item_id'),(206,'c1eb1bc2b23fa476e1653bca1211a4cf',65,'Data Source [pool_size]','','task_item_id'),(207,'7807e57c4df02d4c6b8a485661eaa2ea',65,'Data Source [hit_rate]','','task_item_id'),(208,'e25f8adf9524fd4275e7beac4c06c6c5',66,'Data Source [spin_rounds]','','task_item_id'),(209,'5b65c4c5aac1564f480f6a9cdf0d1c1b',66,'Data Source [os_waits]','','task_item_id'),(210,'881fbd5cf6204c9c77934c61d4fd88d9',66,'Data Source [spin_waits]','','task_item_id'),(211,'7d457c2ecac24384ac5b5c2bdf8c9378',67,'Data Source [insbuffer_merged]','','task_item_id'),(212,'8bd81ea86ae2169141660f487ef91b50',67,'Data Source [insbuffer_inserts]','','task_item_id'),(213,'2e3bfd4cb98058a4b0b40b16f7dc5fdf',67,'Data Source [insbuffer_merges]','','task_item_id'),(214,'f9414e98e9e9ce417634a4e80e050911',68,'Data Source [file_writes]','','task_item_id'),(215,'f8ea3968de2abe093fd7480e5d94491d',68,'Data Source [reads]','','task_item_id'),(216,'286267571bf27042ea7bc67d0df22b1d',68,'Data Source [log_writes]','','task_item_id'),(217,'41b3e28218e1ca93ba644b6c96e0162e',68,'Data Source [fsyncs]','','task_item_id'),(218,'9f5bb55a40617dc22e3185a12e030f0c',69,'Data Source [rusage_system]','','task_item_id'),(219,'55a36fe3e1b3341af60f3d49dc493274',69,'Data Source [rusage_user]','','task_item_id'),(220,'d53846e563e223da126a0435bd640dea',70,'Data Source [cmd_get]','','task_item_id'),(221,'1d38928f31dfaec25e47f79bed1d1d1c',70,'Data Source [cmd_set]','','task_item_id'),(222,'63adeeeab92d11808583e546ac9e8d3c',70,'Data Source [get_hits]','','task_item_id'),(223,'cbc5bdd26f71affb9ea5d7394c06e737',70,'Data Source [get_misses]','','task_item_id'),(224,'beca4d12add3920cf2840cdd87084ee5',70,'Data Source [curr_connections]','','task_item_id'),(225,'0c043485c6c0c5e480afc84001d01fdf',71,'Data Source [bytes_read]','','task_item_id'),(226,'a434e5a6d720d5cd5a415bc31806f3d6',71,'Data Source [bytes_written]','','task_item_id'),(227,'ffd1644fb8c450a045296507608d5abe',71,'Data Source [connection_structur]','','task_item_id'),(240,'cb2cb13d4e4c833ba211055dd695fab9',76,'Data Source [apache_total_kBytes]','','task_item_id'),(230,'20ff3f3470dd5f053c0bfec3f0dfe6b2',74,'Data Source [ip5]','','task_item_id'),(231,'234df0588f5f0df301d707684dbfab87',74,'Data Source [ip9]','','task_item_id'),(232,'0e08c7ea366947f8f60bd3590ce87171',74,'Data Source [ip8]','','task_item_id'),(233,'3cfa7d145fcf632ecc82020bdd2632de',74,'Data Source [ip3]','','task_item_id'),(234,'f038724e8493f0ba48833726398362cb',74,'Data Source [ip2]','','task_item_id'),(235,'b4c54332fb93f862ae9fc129a5220f79',74,'Data Source [ip7]','','task_item_id'),(236,'bfed8b8fd4e03fe3de34b9d1bf627eba',74,'Data Source [ip6]','','task_item_id'),(237,'3a096c3fae135e8cb3ed6e20f2f2abd1',74,'Data Source [ip1]','','task_item_id'),(238,'3005850585a3d51606f28ebf6191e95d',74,'Data Source [ip4]','','task_item_id'),(241,'bced0f41613b09ceae5b565f0eae9be5',76,'Data Source [apache_total_hits]','','task_item_id'),(242,'3d2a189fb982834b48d136235eb540fa',76,'Data Source [apache_total_kbytes]','','task_item_id'),(243,'dd44ce7e6b1362bcb1082a1dc5de2d58',76,'Data Source [apache_total_hits]','','task_item_id'),(244,'cd63214b183e293f501f9d014bf9c033',76,'Color -  Bytes/Request','','color_id'),(245,'932b0efa177b8a123f5bf648f392512f',77,'Data Source [apache_total_hits]','','task_item_id'),(246,'5d68e4fed6d7342b9dc9dbf22c1dd569',77,'Color -  Hits','','color_id'),(247,'ec55796e6c05571da3cafa215d3d41ca',78,'Data Source [apache_total_kbytes]','','task_item_id'),(248,'6c56d79fc05060d9a86fbb32fe29c50a',78,'Color - kBytes Out','','color_id'),(249,'983db09c9cb5fbb5262b16e4277b7149',79,'Data Source [apache_busy_workers]','','task_item_id'),(250,'d001ae017bac30e9690282ffc2e697d2',79,'Data Source [apache_idle_workers]','','task_item_id'),(251,'0db0442a03bd8bca2e9de69f04117faf',79,'Color - Idle Threads','','color_id'),(252,'21c69128d5cf3448b55f7d09080eb777',79,'Color - Total Threads','','color_id'),(253,'7ce4595337209d0adae3a7d645862317',79,'Color - Busy Threads','','color_id'),(254,'235e4c49bbae2609cdc488c7deed63af',80,'Data Source [apache_total_hits]','','task_item_id'),(255,'aef294c778cb757d4f5b42617d91a367',80,'Data Source [apache_idle_workers]','','task_item_id'),(256,'505eee6c77b65e92f868835635eeb1af',80,'Data Source [apache_busy_workers]','','task_item_id'),(257,'1b69554fef5ff846795aef3506ac669e',80,'Color - Idle Threads','','color_id'),(258,'dc3c045959a9e0282cfc35ea4ad7dc28',80,'Color - Busy Threads','','color_id'),(259,'9bb87a53683595968f8aa161f4764b17',81,'Data Source [apache_cpuload]','','task_item_id'),(260,'93d05f2beff9fb19d73f7eec20738ce8',82,'Data Source [thread_W]','','task_item_id'),(261,'b34c15f227fa5593c70ad408a7217e0b',82,'Data Source [threadK]','','task_item_id'),(262,'a05a4192ea1bdc58014bfa1c3ee5f46d',82,'Data Source [threadR]','','task_item_id'),(263,'4856488fde39b4c27d248bc9a2a691f8',82,'Data Source [threadW]','','task_item_id'),(264,'e564ee2acfc58c5982a319bb1e0f477b',82,'Data Source [threadS]','','task_item_id'),(265,'61a39b9e21dc5f0b914dc26df4b6d05c',82,'Data Source [threadD]','','task_item_id'),(266,'0e54440073abffdb621ef463c21d7277',82,'Data Source [threadC]','','task_item_id'),(267,'67a9cda3e4bc10ba732a56d3bf406827',82,'Data Source [threadL]','','task_item_id'),(268,'d55d2dd7fb7e3c418971bb2fab46f3f2',82,'Data Source [threadG]','','task_item_id'),(269,'90fcf5e0f67d918a7d2b82c34f5e2ce6',82,'Data Source [threadI]','','task_item_id');
/*!40000 ALTER TABLE `graph_template_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_template_input_defs`
--

DROP TABLE IF EXISTS `graph_template_input_defs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_template_input_defs` (
  `graph_template_input_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_item_id` int(12) unsigned NOT NULL default '0',
  PRIMARY KEY  (`graph_template_input_id`,`graph_template_item_id`),
  KEY `graph_template_input_id` (`graph_template_input_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Stores the relationship for what graph iitems are associated';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_template_input_defs`
--

LOCK TABLES `graph_template_input_defs` WRITE;
/*!40000 ALTER TABLE `graph_template_input_defs` DISABLE KEYS */;
INSERT INTO `graph_template_input_defs` VALUES (3,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(4,16),(5,21),(5,22),(5,23),(5,24),(6,17),(6,18),(6,19),(6,20),(7,45),(7,46),(7,47),(7,48),(8,49),(8,50),(8,51),(8,52),(9,45),(10,49),(11,53),(11,54),(11,55),(11,56),(12,57),(12,58),(12,59),(12,60),(13,53),(14,57),(15,61),(15,62),(15,63),(15,64),(16,61),(17,61),(18,65),(18,66),(18,67),(18,68),(19,65),(20,69),(20,70),(21,71),(21,72),(22,73),(22,74),(23,76),(23,77),(23,78),(23,79),(24,76),(25,80),(25,81),(26,82),(26,83),(27,84),(27,85),(30,95),(30,96),(30,97),(30,98),(31,99),(31,100),(31,101),(31,102),(32,29),(32,30),(32,31),(32,32),(33,33),(33,34),(33,35),(33,36),(34,37),(34,38),(34,39),(34,40),(35,103),(35,104),(35,105),(35,106),(36,107),(36,108),(36,109),(36,110),(37,111),(37,112),(37,113),(37,114),(38,115),(38,116),(38,117),(38,118),(39,119),(39,120),(39,121),(39,122),(40,123),(40,124),(40,125),(40,126),(41,127),(41,128),(41,129),(41,130),(42,131),(42,132),(42,133),(42,134),(44,119),(45,139),(45,140),(45,141),(45,142),(46,139),(47,143),(47,144),(47,145),(47,146),(48,147),(48,148),(48,149),(48,150),(49,151),(49,152),(49,153),(49,154),(51,159),(51,160),(51,161),(51,162),(52,163),(52,164),(52,165),(52,166),(53,172),(53,173),(53,174),(53,175),(54,167),(54,169),(54,170),(54,171),(55,180),(55,181),(55,182),(55,183),(56,184),(56,185),(56,186),(56,187),(57,188),(57,189),(57,190),(57,191),(58,192),(58,193),(58,194),(58,195),(59,196),(59,197),(59,198),(59,199),(60,200),(60,201),(60,202),(60,203),(61,204),(61,205),(61,206),(61,207),(62,208),(62,209),(62,210),(62,211),(63,212),(63,213),(63,214),(63,215),(64,216),(64,217),(64,218),(64,219),(65,307),(65,308),(65,309),(65,310),(66,303),(66,304),(66,305),(66,306),(66,548),(66,549),(66,550),(66,551),(67,315),(67,316),(67,317),(67,318),(68,315),(69,319),(69,320),(69,321),(69,322),(70,319),(71,323),(71,324),(71,325),(71,326),(72,323),(73,358),(73,359),(73,360),(73,361),(74,362),(74,363),(74,364),(74,365),(75,366),(75,367),(75,368),(75,369),(75,371),(75,372),(76,373),(76,374),(76,375),(76,376),(76,383),(77,377),(77,378),(77,379),(77,380),(77,384),(78,385),(78,386),(78,387),(78,388),(78,393),(79,389),(79,390),(79,391),(79,392),(79,394),(80,403),(80,404),(80,405),(80,406),(81,407),(81,408),(81,409),(81,410),(82,407),(83,407),(84,411),(84,412),(84,413),(84,414),(85,415),(85,416),(86,417),(86,418),(87,419),(87,420),(88,421),(88,422),(89,423),(89,424),(90,425),(90,426),(91,427),(91,428),(92,446),(92,447),(92,448),(92,449),(93,450),(93,451),(93,452),(93,453),(94,466),(94,467),(94,468),(94,469),(95,470),(95,471),(95,472),(95,473),(96,462),(96,463),(96,464),(96,465),(97,474),(97,475),(97,476),(97,477),(97,479),(98,484),(98,485),(98,486),(98,487),(98,489),(99,480),(99,481),(99,482),(99,483),(100,490),(100,491),(100,492),(100,493),(101,500),(101,501),(101,502),(101,503),(102,500),(103,498),(104,499),(105,504),(105,505),(105,506),(105,507),(106,510),(106,511),(106,512),(106,513),(107,516),(107,517),(107,518),(107,519),(108,520),(108,521),(108,522),(108,523),(109,526),(109,527),(109,528),(109,529),(109,531),(110,526),(111,532),(111,533),(111,534),(111,535),(111,537),(112,532),(113,542),(113,543),(113,544),(113,545),(113,547),(114,538),(114,539),(114,540),(114,541),(115,548),(115,549),(115,550),(115,551),(116,307),(116,308),(116,309),(116,310),(117,1748),(118,1747),(119,1746),(120,1744),(120,1745),(121,1751),(122,1752),(123,1753),(124,1754),(125,1749),(125,1750),(126,1755),(127,1758),(128,1759),(129,1760),(130,1761),(131,1756),(131,1757),(132,1762),(133,1763),(133,1764),(134,1767),(135,1766),(136,1765),(137,1768),(138,1769),(139,1776),(140,1770),(140,1771),(141,1773),(142,1775),(143,1774),(144,1772),(145,1780),(146,1777),(146,1778),(147,1781),(148,1779),(149,1789),(150,1785),(151,1788),(152,1782),(153,1786),(154,1783),(155,1784),(156,1787),(157,1795),(158,1792),(159,1790),(159,1791),(160,1793),(161,1794),(162,1799),(163,1798),(164,1796),(164,1797),(165,1800),(166,1803),(167,1804),(168,1801),(168,1802),(169,1805),(170,1808),(171,1809),(172,1806),(172,1807),(173,1810),(174,1811),(175,1812),(176,1813),(177,1814),(178,1815),(185,1857),(192,1858),(196,1908),(196,1909),(197,1903),(197,1904),(197,1905),(198,1906),(198,1907),(199,1910),(199,1911),(200,1912),(201,1913),(202,1914),(203,1915),(203,1916),(204,1917),(205,1918),(206,1919),(207,1920),(208,1923),(209,1921),(209,1922),(210,1924),(211,1927),(212,1925),(212,1926),(213,1928),(214,1931),(215,1929),(215,1930),(216,1932),(217,1933),(218,1934),(218,1935),(218,1936),(218,1937),(219,1938),(219,1939),(219,1940),(219,1941),(220,1946),(220,1947),(221,1948),(222,1950),(223,1949),(224,1951),(225,1952),(225,1953),(226,1954),(227,1955),(230,2784),(230,2785),(230,2786),(230,2787),(230,2788),(231,2804),(231,2805),(231,2806),(231,2807),(231,2808),(232,2799),(232,2800),(232,2801),(232,2802),(232,2803),(233,2774),(233,2775),(233,2776),(233,2777),(233,2778),(234,2769),(234,2770),(234,2771),(234,2772),(234,2773),(235,2794),(235,2795),(235,2796),(235,2797),(235,2798),(236,2789),(236,2790),(236,2791),(236,2792),(236,2793),(237,2764),(237,2765),(237,2766),(237,2767),(237,2768),(238,2779),(238,2780),(238,2781),(238,2782),(238,2783),(240,3521),(241,3525),(242,3521),(242,3522),(242,3523),(242,3524),(243,3525),(243,3526),(243,3527),(243,3528),(244,3517),(245,3531),(245,3532),(245,3533),(245,3534),(245,3535),(246,3531),(247,3538),(247,3539),(247,3540),(247,3541),(248,3538),(249,3545),(249,3546),(249,3547),(249,3548),(250,3549),(250,3550),(250,3551),(250,3552),(251,3549),(252,3553),(253,3545),(254,3566),(254,3567),(254,3568),(254,3569),(254,3574),(255,3566),(255,3567),(255,3568),(255,3569),(256,3562),(256,3563),(256,3564),(256,3565),(256,3573),(257,3566),(258,3562),(259,3577),(259,3578),(259,3579),(259,3580),(259,3581),(259,3582),(260,3583),(260,3584),(260,3585),(260,3586),(261,3587),(261,3588),(261,3589),(261,3590),(262,3591),(262,3592),(262,3593),(262,3594),(263,3595),(263,3596),(263,3597),(263,3598),(264,3599),(264,3600),(264,3601),(264,3602),(265,3603),(265,3604),(265,3605),(265,3606),(266,3607),(266,3608),(266,3609),(266,3610),(267,3611),(267,3612),(267,3613),(267,3614),(268,3615),(268,3616),(268,3617),(268,3618),(269,3619),(269,3620),(269,3621),(269,3622);
/*!40000 ALTER TABLE `graph_template_input_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates`
--

DROP TABLE IF EXISTS `graph_templates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_templates` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` char(32) NOT NULL default '',
  `name` char(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1 COMMENT='Contains each graph template name.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_templates`
--

LOCK TABLES `graph_templates` WRITE;
/*!40000 ALTER TABLE `graph_templates` DISABLE KEYS */;
INSERT INTO `graph_templates` VALUES (34,'010b90500e1fc6a05abfd542940584d0','SNMP - Generic OID Template'),(2,'5deb0d66c81262843dce5f3861be9966','Interface - Traffic (bits/sec)'),(3,'abb5e813c9f1e8cd6fc1e393092ef8cb','ucd/net - Available Disk Space'),(4,'e334bdcf821cd27270a4cc945e80915e','ucd/net - CPU Usage'),(5,'280e38336d77acde4672879a7db823f3','Karlnet - Wireless Levels'),(6,'3109d88e6806d2ce50c025541b542499','Karlnet - Wireless Transmissions'),(7,'cf96dfb22b58e08bf101ca825377fa4b','Unix - Ping Latency'),(8,'9fe8b4da353689d376b99b2ea526cc6b','Unix - Processes'),(9,'fe5edd777a76d48fc48c11aded5211ef','Unix - Load Average'),(10,'63610139d44d52b195cc375636653ebd','Unix - Logged in Users'),(11,'5107ec0206562e77d965ce6b852ef9d4','ucd/net - Load Average'),(12,'6992ed4df4b44f3d5595386b8298f0ec','Linux - Memory Usage'),(13,'be275639d5680e94c72c0ebb4e19056d','ucd/net - Memory Usage'),(14,'f17e4a77b8496725dc924b8c35b60036','Netware - File System Cache'),(15,'46bb77f4c0c69671980e3c60d3f22fa9','Netware - CPU Utilization'),(16,'8e77a3036312fd0fda32eaea2b5f141b','Netware - File System Activity'),(17,'5892c822b1bb2d38589b6c27934b9936','Netware - Logged In Users'),(18,'9a5e6d7781cc1bd6cf24f64dd6ffb423','Cisco - CPU Usage'),(19,'0dd0438d5e6cad6776f79ecaa96fb708','Netware - Volume Information'),(20,'b18a3742ebea48c6198412b392d757fc','Netware - Directory Information'),(21,'8e7c8a511652fe4a8e65c69f3d34779d','Unix - Available Disk Space'),(22,'06621cd4a9289417cadcb8f9b5cfba80','Interface - Errors/Discards'),(23,'e0d1625a1f4776a5294583659d5cee15','Interface - Unicast Packets'),(24,'10ca5530554da7b73dc69d291bf55d38','Interface - Non-Unicast Packets'),(25,'df244b337547b434b486662c3c5c7472','Interface - Traffic (bytes/sec)'),(26,'7489e44466abee8a7d8636cb2cb14a1a','Host MIB - Available Disk Space'),(27,'c6bb62bedec4ab97f9db9fd780bd85a6','Host MIB - CPU Utilization'),(28,'e8462bbe094e4e9e814d4e681671ea82','Host MIB - Logged in Users'),(29,'62205afbd4066e5c4700338841e3901e','Host MIB - Processes'),(30,'e3780a13b0f7a3f85a44b70cd4d2fd36','Netware - Open Files'),(31,'1742b2066384637022d178cc5072905a','Interface - Traffic (bits/sec,95th Percentile)'),(32,'13b47e10b2d5db45707d61851f69c52b','Interface - Traffic (bits/sec,Total Bandwidth)'),(33,'8ad6790c22b693680e041f21d62537ac','Interface - Traffic (bytes/sec,Total Bandwidth)'),(35,'d4d9ba31d18ea0e68f8b2fd89b1dae92','Local - Poller Statistics'),(36,'1dd684d6e77e7276e7e27c37b3d2f8b8','Win Services'),(37,'6fa46bd2855631e8680f1598e2ee29b0','Localhost - Syslog Messages'),(38,'1a7c33071d185f88fb61f16cd946a906','Cisco - 3000 - Sessions'),(39,'b2facea871af8926c468965b81e519cf','IIS - Bytes Sent and Received'),(40,'d46cf8b720ba86a09456647a47903f81','Cisco - Aironet Associations'),(41,'2ba431751da867aa5c80824460bd89e1','Cisco - CPU Usage CatOS'),(42,'6605acfd38b28ae86db4d1a2062310df','Cisco - Switch load'),(43,'bce3ac26c8b0b827d6528d927d83a930','Cisco - ProcMem Usage'),(44,'8a0f43acc9cb7a2f1d930b8ca13e1aa8','Cisco - Router Free Memory'),(45,'c76aa08badf3fc7c87ce8a3ca08307dd','Cisco VPN - CPU Usage'),(46,'c68fa6351e593bd245d5b41977b1aba1','Cisco VPN - Temperature'),(47,'9c06ea11c8a0d1ca73b90fd5ac919db7','Cisco VPN - VPN Usage'),(48,'80e310cf75b46837b9beaf58508cc1de','teMySQL - Replication'),(49,'b6a6d4bafb2b91101799ba803eaaf13d','teMySQL - Volatile Queries'),(50,'19a453319e51c348e8a982d5591ccab4','teMySQL - Volatile Handler'),(51,'7a6f5988f37b0d8a28deb84910781346','teMySQL - Select Queries'),(52,'c3d93e93bedf136130f4eb679985df48','teMySQL - Select Handler'),(53,'8eed1d2ff9f8ffd934a9acb81c88fcf1','teMySQL - Index Usage'),(54,'c3c91dbe2a1af48b4896d53f7e52b983','teMySQL - Query Cache'),(55,'a0d56b2fd3e7df1eedfb33ebf886bbfc','teMySQL - Network Usage'),(56,'aa5271e1497dea952d7142652fbcb897','teMySQL - Sorts'),(57,'61b0a5b714d09b3372d9f1936ebc62a7','teMySQL - Locking and Slow'),(58,'42e84714152fad6a87dd2e73f4a21292','teMySQL - Temporary Objects'),(59,'be477f6bdfd5479ebfca7bc377ac74dd','teMySQL - Threads/Abends'),(60,'a3fb7797a6ffc729bfe254a86d75080a','teMySQL - CPU Usage'),(61,'f5a4d6f74ed157d105a0fab65656b4c2','teMySQL - Old Command Stats'),(62,'c328115afb84f7f304954b175ff39157','teMySQL - Old Handler Stats'),(63,'5e8b2b90a9e528392d5efd42c0eecc55','teMySQL - Load Average'),(64,'a43e937f27820bb0c8ad7e53dc4d753e','teMySQL - InnoDB Row'),(65,'92ac519a5ce7da8c91f04bce1b8d1108','teMySQL - InnoDB Buffers Pages/Mem'),(66,'660bb5e5cfef9f6ff0aa71baff47a013','teMySQL - InnoDB Locks'),(67,'75f88c448006db5683f536ea30b19cea','teMySQL - InnoDB InsBuffer'),(68,'2a01ed5d916708e540a80be20d78d5da','teMySQL - InnoDB File I/O'),(69,'f65404e1a174638662b352e002d8f28e','memcached - Resource Usage'),(70,'7963a4b2e622b404f252bccb9133a182','memcached - Count Stats'),(71,'cef237b7b87e9aad11aea4d4e91b38f3','memcached - Memory/Structures'),(78,'65163b1623eba2c0e5a8914fe447d76d','WebServer - Apache Statistics - kBits / s'),(76,'af02b84a796f10ff09056be286790434','WebServer - Apache Statistics - Bytes / Request'),(74,'f52120ae05c4748fb86661e5475595d5','Unix - Multi Ping Host'),(77,'a342ccedfab3f041e9674f60fdeb8092','WebServer - Apache Statistics - Hits / s'),(79,'8e7e3b600e82fcd2b7ae3db6d647acb3','WebServer - Apache Statistics - Thread Details'),(80,'ea17e4263585560e79ef673fd8eb7950','WebServer - Apache Statistics - Thread Details (%)'),(81,'24164c23f477269d2596846b490f2295','WebServer - Apache Statistics - CPU Load'),(82,'f48dbfdb9338475a112c235dcd3d3c26','WebServer - Apache Statistics - Thread Scoreboard');
/*!40000 ALTER TABLE `graph_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_gprint`
--

DROP TABLE IF EXISTS `graph_templates_gprint`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_templates_gprint` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `gprint_text` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_templates_gprint`
--

LOCK TABLES `graph_templates_gprint` WRITE;
/*!40000 ALTER TABLE `graph_templates_gprint` DISABLE KEYS */;
INSERT INTO `graph_templates_gprint` VALUES (2,'e9c43831e54eca8069317a2ce8c6f751','Normal','%8.2lf %s'),(3,'19414480d6897c8731c7dc6c5310653e','Exact Numbers','%8.0lf'),(4,'304a778405392f878a6db435afffc1e9','Load Average','%8.2lf'),(5,'a005c2a0f4de31af7e268508217a251f','Percent','%8.2lf %%'),(6,'5a301690f6d150e82e46b38c90fbcf4b','Ping','%8.2lf ms');
/*!40000 ALTER TABLE `graph_templates_gprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_graph`
--

DROP TABLE IF EXISTS `graph_templates_graph`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_templates_graph` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `local_graph_template_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `t_image_format_id` char(2) default '0',
  `image_format_id` tinyint(1) NOT NULL default '0',
  `t_title` char(2) default '0',
  `title` varchar(255) NOT NULL default '',
  `title_cache` varchar(255) NOT NULL default '',
  `t_height` char(2) default '0',
  `height` mediumint(8) NOT NULL default '0',
  `t_width` char(2) default '0',
  `width` mediumint(8) NOT NULL default '0',
  `t_upper_limit` char(2) default '0',
  `upper_limit` varchar(20) NOT NULL default '0',
  `t_lower_limit` char(2) default '0',
  `lower_limit` varchar(20) NOT NULL default '0',
  `t_vertical_label` char(2) default '0',
  `vertical_label` varchar(200) default NULL,
  `t_slope_mode` char(2) default '0',
  `slope_mode` char(2) default 'on',
  `t_auto_scale` char(2) default '0',
  `auto_scale` char(2) default NULL,
  `t_auto_scale_opts` char(2) default '0',
  `auto_scale_opts` tinyint(1) NOT NULL default '0',
  `t_auto_scale_log` char(2) default '0',
  `auto_scale_log` char(2) default NULL,
  `t_scale_log_units` char(2) default '0',
  `scale_log_units` char(2) default NULL,
  `t_auto_scale_rigid` char(2) default '0',
  `auto_scale_rigid` char(2) default NULL,
  `t_auto_padding` char(2) default '0',
  `auto_padding` char(2) default NULL,
  `t_base_value` char(2) default '0',
  `base_value` mediumint(8) NOT NULL default '0',
  `t_grouping` char(2) default '0',
  `grouping` char(2) NOT NULL default '',
  `t_export` char(2) default '0',
  `export` char(2) default NULL,
  `t_unit_value` char(2) default '0',
  `unit_value` varchar(20) default NULL,
  `t_unit_exponent_value` char(2) default '0',
  `unit_exponent_value` varchar(5) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `title_cache` (`title_cache`)
) ENGINE=MyISAM AUTO_INCREMENT=414 DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph data.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_templates_graph`
--

LOCK TABLES `graph_templates_graph` WRITE;
/*!40000 ALTER TABLE `graph_templates_graph` DISABLE KEYS */;
INSERT INTO `graph_templates_graph` VALUES (2,0,0,2,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(3,0,0,3,'',1,'on','|host_description| - Hard Drive Space','','',120,'',500,'','100','','0','','bytes','0','on','','on','',2,'','','0','','','on','','on','',1024,'0','','','on','','','',''),(4,0,0,4,'',1,'','|host_description| - CPU Usage','','',120,'',500,'','100','','0','','percent','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(5,0,0,5,'',1,'on','|host_description| - Wireless Levels','','',120,'',500,'','100','','0','','percent','0','on','','','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(6,0,0,6,'',1,'on','|host_description| - Wireless Transmissions','','',120,'',500,'','100','','0','','transmissions','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(7,0,0,7,'',1,'','|host_description| - Ping Latency','','',120,'',500,'','100','','0','','milliseconds','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(8,0,0,8,'',1,'','|host_description| - Processes','','',120,'',500,'','100','','0','','processes','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(9,0,0,9,'',1,'','|host_description| - Load Average','','',120,'',500,'','100','','0','','processes in the run queue','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','','0'),(10,0,0,10,'',1,'','|host_description| - Logged in Users','','',120,'',500,'','100','','0','','users','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(11,0,0,11,'',1,'','|host_description| - Load Average','','',120,'',500,'','100','','0','','processes in the run queue','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','','0'),(12,0,0,12,'',1,'','|host_description| - Memory Usage','','',120,'',500,'','100','','0','','kilobytes','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(13,0,0,13,'',1,'','|host_description| - Memory Usage','','',120,'',500,'','100','','0','','bytes','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(14,0,0,14,'',1,'','|host_description| - File System Cache','','',120,'',500,'','100','','0','','cache checks/hits','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(15,0,0,15,'',1,'','|host_description| - CPU Utilization','','',120,'',500,'','100','','0','','percent','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(16,0,0,16,'',1,'','|host_description| - File System Activity','','',120,'',500,'','100','','0','','reads/writes per sec','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(17,0,0,17,'',1,'','|host_description| - Logged In Users','','',120,'',500,'','100','','0','','users','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(18,0,0,18,'',1,'','|host_description| - CPU Usage','','',120,'',500,'','100','','0','','percent','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(19,0,0,19,'',1,'on','|host_description| - Volume Information','','',120,'',500,'','100','','0','','bytes','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(20,0,0,20,'',1,'','|host_description| - Directory Information','','',120,'',500,'','100','','0','','directory entries','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(21,0,0,21,'',1,'on','|host_description| - Available Disk Space','','',120,'',500,'','100','','0','','bytes','0','on','','on','',2,'','','0','','','on','','on','',1024,'0','','','on','','','',''),(22,0,0,22,'',1,'on','|host_description| - Errors/Discards','','',120,'',500,'','100','','0','','errors/sec','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(23,0,0,23,'',1,'on','|host_description| - Unicast Packets','','',120,'',500,'','100','','0','','packets/sec','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(24,0,0,24,'',1,'on','|host_description| - Non-Unicast Packets','','',120,'',500,'','100','','0','','packets/sec','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(25,0,0,25,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bytes per second','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(34,0,0,26,'',1,'on','|host_description| - Available Disk Space','','',120,'',500,'','100','','0','','bytes','0','on','','on','',2,'','','0','','','on','','on','',1024,'0','','','on','','','',''),(35,0,0,27,'',1,'on','|host_description| - CPU Utilization','','',120,'',500,'','100','','0','','percent','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(36,0,0,28,'',1,'','|host_description| - Logged in Users','','',120,'',500,'','100','','0','','users','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(37,0,0,29,'',1,'','|host_description| - Processes','','',120,'',500,'','100','','0','','processes','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(42,0,0,30,'',1,'','|host_description| - Open Files','','',120,'',500,'','100','','0','','files','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(43,0,0,31,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(44,0,0,32,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(45,0,0,33,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bytes per second','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(47,0,0,34,'',1,'on','|host_description| -','','',120,'',500,'','100','','0','on','','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(48,0,0,35,'',1,'','Local - Poller Statistics','','',120,'',540,'','100','','0','','seconds','','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(49,0,0,36,'',1,'on','|host_description| - Services -','','',120,'',500,'','1','','0','','','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(51,0,0,37,'',1,'','|host_description| - Syslog Messages','','',120,'',500,'','100','','0','','','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(53,0,0,38,'',1,'on','|host_description| - Sessions','','',120,'',500,'','100','','0','','# of Sessions','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(54,0,0,39,'',1,'','|host_description| - IIS Traffic','','',120,'',500,'','100','','0','','bits per second','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(55,0,0,40,'',1,'','|host_description| - Associations','','',120,'',500,'','100','','0','','Associations','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(56,0,0,41,'',1,'on','|host_description| - CPU Usage','','',120,'',500,'','100','','0','','percent','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(57,0,0,42,'',1,'','|host_description| - load','','',120,'',500,'','100','','0','','','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(58,0,0,43,'',1,'','|host_description| - ProcMem Usage','','',120,'',500,'','100','','0','','','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(59,0,0,44,'',1,'on','|host_description| - Free Memory','','',120,'',500,'','100','','0','on','Bytes','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(60,0,0,45,'',1,'','|host_description| - CPU Usage','','',120,'',500,'','100','','0','','percent','0','on','','on','',2,'','','0','','','on','','on','',1000,'0','','','on','','','',''),(61,0,0,46,'',1,'','|host_description| - Temperature','','',120,'',500,'','70','','20','','degree','0','on','','','',1,'','','0','','','','','on','',1000,'0','','','on','','','',''),(62,0,0,47,'',1,'','|host_description| - VPN Usage','','',120,'',500,'','1000000000000','','0','','session','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(63,12,15,12,'0',1,'0','|host_description| - Memory Usage','Localhost - Memory Usage','0',120,'0',500,'0','100','0','0','0','kilobytes','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(64,48,16,35,'0',1,'0','Local - Poller Statistics','Local - Poller Statistics','0',120,'0',540,'0','100','0','0','0','seconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(65,51,17,37,'0',1,'0','|host_description| - Syslog Messages','Localhost - Syslog Messages','0',120,'0',500,'0','100','0','0','0','','0','on','0','on','0',2,'0','0','','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(66,9,18,9,'0',1,'0','|host_description| - Load Average','Localhost - Load Average','0',120,'0',500,'0','100','0','0','0','processes in the run queue','0','on','0','on','0',2,'0','0','','','0','on','0','on','0',1000,'0','','0','on','0','','0','0'),(67,10,19,10,'0',1,'0','|host_description| - Logged in Users','Localhost - Logged in Users','0',120,'0',500,'0','100','0','0','0','users','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(68,8,20,8,'0',1,'0','|host_description| - Processes','Localhost - Processes','0',120,'0',500,'0','100','0','0','0','processes','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(348,200,272,50,'0',1,'0','|host_description| - teMySQL - Volatile Handler','JATINEGARA 1 - teMySQL - Volatile Handler','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(347,209,271,59,'0',1,'0','|host_description| - teMySQL - Threads/Abends','JATINEGARA 1 - teMySQL - Threads/Abends','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(346,208,270,58,'0',1,'0','|host_description| - teMySQL - Temporary Objects','JATINEGARA 1 - teMySQL - Temporary Objects','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(345,206,269,56,'0',1,'0','|host_description| - teMySQL - Sorts','JATINEGARA 1 - teMySQL - Sorts','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(344,201,268,51,'0',1,'0','|host_description| - teMySQL - Select Queries','JATINEGARA 1 - teMySQL - Select Queries','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(343,202,267,52,'0',1,'0','|host_description| - teMySQL - Select Handler','JATINEGARA 1 - teMySQL - Select Handler','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(342,198,266,48,'0',1,'0','|host_description| - teMySQL - Replication','JATINEGARA 1 - teMySQL - Replication','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(341,204,265,54,'0',1,'0','|host_description| - teMySQL - Query Cache','JATINEGARA 1 - teMySQL - Query Cache','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(340,212,264,62,'0',1,'0','|host_description| - teMySQL - Old Handler Stats','JATINEGARA 1 - teMySQL - Old Handler Stats','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','access units','0',''),(339,211,263,61,'0',1,'0','|host_description| - teMySQL - Old Command Stats','JATINEGARA 1 - teMySQL - Old Command Stats','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(338,205,262,55,'0',1,'0','|host_description| - teMySQL - Network Usage','JATINEGARA 1 - teMySQL - Network Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(337,207,261,57,'0',1,'0','|host_description| - teMySQL - Locking and Slow','JATINEGARA 1 - teMySQL - Locking and Slow','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(336,213,260,63,'0',1,'0','|host_description| - teMySQL - Load Average','JATINEGARA 1 - teMySQL - Load Average','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(335,214,259,64,'0',1,'0','|host_description| - teMySQL - InnoDB Row','JATINEGARA 1 - teMySQL - InnoDB Row','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(334,216,258,66,'0',1,'0','|host_description| - teMySQL - InnoDB Locks','JATINEGARA 1 - teMySQL - InnoDB Locks','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(333,217,257,67,'0',1,'0','|host_description| - teMySQL - InnoDB InsBuffer','JATINEGARA 1 - teMySQL - InnoDB InsBuffer','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(332,218,256,68,'0',1,'0','|host_description| - teMySQL - InnoDB I/O','JATINEGARA 1 - teMySQL - InnoDB I/O','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(331,215,255,65,'0',1,'0','|host_description| - teMySQL - InnoDB BufPgMem','JATINEGARA 1 - teMySQL - InnoDB BufPgMem','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(365,7,289,7,'0',1,'0','|host_description| - Ping Latency','EMS D2 BOGOR - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(329,210,253,60,'0',1,'0','|host_description| - teMySQL - CPU Usage','JATINEGARA 1 - teMySQL - CPU Usage','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(330,203,254,53,'0',1,'0','|host_description| - teMySQL - Index Usage','JATINEGARA 1 - teMySQL - Index Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(317,0,0,74,'',1,'','|host_description| - Multi Ping','','',120,'',500,'','10000','','0','','milliseconds','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(366,7,290,7,'0',1,'0','|host_description| - Ping Latency','EMS D2 KEBAYORAN - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(316,2,242,2,'0',1,'0','|host_description| - Traffic - sit0','JATINEGARA 1 - Traffic - sit0','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(315,2,241,2,'0',1,'0','|host_description| - Traffic - lo','JATINEGARA 1 - Traffic - lo','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(314,199,240,49,'0',1,'0','|host_description| - teMySQL - Volatile Queries','OS3  Divre 2 - teMySQL - Volatile Queries','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(313,200,239,50,'0',1,'0','|host_description| - teMySQL - Volatile Handler','OS3  Divre 2 - teMySQL - Volatile Handler','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(312,209,238,59,'0',1,'0','|host_description| - teMySQL - Threads/Abends','OS3  Divre 2 - teMySQL - Threads/Abends','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(311,208,237,58,'0',1,'0','|host_description| - teMySQL - Temporary Objects','OS3  Divre 2 - teMySQL - Temporary Objects','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(362,7,286,7,'0',1,'0','|host_description| - Ping Latency','EMS D1 MEDAN - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(363,7,287,7,'0',1,'0','|host_description| - Ping Latency','EMS D1 SUMUT - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(360,7,284,7,'0',1,'0','|host_description| - Ping Latency','EMS D1 SUMBAR - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(364,7,288,7,'0',1,'0','|host_description| - Ping Latency','EMS D2 BEKASI - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(281,199,209,49,'0',1,'0','|host_description| - teMySQL - Volatile Queries','Localhost - teMySQL - Volatile Queries','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(280,200,208,50,'0',1,'0','|host_description| - teMySQL - Volatile Handler','Localhost - teMySQL - Volatile Handler','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(279,209,207,59,'0',1,'0','|host_description| - teMySQL - Threads/Abends','Localhost - teMySQL - Threads/Abends','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(278,198,206,48,'0',1,'0','|host_description| - teMySQL - Replication','Localhost - teMySQL - Replication','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(277,212,205,62,'0',1,'0','|host_description| - teMySQL - Old Handler Stats','Localhost - teMySQL - Old Handler Stats','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','access units','0',''),(276,211,204,61,'0',1,'0','|host_description| - teMySQL - Old Command Stats','Localhost - teMySQL - Old Command Stats','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(275,207,203,57,'0',1,'0','|host_description| - teMySQL - Locking and Slow','Localhost - teMySQL - Locking and Slow','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(274,213,202,63,'0',1,'0','|host_description| - teMySQL - Load Average','Localhost - teMySQL - Load Average','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(273,214,201,64,'0',1,'0','|host_description| - teMySQL - InnoDB Row','Localhost - teMySQL - InnoDB Row','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(272,216,200,66,'0',1,'0','|host_description| - teMySQL - InnoDB Locks','Localhost - teMySQL - InnoDB Locks','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(271,217,199,67,'0',1,'0','|host_description| - teMySQL - InnoDB InsBuffer','Localhost - teMySQL - InnoDB InsBuffer','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(270,218,198,68,'0',1,'0','|host_description| - teMySQL - InnoDB I/O','Localhost - teMySQL - InnoDB I/O','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(269,215,197,65,'0',1,'0','|host_description| - teMySQL - InnoDB BufPgMem','Localhost - teMySQL - InnoDB BufPgMem','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(268,203,196,53,'0',1,'0','|host_description| - teMySQL - Index Usage','DEV-OS3-V2 - DIVRE 2  - teMySQL - Index Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(267,210,195,60,'0',1,'0','|host_description| - teMySQL - CPU Usage','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU Usage','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(266,2,194,2,'0',1,'0','|host_description| - Traffic - sit0/4','DEV-OS3-V2 - DIVRE 2  - Traffic - sit0/4','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(265,2,193,2,'0',1,'0','|host_description| - Traffic - 127.0.0.1 (lo)','DEV-OS3-V2 - DIVRE 2  - Traffic - 127.0.0.1 (lo)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(264,208,192,58,'0',1,'0','|host_description| - teMySQL - Temporary Objects','Localhost - teMySQL - Temporary Objects','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(263,206,191,56,'0',1,'0','|host_description| - teMySQL - Sorts','Localhost - teMySQL - Sorts','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(262,201,190,51,'0',1,'0','|host_description| - teMySQL - Select Queries','Localhost - teMySQL - Select Queries','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(261,202,189,52,'0',1,'0','|host_description| - teMySQL - Select Handler','Localhost - teMySQL - Select Handler','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(260,204,188,54,'0',1,'0','|host_description| - teMySQL - Query Cache','Localhost - teMySQL - Query Cache','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(259,205,187,55,'0',1,'0','|host_description| - teMySQL - Network Usage','Localhost - teMySQL - Network Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(258,203,186,53,'0',1,'0','|host_description| - teMySQL - Index Usage','Localhost - teMySQL - Index Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(257,210,185,60,'0',1,'0','|host_description| - teMySQL - CPU Usage','Localhost - teMySQL - CPU Usage','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(256,2,184,2,'0',1,'0','|host_description| - Traffic - 127.0.0.1 (lo)','Localhost - Traffic - 127.0.0.1 (lo)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(255,2,183,2,'0',1,'0','|host_description| - Traffic - 10.32.18.200 (eth0)','Localhost - Traffic - 10.32.18.200 (eth0)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(254,2,182,2,'0',1,'0','|host_description| - Traffic - eth0','GAMBIR 1 - Traffic - eth0','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(253,2,181,2,'0',1,'0','|host_description| - Traffic - eth0','GAMBIR 2 - Traffic - eth0','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(252,2,180,2,'0',1,'0','|host_description| - Traffic - eth3','JATINEGARA 1 - Traffic - eth3','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(251,2,179,2,'0',1,'0','|host_description| - Traffic - eth2','JATINEGARA 1 - Traffic - eth2','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(250,2,178,2,'0',1,'0','|host_description| - Traffic - eth1','JATINEGARA 1 - Traffic - eth1','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(249,2,177,2,'0',1,'0','|host_description| - Traffic - eth0','JATINEGARA 1 - Traffic - eth0','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(248,2,176,2,'0',1,'0','|host_description| - Traffic - eth0','JATINEGARA 2 - Traffic - eth0','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(247,203,175,53,'0',1,'0','|host_description| - teMySQL - Index Usage','DEV-OS3-V2 - DIVRE 2  - teMySQL - Index Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(246,210,174,60,'0',1,'0','|host_description| - teMySQL - CPU Usage','DEV-OS3-V2 - DIVRE 2  - teMySQL - CPU Usage','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(245,2,173,2,'0',1,'0','|host_description| - Traffic - 172.16.203.69 (eth1)','DEV-OS3-V2 - DIVRE 2  - Traffic - 172.16.203.69 (eth1)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(244,2,172,2,'0',1,'0','|host_description| - Traffic - 10.32.18.97 (eth0)','DEV-OS3-V2 - DIVRE 2  - Traffic - 10.32.18.97 (eth0)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(199,0,0,49,'',1,'','|host_description| - teMySQL - Volatile Queries','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(200,0,0,50,'',1,'','|host_description| - teMySQL - Volatile Handler','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(356,7,280,7,'0',1,'0','|host_description| - Ping Latency','EMS D1 BATAM - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(357,7,281,7,'0',1,'0','|host_description| - Ping Latency','EMS D1 NAD - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(358,7,282,7,'0',1,'0','|host_description| - Ping Latency','EMS D1 PALEMBANG - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(349,199,273,49,'0',1,'0','|host_description| - teMySQL - Volatile Queries','JATINEGARA 1 - teMySQL - Volatile Queries','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(359,7,283,7,'0',1,'0','|host_description| - Ping Latency','EMS D1 RIDAR - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(198,0,0,48,'',1,'','|host_description| - teMySQL - Replication','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','on','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(397,4,321,4,'0',1,'0','|host_description| - CPU Usage','DEV-OS3-V2 - DIVRE 2  - CPU Usage','0',120,'0',500,'0','100','0','0','0','percent','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(370,7,294,7,'0',1,'0','|host_description| - Ping Latency','EMS D2 GAMBIR - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(368,7,292,7,'0',1,'0','|host_description| - Ping Latency','EMS D2 TANGERANG - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(369,7,293,7,'0',1,'0','|host_description| - Ping Latency','EMS D2 SEMANGGI2 - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(371,7,295,7,'0',1,'0','|host_description| - Ping Latency','EMS D2 JATINEGARA - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(372,7,296,7,'0',1,'0','|host_description| - Ping Latency','EMS D3 BANDUNG - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(373,7,297,7,'0',1,'0','|host_description| - Ping Latency','EMS D4 PURWOKERTO - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(374,7,298,7,'0',1,'0','|host_description| - Ping Latency','EMS D4 SEMARANG - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(375,7,299,7,'0',1,'0','|host_description| - Ping Latency','EMS D4 SOLO - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(376,7,300,7,'0',1,'0','|host_description| - Ping Latency','OS3NAS - APP01 - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(377,9,301,9,'0',1,'0','|host_description| - Load Average','OS3NAS - APP01 - Load Average','0',120,'0',500,'0','100','0','0','0','processes in the run queue','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0','0'),(378,8,302,8,'0',1,'0','|host_description| - Processes','OS3NAS - APP01 - Processes','0',120,'0',500,'0','100','0','0','0','processes','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(379,9,303,9,'0',1,'0','|host_description| - Load Average','OS3NAS - APP02 - Load Average','0',120,'0',500,'0','100','0','0','0','processes in the run queue','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0','0'),(380,10,304,10,'0',1,'0','|host_description| - Logged in Users','OS3NAS - APP02 - Logged in Users','0',120,'0',500,'0','100','0','0','0','users','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(381,8,305,8,'0',1,'0','|host_description| - Processes','OS3NAS - APP02 - Processes','0',120,'0',500,'0','100','0','0','0','processes','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(382,10,306,10,'0',1,'0','|host_description| - Logged in Users','OS3NAS - APP01 - Logged in Users','0',120,'0',500,'0','100','0','0','0','users','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(383,7,307,7,'0',1,'0','|host_description| - Ping Latency','EMS D5 MALANG - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(384,7,308,7,'0',1,'0','|host_description| - Ping Latency','EMS D5 SBB - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(385,7,309,7,'0',1,'0','|host_description| - Ping Latency','EMS D5 SBT - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(386,7,310,7,'0',1,'0','|host_description| - Ping Latency','EMS D6 BJM - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(387,7,311,7,'0',1,'0','|host_description| - Ping Latency','EMS D6 BPP - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(388,7,312,7,'0',1,'0','|host_description| - Ping Latency','EMS D6 PLK - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(389,7,313,7,'0',1,'0','|host_description| - Ping Latency','  EMS D6 PTK - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(390,7,314,7,'0',1,'0','|host_description| - Ping Latency','EMS D6 SMR - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(391,7,315,7,'0',1,'0','|host_description| - Ping Latency','EMS D7 BALI - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(392,7,316,7,'0',1,'0','|host_description| - Ping Latency','EMS D7 GORONTALO - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(393,7,317,7,'0',1,'0','|host_description| - Ping Latency','EMS D7 KENDARI - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(394,7,318,7,'0',1,'0','|host_description| - Ping Latency','EMS D7 MDO - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(395,7,319,7,'0',1,'0','|host_description| - Ping Latency','EMS D7 MKS - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(396,7,320,7,'0',1,'0','|host_description| - Ping Latency','EMS D7 PAREPARE - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(291,2,217,2,'0',1,'0','|host_description| - Traffic - 10.32.18.99 (eth0)','OS3  Divre 2 - Traffic - 10.32.18.99 (eth0)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(290,2,216,2,'0',1,'0','|host_description| - Traffic - 127.0.0.1 (lo)','OS3  Divre 2 - Traffic - 127.0.0.1 (lo)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(201,0,0,51,'',1,'','|host_description| - teMySQL - Select Queries','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(202,0,0,52,'',1,'','|host_description| - teMySQL - Select Handler','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(203,0,0,53,'',1,'','|host_description| - teMySQL - Index Usage','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(204,0,0,54,'',1,'','|host_description| - teMySQL - Query Cache','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(205,0,0,55,'',1,'','|host_description| - teMySQL - Network Usage','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(206,0,0,56,'',1,'','|host_description| - teMySQL - Sorts','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(207,0,0,57,'',1,'','|host_description| - teMySQL - Locking and Slow','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(208,0,0,58,'',1,'','|host_description| - teMySQL - Temporary Objects','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(209,0,0,59,'',1,'','|host_description| - teMySQL - Threads/Abends','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(210,0,0,60,'',1,'','|host_description| - teMySQL - CPU Usage','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','on','','on','',1000,'0','','','on','','','',''),(211,0,0,61,'',1,'','|host_description| - teMySQL - Old Command Stats','','',150,'',600,'','100','','0.1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(212,0,0,62,'',1,'','|host_description| - teMySQL - Old Handler Stats','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','access units','',''),(213,0,0,63,'',1,'','|host_description| - teMySQL - Load Average','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','on','','on','',1000,'0','','','on','','','',''),(214,0,0,64,'',1,'','|host_description| - teMySQL - InnoDB Row','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(215,0,0,65,'',1,'','|host_description| - teMySQL - InnoDB BufPgMem','','',150,'',600,'','100','','1','','','0','on','','on','',2,'','on','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(216,0,0,66,'',1,'','|host_description| - teMySQL - InnoDB Locks','','',150,'',600,'','100','','0.1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(217,0,0,67,'',1,'','|host_description| - teMySQL - InnoDB InsBuffer','','',150,'',600,'','100','','0.1','','','0','on','','on','',2,'','on','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(218,0,0,68,'',1,'','|host_description| - teMySQL - InnoDB I/O','','',150,'',600,'','100','','0.1','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(219,0,0,69,'',1,'','|host_description| - memcached - Resource Usage','','',150,'',600,'','100','','0','','CPU uSeconds','0','on','','on','',2,'','','0',NULL,'','on','','on','',1000,'0','','','on','','','',''),(220,0,0,70,'',1,'','|host_description| - memcached - Count Stats','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(221,0,0,71,'',1,'','|host_description| - memcached - Memory/Structures','','',150,'',600,'','100','','0','','','0','on','','on','',2,'','','0',NULL,'','','','on','',1000,'0','','','on','','','',''),(310,206,236,56,'0',1,'0','|host_description| - teMySQL - Sorts','OS3  Divre 2 - teMySQL - Sorts','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(309,201,235,51,'0',1,'0','|host_description| - teMySQL - Select Queries','OS3  Divre 2 - teMySQL - Select Queries','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(308,202,234,52,'0',1,'0','|host_description| - teMySQL - Select Handler','OS3  Divre 2 - teMySQL - Select Handler','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(307,198,233,48,'0',1,'0','|host_description| - teMySQL - Replication','OS3  Divre 2 - teMySQL - Replication','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(306,204,232,54,'0',1,'0','|host_description| - teMySQL - Query Cache','OS3  Divre 2 - teMySQL - Query Cache','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(305,212,231,62,'0',1,'0','|host_description| - teMySQL - Old Handler Stats','OS3  Divre 2 - teMySQL - Old Handler Stats','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','access units','0',''),(304,211,230,61,'0',1,'0','|host_description| - teMySQL - Old Command Stats','OS3  Divre 2 - teMySQL - Old Command Stats','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(303,205,229,55,'0',1,'0','|host_description| - teMySQL - Network Usage','OS3  Divre 2 - teMySQL - Network Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(302,207,228,57,'0',1,'0','|host_description| - teMySQL - Locking and Slow','OS3  Divre 2 - teMySQL - Locking and Slow','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(301,213,227,63,'0',1,'0','|host_description| - teMySQL - Load Average','OS3  Divre 2 - teMySQL - Load Average','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(300,214,226,64,'0',1,'0','|host_description| - teMySQL - InnoDB Row','OS3  Divre 2 - teMySQL - InnoDB Row','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(299,216,225,66,'0',1,'0','|host_description| - teMySQL - InnoDB Locks','OS3  Divre 2 - teMySQL - InnoDB Locks','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(298,217,224,67,'0',1,'0','|host_description| - teMySQL - InnoDB InsBuffer','OS3  Divre 2 - teMySQL - InnoDB InsBuffer','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(297,218,223,68,'0',1,'0','|host_description| - teMySQL - InnoDB I/O','OS3  Divre 2 - teMySQL - InnoDB I/O','0',150,'0',600,'0','100','0','0.1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(296,215,222,65,'0',1,'0','|host_description| - teMySQL - InnoDB BufPgMem','OS3  Divre 2 - teMySQL - InnoDB BufPgMem','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','on','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(295,203,221,53,'0',1,'0','|host_description| - teMySQL - Index Usage','OS3  Divre 2 - teMySQL - Index Usage','0',150,'0',600,'0','100','0','1','0','','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(294,210,220,60,'0',1,'0','|host_description| - teMySQL - CPU Usage','OS3  Divre 2 - teMySQL - CPU Usage','0',150,'0',600,'0','100','0','0','0','','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(293,2,219,2,'0',1,'0','|host_description| - Traffic - sit0/4','OS3  Divre 2 - Traffic - sit0/4','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(292,2,218,2,'0',1,'0','|host_description| - Traffic - 172.16.203.67 (eth1)','OS3  Divre 2 - Traffic - 172.16.203.67 (eth1)','0',120,'0',500,'0','100','0','0','0','bits per second','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(398,8,322,8,'0',1,'0','|host_description| - Processes','DEV-OS3-V2 - DIVRE 2  - Processes','0',120,'0',500,'0','100','0','0','0','processes','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(399,12,323,12,'0',1,'0','|host_description| - Memory Usage','DEV-OS3-V2 - DIVRE 2  - Memory Usage','0',120,'0',500,'0','100','0','0','0','kilobytes','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(400,3,324,3,'0',1,'0','|host_description| - Hard Drive Space','DEV-OS3-V2 - DIVRE 2  - Hard Drive Space','0',120,'0',500,'0','100','0','0','0','bytes','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1024,'0','','0','on','0','','0',''),(401,11,325,11,'0',1,'0','|host_description| - Load Average','DEV-OS3-V2 - DIVRE 2  - Load Average','0',120,'0',500,'0','100','0','0','0','processes in the run queue','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0','0'),(402,13,326,13,'0',1,'0','|host_description| - Memory Usage','DEV-OS3-V2 - DIVRE 2  - Memory Usage','0',120,'0',500,'0','100','0','0','0','bytes','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(403,21,327,21,'0',1,'0','|host_description| - Available Disk Space','DEV-OS3-V2 - DIVRE 2  - Available Disk Space','0',120,'0',500,'0','100','0','0','0','bytes','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1024,'0','','0','on','0','','0',''),(404,9,328,9,'0',1,'0','|host_description| - Load Average','DEV-OS3-V2 - DIVRE 2  - Load Average','0',120,'0',500,'0','100','0','0','0','processes in the run queue','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0','0'),(405,10,329,10,'0',1,'0','|host_description| - Logged in Users','DEV-OS3-V2 - DIVRE 2  - Logged in Users','0',120,'0',500,'0','100','0','0','0','users','0','on','0','on','0',2,'0','','0','','0','on','0','on','0',1000,'0','','0','on','0','','0',''),(406,7,330,7,'0',1,'0','|host_description| - Ping Latency','DEV-OS3-V2 - DIVRE 2  - Ping Latency','0',120,'0',500,'0','100','0','0','0','milliseconds','0','on','0','on','0',2,'0','','0','','0','','0','on','0',1000,'0','','0','on','0','','0',''),(407,0,0,76,'',1,'on','|host_description| - Apache Statistics - Bytes / Request','','',120,'',500,'','100','','0','','bytes / hit','0','on','','on','',2,'','','0','','','','','on','',1024,'0','','','on','','','',''),(408,0,0,77,'',1,'on','|host_description| - Apache Statistics - Hits / s','','',120,'',500,'','100','','0','','Hits/sec','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(409,0,0,78,'',1,'on','|host_description| - Apache Statistics - kBits / s','','',120,'',500,'','100','','0','','kBits/sec','0','on','','on','',2,'','','0','','','','','on','',1024,'0','','','on','','','',''),(410,0,0,79,'',1,'on','|host_description| - Apache Statistics - Thread Details','','',120,'',500,'','100','','0','','number of threads','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(411,0,0,80,'',1,'on','|host_description| - Apache Statistics - Thread Details (%)','','',120,'',500,'','100','','0','','number of threads','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(412,0,0,81,'',1,'','|host_description| - Apache Statistics - CPU Load','','',120,'',500,'','100','','0','','Apache CPU Load %','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','',''),(413,0,0,82,'',1,'','|host_description| - Apache Statistics - Thread Scoreboard','','',120,'',500,'','100','','0','','Threads','0','on','','on','',2,'','','0','','','','','on','',1000,'0','','','on','','','','');
/*!40000 ALTER TABLE `graph_templates_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_item`
--

DROP TABLE IF EXISTS `graph_templates_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_templates_item` (
  `id` int(12) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `local_graph_template_item_id` int(12) unsigned NOT NULL default '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `task_item_id` mediumint(8) unsigned NOT NULL default '0',
  `color_id` mediumint(8) unsigned NOT NULL default '0',
  `alpha` char(2) default 'FF',
  `graph_type_id` tinyint(3) NOT NULL default '0',
  `cdef_id` mediumint(8) unsigned NOT NULL default '0',
  `consolidation_function_id` tinyint(2) NOT NULL default '0',
  `text_format` varchar(255) default NULL,
  `value` varchar(255) default NULL,
  `hard_return` char(2) default NULL,
  `gprint_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `task_item_id` (`task_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3623 DEFAULT CHARSET=latin1 COMMENT='Stores the actual graph item data.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_templates_item`
--

LOCK TABLES `graph_templates_item` WRITE;
/*!40000 ALTER TABLE `graph_templates_item` DISABLE KEYS */;
INSERT INTO `graph_templates_item` VALUES (9,'0470b2427dbfadb6b8346e10a71268fa',0,0,2,54,22,'FF',7,2,1,'Inbound','','',2,1),(10,'84a5fe0db518550266309823f994ce9c',0,0,2,54,0,'FF',9,2,4,'Current:','','',2,2),(11,'2f222f28084085cd06a1f46e4449c793',0,0,2,54,0,'FF',9,2,1,'Average:','','',2,3),(12,'55acbcc33f46ee6d754e8e81d1b54808',0,0,2,54,0,'FF',9,2,3,'Maximum:','','on',2,4),(13,'fdaf2321fc890e355711c2bffc07d036',0,0,2,55,20,'FF',4,2,1,'Outbound','','',2,5),(14,'768318f42819217ed81196d2179d3e1b',0,0,2,55,0,'FF',9,2,4,'Current:','','',2,6),(15,'cb3aa6256dcb3acd50d4517b77a1a5c3',0,0,2,55,0,'FF',9,2,1,'Average:','','',2,7),(16,'671e989be7cbf12c623b4e79d91c7bed',0,0,2,55,0,'FF',9,2,3,'Maximum:','','',2,8),(17,'b561ed15b3ba66d277e6d7c1640b86f7',0,0,3,4,48,'FF',7,14,1,'Used','','',2,1),(18,'99ef051057fa6adfa6834a7632e9d8a2',0,0,3,4,0,'FF',9,14,4,'Current:','','',2,2),(19,'3986695132d3f4716872df4c6fbccb65',0,0,3,4,0,'FF',9,14,1,'Average:','','',2,3),(20,'0444300017b368e6257f010dca8bbd0d',0,0,3,4,0,'FF',9,14,3,'Maximum:','','on',2,4),(21,'4d6a0b9063124ca60e2d1702b3e15e41',0,0,3,3,20,'FF',8,14,1,'Available','','',2,5),(22,'181b08325e4d00cd50b8cdc8f8ae8e77',0,0,3,3,0,'FF',9,14,4,'Current:','','',2,6),(23,'bba0a9ff1357c990df50429d64314340',0,0,3,3,0,'FF',9,14,1,'Average:','','',2,7),(24,'d4a67883d53bc1df8aead21c97c0bc52',0,0,3,3,0,'FF',9,14,3,'Maximum:','','on',2,8),(25,'253c9ec2d66905245149c1c2dc8e536e',0,0,3,0,1,'FF',5,15,1,'Total','','',2,9),(26,'ea9ea883383f4eb462fec6aa309ba7b5',0,0,3,0,0,'FF',9,15,4,'Current:','','',2,10),(27,'83b746bcaba029eeca170a9f77ec4864',0,0,3,0,0,'FF',9,15,1,'Average:','','',2,11),(28,'82e01dd92fd37887c0696192efe7af65',0,0,3,0,0,'FF',9,15,3,'Maximum:','','',2,12),(29,'ff0a6125acbb029b814ed1f271ad2d38',0,0,4,5,9,'FF',7,0,1,'System','','',2,1),(30,'f0776f7d6638bba76c2c27f75a424f0f',0,0,4,5,0,'FF',9,0,4,'Current:','','',2,2),(31,'39f4e021aa3fed9207b5f45a82122b21',0,0,4,5,0,'FF',9,0,1,'Average:','','',2,3),(32,'800f0b067c06f4ec9c2316711ea83c1e',0,0,4,5,0,'FF',9,0,3,'Maximum:','','on',2,4),(33,'9419dd5dbf549ba4c5dc1462da6ee321',0,0,4,6,21,'FF',8,0,1,'User','','',2,5),(34,'e461dd263ae47657ea2bf3fd82bec096',0,0,4,6,0,'FF',9,0,4,'Current:','','',2,6),(35,'f2d1fbb8078a424ffc8a6c9d44d8caa0',0,0,4,6,0,'FF',9,0,1,'Average:','','',2,7),(36,'e70a5de639df5ba1705b5883da7fccfc',0,0,4,6,0,'FF',9,0,3,'Maximum:','','on',2,8),(37,'85fefb25ce9fd0317da2706a5463fc42',0,0,4,7,12,'FF',8,0,1,'Nice','','',2,9),(38,'a1cb26878776999db16f1de7577b3c2a',0,0,4,7,0,'FF',9,0,4,'Current:','','',2,10),(39,'7d0f9bf64a0898a0095f099674754273',0,0,4,7,0,'FF',9,0,1,'Average:','','',2,11),(40,'b2879248a522d9679333e1f29e9a87c3',0,0,4,7,0,'FF',9,0,3,'Maximum:','','on',2,12),(41,'d800aa59eee45383b3d6d35a11cdc864',0,0,4,0,1,'FF',4,12,1,'Total','','',2,13),(42,'cab4ae79a546826288e273ca1411c867',0,0,4,0,0,'FF',9,12,4,'Current:','','',2,14),(43,'d44306ae85622fec971507460be63f5c',0,0,4,0,0,'FF',9,12,1,'Average:','','',2,15),(44,'aa5c2118035bb83be497d4e099afcc0d',0,0,4,0,0,'FF',9,12,3,'Maximum:','','',2,16),(45,'4aa34ea1b7542b770ace48e8bc395a22',0,0,5,9,48,'FF',7,0,1,'Signal Level','','',2,1),(46,'22f118a9d81d0a9c8d922efbbc8a9cc1',0,0,5,9,0,'FF',9,0,4,'Current:','','',2,2),(47,'229de0c4b490de9d20d8f8d41059f933',0,0,5,9,0,'FF',9,0,1,'Average:','','',2,3),(48,'cd17feb30c02fd8f21e4d4dcde04e024',0,0,5,9,0,'FF',9,0,3,'Maximum:','','on',2,4),(49,'8723600cfd0f8a7b3f7dc1361981aabd',0,0,5,8,25,'FF',5,0,1,'Noise Level','','',2,5),(50,'cb06be2601b5abfb7a42fc07586de1c2',0,0,5,8,0,'FF',9,0,4,'Current:','','',2,6),(51,'55a2ee0fd511e5210ed85759171de58f',0,0,5,8,0,'FF',9,0,1,'Average:','','',2,7),(52,'704459564c84e42462e106eef20db169',0,0,5,8,0,'FF',9,0,3,'Maximum:','','',2,8),(53,'aaebb19ec522497eaaf8c87a631b7919',0,0,6,10,48,'FF',7,0,1,'Transmissions','','',2,1),(54,'8b54843ac9d41bce2fcedd023560ed64',0,0,6,10,0,'FF',9,0,4,'Current:','','',2,2),(55,'05927dc83e07c7d9cffef387d68f35c9',0,0,6,10,0,'FF',9,0,1,'Average:','','',2,3),(56,'d11e62225a7e7a0cdce89242002ca547',0,0,6,10,0,'FF',9,0,3,'Maximum:','','on',2,4),(57,'6397b92032486c476b0e13a35b727041',0,0,6,11,25,'FF',5,0,1,'Re-Transmissions','','',2,5),(58,'cdfa5f8f82f4c479ff7f6f54160703f6',0,0,6,11,0,'FF',9,0,4,'Current:','','',2,6),(59,'ce2a309fb9ef64f83f471895069a6f07',0,0,6,11,0,'FF',9,0,1,'Average:','','',2,7),(60,'9cbfbf57ebde435b27887f27c7d3caea',0,0,6,11,0,'FF',9,0,3,'Maximum:','','',2,8),(61,'80e0aa956f50c261e5143273da58b8a3',0,0,7,21,25,'FF',7,0,1,'','','',2,1),(62,'48fdcae893a7b7496e1a61efc3453599',0,0,7,21,0,'FF',9,0,4,'Current:','','',2,2),(63,'22f43e5fa20f2716666ba9ed9a7d1727',0,0,7,21,0,'FF',9,0,1,'Average:','','',2,3),(64,'3e86d497bcded7af7ab8408e4908e0d8',0,0,7,21,0,'FF',9,0,3,'Maximum:','','',2,4),(65,'ba00ecd28b9774348322ff70a96f2826',0,0,8,19,48,'FF',7,0,1,'Running Processes','','',2,1),(66,'8d76de808efd73c51e9a9cbd70579512',0,0,8,19,0,'FF',9,0,4,'Current:','','',3,2),(67,'304244ca63d5b09e62a94c8ec6fbda8d',0,0,8,19,0,'FF',9,0,1,'Average:','','',3,3),(68,'da1ba71a93d2ed4a2a00d54592b14157',0,0,8,19,0,'FF',9,0,3,'Maximum:','','',3,4),(69,'93ad2f2803b5edace85d86896620b9da',0,0,9,12,15,'FF',7,0,1,'1 Minute Average','','',2,1),(70,'e28736bf63d3a3bda03ea9f1e6ecb0f1',0,0,9,12,0,'FF',9,0,4,'Current:','','on',4,2),(71,'bbdfa13adc00398eed132b1ccb4337d2',0,0,9,13,8,'FF',8,0,1,'5 Minute Average','','',2,3),(72,'2c14062c7d67712f16adde06132675d6',0,0,9,13,0,'FF',9,0,4,'Current:','','on',4,4),(73,'9cf6ed48a6a54b9644a1de8c9929bd4e',0,0,9,14,9,'FF',8,0,1,'15 Minute Average','','',2,5),(74,'c9824064305b797f38feaeed2352e0e5',0,0,9,14,0,'FF',9,0,4,'Current:','','on',4,6),(75,'fa1bc4eff128c4da70f5247d55b8a444',0,0,9,0,1,'FF',4,12,1,'','','',2,7),(76,'5c94ac24bc0d6d2712cc028fa7d4c7d2',0,0,10,20,67,'FF',7,0,1,'Users','','',2,1),(77,'8bc7f905526f62df7d5c2d8c27c143c1',0,0,10,20,0,'FF',9,0,4,'Current:','','',3,2),(78,'cd074cd2b920aab70d480c020276d45b',0,0,10,20,0,'FF',9,0,1,'Average:','','',3,3),(79,'415630f25f5384ba0c82adbdb05fe98b',0,0,10,20,0,'FF',9,0,3,'Maximum:','','',3,4),(80,'d77d2050be357ab067666a9485426e6b',0,0,11,33,15,'FF',7,0,1,'1 Minute Average','','',2,1),(81,'13d22f5a0eac6d97bf6c97d7966f0a00',0,0,11,33,0,'FF',9,0,4,'Current:','','on',4,2),(82,'8580230d31d2851ec667c296a665cbf9',0,0,11,34,8,'FF',8,0,1,'5 Minute Average','','',2,3),(83,'b5b7d9b64e7640aa51dbf58c69b86d15',0,0,11,34,0,'FF',9,0,4,'Current:','','on',4,4),(84,'2ec10edf4bfaa866b7efd544d4c3f446',0,0,11,35,9,'FF',8,0,1,'15 Minute Average','','',2,5),(85,'b65666f0506c0c70966f493c19607b93',0,0,11,35,0,'FF',9,0,4,'Current:','','on',4,6),(86,'6c73575c74506cfc75b89c4276ef3455',0,0,11,0,1,'FF',4,12,1,'Total','','',2,7),(380,'0e715933830112c23c15f7e3463f77b6',0,0,32,55,0,'FF',9,2,3,'Maximum:','','',2,11),(379,'979fff9d691ca35e3f4b3383d9cae43f',0,0,32,55,0,'FF',9,2,1,'Average:','','',2,8),(378,'5bff63207c7bf076d76ff3036b5dad54',0,0,32,55,0,'FF',9,2,4,'Current:','','',2,7),(377,'4a381a8e87d4db1ac99cf8d9078266d3',0,0,32,55,20,'FF',4,2,1,'Outbound','','',2,6),(376,'88d3094d5dc2164cbf2f974aeb92f051',0,0,32,54,0,'FF',9,2,3,'Maximum:','','',2,4),(375,'54782f71929e7d1734ed5ad4b8dda50d',0,0,32,54,0,'FF',9,2,1,'Average:','','',2,3),(374,'55083351cd728b82cc4dde68eb935700',0,0,32,54,0,'FF',9,2,4,'Current:','','',2,2),(95,'5fa7c2317f19440b757ab2ea1cae6abc',0,0,12,16,41,'FF',7,14,1,'Free','','',2,9),(96,'b1d18060bfd3f68e812c508ff4ac94ed',0,0,12,16,0,'FF',9,14,4,'Current:','','',2,10),(97,'780b6f0850aaf9431d1c246c55143061',0,0,12,16,0,'FF',9,14,1,'Average:','','',2,11),(98,'2d54a7e7bb45e6c52d97a09e24b7fba7',0,0,12,16,0,'FF',9,14,3,'Maximum:','','on',2,12),(99,'40206367a3c192b836539f49801a0b15',0,0,12,18,30,'FF',8,14,1,'Swap','','',2,13),(100,'7ee72e2bb3722d4f8a7f9c564e0dd0d0',0,0,12,18,0,'FF',9,14,4,'Current:','','',2,14),(101,'c8af33b949e8f47133ee25e63c91d4d0',0,0,12,18,0,'FF',9,14,1,'Average:','','',2,15),(102,'568128a16723d1195ce6a234d353ce00',0,0,12,18,0,'FF',9,14,3,'Maximum:','','',2,16),(103,'7517a40d478e28ed88ba2b2a65e16b57',0,0,13,37,52,'FF',7,14,1,'Memory Free','','',2,1),(104,'df0c8b353d26c334cb909dc6243957c5',0,0,13,37,0,'FF',9,14,4,'Current:','','',2,2),(105,'c41a4cf6fefaf756a24f0a9510580724',0,0,13,37,0,'FF',9,14,1,'Average:','','',2,3),(106,'9efa8f01c6ed11364a21710ff170f422',0,0,13,37,0,'FF',9,14,3,'Maximum:','','on',2,4),(107,'95d6e4e5110b456f34324f7941d08318',0,0,13,36,35,'FF',8,14,1,'Memory Buffers','','',2,5),(108,'0c631bfc0785a9cca68489ea87a6c3da',0,0,13,36,0,'FF',9,14,4,'Current:','','',2,6),(109,'3468579d3b671dfb788696df7dcc1ec9',0,0,13,36,0,'FF',9,14,1,'Average:','','',2,7),(110,'c3ddfdaa65449f99b7f1a735307f9abe',0,0,13,36,0,'FF',9,14,3,'Maximum:','','on',2,8),(111,'4c64d5c1ce8b5d8b94129c23b46a5fd6',0,0,14,28,41,'FF',7,0,1,'Cache Hits','','',2,1),(112,'5c1845c9bd1af684a3c0ad843df69e3e',0,0,14,28,0,'FF',9,0,4,'Current:','','',3,2),(113,'e5169563f3f361701902a8da3ac0c77f',0,0,14,28,0,'FF',9,0,1,'Average:','','',3,3),(114,'35e87262efa521edbb1fd27f09c036f5',0,0,14,28,0,'FF',9,0,3,'Maximum:','','on',3,4),(115,'53069d7dba4c31b338f609bea4cd16f3',0,0,14,27,66,'FF',8,0,1,'Cache Checks','','',2,5),(116,'d9c102579839c5575806334d342b50de',0,0,14,27,0,'FF',9,0,4,'Current:','','',3,6),(117,'dc1897c3249dbabe269af49cee92f8c0',0,0,14,27,0,'FF',9,0,1,'Average:','','',3,7),(118,'ccd21fe0b5a8c24057f1eff4a6b66391',0,0,14,27,0,'FF',9,0,3,'Maximum:','','',3,8),(119,'ab09d41c358f6b8a9d0cad4eccc25529',0,0,15,76,9,'FF',7,0,1,'CPU Utilization','','',2,1),(120,'5d5b8d8fbe751dc9c86ee86f85d7433b',0,0,15,76,0,'FF',9,0,4,'Current:','','',3,2),(121,'4822a98464c6da2afff10c6d12df1831',0,0,15,76,0,'FF',9,0,1,'Average:','','',3,3),(122,'fc6fbf2a964bea0b3c88ed0f18616aa7',0,0,15,76,0,'FF',9,0,3,'Maximum:','','',3,4),(123,'e4094625d5443b4c87f9a87ba616a469',0,0,16,25,67,'FF',7,0,1,'File System Reads','','',2,1),(124,'ae68425cd10e8a6623076b2e6859a6aa',0,0,16,25,0,'FF',9,0,4,'Current:','','',3,2),(125,'40b8e14c6568b3f6be6a5d89d6a9f061',0,0,16,25,0,'FF',9,0,1,'Average:','','',3,3),(126,'4afbdc3851c03e206672930746b1a5e2',0,0,16,25,0,'FF',9,0,3,'Maximum:','','on',3,4),(127,'ea47d2b5516e334bc5f6ce1698a3ae76',0,0,16,26,93,'FF',8,0,1,'File System Writes','','',2,5),(128,'899c48a2f79ea3ad4629aff130d0f371',0,0,16,26,0,'FF',9,0,4,'Current:','','',3,6),(129,'ab474d7da77e9ec1f6a1d45c602580cd',0,0,16,26,0,'FF',9,0,1,'Average:','','',3,7),(130,'e143f8b4c6d4eeb6a28b052e6b8ce5a9',0,0,16,26,0,'FF',9,0,3,'Maximum:','','',3,8),(131,'facfeeb6fc2255ba2985b2d2f695d78a',0,0,17,23,30,'FF',7,0,1,'Current Logins','','',2,1),(132,'2470e43034a5560260d79084432ed14f',0,0,17,23,0,'FF',9,0,4,'Current:','','',3,2),(133,'e9e645f07bde92b52d93a7a1f65efb30',0,0,17,23,0,'FF',9,0,1,'Average:','','',3,3),(134,'bdfe0d66103211cfdaa267a44a98b092',0,0,17,23,0,'FF',9,0,3,'Maximum:','','on',3,4),(360,'5258970186e4407ed31cca2782650c45',0,0,30,29,0,'FF',9,0,1,'Average:','','',3,3),(359,'da26dd92666cb840f8a70e2ec5e90c07',0,0,30,29,0,'FF',9,0,4,'Current:','','',3,2),(358,'803b96bcaec33148901b4b562d9d2344',0,0,30,29,89,'FF',7,0,1,'Open Files','','',2,1),(139,'098b10c13a5701ddb7d4d1d2e2b0fdb7',0,0,18,30,9,'FF',7,0,1,'CPU Usage','','',2,1),(140,'1dbda412a9926b0ee5c025aa08f3b230',0,0,18,30,0,'FF',9,0,4,'Current:','','',3,2),(141,'725c45917146807b6a4257fc351f2bae',0,0,18,30,0,'FF',9,0,1,'Average:','','',3,3),(142,'4e336fdfeb84ce65f81ded0e0159a5e0',0,0,18,30,0,'FF',9,0,3,'Maximum:','','on',3,4),(143,'7dab7a3ceae2addd1cebddee6c483e7c',0,0,19,39,25,'FF',7,14,1,'Free Space','','',2,5),(144,'aea239f3ceea8c63d02e453e536190b8',0,0,19,39,0,'FF',9,14,4,'Current:','','',2,6),(145,'a0efae92968a6d4ae099b676e0f1430e',0,0,19,39,0,'FF',9,14,1,'Average:','','',2,7),(146,'4fd5ba88be16e3d513c9231b78ccf0e1',0,0,19,39,0,'FF',9,14,3,'Maximum:','','on',2,8),(147,'d2e98e51189e1d9be8888c3d5c5a4029',0,0,19,38,69,'FF',7,14,1,'Total Space','','',2,1),(148,'12829294ee3958f4a31a58a61228e027',0,0,19,38,0,'FF',9,14,4,'Current:','','',2,2),(149,'4b7e8755b0f2253723c1e9fb21fd37b1',0,0,19,38,0,'FF',9,14,1,'Average:','','',2,3),(150,'cbb19ffd7a0ead2bf61512e86d51ee8e',0,0,19,38,0,'FF',9,14,3,'Maximum:','','on',2,4),(151,'37b4cbed68f9b77e49149343069843b4',0,0,19,40,95,'FF',5,14,1,'Freeable Space','','',2,9),(152,'5eb7532200f2b5cc93e13743a7db027c',0,0,19,40,0,'FF',9,14,4,'Current:','','',2,10),(153,'b0f9f602fbeaaff090ea3f930b46c1c7',0,0,19,40,0,'FF',9,14,1,'Average:','','',2,11),(154,'06477f7ea46c63272cee7253e7cd8760',0,0,19,40,0,'FF',9,14,3,'Maximum:','','on',2,12),(171,'a751838f87068e073b95be9555c57bde',0,0,21,56,0,'FF',9,14,3,'Maximum:','','on',2,4),(170,'3b13eb2e542fe006c9bf86947a6854fa',0,0,21,56,0,'FF',9,14,1,'Average:','','',2,3),(169,'8ef3e7fb7ce962183f489725939ea40f',0,0,21,56,0,'FF',9,14,4,'Current:','','',2,2),(167,'6ca2161c37b0118786dbdb46ad767e5d',0,0,21,56,48,'FF',7,14,1,'Used','','',2,1),(159,'6877a2a5362a9390565758b08b9b37f7',0,0,20,43,77,'FF',7,0,1,'Used Directory Entries','','',2,1),(160,'a978834f3d02d833d3d2def243503bf2',0,0,20,43,0,'FF',9,0,4,'Current:','','',3,2),(161,'7422d87bc82de20a4333bd2f6460b2d4',0,0,20,43,0,'FF',9,0,1,'Average:','','',3,3),(162,'4d52762859a3fec297ebda0e7fd760d9',0,0,20,43,0,'FF',9,0,3,'Maximum:','','on',3,4),(163,'999d4ed1128ff03edf8ea47e56d361dd',0,0,20,42,1,'FF',5,0,1,'Available Directory Entries','','',2,5),(164,'3dfcd7f8c7a760ac89d34398af79b979',0,0,20,42,0,'FF',9,0,4,'Current:','','',3,6),(165,'217be75e28505c8f8148dec6b71b9b63',0,0,20,42,0,'FF',9,0,1,'Average:','','',3,7),(166,'69b89e1c5d6fc6182c93285b967f970a',0,0,20,42,0,'FF',9,0,3,'Maximum:','','',3,8),(172,'5d6dff9c14c71dc1ebf83e87f1c25695',0,0,21,44,20,'FF',8,14,1,'Available','','',2,5),(173,'b27cb9a158187d29d17abddc6fdf0f15',0,0,21,44,0,'FF',9,14,4,'Current:','','',2,6),(174,'6c0555013bb9b964e51d22f108dae9b0',0,0,21,44,0,'FF',9,14,1,'Average:','','',2,7),(175,'42ce58ec17ef5199145fbf9c6ee39869',0,0,21,44,0,'FF',9,14,3,'Maximum:','','on',2,8),(176,'9bdff98f2394f666deea028cbca685f3',0,0,21,0,1,'FF',5,15,1,'Total','','',2,9),(177,'fb831fefcf602bc31d9d24e8e456c2e6',0,0,21,0,0,'FF',9,15,4,'Current:','','',2,10),(178,'5a958d56785a606c08200ef8dbf8deef',0,0,21,0,0,'FF',9,15,1,'Average:','','',2,11),(179,'5ce67a658cec37f526dc84ac9e08d6e7',0,0,21,0,0,'FF',9,15,3,'Maximum:','','on',2,12),(180,'7e04a041721df1f8828381a9ea2f2154',0,0,22,47,31,'FF',4,0,1,'Discards In','','',2,1),(181,'afc8bca6b1b3030a6d71818272336c6c',0,0,22,47,0,'FF',9,0,4,'Current:','','',2,2),(182,'6ac169785f5aeaf1cc5cdfd38dfcfb6c',0,0,22,47,0,'FF',9,0,1,'Average:','','',2,3),(183,'178c0a0ce001d36a663ff6f213c07505',0,0,22,47,0,'FF',9,0,3,'Maximum:','','on',2,4),(184,'8e3268c0abde7550616bff719f10ee2f',0,0,22,46,48,'FF',4,0,1,'Errors In','','',2,5),(185,'18891392b149de63b62c4258a68d75f8',0,0,22,46,0,'FF',9,0,4,'Current:','','',2,6),(186,'dfc9d23de0182c9967ae3dabdfa55a16',0,0,22,46,0,'FF',9,0,1,'Average:','','',2,7),(187,'c47ba64e2e5ea8bf84aceec644513176',0,0,22,46,0,'FF',9,0,3,'Maximum:','','on',2,8),(188,'9d052e7d632c479737fbfaced0821f79',0,0,23,49,71,'FF',4,0,1,'Unicast Packets Out','','',2,5),(189,'9b9fa6268571b6a04fa4411d8e08c730',0,0,23,49,0,'FF',9,0,4,'Current:','','',2,6),(190,'8e8f2fbeb624029cbda1d2a6ddd991ba',0,0,23,49,0,'FF',9,0,1,'Average:','','',2,7),(191,'c76495beb1ed01f0799838eb8a893124',0,0,23,49,0,'FF',9,0,3,'Maximum:','','on',2,8),(192,'d4e5f253f01c3ea77182c5a46418fc44',0,0,23,48,25,'FF',7,0,1,'Unicast Packets In','','',2,1),(193,'526a96add143da021c5f00d8764a6c12',0,0,23,48,0,'FF',9,0,4,'Current:','','',2,2),(194,'81eeb46f451212f00fd7caee42a81c0b',0,0,23,48,0,'FF',9,0,1,'Average:','','',2,3),(195,'089e4d1c3faeb00fd5dcc9622b06d656',0,0,23,48,0,'FF',9,0,3,'Maximum:','','on',2,4),(196,'fe66cb973966d22250de073405664200',0,0,24,53,25,'FF',7,0,1,'Non-Unicast Packets In','','',2,1),(197,'1ba3fc3466ad32fdd2669cac6cad6faa',0,0,24,53,0,'FF',9,0,4,'Current:','','',2,2),(198,'f810154d3a934c723c21659e66199cdf',0,0,24,53,0,'FF',9,0,1,'Average:','','',2,3),(199,'98a161df359b01304346657ff1a9d787',0,0,24,53,0,'FF',9,0,3,'Maximum:','','on',2,4),(200,'d5e55eaf617ad1f0516f6343b3f07c5e',0,0,24,52,71,'FF',4,0,1,'Non-Unicast Packets Out','','',2,5),(201,'9fde6b8c84089b9f9044e681162e7567',0,0,24,52,0,'FF',9,0,4,'Current:','','',2,6),(202,'9a3510727c3d9fa7e2e7a015783a99b3',0,0,24,52,0,'FF',9,0,1,'Average:','','',2,7),(203,'451afd23f2cb59ab9b975fd6e2735815',0,0,24,52,0,'FF',9,0,3,'Maximum:','','on',2,8),(204,'617d10dff9bbc3edd9d733d9c254da76',0,0,22,50,18,'FF',4,0,1,'Discards Out','','',2,9),(205,'9269a66502c34d00ac3c8b1fcc329ac6',0,0,22,50,0,'FF',9,0,4,'Current:','','',2,10),(206,'d45deed7e1ad8350f3b46b537ae0a933',0,0,22,50,0,'FF',9,0,1,'Average:','','',2,11),(207,'2f64cf47dc156e8c800ae03c3b893e3c',0,0,22,50,0,'FF',9,0,3,'Maximum:','','on',2,12),(208,'57434bef8cb21283c1a73f055b0ada19',0,0,22,51,89,'FF',4,0,1,'Errors Out','','',2,13),(209,'660a1b9365ccbba356fd142faaec9f04',0,0,22,51,0,'FF',9,0,4,'Current:','','',2,14),(210,'28c5297bdaedcca29acf245ef4bbed9e',0,0,22,51,0,'FF',9,0,1,'Average:','','',2,15),(211,'99098604fd0c78fd7dabac8f40f1fb29',0,0,22,51,0,'FF',9,0,3,'Maximum:','','on',2,16),(212,'de3eefd6d6c58afabdabcaf6c0168378',0,0,25,54,22,'FF',7,0,1,'Inbound','','',2,1),(213,'1a80fa108f5c46eecb03090c65bc9a12',0,0,25,54,0,'FF',9,0,4,'Current:','','',2,2),(214,'fe458892e7faa9d232e343d911e845f3',0,0,25,54,0,'FF',9,0,1,'Average:','','',2,3),(215,'175c0a68689bebc38aad2fbc271047b3',0,0,25,54,0,'FF',9,0,3,'Maximum:','','on',2,4),(216,'1bf2283106510491ddf3b9c1376c0b31',0,0,25,55,20,'FF',4,0,1,'Outbound','','',2,5),(217,'c5202f1690ffe45600c0d31a4a804f67',0,0,25,55,0,'FF',9,0,4,'Current:','','',2,6),(218,'eb9794e3fdafc2b74f0819269569ed40',0,0,25,55,0,'FF',9,0,1,'Average:','','',2,7),(219,'6bcedd61e3ccf7518ca431940c93c439',0,0,25,55,0,'FF',9,0,3,'Maximum:','','',2,8),(303,'b7b381d47972f836785d338a3bef6661',0,0,26,78,0,'FF',9,0,3,'Maximum:','','on',2,8),(304,'36fa8063df3b07cece878d54443db727',0,0,26,78,0,'FF',9,0,1,'Average:','','',2,7),(305,'2c35b5cae64c5f146a55fcb416dd14b5',0,0,26,78,0,'FF',9,0,4,'Current:','','',2,6),(306,'16d6a9a7f608762ad65b0841e5ef4e9c',0,0,26,78,48,'FF',7,0,1,'Used','','',2,5),(307,'d80e4a4901ab86ee39c9cc613e13532f',0,0,26,92,20,'FF',7,0,1,'Total','','',2,1),(308,'567c2214ee4753aa712c3d101ea49a5d',0,0,26,92,0,'FF',9,0,4,'Current:','','',2,2),(309,'ba0b6a9e316ef9be66abba68b80f7587',0,0,26,92,0,'FF',9,0,1,'Average:','','',2,3),(310,'4b8e4a6bf2757f04c3e3a088338a2f7a',0,0,26,92,0,'FF',9,0,3,'Maximum:','','on',2,4),(317,'8536e034ab5268a61473f1ff2f6bd88f',0,0,27,79,0,'FF',9,0,1,'Average:','','',3,3),(316,'d478a76de1df9edf896c9ce51506c483',0,0,27,79,0,'FF',9,0,4,'Current:','','',3,2),(315,'42537599b5fb8ea852240b58a58633de',0,0,27,79,9,'FF',7,0,1,'CPU Utilization','','',2,1),(318,'87e10f9942b625aa323a0f39b60058e7',0,0,27,79,0,'FF',9,0,3,'Maximum:','','',3,4),(319,'38f6891b0db92aa8950b4ce7ae902741',0,0,28,81,67,'FF',7,0,1,'Users','','',2,1),(320,'af13152956a20aa894ef4a4067b88f63',0,0,28,81,0,'FF',9,0,4,'Current:','','',3,2),(321,'1b2388bbede4459930c57dc93645284e',0,0,28,81,0,'FF',9,0,1,'Average:','','',3,3),(322,'6407dc226db1d03be9730f4d6f3eeccf',0,0,28,81,0,'FF',9,0,3,'Maximum:','','',3,4),(323,'fca6a530c8f37476b9004a90b42ee988',0,0,29,80,48,'FF',7,0,1,'Running Processes','','',2,1),(324,'5acebbde3dc65e02f8fda03955852fbe',0,0,29,80,0,'FF',9,0,4,'Current:','','',3,2),(325,'311079ffffac75efaab2837df8123122',0,0,29,80,0,'FF',9,0,1,'Average:','','',3,3),(326,'724d27007ebf31016cfa5530fee1b867',0,0,29,80,0,'FF',9,0,3,'Maximum:','','',3,4),(373,'1995d8c23e7d8e1efa2b2c55daf3c5a7',0,0,32,54,22,'FF',7,2,1,'Inbound','','',2,1),(671,'',68,20,8,170,0,'FF',9,0,3,'Maximum:','','',3,4),(670,'',67,20,8,170,0,'FF',9,0,1,'Average:','','',3,3),(669,'',66,20,8,170,0,'FF',9,0,4,'Current:','','',3,2),(668,'',65,20,8,170,48,'FF',7,0,1,'Running Processes','','',2,1),(667,'',79,19,10,169,0,'FF',9,0,3,'Maximum:','','',3,4),(666,'',78,19,10,169,0,'FF',9,0,1,'Average:','','',3,3),(665,'',77,19,10,169,0,'FF',9,0,4,'Current:','','',3,2),(663,'',75,18,9,0,1,'FF',4,12,1,'','','',2,7),(664,'',76,19,10,169,67,'FF',7,0,1,'Users','','',2,1),(662,'',74,18,9,168,0,'FF',9,0,4,'Current:','','on',4,6),(661,'',73,18,9,168,9,'FF',8,0,1,'15 Minute Average','','',2,5),(660,'',72,18,9,167,0,'FF',9,0,4,'Current:','','on',4,4),(361,'7d08b996bde9cdc7efa650c7031137b4',0,0,30,29,0,'FF',9,0,3,'Maximum:','','on',3,4),(362,'918e6e7d41bb4bae0ea2937b461742a4',0,0,31,54,22,'FF',7,2,1,'Inbound','','',2,1),(363,'f19fbd06c989ea85acd6b4f926e4a456',0,0,31,54,0,'FF',9,2,4,'Current:','','',2,2),(364,'fc150a15e20c57e11e8d05feca557ef9',0,0,31,54,0,'FF',9,2,1,'Average:','','',2,3),(365,'ccbd86e03ccf07483b4d29e63612fb18',0,0,31,54,0,'FF',9,2,3,'Maximum:','','on',2,4),(366,'964c5c30cd05eaf5a49c0377d173de86',0,0,31,55,20,'FF',4,2,1,'Outbound','','',2,5),(367,'b1a6fb775cf62e79e1c4bc4933c7e4ce',0,0,31,55,0,'FF',9,2,4,'Current:','','',2,6),(368,'721038182a872ab266b5cf1bf7f7755c',0,0,31,55,0,'FF',9,2,1,'Average:','','',2,7),(369,'2302f80c2c70b897d12182a1fc11ecd6',0,0,31,55,0,'FF',9,2,3,'Maximum:','','on',2,8),(370,'4ffc7af8533d103748316752b70f8e3c',0,0,31,0,0,'FF',1,0,1,'','','on',2,9),(371,'64527c4b6eeeaf627acc5117ff2180fd',0,0,31,55,9,'FF',2,0,1,'95th Percentile','|95:bits:0:max:2|','',2,10),(372,'d5bbcbdbf83ae858862611ac6de8fc62',0,0,31,55,0,'FF',1,0,1,'(|95:bits:6:max:2| mbit in+out)','','',2,11),(384,'db7c15d253ca666601b3296f2574edc9',0,0,32,55,0,'FF',1,0,1,'Total Out: |sum:auto:current:2:auto|','','',2,12),(383,'5b43e4102600ad75379c5afd235099c4',0,0,32,54,0,'FF',1,0,1,'Total In:  |sum:auto:current:2:auto|','','on',2,5),(385,'fdaec5b9227522c758ad55882c483a83',0,0,33,55,0,'FF',9,0,3,'Maximum:','','',2,11),(386,'6824d29c3f13fe1e849f1dbb8377d3f1',0,0,33,55,0,'FF',9,0,1,'Average:','','',2,8),(387,'54e3971b3dd751dd2509f62721c12b41',0,0,33,55,0,'FF',9,0,4,'Current:','','',2,7),(388,'cf8c9f69878f0f595d583eac109a9be1',0,0,33,55,20,'FF',4,0,1,'Outbound','','',2,6),(389,'de265acbbfa99eb4b3e9f7e90c7feeda',0,0,33,54,0,'FF',9,0,3,'Maximum:','','',2,4),(390,'777aa88fb0a79b60d081e0e3759f1cf7',0,0,33,54,0,'FF',9,0,1,'Average:','','',2,3),(391,'66bfdb701c8eeadffe55e926d6e77e71',0,0,33,54,0,'FF',9,0,4,'Current:','','',2,2),(392,'3ff8dba1ca6279692b3fcabed0bc2631',0,0,33,54,22,'FF',7,0,1,'Inbound','','',2,1),(393,'d6041d14f9c8fb9b7ddcf3556f763c03',0,0,33,55,0,'FF',1,0,1,'Total Out: |sum:auto:current:2:auto|','','',2,12),(394,'76ae747365553a02313a2d8a0dd55c8a',0,0,33,54,0,'FF',1,0,1,'Total In:  |sum:auto:current:2:auto|','','on',2,5),(403,'8a1b44ab97d3b56207d0e9e77a035d25',0,0,13,95,30,'FF',8,14,1,'Cache Memory','','',2,9),(404,'6db3f439e9764941ff43fbaae348f5dc',0,0,13,95,0,'FF',9,14,4,'Current:','','',2,10),(405,'cc9b2fe7acf0820caa61c1519193f65e',0,0,13,95,0,'FF',9,14,1,'Average:','','',2,11),(406,'9eea140bdfeaa40d50c5cdcd1f23f72d',0,0,13,95,0,'FF',9,14,3,'Maximum:','','on',2,12),(407,'41316670b1a36171de2bda91a0cc2364',0,0,34,96,98,'FF',7,0,1,'','','',2,1),(408,'c9e8cbdca0215b434c902e68755903ea',0,0,34,96,0,'FF',9,0,4,'Current:','','',2,2),(409,'dab91d7093e720841393feea5bdcba85',0,0,34,96,0,'FF',9,0,1,'Average:','','',2,3),(410,'03e5bd2151fea3c90843eb1130b84458',0,0,34,96,0,'FF',9,0,3,'Maximum:','','on',2,4),(411,'251e5f12e6620b318f4f3533c44ab9ea',0,0,35,103,11,'FF',4,0,1,'Poller Runtime','','',2,1),(412,'fe8309518d8386cbb1c55dfc5355d230',0,0,35,103,0,'FF',9,0,4,'Current:','','',2,2),(413,'645e27c343c8c0dc49bcfa2ca1aeffbe',0,0,35,103,0,'FF',9,0,1,'Average:','','',2,3),(414,'07fe9b51844450baa60867254d3aae73',0,0,35,103,0,'FF',9,0,3,'Max:','','on',2,4),(415,'3eab3b6300dd36701eb26d5a30b43135',0,0,35,102,29,'FF',4,0,1,'Processes','','',2,5),(416,'ce03e3990109833491546964ad0d9ffd',0,0,35,102,0,'FF',9,0,4,'Current:','','on',2,6),(417,'901187e3e6bce607138536132a006974',0,0,35,101,31,'FF',4,0,1,'Threads','','',2,7),(418,'a77a01c9947d3e016b1b6d0d431a4c21',0,0,35,101,0,'FF',9,0,4,'Current:','','on',2,8),(419,'fbafaae9c5873bcb0ea5d296e78c50ea',0,0,35,100,9,'FF',4,0,1,'Hosts','','',2,9),(420,'7d862c50648383dbd4f61a7c855e9125',0,0,35,100,0,'FF',9,0,4,'Current:','','on',2,10),(421,'307b0e1d79f9e6c82422bdec60cb53fc',0,0,35,99,49,'FF',4,0,1,'Hosts per Process','','',2,11),(422,'95801ded6f69369331ffee4172831aac',0,0,35,99,0,'FF',9,0,4,'Current:','','on',2,12),(423,'d18cae02cd1fc00c58c709ab6c6c989a',0,0,35,98,21,'FF',4,0,1,'DataSources','','',2,13),(424,'b7a4edf537106e5ad15760df6eb90834',0,0,35,98,0,'FF',9,0,4,'Current:','','on',2,14),(425,'99f09a6111752a5423b53f9026dfaf8f',0,0,35,97,22,'FF',4,0,1,'RRDs','','',2,15),(426,'3f9efaf7ef5570a81836d9837e2e0305',0,0,35,97,0,'FF',9,0,4,'Current:','','on',2,16),(427,'d381f8cf89b1311eb18241194a63e952',0,0,36,104,8,'FF',7,0,4,'Service State','','',2,1),(428,'c102315246fd0cf354aeeed4ac59e384',0,0,36,104,0,'FF',9,0,4,'','','on',3,2),(429,'ed51402ff26042a819d9339a4906f3ec',0,0,36,0,0,'FF',1,0,1,'(1 = Running,0 = Stopped)','','',2,3),(659,'',71,18,9,167,8,'FF',8,0,1,'5 Minute Average','','',2,3),(658,'',70,18,9,166,0,'FF',9,0,4,'Current:','','on',4,2),(657,'',69,18,9,166,15,'FF',7,0,1,'1 Minute Average','','',2,1),(656,'',453,17,37,165,0,'FF',9,0,3,'Max:','','',3,8),(655,'',452,17,37,165,0,'FF',9,0,1,'Average:','','',3,7),(654,'',451,17,37,165,0,'FF',9,0,4,'Current:','','',3,6),(652,'',449,17,37,164,0,'FF',9,0,3,'Max:','','on',3,4),(653,'',450,17,37,165,10,'FF',4,0,1,'Processed','','',3,5),(651,'',448,17,37,164,0,'FF',9,0,1,'Average:','','',3,3),(649,'',446,17,37,164,35,'FF',7,0,1,'New','','',3,1),(650,'',447,17,37,164,0,'FF',9,0,4,'Current:','','',3,2),(648,'',426,16,35,157,0,'FF',9,0,4,'Current:','','on',2,16),(446,'be2d31bbf2909bf41c22c3529fa5d015',0,0,37,112,35,'FF',7,0,1,'New','','',3,1),(447,'57366cf4ba9bb0a4c1bd1d507812a9ba',0,0,37,112,0,'FF',9,0,4,'Current:','','',3,2),(448,'e09000ffaac468330cc5ec71f6b50666',0,0,37,112,0,'FF',9,0,1,'Average:','','',3,3),(449,'d79cd2d157ba3d1277fac8d023a885d7',0,0,37,112,0,'FF',9,0,3,'Max:','','on',3,4),(450,'0306c981e9e40a8d1ec3380a11b4292e',0,0,37,113,10,'FF',4,0,1,'Processed','','',3,5),(451,'0368e7d77cff2e35313a5cadfca50353',0,0,37,113,0,'FF',9,0,4,'Current:','','',3,6),(452,'062825473ef104f2e2a6a28b40d5d274',0,0,37,113,0,'FF',9,0,1,'Average:','','',3,7),(453,'2b48a51e0222da761f9b5b4bf116d55d',0,0,37,113,0,'FF',9,0,3,'Max:','','',3,8),(647,'',425,16,35,157,22,'FF',4,0,1,'RRDs','','',2,15),(646,'',424,16,35,158,0,'FF',9,0,4,'Current:','','on',2,14),(645,'',423,16,35,158,21,'FF',4,0,1,'DataSources','','',2,13),(644,'',422,16,35,159,0,'FF',9,0,4,'Current:','','on',2,12),(462,'7cea4c8ddbbe127db4100345f8af008d',0,0,38,116,4,'FF',7,0,1,'Lan 2 Lan','','',3,1),(463,'24f5b60327288a27c82c1813f2297fb7',0,0,38,116,0,'FF',9,0,4,'Current:','','',3,2),(464,'c3f992a39b5f5d9576a4fff64b3f0726',0,0,38,116,0,'FF',9,0,1,'Average:','','',3,3),(465,'4a04c8cc6f8a4c74e7cc99d685e13cb1',0,0,38,116,0,'FF',9,0,3,'Maximum:','','on',3,4),(466,'7b960e7ace9946cae8f6e27ba46d7bca',0,0,38,118,28,'FF',8,0,1,'Remote Access','','',3,5),(467,'fbb43e7916c649910ffc43b963f5086c',0,0,38,118,0,'FF',9,0,4,'Current:','','',3,6),(468,'277480b592f39ed1447931a26bc2f4bb',0,0,38,118,0,'FF',9,0,1,'Average:','','',3,7),(469,'3b44050c6dba26ffc4ef31e54ad3c087',0,0,38,118,0,'FF',9,0,3,'Maximum:','','on',3,8),(470,'ea6301c6e690e5c7a2930443eeaabfe4',0,0,38,117,9,'FF',8,16,1,'Management','','',3,9),(471,'eaad02faddaa3dbcab40481b5619826a',0,0,38,117,0,'FF',9,16,4,'Current:','','',3,10),(472,'7cd8204c2a705a05705e30747b132050',0,0,38,117,0,'FF',9,16,1,'Average:','','',3,11),(473,'9a7d28e75c2f3bcf2b717de1ee297709',0,0,38,117,0,'FF',9,16,3,'Maximum:','','on',3,12),(474,'ab95bc97109b60d5a61c8a24bba4c924',0,0,38,119,10,'FF',4,16,1,'Total','','',3,13),(475,'e29c601af74349dba1a0daee796bca5f',0,0,38,119,0,'FF',9,16,4,'Current:','','',3,14),(476,'f983a241b18df21c506f2f1b506835bb',0,0,38,119,0,'FF',9,16,1,'Average:','','',3,15),(477,'88f5b4f4dad257565bd35bffb5c07b1e',0,0,38,119,0,'FF',9,16,3,'Maximum:','','on',3,16),(478,'8276caecef705bd316b209fd735d8448',0,0,38,0,0,'FF',1,0,1,'','','on',2,17),(479,'ee286a341e173776cf2825a2802f1256',0,0,38,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,18),(480,'83cbdecdd4ea64a4a0bf8e8dbdb01ebd',0,0,39,121,6,'FF',7,2,1,'Received','','',2,1),(481,'bdf9dc42f139e681db42828b70884280',0,0,39,121,0,'FF',9,2,4,'Current:','','',2,2),(482,'67ec436f900ef7c7eaa07fadb99ac40e',0,0,39,121,0,'FF',9,2,1,'Average:','','',2,3),(483,'8b1822c15367e74a68d5c01432969b06',0,0,39,121,0,'FF',9,2,3,'Max:','','on',2,4),(484,'c7ea33401d4a4564d2989c064d765ebc',0,0,39,120,10,'FF',4,2,1,'Sent','','',3,5),(485,'e6bd88058bdc5014cf192e892cf4ca8a',0,0,39,120,0,'FF',9,2,4,'Current:','','',2,6),(486,'517c66ce8b7e3f1b46a9677d65216d6c',0,0,39,120,0,'FF',9,2,1,'Average:','','',2,7),(487,'9a9b66f38e0c59e12664a9976eedc778',0,0,39,120,0,'FF',9,2,3,'Max:','','on',2,8),(488,'e0df8852e856307072ca5feb3186760c',0,0,39,0,0,'FF',1,0,1,'','','on',2,9),(489,'5dee23e63789016c4a4c823469160369',0,0,39,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,10),(490,'afc5c591633c98291f2541e5bf4c5f4a',0,0,40,122,67,'FF',7,0,4,'Clients','','',2,1),(491,'5defd0fcebce9c518e3a6f987df0c126',0,0,40,122,0,'FF',9,0,4,'Current:','','',2,3),(492,'9f38b4ea112147540bdbb6a4d575892f',0,0,40,122,0,'FF',9,0,1,'Average:','','',3,4),(493,'6e1ac980117850d456d74b8a7eab42e9',0,0,40,122,0,'FF',9,0,3,'Maximum:','','on',2,5),(494,'c14412642d0b389f86ff1e5dd51d8524',0,0,40,0,0,'FF',1,0,1,'','','on',2,6),(495,'8be54ccfa99a02b85116163d83f23184',0,0,40,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,7),(496,'60b0c1db402a303a1900d79995d475d1',0,0,18,0,0,'FF',1,0,1,'','','on',2,5),(497,'2e99ddd595eb6d03d5659eabfe0d14e1',0,0,18,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,6),(498,'2b35b2f70b43b823a1bf1bc9d2bcb400',0,0,41,123,10,'FF',5,0,1,'1 min cpu','','',2,1),(499,'244891aff03b32aa6c9676ae2f7dd40a',0,0,41,125,80,'FF',4,0,1,'5 sec cpu','','',2,2),(500,'16c7e61ced8eaff30e60f651bb6c3f51',0,0,41,124,74,'FF',7,0,1,'CPU Usage','','',2,3),(501,'4f762cf2fedaca5ee36d69dc13d6f14d',0,0,41,124,0,'FF',9,0,4,'Current:','','',3,4),(502,'28840c6b6ebc6fb4d2a30419ca06f006',0,0,41,124,0,'FF',9,0,1,'Average:','','',3,5),(503,'7ac53d757269c7a73052f01e6e2e6de3',0,0,41,124,0,'FF',9,0,3,'Maximum:','','',3,6),(504,'14bcc4f8acf70e7e6b53688002cd9181',0,0,42,126,43,'FF',7,0,1,'','','',2,1),(505,'33c4d8b7fc6553eabc112227da57209d',0,0,42,126,0,'FF',9,0,4,'Last:','','',2,2),(506,'89a941bcc951d7b47e7b6b70242a2ee4',0,0,42,126,0,'FF',9,0,1,'Average:','','',2,3),(507,'11cb84034d69cedd3b426dd1b51e834d',0,0,42,126,0,'FF',9,0,3,'Max:','','on',2,4),(508,'e57d7caa8e8b348e1847163112f8a941',0,0,42,0,0,'FF',1,0,1,'','','on',2,5),(509,'45a65d6ec3a3e3e7a4f571bc69b804fc',0,0,42,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,6),(510,'4af8046c4145ffc1cfc3449953ad423f',0,0,43,127,56,'FF',7,0,1,'','','',2,1),(511,'ac5f6d7d0c3c884b00acf5f3b2d0eb8f',0,0,43,127,0,'FF',9,0,4,'Current:','','',2,2),(512,'26f7bada265fd312de35e672a362160d',0,0,43,127,0,'FF',9,0,1,'Average:','','',2,3),(513,'901f7ab07fcd154ad45034659a7a1a28',0,0,43,127,0,'FF',9,0,3,'Max:','','on',2,4),(514,'8db35b0ec9ea79cc1a44f7edd9c30eec',0,0,43,0,0,'FF',1,0,1,'','','on',2,5),(515,'0b2953f39d4ec69b15411a9d5c4a485f',0,0,43,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,6),(516,'194b340d59919590905ec01bccb5c432',0,0,44,129,9,'FF',7,0,1,'Free Proc Mem','','',2,1),(517,'77558e00318ff5c13f58a300721c005f',0,0,44,129,0,'FF',9,0,4,'Current:','','',2,2),(518,'1f8d0dc58895fbaf4f93941a0b826fa0',0,0,44,129,0,'FF',9,0,1,'Average:','','',2,3),(519,'a1f0319ab5fd1a5afd5d6b1cff08aafc',0,0,44,129,0,'FF',9,0,3,'Maximum:','','on',2,4),(520,'6f4ab4cd4a4a94e7918894b01bb0ff30',0,0,44,128,75,'FF',5,0,1,'Free IO Mem','','',2,5),(521,'818b8f6fb7f5d4251f98decd4fca646f',0,0,44,128,0,'FF',9,0,4,'Current:','','',2,6),(522,'066467eb2f95c8a8df0c985d39ef8208',0,0,44,128,0,'FF',9,0,1,'Average:','','',2,7),(523,'a35397b1e790c3fb64e0f1e0ecfed177',0,0,44,128,0,'FF',9,0,3,'Maximum:','','on',2,8),(524,'64b2c283dee4de42d1105d5488c1b9f3',0,0,44,0,0,'FF',1,0,1,'','','on',2,9),(525,'e7452f2b0ee3955556e5f7863b45b57e',0,0,44,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,10),(526,'1ae3ff6eaea361a7119a810a714cefdd',0,0,45,130,50,'FF',7,0,1,'CPU Usage','','',2,1),(527,'28cd575cdda3d816cf09f3cb938e5b43',0,0,45,130,0,'FF',9,0,4,'Current:','','',3,2),(528,'3f3cb6ffcdd18479dc5b7d694013d936',0,0,45,130,0,'FF',9,0,1,'Average:','','',3,3),(529,'ef563c349bfa1afd6f095c149a9e89b3',0,0,45,130,0,'FF',9,0,3,'Maximum:','','on',3,4),(530,'d79a9cde1d02f83917555398d74c03be',0,0,45,0,0,'FF',1,0,1,'','','on',2,5),(531,'308bb28ad504243ecba5677f0d394e08',0,0,45,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,6),(532,'9c43ccc1bb4e9f8365f58fb85b839120',0,0,46,131,12,'FF',7,0,1,'TEMP Usage','','',2,1),(533,'2c4d67ecb6efb54e69c9ff5786c5b40c',0,0,46,131,0,'FF',9,0,4,'Current:','','',3,2),(534,'5b16fc92b7e09200f4200db027408fd4',0,0,46,131,0,'FF',9,0,1,'Average:','','',3,3),(535,'29fb67cae95cff0b9fe3b76d133f4cbb',0,0,46,131,0,'FF',9,0,3,'Maximum:','','on',3,4),(536,'589b6176d408c9335e55f9512b3016c5',0,0,46,0,0,'FF',1,0,1,'','','on',2,5),(537,'126c17bbff4d36ecb697d409e8e90be1',0,0,46,0,0,'FF',1,0,1,'Last Updated : |date_time|','','on',2,6),(538,'0de4ac328e527f39ceacbe72bddbb0e5',0,0,47,132,80,'FF',7,0,1,'actives session','','',2,1),(539,'c36745ebbcd4d407023d2330a5ce093f',0,0,47,132,0,'FF',9,0,4,'Current:','','',3,2),(540,'acb7c2623962a69ad1049b20349d0b5a',0,0,47,132,0,'FF',9,0,1,'Average:','','',3,3),(541,'4290077ed52dd6a1b7fcc4262494bc3f',0,0,47,132,0,'FF',9,0,3,'Maximum:','','on',3,4),(542,'fee86ba666dbb7f7792faedddc4418de',0,0,47,133,21,'FF',4,0,1,'actives session max count','','',2,5),(543,'483a5cbcb83a7c8072a4bcee20a00dfa',0,0,47,133,0,'FF',9,0,4,'Current:','','',3,6),(544,'0e88c5f6f0ad3755311ae8715d00e566',0,0,47,133,0,'FF',9,0,1,'Average:','','',3,7),(545,'2d6dd488990b5726565ee8173d710a16',0,0,47,133,0,'FF',9,0,3,'Maximum:','','on',3,8),(546,'be70fc4d0bef49f79f5ed1244223a9ce',0,0,47,0,0,'FF',1,0,1,'','','on',2,9),(547,'f4e98c810978584f80104f65100b7291',0,0,47,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,10),(548,'5811e3877898a16ffe9e95fe343dd290',0,0,26,134,48,'FF',1,0,4,'% Used','','',3,9),(549,'c7b60a07c3d1177c20fd86444c42dd98',0,0,26,134,0,'FF',9,0,4,'Current:','','',5,10),(550,'3b6ca8e6b6082135b3b0586cda187342',0,0,26,134,0,'FF',9,0,1,'Average:','','',5,11),(551,'eeb8d679339959674147c2ba4dc21d7b',0,0,26,134,0,'FF',9,0,3,'Maximum:','','on',5,12),(552,'8fef0ebab9a16e01577c5a558f913974',0,0,26,0,0,'FF',1,0,1,'','','on',2,13),(553,'c6abba414c74162e0d15fe35df60fba6',0,0,26,0,0,'FF',1,0,1,'Last Updated : |date_time|','','',2,14),(643,'',421,16,35,159,49,'FF',4,0,1,'Hosts per Process','','',2,11),(642,'',420,16,35,160,0,'FF',9,0,4,'Current:','','on',2,10),(641,'',419,16,35,160,9,'FF',4,0,1,'Hosts','','',2,9),(640,'',418,16,35,161,0,'FF',9,0,4,'Current:','','on',2,8),(639,'',417,16,35,161,31,'FF',4,0,1,'Threads','','',2,7),(638,'',416,16,35,162,0,'FF',9,0,4,'Current:','','on',2,6),(637,'',415,16,35,162,29,'FF',4,0,1,'Processes','','',2,5),(636,'',414,16,35,163,0,'FF',9,0,3,'Max:','','on',2,4),(635,'',413,16,35,163,0,'FF',9,0,1,'Average:','','',2,3),(634,'',412,16,35,163,0,'FF',9,0,4,'Current:','','',2,2),(633,'',411,16,35,163,11,'FF',4,0,1,'Poller Runtime','','',2,1),(632,'',102,15,12,156,0,'FF',9,14,3,'Maximum:','','',2,16),(631,'',101,15,12,156,0,'FF',9,14,1,'Average:','','',2,15),(630,'',100,15,12,156,0,'FF',9,14,4,'Current:','','',2,14),(629,'',99,15,12,156,30,'FF',8,14,1,'Swap','','',2,13),(628,'',98,15,12,155,0,'FF',9,14,3,'Maximum:','','on',2,12),(627,'',97,15,12,155,0,'FF',9,14,1,'Average:','','',2,11),(626,'',96,15,12,155,0,'FF',9,14,4,'Current:','','',2,10),(625,'',95,15,12,155,41,'FF',7,14,1,'Free','','',2,9),(3344,'',70,301,9,1113,0,'FF',9,0,4,'Current:','','on',4,2),(3343,'',69,301,9,1113,15,'FF',7,0,1,'1 Minute Average','','',2,1),(3342,'',64,300,7,1112,0,'FF',9,0,3,'Maximum:','','',2,4),(3341,'',63,300,7,1112,0,'FF',9,0,1,'Average:','','',2,3),(3340,'',62,300,7,1112,0,'FF',9,0,4,'Current:','','',2,2),(3339,'',61,300,7,1112,25,'FF',7,0,1,'','','',2,1),(3338,'',64,299,7,1111,0,'FF',9,0,3,'Maximum:','','',2,4),(3337,'',63,299,7,1111,0,'FF',9,0,1,'Average:','','',2,3),(3336,'',62,299,7,1111,0,'FF',9,0,4,'Current:','','',2,2),(3335,'',61,299,7,1111,25,'FF',7,0,1,'','','',2,1),(3334,'',64,298,7,1110,0,'FF',9,0,3,'Maximum:','','',2,4),(3333,'',63,298,7,1110,0,'FF',9,0,1,'Average:','','',2,3),(3332,'',62,298,7,1110,0,'FF',9,0,4,'Current:','','',2,2),(3331,'',61,298,7,1110,25,'FF',7,0,1,'','','',2,1),(3330,'',64,297,7,1109,0,'FF',9,0,3,'Maximum:','','',2,4),(3329,'',63,297,7,1109,0,'FF',9,0,1,'Average:','','',2,3),(3314,'',64,293,7,1105,0,'FF',9,0,3,'Maximum:','','',2,4),(3313,'',63,293,7,1105,0,'FF',9,0,1,'Average:','','',2,3),(3312,'',62,293,7,1105,0,'FF',9,0,4,'Current:','','',2,2),(3311,'',61,293,7,1105,25,'FF',7,0,1,'','','',2,1),(3310,'',64,292,7,1104,0,'FF',9,0,3,'Maximum:','','',2,4),(3309,'',63,292,7,1104,0,'FF',9,0,1,'Average:','','',2,3),(3308,'',62,292,7,1104,0,'FF',9,0,4,'Current:','','',2,2),(3283,'',61,286,7,1098,25,'FF',7,0,1,'','','',2,1),(3284,'',62,286,7,1098,0,'FF',9,0,4,'Current:','','',2,2),(3285,'',63,286,7,1098,0,'FF',9,0,1,'Average:','','',2,3),(3286,'',64,286,7,1098,0,'FF',9,0,3,'Maximum:','','',2,4),(3287,'',61,287,7,1099,25,'FF',7,0,1,'','','',2,1),(3288,'',62,287,7,1099,0,'FF',9,0,4,'Current:','','',2,2),(3289,'',63,287,7,1099,0,'FF',9,0,1,'Average:','','',2,3),(3290,'',64,287,7,1099,0,'FF',9,0,3,'Maximum:','','',2,4),(3295,'',61,289,7,1101,25,'FF',7,0,1,'','','',2,1),(3296,'',62,289,7,1101,0,'FF',9,0,4,'Current:','','',2,2),(3297,'',63,289,7,1101,0,'FF',9,0,1,'Average:','','',2,3),(3298,'',64,289,7,1101,0,'FF',9,0,3,'Maximum:','','',2,4),(3299,'',61,290,7,1102,25,'FF',7,0,1,'','','',2,1),(3300,'',62,290,7,1102,0,'FF',9,0,4,'Current:','','',2,2),(3301,'',63,290,7,1102,0,'FF',9,0,1,'Average:','','',2,3),(3302,'',64,290,7,1102,0,'FF',9,0,3,'Maximum:','','',2,4),(3328,'',62,297,7,1109,0,'FF',9,0,4,'Current:','','',2,2),(3327,'',61,297,7,1109,25,'FF',7,0,1,'','','',2,1),(3317,'',63,294,7,1106,0,'FF',9,0,1,'Average:','','',2,3),(3318,'',64,294,7,1106,0,'FF',9,0,3,'Maximum:','','',2,4),(3319,'',61,295,7,1107,25,'FF',7,0,1,'','','',2,1),(3320,'',62,295,7,1107,0,'FF',9,0,4,'Current:','','',2,2),(3321,'',63,295,7,1107,0,'FF',9,0,1,'Average:','','',2,3),(3322,'',64,295,7,1107,0,'FF',9,0,3,'Maximum:','','',2,4),(3323,'',61,296,7,1108,25,'FF',7,0,1,'','','',2,1),(3324,'',62,296,7,1108,0,'FF',9,0,4,'Current:','','',2,2),(3325,'',63,296,7,1108,0,'FF',9,0,1,'Average:','','',2,3),(3326,'',64,296,7,1108,0,'FF',9,0,3,'Maximum:','','',2,4),(3354,'',69,303,9,1117,15,'FF',7,0,1,'1 Minute Average','','',2,1),(3353,'',68,302,8,1116,0,'FF',9,0,3,'Maximum:','','',3,4),(3352,'',67,302,8,1116,0,'FF',9,0,1,'Average:','','',3,3),(3351,'',66,302,8,1116,0,'FF',9,0,4,'Current:','','',3,2),(3350,'',65,302,8,1116,48,'FF',7,0,1,'Running Processes','','',2,1),(3349,'',75,301,9,0,1,'FF',4,12,1,'','','',2,7),(3348,'',74,301,9,1115,0,'FF',9,0,4,'Current:','','on',4,6),(3422,'',62,319,7,1135,0,'FF',9,0,4,'Current:','','',2,2),(3423,'',63,319,7,1135,0,'FF',9,0,1,'Average:','','',2,3),(3421,'',61,319,7,1135,25,'FF',7,0,1,'','','',2,1),(3419,'',63,318,7,1134,0,'FF',9,0,1,'Average:','','',2,3),(3420,'',64,318,7,1134,0,'FF',9,0,3,'Maximum:','','',2,4),(3417,'',61,318,7,1134,25,'FF',7,0,1,'','','',2,1),(3418,'',62,318,7,1134,0,'FF',9,0,4,'Current:','','',2,2),(3416,'',64,317,7,1133,0,'FF',9,0,3,'Maximum:','','',2,4),(3414,'',62,317,7,1133,0,'FF',9,0,4,'Current:','','',2,2),(3415,'',63,317,7,1133,0,'FF',9,0,1,'Average:','','',2,3),(3413,'',61,317,7,1133,25,'FF',7,0,1,'','','',2,1),(3411,'',63,316,7,1132,0,'FF',9,0,1,'Average:','','',2,3),(3412,'',64,316,7,1132,0,'FF',9,0,3,'Maximum:','','',2,4),(3409,'',61,316,7,1132,25,'FF',7,0,1,'','','',2,1),(3410,'',62,316,7,1132,0,'FF',9,0,4,'Current:','','',2,2),(2808,'10c1718e6f5ede76db5dc8b59b2a5a19',0,0,74,932,0,'FF',9,0,3,'Max:','','',2,45),(2807,'5d41d21fb78d1df9d8d48bec394cfb14',0,0,74,932,0,'FF',9,0,2,'Min:','','',2,44),(2806,'f8c868385a1d00f32d14c5c1768a4414',0,0,74,932,0,'FF',9,0,1,'Average:','','',2,43),(2805,'aae65e15236edff939f2b952a78c1653',0,0,74,932,0,'FF',9,0,4,'Current:','','',2,42),(2804,'291f07a522fa97f58647d398a9b4f8a1',0,0,74,932,75,'FF',5,0,1,'Host: 9','','',2,41),(2803,'7be84c134530775e78ad15f0c39676ed',0,0,74,936,0,'FF',9,0,3,'Max:','','on',2,40),(2802,'fe611965fa4d1edfaa2d25ecfecfd839',0,0,74,936,0,'FF',9,0,2,'Min:','','',2,39),(2801,'a57c072556dd9e92c839d4471d27f9c4',0,0,74,936,0,'FF',9,0,1,'Average:','','',2,38),(2800,'e26033d206c367174ebb7eb5dc9b1d96',0,0,74,936,0,'FF',9,0,4,'Current:','','',2,37),(2799,'170a26d4061d382f9af7c1234d53a181',0,0,74,936,84,'FF',5,0,1,'Host: 8','','',2,36),(2798,'13c81930b83c7d288ea47a65a976637d',0,0,74,935,0,'FF',9,0,3,'Max:','','on',2,35),(2797,'4db2c05c0c086d5676e5119196fe1957',0,0,74,935,0,'FF',9,0,2,'Min:','','',2,34),(2796,'1690f9e8601b8c55aa50a170e415c624',0,0,74,935,0,'FF',9,0,1,'Average:','','',2,33),(2795,'7c99950befc395a05a36bd7b23e9ce3d',0,0,74,935,0,'FF',9,0,4,'Current:','','',2,32),(2794,'a03ad2c893723437091d5a8914689ae0',0,0,74,935,103,'FF',5,0,1,'Host: 7','','',2,31),(2793,'4e2e1c20abe06668ff3e3bece328a52f',0,0,74,934,0,'FF',9,0,3,'Max:','','on',2,30),(2792,'65d310134154f40a00aac9b5d5104137',0,0,74,934,0,'FF',9,0,2,'Min:','','',2,29),(2791,'08dfcbe64736db1182d64f4ec5b9eb0d',0,0,74,934,0,'FF',9,0,1,'Average:','','',2,28),(2790,'8ffc8b82f1ec4ebcbc3f829a0eb9872e',0,0,74,934,0,'FF',9,0,4,'Current:','','',2,27),(2789,'6dd6c7edfa98133794d859729b74fb4d',0,0,74,934,10,'FF',5,0,1,'Host: 6','','',2,26),(2788,'99110d21902efdb4cb0232bef95101e4',0,0,74,933,0,'FF',9,0,3,'Max:','','on',2,25),(2787,'9e8a803e7bf082a4ef6a1dc2776f539a',0,0,74,933,0,'FF',9,0,2,'Min:','','',2,24),(2786,'7fe47424f13b6b3929137aef7a4b5e5b',0,0,74,933,0,'FF',9,0,1,'Average:','','',2,23),(2785,'53b70a5cdaef49005a080a5156e1c1b1',0,0,74,933,0,'FF',9,0,4,'Current:','','',2,22),(2784,'af1341cc81e6b0926538bf1322251a55',0,0,74,933,95,'FF',5,0,1,'Host: 5','','',2,21),(2783,'5a51a4ff095a20c262333cb5dc3b30ad',0,0,74,937,0,'FF',9,0,3,'Max:','','on',2,20),(2782,'fb9267f22eae114de3149f46476ab54d',0,0,74,937,0,'FF',9,0,2,'Min:','','',2,19),(2781,'c5e11c29859deb1a79d6b746971c30c5',0,0,74,937,0,'FF',9,0,1,'Average:','','',2,18),(2780,'4f4db0a20522a82c8fbaa485b94a3adb',0,0,74,937,0,'FF',9,0,4,'Current:','','',2,17),(2779,'7f6b2cd808eaf3caa23c916027ae0ee9',0,0,74,937,64,'FF',5,0,1,'Host: 4','','',2,16),(2778,'c4fbfe53f203cb717ea8b323b4774aa0',0,0,74,939,0,'FF',9,0,3,'Max:','','on',2,15),(2777,'591a5f44c2f18229f1035553aa244b81',0,0,74,939,0,'FF',9,0,2,'Min:','','',2,14),(2776,'e60d5544a07e4b7233490fd32645339e',0,0,74,939,0,'FF',9,0,1,'Average:','','',2,13),(2775,'fedfb054315729374e85928a9d58db57',0,0,74,939,0,'FF',9,0,4,'Current:','','',2,12),(2774,'57c9a284ed1d47ec7be89576c9042502',0,0,74,939,59,'FF',5,0,1,'Host: 3','','',2,11),(2773,'4221d002944cac8d30cbf0aad859b9e1',0,0,74,938,0,'FF',9,0,3,'Max:','','on',2,10),(2772,'151f06c010bfa2030ec3a71474da085e',0,0,74,938,0,'FF',9,0,2,'Min:','','',2,9),(2771,'7233dac529a38543ccfcf32b8f64f4d5',0,0,74,938,0,'FF',9,0,1,'Average:','','',2,8),(2770,'566a297a84f867dc910c146446822240',0,0,74,938,0,'FF',9,0,4,'Current:','','',2,7),(2769,'9449b1ec9e431824a9b4c1f8275052de',0,0,74,938,41,'FF',5,0,1,'Host: 2','','',2,6),(2768,'776e4a531b12c23ee1cec36dc95bec96',0,0,74,931,0,'FF',9,0,3,'Max:','','on',2,5),(2767,'7c4b5884de30757c227b5ab8eca43a9e',0,0,74,931,0,'FF',9,0,2,'Min:','','',2,4),(2766,'10fe047f53023401883046cb55c75135',0,0,74,931,0,'FF',9,0,1,'Average:','','',2,3),(2765,'9c2986c4b40f242f99dfa71d798be074',0,0,74,931,0,'FF',9,0,4,'Current:','','',2,2),(2764,'cdc83a94e829a2136d5e74b2fa854b78',0,0,74,931,105,'FF',5,0,1,'Host: 1','','',2,1),(2763,'',16,242,2,930,0,'FF',9,2,3,'Maximum:','','',2,8),(2762,'',15,242,2,930,0,'FF',9,2,1,'Average:','','',2,7),(2761,'',14,242,2,930,0,'FF',9,2,4,'Current:','','',2,6),(2760,'',13,242,2,930,20,'FF',4,2,1,'Outbound','','',2,5),(2759,'',12,242,2,929,0,'FF',9,2,3,'Maximum:','','on',2,4),(2758,'',11,242,2,929,0,'FF',9,2,1,'Average:','','',2,3),(2757,'',10,242,2,929,0,'FF',9,2,4,'Current:','','',2,2),(2756,'',9,242,2,929,22,'FF',7,2,1,'Inbound','','',2,1),(2755,'',16,241,2,928,0,'FF',9,2,3,'Maximum:','','',2,8),(2754,'',15,241,2,928,0,'FF',9,2,1,'Average:','','',2,7),(2753,'',14,241,2,928,0,'FF',9,2,4,'Current:','','',2,6),(2752,'',13,241,2,928,20,'FF',4,2,1,'Outbound','','',2,5),(2751,'',12,241,2,927,0,'FF',9,2,3,'Maximum:','','on',2,4),(2750,'',11,241,2,927,0,'FF',9,2,1,'Average:','','',2,3),(2749,'',10,241,2,927,0,'FF',9,2,4,'Current:','','',2,2),(2748,'',9,241,2,927,22,'FF',7,2,1,'Inbound','','',2,1),(2747,'',1755,240,49,926,8,'FF',4,0,1,'UpdateMulti','','',2,7),(2746,'',1754,240,49,924,15,'FF',4,0,1,'Truncate','','',2,6),(2745,'',1753,240,49,923,17,'FF',4,0,1,'Insert Select','','',2,5),(2744,'',1752,240,49,922,65,'FF',4,0,1,'Insert','','',2,4),(2743,'',1751,240,49,921,48,'FF',4,0,1,'Delete','','',2,3),(2742,'',1750,240,49,925,1,'FF',4,0,1,'','','',2,2),(2741,'',1749,240,49,925,80,'FF',7,0,1,'Update','','',2,1),(2740,'',1762,239,50,920,15,'FF',4,0,1,'Write','','',2,7),(2739,'',1761,239,50,918,43,'FF',4,0,1,'Rollback','','',2,6),(2738,'',1760,239,50,917,10,'FF',5,0,1,'Discover','','',2,5),(2737,'',1759,239,50,915,95,'FF',4,0,1,'Commit','','',2,4),(2736,'',1758,239,50,916,48,'FF',5,0,1,'Delete','','',2,3),(2735,'',1757,239,50,919,77,'FF',4,0,1,'','','',2,2),(2734,'',1756,239,50,919,80,'FF',7,0,1,'Update','','',2,1),(2733,'',1815,238,59,912,89,'FF',4,0,1,'Threads Running','','',2,11),(2732,'',1814,238,59,911,56,'FF',4,0,1,'Threads Created','','',2,9),(2731,'',1813,238,59,910,15,'FF',4,0,1,'Threads Connected','','',2,7),(2730,'',1812,238,59,909,10,'FF',4,0,1,'Threads Cached','','',2,5),(2729,'',1811,238,59,914,12,'FF',4,0,1,'Aborted Connects','','',2,3),(2728,'',1810,238,59,913,44,'FF',4,0,1,'Aborted Clients','','',2,1),(2727,'',1809,237,58,907,17,'FF',5,0,1,'Temp Files','','',2,4),(2726,'',1808,237,58,906,48,'FF',4,0,1,'Temp Disk Tables','','',2,3),(2725,'',1807,237,58,908,27,'FF',4,0,1,'','','',2,2),(2724,'',1806,237,58,908,31,'FF',7,0,1,'Temp Tables','','',2,1),(2723,'',1800,236,56,905,10,'FF',5,0,1,'Scan','','',2,5),(2722,'',1799,236,56,902,42,'FF',4,0,1,'Merge Passes','','',2,4),(2721,'',1798,236,56,903,17,'FF',5,0,1,'Range','','',2,3),(2720,'',1797,236,56,904,27,'FF',4,18,1,'','','',2,2),(2719,'',1796,236,56,904,31,'FF',7,18,1,'kiloRows','','',2,1),(2718,'',1769,235,51,901,1,'FF',4,0,1,'Scan','','',2,7),(2717,'',1768,235,51,900,48,'FF',4,0,1,'RangeCheck','','',2,6),(2716,'',1767,235,51,898,10,'FF',4,0,1,'FullRangeJoin','','',2,5),(2715,'',1766,235,51,897,60,'FF',4,0,1,'FullJoin','','',2,4),(2714,'',1765,235,51,899,17,'FF',5,0,1,'Range','','',2,3),(2713,'',1764,235,51,896,77,'FF',4,0,1,'','','',2,2),(2712,'',1763,235,51,896,63,'FF',7,0,1,'Select','','',2,1),(2711,'',1776,234,52,890,94,'FF',4,0,1,'Read First','','',2,7),(2710,'',1775,234,52,893,58,'FF',5,0,1,'Read Prev','','',2,6),(2709,'',1774,234,52,894,43,'FF',4,0,1,'Read Rnd','','',2,5),(2708,'',1773,234,52,892,8,'FF',4,0,1,'Read Next','','',2,4),(2707,'',1772,234,52,895,9,'FF',4,0,1,'Read Rnd Next','','',2,3),(2706,'',1771,234,52,891,77,'FF',4,0,1,'','','',2,2),(2705,'',1770,234,52,891,63,'FF',7,0,1,'Read Key','','',2,1),(2704,'',1748,233,48,886,94,'FF',4,18,1,'Binlog Cache Use(K)','','',2,5),(2703,'',1747,233,48,888,10,'FF',5,18,1,'Binlog Cache Disk(K)','','',2,4),(2702,'',1746,233,48,889,48,'FF',5,0,1,'Seconds Lag','','',2,3),(2701,'',1745,233,48,887,27,'FF',4,18,1,'','','',2,2),(2700,'',1744,233,48,887,28,'FF',7,18,1,'LogPosLag(KB)','','',2,1),(2699,'',1789,232,54,882,9,'FF',5,0,1,'Lowmem Prunes','','',2,8),(2698,'',1788,232,54,878,27,'FF',4,0,1,'Free Blocks','','',2,7),(2697,'',1787,232,54,885,58,'FF',4,0,1,'Total Blocks','','',2,6),(2696,'',1786,232,54,880,28,'FF',5,0,1,'Cache Hits','','',2,5),(2695,'',1785,232,54,884,10,'FF',5,0,1,'Queries Cached','','',2,4),(2694,'',1784,232,54,883,77,'FF',4,0,1,'Not Cached','','',2,3),(2693,'',1783,232,54,881,17,'FF',4,0,1,'Cache Inserts','','',2,2),(3396,'',64,312,7,1128,0,'FF',9,0,3,'Maximum:','','',2,4),(3347,'',73,301,9,1115,9,'FF',8,0,1,'15 Minute Average','','',2,5),(3346,'',72,301,9,1114,0,'FF',9,0,4,'Current:','','on',4,4),(3345,'',71,301,9,1114,8,'FF',8,0,1,'5 Minute Average','','',2,3),(3397,'',61,313,7,1129,25,'FF',7,0,1,'','','',2,1),(3398,'',62,313,7,1129,0,'FF',9,0,4,'Current:','','',2,2),(3399,'',63,313,7,1129,0,'FF',9,0,1,'Average:','','',2,3),(3400,'',64,313,7,1129,0,'FF',9,0,3,'Maximum:','','',2,4),(3401,'',61,314,7,1130,25,'FF',7,0,1,'','','',2,1),(3402,'',62,314,7,1130,0,'FF',9,0,4,'Current:','','',2,2),(3403,'',63,314,7,1130,0,'FF',9,0,1,'Average:','','',2,3),(3404,'',64,314,7,1130,0,'FF',9,0,3,'Maximum:','','',2,4),(3405,'',61,315,7,1131,25,'FF',7,0,1,'','','',2,1),(3406,'',62,315,7,1131,0,'FF',9,0,4,'Current:','','',2,2),(3407,'',63,315,7,1131,0,'FF',9,0,1,'Average:','','',2,3),(3408,'',64,315,7,1131,0,'FF',9,0,3,'Maximum:','','',2,4),(2497,'',1755,209,49,809,8,'FF',4,0,1,'UpdateMulti','','',2,7),(2496,'',1754,209,49,807,15,'FF',4,0,1,'Truncate','','',2,6),(2495,'',1753,209,49,806,17,'FF',4,0,1,'Insert Select','','',2,5),(2494,'',1752,209,49,805,65,'FF',4,0,1,'Insert','','',2,4),(2493,'',1751,209,49,804,48,'FF',4,0,1,'Delete','','',2,3),(2492,'',1750,209,49,808,1,'FF',4,0,1,'','','',2,2),(2491,'',1749,209,49,808,80,'FF',7,0,1,'Update','','',2,1),(2490,'',1762,208,50,803,15,'FF',4,0,1,'Write','','',2,7),(2489,'',1761,208,50,801,43,'FF',4,0,1,'Rollback','','',2,6),(2488,'',1760,208,50,800,10,'FF',5,0,1,'Discover','','',2,5),(2487,'',1759,208,50,798,95,'FF',4,0,1,'Commit','','',2,4),(2486,'',1758,208,50,799,48,'FF',5,0,1,'Delete','','',2,3),(2485,'',1757,208,50,802,77,'FF',4,0,1,'','','',2,2),(2484,'',1756,208,50,802,80,'FF',7,0,1,'Update','','',2,1),(2483,'',1815,207,59,795,89,'FF',4,0,1,'Threads Running','','',2,11),(2482,'',1814,207,59,794,56,'FF',4,0,1,'Threads Created','','',2,9),(2481,'',1813,207,59,793,15,'FF',4,0,1,'Threads Connected','','',2,7),(2480,'',1812,207,59,792,10,'FF',4,0,1,'Threads Cached','','',2,5),(2479,'',1811,207,59,797,12,'FF',4,0,1,'Aborted Connects','','',2,3),(2478,'',1810,207,59,796,44,'FF',4,0,1,'Aborted Clients','','',2,1),(2477,'',1748,206,48,788,94,'FF',4,18,1,'Binlog Cache Use(K)','','',2,5),(2476,'',1747,206,48,790,10,'FF',5,18,1,'Binlog Cache Disk(K)','','',2,4),(2475,'',1746,206,48,791,48,'FF',5,0,1,'Seconds Lag','','',2,3),(2474,'',1745,206,48,789,27,'FF',4,18,1,'','','',2,2),(2473,'',1744,206,48,789,28,'FF',7,18,1,'LogPosLag(KB)','','',2,1),(2472,'',1902,205,62,787,0,'FF',9,0,3,'Max:','','on',2,45),(2471,'',1901,205,62,787,0,'FF',9,0,2,'Min:','','',2,44),(2470,'',1900,205,62,787,0,'FF',9,0,1,'Average:','','',2,43),(2469,'',1899,205,62,787,0,'FF',9,0,4,'Current:','','',2,42),(2468,'',1898,205,62,787,75,'FF',4,0,1,'write:','','',2,41),(2467,'',1897,205,62,786,0,'FF',9,0,3,'Max:','','on',2,40),(2466,'',1896,205,62,786,0,'FF',9,0,2,'Min:','','',2,39),(2465,'',1895,205,62,786,0,'FF',9,0,1,'Average:','','',2,38),(2464,'',1894,205,62,786,0,'FF',9,0,4,'Current:','','',2,37),(2463,'',1893,205,62,786,84,'FF',4,0,1,'Update:','','',2,36),(2462,'',1892,205,62,781,0,'FF',9,0,3,'Max:','','on',2,35),(2461,'',1891,205,62,781,0,'FF',9,0,2,'Min:','','',2,34),(2460,'',1890,205,62,781,0,'FF',9,0,1,'Average:','','',2,33),(2459,'',1889,205,62,781,0,'FF',9,0,4,'Current:','','',2,32),(2458,'',1888,205,62,781,103,'FF',4,0,1,'Delete','','',2,31),(2457,'',1887,205,62,784,0,'FF',9,0,3,'Max:','','on',2,30),(2456,'',1886,205,62,784,0,'FF',9,0,2,'Min:','','',2,29),(2455,'',1885,205,62,784,0,'FF',9,0,1,'Average:','','',2,28),(2454,'',1884,205,62,784,0,'FF',9,0,4,'Current:','','',2,27),(2453,'',1883,205,62,784,10,'FF',4,0,1,'Read Rnd','','',2,26),(2452,'',1882,205,62,783,0,'FF',9,0,3,'Max:','','on',2,25),(2451,'',1881,205,62,783,0,'FF',9,0,2,'Min:','','',2,24),(2450,'',1880,205,62,783,0,'FF',9,0,1,'Average:','','',2,23),(2449,'',1879,205,62,783,0,'FF',9,0,4,'Current:','','',2,22),(2448,'',1878,205,62,783,95,'FF',4,0,1,'Read Prev','','',2,21),(2447,'',1877,205,62,780,0,'FF',9,0,3,'Max:','','on',2,20),(2446,'',1876,205,62,780,0,'FF',9,0,2,'Min:','','',2,19),(2445,'',1875,205,62,780,0,'FF',9,0,1,'Average:','','',2,18),(2444,'',1874,205,62,780,0,'FF',9,0,4,'Current:','','',2,17),(2443,'',1873,205,62,780,64,'FF',4,0,1,'Read Next','','',2,16),(2442,'',1872,205,62,779,0,'FF',9,0,3,'Max:','','on',2,15),(2441,'',1871,205,62,779,0,'FF',9,0,2,'Min:','','',2,14),(2440,'',1870,205,62,779,0,'FF',9,0,1,'Average:','','',2,13),(2439,'',1869,205,62,779,0,'FF',9,0,4,'Current:','','',2,12),(2438,'',1868,205,62,779,59,'FF',4,0,1,'Read Key','','',2,11),(2437,'',1867,205,62,782,0,'FF',9,0,3,'Max:','','on',2,10),(2436,'',1866,205,62,782,0,'FF',9,0,2,'Min:','','',2,9),(2435,'',1865,205,62,782,0,'FF',9,0,1,'Average:','','',2,8),(2434,'',1864,205,62,782,0,'FF',9,0,4,'Current:','','',2,7),(2433,'',1863,205,62,782,41,'FF',4,0,1,'Read First','','',2,6),(2432,'',1862,205,62,785,0,'FF',9,0,3,'Max:','','on',2,5),(2431,'',1861,205,62,785,0,'FF',9,0,2,'Min:','','',2,4),(2430,'',1860,205,62,785,0,'FF',9,0,1,'Average:','','',2,3),(2429,'',1859,205,62,785,0,'FF',9,0,4,'Current:','','',2,2),(2428,'',1858,205,62,785,29,'FF',7,0,1,'Read Rnd Next','','',2,1),(2427,'',1857,204,61,774,89,'FF',4,0,1,'','','',2,26),(2426,'',1856,204,61,776,0,'FF',9,0,3,'Max:','','on',2,25),(2425,'',1855,204,61,776,0,'FF',9,0,2,'Min:','','',2,24),(2424,'',1854,204,61,776,0,'FF',9,0,1,'Average:','','',2,23),(2423,'',1853,204,61,776,0,'FF',9,0,4,'Current:','','',2,22),(2422,'',1852,204,61,776,10,'FF',4,0,1,'Update','','',2,21),(2421,'',1851,204,61,775,0,'FF',9,0,3,'Max:','','on',2,20),(2420,'',1850,204,61,775,0,'FF',9,0,2,'Min:','','',2,19),(2419,'',1849,204,61,775,0,'FF',9,0,1,'Average:','','',2,18),(2418,'',1848,204,61,775,0,'FF',9,0,4,'Current:','','',2,17),(2417,'',1847,204,61,775,33,'FF',4,0,1,'Insert','','',2,16),(2416,'',1846,204,61,778,0,'FF',9,0,3,'Max:','','on',2,15),(2415,'',1845,204,61,778,0,'FF',9,0,2,'Min:','','',2,14),(2414,'',1844,204,61,778,0,'FF',9,0,1,'Average:','','',2,13),(2413,'',1843,204,61,778,0,'FF',9,0,4,'Current:','','',2,12),(2412,'',1842,204,61,778,9,'FF',4,0,1,'Delete','','',2,11),(2411,'',1841,204,61,777,0,'FF',9,0,3,'Max:','','on',2,10),(2410,'',1840,204,61,777,0,'FF',9,0,2,'Min:','','',2,9),(2409,'',1839,204,61,777,0,'FF',9,0,1,'Average:','','',2,8),(2408,'',1838,204,61,777,0,'FF',9,0,4,'Current:','','',2,7),(2407,'',1837,204,61,777,1,'FF',4,0,1,'Change_DB','','',2,6),(2406,'',1836,204,61,774,0,'FF',9,0,3,'Max:','','on',2,5),(2405,'',1835,204,61,774,0,'FF',9,0,2,'Min:','','',2,4),(2404,'',1834,204,61,774,0,'FF',9,0,1,'Average:','','',2,3),(2403,'',1833,204,61,774,0,'FF',9,0,4,'Current:','','',2,2),(2402,'',1832,204,61,774,95,'FF',7,0,1,'Select','','',2,1),(2401,'',1805,203,57,771,8,'FF',5,0,1,'Table Locks Waited','','',2,5),(2400,'',1804,203,57,773,94,'FF',5,0,1,'Slow Queries','','',2,4),(2399,'',1803,203,57,772,42,'FF',5,0,1,'Slow Launch Threads','','',2,3),(2398,'',1802,203,57,770,72,'FF',4,0,1,'','','',2,2),(2397,'',1801,203,57,770,63,'FF',7,0,1,'Table Locks Immed','','',2,1),(2396,'',1909,202,63,768,0,'FF',9,0,4,'Current:','','on',4,7),(2395,'',1908,202,63,768,43,'FF',7,0,1,'15 Minute Average','','',2,6),(2394,'',1907,202,63,769,0,'FF',9,0,4,'Current:','','on',4,5),(2393,'',1906,202,63,769,33,'FF',7,0,1,'5 Minute Average','','',2,4),(2392,'',1905,202,63,767,28,'FF',4,0,1,'','','',2,3),(2391,'',1904,202,63,767,0,'FF',9,0,4,'Current:','','on',4,2),(2390,'',1903,202,63,767,25,'FF',7,0,1,'1 Minute Average','','',2,1),(2389,'',1914,201,64,764,8,'FF',4,0,1,'Updated','','',2,5),(2388,'',1913,201,64,766,94,'FF',5,0,1,'Inserted','','',2,4),(2387,'',1912,201,64,765,42,'FF',5,0,1,'Deleted','','',2,3),(2386,'',1911,201,64,763,72,'FF',4,0,1,'','','',2,2),(2385,'',1910,201,64,763,63,'FF',7,0,1,'Read','','',2,1),(2384,'',1924,200,66,761,17,'FF',4,0,1,'Spin Waits','','',2,4),(2383,'',1923,200,66,762,67,'FF',5,0,1,'Spin Rounds','','',2,3),(2382,'',1922,200,66,760,19,'FF',4,0,1,'','','',2,2),(2381,'',1921,200,66,760,30,'FF',7,0,1,'OS Waits','','',2,1),(2380,'',1928,199,67,758,45,'FF',4,0,1,'Merges','','',2,4),(2379,'',1927,199,67,757,10,'FF',4,0,1,'Merged','','',2,3),(2378,'',1926,199,67,759,96,'FF',4,0,1,'','','',2,2),(2377,'',1925,199,67,759,97,'FF',7,0,1,'Inserts','','',2,1),(2376,'',1933,198,68,755,10,'FF',4,0,1,'Fsyncs','','',2,5),(2375,'',1932,198,68,754,42,'FF',5,0,1,'Log Writes','','',2,4),(2374,'',1931,198,68,753,17,'FF',5,0,1,'File Writes','','',2,3),(2373,'',1930,198,68,756,57,'FF',4,0,1,'','','',2,2),(2372,'',1929,198,68,756,55,'FF',7,0,1,'Reads','','',2,1),(2371,'',1920,197,65,749,44,'FF',4,19,1,'Miss Rate','','',2,6),(2370,'',1919,197,65,751,45,'FF',4,0,1,'Pool Size','','',2,5),(2369,'',1918,197,65,750,67,'FF',4,0,1,'Modified Pages','','',2,4),(2368,'',1917,197,65,748,6,'FF',4,0,1,'Free Pages','','',2,3),(2367,'',1916,197,65,752,27,'FF',4,0,1,'','','',2,2),(2366,'',1915,197,65,752,29,'FF',7,0,1,'Database Pages','','',2,1),(2365,'',1781,196,53,747,45,'FF',4,0,1,'Key Writes','','',2,5),(2364,'',1780,196,53,745,67,'FF',4,0,1,'Key Reads','','',2,4),(2363,'',1779,196,53,746,48,'FF',4,0,1,'Key Write Req','','',2,3),(2362,'',1778,196,53,744,1,'FF',4,0,1,'','','',2,2),(2361,'',1777,196,53,744,29,'FF',7,0,1,'Key Read Req','','',2,1),(2360,'',1831,195,60,0,0,'FF',9,12,3,'Maximum:','','',2,16),(2359,'',1830,195,60,0,0,'FF',9,12,1,'Average:','','',2,15),(2358,'',1829,195,60,0,0,'FF',9,12,4,'Current:','','',2,14),(2357,'',1828,195,60,0,1,'FF',4,12,1,'Total','','',2,13),(2356,'',1827,195,60,741,0,'FF',9,0,3,'Maximum:','','on',2,12),(2355,'',1826,195,60,741,0,'FF',9,0,1,'Average:','','',2,11),(2354,'',1825,195,60,741,0,'FF',9,0,4,'Current:','','',2,10),(2353,'',1824,195,60,741,12,'FF',8,0,1,'Nice','','',2,9),(2352,'',1823,195,60,743,0,'FF',9,0,3,'Maximum:','','on',2,8),(2351,'',1822,195,60,743,0,'FF',9,0,1,'Average:','','',2,7),(2350,'',1821,195,60,743,0,'FF',9,0,4,'Current:','','',2,6),(2349,'',1820,195,60,743,21,'FF',8,0,1,'User','','',2,5),(2348,'',1819,195,60,742,0,'FF',9,0,3,'Maximum:','','on',2,4),(2347,'',1818,195,60,742,0,'FF',9,0,1,'Average:','','',2,3),(2346,'',1817,195,60,742,0,'FF',9,0,4,'Current:','','',2,2),(2345,'',1816,195,60,742,9,'FF',7,0,1,'System','','',2,1),(2344,'',16,194,2,740,0,'FF',9,2,3,'Maximum:','','',2,8),(2343,'',15,194,2,740,0,'FF',9,2,1,'Average:','','',2,7),(2342,'',14,194,2,740,0,'FF',9,2,4,'Current:','','',2,6),(2341,'',13,194,2,740,20,'FF',4,2,1,'Outbound','','',2,5),(2340,'',12,194,2,739,0,'FF',9,2,3,'Maximum:','','on',2,4),(2339,'',11,194,2,739,0,'FF',9,2,1,'Average:','','',2,3),(2338,'',10,194,2,739,0,'FF',9,2,4,'Current:','','',2,2),(2337,'',9,194,2,739,22,'FF',7,2,1,'Inbound','','',2,1),(2336,'',16,193,2,738,0,'FF',9,2,3,'Maximum:','','',2,8),(2335,'',15,193,2,738,0,'FF',9,2,1,'Average:','','',2,7),(2334,'',14,193,2,738,0,'FF',9,2,4,'Current:','','',2,6),(2333,'',13,193,2,738,20,'FF',4,2,1,'Outbound','','',2,5),(2332,'',12,193,2,737,0,'FF',9,2,3,'Maximum:','','on',2,4),(2331,'',11,193,2,737,0,'FF',9,2,1,'Average:','','',2,3),(2330,'',10,193,2,737,0,'FF',9,2,4,'Current:','','',2,2),(2329,'',9,193,2,737,22,'FF',7,2,1,'Inbound','','',2,1),(2328,'',1809,192,58,735,17,'FF',5,0,1,'Temp Files','','',2,4),(2327,'',1808,192,58,734,48,'FF',4,0,1,'Temp Disk Tables','','',2,3),(2326,'',1807,192,58,736,27,'FF',4,0,1,'','','',2,2),(2325,'',1806,192,58,736,31,'FF',7,0,1,'Temp Tables','','',2,1),(2324,'',1800,191,56,733,10,'FF',5,0,1,'Scan','','',2,5),(2323,'',1799,191,56,730,42,'FF',4,0,1,'Merge Passes','','',2,4),(2322,'',1798,191,56,731,17,'FF',5,0,1,'Range','','',2,3),(2321,'',1797,191,56,732,27,'FF',4,18,1,'','','',2,2),(2320,'',1796,191,56,732,31,'FF',7,18,1,'kiloRows','','',2,1),(2319,'',1769,190,51,729,1,'FF',4,0,1,'Scan','','',2,7),(2318,'',1768,190,51,728,48,'FF',4,0,1,'RangeCheck','','',2,6),(2317,'',1767,190,51,726,10,'FF',4,0,1,'FullRangeJoin','','',2,5),(2316,'',1766,190,51,725,60,'FF',4,0,1,'FullJoin','','',2,4),(2315,'',1765,190,51,727,17,'FF',5,0,1,'Range','','',2,3),(2314,'',1764,190,51,724,77,'FF',4,0,1,'','','',2,2),(2313,'',1763,190,51,724,63,'FF',7,0,1,'Select','','',2,1),(2312,'',1776,189,52,718,94,'FF',4,0,1,'Read First','','',2,7),(2311,'',1775,189,52,721,58,'FF',5,0,1,'Read Prev','','',2,6),(2310,'',1774,189,52,722,43,'FF',4,0,1,'Read Rnd','','',2,5),(2309,'',1773,189,52,720,8,'FF',4,0,1,'Read Next','','',2,4),(2308,'',1772,189,52,723,9,'FF',4,0,1,'Read Rnd Next','','',2,3),(2307,'',1771,189,52,719,77,'FF',4,0,1,'','','',2,2),(2306,'',1770,189,52,719,63,'FF',7,0,1,'Read Key','','',2,1),(2305,'',1789,188,54,714,9,'FF',5,0,1,'Lowmem Prunes','','',2,8),(2304,'',1788,188,54,710,27,'FF',4,0,1,'Free Blocks','','',2,7),(2303,'',1787,188,54,717,58,'FF',4,0,1,'Total Blocks','','',2,6),(2302,'',1786,188,54,712,28,'FF',5,0,1,'Cache Hits','','',2,5),(2301,'',1785,188,54,716,10,'FF',5,0,1,'Queries Cached','','',2,4),(2300,'',1784,188,54,715,77,'FF',4,0,1,'Not Cached','','',2,3),(2299,'',1783,188,54,713,17,'FF',4,0,1,'Cache Inserts','','',2,2),(2298,'',1782,188,54,711,38,'FF',7,18,1,'Free Kilobytes','','',2,1),(2297,'',1795,187,55,708,17,'FF',5,0,1,'Connections','','',2,6),(2296,'',1794,187,55,705,10,'FF',4,0,1,'Queries','','',2,5),(2295,'',1793,187,55,709,95,'FF',5,0,1,'Max Conn','','',2,4),(2294,'',1792,187,55,706,8,'FF',5,18,1,'KB Recvd','','',2,3),(2293,'',1791,187,55,707,59,'FF',4,18,1,'','','',2,2),(2292,'',1790,187,55,707,55,'FF',7,18,1,'KB Sent','','',2,1),(2291,'',1781,186,53,704,45,'FF',4,0,1,'Key Writes','','',2,5),(2290,'',1780,186,53,702,67,'FF',4,0,1,'Key Reads','','',2,4),(2289,'',1779,186,53,703,48,'FF',4,0,1,'Key Write Req','','',2,3),(2288,'',1778,186,53,701,1,'FF',4,0,1,'','','',2,2),(2287,'',1777,186,53,701,29,'FF',7,0,1,'Key Read Req','','',2,1),(2286,'',1831,185,60,0,0,'FF',9,12,3,'Maximum:','','',2,16),(2285,'',1830,185,60,0,0,'FF',9,12,1,'Average:','','',2,15),(2284,'',1829,185,60,0,0,'FF',9,12,4,'Current:','','',2,14),(2283,'',1828,185,60,0,1,'FF',4,12,1,'Total','','',2,13),(2282,'',1827,185,60,698,0,'FF',9,0,3,'Maximum:','','on',2,12),(2281,'',1826,185,60,698,0,'FF',9,0,1,'Average:','','',2,11),(2280,'',1825,185,60,698,0,'FF',9,0,4,'Current:','','',2,10),(2279,'',1824,185,60,698,12,'FF',8,0,1,'Nice','','',2,9),(2278,'',1823,185,60,700,0,'FF',9,0,3,'Maximum:','','on',2,8),(2277,'',1822,185,60,700,0,'FF',9,0,1,'Average:','','',2,7),(2276,'',1821,185,60,700,0,'FF',9,0,4,'Current:','','',2,6),(2275,'',1820,185,60,700,21,'FF',8,0,1,'User','','',2,5),(2274,'',1819,185,60,699,0,'FF',9,0,3,'Maximum:','','on',2,4),(2273,'',1818,185,60,699,0,'FF',9,0,1,'Average:','','',2,3),(2272,'',1817,185,60,699,0,'FF',9,0,4,'Current:','','',2,2),(2271,'',1816,185,60,699,9,'FF',7,0,1,'System','','',2,1),(2270,'',16,184,2,697,0,'FF',9,2,3,'Maximum:','','',2,8),(2269,'',15,184,2,697,0,'FF',9,2,1,'Average:','','',2,7),(2268,'',14,184,2,697,0,'FF',9,2,4,'Current:','','',2,6),(2267,'',13,184,2,697,20,'FF',4,2,1,'Outbound','','',2,5),(2266,'',12,184,2,696,0,'FF',9,2,3,'Maximum:','','on',2,4),(2265,'',11,184,2,696,0,'FF',9,2,1,'Average:','','',2,3),(2264,'',10,184,2,696,0,'FF',9,2,4,'Current:','','',2,2),(2263,'',9,184,2,696,22,'FF',7,2,1,'Inbound','','',2,1),(2262,'',16,183,2,695,0,'FF',9,2,3,'Maximum:','','',2,8),(2261,'',15,183,2,695,0,'FF',9,2,1,'Average:','','',2,7),(2260,'',14,183,2,695,0,'FF',9,2,4,'Current:','','',2,6),(2259,'',13,183,2,695,20,'FF',4,2,1,'Outbound','','',2,5),(2258,'',12,183,2,694,0,'FF',9,2,3,'Maximum:','','on',2,4),(2257,'',11,183,2,694,0,'FF',9,2,1,'Average:','','',2,3),(2256,'',10,183,2,694,0,'FF',9,2,4,'Current:','','',2,2),(2255,'',9,183,2,694,22,'FF',7,2,1,'Inbound','','',2,1),(2254,'',16,182,2,693,0,'FF',9,2,3,'Maximum:','','',2,8),(2253,'',15,182,2,693,0,'FF',9,2,1,'Average:','','',2,7),(2252,'',14,182,2,693,0,'FF',9,2,4,'Current:','','',2,6),(2251,'',13,182,2,693,20,'FF',4,2,1,'Outbound','','',2,5),(2250,'',12,182,2,692,0,'FF',9,2,3,'Maximum:','','on',2,4),(2249,'',11,182,2,692,0,'FF',9,2,1,'Average:','','',2,3),(2248,'',10,182,2,692,0,'FF',9,2,4,'Current:','','',2,2),(2247,'',9,182,2,692,22,'FF',7,2,1,'Inbound','','',2,1),(2246,'',16,181,2,691,0,'FF',9,2,3,'Maximum:','','',2,8),(2245,'',15,181,2,691,0,'FF',9,2,1,'Average:','','',2,7),(2244,'',14,181,2,691,0,'FF',9,2,4,'Current:','','',2,6),(2243,'',13,181,2,691,20,'FF',4,2,1,'Outbound','','',2,5),(2242,'',12,181,2,690,0,'FF',9,2,3,'Maximum:','','on',2,4),(2241,'',11,181,2,690,0,'FF',9,2,1,'Average:','','',2,3),(2240,'',10,181,2,690,0,'FF',9,2,4,'Current:','','',2,2),(2239,'',9,181,2,690,22,'FF',7,2,1,'Inbound','','',2,1),(2238,'',16,180,2,689,0,'FF',9,2,3,'Maximum:','','',2,8),(2237,'',15,180,2,689,0,'FF',9,2,1,'Average:','','',2,7),(2236,'',14,180,2,689,0,'FF',9,2,4,'Current:','','',2,6),(2235,'',13,180,2,689,20,'FF',4,2,1,'Outbound','','',2,5),(2234,'',12,180,2,688,0,'FF',9,2,3,'Maximum:','','on',2,4),(2233,'',11,180,2,688,0,'FF',9,2,1,'Average:','','',2,3),(2232,'',10,180,2,688,0,'FF',9,2,4,'Current:','','',2,2),(2231,'',9,180,2,688,22,'FF',7,2,1,'Inbound','','',2,1),(2230,'',16,179,2,687,0,'FF',9,2,3,'Maximum:','','',2,8),(2229,'',15,179,2,687,0,'FF',9,2,1,'Average:','','',2,7),(2228,'',14,179,2,687,0,'FF',9,2,4,'Current:','','',2,6),(2227,'',13,179,2,687,20,'FF',4,2,1,'Outbound','','',2,5),(2226,'',12,179,2,686,0,'FF',9,2,3,'Maximum:','','on',2,4),(2225,'',11,179,2,686,0,'FF',9,2,1,'Average:','','',2,3),(2224,'',10,179,2,686,0,'FF',9,2,4,'Current:','','',2,2),(2223,'',9,179,2,686,22,'FF',7,2,1,'Inbound','','',2,1),(2222,'',16,178,2,685,0,'FF',9,2,3,'Maximum:','','',2,8),(2221,'',15,178,2,685,0,'FF',9,2,1,'Average:','','',2,7),(2220,'',14,178,2,685,0,'FF',9,2,4,'Current:','','',2,6),(2219,'',13,178,2,685,20,'FF',4,2,1,'Outbound','','',2,5),(2218,'',12,178,2,684,0,'FF',9,2,3,'Maximum:','','on',2,4),(2217,'',11,178,2,684,0,'FF',9,2,1,'Average:','','',2,3),(2216,'',10,178,2,684,0,'FF',9,2,4,'Current:','','',2,2),(2215,'',9,178,2,684,22,'FF',7,2,1,'Inbound','','',2,1),(2214,'',16,177,2,683,0,'FF',9,2,3,'Maximum:','','',2,8),(2213,'',15,177,2,683,0,'FF',9,2,1,'Average:','','',2,7),(2212,'',14,177,2,683,0,'FF',9,2,4,'Current:','','',2,6),(2211,'',13,177,2,683,20,'FF',4,2,1,'Outbound','','',2,5),(2210,'',12,177,2,682,0,'FF',9,2,3,'Maximum:','','on',2,4),(2209,'',11,177,2,682,0,'FF',9,2,1,'Average:','','',2,3),(2208,'',10,177,2,682,0,'FF',9,2,4,'Current:','','',2,2),(2207,'',9,177,2,682,22,'FF',7,2,1,'Inbound','','',2,1),(2206,'',16,176,2,681,0,'FF',9,2,3,'Maximum:','','',2,8),(2205,'',15,176,2,681,0,'FF',9,2,1,'Average:','','',2,7),(2204,'',14,176,2,681,0,'FF',9,2,4,'Current:','','',2,6),(2203,'',13,176,2,681,20,'FF',4,2,1,'Outbound','','',2,5),(2202,'',12,176,2,680,0,'FF',9,2,3,'Maximum:','','on',2,4),(2201,'',11,176,2,680,0,'FF',9,2,1,'Average:','','',2,3),(2200,'',10,176,2,680,0,'FF',9,2,4,'Current:','','',2,2),(2199,'',9,176,2,680,22,'FF',7,2,1,'Inbound','','',2,1),(2198,'',1781,175,53,679,45,'FF',4,0,1,'Key Writes','','',2,5),(2197,'',1780,175,53,677,67,'FF',4,0,1,'Key Reads','','',2,4),(2196,'',1779,175,53,678,48,'FF',4,0,1,'Key Write Req','','',2,3),(2195,'',1778,175,53,676,1,'FF',4,0,1,'','','',2,2),(2194,'',1777,175,53,676,29,'FF',7,0,1,'Key Read Req','','',2,1),(2193,'',1831,174,60,0,0,'FF',9,12,3,'Maximum:','','',2,16),(2192,'',1830,174,60,0,0,'FF',9,12,1,'Average:','','',2,15),(2191,'',1829,174,60,0,0,'FF',9,12,4,'Current:','','',2,14),(2190,'',1828,174,60,0,1,'FF',4,12,1,'Total','','',2,13),(2189,'',1827,174,60,673,0,'FF',9,0,3,'Maximum:','','on',2,12),(2188,'',1826,174,60,673,0,'FF',9,0,1,'Average:','','',2,11),(2187,'',1825,174,60,673,0,'FF',9,0,4,'Current:','','',2,10),(2186,'',1824,174,60,673,12,'FF',8,0,1,'Nice','','',2,9),(2185,'',1823,174,60,675,0,'FF',9,0,3,'Maximum:','','on',2,8),(2184,'',1822,174,60,675,0,'FF',9,0,1,'Average:','','',2,7),(2183,'',1821,174,60,675,0,'FF',9,0,4,'Current:','','',2,6),(2182,'',1820,174,60,675,21,'FF',8,0,1,'User','','',2,5),(2181,'',1819,174,60,674,0,'FF',9,0,3,'Maximum:','','on',2,4),(2180,'',1818,174,60,674,0,'FF',9,0,1,'Average:','','',2,3),(2179,'',1817,174,60,674,0,'FF',9,0,4,'Current:','','',2,2),(2178,'',1816,174,60,674,9,'FF',7,0,1,'System','','',2,1),(2177,'',16,173,2,672,0,'FF',9,2,3,'Maximum:','','',2,8),(2176,'',15,173,2,672,0,'FF',9,2,1,'Average:','','',2,7),(2175,'',14,173,2,672,0,'FF',9,2,4,'Current:','','',2,6),(2174,'',13,173,2,672,20,'FF',4,2,1,'Outbound','','',2,5),(2173,'',12,173,2,671,0,'FF',9,2,3,'Maximum:','','on',2,4),(2172,'',11,173,2,671,0,'FF',9,2,1,'Average:','','',2,3),(2171,'',10,173,2,671,0,'FF',9,2,4,'Current:','','',2,2),(2170,'',9,173,2,671,22,'FF',7,2,1,'Inbound','','',2,1),(2169,'',16,172,2,670,0,'FF',9,2,3,'Maximum:','','',2,8),(2168,'',15,172,2,670,0,'FF',9,2,1,'Average:','','',2,7),(2167,'',14,172,2,670,0,'FF',9,2,4,'Current:','','',2,6),(2166,'',13,172,2,670,20,'FF',4,2,1,'Outbound','','',2,5),(2165,'',12,172,2,669,0,'FF',9,2,3,'Maximum:','','on',2,4),(2164,'',11,172,2,669,0,'FF',9,2,1,'Average:','','',2,3),(2162,'',9,172,2,669,22,'FF',7,2,1,'Inbound','','',2,1),(2163,'',10,172,2,669,0,'FF',9,2,4,'Current:','','',2,2),(3052,'',1909,260,63,1002,0,'FF',9,0,4,'Current:','','on',4,7),(3053,'',1801,261,57,1004,63,'FF',7,0,1,'Table Locks Immed','','',2,1),(3054,'',1802,261,57,1004,72,'FF',4,0,1,'','','',2,2),(3055,'',1803,261,57,1006,42,'FF',5,0,1,'Slow Launch Threads','','',2,3),(3057,'',1805,261,57,1005,8,'FF',5,0,1,'Table Locks Waited','','',2,5),(1752,'ab60cf53d22007ff9fe05378f917d7bb',0,0,49,456,65,'FF',4,0,1,'Insert','','',2,4),(1751,'0c7ead4c34e782a20bbf0fbe97d5a5d6',0,0,49,455,48,'FF',4,0,1,'Delete','','',2,3),(1750,'0a3ca375ce3ff034ea4c3cef9db9e67d',0,0,49,459,1,'FF',4,0,1,'','','',2,2),(1749,'f8ea1f37b28f8b6e41de703742711730',0,0,49,459,80,'FF',7,0,1,'Update','','',2,1),(1748,'e2c0d63776981ff0b7f7892b604b9cde',0,0,48,452,94,'FF',4,18,1,'Binlog Cache Use(K)','','',2,5),(1747,'c7bbc43a84f0b1109ce82a7e0fdc9104',0,0,48,453,10,'FF',5,18,1,'Binlog Cache Disk(K)','','',2,4),(3056,'',1804,261,57,1007,94,'FF',5,0,1,'Slow Queries','','',2,4),(3050,'',1907,260,63,1003,0,'FF',9,0,4,'Current:','','on',4,5),(3051,'',1908,260,63,1002,43,'FF',7,0,1,'15 Minute Average','','',2,6),(3048,'',1905,260,63,1001,28,'FF',4,0,1,'','','',2,3),(3049,'',1906,260,63,1003,33,'FF',7,0,1,'5 Minute Average','','',2,4),(3047,'',1904,260,63,1001,0,'FF',9,0,4,'Current:','','on',4,2),(3046,'',1903,260,63,1001,25,'FF',7,0,1,'1 Minute Average','','',2,1),(3045,'',1914,259,64,998,8,'FF',4,0,1,'Updated','','',2,5),(3044,'',1913,259,64,1000,94,'FF',5,0,1,'Inserted','','',2,4),(3307,'',61,292,7,1104,25,'FF',7,0,1,'','','',2,1),(3315,'',61,294,7,1106,25,'FF',7,0,1,'','','',2,1),(3316,'',62,294,7,1106,0,'FF',9,0,4,'Current:','','',2,2),(3278,'',64,284,7,1096,0,'FF',9,0,3,'Maximum:','','',2,4),(3277,'',63,284,7,1096,0,'FF',9,0,1,'Average:','','',2,3),(3276,'',62,284,7,1096,0,'FF',9,0,4,'Current:','','',2,2),(3275,'',61,284,7,1096,25,'FF',7,0,1,'','','',2,1),(3274,'',64,283,7,1095,0,'FF',9,0,3,'Maximum:','','',2,4),(3267,'',61,282,7,1094,25,'FF',7,0,1,'','','',2,1),(3266,'',64,281,7,1093,0,'FF',9,0,3,'Maximum:','','',2,4),(3265,'',63,281,7,1093,0,'FF',9,0,1,'Average:','','',2,3),(1746,'b6f9079a23c58d838378efab41d76179',0,0,48,454,48,'FF',5,0,1,'Seconds Lag','','',2,3),(1745,'4d4bef9e1e14428815c647a51d450d05',0,0,48,451,27,'FF',4,18,1,'','','',2,2),(1744,'c33084c411587d6361b095318a4fbdd0',0,0,48,451,28,'FF',7,18,1,'LogPosLag(KB)','','',2,1),(3042,'',1911,259,64,997,72,'FF',4,0,1,'','','',2,2),(3043,'',1912,259,64,999,42,'FF',5,0,1,'Deleted','','',2,3),(3040,'',1924,258,66,995,17,'FF',4,0,1,'Spin Waits','','',2,4),(3041,'',1910,259,64,997,63,'FF',7,0,1,'Read','','',2,1),(3039,'',1923,258,66,996,67,'FF',5,0,1,'Spin Rounds','','',2,3),(3036,'',1928,257,67,992,45,'FF',4,0,1,'Merges','','',2,4),(3037,'',1921,258,66,994,30,'FF',7,0,1,'OS Waits','','',2,1),(3038,'',1922,258,66,994,19,'FF',4,0,1,'','','',2,2),(3034,'',1926,257,67,993,96,'FF',4,0,1,'','','',2,2),(3035,'',1927,257,67,991,10,'FF',4,0,1,'Merged','','',2,3),(3264,'',62,281,7,1093,0,'FF',9,0,4,'Current:','','',2,2),(3263,'',61,281,7,1093,25,'FF',7,0,1,'','','',2,1),(3262,'',64,280,7,1092,0,'FF',9,0,3,'Maximum:','','',2,4),(3294,'',64,288,7,1100,0,'FF',9,0,3,'Maximum:','','',2,4),(3293,'',63,288,7,1100,0,'FF',9,0,1,'Average:','','',2,3),(3292,'',62,288,7,1100,0,'FF',9,0,4,'Current:','','',2,2),(3291,'',61,288,7,1100,25,'FF',7,0,1,'','','',2,1),(3259,'',61,280,7,1092,25,'FF',7,0,1,'','','',2,1),(3260,'',62,280,7,1092,0,'FF',9,0,4,'Current:','','',2,2),(3261,'',63,280,7,1092,0,'FF',9,0,1,'Average:','','',2,3),(3033,'',1925,257,67,993,97,'FF',7,0,1,'Inserts','','',2,1),(3032,'',1933,256,68,989,10,'FF',4,0,1,'Fsyncs','','',2,5),(3028,'',1929,256,68,990,55,'FF',7,0,1,'Reads','','',2,1),(3029,'',1930,256,68,990,57,'FF',4,0,1,'','','',2,2),(3030,'',1931,256,68,987,17,'FF',5,0,1,'File Writes','','',2,3),(3031,'',1932,256,68,988,42,'FF',5,0,1,'Log Writes','','',2,4),(3067,'',1835,263,61,1013,0,'FF',9,0,2,'Min:','','',2,4),(3066,'',1834,263,61,1013,0,'FF',9,0,1,'Average:','','',2,3),(3065,'',1833,263,61,1013,0,'FF',9,0,4,'Current:','','',2,2),(3064,'',1832,263,61,1013,95,'FF',7,0,1,'Select','','',2,1),(3063,'',1795,262,55,1011,17,'FF',5,0,1,'Connections','','',2,6),(3027,'',1920,255,65,983,44,'FF',4,19,1,'Miss Rate','','',2,6),(3026,'',1919,255,65,985,45,'FF',4,0,1,'Pool Size','','',2,5),(3025,'',1918,255,65,984,67,'FF',4,0,1,'Modified Pages','','',2,4),(3024,'',1917,255,65,982,6,'FF',4,0,1,'Free Pages','','',2,3),(3023,'',1916,255,65,986,27,'FF',4,0,1,'','','',2,2),(3022,'',1915,255,65,986,29,'FF',7,0,1,'Database Pages','','',2,1),(3021,'',1781,254,53,981,45,'FF',4,0,1,'Key Writes','','',2,5),(3020,'',1780,254,53,979,67,'FF',4,0,1,'Key Reads','','',2,4),(3018,'',1778,254,53,978,1,'FF',4,0,1,'','','',2,2),(3019,'',1779,254,53,980,48,'FF',4,0,1,'Key Write Req','','',2,3),(3017,'',1777,254,53,978,29,'FF',7,0,1,'Key Read Req','','',2,1),(3016,'',1831,253,60,0,0,'FF',9,12,3,'Maximum:','','',2,16),(3015,'',1830,253,60,0,0,'FF',9,12,1,'Average:','','',2,15),(3395,'',63,312,7,1128,0,'FF',9,0,1,'Average:','','',2,3),(3394,'',62,312,7,1128,0,'FF',9,0,4,'Current:','','',2,2),(3393,'',61,312,7,1128,25,'FF',7,0,1,'','','',2,1),(3392,'',64,311,7,1127,0,'FF',9,0,3,'Maximum:','','',2,4),(3001,'',1816,253,60,976,9,'FF',7,0,1,'System','','',2,1),(3002,'',1817,253,60,976,0,'FF',9,0,4,'Current:','','',2,2),(3003,'',1818,253,60,976,0,'FF',9,0,1,'Average:','','',2,3),(3004,'',1819,253,60,976,0,'FF',9,0,3,'Maximum:','','on',2,4),(3005,'',1820,253,60,977,21,'FF',8,0,1,'User','','',2,5),(3006,'',1821,253,60,977,0,'FF',9,0,4,'Current:','','',2,6),(3007,'',1822,253,60,977,0,'FF',9,0,1,'Average:','','',2,7),(3008,'',1823,253,60,977,0,'FF',9,0,3,'Maximum:','','on',2,8),(3009,'',1824,253,60,975,12,'FF',8,0,1,'Nice','','',2,9),(3010,'',1825,253,60,975,0,'FF',9,0,4,'Current:','','',2,10),(3011,'',1826,253,60,975,0,'FF',9,0,1,'Average:','','',2,11),(3012,'',1827,253,60,975,0,'FF',9,0,3,'Maximum:','','on',2,12),(3013,'',1828,253,60,0,1,'FF',4,12,1,'Total','','',2,13),(3014,'',1829,253,60,0,0,'FF',9,12,4,'Current:','','',2,14),(3062,'',1794,262,55,1008,10,'FF',4,0,1,'Queries','','',2,5),(3061,'',1793,262,55,1012,95,'FF',5,0,1,'Max Conn','','',2,4),(3060,'',1792,262,55,1009,8,'FF',5,18,1,'KB Recvd','','',2,3),(3059,'',1791,262,55,1010,59,'FF',4,18,1,'','','',2,2),(3058,'',1790,262,55,1010,55,'FF',7,18,1,'KB Sent','','',2,1),(3090,'',1858,264,62,1024,29,'FF',7,0,1,'Read Rnd Next','','',2,1),(3089,'',1857,263,61,1013,89,'FF',4,0,1,'','','',2,26),(3088,'',1856,263,61,1015,0,'FF',9,0,3,'Max:','','on',2,25),(3087,'',1855,263,61,1015,0,'FF',9,0,2,'Min:','','',2,24),(3086,'',1854,263,61,1015,0,'FF',9,0,1,'Average:','','',2,23),(3083,'',1851,263,61,1014,0,'FF',9,0,3,'Max:','','on',2,20),(3084,'',1852,263,61,1015,10,'FF',4,0,1,'Update','','',2,21),(3085,'',1853,263,61,1015,0,'FF',9,0,4,'Current:','','',2,22),(3131,'',1899,264,62,1026,0,'FF',9,0,4,'Current:','','',2,42),(3130,'',1898,264,62,1026,75,'FF',4,0,1,'write:','','',2,41),(3129,'',1897,264,62,1025,0,'FF',9,0,3,'Max:','','on',2,40),(3128,'',1896,264,62,1025,0,'FF',9,0,2,'Min:','','',2,39),(3127,'',1895,264,62,1025,0,'FF',9,0,1,'Average:','','',2,38),(3126,'',1894,264,62,1025,0,'FF',9,0,4,'Current:','','',2,37),(3125,'',1893,264,62,1025,84,'FF',4,0,1,'Update:','','',2,36),(3124,'',1892,264,62,1020,0,'FF',9,0,3,'Max:','','on',2,35),(3123,'',1891,264,62,1020,0,'FF',9,0,2,'Min:','','',2,34),(3122,'',1890,264,62,1020,0,'FF',9,0,1,'Average:','','',2,33),(3121,'',1889,264,62,1020,0,'FF',9,0,4,'Current:','','',2,32),(3120,'',1888,264,62,1020,103,'FF',4,0,1,'Delete','','',2,31),(3119,'',1887,264,62,1023,0,'FF',9,0,3,'Max:','','on',2,30),(3077,'',1845,263,61,1017,0,'FF',9,0,2,'Min:','','',2,14),(3076,'',1844,263,61,1017,0,'FF',9,0,1,'Average:','','',2,13),(3075,'',1843,263,61,1017,0,'FF',9,0,4,'Current:','','',2,12),(3074,'',1842,263,61,1017,9,'FF',4,0,1,'Delete','','',2,11),(3073,'',1841,263,61,1016,0,'FF',9,0,3,'Max:','','on',2,10),(3072,'',1840,263,61,1016,0,'FF',9,0,2,'Min:','','',2,9),(3068,'',1836,263,61,1013,0,'FF',9,0,3,'Max:','','on',2,5),(3069,'',1837,263,61,1016,1,'FF',4,0,1,'Change_DB','','',2,6),(3070,'',1838,263,61,1016,0,'FF',9,0,4,'Current:','','',2,7),(3071,'',1839,263,61,1016,0,'FF',9,0,1,'Average:','','',2,8),(3096,'',1864,264,62,1021,0,'FF',9,0,4,'Current:','','',2,7),(3095,'',1863,264,62,1021,41,'FF',4,0,1,'Read First','','',2,6),(3094,'',1862,264,62,1024,0,'FF',9,0,3,'Max:','','on',2,5),(3093,'',1861,264,62,1024,0,'FF',9,0,2,'Min:','','',2,4),(3092,'',1860,264,62,1024,0,'FF',9,0,1,'Average:','','',2,3),(3091,'',1859,264,62,1024,0,'FF',9,0,4,'Current:','','',2,2),(3082,'',1850,263,61,1014,0,'FF',9,0,2,'Min:','','',2,19),(3081,'',1849,263,61,1014,0,'FF',9,0,1,'Average:','','',2,18),(3080,'',1848,263,61,1014,0,'FF',9,0,4,'Current:','','',2,17),(3078,'',1846,263,61,1017,0,'FF',9,0,3,'Max:','','on',2,15),(3079,'',1847,263,61,1014,33,'FF',4,0,1,'Insert','','',2,16),(3118,'',1886,264,62,1023,0,'FF',9,0,2,'Min:','','',2,29),(3117,'',1885,264,62,1023,0,'FF',9,0,1,'Average:','','',2,28),(3116,'',1884,264,62,1023,0,'FF',9,0,4,'Current:','','',2,27),(3115,'',1883,264,62,1023,10,'FF',4,0,1,'Read Rnd','','',2,26),(3114,'',1882,264,62,1022,0,'FF',9,0,3,'Max:','','on',2,25),(3113,'',1881,264,62,1022,0,'FF',9,0,2,'Min:','','',2,24),(3112,'',1880,264,62,1022,0,'FF',9,0,1,'Average:','','',2,23),(3111,'',1879,264,62,1022,0,'FF',9,0,4,'Current:','','',2,22),(3110,'',1878,264,62,1022,95,'FF',4,0,1,'Read Prev','','',2,21),(3109,'',1877,264,62,1019,0,'FF',9,0,3,'Max:','','on',2,20),(3108,'',1876,264,62,1019,0,'FF',9,0,2,'Min:','','',2,19),(3107,'',1875,264,62,1019,0,'FF',9,0,1,'Average:','','',2,18),(3106,'',1874,264,62,1019,0,'FF',9,0,4,'Current:','','',2,17),(3105,'',1873,264,62,1019,64,'FF',4,0,1,'Read Next','','',2,16),(3104,'',1872,264,62,1018,0,'FF',9,0,3,'Max:','','on',2,15),(3103,'',1871,264,62,1018,0,'FF',9,0,2,'Min:','','',2,14),(3102,'',1870,264,62,1018,0,'FF',9,0,1,'Average:','','',2,13),(3101,'',1869,264,62,1018,0,'FF',9,0,4,'Current:','','',2,12),(3100,'',1868,264,62,1018,59,'FF',4,0,1,'Read Key','','',2,11),(3097,'',1865,264,62,1021,0,'FF',9,0,1,'Average:','','',2,8),(3098,'',1866,264,62,1021,0,'FF',9,0,2,'Min:','','',2,9),(3099,'',1867,264,62,1021,0,'FF',9,0,3,'Max:','','on',2,10),(3391,'',63,311,7,1127,0,'FF',9,0,1,'Average:','','',2,3),(3390,'',62,311,7,1127,0,'FF',9,0,4,'Current:','','',2,2),(3389,'',61,311,7,1127,25,'FF',7,0,1,'','','',2,1),(3388,'',64,310,7,1126,0,'FF',9,0,3,'Maximum:','','',2,4),(3190,'',1755,273,49,1075,8,'FF',4,0,1,'UpdateMulti','','',2,7),(3383,'',63,309,7,1125,0,'FF',9,0,1,'Average:','','',2,3),(3384,'',64,309,7,1125,0,'FF',9,0,3,'Maximum:','','',2,4),(3385,'',61,310,7,1126,25,'FF',7,0,1,'','','',2,1),(3386,'',62,310,7,1126,0,'FF',9,0,4,'Current:','','',2,2),(3387,'',63,310,7,1126,0,'FF',9,0,1,'Average:','','',2,3),(3273,'',63,283,7,1095,0,'FF',9,0,1,'Average:','','',2,3),(3272,'',62,283,7,1095,0,'FF',9,0,4,'Current:','','',2,2),(3271,'',61,283,7,1095,25,'FF',7,0,1,'','','',2,1),(3268,'',62,282,7,1094,0,'FF',9,0,4,'Current:','','',2,2),(3269,'',63,282,7,1094,0,'FF',9,0,1,'Average:','','',2,3),(3270,'',64,282,7,1094,0,'FF',9,0,3,'Maximum:','','',2,4),(3382,'',62,309,7,1125,0,'FF',9,0,4,'Current:','','',2,2),(3381,'',61,309,7,1125,25,'FF',7,0,1,'','','',2,1),(3185,'',1750,273,49,1074,1,'FF',4,0,1,'','','',2,2),(3184,'',1749,273,49,1074,80,'FF',7,0,1,'Update','','',2,1),(3183,'',1762,272,50,1069,15,'FF',4,0,1,'Write','','',2,7),(3182,'',1761,272,50,1067,43,'FF',4,0,1,'Rollback','','',2,6),(3181,'',1760,272,50,1066,10,'FF',5,0,1,'Discover','','',2,5),(3178,'',1757,272,50,1068,77,'FF',4,0,1,'','','',2,2),(3179,'',1758,272,50,1065,48,'FF',5,0,1,'Delete','','',2,3),(3180,'',1759,272,50,1064,95,'FF',4,0,1,'Commit','','',2,4),(3380,'',64,308,7,1124,0,'FF',9,0,3,'Maximum:','','',2,4),(3379,'',63,308,7,1124,0,'FF',9,0,1,'Average:','','',2,3),(3378,'',62,308,7,1124,0,'FF',9,0,4,'Current:','','',2,2),(3377,'',61,308,7,1124,25,'FF',7,0,1,'','','',2,1),(3376,'',64,307,7,1123,0,'FF',9,0,3,'Maximum:','','',2,4),(3375,'',63,307,7,1123,0,'FF',9,0,1,'Average:','','',2,3),(3374,'',62,307,7,1123,0,'FF',9,0,4,'Current:','','',2,2),(3373,'',61,307,7,1123,25,'FF',7,0,1,'','','',2,1),(3189,'',1754,273,49,1073,15,'FF',4,0,1,'Truncate','','',2,6),(3188,'',1753,273,49,1072,17,'FF',4,0,1,'Insert Select','','',2,5),(3186,'',1751,273,49,1070,48,'FF',4,0,1,'Delete','','',2,3),(3187,'',1752,273,49,1071,65,'FF',4,0,1,'Insert','','',2,4),(3372,'',79,306,10,1122,0,'FF',9,0,3,'Maximum:','','',3,4),(3371,'',78,306,10,1122,0,'FF',9,0,1,'Average:','','',3,3),(3370,'',77,306,10,1122,0,'FF',9,0,4,'Current:','','',3,2),(3369,'',76,306,10,1122,67,'FF',7,0,1,'Users','','',2,1),(3368,'',68,305,8,1121,0,'FF',9,0,3,'Maximum:','','',3,4),(3367,'',67,305,8,1121,0,'FF',9,0,1,'Average:','','',3,3),(3366,'',66,305,8,1121,0,'FF',9,0,4,'Current:','','',3,2),(3365,'',65,305,8,1121,48,'FF',7,0,1,'Running Processes','','',2,1),(3364,'',79,304,10,1120,0,'FF',9,0,3,'Maximum:','','',3,4),(3363,'',78,304,10,1120,0,'FF',9,0,1,'Average:','','',3,3),(3362,'',77,304,10,1120,0,'FF',9,0,4,'Current:','','',3,2),(3361,'',76,304,10,1120,67,'FF',7,0,1,'Users','','',2,1),(3360,'',75,303,9,0,1,'FF',4,12,1,'','','',2,7),(3359,'',74,303,9,1119,0,'FF',9,0,4,'Current:','','on',4,6),(3358,'',73,303,9,1119,9,'FF',8,0,1,'15 Minute Average','','',2,5),(3357,'',72,303,9,1118,0,'FF',9,0,4,'Current:','','on',4,4),(3356,'',71,303,9,1118,8,'FF',8,0,1,'5 Minute Average','','',2,3),(3355,'',70,303,9,1117,0,'FF',9,0,4,'Current:','','on',4,2),(3150,'',1772,267,52,1044,9,'FF',4,0,1,'Read Rnd Next','','',2,3),(3149,'',1771,267,52,1040,77,'FF',4,0,1,'','','',2,2),(3148,'',1770,267,52,1040,63,'FF',7,0,1,'Read Key','','',2,1),(3147,'',1748,266,48,1035,94,'FF',4,18,1,'Binlog Cache Use(K)','','',2,5),(3145,'',1746,266,48,1038,48,'FF',5,0,1,'Seconds Lag','','',2,3),(3146,'',1747,266,48,1037,10,'FF',5,18,1,'Binlog Cache Disk(K)','','',2,4),(3177,'',1756,272,50,1068,80,'FF',7,0,1,'Update','','',2,1),(3176,'',1815,271,59,1061,89,'FF',4,0,1,'Threads Running','','',2,11),(3175,'',1814,271,59,1060,56,'FF',4,0,1,'Threads Created','','',2,9),(3174,'',1813,271,59,1059,15,'FF',4,0,1,'Threads Connected','','',2,7),(3173,'',1812,271,59,1058,10,'FF',4,0,1,'Threads Cached','','',2,5),(3172,'',1811,271,59,1063,12,'FF',4,0,1,'Aborted Connects','','',2,3),(3171,'',1810,271,59,1062,44,'FF',4,0,1,'Aborted Clients','','',2,1),(3140,'',1787,265,54,1034,58,'FF',4,0,1,'Total Blocks','','',2,6),(3139,'',1786,265,54,1029,28,'FF',5,0,1,'Cache Hits','','',2,5),(3138,'',1785,265,54,1033,10,'FF',5,0,1,'Queries Cached','','',2,4),(3137,'',1784,265,54,1032,77,'FF',4,0,1,'Not Cached','','',2,3),(3132,'',1900,264,62,1026,0,'FF',9,0,1,'Average:','','',2,43),(3133,'',1901,264,62,1026,0,'FF',9,0,2,'Min:','','',2,44),(3134,'',1902,264,62,1026,0,'FF',9,0,3,'Max:','','on',2,45),(3135,'',1782,265,54,1028,38,'FF',7,18,1,'Free Kilobytes','','',2,1),(3136,'',1783,265,54,1030,17,'FF',4,0,1,'Cache Inserts','','',2,2),(3153,'',1775,267,52,1042,58,'FF',5,0,1,'Read Prev','','',2,6),(3152,'',1774,267,52,1043,43,'FF',4,0,1,'Read Rnd','','',2,5),(3151,'',1773,267,52,1041,8,'FF',4,0,1,'Read Next','','',2,4),(3144,'',1745,266,48,1036,27,'FF',4,18,1,'','','',2,2),(3143,'',1744,266,48,1036,28,'FF',7,18,1,'LogPosLag(KB)','','',2,1),(3141,'',1788,265,54,1027,27,'FF',4,0,1,'Free Blocks','','',2,7),(3142,'',1789,265,54,1031,9,'FF',5,0,1,'Lowmem Prunes','','',2,8),(3170,'',1809,270,58,1056,17,'FF',5,0,1,'Temp Files','','',2,4),(3169,'',1808,270,58,1055,48,'FF',4,0,1,'Temp Disk Tables','','',2,3),(3168,'',1807,270,58,1057,27,'FF',4,0,1,'','','',2,2),(3167,'',1806,270,58,1057,31,'FF',7,0,1,'Temp Tables','','',2,1),(3166,'',1800,269,56,1054,10,'FF',5,0,1,'Scan','','',2,5),(3165,'',1799,269,56,1051,42,'FF',4,0,1,'Merge Passes','','',2,4),(3164,'',1798,269,56,1052,17,'FF',5,0,1,'Range','','',2,3),(3163,'',1797,269,56,1053,27,'FF',4,18,1,'','','',2,2),(3162,'',1796,269,56,1053,31,'FF',7,18,1,'kiloRows','','',2,1),(3161,'',1769,268,51,1050,1,'FF',4,0,1,'Scan','','',2,7),(3160,'',1768,268,51,1049,48,'FF',4,0,1,'RangeCheck','','',2,6),(3159,'',1767,268,51,1047,10,'FF',4,0,1,'FullRangeJoin','','',2,5),(3158,'',1766,268,51,1046,60,'FF',4,0,1,'FullJoin','','',2,4),(3157,'',1765,268,51,1048,17,'FF',5,0,1,'Range','','',2,3),(3156,'',1764,268,51,1045,77,'FF',4,0,1,'','','',2,2),(3155,'',1763,268,51,1045,63,'FF',7,0,1,'Select','','',2,1),(3154,'',1776,267,52,1039,94,'FF',4,0,1,'Read First','','',2,7),(2541,'',16,217,2,821,0,'FF',9,2,3,'Maximum:','','',2,8),(2540,'',15,217,2,821,0,'FF',9,2,1,'Average:','','',2,7),(2539,'',14,217,2,821,0,'FF',9,2,4,'Current:','','',2,6),(2538,'',13,217,2,821,20,'FF',4,2,1,'Outbound','','',2,5),(2537,'',12,217,2,820,0,'FF',9,2,3,'Maximum:','','on',2,4),(2536,'',11,217,2,820,0,'FF',9,2,1,'Average:','','',2,3),(2535,'',10,217,2,820,0,'FF',9,2,4,'Current:','','',2,2),(2534,'',9,217,2,820,22,'FF',7,2,1,'Inbound','','',2,1),(2533,'',16,216,2,819,0,'FF',9,2,3,'Maximum:','','',2,8),(2532,'',15,216,2,819,0,'FF',9,2,1,'Average:','','',2,7),(2531,'',14,216,2,819,0,'FF',9,2,4,'Current:','','',2,6),(2530,'',13,216,2,819,20,'FF',4,2,1,'Outbound','','',2,5),(2529,'',12,216,2,818,0,'FF',9,2,3,'Maximum:','','on',2,4),(2528,'',11,216,2,818,0,'FF',9,2,1,'Average:','','',2,3),(2527,'',10,216,2,818,0,'FF',9,2,4,'Current:','','',2,2),(2526,'',9,216,2,818,22,'FF',7,2,1,'Inbound','','',2,1),(1753,'c84823eb27e0a06806f5ffb63ce52cb0',0,0,49,457,17,'FF',4,0,1,'Insert Select','','',2,5),(1754,'72913ad0d958e606923be5dc07843abc',0,0,49,458,15,'FF',4,0,1,'Truncate','','',2,6),(1755,'9f62edfb02072683eeb1197d177d874a',0,0,49,460,8,'FF',4,0,1,'UpdateMulti','','',2,7),(1756,'ea68c2fd17c7aca008890fe29e6dc555',0,0,50,465,80,'FF',7,0,1,'Update','','',2,1),(1757,'60882014afab9a0dc158d27719c4845d',0,0,50,465,77,'FF',4,0,1,'','','',2,2),(1758,'c609901e05c080da5f6099e1ecdc90b6',0,0,50,462,48,'FF',5,0,1,'Delete','','',2,3),(1759,'c84831169e1027eed44c2a3df2a5b040',0,0,50,461,95,'FF',4,0,1,'Commit','','',2,4),(1760,'a2d950324c30a64ad2d45b12fd569e8e',0,0,50,463,10,'FF',5,0,1,'Discover','','',2,5),(1761,'27591971edecbf0f243e94990286da49',0,0,50,464,43,'FF',4,0,1,'Rollback','','',2,6),(1762,'f9be16781adf29580149cbee64872f99',0,0,50,466,15,'FF',4,0,1,'Write','','',2,7),(1763,'d8bbc5d1898ca6cb4d189d7b3b0570fb',0,0,51,467,63,'FF',7,0,1,'Select','','',2,1),(1764,'af22fa663db1c4de4827e4985fbb1300',0,0,51,467,77,'FF',4,0,1,'','','',2,2),(1765,'4ae80db87c37bf923216cd8b71a33f12',0,0,51,470,17,'FF',5,0,1,'Range','','',2,3),(1766,'43a4a056edc73ba330e6c7697152be46',0,0,51,468,60,'FF',4,0,1,'FullJoin','','',2,4),(1767,'e94c90ffb7a3abe97e954fa80b10c5ac',0,0,51,469,10,'FF',4,0,1,'FullRangeJoin','','',2,5),(1768,'ac52d689d68d5162b891c521deac9dfa',0,0,51,471,48,'FF',4,0,1,'RangeCheck','','',2,6),(1769,'8d66ecf6a3c7e677c8cbc1cb4e4765f3',0,0,51,472,1,'FF',4,0,1,'Scan','','',2,7),(1770,'c78c1289c90b85aab83db9ce50e424ab',0,0,52,474,63,'FF',7,0,1,'Read Key','','',2,1),(1771,'d4b00301da31dbe88f9acca98d9795ba',0,0,52,474,77,'FF',4,0,1,'','','',2,2),(1772,'2cf0207f0cb0bb0478c64ed5abe3b9a5',0,0,52,478,9,'FF',4,0,1,'Read Rnd Next','','',2,3),(1773,'ff839ec85520eec048e4d1b310841a8a',0,0,52,475,8,'FF',4,0,1,'Read Next','','',2,4),(1774,'ff2effdc6c8d893430bd7a1b609dd0cd',0,0,52,477,43,'FF',4,0,1,'Read Rnd','','',2,5),(1775,'c2c63d966c2655b4ba7147de022545ac',0,0,52,476,58,'FF',5,0,1,'Read Prev','','',2,6),(1776,'54ecc7b22d591c473c7b3d87131ab40b',0,0,52,473,94,'FF',4,0,1,'Read First','','',2,7),(1777,'dd70d611112a9d0722de9b803ddcd827',0,0,53,479,29,'FF',7,0,1,'Key Read Req','','',2,1),(1778,'e40fe229b80bd5966a6f2d06ffa8c899',0,0,53,479,1,'FF',4,0,1,'','','',2,2),(1779,'f1bdcdfd9b3471b83b23d6bbc920d049',0,0,53,481,48,'FF',4,0,1,'Key Write Req','','',2,3),(1780,'e96b5c7da2079084560215ee4951e594',0,0,53,480,67,'FF',4,0,1,'Key Reads','','',2,4),(1781,'0635096785e29f967903cad516df14d9',0,0,53,482,45,'FF',4,0,1,'Key Writes','','',2,5),(1782,'b9ae86742f32cb11bbf6fc630da6c9b9',0,0,54,484,38,'FF',7,18,1,'Free Kilobytes','','',2,1),(1783,'78b9242977d1f94e222d6dc0eecdd1c6',0,0,54,486,17,'FF',4,0,1,'Cache Inserts','','',2,2),(1784,'6403b104533b7398ac3b2c5724c88a5b',0,0,54,488,77,'FF',4,0,1,'Not Cached','','',2,3),(1785,'abf37d4e4131e97ae55287d980a72f95',0,0,54,489,10,'FF',5,0,1,'Queries Cached','','',2,4),(1786,'ade89b86e349791b28c2c102fa22a1fd',0,0,54,485,28,'FF',5,0,1,'Cache Hits','','',2,5),(1787,'f287f80dc45ec1db8a112ce8ab6552df',0,0,54,490,58,'FF',4,0,1,'Total Blocks','','',2,6),(1788,'96a36ec2271cda6c4af013afc5284c6a',0,0,54,483,27,'FF',4,0,1,'Free Blocks','','',2,7),(1789,'7990cc21d416b61e8bc015c098522a94',0,0,54,487,9,'FF',5,0,1,'Lowmem Prunes','','',2,8),(1790,'dd32fd4ce31c734b99c76458a03977d8',0,0,55,493,55,'FF',7,18,1,'KB Sent','','',2,1),(1791,'f460e749d29518c3f8b0b85470fcb259',0,0,55,493,59,'FF',4,18,1,'','','',2,2),(1792,'0e7bb2797e9511d7681281a34019c3fc',0,0,55,492,8,'FF',5,18,1,'KB Recvd','','',2,3),(1793,'610d1b001c90535abce5a8deee1821c2',0,0,55,495,95,'FF',5,0,1,'Max Conn','','',2,4),(1794,'28897124a289605bb98555186b84eda3',0,0,55,491,10,'FF',4,0,1,'Queries','','',2,5),(1795,'39198617d1a4b640c93718e240ac5272',0,0,55,494,17,'FF',5,0,1,'Connections','','',2,6),(1796,'2fb4710a124a7c4a87a6b3e16035fae0',0,0,56,498,31,'FF',7,18,1,'kiloRows','','',2,1),(1797,'52deca0baaacb328170431f032bfbf1d',0,0,56,498,27,'FF',4,18,1,'','','',2,2),(1798,'163baa4331a662ac3295b6b8cb37b7dd',0,0,56,497,17,'FF',5,0,1,'Range','','',2,3),(1799,'54252f8a81de419ea96a534f1b333b6b',0,0,56,496,42,'FF',4,0,1,'Merge Passes','','',2,4),(1800,'7d51c1f2d8555c710e097273a5e33ac1',0,0,56,499,10,'FF',5,0,1,'Scan','','',2,5),(1801,'dd0e1be01b8d5dc277a85a2d5f19c8fd',0,0,57,500,63,'FF',7,0,1,'Table Locks Immed','','',2,1),(1802,'2bfab3fb426b89b03785690b01b7f1c8',0,0,57,500,72,'FF',4,0,1,'','','',2,2),(1803,'c37fd9b71917e93d4e4ca1f16fca873b',0,0,57,502,42,'FF',5,0,1,'Slow Launch Threads','','',2,3),(1804,'df7472909745ab4edeefeed96e88bc63',0,0,57,503,94,'FF',5,0,1,'Slow Queries','','',2,4),(1805,'2dd55398f267dc4c5ee3cf93957f82b9',0,0,57,501,8,'FF',5,0,1,'Table Locks Waited','','',2,5),(1806,'1f1e0ba0edbc65928f07e2d45b3aa4d8',0,0,58,506,31,'FF',7,0,1,'Temp Tables','','',2,1),(1807,'57863e2a0a5c0b1009bf8fe188e6af9b',0,0,58,506,27,'FF',4,0,1,'','','',2,2),(1808,'fcb476249251f34c1b5fd717491e7839',0,0,58,504,48,'FF',4,0,1,'Temp Disk Tables','','',2,3),(1809,'b201ae9fa5c9b8d53088d67e7d51274f',0,0,58,505,17,'FF',5,0,1,'Temp Files','','',2,4),(1810,'bef2d207ff9104e839e209a26570ec38',0,0,59,511,44,'FF',4,0,1,'Aborted Clients','','',2,1),(1811,'8b8e95e157c3c09cf5b5fcd654de0f60',0,0,59,512,12,'FF',4,0,1,'Aborted Connects','','',2,3),(1812,'f4564a7ede538c82afcc3d9e49f1f0b3',0,0,59,507,10,'FF',4,0,1,'Threads Cached','','',2,5),(1813,'dab96f40366007b2f44eb7f33b894b01',0,0,59,508,15,'FF',4,0,1,'Threads Connected','','',2,7),(1814,'3b20d42ffeb330f3dde22501fe69beed',0,0,59,509,56,'FF',4,0,1,'Threads Created','','',2,9),(1815,'33a61f83daacb8cd70b72eef2960a013',0,0,59,510,89,'FF',4,0,1,'Threads Running','','',2,11),(1816,'288a5df6706f2e126ff6812619caeee1',0,0,60,5,9,'FF',7,0,1,'System','','',2,1),(1817,'4f62dd9c78e627d2cd54ead4cdf5ffce',0,0,60,5,0,'FF',9,0,4,'Current:','','',2,2),(1818,'a77bec8e9269952b00ec2857b30962d5',0,0,60,5,0,'FF',9,0,1,'Average:','','',2,3),(1819,'8c807e6d0155a642b3f3edbf9483706a',0,0,60,5,0,'FF',9,0,3,'Maximum:','','on',2,4),(1820,'acaa683c9befa921f7dac5b5a51fa854',0,0,60,6,21,'FF',8,0,1,'User','','',2,5),(1821,'86597275f4b85382860b14981423453b',0,0,60,6,0,'FF',9,0,4,'Current:','','',2,6),(1822,'4ff133f346c4624c359493ecc76d7fc6',0,0,60,6,0,'FF',9,0,1,'Average:','','',2,7),(1823,'cc2d3baca35f6a7fd0b74443317ca34d',0,0,60,6,0,'FF',9,0,3,'Maximum:','','on',2,8),(1824,'0d91c40328b29e87f6ccd1b2166f32e6',0,0,60,7,12,'FF',8,0,1,'Nice','','',2,9),(1825,'3ffa25586849d56524da6744610881fc',0,0,60,7,0,'FF',9,0,4,'Current:','','',2,10),(1826,'0c10e3b6ab20d5fbace9aae19d40fab2',0,0,60,7,0,'FF',9,0,1,'Average:','','',2,11),(1827,'b1c1ab44573343f82b539a862484c687',0,0,60,7,0,'FF',9,0,3,'Maximum:','','on',2,12),(1828,'c197b6233726f60f6ab715ad6fd8d4c4',0,0,60,0,1,'FF',4,12,1,'Total','','',2,13),(1829,'1149144dc3b7d6dd27efa4d99a9dbfd5',0,0,60,0,0,'FF',9,12,4,'Current:','','',2,14),(1830,'7eaaea46c6bf09d58b3bbbcdebbc7266',0,0,60,0,0,'FF',9,12,1,'Average:','','',2,15),(1831,'81b7a4321f2c930492bff345d6c63107',0,0,60,0,0,'FF',9,12,3,'Maximum:','','',2,16),(1832,'6a6d312512e4753837259c4915086a1b',0,0,61,513,95,'FF',7,0,1,'Select','','',2,1),(1833,'ea52726cdb673cbcb10cb9cb259af692',0,0,61,513,0,'FF',9,0,4,'Current:','','',2,2),(1834,'67a3c063136cd8d17c23ebe67f72846a',0,0,61,513,0,'FF',9,0,1,'Average:','','',2,3),(1835,'a9012664a461a81914aa3253cc2562fb',0,0,61,513,0,'FF',9,0,2,'Min:','','',2,4),(1836,'eee8f808c5937b5c2cfc1a2da2334554',0,0,61,513,0,'FF',9,0,3,'Max:','','on',2,5),(1837,'4fe4402b0d52d221b1d595e98e56f8ba',0,0,61,516,1,'FF',4,0,1,'Change_DB','','',2,6),(1838,'d54b48de3e289abb539153d8914e980d',0,0,61,516,0,'FF',9,0,4,'Current:','','',2,7),(1839,'c453cff8d7f6a8cf942f87df3b0e4c39',0,0,61,516,0,'FF',9,0,1,'Average:','','',2,8),(1840,'f1f351aa4a14fa000bf70f84ad8c9dd0',0,0,61,516,0,'FF',9,0,2,'Min:','','',2,9),(1841,'69db589207e99eede456f82e55662118',0,0,61,516,0,'FF',9,0,3,'Max:','','on',2,10),(1842,'5dfb6959f46867763b94e8cfe0a27b60',0,0,61,517,9,'FF',4,0,1,'Delete','','',2,11),(1843,'6960fa64eb30aaabdd7d660b89f5c28e',0,0,61,517,0,'FF',9,0,4,'Current:','','',2,12),(1844,'a190a7f0e26c84a701e330af7dc06004',0,0,61,517,0,'FF',9,0,1,'Average:','','',2,13),(1845,'952f5d05c76dcfce12000c4a77eedb38',0,0,61,517,0,'FF',9,0,2,'Min:','','',2,14),(1846,'e8d27a3fe1220651de60ffb7092deec6',0,0,61,517,0,'FF',9,0,3,'Max:','','on',2,15),(1847,'d867c0042afbe4cf76e4cad95fee4bed',0,0,61,514,33,'FF',4,0,1,'Insert','','',2,16),(1848,'d0782de87ea81fb052aa298661600d03',0,0,61,514,0,'FF',9,0,4,'Current:','','',2,17),(1849,'0783d5b9d669d4cb6115f61e656e0520',0,0,61,514,0,'FF',9,0,1,'Average:','','',2,18),(1850,'207ee56a4d664c51e8ff82e408c3adad',0,0,61,514,0,'FF',9,0,2,'Min:','','',2,19),(1851,'bcdc912607f1b7d6782ae0fedbb1c569',0,0,61,514,0,'FF',9,0,3,'Max:','','on',2,20),(1852,'781448b5bde915b498278efacd7c2bfe',0,0,61,515,10,'FF',4,0,1,'Update','','',2,21),(1853,'63b81c777d65cd148781ee8cb9ef1678',0,0,61,515,0,'FF',9,0,4,'Current:','','',2,22),(1854,'35c2f19f6f8f1f35e29dbf12f77588d2',0,0,61,515,0,'FF',9,0,1,'Average:','','',2,23),(1855,'38d697af28d78d326ca2f4c4dbc177ad',0,0,61,515,0,'FF',9,0,2,'Min:','','',2,24),(1856,'c33116a3f0cb266cc89505ee6d086a77',0,0,61,515,0,'FF',9,0,3,'Max:','','on',2,25),(1857,'ff83b97266fa314e7ed7e40f1b665405',0,0,61,513,89,'FF',4,0,1,'','','',2,26),(1858,'66b43bea21a29a5f79e7307919ee2ff5',0,0,62,524,29,'FF',7,0,1,'Read Rnd Next','','',2,1),(1859,'2499b46ffdcfe78c97ccc726f10178ed',0,0,62,524,0,'FF',9,0,4,'Current:','','',2,2),(1860,'510bf8d3ebd6ace1acee55dae46c7912',0,0,62,524,0,'FF',9,0,1,'Average:','','',2,3),(1861,'2d960a5cdcae8a84c1279abc15293d5f',0,0,62,524,0,'FF',9,0,2,'Min:','','',2,4),(1862,'30a638d86a179758d93ef3e766a98744',0,0,62,524,0,'FF',9,0,3,'Max:','','on',2,5),(1863,'d744dfaa437f026a07cd36a3b9fdea78',0,0,62,521,41,'FF',4,0,1,'Read First','','',2,6),(1864,'6452b99a436c6528bcd45cded45f3cd7',0,0,62,521,0,'FF',9,0,4,'Current:','','',2,7),(1865,'b77e2f0033293c5370d10b8127011101',0,0,62,521,0,'FF',9,0,1,'Average:','','',2,8),(1866,'af09e35e48c4833569b7d898f9363c5e',0,0,62,521,0,'FF',9,0,2,'Min:','','',2,9),(1867,'73b037219a9a1bf8cb2d295b8725e0b4',0,0,62,521,0,'FF',9,0,3,'Max:','','on',2,10),(1868,'3bc56f5d80468d48fcfa392973591173',0,0,62,518,59,'FF',4,0,1,'Read Key','','',2,11),(1869,'4bb24f257aa348cadec1d17a6a0e2a1b',0,0,62,518,0,'FF',9,0,4,'Current:','','',2,12),(1870,'1652217e6b24ac77768fa1939eacb5a7',0,0,62,518,0,'FF',9,0,1,'Average:','','',2,13),(1871,'c3cd8175723f9444846800a5dc672db2',0,0,62,518,0,'FF',9,0,2,'Min:','','',2,14),(1872,'010a70bbdb080cfbfa8f43d1d34a26e0',0,0,62,518,0,'FF',9,0,3,'Max:','','on',2,15),(1873,'57ab4017cec4affe191415e50f9d399c',0,0,62,519,64,'FF',4,0,1,'Read Next','','',2,16),(1874,'0688b8cbfda5e779b9252c9678dbfd02',0,0,62,519,0,'FF',9,0,4,'Current:','','',2,17),(1875,'dc0447e8f500124e8267e8c43576f290',0,0,62,519,0,'FF',9,0,1,'Average:','','',2,18),(1876,'b282273f6bcf20c011055c81494cf893',0,0,62,519,0,'FF',9,0,2,'Min:','','',2,19),(1877,'ca803bc292e1d7049a8c01c880ba9c76',0,0,62,519,0,'FF',9,0,3,'Max:','','on',2,20),(1878,'8efb4027df45d90beff13c5a6e0508e1',0,0,62,522,95,'FF',4,0,1,'Read Prev','','',2,21),(1879,'9c9ce8afc35fa7135437709ae3dfbc70',0,0,62,522,0,'FF',9,0,4,'Current:','','',2,22),(1880,'066edc724ed0a8eb6c5732d9e8a8a9a2',0,0,62,522,0,'FF',9,0,1,'Average:','','',2,23),(1881,'84380e6c9d559b232015566449d081fb',0,0,62,522,0,'FF',9,0,2,'Min:','','',2,24),(1882,'7cdf76d975140318716f682e50f4a45d',0,0,62,522,0,'FF',9,0,3,'Max:','','on',2,25),(1883,'145e6a9f4316f023ca33352c42b83131',0,0,62,523,10,'FF',4,0,1,'Read Rnd','','',2,26),(1884,'42fb5e6cbcefa1da54a81b2b367aa8c2',0,0,62,523,0,'FF',9,0,4,'Current:','','',2,27),(1885,'bfebfb46f45c91b92b78fe6455278598',0,0,62,523,0,'FF',9,0,1,'Average:','','',2,28),(1886,'5136a757bfbc107d55dd1fda1de98227',0,0,62,523,0,'FF',9,0,2,'Min:','','',2,29),(1887,'43474641997f8f68c95c9eab7851563a',0,0,62,523,0,'FF',9,0,3,'Max:','','on',2,30),(1888,'b9dde8dca94b45db1c874788a2d4689b',0,0,62,520,103,'FF',4,0,1,'Delete','','',2,31),(1889,'f038dbd4d3fa2cf9e789a5c5452d58e6',0,0,62,520,0,'FF',9,0,4,'Current:','','',2,32),(1890,'750bd431243af24577e028cfbb4550d0',0,0,62,520,0,'FF',9,0,1,'Average:','','',2,33),(1891,'04e9fca0cff2857f57cf78f35f3fed84',0,0,62,520,0,'FF',9,0,2,'Min:','','',2,34),(1892,'bd917b874a25caf5bac9d2c198f2c13d',0,0,62,520,0,'FF',9,0,3,'Max:','','on',2,35),(1893,'81df8efb4c0a761e12309fcc5acdfacd',0,0,62,525,84,'FF',4,0,1,'Update:','','',2,36),(1894,'e73d15c7a7ccc7c7722bc256309935ab',0,0,62,525,0,'FF',9,0,4,'Current:','','',2,37),(1895,'fa39b547eb362bc5934b40013c9057b4',0,0,62,525,0,'FF',9,0,1,'Average:','','',2,38),(1896,'b26214e6f9218a6fe2005a6ac78182d5',0,0,62,525,0,'FF',9,0,2,'Min:','','',2,39),(1897,'b8c9f8618e6597e53770c14c183b096d',0,0,62,525,0,'FF',9,0,3,'Max:','','on',2,40),(1898,'f49a2218860075ca28dc437b7dc7fce5',0,0,62,526,75,'FF',4,0,1,'write:','','',2,41),(1899,'00bcfb0d878e83f5aeb72812f1b66422',0,0,62,526,0,'FF',9,0,4,'Current:','','',2,42),(1900,'825943d55546d8c146f20468ad388f19',0,0,62,526,0,'FF',9,0,1,'Average:','','',2,43),(1901,'006f93c093ccc4bb6119ffc47e5d2cea',0,0,62,526,0,'FF',9,0,2,'Min:','','',2,44),(1902,'7b923920cb0c7c9487b8a48387d5b907',0,0,62,526,0,'FF',9,0,3,'Max:','','on',2,45),(1903,'ad9e2e4c7f5a32fe8a385b994b310d98',0,0,63,527,25,'FF',7,0,1,'1 Minute Average','','',2,1),(1904,'f417820c000ac95578039df365501d38',0,0,63,527,0,'FF',9,0,4,'Current:','','on',4,2),(1905,'3302d163068b3ce68a9880652ad426cf',0,0,63,527,28,'FF',4,0,1,'','','',2,3),(1906,'3998107b3a3cc8ed1d3597734ca9cc00',0,0,63,528,33,'FF',7,0,1,'5 Minute Average','','',2,4),(1907,'430ada13f8524122515db6deb5171ae9',0,0,63,528,0,'FF',9,0,4,'Current:','','on',4,5),(1908,'823e37653ccb79e31dae58a35d83ccfb',0,0,63,529,43,'FF',7,0,1,'15 Minute Average','','',2,6),(1909,'52bcae539af439eaab1c189a6ab9c714',0,0,63,529,0,'FF',9,0,4,'Current:','','on',4,7),(1910,'3fb5e8a1cd378c138ca99e839febb11c',0,0,64,530,63,'FF',7,0,1,'Read','','',2,1),(1911,'5f90b6c1809545e87cf1f5cc0fec9396',0,0,64,530,72,'FF',4,0,1,'','','',2,2),(1912,'074e17995518feed1208b68d23c381d0',0,0,64,532,42,'FF',5,0,1,'Deleted','','',2,3),(1913,'6a5a4b64d61de2930ee1bbb68f959488',0,0,64,533,94,'FF',5,0,1,'Inserted','','',2,4),(1914,'13c1dc2cdeb179b91e7c2dc994cd4a71',0,0,64,531,8,'FF',4,0,1,'Updated','','',2,5),(1915,'323cd68b33a06ed8b7f5bc49b94e8796',0,0,65,538,29,'FF',7,0,1,'Database Pages','','',2,1),(1916,'04f24cb43183ec1ed7f83ac1bf4b1ed2',0,0,65,538,27,'FF',4,0,1,'','','',2,2),(1917,'f603bfe46b9024c389829fcbeca16871',0,0,65,534,6,'FF',4,0,1,'Free Pages','','',2,3),(1918,'42d34dd6432f4846a33cf0ae733672d4',0,0,65,536,67,'FF',4,0,1,'Modified Pages','','',2,4),(1919,'ee29462f4430cda426f4ead152fe2c1e',0,0,65,537,45,'FF',4,0,1,'Pool Size','','',2,5),(1920,'45234e43c4a1a288f0312b50fd578458',0,0,65,535,44,'FF',4,19,1,'Miss Rate','','',2,6),(1921,'fd146f173397a8090deb25de657e49d3',0,0,66,539,30,'FF',7,0,1,'OS Waits','','',2,1),(1922,'465b13cbf76e38c79fcd4918d83b025f',0,0,66,539,19,'FF',4,0,1,'','','',2,2),(1923,'3b36366a3c2c02c1c8ebf4faac387b1d',0,0,66,541,67,'FF',5,0,1,'Spin Rounds','','',2,3),(1924,'427c7716df2e4454d6eab3cb579487b1',0,0,66,540,17,'FF',4,0,1,'Spin Waits','','',2,4),(1925,'63561bef0880a61e7887acd0e8bac714',0,0,67,544,97,'FF',7,0,1,'Inserts','','',2,1),(1926,'303ffa8c0bd23067cc1ad5da6adac2fe',0,0,67,544,96,'FF',4,0,1,'','','',2,2),(1927,'3c290e1b864a29535319b8dd051d8c6a',0,0,67,542,10,'FF',4,0,1,'Merged','','',2,3),(1928,'491a23e985df4c57e95fa8491364c728',0,0,67,543,45,'FF',4,0,1,'Merges','','',2,4),(1929,'e6db5df0cbf713c247be302075de6427',0,0,68,548,55,'FF',7,0,1,'Reads','','',2,1),(1930,'44174b8a0709b69e00b5ad866fed382a',0,0,68,548,57,'FF',4,0,1,'','','',2,2),(1931,'f33b2e419ff420594a4d176d5808b4fc',0,0,68,545,17,'FF',5,0,1,'File Writes','','',2,3),(1932,'24d796004f462c68b72e38538528f319',0,0,68,546,42,'FF',5,0,1,'Log Writes','','',2,4),(1933,'5b1e04b789f42f7e433465320582a685',0,0,68,547,10,'FF',4,0,1,'Fsyncs','','',2,5),(1934,'14a86e035176296348017cefd6d8ced7',0,0,69,549,9,'FF',7,0,1,'System','','',2,1),(1935,'f4397ebaa95bee77bf17fbd1a0e8e5b1',0,0,69,549,0,'FF',9,0,4,'Current:','','',2,2),(1936,'1453c10d85947826816639396baeec77',0,0,69,549,0,'FF',9,0,1,'Average:','','',2,3),(1937,'2a366dea2af4b6eb394f3c7220fd9350',0,0,69,549,0,'FF',9,0,3,'Maximum:','','on',2,4),(1938,'49d1e2ea72d92609c45ae5b6711f83aa',0,0,69,550,21,'FF',8,0,1,'User','','',2,5),(1939,'ac01c9d620107a3d79ce27ed13d89ca9',0,0,69,550,0,'FF',9,0,4,'Current:','','',2,6),(1940,'7cf91ef49945e4cf39d99018501a8f15',0,0,69,550,0,'FF',9,0,1,'Average:','','',2,7),(1941,'a01d4cdebc918920cde0a57d59a35b51',0,0,69,550,0,'FF',9,0,3,'Maximum:','','on',2,8),(1942,'d8f2aa80bfa365eeeeab7c8365bb0bb0',0,0,69,0,1,'FF',4,12,1,'Total','','',2,13),(1943,'23483c41f9381ad721a1bde6001f3558',0,0,69,0,0,'FF',9,12,4,'Current:','','',2,14),(1944,'e8c56df6c66bd778057861d447c6cf4a',0,0,69,0,0,'FF',9,12,1,'Average:','','',2,15),(1945,'d6010fda98ac33f50c099a3a7241bbbe',0,0,69,0,0,'FF',9,12,3,'Maximum:','','',2,16),(1946,'28c448ae4710a929c2f74a53f663d7bc',0,0,70,554,63,'FF',7,0,1,'Cmd_Get','','',2,1),(1947,'cb7065919c53f291de00cf16abd6020f',0,0,70,554,10,'FF',4,0,1,'','','',2,2),(1948,'76f8caafa5c9b8f8b09367dd77e84750',0,0,70,553,58,'FF',4,0,1,'Cmd_Set','','',2,3),(1949,'507b7f83ce92086bb1372d076c601693',0,0,70,0,42,'FF',4,0,1,'Get_Misses','','',2,4),(1950,'698581918255e9c9ea54e0cd09f9f6f2',0,0,70,0,96,'FF',4,0,1,'Get_Hits','','',2,5),(1951,'de8de91a15d57d0aee4225dc9ba804b6',0,0,70,558,15,'FF',4,0,1,'Curr Connections','','',2,6),(1952,'06d9c1c1df0e9aece1767a66b83da700',0,0,71,560,4,'FF',7,0,1,'Bytes Read','','',2,1),(1953,'0ed29b255fbb28ec5b10ce4f044ac6a3',0,0,71,560,104,'FF',4,0,1,'','','',2,2),(1954,'e430c85d5f6b40830e89ccee6cf7105e',0,0,71,561,10,'FF',4,0,1,'Bytes Written','','',2,4),(1955,'d1e5146032e92207c8b36d918c2f9af5',0,0,71,563,9,'FF',5,0,1,'ConnectionStructures','','',2,5),(2692,'',1782,232,54,879,38,'FF',7,18,1,'Free Kilobytes','','',2,1),(2691,'',1902,231,62,877,0,'FF',9,0,3,'Max:','','on',2,45),(2690,'',1901,231,62,877,0,'FF',9,0,2,'Min:','','',2,44),(2689,'',1900,231,62,877,0,'FF',9,0,1,'Average:','','',2,43),(2688,'',1899,231,62,877,0,'FF',9,0,4,'Current:','','',2,42),(2687,'',1898,231,62,877,75,'FF',4,0,1,'write:','','',2,41),(2686,'',1897,231,62,876,0,'FF',9,0,3,'Max:','','on',2,40),(2685,'',1896,231,62,876,0,'FF',9,0,2,'Min:','','',2,39),(2684,'',1895,231,62,876,0,'FF',9,0,1,'Average:','','',2,38),(2683,'',1894,231,62,876,0,'FF',9,0,4,'Current:','','',2,37),(2682,'',1893,231,62,876,84,'FF',4,0,1,'Update:','','',2,36),(2681,'',1892,231,62,871,0,'FF',9,0,3,'Max:','','on',2,35),(2680,'',1891,231,62,871,0,'FF',9,0,2,'Min:','','',2,34),(2679,'',1890,231,62,871,0,'FF',9,0,1,'Average:','','',2,33),(2678,'',1889,231,62,871,0,'FF',9,0,4,'Current:','','',2,32),(2677,'',1888,231,62,871,103,'FF',4,0,1,'Delete','','',2,31),(2676,'',1887,231,62,874,0,'FF',9,0,3,'Max:','','on',2,30),(2675,'',1886,231,62,874,0,'FF',9,0,2,'Min:','','',2,29),(2674,'',1885,231,62,874,0,'FF',9,0,1,'Average:','','',2,28),(2673,'',1884,231,62,874,0,'FF',9,0,4,'Current:','','',2,27),(2672,'',1883,231,62,874,10,'FF',4,0,1,'Read Rnd','','',2,26),(2671,'',1882,231,62,873,0,'FF',9,0,3,'Max:','','on',2,25),(2670,'',1881,231,62,873,0,'FF',9,0,2,'Min:','','',2,24),(2669,'',1880,231,62,873,0,'FF',9,0,1,'Average:','','',2,23),(2668,'',1879,231,62,873,0,'FF',9,0,4,'Current:','','',2,22),(2667,'',1878,231,62,873,95,'FF',4,0,1,'Read Prev','','',2,21),(2666,'',1877,231,62,870,0,'FF',9,0,3,'Max:','','on',2,20),(2665,'',1876,231,62,870,0,'FF',9,0,2,'Min:','','',2,19),(2664,'',1875,231,62,870,0,'FF',9,0,1,'Average:','','',2,18),(2663,'',1874,231,62,870,0,'FF',9,0,4,'Current:','','',2,17),(2662,'',1873,231,62,870,64,'FF',4,0,1,'Read Next','','',2,16),(2661,'',1872,231,62,869,0,'FF',9,0,3,'Max:','','on',2,15),(2660,'',1871,231,62,869,0,'FF',9,0,2,'Min:','','',2,14),(2659,'',1870,231,62,869,0,'FF',9,0,1,'Average:','','',2,13),(2658,'',1869,231,62,869,0,'FF',9,0,4,'Current:','','',2,12),(2657,'',1868,231,62,869,59,'FF',4,0,1,'Read Key','','',2,11),(2656,'',1867,231,62,872,0,'FF',9,0,3,'Max:','','on',2,10),(2655,'',1866,231,62,872,0,'FF',9,0,2,'Min:','','',2,9),(2654,'',1865,231,62,872,0,'FF',9,0,1,'Average:','','',2,8),(2653,'',1864,231,62,872,0,'FF',9,0,4,'Current:','','',2,7),(2652,'',1863,231,62,872,41,'FF',4,0,1,'Read First','','',2,6),(2651,'',1862,231,62,875,0,'FF',9,0,3,'Max:','','on',2,5),(2650,'',1861,231,62,875,0,'FF',9,0,2,'Min:','','',2,4),(2649,'',1860,231,62,875,0,'FF',9,0,1,'Average:','','',2,3),(2648,'',1859,231,62,875,0,'FF',9,0,4,'Current:','','',2,2),(2647,'',1858,231,62,875,29,'FF',7,0,1,'Read Rnd Next','','',2,1),(2646,'',1857,230,61,864,89,'FF',4,0,1,'','','',2,26),(2645,'',1856,230,61,866,0,'FF',9,0,3,'Max:','','on',2,25),(2644,'',1855,230,61,866,0,'FF',9,0,2,'Min:','','',2,24),(2643,'',1854,230,61,866,0,'FF',9,0,1,'Average:','','',2,23),(2642,'',1853,230,61,866,0,'FF',9,0,4,'Current:','','',2,22),(2641,'',1852,230,61,866,10,'FF',4,0,1,'Update','','',2,21),(2640,'',1851,230,61,865,0,'FF',9,0,3,'Max:','','on',2,20),(2639,'',1850,230,61,865,0,'FF',9,0,2,'Min:','','',2,19),(2638,'',1849,230,61,865,0,'FF',9,0,1,'Average:','','',2,18),(2637,'',1848,230,61,865,0,'FF',9,0,4,'Current:','','',2,17),(2636,'',1847,230,61,865,33,'FF',4,0,1,'Insert','','',2,16),(2635,'',1846,230,61,868,0,'FF',9,0,3,'Max:','','on',2,15),(2634,'',1845,230,61,868,0,'FF',9,0,2,'Min:','','',2,14),(2633,'',1844,230,61,868,0,'FF',9,0,1,'Average:','','',2,13),(2632,'',1843,230,61,868,0,'FF',9,0,4,'Current:','','',2,12),(2631,'',1842,230,61,868,9,'FF',4,0,1,'Delete','','',2,11),(2630,'',1841,230,61,867,0,'FF',9,0,3,'Max:','','on',2,10),(2629,'',1840,230,61,867,0,'FF',9,0,2,'Min:','','',2,9),(2628,'',1839,230,61,867,0,'FF',9,0,1,'Average:','','',2,8),(2627,'',1838,230,61,867,0,'FF',9,0,4,'Current:','','',2,7),(2626,'',1837,230,61,867,1,'FF',4,0,1,'Change_DB','','',2,6),(2625,'',1836,230,61,864,0,'FF',9,0,3,'Max:','','on',2,5),(2624,'',1835,230,61,864,0,'FF',9,0,2,'Min:','','',2,4),(2623,'',1834,230,61,864,0,'FF',9,0,1,'Average:','','',2,3),(2622,'',1833,230,61,864,0,'FF',9,0,4,'Current:','','',2,2),(2621,'',1832,230,61,864,95,'FF',7,0,1,'Select','','',2,1),(2620,'',1795,229,55,862,17,'FF',5,0,1,'Connections','','',2,6),(2619,'',1794,229,55,859,10,'FF',4,0,1,'Queries','','',2,5),(2618,'',1793,229,55,863,95,'FF',5,0,1,'Max Conn','','',2,4),(2617,'',1792,229,55,860,8,'FF',5,18,1,'KB Recvd','','',2,3),(2616,'',1791,229,55,861,59,'FF',4,18,1,'','','',2,2),(2615,'',1790,229,55,861,55,'FF',7,18,1,'KB Sent','','',2,1),(2614,'',1805,228,57,856,8,'FF',5,0,1,'Table Locks Waited','','',2,5),(2613,'',1804,228,57,858,94,'FF',5,0,1,'Slow Queries','','',2,4),(2612,'',1803,228,57,857,42,'FF',5,0,1,'Slow Launch Threads','','',2,3),(2611,'',1802,228,57,855,72,'FF',4,0,1,'','','',2,2),(2610,'',1801,228,57,855,63,'FF',7,0,1,'Table Locks Immed','','',2,1),(2609,'',1909,227,63,853,0,'FF',9,0,4,'Current:','','on',4,7),(2608,'',1908,227,63,853,43,'FF',7,0,1,'15 Minute Average','','',2,6),(2607,'',1907,227,63,854,0,'FF',9,0,4,'Current:','','on',4,5),(2606,'',1906,227,63,854,33,'FF',7,0,1,'5 Minute Average','','',2,4),(2605,'',1905,227,63,852,28,'FF',4,0,1,'','','',2,3),(2604,'',1904,227,63,852,0,'FF',9,0,4,'Current:','','on',4,2),(2603,'',1903,227,63,852,25,'FF',7,0,1,'1 Minute Average','','',2,1),(2602,'',1914,226,64,849,8,'FF',4,0,1,'Updated','','',2,5),(2601,'',1913,226,64,851,94,'FF',5,0,1,'Inserted','','',2,4),(2600,'',1912,226,64,850,42,'FF',5,0,1,'Deleted','','',2,3),(2599,'',1911,226,64,848,72,'FF',4,0,1,'','','',2,2),(2598,'',1910,226,64,848,63,'FF',7,0,1,'Read','','',2,1),(2597,'',1924,225,66,846,17,'FF',4,0,1,'Spin Waits','','',2,4),(2596,'',1923,225,66,847,67,'FF',5,0,1,'Spin Rounds','','',2,3),(2595,'',1922,225,66,845,19,'FF',4,0,1,'','','',2,2),(2594,'',1921,225,66,845,30,'FF',7,0,1,'OS Waits','','',2,1),(2593,'',1928,224,67,843,45,'FF',4,0,1,'Merges','','',2,4),(2592,'',1927,224,67,842,10,'FF',4,0,1,'Merged','','',2,3),(2591,'',1926,224,67,844,96,'FF',4,0,1,'','','',2,2),(2590,'',1925,224,67,844,97,'FF',7,0,1,'Inserts','','',2,1),(2589,'',1933,223,68,840,10,'FF',4,0,1,'Fsyncs','','',2,5),(2588,'',1932,223,68,839,42,'FF',5,0,1,'Log Writes','','',2,4),(2587,'',1931,223,68,838,17,'FF',5,0,1,'File Writes','','',2,3),(2586,'',1930,223,68,841,57,'FF',4,0,1,'','','',2,2),(2585,'',1929,223,68,841,55,'FF',7,0,1,'Reads','','',2,1),(2584,'',1920,222,65,834,44,'FF',4,19,1,'Miss Rate','','',2,6),(2583,'',1919,222,65,836,45,'FF',4,0,1,'Pool Size','','',2,5),(2582,'',1918,222,65,835,67,'FF',4,0,1,'Modified Pages','','',2,4),(2581,'',1917,222,65,833,6,'FF',4,0,1,'Free Pages','','',2,3),(2580,'',1916,222,65,837,27,'FF',4,0,1,'','','',2,2),(2579,'',1915,222,65,837,29,'FF',7,0,1,'Database Pages','','',2,1),(2578,'',1781,221,53,832,45,'FF',4,0,1,'Key Writes','','',2,5),(2577,'',1780,221,53,830,67,'FF',4,0,1,'Key Reads','','',2,4),(2576,'',1779,221,53,831,48,'FF',4,0,1,'Key Write Req','','',2,3),(2575,'',1778,221,53,829,1,'FF',4,0,1,'','','',2,2),(2574,'',1777,221,53,829,29,'FF',7,0,1,'Key Read Req','','',2,1),(2573,'',1831,220,60,0,0,'FF',9,12,3,'Maximum:','','',2,16),(2572,'',1830,220,60,0,0,'FF',9,12,1,'Average:','','',2,15),(2571,'',1829,220,60,0,0,'FF',9,12,4,'Current:','','',2,14),(2570,'',1828,220,60,0,1,'FF',4,12,1,'Total','','',2,13),(2569,'',1827,220,60,826,0,'FF',9,0,3,'Maximum:','','on',2,12),(2568,'',1826,220,60,826,0,'FF',9,0,1,'Average:','','',2,11),(2567,'',1825,220,60,826,0,'FF',9,0,4,'Current:','','',2,10),(2566,'',1824,220,60,826,12,'FF',8,0,1,'Nice','','',2,9),(2565,'',1823,220,60,828,0,'FF',9,0,3,'Maximum:','','on',2,8),(2564,'',1822,220,60,828,0,'FF',9,0,1,'Average:','','',2,7),(2563,'',1821,220,60,828,0,'FF',9,0,4,'Current:','','',2,6),(2562,'',1820,220,60,828,21,'FF',8,0,1,'User','','',2,5),(2561,'',1819,220,60,827,0,'FF',9,0,3,'Maximum:','','on',2,4),(2560,'',1818,220,60,827,0,'FF',9,0,1,'Average:','','',2,3),(2559,'',1817,220,60,827,0,'FF',9,0,4,'Current:','','',2,2),(2558,'',1816,220,60,827,9,'FF',7,0,1,'System','','',2,1),(2557,'',16,219,2,825,0,'FF',9,2,3,'Maximum:','','',2,8),(2556,'',15,219,2,825,0,'FF',9,2,1,'Average:','','',2,7),(2555,'',14,219,2,825,0,'FF',9,2,4,'Current:','','',2,6),(2554,'',13,219,2,825,20,'FF',4,2,1,'Outbound','','',2,5),(2553,'',12,219,2,824,0,'FF',9,2,3,'Maximum:','','on',2,4),(2552,'',11,219,2,824,0,'FF',9,2,1,'Average:','','',2,3),(2551,'',10,219,2,824,0,'FF',9,2,4,'Current:','','',2,2),(2550,'',9,219,2,824,22,'FF',7,2,1,'Inbound','','',2,1),(2549,'',16,218,2,823,0,'FF',9,2,3,'Maximum:','','',2,8),(2548,'',15,218,2,823,0,'FF',9,2,1,'Average:','','',2,7),(2547,'',14,218,2,823,0,'FF',9,2,4,'Current:','','',2,6),(2546,'',13,218,2,823,20,'FF',4,2,1,'Outbound','','',2,5),(2545,'',12,218,2,822,0,'FF',9,2,3,'Maximum:','','on',2,4),(2544,'',11,218,2,822,0,'FF',9,2,1,'Average:','','',2,3),(2543,'',10,218,2,822,0,'FF',9,2,4,'Current:','','',2,2),(2542,'',9,218,2,822,22,'FF',7,2,1,'Inbound','','',2,1),(3424,'',64,319,7,1135,0,'FF',9,0,3,'Maximum:','','',2,4),(3425,'',61,320,7,1136,25,'FF',7,0,1,'','','',2,1),(3426,'',62,320,7,1136,0,'FF',9,0,4,'Current:','','',2,2),(3427,'',63,320,7,1136,0,'FF',9,0,1,'Average:','','',2,3),(3428,'',64,320,7,1136,0,'FF',9,0,3,'Maximum:','','',2,4),(3429,'',29,321,4,1138,9,'FF',7,0,1,'System','','',2,1),(3430,'',30,321,4,1138,0,'FF',9,0,4,'Current:','','',2,2),(3431,'',31,321,4,1138,0,'FF',9,0,1,'Average:','','',2,3),(3432,'',32,321,4,1138,0,'FF',9,0,3,'Maximum:','','on',2,4),(3433,'',33,321,4,1139,21,'FF',8,0,1,'User','','',2,5),(3434,'',34,321,4,1139,0,'FF',9,0,4,'Current:','','',2,6),(3435,'',35,321,4,1139,0,'FF',9,0,1,'Average:','','',2,7),(3436,'',36,321,4,1139,0,'FF',9,0,3,'Maximum:','','on',2,8),(3437,'',37,321,4,1137,12,'FF',8,0,1,'Nice','','',2,9),(3438,'',38,321,4,1137,0,'FF',9,0,4,'Current:','','',2,10),(3439,'',39,321,4,1137,0,'FF',9,0,1,'Average:','','',2,11),(3440,'',40,321,4,1137,0,'FF',9,0,3,'Maximum:','','on',2,12),(3441,'',41,321,4,0,1,'FF',4,12,1,'Total','','',2,13),(3442,'',42,321,4,0,0,'FF',9,12,4,'Current:','','',2,14),(3443,'',43,321,4,0,0,'FF',9,12,1,'Average:','','',2,15),(3444,'',44,321,4,0,0,'FF',9,12,3,'Maximum:','','',2,16),(3445,'',65,322,8,1140,48,'FF',7,0,1,'Running Processes','','',2,1),(3446,'',66,322,8,1140,0,'FF',9,0,4,'Current:','','',3,2),(3447,'',67,322,8,1140,0,'FF',9,0,1,'Average:','','',3,3),(3448,'',68,322,8,1140,0,'FF',9,0,3,'Maximum:','','',3,4),(3449,'',95,323,12,1141,41,'FF',7,14,1,'Free','','',2,9),(3450,'',96,323,12,1141,0,'FF',9,14,4,'Current:','','',2,10),(3451,'',97,323,12,1141,0,'FF',9,14,1,'Average:','','',2,11),(3452,'',98,323,12,1141,0,'FF',9,14,3,'Maximum:','','on',2,12),(3453,'',99,323,12,1142,30,'FF',8,14,1,'Swap','','',2,13),(3454,'',100,323,12,1142,0,'FF',9,14,4,'Current:','','',2,14),(3455,'',101,323,12,1142,0,'FF',9,14,1,'Average:','','',2,15),(3456,'',102,323,12,1142,0,'FF',9,14,3,'Maximum:','','',2,16),(3457,'',17,324,3,1144,48,'FF',7,14,1,'Used','','',2,1),(3458,'',18,324,3,1144,0,'FF',9,14,4,'Current:','','',2,2),(3459,'',19,324,3,1144,0,'FF',9,14,1,'Average:','','',2,3),(3460,'',20,324,3,1144,0,'FF',9,14,3,'Maximum:','','on',2,4),(3461,'',21,324,3,1143,20,'FF',8,14,1,'Available','','',2,5),(3462,'',22,324,3,1143,0,'FF',9,14,4,'Current:','','',2,6),(3463,'',23,324,3,1143,0,'FF',9,14,1,'Average:','','',2,7),(3464,'',24,324,3,1143,0,'FF',9,14,3,'Maximum:','','on',2,8),(3465,'',25,324,3,0,1,'FF',5,15,1,'Total','','',2,9),(3466,'',26,324,3,0,0,'FF',9,15,4,'Current:','','',2,10),(3467,'',27,324,3,0,0,'FF',9,15,1,'Average:','','',2,11),(3468,'',28,324,3,0,0,'FF',9,15,3,'Maximum:','','',2,12),(3469,'',80,325,11,1145,15,'FF',7,0,1,'1 Minute Average','','',2,1),(3470,'',81,325,11,1145,0,'FF',9,0,4,'Current:','','on',4,2),(3471,'',82,325,11,1147,8,'FF',8,0,1,'5 Minute Average','','',2,3),(3472,'',83,325,11,1147,0,'FF',9,0,4,'Current:','','on',4,4),(3473,'',84,325,11,1146,9,'FF',8,0,1,'15 Minute Average','','',2,5),(3474,'',85,325,11,1146,0,'FF',9,0,4,'Current:','','on',4,6),(3475,'',86,325,11,0,1,'FF',4,12,1,'Total','','',2,7),(3476,'',103,326,13,1150,52,'FF',7,14,1,'Memory Free','','',2,1),(3477,'',104,326,13,1150,0,'FF',9,14,4,'Current:','','',2,2),(3478,'',105,326,13,1150,0,'FF',9,14,1,'Average:','','',2,3),(3479,'',106,326,13,1150,0,'FF',9,14,3,'Maximum:','','on',2,4),(3480,'',107,326,13,1148,35,'FF',8,14,1,'Memory Buffers','','',2,5),(3481,'',108,326,13,1148,0,'FF',9,14,4,'Current:','','',2,6),(3482,'',109,326,13,1148,0,'FF',9,14,1,'Average:','','',2,7),(3483,'',110,326,13,1148,0,'FF',9,14,3,'Maximum:','','on',2,8),(3484,'',403,326,13,1149,30,'FF',8,14,1,'Cache Memory','','',2,9),(3485,'',404,326,13,1149,0,'FF',9,14,4,'Current:','','',2,10),(3486,'',405,326,13,1149,0,'FF',9,14,1,'Average:','','',2,11),(3487,'',406,326,13,1149,0,'FF',9,14,3,'Maximum:','','on',2,12),(3488,'',167,327,21,1152,48,'FF',7,14,1,'Used','','',2,1),(3489,'',169,327,21,1152,0,'FF',9,14,4,'Current:','','',2,2),(3490,'',170,327,21,1152,0,'FF',9,14,1,'Average:','','',2,3),(3491,'',171,327,21,1152,0,'FF',9,14,3,'Maximum:','','on',2,4),(3492,'',172,327,21,1151,20,'FF',8,14,1,'Available','','',2,5),(3493,'',173,327,21,1151,0,'FF',9,14,4,'Current:','','',2,6),(3494,'',174,327,21,1151,0,'FF',9,14,1,'Average:','','',2,7),(3495,'',175,327,21,1151,0,'FF',9,14,3,'Maximum:','','on',2,8),(3496,'',176,327,21,0,1,'FF',5,15,1,'Total','','',2,9),(3497,'',177,327,21,0,0,'FF',9,15,4,'Current:','','',2,10),(3498,'',178,327,21,0,0,'FF',9,15,1,'Average:','','',2,11),(3499,'',179,327,21,0,0,'FF',9,15,3,'Maximum:','','on',2,12),(3500,'',69,328,9,1153,15,'FF',7,0,1,'1 Minute Average','','',2,1),(3501,'',70,328,9,1153,0,'FF',9,0,4,'Current:','','on',4,2),(3502,'',71,328,9,1154,8,'FF',8,0,1,'5 Minute Average','','',2,3),(3503,'',72,328,9,1154,0,'FF',9,0,4,'Current:','','on',4,4),(3504,'',73,328,9,1155,9,'FF',8,0,1,'15 Minute Average','','',2,5),(3505,'',74,328,9,1155,0,'FF',9,0,4,'Current:','','on',4,6),(3506,'',75,328,9,0,1,'FF',4,12,1,'','','',2,7),(3507,'',76,329,10,1156,67,'FF',7,0,1,'Users','','',2,1),(3508,'',77,329,10,1156,0,'FF',9,0,4,'Current:','','',3,2),(3509,'',78,329,10,1156,0,'FF',9,0,1,'Average:','','',3,3),(3510,'',79,329,10,1156,0,'FF',9,0,3,'Maximum:','','',3,4),(3511,'',61,330,7,1157,25,'FF',7,0,1,'','','',2,1),(3512,'',62,330,7,1157,0,'FF',9,0,4,'Current:','','',2,2),(3513,'',63,330,7,1157,0,'FF',9,0,1,'Average:','','',2,3),(3514,'',64,330,7,1157,0,'FF',9,0,3,'Maximum:','','',2,4),(3515,'a15985ab57528552710eb66ab1ed0c06',0,0,76,0,0,'FF',1,21,1,'','','',2,5),(3516,'4d85aef1300a2a3287bfa71900f3e530',0,0,76,0,0,'FF',1,22,1,'','','',2,6),(3517,'0ef2adf2300ac58ff52a15a3876e5db4',0,0,76,0,66,'FF',7,20,1,'Bytes / Request','','',2,7),(3518,'e1e542bf122c238d45aadf1f0831d5eb',0,0,76,0,0,'FF',9,20,4,'Current:','','',2,8),(3519,'0497651861d2df5c1c47072284335811',0,0,76,0,0,'FF',9,20,1,'Average:','','',2,9),(3520,'5edcc477e6b6bb5a2dab83208b779b24',0,0,76,0,0,'FF',9,20,3,'Maximum:','','on',2,10),(3521,'8ddd8b03d837c5e1b44abab01fcccd15',0,0,76,1160,9,'FF',5,23,1,'kBytes','0','',2,11),(3522,'f5a55f5b436bd5679ec2365486ae5e42',0,0,76,1160,0,'FF',9,0,4,'Current:','','',2,12),(3523,'bbc39bffe31e8a0223283f02f52bc551',0,0,76,1160,0,'FF',9,0,1,'Average:','','',2,13),(3524,'236a654b7569e2a744eb644d67470cd8',0,0,76,1160,0,'FF',9,0,3,'Maximum:','','on',2,14),(3525,'858426229b9fef5fe30161f5f8760b2f',0,0,76,1159,12,'FF',5,23,1,'Hits','0','',2,15),(3526,'d799dcff1bc129c1b0a6d786a47d55c2',0,0,76,1159,0,'FF',9,0,4,'Current:','','',2,16),(3527,'3aba59376769f71466b9624e82fa2ef0',0,0,76,1159,0,'FF',9,0,1,'Average:','','',2,17),(3528,'36b62af7f4c0012550877f42a2233dda',0,0,76,1159,0,'FF',9,0,3,'Maximum:','','on',2,18),(3529,'f592de5a0e83301a3ffd16ac7389b742',0,0,76,0,0,'FF',1,0,1,'                            Represents the number of bytes per hit','','on',2,19),(3530,'993d1ed5b091c2c2f2d68a7b5525c6f2',0,0,76,0,0,'FF',1,0,1,'                             based on ApacheStats v0.4 - Rolf Poser','','on',2,20),(3531,'53334497528c4efae440c35c89f37352',0,0,77,1159,101,'FF',7,0,1,'Hits/sec','','',2,1),(3532,'d13fb211f0d1f7c7830bd37a1e6bf1e3',0,0,77,1159,0,'FF',9,0,4,'Current:','','',2,2),(3533,'dcff6e817c4f73628a88f33a3a2bda15',0,0,77,1159,0,'FF',9,0,1,'Average:','','',2,3),(3534,'11e520133a65cd1fa499b9648cfa2669',0,0,77,1159,0,'FF',9,0,3,'Maximum:','','on',2,4),(3535,'e1f16a8d277668b4582d2d0ea984d945',0,0,77,1159,1,'FF',4,0,3,'Max','','on',2,5),(3536,'c4a58b212638cf79eeb6c0aa92eef18f',0,0,77,0,0,'FF',1,0,1,'                            Represents the number of hits per second','','on',2,6),(3537,'2597c286c436dcc366809902289d8797',0,0,77,0,0,'FF',1,0,1,'                                 ApacheStats v0.4 - Rolf Poser','','on',2,7),(3538,'9d64852bdba519836cfc02895551624b',0,0,78,1160,93,'FF',7,2,1,'kBits/sec','','',2,1),(3539,'8a8e30837a576580a0a3c96fb27ca4ac',0,0,78,1160,0,'FF',9,2,4,'Current:','','',2,2),(3540,'a27a47a83960e22b270f815a7fabb15c',0,0,78,1160,0,'FF',9,2,1,'Average:','','',2,3),(3541,'ee22a15a92db89ac46d80201c558264c',0,0,78,1160,0,'FF',9,2,3,'Maximum:','','on',2,4),(3542,'64cca684c79e122ce3a05665c04c27b7',0,0,78,0,0,'FF',1,0,1,'                         Represents the number of kBytes out per second','','on',2,5),(3543,'701905062a950ae63959ec08e56756cb',0,0,78,0,0,'FF',1,0,1,'                    (content only - EXCLUDES protocol overheads and headers)','','on',2,6),(3544,'38ee8000bc0a725cfb3a97a56f39865b',0,0,78,0,0,'FF',1,0,1,'                                 ApacheStats v0.4 - Rolf Poser','','on',2,7),(3545,'22a35c30ab53c1ab4bcb015e9bef1e66',0,0,79,1158,9,'FF',7,0,1,'Busy','','',3,1),(3546,'829aad391223f1a360d121f04d5d0ea3',0,0,79,1158,0,'FF',9,0,4,'Current:','','',3,2),(3547,'ee9f461c631a83decb8908428da27755',0,0,79,1158,0,'FF',9,0,1,'Average:','','',3,3),(3548,'b50389cb24231d1f459371240ac77332',0,0,79,1158,0,'FF',9,0,3,'Maximum:','','on',3,4),(3549,'943a11fe10b24a1024a61d4aad10b734',0,0,79,1161,10,'FF',8,0,1,'Idle','','',3,5),(3550,'b784e8b0c93dc799a8e26e2bcf35e16e',0,0,79,1161,0,'FF',9,0,4,'Current:','','',3,6),(3551,'1cc7b45242acab468b1b687a2a7cf17f',0,0,79,1161,0,'FF',9,0,1,'Average:','','',3,7),(3552,'17652097c054ff8f9990c88235d38382',0,0,79,1161,0,'FF',9,0,3,'Maximum:','','on',3,8),(3553,'7dcf70e1275cdda4dbb7f7a2caf760aa',0,0,79,0,1,'FF',4,12,1,'Total','','',3,9),(3554,'6fe5171619600812169bfa5ae951b511',0,0,79,0,0,'FF',9,12,4,'Current:','','',3,10),(3555,'f5a6e196761c217cbe40d96132a47adc',0,0,79,0,0,'FF',9,12,1,'Average:','','',3,11),(3556,'26e1f4551972c756b0b25e1fe15aabc2',0,0,79,0,0,'FF',9,12,3,'Maximum:','','on',3,12),(3557,'8dee1aa6958164696f0b65f34df150be',0,0,79,0,0,'FF',1,0,1,'                        Represents the number of busy and idle threads','','on',2,13),(3558,'b3eff78458cbb790708f599f98bd60d9',0,0,79,0,0,'FF',1,0,1,'                                 ApacheStats v0.4 - Rolf Poser','','on',2,14),(3559,'794cbd2f63e458e5593faaa98567ae50',0,0,80,0,0,'FF',1,21,1,'','','',2,1),(3560,'cc38fbc7a6f05800737016e9d23ee09a',0,0,80,0,0,'FF',1,22,1,'','','',2,2),(3561,'2f937933232b2d8c27eb59d2724b8c5f',0,0,80,0,0,'FF',1,24,1,'','','',2,3),(3562,'cd909a739ccd0a3a315c7e59597869de',0,0,80,1158,9,'FF',7,25,1,'Busy','','',3,4),(3563,'6f80e6b53fb10a39e73ba0ef09c65c51',0,0,80,1158,0,'FF',9,25,4,'        Current:','','',3,5),(3564,'1fa60ffe965b2006d0116df5decd31c6',0,0,80,1158,0,'FF',9,25,1,'Average:','','',3,6),(3565,'87dce4007d29360f7a7bd5baeccf2764',0,0,80,1158,0,'FF',9,25,3,'Maximum:','','on',3,7),(3566,'b97b4d1ab0ea884b1c72304f00f171a7',0,0,80,1161,10,'FF',8,26,1,'Idle','','',3,8),(3567,'0a6d077d0d18554790c92ea3dfa66c56',0,0,80,1161,0,'FF',9,26,4,'        Current:','','',3,9),(3568,'09507e64b60c81dfcd7649ade2adb5d3',0,0,80,1161,0,'FF',9,26,1,'Average:','','',3,11),(3569,'5e5bae2e20e22608fd4d86c065ed675e',0,0,80,1161,0,'FF',9,26,3,'Maximum:','','on',3,12),(3570,'c195de37e40392f8d015449e7e7d954a',0,0,80,0,0,'FF',9,24,4,'Total Number of threads :','','',3,13),(3571,'87a2c0ac83827072e36d418d0df956d8',0,0,80,0,0,'FF',9,24,1,'Average:','','',3,14),(3572,'5951304ecbd13259f8f420842acac2b4',0,0,80,0,0,'FF',9,24,3,'Maximum:','','on',3,15),(3573,'60df4316a9f1e77200fca1e497845934',0,0,80,1158,0,'FF',1,23,1,'','0','',2,16),(3574,'94814beef53939ddfc9593cafe7a4822',0,0,80,1161,0,'FF',1,23,1,'','0','on',2,17),(3575,'add90e95a8d76e49fb31b8473ecb1107',0,0,80,0,0,'FF',1,0,1,'           Represents the number of busy threads as a % of total number of threads','','on',2,18),(3576,'e8fd39badd849195250dfc8694b7abcb',0,0,80,0,0,'FF',1,0,1,'                             based on ApacheStats v0.4 - Rolf Poser','','on',2,19),(3577,'4420673d30e33268f3eb0af6640a614a',0,0,81,1173,106,'FF',7,0,1,'Apache CPU Load','','',2,1),(3578,'c17db1d3bf18cb0c96d4915e010d1429',0,0,81,1173,0,'FF',9,0,4,'Current:','','',2,2),(3579,'7091eb227e780c1bc980066550ef064e',0,0,81,1173,0,'FF',9,0,1,'Average:','','',2,3),(3580,'c622340e964a8f2acd4fdfa1a298ca23',0,0,81,1173,0,'FF',9,0,3,'Maximum:','','',2,4),(3581,'4d2d56d50021d93e76ceee3c53cb685b',0,0,81,1173,9,'FF',4,0,3,'MAX','','',2,5),(3582,'da89c359f5971f3e851eda80e7f35c0d',0,0,81,1173,1,'FF',4,27,1,'30min moving average','','on',2,6),(3583,'533cfb88c60db8606aeee6127478622c',0,0,82,1172,10,'FF',7,0,1,'Waiting','','',2,1),(3584,'79aa9c10292e9e9e66789ee63304c6b3',0,0,82,1172,0,'FF',9,0,4,'Current:','','',2,2),(3585,'8f6989379606779bc7235652ad51a539',0,0,82,1172,0,'FF',9,0,1,'Average:','','',2,3),(3586,'0fb246251fff38abbcf6fe0e44869edc',0,0,82,1172,0,'FF',9,0,3,'Maximum:','','on',2,4),(3587,'e4ec04ed04a8bd7f3384cbcb22d37b30',0,0,82,1165,9,'FF',8,0,1,'Keepalive','','',2,5),(3588,'c5b41947fda63e054f8f7c051861174a',0,0,82,1165,0,'FF',9,0,4,'Current:','','',2,6),(3589,'a645fb84c206cb85155c92c595ddc06a',0,0,82,1165,0,'FF',9,0,1,'Average:','','',2,7),(3590,'601bfb88d84558eb1e63a3922323069a',0,0,82,1165,0,'FF',9,0,3,'Maximum:','','on',2,8),(3591,'b4276ab70bdf4bd75074cc88008422d2',0,0,82,1171,57,'FF',8,0,1,'Reading Request','','',2,9),(3592,'243ab1bd3530820d31603f869d3e5bc1',0,0,82,1171,0,'FF',9,0,4,'Current:','','',2,10),(3593,'e67568d57b20c5a9af22ee4b6b7a246f',0,0,82,1171,0,'FF',9,0,1,'Average:','','',2,11),(3594,'a1c2b1c23374aebb80a9e14662346e3f',0,0,82,1171,0,'FF',9,0,3,'Maximum:','','on',2,12),(3595,'14fca14e5916d8f83a79369bbb458811',0,0,82,1169,12,'FF',8,0,1,'Sending Reply','','',2,13),(3596,'e9451992cf2b284eec9bc029332a3459',0,0,82,1169,0,'FF',9,0,4,'Current:','','',2,14),(3597,'cd83d7a8cdc364178ee4b90b8da029e6',0,0,82,1169,0,'FF',9,0,1,'Average:','','',2,15),(3598,'0dcbdd25450e76dbc5a62ebfd15dace7',0,0,82,1169,0,'FF',9,0,3,'Maximum:','','on',2,16),(3599,'7d08585008f386137d1b8213e0c53284',0,0,82,1170,17,'FF',8,0,1,'Starting Up','','',2,17),(3600,'21855fefa0ce4e78fa8d46f09301bcfc',0,0,82,1170,0,'FF',9,0,4,'Current:','','',2,18),(3601,'504bbf2de41ddc424b343c259f8823bb',0,0,82,1170,0,'FF',9,0,1,'Average:','','',2,19),(3602,'a80d4fa8a77a7d131db06c8b228b2782',0,0,82,1170,0,'FF',9,0,3,'Maximum:','','on',2,20),(3603,'bb210b5ee2853f788eeae1a931cf5e8d',0,0,82,1164,7,'FF',8,0,1,'DNS Lookup','','',2,21),(3604,'dc7b64e3256d99e2b559ce4f9b20beda',0,0,82,1164,0,'FF',9,0,4,'Current:','','',2,22),(3605,'6e98e3970c24a0187cb6b15fe07e3938',0,0,82,1164,0,'FF',9,0,1,'Average:','','',2,23),(3606,'849a3e0190b2eca4fe2a30812973257b',0,0,82,1164,0,'FF',9,0,3,'Maximum:','','on',2,24),(3607,'4ff6795cd007a8c2639828cea58b3502',0,0,82,1162,31,'FF',8,0,1,'Closing Connection','','',2,25),(3608,'1e5a3632296dddeaf24cf79b34c2df68',0,0,82,1162,0,'FF',9,0,4,'Current:','','',2,26),(3609,'687348a472eff4d3b6cc8a14b7d26476',0,0,82,1162,0,'FF',9,0,1,'Average:','','',2,27),(3610,'de437e1d5b4e2b3d8f845e4f8ad7f49d',0,0,82,1162,0,'FF',9,0,3,'Maximum:','','on',2,28),(3611,'58335875bdb7383362695628b10d5fdd',0,0,82,1168,107,'FF',8,0,1,'Logging','','',2,29),(3612,'ea82750c043993e33deb2cd5396338ea',0,0,82,1168,0,'FF',9,0,4,'Current:','','',2,30),(3613,'35fd95cb60be093b9e8b5cef94e5626a',0,0,82,1168,0,'FF',9,0,1,'Average:','','',2,31),(3614,'c2aa05b5b31af5bf1bc6aefe5efb8749',0,0,82,1168,0,'FF',9,0,3,'Maximum:','','on',2,32),(3615,'12a58e1d81cd23fe0f10139e785b5c4c',0,0,82,1167,46,'FF',8,0,1,'Graceful Finishing','','',2,33),(3616,'f5a654f14086bf7f43d74b7dc2e22be5',0,0,82,1167,0,'FF',9,0,4,'Current:','','',2,34),(3617,'be693a74dbd8a2309552e2ff5eed4807',0,0,82,1167,0,'FF',9,0,1,'Average:','','',2,35),(3618,'cb64a975334ea7e08c2990a3174e0beb',0,0,82,1167,0,'FF',9,0,3,'Maximum:','','on',2,36),(3619,'99474e9f89c6b9d2f8b19493bd15247c',0,0,82,1166,41,'FF',8,0,1,'Idle Cleanup','','',2,37),(3620,'52930aa82b117fab932864a3f924517a',0,0,82,1166,0,'FF',9,0,4,'Current:','','',2,38),(3621,'45f898ee08f8b297f9a36f2af688a1a5',0,0,82,1166,0,'FF',9,0,1,'Average:','','',2,39),(3622,'f994a6e3cf4cb1b49196b7524cb400a2',0,0,82,1166,0,'FF',9,0,3,'Maximum:','','on',2,40);
/*!40000 ALTER TABLE `graph_templates_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_tree`
--

DROP TABLE IF EXISTS `graph_tree`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_tree` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `sort_type` tinyint(3) unsigned NOT NULL default '1',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_tree`
--

LOCK TABLES `graph_tree` WRITE;
/*!40000 ALTER TABLE `graph_tree` DISABLE KEYS */;
INSERT INTO `graph_tree` VALUES (16,1,'Development'),(14,1,'EMS'),(3,1,'APLIKASI OS3'),(15,1,'RADIUS');
/*!40000 ALTER TABLE `graph_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_tree_items`
--

DROP TABLE IF EXISTS `graph_tree_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `graph_tree_items` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `graph_tree_id` smallint(5) unsigned NOT NULL default '0',
  `local_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `rra_id` smallint(8) unsigned NOT NULL default '0',
  `title` varchar(255) default NULL,
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `order_key` varchar(100) NOT NULL default '0',
  `host_grouping_type` tinyint(3) unsigned NOT NULL default '1',
  `sort_children_type` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `graph_tree_id` (`graph_tree_id`),
  KEY `host_id` (`host_id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `order_key` (`order_key`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `graph_tree_items`
--

LOCK TABLES `graph_tree_items` WRITE;
/*!40000 ALTER TABLE `graph_tree_items` DISABLE KEYS */;
INSERT INTO `graph_tree_items` VALUES (192,14,0,0,'EMS-DIVRE V',0,'005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(79,3,218,5,'',0,'009004006000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(14,3,0,0,'',7,'002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(15,3,0,0,'',6,'003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(16,3,0,0,'',8,'004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(17,3,0,0,'OS3-V2 DIVRE 2',0,'009000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(235,15,0,0,'JATINEGARA',0,'001006000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(77,3,219,5,'',0,'009004008000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(20,3,0,0,'Network Device',0,'009004000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(38,3,0,0,'Eth1 - Intranet Radius',0,'009004004000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(76,3,216,5,'',0,'009004007000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(36,3,0,0,'Eth0 - Intranet Telkom',0,'009004003000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(78,3,217,5,'',0,'009004005000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(40,3,0,0,'Service MySQL',0,'009005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(88,3,225,5,'',0,'009005006000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(80,3,220,5,'',0,'009005001000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(74,3,217,5,'',0,'009004003001000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(75,3,218,5,'',0,'009004004001000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(236,15,0,0,'KEBAYORAN',0,'001007000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(237,15,0,0,'KOTA 2',0,'001008000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(238,15,0,0,'Master',0,'001005001000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(239,15,0,0,'Slave',0,'001005002000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(240,15,0,0,'Master',0,'001006001000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(241,15,0,0,'Slave',0,'001006002000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(242,15,0,0,'Master',0,'001007001000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(246,16,0,0,'',10,'001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(245,15,0,0,'Slave',0,'001008002000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(244,15,0,0,'Master',0,'001008001000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(243,15,0,0,'Slave',0,'001007002000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(233,3,0,0,'',58,'007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(232,3,0,0,'',57,'006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(69,3,0,0,'Service HTTP',0,'009006000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(193,14,0,1,'',33,'003001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(82,3,222,5,'',0,'009005003000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(83,3,223,5,'',0,'009005004000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(87,3,226,5,'',0,'009005007000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(86,3,224,5,'',0,'009005005000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(89,3,227,5,'',0,'009005008000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(90,3,228,5,'',0,'009005009000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(91,3,229,5,'',0,'009005010000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(92,3,232,5,'',0,'009005011000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(93,3,233,5,'',0,'009005012000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(94,3,234,5,'',0,'009005013000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(95,3,236,5,'',0,'009005014000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(96,3,237,5,'',0,'009005015000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(97,3,238,5,'',0,'009005016000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(98,3,239,5,'',0,'009005017000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(99,3,240,5,'',0,'009005018000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(231,14,0,0,'',56,'007007000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(228,14,0,0,'',53,'007005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(229,14,0,0,'',54,'007006000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(226,14,0,0,'',52,'007003000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(225,14,0,0,'',51,'007002000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(224,14,0,0,'',50,'007001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(191,14,0,0,'EMS-DIVRE IV',0,'004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(223,14,0,0,'EMS-DIVRE 7',0,'007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(222,14,0,0,'',49,'006006000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(221,14,0,0,'',48,'006005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(220,14,0,0,'',46,'006004000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(219,14,0,0,'',45,'006003000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(218,14,0,0,'',44,'006002000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(217,14,0,0,'',47,'006001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(216,14,0,0,'EMS-DIVRE 6',0,'006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(215,14,0,0,'',43,'005005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(214,14,0,0,'',42,'005004000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(213,14,0,0,'',41,'005003000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(212,14,0,0,'',40,'005002000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(206,15,0,0,'RADIUS DIVRE II',0,'001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(207,15,0,1,'',14,'001001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(208,15,0,1,'',15,'001002000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(209,15,0,1,'',12,'001003000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(210,15,0,1,'',11,'001004000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(234,15,0,0,'GAMBIR',0,'001005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(190,14,0,0,'EMS-DIVRE III',0,'003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(189,14,0,1,'',32,'002008000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(173,14,0,0,'EMS-DIVRE I',0,'001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(174,14,0,0,'EMS-DIVRE II',0,'002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(175,14,0,1,'',24,'001001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(176,14,0,1,'',23,'001002000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(177,14,0,1,'',22,'001003000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(178,14,0,1,'',21,'001004000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(179,14,0,1,'',20,'001005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(180,14,0,1,'',19,'001006000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(181,14,0,1,'',18,'001007000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(182,14,0,1,'',26,'002001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(183,14,0,1,'',25,'002002000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(184,14,0,1,'',27,'002003000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(185,14,0,1,'',28,'002004000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(186,14,0,1,'',29,'002005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(187,14,0,1,'',30,'002006000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(188,14,0,1,'',31,'002007000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(158,3,0,0,'',9,'005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(159,3,0,0,'',5,'008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(194,14,0,1,'',34,'004001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(195,14,0,1,'',35,'004002000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(196,14,0,1,'',36,'004003000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(197,14,0,1,'',37,'004004000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(198,14,0,1,'',38,'004005000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1),(199,14,0,1,'',39,'005001000000000000000000000000000000000000000000000000000000000000000000000000000000000000',1,1);
/*!40000 ALTER TABLE `graph_tree_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `description` varchar(150) NOT NULL default '',
  `hostname` varchar(250) default NULL,
  `notes` text,
  `snmp_community` varchar(100) default NULL,
  `snmp_version` tinyint(1) unsigned NOT NULL default '1',
  `snmp_username` varchar(50) default NULL,
  `snmp_password` varchar(50) default NULL,
  `snmp_auth_protocol` char(5) default '',
  `snmp_priv_passphrase` varchar(200) default '',
  `snmp_priv_protocol` char(6) default '',
  `snmp_context` varchar(64) default '',
  `snmp_port` mediumint(5) unsigned NOT NULL default '161',
  `snmp_timeout` mediumint(8) unsigned NOT NULL default '500',
  `availability_method` smallint(5) unsigned NOT NULL default '1',
  `ping_method` smallint(5) unsigned default '0',
  `ping_port` int(12) unsigned default '0',
  `ping_timeout` int(12) unsigned default '500',
  `ping_retries` int(12) unsigned default '2',
  `max_oids` int(12) unsigned default '10',
  `disabled` char(2) default NULL,
  `monitor` char(3) NOT NULL default 'on',
  `monitor_text` text NOT NULL,
  `status` tinyint(2) NOT NULL default '0',
  `status_event_count` mediumint(8) unsigned NOT NULL default '0',
  `status_fail_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `status_rec_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `status_last_error` varchar(255) default '',
  `min_time` decimal(10,5) default '9.99999',
  `max_time` decimal(10,5) default '0.00000',
  `cur_time` decimal(10,5) default '0.00000',
  `avg_time` decimal(10,5) default '0.00000',
  `total_polls` int(12) unsigned default '0',
  `failed_polls` int(12) unsigned default '0',
  `availability` decimal(8,5) NOT NULL default '100.00000',
  `wmi_account` int(12) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,9,'Localhost','localhost','','public',2,'','','MD5','','DES','',161,500,3,2,23,400,1,10,'','','',3,0,'0000-00-00 00:00:00','2009-12-12 09:41:00','','-0.27108','104.14505','0.00000','0.03513',194957,0,'100.00000',0),(11,1,'JATINEGARA 2','172.16.203.12','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','on','',3,0,'2010-06-06 01:47:00','2010-06-03 12:42:00','Host did not respond to SNMP','0.22602','1974.47801','1.59812','8.71525',24812,540,'97.82360',0),(12,9,'JATINEGARA 1','172.16.203.11','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','on','',3,0,'2010-06-04 22:43:00','2010-06-02 02:46:00','Host did not respond to SNMP','0.62394','1503.90601','5.52797','4.10350',24804,102,'99.58880',0),(10,13,'DEV-OS3-V2 - DIVRE 2 ','10.32.18.97','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.21720','1085.24895','1.58405','3.08696',24871,0,'100.00000',0),(5,0,'OS3  Divre 2','os3.divre2.telkom.co.id','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','on','',3,0,'2010-05-31 04:36:00','2010-05-18 17:30:00','Host did not respond to SNMP','0.26298','2080.82604','0.79608','7.07806',25219,11,'99.95640',0),(6,8,'OS3NAS - LB2','10.32.18.189','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','2010-05-18 04:04:00','Host did not respond to SNMP','0.18120','1202.24094','9.67503','2.01385',25211,15,'99.94050',0),(7,1,'OS3NAS - LB1','10.32.18.188','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.30804','1882.53808','1.85013','2.21257',25193,0,'100.00000',0),(8,1,'OS3NAS - APP01','10.32.18.190','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.01097','501.52397','0.91314','1.67329',25164,0,'100.00000',0),(9,1,'OS3NAS - APP02','10.32.18.191','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.01216','502.42209','1.30510','1.60472',25157,0,'100.00000',0),(14,1,'GAMBIR 1','172.16.203.21','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','on','',3,0,'2010-06-02 03:04:00','2010-06-02 02:46:00','Host did not respond to SNMP','0.63705','1853.80292','114.51507','4.94063',24744,104,'99.57970',0),(15,1,'GAMBIR 2','172.16.203.22','','public',1,'','','MD5','','DES','',161,500,2,2,23,400,1,10,'','on','',3,0,'2010-06-02 03:04:00','2010-06-02 02:46:00','Host did not respond to SNMP','0.53596','1013.42297','43.14899','4.41536',24741,101,'99.59180',0),(18,0,'EMS D1 SUMUT','172.29.18.147','','public',1,'','','MD5','','DES','',161,500,3,1,23,400,1,10,'','on','',3,0,'2010-05-26 03:09:00','2010-06-05 08:27:00','ICMP: Ping timed out','0.01097','399.99795','86.04002','65.97915',17043,13008,'23.67540',0),(19,0,'EMS D1 SUMBAR','172.29.21.2','','public',1,'','','MD5','','DES','',161,500,3,1,23,400,1,10,'','on','',3,0,'2010-06-06 17:03:00','2010-06-02 11:21:00','ICMP: Ping timed out','0.00787','399.99914','73.42482','51.97748',17042,673,'96.05090',0),(20,0,'EMS D1 RIDAR','172.29.20.15','','public',1,'','','MD5','','DES','',161,500,3,1,23,400,1,10,'','on','',3,0,'2010-06-06 19:03:00','2010-06-05 14:47:00','ICMP: Ping timed out','0.02599','399.99795','62.97684','41.89780',17042,240,'98.59170',0),(21,0,'EMS D1 PALEMBANG','172.16.253.12','','public',1,'','','MD5','','DES','',161,500,3,1,23,400,1,10,'','on','',1,646,'2010-06-02 16:30:00','2010-06-05 13:07:00','ICMP: Ping timed out','0.01907','399.99390','37.63700','26.27718',17042,4897,'71.26510',0),(22,0,'EMS D1 NAD','172.29.16.222','','public',1,'','','MD5','','DES','',161,500,3,1,23,400,1,10,'','on','',1,299,'2010-06-06 12:19:00','2010-06-02 02:46:00','ICMP: Ping timed out','0.00906','399.99890','50.53496','66.02806',17039,993,'94.17220',0),(23,0,'EMS D1 MEDAN','172.16.254.5','','public',1,'','','MD5','','DES','',161,500,3,1,23,400,1,10,'','on','',3,0,'2010-06-06 17:03:00','2010-06-02 02:46:00','ICMP: Ping timed out','0.01502','399.98794','85.03795','54.39160',17037,212,'98.75560',0),(24,0,'EMS D1 BATAM','172.29.22.2','','public',1,'','','MD5','','DES','',161,500,3,1,23,400,1,10,'','on','',3,0,'2010-06-04 17:51:00','2010-06-02 02:46:00','ICMP: Ping timed out','0.01693','399.99390','62.22510','40.15503',17035,204,'98.80250',0),(25,0,'EMS D2 BOGOR','10.12.12.33','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','','',3,0,'2010-06-03 05:02:00','2010-06-02 02:46:00','ICMP: Ping timed out','0.00000','399.99294','41.49008','15.56412',17011,100,'99.41210',0),(26,0,'EMS D2 BEKASI','10.12.12.65','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-05 09:39:00','2010-06-05 09:59:00','ICMP: Ping timed out','0.00000','399.99700','41.47196','12.04860',17008,161,'99.05340',0),(27,12,'EMS D2 GAMBIR','10.12.12.97','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-02 06:49:00','2010-06-02 10:31:00','ICMP: Ping timed out','0.00000','399.96195','40.77792','11.84617',17003,13718,'19.32010',0),(28,0,'EMS D2 JATINEGARA','10.12.12.81','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-04 22:43:00','2010-06-02 02:46:00','ICMP: Ping timed out','0.00000','399.99795','40.55595','15.37715',17001,100,'99.41180',0),(29,0,'EMS D2 KEBAYORAN','10.12.12.49','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-04 22:43:00','2010-06-04 10:29:00','ICMP: Ping timed out','0.00000','399.99914','41.13793','11.79882',17003,139,'99.18250',0),(30,0,'EMS D2 KOTA2','10.12.12.130','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',1,16990,'0000-00-00 00:00:00','0000-00-00 00:00:00','ICMP: Ping timed out','9.99999','0.00000','0.00000','0.00000',16991,16991,'0.00000',0),(31,0,'EMS D2 SEMANGGI2','10.12.12.18','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-07 06:55:00','2010-06-02 02:45:00','ICMP: Ping timed out','0.00000','399.99986','39.59990','64.38691',16986,195,'98.85200',0),(32,0,'EMS D2 TANGERANG','10.12.12.115','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-05 04:47:00','2010-06-05 05:27:00','ICMP: Ping timed out','0.00000','399.99509','52.14000','12.49165',16988,214,'98.74030',0),(33,12,'EMS D3 BANDUNG','172.16.201.39','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-02 01:07:00','2010-06-02 02:45:00','ICMP: Ping timed out','0.00000','399.99104','26.59321','16.96491',6883,89,'98.70700',0),(34,12,'EMS D4 PEKALONGAN','172.22.24.6','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',1,6854,'0000-00-00 00:00:00','0000-00-00 00:00:00','ICMP: Ping timed out','9.99999','0.00000','0.00000','0.00000',6855,6855,'0.00000',0),(35,12,'EMS D4 PURWOKERTO','172.22.64.5','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-07 05:55:00','2010-06-02 02:45:00','ICMP: Ping timed out','0.45609','399.99294','48.74611','80.12659',6761,1772,'73.79090',0),(36,12,'EMS D4 SEMARANG','172.22.4.3','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-02 01:06:00','2010-06-01 03:01:00','ICMP: Ping timed out','0.00000','399.99819','44.69800','58.14250',6758,1767,'73.85320',0),(37,12,'EMS D4 SOLO','172.22.44.251','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-07 05:55:00','2010-06-01 23:16:00','ICMP: Ping timed out','0.07415','399.97602','48.98405','55.60759',6760,1768,'73.84620',0),(38,12,'EMS D4 YOGYAKARTA','10.88.10.80','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-07 00:23:00','2010-06-03 06:15:00','ICMP: Ping timed out','0.01717','333.74310','0.60511','14.06395',6888,21,'99.69510',0),(39,12,'EMS D5 JEMBER','10.125.127.3','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-05 20:51:00','2010-06-02 10:47:00','ICMP: Ping timed out','0.01884','399.98507','28.96810','38.54914',6845,2116,'69.08690',0),(40,12,'EMS D5 MADIUN','10.125.127.5','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-03 08:30:00','2010-06-01 08:42:00','ICMP: Ping timed out','0.02789','353.49202','29.78182','25.80942',6267,1514,'75.84170',0),(41,0,'EMS D5 MALANG','10.125.127.4','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-03 08:30:00','0000-00-00 00:00:00','ICMP: Ping timed out','0.04792','184.22604','20.23387','22.59791',3676,2,'99.94560',0),(42,12,'EMS D5 SBB','10.125.127.2','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-03 08:30:00','0000-00-00 00:00:00','ICMP: Ping timed out','0.00000','399.94693','22.59707','30.37256',3675,1,'99.97280',0),(43,12,'EMS D5 SBT','10.125.127.1','','public',1,'','','MD5','','DES','',161,500,4,2,23,400,1,10,'','on','',3,0,'2010-06-07 08:07:00','2010-06-07 03:59:00','UDP: Ping timed out','0.04101','324.50700','8.14486','19.02055',3675,187,'94.91160',0),(57,0,'OS3NAS - APP03','10.32.18.192','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.01097','387.14814','20.89405','4.40300',3488,0,'100.00000',0),(44,12,'EMS D6 BJM','172.16.62.2','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-06 22:11:00','0000-00-00 00:00:00','ICMP: Ping timed out','0.00000','399.99294','42.37413','29.97263',3662,3,'99.91810',0),(45,12,'EMS D6 BPP','172.16.61.5','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-05 06:23:00','0000-00-00 00:00:00','ICMP: Ping timed out','0.01192','399.95384','72.41488','36.70003',3662,5,'99.86350',0),(46,12,'EMS D6 PLK','172.16.64.5','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-03 03:25:00','0000-00-00 00:00:00','ICMP: Ping timed out','0.01311','399.95790','76.65205','32.12960',3660,3,'99.91800',0),(47,12,'	 EMS D6 PTK','172.16.66.1','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.00000','399.96719','133.26693','41.17385',3659,0,'100.00000',0),(48,12,'EMS D6 SMR','172.16.63.1','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.00000','399.95193','84.45001','52.50045',3659,0,'100.00000',0),(49,0,'EMS D6 TRK','172.16.65.1','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-06 05:47:00','0000-00-00 00:00:00','ICMP: Ping timed out','0.00000','399.98913','100.65818','71.44781',3658,3,'99.91800',0),(50,12,'EMS D7 BALI','172.25.0.120','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-04 08:39:00','0000-00-00 00:00:00','ICMP: Ping timed out','0.07010','399.94407','92.43298','38.42159',3656,5,'99.86320',0),(51,12,'EMS D7 GORONTALO','172.31.250.140','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-06 17:35:00','2010-06-06 18:31:00','ICMP: Ping timed out','0.03695','399.98102','91.76803','65.40708',3655,77,'97.89330',0),(53,12,'EMS D7 MDO','172.16.254.69','','public',1,'','','MD5','','DES','',161,500,1,1,23,400,1,10,'','on','',1,3641,'0000-00-00 00:00:00','0000-00-00 00:00:00','Host did not respond to SNMP, ICMP: Host is Alive','9.99999','0.00000','0.00000','0.00000',3642,3642,'0.00000',0),(52,12,'EMS D7 KENDARI','172.25.129.253','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-04 10:14:00','2010-06-02 03:17:00','ICMP: Ping timed out','0.02408','399.96791','86.57217','44.42386',3643,18,'99.50590',0),(54,12,'EMS D7 MKS','172.16.254.111','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'2010-06-04 10:43:00','2010-06-04 07:46:00','ICMP: Ping timed out','0.00882','399.99986','81.14600','38.66452',3642,23,'99.36850',0),(56,12,'EMS D7 PAREPARE','172.31.250.6','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',1,3633,'0000-00-00 00:00:00','0000-00-00 00:00:00','ICMP: Ping timed out','9.99999','0.00000','0.00000','0.00000',3634,3634,'0.00000',0),(58,0,'OS3NAS - APP04','10.32.18.193','','public',1,'','','MD5','','DES','',161,500,4,1,23,400,1,10,'','on','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','','0.01097','377.49696','1.92118','3.82732',3488,0,'100.00000',0);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_graph`
--

DROP TABLE IF EXISTS `host_graph`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host_graph` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_id`,`graph_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host_graph`
--

LOCK TABLES `host_graph` WRITE;
/*!40000 ALTER TABLE `host_graph` DISABLE KEYS */;
INSERT INTO `host_graph` VALUES (1,8),(1,9),(1,10),(1,12),(1,35),(1,37),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,54),(5,55),(5,56),(5,57),(5,58),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(5,75),(6,8),(6,9),(6,10),(6,12),(6,35),(6,37),(7,8),(7,9),(7,10),(7,12),(7,35),(7,37),(8,7),(8,8),(8,9),(8,10),(9,8),(9,9),(9,10),(9,12),(9,35),(9,37),(10,3),(10,4),(10,7),(10,8),(10,9),(10,10),(10,11),(10,12),(10,13),(10,21),(10,76),(10,77),(10,78),(10,79),(10,80),(10,81),(10,82),(12,48),(12,49),(12,50),(12,51),(12,52),(12,53),(12,54),(12,55),(12,56),(12,57),(12,58),(12,59),(12,60),(12,61),(12,62),(12,63),(12,64),(12,65),(12,66),(12,67),(12,68),(26,7),(27,7),(30,7),(31,7),(33,7),(34,7),(35,7),(36,7),(37,7),(39,7),(40,7),(42,7),(43,7),(44,7),(45,7),(46,7),(47,7),(48,7),(50,7),(51,7),(52,7),(53,7),(54,7),(56,7);
/*!40000 ALTER TABLE `host_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_snmp_cache`
--

DROP TABLE IF EXISTS `host_snmp_cache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host_snmp_cache` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  `field_name` varchar(50) NOT NULL default '',
  `field_value` varchar(255) default NULL,
  `snmp_index` varchar(255) NOT NULL default '',
  `oid` text NOT NULL,
  PRIMARY KEY  (`host_id`,`snmp_query_id`,`field_name`,`snmp_index`),
  KEY `host_id` (`host_id`,`field_name`),
  KEY `snmp_index` (`snmp_index`),
  KEY `field_name` (`field_name`),
  KEY `field_value` (`field_value`),
  KEY `snmp_query_id` (`snmp_query_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host_snmp_cache`
--

LOCK TABLES `host_snmp_cache` WRITE;
/*!40000 ALTER TABLE `host_snmp_cache` DISABLE KEYS */;
INSERT INTO `host_snmp_cache` VALUES (12,1,'ifIP','172.16.203.11','2','.1.3.6.1.2.1.4.20.1.2.172.16.203.11'),(7,6,'dskMount','/boot','/dev/sda1',''),(5,1,'ifHwAddr','','1','.1.3.6.1.2.1.2.2.1.6.1'),(5,1,'ifSpeed','0','4','.1.3.6.1.2.1.2.2.1.5.4'),(5,6,'dskMount','/','/dev/sda2',''),(5,6,'dskMount','/boot','/dev/sda1',''),(6,6,'dskMount','/boot','/dev/sda1',''),(1,1,'ifHwAddr','00:00:50:56:BD:15:CB','2','.1.3.6.1.2.1.2.2.1.6.2'),(1,1,'ifIP','10.32.18.200','2','.1.3.6.1.2.1.4.20.1.2.10.32.18.200'),(1,1,'ifIP','127.0.0.1','1','.1.3.6.1.2.1.4.20.1.2.127.0.0.1'),(1,1,'ifHwAddr','','1','.1.3.6.1.2.1.2.2.1.6.1'),(1,1,'ifSpeed','1000000000','2','.1.3.6.1.2.1.2.2.1.5.2'),(1,1,'ifIndex','1','1','.1.3.6.1.2.1.2.2.1.1.1'),(1,1,'ifIndex','2','2','.1.3.6.1.2.1.2.2.1.1.2'),(1,1,'ifOperStatus','Up','1','.1.3.6.1.2.1.2.2.1.8.1'),(1,1,'ifOperStatus','Up','2','.1.3.6.1.2.1.2.2.1.8.2'),(1,1,'ifDescr','lo','1','.1.3.6.1.2.1.2.2.1.2.1'),(1,1,'ifDescr','eth0','2','.1.3.6.1.2.1.2.2.1.2.2'),(1,1,'ifType','softwareLoopback(24)','1','.1.3.6.1.2.1.2.2.1.3.1'),(1,1,'ifType','ethernetCsmacd(6)','2','.1.3.6.1.2.1.2.2.1.3.2'),(1,1,'ifSpeed','10000000','1','.1.3.6.1.2.1.2.2.1.5.1'),(12,1,'ifIP','127.0.0.1','1','.1.3.6.1.2.1.4.20.1.2.127.0.0.1'),(14,1,'ifHwAddr','00:00:1E:0B:CF:BF:E6','3','.1.3.6.1.2.1.2.2.1.6.3'),(14,1,'ifHwAddr','00:00:1F:29:57:05:F4','4','.1.3.6.1.2.1.2.2.1.6.4'),(14,1,'ifHwAddr','00:00:1F:29:57:05:F5','5','.1.3.6.1.2.1.2.2.1.6.5'),(14,1,'ifHwAddr','','6','.1.3.6.1.2.1.2.2.1.6.6'),(14,1,'ifIP','127.0.0.1','1','.1.3.6.1.2.1.4.20.1.2.127.0.0.1'),(14,1,'ifIP','172.16.203.21','2','.1.3.6.1.2.1.4.20.1.2.172.16.203.21'),(14,1,'ifHwAddr','00:00:1E:0B:CF:BF:E4','2','.1.3.6.1.2.1.2.2.1.6.2'),(14,1,'ifHwAddr','','1','.1.3.6.1.2.1.2.2.1.6.1'),(14,1,'ifSpeed','0','6','.1.3.6.1.2.1.2.2.1.5.6'),(14,1,'ifSpeed','10000000','5','.1.3.6.1.2.1.2.2.1.5.5'),(14,1,'ifSpeed','10000000','4','.1.3.6.1.2.1.2.2.1.5.4'),(14,1,'ifSpeed','10000000','1','.1.3.6.1.2.1.2.2.1.5.1'),(14,1,'ifSpeed','100000000','2','.1.3.6.1.2.1.2.2.1.5.2'),(14,1,'ifSpeed','10000000','3','.1.3.6.1.2.1.2.2.1.5.3'),(14,1,'ifType','ethernetCsmacd(6)','3','.1.3.6.1.2.1.2.2.1.3.3'),(14,1,'ifType','ethernetCsmacd(6)','4','.1.3.6.1.2.1.2.2.1.3.4'),(14,1,'ifType','ethernetCsmacd(6)','5','.1.3.6.1.2.1.2.2.1.3.5'),(14,1,'ifType','tunnel(131)','6','.1.3.6.1.2.1.2.2.1.3.6'),(14,1,'ifIndex','1','1','.1.3.6.1.2.1.2.2.1.1.1'),(14,1,'ifIndex','2','2','.1.3.6.1.2.1.2.2.1.1.2'),(14,1,'ifIndex','3','3','.1.3.6.1.2.1.2.2.1.1.3'),(14,1,'ifIndex','4','4','.1.3.6.1.2.1.2.2.1.1.4'),(14,1,'ifIndex','5','5','.1.3.6.1.2.1.2.2.1.1.5'),(14,1,'ifIndex','6','6','.1.3.6.1.2.1.2.2.1.1.6'),(14,1,'ifOperStatus','Up','1','.1.3.6.1.2.1.2.2.1.8.1'),(14,1,'ifOperStatus','Up','2','.1.3.6.1.2.1.2.2.1.8.2'),(14,1,'ifOperStatus','Down','3','.1.3.6.1.2.1.2.2.1.8.3'),(14,1,'ifOperStatus','Down','4','.1.3.6.1.2.1.2.2.1.8.4'),(14,1,'ifOperStatus','Down','5','.1.3.6.1.2.1.2.2.1.8.5'),(14,1,'ifOperStatus','Down','6','.1.3.6.1.2.1.2.2.1.8.6'),(14,1,'ifDescr','lo','1','.1.3.6.1.2.1.2.2.1.2.1'),(14,1,'ifDescr','eth0','2','.1.3.6.1.2.1.2.2.1.2.2'),(14,1,'ifDescr','eth1','3','.1.3.6.1.2.1.2.2.1.2.3'),(14,1,'ifDescr','eth2','4','.1.3.6.1.2.1.2.2.1.2.4'),(14,1,'ifDescr','eth3','5','.1.3.6.1.2.1.2.2.1.2.5'),(14,1,'ifDescr','sit0','6','.1.3.6.1.2.1.2.2.1.2.6'),(14,1,'ifName','lo','1','.1.3.6.1.2.1.31.1.1.1.1.1'),(14,1,'ifName','eth0','2','.1.3.6.1.2.1.31.1.1.1.1.2'),(14,1,'ifName','eth1','3','.1.3.6.1.2.1.31.1.1.1.1.3'),(14,1,'ifName','eth2','4','.1.3.6.1.2.1.31.1.1.1.1.4'),(14,1,'ifName','eth3','5','.1.3.6.1.2.1.31.1.1.1.1.5'),(14,1,'ifName','sit0','6','.1.3.6.1.2.1.31.1.1.1.1.6'),(14,1,'ifAlias','','1','.1.3.6.1.2.1.31.1.1.1.18.1'),(14,1,'ifAlias','','2','.1.3.6.1.2.1.31.1.1.1.18.2'),(14,1,'ifAlias','','3','.1.3.6.1.2.1.31.1.1.1.18.3'),(14,1,'ifAlias','','4','.1.3.6.1.2.1.31.1.1.1.18.4'),(14,1,'ifAlias','','5','.1.3.6.1.2.1.31.1.1.1.18.5'),(14,1,'ifAlias','','6','.1.3.6.1.2.1.31.1.1.1.18.6'),(14,1,'ifType','softwareLoopback(24)','1','.1.3.6.1.2.1.2.2.1.3.1'),(14,1,'ifType','ethernetCsmacd(6)','2','.1.3.6.1.2.1.2.2.1.3.2'),(12,1,'ifHwAddr','','6','.1.3.6.1.2.1.2.2.1.6.6'),(15,1,'ifHwAddr','00:00:15:17:78:21:51','3','.1.3.6.1.2.1.2.2.1.6.3'),(15,1,'ifHwAddr','00:00:1A:64:C3:3C:6C','4','.1.3.6.1.2.1.2.2.1.6.4'),(15,1,'ifHwAddr','00:00:1A:64:C3:3C:6E','5','.1.3.6.1.2.1.2.2.1.6.5'),(15,1,'ifHwAddr','','6','.1.3.6.1.2.1.2.2.1.6.6'),(15,1,'ifIP','127.0.0.1','1','.1.3.6.1.2.1.4.20.1.2.127.0.0.1'),(15,1,'ifIP','172.16.203.22','4','.1.3.6.1.2.1.4.20.1.2.172.16.203.22'),(8,6,'dskMount','/boot','/dev/sda1',''),(15,1,'ifHwAddr','00:00:15:17:78:21:50','2','.1.3.6.1.2.1.2.2.1.6.2'),(15,1,'ifHwAddr','','1','.1.3.6.1.2.1.2.2.1.6.1'),(15,1,'ifSpeed','0','6','.1.3.6.1.2.1.2.2.1.5.6'),(15,1,'ifSpeed','10000000','5','.1.3.6.1.2.1.2.2.1.5.5'),(15,1,'ifSpeed','100000000','4','.1.3.6.1.2.1.2.2.1.5.4'),(15,1,'ifSpeed','10000000','2','.1.3.6.1.2.1.2.2.1.5.2'),(15,1,'ifSpeed','10000000','3','.1.3.6.1.2.1.2.2.1.5.3'),(15,1,'ifType','tunnel(131)','6','.1.3.6.1.2.1.2.2.1.3.6'),(15,1,'ifSpeed','10000000','1','.1.3.6.1.2.1.2.2.1.5.1'),(15,1,'ifType','ethernetCsmacd(6)','5','.1.3.6.1.2.1.2.2.1.3.5'),(15,1,'ifType','ethernetCsmacd(6)','4','.1.3.6.1.2.1.2.2.1.3.4'),(15,1,'ifIndex','1','1','.1.3.6.1.2.1.2.2.1.1.1'),(15,1,'ifIndex','2','2','.1.3.6.1.2.1.2.2.1.1.2'),(15,1,'ifIndex','3','3','.1.3.6.1.2.1.2.2.1.1.3'),(15,1,'ifIndex','4','4','.1.3.6.1.2.1.2.2.1.1.4'),(15,1,'ifIndex','5','5','.1.3.6.1.2.1.2.2.1.1.5'),(15,1,'ifIndex','6','6','.1.3.6.1.2.1.2.2.1.1.6'),(15,1,'ifOperStatus','Up','1','.1.3.6.1.2.1.2.2.1.8.1'),(15,1,'ifOperStatus','Down','2','.1.3.6.1.2.1.2.2.1.8.2'),(15,1,'ifOperStatus','Down','3','.1.3.6.1.2.1.2.2.1.8.3'),(15,1,'ifOperStatus','Up','4','.1.3.6.1.2.1.2.2.1.8.4'),(15,1,'ifOperStatus','Down','5','.1.3.6.1.2.1.2.2.1.8.5'),(15,1,'ifOperStatus','Down','6','.1.3.6.1.2.1.2.2.1.8.6'),(15,1,'ifDescr','lo','1','.1.3.6.1.2.1.2.2.1.2.1'),(15,1,'ifDescr','eth2','2','.1.3.6.1.2.1.2.2.1.2.2'),(15,1,'ifDescr','eth3','3','.1.3.6.1.2.1.2.2.1.2.3'),(15,1,'ifDescr','eth0','4','.1.3.6.1.2.1.2.2.1.2.4'),(15,1,'ifDescr','eth1','5','.1.3.6.1.2.1.2.2.1.2.5'),(15,1,'ifDescr','sit0','6','.1.3.6.1.2.1.2.2.1.2.6'),(15,1,'ifName','lo','1','.1.3.6.1.2.1.31.1.1.1.1.1'),(15,1,'ifName','eth2','2','.1.3.6.1.2.1.31.1.1.1.1.2'),(15,1,'ifName','eth3','3','.1.3.6.1.2.1.31.1.1.1.1.3'),(15,1,'ifName','eth0','4','.1.3.6.1.2.1.31.1.1.1.1.4'),(15,1,'ifName','eth1','5','.1.3.6.1.2.1.31.1.1.1.1.5'),(15,1,'ifName','sit0','6','.1.3.6.1.2.1.31.1.1.1.1.6'),(15,1,'ifAlias','','1','.1.3.6.1.2.1.31.1.1.1.18.1'),(15,1,'ifAlias','','2','.1.3.6.1.2.1.31.1.1.1.18.2'),(15,1,'ifAlias','','3','.1.3.6.1.2.1.31.1.1.1.18.3'),(15,1,'ifAlias','','4','.1.3.6.1.2.1.31.1.1.1.18.4'),(15,1,'ifAlias','','5','.1.3.6.1.2.1.31.1.1.1.18.5'),(15,1,'ifAlias','','6','.1.3.6.1.2.1.31.1.1.1.18.6'),(15,1,'ifType','softwareLoopback(24)','1','.1.3.6.1.2.1.2.2.1.3.1'),(15,1,'ifType','ethernetCsmacd(6)','2','.1.3.6.1.2.1.2.2.1.3.2'),(15,1,'ifType','ethernetCsmacd(6)','3','.1.3.6.1.2.1.2.2.1.3.3'),(12,1,'ifSpeed','10000000','4','.1.3.6.1.2.1.2.2.1.5.4'),(12,1,'ifSpeed','10000000','5','.1.3.6.1.2.1.2.2.1.5.5'),(12,1,'ifSpeed','0','6','.1.3.6.1.2.1.2.2.1.5.6'),(12,1,'ifHwAddr','','1','.1.3.6.1.2.1.2.2.1.6.1'),(12,1,'ifHwAddr','00:00:1E:0B:CF:BF:CE','2','.1.3.6.1.2.1.2.2.1.6.2'),(12,1,'ifHwAddr','00:00:1E:0B:CF:BF:D0','3','.1.3.6.1.2.1.2.2.1.6.3'),(12,1,'ifHwAddr','00:00:1F:29:57:05:7C','4','.1.3.6.1.2.1.2.2.1.6.4'),(12,1,'ifName','eth3','5','.1.3.6.1.2.1.31.1.1.1.1.5'),(12,1,'ifName','eth2','4','.1.3.6.1.2.1.31.1.1.1.1.4'),(12,1,'ifName','eth1','3','.1.3.6.1.2.1.31.1.1.1.1.3'),(12,1,'ifName','eth0','2','.1.3.6.1.2.1.31.1.1.1.1.2'),(12,1,'ifName','lo','1','.1.3.6.1.2.1.31.1.1.1.1.1'),(12,1,'ifDescr','sit0','6','.1.3.6.1.2.1.2.2.1.2.6'),(12,1,'ifDescr','eth3','5','.1.3.6.1.2.1.2.2.1.2.5'),(12,1,'ifDescr','eth2','4','.1.3.6.1.2.1.2.2.1.2.4'),(12,1,'ifDescr','eth1','3','.1.3.6.1.2.1.2.2.1.2.3'),(12,1,'ifDescr','eth0','2','.1.3.6.1.2.1.2.2.1.2.2'),(12,1,'ifDescr','lo','1','.1.3.6.1.2.1.2.2.1.2.1'),(12,1,'ifIndex','1','1','.1.3.6.1.2.1.2.2.1.1.1'),(12,1,'ifIndex','2','2','.1.3.6.1.2.1.2.2.1.1.2'),(12,1,'ifIndex','3','3','.1.3.6.1.2.1.2.2.1.1.3'),(12,1,'ifIndex','4','4','.1.3.6.1.2.1.2.2.1.1.4'),(12,1,'ifIndex','5','5','.1.3.6.1.2.1.2.2.1.1.5'),(12,1,'ifIndex','6','6','.1.3.6.1.2.1.2.2.1.1.6'),(12,1,'ifOperStatus','Up','1','.1.3.6.1.2.1.2.2.1.8.1'),(12,1,'ifOperStatus','Up','2','.1.3.6.1.2.1.2.2.1.8.2'),(12,1,'ifOperStatus','Down','3','.1.3.6.1.2.1.2.2.1.8.3'),(12,1,'ifOperStatus','Down','4','.1.3.6.1.2.1.2.2.1.8.4'),(12,1,'ifOperStatus','Down','5','.1.3.6.1.2.1.2.2.1.8.5'),(12,1,'ifOperStatus','Down','6','.1.3.6.1.2.1.2.2.1.8.6'),(12,1,'ifType','ethernetCsmacd(6)','5','.1.3.6.1.2.1.2.2.1.3.5'),(12,1,'ifType','tunnel(131)','6','.1.3.6.1.2.1.2.2.1.3.6'),(12,1,'ifSpeed','10000000','1','.1.3.6.1.2.1.2.2.1.5.1'),(12,1,'ifSpeed','1000000000','2','.1.3.6.1.2.1.2.2.1.5.2'),(12,1,'ifSpeed','10000000','3','.1.3.6.1.2.1.2.2.1.5.3'),(12,1,'ifType','ethernetCsmacd(6)','4','.1.3.6.1.2.1.2.2.1.3.4'),(12,1,'ifType','ethernetCsmacd(6)','3','.1.3.6.1.2.1.2.2.1.3.3'),(12,1,'ifType','ethernetCsmacd(6)','2','.1.3.6.1.2.1.2.2.1.3.2'),(12,1,'ifType','softwareLoopback(24)','1','.1.3.6.1.2.1.2.2.1.3.1'),(12,1,'ifName','sit0','6','.1.3.6.1.2.1.31.1.1.1.1.6'),(12,1,'ifAlias','','1','.1.3.6.1.2.1.31.1.1.1.18.1'),(12,1,'ifAlias','','2','.1.3.6.1.2.1.31.1.1.1.18.2'),(12,1,'ifAlias','','3','.1.3.6.1.2.1.31.1.1.1.18.3'),(12,1,'ifAlias','','4','.1.3.6.1.2.1.31.1.1.1.18.4'),(12,1,'ifAlias','','5','.1.3.6.1.2.1.31.1.1.1.18.5'),(12,1,'ifAlias','','6','.1.3.6.1.2.1.31.1.1.1.18.6'),(12,1,'ifHwAddr','00:00:1F:29:57:05:7D','5','.1.3.6.1.2.1.2.2.1.6.5'),(11,1,'ifHwAddr','00:00:1A:64:C3:3A:B6','5','.1.3.6.1.2.1.2.2.1.6.5'),(11,1,'ifHwAddr','','6','.1.3.6.1.2.1.2.2.1.6.6'),(11,1,'ifIP','127.0.0.1','1','.1.3.6.1.2.1.4.20.1.2.127.0.0.1'),(11,1,'ifIP','172.16.203.12','4','.1.3.6.1.2.1.4.20.1.2.172.16.203.12'),(9,6,'dskMount','/boot','/dev/sda1',''),(10,1,'ifIP','127.0.0.1','1','.1.3.6.1.2.1.4.20.1.2.127.0.0.1'),(10,1,'ifIP','172.16.203.69','3','.1.3.6.1.2.1.4.20.1.2.172.16.203.69'),(11,1,'ifHwAddr','00:00:1A:64:C3:3A:B4','4','.1.3.6.1.2.1.2.2.1.6.4'),(11,1,'ifHwAddr','00:00:15:17:78:17:B3','3','.1.3.6.1.2.1.2.2.1.6.3'),(11,1,'ifHwAddr','00:00:15:17:78:17:B2','2','.1.3.6.1.2.1.2.2.1.6.2'),(11,1,'ifHwAddr','','1','.1.3.6.1.2.1.2.2.1.6.1'),(11,1,'ifSpeed','0','6','.1.3.6.1.2.1.2.2.1.5.6'),(11,1,'ifSpeed','10000000','5','.1.3.6.1.2.1.2.2.1.5.5'),(11,1,'ifSpeed','1000000000','4','.1.3.6.1.2.1.2.2.1.5.4'),(11,1,'ifSpeed','10000000','3','.1.3.6.1.2.1.2.2.1.5.3'),(11,1,'ifSpeed','10000000','2','.1.3.6.1.2.1.2.2.1.5.2'),(11,1,'ifType','tunnel(131)','6','.1.3.6.1.2.1.2.2.1.3.6'),(11,1,'ifSpeed','10000000','1','.1.3.6.1.2.1.2.2.1.5.1'),(11,1,'ifIndex','1','1','.1.3.6.1.2.1.2.2.1.1.1'),(11,1,'ifIndex','2','2','.1.3.6.1.2.1.2.2.1.1.2'),(11,1,'ifIndex','3','3','.1.3.6.1.2.1.2.2.1.1.3'),(11,1,'ifIndex','4','4','.1.3.6.1.2.1.2.2.1.1.4'),(11,1,'ifIndex','5','5','.1.3.6.1.2.1.2.2.1.1.5'),(11,1,'ifIndex','6','6','.1.3.6.1.2.1.2.2.1.1.6'),(11,1,'ifOperStatus','Up','1','.1.3.6.1.2.1.2.2.1.8.1'),(11,1,'ifOperStatus','Down','2','.1.3.6.1.2.1.2.2.1.8.2'),(11,1,'ifOperStatus','Down','3','.1.3.6.1.2.1.2.2.1.8.3'),(11,1,'ifOperStatus','Up','4','.1.3.6.1.2.1.2.2.1.8.4'),(11,1,'ifOperStatus','Down','5','.1.3.6.1.2.1.2.2.1.8.5'),(11,1,'ifOperStatus','Down','6','.1.3.6.1.2.1.2.2.1.8.6'),(11,1,'ifDescr','lo','1','.1.3.6.1.2.1.2.2.1.2.1'),(11,1,'ifDescr','eth2','2','.1.3.6.1.2.1.2.2.1.2.2'),(11,1,'ifDescr','eth3','3','.1.3.6.1.2.1.2.2.1.2.3'),(11,1,'ifDescr','eth0','4','.1.3.6.1.2.1.2.2.1.2.4'),(11,1,'ifDescr','eth1','5','.1.3.6.1.2.1.2.2.1.2.5'),(11,1,'ifDescr','sit0','6','.1.3.6.1.2.1.2.2.1.2.6'),(11,1,'ifName','lo','1','.1.3.6.1.2.1.31.1.1.1.1.1'),(11,1,'ifName','eth2','2','.1.3.6.1.2.1.31.1.1.1.1.2'),(11,1,'ifName','eth3','3','.1.3.6.1.2.1.31.1.1.1.1.3'),(11,1,'ifName','eth0','4','.1.3.6.1.2.1.31.1.1.1.1.4'),(11,1,'ifName','eth1','5','.1.3.6.1.2.1.31.1.1.1.1.5'),(11,1,'ifName','sit0','6','.1.3.6.1.2.1.31.1.1.1.1.6'),(11,1,'ifAlias','','1','.1.3.6.1.2.1.31.1.1.1.18.1'),(11,1,'ifAlias','','2','.1.3.6.1.2.1.31.1.1.1.18.2'),(11,1,'ifAlias','','3','.1.3.6.1.2.1.31.1.1.1.18.3'),(11,1,'ifAlias','','4','.1.3.6.1.2.1.31.1.1.1.18.4'),(11,1,'ifAlias','','5','.1.3.6.1.2.1.31.1.1.1.18.5'),(11,1,'ifAlias','','6','.1.3.6.1.2.1.31.1.1.1.18.6'),(11,1,'ifType','softwareLoopback(24)','1','.1.3.6.1.2.1.2.2.1.3.1'),(11,1,'ifType','ethernetCsmacd(6)','2','.1.3.6.1.2.1.2.2.1.3.2'),(11,1,'ifType','ethernetCsmacd(6)','3','.1.3.6.1.2.1.2.2.1.3.3'),(11,1,'ifType','ethernetCsmacd(6)','4','.1.3.6.1.2.1.2.2.1.3.4'),(11,1,'ifType','ethernetCsmacd(6)','5','.1.3.6.1.2.1.2.2.1.3.5'),(10,1,'ifIP','10.32.18.97','2','.1.3.6.1.2.1.4.20.1.2.10.32.18.97'),(10,1,'ifType','ethernetCsmacd(6)','3','.1.3.6.1.2.1.2.2.1.3.3'),(10,1,'ifType','tunnel(131)','4','.1.3.6.1.2.1.2.2.1.3.4'),(10,1,'ifSpeed','10000000','1','.1.3.6.1.2.1.2.2.1.5.1'),(10,1,'ifSpeed','100000000','2','.1.3.6.1.2.1.2.2.1.5.2'),(10,1,'ifSpeed','100000000','3','.1.3.6.1.2.1.2.2.1.5.3'),(10,1,'ifSpeed','0','4','.1.3.6.1.2.1.2.2.1.5.4'),(10,1,'ifHwAddr','','1','.1.3.6.1.2.1.2.2.1.6.1'),(10,1,'ifHwAddr','00:00:0B:CD:C5:56:5D','2','.1.3.6.1.2.1.2.2.1.6.2'),(10,1,'ifHwAddr','00:00:02:44:A3:08:03','3','.1.3.6.1.2.1.2.2.1.6.3'),(10,1,'ifHwAddr','00:00:00:00:00:08:03','4','.1.3.6.1.2.1.2.2.1.6.4'),(10,1,'ifIndex','1','1','.1.3.6.1.2.1.2.2.1.1.1'),(10,1,'ifIndex','2','2','.1.3.6.1.2.1.2.2.1.1.2'),(10,1,'ifIndex','3','3','.1.3.6.1.2.1.2.2.1.1.3'),(10,1,'ifIndex','4','4','.1.3.6.1.2.1.2.2.1.1.4'),(10,1,'ifOperStatus','Up','1','.1.3.6.1.2.1.2.2.1.8.1'),(10,1,'ifOperStatus','Up','2','.1.3.6.1.2.1.2.2.1.8.2'),(10,1,'ifOperStatus','Up','3','.1.3.6.1.2.1.2.2.1.8.3'),(10,1,'ifOperStatus','Down','4','.1.3.6.1.2.1.2.2.1.8.4'),(10,1,'ifDescr','lo','1','.1.3.6.1.2.1.2.2.1.2.1'),(10,1,'ifDescr','eth0','2','.1.3.6.1.2.1.2.2.1.2.2'),(10,1,'ifDescr','eth1','3','.1.3.6.1.2.1.2.2.1.2.3'),(10,1,'ifDescr','sit0','4','.1.3.6.1.2.1.2.2.1.2.4'),(10,1,'ifType','softwareLoopback(24)','1','.1.3.6.1.2.1.2.2.1.3.1'),(10,1,'ifType','ethernetCsmacd(6)','2','.1.3.6.1.2.1.2.2.1.3.2'),(5,6,'dskDevice','/dev/sda2','/dev/sda2',''),(5,6,'dskDevice','/dev/sda1','/dev/sda1',''),(6,6,'dskDevice','/dev/sda1','/dev/sda1',''),(6,6,'dskMount','/','/dev/sda2',''),(6,6,'dskDevice','/dev/sda2','/dev/sda2',''),(7,6,'dskDevice','/dev/sda1','/dev/sda1',''),(7,6,'dskMount','/','/dev/sda2',''),(7,6,'dskDevice','/dev/sda2','/dev/sda2',''),(8,6,'dskDevice','/dev/sda1','/dev/sda1',''),(8,6,'dskMount','/','/dev/sda2',''),(8,6,'dskDevice','/dev/sda2','/dev/sda2',''),(9,6,'dskDevice','/dev/sda1','/dev/sda1',''),(9,6,'dskMount','/','/dev/sda2',''),(9,6,'dskDevice','/dev/sda2','/dev/sda2',''),(5,1,'ifHwAddr','00:00:13:21:E9:E8:00','2','.1.3.6.1.2.1.2.2.1.6.2'),(5,1,'ifHwAddr','00:00:16:35:B0:13:7B','3','.1.3.6.1.2.1.2.2.1.6.3'),(5,1,'ifHwAddr','00:00:00:00:00:13:7B','4','.1.3.6.1.2.1.2.2.1.6.4'),(5,1,'ifIP','10.32.18.99','2','.1.3.6.1.2.1.4.20.1.2.10.32.18.99'),(5,1,'ifIP','127.0.0.1','1','.1.3.6.1.2.1.4.20.1.2.127.0.0.1'),(5,1,'ifIP','172.16.203.67','3','.1.3.6.1.2.1.4.20.1.2.172.16.203.67'),(5,1,'ifSpeed','100000000','3','.1.3.6.1.2.1.2.2.1.5.3'),(5,1,'ifOperStatus','Up','3','.1.3.6.1.2.1.2.2.1.8.3'),(5,1,'ifOperStatus','Down','4','.1.3.6.1.2.1.2.2.1.8.4'),(5,1,'ifDescr','lo','1','.1.3.6.1.2.1.2.2.1.2.1'),(5,1,'ifDescr','eth0','2','.1.3.6.1.2.1.2.2.1.2.2'),(5,1,'ifDescr','eth1','3','.1.3.6.1.2.1.2.2.1.2.3'),(5,1,'ifDescr','sit0','4','.1.3.6.1.2.1.2.2.1.2.4'),(5,1,'ifType','softwareLoopback(24)','1','.1.3.6.1.2.1.2.2.1.3.1'),(5,1,'ifType','ethernetCsmacd(6)','2','.1.3.6.1.2.1.2.2.1.3.2'),(5,1,'ifType','ethernetCsmacd(6)','3','.1.3.6.1.2.1.2.2.1.3.3'),(5,1,'ifType','tunnel(131)','4','.1.3.6.1.2.1.2.2.1.3.4'),(5,1,'ifSpeed','10000000','1','.1.3.6.1.2.1.2.2.1.5.1'),(5,1,'ifSpeed','100000000','2','.1.3.6.1.2.1.2.2.1.5.2'),(5,1,'ifOperStatus','Up','2','.1.3.6.1.2.1.2.2.1.8.2'),(5,1,'ifOperStatus','Up','1','.1.3.6.1.2.1.2.2.1.8.1'),(5,1,'ifIndex','4','4','.1.3.6.1.2.1.2.2.1.1.4'),(5,1,'ifIndex','1','1','.1.3.6.1.2.1.2.2.1.1.1'),(5,1,'ifIndex','2','2','.1.3.6.1.2.1.2.2.1.1.2'),(5,1,'ifIndex','3','3','.1.3.6.1.2.1.2.2.1.1.3');
/*!40000 ALTER TABLE `host_snmp_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_snmp_query`
--

DROP TABLE IF EXISTS `host_snmp_query`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host_snmp_query` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  `sort_field` varchar(50) NOT NULL default '',
  `title_format` varchar(50) NOT NULL default '',
  `reindex_method` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_id`,`snmp_query_id`),
  KEY `host_id` (`host_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host_snmp_query`
--

LOCK TABLES `host_snmp_query` WRITE;
/*!40000 ALTER TABLE `host_snmp_query` DISABLE KEYS */;
INSERT INTO `host_snmp_query` VALUES (1,6,'dskDevice','|query_dskDevice|',0),(12,1,'ifDescr','|query_ifDescr|',1),(11,1,'ifDescr','|query_ifDescr|',1),(10,1,'ifDescr','|query_ifDescr|',1),(5,6,'dskDevice','|query_dskDevice|',1),(6,6,'dskDevice','|query_dskDevice|',1),(7,6,'dskDevice','|query_dskDevice|',1),(8,6,'dskDevice','|query_dskDevice|',1),(9,6,'dskDevice','|query_dskDevice|',1),(5,1,'ifDescr','|query_ifDescr|',1),(7,1,'','|query_|',1),(14,1,'ifDescr','|query_ifDescr|',1),(15,1,'ifDescr','|query_ifDescr|',1),(1,1,'ifDescr','|query_ifDescr|',1),(8,1,'','|query_|',1),(9,1,'','|query_|',1);
/*!40000 ALTER TABLE `host_snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template`
--

DROP TABLE IF EXISTS `host_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host_template` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host_template`
--

LOCK TABLES `host_template` WRITE;
/*!40000 ALTER TABLE `host_template` DISABLE KEYS */;
INSERT INTO `host_template` VALUES (1,'4855b0e3e553085ed57219690285f91f','Generic SNMP-enabled Host'),(3,'07d3fe6a52915f99e642d22e27d967a4','ucd/net SNMP Host'),(4,'4e5dc8dd115264c2e9f3adb725c29413','Karlnet Wireless Bridge'),(5,'cae6a879f86edacb2471055783bec6d0','Cisco Router'),(6,'9ef418b4251751e09c3c416704b01b01','Netware 4/5 Server'),(7,'5b8300be607dce4f030b026a381b91cd','Windows 2000/XP Host'),(8,'2d3e47f416738c2d22c87c40218cc55e','Local Linux Machine'),(9,'c5cc0bf1e96873c899eab03a5d2f5942','teMySQL Host'),(10,'53d513ac77cc76423e9cae1c6db61bb7','memcached Host'),(12,'463fb5fba203ead503b8cb427f7676ca','EMS'),(13,'8f4b09a4b49869a9891e3d7e5ae6159b','Linux'),(14,'601aff85146d56ace5d275168bd9380f','WebServer - Apache');
/*!40000 ALTER TABLE `host_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template_graph`
--

DROP TABLE IF EXISTS `host_template_graph`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host_template_graph` (
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_template_id`,`graph_template_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host_template_graph`
--

LOCK TABLES `host_template_graph` WRITE;
/*!40000 ALTER TABLE `host_template_graph` DISABLE KEYS */;
INSERT INTO `host_template_graph` VALUES (3,4),(3,11),(3,13),(5,18),(6,14),(6,16),(6,17),(6,30),(7,28),(7,29),(8,8),(8,9),(8,10),(8,12),(8,35),(8,37),(9,48),(9,49),(9,50),(9,51),(9,52),(9,53),(9,54),(9,55),(9,56),(9,57),(9,58),(9,59),(9,60),(9,61),(9,62),(9,63),(9,64),(9,65),(9,66),(9,67),(9,68),(10,69),(10,70),(10,71),(12,7),(13,3),(13,4),(13,7),(13,8),(13,9),(13,10),(13,11),(13,12),(13,13),(13,21),(14,76),(14,77),(14,78),(14,79),(14,80),(14,81),(14,82);
/*!40000 ALTER TABLE `host_template_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template_snmp_query`
--

DROP TABLE IF EXISTS `host_template_snmp_query`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `host_template_snmp_query` (
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`host_template_id`,`snmp_query_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `host_template_snmp_query`
--

LOCK TABLES `host_template_snmp_query` WRITE;
/*!40000 ALTER TABLE `host_template_snmp_query` DISABLE KEYS */;
INSERT INTO `host_template_snmp_query` VALUES (1,1),(3,1),(3,2),(4,1),(4,3),(5,1),(6,1),(6,4),(6,7),(7,1),(7,8),(7,9),(7,10),(8,6);
/*!40000 ALTER TABLE `host_template_snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_approved_macs`
--

DROP TABLE IF EXISTS `mac_track_approved_macs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_approved_macs` (
  `mac_prefix` varchar(20) NOT NULL,
  `vendor` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`mac_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_approved_macs`
--

LOCK TABLES `mac_track_approved_macs` WRITE;
/*!40000 ALTER TABLE `mac_track_approved_macs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_approved_macs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_device_types`
--

DROP TABLE IF EXISTS `mac_track_device_types`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_device_types` (
  `device_type_id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(100) NOT NULL default '',
  `vendor` varchar(40) NOT NULL default '',
  `device_type` varchar(10) NOT NULL default '0',
  `sysDescr_match` varchar(20) NOT NULL default '',
  `sysObjectID_match` varchar(40) NOT NULL default '',
  `scanning_function` varchar(100) NOT NULL default '',
  `lowPort` int(10) unsigned NOT NULL default '0',
  `highPort` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sysDescr_match`,`sysObjectID_match`,`device_type`),
  KEY `device_type` (`device_type`),
  KEY `device_type_id` (`device_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_device_types`
--

LOCK TABLES `mac_track_device_types` WRITE;
/*!40000 ALTER TABLE `mac_track_device_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_device_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_devices`
--

DROP TABLE IF EXISTS `mac_track_devices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_devices` (
  `site_id` int(10) unsigned NOT NULL default '0',
  `device_id` int(10) unsigned NOT NULL auto_increment,
  `device_type_id` int(10) unsigned default '0',
  `hostname` varchar(40) NOT NULL default '',
  `description` varchar(100) NOT NULL default '',
  `disabled` char(2) default '',
  `ignorePorts` varchar(255) default NULL,
  `ips_total` int(10) unsigned NOT NULL default '0',
  `vlans_total` int(10) unsigned NOT NULL default '0',
  `ports_total` int(10) unsigned NOT NULL default '0',
  `ports_active` int(10) unsigned NOT NULL default '0',
  `ports_trunk` int(10) unsigned NOT NULL default '0',
  `macs_active` int(10) unsigned NOT NULL default '0',
  `scan_type` tinyint(11) NOT NULL default '1',
  `snmp_readstring` varchar(100) NOT NULL,
  `snmp_readstrings` varchar(255) default NULL,
  `snmp_version` varchar(100) NOT NULL default '',
  `snmp_port` int(10) NOT NULL default '161',
  `snmp_timeout` int(10) unsigned NOT NULL default '500',
  `snmp_retries` tinyint(11) unsigned NOT NULL default '3',
  `snmp_sysName` varchar(100) default '',
  `snmp_sysLocation` varchar(100) default '',
  `snmp_sysContact` varchar(100) default '',
  `snmp_sysObjectID` varchar(100) default NULL,
  `snmp_sysDescr` varchar(100) default NULL,
  `snmp_sysUptime` varchar(100) default NULL,
  `snmp_status` int(10) unsigned NOT NULL default '0',
  `last_runmessage` varchar(100) default '',
  `last_rundate` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_runduration` decimal(10,5) NOT NULL default '0.00000',
  PRIMARY KEY  (`hostname`,`snmp_port`,`site_id`),
  KEY `site_id` (`site_id`),
  KEY `device_id` (`device_id`),
  KEY `snmp_sysDescr` (`snmp_sysDescr`),
  KEY `snmp_sysObjectID` (`snmp_sysObjectID`),
  KEY `device_type_id` (`device_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Devices to be scanned for MAC addresses';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_devices`
--

LOCK TABLES `mac_track_devices` WRITE;
/*!40000 ALTER TABLE `mac_track_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_ip_ranges`
--

DROP TABLE IF EXISTS `mac_track_ip_ranges`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_ip_ranges` (
  `ip_range` varchar(20) NOT NULL default '',
  `site_id` int(10) unsigned NOT NULL default '0',
  `ips_max` int(10) unsigned NOT NULL default '0',
  `ips_current` int(10) unsigned NOT NULL default '0',
  `ips_max_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `ips_current_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ip_range`,`site_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_ip_ranges`
--

LOCK TABLES `mac_track_ip_ranges` WRITE;
/*!40000 ALTER TABLE `mac_track_ip_ranges` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_ip_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_ips`
--

DROP TABLE IF EXISTS `mac_track_ips`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_ips` (
  `site_id` int(10) unsigned NOT NULL default '0',
  `device_id` int(10) unsigned NOT NULL default '0',
  `hostname` varchar(40) NOT NULL default '',
  `description` varchar(100) NOT NULL default '',
  `port_number` varchar(10) NOT NULL default '',
  `mac_address` varchar(20) NOT NULL default '',
  `ip_address` varchar(20) NOT NULL default '',
  `dns_hostname` varchar(200) default '',
  `scan_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`scan_date`,`ip_address`,`mac_address`,`site_id`),
  KEY `ip` (`ip_address`),
  KEY `port_number` (`port_number`),
  KEY `mac` (`mac_address`),
  KEY `device_id` (`device_id`),
  KEY `site_id` (`site_id`),
  KEY `hostname` (`hostname`),
  KEY `scan_date` (`scan_date`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_ips`
--

LOCK TABLES `mac_track_ips` WRITE;
/*!40000 ALTER TABLE `mac_track_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_macauth`
--

DROP TABLE IF EXISTS `mac_track_macauth`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_macauth` (
  `mac_address` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `added_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `added_by` varchar(20) NOT NULL,
  PRIMARY KEY  (`mac_address`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_macauth`
--

LOCK TABLES `mac_track_macauth` WRITE;
/*!40000 ALTER TABLE `mac_track_macauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_macauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_macwatch`
--

DROP TABLE IF EXISTS `mac_track_macwatch`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_macwatch` (
  `mac_address` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ticket_number` varchar(45) NOT NULL,
  `notify_schedule` tinyint(3) unsigned NOT NULL,
  `e-mail_addresses` varchar(255) NOT NULL,
  `discovered` tinyint(3) unsigned NOT NULL,
  `date_first_seen` timestamp NOT NULL default '0000-00-00 00:00:00',
  `data_last_seen` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`mac_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_macwatch`
--

LOCK TABLES `mac_track_macwatch` WRITE;
/*!40000 ALTER TABLE `mac_track_macwatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_macwatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_oui_database`
--

DROP TABLE IF EXISTS `mac_track_oui_database`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_oui_database` (
  `vendor_mac` varchar(8) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `vendor_address` text NOT NULL,
  `present` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`vendor_mac`),
  KEY `vendor_name` (`vendor_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_oui_database`
--

LOCK TABLES `mac_track_oui_database` WRITE;
/*!40000 ALTER TABLE `mac_track_oui_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_oui_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_ports`
--

DROP TABLE IF EXISTS `mac_track_ports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_ports` (
  `site_id` int(10) unsigned NOT NULL default '0',
  `device_id` int(10) unsigned NOT NULL default '0',
  `hostname` varchar(40) NOT NULL default '',
  `description` varchar(100) NOT NULL default '',
  `vlan_id` varchar(5) NOT NULL default 'N/A',
  `vlan_name` varchar(50) NOT NULL default '',
  `mac_address` varchar(20) NOT NULL default '',
  `vendor_mac` varchar(8) default NULL,
  `ip_address` varchar(20) NOT NULL default '',
  `dns_hostname` varchar(200) default '',
  `port_number` varchar(10) NOT NULL default '',
  `port_name` varchar(50) NOT NULL default '',
  `scan_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `authorized` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`port_number`,`scan_date`,`mac_address`,`device_id`),
  KEY `site_id` (`site_id`),
  KEY `description` (`description`),
  KEY `mac` (`mac_address`),
  KEY `hostname` (`hostname`),
  KEY `vlan_name` (`vlan_name`),
  KEY `vlan_id` (`vlan_id`),
  KEY `device_id` (`device_id`),
  KEY `ip_address` (`ip_address`),
  KEY `port_name` (`port_name`),
  KEY `dns_hostname` (`dns_hostname`),
  KEY `vendor_mac` (`vendor_mac`),
  KEY `authorized` (`authorized`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Database for Tracking Device MAC''s';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_ports`
--

LOCK TABLES `mac_track_ports` WRITE;
/*!40000 ALTER TABLE `mac_track_ports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_ports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_processes`
--

DROP TABLE IF EXISTS `mac_track_processes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_processes` (
  `device_id` int(11) NOT NULL default '0',
  `process_id` int(10) unsigned default NULL,
  `status` varchar(20) NOT NULL default 'Queued',
  `start_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`device_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_processes`
--

LOCK TABLES `mac_track_processes` WRITE;
/*!40000 ALTER TABLE `mac_track_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_scan_dates`
--

DROP TABLE IF EXISTS `mac_track_scan_dates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_scan_dates` (
  `scan_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`scan_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_scan_dates`
--

LOCK TABLES `mac_track_scan_dates` WRITE;
/*!40000 ALTER TABLE `mac_track_scan_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_scan_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_scanning_functions`
--

DROP TABLE IF EXISTS `mac_track_scanning_functions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_scanning_functions` (
  `scanning_function` varchar(100) NOT NULL default '',
  `type` int(10) unsigned NOT NULL default '0',
  `description` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`scanning_function`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Registered Scanning Functions';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_scanning_functions`
--

LOCK TABLES `mac_track_scanning_functions` WRITE;
/*!40000 ALTER TABLE `mac_track_scanning_functions` DISABLE KEYS */;
INSERT INTO `mac_track_scanning_functions` VALUES ('Not Applicable - Router',1,''),('get_generic_dot1q_switch_ports',1,''),('get_generic_switch_ports',1,''),('get_generic_wireless_ports',1,''),('get_cabletron_switch_ports',1,''),('get_repeater_rev4_ports',1,''),('get_catalyst_dot1dTpFdbEntry_ports',1,''),('get_IOS_dot1dTpFdbEntry_ports',1,''),('get_norbay_switch_ports',1,''),('get_procurve_switch_ports',1,''),('get_foundry_switch_ports',1,''),('Not Applicable - Hub/Switch',2,''),('get_standard_arp_table',2,'');
/*!40000 ALTER TABLE `mac_track_scanning_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_sites`
--

DROP TABLE IF EXISTS `mac_track_sites`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_sites` (
  `site_id` int(10) unsigned NOT NULL auto_increment,
  `site_name` varchar(100) NOT NULL default '',
  `total_devices` int(10) unsigned NOT NULL default '0',
  `total_device_errors` int(10) unsigned NOT NULL default '0',
  `total_macs` int(10) unsigned NOT NULL default '0',
  `total_ips` int(10) unsigned NOT NULL default '0',
  `total_user_ports` int(11) NOT NULL default '0',
  `total_oper_ports` int(10) unsigned NOT NULL default '0',
  `total_trunk_ports` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_sites`
--

LOCK TABLES `mac_track_sites` WRITE;
/*!40000 ALTER TABLE `mac_track_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_track_temp_ports`
--

DROP TABLE IF EXISTS `mac_track_temp_ports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mac_track_temp_ports` (
  `site_id` int(10) unsigned NOT NULL default '0',
  `device_id` int(10) unsigned NOT NULL default '0',
  `hostname` varchar(40) NOT NULL default '',
  `description` varchar(100) NOT NULL default '',
  `vlan_id` varchar(5) NOT NULL default 'N/A',
  `vlan_name` varchar(50) NOT NULL default '',
  `mac_address` varchar(20) NOT NULL default '',
  `vendor_mac` varchar(8) default NULL,
  `ip_address` varchar(20) NOT NULL default '',
  `dns_hostname` varchar(200) default '',
  `port_number` varchar(10) NOT NULL default '',
  `port_name` varchar(50) NOT NULL default '',
  `scan_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `updated` tinyint(3) unsigned NOT NULL default '0',
  `authorized` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`port_number`,`scan_date`,`mac_address`,`device_id`),
  KEY `site_id` (`site_id`),
  KEY `description` (`description`),
  KEY `ip_address` (`ip_address`),
  KEY `hostname` (`hostname`),
  KEY `vlan_name` (`vlan_name`),
  KEY `vlan_id` (`vlan_id`),
  KEY `device_id` (`device_id`),
  KEY `mac` (`mac_address`),
  KEY `updated` (`updated`),
  KEY `vendor_mac` (`vendor_mac`),
  KEY `authorized` (`authorized`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1 COMMENT='Database for Storing Temporary Results for Tracking Device M';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mac_track_temp_ports`
--

LOCK TABLES `mac_track_temp_ports` WRITE;
/*!40000 ALTER TABLE `mac_track_temp_ports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_track_temp_ports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_color_templates`
--

DROP TABLE IF EXISTS `plugin_color_templates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_color_templates` (
  `color_template_id` mediumint(8) unsigned NOT NULL auto_increment COMMENT 'Index',
  `name` varchar(255) NOT NULL COMMENT 'Name of Template',
  PRIMARY KEY  (`color_template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Names of Aggregate Templates';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_color_templates`
--

LOCK TABLES `plugin_color_templates` WRITE;
/*!40000 ALTER TABLE `plugin_color_templates` DISABLE KEYS */;
INSERT INTO `plugin_color_templates` VALUES (1,'Yellow: light -> dark, 4 colors'),(2,'Red: light yellow > dark red, 8 colors'),(3,'Red: light -> dark, 16 colors'),(4,'Green: dark -> light, 16 colors');
/*!40000 ALTER TABLE `plugin_color_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_color_templates_item`
--

DROP TABLE IF EXISTS `plugin_color_templates_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_color_templates_item` (
  `color_template_item_id` int(12) unsigned NOT NULL auto_increment,
  `color_template_id` mediumint(8) unsigned NOT NULL default '0',
  `color_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`color_template_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1 PACK_KEYS=0 COMMENT='Stores the actual aggregate item data.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_color_templates_item`
--

LOCK TABLES `plugin_color_templates_item` WRITE;
/*!40000 ALTER TABLE `plugin_color_templates_item` DISABLE KEYS */;
INSERT INTO `plugin_color_templates_item` VALUES (1,1,4,1),(2,1,24,2),(3,1,98,3),(4,1,25,4),(5,2,25,1),(6,2,29,2),(7,2,30,3),(8,2,31,4),(9,2,33,5),(10,2,35,6),(11,2,41,7),(12,2,9,8),(13,3,15,1),(14,3,31,2),(15,3,28,3),(16,3,8,4),(17,3,34,5),(18,3,33,6),(19,3,35,7),(20,3,41,8),(21,3,36,9),(22,3,42,10),(23,3,44,11),(24,3,48,12),(25,3,9,13),(26,3,49,14),(27,3,51,15),(28,3,52,16),(29,4,76,1),(30,4,84,2),(31,4,89,3),(32,4,17,4),(33,4,86,5),(34,4,88,6),(35,4,90,7),(36,4,94,8),(37,4,96,9),(38,4,93,10),(39,4,91,11),(40,4,22,12),(41,4,12,13),(42,4,95,14),(43,4,6,15),(44,4,92,16);
/*!40000 ALTER TABLE `plugin_color_templates_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_config`
--

DROP TABLE IF EXISTS `plugin_config`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_config` (
  `id` int(8) NOT NULL auto_increment,
  `directory` varchar(32) NOT NULL default '',
  `name` varchar(64) NOT NULL default '',
  `status` tinyint(2) NOT NULL default '0',
  `author` varchar(64) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  `version` varchar(8) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`),
  KEY `directory` (`directory`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_config`
--

LOCK TABLES `plugin_config` WRITE;
/*!40000 ALTER TABLE `plugin_config` DISABLE KEYS */;
INSERT INTO `plugin_config` VALUES (1,'thold','Thresholds',1,'Jimmy Conner','http://cactiusers.org','0.4'),(2,'aggregate','Create Aggregate Graphs',1,'Reinhard Scheck','http://forums.cacti.net/about19474.html','0.65'),(3,'boost','Large Site Performane Booster for Cacti',1,'Larry Adams','http://www.cacti.net','2.2'),(4,'monitor','Device Monitoring',1,'Jimmy Conner','http://cactiusers.org','0.9');
/*!40000 ALTER TABLE `plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_db_changes`
--

DROP TABLE IF EXISTS `plugin_db_changes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_db_changes` (
  `id` int(10) NOT NULL auto_increment,
  `plugin` varchar(16) NOT NULL default '',
  `table` varchar(64) NOT NULL default '',
  `column` varchar(64) NOT NULL,
  `method` varchar(16) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `plugin` (`plugin`),
  KEY `method` (`method`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_db_changes`
--

LOCK TABLES `plugin_db_changes` WRITE;
/*!40000 ALTER TABLE `plugin_db_changes` DISABLE KEYS */;
INSERT INTO `plugin_db_changes` VALUES (1,'thold','thold_data','','create'),(2,'thold','thold_template','','create'),(3,'thold','plugin_thold_contacts','','create'),(4,'thold','plugin_thold_template_contact','','create'),(5,'thold','plugin_thold_threshold_contact','','create'),(6,'thold','plugin_thold_log','','create'),(7,'aggregate','plugin_aggregate_color_templates','','create'),(8,'aggregate','plugin_aggregate_color_template_items','','create'),(9,'thold','thold_data','','create'),(10,'thold','thold_template','','create'),(11,'thold','plugin_thold_contacts','','create'),(12,'thold','plugin_thold_template_contact','','create'),(13,'thold','plugin_thold_threshold_contact','','create'),(14,'thold','plugin_thold_log','','create'),(15,'thold','thold_data','time_hi','addcolumn'),(16,'thold','thold_data','time_low','addcolumn'),(17,'thold','thold_data','time_fail_trigger','addcolumn'),(18,'thold','thold_data','time_fail_length','addcolumn'),(19,'thold','thold_data','thold_type','addcolumn'),(20,'thold','thold_template','time_hi','addcolumn'),(21,'thold','thold_template','time_low','addcolumn'),(22,'thold','thold_template','time_fail_trigger','addcolumn'),(23,'thold','thold_template','time_fail_length','addcolumn'),(24,'thold','thold_template','thold_type','addcolumn');
/*!40000 ALTER TABLE `plugin_db_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_discover_hosts`
--

DROP TABLE IF EXISTS `plugin_discover_hosts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_discover_hosts` (
  `hostname` varchar(100) NOT NULL default '',
  `ip` varchar(17) NOT NULL default '',
  `hash` varchar(12) NOT NULL default '',
  `community` varchar(100) NOT NULL default '',
  `snmp_version` varchar(3) NOT NULL default '',
  `snmp_username` varchar(64) NOT NULL default '',
  `snmp_password` varchar(256) NOT NULL default '',
  `snmp_auth_protocol` varchar(6) NOT NULL default '',
  `snmp_priv_passphrase` varchar(256) NOT NULL default '',
  `snmp_priv_protocol` varchar(12) NOT NULL default '',
  `snmp_context` varchar(256) NOT NULL default '',
  `sysName` varchar(100) NOT NULL default '',
  `sysLocation` varchar(255) NOT NULL default '',
  `sysContact` varchar(255) NOT NULL default '',
  `sysDescr` varchar(255) NOT NULL default '',
  `sysUptime` int(32) NOT NULL default '0',
  `os` varchar(64) NOT NULL default '',
  `snmp` tinyint(4) NOT NULL default '0',
  `known` tinyint(4) NOT NULL default '0',
  `up` tinyint(4) NOT NULL default '0',
  `time` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ip`),
  KEY `snmp` (`snmp`),
  KEY `os` (`os`),
  KEY `known` (`known`),
  KEY `hash` (`hash`),
  KEY `up` (`up`),
  KEY `hostname` (`hostname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_discover_hosts`
--

LOCK TABLES `plugin_discover_hosts` WRITE;
/*!40000 ALTER TABLE `plugin_discover_hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_discover_hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_discover_template`
--

DROP TABLE IF EXISTS `plugin_discover_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_discover_template` (
  `id` int(8) NOT NULL auto_increment,
  `host_template` int(8) NOT NULL default '0',
  `tree` int(12) NOT NULL default '0',
  `snmp_version` tinyint(3) NOT NULL default '1',
  `sysdescr` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_discover_template`
--

LOCK TABLES `plugin_discover_template` WRITE;
/*!40000 ALTER TABLE `plugin_discover_template` DISABLE KEYS */;
INSERT INTO `plugin_discover_template` VALUES (1,11,1000001,1,'');
/*!40000 ALTER TABLE `plugin_discover_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_flowview_devices`
--

DROP TABLE IF EXISTS `plugin_flowview_devices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_flowview_devices` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `folder` varchar(64) NOT NULL,
  `allowfrom` varchar(32) NOT NULL default '0',
  `port` int(12) NOT NULL,
  `nesting` varchar(4) NOT NULL default '-1',
  `version` varchar(12) NOT NULL default '5',
  `rotation` int(12) NOT NULL default '1439',
  `expire` int(3) NOT NULL default '7',
  `compression` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `folder` (`folder`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_flowview_devices`
--

LOCK TABLES `plugin_flowview_devices` WRITE;
/*!40000 ALTER TABLE `plugin_flowview_devices` DISABLE KEYS */;
INSERT INTO `plugin_flowview_devices` VALUES (1,'Default','Router','0',2055,'-1','5',1439,7,0);
/*!40000 ALTER TABLE `plugin_flowview_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_flowview_dnscache`
--

DROP TABLE IF EXISTS `plugin_flowview_dnscache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_flowview_dnscache` (
  `ip` varchar(32) NOT NULL default '',
  `host` varchar(255) NOT NULL default '',
  `time` int(20) NOT NULL default '0',
  KEY `ip` (`ip`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_flowview_dnscache`
--

LOCK TABLES `plugin_flowview_dnscache` WRITE;
/*!40000 ALTER TABLE `plugin_flowview_dnscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_flowview_dnscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_flowview_queries`
--

DROP TABLE IF EXISTS `plugin_flowview_queries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_flowview_queries` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `device` varchar(32) NOT NULL,
  `startdate` varchar(32) NOT NULL,
  `starttime` varchar(32) NOT NULL,
  `enddate` varchar(32) NOT NULL,
  `endtime` varchar(32) NOT NULL,
  `tosfields` varchar(32) NOT NULL,
  `tcpflags` varchar(32) NOT NULL,
  `protocols` varchar(8) NOT NULL,
  `sourceip` varchar(255) NOT NULL,
  `sourceport` varchar(255) NOT NULL,
  `sourceinterface` varchar(64) NOT NULL,
  `sourceas` varchar(64) NOT NULL,
  `destip` varchar(255) NOT NULL,
  `destport` varchar(255) NOT NULL,
  `destinterface` varchar(64) NOT NULL,
  `destas` varchar(64) NOT NULL,
  `statistics` int(3) NOT NULL,
  `printed` int(3) NOT NULL,
  `includeif` int(2) NOT NULL,
  `sortfield` int(2) NOT NULL,
  `cutofflines` int(4) NOT NULL,
  `cutoffoctets` varchar(8) NOT NULL,
  `resolve` varchar(2) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_flowview_queries`
--

LOCK TABLES `plugin_flowview_queries` WRITE;
/*!40000 ALTER TABLE `plugin_flowview_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_flowview_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_flowview_schedules`
--

DROP TABLE IF EXISTS `plugin_flowview_schedules`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_flowview_schedules` (
  `id` int(12) NOT NULL auto_increment,
  `enabled` varchar(3) NOT NULL default 'on',
  `sendinterval` int(20) NOT NULL,
  `lastsent` int(20) NOT NULL,
  `start` datetime NOT NULL,
  `email` text NOT NULL,
  `savedquery` int(12) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `savedquery` (`savedquery`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_flowview_schedules`
--

LOCK TABLES `plugin_flowview_schedules` WRITE;
/*!40000 ALTER TABLE `plugin_flowview_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_flowview_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_hooks`
--

DROP TABLE IF EXISTS `plugin_hooks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_hooks` (
  `id` int(8) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `hook` varchar(64) NOT NULL default '',
  `file` varchar(255) NOT NULL default '',
  `function` varchar(128) NOT NULL default '',
  `status` int(8) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_hooks`
--

LOCK TABLES `plugin_hooks` WRITE;
/*!40000 ALTER TABLE `plugin_hooks` DISABLE KEYS */;
INSERT INTO `plugin_hooks` VALUES (1,'internal','config_arrays','','plugin_config_arrays',1),(2,'internal','draw_navigation_text','','plugin_draw_navigation_text',1),(3,'thold','top_header_tabs','includes/tab.php','thold_show_tab',1),(4,'thold','top_graph_header_tabs','includes/tab.php','thold_show_tab',1),(5,'thold','config_arrays','includes/settings.php','thold_config_arrays',1),(6,'thold','config_settings','includes/settings.php','thold_config_settings',1),(7,'thold','draw_navigation_text','includes/settings.php','thold_draw_navigation_text',1),(8,'thold','data_sources_table','setup.php','thold_data_sources_table',1),(9,'thold','graphs_new_top_links','setup.php','thold_graphs_new',1),(10,'thold','api_device_save','setup.php','thold_api_device_save',1),(11,'thold','update_host_status','includes/polling.php','thold_update_host_status',1),(12,'thold','poller_output','includes/polling.php','thold_poller_output',1),(13,'thold','device_action_array','setup.php','thold_device_action_array',1),(14,'thold','device_action_execute','setup.php','thold_device_action_execute',1),(15,'thold','device_action_prepare','setup.php','thold_device_action_prepare',1),(16,'thold','user_admin_setup_sql_save','setup.php','thold_user_admin_setup_sql_save',1),(17,'thold','poller_bottom','includes/polling.php','thold_poller_bottom',1),(18,'thold','user_admin_edit','setup.php','thold_user_admin_edit',1),(19,'thold','rrd_graph_graph_options','setup.php','thold_rrd_graph_graph_options',1),(20,'thold','graph_buttons','setup.php','thold_graph_button',1),(21,'thold','data_source_action_array','setup.php','thold_data_source_action_array',1),(22,'thold','data_source_action_prepare','setup.php','thold_data_source_action_prepare',1),(23,'thold','data_source_action_execute','setup.php','thold_data_source_action_execute',1),(24,'thold','graphs_action_array','setup.php','thold_graphs_action_array',1),(25,'thold','graphs_action_prepare','setup.php','thold_graphs_action_prepare',1),(26,'thold','graphs_action_execute','setup.php','thold_graphs_action_execute',1),(27,'aggregate','config_arrays','setup.php','aggregate_config_arrays',1),(28,'aggregate','config_form','setup.php','aggregate_config_form',1),(29,'aggregate','draw_navigation_text','setup.php','aggregate_draw_navigation_text',1),(30,'aggregate','graphs_action_array','setup.php','aggregate_graphs_action_array',1),(31,'aggregate','graphs_action_prepare','setup.php','aggregate_graphs_action_prepare',1),(32,'aggregate','graphs_action_execute','setup.php','aggregate_graphs_action_execute',1),(33,'boost','config_arrays','setup.php','boost_config_arrays',1),(34,'boost','config_settings','setup.php','boost_config_settings',1),(35,'boost','poller_on_demand','setup.php','boost_poller_on_demand',1),(36,'boost','poller_bottom','setup.php','boost_poller_bottom',1),(37,'boost','draw_navigation_text','setup.php','boost_draw_navigation_text',1),(38,'boost','rrdtool_function_graph_cache_check','setup.php','boost_graph_cache_check',1),(39,'boost','rrdtool_function_graph_set_file','setup.php','boost_graph_set_file',1),(40,'boost','prep_graph_array','setup.php','boost_prep_graph_array',1),(41,'boost','utilities_list','setup.php','boost_utilities_list',1),(42,'boost','utilities_action','setup.php','boost_utilities_action',1),(43,'monitor','top_header_tabs','setup.php','monitor_show_tab',1),(44,'monitor','top_graph_header_tabs','setup.php','monitor_show_tab',1),(45,'monitor','draw_navigation_text','setup.php','monitor_draw_navigation_text',1),(46,'monitor','config_form','setup.php','monitor_config_form',1),(47,'monitor','api_device_save','setup.php','monitor_api_device_save',1),(48,'monitor','top_graph_refresh','setup.php','monitor_top_graph_refresh',1),(49,'monitor','config_settings','setup.php','monitor_config_settings',1),(50,'monitor','device_action_array','setup.php','monitor_device_action_array',1),(51,'monitor','device_action_execute','setup.php','monitor_device_action_execute',1),(52,'monitor','device_action_prepare','setup.php','monitor_device_action_prepare',1);
/*!40000 ALTER TABLE `plugin_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_realms`
--

DROP TABLE IF EXISTS `plugin_realms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_realms` (
  `id` int(8) NOT NULL auto_increment,
  `plugin` varchar(32) NOT NULL default '',
  `file` text NOT NULL,
  `display` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `plugin` (`plugin`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_realms`
--

LOCK TABLES `plugin_realms` WRITE;
/*!40000 ALTER TABLE `plugin_realms` DISABLE KEYS */;
INSERT INTO `plugin_realms` VALUES (1,'internal','plugins.php','Plugin Management'),(2,'thold','thold.php,listthold.php,thold_add.php','Configure Thresholds'),(3,'thold','thold_graph.php,graph_thold.php,thold_view_failures.php,thold_view_normal.php,thold_view_recover.php,thold_view_recent.php,thold_view_host.php','View Thresholds'),(4,'thold','thold_templates.php','Configure Threshold Templates'),(5,'aggregate','aggregate_templates.php,aggregate_templates_items.php,color_templates.php,color_templates_items.php','Plugin Aggregate -> Create Color Templates'),(6,'monitor','monitor.php','View Monitoring');
/*!40000 ALTER TABLE `plugin_realms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_routerconfigs_accounts`
--

DROP TABLE IF EXISTS `plugin_routerconfigs_accounts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_routerconfigs_accounts` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_routerconfigs_accounts`
--

LOCK TABLES `plugin_routerconfigs_accounts` WRITE;
/*!40000 ALTER TABLE `plugin_routerconfigs_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_routerconfigs_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_routerconfigs_backups`
--

DROP TABLE IF EXISTS `plugin_routerconfigs_backups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_routerconfigs_backups` (
  `id` int(12) NOT NULL auto_increment,
  `btime` int(18) NOT NULL,
  `device` int(12) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `config` longtext NOT NULL,
  `lastchange` int(24) NOT NULL,
  `username` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `btime` (`btime`),
  KEY `device` (`device`),
  KEY `directory` (`directory`),
  KEY `lastchange` (`lastchange`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_routerconfigs_backups`
--

LOCK TABLES `plugin_routerconfigs_backups` WRITE;
/*!40000 ALTER TABLE `plugin_routerconfigs_backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_routerconfigs_backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_routerconfigs_devices`
--

DROP TABLE IF EXISTS `plugin_routerconfigs_devices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_routerconfigs_devices` (
  `id` int(12) NOT NULL auto_increment,
  `enabled` varchar(2) NOT NULL default 'on',
  `ipaddress` varchar(128) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `directory` varchar(255) NOT NULL,
  `account` int(12) NOT NULL,
  `lastchange` int(24) NOT NULL,
  `username` varchar(128) NOT NULL,
  `schedule` int(6) NOT NULL default '1',
  `lasterror` varchar(255) NOT NULL,
  `lastbackup` int(18) NOT NULL,
  `lastattempt` int(18) NOT NULL,
  `devicetype` int(12) NOT NULL,
  `debug` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `enabled` (`enabled`),
  KEY `schedule` (`schedule`),
  KEY `ipaddress` (`ipaddress`),
  KEY `account` (`account`),
  KEY `lastbackup` (`lastbackup`),
  KEY `lastchange` (`lastchange`),
  KEY `lastattempt` (`lastattempt`),
  KEY `devicetype` (`devicetype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_routerconfigs_devices`
--

LOCK TABLES `plugin_routerconfigs_devices` WRITE;
/*!40000 ALTER TABLE `plugin_routerconfigs_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_routerconfigs_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_routerconfigs_devicetypes`
--

DROP TABLE IF EXISTS `plugin_routerconfigs_devicetypes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_routerconfigs_devicetypes` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `username` varchar(64) NOT NULL default 'sername:',
  `password` varchar(128) NOT NULL default 'assword:',
  `copytftp` varchar(64) NOT NULL default 'copy tftp run',
  `version` varchar(64) NOT NULL default 'show version',
  `confirm` varchar(64) NOT NULL default '',
  `forceconfirm` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_routerconfigs_devicetypes`
--

LOCK TABLES `plugin_routerconfigs_devicetypes` WRITE;
/*!40000 ALTER TABLE `plugin_routerconfigs_devicetypes` DISABLE KEYS */;
INSERT INTO `plugin_routerconfigs_devicetypes` VALUES (1,'Cisco IOS','sername:','assword:','copy run tftp','show version','y',0),(2,'Cisco CatOS','sername:','assword:','copy config tftp','','y',1);
/*!40000 ALTER TABLE `plugin_routerconfigs_devicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_thold_contacts`
--

DROP TABLE IF EXISTS `plugin_thold_contacts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_thold_contacts` (
  `id` int(12) NOT NULL auto_increment,
  `user_id` int(12) NOT NULL,
  `type` varchar(32) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_thold_contacts`
--

LOCK TABLES `plugin_thold_contacts` WRITE;
/*!40000 ALTER TABLE `plugin_thold_contacts` DISABLE KEYS */;
INSERT INTO `plugin_thold_contacts` VALUES (1,3,'email','T0900131@telkom.co.id');
/*!40000 ALTER TABLE `plugin_thold_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_thold_log`
--

DROP TABLE IF EXISTS `plugin_thold_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_thold_log` (
  `id` int(12) NOT NULL auto_increment,
  `time` int(24) NOT NULL,
  `host_id` int(10) NOT NULL,
  `graph_id` int(10) NOT NULL,
  `threshold_id` int(10) NOT NULL,
  `threshold_value` varchar(64) NOT NULL,
  `current` varchar(64) NOT NULL,
  `status` int(5) NOT NULL,
  `type` int(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `time` (`time`),
  KEY `host_id` (`host_id`),
  KEY `graph_id` (`graph_id`),
  KEY `threshold_id` (`threshold_id`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Table of All Threshold Breaches';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_thold_log`
--

LOCK TABLES `plugin_thold_log` WRITE;
/*!40000 ALTER TABLE `plugin_thold_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_thold_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_thold_template_contact`
--

DROP TABLE IF EXISTS `plugin_thold_template_contact`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_thold_template_contact` (
  `template_id` int(12) NOT NULL,
  `contact_id` int(12) NOT NULL,
  KEY `template_id` (`template_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Table of Tholds Template Contacts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_thold_template_contact`
--

LOCK TABLES `plugin_thold_template_contact` WRITE;
/*!40000 ALTER TABLE `plugin_thold_template_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_thold_template_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_thold_threshold_contact`
--

DROP TABLE IF EXISTS `plugin_thold_threshold_contact`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_thold_threshold_contact` (
  `thold_id` int(12) NOT NULL,
  `contact_id` int(12) NOT NULL,
  KEY `thold_id` (`thold_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Table of Tholds Threshold Contacts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_thold_threshold_contact`
--

LOCK TABLES `plugin_thold_threshold_contact` WRITE;
/*!40000 ALTER TABLE `plugin_thold_threshold_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_thold_threshold_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_update_info`
--

DROP TABLE IF EXISTS `plugin_update_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_update_info` (
  `plugin` varchar(32) default NULL,
  `name` varchar(32) default NULL,
  `version` varchar(24) default NULL,
  `author` varchar(64) default NULL,
  `homepage` varchar(64) default NULL,
  `email` varchar(64) default NULL,
  `released` varchar(18) default NULL,
  `changes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_update_info`
--

LOCK TABLES `plugin_update_info` WRITE;
/*!40000 ALTER TABLE `plugin_update_info` DISABLE KEYS */;
INSERT INTO `plugin_update_info` VALUES ('settings','Global Plugin Settings','0.5','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('boost','Large Site Performane Booster fo','2.2','Larry Adams','http://www.cacti.net','larryjadams@comcast.net\'',NULL,''),('monitor','Device Monitoring','0.8.2','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('discovery','Network Discovery','0.8.5','Jimmy Conner','http://cactiusers.org','\'',NULL,''),('tools','Network Tools','0.3','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('syslog','Syslog Monitoring','0.5.2','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('mactrack','Device Tracking','1.1','Larry Adams (TheWitness)','http://cacti.net','larryjadams@comcast.net\'',NULL,''),('loginmod','Login Page Mod','1.0','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('update','Update Checker','0.4','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('flowview','FlowView','0.6','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('hostinfo','Host Info','0.2','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('errorimage','Error Images','0.1','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('weathermap','PHP Network Weathermap','0.95b','Howard Jones','http://www.network-weathermap.com/','howie@thingy.com\'',NULL,''),('reportit','Cacti-ReportIt','0.6.1','Andreas Braun','http://sourceforge.net/projects/cacti-reportit/','browniebraun@cacti.cc\'',NULL,''),('routerconfigs','Router Configs','0.1','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('wmi','WMI Query','0.1','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,''),('realtime','Realtime for Cacti','0.35','Mathieu Virbel','http://capensis.org/','mathieu.v@capensis.fr\'',NULL,''),('cacti','Cacti','0.8.7c','Cacti Developers','http://cacti.net','\'',NULL,''),('cacti_plugin_arch','Plugin Architecture','2.2','Jimmy Conner','http://cactiusers.org','jimmy@sqmail.org\'',NULL,'');
/*!40000 ALTER TABLE `plugin_update_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_wmi_accounts`
--

DROP TABLE IF EXISTS `plugin_wmi_accounts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_wmi_accounts` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(256) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_wmi_accounts`
--

LOCK TABLES `plugin_wmi_accounts` WRITE;
/*!40000 ALTER TABLE `plugin_wmi_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_wmi_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_wmi_queries`
--

DROP TABLE IF EXISTS `plugin_wmi_queries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `plugin_wmi_queries` (
  `id` int(12) NOT NULL auto_increment,
  `name` varchar(64) NOT NULL,
  `queryname` varchar(64) NOT NULL,
  `indexkey` varchar(128) NOT NULL,
  `querykeys` varchar(256) NOT NULL,
  `queryclass` varchar(128) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `plugin_wmi_queries`
--

LOCK TABLES `plugin_wmi_queries` WRITE;
/*!40000 ALTER TABLE `plugin_wmi_queries` DISABLE KEYS */;
INSERT INTO `plugin_wmi_queries` VALUES (1,'Exchange Messages','exchangemessages','Name','MessagesDelivered,MessagesSent','Win32_PerfRawData_MSExchangeIS_MSExchangeISMailbox');
/*!40000 ALTER TABLE `plugin_wmi_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller`
--

DROP TABLE IF EXISTS `poller`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `hostname` varchar(250) NOT NULL default '',
  `ip_address` int(11) unsigned NOT NULL default '0',
  `last_update` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller`
--

LOCK TABLES `poller` WRITE;
/*!40000 ALTER TABLE `poller` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_command`
--

DROP TABLE IF EXISTS `poller_command`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_command` (
  `poller_id` smallint(5) unsigned NOT NULL default '0',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `action` tinyint(3) unsigned NOT NULL default '0',
  `command` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`poller_id`,`action`,`command`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_command`
--

LOCK TABLES `poller_command` WRITE;
/*!40000 ALTER TABLE `poller_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_item`
--

DROP TABLE IF EXISTS `poller_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_item` (
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `poller_id` smallint(5) unsigned NOT NULL default '0',
  `host_id` mediumint(8) NOT NULL default '0',
  `action` tinyint(2) unsigned NOT NULL default '1',
  `hostname` varchar(250) NOT NULL default '',
  `snmp_community` varchar(100) NOT NULL default '',
  `snmp_version` tinyint(1) unsigned NOT NULL default '0',
  `snmp_username` varchar(50) NOT NULL default '',
  `snmp_password` varchar(50) NOT NULL default '',
  `snmp_auth_protocol` varchar(5) NOT NULL default '',
  `snmp_priv_passphrase` varchar(200) NOT NULL default '',
  `snmp_priv_protocol` varchar(6) NOT NULL default '',
  `snmp_context` varchar(64) default '',
  `snmp_port` mediumint(5) unsigned NOT NULL default '161',
  `snmp_timeout` mediumint(8) unsigned NOT NULL default '0',
  `rrd_name` varchar(19) NOT NULL default '',
  `rrd_path` varchar(255) NOT NULL default '',
  `rrd_num` tinyint(2) unsigned NOT NULL default '0',
  `rrd_step` mediumint(8) NOT NULL default '300',
  `rrd_next_step` mediumint(8) NOT NULL default '0',
  `arg1` text,
  `arg2` varchar(255) default NULL,
  `arg3` varchar(255) default NULL,
  PRIMARY KEY  (`local_data_id`,`rrd_name`),
  KEY `local_data_id` (`local_data_id`),
  KEY `host_id` (`host_id`),
  KEY `rrd_next_step` (`rrd_next_step`),
  KEY `action` (`action`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_item`
--

LOCK TABLES `poller_item` WRITE;
/*!40000 ALTER TABLE `poller_item` DISABLE KEYS */;
INSERT INTO `poller_item` VALUES (19,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'mem_buffers','/var/www/html/rra/localhost_mem_buffers_19.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/linux_memory.pl MemFree:','',''),(20,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'mem_swap','/var/www/html/rra/localhost_mem_swap_20.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/linux_memory.pl SwapFree:','',''),(21,0,1,2,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_rrdsprocessed_21.rrd',1,60,-240,'/var/www/html/scripts/ss_poller.php ss_poller','',''),(22,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_total_22.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/plugins/syslog/syslog_counter.php','',''),(23,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_load_1min_23.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/loadavg_multi.pl','',''),(24,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'users','/var/www/html/rra/localhost_users_24.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/unix_users.pl ','',''),(25,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'proc','/var/www/html/rra/localhost_proc_25.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/unix_processes.pl','',''),(196,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_nice','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_nice_196.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.51.0','',''),(197,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_system','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_system_197.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.52.0','',''),(198,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_user','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_user_198.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.50.0','',''),(199,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/dev-os3-v2_-_divre_2__key_read_requests_199.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teindexusage 10.32.18.97 os3 telkombaru','',''),(200,0,11,0,'172.16.203.12','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/jatinegara_1_traffic_in_200.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.4','',''),(200,0,11,0,'172.16.203.12','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/jatinegara_1_traffic_in_200.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.4','',''),(201,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/jatinegara_1_traffic_in_201.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.2','',''),(201,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/jatinegara_1_traffic_in_201.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.2','',''),(202,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/jatinegara_1_traffic_in_202.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.3','',''),(202,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/jatinegara_1_traffic_in_202.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.3','',''),(203,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/jatinegara_1_traffic_in_203.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.4','',''),(203,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/jatinegara_1_traffic_in_203.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.4','',''),(204,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/jatinegara_1_traffic_in_204.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.5','',''),(204,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/jatinegara_1_traffic_in_204.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.5','',''),(205,0,15,0,'172.16.203.22','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/gambir_2_traffic_in_205.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.4','',''),(205,0,15,0,'172.16.203.22','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/gambir_2_traffic_in_205.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.4','',''),(206,0,14,0,'172.16.203.21','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/gambir_1_traffic_in_206.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.2','',''),(206,0,14,0,'172.16.203.21','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/gambir_1_traffic_in_206.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.2','',''),(207,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/localhost_traffic_in_207.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.2','',''),(208,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/localhost_traffic_in_208.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.1','',''),(209,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'cpu_nice','/var/www/html/rra/localhost_cpu_nice_209.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.51.0','',''),(210,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'cpu_system','/var/www/html/rra/localhost_cpu_system_210.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.52.0','',''),(211,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'cpu_user','/var/www/html/rra/localhost_cpu_user_211.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.50.0','',''),(212,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_key_read_requests_212.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teindexusage localhost cactiuser CactiMadeEZ','',''),(213,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_questions_213.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tenetwork localhost cactiuser CactiMadeEZ','',''),(214,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_qcache_free_blocks_214.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tequerycache localhost cactiuser CactiMadeEZ','',''),(215,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_handler_read_first_215.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teselecthandler localhost cactiuser CactiMadeEZ','',''),(216,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_com_select_216.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teselectquery localhost cactiuser CactiMadeEZ','',''),(217,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_sort_merge_passes_217.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tesorts localhost cactiuser CactiMadeEZ','',''),(218,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_createdtmpdisktable_218.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tetempobjects localhost cactiuser CactiMadeEZ','',''),(219,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_219.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.1','',''),(220,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_220.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.4','',''),(221,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_nice','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_nice_221.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.51.0','',''),(222,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_system','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_system_222.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.52.0','',''),(223,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_user','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_user_223.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.50.0','',''),(224,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/dev-os3-v2_-_divre_2__key_read_requests_224.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teindexusage 10.32.18.97 cactiuser CactiMadeEZ','',''),(225,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_free_pages_225.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb localhost cactiuser CactiMadeEZ','',''),(226,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_file_writes_226.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb localhost cactiuser CactiMadeEZ','',''),(227,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_insbuffer_merged_227.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb localhost cactiuser CactiMadeEZ','',''),(228,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_os_waits_228.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb localhost cactiuser CactiMadeEZ','',''),(229,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_rows_read_229.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb localhost cactiuser CactiMadeEZ','',''),(230,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'loadavg_1','/var/www/html/rra/localhost_loadavg_1_230.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.1','',''),(231,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'loadavg_15','/var/www/html/rra/localhost_loadavg_15_231.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.3','',''),(232,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'loadavg_5','/var/www/html/rra/localhost_loadavg_5_232.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.2','',''),(233,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_table_locks_immedia_233.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php telockingandslow localhost cactiuser CactiMadeEZ','',''),(234,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_select_234.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php command localhost cactiuser CactiMadeEZ','',''),(235,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_read_key_235.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php handler localhost cactiuser CactiMadeEZ','',''),(236,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_binlogcacheuse_236.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tereplication localhost cactiuser CactiMadeEZ','',''),(237,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_threads_cached_237.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tethreadsabends localhost cactiuser CactiMadeEZ','',''),(238,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_handler_commit_238.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tevolatilehandler localhost cactiuser CactiMadeEZ','',''),(239,0,1,1,'localhost','public',2,'','','MD5','','DES','',161,500,'','/var/www/html/rra/localhost_com_delete_239.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tevolatilequery localhost cactiuser CactiMadeEZ','',''),(246,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/os3_divre_2_traffic_in_246.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.1','',''),(247,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/os3_divre_2_traffic_in_247.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.2','',''),(248,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/os3_divre_2_traffic_in_248.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.3','',''),(249,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/os3_divre_2_traffic_in_249.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.4','',''),(250,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'cpu_nice','/var/www/html/rra/os3_divre_2_cpu_nice_250.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.51.0','',''),(251,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'cpu_system','/var/www/html/rra/os3_divre_2_cpu_system_251.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.52.0','',''),(252,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'cpu_user','/var/www/html/rra/os3_divre_2_cpu_user_252.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.50.0','',''),(253,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_key_read_requests_253.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teindexusage os3.divre2.telkom.co.id os3 telkombaru','',''),(254,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_free_pages_254.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb os3.divre2.telkom.co.id os3 telkombaru','',''),(255,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_file_writes_255.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb os3.divre2.telkom.co.id os3 telkombaru','',''),(256,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_insbuffer_merged_256.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb os3.divre2.telkom.co.id os3 telkombaru','',''),(257,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_os_waits_257.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb os3.divre2.telkom.co.id os3 telkombaru','',''),(258,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_rows_read_258.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb os3.divre2.telkom.co.id os3 telkombaru','',''),(259,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'loadavg_1','/var/www/html/rra/os3_divre_2_loadavg_1_259.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.1','',''),(260,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'loadavg_15','/var/www/html/rra/os3_divre_2_loadavg_15_260.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.3','',''),(261,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'loadavg_5','/var/www/html/rra/os3_divre_2_loadavg_5_261.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.2','',''),(262,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_table_locks_immedia_262.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php telockingandslow os3.divre2.telkom.co.id os3 telkombaru','',''),(263,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_questions_263.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tenetwork os3.divre2.telkom.co.id os3 telkombaru','',''),(264,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_select_264.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php command os3.divre2.telkom.co.id os3 telkombaru','',''),(265,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_read_key_265.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php handler os3.divre2.telkom.co.id os3 telkombaru','',''),(266,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_qcache_free_blocks_266.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tequerycache os3.divre2.telkom.co.id os3 telkombaru','',''),(267,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_binlogcacheuse_267.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tereplication os3.divre2.telkom.co.id os3 telkombaru','',''),(268,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_handler_read_first_268.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teselecthandler os3.divre2.telkom.co.id os3 telkombaru','',''),(269,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_com_select_269.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teselectquery os3.divre2.telkom.co.id os3 telkombaru','',''),(270,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_sort_merge_passes_270.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tesorts os3.divre2.telkom.co.id os3 telkombaru','',''),(271,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_createdtmpdisktable_271.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tetempobjects os3.divre2.telkom.co.id os3 telkombaru','',''),(272,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_threads_cached_272.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tethreadsabends os3.divre2.telkom.co.id os3 telkombaru','',''),(273,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_handler_commit_273.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tevolatilehandler os3.divre2.telkom.co.id os3 telkombaru','',''),(274,0,5,1,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3_divre_2_com_delete_274.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tevolatilequery os3.divre2.telkom.co.id os3 telkombaru','',''),(275,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/jatinegara_1_traffic_in_275.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.1','',''),(275,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/jatinegara_1_traffic_in_275.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.1','',''),(276,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/jatinegara_1_traffic_in_276.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.6','',''),(276,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/jatinegara_1_traffic_in_276.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.6','',''),(287,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'cpu_nice','/var/www/html/rra/jatinegara_1_cpu_nice_287.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.51.0','',''),(288,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'cpu_system','/var/www/html/rra/jatinegara_1_cpu_system_288.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.52.0','',''),(289,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'cpu_user','/var/www/html/rra/jatinegara_1_cpu_user_289.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.50.0','',''),(290,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_key_read_requests_290.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teindexusage 172.16.203.11 radspeedy2 telkomspeedy2','',''),(291,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_free_pages_291.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb 172.16.203.11 radspeedy2 telkomspeedy2','',''),(292,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_file_writes_292.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb 172.16.203.11 radspeedy2 telkomspeedy2','',''),(293,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_insbuffer_merged_293.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb 172.16.203.11 radspeedy2 telkomspeedy2','',''),(294,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_os_waits_294.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb 172.16.203.11 radspeedy2 telkomspeedy2','',''),(295,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_rows_read_295.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php innodb 172.16.203.11 radspeedy2 telkomspeedy2','',''),(296,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'loadavg_1','/var/www/html/rra/jatinegara_1_loadavg_1_296.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.1','',''),(297,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'loadavg_15','/var/www/html/rra/jatinegara_1_loadavg_15_297.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.3','',''),(298,0,12,0,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'loadavg_5','/var/www/html/rra/jatinegara_1_loadavg_5_298.rrd',1,60,-240,'.1.3.6.1.4.1.2021.10.1.3.2','',''),(299,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_table_locks_immedia_299.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php telockingandslow 172.16.203.11 radspeedy2 telkomspeedy2','',''),(300,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_questions_300.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tenetwork 172.16.203.11 radspeedy2 telkomspeedy2','',''),(301,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_select_301.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php command 172.16.203.11 radspeedy2 telkomspeedy2','',''),(302,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_read_key_302.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php handler 172.16.203.11 radspeedy2 telkomspeedy2','',''),(303,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_qcache_free_blocks_303.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tequerycache 172.16.203.11 radspeedy2 telkomspeedy2','',''),(304,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_binlogcacheuse_304.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tereplication 172.16.203.11 radspeedy2 telkomspeedy2','',''),(305,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_handler_read_first_305.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teselecthandler 172.16.203.11 radspeedy2 telkomspeedy2','',''),(306,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_com_select_306.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php teselectquery 172.16.203.11 radspeedy2 telkomspeedy2','',''),(307,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_sort_merge_passes_307.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tesorts 172.16.203.11 radspeedy2 telkomspeedy2','',''),(308,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_createdtmpdisktable_308.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tetempobjects 172.16.203.11 radspeedy2 telkomspeedy2','',''),(309,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_threads_cached_309.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tethreadsabends 172.16.203.11 radspeedy2 telkomspeedy2','',''),(310,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_handler_commit_310.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tevolatilehandler 172.16.203.11 radspeedy2 telkomspeedy2','',''),(311,0,12,1,'172.16.203.11','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/jatinegara_1_com_delete_311.rrd',1,60,-240,'/usr/bin/php -q /var/www/html/scripts/mysql_stats.php tevolatilequery 172.16.203.11 radspeedy2 telkomspeedy2','',''),(318,0,24,1,'172.29.22.2','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d1_batam_ping_318.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.29.22.2','',''),(319,0,22,1,'172.29.16.222','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d1_nad_ping_319.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.29.16.222','',''),(320,0,21,1,'172.16.253.12','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d1_palembang_ping_320.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.253.12','',''),(321,0,20,1,'172.29.20.15','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d1_ridar_ping_321.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.29.20.15','',''),(322,0,19,1,'172.29.21.2','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d1_sumbar_ping_322.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.29.21.2','',''),(324,0,23,1,'172.16.254.5','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d1_medan_ping_324.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.254.5','',''),(325,0,18,1,'172.29.18.147','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d1_sumut_ping_325.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.29.18.147','',''),(326,0,26,1,'10.12.12.65','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d2_bekasi_huawei_ping_326.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.12.12.65','',''),(327,0,25,1,'10.12.12.33','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d2_bogor_huawei_ping_327.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.12.12.33','',''),(328,0,29,1,'10.12.12.49','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d2_kebayoran_huawei_ping_328.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.12.12.49','',''),(330,0,32,1,'10.12.12.115','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d2_tangerang_huawei_ping_330.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.12.12.115','',''),(331,0,31,1,'10.12.12.18','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d2_semanggi2_huawei_ping_331.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.12.12.18','',''),(332,0,27,1,'10.12.12.97','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d2_gambir_huawei_ping_332.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.12.12.97','',''),(333,0,28,1,'10.12.12.81','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d2_jatinegara_huawei_ping_333.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.12.12.81','',''),(334,0,33,1,'172.16.201.39','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d3_bandung_ping_334.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.201.39','',''),(335,0,35,1,'172.22.64.5','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d4_purwokerto_ping_335.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.22.64.5','',''),(336,0,36,1,'172.22.4.3','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d4_semarang_ping_336.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.22.4.3','',''),(337,0,37,1,'172.22.44.251','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d4_solo_ping_337.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.22.44.251','',''),(338,0,8,1,'10.32.18.190','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/os3nas_-_01_ping_338.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.32.18.190','',''),(339,0,8,1,'10.32.18.190','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3nas_-_01_load_1min_339.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/loadavg_multi.pl','',''),(340,0,8,1,'10.32.18.190','public',1,'','','MD5','','DES','',161,500,'proc','/var/www/html/rra/os3nas_-_01_proc_340.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/unix_processes.pl','',''),(341,0,9,1,'10.32.18.191','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/os3nas_-_app02_load_1min_341.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/loadavg_multi.pl','',''),(342,0,9,1,'10.32.18.191','public',1,'','','MD5','','DES','',161,500,'users','/var/www/html/rra/os3nas_-_app02_users_342.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/unix_users.pl ','',''),(343,0,9,1,'10.32.18.191','public',1,'','','MD5','','DES','',161,500,'proc','/var/www/html/rra/os3nas_-_app02_proc_343.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/unix_processes.pl','',''),(344,0,8,1,'10.32.18.190','public',1,'','','MD5','','DES','',161,500,'users','/var/www/html/rra/os3nas_-_app01_users_344.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/unix_users.pl ','',''),(345,0,41,1,'10.125.127.4','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d5_malang_ping_345.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.125.127.4','',''),(346,0,42,1,'10.125.127.2','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d5_sbb_ping_346.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.125.127.2','',''),(347,0,43,1,'10.125.127.1','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d5_sbt_ping_347.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.125.127.1','',''),(348,0,44,1,'172.16.62.2','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d6_bjm_ping_348.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.62.2','',''),(349,0,45,1,'172.16.61.5','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d6_bpp_ping_349.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.61.5','',''),(350,0,46,1,'172.16.64.5','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d6_plk_ping_350.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.64.5','',''),(351,0,47,1,'172.16.66.1','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/_ems_d6_ptk_ping_351.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.66.1','',''),(352,0,48,1,'172.16.63.1','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d6_smr_ping_352.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.63.1','',''),(353,0,50,1,'172.25.0.120','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d7_bali_ping_353.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.25.0.120','',''),(354,0,51,1,'172.31.250.140','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d7_gorontalo_ping_354.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.31.250.140','',''),(355,0,52,1,'172.25.129.253','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d6_kendari_ping_355.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.25.129.253','',''),(356,0,53,1,'172.16.254.69','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d7_mdo_ping_356.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.254.69','',''),(357,0,54,1,'172.16.254.111','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d7_mks_ping_357.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.16.254.111','',''),(358,0,56,1,'172.31.250.6','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/ems_d7_parepare_ping_358.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 172.31.250.6','',''),(359,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_nice','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_nice_359.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.51.0','',''),(360,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_system','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_system_360.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.52.0','',''),(361,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'cpu_user','/var/www/html/rra/dev-os3-v2_-_divre_2__cpu_user_361.rrd',1,60,-240,'.1.3.6.1.4.1.2021.11.50.0','',''),(362,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'proc','/var/www/html/rra/dev-os3-v2_-_divre_2__proc_362.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/unix_processes.pl','',''),(363,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'mem_buffers','/var/www/html/rra/dev-os3-v2_-_divre_2__mem_buffers_363.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/linux_memory.pl MemFree:','',''),(364,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'mem_swap','/var/www/html/rra/dev-os3-v2_-_divre_2__mem_swap_364.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/linux_memory.pl SwapFree:','',''),(366,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'load_1min','/var/www/html/rra/dev-os3-v2_-_divre_2__load_1min_366.rrd',1,300,0,'.1.3.6.1.4.1.2021.10.1.3.1','',''),(367,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'load_15min','/var/www/html/rra/dev-os3-v2_-_divre_2__load_15min_367.rrd',1,300,0,'.1.3.6.1.4.1.2021.10.1.3.3','',''),(368,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'load_5min','/var/www/html/rra/dev-os3-v2_-_divre_2__load_5min_368.rrd',1,300,0,'.1.3.6.1.4.1.2021.10.1.3.2','',''),(369,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'mem_buffers','/var/www/html/rra/dev-os3-v2_-_divre_2__mem_buffers_369.rrd',1,300,0,'.1.3.6.1.4.1.2021.4.14.0','',''),(370,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'mem_cache','/var/www/html/rra/dev-os3-v2_-_divre_2__mem_cache_370.rrd',1,300,0,'.1.3.6.1.4.1.2021.4.15.0','',''),(371,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'mem_free','/var/www/html/rra/dev-os3-v2_-_divre_2__mem_free_371.rrd',1,300,0,'.1.3.6.1.4.1.2021.4.6.0','',''),(373,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'','/var/www/html/rra/dev-os3-v2_-_divre_2__load_1min_373.rrd',1,60,-240,'/usr/bin/perl /var/www/html/scripts/loadavg_multi.pl','',''),(374,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'users','/var/www/html/rra/dev-os3-v2_-_divre_2__users_374.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/unix_users.pl ','',''),(375,0,10,1,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'ping','/var/www/html/rra/dev-os3-v2_-_divre_2__ping_375.rrd',1,300,0,'/usr/bin/perl /var/www/html/scripts/ping.pl 10.32.18.97','',''),(207,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/localhost_traffic_in_207.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.2','',''),(208,0,1,0,'localhost','public',2,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/localhost_traffic_in_208.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.1','',''),(246,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/os3_divre_2_traffic_in_246.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.1','',''),(247,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/os3_divre_2_traffic_in_247.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.2','',''),(248,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/os3_divre_2_traffic_in_248.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.3','',''),(249,0,5,0,'os3.divre2.telkom.co.id','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/os3_divre_2_traffic_in_249.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.4','',''),(194,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_194.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.2','',''),(194,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_194.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.2','',''),(195,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_195.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.3','',''),(195,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_in','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_195.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.10.3','',''),(219,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_219.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.1','',''),(220,0,10,0,'10.32.18.97','public',1,'','','MD5','','DES','',161,500,'traffic_out','/var/www/html/rra/dev-os3-v2_-_divre_2__traffic_in_220.rrd',2,60,-240,'.1.3.6.1.2.1.2.2.1.16.4','','');
/*!40000 ALTER TABLE `poller_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output`
--

DROP TABLE IF EXISTS `poller_output`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_output` (
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `rrd_name` varchar(19) NOT NULL default '',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `output` text NOT NULL,
  PRIMARY KEY  (`local_data_id`,`rrd_name`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_output`
--

LOCK TABLES `poller_output` WRITE;
/*!40000 ALTER TABLE `poller_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_boost`
--

DROP TABLE IF EXISTS `poller_output_boost`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_output_boost` (
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `rrd_name` varchar(19) NOT NULL default '',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `output` varchar(512) NOT NULL,
  PRIMARY KEY  (`local_data_id`,`rrd_name`,`time`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_output_boost`
--

LOCK TABLES `poller_output_boost` WRITE;
/*!40000 ALTER TABLE `poller_output_boost` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_boost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_boost_processes`
--

DROP TABLE IF EXISTS `poller_output_boost_processes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_output_boost_processes` (
  `sock_int_value` bigint(20) unsigned NOT NULL auto_increment,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`sock_int_value`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_output_boost_processes`
--

LOCK TABLES `poller_output_boost_processes` WRITE;
/*!40000 ALTER TABLE `poller_output_boost_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_boost_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_rt`
--

DROP TABLE IF EXISTS `poller_output_rt`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_output_rt` (
  `local_data_id` mediumint(8) unsigned NOT NULL default '0',
  `rrd_name` varchar(19) NOT NULL default '',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `output` text NOT NULL,
  `poller_id` int(11) NOT NULL,
  PRIMARY KEY  (`local_data_id`,`rrd_name`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_output_rt`
--

LOCK TABLES `poller_output_rt` WRITE;
/*!40000 ALTER TABLE `poller_output_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_rt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_reindex`
--

DROP TABLE IF EXISTS `poller_reindex`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_reindex` (
  `host_id` mediumint(8) unsigned NOT NULL default '0',
  `data_query_id` mediumint(8) unsigned NOT NULL default '0',
  `action` tinyint(3) unsigned NOT NULL default '0',
  `op` char(1) NOT NULL default '',
  `assert_value` varchar(100) NOT NULL default '',
  `arg1` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`host_id`,`data_query_id`,`arg1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_reindex`
--

LOCK TABLES `poller_reindex` WRITE;
/*!40000 ALTER TABLE `poller_reindex` DISABLE KEYS */;
INSERT INTO `poller_reindex` VALUES (11,1,0,'<','148269225','.1.3.6.1.2.1.1.3.0'),(10,1,0,'<','10133188','.1.3.6.1.2.1.1.3.0'),(5,6,0,'<','10085396','.1.3.6.1.2.1.1.3.0'),(6,6,0,'<','165475563','.1.3.6.1.2.1.1.3.0'),(7,6,0,'<','148362531','.1.3.6.1.2.1.1.3.0'),(8,6,0,'<','148312909','.1.3.6.1.2.1.1.3.0'),(9,6,0,'<','148246631','.1.3.6.1.2.1.1.3.0'),(5,1,0,'<','10085396','.1.3.6.1.2.1.1.3.0'),(7,1,0,'<','148362531','.1.3.6.1.2.1.1.3.0'),(12,1,0,'<','148296649','.1.3.6.1.2.1.1.3.0'),(14,1,0,'<','148316314','.1.3.6.1.2.1.1.3.0'),(15,1,0,'<','148309045','.1.3.6.1.2.1.1.3.0'),(1,1,0,'<','10133680','.1.3.6.1.2.1.1.3.0'),(8,1,0,'<','148312909','.1.3.6.1.2.1.1.3.0'),(9,1,0,'<','148246631','.1.3.6.1.2.1.1.3.0');
/*!40000 ALTER TABLE `poller_reindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_time`
--

DROP TABLE IF EXISTS `poller_time`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `poller_time` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `pid` int(11) unsigned NOT NULL default '0',
  `poller_id` smallint(5) unsigned NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `poller_time`
--

LOCK TABLES `poller_time` WRITE;
/*!40000 ALTER TABLE `poller_time` DISABLE KEYS */;
INSERT INTO `poller_time` VALUES (1,0,0,'2010-06-07 08:11:02','2010-06-07 08:11:02'),(2,0,0,'2010-06-07 08:11:04','2010-06-07 08:11:04'),(3,0,0,'2010-06-07 08:11:04','2010-06-07 08:11:04'),(4,0,0,'2010-06-07 08:11:06','2010-06-07 08:11:06'),(5,0,0,'2010-06-07 08:11:14','2010-06-07 08:11:14'),(6,0,0,'2010-06-07 08:11:18','2010-06-07 08:11:18');
/*!40000 ALTER TABLE `poller_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_cache_measurands`
--

DROP TABLE IF EXISTS `reportit_cache_measurands`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_cache_measurands` (
  `cache_id` varchar(255) NOT NULL default '',
  `id` int(11) NOT NULL default '0',
  `template_id` int(11) NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `abbreviation` varchar(255) NOT NULL default '',
  `calc_formula` varchar(255) NOT NULL default '',
  `unit` varchar(255) NOT NULL default '',
  `visible` tinyint(1) NOT NULL default '1',
  `spanned` tinyint(1) NOT NULL default '0',
  `rounding` tinyint(1) NOT NULL default '0',
  UNIQUE KEY `cache_id_2` (`cache_id`,`id`),
  KEY `cache_id` (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_cache_measurands`
--

LOCK TABLES `reportit_cache_measurands` WRITE;
/*!40000 ALTER TABLE `reportit_cache_measurands` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_cache_measurands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_cache_reports`
--

DROP TABLE IF EXISTS `reportit_cache_reports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_cache_reports` (
  `cache_id` varchar(255) NOT NULL default '',
  `id` int(11) NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `template_id` int(11) NOT NULL default '0',
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_source_filter` varchar(255) NOT NULL default '',
  `preset_timespan` varchar(255) NOT NULL default '',
  `last_run` datetime NOT NULL default '0000-00-00 00:00:00',
  `runtime` int(11) NOT NULL default '0',
  `public` tinyint(1) NOT NULL default '0',
  `start_date` date NOT NULL default '0000-00-00',
  `end_date` date NOT NULL default '0000-00-00',
  `ds_description` varchar(255) NOT NULL default '',
  `rs_def` varchar(255) NOT NULL default '',
  `sp_def` varchar(255) NOT NULL default '',
  `sliding` tinyint(1) NOT NULL default '0',
  `present` tinyint(1) NOT NULL default '0',
  `scheduled` tinyint(1) NOT NULL default '0',
  `autorrdlist` tinyint(1) NOT NULL default '0',
  `auto_email` tinyint(1) NOT NULL default '0',
  `email_subject` varchar(255) NOT NULL default '',
  `email_body` varchar(1000) NOT NULL default '',
  `email_format` varchar(255) NOT NULL default '',
  `subhead` tinyint(1) NOT NULL default '0',
  `in_process` tinyint(1) NOT NULL default '0',
  `graph_permission` tinyint(1) NOT NULL default '1',
  `frequency` varchar(255) NOT NULL default '',
  `autoarchive` mediumint(8) unsigned NOT NULL default '0',
  `template_name` varchar(255) NOT NULL default '',
  `data_template_alias` varchar(2500) NOT NULL default '',
  `owner` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_cache_reports`
--

LOCK TABLES `reportit_cache_reports` WRITE;
/*!40000 ALTER TABLE `reportit_cache_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_cache_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_cache_variables`
--

DROP TABLE IF EXISTS `reportit_cache_variables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_cache_variables` (
  `cache_id` varchar(255) NOT NULL default '',
  `id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `value` float NOT NULL default '0',
  `max_value` float NOT NULL default '0',
  `min_value` float NOT NULL default '0',
  UNIQUE KEY `cache_id_2` (`cache_id`,`id`),
  KEY `cache_id` (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_cache_variables`
--

LOCK TABLES `reportit_cache_variables` WRITE;
/*!40000 ALTER TABLE `reportit_cache_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_cache_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_measurands`
--

DROP TABLE IF EXISTS `reportit_measurands`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_measurands` (
  `id` int(11) NOT NULL auto_increment,
  `template_id` int(11) NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `abbreviation` varchar(255) NOT NULL default '',
  `calc_formula` varchar(255) NOT NULL default '',
  `unit` varchar(255) NOT NULL default '',
  `visible` tinyint(1) NOT NULL default '1',
  `spanned` tinyint(1) NOT NULL default '0',
  `rounding` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_measurands`
--

LOCK TABLES `reportit_measurands` WRITE;
/*!40000 ALTER TABLE `reportit_measurands` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_measurands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_presets`
--

DROP TABLE IF EXISTS `reportit_presets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_presets` (
  `id` int(11) NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `start_day` varchar(255) NOT NULL default 'Monday',
  `end_day` varchar(255) NOT NULL default 'Sunday',
  `start_time` time NOT NULL default '00:00:00',
  `end_time` time NOT NULL default '24:00:00',
  `timezone` varchar(255) NOT NULL default 'GMT',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_presets`
--

LOCK TABLES `reportit_presets` WRITE;
/*!40000 ALTER TABLE `reportit_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_recipients`
--

DROP TABLE IF EXISTS `reportit_recipients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_recipients` (
  `id` int(11) NOT NULL auto_increment,
  `report_id` int(11) NOT NULL default '0',
  `email` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_recipients`
--

LOCK TABLES `reportit_recipients` WRITE;
/*!40000 ALTER TABLE `reportit_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_reports`
--

DROP TABLE IF EXISTS `reportit_reports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_reports` (
  `id` int(11) NOT NULL auto_increment,
  `description` varchar(255) NOT NULL default '',
  `user_id` int(11) NOT NULL default '0',
  `template_id` int(11) NOT NULL default '0',
  `host_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_source_filter` varchar(255) NOT NULL default '',
  `preset_timespan` varchar(255) NOT NULL default '',
  `last_run` datetime NOT NULL default '0000-00-00 00:00:00',
  `runtime` int(11) NOT NULL default '0',
  `public` tinyint(1) NOT NULL default '0',
  `start_date` date NOT NULL default '0000-00-00',
  `end_date` date NOT NULL default '0000-00-00',
  `ds_description` varchar(255) NOT NULL default '',
  `rs_def` varchar(255) NOT NULL default '',
  `sp_def` varchar(255) NOT NULL default '',
  `sliding` tinyint(1) NOT NULL default '0',
  `present` tinyint(1) NOT NULL default '0',
  `scheduled` tinyint(1) NOT NULL default '0',
  `autorrdlist` tinyint(1) NOT NULL default '0',
  `auto_email` tinyint(1) NOT NULL default '0',
  `email_subject` varchar(255) NOT NULL default '',
  `email_body` varchar(1000) NOT NULL default '',
  `email_format` varchar(255) NOT NULL default '',
  `subhead` tinyint(1) NOT NULL default '0',
  `in_process` tinyint(1) NOT NULL default '0',
  `graph_permission` tinyint(1) NOT NULL default '1',
  `frequency` varchar(255) NOT NULL default '',
  `autoarchive` mediumint(8) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_reports`
--

LOCK TABLES `reportit_reports` WRITE;
/*!40000 ALTER TABLE `reportit_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_rvars`
--

DROP TABLE IF EXISTS `reportit_rvars`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_rvars` (
  `id` int(11) NOT NULL auto_increment,
  `template_id` int(11) NOT NULL default '0',
  `report_id` int(11) NOT NULL default '0',
  `variable_id` int(11) NOT NULL default '0',
  `value` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_rvars`
--

LOCK TABLES `reportit_rvars` WRITE;
/*!40000 ALTER TABLE `reportit_rvars` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_rvars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_templates`
--

DROP TABLE IF EXISTS `reportit_templates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_templates` (
  `id` int(11) NOT NULL auto_increment,
  `description` varchar(255) NOT NULL default '',
  `pre_filter` varchar(255) NOT NULL default '',
  `data_template_id` int(11) NOT NULL default '0',
  `data_template_alias` varchar(2500) NOT NULL default '',
  `cf` int(11) NOT NULL default '1',
  `locked` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_templates`
--

LOCK TABLES `reportit_templates` WRITE;
/*!40000 ALTER TABLE `reportit_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportit_variables`
--

DROP TABLE IF EXISTS `reportit_variables`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reportit_variables` (
  `id` int(11) NOT NULL auto_increment,
  `template_id` int(11) NOT NULL default '0',
  `abbreviation` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `max_value` float NOT NULL default '0',
  `min_value` float NOT NULL default '0',
  `default_value` float NOT NULL default '0',
  `input_type` tinyint(1) NOT NULL default '0',
  `stepping` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reportit_variables`
--

LOCK TABLES `reportit_variables` WRITE;
/*!40000 ALTER TABLE `reportit_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportit_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rra`
--

DROP TABLE IF EXISTS `rra`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rra` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `x_files_factor` double NOT NULL default '0.1',
  `steps` mediumint(8) default '1',
  `rows` int(12) NOT NULL default '600',
  `timespan` int(12) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `rra`
--

LOCK TABLES `rra` WRITE;
/*!40000 ALTER TABLE `rra` DISABLE KEYS */;
INSERT INTO `rra` VALUES (1,'c21df5178e5c955013591239eb0afd46','Daily (5 Minute Average)',0.5,1,25920,86400),(2,'0d9c0af8b8acdc7807943937b3208e29','Weekly (30 Minute Average)',0.5,6,9000,604800),(4,'e36f3adb9f152adfa5dc50fd2b23337e','Yearly (1 Day Average)',0.5,288,797,33053184),(3,'6fc2d038fb42950138b0ce3e9874cc60','Monthly (2 Hour Average)',0.5,24,2250,2592000),(5,'8f0bb4a4ee4605903e6f59824e7f0808','Hourly (1 Minute Average)',0.5,1,10080,14400);
/*!40000 ALTER TABLE `rra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rra_cf`
--

DROP TABLE IF EXISTS `rra_cf`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `rra_cf` (
  `rra_id` mediumint(8) unsigned NOT NULL default '0',
  `consolidation_function_id` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`rra_id`,`consolidation_function_id`),
  KEY `rra_id` (`rra_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `rra_cf`
--

LOCK TABLES `rra_cf` WRITE;
/*!40000 ALTER TABLE `rra_cf` DISABLE KEYS */;
INSERT INTO `rra_cf` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(4,4),(5,1),(5,2),(5,3),(5,4);
/*!40000 ALTER TABLE `rra_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `settings` (
  `name` varchar(50) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('path_rrdtool','/usr/bin/rrdtool'),('path_php_binary','/usr/bin/php'),('path_snmpwalk','/usr/bin/snmpwalk'),('path_snmpget','/usr/bin/snmpget'),('path_snmpbulkwalk','/usr/bin/snmpbulkwalk'),('path_snmpgetnext','/usr/bin/snmpgetnext'),('path_cactilog','/var/www/html/log/cacti.log'),('snmp_version','net-snmp'),('rrdtool_version','rrd-1.2.x'),('alert_bl_past_default','86400'),('alert_bl_timerange_def','10800'),('alert_bl_percent_def','20'),('alert_bl_trigger','3'),('monitor_refresh','300'),('monitor_width','10'),('haloe_refresh','300'),('path_webroot','/var/www/html'),('path_rrdtool_default_font',''),('path_spine','/usr/local/spine/spine'),('rrd_move','/var/backups/rrds'),('backup_dir','/var/backups/cacti'),('poller_enabled','on'),('poller_type','2'),('concurrent_processes','5'),('max_threads','15'),('php_servers','10'),('script_timeout','25'),('max_get_size','30'),('availability_method','2'),('ping_method','2'),('ping_timeout','400'),('ping_retries','1'),('ping_failure_count','2'),('ping_recovery_count','3'),('mt_processes','7'),('mt_collection_timing','disabled'),('mt_script_runtime','20'),('mt_base_time','1:00am'),('mt_maint_time','12:00am'),('mt_data_retention','2weeks'),('mt_reverse_dns',''),('mt_dns_primary',''),('mt_dns_secondary',''),('mt_dns_timeout','500'),('mt_snmp_ver','1'),('mt_snmp_community','public'),('mt_snmp_communities','public:private:secret'),('mt_snmp_port','161'),('mt_snmp_timeout','500'),('mt_snmp_retries','3'),('path_flows_structure','-1'),('boost_rrd_update_enable','off'),('boost_rrd_update_system_enable','off'),('boost_rrd_update_base_time','12:00am'),('boost_rrd_update_interval','30'),('boost_rrd_update_max_records','100000'),('boost_rrd_update_max_records_per_select','50000'),('boost_rrd_update_max_runtime','1200'),('boost_server_enable','off'),('boost_server_effective_user','apache'),('boost_server_multiprocess','0'),('boost_path_rrdupdate',''),('boost_server_hostname','localhost'),('boost_server_listen_port','9050'),('boost_server_timeout','2'),('boost_server_clients','127.0.0.1'),('boost_png_cache_enable','on'),('boost_png_cache_directory','/var/www/html/plugins/boost/cache/'),('poller_interval','300'),('cron_interval','300'),('syslog_last_incoming','226163'),('syslog_last_total','27816'),('weathermap_pagestyle','0'),('weathermap_cycle_refresh','0'),('weathermap_thumbsize','250'),('haloe_retention','30'),('syslog_refresh','300'),('num_rows_syslog','30'),('syslog_retention','30'),('thold_failed_hosts','21,22,30,34,53,56'),('rrd_step_counter','0'),('weathermap_render_period','0'),('weathermap_quiet_logging','1'),('weathermap_render_counter','118'),('weathermap_output_format','png'),('monitor_sound','attn-noc.wav'),('monitor_legend','on'),('monitor_grouping','group_by_tree'),('discovery_subnet','10.37.21.0/24'),('discovery_dns',''),('discovery_protocol','0'),('discovery_readstrings','public'),('discovery_collection_timing','disabled'),('discovery_base_time','12:00am'),('syslog_email',''),('syslog_emailname',''),('plugin_update_check_time','0'),('flowview_dns',''),('path_flows_dir','/var/netflow/flows/'),('path_flowtools_workdir','/tmp/'),('path_flowtools','/usr/bin/'),('log_destination','1'),('log_snmp',''),('log_graph',''),('log_export',''),('log_verbosity','2'),('log_pstats',''),('log_pwarn',''),('log_perror','on'),('snmp_ver','1'),('snmp_community','public'),('snmp_username',''),('snmp_password',''),('snmp_timeout','500'),('snmp_port','161'),('snmp_retries','3'),('remove_verification','on'),('boost_mysql_string_length','1500'),('boost_rrd_update_string_length','2000'),('reportit_met','300'),('reportit_use_tmz',''),('reportit_show_tmz','on'),('reportit_use_IEC','on'),('reportit_API','1'),('reportit_RRDID','127.0.0.1'),('reportit_RRDPort','13900'),('reportit_csv',''),('reportit_filename','cacti_report<report_id>'),('reportit_exp_header','# Your default header# <cacti_version> <reportit_version>'),('title_size','10'),('legend_size','8'),('axis_size','8'),('unit_size','8'),('routerconfigs_backup_path','/var/routerconfigs'),('realtime_cache_path','/var/www/html/plugins/realtime/cache/'),('alert_num_rows','30'),('poller_lastrun','1275873061'),('date','2010-06-07 08:11:18'),('stats_poller','Time:17.8846 Method:spine Processes:5 Threads:15 Hosts:52 HostsPerProcess:11 DataSources:182 RRDsProcessed:159'),('stats_recache','RecacheTime:0.0 HostsRecached:0'),('alert_base_url','http://10.32.18.200/'),('monitor_view','tiles'),('discovery_query_rerun',''),('discovery_interface_up_only',''),('routerconfigs_tftpserver',''),('routerconfigs_email',''),('routerconfigs_from',''),('routerconfigs_retention','30'),('realtime_gwindow','60'),('realtime_sync','on'),('realtime_ajax','on'),('realtime_interval','5'),('plugin_routerconfigs_running','1'),('plugin_thold_version','0.4'),('plugin_monitor_version','0.9'),('reportit_maxrrdchg','100'),('reportit_operator','1'),('reportit_exp_filename','cacti_report_<report_id>'),('reportit_email',''),('reportit_archive','on'),('reportit_arc_lifecycle','300'),('reportit_arc_folder','/var/www/html/plugins/reportit/archive/'),('reportit_graph','on'),('reportit_g_mheight','320'),('reportit_g_mwidth','480'),('reportit_g_quality','2'),('reportit_g_mono','on'),('reportit_g_tfont','/var/www/html/plugins/reportit/lib_ext/fonts/DejaVuSansMono-Bold.ttf'),('reportit_g_afont','/var/www/html/plugins/reportit/lib_ext/fonts/DejaVuSansMono.ttf'),('export_type','disabled'),('export_presentation','classical'),('export_tree_isolation','on'),('export_user_id','1'),('export_tree_expand_hosts','on'),('export_default_height','100'),('export_default_width','300'),('export_num_columns','2'),('path_html_export',''),('export_temporary_directory',''),('export_timing','disabled'),('path_html_export_skip',''),('export_hourly',''),('export_daily',''),('export_ftp_sanitize',''),('export_ftp_host',''),('export_ftp_port',''),('export_ftp_passive',''),('export_ftp_user',''),('export_ftp_password',''),('thold_disable_all','on'),('alert_syslog',''),('thold_syslog_level','4'),('thold_syslog_facility','24'),('thold_log_cacti',''),('thold_log_changes',''),('alert_deadnotify','on'),('alert_email',''),('thold_send_text_only',''),('alert_exempt','on'),('alert_trigger','1'),('alert_repeat','12'),('thold_alert_text','<html><body>An alert has been issued that requires your attention. <br><br><strong>Host</strong>: <DESCRIPTION> (<HOSTNAME>)<br><strong>URL</strong>: <URL><br><strong>Message</strong>: <SUBJECT><br><br><GRAPH></body></html>'),('alert_notify_bl','on'),('thold_from_email',''),('thold_from_name',''),('process_leveling','on'),('ping_port','23'),('snmp_auth_protocol','MD5'),('snmp_priv_passphrase',''),('snmp_priv_protocol','DES'),('reindex_method','1'),('deletion_verification','on');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_graphs`
--

DROP TABLE IF EXISTS `settings_graphs`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `settings_graphs` (
  `user_id` smallint(8) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`user_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `settings_graphs`
--

LOCK TABLES `settings_graphs` WRITE;
/*!40000 ALTER TABLE `settings_graphs` DISABLE KEYS */;
INSERT INTO `settings_graphs` VALUES (1,'title_size','10'),(1,'legend_size','8'),(1,'axis_size','8'),(1,'unit_size','8'),(3,'default_rra_id','1'),(3,'default_view_mode','1'),(3,'default_timespan','7'),(3,'timespan_sel','on'),(3,'default_timeshift','7'),(3,'allow_graph_dates_in_future','on'),(3,'first_weekdayid','1'),(3,'day_shift_start','07:00'),(3,'day_shift_end','18:00'),(3,'default_date_format','4'),(3,'default_datechar','1'),(3,'page_refresh','300'),(3,'default_height','100'),(3,'default_width','300'),(3,'num_columns','2'),(3,'thumbnail_section_preview','on'),(3,'thumbnail_section_tree_1','on'),(3,'thumbnail_section_tree_2',''),(3,'default_tree_id','14'),(3,'default_tree_view_mode','2'),(3,'treeview_graphs_per_page','10'),(3,'default_dual_pane_width','200'),(3,'expand_hosts',''),(3,'show_graph_title',''),(3,'preview_graphs_per_page','10'),(3,'list_graphs_per_page','30'),(3,'custom_fonts',''),(3,'title_size','12'),(3,'title_font',''),(3,'legend_size','10'),(3,'legend_font',''),(3,'axis_size','8'),(3,'axis_font',''),(3,'unit_size','8'),(3,'unit_font',''),(3,'reportit_view_filter','on'),(3,'reportit_csv_header',''),(3,'reportit_csv_column_s','1'),(3,'reportit_csv_decimal_s','0'),(3,'reportit_graph_header',''),(3,'reportit_g_default','-10'),(3,'reportit_g_height','320'),(3,'reportit_g_width','480'),(3,'reportit_g_showgrid','');
/*!40000 ALTER TABLE `settings_graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_tree`
--

DROP TABLE IF EXISTS `settings_tree`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `settings_tree` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `graph_tree_item_id` mediumint(8) unsigned NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`graph_tree_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `settings_tree`
--

LOCK TABLES `settings_tree` WRITE;
/*!40000 ALTER TABLE `settings_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query`
--

DROP TABLE IF EXISTS `snmp_query`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `snmp_query` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `xml_path` varchar(255) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `description` varchar(255) default NULL,
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_input_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snmp_query`
--

LOCK TABLES `snmp_query` WRITE;
/*!40000 ALTER TABLE `snmp_query` DISABLE KEYS */;
INSERT INTO `snmp_query` VALUES (1,'d75e406fdeca4fcef45b8be3a9a63cbc','<path_cacti>/resource/snmp_queries/interface.xml','SNMP - Interface Statistics','Queries a host for a list of monitorable interfaces',0,2),(2,'3c1b27d94ad208a0090f293deadde753','<path_cacti>/resource/snmp_queries/net-snmp_disk.xml','ucd/net -  Get Monitored Partitions','Retrieves a list of monitored partitions/disks from a net-snmp enabled host.',0,2),(3,'59aab7b0feddc7860002ed9303085ba5','<path_cacti>/resource/snmp_queries/kbridge.xml','Karlnet - Wireless Bridge Statistics','Gets information about the wireless connectivity of each station from a Karlnet bridge.',0,2),(4,'ad06f46e22e991cb47c95c7233cfaee8','<path_cacti>/resource/snmp_queries/netware_disk.xml','Netware - Get Available Volumes','Retrieves a list of volumes from a Netware server.',0,2),(6,'8ffa36c1864124b38bcda2ae9bd61f46','<path_cacti>/resource/script_queries/unix_disk.xml','Unix - Get Mounted Partitions','Queries a list of mounted partitions on a unix-based host with the',0,11),(7,'30ec734bc0ae81a3d995be82c73f46c1','<path_cacti>/resource/snmp_queries/netware_cpu.xml','Netware - Get Processor Information','Gets information about running processors in a Netware server',0,2),(8,'9343eab1f4d88b0e61ffc9d020f35414','<path_cacti>/resource/script_server/host_disk.xml','SNMP - Get Mounted Partitions','Gets a list of partitions using SNMP',0,12),(9,'0d1ab53fe37487a5d0b9e1d3ee8c1d0d','<path_cacti>/resource/script_server/host_cpu.xml','SNMP - Get Processor Information','Gets usage for each processor in the system using the host MIB.',0,12),(10,'31620ded0790e4d6691449abb74174ac','<path_cacti>/resource/script_server/win_services.xml','Win Services','Windows services',0,12);
/*!40000 ALTER TABLE `snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph`
--

DROP TABLE IF EXISTS `snmp_query_graph`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `snmp_query_graph` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `snmp_query_id` mediumint(8) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL default '',
  `graph_template_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snmp_query_graph`
--

LOCK TABLES `snmp_query_graph` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph` DISABLE KEYS */;
INSERT INTO `snmp_query_graph` VALUES (2,'a4b829746fb45e35e10474c36c69c0cf',1,'In/Out Errors/Discarded Packets',22),(3,'01e33224f8b15997d3d09d6b1bf83e18',1,'In/Out Non-Unicast Packets',24),(4,'1e6edee3115c42d644dbd014f0577066',1,'In/Out Unicast Packets',23),(6,'da43655bf1f641b07579256227806977',2,'Available/Used Disk Space',3),(7,'1cc468ef92a5779d37a26349e27ef3ba',3,'Wireless Levels',5),(8,'bef2dc94bc84bf91827f45424aac8d2a',3,'Wireless Transmissions',6),(9,'ab93b588c29731ab15db601ca0bc9dec',1,'In/Out Bytes (64-bit Counters)',25),(10,'5a5ce35edb4b195cbde99fd0161dfb4e',4,'Volume Information (free, freeable space)',19),(11,'c1c2cfd33eaf5064300e92e26e20bc56',4,'Directory Information (total/available entries)',20),(13,'ae34f5f385bed8c81a158bf3030f1089',1,'In/Out Bits',2),(14,'1e16a505ddefb40356221d7a50619d91',1,'In/Out Bits (64-bit Counters)',2),(15,'a0b3e7b63c2e66f9e1ea24a16ff245fc',6,'Available Disk Space',21),(16,'d1e0d9b8efd4af98d28ce2aad81a87e7',1,'In/Out Bytes',25),(17,'f6db4151aa07efa401a0af6c9b871844',7,'Get Processor Utilization',15),(18,'46c4ee688932cf6370459527eceb8ef3',8,'Available Disk Space',26),(19,'4a515b61441ea5f27ab7dee6c3cb7818',9,'Get Processor Utilization',27),(20,'ed7f68175d7bb83db8ead332fc945720',1,'In/Out Bits with 95th Percentile',31),(21,'f85386cd2fc94634ef167c7f1e5fbcd0',1,'In/Out Bits with Total Bandwidth',32),(22,'7d309bf200b6e3cdb59a33493c2e58e0',1,'In/Out Bytes with Total Bandwidth',33),(23,'930f753aa55efa573212ec8c3f018622',10,'Win Services',36);
/*!40000 ALTER TABLE `snmp_query_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_rrd`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `snmp_query_graph_rrd` (
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_rrd_id` mediumint(8) unsigned NOT NULL default '0',
  `snmp_field_name` varchar(50) NOT NULL default '0',
  PRIMARY KEY  (`snmp_query_graph_id`,`data_template_id`,`data_template_rrd_id`),
  KEY `data_template_rrd_id` (`data_template_rrd_id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snmp_query_graph_rrd`
--

LOCK TABLES `snmp_query_graph_rrd` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_rrd` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_rrd` VALUES (2,38,47,'ifInDiscards'),(3,40,52,'ifOutNUcastPkts'),(3,40,53,'ifInNUcastPkts'),(4,39,48,'ifInUcastPkts'),(2,38,51,'ifOutErrors'),(6,3,3,'dskAvail'),(6,3,4,'dskUsed'),(7,7,8,'kbWirelessStationExclHellos'),(7,8,9,'kbWirelessStationExclHellos'),(8,10,11,'kbWirelessStationExclHellos'),(8,9,10,'kbWirelessStationExclHellos'),(9,41,55,'ifHCOutOctets'),(9,41,54,'ifHCInOctets'),(10,35,38,'nwVolSize'),(10,35,40,'nwVolFreeable'),(10,35,39,'nwVolFree'),(11,36,42,'nwVolTotalDirEntries'),(11,36,43,'nwVolUsedDirEntries'),(2,38,50,'ifOutDiscards'),(2,38,46,'ifInErrors'),(13,41,54,'ifInOctets'),(14,41,54,'ifHCInOctets'),(14,41,55,'ifHCOutOctets'),(13,41,55,'ifOutOctets'),(4,39,49,'ifOutUcastPkts'),(15,37,44,'dskAvailable'),(16,41,54,'ifInOctets'),(16,41,55,'ifOutOctets'),(15,37,56,'dskUsed'),(17,42,76,'nwhrProcessorUtilization'),(18,43,78,'hrStorageUsed'),(18,43,92,'hrStorageSize'),(19,44,79,'hrProcessorLoad'),(20,41,55,'ifOutOctets'),(20,41,54,'ifInOctets'),(21,41,55,'ifOutOctets'),(21,41,54,'ifInOctets'),(22,41,55,'ifOutOctets'),(22,41,54,'ifInOctets'),(18,43,134,'hrStoragePercent'),(23,50,104,'ServiceState');
/*!40000 ALTER TABLE `snmp_query_graph_rrd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_rrd_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd_sv`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `snmp_query_graph_rrd_sv` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `data_template_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  `field_name` varchar(100) NOT NULL default '',
  `text` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snmp_query_graph_rrd_sv`
--

LOCK TABLES `snmp_query_graph_rrd_sv` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_rrd_sv` VALUES (10,'5d3a8b2f4a454e5b0a1494e00fe7d424',6,3,1,'name','|host_description| - Partition - |query_dskDevice|'),(11,'d0b49af67a83c258ef1eab3780f7b3dc',7,7,1,'name','|host_description| - Wireless Noise Level - |query_kbWirelessStationName|'),(12,'bf6b966dc369f3df2ea640a90845e94c',7,8,1,'name','|host_description| - Wireless Signal Level - |query_kbWirelessStationName|'),(13,'5c3616603a7ac9d0c1cb9556b377a74f',8,10,1,'name','|host_description| - Wireless Re-Transmissions - |query_kbWirelessStationName|'),(14,'080f0022f77044a512b083e3a8304e8b',8,9,1,'name','|host_description| - Wireless Transmissions - |query_kbWirelessStationName|'),(30,'8132fa9c446e199732f0102733cb1714',11,36,1,'name','|host_description| - Directories - |query_nwVolPhysicalName|'),(29,'8fc9a94a5f6ef902a3de0fa7549e7476',10,35,1,'name','|host_description| - Volumes - |query_nwVolPhysicalName|'),(80,'27eb220995925e1a5e0e41b2582a2af6',16,41,1,'rrd_maximum','|query_ifSpeed|'),(85,'e85ddc56efa677b70448f9e931360b77',14,41,1,'rrd_maximum','|query_ifSpeed|'),(84,'37bb8c5b38bb7e89ec88ea7ccacf44d4',14,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(83,'62a47c18be10f273a5f5a13a76b76f54',14,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(32,'',12,37,1,'name','|host_description| - Partition - |query_dskDevice|'),(49,'6537b3209e0697fbec278e94e7317b52',2,38,1,'name','|host_description| - Errors - |query_ifIP| - |query_ifName|'),(50,'6d3f612051016f48c951af8901720a1c',2,38,2,'name','|host_description| - Errors - |query_ifName|'),(51,'62bc981690576d0b2bd0041ec2e4aa6f',2,38,3,'name','|host_description| - Errors - |query_ifIP|/|query_ifDescr|'),(52,'adb270d55ba521d205eac6a21478804a',2,38,4,'name','|host_description| - Errors - |query_ifDescr|'),(54,'77065435f3bbb2ff99bc3b43b81de8fe',3,40,1,'name','|host_description| - Non-Unicast Packets - |query_ifIP| - |query_ifName|'),(55,'240d8893092619c97a54265e8d0b86a1',3,40,2,'name','|host_description| - Non-Unicast Packets - |query_ifName|'),(56,'4b200ecf445bdeb4c84975b74991df34',3,40,3,'name','|host_description| - Non-Unicast Packets - |query_ifIP|/|query_ifDescr|'),(57,'d6da3887646078e4d01fe60a123c2179',3,40,4,'name','|host_description| - Non-Unicast Packets - |query_ifDescr|'),(59,'ce7769b97d80ca31d21f83dc18ba93c2',4,39,1,'name','|host_description| - Unicast Packets - |query_ifIP| - |query_ifName|'),(60,'1ee1f9717f3f4771f7f823ca5a8b83dd',4,39,2,'name','|host_description| - Unicast Packets - |query_ifName|'),(61,'a7dbd54604533b592d4fae6e67587e32',4,39,3,'name','|host_description| - Unicast Packets - |query_ifIP|/|query_ifDescr|'),(62,'b148fa7199edcf06cd71c89e5c5d7b63',4,39,4,'name','|host_description| - Unicast Packets - |query_ifDescr|'),(69,'cb09784ba05e401a3f1450126ed1e395',15,37,1,'name','|host_description| - Free Space - |query_dskDevice|'),(70,'87a659326af8c75158e5142874fd74b0',13,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(72,'14aa2dead86bbad0f992f1514722c95e',13,41,2,'name','|host_description| - Traffic - |query_ifName|'),(73,'70390712158c3c5052a7d830fb456489',13,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(74,'084efd82bbddb69fb2ac9bd0b0f16ac6',13,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(75,'7e093c535fa3d810fa76fc3d8c80c94b',13,41,1,'rrd_maximum','|query_ifSpeed|'),(76,'c7ee2110bf81639086d2da03d9d88286',16,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(77,'8ef8ae2ef548892ab95bb6c9f0b3170e',16,41,2,'name','|host_description| - Traffic - |query_ifName|'),(78,'3a0f707d1c8fd0e061b70241541c7e2e',16,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(79,'2347e9f53564a54d43f3c00d4b60040d',16,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(81,'2e8b27c63d98249096ad5bc320787f43',14,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(82,'8d820d091ec1a9683cfa74a462f239ee',14,41,2,'name','|host_description| - Traffic - |query_ifName|'),(86,'c582d3b37f19e4a703d9bf4908dc6548',9,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(88,'e1be83d708ed3c0b8715ccb6517a0365',9,41,2,'name','|host_description| - Traffic - |query_ifName|'),(89,'57a9ae1f197498ca8dcde90194f61cbc',9,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(90,'0110e120981c7ff15304e4a85cb42cbe',9,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(91,'ce0b9c92a15759d3ddbd7161d26a98b7',9,41,1,'rrd_maximum','|query_ifSpeed|'),(92,'42277993a025f1bfd85374d6b4deeb60',17,42,1,'name','|host_description| - CPU Utilization - CPU|query_nwhrProcessorNum|'),(93,'a3f280327b1592a1a948e256380b544f',18,43,1,'name','|host_description| - Used Space - |query_hrStorageDescr|'),(94,'b5a724edc36c10891fa2a5c370d55b6f',19,44,1,'name','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|'),(95,'7e87efd0075caba9908e2e6e569b25b0',20,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(96,'dd28d96a253ab86846aedb25d1cca712',20,41,2,'name','|host_description| - Traffic - |query_ifName|'),(97,'ce425fed4eb3174e4f1cde9713eeafa0',20,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(98,'d0d05156ddb2c65181588db4b64d3907',20,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(99,'3b018f789ff72cc5693ef79e3a794370',20,41,1,'rrd_maximum','|query_ifSpeed|'),(100,'b225229dbbb48c1766cf90298674ceed',21,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(101,'c79248ddbbd195907260887b021a055d',21,41,2,'name','|host_description| - Traffic - |query_ifName|'),(102,'12a6750d973b7f14783f205d86220082',21,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(103,'25b151fcfe093812cb5c208e36dd697e',21,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(104,'e9ab404a294e406c20fdd30df766161f',21,41,1,'rrd_maximum','|query_ifSpeed|'),(105,'119578a4f01ab47e820b0e894e5e5bb3',22,41,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(106,'940e57d24b2623849c77b59ed05931b9',22,41,2,'name','|host_description| - Traffic - |query_ifName|'),(107,'0f045eab01bbc4437b30da568ed5cb03',22,41,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(108,'bd70bf71108d32f0bf91b24c85b87ff0',22,41,4,'name','|host_description| - Traffic - |query_ifDescr|'),(109,'fdc4cb976c4b9053bfa2af791a21c5b5',22,41,1,'rrd_maximum','|query_ifSpeed|'),(110,'584ef22294307be9a29d9a3aefc04b77',23,50,4,'name','|host_description| - Service State - |query_ServiceIndex|');
/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_sv`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `snmp_query_graph_sv` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `hash` varchar(32) NOT NULL default '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL default '0',
  `sequence` mediumint(8) unsigned NOT NULL default '0',
  `field_name` varchar(100) NOT NULL default '',
  `text` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snmp_query_graph_sv`
--

LOCK TABLES `snmp_query_graph_sv` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_sv` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_sv` VALUES (7,'437918b8dcd66a64625c6cee481fff61',6,1,'title','|host_description| - Disk Space - |query_dskPath|'),(5,'2ddc61ff4bd9634f33aedce9524b7690',7,1,'title','|host_description| - Wireless Levels (|query_kbWirelessStationName|)'),(6,'c72e2da7af2cdbd6b44a5eb42c5b4758',8,1,'title','|host_description| - Wireless Transmissions (|query_kbWirelessStationName|)'),(11,'a412c5dfa484b599ec0f570979fdbc9e',10,1,'title','|host_description| - Volume Information - |query_nwVolPhysicalName|'),(12,'48f4792dd49fefd7d640ec46b1d7bdb3',11,1,'title','|host_description| - Directory Information - |query_nwVolPhysicalName|'),(14,'',12,1,'title','|host_description| - Disk Space - |query_dskDevice|'),(15,'49dca5592ac26ff149a4fbd18d690644',13,1,'title','|host_description| - Traffic - |query_ifName|'),(16,'bda15298139ad22bdc8a3b0952d4e3ab',13,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(17,'29e48483d0471fcd996bfb702a5960aa',13,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(18,'3f42d358965cb94ce4f708b59e04f82b',14,1,'title','|host_description| - Traffic - |query_ifName|'),(19,'45f44b2f811ea8a8ace1cbed8ef906f1',14,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(20,'69c14fbcc23aecb9920b3cdad7f89901',14,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(21,'299d3434851fc0d5c0e105429069709d',2,1,'title','|host_description| - Errors - |query_ifName|'),(22,'8c8860b17fd67a9a500b4cb8b5e19d4b',2,2,'title','|host_description| - Errors - |query_ifIP| (|query_ifDescr|)'),(23,'d96360ae5094e5732e7e7496ceceb636',2,3,'title','|host_description| - Errors - |query_ifDescr|/|query_ifIndex|'),(24,'750a290cadc3dc60bb682a5c5f47df16',3,1,'title','|host_description| - Non-Unicast Packets - |query_ifName|'),(25,'bde195eecc256c42ca9725f1f22c1dc0',3,2,'title','|host_description| - Non-Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(26,'d9e97d22689e4ffddaca23b46f2aa306',3,3,'title','|host_description| - Non-Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(27,'48ceaba62e0c2671a810a7f1adc5f751',4,1,'title','|host_description| - Unicast Packets - |query_ifName|'),(28,'d6258884bed44abe46d264198adc7c5d',4,2,'title','|host_description| - Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(29,'6eb58d9835b2b86222306d6ced9961d9',4,3,'title','|host_description| - Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(30,'f21b23df740bc4a2d691d2d7b1b18dba',15,1,'title','|host_description| - Disk Space - |query_dskDevice|'),(31,'7fb4a267065f960df81c15f9022cd3a4',16,1,'title','|host_description| - Traffic - |query_ifName|'),(32,'e403f5a733bf5c8401a110609683deb3',16,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(33,'809c2e80552d56b65ca496c1c2fff398',16,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(34,'0a5eb36e98c04ad6be8e1ef66caeed3c',9,1,'title','|host_description| - Traffic - |query_ifName|'),(35,'4c4386a96e6057b7bd0b78095209ddfa',9,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(36,'fd3a384768b0388fa64119fe2f0cc113',9,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(38,'9852782792ede7c0805990e506ac9618',18,1,'title','|host_description| - Used Space - |query_hrStorageDescr|'),(39,'fa2f07ab54fce72eea684ba893dd9c95',19,1,'title','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|'),(40,'d99f8db04fd07bcd2260d246916e03da',17,1,'title','|host_description| - CPU Utilization - CPU|query_nwhrProcessorNum|'),(41,'f434ec853c479d424276f367e9806a75',20,1,'title','|host_description| - Traffic - |query_ifName|'),(42,'9b085245847444c5fb90ebbf4448e265',20,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(43,'5977863f28629bd8eb93a2a9cbc3e306',20,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(44,'37b6711af3930c56309cf8956d8bbf14',21,1,'title','|host_description| - Traffic - |query_ifName|'),(45,'cc435c5884a75421329a9b08207c1c90',21,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(46,'82edeea1ec249c9818773e3145836492',21,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(47,'87522150ee8a601b4d6a1f6b9e919c47',22,1,'title','|host_description| - Traffic - |query_ifName|'),(48,'993a87c04f550f1209d689d584aa8b45',22,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(49,'183bb486c92a566fddcb0585ede37865',22,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(50,'28ab9b8eb5aeb08369f84205221fbecc',23,4,'title','|host_description| - Service State - |query_ServiceIndex|');
/*!40000 ALTER TABLE `snmp_query_graph_sv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thold_data`
--

DROP TABLE IF EXISTS `thold_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `thold_data` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `rra_id` int(11) NOT NULL default '0',
  `data_id` int(11) NOT NULL default '0',
  `graph_id` int(11) NOT NULL default '0',
  `graph_template` int(11) NOT NULL default '0',
  `data_template` int(11) NOT NULL default '0',
  `thold_hi` varchar(100) default NULL,
  `thold_low` varchar(100) default NULL,
  `thold_fail_trigger` int(10) unsigned default NULL,
  `time_hi` varchar(100) default NULL,
  `time_low` varchar(100) default NULL,
  `time_fail_trigger` int(12) NOT NULL default '1',
  `time_fail_length` int(12) NOT NULL default '1',
  `thold_fail_count` int(11) NOT NULL default '0',
  `thold_alert` int(1) NOT NULL default '0',
  `thold_enabled` enum('on','off') NOT NULL default 'on',
  `thold_type` int(3) NOT NULL default '0',
  `bl_enabled` enum('on','off') NOT NULL default 'off',
  `bl_ref_time` int(50) unsigned default NULL,
  `bl_ref_time_range` int(10) unsigned default NULL,
  `bl_pct_down` int(10) unsigned default NULL,
  `bl_pct_up` int(10) unsigned default NULL,
  `bl_fail_trigger` int(10) unsigned default NULL,
  `bl_fail_count` int(11) unsigned default NULL,
  `bl_alert` int(2) NOT NULL default '0',
  `lastread` varchar(100) default NULL,
  `oldvalue` varchar(100) NOT NULL default '',
  `repeat_alert` int(10) unsigned default NULL,
  `notify_extra` varchar(255) default NULL,
  `host_id` int(10) default NULL,
  `syslog_priority` int(2) default '3',
  `data_type` int(3) NOT NULL default '0',
  `cdef` int(11) NOT NULL default '0',
  `percent_ds` varchar(64) NOT NULL,
  `template` int(11) NOT NULL default '0',
  `template_enabled` char(3) NOT NULL default '',
  `tcheck` int(1) NOT NULL default '0',
  `exempt` char(3) NOT NULL default 'off',
  `restored_alert` char(3) NOT NULL default 'off',
  PRIMARY KEY  (`id`),
  KEY `host_id` (`host_id`),
  KEY `rra_id` (`rra_id`),
  KEY `data_id` (`data_id`),
  KEY `graph_id` (`graph_id`),
  KEY `graph_template` (`graph_template`),
  KEY `data_template` (`data_template`),
  KEY `template` (`template`),
  KEY `template_enabled` (`template_enabled`),
  KEY `thold_enabled` (`thold_enabled`),
  KEY `tcheck` (`tcheck`),
  KEY `graph_id_2` (`graph_id`),
  KEY `graph_template_2` (`graph_template`),
  KEY `data_template_2` (`data_template`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `thold_data`
--

LOCK TABLES `thold_data` WRITE;
/*!40000 ALTER TABLE `thold_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `thold_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thold_template`
--

DROP TABLE IF EXISTS `thold_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `thold_template` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `data_template_id` int(32) NOT NULL default '0',
  `data_template_name` varchar(100) NOT NULL default '',
  `data_source_id` int(10) NOT NULL default '0',
  `data_source_name` varchar(100) NOT NULL default '',
  `data_source_friendly` varchar(100) NOT NULL default '',
  `thold_hi` varchar(100) default NULL,
  `thold_low` varchar(100) default NULL,
  `thold_fail_trigger` int(10) default '1',
  `time_hi` varchar(100) default NULL,
  `time_low` varchar(100) default NULL,
  `time_fail_trigger` int(12) NOT NULL default '1',
  `time_fail_length` int(12) NOT NULL default '1',
  `thold_enabled` enum('on','off') NOT NULL default 'on',
  `thold_type` int(3) NOT NULL default '0',
  `bl_enabled` enum('on','off') NOT NULL default 'off',
  `bl_ref_time` int(50) default NULL,
  `bl_ref_time_range` int(10) default NULL,
  `bl_pct_down` int(10) default NULL,
  `bl_pct_up` int(10) default NULL,
  `bl_fail_trigger` int(10) default NULL,
  `bl_alert` int(2) default NULL,
  `repeat_alert` int(10) NOT NULL default '12',
  `notify_extra` varchar(255) NOT NULL default '',
  `data_type` int(3) NOT NULL default '0',
  `cdef` int(11) NOT NULL default '0',
  `percent_ds` varchar(64) NOT NULL,
  `exempt` char(3) NOT NULL default 'off',
  `restored_alert` char(3) NOT NULL default 'off',
  PRIMARY KEY  (`id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `data_source_id` (`data_source_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Table of thresholds defaults for graphs';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `thold_template`
--

LOCK TABLES `thold_template` WRITE;
/*!40000 ALTER TABLE `thold_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `thold_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_auth` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `username` varchar(50) NOT NULL default '0',
  `password` varchar(50) NOT NULL default '0',
  `realm` mediumint(8) NOT NULL default '0',
  `full_name` varchar(100) default '0',
  `must_change_password` char(2) default NULL,
  `show_tree` char(2) default 'on',
  `show_list` char(2) default 'on',
  `show_preview` char(2) NOT NULL default 'on',
  `graph_settings` char(2) default NULL,
  `login_opts` tinyint(1) NOT NULL default '1',
  `policy_graphs` tinyint(1) unsigned NOT NULL default '1',
  `policy_trees` tinyint(1) unsigned NOT NULL default '1',
  `policy_hosts` tinyint(1) unsigned NOT NULL default '1',
  `policy_graph_templates` tinyint(1) unsigned NOT NULL default '1',
  `enabled` char(2) NOT NULL default 'on',
  PRIMARY KEY  (`id`),
  KEY `username` (`username`),
  KEY `realm` (`realm`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',0,'Administrator','','on','on','on','on',1,1,1,1,1,'on'),(2,'guest','43e9a4ab75570f5b',0,'Guest Account','on','on','on','on','on',3,1,1,1,1,''),(3,'bayu','eeaad1920468dbe7cbaca9af86c433b7',0,'Bayu Anggara Saputra','','on','on','on','on',1,1,1,1,1,'on');
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_perms`
--

DROP TABLE IF EXISTS `user_auth_perms`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_auth_perms` (
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  `item_id` mediumint(8) unsigned NOT NULL default '0',
  `type` tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (`user_id`,`item_id`,`type`),
  KEY `user_id` (`user_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_auth_perms`
--

LOCK TABLES `user_auth_perms` WRITE;
/*!40000 ALTER TABLE `user_auth_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_realm`
--

DROP TABLE IF EXISTS `user_auth_realm`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_auth_realm` (
  `realm_id` mediumint(8) unsigned NOT NULL default '0',
  `user_id` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`realm_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_auth_realm`
--

LOCK TABLES `user_auth_realm` WRITE;
/*!40000 ALTER TABLE `user_auth_realm` DISABLE KEYS */;
INSERT INTO `user_auth_realm` VALUES (1,1),(1,3),(2,1),(3,1),(4,1),(5,1),(7,1),(7,3),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(32,1),(33,1),(34,1),(37,1),(38,1),(42,1),(43,1),(47,1),(50,1),(68,1),(69,1),(72,1),(81,1),(86,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(106,3),(190,1),(800,1),(801,1),(802,1);
/*!40000 ALTER TABLE `user_auth_realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_log` (
  `username` varchar(50) NOT NULL default '0',
  `user_id` mediumint(8) NOT NULL default '0',
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  `result` tinyint(1) NOT NULL default '0',
  `ip` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`username`,`user_id`,`time`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES ('admin',1,'2009-12-12 09:43:09',1,'10.37.21.212'),('admin',0,'0000-00-00 00:00:00',3,'10.37.21.212'),('admin',1,'2009-12-12 10:24:54',1,'10.37.21.212'),('admin',1,'2009-12-12 13:43:32',1,'10.37.21.212'),('admin',1,'2009-12-12 16:37:23',1,'10.37.21.212'),('admin',1,'2009-12-12 18:47:19',1,'10.37.21.212'),('admin',1,'2009-12-13 09:20:45',1,'10.37.21.212'),('admin',1,'2009-12-14 18:11:53',1,'10.37.21.196'),('',0,'2009-12-15 11:07:55',0,'10.37.21.196'),('admin',1,'2010-01-25 06:39:40',1,'10.37.21.196'),('admin',1,'2010-01-27 06:49:26',1,'10.37.21.196'),('admin',1,'2010-01-27 07:13:08',1,'10.37.21.116'),('root',0,'2010-01-27 07:13:27',0,'10.37.21.116'),('root',0,'2010-01-27 07:13:34',0,'10.37.21.116'),('admin',1,'2010-01-27 07:13:40',1,'10.37.21.116'),('admin',1,'2010-01-27 07:22:44',1,'10.37.21.109'),('admin',1,'2010-01-27 07:53:03',1,'10.37.21.116'),('admin',1,'2010-01-27 08:33:11',1,'10.37.21.116'),('admin',1,'2010-01-27 09:05:58',1,'10.37.21.109'),('admin',1,'2010-01-27 09:14:41',1,'10.37.21.109'),('admin',0,'2010-01-27 10:20:14',0,'10.37.21.116'),('admin',1,'2010-01-27 10:20:21',1,'10.37.21.116'),('admin',1,'2010-02-11 07:34:54',1,'10.37.21.196'),('admin',1,'2010-02-11 09:50:08',1,'10.37.21.196'),('admin',1,'2010-02-11 11:01:09',1,'10.37.21.212'),('admin',1,'2010-04-30 10:02:40',1,'10.37.21.196'),('admin',1,'2010-05-06 04:15:18',1,'10.37.21.196'),('admin',1,'2010-05-06 09:13:24',1,'10.37.21.196'),('admin',1,'2010-05-07 02:11:31',1,'10.37.21.196'),('admin',1,'2010-05-18 03:17:15',1,'10.37.21.196'),('admin',1,'2010-05-18 07:24:26',1,'10.37.21.196'),('admin',1,'2010-05-18 16:40:28',1,'10.37.21.196'),('admin',1,'2010-05-21 08:11:52',1,'10.37.21.196'),('admin',1,'2010-05-23 19:08:51',1,'10.37.21.196'),('admin',1,'2010-05-25 02:45:23',1,'10.37.21.196'),('admin',1,'2010-05-26 06:32:31',1,'10.37.21.196'),('admin',1,'2010-05-26 06:50:33',1,'10.37.21.196'),('admin',1,'2010-05-30 19:49:44',1,'10.37.21.196'),('admin',1,'2010-05-31 04:12:36',1,'10.88.10.160'),('admin',1,'2010-05-31 05:03:57',1,'10.37.21.189'),('admin',1,'2010-06-01 02:30:16',1,'10.37.21.189'),('admin',1,'2010-06-01 02:30:34',1,'10.11.4.47'),('admin',1,'2010-06-01 04:47:09',1,'10.37.21.196'),('admin',1,'2010-06-01 10:53:15',1,'10.37.21.196'),('admin',1,'2010-06-02 04:27:54',1,'10.37.21.196'),('bayu',3,'2010-06-02 07:06:09',1,'10.37.21.196'),('bayu',0,'0000-00-00 00:00:00',3,'10.37.21.196'),('admin',1,'2010-06-02 07:06:31',1,'10.37.21.196'),('bayu',3,'2010-06-02 07:07:21',1,'10.37.21.196'),('admin',1,'2010-06-02 07:08:23',1,'10.37.21.196'),('admin',1,'2010-06-03 04:35:52',1,'10.37.21.196'),('admin',1,'2010-06-03 07:35:19',1,'10.37.21.196'),('kptel',0,'2010-06-04 14:17:04',0,'10.37.21.137'),('',0,'2010-06-04 14:17:11',0,'10.37.21.245'),('admin',1,'2010-06-04 14:17:14',1,'10.37.21.245'),('admin',1,'2010-06-04 14:18:00',1,'10.37.21.137'),('',0,'2010-06-04 15:01:48',0,'10.37.21.203'),('user',0,'2010-06-04 15:01:52',0,'10.37.21.203'),('admin',1,'2010-06-04 15:02:07',1,'10.37.21.203'),('kptel',0,'2010-06-04 15:02:29',0,'10.37.21.203'),('admin',1,'2010-06-04 15:02:42',1,'10.37.21.203'),('admin',1,'2010-06-04 15:04:47',1,'10.37.21.203'),('admin',1,'2010-06-04 16:12:26',1,'10.37.21.157'),('admin',1,'2010-06-04 18:05:14',1,'10.37.21.189'),('admin',1,'2010-06-07 07:52:07',1,'10.37.21.137');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `version` (
  `cacti` char(20) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES ('0.8.7c');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weathermap_auth`
--

DROP TABLE IF EXISTS `weathermap_auth`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `weathermap_auth` (
  `userid` mediumint(9) NOT NULL default '0',
  `mapid` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `weathermap_auth`
--

LOCK TABLES `weathermap_auth` WRITE;
/*!40000 ALTER TABLE `weathermap_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `weathermap_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weathermap_data`
--

DROP TABLE IF EXISTS `weathermap_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `weathermap_data` (
  `id` int(11) NOT NULL auto_increment,
  `rrdfile` varchar(255) NOT NULL,
  `data_source_name` varchar(19) NOT NULL,
  `last_time` int(11) NOT NULL,
  `last_value` varchar(255) NOT NULL,
  `last_calc` varchar(255) NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `rrdfile` (`rrdfile`),
  KEY `data_source_name` (`data_source_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `weathermap_data`
--

LOCK TABLES `weathermap_data` WRITE;
/*!40000 ALTER TABLE `weathermap_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `weathermap_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weathermap_maps`
--

DROP TABLE IF EXISTS `weathermap_maps`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `weathermap_maps` (
  `id` int(11) NOT NULL auto_increment,
  `sortorder` int(11) NOT NULL default '0',
  `active` set('on','off') NOT NULL default 'on',
  `configfile` text NOT NULL,
  `imagefile` text NOT NULL,
  `htmlfile` text NOT NULL,
  `titlecache` text NOT NULL,
  `filehash` varchar(40) NOT NULL default '',
  `warncount` int(11) NOT NULL default '0',
  `config` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `weathermap_maps`
--

LOCK TABLES `weathermap_maps` WRITE;
/*!40000 ALTER TABLE `weathermap_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `weathermap_maps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-06-07  1:14:05
