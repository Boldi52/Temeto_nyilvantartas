-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2026. Jan 30. 09:30
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
(1, 1, 50000.00, 12, '2023-01-01', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, 2, 70000.00, 24, '2024-02-01', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 3, 65000.00, 12, '2024-05-01', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(4, 4, 52000.00, 12, '2024-06-15', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 5, 80000.00, 24, '2024-07-10', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 6, 54000.00, 12, '2024-08-05', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 7, 72000.00, 24, '2024-09-01', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 8, 50000.00, 12, '2024-10-01', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 9, 90000.00, 36, '2024-11-01', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 10, 60000.00, 12, '2024-12-01', '2026-01-21 10:31:30', '2026-01-21 10:31:30');

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
(1, 1, 1, 'szerződés', '2023-01-01', 'Szerződés a sírhely bérléséről', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, NULL, 2, 'számla', '2024-02-01', 'Sírbérleti díj számla', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 2, NULL, 'szerződés', '2024-04-01', 'Új bérleti szerződés', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(4, 3, 2, 'számla', '2024-05-10', 'Bérleti díj számla', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 4, 4, 'szerződés', '2024-06-01', 'Sírhely bérlés', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 5, NULL, 'számla', '2024-06-20', 'Számla szabad sírhelyre', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 6, 5, 'szerződés', '2024-07-15', 'Új bérlő szerződése', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 7, 6, 'szerződés', '2024-08-10', 'Új bérlő szerződése', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 8, NULL, 'számla', '2024-09-05', 'Számla szabad sírhelyre', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 9, 7, 'szerződés', '2024-10-01', 'Bérleti szerződés', '2026-01-21 10:31:30', '2026-01-21 10:31:30');

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
(1, 'Bérleti szerződés', 1, '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, 'Számla', 2, '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 'Bérleti szerződés', 3, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(4, 'Számla', 4, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 'Bérleti szerződés', 5, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 'Számla', 6, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 'Bérleti szerződés', 7, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 'Bérleti szerződés', 8, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 'Számla', 9, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 'Bérleti szerződés', 10, '2026-01-21 10:31:30', '2026-01-21 10:31:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elhunyt`
--

CREATE TABLE `elhunyt` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `szul_datum` date DEFAULT NULL,
  `halal_datuma` date DEFAULT NULL,
  `anyja_neve` varchar(255) DEFAULT NULL,
  `sirhely_id` bigint(20) UNSIGNED DEFAULT NULL,
  `halotti_anyakonyvi_kiv` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `elhunyt`
--

INSERT INTO `elhunyt` (`id`, `nev`, `szul_datum`, `halal_datuma`, `anyja_neve`, `sirhely_id`, `halotti_anyakonyvi_kiv`, `created_at`, `updated_at`) VALUES
(1, 'Kiss Péter', '1940-05-10', '2023-01-20', 'Nagy Anna', 1, NULL, '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, 'Tóth Ilona', '1955-07-15', '2024-03-05', 'Kovács Mária', 3, NULL, '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 'Szűcs István', '1948-03-12', '2024-02-14', 'Kiss Mária', 2, NULL, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(4, 'Molnár Júlia', '1950-11-01', '2024-04-02', 'Tóth Ilona', 4, 3, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 'Balogh Béla', '1939-09-09', '2024-05-18', 'Horváth Anna', 5, 4, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 'Varga Edit', '1945-07-22', '2024-06-30', 'Farkas Julianna', 6, 5, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 'Kádár Lajos', '1952-01-05', '2024-07-20', 'Szabó Teréz', 7, 6, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 'Jenei Mária', '1947-02-28', '2024-08-25', 'Kovács Erzsébet', 8, 7, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 'Oláh Zoltán', '1958-05-16', '2024-09-12', 'Németh Ilona', 9, 8, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 'Tamás Gyula', '1960-12-03', '2024-10-08', 'Tóth Margit', 10, 9, '2026-01-21 10:31:30', '2026-01-21 10:31:30');

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
(1, 'utca', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, 'tér', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 'út', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(4, 'köz', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 'fasor', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 'rakpart', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 'sétány', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 'liget', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 'lejtő', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 'közút', '2026-01-21 10:31:30', '2026-01-21 10:31:30');

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
(1, '2025_12_05_070700_create_telepules_table', 1),
(2, '2025_12_05_092803_create_kozterulet_tipuses_table', 2),
(3, '2025_12_05_093040_create_parcelas_table', 3),
(4, '2025_12_04_120508_create_sirberlos_table', 4),
(5, '2025_12_05_093115_create_sors_table', 5),
(6, '2025_12_04_110507_create_sirhelys_table', 6),
(7, '2025_12_05_093222_create_sirhely_tipuses_table', 7),
(8, '2025_12_05_093340_create_befizetes_table', 8),
(9, '2025_12_04_121631_create_dokumentums_table', 9),
(10, '2025_12_05_092501_create_dokumentum_tipuses_table', 10),
(11, '2025_12_04_121328_create_elhunyts_table', 11),
(12, '0001_01_01_000000_create_users_table', 12),
(13, '0001_01_01_000001_create_cache_table', 12),
(14, '0001_01_01_000002_create_jobs_table', 12),
(15, '2025_08_26_100418_add_two_factor_columns_to_users_table', 12),
(16, '2025_12_16_205738_add_new_column_to_table_name', 12),
(17, '2025_12_17_140735_create_personal_access_tokens_table', 12),
(18, '2026_01_29_173743_add_role_to_users_table', 13);

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
(1, '1. parcella', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, '2. parcella', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, '3. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(4, '4. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, '5. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, '6. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, '7. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, '8. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, '9. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, '10. parcella', '2026-01-21 10:31:30', '2026-01-21 10:31:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
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
(1, 'App\\Models\\User', 1, 'auth', 'e6eb09bad00ac94ffe5c8542a50d1b0c67790514ff05a443948d33f37c6d487e', '[\"*\"]', NULL, NULL, '2026-01-06 08:03:21', '2026-01-06 08:03:21'),
(2, 'App\\Models\\User', 1, 'auth', '9e87f2ef11c71bd3c85569094284463b41ea068330299137f520d22ea8bb26d9', '[\"*\"]', NULL, NULL, '2026-01-06 08:03:40', '2026-01-06 08:03:40'),
(3, 'App\\Models\\User', 1, 'auth', '4fbefc666802b31b2401263e9a0c2e5299edb9a4e53274a22bb76e5ded4918ee', '[\"*\"]', NULL, NULL, '2026-01-06 08:21:45', '2026-01-06 08:21:45'),
(4, 'App\\Models\\User', 1, 'auth', '17761385fd613eeae7c68bd773665b9e5cdfd13af2bbd136e5afc19dd6159835', '[\"*\"]', NULL, NULL, '2026-01-06 11:53:10', '2026-01-06 11:53:10'),
(5, 'App\\Models\\User', 1, 'auth', '249e9e3980177586d7c5802ca88fe6083e2f3efd1cbf5709beb7b95686544abe', '[\"*\"]', NULL, NULL, '2026-01-21 08:38:04', '2026-01-21 08:38:04'),
(6, 'App\\Models\\User', 2, 'auth', '12bb29af03766c7a4e5d272e8e7c4adb13844e37823bac7aecdfd47ab6c7d180', '[\"*\"]', NULL, NULL, '2026-01-21 08:49:58', '2026-01-21 08:49:58'),
(7, 'App\\Models\\User', 2, 'auth', '238fe2febda8f9b76a4bffb6b184bce4791a6f54b0b7895f54f03bb34d870c70', '[\"*\"]', NULL, NULL, '2026-01-21 08:50:44', '2026-01-21 08:50:44'),
(8, 'App\\Models\\User', 2, 'auth', '905d8b9636a43288d5edf9dba54c36315b212171e7ebe14fdeb132d1cf77a58c', '[\"*\"]', NULL, NULL, '2026-01-21 08:51:08', '2026-01-21 08:51:08'),
(9, 'App\\Models\\User', 1, 'auth', 'efd70a472c66b5b9fbc43f32aedaf6d439b9a0fdd823de12dd91dafda1d8fd3a', '[\"*\"]', NULL, NULL, '2026-01-21 09:47:00', '2026-01-21 09:47:00'),
(10, 'App\\Models\\User', 1, 'auth', '19ca1fc0e92d8e0adc3d1313e22365e36f52da47340f029a0ceb481c9649c8a3', '[\"*\"]', NULL, NULL, '2026-01-21 09:52:24', '2026-01-21 09:52:24'),
(11, 'App\\Models\\User', 1, 'auth', '2a5fbbd58d31a102858ad63927df052b27f0a430ba40ec6a8c0aeb73807512ac', '[\"*\"]', NULL, NULL, '2026-01-21 10:47:34', '2026-01-21 10:47:34'),
(12, 'App\\Models\\User', 2, 'auth', 'd9f70e9730364f0dc0503b8f7964747e2c8b664870409e5b49ea7647fa25abb2', '[\"*\"]', NULL, NULL, '2026-01-29 16:19:49', '2026-01-29 16:19:49'),
(13, 'App\\Models\\User', 2, 'auth', '76cb71a96e838219263741df3844d8555eb793f2a9a5f2391212e14a9bdee171', '[\"*\"]', NULL, NULL, '2026-01-29 16:48:39', '2026-01-29 16:48:39'),
(14, 'App\\Models\\User', 2, 'auth', '877dfb77b7d091a52d11e0b3d66253fe23209cb5922d2b86aae8aa74874de712', '[\"*\"]', NULL, NULL, '2026-01-29 16:57:29', '2026-01-29 16:57:29'),
(15, 'App\\Models\\User', 2, 'auth', '640731ab64f6075b8fa3f8c8952bf8aeaec8221649aafb41c23254014b3a6bb2', '[\"*\"]', NULL, NULL, '2026-01-29 17:19:59', '2026-01-29 17:19:59'),
(16, 'App\\Models\\User', 2, 'auth', 'cfb6876015075bd98035ddcbd127a9dcbf13430c567550499e8a405aeb9e412c', '[\"*\"]', NULL, NULL, '2026-01-29 17:20:03', '2026-01-29 17:20:03'),
(17, 'App\\Models\\User', 2, 'auth', '1af70d019e85565da94ade15a2ec798543077c26fafdf33bac73484112349a72', '[\"*\"]', NULL, NULL, '2026-01-29 17:20:40', '2026-01-29 17:20:40'),
(18, 'App\\Models\\User', 2, 'auth', '3a68d3a34e91b9cab30d459b822cf299d8efdfe4bb67ac931c2b6d417e1f2ff5', '[\"*\"]', NULL, NULL, '2026-01-29 17:22:09', '2026-01-29 17:22:09'),
(19, 'App\\Models\\User', 2, 'auth', 'bfd6f71585713af7fb7890bb0c78f6456959bbb0aade42ff1e426f0ed4ad5c5f', '[\"*\"]', NULL, NULL, '2026-01-29 17:24:36', '2026-01-29 17:24:36'),
(20, 'App\\Models\\User', 2, 'auth', '71a7cf6021679158fb31cf012de82f75fcd29e2cc10dcd0abbc0ba8b74b8f435', '[\"*\"]', NULL, NULL, '2026-01-29 17:25:15', '2026-01-29 17:25:15'),
(21, 'App\\Models\\User', 2, 'auth', '0f5f05d24c85638b439c6850f7db3806d26956b30559fd8c5dc7ccfdaeb8809a', '[\"*\"]', NULL, NULL, '2026-01-29 17:25:16', '2026-01-29 17:25:16'),
(22, 'App\\Models\\User', 2, 'auth', 'f15ab38fb909b27712d7024239d104f02387fb419f1ef72f789131173d9dbcfb', '[\"*\"]', NULL, NULL, '2026-01-29 17:27:40', '2026-01-29 17:27:40'),
(23, 'App\\Models\\User', 2, 'auth', '9cd5572fb1cb99f088e57590a298a798838ab076beb56b111d71493f3739a2fc', '[\"*\"]', NULL, NULL, '2026-01-29 17:27:51', '2026-01-29 17:27:51'),
(24, 'App\\Models\\User', 2, 'auth', '5ed35fadf256af5cf0280e497a81c043e3ad6ed8b0b878124efa17f34714fb1f', '[\"*\"]', NULL, NULL, '2026-01-29 17:27:59', '2026-01-29 17:27:59'),
(25, 'App\\Models\\User', 2, 'auth', '5891d6df5826ec318f14f122786d41ab28b2f8bbdc24ee9e19d8dc0e50436d8d', '[\"*\"]', NULL, NULL, '2026-01-29 17:27:59', '2026-01-29 17:27:59'),
(26, 'App\\Models\\User', 2, 'auth', '5e6a620b5cee8053eb24ead95c6f34cfb1774532dba2c033e086592a030a4de9', '[\"*\"]', NULL, NULL, '2026-01-29 17:28:06', '2026-01-29 17:28:06'),
(27, 'App\\Models\\User', 2, 'auth', '0b60bbf62388dc5a678130cefd8503c21976d42ef91032ba930c1f47f05a12dc', '[\"*\"]', NULL, NULL, '2026-01-29 17:28:41', '2026-01-29 17:28:41'),
(28, 'App\\Models\\User', 2, 'auth', 'e6f40fbf4811ea5e82b8f2c33a9dac17dfdbf11c045895852dc405a522c714f6', '[\"*\"]', NULL, NULL, '2026-01-29 17:28:42', '2026-01-29 17:28:42'),
(29, 'App\\Models\\User', 2, 'auth', '26de92532f154659703e2be8d4250e37b2d4c07b32f9da431254db614071130c', '[\"*\"]', NULL, NULL, '2026-01-29 17:28:52', '2026-01-29 17:28:52'),
(30, 'App\\Models\\User', 2, 'auth', '4d8b82ae384f63d063f8274fca93d3ef8e10536fa50218fce8681b9d260debaf', '[\"*\"]', NULL, NULL, '2026-01-29 17:28:53', '2026-01-29 17:28:53'),
(31, 'App\\Models\\User', 2, 'auth', '7b30648ab80861fbc0d71635b513659f974bf93d81ace3da3b35635495e17917', '[\"*\"]', NULL, NULL, '2026-01-29 17:29:03', '2026-01-29 17:29:03'),
(32, 'App\\Models\\User', 2, 'auth', 'e84f1c71d11e0355dacf145d1d54e9490bade0ce45a60b3edda5c093a97c2cb7', '[\"*\"]', NULL, NULL, '2026-01-29 17:29:07', '2026-01-29 17:29:07'),
(33, 'App\\Models\\User', 2, 'auth', 'c4b7298b02da6ec6e3cd56e322718c8bace3a288bc06b28ad6a6a635f1e7bf02', '[\"*\"]', NULL, NULL, '2026-01-29 17:29:09', '2026-01-29 17:29:09'),
(34, 'App\\Models\\User', 2, 'auth', 'c98bf4f7d5dbfbf0ace2e02d2d7903b0528d32a53e8f7aeb48e0ccd82f9d5768', '[\"*\"]', NULL, NULL, '2026-01-29 17:29:10', '2026-01-29 17:29:10'),
(35, 'App\\Models\\User', 2, 'auth', 'c969aa22bd9cc617350d80043c642e594b1b1dbcd8df25234f15696d0c471cbe', '[\"*\"]', NULL, NULL, '2026-01-29 17:31:48', '2026-01-29 17:31:48'),
(36, 'App\\Models\\User', 2, 'auth', 'f82a91e93d82ac2b3c9868d3a1a1c1c76a33e37d462e17505d536bf47c7704c2', '[\"*\"]', NULL, NULL, '2026-01-29 17:31:58', '2026-01-29 17:31:58'),
(37, 'App\\Models\\User', 2, 'auth', 'd07a401ac936fcd9d6abcc4d7052e05fd4b61b03101032d4af28f8e11b701836', '[\"*\"]', NULL, NULL, '2026-01-29 17:50:04', '2026-01-29 17:50:04'),
(38, 'App\\Models\\User', 2, 'auth', 'fea0c66174142f07e2a89102bbd7632b5fd806f68475b826e9d8673094801ec2', '[\"*\"]', NULL, NULL, '2026-01-29 17:50:48', '2026-01-29 17:50:48'),
(39, 'App\\Models\\User', 2, 'auth', 'd00708720d795afbe89f52b3890bd09960c7f8e951b53bd601559f3040c8f685', '[\"*\"]', NULL, NULL, '2026-01-29 17:50:56', '2026-01-29 17:50:56'),
(40, 'App\\Models\\User', 2, 'auth', '480b657da1035b7f3ebe8a3ebd1a378d8b60242bdf96fc2584ded07038b43ef0', '[\"*\"]', NULL, NULL, '2026-01-29 17:50:57', '2026-01-29 17:50:57'),
(41, 'App\\Models\\User', 2, 'auth', '340d60acb089192540dc8542ddef98fc32cefd4a65112e1d31ceffb13daaaa09', '[\"*\"]', NULL, NULL, '2026-01-29 17:52:38', '2026-01-29 17:52:38'),
(42, 'App\\Models\\User', 2, 'auth', 'a4ebeaff8c582c23eaf006cc6ccb60577e6eff851b568b397337bd6a3bb7474c', '[\"*\"]', NULL, NULL, '2026-01-29 17:53:42', '2026-01-29 17:53:42'),
(43, 'App\\Models\\User', 2, 'auth', 'b3c9f6f8cd1e04b7262f4f0fc40e3fd4fcee7e10ab6cf11cd7a55718bb7b0dbc', '[\"*\"]', NULL, NULL, '2026-01-29 17:56:14', '2026-01-29 17:56:14'),
(44, 'App\\Models\\User', 2, 'auth', '3f1ab6e989e55034e87188bd56c43a4296bc3f0e165253c910bf86dd673d0d72', '[\"*\"]', NULL, NULL, '2026-01-29 17:56:15', '2026-01-29 17:56:15'),
(45, 'App\\Models\\User', 2, 'auth', '2b10e91bd0db7707c521c08fece425001f1f775237ffe12e8243d3fe65429313', '[\"*\"]', NULL, NULL, '2026-01-29 17:56:32', '2026-01-29 17:56:32'),
(46, 'App\\Models\\User', 2, 'auth', 'c01007c64ad63605d766e91592d32bbf14fb5a1706841294dcb41ecbb307e685', '[\"*\"]', NULL, NULL, '2026-01-29 18:04:02', '2026-01-29 18:04:02'),
(47, 'App\\Models\\User', 2, 'auth', '24dc4a3acdefdce6707b28bc8f54bbf1af082ad7400715f716e6b9c82f1d690f', '[\"*\"]', NULL, NULL, '2026-01-29 18:10:30', '2026-01-29 18:10:30'),
(48, 'App\\Models\\User', 2, 'auth', '2ee4c79ca98f21a301eb74402020f40a3a5c9f33e0473883bce226322ef7c7a7', '[\"*\"]', NULL, NULL, '2026-01-29 18:16:43', '2026-01-29 18:16:43'),
(49, 'App\\Models\\User', 2, 'auth', 'e8494ec5dc449fffde81d579f82ab93f9ed9d880c729450728bd16f1afac5b15', '[\"*\"]', NULL, NULL, '2026-01-29 18:19:42', '2026-01-29 18:19:42');

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
  `kozterulet_neve` varchar(255) NOT NULL,
  `kozterulet_tipus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ir_szam` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_cim` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirberlo`
--

INSERT INTO `sirberlo` (`id`, `nev`, `kozterulet_neve`, `kozterulet_tipus_id`, `ir_szam`, `created_at`, `updated_at`, `email_cim`) VALUES
(1, 'Kovács János', 'Petőfi utca', 1, 1011, '2025-12-16 12:19:31', '2025-12-16 12:19:31', NULL),
(2, 'Nagy Erzsébet', 'Kossuth tér', 2, 2310, '2025-12-16 12:19:31', '2025-12-16 12:19:31', NULL),
(3, 'Szabó Sándor', 'Ady út', 3, 3500, '2025-12-16 12:19:31', '2025-12-16 12:19:31', NULL),
(4, 'Farkas László', 'Kossuth', 4, 4024, '2026-01-21 10:31:30', '2026-01-21 10:31:30', 'farkas@example.com'),
(5, 'Horváth Réka', 'Petőfi', 5, 5000, '2026-01-21 10:31:30', '2026-01-21 10:31:30', 'reka@example.com'),
(6, 'Bíró András', 'Ady', 6, 6720, '2026-01-21 10:31:30', '2026-01-21 10:31:30', 'andras@example.com'),
(7, 'Török Eszter', 'Arany', 7, 7100, '2026-01-21 10:31:30', '2026-01-21 10:31:30', 'eszter@example.com'),
(8, 'Pintér Dániel', 'Jókai', 8, 8200, '2026-01-21 10:31:30', '2026-01-21 10:31:30', 'daniel@example.com'),
(9, 'Lukács Kitti', 'Rákóczi', 9, 9022, '2026-01-21 10:31:30', '2026-01-21 10:31:30', 'kitti@example.com'),
(10, 'Varga Balázs', 'Bartók', 10, 1023, '2026-01-21 10:31:30', '2026-01-21 10:31:30', 'balazs@example.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sirhely`
--

CREATE TABLE `sirhely` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sor_id` bigint(20) UNSIGNED NOT NULL,
  `sirkod` varchar(255) DEFAULT NULL,
  `allapot` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `sirberlo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirhely`
--

INSERT INTO `sirhely` (`id`, `sor_id`, `sirkod`, `allapot`, `foto`, `sirberlo_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'S001', 'foglalva', NULL, 1, '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, 1, 'S002', 'szabad', NULL, NULL, '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 2, 'S003', 'foglalva', NULL, 2, '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(4, 4, 'S004', 'foglalva', NULL, 4, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 5, 'S005', 'szabad', NULL, NULL, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 6, 'S006', 'foglalva', NULL, 5, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 7, 'S007', 'foglalva', NULL, 6, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 8, 'S008', 'szabad', NULL, NULL, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 9, 'S009', 'foglalva', NULL, 7, '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 10, 'S010', 'foglalva', NULL, 8, '2026-01-21 10:31:30', '2026-01-21 10:31:30');

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
(1, 1, 'egyéni', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, 3, 'családi', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 2, 'egyéni', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(4, 4, 'családi', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 5, 'egyéni', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 6, 'családi', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 7, 'egyéni', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 8, 'családi', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 9, 'egyéni', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 10, 'családi', '2026-01-21 10:31:30', '2026-01-21 10:31:30');

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
(1, 1, '1. sor', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(2, 1, '2. sor', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3, 2, '1. sor', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(4, 2, '3. sor', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(5, 3, '1. sor', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(6, 3, '2. sor', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(7, 4, '1. sor', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(8, 5, '1. sor', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(9, 6, '1. sor', '2026-01-21 10:31:30', '2026-01-21 10:31:30'),
(10, 7, '1. sor', '2026-01-21 10:31:30', '2026-01-21 10:31:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `telepules`
--

CREATE TABLE `telepules` (
  `ir_szam` bigint(20) UNSIGNED NOT NULL,
  `nev` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `telepules`
--

INSERT INTO `telepules` (`ir_szam`, `nev`, `created_at`, `updated_at`) VALUES
(1011, 'Budapest', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(1023, 'Budapest II.', '2026-01-21 10:31:29', '2026-01-21 10:31:29'),
(2310, 'Szigetszentmiklós', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(3500, 'Miskolc', '2025-12-16 12:19:31', '2025-12-16 12:19:31'),
(4024, 'Paks', '2026-01-21 10:31:29', '2026-01-21 10:31:29'),
(5000, 'Szolnok', '2026-01-21 10:31:29', '2026-01-21 10:31:29'),
(6720, 'Szeged', '2026-01-21 10:31:29', '2026-01-21 10:31:29'),
(7100, 'Szekszárd', '2026-01-21 10:31:29', '2026-01-21 10:31:29'),
(8200, 'Veszprém', '2026-01-21 10:31:29', '2026-01-21 10:31:29'),
(9022, 'Győr', '2026-01-21 10:31:29', '2026-01-21 10:31:29');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
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

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Balázs', 'balazs@gmail.com', NULL, '$2y$12$cNCP4z0n2s5StB5p7NQWdubTDcoWzu1GvPxpJN5fSB4LvWIec9DWO', 'user', NULL, NULL, NULL, NULL, '2026-01-06 08:03:21', '2026-01-06 08:03:21'),
(2, 'Boldi', 'boldi@gmail.com', NULL, '$2y$12$QGYXjkwatcQ.Yf.YFl2htOLKjd9yw8Yj.pMFEeyg4MYbPVJpQ3Q/O', 'admin', NULL, NULL, NULL, NULL, '2026-01-21 08:49:58', '2026-01-21 08:49:58');

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
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
  ADD KEY `sirberlo_ir_szam_foreign` (`ir_szam`);

--
-- A tábla indexei `sirhely`
--
ALTER TABLE `sirhely`
  ADD PRIMARY KEY (`id`),
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
  ADD PRIMARY KEY (`ir_szam`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `parcella`
--
ALTER TABLE `parcella`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `elhunyt_halotti_anyakonyvi_kiv_foreign` FOREIGN KEY (`halotti_anyakonyvi_kiv`) REFERENCES `dokumentum` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elhunyt_sirhely_id_foreign` FOREIGN KEY (`sirhely_id`) REFERENCES `sirhely` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `sirberlo`
--
ALTER TABLE `sirberlo`
  ADD CONSTRAINT `sirberlo_ir_szam_foreign` FOREIGN KEY (`ir_szam`) REFERENCES `telepules` (`ir_szam`),
  ADD CONSTRAINT `sirberlo_kozterulet_tipus_id_foreign` FOREIGN KEY (`kozterulet_tipus_id`) REFERENCES `kozterulet_tipus` (`id`) ON DELETE SET NULL;

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
