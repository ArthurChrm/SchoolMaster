-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour schoolmaster
DROP DATABASE IF EXISTS `schoolmaster`;
CREATE DATABASE IF NOT EXISTS `schoolmaster` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `schoolmaster`;

-- Listage de la structure de la table schoolmaster. classes
DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `niveau_classe` varchar(50) NOT NULL,
  PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.classes : ~5 rows (environ)
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
REPLACE INTO `classes` (`id_classe`, `niveau_classe`) VALUES
	(1, 'CP'),
	(2, 'CE1'),
	(3, 'CE2'),
	(4, 'CM1'),
	(5, 'CM2');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. cours
DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` int(11) NOT NULL AUTO_INCREMENT,
  `debut_cours` datetime NOT NULL,
  `fin_cours` datetime NOT NULL,
  `intitule_cours` varchar(50) NOT NULL,
  `id_salle` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `COURS_SALLES_FK` (`id_salle`),
  KEY `COURS_CLASSES0_FK` (`id_classe`),
  CONSTRAINT `COURS_CLASSES0_FK` FOREIGN KEY (`id_classe`) REFERENCES `classes` (`id_classe`),
  CONSTRAINT `COURS_SALLES_FK` FOREIGN KEY (`id_salle`) REFERENCES `salles` (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.cours : ~2 rows (environ)
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
REPLACE INTO `cours` (`id_cours`, `debut_cours`, `fin_cours`, `intitule_cours`, `id_salle`, `id_classe`) VALUES
	(4, '2020-08-28 00:00:00', '2020-08-28 00:00:00', 'Histoire', 1, 1),
	(5, '2020-08-28 00:00:00', '2020-08-28 00:00:00', 'Géo', 1, 2);
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. cours_materiel
DROP TABLE IF EXISTS `cours_materiel`;
CREATE TABLE IF NOT EXISTS `cours_materiel` (
  `id_materiel` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL,
  PRIMARY KEY (`id_materiel`,`id_cours`),
  KEY `COURS_MATERIEL_COURS0_FK` (`id_cours`),
  CONSTRAINT `COURS_MATERIEL_COURS0_FK` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`),
  CONSTRAINT `COURS_MATERIEL_MATERIEL_FK` FOREIGN KEY (`id_materiel`) REFERENCES `materiel` (`id_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.cours_materiel : ~0 rows (environ)
/*!40000 ALTER TABLE `cours_materiel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cours_materiel` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. emprunts
DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE IF NOT EXISTS `emprunts` (
  `id_emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `isbn_emprunt` int(11) NOT NULL,
  `debut_emprunt` datetime NOT NULL,
  `fin_emprunt` datetime NOT NULL,
  `rendu_emprunt` tinyint(1) NOT NULL,
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_emprunt`),
  KEY `EMPRUNTS_PERSONNES_FK` (`id_personne`),
  CONSTRAINT `EMPRUNTS_PERSONNES_FK` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.emprunts : ~0 rows (environ)
/*!40000 ALTER TABLE `emprunts` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprunts` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. materiel
DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `id_materiel` int(11) NOT NULL AUTO_INCREMENT,
  `nom_materiel` varchar(50) NOT NULL,
  PRIMARY KEY (`id_materiel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.materiel : ~3 rows (environ)
/*!40000 ALTER TABLE `materiel` DISABLE KEYS */;
REPLACE INTO `materiel` (`id_materiel`, `nom_materiel`) VALUES
	(1, 'Vidéoprojecteur'),
	(2, 'Matériel de cuisine'),
	(3, 'Tableau amovible');
/*!40000 ALTER TABLE `materiel` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. notes
DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `valeur_note` float NOT NULL,
  `description_note` varchar(50) NOT NULL,
  `id_personne` int(11) NOT NULL,
  PRIMARY KEY (`id_note`),
  KEY `NOTES_PERSONNES_FK` (`id_personne`),
  CONSTRAINT `NOTES_PERSONNES_FK` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.notes : ~4 rows (environ)
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
REPLACE INTO `notes` (`id_note`, `valeur_note`, `description_note`, `id_personne`) VALUES
	(2, 20, 'Mathématiques', 3),
	(3, 15, 'Histoire', 3),
	(4, 17, 'Géographie', 4),
	(5, 19, 'Mathématiques', 5);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. personnes
DROP TABLE IF EXISTS `personnes`;
CREATE TABLE IF NOT EXISTS `personnes` (
  `id_personne` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(50) NOT NULL,
  `prenom_personne` varchar(50) NOT NULL,
  `login_personne` varchar(50) NOT NULL,
  `hash_personne` varchar(100) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_classe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `PERSONNES_ROLES_FK` (`id_role`),
  KEY `PERSONNES_CLASSES0_FK` (`id_classe`),
  CONSTRAINT `PERSONNES_CLASSES0_FK` FOREIGN KEY (`id_classe`) REFERENCES `classes` (`id_classe`),
  CONSTRAINT `PERSONNES_ROLES_FK` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.personnes : ~5 rows (environ)
/*!40000 ALTER TABLE `personnes` DISABLE KEYS */;
REPLACE INTO `personnes` (`id_personne`, `nom_personne`, `prenom_personne`, `login_personne`, `hash_personne`, `id_role`, `id_classe`) VALUES
	(1, 'PIERRE', 'Jean', 'pierre.jean', 'zxFYRBXwfJCWo621exB93Dkz62tEbwAOBXWd+cZgB+4=$eFznUIN9hFZxc5t73zUNnx+bdFA5dmyau/tcTnm61Do=', 2, NULL),
	(2, 'POUPELIN', 'Alexis', 'poupelin.alexis', 'zxFYRBXwfJCWo621exB93Dkz62tEbwAOBXWd+cZgB+4=$eFznUIN9hFZxc5t73zUNnx+bdFA5dmyau/tcTnm61Do=', 1, NULL),
	(3, 'CHERAMY', 'Arthur', 'cheramy.arthur', '31linEri0cNt7TGWMJDj4A9REBdzKE93+vcYFDYP97s=$yAS95nV0RwqigOW5e8QArnZqeILzCzGpQjXLDUDEp+0=', 4, 1),
	(4, 'CORGNIARD', 'Antoine', 'corgniard.antoine', 'fgYrLQqzK/0KbnrexHt9UGWfXj4L/wBe1xJWq34xBAQ=$2mlpds4yjwQKLdOXoRs6mbxJihm1oV/rMmNFsxGCeFM=', 4, 3),
	(5, 'DAVID', 'Théo', 'david.théo', 'UQ+inCJ6S92hX2CLkLGDg8kO0zQWCwum65PLKkgAWLs=$0Gxqut7gQK6vyWyqz5SMY9RX7U9JWAG7c2fFEBfjRtg=', 4, 4);
/*!40000 ALTER TABLE `personnes` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. presences
DROP TABLE IF EXISTS `presences`;
CREATE TABLE IF NOT EXISTS `presences` (
  `id_cours` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL,
  `present_presence` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_cours`,`id_personne`),
  KEY `PRESENCES_PERSONNES0_FK` (`id_personne`),
  CONSTRAINT `PRESENCES_COURS_FK` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`),
  CONSTRAINT `PRESENCES_PERSONNES0_FK` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.presences : ~1 rows (environ)
/*!40000 ALTER TABLE `presences` DISABLE KEYS */;
REPLACE INTO `presences` (`id_cours`, `id_personne`, `present_presence`) VALUES
	(4, 3, 1);
/*!40000 ALTER TABLE `presences` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(50) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.roles : ~4 rows (environ)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id_role`, `nom_role`) VALUES
	(1, 'ADMIN'),
	(2, 'DIRECTEUR'),
	(3, 'PROF'),
	(4, 'ELEVE');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Listage de la structure de la table schoolmaster. salles
DROP TABLE IF EXISTS `salles`;
CREATE TABLE IF NOT EXISTS `salles` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `nom_salle` varchar(50) NOT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table schoolmaster.salles : ~5 rows (environ)
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
REPLACE INTO `salles` (`id_salle`, `nom_salle`) VALUES
	(1, 'Salle de sport'),
	(2, 'Cours n°1'),
	(3, 'Cours n°2'),
	(4, 'Cours n°3'),
	(5, 'Cours n°4');
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
