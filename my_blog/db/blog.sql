/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-11-11 09:12:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `c_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('16', '玫瑰玫瑰我爱你', '###你的脆弱迷惘不过就这样，错过了心爱的估量，宣告世界的那个轻狂已不知去向', '9', '2018-11-11 09:11:40');
INSERT INTO `article` VALUES ('6', '1', '1', '1', '2018-11-08 20:18:31');
INSERT INTO `article` VALUES ('7', 'ss', 'sasd', '1', '2018-11-08 20:19:55');
INSERT INTO `article` VALUES ('8', 'ss', 'sss', '1', '2018-11-08 20:21:14');
INSERT INTO `article` VALUES ('9', 'sss', 'sss', '1', '2018-11-08 20:22:20');
INSERT INTO `article` VALUES ('10', 'ss', 'sss', '1', '2018-11-08 20:24:49');
INSERT INTO `article` VALUES ('11', 'ss', 'wewqecd', '1', '2018-11-08 20:29:00');
INSERT INTO `article` VALUES ('12', 'xsadfa', 'safsfa', '1', '2018-11-08 20:37:36');
INSERT INTO `article` VALUES ('13', '2323', '24ewqdc', '1', '2018-11-08 20:40:04');
INSERT INTO `article` VALUES ('14', '第一天笔记', '## Node.js day01 ##\r\n\r\n### Node简介 ###\r\n\r\n	node的JavaScript解析器就是V8引擎\r\n\r\n	在node中没有DOM和BOM的概念, 由以下三部分组成:\r\n\r\n		1. ECMAScript\r\n		2. 全局成员\r\n		3. 核心模块API\r\n\r\n	学习目标: 使用node平台搭建一个后台服务器, 进行后端开发\r\n\r\nREPL环境: Read Eval Print Loop  同浏览器控制台\r\n\r\n### ES6语法介绍 ###\r\n\r\n#### let关键字 ####\r\n\r\n定义变量\r\n\r\n因为`var`关键字存在一些问题:\r\n\r\n1. 没有块级作用域\r\n\r\n		for (var i = 0; i < 10; i++) {\r\n\r\n		}\r\n\r\n		console.log(i) // 10\r\n\r\n\r\n2. 变量声明提升\r\n\r\n		console.log(a); // undefined\r\n		var a;\r\n\r\n如果使用`let`关键字则不存在以上两个问题:\r\n\r\n	\r\n		for (let i = 0; i < 10; i++) {\r\n\r\n		}\r\n\r\n		console.log(i) // 报错: i is not defined\r\n\r\n\r\n		console.log(a); // 报错: a is not defined\r\n		let a;\r\n\r\n总结: 使用`let`关键字声明变量的特点主要就是有块级作用域, 并且必须先声明再使用, 否则会报错, 没有变量声明提升的概念\r\n\r\n#### const关键字 ####\r\n\r\n定义常量\r\n\r\n	const a = 10;  // 从此以后a不能被重新赋值\r\n\r\n	a + 1; // 没有对a赋值 所以不会报错\r\n\r\n	a += 1; // 报错: Assignment to constant variable\r\n\r\n	const b; // 报错: Missing initializer in const declaration\r\n\r\n总结:\r\n\r\n1. 定义常量时必须要给初始值\r\n2. 定义完常量后无法对常量进行重新赋值\r\n\r\n\r\nlet和const都必须要先声明再使用, 并且都不可以重复声明\r\n\r\n#### 解构赋值 ####\r\n\r\n解构赋值一般用于将对象中的属性值获取出来, 存在变量中使用\r\n\r\n	let user = {\r\n		name: \'刘希晗\',\r\n		age: 18,\r\n		gender: \'男\'\r\n	}\r\n\r\n	// 开发中如果需要将对象的属性值提取出来在变量中使用: \r\n	let uname = user.name;\r\n\r\n	// ES6新语法, 将对象中属性批量提取到变量中:\r\n	let { name:username, age } = user;\r\n	console.log(username);\r\n	console.log(age);\r\n\r\n#### 箭头函数 ####\r\n\r\nES6中提出的一种新型匿名函数的语法:\r\n\r\n也可以理解为一种语法糖\r\n\r\n	let 函数名 = (形参1, 形参2) => {\r\n 		// 函数体\r\n	}\r\n\r\n特点: **指向外部函数的this, 语法较为简单**\r\n\r\n注意: 绑定事件时千万不要使用箭头函数, 因为使用function绑定事件处理函数, 内部的this指向事件源, 如果使用箭头函数绑定, 则不会指向事件源\r\n\r\n箭头函数的几种变体:\r\n\r\n1. 函数只有一个形参, 那么左侧的`()`可以省略\r\n\r\n		let fn1 = (a) => {\r\n			return a + 1;\r\n		}\r\n\r\n		let fn2 = a => {\r\n			return a + 1;\r\n		}\r\n\r\n2. 函数体中只有一行代码, 那么右侧的`{}`可以省略并且省略`return`, 默认会返回右侧代码执行的结果\r\n\r\n		let fn1 = (a, b) => {\r\n			return a + b;\r\n		}\r\n\r\n		let fn2 = (a, b) => a + b\r\n			\r\n3. 结合以上两点, 如果只有一个形参, 并且函数体中只有一行代码, 那么两侧的`(){}`都可以省略\r\n\r\n		let fn1 = (a) => {\r\n			return a + 1;\r\n		}\r\n\r\n		let fn2 = a => a + 1\r\n\r\n注意事项: 只有一个形参的情况下可以省略左侧的`()`, 其他情况有多个参数或者没有参数都必须加上`()`\r\n\r\n#### 声明对象属性的简洁语法 ####\r\n\r\n以前创建对象属性的字面量:\r\n\r\n	var name = \'刘希晗\';\r\n	var age = 18;\r\n	var weight = 80;\r\n\r\n	var user = {\r\n		name: name,\r\n		age: age,\r\n		weight: weight,\r\n		eat: function(food) {\r\n			console.log(\'吃了十斤\' + food);\r\n		}\r\n	}\r\n\r\nES6新语法:\r\n\r\n	let name = \'刘希晗\';\r\n	let age = 18;\r\n	let weight = 80;\r\n	let gender = \'女\';\r\n\r\n	let user = {\r\n		name,\r\n		age,\r\n		weight,\r\n		gender,\r\n		eat(food) {\r\n			console.log(\'吃了十斤\' + food);\r\n		},\r\n		sleep() {\r\n			console.log(\'上课睡觉真舒服\');\r\n		}\r\n	}\r\n\r\n\r\n### 内置模块 ###\r\n\r\n#### fs ####\r\n\r\nfs模块: File System 文件系统, node提供用于操作文件或目录的API都在该模块中\r\n\r\n1. 读取文件\r\n\r\n		readFile()\r\n\r\n		参数1: 要读取的文件路径, 如果是相对路径表示相对于当前执行node命令的路径, 而非相对当前文件, 如果需要相对当前文件路径, 请使用: __dirname进行拼接\r\n\r\n		参数2: 编码, 一般情况都需要指定编码, 默认值为null\r\n\r\n		参数3: 回调函数, 读取完文件后会执行, 有两个参数, 第一个参数为err, 第二个参数是读取的数据data\r\n\r\n2. 写入文件, 会覆盖文件\r\n\r\n		writeFile()\r\n\r\n		参数1: 要读取的文件路径, 如果是相对路径表示相对于当前执行node命令的路径, 而非相对当前文件, 如果需要相对当前文件路径, 请使用: __dirname进行拼接\r\n\r\n		参数2: 要写的数据内容\r\n\r\n		可选参数3: 编码, 默认为utf8, 一般就使用默认的\r\n\r\n		参数4: 回调函数, 写入完文件后会执行, 有一个参数err写入失败时会有数据, 如果err为null表示写入成功\r\n\r\n3. 追加文件, 在文件末尾继续追加\r\n\r\n		appendFile()\r\n\r\n		参数1: 要读取的文件路径, 如果是相对路径表示相对于当前执行node命令的路径, 而非相对当前文件, 如果需要相对当前文件路径, 请使用: __dirname进行拼接\r\n\r\n		参数2: 要写的数据内容\r\n\r\n		可选参数3: 编码, 默认为utf8, 一般就使用默认的\r\n\r\n		参数4: 回调函数, 写入完文件后会执行, 有一个参数err写入失败时会有数据, 如果err为null表示写入成功\r\n\r\n写入文件和追加文件都有共同的特点, 如果要写入的目录下文件不存在, 会自动创建文件并写入/追加\r\n\r\n全局成员: __dirname, 获取当前文件所在的绝对路径\r\n\r\n因为在node中使用相对路径都是相对于当前执行node指令的目录, 所以才会有__dirname和__filename的存在\r\n', '1', '2018-11-08 21:49:32');
INSERT INTO `article` VALUES ('15', '1', 'wqeeqwwree', '1', '2018-11-09 21:19:26');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `ctime` varchar(255) NOT NULL,
  `isdel` tinyint(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', 'gaoxing', 'gx', 'happy', '2018-11-10 17:04:34', '0');
INSERT INTO `user` VALUES ('10', 'xh', '123', 'ff', '2018-11-10 16:23:25', '0');
INSERT INTO `user` VALUES ('9', 'rose', '$2b$10$c4tvrO45rI9mwHTtEyH9qe/rKWdsaa4CYKBT3S/2T6khf9CF8BBUO', '玫瑰', '2018-11-10 15:19:06', '0');
