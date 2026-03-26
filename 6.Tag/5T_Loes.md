![](../x_res/tbz_logo.png)

# M164 Lösungen 5.Tag


![Checkpoint](../x_res/CP.png)


### Nennen Sie die fünf Aspekte der **Datenintegrität** in einer Datenbank.

1. **Entitätsintegrität  - Eindeutigkeit und Konsistenz**: Jeder Datensatz in der Datenbank sollte eindeutig identifizierbar und dauerhaft sein. **&rarr; ID muss vorhanden und einmalig sein**

2. **Referenzielle Integrität**: Wenn eine Tabelle Beziehungen zu anderen Tabellen hat, sollten die Beziehungen immer konsistent bleiben. **&rarr; FK-Constraint, NN, UQ**

3. **Bereichswertintegrität - Datentypen**: Die Daten sollten in den Datenbank-Spalten in den korrekten Datentypen gespeichert werden. (1.NF)

4. **Datenbeschränkungen**: Datenbeschränkungen stellen sicher, dass die Daten in der Datenbank gültig sind. **&rarr; CHECK**


Datenintegrität und Datenkonsistenz sind zwei wichtige Konzepte im Bereich der Datenverwaltung. Sie beziehen sich auf verschiedene Aspekte der Datenqualität und -sicherheit.

### Was ist der Unterschied zwischen Datenintegrität und Datenkonsistenz?

- **Datenintegrität**: Sie stellt mit (vier) Regeln sicher, dass die in einer Datenbank gespeicherten Informationen dauerhaft korrekt, vollständig und vertrauenswürdig bleiben, ganz gleich, wie oft auf sie zugegriffen wird. 

- **Datenkonsistenz** Es geht darum, sicherzustellen (Regel 1), dass alle (verteilten) Daten in einem System zu jedem Zeitpunkt einen einheitlichen Zustand aufweisen. Ist bei parallelen Zugriffen, bzw. bei Replikationen wichtig! (&rarr; siehe Modul 141)

 

### Was ist die **Gefahr** bei der FK-Constraint-Option `ON DELETE Cascade`?

1. **Unbeabsichtigtes Löschen von Daten**: Wenn Sie nicht vorsichtig sind, können Sie durch das Löschen eines einzigen Datensatzes eine Kaskade von Löschvorgängen auslösen, die sich auf mehrere Tabellen ausbreiten und zu einem unbeabsichtigten Datenverlust führen.

2. **Komplexität**: Die Verwendung von `ON DELETE CASCADE` kann die Komplexität Ihrer Datenbank erhöhen und es schwieriger machen, die Auswirkungen von Löschvorgängen zu verstehen.

3. **Leistungsprobleme**: Das kaskadierende Löschen kann zu Leistungsproblemen führen, insbesondere wenn grosse Mengen von Daten betroffen sind.



### Was ist der **Unterschied** zwischen `COUNT(*)` und `COUNT(attr)`?
  
  - `COUNT(*)` zählt ALLE Datensätze an, auch solche mit `NULL`-Werten.
  -  `COUNT(attr)` zählt Datensätze, die in der Spalte `attr` Werte ≠ `NULL` aufweisen. 
  
### Formuliere einen SELECT-Befehl mit der `WHERE BETWEEN` Klausel. ([Tipp](https://www.w3schools.com/sql//sql_between.asp))

```SQL
 SELECT * FROM Products
 WHERE Price BETWEEN 10 AND 19;
```
*Hinweis: Die Preise `10` und `19` werden auch angezeigt!*

### Worauf müssen Sie bei der **HAVING** Klausel achten?

1. **Verwendungszweck**: Die `HAVING` Klausel wird verwendet, um Daten nach bestimmten Kriterien zu filtern. Sie wird üblicherweise bei der Erstellung von Berichten verwendet.
	
2. **Verwendung mit GROUP BY**: Die `HAVING` Klausel wird oft in Verbindung mit der `GROUP BY` Klausel verwendet. Wenn Sie die `GROUP BY` Klausel verwenden, ordnen Sie Datensätze in Gruppen an, um Aggregationswerte (Statistiken) für sie zu berechnen. `HAVING` filtert Datensätze nach diesen Aggregatwerten.
	
3. **Unterschied zu WHERE**: Die `HAVING` Klausel wurde zu SQL hinzugefügt, weil das `WHERE` Schlüsselwort nicht mit Aggregatfunktionen verwendet werden kann.
		
Bitte beachten Sie, dass die Beherrschung dieser Klausel es SQL-Benutzern ermöglicht, wertvolle Erkenntnisse aus aggregierten Daten zu gewinnen.
	

### Formulieren Sie einen Satz, der den **Einsatz** von Subqueries erklärt und begründet.

  - In SQL werden Unterabfragen (Subqueries) verwendet, um komplexe Abfragen zu erstellen und zu vereinfachen, indem sie es ermöglichen, mehrere Abfragen in einer einzigen Abfrage auszuführen, wodurch die Notwendigkeit mehrerer Abfragen und die damit verbundene Verarbeitungszeit reduziert wird. 
  - Sie können auch dazu verwendet werden, um Daten zu filtern, die auf Ergebnissen basieren, die von einer anderen Abfrage zurückgegeben werden, was die Flexibilität und Effizienz der Datenmanipulation erhöht.