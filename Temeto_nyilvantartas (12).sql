-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2026. Már 17. 19:46
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `Temeto_nyilvantartas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `befizetes`
--

CREATE TABLE `befizetes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sirberlo_id` bigint(20) UNSIGNED NOT NULL,
  `osszeg` decimal(10,2) NOT NULL,
  `hossza` int(11) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `befizetes`
--

INSERT INTO `befizetes` (`id`, `sirberlo_id`, `osszeg`, `hossza`, `datum`, `created_at`, `updated_at`) VALUES
(1, 1, 35000.00, 25, '2023-01-15', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 2, 42000.00, 25, '2023-02-10', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 3, 38000.00, 20, '2022-09-20', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 4, 30000.00, 15, '2022-11-28', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 5, 50000.00, 25, '2021-07-05', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 6, 28000.00, 10, '2021-03-20', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 7, 36000.00, 20, '2020-06-02', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 8, 41000.00, 25, '2020-08-28', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 9, 33000.00, 15, '2019-04-20', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 10, 39000.00, 20, '2019-12-15', '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dokumentum`
--

CREATE TABLE `dokumentum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sirhely_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sirberlo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipus` varchar(255) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `leiras` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dokumentum`
--

INSERT INTO `dokumentum` (`id`, `sirhely_id`, `sirberlo_id`, `tipus`, `datum`, `leiras`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'bérleti szerződés', '2023-01-10', 'Sírhely bérleti szerződés', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 2, 2, 'befizetési bizonylat', '2023-02-05', 'Befizetés igazolása', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 3, 3, 'engedély', '2022-09-12', 'Temetési engedély', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 4, 4, 'bérleti szerződés', '2022-11-20', 'Sírhely bérleti szerződés', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 5, 5, 'befizetési bizonylat', '2021-07-01', 'Befizetés igazolása', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 6, 6, 'engedély', '2021-03-15', 'Temetési engedély', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 7, 7, 'bérleti szerződés', '2020-05-30', 'Sírhely bérleti szerződés', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 8, 8, 'befizetési bizonylat', '2020-08-22', 'Befizetés igazolása', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 9, 9, 'engedély', '2019-04-12', 'Temetési engedély', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 10, 10, 'bérleti szerződés', '2019-12-10', 'Sírhely bérleti szerződés', '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dokumentum_tipus`
--

CREATE TABLE `dokumentum_tipus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipus_elnevezese` varchar(255) NOT NULL,
  `dokumentum_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dokumentum_tipus`
--

