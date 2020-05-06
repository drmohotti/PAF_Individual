-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 10:47 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor_visiting`
--

CREATE TABLE `doctor_visiting` (
  `visiting_id` int(100) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `hospital_city` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `noPatients` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_visiting`
--

INSERT INTO `doctor_visiting` (`visiting_id`, `hospital_name`, `hospital_city`, `date`, `time`, `noPatients`) VALUES
(12, 'HEMAS', 'Colombo', '2019-05-19', '12.00 - 3.00 PM', 222),
(14, 'Asiri', 'Colombo 3', 'April 09, 2020', '9.00 - 12.00 AM', 10),
(20, 'Generala', 'updated Jaffna', '12th JAN 2020', '4PM', 200),
(22, 'Cooperative Hospital', 'Matara', '2019-10-15', '3.00 - 6.00 PM', 10),
(24, 'Ruhuna Hospital', 'Tangalle', '2019-05-19', '9.00 - 12.00 AM', 100),
(26, 'City Hospital', 'Jaffna', '13th JAN 2020', '9.00 - 12.00 AM', 11),
(48, 'General Hospital', 'city updated', 'April 09, 2020', '12.00 - 3.00 PM', 15),
(72, 'General Hospital', 'Galle 2', 'April 09, 2020', '12.00 - 3.00 PM', 10),
(110, 'City Hospital', 'Jaffna', '13th JAN 2020', '6.00 - 9.00 AM', 10),
(111, 'City Hospital', 'Jaffna', '13th JAN 2020', '6.00 - 9.00 AM', 10),
(115, 'General Matara', 'updated Matara', '12th JAN 2020', '3.00 - 6.00 PM', 12),
(126, 'Private Hospital', 'Galle', '2019-05-19', '12.00 - 3.00 PM', 10),
(128, 'Asiri Hospital new', ' kandy new', '13th JAN 2020', '3.00 - 6.00 PM', 36);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor_visiting`
--
ALTER TABLE `doctor_visiting`
  ADD PRIMARY KEY (`visiting_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor_visiting`
--
ALTER TABLE `doctor_visiting`
  MODIFY `visiting_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
