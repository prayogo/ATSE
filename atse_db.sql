-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2014 at 02:10 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `atse_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ltpricerange`
--

CREATE TABLE IF NOT EXISTS `ltpricerange` (
  `pricerangeid` int(11) NOT NULL AUTO_INCREMENT,
  `price1` int(11) DEFAULT NULL,
  `price2` int(11) DEFAULT NULL,
  PRIMARY KEY (`pricerangeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ltpricerange`
--

INSERT INTO `ltpricerange` (`pricerangeid`, `price1`, `price2`) VALUES
(1, 0, 50000),
(2, 50000, 100000),
(3, 100000, 150000),
(4, 150000, 200000),
(5, 200000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ltrole`
--

CREATE TABLE IF NOT EXISTS `ltrole` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ltrole`
--

INSERT INTO `ltrole` (`roleid`, `role`) VALUES
(1, 'Admin'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `ltstatus`
--

CREATE TABLE IF NOT EXISTS `ltstatus` (
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ltstatus`
--

INSERT INTO `ltstatus` (`statusid`, `status`) VALUES
(1, 'In Progress'),
(2, 'Packing'),
(3, 'En Route'),
(4, 'Delivered'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `msproduct`
--

CREATE TABLE IF NOT EXISTS `msproduct` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `msproduct`
--

INSERT INTO `msproduct` (`productid`, `name`, `description`, `price`, `image`) VALUES
(1, 'Peace In The Middle East', 'Homemade hummus, vine ripe tomatoes, black olives, caramelized onions, feta, fresh basil, pepperoncini and mozzarella.', 221000, ''),
(2, 'Mr. Pestato Head', 'Homemade pesto sauce, roasted potatoes, caramelized onions, feta, fresh basil, oregano and mozzarella.', 221000, ''),
(3, 'Railroad Grade', 'Italian sausage, pepperoni, fresh mushrooms, red onions, tomato sauce, mozzarella and cheddar', 221000, ''),
(4, 'Paia Pie', 'Hawaiian pineapple, Canadian bacon, Mandarin oranges, tomato sauce, mozzarella and cheddar.', 221000, ''),
(5, 'Pandora''s Box', 'Spinach, artichoke hearts, sun-dried tomatoes, feta, garlic, fresh basil, oregano and mozzarella (tomato sauce upon request, no charge).', 221000, ''),
(6, 'Drag It Through The Garden', 'Fresh mushrooms, green peppers, red onions, artichoke hearts, broccoli, vine ripe tomatoes, fresh basil, tomato sauce, mozzarella and cheddar.', 221000, ''),
(7, 'Baja 1000', 'Grilled chicken, black beans and salsa, black olives, red onions, vine ripe tomatoes, jalapeños, fresh cilantro and cheddar', 221000, ''),
(8, 'Ragin'' Rooster', 'Chicken marinated in a sweet BBQ sauce, red onions, fresh cilantro, cheddar and mozzarella.', 221000, ''),
(9, 'The Boar''der', 'Shredded pork marinated in a sweet BBQ sauce, red onions, fresh cilantro, cheddar and mozzarella.', 80000, ''),
(10, 'Yard Sale', 'Italian sausage, pepperoni, salami, black olives, fresh mushrooms, green peppers, red onions, vine ripe tomatoes, tomato sauce, mozzarella and cheddar.', 221000, ''),
(11, 'Holy Cow', 'Swiss, fontina, gorgonzola, mozzarella, roasted walnuts and fresh sage (tomato sauce upon request, no charge)', 80000, ''),
(12, 'The Spice Route', 'Chicken marinated in spicy Tandoori sauce, green pepper, red onion, cilantro and mozzarella', 221000, ''),
(13, 'Green With Envy', 'Homemade pesto sauce, vine ripe tomatoes, feta, fresh basil, oregano and mozzarella.', 221000, ''),
(14, 'Screaming Tomato', 'Vine ripe tomatoes, garlic, fresh basil, mozzarella and cheddar.', 221000, ''),
(15, 'White Out', 'Fresh mushrooms, tomatoes, red onions, broccoli, roasted red peppers, fresh basil, oregano and tomato sauce.', 221000, ''),
(16, 'Aveiro', 'NEW! Portuguese linguica, smoked bacon, pepperoncini, roasted red peppers, tomato sauce, mozzarella, and fresh cilantro.', 80000, ''),
(17, 'Everest', 'Italian sausage, pepperoni, salami, beef meatball, tomato sauce, mozzarella and cheddar.', 80000, ''),
(18, 'Hanoi Fever', 'NEW! Shredded pork marinated in a spicy hoisin style sauce, mozzarella, peanuts, green onions, jalapeños, carrots and fresh cilantro.', 80000, ''),
(19, 'Kickin Chicken', 'Chicken marinated in a spicy ginger peanut sauce, peanuts, green onions, Swiss, fontina, fresh cilantro and mozzarella.', 80000, ''),
(20, 'Mont Blanc', 'Our zesty Alfredo sauce, crispy bacon, green onions, sliced tomatoes, parmesan cheese and mozzarella', 80000, ''),
(21, 'Poultry Geist', 'Chicken marinated in a tangy ranch sauce, broccoli, red onions, Swiss, fontina, gorgonzola, mozzarella and fresh sage', 80000, ''),
(23, 'Wham Bam Thank You Mammoth', 'Italian sausage, roasted red peppers, caramelized onions, parmesan, tomato sauce and mozzarella.', 80000, ''),
(24, 'Wingin'' It', 'Chicken marinated in a buffalo wing sauce, gorgonzola, mozzarella and celery.', 80000, '');

-- --------------------------------------------------------

--
-- Table structure for table `msuser`
--

CREATE TABLE IF NOT EXISTS `msuser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `FKC08BB67150813025` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `msuser`
--

INSERT INTO `msuser` (`userid`, `username`, `password`, `name`, `email`, `phone`, `address`, `roleid`) VALUES
(1, 'admin', 'admin', 'Administrator', 'admin@admin.com', '0123456789', 'Alamat No. 99', 1),
(2, 'Member', 'user12345', 'Member', 'member1@pizza.com', '1234567890', 'Jl. Binus no. 99 user12345', 2),
(3, 'testing', 'user12345', 'Testing Member', 'testing@pizza.com', '1234567890', 'sfsfsdfsdfsdf', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transactionreport`
--

CREATE TABLE IF NOT EXISTS `transactionreport` (
  `transactionheaderid` int(11) NOT NULL,
  `orderdate` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`transactionheaderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trcart`
--

CREATE TABLE IF NOT EXISTS `trcart` (
  `cartid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartid`),
  KEY `FKCC671A9EB20232DB` (`productid`),
  KEY `FKCC671A9E55D6858F` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trtransactiondetail`
--

CREATE TABLE IF NOT EXISTS `trtransactiondetail` (
  `transactiondetailid` int(11) NOT NULL AUTO_INCREMENT,
  `transactionheaderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`transactiondetailid`),
  KEY `FK6E77C9F1B20232DB` (`productid`),
  KEY `FK6E77C9F1B0178173` (`transactionheaderid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `trtransactiondetail`
--

INSERT INTO `trtransactiondetail` (`transactiondetailid`, `transactionheaderid`, `productid`, `price`, `qty`) VALUES
(1, 1, 17, 80000, 2),
(2, 1, 11, 80000, 1),
(3, 1, 5, 221000, 2),
(4, 1, 1, 221000, 1),
(5, 1, 15, 221000, 1),
(6, 2, 19, 80000, 1),
(7, 2, 8, 221000, 1),
(8, 2, 3, 221000, 1),
(9, 2, 14, 221000, 1),
(10, 2, 12, 221000, 1),
(11, 3, 16, 80000, 2),
(12, 3, 13, 221000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trtransactionheader`
--

CREATE TABLE IF NOT EXISTS `trtransactionheader` (
  `transactionheaderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL,
  `statusid` int(11) NOT NULL,
  PRIMARY KEY (`transactionheaderid`),
  KEY `FK7542942D9560709D` (`statusid`),
  KEY `FK7542942D55D6858F` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `trtransactionheader`
--

INSERT INTO `trtransactionheader` (`transactionheaderid`, `userid`, `orderdate`, `statusid`) VALUES
(1, 1, '2014-06-08 17:09:44', 5),
(2, 1, '2014-06-08 17:11:30', 1),
(3, 2, '2014-06-09 02:12:38', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `msuser`
--
ALTER TABLE `msuser`
  ADD CONSTRAINT `FKC08BB67150813025` FOREIGN KEY (`roleid`) REFERENCES `ltrole` (`roleid`);

--
-- Constraints for table `trcart`
--
ALTER TABLE `trcart`
  ADD CONSTRAINT `FKCC671A9E55D6858F` FOREIGN KEY (`userid`) REFERENCES `msuser` (`userid`),
  ADD CONSTRAINT `FKCC671A9EB20232DB` FOREIGN KEY (`productid`) REFERENCES `msproduct` (`productid`);

--
-- Constraints for table `trtransactiondetail`
--
ALTER TABLE `trtransactiondetail`
  ADD CONSTRAINT `FK6E77C9F1B0178173` FOREIGN KEY (`transactionheaderid`) REFERENCES `trtransactionheader` (`transactionheaderid`),
  ADD CONSTRAINT `FK6E77C9F1B20232DB` FOREIGN KEY (`productid`) REFERENCES `msproduct` (`productid`);

--
-- Constraints for table `trtransactionheader`
--
ALTER TABLE `trtransactionheader`
  ADD CONSTRAINT `FK7542942D55D6858F` FOREIGN KEY (`userid`) REFERENCES `msuser` (`userid`),
  ADD CONSTRAINT `FK7542942D9560709D` FOREIGN KEY (`statusid`) REFERENCES `ltstatus` (`statusid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
