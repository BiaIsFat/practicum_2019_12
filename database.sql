CREATE DATABASE  IF NOT EXISTS `class_design` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `class_design`;
-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: class_design
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

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
-- Table structure for table `cadmin`
--

DROP TABLE IF EXISTS `cadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadmin` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `pwd` varchar(12) NOT NULL,
  `cno` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `cno_cadmin` (`cno`),
  CONSTRAINT `cno_cadmin` FOREIGN KEY (`cno`) REFERENCES `cinema` (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadmin`
--

LOCK TABLES `cadmin` WRITE;
/*!40000 ALTER TABLE `cadmin` DISABLE KEYS */;
INSERT INTO `cadmin` VALUES (1,'zlf','123',1),(2,'lgr','123',1),(3,'lmx','123',2),(4,'zsh','123',2),(5,'zjy','123',3);
/*!40000 ALTER TABLE `cadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinema` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `addr` varchar(100) DEFAULT NULL,
  `worktime` varchar(10) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'万达影城（集美万达广场店）','集美区银江路137号万达广场5号门娱乐楼4层','0:00-24:00','0592-23669'),(2,'大地影院（集美银泰百货店）','集美区同集南路68号美岁天地L4层30号','0:00-24:00','0592-62267'),(3,'完美世界影城集美店','集美区乐海璐23号新华都商场三楼301号','0:00-24:00','0592-6377177');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL,
  `ctime` datetime NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `replyno` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `fno` int(11) DEFAULT NULL,
  PRIMARY KEY (`cno`),
  KEY `uid_idx` (`uid`),
  KEY `fno_comment_idx` (`fno`),
  KEY `replyno_comment_idx` (`replyno`),
  CONSTRAINT `fno_comment` FOREIGN KEY (`fno`) REFERENCES `film` (`fno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `replyno_comment` FOREIGN KEY (`replyno`) REFERENCES `comment` (`cno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uid_comment` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'top content','2019-12-27 02:43:00',1,NULL,NULL,NULL),(2,'lll','2019-12-27 08:00:54',1,1,2,1),(3,'aaa','2019-12-27 08:01:10',1,2,2,1),(4,'你好','2019-12-27 09:14:05',1,1,4,3),(5,'你好呀','2019-12-27 09:14:50',1,4,4,3),(6,'测试','2019-12-27 09:23:20',1,4,4,3),(7,'sbzlf','2019-12-27 14:20:00',1,1,2,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `fno` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `ontime` date DEFAULT NULL,
  `actor` varchar(50) DEFAULT NULL,
  `intro` varchar(1000) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `pic` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `view` varchar(5) DEFAULT NULL,
  `forbidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fno`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'冰雪奇缘2','2019-11-22','克里斯汀·贝尔、乔什·加德','在前作中，阿伦黛尔王国的公主艾莎因为拥有难以控制的强大魔力而选择封闭心扉，远离家园。在妹妹安娜等的帮助鼓舞下，艾莎终于鼓起勇气拥抱真我获得真正的力量。','动画、喜剧、冒险','冰雪奇缘.png','美国',104,'3D',0),(2,'冰雪奇缘','2013-11-27','克里斯汀·贝尔、伊迪娜·门泽尔','在四面环海、风景如画的阿伦黛尔王国，生活着两位可爱美丽的小公主，艾莎和安娜。','喜剧、动画、冒险 ','冰雪奇缘2.png','美国',102,'3D',0),(3,'妙先生','2019-12-31','暂无','国产动画电影《妙先生》释出定档海报，宣布12月31日跨年上映。影片改编自不思凡 (《大护法》)的同名原创短片，由李凌霄执导，彩条屋影业(《哪吒之魔童降世》)出品，讲述一场关于“善恶抉择”的人性考验','动画、冒险、武侠','妙先生.png','中国大陆',105,'3D',0),(4,'宠爱','2019-12-31','于和伟、吴磊','电影《宠爱》共由6段温暖的故事组成，不同年龄段的人们，在宠物的陪伴和守护中，收获爱、发现爱，更重新学会爱。在“爱”的主线下，一系列关于亲情、友情、爱情的故事逐一展开。电影《宠爱》将于12月31日，全国公映','爱情、喜剧','宠爱.png','中国大陆',112,'3D',0),(5,'惊涛迷局','2019-12-20','马修·麦康纳 、 安妮·海瑟薇','渔船船长Baker （马修·麦康纳 饰）在普利茅斯岛过着日复一日平静而单调的生活，而前妻Karen （安妮·海瑟薇 饰）的到来打破了小岛的宁静。常年处于现任丈夫压迫下的Karen绝望地请求前夫Baker帮她“谋杀亲夫”','科幻、悬疑','惊涛迷局.png','美国',114,'2D',0),(6,'囧妈','2020-01-25','徐峥 / 袁泉 / 沈腾 / 郭京飞','讲述了小老板伊万缠身于商业纠纷，却意外同母亲坐上了开往俄罗斯的火车。在旅途中，他和母亲发生激烈冲突，同时还要和竞争对手斗智斗勇。为了最终抵达莫斯科，他不得不和母亲共同克服难关，并面对家庭生活中一直所逃','剧情、喜剧','囧妈.png','中国大陆',115,'3D',0),(7,'刺客信条 ','2020-07-17','约翰·大卫·华盛顿 / 罗伯特·帕丁森 ','克里斯托弗·诺兰下部作品确认将于2020年7月17日在北美公映。包括标题名、情节概述、演员阵容在内的任何细节都没有透露，只是被称为会是一部重磅电影（event film），同时会采用IMAX技术进行拍摄。','动作、剧情、惊悚','刺客信条.png','美国、英国',117,'3D',0),(8,'创客兄弟','2019-12-27','吴浩 / 孙逸仁 / 秦海 / 屠育玮 ','该电影以科技创新大本营华强北为背景，展现五位年轻人创业过程中的困难与成长。故事起源于商业大佬林有成出资500万招募创客团队为儿子制造“童年玩伴”——智能陪伴型机器人，许开作为林有成创业初期的好友向他争取到',' 喜剧','创客兄弟.png','中国大陆',120,'2D',0),(9,'古窑迷踪','2019-12-27','郭雪芙 / 罗彬 / 刘永奇 / 刘雨均 ','古窑村遗留着充满神秘传奇的窑洞，种种离奇古怪的现象令人去探求刺激。作家张小妍在男友车宇的陪伴下为了完成惊悚小说而实景体验，随同还有好友双双、汪说以及焦正泰和安妮夫妇，神秘的棺材、恐怖的敲门声、鬼打墙的','惊悚、恐怖','古窑迷踪.png','中国大陆',130,'蓝光',0),(10,'横财局中局','2019-12-28','黄圣依 / 聂远 / 林雪 / 边潇潇 ','1944年底，一批俗称金圆券的巨额钞票从天而降，铺满了川西深山的古老县城，穷困潦倒的人们一夜间变成了腰缠万贯的富人，各种纷繁交织的明暗势力让贪婪、狡诈、欺骗、欲望和希望、救赎、国运、大义如困兽般破笼而出。','喜剧、悬疑 ','横财局中局.png','中国大陆',89,'4K',0),(11,'蓝色百褶裙','2019-12-28','蓉卓 / 王放 / 舒遥 / 谢佳','故事开始于一个少女的自杀未遂。 父母离婚，母亲改嫁，她被寄养在姨妈家，寄人篱下的生活让她的变得孤僻害羞，因为被同学周洋戏弄而被迫从高中退学，转学艺校，进入一个全新而陌生的环境，在这里结识了新的朋','剧情、爱情','蓝色百褶裙.png','中国大陆',92,'蓝光',0),(12,'罗宾汉：起源','2019-12-27','塔伦·埃格顿 / 杰米·福克斯 / 本·门德尔森 / 伊芙·休森 ','用现代思维重新书写绿林英雄罗宾汉的传奇故事。原本富庶的贵族罗宾为家国大义奔赴战场，见识过战争的残酷与惨烈后回到故乡，不想等待他的竟是心爱的女人被抢走，家产被侵占的噩耗。在逃避现实之时，罗宾曾在战场上救','动作、冒险','罗宾汉：起源.png','美国',91,'蓝光',0),(13,'妈妈，我想你','2019-12-27','曹颖 / 马柏全 / 九孔 / 汤潮 ','家是永远的归宿，母爱是永恒的港湾！突发而至的横祸，将一个幸福的家庭拆得支离破碎，母子四人不得已亡命天涯，陷入重重危机……本片为您讲述一个感人至深的人间真情故事～','剧情、家庭','妈妈，我想你.png','中国大陆',110,'4K',0),(14,'那人那事','2020-01-11','姚成金 / 陈雪铫 / 李建忠 / 纪振斌 ','本片讲述了青年干部艾民在扶贫过程中，不畏艰辛，挑战落后观念，面对全村百姓的质疑和家人的误解，勇于担当，成功带领群众脱贫的故事。彰显了年轻人迎难而上的奋斗精神','剧情、爱情','那人那事.png','中国大陆',120,'蓝光',0),(15,'亲爱的新年好','2019-12-31','白百何 / 张子枫 / 魏大勋 / 许娣 ','离乡打拼的白树瑾（白百何饰）早年间为了有个更好的生活，放弃了向往的图书行业，转行成为地产经纪，不想工作成果惨淡，职场遭遇劲敌。到北京的第十个年头，白树瑾屡遭挫折，面临事业停滞、情路不顺、房租暴涨、母亲','剧情 、爱情 、家庭','亲爱的新年好.png','中国大陆',89,'4K',0),(16,'特警队','2019-12-27','凌潇肃 / 贾乃亮 / 金晨 / 张云龙 ','《特警队》是华语内地警匪片中第一部完全以特警为主角的电影，影片以真实的特警精英队伍“蓝剑突击队”为人物原型，讲述了特警队员们对内在实战演练中互相博弈，置身训练场不断淬炼自我，场场来真的；对外无惧艰险','动作','特警队.png','中国大陆',90,'4K',0),(17,'我在时间尽头等你','2020-02-14','李鸿其 / 李一桐 / 张超 ','林格（李鸿其 饰）人生所有美好的记忆，都与邱倩（李一桐 饰）有关。一场意外、一块神奇的表彻底改变了两人的人生......时空不断被重置，唯一不变的，是爱你如初的心。','爱情 、奇幻','我在时间尽头等你.png','中国大陆',91,'4K',0),(18,'小羊肖恩2：末日农场','2019-09-26','贾斯汀·弗莱彻 / 约翰·斯帕克斯 / 安迪·尼曼 / 凯特·哈伯','全世界最受欢迎的小羊“肖恩”带着大电影《小羊肖恩2：末日农场》重回大银幕，这是它前作获得巨大成功并提名奥斯卡后的全新续集。电影讲述了肖恩和朋友们在农场里发现了迷路的小外星人噜啦（LULA），而她乘坐的飞','喜剧 / 动画 / 奇幻 / 冒险','小羊肖恩2：末日农场.png','德国',112,'蓝光',0);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ono` varchar(20) NOT NULL,
  `total` decimal(5,2) NOT NULL,
  `otime` datetime NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `grade` decimal(3,1) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `sno` bigint(20) DEFAULT NULL,
  `fno` int(11) DEFAULT NULL,
  PRIMARY KEY (`ono`),
  KEY `uid_order_idx` (`uid`),
  KEY `fno_order_idx` (`fno`),
  KEY `sno_order_idx` (`sno`),
  CONSTRAINT `fno_order` FOREIGN KEY (`fno`) REFERENCES `film` (`fno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sno_order` FOREIGN KEY (`sno`) REFERENCES `session` (`sno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uid_order` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('1',100.00,'2019-12-11 20:20:00',1,9.0,1,1,1),('15772128592072',99.80,'2019-12-25 02:40:59',1,NULL,2,1,1),('15772129257532',99.80,'2019-12-25 02:42:05',0,NULL,2,1,1),('15772157843702',99.80,'2019-12-25 03:29:44',1,7.4,2,1,1),('15773295880554',49.90,'2019-12-26 11:06:28',0,NULL,4,1,1),('15773503022902',4.00,'2019-12-26 16:51:42',1,8.0,2,1577343334931,1),('15773642614653',8.00,'2019-12-26 20:44:21',1,NULL,3,1577343334931,1),('15773704513164',10.00,'2019-12-26 22:27:31',1,NULL,4,1577343334931,1),('15773728868102',85.80,'2019-12-26 23:08:06',1,7.0,2,2,1),('15774315950302',68.00,'2019-12-27 15:26:35',1,8.0,2,1577427675821,4),('15774317754202',120.00,'2019-12-27 15:29:35',1,NULL,2,1577431751569,5),('2',120.00,'2019-12-12 08:20:00',1,5.0,1,1,1),('3',40.00,'2019-10-10 07:56:00',NULL,8.0,1,1,1),('4',234.00,'2018-12-01 09:09:00',0,10.0,1,1,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_item`
--

DROP TABLE IF EXISTS `other_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_item` (
  `oino` int(11) NOT NULL AUTO_INCREMENT,
  `oiprice` decimal(5,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `pno` int(11) DEFAULT NULL,
  `ono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`oino`),
  KEY `pno_other_item_idx` (`pno`),
  KEY `ono_other_item_idx` (`ono`),
  CONSTRAINT `ono_other_item` FOREIGN KEY (`ono`) REFERENCES `order` (`ono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pno_other_item` FOREIGN KEY (`pno`) REFERENCES `product` (`pno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_item`
--

LOCK TABLES `other_item` WRITE;
/*!40000 ALTER TABLE `other_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padmin`
--

DROP TABLE IF EXISTS `padmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `padmin` (
  `account` varchar(20) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padmin`
--

LOCK TABLES `padmin` WRITE;
/*!40000 ALTER TABLE `padmin` DISABLE KEYS */;
INSERT INTO `padmin` VALUES ('lgr','123'),('lmx','123'),('zjy','123'),('zlf','123'),('zsh','123');
/*!40000 ALTER TABLE `padmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(255) NOT NULL,
  `rtype` varchar(255) DEFAULT NULL,
  `cno` int(11) DEFAULT NULL,
  PRIMARY KEY (`rno`),
  KEY `cno_room` (`cno`),
  CONSTRAINT `cno_room` FOREIGN KEY (`cno`) REFERENCES `cinema` (`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'1号厅','情侣厅',1),(2,'1号厅','3DMAX',2),(3,'2号厅','儿童厅',1),(4,'3号厅','3DMAX',1),(5,'2号厅','儿童厅',2),(6,'3号厅','情侣厅',2),(7,'1号厅','情侣厅',3),(8,'2号厅','儿童厅',3),(9,'3号厅','3DMAX',3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `seatno` int(11) NOT NULL AUTO_INCREMENT,
  `seatname` varchar(10) NOT NULL,
  `rno` int(11) NOT NULL,
  PRIMARY KEY (`seatno`),
  KEY `rno_seat_idx` (`rno`),
  CONSTRAINT `rno_seat` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,'1-1',1),(2,'1-2',1),(3,'1-3',1),(4,'1-4',1),(5,'1-5',1),(6,'1-6',1),(7,'2-1',1),(8,'2-2',1),(9,'2-3',1),(11,'2-4',1),(12,'2-5',1),(14,'2-6',1),(15,'3-1',1),(16,'3-2',1),(17,'3-3',1),(18,'3-4',1),(19,'3-5',1),(20,'3-6',1),(21,'4-1',1),(22,'4-2',1),(23,'4-3',1),(24,'4-4',1),(25,'4-5',1),(26,'4-6',1),(27,'5-1',1),(28,'5-2',1),(29,'5-3',1),(30,'5-4',1),(31,'5-5',1),(32,'5-6',1),(33,'6-1',1),(34,'6-2',1),(35,'6-3',1),(36,'6-4',1),(37,'6-5',1),(38,'6-6',1),(39,'1-1',2),(40,'1-2',2),(41,'1-3',2),(42,'1-4',2),(43,'1-5',2),(44,'1-6',2),(45,'2-1',2),(46,'2-2',2),(47,'2-3',2),(48,'2-4',2),(49,'2-5',2),(50,'2-6',2),(51,'3-1',2),(53,'3-2',2),(54,'3-3',2),(55,'3-4',2),(56,'3-5',2),(57,'3-6',2),(58,'4-1',2),(59,'4-2',2),(60,'4-3',2),(61,'4-4',2),(62,'4-5',2),(63,'4-6',2),(69,'1-1',3),(70,'1-2',3),(71,'1-3',3),(72,'1-4',3),(73,'1-5',3),(74,'1-6',3),(75,'2-1',3),(76,'2-2',3),(77,'2-3',3),(78,'2-4',3),(79,'2-5',3),(81,'2-6',3),(82,'3-1',3),(83,'3-2',3),(84,'3-3',3),(85,'3-4',3),(86,'3-5',3),(87,'3-6',3),(88,'4-1',3),(89,'4-2',3),(90,'4-3',3),(91,'4-4',3),(92,'4-5',3),(93,'4-6',3),(94,'1-1',4),(95,'1-2',4),(96,'1-3',4),(97,'1-4',4),(98,'1-5',4),(99,'1-6',4),(100,'2-1',4),(101,'2-2',4),(102,'2-3',4),(103,'2-4',4),(104,'2-5',4),(105,'2-6',4),(106,'3-1',4),(107,'3-2',4),(108,'3-3',4),(109,'3-4',4),(110,'3-5',4),(111,'3-6',4),(112,'4-1',4),(113,'4-2',4),(114,'4-3',4),(115,'4-4',4),(117,'4-5',4),(118,'4-6',4),(119,'5-1',4),(120,'5-2',4),(121,'5-3',4),(122,'5-4',4),(123,'5-5',4),(124,'5-6',4),(125,'1-1',5),(127,'1-2',5),(128,'1-3',5),(129,'1-4',5),(130,'1-5',5),(131,'1-6',5),(132,'2-1',5),(133,'2-2',5),(134,'2-3',5),(135,'2-4',5),(136,'2-5',5),(137,'2-6',5),(138,'3-1',5),(139,'3-2',5),(140,'3-3',5),(141,'3-4',5),(142,'3-5',5),(143,'3-6',5),(144,'4-1',5),(145,'4-2',5),(146,'4-3',5),(147,'4-4',5),(148,'4-5',5),(149,'4-6',5),(150,'5-1',5),(151,'5-2',5),(153,'5-3',5),(154,'5-4',5),(155,'1-1',6),(156,'1-2',6),(157,'1-3',6),(158,'1-4',6),(159,'1-5',6),(160,'1-6',6),(161,'2-1',6),(162,'2-2',6),(163,'2-3',6),(164,'2-4',6),(165,'2-5',6),(166,'2-6',6),(167,'3-1',6),(168,'3-2',6),(169,'3-3',6),(170,'3-4',6),(171,'3-5',6),(172,'3-6',6),(173,'4-1',6),(174,'4-2',6),(175,'4-3',6),(176,'4-4',6),(177,'4-5',6),(178,'4-6',6),(179,'5-1',6),(180,'5-2',6),(181,'5-3',6),(182,'5-4',6),(183,'5-5',6),(184,'5-6',6),(185,'6-1',6),(186,'6-2',6),(187,'6-3',6),(188,'6-4',6),(189,'6-5',6),(190,'6-6',6),(191,'1-1',7),(192,'1-2',7),(193,'1-3',7),(194,'1-4',7),(195,'1-5',7),(196,'1-6',7),(197,'2-1',7),(198,'2-2',7),(199,'2-3',7),(200,'2-4',7),(201,'2-5',7),(202,'2-6',7),(203,'3-1',7),(204,'3-2',7),(205,'3-3',7),(206,'3-4',7),(207,'3-5',7),(208,'3-6',7),(209,'4-1',7),(210,'4-2',7),(211,'4-3',7),(212,'4-4',7),(213,'4-5',7),(214,'4-6',7),(215,'5-1',7),(216,'5-2',7),(217,'5-3',7),(218,'5-4',7),(219,'5-5',7),(220,'5-6',7),(221,'6-1',7),(222,'6-2',7),(223,'6-3',7),(224,'6-4',7),(225,'6-5',7),(226,'6-6',7),(227,'1-1',8),(228,'1-2',8),(229,'1-3',8),(230,'1-4',8),(232,'1-5',8),(233,'1-6',8),(234,'2-1',8),(235,'2-2',8),(236,'2-3',8),(237,'2-4',8),(238,'2-5',8),(239,'2-6',8),(240,'3-1',8),(241,'3-2',8),(242,'3-3',8),(243,'3-4',8),(244,'3-5',8),(245,'3-6',8),(246,'4-1',8),(247,'4-2',8),(250,'4-3',8),(251,'4-4',8),(252,'4-5',8),(253,'4-6',8),(254,'5-1',8),(255,'5-2',8),(256,'5-3',8),(257,'5-4',8),(258,'5-5',8),(259,'5-6',8),(260,'6-1',8),(261,'6-2',8),(262,'6-3',8),(263,'6-4',8),(264,'6-5',8),(265,'6-6',8),(266,'1-1',9),(267,'1-2',9),(268,'1-3',9),(269,'1-4',9),(270,'1-5',9),(271,'1-6',9),(272,'2-1',9),(273,'2-2',9),(274,'2-3',9),(275,'2-4',9),(276,'2-5',9),(277,'2-6',9),(278,'3-1',9),(279,'3-2',9),(280,'3-3',9),(281,'3-4',9),(282,'3-5',9),(283,'3-6',9),(284,'4-1',9),(285,'4-2',9),(286,'4-3',9),(287,'4-4',9),(288,'4-5',9),(289,'4-6',9),(290,'5-1',9),(291,'5-2',9),(292,'5-3',9),(293,'5-4',9),(294,'5-5',9),(295,'5-6',9),(296,'6-1',9),(297,'6-2',9),(298,'6-3',9),(299,'6-4',9),(300,'6-5',9),(301,'6-6',9);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `sno` bigint(20) NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `cno` int(11) DEFAULT NULL,
  `rno` int(11) DEFAULT NULL,
  `fno` int(11) DEFAULT NULL,
  PRIMARY KEY (`sno`),
  KEY `cno_session_idx` (`cno`),
  KEY `fno_session_idx` (`fno`),
  KEY `rno_session_idx` (`rno`),
  CONSTRAINT `cno_session` FOREIGN KEY (`cno`) REFERENCES `cinema` (`cno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fno_session` FOREIGN KEY (`fno`) REFERENCES `film` (`fno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rno_session` FOREIGN KEY (`rno`) REFERENCES `room` (`rno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'2019-12-05 17:30:00','2019-12-05 19:14:00',49.90,1,1,1),(2,'2019-12-05 19:00:00','2019-12-05 20:44:00',42.90,2,2,1),(3,'2019-12-17 16:45:26','2019-12-17 18:45:30',40.00,1,1,2),(1577343264564,'2019-12-26 14:54:21','2019-12-26 04:38:00',1.00,1,1,1),(1577343273801,'2019-12-26 14:53:32','2019-12-26 04:37:00',1.00,1,1,1),(1577343334931,'2019-12-26 14:55:32','2019-12-26 04:39:00',2.00,1,1,1),(1577414533298,'2019-12-27 10:41:00','2019-12-27 12:12:00',20.00,2,5,17),(1577414806832,'2019-12-27 10:41:00','2019-12-27 12:51:00',43.00,2,6,9),(1577414843340,'2019-12-27 11:41:00','2019-12-27 01:12:00',33.00,2,2,17),(1577427675821,'2019-12-27 14:21:04','2019-12-27 04:13:00',34.00,1,3,4),(1577431751569,'2019-12-27 15:29:03','2019-12-27 05:23:00',60.00,1,3,5);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_seat`
--

DROP TABLE IF EXISTS `session_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_seat` (
  `ssno` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT '0',
  `sno` bigint(20) DEFAULT NULL,
  `seatno` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssno`),
  KEY `seatno_session_seat_idx` (`seatno`),
  KEY `sno_session_seat_idx` (`sno`),
  CONSTRAINT `seatno_session_seat` FOREIGN KEY (`seatno`) REFERENCES `seat` (`seatno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sno_session_seat` FOREIGN KEY (`sno`) REFERENCES `session` (`sno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_seat`
--

LOCK TABLES `session_seat` WRITE;
/*!40000 ALTER TABLE `session_seat` DISABLE KEYS */;
INSERT INTO `session_seat` VALUES (1,0,1,1),(2,1,1,2),(3,0,1,3),(4,0,1,4),(5,1,1,5),(6,0,1,6),(7,1,1,7),(8,0,1,8),(9,0,1,9),(10,1,1,11),(11,0,1,12),(12,0,1,14),(13,1,1,15),(14,0,1,16),(15,1,1,17),(16,1,1,18),(17,0,1,19),(18,0,1,20),(19,0,1,21),(20,0,1,22),(21,1,1,23),(22,0,1,24),(23,0,1,25),(24,0,1,26),(25,0,1,27),(26,0,1,28),(27,0,1,29),(28,1,1,30),(29,0,1,31),(30,0,1,32),(31,0,1,33),(32,0,1,34),(33,0,1,35),(34,0,1,36),(35,0,1,37),(36,1,1,38),(37,1,2,39),(38,0,2,40),(39,0,2,41),(40,1,2,42),(41,1,2,43),(42,0,2,44),(43,0,3,1),(44,1,3,2),(45,0,1577343264564,1),(46,0,1577343264564,2),(47,0,1577343264564,3),(48,0,1577343264564,4),(49,0,1577343264564,5),(50,0,1577343264564,6),(51,0,1577343264564,7),(52,0,1577343264564,8),(53,0,1577343264564,9),(54,0,1577343264564,11),(55,0,1577343264564,12),(56,0,1577343264564,14),(57,0,1577343264564,15),(58,0,1577343264564,16),(59,0,1577343264564,17),(60,0,1577343264564,18),(61,0,1577343264564,19),(62,0,1577343264564,20),(63,0,1577343264564,21),(64,0,1577343264564,22),(65,0,1577343264564,23),(66,0,1577343264564,24),(67,0,1577343264564,25),(68,0,1577343264564,26),(69,0,1577343264564,27),(70,0,1577343264564,28),(71,0,1577343264564,29),(72,0,1577343264564,30),(73,0,1577343264564,31),(74,0,1577343264564,32),(75,0,1577343264564,33),(76,0,1577343264564,34),(77,0,1577343264564,35),(78,0,1577343264564,36),(79,0,1577343264564,37),(80,0,1577343264564,38),(81,0,1577343273801,1),(82,0,1577343273801,2),(83,0,1577343273801,3),(84,0,1577343273801,4),(85,0,1577343273801,5),(86,0,1577343273801,6),(87,0,1577343273801,7),(88,0,1577343273801,8),(89,0,1577343273801,9),(90,0,1577343273801,11),(91,0,1577343273801,12),(92,0,1577343273801,14),(93,0,1577343273801,15),(94,0,1577343273801,16),(95,0,1577343273801,17),(96,0,1577343273801,18),(97,0,1577343273801,19),(98,0,1577343273801,20),(99,0,1577343273801,21),(100,0,1577343273801,22),(101,0,1577343273801,23),(102,0,1577343273801,24),(103,0,1577343273801,25),(104,0,1577343273801,26),(105,0,1577343273801,27),(106,0,1577343273801,28),(107,0,1577343273801,29),(108,0,1577343273801,30),(109,0,1577343273801,31),(110,0,1577343273801,32),(111,0,1577343273801,33),(112,0,1577343273801,34),(113,0,1577343273801,35),(114,0,1577343273801,36),(115,0,1577343273801,37),(116,0,1577343273801,38),(117,1,1577343334931,1),(118,0,1577343334931,2),(119,0,1577343334931,3),(120,1,1577343334931,4),(121,0,1577343334931,5),(122,0,1577343334931,6),(123,0,1577343334931,7),(124,0,1577343334931,8),(125,0,1577343334931,9),(126,0,1577343334931,11),(127,0,1577343334931,12),(128,0,1577343334931,14),(129,0,1577343334931,15),(130,1,1577343334931,16),(131,0,1577343334931,17),(132,0,1577343334931,18),(133,1,1577343334931,19),(134,0,1577343334931,20),(135,0,1577343334931,21),(136,0,1577343334931,22),(137,0,1577343334931,23),(138,1,1577343334931,24),(139,1,1577343334931,25),(140,1,1577343334931,26),(141,0,1577343334931,27),(142,0,1577343334931,28),(143,0,1577343334931,29),(144,1,1577343334931,30),(145,1,1577343334931,31),(146,0,1577343334931,32),(147,0,1577343334931,33),(148,0,1577343334931,34),(149,1,1577343334931,35),(150,1,1577343334931,36),(151,0,1577343334931,37),(152,0,1577343334931,38),(153,0,1577414533298,125),(154,0,1577414533298,127),(155,0,1577414533298,128),(156,0,1577414533298,129),(157,0,1577414533298,130),(158,0,1577414533298,131),(159,0,1577414533298,132),(160,0,1577414533298,133),(161,0,1577414533298,134),(162,0,1577414533298,135),(163,0,1577414533298,136),(164,0,1577414533298,137),(165,0,1577414533298,138),(166,0,1577414533298,139),(167,0,1577414533298,140),(168,0,1577414533298,141),(169,0,1577414533298,142),(170,0,1577414533298,143),(171,0,1577414533298,144),(172,0,1577414533298,145),(173,0,1577414533298,146),(174,0,1577414533298,147),(175,0,1577414533298,148),(176,0,1577414533298,149),(177,0,1577414533298,150),(178,0,1577414533298,151),(179,0,1577414533298,153),(180,0,1577414533298,154),(181,0,1577414806832,155),(182,0,1577414806832,156),(183,0,1577414806832,157),(184,0,1577414806832,158),(185,0,1577414806832,159),(186,0,1577414806832,160),(187,0,1577414806832,161),(188,0,1577414806832,162),(189,0,1577414806832,163),(190,0,1577414806832,164),(191,0,1577414806832,165),(192,0,1577414806832,166),(193,0,1577414806832,167),(194,0,1577414806832,168),(195,0,1577414806832,169),(196,0,1577414806832,170),(197,0,1577414806832,171),(198,0,1577414806832,172),(199,0,1577414806832,173),(200,0,1577414806832,174),(201,0,1577414806832,175),(202,0,1577414806832,176),(203,0,1577414806832,177),(204,0,1577414806832,178),(205,0,1577414806832,179),(206,0,1577414806832,180),(207,0,1577414806832,181),(208,0,1577414806832,182),(209,0,1577414806832,183),(210,0,1577414806832,184),(211,0,1577414806832,185),(212,0,1577414806832,186),(213,0,1577414806832,187),(214,0,1577414806832,188),(215,0,1577414806832,189),(216,0,1577414806832,190),(217,0,1577414843340,39),(218,0,1577414843340,40),(219,0,1577414843340,41),(220,0,1577414843340,42),(221,0,1577414843340,43),(222,0,1577414843340,44),(223,0,1577414843340,45),(224,0,1577414843340,46),(225,0,1577414843340,47),(226,0,1577414843340,48),(227,0,1577414843340,49),(228,0,1577414843340,50),(229,0,1577414843340,51),(230,0,1577414843340,53),(231,0,1577414843340,54),(232,0,1577414843340,55),(233,0,1577414843340,56),(234,0,1577414843340,57),(235,0,1577414843340,58),(236,0,1577414843340,59),(237,0,1577414843340,60),(238,0,1577414843340,61),(239,0,1577414843340,62),(240,0,1577414843340,63),(241,0,1577427675821,69),(242,0,1577427675821,70),(243,0,1577427675821,71),(244,0,1577427675821,72),(245,0,1577427675821,73),(246,0,1577427675821,74),(247,0,1577427675821,75),(248,0,1577427675821,76),(249,0,1577427675821,77),(250,0,1577427675821,78),(251,0,1577427675821,79),(252,0,1577427675821,81),(253,0,1577427675821,82),(254,0,1577427675821,83),(255,0,1577427675821,84),(256,0,1577427675821,85),(257,1,1577427675821,86),(258,0,1577427675821,87),(259,0,1577427675821,88),(260,0,1577427675821,89),(261,0,1577427675821,90),(262,1,1577427675821,91),(263,0,1577427675821,92),(264,0,1577427675821,93),(265,0,1577431751569,69),(266,0,1577431751569,70),(267,0,1577431751569,71),(268,0,1577431751569,72),(269,0,1577431751569,73),(270,0,1577431751569,74),(271,0,1577431751569,75),(272,0,1577431751569,76),(273,0,1577431751569,77),(274,1,1577431751569,78),(275,0,1577431751569,79),(276,0,1577431751569,81),(277,0,1577431751569,82),(278,0,1577431751569,83),(279,1,1577431751569,84),(280,0,1577431751569,85),(281,0,1577431751569,86),(282,0,1577431751569,87),(283,0,1577431751569,88),(284,0,1577431751569,89),(285,0,1577431751569,90),(286,0,1577431751569,91),(287,0,1577431751569,92),(288,0,1577431751569,93);
/*!40000 ALTER TABLE `session_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_item`
--

DROP TABLE IF EXISTS `ticket_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_item` (
  `tino` int(11) NOT NULL AUTO_INCREMENT,
  `tiprice` decimal(5,2) DEFAULT NULL,
  `ssno` int(11) DEFAULT NULL,
  `ono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`tino`),
  KEY `ssno_ticket_item_idx` (`ssno`),
  KEY `ono_ticket_item_idx` (`ono`),
  CONSTRAINT `ono_ticket_item` FOREIGN KEY (`ono`) REFERENCES `order` (`ono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ssno_ticket_item` FOREIGN KEY (`ssno`) REFERENCES `session_seat` (`ssno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_item`
--

LOCK TABLES `ticket_item` WRITE;
/*!40000 ALTER TABLE `ticket_item` DISABLE KEYS */;
INSERT INTO `ticket_item` VALUES (1,49.90,17,'15772128592072'),(2,49.90,23,'15772128592072'),(3,49.90,18,'15772129257532'),(4,49.90,23,'15772129257532'),(5,49.90,7,'15772157843702'),(6,49.90,13,'15772157843702'),(7,49.90,36,'15773295880554'),(8,2.00,138,'15773503022902'),(9,2.00,117,'15773503022902'),(10,2.00,120,'15773642614653'),(11,2.00,130,'15773642614653'),(12,2.00,149,'15773642614653'),(13,2.00,145,'15773642614653'),(14,2.00,150,'15773704513164'),(15,2.00,133,'15773704513164'),(16,2.00,140,'15773704513164'),(17,2.00,139,'15773704513164'),(18,2.00,144,'15773704513164'),(19,42.90,41,'15773728868102'),(20,42.90,40,'15773728868102'),(21,34.00,257,'15774315950302'),(22,34.00,262,'15774315950302'),(23,60.00,279,'15774317754202'),(24,60.00,274,'15774317754202');
/*!40000 ALTER TABLE `ticket_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(10) NOT NULL,
  `upwd` varchar(12) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sex` char(10) DEFAULT NULL,
  `vip` tinyint(1) DEFAULT '0',
  `forbidden` tinyint(1) DEFAULT '0',
  `nospeak` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname_UNIQUE` (`uname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zlf','123','12345678901','zlf@qq.com','M',0,0,0),(2,'lgr','1234','12345678901','lgr@qq.com','M',0,0,0),(3,'zsh','123','12345678901','zsh@qq.com','F',0,0,0),(4,'lmx','123','1234567890-','lmx@qq.com','F',0,0,0),(5,'zjy','123','12345678901','zjy@qq.com','F',0,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_avg_grades`
--

DROP TABLE IF EXISTS `v_avg_grades`;
/*!50001 DROP VIEW IF EXISTS `v_avg_grades`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_avg_grades` (
  `fno` tinyint NOT NULL,
  `avg_grades` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_boxoffice`
--

DROP TABLE IF EXISTS `v_boxoffice`;
/*!50001 DROP VIEW IF EXISTS `v_boxoffice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_boxoffice` (
  `fno` tinyint NOT NULL,
  `boxoffice` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_film_occupancy`
--

DROP TABLE IF EXISTS `v_film_occupancy`;
/*!50001 DROP VIEW IF EXISTS `v_film_occupancy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_film_occupancy` (
  `fno` tinyint NOT NULL,
  `seated` tinyint NOT NULL,
  `allseat` tinyint NOT NULL,
  `rate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_film_view`
--

DROP TABLE IF EXISTS `v_film_view`;
/*!50001 DROP VIEW IF EXISTS `v_film_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_film_view` (
  `fno` tinyint NOT NULL,
  `avg_grades` tinyint NOT NULL,
  `boxoffice` tinyint NOT NULL,
  `occupancy` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sale_amount_by_month`
--

DROP TABLE IF EXISTS `v_sale_amount_by_month`;
/*!50001 DROP VIEW IF EXISTS `v_sale_amount_by_month`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_sale_amount_by_month` (
  `cno` tinyint NOT NULL,
  `month` tinyint NOT NULL,
  `sale_amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_avg_grades`
--

/*!50001 DROP TABLE IF EXISTS `v_avg_grades`*/;
/*!50001 DROP VIEW IF EXISTS `v_avg_grades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_avg_grades` AS select `order`.`fno` AS `fno`,(sum(`order`.`grade`) / count(0)) AS `avg_grades` from `order` group by `order`.`fno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_boxoffice`
--

/*!50001 DROP TABLE IF EXISTS `v_boxoffice`*/;
/*!50001 DROP VIEW IF EXISTS `v_boxoffice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_boxoffice` AS select `order`.`fno` AS `fno`,sum(`order`.`total`) AS `boxoffice` from `order` group by `order`.`fno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_film_occupancy`
--

/*!50001 DROP TABLE IF EXISTS `v_film_occupancy`*/;
/*!50001 DROP VIEW IF EXISTS `v_film_occupancy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_film_occupancy` AS select `b`.`fno` AS `fno`,count((case when (`a`.`status` = 1) then `a`.`status` end)) AS `seated`,count(0) AS `allseat`,(count((case when (`a`.`status` = 1) then `a`.`status` end)) / count(0)) AS `rate` from (`session_seat` `a` join `session` `b`) where (`a`.`sno` = `b`.`sno`) group by `b`.`fno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_film_view`
--

/*!50001 DROP TABLE IF EXISTS `v_film_view`*/;
/*!50001 DROP VIEW IF EXISTS `v_film_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_film_view` AS select `a`.`fno` AS `fno`,`a`.`avg_grades` AS `avg_grades`,`b`.`boxoffice` AS `boxoffice`,`c`.`rate` AS `occupancy` from ((`v_avg_grades` `a` join `v_boxoffice` `b`) join `v_film_occupancy` `c`) where ((`a`.`fno` = `b`.`fno`) and (`b`.`fno` = `c`.`fno`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sale_amount_by_month`
--

/*!50001 DROP TABLE IF EXISTS `v_sale_amount_by_month`*/;
/*!50001 DROP VIEW IF EXISTS `v_sale_amount_by_month`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sale_amount_by_month` AS select `b`.`cno` AS `cno`,date_format(`a`.`otime`,'%Y-%m') AS `month`,sum(`a`.`total`) AS `sale_amount` from (`order` `a` join `session` `b`) where (`a`.`sno` = `b`.`sno`) group by `b`.`cno`,date_format(`a`.`otime`,'%Y-%m') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-30 20:55:00
