-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306:4306
-- Generation Time: May 14, 2026 at 12:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myfisrtdb`
--
CREATE DATABASE IF NOT EXISTS `myfisrtdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myfisrtdb`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT curtime(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `Pwd` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `email`, `Pwd`, `created_at`) VALUES
(1, 'nonny', 'nonny@gmail.com', 'nony123', '2026-04-30 02:57:13'),
(2, 'H.', 'haneinhusseen@gmail.com', 'haneinhusseen@gmail.com', '2026-04-30 07:19:07'),
(3, 'nonny', 'haneinhusseen@gmail.com', 'haneinhusseen@gmail.com', '2026-04-30 07:19:15'),
(4, 'haneiiin', 'haneinhusseen@gmail.com', 'haneinhusseen@gmail.com', '2026-04-30 07:23:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"salon_booking\",\"table\":\"clients\"},{\"db\":\"salon_booking\",\"table\":\"bookings\"},{\"db\":\"salon_booking\",\"table\":\"services\"},{\"db\":\"myfisrtdb\",\"table\":\"users\"},{\"db\":\"myfisrtdb\",\"table\":\"comments\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-05-13 22:10:58', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":307}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `salon_booking`
--
CREATE DATABASE IF NOT EXISTS `salon_booking` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `salon_booking`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `client_id`, `service_id`, `booking_date`, `notes`, `created_at`) VALUES
(4, 1, 1, '2026-04-01', 'تجربة', '2026-04-01 08:00:00'),
(5, 1, 1, '2026-05-09', 'تجربة 1', '2026-05-09 04:38:58'),
(6, 1, 2, '2026-05-09', 'تجربة 2', '2026-05-09 04:38:58'),
(7, 1, 3, '2026-05-10', 'تجربة 3', '2026-05-09 04:38:58'),
(8, 1, 4, '2026-05-10', 'تجربة 4', '2026-05-09 04:38:58'),
(9, 1, 5, '2026-05-09', 'تجربة 5', '2026-05-09 04:38:58'),
(10, 1, 1, '2026-04-01', 'قديم 1', '2026-04-01 08:00:00'),
(11, 1, 2, '2026-04-02', 'قديم 2', '2026-04-02 08:00:00'),
(12, 1, 3, '2026-04-03', 'قديم 3', '2026-04-03 08:00:00'),
(13, 1, 4, '2026-04-04', 'قديم 4', '2026-04-04 08:00:00'),
(14, 1, 5, '2026-04-05', 'قديم 5', '2026-04-05 08:00:00'),
(15, 1, 1, '2026-05-08', 'تجربة 6', '2026-05-09 04:38:58'),
(17, 1, 3, '2026-05-08', 'تجربة 8', '2026-05-09 04:38:58'),
(20, 1, 1, '2026-03-01', 'قديم 6', '2026-03-01 08:00:00'),
(21, 1, 2, '2026-03-02', 'قديم 7', '2026-03-02 08:00:00'),
(22, 1, 3, '2026-03-03', 'قديم 8', '2026-03-03 08:00:00'),
(23, 1, 4, '2026-03-04', 'قديم 9', '2026-03-04 08:00:00'),
(24, 1, 5, '2026-03-05', 'قديم 10', '2026-03-05 08:00:00'),
(25, 3, 9, '2026-05-12', '', '2026-05-12 12:14:04'),
(26, 4, 9, '2026-05-12', '', '2026-05-12 12:21:42'),
(27, 4, 9, '2026-05-12', '', '2026-05-12 12:21:47'),
(28, 4, 9, '2026-05-12', '', '2026-05-12 12:24:40'),
(29, 4, 9, '2026-05-12', '', '2026-05-12 12:24:47'),
(30, 1, 14, '2026-05-12', '', '2026-05-12 12:29:22'),
(31, 1, 14, '2026-05-12', '', '2026-05-12 12:30:06'),
(32, 1, 14, '2026-05-12', '', '2026-05-12 12:30:14'),
(33, 1, 14, '2026-05-12', '', '2026-05-12 12:31:09'),
(34, 1, 14, '2026-05-12', '', '2026-05-12 12:32:03'),
(35, 1, 14, '2026-05-12', '', '2026-05-12 12:32:11'),
(36, 1, 10, '2026-05-12', '', '2026-05-12 12:32:51'),
(37, 1, 10, '2026-05-12', '', '2026-05-12 12:37:07'),
(38, 1, 10, '2026-05-12', '', '2026-05-12 12:37:59'),
(39, 1, 10, '2026-05-12', '', '2026-05-12 12:38:15'),
(40, 1, 10, '2026-05-12', '', '2026-05-12 12:38:20'),
(41, 1, 10, '2026-05-12', '', '2026-05-12 12:39:07'),
(42, 1, 10, '2026-05-12', '', '2026-05-12 12:39:43'),
(43, 1, 10, '2026-05-12', '', '2026-05-12 12:39:50'),
(44, 1, 10, '2026-05-12', '', '2026-05-12 12:41:25'),
(45, 1, 10, '2026-05-12', '', '2026-05-12 12:42:13'),
(46, 1, 10, '2026-05-12', '', '2026-05-12 12:42:33'),
(47, 1, 10, '2026-05-12', '', '2026-05-12 12:43:49'),
(48, 1, 10, '2026-05-12', '', '2026-05-12 12:44:05'),
(49, 1, 10, '2026-05-12', '', '2026-05-12 12:44:10'),
(50, 1, 10, '2026-05-12', '', '2026-05-12 12:46:16'),
(51, 1, 10, '2026-05-12', '', '2026-05-12 12:47:45'),
(52, 1, 10, '2026-05-12', '', '2026-05-12 12:48:02'),
(53, 5, 1, '2026-03-02', '', '2026-03-02 08:00:00'),
(54, 6, 5, '2026-03-03', '', '2026-03-03 09:00:00'),
(55, 7, 11, '2026-03-04', '', '2026-03-04 10:00:00'),
(56, 8, 3, '2026-03-05', '', '2026-03-05 07:00:00'),
(57, 9, 7, '2026-03-06', '', '2026-03-06 11:00:00'),
(58, 10, 13, '2026-03-07', '', '2026-03-07 08:30:00'),
(59, 11, 2, '2026-03-08', '', '2026-03-08 09:30:00'),
(60, 12, 8, '2026-03-09', '', '2026-03-09 12:00:00'),
(61, 13, 14, '2026-03-10', '', '2026-03-10 08:00:00'),
(62, 14, 1, '2026-03-11', '', '2026-03-11 07:30:00'),
(63, 15, 4, '2026-03-12', '', '2026-03-12 10:00:00'),
(64, 16, 9, '2026-03-13', '', '2026-03-13 09:00:00'),
(65, 17, 12, '2026-03-14', '', '2026-03-14 13:00:00'),
(66, 18, 6, '2026-03-15', '', '2026-03-15 08:00:00'),
(67, 19, 3, '2026-03-16', '', '2026-03-16 11:00:00'),
(68, 20, 11, '2026-03-17', '', '2026-03-17 09:30:00'),
(69, 21, 1, '2026-03-18', '', '2026-03-18 07:00:00'),
(70, 22, 5, '2026-03-19', '', '2026-03-19 12:00:00'),
(71, 23, 10, '2026-03-20', '', '2026-03-20 08:30:00'),
(72, 24, 2, '2026-03-21', '', '2026-03-21 10:00:00'),
(73, 25, 7, '2026-03-22', '', '2026-03-22 09:00:00'),
(74, 26, 14, '2026-03-23', '', '2026-03-23 11:30:00'),
(75, 27, 4, '2026-03-24', '', '2026-03-24 08:00:00'),
(76, 28, 8, '2026-03-25', '', '2026-03-25 13:00:00'),
(77, 29, 13, '2026-03-26', '', '2026-03-26 09:00:00'),
(78, 30, 3, '2026-03-27', '', '2026-03-27 07:30:00'),
(79, 31, 9, '2026-03-28', '', '2026-03-28 12:00:00'),
(80, 32, 1, '2026-03-29', '', '2026-03-29 08:00:00'),
(81, 33, 6, '2026-03-30', '', '2026-03-30 10:30:00'),
(82, 34, 11, '2026-03-31', '', '2026-03-31 09:00:00'),
(83, 2, 9, '2026-05-13', '', '2026-05-13 18:09:43'),
(84, 2, 9, '2026-05-13', '', '2026-05-13 18:19:12'),
(85, 3, 12, '2026-05-13', '', '2026-05-13 18:20:33'),
(86, 3, 12, '2026-05-13', '', '2026-05-13 18:23:25'),
(87, 2, 8, '2027-07-13', '', '2026-05-13 18:27:15'),
(88, 2, 8, '2027-07-13', '', '2026-05-13 18:27:24'),
(91, 1, 11, '2026-05-13', '', '2026-05-13 20:15:39'),
(92, 2, 13, '2026-05-13', '', '2026-05-13 20:33:23'),
(93, 2, 13, '2026-05-13', '', '2026-05-13 20:37:12'),
(94, 2, 13, '2026-05-13', '', '2026-05-13 20:38:15'),
(95, 2, 13, '2026-05-13', '', '2026-05-13 20:38:20'),
(96, 2, 13, '2026-05-13', '', '2026-05-13 20:38:52'),
(97, 3, 9, '2026-05-13', '', '2026-05-13 20:43:02');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `phone` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `client_name`, `phone`) VALUES
(1, 'صوفيا مجدي', '01212883258'),
(2, 'مها علي', '01281587833'),
(3, 'مي عمرو', '01001607944'),
(4, 'مريم شحاته', '01055609433'),
(5, 'نور محمد', '01001234567'),
(6, 'سارة أحمد', '01112345678'),
(7, 'ريم علي', '01223456789'),
(8, 'دينا حسن', '01334567890'),
(9, 'منى إبراهيم', '01445678901'),
(10, 'هبة خالد', '01556789012'),
(11, 'لمياء عمر', '01667890123'),
(12, 'شيماء سامي', '01778901234'),
(13, 'نهى طارق', '01889012345'),
(14, 'آية رامي', '01990123456'),
(15, 'فاطمة يوسف', '01021234567'),
(16, 'زينب ماجد', '01132345678'),
(17, 'رنا وليد', '01243456789'),
(18, 'إيمان كريم', '01354567890'),
(19, 'لينا جمال', '01465678901'),
(20, 'ندى فريد', '01576789012'),
(21, 'سلمى بسام', '01687890123'),
(22, 'غادة عادل', '01798901234'),
(23, 'ياسمين نادر', '01809012345'),
(24, 'أميرة حاتم', '01910123456'),
(25, 'روان صلاح', '01041234567'),
(26, 'مريم فتحي', '01151234567'),
(27, 'دعاء محمود', '01261234567'),
(28, 'نادين رشاد', '01371234567'),
(29, 'هناء سعيد', '01481234567'),
(30, 'ولاء عصام', '01591234567'),
(31, 'إسراء حمدي', '01201234561'),
(32, 'شروق زياد', '01301234562'),
(33, 'منار أيمن', '01401234563'),
(34, 'بسمة تامر', '01501234564');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`) VALUES
(1, 'hair_cut'),
(2, 'hair_styling'),
(3, 'hair_coloring'),
(4, 'hair_treatment'),
(5, 'makeup_normal'),
(6, 'makeup_bridal'),
(7, 'facial_cleaning'),
(8, 'hydrafacial'),
(9, 'derma_pen'),
(10, 'skin_brightening'),
(11, 'manicure'),
(12, 'pedicure'),
(13, 'gel_nails'),
(14, 'acrylic_nails'),
(15, 'nail_art');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
