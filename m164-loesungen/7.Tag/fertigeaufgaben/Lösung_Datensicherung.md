# Lösungen: Datensicherung

## Aufgabe 1: Logisches Backup erstellen
*(Diese Aufgabe beinhaltet primär die Ausführung von Befehlen auf dem eigenen System (z.B. über `mysqldump` oder via Docker/XAMPP). Das resultierende Backup-File liegt in dem Fall lokal unter z.B. `C:\BACKUP\tp_dump.sql` oder `c:\db_backup\tourenplaner_backup.sql`.)*

## Aufgabe 2: Backup-File analysieren und verifizieren
**1. Was finden Sie vor? Beschreiben Sie ihn.**
Man findet in der Regel eine reine Textdatei vor. Sie enthält DDL-Befehle (Data Definition Language) wie `CREATE TABLE` und `DROP TABLE` zum Erstellen der Struktur, sowie DML-Befehle (Data Manipulation Language) wie jede Menge `INSERT INTO` Anweisungen, um die Tabellen wieder mit den exakten Daten zu befüllen. Zudem sind oft Kommentare zu Versionsinformationen und Konfigurationseinstellungen (Zeichensatz etc.) enthalten.

**2. Überprüfen Sie ihr Dump-File (Restore)**
*Befehle zum Testen:*
```sql
DROP DATABASE tourenplaner;
CREATE DATABASE tourenplaner;
USE tourenplaner;
SOURCE C:\pfad\zu\deinem\backup\tourenplaner_backup.sql;
```

## Aufgabe 3: Backup Strategien
**(Basierend auf der MySQL Dokumentation)**

**1. a. Welchen Backup haben wir in Aufgabe 1 erstellt?**
Ein **Logisches Backup** (Logical Backup). Dabei wird die Struktur (CREATE-Statements) und die Daten (INSERT-Statements) als SQL-Skript exportiert.

**b. Welche Nachteile hat dieses Backup?**
*   Es dauert tendenziell länger beim Erstellen und vor allem beim Wiederherstellen (Restore), da alle SQL-Statements vom Server einzeln neu abgearbeitet werden müssen.
*   Es beansprucht mehr CPU-Ressourcen.
*   Es ist meist nicht sinnvoll für extrem große Datenbanken (viele Gigabyte).

**2. Was ist der Unterschied zwischen online- und offline Backups?**
*   **Online Backup (Hot Backup):** Die Datenbank bleibt während des Backups aktiv und erreichbar für schreibende und lesende Zugriffe (Clients werden nicht getrennt).
*   **Offline Backup (Cold Backup):** Der Datenbank-Server wird gestoppt, um die physischen Dateien sicher und ohne Veränderungen (Inkonsistenzen) kopieren zu können. Clients haben in dieser Zeit keinen Zugriff.

**3. Was ist ein «snapshot Backup»?**
Ein Snapshot-Backup ist ein Backup-Verfahren auf File-System- oder Storage-Ebene. Anstatt die Datenbank über SQL-Befehle auszulesen, nutzt man Fähigkeiten des Speichersystems (z.B. LVM auf Linux oder ZFS), um in Bruchteilen von Sekunden einen "Einfrier-Zustand" des gesamten Dateisystems zu erzeugen. Von diesem Momentan-Zustand aus können dann die physischen Datenbank-Dateien in Sicherheit kopiert werden, während die Datenbank sofort wieder normal weiterlaufen kann. 

## Aufgabe 4: Physisches Backup
*(Die genauen Befehle hängen von der Umgebung ab, hier die theoretischen Antworten nach Mariabackup-Manual)*

*   **Wozu muss die Backupdatenstruktur vor einem Restore "vorbereitet" (prepare) werden?**
    Beim Erstellen eines physischen Hot-Backups können Daten noch inkonsistent sein, weil während dem Kopiervorgang Transaktionen liefen. Beim `prepare`-Schritt werden die Transaktions-Logs (Redo-Logs) auf die gesicherten Daten angewendet (Recovery), um einen zu 100% konsistenten Zustand herzustellen, bevor sie wieder in den Server integriert werden.
*   **Wie heißt der Parameter, um ein Restore zu machen?**
    Oft `--copy-back` (kopiert Dateien zurück) oder `--move-back`.
*   **Ist ein inkrementelles und differentielles Backup möglich? Wenn ja, wie?**
    Ja. Bei einem inkrementellen/differentiellen Backup gibt man als Ziel einen neuen Backup-Ordner an und referenziert mit `--incremental-basedir` den Ordner des vorherigen Full-Backups (oder des letzten inkrementellen Backups). So werden nur Blöcke gesichert, die sich seit diesem Basis-Backup geändert haben.
