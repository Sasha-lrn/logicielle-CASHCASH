-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 04 mai 2026 à 13:08
-- Version du serveur : 10.3.39-MariaDB-0+deb10u1
-- Version de PHP : 8.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cashcash`
--

-- --------------------------------------------------------

--
-- Structure de la table `Agence`
--

CREATE TABLE `Agence` (
  `Num_Agence` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `AdressePostale` varchar(50) DEFAULT NULL,
  `NumTel` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Agence`
--

INSERT INTO `Agence` (`Num_Agence`, `Nom`, `AdressePostale`, `NumTel`, `Email`) VALUES
(1, 'Agence Paris Nord', '12 rue de Paris, 75010 Paris', '0102030405', 'parisnord@cashcash.fr'),
(2, 'Agence Lyon Centre', '5 avenue des Frères Lumière, 69008 Lyon', '0405060708', 'lyoncentre@cashcash.fr'),
(3, 'Agence Lille Métropole', '20 rue Faidherbe, 59000 Lille', '0320456789', 'lille@cashcash.fr'),
(4, 'Agence Marseille Sud', '8 boulevard Prado, 13008 Marseille', '0491122334', 'marseille@cashcash.fr'),

(5, 'Agence Bordeaux Atlantique', '15 cours de l’Intendance, 33000 Bordeaux', '0555123456', 'bordeaux@cashcash.fr'),
(6, 'Agence Toulouse Capitole', '10 place du Capitole, 31000 Toulouse', '0567123456', 'toulouse@cashcash.fr'),
(7, 'Agence Nantes Ouest', '22 rue de Strasbourg, 44000 Nantes', '0240123456', 'nantes@cashcash.fr'),
(8, 'Agence Strasbourg Europe', '3 place Kléber, 67000 Strasbourg', '0388123456', 'strasbourg@cashcash.fr'),
(9, 'Agence Nice Côte d’Azur', '7 promenade des Anglais, 06000 Nice', '0493123456', 'nice@cashcash.fr'),
(10, 'Agence Rennes Bretagne', '18 rue de Brest, 35000 Rennes', '0299123456', 'rennes@cashcash.fr'),

(11, 'Agence Montpellier Sud', '14 avenue de la Mer, 34000 Montpellier', '0467123456', 'montpellier@cashcash.fr'),
(12, 'Agence Grenoble Alpes', '9 rue Félix Poulat, 38000 Grenoble', '0476123456', 'grenoble@cashcash.fr'),
(13, 'Agence Dijon Bourgogne', '11 place Darcy, 21000 Dijon', '0380123456', 'dijon@cashcash.fr'),
(14, 'Agence Reims Champagne', '6 rue de Vesle, 51100 Reims', '0326123456', 'reims@cashcash.fr'),
(15, 'Agence Amiens Picardie', '4 rue des Trois Cailloux, 80000 Amiens', '0322123456', 'amiens@cashcash.fr'),

(16, 'Agence Clermont-Ferrand Auvergne', '13 place de Jaude, 63000 Clermont-Ferrand', '0473123456', 'clermont@cashcash.fr'),
(17, 'Agence Orléans Loire', '21 rue Jeanne d’Arc, 45000 Orléans', '0238123456', 'orleans@cashcash.fr'),
(18, 'Agence Tours Val de Loire', '8 rue Nationale, 37000 Tours', '0247123456', 'tours@cashcash.fr'),
(19, 'Agence Le Havre Maritime', '17 quai Southampton, 76600 Le Havre', '0235123456', 'lehavre@cashcash.fr'),
(20, 'Agence Caen Normandie', '9 rue Saint-Pierre, 14000 Caen', '0231123456', 'caen@cashcash.fr'),

(21, 'Agence Angers Loire', '12 rue d’Alsace, 49000 Angers', '0241123456', 'angers@cashcash.fr'),
(22, 'Agence Metz Lorraine', '5 place Saint-Louis, 57000 Metz', '0387123456', 'metz@cashcash.fr'),
(23, 'Agence Nancy Est', '10 rue Saint-Jean, 54000 Nancy', '0383123456', 'nancy@cashcash.fr'),
(24, 'Agence Mulhouse Alsace', '7 rue du Sauvage, 68100 Mulhouse', '0389123456', 'mulhouse@cashcash.fr'),
(25, 'Agence Perpignan Sud', '6 boulevard Clemenceau, 66000 Perpignan', '0468123456', 'perpignan@cashcash.fr'),

(26, 'Agence Bayonne Pays Basque', '11 rue d’Espagne, 64100 Bayonne', '0559123456', 'bayonne@cashcash.fr'),
(27, 'Agence Pau Pyrénées', '9 place Clemenceau, 64000 Pau', '0559123457', 'pau@cashcash.fr'),
(28, 'Agence La Rochelle Atlantique', '14 rue du Palais, 17000 La Rochelle', '0546123456', 'larochelle@cashcash.fr'),
(29, 'Agence Saint-Étienne Loire', '8 rue Michelet, 42000 Saint-Étienne', '0477123456', 'saintetienne@cashcash.fr'),
(30, 'Agence Toulon Méditerranée', '20 avenue Vauban, 83000 Toulon', '0494123456', 'toulon@cashcash.fr'),

(31, 'Agence Avignon Provence', '5 rue de la République, 84000 Avignon', '0490123456', 'avignon@cashcash.fr'),
(32, 'Agence Béziers Occitanie', '12 avenue Gambetta, 34500 Béziers', '0467123457', 'beziers@cashcash.fr'),
(33, 'Agence Nîmes Gard', '7 boulevard Victor Hugo, 30000 Nîmes', '0466123456', 'nimes@cashcash.fr'),
(34, 'Agence Brest Armor', '10 rue de Siam, 29200 Brest', '0298123456', 'brest@cashcash.fr'),
(35, 'Agence Quimper Bretagne', '4 rue Kéréon, 29000 Quimper', '0298123457', 'quimper@cashcash.fr'),

(36, 'Agence Lorient Bretagne', '9 cours de Chazelles, 56100 Lorient', '0297123456', 'lorient@cashcash.fr'),
(37, 'Agence Vannes Bretagne', '6 rue Thiers, 56000 Vannes', '0297123457', 'vannes@cashcash.fr'),
(38, 'Agence Chambéry Savoie', '11 rue de Boigne, 73000 Chambéry', '0479123456', 'chambery@cashcash.fr'),
(39, 'Agence Annecy Alpes', '8 rue Carnot, 74000 Annecy', '0450123456', 'annecy@cashcash.fr'),
(40, 'Agence Valence Drôme', '13 avenue Victor Hugo, 26000 Valence', '0475123456', 'valence@cashcash.fr'),

(41, 'Agence Metz Technopole', '2 rue Graham Bell, 57070 Metz', '0387123457', 'metztech@cashcash.fr'),
(42, 'Agence Paris Sud', '45 boulevard Saint-Michel, 75005 Paris', '0102030406', 'parissud@cashcash.fr'),
(43, 'Agence Paris Est', '18 rue de Belleville, 75020 Paris', '0102030407', 'parisest@cashcash.fr'),
(44, 'Agence Paris Ouest', '30 avenue de Versailles, 75016 Paris', '0102030408', 'parisouest@cashcash.fr'),
(45, 'Agence Cergy Pontoise', '5 avenue du Parc, 95000 Cergy', '0130123456', 'cergy@cashcash.fr'),

(46, 'Agence Evry Centre', '7 place des Terrasses, 91000 Évry', '0160123456', 'evry@cashcash.fr'),
(47, 'Agence Créteil Val-de-Marne', '12 avenue du Général de Gaulle, 94000 Créteil', '0143123456', 'creteil@cashcash.fr'),
(48, 'Agence Nanterre La Défense', '15 parvis de La Défense, 92000 Nanterre', '0147123456', 'nanterre@cashcash.fr'),
(49, 'Agence Versailles Île-de-France', '6 rue Royale, 78000 Versailles', '0139123456', 'versailles@cashcash.fr'),
(50, 'Agence Rouen Seine', '9 rue du Gros-Horloge, 76000 Rouen', '0235123457', 'rouen@cashcash.fr'),

(51, 'Agence Limoges Centre', '14 rue Jean Jaurès, 87000 Limoges', '0555123457', 'limoges@cashcash.fr'),
(52, 'Agence Poitiers Vienne', '10 rue Carnot, 86000 Poitiers', '0549123456', 'poitiers@cashcash.fr'),
(53, 'Agence Niort Deux-Sèvres', '8 rue Victor Hugo, 79000 Niort', '0549123457', 'niort@cashcash.fr'),
(54, 'Agence Bourges Centre', '11 rue Moyenne, 18000 Bourges', '0248123456', 'bourges@cashcash.fr'),
(55, 'Agence Chartres Eure-et-Loir', '6 rue du Général de Gaulle, 28000 Chartres', '0237123456', 'chartres@cashcash.fr'),

