-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2016 at 02:17 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vs_ed2`
--

-- --------------------------------------------------------

--
-- Table structure for table `attivita`
--

CREATE TABLE `attivita` (
  `ID` int(11) NOT NULL,
  `TicketId` int(11) NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OperatoreId` int(11) NOT NULL,
  `Descrizione` text,
  `Completato` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`ID`, `Nome`) VALUES
(1, 'Adsl'),
(2, 'Fonia'),
(3, 'Fatturazione'),
(4, 'Contratto');

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `ID` int(11) NOT NULL,
  `Cognome` varchar(100) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `ComuneId` int(11) NOT NULL,
  `Telefono` varchar(30) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`ID`, `Cognome`, `Nome`, `ComuneId`, `Telefono`, `Email`, `Note`) VALUES
(2, 'Rossi', 'Mario', 1, '', '', ''),
(4, 'Muzzio', 'Nando', 1, '', '', ''),
(5, 'Rossi', 'Mario', 16, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `comuni`
--

CREATE TABLE `comuni` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comuni`
--

INSERT INTO `comuni` (`ID`, `Nome`) VALUES
(11, 'Siracusa'),
(12, 'Trapani'),
(16, 'Roma');

-- --------------------------------------------------------

--
-- Table structure for table `operatori`
--

CREATE TABLE `operatori` (
  `ID` int(11) NOT NULL,
  `Cognome` varchar(100) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `ComuneId` int(11) DEFAULT NULL,
  `RepartoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operatori`
--

INSERT INTO `operatori` (`ID`, `Cognome`, `Nome`, `ComuneId`, `RepartoId`) VALUES
(1, 'Operatore 2', 'Alessio', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `regioni`
--

CREATE TABLE `regioni` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regioni`
--

INSERT INTO `regioni` (`ID`, `Nome`) VALUES
(0, 'Regione'),
(1, 'Piemonte'),
(2, 'Valle d''Aosta/Vall‚e d''Aoste'),
(3, 'Lombardia'),
(4, 'Trentino-Alto Adige/Sdtirol'),
(5, 'Veneto'),
(6, 'Friuli-Venezia Giulia'),
(7, 'Liguria'),
(8, 'Emilia-Romagna'),
(9, 'Toscana'),
(10, 'Umbria'),
(11, 'Marche'),
(12, 'Lazio'),
(13, 'Abruzzo'),
(14, 'Molise'),
(15, 'Campania'),
(16, 'Puglia'),
(17, 'Basilicata'),
(18, 'Calabria'),
(19, 'Sicilia'),
(20, 'Sardegna');

-- --------------------------------------------------------

--
-- Table structure for table `reparti`
--

CREATE TABLE `reparti` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stati`
--

CREATE TABLE `stati` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Colore` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL,
  `ClienteId` int(11) NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Oggetto` varchar(100) NOT NULL,
  `Descrizione` text NOT NULL,
  `CategoriaId` int(11) DEFAULT NULL,
  `StatoId` int(11) DEFAULT NULL,
  `SubCategoriaId` int(11) NOT NULL,
  `Owner` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ID`, `ClienteId`, `Data`, `Oggetto`, `Descrizione`, `CategoriaId`, `StatoId`, `SubCategoriaId`, `Owner`) VALUES
(1, 2, '2016-09-15 16:11:10', 'Primo ticket', 'descrizione del disservizio', 0, 0, 0, 'a.maddalena'),
(2, 4, '2016-09-15 16:34:28', 'Secondo ticket', 'descrizione del problema', 4, 0, 0, 'a.maddalena'),
(3, 4, '2016-09-15 16:54:09', 'Nuovo ticket', '', 3, 0, 0, 'a.maddalena'),
(4, 2147483647, '2016-09-15 17:03:40', 'prova', '', 0, 0, 0, 'a.maddalena');

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`id`, `username`, `password`) VALUES
(1, 'a.maddalena', 'andrea');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vclienti`
--
CREATE TABLE `vclienti` (
`ID` int(11)
,`Cognome` varchar(100)
,`Nome` varchar(100)
,`ComuneId` int(11)
,`Telefono` varchar(30)
,`Email` varchar(150)
,`Note` text
,`Comune` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `voperatori`
--
CREATE TABLE `voperatori` (
`ID` int(11)
,`Cognome` varchar(100)
,`Nome` varchar(100)
,`ComuneId` int(11)
,`RepartoId` int(11)
,`Reparto` varchar(100)
,`Comune` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtickets`
--
CREATE TABLE `vtickets` (
`ID` int(11)
,`ClienteId` int(11)
,`Data` datetime
,`Oggetto` varchar(100)
,`Descrizione` text
,`CategoriaId` int(11)
,`StatoId` int(11)
,`Owner` varchar(200)
,`Categoria` varchar(100)
,`Stato` varchar(50)
,`Cliente` varchar(201)
);

-- --------------------------------------------------------

--
-- Structure for view `vclienti`
--
DROP TABLE IF EXISTS `vclienti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vclienti`  AS  select `clienti`.`ID` AS `ID`,`clienti`.`Cognome` AS `Cognome`,`clienti`.`Nome` AS `Nome`,`clienti`.`ComuneId` AS `ComuneId`,`clienti`.`Telefono` AS `Telefono`,`clienti`.`Email` AS `Email`,`clienti`.`Note` AS `Note`,`comuni`.`Nome` AS `Comune` from (`clienti` left join `comuni` on((`clienti`.`ComuneId` = `comuni`.`ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `voperatori`
--
DROP TABLE IF EXISTS `voperatori`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voperatori`  AS  select `operatori`.`ID` AS `ID`,`operatori`.`Cognome` AS `Cognome`,`operatori`.`Nome` AS `Nome`,`operatori`.`ComuneId` AS `ComuneId`,`operatori`.`RepartoId` AS `RepartoId`,`reparti`.`Nome` AS `Reparto`,`comuni`.`Nome` AS `Comune` from ((`operatori` left join `reparti` on((`operatori`.`RepartoId` = `reparti`.`ID`))) left join `comuni` on((`operatori`.`ComuneId` = `comuni`.`ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vtickets`
--
DROP TABLE IF EXISTS `vtickets`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtickets`  AS  select `tickets`.`ID` AS `ID`,`tickets`.`ClienteId` AS `ClienteId`,`tickets`.`Data` AS `Data`,`tickets`.`Oggetto` AS `Oggetto`,`tickets`.`Descrizione` AS `Descrizione`,`tickets`.`CategoriaId` AS `CategoriaId`,`tickets`.`StatoId` AS `StatoId`,`tickets`.`Owner` AS `Owner`,`categorie`.`Nome` AS `Categoria`,`stati`.`Nome` AS `Stato`,concat(`clienti`.`Cognome`,' ',`clienti`.`Nome`) AS `Cliente` from (((`tickets` left join `categorie` on((`tickets`.`CategoriaId` = `categorie`.`ID`))) left join `stati` on((`tickets`.`StatoId` = `stati`.`ID`))) left join `clienti` on((`tickets`.`ClienteId` = `clienti`.`ID`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `comuni`
--
ALTER TABLE `comuni`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `operatori`
--
ALTER TABLE `operatori`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `regioni`
--
ALTER TABLE `regioni`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reparti`
--
ALTER TABLE `reparti`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `stati`
--
ALTER TABLE `stati`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `clienti`
--
ALTER TABLE `clienti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comuni`
--
ALTER TABLE `comuni`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `operatori`
--
ALTER TABLE `operatori`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reparti`
--
ALTER TABLE `reparti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stati`
--
ALTER TABLE `stati`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
