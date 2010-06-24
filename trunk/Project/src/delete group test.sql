-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 24, 2010 at 11:07 
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `appsmonitor`
--

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `device_type_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `longitude` float NOT NULL DEFAULT '0',
  `latitude` float NOT NULL DEFAULT '0',
  `cacti_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`device_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`device_id`, `group_id`, `device_type_id`, `name`, `description`, `longitude`, `latitude`, `cacti_id`) VALUES
(34, 5, 0, 'dA', '', 0, 0, 0),
(35, 5, 0, 'dB', '', 0, 0, 0),
(36, 6, 0, 'dC', '', 0, 0, 0),
(37, 6, 0, 'dD', '', 0, 0, 0),
(38, 10, 0, 'dE', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `device_type`
--

CREATE TABLE IF NOT EXISTS `device_type` (
  `device_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY (`device_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `device_type`
--


-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `longitude` float NOT NULL DEFAULT '0',
  `latitude` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`group_id`, `parent_id`, `name`, `description`, `longitude`, `latitude`) VALUES
(10, 9, 'F', '', 0, 0),
(9, 7, 'E', '', 0, 0),
(5, 0, 'A', '', 0, 0),
(6, 5, 'B', '', 0, 0),
(7, 5, 'C', '', 0, 0),
(8, 5, 'D', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `fullname`, `email`, `password`) VALUES
(1, 'jiwandono', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
