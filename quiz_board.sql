-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2013 at 04:42 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quiz_board`
--

-- --------------------------------------------------------

--
-- Table structure for table `qb_categories`
--

CREATE TABLE IF NOT EXISTS `qb_categories` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) NOT NULL,
  `c_status` smallint(1) NOT NULL DEFAULT '0',
  `users_group_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `qb_categories`
--

INSERT INTO `qb_categories` (`c_id`, `c_name`, `c_status`, `users_group_count`) VALUES
(1, 'Php', 1, 3),
(2, 'Jquery', 1, 2),
(3, 'Mysql', 1, 3),
(4, 'CSS', 1, 2),
(5, 'Html', 1, 3),
(7, 'php1', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qb_pages`
--

CREATE TABLE IF NOT EXISTS `qb_pages` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(255) NOT NULL,
  `p_desc` text NOT NULL,
  `p_added_date` datetime NOT NULL,
  `p_modified_date` datetime DEFAULT NULL,
  `p_status` smallint(1) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `qb_pages`
--

INSERT INTO `qb_pages` (`p_id`, `p_title`, `p_desc`, `p_added_date`, `p_modified_date`, `p_status`) VALUES
(1, 'abc', 'Test', '2013-07-16 18:08:42', '2013-07-16 19:16:23', 1),
(2, 'Test Page1', 'Test 123', '2013-07-16 18:09:00', '2013-07-16 18:09:00', 1),
(3, 'Our Literature', 'Test Test', '2013-07-16 18:10:20', '2013-07-16 18:10:20', 0),
(4, 'Test Page1', 'Yes Please1', '2013-07-16 18:10:56', '2013-07-16 18:15:20', 0),
(5, 'Contact Us', 'test', '2013-07-16 19:02:59', '2013-07-16 19:17:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qb_played_questions`
--

CREATE TABLE IF NOT EXISTS `qb_played_questions` (
  `pq_id` int(11) NOT NULL AUTO_INCREMENT,
  `pq_u_id` int(11) NOT NULL,
  `pq_q_id` int(11) NOT NULL,
  `pq_qa_id` int(11) NOT NULL,
  `pq_is_correct` tinyint(1) NOT NULL,
  `pq_added_date` datetime NOT NULL,
  PRIMARY KEY (`pq_id`),
  KEY `pq_u_id` (`pq_u_id`),
  KEY `pq_q_id` (`pq_q_id`),
  KEY `pq_qa_id` (`pq_qa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `qb_played_questions`
--

INSERT INTO `qb_played_questions` (`pq_id`, `pq_u_id`, `pq_q_id`, `pq_qa_id`, `pq_is_correct`, `pq_added_date`) VALUES
(1, 2, 9, 42, 0, '2013-08-24 15:30:56'),
(2, 2, 10, 48, 0, '2013-08-24 15:31:03'),
(3, 2, 12, 59, 1, '2013-08-24 15:31:10'),
(4, 2, 13, 64, 0, '2013-08-24 15:31:41'),
(5, 2, 14, 69, 1, '2013-08-24 15:31:47'),
(6, 23, 1, 2, 0, '2013-08-30 18:55:05'),
(7, 23, 4, 17, 1, '2013-08-30 18:55:11'),
(8, 23, 5, 22, 0, '2013-08-30 18:55:17'),
(9, 23, 6, 28, 1, '2013-08-30 20:02:04'),
(10, 23, 7, 32, 0, '2013-08-30 20:16:29'),
(11, 23, 8, 37, 0, '2013-08-30 20:16:35'),
(12, 23, 24, 117, 0, '2013-08-30 20:16:40'),
(13, 23, 18, 87, 0, '2013-08-30 20:21:32'),
(14, 23, 9, 43, 1, '2013-08-30 20:30:45'),
(15, 23, 10, 49, 1, '2013-08-30 20:31:55'),
(16, 23, 12, 59, 1, '2013-08-30 20:35:12'),
(17, 23, 13, 62, 1, '2013-08-30 20:37:32'),
(18, 23, 14, 69, 1, '2013-08-30 20:39:43'),
(19, 23, 15, 72, 1, '2013-08-30 20:40:16'),
(20, 23, 2, 8, 1, '2013-08-30 20:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `qb_questions`
--

CREATE TABLE IF NOT EXISTS `qb_questions` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_u_id` int(11) NOT NULL,
  `q_ug_id` int(11) NOT NULL,
  `q_tab_text` varchar(255) NOT NULL,
  `q_question` text NOT NULL,
  `q_added_date` datetime NOT NULL,
  `questions_answer_count` int(11) NOT NULL DEFAULT '0',
  `played_question_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`q_id`),
  KEY `q_u_id` (`q_u_id`),
  KEY `q_ug_id` (`q_ug_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `qb_questions`
--

INSERT INTO `qb_questions` (`q_id`, `q_u_id`, `q_ug_id`, `q_tab_text`, `q_question`, `q_added_date`, `questions_answer_count`, `played_question_count`) VALUES
(1, 2, 4, 'test', 'test', '2013-07-21 20:59:48', 5, 1),
(2, 3, 3, 'variable', 'What is variable?', '2013-07-22 18:47:10', 5, 1),
(4, 2, 4, 'test12 tab text', 'test12', '2013-07-22 19:30:54', 5, 1),
(5, 2, 4, 'test1234 tab text', 'test1234', '2013-07-22 19:31:36', 5, 1),
(6, 2, 6, 'Test 123456 tab text', 'Test 123456', '2013-07-26 08:34:49', 5, 1),
(7, 9, 10, 'test test 12345 tab text', 'test test 12345', '2013-07-31 13:03:26', 5, 1),
(8, 9, 10, 'Question-2 tab text', 'Question-2', '2013-07-31 13:37:54', 5, 1),
(9, 4, 11, 'Count', 'What is Count?', '2013-07-31 14:48:12', 5, 2),
(10, 4, 11, 'Sum', 'Sum', '2013-07-31 14:50:31', 5, 2),
(12, 4, 11, 'test', 'test', '2013-07-31 15:16:45', 5, 2),
(13, 4, 11, 'dfsgdfsfd tab text', 'dfsgdfsfd', '2013-07-31 15:52:46', 5, 2),
(14, 4, 11, 'dfggfgfdgf tab text', 'dfggfgfdgf', '2013-07-31 15:53:07', 5, 2),
(15, 4, 11, '121212121 tab text', '121212121', '2013-07-31 15:53:32', 5, 1),
(16, 4, 12, 'span', 'what is span', '2013-08-03 10:44:44', 5, 0),
(17, 4, 13, 'div', 'what is div', '2013-08-03 11:46:40', 5, 0),
(18, 4, 14, 'bind', 'what is bind', '2013-08-03 12:47:52', 5, 1),
(19, 9, 15, 'Select Query', 'How can we write select query?', '2013-08-15 20:02:13', 5, 0),
(20, 9, 15, 'Insert Query', 'How can we write insert query?', '2013-08-15 20:02:58', 5, 0),
(21, 9, 15, 'Update Query', 'How can we write update query?', '2013-08-15 20:03:26', 5, 0),
(22, 9, 15, 'Delete Query', 'How can we write delete query?', '2013-08-15 20:03:53', 5, 0),
(23, 9, 15, 'Sub Query', 'How can we write sub-query?', '2013-08-15 20:24:44', 5, 0),
(24, 9, 10, 'Marque Direction', 'In which direction we can move marque?', '2013-08-15 20:37:27', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qb_questions_answers`
--

CREATE TABLE IF NOT EXISTS `qb_questions_answers` (
  `qa_id` int(11) NOT NULL AUTO_INCREMENT,
  `qa_q_id` int(11) NOT NULL,
  `qa_answer` text NOT NULL,
  `qa_is_correct` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qa_id`),
  KEY `qa_q_id` (`qa_q_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `qb_questions_answers`
--

INSERT INTO `qb_questions_answers` (`qa_id`, `qa_q_id`, `qa_answer`, `qa_is_correct`) VALUES
(1, 1, 'a', 0),
(2, 1, 'b', 0),
(3, 1, 'c', 1),
(4, 1, 'd', 0),
(5, 1, 'e', 0),
(6, 2, 'AA', 0),
(7, 2, 'BB', 0),
(8, 2, 'CC', 1),
(9, 2, 'DD', 0),
(10, 2, 'EE', 0),
(16, 4, 'AA', 0),
(17, 4, 'BB', 1),
(18, 4, 'CC', 0),
(19, 4, 'DD', 0),
(20, 4, 'EE', 0),
(21, 5, 'AA', 1),
(22, 5, 'BB', 0),
(23, 5, 'CC', 0),
(24, 5, 'DD', 0),
(25, 5, 'EE', 0),
(26, 6, 'a', 0),
(27, 6, 'b', 0),
(28, 6, 'c', 1),
(29, 6, 'd', 0),
(30, 6, 'e', 0),
(31, 7, 'aa', 0),
(32, 7, 'bb', 0),
(33, 7, 'cc', 0),
(34, 7, 'dd', 1),
(35, 7, 'ee', 0),
(36, 8, '1', 0),
(37, 8, '2', 0),
(38, 8, '3', 0),
(39, 8, '4', 1),
(40, 8, '5', 0),
(41, 9, 'Count-1', 0),
(42, 9, 'Count-2', 0),
(43, 9, 'Count-3', 1),
(44, 9, 'Count-4', 0),
(45, 9, 'Count-5', 0),
(46, 10, 'sum-1', 0),
(47, 10, 'sum-2', 0),
(48, 10, 'sum-3', 0),
(49, 10, 'sum-4', 1),
(50, 10, 'sum-5', 0),
(56, 12, '1', 0),
(57, 12, '2', 0),
(58, 12, '3', 0),
(59, 12, '4', 1),
(60, 12, '5', 0),
(61, 13, '1', 0),
(62, 13, '2', 1),
(63, 13, '3', 0),
(64, 13, '4', 0),
(65, 13, '5', 0),
(66, 14, '1', 0),
(67, 14, '2', 0),
(68, 14, '3', 0),
(69, 14, '4', 1),
(70, 14, '5', 0),
(71, 15, 'a', 0),
(72, 15, 'b', 1),
(73, 15, 'c', 0),
(74, 15, 'd', 0),
(75, 15, 'e', 0),
(76, 16, 'a', 0),
(77, 16, 'b', 0),
(78, 16, 'c', 0),
(79, 16, 'd', 1),
(80, 16, 'e', 0),
(81, 17, 'a', 0),
(82, 17, 'b', 0),
(83, 17, 'c', 0),
(84, 17, 'd', 1),
(85, 17, 'e', 0),
(86, 18, 'a', 0),
(87, 18, 'b', 0),
(88, 18, 'c', 0),
(89, 18, 'd', 1),
(90, 18, 'e', 0),
(91, 19, 'A', 0),
(92, 19, 'B', 0),
(93, 19, 'C', 1),
(94, 19, 'D', 0),
(95, 19, 'E', 0),
(96, 20, 'A', 0),
(97, 20, 'B', 1),
(98, 20, 'C', 0),
(99, 20, 'D', 0),
(100, 20, 'E', 0),
(101, 21, 'A', 0),
(102, 21, 'B', 0),
(103, 21, 'C', 0),
(104, 21, 'D', 1),
(105, 21, 'E', 0),
(106, 22, 'A', 0),
(107, 22, 'B', 0),
(108, 22, 'C', 0),
(109, 22, 'D', 0),
(110, 22, 'E', 1),
(111, 23, 'A', 0),
(112, 23, 'B', 0),
(113, 23, 'C', 1),
(114, 23, 'D', 0),
(115, 23, 'E', 0),
(116, 24, 'Left', 0),
(117, 24, 'Right', 0),
(118, 24, 'Top', 0),
(119, 24, 'Bottom', 0),
(120, 24, 'All Sides', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qb_users`
--

CREATE TABLE IF NOT EXISTS `qb_users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_type` smallint(1) NOT NULL DEFAULT '2',
  `u_name` varchar(255) NOT NULL,
  `u_username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `u_profile_image` varchar(255) DEFAULT NULL,
  `u_account_activation_code` varchar(32) DEFAULT NULL,
  `u_forgot_password_code` varchar(32) DEFAULT NULL,
  `u_added_date` datetime NOT NULL,
  `u_last_login_date` datetime DEFAULT NULL,
  `played_question_correct_count` int(11) DEFAULT NULL COMMENT 'Total correct played questions',
  `played_question_wrong_count` int(11) DEFAULT NULL COMMENT 'Total wrong played questions',
  `u_status` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `qb_users`
--

INSERT INTO `qb_users` (`u_id`, `u_type`, `u_name`, `u_username`, `email`, `password`, `u_profile_image`, `u_account_activation_code`, `u_forgot_password_code`, `u_added_date`, `u_last_login_date`, `played_question_correct_count`, `played_question_wrong_count`, `u_status`) VALUES
(1, 1, 'Administrator', 'administrator', 'admin@admin.com', '73b21fd9b1810896592b525eae02b793379a72e6', 'aa5124534e.jpg', NULL, '', '2013-07-16 22:01:06', '2013-08-12 21:40:57', NULL, NULL, 1),
(2, 2, 'kamlesh', 'kamlesh', 'kamlesh@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', '72dcd1f650.jpg', NULL, '', '2013-07-16 22:01:06', '2013-08-25 11:29:03', 2, 3, 1),
(3, 2, 'Rahul', 'rahul', 'rahul@gmail.com', '73b21fd9b1810896592b525eae02b793379a72e6', '37ae78ae98.jpg', NULL, NULL, '2013-07-16 22:01:06', NULL, NULL, NULL, 1),
(4, 2, 'mayank', 'mayank', 'mayank@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', '4848cd41b0.jpg', '21c44f09685ef7aabb99f9bc18632dfc', '', '2013-07-26 15:39:33', '2013-08-15 09:02:47', NULL, NULL, 1),
(5, 2, 'amit', 'amit', 'amit@gmail.com', '73b21fd9b1810896592b525eae02b793379a72e6', '21328de4fc.jpg', '80c336874f13f330d6367087d668c270', '', '2013-07-26 15:43:27', NULL, NULL, NULL, 0),
(6, 2, 'amit1', 'amit1', 'amit1@gmail.com', '73b21fd9b1810896592b525eae02b793379a72e6', NULL, '88f9067d5d7aa9a122efcefdc3cfd85d', NULL, '2013-07-26 15:48:08', NULL, NULL, NULL, 0),
(7, 2, 'jayant', 'jayant', 'jayant@gmail.com', '73b21fd9b1810896592b525eae02b793379a72e6', '9085183a17.jpg', '0377f078309990a8b50ccd05ddff80d9', NULL, '2013-07-26 15:55:57', NULL, NULL, NULL, 0),
(8, 2, 'pintu', 'pintu', 'pintu@gmail.com', '73b21fd9b1810896592b525eae02b793379a72e6', '66857247dd.jpg', '', NULL, '2013-07-26 16:01:39', NULL, NULL, NULL, 1),
(9, 2, 'amit2', 'amit2', 'amit2@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', 'a2e2acfa10.jpg', '', '', '2013-07-26 17:07:59', '2013-08-15 19:56:35', NULL, NULL, 1),
(10, 2, 'charlie', 'charlie', 'charlie@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', 'cb600f1166.jpg', '', NULL, '2013-07-27 10:37:37', '2013-07-27 10:43:34', NULL, NULL, 1),
(11, 2, 'user', 'user', 'user@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', '31d99313a7.jpg', '', NULL, '2013-08-03 09:19:25', '2013-08-03 09:20:40', NULL, NULL, 1),
(12, 2, 'jitendra', '', 'jitendra@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', '314fac32cb.jpg', '', NULL, '2013-08-18 08:35:09', '2013-08-18 08:35:50', NULL, NULL, 1),
(13, 2, 'mika', '', 'mika@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', 'c52e8d8daa.jpg', '', NULL, '2013-08-18 14:57:38', '2013-08-18 14:58:09', NULL, NULL, 1),
(14, 2, 'mouse', '', 'mouse@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', '6051fc000f.jpg', '9436e005a30658193127ce0b02a81839', NULL, '2013-08-18 15:06:28', NULL, NULL, NULL, 0),
(15, 2, 'chintu', '', 'chintu@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', '91fd764091.jpg', '', NULL, '2013-08-24 08:02:18', '2013-08-24 08:03:16', NULL, NULL, 1),
(16, 2, 'chichi', '', 'chichi@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-24 09:00:04', '2013-08-24 09:00:20', NULL, NULL, 1),
(17, 2, 'pradeep', '', 'pradeep@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-24 12:00:15', '2013-08-24 12:03:05', NULL, NULL, 1),
(18, 2, 'mintuki', 'mintukigmailcom_97277', 'mintuki@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-24 12:31:29', NULL, NULL, NULL, 1),
(19, 2, 'mintuki', 'mintuki2gmailcomfa6e2e', 'mintuki2@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-24 12:42:39', NULL, NULL, NULL, 1),
(20, 2, 'mintuki3', 'mintuki3gmailcom938c76', 'mintuki3@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-24 12:48:42', NULL, NULL, NULL, 1),
(21, 2, 'peepa', 'peepagmailcoma4b2ef', 'peepa@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, 'd5fa725373c649cec0a0f060b2ecc3fc', NULL, '2013-08-30 19:09:58', NULL, NULL, NULL, 0),
(22, 2, 'peepa1', 'peepa1gmailcome18491', 'peepa1@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, 'f29e8eef9cd1f882cb5835fba83f8533', NULL, '2013-08-30 19:10:43', NULL, NULL, NULL, 0),
(23, 2, 'peepa2', 'peepa2gmailcom099ba1', 'peepa2@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-30 19:13:09', '2013-08-30 19:14:46', 9, 6, 1),
(24, 2, 'matru', 'matrugmailcom648e47', 'matru@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-30 22:44:56', '2013-08-30 22:45:19', NULL, NULL, 1),
(25, 2, 'fizz', 'fizzgmailcom4a5d66', 'fizz@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-30 22:46:42', '2013-08-30 22:47:00', NULL, NULL, 1),
(26, 2, 'jaykant', 'jaykantgmailcom01e390', 'jaykant@gmail.com', '0f29bb65254b17e83c29111684a5a7e2e43d567f', NULL, '', NULL, '2013-08-30 22:48:30', '2013-08-30 22:48:49', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qb_users_groups`
--

CREATE TABLE IF NOT EXISTS `qb_users_groups` (
  `ug_id` int(11) NOT NULL AUTO_INCREMENT,
  `ug_u_id` int(11) NOT NULL,
  `ug_c_id` int(11) NOT NULL,
  `ug_group_name` varchar(255) NOT NULL,
  `question_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ug_id`),
  KEY `ug_u_id` (`ug_u_id`),
  KEY `ug_c_id` (`ug_c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `qb_users_groups`
--

INSERT INTO `qb_users_groups` (`ug_id`, `ug_u_id`, `ug_c_id`, `ug_group_name`, `question_count`) VALUES
(1, 3, 1, 'Session', 0),
(2, 3, 1, 'Cookies', 0),
(3, 3, 1, 'Variables', 1),
(4, 2, 4, 'CSS2', 3),
(6, 2, 4, 'CSS3', 1),
(7, 3, 3, 'Joins', 0),
(8, 2, 2, 'find', 0),
(10, 9, 5, 'Marquee', 3),
(11, 4, 3, 'Aggregate Functions', 6),
(12, 4, 5, 'span', 1),
(13, 4, 5, 'div', 1),
(14, 4, 2, 'functions', 1),
(15, 9, 3, 'Query', 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qb_played_questions`
--
ALTER TABLE `qb_played_questions`
  ADD CONSTRAINT `qb_played_questions_ibfk_1` FOREIGN KEY (`pq_u_id`) REFERENCES `qb_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qb_played_questions_ibfk_2` FOREIGN KEY (`pq_q_id`) REFERENCES `qb_questions` (`q_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qb_played_questions_ibfk_3` FOREIGN KEY (`pq_qa_id`) REFERENCES `qb_questions_answers` (`qa_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qb_questions`
--
ALTER TABLE `qb_questions`
  ADD CONSTRAINT `qb_questions_ibfk_1` FOREIGN KEY (`q_u_id`) REFERENCES `qb_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qb_questions_ibfk_2` FOREIGN KEY (`q_ug_id`) REFERENCES `qb_users_groups` (`ug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qb_questions_answers`
--
ALTER TABLE `qb_questions_answers`
  ADD CONSTRAINT `qb_questions_answers_ibfk_1` FOREIGN KEY (`qa_q_id`) REFERENCES `qb_questions` (`q_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `qb_users_groups`
--
ALTER TABLE `qb_users_groups`
  ADD CONSTRAINT `qb_users_groups_ibfk_1` FOREIGN KEY (`ug_u_id`) REFERENCES `qb_users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qb_users_groups_ibfk_2` FOREIGN KEY (`ug_c_id`) REFERENCES `qb_categories` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
