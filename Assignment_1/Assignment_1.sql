SET FOREIGN_KEY_CHECKS=OFF;

DROP TABLE IF EXISTS `tasting_evaluation`; 
DROP TABLE IF EXISTS `bottle`; 
DROP TABLE IF EXISTS `wine`; 
DROP TABLE IF EXISTS `member`; 

SET FOREIGN_KEY_CHECKS=ON;

CREATE TABLE `tasting_evaluation`(
    `bottle_name` varchar(16) not null,
    `bottle_appellation` varchar(16) not null,
    `bottle_vintage` year not null,
    `bottle_number` tinyint not null,
    `evaluator` int not null,
    `week` date not null,
    `evaluator_label` varchar(11) not null check (
	   `evaluator_label` = `outstanding` 
    or `evaluator_label` = `mediocre`
    or `evaluator_label` = `bad`
    or `evaluator_label` = `good`),
    primary key(`bottle_name`,`bottle_appellation`, `bottle_vintage`, `bottle_number`, `evaluator`, `week`)
) ENGINE=INNODB ;


CREATE TABLE `bottle`(
	`wine_name` varchar(16) not null,
    `wine_appellation` varchar(16) not null,
    `wine_vintage` year not null,
    `bottle_number` tinyint not null,
    `status` bit not null,
    primary key(`wine_name`, `wine_appellation`, `wine_vintage`, `bottle_number`)
) ENGINE=INNODB;

ALTER TABLE `bottle` 
	ADD FOREIGN KEY (`wine_name`, `wine_appellation`,`wine_vintage`,`bottle_number`)
	REFERENCES `tasting_evaluation`(`bottle_name`,`bottle_appellation`,`bottle_vintage`,`bottle_number`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

CREATE TABLE `wine`(
    `name` varchar(16),
    `appellation` varchar(16),
    `vintage` year,
    `alcohol_degree` decimal check (`alcohol_degree` > 0 and `alcohol_degree` < 20),
    `country` varchar(32),
    `grape_variety` varchar(32),
    primary key(`name`, `appellation`, `vintage`)
) ENGINE=INNODB;

ALTER TABLE `wine` 
	ADD FOREIGN KEY (`name`, `appellation`,`vintage`)
	REFERENCES `bottle`(`wine_name`,`wine_appellation`,`wine_vintage`)
    ON UPDATE CASCADE
    ON DELETE CASCADE;

CREATE TABLE `member`(
    `member_number` int REFERENCES `tasting_evaluation`(`evaluator`),
    `name` varchar(64) not null,
    `phone_number` varchar(32) unique,
    `email` varchar(64) not null unique,
    `address` varchar(255),
	primary key(`member_number`)
) ENGINE=INNODB;