(56, 'Agence Auxerre Bourgogne', '9 rue de Paris, 89000 Auxerre', '0386123456', 'auxerre@cashcash.fr'),
(57, 'Agence Colmar Alsace', '4 rue des Marchands, 68000 Colmar', '0389123457', 'colmar@cashcash.fr');

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `NumClient` int(11) NOT NULL,
  `RaisonSociale` varchar(50) DEFAULT NULL,
  `SIREN` varchar(50) DEFAULT NULL,
  `CodeAPE` varchar(50) DEFAULT NULL,
  `AdressePostale` varchar(50) DEFAULT NULL,
  `NumTel` varchar(50) DEFAULT NULL,
  `NumTelecopie` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DistanceAgenceKm` decimal(15,2) DEFAULT NULL,
  `DuréeDeplacement` time DEFAULT NULL,
  `Num_Agence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Client`
--

INSERT INTO `Client` (`NumClient`, `RaisonSociale`, `SIREN`, `CodeAPE`, `AdressePostale`, `NumTel`, `NumTelecopie`, `Email`, `DistanceAgenceKm`, `DuréeDeplacement`, `Num_Agence`) VALUES
(1, 'Carrefour Express Paris Nord', '552100554', '4711D', '10 rue de Paris 75010 Paris', '0102031001', NULL, 'carrefour.nord@client.fr', 2.50, '00:10:00', 1),
(2, 'Boulangerie Paul République', '442233665', '1071C', '22 rue du Faubourg 75010 Paris', '0102031002', NULL, 'paul.rep@client.fr', 1.20, '00:07:00', 1),
(3, 'Pharmacie du Nord', '331445566', '4773Z', '5 avenue Strasbourg 75010 Paris', '0102031003', NULL, 'pharm.nord@client.fr', 3.10, '00:12:00', 1),

(4, 'Intermarché Lyon 8', '553322110', '4711D', '15 avenue Lumière 69008 Lyon', '0405061001', NULL, 'inter.lyon8@client.fr', 2.00, '00:08:00', 2),
(5, 'Garage Auto Lyon Centre', '665544332', '4520A', '8 rue Monplaisir 69008 Lyon', '0405061002', NULL, 'garage.lyon@client.fr', 1.50, '00:06:00', 2),
(6, 'Optique Lumière', '774411223', '4778A', '12 rue de Lyon 69008 Lyon', '0405061003', NULL, 'optique@client.fr', 2.80, '00:09:00', 2),

(7, 'Auchan Lille Flandres', '556677889', '4711D', '10 rue Faidherbe 59000 Lille', '0320451001', NULL, 'auchan.lille@client.fr', 2.20, '00:10:00', 3),
(8, 'Bureau Vallée Lille', '998877665', '4762Z', '25 rue Nationale 59000 Lille', '0320451002', NULL, 'bv.lille@client.fr', 1.80, '00:07:00', 3),
(9, 'Pharmacie Centrale Lille', '112233445', '4773Z', '3 rue Solférino 59000 Lille', '0320451003', NULL, 'pharma.lille@client.fr', 2.50, '00:09:00', 3),

(10, 'Monoprix Marseille Prado', '223344556', '4711D', '12 boulevard Prado 13008 Marseille', '0491123001', NULL, 'mono.marseille@client.fr', 1.30, '00:05:00', 4),
(11, 'Restaurant Le Sud', '334455667', '5610A', '18 rue Paradis 13008 Marseille', '0491123002', NULL, 'lesud@client.fr', 2.10, '00:08:00', 4),
(12, 'Pharmacie Prado Sud', '445566778', '4773Z', '6 avenue du Prado 13008 Marseille', '0491123003', NULL, 'pharma.prado@client.fr', 1.70, '00:06:00', 4),

(13, 'Carrefour Bordeaux Lac', '556600112', '4711D', '20 rue du Lac 33000 Bordeaux', '0555123001', NULL, 'carrefour.bdx@client.fr', 3.00, '00:12:00', 5),
(14, 'Boulangerie Maison Dubois', '667711223', '1071C', '8 rue Sainte-Catherine 33000 Bordeaux', '0555123002', NULL, 'dubois@client.fr', 1.40, '00:06:00', 5),
(15, 'Garage Bordeaux Auto', '778822334', '4520A', '14 cours Alsace 33000 Bordeaux', '0555123003', NULL, 'garage.bdx@client.fr', 2.60, '00:09:00', 5),

(16, 'Auchan Toulouse Centre', '889933445', '4711D', '10 rue Alsace 31000 Toulouse', '0567123001', NULL, 'auchan.toulouse@client.fr', 2.20, '00:08:00', 6),
(17, 'Pharmacie Capitole', '990044556', '4773Z', '3 place Capitole 31000 Toulouse', '0567123002', NULL, 'pharma.toulouse@client.fr', 1.00, '00:04:00', 6),
(18, 'Fnac Toulouse', '112244668', '4764Z', '12 rue Labège 31000 Toulouse', '0567123003', NULL, 'fnac.toulouse@client.fr', 2.90, '00:10:00', 6),

(19, 'Carrefour Nantes Atlantis', '223355779', '4711D', '5 boulevard Atlantis 44000 Nantes', '0240123001', NULL, 'carrefour.nantes@client.fr', 3.50, '00:13:00', 7),
(20, 'Boulanger Nantes Centre', '334466880', '4754Z', '10 rue Crébillon 44000 Nantes', '0240123002', NULL, 'boulanger.nantes@client.fr', 1.70, '00:06:00', 7),
(21, 'Super U Angers Centre', '445566781', '4711D', '10 rue d’Alsace 49000 Angers', '0241123003', NULL, 'superu.angers@client.fr', 1.90, '00:07:00', 21),
(22, 'Pharmacie Angers Loire', '556677882', '4773Z', '5 rue d’Angers 49000 Angers', '0241123004', NULL, 'pharma.angers@client.fr', 2.40, '00:09:00', 21),
(23, 'Garage Loire Auto', '667788993', '4520A', '12 boulevard Loire 49000 Angers', '0241123005', NULL, 'garage.angers@client.fr', 3.10, '00:12:00', 21),

(24, 'Carrefour Metz Centre', '778899001', '4711D', '8 place Saint-Louis 57000 Metz', '0387123001', NULL, 'carrefour.metz@client.fr', 2.00, '00:08:00', 22),
(25, 'Boulanger Metz', '889900112', '4754Z', '15 rue Serpenoise 57000 Metz', '0387123002', NULL, 'boulanger.metz@client.fr', 1.60, '00:06:00', 22),
(26, 'Pharmacie Metz Gare', '990011223', '4773Z', '3 avenue Foch 57000 Metz', '0387123003', NULL, 'pharma.metz@client.fr', 2.80, '00:10:00', 22),

(27, 'Intermarché Nancy', '101122334', '4711D', '10 rue Saint-Jean 54000 Nancy', '0383123001', NULL, 'inter.nancy@client.fr', 1.80, '00:07:00', 23),
(28, 'Opticien Nancy Centre', '112233445', '4778A', '5 place Stanislas 54000 Nancy', '0383123002', NULL, 'optique.nancy@client.fr', 1.20, '00:05:00', 23),
(29, 'Garage Nancy Auto', '223344556', '4520A', '9 rue des Ponts 54000 Nancy', '0383123003', NULL, 'garage.nancy@client.fr', 2.60, '00:09:00', 23),

(30, 'Carrefour Mulhouse', '334455667', '4711D', '12 rue du Sauvage 68100 Mulhouse', '0389123001', NULL, 'carrefour.mulhouse@client.fr', 2.10, '00:08:00', 24),
(31, 'Boulanger Mulhouse Centre', '445566778', '4754Z', '8 rue de l’Arsenal 68100 Mulhouse', '0389123002', NULL, 'boulanger.mulhouse@client.fr', 1.70, '00:06:00', 24),
(32, 'Pharmacie Alsace Sud', '556677889', '4773Z', '4 avenue Colmar 68100 Mulhouse', '0389123003', NULL, 'pharma.mulhouse@client.fr', 2.90, '00:10:00', 24),

(33, 'Intermarché Perpignan', '667788990', '4711D', '10 boulevard Clemenceau 66000 Perpignan', '0468123001', NULL, 'inter.perpignan@client.fr', 1.60, '00:06:00', 25),
(34, 'Pharmacie Perpignan Sud', '778899101', '4773Z', '6 rue de la Loge 66000 Perpignan', '0468123002', NULL, 'pharma.perpignan@client.fr', 2.20, '00:08:00', 25),
(35, 'Garage Catalan', '889900212', '4520A', '12 avenue Catalogne 66000 Perpignan', '0468123003', NULL, 'garage.perpignan@client.fr', 3.00, '00:11:00', 25),

(36, 'Carrefour Bayonne', '990011334', '4711D', '5 rue d’Espagne 64100 Bayonne', '0559123001', NULL, 'carrefour.bayonne@client.fr', 1.90, '00:07:00', 26),
(37, 'Boulanger Bayonne Centre', '101122445', '4754Z', '8 rue Port Neuf 64100 Bayonne', '0559123002', NULL, 'boulanger.bayonne@client.fr', 1.30, '00:05:00', 26),
(38, 'Pharmacie Basque', '112233556', '4773Z', '3 rue Espagne 64100 Bayonne', '0559123003', NULL, 'pharma.bayonne@client.fr', 2.60, '00:09:00', 26),

(39, 'Intermarché Pau', '223344667', '4711D', '10 rue Henri IV 64000 Pau', '0559123004', NULL, 'inter.pau@client.fr', 2.10, '00:08:00', 27),
(40, 'Optique Pau Centre', '334455778', '4778A', '5 place Verdun 64000 Pau', '0559123005', NULL, 'optique.pau@client.fr', 1.40, '00:05:00', 27),
(41, 'Garage Pyrénées Auto', '445566889', '4520A', '9 boulevard Pyrénées 64000 Pau', '0559123006', NULL, 'garage.pau@client.fr', 3.20, '00:12:00', 27),

(42, 'Carrefour La Rochelle', '556677990', '4711D', '8 rue du Palais 17000 La Rochelle', '0546123001', NULL, 'carrefour.lr@client.fr', 1.80, '00:07:00', 28),
(43, 'Boulanger La Rochelle', '667788101', '4754Z', '12 avenue Gambetta 17000 La Rochelle', '0546123002', NULL, 'boulanger.lr@client.fr', 2.40, '00:09:00', 28),
(44, 'Pharmacie Atlantique', '778899212', '4773Z', '3 quai Valin 17000 La Rochelle', '0546123003', NULL, 'pharma.lr@client.fr', 2.00, '00:08:00', 28),

(45, 'Intermarché Saint-Étienne', '889900323', '4711D', '10 rue Michelet 42000 Saint-Étienne', '0477123001', NULL, 'inter.ste@client.fr', 2.30, '00:09:00', 29),
(46, 'Garage Loire Sud', '990011434', '4520A', '6 rue Bergson 42000 Saint-Étienne', '0477123002', NULL, 'garage.ste@client.fr', 1.70, '00:06:00', 29),
(47, 'Pharmacie Centre Loire', '101122545', '4773Z', '4 place Hôtel de Ville 42000 Saint-Étienne', '0477123003', NULL, 'pharma.ste@client.fr', 2.60, '00:10:00', 29),

(48, 'Carrefour Toulon', '112233656', '4711D', '10 avenue Vauban 83000 Toulon', '0494123001', NULL, 'carrefour.toulon@client.fr', 2.10, '00:08:00', 30),
(49, 'Boulanger Toulon Sud', '223344767', '4754Z', '5 rue d’Alger 83000 Toulon', '0494123002', NULL, 'boulanger.toulon@client.fr', 1.60, '00:06:00', 30),
(50, 'Pharmacie Méditerranée', '334455878', '4773Z', '8 boulevard Littoral 83000 Toulon', '0494123003', NULL, 'pharma.toulon@client.fr', 2.90, '00:11:00', 30),

(51, 'Intermarché Avignon', '445566989', '4711D', '5 rue République 84000 Avignon', '0490123001', NULL, 'inter.avignon@client.fr', 1.80, '00:07:00', 31),
(52, 'Garage Provence Auto', '556677100', '4520A', '10 boulevard Rhône 84000 Avignon', '0490123002', NULL, 'garage.avignon@client.fr', 2.50, '00:09:00', 31),
(53, 'Pharmacie Avignon Centre', '667788211', '4773Z', '3 place Horloge 84000 Avignon', '0490123003', NULL, 'pharma.avignon@client.fr', 1.20, '00:05:00', 31),

(54, 'Carrefour Nîmes', '778899322', '4711D', '8 boulevard Victor Hugo 30000 Nîmes', '0466123001', NULL, 'carrefour.nimes@client.fr', 2.10, '00:08:00', 33),
(55, 'Boulanger Nîmes', '889900433', '4754Z', '5 rue Générale 30000 Nîmes', '0466123002', NULL, 'boulanger.nimes@client.fr', 1.70, '00:06:00', 33),
(56, 'Pharmacie Gard Sud', '990011544', '4773Z', '12 avenue Feuchères 30000 Nîmes', '0466123003', NULL, 'pharma.nimes@client.fr', 2.80, '00:10:00', 33),

(57, 'Carrefour Brest', '101122655', '4711D', '10 rue Siam 29200 Brest', '0298123001', NULL, 'carrefour.brest@client.fr', 2.40, '00:09:00', 34),


(58, 'Carrefour Avignon Sud', '223344990', '4711D', '25 route de Marseille 84000 Avignon', '0490123101', NULL, 'carrefour.avsud@client.fr', 2.10, '00:08:00', 31),
(59, 'Boulangerie Provence', '223344991', '1071C', '8 rue Carreterie 84000 Avignon', '0490123102', NULL, 'boulanger.avignon@client.fr', 1.40, '00:05:00', 31),
(60, 'Pharmacie Sud Avignon', '223344992', '4773Z', '3 avenue Provence 84000 Avignon', '0490123103', NULL, 'pharma.avsud@client.fr', 2.60, '00:09:00', 31),

(61, 'Intermarché Béziers Centre', '223344993', '4711D', '10 boulevard de Genève 34500 Béziers', '0467123101', NULL, 'inter.beziers@client.fr', 2.20, '00:08:00', 32),
(62, 'Garage Béziers Auto', '223344994', '4520A', '5 avenue Pierre Verdier 34500 Béziers', '0467123102', NULL, 'garage.beziers@client.fr', 3.10, '00:12:00', 32),
(63, 'Pharmacie Occitanie', '223344995', '4773Z', '7 rue de la République 34500 Béziers', '0467123103', NULL, 'pharma.beziers@client.fr', 1.80, '00:07:00', 32),

(64, 'Carrefour Nîmes Sud', '223344996', '4711D', '18 avenue Jean Jaurès 30000 Nîmes', '0466123101', NULL, 'carrefour.nimes2@client.fr', 2.00, '00:08:00', 33),
(65, 'Optique Nîmes', '223344997', '4778A', '6 rue Nationale 30000 Nîmes', '0466123102', NULL, 'optique.nimes@client.fr', 1.50, '00:06:00', 33),
(66, 'Garage Gard Auto', '223344998', '4520A', '9 boulevard Gambetta 30000 Nîmes', '0466123103', NULL, 'garage.nimes@client.fr', 2.70, '00:10:00', 33),

(67, 'Boulanger Brest Centre', '223344999', '1071C', '12 rue Jean Jaurès 29200 Brest', '0298123101', NULL, 'boulanger.brest@client.fr', 1.90, '00:07:00', 34),
(68, 'Carrefour Brest Port', '223345000', '4711D', '5 quai Commandant Malbert 29200 Brest', '0298123102', NULL, 'carrefour.brest2@client.fr', 2.40, '00:09:00', 34),
(69, 'Pharmacie Armorique', '223345001', '4773Z', '8 rue de Siam 29200 Brest', '0298123103', NULL, 'pharma.brest@client.fr', 1.60, '00:06:00', 34),

(70, 'Intermarché Quimper Sud', '223345002', '4711D', '10 avenue de la Gare 29000 Quimper', '0298123104', NULL, 'inter.quimper@client.fr', 2.10, '00:08:00', 35),
(71, 'Boulanger Quimper', '223345003', '1071C', '4 rue du Parc 29000 Quimper', '0298123105', NULL, 'boulanger.quimper@client.fr', 1.70, '00:06:00', 35),
(72, 'Pharmacie Finistère', '223345004', '4773Z', '6 rue Kéréon 29000 Quimper', '0298123106', NULL, 'pharma.quimper@client.fr', 2.50, '00:09:00', 35),

(73, 'Carrefour Lorient', '223345005', '4711D', '9 boulevard Cosmao Dumanoir 56100 Lorient', '0297123101', NULL, 'carrefour.lorient@client.fr', 2.00, '00:08:00', 36),
(74, 'Garage Lorient Auto', '223345006', '4520A', '12 rue du Port 56100 Lorient', '0297123102', NULL, 'garage.lorient@client.fr', 2.80, '00:10:00', 36),
(75, 'Pharmacie Bretagne Sud', '223345007', '4773Z', '3 rue de Belgique 56100 Lorient', '0297123103', NULL, 'pharma.lorient@client.fr', 1.50, '00:06:00', 36),

(76, 'Intermarché Vannes', '223345008', '4711D', '10 rue Thiers 56000 Vannes', '0297123104', NULL, 'inter.vannes@client.fr', 1.90, '00:07:00', 37),
(77, 'Optique Vannes Centre', '223345009', '4778A', '5 place Gambetta 56000 Vannes', '0297123105', NULL, 'optique.vannes@client.fr', 1.30, '00:05:00', 37),
(78, 'Garage Morbihan', '223345010', '4520A', '8 avenue du Maréchal Juin 56000 Vannes', '0297123106', NULL, 'garage.vannes@client.fr', 2.60, '00:09:00', 37),

(79, 'Carrefour Chambéry', '223345011', '4711D', '12 rue de Boigne 73000 Chambéry', '0479123101', NULL, 'carrefour.chambery@client.fr', 2.10, '00:08:00', 38),
(80, 'Boulanger Chambéry', '223345012', '1071C', '6 place Saint-Léger 73000 Chambéry', '0479123102', NULL, 'boulanger.chambery@client.fr', 1.40, '00:05:00', 38),
(81, 'Pharmacie Savoie', '223345013', '4773Z', '9 rue Croix d’Or 73000 Chambéry', '0479123103', NULL, 'pharma.chambery@client.fr', 2.70, '00:10:00', 38),

(82, 'Intermarché Annecy', '223345014', '4711D', '10 rue Carnot 74000 Annecy', '0450123101', NULL, 'inter.annecy@client.fr', 2.00, '00:08:00', 39),
(83, 'Garage Annecy Auto', '223345015', '4520A', '5 avenue de Genève 74000 Annecy', '0450123102', NULL, 'garage.annecy@client.fr', 2.90, '00:11:00', 39),
(84, 'Pharmacie Alpes', '223345016', '4773Z', '3 rue Royale 74000 Annecy', '0450123103', NULL, 'pharma.annecy@client.fr', 1.60, '00:06:00', 39),

(85, 'Carrefour Valence', '223345017', '4711D', '12 avenue Sadi Carnot 26000 Valence', '0475123101', NULL, 'carrefour.valence@client.fr', 2.10, '00:08:00', 40),
(86, 'Boulanger Valence', '223345018', '1071C', '6 rue Pierre Semard 26000 Valence', '0475123102', NULL, 'boulanger.valence@client.fr', 1.70, '00:06:00', 40),
(87, 'Pharmacie Drôme Sud', '223345019', '4773Z', '9 boulevard Bancel 26000 Valence', '0475123103', NULL, 'pharma.valence@client.fr', 2.50, '00:09:00', 40),

(88, 'Intermarché Metz Tech', '223345020', '4711D', '4 rue Graham Bell 57070 Metz', '0387123101', NULL, 'inter.metztech@client.fr', 2.30, '00:09:00', 41),
(89, 'Garage Technopole Metz', '223345021', '4520A', '7 avenue de l’Europe 57070 Metz', '0387123102', NULL, 'garage.metztech@client.fr', 3.10, '00:12:00', 41),
(90, 'Pharmacie Tech Metz', '223345022', '4773Z', '10 rue du Technopôle 57070 Metz', '0387123103', NULL, 'pharma.metztech@client.fr', 2.00, '00:08:00', 41),

(91, 'Carrefour Paris Sud', '223345023', '4711D', '30 boulevard Saint-Michel 75005 Paris', '0102030501', NULL, 'carrefour.parissud@client.fr', 2.00, '00:08:00', 42),
(92, 'Pharmacie Latin', '223345024', '4773Z', '12 rue Mouffetard 75005 Paris', '0102030502', NULL, 'pharma.parissud@client.fr', 1.20, '00:05:00', 42),
(93, 'Garage Paris 5', '223345025', '4520A', '8 rue de la Santé 75005 Paris', '0102030503', NULL, 'garage.parissud@client.fr', 2.80, '00:10:00', 42),
(94, 'Carrefour Paris Est', '334455900', '4711D', '18 rue de Belleville 75020 Paris', '0102030601', NULL, 'carrefour.parisest@client.fr', 2.10, '00:08:00', 43),
(95, 'Pharmacie Belleville', '334455901', '4773Z', '5 rue de Ménilmontant 75020 Paris', '0102030602', NULL, 'pharma.parisest@client.fr', 1.50, '00:06:00', 43),
(96, 'Garage Paris Est Auto', '334455902', '4520A', '9 avenue Gambetta 75020 Paris', '0102030603', NULL, 'garage.parisest@client.fr', 2.70, '00:10:00', 43),

(97, 'Carrefour Paris Ouest', '445566900', '4711D', '30 avenue de Versailles 75016 Paris', '0102030701', NULL, 'carrefour.parisouest@client.fr', 2.40, '00:09:00', 44),
(98, 'Optique Passy', '445566901', '4778A', '8 rue de Passy 75016 Paris', '0102030702', NULL, 'optique.parisouest@client.fr', 1.30, '00:05:00', 44),
(99, 'Pharmacie Auteuil', '445566902', '4773Z', '12 rue d’Auteuil 75016 Paris', '0102030703', NULL, 'pharma.parisouest@client.fr', 2.10, '00:08:00', 44),

(100, 'Carrefour Cergy', '556677900', '4711D', '5 avenue du Parc 95000 Cergy', '0130123001', NULL, 'carrefour.cergy@client.fr', 2.60, '00:10:00', 45),
(101, 'Garage Cergy Auto', '556677901', '4520A', '10 boulevard de l’Oise 95000 Cergy', '0130123002', NULL, 'garage.cergy@client.fr', 3.10, '00:12:00', 45),
(102, 'Pharmacie Cergy Centre', '556677902', '4773Z', '6 rue des Chênes 95000 Cergy', '0130123003', NULL, 'pharma.cergy@client.fr', 1.80, '00:07:00', 45),

(103, 'Carrefour Évry', '667788900', '4711D', '7 place des Terrasses 91000 Évry', '0160123001', NULL, 'carrefour.evry@client.fr', 2.20, '00:08:00', 46),
(104, 'Pharmacie Évry Centre', '667788901', '4773Z', '3 rue de l’Essonne 91000 Évry', '0160123002', NULL, 'pharma.evry@client.fr', 1.40, '00:05:00', 46),
(105, 'Garage Évry Auto', '667788902', '4520A', '12 boulevard des Coquibus 91000 Évry', '0160123003', NULL, 'garage.evry@client.fr', 2.90, '00:11:00', 46),

(106, 'Carrefour Créteil', '778899900', '4711D', '12 avenue du Général de Gaulle 94000 Créteil', '0143123001', NULL, 'carrefour.creteil@client.fr', 2.00, '00:08:00', 47),
(107, 'Pharmacie Créteil Centre', '778899901', '4773Z', '5 rue de Paris 94000 Créteil', '0143123002', NULL, 'pharma.creteil@client.fr', 1.50, '00:06:00', 47),
(108, 'Garage Créteil Auto', '778899902', '4520A', '9 avenue Laferrière 94000 Créteil', '0143123003', NULL, 'garage.creteil@client.fr', 2.80, '00:10:00', 47),

(109, 'Carrefour Nanterre', '889900900', '4711D', '15 parvis de La Défense 92000 Nanterre', '0147123001', NULL, 'carrefour.nanterre@client.fr', 2.10, '00:08:00', 48),
(110, 'Pharmacie La Défense', '889900901', '4773Z', '8 rue de Bezons 92000 Nanterre', '0147123002', NULL, 'pharma.nanterre@client.fr', 1.30, '00:05:00', 48),
(111, 'Garage Nanterre Auto', '889900902', '4520A', '10 boulevard des Bouvets 92000 Nanterre', '0147123003', NULL, 'garage.nanterre@client.fr', 2.70, '00:10:00', 48),

(112, 'Carrefour Versailles', '990011900', '4711D', '6 rue Royale 78000 Versailles', '0139123001', NULL, 'carrefour.versailles@client.fr', 1.80, '00:07:00', 49),
(113, 'Pharmacie Versailles Centre', '990011901', '4773Z', '4 rue de la Paroisse 78000 Versailles', '0139123002', NULL, 'pharma.versailles@client.fr', 1.20, '00:05:00', 49),
(114, 'Garage Versailles Auto', '990011902', '4520A', '9 avenue de Saint-Cloud 78000 Versailles', '0139123003', NULL, 'garage.versailles@client.fr', 2.50, '00:09:00', 49),

(115, 'Carrefour Rouen', '101122900', '4711D', '10 rue du Gros-Horloge 76000 Rouen', '0235123001', NULL, 'carrefour.rouen@client.fr', 2.10, '00:08:00', 50),
(116, 'Pharmacie Rouen Centre', '101122901', '4773Z', '5 rue Jeanne d’Arc 76000 Rouen', '0235123002', NULL, 'pharma.rouen@client.fr', 1.40, '00:06:00', 50),
(117, 'Garage Rouen Auto', '101122902', '4520A', '8 boulevard des Belges 76000 Rouen', '0235123003', NULL, 'garage.rouen@client.fr', 2.80, '00:10:00', 50),

(118, 'Carrefour Limoges', '112233900', '4711D', '14 rue Jean Jaurès 87000 Limoges', '0555123001', NULL, 'carrefour.limoges@client.fr', 2.20, '00:08:00', 51),
(119, 'Pharmacie Limoges Centre', '112233901', '4773Z', '6 place Denis Dussoubs 87000 Limoges', '0555123002', NULL, 'pharma.limoges@client.fr', 1.50, '00:06:00', 51),
(120, 'Garage Limoges Auto', '112233902', '4520A', '9 avenue Garibaldi 87000 Limoges', '0555123003', NULL, 'garage.limoges@client.fr', 2.90, '00:11:00', 51),

(121, 'Carrefour Poitiers', '223344900', '4711D', '10 rue Carnot 86000 Poitiers', '0549123001', NULL, 'carrefour.poitiers@client.fr', 2.00, '00:08:00', 52),
(122, 'Pharmacie Poitiers Centre', '223344901', '4773Z', '5 rue Magenta 86000 Poitiers', '0549123002', NULL, 'pharma.poitiers@client.fr', 1.30, '00:05:00', 52),
(123, 'Garage Poitiers Auto', '223344902', '4520A', '8 boulevard Blossac 86000 Poitiers', '0549123003', NULL, 'garage.poitiers@client.fr', 2.70, '00:10:00', 52),

(124, 'Carrefour Niort', '334455900', '4711D', '8 rue Victor Hugo 79000 Niort', '0549123004', NULL, 'carrefour.niort@client.fr', 2.10, '00:08:00', 53),
(125, 'Pharmacie Niort Centre', '334455901', '4773Z', '3 rue de la Gare 79000 Niort', '0549123005', NULL, 'pharma.niort@client.fr', 1.40, '00:06:00', 53),
(126, 'Garage Niort Auto', '334455902', '4520A', '9 avenue de Paris 79000 Niort', '0549123006', NULL, 'garage.niort@client.fr', 2.80, '00:10:00', 53),

(127, 'Carrefour Bourges', '445566900', '4711D', '6 rue Moyenne 18000 Bourges', '0248123001', NULL, 'carrefour.bourges@client.fr', 2.20, '00:08:00', 54),
(128, 'Pharmacie Bourges Centre', '445566901', '4773Z', '4 place Cujas 18000 Bourges', '0248123002', NULL, 'pharma.bourges@client.fr', 1.50, '00:06:00', 54),
(129, 'Garage Bourges Auto', '445566902', '4520A', '10 boulevard République 18000 Bourges', '0248123003', NULL, 'garage.bourges@client.fr', 2.90, '00:11:00', 54),

(130, 'Carrefour Chartres', '556677900', '4711D', '5 rue du Général de Gaulle 28000 Chartres', '0237123001', NULL, 'carrefour.chartres@client.fr', 2.00, '00:08:00', 55),
(131, 'Pharmacie Chartres Centre', '556677901', '4773Z', '3 rue des Changes 28000 Chartres', '0237123002', NULL, 'pharma.chartres@client.fr', 1.30, '00:05:00', 55),
(132, 'Garage Chartres Auto', '556677902', '4520A', '9 boulevard Chasles 28000 Chartres', '0237123003', NULL, 'garage.chartres@client.fr', 2.70, '00:10:00', 55),

(133, 'Carrefour Auxerre', '667788900', '4711D', '7 rue de Paris 89000 Auxerre', '0386123001', NULL, 'carrefour.auxerre@client.fr', 2.10, '00:08:00', 56),
(134, 'Pharmacie Auxerre Centre', '667788901', '4773Z', '4 rue de la Liberté 89000 Auxerre', '0386123002', NULL, 'pharma.auxerre@client.fr', 1.40, '00:06:00', 56),
(135, 'Garage Auxerre Auto', '667788902', '4520A', '10 boulevard Vauban 89000 Auxerre', '0386123003', NULL, 'garage.auxerre@client.fr', 2.80, '00:10:00', 56),

(136, 'Carrefour Colmar', '778899900', '4711D', '4 rue des Marchands 68000 Colmar', '0389123001', NULL, 'carrefour.colmar@client.fr', 1.90, '00:07:00', 57),
(137, 'Pharmacie Colmar Centre', '778899901', '4773Z', '6 rue Vauban 68000 Colmar', '0389123002', NULL, 'pharma.colmar@client.fr', 1.20, '00:05:00', 57),
(138, 'Garage Colmar Auto', '778899902', '4520A', '9 avenue de la République 68000 Colmar', '0389123003', NULL, 'garage.colmar@client.fr', 2.60, '00:09:00', 57),


(139, 'Carrefour Nantes Atlantis Sud', '889900901', '4711D', '15 rue Atlantis 44000 Nantes', '0240123101', NULL, 'carrefour.nantes2@client.fr', 2.40, '00:09:00', 7),
(140, 'Pharmacie Nantes Centre', '889900902', '4773Z', '6 rue Crébillon 44000 Nantes', '0240123102', NULL, 'pharma.nantes@client.fr', 1.50, '00:06:00', 7),
(141, 'Garage Nantes Ouest', '889900903', '4520A', '9 boulevard de la Prairie 44000 Nantes', '0240123103', NULL, 'garage.nantes@client.fr', 2.80, '00:10:00', 7),

(142, 'Carrefour Strasbourg Centre', '889900904', '4711D', '10 place Kléber 67000 Strasbourg', '0388123101', NULL, 'carrefour.strasbourg@client.fr', 2.10, '00:08:00', 8),
(143, 'Pharmacie Strasbourg Gare', '889900905', '4773Z', '5 rue du Maire Kuss 67000 Strasbourg', '0388123102', NULL, 'pharma.strasbourg@client.fr', 1.30, '00:05:00', 8),
(144, 'Garage Strasbourg Auto', '889900906', '4520A', '8 avenue de Colmar 67000 Strasbourg', '0388123103', NULL, 'garage.strasbourg@client.fr', 2.70, '00:10:00', 8),

(145, 'Carrefour Nice Centre', '889900907', '4711D', '12 avenue Jean Médecin 06000 Nice', '0493123101', NULL, 'carrefour.nice@client.fr', 2.00, '00:08:00', 9),
(146, 'Pharmacie Nice Sud', '889900908', '4773Z', '6 rue de France 06000 Nice', '0493123102', NULL, 'pharma.nice@client.fr', 1.40, '00:06:00', 9),
(147, 'Garage Nice Auto', '889900909', '4520A', '9 boulevard Gambetta 06000 Nice', '0493123103', NULL, 'garage.nice@client.fr', 2.80, '00:10:00', 9),

(148, 'Carrefour Rennes Alma', '889900910', '4711D', '10 centre Alma 35000 Rennes', '0299123101', NULL, 'carrefour.rennes@client.fr', 2.20, '00:08:00', 10),
(149, 'Pharmacie Rennes Centre', '889900911', '4773Z', '5 rue Saint-Michel 35000 Rennes', '0299123102', NULL, 'pharma.rennes@client.fr', 1.50, '00:06:00', 10),
(150, 'Garage Rennes Auto', '889900912', '4520A', '8 boulevard de la Liberté 35000 Rennes', '0299123103', NULL, 'garage.rennes@client.fr', 2.90, '00:11:00', 10),

(151, 'Carrefour Montpellier Sud', '889900913', '4711D', '15 avenue de la Mer 34000 Montpellier', '0467123101', NULL, 'carrefour.mtp@client.fr', 2.30, '00:09:00', 11),
(152, 'Pharmacie Montpellier Centre', '889900914', '4773Z', '6 place de la Comédie 34000 Montpellier', '0467123102', NULL, 'pharma.mtp@client.fr', 1.20, '00:05:00', 11),
(153, 'Garage Montpellier Auto', '889900915', '4520A', '9 rue de la Loge 34000 Montpellier', '0467123103', NULL, 'garage.mtp@client.fr', 2.70, '00:10:00', 11),

(154, 'Carrefour Grenoble Centre', '889900916', '4711D', '10 place Victor Hugo 38000 Grenoble', '0476123101', NULL, 'carrefour.grenoble@client.fr', 2.10, '00:08:00', 12),
(155, 'Pharmacie Grenoble Sud', '889900917', '4773Z', '5 rue Félix Poulat 38000 Grenoble', '0476123102', NULL, 'pharma.grenoble@client.fr', 1.40, '00:06:00', 12),
(156, 'Garage Grenoble Auto', '889900918', '4520A', '8 boulevard Gambetta 38000 Grenoble', '0476123103', NULL, 'garage.grenoble@client.fr', 2.80, '00:10:00', 12),

(157, 'Carrefour Dijon Centre', '889900919', '4711D', '12 rue de la Liberté 21000 Dijon', '0380123101', NULL, 'carrefour.dijon@client.fr', 2.00, '00:08:00', 13),
(158, 'Pharmacie Dijon Gare', '889900920', '4773Z', '6 avenue Foch 21000 Dijon', '0380123102', NULL, 'pharma.dijon@client.fr', 1.30, '00:05:00', 13),
(159, 'Garage Dijon Auto', '889900921', '4520A', '9 boulevard Carnot 21000 Dijon', '0380123103', NULL, 'garage.dijon@client.fr', 2.70, '00:10:00', 13),

(160, 'Carrefour Reims Centre', '889900922', '4711D', '10 rue de Vesle 51100 Reims', '0326123101', NULL, 'carrefour.reims@client.fr', 2.10, '00:08:00', 14),
(161, 'Pharmacie Reims Sud', '889900923', '4773Z', '5 place d’Erlon 51100 Reims', '0326123102', NULL, 'pharma.reims@client.fr', 1.40, '00:06:00', 14),
(162, 'Garage Reims Auto', '889900924', '4520A', '8 boulevard Lundy 51100 Reims', '0326123103', NULL, 'garage.reims@client.fr', 2.80, '00:10:00', 14),

(163, 'Carrefour Amiens Centre', '889900925', '4711D', '12 rue des 3 Cailloux 80000 Amiens', '0322123101', NULL, 'carrefour.amiens@client.fr', 2.00, '00:08:00', 15),
(164, 'Pharmacie Amiens Gare', '889900926', '4773Z', '6 rue Saint-Leu 80000 Amiens', '0322123102', NULL, 'pharma.amiens@client.fr', 1.30, '00:05:00', 15),
(165, 'Garage Amiens Auto', '889900927', '4520A', '9 boulevard de Belfort 80000 Amiens', '0322123103', NULL, 'garage.amiens@client.fr', 2.70, '00:10:00', 15),

(166, 'Carrefour Clermont Centre', '889900928', '4711D', '10 place de Jaude 63000 Clermont-Ferrand', '0473123101', NULL, 'carrefour.clermont@client.fr', 2.10, '00:08:00', 16),
(167, 'Pharmacie Clermont Sud', '889900929', '4773Z', '5 rue Blatin 63000 Clermont-Ferrand', '0473123102', NULL, 'pharma.clermont@client.fr', 1.40, '00:06:00', 16),
(168, 'Garage Clermont Auto', '889900930', '4520A', '8 boulevard Trudaine 63000 Clermont-Ferrand', '0473123103', NULL, 'garage.clermont@client.fr', 2.80, '00:10:00', 16),

(169, 'Carrefour Orléans Centre', '889900931', '4711D', '12 rue Jeanne d’Arc 45000 Orléans', '0238123101', NULL, 'carrefour.orleans@client.fr', 2.00, '00:08:00', 17),
(170, 'Pharmacie Orléans Gare', '889900932', '4773Z', '6 rue de la République 45000 Orléans', '0238123102', NULL, 'pharma.orleans@client.fr', 1.30, '00:05:00', 17),
(171, 'Garage Orléans Auto', '889900933', '4520A', '9 boulevard Rocheplatte 45000 Orléans', '0238123103', NULL, 'garage.orleans@client.fr', 2.70, '00:10:00', 17),

(172, 'Carrefour Tours Centre', '889900934', '4711D', '10 rue Nationale 37000 Tours', '0247123101', NULL, 'carrefour.tours@client.fr', 2.10, '00:08:00', 18),
(173, 'Pharmacie Tours Sud', '889900935', '4773Z', '5 place Plumereau 37000 Tours', '0247123102', NULL, 'pharma.tours@client.fr', 1.40, '00:06:00', 18),
(174, 'Garage Tours Auto', '889900936', '4520A', '8 boulevard Heurteloup 37000 Tours', '0247123103', NULL, 'garage.tours@client.fr', 2.80, '00:10:00', 18),

(175, 'Carrefour Le Havre', '889900937', '4711D', '12 quai Southampton 76600 Le Havre', '0235123101', NULL, 'carrefour.lehavre@client.fr', 2.10, '00:08:00', 19),
(176, 'Pharmacie Le Havre Centre', '889900938', '4773Z', '5 rue de Paris 76600 Le Havre', '0235123102', NULL, 'pharma.lehavre@client.fr', 1.40, '00:06:00', 19),
(177, 'Garage Le Havre Auto', '889900939', '4520A', '9 boulevard de Strasbourg 76600 Le Havre', '0235123103', NULL, 'garage.lehavre@client.fr', 2.80, '00:10:00', 19),

(178, 'Carrefour Caen Centre', '889900940', '4711D', '10 rue Saint-Pierre 14000 Caen', '0231123101', NULL, 'carrefour.caen@client.fr', 2.00, '00:08:00', 20),
(179, 'Pharmacie Caen Gare', '889900941', '4773Z', '5 rue Guillaume le Conquérant 14000 Caen', '0231123102', NULL, 'pharma.caen@client.fr', 1.30, '00:05:00', 20),
(180, 'Garage Caen Auto', '889900942', '4520A', '8 boulevard Leroy 14000 Caen', '0231123103', NULL, 'garage.caen@client.fr', 2.70, '00:10:00', 20),

(181, 'Carrefour Angers Centre', '889900943', '4711D', '12 rue d’Alsace 49000 Angers', '0241123101', NULL, 'carrefour.angers@client.fr', 2.10, '00:08:00', 21),
(182, 'Pharmacie Angers Sud', '889900944', '4773Z', '5 place du Ralliement 49000 Angers', '0241123102', NULL, 'pharma.angers@client.fr', 1.40, '00:06:00', 21),
(183, 'Garage Angers Auto', '889900945', '4520A', '9 boulevard Foch 49000 Angers', '0241123103', NULL, 'garage.angers@client.fr', 2.80, '00:10:00', 21);
-- --------------------------------------------------------

--
-- Structure de la table `Contrat_Maintenance`
--

CREATE TABLE `Contrat_Maintenance` (
  `NumContrat` int(11) NOT NULL,
  `DateSignature` date DEFAULT NULL,
  `DateEcheance` date DEFAULT NULL,
  `NumClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Contrat_Maintenance`
--


-- --------------------------------------------------------

--
-- Structure de la table `Employé`
--

CREATE TABLE `Employé` (
  `Matricule` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `DateEmbauche` date DEFAULT NULL,
  `Adresse` varchar(50) DEFAULT NULL,
  `Num_Agence` int(11) NOT NULL,
  `motDePasse` varchar(128) DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Employé`
