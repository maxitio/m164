# Lösungen: Referentielle Datenintegrität Fortgeschritten

**1. Löschen Sie alle Orte: (CASCADE)**
*(Durch CASCADE bei `ON DELETE` werden beim Löschen eines Ortes automatisch alle Datensätze in verknüpften Tabellen gelöscht, die diesen Ort referenzieren, z.B. alle Kunden, die dort wohnen.)*
```sql 
DELETE FROM orte;
```

**2. Wenden Sie im SQL-Script RESTRICT auf ON UPDATE und ON DELETE an und laden Sie die DB wieder neu**
*Beispiel für die Anpassung im Script:*
```sql
-- Vorher:
-- CONSTRAINT `fk_ort` FOREIGN KEY (`ort_id`) REFERENCES `orte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

-- Neu:
CONSTRAINT `fk_ort` FOREIGN KEY (`ort_id`) REFERENCES `orte` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
```
*(Danach das Script neu ausführen, um die Tabellen mit RESTRICT Constraints neu zu erstellen.)*

**3. Löschen Sie via SQL-Befehl den Ort Emmendingen:**
```sql 
DELETE FROM orte
WHERE name = 'Emmendingen';
```
*(Wenn noch Personen in Emmendingen wohnen, wird dies aufgrund von RESTRICT nun mit einem Foreign Key Constraint Error fehlschlagen, da MySQL das Löschen verhindert, um fehlerhafte Referenzen zu vermeiden.)*

**4. Ändern Sie die Postleitzahl von Musterhausen:**
```sql 
UPDATE orte SET postleitzahl = 99999 
WHERE name = 'Musterhausen';
```
*(Funktioniert in der Regel auch bei RESTRICT (falls die PLZ geändert wird und nicht die ID, die referenziert wird), aber wenn die ID geändert werden *würde*, würde RESTRICT auch hier blockieren.)*

**5. Sie haben festgestellt, dass sich Änderungen nicht durchführen lassen. Ändern Sie die CONSTRAINTS auf SET NULL und NO ACTION und probieren Sie sie bspw. mit Nr. 3 und 4 nochmals aus.**
*Beispiel für die Anpassung:*
```sql
-- ON DELETE wird SET NULL / ON UPDATE wird NO ACTION
CONSTRAINT `fk_ort` FOREIGN KEY (`ort_id`) REFERENCES `orte` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
```
*(Hinweis: Damit `SET NULL` funktioniert, darf die Fremdschlüssel-Spalte `ort_id` in der Kind-Tabelle NICHT `NOT NULL` sein!)*
*(Wenn man danach Emmendingen löscht (Befehl aus Aufgabe 3), wird der Ort gelöscht und bei allen betroffenen Personen wird die `ort_id` auf `NULL` gesetzt.)*
