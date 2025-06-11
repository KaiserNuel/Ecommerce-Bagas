-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jun 2025 pada 10.35
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penju`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jenis_berita` varchar(20) NOT NULL,
  `judul_berita` varchar(255) NOT NULL,
  `slug_berita` varchar(255) NOT NULL,
  `keywords` text DEFAULT NULL,
  `status_berita` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gambar`
--

CREATE TABLE `gambar` (
  `id_gambar` int(3) NOT NULL,
  `id_produk` int(3) NOT NULL,
  `judul_gambar` varchar(50) DEFAULT NULL,
  `gambar` varchar(50) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gambar`
--

INSERT INTO `gambar` (`id_gambar`, `id_produk`, `judul_gambar`, `gambar`, `tanggal_update`) VALUES
(40, 58, 'Gambar hoodie putih', 'hoodie_1_putih.jpg', '2025-06-09 19:59:50'),
(41, 61, 'longsleeves putih', 'long_1_putih.jpg', '2025-06-09 20:23:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `header_transaksi`
--

CREATE TABLE `header_transaksi` (
  `id_header_transaksi` int(3) NOT NULL,
  `id_pelanggan` int(3) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `jumlah_transaksi` int(11) NOT NULL,
  `status_bayar` varchar(20) NOT NULL,
  `jumlah_bayar` int(11) DEFAULT NULL,
  `rekening_pembayaran` varchar(30) DEFAULT NULL,
  `rekening_pelanggan` varchar(30) DEFAULT NULL,
  `bukti_bayar` varchar(255) DEFAULT NULL,
  `id_rekening` int(3) DEFAULT NULL,
  `tanggal_bayar` varchar(20) DEFAULT NULL,
  `nama_bank` varchar(50) DEFAULT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `header_transaksi`
--

INSERT INTO `header_transaksi` (`id_header_transaksi`, `id_pelanggan`, `nama_pelanggan`, `email`, `telepon`, `alamat`, `kode_transaksi`, `tanggal_transaksi`, `jumlah_transaksi`, `status_bayar`, `jumlah_bayar`, `rekening_pembayaran`, `rekening_pelanggan`, `bukti_bayar`, `id_rekening`, `tanggal_bayar`, `nama_bank`, `tanggal_post`, `tanggal_update`) VALUES
(63, 16, 'bagasnuel', 'bagasimanuel16@gmail.com', '6289521598295', 'jl. cipto mangunkusumo, rt 008, kelurahan simpang tiga, kecamatan loa janan ilir', '02PJCY', '2025-06-09 00:00:00', 80000, 'Belum', NULL, NULL, NULL, 'T-Shirt.jpg', NULL, NULL, NULL, '2025-06-09 15:18:08', '2025-06-09 13:18:08'),
(65, 18, 'bagas', 'bagasimanuel15@gmail.com', '6289503937217', 'jl. cipto mangunkusumo, rt 008, kelurahan simpang tiga, kecamatan loa janan ilir', 'G2RWNQ', '2025-06-09 00:00:00', 90000, 'Belum', NULL, NULL, NULL, 'Screenshot_2025-05-07_102811.png', NULL, NULL, NULL, '2025-06-09 22:39:15', '2025-06-09 20:39:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(3) NOT NULL,
  `slug_kategori` varchar(255) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `urutan` int(3) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `slug_kategori`, `nama_kategori`, `urutan`, `gambar`, `tanggal_update`) VALUES
(22, 't-shirt', 'T-shirt', 2, 'T-Shirt_1.png', '2025-06-08 16:09:25'),
(23, 'hoodie', 'hoodie', 1, 'hoodie_4.jpg', '2025-06-09 18:10:56'),
(25, 'longsleeves', 'Longsleeves', 3, 'long_1_hitam1.jpg', '2025-06-09 20:19:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_konfigurasi` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `namaweb` varchar(50) NOT NULL,
  `tagline` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `metatext` text DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `facebook` varchar(50) DEFAULT NULL,
  `instagram` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_konfigurasi`, `id_user`, `namaweb`, `tagline`, `email`, `website`, `keywords`, `metatext`, `telepon`, `alamat`, `facebook`, `instagram`, `deskripsi`, `logo`, `icon`, `tanggal_update`) VALUES
(1, 15, 'Last Destiny', 'Last Destiny', 'bagasimanuel17@gmail.com', 'https://www.youtube.com/@bagas/videos', 'ok', 'ok', '6289521598295', 'Jl. Ahmad Yani No.21, Temindung Permai, Kec. Sungai Pinang, Kota Samarinda, Kalimantan Timur 75242', 'https://www.youtube.com/@bagas/videos', 'https://www.youtube.com/@bagas/videos', 'ok', 'logo_tugas.jpg', 'logo_tugas2.jpg', '2020-08-07 13:17:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(3) NOT NULL,
  `status_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` varchar(300) DEFAULT NULL,
  `tanggal_daftar` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `status_pelanggan`, `nama_pelanggan`, `email`, `password`, `telepon`, `alamat`, `tanggal_daftar`, `tanggal_update`) VALUES
(11, 'Pending', 'Eza Ananda P', 'admin@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '62838925148251', 'Jl. H. Mali Rt 10/01 No. 12 Kel. Duri Kosambi Kec. Cengkareng Jakarta Barat', '2020-07-15 13:37:44', '2020-07-15 11:37:44'),
(12, 'Pending', 'Meydina Rahmawati', 'admin2@gmail.com', '315f166c5aca63a157f7d41007675cb44a948b33', '6283892514825', 'Jl. Anggrek Cakra RT 04 / RW 06 Sukabumi Utara Kebon Jeruk Jakarta Barat', '2020-08-12 20:37:55', '2020-08-12 18:37:55'),
(13, 'Pending', 'tester  jjjj', 'tester@gmail.com', 'ab4d8d2a5f480a137067da17100271cd176607a1', '6282221628291', 'aaa', '2020-09-09 06:39:34', '2020-09-09 04:39:34'),
(14, 'Pending', 'test', 'test@gmail.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '6282221628291', '', '2020-09-09 07:13:40', '2020-09-09 05:13:40'),
(15, 'Pending', 'kasep', 'kasep@gmail.com', '114d40adaaef6c426f99fd806e1eb45753cb1d33', '62891919191', 'konoha', '2024-08-26 08:23:39', '2024-08-26 06:23:39'),
(16, 'Pending', 'bagasnuel', 'bagasimanuel16@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '6289521598295', 'jl. cipto mangunkusumo, rt 008, kelurahan simpang tiga, kecamatan loa janan ilir', '2025-06-01 21:52:22', '2025-06-01 19:52:22'),
(17, 'Pending', 'bagasss', 'bagasimanuel17@gmail.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', '6289521598295', 'jl. cipto mangunkusumo, rt 008, kelurahan simpang tiga, kecamatan loa janan ilir', '2025-06-02 07:03:23', '2025-06-02 05:03:23'),
(18, 'Pending', 'bagas', 'bagasimanuel15@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '6289503937217', 'jl. cipto mangunkusumo, rt 008, kelurahan simpang tiga, kecamatan loa janan ilir', '2025-06-09 22:35:09', '2025-06-09 20:35:09'),
(19, 'Pending', 'bagas', 'bagasimanuel14@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '6289503937217', 'jl. cipto mangunkusumo, rt 008, kelurahan simpang tiga, kecamatan loa janan ilir', '2025-06-09 22:45:28', '2025-06-09 20:45:28'),
(20, 'Pending', 'bagas', 'bagasimanuel11@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '6289503937217', 'jl. cipto mangunkusumo, rt 008, kelurahan simpang tiga, kecamatan loa janan ilir', '2025-06-09 22:46:23', '2025-06-09 20:46:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `id_kategori` int(3) NOT NULL,
  `kode_produk` varchar(20) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `slug_produk` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `keywords` text DEFAULT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(3) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL,
  `ukuran` varchar(20) DEFAULT NULL,
  `status_produk` varchar(20) NOT NULL,
  `tanggal_post` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_user`, `id_kategori`, `kode_produk`, `nama_produk`, `slug_produk`, `keterangan`, `keywords`, `harga`, `stok`, `gambar`, `ukuran`, `status_produk`, `tanggal_post`, `tanggal_update`) VALUES
(57, 15, 22, 't1', 'T-Shirt', 't-shirt-t1', '<p>Tersedia</p>\r\n', 'Barang Bagus', 80000, 8, 'T-Shirt_1.png', 'S', 'Publish', '2025-06-08 18:18:55', '2025-06-08 16:18:55'),
(58, 15, 23, 'h1', 'hoodie', 'hoodie-h1', '<p>Tersedia</p>\r\n', 'Barang bagus', 100000, 10, 'hoodie_4.jpg', 'L', 'Publish', '2025-06-09 20:13:09', '2025-06-09 18:13:09'),
(61, 15, 25, 'l1', 'longsleeves', 'longsleeves-l1', '<p>Tersedia</p>\r\n', 'Barang Bagus', 90000, 9, 'long_1_hitam.jpg', 'M', 'Publish', '2025-06-09 22:21:24', '2025-06-09 20:21:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `id_rekening` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `nomor_rekening` varchar(30) NOT NULL,
  `nama_pemilik` varchar(50) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal_post` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`id_rekening`, `id_user`, `nama_bank`, `nomor_rekening`, `nama_pemilik`, `gambar`, `tanggal_post`) VALUES
(5, 15, 'BANK BRI', '4543456763', 'Bagas', NULL, '2025-04-06 18:49:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(3) NOT NULL,
  `id_pelanggan` int(3) NOT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `id_produk` int(3) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `kode_transaksi`, `id_produk`, `harga`, `jumlah`, `total_harga`, `tanggal_transaksi`, `tanggal_update`) VALUES
(82, 16, '02PJCY', 57, 80000, 1, 80000, '2025-06-09 00:00:00', '2025-06-09 13:18:08'),
(84, 18, 'G2RWNQ', 61, 90000, 1, 90000, '2025-06-09 00:00:00', '2025-06-09 20:39:15');

--
-- Trigger `transaksi`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
	UPDATE produk SET stok = stok-NEW.jumlah
    WHERE id_produk = NEW.id_produk;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `akses_level` varchar(20) NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `username`, `password`, `akses_level`, `tanggal_update`) VALUES
(15, 'bagas', 'bagasimanuel17@gmail.com', 'adminbagas', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Admin', '2025-05-26 22:11:35');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id_gambar`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `header_transaksi`
--
ALTER TABLE `header_transaksi`
  ADD PRIMARY KEY (`id_header_transaksi`),
  ADD UNIQUE KEY `kode_transaksi` (`kode_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_rekening` (`id_rekening`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`id_konfigurasi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD UNIQUE KEY `kode_produk` (`kode_produk`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`id_rekening`),
  ADD UNIQUE KEY `nomor_rekening` (`nomor_rekening`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `kode_transaksi` (`kode_transaksi`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gambar`
--
ALTER TABLE `gambar`
  MODIFY `id_gambar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `header_transaksi`
--
ALTER TABLE `header_transaksi`
  MODIFY `id_header_transaksi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `id_konfigurasi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT untuk tabel `rekening`
--
ALTER TABLE `rekening`
  MODIFY `id_rekening` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `gambar`
--
ALTER TABLE `gambar`
  ADD CONSTRAINT `gambar_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `header_transaksi`
--
ALTER TABLE `header_transaksi`
  ADD CONSTRAINT `header_transaksi_ibfk_3` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `header_transaksi_ibfk_4` FOREIGN KEY (`id_rekening`) REFERENCES `rekening` (`id_rekening`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD CONSTRAINT `konfigurasi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`kode_transaksi`) REFERENCES `header_transaksi` (`kode_transaksi`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
