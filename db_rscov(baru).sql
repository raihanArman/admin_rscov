-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2021 pada 20.43
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rscov`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_01_085337_create_table_tb_rumah_sakit', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rumah_sakit`
--

CREATE TABLE `tb_rumah_sakit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_rumah_sakit`
--

INSERT INTO `tb_rumah_sakit` (`id`, `gambar`, `nama`, `lokasi`, `telp`, `created_at`, `updated_at`) VALUES
(1, '1625713659.jpg', 'RS Akademis Jaury Jusuf Putra', 'Jl. Jend. M. Jusuf No. 57A, Pattunuang, Kec. Wajo, Kota Makassar, Sulawesi Selatan 90156', '089182918', NULL, '2021-07-07 19:07:39'),
(5, '1625713687.jpg', 'RS dr. Tadjuddin Chalid Makassar', 'Jl. Paccerakkang No.67, Paccerakkang, Kec. Biringkanaya, Kota Makassar, Sulawesi Selatan 90242', '0823971379281', '2021-07-06 17:25:32', '2021-07-07 19:08:07'),
(6, '1625713700.jpg', 'RS Islam Faisal', 'Jl. A. P. Pettarani, Banta-Bantaeng, Kec. Rappocini, Kota Makassar, Sulawesi Selatan 90222', 'shahsoa', '2021-07-06 17:26:25', '2021-07-07 19:08:20'),
(7, '1625713713.jpg', 'RS Universitas Hasanuddin', 'Jl. Perintis Kemerdekaan KM.10, Tamalanrea Indah, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', 'shahsoa', '2021-07-06 17:26:48', '2021-07-07 19:08:33'),
(8, '1625713728.jpg', 'RSAD Tk. II Pelamonia', 'Jl. Jend Sudirman No. 27, Pisang Utara, Kec. Ujung Pandang, Kota Makassar, Sulawesi Selatan 90157', 'agsiau', '2021-07-06 18:55:27', '2021-07-07 19:08:48'),
(11, '1625713745.jpg', 'RSUD Labuang Baji', 'Jl. Dr. Sam Ratulangi No. 81, Labuang Baji, Kec. Mamajang, Kota Makassar, Sulawesi Selatan 90132', '672162791', '2021-07-06 23:48:25', '2021-07-07 19:09:05'),
(12, '1625713759.jpg', 'RSUP Dr. Wahidin Sudirohusodo Makassar', 'Jl.Perintis Kemerdekaan Km.11, Tamalanrea Jaya, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', '721982', '2021-07-06 23:49:00', '2021-07-07 19:09:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_temp_alamat`
--

CREATE TABLE `tb_temp_alamat` (
  `id_lokasi` int(11) NOT NULL,
  `lokasi` text NOT NULL,
  `jarak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_temp_jarak`
--

CREATE TABLE `tb_temp_jarak` (
  `id_asal` int(11) NOT NULL,
  `id_tujuan` int(11) NOT NULL,
  `jarak` varchar(100) NOT NULL,
  `heuristik` varchar(255) NOT NULL,
  `nilai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_temp_jarak_bell`
--

CREATE TABLE `tb_temp_jarak_bell` (
  `id_asal` int(11) NOT NULL,
  `id_tujuan` int(11) NOT NULL,
  `jarak` varchar(255) NOT NULL,
  `nilai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_temp_urutan`
--

CREATE TABLE `tb_temp_urutan` (
  `urutan` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `lokasi` text NOT NULL,
  `jarak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_temp_urutan`
--

INSERT INTO `tb_temp_urutan` (`urutan`, `id`, `lokasi`, `jarak`) VALUES
(1, 2, 'Jl. Jend. M. Jusuf No. 57A, Pattunuang, Kec. Wajo, Kota Makassar, Sulawesi Selatan 90156', '6677'),
(2, 1, '', ''),
(3, 3, 'Jl. Paccerakkang No.67, Paccerakkang, Kec. Biringkanaya, Kota Makassar, Sulawesi Selatan 90242', '11250'),
(4, 4, 'Jl. A. P. Pettarani, Banta-Bantaeng, Kec. Rappocini, Kota Makassar, Sulawesi Selatan 90222', '4562'),
(5, 5, 'Jl. Perintis Kemerdekaan KM.10, Tamalanrea Indah, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', '7865'),
(6, 6, 'Jl. Jend Sudirman No. 27, Pisang Utara, Kec. Ujung Pandang, Kota Makassar, Sulawesi Selatan 90157', '5611'),
(7, 7, 'Jl. Dr. Sam Ratulangi No. 81, Labuang Baji, Kec. Mamajang, Kota Makassar, Sulawesi Selatan 90132', '5963'),
(8, 8, 'Jl.Perintis Kemerdekaan Km.11, Tamalanrea Jaya, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', '8032');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `tb_rumah_sakit`
--
ALTER TABLE `tb_rumah_sakit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_temp_alamat`
--
ALTER TABLE `tb_temp_alamat`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_rumah_sakit`
--
ALTER TABLE `tb_rumah_sakit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_temp_alamat`
--
ALTER TABLE `tb_temp_alamat`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
