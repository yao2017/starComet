create database blog_v1;

use blog_v1;


-- ----------------------------
-- Table structure for `roles`
-- ----------------------------

create table `roles`(
    `roles_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`role_name` VARCHAR(10) NOT NULL COMMENT'角色名称',
	`role` VARCHAR(10) NOT NULL COMMENT'用户权限',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	primary key(`roles_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------

create table `user`(
    `user_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`user_name` VARCHAR(10) NOT NULL COMMENT'用户名字',
	`user_account` VARCHAR(20) NOT NULL COMMENT'用户账户',
	`user_pwd` VARCHAR(20) NOT NULL COMMENT'用户密码',
	`user_head` VARCHAR(100) DEFAULT NULL COMMENT'用户头像',
	`user_role` INT(11) NOT NULL COMMENT'用户角色',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	primary key(`user_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `commment`
-- ----------------------------

create table `comment` (
    `com_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`com_tag` VARCHAR(10) NOT NULL COMMENT'评论标签',
	`com_content` VARCHAR(200) NOT NULL COMMENT'评论内容',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	primary key(`com_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `file`
-- ----------------------------

create table `file`(
    `file_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`file_type` TINYINT(11) NOT NULL COMMENT'文件类型 0(图片) 1(视频)',
	`file_url` VARCHAR(100) NOT NULL COMMENT'文件位置',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'修改时间',
	primary key(`file_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `document`
-- ----------------------------

create table `document`(
    `doc_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`doc_title` VARCHAR(50) NOT NULL COMMENT'文章标题',
	`doc_content` VARCHAR(10000) NOT NULL COMMENT'文章内容',
	`doc_tag` VARCHAR(20) NOT NULL COMMENT'文章标签',
	`doc_author` VARCHAR(20) DEFAULT NULL COMMENT'文章作者',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'修改时间',
    foreign key(`user_role`) references roles(`role`)
	primary key(`user_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `document_user`
-- ----------------------------

create table `document_user`(
    `id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`user_id` BIGINT(11) NOT NULL COMMENT'用户编号',
	`doc_id` BIGINT(11) NOT NULL COMMENT'文件编号',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'修改时间',
	primary key(`file_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `file_user`
-- ----------------------------

create table `file_user`(
    `id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`user_id` BIGINT(11) NOT NULL COMMENT'用户编号',
	`doc_id` BIGINT(11) NOT NULL COMMENT'文档编号',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'修改时间',
	primary key(`file_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `comment_user`
-- ----------------------------

create table `comment_user`(
    `id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`user_id` BIGINT(11) NOT NULL COMMENT'用户编号',
	`com_id` BIGINT(11) NOT NULL COMMENT'评论编号',
	`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'创建时间',
	`update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT'修改时间',
	primary key(`file_id`)
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

create table `role_authoration`(
`id` BIGINT(11) NOT NULL AUTO_INCREMENT,
`role_id` BIGINT(11) NOT NULL COMMENT '角色id',
`operation_id` BIGINT(11) NOT NULL COMMENT '权限id'
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

create table `operations`(
`id` BIGINT(11) NOT NULL AUTO_INCREMENT,
'operation_name' nvarchar(50) NOT NULL COMMENT '权限名称'
)ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;