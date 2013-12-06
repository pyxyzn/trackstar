-- phpMyAdmin SQL Dump
-- version 3.1.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost:3336
-- 生成日期: 2013 年 12 月 06 日 17:41
-- 服务器版本: 5.5.25
-- PHP 版本: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `trackstar_dev`
--

-- --------------------------------------------------------

--
-- 表的结构 `tbl_issue`
--

CREATE TABLE IF NOT EXISTS `tbl_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `FK_issue_owner` (`owner_id`),
  KEY `FK_issue_requester` (`requester_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `tbl_issue`
--

INSERT INTO `tbl_issue` (`id`, `name`, `description`, `project_id`, `type_id`, `status_id`, `owner_id`, `requester_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, '测试项目问题1', '', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(2, '测试项目问题3', '', 1, 0, 1, 2, 1, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(3, 'testbbb', '', 1, 0, 0, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_project`
--

CREATE TABLE IF NOT EXISTS `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `tbl_project`
--

INSERT INTO `tbl_project` (`id`, `name`, `description`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'Test Project 1', 'Test Project 1', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(2, 'test dfadafd', 'fdafdsaf323232', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(3, '测试项目', '测试项目说明', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(4, '测试项目2', '测试项目2说明', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(5, '测试项目3', '测试项目3说明', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_project_user_assignment`
--

CREATE TABLE IF NOT EXISTS `tbl_project_user_assignment` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `FK_user_project` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `tbl_project_user_assignment`
--

INSERT INTO `tbl_project_user_assignment` (`project_id`, `user_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 1, NULL, NULL, NULL, NULL),
(1, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `email`, `username`, `password`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'test1@notanaddress.com', 'Test_User_One', '5a105e8b9d40e1329780d62ea2265d8a', NULL, NULL, NULL, NULL, NULL),
(2, 'test2@notanaddress.com', 'Test_User_Two', 'ad0234829205b9033196ba818f7a872b', NULL, NULL, NULL, NULL, NULL);

--
-- 限制导出的表
--

--
-- 限制表 `tbl_issue`
--
ALTER TABLE `tbl_issue`
  ADD CONSTRAINT `FK_issue_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- 限制表 `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD CONSTRAINT `FK_project_user` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_user_project` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;
