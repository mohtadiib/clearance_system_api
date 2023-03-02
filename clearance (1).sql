-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 02, 2023 at 04:24 PM
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
-- Table structure for table `clearance_categs`
--

CREATE TABLE `clearance_categs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clearance_categs`
--

INSERT INTO `clearance_categs` (`id`, `name`, `is_active`) VALUES
(2, 'سيارات', 1),
(6, 'اثاثات', 1),
(7, 'werwer', 1),
(8, 'werwer', 1);

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
  `clearance_categ_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clearance_items`
--

INSERT INTO `clearance_items` (`id`, `clearance_categ_id`, `name`, `code`, `is_active`) VALUES
(1, 2, 'كيا 2022', '234234wf2342', 1),
(2, 6, 'طقم جلوس', '234234', 1);

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
(8, 'دفع جمارك', '6,4', '12,8,2', 1),
(9, 'كشف ميناء', '6,4,2', '12,9,4,3,2', 1),
(10, 'منطقة شحن', '6,4,3,1', '13,10,8,4,3', 1),
(11, 'لوجستيات', '6,3,4,5,1', '9,10,12,3,4', 1);

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
  `data_documents_arrived` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_id`, `supplier_id`, `shipping_line_id`, `shipping_type`, `quantity`, `service_id`, `current_step`, `port_id`, `policy_number`, `package_type`, `data_documents_arrived`, `status`, `create_at`, `is_active`) VALUES
(1, '20230302040303760', 4, 2, 1, 234, 9, NULL, NULL, '234234', NULL, '2023-03-02 18:18:03', 0, '2023-03-02 18:18:03', 1),
(2, '20230302040329224', 4, 2, 2, 345, 9, NULL, NULL, '345345', NULL, '2023-03-02 18:18:29', 0, '2023-03-02 18:18:29', 1),
(3, '20230302040303691', 4, 2, 2, 345, 11, NULL, NULL, '345345', NULL, '2023-03-02 18:19:03', 0, '2023-03-02 18:19:03', 1);

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
(1, '20230302040325197', 234, 20),
(2, '20230302040303760', 234234, 40),
(3, '20230302040329224', 345345, 40),
(4, '20230302040303691', 345345, 40);

-- --------------------------------------------------------

--
-- Table structure for table `file_data`
--

CREATE TABLE `file_data` (
  `id` int(11) NOT NULL,
  `data_id` int(11) DEFAULT NULL,
  `data_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `file_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_data`
--

INSERT INTO `file_data` (`id`, `data_id`, `data_value`, `file_id`) VALUES
(1, 2, '234342', '20230302030344287'),
(2, 3, '', '20230302030344287'),
(3, 4, '', '20230302030344287'),
(4, 8, '23423', '20230302030344287'),
(5, 9, '', '20230302030344287'),
(6, 10, '', '20230302030344287'),
(7, 12, '444', '20230302030344287'),
(8, 2, '44444', '20230302030312565'),
(9, 3, '', '20230302030312565'),
(10, 4, '', '20230302030312565'),
(11, 8, '3333', '20230302030312565'),
(12, 9, '', '20230302030312565'),
(13, 10, '', '20230302030312565'),
(14, 12, '222', '20230302030312565'),
(15, 2, '234234', '20230302040335629'),
(16, 3, '234234', '20230302040335629'),
(17, 4, '234234', '20230302040335629'),
(18, 8, '234234234', '20230302040335629'),
(19, 9, '44555', '20230302040335629'),
(20, 10, '234234', '20230302040335629'),
(21, 12, '234234', '20230302040335629'),
(22, 2, '234234', '20230302040321594'),
(23, 3, '234234', '20230302040321594'),
(24, 4, '234234', '20230302040321594'),
(25, 8, '234234234', '20230302040321594'),
(26, 9, '234234', '20230302040321594'),
(27, 10, '234234', '20230302040321594'),
(28, 12, '234234', '20230302040321594'),
(29, 2, '234234234', '20230302040337275'),
(30, 8, '234234', '20230302040337275'),
(31, 12, '234234', '20230302040337275'),
(32, 2, '234', '20230302040345213'),
(33, 3, '234', '20230302040345213'),
(34, 4, '234', '20230302040345213'),
(35, 8, '234234', '20230302040345213'),
(36, 9, '234234', '20230302040345213'),
(37, 10, '234', '20230302040345213'),
(38, 12, '234', '20230302040345213'),
(39, 2, '', '20230302040343930'),
(40, 3, '', '20230302040343930'),
(41, 4, '', '20230302040343930'),
(42, 8, '', '20230302040343930'),
(43, 9, '345', '20230302040343930'),
(44, 10, '', '20230302040343930'),
(45, 12, '', '20230302040343930'),
(46, 2, '234', '20230302040325197'),
(47, 3, '', '20230302040325197'),
(48, 4, '', '20230302040325197'),
(49, 8, '234', '20230302040325197'),
(50, 9, '', '20230302040325197'),
(51, 10, '', '20230302040325197'),
(52, 12, '234', '20230302040325197'),
(53, 2, '234243', '20230302040303760'),
(54, 3, '', '20230302040303760'),
(55, 4, '', '20230302040303760'),
(56, 8, '234', '20230302040303760'),
(57, 9, '', '20230302040303760'),
(58, 10, '', '20230302040303760'),
(59, 12, '2342', '20230302040303760'),
(60, 2, '345345', '20230302040329224'),
(61, 8, '345', '20230302040329224'),
(62, 12, '345', '20230302040329224'),
(63, 2, '345345', '20230302040303691'),
(64, 3, '345', '20230302040303691'),
(65, 4, '345', '20230302040303691'),
(66, 8, '345345', '20230302040303691'),
(67, 9, '345', '20230302040303691'),
(68, 10, '345', '20230302040303691'),
(69, 12, '345', '20230302040303691');

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

