
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL DEFAULT '',
  `lname` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `level` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `fname`, `lname`, `email`, `level`)
VALUES
	(1,'Blossom','Salter','name@test.com',2),
	(2,'Minahil','Mackie','name@test.com',4),
	(3,'Reegan','Easton','name@test.com',1),
	(4,'Lucas','Senior','name@test.com',3),
	(5,'Dianne','Griffith','name@test.com',3),
	(7,'Payton','Rivas','name@test.com',2),
	(8,'Wanda','Chapman','name@test.com',5),
	(9,'Bethany','Avery','name@test.com',3),
	(10,'Jules','Mccallum','name@test.com',2),
	(11,'Frank','Taylor','name@test.com',2),
	(12,'Aoife','Paine','name@test.com',3),
	(13,'Eadie','Powers','name@test.com',1),
	(14,'Nimrah','Silva','name@test.com',4),
	(15,'Frain','Defau','name@test.com',2);

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table goals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goals`;

CREATE TABLE `goals` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;

INSERT INTO `goals` (`id`, `name`)
VALUES
	(1,'Coding'),
	(2,'Public Speaking'),
	(3,'Documentation'),
	(4,'Meeting Facilitation'),
	(5,'Getting Buy-in'),
	(6,'DEI'),
	(7,'Product Management'),
	(8,'Data Visualization'),
	(9,'Agile');

/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table goals_employee_has
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goals_employee_has`;