INSERT INTO `dokumentum_tipus` (`id`, `tipus_elnevezese`, `dokumentum_id`, `created_at`, `updated_at`) VALUES
(1, 'szerződés', 1, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 'bizonylat', 2, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 'engedély', 3, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 'szerződés', 4, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 'bizonylat', 5, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 'engedély', 6, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 'szerződés', 7, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 'bizonylat', 8, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 'engedély', 9, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 'szerződés', 10, '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elhunyt`
--

CREATE TABLE `elhunyt` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `szul_datum` date DEFAULT NULL,
  `halal_datuma` date DEFAULT NULL,
  `temetes_datuma` date DEFAULT NULL,
  `anyja_neve` varchar(255) DEFAULT NULL,
  `sirhely_id` bigint(20) UNSIGNED DEFAULT NULL,
  `halotti_anyakonyvi_kiv` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `elhunyt`
--

INSERT INTO `elhunyt` (`id`, `nev`, `szul_datum`, `halal_datuma`, `temetes_datuma`, `anyja_neve`, `sirhely_id`, `halotti_anyakonyvi_kiv`, `created_at`, `updated_at`) VALUES
(1, 'Kiss Imre', '1940-01-12', '2023-10-05', '2023-10-12', 'Nagy Ilona', 1, 'HK-0001', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 'Nagy Mária', '1938-04-22', '2022-08-11', '2022-08-18', 'Kovács Anna', 2, 'HK-0002', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 'Szabó László', '1950-05-03', '2021-06-15', '2021-06-22', 'Tóth Julianna', 3, 'HK-0003', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 'Tóth Katalin', '1945-09-14', '2020-12-01', '2020-12-08', 'Varga Éva', 4, 'HK-0004', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 'Varga Ferenc', '1935-02-27', '2019-11-20', '2019-11-27', 'Horváth Ilona', 5, 'HK-0005', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 'Horváth Erika', '1948-07-19', '2018-03-02', '2018-03-09', 'Farkas Mária', 6, 'HK-0006', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 'Farkas András', '1955-11-30', '2017-05-10', '2017-05-17', 'Balogh Éva', 7, 'HK-0007', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 'Kovács Pál', '1960-08-08', '2016-04-14', '2016-04-21', 'Molnár Ilona', 8, 'HK-0008', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 'Balogh Lajos', '1939-12-25', '2015-02-12', '2015-02-19', 'Kiss Mária', 9, 'HK-0009', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 'Molnár József', '1942-06-06', '2014-01-22', '2014-01-29', 'Nagy Julianna', 10, 'HK-0010', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(11, 'OOláhh Zooolii', '1595-02-08', '2026-03-16', NULL, 'Puzsér Róbert', 1, NULL, '2026-03-17 17:22:58', '2026-03-17 17:22:58'),
(12, 'Bartos István', '1497-03-16', '2026-03-16', NULL, 'Kiss Nagy Enikő', 4, NULL, '2026-03-17 17:26:00', '2026-03-17 17:26:00'),
(14, 'Füty Imre', '1941-03-17', '2026-03-04', NULL, 'Bekő Tóni', 1, NULL, '2026-03-17 17:36:20', '2026-03-17 17:36:20'),
(15, 'Nyelő Béla', '1856-01-14', '2026-03-08', NULL, 'Nyaló Márta', 1, NULL, '2026-03-17 17:38:33', '2026-03-17 17:38:33'),
(16, 'Menő Manó', '1948-04-09', '2025-12-18', NULL, 'Menő Alexandra', NULL, '', '2026-03-17 17:39:03', '2026-03-17 17:41:24'),
(17, 'Bekre Pál', '1969-01-02', '2025-11-07', NULL, 'Kikre Pálné', NULL, '', '2026-03-17 17:39:23', '2026-03-17 17:40:37'),
(18, 'Fiká Zoltán', '1938-01-18', '2026-03-10', NULL, 'Fiká Enikő', 5, NULL, '2026-03-17 17:42:21', '2026-03-17 17:42:21'),
(19, 'Cicc Imre', '1942-02-19', '2026-03-11', NULL, 'Kukor Ica', 2, NULL, '2026-03-17 17:45:23', '2026-03-17 17:45:23');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
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
-- Tábla szerkezet ehhez a táblához `jobs`
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
-- Tábla szerkezet ehhez a táblához `job_batches`
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
-- Tábla szerkezet ehhez a táblához `kozterulet_tipus`
--

CREATE TABLE `kozterulet_tipus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `kozterulet_tipus`
--

INSERT INTO `kozterulet_tipus` (`id`, `nev`, `created_at`, `updated_at`) VALUES
(1, 'utca', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 'út', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 'tér', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 'körút', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 'köz', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 'sétány', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 'dűlő', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 'fasor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 'lakótelep', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 'sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 2),
(3, '0001_01_01_000002_create_jobs_table', 3),
(4, '2025_08_26_100418_add_two_factor_columns_to_users_table', 4),
(5, '2026_01_29_173743_add_role_to_users_table', 5),
(6, '2025_12_05_070700_create_telepules_table', 6),
(7, '2025_12_05_092803_create_kozterulet_tipuses_table', 7),
(8, '2025_12_05_093040_create_parcelas_table', 8),
(9, '2025_12_05_093115_create_sors_table', 9),
(10, '2025_12_04_120508_create_sirberlos_table', 10),
(11, '2025_12_04_110507_create_sirhelys_table', 11),
(12, '2025_12_05_093222_create_sirhely_tipuses_table', 12),
(13, '2025_12_04_121631_create_dokumentums_table', 13),
(14, '2025_12_05_092501_create_dokumentum_tipuses_table', 14),
(15, '2025_12_04_121328_create_elhunyts_table', 15),
(16, '2025_12_05_093340_create_befizetes_table', 16),
(17, '2026_02_19_093922_add_telefonszam_to_sirberlo', 17),
(18, '2026_03_03_161849_alter_elhunytak_halotti_kiv_to_string', 18),
(19, '2025_12_17_140735_create_personal_access_tokens_table', 19);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `parcella`
--

CREATE TABLE `parcella` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `parcella`
--

INSERT INTO `parcella` (`id`, `nev`, `created_at`, `updated_at`) VALUES
(1, 'A parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 'B parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 'C parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 'D parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 'E parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 'F parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 'G parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 'H parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 'I parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 'J parcella', '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth', '2c054330386e3617399d8a1a174f63235c45f8cb74c7df4476405bfab2f15cd7', '[\"*\"]', NULL, NULL, '2026-03-16 16:43:43', '2026-03-16 16:43:43'),
(2, 'App\\Models\\User', 1, 'auth', '9a14f51aa1b57916a12e2c476abdd5d7eabc6a47fcc1389ef2b41bde601d9fa1', '[\"*\"]', NULL, NULL, '2026-03-16 18:17:24', '2026-03-16 18:17:24'),
(3, 'App\\Models\\User', 1, 'auth', '73a8b6098f474102805c73582e1758c1cc7dc6c19a637af49572829626a89d60', '[\"*\"]', NULL, NULL, '2026-03-17 17:20:30', '2026-03-17 17:20:30'),
(4, 'App\\Models\\User', 1, 'auth', 'a9123bcaae452a6e5e0c5f5b9b3098857c60d4a7f31e3064a63d9e5db6d89baf', '[\"*\"]', NULL, NULL, '2026-03-17 17:34:32', '2026-03-17 17:34:32');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sirberlo`
--

CREATE TABLE `sirberlo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `email_cim` varchar(255) NOT NULL,
  `telefonszam` varchar(255) DEFAULT NULL,
  `kozterulet_neve` varchar(255) NOT NULL,
  `kozterulet_tipus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `telepules_id` bigint(20) UNSIGNED NOT NULL,
  `ir_szam` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirberlo`
--

INSERT INTO `sirberlo` (`id`, `nev`, `email_cim`, `telefonszam`, `kozterulet_neve`, `kozterulet_tipus_id`, `telepules_id`, `ir_szam`, `created_at`, `updated_at`) VALUES
(1, 'Kiss János', 'kiss.janos@example.com', '06701234567', 'Kossuth', 1, 1, 8900, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 'Nagy Éva', 'nagy.eva@example.com', '06701234568', 'Petőfi', 1, 2, 8790, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 'Szabó Péter', 'szabo.peter@example.com', '06701234569', 'Rákóczi', 2, 3, 8902, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 'Tóth Anna', 'toth.anna@example.com', '06701234570', 'Ady', 1, 4, 8932, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 'Varga Béla', 'varga.bela@example.com', '06701234571', 'Deák', 3, 5, 8913, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 'Horváth Zsuzsa', 'horvath.zsuzsa@example.com', '06701234572', 'Széchenyi', 1, 6, 8907, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 'Farkas Gábor', 'farkas.gabor@example.com', '06701234573', 'Arany', 5, 7, 8795, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 'Kovács Laura', 'kovacs.laura@example.com', '06701234574', 'József', 6, 8, 8891, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 'Balogh István', 'balogh.istvan@example.com', '06701234575', 'Szabadság', 4, 9, 8782, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 'Molnár Dóra', 'molnar.dora@example.com', '06701234576', 'Béke', 10, 10, 8983, '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sirhely`
--

CREATE TABLE `sirhely` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sor_id` bigint(20) UNSIGNED NOT NULL,
  `sirkod` varchar(255) NOT NULL,
  `tipus` varchar(255) NOT NULL,
  `allapot` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `sirberlo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirhely`
--

INSERT INTO `sirhely` (`id`, `sor_id`, `sirkod`, `tipus`, `allapot`, `foto`, `sirberlo_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'A-01', 'egyedi', 'foglalt', NULL, 1, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 2, 'B-02', 'urnás', 'foglalt', NULL, 2, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 3, 'C-03', 'kettős', 'foglalt', NULL, 3, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 4, 'D-04', 'egyedi', 'szabad', NULL, 4, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 5, 'E-05', 'urnás', 'foglalt', NULL, 5, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 6, 'F-06', 'egyedi', 'szabad', NULL, 6, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 7, 'G-07', 'kettős', 'foglalt', NULL, 7, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 8, 'H-08', 'urnás', 'szabad', NULL, 8, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 9, 'I-09', 'egyedi', 'foglalt', NULL, 9, '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 10, 'J-10', 'kettős', 'foglalt', NULL, 10, '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sirhely_tipus`
--

CREATE TABLE `sirhely_tipus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sirhely_id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirhely_tipus`
--

INSERT INTO `sirhely_tipus` (`id`, `sirhely_id`, `nev`, `created_at`, `updated_at`) VALUES
(1, 1, 'kő sír', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 2, 'urna', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 3, 'kettős sír', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 4, 'föld sír', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 5, 'urna', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 6, 'föld sír', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 7, 'kettős sír', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 8, 'urna', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 9, 'kő sír', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 10, 'kettős sír', '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sor`
--

CREATE TABLE `sor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parcella_id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sor`
--

INSERT INTO `sor` (`id`, `parcella_id`, `nev`, `created_at`, `updated_at`) VALUES
(1, 1, '1. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 2, '2. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 3, '3. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 4, '4. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 5, '5. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 6, '6. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 7, '7. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 8, '8. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 9, '9. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 10, '10. sor', '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `telepules`
--

CREATE TABLE `telepules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ir_szam` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `telepules`
--

INSERT INTO `telepules` (`id`, `ir_szam`, `nev`, `created_at`, `updated_at`) VALUES
(1, 8900, 'Zalaegerszeg', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(2, 8790, 'Zalaszentgrót', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(3, 8902, 'Zalaegerszeg-Andráshida', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(4, 8932, 'Nagykutas', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(5, 8913, 'Egervár', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(6, 8907, 'Zalaegerszeg-Ola', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(7, 8795, 'Zalacsány', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(8, 8891, 'Teskánd', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(9, 8782, 'Zalalövő', '2026-03-16 19:21:14', '2026-03-16 19:21:14'),
(10, 8983, 'Becsvölgye', '2026-03-16 19:21:14', '2026-03-16 19:21:14');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Boldizsár', 'Admin', '$2y$12$UkIWPC3UiUaCftCnRH2vouzJwqBzLMsmJyeKcpEzMimIDQn3b1HgO', 'admin', NULL, NULL, NULL, NULL, '2026-03-16 16:24:40', '2026-03-16 16:24:40');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `befizetes`
--
ALTER TABLE `befizetes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `befizetes_sirberlo_id_foreign` (`sirberlo_id`);

--
-- A tábla indexei `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- A tábla indexei `dokumentum`
--
ALTER TABLE `dokumentum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokumentum_sirhely_id_foreign` (`sirhely_id`),
  ADD KEY `dokumentum_sirberlo_id_foreign` (`sirberlo_id`);

--
-- A tábla indexei `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokumentum_tipus_dokumentum_id_foreign` (`dokumentum_id`);

--
-- A tábla indexei `elhunyt`
--
ALTER TABLE `elhunyt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elhunyt_sirhely_id_foreign` (`sirhely_id`),
  ADD KEY `elhunyt_halotti_anyakonyvi_kiv_foreign` (`halotti_anyakonyvi_kiv`);

--
-- A tábla indexei `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- A tábla indexei `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- A tábla indexei `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `kozterulet_tipus`
--
ALTER TABLE `kozterulet_tipus`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `parcella`
--
ALTER TABLE `parcella`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- A tábla indexei `sirberlo`
--
ALTER TABLE `sirberlo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sirberlo_kozterulet_tipus_id_foreign` (`kozterulet_tipus_id`),
  ADD KEY `sirberlo_telepules_id_foreign` (`telepules_id`);

--
-- A tábla indexei `sirhely`
--
ALTER TABLE `sirhely`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sirhely_sirkod_unique` (`sirkod`),
  ADD KEY `sirhely_sor_id_foreign` (`sor_id`),
  ADD KEY `sirhely_sirberlo_id_foreign` (`sirberlo_id`);

--
-- A tábla indexei `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sirhely_tipus_sirhely_id_foreign` (`sirhely_id`);

--
-- A tábla indexei `sor`
--
ALTER TABLE `sor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sor_parcella_id_foreign` (`parcella_id`);

--
-- A tábla indexei `telepules`
--
ALTER TABLE `telepules`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_role_index` (`role`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `befizetes`
--
ALTER TABLE `befizetes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `dokumentum`
--
ALTER TABLE `dokumentum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `elhunyt`
--
ALTER TABLE `elhunyt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kozterulet_tipus`
--
ALTER TABLE `kozterulet_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `parcella`
--
ALTER TABLE `parcella`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `sirberlo`
--
ALTER TABLE `sirberlo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `sirhely`
--
ALTER TABLE `sirhely`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `sor`
--
ALTER TABLE `sor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `telepules`
--
ALTER TABLE `telepules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `befizetes`
--
ALTER TABLE `befizetes`
  ADD CONSTRAINT `befizetes_sirberlo_id_foreign` FOREIGN KEY (`sirberlo_id`) REFERENCES `sirberlo` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `dokumentum`
--
ALTER TABLE `dokumentum`
  ADD CONSTRAINT `dokumentum_sirberlo_id_foreign` FOREIGN KEY (`sirberlo_id`) REFERENCES `sirberlo` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dokumentum_sirhely_id_foreign` FOREIGN KEY (`sirhely_id`) REFERENCES `sirhely` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  ADD CONSTRAINT `dokumentum_tipus_dokumentum_id_foreign` FOREIGN KEY (`dokumentum_id`) REFERENCES `dokumentum` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `elhunyt`
--
ALTER TABLE `elhunyt`
  ADD CONSTRAINT `elhunyt_sirhely_id_foreign` FOREIGN KEY (`sirhely_id`) REFERENCES `sirhely` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `sirberlo`
--
ALTER TABLE `sirberlo`
  ADD CONSTRAINT `sirberlo_kozterulet_tipus_id_foreign` FOREIGN KEY (`kozterulet_tipus_id`) REFERENCES `kozterulet_tipus` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sirberlo_telepules_id_foreign` FOREIGN KEY (`telepules_id`) REFERENCES `telepules` (`id`);

--
-- Megkötések a táblához `sirhely`
--
ALTER TABLE `sirhely`
  ADD CONSTRAINT `sirhely_sirberlo_id_foreign` FOREIGN KEY (`sirberlo_id`) REFERENCES `sirberlo` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sirhely_sor_id_foreign` FOREIGN KEY (`sor_id`) REFERENCES `sor` (`id`);

--
-- Megkötések a táblához `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  ADD CONSTRAINT `sirhely_tipus_sirhely_id_foreign` FOREIGN KEY (`sirhely_id`) REFERENCES `sirhely` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `sor`
--
ALTER TABLE `sor`
  ADD CONSTRAINT `sor_parcella_id_foreign` FOREIGN KEY (`parcella_id`) REFERENCES `parcella` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