--

INSERT INTO `Employé` (`Matricule`, `Nom`, `Prenom`, `DateEmbauche`, `Adresse`, `Num_Agence`, `motDePasse`, `Login`) VALUES
(1, 'Martin', 'Lucas', '2021-03-15', '12 rue Victor Hugo 75010 Paris', 1, 'mdp123', 'lmartin'),
(2, 'Bernard', 'Claire', '2022-06-10', '8 rue de Paris 75010 Paris', 1, 'mdp123', 'cbernard'),
(3, 'Dubois', 'Antoine', '2023-09-01', '5 avenue République 75010 Paris', 1, 'mdp123', 'adubois'),

(4, 'Petit', 'Sophie', '2020-02-20', '10 rue Lumière 69008 Lyon', 2, 'mdp123', 'spetit'),
(5, 'Robert', 'Hugo', '2021-11-05', '15 avenue Monplaisir 69008 Lyon', 2, 'mdp123', 'hrobert'),
(6, 'Richard', 'Emma', '2024-01-12', '3 rue Lyon 69008 Lyon', 2, 'mdp123', 'erichard'),

(7, 'Moreau', 'Louis', '2022-03-18', '20 rue Faidherbe 59000 Lille', 3, 'mdp123', 'lmoreau'),
(8, 'Laurent', 'Chloé', '2023-07-09', '6 rue Nationale 59000 Lille', 3, 'mdp123', 'claurent'),

