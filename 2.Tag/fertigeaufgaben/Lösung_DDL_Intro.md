# 1. CREATE TABLE
(Basierend auf DDL_Intro.md erstellt diese Übung oft eine simple Tabelle)

```sql
CREATE TABLE kunden (
    kunde_id INT NOT NULL AUTO_INCREMENT,
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (kunde_id)
);
```

# 2. ALTER TABLE
```sql
ALTER TABLE kunden ADD COLUMN telefon VARCHAR(20);
ALTER TABLE kunden MODIFY COLUMN email VARCHAR(150);
ALTER TABLE kunden RENAME COLUMN telefon TO tel_nr;
ALTER TABLE kunden DROP COLUMN tel_nr;
```

# 3. DROP TABLE
```sql
DROP TABLE IF EXISTS kunden;
```
