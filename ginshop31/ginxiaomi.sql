/*
 Navicat MySQL Data Transfer

 Source Server         : 192.168.0.6
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 192.168.0.6:3306
 Source Schema         : ginxiaomi

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 23/09/2021 10:02:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access
-- ----------------------------
DROP TABLE IF EXISTS `access`;
CREATE TABLE `access`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `type` tinyint(1) NULL DEFAULT NULL,
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_id` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access
-- ----------------------------
INSERT INTO `access` VALUES (52, '管理员管理', 1, '', '', 0, 105, '管理员管理', 0, 1);
INSERT INTO `access` VALUES (53, '角色管理', 1, '', '', 0, 100, '角色管理', 0, 1);
INSERT INTO `access` VALUES (54, '管理员管理', 2, '管理员列表', 'manager', 52, 100, '管理员列表', 0, 1);
INSERT INTO `access` VALUES (55, '管理员管理', 2, '增加管理员', 'manager/add', 52, 101, '管理员列表', 0, 1);
INSERT INTO `access` VALUES (56, '管理员管理', 3, '编辑管理员', 'manager/edit', 52, 100, '编辑管理员', 0, 1);
INSERT INTO `access` VALUES (57, '管理员管理', 3, '删除管理员', 'manager/delete', 52, 100, '删除管理员', 0, 1);
INSERT INTO `access` VALUES (59, '角色管理', 2, '角色列表', 'role', 53, 100, '角色列表', 0, 1);
INSERT INTO `access` VALUES (60, '角色管理', 2, '增加角色', 'role/add', 53, 102, '增加角色', 0, 1);
INSERT INTO `access` VALUES (61, '角色管理', 3, '编辑角色', 'role/edit', 53, 100, '编辑角色', 0, 1);
INSERT INTO `access` VALUES (62, '角色管理', 3, '删除角色', 'role/delete', 53, 100, '删除角色', 0, 1);
INSERT INTO `access` VALUES (63, '权限管理', 1, '', '', 0, 100, '权限管理', 0, 1);
INSERT INTO `access` VALUES (64, '权限管理', 2, '权限列表', 'access', 63, 100, '', 0, 1);
INSERT INTO `access` VALUES (67, '权限管理', 2, '增加权限', 'access/add', 63, 100, '', 0, 1);
INSERT INTO `access` VALUES (68, '轮播图管理', 1, '', '', 0, 100, '', 0, 1);
INSERT INTO `access` VALUES (69, '轮播图管理', 2, '轮播图列表', 'focus', 68, 101, '1111', 0, 1);
INSERT INTO `access` VALUES (70, '轮播图管理', 2, '增加轮播图', 'focus/add', 68, 100, '增加轮播图', 0, 1);
INSERT INTO `access` VALUES (71, '轮播图管理', 3, '编辑轮播图', 'focus/edit', 68, 100, '', 0, 1);
INSERT INTO `access` VALUES (75, '轮播图管理', 3, '删除轮播图', 'focus/delete', 68, 100, '', 0, 1);
INSERT INTO `access` VALUES (76, '管理员管理', 3, '执行增加管理员', 'manager/doAdd', 52, 100, '执行增加', 0, 1);
INSERT INTO `access` VALUES (77, '管理员管理', 3, '执行修改管理员', 'manager/doEdit', 52, 100, '执行修改', 0, 1);
INSERT INTO `access` VALUES (78, '角色管理', 3, '执行增加角色', 'role/doAdd', 53, 100, '执行增加', 0, 1);
INSERT INTO `access` VALUES (79, '角色管理', 3, '执行修改角色', 'role/doEdit', 53, 100, '执行修改', 0, 1);
INSERT INTO `access` VALUES (80, '角色管理', 3, '角色授权', 'role/auth', 53, 100, '', 0, 1);
INSERT INTO `access` VALUES (81, '角色管理', 3, '执行角色授权', 'role/doAuth', 53, 100, '执行授权', 0, 1);
INSERT INTO `access` VALUES (82, '权限管理', 3, '修改权限', 'access/edit', 63, 100, '执行修改', 0, 1);
INSERT INTO `access` VALUES (83, '权限管理', 3, '删除权限', 'access/delete', 63, 100, '', 0, 1);
INSERT INTO `access` VALUES (84, '权限管理', 3, '执行增加权限', 'access/doAdd', 63, 100, '', 0, 1);
INSERT INTO `access` VALUES (85, '权限管理', 3, '执行修改权限', 'access/doEdit', 63, 100, '执行修改\r\n', 0, 1);
INSERT INTO `access` VALUES (86, '轮播图管理', 3, '执行增加', 'focus/doAdd', 68, 100, '', 0, 1);
INSERT INTO `access` VALUES (87, '商品管理', 1, '', '', 0, 100, '', 0, 1);
INSERT INTO `access` VALUES (88, '商品管理', 2, '商品分类列表', 'goodsCate', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (89, '商品管理', 3, '增加商品分类', 'goodsCate/add', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (90, '商品管理', 3, '执行增加商品分类', 'goodsCate/doAdd', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (91, '商品管理', 3, '修改商品分类', 'goodsCate/edit', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (92, '商品管理', 3, '执行修改商品分类', 'goodsCate/doEdit', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (93, '商品管理', 3, '删除商品分类', 'goodsCate/delete', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (94, '商品管理', 2, '商品类型列表', 'goodsType', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (95, '商品管理', 3, '增加商品类型', 'goodsType/add', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (96, '商品管理', 3, '编辑商品类型', 'goodsType/edit', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (97, '商品管理', 3, '执行增加 商品类型', 'goodsType/doAdd', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (98, '商品管理', 3, '执行修改 商品类型', 'goodsType/doEdit', 87, 100, '', 0, 1);
INSERT INTO `access` VALUES (99, '商品管理', 3, '删除 商品类型', 'goodsType/delete', 87, 100, '', 0, 1);

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `focus_type` tinyint(1) NULL DEFAULT NULL,
  `focus_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `add_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES (14, '小米手机', 1, 'static/upload/20210915/1631677671.jpg', 'http://www.itying.com', 1115, 0, 1631677671);
INSERT INTO `focus` VALUES (16, '小米电视1111', 2, 'static/upload/20210915/1631694117.jpg', 'http://a.itying.com', 1222, 1, 1631679244);

-- ----------------------------
-- Table structure for goods_cate
-- ----------------------------
DROP TABLE IF EXISTS `goods_cate`;
CREATE TABLE `goods_cate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cate_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(0) NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_cate
-- ----------------------------
INSERT INTO `goods_cate` VALUES (23, '手机', '', '', '', 0, '', '', '手机', 1, '101', 1631938178);
INSERT INTO `goods_cate` VALUES (24, '电视', '', '', '', 0, '', '', '手机', 1, '10', 1631938196);
INSERT INTO `goods_cate` VALUES (25, '笔记本 平板', '', '', '', 0, '', '', '手机', 1, '10', 1631938209);
INSERT INTO `goods_cate` VALUES (26, '家电', '', '', '', 0, '', '', '手机', 1, '10', 1631938214);
INSERT INTO `goods_cate` VALUES (27, '小米11', 'static/upload/20210918/1631938291.png', 'www.itying.com', 'aaa.html', 23, '小米11立即购买', '小米11', '小米手机官网正品小米11推荐，小米手机小米11最新价格，有多种颜色可选，另有小米11详细介绍及图片，还有', 1, '10', 1631938291);
INSERT INTO `goods_cate` VALUES (28, 'Redmi 11A', 'static/upload/20210918/1631938338.png', 'http://www.itying.com', 'bbbb.html', 23, '游戏必备', '防疫', '游戏必备', 1, '10', 1631938339);
INSERT INTO `goods_cate` VALUES (29, '小米电视55寸', 'static/upload/20210918/1631938567.jpg', '', '', 24, '', '', '', 1, '10', 1631938567);
INSERT INTO `goods_cate` VALUES (30, '冰箱', 'static/upload/20210918/1631940993.jpg', 'http://www.itying.com', '', 26, '', '', '', 1, '10', 1631938591);

-- ----------------------------
-- Table structure for goods_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `add_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type
-- ----------------------------
INSERT INTO `goods_type` VALUES (4, '手机', '手机22', 1, 1632299505);
INSERT INTO `goods_type` VALUES (5, '电视', '电视', 0, 1632299512);
INSERT INTO `goods_type` VALUES (6, '笔记本', '笔记本', 1, 1632299526);
INSERT INTO `goods_type` VALUES (7, '路由器', '路由器', 0, 1632299535);
INSERT INTO `goods_type` VALUES (9, '衣服', '衣服', 1, 1632361292);

-- ----------------------------
-- Table structure for goods_type_attribute
-- ----------------------------
DROP TABLE IF EXISTS `goods_type_attribute`;
CREATE TABLE `goods_type_attribute`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `cate_id` int(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attr_value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `add_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_type_attribute
-- ----------------------------
INSERT INTO `goods_type_attribute` VALUES (7, 5, '尺寸1', '1', '', 1, 10, 1632303531);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `role_id` int(0) NULL DEFAULT NULL,
  `add_time` int(0) NULL DEFAULT NULL,
  `is_super` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '152016111', '5188611114@qq.com', 1, 9, 0, 1);
INSERT INTO `manager` VALUES (2, 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '1520111122', '342338691122@qq.com', 1, 14, 1581661532, 0);
INSERT INTO `manager` VALUES (6, 'lisi', 'e10adc3949ba59abbe56e057f20f883e', '1520171111', '11114292@qq.com', 1, 16, 1631156378, 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `add_time` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (9, '超级管理员', '我是一个超级管理员', 1, 1631072961);
INSERT INTO `role` VALUES (14, '软件部门', '软件部门', 1, 1631075350);
INSERT INTO `role` VALUES (16, '销售部门', '销售部门', 1, 1631589828);

-- ----------------------------
-- Table structure for role_access
-- ----------------------------
DROP TABLE IF EXISTS `role_access`;
CREATE TABLE `role_access`  (
  `role_id` int(0) NOT NULL,
  `access_id` int(0) NOT NULL,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `access_id`(`access_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_access
-- ----------------------------
INSERT INTO `role_access` VALUES (14, 52);
INSERT INTO `role_access` VALUES (14, 54);
INSERT INTO `role_access` VALUES (14, 55);
INSERT INTO `role_access` VALUES (14, 56);
INSERT INTO `role_access` VALUES (14, 57);
INSERT INTO `role_access` VALUES (14, 76);
INSERT INTO `role_access` VALUES (14, 53);
INSERT INTO `role_access` VALUES (14, 59);
INSERT INTO `role_access` VALUES (14, 60);
INSERT INTO `role_access` VALUES (14, 61);
INSERT INTO `role_access` VALUES (14, 62);
INSERT INTO `role_access` VALUES (14, 78);
INSERT INTO `role_access` VALUES (14, 79);
INSERT INTO `role_access` VALUES (14, 80);
INSERT INTO `role_access` VALUES (14, 81);
INSERT INTO `role_access` VALUES (9, 52);
INSERT INTO `role_access` VALUES (9, 54);
INSERT INTO `role_access` VALUES (9, 55);
INSERT INTO `role_access` VALUES (9, 53);
INSERT INTO `role_access` VALUES (9, 59);
INSERT INTO `role_access` VALUES (9, 60);
INSERT INTO `role_access` VALUES (9, 61);
INSERT INTO `role_access` VALUES (9, 62);
INSERT INTO `role_access` VALUES (9, 63);
INSERT INTO `role_access` VALUES (9, 64);
INSERT INTO `role_access` VALUES (9, 67);
INSERT INTO `role_access` VALUES (9, 82);
INSERT INTO `role_access` VALUES (9, 83);
INSERT INTO `role_access` VALUES (9, 84);
INSERT INTO `role_access` VALUES (9, 85);
INSERT INTO `role_access` VALUES (9, 70);
INSERT INTO `role_access` VALUES (9, 71);
INSERT INTO `role_access` VALUES (16, 53);
INSERT INTO `role_access` VALUES (16, 59);
INSERT INTO `role_access` VALUES (16, 60);
INSERT INTO `role_access` VALUES (16, 61);
INSERT INTO `role_access` VALUES (16, 62);
INSERT INTO `role_access` VALUES (16, 78);
INSERT INTO `role_access` VALUES (16, 79);
INSERT INTO `role_access` VALUES (16, 80);
INSERT INTO `role_access` VALUES (16, 81);
INSERT INTO `role_access` VALUES (16, 63);
INSERT INTO `role_access` VALUES (16, 64);
INSERT INTO `role_access` VALUES (16, 67);
INSERT INTO `role_access` VALUES (16, 82);
INSERT INTO `role_access` VALUES (16, 83);
INSERT INTO `role_access` VALUES (16, 84);
INSERT INTO `role_access` VALUES (16, 85);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
