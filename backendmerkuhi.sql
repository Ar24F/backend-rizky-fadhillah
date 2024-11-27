-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 27, 2024 at 05:08 AM
-- Server version: 10.11.9-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backendmerkuhi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` text DEFAULT NULL,
  `provinsi` varchar(10) DEFAULT NULL,
  `kota` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `no_hp`, `alamat`, `provinsi`, `kota`, `created_at`, `updated_at`) VALUES
(1, 2, '082163068108', 'Jl.Jamin Ginting Km.8 No.279D', '34', '278', '2024-11-27 02:03:23', '2024-11-27 02:03:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`id`, `user_id`, `no_hp`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, '082128681028', 'Citra Lake Sawangan Blok E01 Nomor 23, Jalan Raya Cinangka Raya KM 3 Bojongsari Baru, RT 001, RW 004', '2024-11-26 22:17:36', '2024-11-26 22:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_26_083603_create_personal_access_tokens_table', 1),
(5, '2024_11_26_102025_create_merchants_table', 1),
(6, '2024_11_26_102055_create_products_table', 1),
(7, '2024_11_26_102415_create_customers_table', 1),
(8, '2024_11_26_102422_create_transaksis_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'PT AMAN TEKNO SOLUSI', 'b38daee4de8ced9ac87c7b4c6453f3f11f08b865b6f8ceebcdc3a008cf0e3be3', '[\"*\"]', NULL, NULL, '2024-11-26 22:17:36', '2024-11-26 22:17:36'),
(2, 'App\\Models\\User', 1, 'PT AMAN TEKNO SOLUSI', '51a806ac784448b856ab93af80cde6217c3995b660225f7ab9af8b0bb82da92c', '[\"*\"]', '2024-11-27 02:12:00', NULL, '2024-11-26 22:17:51', '2024-11-27 02:12:00'),
(3, 'App\\Models\\User', 2, 'Rizky Fadhillah', '40723f9775f70001776d07b727a1d3dd25e1c6045a286de03f9c4e795e42e8a8', '[\"*\"]', NULL, NULL, '2024-11-27 02:03:23', '2024-11-27 02:03:23'),
(4, 'App\\Models\\User', 2, 'Rizky Fadhillah', '0115bc59399cdeedf23c6a1448017194f2444d94b46685b519a47889c8303064', '[\"*\"]', '2024-11-27 02:07:31', NULL, '2024-11-27 02:03:43', '2024-11-27 02:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merchant_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kondisi` enum('Baru','Bekas - Seperti Baru','Bekas') NOT NULL,
  `berat` decimal(10,2) NOT NULL,
  `kategori` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `merchant_id`, `nama`, `deskripsi`, `harga`, `kondisi`, `berat`, `kategori`, `foto`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kipas Angin', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptas ad, repellendus labore culpa similique porro dolorum totam nostrum accusamus blanditiis quisquam fugit. Maxime vel error aut commodi possimus recusandae quo.', 12000.00, 'Baru', 200.00, 'electronic', '1732659507.jpg', '2024-11-26 22:18:27', '2024-11-26 22:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('93lb2QztKJHgkN2n95iUoO6ueFrWWtSNnb3qAW27', NULL, '36.71.142.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW5yeTZZVWxkc29NeDBpTm5qZDZJRUx6Q0ducFJqYnhVbzZFbXdNeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732683570),
