# Lösungen: Select

a. Lassen Sie sich mit SELECT alle Film-Datensätze Ihrer DVD-Sammlung ausgeben.
```sql
SELECT * FROM filme;
```

b. Erstellen Sie eine Anweisung, die alle Filmtitel und die jeweils zugehörige Nummer ausgibt.
```sql
SELECT titel, nummer FROM filme;
```

c. Erstellen Sie eine Anweisung, die alle Filmtitel und den jeweils zugehörigen Regisseur ausgibt.
```sql
SELECT titel, regisseur FROM filme;
```

d. Erstellen Sie eine Liste mit allen Filmen von Quentin Tarantino.
```sql
SELECT * FROM filme WHERE regisseur = 'Quentin Tarantino';
```

e. Erstellen Sie eine Liste mit allen Filmen von Steven Spielberg.
```sql
SELECT * FROM filme WHERE regisseur = 'Steven Spielberg';
```

f. Erstellen Sie eine Liste aller Filme, in denen der Regisseur den Vornamen "Steven" hat.
```sql
SELECT * FROM filme WHERE regisseur LIKE 'Steven %';
```

g. Erstellen Sie eine Liste mit allen Filmen, die länger als 2 Stunden sind.
```sql
SELECT * FROM filme WHERE laenge_minuten > 120;
```

h. Erstellen Sie eine Liste mit allen Filmen, die von Tarantino oder von Spielberg gedreht wurden.
```sql
SELECT * FROM filme WHERE regisseur LIKE '%Tarantino%' OR regisseur LIKE '%Spielberg%';
```

i. Suchen Sie alle Filme heraus, die von Tarantino gedreht wurden und kürzer als 90 Minuten sind.
```sql
SELECT * FROM filme WHERE regisseur LIKE '%Tarantino%' AND laenge_minuten < 90;
```

j. Sie erinnern sich an einen Film, in dessen Titel "Sibirien" vorkam. Suchen Sie ihn.
```sql
SELECT * FROM filme WHERE titel LIKE '%Sibirien%';
```

k. Lassen Sie sich alle Teile von "Das große Rennen" ausgeben.
```sql
SELECT * FROM filme WHERE titel LIKE 'Das große Rennen%';
```

l. Lassen Sie sich eine Liste aller Filme ausgeben, sortiert nach Regisseur.
```sql
SELECT * FROM filme ORDER BY regisseur ASC;
```

m. Lassen Sie sich eine Liste aller Filme ausgeben, sortiert nach Regisseur, dann nach Filmtitel.
```sql
SELECT * FROM filme ORDER BY regisseur ASC, titel ASC;
```

n. Lassen Sie sich eine Liste aller Filme von Tarantino ausgeben, die längsten zuerst.
```sql
SELECT * FROM filme WHERE regisseur LIKE '%Tarantino%' ORDER BY laenge_minuten DESC;
```
