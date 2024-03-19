/*
 Navicat Premium Data Transfer

 Source Server         : linux-master
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.161.131:3307
 Source Schema         : mz-master

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 19/03/2024 10:08:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `parent_id` int NULL DEFAULT NULL COMMENT '所属部门',
  `level` int NULL DEFAULT NULL COMMENT '部门等级',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门位置',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (5, '222', '2024-03-14 15:30:40', 7, 2, '222', '33/222');
INSERT INTO `sys_dept` VALUES (7, '33', '2024-03-14 15:37:03', 0, 1, '33', '33');

-- ----------------------------
-- Table structure for sys_stu
-- ----------------------------
DROP TABLE IF EXISTS `sys_stu`;
CREATE TABLE `sys_stu`  (
  `stu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学生ID',
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `in_date` date NULL DEFAULT NULL COMMENT '入学时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  INDEX `id`(`stu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_stu
-- ----------------------------
INSERT INTO `sys_stu` VALUES ('MT-20240315-2', '小马哥', '男', '2024-03-18', '2024-03-15 11:47:31');
INSERT INTO `sys_stu` VALUES ('MT-20240315-3', '王五', '男', '2024-03-14', '2024-03-15 11:54:39');
INSERT INTO `sys_stu` VALUES ('MT-20240315-5', '大傻逼', '男', '2024-03-14', '2024-03-15 13:38:55');
INSERT INTO `sys_stu` VALUES ('MT-20240315-6', '王老五', '男', '2024-03-13', '2024-03-15 14:01:44');
INSERT INTO `sys_stu` VALUES ('MT-20240315-7', '千寻', '女', '2024-03-13', '2024-03-15 14:08:25');
INSERT INTO `sys_stu` VALUES ('MT-20240315-8', '1', '男', '2024-03-13', '2024-03-15 15:30:53');

-- ----------------------------
-- Table structure for sys_stu_sub
-- ----------------------------
DROP TABLE IF EXISTS `sys_stu_sub`;
CREATE TABLE `sys_stu_sub`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学生id',
  `sub_id` int NULL DEFAULT NULL COMMENT '学科id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stu_id`(`stu_id` ASC) USING BTREE,
  INDEX `sub_id`(`sub_id` ASC) USING BTREE,
  CONSTRAINT `sys_stu_sub_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `sys_sub` (`sub_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_stu_sub_ibfk_3` FOREIGN KEY (`stu_id`) REFERENCES `sys_stu` (`stu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_stu_sub
-- ----------------------------
INSERT INTO `sys_stu_sub` VALUES (4, 'MT-20240315-3', 1);
INSERT INTO `sys_stu_sub` VALUES (9, 'MT-20240315-6', 2);
INSERT INTO `sys_stu_sub` VALUES (10, 'MT-20240315-6', 3);
INSERT INTO `sys_stu_sub` VALUES (11, 'MT-20240315-7', 1);
INSERT INTO `sys_stu_sub` VALUES (12, 'MT-20240315-7', 4);
INSERT INTO `sys_stu_sub` VALUES (19, 'MT-20240315-2', 10);
INSERT INTO `sys_stu_sub` VALUES (20, 'MT-20240315-2', 9);
INSERT INTO `sys_stu_sub` VALUES (21, 'MT-20240315-2', 8);
INSERT INTO `sys_stu_sub` VALUES (22, 'MT-20240315-8', 1);
INSERT INTO `sys_stu_sub` VALUES (23, 'MT-20240315-8', 2);
INSERT INTO `sys_stu_sub` VALUES (28, 'MT-20240315-5', 3);

-- ----------------------------
-- Table structure for sys_sub
-- ----------------------------
DROP TABLE IF EXISTS `sys_sub`;
CREATE TABLE `sys_sub`  (
  `sub_id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sub_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学科名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '学科描述',
  `hours` int NULL DEFAULT NULL COMMENT '课时',
  `max` int NULL DEFAULT NULL COMMENT '最大人数',
  PRIMARY KEY (`sub_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学科表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_sub
-- ----------------------------
INSERT INTO `sys_sub` VALUES (1, '语文', '国学', 140160, 10);
INSERT INTO `sys_sub` VALUES (2, '数学', '算术', 140160, 5);
INSERT INTO `sys_sub` VALUES (3, '英文', '外交', 140160, 7);
INSERT INTO `sys_sub` VALUES (4, '政治', '管理', 500, 9);
INSERT INTO `sys_sub` VALUES (5, '历史', '考古', 400, 8);
INSERT INTO `sys_sub` VALUES (6, '地理', '风水', 300, 4);
INSERT INTO `sys_sub` VALUES (7, '物理', '原理', 6000, 6);
INSERT INTO `sys_sub` VALUES (8, '化学', '武器', 411, 2);
INSERT INTO `sys_sub` VALUES (9, '生物', '构造', 340, 2);
INSERT INTO `sys_sub` VALUES (10, '体育', '体能', 240, 1);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `country_id` int NULL DEFAULT NULL COMMENT '省',
  `province_id` int NULL DEFAULT NULL COMMENT '市',
  `city_id` int NULL DEFAULT NULL COMMENT '区',
  `place_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3000025 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (23, 1, '褚朱冯褚王朱杨', '褚朱冯褚王朱杨', '00', 'mz19990630@qq.com', '1310', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (24, 1, '杨孙吴孙沈褚杨', '杨孙吴孙沈褚杨', '00', '1@qq.com', '1311', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (25, 1, '蒋赵王蒋蒋韩周', '蒋赵王蒋蒋韩周', '00', '2@qq.com', '1312', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (26, 1, '沈郑尤杨王陈卫', '沈郑尤杨王陈卫', '00', '3@qq.com', '1313', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (27, 1, '钱沈孙钱陈杨朱', '钱沈孙钱陈杨朱', '00', '4@qq.com', '1314', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (28, 1, '杨许李孙王秦孙', '杨许李孙王秦孙', '00', '5@qq.com', '1315', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (29, 1, '陈李蒋褚郑王吴', '陈李蒋褚郑王吴', '00', '6@qq.com', '1316', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (30, 1, '冯孙郑蒋蒋韩周', '冯孙郑蒋蒋韩周', '00', '7@qq.com', '1317', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (31, 1, '王赵郑冯李周周', '王赵郑冯李周周', '00', '8@qq.com', '1318', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (32, 1, '朱韩沈韩卫吴韩', '朱韩沈韩卫吴韩', '00', '9@qq.com', '1319', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (33, 1, '郑周韩韩尤褚吴', '郑周韩韩尤褚吴', '00', '10@qq.com', '13110', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (34, 1, '韩秦杨韩尤沈王', '韩秦杨韩尤沈王', '00', '11@qq.com', '13111', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (35, 1, '秦卫周赵李钱尤', '秦卫周赵李钱尤', '00', '12@qq.com', '13112', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (36, 1, '尤尤许褚秦李孙', '尤尤许褚秦李孙', '00', '13@qq.com', '13113', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (37, 1, '李尤孙沈赵赵吴', '李尤孙沈赵赵吴', '00', '14@qq.com', '13114', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (38, 1, '郑陈卫冯周吴许', '郑陈卫冯周吴许', '00', '15@qq.com', '13115', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (39, 1, '孙孙吴吴郑李冯', '孙孙吴吴郑李冯', '00', '16@qq.com', '13116', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (40, 1, '韩王孙许钱沈蒋', '韩王孙许钱沈蒋', '00', '17@qq.com', '13117', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (41, 1, '朱冯秦尤冯韩蒋', '朱冯秦尤冯韩蒋', '00', '18@qq.com', '13118', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (42, 1, '赵尤蒋许杨蒋赵', '赵尤蒋许杨蒋赵', '00', '19@qq.com', '13119', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (43, 1, '钱沈钱杨王许郑', '钱沈钱杨王许郑', '00', '20@qq.com', '13120', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (44, 1, '卫王蒋赵蒋冯尤', '卫王蒋赵蒋冯尤', '00', '21@qq.com', '13121', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (45, 1, '钱李王许李许李', '钱李王许李许李', '00', '22@qq.com', '13122', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (46, 1, '陈钱朱王朱许杨', '陈钱朱王朱许杨', '00', '23@qq.com', '13123', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (47, 1, '褚卫吴蒋冯褚朱', '褚卫吴蒋冯褚朱', '00', '24@qq.com', '13124', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (48, 1, '孙褚陈尤蒋周孙', '孙褚陈尤蒋周孙', '00', '25@qq.com', '13125', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (49, 1, '冯钱秦秦尤蒋沈', '冯钱秦秦尤蒋沈', '00', '26@qq.com', '13126', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (50, 1, '王沈蒋韩许周王', '王沈蒋韩许周王', '00', '27@qq.com', '13127', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (51, 1, '孙孙郑杨吴王李', '孙孙郑杨吴王李', '00', '28@qq.com', '13128', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (52, 1, '吴尤陈卫秦陈赵', '吴尤陈卫秦陈赵', '00', '29@qq.com', '13129', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (53, 1, '郑许卫陈吴杨孙', '郑许卫陈吴杨孙', '00', '30@qq.com', '13130', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (54, 1, '沈褚尤沈沈孙沈', '沈褚尤沈沈孙沈', '00', '31@qq.com', '13131', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (55, 1, '吴尤钱孙沈许蒋', '吴尤钱孙沈许蒋', '00', '32@qq.com', '13132', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (56, 1, '卫钱许蒋赵陈郑', '卫钱许蒋赵陈郑', '00', '33@qq.com', '13133', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (57, 1, '周尤周朱尤李吴', '周尤周朱尤李吴', '00', '34@qq.com', '13134', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (58, 1, '杨李郑周韩杨尤', '杨李郑周韩杨尤', '00', '35@qq.com', '13135', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (59, 1, '许卫褚尤沈吴钱', '许卫褚尤沈吴钱', '00', '36@qq.com', '13136', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (60, 1, '蒋蒋陈蒋朱李陈', '蒋蒋陈蒋朱李陈', '00', '37@qq.com', '13137', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (61, 1, '冯吴卫陈钱李韩', '冯吴卫陈钱李韩', '00', '38@qq.com', '13138', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (62, 1, '钱钱褚许王钱钱', '钱钱褚许王钱钱', '00', '39@qq.com', '13139', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (63, 1, '郑许王韩秦王褚', '郑许王韩秦王褚', '00', '40@qq.com', '13140', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (64, 1, '李孙褚冯蒋沈郑', '李孙褚冯蒋沈郑', '00', '41@qq.com', '13141', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (65, 1, '蒋王褚周杨卫沈', '蒋王褚周杨卫沈', '00', '42@qq.com', '13142', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (66, 1, '杨沈陈陈许钱朱', '杨沈陈陈许钱朱', '00', '43@qq.com', '13143', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (67, 1, '朱沈周朱吴沈褚', '朱沈周朱吴沈褚', '00', '44@qq.com', '13144', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (68, 1, '王吴尤吴秦赵冯', '王吴尤吴秦赵冯', '00', '45@qq.com', '13145', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (69, 1, '褚韩赵李郑郑朱', '褚韩赵李郑郑朱', '00', '46@qq.com', '13146', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (70, 1, '褚冯周尤尤钱冯', '褚冯周尤尤钱冯', '00', '47@qq.com', '13147', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (71, 1, '李吴蒋冯韩钱尤', '李吴蒋冯韩钱尤', '00', '48@qq.com', '13148', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (72, 1, '王韩杨蒋李王钱', '王韩杨蒋李王钱', '00', '49@qq.com', '13149', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (73, 1, '王朱秦吴李吴李', '王朱秦吴李吴李', '00', '50@qq.com', '13150', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (74, 1, '孙孙杨吴杨李秦', '孙孙杨吴杨李秦', '00', '51@qq.com', '13151', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (75, 1, '杨王许蒋蒋冯李', '杨王许蒋蒋冯李', '00', '52@qq.com', '13152', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (76, 1, '钱杨陈杨郑韩尤', '钱杨陈杨郑韩尤', '00', '53@qq.com', '13153', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (77, 1, '蒋沈褚陈沈蒋周', '蒋沈褚陈沈蒋周', '00', '54@qq.com', '13154', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (78, 1, '褚韩王卫孙许韩', '褚韩王卫孙许韩', '00', '55@qq.com', '13155', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (79, 1, '卫尤尤吴杨秦尤', '卫尤尤吴杨秦尤', '00', '56@qq.com', '13156', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (80, 1, '朱尤杨褚周韩秦', '朱尤杨褚周韩秦', '00', '57@qq.com', '13157', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (81, 1, '王卫周韩褚沈冯', '王卫周韩褚沈冯', '00', '58@qq.com', '13158', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (82, 1, '朱郑褚陈陈韩郑', '朱郑褚陈陈韩郑', '00', '59@qq.com', '13159', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (83, 1, '冯王尤周杨杨秦', '冯王尤周杨杨秦', '00', '60@qq.com', '13160', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (84, 1, '许李褚陈王韩周', '许李褚陈王韩周', '00', '61@qq.com', '13161', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (85, 1, '陈秦王周褚韩郑', '陈秦王周褚韩郑', '00', '62@qq.com', '13162', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (86, 1, '吴朱蒋杨钱褚蒋', '吴朱蒋杨钱褚蒋', '00', '63@qq.com', '13163', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (87, 1, '褚钱秦赵朱朱冯', '褚钱秦赵朱朱冯', '00', '64@qq.com', '13164', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (88, 1, '赵尤尤韩孙吴孙', '赵尤尤韩孙吴孙', '00', '65@qq.com', '13165', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (89, 1, '钱赵许陈尤卫陈', '钱赵许陈尤卫陈', '00', '66@qq.com', '13166', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (90, 1, '沈赵李卫褚朱冯', '沈赵李卫褚朱冯', '00', '67@qq.com', '13167', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (91, 1, '郑朱李尤吴赵秦', '郑朱李尤吴赵秦', '00', '68@qq.com', '13168', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (92, 1, '吴李褚李朱沈孙', '吴李褚李朱沈孙', '00', '69@qq.com', '13169', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (93, 1, '沈蒋卫韩冯周冯', '沈蒋卫韩冯周冯', '00', '70@qq.com', '13170', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (94, 1, '沈钱蒋王赵沈钱', '沈钱蒋王赵沈钱', '00', '71@qq.com', '13171', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (95, 1, '陈王周赵周朱冯', '陈王周赵周朱冯', '00', '72@qq.com', '13172', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (96, 1, '褚蒋周陈韩吴赵', '褚蒋周陈韩吴赵', '00', '73@qq.com', '13173', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (97, 1, '钱王许卫冯朱韩', '钱王许卫冯朱韩', '00', '74@qq.com', '13174', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (98, 1, '卫许卫陈赵秦孙', '卫许卫陈赵秦孙', '00', '75@qq.com', '13175', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (99, 1, '王尤陈韩吴韩冯', '王尤陈韩吴韩冯', '00', '76@qq.com', '13176', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (100, 1, '沈朱杨褚尤褚吴', '沈朱杨褚尤褚吴', '00', '77@qq.com', '13177', '0', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 1, '钱钱褚杨卫杨冯', '钱钱褚杨卫杨冯', '00', '78@qq.com', '13178', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 1, '冯孙冯王尤李赵', '冯孙冯王尤李赵', '00', '79@qq.com', '13179', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 1, '钱秦杨许蒋秦周', '钱秦杨许蒋秦周', '00', '80@qq.com', '13180', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (104, 1, '郑杨褚秦沈韩冯', '郑杨褚秦沈韩冯', '00', '81@qq.com', '13181', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 1, '尤郑孙沈冯李秦', '尤郑孙沈冯李秦', '00', '82@qq.com', '13182', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (106, 1, '李赵许陈秦王杨', '李赵许陈秦王杨', '00', '83@qq.com', '13183', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (107, 1, '蒋周尤韩孙钱沈', '蒋周尤韩孙钱沈', '00', '84@qq.com', '13184', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (108, 1, '冯周秦吴吴周王', '冯周秦吴吴周王', '00', '85@qq.com', '13185', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (109, 1, '钱许朱蒋朱卫朱', '钱许朱蒋朱卫朱', '00', '86@qq.com', '13186', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (110, 1, '韩沈吴尤李郑陈', '韩沈吴尤李郑陈', '00', '87@qq.com', '13187', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (111, 1, '赵许周王朱许卫', '赵许周王朱许卫', '00', '88@qq.com', '13188', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (112, 1, '尤蒋韩周孙尤钱', '尤蒋韩周孙尤钱', '00', '89@qq.com', '13189', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (113, 1, '王杨许钱韩卫许', '王杨许钱韩卫许', '00', '90@qq.com', '13190', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (114, 1, '尤吴杨吴褚杨李', '尤吴杨吴褚杨李', '00', '91@qq.com', '13191', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (115, 1, '孙赵孙钱许周蒋', '孙赵孙钱许周蒋', '00', '92@qq.com', '13192', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (116, 1, '李沈赵孙沈杨陈', '李沈赵孙沈杨陈', '00', '93@qq.com', '13193', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (117, 1, '李许卫蒋沈王许', '李许卫蒋沈王许', '00', '94@qq.com', '13194', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (118, 1, '郑朱褚郑许李孙', '郑朱褚郑许李孙', '00', '95@qq.com', '13195', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (119, 1, '褚许周赵朱王吴', '褚许周赵朱王吴', '00', '96@qq.com', '13196', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (120, 1, '陈朱秦卫褚秦韩', '陈朱秦卫褚秦韩', '00', '97@qq.com', '13197', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (121, 1, '秦郑蒋褚杨卫赵', '秦郑蒋褚杨卫赵', '00', '98@qq.com', '13198', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (122, 1, '秦冯卫吴郑郑蒋', '秦冯卫吴郑郑蒋', '00', '99@qq.com', '13199', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (123, 1, '朱王杨郑朱褚秦', '朱王杨郑朱褚秦', '00', '100@qq.com', '131100', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (124, 1, '周许孙孙沈王郑', '周许孙孙沈王郑', '00', '101@qq.com', '131101', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (125, 1, '孙沈蒋杨沈郑吴', '孙沈蒋杨沈郑吴', '00', '102@qq.com', '131102', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (126, 1, '杨王卫陈韩钱陈', '杨王卫陈韩钱陈', '00', '103@qq.com', '131103', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (127, 1, '冯孙郑王王朱卫', '冯孙郑王王朱卫', '00', '104@qq.com', '131104', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (128, 1, '褚韩周郑陈许韩', '褚韩周郑陈许韩', '00', '105@qq.com', '131105', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (129, 1, '冯许周蒋李蒋卫', '冯许周蒋李蒋卫', '00', '106@qq.com', '131106', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (130, 1, '许卫郑孙周吴蒋', '许卫郑孙周吴蒋', '00', '107@qq.com', '131107', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (131, 1, '朱李赵尤杨李许', '朱李赵尤杨李许', '00', '108@qq.com', '131108', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (132, 1, '尤周周韩吴王尤', '尤周周韩吴王尤', '00', '109@qq.com', '131109', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (133, 1, '尤许杨蒋韩郑杨', '尤许杨蒋韩郑杨', '00', '110@qq.com', '131110', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (134, 1, '韩李孙尤许秦杨', '韩李孙尤许秦杨', '00', '111@qq.com', '131111', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (135, 1, '韩秦尤李钱赵褚', '韩秦尤李钱赵褚', '00', '112@qq.com', '131112', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (136, 1, '陈尤朱郑韩卫李', '陈尤朱郑韩卫李', '00', '113@qq.com', '131113', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (137, 1, '周沈冯卫朱蒋陈', '周沈冯卫朱蒋陈', '00', '114@qq.com', '131114', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (138, 1, '蒋蒋李王韩朱许', '蒋蒋李王韩朱许', '00', '115@qq.com', '131115', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (139, 1, '卫朱褚孙陈沈孙', '卫朱褚孙陈沈孙', '00', '116@qq.com', '131116', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (140, 1, '赵褚蒋李赵尤卫', '赵褚蒋李赵尤卫', '00', '117@qq.com', '131117', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (141, 1, '沈王吴周钱蒋秦', '沈王吴周钱蒋秦', '00', '118@qq.com', '131118', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (142, 1, '李赵郑卫孙蒋周', '李赵郑卫孙蒋周', '00', '119@qq.com', '131119', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (143, 1, '吴周吴郑秦沈杨', '吴周吴郑秦沈杨', '00', '120@qq.com', '131120', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (144, 1, '卫沈杨朱蒋许沈', '卫沈杨朱蒋许沈', '00', '121@qq.com', '131121', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (145, 1, '陈蒋尤卫卫赵王', '陈蒋尤卫卫赵王', '00', '122@qq.com', '131122', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (146, 1, '韩沈周沈韩孙秦', '韩沈周沈韩孙秦', '00', '123@qq.com', '131123', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (147, 1, '尤蒋卫卫蒋褚郑', '尤蒋卫卫蒋褚郑', '00', '124@qq.com', '131124', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (148, 1, '赵吴秦蒋周钱王', '赵吴秦蒋周钱王', '00', '125@qq.com', '131125', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (149, 1, '朱李吴杨冯秦杨', '朱李吴杨冯秦杨', '00', '126@qq.com', '131126', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (150, 1, '褚褚李钱卫朱蒋', '褚褚李钱卫朱蒋', '00', '127@qq.com', '131127', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (151, 1, '钱赵陈杨秦郑钱', '钱赵陈杨秦郑钱', '00', '128@qq.com', '131128', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (152, 1, '郑秦陈王杨许卫', '郑秦陈王杨许卫', '00', '129@qq.com', '131129', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (153, 1, '冯周蒋冯尤许赵', '冯周蒋冯尤许赵', '00', '130@qq.com', '131130', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (154, 1, '赵尤王秦冯尤尤', '赵尤王秦冯尤尤', '00', '131@qq.com', '131131', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (155, 1, '郑卫钱周郑蒋朱', '郑卫钱周郑蒋朱', '00', '132@qq.com', '131132', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (156, 1, '尤赵卫赵朱吴沈', '尤赵卫赵朱吴沈', '00', '133@qq.com', '131133', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (157, 1, '王杨陈杨蒋蒋沈', '王杨陈杨蒋蒋沈', '00', '134@qq.com', '131134', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (158, 1, '蒋赵褚赵郑周陈', '蒋赵褚赵郑周陈', '00', '135@qq.com', '131135', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (159, 1, '朱赵韩尤杨冯赵', '朱赵韩尤杨冯赵', '00', '136@qq.com', '131136', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (160, 1, '杨许王孙韩蒋钱', '杨许王孙韩蒋钱', '00', '137@qq.com', '131137', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (161, 1, '吴秦褚蒋沈韩赵', '吴秦褚蒋沈韩赵', '00', '138@qq.com', '131138', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (162, 1, '赵吴韩孙赵冯褚', '赵吴韩孙赵冯褚', '00', '139@qq.com', '131139', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (163, 1, '钱沈卫褚韩卫孙', '钱沈卫褚韩卫孙', '00', '140@qq.com', '131140', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (164, 1, '冯杨尤秦尤沈郑', '冯杨尤秦尤沈郑', '00', '141@qq.com', '131141', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (165, 1, '卫蒋蒋尤蒋陈沈', '卫蒋蒋尤蒋陈沈', '00', '142@qq.com', '131142', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (166, 1, '秦韩蒋尤许郑周', '秦韩蒋尤许郑周', '00', '143@qq.com', '131143', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (167, 1, '陈钱尤王吴陈褚', '陈钱尤王吴陈褚', '00', '144@qq.com', '131144', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (168, 1, '尤陈李许周周沈', '尤陈李许周周沈', '00', '145@qq.com', '131145', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (169, 1, '韩褚蒋褚许赵褚', '韩褚蒋褚许赵褚', '00', '146@qq.com', '131146', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (170, 1, '孙沈陈韩沈王郑', '孙沈陈韩沈王郑', '00', '147@qq.com', '131147', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (171, 1, '郑尤陈秦卫秦卫', '郑尤陈秦卫秦卫', '00', '148@qq.com', '131148', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (172, 1, '王钱赵冯李陈孙', '王钱赵冯李陈孙', '00', '149@qq.com', '131149', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (173, 1, '赵李杨秦卫许尤', '赵李杨秦卫许尤', '00', '150@qq.com', '131150', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (174, 1, '朱郑褚陈韩杨冯', '朱郑褚陈韩杨冯', '00', '151@qq.com', '131151', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (175, 1, '杨李秦李沈杨朱', '杨李秦李沈杨朱', '00', '152@qq.com', '131152', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (176, 1, '冯赵杨尤秦朱郑', '冯赵杨尤秦朱郑', '00', '153@qq.com', '131153', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (177, 1, '赵冯王王钱褚周', '赵冯王王钱褚周', '00', '154@qq.com', '131154', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (178, 1, '陈李朱郑韩秦沈', '陈李朱郑韩秦沈', '00', '155@qq.com', '131155', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (179, 1, '朱孙吴周吴卫孙', '朱孙吴周吴卫孙', '00', '156@qq.com', '131156', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (180, 1, '杨钱王秦王卫蒋', '杨钱王秦王卫蒋', '00', '157@qq.com', '131157', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (181, 1, '韩钱韩秦赵王尤', '韩钱韩秦赵王尤', '00', '158@qq.com', '131158', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (182, 1, '沈陈冯王周韩杨', '沈陈冯王周韩杨', '00', '159@qq.com', '131159', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (183, 1, '沈朱沈李杨孙卫', '沈朱沈李杨孙卫', '00', '160@qq.com', '131160', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (184, 1, '褚周李沈吴冯钱', '褚周李沈吴冯钱', '00', '161@qq.com', '131161', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (185, 1, '许周朱许赵秦许', '许周朱许赵秦许', '00', '162@qq.com', '131162', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (186, 1, '冯王杨卫冯蒋卫', '冯王杨卫冯蒋卫', '00', '163@qq.com', '131163', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (187, 1, '秦钱钱吴冯赵尤', '秦钱钱吴冯赵尤', '00', '164@qq.com', '131164', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (188, 1, '郑李郑陈尤秦蒋', '郑李郑陈尤秦蒋', '00', '165@qq.com', '131165', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (189, 1, '吴杨吴陈吴尤郑', '吴杨吴陈吴尤郑', '00', '166@qq.com', '131166', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (190, 1, '赵沈尤冯许陈杨', '赵沈尤冯许陈杨', '00', '167@qq.com', '131167', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (191, 1, '卫郑孙孙周李周', '卫郑孙孙周李周', '00', '168@qq.com', '131168', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (192, 1, '王卫朱冯卫尤许', '王卫朱冯卫尤许', '00', '169@qq.com', '131169', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (193, 1, '秦钱周冯吴陈王', '秦钱周冯吴陈王', '00', '170@qq.com', '131170', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (194, 1, '赵钱许卫褚朱王', '赵钱许卫褚朱王', '00', '171@qq.com', '131171', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (195, 1, '李许孙尤陈赵周', '李许孙尤陈赵周', '00', '172@qq.com', '131172', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (196, 1, '褚韩尤蒋秦郑杨', '褚韩尤蒋秦郑杨', '00', '173@qq.com', '131173', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (197, 1, '秦尤李卫郑陈褚', '秦尤李卫郑陈褚', '00', '174@qq.com', '131174', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (198, 1, '朱钱王赵吴陈杨', '朱钱王赵吴陈杨', '00', '175@qq.com', '131175', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (199, 1, '赵秦李冯尤孙赵', '赵秦李冯尤孙赵', '00', '176@qq.com', '131176', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (200, 1, '许李杨吴沈周朱', '许李杨吴沈周朱', '00', '177@qq.com', '131177', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (201, 1, '冯蒋卫秦褚尤朱', '冯蒋卫秦褚尤朱', '00', '178@qq.com', '131178', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (202, 1, '陈杨蒋郑周赵尤', '陈杨蒋郑周赵尤', '00', '179@qq.com', '131179', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (203, 1, '郑蒋吴李韩秦尤', '郑蒋吴李韩秦尤', '00', '180@qq.com', '131180', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (204, 1, '周王韩孙周韩卫', '周王韩孙周韩卫', '00', '181@qq.com', '131181', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (205, 1, '杨吴王孙褚钱周', '杨吴王孙褚钱周', '00', '182@qq.com', '131182', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (206, 1, '尤吴杨韩韩王卫', '尤吴杨韩韩王卫', '00', '183@qq.com', '131183', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (207, 1, '韩周尤吴钱郑陈', '韩周尤吴钱郑陈', '00', '184@qq.com', '131184', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (208, 1, '褚吴孙钱冯沈杨', '褚吴孙钱冯沈杨', '00', '185@qq.com', '131185', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (209, 1, '王沈褚朱蒋杨郑', '王沈褚朱蒋杨郑', '00', '186@qq.com', '131186', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (210, 1, '卫许沈周郑蒋李', '卫许沈周郑蒋李', '00', '187@qq.com', '131187', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (211, 1, '李钱郑钱尤韩朱', '李钱郑钱尤韩朱', '00', '188@qq.com', '131188', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (212, 1, '陈许韩李吴尤郑', '陈许韩李吴尤郑', '00', '189@qq.com', '131189', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (213, 1, '沈冯吴李蒋朱吴', '沈冯吴李蒋朱吴', '00', '190@qq.com', '131190', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (214, 1, '卫卫许吴杨秦周', '卫卫许吴杨秦周', '00', '191@qq.com', '131191', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (215, 1, '杨沈蒋冯冯郑吴', '杨沈蒋冯冯郑吴', '00', '192@qq.com', '131192', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (216, 1, '王朱沈杨郑钱赵', '王朱沈杨郑钱赵', '00', '193@qq.com', '131193', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (217, 1, '韩冯朱王沈郑孙', '韩冯朱王沈郑孙', '00', '194@qq.com', '131194', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (218, 1, '赵冯钱周周冯沈', '赵冯钱周周冯沈', '00', '195@qq.com', '131195', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (219, 1, '卫韩秦赵许郑褚', '卫韩秦赵许郑褚', '00', '196@qq.com', '131196', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (220, 1, '王陈吴周沈李王', '王陈吴周沈李王', '00', '197@qq.com', '131197', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (221, 1, '周周卫卫褚冯韩', '周周卫卫褚冯韩', '00', '198@qq.com', '131198', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (222, 1, '沈冯韩郑蒋蒋沈', '沈冯韩郑蒋蒋沈', '00', '199@qq.com', '131199', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (223, 1, '吴周吴周吴褚周', '吴周吴周吴褚周', '00', '200@qq.com', '131200', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (224, 1, '周褚朱陈韩冯蒋', '周褚朱陈韩冯蒋', '00', '201@qq.com', '131201', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (225, 1, '王褚卫许褚杨沈', '王褚卫许褚杨沈', '00', '202@qq.com', '131202', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (226, 1, '朱卫王卫赵郑吴', '朱卫王卫赵郑吴', '00', '203@qq.com', '131203', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (227, 1, '尤蒋钱王杨钱陈', '尤蒋钱王杨钱陈', '00', '204@qq.com', '131204', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (228, 1, '许王吴尤孙尤李', '许王吴尤孙尤李', '00', '205@qq.com', '131205', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (229, 1, '朱赵尤韩沈王李', '朱赵尤韩沈王李', '00', '206@qq.com', '131206', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (230, 1, '冯卫吴秦褚朱周', '冯卫吴秦褚朱周', '00', '207@qq.com', '131207', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (231, 1, '蒋许王许赵周钱', '蒋许王许赵周钱', '00', '208@qq.com', '131208', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (232, 1, '冯杨钱许尤李李', '冯杨钱许尤李李', '00', '209@qq.com', '131209', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (233, 1, '郑钱冯陈褚周李', '郑钱冯陈褚周李', '00', '210@qq.com', '131210', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (234, 1, '吴郑周赵李尤卫', '吴郑周赵李尤卫', '00', '211@qq.com', '131211', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (235, 1, '周赵吴蒋冯卫冯', '周赵吴蒋冯卫冯', '00', '212@qq.com', '131212', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (236, 1, '蒋李褚沈秦杨尤', '蒋李褚沈秦杨尤', '00', '213@qq.com', '131213', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (237, 1, '卫李蒋沈郑韩蒋', '卫李蒋沈郑韩蒋', '00', '214@qq.com', '131214', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (238, 1, '吴蒋褚褚李王沈', '吴蒋褚褚李王沈', '00', '215@qq.com', '131215', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (239, 1, '杨陈沈尤朱卫蒋', '杨陈沈尤朱卫蒋', '00', '216@qq.com', '131216', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (240, 1, '冯蒋褚郑赵许蒋', '冯蒋褚郑赵许蒋', '00', '217@qq.com', '131217', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (241, 1, '韩卫杨蒋钱郑褚', '韩卫杨蒋钱郑褚', '00', '218@qq.com', '131218', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (242, 1, '沈沈钱陈李韩沈', '沈沈钱陈李韩沈', '00', '219@qq.com', '131219', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (243, 1, '许杨韩周沈韩杨', '许杨韩周沈韩杨', '00', '220@qq.com', '131220', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (244, 1, '杨李李沈吴朱许', '杨李李沈吴朱许', '00', '221@qq.com', '131221', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (245, 1, '冯蒋钱秦钱王秦', '冯蒋钱秦钱王秦', '00', '222@qq.com', '131222', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (246, 1, '吴李朱孙秦郑周', '吴李朱孙秦郑周', '00', '223@qq.com', '131223', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (247, 1, '吴吴秦卫韩蒋秦', '吴吴秦卫韩蒋秦', '00', '224@qq.com', '131224', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (248, 1, '钱李秦陈钱周赵', '钱李秦陈钱周赵', '00', '225@qq.com', '131225', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (249, 1, '吴褚杨韩卫冯卫', '吴褚杨韩卫冯卫', '00', '226@qq.com', '131226', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (250, 1, '陈孙朱褚郑王吴', '陈孙朱褚郑王吴', '00', '227@qq.com', '131227', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (251, 1, '王吴孙杨韩陈褚', '王吴孙杨韩陈褚', '00', '228@qq.com', '131228', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (252, 1, '郑冯朱郑朱尤吴', '郑冯朱郑朱尤吴', '00', '229@qq.com', '131229', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (253, 1, '蒋王钱赵韩韩周', '蒋王钱赵韩韩周', '00', '230@qq.com', '131230', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (254, 1, '韩褚郑周赵卫尤', '韩褚郑周赵卫尤', '00', '231@qq.com', '131231', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (255, 1, '杨卫孙吴周周沈', '杨卫孙吴周周沈', '00', '232@qq.com', '131232', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (256, 1, '尤郑孙吴吴钱郑', '尤郑孙吴吴钱郑', '00', '233@qq.com', '131233', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (257, 1, '许韩褚卫褚吴杨', '许韩褚卫褚吴杨', '00', '234@qq.com', '131234', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (258, 1, '周郑吴陈沈沈卫', '周郑吴陈沈沈卫', '00', '235@qq.com', '131235', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (259, 1, '韩杨周尤杨卫冯', '韩杨周尤杨卫冯', '00', '236@qq.com', '131236', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (260, 1, '卫许朱王韩沈许', '卫许朱王韩沈许', '00', '237@qq.com', '131237', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (261, 1, '许朱韩郑褚李卫', '许朱韩郑褚李卫', '00', '238@qq.com', '131238', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (262, 1, '沈尤孙孙沈孙沈', '沈尤孙孙沈孙沈', '00', '239@qq.com', '131239', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (263, 1, '钱冯朱李吴朱吴', '钱冯朱李吴朱吴', '00', '240@qq.com', '131240', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (264, 1, '秦孙韩沈陈尤卫', '秦孙韩沈陈尤卫', '00', '241@qq.com', '131241', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (265, 1, '周秦褚朱陈周吴', '周秦褚朱陈周吴', '00', '242@qq.com', '131242', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (266, 1, '钱沈卫褚陈蒋蒋', '钱沈卫褚陈蒋蒋', '00', '243@qq.com', '131243', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (267, 1, '褚朱陈秦蒋尤郑', '褚朱陈秦蒋尤郑', '00', '244@qq.com', '131244', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (268, 1, '朱冯陈卫卫李杨', '朱冯陈卫卫李杨', '00', '245@qq.com', '131245', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (269, 1, '杨蒋吴沈秦吴蒋', '杨蒋吴沈秦吴蒋', '00', '246@qq.com', '131246', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (270, 1, '秦李钱蒋周许孙', '秦李钱蒋周许孙', '00', '247@qq.com', '131247', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (271, 1, '冯钱许赵尤沈王', '冯钱许赵尤沈王', '00', '248@qq.com', '131248', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (272, 1, '蒋褚郑赵许郑赵', '蒋褚郑赵许郑赵', '00', '249@qq.com', '131249', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (273, 1, '许李郑蒋赵吴褚', '许李郑蒋赵吴褚', '00', '250@qq.com', '131250', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (274, 1, '韩钱褚周秦褚孙', '韩钱褚周秦褚孙', '00', '251@qq.com', '131251', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (275, 1, '朱冯褚朱蒋赵李', '朱冯褚朱蒋赵李', '00', '252@qq.com', '131252', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (276, 1, '沈褚沈钱孙许卫', '沈褚沈钱孙许卫', '00', '253@qq.com', '131253', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (277, 1, '王褚赵陈孙吴朱', '王褚赵陈孙吴朱', '00', '254@qq.com', '131254', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (278, 1, '郑韩郑韩杨冯蒋', '郑韩郑韩杨冯蒋', '00', '255@qq.com', '131255', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (279, 1, '卫杨卫冯卫陈许', '卫杨卫冯卫陈许', '00', '256@qq.com', '131256', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (280, 1, '孙沈秦秦陈朱吴', '孙沈秦秦陈朱吴', '00', '257@qq.com', '131257', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (281, 1, '周杨朱李周杨褚', '周杨朱李周杨褚', '00', '258@qq.com', '131258', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (282, 1, '卫孙吴孙李陈王', '卫孙吴孙李陈王', '00', '259@qq.com', '131259', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (283, 1, '沈尤尤褚沈钱褚', '沈尤尤褚沈钱褚', '00', '260@qq.com', '131260', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (284, 1, '郑褚秦蒋尤孙尤', '郑褚秦蒋尤孙尤', '00', '261@qq.com', '131261', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (285, 1, '杨吴朱周吴秦许', '杨吴朱周吴秦许', '00', '262@qq.com', '131262', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (286, 1, '褚许韩周陈孙郑', '褚许韩周陈孙郑', '00', '263@qq.com', '131263', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (287, 1, '钱钱蒋李杨尤尤', '钱钱蒋李杨尤尤', '00', '264@qq.com', '131264', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (288, 1, '尤朱杨冯陈吴陈', '尤朱杨冯陈吴陈', '00', '265@qq.com', '131265', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (289, 1, '陈冯蒋褚韩孙冯', '陈冯蒋褚韩孙冯', '00', '266@qq.com', '131266', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (290, 1, '卫陈韩郑陈李吴', '卫陈韩郑陈李吴', '00', '267@qq.com', '131267', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (291, 1, '朱沈郑孙孙吴尤', '朱沈郑孙孙吴尤', '00', '268@qq.com', '131268', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (292, 1, '尤赵韩许郑周尤', '尤赵韩许郑周尤', '00', '269@qq.com', '131269', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (293, 1, '杨陈尤杨孙赵冯', '杨陈尤杨孙赵冯', '00', '270@qq.com', '131270', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (294, 1, '冯卫钱陈尤沈杨', '冯卫钱陈尤沈杨', '00', '271@qq.com', '131271', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (295, 1, '李冯郑冯蒋尤韩', '李冯郑冯蒋尤韩', '00', '272@qq.com', '131272', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (296, 1, '许沈杨陈尤卫周', '许沈杨陈尤卫周', '00', '273@qq.com', '131273', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (297, 1, '周褚沈褚蒋蒋赵', '周褚沈褚蒋蒋赵', '00', '274@qq.com', '131274', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (298, 1, '王尤孙钱钱郑韩', '王尤孙钱钱郑韩', '00', '275@qq.com', '131275', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (299, 1, '朱王秦秦孙郑卫', '朱王秦秦孙郑卫', '00', '276@qq.com', '131276', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (300, 1, '褚李秦钱卫赵周', '褚李秦钱卫赵周', '00', '277@qq.com', '131277', '0', '', '123', '0', '0', '', NULL, '', '2021-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (301, 1, '韩李赵吴杨褚赵', '韩李赵吴杨褚赵', '00', '278@qq.com', '131278', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (302, 1, '王赵秦孙许赵褚', '王赵秦孙许赵褚', '00', '279@qq.com', '131279', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (303, 1, '许卫秦周孙李冯', '许卫秦周孙李冯', '00', '280@qq.com', '131280', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (304, 1, '陈韩沈钱郑周沈', '陈韩沈钱郑周沈', '00', '281@qq.com', '131281', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (305, 1, '孙秦冯李蒋秦钱', '孙秦冯李蒋秦钱', '00', '282@qq.com', '131282', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (306, 1, '蒋赵吴陈杨陈韩', '蒋赵吴陈杨陈韩', '00', '283@qq.com', '131283', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (307, 1, '卫钱许郑李沈陈', '卫钱许郑李沈陈', '00', '284@qq.com', '131284', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (308, 1, '卫秦钱韩周郑王', '卫秦钱韩周郑王', '00', '285@qq.com', '131285', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (309, 1, '朱钱朱吴孙朱蒋', '朱钱朱吴孙朱蒋', '00', '286@qq.com', '131286', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (310, 1, '卫周孙许陈卫郑', '卫周孙许陈卫郑', '00', '287@qq.com', '131287', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (311, 1, '卫吴赵韩周郑孙', '卫吴赵韩周郑孙', '00', '288@qq.com', '131288', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (312, 1, '孙蒋许郑周朱周', '孙蒋许郑周朱周', '00', '289@qq.com', '131289', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (313, 1, '卫孙杨卫李郑陈', '卫孙杨卫李郑陈', '00', '290@qq.com', '131290', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (314, 1, '冯周吴王钱尤孙', '冯周吴王钱尤孙', '00', '291@qq.com', '131291', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (315, 1, '尤卫钱褚秦郑郑', '尤卫钱褚秦郑郑', '00', '292@qq.com', '131292', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (316, 1, '尤蒋杨孙王卫李', '尤蒋杨孙王卫李', '00', '293@qq.com', '131293', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (317, 1, '卫周褚尤许郑许', '卫周褚尤许郑许', '00', '294@qq.com', '131294', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (318, 1, '许朱褚赵韩卫冯', '许朱褚赵韩卫冯', '00', '295@qq.com', '131295', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (319, 1, '冯沈吴钱钱秦秦', '冯沈吴钱钱秦秦', '00', '296@qq.com', '131296', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (320, 1, '尤孙冯郑朱孙褚', '尤孙冯郑朱孙褚', '00', '297@qq.com', '131297', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (321, 1, '郑孙王孙许李杨', '郑孙王孙许李杨', '00', '298@qq.com', '131298', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (322, 1, '王韩沈褚吴孙郑', '王韩沈褚吴孙郑', '00', '299@qq.com', '131299', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (323, 1, '卫陈韩郑陈李周', '卫陈韩郑陈李周', '00', '300@qq.com', '131300', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (324, 1, '韩朱冯王赵许尤', '韩朱冯王赵许尤', '00', '301@qq.com', '131301', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (325, 1, '秦孙尤钱钱陈孙', '秦孙尤钱钱陈孙', '00', '302@qq.com', '131302', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (326, 1, '蒋冯杨郑卫卫赵', '蒋冯杨郑卫卫赵', '00', '303@qq.com', '131303', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (327, 1, '沈周冯王朱吴韩', '沈周冯王朱吴韩', '00', '304@qq.com', '131304', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (328, 1, '冯杨朱褚王钱赵', '冯杨朱褚王钱赵', '00', '305@qq.com', '131305', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (329, 1, '李周王钱沈陈冯', '李周王钱沈陈冯', '00', '306@qq.com', '131306', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (330, 1, '陈孙褚尤王褚褚', '陈孙褚尤王褚褚', '00', '307@qq.com', '131307', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (331, 1, '许韩钱杨沈杨许', '许韩钱杨沈杨许', '00', '308@qq.com', '131308', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (332, 1, '卫吴朱许褚郑许', '卫吴朱许褚郑许', '00', '309@qq.com', '131309', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (333, 1, '蒋卫赵钱沈沈冯', '蒋卫赵钱沈沈冯', '00', '310@qq.com', '131310', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (334, 1, '李王蒋沈尤杨钱', '李王蒋沈尤杨钱', '00', '311@qq.com', '131311', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (335, 1, '尤李王杨秦赵李', '尤李王杨秦赵李', '00', '312@qq.com', '131312', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (336, 1, '卫周沈韩朱周郑', '卫周沈韩朱周郑', '00', '313@qq.com', '131313', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (337, 1, '王赵朱王王冯韩', '王赵朱王王冯韩', '00', '314@qq.com', '131314', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (338, 1, '李卫周沈尤郑王', '李卫周沈尤郑王', '00', '315@qq.com', '131315', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (339, 1, '钱褚沈陈朱卫秦', '钱褚沈陈朱卫秦', '00', '316@qq.com', '131316', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (340, 1, '郑蒋韩郑吴褚卫', '郑蒋韩郑吴褚卫', '00', '317@qq.com', '131317', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (341, 1, '韩卫吴杨许沈蒋', '韩卫吴杨许沈蒋', '00', '318@qq.com', '131318', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (342, 1, '许冯褚卫陈李吴', '许冯褚卫陈李吴', '00', '319@qq.com', '131319', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (343, 1, '钱陈尤李孙孙沈', '钱陈尤李孙孙沈', '00', '320@qq.com', '131320', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (344, 1, '郑朱赵褚钱朱冯', '郑朱赵褚钱朱冯', '00', '321@qq.com', '131321', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (345, 1, '蒋尤赵王钱钱褚', '蒋尤赵王钱钱褚', '00', '322@qq.com', '131322', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (346, 1, '杨钱陈陈吴陈韩', '杨钱陈陈吴陈韩', '00', '323@qq.com', '131323', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (347, 1, '陈郑卫冯尤孙李', '陈郑卫冯尤孙李', '00', '324@qq.com', '131324', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (348, 1, '尤郑周沈褚沈陈', '尤郑周沈褚沈陈', '00', '325@qq.com', '131325', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (349, 1, '吴冯冯沈钱吴秦', '吴冯冯沈钱吴秦', '00', '326@qq.com', '131326', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (350, 1, '冯钱尤尤吴杨沈', '冯钱尤尤吴杨沈', '00', '327@qq.com', '131327', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (351, 1, '韩吴周杨钱赵尤', '韩吴周杨钱赵尤', '00', '328@qq.com', '131328', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (352, 1, '许钱蒋杨韩陈王', '许钱蒋杨韩陈王', '00', '329@qq.com', '131329', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (353, 1, '秦冯李冯许李许', '秦冯李冯许李许', '00', '330@qq.com', '131330', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (354, 1, '赵钱韩朱陈赵王', '赵钱韩朱陈赵王', '00', '331@qq.com', '131331', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (355, 1, '李沈褚冯孙钱周', '李沈褚冯孙钱周', '00', '332@qq.com', '131332', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (356, 1, '朱钱朱孙赵许钱', '朱钱朱孙赵许钱', '00', '333@qq.com', '131333', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (357, 1, '沈蒋许吴沈孙褚', '沈蒋许吴沈孙褚', '00', '334@qq.com', '131334', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (358, 1, '韩赵李冯沈许卫', '韩赵李冯沈许卫', '00', '335@qq.com', '131335', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (359, 1, '孙王许卫杨褚周', '孙王许卫杨褚周', '00', '336@qq.com', '131336', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (360, 1, '许赵杨卫吴朱冯', '许赵杨卫吴朱冯', '00', '337@qq.com', '131337', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (361, 1, '王王赵周赵周孙', '王王赵周赵周孙', '00', '338@qq.com', '131338', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (362, 1, '陈尤钱王尤尤卫', '陈尤钱王尤尤卫', '00', '339@qq.com', '131339', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (363, 1, '郑蒋卫卫孙朱陈', '郑蒋卫卫孙朱陈', '00', '340@qq.com', '131340', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (364, 1, '陈吴钱沈褚吴吴', '陈吴钱沈褚吴吴', '00', '341@qq.com', '131341', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (365, 1, '赵朱卫钱冯韩赵', '赵朱卫钱冯韩赵', '00', '342@qq.com', '131342', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (366, 1, '卫卫朱沈钱钱钱', '卫卫朱沈钱钱钱', '00', '343@qq.com', '131343', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (367, 1, '周朱冯卫卫孙朱', '周朱冯卫卫孙朱', '00', '344@qq.com', '131344', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (368, 1, '杨吴韩郑卫韩郑', '杨吴韩郑卫韩郑', '00', '345@qq.com', '131345', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (369, 1, '韩郑孙钱郑周许', '韩郑孙钱郑周许', '00', '346@qq.com', '131346', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (370, 1, '赵蒋许李尤李褚', '赵蒋许李尤李褚', '00', '347@qq.com', '131347', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (371, 1, '秦褚赵朱朱尤杨', '秦褚赵朱朱尤杨', '00', '348@qq.com', '131348', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (372, 1, '郑秦冯孙钱许王', '郑秦冯孙钱许王', '00', '349@qq.com', '131349', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (373, 1, '钱褚韩赵吴周冯', '钱褚韩赵吴周冯', '00', '350@qq.com', '131350', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (374, 1, '冯蒋朱钱钱沈孙', '冯蒋朱钱钱沈孙', '00', '351@qq.com', '131351', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (375, 1, '冯卫郑冯郑许杨', '冯卫郑冯郑许杨', '00', '352@qq.com', '131352', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (376, 1, '蒋蒋许秦钱赵褚', '蒋蒋许秦钱赵褚', '00', '353@qq.com', '131353', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (377, 1, '褚赵尤吴钱秦杨', '褚赵尤吴钱秦杨', '00', '354@qq.com', '131354', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (378, 1, '周赵许沈秦李李', '周赵许沈秦李李', '00', '355@qq.com', '131355', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (379, 1, '钱冯吴秦孙陈周', '钱冯吴秦孙陈周', '00', '356@qq.com', '131356', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (380, 1, '郑赵许杨秦蒋尤', '郑赵许杨秦蒋尤', '00', '357@qq.com', '131357', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (381, 1, '李周许秦郑冯朱', '李周许秦郑冯朱', '00', '358@qq.com', '131358', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (382, 1, '杨褚孙朱郑杨冯', '杨褚孙朱郑杨冯', '00', '359@qq.com', '131359', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (383, 1, '韩沈蒋冯赵许孙', '韩沈蒋冯赵许孙', '00', '360@qq.com', '131360', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (384, 1, '郑沈周钱钱冯朱', '郑沈周钱钱冯朱', '00', '361@qq.com', '131361', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (385, 1, '秦秦许褚褚王卫', '秦秦许褚褚王卫', '00', '362@qq.com', '131362', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (386, 1, '韩朱吴尤吴卫吴', '韩朱吴尤吴卫吴', '00', '363@qq.com', '131363', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (387, 1, '许钱朱沈李韩钱', '许钱朱沈李韩钱', '00', '364@qq.com', '131364', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (388, 1, '尤沈许褚沈蒋朱', '尤沈许褚沈蒋朱', '00', '365@qq.com', '131365', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (389, 1, '王孙李卫秦尤朱', '王孙李卫秦尤朱', '00', '366@qq.com', '131366', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (390, 1, '朱孙吴周陈钱李', '朱孙吴周陈钱李', '00', '367@qq.com', '131367', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (391, 1, '赵朱孙周王沈钱', '赵朱孙周王沈钱', '00', '368@qq.com', '131368', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (392, 1, '褚陈李吴许尤王', '褚陈李吴许尤王', '00', '369@qq.com', '131369', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (393, 1, '王孙赵冯蒋周钱', '王孙赵冯蒋周钱', '00', '370@qq.com', '131370', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (394, 1, '朱卫冯朱卫陈秦', '朱卫冯朱卫陈秦', '00', '371@qq.com', '131371', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (395, 1, '孙韩李王钱陈朱', '孙韩李王钱陈朱', '00', '372@qq.com', '131372', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (396, 1, '周钱许钱吴冯卫', '周钱许钱吴冯卫', '00', '373@qq.com', '131373', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (397, 1, '秦沈周冯赵周蒋', '秦沈周冯赵周蒋', '00', '374@qq.com', '131374', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (398, 1, '蒋郑赵蒋周韩李', '蒋郑赵蒋周韩李', '00', '375@qq.com', '131375', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (399, 1, '孙褚朱尤朱朱秦', '孙褚朱尤朱朱秦', '00', '376@qq.com', '131376', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (400, 1, '郑许褚郑陈褚尤', '郑许褚郑陈褚尤', '00', '377@qq.com', '131377', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (401, 1, '孙许沈陈朱赵孙', '孙许沈陈朱赵孙', '00', '378@qq.com', '131378', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (402, 1, '卫陈杨陈吴冯朱', '卫陈杨陈吴冯朱', '00', '379@qq.com', '131379', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (403, 1, '朱孙许韩吴冯李', '朱孙许韩吴冯李', '00', '380@qq.com', '131380', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (404, 1, '卫陈韩许李王杨', '卫陈韩许李王杨', '00', '381@qq.com', '131381', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (405, 1, '卫许卫韩尤卫钱', '卫许卫韩尤卫钱', '00', '382@qq.com', '131382', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (406, 1, '郑秦朱许郑沈许', '郑秦朱许郑沈许', '00', '383@qq.com', '131383', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (407, 1, '钱卫朱许褚褚沈', '钱卫朱许褚褚沈', '00', '384@qq.com', '131384', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (408, 1, '吴孙郑冯褚杨许', '吴孙郑冯褚杨许', '00', '385@qq.com', '131385', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (409, 1, '韩韩吴赵陈杨陈', '韩韩吴赵陈杨陈', '00', '386@qq.com', '131386', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (410, 1, '钱周沈韩李孙蒋', '钱周沈韩李孙蒋', '00', '387@qq.com', '131387', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (411, 1, '冯卫周韩李冯韩', '冯卫周韩李冯韩', '00', '388@qq.com', '131388', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (412, 1, '卫孙尤许王沈蒋', '卫孙尤许王沈蒋', '00', '389@qq.com', '131389', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (413, 1, '尤吴沈杨许秦蒋', '尤吴沈杨许秦蒋', '00', '390@qq.com', '131390', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (414, 1, '蒋陈秦褚李孙王', '蒋陈秦褚李孙王', '00', '391@qq.com', '131391', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (415, 1, '李周杨杨韩朱钱', '李周杨杨韩朱钱', '00', '392@qq.com', '131392', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (416, 1, '韩沈沈沈吴郑王', '韩沈沈沈吴郑王', '00', '393@qq.com', '131393', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (417, 1, '赵王韩郑许钱沈', '赵王韩郑许钱沈', '00', '394@qq.com', '131394', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (418, 1, '沈陈吴沈蒋李王', '沈陈吴沈蒋李王', '00', '395@qq.com', '131395', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (419, 1, '赵朱冯韩钱赵李', '赵朱冯韩钱赵李', '00', '396@qq.com', '131396', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (420, 1, '郑孙李褚王许孙', '郑孙李褚王许孙', '00', '397@qq.com', '131397', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (421, 1, '周周钱钱杨吴尤', '周周钱钱杨吴尤', '00', '398@qq.com', '131398', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (422, 1, '卫朱朱韩杨褚杨', '卫朱朱韩杨褚杨', '00', '399@qq.com', '131399', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (423, 1, '吴尤秦许钱李褚', '吴尤秦许钱李褚', '00', '400@qq.com', '131400', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (424, 1, '孙卫许孙沈郑褚', '孙卫许孙沈郑褚', '00', '401@qq.com', '131401', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (425, 1, '周尤钱吴赵褚尤', '周尤钱吴赵褚尤', '00', '402@qq.com', '131402', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (426, 1, '杨李韩秦陈赵钱', '杨李韩秦陈赵钱', '00', '403@qq.com', '131403', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (427, 1, '王韩郑杨韩尤郑', '王韩郑杨韩尤郑', '00', '404@qq.com', '131404', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (428, 1, '吴朱孙王陈周郑', '吴朱孙王陈周郑', '00', '405@qq.com', '131405', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (429, 1, '郑李孙卫吴周秦', '郑李孙卫吴周秦', '00', '406@qq.com', '131406', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (430, 1, '许李钱朱秦褚冯', '许李钱朱秦褚冯', '00', '407@qq.com', '131407', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (431, 1, '杨钱郑褚吴陈王', '杨钱郑褚吴陈王', '00', '408@qq.com', '131408', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (432, 1, '王朱王蒋赵郑韩', '王朱王蒋赵郑韩', '00', '409@qq.com', '131409', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (433, 1, '卫陈孙李杨吴杨', '卫陈孙李杨吴杨', '00', '410@qq.com', '131410', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (434, 1, '郑秦朱冯杨吴王', '郑秦朱冯杨吴王', '00', '411@qq.com', '131411', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (435, 1, '郑钱韩卫秦周钱', '郑钱韩卫秦周钱', '00', '412@qq.com', '131412', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (436, 1, '吴孙孙王赵许杨', '吴孙孙王赵许杨', '00', '413@qq.com', '131413', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (437, 1, '郑郑沈许吴蒋褚', '郑郑沈许吴蒋褚', '00', '414@qq.com', '131414', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (438, 1, '吴陈卫朱朱陈尤', '吴陈卫朱朱陈尤', '00', '415@qq.com', '131415', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (439, 1, '王郑王周周褚蒋', '王郑王周周褚蒋', '00', '416@qq.com', '131416', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (440, 1, '韩杨冯王吴杨蒋', '韩杨冯王吴杨蒋', '00', '417@qq.com', '131417', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (441, 1, '赵杨李王钱蒋周', '赵杨李王钱蒋周', '00', '418@qq.com', '131418', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (442, 1, '朱钱冯杨王杨孙', '朱钱冯杨王杨孙', '00', '419@qq.com', '131419', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (443, 1, '李蒋沈冯杨钱赵', '李蒋沈冯杨钱赵', '00', '420@qq.com', '131420', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (444, 1, '郑韩朱李钱孙陈', '郑韩朱李钱孙陈', '00', '421@qq.com', '131421', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (445, 1, '冯褚蒋孙韩沈尤', '冯褚蒋孙韩沈尤', '00', '422@qq.com', '131422', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (446, 1, '许韩周李杨蒋秦', '许韩周李杨蒋秦', '00', '423@qq.com', '131423', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (447, 1, '朱蒋吴许赵孙冯', '朱蒋吴许赵孙冯', '00', '424@qq.com', '131424', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (448, 1, '郑蒋褚蒋李尤钱', '郑蒋褚蒋李尤钱', '00', '425@qq.com', '131425', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (449, 1, '沈钱韩尤秦秦赵', '沈钱韩尤秦秦赵', '00', '426@qq.com', '131426', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (450, 1, '沈钱许周郑冯卫', '沈钱许周郑冯卫', '00', '427@qq.com', '131427', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (451, 1, '尤陈吴秦李冯王', '尤陈吴秦李冯王', '00', '428@qq.com', '131428', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (452, 1, '王周许赵沈吴褚', '王周许赵沈吴褚', '00', '429@qq.com', '131429', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (453, 1, '陈孙卫许沈卫许', '陈孙卫许沈卫许', '00', '430@qq.com', '131430', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (454, 1, '陈卫李郑赵沈钱', '陈卫李郑赵沈钱', '00', '431@qq.com', '131431', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (455, 1, '赵陈陈许许秦卫', '赵陈陈许许秦卫', '00', '432@qq.com', '131432', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (456, 1, '杨沈陈沈许李吴', '杨沈陈沈许李吴', '00', '433@qq.com', '131433', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (457, 1, '王郑褚赵李沈褚', '王郑褚赵李沈褚', '00', '434@qq.com', '131434', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (458, 1, '吴韩许秦赵尤赵', '吴韩许秦赵尤赵', '00', '435@qq.com', '131435', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (459, 1, '蒋吴郑沈李朱秦', '蒋吴郑沈李朱秦', '00', '436@qq.com', '131436', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (460, 1, '孙吴吴秦许李周', '孙吴吴秦许李周', '00', '437@qq.com', '131437', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (461, 1, '秦尤周陈许褚陈', '秦尤周陈许褚陈', '00', '438@qq.com', '131438', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (462, 1, '秦李褚钱周杨周', '秦李褚钱周杨周', '00', '439@qq.com', '131439', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (463, 1, '钱周沈沈韩朱韩', '钱周沈沈韩朱韩', '00', '440@qq.com', '131440', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (464, 1, '钱韩赵许周王韩', '钱韩赵许周王韩', '00', '441@qq.com', '131441', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (465, 1, '周李赵褚褚杨周', '周李赵褚褚杨周', '00', '442@qq.com', '131442', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (466, 1, '尤杨陈朱褚李郑', '尤杨陈朱褚李郑', '00', '443@qq.com', '131443', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (467, 1, '卫李沈钱周钱周', '卫李沈钱周钱周', '00', '444@qq.com', '131444', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (468, 1, '杨孙朱赵韩韩周', '杨孙朱赵韩韩周', '00', '445@qq.com', '131445', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (469, 1, '周蒋尤钱赵孙沈', '周蒋尤钱赵孙沈', '00', '446@qq.com', '131446', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (470, 1, '沈周孙蒋沈杨周', '沈周孙蒋沈杨周', '00', '447@qq.com', '131447', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (471, 1, '冯沈孙尤卫孙王', '冯沈孙尤卫孙王', '00', '448@qq.com', '131448', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (472, 1, '卫沈李许秦朱蒋', '卫沈李许秦朱蒋', '00', '449@qq.com', '131449', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (473, 1, '李卫陈尤朱秦杨', '李卫陈尤朱秦杨', '00', '450@qq.com', '131450', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (474, 1, '朱沈尤朱吴秦郑', '朱沈尤朱吴秦郑', '00', '451@qq.com', '131451', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (475, 1, '卫王尤褚吴郑李', '卫王尤褚吴郑李', '00', '452@qq.com', '131452', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (476, 1, '郑孙王褚韩陈钱', '郑孙王褚韩陈钱', '00', '453@qq.com', '131453', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (477, 1, '周孙吴陈冯赵周', '周孙吴陈冯赵周', '00', '454@qq.com', '131454', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (478, 1, '陈沈王赵杨冯李', '陈沈王赵杨冯李', '00', '455@qq.com', '131455', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (479, 1, '吴陈钱钱褚郑周', '吴陈钱钱褚郑周', '00', '456@qq.com', '131456', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (480, 1, '郑周周褚尤李郑', '郑周周褚尤李郑', '00', '457@qq.com', '131457', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (481, 1, '蒋陈王尤李周李', '蒋陈王尤李周李', '00', '458@qq.com', '131458', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (482, 1, '吴卫赵杨朱许钱', '吴卫赵杨朱许钱', '00', '459@qq.com', '131459', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (483, 1, '朱蒋周孙陈卫冯', '朱蒋周孙陈卫冯', '00', '460@qq.com', '131460', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (484, 1, '卫尤李蒋卫秦吴', '卫尤李蒋卫秦吴', '00', '461@qq.com', '131461', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (485, 1, '孙褚韩韩秦韩韩', '孙褚韩韩秦韩韩', '00', '462@qq.com', '131462', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (486, 1, '王赵周尤许吴周', '王赵周尤许吴周', '00', '463@qq.com', '131463', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (487, 1, '韩褚韩冯孙朱赵', '韩褚韩冯孙朱赵', '00', '464@qq.com', '131464', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (488, 1, '蒋许尤冯韩李周', '蒋许尤冯韩李周', '00', '465@qq.com', '131465', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (489, 1, '卫周沈沈陈韩韩', '卫周沈沈陈韩韩', '00', '466@qq.com', '131466', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (490, 1, '周褚周陈蒋吴杨', '周褚周陈蒋吴杨', '00', '467@qq.com', '131467', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (491, 1, '褚沈赵郑钱沈冯', '褚沈赵郑钱沈冯', '00', '468@qq.com', '131468', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (492, 1, '韩褚钱褚李卫陈', '韩褚钱褚李卫陈', '00', '469@qq.com', '131469', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (493, 1, '王尤朱吴沈陈李', '王尤朱吴沈陈李', '00', '470@qq.com', '131470', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (494, 1, '赵尤韩尤卫褚蒋', '赵尤韩尤卫褚蒋', '00', '471@qq.com', '131471', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (495, 1, '钱许孙秦周王王', '钱许孙秦周王王', '00', '472@qq.com', '131472', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (496, 1, '冯王郑杨沈周周', '冯王郑杨沈周周', '00', '473@qq.com', '131473', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (497, 1, '孙李周卫卫秦沈', '孙李周卫卫秦沈', '00', '474@qq.com', '131474', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (498, 1, '秦褚李朱郑郑李', '秦褚李朱郑郑李', '00', '475@qq.com', '131475', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (499, 1, '秦郑杨尤杨郑沈', '秦郑杨尤杨郑沈', '00', '476@qq.com', '131476', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (500, 1, '孙沈秦钱褚蒋尤', '孙沈秦钱褚蒋尤', '00', '477@qq.com', '131477', '0', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (501, 1, '孙郑韩冯杨赵秦', '孙郑韩冯杨赵秦', '00', '478@qq.com', '131478', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (502, 1, '朱李杨钱褚朱许', '朱李杨钱褚朱许', '00', '479@qq.com', '131479', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (503, 1, '郑蒋陈郑陈李陈', '郑蒋陈郑陈李陈', '00', '480@qq.com', '131480', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (504, 1, '周赵陈蒋褚郑杨', '周赵陈蒋褚郑杨', '00', '481@qq.com', '131481', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (505, 1, '秦陈冯吴蒋褚许', '秦陈冯吴蒋褚许', '00', '482@qq.com', '131482', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (506, 1, '杨沈吴褚韩周陈', '杨沈吴褚韩周陈', '00', '483@qq.com', '131483', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (507, 1, '冯王王尤冯陈赵', '冯王王尤冯陈赵', '00', '484@qq.com', '131484', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (508, 1, '郑王郑韩尤钱蒋', '郑王郑韩尤钱蒋', '00', '485@qq.com', '131485', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (509, 1, '李韩杨褚赵蒋钱', '李韩杨褚赵蒋钱', '00', '486@qq.com', '131486', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (510, 1, '秦钱卫陈褚周尤', '秦钱卫陈褚周尤', '00', '487@qq.com', '131487', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (511, 1, '周王沈尤钱王周', '周王沈尤钱王周', '00', '488@qq.com', '131488', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (512, 1, '尤韩李郑孙冯李', '尤韩李郑孙冯李', '00', '489@qq.com', '131489', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (513, 1, '许郑冯李秦卫李', '许郑冯李秦卫李', '00', '490@qq.com', '131490', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (514, 1, '杨蒋韩赵王王尤', '杨蒋韩赵王王尤', '00', '491@qq.com', '131491', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (515, 1, '尤尤钱陈孙许蒋', '尤尤钱陈孙许蒋', '00', '492@qq.com', '131492', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (516, 1, '赵尤郑吴秦陈蒋', '赵尤郑吴秦陈蒋', '00', '493@qq.com', '131493', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (517, 1, '王许杨褚冯钱孙', '王许杨褚冯钱孙', '00', '494@qq.com', '131494', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (518, 1, '赵许孙吴蒋许尤', '赵许孙吴蒋许尤', '00', '495@qq.com', '131495', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (519, 1, '李郑沈韩褚李钱', '李郑沈韩褚李钱', '00', '496@qq.com', '131496', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (520, 1, '褚许冯郑孙赵赵', '褚许冯郑孙赵赵', '00', '497@qq.com', '131497', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (521, 1, '赵孙吴冯朱朱孙', '赵孙吴冯朱朱孙', '00', '498@qq.com', '131498', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (522, 1, '沈钱杨钱沈秦卫', '沈钱杨钱沈秦卫', '00', '499@qq.com', '131499', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (523, 1, '郑沈李朱杨韩许', '郑沈李朱杨韩许', '00', '500@qq.com', '131500', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (524, 1, '冯孙许吴秦卫李', '冯孙许吴秦卫李', '00', '501@qq.com', '131501', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (525, 1, '冯韩赵孙杨郑王', '冯韩赵孙杨郑王', '00', '502@qq.com', '131502', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (526, 1, '蒋许吴尤孙卫吴', '蒋许吴尤孙卫吴', '00', '503@qq.com', '131503', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (527, 1, '冯韩李孙钱吴朱', '冯韩李孙钱吴朱', '00', '504@qq.com', '131504', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (528, 1, '卫周赵许赵吴韩', '卫周赵许赵吴韩', '00', '505@qq.com', '131505', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (529, 1, '朱陈冯蒋蒋周褚', '朱陈冯蒋蒋周褚', '00', '506@qq.com', '131506', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (530, 1, '吴杨李杨孙韩杨', '吴杨李杨孙韩杨', '00', '507@qq.com', '131507', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (531, 1, '郑李秦赵孙卫沈', '郑李秦赵孙卫沈', '00', '508@qq.com', '131508', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (532, 1, '沈冯褚孙蒋杨冯', '沈冯褚孙蒋杨冯', '00', '509@qq.com', '131509', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (533, 1, '秦钱郑朱钱秦李', '秦钱郑朱钱秦李', '00', '510@qq.com', '131510', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (534, 1, '沈李秦秦陈杨孙', '沈李秦秦陈杨孙', '00', '511@qq.com', '131511', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (535, 1, '朱陈陈杨朱朱蒋', '朱陈陈杨朱朱蒋', '00', '512@qq.com', '131512', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (536, 1, '朱蒋王钱尤沈孙', '朱蒋王钱尤沈孙', '00', '513@qq.com', '131513', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (537, 1, '赵陈韩郑秦尤李', '赵陈韩郑秦尤李', '00', '514@qq.com', '131514', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (538, 1, '卫钱杨郑陈韩秦', '卫钱杨郑陈韩秦', '00', '515@qq.com', '131515', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (539, 1, '陈秦李孙孙杨李', '陈秦李孙孙杨李', '00', '516@qq.com', '131516', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (540, 1, '孙钱吴郑钱吴赵', '孙钱吴郑钱吴赵', '00', '517@qq.com', '131517', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (541, 1, '陈朱郑吴王蒋王', '陈朱郑吴王蒋王', '00', '518@qq.com', '131518', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (542, 1, '许陈秦冯沈许周', '许陈秦冯沈许周', '00', '519@qq.com', '131519', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (543, 1, '冯尤李蒋杨郑褚', '冯尤李蒋杨郑褚', '00', '520@qq.com', '131520', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (544, 1, '朱朱李吴卫韩尤', '朱朱李吴卫韩尤', '00', '521@qq.com', '131521', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (545, 1, '秦孙尤吴杨李蒋', '秦孙尤吴杨李蒋', '00', '522@qq.com', '131522', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (546, 1, '赵尤蒋卫郑李冯', '赵尤蒋卫郑李冯', '00', '523@qq.com', '131523', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (547, 1, '吴周陈王蒋孙陈', '吴周陈王蒋孙陈', '00', '524@qq.com', '131524', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (548, 1, '卫冯韩钱许褚钱', '卫冯韩钱许褚钱', '00', '525@qq.com', '131525', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (549, 1, '蒋李卫周吴赵秦', '蒋李卫周吴赵秦', '00', '526@qq.com', '131526', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (550, 1, '周尤王冯尤王郑', '周尤王冯尤王郑', '00', '527@qq.com', '131527', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (551, 1, '孙周吴王钱郑郑', '孙周吴王钱郑郑', '00', '528@qq.com', '131528', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (552, 1, '周沈秦许周孙李', '周沈秦许周孙李', '00', '529@qq.com', '131529', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (553, 1, '钱王赵秦冯蒋吴', '钱王赵秦冯蒋吴', '00', '530@qq.com', '131530', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (554, 1, '沈韩孙赵王陈沈', '沈韩孙赵王陈沈', '00', '531@qq.com', '131531', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (555, 1, '王郑孙许许褚赵', '王郑孙许许褚赵', '00', '532@qq.com', '131532', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (556, 1, '钱吴吴钱李许孙', '钱吴吴钱李许孙', '00', '533@qq.com', '131533', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (557, 1, '尤蒋钱王杨陈朱', '尤蒋钱王杨陈朱', '00', '534@qq.com', '131534', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (558, 1, '陈周郑李韩钱孙', '陈周郑李韩钱孙', '00', '535@qq.com', '131535', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (559, 1, '钱卫钱冯周冯赵', '钱卫钱冯周冯赵', '00', '536@qq.com', '131536', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (560, 1, '许杨尤韩陈冯吴', '许杨尤韩陈冯吴', '00', '537@qq.com', '131537', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (561, 1, '许杨孙吴郑钱尤', '许杨孙吴郑钱尤', '00', '538@qq.com', '131538', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (562, 1, '李杨尤褚沈孙褚', '李杨尤褚沈孙褚', '00', '539@qq.com', '131539', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (563, 1, '朱朱蒋蒋韩陈许', '朱朱蒋蒋韩陈许', '00', '540@qq.com', '131540', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (564, 1, '郑陈钱沈钱钱陈', '郑陈钱沈钱钱陈', '00', '541@qq.com', '131541', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (565, 1, '吴郑褚杨韩王卫', '吴郑褚杨韩王卫', '00', '542@qq.com', '131542', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (566, 1, '朱郑秦孙吴钱郑', '朱郑秦孙吴钱郑', '00', '543@qq.com', '131543', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (567, 1, '冯吴孙孙周吴孙', '冯吴孙孙周吴孙', '00', '544@qq.com', '131544', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (568, 1, '王卫吴尤许尤陈', '王卫吴尤许尤陈', '00', '545@qq.com', '131545', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (569, 1, '冯许朱孙李陈许', '冯许朱孙李陈许', '00', '546@qq.com', '131546', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (570, 1, '韩李陈孙蒋孙朱', '韩李陈孙蒋孙朱', '00', '547@qq.com', '131547', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (571, 1, '孙郑褚陈褚赵钱', '孙郑褚陈褚赵钱', '00', '548@qq.com', '131548', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (572, 1, '尤许王蒋陈蒋沈', '尤许王蒋陈蒋沈', '00', '549@qq.com', '131549', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (573, 1, '卫周冯孙尤赵卫', '卫周冯孙尤赵卫', '00', '550@qq.com', '131550', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (574, 1, '秦褚褚吴李李沈', '秦褚褚吴李李沈', '00', '551@qq.com', '131551', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (575, 1, '赵朱冯韩陈尤李', '赵朱冯韩陈尤李', '00', '552@qq.com', '131552', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (576, 1, '冯冯吴周王蒋朱', '冯冯吴周王蒋朱', '00', '553@qq.com', '131553', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (577, 1, '陈褚吴周卫郑王', '陈褚吴周卫郑王', '00', '554@qq.com', '131554', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (578, 1, '周王周许朱秦沈', '周王周许朱秦沈', '00', '555@qq.com', '131555', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (579, 1, '陈杨王秦吴杨冯', '陈杨王秦吴杨冯', '00', '556@qq.com', '131556', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (580, 1, '钱冯李周周吴沈', '钱冯李周周吴沈', '00', '557@qq.com', '131557', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (581, 1, '赵孙杨王李李王', '赵孙杨王李李王', '00', '558@qq.com', '131558', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (582, 1, '蒋冯许杨孙冯朱', '蒋冯许杨孙冯朱', '00', '559@qq.com', '131559', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (583, 1, '吴杨冯朱郑褚秦', '吴杨冯朱郑褚秦', '00', '560@qq.com', '131560', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (584, 1, '钱沈尤周吴褚陈', '钱沈尤周吴褚陈', '00', '561@qq.com', '131561', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (585, 1, '钱韩褚褚秦钱蒋', '钱韩褚褚秦钱蒋', '00', '562@qq.com', '131562', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (586, 1, '孙陈卫王褚蒋王', '孙陈卫王褚蒋王', '00', '563@qq.com', '131563', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (587, 1, '冯钱冯李杨杨李', '冯钱冯李杨杨李', '00', '564@qq.com', '131564', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (588, 1, '蒋尤冯孙朱沈沈', '蒋尤冯孙朱沈沈', '00', '565@qq.com', '131565', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (589, 1, '周秦王尤褚王许', '周秦王尤褚王许', '00', '566@qq.com', '131566', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (590, 1, '许赵赵秦李韩褚', '许赵赵秦李韩褚', '00', '567@qq.com', '131567', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (591, 1, '王陈尤王沈尤吴', '王陈尤王沈尤吴', '00', '568@qq.com', '131568', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (592, 1, '蒋卫孙蒋许蒋褚', '蒋卫孙蒋许蒋褚', '00', '569@qq.com', '131569', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (593, 1, '秦陈秦吴周韩秦', '秦陈秦吴周韩秦', '00', '570@qq.com', '131570', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (594, 1, '孙沈周钱孙许李', '孙沈周钱孙许李', '00', '571@qq.com', '131571', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (595, 1, '郑杨冯李褚尤褚', '郑杨冯李褚尤褚', '00', '572@qq.com', '131572', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (596, 1, '沈秦许许尤钱秦', '沈秦许许尤钱秦', '00', '573@qq.com', '131573', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (597, 1, '褚周尤周李杨王', '褚周尤周李杨王', '00', '574@qq.com', '131574', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (598, 1, '孙秦卫蒋韩周冯', '孙秦卫蒋韩周冯', '00', '575@qq.com', '131575', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (599, 1, '杨陈尤郑朱郑郑', '杨陈尤郑朱郑郑', '00', '576@qq.com', '131576', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (600, 1, '韩陈郑蒋王孙蒋', '韩陈郑蒋王孙蒋', '00', '577@qq.com', '131577', '1', '', '123', '0', '0', '', NULL, '', '2022-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (601, 1, '褚冯褚陈尤郑孙', '褚冯褚陈尤郑孙', '00', '578@qq.com', '131578', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (602, 1, '郑周郑褚许褚卫', '郑周郑褚许褚卫', '00', '579@qq.com', '131579', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (603, 1, '尤许沈韩陈郑韩', '尤许沈韩陈郑韩', '00', '580@qq.com', '131580', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (604, 1, '吴蒋钱王褚周卫', '吴蒋钱王褚周卫', '00', '581@qq.com', '131581', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (605, 1, '李卫褚孙沈许许', '李卫褚孙沈许许', '00', '582@qq.com', '131582', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (606, 1, '朱许孙李韩李李', '朱许孙李韩李李', '00', '583@qq.com', '131583', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (607, 1, '李尤钱冯陈褚吴', '李尤钱冯陈褚吴', '00', '584@qq.com', '131584', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (608, 1, '尤秦韩王钱韩李', '尤秦韩王钱韩李', '00', '585@qq.com', '131585', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (609, 1, '尤沈王钱褚王朱', '尤沈王钱褚王朱', '00', '586@qq.com', '131586', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (610, 1, '褚周郑韩李许秦', '褚周郑韩李许秦', '00', '587@qq.com', '131587', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (611, 1, '李卫尤许冯沈秦', '李卫尤许冯沈秦', '00', '588@qq.com', '131588', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (612, 1, '周郑赵朱冯吴周', '周郑赵朱冯吴周', '00', '589@qq.com', '131589', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (613, 1, '尤周褚卫秦赵秦', '尤周褚卫秦赵秦', '00', '590@qq.com', '131590', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (614, 1, '卫吴尤朱孙陈杨', '卫吴尤朱孙陈杨', '00', '591@qq.com', '131591', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (615, 1, '孙褚李吴杨秦杨', '孙褚李吴杨秦杨', '00', '592@qq.com', '131592', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (616, 1, '沈钱韩钱赵褚褚', '沈钱韩钱赵褚褚', '00', '593@qq.com', '131593', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (617, 1, '孙蒋蒋冯许秦沈', '孙蒋蒋冯许秦沈', '00', '594@qq.com', '131594', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (618, 1, '蒋许周郑朱秦钱', '蒋许周郑朱秦钱', '00', '595@qq.com', '131595', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (619, 1, '王杨孙卫朱蒋郑', '王杨孙卫朱蒋郑', '00', '596@qq.com', '131596', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (620, 1, '李蒋钱王卫尤褚', '李蒋钱王卫尤褚', '00', '597@qq.com', '131597', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (621, 1, '沈钱郑秦周尤尤', '沈钱郑秦周尤尤', '00', '598@qq.com', '131598', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (622, 1, '王沈周朱李沈卫', '王沈周朱李沈卫', '00', '599@qq.com', '131599', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (623, 1, '赵吴陈李沈周钱', '赵吴陈李沈周钱', '00', '600@qq.com', '131600', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (624, 1, '沈韩褚卫尤卫秦', '沈韩褚卫尤卫秦', '00', '601@qq.com', '131601', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (625, 1, '许杨卫郑孙孙杨', '许杨卫郑孙孙杨', '00', '602@qq.com', '131602', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (626, 1, '杨李秦孙褚褚蒋', '杨李秦孙褚褚蒋', '00', '603@qq.com', '131603', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (627, 1, '李周吴钱韩钱钱', '李周吴钱韩钱钱', '00', '604@qq.com', '131604', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (628, 1, '李李许冯王卫卫', '李李许冯王卫卫', '00', '605@qq.com', '131605', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (629, 1, '周秦钱吴朱冯吴', '周秦钱吴朱冯吴', '00', '606@qq.com', '131606', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (630, 1, '钱吴杨赵卫卫杨', '钱吴杨赵卫卫杨', '00', '607@qq.com', '131607', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (631, 1, '朱尤韩杨赵孙李', '朱尤韩杨赵孙李', '00', '608@qq.com', '131608', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (632, 1, '韩郑钱钱许冯孙', '韩郑钱钱许冯孙', '00', '609@qq.com', '131609', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (633, 1, '赵尤孙陈韩许沈', '赵尤孙陈韩许沈', '00', '610@qq.com', '131610', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (634, 1, '周朱朱孙朱褚赵', '周朱朱孙朱褚赵', '00', '611@qq.com', '131611', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (635, 1, '钱周李吴蒋孙周', '钱周李吴蒋孙周', '00', '612@qq.com', '131612', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (636, 1, '许杨褚韩沈赵蒋', '许杨褚韩沈赵蒋', '00', '613@qq.com', '131613', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (637, 1, '沈沈陈赵郑陈尤', '沈沈陈赵郑陈尤', '00', '614@qq.com', '131614', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (638, 1, '杨秦孙陈郑钱李', '杨秦孙陈郑钱李', '00', '615@qq.com', '131615', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (639, 1, '蒋韩朱王孙沈陈', '蒋韩朱王孙沈陈', '00', '616@qq.com', '131616', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (640, 1, '褚周许尤杨郑尤', '褚周许尤杨郑尤', '00', '617@qq.com', '131617', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (641, 1, '韩杨郑尤韩周赵', '韩杨郑尤韩周赵', '00', '618@qq.com', '131618', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (642, 1, '孙孙卫蒋卫卫尤', '孙孙卫蒋卫卫尤', '00', '619@qq.com', '131619', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (643, 1, '周秦卫钱褚杨褚', '周秦卫钱褚杨褚', '00', '620@qq.com', '131620', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (644, 1, '沈杨李韩卫吴李', '沈杨李韩卫吴李', '00', '621@qq.com', '131621', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (645, 1, '秦王褚秦钱冯孙', '秦王褚秦钱冯孙', '00', '622@qq.com', '131622', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (646, 1, '李冯王韩朱郑韩', '李冯王韩朱郑韩', '00', '623@qq.com', '131623', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (647, 1, '钱孙尤孙王吴钱', '钱孙尤孙王吴钱', '00', '624@qq.com', '131624', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (648, 1, '周韩韩朱褚李周', '周韩韩朱褚李周', '00', '625@qq.com', '131625', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (649, 1, '冯李秦蒋杨陈许', '冯李秦蒋杨陈许', '00', '626@qq.com', '131626', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (650, 1, '赵周王郑李卫蒋', '赵周王郑李卫蒋', '00', '627@qq.com', '131627', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (651, 1, '王沈孙秦陈孙朱', '王沈孙秦陈孙朱', '00', '628@qq.com', '131628', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (652, 1, '陈卫秦吴沈韩沈', '陈卫秦吴沈韩沈', '00', '629@qq.com', '131629', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (653, 1, '吴赵王陈周许秦', '吴赵王陈周许秦', '00', '630@qq.com', '131630', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (654, 1, '蒋郑秦许沈韩朱', '蒋郑秦许沈韩朱', '00', '631@qq.com', '131631', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (655, 1, '冯王韩周吴钱郑', '冯王韩周吴钱郑', '00', '632@qq.com', '131632', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (656, 1, '吴韩李秦陈王王', '吴韩李秦陈王王', '00', '633@qq.com', '131633', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (657, 1, '韩韩王沈杨陈许', '韩韩王沈杨陈许', '00', '634@qq.com', '131634', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (658, 1, '冯吴许钱李秦赵', '冯吴许钱李秦赵', '00', '635@qq.com', '131635', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (659, 1, '卫朱尤吴褚陈秦', '卫朱尤吴褚陈秦', '00', '636@qq.com', '131636', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (660, 1, '陈周朱王周赵蒋', '陈周朱王周赵蒋', '00', '637@qq.com', '131637', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (661, 1, '尤蒋沈卫许钱周', '尤蒋沈卫许钱周', '00', '638@qq.com', '131638', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (662, 1, '杨钱郑沈周王韩', '杨钱郑沈周王韩', '00', '639@qq.com', '131639', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (663, 1, '王许孙李杨尤尤', '王许孙李杨尤尤', '00', '640@qq.com', '131640', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (664, 1, '李尤沈韩陈钱杨', '李尤沈韩陈钱杨', '00', '641@qq.com', '131641', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (665, 1, '王许王吴吴李许', '王许王吴吴李许', '00', '642@qq.com', '131642', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (666, 1, '周沈孙卫尤吴卫', '周沈孙卫尤吴卫', '00', '643@qq.com', '131643', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (667, 1, '沈秦吴李卫许郑', '沈秦吴李卫许郑', '00', '644@qq.com', '131644', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (668, 1, '钱杨韩许王周钱', '钱杨韩许王周钱', '00', '645@qq.com', '131645', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (669, 1, '孙周郑孙许杨赵', '孙周郑孙许杨赵', '00', '646@qq.com', '131646', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (670, 1, '许尤冯杨蒋沈朱', '许尤冯杨蒋沈朱', '00', '647@qq.com', '131647', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (671, 1, '郑朱尤卫李陈赵', '郑朱尤卫李陈赵', '00', '648@qq.com', '131648', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (672, 1, '冯郑许卫杨李郑', '冯郑许卫杨李郑', '00', '649@qq.com', '131649', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (673, 1, '冯王朱周秦沈卫', '冯王朱周秦沈卫', '00', '650@qq.com', '131650', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (674, 1, '卫冯许卫李钱郑', '卫冯许卫李钱郑', '00', '651@qq.com', '131651', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (675, 1, '李许许孙蒋李陈', '李许许孙蒋李陈', '00', '652@qq.com', '131652', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (676, 1, '赵尤韩陈秦韩蒋', '赵尤韩陈秦韩蒋', '00', '653@qq.com', '131653', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (677, 1, '杨杨韩赵蒋许赵', '杨杨韩赵蒋许赵', '00', '654@qq.com', '131654', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (678, 1, '蒋孙李郑蒋周王', '蒋孙李郑蒋周王', '00', '655@qq.com', '131655', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (679, 1, '秦尤周周褚杨卫', '秦尤周周褚杨卫', '00', '656@qq.com', '131656', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (680, 1, '褚杨陈尤沈陈李', '褚杨陈尤沈陈李', '00', '657@qq.com', '131657', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (681, 1, '陈褚杨秦沈沈吴', '陈褚杨秦沈沈吴', '00', '658@qq.com', '131658', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (682, 1, '沈朱蒋尤韩卫周', '沈朱蒋尤韩卫周', '00', '659@qq.com', '131659', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (683, 1, '孙沈蒋王赵郑朱', '孙沈蒋王赵郑朱', '00', '660@qq.com', '131660', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (684, 1, '沈周蒋吴许朱陈', '沈周蒋吴许朱陈', '00', '661@qq.com', '131661', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (685, 1, '朱郑褚周钱吴许', '朱郑褚周钱吴许', '00', '662@qq.com', '131662', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (686, 1, '秦卫褚卫孙王郑', '秦卫褚卫孙王郑', '00', '663@qq.com', '131663', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (687, 1, '朱周周郑卫王韩', '朱周周郑卫王韩', '00', '664@qq.com', '131664', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (688, 1, '许卫李孙冯王尤', '许卫李孙冯王尤', '00', '665@qq.com', '131665', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (689, 1, '韩褚沈王吴杨吴', '韩褚沈王吴杨吴', '00', '666@qq.com', '131666', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (690, 1, '韩秦赵李吴秦赵', '韩秦赵李吴秦赵', '00', '667@qq.com', '131667', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (691, 1, '钱李许冯韩王秦', '钱李许冯韩王秦', '00', '668@qq.com', '131668', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (692, 1, '蒋吴朱卫李冯赵', '蒋吴朱卫李冯赵', '00', '669@qq.com', '131669', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (693, 1, '卫冯赵朱许李陈', '卫冯赵朱许李陈', '00', '670@qq.com', '131670', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (694, 1, '卫冯许吴钱李冯', '卫冯许吴钱李冯', '00', '671@qq.com', '131671', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (695, 1, '钱李韩韩杨尤卫', '钱李韩韩杨尤卫', '00', '672@qq.com', '131672', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (696, 1, '卫朱周吴褚褚杨', '卫朱周吴褚褚杨', '00', '673@qq.com', '131673', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (697, 1, '卫孙蒋沈朱褚卫', '卫孙蒋沈朱褚卫', '00', '674@qq.com', '131674', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (698, 1, '赵郑秦陈朱朱赵', '赵郑秦陈朱朱赵', '00', '675@qq.com', '131675', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (699, 1, '沈吴郑尤冯郑许', '沈吴郑尤冯郑许', '00', '676@qq.com', '131676', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (700, 1, '钱陈秦钱孙郑郑', '钱陈秦钱孙郑郑', '00', '677@qq.com', '131677', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (701, 1, '蒋周孙孙赵卫王', '蒋周孙孙赵卫王', '00', '678@qq.com', '131678', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (702, 1, '赵孙陈冯尤朱朱', '赵孙陈冯尤朱朱', '00', '679@qq.com', '131679', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (703, 1, '沈尤秦朱王吴卫', '沈尤秦朱王吴卫', '00', '680@qq.com', '131680', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (704, 1, '韩冯郑王许吴许', '韩冯郑王许吴许', '00', '681@qq.com', '131681', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (705, 1, '钱秦钱周蒋朱朱', '钱秦钱周蒋朱朱', '00', '682@qq.com', '131682', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (706, 1, '许孙蒋赵尤李赵', '许孙蒋赵尤李赵', '00', '683@qq.com', '131683', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (707, 1, '许杨杨李杨褚陈', '许杨杨李杨褚陈', '00', '684@qq.com', '131684', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (708, 1, '韩陈冯王许陈卫', '韩陈冯王许陈卫', '00', '685@qq.com', '131685', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (709, 1, '杨许陈赵蒋孙蒋', '杨许陈赵蒋孙蒋', '00', '686@qq.com', '131686', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (710, 1, '杨钱陈褚韩钱尤', '杨钱陈褚韩钱尤', '00', '687@qq.com', '131687', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (711, 1, '沈李周蒋王沈陈', '沈李周蒋王沈陈', '00', '688@qq.com', '131688', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (712, 1, '韩冯许钱秦赵钱', '韩冯许钱秦赵钱', '00', '689@qq.com', '131689', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (713, 1, '沈赵钱吴赵朱冯', '沈赵钱吴赵朱冯', '00', '690@qq.com', '131690', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (714, 1, '朱卫杨孙朱王卫', '朱卫杨孙朱王卫', '00', '691@qq.com', '131691', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (715, 1, '韩杨褚赵杨李周', '韩杨褚赵杨李周', '00', '692@qq.com', '131692', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (716, 1, '郑褚吴钱钱郑冯', '郑褚吴钱钱郑冯', '00', '693@qq.com', '131693', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (717, 1, '尤卫孙王王冯王', '尤卫孙王王冯王', '00', '694@qq.com', '131694', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (718, 1, '卫陈秦钱孙郑冯', '卫陈秦钱孙郑冯', '00', '695@qq.com', '131695', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (719, 1, '蒋李赵孙韩尤郑', '蒋李赵孙韩尤郑', '00', '696@qq.com', '131696', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (720, 1, '许王韩钱杨杨卫', '许王韩钱杨杨卫', '00', '697@qq.com', '131697', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (721, 1, '吴王赵褚朱许吴', '吴王赵褚朱许吴', '00', '698@qq.com', '131698', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (722, 1, '李周朱卫孙沈吴', '李周朱卫孙沈吴', '00', '699@qq.com', '131699', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (723, 1, '朱赵李褚褚尤王', '朱赵李褚褚尤王', '00', '700@qq.com', '131700', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (724, 1, '尤尤许朱钱钱李', '尤尤许朱钱钱李', '00', '701@qq.com', '131701', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (725, 1, '赵尤许卫褚卫王', '赵尤许卫褚卫王', '00', '702@qq.com', '131702', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (726, 1, '许陈郑孙周韩朱', '许陈郑孙周韩朱', '00', '703@qq.com', '131703', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (727, 1, '冯韩赵孙朱韩李', '冯韩赵孙朱韩李', '00', '704@qq.com', '131704', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (728, 1, '王朱陈钱周吴吴', '王朱陈钱周吴吴', '00', '705@qq.com', '131705', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (729, 1, '冯卫郑韩陈蒋郑', '冯卫郑韩陈蒋郑', '00', '706@qq.com', '131706', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (730, 1, '赵许陈孙周尤蒋', '赵许陈孙周尤蒋', '00', '707@qq.com', '131707', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (731, 1, '尤周冯钱赵杨吴', '尤周冯钱赵杨吴', '00', '708@qq.com', '131708', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (732, 1, '孙褚孙韩卫钱赵', '孙褚孙韩卫钱赵', '00', '709@qq.com', '131709', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (733, 1, '李朱杨杨褚尤卫', '李朱杨杨褚尤卫', '00', '710@qq.com', '131710', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (734, 1, '沈杨孙蒋李李郑', '沈杨孙蒋李李郑', '00', '711@qq.com', '131711', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (735, 1, '卫郑冯钱孙许杨', '卫郑冯钱孙许杨', '00', '712@qq.com', '131712', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (736, 1, '蒋褚吴褚冯杨郑', '蒋褚吴褚冯杨郑', '00', '713@qq.com', '131713', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (737, 1, '蒋朱许周孙郑朱', '蒋朱许周孙郑朱', '00', '714@qq.com', '131714', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (738, 1, '陈钱李陈郑郑沈', '陈钱李陈郑郑沈', '00', '715@qq.com', '131715', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (739, 1, '钱赵赵朱吴赵沈', '钱赵赵朱吴赵沈', '00', '716@qq.com', '131716', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (740, 1, '卫吴秦秦李杨蒋', '卫吴秦秦李杨蒋', '00', '717@qq.com', '131717', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (741, 1, '尤冯赵许冯郑孙', '尤冯赵许冯郑孙', '00', '718@qq.com', '131718', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (742, 1, '赵杨许沈韩蒋冯', '赵杨许沈韩蒋冯', '00', '719@qq.com', '131719', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (743, 1, '吴赵王周钱郑杨', '吴赵王周钱郑杨', '00', '720@qq.com', '131720', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (744, 1, '卫郑褚李许杨孙', '卫郑褚李许杨孙', '00', '721@qq.com', '131721', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (745, 1, '孙周李褚卫沈周', '孙周李褚卫沈周', '00', '722@qq.com', '131722', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (746, 1, '褚褚朱韩孙许杨', '褚褚朱韩孙许杨', '00', '723@qq.com', '131723', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (747, 1, '冯杨朱郑陈王李', '冯杨朱郑陈王李', '00', '724@qq.com', '131724', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (748, 1, '许吴蒋许钱陈吴', '许吴蒋许钱陈吴', '00', '725@qq.com', '131725', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (749, 1, '卫沈赵褚孙沈秦', '卫沈赵褚孙沈秦', '00', '726@qq.com', '131726', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (750, 1, '吴赵尤冯陈赵李', '吴赵尤冯陈赵李', '00', '727@qq.com', '131727', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (751, 1, '杨赵周卫周钱冯', '杨赵周卫周钱冯', '00', '728@qq.com', '131728', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (752, 1, '蒋赵孙李冯蒋朱', '蒋赵孙李冯蒋朱', '00', '729@qq.com', '131729', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (753, 1, '卫朱韩李赵褚周', '卫朱韩李赵褚周', '00', '730@qq.com', '131730', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (754, 1, '秦陈杨朱陈蒋秦', '秦陈杨朱陈蒋秦', '00', '731@qq.com', '131731', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (755, 1, '周沈赵沈秦王朱', '周沈赵沈秦王朱', '00', '732@qq.com', '131732', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (756, 1, '李杨吴王周杨蒋', '李杨吴王周杨蒋', '00', '733@qq.com', '131733', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (757, 1, '孙冯尤冯郑李孙', '孙冯尤冯郑李孙', '00', '734@qq.com', '131734', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (758, 1, '沈许周秦冯孙赵', '沈许周秦冯孙赵', '00', '735@qq.com', '131735', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (759, 1, '秦蒋吴卫王赵尤', '秦蒋吴卫王赵尤', '00', '736@qq.com', '131736', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (760, 1, '赵钱秦郑陈赵吴', '赵钱秦郑陈赵吴', '00', '737@qq.com', '131737', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (761, 1, '孙沈陈秦周沈朱', '孙沈陈秦周沈朱', '00', '738@qq.com', '131738', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (762, 1, '冯赵杨赵尤郑周', '冯赵杨赵尤郑周', '00', '739@qq.com', '131739', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (763, 1, '尤赵朱卫吴秦沈', '尤赵朱卫吴秦沈', '00', '740@qq.com', '131740', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (764, 1, '秦周冯尤沈李陈', '秦周冯尤沈李陈', '00', '741@qq.com', '131741', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (765, 1, '赵钱杨秦韩李李', '赵钱杨秦韩李李', '00', '742@qq.com', '131742', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (766, 1, '钱郑蒋尤孙韩孙', '钱郑蒋尤孙韩孙', '00', '743@qq.com', '131743', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (767, 1, '秦沈韩卫褚蒋周', '秦沈韩卫褚蒋周', '00', '744@qq.com', '131744', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (768, 1, '韩褚陈秦褚沈郑', '韩褚陈秦褚沈郑', '00', '745@qq.com', '131745', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (769, 1, '沈尤吴蒋李韩尤', '沈尤吴蒋李韩尤', '00', '746@qq.com', '131746', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (770, 1, '陈周冯郑褚陈秦', '陈周冯郑褚陈秦', '00', '747@qq.com', '131747', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (771, 1, '赵孙钱尤褚吴周', '赵孙钱尤褚吴周', '00', '748@qq.com', '131748', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (772, 1, '钱朱吴卫周秦李', '钱朱吴卫周秦李', '00', '749@qq.com', '131749', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (773, 1, '郑周杨钱孙杨周', '郑周杨钱孙杨周', '00', '750@qq.com', '131750', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (774, 1, '陈周蒋郑孙周钱', '陈周蒋郑孙周钱', '00', '751@qq.com', '131751', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (775, 1, '郑赵钱冯周孙郑', '郑赵钱冯周孙郑', '00', '752@qq.com', '131752', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (776, 1, '陈褚陈许蒋孙李', '陈褚陈许蒋孙李', '00', '753@qq.com', '131753', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (777, 1, '卫朱吴卫韩赵王', '卫朱吴卫韩赵王', '00', '754@qq.com', '131754', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (778, 1, '沈陈赵吴冯孙冯', '沈陈赵吴冯孙冯', '00', '755@qq.com', '131755', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (779, 1, '吴尤钱孙沈赵卫', '吴尤钱孙沈赵卫', '00', '756@qq.com', '131756', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (780, 1, '沈孙褚钱钱冯冯', '沈孙褚钱钱冯冯', '00', '757@qq.com', '131757', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (781, 1, '尤卫卫钱孙赵赵', '尤卫卫钱孙赵赵', '00', '758@qq.com', '131758', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (782, 1, '吴尤沈孙李陈陈', '吴尤沈孙李陈陈', '00', '759@qq.com', '131759', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (783, 1, '秦冯尤吴陈韩韩', '秦冯尤吴陈韩韩', '00', '760@qq.com', '131760', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (784, 1, '王郑钱蒋韩韩朱', '王郑钱蒋韩韩朱', '00', '761@qq.com', '131761', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (785, 1, '郑郑王尤许钱沈', '郑郑王尤许钱沈', '00', '762@qq.com', '131762', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (786, 1, '王孙沈郑韩冯赵', '王孙沈郑韩冯赵', '00', '763@qq.com', '131763', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (787, 1, '李蒋沈秦吴韩王', '李蒋沈秦吴韩王', '00', '764@qq.com', '131764', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (788, 1, '杨朱李王李赵陈', '杨朱李王李赵陈', '00', '765@qq.com', '131765', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (789, 1, '许褚卫赵陈卫王', '许褚卫赵陈卫王', '00', '766@qq.com', '131766', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (790, 1, '赵钱郑朱冯冯许', '赵钱郑朱冯冯许', '00', '767@qq.com', '131767', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (791, 1, '郑秦陈尤钱周周', '郑秦陈尤钱周周', '00', '768@qq.com', '131768', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (792, 1, '朱李蒋韩蒋许沈', '朱李蒋韩蒋许沈', '00', '769@qq.com', '131769', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (793, 1, '周赵陈卫孙钱周', '周赵陈卫孙钱周', '00', '770@qq.com', '131770', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (794, 1, '吴尤蒋杨王周卫', '吴尤蒋杨王周卫', '00', '771@qq.com', '131771', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (795, 1, '朱陈杨韩褚王蒋', '朱陈杨韩褚王蒋', '00', '772@qq.com', '131772', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (796, 1, '钱吴钱冯卫蒋尤', '钱吴钱冯卫蒋尤', '00', '773@qq.com', '131773', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (797, 1, '尤许王褚郑钱秦', '尤许王褚郑钱秦', '00', '774@qq.com', '131774', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (798, 1, '沈周郑吴赵赵韩', '沈周郑吴赵赵韩', '00', '775@qq.com', '131775', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (799, 1, '周王陈周尤赵褚', '周王陈周尤赵褚', '00', '776@qq.com', '131776', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (800, 1, '朱吴韩李沈吴褚', '朱吴韩李沈吴褚', '00', '777@qq.com', '131777', '1', '', '123', '0', '0', '', NULL, '', '2023-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (801, 1, '卫秦杨李朱吴卫', '卫秦杨李朱吴卫', '00', '778@qq.com', '131778', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (802, 1, '褚王冯褚蒋赵李', '褚王冯褚蒋赵李', '00', '779@qq.com', '131779', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (803, 1, '李赵赵蒋孙陈吴', '李赵赵蒋孙陈吴', '00', '780@qq.com', '131780', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (804, 1, '尤周冯褚孙沈秦', '尤周冯褚孙沈秦', '00', '781@qq.com', '131781', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (805, 1, '蒋褚李秦蒋卫吴', '蒋褚李秦蒋卫吴', '00', '782@qq.com', '131782', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (806, 1, '王陈褚赵卫李周', '王陈褚赵卫李周', '00', '783@qq.com', '131783', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (807, 1, '蒋陈李沈杨李卫', '蒋陈李沈杨李卫', '00', '784@qq.com', '131784', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (808, 1, '褚蒋赵蒋孙尤尤', '褚蒋赵蒋孙尤尤', '00', '785@qq.com', '131785', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (809, 1, '许杨尤韩陈冯冯', '许杨尤韩陈冯冯', '00', '786@qq.com', '131786', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (810, 1, '李杨卫赵杨王褚', '李杨卫赵杨王褚', '00', '787@qq.com', '131787', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (811, 1, '赵沈王蒋钱吴蒋', '赵沈王蒋钱吴蒋', '00', '788@qq.com', '131788', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (812, 1, '褚尤尤卫周卫韩', '褚尤尤卫周卫韩', '00', '789@qq.com', '131789', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (813, 1, '秦韩蒋卫褚韩周', '秦韩蒋卫褚韩周', '00', '790@qq.com', '131790', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (814, 1, '许李沈秦韩朱赵', '许李沈秦韩朱赵', '00', '791@qq.com', '131791', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (815, 1, '秦尤吴尤孙许杨', '秦尤吴尤孙许杨', '00', '792@qq.com', '131792', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (816, 1, '陈郑杨吴李蒋钱', '陈郑杨吴李蒋钱', '00', '793@qq.com', '131793', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (817, 1, '冯周秦赵钱褚朱', '冯周秦赵钱褚朱', '00', '794@qq.com', '131794', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (818, 1, '杨钱冯赵蒋吴褚', '杨钱冯赵蒋吴褚', '00', '795@qq.com', '131795', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (819, 1, '朱郑吴周沈褚周', '朱郑吴周沈褚周', '00', '796@qq.com', '131796', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (820, 1, '郑吴蒋郑韩郑吴', '郑吴蒋郑韩郑吴', '00', '797@qq.com', '131797', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (821, 1, '郑赵赵周蒋尤许', '郑赵赵周蒋尤许', '00', '798@qq.com', '131798', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (822, 1, '褚褚王冯韩尤杨', '褚褚王冯韩尤杨', '00', '799@qq.com', '131799', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (823, 1, '卫韩蒋赵许许郑', '卫韩蒋赵许许郑', '00', '800@qq.com', '131800', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (824, 1, '陈褚周许卫蒋蒋', '陈褚周许卫蒋蒋', '00', '801@qq.com', '131801', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (825, 1, '周郑尤蒋秦许王', '周郑尤蒋秦许王', '00', '802@qq.com', '131802', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (826, 1, '朱沈褚周钱韩韩', '朱沈褚周钱韩韩', '00', '803@qq.com', '131803', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (827, 1, '吴冯李陈朱杨许', '吴冯李陈朱杨许', '00', '804@qq.com', '131804', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (828, 1, '冯朱郑李孙钱沈', '冯朱郑李孙钱沈', '00', '805@qq.com', '131805', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (829, 1, '卫孙卫朱陈蒋沈', '卫孙卫朱陈蒋沈', '00', '806@qq.com', '131806', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (830, 1, '杨杨冯许尤郑陈', '杨杨冯许尤郑陈', '00', '807@qq.com', '131807', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (831, 1, '韩郑赵尤王孙孙', '韩郑赵尤王孙孙', '00', '808@qq.com', '131808', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (832, 1, '杨钱陈王许朱孙', '杨钱陈王许朱孙', '00', '809@qq.com', '131809', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (833, 1, '卫吴赵李尤杨褚', '卫吴赵李尤杨褚', '00', '810@qq.com', '131810', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (834, 1, '王朱尤朱韩冯李', '王朱尤朱韩冯李', '00', '811@qq.com', '131811', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (835, 1, '郑沈尤蒋李沈冯', '郑沈尤蒋李沈冯', '00', '812@qq.com', '131812', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (836, 1, '郑冯蒋冯沈杨孙', '郑冯蒋冯沈杨孙', '00', '813@qq.com', '131813', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (837, 1, '赵郑冯杨杨秦冯', '赵郑冯杨杨秦冯', '00', '814@qq.com', '131814', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (838, 1, '钱吴周韩冯秦孙', '钱吴周韩冯秦孙', '00', '815@qq.com', '131815', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (839, 1, '王李周秦卫孙李', '王李周秦卫孙李', '00', '816@qq.com', '131816', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (840, 1, '周许吴吴李秦周', '周许吴吴李秦周', '00', '817@qq.com', '131817', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (841, 1, '许蒋周卫许沈韩', '许蒋周卫许沈韩', '00', '818@qq.com', '131818', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (842, 1, '沈陈郑褚秦郑孙', '沈陈郑褚秦郑孙', '00', '819@qq.com', '131819', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (843, 1, '孙赵冯钱陈赵钱', '孙赵冯钱陈赵钱', '00', '820@qq.com', '131820', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (844, 1, '赵尤孙沈卫朱李', '赵尤孙沈卫朱李', '00', '821@qq.com', '131821', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (845, 1, '褚王褚冯卫冯赵', '褚王褚冯卫冯赵', '00', '822@qq.com', '131822', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (846, 1, '吴朱尤许褚钱吴', '吴朱尤许褚钱吴', '00', '823@qq.com', '131823', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (847, 1, '冯许冯卫吴卫王', '冯许冯卫吴卫王', '00', '824@qq.com', '131824', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (848, 1, '吴许王钱孙杨杨', '吴许王钱孙杨杨', '00', '825@qq.com', '131825', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (849, 1, '卫吴褚陈尤钱赵', '卫吴褚陈尤钱赵', '00', '826@qq.com', '131826', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (850, 1, '杨周秦陈蒋沈赵', '杨周秦陈蒋沈赵', '00', '827@qq.com', '131827', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (851, 1, '赵冯赵褚卫尤李', '赵冯赵褚卫尤李', '00', '828@qq.com', '131828', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (852, 1, '孙韩许韩李褚秦', '孙韩许韩李褚秦', '00', '829@qq.com', '131829', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (853, 1, '陈蒋李蒋沈朱杨', '陈蒋李蒋沈朱杨', '00', '830@qq.com', '131830', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (854, 1, '秦韩陈卫赵孙李', '秦韩陈卫赵孙李', '00', '831@qq.com', '131831', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (855, 1, '尤沈孙沈吴尤韩', '尤沈孙沈吴尤韩', '00', '832@qq.com', '131832', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (856, 1, '吴郑朱卫钱尤朱', '吴郑朱卫钱尤朱', '00', '833@qq.com', '131833', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (857, 1, '杨吴陈郑冯沈赵', '杨吴陈郑冯沈赵', '00', '834@qq.com', '131834', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (858, 1, '秦褚蒋郑陈李沈', '秦褚蒋郑陈李沈', '00', '835@qq.com', '131835', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (859, 1, '陈朱孙陈郑褚卫', '陈朱孙陈郑褚卫', '00', '836@qq.com', '131836', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (860, 1, '秦周冯吴冯沈王', '秦周冯吴冯沈王', '00', '837@qq.com', '131837', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (861, 1, '钱沈钱周孙秦陈', '钱沈钱周孙秦陈', '00', '838@qq.com', '131838', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (862, 1, '李孙王周朱尤杨', '李孙王周朱尤杨', '00', '839@qq.com', '131839', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (863, 1, '尤杨朱蒋周蒋朱', '尤杨朱蒋周蒋朱', '00', '840@qq.com', '131840', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (864, 1, '秦吴尤卫蒋冯韩', '秦吴尤卫蒋冯韩', '00', '841@qq.com', '131841', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (865, 1, '陈朱尤沈蒋朱周', '陈朱尤沈蒋朱周', '00', '842@qq.com', '131842', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (866, 1, '李钱周蒋褚周蒋', '李钱周蒋褚周蒋', '00', '843@qq.com', '131843', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (867, 1, '杨冯朱杨周褚沈', '杨冯朱杨周褚沈', '00', '844@qq.com', '131844', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (868, 1, '王韩郑吴蒋秦吴', '王韩郑吴蒋秦吴', '00', '845@qq.com', '131845', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (869, 1, '周孙许孙王尤秦', '周孙许孙王尤秦', '00', '846@qq.com', '131846', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (870, 1, '韩赵吴秦朱卫吴', '韩赵吴秦朱卫吴', '00', '847@qq.com', '131847', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (871, 1, '李杨冯朱孙钱朱', '李杨冯朱孙钱朱', '00', '848@qq.com', '131848', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (872, 1, '许朱卫许杨周尤', '许朱卫许杨周尤', '00', '849@qq.com', '131849', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (873, 1, '秦冯赵李沈孙朱', '秦冯赵李沈孙朱', '00', '850@qq.com', '131850', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (874, 1, '陈钱周李秦陈郑', '陈钱周李秦陈郑', '00', '851@qq.com', '131851', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (875, 1, '褚钱赵韩郑钱蒋', '褚钱赵韩郑钱蒋', '00', '852@qq.com', '131852', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (876, 1, '孙尤赵李陈赵朱', '孙尤赵李陈赵朱', '00', '853@qq.com', '131853', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (877, 1, '褚赵朱孙韩卫秦', '褚赵朱孙韩卫秦', '00', '854@qq.com', '131854', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (878, 1, '蒋沈朱蒋李秦郑', '蒋沈朱蒋李秦郑', '00', '855@qq.com', '131855', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (879, 1, '褚吴吴李李尤李', '褚吴吴李李尤李', '00', '856@qq.com', '131856', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (880, 1, '秦李尤尤朱蒋周', '秦李尤尤朱蒋周', '00', '857@qq.com', '131857', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (881, 1, '陈王周周钱冯陈', '陈王周周钱冯陈', '00', '858@qq.com', '131858', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (882, 1, '韩杨周赵赵蒋韩', '韩杨周赵赵蒋韩', '00', '859@qq.com', '131859', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (883, 1, '钱钱杨王朱钱李', '钱钱杨王朱钱李', '00', '860@qq.com', '131860', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (884, 1, '蒋郑秦尤韩蒋钱', '蒋郑秦尤韩蒋钱', '00', '861@qq.com', '131861', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (885, 1, '沈韩钱尤许秦朱', '沈韩钱尤许秦朱', '00', '862@qq.com', '131862', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (886, 1, '李吴孙陈沈卫杨', '李吴孙陈沈卫杨', '00', '863@qq.com', '131863', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (887, 1, '王陈陈吴朱秦朱', '王陈陈吴朱秦朱', '00', '864@qq.com', '131864', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (888, 1, '尤褚朱韩秦冯王', '尤褚朱韩秦冯王', '00', '865@qq.com', '131865', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (889, 1, '赵李陈钱李尤李', '赵李陈钱李尤李', '00', '866@qq.com', '131866', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (890, 1, '陈冯钱朱赵杨赵', '陈冯钱朱赵杨赵', '00', '867@qq.com', '131867', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (891, 1, '吴杨孙蒋沈郑蒋', '吴杨孙蒋沈郑蒋', '00', '868@qq.com', '131868', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (892, 1, '钱钱吴冯朱郑孙', '钱钱吴冯朱郑孙', '00', '869@qq.com', '131869', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (893, 1, '尤郑卫钱王冯褚', '尤郑卫钱王冯褚', '00', '870@qq.com', '131870', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (894, 1, '冯秦尤杨李沈孙', '冯秦尤杨李沈孙', '00', '871@qq.com', '131871', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (895, 1, '蒋周朱钱赵陈赵', '蒋周朱钱赵陈赵', '00', '872@qq.com', '131872', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (896, 1, '吴尤蒋朱秦尤褚', '吴尤蒋朱秦尤褚', '00', '873@qq.com', '131873', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (897, 1, '陈褚沈蒋杨郑周', '陈褚沈蒋杨郑周', '00', '874@qq.com', '131874', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (898, 1, '周钱冯秦卫朱朱', '周钱冯秦卫朱朱', '00', '875@qq.com', '131875', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (899, 1, '朱杨许赵陈郑韩', '朱杨许赵陈郑韩', '00', '876@qq.com', '131876', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (900, 1, '卫王杨冯王杨赵', '卫王杨冯王杨赵', '00', '877@qq.com', '131877', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (901, 1, '郑郑郑秦褚褚周', '郑郑郑秦褚褚周', '00', '878@qq.com', '131878', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (902, 1, '王褚韩冯冯蒋尤', '王褚韩冯冯蒋尤', '00', '879@qq.com', '131879', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (903, 1, '卫钱吴秦吴褚钱', '卫钱吴秦吴褚钱', '00', '880@qq.com', '131880', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (904, 1, '尤郑卫钱王卫卫', '尤郑卫钱王卫卫', '00', '881@qq.com', '131881', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (905, 1, '韩冯孙卫郑吴赵', '韩冯孙卫郑吴赵', '00', '882@qq.com', '131882', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (906, 1, '吴朱王许韩韩韩', '吴朱王许韩韩韩', '00', '883@qq.com', '131883', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (907, 1, '冯尤韩陈朱韩钱', '冯尤韩陈朱韩钱', '00', '884@qq.com', '131884', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (908, 1, '钱韩韩秦许吴孙', '钱韩韩秦许吴孙', '00', '885@qq.com', '131885', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (909, 1, '李许王李冯尤卫', '李许王李冯尤卫', '00', '886@qq.com', '131886', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (910, 1, '许杨孙赵郑尤陈', '许杨孙赵郑尤陈', '00', '887@qq.com', '131887', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (911, 1, '王卫李孙吴尤尤', '王卫李孙吴尤尤', '00', '888@qq.com', '131888', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (912, 1, '王赵秦秦钱朱吴', '王赵秦秦钱朱吴', '00', '889@qq.com', '131889', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (913, 1, '秦钱钱李李赵孙', '秦钱钱李李赵孙', '00', '890@qq.com', '131890', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (914, 1, '沈秦韩杨赵秦孙', '沈秦韩杨赵秦孙', '00', '891@qq.com', '131891', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (915, 1, '赵周赵卫韩蒋孙', '赵周赵卫韩蒋孙', '00', '892@qq.com', '131892', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (916, 1, '韩褚赵孙周蒋陈', '韩褚赵孙周蒋陈', '00', '893@qq.com', '131893', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (917, 1, '陈郑孙孙陈沈褚', '陈郑孙孙陈沈褚', '00', '894@qq.com', '131894', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (918, 1, '许赵韩陈孙吴韩', '许赵韩陈孙吴韩', '00', '895@qq.com', '131895', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (919, 1, '尤沈卫李孙秦卫', '尤沈卫李孙秦卫', '00', '896@qq.com', '131896', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (920, 1, '韩蒋周韩许韩王', '韩蒋周韩许韩王', '00', '897@qq.com', '131897', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (921, 1, '蒋秦杨吴赵周吴', '蒋秦杨吴赵周吴', '00', '898@qq.com', '131898', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (922, 1, '杨卫秦卫赵孙杨', '杨卫秦卫赵孙杨', '00', '899@qq.com', '131899', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (923, 1, '卫赵陈吴朱韩李', '卫赵陈吴朱韩李', '00', '900@qq.com', '131900', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (924, 1, '郑朱朱许韩尤周', '郑朱朱许韩尤周', '00', '901@qq.com', '131901', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (925, 1, '沈褚赵朱许王沈', '沈褚赵朱许王沈', '00', '902@qq.com', '131902', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (926, 1, '陈朱李蒋王蒋钱', '陈朱李蒋王蒋钱', '00', '903@qq.com', '131903', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (927, 1, '钱朱尤韩吴钱李', '钱朱尤韩吴钱李', '00', '904@qq.com', '131904', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (928, 1, '许蒋朱杨韩钱沈', '许蒋朱杨韩钱沈', '00', '905@qq.com', '131905', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (929, 1, '孙韩周沈王秦尤', '孙韩周沈王秦尤', '00', '906@qq.com', '131906', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (930, 1, '周尤周卫孙杨周', '周尤周卫孙杨周', '00', '907@qq.com', '131907', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (931, 1, '卫杨朱钱郑褚尤', '卫杨朱钱郑褚尤', '00', '908@qq.com', '131908', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (932, 1, '褚冯周褚蒋卫秦', '褚冯周褚蒋卫秦', '00', '909@qq.com', '131909', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (933, 1, '吴卫杨王韩吴周', '吴卫杨王韩吴周', '00', '910@qq.com', '131910', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (934, 1, '王褚周朱王孙卫', '王褚周朱王孙卫', '00', '911@qq.com', '131911', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (935, 1, '韩蒋沈朱吴郑李', '韩蒋沈朱吴郑李', '00', '912@qq.com', '131912', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (936, 1, '褚陈吴蒋卫钱郑', '褚陈吴蒋卫钱郑', '00', '913@qq.com', '131913', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (937, 1, '钱王陈冯郑许冯', '钱王陈冯郑许冯', '00', '914@qq.com', '131914', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (938, 1, '卫王郑陈蒋钱陈', '卫王郑陈蒋钱陈', '00', '915@qq.com', '131915', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (939, 1, '沈韩赵许尤韩吴', '沈韩赵许尤韩吴', '00', '916@qq.com', '131916', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (940, 1, '韩吴褚许郑尤陈', '韩吴褚许郑尤陈', '00', '917@qq.com', '131917', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (941, 1, '郑尤孙王沈秦郑', '郑尤孙王沈秦郑', '00', '918@qq.com', '131918', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (942, 1, '许郑韩卫冯朱王', '许郑韩卫冯朱王', '00', '919@qq.com', '131919', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (943, 1, '卫冯尤褚沈沈周', '卫冯尤褚沈沈周', '00', '920@qq.com', '131920', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (944, 1, '李周秦钱许王沈', '李周秦钱许王沈', '00', '921@qq.com', '131921', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (945, 1, '李吴沈孙卫李李', '李吴沈孙卫李李', '00', '922@qq.com', '131922', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (946, 1, '周蒋吴卫沈李赵', '周蒋吴卫沈李赵', '00', '923@qq.com', '131923', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (947, 1, '蒋吴王赵赵吴沈', '蒋吴王赵赵吴沈', '00', '924@qq.com', '131924', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (948, 1, '李秦许李周秦沈', '李秦许李周秦沈', '00', '925@qq.com', '131925', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (949, 1, '王褚赵陈孙周李', '王褚赵陈孙周李', '00', '926@qq.com', '131926', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (950, 1, '陈王褚蒋王陈李', '陈王褚蒋王陈李', '00', '927@qq.com', '131927', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (951, 1, '许赵许朱李陈李', '许赵许朱李陈李', '00', '928@qq.com', '131928', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (952, 1, '卫尤周郑蒋陈尤', '卫尤周郑蒋陈尤', '00', '929@qq.com', '131929', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (953, 1, '钱许朱许韩蒋赵', '钱许朱许韩蒋赵', '00', '930@qq.com', '131930', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (954, 1, '许陈韩尤蒋卫朱', '许陈韩尤蒋卫朱', '00', '931@qq.com', '131931', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (955, 1, '秦钱陈李郑王朱', '秦钱陈李郑王朱', '00', '932@qq.com', '131932', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (956, 1, '朱王王冯冯朱沈', '朱王王冯冯朱沈', '00', '933@qq.com', '131933', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (957, 1, '周韩蒋赵朱钱吴', '周韩蒋赵朱钱吴', '00', '934@qq.com', '131934', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (958, 1, '赵许郑秦尤沈秦', '赵许郑秦尤沈秦', '00', '935@qq.com', '131935', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (959, 1, '蒋许钱卫朱韩王', '蒋许钱卫朱韩王', '00', '936@qq.com', '131936', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (960, 1, '郑吴王秦陈陈卫', '郑吴王秦陈陈卫', '00', '937@qq.com', '131937', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (961, 1, '王周沈秦蒋郑李', '王周沈秦蒋郑李', '00', '938@qq.com', '131938', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (962, 1, '秦李尤郑沈冯韩', '秦李尤郑沈冯韩', '00', '939@qq.com', '131939', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (963, 1, '李沈郑许周韩钱', '李沈郑许周韩钱', '00', '940@qq.com', '131940', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (964, 1, '卫许赵朱沈陈孙', '卫许赵朱沈陈孙', '00', '941@qq.com', '131941', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (965, 1, '李许许蒋陈蒋钱', '李许许蒋陈蒋钱', '00', '942@qq.com', '131942', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (966, 1, '杨许许郑周郑王', '杨许许郑周郑王', '00', '943@qq.com', '131943', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (967, 1, '钱吴李郑郑尤吴', '钱吴李郑郑尤吴', '00', '944@qq.com', '131944', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (968, 1, '杨尤杨许沈蒋卫', '杨尤杨许沈蒋卫', '00', '945@qq.com', '131945', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (969, 1, '蒋李赵孙卫李周', '蒋李赵孙卫李周', '00', '946@qq.com', '131946', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (970, 1, '赵许尤周王杨尤', '赵许尤周王杨尤', '00', '947@qq.com', '131947', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (971, 1, '秦蒋许吴许周吴', '秦蒋许吴许周吴', '00', '948@qq.com', '131948', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (972, 1, '尤杨钱李孙韩褚', '尤杨钱李孙韩褚', '00', '949@qq.com', '131949', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (973, 1, '朱郑冯蒋韩沈尤', '朱郑冯蒋韩沈尤', '00', '950@qq.com', '131950', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (974, 1, '褚吴韩冯吴吴王', '褚吴韩冯吴吴王', '00', '951@qq.com', '131951', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (975, 1, '陈陈吴卫陈冯韩', '陈陈吴卫陈冯韩', '00', '952@qq.com', '131952', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (976, 1, '周王许沈韩赵王', '周王许沈韩赵王', '00', '953@qq.com', '131953', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (977, 1, '王吴褚蒋吴许王', '王吴褚蒋吴许王', '00', '954@qq.com', '131954', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (978, 1, '韩赵卫周沈赵陈', '韩赵卫周沈赵陈', '00', '955@qq.com', '131955', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (979, 1, '沈褚钱秦沈褚卫', '沈褚钱秦沈褚卫', '00', '956@qq.com', '131956', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (980, 1, '钱沈钱冯沈尤秦', '钱沈钱冯沈尤秦', '00', '957@qq.com', '131957', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (981, 1, '吴钱朱陈褚孙杨', '吴钱朱陈褚孙杨', '00', '958@qq.com', '131958', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (982, 1, '赵许孙王王郑郑', '赵许孙王王郑郑', '00', '959@qq.com', '131959', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (983, 1, '冯杨朱孙李李孙', '冯杨朱孙李李孙', '00', '960@qq.com', '131960', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (984, 1, '赵孙许李尤许陈', '赵孙许李尤许陈', '00', '961@qq.com', '131961', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (985, 1, '冯孙沈杨李郑杨', '冯孙沈杨李郑杨', '00', '962@qq.com', '131962', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (986, 1, '陈赵韩尤蒋李周', '陈赵韩尤蒋李周', '00', '963@qq.com', '131963', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (987, 1, '杨李周周李杨尤', '杨李周周李杨尤', '00', '964@qq.com', '131964', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (988, 1, '冯卫钱冯朱陈许', '冯卫钱冯朱陈许', '00', '965@qq.com', '131965', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (989, 1, '许卫郑许韩蒋尤', '许卫郑许韩蒋尤', '00', '966@qq.com', '131966', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (990, 1, '杨吴郑蒋秦杨郑', '杨吴郑蒋秦杨郑', '00', '967@qq.com', '131967', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (991, 1, '蒋李陈蒋郑钱郑', '蒋李陈蒋郑钱郑', '00', '968@qq.com', '131968', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (992, 1, '陈郑秦秦秦赵蒋', '陈郑秦秦秦赵蒋', '00', '969@qq.com', '131969', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (993, 1, '卫蒋秦褚朱许朱', '卫蒋秦褚朱许朱', '00', '970@qq.com', '131970', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (994, 1, '郑吴尤赵郑吴钱', '郑吴尤赵郑吴钱', '00', '971@qq.com', '131971', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (995, 1, '朱沈郑许尤吴王', '朱沈郑许尤吴王', '00', '972@qq.com', '131972', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (996, 1, '赵陈韩蒋孙钱蒋', '赵陈韩蒋孙钱蒋', '00', '973@qq.com', '131973', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (997, 1, '周秦吴赵吴杨郑', '周秦吴赵吴杨郑', '00', '974@qq.com', '131974', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (998, 1, '郑沈卫许钱孙蒋', '郑沈卫许钱孙蒋', '00', '975@qq.com', '131975', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (999, 1, '赵孙郑李朱赵尤', '赵孙郑李朱赵尤', '00', '976@qq.com', '131976', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (1000, 1, '韩冯吴孙冯吴吴', '韩冯吴孙冯吴吴', '00', '977@qq.com', '131977', '1', '', '123', '0', '0', '', NULL, '', '2024-03-13 02:21:13', '', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_1
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_1`;
CREATE TABLE `sys_user_1`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `country_id` int NULL DEFAULT NULL COMMENT '省',
  `province_id` int NULL DEFAULT NULL COMMENT '市',
  `city_id` int NULL DEFAULT NULL COMMENT '区',
  `place_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 976483095853137921 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_1
-- ----------------------------
INSERT INTO `sys_user_1` VALUES (976485568718307328, 111, '111', '111', '00', 'mz19990630@qq.com', '131313', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_1` VALUES (976521498887979008, 111, '111', '111', '00', 'mz19990630@qq.com', '131313', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_2
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_2`;
CREATE TABLE `sys_user_2`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `country_id` int NULL DEFAULT NULL COMMENT '省',
  `province_id` int NULL DEFAULT NULL COMMENT '市',
  `city_id` int NULL DEFAULT NULL COMMENT '区',
  `place_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 976453392232611842 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_2
-- ----------------------------
INSERT INTO `sys_user_2` VALUES (976485513110224897, 111, '111', '111', '00', 'mz19990630@qq.com', '131313', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_2` VALUES (976499787291426817, 111, '111', '111', '00', 'mz19990630@qq.com', '131313', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_2` VALUES (976500120176558081, 111, '111', '111', '00', 'mz19990630@qq.com', '131313', '0', '', '', '0', '0', '', NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
