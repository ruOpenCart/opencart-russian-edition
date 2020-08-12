-----------------------------------------------------------

--
-- Database: `opencart`
--

-----------------------------------------------------------

SET sql_mode = '';

--
-- Table structure for table `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_target`
--

DROP TABLE IF EXISTS `oc_googleshopping_target`;
CREATE TABLE `oc_googleshopping_target` (
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `campaign_name` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `budget` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `feeds` text NOT NULL,
  `status` enum('paused','active') NOT NULL DEFAULT 'paused',
  `date_added` DATE,
  `roas` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`advertise_google_target_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-----------------------------------------------------------

--
-- Table structure for table `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-----------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute_description`
--

-- en
INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- ru
INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 2, 'Описание'),
(2, 2, 'Количество ядер'),
(4, 2, 'тест 1'),
(5, 2, 'тест 2'),
(6, 2, 'тест 3'),
(7, 2, 'тест 4'),
(8, 2, 'тест 5'),
(9, 2, 'тест 6'),
(10, 2, 'тест 7'),
(11, 2, 'тест 8'),
(3, 2, 'Тактовая частота');

-----------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-----------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_attribute_group_description`
--

-- en
INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- ru
INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 2, 'Память'),
(4, 2, 'Технический'),
(5, 2, 'Системная плата'),
(6, 2, 'Процессор');

-----------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'Продукты HP', 1),
(7, 'Слайд-шоу на главной странице', 1),
(8, 'Производители', 1);

-----------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_banner_image`
--

-- en
INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, 1, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- ru
INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(99, 7, 2, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(107, 6, 2, 'HP Banner', 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(114, 8, 2, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(115, 8, 2, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(116, 8, 2, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(111, 8, 2, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(112, 8, 2, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(113, 8, 2, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(108, 8, 2, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(109, 8, 2, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(110, 8, 2, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(100, 7, 2, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(117, 8, 2, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(118, 8, 2, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-07-16 02:14:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16');

-----------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_description`
--

-- en
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Monitors', '', 'Monitors', '', ''),
(33, 1, 'Cameras', '', 'Cameras', '', ''),
(32, 1, 'Web Cameras', '', 'Web Cameras', '', ''),
(31, 1, 'Scanners', '', 'Scanners', '', ''),
(30, 1, 'Printers', '', 'Printers', '', ''),
(29, 1, 'Mice and Trackballs', '', 'Mice and Trackballs', '', ''),
(27, 1, 'Mac', '', 'Mac', '', ''),
(26, 1, 'PC', '', 'PC', '', ''),
(17, 1, 'Software', '', 'Software', '', ''),
(25, 1, 'Components', '', 'Components', '', ''),
(24, 1, 'Phones &amp; PDAs', '', 'Phones &amp; PDAs', '', ''),
(20, 1, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops', 'Example of category description', ''),
(35, 1, 'test 1', '', 'test 1', '', ''),
(36, 1, 'test 2', '', 'test 2', '', ''),
(37, 1, 'test 5', '', 'test 5', '', ''),
(38, 1, 'test 4', '', 'test 4', '', ''),
(39, 1, 'test 6', '', 'test 6', '', ''),
(40, 1, 'test 7', '', 'test 7', '', ''),
(41, 1, 'test 8', '', 'test 8', '', ''),
(42, 1, 'test 9', '', 'test 9', '', ''),
(43, 1, 'test 11', '', 'test 11', '', ''),
(34, 1, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', ''),
(18, 1, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', ''),
(44, 1, 'test 12', '', 'test 12', '', ''),
(45, 1, 'Windows', '', 'Windows', '', ''),
(46, 1, 'Macs', '', 'Macs', '', ''),
(47, 1, 'test 15', '', 'test 15', '', ''),
(48, 1, 'test 16', '', 'test 16', '', ''),
(49, 1, 'test 17', '', 'test 17', '', ''),
(50, 1, 'test 18', '', 'test 18', '', ''),
(51, 1, 'test 19', '', 'test 19', '', ''),
(52, 1, 'test 20', '', 'test 20', '', ''),
(53, 1, 'test 21', '', 'test 21', '', ''),
(54, 1, 'test 22', '', 'test 22', '', ''),
(55, 1, 'test 23', '', 'test 23', '', ''),
(56, 1, 'test 24', '', 'test 24', '', ''),
(57, 1, 'Tablets', '', 'Tablets', '', ''),
(58, 1, 'test 25', '', 'test 25', '', '');

-- ru
INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 2, 'Мониторы', '', 'Мониторы', '', ''),
(33, 2, 'Камеры', '', 'Камеры', '', ''),
(32, 2, 'Веб-камеры', '', 'Веб-камеры', '', ''),
(31, 2, 'Сканеры', '', 'Сканеры', '', ''),
(30, 2, 'Принтеры', '', 'Принтеры', '', ''),
(29, 2, 'Мыши и трекболы', '', 'Мыши и трекболы', '', ''),
(27, 2, 'Mac', '', 'Mac', '', ''),
(26, 2, 'ПК', '', 'ПК', '', ''),
(17, 2, 'Програмное обеспечение', '', 'Програмное обеспечение', '', ''),
(25, 2, 'Компоненты', '', 'Компоненты', '', ''),
(24, 2, 'Телефоны и КПК', '', 'Телефоны и КПК', '', ''),
(20, 2, 'Настольные компьютеры', '&lt;p&gt;\r\n	Пример текста описания категории&lt;/p&gt;\r\n', 'Настольные компьютеры', 'Пример описания категории', ''),
(35, 2, 'тест 1', '', 'тест 1', '', ''),
(36, 2, 'тест 2', '', 'тест 2', '', ''),
(37, 2, 'тест 5', '', 'тест 5', '', ''),
(38, 2, 'тест 4', '', 'тест 4', '', ''),
(39, 2, 'тест 6', '', 'тест 6', '', ''),
(40, 2, 'тест 7', '', 'тест 7', '', ''),
(41, 2, 'тест 8', '', 'тест 8', '', ''),
(42, 2, 'тест 9', '', 'тест 9', '', ''),
(43, 2, 'тест 11', '', 'тест 11', '', ''),
(34, 2, 'Mp3-плееры', '&lt;p&gt;\r\n	Магазин «Лэптоп» предлагает только лучшие на рынке предложения для ноутбуков. Сравнивая предложения ноутбуков от таких компаний, как PC World, Comet, Dixons, The Link и Carphone Warehouse, Shop Laptop предлагает наиболее полный выбор ноутбуков в Интернете. В магазине ноутбуков мы гордимся тем, что предлагаем клиентам самые лучшие предложения ноутбуков. Shop Laptop - отреставрированные ноутбуки до нетбуков - гарантирует, что каждый ноутбук - любого цвета, стиля, размера и технических характеристик - будет представлен на сайте по самой низкой цене.&lt;/p&gt;\r\n', 'Mp3-плееры', '', ''),
(18, 2, 'Лэптопы и Ноутбуки', '&lt;p&gt;\r\n	Магазин «Лэптоп» предлагает только лучшие на рынке предложения для ноутбуков. Сравнивая предложения ноутбуков от таких компаний, как PC World, Comet, Dixons, The Link и Carphone Warehouse, Shop Laptop предлагает наиболее полный выбор ноутбуков в Интернете. В магазине ноутбуков мы гордимся тем, что предлагаем клиентам самые лучшие предложения ноутбуков. Shop Laptop - отреставрированные ноутбуки до нетбуков - гарантирует, что каждый ноутбук - любого цвета, стиля, размера и технических характеристик - будет представлен на сайте по самой низкой цене.&lt;/p&gt;\r\n', 'Лэптопы и Ноутбуки', '', ''),
(44, 2, 'тест 12', '', 'тест 12', '', ''),
(45, 2, 'Windows', '', 'Windows', '', ''),
(46, 2, 'Macs', '', 'Macs', '', ''),
(47, 2, 'тест 15', '', 'тест 15', '', ''),
(48, 2, 'тест 16', '', 'тест 16', '', ''),
(49, 2, 'тест 17', '', 'тест 17', '', ''),
(50, 2, 'тест 18', '', 'тест 18', '', ''),
(51, 2, 'тест 19', '', 'тест 19', '', ''),
(52, 2, 'тест 20', '', 'тест 20', '', ''),
(53, 2, 'тест 21', '', 'тест 21', '', ''),
(54, 2, 'тест 22', '', 'тест 22', '', ''),
(55, 2, 'тест 23', '', 'тест 23', '', ''),
(56, 2, 'тест 24', '', 'тест 24', '', ''),
(57, 2, 'Планшеты', '', 'Планшеты', '', ''),
(58, 2, 'тест 25', '', 'тест 25', '', '');

-----------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_category`
--

DROP TABLE IF EXISTS `oc_googleshopping_category`;
CREATE TABLE `oc_googleshopping_category` (
  `google_product_category` varchar(10) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`google_product_category`,`store_id`),
  KEY `category_id_store_id` (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-----------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 0),
(2, 'Albania', 'AL', 'ALB', '', 0, 0),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 0),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 0),
(5, 'Andorra', 'AD', 'AND', '', 0, 0),
(6, 'Angola', 'AO', 'AGO', '', 0, 0),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 0),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 0),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 0),
(10, 'Argentina', 'AR', 'ARG', '', 0, 0),
(11, 'Республика Армения', 'AM', 'ARM', '', 0, 0),
(12, 'Aruba', 'AW', 'ABW', '', 0, 0),
(13, 'Australia', 'AU', 'AUS', '', 0, 0),
(14, 'Austria', 'AT', 'AUT', '', 0, 0),
(15, 'Азербайджанская Республика', 'AZ', 'AZE', '', 0, 0),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 0),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 0),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 0),
(19, 'Barbados', 'BB', 'BRB', '', 0, 0),
(20, 'Республика Беларусь', 'BY', 'BLR', '', 0, 0),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 0),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 0),
(23, 'Benin', 'BJ', 'BEN', '', 0, 0),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 0),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 0),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 0),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 0),
(28, 'Botswana', 'BW', 'BWA', '', 0, 0),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 0),
(30, 'Brazil', 'BR', 'BRA', '', 0, 0),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 0),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 0),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 0),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 0),
(35, 'Burundi', 'BI', 'BDI', '', 0, 0),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 0),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 0),
(38, 'Canada', 'CA', 'CAN', '', 0, 0),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 0),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 0),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 0),
(42, 'Chad', 'TD', 'TCD', '', 0, 0),
(43, 'Chile', 'CL', 'CHL', '', 0, 0),
(44, 'China', 'CN', 'CHN', '', 0, 0),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 0),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 0),
(47, 'Colombia', 'CO', 'COL', '', 0, 0),
(48, 'Comoros', 'KM', 'COM', '', 0, 0),
(49, 'Congo', 'CG', 'COG', '', 0, 0),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 0),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 0),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 0),
(53, 'Croatia', 'HR', 'HRV', '', 0, 0),
(54, 'Cuba', 'CU', 'CUB', '', 0, 0),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 0),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 0),
(57, 'Denmark', 'DK', 'DNK', '', 0, 0),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 0),
(59, 'Dominica', 'DM', 'DMA', '', 0, 0),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 0),
(61, 'East Timor', 'TL', 'TLS', '', 0, 0),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 0),
(63, 'Egypt', 'EG', 'EGY', '', 0, 0),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 0),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 0),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 0),
(67, 'Estonia', 'EE', 'EST', '', 0, 0),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 0),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 0),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 0),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 0),
(72, 'Finland', 'FI', 'FIN', '', 0, 0),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 0),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 0),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 0),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 0),
(78, 'Gabon', 'GA', 'GAB', '', 0, 0),
(79, 'Gambia', 'GM', 'GMB', '', 0, 0),
(80, 'Грузия', 'GE', 'GEO', '', 0, 0),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 0),
(82, 'Ghana', 'GH', 'GHA', '', 0, 0),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 0),
(84, 'Greece', 'GR', 'GRC', '', 0, 0),
(85, 'Greenland', 'GL', 'GRL', '', 0, 0),
(86, 'Grenada', 'GD', 'GRD', '', 0, 0),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 0),
(88, 'Guam', 'GU', 'GUM', '', 0, 0),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 0),
(90, 'Guinea', 'GN', 'GIN', '', 0, 0),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 0),
(92, 'Guyana', 'GY', 'GUY', '', 0, 0),
(93, 'Haiti', 'HT', 'HTI', '', 0, 0),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 0),
(95, 'Honduras', 'HN', 'HND', '', 0, 0),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 0),
(97, 'Hungary', 'HU', 'HUN', '', 0, 0),
(98, 'Iceland', 'IS', 'ISL', '', 0, 0),
(99, 'India', 'IN', 'IND', '', 0, 0),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 0),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 0),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 0),
(103, 'Ireland', 'IE', 'IRL', '', 0, 0),
(104, 'Israel', 'IL', 'ISR', '', 0, 0),
(105, 'Italy', 'IT', 'ITA', '', 0, 0),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 0),
(107, 'Japan', 'JP', 'JPN', '', 0, 0),
(108, 'Jordan', 'JO', 'JOR', '', 0, 0),
(109, 'Республика Казахстан', 'KZ', 'KAZ', '', 0, 0),
(110, 'Kenya', 'KE', 'KEN', '', 0, 0),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 0),
(112, 'North Korea', 'KP', 'PRK', '', 0, 0),
(113, 'South Korea', 'KR', 'KOR', '', 0, 0),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 0),
(115, 'Киргизская Республика', 'KG', 'KGZ', '', 0, 0),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 0),
(117, 'Latvia', 'LV', 'LVA', '', 0, 0),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 0),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 0),
(120, 'Liberia', 'LR', 'LBR', '', 0, 0),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 0),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 0),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 0),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 0),
(125, 'Macau', 'MO', 'MAC', '', 0, 0),
(126, 'FYROM', 'MK', 'MKD', '', 0, 0),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 0),
(128, 'Malawi', 'MW', 'MWI', '', 0, 0),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 0),
(130, 'Maldives', 'MV', 'MDV', '', 0, 0),
(131, 'Mali', 'ML', 'MLI', '', 0, 0),
(132, 'Malta', 'MT', 'MLT', '', 0, 0),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 0),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 0),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 0),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 0),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 0),
(138, 'Mexico', 'MX', 'MEX', '', 0, 0),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 0),
(140, 'Республика Молдова', 'MD', 'MDA', '', 0, 0),
(141, 'Monaco', 'MC', 'MCO', '', 0, 0),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 0),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 0),
(144, 'Morocco', 'MA', 'MAR', '', 0, 0),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 0),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 0),
(147, 'Namibia', 'NA', 'NAM', '', 0, 0),
(148, 'Nauru', 'NR', 'NRU', '', 0, 0),
(149, 'Nepal', 'NP', 'NPL', '', 0, 0),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 0),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 0),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 0),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 0),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 0),
(155, 'Niger', 'NE', 'NER', '', 0, 0),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 0),
(157, 'Niue', 'NU', 'NIU', '', 0, 0),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 0),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 0),
(160, 'Norway', 'NO', 'NOR', '', 0, 0),
(161, 'Oman', 'OM', 'OMN', '', 0, 0),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 0),
(163, 'Palau', 'PW', 'PLW', '', 0, 0),
(164, 'Panama', 'PA', 'PAN', '', 0, 0),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 0),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 0),
(167, 'Peru', 'PE', 'PER', '', 0, 0),
(168, 'Philippines', 'PH', 'PHL', '', 0, 0),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 0),
(170, 'Poland', 'PL', 'POL', '', 0, 0),
(171, 'Portugal', 'PT', 'PRT', '', 0, 0),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 0),
(173, 'Qatar', 'QA', 'QAT', '', 0, 0),
(174, 'Reunion', 'RE', 'REU', '', 0, 0),
(175, 'Romania', 'RO', 'ROM', '', 0, 0),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 0),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 0),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 0),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 0),
(181, 'Samoa', 'WS', 'WSM', '', 0, 0),
(182, 'San Marino', 'SM', 'SMR', '', 0, 0),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 0),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 0),
(185, 'Senegal', 'SN', 'SEN', '', 0, 0),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 0),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 0),
(188, 'Singapore', 'SG', 'SGP', '', 0, 0),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 0),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 0),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 0),
(192, 'Somalia', 'SO', 'SOM', '', 0, 0),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 0),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 0),
(195, 'Spain', 'ES', 'ESP', '', 0, 0),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 0),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 0),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 0),
(199, 'Sudan', 'SD', 'SDN', '', 0, 0),
(200, 'Suriname', 'SR', 'SUR', '', 0, 0),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 0),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 0),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 0),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 0),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 0),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 0),
(207, 'Республика Таджикистан', 'TJ', 'TJK', '', 0, 0),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 0),
(209, 'Thailand', 'TH', 'THA', '', 0, 0),
(210, 'Togo', 'TG', 'TGO', '', 0, 0),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 0),
(212, 'Tonga', 'TO', 'TON', '', 0, 0),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 0),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 0),
(215, 'Turkey', 'TR', 'TUR', '', 0, 0),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 0),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 0),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 0),
(219, 'Uganda', 'UG', 'UGA', '', 0, 0),
(220, 'Украина', 'UA', 'UKR', '', 0, 0),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 0),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 0),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 0),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 0),
(225, 'Uruguay', 'UY', 'URY', '', 0, 0),
(226, 'Республика Узбекистан', 'UZ', 'UZB', '', 0, 0),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 0),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 0),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 0),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 0),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 0),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 0),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 0),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 0),
(235, 'Yemen', 'YE', 'YEM', '', 0, 0),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 0),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 0),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 0),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 0),
(243, 'Serbia', 'RS', 'SRB', '', 0, 0),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 0),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 0),
(246, 'Curacao', 'CW', 'CUW', '', 0, 0),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 0),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 0),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 0),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 0),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 0),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 0),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 0),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 0),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 0),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 0),
(257, 'Jersey', 'JE', 'JEY', '', 0, 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-----------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_currency`
--

-- en
INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.01083000, 1, '2020-04-28 21:00:00'),
(2, 'US Dollar', 'USD', '$', '', '2', 0.01333333, 1, '2020-04-28 21:00:00'),
(3, 'Euro', 'EUR', '', '€', '2', 0.01244000, 1, '2020-04-28 21:00:00');

-- ru
INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'Рубль', 'RUB', '', '₽', '0', 1.00000000, 1, '2020-04-28 21:00:00');

-----------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

DROP TABLE IF EXISTS `oc_customer_affiliate`;
CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_approval`
--

DROP TABLE IF EXISTS `oc_customer_approval`;
CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_approval_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_customer_group_description`
--

-- en
INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- ru
INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'По умолчанию', 'тест');

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_search`
--

DROP TABLE IF EXISTS `oc_customer_search`;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11),
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`) VALUES
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0);
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(21, 'dashboard', 'activity'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(26, 'dashboard', 'map'),
(27, 'dashboard', 'customer'),
(28, 'dashboard', 'chart'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward'),
(42, 'advertise', 'google');

-----------------------------------------------------------

--
-- Table structure for table `oc_extension_install`
--

DROP TABLE IF EXISTS `oc_extension_install`;
CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_extension_path`
--

DROP TABLE IF EXISTS `oc_extension_path`;
CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_geo_zone`
--

-- en
INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- ru
INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(5, 'Зона НДС РФ', 'Облагаемые НДС в РФ', '2020-04-26 21:00:00', '2020-04-26 21:00:00');

-----------------------------------------------------------

--
-- Table structure for table `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-----------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_information_description`
--

-- en
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '');

-- ru
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 2, 'О нас', '&lt;p&gt;\r\n	О нас&lt;/p&gt;\r\n', 'О нас', '', ''),
(5, 2, 'Условия и положения', '&lt;p&gt;\r\n	Условия и положения&lt;/p&gt;\r\n', 'Условия и положения', '', ''),
(3, 2, 'Политика конфиденциальности', '&lt;p&gt;\r\n	Политика конфиденциальности&lt;/p&gt;\r\n', 'Политика конфиденциальности', '', ''),
(6, 2, 'Информация о доставке', '&lt;p&gt;\r\n	Информация о доставке&lt;/p&gt;\r\n', 'Информация о доставке', '', '');

-----------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_language`
--

-- en
INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- ru
INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, 'Русский', 'ru-ru', 'ru-RU,ru_RU.UTF-8,ru_RU,ru-ru,russian', 'ru.png', 'russian', 1, 1);

-----------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-----------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'account', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(67, 1, 'carousel.29', 'content_top', 3),
(66, 1, 'slideshow.27', 'content_top', 1),
(65, 1, 'featured.28', 'content_top', 2),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-----------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-----------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-----------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_length_class_description`
--

-- en
INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- ru
INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Сантиметр', 'см'),
(2, 2, 'Миллиметр', 'мм'),
(3, 2, 'Дюйм', 'дюйм');

-----------------------------------------------------------

--
-- Table structure for table `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-------------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-------------------------------------------------------------

-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["43","40","42","30"],"limit":"4","width":"200","height":"200","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"380","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}');

-----------------------------------------------------------

--
-- Table structure for table `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-----------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option_description`
--

-- en
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size');

-- ru
INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 2, 'Переключатели'),
(2, 2, 'Флажки'),
(4, 2, 'Текстовое поле'),
(6, 2, 'Многострочный текст'),
(8, 2, 'Дата'),
(7, 2, 'Файл'),
(5, 2, 'Список'),
(9, 2, 'Время'),
(10, 2, 'Дата и Время'),
(12, 2, 'Дата доставки'),
(11, 2, 'Размер');

-----------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-----------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_option_value_description`
--

-- en
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- ru
INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 2, 1, 'Большой'),
(32, 2, 1, 'Маленький'),
(45, 2, 2, 'Флажок 4'),
(44, 2, 2, 'Флажок 3'),
(31, 2, 1, 'Средний'),
(42, 2, 5, 'Желтый'),
(41, 2, 5, 'Зеленый'),
(39, 2, 5, 'Красный'),
(40, 2, 5, 'Синий'),
(23, 2, 2, 'Флажок 1'),
(24, 2, 2, 'Флажок 2'),
(48, 2, 11, 'Большой'),
(47, 2, 11, 'Средний'),
(46, 2, 11, 'Маленький');

-----------------------------------------------------------

--
-- Table structure for table `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

DROP TABLE IF EXISTS `oc_order_recurring`;
CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

DROP TABLE IF EXISTS `oc_order_recurring_transaction`;
CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_order_shipment`
--

DROP TABLE IF EXISTS `oc_order_shipment`;
CREATE TABLE `oc_order_shipment` (
  `order_shipment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `shipping_courier_id` varchar(255) NOT NULL DEFAULT '',
  `tracking_number` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_shipment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-----------------------------------------------------------

--
-- Table structure for table `oc_shipping_courier`
--

DROP TABLE IF EXISTS `oc_shipping_courier`;
CREATE TABLE `oc_shipping_courier` (
  `shipping_courier_id` int(11) NOT NULL,
  `shipping_courier_code` varchar(255) NOT NULL DEFAULT '',
  `shipping_courier_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`shipping_courier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_shipping_courier`
--

INSERT INTO `oc_shipping_courier` (`shipping_courier_id`, `shipping_courier_code`, `shipping_courier_name`) VALUES
  (1, 'dhl', 'DHL'),
  (2, 'fedex', 'Fedex'),
  (3, 'ups', 'UPS'),
  (4, 'royal-mail', 'Royal Mail'),
  (5, 'usps', 'United States Postal Service'),
  (6, 'auspost', 'Australia Post');

-----------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_order_status`
--

-- en
INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(5, 1, 'Complete'),
(7, 1, 'Canceled'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(14, 1, 'Expired'),
(15, 1, 'Processed'),
(16, 1, 'Voided'),
(17, 1, 'Handed over'),
(18, 1, 'Equippedwith'),
(19, 1, 'Bought elsewhere'),
(20, 1, 'Not satisfied with the price'),
(21, 1, 'Agreed with the client'),
(22, 1, 'Delivery postponed'),
(23, 1, 'Prepayment Received'),
(24, 1, 'Invoice created');

-- ru
INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 2, 'Ожидает'),
(2, 2, 'Обрабатывается'),
(3, 2, 'Отправлен'),
(5, 2, 'Завершен'),
(7, 2, 'Отменен'),
(8, 2, 'Отклонен'),
(9, 2, 'Отменено Аннулирование'),
(10, 2, 'Не удался'),
(11, 2, 'Возвращен'),
(12, 2, 'Аннулирован'),
(13, 2, 'Возмещен'),
(14, 2, 'Истек'),
(15, 2, 'Обработан'),
(16, 2, 'Аннулирован'),
(17, 2, 'Передан в комплектацию'),
(18, 2, 'Укомплектован'),
(19, 2, 'Купил в другом месте'),
(20, 2, 'Не устроила цена'),
(21, 2, 'Согласовано с клиентом'),
(22, 2, 'Доставка перенесена'),
(23, 2, 'Предоплата поступила'),
(24, 2, 'Создана накладная');

-----------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '7500.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '1999.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '7500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '6000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '7500.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '15000.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '7500.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '7500.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '7500.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '7575.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '7500.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '7500.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 0, '2009-02-03 21:07:37', '2011-09-30 00:46:19'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '37500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '75000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '150000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '75000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '7500.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 0, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '7500.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '14999.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23');

-----------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product`
--

DROP TABLE IF EXISTS `oc_googleshopping_product`;
CREATE TABLE `oc_googleshopping_product` (
  `product_advertise_google_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `has_issues` tinyint(1) DEFAULT NULL,
  `destination_status` enum('pending','approved','disapproved') NOT NULL DEFAULT 'pending',
  `impressions` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `conversions` int(11) NOT NULL DEFAULT '0',
  `cost` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `conversion_value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `google_product_category` varchar(10) DEFAULT NULL,
  `condition` enum('new','refurbished','used') DEFAULT NULL,
  `adult` tinyint(1) DEFAULT NULL,
  `multipack` int(11) DEFAULT NULL,
  `is_bundle` tinyint(1) DEFAULT NULL,
  `age_group` enum('newborn','infant','toddler','kids','adult') DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `gender` enum('male','female','unisex') DEFAULT NULL,
  `size_type` enum('regular','petite','plus','big and tall','maternity') DEFAULT NULL,
  `size_system` enum('AU','BR','CN','DE','EU','FR','IT','JP','MEX','UK','US') DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `is_modified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_advertise_google_id`),
  UNIQUE KEY `product_id_store_id` (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-----------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product_status`
--

DROP TABLE IF EXISTS `oc_googleshopping_product_status`;
CREATE TABLE `oc_googleshopping_product_status` (
  `product_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `product_variation_id` varchar(64) NOT NULL DEFAULT '',
  `destination_statuses` text NOT NULL,
  `data_quality_issues` text NOT NULL,
  `item_level_issues` text NOT NULL,
  `google_expiration_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`,`product_variation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-----------------------------------------------------------

--
-- Table structure for table `oc_googleshopping_product_target`
--

DROP TABLE IF EXISTS `oc_googleshopping_product_target`;
CREATE TABLE `oc_googleshopping_product_target` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `advertise_google_target_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`product_id`,`advertise_google_target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-----------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_attribute`
--

-- en
INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb'),
(42, 3, 1, '100mhz'),
(47, 2, 1, '4');

-- ru
INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 2, '1'),
(47, 4, 2, '16Гб'),
(43, 4, 2, '8Гб'),
(42, 3, 2, '100МГц'),
(47, 2, 2, '4');

-----------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_description`
--

-- en
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there''s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it''s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple''s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'sdf', '', '');

-- ru
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(35, 2, 'Продукт 8', '&lt;p&gt;\r\n	Продукт 8&lt;/p&gt;\r\n', '', 'Продукт 8', '', ''),
(48, 2, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Больше места для перемещения.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			С 80ГБ или 160ГБ памяти и до 40 часов автономной работы, новый iPod classic позволяет Вам прослушивать до 40 000 песен или до 200 часов видео или любой комбинации в любом месте, где бы Вы ни находились.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Поток покрытия.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Просмотрите свою музыкальную коллекцию, пролистывая обложки альбомов. Выберите альбом, чтобы перевернуть его и увидеть список треков.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Улучшенный интерфейс.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Испытайте совершенно новый способ просмотра и просмотра музыки и видео.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Более изящный дизайн.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Красивый, прочный и изящный, как никогда, iPod classic теперь имеет корпус из анодированного алюминия и полированной нержавеющей стали с закругленными краями.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', ''),
(40, 2, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone - это революционно новый мобильный телефон, который позволяет совершать вызовы, просто нажав имя или номер в адресной книге, списке избранного или журнале вызовов. Он также автоматически синхронизирует все Ваши контакты с ПК, Mac или интернет-службы. И это позволяет Вам выбирать и прослушивать сообщения голосовой почты в любом порядке, как Вы хотите, как электронная почта.&lt;/p&gt;\r\n', '', 'iPhone', '', ''),
(28, 2, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - в высоком разрешении. Просматривайте музыкальные видео и потоковое содержимое с впечатляющей четкостью в высоком разрешении для мобильных устройств, о которых Вы никогда не думали, что это возможно. HTC Touch HD обладает привлекательным внешним видом и обеспечивает мобильную функциональность нового поколения простым прикосновением. Полностью интегрированный с Windows Mobile Professional 6.1, сверхскоростной 3.5G, GPS, 5-мегапиксельная камера и многое другое - все это доступно на потрясающе четком 3,8-дюймовом сенсорном WVGA-экране - Вы можете управлять своим мобильным миром с помощью HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Особенности&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Процессор Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 МГц&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Операционная система Windows Mobile&amp;reg; 6.1 Professional&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Память: 512 МБ ПЗУ, 288 МБ ОЗУ&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Размеры: 115 мм x 62.8 мм x 12 мм / 146.4 г&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3,8-дюймовый TFT-LCD плоский сенсорный экран с разрешением 480 x 800 WVGA&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Европа/Азия: 900/2100 МГц; Скорость восходящего соединения до 2 Мбит/с и скорость нисходящего канала 7,2 Мбит/с&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Четырехдиапазонный GSM/GPRS/EDGE: Европа/Азия: 850/900/1800/1900МГц (частота полосы, доступность HSUPA и скорость передачи данных зависят от оператора.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Управление устройством через HTC TouchFLO&amp;trade; 3D &amp;amp; Сенсорные кнопки на передней панели&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS и A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 с повышенной скоростью передачи данных и A2DP для беспроводных стереогарнитур&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-пин мини-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5-мегапиксельная цветная камера с автофокусом&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Цветная камера VGA CMOS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Встроенный аудиоразъем 3,5 мм, микрофон, динамик и FM-радио&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Форматы мелодий звонка: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 полифонических и стандартных форматов 0 и 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Перезаряжаемая литий-ионная или литий-ионная полимерная батарея емкостью 1350мАч&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Слот расширения: карта памяти microSD&amp;trade; (совместимая с SD 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Адаптер переменного тока Диапазон/частота напряжения: 100 ~ 240В переменного тока, выход 50/60Гц постоянного тока: 5В и 1А&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Особенности: FM-радио, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', ''),
(44, 2, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air - ультратонкий, ультрапортативный и ультра в отличие от всего остального. Но Вы не потеряете ни дюйма, ни фунта за ночь. Это результат переосмысления соглашений. Из множества беспроводных инноваций. И прорывного дизайна. С MacBook Air мобильные вычисления неожиданно обрели новый стандарт.&lt;/div&gt;\r\n', '', 'MacBook Air', '', ''),
(45, 2, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Новейшая мобильная архитектура Intel&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Новый CoreBook Duo MacBook Pro на базе самых современных мобильных процессоров Intel на 50% быстрее, чем оригинальный Core Duo MacBook Pro, и теперь поддерживает до 4 ГБ оперативной памяти.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Передовая графика&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			NVIDIA GeForce 8600M GT обеспечивает исключительную производительность графической обработки. Для идеального творческого холста Вы даже можете настроить 17-дюймовую модель с дисплеем с разрешением 1920 x 1200.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Предназначен для жизни на дороге&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Инновации, такие как подключение к магнитному источнику питания и клавиатура с подсветкой и датчиком внешней освещенности, превращают MacBook Pro в отдельный класс.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Подключайся. Создавай. Общайся.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Быстро настроить видеоконференцию с помощью встроенной камеры iSight. Управляйте презентациями и мультимедиа на расстоянии до 30 футов с помощью прилагаемого пульта Apple Remote. Подключайтесь к периферийным устройствам с высокой пропускной способностью с FireWire 800 и DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Беспроводная связь следующего поколения&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Благодаря беспроводной технологии 802.11n, MacBook Pro обеспечивает пятикратную производительность и вдвое больший диапазон технологий предыдущего поколения..&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', ''),
(29, 2, 'Palm Treo Pro', '&lt;p&gt;\r\n	Пересмотрите свой рабочий день со смартфоном Palm Treo Pro. Идеально сбалансированный, Вы можете отвечать на деловую и личную электронную почту, быть в курсе встреч и контактов и использовать Wi-Fi или GPS, когда Вы в пути. Затем посмотрите видео на YouTube, узнайте новости и спорт в Интернете или послушайте несколько песен. Сбалансируйте свою работу и играйте так, как Вам нравится, с Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Особенности&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Процессор Qualcomm&amp;reg; MSM7201 400МГц&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Цветной TFT сенсорный экран 320x320&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM радио&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Трехдиапазонный UMTS &amp;mdash; 850МГц, 1900МГц, 2100МГц&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Четырехдиапазонный GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g с аутентификацией WPA, WPA2 и 801.1x&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Встроенный GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Версия Bluetooth: 2.0 + повышенная скорость передачи данных&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256 МБ памяти (доступно 100 МБ), 128 МБ ОЗУ&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2,0-мегапиксельная камера, 8-кратный цифровой зум и захват видео&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Съемный литий-ионный аккумулятор 1500 мАч&lt;/li&gt;\r\n	&lt;li&gt;\r\n		До 5 часов в режиме разговора и до 250 часов в режиме ожидания&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Расширение карты MicroSDHC (поддерживается до 32 ГБ)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 для синхронизации и зарядки&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3,5 мм разъем для стереогарнитуры&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60мм (Ш) x 114мм (Д) x 13.5мм (Т) / 133г&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', ''),
(36, 2, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Видео в Вашем кармане.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Это маленький iPod с одной очень большой идеей: видео. Самый популярный в мире музыкальный проигрыватель теперь позволяет смотреть фильмы, телепередачи и многое другое на двухдюймовом дисплее, который на 65% ярче, чем раньше.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Обложка.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Просмотрите свою музыкальную коллекцию, пролистывая обложки альбомов. Выберите альбом, чтобы перевернуть его и увидеть список треков.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Улучшенный интерфейс.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Испытайте совершенно новый способ просмотра и просмотра музыки и видео.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Гладкий и красочный.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		IPod nano с корпусом из анодированного алюминия и полированной нержавеющей стали и возможностью выбора из пяти цветов способен произвести впечатление.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Доступный для бесплатной загрузки, iTunes позволяет легко просматривать и покупать миллионы песен, фильмов, телешоу, аудиокниг и игр, а также загружать бесплатные подкасты в iTunes Store. И Вы можете импортировать свою собственную музыку, управлять всей медиатекой и синхронизировать iPod или iPhone с легкостью.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', ''),
(46, 2, 'Sony VAIO', '&lt;div&gt;\r\n	Беспрецедентная сила. Следующее поколение технологий обработки пришло. В новейшие ноутбуки VAIO заложены последние, самые мощные инновации Intel&amp;#39;s, процессорная технология: Intel&amp;reg; Centrino&amp;reg; 2. Обладая невероятной скоростью, расширенной беспроводной связью, расширенной поддержкой мультимедиа и большей эффективностью энергопотребления, все высокопроизводительные компоненты легко объединяются в один чип.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', ''),
(47, 2, 'HP LP3065', '&lt;p&gt;\r\n	Остановите своих коллег на своем пути с потрясающим новым 30-дюймовым диагональным плоскопанельным монитором HP LP3065. Этот флагманский монитор обладает лучшими в своем классе характеристиками производительности и презентаций на огромном широкоформатном экране, позволяя Вам работать максимально комфортно - Вы даже можете забыть, что находитесь в офисе&lt;/p&gt;\r\n', '', 'HP LP3065', '', ''),
(32, 2, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Революционный мультитач интерфейс.&lt;/strong&gt;&lt;br /&gt;\r\n	В iPod touch используется та же технология мультитач, что и в iPhone. Щепотка, чтобы увеличить фотографию. Прокрутите свои песни и видео с движением. Пролистайте свою библиотеку по обложкам альбомов с Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Великолепный 3,5-дюймовый широкоформатный дисплей.&lt;/strong&gt;&lt;br /&gt;\r\n	Смотрите свои фильмы, телепередачи и фотографии с яркими и яркими цветами на дисплее с разрешением 320 х 480 пикселей.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Загрузка музыки прямо из iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Совершайте покупки в музыкальном магазине iTunes Wi-Fi из любой точки мира с помощью Wi-Fi.1. Найдите или найдите нужную музыку, просмотрите ее и купите ее одним касанием..&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Посижу в интернете с Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Просматривайте веб-страницы с помощью Safari и смотрите видео YouTube на первом iPod со встроенным Wi-Fi&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', ''),
(41, 2, 'iMac', '&lt;div&gt;\r\n	Просто, когда Вы думали, что у iMac есть все, теперь еще больше. Более мощные процессоры Intel Core 2 Duo. И еще стандарт памяти. Объедините это с Mac OS X Leopard и iLife &acute;08, и это больше, чем когда-либо. iMac обеспечивает потрясающую производительность в невероятно компактном пространстве.&lt;/div&gt;\r\n', '', 'iMac', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Представьте себе преимущества роста без замедления. Большой 19-дюймовый монитор 941BW сочетает в себе широкий формат изображения с быстрым временем отклика пикселей, что позволяет получать более крупные изображения, больше места для работы и четкое движение. Кроме того, эксклюзивные технологии MagicBright 2, MagicColor и MagicTune помогают обеспечить идеальное изображение в любой ситуации, а Гладкие узкие рамки и регулируемые подставки обеспечивают стильный дизайн в соответствии с Вашими потребностями.С широкоформатным аналоговым/цифровым ЖК-монитором Samsung 941BW это не сложно представить.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', ''),
(34, 2, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Рожденный носить.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Клип на самый носимый музыкальный проигрыватель в мире и взять с собой до 240 песен в любом месте. Выберите один из пяти цветов, включая четыре новых оттенка, чтобы сделать Ваше музыкальное выражение моды.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Рандом встречает ритм.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Благодаря автозаполнению iTunes iPod shuffle может доставить новый музыкальный опыт при каждой синхронизации. Для большей случайности Вы можете перемешивать песни во время воспроизведения с помощью ползунка переключателя.&lt;/p&gt;\r\n	&lt;strong&gt;Все легко.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Зарядка и синхронизация с USB-док-станцией. Управляйте элементами управления iPod shuffle одной рукой. Наслаждайтесь музыкой в течение 12 часов без пропусков.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', ''),
(43, 2, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Процессор Intel Core 2 Duo&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Работающий на процессоре Intel Core 2 Duo со скоростью до 2,16 ГГц, новый MacBook является самым быстрым.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1 ГБ
памяти, большие жесткие диски&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Новый MacBook теперь поставляется со стандартным объемом памяти 1 ГБ и большими жесткими дисками для всей линейки, что идеально подходит для запуска большего количества Ваших любимых приложений и хранения растущих медиа-коллекций.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Гладкий, 1,08-дюймовый тонкий дизайн&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook позволяет легко отправиться в путь благодаря прочному поликарбонатному корпусу, встроенным беспроводным технологиям и инновационному адаптеру питания MagSafe, который автоматически отключается, если кто-то случайно споткнется о шнур.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Встроенная камера iSight&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Прямо из коробки Вы можете пообщаться в видеочате с друзьями или семьей, 2 записать видео на своем столе или сделать веселые снимки с помощью Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(31, 2, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		D300 с технологией 12,3 мегапикселя и эффективными функциями, созданными на профессиональном уровне, сочетает в себе совершенно новые технологии с расширенными функциями, унаследованными от недавно анонсированной профессиональной цифровой зеркальной камеры D3 Nikon, и предлагает серьезным фотографам замечательную производительность в сочетании с маневренностью.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Подобно D3, D300 оснащен эксклюзивной системой обработки изображений EXPEED от Nikon, которая играет ключевую роль в обеспечении скорости и вычислительной мощности, необходимых для многих новых функций камеры. D300 оснащен новой 51-точечной системой автофокусировки с функцией отслеживания фокуса 3D Nikon и двумя новыми режимами съемки LiveView, которые позволяют пользователям делать снимки с помощью ЖК-монитора с высоким разрешением камеры. D300 использует ту же систему распознавания сцен, что и D3; он обещает значительно повысить точность автофокуса, автоэкспозиции и автоматического баланса белого, распознавая фотографируемый объект или сцену и применяя эту информацию к вычислениям для трех функций.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		D300 реагирует с молниеносной скоростью, включается всего за 0,13 секунды и снимает с незаметной задержкой срабатывания затвора в 45 миллисекунд. D300 способен снимать со скоростью шесть кадров в секунду и может развивать скорость до восьми кадров в секунду, если используется дополнительный аккумуляторный блок питания MB-D10. В непрерывном режиме D300 может делать до 100 снимков с полным разрешением 12,3 мегапикселя. (Настройка изображения NORMAL-LARGE с использованием карты памяти SanDisk Extreme IV 1 ГБ CompactFlash.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		D300 включает в себя ряд инновационных технологий и функций, которые значительно улучшат точность, контроль и производительность, которые фотографы могут получить от своего оборудования. В новой системе распознавания сюжетов используется известный датчик Nikon с 1 005 сегментами, позволяющий распознавать цвета и узоры света, которые помогают камере определять объект и тип снимаемой сцены перед съемкой. Эта информация используется для повышения точности функций автофокуса, автоэкспозиции и автоматического баланса белого в D300. Например, камера может лучше отслеживать движущиеся объекты и, идентифицируя их, она также может автоматически выбирать точки фокусировки быстрее и с большей точностью. Он также может анализировать блики и более точно определять экспозицию, а также определять источники света для более точного определения баланса белого.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 - самый тонкий в мире планшет с толщиной 8,6 мм, работающий под управлением ОС Android 3.0 Honeycomb на двухъядерном процессоре Tegra 2 с тактовой частотой 1 ГГц, аналогичном младшему брату Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 обеспечивает чистый опыт работы с Android 3.0, добавив новый TouchWiz UX или TouchWiz 4.0 - включает в себя панель в реальном времени, которая позволяет настраивать различный контент, например фотографии, закладки и социальные сети, с емкостью 10,1 дюйма WXGA. сенсорный экран с разрешением 1280 x 800 пикселей, оснащенный 3-мегапиксельной задней камерой со светодиодной вспышкой и 2-мегапиксельной фронтальной камерой, возможностью подключения HSPA + до 21 Мбит / с, возможностью записи видео 720p HD, воспроизведения HD-видео 1080p, поддержкой DLNA, Bluetooth 2.1, USB 2.0 , гироскоп, Wi-Fi 802.11 a / b / g / n, слот micro-SD, разъем для наушников 3,5 мм и слот для SIM-карты, включая Samsung Stick - микрофон Bluetooth, который можно носить в кармане, например, ручку и звуковую док-станцию. с активным сабвуфером.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 выпускается в версиях 16ГБ/32ГБ/64ГБ и предварительно загружен с Social Hub, Reader&amp;rsquo;s Hub, Music Hub и Samsung Mini Apps Tray - что дает вам доступ к более часто используемым приложениям, облегчающим многозадачность, и способно Adobe Flash Player 10.2, работает от батареи 6860 мАч, что дает вам 10 часов времени воспроизведения видео.&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', ''),
(42, 2, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;30-дюймовый дисплей Apple Cinema HD обеспечивает потрясающее разрешение 2560 x 1600 пикселей. Разработанный специально для творческого профессионала, этот дисплей обеспечивает больше места для более удобного доступа ко всем инструментам и палитрам, необходимым для редактирования, форматирования и компоновки Вашей работы. Объедините этот дисплей с Mac Pro, MacBook Pro или PowerMac G5, и нет предела тому, чего Вы можете достичь. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Cinema HD оснащен жидкокристаллическим дисплеем с активной матрицей, который создает изображения без мерцания, обеспечивающие вдвое большую яркость, вдвое большую четкость и удвоенный коэффициент контрастности по сравнению с обычным ЭЛТ-дисплеем. В отличие от других плоских панелей, он разработан с чисто цифровым интерфейсом, что позволяет получать изображения без искажений, которые никогда не нуждаются в настройке. Дисплей с более чем 4 миллионами цифровых пикселей идеально подходит для научных и технических приложений, таких как визуализация молекулярных структур или анализ геологических данных. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Предлагая точную, блестящую цветопередачу, Cinema HD обеспечивает до 16,7 миллионов цветов по широкой гамме, позволяя увидеть тонкие нюансы между цветами от мягких пастельных оттенков до насыщенных оттенков драгоценных камней. Широкий угол обзора обеспечивает равномерный цвет от края до края. Технология Apple ColorSync позволяет создавать пользовательские профили, чтобы поддерживать постоянный цвет на экране и при печати. Результат: Вы можете уверенно использовать этот дисплей во всех Ваших цветных приложениях. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Дисплей имеет новый алюминиевый дизайн и имеет очень тонкую рамку, которая повышает визуальную точность. Каждый дисплей оснащен двумя портами FireWire 400 и двумя портами USB 2.0, что делает подключение периферийных устройств, таких как iSight, iPod, цифровые и фотокамеры, жесткие диски, принтеры и сканеры, еще более доступным и удобным. Используя преимущества более тонкого и легкого размера ЖК-дисплея, новые дисплеи поддерживают стандарт интерфейса монтажа VESA (Ассоциация стандартов видеоэлектроники). Клиенты с дополнительным комплектом адаптеров VESA для крепления к кинотеатру Cinema Display получают возможность устанавливать свои дисплеи в местах, наиболее подходящих для их рабочей среды. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Cinema HD имеет единый дизайн кабеля с элегантным разъемом для USB 2.0, FireWire 400 и чисто цифровое соединение с использованием интерфейса цифрового видеоинтерфейса (DVI) промышленного стандарта. Соединение DVI позволяет прямое чисто цифровое соединение.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Особенности:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Непревзойденная производительность дисплея&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-дюймовый жидкокристаллический дисплей с активной матрицей обеспечивает потрясающее качество изображения и насыщенный насыщенный цвет.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Поддержка разрешения 2560 на 1600 пикселей для отображения неподвижных и видеоизображений высокой четкости.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Широкоформатный дизайн для одновременного отображения двух полных страниц текста и графики.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Разъем DVI промышленного стандарта для прямого подключения к настольным компьютерам и ноутбукам на базе Mac и Windows&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Невероятно широкий (170 градусов) горизонтальный и вертикальный угол обзора для максимальной видимости и цветопередачи.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Молниеносный пиксельный отклик для полноценного воспроизведения цифрового видео.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Поддержка 16,7 миллионов насыщенных цветов для использования во всех графических приложениях.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Простая настройка и эксплуатация&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Один кабель с элегантным разъемом для подключения к портам DVI, USB и FireWire&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Встроенный двухпортовый концентратор USB 2.0 для простого подключения периферийных устройств настольного компьютера.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Два порта FireWire 400 для поддержки iSight и других настольных периферийных устройств&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Гладкий, элегантный дизайн&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Огромное виртуальное рабочее пространство, очень маленькая площадь.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Узкий дизайн лицевой панели для минимизации визуального воздействия при использовании двух дисплеев&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Уникальный дизайн петель для легкой регулировки&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Поддержка решений VESA для монтажа (Apple Cinema Display VESA Mount Adapter продается отдельно)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Технические характеристики&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Размер экрана (размер изображения по диагонали)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Дисплей Apple Cinema HD: 30 дюймов (для просмотра 29,7 дюйма)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Тип экрана&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Тонкопленочный транзисторный (TFT) жидкокристаллический дисплей с активной матрицей (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Разрешения&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 пикселей (оптимальное разрешение)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Цвета дисплея (максимум)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 миллиона&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Угол обзора (типичный)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° по горизонтали; 170° по вертикали&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Яркость (типичная)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-дюймовый Cinema HD дисплей: 400 кд/м2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Коэффициент контрастности (типичный)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Время отклика (типичное)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Шаг пикселя&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-дюймовый дисплей Cinema HD: 0,250 мм&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Обработка экрана&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Антибликовое покрытие&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Пользовательские элементы управления (аппаратное и программное обеспечение)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Включение дисплея,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Система сна, пробуждения&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Яркость&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Наклон монитора&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Разъемы и кабели&lt;/b&gt;&lt;br&gt;\r\n	Кабель&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (цифровой визуальный интерфейс)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Мощность постоянного тока (24 В)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Соединители&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Двухпортовый концентратор USB 2.0 с автономным питанием&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Два порта FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Порт безопасности Kensington&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA адаптер для крепления&lt;/b&gt;&lt;br&gt;\r\n	Требуется дополнительный монтажный адаптер VESA Cinema Display (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Совместим с монтажными решениями, совместимыми с VESA FDMI (MIS-D, 100, C)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Электрические требования&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Входное напряжение: 100-240 В перем. Тока 50-60 Гц&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Максимальная мощность при работе: 150 Вт&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Режим энергосбережения: 3 Вт или менее&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Требования к окружающей среде&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Рабочая температура: от 50° до 95° F (от 10° до 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Температура хранения: -40° до 116° F (-40° до 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Рабочая влажность: от 20% до 80% без конденсации&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Максимальная рабочая высота: 10000 футов&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Одобрения агентства&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO ''03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Размер и вес&lt;/b&gt;&lt;br&gt;\r\n	30-дюймовый дисплей Apple Cinema HD&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Высота: 21,3 дюйма (54,3 см)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ширина: 27,2 дюйма (68,8 см)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Глубина: 8,46 дюймов (21,5 см)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Вес: 27,5 фунтов (12,5 кг)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Системные Требования&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, все графические опции&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) с ATI Radeon 9650 или выше или NVIDIA GeForce 6800 GT DDL или лучше&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), все графические опции&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 с поддержкой двухканальной DVI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ПК с Windows и графическая карта с поддержкой портов DVI с двойной полосой пропускания и стандартом VESA DDC для настройки plug-and-play&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30', '', ''),
(30, 2, 'Canon EOS 5D', '&lt;p&gt;\r\n	В пресс-материале Canon для EOS 5D говорится, что он «определяет (а) новую категорию D-SLR», в то время как мы, как правило, не слишком заинтересованы в маркетинговых разговорах, это конкретное утверждение явно довольно точно. EOS 5D отличается от любых предыдущих цифровых зеркальных фотокамер тем, что в нем сочетаются полнокадровый (размером 35 мм) сенсор высокого разрешения (12,8 мегапикселя) с относительно компактным корпусом (чуть больше, чем у EOS 20D, хотя в вашей руке он ощущается заметно ». более короткий "). EOS 5D предназначен для установки между EOS 20D и профессиональными цифровыми зеркальными фотокамерами EOS-1D. Важное отличие по сравнению с последним заключается в том, что EOS 5D не имеет никаких уплотнений окружающей среды. Хотя Canon специально не называет EOS 5D «профессиональной» цифровой зеркальной фотокамерой, она, несомненно, понравится профессионалам, которые хотят иметь высококачественную цифровую зеркальную фотокамеру с корпусом легче, чем EOS-1D. Это также, несомненно, понравится нынешним владельцам EOS 20D (хотя, будем надеяться, они не купили слишком много объективов EF-S...)&lt;/p&gt;\r\n', '', 'sdf', '', '');

-----------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(440, 42, 1, 30, 1, '4950.0000', '0000-00-00', '0000-00-00'),
(439, 42, 1, 20, 1, '5775.0000', '0000-00-00', '0000-00-00'),
(438, 42, 1, 10, 1, '6600.0000', '0000-00-00', '0000-00-00');

-----------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2345, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2344, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2317, 42, 'catalog/demo/canon_logo.jpg', 0),
(2316, 42, 'catalog/demo/hp_1.jpg', 0),
(2315, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2314, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2313, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 'test', 1),
(219, 42, 8, '2011-02-20', 1),
(222, 42, 7, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(226, 30, 5, '', 1);

-----------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+');

-----------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

DROP TABLE IF EXISTS `oc_product_recurring`;
CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-----------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(515, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(539, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-----------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(419, 42, 1, 1, '6750.0000', '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, '6750.0000', '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, '6000.0000', '0000-00-00', '0000-00-00');

-----------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

-----------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

DROP TABLE IF EXISTS `oc_recurring`;
CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

DROP TABLE IF EXISTS `oc_recurring_description`;
CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return_action`
--

-- en
INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- ru
INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 2, 'Возмещено'),
(2, 2, 'Выдан Кредит'),
(3, 2, 'Замена Отправлена');

