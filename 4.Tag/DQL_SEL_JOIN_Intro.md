# DQL (Data Query Language)

## SELECT JOIN

In relationalen Datenbanken sind die Daten normalerweise auf mehrere Tabellen verteilt, um Redundanz zu vermeiden und Datenkonsistenz sicherzustellen. Manchmal müssen jedoch Informationen aus mehreren Tabellen abgerufen werden. JOIN ermöglicht es, Daten aus zwei oder mehr Tabellen abzufragen, indem man sie basierend auf einer gemeinsamen Spalte oder einem gemeinsamen Wert verknüpft.

Im Allgemeinen gibt es vier Arten von Joins:

**INNER JOIN:**<br>
Inner Join gibt nur die Datensätze zurück, die in beiden Tabellen übereinstimmen. Mit anderen Worten, es gibt nur Ergebnisse zurück, die in beiden Tabellen vorkommen. Beispiel:

```sql
SELECT customers.customer_id, orders.order_date
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
```

Diese Abfrage gibt nur Kunden zurück, die Bestellungen getätigt haben, da die Verknüpfung auf der Kunden-ID-Spalte in beiden Tabellen basiert. Wenn es einen Kunden gibt, der keine Bestellung aufgegeben hat, wird er nicht in der Abfrageergebnissen angezeigt.

In der Mengenlehre ist INNER JOIN die Schnittmenge, u.a. mathematisch ausgedrückt: **customers ∩ orders**

**LEFT JOIN:**<br>
Left Join gibt alle Datensätze aus der linken Tabelle und nur die übereinstimmenden Datensätze aus der rechten Tabelle zurück. Wenn es keine Übereinstimmung in der rechten Tabelle gibt, wird NULL zurückgegeben. Beispiel:

```sql
SELECT customers.customer_id, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
```

Diese Abfrage gibt alle Kunden und ihre Bestellungen zurück. Wenn ein Kunde keine Bestellung aufgegeben hat, wird NULL zurückgegeben.

**RIGHT JOIN:**<br>
Right Join gibt alle Datensätze aus der rechten Tabelle und nur die übereinstimmenden Datensätze aus der linken Tabelle zurück. Wenn es keine Übereinstimmung in der linken Tabelle gibt, wird NULL zurückgegeben. Beispiel:

```sql
SELECT customers.customer_id, orders.order_date
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
```

Diese Abfrage gibt alle Bestellungen und ihre zugehörigen Kunden zurück. Wenn es eine Bestellung gibt, die keinem Kunden zugeordnet ist, wird NULL zurückgegeben.

**FULL OUTER JOIN:**<br>
Full Outer Join gibt alle Datensätze aus beiden Tabellen zurück, auch wenn sie nicht übereinstimmen. Wenn es keine Übereinstimmung in einer Tabelle gibt, wird NULL zurückgegeben. FULL OUTER JOIN ist jedoch *nicht in MySQL/MariaDB* verfügbar. Man kann es jedoch durch [UNION](https://dev.mysql.com/doc/refman/8.0/en/union.html) von LEFT JOIN und RIGHT JOIN simulieren. Beispiel:

```sql
SELECT customers.customer_id, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
UNION
SELECT customers.customer_id, orders.order_date
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.customer_id is null;
```

Diese Abfrage gibt alle Kunden und ihre Bestellungen zurück, einschließlich der Kunden, die keine Bestellung aufgegeben haben und der Bestellungen, die keinem Kunden zugeordnet sind.

In der Mengenlehre ist FULL OUTER JOIN die Vereinigungsmenge ∪, zum Beispiel:  **customers ∪ order**. 

---

Insgesamt ermöglicht JOIN in MySQL/MariaDB die Abfrage von Daten aus mehreren Tabellen und ist eine der wichtigsten Funktionen in relationalen Datenbanken!


---

![](../x_res/Buch.jpg)

## Referenzen

<https://dev.mysql.com/doc/refman/8.0/en/select.html>

<https://dev.mysql.com/doc/refman/8.0/en/join.html>

<https://dev.mysql.com/doc/refman/8.0/en/union.html>
