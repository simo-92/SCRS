-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: campusx
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acquistati`
--

DROP TABLE IF EXISTS `acquistati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acquistati` (
  `CF` char(16) NOT NULL,
  `Servizio` smallint(5) unsigned NOT NULL,
  `DataScadenza` date DEFAULT NULL,
  PRIMARY KEY (`CF`,`Servizio`),
  KEY `Servizio` (`Servizio`),
  CONSTRAINT `acquistati_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `cliente` (`CF`) ON UPDATE CASCADE,
  CONSTRAINT `acquistati_ibfk_2` FOREIGN KEY (`Servizio`) REFERENCES `servizi` (`CodiceServizio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquistati`
--

LOCK TABLES `acquistati` WRITE;
/*!40000 ALTER TABLE `acquistati` DISABLE KEYS */;
INSERT INTO `acquistati` VALUES ('BYNCSN90S63Z203Y',4,'2001-08-20'),('CRRGTN92L15H703F',2,'2001-05-20'),('CRRLCU94D44H703M',5,'2001-08-20'),('GLIMRN90P63G482N',1,'2001-09-20'),('LMBMHL91L13B313C',2,'2001-08-20'),('LNRFNC85B64H501H',1,'2015-05-20'),('LNRFNC85B64H501H',6,'2030-08-20'),('LVIRRG92T66Z614B',1,'2015-06-20'),('MNFLCU90C70H647B',4,'2025-07-20'),('MRNNDR90L20A944Y',1,'2001-06-20'),('NDRCLR91M28L746G',3,'2015-06-20'),('RCCCHR94T45A662D',1,'2015-06-20'),('SMNLRA90B54L525H',5,'2001-08-20'),('SMNSTL90D66H647X',4,'2020-07-20'),('SSNSFN88L09D390K',7,'2015-05-20'),('STLGPP92A03G273L',6,'2001-05-20'),('STNDNL90H54A509P',3,'2015-07-20'),('TDHKST92T64A783D',3,'2023-05-20'),('TSNGLI90R06L525X',4,'2030-07-20'),('VLNFRR91B68L736I',3,'2001-01-20');
/*!40000 ALTER TABLE `acquistati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appartamento`
--

DROP TABLE IF EXISTS `appartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appartamento` (
  `Numero` int(11) NOT NULL,
  `CodicePalazzina` smallint(5) unsigned NOT NULL,
  `Struttura` char(30) DEFAULT NULL,
  `Sede` smallint(5) unsigned NOT NULL,
  `DataUltimaManutenzione` date DEFAULT NULL,
  PRIMARY KEY (`Numero`,`CodicePalazzina`,`Sede`),
  KEY `CodicePalazzina` (`CodicePalazzina`),
  KEY `Sede` (`Sede`),
  KEY `Struttura` (`Struttura`),
  CONSTRAINT `appartamento_ibfk_1` FOREIGN KEY (`CodicePalazzina`) REFERENCES `palazzina` (`CodicePalazzina`) ON UPDATE CASCADE,
  CONSTRAINT `appartamento_ibfk_2` FOREIGN KEY (`Sede`) REFERENCES `sede` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `appartamento_ibfk_3` FOREIGN KEY (`Struttura`) REFERENCES `struttura` (`NomeStruttura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartamento`
--

LOCK TABLES `appartamento` WRITE;
/*!40000 ALTER TABLE `appartamento` DISABLE KEYS */;
INSERT INTO `appartamento` VALUES (1,1,'Singola',1,'2015-01-20'),(1,1,'Singola',2,'2015-01-20'),(1,1,'Singola',3,'2015-01-20'),(1,2,'Doppia',1,'2011-01-20'),(1,2,'Doppia',2,'2011-01-20'),(1,2,'Doppia',3,'2011-01-20'),(1,3,'Tripla',1,'2011-01-20'),(1,3,'Tripla',2,'2001-01-20'),(1,3,'Tripla',3,'2011-01-20'),(1,4,'Matrimoniale',1,'2011-01-20'),(1,4,'Matrimoniale',2,'2011-01-20'),(1,4,'Matrimoniale',3,'2011-01-20'),(1,5,'Special',1,'2011-01-20'),(1,5,'Special',2,'2011-01-20'),(1,5,'Special',3,'2011-01-20'),(2,1,'Singola',1,'2015-01-20'),(2,1,'Singola',2,'2015-01-20'),(2,1,'Singola',3,'2015-01-20'),(2,2,'Doppia',1,'2010-02-20'),(2,2,'Doppia',2,'2010-02-20'),(2,2,'Doppia',3,'2010-02-20'),(2,3,'Tripla',1,'2010-02-20'),(2,3,'Tripla',2,'2010-02-20'),(2,3,'Tripla',3,'2010-02-20'),(2,4,'Matrimoniale',1,'2010-02-20'),(2,4,'Matrimoniale',2,'2010-02-20'),(2,4,'Matrimoniale',3,'2010-02-20'),(2,5,'Special',1,'2010-02-20'),(2,5,'Special',2,'2010-02-20'),(2,5,'Special',3,'2010-02-20'),(3,1,'Singola',1,'2015-01-20'),(3,1,'Singola',2,'2015-01-20'),(3,1,'Singola',3,'2015-01-20'),(3,2,'Doppia',1,'2015-08-20'),(3,2,'Doppia',2,'2015-08-20'),(3,2,'Doppia',3,'2015-08-20'),(3,3,'Tripla',1,'2015-08-20'),(3,3,'Tripla',2,'2005-08-20'),(3,3,'Tripla',3,'2015-08-20'),(3,4,'Matrimoniale',1,'2015-08-20'),(3,4,'Matrimoniale',2,'2015-08-20'),(3,4,'Matrimoniale',3,'2015-08-20'),(3,5,'Special',1,'2015-08-20'),(3,5,'Special',2,'2015-08-20'),(3,5,'Special',3,'2015-08-20'),(4,1,'Singola',1,'2015-03-20'),(4,1,'Singola',2,'2015-03-20'),(4,1,'Singola',3,'2015-03-20'),(4,2,'Doppia',1,'2004-01-20'),(4,2,'Doppia',2,'2004-01-20'),(4,2,'Doppia',3,'2004-01-20'),(4,3,'Tripla',1,'2004-01-20'),(4,3,'Tripla',2,'2004-01-20'),(4,3,'Tripla',3,'2004-01-20'),(4,4,'Matrimoniale',1,'2004-01-20'),(4,4,'Matrimoniale',2,'2004-01-20'),(4,4,'Matrimoniale',3,'2004-01-20'),(4,5,'Special',1,'2004-01-20'),(4,5,'Special',2,'2004-01-20'),(4,5,'Special',3,'2004-01-20'),(5,1,'Singola',1,'2015-01-20'),(5,1,'Singola',2,'2015-01-20'),(5,1,'Singola',3,'2015-01-20'),(5,2,'Doppia',1,'2015-01-20'),(5,2,'Doppia',2,'2015-01-20'),(5,2,'Doppia',3,'2015-01-20'),(5,3,'Tripla',1,'2015-01-20'),(5,3,'Tripla',2,'2015-01-20'),(5,3,'Tripla',3,'2015-01-20'),(5,4,'Matrimoniale',1,'2015-01-20'),(5,4,'Matrimoniale',2,'2010-01-20'),(5,4,'Matrimoniale',3,'2015-01-20'),(5,5,'Special',1,'2015-01-20'),(5,5,'Special',2,'2015-01-20'),(5,5,'Special',3,'2015-01-20'),(6,1,'Singola',1,'2020-01-20'),(6,1,'Singola',2,'2020-01-20'),(6,1,'Singola',3,'2020-01-20'),(6,2,'Doppia',1,'2015-01-20'),(6,2,'Doppia',2,'2010-01-20'),(6,2,'Doppia',3,'2015-01-20'),(6,3,'Tripla',1,'2015-01-20'),(6,3,'Tripla',2,'2015-01-20'),(6,3,'Tripla',3,'2015-01-20'),(6,4,'Matrimoniale',1,'2015-01-20'),(6,4,'Matrimoniale',2,'2015-02-20'),(6,4,'Matrimoniale',3,'2015-01-20'),(6,5,'Special',1,'2015-01-20'),(6,5,'Special',2,'2015-01-20'),(6,5,'Special',3,'2015-01-20'),(7,1,'Singola',1,'2015-01-20'),(7,1,'Singola',2,'2015-01-20'),(7,1,'Singola',3,'2015-01-20'),(7,2,'Doppia',1,'2010-01-20'),(7,2,'Doppia',2,'2010-01-20'),(7,2,'Doppia',3,'2010-01-20'),(7,3,'Tripla',1,'2010-01-20'),(7,3,'Tripla',2,'2010-01-20'),(7,3,'Tripla',3,'2010-01-20'),(7,4,'Matrimoniale',1,'2010-01-20'),(7,4,'Matrimoniale',2,'2010-04-20'),(7,4,'Matrimoniale',3,'2010-01-20'),(7,5,'Special',1,'2010-01-20'),(7,5,'Special',2,'2009-07-20'),(7,5,'Special',3,'2010-01-20'),(8,1,'Singola',1,'2015-01-20'),(8,1,'Singola',2,'2015-01-20'),(8,1,'Singola',3,'2015-01-20'),(8,2,'Doppia',1,'2015-01-20'),(8,2,'Doppia',2,'2015-01-20'),(8,2,'Doppia',3,'2015-01-20'),(8,3,'Tripla',1,'2015-01-20'),(8,3,'Tripla',2,'2015-01-20'),(8,3,'Tripla',3,'2015-01-20'),(8,4,'Matrimoniale',1,'2015-01-20'),(8,4,'Matrimoniale',2,'2009-01-20'),(8,4,'Matrimoniale',3,'2015-01-20'),(8,5,'Special',1,'2015-01-20'),(8,5,'Special',2,'2011-01-20'),(8,5,'Special',3,'2015-01-20'),(9,1,'Singola',1,'2020-01-20'),(9,1,'Singola',2,'2020-01-20'),(9,1,'Singola',3,'2020-01-20'),(9,2,'Doppia',1,'2015-03-20'),(9,2,'Doppia',2,'2015-03-20'),(9,2,'Doppia',3,'2015-03-20'),(9,3,'Tripla',1,'2015-03-20'),(9,3,'Tripla',2,'2015-03-20'),(9,3,'Tripla',3,'2015-03-20'),(9,4,'Matrimoniale',1,'2015-03-20'),(9,4,'Matrimoniale',2,'2015-03-20'),(9,4,'Matrimoniale',3,'2015-03-20'),(9,5,'Special',1,'2015-03-20'),(9,5,'Special',2,'2015-03-20'),(9,5,'Special',3,'2015-03-20'),(10,1,'Singola',1,'2025-02-20'),(10,1,'Singola',2,'2025-02-20'),(10,1,'Singola',3,'2025-02-20'),(10,2,'Doppia',1,'2015-01-20'),(10,2,'Doppia',2,'2011-01-20'),(10,2,'Doppia',3,'2015-01-20'),(10,3,'Tripla',1,'2015-01-20'),(10,3,'Tripla',2,'2015-01-20'),(10,3,'Tripla',3,'2015-01-20'),(10,4,'Matrimoniale',1,'2015-01-20'),(10,4,'Matrimoniale',2,'2015-01-20'),(10,4,'Matrimoniale',3,'2015-01-20'),(10,5,'Special',1,'2015-01-20'),(10,5,'Special',2,'2015-01-20'),(10,5,'Special',3,'2015-01-20'),(11,1,'Singola',1,'2015-01-20'),(11,1,'Singola',2,'2015-01-20'),(11,1,'Singola',3,'2015-01-20'),(11,2,'Doppia',1,'2015-05-20'),(11,2,'Doppia',2,'2015-05-20'),(11,2,'Doppia',3,'2015-05-20'),(11,3,'Tripla',1,'2015-05-20'),(11,3,'Tripla',2,'2015-05-20'),(11,3,'Tripla',3,'2015-05-20'),(11,4,'Matrimoniale',1,'2015-05-20'),(11,4,'Matrimoniale',2,'2011-05-20'),(11,4,'Matrimoniale',3,'2015-05-20'),(11,5,'Special',1,'2015-05-20'),(11,5,'Special',2,'2018-05-20'),(11,5,'Special',3,'2015-05-20'),(12,1,'Singola',1,'2015-05-20'),(12,1,'Singola',2,'2015-05-20'),(12,1,'Singola',3,'2015-05-20'),(12,2,'Doppia',1,'2020-01-20'),(12,2,'Doppia',2,'2022-01-20'),(12,2,'Doppia',3,'2020-01-20'),(12,3,'Tripla',1,'2020-01-20'),(12,3,'Tripla',2,'2020-01-20'),(12,3,'Tripla',3,'2020-01-20'),(12,4,'Matrimoniale',1,'2020-01-20'),(12,4,'Matrimoniale',2,'2022-01-20'),(12,4,'Matrimoniale',3,'2020-01-20'),(12,5,'Special',1,'2020-01-20'),(12,5,'Special',2,'2020-01-20'),(12,5,'Special',3,'2020-01-20'),(13,1,'Singola',1,'2030-01-20'),(13,1,'Singola',2,'2030-01-20'),(13,1,'Singola',3,'2003-01-20'),(13,2,'Doppia',1,'2015-04-20'),(13,2,'Doppia',2,'2015-04-20'),(13,2,'Doppia',3,'2015-04-20'),(13,3,'Tripla',1,'2015-04-20'),(13,3,'Tripla',2,'2015-04-20'),(13,3,'Tripla',3,'2015-04-20'),(13,4,'Matrimoniale',1,'2015-04-20'),(13,4,'Matrimoniale',2,'2015-04-20'),(13,4,'Matrimoniale',3,'2015-04-20'),(13,5,'Special',1,'2015-04-20'),(13,5,'Special',2,'2014-04-20'),(13,5,'Special',3,'2015-04-20'),(14,1,'Singola',1,'2015-01-20'),(14,1,'Singola',2,'2015-01-20'),(14,1,'Singola',3,'2015-01-20'),(14,2,'Doppia',1,'2030-01-20'),(14,2,'Doppia',2,'2030-01-20'),(14,2,'Doppia',3,'2030-01-20'),(14,3,'Tripla',1,'2030-01-20'),(14,3,'Tripla',2,'2030-01-20'),(14,3,'Tripla',3,'2030-01-20'),(14,4,'Matrimoniale',1,'2030-01-20'),(14,4,'Matrimoniale',2,'2030-01-20'),(14,4,'Matrimoniale',3,'2030-01-20'),(14,5,'Special',1,'2030-01-20'),(14,5,'Special',2,'2010-01-20'),(14,5,'Special',3,'2030-01-20'),(15,1,'Singola',1,'2015-01-20'),(15,1,'Singola',2,'2015-01-20'),(15,1,'Singola',3,'2015-01-20'),(15,2,'Doppia',1,'2015-01-20'),(15,2,'Doppia',2,'2015-01-20'),(15,2,'Doppia',3,'2015-01-20'),(15,3,'Tripla',1,'2015-01-20'),(15,3,'Tripla',2,'2005-01-20'),(15,3,'Tripla',3,'2015-01-20'),(15,4,'Matrimoniale',1,'2015-01-20'),(15,4,'Matrimoniale',2,'2015-01-20'),(15,4,'Matrimoniale',3,'2015-01-20'),(15,5,'Special',1,'2015-01-20'),(15,5,'Special',2,'2015-01-20'),(15,5,'Special',3,'2015-01-20');
/*!40000 ALTER TABLE `appartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `CF` char(16) NOT NULL,
  `Nome` char(20) DEFAULT NULL,
  `Cognome` char(20) DEFAULT NULL,
  `NumeroTelefono` char(15) DEFAULT NULL,
  `Email` char(40) DEFAULT NULL,
  `Categoria` char(30) DEFAULT NULL,
  `CorsoDiStudi` char(40) DEFAULT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('BYNCSN90S63Z203Y','Abyan','Casid','+393291722537','abyan.92@hotmail.com','Erasmus','Economia'),('CHRSNT89H71A536E','Chiara','Silentin','+393278344748','chiara.campusX@live.com','ImpiegatoCampusX','null'),('CNNFBL90C66F839T','Fabiola','Cannavaro','+393331922381','fabi.cannavaro@live.it','Studente','Economia'),('CRRGTN92L15H703F','Gaetano','Carrozza','+393478614628','gaetano.carrozza@live.com','Lavoratore','Giurisprudenza'),('CRRLCU94D44H703M','Lucia','Carrozza','+393289519324','lucia.carrozza@live.com','Studente','Giurisprudenza'),('FRNMTT94D68Z602P','Fernanda','Maietti','+393267611208','maietti_fernanda@gmail.com','Erasmus','Odontoiatria'),('FRNSHV87D13L781B','Francesco','Schiavone','+393271422948','francesco.schiavone9@hotmail.com','Ricercatore','Medicina'),('GLIMRN90P63G482N','Giulia','Mirini','+393284599251','giuli92@live.com','Studente','Biologia'),('LMBMHL91L13B313C','Michele','Lambruschi','+393261299621','lambrusco29@hotmail.it','Studente','IngegneriaInformatica'),('LMDJTT90H59Z222K','Juliette','Elmidie','+393281193281','elmidie.juli@hotmail.com','Erasmus','Medicina'),('LNRFNC85B64H501H','Francesca','Leonardi','+393332453689','francesca.leo@hotmail.com','Ricercatore','Giurisprudenza'),('LVIRRG92T66Z614B','Livia','Rodriguez','+393233799362','livia.rodriguez@gmail.com','Erasmus','Medicina'),('LXABNT75R30F205V','Alex','Bisenti','+393278166735','alex.campusX@hotmail.com','ImpegatoCampusX','null'),('MNFLCU90C70H647B','Luca','Manfredi','+393281622319','Luca.manfri@hotmail.com','Studente','IngegneriaEdile'),('MRNNDR90L20A944Y','Andrea','Marino','+393271243483','andrea432@gmail.com','Studente','Medicina'),('MTTMZN75D30F839Y','Matteo','Mazzoni','+393278100846','matteo.campusX@hotmail.com','ImpiegatoCampusX','null'),('NDRCLR91M28L746G','Andrea','Cavalieri','+393281726394','cavalieri.andre9@live.it','Studente','Matematica'),('RCCCHR94T45A662D','Chiara','Recchiuto','+393275622738','chiara.recchiuto@gmail.it','Studente','Economia'),('RRCVLR92P58F839O','Valeria','Errichiello','+393260817392','vale92@hotmail.it','Studente','Biologia'),('RSSGVR91L53D245E','Ginevra','Rossi','+393288100348','ginny.91@live.it','Studente','Medicina'),('SMNLNE90L24C351Z','Simone','Leone','+393332518253','simo.leo@hotmail.com','Studente','IngegneriaGestionale'),('SMNLRA90B54L525H','Laura','Simoncelli','+393278122339','simoncelli_laura@hotmail.com','Studente','IngegneriaGestionale'),('SMNSTL90D66H647X','Simona','Santoliquido','+393267281536','simo.santoliquido@live.com','Studente','Lettere'),('SSNSFN88L09D390K','Stefani','Susini','+393268219276','stefano28@hotmail.com','ImpiegatoCampusX','null'),('STLGPP92A03G273L','Giuseppe','Stella','+393497689631','giuseppe_92@hotmail.com','Studente','Medicina'),('STNDNL90H54A509P','Daniela','Stanzione','+393213729135','dani.stanzione@live.it','Studente','Medicina'),('TDHKST92T64A783D','Kristi','Todhe','+393278266748','kristi.todhe@hotmail.it','Studente','Informatica'),('TSNGLI90R06L525X','Giulio','Tisano','+393267128341','giulietto.tisano@live.it','Studente','Lettere'),('VLNFRR91B68L736I','Valentina','Ferraro','+393278255945','ferraro_vale@gmail.com','Studente','IngegneriaMedica'),('VLRDNL91D16F835S','Daniele','Valeriani','+393335611748','valedani11@gmail.com','Studente','Economia');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratto`
--

DROP TABLE IF EXISTS `contratto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contratto` (
  `CodiceContratto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TipologiaContratto` smallint(5) unsigned DEFAULT NULL,
  `DataScadenza` date DEFAULT NULL,
  `DataStipulazione` date DEFAULT NULL,
  PRIMARY KEY (`CodiceContratto`),
  KEY `TipologiaContratto` (`TipologiaContratto`),
  CONSTRAINT `contratto_ibfk_1` FOREIGN KEY (`TipologiaContratto`) REFERENCES `tipologiacontratto` (`CodiceTipologia`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto`
--

LOCK TABLES `contratto` WRITE;
/*!40000 ALTER TABLE `contratto` DISABLE KEYS */;
INSERT INTO `contratto` VALUES (1,1,'2001-01-20','2001-01-20'),(2,1,'2001-04-20','2001-03-20'),(3,1,'2005-07-20','2005-06-20'),(4,1,'2015-05-20','2015-04-20'),(5,2,'2015-05-20','2015-02-20'),(6,2,'2001-05-20','2001-02-20'),(7,2,'2001-07-20','2001-04-20'),(8,2,'2015-05-20','2015-02-20'),(9,2,'2001-08-20','2001-05-20'),(10,2,'2001-03-20','2001-01-20'),(11,3,'2001-06-20','2001-01-20'),(12,3,'2015-06-20','2015-01-20'),(13,3,'2001-07-20','2001-02-20'),(14,3,'2015-07-20','2015-02-20'),(15,3,'2010-08-20','2010-03-20'),(16,3,'2001-08-20','2001-03-20'),(17,3,'2015-11-20','2015-05-20'),(18,3,'2010-10-20','2010-04-20'),(19,3,'2010-11-20','2010-05-20'),(20,3,'2005-10-20','2005-04-20'),(21,4,'2001-01-20','2001-01-20'),(22,4,'2005-04-20','2005-04-20'),(23,4,'2005-01-20','2005-01-20'),(24,4,'2010-04-20','2010-04-20'),(25,4,'2001-04-20','2001-04-20'),(26,4,'2005-01-20','2005-01-20'),(27,4,'2010-01-20','2010-01-20'),(28,4,'2015-04-20','2015-04-20'),(29,4,'2015-02-20','2015-02-20'),(30,4,'2010-03-20','2010-03-20');
/*!40000 ALTER TABLE `contratto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multa`
--

DROP TABLE IF EXISTS `multa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multa` (
  `CF` char(16) NOT NULL,
  `Sanzione` smallint(5) unsigned NOT NULL,
  `Saldata` char(1) DEFAULT NULL,
  PRIMARY KEY (`CF`,`Sanzione`),
  KEY `Sanzione` (`Sanzione`),
  CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `cliente` (`CF`) ON UPDATE CASCADE,
  CONSTRAINT `multa_ibfk_2` FOREIGN KEY (`Sanzione`) REFERENCES `sanzioni` (`CodiceSanzione`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multa`
--

LOCK TABLES `multa` WRITE;
/*!40000 ALTER TABLE `multa` DISABLE KEYS */;
INSERT INTO `multa` VALUES ('BYNCSN90S63Z203Y',6,'S'),('CNNFBL90C66F839T',2,'S'),('CRRLCU94D44H703M',1,'N'),('CRRLCU94D44H703M',2,'N'),('CRRLCU94D44H703M',6,'N'),('GLIMRN90P63G482N',9,'S'),('LMBMHL91L13B313C',1,'N'),('LNRFNC85B64H501H',1,'S'),('MNFLCU90C70H647B',6,'S'),('MRNNDR90L20A944Y',12,'N'),('NDRCLR91M28L746G',3,'N'),('RCCCHR94T45A662D',1,'N'),('RRCVLR92P58F839O',3,'S'),('SMNLRA90B54L525H',4,'S'),('SSNSFN88L09D390K',4,'S'),('STLGPP92A03G273L',2,'N'),('TDHKST92T64A783D',1,'S');
/*!40000 ALTER TABLE `multa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palazzina`
--

DROP TABLE IF EXISTS `palazzina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palazzina` (
  `CodicePalazzina` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` char(30) DEFAULT NULL,
  `NumeroAppartamenti` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`CodicePalazzina`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palazzina`
--

LOCK TABLES `palazzina` WRITE;
/*!40000 ALTER TABLE `palazzina` DISABLE KEYS */;
INSERT INTO `palazzina` VALUES (1,'Simoncelli',15),(2,'Neruda',15),(3,'Moro',15),(4,'Einstein',15),(5,'Edison',15);
/*!40000 ALTER TABLE `palazzina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prezzi`
--

DROP TABLE IF EXISTS `prezzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prezzi` (
  `Struttura` char(30) NOT NULL,
  `CodiceTipologia` smallint(5) unsigned NOT NULL,
  `Prezzo` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Struttura`,`CodiceTipologia`),
  KEY `CodiceTipologia` (`CodiceTipologia`),
  CONSTRAINT `prezzi_ibfk_1` FOREIGN KEY (`Struttura`) REFERENCES `struttura` (`NomeStruttura`) ON UPDATE CASCADE,
  CONSTRAINT `prezzi_ibfk_2` FOREIGN KEY (`CodiceTipologia`) REFERENCES `tipologiacontratto` (`CodiceTipologia`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prezzi`
--

LOCK TABLES `prezzi` WRITE;
/*!40000 ALTER TABLE `prezzi` DISABLE KEYS */;
INSERT INTO `prezzi` VALUES ('Doppia',1,425),('Doppia',2,1260),('Doppia',3,2508),('Doppia',4,4920),('Matrimoniale',1,460),('Matrimoniale',2,1365),('Matrimoniale',3,2700),('Matrimoniale',4,5340),('Singola',1,450),('Singola',2,1335),('Singola',3,2640),('Singola',4,5220),('Special',1,425),('Special',2,1260),('Special',3,2508),('Special',4,4980),('Tripla',1,370),('Tripla',2,1095),('Tripla',3,2169),('Tripla',4,3900);
/*!40000 ALTER TABLE `prezzi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrazione`
--

DROP TABLE IF EXISTS `registrazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrazione` (
  `CF` char(16) NOT NULL,
  `CodiceContratto` int(10) unsigned NOT NULL,
  `NumeroAppartamento` int(11) NOT NULL,
  `CodicePalazzina` smallint(5) unsigned NOT NULL,
  `Sede` smallint(5) unsigned NOT NULL,
  `InCorso` char(1) DEFAULT NULL,
  PRIMARY KEY (`CF`,`CodiceContratto`,`NumeroAppartamento`,`CodicePalazzina`,`Sede`),
  KEY `CodiceContratto` (`CodiceContratto`),
  KEY `NumeroAppartamento` (`NumeroAppartamento`),
  KEY `CodicePalazzina` (`CodicePalazzina`),
  KEY `Sede` (`Sede`),
  CONSTRAINT `registrazione_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `cliente` (`CF`) ON UPDATE CASCADE,
  CONSTRAINT `registrazione_ibfk_2` FOREIGN KEY (`CodiceContratto`) REFERENCES `contratto` (`CodiceContratto`) ON UPDATE CASCADE,
  CONSTRAINT `registrazione_ibfk_3` FOREIGN KEY (`NumeroAppartamento`) REFERENCES `appartamento` (`Numero`) ON UPDATE CASCADE,
  CONSTRAINT `registrazione_ibfk_4` FOREIGN KEY (`CodicePalazzina`) REFERENCES `palazzina` (`CodicePalazzina`) ON UPDATE CASCADE,
  CONSTRAINT `registrazione_ibfk_5` FOREIGN KEY (`Sede`) REFERENCES `sede` (`Codice`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrazione`
--

LOCK TABLES `registrazione` WRITE;
/*!40000 ALTER TABLE `registrazione` DISABLE KEYS */;
INSERT INTO `registrazione` VALUES ('BYNCSN90S63Z203Y',16,14,1,3,'S'),('CRRGTN92L15H703F',13,2,2,2,'S'),('CRRLCU94D44H703M',22,6,3,1,'S'),('FRNMTT94D68Z602P',27,4,5,3,'S'),('FRNSHV87D13L781B',23,2,4,2,'S'),('GLIMRN90P63G482N',18,15,2,1,'S'),('LNRFNC85B64H501H',17,7,1,1,'S'),('LVIRRG92T66Z614B',26,9,5,3,'S'),('MNFLCU90C70H647B',20,12,1,2,'N'),('MRNNDR90L20A944Y',30,3,3,2,'S'),('NDRCLR91M28L746G',5,12,3,3,'N'),('RCCCHR94T45A662D',29,15,4,1,'S'),('RRCVLR92P58F839O',14,15,1,1,'S'),('SMNLNE90L24C351Z',12,13,2,2,'S'),('SMNLRA90B54L525H',10,7,2,3,'N'),('SMNSTL90D66H647X',2,2,1,1,'N'),('STLGPP92A03G273L',15,11,2,2,'S'),('TDHKST92T64A783D',21,1,3,1,'S'),('VLNFRR91B68L736I',7,4,5,2,'S');
/*!40000 ALTER TABLE `registrazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanzioni`
--

DROP TABLE IF EXISTS `sanzioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanzioni` (
  `CodiceSanzione` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(150) DEFAULT NULL,
  `Prezzo` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodiceSanzione`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanzioni`
--

LOCK TABLES `sanzioni` WRITE;
/*!40000 ALTER TABLE `sanzioni` DISABLE KEYS */;
INSERT INTO `sanzioni` VALUES (1,'Immondizia',100),(2,'Schiamazzi',50),(3,'FestaNonAutorizzata',50),(4,'ParcheggioNonAutorizzato',50),(5,'StatoAlloggio',70),(6,'OspiteNonRegistrato',100),(7,'ElettrodomesticiNonDichiarati',100),(8,'AttiVandalici',500),(9,'PerditaChiave',5),(10,'Animali',100),(11,'OggettiPericolosi',50),(12,'FumoInternoSpaziComuni',25);
/*!40000 ALTER TABLE `sanzioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sede` (
  `Codice` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Citta` char(30) DEFAULT NULL,
  `Responsabile` char(20) DEFAULT NULL,
  `Indirizzo` char(80) DEFAULT NULL,
  `NumeroTelefono` char(15) DEFAULT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (1,'Roma','Roberto Rossi','Via di Passolombardo 341','06.95.22.25.01'),(2,'Chieti','Franco Lombardi','Via Papa Giovanni Paolo II 179','0871 540677'),(3,'Bari','Luigi Bianchi','Via Giovanni Amendola 184','080 9176000');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizi`
--

DROP TABLE IF EXISTS `servizi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servizi` (
  `CodiceServizio` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` char(30) DEFAULT NULL,
  `Prezzo` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodiceServizio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizi`
--

LOCK TABLES `servizi` WRITE;
/*!40000 ALTER TABLE `servizi` DISABLE KEYS */;
INSERT INTO `servizi` VALUES (1,'Navetta',80),(2,'Lavanderia',16),(3,'Palestra',30),(4,'Wifi',15),(5,'AriaCondizionata',15),(6,'PuliziaAlloggio',10),(7,'Hotel',25);
/*!40000 ALTER TABLE `servizi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `struttura`
--

DROP TABLE IF EXISTS `struttura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `struttura` (
  `NomeStruttura` char(30) NOT NULL,
  `NumeroPostiLetto` smallint(5) unsigned DEFAULT NULL,
  `NumeroCamere` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`NomeStruttura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `struttura`
--

LOCK TABLES `struttura` WRITE;
/*!40000 ALTER TABLE `struttura` DISABLE KEYS */;
INSERT INTO `struttura` VALUES ('Doppia',2,4),('Matrimoniale',2,3),('Singola',1,2),('Special',2,3),('Tripla',3,5);
/*!40000 ALTER TABLE `struttura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologiacontratto`
--

DROP TABLE IF EXISTS `tipologiacontratto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipologiacontratto` (
  `CodiceTipologia` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Tipologia` char(30) DEFAULT NULL,
  PRIMARY KEY (`CodiceTipologia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologiacontratto`
--

LOCK TABLES `tipologiacontratto` WRITE;
/*!40000 ALTER TABLE `tipologiacontratto` DISABLE KEYS */;
INSERT INTO `tipologiacontratto` VALUES (1,'Mensile'),(2,'Trimestrale'),(3,'Semestrale'),(4,'Annuale');
/*!40000 ALTER TABLE `tipologiacontratto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-24 10:44:35
