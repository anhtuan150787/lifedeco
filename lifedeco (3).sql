-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2018 at 08:50 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lifedeco`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `acl_id` smallint(6) NOT NULL,
  `acl_module` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_controller` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_action` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_status` tinyint(4) NOT NULL,
  `acl_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `acl_parent` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`acl_id`, `acl_module`, `acl_controller`, `acl_action`, `acl_status`, `acl_name`, `acl_parent`) VALUES
(1, 'admin', 'index', 'index', 1, 'Trang chủ', 0),
(7, '', '', '', 1, 'Nhóm quản trị', 0),
(8, 'admin', 'groupuser', 'index', 1, 'Danh sách', 7),
(9, 'admin', 'groupuser', 'add', 1, 'Thêm', 7),
(10, 'admin', 'groupuser', 'edit', 1, 'Cập nhật', 7),
(11, 'admin', 'groupuser', 'delete', 1, 'Xóa', 7),
(12, '', '', '', 1, 'Tài khoản quản trị', 0),
(13, 'admin', 'user', 'index', 1, 'Danh sách', 12),
(14, 'admin', 'user', 'add', 1, 'Thêm', 12),
(15, 'admin', 'user', 'delete', 1, 'Xóa', 12),
(16, 'admin', 'user', 'edit', 1, 'Cập nhật', 12),
(17, '', '', '', 1, 'Menu CMS', 0),
(18, 'admin', 'menu', 'index', 1, 'Danh sách', 17),
(19, 'admin', 'menu', 'add', 1, 'Thêm', 17),
(20, 'admin', 'menu', 'delete', 1, 'Xóa', 17),
(21, 'admin', 'menu', 'edit', 1, 'Cập nhật', 17),
(22, '', '', '', 1, 'Quyền', 0),
(23, 'admin', 'acl', 'index', 1, 'Danh sách', 22),
(24, 'admin', 'acl', 'add', 1, 'Thêm', 22),
(25, 'admin', 'acl', 'delete', 1, 'Xóa', 22),
(26, 'admin', 'acl', 'edit', 1, 'Cập nhật', 22),
(35, 'admin', 'groupuser', 'acl', 1, 'Phân quyền', 7),
(36, '', '', '', 1, 'Menu', 0),
(37, 'admin', 'groupnavigation', 'index', 1, 'Danh sách', 36),
(38, 'admin', 'groupnavigation', 'add', 1, 'Thêm', 36),
(39, 'admin', 'groupnavigation', 'delete', 1, 'Xóa', 36),
(40, 'admin', 'groupnavigation', 'edit', 1, 'Cập nhật', 36),
(124, '', '', '', 1, 'Cấu hình chung Website', 0),
(125, 'admin', 'websitegeneral', 'edit', 1, 'Cập nhật', 124),
(126, 'admin', 'websitegeneral', 'delete-picture', 1, 'Xóa Favicon', 124),
(127, 'admin', 'user', 'delete-picture', 1, 'Xóa hình đại diện', 12),
(128, '', '', '', 1, 'Cấu hình gửi Email', 0),
(129, 'admin', 'websiteemail', 'edit', 1, 'Cập nhật', 128),
(130, '', '', '', 1, 'API', 0),
(131, 'admin', 'api', 'sendmail', 1, 'Gửi email', 130),
(132, '', '', '', 1, 'Bài viết', 0),
(133, 'admin', 'post', 'index', 1, 'Danh sách', 132),
(134, 'admin', 'post', 'add', 1, 'Thêm', 132),
(135, 'admin', 'post', 'edit', 1, 'Cập nhật', 132),
(136, 'admin', 'post', 'delete', 1, 'Xóa', 132),
(137, 'admin', 'post', 'delete-picture', 1, 'Xóa hình đại diện', 132),
(138, '', '', '', 1, 'Danh mục bài viết', 0),
(139, 'admin', 'postcategory', 'index', 1, 'Danh sách', 138),
(140, 'admin', 'postcategory', 'add', 1, 'Thêm', 138),
(141, 'admin', 'postcategory', 'delete', 1, 'Xóa', 138),
(142, 'admin', 'postcategory', 'edit', 1, 'Cập nhật', 138),
(143, '', '', '', 1, 'Thông báo', 0),
(144, 'admin', 'message', 'index', 1, 'Hiển thị', 143),
(145, '', '', '', 1, 'Liên kết', 0),
(146, 'admin', 'navigation', 'index', 1, 'Danh sách', 145),
(147, 'admin', 'navigation', 'add', 1, 'Thêm', 145),
(148, 'admin', 'navigation', 'delete', 1, 'Xóa', 145),
(149, '', '', '', 1, 'Nội dung trang', 0),
(150, 'admin', 'page', 'index', 1, 'Danh sách', 149),
(151, 'admin', 'page', 'add', 1, 'Thêm', 149),
(152, 'admin', 'page', 'edit', 1, 'Cập nhật', 149),
(153, 'admin', 'page', 'delete', 1, 'Xóa', 149),
(154, '', '', '', 1, 'Giao diện', 0),
(155, 'admin', 'grouptemplate', 'index', 1, 'Danh sách', 154),
(156, 'admin', 'grouptemplate', 'edit', 1, 'Cập nhật', 154),
(157, 'admin', 'grouptemplate', 'add', 1, 'Thêm', 154),
(158, 'admin', 'grouptemplate', 'delete', 1, 'Xóa', 154),
(159, '', '', '', 1, 'Tùy chỉnh giao diện', 0),
(160, 'admin', 'template', 'picture', 1, 'Cập nhật loại hình ảnh', 159),
(161, 'admin', 'template', 'index', 1, 'Danh sách', 159),
(162, 'admin', 'template', 'content', 1, 'Cập nhật loại Nội dung', 159),
(163, 'admin', 'template', 'slide', 1, 'Cập nhật loại Slide banner', 159),
(166, '', '', '', 1, 'Sản phẩm', 0),
(167, 'admin', 'product', 'index', 1, 'Danh sách', 166),
(168, 'admin', 'product', 'add', 1, 'Thêm', 166),
(169, 'admin', 'product', 'delete', 1, 'Xóa', 166),
(170, 'admin', 'product', 'edit', 1, 'Cập nhật', 166),
(171, '', '', '', 1, 'Danh mục sản phẩm', 0),
(172, 'admin', 'productcategory', 'index', 1, 'Danh sách', 171),
(173, 'admin', 'productcategory', 'add', 1, 'Thêm', 171),
(174, 'admin', 'productcategory', 'delete', 1, 'Xóa', 171),
(175, 'admin', 'productcategory', 'edit', 1, 'Cập nhật', 171),
(176, 'admin', 'product', 'delete-picture', 1, ' Xóa hình đại diện', 166),
(190, '', '', '', 1, 'Liên hệ khách hàng', 0),
(191, 'admin', 'contact', 'index', 1, 'Danh sách', 190),
(192, 'admin', 'contact', 'edit', 1, 'Xem chi tiết', 190),
(193, 'admin', 'product', 'delete-picture-multi', 1, 'Xóa hình Slide', 166),
(194, 'admin', 'productcategory', 'delete-picture', 1, 'Xóa hình', 171);

--
-- Triggers `acl`
--
DELIMITER $$
CREATE TRIGGER `AFTER_DELETE_ACL` AFTER DELETE ON `acl` FOR EACH ROW BEGIN
	DELETE FROM group_acl WHERE acl_id = OLD.acl_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `contact_fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` int(11) NOT NULL,
  `contact_content` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `contact_date` datetime NOT NULL,
  `contact_viewed` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_fullname`, `contact_email`, `contact_phone`, `contact_content`, `contact_date`, `contact_viewed`) VALUES
