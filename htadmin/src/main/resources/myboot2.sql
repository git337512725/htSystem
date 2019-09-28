/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.20-log : Database - onecard
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myboot` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `myboot`;

/*Table structure for table `access_event` */

DROP TABLE IF EXISTS `access_event`;

CREATE TABLE `access_event` (
  `timestmp` bigint(20) NOT NULL,
  `requestURI` varchar(254) DEFAULT NULL,
  `requestURL` varchar(254) DEFAULT NULL,
  `remoteHost` varchar(254) DEFAULT NULL,
  `remoteUser` varchar(254) DEFAULT NULL,
  `remoteAddr` varchar(254) DEFAULT NULL,
  `protocol` varchar(254) DEFAULT NULL,
  `method` varchar(254) DEFAULT NULL,
  `serverName` varchar(254) DEFAULT NULL,
  `postContent` varchar(254) DEFAULT NULL,
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `access_event` */

/*Table structure for table `access_event_header` */

DROP TABLE IF EXISTS `access_event_header`;

CREATE TABLE `access_event_header` (
  `event_id` bigint(20) NOT NULL,
  `header_key` varchar(254) NOT NULL,
  `header_value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`header_key`),
  CONSTRAINT `access_event_header_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `access_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `access_event_header` */

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL COMMENT 'id',
  `deptname` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `deptdesc` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `enable` int(3) DEFAULT NULL COMMENT '0 启用 1 禁用',
  `parentid` int(11) DEFAULT NULL COMMENT '上级部们',
  `sort` int(3) DEFAULT NULL COMMENT '排序',
  `parentname` varchar(100) DEFAULT NULL COMMENT '上级部们名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_dept` */

insert  into `t_dept`(`id`,`deptname`,`deptdesc`,`enable`,`parentid`,`sort`,`parentname`) values 

(1,'航天信息河南有限公司总部','某河南总部',0,0,1,NULL),

(101,'郑州东区分公司','东区分公司',0,1,101,'航天信息河南有限公司总部'),

(102,'总部物联网产业部','总部物联网',0,1,102,'航天信息河南有限公司总部'),

(103,'总部IT产业部','总部IT产业部',0,1,103,'航天信息河南有限公司总部'),

(10101,'郑州东区分公司金穗产业部','东区分公司金穗产业部',0,101,10101,'郑州东区分公司'),

(10102,'郑州东区分公司金融产业部','东区分公司金融产业部',0,101,10102,'郑州东区分公司'),

(10103,'郑州东区分公司物联网产业部','东区分公司物联网产业部',0,101,10103,'郑州东区分公司'),

(10104,'郑州东区分公司金盾产业部','东区分公司金盾产业部',0,101,10104,'郑州东区分公司'),

(10105,'郑州东区分公司IT产业部','东区分公司IT产业部',0,101,10105,'郑州东区分公司'),

(10201,'物联网研发小组','研发小组',0,102,10201,'总部物联网产业部'),

(10202,'物联网施工小组','施工小组',0,102,10202,'总部物联网产业部');

/*Table structure for table `t_resources` */

DROP TABLE IF EXISTS `t_resources`;

CREATE TABLE `t_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '资源名称',
  `reskey` int(11) DEFAULT NULL COMMENT '资源id',
  `resurl` varchar(100) DEFAULT NULL COMMENT '资源链接',
  `preskey` int(11) DEFAULT NULL COMMENT '父资源id',
  `pname` varchar(100) DEFAULT NULL COMMENT '父资源名称',
  `sort` int(11) DEFAULT NULL COMMENT '资源排序',
  `type` int(11) DEFAULT NULL COMMENT '0 启用 1 禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_resources` */

insert  into `t_resources`(`id`,`name`,`reskey`,`resurl`,`preskey`,`pname`,`sort`,`type`) values 

(1,'用户管理',1,'aaaaa',0,NULL,1,0),

(2,'用户列表',1001,'aadd',1,'用户管理',1001,0),

(3,'用户添加',1002,'bbb',1,'用户管理',1002,0),

(4,'用户修改',1003,'ccc',1,'用户管理',1003,0),

