-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: Blog
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

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
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_date` date NOT NULL,
  `headline` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `writer` varchar(20) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES (1,'2017-01-06','第一个标题','第一个中文标题','庞海飞',1),(2,'2017-01-10','中国','中华人民共和国成立于１９４９年','庞海飞',1),(3,'2017-01-10','百度','百度中国中国百度','庞海飞',1),(4,'2017-01-10','草稿一','厉害了我的姐','庞冬冬',1),(5,'2017-01-13','草稿二修改发布状态','这是草稿的内容，把草稿改成文章发表出去把。\r\n','庞冬冬',1),(6,'2017-01-10','python，django','这是一个python和django的主题分类','庞海飞',1),(7,'2017-01-13','[ext4]04 磁盘布局 - Meta Block Groups','Meta Block Groups，可以翻译为元块组集。\r\n\r\n如果不采用Meta Block Groups特性，在每个冗余备份的超级块的后面是一个完整的(包含所有块组描述符的)块组描述符表的备份。如前所述(group分析中已经说明，group最大为128M，即2^27 bytes)，那么一个group全部存储groups元数据，才会有2^27 / 64=2^21个，更何况，也无法全部用来存储groups元数据。这样会产生一个限制，以Ext4的块组描述符大小64 Bytes计算，文件系统中最多只能有2^21个块组，也就是文件系统最大为256TB。\r\n\r\n使用Meta Block Groups特性，整个文件系统被分成多个元块组集(metablock groups)，每个元块组集都是一簇块组组成(簇的含义：一系列物理地址连续的单元)，组成metablock groups的块组描述符都存放在一个block中。对于block大小为4K的Ext4文件系统，一个元块组包含64个块组，也就是64G的磁盘空间(128M*64=8G)。Meta Block Groups特性将存放在系统第一个块组的元数据分割存放在多个MetaBlock Groups中。\r\n\r\n因为Ext4支持的是48bits block寻址方式，所以最大卷大小为2^48个block，2^48*2^12=2^60B=1EB，而每个group为128M=2^27B，所以有2^60/2^27=2^33个group。\r\n\r\n那么为什么是48bits寻址而不是64bits哪，虽然在ext4_super_block中blocks寻址的高位和地位均为32bits：\r\n\r\n__le32\r\ns_blocks_count_lo; /* Blocks count */\r\n\r\n__le32\r\ns_blocks_count_hi; /* Blocks count */\r\n\r\n原因在于：在使得ext4系统完全支持64bits block寻址时，还有一些限制没有解决，但是可以相信的是，在以后某个时候肯定会完全支持64bits。\r\n\r\nMeta Block Groups特性的出现使得Ext3和Ext4的磁盘布局有了一定的变化，以往超级块后紧跟的是变长的GDT块，现在是超级块依然决定于是否是3,5,7的幂，而块组描述符集则存储在元块组的第一个，第二个和最后一个块组的开始处。\r\n\r\n在两种情况下我们可能会用到这种新布局：\r\n\r\n(1) 文件系统创建时。用户可以指定使用这种布局。\r\n\r\n(2) 当文件系统增长而且预留的组描述符块耗尽时。目前超级块中有一个域s_first_meta_bg用于描述第一个使用元块组的块组。\r\n\r\n当增加新块组时，我们不需要给组描述符表预留空间，而是在当前文件系统后面直接添加新的元块组就可以了。','庞海飞',1),(8,'2017-01-13','文章没有加入上传图片这个，也没有加动态新增主题这个功能','先这样吧，我来测试一下整体的结构那里有什么问题，今天发现了几个bug，我也是醉了，太大意了。。\r\n汗突然觉得这个博客内容好少','庞海飞',1),(9,'2017-05-03','阿里云远程登录终端密码','650051','庞海飞',1),(10,'2017-05-03','阿里云部署流程之mysql数据库安装','可以参考　　http://www.tuicool.com/articles/ay6zMfV\r\n　　　　　　http://stackoverflow.com/questions/21517051/command-python-setup-py-egg-info-failed-with-error-code-1\r\n\r\n1、安装mysql数据库\r\n　　　sudo apt-get install mysql-server\r\n　　　sudo apt-get install mysql-client\r\n　　　密码设置为123了\r\n　　　安装好之后　　可以尝试　\r\n　  mysql -u root -p 123看能不能进入mysql里面，成功的话安装成功\r\n\r\n　　sudo apt-get install libmysqlclient-dev　　接着输入这行命令　否则下一步会出错　　会提示　mysql_config not found\r\n２、安装MySQL-python\r\n\r\n　　sudo pip install MySQL-python　搞定','hafy',1);
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article_themes`
--

