/*
 Navicat Premium Data Transfer

 Source Server         : XFServer-mgr
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : 127.0.0.1
 Source Database       : oauthdb

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 06/16/2017 17:27:19 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `authorities`
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `authority` varchar(50) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `ix_auth_username` (`username`,`authority`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `authorities`
-- ----------------------------
BEGIN;
INSERT INTO `authorities` VALUES ('marissa', 'ROLE_USER'), ('sam', 'ROLE_USER');
COMMIT;

-- ----------------------------
--  Table structure for `clientdetails`
-- ----------------------------
DROP TABLE IF EXISTS `clientdetails`;
CREATE TABLE `clientdetails` (
  `appId` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `resourceIds` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `appSecret` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `scope` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `grantTypes` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `redirectUrl` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `authorities` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additionalInformation` varchar(2048) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `oauth_access_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `client_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `oauth_client_details`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `resource_ids` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `client_secret` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `scope` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `authorized_grant_types` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `authorities` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(2048) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `oauth_client_details`
-- ----------------------------
BEGIN;
INSERT INTO `oauth_client_details` VALUES ('my-client-with-registered-redirect', null, null, 'read,trust', 'authorization_code,client_credentials', 'http://anywhere?key=value', 'ROLE_CLIENT', null, null, null), ('my-client-with-secret', null, 'secret', 'read', 'client_credentials', null, 'ROLE_CLIENT', null, null, null), ('my-less-trusted-autoapprove-client', null, null, 'read,write,trust', 'implicit', null, 'ROLE_CLIENT', null, null, null), ('my-less-trusted-client', null, null, null, 'authorization_code,implicit', null, 'ROLE_CLIENT', null, null, null), ('my-trusted-client', null, null, 'read,write,trust', 'password,authorization_code,refresh_token,implicit', null, 'ROLE_CLIENT, ROLE_TRUSTED_CLIENT', '60', null, null), ('my-trusted-client-with-secret', null, 'somesecret', null, 'password,authorization_code,refresh_token,implicit', null, 'ROLE_CLIENT, ROLE_TRUSTED_CLIENT', null, null, null), ('my-untrusted-client-with-registered-redirect', null, null, 'read', 'authorization_code', 'http://anywhere', 'ROLE_CLIENT', null, null, null), ('tonr', 'sparklr', 'secret', 'read,write', 'authorization_code,implicit', null, 'ROLE_CLIENT', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `oauth_client_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `client_id` varchar(256) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `oauth_code`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `oauth_refresh_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('marissa', 'wombat', '1'), ('sam', 'kangaroo', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
