-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2020 at 11:00 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `ads_id` int(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `permalink` varchar(100) NOT NULL,
  `ads_interval` int(255) NOT NULL DEFAULT 5,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`ads_id`, `subject`, `image`, `permalink`, `ads_interval`, `created_at`, `updated_at`) VALUES
(16, 'Marketing Ads', 'ads/Xo8xgcyizKzv3RHx4W94FyqXxQfliaxZDvI8iAFc.jpeg', 'http://www.gmf-aeroasia.co.id/services/', 5, '2019-11-13 04:11:13', '2019-11-13 04:11:13'),
(17, 'Engineer Ads', 'ads/YSnSlaJHZaHPDvCYdyyu5AtJXTiZ82FBGorLzOox.jpeg', 'http://www.gmf-aeroasia.co.id/services/', 5, '2019-11-13 04:11:32', '2019-11-13 04:11:32'),
(18, 'Engineer Ads', 'ads/KElK0OpSUGq1hyNuKZa1hVmPZQ3Ey0tlAYQrvYcl.jpeg', 'http://www.gmf-aeroasia.co.id/services/', 5, '2019-11-16 05:12:16', '2019-11-16 05:12:16'),
(19, 'Engineer Ads', 'ads/0zXPIlvMXFf9jLjXp8Tf9birQ7cbcLKc0Jn9wBQ3.jpeg', 'http://www.gmf-aeroasia.co.id/services/', 5, '2019-11-16 05:12:46', '2019-11-16 05:12:46'),
(20, 'Engineer Ads', 'ads/7kHDrAedatmqRECYp3xBFEdnqtjYARnWYVT8W6GL.jpeg', 'http://www.gmf-aeroasia.co.id/services/', 5, '2019-11-16 05:13:00', '2019-11-16 05:13:00'),
(21, 'Marketing Ads', 'ads/hdob44CESZW1SGSPfiL8hbNho6C1KvFdS84V0Lvr.rtf', 'http://www.gmf-aeroasia.co.id/services/', 7, '2019-11-17 23:21:30', '2019-12-22 09:17:02'),
(22, 'Engineer Ads', '', 'http://www.gmf-aeroasia.co.id/services/', 5, '2019-12-22 09:15:10', '2019-12-22 09:15:10'),
(23, 'Engineer Ads', '', 'http://www.gmf-aeroasia.co.id/services/', 10, '2019-12-22 09:16:15', '2019-12-22 09:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `alliance`
--

CREATE TABLE `alliance` (
  `alliance_id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alliance`
--

INSERT INTO `alliance` (`alliance_id`, `name`) VALUES
(1, 'Skyteam');

-- --------------------------------------------------------

--
-- Table structure for table `birthday_card`
--

CREATE TABLE `birthday_card` (
  `birthday_card_id` int(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `permalink` varchar(1000) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `birthday_card`
--

INSERT INTO `birthday_card` (`birthday_card_id`, `subject`, `image`, `permalink`, `created_at`, `updated_at`) VALUES
(5, 'Birthday in Desember', 'birthdaycard/LlK7MK2i8UO2nvHUZ4I5NHD3PlUKtN1FELHeJtfh.jpeg', 'http://gmf-aeroasia.co.id/birthday/desember', '2019-11-13 04:12:36.000000', '2019-12-01 02:09:05.000000');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `image` varchar(1000) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `company_role` varchar(100) DEFAULT NULL,
  `business_model` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `est_date` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `customer_type` varchar(100) DEFAULT NULL,
  `shareholder` varchar(50) DEFAULT NULL,
  `alliance` varchar(50) DEFAULT NULL,
  `MRO` varchar(50) DEFAULT NULL,
  `fleet_size` int(50) DEFAULT NULL,
  `destination` int(50) DEFAULT NULL,
  `customer_since` int(50) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`image`, `name`, `region`, `country`, `company_role`, `business_model`, `status`, `est_date`, `type`, `customer_type`, `shareholder`, `alliance`, `MRO`, `fleet_size`, `destination`, `customer_since`, `company_id`, `created_at`, `updated_at`) VALUES
('company/o8D6GM15uzUY1gVUhlu3GM0RSnXgerAIrQMXWzwh.jpeg', 'Lion', NULL, NULL, NULL, NULL, 'Active', 1982, 'FSC', NULL, 'Hanjin Group', NULL, NULL, 0, 0, 0, 1, NULL, NULL),
('company/oaEbOTlb6XesD5Qddyu2WuBhMcrybTuNTJJOik1i.png', 'Korean Airlines', NULL, 'Indonesia', 'Passanger', 'Operator', 'Active', 1962, 'FSC', 'Existing Customer(Retail)', 'Hanjin Group', 'SkyTeam', 'Jin Air(LCC)', 174, 150, 2018, 6, NULL, NULL),
('company/E9tM6l49EYO3vww9lEvTzHwIqOjRFXiP5uj14tCo.jpeg', 'Nam Airlines', NULL, 'Indonesia', 'Passanger', 'Operator', 'Active', 1962, 'FSC', 'Existing Customer(Retail)', 'Hanjin Group', 'SkyTeam', 'Jin Air(LCC)', 174, 150, 2018, 7, NULL, NULL),
('company/hgV0hrPti2S1kjhyweXlNFzmrbBk7um1P5eZk5eb.jpeg', 'Garuda Indonesia', 'Domestic', 'Indonesia', 'Passanger', 'Operator', 'Active', 1962, 'FSC', 'Existing Customer(Retail)', 'Hanjin Group', 'SkyTeam', 'Jin Air(LCC)', 174, 150, 2018, 8, NULL, NULL),
(NULL, 'Indian Airlines', 'Domestic', 'Indonesia', 'Passanger', 'Operator', 'Active', 1962, 'FSC', 'Existing Customer(Retail)', 'Hanjin Group', 'SkyTeam', 'Jin Air(LCC)', 174, 150, 2018, 23, '2019-12-19 07:06:45', '2019-12-19 07:06:45'),
(NULL, 'Indian Airlines', 'Domestic', 'Indonesia', 'Passanger', 'Operator', 'Active', 1962, 'FSC', 'Existing Customer(Retail)', 'Hanjin Group', 'SkyTeam', 'Jin Air(LCC)', 174, 150, 2018, 24, '2019-12-29 02:39:31', '2019-12-29 02:39:31'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'asd', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 81, '2020-02-09 20:11:38', '2020-02-09 20:11:38'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 82, '2020-02-09 20:15:21', '2020-02-09 20:15:21'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 83, '2020-02-09 20:16:48', '2020-02-09 20:16:48'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 84, '2020-02-09 20:17:28', '2020-02-09 20:17:28'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 85, '2020-02-09 20:17:40', '2020-02-09 20:17:40'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 86, '2020-02-09 20:20:27', '2020-02-09 20:20:27'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 87, '2020-02-09 20:21:00', '2020-02-09 20:21:00'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 88, '2020-02-09 20:25:56', '2020-02-09 20:25:56'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 89, '2020-02-09 20:29:35', '2020-02-09 20:29:35'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'B723-2', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 91, '2020-02-09 20:31:17', '2020-02-09 20:31:17'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'asd', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 95, '2020-02-09 20:40:06', '2020-02-09 20:40:06'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'asd', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 100, '2020-02-09 20:52:55', '2020-02-09 20:52:55'),
(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, '2020-02-09 20:52:55', '2020-02-09 20:52:55'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'asd', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 102, '2020-02-09 20:54:11', '2020-02-09 20:54:11'),
(NULL, 'Lion', 'asd', 'asd', 'ads', 'ad', 'Active', 2019, 'asd', 'asd', 'asd', 'asd', 'asd', 2, 2, 2019, 103, '2020-02-09 20:55:08', '2020-02-09 20:55:08'),
(NULL, 'Lion', 'asd', 'asd', 'asd', 'asd', 'Active', 2020, 'asd', 'asd', 'asd', 'asd', 'asd', 2, 21, 2019, 104, '2020-02-09 20:59:46', '2020-02-09 20:59:46');

-- --------------------------------------------------------

--
-- Table structure for table `company_ads`
--

CREATE TABLE `company_ads` (
  `company_ads_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ads_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_ads`
--

INSERT INTO `company_ads` (`company_ads_id`, `company_id`, `ads_id`) VALUES
(9, 1, 16),
(10, 8, 21);

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaint_id` int(100) NOT NULL,
  `date` date NOT NULL,
  `closed` date DEFAULT NULL,
  `sender` varchar(100) NOT NULL,
  `service` varchar(1000) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `complaint` varchar(2000) NOT NULL,
  `file` varchar(1000) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Open',
  `user_id` int(100) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaint_id`, `date`, `closed`, `sender`, `service`, `subject`, `complaint`, `file`, `status`, `user_id`, `company_id`) VALUES
(10, '2019-11-13', NULL, 'Felix', 'Base Maintenance', 'Complaint Base Maintenance', 'Complaint body', 'complaint/cDrziHgordoBHahU4yVrXglzB0C7YrosG0XBrwbn.pdf', 'Open', 22, 8),
(11, '2019-11-13', NULL, 'manasye', 'Base Maintenance', 'Complaint Base Maintenance', 'Complaint body', 'complaint/uMWCUYEOkWn89DHG9zFvwiwZeiL95s4KmGdltDU8.pdf', 'Open', 10, 1),
(12, '2019-11-16', NULL, 'manasye', 'Base Maintenance', 'Complaint Base Maintenance', 'Complaint body', 'complaint/yBHSiTVLtxsAYydhjAoGMWqZY3eSYdCHp8Dzlyt8.pdf', 'Open', 10, 1),
(13, '2019-05-11', NULL, 'manasye', 'Base Maintenance', 'Complaint Base Maintenance', 'Complaint body', 'complaint/Pq7DGTMv22DfqF6WCtdaDUGCJffljscmOpzJmtKU.pdf', 'Open', 10, 1),
(14, '2019-05-11', NULL, 'manasye', 'Base Maintenance', 'Complaint Base Maintenance', 'Complaint body', '', 'Open', 10, 1),
(15, '2019-05-11', NULL, 'manasye', 'Base Maintenance', 'asd', 'asdasd', '', 'Open', 10, 1),
(16, '2020-01-14', NULL, 'manasye', 'Base Maintenance', 'asd', 'asdasd', '', 'Open', 10, 1),
(17, '2020-01-14', NULL, 'manasye', 'Base Maintenance', 'asd', 'asdasd', '', 'Open', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cp_company`
--

CREATE TABLE `cp_company` (
  `cp_company_id` int(100) NOT NULL,
  `gmf_cp_id` int(100) NOT NULL,
  `company_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cp_company`
--

INSERT INTO `cp_company` (`cp_company_id`, `gmf_cp_id`, `company_id`) VALUES
(1, 6, 8),
(2, 7, 8),
(3, 8, 1),
(4, 9, 1),
(5, 10, 1),
(6, 12, 1),
(7, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_type`
--

CREATE TABLE `customer_type` (
  `customer_type_id` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`customer_type_id`, `name`) VALUES
(1, 'Existing Customer(Retail)');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_nonproject`
--

CREATE TABLE `feedback_nonproject` (
  `feedback_nonproject_id` int(100) NOT NULL,
  `date` date NOT NULL,
  `rating` varchar(100) NOT NULL,
  `subject` varchar(5000) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `sender` varchar(1000) NOT NULL,
  `user_customer_id` int(100) NOT NULL,
  `company_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_nonproject`
--

INSERT INTO `feedback_nonproject` (`feedback_nonproject_id`, `date`, `rating`, `subject`, `description`, `sender`, `user_customer_id`, `company_id`) VALUES
(5, '2019-11-09', '5', 'Feedback Nonproject 1', 'Feedback Nonproject 1 description', 'manasye', 13, 1),
(6, '2019-11-09', '4', 'Feedback Nonproject 2', 'Feedback Nonproject 2 description', 'Juan Felix', 14, 1),
(7, '2019-11-09', '3', 'Feedback Nonproject 3', 'Feedback Nonproject 3 description', 'Juan', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_project`
--

CREATE TABLE `feedback_project` (
  `feedback_project_id` int(100) NOT NULL,
  `date` date DEFAULT NULL,
  `sender` varchar(1000) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `aspect_to_improve` varchar(1000) DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `user_id` int(100) DEFAULT NULL,
  `company_id` int(100) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `service_id` int(100) DEFAULT NULL,
  `list_feedback_project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback_project`
--

INSERT INTO `feedback_project` (`feedback_project_id`, `date`, `sender`, `rating`, `aspect_to_improve`, `remark`, `user_id`, `company_id`, `project_id`, `service_id`, `list_feedback_project_id`) VALUES
(20, '2019-12-17', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 4, 8, NULL),
(21, '2019-12-17', 'manasye', 1.5, 'Quality Assurance Team', NULL, 10, 1, 4, 18, NULL),
(22, '2019-12-17', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 4, 8, NULL),
(23, '2019-12-17', 'manasye', 1.5, 'Quality Assurance Team', NULL, 10, 1, 4, 18, NULL),
(24, '2019-12-17', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 6, 8, NULL),
(25, '2019-12-17', 'manasye', 1.5, 'Quality Assurance Team', NULL, 10, 1, 6, 18, NULL),
(26, '2019-12-17', 'manasye', 2, 'Product Quality', NULL, 10, 1, 6, 8, NULL),
(27, '2019-12-17', 'manasye', 4, 'Quality Assurance Team', NULL, 10, 1, 6, 18, NULL),
(28, '2019-12-17', 'manasye', 0.5, 'Product Quality', NULL, 10, 1, 6, 8, NULL),
(37, '2019-12-23', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 9, 8, 1),
(38, '2019-12-23', 'manasye', 5, 'Quality Assurance Team', NULL, 10, 1, 9, 18, 1),
(39, '2019-12-24', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 9, 8, 2),
(40, '2019-12-24', 'manasye', 5, 'Quality Assurance Team', NULL, 10, 1, 9, 18, 2),
(41, '2020-01-14', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 10, 8, 3),
(42, '2020-01-14', 'manasye', 5, 'Quality Assurance Team', NULL, 10, 1, 10, 18, 3),
(43, '2020-01-28', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 11, 8, 6),
(44, '2020-01-28', 'manasye', 5, 'Quality Assurance Team', NULL, 10, 1, 11, 18, 6),
(45, '2020-01-28', 'manasye', 2.5, 'Product Quality', NULL, 10, 1, 11, 8, 7),
(46, '2020-01-28', 'manasye', 5, 'Quality Assurance Team', NULL, 10, 1, 11, 18, 7);

-- --------------------------------------------------------

--
-- Table structure for table `fleet_maint`
--

CREATE TABLE `fleet_maint` (
  `fleet_maint_id` int(255) NOT NULL,
  `product` varchar(1000) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `quantity` int(255) DEFAULT NULL,
  `maint_provider` varchar(1000) DEFAULT NULL,
  `suitable` varchar(100) DEFAULT NULL,
  `company_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fleet_maint`
--

INSERT INTO `fleet_maint` (`fleet_maint_id`, `product`, `type`, `quantity`, `maint_provider`, `suitable`, `company_id`) VALUES
(2, 'Airframe', 'B747-823', 20, NULL, 'future', 1),
(3, 'Airframe', 'B72-20', 2, NULL, 'current', 1),
(4, 'Engine', 'B72-20', 2, NULL, 'current', 1),
(5, 'Apu', 'B72-20', 2, NULL, 'current', 1),
(6, 'Component', 'B72-20', 2, NULL, 'current', 1),
(7, 'Airframe', 'B723-2', 2, NULL, 'future', 87),
(8, 'Airframe', 'B723-2', 2, NULL, 'future', 88),
(9, 'Airframe', 'B723-2', 2, NULL, 'future', 89),
(10, 'Airframe', 'B723-2', 2, NULL, 'future', 91),
(11, 'Airframe', 'B723-2', 2, NULL, 'future', 95),
(12, 'Airframe', 'B723-2', 2, NULL, 'future', 101),
(13, 'Apu', 'B231-1', 5, NULL, 'current', 101),
(14, 'Airframe', 'B723-2', 2, NULL, 'future', 102),
(15, 'Apu', 'B231-1', 5, NULL, 'current', 102),
(16, 'Airframe', 'B723-2', 2, NULL, 'future', 103),
(17, 'Apu', 'B231-1', 5, NULL, 'current', 103),
(18, 'Airframe', 'B23-1', 2, NULL, 'future', 104),
(19, 'Apu', 'B23-4', 4, NULL, 'current', 104),
(20, 'Apu', 'B123-5', 5, NULL, 'future', 104);

-- --------------------------------------------------------

--
-- Table structure for table `gmf_cp`
--

CREATE TABLE `gmf_cp` (
  `gmf_cp_id` int(100) NOT NULL,
  `image` varchar(1000) NOT NULL DEFAULT 'user/default.png',
  `name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gmf_cp`
--

INSERT INTO `gmf_cp` (`gmf_cp_id`, `image`, `name`, `position`, `phone`, `email`) VALUES
(7, 'user/default.png', 'Dseni', 'Staff Engineering', '08127382919', 'ysf@gmail.com'),
(8, 'user/default.png', 'Dewi', 'Staff Marketing', '081273829182', 'deni@gmail.com'),
(9, 'user/default.png', 'Pol', 'Staff Marketing', '081273829182', 'pol@gmail.com'),
(10, 'user/default.png', 'Pola', 'Staff Marketing', '081273829182', 'pola@gmail.com'),
(12, 'user/default.png', 'Adit', 'Staff Marketing', '081273829182', 'adit@gmail.com'),
(13, 'user/1gFg8YRuuDSYhDdayVnQjZyq6mHhOgxAUX0swPMf.jpeg', 'Edak', 'Staff Marketing', '081273829182', 'adit@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `list_feedback_project`
--

CREATE TABLE `list_feedback_project` (
  `list_feedback_project_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `list_feedback_project`
--

INSERT INTO `list_feedback_project` (`list_feedback_project_id`, `date`, `rating`, `project_id`) VALUES
(1, '2019-12-23', 4, 9),
(2, '2019-12-24', 4, 9),
(3, '2020-01-14', 4, 10),
(4, NULL, NULL, 10),
(5, NULL, NULL, 10),
(6, '2020-01-28', 4, 11),
(7, '2020-01-28', 4, 11),
(8, NULL, NULL, 11),
(9, NULL, NULL, 12),
(10, NULL, NULL, 12),
(11, NULL, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(255) NOT NULL,
  `message` mediumtext DEFAULT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'text',
  `sender` varchar(1000) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL,
  `receiver` varchar(1000) DEFAULT NULL,
  `rcv_user_id` int(255) DEFAULT NULL,
  `already_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `message`, `type`, `sender`, `user_id`, `receiver`, `rcv_user_id`, `already_read`, `created_at`, `updated_at`) VALUES
(6, '\"adkoqwkdqodkwqodkasldkqwlkdq\"', 'text', 'Juan Felix', 13, 'admin', NULL, 1, '2019-12-03 22:40:39', NULL),
(7, '\"adkoqwkdqodkwqodkasldkqwlkdq\"', 'text', 'Juan', 15, 'admin', NULL, 1, '2019-12-04 21:10:15', NULL),
(8, 'yaya', 'text', 'admin', 14, 'Juan', 15, 1, '2019-12-04 21:10:47', NULL),
(9, '\"adkoqwkdqodkwqodkasldkqwlkdq\"', 'text', 'Ferry', 29, 'admin', NULL, 0, '2019-12-04 21:22:17', NULL),
(12, 'yaya', 'text', 'admin', 14, 'Juan', 15, 1, '2019-12-11 03:55:08', NULL),
(13, 'hai', 'text', 'admin', 14, 'Juan', 15, 1, '2019-12-11 03:56:19', NULL),
(14, 'hai', 'text', 'admin', 14, 'Juan', 15, 1, '2019-12-11 04:07:35', NULL),
(15, 'hai', 'text', 'admin', 14, 'Juan', 15, 1, '2019-12-11 04:15:33', NULL),
(18, '\"adkoqwkdqodkwqodkasldkqwlkdq\"', 'text', 'manasye', 10, 'admin', NULL, 0, '2020-01-12 02:33:44', NULL),
(19, 'Your message has been received. Please wait for our admin to reply', 'text', 'admin', 14, 'manasye', 10, 0, '2020-01-12 02:33:44', NULL),
(20, '\"adkoqwkdqodkwqodkasldkqwlkdq\"', 'text', 'manasye', 10, 'admin', NULL, 0, '2020-01-12 02:34:04', NULL),
(21, 'hai', 'text', 'admin', 14, 'Peng', 38, 0, '2020-01-12 03:12:57', NULL),
(22, '\"adkoqwkdqodkwqodkasldkqwlkdq\"', 'text', 'Felix', 22, 'admin', NULL, 0, '2020-01-12 03:30:12', NULL),
(23, 'Your message has been received. Please wait for our admin to reply', 'text', 'admin', 14, 'Felix', 22, 0, '2020-01-12 03:30:12', NULL),
(24, 'hai', 'text', 'admin', 14, 'Ronald12', 37, 0, '2020-01-12 03:30:38', NULL),
(25, '\"adkoqwkdqodkwqodkasldkqwlkdq\"', 'text', 'Felix', 22, 'admin', NULL, 0, '2020-01-13 20:01:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE `newsletter` (
  `newsletter_id` int(100) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `permalink` varchar(1000) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`newsletter_id`, `subject`, `image`, `permalink`, `created_at`, `updated_at`) VALUES
(5, 'Newsletter Marketing', 'newsletter/CaqymiV66ncxkntXbgPsKgEOEArAx9WOYR1RK2yW.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-13 05:42:50.000000', '2019-11-13 05:42:50.000000'),
(6, 'Newsletter Marketing', 'newsletter/2aGHOpfLU9ccs8QtZHfzhxyDPIYf5Ok3lgqB3Cix.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-13 05:43:00.000000', '2019-11-13 05:43:00.000000'),
(7, 'Newsletter Marketing', 'newsletter/OwBt9IjLXY7gIoQgVxslGMwDhXt5rG4B1RLOOrdT.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:23:44.000000', '2019-11-16 05:23:44.000000'),
(8, 'Newsletter Marketing', 'newsletter/kYLhDgapxYxO3UfQm2OSJ4ORt2PHtdSuCJPWpz85.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:24:22.000000', '2019-11-16 05:24:22.000000'),
(9, 'Newsletter Marketing', 'newsletter/zxCCCISTGtqcWM18nnNZ1bOftswKgAuk1ft2qEcD.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:24:47.000000', '2019-11-16 05:24:47.000000'),
(10, 'Newsletter Marketing', 'newsletter/C2kSlU9YaWIHE9swJc3theN5j8GDLsYJBRDUd5Et.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:28:26.000000', '2019-11-16 05:28:26.000000'),
(11, 'Newsletter Marketing', 'newsletter/C9oAFF5M0GRmeizNrCikG9fcOGFhoZRDqyp6JNHP.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:31:29.000000', '2019-11-16 05:31:29.000000'),
(12, 'Newsletter Marketing', 'newsletter/KXPyhl6tYk1HcyhWT5yGD3B6C1CM41pfC3bCZdhC.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:33:36.000000', '2019-11-16 05:33:36.000000'),
(13, 'Newsletter Marketing', 'newsletter/tNtKyPiH7YSTvMCDkraKMP4KNTkrLfLsC42TAzAQ.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:35:43.000000', '2019-11-16 05:35:43.000000'),
(14, 'Newsletter Marketing', 'newsletter/CXMwbw7Q1l7l0x0A7g1xP2kJIAsSycGlcQ0KjhGq.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:35:43.000000', '2019-11-16 05:35:43.000000'),
(15, 'Newsletter Marketing', 'newsletter/UbJ0Cvd8lZTQ2EZ8NqWyl3PoUCD0AZjzq61Zi6A3.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:35:43.000000', '2019-11-16 05:35:43.000000'),
(16, 'Newsletter Marketing', 'newsletter/IdweoKaJzN9jXtLY1dcoqx3Z2hnfzRuhyh67XgiJ.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:36:33.000000', '2019-11-16 05:36:33.000000'),
(17, 'Newsletter Marketing', 'newsletter/1Z20tsqk93wQjw7CFDHpQQu2mQj8njpDAuvdjdf0.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:36:59.000000', '2019-11-16 05:36:59.000000'),
(18, 'Newsletter Marketing', 'newsletter/GPWGYJXgZdQQqZheWOKUGn3uW8NwBkwYaBFMfAxe.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:39:05.000000', '2019-11-16 05:39:05.000000'),
(19, 'Newsletter Marketing', 'newsletter/E7o3nhvtXsKXqjfIcJxlXpWTIzSY9Anpw3X7eGsN.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:41:35.000000', '2019-11-16 05:41:35.000000'),
(20, 'Newsletter Marketing', 'newsletter/JqMTWOXzgaI7QoWUkRPfAxHkKn222WaPEeKwuqNu.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:44:11.000000', '2019-11-16 05:44:11.000000'),
(21, 'Newsletter Marketing', 'newsletter/mB7jczrIay6JP6dDrEBXgQmDQfsZSxyRNoXKzTHJ.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:46:34.000000', '2019-11-16 05:46:34.000000'),
(22, 'Newsletter Marketing', 'newsletter/MrY8PbJlKjtprSIOdiKLIEIIxAfzVo13Db1gRMbP.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:56:48.000000', '2019-11-16 05:56:48.000000'),
(23, 'Newsletter Marketing', 'newsletter/Qxcb7mSiTHXHTmoRUzLVxdxV7yv7p2VoNb6v2cEh.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 05:57:31.000000', '2019-11-16 05:57:31.000000'),
(24, 'Newsletter Marketing', 'newsletter/Y9kt5NrfYU44GbizbTZnA72g4TNapVl11RGxD5UB.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 06:00:53.000000', '2019-11-16 06:00:53.000000'),
(25, 'Newsletter Marketing', 'newsletter/49Y29fPcVTuo75iJ9H1D7LX4uTIr4ZjHPwUnBljC.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-11-16 06:01:17.000000', '2019-11-16 06:01:17.000000'),
(26, 'Newsletter Marketing', '', 'http://www.gmf-aeroasia.co.id', '2019-11-17 23:42:48.000000', '2019-11-17 23:42:48.000000'),
(27, 'Newsletter Marketing', '', 'http://www.gmf-aeroasia.co.id', '2019-11-17 23:46:36.000000', '2019-11-17 23:46:36.000000'),
(28, 'Newsletter Marketing', 'newsletter/q2xvUt1sV0sBdWGOKyg1P3s7x4nFQU5ySml3u2Zx.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-12-19 00:35:49.000000', '2019-12-19 00:35:49.000000'),
(29, 'Newsletter Marketing', 'newsletter/CAA8eNxZMJJPt25jygFHHdVX91NyJdPFtci0OAvz.jpeg', 'http://www.gmf-aeroasia.co.id', '2019-12-19 00:40:40.000000', '2019-12-19 00:40:40.000000');

-- --------------------------------------------------------

--
-- Table structure for table `past_marketing`
--

CREATE TABLE `past_marketing` (
  `past_marketing_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `activity` varchar(1000) NOT NULL,
  `remarks` varchar(1000) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `past_marketing`
--

INSERT INTO `past_marketing` (`past_marketing_id`, `date`, `activity`, `remarks`, `company_id`) VALUES
(1, '2019-12-29', 'Test Activity', 'Test Remarks', 1),
(3, '2019-12-29', 'Testing', 'Test Remarks', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `finish` date DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'On Going',
  `quantity` int(50) NOT NULL DEFAULT 1,
  `done` int(11) NOT NULL DEFAULT 0,
  `project_type` varchar(100) DEFAULT NULL,
  `rating` varchar(50) NOT NULL DEFAULT 'Not Rated',
  `ac_reg` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `jobcard_total` varchar(1000) DEFAULT NULL,
  `jobcard_open` int(11) DEFAULT NULL,
  `jobcard_progress` int(11) DEFAULT NULL,
  `mdr_total` varchar(1000) DEFAULT NULL,
  `mdr_open` int(11) DEFAULT NULL,
  `mdr_progress` int(11) DEFAULT NULL,
  `jobcard_closed` int(11) DEFAULT NULL,
  `mdr_closed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `name`, `start`, `finish`, `status`, `quantity`, `done`, `project_type`, `rating`, `ac_reg`, `location`, `type`, `company_id`, `jobcard_total`, `jobcard_open`, `jobcard_progress`, `mdr_total`, `mdr_open`, `mdr_progress`, `jobcard_closed`, `mdr_closed`) VALUES
(4, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 1, 0, 'Line Maintenance', '2', 'Project 1', 'GAH3', '3', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(5, 'KA Project 1', '2019-12-12', '2020-01-01', 'Closed', 1, 0, 'Base Maintenance', '5', 'Project 1', 'GAH3', '6', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(6, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 1, 0, 'Line Maintenance', '2', 'Project 1', 'GAH3', '2', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(7, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 1, 0, 'Line Maintenance', 'Not Rated', 'Project 1', 'GAH3', '2', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(8, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 1, 0, 'Line Maintenance', 'Not Rated', 'Project 1', 'GAH3', '2', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(9, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 2, 2, 'Line Maintenance', '4', 'Project 1', 'GAH3', '2', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(10, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 3, 1, 'Line Maintenance', '4', 'Project 1', 'GAH3', '2', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(11, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 3, 2, 'Line Maintenance', '4', 'Project 1', 'GAH3', '2', 1, '840', 0, 0, '700', 0, 0, 840, 700),
(12, 'LA Project 1', '2019-12-12', '2020-01-01', 'On Going', 3, 0, 'Line Maintenance', 'Not Rated', 'Project 1', 'GAH3', '2', 1, '800', 0, 0, '700', 0, 0, 800, 700),
(13, '00000000', NULL, NULL, 'CRTD', 1, 0, NULL, 'Not Rated', '                              ', '    ', NULL, 1, '0', 0, 0, '0', 0, 0, 0, 0),
(14, '00004839', '2015-04-04', '2015-04-05', 'CLSD', 1, 0, NULL, 'Not Rated', 'PK-CLQ                        ', 'GAH3', NULL, 1, '1', 0, 0, '0', 0, 0, 1, 0),
(15, '00007097', '2015-05-30', '2015-05-31', 'CLSD', 1, 0, NULL, 'Not Rated', 'PK-GRA                        ', 'UPG1', NULL, 1, '0', 0, 0, '1', 0, 0, 0, 1),
(16, '00009886', '2015-08-10', '2015-08-11', 'CLSD', 1, 0, NULL, 'Not Rated', 'PK-GFI                        ', 'CGK2', NULL, 1, '5', 0, 0, '0', 0, 0, 5, 0),
(17, '00010199', '2015-08-21', '2015-08-22', 'CLSD', 1, 0, NULL, 'Not Rated', 'PK-GEI                        ', 'CGK2', NULL, 1, '13', 0, 0, '0', 0, 0, 13, 0),
(18, '00010794', '2015-09-07', '2015-09-08', 'CLSD', 1, 0, NULL, 'Not Rated', 'PK-GQK                        ', 'SUB1', NULL, 1, '1', 0, 0, '0', 0, 0, 1, 0),
(19, '00011068', '2015-08-30', '2015-08-31', 'CLSD', 1, 0, NULL, 'Not Rated', 'PK-GMJ                        ', 'CGK2', NULL, 1, '0', 0, 0, '0', 0, 0, 0, 0),
(20, '00028445', '2016-08-22', '2016-08-23', 'CRTD', 1, 0, NULL, 'Not Rated', 'PK-GFV                        ', '    ', NULL, 1, '0', 0, 0, '1', 0, 0, 0, 1),
(21, '00034799', '2016-12-05', '2016-12-06', 'CRTD', 1, 0, NULL, 'Not Rated', 'PK-GFI                        ', '    ', NULL, 1, '0', 0, 0, '0', 0, 0, 0, 0),
(22, '00035200', '2016-12-12', '2016-12-13', 'CLSD', 1, 0, NULL, 'Not Rated', 'PK-GRL                        ', 'CGK3', NULL, 1, '0', 0, 0, '0', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_service`
--

CREATE TABLE `project_service` (
  `project_service_id` int(100) NOT NULL,
  `project_id` int(100) NOT NULL,
  `service_id` int(100) NOT NULL,
  `rating` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `religion_card`
--

CREATE TABLE `religion_card` (
  `religion_card_id` int(100) NOT NULL,
  `subject` varchar(1000) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `religion` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `permalink` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `religion_card`
--

INSERT INTO `religion_card` (`religion_card_id`, `subject`, `image`, `religion`, `date`, `permalink`, `created_at`, `updated_at`) VALUES
(5, 'Christmas', 'religioncard/4e40DGMrAcCHptg7DCvHHEeSHSJaMsNlUX3Sz2Tw.jpeg', 'Kristen', '2019-12-01', 'www.gmf-aeroasia.co.id/religioncard/christmas', '2019-11-13 06:32:37', '2019-11-13 06:35:36'),
(6, 'Nyepi', 'religioncard/rRD1e1y8S3Pdhh2AHOdKutXgjQoXahGmGwaCLH96.webp', 'Hindu', '2019-11-30', 'www.gmf-aeroasia.co.id/religioncard/nyepi', '2019-11-13 06:33:44', '2019-11-13 06:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `reply_complaint`
--

CREATE TABLE `reply_complaint` (
  `reply_complaint_id` int(100) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `sender_role` enum('Customer','Admin','','') NOT NULL,
  `user_id` int(100) NOT NULL,
  `complaint_id` int(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply_complaint`
--

INSERT INTO `reply_complaint` (`reply_complaint_id`, `description`, `sender_role`, `user_id`, `complaint_id`, `created_at`, `updated_at`) VALUES
(3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium', 'Customer', 13, 10, '2019-11-12 17:00:00', '2019-11-12 17:00:00'),
(4, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium', 'Admin', 14, 10, '2019-11-13 17:00:00', '2019-11-13 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `revenue`
--

CREATE TABLE `revenue` (
  `revenue_id` int(11) NOT NULL,
  `product` varchar(1000) NOT NULL,
  `sales` int(11) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revenue`
--

INSERT INTO `revenue` (`revenue_id`, `product`, `sales`, `company_id`) VALUES
(2, 'Airframe', 200000, 1),
(3, 'Engine', 30000, 1),
(4, 'Component', 30000, 1),
(5, 'Airframe', 20000, 89),
(6, 'Airframe', 20000, 91),
(7, 'Airframe', 20000, 95),
(8, 'Airframe', 20000, 101),
(9, 'Apu', 100000, 101),
(10, 'Airframe', 20000, 102),
(11, 'Apu', 100000, 102),
(12, 'Airframe', 20000, 103),
(13, 'Apu', 100000, 103),
(14, 'Airframe', 20000, 104),
(15, 'Apu', 30000, 104),
(16, 'Apu', 20000, 104);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `detail` varchar(2000) NOT NULL,
  `permalink` varchar(1000) NOT NULL DEFAULT 'http://www.gmf-aeroasia.co.id/service',
  `large_image` varchar(1000) NOT NULL,
  `small_image1` varchar(1000) NOT NULL,
  `small_image2` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `name`, `detail`, `permalink`, `large_image`, `small_image1`, `small_image2`, `created_at`, `updated_at`) VALUES
(8, 'Outstation Line Maintenance', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/Y5wu0ceb3IYk9S0ByMbkjVbWPN4Vp3RasaoD7XQq.jpeg', 'serviceimage/R3izwGE5DmajROqlegmzrbdoE3LHFOZeuRJUR2VP.jpeg', 'serviceimage/nRIKSl62JT8nWvU3IhYBQvbRJXDYLtCstJ8BD2LA.jpeg', '2019-12-16 17:23:32', '2019-12-16 17:23:32'),
(9, 'Logistic & Material Service', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/h2agtBkNuecwlCs0XvgSGwW0j5gxghx4i03WTCkm.jpeg', 'serviceimage/0b3jDSIRKZ0BiPsPaW1p41WZMzEdptIcaGEZzTgN.jpeg', 'serviceimage/fRF8fnKVVY1R9H2D04oO9W2Y1TC64SvQA5wWHJkQ.jpeg', '2019-12-16 17:23:48', '2019-12-16 17:23:48'),
(10, 'Learning / Training', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/fbUeogqdBfrRisBfxsI8UumIAstzF5nnUbGLRE0l.jpeg', 'serviceimage/8I4GgQdoL3UbFlD28STgzau7QM2EOmDnoK9qwvfS.jpeg', 'serviceimage/u3tJnQ4yjBuwdzLWQwIGvLcHM0MavAeysssAIqGO.jpeg', '2019-12-16 17:24:05', '2019-12-16 17:24:05'),
(11, 'Engineering Services', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/uqDHFBNz6q1Jk5tGW4UM2ZZ3S9IYbiAAV6OuESCL.jpeg', 'serviceimage/0KMYDcaRzI7wrRldFIti0iMkPbN7ztID0HXRMRh2.jpeg', 'serviceimage/fCMJeqIXucmvnXcbyVMIceTUHbIzhBaQyH4ZMwas.jpeg', '2019-12-16 17:24:19', '2019-12-16 17:24:19'),
(12, 'Power Service (IGTE)', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/VSIbFXQoksYKgIg5r3TDMDYypwkBKPovUcNtvCqf.jpeg', 'serviceimage/eLcDldgeagkxZACDGeljPHqgJgenfwrWGYVw2Ifl.jpeg', 'serviceimage/XKT7dVhbLuJxtRwR8qalEKhpAifqOkhmjHSXAaFf.jpeg', '2019-12-16 17:24:31', '2019-12-16 17:24:31'),
(13, 'Component Services', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/hBgJcgCbcM62hnBofJW6mRnc7flIkEbEK4RCYSK2.jpeg', 'serviceimage/2nAWBx8VPE1CER3Ma7PFV4XvltOBUs8ZGNvNFmT5.jpeg', 'serviceimage/xf2ncuf8rOcZORYsK2d6l91LGmRN4Q09zKSUOlKe.jpeg', '2019-12-16 17:24:52', '2019-12-16 17:24:52'),
(14, 'Line Maintenance', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/7FISNvfBZLFl8dGZPdAP6EoG2KNJ9LXj1MyuazWj.jpeg', 'serviceimage/SaT4XP0ecWorKVQyXvIuUZdSnnePJRBIo2xnrXNH.jpeg', 'serviceimage/wrRnBxKjmETzyHY6WGA8goQ7OTSFEhch8jkAOOCR.jpeg', '2019-12-16 17:25:04', '2019-12-16 17:25:04'),
(15, 'Engine Services', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/RO6VBwkHL1legmAHMHocFMmRUC98is0NwzL0SvLG.jpeg', 'serviceimage/iKEzVIfDrGMr8qUrdBR2SYS3hSyWw1iMs1m4BP46.jpeg', 'serviceimage/uDMWlbB2y0lrXSBFqFhtOQVSHD1hHutyfIYevpic.jpeg', '2019-12-16 17:25:11', '2019-12-16 17:25:11'),
(16, 'Ground Support', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/TaNYzDsPPRjwmfLEtCllRe8Lwut4WENvy2ulYa5U.jpeg', 'serviceimage/T1X9j0zpEq1AFTsHyMcR4Xh850vgxx35LoiBQ8jM.jpeg', 'serviceimage/cdoJU7JGZ1ec4pLTshj4yL1Tb26Z2WV75CwEvANz.jpeg', '2019-12-16 17:25:17', '2019-12-16 17:25:17'),
(17, 'Facility / IT / Other Services', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/dXqQUZJPy0BGDZYCtXzVs3iT1OkUBk0DFaYs2mYh.jpeg', 'serviceimage/ievZ1Vqck3iXvHv1A1dYiAIG61GT1ynVOF392hLm.jpeg', 'serviceimage/FcQBE8hb59O58JbnIa5Vlwn9iaworisGnpB68EWd.jpeg', '2019-12-16 17:25:31', '2019-12-16 17:25:31'),
(18, 'Base Maintenance', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/gNJWXbxBnzb9Qrdu2w2wJsA1EQTnGCW0rEvaLt8e.jpeg', 'serviceimage/NebZJltF4nCR72sANLQm3Gm2RrYxBgulrCR4kRDs.jpeg', 'serviceimage/y6V2Q3utVUYNLGUEmni6UwIhJ52pB6jXFKLeOITC.jpeg', '2019-12-16 17:32:44', '2019-12-16 17:32:44'),
(19, 'Cabin Maintenance', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursusl nunc', 'http://www.gmf-aeroasia.co.id/service', 'serviceimage/emYrI1dscPfJLK7I3p6J6E6MPcG6QVD66YsKz8Sy.jpeg', 'serviceimage/OAz5KCkxJL0M30FulkMAwkgU7Xx0iV0DwElIHAez.jpeg', 'serviceimage/4Q31j40hXllQ4VUTxpLY2aHJtCKUxuAC2LrrTMIj.jpeg', '2019-12-17 06:20:26', '2019-12-17 06:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(20) NOT NULL,
  `image` varchar(1000) NOT NULL DEFAULT 'user/default.png',
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `pass_raw` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `image`, `username`, `password`, `pass_raw`, `role`, `status`) VALUES
(10, 'user/Br1XNv8nzJt6hlk0Iq6fBpVWXLMIRg6uSSwuibxV.jpeg', 'mans', '$2y$10$O6hmFVKdYOYtEmjE2MZTIer7FTLrVHfJBwJM.6fu4P5byBUIB3EDe', '$2y$10$O6hmFVKdYOYtEmjE2MZTIer7FTLrVHfJBwJM.6fu4P5byBUIB3EDe', 'Customer', 'Active'),
(13, 'user/default.png', 'felix', '$2y$10$VG18oVVKuE5wv9zGHU.uGeZ5KUyRalce4rivYQlg18OtoYsYLB6a2', '12121', 'Customer', 'Inactive'),
(14, 'user/default.png', 'jfp', '$2y$10$WKweNWLRo6E1ytRKoRJY3.zVemR98U08L6UHpzV50BNtDtFED3XDW', '1212', 'Admin', 'Active'),
(15, 'user/default.png', 'juanf', '$2y$10$NdLvh8VWl9e8dkHcle7F/ucoIzGfoIhIE35jqUBrk7L6kSfDMSODK', '1212', 'Customer', 'Active'),
(19, 'user/default.png', 'vius', '$2y$10$R5.lRzeXDqiAa/Nj17ys.ONDcF.UWJVpDe6Q6SWk4VDEBgJTo9m1m', '1212', 'Guest', 'Active'),
(22, 'user/default.png', 'fetrg', '$2y$10$.cRQCYSdkXflqcugej0S/OAw/5ET8F9sVPN1n.Bvk8iOGU.8EKGNm', '1212', 'Customer', 'Active'),
(28, 'user/default.png', 'ferr', '$2y$10$Hye4xEFlYvhKpWu4CzEI9.uTndpybMCn7nN9iwnybZ12Re93uvtO2', '1212', 'Customer', 'Active'),
(29, 'user/default.png', 'feryy', '$2y$10$nAGWM0EPUWGscF9rptHtC.QdnrwLxowtT0O6IVhCGFy4Iy0GuDE7i', '1212', 'Customer', 'Active'),
(34, 'user/kGs9hRDj3gF5yBVj9MCGN6UFpI3vCSLlgwVyZtYp.jpeg', 'feryyyy', '$2y$10$LClVHOlg.PNw6s4rjS.M8Ovs4SJhtGEyPY7MET1Q9fBNHvAxSPSmy', '12121', 'Customer', 'Active'),
(37, 'user/default.png', 'ronald12', '$2y$10$CvEtKckufnT3yjW3f2NOt.WXHgqjTksBcudbh4LAgoXWwjkuvWt72', '1212', 'Customer', 'Active'),
(38, 'user/default.png', 'peng', '$2y$10$3aokdNbdAX/cFGuJffV.dupbS6xfu6jI7qlW5fsYod8S248JrKS2a', '1212', 'Customer', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `user_admin`
--

CREATE TABLE `user_admin` (
  `user_admin_id` int(100) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `position` varchar(100) NOT NULL,
  `division` varchar(100) NOT NULL,
  `not_read_msg` int(11) NOT NULL,
  `not_read_complaint` int(11) NOT NULL,
  `not_read_feedback` int(11) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_admin`
--

INSERT INTO `user_admin` (`user_admin_id`, `name`, `position`, `division`, `not_read_msg`, `not_read_complaint`, `not_read_feedback`, `user_id`) VALUES
(1, 'Juan', 'GM', 'Marketing', 0, 0, 4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `user_birthday_card`
--

CREATE TABLE `user_birthday_card` (
  `user_birthday_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `birthday_card_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_customer`
--

CREATE TABLE `user_customer` (
  `user_customer_id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(20) NOT NULL,
  `religion` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `customer_role` varchar(100) NOT NULL,
  `new_info` int(11) NOT NULL DEFAULT 0,
  `new` tinyint(1) NOT NULL DEFAULT 1,
  `company_id` int(50) NOT NULL,
  `user_id` int(100) NOT NULL DEFAULT -999
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_customer`
--

INSERT INTO `user_customer` (`user_customer_id`, `name`, `position`, `religion`, `birthday`, `email`, `customer_role`, `new_info`, `new`, `company_id`, `user_id`) VALUES
(13, 'manasye', 'GM', 'Islam', '1998-12-19', 'mans@gmail.com', 'Key Person', 0, 0, 1, 10),
(14, 'Juan Felix', 'GM', 'Kristen', '1998-12-12', 'jfpt@gmail.com', 'Key Person', 1, 1, 1, 13),
(15, 'Juan', 'GM', 'Islam', '1998-12-12', 'juanf@gmail.com', 'Key Person', 1, 1, 1, 15),
(18, 'Felix', 'Engineer', 'Islam', '1998-12-12', 'juanf@gmail.com', 'Tech', 0, 1, 8, 22),
(21, 'Ferry', 'Engineer', 'Islam', '1998-12-12', 'ferry@gmail.com', 'Tech', 2, 1, 8, 28),
(22, 'Ferry', 'Engineer', 'Islam', '1998-05-12', 'ferry@gmail.com', 'Tech', 2, 1, 8, 29),
(23, 'Ferry', 'Engineer', 'Kristen', '1998-12-12', 'ferry@gmail.com', 'Tech', 2, 1, 8, 34),
(26, 'Ronald12', 'Engineer', 'Islam', '1998-05-12', 'ron12@gmail.com', 'Tech', 2, 1, 8, 37),
(27, 'Peng', 'Engineer', 'Islam', '1998-05-12', 'peng@gmail.com', 'Tech', 2, 0, 8, 38);

-- --------------------------------------------------------

--
-- Table structure for table `user_guest`
--

CREATE TABLE `user_guest` (
  `user_guest_id` int(100) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `position` varchar(100) NOT NULL,
  `division` varchar(100) NOT NULL,
  `user_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_guest`
--

INSERT INTO `user_guest` (`user_guest_id`, `name`, `position`, `division`, `user_id`) VALUES
(1, 'Vius', 'GM', 'TO', 19);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`ads_id`);

--
-- Indexes for table `alliance`
--
ALTER TABLE `alliance`
  ADD PRIMARY KEY (`alliance_id`);

--
-- Indexes for table `birthday_card`
--
ALTER TABLE `birthday_card`
  ADD PRIMARY KEY (`birthday_card_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `company_ads`
--
ALTER TABLE `company_ads`
  ADD PRIMARY KEY (`company_ads_id`),
  ADD KEY `idx_ads` (`ads_id`),
  ADD KEY `idx_company` (`company_id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `idx_company` (`company_id`),
  ADD KEY `complaint_ibfk_2` (`user_id`);

--
-- Indexes for table `cp_company`
--
ALTER TABLE `cp_company`
  ADD PRIMARY KEY (`cp_company_id`);

--
-- Indexes for table `customer_type`
--
ALTER TABLE `customer_type`
  ADD PRIMARY KEY (`customer_type_id`);

--
-- Indexes for table `feedback_nonproject`
--
ALTER TABLE `feedback_nonproject`
  ADD PRIMARY KEY (`feedback_nonproject_id`),
  ADD KEY `user_id` (`user_customer_id`);

--
-- Indexes for table `feedback_project`
--
ALTER TABLE `feedback_project`
  ADD PRIMARY KEY (`feedback_project_id`),
  ADD KEY `idx_company` (`company_id`),
  ADD KEY `idx_service` (`service_id`),
  ADD KEY `idx_user_feedback` (`user_id`),
  ADD KEY `list_feedback_idx` (`list_feedback_project_id`);

--
-- Indexes for table `fleet_maint`
--
ALTER TABLE `fleet_maint`
  ADD PRIMARY KEY (`fleet_maint_id`);

--
-- Indexes for table `gmf_cp`
--
ALTER TABLE `gmf_cp`
  ADD PRIMARY KEY (`gmf_cp_id`);

--
-- Indexes for table `list_feedback_project`
--
ALTER TABLE `list_feedback_project`
  ADD PRIMARY KEY (`list_feedback_project_id`),
  ADD KEY `project_idx` (`project_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `user_id_message` (`user_id`),
  ADD KEY `rcvr_id_message` (`rcv_user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter`
--
ALTER TABLE `newsletter`
  ADD PRIMARY KEY (`newsletter_id`);

--
-- Indexes for table `past_marketing`
--
ALTER TABLE `past_marketing`
  ADD PRIMARY KEY (`past_marketing_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `company_id_project` (`company_id`);

--
-- Indexes for table `project_service`
--
ALTER TABLE `project_service`
  ADD PRIMARY KEY (`project_service_id`);

--
-- Indexes for table `religion_card`
--
ALTER TABLE `religion_card`
  ADD PRIMARY KEY (`religion_card_id`);

--
-- Indexes for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  ADD PRIMARY KEY (`reply_complaint_id`),
  ADD KEY `complaint_id_idx` (`complaint_id`),
  ADD KEY `sender_id_idx` (`user_id`);

--
-- Indexes for table `revenue`
--
ALTER TABLE `revenue`
  ADD PRIMARY KEY (`revenue_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD PRIMARY KEY (`user_admin_id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `user_birthday_card`
--
ALTER TABLE `user_birthday_card`
  ADD PRIMARY KEY (`user_birthday_id`),
  ADD KEY `birth_id_bu` (`birthday_card_id`),
  ADD KEY `user_id_bu` (`user_id`);

--
-- Indexes for table `user_customer`
--
ALTER TABLE `user_customer`
  ADD PRIMARY KEY (`user_customer_id`),
  ADD UNIQUE KEY `idx_user` (`user_id`) USING BTREE,
  ADD KEY `idx_company` (`company_id`);

--
-- Indexes for table `user_guest`
--
ALTER TABLE `user_guest`
  ADD PRIMARY KEY (`user_guest_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `ads_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `alliance`
--
ALTER TABLE `alliance`
  MODIFY `alliance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `birthday_card`
--
ALTER TABLE `birthday_card`
  MODIFY `birthday_card_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `company_ads`
--
ALTER TABLE `company_ads`
  MODIFY `company_ads_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaint_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cp_company`
--
ALTER TABLE `cp_company`
  MODIFY `cp_company_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_type`
--
ALTER TABLE `customer_type`
  MODIFY `customer_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback_nonproject`
--
ALTER TABLE `feedback_nonproject`
  MODIFY `feedback_nonproject_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `feedback_project`
--
ALTER TABLE `feedback_project`
  MODIFY `feedback_project_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `fleet_maint`
--
ALTER TABLE `fleet_maint`
  MODIFY `fleet_maint_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gmf_cp`
--
ALTER TABLE `gmf_cp`
  MODIFY `gmf_cp_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `list_feedback_project`
--
ALTER TABLE `list_feedback_project`
  MODIFY `list_feedback_project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `newsletter`
--
ALTER TABLE `newsletter`
  MODIFY `newsletter_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `past_marketing`
--
ALTER TABLE `past_marketing`
  MODIFY `past_marketing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `project_service`
--
ALTER TABLE `project_service`
  MODIFY `project_service_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religion_card`
--
ALTER TABLE `religion_card`
  MODIFY `religion_card_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  MODIFY `reply_complaint_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `revenue`
--
ALTER TABLE `revenue`
  MODIFY `revenue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user_admin`
--
ALTER TABLE `user_admin`
  MODIFY `user_admin_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_birthday_card`
--
ALTER TABLE `user_birthday_card`
  MODIFY `user_birthday_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_customer`
--
ALTER TABLE `user_customer`
  MODIFY `user_customer_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_guest`
--
ALTER TABLE `user_guest`
  MODIFY `user_guest_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company_ads`
--
ALTER TABLE `company_ads`
  ADD CONSTRAINT `company_ads_ibfk_1` FOREIGN KEY (`ads_id`) REFERENCES `ads` (`ads_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `company_ads_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback_nonproject`
--
ALTER TABLE `feedback_nonproject`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_customer_id`) REFERENCES `user_customer` (`user_customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback_project`
--
ALTER TABLE `feedback_project`
  ADD CONSTRAINT `idx_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `idx_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `idx_user_feedback` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `list_feedback_idx` FOREIGN KEY (`list_feedback_project_id`) REFERENCES `list_feedback_project` (`list_feedback_project_id`) ON DELETE CASCADE;

--
-- Constraints for table `list_feedback_project`
--
ALTER TABLE `list_feedback_project`
  ADD CONSTRAINT `project_idx` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `rcvr_id_message` FOREIGN KEY (`rcv_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_message` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `company_id_project` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE;

--
-- Constraints for table `reply_complaint`
--
ALTER TABLE `reply_complaint`
  ADD CONSTRAINT `complaint_id_idx` FOREIGN KEY (`complaint_id`) REFERENCES `complaint` (`complaint_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sender_id_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD CONSTRAINT `user_id_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_birthday_card`
--
ALTER TABLE `user_birthday_card`
  ADD CONSTRAINT `birth_id_bu` FOREIGN KEY (`birthday_card_id`) REFERENCES `birthday_card` (`birthday_card_id`),
  ADD CONSTRAINT `user_id_bu` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `user_customer`
--
ALTER TABLE `user_customer`
  ADD CONSTRAINT `user_customer_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_customer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_guest`
--
ALTER TABLE `user_guest`
  ADD CONSTRAINT `user_guest_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
