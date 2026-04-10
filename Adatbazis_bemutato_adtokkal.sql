-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2026. Ápr 10. 19:02
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
(1, 1, 12000.00, 1, 1, '2025-01-15', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(2, 2, 12000.00, 2, 1, '2025-01-16', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(3, 3, 12000.00, 3, 1, '2025-01-17', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(4, 4, 12000.00, 4, 1, '2025-01-18', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(5, 5, 12000.00, 5, 1, '2025-01-19', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(6, 6, 12000.00, 6, 1, '2025-01-20', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(7, 7, 12000.00, 7, 1, '2025-01-21', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(8, 8, 12000.00, 8, 1, '2025-01-22', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(9, 9, 12000.00, 9, 1, '2025-01-23', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(10, 10, 12000.00, 10, 1, '2025-01-24', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(11, 11, 12000.00, 11, 1, '2025-01-25', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(12, 12, 12000.00, 12, 1, '2025-01-26', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(13, 13, 12000.00, 13, 1, '2025-01-27', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(14, 14, 12000.00, 14, 1, '2025-01-28', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(15, 15, 12000.00, 15, 1, '2025-01-29', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(16, 16, 12000.00, 16, 1, '2025-01-30', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(17, 17, 12000.00, 17, 1, '2025-02-01', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(18, 18, 12000.00, 18, 1, '2025-02-02', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(19, 19, 12000.00, 19, 1, '2025-02-03', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(20, 20, 12000.00, 20, 1, '2025-02-04', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(21, 21, 12000.00, 21, 1, '2025-02-05', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(22, 22, 12000.00, 22, 1, '2025-02-06', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(23, 23, 12000.00, 23, 1, '2025-02-07', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(24, 24, 12000.00, 24, 1, '2025-02-08', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(25, 25, 12000.00, 25, 1, '2025-02-09', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(26, 26, 12000.00, 26, 1, '2025-02-10', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(27, 27, 12000.00, 27, 1, '2025-02-11', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(28, 28, 12000.00, 28, 1, '2025-02-12', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(29, 29, 12000.00, 29, 1, '2025-02-13', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(30, 30, 12000.00, 30, 1, '2025-02-14', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(31, 31, 12000.00, 31, 1, '2025-02-15', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(32, 32, 12000.00, 32, 1, '2025-02-16', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(33, 33, 12000.00, 33, 1, '2025-02-17', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(34, 34, 12000.00, 34, 1, '2025-02-18', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(35, 35, 12000.00, 35, 1, '2025-02-19', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(36, 36, 12000.00, 36, 1, '2025-02-20', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(37, 37, 12000.00, 37, 1, '2025-02-21', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(38, 38, 12000.00, 38, 1, '2025-02-22', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(39, 39, 12000.00, 39, 1, '2025-02-23', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(40, 40, 12000.00, 40, 1, '2025-02-24', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(41, 41, 12000.00, 41, 1, '2025-02-25', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(42, 42, 12000.00, 42, 1, '2025-02-26', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(43, 43, 12000.00, 43, 1, '2025-02-27', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(44, 44, 12000.00, 44, 1, '2025-02-28', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(45, 45, 12000.00, 45, 1, '2025-03-01', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(46, 46, 12000.00, 46, 1, '2025-03-02', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(47, 47, 12000.00, 47, 1, '2025-03-03', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(48, 48, 12000.00, 48, 1, '2025-03-04', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(49, 49, 12000.00, 49, 1, '2025-03-05', '2026-04-10 16:37:27', '2026-04-10 16:37:27'),
(50, 50, 12000.00, 50, 1, '2025-03-06', '2026-04-10 16:37:27', '2026-04-10 16:37:27');

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
  `dokumentum_tipus_id` bigint(20) UNSIGNED NOT NULL,
  `tipus` varchar(255) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `leiras` text DEFAULT NULL,
  `fajl_utvonal` varchar(255) DEFAULT NULL,
  `eredeti_fajlnev` varchar(255) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dokumentum`
--

INSERT INTO `dokumentum` (`id`, `sirhely_id`, `sirberlo_id`, `dokumentum_tipus_id`, `tipus`, `datum`, `leiras`, `fajl_utvonal`, `eredeti_fajlnev`, `mime_type`, `created_at`, `updated_at`) VALUES
(31, 1, 1, 1, 'Sírhely megváltási szerződés', '2025-01-10', 'Éves megváltási szerződés', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(32, 2, 2, 2, 'Befizetési bizonylat', '2025-01-12', 'Befizetésről szóló igazolás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(33, 3, 3, 3, 'Halotti anyakönyvi kivonat', '2025-01-15', 'Halotti anyakönyvi kivonat másolat', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(34, 4, 4, 4, 'Temetési engedély', '2025-01-18', 'Temetési engedély rögzítése', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(35, 5, 5, 5, 'Hozzátartozói nyilatkozat', '2025-01-20', 'Kapcsolódó hozzátartozói nyilatkozat', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(36, 6, 6, 6, 'Sírhely hosszabbítási kérelem', '2025-01-22', 'Sírhely hosszabbítási kérelem', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(37, 7, 7, 7, 'Meghatalmazás', '2025-01-25', 'Ügyintézéshez adott meghatalmazás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(38, 8, 8, 8, 'Üzemeltetői igazolás', '2025-01-27', 'Üzemeltető által kiállított igazolás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(39, 9, 9, 9, 'Adatmódosítási kérelem', '2025-01-29', 'Személyes adatok módosítása', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(40, 10, 10, 10, 'Öröklési igazolás', '2025-02-01', 'Öröklési jogosultság igazolása', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(41, 11, 11, 1, 'Sírhely megváltási szerződés', '2025-02-03', 'Új sírhely szerződés', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(42, 12, 12, 2, 'Befizetési bizonylat', '2025-02-05', 'Díj befizetés igazolása', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(43, 13, 13, 3, 'Halotti anyakönyvi kivonat', '2025-02-08', 'Hiteles másolat', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(44, 14, 14, 4, 'Temetési engedély', '2025-02-10', 'Temetés adminisztrációs engedély', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(45, 15, 15, 5, 'Hozzátartozói nyilatkozat', '2025-02-12', 'Nyilatkozat rögzítése', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(46, 16, 16, 6, 'Sírhely hosszabbítási kérelem', '2025-02-14', 'Megváltás hosszabbítás kezdeményezés', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(47, 17, 17, 7, 'Meghatalmazás', '2025-02-16', 'Családtag részére adott meghatalmazás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(48, 18, 18, 8, 'Üzemeltetői igazolás', '2025-02-18', 'Karbantartási igazolás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(49, 19, 19, 9, 'Adatmódosítási kérelem', '2025-02-20', 'Névváltozás átvezetési kérelem', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(50, 20, 20, 10, 'Öröklési igazolás', '2025-02-22', 'Örökösi státusz igazolás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(51, 21, 21, 1, 'Sírhely megváltási szerződés', '2025-02-24', 'Parcella használati szerződés', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(52, 22, 22, 2, 'Befizetési bizonylat', '2025-02-26', 'Átutalási bizonylat adatai', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(53, 23, 23, 3, 'Halotti anyakönyvi kivonat', '2025-02-28', 'Kivonat digitalizált adatai', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(54, 24, 24, 4, 'Temetési engedély', '2025-03-02', 'Temetési időpont jóváhagyás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(55, 25, 25, 5, 'Hozzátartozói nyilatkozat', '2025-03-04', 'Kapcsolattartási nyilatkozat', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(56, 26, 26, 6, 'Sírhely hosszabbítási kérelem', '2025-03-06', 'Parcella hosszabbítás kérelem', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(57, 27, 27, 7, 'Meghatalmazás', '2025-03-08', 'Meghatalmazás iktatása', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(58, 28, 28, 8, 'Üzemeltetői igazolás', '2025-03-10', 'Üzemeltetői nyilvántartási igazolás', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(59, 29, 29, 9, 'Adatmódosítási kérelem', '2025-03-12', 'Adatjavítási kérelem', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44'),
(60, 30, 30, 10, 'Öröklési igazolás', '2025-03-14', 'Öröklési dokumentum rögzítése', NULL, NULL, NULL, '2026-04-10 16:39:44', '2026-04-10 16:39:44');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dokumentum_tipus`
--

CREATE TABLE `dokumentum_tipus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipus_elnevezese` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dokumentum_tipus`
--

INSERT INTO `dokumentum_tipus` (`id`, `tipus_elnevezese`, `created_at`, `updated_at`) VALUES
(1, 'Sírhely megváltási szerződés', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(2, 'Befizetési bizonylat', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(3, 'Halotti anyakönyvi kivonat', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(4, 'Temetési engedély', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(5, 'Hozzátartozói nyilatkozat', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(6, 'Sírhely hosszabbítási kérelem', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(7, 'Meghatalmazás', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(8, 'Üzemeltetői igazolás', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(9, 'Adatmódosítási kérelem', '2026-04-10 16:39:07', '2026-04-10 16:39:07'),
(10, 'Öröklési igazolás', '2026-04-10 16:39:07', '2026-04-10 16:39:07');

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
(1, 'Tóth Péter', '1986-09-10', '2001-06-17', '2001-06-18', 'Fehér Krisztina', 14, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(2, 'Mészáros János', '1943-12-18', '2009-05-30', '2009-06-04', 'Szalai Julianna', 72, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(3, 'Nagy János', '1939-05-03', '2003-01-14', '2003-01-18', 'Lakatos Orsolya', 5, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(4, 'Szabó Zsuzsanna', '1987-07-22', '2006-06-04', '2006-06-14', 'Fehér Ágnes', 11, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(5, 'Kovács Ferenc', '1977-10-01', '2003-03-10', '2003-03-18', 'Kiss Andrea', 72, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(6, 'Nagy Anna', '1963-06-30', '2023-01-31', '2023-02-02', 'Varga Beáta', 69, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(7, 'Nagy András', '2003-01-31', '2016-09-15', '2016-09-18', 'Horváth Zsuzsanna', 31, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(8, 'Rácz Mária', '1999-04-05', '2002-12-04', '2002-12-12', 'Molnár Julianna', 47, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(9, 'Takács Zoltán', '1990-10-21', '2025-10-22', '2025-10-28', 'Papp Krisztina', 64, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(10, 'Takács József', '1997-03-08', '2025-09-01', '2025-09-04', 'Nagy Ágnes', 10, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(11, 'Molnár Katalin', '1945-12-04', '2022-01-17', '2022-01-25', 'Varga Réka', 45, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(12, 'Rácz Gábor', '1979-10-01', '2012-04-27', '2012-05-02', 'Lakatos Noémi', 41, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(13, 'Kiss Krisztina', '2000-02-11', '2021-07-24', '2021-07-27', 'Szalai Réka', 31, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(14, 'Kiss Péter', '1945-03-24', '2002-12-20', '2002-12-22', 'Varga Réka', 20, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(15, 'Tóth Zsuzsanna', '2001-09-03', '2007-08-03', '2007-08-09', 'Simon Andrea', 11, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(16, 'Oláh Krisztina', '1982-12-29', '2014-05-29', '2014-06-05', 'Takács Éva', 32, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(17, 'Mészáros Judit', '1967-06-20', '2002-12-27', '2002-12-29', 'Németh Jolán', 45, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(18, 'Mészáros János', '1948-01-13', '2017-02-14', '2017-02-22', 'Lakatos Réka', 43, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(19, 'Mészáros Ilona', '1983-09-04', '2018-09-18', '2018-09-23', 'Szabó Andrea', 14, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(20, 'Takács Péter', '1950-05-21', '2009-12-08', '2009-12-11', 'Kovács Krisztina', 68, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(21, 'Nagy Mária', '1967-10-07', '2020-04-01', '2020-04-06', 'Fehér Zsuzsanna', 13, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(22, 'Farkas Katalin', '2002-02-09', '2022-10-15', '2022-10-20', 'Papp Terézia', 28, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(23, 'Fehér Andrea', '2000-08-03', '2025-02-16', '2025-02-26', 'Rácz Terézia', 77, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(24, 'Rácz Andrea', '1943-07-05', '2020-01-25', '2020-01-30', 'Tóth Erzsébet', 71, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(25, 'Szabó Krisztina', '1964-10-28', '2004-09-08', '2004-09-14', 'Németh Zsuzsanna', 68, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(26, 'Tóth József', '1962-01-24', '2012-04-27', '2012-04-29', 'Farkas Orsolya', 31, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(27, 'Kiss Ilona', '1948-03-28', '2001-09-11', '2001-09-19', 'Balogh Andrea', 4, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(28, 'Kiss Zsuzsanna', '1969-09-07', '2022-11-14', '2022-11-23', 'Oláh Erzsébet', 17, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(29, 'Nagy István', '1936-09-05', '2000-04-20', '2000-04-30', 'Rácz Krisztina', 43, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(30, 'Lakatos Sándor', '1971-09-16', '2005-02-15', '2005-02-19', 'Varga Éva', 50, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(31, 'Rácz Gábor', '1990-12-14', '2005-09-05', '2005-09-12', 'Balogh Ágnes', 74, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(32, 'Mészáros Krisztina', '1971-10-10', '2020-07-11', '2020-07-15', 'Kiss Terézia', 3, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(33, 'Rácz Ferenc', '2002-07-24', '2000-03-25', '2000-03-26', 'Molnár Julianna', 32, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(34, 'Simon Erzsébet', '1959-01-28', '2002-09-20', '2002-09-25', 'Kovács Julianna', 22, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(35, 'Oláh László', '1964-05-22', '2020-04-03', '2020-04-10', 'Takács Jolán', 76, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(36, 'Németh Ilona', '2000-03-01', '2021-09-26', '2021-09-30', 'Tóth Margit', 71, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(37, 'Fehér Andrea', '1993-12-17', '2012-11-24', '2012-12-03', 'Szalai Judit', 78, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(38, 'Simon Sándor', '1935-05-02', '2014-04-08', '2014-04-16', 'Szalai Ágnes', 69, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(39, 'Kovács Ilona', '1948-09-22', '2001-07-06', '2001-07-13', 'Varga Judit', 44, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(40, 'Tóth János', '1991-09-12', '2025-07-09', '2025-07-14', 'Szabó Terézia', 46, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(41, 'Szalai Katalin', '1971-08-16', '2015-09-15', '2015-09-20', 'Varga Erzsébet', 43, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(42, 'Molnár Zsuzsanna', '1959-05-10', '2002-09-04', '2002-09-09', 'Fehér Judit', 13, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(43, 'Németh János', '1942-03-02', '2007-03-28', '2007-03-29', 'Papp Terézia', 61, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(44, 'Farkas András', '1982-08-09', '2005-02-17', '2005-02-27', 'Fehér Beáta', 50, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(45, 'Balogh Éva', '1976-10-08', '2013-06-10', '2013-06-18', 'Horváth Beáta', 6, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(46, 'Nagy Judit', '1988-11-24', '2014-05-19', '2014-05-24', 'Molnár Terézia', 17, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(47, 'Takács István', '1945-12-07', '2018-06-17', '2018-06-18', 'Horváth Noémi', 12, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(48, 'Horváth István', '1965-09-02', '2005-03-19', '2005-03-26', 'Takács Krisztina', 41, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(49, 'Fehér Zsuzsanna', '1970-12-24', '2000-07-05', '2000-07-11', 'Balogh Katalin', 17, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(50, 'Oláh Sándor', '1947-04-02', '2013-03-19', '2013-03-20', 'Farkas Krisztina', 4, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(51, 'Balogh István', '1968-04-07', '2009-11-27', '2009-12-02', 'Nagy Ilona', 2, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(52, 'Szabó Katalin', '1993-07-10', '2005-08-29', '2005-09-04', 'Szalai Anna', 17, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(53, 'Németh Gábor', '1935-08-28', '2006-06-06', '2006-06-09', 'Varga Noémi', 35, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(54, 'Tóth Zsuzsanna', '1936-06-02', '2013-03-01', '2013-03-06', 'Simon Julianna', 66, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(55, 'Simon József', '1956-12-13', '2002-02-15', '2002-02-20', 'Szalai Margit', 32, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(56, 'Balogh Ferenc', '1947-02-20', '2021-12-14', '2021-12-21', 'Fehér Krisztina', 49, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(57, 'Horváth Péter', '1965-01-03', '2014-08-07', '2014-08-12', 'Mészáros Zsuzsanna', 66, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(58, 'Horváth Sándor', '1976-05-18', '2017-04-23', '2017-04-29', 'Papp Éva', 44, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(59, 'Balogh Sándor', '1994-01-30', '2021-05-15', '2021-05-21', 'Tóth Erzsébet', 62, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(60, 'Mészáros Judit', '1973-03-15', '2013-01-15', '2013-01-24', 'Takács Ágnes', 41, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(61, 'Mészáros Anna', '1961-07-01', '2017-12-14', '2017-12-17', 'Molnár Mária', 41, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(62, 'Takács László', '1969-11-02', '2005-01-24', '2005-01-29', 'Takács Orsolya', 75, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(63, 'Balogh Judit', '1962-02-23', '2016-09-12', '2016-09-13', 'Szabó Beáta', 73, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(64, 'Oláh Zoltán', '1987-02-06', '2017-10-02', '2017-10-04', 'Papp Jolán', 11, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(65, 'Molnár Éva', '1936-01-11', '2015-05-06', '2015-05-16', 'Mészáros Mária', 48, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(66, 'Rácz István', '1974-02-16', '2019-02-11', '2019-02-21', 'Papp Erzsébet', 32, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(67, 'Kiss László', '1974-09-29', '2013-09-24', '2013-10-03', 'Fehér Beáta', 79, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(68, 'Oláh Ferenc', '1967-04-20', '2009-12-31', '2010-01-06', 'Molnár Zsuzsanna', 28, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(69, 'Oláh Katalin', '1955-09-15', '2012-01-21', '2012-01-26', 'Takács Erzsébet', 51, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(70, 'Takács Mária', '1982-08-29', '2022-08-12', '2022-08-15', 'Takács Jolán', 54, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(71, 'Horváth Katalin', '1984-06-21', '2014-02-26', '2014-03-04', 'Tóth Mária', 75, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(72, 'Tóth István', '1987-05-05', '2019-07-29', '2019-08-03', 'Nagy Mária', 18, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(73, 'Szalai Péter', '1951-01-15', '2012-06-15', '2012-06-22', 'Kovács Mária', 76, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(74, 'Varga András', '1945-09-20', '2015-01-22', '2015-01-27', 'Molnár Ildikó', 75, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(75, 'Tóth Ferenc', '1958-02-24', '2016-11-17', '2016-11-20', 'Horváth Éva', 33, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(76, 'Papp Zsuzsanna', '1969-10-15', '2025-02-04', '2025-02-07', 'Lakatos Ilona', 34, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(77, 'Papp Judit', '1936-11-01', '2022-11-30', '2022-12-04', 'Szalai Orsolya', 46, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(78, 'Papp Judit', '1956-10-06', '2004-12-31', '2005-01-01', 'Farkas Judit', 22, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(79, 'Fehér Sándor', '1970-03-02', '2005-04-24', '2005-04-29', 'Mészáros Krisztina', 48, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(80, 'Varga János', '1971-05-01', '2011-07-29', '2011-08-05', 'Simon Anna', 48, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(81, 'Takács Krisztina', '1993-07-03', '2008-06-05', '2008-06-06', 'Kiss Zsuzsanna', 54, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(82, 'Horváth Judit', '1948-04-23', '2016-07-24', '2016-07-31', 'Nagy Ildikó', 45, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(83, 'Oláh Zoltán', '1992-09-15', '2000-07-28', '2000-08-03', 'Simon Krisztina', 42, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(84, 'Oláh Éva', '1994-04-30', '2023-07-13', '2023-07-23', 'Fehér Julianna', 31, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(85, 'Lakatos Gábor', '1962-12-15', '2007-03-11', '2007-03-13', 'Szalai Éva', 6, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(86, 'Papp Éva', '1957-04-10', '2005-07-31', '2005-08-01', 'Simon Orsolya', 23, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(87, 'Varga Ferenc', '1987-09-22', '2022-03-31', '2022-04-10', 'Varga Andrea', 50, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(88, 'Takács István', '1945-12-29', '2017-07-21', '2017-07-30', 'Németh Terézia', 12, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(89, 'Farkas László', '1947-05-17', '2013-04-26', '2013-04-27', 'Papp Julianna', 21, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(90, 'Nagy Krisztina', '1972-12-22', '2023-05-30', '2023-06-08', 'Farkas Noémi', 56, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(91, 'Kiss Erzsébet', '1990-10-10', '2010-04-19', '2010-04-25', 'Farkas Beáta', 12, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(92, 'Kovács Ferenc', '1982-02-21', '2010-12-13', '2010-12-14', 'Fehér Terézia', 62, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(93, 'Simon Erzsébet', '1952-10-03', '2015-12-22', '2015-12-25', 'Lakatos Anna', 24, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(94, 'Nagy Mária', '1954-10-20', '2024-02-29', '2024-03-08', 'Nagy Katalin', 10, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(95, 'Varga Andrea', '1991-10-20', '2009-01-08', '2009-01-11', 'Szabó Katalin', 51, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(96, 'Kovács Erzsébet', '1989-09-18', '2006-04-06', '2006-04-15', 'Kiss Ilona', 52, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(97, 'Mészáros Mária', '1951-06-27', '2016-08-10', '2016-08-15', 'Németh Ágnes', 10, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(98, 'Kovács János', '1948-03-21', '2019-11-07', '2019-11-10', 'Rácz Ágnes', 10, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(99, 'Varga Zsuzsanna', '1973-10-17', '2004-07-04', '2004-07-06', 'Kiss Erzsébet', 48, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(100, 'Nagy Éva', '1993-09-02', '2021-04-09', '2021-04-15', 'Tóth Ilona', 41, NULL, '2026-04-10 16:33:57', '2026-04-10 16:33:57'),
(128, 'Kovács János', '1945-02-02', '2026-04-12', NULL, 'Nagy Anna', 9, 'halotti_anyakonyvi_kiv/zR9r49ou1R9lem01u2BJhsfDKL6yV1tVSca5qHyo.png', '2026-04-10 14:58:03', '2026-04-10 14:58:03');

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
(1, 'utca', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(2, 'tér', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(3, 'út', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(4, 'körút', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(5, 'sétány', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(6, 'köz', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(7, 'sor', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(8, 'park', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(9, 'dűlő', '2026-04-10 16:10:14', '2026-04-10 16:10:14'),
(10, 'fasor', '2026-04-10 16:10:14', '2026-04-10 16:10:14');

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
(4, '2025_12_17_140735_create_personal_access_tokens_table', 4),
(5, '2025_12_05_070700_create_telepules_table', 5),
(6, '2025_12_05_092803_create_kozterulet_tipuses_table', 6),
(7, '2025_12_05_093040_create_parcelas_table', 7),
(8, '2025_12_05_093115_create_sors_table', 8),
(9, '2025_12_05_093222_create_sirhely_tipuses_table', 9),
(10, '2025_12_04_120508_create_sirberlos_table', 10),
(11, '2025_12_04_110507_create_sirhelys_table', 11),
(12, '2025_12_05_092501_create_dokumentum_tipuses_table', 12),
(13, '2025_12_04_121631_create_dokumentums_table', 13),
(14, '2025_12_04_121328_create_elhunyts_table', 14),
(15, '2025_12_05_093340_create_befizetes_table', 15),
(16, '2025_08_26_100418_add_two_factor_columns_to_users_table', 16),
(17, '2026_01_29_173743_add_role_to_users_table', 17),
(18, '2026_02_19_093922_add_telefonszam_to_sirberlo', 18),
(19, '2026_03_03_161849_alter_elhunytak_halotti_kiv_to_string', 19),
(20, '2026_04_01_082424_add_file_columns_to_dokumentum_table', 20);

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
(1, 'Zalai parcella', '2026-04-10 16:09:34', '2026-04-10 16:09:34'),
(2, 'Bótai parcella', '2026-04-10 16:09:34', '2026-04-10 16:09:34');

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

--
-- A tábla adatainak kiíratása `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4paj8hmotileicOIXSle3VqWRzzjJlBEVjHRDWpL', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVZsU0Q5TVhQeVBVOFZObEVuRjA0bGZtekI0aTBoNE5nYUl2V05kVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZG9rLW1lZ255aXQvaGFsb3R0aV9hbnlha29ueXZpX2tpdi96UjlyNDlvdTFSOWxlbTAxdTJCSmhzZkRLTDZ5VjF0VlNjYTVxSHlvLnBuZyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775840292);

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
(1, 'Kovács István', 'kovacs.istvan1@gmail.com', '+36301234501', 'Petőfi', '12', 1, 1, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(2, 'Nagy László', 'nagy.laszlo2@gmail.com', '+36301234502', 'Kossuth', '8', 1, 2, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(3, 'Tóth Péter', 'toth.peter3@gmail.com', '+36301234503', 'Rákóczi', '15', 2, 3, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(4, 'Szabó Zoltán', 'szabo.zoltan4@gmail.com', '+36301234504', 'Ady Endre', '21', 1, 4, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(5, 'Horváth Gábor', 'horvath.gabor5@gmail.com', '+36301234505', 'Jókai', '4', 3, 5, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(6, 'Varga József', 'varga.jozsef6@gmail.com', '+36301234506', 'Arany János', '17', 1, 6, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(7, 'Kiss Ferenc', 'kiss.ferenc7@gmail.com', '+36301234507', 'Dózsa György', '33', 1, 7, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(8, 'Molnár Tamás', 'molnar.tamas8@gmail.com', '+36301234508', 'Béke', '9', 4, 8, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(9, 'Németh András', 'nemeth.andras9@gmail.com', '+36301234509', 'Szabadság', '2', 2, 9, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(10, 'Farkas Balázs', 'farkas.balazs10@gmail.com', '+36301234510', 'Akácfa', '11', 1, 10, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(11, 'Papp Imre', 'papp.imre11@gmail.com', '+36301234511', 'Rózsa', '7', 1, 11, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(12, 'Lakatos János', 'lakatos.janos12@gmail.com', '+36301234512', 'Templom', '18', 5, 12, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(13, 'Takács Attila', 'takacs.attila13@gmail.com', '+36301234513', 'Hunyadi', '6', 1, 13, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(14, 'Oláh Sándor', 'olah.sandor14@gmail.com', '+36301234514', 'Mátyás király', '25', 1, 14, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(15, 'Mészáros Tibor', 'meszaros.tibor15@gmail.com', '+36301234515', 'Bartók Béla', '14', 3, 15, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(16, 'Simon Róbert', 'simon.robert16@gmail.com', '+36301234516', 'Kodály', '5', 1, 16, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(17, 'Rácz Norbert', 'racz.norbert17@gmail.com', '+36301234517', 'Nyár', '10', 1, 17, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(18, 'Fekete Csaba', 'fekete.csaba18@gmail.com', '+36301234518', 'Ősz', '3', 2, 18, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(19, 'Fehér Márton', 'feher.marton19@gmail.com', '+36301234519', 'Tavasz', '22', 1, 19, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(20, 'Szalai Dávid', 'szalai.david20@gmail.com', '+36301234520', 'Tél', '13', 1, 20, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(21, 'Gál Krisztián', 'gal.krisztian21@gmail.com', '+36301234521', 'Liszt Ferenc', '19', 1, 1, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(22, 'Bognár Ádám', 'bognar.adam22@gmail.com', '+36301234522', 'Munkácsy', '16', 3, 2, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(23, 'Balogh Richárd', 'balogh.richard23@gmail.com', '+36301234523', 'Vasút', '28', 1, 3, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(24, 'Kelemen Árpád', 'kelemen.arpad24@gmail.com', '+36301234524', 'Iskola', '1', 1, 4, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(25, 'Antal Levente', 'antal.levente25@gmail.com', '+36301234525', 'Sport', '30', 4, 5, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(26, 'Orbán Miklós', 'orban.miklos26@gmail.com', '+36301234526', 'Fő', '24', 1, 6, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(27, 'Sipos Bence', 'sipos.bence27@gmail.com', '+36301234527', 'Gyár', '20', 1, 7, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(28, 'Veres Ákos', 'veres.akos28@gmail.com', '+36301234528', 'Malom', '31', 2, 8, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(29, 'Hegedűs Viktor', 'hegedus.viktor29@gmail.com', '+36301234529', 'Táncsics', '26', 1, 9, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(30, 'Barna Roland', 'barna.roland30@gmail.com', '+36301234530', 'Radnóti', '27', 1, 10, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(31, 'Király Gergő', 'kiraly.gergo31@gmail.com', '+36301234531', 'Móra', '35', 3, 11, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(32, 'Lukács Patrik', 'lukacs.patrik32@gmail.com', '+36301234532', 'Mikszáth', '23', 1, 12, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(33, 'Barta Ádám', 'barta.adam33@gmail.com', '+36301234533', 'Kazinczy', '29', 1, 13, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(34, 'Dudás Zsolt', 'dudas.zsolt34@gmail.com', '+36301234534', 'Erkel', '34', 2, 14, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(35, 'Vass Lőrinc', 'vass.lorinc35@gmail.com', '+36301234535', 'József Attila', '12', 1, 15, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(36, 'Juhász Máté', 'juhasz.mate36@gmail.com', '+36301234536', 'Damjanich', '8', 1, 16, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(37, 'Cseh Ádám', 'cseh.adam37@gmail.com', '+36301234537', 'Széchenyi', '41', 1, 17, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(38, 'Boros Tamás', 'boros.tamas38@gmail.com', '+36301234538', 'Deák Ferenc', '32', 3, 18, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(39, 'Halász Péter', 'halasz.peter39@gmail.com', '+36301234539', 'Bem', '7', 1, 19, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(40, 'Sárközi Gábor', 'sarkozi.gabor40@gmail.com', '+36301234540', 'Klapka', '15', 1, 20, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(41, 'Kocsis Anita', 'kocsis.anita41@gmail.com', '+36301234541', 'Orgona', '9', 1, 1, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(42, 'Bíró Éva', 'biro.eva42@gmail.com', '+36301234542', 'Ibolya', '18', 1, 2, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(43, 'Németh Katalin', 'nemeth.katalin43@gmail.com', '+36301234543', 'Tulipán', '6', 2, 3, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(44, 'Fodor Mária', 'fodor.maria44@gmail.com', '+36301234544', 'Levendula', '14', 1, 4, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(45, 'Tóth Zsuzsanna', 'toth.zsuzsanna45@gmail.com', '+36301234545', 'Viola', '11', 1, 5, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(46, 'Kiss Erzsébet', 'kiss.erzsebet46@gmail.com', '+36301234546', 'Liliom', '3', 3, 6, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(47, 'Varga Andrea', 'varga.andrea47@gmail.com', '+36301234547', 'Nap', '22', 1, 7, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(48, 'Molnár Krisztina', 'molnar.krisztina48@gmail.com', '+36301234548', 'Hold', '4', 4, 8, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(49, 'Szabó Judit', 'szabo.judit49@gmail.com', '+36301234549', 'Csillag', '27', 1, 9, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(50, 'Horváth Réka', 'horvath.reka50@gmail.com', '+36301234550', 'Fenyő', '5', 1, 10, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(51, 'Nagy Viktória', 'nagy.viktoria51@gmail.com', '+36301234551', 'Nyírfa', '16', 2, 11, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(52, 'Balogh Dóra', 'balogh.dora52@gmail.com', '+36301234552', 'Hársfa', '10', 1, 12, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(53, 'Papp Enikő', 'papp.eniko53@gmail.com', '+36301234553', 'Kökény', '21', 1, 13, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(54, 'Lakatos Tímea', 'lakatos.timea54@gmail.com', '+36301234554', 'Somfa', '8', 3, 14, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(55, 'Takács Noémi', 'takacs.noemi55@gmail.com', '+36301234555', 'Áfonya', '19', 1, 15, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(56, 'Oláh Lívia', 'olah.livia56@gmail.com', '+36301234556', 'Kankalin', '24', 1, 16, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(57, 'Mészáros Anna', 'meszaros.anna57@gmail.com', '+36301234557', 'Rét', '2', 1, 17, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(58, 'Simon Kinga', 'simon.kinga58@gmail.com', '+36301234558', 'Mező', '13', 2, 18, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(59, 'Rácz Hajnalka', 'racz.hajnalka59@gmail.com', '+36301234559', 'Patak', '31', 1, 19, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(60, 'Fekete Beáta', 'fekete.beata60@gmail.com', '+36301234560', 'Domb', '7', 1, 20, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(61, 'Fehér Ilona', 'feher.ilona61@gmail.com', '+36301234561', 'Liget', '26', 3, 1, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(62, 'Szalai Eszter', 'szalai.eszter62@gmail.com', '+36301234562', 'Pázsit', '18', 1, 2, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(63, 'Gál Bernadett', 'gal.bernadett63@gmail.com', '+36301234563', 'Kert', '12', 1, 3, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(64, 'Bognár Zita', 'bognar.zita64@gmail.com', '+36301234564', 'Árnyas', '15', 4, 4, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(65, 'Kelemen Melinda', 'kelemen.melinda65@gmail.com', '+36301234565', 'Fecske', '9', 1, 5, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(66, 'Antal Barbara', 'antal.barbara66@gmail.com', '+36301234566', 'Gólya', '6', 1, 6, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(67, 'Orbán Ágnes', 'orban.agnes67@gmail.com', '+36301234567', 'Galamb', '23', 2, 7, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(68, 'Sipos Orsolya', 'sipos.orsolya68@gmail.com', '+36301234568', 'Rigó', '11', 1, 8, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(69, 'Veres Klaudia', 'veres.klaudia69@gmail.com', '+36301234569', 'Pacsirta', '14', 1, 9, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(70, 'Hegedűs Brigitta', 'hegedus.brigitta70@gmail.com', '+36301234570', 'Boglárka', '4', 3, 10, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(71, 'Barna Emese', 'barna.emese71@gmail.com', '+36301234571', 'Szegfű', '17', 1, 11, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(72, 'Király Adrienn', 'kiraly.adrienn72@gmail.com', '+36301234572', 'Margaréta', '20', 1, 12, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(73, 'Lukács Fanni', 'lukacs.fanni73@gmail.com', '+36301234573', 'Jázmin', '5', 2, 13, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(74, 'Barta Petra', 'barta.petra74@gmail.com', '+36301234574', 'Kála', '8', 1, 14, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(75, 'Dudás Nóra', 'dudas.nora75@gmail.com', '+36301234575', 'Muskátli', '25', 1, 15, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(76, 'Vass Dorina', 'vass.dorina76@gmail.com', '+36301234576', 'Bazsarózsa', '30', 3, 16, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(77, 'Juhász Gréta', 'juhasz.greta77@gmail.com', '+36301234577', 'Irisz', '7', 1, 17, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(78, 'Cseh Luca', 'cseh.luca78@gmail.com', '+36301234578', 'Pipacs', '13', 1, 18, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(79, 'Boros Dalma', 'boros.dalma79@gmail.com', '+36301234579', 'Gerbera', '16', 4, 19, '2026-04-10 16:26:16', '2026-04-10 16:26:16'),
(80, 'Halász Nóra', 'halasz.nora80@gmail.com', '+36301234580', 'Nefelejcs', '21', 1, 20, '2026-04-10 16:26:16', '2026-04-10 16:26:16');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sirhely`
--

CREATE TABLE `sirhely` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sor_id` bigint(20) UNSIGNED NOT NULL,
  `sorszam` varchar(255) NOT NULL,
  `sirhely_tipus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `allapot` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `sirberlo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirhely`
--

INSERT INTO `sirhely` (`id`, `sor_id`, `sorszam`, `sirhely_tipus_id`, `allapot`, `foto`, `sirberlo_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 1, 'Új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 35, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(2, 1, '2', 2, 'Rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 23, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(3, 1, '3', 3, 'Elhanyagolt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 7, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(4, 1, '4', 4, 'Felújítandó', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 52, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(5, 2, '1', 5, 'Új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 75, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(6, 2, '2', 6, 'Rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 68, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(7, 2, '3', 7, 'Gondozott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 2, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(8, 2, '4', 8, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 45, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(9, 3, '1', 2, 'Új', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 3, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(10, 3, '2', 3, 'Rendben tartott', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 68, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(11, 3, '3', 4, 'Elhanyagolt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 20, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(12, 3, '4', 5, 'Felújított', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 7, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(13, 4, '1', 6, 'Új', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 10, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(14, 4, '2', 7, 'Rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 71, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(15, 4, '3', 8, 'Gondozott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 64, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(16, 4, '4', 1, 'Elhanyagolt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 34, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(17, 5, '1', 3, 'Új', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 57, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(18, 5, '2', 4, 'Rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 9, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(19, 5, '3', 5, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 43, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(20, 5, '4', 6, 'Felújítandó', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 62, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(21, 6, '1', 7, 'Új', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 51, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(22, 6, '2', 8, 'Rendben tartott', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 26, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(23, 6, '3', 1, 'Gondozott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 44, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(24, 6, '4', 2, 'Elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 34, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(25, 7, '1', 4, 'Új', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 39, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(26, 7, '2', 5, 'Rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 28, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(27, 7, '3', 6, 'Elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 57, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(28, 7, '4', 7, 'Felújított', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 22, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(29, 8, '1', 8, 'Új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 78, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(30, 8, '2', 1, 'Rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 22, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(31, 8, '3', 2, 'Gondozott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 2, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(32, 8, '4', 3, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 74, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(33, 9, '1', 5, 'Új', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 67, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(34, 9, '2', 6, 'Rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 4, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(35, 9, '3', 7, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 2, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(36, 9, '4', 8, 'Felújítandó', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 50, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(37, 10, '1', 1, 'Új', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 39, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(38, 10, '2', 2, 'Rendben tartott', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 50, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(39, 10, '3', 3, 'Gondozott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 80, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(40, 10, '4', 4, 'Elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 10, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(41, 11, '1', 6, 'Új', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 19, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(42, 11, '2', 7, 'Rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 14, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(43, 11, '3', 8, 'Elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 15, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(44, 11, '4', 1, 'Felújított', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 54, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(45, 12, '1', 2, 'Új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 27, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(46, 12, '2', 3, 'Rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 50, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(47, 12, '3', 4, 'Gondozott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 58, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(48, 12, '4', 5, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 1, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(49, 13, '1', 7, 'Új', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 45, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(50, 13, '2', 8, 'Rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 69, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(51, 13, '3', 1, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 8, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(52, 13, '4', 2, 'Felújítandó', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 40, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(53, 14, '1', 3, 'Új', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 41, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(54, 14, '2', 4, 'Rendben tartott', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 8, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(55, 14, '3', 5, 'Gondozott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 48, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(56, 14, '4', 6, 'Elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 4, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(57, 15, '1', 8, 'Új', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 32, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(58, 15, '2', 1, 'Rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 26, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(59, 15, '3', 2, 'Elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 49, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(60, 15, '4', 3, 'Felújított', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 6, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(61, 16, '1', 4, 'Új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 26, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(62, 16, '2', 5, 'Rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 79, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(63, 16, '3', 6, 'Gondozott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 11, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(64, 16, '4', 7, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 65, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(65, 17, '1', 1, 'Új', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 33, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(66, 17, '2', 2, 'Rendben tartott', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 17, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(67, 17, '3', 3, 'Elhanyagolt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 74, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(68, 17, '4', 4, 'Felújítandó', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 72, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(69, 18, '1', 5, 'Új', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 11, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(70, 18, '2', 6, 'Rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 69, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(71, 18, '3', 7, 'Gondozott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 15, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(72, 18, '4', 8, 'Elhanyagolt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 58, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(73, 19, '1', 2, 'Új', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 48, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(74, 19, '2', 3, 'Rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 44, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(75, 19, '3', 4, 'Elhanyagolt', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 3, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(76, 19, '4', 5, 'Felújított', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 63, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(77, 20, '1', 6, 'Új', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 20, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(78, 20, '2', 7, 'Rendben tartott', 'https://i.pinimg.com/236x/b6/5a/8e/b65a8e92093ec225dbb670a3bf5cb6ca.jpg', 68, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(79, 20, '3', 8, 'Gondozott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 9, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(80, 20, '4', 1, 'Elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 12, '2026-04-10 16:23:57', '2026-04-10 16:23:57'),
(81, 17, '15', 2, 'oké', 'asd.jpg', 3, '2026-04-10 14:56:26', '2026-04-10 14:56:26');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sirhely_tipus`
--

CREATE TABLE `sirhely_tipus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirhely_tipus`
--

INSERT INTO `sirhely_tipus` (`id`, `nev`, `created_at`, `updated_at`) VALUES
(1, 'Egyszemélyes sírhely', '2026-04-10 16:09:58', '2026-04-10 16:09:58'),
(2, 'Kétszemélyes sírhely', '2026-04-10 16:09:58', '2026-04-10 16:09:58'),
(3, 'Gyermeksírhely', '2026-04-10 16:09:58', '2026-04-10 16:09:58'),
(4, 'Családi sírbolt', '2026-04-10 16:09:58', '2026-04-10 16:09:58'),
(5, 'Urnasírhely', '2026-04-10 16:09:58', '2026-04-10 16:09:58'),
(6, 'Urnafülke', '2026-04-10 16:09:58', '2026-04-10 16:09:58'),
(7, 'Urnakripta', '2026-04-10 16:09:58', '2026-04-10 16:09:58'),
(8, 'Közös szóróparcella', '2026-04-10 16:09:58', '2026-04-10 16:09:58');

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
(1, 1, 'I', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(2, 1, 'II', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(3, 1, 'III', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(4, 1, 'IV', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(5, 1, 'V', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(6, 1, 'VI', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(7, 1, 'VII', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(8, 1, 'VIII', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(9, 1, 'IX', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(10, 1, 'X', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(11, 1, 'XI', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(12, 1, 'XII', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(13, 1, 'XIII', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(14, 1, 'XIV', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(15, 1, 'XV', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(16, 2, 'I', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(17, 2, 'II', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(18, 2, 'III', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(19, 2, 'IV', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(20, 2, 'V', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(21, 2, 'VI', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(22, 2, 'VII', '2026-04-10 16:09:43', '2026-04-10 16:09:43'),
(23, 2, 'VIII', '2026-04-10 16:09:43', '2026-04-10 16:09:43');

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
(1, 8800, 'Nagykanizsa', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(2, 8900, 'Zalaegerszeg', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(3, 8360, 'Keszthely', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(4, 8380, 'Hévíz', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(5, 8600, 'Siófok', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(6, 9700, 'Szombathely', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(7, 9021, 'Győr', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(8, 9400, 'Sopron', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(9, 8000, 'Székesfehérvár', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(10, 7621, 'Pécs', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(11, 6720, 'Szeged', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(12, 6000, 'Kecskemét', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(13, 5000, 'Szolnok', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(14, 4024, 'Debrecen', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(15, 3525, 'Miskolc', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(16, 3300, 'Eger', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(17, 4400, 'Nyíregyháza', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(18, 6500, 'Baja', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(19, 5600, 'Békéscsaba', '2026-04-10 16:24:32', '2026-04-10 16:24:32'),
(20, 2800, 'Tatabánya', '2026-04-10 16:24:32', '2026-04-10 16:24:32');

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
  ADD KEY `dokumentum_sirberlo_id_foreign` (`sirberlo_id`),
  ADD KEY `dokumentum_dokumentum_tipus_id_foreign` (`dokumentum_tipus_id`);

--
-- A tábla indexei `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `sirhely_sor_id_foreign` (`sor_id`),
  ADD KEY `sirhely_sirhely_tipus_id_foreign` (`sirhely_tipus_id`),
  ADD KEY `sirhely_sirberlo_id_foreign` (`sirberlo_id`);

--
-- A tábla indexei `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT a táblához `dokumentum`
--
ALTER TABLE `dokumentum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT a táblához `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `elhunyt`
--
ALTER TABLE `elhunyt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `parcella`
--
ALTER TABLE `parcella`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `sirberlo`
--
ALTER TABLE `sirberlo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT a táblához `sirhely`
--
ALTER TABLE `sirhely`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT a táblához `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `sor`
--
ALTER TABLE `sor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT a táblához `telepules`
--
ALTER TABLE `telepules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `dokumentum_dokumentum_tipus_id_foreign` FOREIGN KEY (`dokumentum_tipus_id`) REFERENCES `dokumentum_tipus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dokumentum_sirberlo_id_foreign` FOREIGN KEY (`sirberlo_id`) REFERENCES `sirberlo` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `dokumentum_sirhely_id_foreign` FOREIGN KEY (`sirhely_id`) REFERENCES `sirhely` (`id`) ON DELETE SET NULL;

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
  ADD CONSTRAINT `sirhely_sirhely_tipus_id_foreign` FOREIGN KEY (`sirhely_tipus_id`) REFERENCES `sirhely_tipus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sirhely_sor_id_foreign` FOREIGN KEY (`sor_id`) REFERENCES `sor` (`id`);

--
-- Megkötések a táblához `sor`
--
ALTER TABLE `sor`
  ADD CONSTRAINT `sor_parcella_id_foreign` FOREIGN KEY (`parcella_id`) REFERENCES `parcella` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
