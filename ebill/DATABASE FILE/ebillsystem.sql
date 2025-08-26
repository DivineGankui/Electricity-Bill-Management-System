SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `ebillsystem`

DELIMITER $$

-- Procedures
CREATE DEFINER=`root`@`localhost` PROCEDURE `unitstoamount` (IN `units` INT(14), OUT `result` INT(14))  
BEGIN
    DECLARE a INT(14) DEFAULT 0;
    DECLARE b INT(14) DEFAULT 0;
    DECLARE c INT(14) DEFAULT 0;

    SELECT twohundred FROM unitsrate INTO a;
    SELECT fivehundred FROM unitsrate INTO b;
    SELECT thousand FROM unitsrate INTO c;

    IF units < 200 THEN
        SELECT a * units INTO result;
    ELSEIF units < 500 THEN
        SELECT (a * 200) + (b * (units - 200)) INTO result;
    ELSE
        SELECT (a * 200) + (b * 300) + (c * (units - 500)) INTO result;
    END IF;
END$$

-- Functions
CREATE DEFINER=`root`@`localhost` FUNCTION `curdate1`() RETURNS INT(11)  
BEGIN
    DECLARE x INT;
    SET x = DAYOFMONTH(CURDATE());
    IF (x = 1) THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------
-- Table structure
-- --------------------------------------------------------

-- Admin
CREATE TABLE `admin` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Default admin (optional)
INSERT INTO `admin` (`id`, `name`, `email`, `pass`) 
VALUES (1, 'ADMIN Divine', 'divinegankui743@gmail.com', 'Experience@743');

-- User
CREATE TABLE `user` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- Bill
CREATE TABLE `bill` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `aid` int(14) NOT NULL,
  `uid` int(14) NOT NULL,
  `units` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bdate` date NOT NULL,
  `ddate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Complaint
CREATE TABLE `complaint` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `uid` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `complaint` varchar(140) NOT NULL,
  `status` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Transaction
CREATE TABLE `transaction` (
  `id` int(14) NOT NULL AUTO_INCREMENT,
  `bid` int(14) NOT NULL,
  `payable` decimal(10,2) NOT NULL,
  `pdate` date DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Unitsrate
CREATE TABLE `unitsrate` (
  `sno` int(1) NOT NULL AUTO_INCREMENT,
  `twohundred` int(14) NOT NULL,
  `fivehundred` int(14) NOT NULL,
  `thousand` int(14) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Default rate values
INSERT INTO `unitsrate` (`sno`, `twohundred`, `fivehundred`, `thousand`) 
VALUES (1, 2, 5, 10);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
