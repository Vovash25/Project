-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: globe_travel
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `klienci`
--

DROP TABLE IF EXISTS `klienci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klienci` (
  `KlientID` int NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nazwisko` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Telefon` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DataRejestracji` date NOT NULL,
  PRIMARY KEY (`KlientID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klienci`
--

LOCK TABLES `klienci` WRITE;
/*!40000 ALTER TABLE `klienci` DISABLE KEYS */;
/*!40000 ALTER TABLE `klienci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logi`
--

DROP TABLE IF EXISTS `logi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logi` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `UzytkownikID` int NOT NULL,
  `Akcja` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Szczegoly` text COLLATE utf8mb4_unicode_ci,
  `DataCzas` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`),
  KEY `UzytkownikID` (`UzytkownikID`),
  CONSTRAINT `logi_ibfk_1` FOREIGN KEY (`UzytkownikID`) REFERENCES `uzytkownicy` (`UzytkownikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logi`
--

LOCK TABLES `logi` WRITE;
/*!40000 ALTER TABLE `logi` DISABLE KEYS */;
/*!40000 ALTER TABLE `logi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platnosci`
--

DROP TABLE IF EXISTS `platnosci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platnosci` (
  `PlatnoscID` int NOT NULL AUTO_INCREMENT,
  `RezerwacjaID` int NOT NULL,
  `Kwota` decimal(10,2) NOT NULL,
  `DataPlatnosci` date NOT NULL,
  `MetodaPlatnosci` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PlatnoscID`),
  KEY `RezerwacjaID` (`RezerwacjaID`),
  CONSTRAINT `platnosci_ibfk_1` FOREIGN KEY (`RezerwacjaID`) REFERENCES `rezerwacje` (`RezerwacjaID`),
  CONSTRAINT `platnosci_chk_1` CHECK ((`Kwota` > 0)),
  CONSTRAINT `platnosci_chk_2` CHECK ((`MetodaPlatnosci` in (_utf8mb4'Karta',_utf8mb4'Przelew',_utf8mb4'Gotowka')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platnosci`
--

LOCK TABLES `platnosci` WRITE;
/*!40000 ALTER TABLE `platnosci` DISABLE KEYS */;
/*!40000 ALTER TABLE `platnosci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powiadomienia`
--

DROP TABLE IF EXISTS `powiadomienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `powiadomienia` (
  `PowiadomienieID` int NOT NULL AUTO_INCREMENT,
  `UzytkownikID` int NOT NULL,
  `Tytul` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tresc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `DataWyslania` datetime DEFAULT CURRENT_TIMESTAMP,
  `Stan` enum('Przeczytane','Nieprzeczytane') COLLATE utf8mb4_unicode_ci DEFAULT 'Nieprzeczytane',
  PRIMARY KEY (`PowiadomienieID`),
  KEY `UzytkownikID` (`UzytkownikID`),
  CONSTRAINT `powiadomienia_ibfk_1` FOREIGN KEY (`UzytkownikID`) REFERENCES `uzytkownicy` (`UzytkownikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powiadomienia`
--

LOCK TABLES `powiadomienia` WRITE;
/*!40000 ALTER TABLE `powiadomienia` DISABLE KEYS */;
/*!40000 ALTER TABLE `powiadomienia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pracownicy` (
  `PracownikID` int NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Nazwisko` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Stanowisko` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DataZatrudnienia` date NOT NULL,
  PRIMARY KEY (`PracownikID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownicy`
--

LOCK TABLES `pracownicy` WRITE;
/*!40000 ALTER TABLE `pracownicy` DISABLE KEYS */;
/*!40000 ALTER TABLE `pracownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezerwacje`
--

DROP TABLE IF EXISTS `rezerwacje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rezerwacje` (
  `RezerwacjaID` int NOT NULL AUTO_INCREMENT,
  `KlientID` int NOT NULL,
  `WycieczkaID` int NOT NULL,
  `DataRezerwacji` date NOT NULL,
  `Status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RezerwacjaID`),
  KEY `KlientID` (`KlientID`),
  KEY `WycieczkaID` (`WycieczkaID`),
  CONSTRAINT `rezerwacje_ibfk_1` FOREIGN KEY (`KlientID`) REFERENCES `klienci` (`KlientID`),
  CONSTRAINT `rezerwacje_ibfk_2` FOREIGN KEY (`WycieczkaID`) REFERENCES `wycieczki` (`WycieczkaID`),
  CONSTRAINT `rezerwacje_chk_1` CHECK ((`Status` in (_utf8mb4'Oczekujaca',_utf8mb4'Zatwierdzona',_utf8mb4'Anulowana')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezerwacje`
--

LOCK TABLES `rezerwacje` WRITE;
/*!40000 ALTER TABLE `rezerwacje` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezerwacje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RolaID` int NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RolaID`),
  UNIQUE KEY `Nazwa` (`Nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Agent'),(3,'Klient');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownicy`
--

DROP TABLE IF EXISTS `uzytkownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uzytkownicy` (
  `UzytkownikID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Haslo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RolaID` int NOT NULL,
  `UUID` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `DataUtworzenia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UzytkownikID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `RolaID` (`RolaID`),
  CONSTRAINT `uzytkownicy_ibfk_1` FOREIGN KEY (`RolaID`) REFERENCES `role` (`RolaID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownicy`
--

LOCK TABLES `uzytkownicy` WRITE;
/*!40000 ALTER TABLE `uzytkownicy` DISABLE KEYS */;
INSERT INTO `uzytkownicy` VALUES (1,'admin@globe.com','1234adminHASH',1,'5fb31977-4091-11f0-9b5d-345a600de5cf','2025-06-03 17:42:36');
/*!40000 ALTER TABLE `uzytkownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wycieczki`
--

DROP TABLE IF EXISTS `wycieczki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wycieczki` (
  `WycieczkaID` int NOT NULL AUTO_INCREMENT,
  `NazwaWycieczki` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Lokalizacja` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cena` decimal(10,2) NOT NULL,
  `DataRozpoczecia` date NOT NULL,
  `DataZakonczenia` date NOT NULL,
  PRIMARY KEY (`WycieczkaID`),
  CONSTRAINT `wycieczki_chk_1` CHECK ((`Cena` > 0)),
  CONSTRAINT `wycieczki_chk_2` CHECK ((`DataZakonczenia` > `DataRozpoczecia`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wycieczki`
--

LOCK TABLES `wycieczki` WRITE;
/*!40000 ALTER TABLE `wycieczki` DISABLE KEYS */;
/*!40000 ALTER TABLE `wycieczki` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-03 17:45:22
