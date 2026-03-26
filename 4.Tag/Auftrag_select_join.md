# Select join

Zeit: 45 Min.<br>
Form: 2er Team

Gegeben ist die [Kunden Datenbank](../Daten/kundenDatenbank_dump.sql).

## Aufgaben

1.	Kartesisches Produkt: 
Erklären Sie in eigenen Worten, warum diese Abfrage kein sinnvolles Ergebnis gibt:

```sql
SELECT * FROM kunden
INNER JOIN orte;
```

2.	Einfache Abfragen über zwei Tabellen<br>
    a)	Geben Sie Name, Postleitzahl und Wohnort aller Kunden aus. Die Liste enthält den Kundennamen und den Namen des Orts, wo er wohnt.<br>
    b)	Geben Sie Name und Wohnort aller Kunden aus, die die Postleitzahl 79312 haben.<br>
    c)	Geben Sie Name und Wohnort aller Kunden aus, die in Emmendingen wohnen (Einschränkungskriterium ist NICHT die Postleitzahl, sondern 'Emmendingen').<br>
    d)	Geben Sie Name, Wohnort und Einwohnerzahl für alle Kunden aus, die in einem Ort mit mehr als 70000 Einwohnern wohnen.<br>
    e)	Geben Sie alle Orte aus, die weniger als 1000000 Einwohner haben.<br>
    f)	Geben Sie Kundename und Ortname aus für alle Kunden, die in Orten mit einer Einwohnerzahl zwischen 100.000 und 1.500.000 leben.<br>
    g)	Geben Sie Kundename, Postleitzahl und Ortname aus für alle Kunden, deren Name ein "e" enthält und alle Orte, die ein "u" oder ein "r" enthalten (*frEd* aus *stUden* wird also genau so angezeigt wie *jEssE* aus *bRnz*, *frEd* aus *salzen* aber nicht und *martin* aus *hambURg* auch nicht).