(9, 'Simon', 'Nathan', '2021-09-14', '8 boulevard Prado 13008 Marseille', 4, 'mdp123', 'nsimon'),
(10, 'Michel', 'Laura', '2022-04-22', '12 rue Paradis 13008 Marseille', 4, 'mdp123', 'lmichel'),
(11, 'Lefèvre', 'Jules', '2024-05-30', '5 avenue Prado 13008 Marseille', 4, 'mdp123', 'jlefevre'),

(12, 'Leroy', 'Inès', '2020-01-10', '15 cours Intendance 33000 Bordeaux', 5, 'mdp123', 'ileroy'),
(13, 'Roux', 'Thomas', '2021-08-19', '8 rue Sainte-Catherine 33000 Bordeaux', 5, 'mdp123', 'troux'),

(14, 'Fournier', 'Camille', '2023-02-11', '10 place Capitole 31000 Toulouse', 6, 'mdp123', 'cfournier'),
(15, 'Girard', 'Maxime', '2022-12-05', '6 rue Alsace 31000 Toulouse', 6, 'mdp123', 'mgirard'),
(16, 'Bonnet', 'Sarah', '2024-06-20', '12 rue Labège 31000 Toulouse', 6, 'mdp123', 'sbonnet'),

(17, 'Dupont', 'Alexandre', '2021-05-15', '5 rue Strasbourg 44000 Nantes', 7, 'mdp123', 'adupont'),
(18, 'Lambert', 'Manon', '2023-03-28', '10 rue Crébillon 44000 Nantes', 7, 'mdp123', 'mlambert'),

