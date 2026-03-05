# Lösungen: Insert

**1. Setzen Sie diese Aufgabe um:**

a. Legen Sie mit der Kurzform einen Kunden mit folgenden Daten an: Heinrich Schmitt aus Zürich, Schweiz (Schweiz hat die land_id 2).
```sql
INSERT INTO kunden VALUES (NULL, 'Heinrich', 'Schmitt', 2, 'Zürich');
```

b. Legen Sie mit der Kurzform eine Kundin mit folgenden Daten an: Sabine Müller aus Bern, Schweiz (Schweiz hat die land_id 2).
```sql
INSERT INTO kunden VALUES (NULL, 'Sabine', 'Müller', 2, 'Bern');
```

c. Legen Sie mit der Kurzform einen Kunden mit folgenden Daten an: Markus Mustermann aus Wien, Österreich (Österreich hat die land_id 1).
```sql
INSERT INTO kunden VALUES (NULL, 'Markus', 'Mustermann', 1, 'Wien');
```

d. Legen Sie mit der Langform einen Kunden mit folgenden Daten an: Herr Maier.
```sql
INSERT INTO kunden (nachname) VALUES ('Maier');
```

e. Legen Sie mit der Langform einen Kunden mit folgenden Daten an: Herr Bulgur aus Sirnach.
```sql
INSERT INTO kunden (nachname, wohnort) VALUES ('Bulgur', 'Sirnach');
```

f. Legen Sie mit der Langform einen Kunden mit folgenden Daten an: Maria Manta.
```sql
INSERT INTO kunden (vorname, nachname) VALUES ('Maria', 'Manta');
```

---

**2. Fehlerkorrektur:**

a. `INSERT INTO (nachname...` --> Tabellenname fehlt.
**Korrektur:** `INSERT INTO kunden (nachname, wohnort, land_id) VALUES ('Fesenkampp', 'Duisburg', 3);` *(Zusätzlich Bindestrich bei Duis-burg entfernt, falls es ein Tippfehler war, aber der Hauptfehler ist der fehlende Tabellenname)*

b. `INSERT INTO kunden ('vorname')` --> Spaltenname darf nicht in einfachen Anführungszeichen stehen.
**Korrektur:** `INSERT INTO kunden (vorname) VALUES ('Herbert');`

c. `'Deutschland'` ist ein String, aber `land_id` ist INT.
**Korrektur:** `INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 3);` *(Hier eine fiktive ID für Deutschland genommen)*

d. Kurzform verlangt, dass alle Felder bedient werden, und Strings müssen gültig sein.
**Korrektur:** `INSERT INTO kunden VALUES (NULL, 'Brunhild', 'Sulcher', 1, 'Süderstade');`

e. Kurzform, aber `kunde_id` fehlt.
**Korrektur:** `INSERT INTO kunden VALUES (NULL, 'Jochen', 'Schmied', 2, 'Solingen');`

f. Gleiches Problem wie oben, und falsche Datentypen für `kunde_id` und `wohnort`.
**Korrektur:** `INSERT INTO kunden VALUES (NULL, 'Doppelbrecher', '', 2, NULL);` *(Je nachdem welche Felder erlaubt sind)*

g. Es wurden vier Spaltennamen, aber nur vier Werte angegeben? Nein, in der Vorgabe stehen drei Spaltennamen `(nachname, wohnort, land_id)`, aber vier Werte `('Christoph', 'Fesenkampp', 'Duisburg', 3)`. Ein Spaltenname fehlt.
**Korrektur:** `INSERT INTO kunden (vorname, nachname, wohnort, land_id) VALUES ('Christoph', 'Fesenkampp', 'Duisburg', 3);`

h. *(Kein Syntaxfehler, vorausgesetzt nicht-NULL Spalten existieren nicht.)*
`INSERT INTO kunden (vorname) VALUES ('Herbert');` funktioniert, wenn alle anderen Spalten NULL sein dürfen.

i. String-Werte fehlen Anführungszeichen.
**Korrektur:** `INSERT INTO kunden (nachname, vorname, wohnort, land_id) VALUES ('Schulter', 'Albert', 'Duisburg', 1);`

j. `VALUE` statt `VALUES`. `""` (doppelte Anführungszeichen) verwendet man in SQL besser als `''` (einfache). Und wieder fehlt NULL/ID.
**Korrektur:** `INSERT INTO kunden VALUES (NULL, 'Brunhild', 'Sulcher', 1, 'Süderstade');`

k. `VALUE` statt `VALUES`. Wieder fehlt NULL für ID und Solingen ist nicht in `''` gesetzt.
**Korrektur:** `INSERT INTO kunden VALUES (NULL, 'Jochen', 'Schmied', 2, 'Solingen');`