(5,'用户删除',1004,'ddd',1,'用户管理',1004,0),

(6,'商品管理',2,'spaaaa',0,NULL,2,0),

(7,'商品列表',2001,'splist',2,'商品管理',2001,0),

(8,'商品添加',2002,'spadd',2,'商品管理',2002,0),

(9,'商品修改',2003,'spupdate',2,'商品管理',2003,0),

(10,'商品删除',2004,'spdel',2,'商品管理',2004,0);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rolekey` varchar(100) NOT NULL COMMENT '角色id',
  `roledesc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `prolekey` varchar(100) DEFAULT NULL COMMENT '父角色id',
  `proledesc` varchar(255) DEFAULT NULL COMMENT '父角色描述',
  `enable` int(3) DEFAULT NULL COMMENT '0 启用 1 禁用',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`rolekey`,`roledesc`,`prolekey`,`proledesc`,`enable`,`sort`) values 

(1,'1','超级管理员','0',NULL,0,1),

(2,'2','某河南总部总经理','1','超级管理员',0,2),

(3,'2001','某河南总部副总经理','2','某河南总部总经理',0,2001),

(4,'2002','某河南分公司总经理','2','某河南总部总经理',0,2002),

(5,'2002001','某河南分公司副总经理','2002','某河南分公司总经理',0,2002001),

(6,'2001001','某河南总部研发部经理','2001','某河南总部副总经理',0,2001001),

(7,'2001002','某河南总部物联网部经理','2001','某河南总部副总经理',0,2001002),

(8,'2001003','某河南总部金融产业部经理','2001','某河南总部副总经理',0,2001003),

(9,'2001001001','某河南总部研发部员工','2001001','某河南总部研发部经理',0,2001001001),

(10,'2001002001','某河南总部物联网部员工','2001002','某河南总部物联网部经理',0,2001002001),

(11,'2001002002','某河南分公司金穗产业部经理','2002001','某河南分公司副总经理',0,2001002002),

(12,'2001002003','某河南总部金融产业部员工','2001003','某河南总部金融产业部经理',0,2001002003),

(13,'2001002004','某河南分公司金穗产业部员工','2001002002','某河南分公司金穗产业部经理',0,2001002004);

/*Table structure for table `t_role_resources` */

DROP TABLE IF EXISTS `t_role_resources`;

CREATE TABLE `t_role_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rolekey` varchar(100) NOT NULL COMMENT '角色id',
  `reskey` varchar(100) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`,`rolekey`,`reskey`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_resources` */

insert  into `t_role_resources`(`id`,`rolekey`,`reskey`) values 

(92,'2001','1'),

(93,'2001','1003'),

(94,'2001','1004'),

(95,'2','1'),

(96,'2','1002'),

(97,'2','1003'),

(98,'2','1004'),

(99,'2','2'),

(100,'2','2001'),

(101,'2','2002'),

(102,'2','2003'),

(103,'2','2004'),

(142,'1','1'),

(143,'1','1002'),

(144,'1','1003'),

(145,'1','1004'),

(146,'1','2'),

(147,'1','2001'),

(148,'2002001','1'),

(149,'2002001','1002'),

(150,'2002001','1003'),

(151,'2002001','1004'),

(152,'2002001','2'),

(153,'2002001','2001'),

(154,'2002001','2002'),

(155,'2002001','2003'),

(156,'2002001','2004');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(33) DEFAULT NULL,
  `password` varchar(33) DEFAULT NULL,
  `enable` int(10) DEFAULT NULL COMMENT ' 0 启用 1 禁用',
  `phoneno` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `mail` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `addtime` date DEFAULT NULL COMMENT '添加时间',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `deptname` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `sex` int(3) DEFAULT NULL COMMENT '性别',
  `info` varchar(500) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`enable`,`phoneno`,`mail`,`addtime`,`deptid`,`deptname`,`sex`,`info`) values 

(65,'admin','e10adc3949ba59abbe56e057f20f883e',0,'ddf','fd','2018-02-06',101,'郑州东区分公司',1,'df');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `rolekey` varchar(100) DEFAULT NULL COMMENT '角色识别key',
  PRIMARY KEY (`id`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