-- --------------------------------------------------------

--
-- Table structure for table `file_items`
--

CREATE TABLE `file_items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `origin_country` varchar(100) DEFAULT NULL,
  `shipping_country` varchar(100) DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `item_weight` int(11) DEFAULT NULL,
  `file_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_items`
--

INSERT INTO `file_items` (`id`, `category_id`, `item_id`, `origin_country`, `shipping_country`, `item_quantity`, `item_weight`, `file_id`) VALUES
(1, 7, 1, NULL, NULL, 33, 4444, '20230302030312565'),
(2, 8, 1, NULL, NULL, 234, 2342, '20230302040325197'),
(3, 7, 2, NULL, NULL, 234, 234, '20230302040303760'),
(4, 7, 1, NULL, NULL, 3453, 345345, '20230302040329224'),
(5, 7, 1, NULL, NULL, 345, 345345, '20230302040303691');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  `more` varchar(500) DEFAULT NULL,
  `done` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `id` int(11) NOT NULL,
  `operation_id` int(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `items_count` int(11) DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `operation_id`, `user_id`, `total`, `items_count`, `create_at`, `update_at`, `status`) VALUES
(8, 2147483647, 16, 12200, 2, '2023-02-20 16:54:05', '2023-02-20 16:54:05', NULL),
(9, 2147483647, 16, 4, 1, '2023-02-27 10:08:48', '2023-02-27 10:08:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `operation_files`
--

CREATE TABLE `operation_files` (
  `id` int(11) NOT NULL,
  `operation_id` int(100) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `operation_files`
--

INSERT INTO `operation_files` (`id`, `operation_id`, `file_id`, `total`) VALUES
(1, 2147483647, 0, 0),
(2, 2147483647, 3, 0),
(3, 2147483647, 2, 0),
(4, 2147483647, 1, 0),
(5, 2147483647, 0, 0),
(6, 2147483647, 0, 0),
(7, 2147483647, 0, 0),
(8, 2147483647, 0, 0),
(9, 2147483647, 3, 0),
(10, 2147483647, 2, 0),
(11, 2147483647, 3, 0),
(12, 2147483647, 2, 0),
(13, 2147483647, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `operation_file_steps`
--

CREATE TABLE `operation_file_steps` (
  `id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `operation_file_id` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `operation_file_step_items`
--

