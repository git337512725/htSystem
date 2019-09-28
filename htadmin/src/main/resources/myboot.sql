/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.20-log : Database - myboot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`myboot` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `myboot`;

/*Table structure for table `t_department` */

DROP TABLE IF EXISTS `t_department`;

CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `departName` varchar(60) DEFAULT NULL COMMENT '部门名称',
  `departDesc` varchar(60) DEFAULT NULL COMMENT '部门描述',
  `pid` int(11) DEFAULT NULL COMMENT '上级部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_department` */

insert  into `t_department`(`id`,`departName`,`departDesc`,`pid`) values 
(1,'某公司','某公司',0),
(2,'人事部门','人事部门',1),
(3,'商务部门','商务部门',2);

/*Table structure for table `t_department_role` */

DROP TABLE IF EXISTS `t_department_role`;

CREATE TABLE `t_department_role` (
  `departId` int(11) DEFAULT NULL COMMENT '部门ID',
  `roleId` int(11) DEFAULT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_department_role` */

insert  into `t_department_role`(`departId`,`roleId`) values 
(2,2);

/*Table structure for table `t_resource` */

DROP TABLE IF EXISTS `t_resource`;

CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sourceName` varchar(60) DEFAULT NULL COMMENT '资源名称',
  `sourceUrl` varchar(255) DEFAULT NULL COMMENT '资源链接',
  `pid` int(11) DEFAULT NULL COMMENT '父资源ID',
  `sourceType` tinyint(4) DEFAULT NULL COMMENT '资源类型0 菜单  1 按钮  2 静态资源 3...',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`sourceName`,`sourceUrl`,`pid`,`sourceType`) values 
(1,'系统管理','/system',0,0),
(2,'商品管理','/product/list',0,0),
(3,'商品增加','/product/add',2,0),
(4,'商品修改','/product/update',2,0);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `roleName` varchar(60) DEFAULT NULL COMMENT '角色名称',
  `roleDesc` varchar(60) DEFAULT NULL COMMENT '角色描述',
  `roleType` tinyint(4) DEFAULT NULL COMMENT '角色类型0 系统全局角色，1 部门角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`roleName`,`roleDesc`,`roleType`) values 
(1,'super','超管',0),
(2,'商务部经理','商务部经理',1);

/*Table structure for table `t_role_resource` */

DROP TABLE IF EXISTS `t_role_resource`;

CREATE TABLE `t_role_resource` (
  `roleId` int(11) NOT NULL COMMENT '角色ID',
  `resourceId` int(11) NOT NULL COMMENT '资源ID',
  PRIMARY KEY (`roleId`,`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_role_resource` */

insert  into `t_role_resource`(`roleId`,`resourceId`) values 
(1,1),
(1,2),
(1,3),
(1,4);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userName` varchar(60) DEFAULT NULL COMMENT '用户名称',
  `userPass` varchar(60) DEFAULT NULL COMMENT '用户密码',
  `passSalt` varchar(60) DEFAULT NULL COMMENT '盐值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`userPass`,`passSalt`) values 
(1,'admin','admin','qwertyuiop');

/*Table structure for table `t_user_info` */

DROP TABLE IF EXISTS `t_user_info`;

CREATE TABLE `t_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `userId` varchar(60) DEFAULT NULL COMMENT '用户ID',
  `departId` int(60) DEFAULT NULL COMMENT '部门ID',
  `departName` varchar(60) DEFAULT NULL COMMENT '部门名称',
  `departRemark` varchar(60) DEFAULT NULL COMMENT '部门备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_user_info` */

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `roleId` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`userId`,`roleId`) values 
(1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
