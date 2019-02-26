# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.20-log)
# Database: video.a.com
# Generation Time: 2019-02-24 10:49:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table vd_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_admin`;

CREATE TABLE `vd_admin` (
  `uid` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '管理id',
  `groups` varchar(1000) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '权限组',
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户密码',
  `onetime_password` char(60) CHARACTER SET utf8 DEFAULT NULL,
  `fake_password` char(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '伪造密码',
  `realname` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `potato` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Potato',
  `safe_ips` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '登陆IP限制',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '是否首次登录',
  `date_expired` datetime DEFAULT NULL COMMENT '失效日期时间',
  `otp_auth` tinyint(1) DEFAULT '0' COMMENT 'MFA认证等级 0:禁用  1:启用  2:强制启用 [未使用]',
  `otp_authcode` char(16) CHARACTER SET utf8 DEFAULT '' COMMENT 'MFA验证码',
  `need_audit` tinyint(1) DEFAULT '0' COMMENT '登陆是否需要后台进行人工审核 0: 不需要 1:需要',
  `session_id` varchar(32) CHARACTER SET utf8 DEFAULT '' COMMENT '登陆时session_id',
  `session_expire` int(11) DEFAULT '1440' COMMENT 'SESSION有效期，默认24分钟',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '帐号状态 1:正常 0:禁止登陆',
  `regtime` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `regip` varchar(15) CHARACTER SET utf8 DEFAULT '' COMMENT '注册ip',
  `logintime` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `loginip` varchar(15) CHARACTER SET utf8 DEFAULT '' COMMENT '最后登录IP',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `userid` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

LOCK TABLES `vd_admin` WRITE;
/*!40000 ALTER TABLE `vd_admin` DISABLE KEYS */;

INSERT INTO `vd_admin` (`uid`, `groups`, `username`, `password`, `onetime_password`, `fake_password`, `realname`, `email`, `potato`, `safe_ips`, `is_first_login`, `date_expired`, `otp_auth`, `otp_authcode`, `need_audit`, `session_id`, `session_expire`, `status`, `regtime`, `regip`, `logintime`, `loginip`)
VALUES
	('1','1','admin','$2y$10$mnq6yQodeZ0JEaS5rhDqnOZjmmcqEWvyIVYh2AUvLRbZ4LdwaNO4e','','$2y$10$VM56RjPoP/pBdwWS2RdPO.f8jV1qXX7sHiHckLbALKvjgNqLIKVHG','管理员','seatle888@gmail.com','','',0,'2088-06-08 00:00:00',0,'',0,'6iktbon2l6auqoiaj12tf7bsq0',86400,1,1504873451,'10.10.12.25',1548562184,'127.0.0.1'),
	('2e9223ebda358a1e265241b903a5be08','eecdcb7c1416183f6d02be982d4671c8','test1','$2y$10$5.4JR388VzRceZVzCjEDU.W9CDVr7f9aWtR.KMO4Br.0LXL/A5s5a',NULL,NULL,'test1','test1@test.local','','',0,NULL,0,'',0,'',1440,1,1544696251,'127.0.0.1',1544696738,'127.0.0.1'),
	('eea83e86ad5c708bcd7b059ae6811184','3','test','$2y$10$Nn3vP5njpgFrQICNgLkxi.RCGPmIcR8MnW8aVAUqEid977xLaaGk.','',NULL,'test','','','',0,NULL,0,'',0,'',1440,1,1541403213,'127.0.0.1',1544258723,'127.0.0.1');

/*!40000 ALTER TABLE `vd_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_admin_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_admin_group`;

CREATE TABLE `vd_admin_group` (
  `id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'ID',
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户组名称',
  `purviews` text CHARACTER SET utf8 NOT NULL COMMENT '用户组权限',
  `uptime` int(10) DEFAULT NULL COMMENT '修改时间',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组表';

LOCK TABLES `vd_admin_group` WRITE;
/*!40000 ALTER TABLE `vd_admin_group` DISABLE KEYS */;

INSERT INTO `vd_admin_group` (`id`, `name`, `purviews`, `uptime`, `addtime`)
VALUES
	('1','超级管理员','*',1504839424,1504839424),
	('2','普通管理员','content-index,content-add,content-edit,content-del,category-index,category-add,category-edit,category-del,member-index,member-add,member-edit,member-del,admin-editpwd,admin-editpwd_fake,admin-mypurview,admin_group-index,admin_group-add,admin_group-edit,admin_group-del,admin-index,admin-add,admin-edit,admin-del,admin-oplog,admin-login_log,config-index,config-add,config-edit,config-del,cache-index,cache-del,cache-clear,cache-redis_keys,cache-redis_info,filemanage-index,filemanage-add,filemanage-edit,filemanage-del,crond-index,crond-add,crond-edit,crond-del',1544696112,1504839539),
	('3','测试人员','admin-editpwd_fake',1532783074,1504842647),
	('eecdcb7c1416183f6d02be982d4671c8','test','content-index,content-add,content-edit,content-del,category-index,category-add,category-edit,category-del,member-index,member-add,member-edit,member-del',1544696709,1544696122);

/*!40000 ALTER TABLE `vd_admin_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_admin_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_admin_login`;

CREATE TABLE `vd_admin_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户ID',
  `username` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户名',
  `session_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT 'SESSION ID',
  `agent` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '浏览器信息',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '登录IP',
  `logincountry` varchar(2) NOT NULL DEFAULT '' COMMENT '登录国家',
  `loginsta` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '登录时状态 1=成功，0=失败',
  `cli_hash` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户登录名和ip的hash',
  PRIMARY KEY (`id`),
  KEY `logintime` (`logintime`),
  KEY `cli_hash` (`cli_hash`,`loginsta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户登陆记录表';

LOCK TABLES `vd_admin_login` WRITE;
/*!40000 ALTER TABLE `vd_admin_login` DISABLE KEYS */;

INSERT INTO `vd_admin_login` (`id`, `uid`, `username`, `session_id`, `agent`, `logintime`, `loginip`, `logincountry`, `loginsta`, `cli_hash`)
VALUES
	(1,'1','admin','0jdtkdmhccpro6duqhrph8j62m','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544778424,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(2,'1','admin','56564b139eb7fec9d0c79bcc08005cc3','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15',1544784473,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(3,'1','admin','4594380dab3dcc3d27085857a80b7c0d','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544787918,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(4,'1','admin','a3333436b3f484fc93fa9f3af20c3ff8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15',1544788056,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(5,'1','admin','e83aa0586831b3725d570703920bb812','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544791358,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(6,'1','admin','8q05mi06e83c6q74tbor9q6481','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544799457,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(7,'1','admin','95b6cce59976b3f7d8ec590190608586','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544843054,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(8,'1','admin','329f503370b6d65f91f90b7cfbb84ac9','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15',1544846245,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(9,'1','admin','6cc2754e3f13ed83a02ebd4d9d4b50f9','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544849337,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(10,'1','admin','7q4mscvnveoomsrusptmkq9gc6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544851088,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(11,'1','admin','48112b8835d5cc7a169497acb41c575e','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544851980,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(12,'1','admin','524ukq9pvso2kbje2b55v7kbnb','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1544853345,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(13,'1','admin','6ph5t6emk2du82p1ab7pe5q4hq','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15',1544858270,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(14,'1','admin','coopokpqohvp249q2s02hko75o','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15',1544858402,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(15,'1','admin','7325c7fdbdcbcdb418f55d64fd6e87b2','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545051377,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(16,'1','admin','8e7cebe20c611d738135ced6cfd02635','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545190105,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(17,'1','admin','74f926eb71a7d959eaee488724348890','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545190107,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(18,'1','admin','6553f7b4d1f4fc97f9866bbab7e65a58','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545225226,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(19,'1','admin','62kgn03g2ght3m40460a9n2eij','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545302266,'192.168.10.181','',0,'8482cb4b16cddd0897118a91cfc30bb1'),
	(20,'1','admin','r5oo17ffjco5kfqo0qtigf6agl','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545302274,'192.168.10.181','',1,'8482cb4b16cddd0897118a91cfc30bb1'),
	(21,'1','admin','bl3ar8b5fbdkhl5t4p3e5it1a9','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545302437,'192.168.10.135','',1,'396a12637e54067b445b643ad65f4bf2'),
	(22,'1','admin','76981aa35f2bc5335c6347768905e0c1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545377594,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(23,'1','admin','puahv88am8f31c9tnr6ruld024','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545402211,'192.168.10.221','',1,'5875ba7a15d4de7ddff6c9ba67bc9eff'),
	(24,'1','admin','062a5d78f1b28ac06c5f99bde4e8345a','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545447606,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(25,'1','admin','e4g3ibjnka6ff1u42ankergd5f','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545450857,'192.168.10.181','',1,'8482cb4b16cddd0897118a91cfc30bb1'),
	(26,'1','admin','3uj4d9cjtmfmpu2fsvlvsbrg60','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545451080,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(27,'1','admin','52695a88f1848ad107e57a5209469799','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1545453446,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(28,'1','admin','61787pc8ncqv1orjabpjdd6pdu','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545463203,'192.168.10.181','',1,'8482cb4b16cddd0897118a91cfc30bb1'),
	(29,'1','admin','dcd769ea76c091e2e6c5224bea2cda28','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1545471929,'127.0.0.1','',0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(30,'1','admin','3ae463600a44535d9285b3c03d887dbd','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1545471937,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(31,'1','admin','39b89000a7e15ec71798b6cd2c82525f','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36',1545482260,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(32,'1','admin','dc6ec44d115f81ffd8c800d4534d87ec','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1545490072,'127.0.0.1','',0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(33,'1','admin','6f4e1a9b9826dd45919e73d79c3312d4','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',1545490078,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(34,'1','admin','3b9951e74b572aed5fa4385d98bdc08d','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.1 Safari/605.1.15',1545490269,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(35,'1','admin','kcacen0kqufu7ub5fh2n4pkhh4','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545491805,'146.196.91.115','',1,'a1964bd72c43afd4e90676afe9be7ba1'),
	(36,'1','admin','q33o6eb90ubrqspv38muvdqcau','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545492790,'146.196.91.115','',1,'a1964bd72c43afd4e90676afe9be7ba1'),
	(37,'1','admin','6mqn773fid34k7gbvrtrp029gn','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545637945,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(38,'1','admin','gv8riifqsda7mo0j1veslk202k','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545638102,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(39,'1','admin','p88cjsfk9esu4q9ce9k391vu06','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545639204,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(40,'1','admin','pghdin6jlusu6movkmcri8t8b1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545640778,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(41,'1','admin','e8e0eae15903d5a614fa323da2ba8c5d','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545641437,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(42,'1','admin','55t4dntukf8f5kc3o0l0gtk394','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545643045,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(43,'1','admin','bb79uu2iebbqh9hnsbsdp527i9','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545646967,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(44,'1','admin','7pvssrqf29u1nr382vok94n6j0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545647239,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(45,'1','admin','49r6lmm99ipvjd36a07ddel1et','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545647595,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(46,'1','admin','0cdnflr38mjfuf9r58ng7rg96v','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545649692,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(47,'1','admin','6ulsu8t0pnhldafl658h6onf8m','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545711551,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(48,'1','admin','q3qglhm3g2h9clll03930guofg','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545713836,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(49,'1','admin','6mjaag65mrm554j5bs84hcaqns','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545727345,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(50,'1','admin','oj6tmtgk08i5rfhks1if1sdoj4','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545729371,'192.168.83.119','',1,'ea79b1a689879c8921a16957094e989f'),
	(51,'1','admin','0ftve2oghq2k0u8kmmbutdhm5u','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545798683,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(52,'1','admin','vvj1ao99e3v276kjmusvmsfq9c','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545802530,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(53,'1','admin','adn0876dllj8390bhlbuvkc564','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545813675,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(54,'1','admin','deggmpnb4qjsksprcq1jqqgfbk','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545889996,'127.0.0.1','',0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(55,'1','admin','fe7pt22d3b2t324n83rd35p798','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545890000,'127.0.0.1','',0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(56,'1','admin','fgrfcq3ajnarof9g22l1jjg6bg','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545890004,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(57,'1','admin','oqe1sd81o0c2q7d1ei6l4ep0kb','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1545914487,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(58,'1','admin','jh4rhattsa056tj8kvrvgul6d8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546057298,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(59,'1','admin','815274433d1af7a9347744915d2934ad','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546486715,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(60,'1','admin','87jm7r82fief1h7k8t6260cocm','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546673467,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(61,'1','admin','tvk7vie12soluaa2oq26gbanvr','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15',1546673955,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(62,'1','admin','bce4fce297ff214a1df6cfc20285b0d9','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546682556,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(63,'1','admin','8525656682b9f3fb0726481182730e53','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546682917,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(64,'1','admin','k8886vtapn5et2rbeang2r0icr','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546683489,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(65,'1','admin','77e5049973b20698fa2fdce7a1113d0b','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546683529,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(66,'1','admin','9ogphl5ub0jnk9fvbiuk6lirtj','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546683881,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(67,'1','admin','ik64c1plh8b7mike1kkl5d838p','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546683939,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(68,'1','admin','9rq5ctn7kqlckpv7g6ren1vfvu','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546684126,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(69,'1','admin','lt1d7jtkmqvhec84789t1fckug','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546691194,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(70,'1','admin','9e148564364eaf3ba9ef17a29e251cbd','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546832807,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(71,'1','admin','5i7esl0m01hn5rfr7tb03gkk2r','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546844825,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(72,'1','admin','afpgu0t73dreo2d0elsmafbfki','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546847810,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(73,'1','admin','m78a2mt8qns8nvq08huc91d584','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546848881,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(74,'1','admin','7uutnhgtj0h1qjc0j2g2s53uj5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546849996,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(75,'1','admin','0r6d0mcm75054f38nrmn8g0mk8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546850417,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(76,'1','admin','758c4818e551104b0f657a5a5b6d44f8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546850364,'::1','',0,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(77,'1','admin','8644797907843d56d9cf6b8134627e13','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546850372,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(78,'1','admin','dvtn5gk1c7ccf49mh38ma5m5k3','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546856612,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(79,'1','admin','s18e0fkugdd640l0k1kqo255j7','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546857425,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(80,'1','admin','d4f3615236c2f62f8e4b58ae62c16349','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546858725,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(81,'1','admin','lan6j5si0caopha68facm4v4ta','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546859021,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(82,'1','admin','gjbvprj7n3aihkrinlaotv0mpa','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546860669,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(83,'1','admin','lfs0jpuohn174af8tekjnblvju','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546863260,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(84,'1','admin','l564pq0kv2aosdk33q73nor0fk','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546863909,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(85,'1','admin','kvpenffktmqhdqh8pucj44vgtd','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546866450,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(86,'1','admin','9qhur4ou2r54ghsu51dqcltj96','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546866507,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(87,'1','admin','0m786v2ikjk7bg85c0v86pqmlj','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546866597,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(88,'1','admin','l1kohvscvtmps4ljdnpq5as6r5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546866618,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(89,'1','admin','i4i0dq63g0ke6sfofc9cuhqfep','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546871843,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(90,'1','admin','25pd4t7a0ee2gscafn08pevag9','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546873627,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(91,'1','admin','792f47440a163957fceba0572f8db5c0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546873669,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(92,'1','admin','hocsu0en82cjcu803bjfve7gnu','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546873925,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(93,'1','admin','9cfcfd930fef783cedbcd01a412c5516','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546873911,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(94,'1','admin','18b57vm6focvjdntv7g3pqgik0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546874185,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(95,'1','admin','914fbe69cfba22336bcc46f3e7bfa58d','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546874129,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(96,'1','admin','bfcb0816635cbf52e749d77b8a29e99e','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546915666,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(97,'1','admin','483d6f190adea098378eee3709537acd','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546915835,'::1','',0,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(98,'1','admin','ed24fb0353f5941313a7c16c34f6aa45','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546915844,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(99,'1','admin','f185f46c8469788bebdcf8da810a7896','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546916549,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(100,'1','admin','l14acf9mstro80fe31eajqfo0r','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546934700,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(101,'1','admin','ov8sqlbf1j5147k16n9h9mi0f6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546943036,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(102,'1','admin','538737ee6638feecf51d555c6dee31da','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546943626,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(103,'1','admin','ueu18df0ra6s3t9sgjoucljasv','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546950359,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(104,'1','admin','pgtsmqe7o2dk2q4acqd9lh368j','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546951744,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(105,'1','admin','1ussebh6n2h9gs204n758t99th','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546952168,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(106,'1','admin','gb3qmjn1hqq8v5rseipvmb5ta0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546952791,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(107,'1','admin','df887hhr5dmvmsssq7nv7jhrbc','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546953116,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(108,'1','admin','d3tc8trr132nldqg5637h10b10','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546954859,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(109,'1','admin','cs0p03logv89o8lng42b9fh4uh','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1546955377,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(110,'1','admin','081eb19d5d98d3a60453d9376aab328d','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547004054,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(111,'1','admin','85c00i7cja94ljnqjq6806tfls','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547007535,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(112,'1','admin','d41f970ba18a19190d2d74f14da8d0fc','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547118056,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(113,'1','admin','52192c999346f3623109c10eb39ad8a4','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547123892,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(114,'1','admin','po9c01bfjo1tcgispi600li843','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547130004,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(115,'1','admin','1e6cc1d1f1e982d24526b1086662217e','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547179677,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(116,'1','admin','ca0552baa87381190847de107e33c551','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547182081,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(117,'1','admin','2a9891f9695c0134ad4fd1808edcbfc3','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547199406,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(118,'1','admin','0217d57a1dc3ea2e249e49422c78a165','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547201126,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(119,'1','admin','2obmlaqu003okrvooqbaugr40m','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547281216,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(120,'1','admin','toq0c52uit344v07quctj76fcc','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547281231,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(121,'1','admin','5ea4cebabdea5f9c54acde5c84a7c6b0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547450710,'::1','',0,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(122,'1','admin','34248b6fc9d8ca09b5ba3a055d9d912e','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547450725,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(123,'1','admin','ea2d2df8c385e94a80e148a33fbb0959','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547451010,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(124,'1','admin','af0ee6098f8de69bd8ab45f03bdc5d62','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547451173,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(125,'1','admin','a93607703c72175628da55c806762fe6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547451533,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(126,'1','admin','34e406f6c97849b621a3ef4780ada98c','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547451550,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(127,'1','admin','18ioru8t3lg5v3u9m3l04vtm0t','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547529823,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(128,'1','admin','9qdnk0mbufp2k99pmgf2ns474a','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547529865,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(129,'1','admin','14444251c4daa13d7ba06fa96a456dd4','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547625258,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(130,'1','admin','88phn9fgtdj00hb4eqh9d8m9o0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547632236,'127.0.0.1','',0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(131,'1','admin','rjqm0vjhhkc0kjig4bntb90mtt','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547632241,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(132,'1','admin','ahcue9bacbfdrgkrfum5ppo2a2','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547632274,'127.0.0.1','',0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(133,'1','admin','qfi13jodn6o0akq4ufoo8vijv7','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547632279,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(134,'1','admin','85k1kjdbfbmj6o1mp4h8t0t28b','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547634255,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(135,'1','admin','i47e07u11els6l9quu2dojp6j2','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547634263,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(136,'1','admin','f66eb9c8a2555cd01854a3adbea83dc8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547710408,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(137,'1','admin','8i6ih3gbidp6m7itavinv8oim2','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547710957,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(138,'1','admin','653ea27db9852c5cdd4cd37f073ac236','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547711095,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(139,'1','admin','rn8l1d7q0jvfrgojukc31kr9tt','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547723224,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(140,'1','admin','c58ea041d823a88f821beaca44f9cef5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547780795,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(141,'1','admin','bj99tmfdr6lqhc5pjigrdeg5ch','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547781958,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(142,'1','admin','ba016c497f86e8294b4d5e52a7f4c9aa','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547783958,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(143,'1','admin','8b715roapbaciec17lgvskh2t0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547784992,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(144,'1','admin','aed164ec5fdf7cc1c8326637d13fe6ee','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547809423,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(145,'1','admin','8q7g8h98t87biuju13u0ujsqu4','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547811514,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(146,'1','admin','tp3g0jqvkqaeccedbmjn58e7bl','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547815834,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(147,'1','admin','1u1mdtjhbpm9uaonhpnt2plv0l','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547818241,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(148,'1','admin','krg7qmojgtknf9h51bt7o4jkaf','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15',1547819159,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(149,'1','admin','c8lkfnurjakan3eq2ttckpcosn','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547819240,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(150,'1','admin','325f4d600ca64a0f38e1b5a10894510c','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547869341,'::1','',0,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(151,'1','admin','b8ce82185a2e6b5617bbe5704f3f7e87','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547869348,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(152,'1','admin','bbef8f00874c065db9f7105a073e09e1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547873597,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(153,'1','admin','36f19r0ndat3h4ncjbgmnie9pu','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547889151,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(154,'1','admin','oarifuj7h5at2d81iphpfoc020','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547889257,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(155,'1','admin','m5r1g48rk7pskv15jk5s7vd9re','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547889413,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(156,'1','admin','ifg1c616eaer9lvmmma75e4f2g','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547890322,'::1','',1,'7d70ceb86021ab9b59ddd11fdad0736e'),
	(157,'1','admin','9huv2lhlmms30t1at9rkjlhp94','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547959355,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(158,'1','admin','ouivd40n7v7rem0fe59l0khp20','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1547959757,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(159,'1','admin','f81f8dssurak0ov5u47k2ke12e','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1548076633,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(160,'1','admin','or6aks57nvdumudqu0m4t0v3tu','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1548302090,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(161,'1','admin','q8upgee8g1nqepv6ce8bjkgm25','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1548477413,'127.0.0.1','',0,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(162,'1','admin','q5r6q0pted4ai0kv5phlinish5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1548477419,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(163,'1','admin','t32l3gk1ntjun0o46v0l0v76b0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1548492248,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(164,'1','admin','ul6ffb0b2jnbfp31mhkfir0uv6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1548499918,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d'),
	(165,'1','admin','6iktbon2l6auqoiaj12tf7bsq0','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36',1548562184,'127.0.0.1','',1,'7a0cb45999b8e15ec0dbb6164bf2857d');

/*!40000 ALTER TABLE `vd_admin_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_admin_oplog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_admin_oplog`;

CREATE TABLE `vd_admin_oplog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '项id',
  `uid` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `session_id` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT 'SESSION ID',
  `msg` varchar(250) CHARACTER SET utf8 NOT NULL COMMENT '消息内容',
  `do_time` int(10) unsigned NOT NULL COMMENT '发生时间',
  `do_ip` varchar(15) CHARACTER SET utf8 NOT NULL COMMENT '客户端IP',
  `do_country` char(2) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '国家',
  `do_url` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '操作网址',
  PRIMARY KEY (`id`),
  KEY `user_name` (`username`),
  KEY `do_time` (`do_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作日志';

LOCK TABLES `vd_admin_oplog` WRITE;
/*!40000 ALTER TABLE `vd_admin_oplog` DISABLE KEYS */;

INSERT INTO `vd_admin_oplog` (`id`, `uid`, `username`, `session_id`, `msg`, `do_time`, `do_ip`, `do_country`, `do_url`)
VALUES
	(1,'1','admin','k8886vtapn5et2rbeang2r0icr','用户修改 1',1546683514,'127.0.0.1','-','?ct=admin&ac=edit&id=1&csrf_token_name=af8644435e0cf5b32300cd8c92aa3fe5&realname=管理员'),
	(2,'1','admin','l1kohvscvtmps4ljdnpq5as6r5','用户修改 1',1546866632,'127.0.0.1','-','?ct=admin&ac=edit&id=1&csrf_token_name=d22be61de728934d1b542a3034d88134&realname=管理员'),
	(3,'1','admin','c8lkfnurjakan3eq2ttckpcosn','用户修改 1',1547821097,'127.0.0.1','-','?ct=admin&ac=edit&id=1&csrf_token_name=2546b9f0ac874955948afb305609defc&realname=管理员');

/*!40000 ALTER TABLE `vd_admin_oplog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_admin_purview
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_admin_purview`;

CREATE TABLE `vd_admin_purview` (
  `uid` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '管理员ID',
  `purviews` text CHARACTER SET utf8 NOT NULL COMMENT '配置字符',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户权限表';

LOCK TABLES `vd_admin_purview` WRITE;
/*!40000 ALTER TABLE `vd_admin_purview` DISABLE KEYS */;

INSERT INTO `vd_admin_purview` (`uid`, `purviews`)
VALUES
	('eea83e86ad5c708bcd7b059ae6811184','content-index,category-del,member-index,member-add');

/*!40000 ALTER TABLE `vd_admin_purview` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_category`;

CREATE TABLE `vd_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类表',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `create_user` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建用户',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改用户',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

LOCK TABLES `vd_category` WRITE;
/*!40000 ALTER TABLE `vd_category` DISABLE KEYS */;

INSERT INTO `vd_category` (`id`, `name`, `sort`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'视频',2,'1',1511258578,'1',1544630153),
	(2,'音乐',3,'1',1511258584,'1',1544530492),
	(3,'小说',4,'1',1511258589,'1',1535016662);

/*!40000 ALTER TABLE `vd_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_config`;

CREATE TABLE `vd_config` (
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序id',
  `name` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '变量名',
  `value` text CHARACTER SET utf8 COMMENT '变量值',
  `title` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '说明标题',
  `group` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '1' COMMENT '分组',
  `type` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT 'string' COMMENT '变量类型',
  PRIMARY KEY (`name`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统配置变量表';

LOCK TABLES `vd_config` WRITE;
/*!40000 ALTER TABLE `vd_config` DISABLE KEYS */;

INSERT INTO `vd_config` (`sort`, `name`, `value`, `title`, `group`, `type`)
VALUES
	(4,'attachment_image','jpg|png|gif|bmp|ico','图片文件类型','attachment','string'),
	(5,'attachment_media','mp3|avi|mpg|mp4|3gp|flv|rm|rmvb|wmv|swf','多媒体文件类型','attachment','string'),
	(7,'attachment_size','16','最大附件大小(Mb)','attachment','number'),
	(6,'attachment_soft','zip|7z|rar|gz|bz2|tar|iso|exe|dll|doc|xls|ppt|docx|xlsx|pptx|wps|pdf|psd','其它文件件类型','attachment','string'),
	(6,'authorized_time','10','登录授权时间','config','number'),
	(2,'doc_auto_des','1','自动提取摘要','doc','bool'),
	(6,'doc_auto_des_len','150','自动摘要长度','doc','number'),
	(1,'doc_auto_keywords','1','自动获取关键字','doc','bool'),
	(3,'doc_auto_thumb','0','自动提取缩略图','doc','bool'),
	(7,'doc_down_remove','0','抓取远程资源','doc','bool'),
	(5,'doc_thumb_h','200','缩略图默认高度','doc','number'),
	(4,'doc_thumb_w','200','缩略图默认宽度','doc','number'),
	(1,'open_upload','1','是否允许上传文件','attachment','bool'),
	(4,'site_description','KaliPHP开发框架','当前站点摘要信息','config','text'),
	(3,'site_keyword','KaliPHP开发框架','当前站点关键字','config','string'),
	(1,'site_name','KaliPHP开发框架','当前站点名称','config','string'),
	(5,'site_tj','','当前站点统计代码','config','text'),
	(2,'site_upload_path','/uploads','附件上传目录','attachment','string'),
	(3,'site_upload_url','http://uploads.kaliphp.com','附件目录网址','attachment','string'),
	(2,'site_url','http://www.kaliphp.com','当前站点URL','config','string');

/*!40000 ALTER TABLE `vd_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_content`;

CREATE TABLE `vd_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容表',
  `catid` smallint(5) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `image` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '封面图',
  `images` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '套图',
  `content` text CHARACTER SET utf8 COMMENT '内容',
  `create_user` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建用户',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_user` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改用户',
  `update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='内容表';

LOCK TABLES `vd_content` WRITE;
/*!40000 ALTER TABLE `vd_content` DISABLE KEYS */;

INSERT INTO `vd_content` (`id`, `catid`, `name`, `image`, `images`, `content`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(3,1,'hhhh','','056/4fb042bf82fe8b629c036f91300d0895.png,113/ce792c996e86a36353ee347e085f12a6.png,048/42f8e292646b488c7cdeae77a407f0e2.png','&lt;p&gt;afasdfasdfdsaf&lt;/p&gt;','1',1542982199,'1',1544766397);

/*!40000 ALTER TABLE `vd_content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_coupons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_coupons`;

CREATE TABLE `vd_coupons` (
  `cpns_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '优惠券方案id',
  `cpns_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券号码',
  `cpns_prefix` varchar(50) DEFAULT '' COMMENT '优惠券前缀',
  `cpns_key` varchar(20) DEFAULT '' COMMENT '优惠券生成的key',
  `cpns_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券状态,1未使用，2已使用',
  `cpns_limit` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '卡券额度',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间0代表用不过期',
  `cpns_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '优惠券类型,1充值卡，2月卡，3年卡',
  `create_user` char(32) DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(10) unsigned DEFAULT '0',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT '0',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`cpns_id`),
  UNIQUE KEY `cpns_code` (`cpns_code`,`cpns_prefix`),
  KEY `cpns_status` (`cpns_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠卷数据表';



# Dump of table vd_coupons_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_coupons_log`;

CREATE TABLE `vd_coupons_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cpns_id` int(10) unsigned NOT NULL,
  `use_time` int(11) unsigned NOT NULL,
  `uid` char(32) NOT NULL DEFAULT '',
  `ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table vd_crond
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_crond`;

CREATE TABLE `vd_crond` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `sort` smallint(5) NOT NULL COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '任务名',
  `filename` varchar(248) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '执行脚本',
  `runtime_format` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '执行时间',
  `lasttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后执行时间',
  `runtime` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '运行时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：1=启动 0=停止',
  `uptime` int(10) DEFAULT NULL COMMENT '更新时间',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='计划任务表';



# Dump of table vd_down_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_down_log`;

CREATE TABLE `vd_down_log` (
  `down_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `down_file_id` int(11) unsigned NOT NULL COMMENT '下载文件id',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '下载IP地址',
  `year` smallint(4) unsigned NOT NULL COMMENT '年',
  `month` tinyint(2) unsigned NOT NULL COMMENT '月',
  `day` tinyint(2) unsigned NOT NULL COMMENT '日',
  `agent` varchar(500) NOT NULL DEFAULT '' COMMENT '浏览器agent信息',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_user` char(32) DEFAULT '0',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `update_user` char(32) DEFAULT '0',
  `delete_time` int(11) DEFAULT '0' COMMENT '删除时间',
  `delete_user` char(32) DEFAULT '0',
  PRIMARY KEY (`down_log_id`),
  KEY `delete_user` (`delete_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='下载记录';



# Dump of table vd_file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_file`;

CREATE TABLE `vd_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `title` varchar(500) NOT NULL COMMENT '下载标题',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型1压缩文件，2图片，3视频文件',
  `cate_id` int(10) unsigned NOT NULL COMMENT '分类id',
  `area` tinyint(3) unsigned NOT NULL COMMENT '地区',
  `inter` text COMMENT '简介',
  `zip_pass` varchar(100) DEFAULT NULL COMMENT '解压密码',
  `image_cover` varchar(500) DEFAULT '' COMMENT '封面图',
  `realname` blob COMMENT '原文件名称',
  `filepath` blob COMMENT '文件路径',
  `down_url` varchar(500) DEFAULT '' COMMENT '下载地址',
  `size` int(11) unsigned DEFAULT '0' COMMENT '文件大小，单位kb',
  `praise` int(10) unsigned NOT NULL COMMENT '点赞数',
  `browse_num` int(10) unsigned NOT NULL COMMENT '浏览量',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `delete_user` (`delete_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='下载的文件表';



# Dump of table vd_file_cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_file_cate`;

CREATE TABLE `vd_file_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `name` varchar(100) NOT NULL DEFAULT '',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否在导航菜单上显示,1不现实，2显示',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `delete_user` (`delete_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型表';



# Dump of table vd_file_labe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_file_labe`;

CREATE TABLE `vd_file_labe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `labe_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table vd_labe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_labe`;

CREATE TABLE `vd_labe` (
  `labe_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1显示，2隐藏',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_user` char(32) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `update_user` char(32) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `delete_user` char(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`labe_id`),
  KEY `delete_user` (`delete_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型表';



# Dump of table vd_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_member`;

CREATE TABLE `vd_member` (
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理id',
  `usename` blob,
  `nickname` blob,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1启用，2禁用',
  `password` varchar(200) NOT NULL DEFAULT '',
  `balance` varchar(100) DEFAULT '0' COMMENT '余额',
  `create_user` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_user` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

LOCK TABLES `vd_member` WRITE;
/*!40000 ALTER TABLE `vd_member` DISABLE KEYS */;

INSERT INTO `vd_member` (`member_id`, `usename`, `nickname`, `status`, `password`, `balance`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,X'AD2917D3E309183DDB6E0C408581CE02',NULL,1,'','0','1',1541754398,'1',1541763798),
	(2,X'649523384676A8FF38F679E4D55FD99F',NULL,1,'','0','1',1541754398,'1',1541763792),
	(3,X'9E9CE44CD9DF2B201F51947E03BCCBE2',NULL,1,'','0','1',1541754398,'1',1541763763);

/*!40000 ALTER TABLE `vd_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_member_limit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_member_limit`;

CREATE TABLE `vd_member_limit` (
  `member_id` int(11) unsigned NOT NULL,
  `down_times` int(11) unsigned DEFAULT '0' COMMENT '总计下载次数限制',
  `bowers_times` int(11) unsigned DEFAULT '0' COMMENT '总计浏览次数限制',
  `read_times` int(11) unsigned DEFAULT '0' COMMENT '总计阅读次数限制',
  `had_read_times` int(11) unsigned DEFAULT '0' COMMENT '已经阅读次数',
  `had_down_times` int(11) unsigned DEFAULT '0' COMMENT '已经下载次数',
  `had_bowers_times` int(11) unsigned DEFAULT '0' COMMENT '已经浏览次数',
  `infinite` tinyint(1) unsigned DEFAULT '1' COMMENT '是否不限次数1是的2不是的',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table vd_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_message`;

CREATE TABLE `vd_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `uid` char(32) DEFAULT NULL COMMENT '用户ID',
  `title` varchar(50) DEFAULT NULL COMMENT '消息标题',
  `text` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `url` varchar(200) DEFAULT NULL COMMENT '消息链接',
  `create_time` int(10) DEFAULT '0' COMMENT '消息时间',
  `read_time` int(10) DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table vd_oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_access_tokens`;

CREATE TABLE `vd_oauth_access_tokens` (
  `access_token` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `client_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_id` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `openid` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `vd_oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `vd_oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `vd_oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `openid`, `expires`, `scope`)
VALUES
	('4b74f0b5770533bde997c8eca52ab91e','testclient','test888','9d9e0f4a9998c4272b99cd381ec23461','2018-06-10 17:01:05',NULL);

/*!40000 ALTER TABLE `vd_oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_oauth_authorization_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_authorization_codes`;

CREATE TABLE `vd_oauth_authorization_codes` (
  `authorization_code` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `client_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_id` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `id_token` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table vd_oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_clients`;

CREATE TABLE `vd_oauth_clients` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '应用名称',
  `website` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '应用网站',
  `cate` tinyint(1) DEFAULT '1' COMMENT '应用分类 1、网页应用 2、客户端',
  `desc` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '应用介绍',
  `domain` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '域名绑定，绑定后的域名才可访问client_id',
  `ip` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '信任IP，以逗号分隔，信任IP才可访问OpenAPI',
  `client_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'App Key，只生成一次',
  `client_secret` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'App Secret，后台可以重置',
  `redirect_uri` varchar(2000) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '授权回调页',
  `cancel_uri` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '取消授权回调页',
  `grant_types` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '授权方式',
  `scope` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '授权作用域',
  `user_id` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户ID',
  `create_user` int(11) DEFAULT NULL COMMENT '添加用户',
  `create_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_user` int(11) DEFAULT NULL COMMENT '修改用户',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `vd_oauth_clients` WRITE;
/*!40000 ALTER TABLE `vd_oauth_clients` DISABLE KEYS */;

INSERT INTO `vd_oauth_clients` (`id`, `name`, `website`, `cate`, `desc`, `domain`, `ip`, `client_id`, `client_secret`, `redirect_uri`, `cancel_uri`, `grant_types`, `scope`, `user_id`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'测试应用','http://www1.phpcall.org',1,'这是一个测试应用','www1.phpcall.org','127.0.0.1,192.168.0.46','testclient','testpass','http://www1.phpcall.org/oauth2_sdk/callback.php',NULL,'authorization_code,refresh_token,password,client_credentials','basic','user',1,1526151992,1,1528379432),
	(7,'fesfes',NULL,1,'fes','fes','fs','4396ff23eb80bbe11fabd578458b27c8','0ef64bd272146903d624a852158b9be0','http://fes','http://fes','authorization_code','basic','user',1,1526151992,1,1526152004);

/*!40000 ALTER TABLE `vd_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_oauth_jwt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_jwt`;

CREATE TABLE `vd_oauth_jwt` (
  `client_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `subject` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `public_key` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table vd_oauth_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_permissions`;

CREATE TABLE `vd_oauth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限名称',
  `info` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `vd_oauth_permissions` WRITE;
/*!40000 ALTER TABLE `vd_oauth_permissions` DISABLE KEYS */;

INSERT INTO `vd_oauth_permissions` (`id`, `name`, `info`)
VALUES
	(1,'edit',NULL),
	(2,'admin',NULL);

/*!40000 ALTER TABLE `vd_oauth_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_refresh_tokens`;

CREATE TABLE `vd_oauth_refresh_tokens` (
  `refresh_token` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `client_id` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `user_id` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  `openid` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table vd_oauth_scopes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_scopes`;

CREATE TABLE `vd_oauth_scopes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '授权名称',
  `scope` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '授权',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  `desc` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '授权说明',
  `create_user` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scope` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `vd_oauth_scopes` WRITE;
/*!40000 ALTER TABLE `vd_oauth_scopes` DISABLE KEYS */;

INSERT INTO `vd_oauth_scopes` (`id`, `name`, `scope`, `is_default`, `desc`, `create_user`, `create_time`, `update_user`, `update_time`)
VALUES
	(1,'基础信息','basic',1,'登陆即可获取：包含userid、userinfo_basic，用户ID、姓名、头像、性别',1,1526146038,1,1528271472),
	(2,'用户信息','userinfo',0,'姓名、头像、性别、省市、Email等',1,1526146038,1,1526146038),
	(3,'用户权限','user_permissions',0,NULL,1,1526146038,1,1526146038),
	(4,'查看下级信息','child_userinfo',0,NULL,1,1526146038,1,1526146038),
	(5,'查看下级详细信息','child_userinfo_all',0,NULL,1,1526146038,1,1526146038),
	(7,'通过关键词搜索用户','search_users_keywords',0,NULL,1,1526146038,1,1526146038),
	(8,'搜索用户时的联想搜索建议','search_users',0,NULL,1,1526146038,1,1526146038),
	(10,'更改头像','update_avatar',0,NULL,1,1526146038,1,1526146038),
	(11,'更改用户资料','update_userinfo',0,NULL,1,1526146038,1,1526146038);

/*!40000 ALTER TABLE `vd_oauth_scopes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_oauth_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_oauth_users`;

CREATE TABLE `vd_oauth_users` (
  `userid` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户ID',
  `username` varchar(80) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `realname` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `email` varchar(80) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `email_verified` tinyint(1) DEFAULT '0' COMMENT '是否邮箱验证',
  `scope` varchar(2000) CHARACTER SET utf8 DEFAULT 'base' COMMENT '授权范围',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `vd_oauth_users` WRITE;
/*!40000 ALTER TABLE `vd_oauth_users` DISABLE KEYS */;

INSERT INTO `vd_oauth_users` (`userid`, `username`, `password`, `realname`, `avatar`, `email`, `email_verified`, `scope`)
VALUES
	('1a1dc91c907325c69271ddf0c944bc72','user','1a1dc91c907325c69271ddf0c944bc72',NULL,'http://www.dahouduan.com/wp-content/uploads/2017/11/avatar.jpg',NULL,NULL,'basic');

/*!40000 ALTER TABLE `vd_oauth_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vd_video
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vd_video`;

CREATE TABLE `vd_video` (
  `vido_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '标题',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '视频时长',
  `video_src` varchar(1000) DEFAULT NULL COMMENT '视频地址',
  `video_file` varchar(500) DEFAULT NULL COMMENT '视频文件地址',
  PRIMARY KEY (`vido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
