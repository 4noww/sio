-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 25 nov. 2026 à 08:49
-- Version du serveur : 8.0.45
-- Version de PHP : 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `location`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `numero_client` int NOT NULL,
  `nom_prenom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permis` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`numero_client`, `nom_prenom`, `adresse`, `permis`) VALUES
(201, 'ezefez', 'creteil', 324),
(432, 'rtrh', 'rhtr', 324);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id_location` int NOT NULL,
  `date_location` date NOT NULL,
  `nbr_jour` int NOT NULL,
  `numero_client` int NOT NULL,
  `imraticulation` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `PRIX_location` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`id_location`, `date_location`, `nbr_jour`, `numero_client`, `imraticulation`, `PRIX_location`) VALUES
(131, '2026-11-11', 2, 432, 'E23EEA', 0),
(21321, '2026-11-09', 4, 201, '43242', 0);

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

CREATE TABLE `reparation` (
  `num_rep` int NOT NULL,
  `date_rep` date NOT NULL,
  `type_panne` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `lieu_rep` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `prix_rep` int NOT NULL,
  `nbre_jours_rep` int NOT NULL,
  `adresse_mecanicien` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Imatriculation` varchar(29) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `Imatriculation` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `couleur` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `kilometrage` int NOT NULL,
  `date_circulation` date NOT NULL,
  `nbre_portes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`Imatriculation`, `marque`, `couleur`, `kilometrage`, `date_circulation`, `nbre_portes`) VALUES
('43242', 'sfdsf', 'bleu', 42342, '2026-11-03', 0),
('E23EEA', 'peugeot', 'bleu', 11, '2026-11-13', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`numero_client`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `num_client` (`numero_client`),
  ADD KEY `imraticulation` (`imraticulation`);

--
-- Index pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD PRIMARY KEY (`num_rep`),
  ADD KEY `Imatriculation` (`Imatriculation`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`Imatriculation`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`imraticulation`) REFERENCES `voitures` (`Imatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`numero_client`) REFERENCES `client` (`numero_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_ibfk_1` FOREIGN KEY (`Imatriculation`) REFERENCES `voitures` (`Imatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
