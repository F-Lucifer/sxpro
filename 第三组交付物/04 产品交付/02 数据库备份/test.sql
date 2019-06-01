/*
Navicat MySQL Data Transfer

Source Server         : Windows
Source Server Version : 50644
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2019-05-31 16:31:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `children`
-- ----------------------------
DROP TABLE IF EXISTS `children`;
CREATE TABLE `children` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `cname` varchar(25) DEFAULT NULL,
  `attributes` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `mid` (`mid`),
  CONSTRAINT `children_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of children
-- ----------------------------
INSERT INTO `children` VALUES ('1', '1', '用户查询', 'yhcx.jsp');
INSERT INTO `children` VALUES ('2', '1', '添加用户', 'tjyh.jsp');
INSERT INTO `children` VALUES ('3', '2', '部门查询', 'bmcx.jsp');
INSERT INTO `children` VALUES ('4', '2', '添加部门', 'tjbm.jsp');
INSERT INTO `children` VALUES ('5', '3', '职位查询', 'zwcx.jsp');
INSERT INTO `children` VALUES ('6', '3', '添加职位', 'tjzw.jsp');
INSERT INTO `children` VALUES ('7', '4', '员工查询', 'ygcx.jsp');
INSERT INTO `children` VALUES ('8', '4', '添加员工', 'tjyg.jsp');
INSERT INTO `children` VALUES ('9', '5', '公告查询', 'gggl.jsp');
INSERT INTO `children` VALUES ('10', '5', '添加公告', 'addgg.jsp');
INSERT INTO `children` VALUES ('11', '6', '文档查询', null);
INSERT INTO `children` VALUES ('12', '6', '上传文档', null);

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `depName` varchar(25) NOT NULL,
  `depDes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`depName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('市场部', '市场部');
INSERT INTO `department` VALUES ('总共办', '总公办');
INSERT INTO `department` VALUES ('技术部', '技术部');
INSERT INTO `department` VALUES ('教学部', '教学部');
INSERT INTO `department` VALUES ('管理部', '管理事务');
INSERT INTO `department` VALUES ('财务部', '财务部');
INSERT INTO `department` VALUES ('运营部', '后勤部');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empId` varchar(18) NOT NULL,
  `empName` varchar(25) DEFAULT NULL,
  `empSex` varchar(25) DEFAULT NULL,
  `empTel` varchar(11) DEFAULT NULL,
  `empEmail` varchar(25) DEFAULT NULL,
  `empEdu` varchar(20) DEFAULT NULL,
  `empAdd` varchar(25) DEFAULT NULL,
  `depName` varchar(25) DEFAULT NULL,
  `posName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`empId`),
  KEY `depName` (`depName`),
  KEY `posName` (`posName`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depName`) REFERENCES `department` (`depName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`posName`) REFERENCES `position` (`posName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('500101199708210013', '张渊博', '男', '15213539408', '1439700749@qq.com', '本科', '重庆市万州区', '运营部', '数据库构架师');
INSERT INTO `employee` VALUES ('500101199812150000', '孙腾飞', '男', '13512329570', '1439700749@qq.com', '本科', '重庆市石柱县', '总共办', '总经理');
INSERT INTO `employee` VALUES ('500228199923338744', '殷豪', '男', '13512329570', '1439700749@qq.com', '本科', '重庆市', '技术部', 'java高级开发工程师');
INSERT INTO `employee` VALUES ('899663214569874523', '一叶知秋', '女', '1355898451', '15464511@qq.com', '本科', '内蒙古', '财务部', 'java高级开发工程师');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '用户管理');
INSERT INTO `menu` VALUES ('2', '部门管理');
INSERT INTO `menu` VALUES ('3', '职位管理');
INSERT INTO `menu` VALUES ('4', '员工管理');
INSERT INTO `menu` VALUES ('5', '公告管理');
INSERT INTO `menu` VALUES ('6', '下载中心');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notTitle` varchar(25) NOT NULL,
  `notContent` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `people` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notTitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('123', '123', '2019-05-29', '123');
INSERT INTO `notice` VALUES ('张渊博', '啦啦啦', '2019-05-29', '吴若');
INSERT INTO `notice` VALUES ('短会', '今天开个短会', '2019-05-29', '张渊博');
INSERT INTO `notice` VALUES ('还要开会', '继续开会', '2019-05-29', '张渊博');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `posName` varchar(25) NOT NULL,
  `posDes` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`posName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('java中级开发工程师', null);
INSERT INTO `position` VALUES ('java开发工程师', 'java开发工程师');
INSERT INTO `position` VALUES ('java高级开发工程师', 'java高级开发工程师');
INSERT INTO `position` VALUES ('主管', '主管');
INSERT INTO `position` VALUES ('总经理', '总经理');
INSERT INTO `position` VALUES ('数据库构架师', '数据库构架师');
INSERT INTO `position` VALUES ('系统管理员', '系统管理员');
INSERT INTO `position` VALUES ('经理', '经理');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `permission` varchar(5) DEFAULT NULL,
  `creatTime` varchar(25) DEFAULT NULL,
  `loginName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'ff', '123', '管理员', '2019-05-21', 'ff');
INSERT INTO `user` VALUES ('4', 'czx', 'czx', '普通用户', '2019-05-26', null);
INSERT INTO `user` VALUES ('5', 'gg', '123', '普通用户', '2019-05-27', null);
INSERT INTO `user` VALUES ('6', '13', '123', '普通用户', '2019-05-27', null);
INSERT INTO `user` VALUES ('7', 'ccc', '123', '普通用户', '2019-05-27', null);
