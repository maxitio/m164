# Lösungen: Select join Fortgeschrittene

**(Hinweis: Die exakten Spaltennamen für Fremdschlüssel und Tabellen müssen evt. an das genaue `buchladenDatenbank` Schema aus dem ERD/Dump angepasst werden. Dies ist die allgemeingültige Standardlösung basierend auf der Fragestellung.)**

**1. Gesucht sind alle Lieferanten, die ihren Sitz in Freiburg haben.**
```sql
SELECT name, ort, plz 
FROM lieferant 
WHERE ort = 'Freiburg';
```

**2. Gesucht sind alle Verlage, die ihren Sitz in München haben.**
```sql
SELECT name, ort 
FROM verlag 
WHERE ort = 'München';
```

**3. Gesucht sind alle Bücher, die im Verlag Assal erschienen sind.**
```sql
SELECT b.titel, b.erscheinungsjahr, v.name AS verlagsname 
FROM buch b
JOIN verlag v ON b.verlag_id = v.id
WHERE v.name = 'Assal'
ORDER BY b.erscheinungsjahr DESC;
```

**4. Gesucht sind alle Bücher des Lieferanten Schustermann.**
```sql
SELECT b.titel, l.name AS lieferantenname 
FROM buch b
JOIN lieferant l ON b.lieferant_id = l.id
WHERE l.name = 'Schustermann';
```

**5. Gesucht sind alle Thriller.**
```sql
SELECT b.titel, s.bezeichnung AS sparte 
FROM buch b
JOIN sparte s ON b.sparte_id = s.id
WHERE s.bezeichnung = 'Thriller'
ORDER BY b.titel ASC;
```

**6. Gesucht sind alle Liebesromane.**
```sql
SELECT b.titel, s.bezeichnung AS sparte, v.name AS verlagsname 
FROM buch b
JOIN sparte s ON b.sparte_id = s.id
JOIN verlag v ON b.verlag_id = v.id
WHERE s.bezeichnung = 'Liebesroman'
ORDER BY b.titel ASC;
```

**7. Gesucht sind alle Bücher von Sabrina Müller.**
```sql
SELECT a.nachname, a.vorname, b.titel 
FROM autor a
JOIN buch_autor ba ON a.id = ba.autor_id
JOIN buch b ON ba.buch_id = b.id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller'
ORDER BY b.titel DESC;
```

**8. Gesucht sind alle Thriller von Sabrina Müller.**
```sql
SELECT CONCAT(a.vorname, ' ', a.nachname) AS autorenname, b.titel, s.bezeichnung AS sparte
FROM autor a
JOIN buch_autor ba ON a.id = ba.autor_id
JOIN buch b ON ba.buch_id = b.id
JOIN sparte s ON b.sparte_id = s.id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller' 
  AND s.bezeichnung = 'Thriller';
```

**9. (Achtung schwierig) Thriller oder Humor von Sabrina Müller gruppiert**
```sql
SELECT CONCAT(a.vorname, ' ', a.nachname) AS autorenname, b.titel, GROUP_CONCAT(s.bezeichnung) AS sparte
FROM autor a
JOIN buch_autor ba ON a.id = ba.autor_id
JOIN buch b ON ba.buch_id = b.id
JOIN buch_sparte bs ON b.id = bs.buch_id
JOIN sparte s ON bs.sparte_id = s.id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller'
  AND (s.bezeichnung = 'Thriller' OR s.bezeichnung = 'Humor')
GROUP BY b.titel;
```
*(Hinweis: Je nach genauer Umsetzung der Datenbank (entweder über eine Zwischentabelle `buch_sparte` bei n:m oder ähnlich) muss der JOIN eventuell leicht angepasst werden.)*
