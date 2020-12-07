-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2020 at 08:06 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gestion_cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cinema`
--

CREATE TABLE `cinema` (
  `id` bigint(20) NOT NULL,
  `altitude` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nbr_salles` int(11) NOT NULL,
  `ville` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` bigint(20) NOT NULL,
  `date_sortie` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `durree` double NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `realisateur` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `categorie` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `id` bigint(20) NOT NULL,
  `altitude` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `numero` int(11) NOT NULL,
  `salle` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `projection`
--

CREATE TABLE `projection` (
  `id` bigint(20) NOT NULL,
  `date_projection` datetime(6) DEFAULT NULL,
  `prix` double NOT NULL,
  `film` bigint(20) DEFAULT NULL,
  `salle` bigint(20) DEFAULT NULL,
  `seance` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id` bigint(20) NOT NULL,
  `nbr_places` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `cinema` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

CREATE TABLE `seance` (
  `id` bigint(20) NOT NULL,
  `heure_debut` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL,
  `code_payement` int(11) NOT NULL,
  `nom_client` varchar(255) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `prix` double NOT NULL,
  `reservee` bit(1) NOT NULL,
  `place` bigint(20) DEFAULT NULL,
  `projection` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ville`
--

CREATE TABLE `ville` (
  `id` bigint(20) NOT NULL,
  `altitude` double NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema`
--
ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3wgejj4s8twj16ygpwfisyoll` (`ville`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKr3ffaj3x5bippsdphukdg11ay` (`categorie`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhtkvorbhw8m9jb0olbl93acfp` (`salle`);

--
-- Indexes for table `projection`
--
ALTER TABLE `projection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9we2a544v31ocljthegkx6rlh` (`film`),
  ADD KEY `FKbcqlilc7q85g70f1h6sjm7vr8` (`salle`),
  ADD KEY `FKh158sk0k8dmu05covgxsbpnop` (`seance`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoryd568rmyeosvd3454iierqd` (`cinema`);

--
-- Indexes for table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgsv030xaetxp3l7apibudgpow` (`place`),
  ADD KEY `FKj3eom1mmsyqj0ghmpokc6wgdx` (`projection`);

--
-- Indexes for table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projection`
--
ALTER TABLE `projection`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seance`
--
ALTER TABLE `seance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `FK3wgejj4s8twj16ygpwfisyoll` FOREIGN KEY (`ville`) REFERENCES `ville` (`id`);

--
-- Constraints for table `film`
--
ALTER TABLE `film`
  ADD CONSTRAINT `FKr3ffaj3x5bippsdphukdg11ay` FOREIGN KEY (`categorie`) REFERENCES `categorie` (`id`);

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `FKhtkvorbhw8m9jb0olbl93acfp` FOREIGN KEY (`salle`) REFERENCES `salle` (`id`);

--
-- Constraints for table `projection`
--
ALTER TABLE `projection`
  ADD CONSTRAINT `FK9we2a544v31ocljthegkx6rlh` FOREIGN KEY (`film`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `FKbcqlilc7q85g70f1h6sjm7vr8` FOREIGN KEY (`salle`) REFERENCES `salle` (`id`),
  ADD CONSTRAINT `FKh158sk0k8dmu05covgxsbpnop` FOREIGN KEY (`seance`) REFERENCES `seance` (`id`);

--
-- Constraints for table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `FKoryd568rmyeosvd3454iierqd` FOREIGN KEY (`cinema`) REFERENCES `cinema` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `FKgsv030xaetxp3l7apibudgpow` FOREIGN KEY (`place`) REFERENCES `place` (`id`),
  ADD CONSTRAINT `FKj3eom1mmsyqj0ghmpokc6wgdx` FOREIGN KEY (`projection`) REFERENCES `projection` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
