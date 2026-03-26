# Auftrag SELECT HAVING II

Gegeben ist die Datenbank [uebungSchuleDB](../Daten/uebungSchuleDB.sql) sowie das ER-Diagramm:

![](../x_res/SchuleDatenbankERD.png)

## HAVING oder WHERE?


### Aufgaben

A) 

Zeigen Sie den Durchschnitt der Mathenoten aller Schüler an, deren Name mit einem B beginnt.

Berücksichtigten Sie dabei nur die Schüler, die eine Note besser als 3 haben.
	
WHERE oder HAVING - Welche Lösung ist richtig?
	
(A1)
	
```SQL
SELECT
AVG(s.noteMathe) AS `Durchschnitt Mathe`
FROM
schueler s
WHERE s.name LIKE 'M%'
AND
s.noteMathe > 3;
```
	
*oder* (A2)
	
```SWL
SELECT
AVG(s.noteMathe) AS `Durchschnitt Mathe`
FROM
schueler s
WHERE s.name LIKE 'M%'
HAVING s.noteMathe > 3;
```

<br> 


B)

Zeigen Sie eine Liste aller Smartphonemarken und für jede Marke die Anzahl der Schüler, die ein solches Smartphone besitzen.

Die Marke Apple wollen wir nicht berücksichtigen.

Außerdem interessieren uns nur die Marken, von denen mindestens 15 Schüler ein Smartphone haben.

WHERE oder HAVING - Welche Lösung ist richtig?

(B1)

```SQL
SELECT
COUNT(s.id) AS anzahl, sp.marke
FROM schueler s
INNER JOIN smartphones sp
ON s.idSmartphones = sp.id
WHERE
AND anzahl > 15
AND sp.marke != 'Apple'
GROUP BY sp.id;
```

*oder* (B2)

```SQL
SELECT
COUNT(s.id) AS anzahl, sp.marke
FROM schueler s
INNER JOIN smartphones sp
ON s.idSmartphones = sp.id
WHERE sp.marke != 'Apple'
GROUP BY sp.id
HAVING anzahl > 15;
```

<br> 

C)

Wie viele Lehrer, die mehr als 2000 Euro verdienen, sind Angestellter / Beamter?

Bitte nur diejenigen berücksichtigen, die im Ort Nr. 4 wohnen.

WHERE oder HAVING - Welche Lösung ist richtig?

(C1)

```SQL
SELECT
COUNT(l.id) AS anzahl, l.status
FROM
lehrer l
WHERE
l.gehalt > 2000
AND
l.idOrte = 4
GROUP BY l.status;
```

*oder* (C2)

```SQL
SELECT
COUNT(l.id) AS anzahl, l.status
FROM
lehrer l
WHERE
l.idOrte = 4
GROUP BY l.status
HAVING l.gehalt > 2000;
```

<br>

D)

Wir wollen eine Liste aller Fächer, die mit R oder M beginnen.

Für jedes Fach brauchen wir die Anzahl der Lehrer, die es unterrichten, außerdem das Durchschnittsgehalt der Lehrer dieses Fachbereichs.

Da uns nur die Fächer interessieren, in denen man richtig viel verdient, lassen wir uns nur die Einträge anzeigen, bei denen das Durchschnittsgehalt über 2800 Euro liegt.

WHERE oder HAVING - Welche Lösung ist richtig?

(D1)

```SQL
SELECT
COUNT(l.id) AS anzahlLehrer,
AVG(l.gehalt) AS durchschnittsgehalt,
f.fachbezeichnung
FROM lehrer_hat_faecher lhf
INNER JOIN lehrer l
ON lhf.idLehrer = l.id
INNER JOIN faecher f
ON lhf.idFaecher = f.id
WHERE durchschnittsgehalt > 2800
GROUP BY f.id
HAVING (f.fachbezeichnung LIKE 'm%'
OR f.fachbezeichnung LIKE 'r%');
```

*oder* (D2)

```SQL
SELECT
COUNT(l.id) AS anzahlLehrer,
AVG(l.gehalt) AS durchschnittsgehalt,
f.fachbezeichnung
FROM lehrer_hat_faecher lhf
INNER JOIN lehrer l
ON lhf.idLehrer = l.id
INNER JOIN faecher f
ON lhf.idFaecher = f.id
WHERE COUNT(l.gehalt) > 2800
AND (f.fachbezeichnung LIKE 'm%'
OR f.fachbezeichnung LIKE 'r%')
GROUP BY f.id;
```

*oder* (D3)

```SQL
SELECT
COUNT(l.id) AS anzahlLehrer,
AVG(l.gehalt) AS durchschnittsgehalt,
f.fachbezeichnung
FROM lehrer_hat_faecher lhf
INNER JOIN lehrer l
ON lhf.idLehrer = l.id
INNER JOIN faecher f
ON lhf.idFaecher = f.id
WHERE (f.fachbezeichnung LIKE 'm%'
OR f.fachbezeichnung LIKE 'r%')
GROUP BY f.id
HAVING durchschnittsgehalt > 2800;
```
