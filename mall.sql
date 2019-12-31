/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 31/12/2019 16:18:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `stock` int(255) NULL DEFAULT NULL,
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (3, 'Air Jordan3', 399.00, 16, '鞋服', '一个Air Jordan', '/pics/8840d849-bf12-4e3f-880a-80ccd9390932.jpg', 1);
INSERT INTO `goods` VALUES (4, 'Air Jordan2', 399.00, 30, '鞋服', '一个Air Jordan', '/pics/df736a84-7535-4336-9a83-d0a3adca0a69.jpg', 1);
INSERT INTO `goods` VALUES (5, '薯片', 12.00, 30, '食品', '一包薯片', '/pics/0f3d47fb-f8cc-4a47-b2e8-bdeddfa491ad.jpg', 1);
INSERT INTO `goods` VALUES (6, '方便面', 20.00, 28, '食品', '一桶方便面', '/pics/1d67c88f-809b-431c-b514-116b82bbf3af.jpg', 1);
INSERT INTO `goods` VALUES (10, '鼠标', 30.00, 30, '数码', '一个鼠标', '/pics/7d186e48-c473-4b95-9691-ecbeff2afd66.jpg', 1);
INSERT INTO `goods` VALUES (11, '烤肠', 20.00, 30, '食品', '一根烤肠', '/pics/a9c8e49a-f1b8-4099-8b1c-a942a100cadf.jpg', 1);
INSERT INTO `goods` VALUES (12, 'Air Jordan1', 399.00, 30, '鞋服', '一个Air Jordan', '/pics/9e1c41a7-6c1c-408e-8e9b-f52e91f146ea.jpg', 1);
INSERT INTO `goods` VALUES (13, '键盘', 30.00, 30, '数码', '一个键盘', '/pics/be3bc0e4-536b-4fb0-b226-2a0cc80f5459.jpg', 1);
INSERT INTO `goods` VALUES (14, '一个耳机', 399.00, 30, '数码', '一个耳机', '/pics/97679192-fe93-4118-8b08-79c1d4856d65.jpg', 1);
INSERT INTO `goods` VALUES (15, '牙膏', 10.00, 30, '日用', '一支牙膏', '/pics/11ea6c56-de41-4c1d-bf82-cee95788e7e4.jpg', 1);
INSERT INTO `goods` VALUES (16, '洗发水', 30.00, 30, '日用', '一桶洗发水', '/pics/a27c5b38-db01-4a78-bceb-7f50a0919c31.jpg', 1);
INSERT INTO `goods` VALUES (17, '香皂', 10.00, 30, '日用', '一块香皂', '/pics/b0ea160e-ae62-45e4-9910-a228f78edabc.jpg', 1);
INSERT INTO `goods` VALUES (18, '祖国', 29.00, 50, '日用', '我和我的祖国一颗也不能分割', '/pics/1d4c16ff-0d02-4a94-9c57-e1713567d571.jpg', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `gid` int(11) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  `status` int(255) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (2, 1, 3, 10, 1, '2019-12-26 10:37:44', '2019-12-31 10:21:11');
INSERT INTO `orders` VALUES (3, 1, 3, 2, 2, '2019-12-26 10:45:34', '2019-12-29 14:30:47');
INSERT INTO `orders` VALUES (4, 1, 3, 2, 1, '2019-12-26 10:49:24', '2019-12-29 14:30:37');
INSERT INTO `orders` VALUES (5, 1, 3, 1, 0, '2019-12-26 10:51:30', '2019-12-26 10:51:30');
INSERT INTO `orders` VALUES (6, 1, 3, 1, 0, '2019-12-26 10:53:18', '2019-12-26 10:53:18');
INSERT INTO `orders` VALUES (7, 1, 6, 2, 0, '2019-12-26 18:19:04', '2019-12-26 18:19:04');
INSERT INTO `orders` VALUES (8, 1, 4, 3, 0, '2019-12-26 18:42:02', '2019-12-26 18:42:02');
INSERT INTO `orders` VALUES (9, 4, 5, 2, 0, '2019-12-29 14:34:05', '2019-12-29 14:34:05');
INSERT INTO `orders` VALUES (10, 8, 6, 1, 1, '2019-12-30 13:03:27', '2019-12-30 13:04:22');
INSERT INTO `orders` VALUES (11, 8, 3, 1, 0, '2019-12-30 13:46:16', '2019-12-30 13:46:16');
INSERT INTO `orders` VALUES (12, 9, 6, 1, 0, '2019-12-30 14:31:59', '2019-12-30 14:31:59');
INSERT INTO `orders` VALUES (13, 8, 3, 1, 0, '2019-12-30 19:20:03', '2019-12-30 19:20:03');
INSERT INTO `orders` VALUES (14, 12, 3, 12, 2, '2019-12-31 10:18:30', '2019-12-31 10:22:17');

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `gid` int(11) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES (1, 1, 4, 2);
INSERT INTO `shopcar` VALUES (2, 1, 4, 3);
INSERT INTO `shopcar` VALUES (7, 4, 4, 2);
INSERT INTO `shopcar` VALUES (13, 10, 4, 10);
INSERT INTO `shopcar` VALUES (14, 10, 13, 1);
INSERT INTO `shopcar` VALUES (15, 10, 5, 2);
INSERT INTO `shopcar` VALUES (16, 10, 6, 2);
INSERT INTO `shopcar` VALUES (17, 10, 12, 2);
INSERT INTO `shopcar` VALUES (18, 10, 11, 3);
INSERT INTO `shopcar` VALUES (20, 8, 3, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '13355174706', '1049022252@qq.com', 1);
INSERT INTO `user` VALUES (3, 'admin1', '21232f297a57a5a743894a0e4a801fc3', '13355174706', '1049022252@qq.com', 1);
INSERT INTO `user` VALUES (4, 'zhangyahui', '202cb962ac59075b964b07152d234b70', '1234554431', '1049022252@qq.cn', -1);
INSERT INTO `user` VALUES (5, '123', '202cb962ac59075b964b07152d234b70', '13355174706', '1049022252@qq.com', -1);
INSERT INTO `user` VALUES (6, '小张', '202cb962ac59075b964b07152d234b70', '1234', '1049022252@qq.com', -1);
INSERT INTO `user` VALUES (7, 'hello', '9e67a24cd2b010ec0d1ca08a5723cc23', '13355174706', '1049022252@qq.com', -1);
INSERT INTO `user` VALUES (8, 'houjiawei', 'e10adc3949ba59abbe56e057f20f883e', '13061237781', '974711574@qq.com', 0);
INSERT INTO `user` VALUES (9, 'huazhuo', 'e10adc3949ba59abbe56e057f20f883e', '17853241397', '123465465@qq.com', -1);
INSERT INTO `user` VALUES (10, 'hanzeyu', '202cb962ac59075b964b07152d234b70', '17853243751', '842524953@163.com', 0);
INSERT INTO `user` VALUES (11, 'huazhuo2', '202cb962ac59075b964b07152d234b70', '17853241397', '123465465@qq.com', 0);
INSERT INTO `user` VALUES (12, 'test', 'e10adc3949ba59abbe56e057f20f883e', '1234567', '9745678@qq.com', 0);

SET FOREIGN_KEY_CHECKS = 1;
