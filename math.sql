-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2019. Ápr 28. 06:59
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

--
-- A tábla adatainak kiíratása `article`
--

INSERT INTO `article` (`article_id`, `article_chapter`, `article_number`, `article_type`, `article_title`, `article_entities`, `characteristics`, `article_keywords`, `article_statement`) VALUES
(1, 2, 1, 'Axióma', 'a halmazelmélet alapelve', 11, NULL, 'halmazok univerzalitása', 'Minden halmaz.'),
(2, 2, 1, 'Jelölés', 'halmaz eleme, nem eleme', 11, 'Relációi', NULL, 'Jelölje \\(x \\in A\\) azt, hogy \\(x\\) <dfn>eleme</dfn> az \\(A\\) halmaznak.\n<br>\nJelölje \\(x \\notin A\\) azt, hogy \\(x\\) <dfn>nem eleme</dfn> az \\(A\\) halmaznak.\n\n\\[x \\notin A \\ \\ ≝ \\ \\ \\neg(x \\in A)\\]'),
(3, 2, 3, 'Axióma', 'meghatározottsági axióma, extenzionalitási axióma', 11, 'Relációi', 'halmazok egyenlősége, halmazok azonossága', '<dfn>Egyenlő halmazok</dfn> azok, amelyeknek elemei megegyeznek.\n\n\\[A = B\\ \\ ≝ \\ \\ \\forall x (x \\in A ⇔ x \\in B)\\]\n'),
(4, 2, 4, 'Definíció', 'üres halmaz', 11, 'Fajtái', NULL, '<dfn>Üres halmazok</dfn> azok, amelyeknek nincs eleme.'),
(5, 2, 5, 'Axióma', 'üres halmaz posztulátuma', 11, NULL, NULL, 'Létezik üres halmaz.\n\\[\\exists A \\forall x(x \\notin A)\\]'),
(6, 2, 6, 'Unicitás', 'üres halmaz unicitása', 11, NULL, NULL, 'Csak egyetlen üres halmaz létezik.\n\\[\\exists! A \\forall x(x \\notin A)\\]'),
(7, 2, 7, 'Jelölés', 'üres halmaz jele', 11, 'Nevezetes', NULL, 'Jelölje \\(\\emptyset\\) az üres halmazt.'),
(8, 2, 8, 'Jelölés', 'részhalmaz, halmaz része', 11, 'Relációi', NULL, 'Jelölje \\(A \\subseteq B\\) azt, hogy \\(A\\) halmaz <dfn>része</dfn> a \\(B\\) halmaznak.\n\n\\[A \\subseteq B \\ \\ ≝ \\ \\ \\forall x (x \\in A ⇒ x \\in B)\\]');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
