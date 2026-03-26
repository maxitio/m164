# SELECT GROUP BY ORDER BY

In diesem Auftrag geht es um Statements die aussehen wie:

`SELECT sum(...),.. FROM .. GROUP BY .. HAVING .. ORDER BY ..` 

Starten tun wir aber mit einfacheren Statments.

Gegeben ist der Datenbank-Dump [nutztiere.sql](../Daten/nutztiere.sql), den ihr mit `source nutztiere.sql` einlesen könnt.


1. Listet die Einträge nur für die `Schafe` im Jahr 2018 auf und sortiert diese nach `gebiet_name` in absteigender Reihenfolge.
2. Berechnet die gesamte Anzahl `Schafe` im Jahr 2018.
3. Berechnet nur für die `Kühe` in der `Region Zürich` die Durchschnittliche Anzahl über alle Jahre
4. Berechnet nur für die `Kühe` in der `Region Zürich` die grösste Anzahl über alle Jahre;
5. Berechnet nur für die `Kühe` in der `Region Zürich` die kleinste Anzahl über alle Jahre;
6. Berechnet die totale Anzahl Nutztiere pro Region im Jahr 2016;
7. Berechnet die totale Anzahl Nutztiere pro Region und pro Jahr;
8. Berechnet die totale Anzahl Nutztiere pro Region und pro Jahr sortiert nach Jahr;
8. Berechnet die totale Anzahl Nutztiere pro Region und pro Jahr sortiert nach Jahr aber nur für die Jahre ab 2015;


