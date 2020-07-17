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

 Date: 17/07/2020 21:42:09
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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, '后台管理', 'fa-tasks', '', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (3, 2, 6, '员工管理', 'fa-user', 'auth/users', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 7, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 8, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 3, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 4, '操作记录', 'fa-history', 'auth/logs', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-06-29 06:05:50', '2020-06-29 06:05:50');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'Administrator', 'admin', '$2y$10$.RsLC15UW1eP1WaUQxLDUu9XUxTfRa7QnfYOI2HsY6Q/NCEEIQIU6', 0, '15700064975', NULL, 'images/v2-877b9c8a401afed00d37a2ba5e3009d5_r.jpg', '1995年11月05日', 0, NULL, '2020年07月16日', NULL, NULL, 'sIPPBMXnHJAq33vpTAGW4ESAtH9O94Nh4SgG2EYflNauQStPA8NYJKJuWc4B', '2020-06-29 06:05:50', '2020-07-16 18:31:10', NULL);

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '渠道管理' ROW_FORMAT = Dynamic;

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
  `last_user_id` int(11) NOT NULL DEFAULT 1 COMMENT '最近跟进销售',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer_contact
-- ----------------------------
DROP TABLE IF EXISTS `customer_contact`;
CREATE TABLE `customer_contact`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_demand_id` int(11) NOT NULL COMMENT '客户需求ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人名称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系电话',
  `is_first` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否是第一联系人 0：否 1：是',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '微信openId',
  `headImgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户联系人表' ROW_FORMAT = Dynamic;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '联系人名片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for customer_demand
-- ----------------------------
DROP TABLE IF EXISTS `customer_demand`;
CREATE TABLE `customer_demand`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `demand` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户需求',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户需求表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_07_10_184109_create_customer_table', 2);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_title` int(11) NOT NULL COMMENT '客户名称',
  `customer_demand_id` int(11) NOT NULL COMMENT '客户需求ID',
  `start_time` timestamp(0) NOT NULL COMMENT '开通时间',
  `end_time` timestamp(0) NOT NULL COMMENT '结束时间',
  `admin_user_id` int(11) NOT NULL COMMENT '所属销售',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '销售金额',
  `receivable` decimal(8, 2) NULL DEFAULT NULL COMMENT '应收金额',
  `receipts` decimal(8, 2) NULL DEFAULT NULL COMMENT '实收金额',
  `sales_remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '销售备注',
  `it_remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '技术备注',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '附件地址',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态 0：待开发 1：开发中 2:开发完成 3：已交付 4：已关闭',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders_detail
-- ----------------------------
DROP TABLE IF EXISTS `orders_detail`;
CREATE TABLE `orders_detail`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `product_params_id` int(11) NOT NULL COMMENT '产品参数ID',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '参数值',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders_log
-- ----------------------------
DROP TABLE IF EXISTS `orders_log`;
CREATE TABLE `orders_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `product_params_id` int(11) NULL DEFAULT NULL COMMENT '产品参数ID',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '参数值',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态 0：待开发 1：开发中 2:开发完成 3：已交付 4：已关闭',
  `admin_user_id` int(11) NOT NULL COMMENT '操作人ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单修改日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders_status
-- ----------------------------
DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE `orders_status`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `orders_id` int(11) NOT NULL COMMENT '客户ID',
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
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单状态日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数管理' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '产品管理' ROW_FORMAT = Dynamic;

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
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '产品参数管理' ROW_FORMAT = Dynamic;

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
