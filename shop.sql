-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 15, 2017 at 03:58 PM
-- Server version: 5.5.48
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `ngt_orders`
--

CREATE TABLE IF NOT EXISTS `ngt_orders` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `goods` longtext NOT NULL,
  `data` int(11) unsigned NOT NULL,
  `compleeted` int(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ngt_orders`
--

INSERT INTO `ngt_orders` (`id`, `name`, `lastname`, `goods`, `data`, `compleeted`) VALUES
(4, 'Artik', 'JO', '{"1":2,"5":1}', 1492256541, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ngt_prices`
--

CREATE TABLE IF NOT EXISTS `ngt_prices` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float unsigned NOT NULL,
  `small_img` varchar(255) NOT NULL,
  `big_img` varchar(255) NOT NULL,
  `main_text` text NOT NULL,
  `left_text` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ngt_prices`
--

INSERT INTO `ngt_prices` (`id`, `title`, `price`, `small_img`, `big_img`, `main_text`, `left_text`) VALUES
(1, 'Title 1', 27, 'badge.png', 'price.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer molestie magna ut vehicula hendrerit. Integer leo magna, mattis eget condimentum et, cursus non dolor. Curabitur vulputate volutpat nunc quis vehicula. Sed mauris lectus, vulputate non facilisis vitae, ultrices ut nulla. Quisque eu ultricies purus, ac laoreet sem. Suspendisse laoreet magna leo, in molestie sapien fermentum eget. Suspendisse quis mauris rhoncus, cursus orci sed, volutpat tortor.</p>', '<ul>\r\n												<li>Proin eget nisi sagittis, fringilla magna vitae, fermentum nisi.</li>\r\n												<li>Morbi a enim sed nibh bibendum dignissim.</li>\r\n												<li>Nunc ultricies ex at lacus tristique, vel imperdiet neque fringilla.</li>\r\n												<li>Praesent id est placerat, consequat turpis non, viverra augue.</li>\r\n												<li>Proin quis ligula sit amet ante commodo vehicula.</li>\r\n											</ul>\r\n'),
(2, 'Title 2', 25, 'badge.png', 'price.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer molestie magna ut vehicula hendrerit. Integer leo magna, mattis eget condimentum et, cursus non dolor. Curabitur vulputate volutpat nunc quis vehicula. Sed mauris lectus, vulputate non facilisis vitae, ultrices ut nulla. Quisque eu ultricies purus, ac laoreet sem. Suspendisse laoreet magna leo, in molestie sapien fermentum eget. Suspendisse quis mauris rhoncus, cursus orci sed, volutpat tortor.</p>', '<ul>\r\n												<li>Proin eget nisi sagittis, fringilla magna vitae, fermentum nisi.</li>\r\n												<li>Morbi a enim sed nibh bibendum dignissim.</li>\r\n												<li>Nunc ultricies ex at lacus tristique, vel imperdiet neque fringilla.</li>\r\n												<li>Praesent id est placerat, consequat turpis non, viverra augue.</li>\r\n												<li>Proin quis ligula sit amet ante commodo vehicula.</li>\r\n											</ul>\r\n'),
(3, 'Title 3', 25, 'badge.png', 'price.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer molestie magna ut vehicula hendrerit. Integer leo magna, mattis eget condimentum et, cursus non dolor. Curabitur vulputate volutpat nunc quis vehicula. Sed mauris lectus, vulputate non facilisis vitae, ultrices ut nulla. Quisque eu ultricies purus, ac laoreet sem. Suspendisse laoreet magna leo, in molestie sapien fermentum eget. Suspendisse quis mauris rhoncus, cursus orci sed, volutpat tortor.</p>', '<ul>\r\n												<li>Proin eget nisi sagittis, fringilla magna vitae, fermentum nisi.</li>\r\n												<li>Morbi a enim sed nibh bibendum dignissim.</li>\r\n												<li>Nunc ultricies ex at lacus tristique, vel imperdiet neque fringilla.</li>\r\n												<li>Praesent id est placerat, consequat turpis non, viverra augue.</li>\r\n												<li>Proin quis ligula sit amet ante commodo vehicula.</li>\r\n											</ul>\r\n'),
(4, 'Title 4', 25, 'badge.png', 'price.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer molestie magna ut vehicula hendrerit. Integer leo magna, mattis eget condimentum et, cursus non dolor. Curabitur vulputate volutpat nunc quis vehicula. Sed mauris lectus, vulputate non facilisis vitae, ultrices ut nulla. Quisque eu ultricies purus, ac laoreet sem. Suspendisse laoreet magna leo, in molestie sapien fermentum eget. Suspendisse quis mauris rhoncus, cursus orci sed, volutpat tortor.</p>', '<ul>\r\n												<li>Proin eget nisi sagittis, fringilla magna vitae, fermentum nisi.</li>\r\n												<li>Morbi a enim sed nibh bibendum dignissim.</li>\r\n												<li>Nunc ultricies ex at lacus tristique, vel imperdiet neque fringilla.</li>\r\n												<li>Praesent id est placerat, consequat turpis non, viverra augue.</li>\r\n												<li>Proin quis ligula sit amet ante commodo vehicula.</li>\r\n											</ul>\r\n'),
(5, 'Title 5', 25, 'badge.png', 'price.jpg', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer molestie magna ut vehicula hendrerit. Integer leo magna, mattis eget condimentum et, cursus non dolor. Curabitur vulputate volutpat nunc quis vehicula. Sed mauris lectus, vulputate non facilisis vitae, ultrices ut nulla. Quisque eu ultricies purus, ac laoreet sem. Suspendisse laoreet magna leo, in molestie sapien fermentum eget. Suspendisse quis mauris rhoncus, cursus orci sed, volutpat tortor.</p>', '<ul>\n												<li>Proin eget nisi sagittis, fringilla magna vitae, fermentum nisi.</li>\n												<li>Morbi a enim sed nibh bibendum dignissim.</li>\n												<li>Nunc ultricies ex at lacus tristique, vel imperdiet neque fringilla.</li>\n												<li>Praesent id est placerat, consequat turpis non, viverra augue.</li>\n												<li>Proin quis ligula sit amet ante commodo vehicula.</li>\n											</ul>\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ngt_orders`
--
ALTER TABLE `ngt_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ngt_prices`
--
ALTER TABLE `ngt_prices`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ngt_orders`
--
ALTER TABLE `ngt_orders`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ngt_prices`
--
ALTER TABLE `ngt_prices`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