DROP TABLE IF EXISTS `Article_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Article_theme_article_id_84270b70_uniq` (`article_id`,`theme_id`),
  KEY `Article_themes_theme_id_bac66698_fk_theme_id` (`theme_id`),
  CONSTRAINT `Article_themes_article_id_ba5ad3b0_fk_Article_id` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`),
  CONSTRAINT `Article_themes_theme_id_bac66698_fk_theme_id` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article_themes`
--

LOCK TABLES `Article_themes` WRITE;
/*!40000 ALTER TABLE `Article_themes` DISABLE KEYS */;
INSERT INTO `Article_themes` VALUES (1,6,1),(2,6,2),(3,7,3),(4,8,2),(5,9,2),(6,10,2);
/*!40000 ALTER TABLE `Article_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Author_articles`
--

DROP TABLE IF EXISTS `Author_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Author_articles_author_id_99375ddf_uniq` (`author_id`,`article_id`),
  KEY `Author_articles_article_id_0642e105_fk_Article_id` (`article_id`),
  CONSTRAINT `Author_articles_article_id_0642e105_fk_Article_id` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`),
  CONSTRAINT `Author_articles_author_id_491e90b7_fk_Author_id` FOREIGN KEY (`author_id`) REFERENCES `Author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author_articles`
--

LOCK TABLES `Author_articles` WRITE;
/*!40000 ALTER TABLE `Author_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Author_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_username` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `article_id` int(11) NOT NULL,
  `comment_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Comment_article_id_751c92ab_fk_Article_id` (`article_id`),
  CONSTRAINT `Comment_article_id_751c92ab_fk_Article_id` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (1,'pdd','这是篇好文章',1,'2017-01-10 09:28:43'),(2,'pdd','还算不错的文章',1,'2017-01-10 09:28:43'),(3,'pdd','还算不错的文章',1,'2017-01-10 09:28:43'),(4,'pdd','国家，中国',2,'2017-01-10 09:30:18'),(5,'pdd','国家，中国',2,'2017-01-10 09:31:02'),(6,'西西','好奇怪啊，文章内容我写的只显示２０个字节了啊，怎么还是全部显示了呢？我来试试看这个评论是不是也是这样，应该有２０个自己字节了吧',7,'2017-01-13 08:40:26'),(7,'pdd','阿里云　实例密码　是Phf520207',9,'2017-05-03 05:05:29'),(8,'pdd','',9,'2017-05-03 05:05:30'),(9,'pdd','服务器新建了一个用户hafy 密码是123',9,'2017-05-03 05:46:02');
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add article',8,'add_article'),(23,'Can change article',8,'change_article'),(24,'Can delete article',8,'delete_article'),(25,'Can add comment',9,'add_comment'),(26,'Can change comment',9,'change_comment'),(27,'Can delete comment',9,'delete_comment'),(28,'Can add theme',10,'add_theme'),(29,'Can change theme',10,'change_theme'),(30,'Can delete theme',10,'delete_theme');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$SGczZmzVL5a3$HbpAFSX6AjlwCjYUJCT2pOG9Lk3D+/CZUjXEVc3mBh4=','2017-01-06 10:08:03',0,'phf','','','123@11.com',0,1,'2017-01-06 10:07:09'),(2,'pbkdf2_sha256$30000$7aYypkDzy3Z1$t+eQb1pmufCX2pciaLmN6SUS542lY4yJBT2v5OTUXCs=',NULL,0,'dongdongpang','','','123@11.com',0,1,'2017-01-06 12:19:01'),(3,'pbkdf2_sha256$30000$aDplo8sTBFjZ$E3hK5mmPQ9bkdqLVLJgv4b/a004wYOePmx/5vM+viY4=','2017-05-03 04:45:29',0,'pdd','','','',0,1,'2017-01-06 12:40:17'),(4,'pbkdf2_sha256$30000$A85v6HZWsJA3$AWV0tvqb0WdOBQuzaoewJJVP+uJwpwBBX0QYGOI8AVI=','2017-01-11 01:58:23',0,'pxixi','','','',0,1,'2017-01-11 01:58:14'),(5,'pbkdf2_sha256$30000$eqTLfbiDB8sp$iWMukyrJz2AXFQS8ZgSm63pp17oPLO8It6izRNG+L38=','2017-01-11 02:00:25',1,'pnn','','','',1,1,'2017-01-11 02:00:04'),(6,'pbkdf2_sha256$30000$3hKsbEOVK5hg$JhoqGKqEB8oknSBCivl0XFcecwtvfpNONJcGSlNPxA4=','2017-01-13 08:31:33',0,'西西','','','',0,1,'2017-01-11 07:55:01'),(7,'pbkdf2_sha256$30000$5ZiVtEn6d2r0$OxHOyeGHf0PT6i+UdhvhTYOxCZWRjIHgpZ/G+Tl4+fI=','2017-01-13 08:12:39',0,'pmm','','','',0,1,'2017-01-13 08:12:34');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(8,'myform','article'),(7,'myform','author'),(9,'myform','comment'),(10,'myform','theme'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-01-06 10:05:56'),(2,'auth','0001_initial','2017-01-06 10:05:58'),(3,'admin','0001_initial','2017-01-06 10:05:59'),(4,'admin','0002_logentry_remove_auto_add','2017-01-06 10:05:59'),(5,'contenttypes','0002_remove_content_type_name','2017-01-06 10:05:59'),(6,'auth','0002_alter_permission_name_max_length','2017-01-06 10:05:59'),(7,'auth','0003_alter_user_email_max_length','2017-01-06 10:05:59'),(8,'auth','0004_alter_user_username_opts','2017-01-06 10:05:59'),(9,'auth','0005_alter_user_last_login_null','2017-01-06 10:06:00'),(10,'auth','0006_require_contenttypes_0002','2017-01-06 10:06:00'),(11,'auth','0007_alter_validators_add_error_messages','2017-01-06 10:06:00'),(12,'auth','0008_alter_user_username_max_length','2017-01-06 10:06:00'),(13,'myform','0001_initial','2017-01-06 10:06:00'),(14,'sessions','0001_initial','2017-01-06 10:06:01'),(15,'myform','0002_comment','2017-01-10 05:43:23'),(16,'myform','0003_comment_comment_date','2017-01-10 09:28:43'),(17,'myform','0004_theme','2017-01-10 13:39:37'),(18,'myform','0005_auto_20170110_1350','2017-01-10 13:50:07'),(19,'myform','0006_auto_20170110_1400','2017-01-10 14:00:34'),(20,'myform','0007_auto_20170116_0753','2017-05-03 04:14:39'),(21,'myform','0008_auto_20170116_0754','2017-05-03 04:14:39'),(22,'myform','0009_auto_20170116_0803','2017-05-03 04:14:40');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0a4uslr383umr14zt6oc6s28xit8pce6','YTQ3ODZhMmY1M2Q3MGEzOWNmNjFjYzEwZjI0NDZjNzZkZWRmNGY5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5YjIzNjIyMGFjZjcwYjdhMTc1NDhlZDE1NzhkMzlmN2E3MTA4NzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2017-01-27 08:12:39'),('gegg9v32domf3cxkat5pzgvl2j46ws1g','NDZjZmY1M2JlYTNiMWVjOGU5MzdkZGIyYWRiYWViZjg3OGE0ZTk1YTp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ5MGFhYzllYTk2NDA3MzM1NzY4Zjk2NDM0M2NjZmRmNmJjZjZlN2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=','2017-05-17 04:45:29');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (1,'python'),(2,'django'),(3,'linux');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-04 17:30:41
