-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 12:23 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edit_me`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|max:255\"}}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|email|max:255\"}}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{\"validation\":{\"rule\":\"required|min:6|max:255\"}}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(56, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 8, 'payload', 'text', 'Payload', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3),
(58, 8, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 4),
(59, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(60, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(61, 8, 'template_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(62, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(63, 9, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(64, 9, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(65, 9, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(66, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(67, 9, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(68, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(69, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(70, 8, 'filename', 'text', 'Filename', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6),
(71, 1, 'logo', 'text', 'Logo', 0, 1, 1, 1, 1, 1, '{}', 12),
(72, 1, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 13),
(73, 1, 'primary_color', 'color', 'Primary Color', 0, 1, 1, 1, 1, 1, '{}', 14),
(74, 1, 'secondary_color', 'color', 'Secondary Color', 0, 1, 1, 1, 1, 1, '{}', 15);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 17:25:34', '2020-05-23 02:40:22'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-04-11 17:25:34', '2020-04-11 17:25:34'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 17:25:34', '2020-04-13 00:14:48'),
(8, 'templates', 'templates', 'Template', 'Templates', 'voyager-documentation', 'App\\Template', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-04-11 17:32:39', '2020-04-19 22:52:18'),
(9, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-04-19 22:46:04', '2020-04-19 22:46:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-04-11 17:25:36', '2020-04-11 17:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-04-11 17:25:36', '2020-04-11 17:25:36', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 7, '2020-04-11 17:25:36', '2020-04-11 17:36:58', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-04-11 17:25:36', '2020-04-11 17:25:36', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-04-11 17:25:37', '2020-04-11 17:25:37', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2020-04-11 17:25:37', '2020-04-11 17:36:58', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-04-11 17:25:37', '2020-04-11 17:30:01', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-04-11 17:25:37', '2020-04-11 17:36:58', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-04-11 17:25:37', '2020-04-11 17:36:58', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-04-11 17:25:37', '2020-04-11 17:36:58', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2020-04-11 17:25:37', '2020-04-11 17:36:58', 'voyager.settings.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-04-11 17:25:50', '2020-04-11 17:36:58', 'voyager.hooks', NULL),
(16, 1, 'Templates', '', '_self', 'voyager-documentation', '#000000', NULL, 4, '2020-04-11 17:32:39', '2020-04-11 17:37:21', 'voyager.templates.index', 'null'),
(17, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-04-19 22:46:05', '2020-04-19 22:46:05', 'voyager.categories.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2016_01_01_000000_add_voyager_user_fields', 1),
(3, '2016_01_01_000000_create_data_types_table', 1),
(4, '2016_01_01_000000_create_pages_table', 1),
(5, '2016_01_01_000000_create_posts_table', 1),
(6, '2016_02_15_204651_create_categories_table', 1),
(7, '2016_05_19_173453_create_menu_table', 1),
(8, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(9, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(10, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(11, '2016_06_01_000004_create_oauth_clients_table', 1),
(12, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(13, '2016_10_21_190000_create_roles_table', 1),
(14, '2016_10_21_190000_create_settings_table', 1),
(15, '2016_11_30_135954_create_permission_table', 1),
(16, '2016_11_30_141208_create_permission_role_table', 1),
(17, '2016_12_26_201236_data_types__add__server_side', 1),
(18, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(19, '2017_01_14_005015_create_translations_table', 1),
(20, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(21, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(22, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(23, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(24, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(25, '2017_08_05_000000_add_group_to_settings_table', 1),
(26, '2017_11_26_013050_add_user_role_relationship', 1),
(27, '2017_11_26_015000_create_user_roles_table', 1),
(28, '2018_03_11_000000_add_user_settings', 1),
(29, '2018_03_14_000000_add_details_to_data_types_table', 1),
(30, '2018_03_16_000000_make_settings_value_nullable', 1),
(31, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('06c58f47a0af0932827f24494f5890809e5008fef3a199dc34561b0826985b89cd0a75eb1c2952bc', 1, 3, 'admin', '[]', 0, '2020-04-30 03:14:59', '2020-04-30 03:14:59', '2021-04-30 03:14:59'),
('11a065aa07582e3a33efde7fb5e1c063f61dd1512f17eca6a9336084830c0dd80b186686174b8b23', 4, 11, 'user', '[]', 0, '2020-05-28 18:12:41', '2020-05-28 18:12:41', '2021-05-28 18:12:41'),
('12e800887e140ac79707559b638bb7878fca67b4c5c066c23d3a401a53a16585784080da1032afe9', 1, 7, 'admin', '[]', 0, '2020-05-28 00:27:27', '2020-05-28 00:27:27', '2021-05-28 00:27:27'),
('203956109c05e265ed62a0d097133480d63b545aaa22756a45b591dc6e1b2a6a2303132fae88fd5f', 4, 11, 'user', '[]', 0, '2020-05-28 21:49:19', '2020-05-28 21:49:19', '2021-05-28 21:49:19'),
('3fb6932686ad8db99046ca0eb2cc5d6c2db021b4148b8135e18f5ad4483e9b93bc54a92a4feeaabf', 2, 3, 'user', '[]', 0, '2020-04-21 18:40:57', '2020-04-21 18:40:57', '2021-04-21 18:40:57'),
('41759d336ed509cbab2d1a946612367c21bf65a5206a3576aa06eca60a92dca991666c43c2794145', 4, 11, 'user', '[]', 0, '2020-05-28 18:10:16', '2020-05-28 18:10:16', '2021-05-28 18:10:16'),
('4b38f3d6513da97112757f4a470b7ce200a2fcd52b34daffdbb1006610048ca3d6f71d33436d9a07', 1, 3, 'admin', '[]', 0, '2020-04-21 17:12:23', '2020-04-21 17:12:23', '2021-04-21 17:12:23'),
('530992ac3b2e1a5065da7f26ead01eca9d5774767e68d32b758069d7a301575c2f24ce2bce114c50', 1, 3, 'admin', '[]', 0, '2020-04-21 17:20:00', '2020-04-21 17:20:00', '2021-04-21 17:20:00'),
('56940a46fb99bf70bab9f4c471576f2f21a3fdc2ec63b09d172b9a9975d5c10b0402732b210cc131', 1, 3, 'admin', '[]', 0, '2020-04-21 17:14:34', '2020-04-21 17:14:34', '2021-04-21 17:14:34'),
('57bcb7d140d1d9b6f4179f4e0b721ad071c584871aaab9debd02f090c1ee0d5fbb95898df33e6a1e', 4, 11, 'user', '[]', 0, '2020-05-28 18:12:27', '2020-05-28 18:12:27', '2021-05-28 18:12:27'),
('65644d8ab2d14a66ce1a2df517c2901d0d7b0c0df09e06c4bbb331ec3646352035d0cbe95e773ea2', 4, 11, 'user', '[]', 0, '2020-05-28 18:00:23', '2020-05-28 18:00:23', '2021-05-28 18:00:23'),
('67cef6408bd6df1f5d6f53891a3f89962444b333d38fdf0d8d64b94fd154da31372720a5662fe6a5', 4, 11, 'user', '[]', 0, '2020-05-28 17:59:27', '2020-05-28 17:59:27', '2021-05-28 17:59:27'),
('69624af335d715cd47feb9dca8bb3b64bdd7e3b55206fdbc2b6f19e99528e0196ad94448e1108b5f', 4, 11, 'user', '[]', 0, '2020-05-28 18:13:08', '2020-05-28 18:13:08', '2021-05-28 18:13:08'),
('6ae90d7171fdde986bb1f890b8f89faffae7f0cb03b6faeb264f381a4de275c4bf7bbb81709a4edd', 1, 7, 'admin', '[]', 0, '2020-05-28 01:18:06', '2020-05-28 01:18:06', '2021-05-28 01:18:06'),
('6d53c63f37f7c231c9c467f43996266390b3d8327995c8c397935d1ea090d192caa7800bd608d712', 4, 11, 'user', '[]', 0, '2020-05-28 18:04:59', '2020-05-28 18:04:59', '2021-05-28 18:04:59'),
('87bcf2a95bd8702e711e18b5cc2a55be71b48fad84202911a30f405d3fdb4a34094a5178df921eb8', 1, 3, 'admin', '[]', 0, '2020-04-30 03:14:26', '2020-04-30 03:14:26', '2021-04-30 03:14:26'),
('8895dd3e87c00591285dfa7c0c920aacc1eb5b00cb59a09b584d024bafd00a5ba8134b2d425a2061', 1, 3, 'admin', '[]', 0, '2020-04-21 18:36:48', '2020-04-21 18:36:48', '2021-04-21 18:36:48'),
('8b094fa78c9b2eb9c1f7e719d0efdca8ff7daacd663a6dc0b0219e54e17c18f46b9b152d23209c7c', 1, 7, 'admin', '[]', 0, '2020-05-28 01:19:00', '2020-05-28 01:19:00', '2021-05-28 01:19:00'),
('8ef6c39905c6de0772069e318023f8c83369feee96442fe49af7507cb9246dd722f15ab1b1dbe6ff', 1, 3, 'admin', '[]', 0, '2020-05-05 01:35:52', '2020-05-05 01:35:52', '2021-05-05 01:35:52'),
('b039449ed81d3db4c79e77a31c5ea03e46f99ec73cac79ee4e331d32eadc3c690ad0a2751e84b4b2', 1, 11, 'admin', '[]', 0, '2020-05-28 17:10:14', '2020-05-28 17:10:14', '2021-05-28 17:10:14'),
('b705b436d2778d66e09ad8087c8bb6573362e1c1cd684bb664b9307469298cec5d698eab498c2a05', 1, 11, 'admin', '[]', 0, '2020-05-28 19:01:55', '2020-05-28 19:01:55', '2021-05-28 19:01:55'),
('be2ac59de2e5c4453461a1339fd30a426832e1e3544ac956c7e56b3fdea45da1dc00e5a0d499c9fa', 1, 11, 'admin', '[]', 0, '2020-05-28 17:12:24', '2020-05-28 17:12:24', '2021-05-28 17:12:24'),
('c00c1a32e9a1e72027538411f7c1dcf0628bacf50b8330a90d73a7512d35d82eaacf45c619ffaa5b', 1, 11, 'admin', '[]', 0, '2020-05-28 02:00:32', '2020-05-28 02:00:32', '2021-05-28 02:00:32'),
('c2c8c7eda972e9dd005c8eb4dac79712e98f1a876779505f998de8c82a5e1414ec8033b993e2e36b', 1, 11, 'admin', '[]', 0, '2020-05-28 19:01:22', '2020-05-28 19:01:22', '2021-05-28 19:01:22'),
('d0c57c304c34d3e0f9ee1750865336de66fa5ca09628415caecca491a262e1d0f349e4b9339101f3', 1, 11, 'admin', '[]', 0, '2020-05-28 02:00:35', '2020-05-28 02:00:35', '2021-05-28 02:00:35'),
('d6eca6fe3d9925dde9db6204dc06667606bf351517b243a4f108c093cff367a447b5fb7e8680b643', 1, 3, 'user', '[]', 0, '2020-04-21 17:13:20', '2020-04-21 17:13:20', '2021-04-21 17:13:20'),
('d9268ad79573351c942d7aa249d1b120535630057e014790459f15610e0a5e8dc1fa956618bcb539', 4, 11, 'user', '[]', 0, '2020-05-28 18:19:20', '2020-05-28 18:19:20', '2021-05-28 18:19:20'),
('daa23e6f8494516b20fc13ee7036aa9afc75ef61c7369d14a25acfd22ad50dbb8b158f98bd4ed40f', 4, 11, 'user', '[]', 0, '2020-05-28 18:01:08', '2020-05-28 18:01:08', '2021-05-28 18:01:08'),
('e6f968398448389b226c2123750ccf915533f0aa42b7c2874d9f3d834bc4658adb390004b262b931', 1, 3, 'admin', '[]', 0, '2020-05-05 01:34:47', '2020-05-05 01:34:47', '2021-05-05 01:34:47'),
('f9bf59533d1256bc8e5e5b05783972d241e36ea7d3c1ddd85819e9a4ff90c956b91cb3e0e8653d55', 4, 11, 'user', '[]', 0, '2020-05-28 18:19:28', '2020-05-28 18:19:28', '2021-05-28 18:19:28'),
('fdef0818bb1ca551f9d93c6d656f6d84a26c619b50272e29ee99eb0cc0ba110fe33ab5cbe391fece', 4, 11, 'user', '[]', 0, '2020-05-28 19:02:07', '2020-05-28 19:02:07', '2021-05-28 19:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'vKJuicGf4KS0EYKejFQACntmEIizU9h9lQjiDT4P', 'http://localhost', 1, 0, 0, '2020-04-19 22:34:00', '2020-04-19 22:34:00'),
(2, NULL, 'Laravel Password Grant Client', 'fvim8OA3pAmY4eSZWpy8OhMgWfaFr644yZSlJ3EN', 'http://localhost', 0, 1, 0, '2020-04-19 22:34:01', '2020-04-19 22:34:01'),
(3, NULL, 'Laravel Personal Access Client', 'OcjfI9UzX1b01SQ1zI6iS7I6VtjfDDZKPMb4GDG0', 'http://localhost', 1, 0, 0, '2020-04-20 23:46:04', '2020-04-20 23:46:04'),
(4, NULL, 'Laravel Password Grant Client', 'ku72KcL6SqiQLAA1TsKIDcbFJNis38il3q0MIs1z', 'http://localhost', 0, 1, 0, '2020-04-20 23:46:04', '2020-04-20 23:46:04'),
(5, NULL, 'Laravel Personal Access Client', 'mwtKGM7111eQt7gIPvJFSdBeL03kkX44qRLqbSpL', 'http://localhost', 1, 0, 0, '2020-05-23 02:06:43', '2020-05-23 02:06:43'),
(6, NULL, 'Laravel Password Grant Client', 'ivVLaaaxHsLLqzHHFXe7bOUZs1SSskHFxWu1RPlb', 'http://localhost', 0, 1, 0, '2020-05-23 02:06:43', '2020-05-23 02:06:43'),
(7, NULL, 'Laravel Personal Access Client', 'HVM3V9QwzKFindZYYtdHztLLOprFWmG9idrRdrAT', 'http://localhost', 1, 0, 0, '2020-05-23 02:13:56', '2020-05-23 02:13:56'),
(8, NULL, 'Laravel Password Grant Client', 'AqJnVRxo4WadVLUNOU0Ozgk2pyj85eKPq7Th5sqn', 'http://localhost', 0, 1, 0, '2020-05-23 02:13:56', '2020-05-23 02:13:56'),
(9, NULL, 'Laravel Personal Access Client', 'RfqTwudxdEpv9P6lF1sRGM6tp099i0hYN9C55ooV', 'http://localhost', 1, 0, 0, '2020-05-28 01:45:50', '2020-05-28 01:45:50'),
(10, NULL, 'Laravel Password Grant Client', 'A3Bn0QgESNoCRqtE4cfNUljRee5mlHbFpUbm74wN', 'http://localhost', 0, 1, 0, '2020-05-28 01:45:51', '2020-05-28 01:45:51'),
(11, NULL, 'Laravel Personal Access Client', 'N9gGDSbz5blpuGyLVYnQxEozUXGN1NqICfFXPwrS', 'http://localhost', 1, 0, 0, '2020-05-28 02:00:16', '2020-05-28 02:00:16'),
(12, NULL, 'Laravel Password Grant Client', 'ANeWCg5jIJeYFndY9wgn8JCcqNfqAzkR0gXGzbT1', 'http://localhost', 0, 1, 0, '2020-05-28 02:00:16', '2020-05-28 02:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-04-19 22:34:00', '2020-04-19 22:34:00'),
(2, 3, '2020-04-20 23:46:04', '2020-04-20 23:46:04'),
(3, 5, '2020-05-23 02:06:43', '2020-05-23 02:06:43'),
(4, 7, '2020-05-23 02:13:56', '2020-05-23 02:13:56'),
(5, 9, '2020-05-28 01:45:51', '2020-05-28 01:45:51'),
(6, 11, '2020-05-28 02:00:16', '2020-05-28 02:00:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-04-11 17:25:37', '2020-04-11 17:25:37'),
(2, 'browse_bread', NULL, '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(3, 'browse_database', NULL, '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(4, 'browse_media', NULL, '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(5, 'browse_compass', NULL, '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(6, 'browse_menus', 'menus', '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(7, 'read_menus', 'menus', '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(8, 'edit_menus', 'menus', '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(9, 'add_menus', 'menus', '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(10, 'delete_menus', 'menus', '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(11, 'browse_roles', 'roles', '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(12, 'read_roles', 'roles', '2020-04-11 17:25:38', '2020-04-11 17:25:38'),
(13, 'edit_roles', 'roles', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(14, 'add_roles', 'roles', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(15, 'delete_roles', 'roles', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(16, 'browse_users', 'users', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(17, 'read_users', 'users', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(18, 'edit_users', 'users', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(19, 'add_users', 'users', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(20, 'delete_users', 'users', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(21, 'browse_settings', 'settings', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(22, 'read_settings', 'settings', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(23, 'edit_settings', 'settings', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(24, 'add_settings', 'settings', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(25, 'delete_settings', 'settings', '2020-04-11 17:25:39', '2020-04-11 17:25:39'),
(41, 'browse_hooks', NULL, '2020-04-11 17:25:50', '2020-04-11 17:25:50'),
(47, 'browse_templates', 'templates', '2020-04-11 17:32:39', '2020-04-11 17:32:39'),
(48, 'read_templates', 'templates', '2020-04-11 17:32:39', '2020-04-11 17:32:39'),
(49, 'edit_templates', 'templates', '2020-04-11 17:32:39', '2020-04-11 17:32:39'),
(50, 'add_templates', 'templates', '2020-04-11 17:32:39', '2020-04-11 17:32:39'),
(51, 'delete_templates', 'templates', '2020-04-11 17:32:39', '2020-04-11 17:32:39'),
(52, 'browse_categories', 'categories', '2020-04-19 22:46:05', '2020-04-19 22:46:05'),
(53, 'read_categories', 'categories', '2020-04-19 22:46:05', '2020-04-19 22:46:05'),
(54, 'edit_categories', 'categories', '2020-04-19 22:46:05', '2020-04-19 22:46:05'),
(55, 'add_categories', 'categories', '2020-04-19 22:46:05', '2020-04-19 22:46:05'),
(56, 'delete_categories', 'categories', '2020-04-19 22:46:05', '2020-04-19 22:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(41, 1),
(47, 1),
(48, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-04-11 17:25:37', '2020-04-11 17:25:37'),
(2, 'user', 'Normal User', '2020-04-11 17:25:37', '2020-04-11 17:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\April2020\\CR0qrvN3xODUzdnGLQzq.jpg', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-04-11 17:25:47', '2020-04-11 17:25:47'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-04-11 17:25:48', '2020-04-11 17:25:48'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-04-11 17:25:49', '2020-04-11 17:25:49'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-04-11 17:25:49', '2020-04-11 17:25:49'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-04-11 17:25:49', '2020-04-11 17:25:49'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-04-11 17:25:49', '2020-04-11 17:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/logo.jpg',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '0612345678',
  `primaryColor` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT '#00295d',
  `secondaryColor` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT '#00295d'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `logo`, `phone`, `primaryColor`, `secondaryColor`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$vTxsCJRzUW1TINpOjTP.quHyWtNbzefBkFGg0UfGhZAOFrVAHkTJO', 'AhdjP41DcjFbRteGQpHEeTPyzlUrPQj3lxF0CscwrKjL0a5eNrOaUyrUE40O', NULL, '2020-04-11 17:25:44', '2020-04-11 17:25:44', 'users/logo.jpg', '0612345678', '#00295d', '#00295d'),
(4, 2, 'ayyoub', 'soufiayyoub@gmail.com', 'users/default.png', NULL, '$2y$10$UZGF.nF7BkYoDSfBkb0Ws.yXD743VoYyAwGVympang18gcMXirote', NULL, '{\"locale\":\"en\"}', '2020-04-22 19:05:53', '2020-05-28 21:51:09', 'users/1590702669.jpg', '0612345678', '#00295d', '#00295d'),
(5, 2, 'abdelali', 'abdelali@gmail.com', 'users/default.png', NULL, '$2y$10$kvHOdUur4.sidgD0xaBFauzTwrwiSqjJoUjQ5pxb0bvFHNKqQT3ei', NULL, '{\"locale\":\"en\"}', '2020-05-23 02:46:24', '2020-05-23 02:46:24', 'users/logo.jpg', '0612345678', '#00295d', '#00295d');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
