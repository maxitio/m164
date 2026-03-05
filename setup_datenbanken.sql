-- =================================================================================
-- m164 - Beispiel-Datenbanken Setup-Skript
-- Dieses Skript generiert die Datenbanken, Tabellen und Beispieldaten, die für die 
-- Lösungsbeispiele (Tage 1 bis 7) verwendet werden.
-- Führe dieses Skript z.B. in phpMyAdmin oder MySQL Workbench einmalig aus.
-- =================================================================================

-- --------------------------------------------------------
-- 1. TOURENPLANER DATENBANK (Tag 1, 2, 3)
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `tourenplaner`;
USE `tourenplaner`;

CREATE TABLE IF NOT EXISTS `tbl_mitarbeiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `telefonnummer` varchar(20) DEFAULT NULL,
  `geburtsdatum` date DEFAULT NULL,
  `vorgesetzter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`vorgesetzter_id`) REFERENCES `tbl_mitarbeiter`(`id`)
);

CREATE TABLE IF NOT EXISTS `tbl_fahrer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mitarbeiter_id` int(11) NOT NULL,
  `fuehrerschein_klasse` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`mitarbeiter_id`) REFERENCES `tbl_mitarbeiter`(`id`)
);

CREATE TABLE IF NOT EXISTS `tbl_disponent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mitarbeiter_id` int(11) NOT NULL,
  `abteilung` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`mitarbeiter_id`) REFERENCES `tbl_mitarbeiter`(`id`)
);

CREATE TABLE IF NOT EXISTS `tbl_fahrzeug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kennzeichen` varchar(20) NOT NULL,
  `sitzplaetze` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tbl_ort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `plz` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `tbl_fahrt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `fahrzeug_id` int(11) NOT NULL,
  `disponent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`fahrzeug_id`) REFERENCES `tbl_fahrzeug`(`id`),
  FOREIGN KEY (`disponent_id`) REFERENCES `tbl_disponent`(`id`)
);

CREATE TABLE IF NOT EXISTS `tbl_station` (
  `fahrt_id` int(11) NOT NULL,
  `ort_id` int(11) NOT NULL,
  `reihenfolge` int(11) NOT NULL,
  `ankunft` datetime DEFAULT NULL,
  `abfahrt` datetime DEFAULT NULL,
  `fahrer_id` int(11) NOT NULL,
  PRIMARY KEY (`fahrt_id`, `ort_id`),
  FOREIGN KEY (`fahrt_id`) REFERENCES `tbl_fahrt`(`id`),
  FOREIGN KEY (`ort_id`) REFERENCES `tbl_ort`(`id`),
  FOREIGN KEY (`fahrer_id`) REFERENCES `tbl_fahrer`(`id`)
);

-- Beispieldaten Tourenplaner
INSERT INTO `tbl_mitarbeiter` (`vorname`, `nachname`, `vorgesetzter_id`) VALUES ('Hans', 'Müller', NULL), ('Peter', 'Meier', 1), ('Anna', 'Schmidt', 1);
INSERT INTO `tbl_fahrer` (`mitarbeiter_id`, `fuehrerschein_klasse`) VALUES (2, 'D'), (3, 'D');
INSERT INTO `tbl_disponent` (`mitarbeiter_id`, `abteilung`) VALUES (1, 'Zentrale');
INSERT INTO `tbl_fahrzeug` (`kennzeichen`, `sitzplaetze`) VALUES ('ZH 12345', 50), ('BE 98765', 30);
INSERT INTO `tbl_ort` (`name`, `plz`) VALUES ('Zürich', '8000'), ('Bern', '3000'), ('Basel', '4000');


-- --------------------------------------------------------
-- 2. BUCHLADEN DATENBANK (Tag 4, 6)
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `buchladenDatenbank`;
USE `buchladenDatenbank`;

