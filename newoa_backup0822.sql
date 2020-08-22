/*
 Navicat Premium Data Transfer

 Source Server         : localhost_laragon
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : newoa

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 22/08/2020 18:11:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, '后台管理', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 5, '员工管理', 'fa-user', 'auth/users', NULL, NULL, '2020-07-20 10:45:50');
INSERT INTO `admin_menu` VALUES (4, 2, 6, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, '2020-07-20 10:45:50');
INSERT INTO `admin_menu` VALUES (5, 2, 7, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-07-20 10:45:50');
INSERT INTO `admin_menu` VALUES (6, 2, 3, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 4, '操作记录', 'fa-history', 'auth/logs', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 15, '客户管理', 'fa-users', NULL, NULL, '2020-07-20 10:27:13', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (9, 8, 16, '客户列表', 'fa-bars', '/customers', NULL, '2020-07-20 10:27:37', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (10, 8, 17, '客户需求管理', 'fa-bars', '/customer-demands', NULL, '2020-07-20 10:28:18', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (11, 8, 18, '客户联系人管理', 'fa-bars', 'customer-contacts', NULL, '2020-07-20 10:29:01', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (12, 0, 8, '综合管理', 'fa-bars', NULL, NULL, '2020-07-20 10:30:26', '2020-07-20 10:45:50');
INSERT INTO `admin_menu` VALUES (13, 12, 11, '渠道管理', 'fa-bars', 'channels', NULL, '2020-07-20 10:42:31', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (14, 12, 12, '名片模板管理', 'fa-bars', 'cart-templates', NULL, '2020-07-20 10:42:55', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (15, 12, 13, '参数管理', 'fa-bars', 'params', NULL, '2020-07-20 10:43:13', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (16, 12, 14, '产品参数管理', 'fa-bars', 'product-params', NULL, '2020-07-20 10:43:30', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (17, 12, 10, '部门管理', 'fa-bars', 'departments', NULL, '2020-07-20 10:43:58', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (18, 8, 19, '联系人名片管理', 'fa-bars', 'customer-contact-cards', NULL, '2020-07-20 10:44:14', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (19, 0, 20, '订单管理', 'fa-bars', NULL, NULL, '2020-07-20 10:44:31', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (20, 19, 21, '订单列表', 'fa-bars', 'orders', NULL, '2020-07-20 10:44:53', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (21, 19, 22, '订单日志', 'fa-bars', 'orders-logs', NULL, '2020-07-20 10:45:34', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (22, 12, 9, '产品管理', 'fa-bars', 'products', NULL, '2020-07-20 11:40:32', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (23, 0, 23, '财务管理', 'fa-bars', NULL, NULL, '2020-08-13 14:40:50', '2020-08-13 20:34:32');
INSERT INTO `admin_menu` VALUES (24, 23, 24, '订单续费管理', 'fa-bars', '/orders-renew-log', NULL, '2020-08-13 20:34:00', '2020-08-13 20:39:07');
INSERT INTO `admin_menu` VALUES (25, 23, 0, '收款方式管理', 'fa-bars', '/pay-type', NULL, '2020-08-14 13:24:51', '2020-08-14 13:24:51');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2305 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-07-16 14:28:18', '2020-07-16 14:28:18');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 14:28:23', '2020-07-16 14:28:23');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 14:28:28', '2020-07-16 14:28:28');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 14:28:30', '2020-07-16 14:28:30');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 14:44:37', '2020-07-16 14:44:37');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 14:45:06', '2020-07-16 14:45:06');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 15:09:13', '2020-07-16 15:09:13');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-07-16 15:10:35', '2020-07-16 15:10:35');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-07-16 15:10:51', '2020-07-16 15:10:51');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-07-16 15:11:37', '2020-07-16 15:11:37');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-07-16 15:12:08', '2020-07-16 15:12:08');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-07-16 15:12:23', '2020-07-16 15:12:23');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-07-16 16:16:46', '2020-07-16 16:16:46');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 16:55:07', '2020-07-16 16:55:07');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-16 16:56:12', '2020-07-16 16:56:12');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 16:56:16', '2020-07-16 16:56:16');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"phone\":\"15700064975\",\"username\":\"admin\",\"password\":\"$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q\\/NCEEIQIU6\",\"password_confirmation\":\"$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q\\/NCEEIQIU6\",\"entry_time\":\"2020\\u5e7407\\u670816\\u65e5\",\"roles\":[\"1\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"fWTU9diB8sSFPp5mmhGZ8MZsSrqFnDSyzEzIjCQK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-07-16 16:57:07', '2020-07-16 16:57:07');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-16 16:57:08', '2020-07-16 16:57:08');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 16:57:12', '2020-07-16 16:57:12');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 16:57:16', '2020-07-16 16:57:16');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 16:57:19', '2020-07-16 16:57:19');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-16 17:32:32', '2020-07-16 17:32:32');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-16 17:48:20', '2020-07-16 17:48:20');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:03:48', '2020-07-16 18:03:48');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:03:54', '2020-07-16 18:03:54');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:04:00', '2020-07-16 18:04:00');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:04:58', '2020-07-16 18:04:58');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '[]', '2020-07-16 18:05:27', '2020-07-16 18:05:27');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '[]', '2020-07-16 18:06:19', '2020-07-16 18:06:19');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '[]', '2020-07-16 18:08:11', '2020-07-16 18:08:11');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:08:14', '2020-07-16 18:08:14');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:23:34', '2020-07-16 18:23:34');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:23:42', '2020-07-16 18:23:42');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-16 18:25:49', '2020-07-16 18:25:49');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-16 18:26:09', '2020-07-16 18:26:09');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-16 18:30:21', '2020-07-16 18:30:21');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"name\":null,\"entry_time\":null,\"birthday\":\"11\\u6708\",\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:30:29', '2020-07-16 18:30:29');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:30:33', '2020-07-16 18:30:33');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:30:35', '2020-07-16 18:30:35');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"phone\":\"15700064975\",\"username\":\"admin\",\"password\":\"$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q\\/NCEEIQIU6\",\"password_confirmation\":\"$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q\\/NCEEIQIU6\",\"entry_time\":\"2020\\u5e7407\\u670816\\u65e5\",\"roles\":[\"1\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":\"1995\\u5e7411\\u670805\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"fWTU9diB8sSFPp5mmhGZ8MZsSrqFnDSyzEzIjCQK\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-07-16 18:31:10', '2020-07-16 18:31:10');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-16 18:31:11', '2020-07-16 18:31:11');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"name\":null,\"entry_time\":null,\"birthday\":\"11\\u6708\",\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:31:19', '2020-07-16 18:31:19');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"entry_time\":null,\"birthday\":\"11\\u6708\"}', '2020-07-16 18:33:42', '2020-07-16 18:33:42');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"name\":null,\"entry_time\":null,\"birthday\":\"11\\u6708\"}', '2020-07-16 18:34:56', '2020-07-16 18:34:56');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"birthday\":\"11\\u6708\",\"_export_\":\"page:1\"}', '2020-07-16 18:35:13', '2020-07-16 18:35:13');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"name\":null,\"entry_time\":null,\"birthday\":\"11\\u6708\"}', '2020-07-16 18:36:26', '2020-07-16 18:36:26');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-16 18:36:29', '2020-07-16 18:36:29');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-07-20 10:26:47', '2020-07-20 10:26:47');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:26:51', '2020-07-20 10:26:51');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:27:12', '2020-07-20 10:27:12');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:27:13', '2020-07-20 10:27:13');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa-bars\",\"uri\":\"\\/customers\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:27:37', '2020-07-20 10:27:37');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:27:38', '2020-07-20 10:27:38');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5ba2\\u6237\\u9700\\u6c42\",\"icon\":\"fa-bars\",\"uri\":\"\\/customer-demands\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:28:18', '2020-07-20 10:28:18');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:28:18', '2020-07-20 10:28:18');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5ba2\\u6237\\u8054\\u7cfb\\u4eba\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"customer-contacts\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:29:01', '2020-07-20 10:29:01');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:29:02', '2020-07-20 10:29:02');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:29:10', '2020-07-20 10:29:10');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5ba2\\u6237\\u9700\\u6c42\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/customer-demands\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-07-20 10:29:16', '2020-07-20 10:29:16');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:29:17', '2020-07-20 10:29:17');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7efc\\u5408\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:30:26', '2020-07-20 10:30:26');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:30:27', '2020-07-20 10:30:27');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u6e20\\u9053\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"channels\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:42:31', '2020-07-20 10:42:31');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:42:32', '2020-07-20 10:42:32');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u540d\\u7247\\u6a21\\u677f\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"cart-templates\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:42:55', '2020-07-20 10:42:55');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:42:56', '2020-07-20 10:42:56');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u53c2\\u6570\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"params\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:43:13', '2020-07-20 10:43:13');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:43:14', '2020-07-20 10:43:14');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4ea7\\u54c1\\u53c2\\u6570\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"product-params\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:43:30', '2020-07-20 10:43:30');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:43:31', '2020-07-20 10:43:31');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u90e8\\u95e8\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"departments\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:43:58', '2020-07-20 10:43:58');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:43:59', '2020-07-20 10:43:59');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8054\\u7cfb\\u4eba\\u540d\\u7247\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"customer-contact-cards\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:44:13', '2020-07-20 10:44:13');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:44:14', '2020-07-20 10:44:14');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:44:31', '2020-07-20 10:44:31');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:44:32', '2020-07-20 10:44:32');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u8ba2\\u5355\\u5217\\u8868\",\"icon\":\"fa-bars\",\"uri\":\"orders\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:44:53', '2020-07-20 10:44:53');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:44:54', '2020-07-20 10:44:54');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u8ba2\\u5355\\u65e5\\u5fd7\",\"icon\":\"fa-bars\",\"uri\":\"orders-logs\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 10:45:34', '2020-07-20 10:45:34');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:45:35', '2020-07-20 10:45:35');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":6},{\\\"id\\\":7},{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5}]},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":16},{\\\"id\\\":17}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":18}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":21}]}]\"}', '2020-07-20 10:45:50', '2020-07-20 10:45:50');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:45:51', '2020-07-20 10:45:51');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":6},{\\\"id\\\":7},{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5}]},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":17},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":18}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":21}]}]\"}', '2020-07-20 10:46:49', '2020-07-20 10:46:49');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:46:50', '2020-07-20 10:46:50');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 10:46:52', '2020-07-20 10:46:52');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 10:48:11', '2020-07-20 10:48:11');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:16', '2020-07-20 10:48:16');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:18', '2020-07-20 10:48:18');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:19', '2020-07-20 10:48:19');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:21', '2020-07-20 10:48:21');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:25', '2020-07-20 10:48:25');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:27', '2020-07-20 10:48:27');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:28', '2020-07-20 10:48:28');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:30', '2020-07-20 10:48:30');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:48:30', '2020-07-20 10:48:30');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 10:49:57', '2020-07-20 10:49:57');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:19:37', '2020-07-20 11:19:37');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:19:40', '2020-07-20 11:19:40');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:19:47', '2020-07-20 11:19:47');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 11:26:44', '2020-07-20 11:26:44');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 11:27:26', '2020-07-20 11:27:26');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:27:32', '2020-07-20 11:27:32');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:27:39', '2020-07-20 11:27:39');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:27:42', '2020-07-20 11:27:42');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:29:21', '2020-07-20 11:29:21');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:29:24', '2020-07-20 11:29:24');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:29:28', '2020-07-20 11:29:28');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:29:45', '2020-07-20 11:29:45');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:33:50', '2020-07-20 11:33:50');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:34:21', '2020-07-20 11:34:21');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/params/create', 'GET', '127.0.0.1', '[]', '2020-07-20 11:36:49', '2020-07-20 11:36:49');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/params/create', 'GET', '127.0.0.1', '[]', '2020-07-20 11:37:58', '2020-07-20 11:37:58');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/params/create', 'GET', '127.0.0.1', '[]', '2020-07-20 11:38:33', '2020-07-20 11:38:33');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/params', 'POST', '127.0.0.1', '{\"title\":\"\\u670d\\u52a1\\u5668IP\",\"alias\":\"website_ip\",\"type\":\"0\",\"type_params\":null,\"sort\":\"1\",\"is_required\":\"1\",\"remark\":\"\\u4f8b\\u5982\\uff1a192.168.1.1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 11:39:31', '2020-07-20 11:39:31');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/params', 'GET', '127.0.0.1', '[]', '2020-07-20 11:39:32', '2020-07-20 11:39:32');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/params/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:39:50', '2020-07-20 11:39:50');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:39:55', '2020-07-20 11:39:55');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:40:12', '2020-07-20 11:40:12');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 11:40:32', '2020-07-20 11:40:32');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 11:40:33', '2020-07-20 11:40:33');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/auth/menu/22/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 11:40:38', '2020-07-20 11:40:38');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/auth/menu/22', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-07-20 11:40:42', '2020-07-20 11:40:42');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 11:40:43', '2020-07-20 11:40:43');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-20 11:40:46', '2020-07-20 11:40:46');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:13:50', '2020-07-20 13:13:50');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:13:54', '2020-07-20 13:13:54');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:13:56', '2020-07-20 13:13:56');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:14:03', '2020-07-20 13:14:03');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:15:01', '2020-07-20 13:15:01');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:15:03', '2020-07-20 13:15:03');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:15:05', '2020-07-20 13:15:05');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:15:07', '2020-07-20 13:15:07');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:15:09', '2020-07-20 13:15:09');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:15:13', '2020-07-20 13:15:13');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '[]', '2020-07-20 13:17:10', '2020-07-20 13:17:10');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:17:26', '2020-07-20 13:17:26');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:17:56', '2020-07-20 13:17:56');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:17:58', '2020-07-20 13:17:58');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:54:57', '2020-07-20 13:54:57');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:54:59', '2020-07-20 13:54:59');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 13:55:01', '2020-07-20 13:55:01');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:06:17', '2020-07-20 14:06:17');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2020-07-20 14:07:37', '2020-07-20 14:07:37');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:07:43', '2020-07-20 14:07:43');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/products', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"ITO\\u8fd0\\u7ef4\\u670d\\u52a1\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/products\"}', '2020-07-20 14:08:51', '2020-07-20 14:08:51');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2020-07-20 14:08:51', '2020-07-20 14:08:51');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:08:56', '2020-07-20 14:08:56');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/products', 'POST', '127.0.0.1', '{\"PID\":\"1\",\"title\":\"\\u7f51\\u7ad9\\u6280\\u672f\\u5916\\u5305\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/products\"}', '2020-07-20 14:09:15', '2020-07-20 14:09:15');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2020-07-20 14:09:16', '2020-07-20 14:09:16');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:09:18', '2020-07-20 14:09:18');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/products', 'POST', '127.0.0.1', '{\"PID\":\"1\",\"title\":\"\\u7f51\\u7ad9\\u4f18\\u5316\",\"sort\":\"2\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/products\"}', '2020-07-20 14:09:29', '2020-07-20 14:09:29');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2020-07-20 14:09:29', '2020-07-20 14:09:29');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:12:01', '2020-07-20 14:12:01');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:12:04', '2020-07-20 14:12:04');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:12:06', '2020-07-20 14:12:06');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:12:12', '2020-07-20 14:12:12');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:15:47', '2020-07-20 14:15:47');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:15:49', '2020-07-20 14:15:49');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:15:51', '2020-07-20 14:15:51');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:15:59', '2020-07-20 14:15:59');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:21:38', '2020-07-20 14:21:38');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:22:29', '2020-07-20 14:22:29');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:22:32', '2020-07-20 14:22:32');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u8fd0\\u7ef4\\u90e8\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-07-20 14:24:43', '2020-07-20 14:24:43');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 14:24:44', '2020-07-20 14:24:44');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:24:46', '2020-07-20 14:24:46');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u5546\\u52a1\\u90e8\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-07-20 14:24:55', '2020-07-20 14:24:55');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 14:24:56', '2020-07-20 14:24:56');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:24:58', '2020-07-20 14:24:58');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u9500\\u552e\\u90e8\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-07-20 14:25:07', '2020-07-20 14:25:07');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 14:25:08', '2020-07-20 14:25:08');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:25:12', '2020-07-20 14:25:12');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"3\",\"title\":\"\\u9500\\u552e\\u4e00\\u90e8\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-07-20 14:25:24', '2020-07-20 14:25:24');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 14:25:25', '2020-07-20 14:25:25');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:25:30', '2020-07-20 14:25:30');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"3\",\"title\":\"\\u9500\\u552e\\u4e8c\\u90e8\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-07-20 14:25:37', '2020-07-20 14:25:37');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 14:25:38', '2020-07-20 14:25:38');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:25:40', '2020-07-20 14:25:40');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"3\",\"title\":\"\\u9500\\u552e\\u4e09\\u90e8\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-07-20 14:25:48', '2020-07-20 14:25:48');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-07-20 14:25:48', '2020-07-20 14:25:48');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:25:54', '2020-07-20 14:25:54');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:25:56', '2020-07-20 14:25:56');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:25:57', '2020-07-20 14:25:57');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:26:41', '2020-07-20 14:26:41');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:27:29', '2020-07-20 14:27:29');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:27:31', '2020-07-20 14:27:31');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u72ec\\u7acb\\u5f00\\u53d1\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:27:48', '2020-07-20 14:27:48');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:27:48', '2020-07-20 14:27:48');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:27:52', '2020-07-20 14:27:52');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u5e7f\\u544a\\u63a8\\u5e7f\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:27:59', '2020-07-20 14:27:59');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:00', '2020-07-20 14:28:00');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:02', '2020-07-20 14:28:02');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u5ba2\\u6237\\u4ecb\\u7ecd\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:28:08', '2020-07-20 14:28:08');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:08', '2020-07-20 14:28:08');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:10', '2020-07-20 14:28:10');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u4fc3\\u9500\\u6d3b\\u52a8\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:28:16', '2020-07-20 14:28:16');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:16', '2020-07-20 14:28:16');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:18', '2020-07-20 14:28:18');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u516c\\u5f00\\u62db\\u6807\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:28:24', '2020-07-20 14:28:24');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:25', '2020-07-20 14:28:25');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:27', '2020-07-20 14:28:27');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u7535\\u8bdd\\u6765\\u8bbf\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:28:31', '2020-07-20 14:28:31');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:32', '2020-07-20 14:28:32');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:34', '2020-07-20 14:28:34');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u4e92\\u8054\\u7f51\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:28:39', '2020-07-20 14:28:39');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:39', '2020-07-20 14:28:39');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:41', '2020-07-20 14:28:41');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u8001\\u5ba2\\u6237\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:28:46', '2020-07-20 14:28:46');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:46', '2020-07-20 14:28:46');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:48', '2020-07-20 14:28:48');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u5408\\u4f5c\\u4f19\\u4f34\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:28:53', '2020-07-20 14:28:53');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:28:54', '2020-07-20 14:28:54');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/channels/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:28:56', '2020-07-20 14:28:56');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/channels', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u516c\\u53f8\\u5ba2\\u6237\",\"sort\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/channels\"}', '2020-07-20 14:29:00', '2020-07-20 14:29:00');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 14:29:01', '2020-07-20 14:29:01');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:29:04', '2020-07-20 14:29:04');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:29:05', '2020-07-20 14:29:05');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:29:07', '2020-07-20 14:29:07');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:29:11', '2020-07-20 14:29:11');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:31:31', '2020-07-20 14:31:31');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2020-07-20 14:34:27', '2020-07-20 14:34:27');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 14:36:48', '2020-07-20 14:36:48');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-20 14:36:49', '2020-07-20 14:36:49');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:37:00', '2020-07-20 14:37:00');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:37:04', '2020-07-20 14:37:04');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"commerce\",\"name\":\"\\u5546\\u52a1\\u90e8\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-07-20 14:40:53', '2020-07-20 14:40:53');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-07-20 14:40:54', '2020-07-20 14:40:54');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:41:08', '2020-07-20 14:41:08');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 14:41:13', '2020-07-20 14:41:13');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"$2y$10$7Fn6UC6ZySU4Bmo26tCqs.xpcSJZwaZ.R4MSfYGySOTjEGgI.pwZ6\",\"password_confirmation\":\"$2y$10$7Fn6UC6ZySU4Bmo26tCqs.xpcSJZwaZ.R4MSfYGySOTjEGgI.pwZ6\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-07-20 14:41:22', '2020-07-20 14:41:22');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-20 14:41:22', '2020-07-20 14:41:22');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:07:17', '2020-07-20 15:07:17');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:07:30', '2020-07-20 15:07:30');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:08:35', '2020-07-20 15:08:35');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"entry_time\":null,\"birthday\":null,\"dept_id\":\"1\"}', '2020-07-20 15:08:39', '2020-07-20 15:08:39');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"entry_time\":null,\"birthday\":null,\"dept_id\":\"2\"}', '2020-07-20 15:08:48', '2020-07-20 15:08:48');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:41:03', '2020-07-20 15:41:03');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:41:04', '2020-07-20 15:41:04');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:41:06', '2020-07-20 15:41:06');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:41:10', '2020-07-20 15:41:10');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:41:11', '2020-07-20 15:41:11');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:41:17', '2020-07-20 15:41:17');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 15:49:37', '2020-07-20 15:49:37');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 15:56:09', '2020-07-20 15:56:09');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 15:56:24', '2020-07-20 15:56:24');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 15:56:35', '2020-07-20 15:56:35');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:56:39', '2020-07-20 15:56:39');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 15:56:40', '2020-07-20 15:56:40');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:56:53', '2020-07-20 15:56:53');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:57:08', '2020-07-20 15:57:08');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 15:57:10', '2020-07-20 15:57:10');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '[]', '2020-07-20 15:58:24', '2020-07-20 15:58:24');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"2\",\"params_id\":[\"1\",null],\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 16:15:49', '2020-07-20 16:15:49');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 16:15:50', '2020-07-20 16:15:50');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 16:16:32', '2020-07-20 16:16:32');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:16:45', '2020-07-20 16:16:45');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:16:47', '2020-07-20 16:16:47');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/params', 'POST', '127.0.0.1', '{\"title\":\"CPU\",\"alias\":\"CPU\",\"type\":\"0\",\"type_params\":null,\"sort\":\"1\",\"is_required\":\"1\",\"remark\":\"\\u5fc5\\u586b*   \\uff1a \\u4f8b\\u5982\\uff1a4\\u6838\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/params\"}', '2020-07-20 16:17:52', '2020-07-20 16:17:52');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/params', 'GET', '127.0.0.1', '[]', '2020-07-20 16:17:53', '2020-07-20 16:17:53');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:17:56', '2020-07-20 16:17:56');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:17:59', '2020-07-20 16:17:59');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"2\",\"params_id\":[\"1\",\"2\",null],\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-07-20 16:18:05', '2020-07-20 16:18:05');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 16:18:06', '2020-07-20 16:18:06');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:18:09', '2020-07-20 16:18:09');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"3\",\"params_id\":[\"1\",\"2\",null],\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-07-20 16:18:15', '2020-07-20 16:18:15');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 16:18:16', '2020-07-20 16:18:16');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 16:20:36', '2020-07-20 16:20:36');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"product_id\":\"2\",\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:20:42', '2020-07-20 16:20:42');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"product_id\":\"3\"}', '2020-07-20 16:20:45', '2020-07-20 16:20:45');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"product_id\":\"3\"}', '2020-07-20 16:21:52', '2020-07-20 16:21:52');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/product-params/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 16:21:59', '2020-07-20 16:21:59');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"product_id\":\"3\",\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:22:00', '2020-07-20 16:22:00');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:23:02', '2020-07-20 16:23:02');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:23:03', '2020-07-20 16:23:03');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:23:04', '2020-07-20 16:23:04');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:23:09', '2020-07-20 16:23:09');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 16:30:27', '2020-07-20 16:30:27');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:30:47', '2020-07-20 16:30:47');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:30:49', '2020-07-20 16:30:49');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:46:57', '2020-07-20 16:46:57');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:48:10', '2020-07-20 16:48:10');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:48:13', '2020-07-20 16:48:13');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 16:48:14', '2020-07-20 16:48:14');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 16:48:34', '2020-07-20 16:48:34');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:48:37', '2020-07-20 16:48:37');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 16:48:38', '2020-07-20 16:48:38');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:49:20', '2020-07-20 16:49:20');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 16:49:21', '2020-07-20 16:49:21');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:49:47', '2020-07-20 16:49:47');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 16:49:48', '2020-07-20 16:49:48');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 16:50:00', '2020-07-20 16:50:00');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 16:50:03', '2020-07-20 16:50:03');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:00:47', '2020-07-20 17:00:47');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:00:51', '2020-07-20 17:00:51');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:12:47', '2020-07-20 17:12:47');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:12:50', '2020-07-20 17:12:50');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2020-07-20 17:13:09', '2020-07-20 17:13:09');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2020-07-20 17:13:35', '2020-07-20 17:13:35');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2020-07-20 17:14:36', '2020-07-20 17:14:36');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2020-07-20 17:16:28', '2020-07-20 17:16:28');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/customers', 'POST', '127.0.0.1', '{\"title\":\"\\u6d4b\\u8bd5\",\"type\":\"1\",\"address\":\"\\u4e2d\\u5fc3\\u573a\\u9986\",\"is_agent\":\"0\",\"channel_id\":\"2\",\"industry_id\":\"1\",\"remark\":null,\"owner_user_id\":\"1\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 17:16:54', '2020-07-20 17:16:54');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 17:16:55', '2020-07-20 17:16:55');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:17:01', '2020-07-20 17:17:01');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-20 17:18:44', '2020-07-20 17:18:44');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-20 17:19:14', '2020-07-20 17:19:14');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-20 17:21:29', '2020-07-20 17:21:29');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-20 17:22:36', '2020-07-20 17:22:36');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:22:40', '2020-07-20 17:22:40');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:22:43', '2020-07-20 17:22:43');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:23:03', '2020-07-20 17:23:03');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:23:05', '2020-07-20 17:23:05');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:09', '2020-07-20 17:24:09');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:21', '2020-07-20 17:24:21');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:23', '2020-07-20 17:24:23');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:24', '2020-07-20 17:24:24');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:26', '2020-07-20 17:24:26');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:28', '2020-07-20 17:24:28');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:32', '2020-07-20 17:24:32');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:34', '2020-07-20 17:24:34');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:38', '2020-07-20 17:24:38');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:24:40', '2020-07-20 17:24:40');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:25:19', '2020-07-20 17:25:19');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:25:25', '2020-07-20 17:25:25');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:25:29', '2020-07-20 17:25:29');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:25:36', '2020-07-20 17:25:36');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:25:40', '2020-07-20 17:25:40');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:25:49', '2020-07-20 17:25:49');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:25:53', '2020-07-20 17:25:53');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:09', '2020-07-20 17:26:09');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:11', '2020-07-20 17:26:11');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:15', '2020-07-20 17:26:15');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:18', '2020-07-20 17:26:18');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:20', '2020-07-20 17:26:20');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:23', '2020-07-20 17:26:23');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:29', '2020-07-20 17:26:29');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:36', '2020-07-20 17:26:36');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:26:44', '2020-07-20 17:26:44');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:27:31', '2020-07-20 17:27:31');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:28:19', '2020-07-20 17:28:19');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-20 17:30:16', '2020-07-20 17:30:16');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-07-20 17:31:10', '2020-07-20 17:31:10');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:31:14', '2020-07-20 17:31:14');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-07-20 17:45:09', '2020-07-20 17:45:09');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:45:13', '2020-07-20 17:45:13');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:55:57', '2020-07-20 17:55:57');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 17:58:14', '2020-07-20 17:58:14');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"title\":null,\"owner_user_id\":\"2\",\"last_user_id\":null,\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:58:24', '2020-07-20 17:58:24');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":\"\\u6d4b\\u8bd5\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-07-20 17:58:31', '2020-07-20 17:58:31');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":\"\\u6d4b\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-07-20 17:58:36', '2020-07-20 17:58:36');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":\"\\u6d4b\",\"owner_user_id\":null,\"last_user_id\":\"1\"}', '2020-07-20 17:58:38', '2020-07-20 17:58:38');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"title\":\"\\u6d4b\",\"owner_user_id\":\"2\",\"last_user_id\":\"1\"}', '2020-07-20 17:58:41', '2020-07-20 17:58:41');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 17:58:45', '2020-07-20 17:58:45');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:01:21', '2020-07-20 18:01:21');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:01:26', '2020-07-20 18:01:26');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"sales\",\"name\":\"\\u9500\\u552e\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-07-20 18:01:45', '2020-07-20 18:01:45');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-07-20 18:01:46', '2020-07-20 18:01:46');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:02:57', '2020-07-20 18:02:57');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:03:01', '2020-07-20 18:03:01');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:03:07', '2020-07-20 18:03:07');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:03:12', '2020-07-20 18:03:12');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:03:14', '2020-07-20 18:03:14');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-20 18:07:01', '2020-07-20 18:07:01');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:10:17', '2020-07-20 18:10:17');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:14:21', '2020-07-20 18:14:21');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-07-20 18:15:24', '2020-07-20 18:15:24');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:15:28', '2020-07-20 18:15:28');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:15:31', '2020-07-20 18:15:31');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:24:11', '2020-07-20 18:24:11');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:24:16', '2020-07-20 18:24:16');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:24:18', '2020-07-20 18:24:18');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:24:21', '2020-07-20 18:24:21');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/customers/1', 'PUT', '127.0.0.1', '{\"title\":\"\\u6d4b\\u8bd5\",\"type\":\"1\",\"address\":\"\\u4e2d\\u5fc3\\u573a\\u9986\",\"is_agent\":\"0\",\"channel_id\":\"2\",\"industry_id\":\"1\",\"remark\":null,\"owner_user_id\":\"1\",\"last_user_id\":\"2\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customers\"}', '2020-07-20 18:24:26', '2020-07-20 18:24:26');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-20 18:24:27', '2020-07-20 18:24:27');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:41:23', '2020-07-20 18:41:23');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:41:37', '2020-07-20 18:41:37');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:42:35', '2020-07-20 18:42:35');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:42:46', '2020-07-20 18:42:46');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"\\u6d4b\\u8bd5\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 18:42:57', '2020-07-20 18:42:57');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-07-20 18:42:57', '2020-07-20 18:42:57');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:01', '2020-07-20 18:43:01');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:05', '2020-07-20 18:43:05');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:09', '2020-07-20 18:43:09');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:16', '2020-07-20 18:43:16');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:20', '2020-07-20 18:43:20');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:44', '2020-07-20 18:43:44');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:47', '2020-07-20 18:43:47');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:50', '2020-07-20 18:43:50');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:43:52', '2020-07-20 18:43:52');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:44:34', '2020-07-20 18:44:34');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-20 18:48:00', '2020-07-20 18:48:00');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 18:48:11', '2020-07-20 18:48:11');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:48:28', '2020-07-20 18:48:28');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:48:44', '2020-07-20 18:48:44');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:49:26', '2020-07-20 18:49:26');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 18:49:30', '2020-07-20 18:49:30');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:49:56', '2020-07-20 18:49:56');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 18:50:01', '2020-07-20 18:50:01');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:54:29', '2020-07-20 18:54:29');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 18:55:16', '2020-07-20 18:55:16');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 18:55:29', '2020-07-20 18:55:29');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:02:36', '2020-07-20 19:02:36');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:02:53', '2020-07-20 19:02:53');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:02:57', '2020-07-20 19:02:57');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:03:23', '2020-07-20 19:03:23');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:03:38', '2020-07-20 19:03:38');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:03:42', '2020-07-20 19:03:42');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:04:52', '2020-07-20 19:04:52');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:04:57', '2020-07-20 19:04:57');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:05:13', '2020-07-20 19:05:13');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:05:17', '2020-07-20 19:05:17');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:05:52', '2020-07-20 19:05:52');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:05:56', '2020-07-20 19:05:56');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:07:24', '2020-07-20 19:07:24');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:07:51', '2020-07-20 19:07:51');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:08:53', '2020-07-20 19:08:53');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:08:59', '2020-07-20 19:08:59');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:09:10', '2020-07-20 19:09:10');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:09:16', '2020-07-20 19:09:16');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:09:56', '2020-07-20 19:09:56');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:10:01', '2020-07-20 19:10:01');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:11:21', '2020-07-20 19:11:21');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:11:47', '2020-07-20 19:11:47');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:11:52', '2020-07-20 19:11:52');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:12:11', '2020-07-20 19:12:11');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:12:15', '2020-07-20 19:12:15');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:13:18', '2020-07-20 19:13:18');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:13:23', '2020-07-20 19:13:23');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:15:53', '2020-07-20 19:15:53');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:16:04', '2020-07-20 19:16:04');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:16:08', '2020-07-20 19:16:08');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:18:04', '2020-07-20 19:18:04');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:18:08', '2020-07-20 19:18:08');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":null}', '2020-07-20 19:18:33', '2020-07-20 19:18:33');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:18:35', '2020-07-20 19:18:35');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:20:48', '2020-07-20 19:20:48');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:21:05', '2020-07-20 19:21:05');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:21:18', '2020-07-20 19:21:18');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:21:27', '2020-07-20 19:21:27');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:22:21', '2020-07-20 19:22:21');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:22:29', '2020-07-20 19:22:29');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:26:54', '2020-07-20 19:26:54');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:37:03', '2020-07-20 19:37:03');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-20 19:37:06', '2020-07-20 19:37:06');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"start_time\":\"2020-07-20 19:37:03\",\"end_time\":\"2020-07-20 19:37:03\",\"admin_user_id\":\"1\",\"price\":null,\"receivable\":null,\"receipts\":null,\"sales_remark\":null,\"it_remark\":null,\"status\":\"0\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 19:37:16', '2020-07-20 19:37:16');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-07-20 19:37:16', '2020-07-20 19:37:16');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"start_time\":\"2020-07-20 19:37:03\",\"end_time\":\"2020-07-20 19:37:03\",\"admin_user_id\":\"1\",\"price\":null,\"receivable\":null,\"receipts\":null,\"sales_remark\":null,\"it_remark\":null,\"status\":\"0\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 19:37:47', '2020-07-20 19:37:47');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-20 19:37:48', '2020-07-20 19:37:48');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:38:07', '2020-07-20 19:38:07');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:45:34', '2020-07-20 19:45:34');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:45:38', '2020-07-20 19:45:38');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-20 19:46:54', '2020-07-20 19:46:54');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-20 19:47:14', '2020-07-20 19:47:14');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-20 19:47:30', '2020-07-20 19:47:30');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-20 19:49:48', '2020-07-20 19:49:48');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-20 19:51:03', '2020-07-20 19:51:03');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:51:07', '2020-07-20 19:51:07');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:16', '2020-07-20 19:56:16');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/product-params/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 19:56:23', '2020-07-20 19:56:23');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:24', '2020-07-20 19:56:24');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:26', '2020-07-20 19:56:26');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:31', '2020-07-20 19:56:31');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/product-params/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 19:56:35', '2020-07-20 19:56:35');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:35', '2020-07-20 19:56:35');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:38', '2020-07-20 19:56:38');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:43', '2020-07-20 19:56:43');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:56:45', '2020-07-20 19:56:45');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/params', 'POST', '127.0.0.1', '{\"title\":\"\\u670d\\u52a1\\u7c7b\\u522b\",\"alias\":\"serveice_type\",\"type\":\"2\",\"type_params\":\"\\u6807\\u51c6\\u7248,\\u52a0\\u5f3a\\u7248,\\u63a8\\u5e7f\\u7248,\\u5b9a\\u5236\\u7248\",\"sort\":\"1\",\"is_required\":\"1\",\"remark\":\"\\u9009\\u62e9\\u670d\\u52a1\\u7c7b\\u522b\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/params\"}', '2020-07-20 19:57:47', '2020-07-20 19:57:47');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/params', 'GET', '127.0.0.1', '[]', '2020-07-20 19:57:48', '2020-07-20 19:57:48');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:57:51', '2020-07-20 19:57:51');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/params', 'POST', '127.0.0.1', '{\"title\":\"\\u7f51\\u7ad9\\u57df\\u540d\",\"alias\":\"domain\",\"type\":\"0\",\"type_params\":null,\"sort\":\"1\",\"is_required\":\"1\",\"remark\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/params\"}', '2020-07-20 19:58:23', '2020-07-20 19:58:23');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/params', 'GET', '127.0.0.1', '[]', '2020-07-20 19:58:24', '2020-07-20 19:58:24');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:58:26', '2020-07-20 19:58:26');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/params', 'POST', '127.0.0.1', '{\"title\":\"\\u662f\\u5426\\u534f\\u52a9\\u6ce8\\u518c\\u516c\\u4f17\\u53f7\",\"alias\":\"is_sing_up\",\"type\":\"2\",\"type_params\":\"\\u662f,\\u5426\",\"sort\":\"1\",\"is_required\":\"1\",\"remark\":null,\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/params\"}', '2020-07-20 19:59:17', '2020-07-20 19:59:17');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/params', 'GET', '127.0.0.1', '[]', '2020-07-20 19:59:18', '2020-07-20 19:59:18');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:59:32', '2020-07-20 19:59:32');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 19:59:40', '2020-07-20 19:59:40');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"1\",\"3\",\"4\",\"5\",null],\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-07-20 20:01:40', '2020-07-20 20:01:40');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 20:01:41', '2020-07-20 20:01:41');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/product-params/4,5,6,7', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\"}', '2020-07-20 20:01:52', '2020-07-20 20:01:52');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:01:53', '2020-07-20 20:01:53');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:01:55', '2020-07-20 20:01:55');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"2\",\"params_id\":[\"3\",\"4\",\"5\",null],\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-07-20 20:02:06', '2020-07-20 20:02:06');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-07-20 20:02:07', '2020-07-20 20:02:07');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"product_id\":\"3\",\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:02:12', '2020-07-20 20:02:12');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"product_id\":\"1\"}', '2020-07-20 20:02:15', '2020-07-20 20:02:15');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"product_id\":\"2\"}', '2020-07-20 20:02:18', '2020-07-20 20:02:18');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:02:32', '2020-07-20 20:02:32');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:02:40', '2020-07-20 20:02:40');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:03:35', '2020-07-20 20:03:35');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:03:51', '2020-07-20 20:03:51');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:04:06', '2020-07-20 20:04:06');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:05:53', '2020-07-20 20:05:53');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:05:57', '2020-07-20 20:05:57');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-20 20:06:40', '2020-07-20 20:06:40');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:10:01', '2020-07-20 20:10:01');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:10:06', '2020-07-20 20:10:06');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-07-20 19:37:03\",\"end_time\":\"2020-07-20 19:37:03\",\"admin_user_id\":\"1\",\"price\":null,\"receivable\":null,\"receipts\":null,\"sales_remark\":null,\"it_remark\":null,\"status\":\"0\",\"_token\":\"xMk5ZqcUOlIMjhXqx2XOgFLStnDXmPYaXiV2iDtD\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-20 20:10:24', '2020-07-20 20:10:24');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-20 20:10:25', '2020-07-20 20:10:25');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-20 20:10:33', '2020-07-20 20:10:33');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 08:44:47', '2020-07-21 08:44:47');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:18:39', '2020-07-21 10:18:39');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:18:44', '2020-07-21 10:18:44');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:18:47', '2020-07-21 10:18:47');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 10:20:10', '2020-07-21 10:20:10');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 10:20:25', '2020-07-21 10:20:25');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 10:22:19', '2020-07-21 10:22:19');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:26:21', '2020-07-21 10:26:21');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:34:36', '2020-07-21 10:34:36');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:34:39', '2020-07-21 10:34:39');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:34:52', '2020-07-21 10:34:52');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:34:55', '2020-07-21 10:34:55');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2020-07-21 10:35:02', '2020-07-21 10:35:02');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:36:08', '2020-07-21 10:36:08');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:36:12', '2020-07-21 10:36:12');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:36:15', '2020-07-21 10:36:15');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 10:36:32', '2020-07-21 10:36:32');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 10:36:49', '2020-07-21 10:36:49');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:52:00', '2020-07-21 10:52:00');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:52:22', '2020-07-21 10:52:22');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 10:52:26', '2020-07-21 10:52:26');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:01:49', '2020-07-21 11:01:49');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:01:53', '2020-07-21 11:01:53');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:01:55', '2020-07-21 11:01:55');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:02:00', '2020-07-21 11:02:00');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:16:46', '2020-07-21 11:16:46');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:16:49', '2020-07-21 11:16:49');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:16:53', '2020-07-21 11:16:53');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:17:01', '2020-07-21 11:17:01');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:17:50', '2020-07-21 11:17:50');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:18:54', '2020-07-21 11:18:54');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:20:48', '2020-07-21 11:20:48');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:23:01', '2020-07-21 11:23:01');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:23:37', '2020-07-21 11:23:37');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:23:46', '2020-07-21 11:23:46');
INSERT INTO `admin_operation_log` VALUES (535, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:23:49', '2020-07-21 11:23:49');
INSERT INTO `admin_operation_log` VALUES (536, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:23:54', '2020-07-21 11:23:54');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:23:55', '2020-07-21 11:23:55');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:25:24', '2020-07-21 11:25:24');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:25:27', '2020-07-21 11:25:27');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:25:32', '2020-07-21 11:25:32');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:26:22', '2020-07-21 11:26:22');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:26:41', '2020-07-21 11:26:41');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:28:07', '2020-07-21 11:28:07');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:28:33', '2020-07-21 11:28:33');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:28:44', '2020-07-21 11:28:44');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:29:00', '2020-07-21 11:29:00');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:29:21', '2020-07-21 11:29:21');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 11:29:49', '2020-07-21 11:29:49');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:30:59', '2020-07-21 11:30:59');
INSERT INTO `admin_operation_log` VALUES (550, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:31:11', '2020-07-21 11:31:11');
INSERT INTO `admin_operation_log` VALUES (551, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-07-20 19:37:03\",\"end_time\":\"2020-07-20 19:37:03\",\"admin_user_id\":\"1\",\"price\":null,\"receivable\":null,\"receipts\":null,\"sales_remark\":null,\"it_remark\":null,\"status\":\"0\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-21 11:31:29', '2020-07-21 11:31:29');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 11:31:30', '2020-07-21 11:31:30');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:36:50', '2020-07-21 11:36:50');
INSERT INTO `admin_operation_log` VALUES (554, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:36:54', '2020-07-21 11:36:54');
INSERT INTO `admin_operation_log` VALUES (555, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"serveice_type\":\"\\u6807\\u51c6\\u7248\",\"domain\":\"\\u6d4b\\u8bd5\",\"is_sing_up\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\"}', '2020-07-21 11:37:07', '2020-07-21 11:37:07');
INSERT INTO `admin_operation_log` VALUES (556, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:43:56', '2020-07-21 11:43:56');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 11:44:01', '2020-07-21 11:44:01');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/orders-details', 'GET', '127.0.0.1', '[]', '2020-07-21 11:44:30', '2020-07-21 11:44:30');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:44:35', '2020-07-21 11:44:35');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:44:38', '2020-07-21 11:44:38');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:44:41', '2020-07-21 11:44:41');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\"}', '2020-07-21 11:44:46', '2020-07-21 11:44:46');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:46:14', '2020-07-21 11:46:14');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 11:46:18', '2020-07-21 11:46:18');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:46:44', '2020-07-21 11:46:44');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 11:46:48', '2020-07-21 11:46:48');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:47:45', '2020-07-21 11:47:45');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 11:47:48', '2020-07-21 11:47:48');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:49:07', '2020-07-21 11:49:07');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 11:49:44', '2020-07-21 11:49:44');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 11:52:01', '2020-07-21 11:52:01');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 11:52:04', '2020-07-21 11:52:04');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:08:16', '2020-07-21 12:08:16');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 12:08:20', '2020-07-21 12:08:20');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:08:45', '2020-07-21 12:08:45');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 12:08:49', '2020-07-21 12:08:49');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:09:02', '2020-07-21 12:09:02');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 12:09:06', '2020-07-21 12:09:06');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:09:38', '2020-07-21 12:09:38');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 12:09:42', '2020-07-21 12:09:42');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 12:09:43', '2020-07-21 12:09:43');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-details\\/create?orders_id=1\"}', '2020-07-21 12:10:16', '2020-07-21 12:10:16');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-21 12:10:17', '2020-07-21 12:10:17');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:10:20', '2020-07-21 12:10:20');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:10:23', '2020-07-21 12:10:23');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:11:01', '2020-07-21 12:11:01');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"1\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u662f\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\"}', '2020-07-21 12:11:05', '2020-07-21 12:11:05');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 12:11:06', '2020-07-21 12:11:06');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:11:09', '2020-07-21 12:11:09');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/orders-details/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:11:43', '2020-07-21 12:11:43');
INSERT INTO `admin_operation_log` VALUES (591, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 12:11:45', '2020-07-21 12:11:45');
INSERT INTO `admin_operation_log` VALUES (592, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 12:13:07', '2020-07-21 12:13:07');
INSERT INTO `admin_operation_log` VALUES (593, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 12:16:15', '2020-07-21 12:16:15');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 12:16:51', '2020-07-21 12:16:51');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 12:17:42', '2020-07-21 12:17:42');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 12:18:18', '2020-07-21 12:18:18');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 12:20:00', '2020-07-21 12:20:00');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 13:32:35', '2020-07-21 13:32:35');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 13:39:11', '2020-07-21 13:39:11');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 13:47:04', '2020-07-21 13:47:04');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 13:47:43', '2020-07-21 13:47:43');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 13:48:29', '2020-07-21 13:48:29');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 13:48:58', '2020-07-21 13:48:58');
INSERT INTO `admin_operation_log` VALUES (604, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 13:50:22', '2020-07-21 13:50:22');
INSERT INTO `admin_operation_log` VALUES (605, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:13:57', '2020-07-21 14:13:57');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-21 14:14:40', '2020-07-21 14:14:40');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:17:02', '2020-07-21 14:17:02');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:17:11', '2020-07-21 14:17:11');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:17:38', '2020-07-21 14:17:38');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:18:26', '2020-07-21 14:18:26');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:19:33', '2020-07-21 14:19:33');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:20:01', '2020-07-21 14:20:01');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:20:32', '2020-07-21 14:20:32');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:21:29', '2020-07-21 14:21:29');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:21:47', '2020-07-21 14:21:47');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:22:03', '2020-07-21 14:22:03');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:26:01', '2020-07-21 14:26:01');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:26:05', '2020-07-21 14:26:05');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-07-21 14:26:22', '2020-07-21 14:26:22');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-07-21 14:26:23', '2020-07-21 14:26:23');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:26:28', '2020-07-21 14:26:28');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"check\",\"name\":\"\\u8d28\\u68c0\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-07-21 14:26:59', '2020-07-21 14:26:59');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-07-21 14:27:00', '2020-07-21 14:27:00');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:37:45', '2020-07-21 14:37:45');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_title\":null,\"product_id\":\"3\",\"start_time\":{\"start\":null,\"end\":null},\"end_time\":{\"start\":null,\"end\":null},\"admin_user_id\":null}', '2020-07-21 14:37:53', '2020-07-21 14:37:53');
INSERT INTO `admin_operation_log` VALUES (626, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_title\":null,\"product_id\":\"2\",\"start_time\":{\"start\":null,\"end\":null},\"end_time\":{\"start\":null,\"end\":null},\"admin_user_id\":null}', '2020-07-21 14:37:56', '2020-07-21 14:37:56');
INSERT INTO `admin_operation_log` VALUES (627, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_title\":\"cas\",\"product_id\":null,\"start_time\":{\"start\":null,\"end\":null},\"end_time\":{\"start\":null,\"end\":null},\"admin_user_id\":null}', '2020-07-21 14:38:04', '2020-07-21 14:38:04');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_title\":\"\\u6d4b\\u8bd5\",\"product_id\":null,\"start_time\":{\"start\":null,\"end\":null},\"end_time\":{\"start\":null,\"end\":null},\"admin_user_id\":null}', '2020-07-21 14:38:08', '2020-07-21 14:38:08');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:38:13', '2020-07-21 14:38:13');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:39:37', '2020-07-21 14:39:37');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:10', '2020-07-21 14:59:10');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:13', '2020-07-21 14:59:13');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:21', '2020-07-21 14:59:21');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:23', '2020-07-21 14:59:23');
INSERT INTO `admin_operation_log` VALUES (635, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:25', '2020-07-21 14:59:25');
INSERT INTO `admin_operation_log` VALUES (636, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:27', '2020-07-21 14:59:27');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:31', '2020-07-21 14:59:31');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:33', '2020-07-21 14:59:33');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-21 14:59:36', '2020-07-21 14:59:36');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"egPKeJMwbdKVSsSx7A7GYzdhShwJu9bLVz08Djfz\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-21 14:59:45', '2020-07-21 14:59:45');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 14:59:52', '2020-07-21 14:59:52');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 17:04:03', '2020-07-21 17:04:03');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"dYbJnOWQ8MJ3ovmsfgzXy8tYBmsN2B7dtgz2Eyah\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-21 17:04:15', '2020-07-21 17:04:15');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"dYbJnOWQ8MJ3ovmsfgzXy8tYBmsN2B7dtgz2Eyah\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-21 17:30:44', '2020-07-21 17:30:44');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 17:30:47', '2020-07-21 17:30:47');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"dYbJnOWQ8MJ3ovmsfgzXy8tYBmsN2B7dtgz2Eyah\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-21 17:30:53', '2020-07-21 17:30:53');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 17:31:10', '2020-07-21 17:31:10');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-21 17:49:50', '2020-07-21 17:49:50');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"dYbJnOWQ8MJ3ovmsfgzXy8tYBmsN2B7dtgz2Eyah\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-21 17:49:57', '2020-07-21 17:49:57');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-22 08:45:50', '2020-07-22 08:45:50');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:46:39', '2020-07-22 08:46:39');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:46:47', '2020-07-22 08:46:47');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:48:08', '2020-07-22 08:48:08');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-22 08:48:13', '2020-07-22 08:48:13');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:48:18', '2020-07-22 08:48:18');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-22 08:48:29', '2020-07-22 08:48:29');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 08:48:43', '2020-07-22 08:48:43');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 08:49:49', '2020-07-22 08:49:49');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:49:54', '2020-07-22 08:49:54');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:50:21', '2020-07-22 08:50:21');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:50:49', '2020-07-22 08:50:49');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.check_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:52:46', '2020-07-22 08:52:46');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.commerce_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:53:06', '2020-07-22 08:53:06');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 08:53:28', '2020-07-22 08:53:28');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-22 08:53:54', '2020-07-22 08:53:54');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-22 08:54:49', '2020-07-22 08:54:49');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 08:54:59', '2020-07-22 08:54:59');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"Zyhp7p3ri3CvyH0ormNOEy43vSVfAKcEmS55GnJg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-22 08:55:05', '2020-07-22 08:55:05');
INSERT INTO `admin_operation_log` VALUES (669, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-22 08:55:11', '2020-07-22 08:55:11');
INSERT INTO `admin_operation_log` VALUES (670, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 08:55:19', '2020-07-22 08:55:19');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-22 08:57:02', '2020-07-22 08:57:02');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 08:57:09', '2020-07-22 08:57:09');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 08:57:25', '2020-07-22 08:57:25');
INSERT INTO `admin_operation_log` VALUES (674, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 09:00:51', '2020-07-22 09:00:51');
INSERT INTO `admin_operation_log` VALUES (675, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 09:00:54', '2020-07-22 09:00:54');
INSERT INTO `admin_operation_log` VALUES (676, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 09:00:56', '2020-07-22 09:00:56');
INSERT INTO `admin_operation_log` VALUES (677, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 09:29:32', '2020-07-22 09:29:32');
INSERT INTO `admin_operation_log` VALUES (678, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:25:57', '2020-07-22 10:25:57');
INSERT INTO `admin_operation_log` VALUES (679, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:26:08', '2020-07-22 10:26:08');
INSERT INTO `admin_operation_log` VALUES (680, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:26:23', '2020-07-22 10:26:23');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:26:26', '2020-07-22 10:26:26');
INSERT INTO `admin_operation_log` VALUES (682, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:26:48', '2020-07-22 10:26:48');
INSERT INTO `admin_operation_log` VALUES (683, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:26:56', '2020-07-22 10:26:56');
INSERT INTO `admin_operation_log` VALUES (684, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:19', '2020-07-22 10:27:19');
INSERT INTO `admin_operation_log` VALUES (685, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:27', '2020-07-22 10:27:27');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:31', '2020-07-22 10:27:31');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:32', '2020-07-22 10:27:32');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:51', '2020-07-22 10:27:51');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:52', '2020-07-22 10:27:52');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:56', '2020-07-22 10:27:56');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:27:59', '2020-07-22 10:27:59');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-22 10:28:07', '2020-07-22 10:28:07');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-22 10:28:21', '2020-07-22 10:28:21');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-22 10:29:03', '2020-07-22 10:29:03');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:29:15', '2020-07-22 10:29:15');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:35:47', '2020-07-22 10:35:47');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:36:02', '2020-07-22 10:36:02');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:36:05', '2020-07-22 10:36:05');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:36:08', '2020-07-22 10:36:08');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:36:15', '2020-07-22 10:36:15');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-22 10:36:17', '2020-07-22 10:36:17');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-23 10:04:54', '2020-07-23 10:04:54');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-23 10:05:00', '2020-07-23 10:05:00');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-23 10:05:05', '2020-07-23 10:05:05');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-23 17:04:32', '2020-07-23 17:04:32');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-23 19:37:20', '2020-07-23 19:37:20');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-07-24 17:10:11', '2020-07-24 17:10:11');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 17:10:16', '2020-07-24 17:10:16');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 17:10:19', '2020-07-24 17:10:19');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-24 17:10:23', '2020-07-24 17:10:23');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:48:53', '2020-07-24 18:48:53');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:49:37', '2020-07-24 18:49:37');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:50:34', '2020-07-24 18:50:34');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:50:47', '2020-07-24 18:50:47');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:51:22', '2020-07-24 18:51:22');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:51:36', '2020-07-24 18:51:36');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:52:15', '2020-07-24 18:52:15');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:52:29', '2020-07-24 18:52:29');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:54:46', '2020-07-24 18:54:46');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:54:59', '2020-07-24 18:54:59');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 18:55:42', '2020-07-24 18:55:42');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 18:57:24', '2020-07-24 18:57:24');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 18:57:41', '2020-07-24 18:57:41');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 18:58:42', '2020-07-24 18:58:42');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-24 18:59:09', '2020-07-24 18:59:09');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 18:59:32', '2020-07-24 18:59:32');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/auth/menu/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:00:06', '2020-07-24 19:00:06');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/auth/menu/6/edit', 'GET', '127.0.0.1', '[]', '2020-07-24 19:00:47', '2020-07-24 19:00:47');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:00:55', '2020-07-24 19:00:55');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-24 19:01:03', '2020-07-24 19:01:03');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-24 19:01:42', '2020-07-24 19:01:42');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-07-24 19:02:24', '2020-07-24 19:02:24');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:02:32', '2020-07-24 19:02:32');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:02:34', '2020-07-24 19:02:34');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:02:38', '2020-07-24 19:02:38');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:02:49', '2020-07-24 19:02:49');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:03:09', '2020-07-24 19:03:09');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:03:27', '2020-07-24 19:03:27');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/channels', 'GET', '127.0.0.1', '[]', '2020-07-24 19:03:51', '2020-07-24 19:03:51');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:04:01', '2020-07-24 19:04:01');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '[]', '2020-07-24 19:04:21', '2020-07-24 19:04:21');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/cart-templates/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:04:25', '2020-07-24 19:04:25');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:04:29', '2020-07-24 19:04:29');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:04:32', '2020-07-24 19:04:32');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:05:01', '2020-07-24 19:05:01');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:05:23', '2020-07-24 19:05:23');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:41:10', '2020-07-24 19:41:10');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:41:14', '2020-07-24 19:41:14');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:43:07', '2020-07-24 19:43:07');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:43:36', '2020-07-24 19:43:36');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:43:55', '2020-07-24 19:43:55');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:44:01', '2020-07-24 19:44:01');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"1\"}', '2020-07-24 19:45:02', '2020-07-24 19:45:02');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:45:07', '2020-07-24 19:45:07');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '[]', '2020-07-24 19:46:20', '2020-07-24 19:46:20');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:46:29', '2020-07-24 19:46:29');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 19:46:33', '2020-07-24 19:46:33');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 20:42:12', '2020-07-24 20:42:12');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:42:20', '2020-07-24 20:42:20');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:42:45', '2020-07-24 20:42:45');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:42:51', '2020-07-24 20:42:51');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:43:15', '2020-07-24 20:43:15');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:43:34', '2020-07-24 20:43:34');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:44:01', '2020-07-24 20:44:01');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:44:34', '2020-07-24 20:44:34');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:44:47', '2020-07-24 20:44:47');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:45:34', '2020-07-24 20:45:34');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:45:43', '2020-07-24 20:45:43');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:45:49', '2020-07-24 20:45:49');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:46:06', '2020-07-24 20:46:06');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:46:13', '2020-07-24 20:46:13');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:46:14', '2020-07-24 20:46:14');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:47:49', '2020-07-24 20:47:49');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:47:52', '2020-07-24 20:47:52');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 20:48:14', '2020-07-24 20:48:14');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:50:28', '2020-07-24 20:50:28');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:52:13', '2020-07-24 20:52:13');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:59:26', '2020-07-24 20:59:26');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 20:59:44', '2020-07-24 20:59:44');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:01:16', '2020-07-24 21:01:16');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:01:30', '2020-07-24 21:01:30');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:03:57', '2020-07-24 21:03:57');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"1\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 21:04:04', '2020-07-24 21:04:04');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:04:10', '2020-07-24 21:04:10');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-24 21:04:16', '2020-07-24 21:04:16');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:04:30', '2020-07-24 21:04:30');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:05:03', '2020-07-24 21:05:03');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:05:15', '2020-07-24 21:05:15');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:05:28', '2020-07-24 21:05:28');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-24 21:32:44', '2020-07-24 21:32:44');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:32:49', '2020-07-24 21:32:49');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:34:24', '2020-07-24 21:34:24');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:34:27', '2020-07-24 21:34:27');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:35:49', '2020-07-24 21:35:49');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:40:57', '2020-07-24 21:40:57');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:41:00', '2020-07-24 21:41:00');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-24 21:41:17', '2020-07-24 21:41:17');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:41:24', '2020-07-24 21:41:24');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-24 21:42:32', '2020-07-24 21:42:32');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"name\":null,\"phone\":null,\"is_first\":\"1\",\"sex\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\"}', '2020-07-24 21:42:39', '2020-07-24 21:42:39');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-24 21:42:40', '2020-07-24 21:42:40');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"phone\":\"13333333333\",\"is_first\":\"1\",\"sex\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\\/create?customer_id=1\"}', '2020-07-24 21:43:07', '2020-07-24 21:43:07');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-24 21:43:08', '2020-07-24 21:43:08');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"phone\":\"13333333333\",\"is_first\":\"1\",\"sex\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\\/create?customer_id=1\"}', '2020-07-24 21:44:03', '2020-07-24 21:44:03');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-24 21:44:04', '2020-07-24 21:44:04');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"phone\":\"13333333333\",\"is_first\":\"1\",\"sex\":\"1\",\"_token\":\"R2gxgLAAsL5aUX1DlvVBHzOtMPlYaHUkVIySHOQE\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\\/create?customer_id=1\"}', '2020-07-24 21:44:43', '2020-07-24 21:44:43');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-24 21:44:44', '2020-07-24 21:44:44');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-24 21:45:37', '2020-07-24 21:45:37');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 09:16:51', '2020-07-25 09:16:51');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:17:00', '2020-07-25 09:17:00');
INSERT INTO `admin_operation_log` VALUES (811, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:17:02', '2020-07-25 09:17:02');
INSERT INTO `admin_operation_log` VALUES (812, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 09:20:59', '2020-07-25 09:20:59');
INSERT INTO `admin_operation_log` VALUES (813, 1, 'admin/customer-contacts/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:21:05', '2020-07-25 09:21:05');
INSERT INTO `admin_operation_log` VALUES (814, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:21:09', '2020-07-25 09:21:09');
INSERT INTO `admin_operation_log` VALUES (815, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:22:40', '2020-07-25 09:22:40');
INSERT INTO `admin_operation_log` VALUES (816, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:37:03', '2020-07-25 09:37:03');
INSERT INTO `admin_operation_log` VALUES (817, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:37:05', '2020-07-25 09:37:05');
INSERT INTO `admin_operation_log` VALUES (818, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-25 09:37:10', '2020-07-25 09:37:10');
INSERT INTO `admin_operation_log` VALUES (819, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:37:11', '2020-07-25 09:37:11');
INSERT INTO `admin_operation_log` VALUES (820, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:37:14', '2020-07-25 09:37:14');
INSERT INTO `admin_operation_log` VALUES (821, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:37:17', '2020-07-25 09:37:17');
INSERT INTO `admin_operation_log` VALUES (822, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 09:37:40', '2020-07-25 09:37:40');
INSERT INTO `admin_operation_log` VALUES (823, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:37:51', '2020-07-25 09:37:51');
INSERT INTO `admin_operation_log` VALUES (824, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-07-25 09:40:48', '2020-07-25 09:40:48');
INSERT INTO `admin_operation_log` VALUES (825, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:42:31', '2020-07-25 09:42:31');
INSERT INTO `admin_operation_log` VALUES (826, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:42:34', '2020-07-25 09:42:34');
INSERT INTO `admin_operation_log` VALUES (827, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"aasdd\",\"name\":\"\\u6d4b\\u8bd5\",\"phone\":\"13333333333\",\"is_first\":\"1\",\"sex\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 09:42:43', '2020-07-25 09:42:43');
INSERT INTO `admin_operation_log` VALUES (828, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:49:43', '2020-07-25 09:49:43');
INSERT INTO `admin_operation_log` VALUES (829, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:49:46', '2020-07-25 09:49:46');
INSERT INTO `admin_operation_log` VALUES (830, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:49:55', '2020-07-25 09:49:55');
INSERT INTO `admin_operation_log` VALUES (831, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:50:56', '2020-07-25 09:50:56');
INSERT INTO `admin_operation_log` VALUES (832, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:50:58', '2020-07-25 09:50:58');
INSERT INTO `admin_operation_log` VALUES (833, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:52:14', '2020-07-25 09:52:14');
INSERT INTO `admin_operation_log` VALUES (834, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:52:27', '2020-07-25 09:52:27');
INSERT INTO `admin_operation_log` VALUES (835, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:52:30', '2020-07-25 09:52:30');
INSERT INTO `admin_operation_log` VALUES (836, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:57:01', '2020-07-25 09:57:01');
INSERT INTO `admin_operation_log` VALUES (837, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:57:04', '2020-07-25 09:57:04');
INSERT INTO `admin_operation_log` VALUES (838, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 09:57:08', '2020-07-25 09:57:08');
INSERT INTO `admin_operation_log` VALUES (839, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:00:28', '2020-07-25 10:00:28');
INSERT INTO `admin_operation_log` VALUES (840, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:01:13', '2020-07-25 10:01:13');
INSERT INTO `admin_operation_log` VALUES (841, 1, 'admin/customer-contacts/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:01:17', '2020-07-25 10:01:17');
INSERT INTO `admin_operation_log` VALUES (842, 1, 'admin/customer-contacts/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:03:23', '2020-07-25 10:03:23');
INSERT INTO `admin_operation_log` VALUES (843, 1, 'admin/customer-contacts/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:04:10', '2020-07-25 10:04:10');
INSERT INTO `admin_operation_log` VALUES (844, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:04:22', '2020-07-25 10:04:22');
INSERT INTO `admin_operation_log` VALUES (845, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:04:30', '2020-07-25 10:04:30');
INSERT INTO `admin_operation_log` VALUES (846, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:04:33', '2020-07-25 10:04:33');
INSERT INTO `admin_operation_log` VALUES (847, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:04:36', '2020-07-25 10:04:36');
INSERT INTO `admin_operation_log` VALUES (848, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:04:39', '2020-07-25 10:04:39');
INSERT INTO `admin_operation_log` VALUES (849, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:04:42', '2020-07-25 10:04:42');
INSERT INTO `admin_operation_log` VALUES (850, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:15:17', '2020-07-25 10:15:17');
INSERT INTO `admin_operation_log` VALUES (851, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:16:03', '2020-07-25 10:16:03');
INSERT INTO `admin_operation_log` VALUES (852, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:22:22', '2020-07-25 10:22:22');
INSERT INTO `admin_operation_log` VALUES (853, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:23:01', '2020-07-25 10:23:01');
INSERT INTO `admin_operation_log` VALUES (854, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:23:36', '2020-07-25 10:23:36');
INSERT INTO `admin_operation_log` VALUES (855, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:24:32', '2020-07-25 10:24:32');
INSERT INTO `admin_operation_log` VALUES (856, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:24:56', '2020-07-25 10:24:56');
INSERT INTO `admin_operation_log` VALUES (857, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:25:13', '2020-07-25 10:25:13');
INSERT INTO `admin_operation_log` VALUES (858, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:25:54', '2020-07-25 10:25:54');
INSERT INTO `admin_operation_log` VALUES (859, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:28:10', '2020-07-25 10:28:10');
INSERT INTO `admin_operation_log` VALUES (860, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:29:38', '2020-07-25 10:29:38');
INSERT INTO `admin_operation_log` VALUES (861, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:33:10', '2020-07-25 10:33:10');
INSERT INTO `admin_operation_log` VALUES (862, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:33:29', '2020-07-25 10:33:29');
INSERT INTO `admin_operation_log` VALUES (863, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:37:52', '2020-07-25 10:37:52');
INSERT INTO `admin_operation_log` VALUES (864, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:37:59', '2020-07-25 10:37:59');
INSERT INTO `admin_operation_log` VALUES (865, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:38:02', '2020-07-25 10:38:02');
INSERT INTO `admin_operation_log` VALUES (866, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:38:08', '2020-07-25 10:38:08');
INSERT INTO `admin_operation_log` VALUES (867, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:38:16', '2020-07-25 10:38:16');
INSERT INTO `admin_operation_log` VALUES (868, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-25 10:38:22', '2020-07-25 10:38:22');
INSERT INTO `admin_operation_log` VALUES (869, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"is_first\":\"1\",\"sex\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 10:38:34', '2020-07-25 10:38:34');
INSERT INTO `admin_operation_log` VALUES (870, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '[]', '2020-07-25 10:38:35', '2020-07-25 10:38:35');
INSERT INTO `admin_operation_log` VALUES (871, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '[]', '2020-07-25 10:39:24', '2020-07-25 10:39:24');
INSERT INTO `admin_operation_log` VALUES (872, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:30', '2020-07-25 10:39:30');
INSERT INTO `admin_operation_log` VALUES (873, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:37', '2020-07-25 10:39:37');
INSERT INTO `admin_operation_log` VALUES (874, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:39', '2020-07-25 10:39:39');
INSERT INTO `admin_operation_log` VALUES (875, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:42', '2020-07-25 10:39:42');
INSERT INTO `admin_operation_log` VALUES (876, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:45', '2020-07-25 10:39:45');
INSERT INTO `admin_operation_log` VALUES (877, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:49', '2020-07-25 10:39:49');
INSERT INTO `admin_operation_log` VALUES (878, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:52', '2020-07-25 10:39:52');
INSERT INTO `admin_operation_log` VALUES (879, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:39:55', '2020-07-25 10:39:55');
INSERT INTO `admin_operation_log` VALUES (880, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:40:24', '2020-07-25 10:40:24');
INSERT INTO `admin_operation_log` VALUES (881, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:41:18', '2020-07-25 10:41:18');
INSERT INTO `admin_operation_log` VALUES (882, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:41:44', '2020-07-25 10:41:44');
INSERT INTO `admin_operation_log` VALUES (883, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:41:46', '2020-07-25 10:41:46');
INSERT INTO `admin_operation_log` VALUES (884, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"\\u897f\\u5b89\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 10:41:55', '2020-07-25 10:41:55');
INSERT INTO `admin_operation_log` VALUES (885, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:41:55', '2020-07-25 10:41:55');
INSERT INTO `admin_operation_log` VALUES (886, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"\\u6d4b\\u8bd5\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\\/create?customer_id=1\"}', '2020-07-25 10:42:23', '2020-07-25 10:42:23');
INSERT INTO `admin_operation_log` VALUES (887, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:42:24', '2020-07-25 10:42:24');
INSERT INTO `admin_operation_log` VALUES (888, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"\\u6d4b\\u8bd5\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\\/create?customer_id=1\"}', '2020-07-25 10:42:37', '2020-07-25 10:42:37');
INSERT INTO `admin_operation_log` VALUES (889, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:42:37', '2020-07-25 10:42:37');
INSERT INTO `admin_operation_log` VALUES (890, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"\\u6d4b\\u8bd5\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\\/create?customer_id=1\"}', '2020-07-25 10:42:52', '2020-07-25 10:42:52');
INSERT INTO `admin_operation_log` VALUES (891, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:43:15', '2020-07-25 10:43:15');
INSERT INTO `admin_operation_log` VALUES (892, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"\\u6d4b\\u8bd5\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\\/create?customer_id=1\"}', '2020-07-25 10:43:19', '2020-07-25 10:43:19');
INSERT INTO `admin_operation_log` VALUES (893, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:43:20', '2020-07-25 10:43:20');
INSERT INTO `admin_operation_log` VALUES (894, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:44:14', '2020-07-25 10:44:14');
INSERT INTO `admin_operation_log` VALUES (895, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:45:20', '2020-07-25 10:45:20');
INSERT INTO `admin_operation_log` VALUES (896, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:46:19', '2020-07-25 10:46:19');
INSERT INTO `admin_operation_log` VALUES (897, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:47:39', '2020-07-25 10:47:39');
INSERT INTO `admin_operation_log` VALUES (898, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:47:53', '2020-07-25 10:47:53');
INSERT INTO `admin_operation_log` VALUES (899, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:47:59', '2020-07-25 10:47:59');
INSERT INTO `admin_operation_log` VALUES (900, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:48:27', '2020-07-25 10:48:27');
INSERT INTO `admin_operation_log` VALUES (901, 1, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 10:48:50', '2020-07-25 10:48:50');
INSERT INTO `admin_operation_log` VALUES (902, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:49:49', '2020-07-25 10:49:49');
INSERT INTO `admin_operation_log` VALUES (903, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:49:51', '2020-07-25 10:49:51');
INSERT INTO `admin_operation_log` VALUES (904, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-25 10:49:54', '2020-07-25 10:49:54');
INSERT INTO `admin_operation_log` VALUES (905, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:50:53', '2020-07-25 10:50:53');
INSERT INTO `admin_operation_log` VALUES (906, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:50:55', '2020-07-25 10:50:55');
INSERT INTO `admin_operation_log` VALUES (907, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:50:58', '2020-07-25 10:50:58');
INSERT INTO `admin_operation_log` VALUES (908, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 10:51:27', '2020-07-25 10:51:27');
INSERT INTO `admin_operation_log` VALUES (909, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:51:34', '2020-07-25 10:51:34');
INSERT INTO `admin_operation_log` VALUES (910, 1, 'admin/customer-contacts/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:51:39', '2020-07-25 10:51:39');
INSERT INTO `admin_operation_log` VALUES (911, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:07', '2020-07-25 10:53:07');
INSERT INTO `admin_operation_log` VALUES (912, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:10', '2020-07-25 10:53:10');
INSERT INTO `admin_operation_log` VALUES (913, 1, 'admin/customer-demands/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 10:53:35', '2020-07-25 10:53:35');
INSERT INTO `admin_operation_log` VALUES (914, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:36', '2020-07-25 10:53:36');
INSERT INTO `admin_operation_log` VALUES (915, 1, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:38', '2020-07-25 10:53:38');
INSERT INTO `admin_operation_log` VALUES (916, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:41', '2020-07-25 10:53:41');
INSERT INTO `admin_operation_log` VALUES (917, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:43', '2020-07-25 10:53:43');
INSERT INTO `admin_operation_log` VALUES (918, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:47', '2020-07-25 10:53:47');
INSERT INTO `admin_operation_log` VALUES (919, 1, 'admin/customer-demands/4', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 10:53:52', '2020-07-25 10:53:52');
INSERT INTO `admin_operation_log` VALUES (920, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:52', '2020-07-25 10:53:52');
INSERT INTO `admin_operation_log` VALUES (921, 1, 'admin/customer-demands/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 10:53:55', '2020-07-25 10:53:55');
INSERT INTO `admin_operation_log` VALUES (922, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:56', '2020-07-25 10:53:56');
INSERT INTO `admin_operation_log` VALUES (923, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:53:58', '2020-07-25 10:53:58');
INSERT INTO `admin_operation_log` VALUES (924, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:54:02', '2020-07-25 10:54:02');
INSERT INTO `admin_operation_log` VALUES (925, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:54:28', '2020-07-25 10:54:28');
INSERT INTO `admin_operation_log` VALUES (926, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:54:34', '2020-07-25 10:54:34');
INSERT INTO `admin_operation_log` VALUES (927, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:55:29', '2020-07-25 10:55:29');
INSERT INTO `admin_operation_log` VALUES (928, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 10:55:31', '2020-07-25 10:55:31');
INSERT INTO `admin_operation_log` VALUES (929, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:56:33', '2020-07-25 10:56:33');
INSERT INTO `admin_operation_log` VALUES (930, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:56:57', '2020-07-25 10:56:57');
INSERT INTO `admin_operation_log` VALUES (931, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:57:39', '2020-07-25 10:57:39');
INSERT INTO `admin_operation_log` VALUES (932, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:58:06', '2020-07-25 10:58:06');
INSERT INTO `admin_operation_log` VALUES (933, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:58:16', '2020-07-25 10:58:16');
INSERT INTO `admin_operation_log` VALUES (934, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:58:36', '2020-07-25 10:58:36');
INSERT INTO `admin_operation_log` VALUES (935, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:58:45', '2020-07-25 10:58:45');
INSERT INTO `admin_operation_log` VALUES (936, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 10:59:58', '2020-07-25 10:59:58');
INSERT INTO `admin_operation_log` VALUES (937, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:00:07', '2020-07-25 11:00:07');
INSERT INTO `admin_operation_log` VALUES (938, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:00:25', '2020-07-25 11:00:25');
INSERT INTO `admin_operation_log` VALUES (939, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:00:39', '2020-07-25 11:00:39');
INSERT INTO `admin_operation_log` VALUES (940, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:01:09', '2020-07-25 11:01:09');
INSERT INTO `admin_operation_log` VALUES (941, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:01:19', '2020-07-25 11:01:19');
INSERT INTO `admin_operation_log` VALUES (942, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:01:37', '2020-07-25 11:01:37');
INSERT INTO `admin_operation_log` VALUES (943, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:01:46', '2020-07-25 11:01:46');
INSERT INTO `admin_operation_log` VALUES (944, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:02:04', '2020-07-25 11:02:04');
INSERT INTO `admin_operation_log` VALUES (945, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:02:07', '2020-07-25 11:02:07');
INSERT INTO `admin_operation_log` VALUES (946, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:03:00', '2020-07-25 11:03:00');
INSERT INTO `admin_operation_log` VALUES (947, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:03:05', '2020-07-25 11:03:05');
INSERT INTO `admin_operation_log` VALUES (948, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:05:08', '2020-07-25 11:05:08');
INSERT INTO `admin_operation_log` VALUES (949, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:05:12', '2020-07-25 11:05:12');
INSERT INTO `admin_operation_log` VALUES (950, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:05:45', '2020-07-25 11:05:45');
INSERT INTO `admin_operation_log` VALUES (951, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:05:58', '2020-07-25 11:05:58');
INSERT INTO `admin_operation_log` VALUES (952, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:06:08', '2020-07-25 11:06:08');
INSERT INTO `admin_operation_log` VALUES (953, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:06:35', '2020-07-25 11:06:35');
INSERT INTO `admin_operation_log` VALUES (954, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '[]', '2020-07-25 11:07:06', '2020-07-25 11:07:06');
INSERT INTO `admin_operation_log` VALUES (955, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:07:17', '2020-07-25 11:07:17');
INSERT INTO `admin_operation_log` VALUES (956, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:20:10', '2020-07-25 11:20:10');
INSERT INTO `admin_operation_log` VALUES (957, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:20:17', '2020-07-25 11:20:17');
INSERT INTO `admin_operation_log` VALUES (958, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:20:26', '2020-07-25 11:20:26');
INSERT INTO `admin_operation_log` VALUES (959, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"0\",\"pk\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-25 11:34:51', '2020-07-25 11:34:51');
INSERT INTO `admin_operation_log` VALUES (960, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:35:15', '2020-07-25 11:35:15');
INSERT INTO `admin_operation_log` VALUES (961, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:47:31', '2020-07-25 11:47:31');
INSERT INTO `admin_operation_log` VALUES (962, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:47:33', '2020-07-25 11:47:33');
INSERT INTO `admin_operation_log` VALUES (963, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:47:36', '2020-07-25 11:47:36');
INSERT INTO `admin_operation_log` VALUES (964, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:47:47', '2020-07-25 11:47:47');
INSERT INTO `admin_operation_log` VALUES (965, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:47:49', '2020-07-25 11:47:49');
INSERT INTO `admin_operation_log` VALUES (966, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 11:47:52', '2020-07-25 11:47:52');
INSERT INTO `admin_operation_log` VALUES (967, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 11:48:22', '2020-07-25 11:48:22');
INSERT INTO `admin_operation_log` VALUES (968, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 11:48:41', '2020-07-25 11:48:41');
INSERT INTO `admin_operation_log` VALUES (969, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 11:50:23', '2020-07-25 11:50:23');
INSERT INTO `admin_operation_log` VALUES (970, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 11:50:40', '2020-07-25 11:50:40');
INSERT INTO `admin_operation_log` VALUES (971, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 13:17:04', '2020-07-25 13:17:04');
INSERT INTO `admin_operation_log` VALUES (972, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:17:46', '2020-07-25 13:17:46');
INSERT INTO `admin_operation_log` VALUES (973, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:17:54', '2020-07-25 13:17:54');
INSERT INTO `admin_operation_log` VALUES (974, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-07-25 13:17:58', '2020-07-25 13:17:58');
INSERT INTO `admin_operation_log` VALUES (975, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"0\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-25 13:18:09', '2020-07-25 13:18:09');
INSERT INTO `admin_operation_log` VALUES (976, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 13:18:10', '2020-07-25 13:18:10');
INSERT INTO `admin_operation_log` VALUES (977, 1, 'admin/orders/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:18:18', '2020-07-25 13:18:18');
INSERT INTO `admin_operation_log` VALUES (978, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:18:26', '2020-07-25 13:18:26');
INSERT INTO `admin_operation_log` VALUES (979, 1, 'admin/orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:18:30', '2020-07-25 13:18:30');
INSERT INTO `admin_operation_log` VALUES (980, 1, 'admin/orders/2', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"0\",\"sales_remark\":null,\"commerce_status\":\"2\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"2\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"1\",\"it_remark\":null,\"it_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-25 13:19:35', '2020-07-25 13:19:35');
INSERT INTO `admin_operation_log` VALUES (981, 1, 'admin/orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:39:53', '2020-07-25 13:39:53');
INSERT INTO `admin_operation_log` VALUES (982, 1, 'admin/orders/2', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"0\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\"}', '2020-07-25 13:40:06', '2020-07-25 13:40:06');
INSERT INTO `admin_operation_log` VALUES (983, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 13:40:06', '2020-07-25 13:40:06');
INSERT INTO `admin_operation_log` VALUES (984, 1, 'admin/orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:40:20', '2020-07-25 13:40:20');
INSERT INTO `admin_operation_log` VALUES (985, 1, 'admin/orders/2', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"0\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"2\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-25 13:40:39', '2020-07-25 13:40:39');
INSERT INTO `admin_operation_log` VALUES (986, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 13:40:39', '2020-07-25 13:40:39');
INSERT INTO `admin_operation_log` VALUES (987, 1, 'admin/orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:40:43', '2020-07-25 13:40:43');
INSERT INTO `admin_operation_log` VALUES (988, 1, 'admin/orders/2', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"1\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"2\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-25 13:40:51', '2020-07-25 13:40:51');
INSERT INTO `admin_operation_log` VALUES (989, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 13:40:52', '2020-07-25 13:40:52');
INSERT INTO `admin_operation_log` VALUES (990, 1, 'admin/orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:48:42', '2020-07-25 13:48:42');
INSERT INTO `admin_operation_log` VALUES (991, 1, 'admin/orders/2', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"2\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-25 13:48:50', '2020-07-25 13:48:50');
INSERT INTO `admin_operation_log` VALUES (992, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 13:48:51', '2020-07-25 13:48:51');
INSERT INTO `admin_operation_log` VALUES (993, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:53:49', '2020-07-25 13:53:49');
INSERT INTO `admin_operation_log` VALUES (994, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-07-20 19:37:03\",\"end_time\":\"2020-07-20 19:37:03\",\"admin_user_id\":\"1\",\"price\":null,\"receivable\":null,\"receipts\":null,\"status\":\"1\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-25 13:54:02', '2020-07-25 13:54:02');
INSERT INTO `admin_operation_log` VALUES (995, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:54:21', '2020-07-25 13:54:21');
INSERT INTO `admin_operation_log` VALUES (996, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-07-20 19:37:03\",\"end_time\":\"2020-07-20 19:37:03\",\"admin_user_id\":\"1\",\"price\":null,\"receivable\":null,\"receipts\":null,\"status\":\"1\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\"}', '2020-07-25 13:54:31', '2020-07-25 13:54:31');
INSERT INTO `admin_operation_log` VALUES (997, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:56:35', '2020-07-25 13:56:35');
INSERT INTO `admin_operation_log` VALUES (998, 1, 'admin/orders/1', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-07-20 19:37:03\",\"end_time\":\"2020-07-20 19:37:03\",\"admin_user_id\":\"1\",\"price\":null,\"receivable\":null,\"receipts\":null,\"status\":\"1\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\"}', '2020-07-25 13:56:46', '2020-07-25 13:56:46');
INSERT INTO `admin_operation_log` VALUES (999, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 13:56:47', '2020-07-25 13:56:47');
INSERT INTO `admin_operation_log` VALUES (1000, 1, 'admin/orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:56:55', '2020-07-25 13:56:55');
INSERT INTO `admin_operation_log` VALUES (1001, 1, 'admin/orders/2', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"2\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-07-25 13:57:18', '2020-07-25 13:57:18');
INSERT INTO `admin_operation_log` VALUES (1002, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-07-25 13:57:18', '2020-07-25 13:57:18');
INSERT INTO `admin_operation_log` VALUES (1003, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:59:40', '2020-07-25 13:59:40');
INSERT INTO `admin_operation_log` VALUES (1004, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 13:59:43', '2020-07-25 13:59:43');
INSERT INTO `admin_operation_log` VALUES (1005, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:00:24', '2020-07-25 14:00:24');
INSERT INTO `admin_operation_log` VALUES (1006, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:00:27', '2020-07-25 14:00:27');
INSERT INTO `admin_operation_log` VALUES (1007, 1, 'admin/auth/users/1', 'PUT', '127.0.0.1', '{\"name\":\"Administrator\",\"phone\":\"15700064975\",\"username\":\"admin\",\"password\":\"$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q\\/NCEEIQIU6\",\"password_confirmation\":\"$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q\\/NCEEIQIU6\",\"entry_time\":\"2020\\u5e7407\\u670816\\u65e5\",\"dept_id\":\"0\",\"roles\":[\"1\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":\"1995\\u5e7411\\u670805\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-07-25 14:00:31', '2020-07-25 14:00:31');
INSERT INTO `admin_operation_log` VALUES (1008, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-07-25 14:00:31', '2020-07-25 14:00:31');
INSERT INTO `admin_operation_log` VALUES (1009, 1, 'admin/auth/users/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:00:34', '2020-07-25 14:00:34');
INSERT INTO `admin_operation_log` VALUES (1010, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:00:40', '2020-07-25 14:00:40');
INSERT INTO `admin_operation_log` VALUES (1011, 1, 'admin/orders/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:01:18', '2020-07-25 14:01:18');
INSERT INTO `admin_operation_log` VALUES (1012, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:01:24', '2020-07-25 14:01:24');
INSERT INTO `admin_operation_log` VALUES (1013, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:01:26', '2020-07-25 14:01:26');
INSERT INTO `admin_operation_log` VALUES (1014, 1, 'admin/orders-details/1', 'PUT', '127.0.0.1', '{\"name\":\"value\",\"value\":\"\\u5347\\u7ea7\\u7248\",\"pk\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-07-25 14:02:05', '2020-07-25 14:02:05');
INSERT INTO `admin_operation_log` VALUES (1015, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-25 14:02:09', '2020-07-25 14:02:09');
INSERT INTO `admin_operation_log` VALUES (1016, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-25 14:32:43', '2020-07-25 14:32:43');
INSERT INTO `admin_operation_log` VALUES (1017, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:32:49', '2020-07-25 14:32:49');
INSERT INTO `admin_operation_log` VALUES (1018, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:33:00', '2020-07-25 14:33:00');
INSERT INTO `admin_operation_log` VALUES (1019, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:39:59', '2020-07-25 14:39:59');
INSERT INTO `admin_operation_log` VALUES (1020, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:40:01', '2020-07-25 14:40:01');
INSERT INTO `admin_operation_log` VALUES (1021, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:40:06', '2020-07-25 14:40:06');
INSERT INTO `admin_operation_log` VALUES (1022, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"name\":\"admin\",\"phone\":\"15700064975\",\"is_first\":\"1\",\"sex\":\"1\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 14:40:12', '2020-07-25 14:40:12');
INSERT INTO `admin_operation_log` VALUES (1023, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:40:25', '2020-07-25 14:40:25');
INSERT INTO `admin_operation_log` VALUES (1024, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"phone\":\"13333333333\",\"is_first\":\"1\",\"sex\":\"0\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\\/create?customer_id=1\"}', '2020-07-25 14:40:31', '2020-07-25 14:40:31');
INSERT INTO `admin_operation_log` VALUES (1025, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\"}', '2020-07-25 14:40:32', '2020-07-25 14:40:32');
INSERT INTO `admin_operation_log` VALUES (1026, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:40:39', '2020-07-25 14:40:39');
INSERT INTO `admin_operation_log` VALUES (1027, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:40:41', '2020-07-25 14:40:41');
INSERT INTO `admin_operation_log` VALUES (1028, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:41:11', '2020-07-25 14:41:11');
INSERT INTO `admin_operation_log` VALUES (1029, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:42:08', '2020-07-25 14:42:08');
INSERT INTO `admin_operation_log` VALUES (1030, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:42:11', '2020-07-25 14:42:11');
INSERT INTO `admin_operation_log` VALUES (1031, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"name\":\"\\u9ad8\\u74a7\\u7389\",\"phone\":\"15700064975\",\"is_first\":\"1\",\"sex\":\"0\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\"}', '2020-07-25 14:42:17', '2020-07-25 14:42:17');
INSERT INTO `admin_operation_log` VALUES (1032, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 14:42:18', '2020-07-25 14:42:18');
INSERT INTO `admin_operation_log` VALUES (1033, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:42:30', '2020-07-25 14:42:30');
INSERT INTO `admin_operation_log` VALUES (1034, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 14:43:02', '2020-07-25 14:43:02');
INSERT INTO `admin_operation_log` VALUES (1035, 1, 'admin/customer-contacts/3/edit', 'GET', '127.0.0.1', '[]', '2020-07-25 14:44:46', '2020-07-25 14:44:46');
INSERT INTO `admin_operation_log` VALUES (1036, 1, 'admin/customer-contacts/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"phone\":\"13333333334\",\"is_first\":\"1\",\"sex\":\"0\",\"_token\":\"vTjZBu5lVT8d5SNeff2lHTNorNMflpmDM46Z7kso\",\"_method\":\"PUT\"}', '2020-07-25 14:44:51', '2020-07-25 14:44:51');
INSERT INTO `admin_operation_log` VALUES (1037, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-07-25 14:44:52', '2020-07-25 14:44:52');
INSERT INTO `admin_operation_log` VALUES (1038, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 16:00:07', '2020-07-25 16:00:07');
INSERT INTO `admin_operation_log` VALUES (1039, 1, 'admin/orders/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 16:00:10', '2020-07-25 16:00:10');
INSERT INTO `admin_operation_log` VALUES (1040, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 16:00:15', '2020-07-25 16:00:15');
INSERT INTO `admin_operation_log` VALUES (1041, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 16:00:19', '2020-07-25 16:00:19');
INSERT INTO `admin_operation_log` VALUES (1042, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-07-25 16:00:21', '2020-07-25 16:00:21');
INSERT INTO `admin_operation_log` VALUES (1043, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-07-25 17:53:07', '2020-07-25 17:53:07');
INSERT INTO `admin_operation_log` VALUES (1044, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-06 14:51:31', '2020-08-06 14:51:31');
INSERT INTO `admin_operation_log` VALUES (1045, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:51:39', '2020-08-06 14:51:39');
INSERT INTO `admin_operation_log` VALUES (1046, 1, 'admin/orders/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:52:36', '2020-08-06 14:52:36');
INSERT INTO `admin_operation_log` VALUES (1047, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:53:49', '2020-08-06 14:53:49');
INSERT INTO `admin_operation_log` VALUES (1048, 1, 'admin/orders/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:53:52', '2020-08-06 14:53:52');
INSERT INTO `admin_operation_log` VALUES (1049, 1, 'admin/orders/2', 'GET', '127.0.0.1', '[]', '2020-08-06 14:56:40', '2020-08-06 14:56:40');
INSERT INTO `admin_operation_log` VALUES (1050, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:56:43', '2020-08-06 14:56:43');
INSERT INTO `admin_operation_log` VALUES (1051, 1, 'admin/orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:58:39', '2020-08-06 14:58:39');
INSERT INTO `admin_operation_log` VALUES (1052, 1, 'admin/orders/2', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-07-25 13:17:55\",\"end_time\":\"2020-07-25 13:17:55\",\"admin_user_id\":\"1\",\"price\":\"323\",\"receivable\":\"0\",\"receipts\":\"0\",\"status\":\"2\",\"sales_remark\":null,\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"0\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"LmpFVcT3VGgmFwGba3VA3hgESTXbByMAkXNASI6l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-08-06 14:58:57', '2020-08-06 14:58:57');
INSERT INTO `admin_operation_log` VALUES (1053, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-06 14:58:58', '2020-08-06 14:58:58');
INSERT INTO `admin_operation_log` VALUES (1054, 1, 'admin/orders/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 14:59:34', '2020-08-06 14:59:34');
INSERT INTO `admin_operation_log` VALUES (1055, 1, 'admin/orders/%E5%BD%A2%E5%BC%8F%E9%80%BB%E8%BE%91%E5%85%AC%E5%BC%8F%E6%80%BB%E7%BB%93(1)(1).pdf', 'GET', '127.0.0.1', '[]', '2020-08-06 14:59:38', '2020-08-06 14:59:38');
INSERT INTO `admin_operation_log` VALUES (1056, 1, 'admin/orders/2', 'GET', '127.0.0.1', '[]', '2020-08-06 15:00:31', '2020-08-06 15:00:31');
INSERT INTO `admin_operation_log` VALUES (1057, 1, 'admin/orders/2', 'GET', '127.0.0.1', '[]', '2020-08-06 15:01:44', '2020-08-06 15:01:44');
INSERT INTO `admin_operation_log` VALUES (1058, 1, 'admin/orders/2', 'GET', '127.0.0.1', '[]', '2020-08-06 15:01:54', '2020-08-06 15:01:54');
INSERT INTO `admin_operation_log` VALUES (1059, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:31:28', '2020-08-06 16:31:28');
INSERT INTO `admin_operation_log` VALUES (1060, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:31:28', '2020-08-06 16:31:28');
INSERT INTO `admin_operation_log` VALUES (1061, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:31:32', '2020-08-06 16:31:32');
INSERT INTO `admin_operation_log` VALUES (1062, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:31:36', '2020-08-06 16:31:36');
INSERT INTO `admin_operation_log` VALUES (1063, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:31:40', '2020-08-06 16:31:40');
INSERT INTO `admin_operation_log` VALUES (1064, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:35:17', '2020-08-06 16:35:17');
INSERT INTO `admin_operation_log` VALUES (1065, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:35:28', '2020-08-06 16:35:28');
INSERT INTO `admin_operation_log` VALUES (1066, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:35:34', '2020-08-06 16:35:34');
INSERT INTO `admin_operation_log` VALUES (1067, 1, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-06 16:35:36', '2020-08-06 16:35:36');
INSERT INTO `admin_operation_log` VALUES (1068, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 10:54:31', '2020-08-10 10:54:31');
INSERT INTO `admin_operation_log` VALUES (1069, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-10 10:54:36', '2020-08-10 10:54:36');
INSERT INTO `admin_operation_log` VALUES (1070, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-10 17:11:06', '2020-08-10 17:11:06');
INSERT INTO `admin_operation_log` VALUES (1071, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-11 14:39:46', '2020-08-11 14:39:46');
INSERT INTO `admin_operation_log` VALUES (1072, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-11 14:40:29', '2020-08-11 14:40:29');
INSERT INTO `admin_operation_log` VALUES (1073, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-12 15:48:09', '2020-08-12 15:48:09');
INSERT INTO `admin_operation_log` VALUES (1074, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:48:16', '2020-08-12 15:48:16');
INSERT INTO `admin_operation_log` VALUES (1075, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:51:28', '2020-08-12 15:51:28');
INSERT INTO `admin_operation_log` VALUES (1076, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-12 15:51:30', '2020-08-12 15:51:30');
INSERT INTO `admin_operation_log` VALUES (1077, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:51:33', '2020-08-12 15:51:33');
INSERT INTO `admin_operation_log` VALUES (1078, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:51:38', '2020-08-12 15:51:38');
INSERT INTO `admin_operation_log` VALUES (1079, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:51:41', '2020-08-12 15:51:41');
INSERT INTO `admin_operation_log` VALUES (1080, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:51:45', '2020-08-12 15:51:45');
INSERT INTO `admin_operation_log` VALUES (1081, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:52:18', '2020-08-12 15:52:18');
INSERT INTO `admin_operation_log` VALUES (1082, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:52:25', '2020-08-12 15:52:25');
INSERT INTO `admin_operation_log` VALUES (1083, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:54:52', '2020-08-12 15:54:52');
INSERT INTO `admin_operation_log` VALUES (1084, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:54:53', '2020-08-12 15:54:53');
INSERT INTO `admin_operation_log` VALUES (1085, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:55:00', '2020-08-12 15:55:00');
INSERT INTO `admin_operation_log` VALUES (1086, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:55:03', '2020-08-12 15:55:03');
INSERT INTO `admin_operation_log` VALUES (1087, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:55:38', '2020-08-12 15:55:38');
INSERT INTO `admin_operation_log` VALUES (1088, 1, 'admin/customers/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:55:41', '2020-08-12 15:55:41');
INSERT INTO `admin_operation_log` VALUES (1089, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:55:57', '2020-08-12 15:55:57');
INSERT INTO `admin_operation_log` VALUES (1090, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:56:01', '2020-08-12 15:56:01');
INSERT INTO `admin_operation_log` VALUES (1091, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 15:57:05', '2020-08-12 15:57:05');
INSERT INTO `admin_operation_log` VALUES (1092, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 16:08:44', '2020-08-12 16:08:44');
INSERT INTO `admin_operation_log` VALUES (1093, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 16:08:47', '2020-08-12 16:08:47');
INSERT INTO `admin_operation_log` VALUES (1094, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 17:46:45', '2020-08-12 17:46:45');
INSERT INTO `admin_operation_log` VALUES (1095, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 17:46:48', '2020-08-12 17:46:48');
INSERT INTO `admin_operation_log` VALUES (1096, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-08-12 17:46:57', '2020-08-12 17:46:57');
INSERT INTO `admin_operation_log` VALUES (1097, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:18:44', '2020-08-12 19:18:44');
INSERT INTO `admin_operation_log` VALUES (1098, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:18:47', '2020-08-12 19:18:47');
INSERT INTO `admin_operation_log` VALUES (1099, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:18:57', '2020-08-12 19:18:57');
INSERT INTO `admin_operation_log` VALUES (1100, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:18:58', '2020-08-12 19:18:58');
INSERT INTO `admin_operation_log` VALUES (1101, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:19:00', '2020-08-12 19:19:00');
INSERT INTO `admin_operation_log` VALUES (1102, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:19:02', '2020-08-12 19:19:02');
INSERT INTO `admin_operation_log` VALUES (1103, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:19:03', '2020-08-12 19:19:03');
INSERT INTO `admin_operation_log` VALUES (1104, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:19:05', '2020-08-12 19:19:05');
INSERT INTO `admin_operation_log` VALUES (1105, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:19:05', '2020-08-12 19:19:05');
INSERT INTO `admin_operation_log` VALUES (1106, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-08-12 19:19:08', '2020-08-12 19:19:08');
INSERT INTO `admin_operation_log` VALUES (1107, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:19:54', '2020-08-12 19:19:54');
INSERT INTO `admin_operation_log` VALUES (1108, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"2\",\"params_id\":[\"4\",\"5\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-08-12 19:20:09', '2020-08-12 19:20:09');
INSERT INTO `admin_operation_log` VALUES (1109, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-08-12 19:20:09', '2020-08-12 19:20:09');
INSERT INTO `admin_operation_log` VALUES (1110, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:25:04', '2020-08-12 19:25:04');
INSERT INTO `admin_operation_log` VALUES (1111, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-08-12 19:25:12', '2020-08-12 19:25:12');
INSERT INTO `admin_operation_log` VALUES (1112, 1, 'admin/orders-logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:25:23', '2020-08-12 19:25:23');
INSERT INTO `admin_operation_log` VALUES (1113, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:28:26', '2020-08-12 19:28:26');
INSERT INTO `admin_operation_log` VALUES (1114, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:28:31', '2020-08-12 19:28:31');
INSERT INTO `admin_operation_log` VALUES (1115, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:28:34', '2020-08-12 19:28:34');
INSERT INTO `admin_operation_log` VALUES (1116, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-12 19:40:21', '2020-08-12 19:40:21');
INSERT INTO `admin_operation_log` VALUES (1117, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:40:25', '2020-08-12 19:40:25');
INSERT INTO `admin_operation_log` VALUES (1118, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:40:28', '2020-08-12 19:40:28');
INSERT INTO `admin_operation_log` VALUES (1119, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-12 19:40:29', '2020-08-12 19:40:29');
INSERT INTO `admin_operation_log` VALUES (1120, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-12 19:41:10', '2020-08-12 19:41:10');
INSERT INTO `admin_operation_log` VALUES (1121, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:41:14', '2020-08-12 19:41:14');
INSERT INTO `admin_operation_log` VALUES (1122, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:41:16', '2020-08-12 19:41:16');
INSERT INTO `admin_operation_log` VALUES (1123, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:41:18', '2020-08-12 19:41:18');
INSERT INTO `admin_operation_log` VALUES (1124, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:41:19', '2020-08-12 19:41:19');
INSERT INTO `admin_operation_log` VALUES (1125, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:41:21', '2020-08-12 19:41:21');
INSERT INTO `admin_operation_log` VALUES (1126, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:41:23', '2020-08-12 19:41:23');
INSERT INTO `admin_operation_log` VALUES (1127, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:42:14', '2020-08-12 19:42:14');
INSERT INTO `admin_operation_log` VALUES (1128, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"2\",\"3\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-08-12 19:42:19', '2020-08-12 19:42:19');
INSERT INTO `admin_operation_log` VALUES (1129, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:45:22', '2020-08-12 19:45:22');
INSERT INTO `admin_operation_log` VALUES (1130, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"2\",\"3\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:45:32', '2020-08-12 19:45:32');
INSERT INTO `admin_operation_log` VALUES (1131, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:45:54', '2020-08-12 19:45:54');
INSERT INTO `admin_operation_log` VALUES (1132, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"2\",\"4\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:45:59', '2020-08-12 19:45:59');
INSERT INTO `admin_operation_log` VALUES (1133, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:46:46', '2020-08-12 19:46:46');
INSERT INTO `admin_operation_log` VALUES (1134, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"1\",\"4\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:46:50', '2020-08-12 19:46:50');
INSERT INTO `admin_operation_log` VALUES (1135, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:47:03', '2020-08-12 19:47:03');
INSERT INTO `admin_operation_log` VALUES (1136, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"2\",\"3\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:47:09', '2020-08-12 19:47:09');
INSERT INTO `admin_operation_log` VALUES (1137, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:47:11', '2020-08-12 19:47:11');
INSERT INTO `admin_operation_log` VALUES (1138, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"2\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:47:23', '2020-08-12 19:47:23');
INSERT INTO `admin_operation_log` VALUES (1139, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:47:25', '2020-08-12 19:47:25');
INSERT INTO `admin_operation_log` VALUES (1140, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"2\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:47:57', '2020-08-12 19:47:57');
INSERT INTO `admin_operation_log` VALUES (1141, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-08-12 19:47:58', '2020-08-12 19:47:58');
INSERT INTO `admin_operation_log` VALUES (1142, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:48:54', '2020-08-12 19:48:54');
INSERT INTO `admin_operation_log` VALUES (1143, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"0\",\"params_id\":[\"2\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-08-12 19:48:57', '2020-08-12 19:48:57');
INSERT INTO `admin_operation_log` VALUES (1144, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '[]', '2020-08-12 19:48:58', '2020-08-12 19:48:58');
INSERT INTO `admin_operation_log` VALUES (1145, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"2\",\"params_id\":[\"5\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:49:21', '2020-08-12 19:49:21');
INSERT INTO `admin_operation_log` VALUES (1146, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:50:07', '2020-08-12 19:50:07');
INSERT INTO `admin_operation_log` VALUES (1147, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"2\",\"params_id\":[\"5\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:50:22', '2020-08-12 19:50:22');
INSERT INTO `admin_operation_log` VALUES (1148, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:50:26', '2020-08-12 19:50:26');
INSERT INTO `admin_operation_log` VALUES (1149, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:50:29', '2020-08-12 19:50:29');
INSERT INTO `admin_operation_log` VALUES (1150, 1, 'admin/product-params/10', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:50:33', '2020-08-12 19:50:33');
INSERT INTO `admin_operation_log` VALUES (1151, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:50:34', '2020-08-12 19:50:34');
INSERT INTO `admin_operation_log` VALUES (1152, 1, 'admin/product-params/11', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:50:39', '2020-08-12 19:50:39');
INSERT INTO `admin_operation_log` VALUES (1153, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:50:40', '2020-08-12 19:50:40');
INSERT INTO `admin_operation_log` VALUES (1154, 1, 'admin/product-params/12', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 19:50:44', '2020-08-12 19:50:44');
INSERT INTO `admin_operation_log` VALUES (1155, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:50:44', '2020-08-12 19:50:44');
INSERT INTO `admin_operation_log` VALUES (1156, 1, 'admin/product-params/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:50:53', '2020-08-12 19:50:53');
INSERT INTO `admin_operation_log` VALUES (1157, 1, 'admin/product-params', 'POST', '127.0.0.1', '{\"product_id\":\"2\",\"params_id\":[\"4\",\"5\",null],\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/product-params\"}', '2020-08-12 19:51:02', '2020-08-12 19:51:02');
INSERT INTO `admin_operation_log` VALUES (1158, 1, 'admin/product-params', 'GET', '127.0.0.1', '[]', '2020-08-12 19:51:03', '2020-08-12 19:51:03');
INSERT INTO `admin_operation_log` VALUES (1159, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:51:11', '2020-08-12 19:51:11');
INSERT INTO `admin_operation_log` VALUES (1160, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:51:14', '2020-08-12 19:51:14');
INSERT INTO `admin_operation_log` VALUES (1161, 1, 'admin/customers/create', 'GET', '127.0.0.1', '[]', '2020-08-12 19:52:29', '2020-08-12 19:52:29');
INSERT INTO `admin_operation_log` VALUES (1162, 1, 'admin/customers', 'POST', '127.0.0.1', '{\"title\":\"\\u4e2d\\u5149\\u81ea\\u7528\",\"type\":\"1\",\"address\":null,\"is_agent\":\"0\",\"channel_id\":\"1\",\"industry_id\":\"1283\",\"remark\":null,\"owner_user_id\":\"1\",\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customers\"}', '2020-08-12 19:53:17', '2020-08-12 19:53:17');
INSERT INTO `admin_operation_log` VALUES (1163, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-12 19:53:18', '2020-08-12 19:53:18');
INSERT INTO `admin_operation_log` VALUES (1164, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-12 19:54:26', '2020-08-12 19:54:26');
INSERT INTO `admin_operation_log` VALUES (1165, 1, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-12 19:54:53', '2020-08-12 19:54:53');
INSERT INTO `admin_operation_log` VALUES (1166, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:55:13', '2020-08-12 19:55:13');
INSERT INTO `admin_operation_log` VALUES (1167, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:56:41', '2020-08-12 19:56:41');
INSERT INTO `admin_operation_log` VALUES (1168, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 19:56:44', '2020-08-12 19:56:44');
INSERT INTO `admin_operation_log` VALUES (1169, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:26:09', '2020-08-12 20:26:09');
INSERT INTO `admin_operation_log` VALUES (1170, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:26:11', '2020-08-12 20:26:11');
INSERT INTO `admin_operation_log` VALUES (1171, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:26:14', '2020-08-12 20:26:14');
INSERT INTO `admin_operation_log` VALUES (1172, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:26:16', '2020-08-12 20:26:16');
INSERT INTO `admin_operation_log` VALUES (1173, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:26:19', '2020-08-12 20:26:19');
INSERT INTO `admin_operation_log` VALUES (1174, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-08-12 20:26:29', '2020-08-12 20:26:29');
INSERT INTO `admin_operation_log` VALUES (1175, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:26:46', '2020-08-12 20:26:46');
INSERT INTO `admin_operation_log` VALUES (1176, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:27:53', '2020-08-12 20:27:53');
INSERT INTO `admin_operation_log` VALUES (1177, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-08-12 20:27:56', '2020-08-12 20:27:56');
INSERT INTO `admin_operation_log` VALUES (1178, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:29:33', '2020-08-12 20:29:33');
INSERT INTO `admin_operation_log` VALUES (1179, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:36:37', '2020-08-12 20:36:37');
INSERT INTO `admin_operation_log` VALUES (1180, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:38:17', '2020-08-12 20:38:17');
INSERT INTO `admin_operation_log` VALUES (1181, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:38:19', '2020-08-12 20:38:19');
INSERT INTO `admin_operation_log` VALUES (1182, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-08-12 20:38:44', '2020-08-12 20:38:44');
INSERT INTO `admin_operation_log` VALUES (1183, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:45:59', '2020-08-12 20:45:59');
INSERT INTO `admin_operation_log` VALUES (1184, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:46:02', '2020-08-12 20:46:02');
INSERT INTO `admin_operation_log` VALUES (1185, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-08-12 20:46:08', '2020-08-12 20:46:08');
INSERT INTO `admin_operation_log` VALUES (1186, 1, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"phone\":\"15333333333\",\"is_first\":\"1\",\"sex\":\"1\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\"}', '2020-08-12 20:46:18', '2020-08-12 20:46:18');
INSERT INTO `admin_operation_log` VALUES (1187, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-12 20:46:19', '2020-08-12 20:46:19');
INSERT INTO `admin_operation_log` VALUES (1188, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:46:27', '2020-08-12 20:46:27');
INSERT INTO `admin_operation_log` VALUES (1189, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 20:46:30', '2020-08-12 20:46:30');
INSERT INTO `admin_operation_log` VALUES (1190, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-08-12 20:46:34', '2020-08-12 20:46:34');
INSERT INTO `admin_operation_log` VALUES (1191, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-08-12 20:48:26', '2020-08-12 20:48:26');
INSERT INTO `admin_operation_log` VALUES (1192, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"1\",\"q\":\"1\"}', '2020-08-12 20:48:32', '2020-08-12 20:48:32');
INSERT INTO `admin_operation_log` VALUES (1193, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-08-12 20:56:17', '2020-08-12 20:56:17');
INSERT INTO `admin_operation_log` VALUES (1194, 1, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-12 20:56:24', '2020-08-12 20:56:24');
INSERT INTO `admin_operation_log` VALUES (1195, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-08-12 20:58:27', '2020-08-12 20:58:27');
INSERT INTO `admin_operation_log` VALUES (1196, 1, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-12 20:58:33', '2020-08-12 20:58:33');
INSERT INTO `admin_operation_log` VALUES (1197, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-08-12 20:59:06', '2020-08-12 20:59:06');
INSERT INTO `admin_operation_log` VALUES (1198, 1, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-12 20:59:12', '2020-08-12 20:59:12');
INSERT INTO `admin_operation_log` VALUES (1199, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"demand\":\"\\u6d4b\\u8bd5\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\"}', '2020-08-12 21:12:18', '2020-08-12 21:12:18');
INSERT INTO `admin_operation_log` VALUES (1200, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:18:24', '2020-08-12 21:18:24');
INSERT INTO `admin_operation_log` VALUES (1201, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:18:27', '2020-08-12 21:18:27');
INSERT INTO `admin_operation_log` VALUES (1202, 1, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-12 21:18:30', '2020-08-12 21:18:30');
INSERT INTO `admin_operation_log` VALUES (1203, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"cs\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"KtOQAjWeVUlLlRY4ENM4c5QYAKFH4KBjGYFZ2T4n\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-12 21:18:37', '2020-08-12 21:18:37');
INSERT INTO `admin_operation_log` VALUES (1204, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-12 21:18:37', '2020-08-12 21:18:37');
INSERT INTO `admin_operation_log` VALUES (1205, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:19:05', '2020-08-12 21:19:05');
INSERT INTO `admin_operation_log` VALUES (1206, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-12 21:23:17', '2020-08-12 21:23:17');
INSERT INTO `admin_operation_log` VALUES (1207, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null,\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:23:28', '2020-08-12 21:23:28');
INSERT INTO `admin_operation_log` VALUES (1208, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-12 21:24:42', '2020-08-12 21:24:42');
INSERT INTO `admin_operation_log` VALUES (1209, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-12 21:25:14', '2020-08-12 21:25:14');
INSERT INTO `admin_operation_log` VALUES (1210, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-12 21:27:14', '2020-08-12 21:27:14');
INSERT INTO `admin_operation_log` VALUES (1211, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-12 21:27:39', '2020-08-12 21:27:39');
INSERT INTO `admin_operation_log` VALUES (1212, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-12 21:28:49', '2020-08-12 21:28:49');
INSERT INTO `admin_operation_log` VALUES (1213, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-12 21:29:26', '2020-08-12 21:29:26');
INSERT INTO `admin_operation_log` VALUES (1214, 1, 'admin/customer-demands/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:29:31', '2020-08-12 21:29:31');
INSERT INTO `admin_operation_log` VALUES (1215, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:29:42', '2020-08-12 21:29:42');
INSERT INTO `admin_operation_log` VALUES (1216, 1, 'admin/customer-contacts/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:29:46', '2020-08-12 21:29:46');
INSERT INTO `admin_operation_log` VALUES (1217, 1, 'admin/customer-contacts/1', 'GET', '127.0.0.1', '[]', '2020-08-12 21:30:48', '2020-08-12 21:30:48');
INSERT INTO `admin_operation_log` VALUES (1218, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:30:55', '2020-08-12 21:30:55');
INSERT INTO `admin_operation_log` VALUES (1219, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:30:58', '2020-08-12 21:30:58');
INSERT INTO `admin_operation_log` VALUES (1220, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:31:04', '2020-08-12 21:31:04');
INSERT INTO `admin_operation_log` VALUES (1221, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:32:44', '2020-08-12 21:32:44');
INSERT INTO `admin_operation_log` VALUES (1222, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-12 21:32:56', '2020-08-12 21:32:56');
INSERT INTO `admin_operation_log` VALUES (1223, 1, 'admin/orders/1', 'GET', '127.0.0.1', '[]', '2020-08-13 09:09:20', '2020-08-13 09:09:20');
INSERT INTO `admin_operation_log` VALUES (1224, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-13 09:09:40', '2020-08-13 09:09:40');
INSERT INTO `admin_operation_log` VALUES (1225, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 09:09:56', '2020-08-13 09:09:56');
INSERT INTO `admin_operation_log` VALUES (1226, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 09:12:54', '2020-08-13 09:12:54');
INSERT INTO `admin_operation_log` VALUES (1227, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 14:26:11', '2020-08-13 14:26:11');
INSERT INTO `admin_operation_log` VALUES (1228, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 14:29:08', '2020-08-13 14:29:08');
INSERT INTO `admin_operation_log` VALUES (1229, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 14:29:23', '2020-08-13 14:29:23');
INSERT INTO `admin_operation_log` VALUES (1230, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 14:40:29', '2020-08-13 14:40:29');
INSERT INTO `admin_operation_log` VALUES (1231, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",\"4\",null],\"permission\":null,\"_token\":\"PNww6hNzG2rjR29ufPjxKpfn75VessnPLPzXprPD\"}', '2020-08-13 14:40:50', '2020-08-13 14:40:50');
INSERT INTO `admin_operation_log` VALUES (1232, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-13 14:40:51', '2020-08-13 14:40:51');
INSERT INTO `admin_operation_log` VALUES (1233, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 17:37:13', '2020-08-13 17:37:13');
INSERT INTO `admin_operation_log` VALUES (1234, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 17:38:15', '2020-08-13 17:38:15');
INSERT INTO `admin_operation_log` VALUES (1235, 1, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 17:38:18', '2020-08-13 17:38:18');
INSERT INTO `admin_operation_log` VALUES (1236, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 17:38:22', '2020-08-13 17:38:22');
INSERT INTO `admin_operation_log` VALUES (1237, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:32:52', '2020-08-13 20:32:52');
INSERT INTO `admin_operation_log` VALUES (1238, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"23\",\"title\":\"\\u8ba2\\u5355\\u8d39\\u7528\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/orders-renew-log\",\"roles\":[\"1\",\"4\",null],\"permission\":null,\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\"}', '2020-08-13 20:33:59', '2020-08-13 20:33:59');
INSERT INTO `admin_operation_log` VALUES (1239, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-13 20:34:00', '2020-08-13 20:34:00');
INSERT INTO `admin_operation_log` VALUES (1240, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-13 20:34:19', '2020-08-13 20:34:19');
INSERT INTO `admin_operation_log` VALUES (1241, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":6},{\\\"id\\\":7},{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5}]},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":22},{\\\"id\\\":17},{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":16}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":18}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":21}]},{\\\"id\\\":23,\\\"children\\\":[{\\\"id\\\":24}]}]\"}', '2020-08-13 20:34:31', '2020-08-13 20:34:31');
INSERT INTO `admin_operation_log` VALUES (1242, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:34:32', '2020-08-13 20:34:32');
INSERT INTO `admin_operation_log` VALUES (1243, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-13 20:34:35', '2020-08-13 20:34:35');
INSERT INTO `admin_operation_log` VALUES (1244, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-13 20:35:13', '2020-08-13 20:35:13');
INSERT INTO `admin_operation_log` VALUES (1245, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:38:28', '2020-08-13 20:38:28');
INSERT INTO `admin_operation_log` VALUES (1246, 1, 'admin/auth/menu/24/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:38:50', '2020-08-13 20:38:50');
INSERT INTO `admin_operation_log` VALUES (1247, 1, 'admin/auth/menu/24', 'PUT', '127.0.0.1', '{\"parent_id\":\"23\",\"title\":\"\\u8ba2\\u5355\\u7eed\\u8d39\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/orders-renew-log\",\"roles\":[\"1\",\"4\",null],\"permission\":null,\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-13 20:39:07', '2020-08-13 20:39:07');
INSERT INTO `admin_operation_log` VALUES (1248, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-13 20:39:08', '2020-08-13 20:39:08');
INSERT INTO `admin_operation_log` VALUES (1249, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-13 20:41:15', '2020-08-13 20:41:15');
INSERT INTO `admin_operation_log` VALUES (1250, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:41:19', '2020-08-13 20:41:19');
INSERT INTO `admin_operation_log` VALUES (1251, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-13 20:48:45', '2020-08-13 20:48:45');
INSERT INTO `admin_operation_log` VALUES (1252, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-13 20:49:21', '2020-08-13 20:49:21');
INSERT INTO `admin_operation_log` VALUES (1253, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-13 20:49:33', '2020-08-13 20:49:33');
INSERT INTO `admin_operation_log` VALUES (1254, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-13 20:52:39', '2020-08-13 20:52:39');
INSERT INTO `admin_operation_log` VALUES (1255, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:53:39', '2020-08-13 20:53:39');
INSERT INTO `admin_operation_log` VALUES (1256, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:53:40', '2020-08-13 20:53:40');
INSERT INTO `admin_operation_log` VALUES (1257, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:53:50', '2020-08-13 20:53:50');
INSERT INTO `admin_operation_log` VALUES (1258, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:53:52', '2020-08-13 20:53:52');
INSERT INTO `admin_operation_log` VALUES (1259, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:53:55', '2020-08-13 20:53:55');
INSERT INTO `admin_operation_log` VALUES (1260, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"http_method\":[null],\"http_path\":\"\\/orders-renew-log*\\r\\n\\/order-payment-log*\",\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-13 20:55:05', '2020-08-13 20:55:05');
INSERT INTO `admin_operation_log` VALUES (1261, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-13 20:55:06', '2020-08-13 20:55:06');
INSERT INTO `admin_operation_log` VALUES (1262, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:55:08', '2020-08-13 20:55:08');
INSERT INTO `admin_operation_log` VALUES (1263, 1, 'admin/auth/roles/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:55:12', '2020-08-13 20:55:12');
INSERT INTO `admin_operation_log` VALUES (1264, 1, 'admin/auth/roles/4', 'PUT', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",null],\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-13 20:55:15', '2020-08-13 20:55:15');
INSERT INTO `admin_operation_log` VALUES (1265, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-13 20:55:16', '2020-08-13 20:55:16');
INSERT INTO `admin_operation_log` VALUES (1266, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:58:59', '2020-08-13 20:58:59');
INSERT INTO `admin_operation_log` VALUES (1267, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 20:59:15', '2020-08-13 20:59:15');
INSERT INTO `admin_operation_log` VALUES (1268, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2020-08-13 21:00:54', '2020-08-13 21:00:54');
INSERT INTO `admin_operation_log` VALUES (1269, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-13 21:15:05', '2020-08-13 21:15:05');
INSERT INTO `admin_operation_log` VALUES (1270, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-13 21:15:11', '2020-08-13 21:15:11');
INSERT INTO `admin_operation_log` VALUES (1271, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 21:22:40', '2020-08-13 21:22:40');
INSERT INTO `admin_operation_log` VALUES (1272, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 21:24:48', '2020-08-13 21:24:48');
INSERT INTO `admin_operation_log` VALUES (1273, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 21:35:41', '2020-08-13 21:35:41');
INSERT INTO `admin_operation_log` VALUES (1274, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 21:37:49', '2020-08-13 21:37:49');
INSERT INTO `admin_operation_log` VALUES (1275, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-13 21:40:56', '2020-08-13 21:40:56');
INSERT INTO `admin_operation_log` VALUES (1276, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-13 21:41:24', '2020-08-13 21:41:24');
INSERT INTO `admin_operation_log` VALUES (1277, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-13 21:43:38', '2020-08-13 21:43:38');
INSERT INTO `admin_operation_log` VALUES (1278, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 21:59:39', '2020-08-13 21:59:39');
INSERT INTO `admin_operation_log` VALUES (1279, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:01:21', '2020-08-13 22:01:21');
INSERT INTO `admin_operation_log` VALUES (1280, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:01:37', '2020-08-13 22:01:37');
INSERT INTO `admin_operation_log` VALUES (1281, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:01:48', '2020-08-13 22:01:48');
INSERT INTO `admin_operation_log` VALUES (1282, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:03:33', '2020-08-13 22:03:33');
INSERT INTO `admin_operation_log` VALUES (1283, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:03:43', '2020-08-13 22:03:43');
INSERT INTO `admin_operation_log` VALUES (1284, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:04:03', '2020-08-13 22:04:03');
INSERT INTO `admin_operation_log` VALUES (1285, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:04:08', '2020-08-13 22:04:08');
INSERT INTO `admin_operation_log` VALUES (1286, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-13 22:05:50', '2020-08-13 22:05:50');
INSERT INTO `admin_operation_log` VALUES (1287, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:04:08\",\"end_time\":\"2020-08-13 22:04:08\",\"admin_user_id\":\"1\",\"sales_remark\":\"\\u6d4b\\u8bd5\",\"price\":\"323\",\"receivable\":null,\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-08-13 22:06:21', '2020-08-13 22:06:21');
INSERT INTO `admin_operation_log` VALUES (1288, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-13 22:06:23', '2020-08-13 22:06:23');
INSERT INTO `admin_operation_log` VALUES (1289, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:07:23', '2020-08-13 22:07:23');
INSERT INTO `admin_operation_log` VALUES (1290, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:08:19', '2020-08-13 22:08:19');
INSERT INTO `admin_operation_log` VALUES (1291, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-13 22:08:21', '2020-08-13 22:08:21');
INSERT INTO `admin_operation_log` VALUES (1292, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-08-13 22:08:19\",\"end_time\":\"2020-08-13 22:08:19\",\"admin_user_id\":\"1\",\"sales_remark\":\"\\u6d4b\\u8bd5\",\"price\":\"323\",\"receivable\":null,\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-08-13 22:08:42', '2020-08-13 22:08:42');
INSERT INTO `admin_operation_log` VALUES (1293, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:08:51', '2020-08-13 22:08:51');
INSERT INTO `admin_operation_log` VALUES (1294, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-13 22:09:21', '2020-08-13 22:09:21');
INSERT INTO `admin_operation_log` VALUES (1295, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-08-13 22:08:51\",\"end_time\":\"2020-08-13 22:08:51\",\"admin_user_id\":\"1\",\"sales_remark\":\"\\u6d4b\\u8bd5\",\"price\":\"323\",\"receivable\":null,\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\"}', '2020-08-13 22:09:58', '2020-08-13 22:09:58');
INSERT INTO `admin_operation_log` VALUES (1296, 1, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-13 22:09:59', '2020-08-13 22:09:59');
INSERT INTO `admin_operation_log` VALUES (1297, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"3\",\"start_time\":\"2020-08-13 22:08:51\",\"end_time\":\"2020-08-13 22:08:51\",\"admin_user_id\":\"1\",\"sales_remark\":\"\\u6d4b\\u8bd5\",\"price\":\"323\",\"receivable\":\"4800\",\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\"}', '2020-08-13 22:10:57', '2020-08-13 22:10:57');
INSERT INTO `admin_operation_log` VALUES (1298, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:10:58', '2020-08-13 22:10:58');
INSERT INTO `admin_operation_log` VALUES (1299, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:11:03', '2020-08-13 22:11:03');
INSERT INTO `admin_operation_log` VALUES (1300, 1, 'admin/orders/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:11:09', '2020-08-13 22:11:09');
INSERT INTO `admin_operation_log` VALUES (1301, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:13:15', '2020-08-13 22:13:15');
INSERT INTO `admin_operation_log` VALUES (1302, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:14:11', '2020-08-13 22:14:11');
INSERT INTO `admin_operation_log` VALUES (1303, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-13 22:14:14', '2020-08-13 22:14:14');
INSERT INTO `admin_operation_log` VALUES (1304, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"end_time\":\"2020-08-13 22:14:11\",\"admin_user_id\":\"1\",\"sales_remark\":null,\"price\":\"323\",\"receivable\":\"4800\",\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"TzmAM3ySyuYJqYJIk7dWt8qlkr7IVtkQ4CgW6UtX\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-08-13 22:14:35', '2020-08-13 22:14:35');
INSERT INTO `admin_operation_log` VALUES (1305, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:14:36', '2020-08-13 22:14:36');
INSERT INTO `admin_operation_log` VALUES (1306, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:14:51', '2020-08-13 22:14:51');
INSERT INTO `admin_operation_log` VALUES (1307, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-13 22:16:47', '2020-08-13 22:16:47');
INSERT INTO `admin_operation_log` VALUES (1308, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:17:08', '2020-08-13 22:17:08');
INSERT INTO `admin_operation_log` VALUES (1309, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-13 22:17:51', '2020-08-13 22:17:51');
INSERT INTO `admin_operation_log` VALUES (1310, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:17:55', '2020-08-13 22:17:55');
INSERT INTO `admin_operation_log` VALUES (1311, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-13 22:18:07', '2020-08-13 22:18:07');
INSERT INTO `admin_operation_log` VALUES (1312, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-13 22:19:35', '2020-08-13 22:19:35');
INSERT INTO `admin_operation_log` VALUES (1313, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-13 22:20:28', '2020-08-13 22:20:28');
INSERT INTO `admin_operation_log` VALUES (1314, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-13 22:21:48', '2020-08-13 22:21:48');
INSERT INTO `admin_operation_log` VALUES (1315, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-13 22:23:21', '2020-08-13 22:23:21');
INSERT INTO `admin_operation_log` VALUES (1316, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:23:29', '2020-08-13 22:23:29');
INSERT INTO `admin_operation_log` VALUES (1317, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:23:31', '2020-08-13 22:23:31');
INSERT INTO `admin_operation_log` VALUES (1318, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:23:39', '2020-08-13 22:23:39');
INSERT INTO `admin_operation_log` VALUES (1319, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:23:45', '2020-08-13 22:23:45');
INSERT INTO `admin_operation_log` VALUES (1320, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:23:50', '2020-08-13 22:23:50');
INSERT INTO `admin_operation_log` VALUES (1321, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:23:54', '2020-08-13 22:23:54');
INSERT INTO `admin_operation_log` VALUES (1322, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:23:58', '2020-08-13 22:23:58');
INSERT INTO `admin_operation_log` VALUES (1323, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:24:04', '2020-08-13 22:24:04');
INSERT INTO `admin_operation_log` VALUES (1324, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:24:10', '2020-08-13 22:24:10');
INSERT INTO `admin_operation_log` VALUES (1325, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-13 22:25:11', '2020-08-13 22:25:11');
INSERT INTO `admin_operation_log` VALUES (1326, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:35:08', '2020-08-13 22:35:08');
INSERT INTO `admin_operation_log` VALUES (1327, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-13 22:35:13', '2020-08-13 22:35:13');
INSERT INTO `admin_operation_log` VALUES (1328, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-14 09:40:40', '2020-08-14 09:40:40');
INSERT INTO `admin_operation_log` VALUES (1329, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:07:58', '2020-08-14 10:07:58');
INSERT INTO `admin_operation_log` VALUES (1330, 1, 'admin/orders/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 10:08:10', '2020-08-14 10:08:10');
INSERT INTO `admin_operation_log` VALUES (1331, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:08:11', '2020-08-14 10:08:11');
INSERT INTO `admin_operation_log` VALUES (1332, 1, 'admin/orders/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 10:08:16', '2020-08-14 10:08:16');
INSERT INTO `admin_operation_log` VALUES (1333, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:08:16', '2020-08-14 10:08:16');
INSERT INTO `admin_operation_log` VALUES (1334, 1, 'admin/orders/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 10:08:22', '2020-08-14 10:08:22');
INSERT INTO `admin_operation_log` VALUES (1335, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:08:23', '2020-08-14 10:08:23');
INSERT INTO `admin_operation_log` VALUES (1336, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:10:06', '2020-08-14 10:10:06');
INSERT INTO `admin_operation_log` VALUES (1337, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 10:19:00', '2020-08-14 10:19:00');
INSERT INTO `admin_operation_log` VALUES (1338, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:19:23', '2020-08-14 10:19:23');
INSERT INTO `admin_operation_log` VALUES (1339, 1, 'admin/orders-renew-log/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:19:29', '2020-08-14 10:19:29');
INSERT INTO `admin_operation_log` VALUES (1340, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:19:38', '2020-08-14 10:19:38');
INSERT INTO `admin_operation_log` VALUES (1341, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:19:46', '2020-08-14 10:19:46');
INSERT INTO `admin_operation_log` VALUES (1342, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:20:02', '2020-08-14 10:20:02');
INSERT INTO `admin_operation_log` VALUES (1343, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:20:05', '2020-08-14 10:20:05');
INSERT INTO `admin_operation_log` VALUES (1344, 1, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-14 10:20:08', '2020-08-14 10:20:08');
INSERT INTO `admin_operation_log` VALUES (1345, 1, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-08-14 10:20:05\",\"end_time\":\"2020-08-14 10:20:05\",\"admin_user_id\":\"1\",\"sales_remark\":null,\"price\":\"323\",\"receivable\":\"323\",\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-08-14 10:20:33', '2020-08-14 10:20:33');
INSERT INTO `admin_operation_log` VALUES (1346, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 10:20:34', '2020-08-14 10:20:34');
INSERT INTO `admin_operation_log` VALUES (1347, 1, 'admin/orders/5', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 10:20:39', '2020-08-14 10:20:39');
INSERT INTO `admin_operation_log` VALUES (1348, 1, 'admin/orders/5', 'GET', '127.0.0.1', '[]', '2020-08-14 10:21:36', '2020-08-14 10:21:36');
INSERT INTO `admin_operation_log` VALUES (1349, 1, 'admin/orders/5', 'GET', '127.0.0.1', '[]', '2020-08-14 10:21:50', '2020-08-14 10:21:50');
INSERT INTO `admin_operation_log` VALUES (1350, 1, 'admin/orders/5', 'GET', '127.0.0.1', '[]', '2020-08-14 10:22:02', '2020-08-14 10:22:02');
INSERT INTO `admin_operation_log` VALUES (1351, 1, 'admin/orders/5', 'GET', '127.0.0.1', '[]', '2020-08-14 10:22:55', '2020-08-14 10:22:55');
INSERT INTO `admin_operation_log` VALUES (1352, 1, 'admin/orders/5', 'GET', '127.0.0.1', '[]', '2020-08-14 10:23:15', '2020-08-14 10:23:15');
INSERT INTO `admin_operation_log` VALUES (1353, 1, 'admin/orders/5', 'GET', '127.0.0.1', '[]', '2020-08-14 11:18:36', '2020-08-14 11:18:36');
INSERT INTO `admin_operation_log` VALUES (1354, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:20:10', '2020-08-14 11:20:10');
INSERT INTO `admin_operation_log` VALUES (1355, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-14 11:21:08', '2020-08-14 11:21:08');
INSERT INTO `admin_operation_log` VALUES (1356, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-14 11:21:32', '2020-08-14 11:21:32');
INSERT INTO `admin_operation_log` VALUES (1357, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-14 11:21:56', '2020-08-14 11:21:56');
INSERT INTO `admin_operation_log` VALUES (1358, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:23:31', '2020-08-14 11:23:31');
INSERT INTO `admin_operation_log` VALUES (1359, 1, 'admin/orders-renew-log/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:23:38', '2020-08-14 11:23:38');
INSERT INTO `admin_operation_log` VALUES (1360, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:23:43', '2020-08-14 11:23:43');
INSERT INTO `admin_operation_log` VALUES (1361, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:23:49', '2020-08-14 11:23:49');
INSERT INTO `admin_operation_log` VALUES (1362, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:23:52', '2020-08-14 11:23:52');
INSERT INTO `admin_operation_log` VALUES (1363, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:25:04', '2020-08-14 11:25:04');
INSERT INTO `admin_operation_log` VALUES (1364, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:25:48', '2020-08-14 11:25:48');
INSERT INTO `admin_operation_log` VALUES (1365, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:25:51', '2020-08-14 11:25:51');
INSERT INTO `admin_operation_log` VALUES (1366, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:26:01', '2020-08-14 11:26:01');
INSERT INTO `admin_operation_log` VALUES (1367, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"customer_title\":\"\\u4e2d\\u5149\\u81ea\\u7528\",\"3\":\"\\u63a8\\u5e7f\\u7248\",\"4\":\"www.erea.com\",\"5\":\"\\u5426\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 11:26:17', '2020-08-14 11:26:17');
INSERT INTO `admin_operation_log` VALUES (1368, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 11:26:17', '2020-08-14 11:26:17');
INSERT INTO `admin_operation_log` VALUES (1369, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 11:26:41', '2020-08-14 11:26:41');
INSERT INTO `admin_operation_log` VALUES (1370, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:26:49', '2020-08-14 11:26:49');
INSERT INTO `admin_operation_log` VALUES (1371, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"customer_title\":\"\\u4e2d\\u5149\\u81ea\\u7528\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"\\u6d4b\\u8bd5\",\"5\":\"\\u5426\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 11:26:55', '2020-08-14 11:26:55');
INSERT INTO `admin_operation_log` VALUES (1372, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 11:26:56', '2020-08-14 11:26:56');
INSERT INTO `admin_operation_log` VALUES (1373, 1, 'admin/orders-details/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:28:57', '2020-08-14 11:28:57');
INSERT INTO `admin_operation_log` VALUES (1374, 1, 'admin/orders-details', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"customer_title\":\"\\u4e2d\\u5149\\u81ea\\u7528\",\"3\":\"\\u6807\\u51c6\\u7248\",\"4\":\"www.erea.com\",\"5\":\"\\u5426\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 11:29:02', '2020-08-14 11:29:02');
INSERT INTO `admin_operation_log` VALUES (1375, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:30:47', '2020-08-14 11:30:47');
INSERT INTO `admin_operation_log` VALUES (1376, 1, 'admin/orders/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:30:56', '2020-08-14 11:30:56');
INSERT INTO `admin_operation_log` VALUES (1377, 1, 'admin/orders/5/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 11:32:39', '2020-08-14 11:32:39');
INSERT INTO `admin_operation_log` VALUES (1378, 1, 'admin/orders/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"1\",\"product_id\":\"2\",\"start_time\":\"2020-08-14 10:20:05\",\"end_time\":\"2020-08-14 10:20:05\",\"admin_user_id\":\"1\",\"sales_remark\":null,\"price\":\"323\",\"receivable\":\"323\",\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"commerce_status\":\"0\",\"commerce_remark\":null,\"commerce_user_id\":\"1\",\"finance_status\":\"0\",\"finance_remark\":null,\"finance_user_id\":\"1\",\"it_status\":\"0\",\"it_remark\":null,\"it_user_id\":\"1\",\"check_status\":\"2\",\"check_remark\":null,\"check_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\\/4\"}', '2020-08-14 11:44:16', '2020-08-14 11:44:16');
INSERT INTO `admin_operation_log` VALUES (1379, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 11:44:17', '2020-08-14 11:44:17');
INSERT INTO `admin_operation_log` VALUES (1380, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:44:22', '2020-08-14 11:44:22');
INSERT INTO `admin_operation_log` VALUES (1381, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 11:46:10', '2020-08-14 11:46:10');
INSERT INTO `admin_operation_log` VALUES (1382, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 11:46:15', '2020-08-14 11:46:15');
INSERT INTO `admin_operation_log` VALUES (1383, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 11:52:55', '2020-08-14 11:52:55');
INSERT INTO `admin_operation_log` VALUES (1384, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 11:53:16', '2020-08-14 11:53:16');
INSERT INTO `admin_operation_log` VALUES (1385, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:00:42', '2020-08-14 12:00:42');
INSERT INTO `admin_operation_log` VALUES (1386, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:02:01', '2020-08-14 12:02:01');
INSERT INTO `admin_operation_log` VALUES (1387, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 12:15:01', '2020-08-14 12:15:01');
INSERT INTO `admin_operation_log` VALUES (1388, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:15:06', '2020-08-14 12:15:06');
INSERT INTO `admin_operation_log` VALUES (1389, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 12:15:07', '2020-08-14 12:15:07');
INSERT INTO `admin_operation_log` VALUES (1390, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 12:15:26', '2020-08-14 12:15:26');
INSERT INTO `admin_operation_log` VALUES (1391, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:15:32', '2020-08-14 12:15:32');
INSERT INTO `admin_operation_log` VALUES (1392, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:15:54', '2020-08-14 12:15:54');
INSERT INTO `admin_operation_log` VALUES (1393, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:16:00', '2020-08-14 12:16:00');
INSERT INTO `admin_operation_log` VALUES (1394, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:16:52', '2020-08-14 12:16:52');
INSERT INTO `admin_operation_log` VALUES (1395, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:21:07', '2020-08-14 12:21:07');
INSERT INTO `admin_operation_log` VALUES (1396, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:23:57', '2020-08-14 12:23:57');
INSERT INTO `admin_operation_log` VALUES (1397, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:24:16', '2020-08-14 12:24:16');
INSERT INTO `admin_operation_log` VALUES (1398, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:25:49', '2020-08-14 12:25:49');
INSERT INTO `admin_operation_log` VALUES (1399, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:26:04', '2020-08-14 12:26:04');
INSERT INTO `admin_operation_log` VALUES (1400, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 12:26:14', '2020-08-14 12:26:14');
INSERT INTO `admin_operation_log` VALUES (1401, 1, 'admin/orders-details/4', 'PUT', '127.0.0.1', '{\"orders_id\":\"4\",\"params_id\":\"3\",\"value\":\"\\u6807\\u51c6\\u7248\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\"}', '2020-08-14 12:29:33', '2020-08-14 12:29:33');
INSERT INTO `admin_operation_log` VALUES (1402, 1, 'admin/orders-details/4', 'GET', '127.0.0.1', '[]', '2020-08-14 12:30:00', '2020-08-14 12:30:00');
INSERT INTO `admin_operation_log` VALUES (1403, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:30:07', '2020-08-14 12:30:07');
INSERT INTO `admin_operation_log` VALUES (1404, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:30:10', '2020-08-14 12:30:10');
INSERT INTO `admin_operation_log` VALUES (1405, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:30:14', '2020-08-14 12:30:14');
INSERT INTO `admin_operation_log` VALUES (1406, 1, 'admin/orders-details/4', 'PUT', '127.0.0.1', '{\"orders_id\":\"4\",\"params_id\":\"3\",\"value\":\"\\u63a8\\u5e7f\\u7248\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\"}', '2020-08-14 12:30:22', '2020-08-14 12:30:22');
INSERT INTO `admin_operation_log` VALUES (1407, 1, 'admin/orders-details/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:41:58', '2020-08-14 12:41:58');
INSERT INTO `admin_operation_log` VALUES (1408, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:42:33', '2020-08-14 12:42:33');
INSERT INTO `admin_operation_log` VALUES (1409, 1, 'admin/orders-details/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:42:45', '2020-08-14 12:42:45');
INSERT INTO `admin_operation_log` VALUES (1410, 1, 'admin/orders-details/5', 'PUT', '127.0.0.1', '{\"orders_id\":\"4\",\"params_id\":\"4\",\"value\":\"www.baidu.com\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\"}', '2020-08-14 12:42:54', '2020-08-14 12:42:54');
INSERT INTO `admin_operation_log` VALUES (1411, 1, 'admin/orders-details/5', 'GET', '127.0.0.1', '[]', '2020-08-14 12:42:55', '2020-08-14 12:42:55');
INSERT INTO `admin_operation_log` VALUES (1412, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:43:04', '2020-08-14 12:43:04');
INSERT INTO `admin_operation_log` VALUES (1413, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:43:07', '2020-08-14 12:43:07');
INSERT INTO `admin_operation_log` VALUES (1414, 1, 'admin/orders-details/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:43:30', '2020-08-14 12:43:30');
INSERT INTO `admin_operation_log` VALUES (1415, 1, 'admin/orders-details/5', 'PUT', '127.0.0.1', '{\"orders_id\":\"4\",\"params_id\":\"4\",\"value\":\"www.baidu.cn\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\"}', '2020-08-14 12:43:47', '2020-08-14 12:43:47');
INSERT INTO `admin_operation_log` VALUES (1416, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 12:43:48', '2020-08-14 12:43:48');
INSERT INTO `admin_operation_log` VALUES (1417, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:45:59', '2020-08-14 12:45:59');
INSERT INTO `admin_operation_log` VALUES (1418, 1, 'admin/orders-renew-log/1', 'GET', '127.0.0.1', '[]', '2020-08-14 12:46:01', '2020-08-14 12:46:01');
INSERT INTO `admin_operation_log` VALUES (1419, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:46:41', '2020-08-14 12:46:41');
INSERT INTO `admin_operation_log` VALUES (1420, 1, 'admin/orders-renew-log/1', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 12:46:50', '2020-08-14 12:46:50');
INSERT INTO `admin_operation_log` VALUES (1421, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:46:51', '2020-08-14 12:46:51');
INSERT INTO `admin_operation_log` VALUES (1422, 1, 'admin/orders-renew-log/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:46:57', '2020-08-14 12:46:57');
INSERT INTO `admin_operation_log` VALUES (1423, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:47:01', '2020-08-14 12:47:01');
INSERT INTO `admin_operation_log` VALUES (1424, 1, 'admin/orders/5', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:47:06', '2020-08-14 12:47:06');
INSERT INTO `admin_operation_log` VALUES (1425, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:47:13', '2020-08-14 12:47:13');
INSERT INTO `admin_operation_log` VALUES (1426, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:47:18', '2020-08-14 12:47:18');
INSERT INTO `admin_operation_log` VALUES (1427, 1, 'admin/orders/5', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 12:47:22', '2020-08-14 12:47:22');
INSERT INTO `admin_operation_log` VALUES (1428, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:47:23', '2020-08-14 12:47:23');
INSERT INTO `admin_operation_log` VALUES (1429, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:47:26', '2020-08-14 12:47:26');
INSERT INTO `admin_operation_log` VALUES (1430, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:48:19', '2020-08-14 12:48:19');
INSERT INTO `admin_operation_log` VALUES (1431, 1, 'admin/orders-renew-log/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 12:48:25', '2020-08-14 12:48:25');
INSERT INTO `admin_operation_log` VALUES (1432, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:48:25', '2020-08-14 12:48:25');
INSERT INTO `admin_operation_log` VALUES (1433, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:48:30', '2020-08-14 12:48:30');
INSERT INTO `admin_operation_log` VALUES (1434, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 12:48:34', '2020-08-14 12:48:34');
INSERT INTO `admin_operation_log` VALUES (1435, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 13:15:00', '2020-08-14 13:15:00');
INSERT INTO `admin_operation_log` VALUES (1436, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 13:15:20', '2020-08-14 13:15:20');
INSERT INTO `admin_operation_log` VALUES (1437, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 13:15:43', '2020-08-14 13:15:43');
INSERT INTO `admin_operation_log` VALUES (1438, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 13:16:58', '2020-08-14 13:16:58');
INSERT INTO `admin_operation_log` VALUES (1439, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 13:17:11', '2020-08-14 13:17:11');
INSERT INTO `admin_operation_log` VALUES (1440, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:24:18', '2020-08-14 13:24:18');
INSERT INTO `admin_operation_log` VALUES (1441, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"23\",\"title\":\"\\u6536\\u6b3e\\u65b9\\u5f0f\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/pay-type\",\"roles\":[\"1\",\"4\",null],\"permission\":null,\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 13:24:51', '2020-08-14 13:24:51');
INSERT INTO `admin_operation_log` VALUES (1442, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-14 13:24:52', '2020-08-14 13:24:52');
INSERT INTO `admin_operation_log` VALUES (1443, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:25:00', '2020-08-14 13:25:00');
INSERT INTO `admin_operation_log` VALUES (1444, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:25:02', '2020-08-14 13:25:02');
INSERT INTO `admin_operation_log` VALUES (1445, 1, 'admin/auth/permissions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:25:05', '2020-08-14 13:25:05');
INSERT INTO `admin_operation_log` VALUES (1446, 1, 'admin/auth/permissions/6', 'PUT', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"http_method\":[null],\"http_path\":\"\\/orders-renew-log*\\r\\n\\/order-payment-log*\\r\\n\\/pay-type*\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-14 13:25:17', '2020-08-14 13:25:17');
INSERT INTO `admin_operation_log` VALUES (1447, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-14 13:25:17', '2020-08-14 13:25:17');
INSERT INTO `admin_operation_log` VALUES (1448, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-14 13:25:22', '2020-08-14 13:25:22');
INSERT INTO `admin_operation_log` VALUES (1449, 1, 'admin/pay-type', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:25:26', '2020-08-14 13:25:26');
INSERT INTO `admin_operation_log` VALUES (1450, 1, 'admin/pay-type/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:25:30', '2020-08-14 13:25:30');
INSERT INTO `admin_operation_log` VALUES (1451, 1, 'admin/pay-type', 'POST', '127.0.0.1', '{\"title\":\"\\u652f\\u4ed8\\u5b9d\",\"number\":\"12343253456464\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/pay-type\"}', '2020-08-14 13:25:40', '2020-08-14 13:25:40');
INSERT INTO `admin_operation_log` VALUES (1452, 1, 'admin/pay-type', 'GET', '127.0.0.1', '[]', '2020-08-14 13:25:40', '2020-08-14 13:25:40');
INSERT INTO `admin_operation_log` VALUES (1453, 1, 'admin/pay-type/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:25:44', '2020-08-14 13:25:44');
INSERT INTO `admin_operation_log` VALUES (1454, 1, 'admin/pay-type/1', 'PUT', '127.0.0.1', '{\"title\":\"\\u652f\\u4ed8\\u5b9d\",\"number\":\"123432534564888\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/pay-type\"}', '2020-08-14 13:25:48', '2020-08-14 13:25:48');
INSERT INTO `admin_operation_log` VALUES (1455, 1, 'admin/pay-type', 'GET', '127.0.0.1', '[]', '2020-08-14 13:25:49', '2020-08-14 13:25:49');
INSERT INTO `admin_operation_log` VALUES (1456, 1, 'admin/pay-type/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:25:53', '2020-08-14 13:25:53');
INSERT INTO `admin_operation_log` VALUES (1457, 1, 'admin/pay-type', 'POST', '127.0.0.1', '{\"title\":\"\\u5fae\\u4fe1\",\"number\":\"2343253453245243\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/pay-type\"}', '2020-08-14 13:25:59', '2020-08-14 13:25:59');
INSERT INTO `admin_operation_log` VALUES (1458, 1, 'admin/pay-type', 'GET', '127.0.0.1', '[]', '2020-08-14 13:26:00', '2020-08-14 13:26:00');
INSERT INTO `admin_operation_log` VALUES (1459, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:26:11', '2020-08-14 13:26:11');
INSERT INTO `admin_operation_log` VALUES (1460, 1, 'admin/orders-renew-log/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:26:15', '2020-08-14 13:26:15');
INSERT INTO `admin_operation_log` VALUES (1461, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:29:14', '2020-08-14 13:29:14');
INSERT INTO `admin_operation_log` VALUES (1462, 1, 'admin/orders-renew-log/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:35:53', '2020-08-14 13:35:53');
INSERT INTO `admin_operation_log` VALUES (1463, 1, 'admin/pay-type', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:36:02', '2020-08-14 13:36:02');
INSERT INTO `admin_operation_log` VALUES (1464, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:36:05', '2020-08-14 13:36:05');
INSERT INTO `admin_operation_log` VALUES (1465, 1, 'admin/orders/4', 'PUT', '127.0.0.1', '{\"name\":\"orders_status.finance_status\",\"value\":\"2\",\"pk\":\"4\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2020-08-14 13:37:05', '2020-08-14 13:37:05');
INSERT INTO `admin_operation_log` VALUES (1466, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:37:07', '2020-08-14 13:37:07');
INSERT INTO `admin_operation_log` VALUES (1467, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 13:41:57', '2020-08-14 13:41:57');
INSERT INTO `admin_operation_log` VALUES (1468, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:42:35', '2020-08-14 13:42:35');
INSERT INTO `admin_operation_log` VALUES (1469, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:42:55', '2020-08-14 13:42:55');
INSERT INTO `admin_operation_log` VALUES (1470, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:49:03', '2020-08-14 13:49:03');
INSERT INTO `admin_operation_log` VALUES (1471, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:50:02', '2020-08-14 13:50:02');
INSERT INTO `admin_operation_log` VALUES (1472, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:52:27', '2020-08-14 13:52:27');
INSERT INTO `admin_operation_log` VALUES (1473, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:52:49', '2020-08-14 13:52:49');
INSERT INTO `admin_operation_log` VALUES (1474, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:55:09', '2020-08-14 13:55:09');
INSERT INTO `admin_operation_log` VALUES (1475, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:55:19', '2020-08-14 13:55:19');
INSERT INTO `admin_operation_log` VALUES (1476, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:57:01', '2020-08-14 13:57:01');
INSERT INTO `admin_operation_log` VALUES (1477, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 13:57:34', '2020-08-14 13:57:34');
INSERT INTO `admin_operation_log` VALUES (1478, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:01:19', '2020-08-14 14:01:19');
INSERT INTO `admin_operation_log` VALUES (1479, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:02:32', '2020-08-14 14:02:32');
INSERT INTO `admin_operation_log` VALUES (1480, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:06:22', '2020-08-14 14:06:22');
INSERT INTO `admin_operation_log` VALUES (1481, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:06:49', '2020-08-14 14:06:49');
INSERT INTO `admin_operation_log` VALUES (1482, 1, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:06:53', '2020-08-14 14:06:53');
INSERT INTO `admin_operation_log` VALUES (1483, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:07:46', '2020-08-14 14:07:46');
INSERT INTO `admin_operation_log` VALUES (1484, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:08:09', '2020-08-14 14:08:09');
INSERT INTO `admin_operation_log` VALUES (1485, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:08:25', '2020-08-14 14:08:25');
INSERT INTO `admin_operation_log` VALUES (1486, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:08:33', '2020-08-14 14:08:33');
INSERT INTO `admin_operation_log` VALUES (1487, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:10:00', '2020-08-14 14:10:00');
INSERT INTO `admin_operation_log` VALUES (1488, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:10:06', '2020-08-14 14:10:06');
INSERT INTO `admin_operation_log` VALUES (1489, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:19:57', '2020-08-14 14:19:57');
INSERT INTO `admin_operation_log` VALUES (1490, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:20:22', '2020-08-14 14:20:22');
INSERT INTO `admin_operation_log` VALUES (1491, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:20:29', '2020-08-14 14:20:29');
INSERT INTO `admin_operation_log` VALUES (1492, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:21:25', '2020-08-14 14:21:25');
INSERT INTO `admin_operation_log` VALUES (1493, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:21:32', '2020-08-14 14:21:32');
INSERT INTO `admin_operation_log` VALUES (1494, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:22:05', '2020-08-14 14:22:05');
INSERT INTO `admin_operation_log` VALUES (1495, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:22:44', '2020-08-14 14:22:44');
INSERT INTO `admin_operation_log` VALUES (1496, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:22:57', '2020-08-14 14:22:57');
INSERT INTO `admin_operation_log` VALUES (1497, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-13 22:14:11\",\"end_time\":null,\"receivable\":\"4800\",\"receipts\":\"4800\",\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 14:25:03', '2020-08-14 14:25:03');
INSERT INTO `admin_operation_log` VALUES (1498, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:31:53', '2020-08-14 14:31:53');
INSERT INTO `admin_operation_log` VALUES (1499, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-13 22:14:11\",\"end_time\":\"2020-08-14 00:00:00\",\"receivable\":\"4800\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-renew-log\\/create?orders_id=4\"}', '2020-08-14 14:32:03', '2020-08-14 14:32:03');
INSERT INTO `admin_operation_log` VALUES (1500, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:32:04', '2020-08-14 14:32:04');
INSERT INTO `admin_operation_log` VALUES (1501, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-13 22:14:11\",\"end_time\":\"2020-08-14 00:00:00\",\"receivable\":\"4800\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-renew-log\\/create?orders_id=4\"}', '2020-08-14 14:32:26', '2020-08-14 14:32:26');
INSERT INTO `admin_operation_log` VALUES (1502, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:32:27', '2020-08-14 14:32:27');
INSERT INTO `admin_operation_log` VALUES (1503, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:32:49', '2020-08-14 14:32:49');
INSERT INTO `admin_operation_log` VALUES (1504, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-13 22:14:11\",\"end_time\":\"2020-08-14 00:00:00\",\"receivable\":\"4800\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"owner_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 14:32:55', '2020-08-14 14:32:55');
INSERT INTO `admin_operation_log` VALUES (1505, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:32:56', '2020-08-14 14:32:56');
INSERT INTO `admin_operation_log` VALUES (1506, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:33:11', '2020-08-14 14:33:11');
INSERT INTO `admin_operation_log` VALUES (1507, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-13 22:14:11\",\"end_time\":\"2020-08-14 00:00:00\",\"receivable\":\"4800\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"owner_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 14:33:15', '2020-08-14 14:33:15');
INSERT INTO `admin_operation_log` VALUES (1508, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:33:30', '2020-08-14 14:33:30');
INSERT INTO `admin_operation_log` VALUES (1509, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-13 22:14:11\",\"end_time\":\"2020-08-14 00:00:00\",\"receivable\":\"4800\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"owner_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-renew-log\\/create?orders_id=4\"}', '2020-08-14 14:33:34', '2020-08-14 14:33:34');
INSERT INTO `admin_operation_log` VALUES (1510, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\"}', '2020-08-14 14:33:35', '2020-08-14 14:33:35');
INSERT INTO `admin_operation_log` VALUES (1511, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-13 22:14:11\",\"end_time\":\"2020-08-14 00:00:00\",\"receivable\":\"4800\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"owner_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders-renew-log\\/create?orders_id=4\"}', '2020-08-14 14:34:52', '2020-08-14 14:34:52');
INSERT INTO `admin_operation_log` VALUES (1512, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:34:53', '2020-08-14 14:34:53');
INSERT INTO `admin_operation_log` VALUES (1513, 1, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:35:05', '2020-08-14 14:35:05');
INSERT INTO `admin_operation_log` VALUES (1514, 1, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-14 00:00:00\",\"end_time\":\"2020-08-16 00:00:00\",\"receivable\":\"4800\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"owner_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 14:35:10', '2020-08-14 14:35:10');
INSERT INTO `admin_operation_log` VALUES (1515, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 14:35:11', '2020-08-14 14:35:11');
INSERT INTO `admin_operation_log` VALUES (1516, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:35:19', '2020-08-14 14:35:19');
INSERT INTO `admin_operation_log` VALUES (1517, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"orders_renew_per_page\":\"10\"}', '2020-08-14 14:37:11', '2020-08-14 14:37:11');
INSERT INTO `admin_operation_log` VALUES (1518, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"orders_renew_per_page\":\"10\"}', '2020-08-14 14:38:27', '2020-08-14 14:38:27');
INSERT INTO `admin_operation_log` VALUES (1519, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"orders_renew_per_page\":\"10\"}', '2020-08-14 14:45:44', '2020-08-14 14:45:44');
INSERT INTO `admin_operation_log` VALUES (1520, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"orders_renew_per_page\":\"10\"}', '2020-08-14 14:46:52', '2020-08-14 14:46:52');
INSERT INTO `admin_operation_log` VALUES (1521, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 14:47:00', '2020-08-14 14:47:00');
INSERT INTO `admin_operation_log` VALUES (1522, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\"}', '2020-08-14 14:48:48', '2020-08-14 14:48:48');
INSERT INTO `admin_operation_log` VALUES (1523, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\"}', '2020-08-14 14:50:40', '2020-08-14 14:50:40');
INSERT INTO `admin_operation_log` VALUES (1524, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\"}', '2020-08-14 14:51:12', '2020-08-14 14:51:12');
INSERT INTO `admin_operation_log` VALUES (1525, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\"}', '2020-08-14 15:15:31', '2020-08-14 15:15:31');
INSERT INTO `admin_operation_log` VALUES (1526, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\"}', '2020-08-14 15:18:29', '2020-08-14 15:18:29');
INSERT INTO `admin_operation_log` VALUES (1527, 1, 'admin/order-payment-log', 'POST', '127.0.0.1', '{\"orders_renew_log_id\":\"6\",\"receivable\":\"4800\",\"old_receipts\":\"0\",\"receipts\":\"2800\",\"pay_type_id\":\"2\",\"pay_time\":\"2020-08-14 00:00:00\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 15:22:40', '2020-08-14 15:22:40');
INSERT INTO `admin_operation_log` VALUES (1528, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:29:28', '2020-08-14 15:29:28');
INSERT INTO `admin_operation_log` VALUES (1529, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"orders_renew_per_page\":\"10\"}', '2020-08-14 15:29:30', '2020-08-14 15:29:30');
INSERT INTO `admin_operation_log` VALUES (1530, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 15:29:41', '2020-08-14 15:29:41');
INSERT INTO `admin_operation_log` VALUES (1531, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"6\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:30:57', '2020-08-14 15:30:57');
INSERT INTO `admin_operation_log` VALUES (1532, 1, 'admin/order-payment-log', 'POST', '127.0.0.1', '{\"orders_renew_log_id\":\"6\",\"receivable\":\"4800\",\"old_receipts\":\"0\",\"receipts\":\"2000\",\"pay_type_id\":\"2\",\"pay_time\":\"2020-08-14 00:00:00\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 15:31:11', '2020-08-14 15:31:11');
INSERT INTO `admin_operation_log` VALUES (1533, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 15:31:12', '2020-08-14 15:31:12');
INSERT INTO `admin_operation_log` VALUES (1534, 1, 'admin/pay-type', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:31:31', '2020-08-14 15:31:31');
INSERT INTO `admin_operation_log` VALUES (1535, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:31:33', '2020-08-14 15:31:33');
INSERT INTO `admin_operation_log` VALUES (1536, 1, 'admin/orders-renew-log/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:31:40', '2020-08-14 15:31:40');
INSERT INTO `admin_operation_log` VALUES (1537, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-14 15:31:41', '2020-08-14 15:31:41');
INSERT INTO `admin_operation_log` VALUES (1538, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-14 15:32:46', '2020-08-14 15:32:46');
INSERT INTO `admin_operation_log` VALUES (1539, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-14 15:33:49', '2020-08-14 15:33:49');
INSERT INTO `admin_operation_log` VALUES (1540, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-14 15:34:13', '2020-08-14 15:34:13');
INSERT INTO `admin_operation_log` VALUES (1541, 1, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"2\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:34:18', '2020-08-14 15:34:18');
INSERT INTO `admin_operation_log` VALUES (1542, 1, 'admin/order-payment-log', 'POST', '127.0.0.1', '{\"orders_renew_log_id\":\"2\",\"receivable\":\"4800\",\"old_receipts\":\"0\",\"receipts\":\"4800\",\"pay_type_id\":\"2\",\"pay_time\":\"2020-08-14 00:00:00\",\"admin_user_id\":\"1\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\"}', '2020-08-14 15:34:28', '2020-08-14 15:34:28');
INSERT INTO `admin_operation_log` VALUES (1543, 1, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-14 15:34:29', '2020-08-14 15:34:29');
INSERT INTO `admin_operation_log` VALUES (1544, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"orders_renew_per_page\":\"10\",\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:34:40', '2020-08-14 15:34:40');
INSERT INTO `admin_operation_log` VALUES (1545, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:35:05', '2020-08-14 15:35:05');
INSERT INTO `admin_operation_log` VALUES (1546, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:35:11', '2020-08-14 15:35:11');
INSERT INTO `admin_operation_log` VALUES (1547, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:35:16', '2020-08-14 15:35:16');
INSERT INTO `admin_operation_log` VALUES (1548, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:35:25', '2020-08-14 15:35:25');
INSERT INTO `admin_operation_log` VALUES (1549, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:35:39', '2020-08-14 15:35:39');
INSERT INTO `admin_operation_log` VALUES (1550, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:35:45', '2020-08-14 15:35:45');
INSERT INTO `admin_operation_log` VALUES (1551, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:35:51', '2020-08-14 15:35:51');
INSERT INTO `admin_operation_log` VALUES (1552, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"orders\",\"name\":\"\\u8ba2\\u5355\",\"http_method\":[null],\"http_path\":null,\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-14 15:36:01', '2020-08-14 15:36:01');
INSERT INTO `admin_operation_log` VALUES (1553, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-14 15:36:01', '2020-08-14 15:36:01');
INSERT INTO `admin_operation_log` VALUES (1554, 1, 'admin/auth/permissions/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:36:05', '2020-08-14 15:36:05');
INSERT INTO `admin_operation_log` VALUES (1555, 1, 'admin/auth/permissions/7', 'PUT', '127.0.0.1', '{\"slug\":\"orders\",\"name\":\"\\u8ba2\\u5355\",\"http_method\":[null],\"http_path\":\"\\/orders*\",\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-14 15:36:16', '2020-08-14 15:36:16');
INSERT INTO `admin_operation_log` VALUES (1556, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-14 15:36:17', '2020-08-14 15:36:17');
INSERT INTO `admin_operation_log` VALUES (1557, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:36:22', '2020-08-14 15:36:22');
INSERT INTO `admin_operation_log` VALUES (1558, 1, 'admin/auth/roles/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:36:25', '2020-08-14 15:36:25');
INSERT INTO `admin_operation_log` VALUES (1559, 1, 'admin/auth/roles/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-14 15:36:35', '2020-08-14 15:36:35');
INSERT INTO `admin_operation_log` VALUES (1560, 1, 'admin/auth/roles/4', 'PUT', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",null],\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\"}', '2020-08-14 15:36:39', '2020-08-14 15:36:39');
INSERT INTO `admin_operation_log` VALUES (1561, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-14 15:36:40', '2020-08-14 15:36:40');
INSERT INTO `admin_operation_log` VALUES (1562, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:36:46', '2020-08-14 15:36:46');
INSERT INTO `admin_operation_log` VALUES (1563, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:36:50', '2020-08-14 15:36:50');
INSERT INTO `admin_operation_log` VALUES (1564, 1, 'admin/auth/menu/20', 'PUT', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u8ba2\\u5355\\u5217\\u8868\",\"icon\":\"fa-bars\",\"uri\":\"orders\",\"roles\":[\"1\",\"4\",null],\"permission\":null,\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-14 15:37:00', '2020-08-14 15:37:00');
INSERT INTO `admin_operation_log` VALUES (1565, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-14 15:37:01', '2020-08-14 15:37:01');
INSERT INTO `admin_operation_log` VALUES (1566, 1, 'admin/auth/menu/19/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:37:10', '2020-08-14 15:37:10');
INSERT INTO `admin_operation_log` VALUES (1567, 1, 'admin/auth/menu/19', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",\"4\",null],\"permission\":null,\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-14 15:37:24', '2020-08-14 15:37:24');
INSERT INTO `admin_operation_log` VALUES (1568, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-14 15:37:25', '2020-08-14 15:37:25');
INSERT INTO `admin_operation_log` VALUES (1569, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:37:32', '2020-08-14 15:37:32');
INSERT INTO `admin_operation_log` VALUES (1570, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:37:35', '2020-08-14 15:37:35');
INSERT INTO `admin_operation_log` VALUES (1571, 1, 'admin/auth/menu/21/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:37:39', '2020-08-14 15:37:39');
INSERT INTO `admin_operation_log` VALUES (1572, 1, 'admin/auth/menu/21', 'PUT', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u8ba2\\u5355\\u65e5\\u5fd7\",\"icon\":\"fa-bars\",\"uri\":\"orders-logs\",\"roles\":[\"1\",\"4\",null],\"permission\":null,\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-14 15:37:43', '2020-08-14 15:37:43');
INSERT INTO `admin_operation_log` VALUES (1573, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-14 15:37:44', '2020-08-14 15:37:44');
INSERT INTO `admin_operation_log` VALUES (1574, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:37:50', '2020-08-14 15:37:50');
INSERT INTO `admin_operation_log` VALUES (1575, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:37:54', '2020-08-14 15:37:54');
INSERT INTO `admin_operation_log` VALUES (1576, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"yangjiamin\",\"password_confirmation\":\"yangjiamin\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",\"4\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"1EWLXGsOPyNuLQUYgifayFbct8sC4ie0S9PHyCBg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-14 15:38:13', '2020-08-14 15:38:13');
INSERT INTO `admin_operation_log` VALUES (1577, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-14 15:38:14', '2020-08-14 15:38:14');
INSERT INTO `admin_operation_log` VALUES (1578, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:38:23', '2020-08-14 15:38:23');
INSERT INTO `admin_operation_log` VALUES (1579, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-14 15:38:44', '2020-08-14 15:38:44');
INSERT INTO `admin_operation_log` VALUES (1580, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:38:49', '2020-08-14 15:38:49');
INSERT INTO `admin_operation_log` VALUES (1581, 2, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:38:54', '2020-08-14 15:38:54');
INSERT INTO `admin_operation_log` VALUES (1582, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 15:41:32', '2020-08-14 15:41:32');
INSERT INTO `admin_operation_log` VALUES (1583, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-14 15:42:11', '2020-08-14 15:42:11');
INSERT INTO `admin_operation_log` VALUES (1584, 2, 'admin/pay-type', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 16:27:03', '2020-08-14 16:27:03');
INSERT INTO `admin_operation_log` VALUES (1585, 2, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 16:27:05', '2020-08-14 16:27:05');
INSERT INTO `admin_operation_log` VALUES (1586, 2, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_title\":\"\\u4e2d\",\"product_id\":null,\"start_time\":{\"start\":null,\"end\":null},\"end_time\":{\"start\":null,\"end\":null},\"admin_user_id\":null}', '2020-08-14 16:27:46', '2020-08-14 16:27:46');
INSERT INTO `admin_operation_log` VALUES (1587, 2, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-14 16:33:13', '2020-08-14 16:33:13');
INSERT INTO `admin_operation_log` VALUES (1588, 2, 'admin/orders-renew-log', 'GET', '127.0.0.1', '[]', '2020-08-14 16:33:18', '2020-08-14 16:33:18');
INSERT INTO `admin_operation_log` VALUES (1589, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-18 13:00:21', '2020-08-18 13:00:21');
INSERT INTO `admin_operation_log` VALUES (1590, 2, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:00:33', '2020-08-18 13:00:33');
INSERT INTO `admin_operation_log` VALUES (1591, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:00:39', '2020-08-18 13:00:39');
INSERT INTO `admin_operation_log` VALUES (1592, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-18 13:00:50', '2020-08-18 13:00:50');
INSERT INTO `admin_operation_log` VALUES (1593, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:00:55', '2020-08-18 13:00:55');
INSERT INTO `admin_operation_log` VALUES (1594, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:01:16', '2020-08-18 13:01:16');
INSERT INTO `admin_operation_log` VALUES (1595, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"customer\",\"name\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/customers*\\r\\n\\/customer-demands*\\r\\n\\/customer-contacts*\",\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-18 13:04:10', '2020-08-18 13:04:10');
INSERT INTO `admin_operation_log` VALUES (1596, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-18 13:04:11', '2020-08-18 13:04:11');
INSERT INTO `admin_operation_log` VALUES (1597, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:04:37', '2020-08-18 13:04:37');
INSERT INTO `admin_operation_log` VALUES (1598, 1, 'admin/pay-type', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:04:40', '2020-08-18 13:04:40');
INSERT INTO `admin_operation_log` VALUES (1599, 1, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:04:43', '2020-08-18 13:04:43');
INSERT INTO `admin_operation_log` VALUES (1600, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:05:48', '2020-08-18 13:05:48');
INSERT INTO `admin_operation_log` VALUES (1601, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:05:51', '2020-08-18 13:05:51');
INSERT INTO `admin_operation_log` VALUES (1602, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:05:53', '2020-08-18 13:05:53');
INSERT INTO `admin_operation_log` VALUES (1603, 1, 'admin/customer-contact-cards', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:05:56', '2020-08-18 13:05:56');
INSERT INTO `admin_operation_log` VALUES (1604, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:05:59', '2020-08-18 13:05:59');
INSERT INTO `admin_operation_log` VALUES (1605, 1, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:06:03', '2020-08-18 13:06:03');
INSERT INTO `admin_operation_log` VALUES (1606, 1, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:12:11', '2020-08-18 13:12:11');
INSERT INTO `admin_operation_log` VALUES (1607, 1, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:12:14', '2020-08-18 13:12:14');
INSERT INTO `admin_operation_log` VALUES (1608, 1, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:12:16', '2020-08-18 13:12:16');
INSERT INTO `admin_operation_log` VALUES (1609, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:12:18', '2020-08-18 13:12:18');
INSERT INTO `admin_operation_log` VALUES (1610, 1, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:12:19', '2020-08-18 13:12:19');
INSERT INTO `admin_operation_log` VALUES (1611, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:12:27', '2020-08-18 13:12:27');
INSERT INTO `admin_operation_log` VALUES (1612, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u8d22\\u52a1\\u90e8\",\"sort\":\"1\",\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-08-18 13:12:39', '2020-08-18 13:12:39');
INSERT INTO `admin_operation_log` VALUES (1613, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-08-18 13:12:40', '2020-08-18 13:12:40');
INSERT INTO `admin_operation_log` VALUES (1614, 1, 'admin/departments/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 13:13:00', '2020-08-18 13:13:00');
INSERT INTO `admin_operation_log` VALUES (1615, 1, 'admin/departments', 'POST', '127.0.0.1', '{\"PID\":\"0\",\"title\":\"\\u7efc\\u5408\\u90e8\",\"sort\":\"1\",\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/departments\"}', '2020-08-18 13:13:17', '2020-08-18 13:13:17');
INSERT INTO `admin_operation_log` VALUES (1616, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-08-18 13:13:18', '2020-08-18 13:13:18');
INSERT INTO `admin_operation_log` VALUES (1617, 1, 'admin/departments', 'GET', '127.0.0.1', '[]', '2020-08-18 13:13:26', '2020-08-18 13:13:26');
INSERT INTO `admin_operation_log` VALUES (1618, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:14:50', '2020-08-18 14:14:50');
INSERT INTO `admin_operation_log` VALUES (1619, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:15:12', '2020-08-18 14:15:12');
INSERT INTO `admin_operation_log` VALUES (1620, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:47:24', '2020-08-18 14:47:24');
INSERT INTO `admin_operation_log` VALUES (1621, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:47:36', '2020-08-18 14:47:36');
INSERT INTO `admin_operation_log` VALUES (1622, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:49:48', '2020-08-18 14:49:48');
INSERT INTO `admin_operation_log` VALUES (1623, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:49:51', '2020-08-18 14:49:51');
INSERT INTO `admin_operation_log` VALUES (1624, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"system\",\"name\":\"\\u7efc\\u5408\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/products*\\r\\n\\/departments*\\r\\n\\/channels*\\r\\n\\/cart-templates*\\r\\n\\/params*\\r\\n\\/product-params*\",\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-18 14:51:13', '2020-08-18 14:51:13');
INSERT INTO `admin_operation_log` VALUES (1625, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-18 14:51:14', '2020-08-18 14:51:14');
INSERT INTO `admin_operation_log` VALUES (1626, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:51:19', '2020-08-18 14:51:19');
INSERT INTO `admin_operation_log` VALUES (1627, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:51:24', '2020-08-18 14:51:24');
INSERT INTO `admin_operation_log` VALUES (1628, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"system\",\"name\":\"\\u7efc\\u5408\\u7ba1\\u7406\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"9\",null],\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-18 14:51:39', '2020-08-18 14:51:39');
INSERT INTO `admin_operation_log` VALUES (1629, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-18 14:51:40', '2020-08-18 14:51:40');
INSERT INTO `admin_operation_log` VALUES (1630, 1, 'admin/auth/roles/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:51:43', '2020-08-18 14:51:43');
INSERT INTO `admin_operation_log` VALUES (1631, 1, 'admin/auth/roles/5', 'PUT', '127.0.0.1', '{\"slug\":\"check\",\"name\":\"\\u8d28\\u68c0\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",null],\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-18 14:51:48', '2020-08-18 14:51:48');
INSERT INTO `admin_operation_log` VALUES (1632, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-18 14:51:49', '2020-08-18 14:51:49');
INSERT INTO `admin_operation_log` VALUES (1633, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:51:53', '2020-08-18 14:51:53');
INSERT INTO `admin_operation_log` VALUES (1634, 1, 'admin/auth/roles/3', 'PUT', '127.0.0.1', '{\"slug\":\"sales\",\"name\":\"\\u9500\\u552e\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",\"8\",null],\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-18 14:51:59', '2020-08-18 14:51:59');
INSERT INTO `admin_operation_log` VALUES (1635, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-18 14:51:59', '2020-08-18 14:51:59');
INSERT INTO `admin_operation_log` VALUES (1636, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:52:12', '2020-08-18 14:52:12');
INSERT INTO `admin_operation_log` VALUES (1637, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"commerce\",\"name\":\"\\u5546\\u52a1\\u90e8\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",null],\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-18 14:52:32', '2020-08-18 14:52:32');
INSERT INTO `admin_operation_log` VALUES (1638, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-18 14:52:33', '2020-08-18 14:52:33');
INSERT INTO `admin_operation_log` VALUES (1639, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:52:37', '2020-08-18 14:52:37');
INSERT INTO `admin_operation_log` VALUES (1640, 1, 'admin/auth/menu/19/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:52:45', '2020-08-18 14:52:45');
INSERT INTO `admin_operation_log` VALUES (1641, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:52:49', '2020-08-18 14:52:49');
INSERT INTO `admin_operation_log` VALUES (1642, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:52:55', '2020-08-18 14:52:55');
INSERT INTO `admin_operation_log` VALUES (1643, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 14:52:59', '2020-08-18 14:52:59');
INSERT INTO `admin_operation_log` VALUES (1644, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:13:18', '2020-08-18 16:13:18');
INSERT INTO `admin_operation_log` VALUES (1645, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:13:22', '2020-08-18 16:13:22');
INSERT INTO `admin_operation_log` VALUES (1646, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:13:26', '2020-08-18 16:13:26');
INSERT INTO `admin_operation_log` VALUES (1647, 1, 'admin/auth/menu/12', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7efc\\u5408\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",\"6\",null],\"permission\":null,\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-18 16:16:45', '2020-08-18 16:16:45');
INSERT INTO `admin_operation_log` VALUES (1648, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-18 16:16:46', '2020-08-18 16:16:46');
INSERT INTO `admin_operation_log` VALUES (1649, 1, 'admin/auth/menu/22/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:16:51', '2020-08-18 16:16:51');
INSERT INTO `admin_operation_log` VALUES (1650, 1, 'admin/auth/menu/22', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[\"1\",\"6\",null],\"permission\":null,\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-18 16:17:00', '2020-08-18 16:17:00');
INSERT INTO `admin_operation_log` VALUES (1651, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-18 16:17:01', '2020-08-18 16:17:01');
INSERT INTO `admin_operation_log` VALUES (1652, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:17:06', '2020-08-18 16:17:06');
INSERT INTO `admin_operation_log` VALUES (1653, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u6e20\\u9053\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"channels\",\"roles\":[\"1\",\"6\",null],\"permission\":null,\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-18 16:17:14', '2020-08-18 16:17:14');
INSERT INTO `admin_operation_log` VALUES (1654, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-18 16:17:15', '2020-08-18 16:17:15');
INSERT INTO `admin_operation_log` VALUES (1655, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:17:18', '2020-08-18 16:17:18');
INSERT INTO `admin_operation_log` VALUES (1656, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:17:22', '2020-08-18 16:17:22');
INSERT INTO `admin_operation_log` VALUES (1657, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:17:26', '2020-08-18 16:17:26');
INSERT INTO `admin_operation_log` VALUES (1658, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u540d\\u7247\\u6a21\\u677f\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"cart-templates\",\"roles\":[\"1\",\"6\",null],\"permission\":null,\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-18 16:17:32', '2020-08-18 16:17:32');
INSERT INTO `admin_operation_log` VALUES (1659, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-18 16:17:32', '2020-08-18 16:17:32');
INSERT INTO `admin_operation_log` VALUES (1660, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:17:36', '2020-08-18 16:17:36');
INSERT INTO `admin_operation_log` VALUES (1661, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u53c2\\u6570\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"params\",\"roles\":[\"1\",\"6\",null],\"permission\":null,\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-18 16:17:43', '2020-08-18 16:17:43');
INSERT INTO `admin_operation_log` VALUES (1662, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-18 16:17:44', '2020-08-18 16:17:44');
INSERT INTO `admin_operation_log` VALUES (1663, 1, 'admin/auth/menu/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-18 16:17:47', '2020-08-18 16:17:47');
INSERT INTO `admin_operation_log` VALUES (1664, 1, 'admin/auth/menu/16', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4ea7\\u54c1\\u53c2\\u6570\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"product-params\",\"roles\":[\"1\",\"6\",null],\"permission\":null,\"_token\":\"h8gioPYEjcGesowvh8xQ36QVQ5UGFO9FEou4vZDc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-18 16:17:52', '2020-08-18 16:17:52');
INSERT INTO `admin_operation_log` VALUES (1665, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-18 16:17:53', '2020-08-18 16:17:53');
INSERT INTO `admin_operation_log` VALUES (1666, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 10:41:00', '2020-08-19 10:41:00');
INSERT INTO `admin_operation_log` VALUES (1667, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 11:01:00', '2020-08-19 11:01:00');
INSERT INTO `admin_operation_log` VALUES (1668, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 11:01:07', '2020-08-19 11:01:07');
INSERT INTO `admin_operation_log` VALUES (1669, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 11:01:12', '2020-08-19 11:01:12');
INSERT INTO `admin_operation_log` VALUES (1670, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 11:01:16', '2020-08-19 11:01:16');
INSERT INTO `admin_operation_log` VALUES (1671, 1, 'admin/auth/menu/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 11:01:20', '2020-08-19 11:01:20');
INSERT INTO `admin_operation_log` VALUES (1672, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:01:15', '2020-08-19 15:01:15');
INSERT INTO `admin_operation_log` VALUES (1673, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:01:20', '2020-08-19 15:01:20');
INSERT INTO `admin_operation_log` VALUES (1674, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":null,\"roles\":[\"1\",\"2\",\"3\",\"4\",null],\"permission\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-19 15:04:11', '2020-08-19 15:04:11');
INSERT INTO `admin_operation_log` VALUES (1675, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-19 15:04:12', '2020-08-19 15:04:12');
INSERT INTO `admin_operation_log` VALUES (1676, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:04:16', '2020-08-19 15:04:16');
INSERT INTO `admin_operation_log` VALUES (1677, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5ba2\\u6237\\u5217\\u8868\",\"icon\":\"fa-bars\",\"uri\":\"\\/customers\",\"roles\":[\"1\",\"2\",\"3\",\"4\",null],\"permission\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-19 15:04:24', '2020-08-19 15:04:24');
INSERT INTO `admin_operation_log` VALUES (1678, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-19 15:04:25', '2020-08-19 15:04:25');
INSERT INTO `admin_operation_log` VALUES (1679, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:04:29', '2020-08-19 15:04:29');
INSERT INTO `admin_operation_log` VALUES (1680, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:04:33', '2020-08-19 15:04:33');
INSERT INTO `admin_operation_log` VALUES (1681, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:04:43', '2020-08-19 15:04:43');
INSERT INTO `admin_operation_log` VALUES (1682, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u5ba2\\u6237\\u8054\\u7cfb\\u4eba\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"customer-contacts\",\"roles\":[\"1\",\"2\",\"3\",\"4\",null],\"permission\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-19 15:04:51', '2020-08-19 15:04:51');
INSERT INTO `admin_operation_log` VALUES (1683, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-19 15:04:51', '2020-08-19 15:04:51');
INSERT INTO `admin_operation_log` VALUES (1684, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:04:56', '2020-08-19 15:04:56');
INSERT INTO `admin_operation_log` VALUES (1685, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u8054\\u7cfb\\u4eba\\u540d\\u7247\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"customer-contact-cards\",\"roles\":[\"1\",\"6\",null],\"permission\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-19 15:05:07', '2020-08-19 15:05:07');
INSERT INTO `admin_operation_log` VALUES (1686, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-19 15:05:08', '2020-08-19 15:05:08');
INSERT INTO `admin_operation_log` VALUES (1687, 1, 'admin/auth/menu/19/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:05:12', '2020-08-19 15:05:12');
INSERT INTO `admin_operation_log` VALUES (1688, 1, 'admin/auth/menu/19', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[\"1\",\"2\",\"3\",\"4\",\"5\",null],\"permission\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-19 15:05:20', '2020-08-19 15:05:20');
INSERT INTO `admin_operation_log` VALUES (1689, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-19 15:05:21', '2020-08-19 15:05:21');
INSERT INTO `admin_operation_log` VALUES (1690, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:05:25', '2020-08-19 15:05:25');
INSERT INTO `admin_operation_log` VALUES (1691, 1, 'admin/auth/menu/20', 'PUT', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u8ba2\\u5355\\u5217\\u8868\",\"icon\":\"fa-bars\",\"uri\":\"orders\",\"roles\":[\"1\",\"2\",\"3\",\"4\",\"5\",null],\"permission\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-19 15:05:32', '2020-08-19 15:05:32');
INSERT INTO `admin_operation_log` VALUES (1692, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-19 15:05:33', '2020-08-19 15:05:33');
INSERT INTO `admin_operation_log` VALUES (1693, 1, 'admin/auth/menu/21/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:05:37', '2020-08-19 15:05:37');
INSERT INTO `admin_operation_log` VALUES (1694, 1, 'admin/auth/menu/21', 'PUT', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"\\u8ba2\\u5355\\u65e5\\u5fd7\",\"icon\":\"fa-bars\",\"uri\":\"orders-logs\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/menu\"}', '2020-08-19 15:05:48', '2020-08-19 15:05:48');
INSERT INTO `admin_operation_log` VALUES (1695, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-08-19 15:05:49', '2020-08-19 15:05:49');
INSERT INTO `admin_operation_log` VALUES (1696, 1, 'admin/auth/menu/23/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:05:53', '2020-08-19 15:05:53');
INSERT INTO `admin_operation_log` VALUES (1697, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:05:56', '2020-08-19 15:05:56');
INSERT INTO `admin_operation_log` VALUES (1698, 1, 'admin/auth/menu/25/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:00', '2020-08-19 15:06:00');
INSERT INTO `admin_operation_log` VALUES (1699, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:03', '2020-08-19 15:06:03');
INSERT INTO `admin_operation_log` VALUES (1700, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:09', '2020-08-19 15:06:09');
INSERT INTO `admin_operation_log` VALUES (1701, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:15', '2020-08-19 15:06:15');
INSERT INTO `admin_operation_log` VALUES (1702, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:18', '2020-08-19 15:06:18');
INSERT INTO `admin_operation_log` VALUES (1703, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:26', '2020-08-19 15:06:26');
INSERT INTO `admin_operation_log` VALUES (1704, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 15:06:30', '2020-08-19 15:06:30');
INSERT INTO `admin_operation_log` VALUES (1705, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"commerce\",\"name\":\"\\u5546\\u52a1\\u90e8\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",\"8\",null],\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\"}', '2020-08-19 15:06:35', '2020-08-19 15:06:35');
INSERT INTO `admin_operation_log` VALUES (1706, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:06:35', '2020-08-19 15:06:35');
INSERT INTO `admin_operation_log` VALUES (1707, 1, 'admin/auth/roles/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:44', '2020-08-19 15:06:44');
INSERT INTO `admin_operation_log` VALUES (1708, 1, 'admin/auth/roles/4', 'PUT', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",null],\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:06:48', '2020-08-19 15:06:48');
INSERT INTO `admin_operation_log` VALUES (1709, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:06:48', '2020-08-19 15:06:48');
INSERT INTO `admin_operation_log` VALUES (1710, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:54', '2020-08-19 15:06:54');
INSERT INTO `admin_operation_log` VALUES (1711, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:06:59', '2020-08-19 15:06:59');
INSERT INTO `admin_operation_log` VALUES (1712, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"TAzNn4MbYnU8drW0lprfDpeYjyVKW3D8wKPkQWmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-19 15:07:17', '2020-08-19 15:07:17');
INSERT INTO `admin_operation_log` VALUES (1713, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-19 15:07:18', '2020-08-19 15:07:18');
INSERT INTO `admin_operation_log` VALUES (1714, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:07:47', '2020-08-19 15:07:47');
INSERT INTO `admin_operation_log` VALUES (1715, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:08:10', '2020-08-19 15:08:10');
INSERT INTO `admin_operation_log` VALUES (1716, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:08:40', '2020-08-19 15:08:40');
INSERT INTO `admin_operation_log` VALUES (1717, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:08:42', '2020-08-19 15:08:42');
INSERT INTO `admin_operation_log` VALUES (1718, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-19 15:08:43', '2020-08-19 15:08:43');
INSERT INTO `admin_operation_log` VALUES (1719, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:08:46', '2020-08-19 15:08:46');
INSERT INTO `admin_operation_log` VALUES (1720, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:08:48', '2020-08-19 15:08:48');
INSERT INTO `admin_operation_log` VALUES (1721, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-19 15:08:49', '2020-08-19 15:08:49');
INSERT INTO `admin_operation_log` VALUES (1722, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:09:55', '2020-08-19 15:09:55');
INSERT INTO `admin_operation_log` VALUES (1723, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:11:01', '2020-08-19 15:11:01');
INSERT INTO `admin_operation_log` VALUES (1724, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:11:11', '2020-08-19 15:11:11');
INSERT INTO `admin_operation_log` VALUES (1725, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:11:16', '2020-08-19 15:11:16');
INSERT INTO `admin_operation_log` VALUES (1726, 1, 'admin/auth/permissions/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:11:22', '2020-08-19 15:11:22');
INSERT INTO `admin_operation_log` VALUES (1727, 1, 'admin/auth/permissions/8', 'PUT', '127.0.0.1', '{\"slug\":\"customer_manage\",\"name\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/customers*\\r\\n\\/customer-demands*\\r\\n\\/customer-contacts*\",\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-19 15:11:27', '2020-08-19 15:11:27');
INSERT INTO `admin_operation_log` VALUES (1728, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-19 15:11:28', '2020-08-19 15:11:28');
INSERT INTO `admin_operation_log` VALUES (1729, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:11:48', '2020-08-19 15:11:48');
INSERT INTO `admin_operation_log` VALUES (1730, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:13:31', '2020-08-19 15:13:31');
INSERT INTO `admin_operation_log` VALUES (1731, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:13:39', '2020-08-19 15:13:39');
INSERT INTO `admin_operation_log` VALUES (1732, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:13:44', '2020-08-19 15:13:44');
INSERT INTO `admin_operation_log` VALUES (1733, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"customer_manage\",\"name\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"8\",null],\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:13:57', '2020-08-19 15:13:57');
INSERT INTO `admin_operation_log` VALUES (1734, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:13:58', '2020-08-19 15:13:58');
INSERT INTO `admin_operation_log` VALUES (1735, 1, 'admin/auth/roles/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:14:06', '2020-08-19 15:14:06');
INSERT INTO `admin_operation_log` VALUES (1736, 1, 'admin/auth/roles/4', 'PUT', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",null],\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:14:12', '2020-08-19 15:14:12');
INSERT INTO `admin_operation_log` VALUES (1737, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:14:13', '2020-08-19 15:14:13');
INSERT INTO `admin_operation_log` VALUES (1738, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:14:18', '2020-08-19 15:14:18');
INSERT INTO `admin_operation_log` VALUES (1739, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"commerce\",\"name\":\"\\u5546\\u52a1\\u90e8\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:14:27', '2020-08-19 15:14:27');
INSERT INTO `admin_operation_log` VALUES (1740, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:14:28', '2020-08-19 15:14:28');
INSERT INTO `admin_operation_log` VALUES (1741, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:14:42', '2020-08-19 15:14:42');
INSERT INTO `admin_operation_log` VALUES (1742, 1, 'admin/auth/roles/3', 'PUT', '127.0.0.1', '{\"slug\":\"sales\",\"name\":\"\\u9500\\u552e\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",null],\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:14:47', '2020-08-19 15:14:47');
INSERT INTO `admin_operation_log` VALUES (1743, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:14:47', '2020-08-19 15:14:47');
INSERT INTO `admin_operation_log` VALUES (1744, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:15:04', '2020-08-19 15:15:04');
INSERT INTO `admin_operation_log` VALUES (1745, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"commerce\",\"name\":\"\\u5546\\u52a1\\u90e8\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",\"8\",null],\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:15:10', '2020-08-19 15:15:10');
INSERT INTO `admin_operation_log` VALUES (1746, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:15:11', '2020-08-19 15:15:11');
INSERT INTO `admin_operation_log` VALUES (1747, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:15:14', '2020-08-19 15:15:14');
INSERT INTO `admin_operation_log` VALUES (1748, 1, 'admin/auth/roles/3', 'PUT', '127.0.0.1', '{\"slug\":\"sales\",\"name\":\"\\u9500\\u552e\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",\"8\",null],\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:15:19', '2020-08-19 15:15:19');
INSERT INTO `admin_operation_log` VALUES (1749, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:15:20', '2020-08-19 15:15:20');
INSERT INTO `admin_operation_log` VALUES (1750, 1, 'admin/auth/roles/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:15:37', '2020-08-19 15:15:37');
INSERT INTO `admin_operation_log` VALUES (1751, 1, 'admin/auth/roles/4', 'PUT', '127.0.0.1', '{\"slug\":\"finance\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",null],\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:15:44', '2020-08-19 15:15:44');
INSERT INTO `admin_operation_log` VALUES (1752, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:15:45', '2020-08-19 15:15:45');
INSERT INTO `admin_operation_log` VALUES (1753, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:15:56', '2020-08-19 15:15:56');
INSERT INTO `admin_operation_log` VALUES (1754, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:15:59', '2020-08-19 15:15:59');
INSERT INTO `admin_operation_log` VALUES (1755, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"password_confirmation\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",\"7\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"SRx8Poc6tTi5liLEqfmzaQQdZlMulxj4ejwQayKT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-19 15:16:15', '2020-08-19 15:16:15');
INSERT INTO `admin_operation_log` VALUES (1756, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-19 15:16:15', '2020-08-19 15:16:15');
INSERT INTO `admin_operation_log` VALUES (1757, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:16:27', '2020-08-19 15:16:27');
INSERT INTO `admin_operation_log` VALUES (1758, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:16:38', '2020-08-19 15:16:38');
INSERT INTO `admin_operation_log` VALUES (1759, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:19:00', '2020-08-19 15:19:00');
INSERT INTO `admin_operation_log` VALUES (1760, 2, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:19:03', '2020-08-19 15:19:03');
INSERT INTO `admin_operation_log` VALUES (1761, 2, 'admin/customers', 'POST', '127.0.0.1', '{\"title\":\"\\u57ce\\u5e02\",\"type\":\"1\",\"address\":\"\\u4e2d\\u5fc3\\u573a\\u9986\",\"is_agent\":\"0\",\"channel_id\":\"1\",\"industry_id\":\"56\",\"remark\":null,\"owner_user_id\":\"2\",\"_token\":\"JayXT2ssVBnc2ZqCuvY6ukQ3GKfsGLq1erE0Txam\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customers\"}', '2020-08-19 15:19:16', '2020-08-19 15:19:16');
INSERT INTO `admin_operation_log` VALUES (1762, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-19 15:19:17', '2020-08-19 15:19:17');
INSERT INTO `admin_operation_log` VALUES (1763, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:19:20', '2020-08-19 15:19:20');
INSERT INTO `admin_operation_log` VALUES (1764, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-19 15:19:21', '2020-08-19 15:19:21');
INSERT INTO `admin_operation_log` VALUES (1765, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:19:41', '2020-08-19 15:19:41');
INSERT INTO `admin_operation_log` VALUES (1766, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:20:27', '2020-08-19 15:20:27');
INSERT INTO `admin_operation_log` VALUES (1767, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:28', '2020-08-19 15:20:28');
INSERT INTO `admin_operation_log` VALUES (1768, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:29', '2020-08-19 15:20:29');
INSERT INTO `admin_operation_log` VALUES (1769, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:29', '2020-08-19 15:20:29');
INSERT INTO `admin_operation_log` VALUES (1770, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:30', '2020-08-19 15:20:30');
INSERT INTO `admin_operation_log` VALUES (1771, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:31', '2020-08-19 15:20:31');
INSERT INTO `admin_operation_log` VALUES (1772, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:32', '2020-08-19 15:20:32');
INSERT INTO `admin_operation_log` VALUES (1773, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:32', '2020-08-19 15:20:32');
INSERT INTO `admin_operation_log` VALUES (1774, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:33', '2020-08-19 15:20:33');
INSERT INTO `admin_operation_log` VALUES (1775, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:34', '2020-08-19 15:20:34');
INSERT INTO `admin_operation_log` VALUES (1776, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:35', '2020-08-19 15:20:35');
INSERT INTO `admin_operation_log` VALUES (1777, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:35', '2020-08-19 15:20:35');
INSERT INTO `admin_operation_log` VALUES (1778, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:36', '2020-08-19 15:20:36');
INSERT INTO `admin_operation_log` VALUES (1779, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:37', '2020-08-19 15:20:37');
INSERT INTO `admin_operation_log` VALUES (1780, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:37', '2020-08-19 15:20:37');
INSERT INTO `admin_operation_log` VALUES (1781, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:38', '2020-08-19 15:20:38');
INSERT INTO `admin_operation_log` VALUES (1782, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:39', '2020-08-19 15:20:39');
INSERT INTO `admin_operation_log` VALUES (1783, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:39', '2020-08-19 15:20:39');
INSERT INTO `admin_operation_log` VALUES (1784, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:40', '2020-08-19 15:20:40');
INSERT INTO `admin_operation_log` VALUES (1785, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:41', '2020-08-19 15:20:41');
INSERT INTO `admin_operation_log` VALUES (1786, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:42', '2020-08-19 15:20:42');
INSERT INTO `admin_operation_log` VALUES (1787, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:20:43', '2020-08-19 15:20:43');
INSERT INTO `admin_operation_log` VALUES (1788, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:22:11', '2020-08-19 15:22:11');
INSERT INTO `admin_operation_log` VALUES (1789, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 15:22:32', '2020-08-19 15:22:32');
INSERT INTO `admin_operation_log` VALUES (1790, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:22:44', '2020-08-19 15:22:44');
INSERT INTO `admin_operation_log` VALUES (1791, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:22:55', '2020-08-19 15:22:55');
INSERT INTO `admin_operation_log` VALUES (1792, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:23:01', '2020-08-19 15:23:01');
INSERT INTO `admin_operation_log` VALUES (1793, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:23:26', '2020-08-19 15:23:26');
INSERT INTO `admin_operation_log` VALUES (1794, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:23:30', '2020-08-19 15:23:30');
INSERT INTO `admin_operation_log` VALUES (1795, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:23:40', '2020-08-19 15:23:40');
INSERT INTO `admin_operation_log` VALUES (1796, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:24:19', '2020-08-19 15:24:19');
INSERT INTO `admin_operation_log` VALUES (1797, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:24:30', '2020-08-19 15:24:30');
INSERT INTO `admin_operation_log` VALUES (1798, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:24:33', '2020-08-19 15:24:33');
INSERT INTO `admin_operation_log` VALUES (1799, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:28:12', '2020-08-19 15:28:12');
INSERT INTO `admin_operation_log` VALUES (1800, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:28:24', '2020-08-19 15:28:24');
INSERT INTO `admin_operation_log` VALUES (1801, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:28:29', '2020-08-19 15:28:29');
INSERT INTO `admin_operation_log` VALUES (1802, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:28:31', '2020-08-19 15:28:31');
INSERT INTO `admin_operation_log` VALUES (1803, 1, 'admin/auth/roles/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:28:34', '2020-08-19 15:28:34');
INSERT INTO `admin_operation_log` VALUES (1804, 1, 'admin/auth/roles/1', 'PUT', '127.0.0.1', '{\"slug\":\"administrator\",\"name\":\"Administrator\",\"permissions\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",null],\"_token\":\"AVuM7vPGZMb3bkceLurq8gCKxaRi1UlPTfbqGR6d\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-19 15:28:38', '2020-08-19 15:28:38');
INSERT INTO `admin_operation_log` VALUES (1805, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-19 15:28:39', '2020-08-19 15:28:39');
INSERT INTO `admin_operation_log` VALUES (1806, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:28:57', '2020-08-19 15:28:57');
INSERT INTO `admin_operation_log` VALUES (1807, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:29:22', '2020-08-19 15:29:22');
INSERT INTO `admin_operation_log` VALUES (1808, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:29:26', '2020-08-19 15:29:26');
INSERT INTO `admin_operation_log` VALUES (1809, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-19 15:29:40', '2020-08-19 15:29:40');
INSERT INTO `admin_operation_log` VALUES (1810, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_id\":\"1\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-19 15:29:42', '2020-08-19 15:29:42');
INSERT INTO `admin_operation_log` VALUES (1811, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"customer_id\":\"2\",\"owner_user_id\":null,\"last_user_id\":null}', '2020-08-19 15:29:47', '2020-08-19 15:29:47');
INSERT INTO `admin_operation_log` VALUES (1812, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:29:49', '2020-08-19 15:29:49');
INSERT INTO `admin_operation_log` VALUES (1813, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:30:31', '2020-08-19 15:30:31');
INSERT INTO `admin_operation_log` VALUES (1814, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-19 15:30:35', '2020-08-19 15:30:35');
INSERT INTO `admin_operation_log` VALUES (1815, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 15:30:37', '2020-08-19 15:30:37');
INSERT INTO `admin_operation_log` VALUES (1816, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:30:44', '2020-08-19 15:30:44');
INSERT INTO `admin_operation_log` VALUES (1817, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '[]', '2020-08-19 15:32:32', '2020-08-19 15:32:32');
INSERT INTO `admin_operation_log` VALUES (1818, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:32:35', '2020-08-19 15:32:35');
INSERT INTO `admin_operation_log` VALUES (1819, 2, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:32:38', '2020-08-19 15:32:38');
INSERT INTO `admin_operation_log` VALUES (1820, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '[]', '2020-08-19 15:32:39', '2020-08-19 15:32:39');
INSERT INTO `admin_operation_log` VALUES (1821, 2, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:33:30', '2020-08-19 15:33:30');
INSERT INTO `admin_operation_log` VALUES (1822, 2, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2020-08-19 15:33:33', '2020-08-19 15:33:33');
INSERT INTO `admin_operation_log` VALUES (1823, 2, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"name\":\"\\u62c6\",\"phone\":\"13333333333\",\"is_first\":\"1\",\"sex\":\"1\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"QPfvbzzxdD7QJA1pPWQobsUiILIe2ttCWClCAJGP\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\"}', '2020-08-19 15:33:40', '2020-08-19 15:33:40');
INSERT INTO `admin_operation_log` VALUES (1824, 2, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-19 15:33:41', '2020-08-19 15:33:41');
INSERT INTO `admin_operation_log` VALUES (1825, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:33:47', '2020-08-19 15:33:47');
INSERT INTO `admin_operation_log` VALUES (1826, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:33:49', '2020-08-19 15:33:49');
INSERT INTO `admin_operation_log` VALUES (1827, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 15:33:51', '2020-08-19 15:33:51');
INSERT INTO `admin_operation_log` VALUES (1828, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-19 15:33:54', '2020-08-19 15:33:54');
INSERT INTO `admin_operation_log` VALUES (1829, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 15:33:57', '2020-08-19 15:33:57');
INSERT INTO `admin_operation_log` VALUES (1830, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-19 15:34:05', '2020-08-19 15:34:05');
INSERT INTO `admin_operation_log` VALUES (1831, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:34:28', '2020-08-19 15:34:28');
INSERT INTO `admin_operation_log` VALUES (1832, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:34:38', '2020-08-19 15:34:38');
INSERT INTO `admin_operation_log` VALUES (1833, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:34:46', '2020-08-19 15:34:46');
INSERT INTO `admin_operation_log` VALUES (1834, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:35:02', '2020-08-19 15:35:02');
INSERT INTO `admin_operation_log` VALUES (1835, 1, 'admin/auth/permissions/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:35:06', '2020-08-19 15:35:06');
INSERT INTO `admin_operation_log` VALUES (1836, 1, 'admin/auth/permissions/8', 'PUT', '127.0.0.1', '{\"slug\":\"customer_manage\",\"name\":\"\\u5ba2\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/customers*\\r\\n\\/customer-demands*\\r\\n\\/customer-contacts*\\r\\n\\/api\\/getCustomerContact*\\r\\n\\/api\\/getCustomerDemand*\",\"_token\":\"QDOzG4HKNB6YKS6qk4XXTxPfjgpWIC8QwAcHXpym\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-19 15:35:23', '2020-08-19 15:35:23');
INSERT INTO `admin_operation_log` VALUES (1837, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-19 15:35:24', '2020-08-19 15:35:24');
INSERT INTO `admin_operation_log` VALUES (1838, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:35:30', '2020-08-19 15:35:30');
INSERT INTO `admin_operation_log` VALUES (1839, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 15:35:41', '2020-08-19 15:35:41');
INSERT INTO `admin_operation_log` VALUES (1840, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:35:50', '2020-08-19 15:35:50');
INSERT INTO `admin_operation_log` VALUES (1841, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:35:53', '2020-08-19 15:35:53');
INSERT INTO `admin_operation_log` VALUES (1842, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-19 15:35:56', '2020-08-19 15:35:56');
INSERT INTO `admin_operation_log` VALUES (1843, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 15:36:01', '2020-08-19 15:36:01');
INSERT INTO `admin_operation_log` VALUES (1844, 2, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"uulf4sL205zY6hQaJAiifjBrRScVoRylOflqGCZe\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-19 15:38:27', '2020-08-19 15:38:27');
INSERT INTO `admin_operation_log` VALUES (1845, 2, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-19 15:38:28', '2020-08-19 15:38:28');
INSERT INTO `admin_operation_log` VALUES (1846, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:38:36', '2020-08-19 15:38:36');
INSERT INTO `admin_operation_log` VALUES (1847, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 15:39:06', '2020-08-19 15:39:06');
INSERT INTO `admin_operation_log` VALUES (1848, 2, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:39:18', '2020-08-19 15:39:18');
INSERT INTO `admin_operation_log` VALUES (1849, 2, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 15:39:21', '2020-08-19 15:39:21');
INSERT INTO `admin_operation_log` VALUES (1850, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:39:45', '2020-08-19 15:39:45');
INSERT INTO `admin_operation_log` VALUES (1851, 2, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"4\",\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:39:58', '2020-08-19 15:39:58');
INSERT INTO `admin_operation_log` VALUES (1852, 2, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"4\",\"orders_code\":\"20200813221436061066911E2450\",\"product_id\":\"2\",\"start_time\":\"2020-08-13 22:14:11\",\"old_end_time\":\"2020-08-16 00:00:00\",\"end_time\":\"2020-08-19 00:00:00\",\"receivable\":\"4800\",\"receipts\":\"2000\",\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"owner_user_id\":\"2\",\"_token\":\"uulf4sL205zY6hQaJAiifjBrRScVoRylOflqGCZe\"}', '2020-08-19 15:40:15', '2020-08-19 15:40:15');
INSERT INTO `admin_operation_log` VALUES (1853, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 15:40:16', '2020-08-19 15:40:16');
INSERT INTO `admin_operation_log` VALUES (1854, 2, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:40:19', '2020-08-19 15:40:19');
INSERT INTO `admin_operation_log` VALUES (1855, 2, 'admin/orders-details/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:40:36', '2020-08-19 15:40:36');
INSERT INTO `admin_operation_log` VALUES (1856, 2, 'admin/orders-details/6', 'PUT', '127.0.0.1', '{\"orders_id\":\"4\",\"params_id\":\"5\",\"value\":\"\\u662f\",\"admin_user_id\":\"2\",\"_token\":\"uulf4sL205zY6hQaJAiifjBrRScVoRylOflqGCZe\",\"_method\":\"PUT\"}', '2020-08-19 15:40:41', '2020-08-19 15:40:41');
INSERT INTO `admin_operation_log` VALUES (1857, 2, 'admin/orders/4', 'GET', '127.0.0.1', '[]', '2020-08-19 15:40:42', '2020-08-19 15:40:42');
INSERT INTO `admin_operation_log` VALUES (1858, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:57:04', '2020-08-19 15:57:04');
INSERT INTO `admin_operation_log` VALUES (1859, 2, 'admin/orders/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:57:11', '2020-08-19 15:57:11');
INSERT INTO `admin_operation_log` VALUES (1860, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:57:33', '2020-08-19 15:57:33');
INSERT INTO `admin_operation_log` VALUES (1861, 2, 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 15:57:36', '2020-08-19 15:57:36');
INSERT INTO `admin_operation_log` VALUES (1862, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:03:03', '2020-08-19 16:03:03');
INSERT INTO `admin_operation_log` VALUES (1863, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:03:16', '2020-08-19 16:03:16');
INSERT INTO `admin_operation_log` VALUES (1864, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:03:48', '2020-08-19 16:03:48');
INSERT INTO `admin_operation_log` VALUES (1865, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:04:44', '2020-08-19 16:04:44');
INSERT INTO `admin_operation_log` VALUES (1866, 2, 'admin/orders/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:04:50', '2020-08-19 16:04:50');
INSERT INTO `admin_operation_log` VALUES (1867, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:41:03', '2020-08-19 16:41:03');
INSERT INTO `admin_operation_log` VALUES (1868, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 16:41:13', '2020-08-19 16:41:13');
INSERT INTO `admin_operation_log` VALUES (1869, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:41:19', '2020-08-19 16:41:19');
INSERT INTO `admin_operation_log` VALUES (1870, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:41:31', '2020-08-19 16:41:31');
INSERT INTO `admin_operation_log` VALUES (1871, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"password_confirmation\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"3\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"PcpmzkG1elT4uiHkY9JuJPjNBHH1d4VdVkBMH6gx\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-19 16:41:51', '2020-08-19 16:41:51');
INSERT INTO `admin_operation_log` VALUES (1872, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-19 16:41:52', '2020-08-19 16:41:52');
INSERT INTO `admin_operation_log` VALUES (1873, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:41:59', '2020-08-19 16:41:59');
INSERT INTO `admin_operation_log` VALUES (1874, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-19 16:42:14', '2020-08-19 16:42:14');
INSERT INTO `admin_operation_log` VALUES (1875, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:42:24', '2020-08-19 16:42:24');
INSERT INTO `admin_operation_log` VALUES (1876, 2, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:42:26', '2020-08-19 16:42:26');
INSERT INTO `admin_operation_log` VALUES (1877, 2, 'admin/customers', 'POST', '127.0.0.1', '{\"title\":\"\\u57ce\\u5e02\",\"type\":\"1\",\"address\":null,\"is_agent\":\"0\",\"channel_id\":\"0\",\"industry_id\":\"0\",\"remark\":null,\"owner_user_id\":\"2\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customers\"}', '2020-08-19 16:42:39', '2020-08-19 16:42:39');
INSERT INTO `admin_operation_log` VALUES (1878, 2, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-19 16:42:40', '2020-08-19 16:42:40');
INSERT INTO `admin_operation_log` VALUES (1879, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:42:42', '2020-08-19 16:42:42');
INSERT INTO `admin_operation_log` VALUES (1880, 2, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:42:44', '2020-08-19 16:42:44');
INSERT INTO `admin_operation_log` VALUES (1881, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:42:46', '2020-08-19 16:42:46');
INSERT INTO `admin_operation_log` VALUES (1882, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '[]', '2020-08-19 16:43:37', '2020-08-19 16:43:37');
INSERT INTO `admin_operation_log` VALUES (1883, 2, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:43:43', '2020-08-19 16:43:43');
INSERT INTO `admin_operation_log` VALUES (1884, 2, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 16:43:47', '2020-08-19 16:43:47');
INSERT INTO `admin_operation_log` VALUES (1885, 2, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"name\":\"\\u9ad8\\u74a7\\u7389\",\"phone\":\"13333333333\",\"is_first\":\"1\",\"sex\":\"0\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\"}', '2020-08-19 16:43:52', '2020-08-19 16:43:52');
INSERT INTO `admin_operation_log` VALUES (1886, 2, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-19 16:43:53', '2020-08-19 16:43:53');
INSERT INTO `admin_operation_log` VALUES (1887, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:47:24', '2020-08-19 16:47:24');
INSERT INTO `admin_operation_log` VALUES (1888, 2, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:47:46', '2020-08-19 16:47:46');
INSERT INTO `admin_operation_log` VALUES (1889, 2, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 16:47:49', '2020-08-19 16:47:49');
INSERT INTO `admin_operation_log` VALUES (1890, 2, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_demand_id\":\"2\",\"product_id\":\"2\",\"start_time\":\"2020-08-19 16:47:47\",\"end_time\":\"2020-08-19 16:47:47\",\"admin_user_id\":\"2\",\"sales_remark\":null,\"price\":\"323\",\"receivable\":\"0\",\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-08-19 16:48:38', '2020-08-19 16:48:38');
INSERT INTO `admin_operation_log` VALUES (1891, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:48:39', '2020-08-19 16:48:39');
INSERT INTO `admin_operation_log` VALUES (1892, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:48:43', '2020-08-19 16:48:43');
INSERT INTO `admin_operation_log` VALUES (1893, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:49:17', '2020-08-19 16:49:17');
INSERT INTO `admin_operation_log` VALUES (1894, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:49:22', '2020-08-19 16:49:22');
INSERT INTO `admin_operation_log` VALUES (1895, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:49:28', '2020-08-19 16:49:28');
INSERT INTO `admin_operation_log` VALUES (1896, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:49:30', '2020-08-19 16:49:30');
INSERT INTO `admin_operation_log` VALUES (1897, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"3\"}', '2020-08-19 16:49:33', '2020-08-19 16:49:33');
INSERT INTO `admin_operation_log` VALUES (1898, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:49:37', '2020-08-19 16:49:37');
INSERT INTO `admin_operation_log` VALUES (1899, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:49:43', '2020-08-19 16:49:43');
INSERT INTO `admin_operation_log` VALUES (1900, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:49:45', '2020-08-19 16:49:45');
INSERT INTO `admin_operation_log` VALUES (1901, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 16:49:48', '2020-08-19 16:49:48');
INSERT INTO `admin_operation_log` VALUES (1902, 2, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-19 16:49:55', '2020-08-19 16:49:55');
INSERT INTO `admin_operation_log` VALUES (1903, 2, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-19 16:49:56', '2020-08-19 16:49:56');
INSERT INTO `admin_operation_log` VALUES (1904, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:50:07', '2020-08-19 16:50:07');
INSERT INTO `admin_operation_log` VALUES (1905, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:50:10', '2020-08-19 16:50:10');
INSERT INTO `admin_operation_log` VALUES (1906, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:50:28', '2020-08-19 16:50:28');
INSERT INTO `admin_operation_log` VALUES (1907, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:50:36', '2020-08-19 16:50:36');
INSERT INTO `admin_operation_log` VALUES (1908, 2, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-19 16:50:47', '2020-08-19 16:50:47');
INSERT INTO `admin_operation_log` VALUES (1909, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-08-19 16:51:04', '2020-08-19 16:51:04');
INSERT INTO `admin_operation_log` VALUES (1910, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:07', '2020-08-19 16:51:07');
INSERT INTO `admin_operation_log` VALUES (1911, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:19', '2020-08-19 16:51:19');
INSERT INTO `admin_operation_log` VALUES (1912, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:25', '2020-08-19 16:51:25');
INSERT INTO `admin_operation_log` VALUES (1913, 2, 'admin/customer-demands/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:29', '2020-08-19 16:51:29');
INSERT INTO `admin_operation_log` VALUES (1914, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:32', '2020-08-19 16:51:32');
INSERT INTO `admin_operation_log` VALUES (1915, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:34', '2020-08-19 16:51:34');
INSERT INTO `admin_operation_log` VALUES (1916, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:37', '2020-08-19 16:51:37');
INSERT INTO `admin_operation_log` VALUES (1917, 2, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:43', '2020-08-19 16:51:43');
INSERT INTO `admin_operation_log` VALUES (1918, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:51:47', '2020-08-19 16:51:47');
INSERT INTO `admin_operation_log` VALUES (1919, 2, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:56:10', '2020-08-19 16:56:10');
INSERT INTO `admin_operation_log` VALUES (1920, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:56:12', '2020-08-19 16:56:12');
INSERT INTO `admin_operation_log` VALUES (1921, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:56:14', '2020-08-19 16:56:14');
INSERT INTO `admin_operation_log` VALUES (1922, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-19 16:56:17', '2020-08-19 16:56:17');
INSERT INTO `admin_operation_log` VALUES (1923, 2, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-19 16:56:23', '2020-08-19 16:56:23');
INSERT INTO `admin_operation_log` VALUES (1924, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:57:22', '2020-08-19 16:57:22');
INSERT INTO `admin_operation_log` VALUES (1925, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 16:57:25', '2020-08-19 16:57:25');
INSERT INTO `admin_operation_log` VALUES (1926, 2, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\"}', '2020-08-19 16:57:29', '2020-08-19 16:57:29');
INSERT INTO `admin_operation_log` VALUES (1927, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:59:09', '2020-08-19 16:59:09');
INSERT INTO `admin_operation_log` VALUES (1928, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '[]', '2020-08-19 16:59:11', '2020-08-19 16:59:11');
INSERT INTO `admin_operation_log` VALUES (1929, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 16:59:15', '2020-08-19 16:59:15');
INSERT INTO `admin_operation_log` VALUES (1930, 2, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\"}', '2020-08-19 16:59:21', '2020-08-19 16:59:21');
INSERT INTO `admin_operation_log` VALUES (1931, 2, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-19 16:59:22', '2020-08-19 16:59:22');
INSERT INTO `admin_operation_log` VALUES (1932, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:59:28', '2020-08-19 16:59:28');
INSERT INTO `admin_operation_log` VALUES (1933, 2, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 16:59:46', '2020-08-19 16:59:46');
INSERT INTO `admin_operation_log` VALUES (1934, 2, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:00:58', '2020-08-19 17:00:58');
INSERT INTO `admin_operation_log` VALUES (1935, 2, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:01:15', '2020-08-19 17:01:15');
INSERT INTO `admin_operation_log` VALUES (1936, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:02:21', '2020-08-19 17:02:21');
INSERT INTO `admin_operation_log` VALUES (1937, 2, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:03:32', '2020-08-19 17:03:32');
INSERT INTO `admin_operation_log` VALUES (1938, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 17:03:33', '2020-08-19 17:03:33');
INSERT INTO `admin_operation_log` VALUES (1939, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:03:47', '2020-08-19 17:03:47');
INSERT INTO `admin_operation_log` VALUES (1940, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:03:55', '2020-08-19 17:03:55');
INSERT INTO `admin_operation_log` VALUES (1941, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 17:03:56', '2020-08-19 17:03:56');
INSERT INTO `admin_operation_log` VALUES (1942, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 17:04:17', '2020-08-19 17:04:17');
INSERT INTO `admin_operation_log` VALUES (1943, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:04:20', '2020-08-19 17:04:20');
INSERT INTO `admin_operation_log` VALUES (1944, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:04:24', '2020-08-19 17:04:24');
INSERT INTO `admin_operation_log` VALUES (1945, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:04:27', '2020-08-19 17:04:27');
INSERT INTO `admin_operation_log` VALUES (1946, 2, 'admin/customers/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:04:30', '2020-08-19 17:04:30');
INSERT INTO `admin_operation_log` VALUES (1947, 2, 'admin/customers/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:04:59', '2020-08-19 17:04:59');
INSERT INTO `admin_operation_log` VALUES (1948, 2, 'admin/customers/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:11:17', '2020-08-19 17:11:17');
INSERT INTO `admin_operation_log` VALUES (1949, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:11:24', '2020-08-19 17:11:24');
INSERT INTO `admin_operation_log` VALUES (1950, 2, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:11:26', '2020-08-19 17:11:26');
INSERT INTO `admin_operation_log` VALUES (1951, 2, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"2\"}', '2020-08-19 17:11:30', '2020-08-19 17:11:30');
INSERT INTO `admin_operation_log` VALUES (1952, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:11:34', '2020-08-19 17:11:34');
INSERT INTO `admin_operation_log` VALUES (1953, 2, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:11:42', '2020-08-19 17:11:42');
INSERT INTO `admin_operation_log` VALUES (1954, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-19 17:11:42', '2020-08-19 17:11:42');
INSERT INTO `admin_operation_log` VALUES (1955, 2, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:12:19', '2020-08-19 17:12:19');
INSERT INTO `admin_operation_log` VALUES (1956, 2, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:12:27', '2020-08-19 17:12:27');
INSERT INTO `admin_operation_log` VALUES (1957, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:12:33', '2020-08-19 17:12:33');
INSERT INTO `admin_operation_log` VALUES (1958, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:12:35', '2020-08-19 17:12:35');
INSERT INTO `admin_operation_log` VALUES (1959, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:12:49', '2020-08-19 17:12:49');
INSERT INTO `admin_operation_log` VALUES (1960, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-19 17:12:56', '2020-08-19 17:12:56');
INSERT INTO `admin_operation_log` VALUES (1961, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:13:46', '2020-08-19 17:13:46');
INSERT INTO `admin_operation_log` VALUES (1962, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:16:36', '2020-08-19 17:16:36');
INSERT INTO `admin_operation_log` VALUES (1963, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e021111\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-19 17:16:42', '2020-08-19 17:16:42');
INSERT INTO `admin_operation_log` VALUES (1964, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:16:43', '2020-08-19 17:16:43');
INSERT INTO `admin_operation_log` VALUES (1965, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e021111\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:17:01', '2020-08-19 17:17:01');
INSERT INTO `admin_operation_log` VALUES (1966, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:17:18', '2020-08-19 17:17:18');
INSERT INTO `admin_operation_log` VALUES (1967, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02111133\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:17:22', '2020-08-19 17:17:22');
INSERT INTO `admin_operation_log` VALUES (1968, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:19:53', '2020-08-19 17:19:53');
INSERT INTO `admin_operation_log` VALUES (1969, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02111133as\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:19:58', '2020-08-19 17:19:58');
INSERT INTO `admin_operation_log` VALUES (1970, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:20:30', '2020-08-19 17:20:30');
INSERT INTO `admin_operation_log` VALUES (1971, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:20:31', '2020-08-19 17:20:31');
INSERT INTO `admin_operation_log` VALUES (1972, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:20:37', '2020-08-19 17:20:37');
INSERT INTO `admin_operation_log` VALUES (1973, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:20:38', '2020-08-19 17:20:38');
INSERT INTO `admin_operation_log` VALUES (1974, 2, 'admin/customer-demands/3', 'GET', '127.0.0.1', '[]', '2020-08-19 17:22:07', '2020-08-19 17:22:07');
INSERT INTO `admin_operation_log` VALUES (1975, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:22:13', '2020-08-19 17:22:13');
INSERT INTO `admin_operation_log` VALUES (1976, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\\u6309\\u65f6\\u5927\\u5927\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\\/3\"}', '2020-08-19 17:22:19', '2020-08-19 17:22:19');
INSERT INTO `admin_operation_log` VALUES (1977, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:22:45', '2020-08-19 17:22:45');
INSERT INTO `admin_operation_log` VALUES (1978, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:22:46', '2020-08-19 17:22:46');
INSERT INTO `admin_operation_log` VALUES (1979, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\\u6309\\u65f6\\u5927\\u5927\\u6c34\\u7535\\u8d39\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:22:52', '2020-08-19 17:22:52');
INSERT INTO `admin_operation_log` VALUES (1980, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:22:53', '2020-08-19 17:22:53');
INSERT INTO `admin_operation_log` VALUES (1981, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\\u6309\\u65f6\\u5927\\u5927\\u6c34\\u7535\\u8d39\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:23:15', '2020-08-19 17:23:15');
INSERT INTO `admin_operation_log` VALUES (1982, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:23:16', '2020-08-19 17:23:16');
INSERT INTO `admin_operation_log` VALUES (1983, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:23:21', '2020-08-19 17:23:21');
INSERT INTO `admin_operation_log` VALUES (1984, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\\u6309\\u65f6\\u5927\\u5927\\u6c34\\u7535\\u8d39\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:23:26', '2020-08-19 17:23:26');
INSERT INTO `admin_operation_log` VALUES (1985, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:23:27', '2020-08-19 17:23:27');
INSERT INTO `admin_operation_log` VALUES (1986, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\\u6309\\u65f6\\u5927\\u5927\\u6c34\\u7535\\u8d39\\u6c34\\u7535\\u8d39\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:23:41', '2020-08-19 17:23:41');
INSERT INTO `admin_operation_log` VALUES (1987, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:23:59', '2020-08-19 17:23:59');
INSERT INTO `admin_operation_log` VALUES (1988, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:24:00', '2020-08-19 17:24:00');
INSERT INTO `admin_operation_log` VALUES (1989, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"2\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\\u6309\\u65f6\\u5927\\u5927\\u6c34\\u7535\\u8d39\\u6c34\\u7535\\u8d39\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:24:04', '2020-08-19 17:24:04');
INSERT INTO `admin_operation_log` VALUES (1990, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-19 17:24:50', '2020-08-19 17:24:50');
INSERT INTO `admin_operation_log` VALUES (1991, 2, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '[]', '2020-08-19 17:24:51', '2020-08-19 17:24:51');
INSERT INTO `admin_operation_log` VALUES (1992, 2, 'admin/customer-demands/3', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02111133as\\u5b89\\u8fbe\\u5e02\\u591a\\u6309\\u65f6\\u5927\\u5927\\u6c34\\u7535\\u8d39\\u6c34\\u7535\\u8d39\",\"owner_user_id\":\"1\",\"last_user_id\":\"1\",\"_token\":\"IAhOSEW2JeJBTqLD4iDbTnGc2LygAvHbL5n7Fi2c\",\"_method\":\"PUT\"}', '2020-08-19 17:24:55', '2020-08-19 17:24:55');
INSERT INTO `admin_operation_log` VALUES (1993, 2, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-19 17:24:55', '2020-08-19 17:24:55');
INSERT INTO `admin_operation_log` VALUES (1994, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-20 15:15:53', '2020-08-20 15:15:53');
INSERT INTO `admin_operation_log` VALUES (1995, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:30:20', '2020-08-20 15:30:20');
INSERT INTO `admin_operation_log` VALUES (1996, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:30:23', '2020-08-20 15:30:23');
INSERT INTO `admin_operation_log` VALUES (1997, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:30:28', '2020-08-20 15:30:28');
INSERT INTO `admin_operation_log` VALUES (1998, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:30:40', '2020-08-20 15:30:40');
INSERT INTO `admin_operation_log` VALUES (1999, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-20 15:30:51', '2020-08-20 15:30:51');
INSERT INTO `admin_operation_log` VALUES (2000, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:34:09', '2020-08-20 15:34:09');
INSERT INTO `admin_operation_log` VALUES (2001, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:34:13', '2020-08-20 15:34:13');
INSERT INTO `admin_operation_log` VALUES (2002, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"password_confirmation\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",\"7\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"yUHLZ8FzdZexQE5SxeQe8eQ5p6NlXKNErIyI5Rox\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-20 15:34:26', '2020-08-20 15:34:26');
INSERT INTO `admin_operation_log` VALUES (2003, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-20 15:34:27', '2020-08-20 15:34:27');
INSERT INTO `admin_operation_log` VALUES (2004, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:34:31', '2020-08-20 15:34:31');
INSERT INTO `admin_operation_log` VALUES (2005, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"name\":\"\\u8096\\u9759\",\"phone\":\"15771705279\",\"username\":\"\\u8096\\u9759\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"entry_time\":\"2020\\u5e7408\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"3\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"yUHLZ8FzdZexQE5SxeQe8eQ5p6NlXKNErIyI5Rox\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-20 15:35:20', '2020-08-20 15:35:20');
INSERT INTO `admin_operation_log` VALUES (2006, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-20 15:35:21', '2020-08-20 15:35:21');
INSERT INTO `admin_operation_log` VALUES (2007, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:35:27', '2020-08-20 15:35:27');
INSERT INTO `admin_operation_log` VALUES (2008, 3, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-20 15:35:40', '2020-08-20 15:35:40');
INSERT INTO `admin_operation_log` VALUES (2009, 3, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:35:46', '2020-08-20 15:35:46');
INSERT INTO `admin_operation_log` VALUES (2010, 3, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:35:53', '2020-08-20 15:35:53');
INSERT INTO `admin_operation_log` VALUES (2011, 3, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:35:57', '2020-08-20 15:35:57');
INSERT INTO `admin_operation_log` VALUES (2012, 3, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:36:10', '2020-08-20 15:36:10');
INSERT INTO `admin_operation_log` VALUES (2013, 3, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:36:13', '2020-08-20 15:36:13');
INSERT INTO `admin_operation_log` VALUES (2014, 3, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-20 15:36:34', '2020-08-20 15:36:34');
INSERT INTO `admin_operation_log` VALUES (2015, 3, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-20 15:38:19', '2020-08-20 15:38:19');
INSERT INTO `admin_operation_log` VALUES (2016, 3, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:39:17', '2020-08-20 15:39:17');
INSERT INTO `admin_operation_log` VALUES (2017, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-20 15:39:29', '2020-08-20 15:39:29');
INSERT INTO `admin_operation_log` VALUES (2018, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:43:48', '2020-08-20 15:43:48');
INSERT INTO `admin_operation_log` VALUES (2019, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:43:48', '2020-08-20 15:43:48');
INSERT INTO `admin_operation_log` VALUES (2020, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:43:59', '2020-08-20 15:43:59');
INSERT INTO `admin_operation_log` VALUES (2021, 1, 'admin/auth/roles/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:57:44', '2020-08-20 15:57:44');
INSERT INTO `admin_operation_log` VALUES (2022, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:57:47', '2020-08-20 15:57:47');
INSERT INTO `admin_operation_log` VALUES (2023, 1, 'admin/auth/permissions/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:57:52', '2020-08-20 15:57:52');
INSERT INTO `admin_operation_log` VALUES (2024, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:57:57', '2020-08-20 15:57:57');
INSERT INTO `admin_operation_log` VALUES (2025, 1, 'admin/auth/permissions/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:58:01', '2020-08-20 15:58:01');
INSERT INTO `admin_operation_log` VALUES (2026, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:58:14', '2020-08-20 15:58:14');
INSERT INTO `admin_operation_log` VALUES (2027, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:58:19', '2020-08-20 15:58:19');
INSERT INTO `admin_operation_log` VALUES (2028, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"slug\":\"customer\",\"name\":\"\\u5ba2\\u6237\",\"http_method\":[null],\"http_path\":\"\\/customers*\\r\\n\\/customer-demands*\\r\\n\\/customer-contacts*\\r\\n\\/api\\/getCustomerContact*\\r\\n\\/api\\/getCustomerDemand*\",\"_token\":\"up0LvAMormFjGwqEpMMqgxMQqWVWDpq5GHCjtcPy\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/permissions\"}', '2020-08-20 15:58:37', '2020-08-20 15:58:37');
INSERT INTO `admin_operation_log` VALUES (2029, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2020-08-20 15:58:37', '2020-08-20 15:58:37');
INSERT INTO `admin_operation_log` VALUES (2030, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:58:44', '2020-08-20 15:58:44');
INSERT INTO `admin_operation_log` VALUES (2031, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:58:48', '2020-08-20 15:58:48');
INSERT INTO `admin_operation_log` VALUES (2032, 1, 'admin/auth/roles/3', 'PUT', '127.0.0.1', '{\"slug\":\"sales\",\"name\":\"\\u9500\\u552e\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",\"10\",null],\"_token\":\"up0LvAMormFjGwqEpMMqgxMQqWVWDpq5GHCjtcPy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-20 15:58:53', '2020-08-20 15:58:53');
INSERT INTO `admin_operation_log` VALUES (2033, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-20 15:58:54', '2020-08-20 15:58:54');
INSERT INTO `admin_operation_log` VALUES (2034, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:59:04', '2020-08-20 15:59:04');
INSERT INTO `admin_operation_log` VALUES (2035, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"commerce\",\"name\":\"\\u5546\\u52a1\\u90e8\",\"permissions\":[\"2\",\"3\",\"4\",\"5\",\"7\",\"10\",null],\"_token\":\"up0LvAMormFjGwqEpMMqgxMQqWVWDpq5GHCjtcPy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/roles\"}', '2020-08-20 15:59:08', '2020-08-20 15:59:08');
INSERT INTO `admin_operation_log` VALUES (2036, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2020-08-20 15:59:09', '2020-08-20 15:59:09');
INSERT INTO `admin_operation_log` VALUES (2037, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:59:47', '2020-08-20 15:59:47');
INSERT INTO `admin_operation_log` VALUES (2038, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 15:59:52', '2020-08-20 15:59:52');
INSERT INTO `admin_operation_log` VALUES (2039, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17603245687\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"password_confirmation\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"up0LvAMormFjGwqEpMMqgxMQqWVWDpq5GHCjtcPy\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-20 16:00:13', '2020-08-20 16:00:13');
INSERT INTO `admin_operation_log` VALUES (2040, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-20 16:00:14', '2020-08-20 16:00:14');
INSERT INTO `admin_operation_log` VALUES (2041, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 16:02:42', '2020-08-20 16:02:42');
INSERT INTO `admin_operation_log` VALUES (2042, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-20 16:02:57', '2020-08-20 16:02:57');
INSERT INTO `admin_operation_log` VALUES (2043, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-20 16:10:17', '2020-08-20 16:10:17');
INSERT INTO `admin_operation_log` VALUES (2044, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-21 10:32:57', '2020-08-21 10:32:57');
INSERT INTO `admin_operation_log` VALUES (2045, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 10:33:03', '2020-08-21 10:33:03');
INSERT INTO `admin_operation_log` VALUES (2046, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:07:37', '2020-08-21 11:07:37');
INSERT INTO `admin_operation_log` VALUES (2047, 1, 'admin/auth/users/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:07:42', '2020-08-21 11:07:42');
INSERT INTO `admin_operation_log` VALUES (2048, 1, 'admin/auth/users/3', 'PUT', '127.0.0.1', '{\"name\":\"\\u8f66\\u5b9d\\u5229\",\"phone\":\"13700243280\",\"username\":\"\\u8f66\\u5b9d\\u5229\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"entry_time\":\"2020\\u5e7408\\u670820\\u65e5\",\"dept_id\":\"8\",\"roles\":[\"6\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:09:39', '2020-08-21 11:09:39');
INSERT INTO `admin_operation_log` VALUES (2049, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:09:40', '2020-08-21 11:09:40');
INSERT INTO `admin_operation_log` VALUES (2050, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:09:46', '2020-08-21 11:09:46');
INSERT INTO `admin_operation_log` VALUES (2051, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"name\":\"\\u6768\\u4f73\\u654f\",\"phone\":\"17602941415\",\"username\":\"\\u6768\\u4f73\\u654f\",\"password\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"password_confirmation\":\"$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX\\/WmJt6y\",\"entry_time\":\"2020\\u5e7407\\u670820\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",null],\"permissions\":[null],\"sex\":\"1\",\"birthday\":\"1993\\u5e7410\\u670813\\u65e5\",\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:10:22', '2020-08-21 11:10:22');
INSERT INTO `admin_operation_log` VALUES (2052, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:10:23', '2020-08-21 11:10:23');
INSERT INTO `admin_operation_log` VALUES (2053, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:10:29', '2020-08-21 11:10:29');
INSERT INTO `admin_operation_log` VALUES (2054, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"name\":\"\\u6a0a\\u4e94\\u4e00\",\"phone\":\"18209296175\",\"username\":\"\\u6a0a\\u4e94\\u4e00\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"entry_time\":\"2020\\u5e7408\\u670821\\u65e5\",\"dept_id\":\"4\",\"roles\":[\"3\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:11:59', '2020-08-21 11:11:59');
INSERT INTO `admin_operation_log` VALUES (2055, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:12:00', '2020-08-21 11:12:00');
INSERT INTO `admin_operation_log` VALUES (2056, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:12:03', '2020-08-21 11:12:03');
INSERT INTO `admin_operation_log` VALUES (2057, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"name\":\"\\u90ed\\u8fea\",\"phone\":\"18792926755\",\"username\":\"\\u90ed\\u8fea\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"entry_time\":\"2020\\u5e7408\\u670821\\u65e5\",\"dept_id\":\"4\",\"roles\":[\"3\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:12:43', '2020-08-21 11:12:43');
INSERT INTO `admin_operation_log` VALUES (2058, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:12:44', '2020-08-21 11:12:44');
INSERT INTO `admin_operation_log` VALUES (2059, 1, 'admin/auth/users/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:12:50', '2020-08-21 11:12:50');
INSERT INTO `admin_operation_log` VALUES (2060, 1, 'admin/auth/users/4', 'PUT', '127.0.0.1', '{\"name\":\"\\u6a0a\\u4e94\\u4e00\",\"phone\":\"18209296175\",\"username\":\"\\u6a0a\\u4e94\\u4e00\",\"password\":\"$2y$10$Wr6hq6U2qKvWKMBWH7.Up.kQAdfXrMOunAbqkuaJAbpk1M2YE\\/ugq\",\"password_confirmation\":\"$2y$10$Wr6hq6U2qKvWKMBWH7.Up.kQAdfXrMOunAbqkuaJAbpk1M2YE\\/ugq\",\"entry_time\":\"2020\\u5e7408\\u670821\\u65e5\",\"dept_id\":\"5\",\"roles\":[\"3\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:12:55', '2020-08-21 11:12:55');
INSERT INTO `admin_operation_log` VALUES (2061, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:12:56', '2020-08-21 11:12:56');
INSERT INTO `admin_operation_log` VALUES (2062, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:12:59', '2020-08-21 11:12:59');
INSERT INTO `admin_operation_log` VALUES (2063, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"name\":\"\\u8096\\u7ef4\\u5a1f\",\"phone\":\"18229035376\",\"username\":\"\\u8096\\u7ef4\\u5a1f\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"entry_time\":\"2020\\u5e7408\\u670821\\u65e5\",\"dept_id\":\"2\",\"roles\":[\"2\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:13:36', '2020-08-21 11:13:36');
INSERT INTO `admin_operation_log` VALUES (2064, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:13:36', '2020-08-21 11:13:36');
INSERT INTO `admin_operation_log` VALUES (2065, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:13:39', '2020-08-21 11:13:39');
INSERT INTO `admin_operation_log` VALUES (2066, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"name\":\"\\u8c22\\u83f2\",\"phone\":\"13572421136\",\"username\":\"\\u8c22\\u83f2\",\"password\":\"123456789\",\"password_confirmation\":\"123456789\",\"entry_time\":\"2020\\u5e7408\\u670821\\u65e5\",\"dept_id\":\"7\",\"roles\":[\"4\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:15:21', '2020-08-21 11:15:21');
INSERT INTO `admin_operation_log` VALUES (2067, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:15:22', '2020-08-21 11:15:22');
INSERT INTO `admin_operation_log` VALUES (2068, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:15:24', '2020-08-21 11:15:24');
INSERT INTO `admin_operation_log` VALUES (2069, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:15:59', '2020-08-21 11:15:59');
INSERT INTO `admin_operation_log` VALUES (2070, 1, 'admin/auth/users/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 11:16:05', '2020-08-21 11:16:05');
INSERT INTO `admin_operation_log` VALUES (2071, 1, 'admin/auth/users/7', 'PUT', '127.0.0.1', '{\"name\":\"\\u8c22\\u83f2\",\"phone\":\"13572421136\",\"username\":\"\\u8c22\\u83f2\",\"password\":\"$2y$10$tPAd9PBRSADj1Hdn6ure5.qbcAwWJ\\/tXN033q1\\/fL\\/4Xft0xMV6yC\",\"password_confirmation\":\"$2y$10$tPAd9PBRSADj1Hdn6ure5.qbcAwWJ\\/tXN033q1\\/fL\\/4Xft0xMV6yC\",\"entry_time\":\"2020\\u5e7408\\u670821\\u65e5\",\"dept_id\":\"7\",\"roles\":[\"4\",\"7\",null],\"permissions\":[null],\"sex\":\"0\",\"birthday\":null,\"is_job\":\"0\",\"quit_time\":null,\"_token\":\"l6TfhBfq1rVnAGpfvrngEvSdgofW9ccimGmrobrM\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/auth\\/users\"}', '2020-08-21 11:16:13', '2020-08-21 11:16:13');
INSERT INTO `admin_operation_log` VALUES (2072, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2020-08-21 11:16:13', '2020-08-21 11:16:13');
INSERT INTO `admin_operation_log` VALUES (2073, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 14:07:34', '2020-08-21 14:07:34');
INSERT INTO `admin_operation_log` VALUES (2074, 1, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-21 14:07:40', '2020-08-21 14:07:40');
INSERT INTO `admin_operation_log` VALUES (2075, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 13:03:05', '2020-08-22 13:03:05');
INSERT INTO `admin_operation_log` VALUES (2076, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:04:18', '2020-08-22 13:04:18');
INSERT INTO `admin_operation_log` VALUES (2077, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:04:21', '2020-08-22 13:04:21');
INSERT INTO `admin_operation_log` VALUES (2078, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:04:41', '2020-08-22 13:04:41');
INSERT INTO `admin_operation_log` VALUES (2079, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:04:48', '2020-08-22 13:04:48');
INSERT INTO `admin_operation_log` VALUES (2080, 3, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 13:05:07', '2020-08-22 13:05:07');
INSERT INTO `admin_operation_log` VALUES (2081, 3, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:20', '2020-08-22 13:05:20');
INSERT INTO `admin_operation_log` VALUES (2082, 3, 'admin/departments', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:22', '2020-08-22 13:05:22');
INSERT INTO `admin_operation_log` VALUES (2083, 3, 'admin/channels', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:24', '2020-08-22 13:05:24');
INSERT INTO `admin_operation_log` VALUES (2084, 3, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:25', '2020-08-22 13:05:25');
INSERT INTO `admin_operation_log` VALUES (2085, 3, 'admin/params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:26', '2020-08-22 13:05:26');
INSERT INTO `admin_operation_log` VALUES (2086, 3, 'admin/product-params', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:28', '2020-08-22 13:05:28');
INSERT INTO `admin_operation_log` VALUES (2087, 3, 'admin/cart-templates', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:29', '2020-08-22 13:05:29');
INSERT INTO `admin_operation_log` VALUES (2088, 3, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:05:34', '2020-08-22 13:05:34');
INSERT INTO `admin_operation_log` VALUES (2089, 7, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 13:05:46', '2020-08-22 13:05:46');
INSERT INTO `admin_operation_log` VALUES (2090, 7, 'admin/pay-type', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:10:32', '2020-08-22 13:10:32');
INSERT INTO `admin_operation_log` VALUES (2091, 7, 'admin/orders-renew-log', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:10:33', '2020-08-22 13:10:33');
INSERT INTO `admin_operation_log` VALUES (2092, 7, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:10:36', '2020-08-22 13:10:36');
INSERT INTO `admin_operation_log` VALUES (2093, 7, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:10:47', '2020-08-22 13:10:47');
INSERT INTO `admin_operation_log` VALUES (2094, 7, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:10:51', '2020-08-22 13:10:51');
INSERT INTO `admin_operation_log` VALUES (2095, 7, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:10:53', '2020-08-22 13:10:53');
INSERT INTO `admin_operation_log` VALUES (2096, 7, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:11:00', '2020-08-22 13:11:00');
INSERT INTO `admin_operation_log` VALUES (2097, 7, 'admin/orders/6', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:11:03', '2020-08-22 13:11:03');
INSERT INTO `admin_operation_log` VALUES (2098, 7, 'admin/order-payment-log/create', 'GET', '127.0.0.1', '{\"renew_log_id\":\"10\",\"_pjax\":\"#pjax-container\"}', '2020-08-22 13:11:08', '2020-08-22 13:11:08');
INSERT INTO `admin_operation_log` VALUES (2099, 7, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 14:26:02', '2020-08-22 14:26:02');
INSERT INTO `admin_operation_log` VALUES (2100, 7, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 14:26:07', '2020-08-22 14:26:07');
INSERT INTO `admin_operation_log` VALUES (2101, 4, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 14:26:19', '2020-08-22 14:26:19');
INSERT INTO `admin_operation_log` VALUES (2102, 4, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 14:26:30', '2020-08-22 14:26:30');
INSERT INTO `admin_operation_log` VALUES (2103, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 14:26:37', '2020-08-22 14:26:37');
INSERT INTO `admin_operation_log` VALUES (2104, 4, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-22 14:26:38', '2020-08-22 14:26:38');
INSERT INTO `admin_operation_log` VALUES (2105, 4, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 14:28:13', '2020-08-22 14:28:13');
INSERT INTO `admin_operation_log` VALUES (2106, 4, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-22 14:28:57', '2020-08-22 14:28:57');
INSERT INTO `admin_operation_log` VALUES (2107, 4, 'admin/customers', 'GET', '127.0.0.1', '[]', '2020-08-22 14:29:17', '2020-08-22 14:29:17');
INSERT INTO `admin_operation_log` VALUES (2108, 4, 'admin/customers/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 14:29:22', '2020-08-22 14:29:22');
INSERT INTO `admin_operation_log` VALUES (2109, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:30:17', '2020-08-22 14:30:17');
INSERT INTO `admin_operation_log` VALUES (2110, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:31:35', '2020-08-22 14:31:35');
INSERT INTO `admin_operation_log` VALUES (2111, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:31:42', '2020-08-22 14:31:42');
INSERT INTO `admin_operation_log` VALUES (2112, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:32:15', '2020-08-22 14:32:15');
INSERT INTO `admin_operation_log` VALUES (2113, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:32:32', '2020-08-22 14:32:32');
INSERT INTO `admin_operation_log` VALUES (2114, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:32:43', '2020-08-22 14:32:43');
INSERT INTO `admin_operation_log` VALUES (2115, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:33:38', '2020-08-22 14:33:38');
INSERT INTO `admin_operation_log` VALUES (2116, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:47:13', '2020-08-22 14:47:13');
INSERT INTO `admin_operation_log` VALUES (2117, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:47:33', '2020-08-22 14:47:33');
INSERT INTO `admin_operation_log` VALUES (2118, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:47:53', '2020-08-22 14:47:53');
INSERT INTO `admin_operation_log` VALUES (2119, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 14:58:26', '2020-08-22 14:58:26');
INSERT INTO `admin_operation_log` VALUES (2120, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:08:43', '2020-08-22 15:08:43');
INSERT INTO `admin_operation_log` VALUES (2121, 4, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:08:46', '2020-08-22 15:08:46');
INSERT INTO `admin_operation_log` VALUES (2122, 4, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:08:49', '2020-08-22 15:08:49');
INSERT INTO `admin_operation_log` VALUES (2123, 4, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:10:12', '2020-08-22 15:10:12');
INSERT INTO `admin_operation_log` VALUES (2124, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:10:14', '2020-08-22 15:10:14');
INSERT INTO `admin_operation_log` VALUES (2125, 4, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:10:16', '2020-08-22 15:10:16');
INSERT INTO `admin_operation_log` VALUES (2126, 4, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"2\"}', '2020-08-22 15:10:27', '2020-08-22 15:10:27');
INSERT INTO `admin_operation_log` VALUES (2127, 4, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:13:27', '2020-08-22 15:13:27');
INSERT INTO `admin_operation_log` VALUES (2128, 4, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 15:14:11', '2020-08-22 15:14:11');
INSERT INTO `admin_operation_log` VALUES (2129, 4, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '[]', '2020-08-22 15:15:30', '2020-08-22 15:15:30');
INSERT INTO `admin_operation_log` VALUES (2130, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:21:54', '2020-08-22 16:21:54');
INSERT INTO `admin_operation_log` VALUES (2131, 4, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:02', '2020-08-22 16:31:02');
INSERT INTO `admin_operation_log` VALUES (2132, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:04', '2020-08-22 16:31:04');
INSERT INTO `admin_operation_log` VALUES (2133, 4, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:06', '2020-08-22 16:31:06');
INSERT INTO `admin_operation_log` VALUES (2134, 4, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:08', '2020-08-22 16:31:08');
INSERT INTO `admin_operation_log` VALUES (2135, 4, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:10', '2020-08-22 16:31:10');
INSERT INTO `admin_operation_log` VALUES (2136, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:31:16', '2020-08-22 16:31:16');
INSERT INTO `admin_operation_log` VALUES (2137, 4, 'admin/customer-contacts', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"name\":\"\\u6d4b\\u8bd51\",\"phone\":\"16333333333\",\"is_first\":\"1\",\"sex\":\"0\",\"owner_user_id\":\"4\",\"last_user_id\":\"4\",\"_token\":\"atRDCPmtJr9erMiGOm6OxOWT4ufEzZAu8tcLH4xb\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-contacts\"}', '2020-08-22 16:31:27', '2020-08-22 16:31:27');
INSERT INTO `admin_operation_log` VALUES (2138, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 16:31:28', '2020-08-22 16:31:28');
INSERT INTO `admin_operation_log` VALUES (2139, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:33', '2020-08-22 16:31:33');
INSERT INTO `admin_operation_log` VALUES (2140, 4, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:35', '2020-08-22 16:31:35');
INSERT INTO `admin_operation_log` VALUES (2141, 4, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:31:38', '2020-08-22 16:31:38');
INSERT INTO `admin_operation_log` VALUES (2142, 4, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"4\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"4\",\"_token\":\"atRDCPmtJr9erMiGOm6OxOWT4ufEzZAu8tcLH4xb\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 16:31:43', '2020-08-22 16:31:43');
INSERT INTO `admin_operation_log` VALUES (2143, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 16:31:44', '2020-08-22 16:31:44');
INSERT INTO `admin_operation_log` VALUES (2144, 4, 'admin/customer-demands/5', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:31:51', '2020-08-22 16:31:51');
INSERT INTO `admin_operation_log` VALUES (2145, 4, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 16:31:52', '2020-08-22 16:31:52');
INSERT INTO `admin_operation_log` VALUES (2146, 4, 'admin/customer-contacts/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:33:04', '2020-08-22 16:33:04');
INSERT INTO `admin_operation_log` VALUES (2147, 4, 'admin/customer-contacts/4', 'GET', '127.0.0.1', '[]', '2020-08-22 16:33:35', '2020-08-22 16:33:35');
INSERT INTO `admin_operation_log` VALUES (2148, 4, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:33:40', '2020-08-22 16:33:40');
INSERT INTO `admin_operation_log` VALUES (2149, 4, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:33:43', '2020-08-22 16:33:43');
INSERT INTO `admin_operation_log` VALUES (2150, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:33:47', '2020-08-22 16:33:47');
INSERT INTO `admin_operation_log` VALUES (2151, 4, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-22 16:35:54', '2020-08-22 16:35:54');
INSERT INTO `admin_operation_log` VALUES (2152, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:36:07', '2020-08-22 16:36:07');
INSERT INTO `admin_operation_log` VALUES (2153, 4, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-22 16:37:06', '2020-08-22 16:37:06');
INSERT INTO `admin_operation_log` VALUES (2154, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:37:11', '2020-08-22 16:37:11');
INSERT INTO `admin_operation_log` VALUES (2155, 4, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-22 16:37:40', '2020-08-22 16:37:40');
INSERT INTO `admin_operation_log` VALUES (2156, 4, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-22 16:37:44', '2020-08-22 16:37:44');
INSERT INTO `admin_operation_log` VALUES (2157, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:37:50', '2020-08-22 16:37:50');
INSERT INTO `admin_operation_log` VALUES (2158, 4, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-22 16:38:40', '2020-08-22 16:38:40');
INSERT INTO `admin_operation_log` VALUES (2159, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"2\"}', '2020-08-22 16:38:48', '2020-08-22 16:38:48');
INSERT INTO `admin_operation_log` VALUES (2160, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:38:51', '2020-08-22 16:38:51');
INSERT INTO `admin_operation_log` VALUES (2161, 4, 'admin/orders/create', 'GET', '127.0.0.1', '[]', '2020-08-22 16:39:19', '2020-08-22 16:39:19');
INSERT INTO `admin_operation_log` VALUES (2162, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:39:24', '2020-08-22 16:39:24');
INSERT INTO `admin_operation_log` VALUES (2163, 4, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"5\",\"product_id\":\"2\",\"start_time\":\"2020-08-22 16:39:19\",\"end_time\":\"2020-08-22 16:39:19\",\"admin_user_id\":\"4\",\"sales_remark\":\"\\u6d4b\\u8bd5\",\"price\":\"323\",\"receivable\":\"343\",\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"atRDCPmtJr9erMiGOm6OxOWT4ufEzZAu8tcLH4xb\"}', '2020-08-22 16:40:13', '2020-08-22 16:40:13');
INSERT INTO `admin_operation_log` VALUES (2164, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:40:14', '2020-08-22 16:40:14');
INSERT INTO `admin_operation_log` VALUES (2165, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:40:18', '2020-08-22 16:40:18');
INSERT INTO `admin_operation_log` VALUES (2166, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:40:49', '2020-08-22 16:40:49');
INSERT INTO `admin_operation_log` VALUES (2167, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:40:58', '2020-08-22 16:40:58');
INSERT INTO `admin_operation_log` VALUES (2168, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:43:11', '2020-08-22 16:43:11');
INSERT INTO `admin_operation_log` VALUES (2169, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:43:27', '2020-08-22 16:43:27');
INSERT INTO `admin_operation_log` VALUES (2170, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:43:32', '2020-08-22 16:43:32');
INSERT INTO `admin_operation_log` VALUES (2171, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:44:41', '2020-08-22 16:44:41');
INSERT INTO `admin_operation_log` VALUES (2172, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:47:39', '2020-08-22 16:47:39');
INSERT INTO `admin_operation_log` VALUES (2173, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:47:59', '2020-08-22 16:47:59');
INSERT INTO `admin_operation_log` VALUES (2174, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:49:50', '2020-08-22 16:49:50');
INSERT INTO `admin_operation_log` VALUES (2175, 4, 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:51:20', '2020-08-22 16:51:20');
INSERT INTO `admin_operation_log` VALUES (2176, 4, 'admin/api/getCustomerDemand', 'GET', '127.0.0.1', '{\"last_user_id\":\"4\",\"q\":\"1\"}', '2020-08-22 16:51:24', '2020-08-22 16:51:24');
INSERT INTO `admin_operation_log` VALUES (2177, 4, 'admin/orders', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_demand_id\":\"5\",\"product_id\":\"3\",\"start_time\":\"2020-08-22 16:51:20\",\"end_time\":\"2020-08-22 16:51:20\",\"admin_user_id\":\"4\",\"sales_remark\":\"\\u6d4b\\u8bd5\",\"price\":\"323\",\"receivable\":\"323\",\"receipts\":null,\"status\":\"0\",\"service_status\":\"0\",\"_token\":\"atRDCPmtJr9erMiGOm6OxOWT4ufEzZAu8tcLH4xb\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/orders\"}', '2020-08-22 16:51:56', '2020-08-22 16:51:56');
INSERT INTO `admin_operation_log` VALUES (2178, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:51:57', '2020-08-22 16:51:57');
INSERT INTO `admin_operation_log` VALUES (2179, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:54:31', '2020-08-22 16:54:31');
INSERT INTO `admin_operation_log` VALUES (2180, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 16:54:44', '2020-08-22 16:54:44');
INSERT INTO `admin_operation_log` VALUES (2181, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 16:55:05', '2020-08-22 16:55:05');
INSERT INTO `admin_operation_log` VALUES (2182, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:00:45', '2020-08-22 17:00:45');
INSERT INTO `admin_operation_log` VALUES (2183, 4, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:18:14', '2020-08-22 17:18:14');
INSERT INTO `admin_operation_log` VALUES (2184, 4, 'admin/customer-contacts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:18:17', '2020-08-22 17:18:17');
INSERT INTO `admin_operation_log` VALUES (2185, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:18:20', '2020-08-22 17:18:20');
INSERT INTO `admin_operation_log` VALUES (2186, 4, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:18:23', '2020-08-22 17:18:23');
INSERT INTO `admin_operation_log` VALUES (2187, 4, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:29:59', '2020-08-22 17:29:59');
INSERT INTO `admin_operation_log` VALUES (2188, 4, 'admin/orders-renew-log/create', 'GET', '127.0.0.1', '{\"orders_id\":\"7\",\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:30:06', '2020-08-22 17:30:06');
INSERT INTO `admin_operation_log` VALUES (2189, 4, 'admin/orders-renew-log', 'POST', '127.0.0.1', '{\"orders_id\":\"7\",\"orders_code\":\"20200822164014028037E6D1D1A2\",\"product_id\":\"2\",\"start_time\":\"2020-08-22 16:39:19\",\"old_end_time\":\"2020-08-22 16:39:19\",\"end_time\":\"2020-08-23 00:00:00\",\"receivable\":\"343\",\"receipts\":null,\"arrears\":null,\"is_renew\":\"1\",\"is_tax\":\"0\",\"owner_user_id\":\"4\",\"_token\":\"atRDCPmtJr9erMiGOm6OxOWT4ufEzZAu8tcLH4xb\"}', '2020-08-22 17:30:19', '2020-08-22 17:30:19');
INSERT INTO `admin_operation_log` VALUES (2190, 4, 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-08-22 17:30:20', '2020-08-22 17:30:20');
INSERT INTO `admin_operation_log` VALUES (2191, 4, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:30:32', '2020-08-22 17:30:32');
INSERT INTO `admin_operation_log` VALUES (2192, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 17:30:47', '2020-08-22 17:30:47');
INSERT INTO `admin_operation_log` VALUES (2193, 2, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:32:54', '2020-08-22 17:32:54');
INSERT INTO `admin_operation_log` VALUES (2194, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:32:57', '2020-08-22 17:32:57');
INSERT INTO `admin_operation_log` VALUES (2195, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:32:59', '2020-08-22 17:32:59');
INSERT INTO `admin_operation_log` VALUES (2196, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:33:03', '2020-08-22 17:33:03');
INSERT INTO `admin_operation_log` VALUES (2197, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:33:11', '2020-08-22 17:33:11');
INSERT INTO `admin_operation_log` VALUES (2198, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 17:33:29', '2020-08-22 17:33:29');
INSERT INTO `admin_operation_log` VALUES (2199, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:39:47', '2020-08-22 17:39:47');
INSERT INTO `admin_operation_log` VALUES (2200, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:39:49', '2020-08-22 17:39:49');
INSERT INTO `admin_operation_log` VALUES (2201, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:39:53', '2020-08-22 17:39:53');
INSERT INTO `admin_operation_log` VALUES (2202, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:39:56', '2020-08-22 17:39:56');
INSERT INTO `admin_operation_log` VALUES (2203, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:40:00', '2020-08-22 17:40:00');
INSERT INTO `admin_operation_log` VALUES (2204, 1, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:40:03', '2020-08-22 17:40:03');
INSERT INTO `admin_operation_log` VALUES (2205, 1, 'admin/customer-demands/4', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"4\",\"_token\":\"IFPNs3NC3hGLcMhaCKaK9lGu8Fck0VlnMLJX5rTF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 17:40:13', '2020-08-22 17:40:13');
INSERT INTO `admin_operation_log` VALUES (2206, 1, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-22 17:40:14', '2020-08-22 17:40:14');
INSERT INTO `admin_operation_log` VALUES (2207, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:40:19', '2020-08-22 17:40:19');
INSERT INTO `admin_operation_log` VALUES (2208, 2, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 17:40:36', '2020-08-22 17:40:36');
INSERT INTO `admin_operation_log` VALUES (2209, 2, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:40:41', '2020-08-22 17:40:41');
INSERT INTO `admin_operation_log` VALUES (2210, 2, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:40:46', '2020-08-22 17:40:46');
INSERT INTO `admin_operation_log` VALUES (2211, 2, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:40:48', '2020-08-22 17:40:48');
INSERT INTO `admin_operation_log` VALUES (2212, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:40:58', '2020-08-22 17:40:58');
INSERT INTO `admin_operation_log` VALUES (2213, 4, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 17:41:11', '2020-08-22 17:41:11');
INSERT INTO `admin_operation_log` VALUES (2214, 4, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:41:15', '2020-08-22 17:41:15');
INSERT INTO `admin_operation_log` VALUES (2215, 4, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:41:21', '2020-08-22 17:41:21');
INSERT INTO `admin_operation_log` VALUES (2216, 4, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:41:27', '2020-08-22 17:41:27');
INSERT INTO `admin_operation_log` VALUES (2217, 4, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:41:38', '2020-08-22 17:41:38');
INSERT INTO `admin_operation_log` VALUES (2218, 4, 'admin/customers/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:41:41', '2020-08-22 17:41:41');
INSERT INTO `admin_operation_log` VALUES (2219, 4, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:43:02', '2020-08-22 17:43:02');
INSERT INTO `admin_operation_log` VALUES (2220, 1, 'admin', 'GET', '127.0.0.1', '[]', '2020-08-22 17:43:13', '2020-08-22 17:43:13');
INSERT INTO `admin_operation_log` VALUES (2221, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:43:18', '2020-08-22 17:43:18');
INSERT INTO `admin_operation_log` VALUES (2222, 1, 'admin/customer-demands/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:43:20', '2020-08-22 17:43:20');
INSERT INTO `admin_operation_log` VALUES (2223, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:43:30', '2020-08-22 17:43:30');
INSERT INTO `admin_operation_log` VALUES (2224, 1, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:43:33', '2020-08-22 17:43:33');
INSERT INTO `admin_operation_log` VALUES (2225, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:43:45', '2020-08-22 17:43:45');
INSERT INTO `admin_operation_log` VALUES (2226, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:43:51', '2020-08-22 17:43:51');
INSERT INTO `admin_operation_log` VALUES (2227, 1, 'admin/customer-demands/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"2\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 17:43:58', '2020-08-22 17:43:58');
INSERT INTO `admin_operation_log` VALUES (2228, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:44:07', '2020-08-22 17:44:07');
INSERT INTO `admin_operation_log` VALUES (2229, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:44:09', '2020-08-22 17:44:09');
INSERT INTO `admin_operation_log` VALUES (2230, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:44:36', '2020-08-22 17:44:36');
INSERT INTO `admin_operation_log` VALUES (2231, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-22 17:44:40', '2020-08-22 17:44:40');
INSERT INTO `admin_operation_log` VALUES (2232, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:44:44', '2020-08-22 17:44:44');
INSERT INTO `admin_operation_log` VALUES (2233, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:44:48', '2020-08-22 17:44:48');
INSERT INTO `admin_operation_log` VALUES (2234, 1, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:45:08', '2020-08-22 17:45:08');
INSERT INTO `admin_operation_log` VALUES (2235, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:45:15', '2020-08-22 17:45:15');
INSERT INTO `admin_operation_log` VALUES (2236, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:45:21', '2020-08-22 17:45:21');
INSERT INTO `admin_operation_log` VALUES (2237, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:46:42', '2020-08-22 17:46:42');
INSERT INTO `admin_operation_log` VALUES (2238, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:47:05', '2020-08-22 17:47:05');
INSERT INTO `admin_operation_log` VALUES (2239, 1, 'admin/customer-demands/1/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:48:10', '2020-08-22 17:48:10');
INSERT INTO `admin_operation_log` VALUES (2240, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:48:41', '2020-08-22 17:48:41');
INSERT INTO `admin_operation_log` VALUES (2241, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:49:45', '2020-08-22 17:49:45');
INSERT INTO `admin_operation_log` VALUES (2242, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:50:33', '2020-08-22 17:50:33');
INSERT INTO `admin_operation_log` VALUES (2243, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:50:37', '2020-08-22 17:50:37');
INSERT INTO `admin_operation_log` VALUES (2244, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:51:13', '2020-08-22 17:51:13');
INSERT INTO `admin_operation_log` VALUES (2245, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-22 17:51:13', '2020-08-22 17:51:13');
INSERT INTO `admin_operation_log` VALUES (2246, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-22 17:51:24', '2020-08-22 17:51:24');
INSERT INTO `admin_operation_log` VALUES (2247, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:51:30', '2020-08-22 17:51:30');
INSERT INTO `admin_operation_log` VALUES (2248, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:51:35', '2020-08-22 17:51:35');
INSERT INTO `admin_operation_log` VALUES (2249, 1, 'admin/customer-demands/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:51:37', '2020-08-22 17:51:37');
INSERT INTO `admin_operation_log` VALUES (2250, 1, 'admin/api/getCustomerContact', 'GET', '127.0.0.1', '{\"last_user_id\":null,\"q\":\"1\"}', '2020-08-22 17:51:40', '2020-08-22 17:51:40');
INSERT INTO `admin_operation_log` VALUES (2251, 1, 'admin/customer-demands', 'POST', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"4\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"1\",\"last_user_id\":\"6\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 17:51:48', '2020-08-22 17:51:48');
INSERT INTO `admin_operation_log` VALUES (2252, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 17:51:49', '2020-08-22 17:51:49');
INSERT INTO `admin_operation_log` VALUES (2253, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:51:56', '2020-08-22 17:51:56');
INSERT INTO `admin_operation_log` VALUES (2254, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:52:08', '2020-08-22 17:52:08');
INSERT INTO `admin_operation_log` VALUES (2255, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:52:33', '2020-08-22 17:52:33');
INSERT INTO `admin_operation_log` VALUES (2256, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-22 17:52:56', '2020-08-22 17:52:56');
INSERT INTO `admin_operation_log` VALUES (2257, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:53:01', '2020-08-22 17:53:01');
INSERT INTO `admin_operation_log` VALUES (2258, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:53:26', '2020-08-22 17:53:26');
INSERT INTO `admin_operation_log` VALUES (2259, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:53:53', '2020-08-22 17:53:53');
INSERT INTO `admin_operation_log` VALUES (2260, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:54:06', '2020-08-22 17:54:06');
INSERT INTO `admin_operation_log` VALUES (2261, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:54:10', '2020-08-22 17:54:10');
INSERT INTO `admin_operation_log` VALUES (2262, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 17:56:23', '2020-08-22 17:56:23');
INSERT INTO `admin_operation_log` VALUES (2263, 1, 'admin/customer-demands/6', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"4\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"1\",\"last_user_id\":\"5\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\"}', '2020-08-22 17:56:29', '2020-08-22 17:56:29');
INSERT INTO `admin_operation_log` VALUES (2264, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 17:56:30', '2020-08-22 17:56:30');
INSERT INTO `admin_operation_log` VALUES (2265, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:56:34', '2020-08-22 17:56:34');
INSERT INTO `admin_operation_log` VALUES (2266, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:56:42', '2020-08-22 17:56:42');
INSERT INTO `admin_operation_log` VALUES (2267, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:56:46', '2020-08-22 17:56:46');
INSERT INTO `admin_operation_log` VALUES (2268, 1, 'admin/customer-demands/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"4\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 17:56:58', '2020-08-22 17:56:58');
INSERT INTO `admin_operation_log` VALUES (2269, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:57:28', '2020-08-22 17:57:28');
INSERT INTO `admin_operation_log` VALUES (2270, 1, 'admin/customer-demands/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"5\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\"}', '2020-08-22 17:57:33', '2020-08-22 17:57:33');
INSERT INTO `admin_operation_log` VALUES (2271, 1, 'admin/customer-demands/5', 'GET', '127.0.0.1', '[]', '2020-08-22 17:57:47', '2020-08-22 17:57:47');
INSERT INTO `admin_operation_log` VALUES (2272, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-22 17:58:07', '2020-08-22 17:58:07');
INSERT INTO `admin_operation_log` VALUES (2273, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:58:12', '2020-08-22 17:58:12');
INSERT INTO `admin_operation_log` VALUES (2274, 1, 'admin/customer-demands/6', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"4\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"1\",\"last_user_id\":\"4\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 17:58:17', '2020-08-22 17:58:17');
INSERT INTO `admin_operation_log` VALUES (2275, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 17:58:18', '2020-08-22 17:58:18');
INSERT INTO `admin_operation_log` VALUES (2276, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:58:37', '2020-08-22 17:58:37');
INSERT INTO `admin_operation_log` VALUES (2277, 1, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:58:44', '2020-08-22 17:58:44');
INSERT INTO `admin_operation_log` VALUES (2278, 1, 'admin/customer-demands/4', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"2\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 17:58:51', '2020-08-22 17:58:51');
INSERT INTO `admin_operation_log` VALUES (2279, 1, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-22 17:58:52', '2020-08-22 17:58:52');
INSERT INTO `admin_operation_log` VALUES (2280, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:58:55', '2020-08-22 17:58:55');
INSERT INTO `admin_operation_log` VALUES (2281, 1, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 17:58:59', '2020-08-22 17:58:59');
INSERT INTO `admin_operation_log` VALUES (2282, 1, 'admin/customer-demands/4', 'PUT', '127.0.0.1', '{\"customer_id\":\"2\",\"customer_contact\":{\"customer_contact_id\":\"3\"},\"demand\":\"\\u57ce\\u5e02\",\"owner_user_id\":\"2\",\"last_user_id\":\"4\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 17:59:04', '2020-08-22 17:59:04');
INSERT INTO `admin_operation_log` VALUES (2283, 1, 'admin/customers/2', 'GET', '127.0.0.1', '[]', '2020-08-22 17:59:05', '2020-08-22 17:59:05');
INSERT INTO `admin_operation_log` VALUES (2284, 1, 'admin/customer-contacts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:00:15', '2020-08-22 18:00:15');
INSERT INTO `admin_operation_log` VALUES (2285, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:00:16', '2020-08-22 18:00:16');
INSERT INTO `admin_operation_log` VALUES (2286, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:00:28', '2020-08-22 18:00:28');
INSERT INTO `admin_operation_log` VALUES (2287, 1, 'admin/customer-demands/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"6\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 18:00:33', '2020-08-22 18:00:33');
INSERT INTO `admin_operation_log` VALUES (2288, 1, 'admin/customer-demands/5', 'GET', '127.0.0.1', '[]', '2020-08-22 18:05:38', '2020-08-22 18:05:38');
INSERT INTO `admin_operation_log` VALUES (2289, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '[]', '2020-08-22 18:05:43', '2020-08-22 18:05:43');
INSERT INTO `admin_operation_log` VALUES (2290, 1, 'admin/customer-demands/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:05:48', '2020-08-22 18:05:48');
INSERT INTO `admin_operation_log` VALUES (2291, 1, 'admin/customer-demands/6', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"4\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"1\",\"last_user_id\":\"6\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 18:05:54', '2020-08-22 18:05:54');
INSERT INTO `admin_operation_log` VALUES (2292, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 18:05:54', '2020-08-22 18:05:54');
INSERT INTO `admin_operation_log` VALUES (2293, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:05:59', '2020-08-22 18:05:59');
INSERT INTO `admin_operation_log` VALUES (2294, 1, 'admin/customer-demands/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:06:03', '2020-08-22 18:06:03');
INSERT INTO `admin_operation_log` VALUES (2295, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:06:07', '2020-08-22 18:06:07');
INSERT INTO `admin_operation_log` VALUES (2296, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:06:10', '2020-08-22 18:06:10');
INSERT INTO `admin_operation_log` VALUES (2297, 1, 'admin/customer-demands/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"2\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 18:06:14', '2020-08-22 18:06:14');
INSERT INTO `admin_operation_log` VALUES (2298, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '[]', '2020-08-22 18:06:15', '2020-08-22 18:06:15');
INSERT INTO `admin_operation_log` VALUES (2299, 1, 'admin/customer-demands/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"6\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\"}', '2020-08-22 18:08:22', '2020-08-22 18:08:22');
INSERT INTO `admin_operation_log` VALUES (2300, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 18:08:23', '2020-08-22 18:08:23');
INSERT INTO `admin_operation_log` VALUES (2301, 1, 'admin/customer-demands', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:08:27', '2020-08-22 18:08:27');
INSERT INTO `admin_operation_log` VALUES (2302, 1, 'admin/customer-demands/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-08-22 18:08:31', '2020-08-22 18:08:31');
INSERT INTO `admin_operation_log` VALUES (2303, 1, 'admin/customer-demands/5', 'PUT', '127.0.0.1', '{\"customer_id\":\"1\",\"customer_contact\":{\"customer_contact_id\":\"1\"},\"demand\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"owner_user_id\":\"4\",\"last_user_id\":\"2\",\"_token\":\"wf7wzRigejXNfESCJbgwjWOrIsxpspCo0sTeRIxC\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/newoa.test\\/admin\\/customer-demands\"}', '2020-08-22 18:08:37', '2020-08-22 18:08:37');
INSERT INTO `admin_operation_log` VALUES (2304, 1, 'admin/customers/1', 'GET', '127.0.0.1', '[]', '2020-08-22 18:08:38', '2020-08-22 18:08:38');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, '财务', 'finance', '', '/orders-renew-log*\r\n/order-payment-log*\r\n/pay-type*', '2020-08-13 20:55:05', '2020-08-14 13:25:17');
INSERT INTO `admin_permissions` VALUES (7, '订单', 'orders', '', '/orders*', '2020-08-14 15:36:01', '2020-08-14 15:36:16');
INSERT INTO `admin_permissions` VALUES (8, '客户管理', 'customer_manage', '', '/customers*\r\n/customer-demands*\r\n/customer-contacts*\r\n/api/getCustomerContact*\r\n/api/getCustomerDemand*', '2020-08-18 13:04:10', '2020-08-19 15:35:23');
INSERT INTO `admin_permissions` VALUES (9, '综合管理', 'system', '', '/products*\r\n/departments*\r\n/channels*\r\n/cart-templates*\r\n/params*\r\n/product-params*', '2020-08-18 14:51:13', '2020-08-18 14:51:13');
INSERT INTO `admin_permissions` VALUES (10, '客户', 'customer', '', '/customers*\r\n/customer-demands*\r\n/customer-contacts*\r\n/api/getCustomerContact*\r\n/api/getCustomerDemand*', '2020-08-20 15:58:37', '2020-08-20 15:58:37');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 21, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 23, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 23, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 24, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 24, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 25, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 25, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 20, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 20, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 12, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (6, 12, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 22, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (6, 22, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 13, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (6, 13, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 14, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (6, 14, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 15, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (6, 15, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 16, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (6, 16, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (3, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (3, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 11, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 11, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (3, 11, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (4, 11, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 18, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (6, 18, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (3, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (5, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 20, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (3, 20, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (5, 20, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 5, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 5, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (4, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (4, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (4, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (4, 5, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (5, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (5, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (5, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (5, 5, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (4, 6, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (6, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (6, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (6, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (6, 5, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (6, 9, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (5, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (7, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (7, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (7, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (7, 5, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (7, 8, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (4, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 5, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 6, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (1, 9, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (3, 10, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 10, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (6, 3, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (3, 4, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (3, 5, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 6, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (4, 7, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (7, 7, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-06-29 06:05:50', '2020-06-29 06:05:50');
INSERT INTO `admin_roles` VALUES (2, '商务部', 'commerce', '2020-07-20 14:40:53', '2020-07-20 14:40:53');
INSERT INTO `admin_roles` VALUES (3, '销售', 'sales', '2020-07-20 18:01:45', '2020-07-20 18:01:45');
INSERT INTO `admin_roles` VALUES (4, '财务', 'finance', '2020-07-21 14:26:22', '2020-07-21 14:26:22');
INSERT INTO `admin_roles` VALUES (5, '质检', 'check', '2020-07-21 14:26:59', '2020-07-21 14:26:59');
INSERT INTO `admin_roles` VALUES (6, '综合管理', 'system', '2020-08-18 14:51:39', '2020-08-18 14:51:39');
INSERT INTO `admin_roles` VALUES (7, '客户管理', 'customer_manage', '2020-08-19 15:13:57', '2020-08-19 15:13:57');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `sex` tinyint(4) NOT NULL DEFAULT 0 COMMENT '性别: 0:男 1：女',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `signed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '签名',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生日',
  `is_job` tinyint(4) NOT NULL DEFAULT 0 COMMENT '在职状态: 0:在职 1：离职',
  `dept_id` int(10) NULL DEFAULT NULL COMMENT '所属部门',
  `entry_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入职时间',
  `quit_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '离职时间',
  `open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'Administrator', 'admin', '$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q/NCEEIQIU6', 0, '15700064975', NULL, 'images/v2-877b9c8a401afed00d37a2ba5e3009d5_r.jpg', '1995年11月05日', 0, 0, '2020年07月16日', NULL, NULL, 'IzmUBbIwKe1g5DluRLd3eLiFLHHyWfzbDprMmhZqfmHkGCejCGL536o5rCPC', '2020-06-29 06:05:50', '2020-07-25 14:00:31', NULL);
INSERT INTO `admin_users` VALUES (2, '杨佳敏', '杨佳敏', '$2y$10$sPY72QdtKUhFjAihLzaXIeqpkmiPXkoLJhJlYLb.fltPsX/WmJt6y', 1, '17602941415', NULL, 'images/杨佳敏.jpg', '1993年10月13日', 0, 2, '2020年07月20日', NULL, NULL, 'NAXjccs445Q0YELIgUySRp2P5IvXvIGdE5QXU7CBs3U2ZUSk164hpj1qE17Q', '2020-07-20 14:36:49', '2020-08-21 11:10:22', NULL);
INSERT INTO `admin_users` VALUES (3, '车宝利', '车宝利', '$2y$10$OcuXjVrSMWd4VhNgQ3e0E.kw3dBZIYplfx.6kWgC2BOgzNrrnSngW', 1, '13700243280', NULL, NULL, NULL, 0, 8, '2020年08月20日', NULL, NULL, '2naSuFRCqMJganYkYi78NvvzdMArv9dzBLXngF394WUEpwNPxkXGc4xV8OQI', '2020-08-20 15:35:20', '2020-08-21 11:09:39', NULL);
INSERT INTO `admin_users` VALUES (4, '樊五一', '樊五一', '$2y$10$Wr6hq6U2qKvWKMBWH7.Up.kQAdfXrMOunAbqkuaJAbpk1M2YE/ugq', 0, '18209296175', NULL, NULL, NULL, 0, 5, '2020年08月21日', NULL, NULL, '3hW7wSz9SPlwdSykwfPEDDh41L312Wi50Pqb40hJrAUL3SMnfb01IYdEUebO', '2020-08-21 11:11:59', '2020-08-21 11:12:55', NULL);
INSERT INTO `admin_users` VALUES (5, '郭迪', '郭迪', '$2y$10$5we4RP5fyKAf0.U/TBA6v.ypuv1IVOrVj4M440ceCbhq/Un60hCQK', 0, '18792926755', NULL, NULL, NULL, 0, 4, '2020年08月21日', NULL, NULL, NULL, '2020-08-21 11:12:43', '2020-08-21 11:12:43', NULL);
INSERT INTO `admin_users` VALUES (6, '肖维娟', '肖维娟', '$2y$10$RcyGBrL8EnNzA.tBuCDfZOvLXTZavsgx6eCiaadNpkA25VBRPmDAy', 0, '18229035376', NULL, NULL, NULL, 0, 2, '2020年08月21日', NULL, NULL, NULL, '2020-08-21 11:13:36', '2020-08-21 11:13:36', NULL);
INSERT INTO `admin_users` VALUES (7, '谢菲', '谢菲', '$2y$10$tPAd9PBRSADj1Hdn6ure5.qbcAwWJ/tXN033q1/fL/4Xft0xMV6yC', 0, '13572421136', NULL, NULL, NULL, 0, 7, '2020年08月21日', NULL, NULL, 'DbpGfQXZdBC1XFEPP2tkz5cdcMUM6tijV0UjKx0EPJiBsTtFqZwnGoBYu71X', '2020-08-21 11:15:21', '2020-08-21 11:15:21', NULL);

-- ----------------------------
-- Table structure for card_template
-- ----------------------------
DROP TABLE IF EXISTS `card_template`;
CREATE TABLE `card_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板标题',
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板图片地址',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '名片模板表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '渠道标题',
  `PID` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '渠道管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channel
-- ----------------------------
INSERT INTO `channel` VALUES (1, '独立开发', 0, 1, '2020-07-20 14:27:48', '2020-07-20 14:27:48', NULL);
INSERT INTO `channel` VALUES (2, '广告推广', 0, 1, '2020-07-20 14:27:59', '2020-07-20 14:27:59', NULL);
INSERT INTO `channel` VALUES (3, '客户介绍', 0, 1, '2020-07-20 14:28:08', '2020-07-20 14:28:08', NULL);
INSERT INTO `channel` VALUES (4, '促销活动', 0, 1, '2020-07-20 14:28:16', '2020-07-20 14:28:16', NULL);
INSERT INTO `channel` VALUES (5, '公开招标', 0, 1, '2020-07-20 14:28:24', '2020-07-20 14:28:24', NULL);
INSERT INTO `channel` VALUES (6, '电话来访', 0, 1, '2020-07-20 14:28:31', '2020-07-20 14:28:31', NULL);
INSERT INTO `channel` VALUES (7, '互联网', 0, 1, '2020-07-20 14:28:39', '2020-07-20 14:28:39', NULL);
INSERT INTO `channel` VALUES (8, '老客户', 0, 1, '2020-07-20 14:28:46', '2020-07-20 14:28:46', NULL);
INSERT INTO `channel` VALUES (9, '合作伙伴', 0, 1, '2020-07-20 14:28:53', '2020-07-20 14:28:53', NULL);
INSERT INTO `channel` VALUES (10, '公司客户', 0, 1, '2020-07-20 14:29:00', '2020-07-20 14:29:00', NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名称',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '客户类型 0：个人 1：企业',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公司地址',
  `is_agent` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否代理 0：否 1：是',
  `channel_id` int(11) NULL DEFAULT NULL COMMENT '客户来源',
  `industry_id` int(11) NULL DEFAULT NULL COMMENT '所属行业ID',
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '网址',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  `owner_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '所属销售',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, '中光自用', 1, NULL, 0, 1, 1283, NULL, NULL, 1, '2020-08-12 19:53:18', '2020-08-12 19:53:18', NULL);
INSERT INTO `customer` VALUES (2, '城市', 1, '中心场馆', 0, 1, 56, NULL, NULL, 2, '2020-08-19 15:19:16', '2020-08-19 15:19:16', NULL);
INSERT INTO `customer` VALUES (3, '城市', 1, NULL, 0, 0, 0, NULL, NULL, 2, '2020-08-19 16:42:39', '2020-08-19 16:42:39', NULL);

-- ----------------------------
-- Table structure for customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `customer_contact`;
CREATE TABLE `customer_contact`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人名称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `is_first` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是第一联系人 0：否 1：是',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信openId',
  `headImgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `owner_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '所属销售',
  `last_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '最近跟进销售',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户联系人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_contact
-- ----------------------------
INSERT INTO `customer_contact` VALUES (1, 1, '测试', '15333333333', 1, NULL, NULL, 1, 1, 2, '2020-08-12 20:46:18', '2020-08-22 18:08:37', NULL);
INSERT INTO `customer_contact` VALUES (2, 2, '拆', '13333333333', 1, NULL, NULL, 1, 2, 2, '2020-08-19 15:33:41', '2020-08-19 15:33:41', NULL);
INSERT INTO `customer_contact` VALUES (3, 2, '高璧玉', '13333333333', 1, NULL, NULL, 0, 2, 4, '2020-08-19 16:43:52', '2020-08-22 17:59:04', NULL);
INSERT INTO `customer_contact` VALUES (4, 1, '测试1', '16333333333', 1, NULL, NULL, 0, 4, 6, '2020-08-22 16:31:27', '2020-08-22 18:05:54', NULL);

-- ----------------------------
-- Table structure for customer_contact_card
-- ----------------------------
DROP TABLE IF EXISTS `customer_contact_card`;
CREATE TABLE `customer_contact_card`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_contact_id` int(11) NOT NULL COMMENT '联系人ID',
  `card_template_id` int(11) NOT NULL COMMENT '名片模板ID',
  `img_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '背景图地址',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '联系人名片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer_contact_demand
-- ----------------------------
DROP TABLE IF EXISTS `customer_contact_demand`;
CREATE TABLE `customer_contact_demand`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_demand_id` int(11) NOT NULL COMMENT '需求ID',
  `customer_contact_id` int(11) NOT NULL COMMENT '联系人ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户联系人需求关联中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_contact_demand
-- ----------------------------
INSERT INTO `customer_contact_demand` VALUES (1, 1, 1, 1, '2020-08-12 21:18:37', '2020-08-12 21:18:37');
INSERT INTO `customer_contact_demand` VALUES (2, 2, 2, 2, '2020-08-19 15:38:28', '2020-08-19 15:38:28');
INSERT INTO `customer_contact_demand` VALUES (3, 2, 3, 3, '2020-08-19 16:49:55', '2020-08-19 17:24:55');
INSERT INTO `customer_contact_demand` VALUES (4, 2, 4, 3, '2020-08-19 16:59:21', '2020-08-19 16:59:21');
INSERT INTO `customer_contact_demand` VALUES (5, 1, 5, 1, '2020-08-22 16:31:43', '2020-08-22 17:43:58');
INSERT INTO `customer_contact_demand` VALUES (6, 1, 6, 4, '2020-08-22 17:51:48', '2020-08-22 17:51:48');

-- ----------------------------
-- Table structure for customer_demand
-- ----------------------------
DROP TABLE IF EXISTS `customer_demand`;
CREATE TABLE `customer_demand`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `demand` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户需求',
  `owner_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '所属销售',
  `last_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '最近跟进销售',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户需求表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_demand
-- ----------------------------
INSERT INTO `customer_demand` VALUES (1, 1, 'cs', 1, 1, '2020-08-12 21:18:37', '2020-08-12 21:18:37', NULL);
INSERT INTO `customer_demand` VALUES (2, 2, '城市', 1, 1, '2020-08-19 15:38:28', '2020-08-19 15:38:28', NULL);
INSERT INTO `customer_demand` VALUES (3, 2, '城市111133as安达市多按时大大水电费水电费', 1, 1, '2020-08-19 16:49:55', '2020-08-19 17:23:41', NULL);
INSERT INTO `customer_demand` VALUES (4, 2, '城市', 2, 4, '2020-08-19 16:59:21', '2020-08-22 17:59:04', NULL);
INSERT INTO `customer_demand` VALUES (5, 1, '测试测试', 4, 2, '2020-08-22 16:31:43', '2020-08-22 18:08:37', NULL);
INSERT INTO `customer_demand` VALUES (6, 1, '测试测试', 1, 6, '2020-08-22 17:51:48', '2020-08-22 18:05:54', NULL);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `PID` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '运维部', 0, 1, '2020-07-20 14:24:43', '2020-07-20 14:24:43', NULL);
INSERT INTO `department` VALUES (2, '商务部', 0, 1, '2020-07-20 14:24:55', '2020-07-20 14:24:55', NULL);
INSERT INTO `department` VALUES (3, '销售部', 0, 1, '2020-07-20 14:25:07', '2020-07-20 14:25:07', NULL);
INSERT INTO `department` VALUES (4, '销售一部', 3, 1, '2020-07-20 14:25:24', '2020-07-20 14:25:24', NULL);
INSERT INTO `department` VALUES (5, '销售二部', 3, 1, '2020-07-20 14:25:37', '2020-07-20 14:25:37', NULL);
INSERT INTO `department` VALUES (6, '销售三部', 3, 1, '2020-07-20 14:25:48', '2020-07-20 14:25:48', NULL);
INSERT INTO `department` VALUES (7, '财务部', 0, 1, '2020-08-18 13:12:39', '2020-08-18 13:12:39', NULL);
INSERT INTO `department` VALUES (8, '综合部', 0, 1, '2020-08-18 13:13:17', '2020-08-18 13:13:17', NULL);

-- ----------------------------
-- Table structure for industry
-- ----------------------------
DROP TABLE IF EXISTS `industry`;
CREATE TABLE `industry`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IndustryCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IndustryName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IndustryState` tinyint(4) NULL DEFAULT NULL,
  `ParentID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of industry
-- ----------------------------
INSERT INTO `industry` VALUES (1, 'A', '农、林、牧、渔业', 1, NULL);
INSERT INTO `industry` VALUES (2, '01', '农业', 1, 'A');
INSERT INTO `industry` VALUES (3, '011', '谷物种植', 1, '01');
INSERT INTO `industry` VALUES (4, '0111', '稻谷种植', 1, '011');
INSERT INTO `industry` VALUES (5, '0112', '小麦种植', 1, '011');
INSERT INTO `industry` VALUES (6, '0113', '玉米种植', 1, '011');
INSERT INTO `industry` VALUES (7, '0119', '其他谷物种植', 1, '011');
INSERT INTO `industry` VALUES (8, '012', '豆类、油料和薯类种植', 1, '01');
INSERT INTO `industry` VALUES (9, '0121', '豆类种植', 1, '012');
INSERT INTO `industry` VALUES (10, '0122', '油料种植', 1, '012');
INSERT INTO `industry` VALUES (11, '0123', '薯类种植', 1, '012');
INSERT INTO `industry` VALUES (12, '013', '棉、麻、糖、烟草种植', 1, '01');
INSERT INTO `industry` VALUES (13, '0131', '棉花种植', 1, '013');
INSERT INTO `industry` VALUES (14, '0132', '麻类种植', 1, '013');
INSERT INTO `industry` VALUES (15, '0133', '糖料种植', 1, '013');
INSERT INTO `industry` VALUES (16, '0134', '烟草种植', 1, '013');
INSERT INTO `industry` VALUES (17, '014', '蔬菜、食用菌及园艺作物种植', 1, '01');
INSERT INTO `industry` VALUES (18, '0141', '蔬菜种植', 1, '014');
INSERT INTO `industry` VALUES (19, '0142', '食用菌种植', 1, '014');
INSERT INTO `industry` VALUES (20, '0143', '花卉种植', 1, '014');
INSERT INTO `industry` VALUES (21, '0149', '其他园艺作物种植', 1, '014');
INSERT INTO `industry` VALUES (22, '015', '水果种植', 1, '01');
INSERT INTO `industry` VALUES (23, '0151', '仁果类和核果类水果种植', 1, '015');
INSERT INTO `industry` VALUES (24, '0152', '葡萄种植', 1, '015');
INSERT INTO `industry` VALUES (25, '0153', '柑橘类种植', 1, '015');
INSERT INTO `industry` VALUES (26, '0154', '香蕉等亚热带水果种植', 1, '015');
INSERT INTO `industry` VALUES (27, '0159', '其他水果种植', 1, '015');
INSERT INTO `industry` VALUES (28, '016', '坚果、含油果、香料和饮料作物种植', 1, '01');
INSERT INTO `industry` VALUES (29, '0161', '坚果种植', 1, '016');
INSERT INTO `industry` VALUES (30, '0162', '含油果种植', 1, '016');
INSERT INTO `industry` VALUES (31, '0163', '香料作物种植', 1, '016');
INSERT INTO `industry` VALUES (32, '0164', '茶叶种植', 1, '016');
INSERT INTO `industry` VALUES (33, '0169', '其他饮料作物种植', 1, '016');
INSERT INTO `industry` VALUES (34, '017', '中药材种植', 1, '01');
INSERT INTO `industry` VALUES (35, '0171', '中草药种植', 1, '017');
INSERT INTO `industry` VALUES (36, '0179', '其他中药材种植', 1, '017');
INSERT INTO `industry` VALUES (37, '018', '草种植及割草', 1, '01');
INSERT INTO `industry` VALUES (38, '0181', '草种植', 1, '018');
INSERT INTO `industry` VALUES (39, '0182', '天然草原割草', 1, '018');
INSERT INTO `industry` VALUES (40, '0190', '其他农业', 1, '01');
INSERT INTO `industry` VALUES (41, '02', '林业', 1, 'A');
INSERT INTO `industry` VALUES (42, '021', '林木育种和育苗', 1, '02');
INSERT INTO `industry` VALUES (43, '0211', '林木育种', 1, '021');
INSERT INTO `industry` VALUES (44, '0212', '林木育苗', 1, '021');
INSERT INTO `industry` VALUES (45, '0220', '造林和更新', 1, '02');
INSERT INTO `industry` VALUES (46, '023', '森林经营、管护和改培', 1, '02');
INSERT INTO `industry` VALUES (47, '0231', '森林经营和管护', 1, '023');
INSERT INTO `industry` VALUES (48, '0232', '森林改培', 1, '023');
INSERT INTO `industry` VALUES (49, '024', '木材和竹材采运', 1, '02');
INSERT INTO `industry` VALUES (50, '0241', '木材采运', 1, '024');
INSERT INTO `industry` VALUES (51, '0242', '竹材采运', 1, '024');
INSERT INTO `industry` VALUES (52, '025', '林产品采集', 1, '02');
INSERT INTO `industry` VALUES (53, '0251', '木竹材林产品采集', 1, '025');
INSERT INTO `industry` VALUES (54, '0252', '非木竹材林产品采集', 1, '025');
INSERT INTO `industry` VALUES (55, '03', '畜牧业', 1, 'A');
INSERT INTO `industry` VALUES (56, '031', '牲畜饲养', 1, '03');
INSERT INTO `industry` VALUES (57, '0311', '牛的饲养', 1, '031');
INSERT INTO `industry` VALUES (58, '0312', '马的饲养', 1, '031');
INSERT INTO `industry` VALUES (59, '0313', '猪的饲养', 1, '031');
INSERT INTO `industry` VALUES (60, '0314', '羊的饲养', 1, '031');
INSERT INTO `industry` VALUES (61, '0315', '骆驼饲养', 1, '031');
INSERT INTO `industry` VALUES (62, '0319', '其他牲畜饲养', 1, '031');
INSERT INTO `industry` VALUES (63, '032', '家禽饲养', 1, '03');
INSERT INTO `industry` VALUES (64, '0321', '鸡的饲养', 1, '032');
INSERT INTO `industry` VALUES (65, '0322', '鸭的饲养', 1, '032');
INSERT INTO `industry` VALUES (66, '0323', '鹅的饲养', 1, '032');
INSERT INTO `industry` VALUES (67, '0329', '其他家禽饲养', 1, '032');
INSERT INTO `industry` VALUES (68, '0330', '狩猎和捕捉动物', 1, '03');
INSERT INTO `industry` VALUES (69, '039', '其他畜牧业', 1, '03');
INSERT INTO `industry` VALUES (70, '0391', '兔的饲养', 1, '039');
INSERT INTO `industry` VALUES (71, '0392', '蜜蜂饲养', 1, '039');
INSERT INTO `industry` VALUES (72, '0399', '其他未列明畜牧业', 1, '039');
INSERT INTO `industry` VALUES (73, '04', '渔业', 1, 'A');
INSERT INTO `industry` VALUES (74, '041', '水产养殖', 1, '04');
INSERT INTO `industry` VALUES (75, '0411', '海水养殖', 1, '041');
INSERT INTO `industry` VALUES (76, '0412', '内陆养殖', 1, '041');
INSERT INTO `industry` VALUES (77, '042', '水产捕捞', 1, '04');
INSERT INTO `industry` VALUES (78, '0421', '海水捕捞', 1, '042');
INSERT INTO `industry` VALUES (79, '0422', '内陆捕捞', 1, '042');
INSERT INTO `industry` VALUES (80, '05', '农、林、牧、渔专业及辅助性活动', 1, 'A');
INSERT INTO `industry` VALUES (81, '051', '农业专业及辅助性活动', 1, '05');
INSERT INTO `industry` VALUES (82, '0511', '种子种苗培育活动', 1, '051');
INSERT INTO `industry` VALUES (83, '0512', '农业机械活动', 1, '051');
INSERT INTO `industry` VALUES (84, '0513', '灌溉活动', 1, '051');
INSERT INTO `industry` VALUES (85, '0514', '农产品初加工活动', 1, '051');
INSERT INTO `industry` VALUES (86, '0515', '农作物病虫害防治活动', 1, '051');
INSERT INTO `industry` VALUES (87, '0519', '其他农业专业及辅助性活动', 1, '051');
INSERT INTO `industry` VALUES (88, '052', '林业专业及辅助性活动', 1, '05');
INSERT INTO `industry` VALUES (89, '0521', '林业有害生物防治活动', 1, '052');
INSERT INTO `industry` VALUES (90, '0522', '森林防火活动', 1, '052');
INSERT INTO `industry` VALUES (91, '0523', '林产品初级加工活动', 1, '052');
INSERT INTO `industry` VALUES (92, '0529', '其他林业专业及辅助性活动', 1, '052');
INSERT INTO `industry` VALUES (93, '053', '畜牧专业及辅助性活动', 1, '05');
INSERT INTO `industry` VALUES (94, '0531', '畜牧良种繁殖活动', 1, '053');
INSERT INTO `industry` VALUES (95, '0532', '畜禽粪污处理活动', 1, '053');
INSERT INTO `industry` VALUES (96, '0539', '其他畜牧专业及辅助性活动', 1, '053');
INSERT INTO `industry` VALUES (97, '054', '渔业专业及辅助性活动', 1, '05');
INSERT INTO `industry` VALUES (98, '0541', '鱼苗及鱼种场活动', 1, '054');
INSERT INTO `industry` VALUES (99, '0549', '其他渔业专业及辅助性活动', 1, '054');
INSERT INTO `industry` VALUES (100, 'B', '采矿业', 1, NULL);
INSERT INTO `industry` VALUES (101, '06', '煤炭开采和洗选业', 1, 'B');
INSERT INTO `industry` VALUES (102, '0610', '烟煤和无烟煤开采洗选', 1, '06');
INSERT INTO `industry` VALUES (103, '0620', '褐煤开采洗选', 1, '06');
INSERT INTO `industry` VALUES (104, '0690', '其他煤炭采选', 1, '06');
INSERT INTO `industry` VALUES (105, '07', '石油和天然气开采业', 1, 'B');
INSERT INTO `industry` VALUES (106, '071', '石油开采', 1, '07');
INSERT INTO `industry` VALUES (107, '0711', '陆地石油开采', 1, '071');
INSERT INTO `industry` VALUES (108, '0712', '海洋石油开采', 1, '071');
INSERT INTO `industry` VALUES (109, '072', '天然气开采', 1, '07');
INSERT INTO `industry` VALUES (110, '0721', '陆地天然气开采', 1, '072');
INSERT INTO `industry` VALUES (111, '0722', '海洋天然气及可燃冰开采', 1, '072');
INSERT INTO `industry` VALUES (112, '08', '黑色金属矿采选业', 1, 'B');
INSERT INTO `industry` VALUES (113, '0810', '铁矿采选', 1, '08');
INSERT INTO `industry` VALUES (114, '0820', '锰矿、铬矿采选', 1, '08');
INSERT INTO `industry` VALUES (115, '0890', '其他黑色金属矿采选', 1, '08');
INSERT INTO `industry` VALUES (116, '09', '有色金属矿采选业', 1, 'B');
INSERT INTO `industry` VALUES (117, '091', '常用有色金属矿采选', 1, '09');
INSERT INTO `industry` VALUES (118, '0911', '铜矿采选', 1, '091');
INSERT INTO `industry` VALUES (119, '0912', '铅锌矿采选', 1, '091');
INSERT INTO `industry` VALUES (120, '0913', '镍钴矿采选', 1, '091');
INSERT INTO `industry` VALUES (121, '0914', '锡矿采选', 1, '091');
INSERT INTO `industry` VALUES (122, '0915', '锑矿采选', 1, '091');
INSERT INTO `industry` VALUES (123, '0916', '铝矿采选', 1, '091');
INSERT INTO `industry` VALUES (124, '0917', '镁矿采选', 1, '091');
INSERT INTO `industry` VALUES (125, '0919', '其他常用有色金属矿采选', 1, '091');
INSERT INTO `industry` VALUES (126, '092', '贵金属矿采选', 1, '09');
INSERT INTO `industry` VALUES (127, '0921', '金矿采选', 1, '092');
INSERT INTO `industry` VALUES (128, '0922', '银矿采选', 1, '092');
INSERT INTO `industry` VALUES (129, '0929', '其他贵金属矿采选', 1, '092');
INSERT INTO `industry` VALUES (130, '093', '稀有稀土金属矿采选', 1, '09');
INSERT INTO `industry` VALUES (131, '0931', '钨钼矿采选', 1, '093');
INSERT INTO `industry` VALUES (132, '0932', '稀土金属矿采选', 1, '093');
INSERT INTO `industry` VALUES (133, '0933', '放射性金属矿采选', 1, '093');
INSERT INTO `industry` VALUES (134, '0939', '其他稀有金属矿采选', 1, '093');
INSERT INTO `industry` VALUES (135, '10', '非金属矿采选业', 1, 'B');
INSERT INTO `industry` VALUES (136, '101', '土砂石开采', 1, '10');
INSERT INTO `industry` VALUES (137, '1011', '石灰石、石膏开采', 1, '101');
INSERT INTO `industry` VALUES (138, '1012', '建筑装饰用石开采', 1, '101');
INSERT INTO `industry` VALUES (139, '1013', '耐火土石开采', 1, '101');
INSERT INTO `industry` VALUES (140, '1019', '粘土及其他土砂石开采', 1, '101');
INSERT INTO `industry` VALUES (141, '1020', '化学矿开采', 1, '10');
INSERT INTO `industry` VALUES (142, '1030', '采盐', 1, '10');
INSERT INTO `industry` VALUES (143, '109', '石棉及其他非金属矿采选', 1, '10');
INSERT INTO `industry` VALUES (144, '1091', '石棉、云母矿采选', 1, '109');
INSERT INTO `industry` VALUES (145, '1092', '石墨、滑石采选', 1, '109');
INSERT INTO `industry` VALUES (146, '1093', '宝石、玉石采选', 1, '109');
INSERT INTO `industry` VALUES (147, '1099', '其他未列明非金属矿采选', 1, '109');
INSERT INTO `industry` VALUES (148, '11', '开采专业及辅助性活动', 1, 'B');
INSERT INTO `industry` VALUES (149, '1110', '煤炭开采和洗选专业及辅助性活动', 1, '11');
INSERT INTO `industry` VALUES (150, '1120', '石油和天然气开采专业及辅助性活动', 1, '11');
INSERT INTO `industry` VALUES (151, '1190', '其他开采专业及辅助性活动', 1, '11');
INSERT INTO `industry` VALUES (152, '12', '其他采矿业', 1, 'B');
INSERT INTO `industry` VALUES (153, '1200', '其他采矿业', 1, '12');
INSERT INTO `industry` VALUES (154, 'C', '制造业', 1, NULL);
INSERT INTO `industry` VALUES (155, '13', '农副食品加工业', 1, 'C');
INSERT INTO `industry` VALUES (156, '131', '谷物磨制', 1, '13');
INSERT INTO `industry` VALUES (157, '1311', '稻谷加工', 1, '131');
INSERT INTO `industry` VALUES (158, '1312', '小麦加工', 1, '131');
INSERT INTO `industry` VALUES (159, '1313', '玉米加工', 1, '131');
INSERT INTO `industry` VALUES (160, '1314', '杂粮加工', 1, '131');
INSERT INTO `industry` VALUES (161, '1319', '其他谷物磨制', 1, '131');
INSERT INTO `industry` VALUES (162, '132', '饲料加工 ', 1, '13');
INSERT INTO `industry` VALUES (163, '1321', '宠物饲料加工', 1, '132');
INSERT INTO `industry` VALUES (164, '1329', '其他饲料加工', 1, '132');
INSERT INTO `industry` VALUES (165, '133', '植物油加工', 1, '13');
INSERT INTO `industry` VALUES (166, '1331', '食用植物油加工', 1, '133');
INSERT INTO `industry` VALUES (167, '1332', '非食用植物油加工', 1, '133');
INSERT INTO `industry` VALUES (168, '1340', '制糖业', 1, '13');
INSERT INTO `industry` VALUES (169, '135', '屠宰及肉类加工', 1, '13');
INSERT INTO `industry` VALUES (170, '1351', '牲畜屠宰', 1, '135');
INSERT INTO `industry` VALUES (171, '1352', '禽类屠宰', 1, '135');
INSERT INTO `industry` VALUES (172, '1353', '肉制品及副产品加工', 1, '135');
INSERT INTO `industry` VALUES (173, '136', '水产品加工', 1, '13');
INSERT INTO `industry` VALUES (174, '1361', '水产品冷冻加工', 1, '136');
INSERT INTO `industry` VALUES (175, '1362', '鱼糜制品及水产品干腌制加工', 1, '136');
INSERT INTO `industry` VALUES (176, '1363', '鱼油提取及制品制造', 1, '136');
INSERT INTO `industry` VALUES (177, '1369', '其他水产品加工', 1, '136');
INSERT INTO `industry` VALUES (178, '137', '蔬菜、菌类、水果和坚果加工', 1, '13');
INSERT INTO `industry` VALUES (179, '1371', '蔬菜加工', 1, '137');
INSERT INTO `industry` VALUES (180, '1372', '食用菌加工', 1, '137');
INSERT INTO `industry` VALUES (181, '1373', '水果和坚果加工', 1, '137');
INSERT INTO `industry` VALUES (182, '139', '其他农副食品加工', 1, '13');
INSERT INTO `industry` VALUES (183, '1391', '淀粉及淀粉制品制造', 1, '139');
INSERT INTO `industry` VALUES (184, '1392', '豆制品制造', 1, '139');
INSERT INTO `industry` VALUES (185, '1393', '蛋品加工', 1, '139');
INSERT INTO `industry` VALUES (186, '1399', '其他未列明农副食品加工', 1, '139');
INSERT INTO `industry` VALUES (187, '14', '食品制造业', 1, 'C');
INSERT INTO `industry` VALUES (188, '141', '焙烤食品制造', 1, '14');
INSERT INTO `industry` VALUES (189, '1411', '糕点、面包制造', 1, '141');
INSERT INTO `industry` VALUES (190, '1419', '饼干及其他焙烤食品制造', 1, '141');
INSERT INTO `industry` VALUES (191, '142', '糖果、巧克力及蜜饯制造', 1, '14');
INSERT INTO `industry` VALUES (192, '1421', '糖果、巧克力制造', 1, '142');
INSERT INTO `industry` VALUES (193, '1422', '蜜饯制作', 1, '142');
INSERT INTO `industry` VALUES (194, '143', '方便食品制造', 1, '14');
INSERT INTO `industry` VALUES (195, '1431', '米、面制品制造', 1, '143');
INSERT INTO `industry` VALUES (196, '1432', '速冻食品制造', 1, '143');
INSERT INTO `industry` VALUES (197, '1433', '方便面制造', 1, '143');
INSERT INTO `industry` VALUES (198, '1439', '其他方便食品制造', 1, '143');
INSERT INTO `industry` VALUES (199, '144', '乳制品制造', 1, '14');
INSERT INTO `industry` VALUES (200, '1441', '液体乳制造', 1, '144');
INSERT INTO `industry` VALUES (201, '1442', '乳粉制造', 1, '144');
INSERT INTO `industry` VALUES (202, '1449', '其他乳制品制造', 1, '144');
INSERT INTO `industry` VALUES (203, '145', '罐头食品制造', 1, '14');
INSERT INTO `industry` VALUES (204, '1451', '肉、禽类罐头制造', 1, '145');
INSERT INTO `industry` VALUES (205, '1452', '水产品罐头制造', 1, '145');
INSERT INTO `industry` VALUES (206, '1453', '蔬菜、水果罐头制造', 1, '145');
INSERT INTO `industry` VALUES (207, '1459', '其他罐头食品制造', 1, '145');
INSERT INTO `industry` VALUES (208, '146', '调味品、发酵制品制造', 1, '14');
INSERT INTO `industry` VALUES (209, '1461', '味精制造', 1, '146');
INSERT INTO `industry` VALUES (210, '1462', '酱油、食醋及类似制品制造', 1, '146');
INSERT INTO `industry` VALUES (211, '1469', '其他调味品、发酵制品制造', 1, '146');
INSERT INTO `industry` VALUES (212, '149', '其他食品制造', 1, '14');
INSERT INTO `industry` VALUES (213, '1491', '营养食品制造', 1, '149');
INSERT INTO `industry` VALUES (214, '1492', '保健食品制造', 1, '149');
INSERT INTO `industry` VALUES (215, '1493', '冷冻饮品及食用冰制造', 1, '149');
INSERT INTO `industry` VALUES (216, '1494', '盐加工 ', 1, '149');
INSERT INTO `industry` VALUES (217, '1495', '食品及饲料添加剂制造', 1, '149');
INSERT INTO `industry` VALUES (218, '1499', '其他未列明食品制造', 1, '149');
INSERT INTO `industry` VALUES (219, '15', '酒、饮料及精制茶制造业', 1, 'C');
INSERT INTO `industry` VALUES (220, '151', '酒的制造', 1, '15');
INSERT INTO `industry` VALUES (221, '1511', '酒精制造', 1, '151');
INSERT INTO `industry` VALUES (222, '1512', '白酒制造', 1, '151');
INSERT INTO `industry` VALUES (223, '1513', '啤酒制造', 1, '151');
INSERT INTO `industry` VALUES (224, '1514', '黄酒制造', 1, '151');
INSERT INTO `industry` VALUES (225, '1515', '葡萄酒制造', 1, '151');
INSERT INTO `industry` VALUES (226, '1519', '其他酒制造', 1, '151');
INSERT INTO `industry` VALUES (227, '152', '饮料制造', 1, '15');
INSERT INTO `industry` VALUES (228, '1521', '碳酸饮料制造', 1, '152');
INSERT INTO `industry` VALUES (229, '1522', '瓶（罐）装饮用水制造', 1, '152');
INSERT INTO `industry` VALUES (230, '1523', '果菜汁及果菜汁饮料制造', 1, '152');
INSERT INTO `industry` VALUES (231, '1524', '含乳饮料和植物蛋白饮料制造', 1, '152');
INSERT INTO `industry` VALUES (232, '1525', '固体饮料制造', 1, '152');
INSERT INTO `industry` VALUES (233, '1529', '茶饮料及其他饮料制造', 1, '152');
INSERT INTO `industry` VALUES (234, '1530', '精制茶加工', 1, '15');
INSERT INTO `industry` VALUES (235, '16', '烟草制品业 ', 1, 'C');
INSERT INTO `industry` VALUES (236, '1610', '烟叶复烤', 1, '16');
INSERT INTO `industry` VALUES (237, '1620', '卷烟制造', 1, '16');
INSERT INTO `industry` VALUES (238, '1690', '其他烟草制品制造', 1, '16');
INSERT INTO `industry` VALUES (239, '17', '纺织业', 1, 'C');
INSERT INTO `industry` VALUES (240, '171', '棉纺织及印染精加工', 1, '17');
INSERT INTO `industry` VALUES (241, '1711', '棉纺纱加工', 1, '171');
INSERT INTO `industry` VALUES (242, '1712', '棉织造加工', 1, '171');
INSERT INTO `industry` VALUES (243, '1713', '棉印染精加工', 1, '171');
INSERT INTO `industry` VALUES (244, '172', '毛纺织及染整精加工', 1, '17');
INSERT INTO `industry` VALUES (245, '1721', '毛条和毛纱线加工', 1, '172');
INSERT INTO `industry` VALUES (246, '1722', '毛织造加工', 1, '172');
INSERT INTO `industry` VALUES (247, '1723', '毛染整精加工', 1, '172');
INSERT INTO `industry` VALUES (248, '173', '麻纺织及染整精加工', 1, '17');
INSERT INTO `industry` VALUES (249, '1731', '麻纤维纺前加工和纺纱', 1, '173');
INSERT INTO `industry` VALUES (250, '1732', '麻织造加工', 1, '173');
INSERT INTO `industry` VALUES (251, '1733', '麻染整精加工', 1, '173');
INSERT INTO `industry` VALUES (252, '174', '丝绢纺织及印染精加工', 1, '17');
INSERT INTO `industry` VALUES (253, '1741', '缫丝加工', 1, '174');
INSERT INTO `industry` VALUES (254, '1742', '绢纺和丝织加工', 1, '174');
INSERT INTO `industry` VALUES (255, '1743', '丝印染精加工', 1, '174');
INSERT INTO `industry` VALUES (256, '175', '化纤织造及印染精加工', 1, '17');
INSERT INTO `industry` VALUES (257, '1751', '化纤织造加工', 1, '175');
INSERT INTO `industry` VALUES (258, '1752', '化纤织物染整精加工', 1, '175');
INSERT INTO `industry` VALUES (259, '176', '针织或钩针编织物及其制品制造', 1, '17');
INSERT INTO `industry` VALUES (260, '1761', '针织或钩针编织物织造', 1, '176');
INSERT INTO `industry` VALUES (261, '1762', '针织或钩针编织物印染精加工', 1, '176');
INSERT INTO `industry` VALUES (262, '1763', '针织或钩针编织品制造', 1, '176');
INSERT INTO `industry` VALUES (263, '177', '家用纺织制成品制造', 1, '17');
INSERT INTO `industry` VALUES (264, '1771', '床上用品制造', 1, '177');
INSERT INTO `industry` VALUES (265, '1772', '毛巾类制品制造', 1, '177');
INSERT INTO `industry` VALUES (266, '1773', '窗帘、布艺类产品制造', 1, '177');
INSERT INTO `industry` VALUES (267, '1779', '其他家用纺织制成品制造', 1, '177');
INSERT INTO `industry` VALUES (268, '178', '产业用纺织制成品制造', 1, '17');
INSERT INTO `industry` VALUES (269, '1781', '非织造布制造', 1, '178');
INSERT INTO `industry` VALUES (270, '1782', '绳、索、缆制造', 1, '178');
INSERT INTO `industry` VALUES (271, '1783', '纺织带和帘子布制造', 1, '178');
INSERT INTO `industry` VALUES (272, '1784', '篷、帆布制造', 1, '178');
INSERT INTO `industry` VALUES (273, '1789', '其他产业用纺织制成品制造', 1, '178');
INSERT INTO `industry` VALUES (274, '18', '纺织服装、服饰业', 1, 'C');
INSERT INTO `industry` VALUES (275, '181', '机织服装制造', 1, '18');
INSERT INTO `industry` VALUES (276, '1811', '运动机织服装制造', 1, '181');
INSERT INTO `industry` VALUES (277, '1819', '其他机织服装制造', 1, '181');
INSERT INTO `industry` VALUES (278, '182', '针织或钩针编织服装制造', 1, '18');
INSERT INTO `industry` VALUES (279, '1821', '运动休闲针织服装制造', 1, '182');
INSERT INTO `industry` VALUES (280, '1829', '其他针织或钩针编织服装制造', 1, '182');
INSERT INTO `industry` VALUES (281, '1830', '服饰制造', 1, '18');
INSERT INTO `industry` VALUES (282, '19', '皮革、毛皮、羽毛及其制品和制鞋业', 1, 'C');
INSERT INTO `industry` VALUES (283, '1910', '皮革鞣制加工', 1, '19');
INSERT INTO `industry` VALUES (284, '192', '皮革制品制造', 1, '19');
INSERT INTO `industry` VALUES (285, '1921', '皮革服装制造', 1, '192');
INSERT INTO `industry` VALUES (286, '1922', '皮箱、包(袋)制造', 1, '192');
INSERT INTO `industry` VALUES (287, '1923', '皮手套及皮装饰制品制造 ', 1, '192');
INSERT INTO `industry` VALUES (288, '1929', '其他皮革制品制造', 1, '192');
INSERT INTO `industry` VALUES (289, '193', '毛皮鞣制及制品加工', 1, '19');
INSERT INTO `industry` VALUES (290, '1931', '毛皮鞣制加工', 1, '193');
INSERT INTO `industry` VALUES (291, '1932', '毛皮服装加工', 1, '193');
INSERT INTO `industry` VALUES (292, '1939', '其他毛皮制品加工', 1, '193');
INSERT INTO `industry` VALUES (293, '194', '羽毛(绒)加工及制品制造', 1, '19');
INSERT INTO `industry` VALUES (294, '1941', '羽毛(绒)加工', 1, '194');
INSERT INTO `industry` VALUES (295, '1942', '羽毛(绒)制品加工', 1, '194');
INSERT INTO `industry` VALUES (296, '195', '制鞋业', 1, '19');
INSERT INTO `industry` VALUES (297, '1951', '纺织面料鞋制造', 1, '195');
INSERT INTO `industry` VALUES (298, '1952', '皮鞋制造', 1, '195');
INSERT INTO `industry` VALUES (299, '1953', '塑料鞋制造', 1, '195');
INSERT INTO `industry` VALUES (300, '1954', '橡胶鞋制造', 1, '195');
INSERT INTO `industry` VALUES (301, '1959', '其他制鞋业', 1, '195');
INSERT INTO `industry` VALUES (302, '20', '木材加工和木、竹、藤、棕、草制品业', 1, 'C');
INSERT INTO `industry` VALUES (303, '201', '木材加工', 1, '20');
INSERT INTO `industry` VALUES (304, '2011', '锯材加工', 1, '201');
INSERT INTO `industry` VALUES (305, '2012', '木片加工', 1, '201');
INSERT INTO `industry` VALUES (306, '2013', '单板加工', 1, '201');
INSERT INTO `industry` VALUES (307, '2019', '其他木材加工', 1, '201');
INSERT INTO `industry` VALUES (308, '202', '人造板制造', 1, '20');
INSERT INTO `industry` VALUES (309, '2021', '胶合板制造', 1, '202');
INSERT INTO `industry` VALUES (310, '2022', '纤维板制造', 1, '202');
INSERT INTO `industry` VALUES (311, '2023', '刨花板制造', 1, '202');
INSERT INTO `industry` VALUES (312, '2029', '其他人造板制造', 1, '202');
INSERT INTO `industry` VALUES (313, '203', '木制品制造', 1, '20');
INSERT INTO `industry` VALUES (314, '2031', '建筑用木料及木材组件加工', 1, '203');
INSERT INTO `industry` VALUES (315, '2032', '木门窗制造', 1, '203');
INSERT INTO `industry` VALUES (316, '2033', '木楼梯制造', 1, '203');
INSERT INTO `industry` VALUES (317, '2034', '木地板制造', 1, '203');
INSERT INTO `industry` VALUES (318, '2035', '木制容器制造', 1, '203');
INSERT INTO `industry` VALUES (319, '2039', '软木制品及其他木制品制造', 1, '203');
INSERT INTO `industry` VALUES (320, '204', '竹、藤、棕、草制品制造', 1, '20');
INSERT INTO `industry` VALUES (321, '2041', '竹制品制造', 1, '204');
INSERT INTO `industry` VALUES (322, '2042', '藤制品制造', 1, '204');
INSERT INTO `industry` VALUES (323, '2043', '棕制品制造', 1, '204');
INSERT INTO `industry` VALUES (324, '2049', '草及其他制品制造', 1, '204');
INSERT INTO `industry` VALUES (325, '21', '家具制造业 ', 1, 'C');
INSERT INTO `industry` VALUES (326, '2110', '木质家具制造', 1, '21');
INSERT INTO `industry` VALUES (327, '2120', '竹、藤家具制造', 1, '21');
INSERT INTO `industry` VALUES (328, '2130', '金属家具制造', 1, '21');
INSERT INTO `industry` VALUES (329, '2140', '塑料家具制造', 1, '21');
INSERT INTO `industry` VALUES (330, '2190', '其他家具制造', 1, '21');
INSERT INTO `industry` VALUES (331, '22', '造纸和纸制品业 ', 1, 'C');
INSERT INTO `industry` VALUES (332, '221', '纸浆制造', 1, '22');
INSERT INTO `industry` VALUES (333, '2211', '木竹浆制造', 1, '221');
INSERT INTO `industry` VALUES (334, '2212', '非木竹浆制造', 1, '221');
INSERT INTO `industry` VALUES (335, '222', '造纸', 1, '22');
INSERT INTO `industry` VALUES (336, '2221', '机制纸及纸板制造', 1, '222');
INSERT INTO `industry` VALUES (337, '2222', '手工纸制造', 1, '222');
INSERT INTO `industry` VALUES (338, '2223', '加工纸制造', 1, '222');
INSERT INTO `industry` VALUES (339, '223', '纸制品制造', 1, '22');
INSERT INTO `industry` VALUES (340, '2231', '纸和纸板容器制造', 1, '223');
INSERT INTO `industry` VALUES (341, '2239', '其他纸制品制造', 1, '223');
INSERT INTO `industry` VALUES (342, '23', '印刷和记录媒介复制业', 1, 'C');
INSERT INTO `industry` VALUES (343, '231', '印刷', 1, '23');
INSERT INTO `industry` VALUES (344, '2311', '书、报刊印刷', 1, '231');
INSERT INTO `industry` VALUES (345, '2312', '本册印制', 1, '231');
INSERT INTO `industry` VALUES (346, '2319', '包装装潢及其他印刷', 1, '231');
INSERT INTO `industry` VALUES (347, '2320', '装订及印刷相关服务', 1, '23');
INSERT INTO `industry` VALUES (348, '2330', '记录媒介复制', 1, '23');
INSERT INTO `industry` VALUES (349, '24', '文教、工美、体育和娱乐用品制造业', 1, 'C');
INSERT INTO `industry` VALUES (350, '241', '文教办公用品制造', 1, '24');
INSERT INTO `industry` VALUES (351, '2411', '文具制造', 1, '241');
INSERT INTO `industry` VALUES (352, '2412', '笔的制造', 1, '241');
INSERT INTO `industry` VALUES (353, '2413', '教学用模型及教具制造', 1, '241');
INSERT INTO `industry` VALUES (354, '2414', '墨水、墨汁制造', 1, '241');
INSERT INTO `industry` VALUES (355, '2419', '其他文教办公用品制造', 1, '241');
INSERT INTO `industry` VALUES (356, '242', '乐器制造', 1, '24');
INSERT INTO `industry` VALUES (357, '2421', '中乐器制造', 1, '242');
INSERT INTO `industry` VALUES (358, '2422', '西乐器制造', 1, '242');
INSERT INTO `industry` VALUES (359, '2423', '电子乐器制造', 1, '242');
INSERT INTO `industry` VALUES (360, '2429', '其他乐器及零件制造', 1, '242');
INSERT INTO `industry` VALUES (361, '243', '工艺美术及礼仪用品制造', 1, '24');
INSERT INTO `industry` VALUES (362, '2431', '雕塑工艺品制造', 1, '243');
INSERT INTO `industry` VALUES (363, '2432', '金属工艺品制造', 1, '243');
INSERT INTO `industry` VALUES (364, '2433', '漆器工艺品制造', 1, '243');
INSERT INTO `industry` VALUES (365, '2434', '花画工艺品制造', 1, '243');
INSERT INTO `industry` VALUES (366, '2435', '天然植物纤维编织工艺品制造', 1, '243');
INSERT INTO `industry` VALUES (367, '2436', '抽纱刺绣工艺品制造', 1, '243');
INSERT INTO `industry` VALUES (368, '2437', '地毯、挂毯制造', 1, '243');
INSERT INTO `industry` VALUES (369, '2438', '珠宝首饰及有关物品制造', 1, '243');
INSERT INTO `industry` VALUES (370, '2439', '其他工艺美术及礼仪用品制造', 1, '243');
INSERT INTO `industry` VALUES (371, '244', '体育用品制造', 1, '24');
INSERT INTO `industry` VALUES (372, '2441', '球类制造', 1, '244');
INSERT INTO `industry` VALUES (373, '2442', '专项运动器材及配件制造', 1, '244');
INSERT INTO `industry` VALUES (374, '2443', '健身器材制造', 1, '244');
INSERT INTO `industry` VALUES (375, '2444', '运动防护用具制造', 1, '244');
INSERT INTO `industry` VALUES (376, '2449', '其他体育用品制造', 1, '244');
INSERT INTO `industry` VALUES (377, '245', '玩具制造', 1, '24');
INSERT INTO `industry` VALUES (378, '2451', '电玩具制造', 1, '245');
INSERT INTO `industry` VALUES (379, '2452', '塑胶玩具制造', 1, '245');
INSERT INTO `industry` VALUES (380, '2453', '金属玩具制造', 1, '245');
INSERT INTO `industry` VALUES (381, '2454', '弹射玩具制造', 1, '245');
INSERT INTO `industry` VALUES (382, '2455', '娃娃玩具制造', 1, '245');
INSERT INTO `industry` VALUES (383, '2456', '儿童乘骑玩耍的童车类产品制造', 1, '245');
INSERT INTO `industry` VALUES (384, '2459', '其他玩具制造', 1, '245');
INSERT INTO `industry` VALUES (385, '246', '游艺器材及娱乐用品制造', 1, '24');
INSERT INTO `industry` VALUES (386, '2461', '露天游乐场所游乐设备制造', 1, '246');
INSERT INTO `industry` VALUES (387, '2462', '游艺用品及室内游艺器材制造', 1, '246');
INSERT INTO `industry` VALUES (388, '2469', '其他娱乐用品制造', 1, '246');
INSERT INTO `industry` VALUES (389, '25', '石油、煤炭及其他燃料加工业 ', 1, 'C');
INSERT INTO `industry` VALUES (390, '251', '精炼石油产品制造', 1, '25');
INSERT INTO `industry` VALUES (391, '2511', '原油加工及石油制品制造', 1, '251');
INSERT INTO `industry` VALUES (392, '2519', '其他原油制造', 1, '251');
INSERT INTO `industry` VALUES (393, '252', '煤炭加工', 1, '25');
INSERT INTO `industry` VALUES (394, '2521', '炼焦', 1, '252');
INSERT INTO `industry` VALUES (395, '2522', '煤制合成气生产', 1, '252');
INSERT INTO `industry` VALUES (396, '2523', '煤制液体燃料生产', 1, '252');
INSERT INTO `industry` VALUES (397, '2524', '煤制品制造', 1, '252');
INSERT INTO `industry` VALUES (398, '2529', '其他煤炭加工', 1, '252');
INSERT INTO `industry` VALUES (399, '2530', '核燃料加工', 1, '25');
INSERT INTO `industry` VALUES (400, '254', '生物质燃料加工', 1, '25');
INSERT INTO `industry` VALUES (401, '2541', '生物质液体燃料生产', 1, '254');
INSERT INTO `industry` VALUES (402, '2542', '生物质致密成型燃料加工', 1, '254');
INSERT INTO `industry` VALUES (403, '26', '化学原料和化学制品制造业', 1, 'C');
INSERT INTO `industry` VALUES (404, '261', '基础化学原料制造', 1, '26');
INSERT INTO `industry` VALUES (405, '2611', '无机酸制造', 1, '261');
INSERT INTO `industry` VALUES (406, '2612', '无机碱制造', 1, '261');
INSERT INTO `industry` VALUES (407, '2613', '无机盐制造', 1, '261');
INSERT INTO `industry` VALUES (408, '2614', '有机化学原料制造', 1, '261');
INSERT INTO `industry` VALUES (409, '2619', '其他基础化学原料制造', 1, '261');
INSERT INTO `industry` VALUES (410, '262', '肥料制造', 1, '26');
INSERT INTO `industry` VALUES (411, '2621', '氮肥制造', 1, '262');
INSERT INTO `industry` VALUES (412, '2622', '磷肥制造', 1, '262');
INSERT INTO `industry` VALUES (413, '2623', '钾肥制造', 1, '262');
INSERT INTO `industry` VALUES (414, '2624', '复混肥料制造', 1, '262');
INSERT INTO `industry` VALUES (415, '2625', '有机肥料及微生物肥料制造', 1, '262');
INSERT INTO `industry` VALUES (416, '2629', '其他肥料制造', 1, '262');
INSERT INTO `industry` VALUES (417, '263', '农药制造', 1, '26');
INSERT INTO `industry` VALUES (418, '2631', '化学农药制造', 1, '263');
INSERT INTO `industry` VALUES (419, '2632', '生物化学农药及微生物农药制造', 1, '263');
INSERT INTO `industry` VALUES (420, '264', '涂料、油墨、颜料及类似产品制造', 1, '26');
INSERT INTO `industry` VALUES (421, '2641', '涂料制造', 1, '264');
INSERT INTO `industry` VALUES (422, '2642', '油墨及类似产品制造', 1, '264');
INSERT INTO `industry` VALUES (423, '2643', '工业颜料制造', 1, '264');
INSERT INTO `industry` VALUES (424, '2644', '工艺美术颜料制造', 1, '264');
INSERT INTO `industry` VALUES (425, '2645', '染料制造', 1, '264');
INSERT INTO `industry` VALUES (426, '2646', '密封用填料及类似品制造', 1, '264');
INSERT INTO `industry` VALUES (427, '265', '合成材料制造', 1, '26');
INSERT INTO `industry` VALUES (428, '2651', '初级形态塑料及合成树脂制造', 1, '265');
INSERT INTO `industry` VALUES (429, '2652', '合成橡胶制造', 1, '265');
INSERT INTO `industry` VALUES (430, '2653', '合成纤维单(聚合)体制造', 1, '265');
INSERT INTO `industry` VALUES (431, '2659', '其他合成材料制造', 1, '265');
INSERT INTO `industry` VALUES (432, '266', '专用化学产品制造', 1, '26');
INSERT INTO `industry` VALUES (433, '2661', '化学试剂和助剂制造', 1, '266');
INSERT INTO `industry` VALUES (434, '2662', '专项化学用品制造', 1, '266');
INSERT INTO `industry` VALUES (435, '2663', '林产化学产品制造', 1, '266');
INSERT INTO `industry` VALUES (436, '2664', '文化用信息化学品制造', 1, '266');
INSERT INTO `industry` VALUES (437, '2665', '医学生产用信息化学品制造', 1, '266');
INSERT INTO `industry` VALUES (438, '2666', '环境污染处理专用药剂材料制造', 1, '266');
INSERT INTO `industry` VALUES (439, '2667', '动物胶制造', 1, '266');
INSERT INTO `industry` VALUES (440, '2669', '其他专用化学产品制造', 1, '266');
INSERT INTO `industry` VALUES (441, '267', '炸药、火工及焰火产品制造', 1, '26');
INSERT INTO `industry` VALUES (442, '2671', '炸药及火工产品制造', 1, '267');
INSERT INTO `industry` VALUES (443, '2672', '焰火、鞭炮产品制造 ', 1, '267');
INSERT INTO `industry` VALUES (444, '268', '日用化学产品制造', 1, '26');
INSERT INTO `industry` VALUES (445, '2681', '肥皂及洗涤剂制造', 1, '268');
INSERT INTO `industry` VALUES (446, '2682', '化妆品制造', 1, '268');
INSERT INTO `industry` VALUES (447, '2683', '口腔清洁用品制造', 1, '268');
INSERT INTO `industry` VALUES (448, '2684', '香料、香精制造', 1, '268');
INSERT INTO `industry` VALUES (449, '2689', '其他日用化学产品制造', 1, '268');
INSERT INTO `industry` VALUES (450, '27', '医药制造业 ', 1, 'C');
INSERT INTO `industry` VALUES (451, '2710', '化学药品原料药制造', 1, '27');
INSERT INTO `industry` VALUES (452, '2720', '化学药品制剂制造', 1, '27');
INSERT INTO `industry` VALUES (453, '2730', '中药饮片加工', 1, '27');
INSERT INTO `industry` VALUES (454, '2740', '中成药生产', 1, '27');
INSERT INTO `industry` VALUES (455, '2750', '兽用药品制造', 1, '27');
INSERT INTO `industry` VALUES (456, '276', '生物药品制品制造', 1, '27');
INSERT INTO `industry` VALUES (457, '2761', '生物药品制造', 1, '276');
INSERT INTO `industry` VALUES (458, '2762', '基因工程药物和疫苗制造', 1, '276');
INSERT INTO `industry` VALUES (459, '2770', '卫生材料及医药用品制造', 1, '27');
INSERT INTO `industry` VALUES (460, '2780', '药用辅料及包装材料', 1, '27');
INSERT INTO `industry` VALUES (461, '28', '化学纤维制造业', 1, 'C');
INSERT INTO `industry` VALUES (462, '281', '纤维素纤维原料及纤维制造', 1, '28');
INSERT INTO `industry` VALUES (463, '2811', '化纤浆粕制造', 1, '281');
INSERT INTO `industry` VALUES (464, '2812', '人造纤维（纤维素纤维）制造', 1, '281');
INSERT INTO `industry` VALUES (465, '282', '合成纤维制造', 1, '28');
INSERT INTO `industry` VALUES (466, '2821', '锦纶纤维制造', 1, '282');
INSERT INTO `industry` VALUES (467, '2822', '涤纶纤维制造', 1, '282');
INSERT INTO `industry` VALUES (468, '2823', '腈纶纤维制造', 1, '282');
INSERT INTO `industry` VALUES (469, '2824', '维纶纤维制造', 1, '282');
INSERT INTO `industry` VALUES (470, '2825', '丙纶纤维制造', 1, '282');
INSERT INTO `industry` VALUES (471, '2826', '氨纶纤维制造', 1, '282');
INSERT INTO `industry` VALUES (472, '2829', '其他合成纤维制造', 1, '282');
INSERT INTO `industry` VALUES (473, '283', '生物基材料制造', 1, '28');
INSERT INTO `industry` VALUES (474, '2831', '生物基化学纤维制造', 1, '283');
INSERT INTO `industry` VALUES (475, '2832', '生物基、淀粉基新材料制造', 1, '283');
INSERT INTO `industry` VALUES (476, '29', '橡胶和塑料制品业', 1, 'C');
INSERT INTO `industry` VALUES (477, '291', '橡胶制品业', 1, '29');
INSERT INTO `industry` VALUES (478, '2911', '轮胎制造', 1, '291');
INSERT INTO `industry` VALUES (479, '2912', '橡胶板、管、带制造', 1, '291');
INSERT INTO `industry` VALUES (480, '2913', '橡胶零件制造', 1, '291');
INSERT INTO `industry` VALUES (481, '2914', '再生橡胶制造', 1, '291');
INSERT INTO `industry` VALUES (482, '2915', '日用及医用橡胶制品制造', 1, '291');
INSERT INTO `industry` VALUES (483, '2916', '运动场地用塑胶制造', 1, '291');
INSERT INTO `industry` VALUES (484, '2919', '其他橡胶制品制造', 1, '291');
INSERT INTO `industry` VALUES (485, '292', '塑料制品业', 1, '29');
INSERT INTO `industry` VALUES (486, '2921', '塑料薄膜制造', 1, '292');
INSERT INTO `industry` VALUES (487, '2922', '塑料板、管、型材制造', 1, '292');
INSERT INTO `industry` VALUES (488, '2923', '塑料丝、绳及编织品制造', 1, '292');
INSERT INTO `industry` VALUES (489, '2924', '泡沫塑料制造', 1, '292');
INSERT INTO `industry` VALUES (490, '2925', '塑料人造革、合成革制造', 1, '292');
INSERT INTO `industry` VALUES (491, '2926', '塑料包装箱及容器制造', 1, '292');
INSERT INTO `industry` VALUES (492, '2927', '日用塑料制品制造', 1, '292');
INSERT INTO `industry` VALUES (493, '2928', '人造草坪制造', 1, '292');
INSERT INTO `industry` VALUES (494, '2929', '塑料零件及其他塑料制品制造', 1, '292');
INSERT INTO `industry` VALUES (495, '30', '非金属矿物制品业', 1, 'C');
INSERT INTO `industry` VALUES (496, '301', '水泥、石灰和石膏制造', 1, '30');
INSERT INTO `industry` VALUES (497, '3011', '水泥制造', 1, '301');
INSERT INTO `industry` VALUES (498, '3012', '石灰和石膏制造', 1, '301');
INSERT INTO `industry` VALUES (499, '302', '石膏、水泥制品及类似制品制造', 1, '30');
INSERT INTO `industry` VALUES (500, '3021', '水泥制品制造', 1, '302');
INSERT INTO `industry` VALUES (501, '3022', '砼结构构件制造', 1, '302');
INSERT INTO `industry` VALUES (502, '3023', '石棉水泥制品制造', 1, '302');
INSERT INTO `industry` VALUES (503, '3024', '轻质建筑材料制造', 1, '302');
INSERT INTO `industry` VALUES (504, '3029', '其他水泥类似制品制造', 1, '302');
INSERT INTO `industry` VALUES (505, '303', '砖瓦、石材等建筑材料制造', 1, '30');
INSERT INTO `industry` VALUES (506, '3031', '粘土砖瓦及建筑砌块制造', 1, '303');
INSERT INTO `industry` VALUES (507, '3032', '建筑用石加工', 1, '303');
INSERT INTO `industry` VALUES (508, '3033', '防水建筑材料制造', 1, '303');
INSERT INTO `industry` VALUES (509, '3034', '隔热和隔音材料制造', 1, '303');
INSERT INTO `industry` VALUES (510, '3039', '其他建筑材料制造', 1, '303');
INSERT INTO `industry` VALUES (511, '304', '玻璃制造', 1, '30');
INSERT INTO `industry` VALUES (512, '3041', '平板玻璃制造', 1, '304');
INSERT INTO `industry` VALUES (513, '3042', '特种玻璃制造', 1, '304');
INSERT INTO `industry` VALUES (514, '3049', '其他玻璃制造', 1, '304');
INSERT INTO `industry` VALUES (515, '305', '玻璃制品制造', 1, '30');
INSERT INTO `industry` VALUES (516, '3051', '技术玻璃制品制造', 1, '305');
INSERT INTO `industry` VALUES (517, '3052', '光学玻璃制造', 1, '305');
INSERT INTO `industry` VALUES (518, '3053', '玻璃仪器制造', 1, '305');
INSERT INTO `industry` VALUES (519, '3054', '日用玻璃制品制造', 1, '305');
INSERT INTO `industry` VALUES (520, '3055', '玻璃包装容器制造', 1, '305');
INSERT INTO `industry` VALUES (521, '3056', '玻璃保温容器制造', 1, '305');
INSERT INTO `industry` VALUES (522, '3057', '制镜及类似品加工', 1, '305');
INSERT INTO `industry` VALUES (523, '3059', '其他玻璃制品制造', 1, '305');
INSERT INTO `industry` VALUES (524, '306', '玻璃纤维和玻璃纤维增强塑料制品制造', 1, '30');
INSERT INTO `industry` VALUES (525, '3061', '玻璃纤维及制品制造', 1, '306');
INSERT INTO `industry` VALUES (526, '3062', '玻璃纤维增强塑料制品制造', 1, '306');
INSERT INTO `industry` VALUES (527, '307', '陶瓷制品制造', 1, '30');
INSERT INTO `industry` VALUES (528, '3071', '建筑陶瓷制品制造', 1, '307');
INSERT INTO `industry` VALUES (529, '3072', '卫生陶瓷制品制造', 1, '307');
INSERT INTO `industry` VALUES (530, '3073', '特种陶瓷制品制造', 1, '307');
INSERT INTO `industry` VALUES (531, '3074', '日用陶瓷制品制造', 1, '307');
INSERT INTO `industry` VALUES (532, '3075', '陈设艺术陶瓷制造', 1, '307');
INSERT INTO `industry` VALUES (533, '3076', '园艺陶瓷制造', 1, '307');
INSERT INTO `industry` VALUES (534, '3079', '其他陶瓷制品制造', 1, '307');
INSERT INTO `industry` VALUES (535, '308', '耐火材料制品制造', 1, '30');
INSERT INTO `industry` VALUES (536, '3081', '石棉制品制造', 1, '308');
INSERT INTO `industry` VALUES (537, '3082', '云母制品制造', 1, '308');
INSERT INTO `industry` VALUES (538, '3089', '耐火陶瓷制品及其他耐火材料制造', 1, '308');
INSERT INTO `industry` VALUES (539, '309', '石墨及其他非金属矿物制品制造', 1, '30');
INSERT INTO `industry` VALUES (540, '3091', '石墨及碳素制品制造', 1, '309');
INSERT INTO `industry` VALUES (541, '3099', '其他非金属矿物制品制造', 1, '309');
INSERT INTO `industry` VALUES (542, '31', '黑色金属冶炼和压延加工业 ', 1, 'C');
INSERT INTO `industry` VALUES (543, '3110', '炼铁', 1, '31');
INSERT INTO `industry` VALUES (544, '3120', '炼钢', 1, '31');
INSERT INTO `industry` VALUES (545, '3130', '钢压延加工', 1, '31');
INSERT INTO `industry` VALUES (546, '3140', '铁合金冶炼', 1, '31');
INSERT INTO `industry` VALUES (547, '32', '有色金属冶炼和压延加工业 ', 1, 'C');
INSERT INTO `industry` VALUES (548, '321', '常用有色金属冶炼', 1, '32');
INSERT INTO `industry` VALUES (549, '3211', '铜冶炼', 1, '321');
INSERT INTO `industry` VALUES (550, '3212', '铅锌冶炼', 1, '321');
INSERT INTO `industry` VALUES (551, '3213', '镍钴冶炼', 1, '321');
INSERT INTO `industry` VALUES (552, '3214', '锡冶炼', 1, '321');
INSERT INTO `industry` VALUES (553, '3215', '锑冶炼', 1, '321');
INSERT INTO `industry` VALUES (554, '3216', '铝冶炼', 1, '321');
INSERT INTO `industry` VALUES (555, '3217', '镁冶炼', 1, '321');
INSERT INTO `industry` VALUES (556, '3218', '硅冶炼', 1, '321');
INSERT INTO `industry` VALUES (557, '3219', '其他常用有色金属冶炼', 1, '321');
INSERT INTO `industry` VALUES (558, '322', '贵金属冶炼', 1, '32');
INSERT INTO `industry` VALUES (559, '3221', '金冶炼', 1, '322');
INSERT INTO `industry` VALUES (560, '3222', '银冶炼', 1, '322');
INSERT INTO `industry` VALUES (561, '3229', '其他贵金属冶炼', 1, '322');
INSERT INTO `industry` VALUES (562, '323', '稀有稀土金属冶炼', 1, '32');
INSERT INTO `industry` VALUES (563, '3231', '钨钼冶炼', 1, '323');
INSERT INTO `industry` VALUES (564, '3232', '稀土金属冶炼', 1, '323');
INSERT INTO `industry` VALUES (565, '3239', '其他稀有金属冶炼', 1, '323');
INSERT INTO `industry` VALUES (566, '3240', '有色金属合金制造', 1, '32');
INSERT INTO `industry` VALUES (567, '325', '有色金属压延加工', 1, '32');
INSERT INTO `industry` VALUES (568, '3251', '铜压延加工', 1, '325');
INSERT INTO `industry` VALUES (569, '3252', '铝压延加工', 1, '325');
INSERT INTO `industry` VALUES (570, '3253', '贵金属压延加工', 1, '325');
INSERT INTO `industry` VALUES (571, '3254', '稀有稀土金属压延加工', 1, '325');
INSERT INTO `industry` VALUES (572, '3259', '其他有色金属压延加工', 1, '325');
INSERT INTO `industry` VALUES (573, '33', '金属制品业 ', 1, 'C');
INSERT INTO `industry` VALUES (574, '331', '结构性金属制品制造', 1, '33');
INSERT INTO `industry` VALUES (575, '3311', '金属结构制造', 1, '331');
INSERT INTO `industry` VALUES (576, '3312', '金属门窗制造', 1, '331');
INSERT INTO `industry` VALUES (577, '332', '金属工具制造', 1, '33');
INSERT INTO `industry` VALUES (578, '3321', '切削工具制造', 1, '332');
INSERT INTO `industry` VALUES (579, '3322', '手工具制造', 1, '332');
INSERT INTO `industry` VALUES (580, '3323', '农用及园林用金属工具制造', 1, '332');
INSERT INTO `industry` VALUES (581, '3324', '刀剪及类似日用金属工具制造', 1, '332');
INSERT INTO `industry` VALUES (582, '3329', '其他金属工具制造', 1, '332');
INSERT INTO `industry` VALUES (583, '333', '集装箱及金属包装容器制造', 1, '33');
INSERT INTO `industry` VALUES (584, '3331', '集装箱制造', 1, '333');
INSERT INTO `industry` VALUES (585, '3332', '金属压力容器制造', 1, '333');
INSERT INTO `industry` VALUES (586, '3333', '金属包装容器及材料制造', 1, '333');
INSERT INTO `industry` VALUES (587, '3340', '金属丝绳及其制品制造', 1, '33');
INSERT INTO `industry` VALUES (588, '335', '建筑、安全用金属制品制造', 1, '33');
INSERT INTO `industry` VALUES (589, '3351', '建筑、家具用金属配件制造', 1, '335');
INSERT INTO `industry` VALUES (590, '3352', '建筑装饰及水暖管道零件制造', 1, '335');
INSERT INTO `industry` VALUES (591, '3353', '安全、消防用金属制品制造', 1, '335');
INSERT INTO `industry` VALUES (592, '3359', '其他建筑、安全用金属制品制造', 1, '335');
INSERT INTO `industry` VALUES (593, '3360', '金属表面处理及热处理加工', 1, '33');
INSERT INTO `industry` VALUES (594, '337', '搪瓷制品制造', 1, '33');
INSERT INTO `industry` VALUES (595, '3371', '生产专用搪瓷制品制造', 1, '337');
INSERT INTO `industry` VALUES (596, '3372', '建筑装饰搪瓷制品制造', 1, '337');
INSERT INTO `industry` VALUES (597, '3373', '搪瓷卫生洁具制造', 1, '337');
INSERT INTO `industry` VALUES (598, '3379', '搪瓷日用品及其他搪瓷制品制造', 1, '337');
INSERT INTO `industry` VALUES (599, '338', '金属制日用品制造', 1, '33');
INSERT INTO `industry` VALUES (600, '3381', '金属制厨房用器具制造', 1, '338');
INSERT INTO `industry` VALUES (601, '3382', '金属制餐具和器皿制造', 1, '338');
INSERT INTO `industry` VALUES (602, '3383', '金属制卫生器具制造', 1, '338');
INSERT INTO `industry` VALUES (603, '3389', '其他金属制日用品制造', 1, '338');
INSERT INTO `industry` VALUES (604, '339', '其他金属制品制造', 1, '33');
INSERT INTO `industry` VALUES (605, '3391', '黑色金属铸造', 1, '339');
INSERT INTO `industry` VALUES (606, '3392', '有色金属铸造', 1, '339');
INSERT INTO `industry` VALUES (607, '3393', '锻件及粉末冶金制品制造', 1, '339');
INSERT INTO `industry` VALUES (608, '3394', '交通及公共管理用金属标牌制造', 1, '339');
INSERT INTO `industry` VALUES (609, '3399', '其他未列明金属制品制造', 1, '339');
INSERT INTO `industry` VALUES (610, '34', '通用设备制造业', 1, 'C');
INSERT INTO `industry` VALUES (611, '341', '锅炉及原动设备制造', 1, '34');
INSERT INTO `industry` VALUES (612, '3411', '锅炉及辅助设备制造', 1, '341');
INSERT INTO `industry` VALUES (613, '3412', '内燃机及配件制造', 1, '341');
INSERT INTO `industry` VALUES (614, '3413', '汽轮机及辅机制造', 1, '341');
INSERT INTO `industry` VALUES (615, '3414', '水轮机及辅机制造', 1, '341');
INSERT INTO `industry` VALUES (616, '3415', '风能原动设备制造', 1, '341');
INSERT INTO `industry` VALUES (617, '3419', '其他原动设备制造', 1, '341');
INSERT INTO `industry` VALUES (618, '342', '金属加工机械制造', 1, '34');
INSERT INTO `industry` VALUES (619, '3421', '金属切削机床制造', 1, '342');
INSERT INTO `industry` VALUES (620, '3422', '金属成形机床制造', 1, '342');
INSERT INTO `industry` VALUES (621, '3423', '铸造机械制造', 1, '342');
INSERT INTO `industry` VALUES (622, '3424', '金属切割及焊接设备制造', 1, '342');
INSERT INTO `industry` VALUES (623, '3425', '机床功能部件及附件制造', 1, '342');
INSERT INTO `industry` VALUES (624, '3429', '其他金属加工机械制造', 1, '342');
INSERT INTO `industry` VALUES (625, '343', '物料搬运设备制造', 1, '34');
INSERT INTO `industry` VALUES (626, '3431', '轻小型起重设备制造', 1, '343');
INSERT INTO `industry` VALUES (627, '3432', '生产专用起重机制造', 1, '343');
INSERT INTO `industry` VALUES (628, '3433', '生产专用车辆制造', 1, '343');
INSERT INTO `industry` VALUES (629, '3434', '连续搬运设备制造', 1, '343');
INSERT INTO `industry` VALUES (630, '3435', '电梯、自动扶梯及升降机制造', 1, '343');
INSERT INTO `industry` VALUES (631, '3436', '客运索道制造', 1, '343');
INSERT INTO `industry` VALUES (632, '3437', '机械式停车设备制造', 1, '343');
INSERT INTO `industry` VALUES (633, '3439', '其他物料搬运设备制造', 1, '343');
INSERT INTO `industry` VALUES (634, '344', '泵、阀门、压缩机及类似机械制造', 1, '34');
INSERT INTO `industry` VALUES (635, '3441', '泵及真空设备制造', 1, '344');
INSERT INTO `industry` VALUES (636, '3442', '气体压缩机械制造', 1, '344');
INSERT INTO `industry` VALUES (637, '3443', '阀门和旋塞制造', 1, '344');
INSERT INTO `industry` VALUES (638, '3444', '液压动力机械及元件制造', 1, '344');
INSERT INTO `industry` VALUES (639, '3445', '液力动力机械元件制造', 1, '344');
INSERT INTO `industry` VALUES (640, '3446', ' 气压动力机械及元件制造', 1, '344');
INSERT INTO `industry` VALUES (641, '345', '轴承、齿轮和传动部件制造', 1, '34');
INSERT INTO `industry` VALUES (642, '3451', '滚动轴承制造', 1, '345');
INSERT INTO `industry` VALUES (643, '3452', '滑动轴承制造', 1, '345');
INSERT INTO `industry` VALUES (644, '3453', '齿轮及齿轮减、变速箱制造', 1, '345');
INSERT INTO `industry` VALUES (645, '3459', '其他传动部件制造', 1, '345');
INSERT INTO `industry` VALUES (646, '346', '烘炉、风机、包装等设备制造', 1, '34');
INSERT INTO `industry` VALUES (647, '3461', '烘炉、熔炉及电炉制造', 1, '346');
INSERT INTO `industry` VALUES (648, '3462', '风机、风扇制造', 1, '346');
INSERT INTO `industry` VALUES (649, '3463', '气体、液体分离及纯净设备制造', 1, '346');
INSERT INTO `industry` VALUES (650, '3464', '制冷、空调设备制造', 1, '346');
INSERT INTO `industry` VALUES (651, '3465', '风动和电动工具制造', 1, '346');
INSERT INTO `industry` VALUES (652, '3466', '喷枪及类似器具制造 ', 1, '346');
INSERT INTO `industry` VALUES (653, '3467', '包装专用设备制造', 1, '346');
INSERT INTO `industry` VALUES (654, '347', '文化、办公用机械制造', 1, '34');
INSERT INTO `industry` VALUES (655, '3471', '电影机械制造', 1, '347');
INSERT INTO `industry` VALUES (656, '3472', '幻灯及投影设备制造', 1, '347');
INSERT INTO `industry` VALUES (657, '3473', '照相机及器材制造', 1, '347');
INSERT INTO `industry` VALUES (658, '3474', '复印和胶印设备制造', 1, '347');
INSERT INTO `industry` VALUES (659, '3475', '计算器及货币专用设备制造', 1, '347');
INSERT INTO `industry` VALUES (660, '3479', '其他文化、办公用机械制造', 1, '347');
INSERT INTO `industry` VALUES (661, '348', '通用零部件制造', 1, '34');
INSERT INTO `industry` VALUES (662, '3481', '金属密封件制造', 1, '348');
INSERT INTO `industry` VALUES (663, '3482', '紧固件制造', 1, '348');
INSERT INTO `industry` VALUES (664, '3483', '弹簧制造', 1, '348');
INSERT INTO `industry` VALUES (665, '3484', '机械零部件加工', 1, '348');
INSERT INTO `industry` VALUES (666, '3489', '其他通用零部件制造', 1, '348');
INSERT INTO `industry` VALUES (667, '349', '其他通用设备制造', 1, '34');
INSERT INTO `industry` VALUES (668, '3491', '工业机器人制造', 1, '349');
INSERT INTO `industry` VALUES (669, '3492', '特殊作业机器人制造', 1, '349');
INSERT INTO `industry` VALUES (670, '3493', '增材制造装备制造', 1, '349');
INSERT INTO `industry` VALUES (671, '3499', '其他未列明通用设备制造业', 1, '349');
INSERT INTO `industry` VALUES (672, '35', '专用设备制造业 ', 1, 'C');
INSERT INTO `industry` VALUES (673, '351', '采矿、冶金、建筑专用设备制造', 1, '35');
INSERT INTO `industry` VALUES (674, '3511', '矿山机械制造', 1, '351');
INSERT INTO `industry` VALUES (675, '3512', '石油钻采专用设备制造', 1, '351');
INSERT INTO `industry` VALUES (676, '3513', '深海石油钻探设备制造', 1, '351');
INSERT INTO `industry` VALUES (677, '3514', '建筑工程用机械制造', 1, '351');
INSERT INTO `industry` VALUES (678, '3515', '建筑材料生产专用机械制造', 1, '351');
INSERT INTO `industry` VALUES (679, '3516', '冶金专用设备制造', 1, '351');
INSERT INTO `industry` VALUES (680, '3517', '隧道施工专用机械制造', 1, '351');
INSERT INTO `industry` VALUES (681, '352', '化工、木材、非金属加工专用设备制造', 1, '35');
INSERT INTO `industry` VALUES (682, '3521', '炼油、化工生产专用设备制造', 1, '352');
INSERT INTO `industry` VALUES (683, '3522', '橡胶加工专用设备制造', 1, '352');
INSERT INTO `industry` VALUES (684, '3523', '塑料加工专用设备制造', 1, '352');
INSERT INTO `industry` VALUES (685, '3524', '木竹材加工机械制造', 1, '352');
INSERT INTO `industry` VALUES (686, '3525', '模具制造', 1, '352');
INSERT INTO `industry` VALUES (687, '3529', '其他非金属加工专用设备制造', 1, '352');
INSERT INTO `industry` VALUES (688, '353', '食品、饮料、烟草及饲料生产专用设备制造　　　', 1, '35');
INSERT INTO `industry` VALUES (689, '3531', '食品、酒、饮料及茶生产专用设备制造', 1, '353');
INSERT INTO `industry` VALUES (690, '3532', '农副食品加工专用设备制造', 1, '353');
INSERT INTO `industry` VALUES (691, '3533', '烟草生产专用设备制造', 1, '353');
INSERT INTO `industry` VALUES (692, '3534', '饲料生产专用设备制造', 1, '353');
INSERT INTO `industry` VALUES (693, '354', '印刷、制药、日化及日用品生产专用设备制造', 1, '35');
INSERT INTO `industry` VALUES (694, '3541', '制浆和造纸专用设备制造', 1, '354');
INSERT INTO `industry` VALUES (695, '3542', '印刷专用设备制造', 1, '354');
INSERT INTO `industry` VALUES (696, '3543', '日用化工专用设备制造', 1, '354');
INSERT INTO `industry` VALUES (697, '3544', '制药专用设备制造', 1, '354');
INSERT INTO `industry` VALUES (698, '3545', '照明器具生产专用设备制造', 1, '354');
INSERT INTO `industry` VALUES (699, '3546', '玻璃、陶瓷和搪瓷制品生产专用设备制造', 1, '354');
INSERT INTO `industry` VALUES (700, '3549', '其他日用品生产专用设备制造', 1, '354');
INSERT INTO `industry` VALUES (701, '355', '纺织、服装和皮革加工专用设备制造', 1, '35');
INSERT INTO `industry` VALUES (702, '3551', '纺织专用设备制造', 1, '355');
INSERT INTO `industry` VALUES (703, '3552', '皮革、毛皮及其制品加工专用设备制造', 1, '355');
INSERT INTO `industry` VALUES (704, '3553', '缝制机械制造', 1, '355');
INSERT INTO `industry` VALUES (705, '3554', '洗涤机械制造', 1, '355');
INSERT INTO `industry` VALUES (706, '356', '电子和电工机械专用设备制造', 1, '35');
INSERT INTO `industry` VALUES (707, '3561', '电工机械专用设备制造', 1, '356');
INSERT INTO `industry` VALUES (708, '3562', '半导体器件专用设备制造', 1, '356');
INSERT INTO `industry` VALUES (709, '3563', '电子元器件与机电组件设备制造', 1, '356');
INSERT INTO `industry` VALUES (710, '3569', '其他电子专用设备制造', 1, '356');
INSERT INTO `industry` VALUES (711, '357', '农、林、牧、渔专用机械制造', 1, '35');
INSERT INTO `industry` VALUES (712, '3571', '拖拉机制造', 1, '357');
INSERT INTO `industry` VALUES (713, '3572', '机械化农业及园艺机具制造', 1, '357');
INSERT INTO `industry` VALUES (714, '3573', '营林及木竹采伐机械制造', 1, '357');
INSERT INTO `industry` VALUES (715, '3574', '畜牧机械制造', 1, '357');
INSERT INTO `industry` VALUES (716, '3575', '渔业机械制造', 1, '357');
INSERT INTO `industry` VALUES (717, '3576', '农林牧渔机械配件制造', 1, '357');
INSERT INTO `industry` VALUES (718, '3577', '棉花加工机械制造', 1, '357');
INSERT INTO `industry` VALUES (719, '3579', '其他农、林、牧、渔业机械制造', 1, '357');
INSERT INTO `industry` VALUES (720, '358', '医疗仪器设备及器械制造', 1, '35');
INSERT INTO `industry` VALUES (721, '3581', '医疗诊断、监护及治疗设备制造', 1, '358');
INSERT INTO `industry` VALUES (722, '3582', '口腔科用设备及器具制造', 1, '358');
INSERT INTO `industry` VALUES (723, '3583', '医疗实验室及医用消毒设备和器具制造', 1, '358');
INSERT INTO `industry` VALUES (724, '3584', '医疗、外科及兽医用器械制造', 1, '358');
INSERT INTO `industry` VALUES (725, '3585', '机械治疗及病房护理设备制造', 1, '358');
INSERT INTO `industry` VALUES (726, '3586', '康复辅具制造', 1, '358');
INSERT INTO `industry` VALUES (727, '3587', '眼镜制造', 1, '358');
INSERT INTO `industry` VALUES (728, '3589', '其他医疗设备及器械制造', 1, '358');
INSERT INTO `industry` VALUES (729, '359', '环保、邮政、社会公共服务及其他专用设备制造', 1, '35');
INSERT INTO `industry` VALUES (730, '3591', '环境保护专用设备制造', 1, '359');
INSERT INTO `industry` VALUES (731, '3592', '地质勘查专用设备制造', 1, '359');
INSERT INTO `industry` VALUES (732, '3593', '邮政专用机械及器材制造', 1, '359');
INSERT INTO `industry` VALUES (733, '3594', '商业、饮食、服务专用设备制造', 1, '359');
INSERT INTO `industry` VALUES (734, '3595', '社会公共安全设备及器材制造', 1, '359');
INSERT INTO `industry` VALUES (735, '3596', '交通安全、管制及类似专用设备制造', 1, '359');
INSERT INTO `industry` VALUES (736, '3597', '水资源专用机械制造', 1, '359');
INSERT INTO `industry` VALUES (737, '3599', '其他专用设备制造', 1, '359');
INSERT INTO `industry` VALUES (738, '36', '汽车制造业', 1, 'C');
INSERT INTO `industry` VALUES (739, '361', '汽车整车制造', 1, '36');
INSERT INTO `industry` VALUES (740, '3611', '汽柴油车整车制造', 1, '361');
INSERT INTO `industry` VALUES (741, '3612', '新能源车整车制造', 1, '361');
INSERT INTO `industry` VALUES (742, '3620', '汽车用发动机制造', 1, '36');
INSERT INTO `industry` VALUES (743, '3630', '改装汽车制造', 1, '36');
INSERT INTO `industry` VALUES (744, '3640', '低速汽车制造', 1, '36');
INSERT INTO `industry` VALUES (745, '3650', '电车制造', 1, '36');
INSERT INTO `industry` VALUES (746, '3660', '汽车车身、挂车制造', 1, '36');
INSERT INTO `industry` VALUES (747, '3670', '汽车零部件及配件制造', 1, '36');
INSERT INTO `industry` VALUES (748, '37', '铁路、船舶、航空航天和其他运输设备制造业', 1, 'C');
INSERT INTO `industry` VALUES (749, '371', '铁路运输设备制造', 1, '37');
INSERT INTO `industry` VALUES (750, '3711', '高铁车组制造', 1, '371');
INSERT INTO `industry` VALUES (751, '3712', '铁路机车车辆制造', 1, '371');
INSERT INTO `industry` VALUES (752, '3713', '窄轨机车车辆制造', 1, '371');
INSERT INTO `industry` VALUES (753, '3714', '高铁设备、配件制造', 1, '371');
INSERT INTO `industry` VALUES (754, '3715', '铁路机车车辆配件制造', 1, '371');
INSERT INTO `industry` VALUES (755, '3716', '铁路专用设备及器材、配件制造', 1, '371');
INSERT INTO `industry` VALUES (756, '3719', '其他铁路运输设备制造', 1, '371');
INSERT INTO `industry` VALUES (757, '3720', '城市轨道交通设备制造', 1, '37');
INSERT INTO `industry` VALUES (758, '373', '船舶及相关装置制造', 1, '37');
INSERT INTO `industry` VALUES (759, '3731', '金属船舶制造', 1, '373');
INSERT INTO `industry` VALUES (760, '3732', '非金属船舶制造', 1, '373');
INSERT INTO `industry` VALUES (761, '3733', '娱乐船和运动船制造', 1, '373');
INSERT INTO `industry` VALUES (762, '3734', '船用配套设备制造', 1, '373');
INSERT INTO `industry` VALUES (763, '3735', '船舶改装', 1, '373');
INSERT INTO `industry` VALUES (764, '3736', '船舶拆除', 1, '373');
INSERT INTO `industry` VALUES (765, '3737', '海洋工程装备制造', 1, '373');
INSERT INTO `industry` VALUES (766, '3739', '航标器材及其他相关装置制造', 1, '373');
INSERT INTO `industry` VALUES (767, '374', '航空、航天器及设备制造', 1, '37');
INSERT INTO `industry` VALUES (768, '3741', '飞机制造', 1, '374');
INSERT INTO `industry` VALUES (769, '3742', '航天器及运载火箭制造', 1, '374');
INSERT INTO `industry` VALUES (770, '3743', '航天相关设备制造', 1, '374');
INSERT INTO `industry` VALUES (771, '3744', '航空相关设备制造', 1, '374');
INSERT INTO `industry` VALUES (772, '3749', '其他航空航天器制造', 1, '374');
INSERT INTO `industry` VALUES (773, '375', '摩托车制造', 1, '37');
INSERT INTO `industry` VALUES (774, '3751', '摩托车整车制造', 1, '375');
INSERT INTO `industry` VALUES (775, '3752', '摩托车零部件及配件制造', 1, '375');
INSERT INTO `industry` VALUES (776, '376', '自行车和残疾人座车制造', 1, '37');
INSERT INTO `industry` VALUES (777, '3761', '自行车制造', 1, '376');
INSERT INTO `industry` VALUES (778, '3762', '残疾人座车制造', 1, '376');
INSERT INTO `industry` VALUES (779, '3770', '助动车制造', 1, '37');
INSERT INTO `industry` VALUES (780, '3780', '非公路休闲车及零配件制造', 1, '37');
INSERT INTO `industry` VALUES (781, '379', '潜水救捞及其他未列明运输设备制造', 1, '37');
INSERT INTO `industry` VALUES (782, '3791', '潜水装备制造', 1, '379');
INSERT INTO `industry` VALUES (783, '3792', '水下救捞装备制造', 1, '379');
INSERT INTO `industry` VALUES (784, '3799', '其他未列明运输设备制造', 1, '379');
INSERT INTO `industry` VALUES (785, '38', '电气机械和器材制造业 ', 1, 'C');
INSERT INTO `industry` VALUES (786, '381', '电机制造', 1, '38');
INSERT INTO `industry` VALUES (787, '3811', '发电机及发电机组制造', 1, '381');
INSERT INTO `industry` VALUES (788, '3812', '电动机制造', 1, '381');
INSERT INTO `industry` VALUES (789, '3813', '微特电机及组件制造', 1, '381');
INSERT INTO `industry` VALUES (790, '3819', '其他电机制造', 1, '381');
INSERT INTO `industry` VALUES (791, '382', '输配电及控制设备制造', 1, '38');
INSERT INTO `industry` VALUES (792, '3821', '变压器、整流器和电感器制造', 1, '382');
INSERT INTO `industry` VALUES (793, '3822', '电容器及其配套设备制造', 1, '382');
INSERT INTO `industry` VALUES (794, '3823', '配电开关控制设备制造', 1, '382');
INSERT INTO `industry` VALUES (795, '3824', '电力电子元器件制造', 1, '382');
INSERT INTO `industry` VALUES (796, '3825', '光伏设备及元器件制造', 1, '382');
INSERT INTO `industry` VALUES (797, '3829', '其他输配电及控制设备制造', 1, '382');
INSERT INTO `industry` VALUES (798, '383', '电线、电缆、光缆及电工器材制造', 1, '38');
INSERT INTO `industry` VALUES (799, '3831', '电线、电缆制造', 1, '383');
INSERT INTO `industry` VALUES (800, '3832', '光纤制造', 1, '383');
INSERT INTO `industry` VALUES (801, '3833', '光缆制造', 1, '383');
INSERT INTO `industry` VALUES (802, '3834', '绝缘制品制造', 1, '383');
INSERT INTO `industry` VALUES (803, '3839', '其他电工器材制造', 1, '383');
INSERT INTO `industry` VALUES (804, '384', '电池制造', 1, '38');
INSERT INTO `industry` VALUES (805, '3841', '锂离子电池制造', 1, '384');
INSERT INTO `industry` VALUES (806, '3842', '镍氢电池制造', 1, '384');
INSERT INTO `industry` VALUES (807, '3843', '铅蓄电池制造', 1, '384');
INSERT INTO `industry` VALUES (808, '3844', '锌锰电池制造', 1, '384');
INSERT INTO `industry` VALUES (809, '3849', '其他电池制造', 1, '384');
INSERT INTO `industry` VALUES (810, '385', '家用电力器具制造', 1, '38');
INSERT INTO `industry` VALUES (811, '3851', '家用制冷电器具制造', 1, '385');
INSERT INTO `industry` VALUES (812, '3852', '家用空气调节器制造', 1, '385');
INSERT INTO `industry` VALUES (813, '3853', '家用通风电器具制造', 1, '385');
INSERT INTO `industry` VALUES (814, '3854', '家用厨房电器具制造', 1, '385');
INSERT INTO `industry` VALUES (815, '3855', '家用清洁卫生电器具制造', 1, '385');
INSERT INTO `industry` VALUES (816, '3856', '家用美容、保健护理电器具制造', 1, '385');
INSERT INTO `industry` VALUES (817, '3857', '家用电力器具专用配件制造', 1, '385');
INSERT INTO `industry` VALUES (818, '3859', '其他家用电力器具制造', 1, '385');
INSERT INTO `industry` VALUES (819, '386', '非电力家用器具制造', 1, '38');
INSERT INTO `industry` VALUES (820, '3861', '燃气及类似能源家用器具制造', 1, '386');
INSERT INTO `industry` VALUES (821, '3862', '太阳能器具制造 ', 1, '386');
INSERT INTO `industry` VALUES (822, '3869', '其他非电力家用器具制造', 1, '386');
INSERT INTO `industry` VALUES (823, '387', '照明器具制造', 1, '38');
INSERT INTO `industry` VALUES (824, '3871', '电光源制造', 1, '387');
INSERT INTO `industry` VALUES (825, '3872', '照明灯具制造', 1, '387');
INSERT INTO `industry` VALUES (826, '3873', '舞台及场地用灯制造', 1, '387');
INSERT INTO `industry` VALUES (827, '3874', '智能照明器具制造', 1, '387');
INSERT INTO `industry` VALUES (828, '3879', '灯用电器附件及其他照明器具制造', 1, '387');
INSERT INTO `industry` VALUES (829, '389', '其他电气机械及器材制造', 1, '38');
INSERT INTO `industry` VALUES (830, '3891', '电气信号设备装置制造', 1, '389');
INSERT INTO `industry` VALUES (831, '3899', '其他未列明电气机械及器材制造', 1, '389');
INSERT INTO `industry` VALUES (832, '39', '计算机、通信和其他电子设备制造业', 1, 'C');
INSERT INTO `industry` VALUES (833, '391', '计算机制造', 1, '39');
INSERT INTO `industry` VALUES (834, '3911', '计算机整机制造', 1, '391');
INSERT INTO `industry` VALUES (835, '3912', '计算机零部件制造', 1, '391');
INSERT INTO `industry` VALUES (836, '3913', '计算机外围设备制造', 1, '391');
INSERT INTO `industry` VALUES (837, '3914', '工业控制计算机及系统制造', 1, '391');
INSERT INTO `industry` VALUES (838, '3915', '信息安全设备制造', 1, '391');
INSERT INTO `industry` VALUES (839, '3919', '其他计算机制造', 1, '391');
INSERT INTO `industry` VALUES (840, '392', '通信设备制造', 1, '39');
INSERT INTO `industry` VALUES (841, '3921', '通信系统设备制造', 1, '392');
INSERT INTO `industry` VALUES (842, '3922', '通信终端设备制造', 1, '392');
INSERT INTO `industry` VALUES (843, '393', '广播电视设备制造', 1, '39');
INSERT INTO `industry` VALUES (844, '3931', '广播电视节目制作及发射设备制造', 1, '393');
INSERT INTO `industry` VALUES (845, '3932', '广播电视接收设备制造', 1, '393');
INSERT INTO `industry` VALUES (846, '3933', '广播电视专用配件制造', 1, '393');
INSERT INTO `industry` VALUES (847, '3934', '专业音响设备制造', 1, '393');
INSERT INTO `industry` VALUES (848, '3939', '应用电视设备及其他广播电视设备制造', 1, '393');
INSERT INTO `industry` VALUES (849, '3940', '雷达及配套设备制造', 1, '39');
INSERT INTO `industry` VALUES (850, '395', '视听设备制造', 1, '39');
INSERT INTO `industry` VALUES (851, '3951', '电视机制造', 1, '395');
INSERT INTO `industry` VALUES (852, '3952', '音响设备制造', 1, '395');
INSERT INTO `industry` VALUES (853, '3953', '影视录放设备制造', 1, '395');
INSERT INTO `industry` VALUES (854, '396', '智能消费设备制造', 1, '39');
INSERT INTO `industry` VALUES (855, '3961', '可穿戴智能设备制造', 1, '396');
INSERT INTO `industry` VALUES (856, '3962', '智能车载设备制造', 1, '396');
INSERT INTO `industry` VALUES (857, '3963', '智能无人飞行器制造', 1, '396');
INSERT INTO `industry` VALUES (858, '3964', '服务消费机器人制造', 1, '396');
INSERT INTO `industry` VALUES (859, '3969', '其他智能消费设备制造', 1, '396');
INSERT INTO `industry` VALUES (860, '397', '电子器件制造', 1, '39');
INSERT INTO `industry` VALUES (861, '3971', '电子真空器件制造', 1, '397');
INSERT INTO `industry` VALUES (862, '3972', '半导体分立器件制造', 1, '397');
INSERT INTO `industry` VALUES (863, '3973', '集成电路制造', 1, '397');
INSERT INTO `industry` VALUES (864, '3974', '显示器件制造', 1, '397');
INSERT INTO `industry` VALUES (865, '3975', '半导体照明器件制造', 1, '397');
INSERT INTO `industry` VALUES (866, '3976', '光电子器件制造', 1, '397');
INSERT INTO `industry` VALUES (867, '3979', '其他电子器件制造', 1, '397');
INSERT INTO `industry` VALUES (868, '398', '电子元件及电子专用材料制造', 1, '39');
INSERT INTO `industry` VALUES (869, '3981', '电阻电容电感元件制造', 1, '398');
INSERT INTO `industry` VALUES (870, '3982', '电子电路制造', 1, '398');
INSERT INTO `industry` VALUES (871, '3983', '敏感元件及传感器制造', 1, '398');
INSERT INTO `industry` VALUES (872, '3984', '电声器件及零件制造', 1, '398');
INSERT INTO `industry` VALUES (873, '3985', '电子专用材料制造', 1, '398');
INSERT INTO `industry` VALUES (874, '3989', '其他电子元件制造', 1, '398');
INSERT INTO `industry` VALUES (875, '3990', '其他电子设备制造', 1, '39');
INSERT INTO `industry` VALUES (876, '40', '仪器仪表制造业', 1, 'C');
INSERT INTO `industry` VALUES (877, '401', '通用仪器仪表制造', 1, '40');
INSERT INTO `industry` VALUES (878, '4011', '工业自动控制系统装置制造', 1, '401');
INSERT INTO `industry` VALUES (879, '4012', '电工仪器仪表制造', 1, '401');
INSERT INTO `industry` VALUES (880, '4013', '绘图、计算及测量仪器制造', 1, '401');
INSERT INTO `industry` VALUES (881, '4014', '实验分析仪器制造', 1, '401');
INSERT INTO `industry` VALUES (882, '4015', '试验机制造', 1, '401');
INSERT INTO `industry` VALUES (883, '4016', '供应用仪器仪表制造', 1, '401');
INSERT INTO `industry` VALUES (884, '4019', '其他通用仪器制造', 1, '401');
INSERT INTO `industry` VALUES (885, '402', '专用仪器仪表制造', 1, '40');
INSERT INTO `industry` VALUES (886, '4021', '环境监测专用仪器仪表制造', 1, '402');
INSERT INTO `industry` VALUES (887, '4022', '运输设备及生产用计数仪表制造', 1, '402');
INSERT INTO `industry` VALUES (888, '4023', '导航、测绘、气象及海洋专用仪器制造', 1, '402');
INSERT INTO `industry` VALUES (889, '4024', '农林牧渔专用仪器仪表制造', 1, '402');
INSERT INTO `industry` VALUES (890, '4025', '地质勘探和地震专用仪器制造', 1, '402');
INSERT INTO `industry` VALUES (891, '4026', '教学专用仪器制造', 1, '402');
INSERT INTO `industry` VALUES (892, '4027', '核子及核辐射测量仪器制造', 1, '402');
INSERT INTO `industry` VALUES (893, '4028', '电子测量仪器制造 ', 1, '402');
INSERT INTO `industry` VALUES (894, '4029', '其他专用仪器制造', 1, '402');
INSERT INTO `industry` VALUES (895, '4030', '钟表与计时仪器制造', 1, '40');
INSERT INTO `industry` VALUES (896, '4040', '光学仪器制造', 1, '40');
INSERT INTO `industry` VALUES (897, '4050', '衡器制造', 1, '40');
INSERT INTO `industry` VALUES (898, '4090', '其他仪器仪表制造业', 1, '40');
INSERT INTO `industry` VALUES (899, '41', '其他制造业', 1, 'C');
INSERT INTO `industry` VALUES (900, '411', '日用杂品制造', 1, '41');
INSERT INTO `industry` VALUES (901, '4111', '鬃毛加工、制刷及清扫工具制造', 1, '411');
INSERT INTO `industry` VALUES (902, '4119', '其他日用杂品制造', 1, '411');
INSERT INTO `industry` VALUES (903, '4120', '核辐射加工', 1, '41');
INSERT INTO `industry` VALUES (904, '4190', '其他未列明制造业', 1, '41');
INSERT INTO `industry` VALUES (905, '42', '废弃资源综合利用业', 1, 'C');
INSERT INTO `industry` VALUES (906, '4210', '金属废料和碎屑加工处理', 1, '42');
INSERT INTO `industry` VALUES (907, '4220', '非金属废料和碎屑加工处理', 1, '42');
INSERT INTO `industry` VALUES (908, '43', '金属制品、机械和设备修理业', 1, 'C');
INSERT INTO `industry` VALUES (909, '4310', '金属制品修理', 1, '43');
INSERT INTO `industry` VALUES (910, '4320', '通用设备修理', 1, '43');
INSERT INTO `industry` VALUES (911, '4330', '专用设备修理', 1, '43');
INSERT INTO `industry` VALUES (912, '434', '铁路、船舶、航空航天等运输设备修理', 1, '43');
INSERT INTO `industry` VALUES (913, '4341', '铁路运输设备修理', 1, '434');
INSERT INTO `industry` VALUES (914, '4342', '船舶修理', 1, '434');
INSERT INTO `industry` VALUES (915, '4343', '航空航天器修理', 1, '434');
INSERT INTO `industry` VALUES (916, '4349', '其他运输设备修理', 1, '434');
INSERT INTO `industry` VALUES (917, '4350', '电气设备修理', 1, '43');
INSERT INTO `industry` VALUES (918, '4360', '仪器仪表修理', 1, '43');
INSERT INTO `industry` VALUES (919, '4390', '其他机械和设备修理业', 1, '43');
INSERT INTO `industry` VALUES (920, 'D', '电力、热力、燃气及水生产和供应业', 1, NULL);
INSERT INTO `industry` VALUES (921, '44', '电力、热力生产和供应业', 1, 'D');
INSERT INTO `industry` VALUES (922, '441', '电力生产', 1, '44');
INSERT INTO `industry` VALUES (923, '4411', '火力发电', 1, '441');
INSERT INTO `industry` VALUES (924, '4412', '热电联产', 1, '441');
INSERT INTO `industry` VALUES (925, '4413', '水力发电', 1, '441');
INSERT INTO `industry` VALUES (926, '4414', '核力发电', 1, '441');
INSERT INTO `industry` VALUES (927, '4415', '风力发电', 1, '441');
INSERT INTO `industry` VALUES (928, '4416', '太阳能发电', 1, '441');
INSERT INTO `industry` VALUES (929, '4417', '生物质能发电', 1, '441');
INSERT INTO `industry` VALUES (930, '4419', '其他电力生产', 1, '441');
INSERT INTO `industry` VALUES (931, '4420', '电力供应', 1, '44');
INSERT INTO `industry` VALUES (932, '4430', '热力生产和供应', 1, '44');
INSERT INTO `industry` VALUES (933, '45', '燃气生产和供应业', 1, 'D');
INSERT INTO `industry` VALUES (934, '451', '燃气生产和供应业', 1, '45');
INSERT INTO `industry` VALUES (935, '4511', '天然气生产和供应业', 1, '451');
INSERT INTO `industry` VALUES (936, '4512', '液化石油气生产和供应业', 1, '451');
INSERT INTO `industry` VALUES (937, '4513', '煤气生产和供应业', 1, '451');
INSERT INTO `industry` VALUES (938, '4520', '生物质燃气生产和供应业', 1, '45');
INSERT INTO `industry` VALUES (939, '46', '水的生产和供应业', 1, 'D');
INSERT INTO `industry` VALUES (940, '4610', '自来水生产和供应', 1, '46');
INSERT INTO `industry` VALUES (941, '4620', '?污水处理及其再生利用', 1, '46');
INSERT INTO `industry` VALUES (942, '4630', '海水淡化处理', 1, '46');
INSERT INTO `industry` VALUES (943, '4690', '其他水的处理、利用与分配', 1, '46');
INSERT INTO `industry` VALUES (944, 'E', '建筑业', 1, NULL);
INSERT INTO `industry` VALUES (945, '47', '房屋建筑业', 1, 'E');
INSERT INTO `industry` VALUES (946, '4710', '住宅房屋建筑', 1, '47');
INSERT INTO `industry` VALUES (947, '4720', '体育场馆建筑', 1, '47');
INSERT INTO `industry` VALUES (948, '4790', '其他房屋建筑业', 1, '47');
INSERT INTO `industry` VALUES (949, '48', '土木工程建筑业', 1, 'E');
INSERT INTO `industry` VALUES (950, '481', '铁路、道路、隧道和桥梁工程建筑', 1, '48');
INSERT INTO `industry` VALUES (951, '4811', '铁路工程建筑', 1, '481');
INSERT INTO `industry` VALUES (952, '4812', '公路工程建筑', 1, '481');
INSERT INTO `industry` VALUES (953, '4813', '市政道路工程建筑 ', 1, '481');
INSERT INTO `industry` VALUES (954, '4814', '城市轨道交通工程建筑', 1, '481');
INSERT INTO `industry` VALUES (955, '4819', '其他道路、隧道和桥梁工程建筑 ', 1, '481');
INSERT INTO `industry` VALUES (956, '482', '水利和水运工程建筑', 1, '48');
INSERT INTO `industry` VALUES (957, '4821', '水源及供水设施工程建筑', 1, '482');
INSERT INTO `industry` VALUES (958, '4822', '河湖治理及防洪设施工程建筑', 1, '482');
INSERT INTO `industry` VALUES (959, '4823', '港口及航运设施工程建筑', 1, '482');
INSERT INTO `industry` VALUES (960, '483', '海洋工程建筑', 1, '48');
INSERT INTO `industry` VALUES (961, '4831', '海洋油气资源开发利用工程建筑', 1, '483');
INSERT INTO `industry` VALUES (962, '4832', '海洋能源开发利用工程建筑', 1, '483');
INSERT INTO `industry` VALUES (963, '4833', '海底隧道工程建筑', 1, '483');
INSERT INTO `industry` VALUES (964, '4834', '海底设施铺设工程建筑', 1, '483');
INSERT INTO `industry` VALUES (965, '4839', '其他海洋工程建筑', 1, '483');
INSERT INTO `industry` VALUES (966, '4840', '工矿工程建筑', 1, '48');
INSERT INTO `industry` VALUES (967, '485', '架线和管道工程建筑', 1, '48');
INSERT INTO `industry` VALUES (968, '4851', '架线及设备工程建筑', 1, '485');
INSERT INTO `industry` VALUES (969, '4852', '管道工程建筑', 1, '485');
INSERT INTO `industry` VALUES (970, '4853', '地下综合管廊工程建筑', 1, '485');
INSERT INTO `industry` VALUES (971, '486', '节能环保工程施工', 1, '48');
INSERT INTO `industry` VALUES (972, '4861', '节能工程施工', 1, '486');
INSERT INTO `industry` VALUES (973, '4862', '环保工程施工', 1, '486');
INSERT INTO `industry` VALUES (974, '4863', '生态保护工程施工', 1, '486');
INSERT INTO `industry` VALUES (975, '487', '电力工程施工', 1, '48');
INSERT INTO `industry` VALUES (976, '4871', '火力发电工程施工', 1, '487');
INSERT INTO `industry` VALUES (977, '4872', '水力发电工程施工', 1, '487');
INSERT INTO `industry` VALUES (978, '4873', '核电工程施工', 1, '487');
INSERT INTO `industry` VALUES (979, '4874', '风能发电工程施工', 1, '487');
INSERT INTO `industry` VALUES (980, '4875', '太阳能发电工程施工', 1, '487');
INSERT INTO `industry` VALUES (981, '4879', '其他电力工程施工', 1, '487');
INSERT INTO `industry` VALUES (982, '489', '其他土木工程建筑', 1, '48');
INSERT INTO `industry` VALUES (983, '4891', '园林绿化工程施工', 1, '489');
INSERT INTO `industry` VALUES (984, '4892', '体育场地设施工程施工', 1, '489');
INSERT INTO `industry` VALUES (985, '4893', '游乐设施工程施工', 1, '489');
INSERT INTO `industry` VALUES (986, '4899', '其他土木工程建筑施工', 1, '489');
INSERT INTO `industry` VALUES (987, '49', '建筑安装业', 1, 'E');
INSERT INTO `industry` VALUES (988, '4910', '电气安装', 1, '49');
INSERT INTO `industry` VALUES (989, '4920', '管道和设备安装', 1, '49');
INSERT INTO `industry` VALUES (990, '499', '其他建筑安装业', 1, '49');
INSERT INTO `industry` VALUES (991, '4991', '体育场地设施安装', 1, '499');
INSERT INTO `industry` VALUES (992, '4999', '其他建筑安装', 1, '499');
INSERT INTO `industry` VALUES (993, '50', '建筑装饰、装修和其他建筑业', 1, 'E');
INSERT INTO `industry` VALUES (994, '501', '建筑装饰和装修业', 1, '50');
INSERT INTO `industry` VALUES (995, '5011', '公共建筑装饰和装修', 1, '501');
INSERT INTO `industry` VALUES (996, '5012', '住宅装饰和装修', 1, '501');
INSERT INTO `industry` VALUES (997, '5013', '建筑幕墙装饰和装修', 1, '501');
INSERT INTO `industry` VALUES (998, '502', '建筑物拆除和场地准备活动', 1, '50');
INSERT INTO `industry` VALUES (999, '5021', '建筑物拆除活动', 1, '502');
INSERT INTO `industry` VALUES (1000, '5022', '场地准备活动', 1, '502');
INSERT INTO `industry` VALUES (1001, '5030', '提供施工设备服务', 1, '50');
INSERT INTO `industry` VALUES (1002, '5090', '其他未列明建筑业', 1, '50');
INSERT INTO `industry` VALUES (1003, 'F', '批发和零售业', 1, NULL);
INSERT INTO `industry` VALUES (1004, '51', '批发业', 1, 'F');
INSERT INTO `industry` VALUES (1005, '511', '农、林、牧、渔产品批发', 1, '51');
INSERT INTO `industry` VALUES (1006, '5111', '谷物、豆及薯类批发', 1, '511');
INSERT INTO `industry` VALUES (1007, '5112', '种子批发', 1, '511');
INSERT INTO `industry` VALUES (1008, '5113', '畜牧渔业饲料批发', 1, '511');
INSERT INTO `industry` VALUES (1009, '5114', '棉、麻批发', 1, '511');
INSERT INTO `industry` VALUES (1010, '5115', '林业产品批发', 1, '511');
INSERT INTO `industry` VALUES (1011, '5116', '牲畜批发', 1, '511');
INSERT INTO `industry` VALUES (1012, '5117', '渔业产品批发', 1, '511');
INSERT INTO `industry` VALUES (1013, '5119', '其他农牧产品批发', 1, '511');
INSERT INTO `industry` VALUES (1014, '512', '食品、饮料及烟草制品批发', 1, '51');
INSERT INTO `industry` VALUES (1015, '5121', '米、面制品及食用油批发', 1, '512');
INSERT INTO `industry` VALUES (1016, '5122', '糕点、糖果及糖批发', 1, '512');
INSERT INTO `industry` VALUES (1017, '5123', '果品、蔬菜批发', 1, '512');
INSERT INTO `industry` VALUES (1018, '5124', '肉、禽、蛋、奶及水产品批发', 1, '512');
INSERT INTO `industry` VALUES (1019, '5125', '盐及调味品批发', 1, '512');
INSERT INTO `industry` VALUES (1020, '5126', '营养和保健品批发', 1, '512');
INSERT INTO `industry` VALUES (1021, '5127', '酒、饮料及茶叶批发', 1, '512');
INSERT INTO `industry` VALUES (1022, '5128', '烟草制品批发', 1, '512');
INSERT INTO `industry` VALUES (1023, '5129', '其他食品批发', 1, '512');
INSERT INTO `industry` VALUES (1024, '513', '纺织、服装及家庭用品批发', 1, '51');
INSERT INTO `industry` VALUES (1025, '5131', '纺织品、针织品及原料批发', 1, '513');
INSERT INTO `industry` VALUES (1026, '5132', '服装批发', 1, '513');
INSERT INTO `industry` VALUES (1027, '5133', '鞋帽批发', 1, '513');
INSERT INTO `industry` VALUES (1028, '5134', '化妆品及卫生用品批发', 1, '513');
INSERT INTO `industry` VALUES (1029, '5135', '厨具卫具及日用杂品批发', 1, '513');
INSERT INTO `industry` VALUES (1030, '5136', '灯具、装饰物品批发', 1, '513');
INSERT INTO `industry` VALUES (1031, '5137', '家用视听设备批发', 1, '513');
INSERT INTO `industry` VALUES (1032, '5138', '日用家电批发', 1, '513');
INSERT INTO `industry` VALUES (1033, '5139', '其他家庭用品批发', 1, '513');
INSERT INTO `industry` VALUES (1034, '514', '文化、体育用品及器材批发', 1, '51');
INSERT INTO `industry` VALUES (1035, '5141', '文具用品批发', 1, '514');
INSERT INTO `industry` VALUES (1036, '5142', '体育用品及器材批发', 1, '514');
INSERT INTO `industry` VALUES (1037, '5143', '图书批发', 1, '514');
INSERT INTO `industry` VALUES (1038, '5144', '报刊批发', 1, '514');
INSERT INTO `industry` VALUES (1039, '5145', '音像制品、电子和数字出版物批发', 1, '514');
INSERT INTO `industry` VALUES (1040, '5146', '首饰、工艺品及收藏品批发', 1, '514');
INSERT INTO `industry` VALUES (1041, '5147', '乐器批发', 1, '514');
INSERT INTO `industry` VALUES (1042, '5149', '其他文化用品批发', 1, '514');
INSERT INTO `industry` VALUES (1043, '515', '医药及医疗器材批发', 1, '51');
INSERT INTO `industry` VALUES (1044, '5151', '西药批发', 1, '515');
INSERT INTO `industry` VALUES (1045, '5152', '中药批发', 1, '515');
INSERT INTO `industry` VALUES (1046, '5153', '动物用药品批发', 1, '515');
INSERT INTO `industry` VALUES (1047, '5154', '医疗用品及器材批发', 1, '515');
INSERT INTO `industry` VALUES (1048, '516', '矿产品、建材及化工产品批发', 1, '51');
INSERT INTO `industry` VALUES (1049, '5161', '煤炭及制品批发', 1, '516');
INSERT INTO `industry` VALUES (1050, '5162', '石油及制品批发', 1, '516');
INSERT INTO `industry` VALUES (1051, '5163', '非金属矿及制品批发', 1, '516');
INSERT INTO `industry` VALUES (1052, '5164', '金属及金属矿批发', 1, '516');
INSERT INTO `industry` VALUES (1053, '5165', '建材批发', 1, '516');
INSERT INTO `industry` VALUES (1054, '5166', '化肥批发', 1, '516');
INSERT INTO `industry` VALUES (1055, '5167', '农药批发', 1, '516');
INSERT INTO `industry` VALUES (1056, '5168', '农用薄膜批发', 1, '516');
INSERT INTO `industry` VALUES (1057, '5169', '其他化工产品批发', 1, '516');
INSERT INTO `industry` VALUES (1058, '517', '机械设备、五金产品及电子产品批发', 1, '51');
INSERT INTO `industry` VALUES (1059, '5171', '农业机械批发', 1, '517');
INSERT INTO `industry` VALUES (1060, '5172', '汽车及零配件批发', 1, '517');
INSERT INTO `industry` VALUES (1061, '5173', '摩托车及零配件批发', 1, '517');
INSERT INTO `industry` VALUES (1062, '5174', '五金产品批发', 1, '517');
INSERT INTO `industry` VALUES (1063, '5175', '电气设备批发', 1, '517');
INSERT INTO `industry` VALUES (1064, '5176', '计算机、软件及辅助设备批发', 1, '517');
INSERT INTO `industry` VALUES (1065, '5177', '通讯设备批发', 1, '517');
INSERT INTO `industry` VALUES (1066, '5178', '广播影视设备批发', 1, '517');
INSERT INTO `industry` VALUES (1067, '5179', '其他机械设备及电子产品批发', 1, '517');
INSERT INTO `industry` VALUES (1068, '518', '贸易经纪与代理', 1, '51');
INSERT INTO `industry` VALUES (1069, '5181', '贸易代理', 1, '518');
INSERT INTO `industry` VALUES (1070, '5182', '一般物品拍卖 ', 1, '518');
INSERT INTO `industry` VALUES (1071, '5183', '艺术品、收藏品拍卖', 1, '518');
INSERT INTO `industry` VALUES (1072, '5184', '艺术品代理', 1, '518');
INSERT INTO `industry` VALUES (1073, '5189', '其他贸易经纪与代理', 1, '518');
INSERT INTO `industry` VALUES (1074, '519', '其他批发业', 1, '51');
INSERT INTO `industry` VALUES (1075, '5191', '再生物资回收与批发', 1, '519');
INSERT INTO `industry` VALUES (1076, '5192', '宠物食品用品批发', 1, '519');
INSERT INTO `industry` VALUES (1077, '5193', '互联网批发', 1, '519');
INSERT INTO `industry` VALUES (1078, '5199', '其他未列明批发业', 1, '519');
INSERT INTO `industry` VALUES (1079, '52', '零售业', 1, 'F');
INSERT INTO `industry` VALUES (1080, '521', '综合零售', 1, '52');
INSERT INTO `industry` VALUES (1081, '5211', '百货零售', 1, '521');
INSERT INTO `industry` VALUES (1082, '5212', '超级市场零售', 1, '521');
INSERT INTO `industry` VALUES (1083, '5213', '便利店零售', 1, '521');
INSERT INTO `industry` VALUES (1084, '5219', '其他综合零售', 1, '521');
INSERT INTO `industry` VALUES (1085, '522', '食品、饮料及烟草制品专门零售', 1, '52');
INSERT INTO `industry` VALUES (1086, '5221', '粮油零售', 1, '522');
INSERT INTO `industry` VALUES (1087, '5222', '糕点、面包零售', 1, '522');
INSERT INTO `industry` VALUES (1088, '5223', '果品、蔬菜零售', 1, '522');
INSERT INTO `industry` VALUES (1089, '5224', '肉、禽、蛋、奶及水产品零售', 1, '522');
INSERT INTO `industry` VALUES (1090, '5225', '营养和保健品零售', 1, '522');
INSERT INTO `industry` VALUES (1091, '5226', '酒、饮料及茶叶零售', 1, '522');
INSERT INTO `industry` VALUES (1092, '5227', '烟草制品零售', 1, '522');
INSERT INTO `industry` VALUES (1093, '5229', '其他食品零售', 1, '522');
INSERT INTO `industry` VALUES (1094, '523', '纺织、服装及日用品专门零售', 1, '52');
INSERT INTO `industry` VALUES (1095, '5231', '纺织品及针织品零售', 1, '523');
INSERT INTO `industry` VALUES (1096, '5232', '服装零售', 1, '523');
INSERT INTO `industry` VALUES (1097, '5233', '鞋帽零售', 1, '523');
INSERT INTO `industry` VALUES (1098, '5234', '化妆品及卫生用品零售', 1, '523');
INSERT INTO `industry` VALUES (1099, '5235', '厨具卫具及日用杂品零售', 1, '523');
INSERT INTO `industry` VALUES (1100, '5236', '钟表、眼镜零售', 1, '523');
INSERT INTO `industry` VALUES (1101, '5237', '箱包零售', 1, '523');
INSERT INTO `industry` VALUES (1102, '5238', '自行车等代步设备零售', 1, '523');
INSERT INTO `industry` VALUES (1103, '5239', '其他日用品零售', 1, '523');
INSERT INTO `industry` VALUES (1104, '524', '文化、体育用品及器材专门零售', 1, '52');
INSERT INTO `industry` VALUES (1105, '5241', '文具用品零售', 1, '524');
INSERT INTO `industry` VALUES (1106, '5242', '体育用品及器材零售', 1, '524');
INSERT INTO `industry` VALUES (1107, '5243', '图书、报刊零售', 1, '524');
INSERT INTO `industry` VALUES (1108, '5244', '音像制品、电子和数字出版物零售', 1, '524');
INSERT INTO `industry` VALUES (1109, '5245', '珠宝首饰零售', 1, '524');
INSERT INTO `industry` VALUES (1110, '5246', '工艺美术品及收藏品零售', 1, '524');
INSERT INTO `industry` VALUES (1111, '5247', '乐器零售', 1, '524');
INSERT INTO `industry` VALUES (1112, '5248', '照相器材零售', 1, '524');
INSERT INTO `industry` VALUES (1113, '5249', '其他文化用品零售', 1, '524');
INSERT INTO `industry` VALUES (1114, '525', '医药及医疗器材专门零售', 1, '52');
INSERT INTO `industry` VALUES (1115, '5251', '西药零售', 1, '525');
INSERT INTO `industry` VALUES (1116, '5252', '中药零售', 1, '525');
INSERT INTO `industry` VALUES (1117, '5253', '动物用药品零售', 1, '525');
INSERT INTO `industry` VALUES (1118, '5254', '医疗用品及器材零售', 1, '525');
INSERT INTO `industry` VALUES (1119, '5255', '保健辅助治疗器材零售', 1, '525');
INSERT INTO `industry` VALUES (1120, '526', '汽车、摩托车、零配件和燃料及其他动力销售', 1, '52');
INSERT INTO `industry` VALUES (1121, '5261', '汽车新车零售', 1, '526');
INSERT INTO `industry` VALUES (1122, '5262', '汽车旧车零售', 1, '526');
INSERT INTO `industry` VALUES (1123, '5263', '汽车零配件零售', 1, '526');
INSERT INTO `industry` VALUES (1124, '5264', '摩托车及零配件零售', 1, '526');
INSERT INTO `industry` VALUES (1125, '5265', '机动车燃油零售', 1, '526');
INSERT INTO `industry` VALUES (1126, '5266', '机动车燃气零售', 1, '526');
INSERT INTO `industry` VALUES (1127, '5267', '机动车充电销售', 1, '526');
INSERT INTO `industry` VALUES (1128, '527', '家用电器及电子产品专门零售 ', 1, '52');
INSERT INTO `industry` VALUES (1129, '5271', '家用视听设备零售', 1, '527');
INSERT INTO `industry` VALUES (1130, '5272', '日用家电零售', 1, '527');
INSERT INTO `industry` VALUES (1131, '5273', '计算机、软件及辅助设备零售', 1, '527');
INSERT INTO `industry` VALUES (1132, '5274', '通信设备零售', 1, '527');
INSERT INTO `industry` VALUES (1133, '5279', '其他电子产品零售', 1, '527');
INSERT INTO `industry` VALUES (1134, '528', '五金、家具及室内装饰材料专门零售', 1, '52');
INSERT INTO `industry` VALUES (1135, '5281', '五金零售', 1, '528');
INSERT INTO `industry` VALUES (1136, '5282', '灯具零售', 1, '528');
INSERT INTO `industry` VALUES (1137, '5283', '家具零售', 1, '528');
INSERT INTO `industry` VALUES (1138, '5284', '涂料零售', 1, '528');
INSERT INTO `industry` VALUES (1139, '5285', '卫生洁具零售', 1, '528');
INSERT INTO `industry` VALUES (1140, '5286', '木质装饰材料零售', 1, '528');
INSERT INTO `industry` VALUES (1141, '5287', '陶瓷、石材装饰材料零售', 1, '528');
INSERT INTO `industry` VALUES (1142, '5289', '其他室内装饰材料零售', 1, '528');
INSERT INTO `industry` VALUES (1143, '529', '货摊、无店铺及其他零售业', 1, '52');
INSERT INTO `industry` VALUES (1144, '5291', '流动货摊零售', 1, '529');
INSERT INTO `industry` VALUES (1145, '5292', '互联网零售', 1, '529');
INSERT INTO `industry` VALUES (1146, '5293', '邮购及电视、电话零售', 1, '529');
INSERT INTO `industry` VALUES (1147, '5294', '自动售货机零售', 1, '529');
INSERT INTO `industry` VALUES (1148, '5295', '旧货零售', 1, '529');
INSERT INTO `industry` VALUES (1149, '5296', '生活用燃料零售', 1, '529');
INSERT INTO `industry` VALUES (1150, '5297', '宠物食品用品零售', 1, '529');
INSERT INTO `industry` VALUES (1151, '5299', '其他未列明零售业', 1, '529');
INSERT INTO `industry` VALUES (1152, 'G', '交通运输、仓储和邮政业', 1, NULL);
INSERT INTO `industry` VALUES (1153, '53', '铁路运输业', 1, 'G');
INSERT INTO `industry` VALUES (1154, '531', '铁路旅客运输', 1, '53');
INSERT INTO `industry` VALUES (1155, '5311', '高速铁路旅客运输', 1, '531');
INSERT INTO `industry` VALUES (1156, '5312', '城际铁路旅客运输', 1, '531');
INSERT INTO `industry` VALUES (1157, '5313', '普通铁路旅客运输', 1, '531');
INSERT INTO `industry` VALUES (1158, '5320', '铁路货物运输', 1, '53');
INSERT INTO `industry` VALUES (1159, '533', '铁路运输辅助活动', 1, '53');
INSERT INTO `industry` VALUES (1160, '5331', '客运火车站', 1, '533');
INSERT INTO `industry` VALUES (1161, '5332', '货运火车站（场）', 1, '533');
INSERT INTO `industry` VALUES (1162, '5333', '铁路运输维护活动', 1, '533');
INSERT INTO `industry` VALUES (1163, '5339', '其他铁路运输辅助活动', 1, '533');
INSERT INTO `industry` VALUES (1164, '54', '道路运输业', 1, 'G');
INSERT INTO `industry` VALUES (1165, '541', '城市公共交通运输', 1, '54');
INSERT INTO `industry` VALUES (1166, '5411', '公共电汽车客运', 1, '541');
INSERT INTO `industry` VALUES (1167, '5412', '城市轨道交通', 1, '541');
INSERT INTO `industry` VALUES (1168, '5413', '出租车客运', 1, '541');
INSERT INTO `industry` VALUES (1169, '5414', '公共自行车服务', 1, '541');
INSERT INTO `industry` VALUES (1170, '5419', '其他城市公共交通运输 ', 1, '541');
INSERT INTO `industry` VALUES (1171, '542', '公路旅客运输', 1, '54');
INSERT INTO `industry` VALUES (1172, '5421', '长途客运', 1, '542');
INSERT INTO `industry` VALUES (1173, '5422', '旅游客运', 1, '542');
INSERT INTO `industry` VALUES (1174, '5429', '其他公路客运', 1, '542');
INSERT INTO `industry` VALUES (1175, '543', '道路货物运输', 1, '54');
INSERT INTO `industry` VALUES (1176, '5431', '普通货物道路运输', 1, '543');
INSERT INTO `industry` VALUES (1177, '5432', '冷藏车道路运输', 1, '543');
INSERT INTO `industry` VALUES (1178, '5433', '集装箱道路运输', 1, '543');
INSERT INTO `industry` VALUES (1179, '5434', '大型货物道路运输', 1, '543');
INSERT INTO `industry` VALUES (1180, '5435', '危险货物道路运输', 1, '543');
INSERT INTO `industry` VALUES (1181, '5436', '邮件包裹道路运输', 1, '543');
INSERT INTO `industry` VALUES (1182, '5437', '城市配送', 1, '543');
INSERT INTO `industry` VALUES (1183, '5438', '搬家运输', 1, '543');
INSERT INTO `industry` VALUES (1184, '5439', '其他道路货物运输', 1, '543');
INSERT INTO `industry` VALUES (1185, '544', '道路运输辅助活动', 1, '54');
INSERT INTO `industry` VALUES (1186, '5441', '客运汽车站', 1, '544');
INSERT INTO `industry` VALUES (1187, '5442', '货运枢纽（站）', 1, '544');
INSERT INTO `industry` VALUES (1188, '5443', '公路管理与养护', 1, '544');
INSERT INTO `industry` VALUES (1189, '5449', '其他道路运输辅助活动', 1, '544');
INSERT INTO `industry` VALUES (1190, '55', '水上运输业', 1, 'G');
INSERT INTO `industry` VALUES (1191, '551', '水上旅客运输', 1, '55');
INSERT INTO `industry` VALUES (1192, '5511', '海上旅客运输', 1, '551');
INSERT INTO `industry` VALUES (1193, '5512', '内河旅客运输', 1, '551');
INSERT INTO `industry` VALUES (1194, '5513', '客运轮渡运输', 1, '551');
INSERT INTO `industry` VALUES (1195, '552', '水上货物运输', 1, '55');
INSERT INTO `industry` VALUES (1196, '5521', '远洋货物运输', 1, '552');
INSERT INTO `industry` VALUES (1197, '5522', '沿海货物运输', 1, '552');
INSERT INTO `industry` VALUES (1198, '5523', '内河货物运输', 1, '552');
INSERT INTO `industry` VALUES (1199, '553', '水上运输辅助活动', 1, '55');
INSERT INTO `industry` VALUES (1200, '5531', '客运港口', 1, '553');
INSERT INTO `industry` VALUES (1201, '5532', '货运港口', 1, '553');
INSERT INTO `industry` VALUES (1202, '5539', '其他水上运输辅助活动', 1, '553');
INSERT INTO `industry` VALUES (1203, '56', '航空运输业 ', 1, 'G');
INSERT INTO `industry` VALUES (1204, '561', '航空客货运输', 1, '56');
INSERT INTO `industry` VALUES (1205, '5611', '航空旅客运输', 1, '561');
INSERT INTO `industry` VALUES (1206, '5612', '航空货物运输', 1, '561');
INSERT INTO `industry` VALUES (1207, '562', '通用航空服务', 1, '56');
INSERT INTO `industry` VALUES (1208, '5621', '通用航空生产服务', 1, '562');
INSERT INTO `industry` VALUES (1209, '5622', '观光游览航空服务', 1, '562');
INSERT INTO `industry` VALUES (1210, '5623', '体育航空运动服务', 1, '562');
INSERT INTO `industry` VALUES (1211, '5629', '其他通用航空服务', 1, '562');
INSERT INTO `industry` VALUES (1212, '563', '航空运输辅助活动', 1, '56');
INSERT INTO `industry` VALUES (1213, '5631', '机场', 1, '563');
INSERT INTO `industry` VALUES (1214, '5632', '空中交通管理', 1, '563');
INSERT INTO `industry` VALUES (1215, '5639', '其他航空运输辅助活动', 1, '563');
INSERT INTO `industry` VALUES (1216, '57', '管道运输业 ', 1, 'G');
INSERT INTO `industry` VALUES (1217, '5710', '海底管道运输', 1, '57');
INSERT INTO `industry` VALUES (1218, '5720', '陆地管道运输', 1, '57');
INSERT INTO `industry` VALUES (1219, '58', '多式联运和运输代理业', 1, 'G');
INSERT INTO `industry` VALUES (1220, '5810', '多式联运', 1, '58');
INSERT INTO `industry` VALUES (1221, '582', '运输代理业', 1, '58');
INSERT INTO `industry` VALUES (1222, '5821', '货物运输代理', 1, '582');
INSERT INTO `industry` VALUES (1223, '5822', '旅客票务代理', 1, '582');
INSERT INTO `industry` VALUES (1224, '5829', '其他运输代理业', 1, '582');
INSERT INTO `industry` VALUES (1225, '59', '装卸搬运和仓储业 ', 1, 'G');
INSERT INTO `industry` VALUES (1226, '5910', '装卸搬运', 1, '59');
INSERT INTO `industry` VALUES (1227, '5920', '通用仓储', 1, '59');
INSERT INTO `industry` VALUES (1228, '5930', '低温仓储', 1, '59');
INSERT INTO `industry` VALUES (1229, '594', '危险品仓储', 1, '59');
INSERT INTO `industry` VALUES (1230, '5941', '油气仓储', 1, '594');
INSERT INTO `industry` VALUES (1231, '5942', '危险化学品仓储', 1, '594');
INSERT INTO `industry` VALUES (1232, '5949', '其他危险品仓储', 1, '594');
INSERT INTO `industry` VALUES (1233, '595', '谷物、棉花等农产品仓储', 1, '59');
INSERT INTO `industry` VALUES (1234, '5951', '谷物仓储', 1, '595');
INSERT INTO `industry` VALUES (1235, '5952', '棉花仓储', 1, '595');
INSERT INTO `industry` VALUES (1236, '5959', '其他农产品仓储', 1, '595');
INSERT INTO `industry` VALUES (1237, '5960', '中药材仓储', 1, '59');
INSERT INTO `industry` VALUES (1238, '5990', '其他仓储业', 1, '59');
INSERT INTO `industry` VALUES (1239, '60', '邮政业', 1, 'G');
INSERT INTO `industry` VALUES (1240, '6010', '邮政基本服务', 1, '60');
INSERT INTO `industry` VALUES (1241, '6020', '快递服务', 1, '60');
INSERT INTO `industry` VALUES (1242, '6090', '其他寄递服务', 1, '60');
INSERT INTO `industry` VALUES (1243, 'H', '住宿和餐饮业', 1, NULL);
INSERT INTO `industry` VALUES (1244, '61', '住宿业', 1, 'H');
INSERT INTO `industry` VALUES (1245, '6110', '旅游饭店', 1, '61');
INSERT INTO `industry` VALUES (1246, '612', '一般旅馆', 1, '61');
INSERT INTO `industry` VALUES (1247, '6121', '经济型连锁酒店', 1, '612');
INSERT INTO `industry` VALUES (1248, '6129', '其他一般旅馆', 1, '612');
INSERT INTO `industry` VALUES (1249, '6130', '民宿服务', 1, '61');
INSERT INTO `industry` VALUES (1250, '6140', '露营地服务', 1, '61');
INSERT INTO `industry` VALUES (1251, '6190', '其他住宿业', 1, '61');
INSERT INTO `industry` VALUES (1252, '62', '餐饮业', 1, 'H');
INSERT INTO `industry` VALUES (1253, '6210', '正餐服务', 1, '62');
INSERT INTO `industry` VALUES (1254, '6220', '快餐服务', 1, '62');
INSERT INTO `industry` VALUES (1255, '623', '饮料及冷饮服务', 1, '62');
INSERT INTO `industry` VALUES (1256, '6231', '茶馆服务', 1, '623');
INSERT INTO `industry` VALUES (1257, '6232', '咖啡馆服务', 1, '623');
INSERT INTO `industry` VALUES (1258, '6233', '酒吧服务 ', 1, '623');
INSERT INTO `industry` VALUES (1259, '6239', '其他饮料及冷饮服务', 1, '623');
INSERT INTO `industry` VALUES (1260, '624', '餐饮配送及外卖送餐服务', 1, '62');
INSERT INTO `industry` VALUES (1261, '6241', '餐饮配送服务', 1, '624');
INSERT INTO `industry` VALUES (1262, '6242', '外卖送餐服务', 1, '624');
INSERT INTO `industry` VALUES (1263, '629', '其他餐饮业', 1, '62');
INSERT INTO `industry` VALUES (1264, '6291', '小吃服务', 1, '629');
INSERT INTO `industry` VALUES (1265, '6299', '其他未列明餐饮业', 1, '629');
INSERT INTO `industry` VALUES (1266, 'I', '信息传输、软件和信息技术服务业', 1, NULL);
INSERT INTO `industry` VALUES (1267, '63', '电信、广播电视和卫星传输服务', 1, 'I');
INSERT INTO `industry` VALUES (1268, '631', '电信', 1, '63');
INSERT INTO `industry` VALUES (1269, '6311', '固定电信服务', 1, '631');
INSERT INTO `industry` VALUES (1270, '6312', '移动电信服务', 1, '631');
INSERT INTO `industry` VALUES (1271, '6319', '其他电信服务', 1, '631');
INSERT INTO `industry` VALUES (1272, '632', '广播电视传输服务', 1, '63');
INSERT INTO `industry` VALUES (1273, '6321', '有线广播电视传输服务', 1, '632');
INSERT INTO `industry` VALUES (1274, '6322', '无线广播电视传输服务', 1, '632');
INSERT INTO `industry` VALUES (1275, '633', '卫星传输服务', 1, '63');
INSERT INTO `industry` VALUES (1276, '6331', '广播电视卫星传输服务', 1, '633');
INSERT INTO `industry` VALUES (1277, '6339', '其他卫星传输服务', 1, '633');
INSERT INTO `industry` VALUES (1278, '64', '互联网和相关服务', 1, 'I');
INSERT INTO `industry` VALUES (1279, '6410', '互联网接入及相关服务', 1, '64');
INSERT INTO `industry` VALUES (1280, '642', '互联网信息服务', 1, '64');
INSERT INTO `industry` VALUES (1281, '6421', '互联网搜索服务', 1, '642');
INSERT INTO `industry` VALUES (1282, '6422', '互联网游戏服务', 1, '642');
INSERT INTO `industry` VALUES (1283, '6429', '互联网其他信息服务', 1, '642');
INSERT INTO `industry` VALUES (1284, '643', '互联网平台', 1, '64');
INSERT INTO `industry` VALUES (1285, '6431', '互联网生产服务平台', 1, '643');
INSERT INTO `industry` VALUES (1286, '6432', '互联网生活服务平台', 1, '643');
INSERT INTO `industry` VALUES (1287, '6433', '互联网科技创新平台', 1, '643');
INSERT INTO `industry` VALUES (1288, '6434', '互联网公共服务平台', 1, '643');
INSERT INTO `industry` VALUES (1289, '6439', '其他互联网平台', 1, '643');
INSERT INTO `industry` VALUES (1290, '6440', '互联网安全服务', 1, '64');
INSERT INTO `industry` VALUES (1291, '6450', '互联网数据服务', 1, '64');
INSERT INTO `industry` VALUES (1292, '6490', '其他互联网服务', 1, '64');
INSERT INTO `industry` VALUES (1293, '65', '软件和信息技术服务业', 1, 'I');
INSERT INTO `industry` VALUES (1294, '651', '软件开发', 1, '65');
INSERT INTO `industry` VALUES (1295, '6511', '基础软件开发', 1, '651');
INSERT INTO `industry` VALUES (1296, '6512', '支撑软件开发', 1, '651');
INSERT INTO `industry` VALUES (1297, '6513', '应用软件开发', 1, '651');
INSERT INTO `industry` VALUES (1298, '6519', '其他软件开发', 1, '651');
INSERT INTO `industry` VALUES (1299, '6520', '集成电路设计', 1, '65');
INSERT INTO `industry` VALUES (1300, '653', '信息系统集成和物联网技术服务', 1, '65');
INSERT INTO `industry` VALUES (1301, '6531', '信息系统集成服务', 1, '653');
INSERT INTO `industry` VALUES (1302, '6532', '物联网技术服务', 1, '653');
INSERT INTO `industry` VALUES (1303, '6540', '运行维护服务', 1, '65');
INSERT INTO `industry` VALUES (1304, '6550', '信息处理和存储支持服务', 1, '65');
INSERT INTO `industry` VALUES (1305, '6560', '信息技术咨询服务', 1, '65');
INSERT INTO `industry` VALUES (1306, '657', '数字内容服务', 1, '65');
INSERT INTO `industry` VALUES (1307, '6571', '地理遥感信息服务', 1, '657');
INSERT INTO `industry` VALUES (1308, '6572', '动漫、游戏数字内容服务', 1, '657');
INSERT INTO `industry` VALUES (1309, '6579', '其他数字内容服务', 1, '657');
INSERT INTO `industry` VALUES (1310, '659', '其他信息技术服务业', 1, '65');
INSERT INTO `industry` VALUES (1311, '6591', '呼叫中心', 1, '659');
INSERT INTO `industry` VALUES (1312, '6599', '其他未列明信息技术服务业', 1, '659');
INSERT INTO `industry` VALUES (1313, 'J', '金融业', 1, NULL);
INSERT INTO `industry` VALUES (1314, '66', '货币金融服务', 1, 'J');
INSERT INTO `industry` VALUES (1315, '6610', '中央银行服务', 1, '66');
INSERT INTO `industry` VALUES (1316, '662', '货币银行服务', 1, '66');
INSERT INTO `industry` VALUES (1317, '6621', '商业银行服务', 1, '662');
INSERT INTO `industry` VALUES (1318, '6622', '政策性银行服务', 1, '662');
INSERT INTO `industry` VALUES (1319, '6623', '信用合作社服务', 1, '662');
INSERT INTO `industry` VALUES (1320, '6624', '农村资金互助社服务', 1, '662');
INSERT INTO `industry` VALUES (1321, '6629', '其他货币银行服务', 1, '662');
INSERT INTO `industry` VALUES (1322, '663', '非货币银行服务', 1, '66');
INSERT INTO `industry` VALUES (1323, '6631', '融资租赁服务', 1, '663');
INSERT INTO `industry` VALUES (1324, '6632', '财务公司服务 ', 1, '663');
INSERT INTO `industry` VALUES (1325, '6633', '典当', 1, '663');
INSERT INTO `industry` VALUES (1326, '6634', '汽车金融公司服务', 1, '663');
INSERT INTO `industry` VALUES (1327, '6635', '小额贷款公司服务 ', 1, '663');
INSERT INTO `industry` VALUES (1328, '6636', '消费金融公司服务 ', 1, '663');
INSERT INTO `industry` VALUES (1329, '6637', '网络借贷服务', 1, '663');
INSERT INTO `industry` VALUES (1330, '6639', '其他非货币银行服务', 1, '663');
INSERT INTO `industry` VALUES (1331, '6640', '银行理财服务', 1, '66');
INSERT INTO `industry` VALUES (1332, '6650', '银行监管服务', 1, '66');
INSERT INTO `industry` VALUES (1333, '67', '资本市场服务', 1, 'J');
INSERT INTO `industry` VALUES (1334, '671', '证券市场服务', 1, '67');
INSERT INTO `industry` VALUES (1335, '6711', '证券市场管理服务', 1, '671');
INSERT INTO `industry` VALUES (1336, '6712', '证券经纪交易服务', 1, '671');
INSERT INTO `industry` VALUES (1337, '6720', '公开募集证券投资基金', 1, '67');
INSERT INTO `industry` VALUES (1338, '673', '非公开募集证券投资基金', 1, '67');
INSERT INTO `industry` VALUES (1339, '6731', '创业投资基金', 1, '673');
INSERT INTO `industry` VALUES (1340, '6732', '天使投资', 1, '673');
INSERT INTO `industry` VALUES (1341, '6739', '其他非公开募集证券投资基金', 1, '673');
INSERT INTO `industry` VALUES (1342, '674', '期货市场服务', 1, '67');
INSERT INTO `industry` VALUES (1343, '6741', '期货市场管理服务', 1, '674');
INSERT INTO `industry` VALUES (1344, '6749', '其他期货市场服务', 1, '674');
INSERT INTO `industry` VALUES (1345, '6750', '证券期货监管服务', 1, '67');
INSERT INTO `industry` VALUES (1346, '6760', '资本投资服务', 1, '67');
INSERT INTO `industry` VALUES (1347, '6790', '其他资本市场服务', 1, '67');
INSERT INTO `industry` VALUES (1348, '68', '保险业', 1, 'J');
INSERT INTO `industry` VALUES (1349, '681', '人身保险', 1, '68');
INSERT INTO `industry` VALUES (1350, '6811', '人寿保险', 1, '681');
INSERT INTO `industry` VALUES (1351, '6812', '年金保险', 1, '681');
INSERT INTO `industry` VALUES (1352, '6813', '健康保险', 1, '681');
INSERT INTO `industry` VALUES (1353, '6814', '意外伤害保险', 1, '681');
INSERT INTO `industry` VALUES (1354, '6820', '财产保险', 1, '68');
INSERT INTO `industry` VALUES (1355, '6830', '再保险', 1, '68');
INSERT INTO `industry` VALUES (1356, '6840', '商业养老金', 1, '68');
INSERT INTO `industry` VALUES (1357, '685', '保险中介服务', 1, '68');
INSERT INTO `industry` VALUES (1358, '6851', '保险经纪服务', 1, '685');
INSERT INTO `industry` VALUES (1359, '6852', '保险代理服务', 1, '685');
INSERT INTO `industry` VALUES (1360, '6853', '保险公估服务', 1, '685');
INSERT INTO `industry` VALUES (1361, '6860', '保险资产管理', 1, '68');
INSERT INTO `industry` VALUES (1362, '6870', '保险监管服务', 1, '68');
INSERT INTO `industry` VALUES (1363, '6890', '其他保险活动', 1, '68');
INSERT INTO `industry` VALUES (1364, '69', '其他金融业', 1, 'J');
INSERT INTO `industry` VALUES (1365, '691', '金融信托与管理服务', 1, '69');
INSERT INTO `industry` VALUES (1366, '6911', '信托公司', 1, '691');
INSERT INTO `industry` VALUES (1367, '6919', '其他金融信托与管理服务', 1, '691');
INSERT INTO `industry` VALUES (1368, '6920', '控股公司服务', 1, '69');
INSERT INTO `industry` VALUES (1369, '6930', '非金融机构支付服务', 1, '69');
INSERT INTO `industry` VALUES (1370, '6940', '金融信息服务', 1, '69');
INSERT INTO `industry` VALUES (1371, '6950', '金融资产管理公司', 1, '69');
INSERT INTO `industry` VALUES (1372, '699', '其他未列明金融业', 1, '69');
INSERT INTO `industry` VALUES (1373, '6991', '货币经纪公司服务', 1, '699');
INSERT INTO `industry` VALUES (1374, '6999', '其他未包括金融业', 1, '699');
INSERT INTO `industry` VALUES (1375, 'K', '房地产业', 1, NULL);
INSERT INTO `industry` VALUES (1376, '70', '房地产业', 1, 'K');
INSERT INTO `industry` VALUES (1377, '7010', '房地产开发经营', 1, '70');
INSERT INTO `industry` VALUES (1378, '7020', '物业管理', 1, '70');
INSERT INTO `industry` VALUES (1379, '7030', '房地产中介服务', 1, '70');
INSERT INTO `industry` VALUES (1380, '7040', '房地产租赁经营', 1, '70');
INSERT INTO `industry` VALUES (1381, '7090', '其他房地产业', 1, '70');
INSERT INTO `industry` VALUES (1382, 'L', '租赁和商务服务业', 1, NULL);
INSERT INTO `industry` VALUES (1383, '71', '租赁业', 1, 'L');
INSERT INTO `industry` VALUES (1384, '711', '机械设备经营租赁', 1, '71');
INSERT INTO `industry` VALUES (1385, '7111', '汽车租赁', 1, '711');
INSERT INTO `industry` VALUES (1386, '7112', '农业机械经营租赁', 1, '711');
INSERT INTO `industry` VALUES (1387, '7113', '建筑工程机械与设备经营租赁', 1, '711');
INSERT INTO `industry` VALUES (1388, '7114', '计算机及通讯设备经营租赁', 1, '711');
INSERT INTO `industry` VALUES (1389, '7115', '医疗设备经营租赁', 1, '711');
INSERT INTO `industry` VALUES (1390, '7119', '其他机械与设备经营租赁', 1, '711');
INSERT INTO `industry` VALUES (1391, '712', '文体设备和用品出租', 1, '71');
INSERT INTO `industry` VALUES (1392, '7121', '休闲娱乐用品设备出租', 1, '712');
INSERT INTO `industry` VALUES (1393, '7122', '体育用品设备出租', 1, '712');
INSERT INTO `industry` VALUES (1394, '7123', '文化用品设备出租', 1, '712');
INSERT INTO `industry` VALUES (1395, '7124', '图书出租', 1, '712');
INSERT INTO `industry` VALUES (1396, '7125', '音像制品出租', 1, '712');
INSERT INTO `industry` VALUES (1397, '7129', '其他文体设备和用品出租', 1, '712');
INSERT INTO `industry` VALUES (1398, '7130', '日用品出租', 1, '71');
INSERT INTO `industry` VALUES (1399, '72', '商务服务业', 1, 'L');
INSERT INTO `industry` VALUES (1400, '721', '组织管理服务', 1, '72');
INSERT INTO `industry` VALUES (1401, '7211', '企业总部管理', 1, '721');
INSERT INTO `industry` VALUES (1402, '7212', '投资与资产管理', 1, '721');
INSERT INTO `industry` VALUES (1403, '7213', '资源与产权交易服务', 1, '721');
INSERT INTO `industry` VALUES (1404, '7214', '单位后勤管理服务', 1, '721');
INSERT INTO `industry` VALUES (1405, '7215', '农村集体经济组织管理', 1, '721');
INSERT INTO `industry` VALUES (1406, '7219', '其他组织管理服务', 1, '721');
INSERT INTO `industry` VALUES (1407, '722', '综合管理服务', 1, '72');
INSERT INTO `industry` VALUES (1408, '7221', '园区管理服务', 1, '722');
INSERT INTO `industry` VALUES (1409, '7222', '商业综合体管理服务', 1, '722');
INSERT INTO `industry` VALUES (1410, '7223', '市场管理服务', 1, '722');
INSERT INTO `industry` VALUES (1411, '7224', '供应链管理服务', 1, '722');
INSERT INTO `industry` VALUES (1412, '7229', '其他综合管理服务', 1, '722');
INSERT INTO `industry` VALUES (1413, '723', '法律服务', 1, '72');
INSERT INTO `industry` VALUES (1414, '7231', '律师及相关法律服务', 1, '723');
INSERT INTO `industry` VALUES (1415, '7232', '公证服务', 1, '723');
INSERT INTO `industry` VALUES (1416, '7239', '其他法律服务', 1, '723');
INSERT INTO `industry` VALUES (1417, '724', '咨询与调查', 1, '72');
INSERT INTO `industry` VALUES (1418, '7241', '会计、审计及税务服务', 1, '724');
INSERT INTO `industry` VALUES (1419, '7242', '市场调查', 1, '724');
INSERT INTO `industry` VALUES (1420, '7243', '社会经济咨询', 1, '724');
INSERT INTO `industry` VALUES (1421, '7244', '健康咨询', 1, '724');
INSERT INTO `industry` VALUES (1422, '7245', '环保咨询', 1, '724');
INSERT INTO `industry` VALUES (1423, '7246', '体育咨询', 1, '724');
INSERT INTO `industry` VALUES (1424, '7249', '其他专业咨询与调查', 1, '724');
INSERT INTO `industry` VALUES (1425, '725', '广告业', 1, '72');
INSERT INTO `industry` VALUES (1426, '7251', '互联网广告服务', 1, '725');
INSERT INTO `industry` VALUES (1427, '7259', '其他广告服务', 1, '725');
INSERT INTO `industry` VALUES (1428, '726', '人力资源服务', 1, '72');
INSERT INTO `industry` VALUES (1429, '7261', '公共就业服务', 1, '726');
INSERT INTO `industry` VALUES (1430, '7262', '职业中介服务', 1, '726');
INSERT INTO `industry` VALUES (1431, '7263', '劳务派遣服务', 1, '726');
INSERT INTO `industry` VALUES (1432, '7264', '创业指导服务', 1, '726');
INSERT INTO `industry` VALUES (1433, '7269', '其他人力资源服务', 1, '726');
INSERT INTO `industry` VALUES (1434, '727', '安全保护服务', 1, '72');
INSERT INTO `industry` VALUES (1435, '7271', '安全服务', 1, '727');
INSERT INTO `industry` VALUES (1436, '7272', ' 安全系统监控服务', 1, '727');
INSERT INTO `industry` VALUES (1437, '7279', '其他安全保护服务', 1, '727');
INSERT INTO `industry` VALUES (1438, '728', '会议、展览及相关服务', 1, '72');
INSERT INTO `industry` VALUES (1439, '7281', '科技会展服务', 1, '728');
INSERT INTO `industry` VALUES (1440, '7282', '旅游会展服务', 1, '728');
INSERT INTO `industry` VALUES (1441, '7283', '体育会展服务', 1, '728');
INSERT INTO `industry` VALUES (1442, '7284', '文化会展服务', 1, '728');
INSERT INTO `industry` VALUES (1443, '7289', '其他会议、展览及相关服务', 1, '728');
INSERT INTO `industry` VALUES (1444, '729', '其他商务服务业', 1, '72');
INSERT INTO `industry` VALUES (1445, '7291', '旅行社及相关服务', 1, '729');
INSERT INTO `industry` VALUES (1446, '7292', '包装服务', 1, '729');
INSERT INTO `industry` VALUES (1447, '7293', '办公服务', 1, '729');
INSERT INTO `industry` VALUES (1448, '7294', '翻译服务', 1, '729');
INSERT INTO `industry` VALUES (1449, '7295', '信用服务', 1, '729');
INSERT INTO `industry` VALUES (1450, '7296', '非融资担保服务', 1, '729');
INSERT INTO `industry` VALUES (1451, '7297', '商务代理代办服务', 1, '729');
INSERT INTO `industry` VALUES (1452, '7298', '票务代理服务', 1, '729');
INSERT INTO `industry` VALUES (1453, '7299', '其他未列明商务服务业', 1, '729');
INSERT INTO `industry` VALUES (1454, 'M', '科学研究和技术服务业', 1, NULL);
INSERT INTO `industry` VALUES (1455, '73', '研究和试验发展', 1, 'M');
INSERT INTO `industry` VALUES (1456, '7310', '自然科学研究和试验发展', 1, '73');
INSERT INTO `industry` VALUES (1457, '7320', '工程和技术研究和试验发展', 1, '73');
INSERT INTO `industry` VALUES (1458, '7330', '农业科学研究和试验发展', 1, '73');
INSERT INTO `industry` VALUES (1459, '7340', '医学研究和试验发展', 1, '73');
INSERT INTO `industry` VALUES (1460, '7350', '社会人文科学研究', 1, '73');
INSERT INTO `industry` VALUES (1461, '74', '专业技术服务业', 1, 'M');
INSERT INTO `industry` VALUES (1462, '7410', '气象服务', 1, '74');
INSERT INTO `industry` VALUES (1463, '7420', '地震服务', 1, '74');
INSERT INTO `industry` VALUES (1464, '743', '海洋服务', 1, '74');
INSERT INTO `industry` VALUES (1465, '7431', '海洋气象服务', 1, '743');
INSERT INTO `industry` VALUES (1466, '7432', '海洋环境服务', 1, '743');
INSERT INTO `industry` VALUES (1467, '7439', '其他海洋服务', 1, '743');
INSERT INTO `industry` VALUES (1468, '744', '测绘地理信息服务', 1, '74');
INSERT INTO `industry` VALUES (1469, '7441', '遥感测绘服务', 1, '744');
INSERT INTO `industry` VALUES (1470, '7449', '其他测绘地理信息服务', 1, '744');
INSERT INTO `industry` VALUES (1471, '745', '质检技术服务', 1, '74');
INSERT INTO `industry` VALUES (1472, '7451', '检验检疫服务', 1, '745');
INSERT INTO `industry` VALUES (1473, '7452', '检测服务', 1, '745');
INSERT INTO `industry` VALUES (1474, '7453', '计量服务', 1, '745');
INSERT INTO `industry` VALUES (1475, '7454', '标准化服务', 1, '745');
INSERT INTO `industry` VALUES (1476, '7455', '认证认可服务', 1, '745');
INSERT INTO `industry` VALUES (1477, '7459', '其他质检技术服务', 1, '745');
INSERT INTO `industry` VALUES (1478, '746', '环境与生态监测', 1, '74');
INSERT INTO `industry` VALUES (1479, '7461', '环境保护监测', 1, '746');
INSERT INTO `industry` VALUES (1480, '7462', '生态资源监测', 1, '746');
INSERT INTO `industry` VALUES (1481, '7463', '野生动物疫源疫病防控监测', 1, '746');
INSERT INTO `industry` VALUES (1482, '747', '地质勘查 ', 1, '74');
INSERT INTO `industry` VALUES (1483, '7471', '能源矿产地质勘查', 1, '747');
INSERT INTO `industry` VALUES (1484, '7472', '固体矿产地质勘查', 1, '747');
INSERT INTO `industry` VALUES (1485, '7473', '水、二氧化碳等矿产地质勘查', 1, '747');
INSERT INTO `industry` VALUES (1486, '7474', '基础地质勘查', 1, '747');
INSERT INTO `industry` VALUES (1487, '7475', '地质勘查技术服务', 1, '747');
INSERT INTO `industry` VALUES (1488, '748', '工程技术与设计服务', 1, '74');
INSERT INTO `industry` VALUES (1489, '7481', '工程管理服务', 1, '748');
INSERT INTO `industry` VALUES (1490, '7482', '工程监理服务', 1, '748');
INSERT INTO `industry` VALUES (1491, '7483', '工程勘察活动', 1, '748');
INSERT INTO `industry` VALUES (1492, '7484', '工程设计活动', 1, '748');
INSERT INTO `industry` VALUES (1493, '7485', '规划设计管理', 1, '748');
INSERT INTO `industry` VALUES (1494, '7486', '土地规划服务', 1, '748');
INSERT INTO `industry` VALUES (1495, '749', '工业与专业设计及其他专业技术服务', 1, '74');
INSERT INTO `industry` VALUES (1496, '7491', '工业设计服务', 1, '749');
INSERT INTO `industry` VALUES (1497, '7492', '专业设计服务', 1, '749');
INSERT INTO `industry` VALUES (1498, '7493', '兽医服务', 1, '749');
INSERT INTO `industry` VALUES (1499, '7499', '其他未列明专业技术服务业', 1, '749');
INSERT INTO `industry` VALUES (1500, '75', '科技推广和应用服务', 1, 'M');
INSERT INTO `industry` VALUES (1501, '751', '技术推广服务', 1, '75');
INSERT INTO `industry` VALUES (1502, '7511', '农林牧渔技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1503, '7512', '生物技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1504, '7513', '新材料技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1505, '7514', '节能技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1506, '7515', '新能源技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1507, '7516', '环保技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1508, '7517', '三维（3D)打印技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1509, '7519', '其他技术推广服务', 1, '751');
INSERT INTO `industry` VALUES (1510, '7520', '知识产权服务', 1, '75');
INSERT INTO `industry` VALUES (1511, '7530', '科技中介服务', 1, '75');
INSERT INTO `industry` VALUES (1512, '7540', '创业空间服务', 1, '75');
INSERT INTO `industry` VALUES (1513, '7590', '其他科技推广服务业', 1, '75');
INSERT INTO `industry` VALUES (1514, 'N', '水利、环境和公共设施管理业', 1, NULL);
INSERT INTO `industry` VALUES (1515, '76', '水利管理业', 1, 'N');
INSERT INTO `industry` VALUES (1516, '7610', '防洪除涝设施管理', 1, '76');
INSERT INTO `industry` VALUES (1517, '7620', '水资源管理', 1, '76');
INSERT INTO `industry` VALUES (1518, '7630', '天然水收集与分配', 1, '76');
INSERT INTO `industry` VALUES (1519, '7640', '水文服务', 1, '76');
INSERT INTO `industry` VALUES (1520, '7690', '其他水利管理业', 1, '76');
INSERT INTO `industry` VALUES (1521, '77', '生态保护和环境治理业', 1, 'N');
INSERT INTO `industry` VALUES (1522, '771', '生态保护', 1, '77');
INSERT INTO `industry` VALUES (1523, '7711', '自然生态系统保护管理', 1, '771');
INSERT INTO `industry` VALUES (1524, '7712', '自然遗迹保护管理', 1, '771');
INSERT INTO `industry` VALUES (1525, '7713', '野生动物保护', 1, '771');
INSERT INTO `industry` VALUES (1526, '7714', '野生植物保护', 1, '771');
INSERT INTO `industry` VALUES (1527, '7715', '动物园、水族馆管理服务', 1, '771');
INSERT INTO `industry` VALUES (1528, '7716', '植物园管理服务', 1, '771');
INSERT INTO `industry` VALUES (1529, '7719', '其他自然保护', 1, '771');
INSERT INTO `industry` VALUES (1530, '772', '环境治理业', 1, '77');
INSERT INTO `industry` VALUES (1531, '7721', '水污染治理', 1, '772');
INSERT INTO `industry` VALUES (1532, '7722', '大气污染治理', 1, '772');
INSERT INTO `industry` VALUES (1533, '7723', '固体废物治理', 1, '772');
INSERT INTO `industry` VALUES (1534, '7724', '危险废物治理', 1, '772');
INSERT INTO `industry` VALUES (1535, '7725', '放射性废物治理', 1, '772');
INSERT INTO `industry` VALUES (1536, '7726', '土壤污染治理与修复服务', 1, '772');
INSERT INTO `industry` VALUES (1537, '7727', '噪声与振动控制服务', 1, '772');
INSERT INTO `industry` VALUES (1538, '7729', '其他污染治理 ', 1, '772');
INSERT INTO `industry` VALUES (1539, '78', '公共设施管理业', 1, 'N');
INSERT INTO `industry` VALUES (1540, '7810', '市政设施管理', 1, '78');
INSERT INTO `industry` VALUES (1541, '7820', '环境卫生管理', 1, '78');
INSERT INTO `industry` VALUES (1542, '7830', '城乡市容管理', 1, '78');
INSERT INTO `industry` VALUES (1543, '7840', '绿化管理', 1, '78');
INSERT INTO `industry` VALUES (1544, '7850', '城市公园管理', 1, '78');
INSERT INTO `industry` VALUES (1545, '786', '游览景区管理', 1, '78');
INSERT INTO `industry` VALUES (1546, '7861', '名胜风景区管理', 1, '786');
INSERT INTO `industry` VALUES (1547, '7862', '森林公园管理', 1, '786');
INSERT INTO `industry` VALUES (1548, '7869', '其他游览景区管理', 1, '786');
INSERT INTO `industry` VALUES (1549, '79', '土地管理业', 1, 'N');
INSERT INTO `industry` VALUES (1550, '7910', '土地整治服务', 1, '79');
INSERT INTO `industry` VALUES (1551, '7920', '土地调查评估服务', 1, '79');
INSERT INTO `industry` VALUES (1552, '7930', '土地登记服务', 1, '79');
INSERT INTO `industry` VALUES (1553, '7940', '土地登记代理服务', 1, '79');
INSERT INTO `industry` VALUES (1554, '7990', '其他土地管理服务', 1, '79');
INSERT INTO `industry` VALUES (1555, 'O', '居民服务、修理和其他服务业', 1, NULL);
INSERT INTO `industry` VALUES (1556, '80', '居民服务业', 1, 'O');
INSERT INTO `industry` VALUES (1557, '8010', '家庭服务', 1, '80');
INSERT INTO `industry` VALUES (1558, '8020', '托儿所服务', 1, '80');
INSERT INTO `industry` VALUES (1559, '8030', '洗染服务', 1, '80');
INSERT INTO `industry` VALUES (1560, '8040', '理发及美容服务', 1, '80');
INSERT INTO `industry` VALUES (1561, '805', '洗浴和保健养生服务', 1, '80');
INSERT INTO `industry` VALUES (1562, '8051', '洗浴服务', 1, '805');
INSERT INTO `industry` VALUES (1563, '8052', '足浴服务', 1, '805');
INSERT INTO `industry` VALUES (1564, '8053', '养生保健服务', 1, '805');
INSERT INTO `industry` VALUES (1565, '8060', '摄影扩印服务', 1, '80');
INSERT INTO `industry` VALUES (1566, '8070', '婚姻服务', 1, '80');
INSERT INTO `industry` VALUES (1567, '8080', '殡葬服务', 1, '80');
INSERT INTO `industry` VALUES (1568, '8090', '其他居民服务业', 1, '80');
INSERT INTO `industry` VALUES (1569, '81', '机动车、电子产品和日用产品修理业', 1, 'O');
INSERT INTO `industry` VALUES (1570, '811', '汽车、摩托车等修理与维护', 1, '81');
INSERT INTO `industry` VALUES (1571, '8111', '汽车修理与维护', 1, '811');
INSERT INTO `industry` VALUES (1572, '8112', '大型车辆装备修理与维护', 1, '811');
INSERT INTO `industry` VALUES (1573, '8113', '摩托车修理与维护', 1, '811');
INSERT INTO `industry` VALUES (1574, '8114', '助动车等修理与维护', 1, '811');
INSERT INTO `industry` VALUES (1575, '812', '计算机和办公设备维修', 1, '81');
INSERT INTO `industry` VALUES (1576, '8121', '计算机和辅助设备修理', 1, '812');
INSERT INTO `industry` VALUES (1577, '8122', '通讯设备修理', 1, '812');
INSERT INTO `industry` VALUES (1578, '8129', '其他办公设备维修', 1, '812');
INSERT INTO `industry` VALUES (1579, '813', '家用电器修理', 1, '81');
INSERT INTO `industry` VALUES (1580, '8131', '家用电子产品修理', 1, '813');
INSERT INTO `industry` VALUES (1581, '8132', '日用电器修理', 1, '813');
INSERT INTO `industry` VALUES (1582, '819', '其他日用产品修理业', 1, '81');
INSERT INTO `industry` VALUES (1583, '8191', '自行车修理', 1, '819');
INSERT INTO `industry` VALUES (1584, '8192', '鞋和皮革修理', 1, '819');
INSERT INTO `industry` VALUES (1585, '8193', '家具和相关物品修理', 1, '819');
INSERT INTO `industry` VALUES (1586, '8199', '其他未列明日用产品修理业', 1, '819');
INSERT INTO `industry` VALUES (1587, '82', '其他服务业', 1, 'O');
INSERT INTO `industry` VALUES (1588, '821', '清洁服务', 1, '82');
INSERT INTO `industry` VALUES (1589, '8211', '建筑物清洁服务', 1, '821');
INSERT INTO `industry` VALUES (1590, '8219', '其他清洁服务', 1, '821');
INSERT INTO `industry` VALUES (1591, '822', '宠物服务', 1, '82');
INSERT INTO `industry` VALUES (1592, '8221', '宠物饲养', 1, '822');
INSERT INTO `industry` VALUES (1593, '8222', '宠物医院服务', 1, '822');
INSERT INTO `industry` VALUES (1594, '8223', '宠物美容服务', 1, '822');
INSERT INTO `industry` VALUES (1595, '8224', '宠物寄托收养服务', 1, '822');
INSERT INTO `industry` VALUES (1596, '8229', '其他宠物服务', 1, '822');
INSERT INTO `industry` VALUES (1597, '8290', '其他未列明服务业', 1, '82');
INSERT INTO `industry` VALUES (1598, 'P', '教育', 1, NULL);
INSERT INTO `industry` VALUES (1599, '83', '教育', 1, 'P');
INSERT INTO `industry` VALUES (1600, '8310', '学前教育', 1, '83');
INSERT INTO `industry` VALUES (1601, '832', '初等教育', 1, '83');
INSERT INTO `industry` VALUES (1602, '8321', '普通小学教育', 1, '832');
INSERT INTO `industry` VALUES (1603, '8322', '成人小学教育', 1, '832');
INSERT INTO `industry` VALUES (1604, '833', '中等教育', 1, '83');
INSERT INTO `industry` VALUES (1605, '8331', '普通初中教育', 1, '833');
INSERT INTO `industry` VALUES (1606, '8332', '职业初中教育', 1, '833');
INSERT INTO `industry` VALUES (1607, '8333', '成人初中教育', 1, '833');
INSERT INTO `industry` VALUES (1608, '8334', '普通高中教育', 1, '833');
INSERT INTO `industry` VALUES (1609, '8335', '成人高中教育', 1, '833');
INSERT INTO `industry` VALUES (1610, '8336', '中等职业学校教育', 1, '833');
INSERT INTO `industry` VALUES (1611, '834', '高等教育', 1, '83');
INSERT INTO `industry` VALUES (1612, '8341', '普通高等教育', 1, '834');
INSERT INTO `industry` VALUES (1613, '8342', '成人高等教育', 1, '834');
INSERT INTO `industry` VALUES (1614, '8350', '特殊教育', 1, '83');
INSERT INTO `industry` VALUES (1615, '839', '技能培训、教育辅助及其他教育', 1, '83');
INSERT INTO `industry` VALUES (1616, '8391', '职业技能培训', 1, '839');
INSERT INTO `industry` VALUES (1617, '8392', '体校及体育培训', 1, '839');
INSERT INTO `industry` VALUES (1618, '8393', '文化艺术培训', 1, '839');
INSERT INTO `industry` VALUES (1619, '8394', '教育辅助服务', 1, '839');
INSERT INTO `industry` VALUES (1620, '8399', '其他未列明教育', 1, '839');
INSERT INTO `industry` VALUES (1621, 'Q', '卫生和社会工作', 1, NULL);
INSERT INTO `industry` VALUES (1622, '84', '卫生', 1, 'Q');
INSERT INTO `industry` VALUES (1623, '841', '医院', 1, '84');
INSERT INTO `industry` VALUES (1624, '8411', '综合医院', 1, '841');
INSERT INTO `industry` VALUES (1625, '8412', '中医医院', 1, '841');
INSERT INTO `industry` VALUES (1626, '8413', '中西医结合医院', 1, '841');
INSERT INTO `industry` VALUES (1627, '8414', '民族医院', 1, '841');
INSERT INTO `industry` VALUES (1628, '8415', '专科医院', 1, '841');
INSERT INTO `industry` VALUES (1629, '8416', '疗养院', 1, '841');
INSERT INTO `industry` VALUES (1630, '842', '基层医疗卫生服务', 1, '84');
INSERT INTO `industry` VALUES (1631, '8421', '社区卫生服务中心（站）', 1, '842');
INSERT INTO `industry` VALUES (1632, '8422', '街道卫生院', 1, '842');
INSERT INTO `industry` VALUES (1633, '8423', '乡镇卫生院', 1, '842');
INSERT INTO `industry` VALUES (1634, '8424', '村卫生室 ', 1, '842');
INSERT INTO `industry` VALUES (1635, '8425', '门诊部（所）', 1, '842');
INSERT INTO `industry` VALUES (1636, '843', '专业公共卫生服务', 1, '84');
INSERT INTO `industry` VALUES (1637, '8431', '疾病预防控制中心', 1, '843');
INSERT INTO `industry` VALUES (1638, '8432', '专科疾病防治院（所、站)', 1, '843');
INSERT INTO `industry` VALUES (1639, '8433', '妇幼保健院（所、站）', 1, '843');
INSERT INTO `industry` VALUES (1640, '8434', '急救中心（站）服务', 1, '843');
INSERT INTO `industry` VALUES (1641, '8435', '采供血机构服务', 1, '843');
INSERT INTO `industry` VALUES (1642, '8436', '计划生育技术服务活动', 1, '843');
INSERT INTO `industry` VALUES (1643, '849', '其他卫生活动', 1, '84');
INSERT INTO `industry` VALUES (1644, '8491', '健康体检服务', 1, '849');
INSERT INTO `industry` VALUES (1645, '8492', '临床检验服务', 1, '849');
INSERT INTO `industry` VALUES (1646, '8499', '其他未列明卫生服务', 1, '849');
INSERT INTO `industry` VALUES (1647, '85', '社会工作', 1, 'Q');
INSERT INTO `industry` VALUES (1648, '851', '提供住宿社会工作', 1, '85');
INSERT INTO `industry` VALUES (1649, '8511', '干部休养所', 1, '851');
INSERT INTO `industry` VALUES (1650, '8512', '护理机构服务', 1, '851');
INSERT INTO `industry` VALUES (1651, '8513', '精神康复服务', 1, '851');
INSERT INTO `industry` VALUES (1652, '8514', '老年人、残疾人养护服务', 1, '851');
INSERT INTO `industry` VALUES (1653, '8515', '临终关怀服务', 1, '851');
INSERT INTO `industry` VALUES (1654, '8516', '孤残儿童收养和庇护服务', 1, '851');
INSERT INTO `industry` VALUES (1655, '8519', '其他提供住宿社会救助', 1, '851');
INSERT INTO `industry` VALUES (1656, '852', '不提供住宿社会工作', 1, '85');
INSERT INTO `industry` VALUES (1657, '8521', '社会看护与帮助服务', 1, '852');
INSERT INTO `industry` VALUES (1658, '8522', '康复辅具适配服务', 1, '852');
INSERT INTO `industry` VALUES (1659, '8529', '其他不提供住宿社会工作', 1, '852');
INSERT INTO `industry` VALUES (1660, 'R', '文化、体育和娱乐业', 1, NULL);
INSERT INTO `industry` VALUES (1661, '86', '新闻和出版业', 1, 'R');
INSERT INTO `industry` VALUES (1662, '8610', '新闻业', 1, '86');
INSERT INTO `industry` VALUES (1663, '862', '出版业', 1, '86');
INSERT INTO `industry` VALUES (1664, '8621', '图书出版', 1, '862');
INSERT INTO `industry` VALUES (1665, '8622', '报纸出版', 1, '862');
INSERT INTO `industry` VALUES (1666, '8623', '期刊出版', 1, '862');
INSERT INTO `industry` VALUES (1667, '8624', '音像制品出版', 1, '862');
INSERT INTO `industry` VALUES (1668, '8625', '电子出版物出版', 1, '862');
INSERT INTO `industry` VALUES (1669, '8626', '数字出版', 1, '862');
INSERT INTO `industry` VALUES (1670, '8629', '其他出版业', 1, '862');
INSERT INTO `industry` VALUES (1671, '87', '广播、电视、电影和影视录音制作业', 1, 'R');
INSERT INTO `industry` VALUES (1672, '8710', '广播', 1, '87');
INSERT INTO `industry` VALUES (1673, '8720', '电视', 1, '87');
INSERT INTO `industry` VALUES (1674, '8730', '影视节目制作', 1, '87');
INSERT INTO `industry` VALUES (1675, '8740', '广播电视集成播控', 1, '87');
INSERT INTO `industry` VALUES (1676, '8750', '电影和广播电视节目发行', 1, '87');
INSERT INTO `industry` VALUES (1677, '8760', '电影放映', 1, '87');
INSERT INTO `industry` VALUES (1678, '8770', '录音制作', 1, '87');
INSERT INTO `industry` VALUES (1679, '88', '文化艺术业', 1, 'R');
INSERT INTO `industry` VALUES (1680, '8810', '文艺创作与表演', 1, '88');
INSERT INTO `industry` VALUES (1681, '8820', '艺术表演场馆', 1, '88');
INSERT INTO `industry` VALUES (1682, '883', '图书馆与档案馆', 1, '88');
INSERT INTO `industry` VALUES (1683, '8831', '图书馆', 1, '883');
INSERT INTO `industry` VALUES (1684, '8832', '档案馆', 1, '883');
INSERT INTO `industry` VALUES (1685, '8840', '文物及非物质文化遗产保护', 1, '88');
INSERT INTO `industry` VALUES (1686, '8850', '博物馆', 1, '88');
INSERT INTO `industry` VALUES (1687, '8860', '烈士陵园、纪念馆', 1, '88');
INSERT INTO `industry` VALUES (1688, '8870', '群众文体活动', 1, '88');
INSERT INTO `industry` VALUES (1689, '8890', '其他文化艺术业', 1, '88');
INSERT INTO `industry` VALUES (1690, '89', '体育', 1, 'R');
INSERT INTO `industry` VALUES (1691, '891', '体育组织', 1, '89');
INSERT INTO `industry` VALUES (1692, '8911', '体育竞赛组织', 1, '891');
INSERT INTO `industry` VALUES (1693, '8912', '体育保障组织', 1, '891');
INSERT INTO `industry` VALUES (1694, '8919', '其他体育组织', 1, '891');
INSERT INTO `industry` VALUES (1695, '892', '体育场地设施管理', 1, '89');
INSERT INTO `industry` VALUES (1696, '8921', '体育场馆管理', 1, '892');
INSERT INTO `industry` VALUES (1697, '8929', '其他体育场地设施管理 ', 1, '892');
INSERT INTO `industry` VALUES (1698, '8930', '健身休闲活动', 1, '89');
INSERT INTO `industry` VALUES (1699, '899', '其他体育', 1, '89');
INSERT INTO `industry` VALUES (1700, '8991', '体育中介代理服务', 1, '899');
INSERT INTO `industry` VALUES (1701, '8992', '体育健康服务', 1, '899');
INSERT INTO `industry` VALUES (1702, '8999', '其他未列明体育', 1, '899');
INSERT INTO `industry` VALUES (1703, '90', '娱乐业', 1, 'R');
INSERT INTO `industry` VALUES (1704, '901', '室内娱乐活动', 1, '90');
INSERT INTO `industry` VALUES (1705, '9011', '歌舞厅娱乐活动', 1, '901');
INSERT INTO `industry` VALUES (1706, '9012', '电子游艺厅娱乐活动', 1, '901');
INSERT INTO `industry` VALUES (1707, '9013', '网吧活动', 1, '901');
INSERT INTO `industry` VALUES (1708, '9019', '其他室内娱乐活动', 1, '901');
INSERT INTO `industry` VALUES (1709, '9020', '游乐园', 1, '90');
INSERT INTO `industry` VALUES (1710, '9030', '休闲观光活动', 1, '90');
INSERT INTO `industry` VALUES (1711, '904', '彩票活动', 1, '90');
INSERT INTO `industry` VALUES (1712, '9041', '体育彩票服务', 1, '904');
INSERT INTO `industry` VALUES (1713, '9042', '福利彩票服务', 1, '904');
INSERT INTO `industry` VALUES (1714, '9049', '其他彩票服务', 1, '904');
INSERT INTO `industry` VALUES (1715, '905', '文化娱乐体育活动和经纪代理服务', 1, '90');
INSERT INTO `industry` VALUES (1716, '9051', '文化活动服务', 1, '905');
INSERT INTO `industry` VALUES (1717, '9052', '体育表演服务', 1, '905');
INSERT INTO `industry` VALUES (1718, '9053', '文化娱乐经纪人', 1, '905');
INSERT INTO `industry` VALUES (1719, '9054', '体育经纪人', 1, '905');
INSERT INTO `industry` VALUES (1720, '9059', '其他文化艺术经纪代理', 1, '905');
INSERT INTO `industry` VALUES (1721, '9090', '其他娱乐业', 1, '90');
INSERT INTO `industry` VALUES (1722, 'S', '公共管理、社会保障和社会组织', 1, NULL);
INSERT INTO `industry` VALUES (1723, '91', '中国共产党机关', 1, 'S');
INSERT INTO `industry` VALUES (1724, '9100', '中国共产党机关', 1, '91');
INSERT INTO `industry` VALUES (1725, '92', '国家机构', 1, 'S');
INSERT INTO `industry` VALUES (1726, '9210', '国家权力机构', 1, '92');
INSERT INTO `industry` VALUES (1727, '922', '国家行政机构', 1, '92');
INSERT INTO `industry` VALUES (1728, '9221', '综合事务管理机构', 1, '922');
INSERT INTO `industry` VALUES (1729, '9222', '对外事务管理机构', 1, '922');
INSERT INTO `industry` VALUES (1730, '9223', '公共安全管理机构', 1, '922');
INSERT INTO `industry` VALUES (1731, '9224', '社会事务管理机构', 1, '922');
INSERT INTO `industry` VALUES (1732, '9225', '经济事务管理机构', 1, '922');
INSERT INTO `industry` VALUES (1733, '9226', '行政监督检查机构', 1, '922');
INSERT INTO `industry` VALUES (1734, '923', '人民法院和人民检察院', 1, '92');
INSERT INTO `industry` VALUES (1735, '9231', '人民法院', 1, '923');
INSERT INTO `industry` VALUES (1736, '9232', '人民检察院', 1, '923');
INSERT INTO `industry` VALUES (1737, '929', '其他国家机构', 1, '92');
INSERT INTO `industry` VALUES (1738, '9291', '消防管理机构', 1, '929');
INSERT INTO `industry` VALUES (1739, '9299', '其他未列明国家机构', 1, '929');
INSERT INTO `industry` VALUES (1740, '93', '人民政协、民主党派', 1, 'S');
INSERT INTO `industry` VALUES (1741, '9310', '人民政协', 1, '93');
INSERT INTO `industry` VALUES (1742, '9320', '民主党派', 1, '93');
INSERT INTO `industry` VALUES (1743, '94', '社会保障', 1, 'S');
INSERT INTO `industry` VALUES (1744, '941', '基本保险', 1, '94');
INSERT INTO `industry` VALUES (1745, '9411', '基本养老保险', 1, '941');
INSERT INTO `industry` VALUES (1746, '9412', '基本医疗保险', 1, '941');
INSERT INTO `industry` VALUES (1747, '9413', '失业保险', 1, '941');
INSERT INTO `industry` VALUES (1748, '9414', '工伤保险', 1, '941');
INSERT INTO `industry` VALUES (1749, '9415', '生育保险', 1, '941');
INSERT INTO `industry` VALUES (1750, '9419', '其他基本保险', 1, '941');
INSERT INTO `industry` VALUES (1751, '9420', '补充保险', 1, '94');
INSERT INTO `industry` VALUES (1752, '9490', '其他社会保障', 1, '94');
INSERT INTO `industry` VALUES (1753, '95', '群众团体、社会团体和其他成员组织', 1, 'S');
INSERT INTO `industry` VALUES (1754, '951', '群众团体', 1, '95');
INSERT INTO `industry` VALUES (1755, '9511', '工会', 1, '951');
INSERT INTO `industry` VALUES (1756, '9512', '妇联', 1, '951');
INSERT INTO `industry` VALUES (1757, '9513', '共青团', 1, '951');
INSERT INTO `industry` VALUES (1758, '9519', '其他群众团体', 1, '951');
INSERT INTO `industry` VALUES (1759, '952', '社会团体', 1, '95');
INSERT INTO `industry` VALUES (1760, '9521', '专业性团体', 1, '952');
INSERT INTO `industry` VALUES (1761, '9522', '行业性团体', 1, '952');
INSERT INTO `industry` VALUES (1762, '9529', '其他社会团体', 1, '952');
INSERT INTO `industry` VALUES (1763, '9530', '基金会', 1, '95');
INSERT INTO `industry` VALUES (1764, '954', '宗教组织', 1, '95');
INSERT INTO `industry` VALUES (1765, '9541', '宗教团体服务', 1, '954');
INSERT INTO `industry` VALUES (1766, '9542', '宗教活动场所服务', 1, '954');
INSERT INTO `industry` VALUES (1767, '96', '基层群众自治组织及其他组织', 1, 'S');
INSERT INTO `industry` VALUES (1768, '9610', '社区居民自治组织', 1, '96');
INSERT INTO `industry` VALUES (1769, '9620', '村民自治组织', 1, '96');
INSERT INTO `industry` VALUES (1770, 'T', '国际组织', 1, NULL);
INSERT INTO `industry` VALUES (1771, '97', '国际组织', 1, 'T');
INSERT INTO `industry` VALUES (1772, '9700', '国际组织', 1, '97');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2020_07_10_184109_create_customer_table', 2);

-- ----------------------------
-- Table structure for order_payment_log
-- ----------------------------
DROP TABLE IF EXISTS `order_payment_log`;
CREATE TABLE `order_payment_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_renew_log_id` int(11) NOT NULL COMMENT '续费ID',
  `receivable` decimal(8, 2) NOT NULL COMMENT '应收金额',
  `old_receipts` decimal(8, 2) NULL DEFAULT NULL COMMENT '上次收款金额',
  `receipts` decimal(8, 2) NULL DEFAULT NULL COMMENT '本次收款金额',
  `arrears` decimal(8, 2) NULL DEFAULT NULL COMMENT '未收金额',
  `pay_type_id` int(11) NULL DEFAULT NULL COMMENT '支付方式ID',
  `pay_time` timestamp(0) NULL DEFAULT NULL COMMENT '支付时间',
  `admin_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '操作人',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缴费记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_payment_log
-- ----------------------------
INSERT INTO `order_payment_log` VALUES (1, 6, 4800.00, 0.00, 2000.00, 2800.00, 2, '2020-08-14 00:00:00', 1, '2020-08-14 15:31:11', '2020-08-14 15:31:11');
INSERT INTO `order_payment_log` VALUES (2, 2, 4800.00, 0.00, 4800.00, 0.00, 2, '2020-08-14 00:00:00', 1, '2020-08-14 15:34:28', '2020-08-14 15:34:28');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户名称',
  `customer_demand_id` int(11) NOT NULL COMMENT '客户需求ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `start_time` timestamp(0) NOT NULL COMMENT '开通时间',
  `end_time` timestamp(0) NOT NULL COMMENT '结束时间',
  `admin_user_id` int(11) NOT NULL COMMENT '所属销售',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '销售金额',
  `receivable` decimal(8, 2) NULL DEFAULT NULL COMMENT '应收金额',
  `receipts` decimal(8, 2) NULL DEFAULT NULL COMMENT '实收金额',
  `sales_remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '销售备注',
  `it_remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '技术备注',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `contract_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '合同地址',
  `last_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '最近跟进销售',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态 0：待开发 1：开发中 2:开发完成 3：已交付',
  `service_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '服务状态 0：服务未开始 1：服务中 2：服务到期',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '20200813220621741212E2FD9D3E', 1, '中光自用', 1, 2, '2020-08-13 22:04:08', '2020-08-13 22:04:08', 1, 323.00, NULL, NULL, '测试', NULL, 'C:\\Users\\10isp\\AppData\\Local\\Temp\\phpAF14.tmp', 'C:\\Users\\10isp\\AppData\\Local\\Temp\\phpAF54.tmp', 1, 0, 0, '2020-08-13 22:06:21', '2020-08-14 10:08:22', '2020-08-14 10:08:22');
INSERT INTO `orders` VALUES (2, '20200813220958677098976A0825', 1, '中光自用', 1, 3, '2020-08-13 22:08:51', '2020-08-13 22:08:51', 1, 323.00, NULL, NULL, '测试', NULL, 'C:\\Users\\10isp\\AppData\\Local\\Temp\\phpFE62.tmp', 'C:\\Users\\10isp\\AppData\\Local\\Temp\\phpFE83.tmp', 1, 0, 0, '2020-08-13 22:09:58', '2020-08-14 10:08:16', '2020-08-14 10:08:16');
INSERT INTO `orders` VALUES (3, '20200813221057395851251C9B7C', 1, '中光自用', 1, 3, '2020-08-13 22:08:51', '2020-08-13 22:08:51', 1, 323.00, 4800.00, NULL, '测试', NULL, 'C:\\Users\\10isp\\AppData\\Local\\Temp\\phpE317.tmp', 'C:\\Users\\10isp\\AppData\\Local\\Temp\\phpE328.tmp', 1, 0, 0, '2020-08-13 22:10:57', '2020-08-14 10:08:10', '2020-08-14 10:08:10');
INSERT INTO `orders` VALUES (4, '20200813221436061066911E2450', 1, '中光自用', 1, 2, '2020-08-13 22:14:11', '2020-08-19 00:00:00', 1, 323.00, 4800.00, 4800.00, NULL, NULL, '数学公式手册（最终版）1120.pdf', '形式逻辑公式总结(1)(1).pdf', 1, 1, 0, '2020-08-13 22:14:36', '2020-08-19 15:40:15', NULL);
INSERT INTO `orders` VALUES (5, '20200814102033673892C2A4C3EF', 1, '中光自用', 1, 2, '2020-08-14 10:20:05', '2020-08-14 10:20:05', 1, 323.00, 323.00, NULL, NULL, NULL, '数学公式手册（最终版）1120.pdf', '形式逻辑公式总结(1)(1).pdf', 1, 0, 0, '2020-08-14 10:20:33', '2020-08-14 12:47:22', '2020-08-14 12:47:22');
INSERT INTO `orders` VALUES (6, '2020081916483873383509F7953A', 2, '城市', 2, 2, '2020-08-19 16:47:47', '2020-08-19 16:47:47', 2, 323.00, 0.00, NULL, NULL, NULL, '形式逻辑公式总结(1)(1).pdf', '数学公式手册（最终版）1120.pdf', 1, 0, 0, '2020-08-19 16:48:38', '2020-08-19 16:48:38', NULL);
INSERT INTO `orders` VALUES (7, '20200822164014028037E6D1D1A2', 1, '中光自用', 5, 2, '2020-08-22 16:39:19', '2020-08-23 00:00:00', 4, 323.00, 343.00, NULL, '测试', NULL, '数学公式手册（最终版）1120.pdf', '形式逻辑公式总结(1)(1).pdf', 2, 0, 0, '2020-08-22 16:40:14', '2020-08-22 18:08:37', NULL);
INSERT INTO `orders` VALUES (8, '20200822165156637709B556C340', 1, '中光自用', 5, 3, '2020-08-22 16:51:20', '2020-08-22 16:51:20', 4, 323.00, 323.00, NULL, '测试', NULL, '形式逻辑公式总结(1)(1).pdf', '数学公式手册（最终版）1120.pdf', 2, 0, 0, '2020-08-22 16:51:56', '2020-08-22 18:08:37', NULL);

-- ----------------------------
-- Table structure for orders_detail
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `params_id` int(11) NOT NULL COMMENT '产品参数ID',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数值',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_detail
-- ----------------------------
INSERT INTO `orders_detail` VALUES (1, 4, 3, '推广版', '2020-08-14 11:26:17', '2020-08-14 11:26:17', '2020-08-14 11:26:34');
INSERT INTO `orders_detail` VALUES (2, 4, 4, 'www.erea.com', '2020-08-14 11:26:17', '2020-08-14 11:26:17', '2020-08-14 11:26:34');
INSERT INTO `orders_detail` VALUES (3, 4, 5, '否', '2020-08-14 11:26:17', '2020-08-14 11:26:17', '2020-08-14 11:26:34');
INSERT INTO `orders_detail` VALUES (4, 4, 3, '标准版', '2020-08-14 11:26:55', '2020-08-14 11:26:55', NULL);
INSERT INTO `orders_detail` VALUES (5, 4, 4, 'www.baidu.cn', '2020-08-14 11:26:55', '2020-08-14 12:43:47', NULL);
INSERT INTO `orders_detail` VALUES (6, 4, 5, '是', '2020-08-14 11:26:55', '2020-08-19 15:40:41', NULL);

-- ----------------------------
-- Table structure for orders_log
-- ----------------------------
DROP TABLE IF EXISTS `orders_log`;
CREATE TABLE `orders_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `params_id` int(11) NULL DEFAULT NULL COMMENT '产品参数ID',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数值',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态 0：待开发 1：开发中 2:开发完成 3：已交付 4：已关闭',
  `admin_user_id` int(11) NOT NULL COMMENT '操作人ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单修改日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_log
-- ----------------------------
INSERT INTO `orders_log` VALUES (1, 4, 4, 'www.baidu.com', 0, 1, '2020-08-14 12:42:54', '2020-08-14 12:42:54');
INSERT INTO `orders_log` VALUES (2, 4, 4, 'www.baidu.cn', 0, 1, '2020-08-14 12:43:47', '2020-08-14 12:43:47');
INSERT INTO `orders_log` VALUES (3, 4, 5, '是', 0, 2, '2020-08-19 15:40:41', '2020-08-19 15:40:41');

-- ----------------------------
-- Table structure for orders_renew_log
-- ----------------------------
DROP TABLE IF EXISTS `orders_renew_log`;
CREATE TABLE `orders_renew_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开通时间',
  `old_end_time` timestamp(0) NULL DEFAULT NULL COMMENT '上次到期时间',
  `end_time` timestamp(0) NOT NULL COMMENT '当前结束时间',
  `receivable` decimal(8, 2) NOT NULL COMMENT '应收金额',
  `receipts` decimal(8, 2) NULL DEFAULT NULL COMMENT '实收金额',
  `arrears` decimal(8, 2) NULL DEFAULT NULL COMMENT '未收金额',
  `is_renew` tinyint(4) NULL DEFAULT 0 COMMENT '是否续费 0：首次  1：续费',
  `is_tax` tinyint(4) NULL DEFAULT 0 COMMENT '是否含税  0：不含税  1：含税',
  `owner_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '提交人',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '服务续费记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_renew_log
-- ----------------------------
INSERT INTO `orders_renew_log` VALUES (1, 3, 3, '2020-08-13 22:08:51', '2020-08-13 22:08:51', '2020-08-13 22:08:51', 4800.00, NULL, 4800.00, 0, 0, 1, '2020-08-13 22:10:57', '2020-08-14 12:46:50', '2020-08-14 12:46:50');
INSERT INTO `orders_renew_log` VALUES (2, 4, 2, '2020-08-13 22:14:11', '2020-08-13 22:14:11', '2020-08-13 22:14:11', 4800.00, 4800.00, 0.00, 0, 0, 1, '2020-08-13 22:14:36', '2020-08-14 15:34:28', NULL);
INSERT INTO `orders_renew_log` VALUES (3, 5, 2, '2020-08-14 10:20:05', '2020-08-14 10:20:05', '2020-08-14 10:20:05', 323.00, NULL, 323.00, 0, 0, 1, '2020-08-14 10:20:33', '2020-08-14 12:48:25', '2020-08-14 12:48:25');
INSERT INTO `orders_renew_log` VALUES (4, 4, 2, '2020-08-13 22:14:11', '2020-08-13 22:14:11', '2020-08-14 00:00:00', 4800.00, NULL, NULL, 1, 0, 1, '2020-08-14 14:32:55', '2020-08-14 14:32:55', NULL);
INSERT INTO `orders_renew_log` VALUES (5, 4, 2, '2020-08-13 22:14:11', '2020-08-13 22:14:11', '2020-08-14 00:00:00', 4800.00, NULL, NULL, 1, 0, 1, '2020-08-14 14:33:15', '2020-08-14 14:33:15', NULL);
INSERT INTO `orders_renew_log` VALUES (6, 4, 2, '2020-08-13 22:14:11', '2020-08-13 22:14:11', '2020-08-14 00:00:00', 4800.00, 2000.00, 2800.00, 1, 0, 1, '2020-08-14 14:33:34', '2020-08-14 15:31:11', NULL);
INSERT INTO `orders_renew_log` VALUES (7, 4, 2, '2020-08-13 22:14:11', '2020-08-13 22:14:11', '2020-08-14 00:00:00', 4800.00, NULL, NULL, 1, 0, 1, '2020-08-14 14:34:52', '2020-08-14 14:34:52', NULL);
INSERT INTO `orders_renew_log` VALUES (8, 4, 2, '2020-08-13 22:14:11', '2020-08-14 00:00:00', '2020-08-16 00:00:00', 4800.00, NULL, NULL, 1, 0, 1, '2020-08-14 14:35:10', '2020-08-14 14:35:10', NULL);
INSERT INTO `orders_renew_log` VALUES (9, 4, 2, '2020-08-13 22:14:11', '2020-08-16 00:00:00', '2020-08-19 00:00:00', 4800.00, 2000.00, NULL, 1, 0, 2, '2020-08-19 15:40:15', '2020-08-19 15:40:15', NULL);
INSERT INTO `orders_renew_log` VALUES (10, 6, 2, '2020-08-19 16:47:47', '2020-08-19 16:47:47', '2020-08-19 16:47:47', 0.00, NULL, 0.00, 0, 0, 2, '2020-08-19 16:48:38', '2020-08-19 16:48:38', NULL);
INSERT INTO `orders_renew_log` VALUES (11, 7, 2, '2020-08-22 16:39:19', '2020-08-22 16:39:19', '2020-08-22 16:39:19', 343.00, NULL, 343.00, 0, 0, 4, '2020-08-22 16:40:14', '2020-08-22 16:40:14', NULL);
INSERT INTO `orders_renew_log` VALUES (12, 8, 3, '2020-08-22 16:51:20', '2020-08-22 16:51:20', '2020-08-22 16:51:20', 323.00, NULL, 323.00, 0, 0, 4, '2020-08-22 16:51:56', '2020-08-22 16:51:56', NULL);
INSERT INTO `orders_renew_log` VALUES (13, 7, 2, '2020-08-22 16:39:19', '2020-08-22 16:39:19', '2020-08-23 00:00:00', 343.00, NULL, NULL, 1, 0, 4, '2020-08-22 17:30:19', '2020-08-22 17:30:19', NULL);

-- ----------------------------
-- Table structure for orders_status
-- ----------------------------
DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_status` tinyint(4) NULL DEFAULT 0 COMMENT '客户状态 0：待处理  1:确认需求无误',
  `customer_contact_id` int(11) NULL DEFAULT 0 COMMENT '客户联系人ID',
  `finance_status` tinyint(4) NULL DEFAULT 0 COMMENT '财务认证 0：待处理  1:未收到款  2: 收到部分款  3：收到全款',
  `finance_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '财务备注',
  `finance_user_id` int(11) NULL DEFAULT NULL COMMENT '财务审批人',
  `commerce_status` tinyint(4) NULL DEFAULT 0 COMMENT '商务部认证 0：待处理  1：资料不完整 2：开发中 3：申请技术协助 4:开发完成',
  `commerce_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商务部备注',
  `commerce_user_id` int(11) NULL DEFAULT NULL COMMENT '商务部操作人ID',
  `it_status` tinyint(4) NULL DEFAULT 0 COMMENT '技术认证 0：待处理 1：处理中 2：处理完成',
  `it_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '技术备注',
  `it_user_id` int(11) NULL DEFAULT NULL COMMENT '技术操作人ID',
  `check_status` tinyint(4) NULL DEFAULT 0 COMMENT '验收认证 0：待处理 1：不合格 2：验收通过',
  `check_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '验收人备注',
  `check_user_id` int(11) NULL DEFAULT NULL COMMENT '验收操作人ID',
  `customer_check_status` tinyint(4) NULL DEFAULT 0 COMMENT '客户验收状态 0：待处理 1：修改问题 2：确认交付',
  `customer_check_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户验收人备注',
  `customer_check_contact_id` int(11) NULL DEFAULT NULL COMMENT '客户验收人ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_status
-- ----------------------------
INSERT INTO `orders_status` VALUES (1, 1, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '2020-08-13 22:06:21', '2020-08-13 22:06:21', NULL);
INSERT INTO `orders_status` VALUES (2, 2, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '2020-08-13 22:09:58', '2020-08-13 22:09:58', NULL);
INSERT INTO `orders_status` VALUES (3, 3, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '2020-08-13 22:10:57', '2020-08-13 22:10:57', NULL);
INSERT INTO `orders_status` VALUES (4, 4, 0, 0, 2, NULL, 1, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '2020-08-13 22:14:36', '2020-08-14 13:37:05', NULL);
INSERT INTO `orders_status` VALUES (5, 5, 0, 0, 0, NULL, 1, 0, NULL, 1, 0, NULL, 1, 2, NULL, 1, 0, NULL, NULL, '2020-08-14 10:20:33', '2020-08-14 11:44:16', NULL);
INSERT INTO `orders_status` VALUES (6, 6, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '2020-08-19 16:48:38', '2020-08-19 16:48:38', NULL);
INSERT INTO `orders_status` VALUES (7, 7, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '2020-08-22 16:40:14', '2020-08-22 16:40:14', NULL);
INSERT INTO `orders_status` VALUES (8, 8, 0, 0, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, '2020-08-22 16:51:56', '2020-08-22 16:51:56', NULL);

-- ----------------------------
-- Table structure for orders_status_log
-- ----------------------------
DROP TABLE IF EXISTS `orders_status_log`;
CREATE TABLE `orders_status_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `finance_status` tinyint(4) NULL DEFAULT NULL COMMENT '财务认证 0：待处理  1:未收到款  2: 已收到款',
  `finance_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '财务备注',
  `finance_user_id` int(11) NULL DEFAULT NULL COMMENT '财务审批人',
  `commerce_status` tinyint(4) NULL DEFAULT NULL COMMENT '商务部认证 0：待处理  1：资料不完整 2：开发中 3：申请技术协助 4:开发完成',
  `commerce_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商务部备注',
  `commerce_user_id` int(11) NULL DEFAULT NULL COMMENT '商务部操作人ID',
  `it_status` tinyint(4) NULL DEFAULT NULL COMMENT '技术认证 0：待处理 1：处理中 2：处理完成',
  `it_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '技术备注',
  `it_user_id` int(11) NULL DEFAULT NULL COMMENT '技术操作人ID',
  `check_status` tinyint(4) NULL DEFAULT NULL COMMENT '验收认证 0：待处理 1：不合格 2：验收通过',
  `check_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '验收人备注',
  `check_user_id` int(11) NULL DEFAULT NULL COMMENT '验收操作人ID',
  `customer_check_status` tinyint(4) NULL DEFAULT 0 COMMENT '客户验收状态 0：待处理 1：修改问题 2：确认交付',
  `customer_check_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户验收人备注',
  `customer_check_contact_id` int(11) NULL DEFAULT NULL COMMENT '客户验收人ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单状态日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_status_log
-- ----------------------------
INSERT INTO `orders_status_log` VALUES (1, 5, 0, NULL, 1, 0, NULL, 1, 0, NULL, 1, 2, NULL, 1, 0, NULL, NULL, '2020-08-14 11:44:16', '2020-08-14 11:44:16');
INSERT INTO `orders_status_log` VALUES (2, 4, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2020-08-14 13:37:05', '2020-08-14 13:37:05');

-- ----------------------------
-- Table structure for params
-- ----------------------------
DROP TABLE IF EXISTS `params`;
CREATE TABLE `params`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数标题',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数别名（英文字母）',
  `type` tinyint(4) NOT NULL COMMENT '参数类型 0：text 1：textarea 2：select',
  `type_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '当type = 2 时，填写select的内容，以英文逗号分隔',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `is_required` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否必填 0：否 1：是',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of params
-- ----------------------------
INSERT INTO `params` VALUES (1, '服务器IP', 'website_ip', 0, NULL, 1, 1, '例如：192.168.1.1', '2020-07-20 11:39:31', '2020-07-20 11:39:31', NULL);
INSERT INTO `params` VALUES (2, 'CPU', 'CPU', 0, NULL, 1, 1, '必填*   ： 例如：4核', '2020-07-20 16:17:52', '2020-07-20 16:17:52', NULL);
INSERT INTO `params` VALUES (3, '服务类别', 'serveice_type', 2, '标准版,加强版,推广版,定制版', 1, 1, '选择服务类别', '2020-07-20 19:57:47', '2020-07-20 19:57:47', NULL);
INSERT INTO `params` VALUES (4, '网站域名', 'domain', 0, NULL, 1, 1, NULL, '2020-07-20 19:58:23', '2020-07-20 19:58:23', NULL);
INSERT INTO `params` VALUES (5, '是否协助注册公众号', 'is_sing_up', 2, '是,否', 1, 1, NULL, '2020-07-20 19:59:17', '2020-07-20 19:59:17', NULL);

-- ----------------------------
-- Table structure for pay_type
-- ----------------------------
DROP TABLE IF EXISTS `pay_type`;
CREATE TABLE `pay_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付方式',
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付账号',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '付款方式管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_type
-- ----------------------------
INSERT INTO `pay_type` VALUES (1, '支付宝', '123432534564888', '2020-08-14 13:25:40', '2020-08-14 13:25:48');
INSERT INTO `pay_type` VALUES (2, '微信', '2343253453245243', '2020-08-14 13:25:59', '2020-08-14 13:25:59');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产品名称',
  `PID` int(11) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '产品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'ITO运维服务', 0, 1, '2020-07-20 14:08:51', '2020-07-20 14:08:51', NULL);
INSERT INTO `product` VALUES (2, '网站技术外包', 1, 1, '2020-07-20 14:09:15', '2020-07-20 14:09:15', NULL);
INSERT INTO `product` VALUES (3, '网站优化', 1, 2, '2020-07-20 14:09:29', '2020-07-20 14:09:29', NULL);

-- ----------------------------
-- Table structure for product_params
-- ----------------------------
DROP TABLE IF EXISTS `product_params`;
CREATE TABLE `product_params`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `params_id` int(11) NOT NULL COMMENT '产品参数ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '产品参数管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_params
-- ----------------------------
INSERT INTO `product_params` VALUES (8, 2, 3, '2020-07-20 20:02:07', '2020-07-20 20:02:07');
INSERT INTO `product_params` VALUES (9, 2, 4, '2020-07-20 20:02:07', '2020-07-20 20:02:07');
INSERT INTO `product_params` VALUES (13, 2, 5, '2020-08-12 19:51:02', '2020-08-12 19:51:02');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
