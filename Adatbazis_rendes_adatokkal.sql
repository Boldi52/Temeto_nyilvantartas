-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2026. Ápr 08. 13:19
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
  `lejarat_datum` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `befizetes`
--

INSERT INTO `befizetes` (`id`, `sirberlo_id`, `osszeg`, `elhunyt_id`, `hossza`, `datum`, `lejarat_datum`, `created_at`, `updated_at`) VALUES
(149, 53, 108000.00, 191, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(150, 99, 108000.00, 211, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(151, 52, 108000.00, 124, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(152, 52, 108000.00, 165, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(153, 102, 108000.00, 133, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(154, 75, 108000.00, 196, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(155, 89, 108000.00, 164, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(156, 101, 108000.00, 187, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(157, 100, 108000.00, 160, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(158, 92, 108000.00, 160, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(159, 84, 108000.00, 165, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(160, 85, 108000.00, 116, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(161, 59, 108000.00, 132, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(162, 72, 108000.00, 201, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(163, 109, 108000.00, 213, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(164, 51, 108000.00, 174, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(165, 106, 108000.00, 175, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(166, 93, 108000.00, 146, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(167, 109, 108000.00, 124, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(168, 60, 108000.00, 180, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(169, 85, 108000.00, 118, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(170, 73, 108000.00, 210, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(171, 99, 108000.00, 141, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(172, 79, 108000.00, 176, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(173, 107, 108000.00, 186, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(174, 63, 108000.00, 199, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(175, 72, 108000.00, 171, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(176, 68, 108000.00, 183, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(177, 88, 108000.00, 133, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(178, 63, 108000.00, 165, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(179, 86, 108000.00, 161, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(180, 103, 108000.00, 157, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(181, 83, 108000.00, 172, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(182, 82, 108000.00, 184, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(183, 74, 108000.00, 162, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(184, 83, 108000.00, 147, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(185, 77, 108000.00, 146, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(186, 68, 108000.00, 145, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(187, 68, 108000.00, 201, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(188, 63, 108000.00, 207, 108, '2025-11-24', '2034-11-24', '2026-04-08 10:37:06', '2026-04-08 10:37:06'),
(212, 57, 50000.00, 120, 17, '2026-04-08', NULL, '2026-04-08 08:40:27', '2026-04-08 08:40:27'),
(213, 56, 28000.00, 116, 28, '2026-04-24', NULL, '2026-04-08 08:43:25', '2026-04-08 08:43:25');

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
  `fajl_utvonal` varchar(255) DEFAULT NULL,
  `eredeti_fajlnev` varchar(255) DEFAULT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dokumentum`
--

INSERT INTO `dokumentum` (`id`, `sirhely_id`, `sirberlo_id`, `tipus`, `datum`, `leiras`, `fajl_utvonal`, `eredeti_fajlnev`, `mime_type`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Halotti kivonat', '2024-01-01', 'Leiras 1', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(2, NULL, NULL, 'Halotti kivonat', '2024-01-02', 'Leiras 2', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(3, NULL, NULL, 'Halotti kivonat', '2024-01-03', 'Leiras 3', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(4, NULL, NULL, 'Halotti kivonat', '2024-01-04', 'Leiras 4', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(5, NULL, NULL, 'Halotti kivonat', '2024-01-05', 'Leiras 5', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(6, NULL, NULL, 'Halotti kivonat', '2024-01-06', 'Leiras 6', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(7, NULL, NULL, 'Halotti kivonat', '2024-01-07', 'Leiras 7', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(8, NULL, NULL, 'Halotti kivonat', '2024-01-08', 'Leiras 8', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(9, NULL, NULL, 'Halotti kivonat', '2024-01-09', 'Leiras 9', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(10, NULL, NULL, 'Halotti kivonat', '2024-01-10', 'Leiras 10', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(11, NULL, NULL, 'Halotti kivonat', '2024-01-11', 'Leiras 11', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(12, NULL, NULL, 'Halotti kivonat', '2024-01-12', 'Leiras 12', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(13, NULL, NULL, 'Halotti kivonat', '2024-01-13', 'Leiras 13', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(14, NULL, NULL, 'Halotti kivonat', '2024-01-14', 'Leiras 14', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(15, NULL, NULL, 'Halotti kivonat', '2024-01-15', 'Leiras 15', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(16, NULL, NULL, 'Halotti kivonat', '2024-01-16', 'Leiras 16', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(17, NULL, NULL, 'Halotti kivonat', '2024-01-17', 'Leiras 17', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(18, NULL, NULL, 'Halotti kivonat', '2024-01-18', 'Leiras 18', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(19, NULL, NULL, 'Halotti kivonat', '2024-01-19', 'Leiras 19', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(20, NULL, NULL, 'Halotti kivonat', '2024-01-20', 'Leiras 20', NULL, NULL, NULL, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(21, NULL, NULL, NULL, NULL, 'teszt', NULL, NULL, NULL, '2026-03-26 15:46:54', '2026-03-26 15:46:54'),
(22, NULL, 52, 'Halotti levél', '2026-04-08', 'teszt dokumentum', 'dokumentumok/tVOA0OIUSGAMMzfxmbWtWG1lV249j6BZKDxBhvBd.pdf', 'feladatsor (1).pdf', 'application/pdf', '2026-04-08 09:18:24', '2026-04-08 09:18:24');

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
(1, 'Tipus 1', 1, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(2, 'Tipus 2', 2, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(3, 'Tipus 3', 3, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(4, 'Tipus 4', 4, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(5, 'Tipus 5', 5, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(6, 'Tipus 6', 6, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(7, 'Tipus 7', 7, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(8, 'Tipus 8', 8, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(9, 'Tipus 9', 9, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(10, 'Tipus 10', 10, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(11, 'Tipus 11', 11, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(12, 'Tipus 12', 12, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(13, 'Tipus 13', 13, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(14, 'Tipus 14', 14, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(15, 'Tipus 15', 15, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(16, 'Tipus 16', 16, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(17, 'Tipus 17', 17, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(18, 'Tipus 18', 18, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(19, 'Tipus 19', 19, '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(20, 'Tipus 20', 20, '2026-03-23 10:21:07', '2026-03-23 10:21:07');

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
(115, 'Kovács János', '1942-03-14', '2023-01-11', '2023-01-18', 'Nagy Mária', 203, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(116, 'Szabó István', '1938-07-22', '2023-02-03', '2023-02-10', 'Tóth Ilona', 204, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(117, 'Nagy László', '1945-11-09', '2023-02-17', '2023-02-24', 'Kiss Erzsébet', 205, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(118, 'Tóth Ferenc', '1941-01-30', '2023-03-02', '2023-03-09', 'Varga Anna', 206, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(119, 'Varga Imre', '1936-05-18', '2023-03-19', '2023-03-26', 'Molnár Júlia', 207, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(120, 'Kiss Sándor', '1940-09-05', '2023-04-01', '2023-04-08', 'Balogh Éva', 208, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(121, 'Molnár József', '1939-12-12', '2023-04-14', '2023-04-21', 'Papp Mária', 209, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(122, 'Balogh Lajos', '1944-04-25', '2023-04-29', '2023-05-06', 'Farkas Ilona', 210, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(123, 'Papp Béla', '1937-08-16', '2023-05-12', '2023-05-19', 'Lakatos Katalin', 211, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(124, 'Farkas Zoltán', '1943-10-02', '2023-05-25', '2023-06-01', 'Horváth Margit', 212, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(125, 'Lakatos György', '1946-02-07', '2023-06-08', '2023-06-15', 'Rácz Ilona', 213, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(126, 'Horváth Tibor', '1935-06-21', '2023-06-20', '2023-06-27', 'Németh Éva', 214, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(127, 'Rácz András', '1947-09-13', '2023-07-01', '2023-07-08', 'Oláh Mária', 215, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(128, 'Németh Gábor', '1948-11-28', '2023-07-11', '2023-07-18', 'Mészáros Zsuzsanna', 216, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(129, 'Oláh Pál', '1934-03-03', '2023-07-23', '2023-07-30', 'Simon Erzsébet', 217, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(130, 'Mészáros Jenő', '1949-12-19', '2023-08-04', '2023-08-11', 'Juhász Mária', 218, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(131, 'Simon Károly', '1940-01-17', '2023-08-15', '2023-08-22', 'Veres Ilona', 219, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(132, 'Juhász Antal', '1933-07-27', '2023-08-28', '2023-09-04', 'Orbán Anna', 220, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(133, 'Veres Miklós', '1942-06-10', '2023-09-09', '2023-09-16', 'Hegedűs Mária', 221, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(134, 'Orbán Árpád', '1938-10-23', '2023-09-22', '2023-09-29', 'Kelemen Éva', 222, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(135, 'Hegedűs Lőrinc', '1941-02-12', '2023-10-03', '2023-10-10', 'Pásztor Ilona', 223, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(136, 'Kelemen Bálint', '1939-05-29', '2023-10-14', '2023-10-21', 'Barna Mária', 224, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(137, 'Pásztor Albert', '1946-09-01', '2023-10-25', '2023-11-01', 'Vincze Katalin', 225, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(138, 'Barna Dezső', '1937-04-08', '2023-11-05', '2023-11-12', 'Antal Ilona', 226, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(139, 'Vincze Elemér', '1943-03-11', '2023-11-16', '2023-11-23', 'Király Erzsébet', 227, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(140, 'Antal Ernő', '1944-12-02', '2023-11-28', '2023-12-05', 'Somogyi Mária', 228, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(141, 'Király László', '1936-01-21', '2023-12-09', '2023-12-16', 'Balla Ilona', 229, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(142, 'Somogyi János', '1945-08-14', '2023-12-20', '2023-12-27', 'Császár Éva', 230, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(143, 'Balla István', '1935-11-06', '2024-01-04', '2024-01-11', 'Kocsis Mária', 231, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(144, 'Császár Ferenc', '1947-07-03', '2024-01-15', '2024-01-22', 'Major Ilona', 232, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(145, 'Kocsis Imre', '1948-04-17', '2024-01-28', '2024-02-04', 'Péterfi Anna', 233, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(146, 'Major József', '1934-09-26', '2024-02-08', '2024-02-15', 'Szőke Mária', 234, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(147, 'Péterfi Pál', '1940-12-30', '2024-02-19', '2024-02-26', 'Illés Éva', 235, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(148, 'Szőke Károly', '1938-02-18', '2024-03-02', '2024-03-09', 'György Ilona', 236, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(149, 'Illés Tibor', '1942-05-05', '2024-03-13', '2024-03-20', 'Boros Mária', 237, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(150, 'György Lajos', '1939-06-24', '2024-03-24', '2024-03-31', 'Benkő Katalin', 238, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(151, 'Boros Gábor', '1941-11-15', '2024-04-04', '2024-04-11', 'Sándor Ilona', 239, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(152, 'Benkő István', '1937-03-09', '2024-04-15', '2024-04-22', 'Kardos Éva', 240, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(153, 'Sándor András', '1949-07-28', '2024-04-27', '2024-05-04', 'Pintér Mária', 241, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(154, 'Kardos Jenő', '1933-10-31', '2024-05-09', '2024-05-16', 'Nyári Ilona', 242, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(155, 'Pintér László', '1946-04-01', '2024-05-20', '2024-05-27', 'Bíró Éva', 243, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(156, 'Nyári Kálmán', '1935-12-07', '2024-06-01', '2024-06-08', 'Lőrincz Mária', 244, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(157, 'Bíró Sándor', '1944-06-19', '2024-06-12', '2024-06-19', 'Dobos Ilona', 245, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(158, 'Lőrincz Imre', '1941-09-22', '2024-06-23', '2024-06-30', 'Kalmár Éva', 246, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(159, 'Dobos Gyula', '1936-08-04', '2024-07-05', '2024-07-12', 'Sárosi Mária', 247, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(160, 'Kalmár Tamás', '1948-01-13', '2024-07-16', '2024-07-23', 'Pálfi Ilona', 248, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(161, 'Sárosi Béla', '1939-11-27', '2024-07-28', '2024-08-04', 'Zentai Éva', 249, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(162, 'Pálfi Dezső', '1945-05-16', '2024-08-09', '2024-08-16', 'Madarász Mária', 250, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(163, 'Zentai István', '1937-01-05', '2024-08-20', '2024-08-27', 'Gereben Ilona', 251, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(164, 'Madarász Gábor', '1943-02-26', '2024-09-01', '2024-09-08', 'Sebők Éva', 252, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(165, 'Gereben János', '1940-07-12', '2024-09-12', '2024-09-19', 'Kis Mária', 253, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(166, 'Sebők Lajos', '1934-04-15', '2024-09-23', '2024-09-30', 'Kovács Ilona', 254, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(167, 'Kis Andor', '1947-10-08', '2024-10-04', '2024-10-11', 'Szabó Éva', 255, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(168, 'Kovács Béla', '1936-02-20', '2024-10-15', '2024-10-22', 'Nagy Mária', 256, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(169, 'Szabó Géza', '1942-12-03', '2024-10-26', '2024-11-02', 'Tóth Ilona', 257, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(170, 'Nagy József', '1938-06-14', '2024-11-06', '2024-11-13', 'Kiss Erzsébet', 258, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(171, 'Tóth Pál', '1945-09-30', '2024-11-17', '2024-11-24', 'Varga Anna', 259, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(172, 'Varga Sándor', '1935-03-25', '2024-11-28', '2024-12-05', 'Molnár Júlia', 260, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(173, 'Kiss Imre', '1949-08-11', '2024-12-09', '2024-12-16', 'Balogh Éva', 261, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(174, 'Molnár László', '1937-11-19', '2024-12-20', '2024-12-27', 'Papp Mária', 262, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(175, 'Balogh István', '1941-04-09', '2025-01-03', '2025-01-10', 'Farkas Ilona', 263, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(176, 'Papp János', '1934-07-31', '2025-01-14', '2025-01-21', 'Lakatos Katalin', 264, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(177, 'Farkas Béla', '1946-10-27', '2025-01-25', '2025-02-01', 'Horváth Margit', 265, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(178, 'Lakatos István', '1939-01-16', '2025-02-05', '2025-02-12', 'Rácz Ilona', 266, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(179, 'Horváth Pál', '1943-06-06', '2025-02-16', '2025-02-23', 'Németh Éva', 267, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(180, 'Rácz Ferenc', '1936-09-29', '2025-02-27', '2025-03-06', 'Oláh Mária', 268, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(181, 'Németh Lajos', '1948-05-21', '2025-03-10', '2025-03-17', 'Mészáros Zsuzsanna', 269, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(182, 'Oláh András', '1938-12-24', '2025-03-21', '2025-03-28', 'Simon Erzsébet', 270, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(183, 'Mészáros János', '1940-03-18', '2025-04-01', '2025-04-08', 'Juhász Mária', 271, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(184, 'Simon István', '1935-05-11', '2025-04-12', '2025-04-19', 'Veres Ilona', 272, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(185, 'Juhász László', '1947-02-02', '2025-04-23', '2025-04-30', 'Orbán Anna', 273, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(186, 'Veres Gábor', '1937-10-12', '2025-05-04', '2025-05-11', 'Hegedűs Mária', 274, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(187, 'Orbán József', '1944-01-29', '2025-05-15', '2025-05-22', 'Kelemen Éva', 275, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(188, 'Hegedűs Imre', '1934-11-08', '2025-05-26', '2025-06-02', 'Pásztor Ilona', 276, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(189, 'Kelemen László', '1945-07-07', '2025-06-06', '2025-06-13', 'Barna Mária', 277, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(190, 'Pásztor János', '1939-08-28', '2025-06-17', '2025-06-24', 'Vincze Katalin', 278, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(191, 'Barna Pál', '1942-02-15', '2025-06-28', '2025-07-05', 'Antal Ilona', 279, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(192, 'Vincze József', '1936-06-30', '2025-07-09', '2025-07-16', 'Király Erzsébet', 280, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(193, 'Antal Lajos', '1948-09-17', '2025-07-20', '2025-07-27', 'Somogyi Mária', 281, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(194, 'Király Imre', '1938-04-04', '2025-07-31', '2025-08-07', 'Balla Ilona', 282, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(195, 'Somogyi Károly', '1941-12-26', '2025-08-11', '2025-08-18', 'Császár Éva', 203, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(196, 'Balla József', '1935-01-14', '2025-08-22', '2025-08-29', 'Kocsis Mária', 204, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(197, 'Császár László', '1946-03-23', '2025-09-02', '2025-09-09', 'Major Ilona', 205, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(198, 'Kocsis Béla', '1937-07-01', '2025-09-13', '2025-09-20', 'Péterfi Anna', 206, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(199, 'Major János', '1943-10-19', '2025-09-24', '2025-10-01', 'Szőke Mária', 207, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(200, 'Péterfi István', '1939-02-27', '2025-10-05', '2025-10-12', 'Illés Éva', 208, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(201, 'Szőke András', '1947-06-13', '2025-10-16', '2025-10-23', 'György Ilona', 209, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(202, 'Illés József', '1936-05-03', '2025-10-27', '2025-11-03', 'Boros Mária', 210, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(203, 'György László', '1944-08-25', '2025-11-07', '2025-11-14', 'Benkő Katalin', 211, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(204, 'Boros Imre', '1938-03-12', '2025-11-18', '2025-11-25', 'Sándor Ilona', 212, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(205, 'Benkő Gábor', '1940-02-02', '2025-12-01', '2025-12-08', 'Kardos Éva', 213, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(206, 'Sándor Péter', '1936-10-20', '2025-12-12', '2025-12-19', 'Pintér Mária', 214, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(207, 'Kardos István', '1948-03-03', '2025-12-23', '2025-12-30', 'Nyári Ilona', 215, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(208, 'Pintér János', '1939-09-09', '2026-01-05', '2026-01-12', 'Bíró Éva', 216, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(209, 'Nyári László', '1941-01-01', '2026-01-16', '2026-01-23', 'Lőrincz Mária', 217, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(210, 'Bíró Ferenc', '1937-12-12', '2026-01-27', '2026-02-03', 'Dobos Ilona', 218, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(211, 'Lőrincz Pál', '1943-05-05', '2026-02-07', '2026-02-14', 'Kalmár Éva', 219, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(212, 'Dobos Imre', '1935-08-08', '2026-02-18', '2026-02-25', 'Sárosi Mária', 220, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(213, 'Kalmár Béla', '1947-11-11', '2026-03-01', '2026-03-08', 'Pálfi Ilona', 221, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(214, 'Sárosi János', '1938-06-06', '2026-03-12', '2026-03-19', 'Zentai Éva', 222, NULL, '2026-04-07 15:28:28', '2026-04-07 15:28:28'),
(242, 'Nagy Elenor', '1970-01-09', '2026-04-07', NULL, 'Nagy Anna', 288, 'halotti_anyakonyvi_kiv/Tqpok6Cg5U2XTzde8DYMypFsemWjogrMO7qfWjje.png', '2026-04-08 08:58:29', '2026-04-08 08:58:29'),
(243, 'Kovécs János', '1942-02-14', '2026-05-14', NULL, 'Nagy Anaa', 267, 'halotti_anyakonyvi_kiv/sGFOWZMIgrdfx16JwaQMM0IAckoWXNS6otvIiimK.png', '2026-04-08 09:09:13', '2026-04-08 09:09:13');

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
(1, 'Utca', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(2, 'Tér', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(3, 'Körút', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(4, 'Sugárút', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(5, 'Sétány', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(6, 'Köz', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(7, 'Dűlő', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(8, 'Sor', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(9, 'Lakópark', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(10, 'Erőd', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(11, 'Híd', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(12, 'Fasor', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(13, 'Park', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(14, 'Tanya', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(15, 'Árok', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(16, 'Gát', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(17, 'Domb', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(18, 'Part', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(19, 'Ligett', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(20, 'Kert', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(21, 'Utca', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(22, 'Tér', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(23, 'Körút', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(24, 'Sugárút', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(25, 'Sétány', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(26, 'Köz', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(27, 'Dűlő', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(28, 'Sor', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(29, 'Lakópark', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(30, 'Erőd', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(31, 'Híd', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(32, 'Fasor', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(33, 'Park', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(34, 'Tanya', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(35, 'Árok', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(36, 'Gát', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(37, 'Domb', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(38, 'Part', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(39, 'Ligett', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(40, 'Kert', '2026-03-23 10:25:43', '2026-03-23 10:25:43');

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
(17, '2025_12_05_093222_create_sirhely_tipuses_table', 17),
(18, '2025_12_05_093340_create_befizetes_table', 18),
(19, '2026_03_03_161849_alter_elhunytak_halotti_kiv_to_string', 19),
(20, '2026_04_01_082424_add_file_columns_to_dokumentum_table', 19);

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
(1, 'Zalai parcella', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(2, 'Bótai parcella', '2026-03-23 10:21:07', '2026-03-23 10:21:07');

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
(1, 'App\\Models\\User', 1, 'auth', 'ded94bf7c599764c2a90c47b4b3c30a6ed8c61e2ef23067528a587c549bbb1c7', '[\"*\"]', NULL, NULL, '2026-03-24 12:41:58', '2026-03-24 12:41:58'),
(2, 'App\\Models\\User', 1, 'auth', '43831ad3766b404f7eed1506e0ddae4aad78e3b090bd59191245aa244ee67f26', '[\"*\"]', NULL, NULL, '2026-03-24 12:42:06', '2026-03-24 12:42:06'),
(3, 'App\\Models\\User', 1, 'auth', 'cc33900cf39ec3ddb6cbef099a1cc63926132db99007d3c7eeec0f28f2cf3624', '[\"*\"]', NULL, NULL, '2026-03-25 12:31:59', '2026-03-25 12:31:59'),
(4, 'App\\Models\\User', 1, 'auth', '4a8fffecd5ac739e83e4ba7cb7f1f7cc2584090caeefaef9fdb90560b1e3d167', '[\"*\"]', NULL, NULL, '2026-03-26 15:35:46', '2026-03-26 15:35:46'),
(5, 'App\\Models\\User', 1, 'auth', '95c81aad3f5a82743080c02e295e7bcf6304f753ce3eb84e4790190063e5eaea', '[\"*\"]', NULL, NULL, '2026-04-02 15:09:56', '2026-04-02 15:09:56'),
(6, 'App\\Models\\User', 1, 'auth', '33d99434012e08bcd48b7bbb5e129477a71bdafbc03788fff83c5d8ab9251843', '[\"*\"]', NULL, NULL, '2026-04-05 16:12:19', '2026-04-05 16:12:19'),
(7, 'App\\Models\\User', 1, 'auth', 'def827f261c28be7d2215848fb34fa4fa4ad2df6aa4e36efaf5669055d7b19ec', '[\"*\"]', NULL, NULL, '2026-04-07 12:33:04', '2026-04-07 12:33:04'),
(8, 'App\\Models\\User', 1, 'auth', 'd6ce4186db52f60cab09eb5f7ac32c859076f18007cb38bf8d6dd0795a56a238', '[\"*\"]', NULL, NULL, '2026-04-08 07:55:58', '2026-04-08 07:55:58'),
(9, 'App\\Models\\User', 1, 'auth', '64b9d97c2de7a44fa5a4abf724ff33951a05e74bc4022412ab04d27f78bc75b3', '[\"*\"]', NULL, NULL, '2026-04-08 08:32:03', '2026-04-08 08:32:03'),
(10, 'App\\Models\\User', 1, 'auth', '585c13e7e9708393ef69dfd494b6f816ac62878ef77bd340ebbd04581eba70eb', '[\"*\"]', NULL, NULL, '2026-04-08 09:06:26', '2026-04-08 09:06:26'),
(11, 'App\\Models\\User', 1, 'auth', '5afbba3ead6b8c17f9579d868c016d1d500d1802ae45aad39ff82f2dccbaae95', '[\"*\"]', NULL, NULL, '2026-04-08 09:17:47', '2026-04-08 09:17:47');

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
('0elFqGmZDZpjaS17Rip4NqVq63w84D8pl8cqgxUa', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajZJZVBabXpvdHR4UGhEWUk4WVZna2VhalRNRm0wUmF2N2FOUGdOZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAyOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZG9rLWxldG9sdGVzL2hhbG90dGlfYW55YWtvbnl2aV9raXYvOERJU3FNTXRRUGRBWGdtSWlSVTJ5bHNEQ3o0U3ZBSW1qNFJBMVFaNi5wZGYiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1775132293),
('g9mV24hHkMfU8Be78jZ6GcLgc8EQXT1TpG8ZRuHY', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzJva1I2TmJWQ00yaHZsQVk4bjVGWVFMWUhQRmNhRlVUd0RYaEpuYSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZG9rLW1lZ255aXQvaGFsb3R0aV9hbnlha29ueXZpX2tpdi9zR0ZPV1pNSWdyZGZ4MTZKd2FRTU0wSUFja29XWE5TNm90dklpaW1LLnBuZyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775646558),
('NIZACaTstfdIYhdhtHqcrGchjoBo7c52GCeCVCPE', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzBZYUJwcjZBT0xBVXJMODVTUXNxcDFJWVNKVlQ0OFFUV05tejVsOCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZG9rLW1lZ255aXQvaGFsb3R0aV9hbnlha29ueXZpX2tpdi8yQW9OVnp1eWw3ZGI2ZGhEclc3cno3eUlYQ1JlUExybUhZbFZUM3Q3LnBuZyI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1775412873);

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
(51, 'Kovács Gábor', 'kovacs.gabor@mail.com', '+36301234001', 'Kossuth', '21', 1, 1, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(52, 'Nagy Anna', 'nagy.anna@mail.com', '+36301234002', 'Petőfi', '14', 2, 2, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(53, 'Tóth László', 'toth.laszlo@mail.com', '+36301234003', 'Rákóczi', '8', 3, 3, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(54, 'Szabó Éva', 'szabo.eva@mail.com', '+36301234004', 'Jókai', '33', 1, 4, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(55, 'Horváth Péter', 'horvath.peter@mail.com', '+36301234005', 'Ady Endre', '5', 2, 5, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(56, 'Varga Zsófia', 'varga.zsofia@mail.com', '+36301234006', 'Béke', '42', 3, 6, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(57, 'Kiss Bence', 'kiss.bence@mail.com', '+36301234007', 'Akácfa', '17', 1, 7, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(58, 'Molnár Júlia', 'molnar.julia@mail.com', '+36301234008', 'Arany János', '9', 2, 8, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(59, 'Balogh István', 'balogh.istvan@mail.com', '+36301234009', 'Dózsa György', '28', 3, 9, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(60, 'Papp Mária', 'papp.maria@mail.com', '+36301234010', 'Széchenyi', '11', 1, 10, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(61, 'Farkas Tamás', 'farkas.tamas@mail.com', '+36301234011', 'Kossuth', '3', 2, 11, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(62, 'Lakatos Noémi', 'lakatos.noemi@mail.com', '+36301234012', 'Petőfi', '26', 3, 12, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(63, 'Takács Dávid', 'takacs.david@mail.com', '+36301234013', 'Rákóczi', '19', 1, 13, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(64, 'Németh Réka', 'nemeth.reka@mail.com', '+36301234014', 'Jókai', '7', 2, 14, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(65, 'Oláh Márk', 'olah.mark@mail.com', '+36301234015', 'Ady Endre', '36', 3, 15, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(66, 'Mészáros Lili', 'meszaros.lili@mail.com', '+36301234016', 'Béke', '10', 1, 16, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(67, 'Simon Attila', 'simon.attila@mail.com', '+36301234017', 'Akácfa', '24', 2, 17, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(68, 'Rácz Dóra', 'racz.dora@mail.com', '+36301234018', 'Arany János', '15', 3, 18, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(69, 'Fekete Ádám', 'fekete.adam@mail.com', '+36301234019', 'Dózsa György', '2', 1, 19, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(70, 'Török Viktória', 'torok.viktoria@mail.com', '+36301234020', 'Széchenyi', '31', 2, 20, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(71, 'Szalai Norbert', 'szalai.norbert@mail.com', '+36301234021', 'Kossuth', '13', 3, 1, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(72, 'Bognár Enikő', 'bognar.eniko@mail.com', '+36301234022', 'Petőfi', '40', 1, 2, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(73, 'Gulyás Levente', 'gulyas.levente@mail.com', '+36301234023', 'Rákóczi', '6', 2, 3, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(74, 'Sipos Fanni', 'sipos.fanni@mail.com', '+36301234024', 'Jókai', '22', 3, 4, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(75, 'Juhász Roland', 'juhasz.roland@mail.com', '+36301234025', 'Ady Endre', '18', 1, 5, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(76, 'Veres Bianka', 'veres.bianka@mail.com', '+36301234026', 'Béke', '27', 2, 6, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(77, 'Orbán Milán', 'orban.milan@mail.com', '+36301234027', 'Akácfa', '4', 3, 7, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(78, 'Hegedűs Eszter', 'hegedus.eszter@mail.com', '+36301234028', 'Arany János', '35', 1, 8, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(79, 'Kelemen Gergő', 'kelemen.gergo@mail.com', '+36301234029', 'Dózsa György', '12', 2, 9, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(80, 'Pásztor Nóra', 'pasztor.nora@mail.com', '+36301234030', 'Széchenyi', '20', 3, 10, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(81, 'Barna Kristóf', 'barna.kristof@mail.com', '+36301234031', 'Kossuth', '29', 1, 11, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(82, 'Vincze Dorina', 'vincze.dorina@mail.com', '+36301234032', 'Petőfi', '1', 2, 12, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(83, 'Antal Zoltán', 'antal.zoltan@mail.com', '+36301234033', 'Rákóczi', '16', 3, 13, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(84, 'Király Petra', 'kiraly.petra@mail.com', '+36301234034', 'Jókai', '30', 1, 14, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(85, 'Somogyi Ákos', 'somogyi.akos@mail.com', '+36301234035', 'Ady Endre', '9', 2, 15, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(86, 'Balla Melinda', 'balla.melinda@mail.com', '+36301234036', 'Béke', '25', 3, 16, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(87, 'Császár Dániel', 'csaszar.daniel@mail.com', '+36301234037', 'Akácfa', '14', 1, 17, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(88, 'Kocsis Orsolya', 'kocsis.orsolya@mail.com', '+36301234038', 'Arany János', '37', 2, 18, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(89, 'Major Richárd', 'major.richard@mail.com', '+36301234039', 'Dózsa György', '23', 3, 19, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(90, 'Péterfi Adrienn', 'peterfi.adrienn@mail.com', '+36301234040', 'Széchenyi', '6', 1, 20, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(91, 'Szőke Máté', 'szoke.mate@mail.com', '+36301234041', 'Kossuth', '44', 2, 1, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(92, 'Illés Gréta', 'illes.greta@mail.com', '+36301234042', 'Petőfi', '32', 3, 2, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(93, 'György Áron', 'gyorgy.aron@mail.com', '+36301234043', 'Rákóczi', '11', 1, 3, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(94, 'Boros Luca', 'boros.luca@mail.com', '+36301234044', 'Jókai', '27', 2, 4, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(95, 'Benkő Patrik', 'benko.patrik@mail.com', '+36301234045', 'Ady Endre', '15', 3, 5, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(96, 'Sándor Kinga', 'sandor.kinga@mail.com', '+36301234046', 'Béke', '34', 1, 6, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(97, 'Kardos Zsombor', 'kardos.zsombor@mail.com', '+36301234047', 'Akácfa', '8', 2, 7, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(98, 'Pintér Emese', 'pinter.emese@mail.com', '+36301234048', 'Arany János', '19', 3, 8, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(99, 'Nyári Botond', 'nyari.botond@mail.com', '+36301234049', 'Dózsa György', '41', 1, 9, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(100, 'Bíró Klaudia', 'biro.klaudia@mail.com', '+36301234050', 'Széchenyi', '13', 2, 10, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(101, 'Lőrincz Márton', 'lorincz.marton@mail.com', '+36301234051', 'Kossuth', '7', 3, 11, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(102, 'Dobos Hanna', 'dobos.hanna@mail.com', '+36301234052', 'Petőfi', '39', 1, 12, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(103, 'Kalmár Bálint', 'kalmar.balint@mail.com', '+36301234053', 'Rákóczi', '24', 2, 13, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(104, 'Sárosi Flóra', 'sarosi.flora@mail.com', '+36301234054', 'Jókai', '10', 3, 14, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(105, 'Pálfi Hunor', 'palfi.hunor@mail.com', '+36301234055', 'Ady Endre', '28', 1, 15, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(106, 'Zentai Boglárka', 'zentai.boglarka@mail.com', '+36301234056', 'Béke', '17', 2, 16, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(107, 'Madarász Márk', 'madarasz.mark@mail.com', '+36301234057', 'Akácfa', '33', 3, 17, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(108, 'Gereben Sára', 'gereben.sara@mail.com', '+36301234058', 'Arany János', '5', 1, 18, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(109, 'Sebők Ádám', 'sebok.adam@mail.com', '+36301234059', 'Dózsa György', '26', 2, 19, '2026-04-07 15:02:21', '2026-04-07 15:02:21'),
(110, 'Kis Virág', 'kis.virag@mail.com', '+36301234060', 'Széchenyi', '16', 3, 20, '2026-04-07 15:02:21', '2026-04-07 15:02:21');

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
(203, 56, '1', '1 személyes', 'rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 51, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(204, 56, '2', '2 személyes', 'elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 52, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(205, 56, '3', 'családi', 'felújítandó', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 53, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(206, 56, '4', '1 személyes', 'részben gondozott', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 54, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(207, 57, '1', '2 személyes', 'rendben tartott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 55, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(208, 57, '2', '1 személyes', 'elhanyagolt', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 56, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(209, 57, '3', 'családi', 'gondozás alatt', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 57, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(210, 57, '4', '2 személyes', 'felújítandó', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 58, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(211, 58, '1', '1 személyes', 'rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 59, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(212, 58, '2', '2 személyes', 'részben gondozott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 60, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(213, 58, '3', 'családi', 'elhanyagolt', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 61, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(214, 58, '4', '1 személyes', 'gondozás alatt', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 62, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(215, 59, '1', '2 személyes', 'rendben tartott', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 63, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(216, 59, '2', '1 személyes', 'felújítandó', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 64, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(217, 59, '3', 'családi', 'részben gondozott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 65, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(218, 59, '4', '2 személyes', 'elhanyagolt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 66, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(219, 60, '1', '1 személyes', 'rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 67, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(220, 60, '2', '2 személyes', 'gondozás alatt', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 68, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(221, 60, '3', 'családi', 'felújítandó', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 69, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(222, 60, '4', '1 személyes', 'részben gondozott', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 70, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(223, 61, '1', '2 személyes', 'rendben tartott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 71, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(224, 61, '2', '1 személyes', 'elhanyagolt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 72, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(225, 61, '3', 'családi', 'gondozás alatt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 73, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(226, 61, '4', '2 személyes', 'felújítandó', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 74, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(227, 62, '1', '1 személyes', 'rendben tartott', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 75, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(228, 62, '2', '2 személyes', 'részben gondozott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 76, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(229, 62, '3', 'családi', 'elhanyagolt', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 77, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(230, 62, '4', '1 személyes', 'gondozás alatt', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 78, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(231, 63, '1', '2 személyes', 'rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 79, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(232, 63, '2', '1 személyes', 'felújítandó', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 80, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(233, 63, '3', 'családi', 'részben gondozott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 81, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(234, 63, '4', '2 személyes', 'elhanyagolt', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 82, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(235, 64, '1', '1 személyes', 'rendben tartott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 83, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(236, 64, '2', '2 személyes', 'gondozás alatt', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 84, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(237, 64, '3', 'családi', 'felújítandó', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 85, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(238, 64, '4', '1 személyes', 'részben gondozott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 86, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(239, 65, '1', '2 személyes', 'rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 87, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(240, 65, '2', '1 személyes', 'elhanyagolt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 88, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(241, 65, '3', 'családi', 'gondozás alatt', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 89, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(242, 65, '4', '2 személyes', 'felújítandó', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 90, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(243, 66, '1', '1 személyes', 'rendben tartott', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 91, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(244, 66, '2', '2 személyes', 'részben gondozott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 92, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(245, 66, '3', 'családi', 'elhanyagolt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 93, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(246, 66, '4', '1 személyes', 'gondozás alatt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 94, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(247, 67, '1', '2 személyes', 'rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 95, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(248, 67, '2', '1 személyes', 'felújítandó', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 96, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(249, 67, '3', 'családi', 'részben gondozott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 97, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(250, 67, '4', '2 személyes', 'elhanyagolt', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 98, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(251, 68, '1', '1 személyes', 'rendben tartott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 99, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(252, 68, '2', '2 személyes', 'gondozás alatt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 100, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(253, 68, '3', 'családi', 'felújítandó', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 101, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(254, 68, '4', '1 személyes', 'részben gondozott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 102, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(255, 69, '1', '2 személyes', 'rendben tartott', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 103, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(256, 69, '2', '1 személyes', 'elhanyagolt', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 104, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(257, 69, '3', 'családi', 'gondozás alatt', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 105, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(258, 69, '4', '2 személyes', 'felújítandó', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 106, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(259, 70, '1', '1 személyes', 'rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 107, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(260, 70, '2', '2 személyes', 'részben gondozott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 108, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(261, 70, '3', 'családi', 'elhanyagolt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 109, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(262, 70, '4', '1 személyes', 'gondozás alatt', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 110, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(263, 71, '1', '2 személyes', 'rendben tartott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 51, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(264, 71, '2', '1 személyes', 'elhanyagolt', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 52, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(265, 71, '3', 'családi', 'felújítandó', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 53, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(266, 72, '1', '1 személyes', 'rendben tartott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 54, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(267, 72, '2', '2 személyes', 'részben gondozott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 55, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(268, 72, '3', 'családi', 'gondozás alatt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 56, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(269, 73, '1', '2 személyes', 'rendben tartott', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 57, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(270, 73, '2', '1 személyes', 'elhanyagolt', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 58, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(271, 73, '3', 'családi', 'felújítandó', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 59, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(272, 74, '1', '1 személyes', 'rendben tartott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 60, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(273, 74, '2', '2 személyes', 'részben gondozott', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 61, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(274, 74, '3', 'családi', 'gondozás alatt', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 62, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(275, 75, '1', '2 személyes', 'rendben tartott', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 63, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(276, 75, '2', '1 személyes', 'elhanyagolt', 'https://i.pinimg.com/200x150/69/00/fd/6900fd571a08cb4be5433edf1a8ba63f.jpg', 64, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(277, 76, '1', '1 személyes', 'felújítandó', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 65, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(278, 76, '2', '2 személyes', 'rendben tartott', 'https://i.pinimg.com/236x/07/7c/f4/077cf4104ae91a1ed882473f338c78a5.jpg', 66, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(279, 77, '1', 'családi', 'részben gondozott', 'https://www.ovip.hu/fajlok/temszoft/kepek/33-sirhely-1526554868860992.jpg', 67, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(280, 77, '2', '1 személyes', 'gondozás alatt', 'https://sirgondozasbudapest.hu/wp-content/uploads/2022/07/szimpla.jpg', 68, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(281, 78, '1', '2 személyes', 'rendben tartott', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTv3YsUrqKV1yOMTYr9DQEqAYaNNKzE-ZnaeQ&s', 69, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(282, 78, '2', '1 személyes', 'elhanyagolt', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 70, '2026-04-07 15:18:25', '2026-04-07 15:18:25'),
(283, 60, '13', 'urna', 'új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 57, '2026-04-07 14:29:38', '2026-04-08 08:27:47'),
(284, 59, '13', 'urna', 'új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 53, '2026-04-07 14:38:42', '2026-04-08 08:27:54'),
(287, 63, '13', 'urna', 'új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 53, '2026-04-08 08:17:23', '2026-04-08 08:28:04'),
(288, 58, '14', 'urna', 'új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 52, '2026-04-08 08:19:30', '2026-04-08 08:28:09'),
(289, 72, '15', 'egyszemélyes', 'új', 'https://i.pinimg.com/236x/3a/44/33/3a443312428f849bdf84e4653b53b18d.jpg', 52, '2026-04-08 08:20:16', '2026-04-08 08:28:17');

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
(56, 1, 'I', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(57, 1, 'II', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(58, 1, 'III', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(59, 1, 'IV', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(60, 1, 'V', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(61, 1, 'VI', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(62, 1, 'VII', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(63, 1, 'VIII', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(64, 1, 'IX', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(65, 1, 'X', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(66, 1, 'XI', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(67, 1, 'XII', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(68, 1, 'XIII', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(69, 1, 'XIV', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(70, 1, 'XV', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(71, 2, 'I', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(72, 2, 'II', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(73, 2, 'III', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(74, 2, 'IV', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(75, 2, 'V', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(76, 2, 'VI', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(77, 2, 'VII', '2026-04-07 14:52:57', '2026-04-07 14:52:57'),
(78, 2, 'VIII', '2026-04-07 14:52:57', '2026-04-07 14:52:57');

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
(1, 1001, 'Telepules 1', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(2, 1002, 'Telepules 2', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(3, 1003, 'Telepules 3', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(4, 1004, 'Telepules 4', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(5, 1005, 'Telepules 5', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(6, 1006, 'Telepules 6', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(7, 1007, 'Telepules 7', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(8, 1008, 'Telepules 8', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(9, 1009, 'Telepules 9', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(10, 1010, 'Telepules 10', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(11, 1011, 'Telepules 11', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(12, 1012, 'Telepules 12', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(13, 1013, 'Telepules 13', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(14, 1014, 'Telepules 14', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(15, 1015, 'Telepules 15', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(16, 1016, 'Telepules 16', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(17, 1017, 'Telepules 17', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(18, 1018, 'Telepules 18', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(19, 1019, 'Telepules 19', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(20, 1020, 'Telepules 20', '2026-03-23 10:21:07', '2026-03-23 10:21:07'),
(21, 1001, 'Telepules 1', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(22, 1002, 'Telepules 2', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(23, 1003, 'Telepules 3', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(24, 1004, 'Telepules 4', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(25, 1005, 'Telepules 5', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(26, 1006, 'Telepules 6', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(27, 1007, 'Telepules 7', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(28, 1008, 'Telepules 8', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(29, 1009, 'Telepules 9', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(30, 1010, 'Telepules 10', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(31, 1011, 'Telepules 11', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(32, 1012, 'Telepules 12', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(33, 1013, 'Telepules 13', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(34, 1014, 'Telepules 14', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(35, 1015, 'Telepules 15', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(36, 1016, 'Telepules 16', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(37, 1017, 'Telepules 17', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(38, 1018, 'Telepules 18', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(39, 1019, 'Telepules 19', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(40, 1020, 'Telepules 20', '2026-03-23 10:25:43', '2026-03-23 10:25:43'),
(41, 8660, 'Tab', '2026-03-23 10:32:22', '2026-03-23 10:32:22'),
(42, 8617, 'kőrösegy', '2026-03-23 10:37:33', '2026-03-23 10:37:33'),
(43, 7654, 'Kaposmérő', '2026-03-25 13:19:46', '2026-03-25 13:19:46'),
(44, 1123, 'edvv', '2026-03-25 13:23:24', '2026-03-25 13:23:24'),
(45, 1112, 'wesgsegrsgseg', '2026-03-25 13:26:32', '2026-03-25 13:26:32'),
(46, 3423, 'Kapoly', '2026-03-25 13:29:21', '2026-03-25 13:29:21'),
(47, 2589, 'Kapoly', '2026-04-02 10:12:28', '2026-04-02 10:12:28');

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
(1, 'Admin', 'Admin', '$2y$12$Ykf0/XB2CyWkv1K5056N4uKjPCJ/TUwItniOamhhscMnGsuzLl2W2', 'admin', NULL, NULL, NULL, NULL, '2026-03-24 12:41:58', '2026-03-24 12:41:58');

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
  ADD UNIQUE KEY `sirhely_sor_id_sirkod_unique` (`sor_id`,`sirkod`),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT a táblához `dokumentum`
--
ALTER TABLE `dokumentum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `elhunyt`
--
ALTER TABLE `elhunyt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `parcella`
--
ALTER TABLE `parcella`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `sirberlo`
--
ALTER TABLE `sirberlo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT a táblához `sirhely`
--
ALTER TABLE `sirhely`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT a táblához `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `sor`
--
ALTER TABLE `sor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT a táblához `telepules`
--
ALTER TABLE `telepules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
