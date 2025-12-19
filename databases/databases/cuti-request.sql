-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2024 at 04:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuti-request`
--

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `id` int(11) NOT NULL,
  `id_nip` varchar(30) NOT NULL,
  `id_jenis_cuti` int(11) NOT NULL,
  `tgl_pengajuan` timestamp NOT NULL DEFAULT current_timestamp(),
  `keterangan` varchar(64) NOT NULL,
  `tgl_awal` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `edited_by` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cuti`
--

INSERT INTO `cuti` (`id`, `id_nip`, `id_jenis_cuti`, `tgl_pengajuan`, `keterangan`, `tgl_awal`, `tgl_akhir`, `status`, `edited_by`) VALUES
(1, '1000000001', 4, '2021-07-08 00:37:14', 'Mau aja ah, nanya wae', '2021-07-08', '2021-07-08', 'Approved', 'human'),
(40, '19220055', 2, '2024-10-07 12:25:10', 'sunat', '2024-10-07', '2024-10-07', 'Pending', 'adit');

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id` int(11) NOT NULL,
  `divisi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id`, `divisi`) VALUES
(1, 'Accounting'),
(2, 'Development'),
(3, 'Services'),
(4, 'IT'),
(5, 'Human Resources'),
(6, 'Production'),
(7, 'Technician');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_divisi` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `jabatan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_divisi`, `id`, `jabatan`) VALUES
(1, 1, 'Senior Staff Accounting'),
(1, 2, 'Junior Staff Accounting'),
(1, 3, 'General Accounting'),
(2, 4, 'Senior Development Staff'),
(2, 5, 'Junior Development Staff'),
(3, 6, 'Front Office Staff'),
(3, 7, 'Back Office Staff'),
(4, 8, 'Senior Developer '),
(4, 9, 'Junior Developer'),
(4, 10, 'Project Leader Developer'),
(5, 11, 'Human Resource Staff'),
(5, 12, 'Senior Human Resource Staff'),
(6, 13, 'Staff Production'),
(6, 14, 'Quality Control'),
(6, 15, 'Packer Staff'),
(7, 16, 'Electricity Staff'),
(7, 17, 'Senior Electricity Staff');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cuti`
--

CREATE TABLE `jenis_cuti` (
  `id` int(11) NOT NULL,
  `jenis_cuti` varchar(64) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_cuti`
--

INSERT INTO `jenis_cuti` (`id`, `jenis_cuti`, `value`) VALUES
(1, 'Umum', 1),
(2, 'Melahirkan', 5),
(3, 'Besar', 2),
(4, 'Sakit', 4),
(5, 'Karena Alasan Penting', 3);

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `level`) VALUES
(1, 'Administrator'),
(2, 'Manager'),
(3, 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(64) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1),
(2, 'haikal', 'c21b3ad4636fcc88a81c8154ff319be7936e63ae', 1),
(3, 'staff', '6ccb4b7c39a6e77f76ecfa935a855c6c46ad5611', 3),
(6, 'human', '1e724c386fa4be5645605dd168556d50beac4385', 2),
(26, 'adit', 'c09680bfa0609f0accfe78a6c9dde75f30356a4a', 2),
(27, 'dilan', 'c09680bfa0609f0accfe78a6c9dde75f30356a4a', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kelamin` varchar(16) NOT NULL,
  `divisi` int(11) NOT NULL,
  `jabatan` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telp` varchar(30) NOT NULL,
  `tgl_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `nip`, `nama`, `kelamin`, `divisi`, `jabatan`, `email`, `telp`, `tgl_masuk`) VALUES
(1, '1000000001', 'Administrator', 'Laki-laki', 4, 10, 'administrator@admin.com', '42342213', '2012-12-12'),
(2, '100000001', 'Muhammad Haikal', 'Laki-laki', 4, 10, 'haikal@gmail.com', '08215387124', '2021-08-02'),
(3, '1122334400', 'SAD LIFE YEA', 'Laki-laki', 4, 8, 'staff@staff.co.id', '089889898989', '2019-09-25'),
(27, '1241324', 'dilan pros', 'Laki-laki', 3, 7, 'panjul@gmail.com', '452353453646', '2024-10-07'),
(26, '19220055', 'Aditya', 'Laki-laki', 4, 10, 'adityasatria306@gmail.com', '123424324', '2024-10-02'),
(6, '45346456568', 'Akun Human', 'Laki-laki', 5, 11, 'karnivora@manusia.sdm', '11223345453', '2021-06-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuti_jenis_cuti_1` (`id_jenis_cuti`),
  ADD KEY `fk_cuti_user_profile_1` (`id_nip`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jabatan_divisi_1` (`id_divisi`);

--
-- Indexes for table `jenis_cuti`
--
ALTER TABLE `jenis_cuti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_level_1` (`level`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `fk_user_profile_user_1` (`id`),
  ADD KEY `fk_user_profile_jabatan_1` (`jabatan`),
  ADD KEY `fk_user_profile_divisi_1` (`divisi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cuti`
--
ALTER TABLE `cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jenis_cuti`
--
ALTER TABLE `jenis_cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cuti`
--
ALTER TABLE `cuti`
  ADD CONSTRAINT `fk_cuti_jenis_cuti_1` FOREIGN KEY (`id_jenis_cuti`) REFERENCES `jenis_cuti` (`id`),
  ADD CONSTRAINT `fk_cuti_user_profile_1` FOREIGN KEY (`id_nip`) REFERENCES `user_profile` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD CONSTRAINT `fk_jabatan_divisi_1` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_level_1` FOREIGN KEY (`level`) REFERENCES `level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_user_profile_divisi_1` FOREIGN KEY (`divisi`) REFERENCES `divisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_profile_jabatan_1` FOREIGN KEY (`jabatan`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_profile_user_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