(11, 'Anh Tuấn', 'anhtuan150787@gmail.com', 944518855, 'Website rõ ràng, tinh tế, hình ảnh đẹp', '2018-01-03 00:00:00', 1),
(12, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'Test Gửi email Website', '2018-01-15 14:28:38', NULL),
(13, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'Test Gửi email Website', '2018-01-15 14:30:38', NULL),
(14, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'Test Gửi email Website', '2018-01-15 14:33:37', NULL),
(15, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'Test Gửi email Website', '2018-01-15 14:34:41', NULL),
(16, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'test', '2018-01-15 14:40:00', NULL),
(17, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'test', '2018-01-15 14:40:17', NULL),
(18, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'test', '2018-01-15 14:42:12', NULL),
(19, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'sd', '2018-01-15 14:43:36', NULL),
(20, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'asd', '2018-01-15 14:44:05', NULL),
(21, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'dfg', '2018-01-15 14:44:32', NULL),
(22, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'dfg', '2018-01-15 14:49:38', NULL),
(23, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'sdsd', '2018-01-15 14:52:48', NULL),
(24, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'sdsd', '2018-01-15 14:55:55', NULL),
(25, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'sdsd', '2018-01-15 14:56:16', NULL),
(26, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'sdsd', '2018-01-15 14:57:11', NULL),
(27, 'Anh Tuấn', 'test@yahoo.com', 944112211, 'sd', '2018-01-15 15:03:24', NULL),
(28, 'test', 'test@yahoo.com', 944112211, 'test ', '2018-01-15 22:01:05', NULL),
(29, 'Test', 'test@yahoo.com', 944112211, 'test', '2018-02-19 14:00:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_acl`
--

CREATE TABLE `group_acl` (
  `group_acl_id` smallint(6) NOT NULL,
  `acl_id` smallint(6) NOT NULL,
  `group_users_id` smallint(6) NOT NULL,
  `group_acl_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_acl`
--

INSERT INTO `group_acl` (`group_acl_id`, `acl_id`, `group_users_id`, `group_acl_status`) VALUES
(9394, 1, 1, 1),
(9395, 7, 1, 1),
(9396, 8, 1, 1),
(9397, 9, 1, 1),
(9398, 10, 1, 1),
(9399, 11, 1, 1),
(9400, 35, 1, 1),
(9401, 12, 1, 1),
(9402, 13, 1, 1),
(9403, 14, 1, 1),
(9404, 15, 1, 1),
(9405, 16, 1, 1),
(9406, 127, 1, 1),
(9407, 17, 1, 1),
(9408, 18, 1, 1),
(9409, 19, 1, 1),
(9410, 20, 1, 1),
(9411, 21, 1, 1),
(9412, 22, 1, 1),
(9413, 23, 1, 1),
(9414, 24, 1, 1),
(9415, 25, 1, 1),
(9416, 26, 1, 1),
(9417, 36, 1, 1),
(9418, 37, 1, 1),
(9419, 38, 1, 1),
(9420, 39, 1, 1),
(9421, 40, 1, 1),
(9422, 124, 1, 1),
(9423, 125, 1, 1),
(9424, 126, 1, 1),
(9425, 128, 1, 1),
(9426, 129, 1, 1),
(9427, 130, 1, 1),
(9428, 131, 1, 1),
(9429, 132, 1, 1),
(9430, 133, 1, 1),
(9431, 134, 1, 1),
(9432, 135, 1, 1),
(9433, 136, 1, 1),
(9434, 137, 1, 1),
(9435, 138, 1, 1),
(9436, 139, 1, 1),
(9437, 140, 1, 1),
(9438, 141, 1, 1),
(9439, 142, 1, 1),
(9440, 143, 1, 1),
(9441, 144, 1, 1),
(9442, 145, 1, 1),
(9443, 146, 1, 1),
(9444, 147, 1, 1),
(9445, 148, 1, 1),
(9446, 149, 1, 1),
(9447, 150, 1, 1),
(9448, 151, 1, 1),
(9449, 152, 1, 1),
(9450, 153, 1, 1),
(9451, 154, 1, 1),
(9452, 155, 1, 1),
(9453, 156, 1, 1),
(9454, 157, 1, 1),
(9455, 158, 1, 1),
(9456, 159, 1, 1),
(9457, 160, 1, 1),
(9458, 161, 1, 1),
(9459, 162, 1, 1),
(9460, 163, 1, 1),
(9461, 166, 1, 1),
(9462, 167, 1, 1),
(9463, 168, 1, 1),
(9464, 169, 1, 1),
(9465, 170, 1, 1),
(9466, 171, 1, 1),
(9467, 172, 1, 1),
(9468, 173, 1, 1),
(9469, 174, 1, 1),
(9470, 175, 1, 1),
(9471, 176, 1, 1),
(9485, 190, 1, 1),
(9486, 191, 1, 1),
(9487, 192, 1, 1),
(9488, 193, 1, 1),
(9489, 194, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_menu`
--

CREATE TABLE `group_menu` (
  `group_menu_id` smallint(6) NOT NULL,
  `group_users_id` smallint(6) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  `group_menu_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_menu`
--

INSERT INTO `group_menu` (`group_menu_id`, `group_users_id`, `menu_id`, `group_menu_status`) VALUES
(3942, 1, 3, 1),
(3943, 1, 4, 1),
(3944, 1, 16, 1),
(3945, 1, 17, 1),
(3946, 1, 18, 1),
(3947, 1, 19, 1),
(3948, 1, 20, 1),
(3949, 1, 21, 1),
(3950, 1, 22, 1),
(3951, 1, 5, 1),
(3952, 1, 6, 1),
(3953, 1, 7, 1),
(3954, 1, 8, 1),
(3955, 1, 9, 1),
(3956, 1, 10, 1),
(3957, 1, 11, 1),
(3958, 1, 12, 1),
(3959, 1, 13, 1),
(3960, 1, 14, 1),
(3961, 1, 15, 1),
(3962, 1, 25, 0),
(3963, 1, 26, 0),
(3964, 1, 27, 1),
(3965, 1, 28, 1),
(3966, 1, 29, 1),
(3967, 1, 30, 0),
(3968, 1, 31, 1),
(3969, 1, 32, 1),
(3971, 1, 34, 1),
(3975, 1, 38, 1),
(3976, 1, 39, 1),
(3977, 1, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_navigation`
--

CREATE TABLE `group_navigation` (
  `group_navigation_id` tinyint(4) NOT NULL,
  `group_navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_navigation_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_navigation`
--

INSERT INTO `group_navigation` (`group_navigation_id`, `group_navigation_name`, `group_navigation_status`) VALUES
(5, 'Menu top', 1);

--
-- Triggers `group_navigation`
--
DELIMITER $$
CREATE TRIGGER `AFTER_DELETE_GROUP_NAVIGATION` AFTER DELETE ON `group_navigation` FOR EACH ROW BEGIN
	DELETE FROM navigation WHERE group_navigation_id = OLD.group_navigation_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `group_property`
--

CREATE TABLE `group_property` (
  `group_property_id` smallint(6) NOT NULL,
  `group_property_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_property_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_property`
--

INSERT INTO `group_property` (`group_property_id`, `group_property_name`, `group_property_status`) VALUES
(1, 'Sản phẩm điện thoại', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_property_detail`
--

CREATE TABLE `group_property_detail` (
  `group_property_detail_id` bigint(20) NOT NULL,
  `group_property_id` smallint(6) NOT NULL,
  `property_id` smallint(6) NOT NULL,
  `group_property_detail_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_property_detail`
--

INSERT INTO `group_property_detail` (`group_property_detail_id`, `group_property_id`, `property_id`, `group_property_detail_status`) VALUES
(1, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_template`
--

CREATE TABLE `group_template` (
  `group_template_id` tinyint(4) NOT NULL,
  `group_template_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_template_type` tinyint(4) NOT NULL,
  `group_template_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_template`
--

INSERT INTO `group_template` (`group_template_id`, `group_template_name`, `group_template_type`, `group_template_status`) VALUES
(1, 'Logo', 1, 1),
(2, 'Liên hệ', 2, 1),
(3, 'Slide banner', 3, 1),
(4, 'Test', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_users`
--

CREATE TABLE `group_users` (
  `group_users_id` smallint(6) NOT NULL,
  `group_users_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_users_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_users`
--

INSERT INTO `group_users` (`group_users_id`, `group_users_name`, `group_users_status`) VALUES
(1, 'Admin', 1);

--
-- Triggers `group_users`
--
DELIMITER $$
CREATE TRIGGER `AFTER_DELETE_GROUP_USER` AFTER DELETE ON `group_users` FOR EACH ROW BEGIN
	DELETE FROM group_acl WHERE group_users_id = OLD.group_users_id;
	DELETE FROM group_menu WHERE group_users_id = OLD.group_users_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` smallint(6) NOT NULL,
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `menu_parent` smallint(6) DEFAULT '0',
  `menu_status` tinyint(4) NOT NULL,
  `menu_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_icon` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `menu_position` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_parent`, `menu_status`, `menu_url`, `menu_icon`, `menu_position`) VALUES
(3, 'Chức năng', 0, 1, '', '', 0),
(4, 'Trang chủ', 3, 1, 'admin', 'fa fa-home', 1),
(5, 'Hệ thống', 0, 1, '', '', 0),
(6, 'Menu', 5, 1, '', 'fa fa-sitemap', 0),
(7, 'Danh sách', 6, 1, 'admin/menu/index', '', 0),
(8, 'Thêm mới', 6, 1, 'admin/menu/add', '', 0),
(9, 'Quyền', 5, 1, '', 'fa fa-lock', 0),
(10, 'Danh sách', 9, 1, 'admin/acl/index', '', 0),
(11, 'Thêm mới', 9, 1, 'admin/acl/add', '', 0),
(12, 'User', 5, 1, '', 'fa fa-user', 0),
(13, 'Danh sách', 12, 1, 'admin/user/index', '', 0),
(14, 'Thêm mới', 12, 1, 'admin/user/add', '', 0),
(15, 'Nhóm', 12, 1, 'admin/group-user/index', '', 0),
(16, 'Cấu hình Website', 3, 1, '', 'fa fa-gear', 6),
(17, 'Cấu hình chung', 16, 1, 'admin/website-general/edit', '', 0),
(18, 'Email', 16, 1, 'admin/website-email/edit', '', 0),
(19, 'Bài viết', 3, 1, '', 'fa fa-files-o', 3),
(20, 'Danh sách', 19, 1, 'admin/post/index', '', 0),
(21, 'Thêm mới', 19, 1, 'admin/post/add', '', 0),
(22, 'Danh mục', 19, 1, 'admin/post-category/index', '', 0),
(25, 'Giao diện', 3, 1, '', 'fa fa-desktop', 5),
(26, 'Menu', 25, 1, 'admin/group-navigation', '', 0),
(27, 'Nội dung trang', 3, 1, '', 'fa fa-file-o', 4),
(28, 'Danh sách', 27, 1, 'admin/page', '', 0),
(29, 'Thêm mới', 27, 1, 'admin/page/add', '', 0),
(30, 'Tùy chỉnh', 25, 1, 'admin/group-template', '', 0),
(31, 'Dự án', 3, 1, '', 'fa fa-cubes', 6),
(32, 'Danh sách', 31, 1, 'admin/product/index', '', 1),
(34, 'Danh mục', 31, 1, 'admin/product-category/index', '', 3),
(38, 'Khách hàng', 3, 1, '', 'fa fa-users', 7),
(39, 'Liên hệ', 38, 1, 'admin/contact/index', '', 1),
(40, 'Thêm mới', 31, 1, 'admin/product/add', '', 3);

--
-- Triggers `menu`
--
DELIMITER $$
CREATE TRIGGER `AFTER_DELETE_MENU` AFTER DELETE ON `menu` FOR EACH ROW BEGIN
	DELETE FROM group_menu WHERE menu_id = OLD.menu_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `navigation_id` tinyint(4) NOT NULL,
  `navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `navigation_parent` tinyint(4) DEFAULT '0',
  `navigation_status` tinyint(4) NOT NULL,
  `navigation_url_id` bigint(4) DEFAULT NULL,
  `navigation_position` tinyint(4) NOT NULL,
  `group_navigation_id` tinyint(4) NOT NULL,
  `navigation_type` tinyint(4) NOT NULL,
  `navigation_url_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`navigation_id`, `navigation_name`, `navigation_parent`, `navigation_status`, `navigation_url_id`, `navigation_position`, `group_navigation_id`, `navigation_type`, `navigation_url_name`) VALUES
(2, 'Trang chủ', 0, 1, NULL, 1, 5, 4, '/'),
(3, 'Thiết kế - thi công', 0, 1, NULL, 2, 5, 4, '/du-an'),
(4, 'Gỗ nội thất', 0, 1, 5, 3, 5, 5, '/go-noi-that-pc-5'),
(5, 'Cẩm nang xây dựng', 0, 1, 1, 4, 5, 3, '/cam-nang-xay-dung-nc-1'),
(6, 'Lifedeco', 0, 1, 3, 5, 5, 1, '/lifedeco-p-3'),
(7, 'Liên hệ', 0, 1, NULL, 6, 5, 4, '/lien-he'),
(8, 'Nhà phố - biệt thự', 3, 1, 7, 1, 5, 5, '/nha-pho-biet-thu-pc-7'),
(9, 'Căn hộ - Chung cư', 3, 1, 8, 2, 5, 5, '/can-ho-chung-cu-pc-8'),
(10, 'Bar - Cafe - Nhà hàng', 3, 1, 9, 3, 5, 5, '/bar-cafe-nha-hang-pc-9'),
(11, 'Showroom - Văn phòng', 3, 1, 10, 4, 5, 5, '/showroom-van-phong-pc-10');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` smallint(6) NOT NULL,
  `post_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_quote` text COLLATE utf8_unicode_ci,
  `post_body` longtext COLLATE utf8_unicode_ci,
  `post_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_date_created` datetime DEFAULT NULL,
  `post_date_updated` datetime DEFAULT NULL,
  `post_users_created` smallint(6) DEFAULT NULL,
  `post_type` tinyint(4) DEFAULT NULL,
  `post_status` tinyint(4) DEFAULT NULL,
  `post_users_updated` smallint(6) DEFAULT NULL,
  `post_view` smallint(6) DEFAULT '0',
  `post_tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_category_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_quote`, `post_body`, `post_picture`, `post_date_created`, `post_date_updated`, `post_users_created`, `post_type`, `post_status`, `post_users_updated`, `post_view`, `post_tag`, `post_category_id`) VALUES
(3, 'Lifedeco', NULL, '<p><strong>C&ocirc;ng ty CP Đầu tư &amp; X&acirc;y dựng Ho&agrave;ng Khải</strong>&nbsp;xin gửi tới Qu&yacute; Kh&aacute;ch h&agrave;ng lời ch&agrave;o tr&acirc;n trọng nhất.</p>\r\n<p>C&ocirc;ng ty ch&uacute;ng t&ocirc;i được th&agrave;nh lập bởi nh&oacute;m kiến tr&uacute;c sư trẻ năng động v&agrave; đầy nhiệt huyết, mang trong m&igrave;nh kh&aacute;t vọng đam m&ecirc; s&aacute;ng tạo, những người c&oacute; nhiều năm kinh nghiệm, mong muốn l&agrave;m đẹp kh&ocirc;ng gian sống cho mọi người. Ch&uacute;ng t&ocirc;i lu&ocirc;n mong muốn mang đến sự h&agrave;i l&ograve;ng nhất đến với Kh&aacute;ch H&agrave;ng.</p>\r\n<p><strong>Sản phẩm v&agrave; dịch vụ của ch&uacute;ng t&ocirc;i bao gồm:</strong><br />1. Thiết kế kiến tr&uacute;c, kết cấu, hệ thống hạ tầng kỹ thuật, c&aacute;c c&ocirc;ng tr&igrave;nh d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp, thực hiện triển khai đồ &aacute;n quy hoạch tổng thể v&agrave; chi tiết c&aacute;c khu Đ&ocirc; thị v&agrave; C&ocirc;ng nghiệp.<br />2. Thiết kế trang tr&iacute; nội ngoại thất, thiết kế s&acirc;n vườn c&aacute;c c&ocirc;ng tr&igrave;nh d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp.<br />3. Sản xuất, chế tạo v&agrave; lắp đặt trang thiết bị nội thất c&aacute;c c&ocirc;ng tr&igrave;nh d&acirc;n dụng.<br />4. Cung cấp v&agrave; lắp đặt trang thiết bị nhập khẩu theo đơn đặt h&agrave;ng.<br />5. Thi c&ocirc;ng triển khai hệ thống hạ tầng kỹ thuật c&aacute;c c&ocirc;ng tr&igrave;nh x&acirc;y dựng v&agrave; Đ&ocirc; thị.</p>\r\n<p>Mục ti&ecirc;u ph&aacute;t triển của ch&uacute;ng t&ocirc;i l&agrave; đ&aacute;p ứng ở mức cao nhất c&aacute;c y&ecirc;u cầu của kh&aacute;ch h&agrave;ng về&nbsp;<strong>Độ Bền Vững</strong>,&nbsp;<strong>T&iacute;nh C&ocirc;ng Năng</strong>,&nbsp;<strong>Điều Kiện Kinh Tế</strong>&nbsp;v&agrave;&nbsp;<strong>Nghệ Thuật Kiến Tr&uacute;c</strong>.</p>\r\n<p>Ch&uacute;ng t&ocirc;i h&acirc;n hạnh được mời Qu&yacute; Kh&aacute;ch h&agrave;ng sử dụng sản phẩm v&agrave; dịch vụ của ch&uacute;ng t&ocirc;i. Ngo&agrave;i việc thiết kế, x&acirc;y dựng v&agrave; cung cấp c&aacute;c sản phẩm ph&ugrave; hợp với từng đối t&aacute;c, ch&uacute;ng t&ocirc;i sẵn s&agrave;ng tư vấn cho Qu&yacute; Kh&aacute;ch h&agrave;ng những th&ocirc;ng tin hữu &iacute;ch nhằm x&acirc;y dựng kh&ocirc;ng gian tiện nghi tối ưu ph&ugrave; hợp với nhu cầu Qu&yacute; Kh&aacute;ch h&agrave;ng c&ugrave;ng chi ph&iacute; đầu tư&nbsp;thấp nhất.</p>\r\n<p>Với kinh nghiệm l&acirc;u năm c&ugrave;ng đội ngũ kiến tr&uacute;c sư, kỹ sư l&agrave;nh nghề, ch&uacute;ng t&ocirc;i tin tưởng sẽ thỏa m&atilde;n mọi nhu cầu của Qu&yacute; Kh&aacute;ch h&agrave;ng.</p>\r\n<p>Rất mong được hợp t&aacute;c c&ugrave;ng Qu&yacute; Kh&aacute;ch h&agrave;ng.</p>\r\n<p><strong>Tr&acirc;n trọng k&iacute;nh ch&agrave;o</strong></p>\r\n<p><strong>C&Ocirc;NG TY CP ĐẦU TƯ &amp; X&Acirc;Y DỰNG HO&Agrave;NG KHẢI</strong></p>\r\n<p><em>GI&Aacute;M ĐỐC</em><br /><strong>HO&Agrave;NG MINH ĐỨC</strong></p>', NULL, '2018-01-09 21:31:18', '2018-01-16 14:45:38', 3, 2, 1, 3, 0, '', 0),
(4, 'Bảng giá thiết kế', NULL, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, '2018-01-11 16:45:10', '2018-01-11 16:53:58', 3, 2, 1, 3, 0, '', 0),
(5, 'Bảng giá xây dựng', NULL, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, '2018-01-11 16:53:51', '2018-01-11 16:53:51', 3, 2, 1, 3, 0, '', 0),
(6, 'Thiết kế nội thất phòng khách nhà phố đẹp', '<p>Thiết kế nội thất ph&ograve;ng kh&aacute;ch nh&agrave; phố đẹp,tu vấn thiết kế,b&aacute;o gi&aacute; thi c&ocirc;ng x&acirc;y dựng nh&agrave; phố&hellip; Chi tiết Thiết kế nội thất đẹp v&agrave; sang trọng Nếu thiết kế kiến tr&uacute;c l&agrave; bộ mặt của ng&ocirc;i nh&agrave; th&igrave; thiết kế nội thất c&agrave;ng thể hiện r&otilde; hơn phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>', 'post_1515768301.1502_bg-service-1.jpg', '2018-01-12 21:45:00', '2018-01-12 22:47:27', 3, 1, 1, 3, 0, NULL, 1),
(7, 'Thiết kế nội thất phòng khách nhà phố đẹp', '<p>Thiết kế nội thất ph&ograve;ng kh&aacute;ch nh&agrave; phố đẹp,tu vấn thiết kế,b&aacute;o gi&aacute; thi c&ocirc;ng x&acirc;y dựng nh&agrave; phố&hellip; Chi tiết Thiết kế nội thất đẹp v&agrave; sang trọng Nếu thiết kế kiến tr&uacute;c l&agrave; bộ mặt của ng&ocirc;i nh&agrave; th&igrave; thiết kế nội thất c&agrave;ng thể hiện r&otilde; hơn phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>', 'post_1515768327.7651_bg-service-2.jpg', '2018-01-12 21:45:27', '2018-01-12 22:47:17', 3, 1, 1, 3, 0, NULL, 1),
(8, 'Thiết kế nội thất phòng khách nhà phố đẹp', '<p>Thiết kế nội thất ph&ograve;ng kh&aacute;ch nh&agrave; phố đẹp,tu vấn thiết kế,b&aacute;o gi&aacute; thi c&ocirc;ng x&acirc;y dựng nh&agrave; phố&hellip; Chi tiết Thiết kế nội thất đẹp v&agrave; sang trọng Nếu thiết kế kiến tr&uacute;c l&agrave; bộ mặt của ng&ocirc;i nh&agrave; th&igrave; thiết kế nội thất c&agrave;ng thể hiện r&otilde; hơn phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>', 'post_1515768341.5489_bg-service-3.jpg', '2018-01-12 21:45:41', '2018-01-12 22:47:05', 3, 1, 1, 3, 0, NULL, 1),
(9, 'Thiết kế nội thất phòng khách nhà phố đẹp', '<p>Thiết kế nội thất ph&ograve;ng kh&aacute;ch nh&agrave; phố đẹp,tu vấn thiết kế,b&aacute;o gi&aacute; thi c&ocirc;ng x&acirc;y dựng nh&agrave; phố&hellip; Chi tiết Thiết kế nội thất đẹp v&agrave; sang trọng Nếu thiết kế kiến tr&uacute;c l&agrave; bộ mặt của ng&ocirc;i nh&agrave; th&igrave; thiết kế nội thất c&agrave;ng thể hiện r&otilde; hơn phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>', 'post_1515768357.508_bg-service-4.jpg', '2018-01-12 21:45:57', '2018-01-12 22:46:55', 3, 1, 1, 3, 0, NULL, 1),
(10, 'Thiết kế nội thất phòng khách nhà phố đẹp', '<p>Thiết kế nội thất ph&ograve;ng kh&aacute;ch nh&agrave; phố đẹp,tu vấn thiết kế,b&aacute;o gi&aacute; thi c&ocirc;ng x&acirc;y dựng nh&agrave; phố&hellip; Chi tiết Thiết kế nội thất đẹp v&agrave; sang trọng Nếu thiết kế kiến tr&uacute;c l&agrave; bộ mặt của ng&ocirc;i nh&agrave; th&igrave; thiết kế nội thất c&agrave;ng thể hiện r&otilde; hơn phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>', 'post_1516031075.6523_pf (1).jpg', '2018-01-15 22:44:35', '2018-01-15 22:44:35', 3, 1, 1, 3, 0, NULL, 1),
(11, 'Thiết kế nội thất phòng khách nhà phố đẹp', '<p>Thiết kế nội thất ph&ograve;ng kh&aacute;ch nh&agrave; phố đẹp,tu vấn thiết kế,b&aacute;o gi&aacute; thi c&ocirc;ng x&acirc;y dựng nh&agrave; phố&hellip; Chi tiết Thiết kế nội thất đẹp v&agrave; sang trọng Nếu thiết kế kiến tr&uacute;c l&agrave; bộ mặt của ng&ocirc;i nh&agrave; th&igrave; thiết kế nội thất c&agrave;ng thể hiện r&otilde; hơn phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>', 'post_1516031095.2529_pf (2).jpg', '2018-01-15 22:44:55', '2018-01-15 22:44:55', 3, 1, 1, 3, 0, NULL, 1),
(12, 'Thiết kế nội thất phòng khách nhà phố đẹp', '<p>Thiết kế nội thất ph&ograve;ng kh&aacute;ch nh&agrave; phố đẹp,tu vấn thiết kế,b&aacute;o gi&aacute; thi c&ocirc;ng x&acirc;y dựng nh&agrave; phố&hellip; Chi tiết Thiết kế nội thất đẹp v&agrave; sang trọng Nếu thiết kế kiến tr&uacute;c l&agrave; bộ mặt của ng&ocirc;i nh&agrave; th&igrave; thiết kế nội thất c&agrave;ng thể hiện r&otilde; hơn phong c&aacute;ch v&agrave; c&aacute; t&iacute;nh</p>', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>', 'post_1516031112.0164_pf (3) (1).jpg', '2018-01-15 22:45:11', '2018-01-15 22:45:11', 3, 1, 1, 3, 0, NULL, 1);

--
-- Triggers `post`
--
DELIMITER $$
CREATE TRIGGER `AFTER_DELETE_POST` AFTER DELETE ON `post` FOR EACH ROW BEGIN
	DELETE FROM post_category_detail WHERE post_id = OLD.post_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category` (
  `post_category_id` smallint(6) NOT NULL,
  `post_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `post_category_parent` smallint(6) DEFAULT NULL,
  `post_category_status` tinyint(4) DEFAULT NULL,
  `post_category_date_created` datetime DEFAULT NULL,
  `post_category_date_updated` datetime DEFAULT NULL,
  `post_category_users_created` smallint(6) DEFAULT NULL,
  `post_category_users_updated` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`post_category_id`, `post_category_name`, `post_category_parent`, `post_category_status`, `post_category_date_created`, `post_category_date_updated`, `post_category_users_created`, `post_category_users_updated`) VALUES
(1, 'Cẩm nang xây dựng', 0, 1, '2017-11-01 10:15:59', '2018-01-09 21:32:10', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post_category_detail`
--

CREATE TABLE `post_category_detail` (
  `post_category_detail_id` smallint(6) NOT NULL,
  `post_id` smallint(6) NOT NULL,
  `post_category_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_category_detail`
--

INSERT INTO `post_category_detail` (`post_category_detail_id`, `post_id`, `post_category_id`) VALUES
(1, 6, 1),
(2, 7, 1),
(3, 8, 1),
(4, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` smallint(6) NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` bigint(20) DEFAULT NULL,
  `product_status` tinyint(4) NOT NULL,
  `product_date_created` datetime NOT NULL,
  `product_date_updated` datetime NOT NULL,
  `product_users_created` smallint(6) NOT NULL,
  `product_users_updated` smallint(6) NOT NULL,
  `product_body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `product_view` smallint(6) DEFAULT NULL,
  `product_category_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_picture`, `product_price`, `product_status`, `product_date_created`, `product_date_updated`, `product_users_created`, `product_users_updated`, `product_body`, `product_view`, `product_category_id`) VALUES
(10, 'Nhà phố quận 3', 'product_1515663798.5057_p1_b.jpg', NULL, 1, '2018-01-11 16:43:18', '2018-01-13 22:57:13', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(11, 'Nhà phố quận 4', 'product_1515663850.4827_p3_b.jpg', NULL, 1, '2018-01-11 16:44:10', '2018-01-12 22:58:20', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(12, 'Nhà phố quận 5', 'product_1515663859.4792_p4_a.jpg', NULL, 1, '2018-01-11 16:44:19', '2018-01-15 22:46:32', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(13, 'Nhà phố quận 6', 'product_1516031206.0032_bg-service-1.jpg', NULL, 1, '2018-01-15 22:46:45', '2018-01-15 22:46:45', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(14, 'Nhà phố quận 7', 'product_1516031224.5253_bg-service-3.jpg', NULL, 1, '2018-01-15 22:47:04', '2018-01-15 22:48:17', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(15, 'Nhà phố quận 8', 'product_1516031238.5303_pf (2).jpg', NULL, 1, '2018-01-15 22:47:18', '2018-01-15 22:48:24', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(16, 'Nhà phố quận 9', 'product_1516031250.4968_bg-service-3.jpg', NULL, 1, '2018-01-15 22:47:30', '2018-01-15 22:48:44', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(17, 'Nhà phố quận 10', 'product_1516031263.52_pf (3) (1).jpg', NULL, 1, '2018-01-15 22:47:43', '2018-01-15 22:48:33', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7),
(18, 'Nhà phố quận 11', 'product_1516031279.1123_bg-service-1.jpg', NULL, 1, '2018-01-15 22:47:59', '2018-02-11 18:49:19', 3, 3, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We\'re happy to make you feel more comfortable on your home.</p>', NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_category_id` smallint(6) NOT NULL,
  `product_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_category_parent` smallint(6) DEFAULT NULL,
  `product_category_status` tinyint(4) DEFAULT NULL,
  `product_category_date_created` datetime DEFAULT NULL,
  `product_category_date_updated` datetime DEFAULT NULL,
  `product_category_users_created` smallint(6) DEFAULT NULL,
  `product_category_users_updated` smallint(6) DEFAULT NULL,
  `group_property_id` smallint(6) DEFAULT NULL,
  `product_category_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_category_name`, `product_category_parent`, `product_category_status`, `product_category_date_created`, `product_category_date_updated`, `product_category_users_created`, `product_category_users_updated`, `group_property_id`, `product_category_picture`) VALUES
(4, 'Thiết kế - Thi công', 0, 1, '2018-01-09 21:32:30', '2018-01-11 14:33:09', 3, 3, NULL, NULL),
(5, 'Gỗ nội thất', 0, 1, '2018-01-09 21:32:37', '2018-02-14 16:11:12', 3, 3, NULL, 'product_category_1518599473.0828_pf5.jpg'),
(6, 'Cẩm nang xây dựng', 0, 1, '2018-01-09 21:32:45', NULL, 3, NULL, NULL, ''),
(7, 'Nhà phố - biệt thự', 4, 1, '2018-01-09 21:34:57', '2018-02-12 18:59:47', 3, 3, NULL, 'product_category_1518436787.142_pf1.jpg'),
(8, 'Căn hộ - Chung cư', 4, 1, '2018-01-09 21:35:07', '2018-02-12 19:00:09', 3, 3, NULL, 'product_category_1518436809.6927_pf2.jpg'),
(9, 'Bar - Cafe - Nhà hàng', 4, 1, '2018-01-09 21:35:18', '2018-02-12 19:00:41', 3, 3, NULL, 'product_category_1518436841.683_pf3.jpg'),
(10, 'Showroom - Văn phòng', 4, 1, '2018-01-09 21:35:28', '2018-02-12 19:07:23', 3, 3, NULL, 'product_category_1518437243.2428_pf7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_category_detail`
--

CREATE TABLE `product_category_detail` (
  `product_category_detail_id` smallint(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_category_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category_detail`
--

INSERT INTO `product_category_detail` (`product_category_detail_id`, `product_id`, `product_category_id`) VALUES
(2, 9, 7),
(3, 10, 7),
(4, 11, 7),
(5, 12, 7);

-- --------------------------------------------------------

--
-- Table structure for table `product_picture`
--

CREATE TABLE `product_picture` (
  `product_picture_id` bigint(20) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `product_picture_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_picture`
--

INSERT INTO `product_picture` (`product_picture_id`, `product_id`, `product_picture_name`) VALUES
(4, 7, 'product_1514964305.6458_forward_disabled.png'),
(5, 7, 'product_1514964305.6668_forward_enabled.png'),
(6, 7, 'product_1514964305.6878_forward_enabled_hover.png'),
(7, 7, 'product_1514964305.8049_loading.gif'),
(8, 7, 'product_1515050577.1722_forward_enabled_hover.png'),
(9, 7, 'product_1515052518.7882_loading.gif'),
(10, 7, 'product_1515052549.392_forward_enabled.png'),
(11, 10, 'product_1515859033.7515_pf (1).jpg'),
(12, 10, 'product_1515859033.8444_pf (2).jpg'),
(13, 10, 'product_1515859033.9186_pf (3).jpg'),
(14, 10, 'product_1515859034.0335_pf (4).jpg'),
(15, 10, 'product_1515859034.1386_pf (5).jpg'),
(16, 10, 'product_1515859034.1712_pf (6).jpg'),
(17, 10, 'product_1515859034.2058_pf (7).jpg'),
(18, 10, 'product_1515859034.2956_pf (8).jpg'),
(19, 12, 'product_1516031192.4255_bg-service-1.jpg'),
(20, 12, 'product_1516031192.5619_bg-service-2.jpg'),
(21, 12, 'product_1516031192.6214_bg-service-3.jpg'),
(22, 12, 'product_1516031192.7642_bg-service-4.jpg'),
(23, 12, 'product_1516031192.8197_pf (1).jpg'),
(24, 12, 'product_1516031192.943_pf (2).jpg'),
(25, 12, 'product_1516031192.9874_pf (3) (1).jpg'),
(26, 13, 'product_1516031206.1484_bg-service-1.jpg'),
(27, 13, 'product_1516031206.2332_bg-service-2.jpg'),
(28, 13, 'product_1516031206.3451_bg-service-3.jpg'),
(29, 13, 'product_1516031206.461_bg-service-4.jpg'),
(30, 13, 'product_1516031206.5536_pf (1).jpg'),
(31, 13, 'product_1516031206.6212_pf (2).jpg'),
(32, 13, 'product_1516031206.6661_pf (3) (1).jpg'),
(33, 14, 'product_1516031224.5925_bg-service-1.jpg'),
(34, 14, 'product_1516031224.6233_bg-service-2.jpg'),
(35, 14, 'product_1516031224.6549_bg-service-3.jpg'),
(36, 14, 'product_1516031224.6892_bg-service-4.jpg'),
(37, 14, 'product_1516031224.7216_pf (1).jpg'),
(38, 14, 'product_1516031224.7561_pf (2).jpg'),
(39, 14, 'product_1516031224.8108_pf (3) (1).jpg'),
(40, 15, 'product_1516031238.6388_bg-service-1.jpg'),
(41, 15, 'product_1516031238.7006_bg-service-2.jpg'),
(42, 15, 'product_1516031238.756_bg-service-3.jpg'),
(43, 15, 'product_1516031238.8355_bg-service-4.jpg'),
(44, 15, 'product_1516031238.9802_pf (1).jpg'),
(45, 15, 'product_1516031239.0237_pf (2).jpg'),
(46, 15, 'product_1516031239.0677_pf (3) (1).jpg'),
(47, 16, 'product_1516031250.595_bg-service-1.jpg'),
(48, 16, 'product_1516031250.624_bg-service-2.jpg'),
(49, 16, 'product_1516031250.7204_bg-service-3.jpg'),
(50, 16, 'product_1516031250.8085_bg-service-4.jpg'),
(51, 16, 'product_1516031250.9489_pf (1).jpg'),
(52, 16, 'product_1516031251.0584_pf (2).jpg'),
(53, 16, 'product_1516031251.0907_pf (3) (1).jpg'),
(54, 17, 'product_1516031263.6089_bg-service-1.jpg'),
(55, 17, 'product_1516031263.6724_bg-service-2.jpg'),
(56, 17, 'product_1516031263.7262_bg-service-3.jpg'),
(57, 17, 'product_1516031263.7944_bg-service-4.jpg'),
(58, 17, 'product_1516031263.8387_pf (1).jpg'),
(59, 17, 'product_1516031263.95_pf (2).jpg'),
(60, 17, 'product_1516031264.0277_pf (3) (1).jpg'),
(71, 18, 'product_1518349759.861_product_1515508780.3244_pf (1).jpg'),
(72, 18, 'product_1518349759.9254_product_1515663798.5057_p1_b.jpg'),
(73, 18, 'product_1518349759.959_product_1515663850.4827_p3_b.jpg'),
(74, 18, 'product_1518349760.0243_product_1515663859.4792_p4_a.jpg'),
(75, 18, 'product_1518349760.0915_product_1515859033.7515_pf (1).jpg'),
(76, 18, 'product_1518349760.1232_product_1515859033.8444_pf (2).jpg'),
(77, 18, 'product_1518349760.1616_product_1515859033.9186_pf (3).jpg'),
(78, 18, 'product_1518349760.2049_product_1515859034.0335_pf (4).jpg'),
(79, 18, 'product_1518349760.2506_product_1515859034.1386_pf (5).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_property`
--

CREATE TABLE `product_property` (
  `product_property_id` smallint(6) NOT NULL,
  `property_id` smallint(6) NOT NULL,
  `property_detail_id` smallint(6) NOT NULL,
  `property_detail_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_detail`
--

CREATE TABLE `product_property_detail` (
  `product_property_detail_id` bigint(20) NOT NULL,
  `product_property_detail_value` smallint(6) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `property_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` smallint(6) NOT NULL,
  `property_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `property_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `property_status` tinyint(4) NOT NULL,
  `property_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `property_name`, `property_type`, `property_status`, `property_code`) VALUES
(3, 'Số tiền', 'text', 1, 'money');

-- --------------------------------------------------------

--
-- Table structure for table `property_detail`
--

CREATE TABLE `property_detail` (
  `property_detail_id` smallint(6) NOT NULL,
  `property_detail_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `property_detail_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `property_id` smallint(6) NOT NULL,
  `property_detail_default` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `template_id` tinyint(4) NOT NULL,
  `template_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_content` text COLLATE utf8_unicode_ci,
  `group_template_id` tinyint(4) NOT NULL,
  `template_status` tinyint(4) NOT NULL,
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`template_id`, `template_picture`, `template_content`, `group_template_id`, `template_status`, `template_name`) VALUES
(5, NULL, NULL, 2, 1, 'Liên hệ'),
(6, NULL, NULL, 1, 1, 'Logo');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` smallint(6) NOT NULL,
  `users_fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `users_phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `users_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `users_registered` datetime NOT NULL,
  `users_status` tinyint(1) NOT NULL,
  `users_picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_salt` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `users_login_time` datetime DEFAULT NULL,
  `users_user_agent` text COLLATE utf8_unicode_ci,
  `group_users_id` smallint(6) DEFAULT NULL,
  `users_forget_request_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_fullname`, `users_phone`, `users_email`, `users_password`, `users_registered`, `users_status`, `users_picture`, `users_salt`, `users_login_time`, `users_user_agent`, `group_users_id`, `users_forget_request_key`) VALUES
(3, 'Anh Tuấn', '', 'anhtuan150787@gmail.com', 'e49ed34b584d6a4ac562647850517b13', '2017-08-10 11:56:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '65601daf9197d19f660233df5f7961c9', '2018-02-11 18:44:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1, ''),
(5584, 'Fullname_1506411188.424', '0966554433', 'Email_1506411188.424@yahoo.com', '75d50d1c3a29a8a9cd9ec132d6fa1294', '2017-09-26 14:33:08', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c68d3249a75bf92e8f5d57f692c786f7', NULL, NULL, 1, NULL),
(5585, 'Fullname_1506411192.7632', '0966554433', 'Email_1506411192.7632@yahoo.com', 'fa624a382f33f9396bdeff9fc280a96f', '2017-09-26 14:33:12', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4cdf10c4ad8c2466be13901d3b3e5915', NULL, NULL, 1, NULL),
(5586, 'Fullname_1506411196.0274', '0966554433', 'Email_1506411196.0274@yahoo.com', 'eb9913dc90e36fdf3ae13210f986f092', '2017-09-26 14:33:16', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'aabd586ec543f262a57f74cf12f9d37e', NULL, NULL, 1, NULL),
(5587, 'Fullname_1506411197.3715', '0966554433', 'Email_1506411197.3715@yahoo.com', '5aa9d90d2519766fd1ec55e3f4d64fff', '2017-09-26 14:33:17', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'b2eb2c183f88167aa9ff16f77da8f38a', NULL, NULL, 1, NULL),
(5588, 'Fullname_1506411199.3586', '0966554433', 'Email_1506411199.3586@yahoo.com', '919f80b700a87432e7d8da24ee24b740', '2017-09-26 14:33:19', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '7aeb9196d944767c683c9f00ba171863', NULL, NULL, 1, NULL),
(5589, 'Fullname_1506411200.6967', '0966554433', 'Email_1506411200.6967@yahoo.com', 'f641c6f202150014ad42d24fdce6d6bb', '2017-09-26 14:33:20', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'b9b18686aabc28c07147ff5efcd284d0', NULL, NULL, 1, NULL),
(5590, 'Fullname_1506411203.0478', '0966554433', 'Email_1506411203.0478@yahoo.com', 'fac66e0502e296405b10d0282b2618cd', '2017-09-26 14:33:23', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '94c19af86282569802c3143481f7f77b', NULL, NULL, 1, NULL),
(5591, 'Fullname_1506411204.9139', '0966554433', 'Email_1506411204.9139@yahoo.com', '2f89932df7c03adb116376cb5045f253', '2017-09-26 14:33:24', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '549d221871fbdc241cec065bd86d56e2', NULL, NULL, 1, NULL),
(5592, 'Fullname_1506411206.543', '0966554433', 'Email_1506411206.543@yahoo.com', '7184bf87e9c9ddc93b1fa0b5c916ba4e', '2017-09-26 14:33:26', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '7e9e3628533f92763124af53e9a18b50', NULL, NULL, 1, NULL),
(5593, 'Fullname_1506411208.0461', '0966554433', 'Email_1506411208.0461@yahoo.com', 'd685a7a4cff2d3f8c72e7cb0a2a326dc', '2017-09-26 14:33:28', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '69993521764307efcf49b5a4d86331d1', NULL, NULL, 1, NULL),
(5594, 'Fullname_1506411209.7992', '0966554433', 'Email_1506411209.7992@yahoo.com', '642903df6ec3273a95ecb8bd28bec9a4', '2017-09-26 14:33:29', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4802c8b91dd1f2ec619265d2675eb746', NULL, NULL, 1, NULL),
(5595, 'Fullname_1506411209.9562', '0966554433', 'Email_1506411209.9562@yahoo.com', '3aa55dc0c14b1a21a4e4145dc507c385', '2017-09-26 14:33:29', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '72fdcd8db1d57d558217bd885e18b126', NULL, NULL, 1, NULL),
(5596, 'Fullname_1506411211.9423', '0966554433', 'Email_1506411211.9423@yahoo.com', '2fb8ee0960889a89529833860eef0fa7', '2017-09-26 14:33:31', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '7aea9f38d713ef30d75cca6d4b7f418b', NULL, NULL, 1, NULL),
(5597, 'Fullname_1506411212.1314', '0966554433', 'Email_1506411212.1314@yahoo.com', '0067366461a096a3aaa3f592884652eb', '2017-09-26 14:33:32', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e9eb4cda4dd9037db29157c7a7d5aa35', NULL, NULL, 1, NULL),
(5598, 'Fullname_1506411214.0475', '0966554433', 'Email_1506411214.0475@yahoo.com', 'd55226e1c77766ad1a26c267884a9722', '2017-09-26 14:33:34', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e522e5929cce8ac734c4ba7de0f6f7cc', NULL, NULL, 1, NULL),
(5599, 'Fullname_1506411214.2735', '0966554433', 'Email_1506411214.2735@yahoo.com', '0e728998b3a9af0f67d6f86299345f75', '2017-09-26 14:33:34', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'a1d271d9a6e1f00d4ae8f09956f5fe98', NULL, NULL, 1, NULL),
(5600, 'Fullname_1506411216.1796', '0966554433', 'Email_1506411216.1796@yahoo.com', 'cdee34272b097c6293b0ddc8279150d2', '2017-09-26 14:33:36', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '98bd57ff8e6aa1cd1c2c303fe2c7a9b1', NULL, NULL, 1, NULL),
(5601, 'Fullname_1506411216.3806', '0966554433', 'Email_1506411216.3806@yahoo.com', '56fc17a43d3dbf47ca8a6b95329defa1', '2017-09-26 14:33:36', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'fe58d77a53c26e4d3428b27c6a63fdf5', NULL, NULL, 1, NULL),
(5602, 'Fullname_1506411218.2017', '0966554433', 'Email_1506411218.2017@yahoo.com', 'd5c73777e076c89a4ee0bb60c0cba777', '2017-09-26 14:33:38', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '065afbf313d8f0ae0a218b08304f1f84', NULL, NULL, 1, NULL),
(5603, 'Fullname_1506411218.3887', '0966554433', 'Email_1506411218.3887@yahoo.com', '7bd855d71cdab33b7515edb68cbafd58', '2017-09-26 14:33:38', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '16faa70c1b321d85454ebba1c4fd17a4', NULL, NULL, 1, NULL),
(5604, 'Fullname_1506411220.5398', '0966554433', 'Email_1506411220.5398@yahoo.com', '177ca050853b5a0c7821a65d4df5d687', '2017-09-26 14:33:40', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'dd9d011dc9c4ea624b94fce1d293c14d', NULL, NULL, 1, NULL),
(5605, 'Fullname_1506411220.7088', '0966554433', 'Email_1506411220.7088@yahoo.com', 'd2747c66fc28d7798d87597141e43e1a', '2017-09-26 14:33:40', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '758e361f641cb31dd7c5e4659ff34137', NULL, NULL, 1, NULL),
(5606, 'Fullname_1506411222.548', '0966554433', 'Email_1506411222.548@yahoo.com', 'aa84f86f347347871a6d22a5a71c13c4', '2017-09-26 14:33:42', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'cd27bd5c4dc47987348ecd5ae5b6442d', NULL, NULL, 1, NULL),
(5607, 'Fullname_1506411222.706', '0966554433', 'Email_1506411222.706@yahoo.com', 'e8f41800a921a65091fa1310b1fff72c', '2017-09-26 14:33:42', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'a846ef1cc093823a429ba0d4adcd3816', NULL, NULL, 1, NULL),
(5608, 'Fullname_1506411224.5031', '0966554433', 'Email_1506411224.5031@yahoo.com', '1812129d6e71936d7794c6f34eba9753', '2017-09-26 14:33:44', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4ebc8f1c729141af0932cba3b51f02ce', NULL, NULL, 1, NULL),
(5609, 'Fullname_1506411224.7061', '0966554433', 'Email_1506411224.7061@yahoo.com', '2591f4b4afe56d0277435e19877536a9', '2017-09-26 14:33:44', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '671ae12082c25d6510ff3c2e39d1df50', NULL, NULL, 1, NULL),
(5610, 'Fullname_1506411226.6632', '0966554433', 'Email_1506411226.6632@yahoo.com', '79e6dab95bfed8be6eca7b1d34c76ada', '2017-09-26 14:33:46', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '54bc99ae0ac153e77cca288052a4c9e0', NULL, NULL, 1, NULL),
(5611, 'Fullname_1506411226.8762', '0966554433', 'Email_1506411226.8762@yahoo.com', '78d5c74a9761393fccdde9fb9166c19e', '2017-09-26 14:33:46', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'b9784d82138e9fdb0965e176f7040ace', NULL, NULL, 1, NULL),
(5612, 'Fullname_1506411228.9763', '0966554433', 'Email_1506411228.9763@yahoo.com', '20471806e1d549baafab12852adaa296', '2017-09-26 14:33:48', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c1d196ddf68b4bc1ea40d818c60e66a3', NULL, NULL, 1, NULL),
(5613, 'Fullname_1506411229.2083', '0966554433', 'Email_1506411229.2083@yahoo.com', '196e222a12e7b38e997be0eada5ff6eb', '2017-09-26 14:33:49', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '6b76828e46756b0aab7f706840b1d9d5', NULL, NULL, 1, NULL),
(5614, 'Fullname_1506411230.9814', '0966554433', 'Email_1506411230.9824@yahoo.com', '578e20acd189fcc6f0debb3eecb61fcd', '2017-09-26 14:33:50', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '961adcb3a176f67bb180fbd7c0e372f9', NULL, NULL, 1, NULL),
(5615, 'Fullname_1506411231.7625', '0966554433', 'Email_1506411231.7625@yahoo.com', '82017233fbc1bf15a1ac09370fcafd39', '2017-09-26 14:33:51', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '616c0bcf403b70a768215a4892fad1f3', NULL, NULL, 1, NULL),
(5616, 'Fullname_1506411233.5846', '0966554433', 'Email_1506411233.5846@yahoo.com', '0f34771b9743e6afc9c02acdb6c4b0be', '2017-09-26 14:33:53', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '0153a92fdd13e31f4fa173522ffceb92', NULL, NULL, 1, NULL),
(5617, 'Fullname_1506411233.7216', '0966554433', 'Email_1506411233.7216@yahoo.com', 'fa3ffae313edf64bef10ae3b3ecb0b1d', '2017-09-26 14:33:53', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '2c62fcda1ed116801618862a6a5c5201', NULL, NULL, 1, NULL),
(5618, 'Fullname_1506411235.6507', '0966554433', 'Email_1506411235.6507@yahoo.com', 'edec31a69ead5248fa1171294d16eb02', '2017-09-26 14:33:55', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '05344c897e09be1ae24312c8ef667b22', NULL, NULL, 1, NULL),
(5619, 'Fullname_1506411235.7597', '0966554433', 'Email_1506411235.7597@yahoo.com', 'f5abc4d352e90d87a3bac91106c7b50c', '2017-09-26 14:33:55', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '247bed14326077314bfd53d8c8ef49f7', NULL, NULL, 1, NULL),
(5620, 'Fullname_1506411237.6628', '0966554433', 'Email_1506411237.6628@yahoo.com', '15f9c5d8ade69709f9b16e52f487299c', '2017-09-26 14:33:57', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'b730e1e7de16301258718c17cd1fc4e0', NULL, NULL, 1, NULL),
(5621, 'Fullname_1506411237.8148', '0966554433', 'Email_1506411237.8148@yahoo.com', '73e96c5cd8432402b6619e995e5a9c32', '2017-09-26 14:33:57', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '658d30a14a84803e2b1256a1df45a36d', NULL, NULL, 1, NULL),
(5622, 'Fullname_1506411239.9049', '0966554433', 'Email_1506411239.9049@yahoo.com', '153510af1babba939cac97c9738e9faf', '2017-09-26 14:33:59', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4a2bf160b9ce85ca86cebf57dbbadad8', NULL, NULL, 1, NULL),
(5623, 'Fullname_1506411240.065', '0966554433', 'Email_1506411240.065@yahoo.com', 'beb9c7774c4463309ee231b827b0490a', '2017-09-26 14:34:00', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '3ba40ebaf2ca0a2f620e4bc019275dca', NULL, NULL, 1, NULL),
(5624, 'Fullname_1506411242.1391', '0966554433', 'Email_1506411242.1391@yahoo.com', '8594e1b9f1a0783d4aa5dcb1a39e6f7a', '2017-09-26 14:34:02', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '452477c6be61f75d916c97f17a758070', NULL, NULL, 1, NULL),
(5625, 'Fullname_1506411242.2301', '0966554433', 'Email_1506411242.2301@yahoo.com', '773f0a4d22ce8a9712379bfa40d48102', '2017-09-26 14:34:02', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd306aa4fb8bd9d086cf125899931487b', NULL, NULL, 1, NULL),
(5626, 'Fullname_1506411244.0452', '0966554433', 'Email_1506411244.0452@yahoo.com', 'b450be3d0ad309343bd9747933f774e5', '2017-09-26 14:34:04', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e687008eae6f8467bc69e3ed99bfa449', NULL, NULL, 1, NULL),
(5627, 'Fullname_1506411244.0812', '0966554433', 'Email_1506411244.0812@yahoo.com', '92c766294b1e256607a1b9de4af2b6cd', '2017-09-26 14:34:04', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'f8103ed3d2a2ee7ccf6a1bd0b6ddfbad', NULL, NULL, 1, NULL),
(5628, 'Fullname_1506411246.3223', '0966554433', 'Email_1506411246.3223@yahoo.com', '3b1ebf006dcb26a2f8994f9ba21cbc86', '2017-09-26 14:34:06', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '819eee8d0bf274c5cfe971d3fb0632f4', NULL, NULL, 1, NULL),
(5629, 'Fullname_1506411246.3593', '0966554433', 'Email_1506411246.3593@yahoo.com', '2875a3aa725aac1b1cee3c97740a8875', '2017-09-26 14:34:06', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'f64cf5f786d8910d8b369f5999e9b697', NULL, NULL, 1, NULL),
(5630, 'Fullname_1506411248.3014', '0966554433', 'Email_1506411248.3014@yahoo.com', '1d07335215c3f352e62a9262a193d95b', '2017-09-26 14:34:08', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd3c56d43b430d89631dd1440e0b5c692', NULL, NULL, 1, NULL),
(5631, 'Fullname_1506411248.3124', '0966554433', 'Email_1506411248.3124@yahoo.com', 'f8b15acf24533fed2a0495e03612bb36', '2017-09-26 14:34:08', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '85aa185c4af24e474ecfff92b3ff1d33', NULL, NULL, 1, NULL),
(5632, 'Fullname_1506411254.0548', '0966554433', 'Email_1506411254.0548@yahoo.com', 'a7365d10669007bb6af3aa1ea7c8e14e', '2017-09-26 14:34:14', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd7cd9093957c62dcbfd5102d0800fd13', NULL, NULL, 1, NULL),
(5633, 'Fullname_1506411254.0908', '0966554433', 'Email_1506411254.0908@yahoo.com', 'f9dccf0de2f18afb759066bb69915d23', '2017-09-26 14:34:14', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'fc23bf514f6e2ed1982e4c35b08c479b', NULL, NULL, 1, NULL),
(5634, 'Fullname_1506411258.822', '0966554433', 'Email_1506411258.822@yahoo.com', '67dd30f194b59e8fbb5478aea915c2c9', '2017-09-26 14:34:18', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '6de5dee8d2c49857a661bca3c4d1d2ea', NULL, NULL, 1, NULL),
(5635, 'Fullname_1506411258.847', '0966554433', 'Email_1506411258.847@yahoo.com', 'e0667c2f25f67f93bf2e32cc54f5e20b', '2017-09-26 14:34:18', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'ab5c5dba12332bc8164962a0822eb71c', NULL, NULL, 1, NULL),
(5636, 'Fullname_1506411265.6304', '0966554433', 'Email_1506411265.6304@yahoo.com', '93bd9b266c94bb847779a4a12b7fff58', '2017-09-26 14:34:25', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c89e692669ad2d9dd252ed1721238e1e', NULL, NULL, 1, NULL),
(5637, 'Fullname_1506411265.6594', '0966554433', 'Email_1506411265.6594@yahoo.com', '252e9345ba65e71a081f878c0126a888', '2017-09-26 14:34:25', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '9f182d78797a41a1b841a972e4455715', NULL, NULL, 1, NULL),
(5638, 'Fullname_1506411271.2517', '0966554433', 'Email_1506411271.2517@yahoo.com', '62750d8d23169ce01661ddb3caf586b8', '2017-09-26 14:34:31', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '289b1500bd57f44bbab8a52c104081d2', NULL, NULL, 1, NULL),
(5639, 'Fullname_1506411271.2917', '0966554433', 'Email_1506411271.2917@yahoo.com', '93d3b56478ccf7f97afe1d676beea85e', '2017-09-26 14:34:31', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '48885b464bae22ed4fefb53f2732b1d6', NULL, NULL, 1, NULL),
(5640, 'Fullname_1506411277.7431', '0966554433', 'Email_1506411277.7431@yahoo.com', 'a12103b77ca264034eb6c70b540b7261', '2017-09-26 14:34:37', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd9b5223ac3b5ae2de67bb2692d00f10e', NULL, NULL, 1, NULL),
(5641, 'Fullname_1506411277.7691', '0966554433', 'Email_1506411277.7691@yahoo.com', 'fb67c379e3b80f5dfb4085e7be021a08', '2017-09-26 14:34:37', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '470289365bb4b36fbd0b24435e7e97f5', NULL, NULL, 1, NULL),
(5642, 'Fullname_1506411283.6954', '0966554433', 'Email_1506411283.6954@yahoo.com', '402369956306ebc3292370f6e86293d9', '2017-09-26 14:34:43', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '489467deeb65ca4c20beef25e568d28a', NULL, NULL, 1, NULL),
(5643, 'Fullname_1506411283.7905', '0966554433', 'Email_1506411283.7905@yahoo.com', '2f556b31b836142ab0deb3737f36d981', '2017-09-26 14:34:43', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '75d2c964075fbcf6d08f7048c051cf39', NULL, NULL, 1, NULL),
(5644, 'Fullname_1506411288.6977', '0966554433', 'Email_1506411288.6977@yahoo.com', '1a5a1daeccf14788ba5be821fdf39314', '2017-09-26 14:34:48', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4bc80513b38eff2dd690fc25a3359fef', NULL, NULL, 1, NULL),
(5645, 'Fullname_1506411288.7297', '0966554433', 'Email_1506411288.7297@yahoo.com', 'ea1b01a0b861029542efa281695a1296', '2017-09-26 14:34:48', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'aaef5c3450d87da82c31c8d7044e7498', NULL, NULL, 1, NULL),
(5646, 'Fullname_1506411293.97', '0966554433', 'Email_1506411293.97@yahoo.com', 'bc71a1c9eb83f0ab41ae1847142df09f', '2017-09-26 14:34:53', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '32dd9a0f62031982433c7d07d0cae62f', NULL, NULL, 1, NULL),
(5647, 'Fullname_1506411294.159', '0966554433', 'Email_1506411294.159@yahoo.com', '9116c188a0a24490a951a8a6a66ad732', '2017-09-26 14:34:54', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '44e71c93c61640cf7917fa5c2b7ba8e5', NULL, NULL, 1, NULL),
(5648, 'Fullname_1506411301.3665', '0966554433', 'Email_1506411301.3665@yahoo.com', 'af88c46a4a9d2aa750711c76e9da4156', '2017-09-26 14:35:01', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '1058051a7144672cc1e48f981c001cab', NULL, NULL, 1, NULL),
(5649, 'Fullname_1506411301.7155', '0966554433', 'Email_1506411301.7155@yahoo.com', '9bbca20ea98c9e5f2e8736c12fd46d8c', '2017-09-26 14:35:01', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c0ba6ef6699833caecffbee5c8c373be', NULL, NULL, 1, NULL),
(5650, 'Fullname_1506411306.0287', '0966554433', 'Email_1506411306.0287@yahoo.com', '3ca136790074b8632915c40505a8e3df', '2017-09-26 14:35:06', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '1f2f77676f03c1752145fefbfdf6622d', NULL, NULL, 1, NULL),
(5651, 'Fullname_1506411306.3297', '0966554433', 'Email_1506411306.3297@yahoo.com', '90348da938797e48d5ec78afb432ff77', '2017-09-26 14:35:06', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5ae8713667023a621d96939097d4afcc', NULL, NULL, 1, NULL),
(5652, 'Fullname_1506411314.8892', '0966554433', 'Email_1506411314.8892@yahoo.com', '014aab17f4d3121bf54c3f5b6cd7c787', '2017-09-26 14:35:14', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'f06bcd6392ec92ffbb09e3b6bcad8988', NULL, NULL, 1, NULL),
(5653, 'Fullname_1506411315.4143', '0966554433', 'Email_1506411315.4143@yahoo.com', 'abba3029c0bd59a8f9b9742293f2bdb8', '2017-09-26 14:35:15', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e5183ca8038bd3abd9361b8bde71d16a', NULL, NULL, 1, NULL),
(5654, 'Fullname_1506411325.3838', '0966554433', 'Email_1506411325.3838@yahoo.com', 'e28e64044171717ed1b36e6c3fe22d93', '2017-09-26 14:35:25', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e452e2ab2d474f8c577c9133539b6a3b', NULL, NULL, 1, NULL),
(5655, 'Fullname_1506411325.5088', '0966554433', 'Email_1506411325.5088@yahoo.com', '600308d77294aedd4e9e3db37d731cf7', '2017-09-26 14:35:25', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '710a7d409a74404e23a8f446db83257c', NULL, NULL, 1, NULL),
(5656, 'Fullname_1506411331.0712', '0966554433', 'Email_1506411331.0712@yahoo.com', 'd63580a918de239f66eeef9c7e58aa41', '2017-09-26 14:35:31', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'dba1523b86b21a205f5bd43a93975978', NULL, NULL, 1, NULL),
(5657, 'Fullname_1506411331.3032', '0966554433', 'Email_1506411331.3032@yahoo.com', '3b679229c624114f374930a415c00cb0', '2017-09-26 14:35:31', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'f0a6b6dadc322a8b5868391938426cae', NULL, NULL, 1, NULL),
(5658, 'Fullname_1506411337.5865', '0966554433', 'Email_1506411337.5865@yahoo.com', '744650cde149af1bc673dbf29d509185', '2017-09-26 14:35:37', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '35c8bafc6abbaf79204ca740c7d55164', NULL, NULL, 1, NULL),
(5659, 'Fullname_1506411337.7545', '0966554433', 'Email_1506411337.7545@yahoo.com', 'e40b54c4fe6aeeeba6c91ae9018622c0', '2017-09-26 14:35:37', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e59b512e0b3c772ff98c1d747f3757a5', NULL, NULL, 1, NULL),
(5660, 'Fullname_1506411342.8818', '0966554433', 'Email_1506411342.8818@yahoo.com', '94a0dab6defb2773fefd6053fcfdb0f3', '2017-09-26 14:35:42', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '89c5d80a53be61afd9244b9428c460eb', NULL, NULL, 1, NULL),
(5661, 'Fullname_1506411343.1018', '0966554433', 'Email_1506411343.1018@yahoo.com', '954b146c5c7b844ab290841fa4209f40', '2017-09-26 14:35:43', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '8bd33450e3ae93eca6ad193f803e8910', NULL, NULL, 1, NULL),
(5662, 'Fullname_1506411347.8931', '0966554433', 'Email_1506411347.8931@yahoo.com', 'c8c6786d73d9376c47c51752d8ea8ef4', '2017-09-26 14:35:47', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '16f43b982b437a41a0abe5d7c26134d9', NULL, NULL, 1, NULL),
(5663, 'Fullname_1506411348.0851', '0966554433', 'Email_1506411348.0851@yahoo.com', '6f60b9f1c3ed5d5a59a8415348babd09', '2017-09-26 14:35:48', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '225821328a4ce43bd84be9d6141ef7e8', NULL, NULL, 1, NULL),
(5664, 'Fullname_1506411353.1054', '0966554433', 'Email_1506411353.1054@yahoo.com', '75c8f2cddc2ad52586b98adb18f6c749', '2017-09-26 14:35:53', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '89c7a8f53f1cc262510928f81060fdea', NULL, NULL, 1, NULL),
(5665, 'Fullname_1506411353.4204', '0966554433', 'Email_1506411353.4204@yahoo.com', '47b0a626e9921fc9547ee52fe1ded97c', '2017-09-26 14:35:53', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'cfe892452bfbc5a94691a81e991a80af', NULL, NULL, 1, NULL),
(5666, 'Fullname_1506411361.0809', '0966554433', 'Email_1506411361.0809@yahoo.com', 'cfd9b3750619aec58115eedad1ab2a46', '2017-09-26 14:36:01', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '370aa4f768daf9edd10d81fb93f52965', NULL, NULL, 1, NULL),
(5667, 'Fullname_1506411362.448', '0966554433', 'Email_1506411362.449@yahoo.com', '1659e5fc48809e8098497d51c6882224', '2017-09-26 14:36:02', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '462d1715e75c00cd36c2e7bf1f84a8ec', NULL, NULL, 1, NULL),
(5668, 'Fullname_1506411369.3893', '0966554433', 'Email_1506411369.3893@yahoo.com', 'e676eed139d241fc061b97fc8cb8a2c1', '2017-09-26 14:36:09', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd00d49610fd1799ac5e57ff9160d8d87', NULL, NULL, 1, NULL),
(5669, 'Fullname_1506411370.6054', '0966554433', 'Email_1506411370.6054@yahoo.com', '5637ea12cfe06fb347936960bb42e58a', '2017-09-26 14:36:10', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'efcf183156a3931f5d76ecf844799b69', NULL, NULL, 1, NULL),
(5670, 'Fullname_1506411376.4368', '0966554433', 'Email_1506411376.4368@yahoo.com', '05c86b96bc06d2d2e4728d7df293e6b8', '2017-09-26 14:36:16', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '3a5570c76188454e87336c8fd1beec77', NULL, NULL, 1, NULL),
(5671, 'Fullname_1506411377.0628', '0966554433', 'Email_1506411377.0628@yahoo.com', 'd7dda16766c8756d3e4aebebf1cbbeb2', '2017-09-26 14:36:17', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5ad5390ea28f9cfbc517053cde821a75', NULL, NULL, 1, NULL),
(5672, 'Fullname_1506411383.0511', '0966554433', 'Email_1506411383.0511@yahoo.com', '4125199b12c965236b69a6bfe38dddb5', '2017-09-26 14:36:23', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'ddf6e6a0abdb28151d456d571b2be690', NULL, NULL, 1, NULL),
(5673, 'Fullname_1506411384.0212', '0966554433', 'Email_1506411384.0222@yahoo.com', 'ea95b015e5affa415487ce5a0d0c9d3f', '2017-09-26 14:36:24', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '2beaf49e0ace3970e68e46e7617a84cf', NULL, NULL, 1, NULL),
(5674, 'Fullname_1506411391.3346', '0966554433', 'Email_1506411391.3346@yahoo.com', 'a3439d15bfbc552fb3adb90b8697e122', '2017-09-26 14:36:31', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5ee6642ba65ff6ad87bfc51f18c9b630', NULL, NULL, 1, NULL),
(5675, 'Fullname_1506411392.1507', '0966554433', 'Email_1506411392.1507@yahoo.com', '159404ff9e341386818c8dfe7abffee8', '2017-09-26 14:36:32', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '47a757421e5b64b56a835843227574b1', NULL, NULL, 1, NULL),
(5676, 'Fullname_1506411397.874', '0966554433', 'Email_1506411397.874@yahoo.com', '372b1232375041a0e66e7a9da9bb03d2', '2017-09-26 14:36:37', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '9a046397e8675c68eb9bb74072d0bae3', NULL, NULL, 1, NULL),
(5677, 'Fullname_1506411399.2861', '0966554433', 'Email_1506411399.2861@yahoo.com', '955e2f817baceebc3a9c99a2d58d6aba', '2017-09-26 14:36:39', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '75956de22aeb06b84a3d436e5e1113a3', NULL, NULL, 1, NULL),
(5678, 'Fullname_1506411403.4733', '0966554433', 'Email_1506411403.4733@yahoo.com', 'e9c4ab0bd8b0a2da195f9dac922400bf', '2017-09-26 14:36:43', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '03db9efa2cc224fadd6d6d980fc47783', NULL, NULL, 1, NULL),
(5679, 'Fullname_1506411404.0913', '0966554433', 'Email_1506411404.0913@yahoo.com', '3d69e2bc93a676ffa228d69102be06d8', '2017-09-26 14:36:44', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'b0d9305770247bba86a33ec0fdce9e61', NULL, NULL, 1, NULL),
(5680, 'Fullname_1506411410.4717', '0966554433', 'Email_1506411410.4717@yahoo.com', 'e51bb9a54a9adb5466b11039ad50debd', '2017-09-26 14:36:50', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '0b7c4fad66b70961a00c174989656146', NULL, NULL, 1, NULL),
(5681, 'Fullname_1506411411.3317', '0966554433', 'Email_1506411411.3317@yahoo.com', 'db8676239c82eb3e967c0995a3981d00', '2017-09-26 14:36:51', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '6cac016209b77a30f0da711e116d5e3e', NULL, NULL, 1, NULL),
(5682, 'Fullname_1506411416.122', '0966554433', 'Email_1506411416.122@yahoo.com', '5bc4960db4097f1864c4241935edbe26', '2017-09-26 14:36:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd3ca0944c96afd196cd696231d5d158f', NULL, NULL, 1, NULL),
(5683, 'Fullname_1506411416.6901', '0966554433', 'Email_1506411416.6901@yahoo.com', '5991061134c8f70f591cb4625a90d4ba', '2017-09-26 14:36:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '2984eb37a2c44413bcbb989282dbbd2e', NULL, NULL, 1, NULL),
(5684, 'Fullname_1506411422.6904', '0966554433', 'Email_1506411422.6904@yahoo.com', 'e2995718f7cc9427fae259f616b87338', '2017-09-26 14:37:02', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '0fc05dc5951481c78b200af6c1470996', NULL, NULL, 1, NULL),
(5685, 'Fullname_1506411424.0285', '0966554433', 'Email_1506411424.0285@yahoo.com', '8b3d7da3f637e699a712cc58e065ddc6', '2017-09-26 14:37:04', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'a5f1963cf19b069ee388d2692676c5d2', NULL, NULL, 1, NULL),
(5686, 'Fullname_1506411429.9798', '0966554433', 'Email_1506411429.9798@yahoo.com', '6a9aa75bba4173f2931181ec51177531', '2017-09-26 14:37:09', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '442433f1a5550c9578f075cf47df1595', NULL, NULL, 1, NULL),
(5687, 'Fullname_1506411432.722', '0966554433', 'Email_1506411432.722@yahoo.com', 'eb483af08051c0621f7bfe8e1038df25', '2017-09-26 14:37:12', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '133e61034bc82ffde122e829aea8425f', NULL, NULL, 1, NULL),
(5688, 'Fullname_1506411441.6925', '0966554433', 'Email_1506411441.6925@yahoo.com', '5bc5f84bb0c4317bab9ac6c46a71e0ab', '2017-09-26 14:37:21', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5b1ea95c1a598ffa4a5db09ce09f3e41', NULL, NULL, 1, NULL),
(5689, 'Fullname_1506411442.5535', '0966554433', 'Email_1506411442.5535@yahoo.com', '963df6d10be666f4b589ffe731a4873b', '2017-09-26 14:37:22', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '06e0744a3e4f9284a66f09ef78c5af4c', NULL, NULL, 1, NULL),
(5690, 'Fullname_1506411448.7159', '0966554433', 'Email_1506411448.7159@yahoo.com', 'ae2dbd79856286ef53525936720640d7', '2017-09-26 14:37:28', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5775c8d9236dd9545e13fbc554111007', NULL, NULL, 1, NULL),
(5691, 'Fullname_1506411449.855', '0966554433', 'Email_1506411449.855@yahoo.com', '17c9b035746273d1e1c398591b8579e1', '2017-09-26 14:37:29', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4fdbc474c80698c3d138cd391389f28e', NULL, NULL, 1, NULL),
(5692, 'Fullname_1506411454.7682', '0966554433', 'Email_1506411454.7682@yahoo.com', '142d547359782c8fe7f75af0ffd79c0f', '2017-09-26 14:37:34', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'db24d049c7e5a13ec4192adaffd7b8f5', NULL, NULL, 1, NULL),
(5693, 'Fullname_1506411457.6304', '0966554433', 'Email_1506411457.6304@yahoo.com', 'af2df3f3e04cbd7395f9fd644103d141', '2017-09-26 14:37:37', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'cbbdd6e9f47ccfc1ee4731bbee5323ff', NULL, NULL, 1, NULL),
(5694, 'Fullname_1506411462.0747', '0966554433', 'Email_1506411462.0747@yahoo.com', '24c2edf0ad3ba07fc6721df79f693891', '2017-09-26 14:37:42', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'bfc4d8f8abc5978186af9e30f2572f39', NULL, NULL, 1, NULL),
(5695, 'Fullname_1506411462.7507', '0966554433', 'Email_1506411462.7507@yahoo.com', 'bad8469db51c4002b2204d8e45f4e7cf', '2017-09-26 14:37:42', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '6be7c0dbcadeb75010141730175b4d8d', NULL, NULL, 1, NULL),
(5696, 'Fullname_1506411468.033', '0966554433', 'Email_1506411468.033@yahoo.com', 'aafc360612fc476dc164f9c947f58a27', '2017-09-26 14:37:48', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4f811000ab3e2b953b16d46454f5634b', NULL, NULL, 1, NULL),
(5697, 'Fullname_1506411469.4691', '0966554433', 'Email_1506411469.4691@yahoo.com', '7a50053f543c17c9ceb4ed0f52cf9cd4', '2017-09-26 14:37:49', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '8fa0d1e95389c5eced995cc7af2424ce', NULL, NULL, 1, NULL),
(5698, 'Fullname_1506411474.0633', '0966554433', 'Email_1506411474.0633@yahoo.com', '48e1751384400e70c93a8a3c98b43ed0', '2017-09-26 14:37:54', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '154628305bd4604124681244e8aac2bc', NULL, NULL, 1, NULL),
(5699, 'Fullname_1506411474.9474', '0966554433', 'Email_1506411474.9484@yahoo.com', 'f7770102243f7a94482f550c8ba397a7', '2017-09-26 14:37:54', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '00f29dc7fe1c821710ec21059602f420', NULL, NULL, 1, NULL),
(5700, 'Fullname_1506411481.1867', '0966554433', 'Email_1506411481.1867@yahoo.com', 'd15066fbe8a8d23739494d22af927951', '2017-09-26 14:38:01', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'a788d0a13fa925b77d1cec6f6ac2e484', NULL, NULL, 1, NULL),
(5701, 'Fullname_1506411482.2798', '0966554433', 'Email_1506411482.2798@yahoo.com', '768f5ed9f76b14eb0334b510a6718c2c', '2017-09-26 14:38:02', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '17f44c8b942bc64b5082f614c73f1506', NULL, NULL, 1, NULL),
(5702, 'Fullname_1506411487.0371', '0966554433', 'Email_1506411487.0371@yahoo.com', 'aeac07b6cd5bd46af1029a9fa760f932', '2017-09-26 14:38:07', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'bd24d02ea25753134bb94b0893938d6c', NULL, NULL, 1, NULL),
(5703, 'Fullname_1506411487.8141', '0966554433', 'Email_1506411487.8141@yahoo.com', 'fd45e99994039ff63ffc40c558bb5cda', '2017-09-26 14:38:07', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '7e3e5932d4ad2b99b2cf39d9a0bf83d2', NULL, NULL, 1, NULL),
(5704, 'Fullname_1506411493.5655', '0966554433', 'Email_1506411493.5655@yahoo.com', '752ecab2a9eb60690a9da9fb1030c557', '2017-09-26 14:38:13', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'afbf2d07320a03fbd3fe69e07eb1aac2', NULL, NULL, 1, NULL),
(5705, 'Fullname_1506411494.2015', '0966554433', 'Email_1506411494.2015@yahoo.com', 'eaaa706ef32e44f43362b538720081d0', '2017-09-26 14:38:14', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '28480ca6e3b7b57f681aecc7b0ab4db8', NULL, NULL, 1, NULL),
(5706, 'Fullname_1506411498.8638', '0966554433', 'Email_1506411498.8638@yahoo.com', '72345258272d57f025783fa8f259cd41', '2017-09-26 14:38:18', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '3d6f49ac22d710b9e05e26e30328fdf9', NULL, NULL, 1, NULL),
(5707, 'Fullname_1506411499.5648', '0966554433', 'Email_1506411499.5648@yahoo.com', '7bdb3a306bfbba6b33a2ac3436afe315', '2017-09-26 14:38:19', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c271f2af2bc8ce1100f53ebe455bc71e', NULL, NULL, 1, NULL),
(5708, 'Fullname_1506411505.9772', '0966554433', 'Email_1506411505.9782@yahoo.com', '816a88a2b9f9f2b008308f73b6b47e54', '2017-09-26 14:38:25', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'daba42c0c6abdafe7c6c2b80f89a82f7', NULL, NULL, 1, NULL),
(5709, 'Fullname_1506411506.8902', '0966554433', 'Email_1506411506.8902@yahoo.com', '87198f797f687adddeb03968e35c6c79', '2017-09-26 14:38:26', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '9e36f0639c812a4be232d1238f67b6d3', NULL, NULL, 1, NULL),
(5710, 'Fullname_1506411512.3545', '0966554433', 'Email_1506411512.3545@yahoo.com', 'a62387d4163baec481e0cf8f19afc568', '2017-09-26 14:38:32', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '17f73c3eab07ae6f641d9afc6f9f77a0', NULL, NULL, 1, NULL),
(5711, 'Fullname_1506411513.0206', '0966554433', 'Email_1506411513.0206@yahoo.com', '32f420fe4303b17eb10c5d78c693c779', '2017-09-26 14:38:33', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'bc5ac0850565e35b76a1dd4798df0bfa', NULL, NULL, 1, NULL),
(5712, 'Fullname_1506411519.6639', '0966554433', 'Email_1506411519.6649@yahoo.com', 'f2174587af0b15fb40d47d5f54b38d59', '2017-09-26 14:38:39', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'a6c8a13df21d8dba6b963219416ddfa2', NULL, NULL, 1, NULL),
(5713, 'Fullname_1506411520.345', '0966554433', 'Email_1506411520.345@yahoo.com', '26f64028bce56303583240265fbe39ec', '2017-09-26 14:38:40', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '72b5bf573cc929e0e4a0ef476a764aec', NULL, NULL, 1, NULL),
(5714, 'Fullname_1506411525.8843', '0966554433', 'Email_1506411525.8843@yahoo.com', 'd33eca251836dc4ebf9c84ad46d32370', '2017-09-26 14:38:45', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '032379373e912522b83c1014f8b6ce78', NULL, NULL, 1, NULL),
(5715, 'Fullname_1506411526.5143', '0966554433', 'Email_1506411526.5143@yahoo.com', '6ae4d7ad6d38675b2dd5be6f4634b9f1', '2017-09-26 14:38:46', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '07cf66756aa28e85baa82a91fbc5c7d5', NULL, NULL, 1, NULL),
(5716, 'Fullname_1506411531.2016', '0966554433', 'Email_1506411531.2016@yahoo.com', 'cd3125691bdf4a0e886f26fed65bf5a7', '2017-09-26 14:38:51', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '049822e4d2eb37b30f5c2c99fa738920', NULL, NULL, 1, NULL),
(5717, 'Fullname_1506411532.1527', '0966554433', 'Email_1506411532.1527@yahoo.com', '76394d5e00312ec4086e9ddf5ef2c16e', '2017-09-26 14:38:52', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '83bc15e5769bb6f4f03041c831dde4e8', NULL, NULL, 1, NULL),
(5718, 'Fullname_1506411536.5529', '0966554433', 'Email_1506411536.5529@yahoo.com', 'db7dd4937c50b40d0c2408b3407288ad', '2017-09-26 14:38:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '3aa8452839dd17361b3a5247a87507da', NULL, NULL, 1, NULL),
(5719, 'Fullname_1506411537.415', '0966554433', 'Email_1506411537.415@yahoo.com', 'f84c235e99883dfe4036c0ae93c661cb', '2017-09-26 14:38:57', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '1e04df0dab42dbc59b553a056e6a86ec', NULL, NULL, 1, NULL),
(5720, 'Fullname_1506411542.5063', '0966554433', 'Email_1506411542.5063@yahoo.com', '5554325fec6dccb4a41fd62a9e5eecc9', '2017-09-26 14:39:02', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'f5910390215b3e39ba7e57ff66c49ede', NULL, NULL, 1, NULL),
(5721, 'Fullname_1506411543.0103', '0966554433', 'Email_1506411543.0103@yahoo.com', '2897e3ab69edd2ea39743f639e41b92a', '2017-09-26 14:39:03', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '61483ce0ee6095db0f33b987a7fcae94', NULL, NULL, 1, NULL),
(5722, 'Fullname_1506411547.5845', '0966554433', 'Email_1506411547.5845@yahoo.com', 'b20bb939f43b660cf5366962c20cc0b5', '2017-09-26 14:39:07', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '77196a7bc2db8f38a87f35d08bdd95b0', NULL, NULL, 1, NULL),
(5723, 'Fullname_1506411548.7156', '0966554433', 'Email_1506411548.7156@yahoo.com', 'c645e2e92e06f9f64c32296ca93f54c2', '2017-09-26 14:39:08', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '63189506af3e1aa3ba38b2e448884af6', NULL, NULL, 1, NULL),
(5724, 'Fullname_1506411553.6859', '0966554433', 'Email_1506411553.6859@yahoo.com', '0fbe4900a04540b857f01a4956deec70', '2017-09-26 14:39:13', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'bdfdfafae3e0fe923e6516d5eab005b1', NULL, NULL, 1, NULL),
(5725, 'Fullname_1506411554.3809', '0966554433', 'Email_1506411554.3809@yahoo.com', '764149676b4824dd1d10ca7b704d4698', '2017-09-26 14:39:14', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '86c5235d13d27dede689356d2f190600', NULL, NULL, 1, NULL),
(5726, 'Fullname_1506411559.3362', '0966554433', 'Email_1506411559.3362@yahoo.com', 'd8764e035743d4f0aa8a046b8b78ec1f', '2017-09-26 14:39:19', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e63cedca76448817138a89ca671709de', NULL, NULL, 1, NULL),
(5727, 'Fullname_1506411560.1403', '0966554433', 'Email_1506411560.1403@yahoo.com', 'd08c0517c78dba642d20097c425b6b11', '2017-09-26 14:39:20', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '7d4f3f94aaf787086a0ca248cb3f63c6', NULL, NULL, 1, NULL),
(5728, 'Fullname_1506411565.0985', '0966554433', 'Email_1506411565.0995@yahoo.com', 'e0552af8f6ec8cdd9bf0ac51f3a7bf3f', '2017-09-26 14:39:25', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '1f8ac46e07d4b9b7e0c46dd311bd9bf6', NULL, NULL, 1, NULL),
(5729, 'Fullname_1506411566.6546', '0966554433', 'Email_1506411566.6546@yahoo.com', '07e162c4a4384d900dbdfa1b1fcd73dc', '2017-09-26 14:39:26', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd1ea4864cb15f429c940590c36c0667c', NULL, NULL, 1, NULL),
(5730, 'Fullname_1506411571.3389', '0966554433', 'Email_1506411571.3389@yahoo.com', '6d04a1e3cec82d5de4ad836f57005c5d', '2017-09-26 14:39:31', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'cc814706538d8e100c204cc962d68077', NULL, NULL, 1, NULL),
(5731, 'Fullname_1506411572.351', '0966554433', 'Email_1506411572.352@yahoo.com', '19ef6953db5bf9491b3aa92ec4ad2157', '2017-09-26 14:39:32', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '7bc0b9b0d8452026f6a8d197a20eb917', NULL, NULL, 1, NULL),
(5732, 'Fullname_1506411576.8212', '0966554433', 'Email_1506411576.8212@yahoo.com', '6f1eb202a53018fab1a6e006b4ed49ad', '2017-09-26 14:39:36', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5ccc0bda105899d7866956e56774e068', NULL, NULL, 1, NULL),
(5733, 'Fullname_1506411577.5443', '0966554433', 'Email_1506411577.5443@yahoo.com', 'aadc732f5c30e91d5bd7f589d34accd8', '2017-09-26 14:39:37', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '2c8b8999a26e018f173e58afcd98cfc0', NULL, NULL, 1, NULL),
(5734, 'Fullname_1506411581.2955', '0966554433', 'Email_1506411581.2955@yahoo.com', 'ce8e97e74af6e32444f2a91c900d5bfb', '2017-09-26 14:39:41', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd1e2bae582e6d8c174b596ab884ecae9', NULL, NULL, 1, NULL),
(5735, 'Fullname_1506411582.1055', '0966554433', 'Email_1506411582.1055@yahoo.com', '250f1de7a11eaac61fca0569d5249cf1', '2017-09-26 14:39:42', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c95615ca1f7d5e41d35096027ef933da', NULL, NULL, 1, NULL),
(5736, 'Fullname_1506411587.2098', '0966554433', 'Email_1506411587.2108@yahoo.com', 'eb5241b2eee77a5e50c76b4a4ae3c167', '2017-09-26 14:39:47', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '600d0def9293705aff1ada98260fdeab', NULL, NULL, 1, NULL),
(5737, 'Fullname_1506411588.0579', '0966554433', 'Email_1506411588.0579@yahoo.com', 'bc5be6cb7fb2d8b429f59f8a3e4eb010', '2017-09-26 14:39:48', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '2562dd1db80ac5046c3a63d7d178d63f', NULL, NULL, 1, NULL),
(5738, 'Fullname_1506411591.432', '0966554433', 'Email_1506411591.432@yahoo.com', 'd124fc3a6a8dd70dbc48934947a2f1aa', '2017-09-26 14:39:51', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'f99e6dbca01c947d2a8045f9abb84656', NULL, NULL, 1, NULL),
(5739, 'Fullname_1506411592.3141', '0966554433', 'Email_1506411592.3151@yahoo.com', '99a70128cdde5a370f7668218a5b1dd5', '2017-09-26 14:39:52', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4ff529f1f865d8ab6a8919933155819b', NULL, NULL, 1, NULL),
(5740, 'Fullname_1506411598.1054', '0966554433', 'Email_1506411598.1054@yahoo.com', 'a8cbeb5942ca2355d96c6b773e7aabe8', '2017-09-26 14:39:58', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'bff562afc1f318a0ea5b4cf1eb9973d2', NULL, NULL, 1, NULL),
(5741, 'Fullname_1506411600.0585', '0966554433', 'Email_1506411600.0585@yahoo.com', 'e72a8a3004a882cd690bf5b8d50e2423', '2017-09-26 14:40:00', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '97161acd99329551e30bb0031b96e41f', NULL, NULL, 1, NULL),
(5742, 'Fullname_1506411603.3407', '0966554433', 'Email_1506411603.3407@yahoo.com', 'b5396b0573a76d0080a9260a775fa2d9', '2017-09-26 14:40:03', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e9b746bc67373912acae883bac24007c', NULL, NULL, 1, NULL),
(5743, 'Fullname_1506411605.0448', '0966554433', 'Email_1506411605.0448@yahoo.com', 'da9a2d297cef9535ee1eb27c5540db54', '2017-09-26 14:40:05', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '055a98bfe4a0543383d36f41803374fd', NULL, NULL, 1, NULL),
(5744, 'Fullname_1506411609.3901', '0966554433', 'Email_1506411609.3901@yahoo.com', '6bae0d75bf6f89958d670fd689f72bdb', '2017-09-26 14:40:09', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'e8294083e3305345a31d047aecbac6ff', NULL, NULL, 1, NULL),
(5745, 'Fullname_1506411610.8212', '0966554433', 'Email_1506411610.8212@yahoo.com', '77128a32497cec64df2a8fe69a199191', '2017-09-26 14:40:10', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '3f58ccbec4b744e186f7ca536875c52f', NULL, NULL, 1, NULL),
(5746, 'Fullname_1506411615.3504', '0966554433', 'Email_1506411615.3514@yahoo.com', 'c82d581ca103f3696c5cce22286563ca', '2017-09-26 14:40:15', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5ff84362628810cf92a6c7ecf2f57fe1', NULL, NULL, 1, NULL),
(5747, 'Fullname_1506411616.4705', '0966554433', 'Email_1506411616.4705@yahoo.com', '11c2b4f90d17584bfcf83958420dd73f', '2017-09-26 14:40:16', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c4f107bad27ca98acb6f9399b8aabf9b', NULL, NULL, 1, NULL),
(5748, 'Fullname_1506411622.3308', '0966554433', 'Email_1506411622.3308@yahoo.com', '30788a20d56236083a67a4bbad9ca99e', '2017-09-26 14:40:22', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'df547e3b538f9a888ca545c069a950e4', NULL, NULL, 1, NULL),
(5749, 'Fullname_1506411623.8389', '0966554433', 'Email_1506411623.8399@yahoo.com', 'd2054be40c3d4dababc541f3a89d384f', '2017-09-26 14:40:23', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '2e6086eda623c7cfffade63bed0f444a', NULL, NULL, 1, NULL),
(5750, 'Fullname_1506411627.3771', '0966554433', 'Email_1506411627.3771@yahoo.com', '54a767ec586c294707ed1ce2635d542e', '2017-09-26 14:40:27', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '1b5940ba109dd83c89e4a37a0f8f8ca0', NULL, NULL, 1, NULL),
(5751, 'Fullname_1506411629.4412', '0966554433', 'Email_1506411629.4412@yahoo.com', '70095a340468b113a4e464f64086d7eb', '2017-09-26 14:40:29', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c60b7203ba90c524a133f16a817c095c', NULL, NULL, 1, NULL),
(5752, 'Fullname_1506411634.6805', '0966554433', 'Email_1506411634.6805@yahoo.com', 'cd71a4e3a41d818d9405e5e35a1f6acc', '2017-09-26 14:40:34', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '0ccb5ca7367f0f99d65a3daa757f67a9', NULL, NULL, 1, NULL),
(5753, 'Fullname_1506411636.4196', '0966554433', 'Email_1506411636.4196@yahoo.com', '75c583a77994963cd2ffdfdc5b627408', '2017-09-26 14:40:36', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'f91a0d182b6b33e276fc57eccc9fa8e9', NULL, NULL, 1, NULL),
(5754, 'Fullname_1506411642.0239', '0966554433', 'Email_1506411642.0239@yahoo.com', 'ae31249d20352b020a6bcda042663184', '2017-09-26 14:40:42', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c83fde88af7c516e55c3aae0810db646', NULL, NULL, 1, NULL),
(5755, 'Fullname_1506411644.3991', '0966554433', 'Email_1506411644.3991@yahoo.com', '0700ed5898e0fbe89cbe17c72c53ec90', '2017-09-26 14:40:44', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '1016b5ea4b553f819f7f1d107247d606', NULL, NULL, 1, NULL),
(5756, 'Fullname_1506411650.1834', '0966554433', 'Email_1506411650.1834@yahoo.com', 'cbdd7d5a342950f73935a303b75acb34', '2017-09-26 14:40:50', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c4b6ea118a51c0fc98aabe099428a331', NULL, NULL, 1, NULL),
(5757, 'Fullname_1506411651.0695', '0966554433', 'Email_1506411651.0695@yahoo.com', '874ca24d29ecf43b8f7dc41d410e4d34', '2017-09-26 14:40:51', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c568dcd4753be65a57bc830cf6ef3221', NULL, NULL, 1, NULL),
(5758, 'Fullname_1506411656.6238', '0966554433', 'Email_1506411656.6238@yahoo.com', '31f11a4a1bd1a574112c542402207180', '2017-09-26 14:40:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd40c4512a175a4619a2987c49e38f205', NULL, NULL, 1, NULL),
(5759, 'Fullname_1506411657.8979', '0966554433', 'Email_1506411657.8979@yahoo.com', '86a66eb8b8d0142d9ef226563cb00d5e', '2017-09-26 14:40:57', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'dcd9465f4eb9cfc044f17913d525e70d', NULL, NULL, 1, NULL),
(5760, 'Fullname_1506411663.4892', '0966554433', 'Email_1506411663.4892@yahoo.com', '29bc17e591c69c18adadf3a44be542c7', '2017-09-26 14:41:03', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '963aa04fa21891e9357eba9273812850', NULL, NULL, 1, NULL),
(5761, 'Fullname_1506411664.5262', '0966554433', 'Email_1506411664.5262@yahoo.com', 'ceab295de60dae9a073e194ce7910297', '2017-09-26 14:41:04', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '4442a24384e2684ad996a4f053254f2e', NULL, NULL, 1, NULL),
(5762, 'Fullname_1506411670.2806', '0966554433', 'Email_1506411670.2806@yahoo.com', 'b7326901c4d9a7496313d55041f9f402', '2017-09-26 14:41:10', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd4447edabb984ce510b059ad524f59e0', NULL, NULL, 1, NULL),
(5763, 'Fullname_1506411671.6716', '0966554433', 'Email_1506411671.6716@yahoo.com', 'c9ef083151cfe42d92db2cb789bc6c37', '2017-09-26 14:41:11', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '352bc85f5b16b22316ffed3467ed640b', NULL, NULL, 1, NULL),
(5764, 'Fullname_1506411675.5359', '0966554433', 'Email_1506411675.5359@yahoo.com', '6a9aca7a89f53a70be0f35ddf2f7d198', '2017-09-26 14:41:15', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '3200ea46d5a141fa48502225d2b8c0ce', NULL, NULL, 1, NULL),
(5765, 'Fullname_1506411676.9089', '0966554433', 'Email_1506411676.9089@yahoo.com', 'bb9811ff10fab9b9eb0b39b139b640c3', '2017-09-26 14:41:16', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '293243fc0b534dee3beb8beac6e42db8', NULL, NULL, 1, NULL),
(5766, 'Fullname_1506411681.9832', '0966554433', 'Email_1506411681.9832@yahoo.com', '72846cf770d5852b9019cd6c55a737f3', '2017-09-26 14:41:21', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd7f57957d95ac6259e84d4577e463648', NULL, NULL, 1, NULL),
(5767, 'Fullname_1506411683.6603', '0966554433', 'Email_1506411683.6603@yahoo.com', '669e118a0c66ac92153565b819e3d848', '2017-09-26 14:41:23', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '0614f876c34842d6e454737da1925c2c', NULL, NULL, 1, NULL),
(5768, 'Fullname_1506411686.9895', '0966554433', 'Email_1506411686.9895@yahoo.com', '1a40600953a0241e379b21cd006d0baf', '2017-09-26 14:41:26', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '3617a1ed1e7e1a88fbceffc7b9a27ad6', NULL, NULL, 1, NULL),
(5769, 'Fullname_1506411688.7376', '0966554433', 'Email_1506411688.7376@yahoo.com', '6a4b85f9374daadb7904bd9c9eda3b25', '2017-09-26 14:41:28', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'd22977e3ea84a5cff7fea2c6449a0f3a', NULL, NULL, 1, NULL),
(5770, 'Fullname_1506411694.899', '0966554433', 'Email_1506411694.899@yahoo.com', '1962af28698fced879807eb422811497', '2017-09-26 14:41:34', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '2f6939bf2bdf91c7c967532080af3466', NULL, NULL, 1, NULL),
(5771, 'Fullname_1506411696.3561', '0966554433', 'Email_1506411696.3561@yahoo.com', '641d627afb6208923dd59de5e6245044', '2017-09-26 14:41:36', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', 'c3fcdcd894e3b0aed9920d5f07e09a98', NULL, NULL, 1, NULL),
(5772, 'Fullname_1506411701.9394', '0966554433', 'Email_1506411701.9394@yahoo.com', 'b1886598c1fcec4975590d9b4d0a466c', '2017-09-26 14:41:41', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '23ee29355a9b4342a2229e9fcc1bfed3', NULL, NULL, 1, NULL),
(5773, 'Fullname_1506411704.2525', '0966554433', 'Email_1506411704.2525@yahoo.com', '2147688e3d72ee68bdecaaba7be99437', '2017-09-26 14:41:44', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '14223dccf3a0340831893e236bb5bdba', NULL, NULL, 1, NULL),
(5774, 'Fullname_1506411709.9998', '0966554433', 'Email_1506411709.9998@yahoo.com', 'c557c2e1acf800490f328b1f18a29526', '2017-09-26 14:41:49', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '013d04ba61af648f7f737aa668a467dc', NULL, NULL, 1, NULL),
(5775, 'Fullname_1506411710.9699', '0966554433', 'Email_1506411710.9699@yahoo.com', '5ffa2e541c2f56c5be229d5530e9775d', '2017-09-26 14:41:50', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '9f7e4de3b6f533e2fe14c88944bf0518', NULL, NULL, 1, NULL),
(5776, 'Fullname_1506411716.2312', '0966554433', 'Email_1506411716.2312@yahoo.com', 'db97e800e072e988fcba4fbff34d21e4', '2017-09-26 14:41:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '959564edf257e2ca264b87ef29d42f7e', NULL, NULL, 1, NULL),
(5777, 'Fullname_1506411716.9842', '0966554433', 'Email_1506411716.9842@yahoo.com', 'de1a282c16eaf10269153a1b0a053b97', '2017-09-26 14:41:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '5cf0194b84ec383fe3d04cfe05b70802', NULL, NULL, 1, NULL);
INSERT INTO `users` (`users_id`, `users_fullname`, `users_phone`, `users_email`, `users_password`, `users_registered`, `users_status`, `users_picture`, `users_salt`, `users_login_time`, `users_user_agent`, `group_users_id`, `users_forget_request_key`) VALUES
(5778, 'Fullname_1506411722.4185', '0966554433', 'Email_1506411722.4185@yahoo.com', '8ac683d95c0d0191f60e4b98a911ae4e', '2017-09-26 14:42:02', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '6288d06c59734908da91a3c549aa22a1', NULL, NULL, 1, NULL),
(5779, 'Fullname_1506411723.9846', '0966554433', 'Email_1506411723.9846@yahoo.com', '9a6a5f559e6f5a33c8989e7a1538ea17', '2017-09-26 14:42:03', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '1d75c97c58bcce17b9bf4eb12a435da9', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_group_acl`
-- (See below for the actual view)
--
CREATE TABLE `view_group_acl` (
`group_acl_id` smallint(6)
,`acl_id` smallint(6)
,`group_users_id` smallint(6)
,`group_acl_status` tinyint(4)
,`acl_name` varchar(30)
,`acl_module` varchar(20)
,`acl_controller` varchar(20)
,`acl_action` varchar(20)
,`acl_status` tinyint(4)
,`acl_parent` smallint(6)
,`group_users_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_group_menu`
-- (See below for the actual view)
--
CREATE TABLE `view_group_menu` (
`group_menu_id` smallint(6)
,`group_users_id` smallint(6)
,`menu_id` smallint(6)
,`group_menu_status` tinyint(4)
,`menu_name` varchar(50)
,`menu_parent` smallint(6)
,`menu_url` varchar(255)
,`menu_icon` varchar(20)
,`menu_position` tinyint(4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_navigation`
-- (See below for the actual view)
--
CREATE TABLE `view_navigation` (
`navigation_id` tinyint(4)
,`navigation_name` varchar(50)
,`navigation_parent` tinyint(4)
,`navigation_status` tinyint(4)
,`navigation_url_id` bigint(4)
,`navigation_position` tinyint(4)
,`group_navigation_id` tinyint(4)
,`navigation_type` tinyint(4)
,`navigation_url_name` varchar(255)
,`group_navigation_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_post`
-- (See below for the actual view)
--
CREATE TABLE `view_post` (
`post_id` smallint(6)
,`post_title` varchar(255)
,`post_quote` text
,`post_body` longtext
,`post_picture` varchar(255)
,`post_date_created` datetime
,`post_date_updated` datetime
,`post_users_created` smallint(6)
,`post_type` tinyint(4)
,`post_status` tinyint(4)
,`post_users_updated` smallint(6)
,`post_view` smallint(6)
,`post_tag` varchar(255)
,`post_category_id` smallint(6)
,`users_fullname` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_post_category_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_post_category_detail` (
`post_category_detail_id` smallint(6)
,`post_id` smallint(6)
,`post_category_id` smallint(6)
,`post_category_name` varchar(50)
,`post_category_parent` smallint(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product`
-- (See below for the actual view)
--
CREATE TABLE `view_product` (
`product_id` smallint(6)
,`product_name` varchar(255)
,`product_body` longtext
,`product_picture` varchar(255)
,`product_date_created` datetime
,`product_date_updated` datetime
,`product_users_created` smallint(6)
,`product_status` tinyint(4)
,`product_users_updated` smallint(6)
,`product_view` smallint(6)
,`product_category_id` smallint(6)
,`users_fullname` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product_category_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_product_category_detail` (
`product_category_detail_id` smallint(6)
,`product_id` bigint(20)
,`product_category_id` smallint(6)
,`product_category_name` varchar(50)
,`product_category_parent` smallint(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_users`
-- (See below for the actual view)
--
CREATE TABLE `view_users` (
`users_id` smallint(6)
,`users_fullname` varchar(50)
,`users_phone` varchar(12)
,`users_email` varchar(50)
,`users_password` varchar(100)
,`users_registered` datetime
,`users_status` tinyint(1)
,`users_picture` varchar(50)
,`users_salt` varchar(100)
,`users_login_time` datetime
,`users_user_agent` text
,`group_users_id` smallint(6)
,`users_forget_request_key` varchar(100)
,`group_users_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `website_email`
--

CREATE TABLE `website_email` (
  `website_email_id` tinyint(4) NOT NULL,
  `website_email_system_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_host` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_port` smallint(6) DEFAULT NULL,
  `website_email_system_username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_ssl` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_primary_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_from` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_from_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `website_email`
--

INSERT INTO `website_email` (`website_email_id`, `website_email_system_name`, `website_email_system_host`, `website_email_system_port`, `website_email_system_username`, `website_email_system_password`, `website_email_system_ssl`, `website_email_primary_email`, `website_email_from`, `website_email_from_name`) VALUES
(1, 'localhost.localdomain', 'smtp.googlemail.com', 465, 'anhtuan150787.4@gmail.com', 'smqboefvodhhdpxx', 'ssl', 'anhtuan150787@gmail.com', 'anhtuan150787@gmail.com', 'LifeDeco');

-- --------------------------------------------------------

--
-- Table structure for table `website_general`
--

CREATE TABLE `website_general` (
  `website_general_id` tinyint(4) NOT NULL,
  `website_general_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_general_keyword` text COLLATE utf8_unicode_ci,
  `website_general_description` text COLLATE utf8_unicode_ci,
  `website_general_favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `website_general`
--

INSERT INTO `website_general` (`website_general_id`, `website_general_title`, `website_general_keyword`, `website_general_description`, `website_general_favicon`) VALUES
(1, 'LifeDeco', 'LifeDeco', 'LifeDeco', 'favicon_1519203656.2327_logo_lifedeco.png');

-- --------------------------------------------------------

--
-- Structure for view `view_group_acl`
--
DROP TABLE IF EXISTS `view_group_acl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_group_acl`  AS  select `group_acl`.`group_acl_id` AS `group_acl_id`,`group_acl`.`acl_id` AS `acl_id`,`group_acl`.`group_users_id` AS `group_users_id`,`group_acl`.`group_acl_status` AS `group_acl_status`,`acl`.`acl_name` AS `acl_name`,`acl`.`acl_module` AS `acl_module`,`acl`.`acl_controller` AS `acl_controller`,`acl`.`acl_action` AS `acl_action`,`acl`.`acl_status` AS `acl_status`,`acl`.`acl_parent` AS `acl_parent`,`group_users`.`group_users_name` AS `group_users_name` from ((`group_acl` left join `acl` on((`group_acl`.`acl_id` = `acl`.`acl_id`))) left join `group_users` on((`group_users`.`group_users_id` = `group_acl`.`group_users_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_group_menu`
--
DROP TABLE IF EXISTS `view_group_menu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_group_menu`  AS  select `gm`.`group_menu_id` AS `group_menu_id`,`gm`.`group_users_id` AS `group_users_id`,`gm`.`menu_id` AS `menu_id`,`gm`.`group_menu_status` AS `group_menu_status`,`m`.`menu_name` AS `menu_name`,`m`.`menu_parent` AS `menu_parent`,`m`.`menu_url` AS `menu_url`,`m`.`menu_icon` AS `menu_icon`,`m`.`menu_position` AS `menu_position` from (`group_menu` `gm` left join `menu` `m` on((`gm`.`menu_id` = `m`.`menu_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_navigation`
--
DROP TABLE IF EXISTS `view_navigation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_navigation`  AS  select `navigation`.`navigation_id` AS `navigation_id`,`navigation`.`navigation_name` AS `navigation_name`,`navigation`.`navigation_parent` AS `navigation_parent`,`navigation`.`navigation_status` AS `navigation_status`,`navigation`.`navigation_url_id` AS `navigation_url_id`,`navigation`.`navigation_position` AS `navigation_position`,`navigation`.`group_navigation_id` AS `group_navigation_id`,`navigation`.`navigation_type` AS `navigation_type`,`navigation`.`navigation_url_name` AS `navigation_url_name`,`group_navigation`.`group_navigation_name` AS `group_navigation_name` from (`navigation` left join `group_navigation` on((`group_navigation`.`group_navigation_id` = `navigation`.`group_navigation_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_post`
--
DROP TABLE IF EXISTS `view_post`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_post`  AS  select `post`.`post_id` AS `post_id`,`post`.`post_title` AS `post_title`,`post`.`post_quote` AS `post_quote`,`post`.`post_body` AS `post_body`,`post`.`post_picture` AS `post_picture`,`post`.`post_date_created` AS `post_date_created`,`post`.`post_date_updated` AS `post_date_updated`,`post`.`post_users_created` AS `post_users_created`,`post`.`post_type` AS `post_type`,`post`.`post_status` AS `post_status`,`post`.`post_users_updated` AS `post_users_updated`,`post`.`post_view` AS `post_view`,`post`.`post_tag` AS `post_tag`,`post`.`post_category_id` AS `post_category_id`,`users`.`users_fullname` AS `users_fullname` from (`post` left join `users` on((`users`.`users_id` = `post`.`post_users_updated`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_post_category_detail`
--
DROP TABLE IF EXISTS `view_post_category_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_post_category_detail`  AS  select `post_category_detail`.`post_category_detail_id` AS `post_category_detail_id`,`post_category_detail`.`post_id` AS `post_id`,`post_category_detail`.`post_category_id` AS `post_category_id`,`post_category`.`post_category_name` AS `post_category_name`,`post_category`.`post_category_parent` AS `post_category_parent` from (`post_category_detail` left join `post_category` on((`post_category`.`post_category_id` = `post_category_detail`.`post_category_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_product`
--
DROP TABLE IF EXISTS `view_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product`  AS  select `product`.`product_id` AS `product_id`,`product`.`product_name` AS `product_name`,`product`.`product_body` AS `product_body`,`product`.`product_picture` AS `product_picture`,`product`.`product_date_created` AS `product_date_created`,`product`.`product_date_updated` AS `product_date_updated`,`product`.`product_users_created` AS `product_users_created`,`product`.`product_status` AS `product_status`,`product`.`product_users_updated` AS `product_users_updated`,`product`.`product_view` AS `product_view`,`product`.`product_category_id` AS `product_category_id`,`users`.`users_fullname` AS `users_fullname` from (`product` left join `users` on((`users`.`users_id` = `product`.`product_users_updated`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_product_category_detail`
--
DROP TABLE IF EXISTS `view_product_category_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_category_detail`  AS  select `product_category_detail`.`product_category_detail_id` AS `product_category_detail_id`,`product_category_detail`.`product_id` AS `product_id`,`product_category_detail`.`product_category_id` AS `product_category_id`,`product_category`.`product_category_name` AS `product_category_name`,`product_category`.`product_category_parent` AS `product_category_parent` from (`product_category_detail` left join `product_category` on((`product_category`.`product_category_id` = `product_category_detail`.`product_category_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_users`
--
DROP TABLE IF EXISTS `view_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_users`  AS  select `users`.`users_id` AS `users_id`,`users`.`users_fullname` AS `users_fullname`,`users`.`users_phone` AS `users_phone`,`users`.`users_email` AS `users_email`,`users`.`users_password` AS `users_password`,`users`.`users_registered` AS `users_registered`,`users`.`users_status` AS `users_status`,`users`.`users_picture` AS `users_picture`,`users`.`users_salt` AS `users_salt`,`users`.`users_login_time` AS `users_login_time`,`users`.`users_user_agent` AS `users_user_agent`,`users`.`group_users_id` AS `group_users_id`,`users`.`users_forget_request_key` AS `users_forget_request_key`,`group_users`.`group_users_name` AS `group_users_name` from (`users` left join `group_users` on((`group_users`.`group_users_id` = `users`.`group_users_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`acl_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `group_acl`
--
ALTER TABLE `group_acl`
  ADD PRIMARY KEY (`group_acl_id`);

--
-- Indexes for table `group_menu`
--
ALTER TABLE `group_menu`
  ADD PRIMARY KEY (`group_menu_id`);

--
-- Indexes for table `group_navigation`
--
ALTER TABLE `group_navigation`
  ADD PRIMARY KEY (`group_navigation_id`);

--
-- Indexes for table `group_property`
--
ALTER TABLE `group_property`
  ADD PRIMARY KEY (`group_property_id`);

--
-- Indexes for table `group_property_detail`
--
ALTER TABLE `group_property_detail`
  ADD PRIMARY KEY (`group_property_detail_id`);

--
-- Indexes for table `group_template`
--
ALTER TABLE `group_template`
  ADD PRIMARY KEY (`group_template_id`);

--
-- Indexes for table `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`group_users_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`navigation_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`post_category_id`);

--
-- Indexes for table `post_category_detail`
--
ALTER TABLE `post_category_detail`
  ADD PRIMARY KEY (`post_category_detail_id`),
  ADD KEY `index_post_category_detail` (`post_id`,`post_category_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `product_category_detail`
--
ALTER TABLE `product_category_detail`
  ADD PRIMARY KEY (`product_category_detail_id`),
  ADD KEY `index_product_category_detail` (`product_id`,`product_category_id`);

--
-- Indexes for table `product_picture`
--
ALTER TABLE `product_picture`
  ADD PRIMARY KEY (`product_picture_id`);

--
-- Indexes for table `product_property`
--
ALTER TABLE `product_property`
  ADD PRIMARY KEY (`product_property_id`);

--
-- Indexes for table `product_property_detail`
--
ALTER TABLE `product_property_detail`
  ADD PRIMARY KEY (`product_property_detail_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`);

--
-- Indexes for table `property_detail`
--
ALTER TABLE `property_detail`
  ADD PRIMARY KEY (`property_detail_id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`,`users_email`);

--
-- Indexes for table `website_email`
--
ALTER TABLE `website_email`
  ADD PRIMARY KEY (`website_email_id`);

--
-- Indexes for table `website_general`
--
ALTER TABLE `website_general`
  ADD PRIMARY KEY (`website_general_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `acl_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `group_acl`
--
ALTER TABLE `group_acl`
  MODIFY `group_acl_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9490;

--
-- AUTO_INCREMENT for table `group_menu`
--
ALTER TABLE `group_menu`
  MODIFY `group_menu_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3978;

--
-- AUTO_INCREMENT for table `group_navigation`
--
ALTER TABLE `group_navigation`
  MODIFY `group_navigation_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `group_property`
--
ALTER TABLE `group_property`
  MODIFY `group_property_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group_property_detail`
--
ALTER TABLE `group_property_detail`
  MODIFY `group_property_detail_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group_template`
--
ALTER TABLE `group_template`
  MODIFY `group_template_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `group_users`
--
ALTER TABLE `group_users`
  MODIFY `group_users_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `navigation_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `post_category_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_category_detail`
--
ALTER TABLE `post_category_detail`
  MODIFY `post_category_detail_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_category_detail`
--
ALTER TABLE `product_category_detail`
  MODIFY `product_category_detail_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_picture`
--
ALTER TABLE `product_picture`
  MODIFY `product_picture_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `product_property`
--
ALTER TABLE `product_property`
  MODIFY `product_property_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_property_detail`
--
ALTER TABLE `product_property_detail`
  MODIFY `product_property_detail_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_detail`
--
ALTER TABLE `property_detail`
  MODIFY `property_detail_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `template_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5780;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
