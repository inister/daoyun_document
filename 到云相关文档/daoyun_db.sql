/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : daoyun_db

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 04/07/2020 10:04:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `teacher_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  `school` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requirement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `FK_Reference_9`(`creator`) USING BTREE,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`  (
  `dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_english_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dic_chinese_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dic_style` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dic_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`dic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_data`;
CREATE TABLE `dictionary_data`  (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_id` int(11) NULL DEFAULT NULL,
  `value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dic_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_modify` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`data_id`) USING BTREE,
  INDEX `FK_Reference_14`(`dic_id`) USING BTREE,
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`dic_id`) REFERENCES `dictionary` (`dic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `school` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `college` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for on_course
-- ----------------------------
DROP TABLE IF EXISTS `on_course`;
CREATE TABLE `on_course`  (
  `on_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `on_course_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_userName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`on_course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `perm_id` int(11) NOT NULL,
  `par_id` int(11) NULL DEFAULT NULL,
  `menu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_page` tinyint(4) NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`perm_id`) USING BTREE,
  INDEX `FK_Reference_1`(`par_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`par_id`) REFERENCES `permission` (`perm_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `view_people_list` int(1) NULL DEFAULT NULL,
  `view_people_detail` int(1) NULL DEFAULT NULL,
  `add_employee` int(1) NULL DEFAULT NULL,
  `add_teacher` int(1) NULL DEFAULT NULL,
  `delete_user` int(1) NULL DEFAULT NULL,
  `reset_password` int(1) NULL DEFAULT NULL,
  `add_course` int(1) NULL DEFAULT NULL,
  `edit_course` int(1) NULL DEFAULT NULL,
  `delete_course` int(1) NULL DEFAULT NULL,
  `reload_system` int(1) NULL DEFAULT NULL,
  `close_system` int(1) NULL DEFAULT NULL,
  `data_dictionary` int(1) NULL DEFAULT NULL,
  `view_course_list` int(1) NULL DEFAULT NULL,
  `view_course_detail` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `FK_Reference_2`(`creator`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `role_id` int(11) NULL DEFAULT NULL,
  `perm_id` int(11) NULL DEFAULT NULL,
  INDEX `FK_Reference_5`(`perm_id`) USING BTREE,
  INDEX `FK_Reference_6`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`perm_id`) REFERENCES `permission` (`perm_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sign_information
-- ----------------------------
DROP TABLE IF EXISTS `sign_information`;
CREATE TABLE `sign_information`  (
  `sign_id` int(11) NOT NULL,
  `sign_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sign_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`sign_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'\'' COMMENT '用户名',
  `password_md5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'\'' COMMENT '密码',
  `user_token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'\'' COMMENT 'token值',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已删除 0未删除 1已删除',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '$2a$10$iCKWy/vyXDRg8OdU9PxMbeYMk6UQxf0W2FAl14ByDaSfDUTotcZFK',
  `sex` int(1) NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `emile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` int(11) NULL DEFAULT NULL,
  `school` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userclass
-- ----------------------------
DROP TABLE IF EXISTS `userclass`;
CREATE TABLE `userclass`  (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  INDEX `FK_Reference_7`(`user_id`) USING BTREE,
  INDEX `FK_Reference_8`(`class_id`) USING BTREE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