CREATE TABLE `operation_file_step_items` (
  `id` int(11) NOT NULL,
  `operation_id` int(100) NOT NULL,
  `operation_file_step_id` int(11) NOT NULL,
  `clearance_item_id` int(11) NOT NULL,
  `const` int(11) NOT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP
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
(9, 'دفع جمارك', '8', 1),
(11, 'ترحيلات', '11,9,8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `expird` int(11) DEFAULT '0',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `token`, `expird`, `create_at`) VALUES
(1, 15, 'f8b4b11e6d4a508185fc2020cce04dd71e44af16ddcc32c3565948cc46f6', 0, '2023-02-26 15:26:12'),
(2, 15, '4cde85adeecd31b2d45bf02f0d1acaab91c8a2fbb4f301e725cb99d6811e', 0, '2023-02-26 15:31:38'),
(3, 15, 'e6934cd77fae4db8b60cd05172796fafbb4f8a73e4ba541d5aa498d769e8', 0, '2023-02-26 15:36:07'),
(4, 15, '2e7029a2524794d25a761af0832b0c5e5f5d9a64fbbb59191c3d09acff94', 0, '2023-02-26 15:38:48'),
(5, 15, 'ca23296283c9073d7f01c97a3ab7011a9f0df636fff473a28e5a1f5b6039', 0, '2023-02-26 15:39:35'),
(6, 15, '448aaa9f41eb8294980576af4c220c393493f0ccd532d905d8bb7c2a9f4b', 0, '2023-02-26 15:39:47'),
(7, 15, 'd4dfe9669166c683387b3e3fce9f719cd6a9b55087b9e09e846289dfd356', 0, '2023-02-26 15:39:56'),
(8, 15, '7c969bd3e9f876329c193c5550dc4c727358b819f62fb0c03ce2e8b65a4f', 0, '2023-02-26 15:40:32'),
(9, 15, '5da7bd52bdde67e81441f09dfa2ee67c3e6f40575ad7595570c7677a4b03', 0, '2023-02-26 15:40:51'),
(10, 15, 'b0aa17e8458577fd81c52077b69666966020c2fb39987ca0693c2bd433e2', 0, '2023-02-26 15:41:14'),
(11, 15, 'c5986a66df10692d1f8264c5e81195f0f65bff3e0ba4eff1f54fd648884c', 0, '2023-02-26 15:41:27'),
(12, 15, '21a52610114ca43d4c13468681d2deb45c4fe90b54a7bf3242106cf12686', 0, '2023-02-26 15:41:45'),
(13, 15, 'b6ae8b1c5dda606c927a94bce9164f86ea7297ab6603c49606602efcbc4a', 0, '2023-02-26 15:41:52'),
(14, 15, '2fe30443b175d854f3debcdbf2adce2a713cc4e3a8ea207ae33eb566da52', 0, '2023-02-26 15:42:38');

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
(2, 'محمد الفادني', 'mohtamed@gmail.com', 'portsudan', 234234234, 432424, 1),
(3, 'mohtady', 'mohtadyb@gmail.com', 'sfgasd', 55, 55, 1),
(4, 'شركة سيقا للغلال', 'sales@sigga.com', 'sigga.com', 44933302, 3453435, 1);

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
  `type` int(11) DEFAULT '0',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `username`, `password`, `type`, `create_at`, `status`) VALUES
(15, 'محمد علي ', 991799346, 'mohali', '123456', 1, '2023-02-20 12:19:16', 1),
(16, 'المهتدي حسن علي', 920749357, 'mohtadyb@gmail.com', '12345', 1, '2023-02-20 12:35:34', 1),
(17, 'wer', 0, 'wer', 'wer', 0, '2023-02-28 15:07:55', 0),
(18, 'wer', 0, 'wer', 'wer', 0, '2023-02-28 15:08:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clearance_categs`
--
ALTER TABLE `clearance_categs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `file_data`
--
ALTER TABLE `file_data`
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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_files`
--
ALTER TABLE `operation_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_file_steps`
--
ALTER TABLE `operation_file_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_file_step_items`
--
ALTER TABLE `operation_file_step_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
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
-- AUTO_INCREMENT for table `clearance_categs`
--
ALTER TABLE `clearance_categs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clearance_steps`
--
ALTER TABLE `clearance_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `file_containers`
--
ALTER TABLE `file_containers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `file_data`
--
ALTER TABLE `file_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `file_docs`
--
ALTER TABLE `file_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_items`
--
ALTER TABLE `file_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `operation_files`
--
ALTER TABLE `operation_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `operation_file_steps`
--
ALTER TABLE `operation_file_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation_file_step_items`
--
ALTER TABLE `operation_file_step_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shipping_lines`
--
ALTER TABLE `shipping_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
