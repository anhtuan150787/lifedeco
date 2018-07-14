-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2018 at 05:21 AM
-- Server version: 5.1.73
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lifedeco`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE IF NOT EXISTS `acl` (
  `acl_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `acl_module` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_controller` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_action` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_status` tinyint(4) NOT NULL,
  `acl_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `acl_parent` smallint(6) NOT NULL,
  PRIMARY KEY (`acl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=195 ;

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
DROP TRIGGER IF EXISTS `AFTER_DELETE_ACL`;
DELIMITER //
CREATE TRIGGER `AFTER_DELETE_ACL` AFTER DELETE ON `acl`
 FOR EACH ROW BEGIN
	DELETE FROM group_acl WHERE acl_id = OLD.acl_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` int(11) NOT NULL,
  `contact_content` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `contact_date` datetime NOT NULL,
  `contact_viewed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Table structure for table `group_acl`
--

CREATE TABLE IF NOT EXISTS `group_acl` (
  `group_acl_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `acl_id` smallint(6) NOT NULL,
  `group_users_id` smallint(6) NOT NULL,
  `group_acl_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_acl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9573 ;

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
(9489, 194, 1, 1),
(9490, 1, 2, 1),
(9491, 7, 2, 1),
(9492, 8, 2, 1),
(9493, 9, 2, 1),
(9494, 10, 2, 1),
(9495, 11, 2, 1),
(9496, 35, 2, 1),
(9497, 12, 2, 1),
(9498, 13, 2, 1),
(9499, 14, 2, 1),
(9500, 15, 2, 1),
(9501, 16, 2, 1),
(9502, 127, 2, 1),
(9503, 17, 2, 1),
(9504, 18, 2, 1),
(9505, 19, 2, 1),
(9506, 20, 2, 1),
(9507, 21, 2, 1),
(9508, 22, 2, 1),
(9509, 23, 2, 1),
(9510, 24, 2, 1),
(9511, 25, 2, 1),
(9512, 26, 2, 1),
(9513, 36, 2, 1),
(9514, 37, 2, 1),
(9515, 38, 2, 1),
(9516, 39, 2, 1),
(9517, 40, 2, 1),
(9518, 124, 2, 1),
(9519, 125, 2, 1),
(9520, 126, 2, 1),
(9521, 128, 2, 1),
(9522, 129, 2, 1),
(9523, 130, 2, 1),
(9524, 131, 2, 1),
(9525, 132, 2, 1),
(9526, 133, 2, 1),
(9527, 134, 2, 1),
(9528, 135, 2, 1),
(9529, 136, 2, 1),
(9530, 137, 2, 1),
(9531, 138, 2, 1),
(9532, 139, 2, 1),
(9533, 140, 2, 1),
(9534, 141, 2, 1),
(9535, 142, 2, 1),
(9536, 143, 2, 1),
(9537, 144, 2, 1),
(9538, 145, 2, 1),
(9539, 146, 2, 1),
(9540, 147, 2, 1),
(9541, 148, 2, 1),
(9542, 149, 2, 1),
(9543, 150, 2, 1),
(9544, 151, 2, 1),
(9545, 152, 2, 1),
(9546, 153, 2, 1),
(9547, 154, 2, 1),
(9548, 155, 2, 1),
(9549, 156, 2, 1),
(9550, 157, 2, 1),
(9551, 158, 2, 1),
(9552, 159, 2, 1),
(9553, 160, 2, 1),
(9554, 161, 2, 1),
(9555, 162, 2, 1),
(9556, 163, 2, 1),
(9557, 166, 2, 1),
(9558, 167, 2, 1),
(9559, 168, 2, 1),
(9560, 169, 2, 1),
(9561, 170, 2, 1),
(9562, 176, 2, 1),
(9563, 193, 2, 1),
(9564, 171, 2, 1),
(9565, 172, 2, 1),
(9566, 173, 2, 1),
(9567, 174, 2, 1),
(9568, 175, 2, 1),
(9569, 194, 2, 1),
(9570, 190, 2, 1),
(9571, 191, 2, 1),
(9572, 192, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_menu`
--

CREATE TABLE IF NOT EXISTS `group_menu` (
  `group_menu_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_users_id` smallint(6) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  `group_menu_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4010 ;

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
(3962, 1, 25, 1),
(3963, 1, 26, 1),
(3964, 1, 27, 1),
(3965, 1, 28, 1),
(3966, 1, 29, 1),
(3967, 1, 30, 0),
(3968, 1, 31, 1),
(3969, 1, 32, 1),
(3971, 1, 34, 1),
(3975, 1, 38, 1),
(3976, 1, 39, 1),
(3977, 1, 40, 1),
(3978, 2, 3, 1),
(3979, 2, 4, 1),
(3980, 2, 16, 1),
(3981, 2, 17, 1),
(3982, 2, 18, 1),
(3983, 2, 19, 1),
(3984, 2, 20, 1),
(3985, 2, 21, 0),
(3986, 2, 22, 1),
(3987, 2, 25, 1),
(3988, 2, 26, 1),
(3989, 2, 30, 0),
(3990, 2, 27, 1),
(3991, 2, 28, 1),
(3992, 2, 29, 0),
(3993, 2, 31, 1),
(3994, 2, 32, 1),
(3995, 2, 34, 1),
(3996, 2, 40, 0),
(3997, 2, 38, 1),
(3998, 2, 39, 1),
(3999, 2, 5, 0),
(4000, 2, 6, 0),
(4001, 2, 7, 0),
(4002, 2, 8, 0),
(4003, 2, 9, 0),
(4004, 2, 10, 0),
(4005, 2, 11, 0),
(4006, 2, 12, 0),
(4007, 2, 13, 0),
(4008, 2, 14, 0),
(4009, 2, 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_navigation`
--

CREATE TABLE IF NOT EXISTS `group_navigation` (
  `group_navigation_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `group_navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_navigation_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_navigation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `group_navigation`
--

INSERT INTO `group_navigation` (`group_navigation_id`, `group_navigation_name`, `group_navigation_status`) VALUES
(5, 'Menu top', 1);

--
-- Triggers `group_navigation`
--
DROP TRIGGER IF EXISTS `AFTER_DELETE_GROUP_NAVIGATION`;
DELIMITER //
CREATE TRIGGER `AFTER_DELETE_GROUP_NAVIGATION` AFTER DELETE ON `group_navigation`
 FOR EACH ROW BEGIN
	DELETE FROM navigation WHERE group_navigation_id = OLD.group_navigation_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `group_property`
--

CREATE TABLE IF NOT EXISTS `group_property` (
  `group_property_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_property_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_property_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_property_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `group_property`
--

INSERT INTO `group_property` (`group_property_id`, `group_property_name`, `group_property_status`) VALUES
(1, 'Sản phẩm điện thoại', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_property_detail`
--

CREATE TABLE IF NOT EXISTS `group_property_detail` (
  `group_property_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_property_id` smallint(6) NOT NULL,
  `property_id` smallint(6) NOT NULL,
  `group_property_detail_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_property_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `group_property_detail`
--

INSERT INTO `group_property_detail` (`group_property_detail_id`, `group_property_id`, `property_id`, `group_property_detail_status`) VALUES
(1, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_template`
--

CREATE TABLE IF NOT EXISTS `group_template` (
  `group_template_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `group_template_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_template_type` tinyint(4) NOT NULL,
  `group_template_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

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

CREATE TABLE IF NOT EXISTS `group_users` (
  `group_users_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_users_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_users_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `group_users`
--

INSERT INTO `group_users` (`group_users_id`, `group_users_name`, `group_users_status`) VALUES
(1, 'Admin', 1),
(2, 'Quản trị', 1);

--
-- Triggers `group_users`
--
DROP TRIGGER IF EXISTS `AFTER_DELETE_GROUP_USER`;
DELIMITER //
CREATE TRIGGER `AFTER_DELETE_GROUP_USER` AFTER DELETE ON `group_users`
 FOR EACH ROW BEGIN
	DELETE FROM group_acl WHERE group_users_id = OLD.group_users_id;
	DELETE FROM group_menu WHERE group_users_id = OLD.group_users_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `menu_parent` smallint(6) DEFAULT '0',
  `menu_status` tinyint(4) NOT NULL,
  `menu_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_icon` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `menu_position` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

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
DROP TRIGGER IF EXISTS `AFTER_DELETE_MENU`;
DELIMITER //
CREATE TRIGGER `AFTER_DELETE_MENU` AFTER DELETE ON `menu`
 FOR EACH ROW BEGIN
	DELETE FROM group_menu WHERE menu_id = OLD.menu_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE IF NOT EXISTS `navigation` (
  `navigation_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `navigation_parent` tinyint(4) DEFAULT '0',
  `navigation_status` tinyint(4) NOT NULL,
  `navigation_url_id` bigint(4) DEFAULT NULL,
  `navigation_position` tinyint(4) NOT NULL,
  `group_navigation_id` tinyint(4) NOT NULL,
  `navigation_type` tinyint(4) NOT NULL,
  `navigation_url_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`navigation_id`, `navigation_name`, `navigation_parent`, `navigation_status`, `navigation_url_id`, `navigation_position`, `group_navigation_id`, `navigation_type`, `navigation_url_name`) VALUES
(2, 'Trang chủ', 0, 1, NULL, 1, 5, 4, '/'),
(3, 'Thiết kế - thi công', 0, 1, NULL, 2, 5, 4, 'thiet-ke-thi-cong-pca-4'),
(4, 'Nội thất', 0, 1, NULL, 3, 5, 4, '/noi-that-pca-5'),
(5, 'Cẩm nang xây dựng', 0, 1, 1, 4, 5, 3, '/cam-nang-xay-dung-nc-1'),
(6, 'Về chúng tôi', 0, 1, 3, 5, 5, 1, '/ve-chung-toi-p-3'),
(7, 'Liên hệ', 0, 1, NULL, 6, 5, 4, '/lien-he'),
(8, 'Nhà phố - biệt thự', 3, 1, 7, 1, 5, 5, '/nha-pho-biet-thu-pc-7'),
(9, 'Căn hộ - Chung cư', 3, 1, 8, 2, 5, 5, '/can-ho-chung-cu-pc-8'),
(10, 'Bar - Cafe - Nhà hàng', 3, 1, 9, 3, 5, 5, '/bar-cafe-nha-hang-pc-9'),
(11, 'Showroom - Văn phòng', 3, 1, 10, 4, 5, 5, '/showroom-van-phong-pc-10'),
(12, 'Gỗ nội thất', 4, 1, 11, 1, 5, 5, '/go-noi-that-pc-11'),
(13, 'Qui mô xưởng', 4, 1, 12, 2, 5, 5, '/qui-mo-xuong-pc-12');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `post_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  `post_category_id` smallint(6) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_quote`, `post_body`, `post_picture`, `post_date_created`, `post_date_updated`, `post_users_created`, `post_type`, `post_status`, `post_users_updated`, `post_view`, `post_tag`, `post_category_id`) VALUES
(3, 'Về chúng tôi', NULL, '<p><strong>C&ocirc;ng ty CP Đầu tư &amp; X&acirc;y dựng Ho&agrave;ng Khải</strong>&nbsp;xin gửi tới Qu&yacute; Kh&aacute;ch h&agrave;ng lời ch&agrave;o tr&acirc;n trọng nhất.</p>\r\n<p>C&ocirc;ng ty ch&uacute;ng t&ocirc;i được th&agrave;nh lập bởi nh&oacute;m kiến tr&uacute;c sư trẻ năng động v&agrave; đầy nhiệt huyết, mang trong m&igrave;nh kh&aacute;t vọng đam m&ecirc; s&aacute;ng tạo, những người c&oacute; nhiều năm kinh nghiệm, mong muốn l&agrave;m đẹp kh&ocirc;ng gian sống cho mọi người. Ch&uacute;ng t&ocirc;i lu&ocirc;n mong muốn mang đến sự h&agrave;i l&ograve;ng nhất đến với Kh&aacute;ch H&agrave;ng.</p>\r\n<p><strong>Sản phẩm v&agrave; dịch vụ của ch&uacute;ng t&ocirc;i bao gồm:</strong><br />1. Thiết kế kiến tr&uacute;c, kết cấu, hệ thống hạ tầng kỹ thuật, c&aacute;c c&ocirc;ng tr&igrave;nh d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp, thực hiện triển khai đồ &aacute;n quy hoạch tổng thể v&agrave; chi tiết c&aacute;c khu Đ&ocirc; thị v&agrave; C&ocirc;ng nghiệp.<br />2. Thiết kế trang tr&iacute; nội ngoại thất, thiết kế s&acirc;n vườn c&aacute;c c&ocirc;ng tr&igrave;nh d&acirc;n dụng v&agrave; c&ocirc;ng nghiệp.<br />3. Sản xuất, chế tạo v&agrave; lắp đặt trang thiết bị nội thất c&aacute;c c&ocirc;ng tr&igrave;nh d&acirc;n dụng.<br />4. Cung cấp v&agrave; lắp đặt trang thiết bị nhập khẩu theo đơn đặt h&agrave;ng.<br />5. Thi c&ocirc;ng triển khai hệ thống hạ tầng kỹ thuật c&aacute;c c&ocirc;ng tr&igrave;nh x&acirc;y dựng v&agrave; Đ&ocirc; thị.</p>\r\n<p>Mục ti&ecirc;u ph&aacute;t triển của ch&uacute;ng t&ocirc;i l&agrave; đ&aacute;p ứng ở mức cao nhất c&aacute;c y&ecirc;u cầu của kh&aacute;ch h&agrave;ng về&nbsp;<strong>Độ Bền Vững</strong>,&nbsp;<strong>T&iacute;nh C&ocirc;ng Năng</strong>,&nbsp;<strong>Điều Kiện Kinh Tế</strong>&nbsp;v&agrave;&nbsp;<strong>Nghệ Thuật Kiến Tr&uacute;c</strong>.</p>\r\n<p>Ch&uacute;ng t&ocirc;i h&acirc;n hạnh được mời Qu&yacute; Kh&aacute;ch h&agrave;ng sử dụng sản phẩm v&agrave; dịch vụ của ch&uacute;ng t&ocirc;i. Ngo&agrave;i việc thiết kế, x&acirc;y dựng v&agrave; cung cấp c&aacute;c sản phẩm ph&ugrave; hợp với từng đối t&aacute;c, ch&uacute;ng t&ocirc;i sẵn s&agrave;ng tư vấn cho Qu&yacute; Kh&aacute;ch h&agrave;ng những th&ocirc;ng tin hữu &iacute;ch nhằm x&acirc;y dựng kh&ocirc;ng gian tiện nghi tối ưu ph&ugrave; hợp với nhu cầu Qu&yacute; Kh&aacute;ch h&agrave;ng c&ugrave;ng chi ph&iacute; đầu tư&nbsp;thấp nhất.</p>\r\n<p>Với kinh nghiệm l&acirc;u năm c&ugrave;ng đội ngũ kiến tr&uacute;c sư, kỹ sư l&agrave;nh nghề, ch&uacute;ng t&ocirc;i tin tưởng sẽ thỏa m&atilde;n mọi nhu cầu của Qu&yacute; Kh&aacute;ch h&agrave;ng.</p>\r\n<p>Rất mong được hợp t&aacute;c c&ugrave;ng Qu&yacute; Kh&aacute;ch h&agrave;ng.</p>\r\n<p><strong>Tr&acirc;n trọng k&iacute;nh ch&agrave;o</strong></p>\r\n<p><strong>C&Ocirc;NG TY CP ĐẦU TƯ &amp; X&Acirc;Y DỰNG HO&Agrave;NG KHẢI</strong></p>\r\n<p><em>GI&Aacute;M ĐỐC</em><br /><strong>HO&Agrave;NG MINH ĐỨC</strong></p>', NULL, '2018-01-09 21:31:18', '2018-03-05 22:07:23', 3, 2, 1, 3, 0, '', 0),
(4, 'Bảng giá thiết kế', NULL, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We''re happy to make you feel more comfortable on your home.</p>', NULL, '2018-01-11 16:45:10', '2018-01-11 16:53:58', 3, 2, 1, 3, 0, '', 0),
(5, 'Bảng giá xây dựng', NULL, '<p>Our commitment to quality and services ensure our clients happy. With years of experiences and continuing research, our team is ready to serve your interior design needs. We''re happy to make you feel more comfortable on your home.</p>', NULL, '2018-01-11 16:53:51', '2018-01-11 16:53:51', 3, 2, 1, 3, 0, '', 0);

--
-- Triggers `post`
--
DROP TRIGGER IF EXISTS `AFTER_DELETE_POST`;
DELIMITER //
CREATE TRIGGER `AFTER_DELETE_POST` AFTER DELETE ON `post`
 FOR EACH ROW BEGIN
	DELETE FROM post_category_detail WHERE post_id = OLD.post_id;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE IF NOT EXISTS `post_category` (
  `post_category_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `post_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `post_category_parent` smallint(6) DEFAULT NULL,
  `post_category_status` tinyint(4) DEFAULT NULL,
  `post_category_date_created` datetime DEFAULT NULL,
  `post_category_date_updated` datetime DEFAULT NULL,
  `post_category_users_created` smallint(6) DEFAULT NULL,
  `post_category_users_updated` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`post_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `post_category`
--

INSERT INTO `post_category` (`post_category_id`, `post_category_name`, `post_category_parent`, `post_category_status`, `post_category_date_created`, `post_category_date_updated`, `post_category_users_created`, `post_category_users_updated`) VALUES
(1, 'Cẩm nang xây dựng', 0, 1, '2017-11-01 10:15:59', '2018-01-09 21:32:10', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post_category_detail`
--

CREATE TABLE IF NOT EXISTS `post_category_detail` (
  `post_category_detail_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `post_id` smallint(6) NOT NULL,
  `post_category_id` smallint(6) NOT NULL,
  PRIMARY KEY (`post_category_detail_id`),
  KEY `index_post_category_detail` (`post_id`,`post_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  `product_category_id` smallint(6) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `product_category_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_category_parent` smallint(6) DEFAULT NULL,
  `product_category_status` tinyint(4) DEFAULT NULL,
  `product_category_date_created` datetime DEFAULT NULL,
  `product_category_date_updated` datetime DEFAULT NULL,
  `product_category_users_created` smallint(6) DEFAULT NULL,
  `product_category_users_updated` smallint(6) DEFAULT NULL,
  `group_property_id` smallint(6) DEFAULT NULL,
  `product_category_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_category_name`, `product_category_parent`, `product_category_status`, `product_category_date_created`, `product_category_date_updated`, `product_category_users_created`, `product_category_users_updated`, `group_property_id`, `product_category_picture`) VALUES
(4, 'Thiết kế - Thi công', 0, 1, '2018-01-09 21:32:30', '2018-01-11 14:33:09', 3, 3, NULL, NULL),
(5, 'Nội thất', 0, 1, '2018-01-09 21:32:37', '2018-03-05 23:08:46', 3, 3, NULL, 'product_category_1520266126.0662_pf4.jpg'),
(6, 'Cẩm nang xây dựng', 0, 1, '2018-01-09 21:32:45', NULL, 3, NULL, NULL, ''),
(7, 'Nhà phố - biệt thự', 4, 1, '2018-01-09 21:34:57', '2018-03-05 23:02:48', 3, 3, NULL, 'product_category_1520265768.6333_pf2.jpg'),
(8, 'Căn hộ - Chung cư', 4, 1, '2018-01-09 21:35:07', '2018-03-05 23:01:51', 3, 3, NULL, 'product_category_1520265711.5621_pf1.jpg'),
(9, 'Bar - Cafe - Nhà hàng', 4, 1, '2018-01-09 21:35:18', '2018-03-05 23:03:29', 3, 3, NULL, 'product_category_1520265810.0083_pf5.jpg'),
(10, 'Showroom - Văn phòng', 4, 1, '2018-01-09 21:35:28', '2018-03-05 23:10:14', 3, 3, NULL, 'product_category_1520266214.9835_p3_a.jpg'),
(11, 'Gỗ nội thất', 5, 1, '2018-03-05 22:08:22', NULL, 3, NULL, NULL, NULL),
(12, 'Qui mô xưởng', 5, 1, '2018-03-05 22:08:32', NULL, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_category_detail`
--

CREATE TABLE IF NOT EXISTS `product_category_detail` (
  `product_category_detail_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `product_category_id` smallint(6) NOT NULL,
  PRIMARY KEY (`product_category_detail_id`),
  KEY `index_product_category_detail` (`product_id`,`product_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

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

CREATE TABLE IF NOT EXISTS `product_picture` (
  `product_picture_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` smallint(6) NOT NULL,
  `product_picture_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`product_picture_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=80 ;

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

CREATE TABLE IF NOT EXISTS `product_property` (
  `product_property_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `property_id` smallint(6) NOT NULL,
  `property_detail_id` smallint(6) NOT NULL,
  `property_detail_value` int(11) NOT NULL,
  PRIMARY KEY (`product_property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_property_detail`
--

CREATE TABLE IF NOT EXISTS `product_property_detail` (
  `product_property_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_property_detail_value` smallint(6) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `property_id` smallint(6) NOT NULL,
  PRIMARY KEY (`product_property_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
  `property_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `property_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `property_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `property_status` tinyint(4) NOT NULL,
  `property_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `property_name`, `property_type`, `property_status`, `property_code`) VALUES
(3, 'Số tiền', 'text', 1, 'money');

-- --------------------------------------------------------

--
-- Table structure for table `property_detail`
--

CREATE TABLE IF NOT EXISTS `property_detail` (
  `property_detail_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `property_detail_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `property_detail_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `property_id` smallint(6) NOT NULL,
  `property_detail_default` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`property_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
  `template_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `template_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_content` text COLLATE utf8_unicode_ci,
  `group_template_id` tinyint(4) NOT NULL,
  `template_status` tinyint(4) NOT NULL,
  `template_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

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

CREATE TABLE IF NOT EXISTS `users` (
  `users_id` smallint(6) NOT NULL AUTO_INCREMENT,
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
  `users_forget_request_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`users_id`,`users_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5781 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_fullname`, `users_phone`, `users_email`, `users_password`, `users_registered`, `users_status`, `users_picture`, `users_salt`, `users_login_time`, `users_user_agent`, `group_users_id`, `users_forget_request_key`) VALUES
(3, 'Anh Tuấn', '', 'anhtuan150787@gmail.com', 'e49ed34b584d6a4ac562647850517b13', '2017-08-10 11:56:56', 1, 'users_1503035528_1910224703_hop-190x120x60mm.png', '65601daf9197d19f660233df5f7961c9', '2018-03-21 19:50:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 1, ''),
(5780, 'admin', '', 'admin@mail.com', 'e49ed34b584d6a4ac562647850517b13', '2018-03-21 15:40:52', 1, NULL, '65601daf9197d19f660233df5f7961c9', '2018-03-21 19:43:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', 2, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_group_acl`
--
CREATE TABLE IF NOT EXISTS `view_group_acl` (
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
--
CREATE TABLE IF NOT EXISTS `view_group_menu` (
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
--
CREATE TABLE IF NOT EXISTS `view_navigation` (
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
--
CREATE TABLE IF NOT EXISTS `view_post` (
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
--
CREATE TABLE IF NOT EXISTS `view_post_category_detail` (
`post_category_detail_id` smallint(6)
,`post_id` smallint(6)
,`post_category_id` smallint(6)
,`post_category_name` varchar(50)
,`post_category_parent` smallint(6)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_product`
--
CREATE TABLE IF NOT EXISTS `view_product` (
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
--
CREATE TABLE IF NOT EXISTS `view_product_category_detail` (
`product_category_detail_id` smallint(6)
,`product_id` bigint(20)
,`product_category_id` smallint(6)
,`product_category_name` varchar(50)
,`product_category_parent` smallint(6)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_users`
--
CREATE TABLE IF NOT EXISTS `view_users` (
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

CREATE TABLE IF NOT EXISTS `website_email` (
  `website_email_id` tinyint(4) NOT NULL,
  `website_email_system_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_host` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_port` smallint(6) DEFAULT NULL,
  `website_email_system_username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_system_ssl` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_primary_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_from` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_email_from_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`website_email_id`)
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

CREATE TABLE IF NOT EXISTS `website_general` (
  `website_general_id` tinyint(4) NOT NULL,
  `website_general_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website_general_keyword` text COLLATE utf8_unicode_ci,
  `website_general_description` text COLLATE utf8_unicode_ci,
  `website_general_favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`website_general_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `website_general`
--

INSERT INTO `website_general` (`website_general_id`, `website_general_title`, `website_general_keyword`, `website_general_description`, `website_general_favicon`) VALUES
(1, 'LifeDeco', 'LifeDeco', 'LifeDeco', 'favicon_1520687368.1665_logo_lifedeco.png');

-- --------------------------------------------------------

--
-- Structure for view `view_group_acl`
--
DROP TABLE IF EXISTS `view_group_acl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_group_acl` AS select `group_acl`.`group_acl_id` AS `group_acl_id`,`group_acl`.`acl_id` AS `acl_id`,`group_acl`.`group_users_id` AS `group_users_id`,`group_acl`.`group_acl_status` AS `group_acl_status`,`acl`.`acl_name` AS `acl_name`,`acl`.`acl_module` AS `acl_module`,`acl`.`acl_controller` AS `acl_controller`,`acl`.`acl_action` AS `acl_action`,`acl`.`acl_status` AS `acl_status`,`acl`.`acl_parent` AS `acl_parent`,`group_users`.`group_users_name` AS `group_users_name` from ((`group_acl` left join `acl` on((`group_acl`.`acl_id` = `acl`.`acl_id`))) left join `group_users` on((`group_users`.`group_users_id` = `group_acl`.`group_users_id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_group_menu`
--
DROP TABLE IF EXISTS `view_group_menu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_group_menu` AS select `gm`.`group_menu_id` AS `group_menu_id`,`gm`.`group_users_id` AS `group_users_id`,`gm`.`menu_id` AS `menu_id`,`gm`.`group_menu_status` AS `group_menu_status`,`m`.`menu_name` AS `menu_name`,`m`.`menu_parent` AS `menu_parent`,`m`.`menu_url` AS `menu_url`,`m`.`menu_icon` AS `menu_icon`,`m`.`menu_position` AS `menu_position` from (`group_menu` `gm` left join `menu` `m` on((`gm`.`menu_id` = `m`.`menu_id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_navigation`
--
DROP TABLE IF EXISTS `view_navigation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_navigation` AS select `navigation`.`navigation_id` AS `navigation_id`,`navigation`.`navigation_name` AS `navigation_name`,`navigation`.`navigation_parent` AS `navigation_parent`,`navigation`.`navigation_status` AS `navigation_status`,`navigation`.`navigation_url_id` AS `navigation_url_id`,`navigation`.`navigation_position` AS `navigation_position`,`navigation`.`group_navigation_id` AS `group_navigation_id`,`navigation`.`navigation_type` AS `navigation_type`,`navigation`.`navigation_url_name` AS `navigation_url_name`,`group_navigation`.`group_navigation_name` AS `group_navigation_name` from (`navigation` left join `group_navigation` on((`group_navigation`.`group_navigation_id` = `navigation`.`group_navigation_id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_post`
--
DROP TABLE IF EXISTS `view_post`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_post` AS select `post`.`post_id` AS `post_id`,`post`.`post_title` AS `post_title`,`post`.`post_quote` AS `post_quote`,`post`.`post_body` AS `post_body`,`post`.`post_picture` AS `post_picture`,`post`.`post_date_created` AS `post_date_created`,`post`.`post_date_updated` AS `post_date_updated`,`post`.`post_users_created` AS `post_users_created`,`post`.`post_type` AS `post_type`,`post`.`post_status` AS `post_status`,`post`.`post_users_updated` AS `post_users_updated`,`post`.`post_view` AS `post_view`,`post`.`post_tag` AS `post_tag`,`post`.`post_category_id` AS `post_category_id`,`users`.`users_fullname` AS `users_fullname` from (`post` left join `users` on((`users`.`users_id` = `post`.`post_users_updated`)));

-- --------------------------------------------------------

--
-- Structure for view `view_post_category_detail`
--
DROP TABLE IF EXISTS `view_post_category_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_post_category_detail` AS select `post_category_detail`.`post_category_detail_id` AS `post_category_detail_id`,`post_category_detail`.`post_id` AS `post_id`,`post_category_detail`.`post_category_id` AS `post_category_id`,`post_category`.`post_category_name` AS `post_category_name`,`post_category`.`post_category_parent` AS `post_category_parent` from (`post_category_detail` left join `post_category` on((`post_category`.`post_category_id` = `post_category_detail`.`post_category_id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_product`
--
DROP TABLE IF EXISTS `view_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product` AS select `product`.`product_id` AS `product_id`,`product`.`product_name` AS `product_name`,`product`.`product_body` AS `product_body`,`product`.`product_picture` AS `product_picture`,`product`.`product_date_created` AS `product_date_created`,`product`.`product_date_updated` AS `product_date_updated`,`product`.`product_users_created` AS `product_users_created`,`product`.`product_status` AS `product_status`,`product`.`product_users_updated` AS `product_users_updated`,`product`.`product_view` AS `product_view`,`product`.`product_category_id` AS `product_category_id`,`users`.`users_fullname` AS `users_fullname` from (`product` left join `users` on((`users`.`users_id` = `product`.`product_users_updated`)));

-- --------------------------------------------------------

--
-- Structure for view `view_product_category_detail`
--
DROP TABLE IF EXISTS `view_product_category_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_product_category_detail` AS select `product_category_detail`.`product_category_detail_id` AS `product_category_detail_id`,`product_category_detail`.`product_id` AS `product_id`,`product_category_detail`.`product_category_id` AS `product_category_id`,`product_category`.`product_category_name` AS `product_category_name`,`product_category`.`product_category_parent` AS `product_category_parent` from (`product_category_detail` left join `product_category` on((`product_category`.`product_category_id` = `product_category_detail`.`product_category_id`)));

-- --------------------------------------------------------

--
-- Structure for view `view_users`
--
DROP TABLE IF EXISTS `view_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_users` AS select `users`.`users_id` AS `users_id`,`users`.`users_fullname` AS `users_fullname`,`users`.`users_phone` AS `users_phone`,`users`.`users_email` AS `users_email`,`users`.`users_password` AS `users_password`,`users`.`users_registered` AS `users_registered`,`users`.`users_status` AS `users_status`,`users`.`users_picture` AS `users_picture`,`users`.`users_salt` AS `users_salt`,`users`.`users_login_time` AS `users_login_time`,`users`.`users_user_agent` AS `users_user_agent`,`users`.`group_users_id` AS `group_users_id`,`users`.`users_forget_request_key` AS `users_forget_request_key`,`group_users`.`group_users_name` AS `group_users_name` from (`users` left join `group_users` on((`group_users`.`group_users_id` = `users`.`group_users_id`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
