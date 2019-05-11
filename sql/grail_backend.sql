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

-- 导出  表 grail_backend.black_ip 结构
CREATE TABLE IF NOT EXISTS `black_ip` (
  `ip` varchar(32) NOT NULL COMMENT '黑名单ip',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='ip黑名单表';

-- 正在导出表  grail_backend.black_ip 的数据：~0 rows (大约)
DELETE FROM `black_ip`;
/*!40000 ALTER TABLE `black_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `black_ip` ENABLE KEYS */;

-- 导出  表 grail_backend.menu 结构
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `parentId` int(11) NOT NULL COMMENT '父菜单id',
  `name` varchar(64) NOT NULL COMMENT '菜单名',
  `url` varchar(1024) DEFAULT NULL COMMENT '菜单url',
  `css` varchar(32) DEFAULT NULL COMMENT '菜单样式',
  `sort` int(11) NOT NULL COMMENT '排序',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';

-- 正在导出表  grail_backend.menu 的数据：~15 rows (大约)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `parentId`, `name`, `url`, `css`, `sort`, `createTime`, `updateTime`) VALUES
	(1, 0, '系统设置', '', 'fa-gears', 1, '2018-01-23 10:20:30', '2018-01-23 10:20:31'),
	(2, 1, '菜单', 'pages/menu/menuList.html', 'fa-windows', 2, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(3, 1, '角色', 'pages/role/roleList.html', 'fa-cubes', 3, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(4, 1, '权限', 'pages/permission/permissionList.html', 'fa-align-justify', 4, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(5, 0, '用户管理', '', 'fa-user', 4, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(6, 5, '用户查询', 'pages/user/userList.html', 'fa-user', 4, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(7, 0, '文件查询', 'pages/file/fileList.html', 'fa-folder-open', 5, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(8, 0, '邮件管理', 'pages/mail/mailList.html', 'fa-envelope', 6, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(9, 0, '注册中心', 'http://local.register.com:8761', 'fa-institution', 7, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(10, 0, '监控中心', 'http://local.monitor.com:9001', 'fa-spinner', 8, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(11, 0, 'swagger文档', 'pages/swagger/api-doc.html', 'fa-file-pdf-o', 8, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(12, 0, '黑名单ip', 'pages/blackIP/blackIPList.html', 'fa-child', 9, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(13, 0, '日志查询', 'pages/log/logList.html', 'fa-reorder', 10, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(14, 0, '短信历史查询', 'pages/sms/smsList.html', 'fa-reorder', 11, '2018-01-23 14:04:40', '2018-01-23 14:04:43'),
	(15, 1, 'client管理', 'pages/client/clientList.html', 'fa-tachometer', 13, '2018-01-23 14:04:40', '2018-01-23 14:04:43');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- 导出  表 grail_backend.role_menu 结构
CREATE TABLE IF NOT EXISTS `role_menu` (
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `menuId` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`roleId`,`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色菜单关系表';

-- 正在导出表  grail_backend.role_menu 的数据：~15 rows (大约)
DELETE FROM `role_menu`;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` (`roleId`, `menuId`) VALUES
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
	(1, 15);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;

-- 导出  表 grail_backend.t_mail 结构
CREATE TABLE IF NOT EXISTS `t_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userId` int(11) NOT NULL COMMENT '发送人id',
  `username` varchar(50) NOT NULL COMMENT '发送人用户名',
  `toEmail` varchar(128) NOT NULL COMMENT '收件人邮件地址',
  `subject` varchar(255) NOT NULL COMMENT '标题',
  `content` longtext NOT NULL COMMENT '正文',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0草稿，1成功，2失败',
  `sendTime` datetime DEFAULT NULL COMMENT '发送时间',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `updateTime` (`updateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='邮件发送记录表';

-- 正在导出表  grail_backend.t_mail 的数据：~0 rows (大约)
DELETE FROM `t_mail`;
/*!40000 ALTER TABLE `t_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_mail` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
