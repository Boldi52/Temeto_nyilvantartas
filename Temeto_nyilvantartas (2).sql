-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Dec 16. 21:07
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
(1, 1, 15000.00, 12, '2025-01-01', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 2, 20000.00, 24, '2025-06-15', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 3, 10000.00, 6, '2025-10-20', '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1, 1, 1, 'Szerződés', '2025-01-01', 'Bérleti szerződés', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 2, 2, 'Befizetés', '2025-06-15', 'Éves díjfizetés', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 3, 3, 'Nyilatkozat', '2025-10-20', 'Tulajdonosi nyilatkozat', '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1, 'Szerződés', 1, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 'Befizetés', 2, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 'Nyilatkozat', 3, '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1, 'Tóth Árpád', '1940-05-12', '2020-01-15', 'Kis Erzsébet', 1, NULL, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 'Kiss Erzsi', '1950-07-01', '2018-11-22', 'Nagy Anna', 2, NULL, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 'Farkas Béla', '1965-12-20', '2022-03-30', 'Simon Margit', 3, NULL, '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1, 'utca', NULL, NULL),
(2, 'tér', NULL, NULL),
(3, 'körút', NULL, NULL);

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
(2, '2025_12_05_092803_create_kozterulet_tipuses_table', 2),
(3, '2025_12_05_093040_create_parcelas_table', 3),
(5, '2025_12_05_070700_create_telepules_table', 4),
(6, '2025_12_04_120508_create_sirberlos_table', 5),
(7, '2025_12_05_093115_create_sors_table', 6),
(8, '2025_12_04_110507_create_sirhelys_table', 7),
(9, '2025_12_05_093222_create_sirhely_tipuses_table', 8),
(10, '2025_12_05_093340_create_befizetes_table', 9),
(11, '2025_12_04_121631_create_dokumentums_table', 10),
(12, '2025_12_05_092501_create_dokumentum_tipuses_table', 11),
(13, '2025_12_04_121328_create_elhunyts_table', 12);

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
(1, 'A szektor', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 'B szektor', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 'C szektor', '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sirberlo`
--

INSERT INTO `sirberlo` (`id`, `nev`, `kozterulet_neve`, `kozterulet_tipus_id`, `ir_szam`, `created_at`, `updated_at`) VALUES
(1, 'Kovács Péter', 'Petőfi', 1, 1011, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 'Nagy Katalin', 'Kossuth', 2, 2022, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 'Szabó Gábor', 'Deák', 3, 3033, '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1, 1, 'A1-01', 'használt', NULL, 1, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 2, 'A2-01', 'szabad', NULL, 2, '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 3, 'B1-01', 'használt', NULL, 3, '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1, 1, 'egyes', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 2, 'urnafülke', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 3, 'gyermek', '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1, 1, '1. sor', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(2, 1, '2. sor', '2025-12-16 20:07:21', '2025-12-16 20:07:21'),
(3, 2, '1. sor', '2025-12-16 20:07:21', '2025-12-16 20:07:21');

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
(1011, 'Budapest', NULL, NULL),
(2022, 'Győr', NULL, NULL),
(3033, 'Szeged', NULL, NULL);

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
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `befizetes`
--
ALTER TABLE `befizetes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `dokumentum`
--
ALTER TABLE `dokumentum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `dokumentum_tipus`
--
ALTER TABLE `dokumentum_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `elhunyt`
--
ALTER TABLE `elhunyt`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `kozterulet_tipus`
--
ALTER TABLE `kozterulet_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `parcella`
--
ALTER TABLE `parcella`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `sirberlo`
--
ALTER TABLE `sirberlo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `sirhely`
--
ALTER TABLE `sirhely`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `sirhely_tipus`
--
ALTER TABLE `sirhely_tipus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `sor`
--
ALTER TABLE `sor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