(19, 'Fontaine', 'Paul', '2020-10-10', '3 place Kléber 67000 Strasbourg', 8, 'mdp123', 'pfontaine'),
(20, 'Renaud', 'Julie', '2022-01-17', '8 rue du Maire Kuss 67000 Strasbourg', 8, 'mdp123', 'jrenaud'),

(21, 'Chevalier', 'Antoine', '2021-06-01', '12 promenade Anglais 06000 Nice', 9, 'mdp123', 'achevalier'),
(22, 'Masson', 'Elodie', '2023-09-10', '5 rue France 06000 Nice', 9, 'mdp123', 'emasson'),

(23, 'Colin', 'Mathieu', '2020-03-22', '10 rue Saint-Michel 35000 Rennes', 10, 'mdp123', 'mcolin'),
(24, 'Vidal', 'Lucie', '2022-07-14', '6 rue Liberté 35000 Rennes', 10, 'mdp123', 'lvidal'),

(25, 'Boyer', 'Quentin', '2021-11-30', '8 avenue Mer 34000 Montpellier', 11, 'mdp123', 'qboyer'),
(26, 'Garnier', 'Emma', '2023-05-18', '12 place Comédie 34000 Montpellier', 11, 'mdp123', 'egarnier'),

(27, 'Faure', 'Baptiste', '2020-09-09', '5 rue Victor Hugo 38000 Grenoble', 12, 'mdp123', 'bfaure'),
(28, 'Marchand', 'Laura', '2022-02-25', '10 rue Félix Poulat 38000 Grenoble', 12, 'mdp123', 'lmarchand'),

(29, 'Guillaume', 'Adrien', '2021-01-12', '6 place Darcy 21000 Dijon', 13, 'mdp123', 'aguillaume'),
(30, 'Perrot', 'Camille', '2023-10-03', '8 rue Liberté 21000 Dijon', 13, 'mdp123', 'cperrot'),

(31, 'Meunier', 'Nicolas', '2020-12-20', '10 rue Vesle 51100 Reims', 14, 'mdp123', 'nmeunier'),
(32, 'Barbier', 'Sarah', '2022-08-11', '5 place Erlon 51100 Reims', 14, 'mdp123', 'sbarbier'),

(33, 'Lemoine', 'Julien', '2021-04-05', '6 rue Trois Cailloux 80000 Amiens', 15, 'mdp123', 'jlemoine'),
(34, 'Marchal', 'Clara', '2023-06-19', '8 rue Saint-Leu 80000 Amiens', 15, 'mdp123', 'cmarchal'),

(35, 'Lucas', 'Pierre', '2020-07-07', '10 place Jaude 63000 Clermont', 16, 'mdp123', 'plucas'),
(36, 'Legrand', 'Eva', '2022-03-14', '5 rue Blatin 63000 Clermont', 16, 'mdp123', 'elegrand'),

(37, 'Perrin', 'Victor', '2021-09-25', '8 rue Jeanne d’Arc 45000 Orléans', 17, 'mdp123', 'vperrin'),
(38, 'Girault', 'Léna', '2023-01-16', '10 rue République 45000 Orléans', 17, 'mdp123', 'lgirault'),

(39, 'Besson', 'Hugo', '2020-05-11', '6 rue Nationale 37000 Tours', 18, 'mdp123', 'hbesson'),
(40, 'Dufour', 'Manon', '2022-11-08', '8 rue Plumereau 37000 Tours', 18, 'mdp123', 'mdufour'),

(41, 'Renard', 'Louis', '2021-02-02', '10 quai Southampton 76600 Le Havre', 19, 'mdp123', 'lrenard'),
(42, 'Giraud', 'Emma', '2023-04-27', '5 rue Paris 76600 Le Havre', 19, 'mdp123', 'egiraud'),

(43, 'Carpentier', 'Noah', '2020-06-15', '8 rue Saint-Pierre 14000 Caen', 20, 'mdp123', 'ncarpentier'),
(44, 'Poirier', 'Chloé', '2022-09-09', '10 rue Guillaume 14000 Caen', 20, 'mdp123', 'cpoirier'),

(45, 'Delattre', 'Lucas', '2021-10-10', '6 rue Alsace 49000 Angers', 21, 'mdp123', 'ldelattre'),
(46, 'Boucher', 'Sarah', '2023-07-07', '8 rue Ralliement 49000 Angers', 21, 'mdp123', 'sboucher'),
(47, 'Lemoine', 'Julien', '2021-03-12', '10 rue d’Alsace 49000 Angers', 21, 'mdp123', 'jlemoine21'),
(48, 'Bazin', 'Clara', '2023-06-18', '6 rue Ralliement 49000 Angers', 21, 'mdp123', 'cbazin21'),

(49, 'Morel', 'Antoine', '2020-02-10', '5 place Saint-Louis 57000 Metz', 22, 'mdp123', 'amorel22'),
(50, 'Marchal', 'Laura', '2022-08-14', '9 rue Serpenoise 57000 Metz', 22, 'mdp123', 'lmarchal22'),

(51, 'Robin', 'Hugo', '2021-11-05', '8 rue Saint-Jean 54000 Nancy', 23, 'mdp123', 'hrobin23'),
(52, 'Picard', 'Emma', '2023-03-22', '12 place Stanislas 54000 Nancy', 23, 'mdp123', 'epicard23'),

(53, 'Garnier', 'Lucas', '2020-06-30', '6 rue du Sauvage 68100 Mulhouse', 24, 'mdp123', 'lgarnier24'),
(54, 'Carre', 'Sarah', '2022-01-15', '10 rue de l’Arsenal 68100 Mulhouse', 24, 'mdp123', 'scarre24'),

(55, 'Fournier', 'Mathis', '2021-09-09', '5 boulevard Clemenceau 66000 Perpignan', 25, 'mdp123', 'mfournier25'),
(56, 'Henry', 'Léna', '2023-05-12', '8 rue de la Loge 66000 Perpignan', 25, 'mdp123', 'lhenry25'),

(57, 'Dupuis', 'Nathan', '2020-04-18', '7 rue Espagne 64100 Bayonne', 26, 'mdp123', 'ndupuis26'),
(58, 'Blanc', 'Julie', '2022-10-03', '11 rue Port Neuf 64100 Bayonne', 26, 'mdp123', 'jblanc26'),

(59, 'Perrier', 'Alexandre', '2021-01-27', '9 place Clemenceau 64000 Pau', 27, 'mdp123', 'aperrier27'),
(60, 'Rousseau', 'Camille', '2023-07-19', '5 boulevard Pyrénées 64000 Pau', 27, 'mdp123', 'crousseau27'),

(61, 'Leroux', 'Lucas', '2020-09-14', '8 rue du Palais 17000 La Rochelle', 28, 'mdp123', 'lleroux28'),
(62, 'Baron', 'Emma', '2022-12-01', '10 rue du Port 17000 La Rochelle', 28, 'mdp123', 'ebaron28'),

(63, 'Masson', 'Hugo', '2021-06-06', '6 rue Michelet 42000 Saint-Étienne', 29, 'mdp123', 'hmasson29'),
(64, 'Gillet', 'Sarah', '2023-02-11', '9 rue Bergson 42000 Saint-Étienne', 29, 'mdp123', 'sgillet29'),

(65, 'Morin', 'Nicolas', '2020-03-19', '10 avenue Vauban 83000 Toulon', 30, 'mdp123', 'nmorin30'),
(66, 'Lambert', 'Chloé', '2022-07-23', '5 rue du Port 83000 Toulon', 30, 'mdp123', 'clambert30'),

(67, 'Dubois', 'Mathieu', '2021-10-01', '8 rue République 84000 Avignon', 31, 'mdp123', 'mdubois31'),
(68, 'Fontaine', 'Laura', '2023-03-14', '6 rue Horloge 84000 Avignon', 31, 'mdp123', 'lfontaine31'),

(69, 'Bertin', 'Julien', '2020-05-08', '10 boulevard de Genève 34500 Béziers', 32, 'mdp123', 'jbertin32'),
(70, 'Renault', 'Emma', '2022-11-16', '5 rue République 34500 Béziers', 32, 'mdp123', 'erenault32'),

