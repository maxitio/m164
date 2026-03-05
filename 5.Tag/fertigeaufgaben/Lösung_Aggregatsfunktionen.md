# Lösungen: Aggregatsfunktionen

**(Hinweis: Da das genaue Schema von `uebungSchuleDB` nicht explizit im Text steht, wurden hier allgemeingültige Tabellen- und Spaltennamen wie `lehrer`, `schueler`, `ort` mit plausiblen Attributen wie `gehalt`, `note`, `einwohner` usw. angenommen.)**

1. Welches ist das niedrigste/höchste Gehalt eines Lehrers?
```sql
SELECT MIN(gehalt) AS Niedrigstes_Gehalt, MAX(gehalt) AS Hoechstes_Gehalt 
FROM lehrer;
```

2. Was ist das niedrigste Gehalt, das einer unserer Mathelehrer bekommt?
```sql
SELECT MIN(l.gehalt) AS Niedrigstes_Mathe_Gehalt 
FROM lehrer l
JOIN fach f ON l.fach_id = f.id
WHERE f.name = 'Mathe';
```

3. Was ist der beste Notendurchschnitt der beiden Noten Deutsch und Mathe?
```sql
SELECT MAX((note_deutsch + note_mathe) / 2) AS Bester_Durchschnitt 
FROM schueler;
```

4. Wie viel Einwohner hat der Ort mit den meisten Einwohnern, wie viel der Ort mit den wenigsten? 
```sql
SELECT MAX(einwohner) AS `Höchste Einwohnerzahl`, MIN(einwohner) AS `Niedrigste Einwohnerzahl` 
FROM ort;
```

5. Wie groß ist die Differenz zwischen dem Ort mit den meisten und dem mit den wenigsten Einwohnern?
```sql
SELECT (MAX(einwohner) - MIN(einwohner)) AS Differenz 
FROM ort;
```

6. Wie viele Schüler haben wir in der Datenbank?
```sql
SELECT COUNT(*) AS Anzahl_Schueler 
FROM schueler;
```

7. Wie viele Schüler haben ein Smartphone?
```sql
SELECT COUNT(*) AS Anzahl_Mit_Smartphone 
FROM schueler 
WHERE smartphone_id IS NOT NULL;
```

8. Wie viele Schüler haben ein Smartphone der Firma Samsung oder der Firma HTC?
```sql
SELECT COUNT(s.id) AS Anzahl 
FROM schueler s
JOIN smartphone sm ON s.smartphone_id = sm.id
JOIN hersteller h ON sm.hersteller_id = h.id
WHERE h.name = 'Samsung' OR h.name = 'HTC';
```

9. Wie viele Schüler wohnen in Waldkirch?
```sql
SELECT COUNT(s.id) AS Anzahl_Waldkirch 
FROM schueler s
JOIN ort o ON s.ort_id = o.id
WHERE o.name = 'Waldkirch';
```

10. Wie viele Schüler, die bei Herrn Bohnert Unterricht haben, wohnen in Emmendingen?
```sql
SELECT COUNT(DISTINCT s.id) AS Anzahl
FROM schueler s
JOIN ort o ON s.ort_id = o.id
JOIN unterricht u ON s.id = u.schueler_id
JOIN lehrer l ON u.lehrer_id = l.id
WHERE l.nachname = 'Bohnert' AND o.name = 'Emmendingen';
```

11. Wie viele Schüler unterrichtet Frau Zelawat?
```sql
SELECT COUNT(DISTINCT u.schueler_id) AS Anzahl_Schueler_Zelawat
FROM unterricht u
JOIN lehrer l ON u.lehrer_id = l.id
WHERE l.nachname = 'Zelawat';
```

12. Wie viele Schüler russischer Nationalität unterrichtet Frau Zelawat?
```sql
SELECT COUNT(DISTINCT s.id) AS Anzahl_RU_Zelawat
FROM schueler s
JOIN unterricht u ON s.id = u.schueler_id
JOIN lehrer l ON u.lehrer_id = l.id
WHERE l.nachname = 'Zelawat' AND s.nationalitaet = 'RU';
```

13. Welcher Lehrer verdient am meisten? (Achtung: Falle! Überprüfen Sie Ihr Ergebnis.)
```sql
SELECT vorname, nachname, gehalt 
FROM lehrer 
WHERE gehalt = (SELECT MAX(gehalt) FROM lehrer);
```
*(Die Falle besteht vermutlich darin, dass man nicht einfach `SELECT MAX(gehalt), nachname FROM lehrer` schreiben kann, ohne ein GROUP BY oder Subselect zu verwenden, da sonst MySQL einen zufälligen Namen zum Maximalgehalt ausgeben könnte - abhängig vom sql_mode).*
