-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2023 at 01:50 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clearance`
--

-- --------------------------------------------------------

--
-- Table structure for table `clearance_data`
--

CREATE TABLE `clearance_data` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clearance_data`
--

INSERT INTO `clearance_data` (`id`, `name`, `is_active`) VALUES
(1, 'اسم الباخرة', 1),
(2, 'تاريخ وصول الباخرة', 1),
(3, 'تقدير الرسوم الجمركية', 1),
(4, 'تقدير رسوم الشحن', 1),
(8, 'عنوان تفريغ البضاعة', 1),
(9, 'رقم البوليصة', 1),
(10, 'رقم الشهادة الجمركية', 1),
(11, 'ميناء التفريغ', 1),
(12, 'سعر البضاعة شامل', 1),
(13, 'محطة التخليص', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clearance_docs`
--

CREATE TABLE `clearance_docs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clearance_docs`
--

INSERT INTO `clearance_docs` (`id`, `name`, `type`, `is_active`) VALUES
(1, 'بوليصة شحن', 1, 1),
(2, 'فاتورة', 1, 1),
(3, 'كشف تعبئة', 1, 1),
(4, 'فورم IM', 1, 1),
(5, 'شهادة منشأ', 1, 1),
(6, 'شهادة CIQ', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clearance_items`
--

CREATE TABLE `clearance_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clearance_items`
--

INSERT INTO `clearance_items` (`id`, `name`, `details`, `type`, `is_active`) VALUES
(1, 'sdf', NULL, 1, 1),
(2, 'mohtady', 'صق', 1, 1),
(3, 'سيارات', 'سيارة تويوتا', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clearance_steps`
--

CREATE TABLE `clearance_steps` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `necessary_docs` varchar(1000) DEFAULT NULL,
  `necessary_data` varchar(1000) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clearance_steps`
--

INSERT INTO `clearance_steps` (`id`, `name`, `necessary_docs`, `necessary_data`, `is_active`) VALUES
(1, 'دفع الجمارك', '6,3,2', '12,11,9,4,2', 1),
(2, 'محاسبة', '5,4', '12,13,8,3', 1),
(3, 'دفع ميناء', '6,5,3,2', '12,10', 1),
(4, 'ختام التفاصيل', '6,5,1', '13,10,4,8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file_id` varchar(100) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `shipping_line_id` int(11) DEFAULT NULL,
  `shipping_type` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `current_step` int(11) DEFAULT NULL,
  `port_id` int(11) DEFAULT NULL,
  `policy_number` varchar(100) DEFAULT NULL,
  `package_type` int(11) DEFAULT NULL,
  `data_documents_arrived` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_id`, `supplier_id`, `shipping_line_id`, `shipping_type`, `quantity`, `service_id`, `current_step`, `port_id`, `policy_number`, `package_type`, `data_documents_arrived`, `status`, `create_at`, `is_active`) VALUES
(1, '20230118020109254', 2, 3, 2, 3, 3, 0, 2, '234234', NULL, '2023-01-22 13:17:39', 1, '2023-01-18 16:34:09', 1),
(2, '20230118020110645', 2, 3, 2, 3, 3, 0, 2, '234234', NULL, '2023-01-22 13:17:39', 1, '2023-01-18 16:34:10', 1),
(3, '20230118020110333', 2, 3, 2, 3, 3, 2, 2, '234234', NULL, '2023-01-22 13:17:39', 1, '2023-01-18 16:34:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `file_containers`
--

CREATE TABLE `file_containers` (
  `id` int(11) NOT NULL,
  `file_id` varchar(100) NOT NULL,
  `container_no` int(20) DEFAULT NULL,
  `container_size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_containers`
--

INSERT INTO `file_containers` (`id`, `file_id`, `container_no`, `container_size`) VALUES
(1, '20230118020109254', 234, NULL),
(2, '20230118020109254', 234, NULL),
(3, '20230118020110645', 234, NULL),
(4, '20230118020110645', 234, NULL),
(5, '20230118020110333', 234, NULL),
(6, '20230118020110333', 234, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_docs`
--

CREATE TABLE `file_docs` (
  `id` int(11) NOT NULL,
  `img_path` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `doc_id` int(11) NOT NULL,
  `file_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_docs`
--

INSERT INTO `file_docs` (`id`, `img_path`, `doc_id`, `file_id`) VALUES
(39, '../../assets/upload/63ce9d361e863.png', 6, '20230118020110333'),
(41, '../../assets/upload/63ce9f2ab4ece.png', 2, '20230118020110333'),
(42, '../../assets/upload/63cea023eb81a.png', 6, '20230118020109254'),
(43, '167473284050412000.png', 5, '20230118020110333'),
(44, '167473284325809250.png', 1, '20230118020110333'),
(45, '167473285087701630.png', 3, '20230118020110333'),
(46, '167473287831474180.png', 4, '20230118020110333'),
(47, '167479875774994080.png', 6, '20230118020110645');

-- --------------------------------------------------------

--
-- Table structure for table `file_items`
--

CREATE TABLE `file_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_details` varchar(500) DEFAULT NULL,
  `origin_country` varchar(100) DEFAULT NULL,
  `shipping_country` varchar(100) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `item_weight` int(11) DEFAULT NULL,
  `file_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_items`
--

INSERT INTO `file_items` (`id`, `item_id`, `item_details`, `origin_country`, `shipping_country`, `item_quantity`, `item_weight`, `file_id`) VALUES
(1, 2, '234', '234', '234', 234, 234, '20230118020109254'),
(2, 2, '234', '234', '234', 234, 234, '20230118020110645'),
(3, 2, '234', '234', '234', 234, 234, '20230118020110333');

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `items_count` int(11) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operations_files`
--

CREATE TABLE `operations_files` (
  `id` int(11) NOT NULL,
  `fiel_id` int(11) DEFAULT NULL,
  `operaton_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `steps` varchar(1000) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `steps`, `is_active`) VALUES
(1, 'mohtady', '4,2', 1),
(2, 'تخليص جمارك', '4,3,2', 1),
(3, 'شهادات خدمة', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_lines`
--

CREATE TABLE `shipping_lines` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping_lines`
--

INSERT INTO `shipping_lines` (`id`, `name`, `phone`, `email`, `address`, `website`, `is_active`) VALUES
(2, '‪Mohtady Behiry‬‏', 2499207, 'mohtadyb@gmail.com', 'Dubai', 'Array', 0),
(3, 'ميرسك', 234234, 'mohtadyb@gmail.com', 'Dubai', 'محمد قول', 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `site` varchar(100) DEFAULT NULL,
  `tax_no` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `site`, `tax_no`, `balance`, `is_active`) VALUES
(1, 'mohtady', 'mohtadyb@gmail.com', 'sfgasd', 55, 55, 1),
(2, 'محمد الفادني', 'mohtamed@gmail.com', 'portsudan', 234234234, 432424, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clearance_data`
--
ALTER TABLE `clearance_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clearance_docs`
--
ALTER TABLE `clearance_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clearance_items`
--
ALTER TABLE `clearance_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clearance_steps`
--
ALTER TABLE `clearance_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_containers`
--
ALTER TABLE `file_containers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_docs`
--
ALTER TABLE `file_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_items`
--
ALTER TABLE `file_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operations_files`
--
ALTER TABLE `operations_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_lines`
--
ALTER TABLE `shipping_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clearance_data`
--
ALTER TABLE `clearance_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `clearance_docs`
--
ALTER TABLE `clearance_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clearance_items`
--
ALTER TABLE `clearance_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clearance_steps`
--
ALTER TABLE `clearance_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `file_containers`
--
ALTER TABLE `file_containers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `file_docs`
--
ALTER TABLE `file_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `file_items`
--
ALTER TABLE `file_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operations_files`
--
ALTER TABLE `operations_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_lines`
--
ALTER TABLE `shipping_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
