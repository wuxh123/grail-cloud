-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.13 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 grail_user.app_user 结构
CREATE TABLE IF NOT EXISTS `app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `headImgUrl` varchar(1024) DEFAULT NULL COMMENT '头像url',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1有效,0无效）',
  `type` varchar(16) NOT NULL COMMENT '类型（暂未用）',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- 正在导出表  grail_user.app_user 的数据：~2 rows (大约)
DELETE FROM `app_user`;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` (`id`, `username`, `password`, `nickname`, `headImgUrl`, `phone`, `sex`, `enabled`, `type`, `createTime`, `updateTime`) VALUES
	(1, 'admin', '$2a$10$3uOoX1ps14CxuotogUoDreW8zXJOZB9XeGdrC/xDV36hhaE8Rn9HO', '测试1', '', '', 1, 1, 'APP', '2018-01-17 16:57:01', '2018-01-17 16:57:01'),
	(2, 'superadmin', '$2a$10$.gLkG0j2kM0stWoOvPBvqu0H9uSD0HUlpErI.PTKyZQkSUZIV2wFq', '超级管理员', NULL, NULL, 1, 1, 'BACKEND', '2018-01-19 20:30:11', '2018-01-19 20:30:11');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;

-- 导出  表 grail_user.sys_permission 结构
CREATE TABLE IF NOT EXISTS `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `permission` varchar(32) NOT NULL COMMENT '权限标识',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission` (`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='权限标识表';

-- 正在导出表  grail_user.sys_permission 的数据：~35 rows (大约)
DELETE FROM `sys_permission`;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` (`id`, `permission`, `name`, `createTime`, `updateTime`) VALUES
	(1, 'back:permission:save', '保存权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(2, 'back:permission:update', '修改权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(3, 'back:permission:delete', '删除权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(4, 'back:permission:query', '查询权限标识', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(5, 'back:role:save', '添加角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(6, 'back:role:update', '修改角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(7, 'back:role:delete', '删除角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(8, 'back:role:permission:set', '给角色分配权限', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(9, 'back:user:query', '用户查询', '2018-01-18 17:12:00', '2018-01-18 17:12:05'),
	(10, 'back:user:update', '修改用户', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(11, 'back:user:role:set', '给用户分配角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(12, 'back:user:password', '用户重置密码', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(13, 'back:menu:save', '添加菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(14, 'back:menu:update', '修改菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(15, 'back:menu:delete', '删除菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(16, 'back:menu:query', '查询菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(17, 'back:menu:set2role', '给角色分配菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(18, 'back:role:query', '查询角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(19, 'user:role:byuid', '获取用户的角色', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(20, 'role:permission:byroleid', '获取角色的权限', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(21, 'menu:byroleid', '获取角色的菜单', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(22, 'ip:black:query', '查询黑名单ip', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(23, 'ip:black:save', '添加黑名单ip', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(24, 'ip:black:delete', '删除黑名单ip', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(25, 'log:query', '日志查询', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(26, 'file:query', '文件查询', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(27, 'file:del', '文件删除', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(28, 'mail:save', '保存邮件', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(29, 'mail:update', '修改邮件', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(30, 'mail:query', '邮件查询', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(31, 'sms:query', '短信发送记录查询', '2018-01-18 17:06:39', '2018-01-18 17:06:42'),
	(32, 'client:save', '保存client', '2018-06-28 17:06:39', '2018-06-28 17:06:39'),
	(33, 'client:update', '修改client', '2018-06-28 17:06:39', '2018-06-28 17:06:39'),
	(34, 'client:query', '查询client', '2018-06-28 17:06:39', '2018-06-28 17:06:39'),
	(35, 'client:del', '删除client', '2018-06-28 17:06:39', '2018-06-28 17:06:39');
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;

-- 导出  表 grail_user.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `code` varchar(32) NOT NULL COMMENT '角色code',
  `name` varchar(50) NOT NULL COMMENT '角色名',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

-- 正在导出表  grail_user.sys_role 的数据：~1 rows (大约)
DELETE FROM `sys_role`;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `code`, `name`, `createTime`, `updateTime`) VALUES
	(1, 'SUPER_ADMIN', '超级管理员', '2018-01-19 20:32:16', '2018-01-19 20:32:18');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 grail_user.sys_role_permission 结构
CREATE TABLE IF NOT EXISTS `sys_role_permission` (
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `permissionId` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`roleId`,`permissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色权限关系表';

-- 正在导出表  grail_user.sys_role_permission 的数据：~35 rows (大约)
DELETE FROM `sys_role_permission`;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` (`roleId`, `permissionId`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 8),
	(1, 9),
	(1, 10),
	(1, 11),
	(1, 12),
	(1, 13),
	(1, 14),
	(1, 15),
	(1, 16),
	(1, 17),
	(1, 18),
	(1, 19),
	(1, 20),
	(1, 21),
	(1, 22),
	(1, 23),
	(1, 24),
	(1, 25),
	(1, 26),
	(1, 27),
	(1, 28),
	(1, 29),
	(1, 30),
	(1, 31),
	(1, 32),
	(1, 33),
	(1, 34),
	(1, 35);
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;

-- 导出  表 grail_user.sys_role_user 结构
CREATE TABLE IF NOT EXISTS `sys_role_user` (
  `userId` int(11) NOT NULL COMMENT '用户id',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色用户关系表';

-- 正在导出表  grail_user.sys_role_user 的数据：~2 rows (大约)
DELETE FROM `sys_role_user`;
/*!40000 ALTER TABLE `sys_role_user` DISABLE KEYS */;
INSERT INTO `sys_role_user` (`userId`, `roleId`) VALUES
	(1, 1),
	(2, 1);
/*!40000 ALTER TABLE `sys_role_user` ENABLE KEYS */;

-- 导出  表 grail_user.t_wechat 结构
CREATE TABLE IF NOT EXISTS `t_wechat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `openid` varchar(128) NOT NULL COMMENT '微信openid',
  `unionid` varchar(128) DEFAULT NULL COMMENT '微信unionid',
  `userId` int(11) DEFAULT NULL COMMENT '绑定用户的id',
  `app` varchar(32) NOT NULL COMMENT '公众号标识',
  `nickname` varchar(64) NOT NULL COMMENT '微信昵称',
  `sex` varchar(16) DEFAULT NULL COMMENT '微信返回的性别',
  `province` varchar(64) DEFAULT NULL COMMENT '微信返回的省',
  `city` varchar(64) DEFAULT NULL COMMENT '微信返回的城市',
  `country` varchar(64) DEFAULT NULL COMMENT '微信返回的国家',
  `headimgurl` varchar(1024) DEFAULT NULL COMMENT '微信头像',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`),
  KEY `userId` (`userId`),
  KEY `unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='微信信息表';

-- 正在导出表  grail_user.t_wechat 的数据：~0 rows (大约)
DELETE FROM `t_wechat`;
/*!40000 ALTER TABLE `t_wechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_wechat` ENABLE KEYS */;

-- 导出  表 grail_user.user_credentials 结构
CREATE TABLE IF NOT EXISTS `user_credentials` (
  `username` varchar(50) NOT NULL COMMENT '用户名或手机号等',
  `type` varchar(16) NOT NULL COMMENT '账号类型（用户名、手机号）',
  `userId` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`username`),
  KEY `userId` (`userId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户凭证表';

-- 正在导出表  grail_user.user_credentials 的数据：~2 rows (大约)
DELETE FROM `user_credentials`;
/*!40000 ALTER TABLE `user_credentials` DISABLE KEYS */;
INSERT INTO `user_credentials` (`username`, `type`, `userId`) VALUES
	('admin', 'USERNAME', 1),
	('superadmin', 'USERNAME', 2);
/*!40000 ALTER TABLE `user_credentials` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
