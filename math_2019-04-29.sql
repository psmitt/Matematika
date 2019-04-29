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
  article_type enum('Axióma','Definíció','Jelölés','Egzisztencia','Unicitás','Szükségesség-Elégségesség','Ekvivalencia','Azonosság','Egyenlőség','Egyenlőtlenség','Sejtés','Feladat') COLLATE utf8_unicode_ci NOT NULL,
  article_title varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  article_entities smallint(5) unsigned DEFAULT NULL,
  characteristics enum('Fajtái','Jellemzői','Relációi','Műveletei','Leképezései','Nevezetes','Képletek','Eljárások') COLLATE utf8_unicode_ci DEFAULT NULL,
  article_keywords varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  article_statement text COLLATE utf8_unicode_ci,
  PRIMARY KEY (article_id),
  KEY article_chapter (article_chapter),
  KEY article_entities (article_entities),
  CONSTRAINT article_ibfk_1 FOREIGN KEY (article_chapter) REFERENCES chapter (chapter_id) ON UPDATE CASCADE,
  CONSTRAINT article_ibfk_2 FOREIGN KEY (article_entities) REFERENCES entities (entities_id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES article WRITE;
/*!40000 ALTER TABLE article DISABLE KEYS */;
INSERT INTO article VALUES (1,2,1,'Axióma','a halmazelmélet alapelve',11,NULL,'halmazok univerzalitása','Minden halmaz.'),(2,2,1,'Jelölés','halmaz eleme, nem eleme',11,'Relációi',NULL,'Jelölje \\(x \\in A\\) azt, hogy \\(x\\) <dfn>eleme</dfn> az \\(A\\) halmaznak.\n<br>\nJelölje \\(x \\notin A\\) azt, hogy \\(x\\) <dfn>nem eleme</dfn> az \\(A\\) halmaznak.\n\n\\[x \\notin A \\ \\ ≝ \\ \\ \\neg(x \\in A)\\]'),(3,2,3,'Axióma','meghatározottsági axióma, extenzionalitási axióma',11,'Relációi','halmazok egyenlősége, halmazok azonossága','<dfn>Egyenlő halmazok</dfn> azok, amelyeknek elemei megegyeznek.\n\n\\[A = B\\ \\ ≝ \\ \\ \\forall x (x \\in A ⇔ x \\in B)\\]\n'),(4,2,4,'Definíció','üres halmaz',11,'Fajtái',NULL,'<dfn>Üres halmazok</dfn> azok, amelyeknek nincs eleme.'),(5,2,5,'Axióma','üres halmaz posztulátuma',11,NULL,NULL,'Létezik üres halmaz.\n\\[\\exists A \\forall x(x \\notin A)\\]'),(6,2,6,'Unicitás','üres halmaz unicitása',11,NULL,NULL,'Csak egyetlen üres halmaz létezik.\n\\[\\exists! A \\forall x(x \\notin A)\\]'),(7,2,6,'Jelölés','üres halmaz jele',11,'Nevezetes',NULL,'Jelölje \\(\\emptyset\\) az üres halmazt.'),(8,2,9,'Definíció','részhalmaz, halmaz része',11,'Relációi',NULL,'Egy halmaz <dfn>része</dfn> annak, amelyik az elemeit tartalmazza.\n\n\\[A \\subseteq B \\ \\ ≝ \\ \\ \\forall x (x \\in A ⇒ x \\in B)\\]'),(9,2,8,'Jelölés','részhalmaz jele',11,'Relációi',NULL,'Jelölje \\(A \\subseteq B\\) azt, hogy \\(A\\) halmaz <dfn>része</dfn> a \\(B\\) halmaznak.');
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
  chapter_title varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  chapter_content text COLLATE utf8_unicode_ci,
  PRIMARY KEY (chapter_id)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES chapter WRITE;
/*!40000 ALTER TABLE chapter DISABLE KEYS */;
INSERT INTO chapter VALUES (1,NULL,1,'LOGIKA','A matematikai logika célja olyan formális nyelv bevezetése, amely egyértelműsége révén lehetővé teszi ellentmondásmentes elméletek axiomatikus felépítését.'),(2,NULL,2,'HALMAZELMÉLET','A halmazelméleti kijelentések halmazokról szólnak.\nA halmaz a halmazelmélet <em>legáltalánosabb</em> fogalma: nincs közeli nemfogalma (<i>genus proximum</i>), ezért nem definiálható.\nArra a kérdésre, hogy <q>Mi a halmaz?</q>, a válasz a halmazelmélet összes kijelentése, együtt.\n<p>\nA halmazokról szóló egyetlen alapvető kijelentésforma (<i>predicatum</i>) az az állítás, hogy egy halmaz <em>eleme</em> egy másik halmaznak.'),(3,NULL,3,'ALGEBRA',NULL),(4,NULL,4,'SZÁMELMÉLET',NULL),(5,NULL,5,'GEOMETRIA',NULL),(6,NULL,6,'ANALÍZIS',NULL),(7,NULL,7,'TOPOLÓGIA',NULL),(8,1,1,'KIJELENTÉSLOGIKA',NULL),(9,1,2,'PREDIKÁTUMLOGIKA',NULL),(10,1,3,'LOGIKAI ALGEBRÁK',NULL),(11,2,1,'RELÁCIÓELMÉLET',NULL),(12,3,1,'ABSZTRAKT ALGEBRA',NULL),(13,3,2,'UNIVERZÁLIS ALGEBRA',NULL),(14,5,1,'EUKLIDESZI GEOMETRIA',NULL),(15,5,2,'ABSZOLÚT GEOMETRIA',NULL),(16,6,1,'VALÓS ANALÍZIS',NULL),(17,6,2,'KOMPLEX ANALÍZIS',NULL),(18,1,4,'KATEGÓRIAELMÉLET',NULL),(19,1,5,'MODELLELMÉLET',NULL),(20,16,1,'HATÁRÉRTÉKSZÁMÍTÁS',NULL),(21,20,1,'SOROZATOK',NULL),(22,20,2,'VÉGTELEN SOROK',NULL),(23,16,2,'DIFFERENCIÁLSZÁMÍTÁS',NULL),(24,16,3,'INTEGRÁLSZÁMÍTÁS',NULL),(25,16,4,'DIFFERENCIÁLEGYENLETEK',NULL),(26,6,3,'VEKTORANALÍZIS',NULL),(27,6,4,'NUMERIKUS ANALÍZIS',NULL);
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
  entities_name varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (entities_id)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES entities WRITE;
/*!40000 ALTER TABLE entities DISABLE KEYS */;
INSERT INTO entities VALUES (1,'Algoritmusok'),(2,'Determinánsok'),(3,'Egyenletek'),(4,'Egyenlőtlenségek'),(5,'Felületek'),(6,'Fraktálok'),(7,'Függvények'),(8,'Funkcionálok'),(9,'Görbék'),(10,'Gráfok'),(11,'Halmazok'),(12,'Kijelentések'),(13,'Mátrixok'),(14,'Permutációk'),(15,'Relációk'),(16,'Síkidomok'),(17,'Sorozatok'),(18,'Struktúrák'),(19,'Számok'),(20,'Tenzorok'),(21,'Testek'),(22,'Transzformációk'),(23,'Vektorok');
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
  section_type enum('Bizonyítás','Folyomány','Megoldás') COLLATE utf8_unicode_ci NOT NULL,
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
INSERT INTO section VALUES (1,6,1,'Bizonyítás','A meghatározottsági axióma alapján.','Tegyük fel, hogy A és B üres halmazok.\r\nA meghatározottsági axióma alapján A = B.\r\n'),(2,8,1,'Folyomány','A részhalmaz reláció olyan részben rendezés, amelynek a legkisebb eleme az üres halmaz.','<li>reflexív: \\(\\forall A\\ \\big(A \\subseteq A\\big)\\)\n\n<li>antiszimmetrikus: \\(\\forall A,B\\ \\big(A \\subseteq B \\land B \\subseteq A \\implies A = B\\big)\\)\n\n<li>tranzitív: \\(\\forall A,B,C\\ \\big(A \\subseteq B \\land B \\subseteq C \\implies A \\subseteq C\\big)\\)\n\n<li>legkisebb elem: \\(\\forall A\\ \\big(\\emptyset \\subseteq A\\big)\\)');
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

-- Dump completed on 2019-04-29 12:17:34
