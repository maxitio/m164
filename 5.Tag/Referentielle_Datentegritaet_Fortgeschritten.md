# Referentielle Datenintegrität Fortgeschritten


Um die nachfolgenden Aufgaben umsetzen zu können, führen Sie das Skript [foreignkey-test-db.sql](../Daten/foreignkey-test-db.sql) aus. Untersuchen Sie das Script und suchen Sie nach den entsprechenden CONSTRAINTS: CASCADE ist eingestellt! 

Sie können die folgende Script-Datei als Vorlage für die folgenden Aufgaben verwenden: [foreignkey-test-qry.sql](../Daten/foreignkey-test-qry.sql)


1.	Löschen Sie alle Orte: (CASCADE)
    ```sql 
    DELETE FROM orte;
    ```

2.	Wenden Sie im SQL-Script **RESTRICT** auf ON UPDATE und ON DELETE an und **laden Sie die DB wieder neu** <br>

3.	Löschen Sie via SQL-Befehl den Ort Emmendingen: 
    ```sql 
    DELETE FROM orte
    WHERE ...
    ```

4.	Ändern Sie die Postleitzahl von Musterhausen: 
    ```sql 
    UPDATE orte SET postleitzahl = 99999 
    WHERE ...
    ```

5.	Sie haben festgestellt, dass sich Änderungen nicht durchführen lassen. Ändern Sie die CONSTRAINTS auf **SET NULL** und **NO ACTION** und probieren Sie sie bspw. mit Nr. 3 und 4 nochmals aus.
