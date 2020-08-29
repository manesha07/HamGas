-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2020 at 12:14 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hamrogas`
--

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

CREATE TABLE `delivery_boy` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('normal_user','admin','super_admin','guest') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal_user',
  `secret_key` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postby_id` int(6) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_verified` tinyint(1) DEFAULT 0,
  `verifiedby_id` int(6) DEFAULT 1,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `name`, `username`, `email`, `password`, `user_type`, `secret_key`, `remarks`, `postby_id`, `created_at`, `is_verified`, `verifiedby_id`, `updated_at`, `status`) VALUES
(3, 'zenish prajapati', 'izenish', 'zenish77@gmail.com', 'Nepal123', 'super_admin', NULL, NULL, 1, '2020-03-14 14:01:15', 0, 1, NULL, 1),
(14, '', 'aman', 'test@yahoo.com', '202cb962ac59075b964b07152d234b70', 'normal_user', NULL, NULL, 1, '2019-07-28 14:13:58', 1, 1, '2020-03-14 19:35:02', 1),
(18, '', 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'admin', NULL, 1, '2019-07-30 16:25:01', 1, 1, '2019-07-30 22:11:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gas_cylinders`
--

CREATE TABLE `gas_cylinders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `exc_price` smallint(6) NOT NULL,
  `new_price` smallint(6) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gas_cylinders`
--