('9OtY9poN3NqBAffTiHsue1PlpdS2PErUZ99XhWww', NULL, '135.148.100.196', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2ZpZnZacVZ3SVF6Y3pWWmdCemRDZlVJSG1IMElyc3lCNUxucnkzSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732658141),
('AHGUtwx6FNclxzZcJ5ucWuAizPrNpI5LeDIxLxvy', NULL, '205.169.39.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3lVOW5JRzdOZHpNZk9OT0Y2REZmR3ZlY01XZ0lpdWppOEkzYTFvQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732664069),
('ajumUBZoxqxy8JPRgWaYBVWHPAuX3hczQ3Ujbhrt', NULL, '146.70.134.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWFjUlVWOUtUOWJPNnlteTdBN211VTZZUnRtaU00VnNJYVdjU0tsUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732665901),
('ETvdDIRassDmXCJpY5aS8jXJHf3Cg60gflDL5gd8', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblZTbTB2UFdDZzk1c3hCdUs3NHRhMmlKbTVLNUExQVNrdlVueHhreiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732667490),
('evrZWOXdhskDMkfPgIDxxK1EMDESom5Ox50vFgov', NULL, '52.16.245.145', 'Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGZLSWluY0UzSHJDTXlvcG05MTRPSVRGbDNhQ2RPUUhqR3pnbjhuOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732667489),
('flokB8omhNmg9xUkYQkQgFHBjgwX3MuMQBWvTXnu', NULL, '36.71.141.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTN3a25jTFE4ZmdkWHpHN2JuWEZDcGlNa09EOFFuQzlBTzZOVUhoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732657381),
('fVDC8CCCVH06FesUuEvdJPq0tuBY25XIQURAbV7R', NULL, '2a02:4780:6:c0de::10', 'Go-http-client/2.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR0J5ZmdWY3pQUjcxNXk0dlpZWjUzbktBUDdMZFpvdno4b0xpS2VFZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732667879),
('GMQYHP3Fb48HeJJrkOJv70QK3TogPh1xNzWSYRnD', NULL, '192.175.111.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid291NTlHam91S0M1NkRzNEpMVzZybFJSd3BZWnZUb3ZEanp1emJFWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732660059),
('HlFHmBUKpZEqlEBByBaskfdOsPVP32xagmt5iPHp', NULL, '52.16.245.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzVxYUlGNkhiOVM4dHhJTW0zMG5SQlFtYkM4VGJyREl5QnVpWTY1TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732667490),
('im7rPzpuz50nfaQZZBKBgMqWWvowAKLBQx0rhAgX', NULL, '104.166.80.85', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjYzTmQ0V1FSZkJxRlZIREp4Z1J6ZmYyT2RpbFVUbW16SmMwNTVMaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732661086),
('jc5uFSCCXZpeQK0zj1oSymDxsBc86cYWgLEFRenM', NULL, '205.169.39.48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkNhZ2lVM2hoVWQ3M09ieEhTSTRZVGhVaFFHSHRiVlBiTEU5SmxiSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732664027),
('LAWJPsTk0Sm4lTRneAOdBevpyFaAyboctr7H9UrU', NULL, '64.15.129.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibU8ydzlZQmczUkI1UTE2SkZQVzRYUTZNcFZKVlJSbWRjdEJUOXNnbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732660068),
('LKMbHJ5fn6erny0eMjTCFvsGp72xxtOBcHjluMYr', NULL, '205.169.39.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.5938.132 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnZ1RHZjdGRWSmY4SEViT2YxNGQ5WWNxUmVHd0xDakJ5V2RzYVM5RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732664102),
('lY45V7myV76JQzDfFzOS6HdpyhKrmjyKuVBnGf4Y', NULL, '207.241.237.22', 'Mozilla/5.0 (compatible; archive.org_bot +http://archive.org/details/archive.org_bot) Zeno/76f39f7 warc/v0.8.53', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUZ5WHdKSUZyMHl2THNVRnRCcDlKYzVreXBCTTRGWWVJc2tiTU1CYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732661177),
('ovYOZc24fQgQJoBEe87ocIr14lpUSnEBYxC2IKfi', NULL, '104.166.80.230', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2tCOVkxVzhoempnOVBEaWJBMHQ0R0Q0YTVacnppSVUxQm9la1VBTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732662894),
('PDw324kpCtQrDOEDoCQUVev5U8lDdRO5kjsO6aGn', NULL, '205.169.39.162', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2trbWlRTzRia21DMXVLdFhXRzFrTEVQbE9QN0lMR0lBWkVpUUc1OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732664055),
('Rd7gKvvpE1K5VweMxekaVMkbcG3XWEy3vcMIxcpe', NULL, '192.175.111.249', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHo0MFNaNWRvNjJmN3cwR3lCZ1FLQ2cyMWpCM244NGhrQ0IyS2FpRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732660066),
('S8QF3h7QyEKrrwOgFDIuuP7w1biA3CnLLkb0JgaX', NULL, '192.175.111.241', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibldFalV0Y0F2cnVKV2JMQnV0dGl3aUtzQnFRZTVkNzhkeDNKWjVrTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732660061),
('S97kYPePbCKbpyppmjA4XKW82wMjsEF5NJVZLju3', NULL, '205.169.39.46', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXVzdHJOT2VaWUx0aDQ4VzVVYkFBTzVCRGVqdE1JVE1kb2pxeDdJdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732664034),
('VIa53I5YL3AqqY988DehHAFCWy8rGfdfYmLxe1WR', NULL, '207.241.237.22', 'Mozilla/5.0 (compatible; archive.org_bot +http://archive.org/details/archive.org_bot) Zeno/76f39f7 warc/v0.8.53', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVpIUE02TGFpVjVlQ3hNeVpBTjNYaGUyTGxnS1EzV1dDQkU0c2VVNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732661177),
('y9AQc8frmHhExRRqN844IVl2H6Zg2CST2w4RiKMa', NULL, '34.122.147.229', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/125.0.6422.60 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUZkYTQxcUpqbkI2TThIMFNnbUJyNkNxd0dVTlpWUER4OTdRM21TeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHBzOi8vbWVya3VoaS5hcjI0Zi5teS5pZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732664029);

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ongkir` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `pengiriman` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `customer_id`, `product_id`, `quantity`, `discount`, `ongkir`, `total`, `free_shipping`, `pengiriman`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0.00, 0.00, 12000.00, 0, 'jne', '2024-11-27 02:07:02', '2024-11-27 02:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Merchant','Customer') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'PT AMAN TEKNO SOLUSI', 'merchant@mail.com', '$2y$12$/SEYEWT0Q8BzmuHlHwIhrORlnsapWxaAutC5Nt/lAFRCfVbD0Jgr2', 'Merchant', NULL, '2024-11-26 22:17:36', '2024-11-26 22:17:36'),
(2, 'Rizky Fadhillah', 'customer@mail.com', '$2y$12$Go9IYRhr2ik0cX.8VA9gweI7hmIvuKeBHiD113tePt0fm/JRAPPSq', 'Customer', NULL, '2024-11-27 02:03:23', '2024-11-27 02:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merchants_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_merchant_id_foreign` (`merchant_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksis_customer_id_foreign` (`customer_id`),
  ADD KEY `transaksis_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `merchants`
--
ALTER TABLE `merchants`
  ADD CONSTRAINT `merchants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_merchant_id_foreign` FOREIGN KEY (`merchant_id`) REFERENCES `merchants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD CONSTRAINT `transaksis_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksis_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