-----------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return_reason`
--

-- en
INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- ru
INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 2, 'Мертв по прибытии'),
(2, 2, 'Получен неверный элемент'),
(3, 2, 'Ошибка заказа'),
(4, 2, 'Неисправность, пожалуйста, предоставьте информацию'),
(5, 2, 'Другое, пожалуйста, предоставьте детали');

-----------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_return_status`
--

-- en
INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- ru
INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, 'В ожидании'),
(3, 2, 'Выполнен'),
(2, 2, 'В ожидании Продуктов');

-----------------------------------------------------------

--
-- Table structure for table `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_statistics`
--

DROP TABLE IF EXISTS `oc_statistics`;
CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  PRIMARY KEY (`statistics_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


--
-- Dumping data for table `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', 0),
(2, 'order_processing', 0),
(3, 'order_complete', 0),
(4, 'order_other', 0),
(5, 'returns', 0),
(6, 'product', 0),
(7, 'review', 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(0, 'config', 'config_shared', '0', 0),
(0, 'config', 'config_secure', '0', 0),
(0, 'voucher', 'total_voucher_sort_order', '8', 0),
(0, 'voucher', 'total_voucher_status', '1', 0),
(0, 'config', 'config_fraud_detection', '0', 0),
(0, 'config', 'config_ftp_status', '0', 0),
(0, 'config', 'config_ftp_root', '', 0),
(0, 'config', 'config_ftp_password', '', 0),
(0, 'config', 'config_ftp_username', '', 0),
(0, 'config', 'config_ftp_port', '21', 0),
(0, 'config', 'config_ftp_hostname', '', 0),
(0, 'config', 'config_meta_title', 'Ваш магазин', 0),
(0, 'config', 'config_meta_description', 'Мой магазин', 0),
(0, 'config', 'config_meta_keyword', '', 0),
(0, 'config', 'config_theme', 'default', 0),
(0, 'config', 'config_layout_id', '4', 0),
(0, 'config', 'config_country_id', '176', 0),
(0, 'config', 'config_zone_id', '2757', 0),
(0, 'config', 'config_language', 'ru-ru', 0),
(0, 'config', 'config_admin_language', 'ru-ru', 0),
(0, 'config', 'config_currency', 'RUB', 0),
(0, 'config', 'config_currency_auto', '1', 0),
(0, 'config', 'config_length_class_id', '1', 0),
(0, 'config', 'config_weight_class_id', '1', 0),
(0, 'config', 'config_product_count', '1', 0),
(0, 'config', 'config_limit_admin', '20', 0),
(0, 'config', 'config_review_status', '1', 0),
(0, 'config', 'config_review_guest', '1', 0),
(0, 'config', 'config_voucher_min', '1', 0),
(0, 'config', 'config_voucher_max', '1000', 0),
(0, 'config', 'config_tax', '1', 0),
(0, 'config', 'config_tax_default', 'shipping', 0),
(0, 'config', 'config_tax_customer', 'shipping', 0),
(0, 'config', 'config_customer_online', '0', 0),
(0, 'config', 'config_customer_activity', '0', 0),
(0, 'config', 'config_customer_search', '0', 0),
(0, 'config', 'config_customer_group_id', '1', 0),
(0, 'config', 'config_customer_group_display', '["1"]', 1),
(0, 'config', 'config_customer_price', '0', 0),
(0, 'config', 'config_account_id', '3', 0),
(0, 'config', 'config_invoice_prefix', 'INV-2020-00', 0),
(0, 'config', 'config_api_id', '1', 0),
(0, 'config', 'config_cart_weight', '1', 0),
(0, 'config', 'config_checkout_guest', '1', 0),
(0, 'config', 'config_checkout_id', '5', 0),
(0, 'config', 'config_order_status_id', '1', 0),
(0, 'config', 'config_processing_status', '["5","1","2","12","3"]', 1),
(0, 'config', 'config_complete_status', '["5","3"]', 1),
(0, 'config', 'config_stock_display', '0', 0),
(0, 'config', 'config_stock_warning', '0', 0),
(0, 'config', 'config_stock_checkout', '0', 0),
(0, 'config', 'config_affiliate_approval', '0', 0),
(0, 'config', 'config_affiliate_auto', '0', 0),
(0, 'config', 'config_affiliate_commission', '5', 0),
(0, 'config', 'config_affiliate_id', '4', 0),
(0, 'config', 'config_return_id', '0', 0),
(0, 'config', 'config_return_status_id', '2', 0),
(0, 'config', 'config_logo', 'catalog/logo.png', 0),
(0, 'config', 'config_icon', 'catalog/cart.png', 0),
(0, 'config', 'config_comment', '', 0),
(0, 'config', 'config_open', '', 0),
(0, 'config', 'config_image', '', 0),
(0, 'config', 'config_fax', '', 0),
(0, 'config', 'config_telephone', '123456789', 0),
(0, 'config', 'config_email', 'demo@opencart.com', 0),
(0, 'config', 'config_geocode', '', 0),
(0, 'config', 'config_owner', 'Ваше имя', 0),
(0, 'config', 'config_address', 'Адрес 1', 0),
(0, 'config', 'config_name', 'Ваш магазин', 0),
(0, 'config', 'config_seo_url', '0', 0),
(0, 'config', 'config_file_max_size', '300000', 0),
(0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(0, 'config', 'config_maintenance', '0', 0),
(0, 'config', 'config_password', '1', 0),
(0, 'config', 'config_encryption', '', 0),
(0, 'config', 'config_compression', '0', 0),
(0, 'config', 'config_error_display', '1', 0),
(0, 'config', 'config_error_log', '1', 0),
(0, 'config', 'config_error_filename', 'error.log', 0),
(0, 'config', 'config_google_analytics', '', 0),
(0, 'config', 'config_mail_engine', 'mail', 0),
(0, 'config', 'config_mail_parameter', '', 0),
(0, 'config', 'config_mail_smtp_hostname', '', 0),
(0, 'config', 'config_mail_smtp_username', '', 0),
(0, 'config', 'config_mail_smtp_password', '', 0),
(0, 'config', 'config_mail_smtp_port', '25', 0),
(0, 'config', 'config_mail_smtp_timeout', '5', 0),
(0, 'config', 'config_mail_alert_email', '', 0),
(0, 'config', 'config_mail_alert', '["order"]', 1),
(0, 'config', 'config_captcha', 'basic', 0),
(0, 'config', 'config_captcha_page', '["register","guest","review","return","contact"]', 1),
(0, 'config', 'config_login_attempts', '5', 0),
(0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(0, 'payment_cod', 'payment_cod_status', '1', 0),
(0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(0, 'total_sub_total', 'total_sub_total_sort_order', '1', 0),
(0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(0, 'total_tax', 'total_tax_status', '1', 0),
(0, 'total_total', 'total_total_sort_order', '9', 0),
(0, 'total_total', 'total_total_status', '1', 0),
(0, 'total_tax', 'total_tax_sort_order', '5', 0),
(0, 'total_credit', 'total_credit_sort_order', '7', 0),
(0, 'total_credit', 'total_credit_status', '1', 0),
(0, 'total_reward', 'total_reward_sort_order', '2', 0),
(0, 'total_reward', 'total_reward_status', '1', 0),
(0, 'total_shipping', 'total_shipping_status', '1', 0),
(0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(0, 'total_coupon', 'total_coupon_status', '1', 0),
(0, 'module_category', 'module_category_status', '1', 0),
(0, 'module_account', 'module_account_status', '1', 0),
(0, 'theme_default', 'theme_default_product_limit', '15', 0),
(0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(0, 'theme_default', 'theme_default_directory', 'default', 0),
(0, 'theme_default', 'theme_default_status', '1', 0),
(0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(0, 'report_marketing', 'report_marketing_status', '1', 0),
(0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(0, 'developer', 'developer_theme', '0', 0),
(0, 'developer', 'developer_sass', '0', 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_stock_status`
--

-- en
INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(9, 1, 'Coming Soon'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- ru
INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 2, 'В наличии'),
(8, 2, 'Предварительный заказ'),
(9, 2, 'Скоро в продаже'),
(5, 2, 'Нет на складе'),
(6, 2, '2-3 дня');

-----------------------------------------------------------

--
-- Table structure for table `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_class`
--

-- en
INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- ru
INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(11, 'Налоги НДС', 'Налог на добавленную стоимость', '2020-04-26 21:00:00', '2020-04-26 21:00:00');

-----------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_rate`
--

-- en
INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- ru
INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(88, 5, 'НДС (20%)', '20.0000', 'P', '2020-04-26 21:00:00', '2020-04-26 21:00:00');

-----------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

-- en
INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- ru
INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(88, 1);

-----------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-----------------------------------------------------------

--
-- Table structure for table `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_seo_url`
--

DROP TABLE IF EXISTS `oc_seo_url`;
CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`seo_url_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_seo_url`
--

-- en
INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(824, 0, 1, 'product_id=48', 'ipod-classic'),
(836, 0, 1, 'category_id=20', 'desktops'),
(834, 0, 1, 'category_id=26', 'pc'),
(835, 0, 1, 'category_id=27', 'mac'),
(730, 0, 1, 'manufacturer_id=8', 'apple'),
(772, 0, 1, 'information_id=4', 'about-us'),
(768, 0, 1, 'product_id=42', 'test'),
(789, 0, 1, 'category_id=34', 'mp3-players'),
(781, 0, 1, 'category_id=36', 'test2'),
(774, 0, 1, 'category_id=18', 'laptop-notebook'),
(775, 0, 1, 'category_id=46', 'macs'),
(776, 0, 1, 'category_id=45', 'windows'),
(777, 0, 1, 'category_id=25', 'component'),
(778, 0, 1, 'category_id=29', 'mouse'),
(779, 0, 1, 'category_id=28', 'monitor'),
(780, 0, 1, 'category_id=35', 'test1'),
(782, 0, 1, 'category_id=30', 'printer'),
(783, 0, 1, 'category_id=31', 'scanner'),
(784, 0, 1, 'category_id=32', 'web-camera'),
(785, 0, 1, 'category_id=57', 'tablet'),
(786, 0, 1, 'category_id=17', 'software'),
(787, 0, 1, 'category_id=24', 'smartphone'),
(788, 0, 1, 'category_id=33', 'camera'),
(790, 0, 1, 'category_id=43', 'test11'),
(791, 0, 1, 'category_id=44', 'test12'),
(792, 0, 1, 'category_id=47', 'test15'),
(793, 0, 1, 'category_id=48', 'test16'),
(794, 0, 1, 'category_id=49', 'test17'),
(795, 0, 1, 'category_id=50', 'test18'),
(796, 0, 1, 'category_id=51', 'test19'),
(797, 0, 1, 'category_id=52', 'test20'),
(798, 0, 1, 'category_id=58', 'test25'),
(799, 0, 1, 'category_id=53', 'test21'),
(800, 0, 1, 'category_id=54', 'test22'),
(801, 0, 1, 'category_id=55', 'test23'),
(802, 0, 1, 'category_id=56', 'test24'),
(803, 0, 1, 'category_id=38', 'test4'),
(804, 0, 1, 'category_id=37', 'test5'),
(805, 0, 1, 'category_id=39', 'test6'),
(806, 0, 1, 'category_id=40', 'test7'),
(807, 0, 1, 'category_id=41', 'test8'),
(808, 0, 1, 'category_id=42', 'test9'),
(809, 0, 1, 'product_id=30', 'canon-eos-5d'),
(840, 0, 1, 'product_id=47', 'hp-lp3065'),
(811, 0, 1, 'product_id=28', 'htc-touch-hd'),
(812, 0, 1, 'product_id=43', 'macbook'),
(813, 0, 1, 'product_id=44', 'macbook-air'),
(814, 0, 1, 'product_id=45', 'macbook-pro'),
(816, 0, 1, 'product_id=31', 'nikon-d300'),
(817, 0, 1, 'product_id=29', 'palm-treo-pro'),
(818, 0, 1, 'product_id=35', 'product-8'),
(819, 0, 1, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 0, 1, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 0, 1, 'product_id=46', 'sony-vaio'),
(837, 0, 1, 'product_id=41', 'imac'),
(823, 0, 1, 'product_id=40', 'iphone'),
(825, 0, 1, 'product_id=36', 'ipod-nano'),
(826, 0, 1, 'product_id=34', 'ipod-shuffle'),
(827, 0, 1, 'product_id=32', 'ipod-touch'),
(828, 0, 1, 'manufacturer_id=9', 'canon'),
(829, 0, 1, 'manufacturer_id=5', 'htc'),
(830, 0, 1, 'manufacturer_id=7', 'hewlett-packard'),
(831, 0, 1, 'manufacturer_id=6', 'palm'),
(832, 0, 1, 'manufacturer_id=10', 'sony'),
(841, 0, 1, 'information_id=6', 'delivery'),
(842, 0, 1, 'information_id=3', 'privacy'),
(843, 0, 1, 'information_id=5', 'terms');

-- ru
INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `query`, `keyword`) VALUES
(1024, 0, 2, 'product_id=48', 'ipod-classic_ru'),
(1036, 0, 2, 'category_id=20', 'desktops_ru'),
(1034, 0, 2, 'category_id=26', 'pc_ru'),
(1035, 0, 2, 'category_id=27', 'mac_ru'),
(930, 0, 2, 'manufacturer_id=8', 'apple_ru'),
(972, 0, 2, 'information_id=4', 'about-us_ru'),
(968, 0, 2, 'product_id=42', 'test_ru'),
(989, 0, 2, 'category_id=34', 'mp3-players_ru'),
(981, 0, 2, 'category_id=36', 'test2_ru'),
(974, 0, 2, 'category_id=18', 'laptop-notebook_ru'),
(975, 0, 2, 'category_id=46', 'macs_ru'),
(976, 0, 2, 'category_id=45', 'windows_ru'),
(977, 0, 2, 'category_id=25', 'component_ru'),
(978, 0, 2, 'category_id=29', 'mouse_ru'),
(979, 0, 2, 'category_id=28', 'monitor_ru'),
(980, 0, 2, 'category_id=35', 'test1_ru'),
(982, 0, 2, 'category_id=30', 'printer_ru'),
(983, 0, 2, 'category_id=31', 'scanner_ru'),
(984, 0, 2, 'category_id=32', 'web-camera_ru'),
(985, 0, 2, 'category_id=57', 'tablet_ru'),
(986, 0, 2, 'category_id=17', 'software_ru'),
(987, 0, 2, 'category_id=24', 'smartphone_ru'),
(988, 0, 2, 'category_id=33', 'camera_ru'),
(990, 0, 2, 'category_id=43', 'test11_ru'),
(991, 0, 2, 'category_id=44', 'test12_ru'),
(992, 0, 2, 'category_id=47', 'test15_ru'),
(993, 0, 2, 'category_id=48', 'test16_ru'),
(994, 0, 2, 'category_id=49', 'test17_ru'),
(995, 0, 2, 'category_id=50', 'test18_ru'),
(996, 0, 2, 'category_id=51', 'test19_ru'),
(997, 0, 2, 'category_id=52', 'test20_ru'),
(998, 0, 2, 'category_id=58', 'test25_ru'),
(999, 0, 2, 'category_id=53', 'test21_ru'),
(1000, 0, 2, 'category_id=54', 'test22_ru'),
(1001, 0, 2, 'category_id=55', 'test23_ru'),
(1002, 0, 2, 'category_id=56', 'test24_ru'),
(1003, 0, 2, 'category_id=38', 'test4_ru'),
(1004, 0, 2, 'category_id=37', 'test5_ru'),
(1005, 0, 2, 'category_id=39', 'test6_ru'),
(1006, 0, 2, 'category_id=40', 'test7_ru'),
(1007, 0, 2, 'category_id=41', 'test8_ru'),
(1008, 0, 2, 'category_id=42', 'test9_ru'),
(1009, 0, 2, 'product_id=30', 'canon-eos-5d_ru'),
(1040, 0, 2, 'product_id=47', 'hp-lp3065_ru'),
(1011, 0, 2, 'product_id=28', 'htc-touch-hd_ru'),
(1012, 0, 2, 'product_id=43', 'macbook_ru'),
(1013, 0, 2, 'product_id=44', 'macbook-air_ru'),
(1014, 0, 2, 'product_id=45', 'macbook-pro_ru'),
(1016, 0, 2, 'product_id=31', 'nikon-d300_ru'),
(1017, 0, 2, 'product_id=29', 'palm-treo-pro_ru'),
(1018, 0, 2, 'product_id=35', 'product-8_ru'),
(1019, 0, 2, 'product_id=49', 'samsung-galaxy-tab-10-1_ru'),
(1020, 0, 2, 'product_id=33', 'samsung-syncmaster-941bw_ru'),
(1021, 0, 2, 'product_id=46', 'sony-vaio_ru'),
(1037, 0, 2, 'product_id=41', 'imac_ru'),
(1023, 0, 2, 'product_id=40', 'iphone_ru'),
(1025, 0, 2, 'product_id=36', 'ipod-nano_ru'),
(1026, 0, 2, 'product_id=34', 'ipod-shuffle_ru'),
(1027, 0, 2, 'product_id=32', 'ipod-touch_ru'),
(1028, 0, 2, 'manufacturer_id=9', 'canon_ru'),
(1029, 0, 2, 'manufacturer_id=5', 'htc_ru'),
(1030, 0, 2, 'manufacturer_id=7', 'hewlett-packard_ru'),
(1031, 0, 2, 'manufacturer_id=6', 'palm_ru'),
(1032, 0, 2, 'manufacturer_id=10', 'sony_ru'),
(1041, 0, 2, 'information_id=6', 'delivery_ru'),
(1042, 0, 2, 'information_id=3', 'privacy_ru'),
(1043, 0, 2, 'information_id=5', 'terms_ru');

-----------------------------------------------------------

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Администратор', '{"access":["catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/developer","common\\/filemanager","common\\/profile","common\\/security","customer\\/custom_field","customer\\/customer","customer\\/customer_approval","customer\\/customer_group","design\\/banner","design\\/layout","design\\/theme","design\\/translation","design\\/seo_url","event\\/statistics","event\\/theme","extension\\/advertise\\/google","extension\\/analytics\\/google","extension\\/captcha\\/basic","extension\\/captcha\\/google","extension\\/dashboard\\/activity","extension\\/dashboard\\/chart","extension\\/dashboard\\/customer","extension\\/dashboard\\/map","extension\\/dashboard\\/online","extension\\/dashboard\\/order","extension\\/dashboard\\/recent","extension\\/dashboard\\/sale","extension\\/extension\\/advertise","extension\\/extension\\/analytics","extension\\/extension\\/captcha","extension\\/extension\\/dashboard","extension\\/extension\\/feed","extension\\/extension\\/fraud","extension\\/extension\\/menu","extension\\/extension\\/module","extension\\/extension\\/payment","extension\\/extension\\/report","extension\\/extension\\/shipping","extension\\/extension\\/theme","extension\\/extension\\/total","extension\\/feed\\/google_base","extension\\/feed\\/google_sitemap","extension\\/fraud\\/fraudlabspro","extension\\/fraud\\/ip","extension\\/fraud\\/maxmind","extension\\/marketing\\/remarketing","extension\\/module\\/account","extension\\/module\\/amazon_login","extension\\/module\\/amazon_pay","extension\\/module\\/banner","extension\\/module\\/bestseller","extension\\/module\\/carousel","extension\\/module\\/category","extension\\/module\\/divido_calculator","extension\\/module\\/ebay_listing","extension\\/module\\/featured","extension\\/module\\/filter","extension\\/module\\/google_hangouts","extension\\/module\\/html","extension\\/module\\/information","extension\\/module\\/klarna_checkout_module","extension\\/module\\/latest","extension\\/module\\/laybuy_layout","extension\\/module\\/pilibaba_button","extension\\/module\\/sagepay_direct_cards","extension\\/module\\/sagepay_server_cards","extension\\/module\\/slideshow","extension\\/module\\/special","extension\\/module\\/store","extension\\/payment\\/amazon_login_pay","extension\\/payment\\/authorizenet_aim","extension\\/payment\\/authorizenet_sim","extension\\/payment\\/bank_transfer","extension\\/payment\\/bluepay_hosted","extension\\/payment\\/bluepay_redirect","extension\\/payment\\/cardconnect","extension\\/payment\\/cardinity","extension\\/payment\\/cheque","extension\\/payment\\/cod","extension\\/payment\\/divido","extension\\/payment\\/eway","extension\\/payment\\/firstdata","extension\\/payment\\/firstdata_remote","extension\\/payment\\/free_checkout","extension\\/payment\\/g2apay","extension\\/payment\\/globalpay","extension\\/payment\\/globalpay_remote","extension\\/payment\\/klarna_account","extension\\/payment\\/klarna_checkout","extension\\/payment\\/klarna_invoice","extension\\/payment\\/laybuy","extension\\/payment\\/liqpay","extension\\/payment\\/nochex","extension\\/payment\\/paymate","extension\\/payment\\/paypoint","extension\\/payment\\/payza","extension\\/payment\\/perpetual_payments","extension\\/payment\\/pilibaba","extension\\/payment\\/realex","extension\\/payment\\/realex_remote","extension\\/payment\\/sagepay_direct","extension\\/payment\\/sagepay_server","extension\\/payment\\/sagepay_us","extension\\/payment\\/securetrading_pp","extension\\/payment\\/securetrading_ws","extension\\/payment\\/skrill","extension\\/payment\\/twocheckout","extension\\/payment\\/web_payment_software","extension\\/payment\\/worldpay","extension\\/module\\/pp_braintree_button","extension\\/payment\\/pp_braintree","extension\\/report\\/customer_activity","extension\\/report\\/customer_order","extension\\/report\\/customer_reward","extension\\/report\\/customer_search","extension\\/report\\/customer_transaction","extension\\/report\\/marketing","extension\\/report\\/product_purchased","extension\\/report\\/product_viewed","extension\\/report\\/sale_coupon","extension\\/report\\/sale_order","extension\\/report\\/sale_return","extension\\/report\\/sale_shipping","extension\\/report\\/sale_tax","extension\\/shipping\\/auspost","extension\\/shipping\\/ec_ship","extension\\/shipping\\/fedex","extension\\/shipping\\/flat","extension\\/shipping\\/free","extension\\/shipping\\/item","extension\\/shipping\\/parcelforce_48","extension\\/shipping\\/pickup","extension\\/shipping\\/royal_mail","extension\\/shipping\\/ups","extension\\/shipping\\/usps","extension\\/shipping\\/weight","extension\\/theme\\/default","extension\\/total\\/coupon","extension\\/total\\/credit","extension\\/total\\/handling","extension\\/total\\/klarna_fee","extension\\/total\\/low_order_fee","extension\\/total\\/reward","extension\\/total\\/shipping","extension\\/total\\/sub_total","extension\\/total\\/tax","extension\\/total\\/total","extension\\/total\\/voucher","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","mail\\/affiliate","mail\\/customer","mail\\/forgotten","mail\\/return","mail\\/reward","mail\\/transaction","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","marketplace\\/api","marketplace\\/event","marketplace\\/extension","marketplace\\/install","marketplace\\/installer","marketplace\\/marketplace","marketplace\\/modification","report\\/online","report\\/report","report\\/statistics","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","tool\\/backup","tool\\/log","tool\\/upload","user\\/api","user\\/user","user\\/user_permission"],"modify":["catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/developer","common\\/filemanager","common\\/profile","common\\/security","customer\\/custom_field","customer\\/customer","customer\\/customer_approval","customer\\/customer_group","design\\/banner","design\\/layout","design\\/theme","design\\/translation","design\\/seo_url","event\\/statistics","event\\/theme","extension\\/advertise\\/google","extension\\/analytics\\/google","extension\\/captcha\\/basic","extension\\/captcha\\/google","extension\\/dashboard\\/activity","extension\\/dashboard\\/chart","extension\\/dashboard\\/customer","extension\\/dashboard\\/map","extension\\/dashboard\\/online","extension\\/dashboard\\/order","extension\\/dashboard\\/recent","extension\\/dashboard\\/sale","extension\\/extension\\/advertise","extension\\/extension\\/analytics","extension\\/extension\\/captcha","extension\\/extension\\/dashboard","extension\\/extension\\/feed","extension\\/extension\\/fraud","extension\\/extension\\/menu","extension\\/extension\\/module","extension\\/extension\\/payment","extension\\/extension\\/report","extension\\/extension\\/shipping","extension\\/extension\\/theme","extension\\/extension\\/total","extension\\/feed\\/google_base","extension\\/feed\\/google_sitemap","extension\\/fraud\\/fraudlabspro","extension\\/fraud\\/ip","extension\\/fraud\\/maxmind","extension\\/marketing\\/remarketing","extension\\/module\\/account","extension\\/module\\/amazon_login","extension\\/module\\/amazon_pay","extension\\/module\\/banner","extension\\/module\\/bestseller","extension\\/module\\/carousel","extension\\/module\\/category","extension\\/module\\/divido_calculator","extension\\/module\\/ebay_listing","extension\\/module\\/featured","extension\\/module\\/filter","extension\\/module\\/google_hangouts","extension\\/module\\/html","extension\\/module\\/information","extension\\/module\\/klarna_checkout_module","extension\\/module\\/latest","extension\\/module\\/laybuy_layout","extension\\/module\\/pilibaba_button","extension\\/module\\/sagepay_direct_cards","extension\\/module\\/sagepay_server_cards","extension\\/module\\/slideshow","extension\\/module\\/special","extension\\/module\\/store","extension\\/payment\\/amazon_login_pay","extension\\/payment\\/authorizenet_aim","extension\\/payment\\/authorizenet_sim","extension\\/payment\\/bank_transfer","extension\\/payment\\/bluepay_hosted","extension\\/payment\\/bluepay_redirect","extension\\/payment\\/cardconnect","extension\\/payment\\/cardinity","extension\\/payment\\/cheque","extension\\/payment\\/cod","extension\\/payment\\/divido","extension\\/payment\\/eway","extension\\/payment\\/firstdata","extension\\/payment\\/firstdata_remote","extension\\/payment\\/free_checkout","extension\\/payment\\/g2apay","extension\\/payment\\/globalpay","extension\\/payment\\/globalpay_remote","extension\\/payment\\/klarna_account","extension\\/payment\\/klarna_checkout","extension\\/payment\\/klarna_invoice","extension\\/payment\\/laybuy","extension\\/payment\\/liqpay","extension\\/payment\\/nochex","extension\\/payment\\/paymate","extension\\/payment\\/paypoint","extension\\/payment\\/payza","extension\\/payment\\/perpetual_payments","extension\\/payment\\/pilibaba","extension\\/payment\\/realex","extension\\/payment\\/realex_remote","extension\\/payment\\/sagepay_direct","extension\\/payment\\/sagepay_server","extension\\/payment\\/sagepay_us","extension\\/payment\\/securetrading_pp","extension\\/payment\\/securetrading_ws","extension\\/payment\\/skrill","extension\\/payment\\/twocheckout","extension\\/payment\\/web_payment_software","extension\\/payment\\/worldpay","extension\\/module\\/pp_braintree_button","extension\\/payment\\/pp_braintree","extension\\/report\\/customer_activity","extension\\/report\\/customer_order","extension\\/report\\/customer_reward","extension\\/report\\/customer_search","extension\\/report\\/customer_transaction","extension\\/report\\/marketing","extension\\/report\\/product_purchased","extension\\/report\\/product_viewed","extension\\/report\\/sale_coupon","extension\\/report\\/sale_order","extension\\/report\\/sale_return","extension\\/report\\/sale_shipping","extension\\/report\\/sale_tax","extension\\/shipping\\/auspost","extension\\/shipping\\/ec_ship","extension\\/shipping\\/fedex","extension\\/shipping\\/flat","extension\\/shipping\\/free","extension\\/shipping\\/item","extension\\/shipping\\/parcelforce_48","extension\\/shipping\\/pickup","extension\\/shipping\\/royal_mail","extension\\/shipping\\/ups","extension\\/shipping\\/usps","extension\\/shipping\\/weight","extension\\/theme\\/default","extension\\/total\\/coupon","extension\\/total\\/credit","extension\\/total\\/handling","extension\\/total\\/klarna_fee","extension\\/total\\/low_order_fee","extension\\/total\\/reward","extension\\/total\\/shipping","extension\\/total\\/sub_total","extension\\/total\\/tax","extension\\/total\\/total","extension\\/total\\/voucher","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","mail\\/affiliate","mail\\/customer","mail\\/forgotten","mail\\/return","mail\\/reward","mail\\/transaction","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","marketplace\\/event","marketplace\\/api","marketplace\\/extension","marketplace\\/install","marketplace\\/installer","marketplace\\/marketplace","marketplace\\/modification","report\\/online","report\\/report","report\\/statistics","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","startup\\/error","startup\\/event","startup\\/login","startup\\/permission","startup\\/router","startup\\/sass","startup\\/startup","tool\\/backup","tool\\/log","tool\\/upload","user\\/api","user\\/user","user\\/user_permission"]}'),
(10, 'Демонстрация', '');

-----------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-----------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-----------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_voucher_theme_description`
--

-- en
INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- ru
INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 2, 'Рождество'),
(7, 2, 'День Рождения'),
(8, 2, 'Общий');

-----------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-----------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_weight_class_description`
--

-- en
INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- ru
INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Килограмм', 'кг'),
(2, 2, 'Грамм', 'г'),
(5, 2, 'Фунт ', 'фунт'),
(6, 2, 'Унция', 'унц');

-----------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 0),
(2, 1, 'Badghis', 'BDG', 0),
(3, 1, 'Baghlan', 'BGL', 0),
(4, 1, 'Balkh', 'BAL', 0),
(5, 1, 'Bamian', 'BAM', 0),
(6, 1, 'Farah', 'FRA', 0),
(7, 1, 'Faryab', 'FYB', 0),
(8, 1, 'Ghazni', 'GHA', 0),
(9, 1, 'Ghowr', 'GHO', 0),
(10, 1, 'Helmand', 'HEL', 0),
(11, 1, 'Herat', 'HER', 0),
(12, 1, 'Jowzjan', 'JOW', 0),
(13, 1, 'Kabul', 'KAB', 0),
(14, 1, 'Kandahar', 'KAN', 0),
(15, 1, 'Kapisa', 'KAP', 0),
(16, 1, 'Khost', 'KHO', 0),
(17, 1, 'Konar', 'KNR', 0),
(18, 1, 'Kondoz', 'KDZ', 0),
(19, 1, 'Laghman', 'LAG', 0),
(20, 1, 'Lowgar', 'LOW', 0),
(21, 1, 'Nangrahar', 'NAN', 0),
(22, 1, 'Nimruz', 'NIM', 0),
(23, 1, 'Nurestan', 'NUR', 0),
(24, 1, 'Oruzgan', 'ORU', 0),
(25, 1, 'Paktia', 'PIA', 0),
(26, 1, 'Paktika', 'PKA', 0),
(27, 1, 'Parwan', 'PAR', 0),
(28, 1, 'Samangan', 'SAM', 0),
(29, 1, 'Sar-e Pol', 'SAR', 0),
(30, 1, 'Takhar', 'TAK', 0),
(31, 1, 'Wardak', 'WAR', 0),
(32, 1, 'Zabol', 'ZAB', 0),
(33, 2, 'Berat', 'BR', 0),
(34, 2, 'Bulqize', 'BU', 0),
(35, 2, 'Delvine', 'DL', 0),
(36, 2, 'Devoll', 'DV', 0),
(37, 2, 'Diber', 'DI', 0),
(38, 2, 'Durres', 'DR', 0),
(39, 2, 'Elbasan', 'EL', 0),
(40, 2, 'Kolonje', 'ER', 0),
(41, 2, 'Fier', 'FR', 0),
(42, 2, 'Gjirokaster', 'GJ', 0),
(43, 2, 'Gramsh', 'GR', 0),
(44, 2, 'Has', 'HA', 0),
(45, 2, 'Kavaje', 'KA', 0),
(46, 2, 'Kurbin', 'KB', 0),
(47, 2, 'Kucove', 'KC', 0),
(48, 2, 'Korce', 'KO', 0),
(49, 2, 'Kruje', 'KR', 0),
(50, 2, 'Kukes', 'KU', 0),
(51, 2, 'Librazhd', 'LB', 0),
(52, 2, 'Lezhe', 'LE', 0),
(53, 2, 'Lushnje', 'LU', 0),
(54, 2, 'Malesi e Madhe', 'MM', 0),
(55, 2, 'Mallakaster', 'MK', 0),
(56, 2, 'Mat', 'MT', 0),
(57, 2, 'Mirdite', 'MR', 0),
(58, 2, 'Peqin', 'PQ', 0),
(59, 2, 'Permet', 'PR', 0),
(60, 2, 'Pogradec', 'PG', 0),
(61, 2, 'Puke', 'PU', 0),
(62, 2, 'Shkoder', 'SH', 0),
(63, 2, 'Skrapar', 'SK', 0),
(64, 2, 'Sarande', 'SR', 0),
(65, 2, 'Tepelene', 'TE', 0),
(66, 2, 'Tropoje', 'TP', 0),
(67, 2, 'Tirane', 'TR', 0),
(68, 2, 'Vlore', 'VL', 0),
(69, 3, 'Adrar', 'ADR', 0),
(70, 3, 'Ain Defla', 'ADE', 0),
(71, 3, 'Ain Temouchent', 'ATE', 0),
(72, 3, 'Alger', 'ALG', 0),
(73, 3, 'Annaba', 'ANN', 0),
(74, 3, 'Batna', 'BAT', 0),
(75, 3, 'Bechar', 'BEC', 0),
(76, 3, 'Bejaia', 'BEJ', 0),
(77, 3, 'Biskra', 'BIS', 0),
(78, 3, 'Blida', 'BLI', 0),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 0),
(80, 3, 'Bouira', 'BOA', 0),
(81, 3, 'Boumerdes', 'BMD', 0),
(82, 3, 'Chlef', 'CHL', 0),
(83, 3, 'Constantine', 'CON', 0),
(84, 3, 'Djelfa', 'DJE', 0),
(85, 3, 'El Bayadh', 'EBA', 0),
(86, 3, 'El Oued', 'EOU', 0),
(87, 3, 'El Tarf', 'ETA', 0),
(88, 3, 'Ghardaia', 'GHA', 0),
(89, 3, 'Guelma', 'GUE', 0),
(90, 3, 'Illizi', 'ILL', 0),
(91, 3, 'Jijel', 'JIJ', 0),
(92, 3, 'Khenchela', 'KHE', 0),
(93, 3, 'Laghouat', 'LAG', 0),
(94, 3, 'Muaskar', 'MUA', 0),
(95, 3, 'Medea', 'MED', 0),
(96, 3, 'Mila', 'MIL', 0),
(97, 3, 'Mostaganem', 'MOS', 0),
(98, 3, 'M''Sila', 'MSI', 0),
(99, 3, 'Naama', 'NAA', 0),
(100, 3, 'Oran', 'ORA', 0),
(101, 3, 'Ouargla', 'OUA', 0),
(102, 3, 'Oum el-Bouaghi', 'OEB', 0),
(103, 3, 'Relizane', 'REL', 0),
(104, 3, 'Saida', 'SAI', 0),
(105, 3, 'Setif', 'SET', 0),
(106, 3, 'Sidi Bel Abbes', 'SBA', 0),
(107, 3, 'Skikda', 'SKI', 0),
(108, 3, 'Souk Ahras', 'SAH', 0),
(109, 3, 'Tamanghasset', 'TAM', 0),
(110, 3, 'Tebessa', 'TEB', 0),
(111, 3, 'Tiaret', 'TIA', 0),
(112, 3, 'Tindouf', 'TIN', 0),
(113, 3, 'Tipaza', 'TIP', 0),
(114, 3, 'Tissemsilt', 'TIS', 0),
(115, 3, 'Tizi Ouzou', 'TOU', 0),
(116, 3, 'Tlemcen', 'TLE', 0),
(117, 4, 'Eastern', 'E', 0),
(118, 4, 'Manu''a', 'M', 0),
(119, 4, 'Rose Island', 'R', 0),
(120, 4, 'Swains Island', 'S', 0),
(121, 4, 'Western', 'W', 0),
(122, 5, 'Andorra la Vella', 'ALV', 0),
(123, 5, 'Canillo', 'CAN', 0),
(124, 5, 'Encamp', 'ENC', 0),
(125, 5, 'Escaldes-Engordany', 'ESE', 0),
(126, 5, 'La Massana', 'LMA', 0),
(127, 5, 'Ordino', 'ORD', 0),
(128, 5, 'Sant Julia de Loria', 'SJL', 0),
(129, 6, 'Bengo', 'BGO', 0),
(130, 6, 'Benguela', 'BGU', 0),
(131, 6, 'Bie', 'BIE', 0),
(132, 6, 'Cabinda', 'CAB', 0),
(133, 6, 'Cuando-Cubango', 'CCU', 0),
(134, 6, 'Cuanza Norte', 'CNO', 0),
(135, 6, 'Cuanza Sul', 'CUS', 0),
(136, 6, 'Cunene', 'CNN', 0),
(137, 6, 'Huambo', 'HUA', 0),
(138, 6, 'Huila', 'HUI', 0),
(139, 6, 'Luanda', 'LUA', 0),
(140, 6, 'Lunda Norte', 'LNO', 0),
(141, 6, 'Lunda Sul', 'LSU', 0),
(142, 6, 'Malange', 'MAL', 0),
(143, 6, 'Moxico', 'MOX', 0),
(144, 6, 'Namibe', 'NAM', 0),
(145, 6, 'Uige', 'UIG', 0),
(146, 6, 'Zaire', 'ZAI', 0),
(147, 9, 'Saint George', 'ASG', 0),
(148, 9, 'Saint John', 'ASJ', 0),
(149, 9, 'Saint Mary', 'ASM', 0),
(150, 9, 'Saint Paul', 'ASL', 0),
(151, 9, 'Saint Peter', 'ASR', 0),
(152, 9, 'Saint Philip', 'ASH', 0),
(153, 9, 'Barbuda', 'BAR', 0),
(154, 9, 'Redonda', 'RED', 0),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 0),
(156, 10, 'Buenos Aires', 'BA', 0),
(157, 10, 'Catamarca', 'CA', 0),
(158, 10, 'Chaco', 'CH', 0),
(159, 10, 'Chubut', 'CU', 0),
(160, 10, 'Cordoba', 'CO', 0),
(161, 10, 'Corrientes', 'CR', 0),
(162, 10, 'Distrito Federal', 'DF', 0),
(163, 10, 'Entre Rios', 'ER', 0),
(164, 10, 'Formosa', 'FO', 0),
(165, 10, 'Jujuy', 'JU', 0),
(166, 10, 'La Pampa', 'LP', 0),
(167, 10, 'La Rioja', 'LR', 0),
(168, 10, 'Mendoza', 'ME', 0),
(169, 10, 'Misiones', 'MI', 0),
(170, 10, 'Neuquen', 'NE', 0),
(171, 10, 'Rio Negro', 'RN', 0),
(172, 10, 'Salta', 'SA', 0),
(173, 10, 'San Juan', 'SJ', 0),
(174, 10, 'San Luis', 'SL', 0),
(175, 10, 'Santa Cruz', 'SC', 0),
(176, 10, 'Santa Fe', 'SF', 0),
(177, 10, 'Santiago del Estero', 'SD', 0),
(178, 10, 'Tierra del Fuego', 'TF', 0),
(179, 10, 'Tucuman', 'TU', 0),
(180, 11, 'Арагацотнская область', 'AGT', 0),
(181, 11, 'Араратская область', 'ARR', 0),
(182, 11, 'Армавирская область', 'ARM', 0),
(183, 11, 'Вайоцдзорская область', 'VAY', 0),
(184, 11, 'Гехаркуникская область', 'GEG', 0),
(185, 11, 'Котайкская область', 'KOT', 0),
(186, 11, 'Лорийская область', 'LOR', 0),
(187, 11, 'Сюникская область', 'SYU', 0),
(188, 11, 'Тавушская область', 'TAV', 0),
(189, 11, 'Ширакская область', 'SHI', 0),
(190, 11, 'Ереван', 'YER', 0),
(191, 13, 'Australian Capital Territory', 'ACT', 0),
(192, 13, 'New South Wales', 'NSW', 0),
(193, 13, 'Northern Territory', 'NT', 0),
(194, 13, 'Queensland', 'QLD', 0),
(195, 13, 'South Australia', 'SA', 0),
(196, 13, 'Tasmania', 'TAS', 0),
(197, 13, 'Victoria', 'VIC', 0),
(198, 13, 'Western Australia', 'WA', 0),
(199, 14, 'Burgenland', 'BUR', 0),
(200, 14, 'Kärnten', 'KAR', 0),
(201, 14, 'Niederösterreich', 'NOS', 0),
(202, 14, 'Oberösterreich', 'OOS', 0),
(203, 14, 'Salzburg', 'SAL', 0),
(204, 14, 'Steiermark', 'STE', 0),
(205, 14, 'Tirol', 'TIR', 0),
(206, 14, 'Vorarlberg', 'VOR', 0),
(207, 14, 'Wien', 'WIE', 0),
(209, 15, 'Апшеронский район', 'ABS', 0),
(210, 15, 'Агджабединский район', 'AGC', 0),
(211, 15, 'Агдамский район', 'AGM', 0),
(212, 15, 'Агдашский район', 'AGS', 0),
(213, 15, 'Агстафинский район', 'AGA', 0),
(214, 15, 'Ахсуйский район', 'AGU', 0),
(215, 15, 'Астаринский район', 'AST', 0),
(216, 15, 'Баку', 'BA', 0),
(217, 15, 'Бабекский район', 'BAB', 0),
(218, 15, 'Балакенский район', 'BAL', 0),
(219, 15, 'Бардинский район', 'BAR', 0),
(220, 15, 'Бейлаганский район', 'BEY', 0),
(221, 15, 'Билясуварский район', 'BIL', 0),
(222, 15, 'Джебраильский район', 'CAB', 0),
(223, 15, 'Джалильабадский район', 'CAL', 0),
(224, 15, 'Джульфинский район', 'CUL', 0),
(225, 15, 'Дашкесанский район', 'DAS', 0),
(226, 15, 'Шабранский район', 'DAV', 0),
(227, 15, 'Физулинский район', 'FUZ', 0),
(228, 15, 'Гянджа', 'GA', 0),
(229, 15, 'Кедабекский район', 'GAD', 0),
(230, 15, 'Геранбойский район', 'GOR', 0),
(231, 15, 'Геокчайский район', 'GOY', 0),
(232, 15, 'Аджикабульский район', 'HAC', 0),
(233, 15, 'Имишлинский район', 'IMI', 0),
(234, 15, 'Исмаиллинский район', 'ISM', 0),
(235, 15, 'Кельбаджарский район', 'KAL', 0),
(236, 15, 'Кюрдамирский район', 'KUR', 0),
(237, 15, 'Ленкорань', 'LA', 0),
(238, 15, 'Лачинский район', 'LAC', 0),
(239, 15, 'Ленкоранский район', 'LAN', 0),
(240, 15, 'Лерикский район', 'LER', 0),
(241, 15, 'Масаллинский район', 'MAS', 0),
(242, 15, 'Мингечевир', 'MI', 0),
(243, 15, 'Нафталан', 'NA', 0),
(244, 15, 'Нефтечалинский район', 'NEF', 0),
(245, 15, 'Огузский район', 'OGU', 0),
(246, 15, 'Ордубадский район', 'ORD', 0),
(247, 15, 'Габалинский район', 'QAB', 0),
(248, 15, 'Гахский район', 'QAX', 0),
(249, 15, 'Газахский район', 'QAZ', 0),
(250, 15, 'Гобустанский район', 'QOB', 0),
(251, 15, 'Губинский район', 'QBA', 0),
(252, 15, 'Губадлинский район', 'QBI', 0),
(253, 15, 'Гусарский район', 'QUS', 0),
(254, 15, 'Шеки', 'SA', 0),
(255, 15, 'Саатлинский район', 'SAT', 0),
(256, 15, 'Сабирабадский район', 'SAB', 0),
(257, 15, 'Садаракский район', 'SAD', 0),
(258, 15, 'Шахбузский район', 'SAH', 0),
(259, 15, 'Шекинский район', 'SAK', 0),
(260, 15, 'Салянский район', 'SAL', 0),
(261, 15, 'Сумгаит', 'SM', 0),
(262, 15, 'Шемахинский район', 'SMI', 0),
(263, 15, 'Шамкирский район', 'SKR', 0),
(264, 15, 'Самухский район', 'SMX', 0),
(265, 15, 'Шарурский район', 'SAR', 0),
(266, 15, 'Сиазаньский район', 'SIY', 0),
(267, 15, 'Шуша', 'SS', 0),
(268, 15, 'Шушинский район', 'SUS', 0),
(269, 15, 'Тертерский район', 'TAR', 0),
(270, 15, 'Товузский район', 'TOV', 0),
(271, 15, 'Уджарский район', 'UCA', 0),
(272, 15, 'Ханкенди', 'XA', 0),
(273, 15, 'Хачмазский район', 'XAC', 0),
(274, 15, 'Гёйгёльский район', 'XAN', 0),
(275, 15, 'Хызинский район', 'XIZ', 0),
(276, 15, 'Ходжалинский район', 'XCI', 0),
(277, 15, 'Ходжавендский район', 'XVD', 0),
(278, 15, 'Ярдымлинский район', 'YAR', 0),
(279, 15, 'Евлахский район', 'YEV', 0),
(280, 15, 'Зангеланский район', 'ZAN', 0),
(281, 15, 'Загатальский район', 'ZAQ', 0),
(282, 15, 'Зердабский район', 'ZAR', 0),
(283, 15, 'Нахичевань (Нахчыван)', 'NX', 0),
(284, 16, 'Acklins', 'ACK', 0),
(285, 16, 'Berry Islands', 'BER', 0),
(286, 16, 'Bimini', 'BIM', 0),
(287, 16, 'Black Point', 'BLK', 0),
(288, 16, 'Cat Island', 'CAT', 0),
(289, 16, 'Central Abaco', 'CAB', 0),
(290, 16, 'Central Andros', 'CAN', 0),
(291, 16, 'Central Eleuthera', 'CEL', 0),
(292, 16, 'City of Freeport', 'FRE', 0),
(293, 16, 'Crooked Island', 'CRO', 0),
(294, 16, 'East Grand Bahama', 'EGB', 0),
(295, 16, 'Exuma', 'EXU', 0),
(296, 16, 'Grand Cay', 'GRD', 0),
(297, 16, 'Harbour Island', 'HAR', 0),
(298, 16, 'Hope Town', 'HOP', 0),
(299, 16, 'Inagua', 'INA', 0),
(300, 16, 'Long Island', 'LNG', 0),
(301, 16, 'Mangrove Cay', 'MAN', 0),
(302, 16, 'Mayaguana', 'MAY', 0),
(303, 16, 'Moore''s Island', 'MOO', 0),
(304, 16, 'North Abaco', 'NAB', 0),
(305, 16, 'North Andros', 'NAN', 0),
(306, 16, 'North Eleuthera', 'NEL', 0),
(307, 16, 'Ragged Island', 'RAG', 0),
(308, 16, 'Rum Cay', 'RUM', 0),
(309, 16, 'San Salvador', 'SAL', 0),
(310, 16, 'South Abaco', 'SAB', 0),
(311, 16, 'South Andros', 'SAN', 0),
(312, 16, 'South Eleuthera', 'SEL', 0),
(313, 16, 'Spanish Wells', 'SWE', 0),
(314, 16, 'West Grand Bahama', 'WGB', 0),
(315, 17, 'Capital', 'CAP', 0),
(316, 17, 'Central', 'CEN', 0),
(317, 17, 'Muharraq', 'MUH', 0),
(318, 17, 'Northern', 'NOR', 0),
(319, 17, 'Southern', 'SOU', 0),
(320, 18, 'Barisal', 'BAR', 0),
(321, 18, 'Chittagong', 'CHI', 0),
(322, 18, 'Dhaka', 'DHA', 0),
(323, 18, 'Khulna', 'KHU', 0),
(324, 18, 'Rajshahi', 'RAJ', 0),
(325, 18, 'Sylhet', 'SYL', 0),
(326, 19, 'Christ Church', 'CC', 0),
(327, 19, 'Saint Andrew', 'AND', 0),
(328, 19, 'Saint George', 'GEO', 0),
(329, 19, 'Saint James', 'JAM', 0),
(330, 19, 'Saint John', 'JOH', 0),
(331, 19, 'Saint Joseph', 'JOS', 0),
(332, 19, 'Saint Lucy', 'LUC', 0),
(333, 19, 'Saint Michael', 'MIC', 0),
(334, 19, 'Saint Peter', 'PET', 0),
(335, 19, 'Saint Philip', 'PHI', 0),
(336, 19, 'Saint Thomas', 'THO', 0),
(337, 20, 'Брестская область', 'BRO', 0),
(338, 20, 'Витебская область', 'HO', 0),
(339, 20, 'Гомельская область', 'GOMO', 0),
(340, 20, 'Гродненская область', 'GRO', 0),
(341, 20, 'Минск', 'MNSK', 0),
(342, 20, 'Минская область', 'MIO', 0),
(343, 20, 'Могилёвская область', 'MGO', 0),
(344, 21, 'Antwerpen', 'VAN', 0),
(345, 21, 'Brabant Wallon', 'WBR', 0),
(346, 21, 'Hainaut', 'WHT', 0),
(347, 21, 'Liège', 'WLG', 0),
(348, 21, 'Limburg', 'VLI', 0),
(349, 21, 'Luxembourg', 'WLX', 0),
(350, 21, 'Namur', 'WNA', 0),
(351, 21, 'Oost-Vlaanderen', 'VOV', 0),
(352, 21, 'Vlaams Brabant', 'VBR', 0),
(353, 21, 'West-Vlaanderen', 'VWV', 0),
(354, 22, 'Belize', 'BZ', 0),
(355, 22, 'Cayo', 'CY', 0),
(356, 22, 'Corozal', 'CR', 0),
(357, 22, 'Orange Walk', 'OW', 0),
(358, 22, 'Stann Creek', 'SC', 0),
(359, 22, 'Toledo', 'TO', 0),
(360, 23, 'Alibori', 'AL', 0),
(361, 23, 'Atakora', 'AK', 0),
(362, 23, 'Atlantique', 'AQ', 0),
(363, 23, 'Borgou', 'BO', 0),
(364, 23, 'Collines', 'CO', 0),
(365, 23, 'Donga', 'DO', 0),
(366, 23, 'Kouffo', 'KO', 0),
(367, 23, 'Littoral', 'LI', 0),
(368, 23, 'Mono', 'MO', 0),
(369, 23, 'Oueme', 'OU', 0),
(370, 23, 'Plateau', 'PL', 0),
(371, 23, 'Zou', 'ZO', 0),
(372, 24, 'Devonshire', 'DS', 0),
(373, 24, 'Hamilton City', 'HC', 0),
(374, 24, 'Hamilton', 'HA', 0),
(375, 24, 'Paget', 'PG', 0),
(376, 24, 'Pembroke', 'PB', 0),
(377, 24, 'Saint George City', 'GC', 0),
(378, 24, 'Saint George''s', 'SG', 0),
(379, 24, 'Sandys', 'SA', 0),
(380, 24, 'Smith''s', 'SM', 0),
(381, 24, 'Southampton', 'SH', 0),
(382, 24, 'Warwick', 'WA', 0),
(383, 25, 'Bumthang', 'BUM', 0),
(384, 25, 'Chukha', 'CHU', 0),
(385, 25, 'Dagana', 'DAG', 0),
(386, 25, 'Gasa', 'GAS', 0),
(387, 25, 'Haa', 'HAA', 0),
(388, 25, 'Lhuntse', 'LHU', 0),
(389, 25, 'Mongar', 'MON', 0),
(390, 25, 'Paro', 'PAR', 0),
(391, 25, 'Pemagatshel', 'PEM', 0),
(392, 25, 'Punakha', 'PUN', 0),
(393, 25, 'Samdrup Jongkhar', 'SJO', 0),
(394, 25, 'Samtse', 'SAT', 0),
(395, 25, 'Sarpang', 'SAR', 0),
(396, 25, 'Thimphu', 'THI', 0),
(397, 25, 'Trashigang', 'TRG', 0),
(398, 25, 'Trashiyangste', 'TRY', 0),
(399, 25, 'Trongsa', 'TRO', 0),
(400, 25, 'Tsirang', 'TSI', 0),
(401, 25, 'Wangdue Phodrang', 'WPH', 0),
(402, 25, 'Zhemgang', 'ZHE', 0),
(403, 26, 'Beni', 'BEN', 0),
(404, 26, 'Chuquisaca', 'CHU', 0),
(405, 26, 'Cochabamba', 'COC', 0),
(406, 26, 'La Paz', 'LPZ', 0),
(407, 26, 'Oruro', 'ORU', 0),
(408, 26, 'Pando', 'PAN', 0),
(409, 26, 'Potosi', 'POT', 0),
(410, 26, 'Santa Cruz', 'SCZ', 0),
(411, 26, 'Tarija', 'TAR', 0),
(412, 27, 'Brcko district', 'BRO', 0),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 0),
(414, 27, 'Posavski Kanton', 'FPO', 0),
(415, 27, 'Tuzlanski Kanton', 'FTU', 0),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 0),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 0),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 0),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 0),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 0),
(421, 27, 'Kanton Sarajevo', 'FSA', 0),
(422, 27, 'Zapadnobosanska', 'FZA', 0),
(423, 27, 'Banja Luka', 'SBL', 0),
(424, 27, 'Doboj', 'SDO', 0),
(425, 27, 'Bijeljina', 'SBI', 0),
(426, 27, 'Vlasenica', 'SVL', 0),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 0),
(428, 27, 'Foca', 'SFO', 0),
(429, 27, 'Trebinje', 'STR', 0),
(430, 28, 'Central', 'CE', 0),
(431, 28, 'Ghanzi', 'GH', 0),
(432, 28, 'Kgalagadi', 'KD', 0),
(433, 28, 'Kgatleng', 'KT', 0),
(434, 28, 'Kweneng', 'KW', 0),
(435, 28, 'Ngamiland', 'NG', 0),
(436, 28, 'North East', 'NE', 0),
(437, 28, 'North West', 'NW', 0),
(438, 28, 'South East', 'SE', 0),
(439, 28, 'Southern', 'SO', 0),
(440, 30, 'Acre', 'AC', 0),
(441, 30, 'Alagoas', 'AL', 0),
(442, 30, 'Amapá', 'AP', 0),
(443, 30, 'Amazonas', 'AM', 0),
(444, 30, 'Bahia', 'BA', 0),
(445, 30, 'Ceará', 'CE', 0),
(446, 30, 'Distrito Federal', 'DF', 0),
(447, 30, 'Espírito Santo', 'ES', 0),
(448, 30, 'Goiás', 'GO', 0),
(449, 30, 'Maranhão', 'MA', 0),
(450, 30, 'Mato Grosso', 'MT', 0),
(451, 30, 'Mato Grosso do Sul', 'MS', 0),
(452, 30, 'Minas Gerais', 'MG', 0),
(453, 30, 'Pará', 'PA', 0),
(454, 30, 'Paraíba', 'PB', 0),
(455, 30, 'Paraná', 'PR', 0),
(456, 30, 'Pernambuco', 'PE', 0),
(457, 30, 'Piauí', 'PI', 0),
(458, 30, 'Rio de Janeiro', 'RJ', 0),
(459, 30, 'Rio Grande do Norte', 'RN', 0),
(460, 30, 'Rio Grande do Sul', 'RS', 0),
(461, 30, 'Rondônia', 'RO', 0),
(462, 30, 'Roraima', 'RR', 0),
(463, 30, 'Santa Catarina', 'SC', 0),
(464, 30, 'São Paulo', 'SP', 0),
(465, 30, 'Sergipe', 'SE', 0),
(466, 30, 'Tocantins', 'TO', 0),
(467, 31, 'Peros Banhos', 'PB', 0),
(468, 31, 'Salomon Islands', 'SI', 0),
(469, 31, 'Nelsons Island', 'NI', 0),
(470, 31, 'Three Brothers', 'TB', 0),
(471, 31, 'Eagle Islands', 'EA', 0),
(472, 31, 'Danger Island', 'DI', 0),
(473, 31, 'Egmont Islands', 'EG', 0),
(474, 31, 'Diego Garcia', 'DG', 0),
(475, 32, 'Belait', 'BEL', 0),
(476, 32, 'Brunei and Muara', 'BRM', 0),
(477, 32, 'Temburong', 'TEM', 0),
(478, 32, 'Tutong', 'TUT', 0),
(479, 33, 'Blagoevgrad', '', 0),
(480, 33, 'Burgas', '', 0),
(481, 33, 'Dobrich', '', 0),
(482, 33, 'Gabrovo', '', 0),
(483, 33, 'Haskovo', '', 0),
(484, 33, 'Kardjali', '', 0),
(485, 33, 'Kyustendil', '', 0),
(486, 33, 'Lovech', '', 0),
(487, 33, 'Montana', '', 0),
(488, 33, 'Pazardjik', '', 0),
(489, 33, 'Pernik', '', 0),
(490, 33, 'Pleven', '', 0),
(491, 33, 'Plovdiv', '', 0),
(492, 33, 'Razgrad', '', 0),
(493, 33, 'Shumen', '', 0),
(494, 33, 'Silistra', '', 0),
(495, 33, 'Sliven', '', 0),
(496, 33, 'Smolyan', '', 0),
(497, 33, 'Sofia', '', 0),
(498, 33, 'Sofia - town', '', 0),
(499, 33, 'Stara Zagora', '', 0),
(500, 33, 'Targovishte', '', 0),
(501, 33, 'Varna', '', 0),
(502, 33, 'Veliko Tarnovo', '', 0),
(503, 33, 'Vidin', '', 0),
(504, 33, 'Vratza', '', 0),
(505, 33, 'Yambol', '', 0),
(506, 34, 'Bale', 'BAL', 0),
(507, 34, 'Bam', 'BAM', 0),
(508, 34, 'Banwa', 'BAN', 0),
(509, 34, 'Bazega', 'BAZ', 0),
(510, 34, 'Bougouriba', 'BOR', 0),
(511, 34, 'Boulgou', 'BLG', 0),
(512, 34, 'Boulkiemde', 'BOK', 0),
(513, 34, 'Comoe', 'COM', 0),
(514, 34, 'Ganzourgou', 'GAN', 0),
(515, 34, 'Gnagna', 'GNA', 0),
(516, 34, 'Gourma', 'GOU', 0),
(517, 34, 'Houet', 'HOU', 0),
(518, 34, 'Ioba', 'IOA', 0),
(519, 34, 'Kadiogo', 'KAD', 0),
(520, 34, 'Kenedougou', 'KEN', 0),
(521, 34, 'Komondjari', 'KOD', 0),
(522, 34, 'Kompienga', 'KOP', 0),
(523, 34, 'Kossi', 'KOS', 0),
(524, 34, 'Koulpelogo', 'KOL', 0),
(525, 34, 'Kouritenga', 'KOT', 0),
(526, 34, 'Kourweogo', 'KOW', 0),
(527, 34, 'Leraba', 'LER', 0),
(528, 34, 'Loroum', 'LOR', 0),
(529, 34, 'Mouhoun', 'MOU', 0),
(530, 34, 'Nahouri', 'NAH', 0),
(531, 34, 'Namentenga', 'NAM', 0),
(532, 34, 'Nayala', 'NAY', 0),
(533, 34, 'Noumbiel', 'NOU', 0),
(534, 34, 'Oubritenga', 'OUB', 0),
(535, 34, 'Oudalan', 'OUD', 0),
(536, 34, 'Passore', 'PAS', 0),
(537, 34, 'Poni', 'PON', 0),
(538, 34, 'Sanguie', 'SAG', 0),
(539, 34, 'Sanmatenga', 'SAM', 0),
(540, 34, 'Seno', 'SEN', 0),
(541, 34, 'Sissili', 'SIS', 0),
(542, 34, 'Soum', 'SOM', 0),
(543, 34, 'Sourou', 'SOR', 0),
(544, 34, 'Tapoa', 'TAP', 0),
(545, 34, 'Tuy', 'TUY', 0),
(546, 34, 'Yagha', 'YAG', 0),
(547, 34, 'Yatenga', 'YAT', 0),
(548, 34, 'Ziro', 'ZIR', 0),
(549, 34, 'Zondoma', 'ZOD', 0),
(550, 34, 'Zoundweogo', 'ZOW', 0),
(551, 35, 'Bubanza', 'BB', 0),
(552, 35, 'Bujumbura', 'BJ', 0),
(553, 35, 'Bururi', 'BR', 0),
(554, 35, 'Cankuzo', 'CA', 0),
(555, 35, 'Cibitoke', 'CI', 0),
(556, 35, 'Gitega', 'GI', 0),
(557, 35, 'Karuzi', 'KR', 0),
(558, 35, 'Kayanza', 'KY', 0),
(559, 35, 'Kirundo', 'KI', 0),
(560, 35, 'Makamba', 'MA', 0),
(561, 35, 'Muramvya', 'MU', 0),
(562, 35, 'Muyinga', 'MY', 0),
(563, 35, 'Mwaro', 'MW', 0),
(564, 35, 'Ngozi', 'NG', 0),
(565, 35, 'Rutana', 'RT', 0),
(566, 35, 'Ruyigi', 'RY', 0),
(567, 36, 'Phnom Penh', 'PP', 0),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 0),
(569, 36, 'Pailin', 'PA', 0),
(570, 36, 'Keb', 'KB', 0),
(571, 36, 'Banteay Meanchey', 'BM', 0),
(572, 36, 'Battambang', 'BA', 0),
(573, 36, 'Kampong Cham', 'KM', 0),
(574, 36, 'Kampong Chhnang', 'KN', 0),
(575, 36, 'Kampong Speu', 'KU', 0),
(576, 36, 'Kampong Som', 'KO', 0),
(577, 36, 'Kampong Thom', 'KT', 0),
(578, 36, 'Kampot', 'KP', 0),
(579, 36, 'Kandal', 'KL', 0),
(580, 36, 'Kaoh Kong', 'KK', 0),
(581, 36, 'Kratie', 'KR', 0),
(582, 36, 'Mondul Kiri', 'MK', 0),
(583, 36, 'Oddar Meancheay', 'OM', 0),
(584, 36, 'Pursat', 'PU', 0),
(585, 36, 'Preah Vihear', 'PR', 0),
(586, 36, 'Prey Veng', 'PG', 0),
(587, 36, 'Ratanak Kiri', 'RK', 0),
(588, 36, 'Siemreap', 'SI', 0),
(589, 36, 'Stung Treng', 'ST', 0),
(590, 36, 'Svay Rieng', 'SR', 0),
(591, 36, 'Takeo', 'TK', 0),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 0),
(593, 37, 'Centre', 'CEN', 0),
(594, 37, 'East (Est)', 'EST', 0),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 0),
(596, 37, 'Littoral', 'LIT', 0),
(597, 37, 'North (Nord)', 'NOR', 0),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 0),
(599, 37, 'West (Ouest)', 'OUE', 0),
(600, 37, 'South (Sud)', 'SUD', 0),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 0),
(602, 38, 'Alberta', 'AB', 0),
(603, 38, 'British Columbia', 'BC', 0),
(604, 38, 'Manitoba', 'MB', 0),
(605, 38, 'New Brunswick', 'NB', 0),
(606, 38, 'Newfoundland and Labrador', 'NL', 0),
(607, 38, 'Northwest Territories', 'NT', 0),
(608, 38, 'Nova Scotia', 'NS', 0),
(609, 38, 'Nunavut', 'NU', 0),
(610, 38, 'Ontario', 'ON', 0),
(611, 38, 'Prince Edward Island', 'PE', 0),
(612, 38, 'Qu&eacute;bec', 'QC', 0),
(613, 38, 'Saskatchewan', 'SK', 0),
(614, 38, 'Yukon Territory', 'YT', 0),
(615, 39, 'Boa Vista', 'BV', 0),
(616, 39, 'Brava', 'BR', 0),
(617, 39, 'Calheta de Sao Miguel', 'CS', 0),
(618, 39, 'Maio', 'MA', 0),
(619, 39, 'Mosteiros', 'MO', 0),
(620, 39, 'Paul', 'PA', 0),
(621, 39, 'Porto Novo', 'PN', 0),
(622, 39, 'Praia', 'PR', 0),
(623, 39, 'Ribeira Grande', 'RG', 0),
(624, 39, 'Sal', 'SL', 0),
(625, 39, 'Santa Catarina', 'CA', 0),
(626, 39, 'Santa Cruz', 'CR', 0),
(627, 39, 'Sao Domingos', 'SD', 0),
(628, 39, 'Sao Filipe', 'SF', 0),
(629, 39, 'Sao Nicolau', 'SN', 0),
(630, 39, 'Sao Vicente', 'SV', 0),
(631, 39, 'Tarrafal', 'TA', 0),
(632, 40, 'Creek', 'CR', 0),
(633, 40, 'Eastern', 'EA', 0),
(634, 40, 'Midland', 'ML', 0),
(635, 40, 'South Town', 'ST', 0),
(636, 40, 'Spot Bay', 'SP', 0),
(637, 40, 'Stake Bay', 'SK', 0),
(638, 40, 'West End', 'WD', 0),
(639, 40, 'Western', 'WN', 0),
(640, 41, 'Bamingui-Bangoran', 'BBA', 0),
(641, 41, 'Basse-Kotto', 'BKO', 0),
(642, 41, 'Haute-Kotto', 'HKO', 0),
(643, 41, 'Haut-Mbomou', 'HMB', 0),
(644, 41, 'Kemo', 'KEM', 0),
(645, 41, 'Lobaye', 'LOB', 0),
(646, 41, 'Mambere-KadeÔ', 'MKD', 0),
(647, 41, 'Mbomou', 'MBO', 0),
(648, 41, 'Nana-Mambere', 'NMM', 0),
(649, 41, 'Ombella-M''Poko', 'OMP', 0),
(650, 41, 'Ouaka', 'OUK', 0),
(651, 41, 'Ouham', 'OUH', 0),
(652, 41, 'Ouham-Pende', 'OPE', 0),
(653, 41, 'Vakaga', 'VAK', 0),
(654, 41, 'Nana-Grebizi', 'NGR', 0),
(655, 41, 'Sangha-Mbaere', 'SMB', 0),
(656, 41, 'Bangui', 'BAN', 0),
(657, 42, 'Batha', 'BA', 0),
(658, 42, 'Biltine', 'BI', 0),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 0),
(660, 42, 'Chari-Baguirmi', 'CB', 0),
(661, 42, 'Guera', 'GU', 0),
(662, 42, 'Kanem', 'KA', 0),
(663, 42, 'Lac', 'LA', 0),
(664, 42, 'Logone Occidental', 'LC', 0),
(665, 42, 'Logone Oriental', 'LR', 0),
(666, 42, 'Mayo-Kebbi', 'MK', 0),
(667, 42, 'Moyen-Chari', 'MC', 0),
(668, 42, 'Ouaddai', 'OU', 0),
(669, 42, 'Salamat', 'SA', 0),
(670, 42, 'Tandjile', 'TA', 0),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 0),
(672, 43, 'Antofagasta', 'AN', 0),
(673, 43, 'Araucania', 'AR', 0),
(674, 43, 'Atacama', 'AT', 0),
(675, 43, 'Bio-Bio', 'BI', 0),
(676, 43, 'Coquimbo', 'CO', 0),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 0),
(678, 43, 'Los Lagos', 'LL', 0),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 0),
(680, 43, 'Maule', 'ML', 0),
(681, 43, 'Region Metropolitana', 'RM', 0),
(682, 43, 'Tarapaca', 'TA', 0),
(683, 43, 'Valparaiso', 'VS', 0),
(684, 44, 'Anhui', 'AN', 0),
(685, 44, 'Beijing', 'BE', 0),
(686, 44, 'Chongqing', 'CH', 0),
(687, 44, 'Fujian', 'FU', 0),
(688, 44, 'Gansu', 'GA', 0),
(689, 44, 'Guangdong', 'GU', 0),
(690, 44, 'Guangxi', 'GX', 0),
(691, 44, 'Guizhou', 'GZ', 0),
(692, 44, 'Hainan', 'HA', 0),
(693, 44, 'Hebei', 'HB', 0),
(694, 44, 'Heilongjiang', 'HL', 0),
(695, 44, 'Henan', 'HE', 0),
(696, 44, 'Hong Kong', 'HK', 0),
(697, 44, 'Hubei', 'HU', 0),
(698, 44, 'Hunan', 'HN', 0),
(699, 44, 'Inner Mongolia', 'IM', 0),
(700, 44, 'Jiangsu', 'JI', 0),
(701, 44, 'Jiangxi', 'JX', 0),
(702, 44, 'Jilin', 'JL', 0),
(703, 44, 'Liaoning', 'LI', 0),
(704, 44, 'Macau', 'MA', 0),
(705, 44, 'Ningxia', 'NI', 0),
(706, 44, 'Shaanxi', 'SH', 0),
(707, 44, 'Shandong', 'SA', 0),
(708, 44, 'Shanghai', 'SG', 0),
(709, 44, 'Shanxi', 'SX', 0),
(710, 44, 'Sichuan', 'SI', 0),
(711, 44, 'Tianjin', 'TI', 0),
(712, 44, 'Xinjiang', 'XI', 0),
(713, 44, 'Yunnan', 'YU', 0),
(714, 44, 'Zhejiang', 'ZH', 0),
(715, 46, 'Direction Island', 'D', 0),
(716, 46, 'Home Island', 'H', 0),
(717, 46, 'Horsburgh Island', 'O', 0),
(718, 46, 'South Island', 'S', 0),
(719, 46, 'West Island', 'W', 0),
(720, 47, 'Amazonas', 'AMZ', 0),
(721, 47, 'Antioquia', 'ANT', 0),
(722, 47, 'Arauca', 'ARA', 0),
(723, 47, 'Atlantico', 'ATL', 0),
(724, 47, 'Bogota D.C.', 'BDC', 0),
(725, 47, 'Bolivar', 'BOL', 0),
(726, 47, 'Boyaca', 'BOY', 0),
(727, 47, 'Caldas', 'CAL', 0),
(728, 47, 'Caqueta', 'CAQ', 0),
(729, 47, 'Casanare', 'CAS', 0),
(730, 47, 'Cauca', 'CAU', 0),
(731, 47, 'Cesar', 'CES', 0),
(732, 47, 'Choco', 'CHO', 0),
(733, 47, 'Cordoba', 'COR', 0),
(734, 47, 'Cundinamarca', 'CAM', 0),
(735, 47, 'Guainia', 'GNA', 0),
(736, 47, 'Guajira', 'GJR', 0),
(737, 47, 'Guaviare', 'GVR', 0),
(738, 47, 'Huila', 'HUI', 0),
(739, 47, 'Magdalena', 'MAG', 0),
(740, 47, 'Meta', 'MET', 0),
(741, 47, 'Narino', 'NAR', 0),
(742, 47, 'Norte de Santander', 'NDS', 0),
(743, 47, 'Putumayo', 'PUT', 0),
(744, 47, 'Quindio', 'QUI', 0),
(745, 47, 'Risaralda', 'RIS', 0),
(746, 47, 'San Andres y Providencia', 'SAP', 0),
(747, 47, 'Santander', 'SAN', 0),
(748, 47, 'Sucre', 'SUC', 0),
(749, 47, 'Tolima', 'TOL', 0),
(750, 47, 'Valle del Cauca', 'VDC', 0),
(751, 47, 'Vaupes', 'VAU', 0),
(752, 47, 'Vichada', 'VIC', 0),
(753, 48, 'Grande Comore', 'G', 0),
(754, 48, 'Anjouan', 'A', 0),
(755, 48, 'Moheli', 'M', 0),
(756, 49, 'Bouenza', 'BO', 0),
(757, 49, 'Brazzaville', 'BR', 0),
(758, 49, 'Cuvette', 'CU', 0),
(759, 49, 'Cuvette-Ouest', 'CO', 0),
(760, 49, 'Kouilou', 'KO', 0),
(761, 49, 'Lekoumou', 'LE', 0),
(762, 49, 'Likouala', 'LI', 0),
(763, 49, 'Niari', 'NI', 0),
(764, 49, 'Plateaux', 'PL', 0),
(765, 49, 'Pool', 'PO', 0),
(766, 49, 'Sangha', 'SA', 0),
(767, 50, 'Pukapuka', 'PU', 0),
(768, 50, 'Rakahanga', 'RK', 0),
(769, 50, 'Manihiki', 'MK', 0),
(770, 50, 'Penrhyn', 'PE', 0),
(771, 50, 'Nassau Island', 'NI', 0),
(772, 50, 'Surwarrow', 'SU', 0),
(773, 50, 'Palmerston', 'PA', 0),
(774, 50, 'Aitutaki', 'AI', 0),
(775, 50, 'Manuae', 'MA', 0),
(776, 50, 'Takutea', 'TA', 0),
(777, 50, 'Mitiaro', 'MT', 0),
(778, 50, 'Atiu', 'AT', 0),
(779, 50, 'Mauke', 'MU', 0),
(780, 50, 'Rarotonga', 'RR', 0),
(781, 50, 'Mangaia', 'MG', 0),
(782, 51, 'Alajuela', 'AL', 0),
(783, 51, 'Cartago', 'CA', 0),
(784, 51, 'Guanacaste', 'GU', 0),
(785, 51, 'Heredia', 'HE', 0),
(786, 51, 'Limon', 'LI', 0),
(787, 51, 'Puntarenas', 'PU', 0),
(788, 51, 'San Jose', 'SJ', 0),
(789, 52, 'Abengourou', 'ABE', 0),
(790, 52, 'Abidjan', 'ABI', 0),
(791, 52, 'Aboisso', 'ABO', 0),
(792, 52, 'Adiake', 'ADI', 0),
(793, 52, 'Adzope', 'ADZ', 0),
(794, 52, 'Agboville', 'AGB', 0),
(795, 52, 'Agnibilekrou', 'AGN', 0),
(796, 52, 'Alepe', 'ALE', 0),
(797, 52, 'Bocanda', 'BOC', 0),
(798, 52, 'Bangolo', 'BAN', 0),
(799, 52, 'Beoumi', 'BEO', 0),
(800, 52, 'Biankouma', 'BIA', 0),
(801, 52, 'Bondoukou', 'BDK', 0),
(802, 52, 'Bongouanou', 'BGN', 0),
(803, 52, 'Bouafle', 'BFL', 0),
(804, 52, 'Bouake', 'BKE', 0),
(805, 52, 'Bouna', 'BNA', 0),
(806, 52, 'Boundiali', 'BDL', 0),
(807, 52, 'Dabakala', 'DKL', 0),
(808, 52, 'Dabou', 'DBU', 0),
(809, 52, 'Daloa', 'DAL', 0),
(810, 52, 'Danane', 'DAN', 0),
(811, 52, 'Daoukro', 'DAO', 0),
(812, 52, 'Dimbokro', 'DIM', 0),
(813, 52, 'Divo', 'DIV', 0),
(814, 52, 'Duekoue', 'DUE', 0),
(815, 52, 'Ferkessedougou', 'FER', 0),
(816, 52, 'Gagnoa', 'GAG', 0),
(817, 52, 'Grand-Bassam', 'GBA', 0),
(818, 52, 'Grand-Lahou', 'GLA', 0),
(819, 52, 'Guiglo', 'GUI', 0),
(820, 52, 'Issia', 'ISS', 0),
(821, 52, 'Jacqueville', 'JAC', 0),
(822, 52, 'Katiola', 'KAT', 0),
(823, 52, 'Korhogo', 'KOR', 0),
(824, 52, 'Lakota', 'LAK', 0),
(825, 52, 'Man', 'MAN', 0),
(826, 52, 'Mankono', 'MKN', 0),
(827, 52, 'Mbahiakro', 'MBA', 0),
(828, 52, 'Odienne', 'ODI', 0),
(829, 52, 'Oume', 'OUM', 0),
(830, 52, 'Sakassou', 'SAK', 0),
(831, 52, 'San-Pedro', 'SPE', 0),
(832, 52, 'Sassandra', 'SAS', 0),
(833, 52, 'Seguela', 'SEG', 0),
(834, 52, 'Sinfra', 'SIN', 0),
(835, 52, 'Soubre', 'SOU', 0),
(836, 52, 'Tabou', 'TAB', 0),
(837, 52, 'Tanda', 'TAN', 0),
(838, 52, 'Tiebissou', 'TIE', 0),
(839, 52, 'Tingrela', 'TIN', 0),
(840, 52, 'Tiassale', 'TIA', 0),
(841, 52, 'Touba', 'TBA', 0),
(842, 52, 'Toulepleu', 'TLP', 0),
(843, 52, 'Toumodi', 'TMD', 0),
(844, 52, 'Vavoua', 'VAV', 0),
(845, 52, 'Yamoussoukro', 'YAM', 0),
(846, 52, 'Zuenoula', 'ZUE', 0),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 0),
(848, 53, 'Grad Zagreb', 'GZ', 0),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 0),
(850, 53, 'Istarska', 'IS', 0),
(851, 53, 'Karlovačka', 'KA', 0),
(852, 53, 'Koprivničko-križevačka', 'KK', 0),
(853, 53, 'Krapinsko-zagorska', 'KZ', 0),
(854, 53, 'Ličko-senjska', 'LS', 0),
(855, 53, 'Međimurska', 'ME', 0),
(856, 53, 'Osječko-baranjska', 'OB', 0),
(857, 53, 'Požeško-slavonska', 'PS', 0),
(858, 53, 'Primorsko-goranska', 'PG', 0),
(859, 53, 'Šibensko-kninska', 'SK', 0),
(860, 53, 'Sisačko-moslavačka', 'SM', 0),
(861, 53, 'Brodsko-posavska', 'BP', 0),
(862, 53, 'Splitsko-dalmatinska', 'SD', 0),
(863, 53, 'Varaždinska', 'VA', 0),
(864, 53, 'Virovitičko-podravska', 'VP', 0),
(865, 53, 'Vukovarsko-srijemska', 'VS', 0),
(866, 53, 'Zadarska', 'ZA', 0),
(867, 53, 'Zagrebačka', 'ZG', 0),
(868, 54, 'Camaguey', 'CA', 0),
(869, 54, 'Ciego de Avila', 'CD', 0),
(870, 54, 'Cienfuegos', 'CI', 0),
(871, 54, 'Ciudad de La Habana', 'CH', 0),
(872, 54, 'Granma', 'GR', 0),
(873, 54, 'Guantanamo', 'GU', 0),
(874, 54, 'Holguin', 'HO', 0),
(875, 54, 'Isla de la Juventud', 'IJ', 0),
(876, 54, 'La Habana', 'LH', 0),
(877, 54, 'Las Tunas', 'LT', 0),
(878, 54, 'Matanzas', 'MA', 0),
(879, 54, 'Pinar del Rio', 'PR', 0),
(880, 54, 'Sancti Spiritus', 'SS', 0),
(881, 54, 'Santiago de Cuba', 'SC', 0),
(882, 54, 'Villa Clara', 'VC', 0),
(883, 55, 'Famagusta', 'F', 0),
(884, 55, 'Kyrenia', 'K', 0),
(885, 55, 'Larnaca', 'A', 0),
(886, 55, 'Limassol', 'I', 0),
(887, 55, 'Nicosia', 'N', 0),
(888, 55, 'Paphos', 'P', 0),
(889, 56, 'Ústecký', 'U', 0),
(890, 56, 'Jihočeský', 'C', 0),
(891, 56, 'Jihomoravský', 'B', 0),
(892, 56, 'Karlovarský', 'K', 0),
(893, 56, 'Královehradecký', 'H', 0),
(894, 56, 'Liberecký', 'L', 0),
(895, 56, 'Moravskoslezský', 'T', 0),
(896, 56, 'Olomoucký', 'M', 0),
(897, 56, 'Pardubický', 'E', 0),
(898, 56, 'Plzeňský', 'P', 0),
(899, 56, 'Praha', 'A', 0),
(900, 56, 'Středočeský', 'S', 0),
(901, 56, 'Vysočina', 'J', 0),
(902, 56, 'Zlínský', 'Z', 0),
(903, 57, 'Arhus', 'AR', 0),
(904, 57, 'Bornholm', 'BH', 0),
(905, 57, 'Copenhagen', 'CO', 0),
(906, 57, 'Faroe Islands', 'FO', 0),
(907, 57, 'Frederiksborg', 'FR', 0),
(908, 57, 'Fyn', 'FY', 0),
(909, 57, 'Kobenhavn', 'KO', 0),
(910, 57, 'Nordjylland', 'NO', 0),
(911, 57, 'Ribe', 'RI', 0),
(912, 57, 'Ringkobing', 'RK', 0),
(913, 57, 'Roskilde', 'RO', 0),
(914, 57, 'Sonderjylland', 'SO', 0),
(915, 57, 'Storstrom', 'ST', 0),
(916, 57, 'Vejle', 'VK', 0),
(917, 57, 'Vestj&aelig;lland', 'VJ', 0),
(918, 57, 'Viborg', 'VB', 0),
(919, 58, '''Ali Sabih', 'S', 0),
(920, 58, 'Dikhil', 'K', 0),
(921, 58, 'Djibouti', 'J', 0),
(922, 58, 'Obock', 'O', 0),
(923, 58, 'Tadjoura', 'T', 0),
(924, 59, 'Saint Andrew Parish', 'AND', 0),
(925, 59, 'Saint David Parish', 'DAV', 0),
(926, 59, 'Saint George Parish', 'GEO', 0),
(927, 59, 'Saint John Parish', 'JOH', 0),
(928, 59, 'Saint Joseph Parish', 'JOS', 0),
(929, 59, 'Saint Luke Parish', 'LUK', 0),
(930, 59, 'Saint Mark Parish', 'MAR', 0),
(931, 59, 'Saint Patrick Parish', 'PAT', 0),
(932, 59, 'Saint Paul Parish', 'PAU', 0),
(933, 59, 'Saint Peter Parish', 'PET', 0),
(934, 60, 'Distrito Nacional', 'DN', 0),
(935, 60, 'Azua', 'AZ', 0),
(936, 60, 'Baoruco', 'BC', 0),
(937, 60, 'Barahona', 'BH', 0),
(938, 60, 'Dajabon', 'DJ', 0),
(939, 60, 'Duarte', 'DU', 0),
(940, 60, 'Elias Pina', 'EL', 0),
(941, 60, 'El Seybo', 'SY', 0),
(942, 60, 'Espaillat', 'ET', 0),
(943, 60, 'Hato Mayor', 'HM', 0),
(944, 60, 'Independencia', 'IN', 0),
(945, 60, 'La Altagracia', 'AL', 0),
(946, 60, 'La Romana', 'RO', 0),
(947, 60, 'La Vega', 'VE', 0),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 0),
(949, 60, 'Monsenor Nouel', 'MN', 0),
(950, 60, 'Monte Cristi', 'MC', 0),
(951, 60, 'Monte Plata', 'MP', 0),
(952, 60, 'Pedernales', 'PD', 0),
(953, 60, 'Peravia (Bani)', 'PR', 0),
(954, 60, 'Puerto Plata', 'PP', 0),
(955, 60, 'Salcedo', 'SL', 0),
(956, 60, 'Samana', 'SM', 0),
(957, 60, 'Sanchez Ramirez', 'SH', 0),
(958, 60, 'San Cristobal', 'SC', 0),
(959, 60, 'San Jose de Ocoa', 'JO', 0),
(960, 60, 'San Juan', 'SJ', 0),
(961, 60, 'San Pedro de Macoris', 'PM', 0),
(962, 60, 'Santiago', 'SA', 0),
(963, 60, 'Santiago Rodriguez', 'ST', 0),
(964, 60, 'Santo Domingo', 'SD', 0),
(965, 60, 'Valverde', 'VA', 0),
(966, 61, 'Aileu', 'AL', 0),
(967, 61, 'Ainaro', 'AN', 0),
(968, 61, 'Baucau', 'BA', 0),
(969, 61, 'Bobonaro', 'BO', 0),
(970, 61, 'Cova Lima', 'CO', 0),
(971, 61, 'Dili', 'DI', 0),
(972, 61, 'Ermera', 'ER', 0),
(973, 61, 'Lautem', 'LA', 0),
(974, 61, 'Liquica', 'LI', 0),
(975, 61, 'Manatuto', 'MT', 0),
(976, 61, 'Manufahi', 'MF', 0),
(977, 61, 'Oecussi', 'OE', 0),
(978, 61, 'Viqueque', 'VI', 0),
(979, 62, 'Azuay', 'AZU', 0),
(980, 62, 'Bolivar', 'BOL', 0),
(981, 62, 'Ca&ntilde;ar', 'CAN', 0),
(982, 62, 'Carchi', 'CAR', 0),
(983, 62, 'Chimborazo', 'CHI', 0),
(984, 62, 'Cotopaxi', 'COT', 0),
(985, 62, 'El Oro', 'EOR', 0),
(986, 62, 'Esmeraldas', 'ESM', 0),
(987, 62, 'Gal&aacute;pagos', 'GPS', 0),
(988, 62, 'Guayas', 'GUA', 0),
(989, 62, 'Imbabura', 'IMB', 0),
(990, 62, 'Loja', 'LOJ', 0),
(991, 62, 'Los Rios', 'LRO', 0),
(992, 62, 'Manab&iacute;', 'MAN', 0),
(993, 62, 'Morona Santiago', 'MSA', 0),
(994, 62, 'Napo', 'NAP', 0),
(995, 62, 'Orellana', 'ORE', 0),
(996, 62, 'Pastaza', 'PAS', 0),
(997, 62, 'Pichincha', 'PIC', 0),
(998, 62, 'Sucumb&iacute;os', 'SUC', 0),
(999, 62, 'Tungurahua', 'TUN', 0),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 0),
(1001, 63, 'Ad Daqahliyah', 'DHY', 0),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 0),
(1003, 63, 'Al Buhayrah', 'BHY', 0),
(1004, 63, 'Al Fayyum', 'FYM', 0),
(1005, 63, 'Al Gharbiyah', 'GBY', 0),
(1006, 63, 'Al Iskandariyah', 'IDR', 0),
(1007, 63, 'Al Isma''iliyah', 'IML', 0),
(1008, 63, 'Al Jizah', 'JZH', 0),
(1009, 63, 'Al Minufiyah', 'MFY', 0),
(1010, 63, 'Al Minya', 'MNY', 0),
(1011, 63, 'Al Qahirah', 'QHR', 0),
(1012, 63, 'Al Qalyubiyah', 'QLY', 0),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 0),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 0),
(1015, 63, 'As Suways', 'SWY', 0),
(1016, 63, 'Aswan', 'ASW', 0),
(1017, 63, 'Asyut', 'ASY', 0),
(1018, 63, 'Bani Suwayf', 'BSW', 0),
(1019, 63, 'Bur Sa''id', 'BSD', 0),
(1020, 63, 'Dumyat', 'DMY', 0),
(1021, 63, 'Janub Sina''', 'JNS', 0),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 0),
(1023, 63, 'Matruh', 'MAT', 0),
(1024, 63, 'Qina', 'QIN', 0),
(1025, 63, 'Shamal Sina''', 'SHS', 0),
(1026, 63, 'Suhaj', 'SUH', 0),
(1027, 64, 'Ahuachapan', 'AH', 0),
(1028, 64, 'Cabanas', 'CA', 0),
(1029, 64, 'Chalatenango', 'CH', 0),
(1030, 64, 'Cuscatlan', 'CU', 0),
(1031, 64, 'La Libertad', 'LB', 0),
(1032, 64, 'La Paz', 'PZ', 0),
(1033, 64, 'La Union', 'UN', 0),
(1034, 64, 'Morazan', 'MO', 0),
(1035, 64, 'San Miguel', 'SM', 0),
(1036, 64, 'San Salvador', 'SS', 0),
(1037, 64, 'San Vicente', 'SV', 0),
(1038, 64, 'Santa Ana', 'SA', 0),
(1039, 64, 'Sonsonate', 'SO', 0),
(1040, 64, 'Usulutan', 'US', 0),
(1041, 65, 'Provincia Annobon', 'AN', 0),
(1042, 65, 'Provincia Bioko Norte', 'BN', 0),
(1043, 65, 'Provincia Bioko Sur', 'BS', 0),
(1044, 65, 'Provincia Centro Sur', 'CS', 0),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 0),
(1046, 65, 'Provincia Litoral', 'LI', 0),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 0),
(1048, 66, 'Central (Maekel)', 'MA', 0),
(1049, 66, 'Anseba (Keren)', 'KE', 0),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 0),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 0),
(1052, 66, 'Southern (Debub)', 'DE', 0),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 0),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 0),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 0),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 0),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 0),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 0),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 0),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 0),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 0),
(1062, 67, 'Polvamaa (Polva)', 'PO', 0),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 0),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 0),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 0),
(1066, 67, 'Valgamaa (Valga)', 'VA', 0),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 0),
(1068, 67, 'Vorumaa (Voru)', 'VO', 0),
(1069, 68, 'Afar', 'AF', 0),
(1070, 68, 'Amhara', 'AH', 0),
(1071, 68, 'Benishangul-Gumaz', 'BG', 0),
(1072, 68, 'Gambela', 'GB', 0),
(1073, 68, 'Hariai', 'HR', 0),
(1074, 68, 'Oromia', 'OR', 0),
(1075, 68, 'Somali', 'SM', 0),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 0),
(1077, 68, 'Tigray', 'TG', 0),
(1078, 68, 'Addis Ababa', 'AA', 0),
(1079, 68, 'Dire Dawa', 'DD', 0),
(1080, 71, 'Central Division', 'C', 0),
(1081, 71, 'Northern Division', 'N', 0),
(1082, 71, 'Eastern Division', 'E', 0),
(1083, 71, 'Western Division', 'W', 0),
(1084, 71, 'Rotuma', 'R', 0),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 0),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 0),
(1087, 72, 'Itä-Suomen lääni', 'IS', 0),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 0),
(1089, 72, 'Lapin lääni', 'LA', 0),
(1090, 72, 'Oulun lääni', 'OU', 0),
(1114, 74, 'Ain', '01', 0),
(1115, 74, 'Aisne', '02', 0),
(1116, 74, 'Allier', '03', 0),
(1117, 74, 'Alpes de Haute Provence', '04', 0),
(1118, 74, 'Hautes-Alpes', '05', 0),
(1119, 74, 'Alpes Maritimes', '06', 0),
(1120, 74, 'Ard&egrave;che', '07', 0),
(1121, 74, 'Ardennes', '08', 0),
(1122, 74, 'Ari&egrave;ge', '09', 0),
(1123, 74, 'Aube', '10', 0),
(1124, 74, 'Aude', '11', 0),
(1125, 74, 'Aveyron', '12', 0),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 0),
(1127, 74, 'Calvados', '14', 0),
(1128, 74, 'Cantal', '15', 0),
(1129, 74, 'Charente', '16', 0),
(1130, 74, 'Charente Maritime', '17', 0),
(1131, 74, 'Cher', '18', 0),
(1132, 74, 'Corr&egrave;ze', '19', 0),
(1133, 74, 'Corse du Sud', '2A', 0),
(1134, 74, 'Haute Corse', '2B', 0),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 0),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 0),
(1137, 74, 'Creuse', '23', 0),
(1138, 74, 'Dordogne', '24', 0),
(1139, 74, 'Doubs', '25', 0),
(1140, 74, 'Dr&ocirc;me', '26', 0),
(1141, 74, 'Eure', '27', 0),
(1142, 74, 'Eure et Loir', '28', 0),
(1143, 74, 'Finist&egrave;re', '29', 0),
(1144, 74, 'Gard', '30', 0),
(1145, 74, 'Haute Garonne', '31', 0),
(1146, 74, 'Gers', '32', 0),
(1147, 74, 'Gironde', '33', 0),
(1148, 74, 'H&eacute;rault', '34', 0),
(1149, 74, 'Ille et Vilaine', '35', 0),
(1150, 74, 'Indre', '36', 0),
(1151, 74, 'Indre et Loire', '37', 0),
(1152, 74, 'Is&eacute;re', '38', 0),
(1153, 74, 'Jura', '39', 0),
(1154, 74, 'Landes', '40', 0),
(1155, 74, 'Loir et Cher', '41', 0),
(1156, 74, 'Loire', '42', 0),
(1157, 74, 'Haute Loire', '43', 0),
(1158, 74, 'Loire Atlantique', '44', 0),
(1159, 74, 'Loiret', '45', 0),
(1160, 74, 'Lot', '46', 0),
(1161, 74, 'Lot et Garonne', '47', 0),
(1162, 74, 'Loz&egrave;re', '48', 0),
(1163, 74, 'Maine et Loire', '49', 0),
(1164, 74, 'Manche', '50', 0),
(1165, 74, 'Marne', '51', 0),
(1166, 74, 'Haute Marne', '52', 0),
(1167, 74, 'Mayenne', '53', 0),
(1168, 74, 'Meurthe et Moselle', '54', 0),
(1169, 74, 'Meuse', '55', 0),
(1170, 74, 'Morbihan', '56', 0),
(1171, 74, 'Moselle', '57', 0),
(1172, 74, 'Ni&egrave;vre', '58', 0),
(1173, 74, 'Nord', '59', 0),
(1174, 74, 'Oise', '60', 0),
(1175, 74, 'Orne', '61', 0),
(1176, 74, 'Pas de Calais', '62', 0),
(1177, 74, 'Puy de D&ocirc;me', '63', 0),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 0),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 0),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 0),
(1181, 74, 'Bas Rhin', '67', 0),
(1182, 74, 'Haut Rhin', '68', 0),
(1183, 74, 'Rh&ocirc;ne', '69', 0),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 0),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 0),
(1186, 74, 'Sarthe', '72', 0),
(1187, 74, 'Savoie', '73', 0),
(1188, 74, 'Haute Savoie', '74', 0),
(1189, 74, 'Paris', '75', 0),
(1190, 74, 'Seine Maritime', '76', 0),
(1191, 74, 'Seine et Marne', '77', 0),
(1192, 74, 'Yvelines', '78', 0),
(1193, 74, 'Deux S&egrave;vres', '79', 0),
(1194, 74, 'Somme', '80', 0),
(1195, 74, 'Tarn', '81', 0),
(1196, 74, 'Tarn et Garonne', '82', 0),
(1197, 74, 'Var', '83', 0),
(1198, 74, 'Vaucluse', '84', 0),
(1199, 74, 'Vend&eacute;e', '85', 0),
(1200, 74, 'Vienne', '86', 0),
(1201, 74, 'Haute Vienne', '87', 0),
(1202, 74, 'Vosges', '88', 0),
(1203, 74, 'Yonne', '89', 0),
(1204, 74, 'Territoire de Belfort', '90', 0),
(1205, 74, 'Essonne', '91', 0),
(1206, 74, 'Hauts de Seine', '92', 0),
(1207, 74, 'Seine St-Denis', '93', 0),
(1208, 74, 'Val de Marne', '94', 0),
(1209, 74, 'Val d''Oise', '95', 0),
(1210, 76, 'Archipel des Marquises', 'M', 0),
(1211, 76, 'Archipel des Tuamotu', 'T', 0),
(1212, 76, 'Archipel des Tubuai', 'I', 0),
(1213, 76, 'Iles du Vent', 'V', 0),
(1214, 76, 'Iles Sous-le-Vent', 'S', 0),
(1215, 77, 'Iles Crozet', 'C', 0),
(1216, 77, 'Iles Kerguelen', 'K', 0),
(1217, 77, 'Ile Amsterdam', 'A', 0),
(1218, 77, 'Ile Saint-Paul', 'P', 0),
(1219, 77, 'Adelie Land', 'D', 0),
(1220, 78, 'Estuaire', 'ES', 0),
(1221, 78, 'Haut-Ogooue', 'HO', 0),
(1222, 78, 'Moyen-Ogooue', 'MO', 0),
(1223, 78, 'Ngounie', 'NG', 0),
(1224, 78, 'Nyanga', 'NY', 0),
(1225, 78, 'Ogooue-Ivindo', 'OI', 0),
(1226, 78, 'Ogooue-Lolo', 'OL', 0),
(1227, 78, 'Ogooue-Maritime', 'OM', 0),
(1228, 78, 'Woleu-Ntem', 'WN', 0),
(1229, 79, 'Banjul', 'BJ', 0),
(1230, 79, 'Basse', 'BS', 0),
(1231, 79, 'Brikama', 'BR', 0),
(1232, 79, 'Janjangbure', 'JA', 0),
(1233, 79, 'Kanifeng', 'KA', 0),
(1234, 79, 'Kerewan', 'KE', 0),
(1235, 79, 'Kuntaur', 'KU', 0),
(1236, 79, 'Mansakonko', 'MA', 0),
(1237, 79, 'Lower River', 'LR', 0),
(1238, 79, 'Central River', 'CR', 0),
(1239, 79, 'North Bank', 'NB', 0),
(1240, 79, 'Upper River', 'UR', 0),
(1241, 79, 'Western', 'WE', 0),
(1242, 80, 'Абхазская АО', 'AAO', 0),
(1243, 80, 'Аджарская АР', 'AJ', 0),
(1244, 80, 'Тбилиси', 'TB', 0),
(1245, 80, 'Гурия', 'GU', 0),
(1246, 80, 'Имеретия', 'IM', 0),
(1247, 80, 'Кахетия', 'KA', 0),
(1248, 80, 'Квемо-Картли', 'KK', 0),
(1249, 80, 'Мцхета-Мтианетия', 'MM', 0),
(1250, 80, 'Рача-Лечхуми и Нижняя Сванетия', 'RL', 0),
(1251, 80, 'Самегрело-Верхняя Сванетия', 'SZ', 0),
(1252, 80, 'Самцхе-Джавахетия', 'SJ', 0),
(1253, 80, 'Шида-Картли', 'SK', 0),
(1254, 81, 'Baden-Württemberg', 'BAW', 0),
(1255, 81, 'Bayern', 'BAY', 0),
(1256, 81, 'Berlin', 'BER', 0),
(1257, 81, 'Brandenburg', 'BRG', 0),
(1258, 81, 'Bremen', 'BRE', 0),
(1259, 81, 'Hamburg', 'HAM', 0),
(1260, 81, 'Hessen', 'HES', 0),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 0),
(1262, 81, 'Niedersachsen', 'NDS', 0),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 0),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 0),
(1265, 81, 'Saarland', 'SAR', 0),
(1266, 81, 'Sachsen', 'SAS', 0),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 0),
(1268, 81, 'Schleswig-Holstein', 'SCN', 0),
(1269, 81, 'Thüringen', 'THE', 0),
(1270, 82, 'Ashanti Region', 'AS', 0),
(1271, 82, 'Brong-Ahafo Region', 'BA', 0),
(1272, 82, 'Central Region', 'CE', 0),
(1273, 82, 'Eastern Region', 'EA', 0),
(1274, 82, 'Greater Accra Region', 'GA', 0),
(1275, 82, 'Northern Region', 'NO', 0),
(1276, 82, 'Upper East Region', 'UE', 0),
(1277, 82, 'Upper West Region', 'UW', 0),
(1278, 82, 'Volta Region', 'VO', 0),
(1279, 82, 'Western Region', 'WE', 0),
(1280, 84, 'Attica', 'AT', 0),
(1281, 84, 'Central Greece', 'CN', 0),
(1282, 84, 'Central Macedonia', 'CM', 0),
(1283, 84, 'Crete', 'CR', 0),
(1284, 84, 'East Macedonia and Thrace', 'EM', 0),
(1285, 84, 'Epirus', 'EP', 0),
(1286, 84, 'Ionian Islands', 'II', 0),
(1287, 84, 'North Aegean', 'NA', 0),
(1288, 84, 'Peloponnesos', 'PP', 0),
(1289, 84, 'South Aegean', 'SA', 0),
(1290, 84, 'Thessaly', 'TH', 0),
(1291, 84, 'West Greece', 'WG', 0),
(1292, 84, 'West Macedonia', 'WM', 0),
(1293, 85, 'Avannaa', 'A', 0),
(1294, 85, 'Tunu', 'T', 0),
(1295, 85, 'Kitaa', 'K', 0),
(1296, 86, 'Saint Andrew', 'A', 0),
(1297, 86, 'Saint David', 'D', 0),
(1298, 86, 'Saint George', 'G', 0),
(1299, 86, 'Saint John', 'J', 0),
(1300, 86, 'Saint Mark', 'M', 0),
(1301, 86, 'Saint Patrick', 'P', 0),
(1302, 86, 'Carriacou', 'C', 0),
(1303, 86, 'Petit Martinique', 'Q', 0),
(1304, 89, 'Alta Verapaz', 'AV', 0),
(1305, 89, 'Baja Verapaz', 'BV', 0),
(1306, 89, 'Chimaltenango', 'CM', 0),
(1307, 89, 'Chiquimula', 'CQ', 0),
(1308, 89, 'El Peten', 'PE', 0),
(1309, 89, 'El Progreso', 'PR', 0),
(1310, 89, 'El Quiche', 'QC', 0),
(1311, 89, 'Escuintla', 'ES', 0),
(1312, 89, 'Guatemala', 'GU', 0),
(1313, 89, 'Huehuetenango', 'HU', 0),
(1314, 89, 'Izabal', 'IZ', 0),
(1315, 89, 'Jalapa', 'JA', 0),
(1316, 89, 'Jutiapa', 'JU', 0),
(1317, 89, 'Quetzaltenango', 'QZ', 0),
(1318, 89, 'Retalhuleu', 'RE', 0),
(1319, 89, 'Sacatepequez', 'ST', 0),
(1320, 89, 'San Marcos', 'SM', 0),
(1321, 89, 'Santa Rosa', 'SR', 0),
(1322, 89, 'Solola', 'SO', 0),
(1323, 89, 'Suchitepequez', 'SU', 0),
(1324, 89, 'Totonicapan', 'TO', 0),
(1325, 89, 'Zacapa', 'ZA', 0),
(1326, 90, 'Conakry', 'CNK', 0),
(1327, 90, 'Beyla', 'BYL', 0),
(1328, 90, 'Boffa', 'BFA', 0),
(1329, 90, 'Boke', 'BOK', 0),
(1330, 90, 'Coyah', 'COY', 0),
(1331, 90, 'Dabola', 'DBL', 0),
(1332, 90, 'Dalaba', 'DLB', 0),
(1333, 90, 'Dinguiraye', 'DGR', 0),
(1334, 90, 'Dubreka', 'DBR', 0),
(1335, 90, 'Faranah', 'FRN', 0),
(1336, 90, 'Forecariah', 'FRC', 0),
(1337, 90, 'Fria', 'FRI', 0),
(1338, 90, 'Gaoual', 'GAO', 0),
(1339, 90, 'Gueckedou', 'GCD', 0),
(1340, 90, 'Kankan', 'KNK', 0),
(1341, 90, 'Kerouane', 'KRN', 0),
(1342, 90, 'Kindia', 'KND', 0),
(1343, 90, 'Kissidougou', 'KSD', 0),
(1344, 90, 'Koubia', 'KBA', 0),
(1345, 90, 'Koundara', 'KDA', 0),
(1346, 90, 'Kouroussa', 'KRA', 0),
(1347, 90, 'Labe', 'LAB', 0),
(1348, 90, 'Lelouma', 'LLM', 0),
(1349, 90, 'Lola', 'LOL', 0),
(1350, 90, 'Macenta', 'MCT', 0),
(1351, 90, 'Mali', 'MAL', 0),
(1352, 90, 'Mamou', 'MAM', 0),
(1353, 90, 'Mandiana', 'MAN', 0),
(1354, 90, 'Nzerekore', 'NZR', 0),
(1355, 90, 'Pita', 'PIT', 0),
(1356, 90, 'Siguiri', 'SIG', 0),
(1357, 90, 'Telimele', 'TLM', 0),
(1358, 90, 'Tougue', 'TOG', 0),
(1359, 90, 'Yomou', 'YOM', 0),
(1360, 91, 'Bafata Region', 'BF', 0),
(1361, 91, 'Biombo Region', 'BB', 0),
(1362, 91, 'Bissau Region', 'BS', 0),
(1363, 91, 'Bolama Region', 'BL', 0),
(1364, 91, 'Cacheu Region', 'CA', 0),
(1365, 91, 'Gabu Region', 'GA', 0),
(1366, 91, 'Oio Region', 'OI', 0),
(1367, 91, 'Quinara Region', 'QU', 0),
(1368, 91, 'Tombali Region', 'TO', 0),
(1369, 92, 'Barima-Waini', 'BW', 0),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 0),
(1371, 92, 'Demerara-Mahaica', 'DM', 0),
(1372, 92, 'East Berbice-Corentyne', 'EC', 0),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 0),
(1374, 92, 'Mahaica-Berbice', 'MB', 0),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 0),
(1376, 92, 'Potaro-Siparuni', 'PI', 0),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 0),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 0),
(1379, 93, 'Artibonite', 'AR', 0),
(1380, 93, 'Centre', 'CE', 0),
(1381, 93, 'Grand''Anse', 'GA', 0),
(1382, 93, 'Nord', 'ND', 0),
(1383, 93, 'Nord-Est', 'NE', 0),
(1384, 93, 'Nord-Ouest', 'NO', 0),
(1385, 93, 'Ouest', 'OU', 0),
(1386, 93, 'Sud', 'SD', 0),
(1387, 93, 'Sud-Est', 'SE', 0),
(1388, 94, 'Flat Island', 'F', 0),
(1389, 94, 'McDonald Island', 'M', 0),
(1390, 94, 'Shag Island', 'S', 0),
(1391, 94, 'Heard Island', 'H', 0),
(1392, 95, 'Atlantida', 'AT', 0),
(1393, 95, 'Choluteca', 'CH', 0),
(1394, 95, 'Colon', 'CL', 0),
(1395, 95, 'Comayagua', 'CM', 0),
(1396, 95, 'Copan', 'CP', 0),
(1397, 95, 'Cortes', 'CR', 0),
(1398, 95, 'El Paraiso', 'PA', 0),
(1399, 95, 'Francisco Morazan', 'FM', 0),
(1400, 95, 'Gracias a Dios', 'GD', 0),
(1401, 95, 'Intibuca', 'IN', 0),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 0),
(1403, 95, 'La Paz', 'PZ', 0),
(1404, 95, 'Lempira', 'LE', 0),
(1405, 95, 'Ocotepeque', 'OC', 0),
(1406, 95, 'Olancho', 'OL', 0),
(1407, 95, 'Santa Barbara', 'SB', 0),
(1408, 95, 'Valle', 'VA', 0),
(1409, 95, 'Yoro', 'YO', 0),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 0),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 0),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 0),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 0),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 0),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 0),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 0),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 0),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 0),
(1419, 96, 'Islands New Territories', 'NIS', 0),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 0),
(1421, 96, 'North New Territories', 'NNO', 0),
(1422, 96, 'Sai Kung New Territories', 'NSK', 0),
(1423, 96, 'Sha Tin New Territories', 'NST', 0),
(1424, 96, 'Tai Po New Territories', 'NTP', 0),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 0),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 0),
(1427, 96, 'Yuen Long New Territories', 'NYL', 0),
(1467, 98, 'Austurland', 'AL', 0),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 0),
(1469, 98, 'Norourland eystra', 'NE', 0),
(1470, 98, 'Norourland vestra', 'NV', 0),
(1471, 98, 'Suourland', 'SL', 0),
(1472, 98, 'Suournes', 'SN', 0),
(1473, 98, 'Vestfiroir', 'VF', 0),
(1474, 98, 'Vesturland', 'VL', 0),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 0),
(1476, 99, 'Andhra Pradesh', 'AP', 0),
(1477, 99, 'Arunachal Pradesh', 'AR', 0),
(1478, 99, 'Assam', 'AS', 0),
(1479, 99, 'Bihar', 'BI', 0),
(1480, 99, 'Chandigarh', 'CH', 0),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 0),
(1482, 99, 'Daman and Diu', 'DM', 0),
(1483, 99, 'Delhi', 'DE', 0),
(1484, 99, 'Goa', 'GO', 0),
(1485, 99, 'Gujarat', 'GU', 0),
(1486, 99, 'Haryana', 'HA', 0),
(1487, 99, 'Himachal Pradesh', 'HP', 0),
(1488, 99, 'Jammu and Kashmir', 'JA', 0),
(1489, 99, 'Karnataka', 'KA', 0),
(1490, 99, 'Kerala', 'KE', 0),
(1491, 99, 'Lakshadweep Islands', 'LI', 0),
(1492, 99, 'Madhya Pradesh', 'MP', 0),
(1493, 99, 'Maharashtra', 'MA', 0),
(1494, 99, 'Manipur', 'MN', 0),
(1495, 99, 'Meghalaya', 'ME', 0),
(1496, 99, 'Mizoram', 'MI', 0),
(1497, 99, 'Nagaland', 'NA', 0),
(1498, 99, 'Orissa', 'OR', 0),
(1499, 99, 'Puducherry', 'PO', 0),
(1500, 99, 'Punjab', 'PU', 0),
(1501, 99, 'Rajasthan', 'RA', 0),
(1502, 99, 'Sikkim', 'SI', 0),
(1503, 99, 'Tamil Nadu', 'TN', 0),
(1504, 99, 'Tripura', 'TR', 0),
(1505, 99, 'Uttar Pradesh', 'UP', 0),
(1506, 99, 'West Bengal', 'WB', 0),
(1507, 100, 'Aceh', 'AC', 0),
(1508, 100, 'Bali', 'BA', 0),
(1509, 100, 'Banten', 'BT', 0),
(1510, 100, 'Bengkulu', 'BE', 0),
(1511, 100, 'Kalimantan Utara', 'BD', 0),
(1512, 100, 'Gorontalo', 'GO', 0),
(1513, 100, 'Jakarta', 'JK', 0),
(1514, 100, 'Jambi', 'JA', 0),
(1515, 100, 'Jawa Barat', 'JB', 0),
(1516, 100, 'Jawa Tengah', 'JT', 0),
(1517, 100, 'Jawa Timur', 'JI', 0),
(1518, 100, 'Kalimantan Barat', 'KB', 0),
(1519, 100, 'Kalimantan Selatan', 'KS', 0),
(1520, 100, 'Kalimantan Tengah', 'KT', 0),
(1521, 100, 'Kalimantan Timur', 'KI', 0),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 0),
(1523, 100, 'Lampung', 'LA', 0),
(1524, 100, 'Maluku', 'MA', 0),
(1525, 100, 'Maluku Utara', 'MU', 0),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 0),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 0),
(1528, 100, 'Papua', 'PA', 0),
(1529, 100, 'Riau', 'RI', 0),
(1530, 100, 'Sulawesi Selatan', 'SN', 0),
(1531, 100, 'Sulawesi Tengah', 'ST', 0),
(1532, 100, 'Sulawesi Tenggara', 'SG', 0),
(1533, 100, 'Sulawesi Utara', 'SA', 0),
(1534, 100, 'Sumatera Barat', 'SB', 0),
(1535, 100, 'Sumatera Selatan', 'SS', 0),
(1536, 100, 'Sumatera Utara', 'SU', 0),
(1537, 100, 'Yogyakarta', 'YO', 0),
(1538, 101, 'Tehran', 'TEH', 0),
(1539, 101, 'Qom', 'QOM', 0),
(1540, 101, 'Markazi', 'MKZ', 0),
(1541, 101, 'Qazvin', 'QAZ', 0),
(1542, 101, 'Gilan', 'GIL', 0),
(1543, 101, 'Ardabil', 'ARD', 0),
(1544, 101, 'Zanjan', 'ZAN', 0),
(1545, 101, 'East Azarbaijan', 'EAZ', 0),
(1546, 101, 'West Azarbaijan', 'WEZ', 0),
(1547, 101, 'Kurdistan', 'KRD', 0),
(1548, 101, 'Hamadan', 'HMD', 0),
(1549, 101, 'Kermanshah', 'KRM', 0),
(1550, 101, 'Ilam', 'ILM', 0),
(1551, 101, 'Lorestan', 'LRS', 0),
(1552, 101, 'Khuzestan', 'KZT', 0),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 0),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 0),
(1555, 101, 'Bushehr', 'BSH', 0),
(1556, 101, 'Fars', 'FAR', 0);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1557, 101, 'Hormozgan', 'HRM', 0),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 0),
(1559, 101, 'Kerman', 'KRB', 0),
(1560, 101, 'Yazd', 'YZD', 0),
(1561, 101, 'Esfahan', 'EFH', 0),
(1562, 101, 'Semnan', 'SMN', 0),
(1563, 101, 'Mazandaran', 'MZD', 0),
(1564, 101, 'Golestan', 'GLS', 0),
(1565, 101, 'North Khorasan', 'NKH', 0),
(1566, 101, 'Razavi Khorasan', 'RKH', 0),
(1567, 101, 'South Khorasan', 'SKH', 0),
(1568, 102, 'Baghdad', 'BD', 0),
(1569, 102, 'Salah ad Din', 'SD', 0),
(1570, 102, 'Diyala', 'DY', 0),
(1571, 102, 'Wasit', 'WS', 0),
(1572, 102, 'Maysan', 'MY', 0),
(1573, 102, 'Al Basrah', 'BA', 0),
(1574, 102, 'Dhi Qar', 'DQ', 0),
(1575, 102, 'Al Muthanna', 'MU', 0),
(1576, 102, 'Al Qadisyah', 'QA', 0),
(1577, 102, 'Babil', 'BB', 0),
(1578, 102, 'Al Karbala', 'KB', 0),
(1579, 102, 'An Najaf', 'NJ', 0),
(1580, 102, 'Al Anbar', 'AB', 0),
(1581, 102, 'Ninawa', 'NN', 0),
(1582, 102, 'Dahuk', 'DH', 0),
(1583, 102, 'Arbil', 'AL', 0),
(1584, 102, 'At Ta''mim', 'TM', 0),
(1585, 102, 'As Sulaymaniyah', 'SL', 0),
(1586, 103, 'Carlow', 'CA', 0),
(1587, 103, 'Cavan', 'CV', 0),
(1588, 103, 'Clare', 'CL', 0),
(1589, 103, 'Cork', 'CO', 0),
(1590, 103, 'Donegal', 'DO', 0),
(1591, 103, 'Dublin', 'DU', 0),
(1592, 103, 'Galway', 'GA', 0),
(1593, 103, 'Kerry', 'KE', 0),
(1594, 103, 'Kildare', 'KI', 0),
(1595, 103, 'Kilkenny', 'KL', 0),
(1596, 103, 'Laois', 'LA', 0),
(1597, 103, 'Leitrim', 'LE', 0),
(1598, 103, 'Limerick', 'LI', 0),
(1599, 103, 'Longford', 'LO', 0),
(1600, 103, 'Louth', 'LU', 0),
(1601, 103, 'Mayo', 'MA', 0),
(1602, 103, 'Meath', 'ME', 0),
(1603, 103, 'Monaghan', 'MO', 0),
(1604, 103, 'Offaly', 'OF', 0),
(1605, 103, 'Roscommon', 'RO', 0),
(1606, 103, 'Sligo', 'SL', 0),
(1607, 103, 'Tipperary', 'TI', 0),
(1608, 103, 'Waterford', 'WA', 0),
(1609, 103, 'Westmeath', 'WE', 0),
(1610, 103, 'Wexford', 'WX', 0),
(1611, 103, 'Wicklow', 'WI', 0),
(1612, 104, 'Be''er Sheva', 'BS', 0),
(1613, 104, 'Bika''at Hayarden', 'BH', 0),
(1614, 104, 'Eilat and Arava', 'EA', 0),
(1615, 104, 'Galil', 'GA', 0),
(1616, 104, 'Haifa', 'HA', 0),
(1617, 104, 'Jehuda Mountains', 'JM', 0),
(1618, 104, 'Jerusalem', 'JE', 0),
(1619, 104, 'Negev', 'NE', 0),
(1620, 104, 'Semaria', 'SE', 0),
(1621, 104, 'Sharon', 'SH', 0),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 0),
(3860, 105, 'Caltanissetta', 'CL', 0),
(3842, 105, 'Agrigento', 'AG', 0),
(3843, 105, 'Alessandria', 'AL', 0),
(3844, 105, 'Ancona', 'AN', 0),
(3845, 105, 'Aosta', 'AO', 0),
(3846, 105, 'Arezzo', 'AR', 0),
(3847, 105, 'Ascoli Piceno', 'AP', 0),
(3848, 105, 'Asti', 'AT', 0),
(3849, 105, 'Avellino', 'AV', 0),
(3850, 105, 'Bari', 'BA', 0),
(3851, 105, 'Belluno', 'BL', 0),
(3852, 105, 'Benevento', 'BN', 0),
(3853, 105, 'Bergamo', 'BG', 0),
(3854, 105, 'Biella', 'BI', 0),
(3855, 105, 'Bologna', 'BO', 0),
(3856, 105, 'Bolzano', 'BZ', 0),
(3857, 105, 'Brescia', 'BS', 0),
(3858, 105, 'Brindisi', 'BR', 0),
(3859, 105, 'Cagliari', 'CA', 0),
(1643, 106, 'Clarendon Parish', 'CLA', 0),
(1644, 106, 'Hanover Parish', 'HAN', 0),
(1645, 106, 'Kingston Parish', 'KIN', 0),
(1646, 106, 'Manchester Parish', 'MAN', 0),
(1647, 106, 'Portland Parish', 'POR', 0),
(1648, 106, 'Saint Andrew Parish', 'AND', 0),
(1649, 106, 'Saint Ann Parish', 'ANN', 0),
(1650, 106, 'Saint Catherine Parish', 'CAT', 0),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 0),
(1652, 106, 'Saint James Parish', 'JAM', 0),
(1653, 106, 'Saint Mary Parish', 'MAR', 0),
(1654, 106, 'Saint Thomas Parish', 'THO', 0),
(1655, 106, 'Trelawny Parish', 'TRL', 0),
(1656, 106, 'Westmoreland Parish', 'WML', 0),
(1657, 107, 'Aichi', 'AI', 0),
(1658, 107, 'Akita', 'AK', 0),
(1659, 107, 'Aomori', 'AO', 0),
(1660, 107, 'Chiba', 'CH', 0),
(1661, 107, 'Ehime', 'EH', 0),
(1662, 107, 'Fukui', 'FK', 0),
(1663, 107, 'Fukuoka', 'FU', 0),
(1664, 107, 'Fukushima', 'FS', 0),
(1665, 107, 'Gifu', 'GI', 0),
(1666, 107, 'Gumma', 'GU', 0),
(1667, 107, 'Hiroshima', 'HI', 0),
(1668, 107, 'Hokkaido', 'HO', 0),
(1669, 107, 'Hyogo', 'HY', 0),
(1670, 107, 'Ibaraki', 'IB', 0),
(1671, 107, 'Ishikawa', 'IS', 0),
(1672, 107, 'Iwate', 'IW', 0),
(1673, 107, 'Kagawa', 'KA', 0),
(1674, 107, 'Kagoshima', 'KG', 0),
(1675, 107, 'Kanagawa', 'KN', 0),
(1676, 107, 'Kochi', 'KO', 0),
(1677, 107, 'Kumamoto', 'KU', 0),
(1678, 107, 'Kyoto', 'KY', 0),
(1679, 107, 'Mie', 'MI', 0),
(1680, 107, 'Miyagi', 'MY', 0),
(1681, 107, 'Miyazaki', 'MZ', 0),
(1682, 107, 'Nagano', 'NA', 0),
(1683, 107, 'Nagasaki', 'NG', 0),
(1684, 107, 'Nara', 'NR', 0),
(1685, 107, 'Niigata', 'NI', 0),
(1686, 107, 'Oita', 'OI', 0),
(1687, 107, 'Okayama', 'OK', 0),
(1688, 107, 'Okinawa', 'ON', 0),
(1689, 107, 'Osaka', 'OS', 0),
(1690, 107, 'Saga', 'SA', 0),
(1691, 107, 'Saitama', 'SI', 0),
(1692, 107, 'Shiga', 'SH', 0),
(1693, 107, 'Shimane', 'SM', 0),
(1694, 107, 'Shizuoka', 'SZ', 0),
(1695, 107, 'Tochigi', 'TO', 0),
(1696, 107, 'Tokushima', 'TS', 0),
(1697, 107, 'Tokyo', 'TK', 0),
(1698, 107, 'Tottori', 'TT', 0),
(1699, 107, 'Toyama', 'TY', 0),
(1700, 107, 'Wakayama', 'WA', 0),
(1701, 107, 'Yamagata', 'YA', 0),
(1702, 107, 'Yamaguchi', 'YM', 0),
(1703, 107, 'Yamanashi', 'YN', 0),
(1704, 108, '''Amman', 'AM', 0),
(1705, 108, 'Ajlun', 'AJ', 0),
(1706, 108, 'Al ''Aqabah', 'AA', 0),
(1707, 108, 'Al Balqa''', 'AB', 0),
(1708, 108, 'Al Karak', 'AK', 0),
(1709, 108, 'Al Mafraq', 'AL', 0),
(1710, 108, 'At Tafilah', 'AT', 0),
(1711, 108, 'Az Zarqa''', 'AZ', 0),
(1712, 108, 'Irbid', 'IR', 0),
(1713, 108, 'Jarash', 'JA', 0),
(1714, 108, 'Ma''an', 'MA', 0),
(1715, 108, 'Madaba', 'MD', 0),
(1716, 109, 'Алматинская область', 'AL', 0),
(1717, 109, 'Алматы', 'AC', 0),
(1718, 109, 'Акмолинская область', 'AM', 0),
(1719, 109, 'Актюбинская область', 'AQ', 0),
(1720, 109, 'Нур-Султан', 'AS', 0),
(1721, 109, 'Атырауская область', 'AT', 0),
(1722, 109, 'Западно-Казахстанская область', 'BA', 0),
(1723, 109, 'Байконур', 'BY', 0),
(1724, 109, 'Мангистауская область', 'MA', 0),
(1725, 109, 'Восточно-Казахстанская область', 'ON', 0),
(1726, 109, 'Павлодарская область', 'PA', 0),
(1727, 109, 'Карагандинская область', 'QA', 0),
(1728, 109, 'Костанайская область', 'QO', 0),
(1729, 109, 'Кызылординская область', 'QY', 0),
(1730, 109, 'Туркестанская область', 'SH', 0),
(1731, 109, 'Северо-Казахстанская область', 'SO', 0),
(1732, 109, 'Жамбылская область', 'ZH', 0),
(1733, 110, 'Central', 'CE', 0),
(1734, 110, 'Coast', 'CO', 0),
(1735, 110, 'Eastern', 'EA', 0),
(1736, 110, 'Nairobi Area', 'NA', 0),
(1737, 110, 'North Eastern', 'NE', 0),
(1738, 110, 'Nyanza', 'NY', 0),
(1739, 110, 'Rift Valley', 'RV', 0),
(1740, 110, 'Western', 'WE', 0),
(1741, 111, 'Abaiang', 'AG', 0),
(1742, 111, 'Abemama', 'AM', 0),
(1743, 111, 'Aranuka', 'AK', 0),
(1744, 111, 'Arorae', 'AO', 0),
(1745, 111, 'Banaba', 'BA', 0),
(1746, 111, 'Beru', 'BE', 0),
(1747, 111, 'Butaritari', 'bT', 0),
(1748, 111, 'Kanton', 'KA', 0),
(1749, 111, 'Kiritimati', 'KR', 0),
(1750, 111, 'Kuria', 'KU', 0),
(1751, 111, 'Maiana', 'MI', 0),
(1752, 111, 'Makin', 'MN', 0),
(1753, 111, 'Marakei', 'ME', 0),
(1754, 111, 'Nikunau', 'NI', 0),
(1755, 111, 'Nonouti', 'NO', 0),
(1756, 111, 'Onotoa', 'ON', 0),
(1757, 111, 'Tabiteuea', 'TT', 0),
(1758, 111, 'Tabuaeran', 'TR', 0),
(1759, 111, 'Tamana', 'TM', 0),
(1760, 111, 'Tarawa', 'TW', 0),
(1761, 111, 'Teraina', 'TE', 0),
(1762, 112, 'Chagang-do', 'CHA', 0),
(1763, 112, 'Hamgyong-bukto', 'HAB', 0),
(1764, 112, 'Hamgyong-namdo', 'HAN', 0),
(1765, 112, 'Hwanghae-bukto', 'HWB', 0),
(1766, 112, 'Hwanghae-namdo', 'HWN', 0),
(1767, 112, 'Kangwon-do', 'KAN', 0),
(1768, 112, 'P''yongan-bukto', 'PYB', 0),
(1769, 112, 'P''yongan-namdo', 'PYN', 0),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 0),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 0),
(1772, 112, 'P''yongyang Special City', 'PYO', 0),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 0),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 0),
(1775, 113, 'Cheju-do', 'CD', 0),
(1776, 113, 'Cholla-bukto', 'CB', 0),
(1777, 113, 'Cholla-namdo', 'CN', 0),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 0),
(1779, 113, 'Kangwon-do', 'KA', 0),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 0),
(1781, 113, 'Kyonggi-do', 'KD', 0),
(1782, 113, 'Kyongsang-bukto', 'KB', 0),
(1783, 113, 'Kyongsang-namdo', 'KN', 0),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 0),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 0),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 0),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 0),
(1788, 114, 'Al ''Asimah', 'AL', 0),
(1789, 114, 'Al Ahmadi', 'AA', 0),
(1790, 114, 'Al Farwaniyah', 'AF', 0),
(1791, 114, 'Al Jahra''', 'AJ', 0),
(1792, 114, 'Hawalli', 'HA', 0),
(1793, 115, 'Бишкек', 'GB', 0),
(1794, 115, 'Баткенская область', 'B', 0),
(1795, 115, 'Джалал-Абадская область', 'J', 0),
(1796, 115, 'Иссык-Кульская область', 'Y', 0),
(1797, 115, 'Нарынская область', 'N', 0),
(1798, 115, 'Ошская область', 'O', 0),
(1799, 115, 'Таласская область', 'T', 0),
(1800, 115, 'Чуйская область', 'C', 0),
(1801, 116, 'Vientiane', 'VT', 0),
(1802, 116, 'Attapu', 'AT', 0),
(1803, 116, 'Bokeo', 'BK', 0),
(1804, 116, 'Bolikhamxai', 'BL', 0),
(1805, 116, 'Champasak', 'CH', 0),
(1806, 116, 'Houaphan', 'HO', 0),
(1807, 116, 'Khammouan', 'KH', 0),
(1808, 116, 'Louang Namtha', 'LM', 0),
(1809, 116, 'Louangphabang', 'LP', 0),
(1810, 116, 'Oudomxai', 'OU', 0),
(1811, 116, 'Phongsali', 'PH', 0),
(1812, 116, 'Salavan', 'SL', 0),
(1813, 116, 'Savannakhet', 'SV', 0),
(1814, 116, 'Vientiane', 'VI', 0),
(1815, 116, 'Xaignabouli', 'XA', 0),
(1816, 116, 'Xekong', 'XE', 0),
(1817, 116, 'Xiangkhoang', 'XI', 0),
(1818, 116, 'Xaisomboun', 'XN', 0),
(1852, 119, 'Berea', 'BE', 0),
(1853, 119, 'Butha-Buthe', 'BB', 0),
(1854, 119, 'Leribe', 'LE', 0),
(1855, 119, 'Mafeteng', 'MF', 0),
(1856, 119, 'Maseru', 'MS', 0),
(1857, 119, 'Mohale''s Hoek', 'MH', 0),
(1858, 119, 'Mokhotlong', 'MK', 0),
(1859, 119, 'Qacha''s Nek', 'QN', 0),
(1860, 119, 'Quthing', 'QT', 0),
(1861, 119, 'Thaba-Tseka', 'TT', 0),
(1862, 120, 'Bomi', 'BI', 0),
(1863, 120, 'Bong', 'BG', 0),
(1864, 120, 'Grand Bassa', 'GB', 0),
(1865, 120, 'Grand Cape Mount', 'CM', 0),
(1866, 120, 'Grand Gedeh', 'GG', 0),
(1867, 120, 'Grand Kru', 'GK', 0),
(1868, 120, 'Lofa', 'LO', 0),
(1869, 120, 'Margibi', 'MG', 0),
(1870, 120, 'Maryland', 'ML', 0),
(1871, 120, 'Montserrado', 'MS', 0),
(1872, 120, 'Nimba', 'NB', 0),
(1873, 120, 'River Cess', 'RC', 0),
(1874, 120, 'Sinoe', 'SN', 0),
(1875, 121, 'Ajdabiya', 'AJ', 0),
(1876, 121, 'Al ''Aziziyah', 'AZ', 0),
(1877, 121, 'Al Fatih', 'FA', 0),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 0),
(1879, 121, 'Al Jufrah', 'JU', 0),
(1880, 121, 'Al Khums', 'KH', 0),
(1881, 121, 'Al Kufrah', 'KU', 0),
(1882, 121, 'An Nuqat al Khams', 'NK', 0),
(1883, 121, 'Ash Shati''', 'AS', 0),
(1884, 121, 'Awbari', 'AW', 0),
(1885, 121, 'Az Zawiyah', 'ZA', 0),
(1886, 121, 'Banghazi', 'BA', 0),
(1887, 121, 'Darnah', 'DA', 0),
(1888, 121, 'Ghadamis', 'GD', 0),
(1889, 121, 'Gharyan', 'GY', 0),
(1890, 121, 'Misratah', 'MI', 0),
(1891, 121, 'Murzuq', 'MZ', 0),
(1892, 121, 'Sabha', 'SB', 0),
(1893, 121, 'Sawfajjin', 'SW', 0),
(1894, 121, 'Surt', 'SU', 0),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 0),
(1896, 121, 'Tarhunah', 'TH', 0),
(1897, 121, 'Tubruq', 'TU', 0),
(1898, 121, 'Yafran', 'YA', 0),
(1899, 121, 'Zlitan', 'ZL', 0),
(1900, 122, 'Vaduz', 'V', 0),
(1901, 122, 'Schaan', 'A', 0),
(1902, 122, 'Balzers', 'B', 0),
(1903, 122, 'Triesen', 'N', 0),
(1904, 122, 'Eschen', 'E', 0),
(1905, 122, 'Mauren', 'M', 0),
(1906, 122, 'Triesenberg', 'T', 0),
(1907, 122, 'Ruggell', 'R', 0),
(1908, 122, 'Gamprin', 'G', 0),
(1909, 122, 'Schellenberg', 'L', 0),
(1910, 122, 'Planken', 'P', 0),
(1911, 123, 'Alytus', 'AL', 0),
(1912, 123, 'Kaunas', 'KA', 0),
(1913, 123, 'Klaipeda', 'KL', 0),
(1914, 123, 'Marijampole', 'MA', 0),
(1915, 123, 'Panevezys', 'PA', 0),
(1916, 123, 'Siauliai', 'SI', 0),
(1917, 123, 'Taurage', 'TA', 0),
(1918, 123, 'Telsiai', 'TE', 0),
(1919, 123, 'Utena', 'UT', 0),
(1920, 123, 'Vilnius', 'VI', 0),
(1921, 124, 'Diekirch', 'DD', 0),
(1922, 124, 'Clervaux', 'DC', 0),
(1923, 124, 'Redange', 'DR', 0),
(1924, 124, 'Vianden', 'DV', 0),
(1925, 124, 'Wiltz', 'DW', 0),
(1926, 124, 'Grevenmacher', 'GG', 0),
(1927, 124, 'Echternach', 'GE', 0),
(1928, 124, 'Remich', 'GR', 0),
(1929, 124, 'Luxembourg', 'LL', 0),
(1930, 124, 'Capellen', 'LC', 0),
(1931, 124, 'Esch-sur-Alzette', 'LE', 0),
(1932, 124, 'Mersch', 'LM', 0),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 0),
(1934, 125, 'St. Anthony Parish', 'ANT', 0),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 0),
(1936, 125, 'Cathedral Parish', 'CAT', 0),
(1937, 125, 'St. Lawrence Parish', 'LAW', 0),
(1938, 127, 'Antananarivo', 'AN', 0),
(1939, 127, 'Antsiranana', 'AS', 0),
(1940, 127, 'Fianarantsoa', 'FN', 0),
(1941, 127, 'Mahajanga', 'MJ', 0),
(1942, 127, 'Toamasina', 'TM', 0),
(1943, 127, 'Toliara', 'TL', 0),
(1944, 128, 'Balaka', 'BLK', 0),
(1945, 128, 'Blantyre', 'BLT', 0),
(1946, 128, 'Chikwawa', 'CKW', 0),
(1947, 128, 'Chiradzulu', 'CRD', 0),
(1948, 128, 'Chitipa', 'CTP', 0),
(1949, 128, 'Dedza', 'DDZ', 0),
(1950, 128, 'Dowa', 'DWA', 0),
(1951, 128, 'Karonga', 'KRG', 0),
(1952, 128, 'Kasungu', 'KSG', 0),
(1953, 128, 'Likoma', 'LKM', 0),
(1954, 128, 'Lilongwe', 'LLG', 0),
(1955, 128, 'Machinga', 'MCG', 0),
(1956, 128, 'Mangochi', 'MGC', 0),
(1957, 128, 'Mchinji', 'MCH', 0),
(1958, 128, 'Mulanje', 'MLJ', 0),
(1959, 128, 'Mwanza', 'MWZ', 0),
(1960, 128, 'Mzimba', 'MZM', 0),
(1961, 128, 'Ntcheu', 'NTU', 0),
(1962, 128, 'Nkhata Bay', 'NKB', 0),
(1963, 128, 'Nkhotakota', 'NKH', 0),
(1964, 128, 'Nsanje', 'NSJ', 0),
(1965, 128, 'Ntchisi', 'NTI', 0),
(1966, 128, 'Phalombe', 'PHL', 0),
(1967, 128, 'Rumphi', 'RMP', 0),
(1968, 128, 'Salima', 'SLM', 0),
(1969, 128, 'Thyolo', 'THY', 0),
(1970, 128, 'Zomba', 'ZBA', 0),
(1971, 129, 'Johor', 'MY-01', 0),
(1972, 129, 'Kedah', 'MY-02', 0),
(1973, 129, 'Kelantan', 'MY-03', 0),
(1974, 129, 'Labuan', 'MY-15', 0),
(1975, 129, 'Melaka', 'MY-04', 0),
(1976, 129, 'Negeri Sembilan', 'MY-05', 0),
(1977, 129, 'Pahang', 'MY-06', 0),
(1978, 129, 'Perak', 'MY-08', 0),
(1979, 129, 'Perlis', 'MY-09', 0),
(1980, 129, 'Pulau Pinang', 'MY-07', 0),
(1981, 129, 'Sabah', 'MY-12', 0),
(1982, 129, 'Sarawak', 'MY-13', 0),
(1983, 129, 'Selangor', 'MY-10', 0),
(1984, 129, 'Terengganu', 'MY-11', 0),
(1985, 129, 'Kuala Lumpur', 'MY-14', 0),
(4035, 129, 'Putrajaya', 'MY-16', 0),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 0),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 0),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 0),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 0),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 0),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 0),
(1992, 130, 'Faadhippolhu', 'FAA', 0),
(1993, 130, 'Male Atoll', 'MAA', 0),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 0),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 0),
(1996, 130, 'Felidhe Atoll', 'FEA', 0),
(1997, 130, 'Mulaku Atoll', 'MUA', 0),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 0),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 0),
(2000, 130, 'Kolhumadulu', 'KLH', 0),
(2001, 130, 'Hadhdhunmathi', 'HDH', 0),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 0),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 0),
(2004, 130, 'Fua Mulaku', 'FMU', 0),
(2005, 130, 'Addu', 'ADD', 0),
(2006, 131, 'Gao', 'GA', 0),
(2007, 131, 'Kayes', 'KY', 0),
(2008, 131, 'Kidal', 'KD', 0),
(2009, 131, 'Koulikoro', 'KL', 0),
(2010, 131, 'Mopti', 'MP', 0),
(2011, 131, 'Segou', 'SG', 0),
(2012, 131, 'Sikasso', 'SK', 0),
(2013, 131, 'Tombouctou', 'TB', 0),
(2014, 131, 'Bamako Capital District', 'CD', 0),
(2015, 132, 'Attard', 'ATT', 0),
(2016, 132, 'Balzan', 'BAL', 0),
(2017, 132, 'Birgu', 'BGU', 0),
(2018, 132, 'Birkirkara', 'BKK', 0),
(2019, 132, 'Birzebbuga', 'BRZ', 0),
(2020, 132, 'Bormla', 'BOR', 0),
(2021, 132, 'Dingli', 'DIN', 0),
(2022, 132, 'Fgura', 'FGU', 0),
(2023, 132, 'Floriana', 'FLO', 0),
(2024, 132, 'Gudja', 'GDJ', 0),
(2025, 132, 'Gzira', 'GZR', 0),
(2026, 132, 'Gargur', 'GRG', 0),
(2027, 132, 'Gaxaq', 'GXQ', 0),
(2028, 132, 'Hamrun', 'HMR', 0),
(2029, 132, 'Iklin', 'IKL', 0),
(2030, 132, 'Isla', 'ISL', 0),
(2031, 132, 'Kalkara', 'KLK', 0),
(2032, 132, 'Kirkop', 'KRK', 0),
(2033, 132, 'Lija', 'LIJ', 0),
(2034, 132, 'Luqa', 'LUQ', 0),
(2035, 132, 'Marsa', 'MRS', 0),
(2036, 132, 'Marsaskala', 'MKL', 0),
(2037, 132, 'Marsaxlokk', 'MXL', 0),
(2038, 132, 'Mdina', 'MDN', 0),
(2039, 132, 'Melliea', 'MEL', 0),
(2040, 132, 'Mgarr', 'MGR', 0),
(2041, 132, 'Mosta', 'MST', 0),
(2042, 132, 'Mqabba', 'MQA', 0),
(2043, 132, 'Msida', 'MSI', 0),
(2044, 132, 'Mtarfa', 'MTF', 0),
(2045, 132, 'Naxxar', 'NAX', 0),
(2046, 132, 'Paola', 'PAO', 0),
(2047, 132, 'Pembroke', 'PEM', 0),
(2048, 132, 'Pieta', 'PIE', 0),
(2049, 132, 'Qormi', 'QOR', 0),
(2050, 132, 'Qrendi', 'QRE', 0),
(2051, 132, 'Rabat', 'RAB', 0),
(2052, 132, 'Safi', 'SAF', 0),
(2053, 132, 'San Giljan', 'SGI', 0),
(2054, 132, 'Santa Lucija', 'SLU', 0),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 0),
(2056, 132, 'San Gwann', 'SGW', 0),
(2057, 132, 'Santa Venera', 'SVE', 0),
(2058, 132, 'Siggiewi', 'SIG', 0),
(2059, 132, 'Sliema', 'SLM', 0),
(2060, 132, 'Swieqi', 'SWQ', 0),
(2061, 132, 'Ta Xbiex', 'TXB', 0),
(2062, 132, 'Tarxien', 'TRX', 0),
(2063, 132, 'Valletta', 'VLT', 0),
(2064, 132, 'Xgajra', 'XGJ', 0),
(2065, 132, 'Zabbar', 'ZBR', 0),
(2066, 132, 'Zebbug', 'ZBG', 0),
(2067, 132, 'Zejtun', 'ZJT', 0),
(2068, 132, 'Zurrieq', 'ZRQ', 0),
(2069, 132, 'Fontana', 'FNT', 0),
(2070, 132, 'Ghajnsielem', 'GHJ', 0),
(2071, 132, 'Gharb', 'GHR', 0),
(2072, 132, 'Ghasri', 'GHS', 0),
(2073, 132, 'Kercem', 'KRC', 0),
(2074, 132, 'Munxar', 'MUN', 0),
(2075, 132, 'Nadur', 'NAD', 0),
(2076, 132, 'Qala', 'QAL', 0),
(2077, 132, 'Victoria', 'VIC', 0),
(2078, 132, 'San Lawrenz', 'SLA', 0),
(2079, 132, 'Sannat', 'SNT', 0),
(2080, 132, 'Xagra', 'ZAG', 0),
(2081, 132, 'Xewkija', 'XEW', 0),
(2082, 132, 'Zebbug', 'ZEB', 0),
(2083, 133, 'Ailinginae', 'ALG', 0),
(2084, 133, 'Ailinglaplap', 'ALL', 0),
(2085, 133, 'Ailuk', 'ALK', 0),
(2086, 133, 'Arno', 'ARN', 0),
(2087, 133, 'Aur', 'AUR', 0),
(2088, 133, 'Bikar', 'BKR', 0),
(2089, 133, 'Bikini', 'BKN', 0),
(2090, 133, 'Bokak', 'BKK', 0),
(2091, 133, 'Ebon', 'EBN', 0),
(2092, 133, 'Enewetak', 'ENT', 0),
(2093, 133, 'Erikub', 'EKB', 0),
(2094, 133, 'Jabat', 'JBT', 0),
(2095, 133, 'Jaluit', 'JLT', 0),
(2096, 133, 'Jemo', 'JEM', 0),
(2097, 133, 'Kili', 'KIL', 0),
(2098, 133, 'Kwajalein', 'KWJ', 0),
(2099, 133, 'Lae', 'LAE', 0),
(2100, 133, 'Lib', 'LIB', 0),
(2101, 133, 'Likiep', 'LKP', 0),
(2102, 133, 'Majuro', 'MJR', 0),
(2103, 133, 'Maloelap', 'MLP', 0),
(2104, 133, 'Mejit', 'MJT', 0),
(2105, 133, 'Mili', 'MIL', 0),
(2106, 133, 'Namorik', 'NMK', 0),
(2107, 133, 'Namu', 'NAM', 0),
(2108, 133, 'Rongelap', 'RGL', 0),
(2109, 133, 'Rongrik', 'RGK', 0),
(2110, 133, 'Toke', 'TOK', 0),
(2111, 133, 'Ujae', 'UJA', 0),
(2112, 133, 'Ujelang', 'UJL', 0),
(2113, 133, 'Utirik', 'UTK', 0),
(2114, 133, 'Wotho', 'WTH', 0),
(2115, 133, 'Wotje', 'WTJ', 0),
(2116, 135, 'Adrar', 'AD', 0),
(2117, 135, 'Assaba', 'AS', 0),
(2118, 135, 'Brakna', 'BR', 0),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 0),
(2120, 135, 'Gorgol', 'GO', 0),
(2121, 135, 'Guidimaka', 'GM', 0),
(2122, 135, 'Hodh Ech Chargui', 'HC', 0),
(2123, 135, 'Hodh El Gharbi', 'HG', 0),
(2124, 135, 'Inchiri', 'IN', 0),
(2125, 135, 'Tagant', 'TA', 0),
(2126, 135, 'Tiris Zemmour', 'TZ', 0),
(2127, 135, 'Trarza', 'TR', 0),
(2128, 135, 'Nouakchott', 'NO', 0),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 0),
(2130, 136, 'Curepipe', 'CU', 0),
(2131, 136, 'Port Louis', 'PU', 0),
(2132, 136, 'Quatre Bornes', 'QB', 0),
(2133, 136, 'Vacoas-Phoenix', 'VP', 0),
(2134, 136, 'Agalega Islands', 'AG', 0),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 0),
(2136, 136, 'Rodrigues', 'RO', 0),
(2137, 136, 'Black River', 'BL', 0),
(2138, 136, 'Flacq', 'FL', 0),
(2139, 136, 'Grand Port', 'GP', 0),
(2140, 136, 'Moka', 'MO', 0),
(2141, 136, 'Pamplemousses', 'PA', 0),
(2142, 136, 'Plaines Wilhems', 'PW', 0),
(2143, 136, 'Port Louis', 'PL', 0),
(2144, 136, 'Riviere du Rempart', 'RR', 0),
(2145, 136, 'Savanne', 'SA', 0),
(2146, 138, 'Baja California Norte', 'BN', 0),
(2147, 138, 'Baja California Sur', 'BS', 0),
(2148, 138, 'Campeche', 'CA', 0),
(2149, 138, 'Chiapas', 'CI', 0),
(2150, 138, 'Chihuahua', 'CH', 0),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 0),
(2152, 138, 'Colima', 'CL', 0),
(2153, 138, 'Distrito Federal', 'DF', 0),
(2154, 138, 'Durango', 'DU', 0),
(2155, 138, 'Guanajuato', 'GA', 0),
(2156, 138, 'Guerrero', 'GE', 0),
(2157, 138, 'Hidalgo', 'HI', 0),
(2158, 138, 'Jalisco', 'JA', 0),
(2159, 138, 'Mexico', 'ME', 0),
(2160, 138, 'Michoacan de Ocampo', 'MI', 0),
(2161, 138, 'Morelos', 'MO', 0),
(2162, 138, 'Nayarit', 'NA', 0),
(2163, 138, 'Nuevo Leon', 'NL', 0),
(2164, 138, 'Oaxaca', 'OA', 0),
(2165, 138, 'Puebla', 'PU', 0),
(2166, 138, 'Queretaro de Arteaga', 'QA', 0),
(2167, 138, 'Quintana Roo', 'QR', 0),
(2168, 138, 'San Luis Potosi', 'SA', 0),
(2169, 138, 'Sinaloa', 'SI', 0),
(2170, 138, 'Sonora', 'SO', 0),
(2171, 138, 'Tabasco', 'TB', 0),
(2172, 138, 'Tamaulipas', 'TM', 0),
(2173, 138, 'Tlaxcala', 'TL', 0),
(2174, 138, 'Veracruz-Llave', 'VE', 0),
(2175, 138, 'Yucatan', 'YU', 0),
(2176, 138, 'Zacatecas', 'ZA', 0),
(2177, 139, 'Chuuk', 'C', 0),
(2178, 139, 'Kosrae', 'K', 0),
(2179, 139, 'Pohnpei', 'P', 0),
(2180, 139, 'Yap', 'Y', 0),
(2181, 140, 'АТО Гагаузия', 'GA', 0),
(2182, 140, 'Муниципий Кишинёв', 'CU', 0),
(2183, 140, 'Муниципий Бельцы', 'BA', 0),
(2184, 140, 'Муниципий Кагул', 'CA', 0),
(2185, 140, 'Муниципий Единец', 'ED', 0),
(2186, 140, 'Муниципий Комрат', 'LA', 0),
(2187, 140, 'Муниципий Оргеев', 'OR', 0),
(2188, 140, 'Муниципий Сороки', 'SO', 0),
(2189, 140, 'Муниципий Тирасполь', 'TI', 0),
(2190, 140, 'Муниципий Унгены', 'UN', 0),
(2191, 140, 'АТЕ Левобережья Днестра', 'SN', 0),
(2192, 141, 'Fontvieille', 'FV', 0),
(2193, 141, 'La Condamine', 'LC', 0),
(2194, 141, 'Monaco-Ville', 'MV', 0),
(2195, 141, 'Monte-Carlo', 'MC', 0),
(2196, 142, 'Ulanbaatar', '1', 0),
(2197, 142, 'Orhon', '035', 0),
(2198, 142, 'Darhan uul', '037', 0),
(2199, 142, 'Hentiy', '039', 0),
(2200, 142, 'Hovsgol', '041', 0),
(2201, 142, 'Hovd', '043', 0),
(2202, 142, 'Uvs', '046', 0),
(2203, 142, 'Tov', '047', 0),
(2204, 142, 'Selenge', '049', 0),
(2205, 142, 'Suhbaatar', '051', 0),
(2206, 142, 'Omnogovi', '053', 0),
(2207, 142, 'Ovorhangay', '055', 0),
(2208, 142, 'Dzavhan', '057', 0),
(2209, 142, 'DundgovL', '059', 0),
(2210, 142, 'Dornod', '061', 0),
(2211, 142, 'Dornogov', '063', 0),
(2212, 142, 'Govi-Sumber', '064', 0),
(2213, 142, 'Govi-Altay', '065', 0),
(2214, 142, 'Bulgan', '067', 0),
(2215, 142, 'Bayanhongor', '069', 0),
(2216, 142, 'Bayan-Olgiy', '071', 0),
(2217, 142, 'Arhangay', '073', 0),
(2218, 143, 'Saint Anthony', 'A', 0),
(2219, 143, 'Saint Georges', 'G', 0),
(2220, 143, 'Saint Peter', 'P', 0),
(2221, 144, 'Agadir', 'AGD', 0),
(2222, 144, 'Al Hoceima', 'HOC', 0),
(2223, 144, 'Azilal', 'AZI', 0),
(2224, 144, 'Beni Mellal', 'BME', 0),
(2225, 144, 'Ben Slimane', 'BSL', 0),
(2226, 144, 'Boulemane', 'BLM', 0),
(2227, 144, 'Casablanca', 'CBL', 0),
(2228, 144, 'Chaouen', 'CHA', 0),
(2229, 144, 'El Jadida', 'EJA', 0),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 0),
(2231, 144, 'Er Rachidia', 'ERA', 0),
(2232, 144, 'Essaouira', 'ESS', 0),
(2233, 144, 'Fes', 'FES', 0),
(2234, 144, 'Figuig', 'FIG', 0),
(2235, 144, 'Guelmim', 'GLM', 0),
(2236, 144, 'Ifrane', 'IFR', 0),
(2237, 144, 'Kenitra', 'KEN', 0),
(2238, 144, 'Khemisset', 'KHM', 0),
(2239, 144, 'Khenifra', 'KHN', 0),
(2240, 144, 'Khouribga', 'KHO', 0),
(2241, 144, 'Laayoune', 'LYN', 0),
(2242, 144, 'Larache', 'LAR', 0),
(2243, 144, 'Marrakech', 'MRK', 0),
(2244, 144, 'Meknes', 'MKN', 0),
(2245, 144, 'Nador', 'NAD', 0),
(2246, 144, 'Ouarzazate', 'ORZ', 0),
(2247, 144, 'Oujda', 'OUJ', 0),
(2248, 144, 'Rabat-Sale', 'RSA', 0),
(2249, 144, 'Safi', 'SAF', 0),
(2250, 144, 'Settat', 'SET', 0),
(2251, 144, 'Sidi Kacem', 'SKA', 0),
(2252, 144, 'Tangier', 'TGR', 0),
(2253, 144, 'Tan-Tan', 'TAN', 0),
(2254, 144, 'Taounate', 'TAO', 0),
(2255, 144, 'Taroudannt', 'TRD', 0),
(2256, 144, 'Tata', 'TAT', 0),
(2257, 144, 'Taza', 'TAZ', 0),
(2258, 144, 'Tetouan', 'TET', 0),
(2259, 144, 'Tiznit', 'TIZ', 0),
(2260, 144, 'Ad Dakhla', 'ADK', 0),
(2261, 144, 'Boujdour', 'BJD', 0),
(2262, 144, 'Es Smara', 'ESM', 0),
(2263, 145, 'Cabo Delgado', 'CD', 0),
(2264, 145, 'Gaza', 'GZ', 0),
(2265, 145, 'Inhambane', 'IN', 0),
(2266, 145, 'Manica', 'MN', 0),
(2267, 145, 'Maputo (city)', 'MC', 0),
(2268, 145, 'Maputo', 'MP', 0),
(2269, 145, 'Nampula', 'NA', 0),
(2270, 145, 'Niassa', 'NI', 0),
(2271, 145, 'Sofala', 'SO', 0),
(2272, 145, 'Tete', 'TE', 0),
(2273, 145, 'Zambezia', 'ZA', 0),
(2274, 146, 'Ayeyarwady', 'AY', 0),
(2275, 146, 'Bago', 'BG', 0),
(2276, 146, 'Magway', 'MG', 0),
(2277, 146, 'Mandalay', 'MD', 0),
(2278, 146, 'Sagaing', 'SG', 0),
(2279, 146, 'Tanintharyi', 'TN', 0),
(2280, 146, 'Yangon', 'YG', 0),
(2281, 146, 'Chin State', 'CH', 0),
(2282, 146, 'Kachin State', 'KC', 0),
(2283, 146, 'Kayah State', 'KH', 0),
(2284, 146, 'Kayin State', 'KN', 0),
(2285, 146, 'Mon State', 'MN', 0),
(2286, 146, 'Rakhine State', 'RK', 0),
(2287, 146, 'Shan State', 'SH', 0),
(2288, 147, 'Caprivi', 'CA', 0),
(2289, 147, 'Erongo', 'ER', 0),
(2290, 147, 'Hardap', 'HA', 0),
(2291, 147, 'Karas', 'KR', 0),
(2292, 147, 'Kavango', 'KV', 0),
(2293, 147, 'Khomas', 'KH', 0),
(2294, 147, 'Kunene', 'KU', 0),
(2295, 147, 'Ohangwena', 'OW', 0),
(2296, 147, 'Omaheke', 'OK', 0),
(2297, 147, 'Omusati', 'OT', 0),
(2298, 147, 'Oshana', 'ON', 0),
(2299, 147, 'Oshikoto', 'OO', 0),
(2300, 147, 'Otjozondjupa', 'OJ', 0),
(2301, 148, 'Aiwo', 'AO', 0),
(2302, 148, 'Anabar', 'AA', 0),
(2303, 148, 'Anetan', 'AT', 0),
(2304, 148, 'Anibare', 'AI', 0),
(2305, 148, 'Baiti', 'BA', 0),
(2306, 148, 'Boe', 'BO', 0),
(2307, 148, 'Buada', 'BU', 0),
(2308, 148, 'Denigomodu', 'DE', 0),
(2309, 148, 'Ewa', 'EW', 0),
(2310, 148, 'Ijuw', 'IJ', 0),
(2311, 148, 'Meneng', 'ME', 0),
(2312, 148, 'Nibok', 'NI', 0),
(2313, 148, 'Uaboe', 'UA', 0),
(2314, 148, 'Yaren', 'YA', 0),
(2315, 149, 'Bagmati', 'BA', 0),
(2316, 149, 'Bheri', 'BH', 0),
(2317, 149, 'Dhawalagiri', 'DH', 0),
(2318, 149, 'Gandaki', 'GA', 0),
(2319, 149, 'Janakpur', 'JA', 0),
(2320, 149, 'Karnali', 'KA', 0),
(2321, 149, 'Kosi', 'KO', 0),
(2322, 149, 'Lumbini', 'LU', 0),
(2323, 149, 'Mahakali', 'MA', 0),
(2324, 149, 'Mechi', 'ME', 0),
(2325, 149, 'Narayani', 'NA', 0),
(2326, 149, 'Rapti', 'RA', 0),
(2327, 149, 'Sagarmatha', 'SA', 0),
(2328, 149, 'Seti', 'SE', 0),
(2329, 150, 'Drenthe', 'DR', 0),
(2330, 150, 'Flevoland', 'FL', 0),
(2331, 150, 'Friesland', 'FR', 0),
(2332, 150, 'Gelderland', 'GE', 0),
(2333, 150, 'Groningen', 'GR', 0),
(2334, 150, 'Limburg', 'LI', 0),
(2335, 150, 'Noord-Brabant', 'NB', 0),
(2336, 150, 'Noord-Holland', 'NH', 0),
(2337, 150, 'Overijssel', 'OV', 0),
(2338, 150, 'Utrecht', 'UT', 0),
(2339, 150, 'Zeeland', 'ZE', 0),
(2340, 150, 'Zuid-Holland', 'ZH', 0),
(2341, 152, 'Iles Loyaute', 'L', 0),
(2342, 152, 'Nord', 'N', 0),
(2343, 152, 'Sud', 'S', 0),
(2344, 153, 'Auckland', 'AUK', 0),
(2345, 153, 'Bay of Plenty', 'BOP', 0),
(2346, 153, 'Canterbury', 'CAN', 0),
(2347, 153, 'Coromandel', 'COR', 0),
(2348, 153, 'Gisborne', 'GIS', 0),
(2349, 153, 'Fiordland', 'FIO', 0),
(2350, 153, 'Hawke''s Bay', 'HKB', 0),
(2351, 153, 'Marlborough', 'MBH', 0),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 0),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 0),
(2354, 153, 'Nelson', 'NSN', 0),
(2355, 153, 'Northland', 'NTL', 0),
(2356, 153, 'Otago', 'OTA', 0),
(2357, 153, 'Southland', 'STL', 0),
(2358, 153, 'Taranaki', 'TKI', 0),
(2359, 153, 'Wellington', 'WGN', 0),
(2360, 153, 'Waikato', 'WKO', 0),
(2361, 153, 'Wairarapa', 'WAI', 0),
(2362, 153, 'West Coast', 'WTC', 0),
(2363, 154, 'Atlantico Norte', 'AN', 0),
(2364, 154, 'Atlantico Sur', 'AS', 0),
(2365, 154, 'Boaco', 'BO', 0),
(2366, 154, 'Carazo', 'CA', 0),
(2367, 154, 'Chinandega', 'CI', 0),
(2368, 154, 'Chontales', 'CO', 0),
(2369, 154, 'Esteli', 'ES', 0),
(2370, 154, 'Granada', 'GR', 0),
(2371, 154, 'Jinotega', 'JI', 0),
(2372, 154, 'Leon', 'LE', 0),
(2373, 154, 'Madriz', 'MD', 0),
(2374, 154, 'Managua', 'MN', 0),
(2375, 154, 'Masaya', 'MS', 0),
(2376, 154, 'Matagalpa', 'MT', 0),
(2377, 154, 'Nuevo Segovia', 'NS', 0),
(2378, 154, 'Rio San Juan', 'RS', 0),
(2379, 154, 'Rivas', 'RI', 0),
(2380, 155, 'Agadez', 'AG', 0),
(2381, 155, 'Diffa', 'DF', 0),
(2382, 155, 'Dosso', 'DS', 0),
(2383, 155, 'Maradi', 'MA', 0),
(2384, 155, 'Niamey', 'NM', 0),
(2385, 155, 'Tahoua', 'TH', 0),
(2386, 155, 'Tillaberi', 'TL', 0),
(2387, 155, 'Zinder', 'ZD', 0),
(2388, 156, 'Abia', 'AB', 0),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 0),
(2390, 156, 'Adamawa', 'AD', 0),
(2391, 156, 'Akwa Ibom', 'AK', 0),
(2392, 156, 'Anambra', 'AN', 0),
(2393, 156, 'Bauchi', 'BC', 0),
(2394, 156, 'Bayelsa', 'BY', 0),
(2395, 156, 'Benue', 'BN', 0),
(2396, 156, 'Borno', 'BO', 0),
(2397, 156, 'Cross River', 'CR', 0),
(2398, 156, 'Delta', 'DE', 0),
(2399, 156, 'Ebonyi', 'EB', 0),
(2400, 156, 'Edo', 'ED', 0),
(2401, 156, 'Ekiti', 'EK', 0),
(2402, 156, 'Enugu', 'EN', 0),
(2403, 156, 'Gombe', 'GO', 0),
(2404, 156, 'Imo', 'IM', 0),
(2405, 156, 'Jigawa', 'JI', 0),
(2406, 156, 'Kaduna', 'KD', 0),
(2407, 156, 'Kano', 'KN', 0),
(2408, 156, 'Katsina', 'KT', 0),
(2409, 156, 'Kebbi', 'KE', 0),
(2410, 156, 'Kogi', 'KO', 0),
(2411, 156, 'Kwara', 'KW', 0),
(2412, 156, 'Lagos', 'LA', 0),
(2413, 156, 'Nassarawa', 'NA', 0),
(2414, 156, 'Niger', 'NI', 0),
(2415, 156, 'Ogun', 'OG', 0),
(2416, 156, 'Ondo', 'ONG', 0),
(2417, 156, 'Osun', 'OS', 0),
(2418, 156, 'Oyo', 'OY', 0),
(2419, 156, 'Plateau', 'PL', 0),
(2420, 156, 'Rivers', 'RI', 0),
(2421, 156, 'Sokoto', 'SO', 0),
(2422, 156, 'Taraba', 'TA', 0),
(2423, 156, 'Yobe', 'YO', 0),
(2424, 156, 'Zamfara', 'ZA', 0),
(2425, 159, 'Northern Islands', 'N', 0),
(2426, 159, 'Rota', 'R', 0),
(2427, 159, 'Saipan', 'S', 0),
(2428, 159, 'Tinian', 'T', 0),
(2429, 160, 'Akershus', 'AK', 0),
(2430, 160, 'Aust-Agder', 'AA', 0),
(2431, 160, 'Buskerud', 'BU', 0),
(2432, 160, 'Finnmark', 'FM', 0),
(2433, 160, 'Hedmark', 'HM', 0),
(2434, 160, 'Hordaland', 'HL', 0),
(2435, 160, 'More og Romdal', 'MR', 0),
(2436, 160, 'Nord-Trondelag', 'NT', 0),
(2437, 160, 'Nordland', 'NL', 0),
(2438, 160, 'Ostfold', 'OF', 0),
(2439, 160, 'Oppland', 'OP', 0),
(2440, 160, 'Oslo', 'OL', 0),
(2441, 160, 'Rogaland', 'RL', 0),
(2442, 160, 'Sor-Trondelag', 'ST', 0),
(2443, 160, 'Sogn og Fjordane', 'SJ', 0),
(2444, 160, 'Svalbard', 'SV', 0),
(2445, 160, 'Telemark', 'TM', 0),
(2446, 160, 'Troms', 'TR', 0),
(2447, 160, 'Vest-Agder', 'VA', 0),
(2448, 160, 'Vestfold', 'VF', 0),
(2449, 161, 'Ad Dakhiliyah', 'DA', 0),
(2450, 161, 'Al Batinah', 'BA', 0),
(2451, 161, 'Al Wusta', 'WU', 0),
(2452, 161, 'Ash Sharqiyah', 'SH', 0),
(2453, 161, 'Az Zahirah', 'ZA', 0),
(2454, 161, 'Masqat', 'MA', 0),
(2455, 161, 'Musandam', 'MU', 0),
(2456, 161, 'Zufar', 'ZU', 0),
(2457, 162, 'Balochistan', 'B', 0),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 0),
(2459, 162, 'Islamabad Capital Territory', 'I', 0),
(2460, 162, 'North-West Frontier', 'N', 0),
(2461, 162, 'Punjab', 'P', 0),
(2462, 162, 'Sindh', 'S', 0),
(2463, 163, 'Aimeliik', 'AM', 0),
(2464, 163, 'Airai', 'AR', 0),
(2465, 163, 'Angaur', 'AN', 0),
(2466, 163, 'Hatohobei', 'HA', 0),
(2467, 163, 'Kayangel', 'KA', 0),
(2468, 163, 'Koror', 'KO', 0),
(2469, 163, 'Melekeok', 'ME', 0),
(2470, 163, 'Ngaraard', 'NA', 0),
(2471, 163, 'Ngarchelong', 'NG', 0),
(2472, 163, 'Ngardmau', 'ND', 0),
(2473, 163, 'Ngatpang', 'NT', 0),
(2474, 163, 'Ngchesar', 'NC', 0),
(2475, 163, 'Ngeremlengui', 'NR', 0),
(2476, 163, 'Ngiwal', 'NW', 0),
(2477, 163, 'Peleliu', 'PE', 0),
(2478, 163, 'Sonsorol', 'SO', 0),
(2479, 164, 'Bocas del Toro', 'BT', 0),
(2480, 164, 'Chiriqui', 'CH', 0),
(2481, 164, 'Cocle', 'CC', 0),
(2482, 164, 'Colon', 'CL', 0),
(2483, 164, 'Darien', 'DA', 0),
(2484, 164, 'Herrera', 'HE', 0),
(2485, 164, 'Los Santos', 'LS', 0),
(2486, 164, 'Panama', 'PA', 0),
(2487, 164, 'San Blas', 'SB', 0),
(2488, 164, 'Veraguas', 'VG', 0),
(2489, 165, 'Bougainville', 'BV', 0),
(2490, 165, 'Central', 'CE', 0),
(2491, 165, 'Chimbu', 'CH', 0),
(2492, 165, 'Eastern Highlands', 'EH', 0),
(2493, 165, 'East New Britain', 'EB', 0),
(2494, 165, 'East Sepik', 'ES', 0),
(2495, 165, 'Enga', 'EN', 0),
(2496, 165, 'Gulf', 'GU', 0),
(2497, 165, 'Madang', 'MD', 0),
(2498, 165, 'Manus', 'MN', 0),
(2499, 165, 'Milne Bay', 'MB', 0),
(2500, 165, 'Morobe', 'MR', 0),
(2501, 165, 'National Capital', 'NC', 0),
(2502, 165, 'New Ireland', 'NI', 0),
(2503, 165, 'Northern', 'NO', 0),
(2504, 165, 'Sandaun', 'SA', 0),
(2505, 165, 'Southern Highlands', 'SH', 0),
(2506, 165, 'Western', 'WE', 0),
(2507, 165, 'Western Highlands', 'WH', 0),
(2508, 165, 'West New Britain', 'WB', 0),
(2509, 166, 'Alto Paraguay', 'AG', 0),
(2510, 166, 'Alto Parana', 'AN', 0),
(2511, 166, 'Amambay', 'AM', 0),
(2512, 166, 'Asuncion', 'AS', 0),
(2513, 166, 'Boqueron', 'BO', 0),
(2514, 166, 'Caaguazu', 'CG', 0),
(2515, 166, 'Caazapa', 'CZ', 0),
(2516, 166, 'Canindeyu', 'CN', 0),
(2517, 166, 'Central', 'CE', 0),
(2518, 166, 'Concepcion', 'CC', 0),
(2519, 166, 'Cordillera', 'CD', 0),
(2520, 166, 'Guaira', 'GU', 0),
(2521, 166, 'Itapua', 'IT', 0),
(2522, 166, 'Misiones', 'MI', 0),
(2523, 166, 'Neembucu', 'NE', 0),
(2524, 166, 'Paraguari', 'PA', 0),
(2525, 166, 'Presidente Hayes', 'PH', 0),
(2526, 166, 'San Pedro', 'SP', 0),
(2527, 167, 'Amazonas', 'AM', 0),
(2528, 167, 'Ancash', 'AN', 0),
(2529, 167, 'Apurimac', 'AP', 0),
(2530, 167, 'Arequipa', 'AR', 0),
(2531, 167, 'Ayacucho', 'AY', 0),
(2532, 167, 'Cajamarca', 'CJ', 0),
(2533, 167, 'Callao', 'CL', 0),
(2534, 167, 'Cusco', 'CU', 0),
(2535, 167, 'Huancavelica', 'HV', 0),
(2536, 167, 'Huanuco', 'HO', 0),
(2537, 167, 'Ica', 'IC', 0),
(2538, 167, 'Junin', 'JU', 0),
(2539, 167, 'La Libertad', 'LD', 0),
(2540, 167, 'Lambayeque', 'LY', 0),
(2541, 167, 'Lima', 'LI', 0),
(2542, 167, 'Loreto', 'LO', 0),
(2543, 167, 'Madre de Dios', 'MD', 0),
(2544, 167, 'Moquegua', 'MO', 0),
(2545, 167, 'Pasco', 'PA', 0),
(2546, 167, 'Piura', 'PI', 0),
(2547, 167, 'Puno', 'PU', 0),
(2548, 167, 'San Martin', 'SM', 0),
(2549, 167, 'Tacna', 'TA', 0),
(2550, 167, 'Tumbes', 'TU', 0),
(2551, 167, 'Ucayali', 'UC', 0),
(2552, 168, 'Abra', 'ABR', 0),
(2553, 168, 'Agusan del Norte', 'ANO', 0),
(2554, 168, 'Agusan del Sur', 'ASU', 0),
(2555, 168, 'Aklan', 'AKL', 0),
(2556, 168, 'Albay', 'ALB', 0),
(2557, 168, 'Antique', 'ANT', 0),
(2558, 168, 'Apayao', 'APY', 0),
(2559, 168, 'Aurora', 'AUR', 0),
(2560, 168, 'Basilan', 'BAS', 0),
(2561, 168, 'Bataan', 'BTA', 0),
(2562, 168, 'Batanes', 'BTE', 0),
(2563, 168, 'Batangas', 'BTG', 0),
(2564, 168, 'Biliran', 'BLR', 0),
(2565, 168, 'Benguet', 'BEN', 0),
(2566, 168, 'Bohol', 'BOL', 0),
(2567, 168, 'Bukidnon', 'BUK', 0),
(2568, 168, 'Bulacan', 'BUL', 0),
(2569, 168, 'Cagayan', 'CAG', 0),
(2570, 168, 'Camarines Norte', 'CNO', 0),
(2571, 168, 'Camarines Sur', 'CSU', 0),
(2572, 168, 'Camiguin', 'CAM', 0),
(2573, 168, 'Capiz', 'CAP', 0),
(2574, 168, 'Catanduanes', 'CAT', 0),
(2575, 168, 'Cavite', 'CAV', 0),
(2576, 168, 'Cebu', 'CEB', 0),
(2577, 168, 'Compostela', 'CMP', 0),
(2578, 168, 'Davao del Norte', 'DNO', 0),
(2579, 168, 'Davao del Sur', 'DSU', 0),
(2580, 168, 'Davao Oriental', 'DOR', 0),
(2581, 168, 'Eastern Samar', 'ESA', 0),
(2582, 168, 'Guimaras', 'GUI', 0),
(2583, 168, 'Ifugao', 'IFU', 0),
(2584, 168, 'Ilocos Norte', 'INO', 0),
(2585, 168, 'Ilocos Sur', 'ISU', 0),
(2586, 168, 'Iloilo', 'ILO', 0),
(2587, 168, 'Isabela', 'ISA', 0),
(2588, 168, 'Kalinga', 'KAL', 0),
(2589, 168, 'Laguna', 'LAG', 0),
(2590, 168, 'Lanao del Norte', 'LNO', 0),
(2591, 168, 'Lanao del Sur', 'LSU', 0),
(2592, 168, 'La Union', 'UNI', 0),
(2593, 168, 'Leyte', 'LEY', 0),
(2594, 168, 'Maguindanao', 'MAG', 0),
(2595, 168, 'Marinduque', 'MRN', 0),
(2596, 168, 'Masbate', 'MSB', 0),
(2597, 168, 'Mindoro Occidental', 'MIC', 0),
(2598, 168, 'Mindoro Oriental', 'MIR', 0),
(2599, 168, 'Misamis Occidental', 'MSC', 0),
(2600, 168, 'Misamis Oriental', 'MOR', 0),
(2601, 168, 'Mountain', 'MOP', 0),
(2602, 168, 'Negros Occidental', 'NOC', 0),
(2603, 168, 'Negros Oriental', 'NOR', 0),
(2604, 168, 'North Cotabato', 'NCT', 0),
(2605, 168, 'Northern Samar', 'NSM', 0),
(2606, 168, 'Nueva Ecija', 'NEC', 0),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 0),
(2608, 168, 'Palawan', 'PLW', 0),
(2609, 168, 'Pampanga', 'PMP', 0),
(2610, 168, 'Pangasinan', 'PNG', 0),
(2611, 168, 'Quezon', 'QZN', 0),
(2612, 168, 'Quirino', 'QRN', 0),
(2613, 168, 'Rizal', 'RIZ', 0),
(2614, 168, 'Romblon', 'ROM', 0),
(2615, 168, 'Samar', 'SMR', 0),
(2616, 168, 'Sarangani', 'SRG', 0),
(2617, 168, 'Siquijor', 'SQJ', 0),
(2618, 168, 'Sorsogon', 'SRS', 0),
(2619, 168, 'South Cotabato', 'SCO', 0),
(2620, 168, 'Southern Leyte', 'SLE', 0),
(2621, 168, 'Sultan Kudarat', 'SKU', 0),
(2622, 168, 'Sulu', 'SLU', 0),
(2623, 168, 'Surigao del Norte', 'SNO', 0),
(2624, 168, 'Surigao del Sur', 'SSU', 0),
(2625, 168, 'Tarlac', 'TAR', 0),
(2626, 168, 'Tawi-Tawi', 'TAW', 0),
(2627, 168, 'Zambales', 'ZBL', 0),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 0),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 0),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 0),
(2631, 170, 'Dolnoslaskie', 'DO', 0),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 0),
(2633, 170, 'Lodzkie', 'LO', 0),
(2634, 170, 'Lubelskie', 'LL', 0),
(2635, 170, 'Lubuskie', 'LU', 0),
(2636, 170, 'Malopolskie', 'ML', 0),
(2637, 170, 'Mazowieckie', 'MZ', 0),
(2638, 170, 'Opolskie', 'OP', 0),
(2639, 170, 'Podkarpackie', 'PP', 0),
(2640, 170, 'Podlaskie', 'PL', 0),
(2641, 170, 'Pomorskie', 'PM', 0),
(2642, 170, 'Slaskie', 'SL', 0),
(2643, 170, 'Swietokrzyskie', 'SW', 0),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 0),
(2645, 170, 'Wielkopolskie', 'WP', 0),
(2646, 170, 'Zachodniopomorskie', 'ZA', 0),
(2647, 198, 'Saint Pierre', 'P', 0),
(2648, 198, 'Miquelon', 'M', 0),
(2649, 171, 'A&ccedil;ores', 'AC', 0),
(2650, 171, 'Aveiro', 'AV', 0),
(2651, 171, 'Beja', 'BE', 0),
(2652, 171, 'Braga', 'BR', 0),
(2653, 171, 'Bragan&ccedil;a', 'BA', 0),
(2654, 171, 'Castelo Branco', 'CB', 0),
(2655, 171, 'Coimbra', 'CO', 0),
(2656, 171, '&Eacute;vora', 'EV', 0),
(2657, 171, 'Faro', 'FA', 0),
(2658, 171, 'Guarda', 'GU', 0),
(2659, 171, 'Leiria', 'LE', 0),
(2660, 171, 'Lisboa', 'LI', 0),
(2661, 171, 'Madeira', 'ME', 0),
(2662, 171, 'Portalegre', 'PO', 0),
(2663, 171, 'Porto', 'PR', 0),
(2664, 171, 'Santar&eacute;m', 'SA', 0),
(2665, 171, 'Set&uacute;bal', 'SE', 0),
(2666, 171, 'Viana do Castelo', 'VC', 0),
(2667, 171, 'Vila Real', 'VR', 0),
(2668, 171, 'Viseu', 'VI', 0),
(2669, 173, 'Ad Dawhah', 'DW', 0),
(2670, 173, 'Al Ghuwayriyah', 'GW', 0),
(2671, 173, 'Al Jumayliyah', 'JM', 0),
(2672, 173, 'Al Khawr', 'KR', 0),
(2673, 173, 'Al Wakrah', 'WK', 0),
(2674, 173, 'Ar Rayyan', 'RN', 0),
(2675, 173, 'Jarayan al Batinah', 'JB', 0),
(2676, 173, 'Madinat ash Shamal', 'MS', 0),
(2677, 173, 'Umm Sa''id', 'UD', 0),
(2678, 173, 'Umm Salal', 'UL', 0),
(2679, 175, 'Alba', 'AB', 0),
(2680, 175, 'Arad', 'AR', 0),
(2681, 175, 'Arges', 'AG', 0),
(2682, 175, 'Bacau', 'BC', 0),
(2683, 175, 'Bihor', 'BH', 0),
(2684, 175, 'Bistrita-Nasaud', 'BN', 0),
(2685, 175, 'Botosani', 'BT', 0),
(2686, 175, 'Brasov', 'BV', 0),
(2687, 175, 'Braila', 'BR', 0),
(2688, 175, 'Bucuresti', 'B', 0),
(2689, 175, 'Buzau', 'BZ', 0),
(2690, 175, 'Caras-Severin', 'CS', 0),
(2691, 175, 'Calarasi', 'CL', 0),
(2692, 175, 'Cluj', 'CJ', 0),
(2693, 175, 'Constanta', 'CT', 0),
(2694, 175, 'Covasna', 'CV', 0),
(2695, 175, 'Dimbovita', 'DB', 0),
(2696, 175, 'Dolj', 'DJ', 0),
(2697, 175, 'Galati', 'GL', 0),
(2698, 175, 'Giurgiu', 'GR', 0),
(2699, 175, 'Gorj', 'GJ', 0),
(2700, 175, 'Harghita', 'HR', 0),
(2701, 175, 'Hunedoara', 'HD', 0),
(2702, 175, 'Ialomita', 'IL', 0),
(2703, 175, 'Iasi', 'IS', 0),
(2704, 175, 'Ilfov', 'IF', 0),
(2705, 175, 'Maramures', 'MM', 0),
(2706, 175, 'Mehedinti', 'MH', 0),
(2707, 175, 'Mures', 'MS', 0),
(2708, 175, 'Neamt', 'NT', 0),
(2709, 175, 'Olt', 'OT', 0),
(2710, 175, 'Prahova', 'PH', 0),
(2711, 175, 'Satu-Mare', 'SM', 0),
(2712, 175, 'Salaj', 'SJ', 0),
(2713, 175, 'Sibiu', 'SB', 0),
(2714, 175, 'Suceava', 'SV', 0),
(2715, 175, 'Teleorman', 'TR', 0),
(2716, 175, 'Timis', 'TM', 0),
(2717, 175, 'Tulcea', 'TL', 0),
(2718, 175, 'Vaslui', 'VS', 0),
(2719, 175, 'Valcea', 'VL', 0),
(2720, 175, 'Vrancea', 'VN', 0),
(2721, 176, 'Республика Адыгея', 'RAD', 1),
(2722, 176, 'Республика Алтай', 'RAL', 1),
(2723, 176, 'Республика Башкортостан', 'RBN', 1),
(2724, 176, 'Республика Бурятия', 'RBU', 1),
(2725, 176, 'Республика Дагестан', 'RD', 1),
(2726, 176, 'Республика Ингушетия', 'RI', 1),
(2727, 176, 'Кабардино-Балкарская Республика', 'KBR', 1),
(2728, 176, 'Республика Калмыкия', 'RKLM', 1),
(2729, 176, 'Карачаево-Черкесская Республика', 'KCHR', 1),
(2730, 176, 'Республика Карелия', 'RKAR', 1),
(2731, 176, 'Республика Коми', 'RK', 1),
(2732, 176, 'Республика Крым', 'RKR', 1),
(2733, 176, 'Республика Марий Эл', 'RML', 1),
(2734, 176, 'Республика Мордовия', 'RM', 1),
(2735, 176, 'Республика Саха', 'RS', 1),
(2736, 176, 'Республика Северная Осетия', 'RSO', 1),
(2738, 176, 'Республика Татарстан', 'RTN', 1),
(2739, 176, 'Республика Тыва', 'RTV', 1),
(2740, 176, 'Удмуртская Республика', 'IR', 1),
(2741, 176, 'Республика Хакасия', 'IV', 1),
(2742, 176, 'Чеченская Республика', 'IZ', 1),
(2743, 176, 'Чувашская Республика', 'KA', 1),
(2744, 176, 'Алтайский край', 'AK', 1),
(2745, 176, 'Забайкальский край', 'ZK', 1),
(2746, 176, 'Камчатский край', 'KK', 1),
(2747, 176, 'Краснодарский край', 'KRDK', 1),
(2748, 176, 'Красноярский край', 'KRRK', 1),
(2749, 176, 'Пермский край', 'PK', 1),
(2750, 176, 'Приморский край', 'PRK', 1),
(2751, 176, 'Ставропольский край', 'STK', 1),
(2752, 176, 'Хабаровский край', 'HBK', 1),
(2753, 176, 'Амурская область', 'AMO', 1),
(2754, 176, 'Архангельская область', 'ARO', 1),
(2755, 176, 'Астраханская область', 'ASO', 1),
(2756, 176, 'Белгородская область', 'BEO', 1),
(2757, 176, 'Брянская область', 'BRO', 1),
(2758, 176, 'Владимирская область', 'VLO', 1),
(2759, 176, 'Волгоградская область', 'VGO', 1),
(2760, 176, 'Вологодская область', 'VOO', 1),
(2761, 176, 'Воронежская область', 'VRO', 1),
(2762, 176, 'Ивановская область', 'IVO', 1),
(2763, 176, 'Иркутская область', 'IRO', 1),
(2764, 176, 'Калининградская область', 'KAO', 1),
(2765, 176, 'Калужская область', 'KLO', 1),
(2766, 176, 'Кемеровская область', 'KEO', 1),
(2767, 176, 'Кировская область', 'KIO', 1),
(2768, 176, 'Костромская область', 'KMO', 1),
(2769, 176, 'Курганская область', 'KUO', 1),
(2770, 176, 'Курская область', 'KRGO', 1),
(2771, 176, 'Ленинградская область', 'LENO', 1),
(2772, 176, 'Липецкая область', 'LPO', 1),
(2773, 176, 'Магаданская область', 'MGDO', 1),
(2774, 176, 'Московская область', 'MOO', 1),
(2775, 176, 'Мурманская область', 'MUO', 1),
(2776, 176, 'Нижегородская область', 'NGO', 1),
(2777, 176, 'Новгородская область', 'NOVO', 1),
(2778, 176, 'Новосибирская область', 'NSO', 1),
(2779, 176, 'Омская область', 'OMO', 1),
(2780, 176, 'Оренбургская область', 'OBO', 1),
(2781, 176, 'Орловская область', 'ORO', 1),
(2782, 176, 'Пензенская область', 'PZO', 1),
(2783, 176, 'Псковская область', 'PSKO', 1),
(2784, 176, 'Ростовская область', 'RVO', 1),
(2785, 176, 'Рязанская область', 'RZO', 1),
(2786, 176, 'Самарская область', 'SAMO', 1),
(2787, 176, 'Саратовская область', 'STO', 1),
(2788, 176, 'Сахалинская область', 'SLO', 1),
(2789, 176, 'Свердловская область', 'SVO', 1),
(2790, 176, 'Смоленская область', 'SMO', 1),
(2791, 176, 'Тамбовская область', 'TBO', 1),
(2792, 176, 'Тверская область', 'TVO', 1),
(2793, 176, 'Томская область', 'TOMO', 1),
(2794, 176, 'Тульская область', 'TUO', 1),
(2795, 176, 'Тюменская область', 'TUMO', 1),
(2796, 176, 'Ульяновская область', 'ULO', 1),
(2797, 176, 'Челябинская область', 'CHEO', 1),
(2798, 176, 'Ярославская область', 'YARO', 1),
(2799, 176, 'Еврейская АО', 'EAO', 1),
(2800, 176, 'Ненецкий АО', 'NAO', 1),
(2801, 176, 'Ханты-Мансийский АО', 'HMAO', 1),
(2802, 176, 'Чукотский АО', 'CHAO', 1),
(2803, 176, 'Ямало-Ненецкий АО', 'YANAO', 1),
(2804, 176, 'Москва', 'MSC', 1),
(2805, 176, 'Санкт-Петербург', 'SPB', 1),
(2806, 176, 'Казань', 'KZN', 1),
(2807, 176, 'Екатеринбург', 'EKB', 1),
(2809, 177, 'Butare', 'BU', 0),
(2810, 177, 'Byumba', 'BY', 0),
(2811, 177, 'Cyangugu', 'CY', 0),
(2812, 177, 'Gikongoro', 'GK', 0),
(2813, 177, 'Gisenyi', 'GS', 0),
(2814, 177, 'Gitarama', 'GT', 0),
(2815, 177, 'Kibungo', 'KG', 0),
(2816, 177, 'Kibuye', 'KY', 0),
(2817, 177, 'Kigali Rurale', 'KR', 0),
(2818, 177, 'Kigali-ville', 'KV', 0),
(2819, 177, 'Ruhengeri', 'RU', 0),
(2820, 177, 'Umutara', 'UM', 0),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 0),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 0),
(2823, 178, 'Saint George Basseterre', 'SGB', 0),
(2824, 178, 'Saint George Gingerland', 'SGG', 0),
(2825, 178, 'Saint James Windward', 'SJW', 0),
(2826, 178, 'Saint John Capesterre', 'SJC', 0),
(2827, 178, 'Saint John Figtree', 'SJF', 0),
(2828, 178, 'Saint Mary Cayon', 'SMC', 0),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 0),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 0),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 0),
(2832, 178, 'Saint Thomas Lowland', 'STL', 0),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 0),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 0),
(2835, 179, 'Anse-la-Raye', 'AR', 0),
(2836, 179, 'Castries', 'CA', 0),
(2837, 179, 'Choiseul', 'CH', 0),
(2838, 179, 'Dauphin', 'DA', 0),
(2839, 179, 'Dennery', 'DE', 0),
(2840, 179, 'Gros-Islet', 'GI', 0),
(2841, 179, 'Laborie', 'LA', 0),
(2842, 179, 'Micoud', 'MI', 0),
(2843, 179, 'Praslin', 'PR', 0),
(2844, 179, 'Soufriere', 'SO', 0),
(2845, 179, 'Vieux-Fort', 'VF', 0),
(2846, 180, 'Charlotte', 'C', 0),
(2847, 180, 'Grenadines', 'R', 0),
(2848, 180, 'Saint Andrew', 'A', 0),
(2849, 180, 'Saint David', 'D', 0),
(2850, 180, 'Saint George', 'G', 0),
(2851, 180, 'Saint Patrick', 'P', 0),
(2852, 181, 'A''ana', 'AN', 0),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 0),
(2854, 181, 'Atua', 'AT', 0),
(2855, 181, 'Fa''asaleleaga', 'FA', 0),
(2856, 181, 'Gaga''emauga', 'GE', 0),
(2857, 181, 'Gagaifomauga', 'GF', 0),
(2858, 181, 'Palauli', 'PA', 0),
(2859, 181, 'Satupa''itea', 'SA', 0),
(2860, 181, 'Tuamasaga', 'TU', 0),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 0),
(2862, 181, 'Vaisigano', 'VS', 0),
(2863, 182, 'Acquaviva', 'AC', 0),
(2864, 182, 'Borgo Maggiore', 'BM', 0),
(2865, 182, 'Chiesanuova', 'CH', 0),
(2866, 182, 'Domagnano', 'DO', 0),
(2867, 182, 'Faetano', 'FA', 0),
(2868, 182, 'Fiorentino', 'FI', 0),
(2869, 182, 'Montegiardino', 'MO', 0),
(2870, 182, 'Citta di San Marino', 'SM', 0),
(2871, 182, 'Serravalle', 'SE', 0),
(2872, 183, 'Sao Tome', 'S', 0),
(2873, 183, 'Principe', 'P', 0),
(2874, 184, 'Al Bahah', 'BH', 0),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 0),
(2876, 184, 'Al Jawf', 'JF', 0),
(2877, 184, 'Al Madinah', 'MD', 0),
(2878, 184, 'Al Qasim', 'QS', 0),
(2879, 184, 'Ar Riyad', 'RD', 0),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 0),
(2881, 184, '''Asir', 'AS', 0),
(2882, 184, 'Ha''il', 'HL', 0),
(2883, 184, 'Jizan', 'JZ', 0),
(2884, 184, 'Makkah', 'ML', 0),
(2885, 184, 'Najran', 'NR', 0),
(2886, 184, 'Tabuk', 'TB', 0),
(2887, 185, 'Dakar', 'DA', 0),
(2888, 185, 'Diourbel', 'DI', 0),
(2889, 185, 'Fatick', 'FA', 0),
(2890, 185, 'Kaolack', 'KA', 0),
(2891, 185, 'Kolda', 'KO', 0),
(2892, 185, 'Louga', 'LO', 0),
(2893, 185, 'Matam', 'MA', 0),
(2894, 185, 'Saint-Louis', 'SL', 0),
(2895, 185, 'Tambacounda', 'TA', 0),
(2896, 185, 'Thies', 'TH', 0),
(2897, 185, 'Ziguinchor', 'ZI', 0),
(2898, 186, 'Anse aux Pins', 'AP', 0),
(2899, 186, 'Anse Boileau', 'AB', 0),
(2900, 186, 'Anse Etoile', 'AE', 0),
(2901, 186, 'Anse Louis', 'AL', 0),
(2902, 186, 'Anse Royale', 'AR', 0),
(2903, 186, 'Baie Lazare', 'BL', 0),
(2904, 186, 'Baie Sainte Anne', 'BS', 0),
(2905, 186, 'Beau Vallon', 'BV', 0),
(2906, 186, 'Bel Air', 'BA', 0),
(2907, 186, 'Bel Ombre', 'BO', 0),
(2908, 186, 'Cascade', 'CA', 0),
(2909, 186, 'Glacis', 'GL', 0),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 0),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 0),
(2912, 186, 'La Digue', 'DG', 0),
(2913, 186, 'La Riviere Anglaise', 'RA', 0),
(2914, 186, 'Mont Buxton', 'MB', 0),
(2915, 186, 'Mont Fleuri', 'MF', 0),
(2916, 186, 'Plaisance', 'PL', 0),
(2917, 186, 'Pointe La Rue', 'PR', 0),
(2918, 186, 'Port Glaud', 'PG', 0),
(2919, 186, 'Saint Louis', 'SL', 0),
(2920, 186, 'Takamaka', 'TA', 0),
(2921, 187, 'Eastern', 'E', 0),
(2922, 187, 'Northern', 'N', 0),
(2923, 187, 'Southern', 'S', 0),
(2924, 187, 'Western', 'W', 0),
(2925, 189, 'Banskobystrický', 'BA', 0),
(2926, 189, 'Bratislavský', 'BR', 0),
(2927, 189, 'Košický', 'KO', 0),
(2928, 189, 'Nitriansky', 'NI', 0),
(2929, 189, 'Prešovský', 'PR', 0),
(2930, 189, 'Trenčiansky', 'TC', 0),
(2931, 189, 'Trnavský', 'TV', 0),
(2932, 189, 'Žilinský', 'ZI', 0),
(2933, 191, 'Central', 'CE', 0),
(2934, 191, 'Choiseul', 'CH', 0),
(2935, 191, 'Guadalcanal', 'GC', 0),
(2936, 191, 'Honiara', 'HO', 0),
(2937, 191, 'Isabel', 'IS', 0),
(2938, 191, 'Makira', 'MK', 0),
(2939, 191, 'Malaita', 'ML', 0),
(2940, 191, 'Rennell and Bellona', 'RB', 0),
(2941, 191, 'Temotu', 'TM', 0),
(2942, 191, 'Western', 'WE', 0),
(2943, 192, 'Awdal', 'AW', 0),
(2944, 192, 'Bakool', 'BK', 0),
(2945, 192, 'Banaadir', 'BN', 0),
(2946, 192, 'Bari', 'BR', 0),
(2947, 192, 'Bay', 'BY', 0),
(2948, 192, 'Galguduud', 'GA', 0),
(2949, 192, 'Gedo', 'GE', 0),
(2950, 192, 'Hiiraan', 'HI', 0),
(2951, 192, 'Jubbada Dhexe', 'JD', 0),
(2952, 192, 'Jubbada Hoose', 'JH', 0),
(2953, 192, 'Mudug', 'MU', 0),
(2954, 192, 'Nugaal', 'NU', 0),
(2955, 192, 'Sanaag', 'SA', 0),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 0),
(2957, 192, 'Shabeellaha Hoose', 'SH', 0),
(2958, 192, 'Sool', 'SL', 0),
(2959, 192, 'Togdheer', 'TO', 0),
(2960, 192, 'Woqooyi Galbeed', 'WG', 0),
(2961, 193, 'Eastern Cape', 'EC', 0),
(2962, 193, 'Free State', 'FS', 0),
(2963, 193, 'Gauteng', 'GT', 0),
(2964, 193, 'KwaZulu-Natal', 'KN', 0),
(2965, 193, 'Limpopo', 'LP', 0),
(2966, 193, 'Mpumalanga', 'MP', 0),
(2967, 193, 'North West', 'NW', 0),
(2968, 193, 'Northern Cape', 'NC', 0),
(2969, 193, 'Western Cape', 'WC', 0),
(2970, 195, 'La Coru&ntilde;a', 'CA', 0),
(2971, 195, '&Aacute;lava', 'AL', 0),
(2972, 195, 'Albacete', 'AB', 0),
(2973, 195, 'Alicante', 'AC', 0),
(2974, 195, 'Almeria', 'AM', 0),
(2975, 195, 'Asturias', 'AS', 0),
(2976, 195, '&Aacute;vila', 'AV', 0),
(2977, 195, 'Badajoz', 'BJ', 0),
(2978, 195, 'Baleares', 'IB', 0),
(2979, 195, 'Barcelona', 'BA', 0),
(2980, 195, 'Burgos', 'BU', 0),
(2981, 195, 'C&aacute;ceres', 'CC', 0),
(2982, 195, 'C&aacute;diz', 'CZ', 0),
(2983, 195, 'Cantabria', 'CT', 0),
(2984, 195, 'Castell&oacute;n', 'CL', 0),
(2985, 195, 'Ceuta', 'CE', 0),
(2986, 195, 'Ciudad Real', 'CR', 0),
(2987, 195, 'C&oacute;rdoba', 'CD', 0),
(2988, 195, 'Cuenca', 'CU', 0),
(2989, 195, 'Girona', 'GI', 0),
(2990, 195, 'Granada', 'GD', 0),
(2991, 195, 'Guadalajara', 'GJ', 0),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 0),
(2993, 195, 'Huelva', 'HL', 0),
(2994, 195, 'Huesca', 'HS', 0),
(2995, 195, 'Ja&eacute;n', 'JN', 0),
(2996, 195, 'La Rioja', 'RJ', 0),
(2997, 195, 'Las Palmas', 'PM', 0),
(2998, 195, 'Leon', 'LE', 0),
(2999, 195, 'Lleida', 'LL', 0),
(3000, 195, 'Lugo', 'LG', 0),
(3001, 195, 'Madrid', 'MD', 0),
(3002, 195, 'Malaga', 'MA', 0),
(3003, 195, 'Melilla', 'ML', 0),
(3004, 195, 'Murcia', 'MU', 0),
(3005, 195, 'Navarra', 'NV', 0),
(3006, 195, 'Ourense', 'OU', 0),
(3007, 195, 'Palencia', 'PL', 0),
(3008, 195, 'Pontevedra', 'PO', 0),
(3009, 195, 'Salamanca', 'SL', 0),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 0),
(3011, 195, 'Segovia', 'SG', 0),
(3012, 195, 'Sevilla', 'SV', 0),
(3013, 195, 'Soria', 'SO', 0),
(3014, 195, 'Tarragona', 'TA', 0),
(3015, 195, 'Teruel', 'TE', 0),
(3016, 195, 'Toledo', 'TO', 0),
(3017, 195, 'Valencia', 'VC', 0),
(3018, 195, 'Valladolid', 'VD', 0),
(3019, 195, 'Vizcaya', 'VZ', 0),
(3020, 195, 'Zamora', 'ZM', 0),
(3021, 195, 'Zaragoza', 'ZR', 0),
(3022, 196, 'Central', 'CE', 0),
(3023, 196, 'Eastern', 'EA', 0),
(3024, 196, 'North Central', 'NC', 0),
(3025, 196, 'Northern', 'NO', 0),
(3026, 196, 'North Western', 'NW', 0),
(3027, 196, 'Sabaragamuwa', 'SA', 0),
(3028, 196, 'Southern', 'SO', 0),
(3029, 196, 'Uva', 'UV', 0),
(3030, 196, 'Western', 'WE', 0),
(3032, 197, 'Saint Helena', 'S', 0),
(3034, 199, 'A''ali an Nil', 'ANL', 0),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 0),
(3036, 199, 'Al Buhayrat', 'BRT', 0),
(3037, 199, 'Al Jazirah', 'JZR', 0),
(3038, 199, 'Al Khartum', 'KRT', 0),
(3039, 199, 'Al Qadarif', 'QDR', 0),
(3040, 199, 'Al Wahdah', 'WDH', 0),
(3041, 199, 'An Nil al Abyad', 'ANB', 0),
(3042, 199, 'An Nil al Azraq', 'ANZ', 0),
(3043, 199, 'Ash Shamaliyah', 'ASH', 0),
(3044, 199, 'Bahr al Jabal', 'BJA', 0),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 0),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 0),
(3047, 199, 'Gharb Darfur', 'GDA', 0),
(3048, 199, 'Gharb Kurdufan', 'GKU', 0),
(3049, 199, 'Janub Darfur', 'JDA', 0),
(3050, 199, 'Janub Kurdufan', 'JKU', 0),
(3051, 199, 'Junqali', 'JQL', 0),
(3052, 199, 'Kassala', 'KSL', 0),
(3053, 199, 'Nahr an Nil', 'NNL', 0),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 0),
(3055, 199, 'Shamal Darfur', 'SDA', 0),
(3056, 199, 'Shamal Kurdufan', 'SKU', 0),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 0),
(3058, 199, 'Sinnar', 'SNR', 0),
(3059, 199, 'Warab', 'WRB', 0),
(3060, 200, 'Brokopondo', 'BR', 0),
(3061, 200, 'Commewijne', 'CM', 0),
(3062, 200, 'Coronie', 'CR', 0),
(3063, 200, 'Marowijne', 'MA', 0),
(3064, 200, 'Nickerie', 'NI', 0),
(3065, 200, 'Para', 'PA', 0),
(3066, 200, 'Paramaribo', 'PM', 0),
(3067, 200, 'Saramacca', 'SA', 0),
(3068, 200, 'Sipaliwini', 'SI', 0),
(3069, 200, 'Wanica', 'WA', 0),
(3070, 202, 'Hhohho', 'H', 0),
(3071, 202, 'Lubombo', 'L', 0),
(3072, 202, 'Manzini', 'M', 0),
(3073, 202, 'Shishelweni', 'S', 0),
(3074, 203, 'Blekinge', 'K', 0),
(3075, 203, 'Dalarna', 'W', 0),
(3076, 203, 'Gävleborg', 'X', 0),
(3077, 203, 'Gotland', 'I', 0),
(3078, 203, 'Halland', 'N', 0),
(3079, 203, 'Jämtland', 'Z', 0),
(3080, 203, 'Jönköping', 'F', 0),
(3081, 203, 'Kalmar', 'H', 0),
(3082, 203, 'Kronoberg', 'G', 0),
(3083, 203, 'Norrbotten', 'BD', 0),
(3084, 203, 'Örebro', 'T', 0),
(3085, 203, 'Östergötland', 'E', 0),
(3086, 203, 'Sk&aring;ne', 'M', 0),
(3087, 203, 'Södermanland', 'D', 0),
(3088, 203, 'Stockholm', 'AB', 0),
(3089, 203, 'Uppsala', 'C', 0),
(3090, 203, 'Värmland', 'S', 0),
(3091, 203, 'Västerbotten', 'AC', 0),
(3092, 203, 'Västernorrland', 'Y', 0);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3093, 203, 'Västmanland', 'U', 0),
(3094, 203, 'Västra Götaland', 'O', 0),
(3095, 204, 'Aargau', 'AG', 0),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 0),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 0),
(3098, 204, 'Basel-Stadt', 'BS', 0),
(3099, 204, 'Basel-Landschaft', 'BL', 0),
(3100, 204, 'Bern', 'BE', 0),
(3101, 204, 'Fribourg', 'FR', 0),
(3102, 204, 'Gen&egrave;ve', 'GE', 0),
(3103, 204, 'Glarus', 'GL', 0),
(3104, 204, 'Graubünden', 'GR', 0),
(3105, 204, 'Jura', 'JU', 0),
(3106, 204, 'Luzern', 'LU', 0),
(3107, 204, 'Neuch&acirc;tel', 'NE', 0),
(3108, 204, 'Nidwald', 'NW', 0),
(3109, 204, 'Obwald', 'OW', 0),
(3110, 204, 'St. Gallen', 'SG', 0),
(3111, 204, 'Schaffhausen', 'SH', 0),
(3112, 204, 'Schwyz', 'SZ', 0),
(3113, 204, 'Solothurn', 'SO', 0),
(3114, 204, 'Thurgau', 'TG', 0),
(3115, 204, 'Ticino', 'TI', 0),
(3116, 204, 'Uri', 'UR', 0),
(3117, 204, 'Valais', 'VS', 0),
(3118, 204, 'Vaud', 'VD', 0),
(3119, 204, 'Zug', 'ZG', 0),
(3120, 204, 'Zürich', 'ZH', 0),
(3121, 205, 'Al Hasakah', 'HA', 0),
(3122, 205, 'Al Ladhiqiyah', 'LA', 0),
(3123, 205, 'Al Qunaytirah', 'QU', 0),
(3124, 205, 'Ar Raqqah', 'RQ', 0),
(3125, 205, 'As Suwayda', 'SU', 0),
(3126, 205, 'Dara', 'DA', 0),
(3127, 205, 'Dayr az Zawr', 'DZ', 0),
(3128, 205, 'Dimashq', 'DI', 0),
(3129, 205, 'Halab', 'HL', 0),
(3130, 205, 'Hamah', 'HM', 0),
(3131, 205, 'Hims', 'HI', 0),
(3132, 205, 'Idlib', 'ID', 0),
(3133, 205, 'Rif Dimashq', 'RD', 0),
(3134, 205, 'Tartus', 'TA', 0),
(3135, 206, 'Chang-hua', 'CH', 0),
(3136, 206, 'Chia-i', 'CI', 0),
(3137, 206, 'Hsin-chu', 'HS', 0),
(3138, 206, 'Hua-lien', 'HL', 0),
(3139, 206, 'I-lan', 'IL', 0),
(3140, 206, 'Kao-hsiung county', 'KH', 0),
(3141, 206, 'Kin-men', 'KM', 0),
(3142, 206, 'Lien-chiang', 'LC', 0),
(3143, 206, 'Miao-li', 'ML', 0),
(3144, 206, 'Nan-t''ou', 'NT', 0),
(3145, 206, 'P''eng-hu', 'PH', 0),
(3146, 206, 'P''ing-tung', 'PT', 0),
(3147, 206, 'T''ai-chung', 'TG', 0),
(3148, 206, 'T''ai-nan', 'TA', 0),
(3149, 206, 'T''ai-pei county', 'TP', 0),
(3150, 206, 'T''ai-tung', 'TT', 0),
(3151, 206, 'T''ao-yuan', 'TY', 0),
(3152, 206, 'Yun-lin', 'YL', 0),
(3153, 206, 'Chia-i city', 'CC', 0),
(3154, 206, 'Chi-lung', 'CL', 0),
(3155, 206, 'Hsin-chu', 'HC', 0),
(3156, 206, 'T''ai-chung', 'TH', 0),
(3157, 206, 'T''ai-nan', 'TN', 0),
(3158, 206, 'Kao-hsiung city', 'KC', 0),
(3159, 206, 'T''ai-pei city', 'TC', 0),
(2808, 207, 'Душанбе', 'DNB', 0),
(3160, 207, 'Горно-Бадахшанская АО', 'GB', 0),
(3161, 207, 'Хатлонская область', 'KT', 0),
(3162, 207, 'Согдийская область', 'SU', 0),
(3163, 208, 'Arusha', 'AR', 0),
(3164, 208, 'Dar es Salaam', 'DS', 0),
(3165, 208, 'Dodoma', 'DO', 0),
(3166, 208, 'Iringa', 'IR', 0),
(3167, 208, 'Kagera', 'KA', 0),
(3168, 208, 'Kigoma', 'KI', 0),
(3169, 208, 'Kilimanjaro', 'KJ', 0),
(3170, 208, 'Lindi', 'LN', 0),
(3171, 208, 'Manyara', 'MY', 0),
(3172, 208, 'Mara', 'MR', 0),
(3173, 208, 'Mbeya', 'MB', 0),
(3174, 208, 'Morogoro', 'MO', 0),
(3175, 208, 'Mtwara', 'MT', 0),
(3176, 208, 'Mwanza', 'MW', 0),
(3177, 208, 'Pemba North', 'PN', 0),
(3178, 208, 'Pemba South', 'PS', 0),
(3179, 208, 'Pwani', 'PW', 0),
(3180, 208, 'Rukwa', 'RK', 0),
(3181, 208, 'Ruvuma', 'RV', 0),
(3182, 208, 'Shinyanga', 'SH', 0),
(3183, 208, 'Singida', 'SI', 0),
(3184, 208, 'Tabora', 'TB', 0),
(3185, 208, 'Tanga', 'TN', 0),
(3186, 208, 'Zanzibar Central/South', 'ZC', 0),
(3187, 208, 'Zanzibar North', 'ZN', 0),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 0),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 0),
(3190, 209, 'Ang Thong', 'Ang Thong', 0),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 0),
(3192, 209, 'Bangkok', 'Bangkok', 0),
(3193, 209, 'Buriram', 'Buriram', 0),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 0),
(3195, 209, 'Chai Nat', 'Chai Nat', 0),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 0),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 0),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 0),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 0),
(3200, 209, 'Chon Buri', 'Chon Buri', 0),
(3201, 209, 'Chumphon', 'Chumphon', 0),
(3202, 209, 'Kalasin', 'Kalasin', 0),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 0),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 0),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 0),
(3206, 209, 'Krabi', 'Krabi', 0),
(3207, 209, 'Lampang', 'Lampang', 0),
(3208, 209, 'Lamphun', 'Lamphun', 0),
(3209, 209, 'Loei', 'Loei', 0),
(3210, 209, 'Lop Buri', 'Lop Buri', 0),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 0),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 0),
(3213, 209, 'Mukdahan', 'Mukdahan', 0),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 0),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 0),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 0),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 0),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 0),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 0),
(3220, 209, 'Nan', 'Nan', 0),
(3221, 209, 'Narathiwat', 'Narathiwat', 0),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 0),
(3223, 209, 'Nong Khai', 'Nong Khai', 0),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 0),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 0),
(3226, 209, 'Pattani', 'Pattani', 0),
(3227, 209, 'Phangnga', 'Phangnga', 0),
(3228, 209, 'Phatthalung', 'Phatthalung', 0),
(3229, 209, 'Phayao', 'Phayao', 0),
(3230, 209, 'Phetchabun', 'Phetchabun', 0),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 0),
(3232, 209, 'Phichit', 'Phichit', 0),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 0),
(3234, 209, 'Phrae', 'Phrae', 0),
(3235, 209, 'Phuket', 'Phuket', 0),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 0),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 0),
(3238, 209, 'Ranong', 'Ranong', 0),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 0),
(3240, 209, 'Rayong', 'Rayong', 0),
(3241, 209, 'Roi Et', 'Roi Et', 0),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 0),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 0),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 0),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 0),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 0),
(3247, 209, 'Sara Buri', 'Sara Buri', 0),
(3248, 209, 'Satun', 'Satun', 0),
(3249, 209, 'Sing Buri', 'Sing Buri', 0),
(3250, 209, 'Sisaket', 'Sisaket', 0),
(3251, 209, 'Songkhla', 'Songkhla', 0),
(3252, 209, 'Sukhothai', 'Sukhothai', 0),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 0),
(3254, 209, 'Surat Thani', 'Surat Thani', 0),
(3255, 209, 'Surin', 'Surin', 0),
(3256, 209, 'Tak', 'Tak', 0),
(3257, 209, 'Trang', 'Trang', 0),
(3258, 209, 'Trat', 'Trat', 0),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 0),
(3260, 209, 'Udon Thani', 'Udon Thani', 0),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 0),
(3262, 209, 'Uttaradit', 'Uttaradit', 0),
(3263, 209, 'Yala', 'Yala', 0),
(3264, 209, 'Yasothon', 'Yasothon', 0),
(3265, 210, 'Kara', 'K', 0),
(3266, 210, 'Plateaux', 'P', 0),
(3267, 210, 'Savanes', 'S', 0),
(3268, 210, 'Centrale', 'C', 0),
(3269, 210, 'Maritime', 'M', 0),
(3270, 211, 'Atafu', 'A', 0),
(3271, 211, 'Fakaofo', 'F', 0),
(3272, 211, 'Nukunonu', 'N', 0),
(3273, 212, 'Ha''apai', 'H', 0),
(3274, 212, 'Tongatapu', 'T', 0),
(3275, 212, 'Vava''u', 'V', 0),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 0),
(3277, 213, 'Diego Martin', 'DM', 0),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 0),
(3279, 213, 'Penal/Debe', 'PD', 0),
(3280, 213, 'Princes Town', 'PT', 0),
(3281, 213, 'Sangre Grande', 'SG', 0),
(3282, 213, 'San Juan/Laventille', 'SL', 0),
(3283, 213, 'Siparia', 'SI', 0),
(3284, 213, 'Tunapuna/Piarco', 'TP', 0),
(3285, 213, 'Port of Spain', 'PS', 0),
(3286, 213, 'San Fernando', 'SF', 0),
(3287, 213, 'Arima', 'AR', 0),
(3288, 213, 'Point Fortin', 'PF', 0),
(3289, 213, 'Chaguanas', 'CH', 0),
(3290, 213, 'Tobago', 'TO', 0),
(3291, 214, 'Ariana', 'AR', 0),
(3292, 214, 'Beja', 'BJ', 0),
(3293, 214, 'Ben Arous', 'BA', 0),
(3294, 214, 'Bizerte', 'BI', 0),
(3295, 214, 'Gabes', 'GB', 0),
(3296, 214, 'Gafsa', 'GF', 0),
(3297, 214, 'Jendouba', 'JE', 0),
(3298, 214, 'Kairouan', 'KR', 0),
(3299, 214, 'Kasserine', 'KS', 0),
(3300, 214, 'Kebili', 'KB', 0),
(3301, 214, 'Kef', 'KF', 0),
(3302, 214, 'Mahdia', 'MH', 0),
(3303, 214, 'Manouba', 'MN', 0),
(3304, 214, 'Medenine', 'ME', 0),
(3305, 214, 'Monastir', 'MO', 0),
(3306, 214, 'Nabeul', 'NA', 0),
(3307, 214, 'Sfax', 'SF', 0),
(3308, 214, 'Sidi', 'SD', 0),
(3309, 214, 'Siliana', 'SL', 0),
(3310, 214, 'Sousse', 'SO', 0),
(3311, 214, 'Tataouine', 'TA', 0),
(3312, 214, 'Tozeur', 'TO', 0),
(3313, 214, 'Tunis', 'TU', 0),
(3314, 214, 'Zaghouan', 'ZA', 0),
(3315, 215, 'Adana', 'ADA', 0),
(3316, 215, 'Adıyaman', 'ADI', 0),
(3317, 215, 'Afyonkarahisar', 'AFY', 0),
(3318, 215, 'Ağrı', 'AGR', 0),
(3319, 215, 'Aksaray', 'AKS', 0),
(3320, 215, 'Amasya', 'AMA', 0),
(3321, 215, 'Ankara', 'ANK', 0),
(3322, 215, 'Antalya', 'ANT', 0),
(3323, 215, 'Ardahan', 'ARD', 0),
(3324, 215, 'Artvin', 'ART', 0),
(3325, 215, 'Aydın', 'AYI', 0),
(3326, 215, 'Balıkesir', 'BAL', 0),
(3327, 215, 'Bartın', 'BAR', 0),
(3328, 215, 'Batman', 'BAT', 0),
(3329, 215, 'Bayburt', 'BAY', 0),
(3330, 215, 'Bilecik', 'BIL', 0),
(3331, 215, 'Bingöl', 'BIN', 0),
(3332, 215, 'Bitlis', 'BIT', 0),
(3333, 215, 'Bolu', 'BOL', 0),
(3334, 215, 'Burdur', 'BRD', 0),
(3335, 215, 'Bursa', 'BRS', 0),
(3336, 215, 'Çanakkale', 'CKL', 0),
(3337, 215, 'Çankırı', 'CKR', 0),
(3338, 215, 'Çorum', 'COR', 0),
(3339, 215, 'Denizli', 'DEN', 0),
(3340, 215, 'Diyarbakır', 'DIY', 0),
(3341, 215, 'Düzce', 'DUZ', 0),
(3342, 215, 'Edirne', 'EDI', 0),
(3343, 215, 'Elazığ', 'ELA', 0),
(3344, 215, 'Erzincan', 'EZC', 0),
(3345, 215, 'Erzurum', 'EZR', 0),
(3346, 215, 'Eskişehir', 'ESK', 0),
(3347, 215, 'Gaziantep', 'GAZ', 0),
(3348, 215, 'Giresun', 'GIR', 0),
(3349, 215, 'Gümüşhane', 'GMS', 0),
(3350, 215, 'Hakkari', 'HKR', 0),
(3351, 215, 'Hatay', 'HTY', 0),
(3352, 215, 'Iğdır', 'IGD', 0),
(3353, 215, 'Isparta', 'ISP', 0),
(3354, 215, 'İstanbul', 'IST', 0),
(3355, 215, 'İzmir', 'IZM', 0),
(3356, 215, 'Kahramanmaraş', 'KAH', 0),
(3357, 215, 'Karabük', 'KRB', 0),
(3358, 215, 'Karaman', 'KRM', 0),
(3359, 215, 'Kars', 'KRS', 0),
(3360, 215, 'Kastamonu', 'KAS', 0),
(3361, 215, 'Kayseri', 'KAY', 0),
(3362, 215, 'Kilis', 'KLS', 0),
(3363, 215, 'Kırıkkale', 'KRK', 0),
(3364, 215, 'Kırklareli', 'KLR', 0),
(3365, 215, 'Kırşehir', 'KRH', 0),
(3366, 215, 'Kocaeli', 'KOC', 0),
(3367, 215, 'Konya', 'KON', 0),
(3368, 215, 'Kütahya', 'KUT', 0),
(3369, 215, 'Malatya', 'MAL', 0),
(3370, 215, 'Manisa', 'MAN', 0),
(3371, 215, 'Mardin', 'MAR', 0),
(3372, 215, 'Mersin', 'MER', 0),
(3373, 215, 'Muğla', 'MUG', 0),
(3374, 215, 'Muş', 'MUS', 0),
(3375, 215, 'Nevşehir', 'NEV', 0),
(3376, 215, 'Niğde', 'NIG', 0),
(3377, 215, 'Ordu', 'ORD', 0),
(3378, 215, 'Osmaniye', 'OSM', 0),
(3379, 215, 'Rize', 'RIZ', 0),
(3380, 215, 'Sakarya', 'SAK', 0),
(3381, 215, 'Samsun', 'SAM', 0),
(3382, 215, 'Şanlıurfa', 'SAN', 0),
(3383, 215, 'Siirt', 'SII', 0),
(3384, 215, 'Sinop', 'SIN', 0),
(3385, 215, 'Şırnak', 'SIR', 0),
(3386, 215, 'Sivas', 'SIV', 0),
(3387, 215, 'Tekirdağ', 'TEL', 0),
(3388, 215, 'Tokat', 'TOK', 0),
(3389, 215, 'Trabzon', 'TRA', 0),
(3390, 215, 'Tunceli', 'TUN', 0),
(3391, 215, 'Uşak', 'USK', 0),
(3392, 215, 'Van', 'VAN', 0),
(3393, 215, 'Yalova', 'YAL', 0),
(3394, 215, 'Yozgat', 'YOZ', 0),
(3395, 215, 'Zonguldak', 'ZON', 0),
(3396, 216, 'Ahal Welayaty', 'A', 0),
(3397, 216, 'Balkan Welayaty', 'B', 0),
(3398, 216, 'Dashhowuz Welayaty', 'D', 0),
(3399, 216, 'Lebap Welayaty', 'L', 0),
(3400, 216, 'Mary Welayaty', 'M', 0),
(3401, 217, 'Ambergris Cays', 'AC', 0),
(3402, 217, 'Dellis Cay', 'DC', 0),
(3403, 217, 'French Cay', 'FC', 0),
(3404, 217, 'Little Water Cay', 'LW', 0),
(3405, 217, 'Parrot Cay', 'RC', 0),
(3406, 217, 'Pine Cay', 'PN', 0),
(3407, 217, 'Salt Cay', 'SL', 0),
(3408, 217, 'Grand Turk', 'GT', 0),
(3409, 217, 'South Caicos', 'SC', 0),
(3410, 217, 'East Caicos', 'EC', 0),
(3411, 217, 'Middle Caicos', 'MC', 0),
(3412, 217, 'North Caicos', 'NC', 0),
(3413, 217, 'Providenciales', 'PR', 0),
(3414, 217, 'West Caicos', 'WC', 0),
(3415, 218, 'Nanumanga', 'NMG', 0),
(3416, 218, 'Niulakita', 'NLK', 0),
(3417, 218, 'Niutao', 'NTO', 0),
(3418, 218, 'Funafuti', 'FUN', 0),
(3419, 218, 'Nanumea', 'NME', 0),
(3420, 218, 'Nui', 'NUI', 0),
(3421, 218, 'Nukufetau', 'NFT', 0),
(3422, 218, 'Nukulaelae', 'NLL', 0),
(3423, 218, 'Vaitupu', 'VAI', 0),
(3424, 219, 'Kalangala', 'KAL', 0),
(3425, 219, 'Kampala', 'KMP', 0),
(3426, 219, 'Kayunga', 'KAY', 0),
(3427, 219, 'Kiboga', 'KIB', 0),
(3428, 219, 'Luwero', 'LUW', 0),
(3429, 219, 'Masaka', 'MAS', 0),
(3430, 219, 'Mpigi', 'MPI', 0),
(3431, 219, 'Mubende', 'MUB', 0),
(3432, 219, 'Mukono', 'MUK', 0),
(3433, 219, 'Nakasongola', 'NKS', 0),
(3434, 219, 'Rakai', 'RAK', 0),
(3435, 219, 'Sembabule', 'SEM', 0),
(3436, 219, 'Wakiso', 'WAK', 0),
(3437, 219, 'Bugiri', 'BUG', 0),
(3438, 219, 'Busia', 'BUS', 0),
(3439, 219, 'Iganga', 'IGA', 0),
(3440, 219, 'Jinja', 'JIN', 0),
(3441, 219, 'Kaberamaido', 'KAB', 0),
(3442, 219, 'Kamuli', 'KML', 0),
(3443, 219, 'Kapchorwa', 'KPC', 0),
(3444, 219, 'Katakwi', 'KTK', 0),
(3445, 219, 'Kumi', 'KUM', 0),
(3446, 219, 'Mayuge', 'MAY', 0),
(3447, 219, 'Mbale', 'MBA', 0),
(3448, 219, 'Pallisa', 'PAL', 0),
(3449, 219, 'Sironko', 'SIR', 0),
(3450, 219, 'Soroti', 'SOR', 0),
(3451, 219, 'Tororo', 'TOR', 0),
(3452, 219, 'Adjumani', 'ADJ', 0),
(3453, 219, 'Apac', 'APC', 0),
(3454, 219, 'Arua', 'ARU', 0),
(3455, 219, 'Gulu', 'GUL', 0),
(3456, 219, 'Kitgum', 'KIT', 0),
(3457, 219, 'Kotido', 'KOT', 0),
(3458, 219, 'Lira', 'LIR', 0),
(3459, 219, 'Moroto', 'MRT', 0),
(3460, 219, 'Moyo', 'MOY', 0),
(3461, 219, 'Nakapiripirit', 'NAK', 0),
(3462, 219, 'Nebbi', 'NEB', 0),
(3463, 219, 'Pader', 'PAD', 0),
(3464, 219, 'Yumbe', 'YUM', 0),
(3465, 219, 'Bundibugyo', 'BUN', 0),
(3466, 219, 'Bushenyi', 'BSH', 0),
(3467, 219, 'Hoima', 'HOI', 0),
(3468, 219, 'Kabale', 'KBL', 0),
(3469, 219, 'Kabarole', 'KAR', 0),
(3470, 219, 'Kamwenge', 'KAM', 0),
(3471, 219, 'Kanungu', 'KAN', 0),
(3472, 219, 'Kasese', 'KAS', 0),
(3473, 219, 'Kibaale', 'KBA', 0),
(3474, 219, 'Kisoro', 'KIS', 0),
(3475, 219, 'Kyenjojo', 'KYE', 0),
(3476, 219, 'Masindi', 'MSN', 0),
(3477, 219, 'Mbarara', 'MBR', 0),
(3478, 219, 'Ntungamo', 'NTU', 0),
(3479, 219, 'Rukungiri', 'RUK', 0),
(3480, 220, 'Винницкая область', 'VNO', 0),
(3481, 220, 'Волынская область', 'VOO', 0),
(3482, 220, 'Днепропетровская область', 'DPO', 0),
(3483, 220, 'Житомирская область', 'JMO', 0),
(3484, 220, 'Закарпатская область', 'ZKO', 0),
(3485, 220, 'Запорожская область', 'ZRO', 0),
(3486, 220, 'Ивано-Франковская область', 'IFO', 0),
(3487, 220, 'Киевская область', 'KO', 0),
(3488, 220, 'Кировоградская область', 'KGI', 0),
(3489, 220, 'Львовская область', 'LVO', 0),
(3490, 220, 'Николаевская область', 'NVO', 0),
(3491, 220, 'Одесская область', 'ODO', 0),
(3492, 220, 'Полтавская область', 'PTO', 0),
(3493, 220, 'Ровненская область', 'RNO', 0),
(3494, 220, 'Сумская область', 'SUO', 0),
(3495, 220, 'Тернопольская область', 'TPO', 0),
(3496, 220, 'Харьковская область', 'HARO', 0),
(3497, 220, 'Херсонская область', 'HERO', 0),
(3498, 220, 'Хмельницкая область', 'HMO', 0),
(3499, 220, 'Черкасская область', 'CHRO', 0),
(3500, 220, 'Черниговская область', 'CHNO', 0),
(3501, 220, 'Черновицкая область', 'CHVO', 0),
(3502, 220, 'Киев', '23', 0),
(3506, 221, 'Abu Dhabi', 'ADH', 0),
(3507, 221, '''Ajman', 'AJ', 0),
(3508, 221, 'Al Fujayrah', 'FU', 0),
(3509, 221, 'Ash Shariqah', 'SH', 0),
(3510, 221, 'Dubai', 'DU', 0),
(3511, 221, 'R''as al Khaymah', 'RK', 0),
(3512, 221, 'Umm al Qaywayn', 'UQ', 0),
(3513, 222, 'Aberdeen', 'ABN', 0),
(3514, 222, 'Aberdeenshire', 'ABNS', 0),
(3515, 222, 'Anglesey', 'ANG', 0),
(3516, 222, 'Angus', 'AGS', 0),
(3517, 222, 'Argyll and Bute', 'ARY', 0),
(3518, 222, 'Bedfordshire', 'BEDS', 0),
(3519, 222, 'Berkshire', 'BERKS', 0),
(3520, 222, 'Blaenau Gwent', 'BLA', 0),
(3521, 222, 'Bridgend', 'BRI', 0),
(3522, 222, 'Bristol', 'BSTL', 0),
(3523, 222, 'Buckinghamshire', 'BUCKS', 0),
(3524, 222, 'Caerphilly', 'CAE', 0),
(3525, 222, 'Cambridgeshire', 'CAMBS', 0),
(3526, 222, 'Cardiff', 'CDF', 0),
(3527, 222, 'Carmarthenshire', 'CARM', 0),
(3528, 222, 'Ceredigion', 'CDGN', 0),
(3529, 222, 'Cheshire', 'CHES', 0),
(3530, 222, 'Clackmannanshire', 'CLACK', 0),
(3531, 222, 'Conwy', 'CON', 0),
(3532, 222, 'Cornwall', 'CORN', 0),
(3533, 222, 'Denbighshire', 'DNBG', 0),
(3534, 222, 'Derbyshire', 'DERBY', 0),
(3535, 222, 'Devon', 'DVN', 0),
(3536, 222, 'Dorset', 'DOR', 0),
(3537, 222, 'Dumfries and Galloway', 'DGL', 0),
(3538, 222, 'Dundee', 'DUND', 0),
(3539, 222, 'Durham', 'DHM', 0),
(3540, 222, 'East Ayrshire', 'ARYE', 0),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 0),
(3542, 222, 'East Lothian', 'LOTE', 0),
(3543, 222, 'East Renfrewshire', 'RENE', 0),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 0),
(3545, 222, 'East Sussex', 'SXE', 0),
(3546, 222, 'Edinburgh', 'EDIN', 0),
(3547, 222, 'Essex', 'ESX', 0),
(3548, 222, 'Falkirk', 'FALK', 0),
(3549, 222, 'Fife', 'FFE', 0),
(3550, 222, 'Flintshire', 'FLINT', 0),
(3551, 222, 'Glasgow', 'GLAS', 0),
(3552, 222, 'Gloucestershire', 'GLOS', 0),
(3553, 222, 'Greater London', 'LDN', 0),
(3554, 222, 'Greater Manchester', 'MCH', 0),
(3555, 222, 'Gwynedd', 'GDD', 0),
(3556, 222, 'Hampshire', 'HANTS', 0),
(3557, 222, 'Herefordshire', 'HWR', 0),
(3558, 222, 'Hertfordshire', 'HERTS', 0),
(3559, 222, 'Highlands', 'HLD', 0),
(3560, 222, 'Inverclyde', 'IVER', 0),
(3561, 222, 'Isle of Wight', 'IOW', 0),
(3562, 222, 'Kent', 'KNT', 0),
(3563, 222, 'Lancashire', 'LANCS', 0),
(3564, 222, 'Leicestershire', 'LEICS', 0),
(3565, 222, 'Lincolnshire', 'LINCS', 0),
(3566, 222, 'Merseyside', 'MSY', 0),
(3567, 222, 'Merthyr Tydfil', 'MERT', 0),
(3568, 222, 'Midlothian', 'MLOT', 0),
(3569, 222, 'Monmouthshire', 'MMOUTH', 0),
(3570, 222, 'Moray', 'MORAY', 0),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 0),
(3572, 222, 'Newport', 'NEWPT', 0),
(3573, 222, 'Norfolk', 'NOR', 0),
(3574, 222, 'North Ayrshire', 'ARYN', 0),
(3575, 222, 'North Lanarkshire', 'LANN', 0),
(3576, 222, 'North Yorkshire', 'YSN', 0),
(3577, 222, 'Northamptonshire', 'NHM', 0),
(3578, 222, 'Northumberland', 'NLD', 0),
(3579, 222, 'Nottinghamshire', 'NOT', 0),
(3580, 222, 'Orkney Islands', 'ORK', 0),
(3581, 222, 'Oxfordshire', 'OFE', 0),
(3582, 222, 'Pembrokeshire', 'PEM', 0),
(3583, 222, 'Perth and Kinross', 'PERTH', 0),
(3584, 222, 'Powys', 'PWS', 0),
(3585, 222, 'Renfrewshire', 'REN', 0),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 0),
(3587, 222, 'Rutland', 'RUT', 0),
(3588, 222, 'Scottish Borders', 'BOR', 0),
(3589, 222, 'Shetland Islands', 'SHET', 0),
(3590, 222, 'Shropshire', 'SPE', 0),
(3591, 222, 'Somerset', 'SOM', 0),
(3592, 222, 'South Ayrshire', 'ARYS', 0),
(3593, 222, 'South Lanarkshire', 'LANS', 0),
(3594, 222, 'South Yorkshire', 'YSS', 0),
(3595, 222, 'Staffordshire', 'SFD', 0),
(3596, 222, 'Stirling', 'STIR', 0),
(3597, 222, 'Suffolk', 'SFK', 0),
(3598, 222, 'Surrey', 'SRY', 0),
(3599, 222, 'Swansea', 'SWAN', 0),
(3600, 222, 'Torfaen', 'TORF', 0),
(3601, 222, 'Tyne and Wear', 'TWR', 0),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 0),
(3603, 222, 'Warwickshire', 'WARKS', 0),
(3604, 222, 'West Dunbartonshire', 'WDUN', 0),
(3605, 222, 'West Lothian', 'WLOT', 0),
(3606, 222, 'West Midlands', 'WMD', 0),
(3607, 222, 'West Sussex', 'SXW', 0),
(3608, 222, 'West Yorkshire', 'YSW', 0),
(3609, 222, 'Western Isles', 'WIL', 0),
(3610, 222, 'Wiltshire', 'WLT', 0),
(3611, 222, 'Worcestershire', 'WORCS', 0),
(3612, 222, 'Wrexham', 'WRX', 0),
(3613, 223, 'Alabama', 'AL', 0),
(3614, 223, 'Alaska', 'AK', 0),
(3615, 223, 'American Samoa', 'AS', 0),
(3616, 223, 'Arizona', 'AZ', 0),
(3617, 223, 'Arkansas', 'AR', 0),
(3618, 223, 'Armed Forces Africa', 'AF', 0),
(3619, 223, 'Armed Forces Americas', 'AA', 0),
(3620, 223, 'Armed Forces Canada', 'AC', 0),
(3621, 223, 'Armed Forces Europe', 'AE', 0),
(3622, 223, 'Armed Forces Middle East', 'AM', 0),
(3623, 223, 'Armed Forces Pacific', 'AP', 0),
(3624, 223, 'California', 'CA', 0),
(3625, 223, 'Colorado', 'CO', 0),
(3626, 223, 'Connecticut', 'CT', 0),
(3627, 223, 'Delaware', 'DE', 0),
(3628, 223, 'District of Columbia', 'DC', 0),
(3629, 223, 'Federated States Of Micronesia', 'FM', 0),
(3630, 223, 'Florida', 'FL', 0),
(3631, 223, 'Georgia', 'GA', 0),
(3632, 223, 'Guam', 'GU', 0),
(3633, 223, 'Hawaii', 'HI', 0),
(3634, 223, 'Idaho', 'ID', 0),
(3635, 223, 'Illinois', 'IL', 0),
(3636, 223, 'Indiana', 'IN', 0),
(3637, 223, 'Iowa', 'IA', 0),
(3638, 223, 'Kansas', 'KS', 0),
(3639, 223, 'Kentucky', 'KY', 0),
(3640, 223, 'Louisiana', 'LA', 0),
(3641, 223, 'Maine', 'ME', 0),
(3642, 223, 'Marshall Islands', 'MH', 0),
(3643, 223, 'Maryland', 'MD', 0),
(3644, 223, 'Massachusetts', 'MA', 0),
(3645, 223, 'Michigan', 'MI', 0),
(3646, 223, 'Minnesota', 'MN', 0),
(3647, 223, 'Mississippi', 'MS', 0),
(3648, 223, 'Missouri', 'MO', 0),
(3649, 223, 'Montana', 'MT', 0),
(3650, 223, 'Nebraska', 'NE', 0),
(3651, 223, 'Nevada', 'NV', 0),
(3652, 223, 'New Hampshire', 'NH', 0),
(3653, 223, 'New Jersey', 'NJ', 0),
(3654, 223, 'New Mexico', 'NM', 0),
(3655, 223, 'New York', 'NY', 0),
(3656, 223, 'North Carolina', 'NC', 0),
(3657, 223, 'North Dakota', 'ND', 0),
(3658, 223, 'Northern Mariana Islands', 'MP', 0),
(3659, 223, 'Ohio', 'OH', 0),
(3660, 223, 'Oklahoma', 'OK', 0),
(3661, 223, 'Oregon', 'OR', 0),
(3662, 223, 'Palau', 'PW', 0),
(3663, 223, 'Pennsylvania', 'PA', 0),
(3664, 223, 'Puerto Rico', 'PR', 0),
(3665, 223, 'Rhode Island', 'RI', 0),
(3666, 223, 'South Carolina', 'SC', 0),
(3667, 223, 'South Dakota', 'SD', 0),
(3668, 223, 'Tennessee', 'TN', 0),
(3669, 223, 'Texas', 'TX', 0),
(3670, 223, 'Utah', 'UT', 0),
(3671, 223, 'Vermont', 'VT', 0),
(3672, 223, 'Virgin Islands', 'VI', 0),
(3673, 223, 'Virginia', 'VA', 0),
(3674, 223, 'Washington', 'WA', 0),
(3675, 223, 'West Virginia', 'WV', 0),
(3676, 223, 'Wisconsin', 'WI', 0),
(3677, 223, 'Wyoming', 'WY', 0),
(3678, 224, 'Baker Island', 'BI', 0),
(3679, 224, 'Howland Island', 'HI', 0),
(3680, 224, 'Jarvis Island', 'JI', 0),
(3681, 224, 'Johnston Atoll', 'JA', 0),
(3682, 224, 'Kingman Reef', 'KR', 0),
(3683, 224, 'Midway Atoll', 'MA', 0),
(3684, 224, 'Navassa Island', 'NI', 0),
(3685, 224, 'Palmyra Atoll', 'PA', 0),
(3686, 224, 'Wake Island', 'WI', 0),
(3687, 225, 'Artigas', 'AR', 0),
(3688, 225, 'Canelones', 'CA', 0),
(3689, 225, 'Cerro Largo', 'CL', 0),
(3690, 225, 'Colonia', 'CO', 0),
(3691, 225, 'Durazno', 'DU', 0),
(3692, 225, 'Flores', 'FS', 0),
(3693, 225, 'Florida', 'FA', 0),
(3694, 225, 'Lavalleja', 'LA', 0),
(3695, 225, 'Maldonado', 'MA', 0),
(3696, 225, 'Montevideo', 'MO', 0),
(3697, 225, 'Paysandu', 'PA', 0),
(3698, 225, 'Rio Negro', 'RN', 0),
(3699, 225, 'Rivera', 'RV', 0),
(3700, 225, 'Rocha', 'RO', 0),
(3701, 225, 'Salto', 'SL', 0),
(3702, 225, 'San Jose', 'SJ', 0),
(3703, 225, 'Soriano', 'SO', 0),
(3704, 225, 'Tacuarembo', 'TA', 0),
(3705, 225, 'Treinta y Tres', 'TT', 0),
(3706, 226, 'Андижанская область', 'AN', 0),
(3707, 226, 'Бухарская область', 'BU', 0),
(3708, 226, 'Ферганская область', 'FA', 0),
(3709, 226, 'Джизакская область', 'JI', 0),
(3710, 226, 'Наманганская область', 'NG', 0),
(3711, 226, 'Навоийская область', 'NW', 0),
(3712, 226, 'Кашкадарьинская область', 'QA', 0),
(3713, 226, 'Республика Каракалпакстан', 'QR', 0),
(3714, 226, 'Самаркандская область', 'SA', 0),
(3715, 226, 'Сырдарьинская область', 'SI', 0),
(3716, 226, 'Сурхандарьинская область', 'SU', 0),
(3717, 226, 'Ташкент', 'TK', 0),
(3718, 226, 'Ташкентская область', 'TO', 0),
(3719, 226, 'Хорезмская область', 'XO', 0),
(3720, 227, 'Malampa', 'MA', 0),
(3721, 227, 'Penama', 'PE', 0),
(3722, 227, 'Sanma', 'SA', 0),
(3723, 227, 'Shefa', 'SH', 0),
(3724, 227, 'Tafea', 'TA', 0),
(3725, 227, 'Torba', 'TO', 0),
(3726, 229, 'Amazonas', 'AM', 0),
(3727, 229, 'Anzoategui', 'AN', 0),
(3728, 229, 'Apure', 'AP', 0),
(3729, 229, 'Aragua', 'AR', 0),
(3730, 229, 'Barinas', 'BA', 0),
(3731, 229, 'Bolivar', 'BO', 0),
(3732, 229, 'Carabobo', 'CA', 0),
(3733, 229, 'Cojedes', 'CO', 0),
(3734, 229, 'Delta Amacuro', 'DA', 0),
(3735, 229, 'Dependencias Federales', 'DF', 0),
(3736, 229, 'Distrito Federal', 'DI', 0),
(3737, 229, 'Falcon', 'FA', 0),
(3738, 229, 'Guarico', 'GU', 0),
(3739, 229, 'Lara', 'LA', 0),
(3740, 229, 'Merida', 'ME', 0),
(3741, 229, 'Miranda', 'MI', 0),
(3742, 229, 'Monagas', 'MO', 0),
(3743, 229, 'Nueva Esparta', 'NE', 0),
(3744, 229, 'Portuguesa', 'PO', 0),
(3745, 229, 'Sucre', 'SU', 0),
(3746, 229, 'Tachira', 'TA', 0),
(3747, 229, 'Trujillo', 'TR', 0),
(3748, 229, 'Vargas', 'VA', 0),
(3749, 229, 'Yaracuy', 'YA', 0),
(3750, 229, 'Zulia', 'ZU', 0),
(3751, 230, 'An Giang', 'AG', 0),
(3752, 230, 'Bac Giang', 'BG', 0),
(3753, 230, 'Bac Kan', 'BK', 0),
(3754, 230, 'Bac Lieu', 'BL', 0),
(3755, 230, 'Bac Ninh', 'BC', 0),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 0),
(3757, 230, 'Ben Tre', 'BN', 0),
(3758, 230, 'Binh Dinh', 'BH', 0),
(3759, 230, 'Binh Duong', 'BU', 0),
(3760, 230, 'Binh Phuoc', 'BP', 0),
(3761, 230, 'Binh Thuan', 'BT', 0),
(3762, 230, 'Ca Mau', 'CM', 0),
(3763, 230, 'Can Tho', 'CT', 0),
(3764, 230, 'Cao Bang', 'CB', 0),
(3765, 230, 'Dak Lak', 'DL', 0),
(3766, 230, 'Dak Nong', 'DG', 0),
(3767, 230, 'Da Nang', 'DN', 0),
(3768, 230, 'Dien Bien', 'DB', 0),
(3769, 230, 'Dong Nai', 'DI', 0),
(3770, 230, 'Dong Thap', 'DT', 0),
(3771, 230, 'Gia Lai', 'GL', 0),
(3772, 230, 'Ha Giang', 'HG', 0),
(3773, 230, 'Hai Duong', 'HD', 0),
(3774, 230, 'Hai Phong', 'HP', 0),
(3775, 230, 'Ha Nam', 'HM', 0),
(3776, 230, 'Ha Noi', 'HI', 0),
(3777, 230, 'Ha Tay', 'HT', 0),
(3778, 230, 'Ha Tinh', 'HH', 0),
(3779, 230, 'Hoa Binh', 'HB', 0),
(3780, 230, 'Ho Chi Minh City', 'HC', 0),
(3781, 230, 'Hau Giang', 'HU', 0),
(3782, 230, 'Hung Yen', 'HY', 0),
(3783, 232, 'Saint Croix', 'C', 0),
(3784, 232, 'Saint John', 'J', 0),
(3785, 232, 'Saint Thomas', 'T', 0),
(3786, 233, 'Alo', 'A', 0),
(3787, 233, 'Sigave', 'S', 0),
(3788, 233, 'Wallis', 'W', 0),
(3789, 235, 'Abyan', 'AB', 0),
(3790, 235, 'Adan', 'AD', 0),
(3791, 235, 'Amran', 'AM', 0),
(3792, 235, 'Al Bayda', 'BA', 0),
(3793, 235, 'Ad Dali', 'DA', 0),
(3794, 235, 'Dhamar', 'DH', 0),
(3795, 235, 'Hadramawt', 'HD', 0),
(3796, 235, 'Hajjah', 'HJ', 0),
(3797, 235, 'Al Hudaydah', 'HU', 0),
(3798, 235, 'Ibb', 'IB', 0),
(3799, 235, 'Al Jawf', 'JA', 0),
(3800, 235, 'Lahij', 'LA', 0),
(3801, 235, 'Ma''rib', 'MA', 0),
(3802, 235, 'Al Mahrah', 'MR', 0),
(3803, 235, 'Al Mahwit', 'MW', 0),
(3804, 235, 'Sa''dah', 'SD', 0),
(3805, 235, 'San''a', 'SN', 0),
(3806, 235, 'Shabwah', 'SH', 0),
(3807, 235, 'Ta''izz', 'TA', 0),
(3812, 237, 'Bas-Congo', 'BC', 0),
(3813, 237, 'Bandundu', 'BN', 0),
(3814, 237, 'Equateur', 'EQ', 0),
(3815, 237, 'Katanga', 'KA', 0),
(3816, 237, 'Kasai-Oriental', 'KE', 0),
(3817, 237, 'Kinshasa', 'KN', 0),
(3818, 237, 'Kasai-Occidental', 'KW', 0),
(3819, 237, 'Maniema', 'MA', 0),
(3820, 237, 'Nord-Kivu', 'NK', 0),
(3821, 237, 'Orientale', 'OR', 0),
(3822, 237, 'Sud-Kivu', 'SK', 0),
(3823, 238, 'Central', 'CE', 0),
(3824, 238, 'Copperbelt', 'CB', 0),
(3825, 238, 'Eastern', 'EA', 0),
(3826, 238, 'Luapula', 'LP', 0),
(3827, 238, 'Lusaka', 'LK', 0),
(3828, 238, 'Northern', 'NO', 0),
(3829, 238, 'North-Western', 'NW', 0),
(3830, 238, 'Southern', 'SO', 0),
(3831, 238, 'Western', 'WE', 0),
(3832, 239, 'Bulawayo', 'BU', 0),
(3833, 239, 'Harare', 'HA', 0),
(3834, 239, 'Manicaland', 'ML', 0),
(3835, 239, 'Mashonaland Central', 'MC', 0),
(3836, 239, 'Mashonaland East', 'ME', 0),
(3837, 239, 'Mashonaland West', 'MW', 0),
(3838, 239, 'Masvingo', 'MV', 0),
(3839, 239, 'Matabeleland North', 'MN', 0),
(3840, 239, 'Matabeleland South', 'MS', 0),
(3841, 239, 'Midlands', 'MD', 0),
(3861, 105, 'Campobasso', 'CB', 0),
(3863, 105, 'Caserta', 'CE', 0),
(3864, 105, 'Catania', 'CT', 0),
(3865, 105, 'Catanzaro', 'CZ', 0),
(3866, 105, 'Chieti', 'CH', 0),
(3867, 105, 'Como', 'CO', 0),
(3868, 105, 'Cosenza', 'CS', 0),
(3869, 105, 'Cremona', 'CR', 0),
(3870, 105, 'Crotone', 'KR', 0),
(3871, 105, 'Cuneo', 'CN', 0),
(3872, 105, 'Enna', 'EN', 0),
(3873, 105, 'Ferrara', 'FE', 0),
(3874, 105, 'Firenze', 'FI', 0),
(3875, 105, 'Foggia', 'FG', 0),
(3876, 105, 'Forli-Cesena', 'FC', 0),
(3877, 105, 'Frosinone', 'FR', 0),
(3878, 105, 'Genova', 'GE', 0),
(3879, 105, 'Gorizia', 'GO', 0),
(3880, 105, 'Grosseto', 'GR', 0),
(3881, 105, 'Imperia', 'IM', 0),
(3882, 105, 'Isernia', 'IS', 0),
(3883, 105, 'L&#39;Aquila', 'AQ', 0),
(3884, 105, 'La Spezia', 'SP', 0),
(3885, 105, 'Latina', 'LT', 0),
(3886, 105, 'Lecce', 'LE', 0),
(3887, 105, 'Lecco', 'LC', 0),
(3888, 105, 'Livorno', 'LI', 0),
(3889, 105, 'Lodi', 'LO', 0),
(3890, 105, 'Lucca', 'LU', 0),
(3891, 105, 'Macerata', 'MC', 0),
(3892, 105, 'Mantova', 'MN', 0),
(3893, 105, 'Massa-Carrara', 'MS', 0),
(3894, 105, 'Matera', 'MT', 0),
(3896, 105, 'Messina', 'ME', 0),
(3897, 105, 'Milano', 'MI', 0),
(3898, 105, 'Modena', 'MO', 0),
(3899, 105, 'Napoli', 'NA', 0),
(3900, 105, 'Novara', 'NO', 0),
(3901, 105, 'Nuoro', 'NU', 0),
(3904, 105, 'Oristano', 'OR', 0),
(3905, 105, 'Padova', 'PD', 0),
(3906, 105, 'Palermo', 'PA', 0),
(3907, 105, 'Parma', 'PR', 0),
(3908, 105, 'Pavia', 'PV', 0),
(3909, 105, 'Perugia', 'PG', 0),
(3910, 105, 'Pesaro e Urbino', 'PU', 0),
(3911, 105, 'Pescara', 'PE', 0),
(3912, 105, 'Piacenza', 'PC', 0),
(3913, 105, 'Pisa', 'PI', 0),
(3914, 105, 'Pistoia', 'PT', 0),
(3915, 105, 'Pordenone', 'PN', 0),
(3916, 105, 'Potenza', 'PZ', 0),
(3917, 105, 'Prato', 'PO', 0),
(3918, 105, 'Ragusa', 'RG', 0),
(3919, 105, 'Ravenna', 'RA', 0),
(3920, 105, 'Reggio Calabria', 'RC', 0),
(3921, 105, 'Reggio Emilia', 'RE', 0),
(3922, 105, 'Rieti', 'RI', 0),
(3923, 105, 'Rimini', 'RN', 0),
(3924, 105, 'Roma', 'RM', 0),
(3925, 105, 'Rovigo', 'RO', 0),
(3926, 105, 'Salerno', 'SA', 0),
(3927, 105, 'Sassari', 'SS', 0),
(3928, 105, 'Savona', 'SV', 0),
(3929, 105, 'Siena', 'SI', 0),
(3930, 105, 'Siracusa', 'SR', 0),
(3931, 105, 'Sondrio', 'SO', 0),
(3932, 105, 'Taranto', 'TA', 0),
(3933, 105, 'Teramo', 'TE', 0),
(3934, 105, 'Terni', 'TR', 0),
(3935, 105, 'Torino', 'TO', 0),
(3936, 105, 'Trapani', 'TP', 0),
(3937, 105, 'Trento', 'TN', 0),
(3938, 105, 'Treviso', 'TV', 0),
(3939, 105, 'Trieste', 'TS', 0),
(3940, 105, 'Udine', 'UD', 0),
(3941, 105, 'Varese', 'VA', 0),
(3942, 105, 'Venezia', 'VE', 0),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 0),
(3944, 105, 'Vercelli', 'VC', 0),
(3945, 105, 'Verona', 'VR', 0),
(3946, 105, 'Vibo Valentia', 'VV', 0),
(3947, 105, 'Vicenza', 'VI', 0),
(3948, 105, 'Viterbo', 'VT', 0),
(3949, 222, 'County Antrim', 'ANT', 0),
(3950, 222, 'County Armagh', 'ARM', 0),
(3951, 222, 'County Down', 'DOW', 0),
(3952, 222, 'County Fermanagh', 'FER', 0),
(3953, 222, 'County Londonderry', 'LDY', 0),
(3954, 222, 'County Tyrone', 'TYR', 0),
(3955, 222, 'Cumbria', 'CMA', 0),
(3956, 190, 'Pomurska', '1', 0),
(3957, 190, 'Podravska', '2', 0),
(3958, 190, 'Koroška', '3', 0),
(3959, 190, 'Savinjska', '4', 0),
(3960, 190, 'Zasavska', '5', 0),
(3961, 190, 'Spodnjeposavska', '6', 0),
(3962, 190, 'Jugovzhodna Slovenija', '7', 0),
(3963, 190, 'Osrednjeslovenska', '8', 0),
(3964, 190, 'Gorenjska', '9', 0),
(3965, 190, 'Notranjsko-kraška', '10', 0),
(3966, 190, 'Goriška', '11', 0),
(3967, 190, 'Obalno-kraška', '12', 0),
(3968, 33, 'Ruse', '', 0),
(3969, 101, 'Alborz', 'ALB', 0),
(3970, 21, 'Brussels-Capital Region', 'BRU', 0),
(3971, 138, 'Aguascalientes', 'AG', 0),
(3973, 242, 'Andrijevica', '01', 0),
(3974, 242, 'Bar', '02', 0),
(3975, 242, 'Berane', '03', 0),
(3976, 242, 'Bijelo Polje', '04', 0),
(3977, 242, 'Budva', '05', 0),
(3978, 242, 'Cetinje', '06', 0),
(3979, 242, 'Danilovgrad', '07', 0),
(3980, 242, 'Herceg-Novi', '08', 0),
(3981, 242, 'Kolašin', '09', 0),
(3982, 242, 'Kotor', '10', 0),
(3983, 242, 'Mojkovac', '11', 0),
(3984, 242, 'Nikšić', '12', 0),
(3985, 242, 'Plav', '13', 0),
(3986, 242, 'Pljevlja', '14', 0),
(3987, 242, 'Plužine', '15', 0),
(3988, 242, 'Podgorica', '16', 0),
(3989, 242, 'Rožaje', '17', 0),
(3990, 242, 'Šavnik', '18', 0),
(3991, 242, 'Tivat', '19', 0),
(3992, 242, 'Ulcinj', '20', 0),
(3993, 242, 'Žabljak', '21', 0),
(3994, 243, 'Belgrade', '00', 0),
(3995, 243, 'North Bačka', '01', 0),
(3996, 243, 'Central Banat', '02', 0),
(3997, 243, 'North Banat', '03', 0),
(3998, 243, 'South Banat', '04', 0),
(3999, 243, 'West Bačka', '05', 0),
(4000, 243, 'South Bačka', '06', 0),
(4001, 243, 'Srem', '07', 0),
(4002, 243, 'Mačva', '08', 0),
(4003, 243, 'Kolubara', '09', 0),
(4004, 243, 'Podunavlje', '10', 0),
(4005, 243, 'Braničevo', '11', 0),
(4006, 243, 'Šumadija', '12', 0),
(4007, 243, 'Pomoravlje', '13', 0),
(4008, 243, 'Bor', '14', 0),
(4009, 243, 'Zaječar', '15', 0),
(4010, 243, 'Zlatibor', '16', 0),
(4011, 243, 'Moravica', '17', 0),
(4012, 243, 'Raška', '18', 0),
(4013, 243, 'Rasina', '19', 0),
(4014, 243, 'Nišava', '20', 0),
(4015, 243, 'Toplica', '21', 0),
(4016, 243, 'Pirot', '22', 0),
(4017, 243, 'Jablanica', '23', 0),
(4018, 243, 'Pčinja', '24', 0),
(4020, 245, 'Bonaire', 'BO', 0),
(4021, 245, 'Saba', 'SA', 0),
(4022, 245, 'Sint Eustatius', 'SE', 0),
(4023, 248, 'Central Equatoria', 'EC', 0),
(4024, 248, 'Eastern Equatoria', 'EE', 0),
(4025, 248, 'Jonglei', 'JG', 0),
(4026, 248, 'Lakes', 'LK', 0),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 0),
(4028, 248, 'Unity', 'UY', 0),
(4029, 248, 'Upper Nile', 'NU', 0),
(4030, 248, 'Warrap', 'WR', 0),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 0),
(4032, 248, 'Western Equatoria', 'EW', 0),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 0),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 0),
(4038, 117, 'Aizkraukles novads', '0320200', 0),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 0),
(4040, 117, 'Aizputes novads', '0640600', 0),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 0),
(4042, 117, 'Aknīstes novads', '0560800', 0),
(4043, 117, 'Aloja, Alojas novads', '0661007', 0),
(4044, 117, 'Alojas novads', '0661000', 0),
(4045, 117, 'Alsungas novads', '0624200', 0),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 0),
(4047, 117, 'Alūksnes novads', '0360200', 0),
(4048, 117, 'Amatas novads', '0424701', 0),
(4049, 117, 'Ape, Apes novads', '0360805', 0),
(4050, 117, 'Apes novads', '0360800', 0),
(4051, 117, 'Auce, Auces novads', '0460805', 0),
(4052, 117, 'Auces novads', '0460800', 0),
(4053, 117, 'Ādažu novads', '0804400', 0),
(4054, 117, 'Babītes novads', '0804900', 0),
(4055, 117, 'Baldone, Baldones novads', '0800605', 0),
(4056, 117, 'Baldones novads', '0800600', 0),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 0),
(4058, 117, 'Baltinavas novads', '0384400', 0),
(4059, 117, 'Balvi, Balvu novads', '0380201', 0),
(4060, 117, 'Balvu novads', '0380200', 0),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 0),
(4062, 117, 'Bauskas novads', '0400200', 0),
(4063, 117, 'Beverīnas novads', '0964700', 0),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 0),
(4065, 117, 'Brocēnu novads', '0840601', 0),
(4066, 117, 'Burtnieku novads', '0967101', 0),
(4067, 117, 'Carnikavas novads', '0805200', 0),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 0),
(4069, 117, 'Cesvaines novads', '0700800', 0),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 0),
(4071, 117, 'Cēsu novads', '0420200', 0),
(4072, 117, 'Ciblas novads', '0684901', 0),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 0),
(4074, 117, 'Dagdas novads', '0601000', 0),
(4075, 117, 'Daugavpils', '0050000', 0),
(4076, 117, 'Daugavpils novads', '0440200', 0),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 0),
(4078, 117, 'Dobeles novads', '0460200', 0),
(4079, 117, 'Dundagas novads', '0885100', 0),
(4080, 117, 'Durbe, Durbes novads', '0640807', 0),
(4081, 117, 'Durbes novads', '0640801', 0),
(4082, 117, 'Engures novads', '0905100', 0),
(4083, 117, 'Ērgļu novads', '0705500', 0),
(4084, 117, 'Garkalnes novads', '0806000', 0),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 0),
(4086, 117, 'Grobiņas novads', '0641000', 0),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 0),
(4088, 117, 'Gulbenes novads', '0500200', 0),
(4089, 117, 'Iecavas novads', '0406400', 0),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 0),
(4091, 117, 'Ikšķiles novads', '0740600', 0),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 0),
(4093, 117, 'Ilūkstes novads', '0440801', 0),
(4094, 117, 'Inčukalna novads', '0801800', 0),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 0),
(4096, 117, 'Jaunjelgavas novads', '0321000', 0),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 0),
(4098, 117, 'Jaunpils novads', '0905700', 0),
(4099, 117, 'Jelgava', '0090000', 0),
(4100, 117, 'Jelgavas novads', '0540200', 0),
(4101, 117, 'Jēkabpils', '0110000', 0),
(4102, 117, 'Jēkabpils novads', '0560200', 0),
(4103, 117, 'Jūrmala', '0130000', 0),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 0),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 0),
(4106, 117, 'Kandavas novads', '0901201', 0),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 0),
(4108, 117, 'Kārsavas novads', '0681000', 0),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 0),
(4110, 117, 'Kokneses novads', '0326100', 0),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 0),
(4112, 117, 'Krāslavas novads', '0600202', 0),
(4113, 117, 'Krimuldas novads', '0806900', 0),
(4114, 117, 'Krustpils novads', '0566900', 0),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 0),
(4116, 117, 'Kuldīgas novads', '0620200', 0),
(4117, 117, 'Ķeguma novads', '0741001', 0),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 0),
(4119, 117, 'Ķekavas novads', '0800800', 0),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 0),
(4121, 117, 'Lielvārdes novads', '0741401', 0),
(4122, 117, 'Liepāja', '0170000', 0),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 0),
(4124, 117, 'Limbažu novads', '0660200', 0),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 0),
(4126, 117, 'Līgatnes novads', '0421200', 0),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 0),
(4128, 117, 'Līvānu novads', '0761201', 0),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 0),
(4130, 117, 'Lubānas novads', '0701400', 0),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 0),
(4132, 117, 'Ludzas novads', '0680200', 0),
(4133, 117, 'Madona, Madonas novads', '0700201', 0),
(4134, 117, 'Madonas novads', '0700200', 0),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 0),
(4136, 117, 'Mazsalacas novads', '0961000', 0),
(4137, 117, 'Mālpils novads', '0807400', 0),
(4138, 117, 'Mārupes novads', '0807600', 0),
(4139, 117, 'Mērsraga novads', '0887600', 0),
(4140, 117, 'Naukšēnu novads', '0967300', 0),
(4141, 117, 'Neretas novads', '0327100', 0),
(4142, 117, 'Nīcas novads', '0647900', 0),
(4143, 117, 'Ogre, Ogres novads', '0740201', 0),
(4144, 117, 'Ogres novads', '0740202', 0),
(4145, 117, 'Olaine, Olaines novads', '0801009', 0),
(4146, 117, 'Olaines novads', '0801000', 0),
(4147, 117, 'Ozolnieku novads', '0546701', 0),
(4148, 117, 'Pārgaujas novads', '0427500', 0),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 0),
(4150, 117, 'Pāvilostas novads', '0641401', 0),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 0),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 0),
(4153, 117, 'Pļaviņu novads', '0321400', 0),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 0),
(4155, 117, 'Preiļu novads', '0760202', 0),
(4156, 117, 'Priekule, Priekules novads', '0641615', 0),
(4157, 117, 'Priekules novads', '0641600', 0),
(4158, 117, 'Priekuļu novads', '0427300', 0),
(4159, 117, 'Raunas novads', '0427700', 0),
(4160, 117, 'Rēzekne', '0210000', 0),
(4161, 117, 'Rēzeknes novads', '0780200', 0),
(4162, 117, 'Riebiņu novads', '0766300', 0),
(4163, 117, 'Rīga', '0010000', 0),
(4164, 117, 'Rojas novads', '0888300', 0),
(4165, 117, 'Ropažu novads', '0808400', 0),
(4166, 117, 'Rucavas novads', '0648500', 0),
(4167, 117, 'Rugāju novads', '0387500', 0),
(4168, 117, 'Rundāles novads', '0407700', 0),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 0),
(4170, 117, 'Rūjienas novads', '0961600', 0),
(4171, 117, 'Sabile, Talsu novads', '0880213', 0),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 0),
(4173, 117, 'Salacgrīvas novads', '0661400', 0),
(4174, 117, 'Salas novads', '0568700', 0),
(4175, 117, 'Salaspils novads', '0801200', 0),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 0),
(4177, 117, 'Saldus novads', '0840200', 0),
(4178, 117, 'Saldus, Saldus novads', '0840201', 0),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 0),
(4180, 117, 'Saulkrastu novads', '0801400', 0),
(4181, 117, 'Seda, Strenču novads', '0941813', 0),
(4182, 117, 'Sējas novads', '0809200', 0),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 0),
(4184, 117, 'Siguldas novads', '0801601', 0),
(4185, 117, 'Skrīveru novads', '0328200', 0),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 0),
(4187, 117, 'Skrundas novads', '0621200', 0),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 0),
(4189, 117, 'Smiltenes novads', '0941600', 0),
(4190, 117, 'Staicele, Alojas novads', '0661017', 0),
(4191, 117, 'Stende, Talsu novads', '0880215', 0),
(4192, 117, 'Stopiņu novads', '0809600', 0),
(4193, 117, 'Strenči, Strenču novads', '0941817', 0),
(4194, 117, 'Strenču novads', '0941800', 0),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 0),
(4196, 117, 'Talsi, Talsu novads', '0880201', 0),
(4197, 117, 'Talsu novads', '0880200', 0),
(4198, 117, 'Tērvetes novads', '0468900', 0),
(4199, 117, 'Tukuma novads', '0900200', 0),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 0),
(4201, 117, 'Vaiņodes novads', '0649300', 0),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 0),
(4203, 117, 'Valka, Valkas novads', '0940201', 0),
(4204, 117, 'Valkas novads', '0940200', 0),
(4205, 117, 'Valmiera', '0250000', 0),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 0),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 0),
(4208, 117, 'Varakļānu novads', '0701800', 0),
(4209, 117, 'Vārkavas novads', '0769101', 0),
(4210, 117, 'Vecpiebalgas novads', '0429300', 0),
(4211, 117, 'Vecumnieku novads', '0409500', 0),
(4212, 117, 'Ventspils', '0270000', 0),
(4213, 117, 'Ventspils novads', '0980200', 0),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 0),
(4215, 117, 'Viesītes novads', '0561800', 0),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 0),
(4217, 117, 'Viļakas novads', '0381600', 0),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 0),
(4219, 117, 'Viļānu novads', '0781800', 0),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 0),
(4221, 117, 'Zilupes novads', '0681801', 0),
(4222, 43, 'Arica y Parinacota', 'AP', 0),
(4223, 43, 'Los Rios', 'LR', 0),
(4224, 220, 'Харьковская область', '63', 0),
(4225, 118, 'Beirut', 'LB-BR', 0),
(4226, 118, 'Bekaa', 'LB-BE', 0),
(4227, 118, 'Mount Lebanon', 'LB-ML', 0),
(4228, 118, 'Nabatieh', 'LB-NB', 0),
(4229, 118, 'North', 'LB-NR', 0),
(4230, 118, 'South', 'LB-ST', 0),
(4231, 99, 'Telangana', 'TS', 0),
(4232, 44, 'Qinghai', 'QH', 0),
(4233, 100, 'Papua Barat', 'PB', 0),
(4234, 100, 'Sulawesi Barat', 'SR', 0),
(4235, 100, 'Kepulauan Riau', 'KR', 0),
(4236, 105, 'Barletta-Andria-Trani', 'BT', 0),
(4237, 105, 'Fermo', 'FM', 0),
(4238, 105, 'Monza Brianza', 'MB', 0);

-----------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

-- en
INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ru
INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(110, 176, 0, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
