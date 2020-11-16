CREATE DATABASE  IF NOT EXISTS `sswh` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sswh`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 192.168.219.130    Database: sswh
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '正文内容',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `orderid` int(11) NOT NULL DEFAULT '0',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '标题图片url，中间用；分隔',
  `attachurl` varchar(255) DEFAULT NULL COMMENT '附件url，中间用；分隔',
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'强劲就','这是要背诵的正文',NULL,NULL,0,NULL,NULL),(2,'静夜','啊发的发',NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_frontuser`
--

DROP TABLE IF EXISTS `content_frontuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_frontuser` (
  `iid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciid` int(10) unsigned DEFAULT '0' COMMENT '背诵内容的 cid\r\n',
  `uiid` int(10) unsigned DEFAULT '0' COMMENT '前台用户的id',
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_frontuser`
--

LOCK TABLES `content_frontuser` WRITE;
/*!40000 ALTER TABLE `content_frontuser` DISABLE KEYS */;
INSERT INTO `content_frontuser` VALUES (1,1,12),(2,2,12);
/*!40000 ALTER TABLE `content_frontuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_repeatdate`
--

DROP TABLE IF EXISTS `content_repeatdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_repeatdate` (
  `iid` bigint(20) NOT NULL AUTO_INCREMENT,
  `repeatdate` date DEFAULT NULL,
  `uiid` int(11) DEFAULT NULL,
  `ciid` int(11) DEFAULT NULL,
  `state` int(1) DEFAULT '2' COMMENT '查阅状态 1、已复习 2、未复习 3、不再复习',
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_repeatdate`
--

LOCK TABLES `content_repeatdate` WRITE;
/*!40000 ALTER TABLE `content_repeatdate` DISABLE KEYS */;
INSERT INTO `content_repeatdate` VALUES (1,'2020-09-16',12,1,2),(2,'2020-09-01',12,1,2),(3,'2020-09-15',12,1,2),(4,'2020-09-24',12,2,2),(5,'2020-09-15',12,2,2);
/*!40000 ALTER TABLE `content_repeatdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluation` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL COMMENT '登录名',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `grade` varchar(255) DEFAULT NULL COMMENT '年纪',
  `class` varchar(255) DEFAULT NULL COMMENT '班级',
  `year` varchar(255) DEFAULT NULL COMMENT '年度',
  `evaluater` varchar(255) DEFAULT NULL COMMENT '评价人',
  `comment` varchar(255) DEFAULT NULL COMMENT '评语',
  `evaluate_time` datetime DEFAULT NULL COMMENT '评价时间',
  `replay` varchar(255) DEFAULT NULL COMMENT '回复',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_show` int(1) DEFAULT '0' COMMENT '前台是否展示 0 不展示 1 展示',
  `redflags` int(5) DEFAULT NULL COMMENT '小红旗数',
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frontuser`
--

DROP TABLE IF EXISTS `frontuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frontuser` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `sex` varchar(11) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL COMMENT '0 男 1 女',
  `identity` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` int(255) DEFAULT '0' COMMENT '0:无效 1：有效 ',
  `code` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `sign` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `logins` varchar(255) DEFAULT NULL,
  `jointime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isstudent` int(11) DEFAULT '0',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `district` varchar(255) DEFAULT NULL COMMENT '县',
  `school` varchar(255) DEFAULT NULL COMMENT '学校',
  `grade` varchar(255) DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frontuser`
--

LOCK TABLES `frontuser` WRITE;
/*!40000 ALTER TABLE `frontuser` DISABLE KEYS */;
INSERT INTO `frontuser` VALUES (12,'christmas','christmas',NULL,NULL,NULL,'2020-01-03',NULL,'821@qq.com','15705113890',NULL,1,NULL,NULL,NULL,NULL,'南通市',NULL,NULL,NULL,NULL,'2020-09-16 12:30:55',1,'江苏省','玄武区',NULL,'七'),(23,'王五1111','五个111','20969a589b0e16bf2a123cb88747a442','7ab35b8716a44c5abc3d84ef4a5f0d50','0','2020-01-02','411324199301023210','111@qq.com','13837712138',NULL,1,NULL,NULL,NULL,NULL,'唐山市',NULL,NULL,NULL,NULL,'2020-09-16 12:30:57',1,'河北省','开平区','南京','七'),(24,'11111111111','111111','f05d04687b5b0734f2108307d6efe551','be09ddc35683491db2541d5632d62fe3','1','2020-01-09','411324199301023210','11@qq.com','13837744444',NULL,1,NULL,NULL,NULL,NULL,'南京市',NULL,NULL,NULL,NULL,'2020-06-07 04:23:00',0,'江苏省','玄武区','11','七'),(25,'11111','111111','1e233063115b28e8d87a13a8abe5c528','36708235568f4876999f1bd74644e2b5','1','2020-01-09','411324199001023211','11@qq.com','17625928706',NULL,0,NULL,NULL,NULL,NULL,'南京市',NULL,NULL,NULL,NULL,NULL,0,'江苏省','玄武区','1','七'),(35,'wangcheng',NULL,'1beaab41f4047f88f4d10732762159b0','69bcdeb8-9837-4b76-ab00-fadbaeb07321',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(36,'c','李继宣是个聪明','16e9161a48d58f8be215a9166faa52df','be9245aa-b38a-4e2e-a8ed-8d45d14aa9a2','0','2010-02-09','320921199207085977','2247@qq.com','17352371998',NULL,0,NULL,NULL,NULL,NULL,'南京市',NULL,NULL,NULL,NULL,'2020-06-07 14:51:23',0,'江苏省','玄武区','浦口外国语学校','八');
/*!40000 ALTER TABLE `frontuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_config`
--

DROP TABLE IF EXISTS `grade_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_config` (
  `grade` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_config`
--

LOCK TABLES `grade_config` WRITE;
/*!40000 ALTER TABLE `grade_config` DISABLE KEYS */;
INSERT INTO `grade_config` VALUES ('七','chinese,math,english'),('八','chinese,math,english,physics,chemistry,history'),('九','chinese,math,english,physics,chemistry,history,geography,biology,polity');
/*!40000 ALTER TABLE `grade_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthindex`
--

DROP TABLE IF EXISTS `healthindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthindex` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) DEFAULT NULL,
  `studentName` varchar(255) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `lungIndex` double DEFAULT NULL,
  `lung` double DEFAULT NULL,
  `faceArea` double DEFAULT NULL,
  `left_eye` float(255,0) DEFAULT NULL,
  `right_eye` float DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthindex`
--

LOCK TABLES `healthindex` WRITE;
/*!40000 ALTER TABLE `healthindex` DISABLE KEYS */;
INSERT INTO `healthindex` VALUES (1,'ss0000','王成成',173,66,0,0,0,0,0,'2019-06-18 00:07:17'),(2,'ss0000','王成成',174,55,0,0,0,0,0,'2019-06-04 00:08:26'),(3,'ss0000','王成成',177,78,0,0,0,0,0,'2019-05-18 00:09:30');
/*!40000 ALTER TABLE `healthindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_group`
--

DROP TABLE IF EXISTS `platform_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `piid` varchar(255) DEFAULT NULL,
  `codeid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `pinyin` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_group`
--

LOCK TABLES `platform_group` WRITE;
/*!40000 ALTER TABLE `platform_group` DISABLE KEYS */;
INSERT INTO `platform_group` VALUES (1,'莘深文化','所有机构',NULL,'xxxggg',1,'JGGL'),(2,'浦口外国语学区','旭日爱上城第四区北区十三幢','','pkwgy',2,'PKWGY'),(3,'金陵中学fen',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `platform_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_groupmanager`
--

DROP TABLE IF EXISTS `platform_groupmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_groupmanager` (
  `iid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_groupmanager`
--

LOCK TABLES `platform_groupmanager` WRITE;
/*!40000 ALTER TABLE `platform_groupmanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `platform_groupmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_permission`
--

DROP TABLE IF EXISTS `platform_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_permission` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `specify` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_permission`
--

LOCK TABLES `platform_permission` WRITE;
/*!40000 ALTER TABLE `platform_permission` DISABLE KEYS */;
INSERT INTO `platform_permission` VALUES (1,'user:add','用户新增'),(2,'user:delete','用户删除');
/*!40000 ALTER TABLE `platform_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_role_user_group`
--

DROP TABLE IF EXISTS `platform_role_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_role_user_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_role_user_group`
--

LOCK TABLES `platform_role_user_group` WRITE;
/*!40000 ALTER TABLE `platform_role_user_group` DISABLE KEYS */;
INSERT INTO `platform_role_user_group` VALUES (1,2,18,1),(2,3,8,1);
/*!40000 ALTER TABLE `platform_role_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_roles_permissions`
--

DROP TABLE IF EXISTS `platform_roles_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_roles_permissions` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_roles_permissions`
--

LOCK TABLES `platform_roles_permissions` WRITE;
/*!40000 ALTER TABLE `platform_roles_permissions` DISABLE KEYS */;
INSERT INTO `platform_roles_permissions` VALUES (1,2,1),(2,3,2);
/*!40000 ALTER TABLE `platform_roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_user_roles`
--

DROP TABLE IF EXISTS `platform_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_user_roles` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `useruuid` varchar(255) DEFAULT NULL,
  `roleuuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_user_roles`
--

LOCK TABLES `platform_user_roles` WRITE;
/*!40000 ALTER TABLE `platform_user_roles` DISABLE KEYS */;
INSERT INTO `platform_user_roles` VALUES (1,'Mark','admin');
/*!40000 ALTER TABLE `platform_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platformrole`
--

DROP TABLE IF EXISTS `platformrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platformrole` (
  `iid` int(11) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `spec` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0系统管理员',
  `pinYin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platformrole`
--

LOCK TABLES `platformrole` WRITE;
/*!40000 ALTER TABLE `platformrole` DISABLE KEYS */;
INSERT INTO `platformrole` VALUES (1,'321321312','管理员','拥有系统的最高权限',NULL,0,'GLY'),(2,'321ewq','普通用户','普通的用户',NULL,0,'PTYH');
/*!40000 ALTER TABLE `platformrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platformuser`
--

DROP TABLE IF EXISTS `platformuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platformuser` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `mobilephone` varchar(11) DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `groupiid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`) USING BTREE,
  UNIQUE KEY `t_platformuser_t_mobilephone_uindex` (`mobilephone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='平台后台用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platformuser`
--

LOCK TABLES `platformuser` WRITE;
/*!40000 ALTER TABLE `platformuser` DISABLE KEYS */;
INSERT INTO `platformuser` VALUES (8,'wby','04f4e477056b9625a7821e6022fb5337','1373220936','32092119921','44a0e43436594b1a8714655e1638c713',2),(18,'wang','04f4e477056b9625a7821e6022fb5337','17625908314','320921199207085977','44a0e43436594b1a8714655e1638c713',1),(19,'zhangqingqing','2f385d17afadd541a8476af6a18243d9','15705113890','3209211992.07085977','5b9f593cf214466db167702001ba02b4',1);
/*!40000 ALTER TABLE `platformuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruit`
--

DROP TABLE IF EXISTS `recruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruit` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subject` int(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `humanResource` varchar(255) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL COMMENT '招聘截止时间不做功能上的截止',
  `salaryLow` float(8,2) DEFAULT NULL COMMENT '底薪薪酬范围下限',
  `salaryHigh` float(8,2) DEFAULT NULL COMMENT '高薪薪酬范围上限',
  `pageshow` int(11) DEFAULT NULL COMMENT '0不展示1展示',
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='招聘信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruit`
--

LOCK TABLES `recruit` WRITE;
/*!40000 ALTER TABLE `recruit` DISABLE KEYS */;
INSERT INTO `recruit` VALUES (66,'ewqewqe',1,'dfsafhello','wang cheng cheng','17352371998','821658917@qq.com',NULL,'2020-04-01 00:00:00','2020-04-01 00:00:00',32132.00,32132.00,0,0),(68,'c',1,'fdsafda','312312','15705113890','821658917@qq.com',NULL,'2020-04-01 00:00:00','2020-04-24 00:00:00',32132.00,32131.00,0,0),(69,'fdasfa',1,'fdasfas','ewqewqewq','15705113890','821658917@qq.com',NULL,'2020-03-31 00:00:00','2020-03-31 00:00:00',321.00,32132.00,0,0),(70,'ewqewqe',1,'weqw','321312','15705113890','821658917@qq.com',NULL,'2020-03-10 00:00:00','2020-03-06 00:00:00',3213.00,21312.00,0,0),(71,'fadsfa',1,'fdasfdas','231321','15705113890','821658917@qq.com',NULL,'2020-03-31 00:00:00','2020-03-31 00:00:00',32321.00,21312.00,1,0),(82,'南京莘深文化艺术培训有限公司',6,'招聘历史老师\n需要有教师资格证','王成成','15705113890','821658917@qq.com',NULL,'2020-03-28 00:00:00','2023-07-20 00:00:00',12312.00,31232.00,0,0),(83,'响水嘉成店祝各位鼠年大吉！',3,'发大水法大','3213','17625908314','321321@qq.com',NULL,'2020-03-28 00:00:00','2020-04-21 00:00:00',3213.00,32131.00,1,0),(84,'响水嘉成店祝各位鼠年大吉！',1,'语文特级教师，有教师资格证书','笔名：知网','17625908314','821658917@qq.com',NULL,'2020-03-28 00:00:00','2020-09-11 00:00:00',2000.00,5000.00,1,0);
/*!40000 ALTER TABLE `recruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remember_list`
--

DROP TABLE IF EXISTS `remember_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remember_list` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `remember_list_iid_uindex` (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remember_list`
--

LOCK TABLES `remember_list` WRITE;
/*!40000 ALTER TABLE `remember_list` DISABLE KEYS */;
INSERT INTO `remember_list` VALUES (1,12345,'news',NULL,'2020-08-06 11:32:53',NULL),(2,12345,'news',NULL,'2020-08-06 11:34:45',NULL),(3,12345,'news',NULL,'2020-08-06 13:06:39',NULL),(4,12345,'news',NULL,'2020-08-06 13:07:23',NULL),(5,12345,'news',NULL,'2020-08-06 13:08:45',NULL),(6,7788,'要学习呀','goodafternoon','2020-08-06 16:14:40',NULL),(7,7788,'静夜思','床前明月光，疑似地上霜，举头望明月，低头思故乡','2020-08-06 16:35:50',NULL),(8,7788,'观沧海','东临碣石以观沧海，水和蛋蛋山道送至','2020-08-06 16:36:00',NULL),(9,7788,'将进酒','《将进酒》\n李白\n君不见， \n黄河之水天上来，奔流到海不复回。 \n君不见，\n 高堂明镜悲白发，朝如青丝暮成雪。 \n人生得意须尽欢，莫使金樽空对月。 \n天生我材必有用，千金散尽还复来。 \n烹羊宰牛且为乐，会须一饮三百杯。 \n岑夫子，丹丘生，将进酒，杯莫停。 \n与君歌一曲，请君为我倾耳听。\n 钟鼓馔玉不足贵，但愿长醉不复醒。 \n古来圣贤皆寂寞，惟有饮者留其名。\n 陈王昔时宴平乐，斗酒十千恣欢谑。 \n主人何为言少钱，径须沽取对君酌。 \n五花马，千金裘， \n呼儿将出换美酒，与尔同销万古愁','2020-08-06 22:07:16',NULL),(13,7788,NULL,'看见了就离开家了就零零',NULL,NULL),(14,7788,NULL,'打发发达省份大',NULL,NULL),(15,7788,NULL,'发的说法发生法发大',NULL,NULL),(16,7788,'将进酒','《将进酒》\n李白\n君不见， \n黄河之水天上来，奔流到海不复回。 \n君不见，\n 高堂明镜悲白发，朝如青丝暮成雪。 \n人生得意须尽欢，莫使金樽空对月。 \n天生我材必有用，千金散尽还复来。 \n烹羊宰牛且为乐，会须一饮三百杯。 \n岑夫子，丹丘生，将进酒，杯莫停。 \n与君歌一曲，请君为我倾耳听。\n 钟鼓馔玉不足贵，但愿长醉不复醒。 \n古来圣贤皆寂寞，惟有饮者留其名。\n 陈王昔时宴平乐，斗酒十千恣欢谑。 \n主人何为言少钱，径须沽取对君酌。 \n五花马，千金裘， \n呼儿将出换美酒，与尔同销万古愁','2020-08-27 10:54:11',NULL),(17,7788,NULL,'fadsfasfas',NULL,NULL),(18,7788,NULL,'fdsafafa',NULL,NULL);
/*!40000 ALTER TABLE `remember_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remember_log`
--

DROP TABLE IF EXISTS `remember_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remember_log` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `remember_list_iid` int(11) DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `client` int(11) DEFAULT NULL COMMENT '1、pc\n2、wx小程序\n3、wx公众号\n4、支付宝小程序\n5、短信',
  `result` tinyint(1) NOT NULL,
  `finished` int(11) NOT NULL DEFAULT '0' COMMENT '1、已读\n0、未读 default\n',
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remember_log`
--

LOCK TABLES `remember_log` WRITE;
/*!40000 ALTER TABLE `remember_log` DISABLE KEYS */;
INSERT INTO `remember_log` VALUES (1,111,'2020-08-05 16:07:17',2,1,0),(2,5,'2020-08-06 13:08:45',1,1,0),(3,5,'2020-08-06 13:08:45',1,1,0),(4,5,'2020-08-06 13:08:45',1,1,0),(5,5,'2020-08-06 13:08:45',1,1,0),(6,5,'2020-08-06 13:08:45',1,1,0),(7,5,'2020-08-06 13:08:45',1,1,0),(8,5,'2020-08-06 13:08:45',1,1,0),(9,5,'2020-08-06 13:08:45',1,1,0),(10,5,'2020-08-06 13:08:45',1,1,0),(11,5,'2020-08-06 13:08:45',1,1,0),(12,6,'2020-08-06 16:34:41',1,1,0),(13,6,'2020-08-07 16:14:41',1,1,0),(14,6,'2020-08-08 16:14:41',1,1,0),(15,6,'2020-08-11 16:14:41',1,1,0),(16,6,'2020-08-13 16:14:41',1,1,0),(17,6,'2020-08-14 16:14:41',1,1,0),(18,6,'2020-08-15 16:14:41',1,1,0),(19,7,'2020-08-06 16:55:51',1,1,0),(20,7,'2020-08-07 16:35:51',1,1,0),(21,7,'2020-08-08 16:35:51',1,1,0),(22,7,'2020-08-11 16:35:51',1,1,0),(23,7,'2020-08-13 16:35:51',1,1,0),(24,7,'2020-08-14 16:35:51',1,1,0),(25,7,'2020-08-15 16:35:51',1,1,0),(26,8,'2020-08-06 16:56:06',1,1,0),(27,8,'2020-08-07 16:36:06',1,1,0),(28,8,'2020-08-08 16:36:06',1,1,0),(29,8,'2020-08-11 16:36:06',1,1,0),(30,8,'2020-08-13 16:36:06',1,1,0),(31,8,'2020-08-14 16:36:06',1,1,0),(32,8,'2020-08-15 16:36:06',1,1,0),(33,9,'2020-08-06 22:27:17',1,1,0),(34,9,'2020-08-07 22:07:17',1,1,0),(35,9,'2020-08-08 22:07:17',1,1,0),(36,9,'2020-08-11 22:07:17',1,1,0),(37,9,'2020-08-13 22:07:17',1,1,0),(38,9,'2020-08-14 22:07:17',1,1,0),(39,9,'2020-08-15 22:07:17',1,1,0),(61,13,'2020-08-13 20:11:11',1,1,0),(62,13,'2020-08-14 20:51:11',1,1,0),(63,13,'2020-08-15 20:51:11',1,1,0),(64,13,'2020-08-18 20:51:11',1,1,0),(65,13,'2020-08-20 20:51:11',1,1,0),(66,13,'2020-08-21 20:51:11',1,1,0),(67,13,'2020-08-22 20:51:11',1,1,0),(68,14,'2020-08-13 21:13:18',1,1,0),(69,14,'2020-08-14 20:53:18',1,1,0),(70,14,'2020-08-15 20:53:18',1,1,0),(71,14,'2020-08-18 20:53:18',1,1,0),(72,14,'2020-08-20 20:53:18',1,1,0),(73,14,'2020-08-21 20:53:18',1,1,0),(74,14,'2020-08-22 20:53:18',1,1,0),(75,15,'2020-08-13 21:15:53',1,1,0),(76,15,'2020-08-14 20:55:53',1,1,0),(77,15,'2020-08-15 20:55:53',1,1,0),(78,15,'2020-08-18 20:55:53',1,1,0),(79,15,'2020-08-20 20:55:53',1,1,0),(80,15,'2020-08-21 20:55:53',1,1,0),(81,15,'2020-08-22 20:55:53',1,1,0),(82,16,'2020-08-27 11:14:11',1,1,0),(83,16,'2020-08-28 10:54:11',1,1,0),(84,16,'2020-08-29 10:54:11',1,1,0),(85,16,'2020-09-01 10:54:11',1,1,0),(86,16,'2020-09-03 10:54:11',1,1,0),(87,16,'2020-09-04 10:54:11',1,1,0),(88,16,'2020-09-05 10:54:11',1,1,0),(89,17,'2020-08-28 23:50:04',1,1,0),(90,17,'2020-08-29 23:30:04',1,1,0),(91,17,'2020-08-30 23:30:04',1,1,0),(92,17,'2020-09-02 23:30:04',1,1,0),(93,17,'2020-09-04 23:30:04',1,1,0),(94,17,'2020-09-05 23:30:04',1,1,0),(95,17,'2020-09-06 23:30:04',1,1,0),(96,18,'2020-08-28 23:50:37',1,1,0),(97,18,'2020-08-29 23:30:37',1,1,0),(98,18,'2020-08-30 23:30:37',1,1,0),(99,18,'2020-09-02 23:30:37',1,1,0),(100,18,'2020-09-04 23:30:37',1,1,0),(101,18,'2020-09-05 23:30:37',1,1,0),(102,18,'2020-09-06 23:30:37',1,1,0);
/*!40000 ALTER TABLE `remember_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentgrade`
--

DROP TABLE IF EXISTS `studentgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentgrade` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `main_sequence` varchar(255) NOT NULL,
  `sequence` varchar(255) NOT NULL,
  `loginname` varchar(255) NOT NULL,
  `submittime` datetime DEFAULT NULL,
  `main_subject` varchar(50) NOT NULL,
  `scores` float NOT NULL DEFAULT '0',
  `realname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='学生成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentgrade`
--

LOCK TABLES `studentgrade` WRITE;
/*!40000 ALTER TABLE `studentgrade` DISABLE KEYS */;
INSERT INTO `studentgrade` VALUES (1,'000001','000100','aaron','2019-06-30 01:56:53','语文',90,NULL),(2,'000001','000100','aaron','2019-06-30 01:56:53','数学',89.4,NULL),(3,'000001','000100','aaron','2019-06-30 01:56:53','外语',73,NULL),(4,'000002','000101','aaron','2019-06-29 01:56:53','语文',55,NULL),(5,'000002','000101','aaron','2019-06-29 10:02:44','数学',90,NULL),(6,'000002','000101','aaron','2019-06-29 10:02:44','外语',90,NULL),(7,'000001','000102','hello','2019-06-28 10:02:44','语文',60,NULL),(8,'000001','000102','hello','2019-06-28 10:02:44','数学',85,NULL),(9,'000001','000102','hello','2019-06-28 10:02:44','外语',95,NULL),(10,'000003','000103','aaron','2019-06-25 10:02:44','语文',100,NULL),(11,'000003','000103','aaron','2019-06-24 10:02:44','数学',87,NULL),(12,'000003','000103','aaron','2019-06-25 10:02:44','外语',30,NULL),(13,'000004','000104','aaron','2019-04-25 10:02:44','语文',45,NULL),(14,'000004','000104','aaron','2019-04-24 10:02:44','数学',69,NULL),(15,'000004','000104','aaron','2019-04-25 10:02:44','外语',72,NULL),(16,'000005','000105','aaron','2019-03-25 10:02:44','语文',99,NULL),(17,'000005','000105','aaron','2019-03-24 10:02:44','数学',100,NULL),(18,'000005','000105','aaron','2019-03-25 10:02:44','外语',10,NULL);
/*!40000 ALTER TABLE `studentgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectgrade`
--

DROP TABLE IF EXISTS `subjectgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjectgrade` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `gradeuuid` varchar(255) DEFAULT NULL,
  `loginname` varchar(255) DEFAULT NULL COMMENT '学生唯一键',
  `username` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `grade` varchar(255) DEFAULT NULL COMMENT '年级',
  `chinese` varchar(255) DEFAULT NULL COMMENT '语文成绩',
  `math` varchar(255) DEFAULT NULL COMMENT '数学成绩',
  `english` varchar(255) DEFAULT NULL COMMENT '英语成绩',
  `physics` varchar(255) DEFAULT NULL COMMENT '化学成绩',
  `chemistry` varchar(255) DEFAULT NULL,
  `history` varchar(255) DEFAULT NULL,
  `geography` varchar(255) DEFAULT NULL,
  `biology` varchar(255) DEFAULT NULL,
  `polity` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `orderid` int(11) unsigned DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL COMMENT '月份',
  `times` int(2) DEFAULT NULL COMMENT '某月第几次',
  PRIMARY KEY (`iid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='学生各科成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectgrade`
--

LOCK TABLES `subjectgrade` WRITE;
/*!40000 ALTER TABLE `subjectgrade` DISABLE KEYS */;
INSERT INTO `subjectgrade` VALUES (1,NULL,'wby','王碧渊','九','12','91','12','100','22','321312','33','54','89','2019-11-26 16:24:10','2019-12-31 00:01:33',NULL,'201911',1),(2,NULL,'wcc','王成成','九','100','45','34','89','99','99','99','99','99','2019-11-26 16:24:10','2019-12-31 00:00:33',NULL,'201911',2),(5,NULL,NULL,'李四','七','120','105','100','','','','','','','2019-12-24 16:06:02','2019-12-25 11:17:26',NULL,'201912',1),(6,NULL,NULL,'李华','八','100','100','100','100','100','100','','','','2019-12-24 16:11:27',NULL,NULL,'201912',1);
/*!40000 ALTER TABLE `subjectgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weui_user`
--

DROP TABLE IF EXISTS `weui_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weui_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `we_id` varchar(255) DEFAULT NULL,
  `we_name` varchar(255) DEFAULT NULL,
  `complat_userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weui_user`
--

LOCK TABLES `weui_user` WRITE;
/*!40000 ALTER TABLE `weui_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `weui_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sswh'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-17 21:54:57
