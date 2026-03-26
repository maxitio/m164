# Select join Fortgeschrittene

SELECT JOIN über bis zu 5 Tabellen

Zeit: 45 Min.<br>
Form: 2er Team

Gegeben ist die [buchladenDatenbank_dump](../Daten/buchladenDatenbank_dump.sql)
![](../../x_res/buchladen_ERD.png)

## Aufgaben

1.	Gesucht sind alle Lieferanten, die ihren Sitz in Freiburg haben. Geben Sie Lieferantenname, Lieferantenort und Postleitzahl aus.<br>
(Lösungshinweis: Es werden drei Lieferanten ausgegeben.)

2.	Gesucht sind alle Verlage, die ihren Sitz in München haben. Geben Sie Verlagsname und Verlagsort aus.<br>
(Lösungshinweis: Es werden drei Verlage ausgegeben.)

3.	Gesucht sind alle Bücher, die im Verlag Assal erschienen sind. Geben Sie Buchtitel, Erscheinungsjahr und Verlagsname aus, absteigend sortiert nach Erscheinungsjahr.<br>
(Lösungshinweis: Es werden vier Bücher ausgegeben.)

4.	Gesucht sind alle Bücher des Lieferanten Schustermann. Geben Sie Buchtitel und Lieferantenname aus.<br>
(Lösungshinweis: Es werden drei Bücher ausgegeben.)

5.	Gesucht sind alle Thriller. Geben Sie Buchtitel und Sparte aus, sortiert nach Buchtitel.<br>
(Lösungshinweis: Es werden fünf Bücher ausgegeben, das erste ist "Ein letzter Kuss".)

6.	Gesucht sind alle Liebesromane. Geben Sie Buchtitel, Sparte und Verlagsname aus, sortiert nach Buchtitel aufsteigend.<br>
(Lösungshinweis: Es werden sieben Datensätze ausgegeben, "Der Landarzt und seine Sekretärin" zuerst.)

7.	Gesucht sind alle Bücher von Sabrina Müller. Geben Sie Autorennachname, Autorenvorname und Buchtitel aus, sortiert nach Buchtitel absteigend.<br>
(Lösungshinweis: Es werden vier Datensätze ausgegeben, "Wilde Jagd auf John Smith - Die Vergeltung" zuerst.)

8.	Gesucht sind alle Thriller von Sabrina Müller. Geben Sie Autorenname, Buchtitel und Sparte aus.<br>
(Lösungshinweis: Es werden zwei Datensätze ausgegeben.)


    **Achtung schwierig:**

1. Gesucht sind alle Bücher von Sabrina Müller, die in die Sparten Thriller oder Humor eingeordnet werden können. Geben Sie Autorenname, Buchtitel und Sparte aus.

   Damit das Buch "Wilde Jagd auf John Smith - Die Rache" nicht zweimal auftaucht, müssen Sie das Ergebnis nach Buchtitel gruppieren, indem Sie vor ORDER BY schreiben:

    ```sql
    GROUP BY titel
    ```
    Damit nun auch noch für dieses Buch beide Sparten in der Spalte "bezeichnung" angezeigt werden, benutzen Sie für die Ausgabe der Sparte nicht einfach den Feldnamen "bezeichnung", sondern

    ```sql
    GROUP_CONCAT(bezeichnung)
    ```
   Damit werden für Bücher, die in mehreren Sparten eingeordnet sind, alle Sparten mit Komma getrennt in einem Feld ausgegeben.<br>
(Lösungshinweis: Es werden drei Datensätze ausgegeben.)
