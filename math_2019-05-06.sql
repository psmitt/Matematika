-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: math
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS article;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE article (
  article_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  article_chapter smallint(5) unsigned NOT NULL,
  article_number smallint(5) unsigned NOT NULL,
  article_type enum('Axióma','Definíció','Jelölés','Egzisztencia','Unicitás','Szükségesség-Elégségesség','Ekvivalencia','Azonosság','Egyenlőség','Egyenlőtlenség','Sejtés','Feladat') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  article_title varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  article_entities smallint(5) unsigned DEFAULT NULL,
  characteristics enum('Fajtái','Jellemzői','Relációi','Műveletei','Leképezései','Nevezetes','Képletek','Eljárások') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  article_keywords varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  article_statement text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (article_id),
  KEY article_chapter (article_chapter),
  KEY article_entities (article_entities),
  CONSTRAINT article_ibfk_1 FOREIGN KEY (article_chapter) REFERENCES chapter (chapter_id) ON UPDATE CASCADE,
  CONSTRAINT article_ibfk_2 FOREIGN KEY (article_entities) REFERENCES entities (entities_id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES article WRITE;
/*!40000 ALTER TABLE article DISABLE KEYS */;
INSERT INTO article VALUES (1,2,1,'Axióma','a halmazelmélet alapelve',11,NULL,'halmazok univerzalitása','Minden halmaz.'),(2,2,1,'Jelölés','halmaz eleme, nem eleme',11,'Relációi',NULL,'Jelölje \\(x \\in A\\) azt, hogy \\(x\\) <dfn>eleme</dfn> az \\(A\\) halmaznak.\n<br>\nJelölje \\(x \\notin A\\) azt, hogy \\(x\\) <dfn>nem eleme</dfn> az \\(A\\) halmaznak.\n\n\\[x \\notin A \\ \\ ≝ \\ \\ \\neg(x \\in A)\\]'),(3,2,3,'Axióma','meghatározottsági axióma, extenzionalitási axióma',11,'Relációi','halmazok egyenlősége, halmazok azonossága','<dfn>Egyenlő halmazok</dfn> azok, amelyeknek elemei megegyeznek.\n\n\\[A = B\\ \\ ≝ \\ \\ \\forall x \\ (x \\in A ⇔ x \\in B)\\]\n'),(4,2,4,'Definíció','üres halmaz',11,'Fajtái',NULL,'<dfn>Üres halmazok</dfn> azok, amelyeknek nincs eleme.'),(5,2,4,'Axióma','üres halmaz posztulátuma',11,NULL,'NBG, PST, ZF, ZFC','Létezik üres halmaz.\n\\[\\exists A \\ \\forall x \\ (x \\notin A)\\]'),(6,2,9,'Unicitás','üres halmaz unicitása',11,NULL,NULL,'Csak egyetlen üres halmaz létezik.\n\\[\\exists! A \\ \\forall x \\ (x \\notin A)\\]'),(7,2,6,'Jelölés','üres halmaz jele',11,'Nevezetes',NULL,'Jelölje \\(\\emptyset\\) az üres halmazt.'),(8,2,11,'Definíció','részhalmaz, halmaz része',11,'Relációi',NULL,'Egy halmaz <dfn>része</dfn> annak, amelyik az elemeit tartalmazza.\n\n\\[A \\subseteq B \\ \\ ≝ \\ \\ \\forall x \\ (x \\in A ⇒ x \\in B)\\]'),(9,2,9,'Jelölés','részhalmaz jele',11,'Relációi',NULL,'Jelölje \\(A \\subseteq B\\) azt, hogy \\(A\\) halmaz <dfn>része</dfn> a \\(B\\) halmaznak.'),(10,28,5,'Definíció','univerzális osztály',24,NULL,NULL,'\\(V \\ ≝ \\ \\{x \\mid x=x\\}\\)'),(11,28,7,'Definíció','üres osztály',24,NULL,NULL,'\\(\\emptyset \\ ≝ \\ \\{x \\mid x≠x\\}\\)'),(12,2,6,'Axióma','páraxióma',11,NULL,'NBG, PST, ZF, ZFC','Bármely \\(x\\) és \\(y\\) esetén létezik az a halmaz, amelynek csak \\(x\\) és \\(y\\) az elemei.\n\\[\\forall x, y \\ \\exists A \\ \\forall z \\ (z \\in A \\iff\nz = x \\lor z = y)\\]\n'),(13,2,7,'Axióma','egyesítési axióma',11,NULL,'NBG, PST, ZF, ZFC','Bármely halmazrendszer egyesíthető.\n\\[\\forall A \\ \\exists B \\ \\forall x \\ \\big(x \\in B \\iff\n\\exists y \\ (x \\in y \\land y \\in A) \\big)\\]'),(14,2,12,'Axióma','hatványhalmaz axióma',11,NULL,'NBG, PST, ZF, ZFC','Minden halmaznak van hatványhalmaza.\n\\[\\forall A \\ \\exists B \\ \\forall x \\ (x \\in B \\iff x \\subseteq A)\\]'),(15,28,4,'Axióma','extenzionalitási axióma',24,NULL,NULL,'Az azonos terjedelmű osztályok egyenlőek.\n\\[A = B\\ \\ ≝ \\ \\ \\forall x \\ (x \\in A ⇔ x \\in B)\\]'),(16,28,2,'Definíció','osztály, igazságosztály',24,NULL,NULL,'A \\(P\\) egyargumentumú predikátum <dfn>osztály</dfn>ának hívjuk az \\(x \\mid P(x)\\) megnevezés terjedelmét.'),(17,28,0,'Jelölés','osztály jelölése',24,NULL,NULL,'Jelölje \\(\\{x \\mid P(x)\\}\\) a \\(P\\) predikátum osztályát.'),(18,28,2,'Jelölés','elem, osztály eleme',24,NULL,NULL,'Jelölje \\(a \\in \\{x \\mid P(x)\\}\\) azt, hogy \\(a\\) <dfn>eleme</dfn> az \\(\\{x \\mid P(x)\\}\\) osztálynak.\n\\[a \\in \\{x \\mid P(x)\\} \\ ≝ \\ P(a)\\]'),(19,31,0,'Definíció','halmaz',11,NULL,NULL,'A <dfn>halmaz</dfn> olyan osztály, amelyik <dfn>eleme</dfn> egy másik osztálynak.\n\\[x \\text{ halmaz} \\ ≝ \\ \\exists A \\ (x \\in A)\\]'),(20,31,2,'Definíció','valódi osztály',11,NULL,NULL,'<dfn>Valódi</dfn> osztály az, amelyik nem halmaz.'),(21,32,1,'Axióma','osztálykomprehenzió',24,NULL,NULL,'Bármely \\(\\phi(x)\\) osztályokra vonatkozó formulához létezik azoknak a <em>halmazoknak</em> az osztálya, amelyekre \\(\\phi(x)\\) teljesül.\n\\[\\exists A \\ \\forall x \\ (x \\in A \\iff \\phi(x) \\land x \\text{ halmaz})\\]');
/*!40000 ALTER TABLE article ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS chapter;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE chapter (
  chapter_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  chapter_main smallint(5) unsigned DEFAULT NULL,
  chapter_number tinyint(3) unsigned NOT NULL,
  chapter_title varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  chapter_content text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (chapter_id)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES chapter WRITE;
/*!40000 ALTER TABLE chapter DISABLE KEYS */;
INSERT INTO chapter VALUES (1,NULL,1,'LOGIKA','A matematikai logika célja olyan formális nyelv bevezetése, amely egyértelműsége révén lehetővé teszi ellentmondásmentes elméletek axiomatikus felépítését.'),(2,NULL,2,'HALMAZELMÉLET','A halmazelmélet célja olyan ellentmondásmentes elmélet axiomatikus felépítése, amelyben modellezhetők a természetes számok.\n<p>\nA <em>tiszta</em> halmazelméletben nem definiáljuk a halmaz fogalmát, hanem minden matematikai képződményt halmaznak tekintünk. Nem definiáljuk a <em>halmaz eleme</em> relációt sem, hanem a halmazokra vonatkozó egyetlen kijelentésformának tekintjük, amelynek tulajdonságait a halmazelméleti axiómák rögzítik.'),(3,NULL,3,'ALGEBRA',NULL),(4,NULL,4,'SZÁMELMÉLET',NULL),(5,NULL,5,'GEOMETRIA',NULL),(6,NULL,6,'ANALÍZIS',NULL),(7,NULL,7,'TOPOLÓGIA',NULL),(8,1,2,'KIJELENTÉSLOGIKA',NULL),(9,1,3,'PREDIKÁTUMLOGIKA',NULL),(10,3,1,'LOGIKAI ALGEBRÁK',NULL),(11,2,3,'RELÁCIÓELMÉLET',NULL),(12,3,2,'ABSZTRAKT ALGEBRA',NULL),(13,3,3,'UNIVERZÁLIS ALGEBRA',NULL),(14,5,1,'EUKLIDESZI GEOMETRIA',NULL),(15,5,2,'ABSZOLÚT GEOMETRIA',NULL),(16,6,1,'VALÓS ANALÍZIS',NULL),(17,6,2,'KOMPLEX ANALÍZIS',NULL),(18,1,5,'KATEGÓRIAELMÉLET',NULL),(19,1,6,'MODELLELMÉLET',NULL),(20,16,1,'HATÁRÉRTÉKSZÁMÍTÁS',NULL),(21,20,1,'SOROZATOK',NULL),(22,20,2,'VÉGTELEN SOROK',NULL),(23,16,2,'DIFFERENCIÁLSZÁMÍTÁS',NULL),(24,16,3,'INTEGRÁLSZÁMÍTÁS',NULL),(25,16,4,'DIFFERENCIÁLEGYENLETEK',NULL),(26,6,3,'VEKTORANALÍZIS',NULL),(27,6,4,'NUMERIKUS ANALÍZIS',NULL),(28,1,4,'OSZTÁLYELMÉLET','Az osztályelmélet olyan ellentmondásmentes és negációteljes elmélet, amely alkalmas a halmazok fogalmának megalapozására.'),(29,1,1,'LOGIKAI GRAMMATIKA ( KATEGORIÁLIS NYELVTAN )',NULL),(31,2,1,'OSZTÁLY ALAPÚ AXIÓMARENDSZEREK','Az osztály alapú axiómarendszerek a halmaz fogalmát az osztály fogalmára vezetik vissza, és a <em>halmaz</em> predikátumot felhasználják az axiómák felépítésében. Az <em>eleme</em> reláció ebben az esetben az osztályelméletben definiált fogalomnak felel meg, a halmazok egyenlősége pedig a nekik megfelelő osztályok egyenlőségét jelenti (ld. <strong>extenzionalitási axióma</strong>).'),(32,31,1,'ZSEBHALMAZELMÉLET','A zsebhalmazelmélet (<i>pocket set theory</i>, <b>PST</b>) olyan osztály alapú halmazelmélet, amelyben csak két végtelen számosság van. Megalkotója <i>Randall Holmes</i>, amerikai matematikus.'),(33,31,2,'ACKERMANN-HALMAZELMÉLET ( <i>Wilhelm Ackermann</i> )',NULL),(34,31,3,'NEUMANN-BERNAYS-GÖDEL-HALMAZELMÉLET','John von Neumann, Paul Bernays, Kurt Gödel');
/*!40000 ALTER TABLE chapter ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS entities;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE entities (
  entities_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  entities_name varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (entities_id),
  UNIQUE KEY entities_name (entities_name)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES entities WRITE;
/*!40000 ALTER TABLE entities DISABLE KEYS */;
INSERT INTO entities VALUES (1,'Algoritmusok'),(2,'Determinánsok'),(3,'Egyenletek'),(4,'Egyenlőtlenségek'),(5,'Felületek'),(6,'Fraktálok'),(7,'Függvények'),(8,'Funkcionálok'),(9,'Görbék'),(10,'Gráfok'),(11,'Halmazok'),(12,'Kijelentések'),(13,'Mátrixok'),(24,'Osztályok'),(14,'Permutációk'),(25,'Pontok'),(15,'Relációk'),(16,'Síkidomok'),(17,'Sorozatok'),(18,'Struktúrák'),(19,'Számok'),(27,'Szimbólumok'),(20,'Tenzorok'),(21,'Testek'),(22,'Transzformációk'),(26,'Végtelen sorok'),(23,'Vektorok');
/*!40000 ALTER TABLE entities ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS section;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE section (
  section_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  section_article int(10) unsigned NOT NULL,
  section_number tinyint(3) unsigned NOT NULL,
  section_type enum('Bizonyítás','Folyomány','Megoldás') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  section_summary text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  section_details text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (section_id),
  KEY section_article (section_article),
  CONSTRAINT section_ibfk_1 FOREIGN KEY (section_article) REFERENCES article (article_id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES section WRITE;
/*!40000 ALTER TABLE section DISABLE KEYS */;
INSERT INTO section VALUES (1,6,1,'Bizonyítás','A meghatározottsági axióma alapján.','Tegyük fel, hogy A és B üres halmazok.<br>\nA meghatározottsági axióma alapján A = B.\n'),(2,8,1,'Folyomány','A részhalmaz reláció olyan részben rendezés, amelynek a legkisebb eleme az üres halmaz.','<li>reflexív: \\(\\forall A\\ \\big(A \\subseteq A\\big)\\)\n\n<li>antiszimmetrikus: \\(\\forall A,B\\ \\big(A \\subseteq B \\land B \\subseteq A \\implies A = B\\big)\\)\n\n<li>tranzitív: \\(\\forall A,B,C\\ \\big(A \\subseteq B \\land B \\subseteq C \\implies A \\subseteq C\\big)\\)\n\n<li>legkisebb elem: \\(\\forall A\\ \\big(\\emptyset \\subseteq A\\big)\\)');
/*!40000 ALTER TABLE section ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-06 14:28:13
