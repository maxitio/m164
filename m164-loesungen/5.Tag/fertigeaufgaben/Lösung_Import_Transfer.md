# Lösung: Daten einfügen und übertragen (Tag 5 & Tag 6)

## Tag 5: INSERT INTO ... SELECT
Wenn man Rohdaten aus einer unnormalisierten Tabelle (z.B. einer flachen CSV-Export Tabelle `tbl_Adr`) in eine saubere, normalisierte Struktur überführen möchte, verwendet man am besten den Befehl `INSERT INTO ... SELECT`.

**Beispiel: Übertragen in `tbl_Person` und `tbl_Ort`**
```sql
-- Schritt 1: Orte aus der flachen Tabelle extrahieren und anlegen (Redundanzen durch DISTINCT filtern)
INSERT INTO tbl_Ort (plz, name)
SELECT DISTINCT plz, ort 
FROM tbl_Adr;

-- Schritt 2: Personen übertragen und über einen JOIN die korrekte neue ort_id holen
INSERT INTO tbl_Person (vorname, nachname, ort_id)
SELECT a.vorname, a.nachname, o.id
FROM tbl_Adr a
JOIN tbl_Ort o ON a.plz = o.plz AND a.ort = o.name;
```
*(Wichtig: Bevor solche Abhängigkeiten eingefügt werden, muss die Stammdaten-Tabelle (`tbl_Ort`) gefüllt sein, da andernfalls Foreign-Key-Konflikte (Constraints) auftreten.)*

---

## Tag 6: Bulkimport (LOAD DATA INFILE)
Der `LOAD DATA LOCAL INFILE` Befehl ist der schnellste Weg, um CSV-Werte in eine MySQL/MariaDB Tabelle zu importieren.

### Typischer Befehl und dessen Bedeutung
```sql
LOAD DATA LOCAL INFILE 'C:/M164/import.csv'
REPLACE
INTO TABLE tbl_Beispiel
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ID_Beispiel, Name, @GD, Zahl, FS)
SET Geb_Datum = STR_TO_DATE(@GD, '%d.%m.%Y');
```

**Erklärung wichtiger Bestandteile:**
1. **`LOCAL`**: signalisiert, dass die Datei vom Rechner des Clients gelesen wird und nicht direkt aus dem Datenverzeichnis des Datenbank-Servers. Dies erfordert Sicherheitsfreigaben (`local_infile=1`).
2. **`REPLACE`**: Falls ein Datensatz mit einem bereits existierenden Primärschlüssel hochgeladen wird, überschreibt die CSV-Zeile den alten Datenbank-Eintrag. (Alternativ: `IGNORE`, um bestehende zu erhalten).
3. **`CHARACTER SET utf8mb4`**: Verhindert Zeichensalat bei Sonderzeichen / Umlauten (wie "ö", "ä"), wenn die CSV-Datei in UTF-8 gespeichert wurde.
4. **`IGNORE 1 ROWS`**: Überspringt in der CSV-Datei die erste Zeile. Nützlich, wenn die CSV-Datei Spaltennamen als Kopfzeile enthält.
5. **`(ID_Beispiel, Name, @GD, ...)`**: Definiert, in welche Datenbank-Spalten die CSV-Werte fließen sollen. Das `@GD` ist eine temporäre Variable, die man später unter `SET` umformatieren kann, z.B. wenn das Datum im falschen Format (`31.12.2023` statt `2023-12-31`) angereist kommt.
