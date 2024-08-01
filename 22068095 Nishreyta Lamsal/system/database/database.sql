-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2023 at 04:23 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kaia`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`) VALUES
(6, 22),
(7, 18),
(8, 16),
(9, 24);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_items_id` int(20) NOT NULL,
  `cart_id` int(20) NOT NULL,
  `product_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_items_id`, `cart_id`, `product_id`) VALUES
(5, 6, 1042),
(6, 6, 1048),
(7, 6, 1049),
(8, 7, 1055),
(9, 7, 1049),
(10, 8, 1051),
(11, 8, 1055),
(12, 9, 1042),
(13, 9, 1048),
(14, 9, 1053);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(50) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Suits'),
(2, 'Satin'),
(3, 'Dress'),
(4, 'Shirts');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `order_id` int(11) NOT NULL,
  `cart_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`order_id`, `cart_id`) VALUES
(3, 6),
(4, 8),
(5, 9),
(6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(50) NOT NULL,
  `price` double NOT NULL,
  `stock` int(10) NOT NULL,
  `rating` float NOT NULL,
  `product_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `category_id`, `price`, `stock`, `rating`, `product_img`) VALUES
(1042, 'Sassy', 1, 256, 20, 0, 'suit1.jpg'),
(1043, 'Chic', 1, 275, 25, 0, 'suit2.jpg'),
(1044, 'Fabulous', 1, 365, 20, 0, 'suit3.jpg'),
(1045, 'Charming', 1, 299, 30, 0, 'suit4.jpg'),
(1046, 'Cute', 2, 325, 20, 0, 'satin1.jpg'),
(1047, 'Cliche', 2, 365, 20, 0, 'satin2.jpg'),
(1048, 'Propose', 2, 324, 20, 0, 'satin3.webp'),
(1049, 'Gorgeous', 2, 326, 20, 0, 'satin4.jpg'),
(1050, 'Classy', 3, 325, 25, 0, 'dress1.jpg'),
(1051, 'Elegant', 3, 345, 10, 0, 'dress2.jpg'),
(1052, 'Flirty', 3, 368, 20, 0, 'dress3.jpg'),
(1053, 'Wonderful', 3, 325, 35, 0, 'dress4.jpg'),
(1054, 'Gracious', 4, 329, 15, 0, 'shirt1.jpg'),
(1055, 'Bonnie', 4, 356, 20, 0, 'shirt2.jpg'),
(1056, 'Stella', 4, 365, 20, 0, 'shirt3.jpg'),
(1058, 'Aurora', 4, 265, 20, 0, 'shirt4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `fullName` varchar(50) NOT NULL,
  `username` varchar(55) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`fullName`, `username`, `email`, `password`, `address`, `role`, `image`, `id`) VALUES
('Aaju Maharjan', 'aaju', 'aaju@gmail.com', '8IcWjoMK821F5oFLFhXsVtJD5Ja1MPJFC7DMLt2B9/ip+5FZ/ZmPzjF7YxstHFm7', 'ktm', 'user', 'bg.jpg', 15),
('Katyani Bajgain', 'katyanihero', 'katyani@gmail.com', 'oKLcH/iU2vIjk1N3Cdumfag9cXTPuKI6iz8Dq7R+MESkcVH1tAAjCw9acmumBCfIlvrC', 'chabahil', 'user', '6.webp', 16),
('Prajina Nakarmi', 'prxjxxna', 'prajina@gmail.com', 't8KW8DJ6YpvZOT/Upg3BYSuWhkkoM/vqwzUfkcmm9WPi8ikXdtVRu5BmfoK/V/cUgDbb', 'chapali', 'user', '7.jpg', 18),
('Nafisha Shrestha', 'nafi_stha', 'nafi@gmail.com', 'jAPH0Ip+HRL6IEqiohoBWPEf+OLkq8QWijQe6PzjjXAC6sm1sbmWj1IQxtMgNfaU', 'new road', 'admin', 'nafi di.jpg', 20),
('Priyam Rajbhandari', 'prem', 'prem@gmail.com', 'XRReB74ZEfIN/lE3BQga4Eo52Vs+55/gBtVvvvS3ii20INT+SPcBwDmq2vCgW3HV', 'patan', 'user', 'licensed-image.jpg', 21),
('Janwi Shrestha', 'janwishrestha', 'janwi@gmail.com', '5l5ozqXelJmVarCQNzSHA1ryi4opezUCZ1mEJhD66BSGJzUYdEvKXS7BT4XlnAQyoQ==', 'ktm', 'user', 'signup1.jpg', 22),
('Priyam Chnadra Rajbhandari', 'priyam_xx', 'priyamcrb@gmail.com', '2mOfKRtNq34zCb/DaRzzPEzogSQrVbpY8aJ8FiToXvNSQFVA2erTpVwq6Maa+48irMA=', 'patan', 'user', 'suit4.jpg', 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_items_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `cart_fk` (`cart_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_fk` (`category_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_uq` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_items_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1059;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `cart_fk` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `category_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
