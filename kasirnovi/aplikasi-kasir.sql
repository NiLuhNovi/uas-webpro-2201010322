-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2023 at 03:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi-kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `tgl_dibuat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `nama_kategori`, `tgl_dibuat`) VALUES
(6, 'Pelaratan Sekolah', '2023-06-24 13:33:01'),
(7, 'Makanan', '2023-06-24 13:33:06'),
(8, 'Minuman', '2023-06-24 13:33:12'),
(9, 'Obat', '2023-06-24 13:33:18'),
(10, 'Skincare', '2023-06-24 13:33:25'),
(11, 'Parfum', '2023-06-24 13:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `idcart` int(11) NOT NULL,
  `no_nota` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `idlaporan` int(11) NOT NULL,
  `no_nota` varchar(50) NOT NULL,
  `idpelanggan` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `totalbeli` int(11) NOT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tgl_sub` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`idlaporan`, `no_nota`, `idpelanggan`, `catatan`, `totalbeli`, `pembayaran`, `kembalian`, `tgl_sub`) VALUES
(17, 'AD246232039001', 8, '', 18000, 20000, 2000, '2023-06-24 13:39:18'),
(18, 'AD246232039391', 10, '', 24000, 30000, 6000, '2023-06-24 13:40:05'),
(19, 'AD246232040394', 7, '', 30000, 30000, 0, '2023-06-24 13:40:34');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `nama_toko` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `nama_toko`, `username`, `password`, `alamat`, `telepon`) VALUES
(1, 'NOVI MART', 'admin', '$2y$10$CxDIWWPE2rZfO2tIA21zD.sja1oyMaQxmQQ8spUv9qRY7KCb0xdd.', 'Jl. taman jimbaran', '081547218217');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `telepon_pelanggan` varchar(15) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`idpelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(7, 'novi', '081547218217', 'Nusa dua'),
(8, 'user', '08723416246', '-'),
(9, 'surya', '089453214445', 'denpasar'),
(10, 'win metawin', '089546674334', 'denpasar');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `kode_produk`, `nama_produk`, `harga_modal`, `harga_jual`, `stock`, `tgl_input`) VALUES
(7, 6, 'BRG001', 'Buku Tulis', 3000, 5000, 28, '2023-06-24 13:38:57'),
(8, 7, 'BRG002', 'Oreo', 2000, 3000, 98, '2023-06-24 13:39:33'),
(9, 9, 'BRG003', 'Paracetamol', 22500, 25000, 13, '2023-06-24 13:34:45'),
(10, 10, 'BRG004', 'MicellAIR', 28500, 30000, 19, '2023-06-24 13:40:23'),
(11, 7, 'BRG005', 'beng beng', 2000, 2500, 100, '2023-06-24 13:35:30'),
(12, 8, 'BRG006', 'Teh Pucuk ', 3000, 4000, 96, '2023-06-24 13:39:39'),
(13, 11, 'BRG007', 'savauge', 30000, 32500, 20, '2023-06-24 13:37:06'),
(14, 8, 'BRG008', 'Mizone', 3500, 5000, 18, '2023-06-24 13:39:54'),
(15, 6, 'BRG009', 'pensil 2b', 2500, 3000, 20, '2023-06-24 13:38:26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_nota`
--

CREATE TABLE `tb_nota` (
  `idnota` int(11) NOT NULL,
  `no_nota` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_nota`
--

INSERT INTO `tb_nota` (`idnota`, `no_nota`, `idproduk`, `quantity`) VALUES
(14, 'AD246232039001', 7, 2),
(15, 'AD246232039001', 12, 2),
(17, 'AD246232039391', 8, 2),
(18, 'AD246232039391', 12, 2),
(19, 'AD246232039391', 14, 2),
(20, 'AD246232040394', 10, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`idcart`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idlaporan`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`);

--
-- Indexes for table `tb_nota`
--
ALTER TABLE `tb_nota`
  ADD PRIMARY KEY (`idnota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `idlaporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_nota`
--
ALTER TABLE `tb_nota`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
