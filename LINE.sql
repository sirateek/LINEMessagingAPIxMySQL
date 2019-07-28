-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2019 at 12:40 AM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LINE`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `UserID` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CustomerID` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Surname` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`UserID`, `CustomerID`, `Name`, `Surname`) VALUES
('U1efbc797c7174dd636c047f5ca8eba42', '123ABCD', 'กวนซ้น', 'แซ่เตียน');

-- --------------------------------------------------------

--
-- Table structure for table `LOG`
--

CREATE TABLE `LOG` (
  `UserID` text COLLATE utf8_unicode_ci NOT NULL,
  `Text` text COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `LOG`
--

INSERT INTO `LOG` (`UserID`, `Text`, `Timestamp`) VALUES
('U1efbc797c7174dd636c047f5ca8eba42', 'สวัสดีครับ', '1564327729309'),
('U1efbc797c7174dd636c047f5ca8eba42', 'ทพสอบ', '1564327735236'),
('U1efbc797c7174dd636c047f5ca8eba42', 'Hello 1234', '1564327738324'),
('U1efbc797c7174dd636c047f5ca8eba42', 'สวัสดีครับ', '1564327924023'),
('U1efbc797c7174dd636c047f5ca8eba42', 'Yo', '1564328241209');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`UserID`(5));

--
-- Indexes for table `LOG`
--
ALTER TABLE `LOG`
  ADD PRIMARY KEY (`Timestamp`(15));
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
