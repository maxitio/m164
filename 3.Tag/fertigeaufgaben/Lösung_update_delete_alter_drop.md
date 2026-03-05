# Lösungen: Update, delete, alter und drop

1. Beim Regisseur «Cohen» fehlt der Vorname. Vervollständigen sie den Regisseur Namen mit dem Vornamen «Etan».
```sql
UPDATE filme 
SET regisseur = 'Etan Cohen' 
WHERE regisseur = 'Cohen';
```

2. Der Film «Angst» dauert nicht 92 Minuten, sondern 120 Minuten. Korrigieren Sie.
```sql
UPDATE filme 
SET laenge_minuten = 120 
WHERE titel = 'Angst';
```

3. DVD gibt es nicht mehr. Das Sortiment wurde durch «Bluray» Medien ersetzt. Nennen Sie die Tabelle um nach «bluray_sammlung».
```sql
ALTER TABLE filme RENAME TO bluray_sammlung;
```

4. Eine neue Spalte «Preis» soll hinzugefügt werden.
```sql
ALTER TABLE bluray_sammlung ADD COLUMN preis DECIMAL(10,2);
```

5. Der Film «Angriff auf Rom» von Steven Burghofer wurde aus dem Sortiment entfernt. Bereinigen Sie die Tabelle.
```sql
DELETE FROM bluray_sammlung 
WHERE titel = 'Angriff auf Rom' AND regisseur = 'Steven Burghofer';
```

6. Die Spalte «filme» soll nach «kinofilme» umbenannt werden.
*(Annahme: Eine Spalte hieß "filme" oder "titel")*
```sql
ALTER TABLE bluray_sammlung RENAME COLUMN filme TO kinofilme;
```

7. Die Spalte Nummer wird nicht mehr benötigt. Löschen Sie sie.
```sql
ALTER TABLE bluray_sammlung DROP COLUMN nummer;
```

8. Der Filmverleih rentiert nicht mehr. Die Firma wurde geschlossen und folglich werden alle Daten eliminiert. Löschen Sie die Tabelle.
```sql
DROP TABLE bluray_sammlung;
```
