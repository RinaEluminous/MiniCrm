-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 23, 2022 at 10:15 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `email`, `logo`, `website`, `created_at`, `deleted_at`, `updated_at`, `status`) VALUES
(1, 'dfasa', 'admin@gmail.com', '1655118275.jpg', 'www.eluminous.com', '2022-06-13 00:30:15', '0000-00-00 00:00:00', '2022-06-13 05:34:35', '1'),
(6, 'Eluminous', 'testing@testing.com', '1655108278.jpg', '2020-04-22', '2022-06-13 02:47:58', '0000-00-00 00:00:00', '2022-06-13 02:47:58', '1');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `company_id`, `email`, `phone`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Rina', 'Pagare', 1, 'rinapagare@gmail.com', 243242342, '2022-06-10 03:16:03', '2022-08-16 03:54:46', '0'),
(2, 'test', 'test', 1, 'testing@testing.com', 243242342, '2022-06-10 03:18:14', '2022-06-10 03:18:14', '1'),
(3, 'Tina', 'pagare', 1, 'testing@testing.comdsfsdf', 243242342, '2022-06-10 03:18:40', '2022-06-10 03:18:40', '1');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_07_102831_create_companies_table', 2),
(6, '2022_06_07_102907_create_employees_table', 2),
(7, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(8, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(9, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(10, '2016_06_01_000004_create_oauth_clients_table', 3),
(11, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3),
(12, '2022_06_16_072743_add_status_to_employees_table', 4),
(13, '2022_06_16_083723_add_status_to_companies_table', 5),
(14, '2022_07_27_053825_create_posts_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('ad61638ac6abfd2d8f0e3d3cbb939cab95fcaf4a39553cfa72f81f367013a852b04d565cb4f8e3a5', 38, 10, 'Token Name', '[]', 1, '2022-07-27 03:29:42', '2022-07-27 03:29:42', '2023-07-27 08:59:42'),
('62ac93074ca918d6e240a060947f88df4a449eed878f3d9f77b11e1df112e3ad364dc6f89d8c974a', 39, 10, 'Token Name', '[]', 0, '2022-07-27 03:30:49', '2022-07-27 03:30:49', '2023-07-27 09:00:49'),
('aafa622bfdc97499b817b2cddbdb06b0f8af0c2984c1c9f7b2c8b3004a97ce5d259b824d4b9214e4', 40, 10, 'Token Name', '[]', 0, '2022-07-27 03:42:25', '2022-07-27 03:42:25', '2023-07-27 09:12:25'),
('24ed54b71dcaf9fe718203637388f2b4469e8753786708ef0df703a22f5d42bcf2e5fd735acbf468', 40, 10, 'Laravel Password Grant Client', '[]', 0, '2022-07-27 03:48:03', '2022-07-27 03:48:03', '2023-07-27 09:18:03'),
('5571c0e0c3a937c7347222b0787bfee96dc41650ef1e0b659ca385cbb0076042b8d000ea0b057fe5', 40, 10, 'Laravel Password Grant Client', '[]', 0, '2022-07-27 03:48:27', '2022-07-27 03:48:27', '2023-07-27 09:18:27'),
('bd7f782b178fd4e71a8c15b83819f8a3f91e640f3b8b05da8ce39731e5769863fb425e718efbdf85', 41, 10, 'Token Name', '[]', 0, '2022-07-27 04:22:40', '2022-07-27 04:22:40', '2023-07-27 09:52:40'),
('377b45a69eacd9ca78a98c28f7a098c4906a860c48c91a402fe2c927b5943408f28dd0d4fd1d2793', 42, 10, 'Token Name', '[]', 0, '2022-07-27 04:24:27', '2022-07-27 04:24:27', '2023-07-27 09:54:27'),
('8705385ec9afecee38e46b7918c725d7a240745740bbbb49b69cd4e9c4681dd16f36329c0d2a6717', 40, 10, 'Laravel Password Grant Client', '[]', 0, '2022-07-27 06:45:11', '2022-07-27 06:45:11', '2023-07-27 12:15:11'),
('15cbebdc9da33db415124884a8509d1c6b0df63c0b9efb8b273800591dbad1069f5e84a31b902e27', 40, 10, 'Laravel Password Grant Client', '[]', 0, '2022-07-27 06:45:11', '2022-07-27 06:45:11', '2023-07-27 12:15:11'),
('92a85709b2ef6ac8ceb0b86a3b096fdfb474325bbfa06a746e769a9204479ae2a0c33e7faf921da1', 40, 10, 'Laravel Password Grant Client', '[]', 0, '2022-07-27 06:47:37', '2022-07-27 06:47:37', '2023-07-27 12:17:37'),
('b442b5f9927e297197d32c9831d849edf6c6680b8111be40ed23e09384f6e962c9ec329db4b3c93b', 43, 10, 'Token Name', '[]', 0, '2022-07-27 07:42:12', '2022-07-27 07:42:12', '2023-07-27 13:12:12'),
('449651338de3a5de4b039b4a13d41bc2486046b1d910b710788073c83de01a6b87cec2a9b64d3a7f', 40, 10, 'Laravel Password Grant Client', '[]', 0, '2022-08-15 23:53:29', '2022-08-15 23:53:29', '2023-08-16 05:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'u7BLBz9mELzaTgbPtbKkAudg7C8umoaCaJvAMqbf', NULL, 'http://localhost', 1, 0, 0, '2022-07-26 23:55:26', '2022-07-26 23:55:26'),
(2, NULL, 'Laravel Password Grant Client', 'L7t9qGb9o0aTZniheoTi9aOKZZ02pMrjd4BEdHSh', 'users', 'http://localhost', 0, 1, 0, '2022-07-26 23:55:27', '2022-07-26 23:55:27'),
(3, NULL, 'Laravel Personal Access Client', '48s3TjGRpOQfK7JtuZNFrIstNY85cv3aQz45fHDP', NULL, 'http://localhost', 1, 0, 0, '2022-07-26 23:55:49', '2022-07-26 23:55:49'),
(4, NULL, 'Laravel Password Grant Client', 'vgKxzm3sty1cGAjPnoQQQA8geLFjcpvyDtLZUq0k', 'users', 'http://localhost', 0, 1, 0, '2022-07-26 23:55:49', '2022-07-26 23:55:49'),
(5, NULL, 'Laravel Personal Access Client', 'TDQGEGpehQtvx4EfdfFXFu1wPADwLFSNlYESLpRb', NULL, 'http://localhost', 1, 0, 0, '2022-07-27 01:57:56', '2022-07-27 01:57:56'),
(6, NULL, 'Laravel Password Grant Client', 'cI2ioxow74QMeb7j2P5Ch6iJ23d082mB2QwZyAHu', 'users', 'http://localhost', 0, 1, 0, '2022-07-27 01:57:56', '2022-07-27 01:57:56'),
(7, NULL, 'Laravel Personal Access Client', 'Tam0tlJvjYKQkxLkAPkTCtCe5l5EOqFiifL9EFME', NULL, 'http://localhost', 1, 0, 0, '2022-07-27 01:58:14', '2022-07-27 01:58:14'),
(8, NULL, 'Laravel Password Grant Client', 'cvcVMwf23QypDIuktIglfGrvXPG79WwDwvQU65k9', 'users', 'http://localhost', 0, 1, 0, '2022-07-27 01:58:14', '2022-07-27 01:58:14'),
(9, NULL, 'Laravel Personal Access Client', 'IvjjTdjJVXcS9BReZF9bjVH2vWzW9XLlh9XAWHlv', NULL, 'http://localhost', 1, 0, 0, '2022-07-27 01:58:23', '2022-07-27 01:58:23'),
(10, NULL, 'Laravel Personal Access Client', 'B2hoTrBJ08mnjnQHfMOC6ExW6fpZOddXUQUnNxkq', NULL, 'http://localhost', 1, 0, 0, '2022-07-27 03:15:46', '2022-07-27 03:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-07-26 23:55:26', '2022-07-26 23:55:26'),
(2, 3, '2022-07-26 23:55:49', '2022-07-26 23:55:49'),
(3, 5, '2022-07-27 01:57:56', '2022-07-27 01:57:56'),
(4, 7, '2022-07-27 01:58:14', '2022-07-27 01:58:14'),
(5, 9, '2022-07-27 01:58:23', '2022-07-27 01:58:23'),
(6, 10, '2022-07-27 03:15:46', '2022-07-27 03:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 15, 'LaravelAuthApp', '57afd513ac300f46f999cefdd2c91d554184aa5a0bbc6ad095ee5ab452bc40c3', '[\"*\"]', NULL, '2022-07-27 01:17:21', '2022-07-27 01:17:21'),
(2, 'App\\Models\\User', 17, 'LaravelAuthApp', 'fd859409e685a39ae6f56aec651ea7387f4c8005ec180b78904e7ee66db45e61', '[\"*\"]', NULL, '2022-07-27 01:21:56', '2022-07-27 01:21:56'),
(3, 'App\\Models\\User', 19, 'LaravelAuthApp', 'a2a91871282263da105e907d7763ec3859fbdaf6200c3b4b2ebf2242c2fc61bd', '[\"*\"]', NULL, '2022-07-27 01:23:09', '2022-07-27 01:23:09'),
(4, 'App\\Models\\User', 21, 'LaravelAuthApp', '6501757694e493eee2a0d0ca120679641ee038ef25ef8319b9f5183049c28c33', '[\"*\"]', NULL, '2022-07-27 01:24:09', '2022-07-27 01:24:09'),
(5, 'App\\Models\\User', 23, 'LaravelAuthApp', 'cea5e0b1a5125e3ce33533d7f69547437f7ad3ffe19056789e6b2b9b8f3f6fa6', '[\"*\"]', NULL, '2022-07-27 01:24:29', '2022-07-27 01:24:29'),
(6, 'App\\Models\\User', 26, 'LaravelAuthApp', '41637621e909aa9b1dae27205a9a5d7f3a93d2b3e2df315b97099aae7d73c740', '[\"*\"]', NULL, '2022-07-27 01:27:50', '2022-07-27 01:27:50'),
(7, 'App\\Models\\User', 28, 'LaravelAuthApp', '9d19967610b0320c3bf463e25e166278256c7d8164c08b3d0d926d4de88d584c', '[\"*\"]', NULL, '2022-07-27 01:28:14', '2022-07-27 01:28:14'),
(8, 'App\\Models\\User', 30, 'Laravel Password Grant Client', '0a5e018ef20d1ea99fcd5f47dca15089363b07100fe7dd5643e4a6af4573fe18', '[\"*\"]', NULL, '2022-07-27 01:41:51', '2022-07-27 01:41:51'),
(9, 'App\\Models\\User', 31, 'Laravel Password Grant Client', 'f9d655faf94b572933465aa1e680fda7630b3305304e35a86771438f71a650d0', '[\"*\"]', NULL, '2022-07-27 01:43:30', '2022-07-27 01:43:30'),
(10, 'App\\Models\\User', 32, 'MyApp', '2a6edb326f8fec31165d5fe8b569777059816afebe00a0bf699f99854d94a698', '[\"*\"]', NULL, '2022-07-27 01:56:38', '2022-07-27 01:56:38'),
(11, 'App\\Models\\User', 33, 'MyApp', '4e3e9f99852f6344b951397a32d70d29239736cbe95ece29c14b9e988ce4b9d1', '[\"*\"]', NULL, '2022-07-27 01:58:49', '2022-07-27 01:58:49'),
(12, 'App\\Models\\User', 34, 'Token Name', 'b88e002a1c9fd6d1b388a1a0a3a3af3b3cbea3bdfd0277ae0dcf13c90335b0f1', '[\"*\"]', NULL, '2022-07-27 03:20:37', '2022-07-27 03:20:37'),
(13, 'App\\Models\\User', 35, 'Token Name', '8ea114dc62dbca801354bc727d06fdb34e195068406cc5d613e8c2541193dd97', '[\"*\"]', NULL, '2022-07-27 03:20:48', '2022-07-27 03:20:48'),
(14, 'App\\Models\\User', 36, 'Token Name', '4689ec9eba60c1c0f3637c65daf555d2fec6138b146002b78aefd1536cad9a34', '[\"*\"]', NULL, '2022-07-27 03:21:38', '2022-07-27 03:21:38'),
(15, 'App\\Models\\User', 37, 'Token Name', '55de737a2fff9f9665342e3ee6f259bc5b7be0399a98de24d11c716a484eed41', '[\"*\"]', NULL, '2022-07-27 03:23:16', '2022-07-27 03:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 38, 'John Deo', 'This is testing', '2022-07-27 03:34:37', '2022-07-27 03:34:37'),
(2, 38, 'John Deo', 'This is testing', '2022-07-27 03:34:51', '2022-07-27 03:34:51'),
(3, 38, 'John Deo', 'This is testing', '2022-07-27 03:35:17', '2022-07-27 03:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `is_admin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, 1, '$2y$10$0.LSNd2azVi/cnguv1tHAOFe58xiBIK/pa7tKg0ej2mm6QoOLoRTe', NULL, '2022-06-07 01:03:59', '2022-06-07 01:03:59'),
(37, 'john', 'test13@gmail.com', NULL, NULL, '$2y$10$BIuBZ5L5aGw0J7OiL.EBYuorJsg7kCbO6WPT9FLNXcys7UvxWowPK', NULL, '2022-07-27 03:23:16', '2022-07-27 03:23:16'),
(38, 'john', 'test138@gmail.com', NULL, NULL, '$2y$10$Lq8ThgSNmWjAbwHI5TCuquXs/N1fZAVtPDq1u6EYw4YwOTcYN7hTm', NULL, '2022-07-27 03:29:42', '2022-07-27 03:29:42'),
(39, 'john', 'test10@gmail.com', NULL, NULL, '$2y$10$f9ZAnJ50JOufM.O22uap.el/4PgSV9EzyCQWq5vzTQD7jh42qLbXq', NULL, '2022-07-27 03:30:48', '2022-07-27 03:30:48'),
(40, 'john', 'test101@gmail.com', NULL, NULL, '$2y$10$DmEHN3g8Ud.fPjtEYExgWeoVIyRWM8/gXGbzrCq6w9553hLSDne7O', NULL, '2022-07-27 03:42:25', '2022-07-27 03:42:25'),
(41, 'jessica', 'jessica@gmail.com', NULL, NULL, '$2y$10$.wqLlk4wXInJwE1QsXcv0.NjOWY5YWhuZkDKuj0l/gUaaac/vzD3C', NULL, '2022-07-27 04:22:40', '2022-07-27 04:22:40'),
(42, 'krishna', 'krishana@gmail.com', NULL, NULL, '$2y$10$DjcezlT5ttOCWs9DLCsxV.5q67QkdB2T2hBDHOLHyqPss2MzD7WVu', NULL, '2022-07-27 04:24:27', '2022-07-27 04:24:27'),
(43, 'Krishana Gawali', 'krish@gmail.com', NULL, NULL, '$2y$10$G7SJS6jHCJl3ussy/YOve.z/rMblqdrc3idVvo8w9virQl6BwInB2', NULL, '2022-07-27 07:42:12', '2022-07-27 07:42:12');

-- --------------------------------------------------------

--
-- Table structure for table `users_profiles`
--

DROP TABLE IF EXISTS `users_profiles`;
CREATE TABLE IF NOT EXISTS `users_profiles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` bigint(20) DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `riding_club_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK for riding club',
  `dob` date DEFAULT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK for location',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `federation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_type` int(10) DEFAULT NULL,
  `event_type` int(10) DEFAULT NULL,
  `ranking` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_riding_stable` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','others') COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` enum('YES','NO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NO',
  `api_access_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_cust_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_profiles_email_unique` (`email`),
  KEY `users_profiles_riding_club_id_foreign` (`riding_club_id`),
  KEY `users_profiles_location_id_foreign` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
