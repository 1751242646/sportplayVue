
CREATE TABLE `easyuser` (
  `id` INT(24) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `state` TINYINT(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


INSERT INTO `easyuser` VALUES ('1', 'admin', '123456', '123@qq.com', '超级管理员', '1');
INSERT INTO `easyuser` VALUES ('2', 'naughty', '888888', '456@qq.com', '普通管理员', '0');
INSERT INTO `easyuser` VALUES ('3', 'flysky01', '987654', 'qwe@qq.com', '普通用户', '1');
INSERT INTO `easyuser` VALUES ('4', 'anglybirds', '321654', 'aaaa@163.com', '普通用户', '0');
INSERT INTO `easyuser` VALUES ('7', 'admin003', 'q123456', 'c@qq.com', '普通用户', '1');
INSERT INTO `easyuser` VALUES ('8', 'admin005', '123456', 'cxz@qq.com', '普通用户', '0');
INSERT INTO `easyuser` VALUES ('9', 'admin007', '123456', 'rty@qq.com', '普通用户', '0');

UPDATE easyuser SET state = 1 WHERE id = 2;



CREATE TABLE `mainmenu` (
  `id` INT(50) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

INSERT INTO `mainmenu` VALUES ('100', '权限管理', '/admin');
INSERT INTO `mainmenu` VALUES ('200', '运动平台', '/use');




CREATE TABLE `submenu` (
  `id` INT(50) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `mid` INT(50) `submenu`NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  CONSTRAINT `submenu_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `mainmenu` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;


INSERT INTO `submenu` VALUES ('101', '用户列表', '/user', '100');
INSERT INTO `submenu` VALUES ('102', '修改权限', '/rights', '100');
INSERT INTO `submenu` VALUES ('103', ' 运动模块', '/sport', '100');
INSERT INTO `submenu` VALUES ('104', '商品模块', '/goods', '100');
INSERT INTO `submenu` VALUES ('201', '运动科普', '/Introduction', '200');
INSERT INTO `submenu` VALUES ('202', '卡路里', '/calories', '200');
INSERT INTO `submenu` VALUES ('203', '营养配餐', '/food', '200');





SELECT * FROM easyuser WHERE username='admin' AND PASSWORD='123456' AND state = 1;


 SELECT mm.*,sm.id as sid ,sm.title as stitle,sm.path as spath FROM mainmenu mm ,submenu sm WHERE mm.id = sm.mid; 