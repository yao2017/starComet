/*
Navicat MySQL Data Transfer

Source Server         : liupu
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : blog_v1

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-03-31 14:47:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `com_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `com_tag` varchar(10) NOT NULL COMMENT '评论标签',
  `com_content` varchar(200) NOT NULL COMMENT '评论内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for `comment_user`
-- ----------------------------
DROP TABLE IF EXISTS `comment_user`;
CREATE TABLE `comment_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户编号',
  `com_id` bigint(11) NOT NULL COMMENT '评论编号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_user
-- ----------------------------

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `doc_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `doc_title` varchar(50) NOT NULL COMMENT '文章标题',
  `doc_content` varchar(10000) NOT NULL COMMENT '文章内容',
  `doc_tag` varchar(20) NOT NULL COMMENT '文章标签',
  `doc_author` varchar(20) DEFAULT NULL COMMENT '文章作者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------

-- ----------------------------
-- Table structure for `document_comment`
-- ----------------------------
DROP TABLE IF EXISTS `document_comment`;
CREATE TABLE `document_comment` (
  `id` int(11) NOT NULL COMMENT'编号',
  `doc_id` bigint(11) NOT NULL COMMENT'文章编号',
  `com_id` bigint(11) NOT NULL COMMENT'评论编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `document_user`
-- ----------------------------
DROP TABLE IF EXISTS `document_user`;
CREATE TABLE `document_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户编号',
  `doc_id` bigint(11) NOT NULL COMMENT '文件编号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document_user
-- ----------------------------

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `file_type` tinyint(11) NOT NULL COMMENT '文件类型 0(图片) 1(视频)',
  `file_url` varchar(100) NOT NULL COMMENT '文件位置',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for `file_user`
-- ----------------------------
DROP TABLE IF EXISTS `file_user`;
CREATE TABLE `file_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户编号',
  `doc_id` bigint(11) NOT NULL COMMENT '文档编号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_user
-- ----------------------------

-- ----------------------------
-- Table structure for `operations`
-- ----------------------------
DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(50) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations
-- ----------------------------

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roles_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) NOT NULL COMMENT '角色名称',
  `role` varchar(10) NOT NULL COMMENT '用户权限',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for `role_authoration`
-- ----------------------------
DROP TABLE IF EXISTS `role_authoration`;
CREATE TABLE `role_authoration` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `operation_id` bigint(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_authoration
-- ----------------------------

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户编号',
  `role_id` bigint(11) NOT NULL COMMENT '角色编号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) NOT NULL COMMENT '用户名字',
  `user_account` varchar(20) NOT NULL COMMENT '用户账户',
  `user_pwd` varchar(20) NOT NULL COMMENT '用户密码',
  `user_head` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `user_role` int(11) NOT NULL COMMENT '用户角色',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'root', 'admin', '123456', 'http://baidu.com', '1', '2019-03-28 16:24:02');
