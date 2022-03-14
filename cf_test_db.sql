-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for cf_test
CREATE DATABASE IF NOT EXISTS `cf_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cf_test`;

-- Dumping structure for table cf_test.recipe-categories
CREATE TABLE IF NOT EXISTS `recipe-categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table cf_test.recipe-categories: ~3 rows (approximately)
/*!40000 ALTER TABLE `recipe-categories` DISABLE KEYS */;
INSERT INTO `recipe-categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'makanan', '2022-03-14 09:12:37', '2022-03-14 09:12:40'),
	(2, 'minuman', '2022-03-14 09:12:54', '2022-03-14 09:12:55'),
	(3, 'sambal', '2022-03-14 09:13:02', '2022-03-14 09:13:03');
/*!40000 ALTER TABLE `recipe-categories` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