(71, 'Girard', 'Lucas', '2021-08-25', '9 boulevard Victor Hugo 30000 Nîmes', 33, 'mdp123', 'lgirard33'),
(72, 'Meyer', 'Sarah', '2023-06-02', '6 rue Feuchères 30000 Nîmes', 33, 'mdp123', 'smeyer33'),

(73, 'Collet', 'Hugo', '2020-07-12', '10 rue Siam 29200 Brest', 34, 'mdp123', 'hcollet34'),
(74, 'Perrot', 'Clara', '2022-09-28', '5 rue Jean Jaurès 29200 Brest', 34, 'mdp123', 'cperrot34'),

(75, 'Marchand', 'Nicolas', '2021-04-04', '8 rue Kéréon 29000 Quimper', 35, 'mdp123', 'nmarchand35'),
(76, 'Dumas', 'Emma', '2023-01-20', '6 rue du Parc 29000 Quimper', 35, 'mdp123', 'edumas35'),

(77, 'Roux', 'Lucas', '2020-12-10', '10 cours Chazelles 56100 Lorient', 36, 'mdp123', 'lroux36'),
(78, 'Faure', 'Chloé', '2022-05-17', '5 rue du Port 56100 Lorient', 36, 'mdp123', 'cfaure36'),

(79, 'Pichon', 'Antoine', '2021-02-28', '8 rue Thiers 56000 Vannes', 37, 'mdp123', 'apichon37'),
(80, 'Lemoine', 'Sarah', '2023-09-09', '6 rue Gambetta 56000 Vannes', 37, 'mdp123', 'slemoine37'),

(81, 'Gauthier', 'Mathis', '2020-06-01', '10 rue de Boigne 73000 Chambéry', 38, 'mdp123', 'mgauthier38'),
(82, 'Roy', 'Emma', '2022-10-11', '5 rue Saint-Léger 73000 Chambéry', 38, 'mdp123', 'eroy38'),

(83, 'Henry', 'Lucas', '2021-03-15', '8 rue Carnot 74000 Annecy', 39, 'mdp123', 'lhenry39'),
(84, 'Leclerc', 'Chloé', '2023-07-21', '6 rue Royale 74000 Annecy', 39, 'mdp123', 'cleclerc39'),

(85, 'Moreau', 'Hugo', '2020-09-30', '10 avenue Sadi Carnot 26000 Valence', 40, 'mdp123', 'hmoreau40'),
(86, 'Simon', 'Emma', '2022-02-14', '5 rue Bancel 26000 Valence', 40, 'mdp123', 'esimon40'),

(87, 'Petit', 'Lucas', '2021-05-10', '10 rue Carnot 26000 Valence', 40, 'mdp123', 'lpetit40'),
(88, 'Giraud', 'Emma', '2023-08-22', '5 boulevard Bancel 26000 Valence', 40, 'mdp123', 'egiraud40'),

(89, 'Roche', 'Hugo', '2020-03-18', '8 rue Graham Bell 57070 Metz', 41, 'mdp123', 'hroche41'),
(90, 'Noel', 'Chloé', '2022-11-05', '6 rue Europe 57070 Metz', 41, 'mdp123', 'cnoel41'),

(91, 'Marin', 'Antoine', '2021-07-14', '10 boulevard Saint-Michel 75005 Paris', 42, 'mdp123', 'amarin42'),

(92, 'Lefort', 'Sarah', '2023-01-09', '10 rue Passy 75016 Paris', 44, 'mdp123', 'mdelaunay44'),
(93, 'Caron', 'Lucas', '2020-06-21', '8 rue Belleville 75020 Paris', 43, 'mdp123', 'lcaron43'),
(94, 'Benoit', 'Emma', '2022-09-30', '6 rue Ménilmontant 75020 Paris', 43, 'mdp123', 'ebenoit43'),

(95, 'Delaunay', 'Mathis', '2021-02-17', '10 rue Passy 75016 Paris', 44, 'mdp123', 'mdelaunay44'),
(96, 'Perret', 'Clara', '2023-06-11', '5 rue Auteuil 75016 Paris', 44, 'mdp123', 'cperret44'),

(97, 'Garnier', 'Nicolas', '2020-10-05', '8 avenue Parc 95000 Cergy', 45, 'mdp123', 'ngarnier45'),
(98, 'Lemoine', 'Sarah', '2022-03-19', '6 boulevard Oise 95000 Cergy', 45, 'mdp123', 'slemoine45'),

(99, 'Fabre', 'Hugo', '2021-11-28', '10 rue Essonne 91000 Évry', 46, 'mdp123', 'hfabre46'),
(100, 'Morel', 'Emma', '2023-04-07', '5 place Terrasses 91000 Évry', 46, 'mdp123', 'emorel46'),

(101, 'Schmitt', 'Lucas', '2020-02-13', '8 avenue Gaulle 94000 Créteil', 47, 'mdp123', 'lschmitt47'),
(102, 'Perrin', 'Chloé', '2022-08-25', '6 rue Paris 94000 Créteil', 47, 'mdp123', 'cperrin47'),

(103, 'Barre', 'Antoine', '2021-09-09', '10 parvis La Défense 92000 Nanterre', 48, 'mdp123', 'abarre48'),
(104, 'Rey', 'Emma', '2023-02-18', '5 rue Bouvets 92000 Nanterre', 48, 'mdp123', 'erey48'),

(105, 'Colas', 'Hugo', '2020-07-04', '8 rue Royale 78000 Versailles', 49, 'mdp123', 'hcolas49'),
(106, 'Gautier', 'Sarah', '2022-12-14', '6 rue Paroisse 78000 Versailles', 49, 'mdp123', 'sgautier49'),

(107, 'Poirier', 'Lucas', '2021-03-22', '10 rue Gros-Horloge 76000 Rouen', 50, 'mdp123', 'lpoirier50'),
(108, 'Roussel', 'Emma', '2023-05-29', '5 rue Jeanne d’Arc 76000 Rouen', 50, 'mdp123', 'eroussel50'),

(109, 'Marchal', 'Mathis', '2020-11-08', '8 rue Jaurès 87000 Limoges', 51, 'mdp123', 'mmarchal51'),
(110, 'Legrand', 'Chloé', '2022-06-16', '6 place Dussoubs 87000 Limoges', 51, 'mdp123', 'clegrand51'),

(111, 'Giroux', 'Nicolas', '2021-01-30', '10 rue Carnot 86000 Poitiers', 52, 'mdp123', 'ngiroux52'),
(112, 'Berthelot', 'Emma', '2023-07-12', '5 rue Magenta 86000 Poitiers', 52, 'mdp123', 'eberthelot52'),

(113, 'Renard', 'Hugo', '2020-04-25', '8 rue Victor Hugo 79000 Niort', 53, 'mdp123', 'hrenard53'),
(114, 'Lamy', 'Sarah', '2022-09-10', '6 rue Gare 79000 Niort', 53, 'mdp123', 'slamy53'),

(115, 'Blanchard', 'Lucas', '2021-12-01', '10 rue Moyenne 18000 Bourges', 54, 'mdp123', 'lblanchard54'),
(116, 'Fontaine', 'Emma', '2023-03-26', '5 place Cujas 18000 Bourges', 54, 'mdp123', 'efontaine54'),

(117, 'Dupuis', 'Mathis', '2020-08-19', '8 rue de Gaulle 28000 Chartres', 55, 'mdp123', 'mdupuis55'),
(118, 'Pichon', 'Chloé', '2022-11-23', '6 rue Changes 28000 Chartres', 55, 'mdp123', 'cpichon55'),

(119, 'Roy', 'Lucas', '2021-06-14', '10 rue Paris 89000 Auxerre', 56, 'mdp123', 'lroy56'),
(120, 'Boucher', 'Emma', '2023-09-05', '5 rue Liberté 89000 Auxerre', 56, 'mdp123', 'eboucher56'),

(121, 'Meunier', 'Hugo', '2020-05-02', '8 rue Marchands 68000 Colmar', 57, 'mdp123', 'hmeunier57'),
(122, 'Schneider', 'Sarah', '2022-10-18', '6 avenue République 68000 Colmar', 57, 'mdp123', 'sschneider57');

-- --------------------------------------------------------

--
-- Structure de la table `Gerant`
--

