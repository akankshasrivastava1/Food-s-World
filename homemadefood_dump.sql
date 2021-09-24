-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 26, 2019 at 11:34 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homemadefood`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cust_id` int(2) NOT NULL,
  `item_id` int(2) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_price` int(8) NOT NULL,
  `item_quantity` int(8) NOT NULL,
  `total_price` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(3) NOT NULL,
  `city_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'MP Nagar Bhopal'),
(2, 'DB City'),
(3, 'Indirapuram'),
(4, 'Manohar Road'),
(5, 'Vaishali'),
(6, 'Pitampura'),
(7, 'New Market Road'),
(8, 'Shamla Hills');

-- --------------------------------------------------------

--
-- Table structure for table `cuisine`
--

CREATE TABLE `cuisine` (
  `cuisine_id` int(2) NOT NULL,
  `cuisine_name` varchar(50) NOT NULL,
  `cuisine_image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuisine`
--

INSERT INTO `cuisine` (`cuisine_id`, `cuisine_name`, `cuisine_image`) VALUES
(1, 'Sweets', '1.jpeg'),
(2, 'Chinese Food', '2.jpeg'),
(3, 'Punjabi Food', '3.jpeg'),
(4, 'Kashmiri Food', '4.jpeg'),
(5, 'North Indian Food', '5.jpeg'),
(6, 'South Indian Food', '6.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(2) NOT NULL,
  `cust_fname` varchar(60) NOT NULL,
  `cust_lname` varchar(60) NOT NULL,
  `cust_email` text NOT NULL,
  `cust_phone` bigint(15) NOT NULL,
  `cust_address` text NOT NULL,
  `cust_pwd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_fname`, `cust_lname`, `cust_email`, `cust_phone`, `cust_address`, `cust_pwd`) VALUES
(0, 'akanksha', 'Sri...', 'akanksha@gmail.com', 2147483647, 'A-10, Kausambhi, bhopal', '1234'),
(0, 'akanksha', 'Srivastva', 'srivastva@gmail.com', 2147483647, 'Jehan Numa Palace 157, Shamla Hills, Bhopa', 'e10adc3949ba59abbe56e057f20f883e'),
(0, 'akanksha', '', 'aa@gmail.com', 2147483647, 'New Market', 'e10adc3949ba59abbe56e057f20f883e'),
(0, 'akanksha ', 'Shukla', 'ak@gmail.com', 2147483647, '12334 ez', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `rest_id` int(2) NOT NULL,
  `menu_id` int(2) NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `menu_price` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`rest_id`, `menu_id`, `menu_name`, `menu_price`) VALUES
(1, 1, 'Punjabi Thali', 200),
(3, 2, 'Gulab Jamun', 80),
(1, 3, 'South Indian Thali', 355),
(2, 5, 'Gujrati Thali', 400),
(3, 4, 'Kashmiri Thali', 400),
(4, 6, 'North Indian Thali', 350);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `city_id` int(2) NOT NULL,
  `cuisine_id` int(2) NOT NULL,
  `rest_id` int(2) NOT NULL,
  `rest_name` varchar(50) NOT NULL,
  `rest_address` text NOT NULL,
  `rest_speciality` varchar(50) NOT NULL,
  `rest_phone` bigint(12) NOT NULL,
  `rest_mail` text NOT NULL,
  `rest_desc` text NOT NULL,
  `rest_img` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`city_id`, `cuisine_id`, `rest_id`, `rest_name`, `rest_address`, `rest_speciality`, `rest_phone`, `rest_mail`, `rest_desc`, `rest_img`) VALUES
(2, 3, 1, 'Ms. Arpana', ' MP Nagar Zone-1, Bhopal ', 'Punjabi Food', 7123456789, 'arpana@gmail.com', 'I cook really delicious punjabi food.', '1.jpeg'),
(1, 1, 2, 'Mrs. harsitha singh', 'Arera Hills Courtyard by Marriott, Bhopal,', 'Sweets', 765498661, 'singh@gmail.com', 'My speciality is sweets and north indian food.', '2.jpeg'),
(3, 2, 3, 'Ms. shweta', '6 Manohar Hamidia Road, Bhopal', 'Marathi Food', 9000000000, 'shwetak@gmail.com', 'I cook real good marathi food. Hit me up if want to git it a shot.', '3.jpeg'),
(4, 6, 4, 'Mr. Arpit jain', 'Jehan Numa Palace 157, Shamla Hills, Bhopal', 'South Indian Thali', 9743511119, 'archana@gmail.com', 'I cook extremely delicious south indian food.', '4.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `cust_id` int(2) NOT NULL,
  `rest_id` int(2) NOT NULL,
  `title` varchar(50) NOT NULL,
  `rating` int(5) NOT NULL,
  `review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`cust_id`, `rest_id`, `title`, `rating`, `review`) VALUES
(0, 2, 'nice food', 4, 'the food was extremely delicious'),
(0, 1, 'Amazing Food Quality', 5, 'The food quality is outstanding.'),
(0, 3, 'Nice Packaging', 4, 'The packaging of the food delivered was very good.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
