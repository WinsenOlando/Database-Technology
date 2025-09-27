-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 04:44 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbk10`
--

-- --------------------------------------------------------

--
-- Table structure for table `mscontact`
--

CREATE TABLE `mscontact` (
  `SupplierID` varchar(10) NOT NULL,
  `Contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mscontact`
--

INSERT INTO `mscontact` (`SupplierID`, `Contact`) VALUES
('SU001', '081234567890'),
('SU001', '081246355610'),
('SU002', '081234567891'),
('SU003', '081234567892'),
('SU004', '081234567893'),
('SU004', '081246355613'),
('SU005', '081234567894');

-- --------------------------------------------------------

--
-- Table structure for table `msfuel`
--

CREATE TABLE `msfuel` (
  `FuelID` varchar(10) NOT NULL,
  `FuelName` varchar(50) DEFAULT NULL,
  `Octane` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msfuel`
--

INSERT INTO `msfuel` (`FuelID`, `FuelName`, `Octane`) VALUES
('FL001', 'Premium', 88),
('FL002', 'Pertalite', 90),
('FL003', 'Pertamax', 92),
('FL004', 'Pertamax Turbo', 98),
('FL005', 'Pertamax Racing', 100);

-- --------------------------------------------------------

--
-- Table structure for table `msgasstation`
--

CREATE TABLE `msgasstation` (
  `GasStationID` varchar(10) NOT NULL,
  `GasStationName` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msgasstation`
--

INSERT INTO `msgasstation` (`GasStationID`, `GasStationName`, `Location`) VALUES
('GS001', 'Pertamina_Sunter', 'Sunter'),
('GS002', 'Pertamina_Kebon_Jeruk', 'Kebon Jeruk'),
('GS003', 'Pertamina_Senayan', 'Senayan'),
('GS004', 'Pertamina_Palmerah', 'Palmerah'),
('GS005', 'Pertamina_Tanjung_Duren', 'Tanjung Duren');

-- --------------------------------------------------------

--
-- Table structure for table `msoctane`
--

CREATE TABLE `msoctane` (
  `Octane` int(11) NOT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msoctane`
--

INSERT INTO `msoctane` (`Octane`, `Price`) VALUES
(88, 10000),
(90, 12000),
(92, 13000),
(98, 15000),
(100, 17000);

-- --------------------------------------------------------

--
-- Table structure for table `mssupplier`
--

CREATE TABLE `mssupplier` (
  `SupplierID` varchar(10) NOT NULL,
  `SupplierName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mssupplier`
--

INSERT INTO `mssupplier` (`SupplierID`, `SupplierName`, `Address`) VALUES
('SU001', 'Persada Petroasiatama', 'Jalan Merpati No. 15'),
('SU002', 'PT OPEC', 'Jalan Anggrek No. 32A'),
('SU003', 'Bumi Jaya Abadi', 'Jalan Flamboyan No. 30'),
('SU004', 'Sinar Senter', 'Jalan Mangga No. 7'),
('SU005', 'Cahaya Bensin', 'Jalan Jeruk No. 19');

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `SupplyID` varchar(10) NOT NULL,
  `GasStationID` varchar(10) DEFAULT NULL,
  `SupplierID` varchar(10) DEFAULT NULL,
  `FuelID` varchar(10) DEFAULT NULL,
  `SupplyDate` date DEFAULT NULL,
  `VolumeSupplied` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`SupplyID`, `GasStationID`, `SupplierID`, `FuelID`, `SupplyDate`, `VolumeSupplied`) VALUES
('SP001', 'GS003', 'SU002', 'FL004', '2024-11-01', 11000),
('SP002', 'GS005', 'SU004', 'FL002', '2024-12-01', 11000),
('SP003', 'GS002', 'SU003', 'FL002', '2024-12-01', 11000),
('SP004', 'GS001', 'SU001', 'FL001', '2024-01-02', 11000),
('SP005', 'GS002', 'SU001', 'FL005', '2024-02-02', 11000),
('SP006', 'GS003', 'SU001', 'FL004', '2024-12-02', 11000),
('SP007', 'GS005', 'SU004', 'FL001', '2024-12-03', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `trsales`
--

CREATE TABLE `trsales` (
  `SalesID` varchar(10) NOT NULL,
  `GasStationID` varchar(10) DEFAULT NULL,
  `FuelID` varchar(10) DEFAULT NULL,
  `TransactionDate` date DEFAULT NULL,
  `VolumeSold` float DEFAULT NULL,
  `TotalIncome` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trsales`
--

INSERT INTO `trsales` (`SalesID`, `GasStationID`, `FuelID`, `TransactionDate`, `VolumeSold`, `TotalIncome`) VALUES
('SA001', 'GS001', 'FL002', '2024-11-11', 13.5, 162000),
('SA002', 'GS003', 'FL002', '2024-12-11', 5, 60000),
('SA003', 'GS004', 'FL002', '2024-12-11', 3, 36000),
('SA004', 'GS001', 'FL001', '2024-01-12', 3, 30000),
('SA005', 'GS002', 'FL003', '2024-02-12', 4, 52000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mscontact`
--
ALTER TABLE `mscontact`
  ADD PRIMARY KEY (`SupplierID`,`Contact`);

--
-- Indexes for table `msfuel`
--
ALTER TABLE `msfuel`
  ADD PRIMARY KEY (`FuelID`),
  ADD KEY `Octane` (`Octane`);

--
-- Indexes for table `msgasstation`
--
ALTER TABLE `msgasstation`
  ADD PRIMARY KEY (`GasStationID`);

--
-- Indexes for table `msoctane`
--
ALTER TABLE `msoctane`
  ADD PRIMARY KEY (`Octane`);

--
-- Indexes for table `mssupplier`
--
ALTER TABLE `mssupplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`SupplyID`),
  ADD KEY `GasStationID` (`GasStationID`),
  ADD KEY `SupplierID` (`SupplierID`),
  ADD KEY `FuelID` (`FuelID`);

--
-- Indexes for table `trsales`
--
ALTER TABLE `trsales`
  ADD PRIMARY KEY (`SalesID`),
  ADD KEY `GasStationID` (`GasStationID`),
  ADD KEY `FuelID` (`FuelID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mscontact`
--
ALTER TABLE `mscontact`
  ADD CONSTRAINT `mscontact_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `mssupplier` (`SupplierID`);

--
-- Constraints for table `msfuel`
--
ALTER TABLE `msfuel`
  ADD CONSTRAINT `msfuel_ibfk_1` FOREIGN KEY (`Octane`) REFERENCES `msoctane` (`Octane`);

--
-- Constraints for table `supplies`
--
ALTER TABLE `supplies`
  ADD CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`GasStationID`) REFERENCES `msgasstation` (`GasStationID`),
  ADD CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `mssupplier` (`SupplierID`),
  ADD CONSTRAINT `supplies_ibfk_3` FOREIGN KEY (`FuelID`) REFERENCES `msfuel` (`FuelID`);

--
-- Constraints for table `trsales`
--
ALTER TABLE `trsales`
  ADD CONSTRAINT `trsales_ibfk_1` FOREIGN KEY (`GasStationID`) REFERENCES `msgasstation` (`GasStationID`),
  ADD CONSTRAINT `trsales_ibfk_2` FOREIGN KEY (`FuelID`) REFERENCES `msfuel` (`FuelID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