INSERT INTO `gas_cylinders` (`id`, `title`, `content`, `author`, `featured_image`, `exc_price`, `new_price`, `stock`) VALUES
(1, 'SHREE GAS', '15L of SHREE domestic gas. Not for Commercial Use', '', 'gas3.jpg', 1350, 4000, 0),
(2, 'NEPAL GAS', '15L of NEPAL Gas domestic gas. Not for Commercial Use', '', 'gas1.jpg', 1350, 4000, 50),
(3, 'HIMAL GAS', '15L of HIMAL domestic gas. Not for Commercial Use', '', 'gas4.jpg', 1350, 4000, 5),
(4, 'BHERI GAS', '15L of BHERI domestic gas. Not for Commercial Use', '', 'gas2.jpg', 1350, 4000, 50);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `gas_name` varchar(30) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `gas_name`, `purpose`, `type`) VALUES
(1, 'HP GAS', 'domestic', 'old'),
(2, 'NEPAL Gas', 'domestic', 'new'),
(3, 'Sugam Gas', 'comercial', 'old'),
(4, 'Everest Gas', 'comercial', 'new'),
(5, 'Subhidha gas', 'domestic', 'old');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(80) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `cr_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `name`, `email`, `message`, `status`, `cr_date`) VALUES
(33, 'aman', 'masmas@gmail.com', 'alsfkjsk', 1, '2020-03-14 12:52:30'),
(34, 'Manisha', 'gora@yahoo.com', 'Great efforts!', 1, '2020-03-14 02:39:39'),
(35, 'Jenish Prajapati', 'zenish77@gmail.com', 'Wow!!!', 1, '2020-03-14 02:39:59'),
(36, 'Manish', 'manees@ymail.com', '(y) (y)', 1, '2020-03-14 02:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` bigint(20) NOT NULL,
  `card_exp_month` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `card_exp_year` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item_price` float(10,2) NOT NULL,
  `item_price_currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount_currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `txn_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `card_number`, `card_exp_month`, `card_exp_year`, `item_name`, `item_number`, `item_price`, `item_price_currency`, `paid_amount`, `paid_amount_currency`, `txn_id`, `payment_status`, `created`, `modified`) VALUES
(1, 'Jenish Prajapati', 'zenish77@gmail.com', 4242424242424242, '08', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMRoVDSTWXJ032VLdAX35gw', 'succeeded', '2020-03-14 10:26:31', '2020-03-14 10:26:31'),
(2, 'Aman Mool', 'amsbjasdb@gmail.com', 4242424242424242, '02', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMW3qDSTWXJ032VKBpIlMH4', 'succeeded', '2020-03-14 14:58:39', '2020-03-14 14:58:39'),
(3, 'manish', 'masmas@gmail.com', 4242424242424242, '02', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMW6uDSTWXJ032VtLbq3Nxv', 'succeeded', '2020-03-14 15:01:49', '2020-03-14 15:01:49'),
(4, 'jenish', 'zenish77@gmail.com', 4242424242424242, '6', '2022', 'Demo Product', 'PN12345', 1200.00, 'USD', '1200', 'usd', 'txn_1GMZtQDSTWXJ032V9u3sP0gQ', 'succeeded', '2020-03-14 19:04:08', '2020-03-14 19:04:08'),
(5, 'Random', 'lolololo@gmail.com', 378282246310005, '06', '2022', 'GAS', '2', 137500.00, 'NPR', '137500', 'npr', 'txn_1GMjt1DSTWXJ032VIQFuKDmc', 'succeeded', '2020-03-15 05:44:24', '2020-03-15 05:44:24'),
(6, 'Manish Gora', 'manisa33@gmail.com', 4242424242424242, '03', '2022', 'GAS', '2', 137500.00, 'NPR', '137500', 'npr', 'txn_1Gc845DSTWXJ032VGU86oljS', 'succeeded', '2020-04-26 16:35:28', '2020-04-26 16:35:28'),
(7, 'mn', 'oera52@gmail.com', 4242424242424242, '2', '2022', 'HP GAS', '2', 275000.00, 'NPR', '275000', 'npr', 'txn_1HLQmjDSTWXJ032VeqnDUi8T', 'succeeded', '2020-08-29 15:40:45', '2020-08-29 15:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` smallint(6) NOT NULL,
  `stock` mediumint(9) NOT NULL,
  `ADD_Date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `Name`, `Content`, `image`, `Price`, `stock`, `ADD_Date`) VALUES
(17, 'manish', 'slfkdjlk', 'Screenshot (36).png', 0, 10000, '2020-03-13'),
(18, 'fdlksj', 'lfdaskjlaskdjf', 'Screenshot (36).png', 1500, 1500, '2020-03-13'),
(19, 'fasf;k', 'f;salfk;l', '7.jpg', 32767, 8388607, '2020-03-13'),
(20, 'dfak', 'sldkflksd', 'iris-letter-g-embroidery-design.jpg', 432, 234234, '2020-03-13'),
(21, ';lafsdk;', ';sfldk;lsdf', 'w4306.jpg', 4645, 545454, '2020-03-13'),
(22, 'ms', 'lskf', 'color.jpg', 150, 1800, '2020-03-14'),
(23, 'ms', 'lskf', 'color.jpg', 150, 1800, '2020-03-14'),
(24, 'manish', 'lksfjd', '7.jpg', 32767, 8972, '2020-03-14'),
(25, 'kjasdjk', 'sldfj', '7.jpg', 32767, 44342, '2020-03-14'),
(26, 'kjasdjkfsddfisodif', 'sldfjsfoisidijl', '83759881_2604859326234657_8240503062184067072_n.jpg', 3224, 23423, '2020-03-14'),
(27, 'lkfslkj', 'sdfjlsl', 'Cross-section-sketch-of-the-human-heart.png', 32767, 23423, '2020-03-14'),
(28, 'lkfslkjwrlkj', 'lwkrjwlke', '7.jpg', 323, 23, '2020-03-14'),
(29, 'aman', 'mool', 'w4306.jpg', 500, 560, '2020-03-14'),
(30, 'lskfj1', 'fslkjlksf', 'w4306.jpg', 32232, 3434, '2020-03-14'),
(31, 'ASFDSDFSADF', 'SDFSDFS', 'defaultimage.jpg', 1500, 500, '2020-03-14'),
(32, 'asflkd', 'sdfsf', 'defaultimage.jpg', 32767, 323333, '2020-03-14');

-- --------------------------------------------------------

--
-- Table structure for table `stove`
--

CREATE TABLE `stove` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `new_price` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stove`
--

INSERT INTO `stove` (`id`, `title`, `content`, `author`, `featured_image`, `stock`, `new_price`) VALUES
(1, 'Dual Burner', '', '', 'stove2.png', '5', 3075),
(2, 'Burner with Pans', '', '', 'stovewithpan.png', '0', 4195),
(3, 'Tri-Stove', '', '', 'stove3.png', '50', 6250),
(4, 'Quad Burner', '', '', 'stove4.png', '50', 7777);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(6) UNSIGNED NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postby_id` int(6) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_verified` tinyint(1) DEFAULT 0,
  `verifiedby_id` int(6) DEFAULT 1,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `status` tinyint(1) DEFAULT 1,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` int(10) NOT NULL,
  `item` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(3) NOT NULL,
  `profile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `citizenship_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` mediumint(7) NOT NULL,
  `latitude` decimal(12,8) NOT NULL,
  `longitude` decimal(12,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `postby_id`, `created_at`, `is_verified`, `verifiedby_id`, `updated_at`, `status`, `first_name`, `last_name`, `address`, `phone_number`, `item`, `payment`, `purpose`, `quantity`, `profile`, `citizenship_card`, `code`, `latitude`, `longitude`) VALUES
