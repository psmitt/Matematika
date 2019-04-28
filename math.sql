-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2019. Ápr 27. 15:37
-- Kiszolgáló verziója: 8.0.11
-- PHP verzió: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `math`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `article`
--

CREATE TABLE `article` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `article_chapter` smallint(5) UNSIGNED NOT NULL,
  `article_number` smallint(5) UNSIGNED NOT NULL,
  `article_type` enum('Axióma','Definíció','Jelölés','Egzisztencia','Unicitás','Szükségesség-Elégségesség','Ekvivalencia','Azonosság','Egyenlőség','Egyenlőtlenség','Sejtés','Feladat') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `article_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `article_entities` smallint(5) UNSIGNED DEFAULT NULL,
  `characteristics` enum('Fajtái','Jellemzői','Relációi','Műveletei','Leképezései','Nevezetes','Képletek','Eljárások') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `article_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `article_statement` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- A tábla adatainak kiíratása `article`
--

INSERT INTO `article` (`article_id`, `article_chapter`, `article_number`, `article_type`, `article_title`, `article_entities`, `characteristics`, `article_keywords`, `article_statement`) VALUES
(1, 2, 1, 'Axióma', 'a halmazelmélet alapelve', 11, NULL, 'halmazok univerzalitása', 'Minden halmaz.'),
(2, 2, 2, 'Jelölés', 'halmaz eleme, nem eleme', 11, 'Relációi', NULL, 'Jelölje \\(x \\in y\\) azt, hogy \\(x\\) halmaz <dfn>eleme</dfn> az \\(y\\) halmaznak.\n<br>\nJelölje \\(x \\notin y\\) azt, hogy \\(x\\) halmaz <dfn>nem eleme</dfn> az \\(y\\) halmaznak.\n\n\\[x \\notin y\\ ≝\\ \\neg(x \\in y)\\]'),
(3, 2, 3, 'Axióma', 'meghatározottsági axióma, extenzionalitási axióma', 11, 'Relációi', 'halmazok egyenlősége, halmazok azonossága', '<dfn>Egyenlő halmazok</dfn> azok, amelyeknek elemei megegyeznek.\n\n\\[x = y\\ \\ ≝\\ \\ \\forall z (z \\in x ⇔ z \\in y)\\]\n'),
(4, 2, 4, 'Definíció', 'üres halmaz', 11, 'Fajtái', NULL, '<dfn>Üres halmazok</dfn> azok, amelyeknek nincs eleme.'),
(5, 2, 5, 'Axióma', 'üres halmaz posztulátuma', NULL, NULL, NULL, 'Létezik üres halmaz.\n\\[\\exists x \\forall y(y \\notin x)\\]'),
(6, 2, 6, 'Unicitás', 'üres halmaz unicitása', NULL, NULL, NULL, 'Csak egyetlen üres halmaz létezik.\n\\[\\exists! x \\forall y(y \\notin x)\\]'),
(7, 2, 7, 'Jelölés', 'üres halmaz jele', 11, 'Nevezetes', NULL, 'Jelölje \\(\\emptyset\\) az üres halmazt.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chapter`
--

CREATE TABLE `chapter` (
  `chapter_id` smallint(5) UNSIGNED NOT NULL,
  `chapter_main` smallint(5) UNSIGNED DEFAULT NULL,
  `chapter_number` tinyint(3) UNSIGNED NOT NULL,
  `chapter_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chapter_content` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- A tábla adatainak kiíratása `chapter`
--

INSERT INTO `chapter` (`chapter_id`, `chapter_main`, `chapter_number`, `chapter_title`, `chapter_content`) VALUES
(1, NULL, 1, 'LOGIKA', 'A matematikai logika célja olyan formális nyelv bevezetése, amely egyértelműsége révén lehetővé teszi ellentmondásmentes elméletek axiomatikus felépítését.'),
(2, NULL, 2, 'HALMAZELMÉLET', 'A halmazelméleti kijelentések halmazokról szólnak.\nA halmaz a halmazelmélet <em>legáltalánosabb</em> fogalma: nincs közeli nemfogalma (<i>genus proximum</i>), ezért nem definiálható.\nArra a kérdésre, hogy <q>Mi a halmaz?</q>, a válasz a halmazelmélet összes kijelentése, együtt.\n<p>\nA halmazokról szóló egyetlen alapvető kijelentésforma (<i>predicatum</i>) az az állítás, hogy egy halmaz <em>eleme</em> egy másik halmaznak.'),
(3, NULL, 3, 'ALGEBRA', NULL),
(4, NULL, 4, 'SZÁMELMÉLET', NULL),
(5, NULL, 5, 'GEOMETRIA', NULL),
(6, NULL, 6, 'ANALÍZIS', NULL),
(7, NULL, 7, 'TOPOLÓGIA', NULL),
(8, 1, 1, 'KIJELENTÉSLOGIKA', NULL),
(9, 1, 2, 'PREDIKÁTUMLOGIKA', NULL),
(10, 1, 3, 'LOGIKAI ALGEBRÁK', NULL),
(11, 2, 1, 'RELÁCIÓELMÉLET', NULL),
(12, 3, 1, 'ABSZTRAKT ALGEBRA', NULL),
(13, 3, 2, 'UNIVERZÁLIS ALGEBRA', NULL),
(14, 5, 1, 'EUKLIDESZI GEOMETRIA', NULL),
(15, 5, 2, 'ABSZOLÚT GEOMETRIA', NULL),
(16, 6, 1, 'VALÓS ANALÍZIS', NULL),
(17, 6, 2, 'KOMPLEX ANALÍZIS', NULL),
(18, 1, 4, 'KATEGÓRIAELMÉLET', NULL),
(19, 1, 5, 'MODELLELMÉLET', NULL),
(20, 16, 1, 'HATÁRÉRTÉKSZÁMÍTÁS', NULL),
(21, 20, 1, 'SOROZATOK', NULL),
(22, 20, 2, 'VÉGTELEN SOROK', NULL),
(23, 16, 2, 'DIFFERENCIÁLSZÁMÍTÁS', NULL),
(24, 16, 3, 'INTEGRÁLSZÁMÍTÁS', NULL),
(25, 16, 4, 'DIFFERENCIÁLEGYENLETEK', NULL),
(26, 6, 3, 'VEKTORANALÍZIS', NULL),
(27, 6, 4, 'NUMERIKUS ANALÍZIS', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `entities`
--

CREATE TABLE `entities` (
  `entities_id` smallint(5) UNSIGNED NOT NULL,
  `entities_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- A tábla adatainak kiíratása `entities`
--

INSERT INTO `entities` (`entities_id`, `entities_name`) VALUES
(1, 'Algoritmusok'),
(2, 'Determinánsok'),
(3, 'Egyenletek'),
(4, 'Egyenlőtlenségek'),
(5, 'Felületek'),
(6, 'Fraktálok'),
(7, 'Függvények'),
(8, 'Funkcionálok'),
(9, 'Görbék'),
(10, 'Gráfok'),
(11, 'Halmazok'),
(12, 'Kijelentések'),
(13, 'Mátrixok'),
(14, 'Permutációk'),
(15, 'Relációk'),
(16, 'Síkidomok'),
(17, 'Sorozatok'),
(18, 'Struktúrák'),
(19, 'Számok'),
(20, 'Tenzorok'),
(21, 'Testek'),
(22, 'Transzformációk'),
(23, 'Vektorok');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `section`
--

CREATE TABLE `section` (
  `section_id` int(10) UNSIGNED NOT NULL,
  `section_article` int(10) UNSIGNED NOT NULL,
  `section_number` tinyint(3) UNSIGNED NOT NULL,
  `section_type` enum('Bizonyítás','Folyomány','Megoldás') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `section_summary` text COLLATE utf8_unicode_ci,
  `section_details` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `article_chapter` (`article_chapter`),
  ADD KEY `article_entities` (`article_entities`);

--
-- A tábla indexei `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`chapter_id`);

--
-- A tábla indexei `entities`
--
ALTER TABLE `entities`
  ADD PRIMARY KEY (`entities_id`);

--
-- A tábla indexei `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `section_article` (`section_article`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `chapter`
--
ALTER TABLE `chapter`
  MODIFY `chapter_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT a táblához `entities`
--
ALTER TABLE `entities`
  MODIFY `entities_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT a táblához `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_chapter`) REFERENCES `chapter` (`chapter_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`article_entities`) REFERENCES `entities` (`entities_id`) ON UPDATE CASCADE;

--
-- Megkötések a táblához `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`section_article`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
