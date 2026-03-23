-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2026. Már 23. 09:38
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
  `elhunyt_id` bigint(20) UNSIGNED NOT NULL,
  `hossza` int(11) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `befizetes`
--

INSERT INTO `befizetes` (`id`, `sirberlo_id`, `osszeg`, `elhunyt_id`, `hossza`, `datum`, `created_at`, `updated_at`) VALUES
(1, 1, 12000.00, 1, 10, '2024-01-10', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 2, 15000.00, 2, 10, '2024-02-12', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 3, 18000.00, 3, 10, '2024-03-05', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 4, 20000.00, 4, 10, '2024-03-19', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 5, 16000.00, 5, 10, '2024-04-03', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 6, 14000.00, 6, 10, '2024-04-21', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 7, 13000.00, 7, 10, '2024-05-06', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 8, 15500.00, 8, 10, '2024-05-23', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 9, 17000.00, 9, 10, '2024-06-12', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 10, 19000.00, 10, 10, '2024-06-30', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 11, 21000.00, 11, 10, '2024-07-15', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 12, 12500.00, 12, 10, '2024-07-29', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 13, 13500.00, 13, 10, '2024-08-11', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 14, 14500.00, 14, 10, '2024-08-25', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 15, 16500.00, 15, 10, '2024-09-06', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 16, 17500.00, 16, 10, '2024-09-21', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 17, 18500.00, 17, 10, '2024-10-02', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 18, 19500.00, 18, 10, '2024-10-19', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 19, 20500.00, 19, 10, '2024-11-03', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 20, 21500.00, 20, 10, '2024-11-21', '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 2, 1, 'bérleti_szerződés', '2024-01-10', 'Bérleti szerződés', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 3, 2, 'befizetési_bizonylat', '2024-02-12', 'Befizetési bizonylat', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 5, 3, 'engedély', '2024-03-05', 'Temetési engedély', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 6, 4, 'bérleti_szerződés', '2024-03-19', 'Megújítás', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 8, 5, 'befizetési_bizonylat', '2024-04-03', 'Éves díj', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 9, 6, 'engedély', '2024-04-21', 'Áthelyezés engedély', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 11, 7, 'bérleti_szerződés', '2024-05-06', 'Új bérlet', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 12, 8, 'befizetési_bizonylat', '2024-05-23', 'Éves díj', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 14, 9, 'engedély', '2024-06-12', 'Temetési engedély', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 15, 10, 'bérleti_szerződés', '2024-06-30', 'Bérleti szerződés', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 17, 11, 'befizetési_bizonylat', '2024-07-15', 'Éves díj', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 18, 12, 'engedély', '2024-07-29', 'Temetési engedély', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 20, 13, 'bérleti_szerződés', '2024-08-11', 'Bérleti szerződés', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 1, 14, 'befizetési_bizonylat', '2024-08-25', 'Éves díj', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 4, 15, 'engedély', '2024-09-06', 'Áthelyezés engedély', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 7, 16, 'bérleti_szerződés', '2024-09-21', 'Bérleti szerződés', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 10, 17, 'befizetési_bizonylat', '2024-10-02', 'Éves díj', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 13, 18, 'engedély', '2024-10-19', 'Temetési engedély', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 16, 19, 'bérleti_szerződés', '2024-11-03', 'Bérleti szerződés', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 19, 20, 'befizetési_bizonylat', '2024-11-21', 'Éves díj', '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 'bérleti_szerződés', 1, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 'befizetési_bizonylat', 2, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 'engedély', 3, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 'bérleti_szerződés', 4, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 'befizetési_bizonylat', 5, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 'engedély', 6, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 'bérleti_szerződés', 7, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 'befizetési_bizonylat', 8, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 'engedély', 9, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 'bérleti_szerződés', 10, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 'befizetési_bizonylat', 11, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 'engedély', 12, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 'bérleti_szerződés', 13, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 'befizetési_bizonylat', 14, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 'engedély', 15, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 'bérleti_szerződés', 16, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 'befizetési_bizonylat', 17, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 'engedély', 18, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 'bérleti_szerződés', 19, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 'befizetési_bizonylat', 20, '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 'Nagy István', '1950-02-01', '2024-01-15', '2024-01-20', 'Kiss Ilona', 2, 'HK-0001', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 'Kovács Mária', '1948-03-12', '2024-02-10', '2024-02-15', 'Nagy Anna', 3, 'HK-0002', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 'Tóth József', '1960-04-05', '2024-03-01', '2024-03-06', 'Horváth Éva', 5, 'HK-0003', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 'Szabó Éva', '1955-05-20', '2024-03-18', '2024-03-22', 'Varga Mária', 6, 'HK-0004', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 'Varga Péter', '1945-06-11', '2024-04-02', '2024-04-07', 'Fekete Katalin', 8, 'HK-0005', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 'Horváth Ilona', '1952-07-09', '2024-04-20', '2024-04-25', 'Bíró Anna', 9, 'HK-0006', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 'Balogh Lajos', '1939-08-30', '2024-05-05', '2024-05-10', 'Papp Ilona', 11, 'HK-0007', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 'Farkas Ágnes', '1965-09-14', '2024-05-22', '2024-05-27', 'Kiss Anna', 12, 'HK-0008', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 'Papp János', '1958-10-02', '2024-06-11', '2024-06-16', 'Molnár Éva', 14, 'HK-0009', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 'Molnár Zsuzsa', '1940-11-19', '2024-06-30', '2024-07-05', 'Szabó Ilona', 15, 'HK-0010', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 'Fekete Ferenc', '1938-12-25', '2024-07-14', '2024-07-20', 'Tóth Mária', 17, 'HK-0011', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 'Szalai Márta', '1951-01-08', '2024-07-28', '2024-08-02', 'Varga Éva', 18, 'HK-0012', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 'Oláh Gábor', '1947-02-17', '2024-08-10', '2024-08-15', 'Kovács Ilona', 20, 'HK-0013', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 'Lakatos Júlia', '1959-03-21', '2024-08-24', '2024-08-29', 'Nagy Mária', 1, 'HK-0014', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 'Bíró László', '1963-04-09', '2024-09-05', '2024-09-10', 'Fekete Anna', 4, 'HK-0015', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 'Kis Klára', '1949-05-16', '2024-09-20', '2024-09-25', 'Horváth Ilona', 7, 'HK-0016', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 'Takács András', '1937-06-13', '2024-10-01', '2024-10-06', 'Balogh Mária', 10, 'HK-0017', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 'Gulyás Katalin', '1956-07-27', '2024-10-18', '2024-10-23', 'Papp Ilona', 13, 'HK-0018', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 'Somogyi Béla', '1944-08-03', '2024-11-02', '2024-11-07', 'Molnár Katalin', 16, 'HK-0019', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 'Kelemen Róbert', '1961-09-29', '2024-11-20', '2024-11-25', 'Szabó Anna', 19, 'HK-0020', '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 'utca', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 'út', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 'tér', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 'körút', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 'sétány', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 'köz', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 'sor', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 'dűlő', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 'park', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 'rakpart', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 'liget', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 'kör', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 'sugárút', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 'kert', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 'fasor', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 'alsó', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 'felső', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 'telep', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 'híd', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 'udvar', '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(6, '2025_12_17_140735_create_personal_access_tokens_table', 6),
(7, '2025_12_05_070700_create_telepules_table', 7),
(8, '2025_12_05_092803_create_kozterulet_tipuses_table', 8),
(9, '2025_12_04_120508_create_sirberlos_table', 9),
(10, '2026_02_19_093922_add_telefonszam_to_sirberlo', 10),
(11, '2025_12_05_093040_create_parcelas_table', 11),
(12, '2025_12_05_093115_create_sors_table', 12),
(13, '2025_12_04_110507_create_sirhelys_table', 13),
(14, '2025_12_04_121631_create_dokumentums_table', 14),
(15, '2025_12_05_092501_create_dokumentum_tipuses_table', 15),
(16, '2025_12_04_121328_create_elhunyts_table', 16),
(17, '2026_03_03_161849_alter_elhunytak_halotti_kiv_to_string', 17),
(18, '2025_12_05_093222_create_sirhely_tipuses_table', 18),
(19, '2025_12_05_093340_create_befizetes_table', 19);

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
(1, 'Zalai parcella', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 'Bótai parcella', '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 'App\\Models\\User', 1, 'auth', 'e7c4ff0a09e9fd6579e78efe865519e5ae4269e5735d01ed51a756de4c3816a9', '[\"*\"]', NULL, NULL, '2026-03-23 07:36:13', '2026-03-23 07:36:13');

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
  `hazszam` varchar(255) NOT NULL,
  `kozterulet_tipus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `telepules_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirberlo`
--

INSERT INTO `sirberlo` (`id`, `nev`, `email_cim`, `telefonszam`, `kozterulet_neve`, `hazszam`, `kozterulet_tipus_id`, `telepules_id`, `created_at`, `updated_at`) VALUES
(1, 'Kiss Ádám', 'kiss.adam@example.com', '+361111111', 'Fő', '1', 1, 1, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 'Nagy Éva', 'nagy.eva@example.com', '+362222222', 'Petőfi', '2', 2, 2, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 'Tóth Béla', 'toth.bela@example.com', '+363333333', 'Kossuth', '3', 3, 3, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 'Szabó Kata', 'szabo.kata@example.com', '+364444444', 'Rákóczi', '4', 4, 4, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 'Varga László', 'varga.l@example.com', '+365555555', 'Bartók', '5', 5, 5, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 'Horváth Anna', 'horvath.anna@example.com', '+366666666', 'Ady', '6', 6, 6, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 'Kovács Zoltán', 'kovacs.z@example.com', '+367777777', 'Damjanich', '7', 7, 7, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 'Balogh Mária', 'balogh.m@example.com', '+368888888', 'Deák', '8', 8, 8, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 'Farkas Péter', 'farkas.p@example.com', '+369999999', 'József', '9', 9, 9, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 'Papp Júlia', 'papp.j@example.com', '+361010101', 'Bajcsy', '10', 10, 10, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 'Molnár Gábor', 'molnar.g@example.com', '+361111112', 'Móricz', '11', 11, 11, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 'Fekete Lilla', 'fekete.l@example.com', '+361111113', 'Táncsics', '12', 12, 12, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 'Szalai Imre', 'szalai.i@example.com', '+361111114', 'Széchenyi', '13', 13, 13, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 'Oláh Nóra', 'olah.n@example.com', '+361111115', 'Erzsébet', '14', 14, 14, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 'Lakatos Tamás', 'lakatos.t@example.com', '+361111116', 'Vörösmarty', '15', 15, 15, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 'Bíró Eszter', 'biro.e@example.com', '+361111117', 'Kisfaludy', '16', 16, 16, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 'Kis Róbert', 'kis.r@example.com', '+361111118', 'Jókai', '17', 17, 17, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 'Takács Zsófia', 'takacs.z@example.com', '+361111119', 'Dózsa', '18', 18, 18, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 'Gulyás András', 'gulyas.a@example.com', '+361111120', 'Szent István', '19', 19, 19, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 'Somogyi Rita', 'somogyi.r@example.com', '+361111121', 'Arany', '20', 20, 20, '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 1, 'A-01', 'egyes', 'szabad', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA3jDHp_Zf_npVs9zDrGel0m-GFa9JlMhR4Q&s', 1, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 2, 'A-02', 'kettes', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 2, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 3, 'A-03', 'urnas', 'foglalt', 'https://i.pinimg.com/originals/e9/86/62/e986629a5382102c603e831f1ed6e88f.jpg', 3, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 4, 'A-04', 'egyes', 'szabad', 'https://upload.wikimedia.org/wikipedia/commons/6/64/Vask%C3%BAt%2C_Pechlof_M%C3%A1ty%C3%A1s%2C_luxus_s%C3%ADrhely_96.jpg', 4, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 5, 'A-05', 'kettes', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 5, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 6, 'A-06', 'urnas', 'foglalt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMJGalwGecwBAQue6SmVPLHWmZzTOtWv7icg&s', 6, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 7, 'A-07', 'egyes', 'szabad', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 7, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 8, 'A-08', 'kettes', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 8, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 9, 'A-09', 'urnas', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 9, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 10, 'A-10', 'egyes', 'szabad', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 10, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 11, 'A-11', 'kettes', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 11, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 12, 'A-12', 'urnas', 'foglalt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 12, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 13, 'A-13', 'egyes', 'szabad', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 13, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 14, 'A-14', 'kettes', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 14, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 15, 'A-15', 'urnas', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 15, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 16, 'A-16', 'egyes', 'szabad', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 16, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 17, 'A-17', 'kettes', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 17, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 18, 'A-18', 'urnas', 'foglalt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 18, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 19, 'A-19', 'egyes', 'szabad', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 19, '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 20, 'A-20', 'kettes', 'foglalt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 20, '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 1, 'egyes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 2, 'kettes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 3, 'urnas', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 4, 'egyes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 5, 'kettes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 6, 'urnas', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 7, 'egyes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 8, 'kettes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 9, 'urnas', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 10, 'egyes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 11, 'kettes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 12, 'urnas', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 13, 'egyes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 14, 'kettes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 15, 'urnas', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 16, 'egyes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 17, 'kettes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 18, 'urnas', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 19, 'egyes', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 20, 'kettes', '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 1, 'Sor 1', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(2, 1, 'Sor 2', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(3, 1, 'Sor 3', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(4, 1, 'Sor 4', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(5, 1, 'Sor 5', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(6, 1, 'Sor 6', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(7, 1, 'Sor 7', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(8, 1, 'Sor 8', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(9, 1, 'Sor 9', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(10, 1, 'Sor 10', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(11, 2, 'Sor 11', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(12, 2, 'Sor 12', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(13, 2, 'Sor 13', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(14, 2, 'Sor 14', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(15, 2, 'Sor 15', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(16, 2, 'Sor 16', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(17, 2, 'Sor 17', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(18, 2, 'Sor 18', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(19, 2, 'Sor 19', '2026-03-23 08:24:50', '2026-03-23 08:24:50'),
(20, 2, 'Sor 20', '2026-03-23 08:24:50', '2026-03-23 08:24:50');

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
(1, 1000, 'Budapest', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(2, 2000, 'Szentendre', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(3, 3000, 'Eger', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(4, 4000, 'Debrecen', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(5, 5000, 'Szolnok', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(6, 6000, 'Kecskemét', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(7, 7000, 'Szeged', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(8, 8000, 'Székesfehérvár', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(9, 9000, 'Győr', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(10, 1011, 'Budapest I.', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(11, 1111, 'Budapest XI.', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(12, 1212, 'Budapest XII.', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(13, 2222, 'Esztergom', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(14, 3300, 'Hatvan', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(15, 4400, 'Nyíregyháza', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(16, 5555, 'Pécs', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(17, 6666, 'Miskolc', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(18, 7777, 'Siófok', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(19, 8888, 'Veszprém', '2026-03-23 08:24:50', '2026-03-23 08:32:55'),
(20, 9999, 'Zalaegerszeg', '2026-03-23 08:24:50', '2026-03-23 08:32:55');

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
(1, 'Admin', 'Admin', '$2y$12$yzq7yf/7Vd7Rn45HuMVAA.D95elWK0ZDrePg0wD2BZ1S25TOt6JgK', 'admin', NULL, NULL, NULL, NULL, '2026-03-23 07:06:50', '2026-03-23 07:06:50');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `befizetes`
--
ALTER TABLE `befizetes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `befizetes_sirberlo_id_foreign` (`sirberlo_id`),
  ADD KEY `befizetes_elhunyt_id_foreign` (`elhunyt_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `dokumentum`
--
ALTER TABLE `dokumentum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `elhunyt`
--
ALTER TABLE `elhunyt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `parcella`
--
ALTER TABLE `parcella`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `sirberlo`
--
ALTER TABLE `sirberlo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `sirhely`
--
ALTER TABLE `sirhely`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `sor`
--
ALTER TABLE `sor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `telepules`
--
ALTER TABLE `telepules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  ADD CONSTRAINT `befizetes_elhunyt_id_foreign` FOREIGN KEY (`elhunyt_id`) REFERENCES `elhunyt` (`id`) ON DELETE CASCADE,
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
