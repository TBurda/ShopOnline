-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1:3307
-- Vytvořeno: Sob 07. čec 2018, 20:47
-- Verze serveru: 5.7.19
-- Verze PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `shoponline`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `User_Name` varchar(20) NOT NULL,
  `Active` bit(1) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `User_Role` varchar(20) NOT NULL,
  PRIMARY KEY (`User_Name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `accounts`
--

INSERT INTO `accounts` (`User_Name`, `Active`, `Password`, `User_Role`) VALUES
('employee1', b'1', '123', 'EMPLOYEE'),
('manager1', b'1', '123', 'MANAGER');

-- --------------------------------------------------------

--
-- Struktura tabulky `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `categories`
--

INSERT INTO `categories` (`ID`, `Name`) VALUES
(1, 'parek'),
(2, 'Husty rizek'),
(3, 'suchy rizek'),
(4, 'hnedy rizek');

-- --------------------------------------------------------

--
-- Struktura tabulky `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `ID` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Customer_Address` varchar(255) NOT NULL,
  `Customer_Email` varchar(128) NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Customer_Phone` varchar(128) NOT NULL,
  `Order_Date` datetime NOT NULL,
  `Order_Num` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_sxhpvsj665kmi4f7jdu9d2791` (`Order_Num`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `orders`
--

INSERT INTO `orders` (`ID`, `Amount`, `Customer_Address`, `Customer_Email`, `Customer_Name`, `Customer_Phone`, `Order_Date`, `Order_Num`) VALUES
('d762e77d-203e-4d4b-8400-88177ec225e4', 100, 'Na Stav?, 1233', 'richtada2@gmail.com', 'Adam Richter', '605243840', '2018-07-07 17:37:08', 1);

-- --------------------------------------------------------

--
-- Struktura tabulky `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `ID` varchar(50) NOT NULL,
  `Amount` double NOT NULL,
  `Price` double NOT NULL,
  `Quanity` int(11) NOT NULL,
  `ORDER_ID` varchar(50) NOT NULL,
  `PRODUCT_ID` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ORDER_DETAIL_ORD_FK` (`ORDER_ID`),
  KEY `ORDER_DETAIL_PROD_FK` (`PRODUCT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `order_details`
--

INSERT INTO `order_details` (`ID`, `Amount`, `Price`, `Quanity`, `ORDER_ID`, `PRODUCT_ID`) VALUES
('8574cad7-45b3-4084-8c0f-c66baacdf0b4', 100, 100, 1, 'd762e77d-203e-4d4b-8400-88177ec225e4', '2');

-- --------------------------------------------------------

--
-- Struktura tabulky `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `Code` varchar(20) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Image` longblob,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` double NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`Code`),
  KEY `fk_products_category` (`CATEGORY_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Vypisuji data pro tabulku `products`
--

INSERT INTO `products` (`Code`, `Create_Date`, `Image`, `Name`, `Description`, `Price`, `CATEGORY_ID`) VALUES
('S001', '2018-07-07 11:41:06', NULL, 'Cannondale F-si Carbon 4 29er Mountain Bike  2019', 'The worlds best XC hardtail just got better. If going really really fast on dirt in lycra is your cup otea nothing lets you top em on the climbs and drop em on the descents like the all-new F-Si.', 5000, 1),
('S002', '2018-07-07 11:41:06', NULL, 'Specialized Epic Expert Mountain Bike  2018', 'An evolutionary leap forward from the Fargo, Cutthroat is all about speed and comfort.Racing-inspired geometry make for a quick bike that wonâ€™t leave you pummeled as you ride alongside a rising moon.', 5500, 1),
('S003', '2018-07-07 11:41:06', NULL, 'Cannondale F-si Carbon 2 29er Mountain Bike  2019', 'The worlds best XC hardtail just got better. If going really really fast on dirt in lycra is your cup o tea nothing lets you top em on the climbs and drop em on the descents like the all-new F-Si.', 4500, 1),
('S004', '2018-07-07 11:41:06', NULL, 'Specialized Rockhopper Sport Mountain Bike  201', 'Maybe you are finding your legs on the singletrack or perhaps you are just dirt-curious? Either way the Rockhopper Sport is the only bike you need to live out your trail fantasies.', 800, 1),
('S005', '2018-07-07 11:41:06', NULL, 'Kona Hei Hei Race Mountain Bike  2017', 'Raced to the ends of the Earth by the Kona Endurance Team this 29-inch Fuse Independent Suspension design has conquered 24-hour races and survived a vicious World Cup schedule on progressively more aggressive courses.', 1100, 1),
('a', '2018-07-07 17:26:58', NULL, 'aa', 'aaaaa', 100, 1),
('2', '2018-07-07 17:27:21', NULL, 'aa', 'aaaaa', 100, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
