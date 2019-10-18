DROP SCHEMA IF EXISTS `mywebpage_users_data`;
CREATE SCHEMA IF NOT EXISTS `mywebpage_users_data`;
USE `mywebpage_users_data`;

DROP DATABASE IF EXISTS `mywebpage_users_data`;
CREATE DATABASE IF NOT EXISTS `mywebpage_users_data`;
USE `mywebpage_users_data`;

DROP TABLE IF EXISTS `mywebpage_users_data`;
CREATE TABLE `users`(
`id` int(16) NOT NULL AUTO_INCREMENT,
`username` varchar(128) NOT NULL,
`password` varchar(128) NOT NULL,
`email` varchar(128) NOT NULL,

PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`(
`id` int(16) NOT NULL AUTO_INCREMENT,
`authority` varchar(16) NOT NULL,

PRIMARY KEY(`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users_and_authorities`;
CREATE TABLE `users_and_authorities`(
`id_username` int(16) NOT NULL,
`id_authority` int(16) NOT NULL,

PRIMARY KEY(`id_username`,`id_authority`),
CONSTRAINT `id_usr_fk` FOREIGN KEY(`id_username`) REFERENCES `users`(`id`)
 ON DELETE NO ACTION ON UPDATE NO ACTION,

CONSTRAINT `id_ath_fk` FOREIGN KEY(`id_authority`) REFERENCES `authorities`(`id`)
 ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO `users`(username,password,email) VALUES
('admin','$2a$10$gVe79hF0FUnkEtyPINxhlubAO0dfNUcRV7WKZnV0250lL/4tugsW.','knowak242@gamil.com');

INSERT INTO `authorities` (authority) VALUES
('ROLE_ADMIN'),
('ROLE_USER');

INSERT INTO `users_and_authorities`(id_username,id_authority) VALUES(1,1);

SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
`id` int(16) NOT NULL auto_increment,
`username` varchar(256) NOT NULL,
`message` varchar(10000) NOT NUll,

PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP Table if EXISTS `forms`;

CREATE TABLE `forms` (
`id` int(16) NOT NULL auto_increment,
`username` varchar(256) NOT NULL,
`having_comps` varchar(10000) NOT NUll,
`max_cost` int(8) NOT NULL,
`additional_notes` varchar(1000) NOT NULL,

PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
