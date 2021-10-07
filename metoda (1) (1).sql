-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost:3306
-- Timp de generare: iun. 03, 2021 la 08:27 PM
-- Versiune server: 8.0.25-0ubuntu0.20.04.1
-- Versiune PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `metoda`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL,
  `Nume_client` varchar(20) DEFAULT NULL,
  `Telefon` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Eliminarea datelor din tabel `client`
--

INSERT INTO `client` (`id`, `Nume_client`, `Telefon`) VALUES
(1, 'Ion Botezatu', 60897878),
(2, 'Ana Prisacari', 9080809),
(3, 'Alisa Mocanu', 80454545),
(4, 'Viorica Acel', 80980090),
(5, 'Andrei Ionescu', 6767654),
(6, 'Andrei Alin', 89897643);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `contract`
--

CREATE TABLE `contract` (
  `id` int NOT NULL,
  `id_metoda` int DEFAULT NULL,
  `Nr_contract` int DEFAULT NULL,
  `id_client` int DEFAULT NULL,
  `id_pret` int DEFAULT NULL,
  `Data_semnarii` date DEFAULT NULL,
  `Perioada` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Eliminarea datelor din tabel `contract`
--

INSERT INTO `contract` (`id`, `id_metoda`, `Nr_contract`, `id_client`, `id_pret`, `Data_semnarii`, `Perioada`) VALUES
(1, 4, 34567890, 3, 1, '2021-01-05', 7),
(2, 3, 34567987, 2, 2, '2021-01-14', 5),
(5, 1, 65432, 6, 3, '2021-01-21', 9),
(6, 1, 876543, 6, 3, '2021-01-28', 9),
(7, 13, 76541234, 4, 1, '2021-01-06', 1),
(9, 1, 445454, 1, 1, '2021-10-11', 50),
(10, 1, 2, 1, 1, '2021-06-25', 42);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `metoda`
--

CREATE TABLE `metoda` (
  `id` int NOT NULL,
  `Denumire_metoda` varchar(20) DEFAULT NULL,
  `Tip_metoda` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Eliminarea datelor din tabel `metoda`
--

INSERT INTO `metoda` (`id`, `Denumire_metoda`, `Tip_metoda`) VALUES
(1, 'Tratarea anginei', 'tratament'),
(2, 'Tratarea gripei', 'tratament'),
(3, 'Dureri pulmonnare', 'diagnostic'),
(4, 'Dureri de cap', 'diagostic'),
(13, 'Inflamatie', 'diagnostic'),
(14, 'Durere spate', 'diagnostoc'),
(16, '123', '3210');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `pret`
--

CREATE TABLE `pret` (
  `id` int NOT NULL,
  `Pret` int DEFAULT NULL,
  `id_metoda` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Eliminarea datelor din tabel `pret`
--

INSERT INTO `pret` (`id`, `Pret`, `id_metoda`) VALUES
(1, 50, 4),
(2, 60, 3),
(3, 80, 1),
(4, 67, 2),
(5, 100, 1);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_metoda` (`id_metoda`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_pret` (`id_pret`);

--
-- Indexuri pentru tabele `metoda`
--
ALTER TABLE `metoda`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `pret`
--
ALTER TABLE `pret`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_metoda` (`id_metoda`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pentru tabele `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pentru tabele `metoda`
--
ALTER TABLE `metoda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pentru tabele `pret`
--
ALTER TABLE `pret`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`id_metoda`) REFERENCES `metoda` (`id`),
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`id_pret`) REFERENCES `pret` (`id`);

--
-- Constrângeri pentru tabele `pret`
--
ALTER TABLE `pret`
  ADD CONSTRAINT `pret_ibfk_1` FOREIGN KEY (`id_metoda`) REFERENCES `metoda` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