CREATE TABLE `goals_employee_has` (
  `goal_id` int(11) unsigned NOT NULL,
  `emp_id` int(11) unsigned NOT NULL,
  KEY `emp_id` (`emp_id`),
  KEY `goal_id` (`goal_id`),
  CONSTRAINT `goals_employee_has_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goals_employee_has_ibfk_2` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `goals_employee_has` WRITE;
/*!40000 ALTER TABLE `goals_employee_has` DISABLE KEYS */;

INSERT INTO `goals_employee_has` (`goal_id`, `emp_id`)
VALUES
	(1,2),
	(1,4),
	(1,5),
	(2,2),
	(2,4),
	(2,5),
	(4,2),
	(3,4),
	(4,7),
	(2,13),
	(3,13),
	(6,7),
	(7,7),
	(7,2),
	(9,13),
	(8,13),
	(4,9);

/*!40000 ALTER TABLE `goals_employee_has` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table goals_employee_wants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goals_employee_wants`;

CREATE TABLE `goals_employee_wants` (
  `emp_id` int(11) unsigned NOT NULL,
  `goal_id` int(11) unsigned NOT NULL,
  KEY `emp_id` (`emp_id`),
  KEY `goal_id` (`goal_id`),
  CONSTRAINT `goals_employee_wants_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goals_employee_wants_ibfk_2` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `goals_employee_wants` WRITE;
/*!40000 ALTER TABLE `goals_employee_wants` DISABLE KEYS */;

INSERT INTO `goals_employee_wants` (`emp_id`, `goal_id`)
VALUES
	(1,2),
	(3,2),
	(4,4),
	(1,1),
	(3,1),
	(2,3),
	(5,3),
	(7,2),
	(7,1),
	(3,1),
	(3,3),
	(3,4),
	(3,5),
	(3,6),
	(3,7),
	(3,8),
	(3,9);

/*!40000 ALTER TABLE `goals_employee_wants` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table help_get
# ------------------------------------------------------------

DROP VIEW IF EXISTS `help_get`;

CREATE TABLE `help_get` (
   `wants_emp` INT(11) UNSIGNED NOT NULL,
   `wants_name` VARCHAR(41) NULL DEFAULT NULL,
   `wants_email` VARCHAR(50) NOT NULL DEFAULT '',
   `wants_emp_level` INT(2) NOT NULL,
   `goal_id` INT(11) UNSIGNED NULL DEFAULT NULL,
   `goal_name` VARCHAR(50) NOT NULL DEFAULT '',
   `has_emp` INT(11) UNSIGNED NULL DEFAULT NULL,
   `has_emp_level` INT(2) NOT NULL,
   `debug` VARCHAR(95) NULL DEFAULT NULL,
   `has_name` VARCHAR(41) NULL DEFAULT NULL,
   `has_email` VARCHAR(50) NOT NULL DEFAULT '',
   `level_diff` BIGINT(12) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;



# Dump of table help_give
# ------------------------------------------------------------

DROP VIEW IF EXISTS `help_give`;

CREATE TABLE `help_give` (
   `wants_emp` INT(11) UNSIGNED NOT NULL,
   `wants_name` VARCHAR(41) NULL DEFAULT NULL,
   `wants_email` VARCHAR(50) NOT NULL DEFAULT '',
   `wants_emp_level` INT(2) NOT NULL,
   `goal_id` INT(11) UNSIGNED NULL DEFAULT NULL,
   `goal_name` VARCHAR(50) NOT NULL DEFAULT '',
   `has_emp` INT(11) UNSIGNED NULL DEFAULT NULL,
   `has_emp_level` INT(2) NOT NULL,
   `debug` VARCHAR(95) NULL DEFAULT NULL,
   `has_name` VARCHAR(41) NULL DEFAULT NULL,
   `has_email` VARCHAR(50) NOT NULL DEFAULT '',
   `level_diff` BIGINT(12) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;





# Replace placeholder table for help_give with correct view syntax
# ------------------------------------------------------------

DROP TABLE `help_give`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `help_give`
AS SELECT
   `wants`.`emp_id` AS `wants_emp`,concat(`e_wants`.`fname`,' ',`e_wants`.`lname`) AS `wants_name`,
   `e_wants`.`email` AS `wants_email`,
   `e_wants`.`level` AS `wants_emp_level`,
   `has`.`goal_id` AS `goal_id`,
   `goals`.`name` AS `goal_name`,
   `has`.`emp_id` AS `has_emp`,
   `e_has`.`level` AS `has_emp_level`,concat(`e_wants`.`fname`,'->',`e_has`.`fname`,' (',`goals`.`name`,')') AS `debug`,concat(`e_has`.`fname`,' ',`e_has`.`lname`) AS `has_name`,
   `e_has`.`email` AS `has_email`,(`e_has`.`level` - `e_wants`.`level`) AS `level_diff`
FROM ((((`goals_employee_wants` `wants` left join `goals_employee_has` `has` on((`wants`.`goal_id` = `has`.`goal_id`))) join `employees` `e_has` on((`has`.`emp_id` = `e_has`.`id`))) join `employees` `e_wants` on((`wants`.`emp_id` = `e_wants`.`id`))) join `goals` on((`goals`.`id` = `has`.`goal_id`))) order by (`e_has`.`level` - `e_wants`.`level`);


# Replace placeholder table for help_get with correct view syntax
# ------------------------------------------------------------

DROP TABLE `help_get`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `help_get`
AS SELECT
   `wants`.`emp_id` AS `wants_emp`,concat(`e_wants`.`fname`,' ',`e_wants`.`lname`) AS `wants_name`,
   `e_wants`.`email` AS `wants_email`,
   `e_wants`.`level` AS `wants_emp_level`,
   `has`.`goal_id` AS `goal_id`,
   `goals`.`name` AS `goal_name`,
   `has`.`emp_id` AS `has_emp`,
   `e_has`.`level` AS `has_emp_level`,concat(`e_wants`.`fname`,'->',`e_has`.`fname`,' (',`goals`.`name`,')') AS `debug`,concat(`e_has`.`fname`,' ',`e_has`.`lname`) AS `has_name`,
   `e_has`.`email` AS `has_email`,(`e_has`.`level` - `e_wants`.`level`) AS `level_diff`
FROM ((((`goals_employee_wants` `wants` left join `goals_employee_has` `has` on((`wants`.`goal_id` = `has`.`goal_id`))) join `employees` `e_has` on((`has`.`emp_id` = `e_has`.`id`))) join `employees` `e_wants` on((`wants`.`emp_id` = `e_wants`.`id`))) join `goals` on((`goals`.`id` = `has`.`goal_id`))) order by (`e_has`.`level` - `e_wants`.`level`);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
