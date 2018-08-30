-- --------------------------------------------------------
-- Host:                         192.168.1.10
-- Server Version:               10.1.23-MariaDB-9+deb9u1 - Raspbian 9.0
-- Server Betriebssystem:        debian-linux-gnueabihf
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für lggr
CREATE DATABASE IF NOT EXISTS `lggr` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lggr`;

-- Exportiere Struktur von View lggr.archived
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `archived` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pid` INT(10) UNSIGNED NOT NULL,
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.Archived
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `Archived` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`pid` INT(10) UNSIGNED NOT NULL,
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.DNSQueries
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `DNSQueries` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`DNS_Server` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Querying_Host` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`Queried_Host` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.lasthour
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `lasthour` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.Lasthour
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `Lasthour` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.MessagesCountByProgram
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `MessagesCountByProgram` (
	`Program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Anzahl` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.MessagesCountByServer
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `MessagesCountByServer` (
	`Server` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Anzahl` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Exportiere Struktur von Tabelle lggr.newlogs
CREATE TABLE IF NOT EXISTS `newlogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `facility` enum('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL,
  `level` enum('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL,
  `host` varchar(50) NOT NULL,
  `program` varchar(50) NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `archived` enum('Y','N') NOT NULL DEFAULT 'N',
  `message` text NOT NULL,
  `idhost` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`) USING HASH,
  KEY `host` (`host`) USING HASH,
  KEY `program` (`program`(5))
) ENGINE=Aria AUTO_INCREMENT=112143034 DEFAULT CHARSET=utf8 PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='New logging table';

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von View lggr.RoutingFW
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `RoutingFW` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`Router` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`ACTION` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`IN` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`OUT` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`SHOST` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`SPORT` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`DHOST` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`DPORT` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci',
	`PROTOCOL` MEDIUMTEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von Tabelle lggr.servers
CREATE TABLE IF NOT EXISTS `servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of all servers we have referenced in newlogs';

-- Daten Export vom Benutzer nicht ausgewählt
-- Exportiere Struktur von View lggr.Servers
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `Servers` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.Today
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `Today` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.today
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `today` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.week
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `week` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.Week
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `Week` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.year
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `year` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.Year
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `Year` (
	`id` BIGINT(20) NOT NULL,
	`date` DATETIME NOT NULL,
	`facility` ENUM('kern','user','mail','daemon','auth','syslog','lpr','news','uucp','authpriv','ftp','cron','local0','local1','local2','local3','local4','local5','local6','local7') NOT NULL COLLATE 'utf8_general_ci',
	`level` ENUM('emerg','alert','crit','err','warning','notice','info','debug') NOT NULL COLLATE 'utf8_general_ci',
	`host` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`program` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`archived` ENUM('Y','N') NOT NULL COLLATE 'utf8_general_ci',
	`message` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View lggr.archived
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `archived`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `archived` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`pid` AS `pid`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`archived` = 'Y');

-- Exportiere Struktur von View lggr.Archived
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `Archived`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `Archived` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`pid` AS `pid`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`archived` = 'Y');

-- Exportiere Struktur von View lggr.DNSQueries
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `DNSQueries`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `DNSQueries` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`host` AS `DNS_Server`,substring_index(substring_index(`newlogs`.`message`,' ',-(1)),'/',1) AS `Querying_Host`,substring_index(substring_index(`newlogs`.`message`,' ',-(3)),' ',1) AS `Queried_Host` from `newlogs` where (((`newlogs`.`program` = 'dnsmasq') and (`newlogs`.`message` like '%query[A]%')) or (`newlogs`.`message` like '%query[AAAA]%')) order by `newlogs`.`date` desc;

-- Exportiere Struktur von View lggr.lasthour
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `lasthour`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lasthour` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`date` >= (now() - interval 1 hour));

-- Exportiere Struktur von View lggr.Lasthour
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `Lasthour`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `Lasthour` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`date` >= (now() - interval 1 hour));

-- Exportiere Struktur von View lggr.MessagesCountByProgram
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `MessagesCountByProgram`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `MessagesCountByProgram` AS select `newlogs`.`program` AS `Program`,count(`newlogs`.`program`) AS `Anzahl` from `newlogs` group by `newlogs`.`program`;

-- Exportiere Struktur von View lggr.MessagesCountByServer
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `MessagesCountByServer`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `MessagesCountByServer` AS select `newlogs`.`host` AS `Server`,count(`newlogs`.`host`) AS `Anzahl` from `newlogs` group by `newlogs`.`host`;

-- Exportiere Struktur von View lggr.RoutingFW
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `RoutingFW`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `RoutingFW` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`host` AS `Router`,substring_index(substring_index(`newlogs`.`message`,']',-(1)),'(',1) AS `ACTION`,substring_index(substring_index(`newlogs`.`message`,'IN=',-(1)),' ',1) AS `IN`,substring_index(substring_index(`newlogs`.`message`,'OUT=',-(1)),' ',1) AS `OUT`,substring_index(substring_index(`newlogs`.`message`,'SRC=',-(1)),' ',1) AS `SHOST`,substring_index(substring_index(`newlogs`.`message`,'SPT=',-(1)),' ',1) AS `SPORT`,substring_index(substring_index(`newlogs`.`message`,'DST=',-(1)),' ',1) AS `DHOST`,substring_index(substring_index(`newlogs`.`message`,'DPT=',-(1)),' ',1) AS `DPORT`,substring_index(substring_index(`newlogs`.`message`,'PROTO=',-(1)),' ',1) AS `PROTOCOL` from `newlogs` where ((`newlogs`.`program` = 'kernel') and (`newlogs`.`message` like '%IN=%') and (`newlogs`.`message` like '%OUT=%')) order by `newlogs`.`date` desc;

-- Exportiere Struktur von View lggr.Servers
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `Servers`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `Servers` AS select `servers`.`id` AS `id`,`servers`.`name` AS `name` from `servers`;

-- Exportiere Struktur von View lggr.Today
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `Today`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `Today` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (cast(now() as date) = cast(`newlogs`.`date` as date));

-- Exportiere Struktur von View lggr.today
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `today`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `today` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (cast(now() as date) = cast(`newlogs`.`date` as date));

-- Exportiere Struktur von View lggr.week
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `week`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `week` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`date` >= (now() - interval 168 hour));

-- Exportiere Struktur von View lggr.Week
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `Week`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `Week` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`date` >= (now() - interval 168 hour));

-- Exportiere Struktur von View lggr.year
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `year`;
CREATE ALGORITHM=TEMPTABLE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `year` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`date` >= (now() - interval 1 year));

-- Exportiere Struktur von View lggr.Year
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `Year`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`192.168.1.11` SQL SECURITY DEFINER VIEW `Year` AS select `newlogs`.`id` AS `id`,`newlogs`.`date` AS `date`,`newlogs`.`facility` AS `facility`,`newlogs`.`level` AS `level`,`newlogs`.`host` AS `host`,`newlogs`.`program` AS `program`,`newlogs`.`archived` AS `archived`,`newlogs`.`message` AS `message` from `newlogs` where (`newlogs`.`date` >= (now() - interval 1 year));

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