(117, 'taehyung@gmail.com', 1, '2020-08-12 07:02:22', 0, 1, NULL, 1, 'tae', 'hyung', 'dawe', 1234567699, 'sagar', 'Pay Online', 'comercial', 3, 'Screenshot (433).png', 'Screenshot (434).png', 763144, '0.00000000', '0.00000000'),
(118, 'masnisha_gorda@hotmail.com', 1, '2020-08-20 03:06:31', 0, 1, NULL, 1, 'jk', 'k', '123', 2147483647, 'sagar', 'Pay Online', 'comercial', 3, 'bb2.jpg', 'cross.jpg', 459588, '0.00000000', '0.00000000'),
(119, 'taekok@gmail.com', 1, '2020-08-28 05:52:18', 0, 1, NULL, 1, 'tae ', 'tae', 'south kkorea ', 1234567890, 'sagar', 'COD', 'domestic', 2, 'Screenshot (5).png', 'Screenshot (3).png', 513603, '0.00000000', '0.00000000'),
(120, 'taegora@gmail.com', 1, '2020-08-28 05:57:13', 0, 1, NULL, 1, 'cvdss', 'df', 'south korea', 1234567890, 'sagar', 'Pay Online', 'comercial', 3, 'Screenshot (4).png', 'Screenshot (5).png', 159772, '0.00000000', '0.00000000'),
(121, 'sa@gmail.com', 1, '2020-08-29 05:36:18', 0, 1, NULL, 1, 'sadhguru', 'dagh', 'india', 1234567890, 'sagar', 'Pay Online', 'comercial', 3, 'Screenshot (2).png', 'Screenshot (5).png', 133325, '0.00000000', '0.00000000'),
(122, 'a_gdora@hotmail.com', 1, '2020-08-29 06:06:36', 0, 1, NULL, 1, 'sfa', 'd', '23', 1234567890, 'sagar', 'Pay Online', 'comercial', 4, 'gas4.jpg', 'gas5.jpg', 542749, '0.00000000', '0.00000000'),
(123, 'd@gmail.com', 1, '2020-08-29 08:43:16', 0, 1, NULL, 1, 'd', 'df', 'd', 1234567890, 'sagar', 'COD', 'comercial', 3, 'gas4.jpg', 'gas5.jpg', 393330, '27.46958530', '85.27224720'),
(124, 'd2@gmail.com', 1, '2020-08-29 08:48:40', 0, 1, NULL, 1, 'asdd', 'df', 'a', 1234567890, 'sagar', 'Pay Online', 'comercial', 3, 'gas3.jpg', 'gas2.jpg', 180997, '27.46958530', '85.27224720'),
(126, 'sdfd@gmail.com', 1, '2020-08-29 09:34:12', 0, 1, NULL, 1, 'sdfd', 'dfd', 'fdsd', 1234567890, 'sagar', 'Pay Online', 'domestic', 1, 'gas1.jpg', 'gas3.jpg', 221535, '0.00000000', '0.00000000'),
(127, 'orar52@gmail.com', 1, '2020-08-29 09:43:29', 0, 1, NULL, 1, 'aniiiiii', 'd', 'su', 2147483647, 'sagar', 'Pay Online', 'comercial', 3, 'gas3.jpg', 'gas3.jpg', 421340, '0.00000000', '0.00000000'),
(128, 'orvar52@gmail.com', 1, '2020-08-29 09:44:34', 0, 1, NULL, 1, 'aniiiiii', 'd', 'sur', 2147483647, 'sagar', 'Pay Online', 'domestic', 1, 'gas3.jpg', 'gas3.jpg', 287898, '0.00000000', '0.00000000'),
(129, 'oera5f2@gmail.com', 1, '2020-08-29 09:53:55', 0, 1, NULL, 1, 'xfd', 'fgf', 's', 1234567899, 'HP GAS', 'Pay Online', 'domestic', 2, 'gas3.jpg', 'gas4.jpg', 968245, '27.46958530', '85.27224720');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `verifiedby_id` (`verifiedby_id`),
  ADD KEY `postby_id` (`postby_id`);

--
-- Indexes for table `gas_cylinders`
--
ALTER TABLE `gas_cylinders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stove`
--
ALTER TABLE `stove`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `verifiedby_id` (`verifiedby_id`),
  ADD KEY `postby_id` (`postby_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery_boy`
--
ALTER TABLE `delivery_boy`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `gas_cylinders`
--
ALTER TABLE `gas_cylinders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `stove`
--
ALTER TABLE `stove`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