CREATE TABLE IF NOT EXISTS `verlag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `ort` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `lieferant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `ort` varchar(100) DEFAULT NULL,
  `plz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `sparte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `buch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titel` varchar(200) NOT NULL,
  `erscheinungsjahr` int(11) DEFAULT NULL,
  `verlag_id` int(11) DEFAULT NULL,
  `lieferant_id` int(11) DEFAULT NULL,
  `sparte_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`verlag_id`) REFERENCES `verlag`(`id`),
  FOREIGN KEY (`lieferant_id`) REFERENCES `lieferant`(`id`),
  FOREIGN KEY (`sparte_id`) REFERENCES `sparte`(`id`)
);

CREATE TABLE IF NOT EXISTS `buch_autor` (
  `buch_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  PRIMARY KEY (`buch_id`, `autor_id`),
  FOREIGN KEY (`buch_id`) REFERENCES `buch`(`id`),
  FOREIGN KEY (`autor_id`) REFERENCES `autor`(`id`)
);

-- Beispieldaten Buchladen
INSERT INTO `verlag` (`name`, `ort`) VALUES ('Rheinwerk', 'Bonn'), ('OReilly', 'Sebastopol');
INSERT INTO `lieferant` (`name`, `ort`, `plz`) VALUES ('Buchlogistik GmbH', 'Freiburg', 79098), ('FastBook', 'Berlin', 10115);
INSERT INTO `sparte` (`bezeichnung`) VALUES ('Informatik'), ('Roman');
INSERT INTO `autor` (`vorname`, `nachname`) VALUES ('John', 'Doe'), ('Jane', 'Smith');
INSERT INTO `buch` (`titel`, `erscheinungsjahr`, `verlag_id`, `lieferant_id`, `sparte_id`) VALUES ('SQL für Anfänger', 2022, 1, 1, 1), ('Der weite Weg', 2021, 2, 2, 2);
INSERT INTO `buch_autor` (`buch_id`, `autor_id`) VALUES (1, 1), (2, 2);


-- --------------------------------------------------------
-- 3. SCHULE DATENBANK (Tag 5, 8)
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `schuleDatenbank`;
USE `schuleDatenbank`;

CREATE TABLE IF NOT EXISTS `ort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `plz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `schueler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nationalitaet` varchar(50) DEFAULT NULL,
  `ort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`ort_id`) REFERENCES `ort`(`id`)
);

CREATE TABLE IF NOT EXISTS `lehrer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gehalt` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `noten` (
  `schueler_id` int(11) NOT NULL,
  `deutsch` decimal(3,2) DEFAULT NULL,
  `mathe` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`schueler_id`),
  FOREIGN KEY (`schueler_id`) REFERENCES `schueler`(`id`)
);

-- Beispieldaten Schule
INSERT INTO `ort` (`name`, `plz`) VALUES ('Basel', 4000), ('Liestal', 4410);
INSERT INTO `schueler` (`name`, `nationalitaet`, `ort_id`) VALUES ('Max Mustermann', 'CH', 1), ('Erika Musterfrau', 'DE', 2);
INSERT INTO `lehrer` (`name`, `gehalt`) VALUES ('Herr Müller', 6500.00), ('Frau Meier', 7200.00);
INSERT INTO `noten` (`schueler_id`, `deutsch`, `mathe`) VALUES (1, 4.5, 5.0), (2, 5.5, 4.0);


-- --------------------------------------------------------
-- 4. KUNDEN DATENBANK (Tag 4)
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS `kundenDatenbank`;
USE `kundenDatenbank`;

CREATE TABLE IF NOT EXISTS `kunden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `ort` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `bestellungen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kunden_id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `betrag` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`kunden_id`) REFERENCES `kunden`(`id`)
);

-- Beispieldaten Kunden
INSERT INTO `kunden` (`vorname`, `nachname`, `ort`) VALUES ('Hans', 'Meier', 'Zürich'), ('Petra', 'Müller', 'Bern');
INSERT INTO `bestellungen` (`kunden_id`, `datum`, `betrag`) VALUES (1, '2023-10-01', 150.50), (1, '2023-10-15', 75.00), (2, '2023-10-05', 200.00);
