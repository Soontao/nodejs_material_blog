/*
Navicat SQLite Data Transfer

Source Server         : blog
Source Server Version : 30808
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30000
File Encoding         : 65001

Date: 2016-06-12 14:45:49
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS "api";
CREATE TABLE "api" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"authname"  TEXT NOT NULL,
"url"  TEXT NOT NULL,
"describe"  TEXT
)

;

-- ----------------------------
-- Records of api
-- ----------------------------
BEGIN;
INSERT INTO "api" VALUES (2, 'overview', '/admin/overview', 'overview访问权下');
INSERT INTO "api" VALUES (3, 'custume', '/admin/custume', '个性化访问权限');
INSERT INTO "api" VALUES (4, 'addblog', '/articles/addblog', '添加一个博客');
INSERT INTO "api" VALUES (5, 'editblog', '/articles/editblog', '修改一个博客');
INSERT INTO "api" VALUES (6, 'deleteblog', '/articles/deleteblog', '删除一个博客');
INSERT INTO "api" VALUES (7, 'addcmt', '/articles/comment/add', '添加一个评论');
INSERT INTO "api" VALUES (8, 'updatecmt', '/articles/comment/update', '修改一个评论');
INSERT INTO "api" VALUES (9, 'deletecmt', '/articles/comment/delete', '删除一条评论');
INSERT INTO "api" VALUES (10, 'adduser', '/admin/users/add', null);
INSERT INTO "api" VALUES (11, 'deleteuser', '/admin/users/delete', null);
INSERT INTO "api" VALUES (12, 'getuser', '/admin/users/get', null);
INSERT INTO "api" VALUES (13, 'updateuser', '/admin/users/update', null);
INSERT INTO "api" VALUES (14, 'login', '/login', null);
INSERT INTO "api" VALUES (15, 'register', '/register', null);
INSERT INTO "api" VALUES (16, 'logout', '/logout', null);
INSERT INTO "api" VALUES (17, 'usertypeadd', '/admin/auth/usertype/add', null);
INSERT INTO "api" VALUES (18, 'usertypeupdate', '/admin/auth/usertype/update', null);
INSERT INTO "api" VALUES (19, 'usertypapienable', '/admin/auth/usertypeapi/enable', null);
INSERT INTO "api" VALUES (20, 'usertypeapidisable', '/admin/auth/usertypeapi/disable', null);
INSERT INTO "api" VALUES (21, 'usertypeviewenable', '/admin/auth/usertypeview/enable', null);
INSERT INTO "api" VALUES (22, 'usertypeviewdisable', '/admin/auth/usertypeview/disable', null);
INSERT INTO "api" VALUES (23, 'costome', '/admin/costume', null);
INSERT INTO "api" VALUES (24, 'usertypedelete', '/admin/auth/usertype/delete', null);
COMMIT;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS "setting";
CREATE TABLE "setting" (
"id"  INTEGER NOT NULL,
"key"  TEXT,
"value"  TEXT,
PRIMARY KEY ("id" ASC),
UNIQUE ("key" ASC)
)

;

-- ----------------------------
-- Records of setting
-- ----------------------------
BEGIN;
INSERT INTO "setting" VALUES (1, 'site', '{"sitename":"见善-1","footertitle":"少年游-1","footercontent":"林花谢了春红 太匆匆 -1 ","footercorp":"© 2016 Suntao Copyright -1","headclr":"blue","footclr":"blue"}');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "user";
CREATE TABLE "user" (
"id"  INTEGER NOT NULL,
"username"  TEXT(32) NOT NULL,
"passwd"  TEXT(32) NOT NULL,
"usertype"  INTEGER NOT NULL DEFAULT 4,
"nickname"  TEXT,
"comment"  TEXT(100),
"lastlogindate"  INTEGER,
"lastloginip"  TEXT,
PRIMARY KEY ("id" ASC),
FOREIGN KEY ("usertype") REFERENCES "usertype" ("id"),
UNIQUE ("username" ASC)
)

;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO "user" VALUES (1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1, '管理员', '用户管理员', 1465358068827, '::1');
COMMIT;

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS "usertype";
CREATE TABLE "usertype" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"usertype"  TEXT(20) NOT NULL,
"descripe"  TEXT
)

;

-- ----------------------------
-- Records of usertype
-- ----------------------------
BEGIN;
INSERT INTO "usertype" VALUES (0, '未登录', '尚未登录');
INSERT INTO "usertype" VALUES (1, '管理员', '管理员账户');
INSERT INTO "usertype" VALUES (2, '普通用户', '普通的博客用户');
COMMIT;

-- ----------------------------
-- Table structure for usertypeapi
-- ----------------------------
DROP TABLE IF EXISTS "usertypeapi";
CREATE TABLE "usertypeapi" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"usertypeid"  INTEGER NOT NULL,
"apiid"  INTEGER NOT NULL,
FOREIGN KEY ("usertypeid") REFERENCES "usertype" ("id"),
FOREIGN KEY ("apiid") REFERENCES "api" ("id")
)

;

-- ----------------------------
-- Records of usertypeapi
-- ----------------------------
BEGIN;
INSERT INTO "usertypeapi" VALUES (2, 1, 2);
INSERT INTO "usertypeapi" VALUES (3, 1, 3);
INSERT INTO "usertypeapi" VALUES (4, 1, 4);
INSERT INTO "usertypeapi" VALUES (5, 1, 5);
INSERT INTO "usertypeapi" VALUES (6, 1, 6);
INSERT INTO "usertypeapi" VALUES (7, 1, 7);
INSERT INTO "usertypeapi" VALUES (8, 1, 8);
INSERT INTO "usertypeapi" VALUES (9, 1, 9);
INSERT INTO "usertypeapi" VALUES (10, 1, 10);
INSERT INTO "usertypeapi" VALUES (11, 1, 11);
INSERT INTO "usertypeapi" VALUES (12, 1, 12);
INSERT INTO "usertypeapi" VALUES (13, 1, 13);
INSERT INTO "usertypeapi" VALUES (14, 1, 14);
INSERT INTO "usertypeapi" VALUES (15, 1, 15);
INSERT INTO "usertypeapi" VALUES (16, 0, 14);
INSERT INTO "usertypeapi" VALUES (17, 1, 16);
INSERT INTO "usertypeapi" VALUES (18, 2, 4);
INSERT INTO "usertypeapi" VALUES (19, 2, 5);
INSERT INTO "usertypeapi" VALUES (20, 2, 6);
INSERT INTO "usertypeapi" VALUES (21, 1, 17);
INSERT INTO "usertypeapi" VALUES (22, 1, 18);
INSERT INTO "usertypeapi" VALUES (23, 1, 19);
INSERT INTO "usertypeapi" VALUES (24, 1, 20);
INSERT INTO "usertypeapi" VALUES (38, 1, 21);
INSERT INTO "usertypeapi" VALUES (39, 1, 22);
INSERT INTO "usertypeapi" VALUES (42, 2, 7);
INSERT INTO "usertypeapi" VALUES (47, 2, 2);
INSERT INTO "usertypeapi" VALUES (49, 1, 23);
INSERT INTO "usertypeapi" VALUES (50, 1, 24);
INSERT INTO "usertypeapi" VALUES (56, 2, 16);
INSERT INTO "usertypeapi" VALUES (57, 0, 15);
INSERT INTO "usertypeapi" VALUES (58, 2, 9);
INSERT INTO "usertypeapi" VALUES (59, 2, 8);
COMMIT;

-- ----------------------------
-- Table structure for usertypeview
-- ----------------------------
DROP TABLE IF EXISTS "usertypeview";
CREATE TABLE "usertypeview" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"usertypeid"  INTEGER NOT NULL,
"viewid"  INTEGER NOT NULL,
FOREIGN KEY ("usertypeid") REFERENCES "usertype" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY ("viewid") REFERENCES "view" ("id") ON DELETE CASCADE ON UPDATE CASCADE
)

;

-- ----------------------------
-- Records of usertypeview
-- ----------------------------
BEGIN;
INSERT INTO "usertypeview" VALUES (1, 1, 1);
INSERT INTO "usertypeview" VALUES (2, 1, 2);
INSERT INTO "usertypeview" VALUES (3, 1, 3);
INSERT INTO "usertypeview" VALUES (4, 1, 4);
INSERT INTO "usertypeview" VALUES (5, 1, 5);
INSERT INTO "usertypeview" VALUES (6, 1, 6);
INSERT INTO "usertypeview" VALUES (7, 1, 7);
INSERT INTO "usertypeview" VALUES (8, 1, 8);
INSERT INTO "usertypeview" VALUES (9, 1, 9);
INSERT INTO "usertypeview" VALUES (10, 1, 10);
INSERT INTO "usertypeview" VALUES (11, 1, 11);
INSERT INTO "usertypeview" VALUES (12, 1, 12);
INSERT INTO "usertypeview" VALUES (13, 1, 13);
INSERT INTO "usertypeview" VALUES (14, 0, 13);
INSERT INTO "usertypeview" VALUES (15, 1, 14);
INSERT INTO "usertypeview" VALUES (16, 0, 14);
INSERT INTO "usertypeview" VALUES (17, 0, 5);
INSERT INTO "usertypeview" VALUES (18, 0, 6);
INSERT INTO "usertypeview" VALUES (19, 2, 14);
INSERT INTO "usertypeview" VALUES (20, 2, 13);
INSERT INTO "usertypeview" VALUES (21, 1, 15);
INSERT INTO "usertypeview" VALUES (22, 1, 16);
INSERT INTO "usertypeview" VALUES (23, 1, 17);
INSERT INTO "usertypeview" VALUES (24, 1, 18);
INSERT INTO "usertypeview" VALUES (25, 1, 19);
INSERT INTO "usertypeview" VALUES (30, 3, 7);
INSERT INTO "usertypeview" VALUES (31, 0, 7);
INSERT INTO "usertypeview" VALUES (32, 2, 1);
INSERT INTO "usertypeview" VALUES (33, 2, 2);
INSERT INTO "usertypeview" VALUES (35, 2, 11);
INSERT INTO "usertypeview" VALUES (36, 2, 10);
INSERT INTO "usertypeview" VALUES (37, 2, 6);
INSERT INTO "usertypeview" VALUES (38, 2, 5);
COMMIT;

-- ----------------------------
-- Table structure for view
-- ----------------------------
DROP TABLE IF EXISTS "view";
CREATE TABLE "view" (
"id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"viewname"  TEXT NOT NULL,
"url"  TEXT NOT NULL,
"descripe"  TEXT
)

;

-- ----------------------------
-- Records of view
-- ----------------------------
BEGIN;
INSERT INTO "view" VALUES (1, 'newblog', '/articles/newblog', '添加博客 页面');
INSERT INTO "view" VALUES (2, 'editblog', '/articles/editblog', '修改博客页面');
INSERT INTO "view" VALUES (3, 'blogmanager', '/articles/blogmanager', '博客管理器');
INSERT INTO "view" VALUES (4, 'commentmanager', '/articles/comment/commentmanager', null);
INSERT INTO "view" VALUES (5, 'allblogs', '/articles/allblogs', '博客列表');
INSERT INTO "view" VALUES (6, 'blog', '/articles/blog', '单独博客');
INSERT INTO "view" VALUES (7, 'register', '/register', '注册页面');
INSERT INTO "view" VALUES (8, 'usermanager', '/admin/users/usermanager', null);
INSERT INTO "view" VALUES (9, 'adduser', '/admin/users/add', null);
INSERT INTO "view" VALUES (10, 'updateuser', '/admin/users/update', null);
INSERT INTO "view" VALUES (11, 'overview', '/admin/overview', null);
INSERT INTO "view" VALUES (12, 'costume', '/admin/costume', null);
INSERT INTO "view" VALUES (13, 'index', '/index', null);
INSERT INTO "view" VALUES (14, 'login', '/login', null);
INSERT INTO "view" VALUES (15, 'usertypemanager', '/admin/auth/usertype/manager', '用户类型管理');
INSERT INTO "view" VALUES (16, 'usertypeapimanager', '/admin/auth/usertypeapi/manager', '用户权限管理');
INSERT INTO "view" VALUES (17, 'usertypeviewmanager', '/admin/auth/usertypeview/manager', null);
INSERT INTO "view" VALUES (18, 'usertypeadd', '/admin/auth/usertype/add', null);
INSERT INTO "view" VALUES (19, 'userytpeupdate', '/admin/auth/usertype/update', null);
COMMIT;


-- ----------------------------
-- Indexes structure for table setting
-- ----------------------------
CREATE UNIQUE INDEX "key"
ON "setting" ("key" ASC);

-- ----------------------------
-- Indexes structure for table user
-- ----------------------------
CREATE UNIQUE INDEX "password"
ON "user" ("username" ASC, "passwd" ASC);

