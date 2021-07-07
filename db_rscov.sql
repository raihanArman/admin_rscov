-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jul 2021 pada 10.14
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
(1, '1625621860.jpg', 'RS Akademis Jaury Jusuf Putra', 'Jl. Jend. M. Jusuf No. 57A, Pattunuang, Kec. Wajo, Kota Makassar, Sulawesi Selatan 90156', '089182918', NULL, '2021-07-06 18:53:17'),
(5, '1625621132.jpg', 'RS dr. Tadjuddin Chalid Makassar', 'Jl. Paccerakkang No.67, Paccerakkang, Kec. Biringkanaya, Kota Makassar, Sulawesi Selatan 90242', 'shahsoa', '2021-07-06 17:25:32', '2021-07-06 18:53:40'),
(6, '1625621185.jpg', 'RS Islam Faisal', 'Jl. A. P. Pettarani, Banta-Bantaeng, Kec. Rappocini, Kota Makassar, Sulawesi Selatan 90222', 'shahsoa', '2021-07-06 17:26:25', '2021-07-06 18:54:08'),
(7, '1625621208.jpg', 'RS Universitas Hasanuddin', 'Jl. Perintis Kemerdekaan KM.10, Tamalanrea Indah, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', 'shahsoa', '2021-07-06 17:26:48', '2021-07-06 18:54:30'),
(8, '1625626527.jpg', 'RSAD Tk. II Pelamonia', 'Jl. Jend Sudirman No. 27, Pisang Utara, Kec. Ujung Pandang, Kota Makassar, Sulawesi Selatan 90157', 'agsiau', '2021-07-06 18:55:27', '2021-07-06 18:55:27'),
(11, '1625644105.jpg', 'RSUD Labuang Baji', 'Jl. Dr. Sam Ratulangi No. 81, Labuang Baji, Kec. Mamajang, Kota Makassar, Sulawesi Selatan 90132', '672162791', '2021-07-06 23:48:25', '2021-07-06 23:48:25'),
(12, '1625644140.jpeg', 'RSUP Dr. Wahidin Sudirohusodo Makassar', 'Jl.Perintis Kemerdekaan Km.11, Tamalanrea Jaya, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', '721982', '2021-07-06 23:49:00', '2021-07-06 23:49:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_temp_alamat`
--

CREATE TABLE `tb_temp_alamat` (
  `id_lokasi` int(11) NOT NULL,
  `lokasi` text NOT NULL,
  `jarak` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_temp_alamat`
--

INSERT INTO `tb_temp_alamat` (`id_lokasi`, `lokasi`, `jarak`) VALUES
(1, 'Jl. Adiyaksa No.18A, Pandang, Kec. Panakkukang, Kota Makassar, Sulawesi Selatan 90231, Indonesia', ''),
(2, 'Jl. Jend. M. Jusuf No. 57A, Pattunuang, Kec. Wajo, Kota Makassar, Sulawesi Selatan 90156', '6337'),
(3, 'Jl. Paccerakkang No.67, Paccerakkang, Kec. Biringkanaya, Kota Makassar, Sulawesi Selatan 90242', '11848'),
(4, 'Jl. A. P. Pettarani, Banta-Bantaeng, Kec. Rappocini, Kota Makassar, Sulawesi Selatan 90222', '4222'),
(5, 'Jl. Perintis Kemerdekaan KM.10, Tamalanrea Indah, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', '8463'),
(6, 'Jl. Jend Sudirman No. 27, Pisang Utara, Kec. Ujung Pandang, Kota Makassar, Sulawesi Selatan 90157', '5270'),
(7, 'Jl. Dr. Sam Ratulangi No. 81, Labuang Baji, Kec. Mamajang, Kota Makassar, Sulawesi Selatan 90132', '5622'),
(8, 'Jl.Perintis Kemerdekaan Km.11, Tamalanrea Jaya, Kec. Tamalanrea, Kota Makassar, Sulawesi Selatan 90245', '8630');

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

--
-- Dumping data untuk tabel `tb_temp_jarak_bell`
--

INSERT INTO `tb_temp_jarak_bell` (`id_asal`, `id_tujuan`, `jarak`, `nilai`) VALUES
(1, 1, '0', '0'),
(1, 2, '6337', '6337'),
(1, 3, '11848', '18185'),
(1, 4, '4222', '22407'),
(1, 5, '8463', '30870'),
(1, 6, '5270', '36140'),
(1, 7, '5622', '41762'),
(1, 8, '8630', '50392'),
(2, 1, '6462', '6462'),
(2, 2, '0', '6462'),
(2, 3, '13974', '20436'),
(2, 4, '6653', '27089'),
(2, 5, '10589', '37678'),
(2, 6, '1483', '39161'),
(2, 7, '3959', '43120'),
(2, 8, '10756', '53876'),
(3, 1, '10729', '10729'),
(3, 2, '14282', '25011'),
(3, 3, '0', '25011'),
(3, 4, '15556', '40567'),
(3, 5, '6406', '46973'),
(3, 6, '13767', '60740'),
(3, 7, '16289', '77029'),
(3, 8, '3492', '80521'),
(4, 1, '1938', '1938'),
(4, 2, '6704', '8642'),
(4, 3, '13791', '22433'),
(4, 4, '0', '22433'),
(4, 5, '10406', '32839'),
(4, 6, '6189', '39028'),
(4, 7, '3410', '42438'),
(4, 8, '10573', '53011'),
(5, 1, '6657', '6657'),
(5, 2, '10210', '16867'),
(5, 3, '5660', '22527'),
(5, 4, '11484', '34011'),
(5, 5, '0', '34011'),
(5, 6, '9695', '43706'),
(5, 7, '12217', '55923'),
(5, 8, '2442', '58365'),
(6, 1, '5698', '5698'),
(6, 2, '1169', '6867'),
(6, 3, '14690', '21557'),
(6, 4, '5283', '26840'),
(6, 5, '11305', '38145'),
(6, 6, '0', '38145'),
(6, 7, '2572', '40717'),
(6, 8, '11472', '52189'),
(7, 1, '4642', '4642'),
(7, 2, '3580', '8222'),
(7, 3, '16496', '24718'),
(7, 4, '2704', '27422'),
(7, 5, '13111', '40533'),
(7, 6, '2621', '43154'),
(7, 7, '0', '43154');

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
