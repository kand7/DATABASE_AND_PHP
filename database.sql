-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2021 at 07:55 PM
-- Server version: 8.0.22
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd2_ask1`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(100, 'SUMMER'),
(200, 'WINTER'),
(300, 'GROUP'),
(400, 'ROMANTIC'),
(500, 'SOLO');

-- --------------------------------------------------------

--
-- Table structure for table `categorypackets`
--

CREATE TABLE `categorypackets` (
  `category_id` int NOT NULL,
  `packets_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categorypackets`
--

INSERT INTO `categorypackets` (`category_id`, `packets_id`) VALUES
(100, 20),
(200, 20),
(300, 10),
(400, 30);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `packet_id` int DEFAULT NULL,
  `customer_name` varchar(25) DEFAULT NULL,
  `customer_surname` varchar(25) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `customer_address` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `packet_id`, `customer_name`, `customer_surname`, `customer_phone`, `customer_address`) VALUES
(1, 20, 'VIKTOR', 'ROMANIOYK', '6907454502', 'viktorrmn@gmail.com'),
(2, 30, 'GIWRGOS', 'GEWRGIOY', '6938629291', 'giwrgosgew@gmail.com'),
(3, 40, 'DIMITRIS', 'DIMITRIOY', '6934567608', 'dimitrisdim@gmail.com'),
(4, 20, 'KWSTAS', 'KWSTANTINOY', '6938629596', 'kwstaskws@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `packets`
--

CREATE TABLE `packets` (
  `packet_id` int NOT NULL,
  `destination` varchar(15) DEFAULT NULL,
  `category_name` varchar(20) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `transport` varchar(20) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `packets`
--

INSERT INTO `packets` (`packet_id`, `destination`, `category_name`, `start`, `end`, `transport`, `price`, `customer_id`) VALUES
(10, 'GREECE', 'ROMANTIC', '2020-12-05', '2021-02-01', 'AIRPLANE', 350, 1),
(20, 'BELGIUM', 'WINTER', '2021-03-06', '2021-04-01', 'BUS', 150, 4),
(30, 'HOLLAND', 'SUMMER', '2021-05-19', '2021-06-19', 'BUS', 100, 3),
(40, 'AUSTRIA', 'WINTER', '2021-08-20', '2021-08-20', 'BOAT', 250, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v`
-- (See below for the actual view)
--
CREATE TABLE `v` (
`customer_id` int
,`customer_name` varchar(25)
,`value` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v1`
-- (See below for the actual view)
--
CREATE TABLE `v1` (
`customer_name` varchar(25)
,`packet_id` int
);

-- --------------------------------------------------------

--
-- Structure for view `v`
--
DROP TABLE IF EXISTS `v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v`  AS SELECT `customers`.`customer_id` AS `customer_id`, `customers`.`customer_name` AS `customer_name`, `customers`.`customer_surname` AS `value` FROM `customers` ;

-- --------------------------------------------------------

--
-- Structure for view `v1`
--
DROP TABLE IF EXISTS `v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v1`  AS SELECT `packets`.`packet_id` AS `packet_id`, `customers`.`customer_name` AS `customer_name` FROM (`packets` join `customers` on((`packets`.`customer_id` = `customers`.`customer_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `categorypackets`
--
ALTER TABLE `categorypackets`
  ADD KEY `fk_category_id` (`category_id`),
  ADD KEY `fk_packets_id` (`packets_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `packets`
--
ALTER TABLE `packets`
  ADD PRIMARY KEY (`packet_id`),
  ADD KEY `fk_customer_id` (`customer_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorypackets`
--
ALTER TABLE `categorypackets`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `fk_packets_id` FOREIGN KEY (`packets_id`) REFERENCES `packets` (`packet_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
