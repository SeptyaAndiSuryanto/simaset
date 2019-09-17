-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2019 at 04:16 PM
-- Server version: 5.7.27-0ubuntu0.16.04.1
-- PHP Version: 5.6.40-8+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_simaset`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('4lf3ouj019ojke74i1lm566kpjvd76dj', '127.0.0.1', 1568707310, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383730373037333b6e696b7c733a31303a2230303030303030303031223b757365726e616d617c733a31303a22736570747961616e6469223b726f6c657c733a313a2231223b6c6f676765645f696e7c623a313b),
('nvjcc34plqfh5hfsbuq3b871beai9bbs', '192.168.100.3', 1568710686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383731303635383b6e696b7c733a31303a2230303030303030303031223b757365726e616d617c733a31303a22736570747961616e6469223b726f6c657c733a313a2231223b6c6f676765645f696e7c623a313b),
('dbk2gsgtsqsq6pfs1386ot6usmhas8pc', '127.0.0.1', 1568711267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383731313033333b);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` varchar(10) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nama_panggilan` varchar(10) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `agama` varchar(15) NOT NULL,
  `status_pernikahan` varchar(2) NOT NULL,
  `jumlah_anak` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pendidikan_terakhir` varchar(50) NOT NULL,
  `kode_jabatan` varchar(10) DEFAULT NULL,
  `kode_departemen` varchar(10) DEFAULT NULL,
  `gaji_pokok` decimal(10,0) NOT NULL,
  `tanggal_diangkat` date DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `nomor_rekening` varchar(25) NOT NULL,
  `rekening_atas_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama_lengkap`, `nama_panggilan`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `agama`, `status_pernikahan`, `jumlah_anak`, `alamat`, `nomor_telepon`, `email`, `pendidikan_terakhir`, `kode_jabatan`, `kode_departemen`, `gaji_pokok`, `tanggal_diangkat`, `tanggal_keluar`, `nama_bank`, `nomor_rekening`, `rekening_atas_nama`) VALUES
('0000000001', 'Septya Andi Suryanto', 'Andi', 'Mojokerto', '1995-09-24', 'L', 'Islam', 'M', 0, 'Dusun Gapuro, Desa Mojojajar, Kecamatan Kemlagi, Kabupaten Mojokerto', '081555428029', 'septyaandi24@gmail.com', 'Sarjana Strata 1', NULL, '106', '4000000', '2019-08-06', NULL, 'BCA', '', 'Septya Andi Suryanto');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'super admin'),
(2, 'admin'),
(3, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `nik` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`nik`, `username`, `password`, `role`) VALUES
('0000000001', 'septyaandi', 'f989a4829df3d6cedb2e21539dea1e10', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD KEY `role_2` (`role`),
  ADD KEY `nik` (`nik`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