CREATE TABLE `Gerant` (
  `Matricule` int(11) NOT NULL,
  `NumTel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Gerant`
--

INSERT INTO `Gerant` (`Matricule`, `NumTel`) VALUES
(1, '0601000001'),
(4, '0601000002'),
(7, '0601000003'),
(9, '0601000004'),
(12, '0601000005'),
(14, '0601000006'),
(17, '0601000007'),
(19, '0601000008'),
(21, '0601000009'),
(23, '0601000010'),
(25, '0601000011'),
(27, '0601000012'),
(29, '0601000013'),
(31, '0601000014'),
(33, '0601000015'),
(35, '0601000016'),
(37, '0601000017'),
(39, '0601000018'),
(41, '0601000019'),
(43, '0601000020'),
(47, '0601000021'),
(49, '0601000022'),
(51, '0601000023'),
(53, '0601000024'),
(55, '0601000025'),
(57, '0601000026'),
(59, '0601000027'),
(61, '0601000028'),
(63, '0601000029'),
(65, '0601000030'),
(67, '0601000031'),
(69, '0601000032'),
(71, '0601000033'),
(73, '0601000034'),
(75, '0601000035'),
(77, '0601000036'),
(79, '0601000037'),
(81, '0601000038'),
(83, '0601000039'),
(85, '0601000040'),
(87, '0601000041'),
(89, '0601000042'),
(91, '0601000043'),
(93, '0601000044'),
(95, '0601000045'),
(97, '0601000046'),
(99, '0601000047'),
(101, '0601000048'),
(103, '0601000049'),
(105, '0601000050'),
(107, '0601000051'),
(109, '0601000052'),
(111, '0601000053'),
(113, '0601000054'),
(115, '0601000055'),
(117, '0601000056'),
(119, '0601000057'),
(121, '0601000058');

-- --------------------------------------------------------

--
-- Structure de la table `Intervention`
--

CREATE TABLE `Intervention` (
  `Id_Intervention` int(11) NOT NULL,
  `Date_` datetime DEFAULT NULL,
  `NumClient` int(11) NOT NULL,
  `Matricule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Intervention`
--


-- --------------------------------------------------------

--
-- Structure de la table `InterventionParMateriel`
--

CREATE TABLE `InterventionParMateriel` (
  `NumSerie` int(11) NOT NULL,
  `Id_Intervention` int(11) NOT NULL,
  `TempsIntervention` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `InterventionParMateriel`
--




-- --------------------------------------------------------

--
-- Structure de la table `Maintenir`
--

CREATE TABLE `Maintenir` (
  `NumSerie` int(11) NOT NULL,
  `NumContrat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Maintenir`
--




-- --------------------------------------------------------

--
-- Structure de la table `Matériel`
--

CREATE TABLE `Matériel` (
  `NumSerie` int(11) NOT NULL,
  `DateVente` date DEFAULT NULL,
  `DateInstallation` date DEFAULT NULL,
  `Prix` decimal(15,2) DEFAULT NULL,
  `Emplacement` varchar(50) DEFAULT NULL,
  `ReferenceInterne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Matériel`
--

INSERT INTO `Matériel` (`NumSerie`, `DateVente`, `DateInstallation`, `Prix`, `Emplacement`, `ReferenceInterne`) VALUES
(10001, '2023-01-10', '2023-01-15', 3200.00, 'Caisse principale', 100),
(10002, '2023-01-11', '2023-01-16', 3100.00, 'Comptoir encaissement', 100),
(10003, '2023-01-12', '2023-01-17', 850.00, 'Terminal CB comptoir', 400),
(10004, '2023-01-13', '2023-01-18', 2900.00, 'Comptoir vente', 100),
(10005, '2023-01-14', '2023-01-19', 2700.00, 'Accueil principal', 200),

(10006, '2023-01-15', '2023-01-20', 3200.00, 'Caisse multimédia', 200),
(10007, '2023-01-16', '2023-01-21', 3000.00, 'Caisse principale', 100),
(10008, '2023-01-17', '2023-01-22', 1200.00, 'Terminal CB comptoir', 400),
(10009, '2023-01-18', '2023-01-23', 2600.00, 'Accueil atelier', 200),
(10010, '2023-01-19', '2023-01-24', 2800.00, 'Comptoir vente', 100),

(10011, '2023-01-20', '2023-01-25', 3100.00, 'Caisse principale', 100),
(10012, '2023-01-21', '2023-01-26', 900.00, 'Terminal CB comptoir', 400),
(10013, '2023-01-22', '2023-01-27', 2700.00, 'Comptoir encaissement', 100),
(10014, '2023-01-23', '2023-01-28', 2500.00, 'Accueil principal', 200),
(10015, '2023-01-24', '2023-01-29', 3200.00, 'Caisse multimédia', 200),

(10016, '2023-01-25', '2023-01-30', 3000.00, 'Caisse principale', 100),
(10017, '2023-01-26', '2023-01-31', 850.00, 'Terminal CB comptoir', 400),
(10018, '2023-01-27', '2023-02-01', 2600.00, 'Accueil atelier', 200),
(10019, '2023-01-28', '2023-02-02', 2800.00, 'Comptoir vente', 100),
(10020, '2023-01-29', '2023-02-03', 3100.00, 'Caisse principale', 100),

(10021, '2023-01-30', '2023-02-04', 3200.00, 'Comptoir encaissement', 100),
(10022, '2023-01-31', '2023-02-05', 1200.00, 'Terminal CB comptoir', 400),
(10023, '2023-02-01', '2023-02-06', 2700.00, 'Accueil principal', 200),
(10024, '2023-02-02', '2023-02-07', 2500.00, 'Accueil atelier', 200),
(10025, '2023-02-03', '2023-02-08', 3000.00, 'Caisse multimédia', 200),

(10026, '2023-02-04', '2023-02-09', 3200.00, 'Caisse principale', 100),
(10027, '2023-02-05', '2023-02-10', 850.00, 'Terminal CB comptoir', 400),
(10028, '2023-02-06', '2023-02-11', 2600.00, 'Comptoir vente', 100),
(10029, '2023-02-07', '2023-02-12', 2800.00, 'Accueil principal', 200),
(10030, '2023-02-08', '2023-02-13', 3100.00, 'Caisse principale', 100),

(10031, '2023-02-09', '2023-02-14', 3200.00, 'Comptoir encaissement', 100),
(10032, '2023-02-10', '2023-02-15', 1200.00, 'Terminal CB comptoir', 400),
(10033, '2023-02-11', '2023-02-16', 2700.00, 'Accueil atelier', 200),
(10034, '2023-02-12', '2023-02-17', 2500.00, 'Accueil principal', 200),
(10035, '2023-02-13', '2023-02-18', 3000.00, 'Caisse multimédia', 200),

(10036, '2023-02-14', '2023-02-19', 3200.00, 'Caisse principale', 100),
(10037, '2023-02-15', '2023-02-20', 850.00, 'Terminal CB comptoir', 400),
(10038, '2023-02-16', '2023-02-21', 2600.00, 'Comptoir vente', 100),
(10039, '2023-02-17', '2023-02-22', 2800.00, 'Accueil atelier', 200),
(10040, '2023-02-18', '2023-02-23', 3100.00, 'Caisse principale', 100),

(10041, '2023-02-19', '2023-02-24', 3200.00, 'Comptoir encaissement', 100),
(10042, '2023-02-20', '2023-02-25', 1200.00, 'Terminal CB comptoir', 400),
(10043, '2023-02-21', '2023-02-26', 2700.00, 'Accueil principal', 200),
(10044, '2023-02-22', '2023-02-27', 2500.00, 'Accueil atelier', 200),
(10045, '2023-02-23', '2023-02-28', 3000.00, 'Caisse multimédia', 200),

(10046, '2023-02-24', '2023-03-01', 3200.00, 'Caisse principale', 100),
(10047, '2023-02-25', '2023-03-02', 850.00, 'Terminal CB comptoir', 400),
(10048, '2023-02-26', '2023-03-03', 2600.00, 'Comptoir vente', 100),
(10049, '2023-02-27', '2023-03-04', 2800.00, 'Accueil principal', 200),
(10050, '2023-02-28', '2023-03-05', 3100.00, 'Caisse principale', 100),
(10051, '2023-03-01', '2023-03-06', 3200.00, 'Zone encaissement rapide', 100),
(10052, '2023-03-02', '2023-03-07', 3100.00, 'Point de vente principal', 100),
(10053, '2023-03-03', '2023-03-08', 900.00, 'Terminal CB accueil', 400),
(10054, '2023-03-04', '2023-03-09', 2700.00, 'Comptoir service client', 100),
(10055, '2023-03-05', '2023-03-10', 2500.00, 'Accueil magasin', 200),

(10056, '2023-03-06', '2023-03-11', 3000.00, 'Zone caisse centrale', 100),
(10057, '2023-03-07', '2023-03-12', 3200.00, 'Caisse secondaire', 100),
(10058, '2023-03-08', '2023-03-13', 850.00, 'Terminal CB secondaire', 400),
(10059, '2023-03-09', '2023-03-14', 2600.00, 'Bureau accueil', 200),
(10060, '2023-03-10', '2023-03-15', 2800.00, 'Comptoir encaissement rapide', 100),

(10061, '2023-03-11', '2023-03-16', 3100.00, 'Zone paiement express', 100),
(10062, '2023-03-12', '2023-03-17', 1200.00, 'Terminal CB principal', 400),
(10063, '2023-03-13', '2023-03-18', 2700.00, 'Accueil technique', 200),
(10064, '2023-03-14', '2023-03-19', 2500.00, 'Espace accueil client', 200),
(10065, '2023-03-15', '2023-03-20', 3000.00, 'Zone caisse libre-service', 100),

(10066, '2023-03-16', '2023-03-21', 3200.00, 'Point encaissement', 100),
(10067, '2023-03-17', '2023-03-22', 850.00, 'Terminal CB portable', 400),
(10068, '2023-03-18', '2023-03-23', 2600.00, 'Comptoir vente rapide', 100),
(10069, '2023-03-19', '2023-03-24', 2800.00, 'Accueil service après-vente', 200),
(10070, '2023-03-20', '2023-03-25', 3100.00, 'Zone encaissement central', 100),

(10071, '2023-03-21', '2023-03-26', 3200.00, 'Caisse libre-service', 100),
(10072, '2023-03-22', '2023-03-27', 1200.00, 'Terminal CB libre-service', 400),
(10073, '2023-03-23', '2023-03-28', 2700.00, 'Accueil administratif', 200),
(10074, '2023-03-24', '2023-03-29', 2500.00, 'Zone accueil principal', 200),
(10075, '2023-03-25', '2023-03-30', 3000.00, 'Point paiement rapide', 100),

(10076, '2023-03-26', '2023-03-31', 3200.00, 'Zone caisse secondaire', 100),
(10077, '2023-03-27', '2023-04-01', 850.00, 'Terminal CB encaissement', 400),
(10078, '2023-03-28', '2023-04-02', 2600.00, 'Comptoir client', 100),
(10079, '2023-03-29', '2023-04-03', 2800.00, 'Accueil boutique', 200),
(10080, '2023-03-30', '2023-04-04', 3100.00, 'Zone paiement central', 100),

(10081, '2023-03-31', '2023-04-05', 3200.00, 'Caisse zone entrée', 100),
(10082, '2023-04-01', '2023-04-06', 1200.00, 'Terminal CB entrée', 400),
(10083, '2023-04-02', '2023-04-07', 2700.00, 'Accueil clients', 200),
(10084, '2023-04-03', '2023-04-08', 2500.00, 'Zone accueil secondaire', 200),
(10085, '2023-04-04', '2023-04-09', 3000.00, 'Point encaissement rapide', 100),

(10086, '2023-04-05', '2023-04-10', 3200.00, 'Zone caisse magasin', 100),
(10087, '2023-04-06', '2023-04-11', 850.00, 'Terminal CB magasin', 400),
(10088, '2023-04-07', '2023-04-12', 2600.00, 'Comptoir accueil client', 100),
(10089, '2023-04-08', '2023-04-13', 2800.00, 'Accueil service technique', 200),
(10090, '2023-04-09', '2023-04-14', 3100.00, 'Zone encaissement boutique', 100),

(10091, '2023-04-10', '2023-04-15', 3200.00, 'Caisse zone centrale', 100),
(10092, '2023-04-11', '2023-04-16', 1200.00, 'Terminal CB central', 400),
(10093, '2023-04-12', '2023-04-17', 2700.00, 'Accueil général', 200),
(10094, '2023-04-13', '2023-04-18', 2500.00, 'Zone accueil technique', 200),
(10095, '2023-04-14', '2023-04-19', 3000.00, 'Point paiement central', 100),

(10096, '2023-04-15', '2023-04-20', 3200.00, 'Zone caisse rapide', 100),
(10097, '2023-04-16', '2023-04-21', 850.00, 'Terminal CB rapide', 400),
(10098, '2023-04-17', '2023-04-22', 2600.00, 'Comptoir principal', 100),
(10099, '2023-04-18', '2023-04-23', 2800.00, 'Accueil secondaire', 200),
(10100, '2023-04-19', '2023-04-24', 3100.00, 'Zone encaissement général', 100);

-- --------------------------------------------------------

--
-- Structure de la table `Renouvellement`
--

CREATE TABLE `Renouvellement` (
  `Id_Renouvellement` int(11) NOT NULL,
  `Date_` datetime DEFAULT NULL,
  `NumContrat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Renouvellement`
--


-- --------------------------------------------------------

--
-- Structure de la table `Technicien`
--

CREATE TABLE `Technicien` (
  `Matricule` int(11) NOT NULL,
  `Qualification` varchar(50) DEFAULT NULL,
  `DateQualification` date DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `NumTel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Technicien`
--

INSERT INTO `Technicien` (`Matricule`, `Qualification`, `DateQualification`, `Email`, `NumTel`) VALUES
(2, 'Technicien caisse enregistreuse niveau 1', '2023-03-12', 'cbernard.tech@cashcash.fr', '0602000002'),
(3, 'Technicien maintenance POS', '2024-01-20', 'adubois.tech@cashcash.fr', '0602000003'),

(5, 'Technicien support encaissement', '2022-09-15', 'hrobert.tech@cashcash.fr', '0602000005'),
(6, 'Technicien système caisse magasin', '2024-02-10', 'erichard.tech@cashcash.fr', '0602000006'),

(8, 'Technicien POS retail', '2023-07-15', 'claurent.tech@cashcash.fr', '0602000008'),

(10, 'Technicien caisse électronique', '2022-04-25', 'lmichel.tech@cashcash.fr', '0602000010'),
(11, 'Technicien maintenance terminal paiement', '2024-05-30', 'jlefevre.tech@cashcash.fr', '0602000011'),

(13, 'Technicien matériel encaissement', '2021-08-20', 'troux.tech@cashcash.fr', '0602000013'),

(15, 'Technicien POS niveau 2', '2022-12-06', 'mgirard.tech@cashcash.fr', '0602000015'),
(16, 'Technicien caisse avancée', '2024-06-20', 'sbonnet.tech@cashcash.fr', '0602000016'),

(18, 'Technicien support caisse tactile', '2023-03-30', 'mlambert.tech@cashcash.fr', '0602000018'),

(20, 'Technicien maintenance POS', '2022-01-20', 'jrenaud.tech@cashcash.fr', '0602000020'),

(22, 'Technicien système encaissement', '2023-09-12', 'emasson.tech@cashcash.fr', '0602000022'),

(24, 'Technicien caisse magasin', '2022-07-16', 'lvidal.tech@cashcash.fr', '0602000024'),

(26, 'Technicien POS retail', '2023-05-20', 'egarnier.tech@cashcash.fr', '0602000026'),

(28, 'Technicien maintenance caisse', '2022-02-26', 'lmarchand.tech@cashcash.fr', '0602000028'),

(30, 'Technicien terminal encaissement', '2023-10-05', 'cperrot.tech@cashcash.fr', '0602000030'),

(32, 'Technicien support POS', '2022-08-15', 'sbarbier.tech@cashcash.fr', '0602000032'),

(34, 'Technicien caisse électronique', '2023-06-20', 'cmarchal.tech@cashcash.fr', '0602000034'),

(36, 'Technicien maintenance retail', '2022-03-15', 'elegrand.tech@cashcash.fr', '0602000036'),

(38, 'Technicien encaissement POS', '2023-01-18', 'lgirault.tech@cashcash.fr', '0602000038'),

(40, 'Technicien POS niveau 1', '2022-11-10', 'mdufour.tech@cashcash.fr', '0602000040'),

(42, 'Maintenance caisse niveau 1', '2024-04-27', 'egiraud@cashcash.fr', '0602000042'),
(44, 'Maintenance caisse niveau 2', '2023-09-09', 'cpoirier@cashcash.fr', '0602000044'),
(45, 'Maintenance TPV et scanner', '2022-10-10', 'ldelattre@cashcash.fr', '0602000045'),
(46, 'Maintenance caisse niveau 1', '2024-07-07', 'sboucher@cashcash.fr', '0602000046'),
(48, 'Maintenance logicielle caisse', '2024-06-18', 'cbazin21@cashcash.fr', '0602000048'),
(50, 'Maintenance matériel caisse', '2023-08-14', 'lmarchal22@cashcash.fr', '0602000050'),
(52, 'Maintenance caisse niveau 1', '2024-03-22', 'epicard23@cashcash.fr', '0602000052'),
(54, 'Maintenance TPV et scanner', '2023-01-15', 'scarre24@cashcash.fr', '0602000054'),
(56, 'Maintenance logiciel caisse', '2024-05-12', 'lhenry25@cashcash.fr', '0602000056'),
(58, 'Maintenance caisse niveau 2', '2023-10-03', 'jblanc26@cashcash.fr', '0602000058'),
(60, 'Maintenance matériel caisse', '2024-07-19', 'crousseau27@cashcash.fr', '0602000060'),
(62, 'Maintenance caisse niveau 1', '2023-12-01', 'ebaron28@cashcash.fr', '0602000062'),
(64, 'Maintenance TPV et scanner', '2024-02-11', 'sgillet29@cashcash.fr', '0602000064'),
(66, 'Maintenance logiciel caisse', '2023-07-23', 'clambert30@cashcash.fr', '0602000066'),
(68, 'Maintenance caisse niveau 2', '2024-03-14', 'lfontaine31@cashcash.fr', '0602000068'),
(70, 'Maintenance matériel caisse', '2023-11-16', 'erenault32@cashcash.fr', '0602000070'),
(72, 'Maintenance caisse niveau 1', '2024-06-02', 'smeyer33@cashcash.fr', '0602000072'),
(74, 'Maintenance TPV et scanner', '2023-09-28', 'cperrot34@cashcash.fr', '0602000074'),
(76, 'Maintenance logiciel caisse', '2024-01-20', 'edumas35@cashcash.fr', '0602000076'),
(78, 'Maintenance caisse niveau 2', '2023-05-17', 'cfaure36@cashcash.fr', '0602000078'),
(80, 'Maintenance matériel caisse', '2024-09-09', 'slemoine37@cashcash.fr', '0602000080'),
(82, 'Maintenance logiciel caisse', '2023-01-15', 'eroy38@techcaisse.fr', '0602000082'),
(84, 'Installation terminal paiement', '2023-09-01', 'cleclerc39@techcaisse.fr', '0602000084'),
(86, 'Maintenance matériel caisse', '2022-05-10', 'esimon40@techcaisse.fr', '0602000086'),
(88, 'Diagnostic panne caisse', '2023-10-12', 'egiraud40@techcaisse.fr', '0602000088'),
(90, 'Support logiciel POS', '2022-12-01', 'cnoel41@techcaisse.fr', '0602000090'),
(92, 'Maintenance réseau magasin', '2023-03-05', 'slefort42@techcaisse.fr', '0602000092'),
(94, 'Configuration caisse tactile', '2022-11-20', 'ebenoit43@techcaisse.fr', '0602000094'),
(96, 'Réparation imprimante ticket', '2023-07-18', 'cperret44@techcaisse.fr', '0602000096'),
(98, 'Support technique caisse', '2022-04-09', 'slemoine45@techcaisse.fr', '0602000098'),
(100, 'Maintenance système encaissement', '2023-06-22', 'emorel46@techcaisse.fr', '0602000100'),
(102, 'Installation logiciel caisse', '2022-09-14', 'cperrin47@techcaisse.fr', '0602000102'),
(104, 'Maintenance TPE', '2023-02-27', 'erey48@techcaisse.fr', '0602000104'),
(106, 'Diagnostic matériel POS', '2022-12-30', 'sgautier49@techcaisse.fr', '0602000106'),
(108, 'Support caisse magasin', '2023-08-11', 'eroussel50@techcaisse.fr', '0602000108'),
(110, 'Maintenance caisse automatique', '2022-07-06', 'clegrand51@techcaisse.fr', '0602000110'),
(112, 'Installation système caisse', '2023-09-25', 'eberthelot52@techcaisse.fr', '0602000112'),
(114, 'Support encaissement client', '2022-10-08', 'slamy53@techcaisse.fr', '0602000114'),
(116, 'Maintenance logiciel retail', '2023-04-14', 'efontaine54@techcaisse.fr', '0602000116'),
(118, 'Réparation terminal caisse', '2022-11-29', 'cpichon55@techcaisse.fr', '0602000118'),
(120, 'Support technique POS', '2023-10-01', 'eboucher56@techcaisse.fr', '0602000120');
-- --------------------------------------------------------

--
-- Structure de la table `Type`
--

CREATE TABLE `Type` (
  `ReferenceInterne` int(11) NOT NULL,
  `Libellé` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Type`
--

INSERT INTO `Type` (`ReferenceInterne`, `Libellé`) VALUES
(100, 'Imprimante ticket caisse'),
(200, 'Tiroir-caisse'),
(300, 'Afficheur client caisse'),
(400, 'Écran tactile TPV'),
(500, 'Unité centrale caisse'),
(600, 'Scanner code-barres caisse'),
(700, 'Terminal de paiement électronique (TPE)'),
(800, 'Caisse tactile tout-en-un'),
(900, 'Module NFC paiement'),
(1000, 'Lecteur carte magnétique'),
(1100, 'Imprimante ticket thermique intégrée'),
(1200, 'Système de caisse libre-service'),
(1300, 'Clavier programmable caisse'),
(1400, 'Balance intégrée caisse'),
(1500, 'Module connexion TPE'),
(1600, 'Carte électronique caisse');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `TypeEmployé`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `TypeEmployé` (
`Type` varchar(10)
,`Matricule` int(11)
);

-- --------------------------------------------------------

--
-- Structure de la vue `TypeEmployé`
--
DROP TABLE IF EXISTS `TypeEmployé`;

CREATE ALGORITHM=UNDEFINED DEFINER=`login5538`@`localhost` SQL SECURITY DEFINER VIEW `TypeEmployé`  AS SELECT 'gerant' AS `Type`, `Gerant`.`Matricule` AS `Matricule` FROM (`Gerant` join `Employé` on(`Gerant`.`Matricule` = `Employé`.`Matricule`))union select 'Technicien' AS `Technicien`,`Technicien`.`Matricule` AS `Matricule` from (`Technicien` join `Employé` on(`Technicien`.`Matricule` = `Employé`.`Matricule`))  ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Agence`
--
ALTER TABLE `Agence`
  ADD PRIMARY KEY (`Num_Agence`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`NumClient`),
  ADD KEY `Client_ibfk_1` (`Num_Agence`);

--
-- Index pour la table `Contrat_Maintenance`
--
ALTER TABLE `Contrat_Maintenance`
  ADD PRIMARY KEY (`NumContrat`),
  ADD KEY `Contrat_Maintenance_ibfk_1` (`NumClient`);

--
-- Index pour la table `Employé`
--
ALTER TABLE `Employé`
  ADD PRIMARY KEY (`Matricule`),
  ADD KEY `Num_Agence` (`Num_Agence`);

--
-- Index pour la table `Gerant`
--
ALTER TABLE `Gerant`
  ADD PRIMARY KEY (`Matricule`);

--
-- Index pour la table `Intervention`
--
ALTER TABLE `Intervention`
  ADD PRIMARY KEY (`Id_Intervention`),
  ADD KEY `Matricule` (`Matricule`),
  ADD KEY `Intervention_ibfk_1` (`NumClient`);

--
-- Index pour la table `InterventionParMateriel`
--
ALTER TABLE `InterventionParMateriel`
  ADD PRIMARY KEY (`NumSerie`,`Id_Intervention`),
  ADD KEY `InterventionParMateriel_ibfk_2` (`Id_Intervention`);

--
-- Index pour la table `Maintenir`
--
ALTER TABLE `Maintenir`
  ADD PRIMARY KEY (`NumSerie`,`NumContrat`),
  ADD KEY `NumContrat` (`NumContrat`);

--
-- Index pour la table `Matériel`
--
ALTER TABLE `Matériel`
  ADD PRIMARY KEY (`NumSerie`),
  ADD KEY `ReferenceInterne` (`ReferenceInterne`);

--
-- Index pour la table `Renouvellement`
--
ALTER TABLE `Renouvellement`
  ADD PRIMARY KEY (`Id_Renouvellement`),
  ADD KEY `NumContrat` (`NumContrat`);

--
-- Index pour la table `Technicien`
--
ALTER TABLE `Technicien`
  ADD PRIMARY KEY (`Matricule`);

--
-- Index pour la table `Type`
--
ALTER TABLE `Type`
  ADD PRIMARY KEY (`ReferenceInterne`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `NumClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=606;

--
-- AUTO_INCREMENT pour la table `Intervention`
--
ALTER TABLE `Intervention`
  MODIFY `Id_Intervention` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7006;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`Num_Agence`) REFERENCES `Agence` (`Num_Agence`);

--
-- Contraintes pour la table `Contrat_Maintenance`
--
ALTER TABLE `Contrat_Maintenance`
  ADD CONSTRAINT `Contrat_Maintenance_ibfk_1` FOREIGN KEY (`NumClient`) REFERENCES `Client` (`NumClient`);

--
-- Contraintes pour la table `Employé`
--
ALTER TABLE `Employé`
  ADD CONSTRAINT `Employé_ibfk_1` FOREIGN KEY (`Num_Agence`) REFERENCES `Agence` (`Num_Agence`);

--
-- Contraintes pour la table `Gerant`
--
ALTER TABLE `Gerant`
  ADD CONSTRAINT `Gerant_ibfk_1` FOREIGN KEY (`Matricule`) REFERENCES `Employé` (`Matricule`);

--
-- Contraintes pour la table `Intervention`
--
ALTER TABLE `Intervention`
  ADD CONSTRAINT `Intervention_ibfk_1` FOREIGN KEY (`NumClient`) REFERENCES `Client` (`NumClient`),
  ADD CONSTRAINT `Intervention_ibfk_2` FOREIGN KEY (`Matricule`) REFERENCES `Technicien` (`Matricule`);

--
-- Contraintes pour la table `InterventionParMateriel`
--
ALTER TABLE `InterventionParMateriel`
  ADD CONSTRAINT `InterventionParMateriel_ibfk_1` FOREIGN KEY (`NumSerie`) REFERENCES `Matériel` (`NumSerie`),
  ADD CONSTRAINT `InterventionParMateriel_ibfk_2` FOREIGN KEY (`Id_Intervention`) REFERENCES `Intervention` (`Id_Intervention`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Maintenir`
--
ALTER TABLE `Maintenir`
  ADD CONSTRAINT `Maintenir_ibfk_1` FOREIGN KEY (`NumSerie`) REFERENCES `Matériel` (`NumSerie`),
  ADD CONSTRAINT `Maintenir_ibfk_2` FOREIGN KEY (`NumContrat`) REFERENCES `Contrat_Maintenance` (`NumContrat`);

--
-- Contraintes pour la table `Matériel`
--
ALTER TABLE `Matériel`
  ADD CONSTRAINT `Matériel_ibfk_1` FOREIGN KEY (`ReferenceInterne`) REFERENCES `Type` (`ReferenceInterne`);

--
-- Contraintes pour la table `Renouvellement`
--
ALTER TABLE `Renouvellement`
  ADD CONSTRAINT `Renouvellement_ibfk_1` FOREIGN KEY (`NumContrat`) REFERENCES `Contrat_Maintenance` (`NumContrat`);

--
-- Contraintes pour la table `Technicien`
--
ALTER TABLE `Technicien`
  ADD CONSTRAINT `Technicien_ibfk_1` FOREIGN KEY (`Matricule`) REFERENCES `Employé` (`Matricule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
