/*
SQLyog Ultimate v8.32 
MySQL - 5.5.49 : Database - lxb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lxb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lxb`;

/*Table structure for table `admfeedback` */

DROP TABLE IF EXISTS `admfeedback`;

CREATE TABLE `admfeedback` (
  `admfeedid` int(11) NOT NULL AUTO_INCREMENT,
  `urid` int(11) NOT NULL,
  `admbackcontent` varchar(200) NOT NULL,
  `admid` int(11) NOT NULL,
  PRIMARY KEY (`admfeedid`),
  KEY `FK_admfeedback` (`urid`),
  KEY `Fk_adminiatrator` (`admid`),
  CONSTRAINT `FK_admfeedback` FOREIGN KEY (`urid`) REFERENCES `user` (`urid`),
  CONSTRAINT `FK_administrator` FOREIGN KEY (`admid`) REFERENCES `administrator` (`admid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `admfeedback` */

insert  into `admfeedback`(`admfeedid`,`urid`,`admbackcontent`,`admid`) values (1,2,'啥情况',1),(4,4,'啥情况',1),(5,3,'啥情况',1),(6,3,'啥情况',3),(7,1,'啥情况',2),(8,1,'啥情况',3),(9,2,'啥情况',2),(10,2,'啥情况',1),(11,1,'123',5);

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `admid` int(11) NOT NULL AUTO_INCREMENT,
  `auser` varchar(50) NOT NULL,
  `apass` varchar(50) NOT NULL,
  `aname` varchar(50) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  PRIMARY KEY (`admid`) USING BTREE,
  UNIQUE KEY `auser` (`auser`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `administrator` */

insert  into `administrator`(`admid`,`auser`,`apass`,`aname`,`telephone`) values (1,'adcxk','121212','蔡徐坤','18464946651'),(2,'cuncw','152347','灰太狼','11218515874'),(3,'admin3','99990','老六','12345684548'),(4,'hoothh','141414','张杰','15165415415'),(5,'lxb','123456','道韫韬','15935956565');

/*Table structure for table `attractions` */

DROP TABLE IF EXISTS `attractions`;

CREATE TABLE `attractions` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(50) NOT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '连接city中的cid',
  `telephone` varchar(15) NOT NULL,
  `prices` double DEFAULT NULL,
  `acount` int(11) DEFAULT NULL,
  `stardate` datetime DEFAULT NULL,
  `ascore` decimal(1,1) DEFAULT NULL COMMENT '1-5之间',
  `adescride` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  KEY `fk_city` (`uid`) USING BTREE,
  CONSTRAINT `fk_city` FOREIGN KEY (`uid`) REFERENCES `citys` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `attractions` */

insert  into `attractions`(`aid`,`aname`,`uid`,`telephone`,`prices`,`acount`,`stardate`,`ascore`,`adescride`) values (1,'大雁塔',2,'15951848444',552,200,'2022-05-17 09:00:00','0.9','请带好口罩'),(2,'东方明珠',2,'15269326563',100,50,'2022-05-19 00:00:00','0.9','世界重点保护文物'),(3,'大唐不夜城',1,'19825665536',NULL,NULL,'2022-05-20 09:00:00','0.9','历史'),(4,'大唐芙蓉园',1,'18515618355',NULL,NULL,'2022-05-20 09:00:00','0.8',NULL),(5,'钟楼',1,'16521828949',NULL,NULL,'2022-05-20 09:00:00','0.9',NULL),(6,'黄河壶口瀑布风景名胜区',2,'15148466184',90,NULL,'2022-05-20 08:00:00','0.7','国家地质公园'),(7,'延安革命纪念馆',2,'15639635926',NULL,NULL,'2022-05-20 08:00:00','0.9','延安精神三大教育基地'),(8,'九寨沟',4,'15154886548',680,500,'2022-05-18 08:00:00','0.8','大自然鬼斧神工的杰作'),(9,'太湖',7,'15948154321',NULL,NULL,'2022-05-11 08:00:00','0.6','中国淡水湖之一'),(10,'东方明珠',8,'19362654614',NULL,NULL,'2022-01-19 09:00:00','0.9','上海市十大新景之一'),(11,'西湖',9,'18954248248',NULL,NULL,'2022-02-07 08:00:00','0.9','国家5A级旅游景区'),(12,'呼伦贝尔大草原',10,'18211485644',NULL,NULL,NULL,'0.9','纯天然大床'),(13,'上海迪尼斯度假区',8,'15259865655',800,1000,'2022-05-16 08:00:00','0.9','纯正迪士尼风格'),(14,'上海科技馆',8,'16526855563',200,300,'2022-05-16 09:00:00','0.8','爱国主义教育基地'),(15,'泰山',3,'16529536595',300,600,'2022-05-14 05:00:00','0.9','五岳之首'),(16,'华山',11,'18954512414',100,NULL,'2022-04-16 05:00:00','0.9','奇险天下第一山'),(17,'广州长隆旅游度假区 ',5,'18435929562',299,NULL,'2022-05-16 08:00:00','0.8','动物世界'),(18,'成都武侯祠 ',6,'15686296956',NULL,NULL,'2022-05-16 09:00:00','0.9','诸葛亮主要胜迹'),(19,'龙门石窟',12,'15865659568',594,NULL,'2022-05-16 08:00:00','0.8','国际五A级景区'),(20,'嵩山少林寺',13,'18465414986',NULL,NULL,'2022-05-17 09:00:00','0.7','中国佛教和功夫的发源地之一');

/*Table structure for table `citys` */

DROP TABLE IF EXISTS `citys`;

CREATE TABLE `citys` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `urban` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL COMMENT '引用省表中的cid',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `fk_provinces` (`cid`) USING BTREE,
  CONSTRAINT `fk_provinces` FOREIGN KEY (`cid`) REFERENCES `provinces` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `citys` */

insert  into `citys`(`uid`,`urban`,`cid`) values (1,'西安市',1),(2,'延安市',1),(3,'泰安市',3),(4,'阿坝藏族羌族自治州',4),(5,'广州市',3),(6,'成都市',4),(7,'安庆市',5),(8,'上海市',6),(9,'杭州市',7),(10,'呼伦贝尔市',8),(11,'渭南市',1),(12,'洛阳市',2),(13,'郑州市',2);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedid` int(11) NOT NULL AUTO_INCREMENT,
  `urid` int(11) NOT NULL COMMENT '连接用户表中的urid',
  `backcontent` varchar(100) NOT NULL,
  `admid` int(11) NOT NULL COMMENT '连接管理员中的admid',
  PRIMARY KEY (`feedid`) USING BTREE,
  KEY `fk_users` (`urid`) USING BTREE,
  KEY `fk_administor` (`admid`) USING BTREE,
  CONSTRAINT `fk_administor` FOREIGN KEY (`admid`) REFERENCES `administrator` (`admid`),
  CONSTRAINT `fk_users` FOREIGN KEY (`urid`) REFERENCES `user` (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `feedback` */

insert  into `feedback`(`feedid`,`urid`,`backcontent`,`admid`) values (1,1,'今天为什么取消行程',1),(2,12,'导游强卖强卖',5),(3,12,'祝你幸福',4),(4,9,'无法买票',3),(5,12,'听我说，谢谢你，因为有你，温暖了四季，',4),(7,6,'飞机为什么突然涨价',1),(8,14,'哎呦，这个旅游团很不错哦',3),(9,4,'为什么把我和隔壁家的狗的机票座位分开',3),(10,5,'为什么把我和房东家的猫机票座位分开',3),(11,2,'旅游团路线为什么私自改变',5),(12,8,'为什么火车不卖货',2),(13,3,'为什么飞机延误',2),(14,6,'为什么我付款后找不到订单',5),(15,14,'感谢评价',1),(16,12,'好的这位女士我们会尽快联系此次旅行团',5),(17,6,'不好意思，因为是高峰期我们会给您后面旅行最优的优惠的',1),(18,9,'可能是因为程序加载出了点问题，您可以重新启动一下',3),(19,2,'不好意思因为前面突然出现交通堵塞所以只能改变路线，先去下一个景点',5),(20,3,'不好意思亲，可能因为天气情况不好所以没办法起飞',2);

/*Table structure for table `history_order` */

DROP TABLE IF EXISTS `history_order`;

CREATE TABLE `history_order` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '连接景点中的aid',
  `rid` int(11) DEFAULT NULL COMMENT '连接火车中的rid',
  `fid` int(11) DEFAULT NULL COMMENT '连接飞机中的fid',
  `gid` int(11) DEFAULT NULL COMMENT '连接旅游团中的gid',
  `h_starttime` datetime NOT NULL,
  `state` varchar(10) NOT NULL,
  `h_evalustion` varchar(200) DEFAULT NULL,
  `urid` int(11) DEFAULT NULL COMMENT '连接用户中的urid',
  PRIMARY KEY (`hid`) USING BTREE,
  KEY `fk_attrautions` (`aid`) USING BTREE,
  KEY `fk_rallways` (`rid`) USING BTREE,
  KEY `fk_planes` (`fid`) USING BTREE,
  KEY `fk_tour+group` (`gid`) USING BTREE,
  KEY `fk_user` (`urid`) USING BTREE,
  CONSTRAINT `fk_attrautions` FOREIGN KEY (`aid`) REFERENCES `attractions` (`aid`),
  CONSTRAINT `fk_planes` FOREIGN KEY (`fid`) REFERENCES `planes` (`fid`),
  CONSTRAINT `fk_rallways` FOREIGN KEY (`rid`) REFERENCES `rallways` (`rid`),
  CONSTRAINT `fk_tour+group` FOREIGN KEY (`gid`) REFERENCES `tour_group` (`gid`),
  CONSTRAINT `fk_user` FOREIGN KEY (`urid`) REFERENCES `user` (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `history_order` */

insert  into `history_order`(`hid`,`aid`,`rid`,`fid`,`gid`,`h_starttime`,`state`,`h_evalustion`,`urid`) values (1,1,NULL,NULL,NULL,'2022-05-18 12:23:58','未完成','好',1),(3,NULL,1,NULL,NULL,'2022-05-18 15:33:11','未完成','好',1),(4,NULL,NULL,1,NULL,'2022-05-13 15:33:44','未完成','好',1),(5,NULL,NULL,1,NULL,'2022-05-17 15:35:12','未完成','好',1),(6,NULL,1,NULL,NULL,'2022-05-18 00:00:00','未完成','好',2),(7,19,NULL,NULL,NULL,'2022-05-25 00:00:00','未完成','无',1),(8,NULL,NULL,3,NULL,'2022-05-25 00:00:00','未完成','无',1),(9,NULL,NULL,5,NULL,'2022-05-25 00:00:00','未完成','无',1),(10,NULL,2,NULL,NULL,'2022-05-25 00:00:00','未完成','无',1),(11,1,NULL,NULL,NULL,'2022-05-25 00:00:00','未完成','无',1),(12,1,NULL,NULL,NULL,'2022-05-25 00:00:00','未完成','无',1),(13,NULL,NULL,5,NULL,'2022-05-25 00:00:00','未完成','无',1),(14,17,NULL,NULL,NULL,'2022-05-25 00:00:00','未完成','无',1),(15,1,NULL,NULL,NULL,'2022-05-26 00:00:00','未完成','无',1),(16,NULL,NULL,NULL,4,'2022-05-26 00:00:00','未完成','暂无评价',1);

/*Table structure for table `p_seats` */

DROP TABLE IF EXISTS `p_seats`;

CREATE TABLE `p_seats` (
  `p_sid` int(11) NOT NULL AUTO_INCREMENT,
  `seat` varchar(50) NOT NULL,
  PRIMARY KEY (`p_sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `p_seats` */

insert  into `p_seats`(`p_sid`,`seat`) values (1,'商务舱'),(2,'头等舱');

/*Table structure for table `p_types` */

DROP TABLE IF EXISTS `p_types`;

CREATE TABLE `p_types` (
  `p_fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'p_sid',
  `ordplanes` varchar(50) NOT NULL,
  PRIMARY KEY (`p_fid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `p_types` */

insert  into `p_types`(`p_fid`,`ordplanes`) values (1,'普通飞机'),(2,'波音747'),(3,'波音747'),(4,'普通飞机');

/*Table structure for table `planes` */

DROP TABLE IF EXISTS `planes`;

CREATE TABLE `planes` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `f_fid` varchar(20) NOT NULL,
  `p_fid` int(11) DEFAULT NULL COMMENT '连接飞机类型表的p_fid',
  `start_uid` int(11) DEFAULT NULL COMMENT '连接城市表中的uid',
  `stop_uid` int(11) DEFAULT NULL COMMENT '连接城市表中的uid',
  `p_starttime` datetime NOT NULL,
  `p_stoptime` datetime NOT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  KEY `fk_p_types` (`p_fid`) USING BTREE,
  KEY `fk_citys` (`stop_uid`) USING BTREE,
  KEY `fk_city` (`start_uid`) USING BTREE,
  CONSTRAINT `fk_ci` FOREIGN KEY (`start_uid`) REFERENCES `citys` (`uid`),
  CONSTRAINT `fk_citys` FOREIGN KEY (`stop_uid`) REFERENCES `citys` (`uid`),
  CONSTRAINT `fk_p_types` FOREIGN KEY (`p_fid`) REFERENCES `p_types` (`p_fid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `planes` */

insert  into `planes`(`fid`,`f_fid`,`p_fid`,`start_uid`,`stop_uid`,`p_starttime`,`p_stoptime`) values (1,'南航CZ3218',1,2,5,'2022-05-16 10:00:15','2022-05-17 01:20:10'),(2,'东航MU3756',2,1,6,'2022-05-20 11:20:00','2022-05-20 12:10:00'),(3,'陕航C4396',2,1,13,'2022-05-20 08:35:00','2022-05-21 21:57:53'),(4,'北航B3566',1,2,8,'2022-05-21 16:01:11','2022-05-21 19:01:17'),(5,'西航X1513',2,4,10,'2022-05-24 09:08:01','2022-05-24 11:08:13'),(6,'中航Z1945',1,5,8,'2022-05-18 13:10:13','2022-05-19 14:10:28');

/*Table structure for table `planesseattypes` */

DROP TABLE IF EXISTS `planesseattypes`;

CREATE TABLE `planesseattypes` (
  `p_fid` int(11) NOT NULL COMMENT '连接飞机类型p_fid',
  `p_sid` int(11) NOT NULL COMMENT '连接飞机类型座位表中的',
  `p_prices` double(10,1) DEFAULT NULL,
  `p_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_fid`,`p_sid`) USING BTREE,
  KEY `fk_p_seats` (`p_sid`) USING BTREE,
  CONSTRAINT `fk_p_seats` FOREIGN KEY (`p_sid`) REFERENCES `p_seats` (`p_sid`),
  CONSTRAINT `fk_p_type` FOREIGN KEY (`p_fid`) REFERENCES `p_types` (`p_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `planesseattypes` */

insert  into `planesseattypes`(`p_fid`,`p_sid`,`p_prices`,`p_num`) values (1,1,20.0,800),(2,2,10.0,1000),(3,1,20.0,1500),(4,1,10.0,10);

/*Table structure for table `provinces` */

DROP TABLE IF EXISTS `provinces`;

CREATE TABLE `provinces` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `provinces` */

insert  into `provinces`(`cid`,`province`) values (1,'陕西省'),(2,'河南省'),(3,'广东省'),(4,'四川省'),(5,'安徽省'),(6,'直辖市'),(7,'浙江省'),(8,'内蒙古自治区');

/*Table structure for table `r_seats` */

DROP TABLE IF EXISTS `r_seats`;

CREATE TABLE `r_seats` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `seat` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `r_seats` */

insert  into `r_seats`(`sid`,`seat`) values (1,'硬座'),(2,'软座');

/*Table structure for table `r_types` */

DROP TABLE IF EXISTS `r_types`;

CREATE TABLE `r_types` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `gtrain` varchar(50) NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `r_types` */

insert  into `r_types`(`tid`,`gtrain`) values (1,'动车'),(2,'快车'),(3,'绿皮'),(4,'动车'),(5,'动车'),(6,'动车');

/*Table structure for table `rallways` */

DROP TABLE IF EXISTS `rallways`;

CREATE TABLE `rallways` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `r_rid` varchar(50) NOT NULL,
  `tid` int(11) DEFAULT NULL COMMENT '连接火车类型表tid(R_types   tid)',
  `start_uid` int(11) DEFAULT NULL COMMENT '连接城市表中的uid',
  `stop_uid` int(11) DEFAULT NULL COMMENT '连接城市表uid',
  `starttime` datetime NOT NULL,
  `stoptime` datetime NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  KEY `fk_r_tytes` (`tid`) USING BTREE,
  KEY `fk_start_uid` (`start_uid`) USING BTREE,
  KEY `fk_stop_uid` (`stop_uid`) USING BTREE,
  CONSTRAINT `fk_r_tytes` FOREIGN KEY (`tid`) REFERENCES `r_types` (`tid`),
  CONSTRAINT `fk_start_uid` FOREIGN KEY (`start_uid`) REFERENCES `citys` (`uid`),
  CONSTRAINT `fk_stop_uid` FOREIGN KEY (`stop_uid`) REFERENCES `citys` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `rallways` */

insert  into `rallways`(`rid`,`r_rid`,`tid`,`start_uid`,`stop_uid`,`starttime`,`stoptime`) values (1,'K8168',1,1,2,'2021-05-16 10:00:00','2021-05-18 12:00:00'),(2,'T215',2,1,9,'2022-05-19 16:11:27','2022-05-19 18:11:32'),(3,'M4544',3,2,12,'2022-05-21 14:12:11','2022-05-23 12:12:23'),(4,'T1515',4,3,9,'2022-05-22 16:12:58','2022-05-24 12:13:09'),(5,'T255',5,5,13,'2022-05-21 13:13:28','2022-05-22 19:16:50'),(6,'R125',6,6,1,'2022-05-19 11:18:53','2022-05-20 13:19:06');

/*Table structure for table `tour_group` */

DROP TABLE IF EXISTS `tour_group`;

CREATE TABLE `tour_group` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) NOT NULL,
  `gtitle` varchar(100) NOT NULL,
  `aid` int(11) DEFAULT NULL COMMENT '连接景点aid',
  `gdays` int(11) NOT NULL,
  `g_starttime` datetime DEFAULT NULL,
  `g_stoptime` datetime DEFAULT NULL,
  `arrange` varchar(200) DEFAULT NULL,
  `gprice` varchar(100) NOT NULL,
  `evaluation` varchar(200) DEFAULT NULL,
  `notice` varchar(200) NOT NULL,
  PRIMARY KEY (`gid`) USING BTREE,
  KEY `fk_attractions` (`aid`) USING BTREE,
  CONSTRAINT `fk_attractions` FOREIGN KEY (`aid`) REFERENCES `attractions` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tour_group` */

insert  into `tour_group`(`gid`,`gname`,`gtitle`,`aid`,`gdays`,`g_starttime`,`g_stoptime`,`arrange`,`gprice`,`evaluation`,`notice`) values (1,'银河旅行团','西安两日游',2,2,'2022-05-16 10:00:00','2022-05-18 10:00:00','各大景点','500','安排很好','请准备好行程码'),(2,'携程旅游团','郑州三日游',2,3,'2022-05-24 17:14:15','2022-05-27 23:14:21','龙门石窟，嵩山少林寺','1500','携程出行就是方便','请下载携程APP'),(3,'甲骨文旅游团','Java六月游',12,180,'2022-02-02 17:18:32','2022-08-31 17:18:42','Spring ，Springboot,Mysql, ','9.9','学Java就来甲骨文','请自带电脑'),(4,'少女旅游团','上海七日游',13,7,'2022-05-19 17:24:39','2022-05-26 17:24:44','上海漫展，上海车展','2000','妹妹多','衣冠不整拒绝报团'),(5,'好再来旅游团','广州两日游',17,2,'2022-05-16 09:00:00','2022-05-18 09:00:00','旅游度假区','1000','出门戴口罩','出门戴口罩');

/*Table structure for table `trainseattypes` */

DROP TABLE IF EXISTS `trainseattypes`;

CREATE TABLE `trainseattypes` (
  `tid` int(11) NOT NULL COMMENT '连接火车类型表中的tid',
  `sid` int(11) NOT NULL COMMENT '连接火车座位类型表中的sid',
  `r_prices` double(10,1) DEFAULT NULL,
  `r_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`,`sid`) USING BTREE,
  KEY `fk_r_seats` (`sid`) USING BTREE,
  CONSTRAINT `fk_r_seats` FOREIGN KEY (`sid`) REFERENCES `r_seats` (`sid`),
  CONSTRAINT `fk_r_types` FOREIGN KEY (`tid`) REFERENCES `r_types` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `trainseattypes` */

insert  into `trainseattypes`(`tid`,`sid`,`r_prices`,`r_num`) values (1,1,200.0,200),(2,2,150.0,300),(3,1,200.0,400),(4,2,150.0,500),(5,1,200.0,100),(6,1,20.0,20);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `urid` int(11) NOT NULL AUTO_INCREMENT,
  `root` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `brithday` date DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL COMMENT '(0-100)之间',
  PRIMARY KEY (`urid`) USING BTREE,
  UNIQUE KEY `root` (`root`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `user` */

insert  into `user`(`urid`,`root`,`pass`,`name`,`brithday`,`telephone`,`address`,`sex`,`age`) values (1,'root','mysql','李四','2000-05-16','1234567892','陕西省西安市','男',22),(2,'admin','123456','张娜','2003-07-06','18996593625','陕西省延安市','女',19),(3,'hambeger','hcn123','凯峰','2003-07-06','18996593625','陕西省渭南市','女',19),(4,'cat','mao','房东家的猫','2001-01-13','15434984545','河南省洛阳市','女',21),(5,'dog','gou','隔壁家的狗','2001-01-14','14383843825','河南省洛阳市','男',21),(6,'goub','dogb','老贾','1987-05-26','15695686565','陕西省榆林市','男',35),(7,'xlou','xiluo','小路','1986-06-15','15965956558','浙江省杭州市','女',34),(8,'xqiang','wbjq','老王','1984-06-14','19835659356','河南省郑州市','男',38),(9,'mrong','marun','小荣','1985-05-14','15682698656','河南省洛阳市','女',37),(10,'kuli','kutou','库里','1979-02-26','18965659856','美国省金州市','男',44),(11,'labj','laob','勒布朗','1980-12-07','18556835684','美国省旧金山市','男',43),(12,'tiansao','tians','田静','2001-12-04','13369157343','陕西省渭南市','女',21),(13,'daosang','dsao','达伦','1989-12-04','15654518454','陕西省渭南市','男',33),(14,'jieln','jedea','杰伦','1988-08-16','16565632826','台湾省嘉义市','男',34),(15,'zhqj','cjiw','子琪','1995-08-23','16359586555','香港省九龙市','女',27);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
