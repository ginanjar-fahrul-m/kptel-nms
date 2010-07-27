-- phpMyAdmin SQL Dump
-- version 2.11.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 27, 2010 at 11:47 AM
-- Server version: 5.0.77
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `appmonitor`
--

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `device_id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL default '0',
  `device_type_id` int(11) NOT NULL default '0',
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `longitude` float NOT NULL default '0',
  `latitude` float NOT NULL default '0',
  `cacti_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`device_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `device`
--


-- --------------------------------------------------------

--
-- Table structure for table `device_type`
--

CREATE TABLE IF NOT EXISTS `device_type` (
  `device_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  PRIMARY KEY  (`device_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `device_type`
--


-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `group_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `longitude` float NOT NULL default '0',
  `latitude` float NOT NULL default '0',
  PRIMARY KEY  (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `group`
--


-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE IF NOT EXISTS `sms` (
  `sms_id` int(11) NOT NULL auto_increment,
  `host_id` int(11) NOT NULL,
  `event_date` datetime NOT NULL,
  `event_type` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent` enum('Y','N') NOT NULL default 'N',
  PRIMARY KEY  (`sms_id`),
  UNIQUE KEY `host_id` (`host_id`,`event_date`,`event_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sms`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(32) NOT NULL,
  `fullname` varchar(256) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `fullname`, `email`, `password`) VALUES
(3, 'masemon', 'Mas Emon', 'jiwandono@arc.itb.ac.id', 'b8cc4edba5145d41f9da01d85f459aef');
