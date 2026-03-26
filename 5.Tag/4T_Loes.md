![](../x_res/tbz_logo.png)

# M164 Lösungen 4.Tag


![Checkpoint](../x_res/CP.png)


### **Ref. Integrität**: Was ist das? Machen Sie ein Beispiel dazu!

- Bei der referentiellen Integrität können Datensätze die einen Fremdschlüssel aufweisen nur dann gespeichert werden, wenn der Wert des Fremdschlüssels einmalig in der referenzierten Tabelle existiert. Im Falle, dass ein referenzierter Wert nicht vorhanden ist, kann der Datensatz nicht gespeichert werden.

- Eine Datenbank kann schnell in einen inkonsistenten Zustand geraten. Im ungünstigsten Fall liegt eine nicht-normalisierte Datenbank vor, die starke Redundanzen aufweist.

  [Quelle](https://www.datenbanken-verstehen.de/datenmodellierung/referentielle-integritaet/)

### Welche Constraints kann eine Beziehung haben? *(Tipp: Mehr als eine!)*

- `FK`: Der Fremdschlüssel der Beziehung muss als `FK` definiert sein.
- `PK`: Der Identifikationsschlüssel der Beziehung muss als `PK` definiert sein.
- `NOT NULL` oder/und `UNIQUE` bestimmen die Kardinalität der Beziehung.
- `CONSTRAINT <> FOREIGN KEY (...)` überprüft die Korrektheit der Beziehung (FK-Werte).
  
### Was ist der Unterschied zwischen `LEFT JOIN` und `RIGHT JOIN`?

- Kein Unterschied - ausser das die Reihenfolge der Tabellen vertauscht ist.

### Wie wird eine **1:1**-Beziehung und eine **c:m**-Beziehung umgesetzt? Warum?

- **1:1**: Wie bei einer **1:c**-Beziehung wird `NN` und `UQ` beim Fremdschlüssel gesetzt.
- **c:m**: Wie bei einer **c:mc**-Beziehung wird weder `NN` noch `UQ` beim Fremdschlüssel gesetzt.

### Was ist der Nachteil, wenn eine Beziehung *nur* mit Primär- und Fremdschlüssel definiert werden, d.h. ohne Beziehungs-Constraints?

- Ohne `CONSTRAINT <> FOREIGN KEY (...)` auf einer Beziehung, wird diese vom DBMS *nicht auf deren ref. Integrität* geprüft! D.h. es könnten FK-Werte eingetragen werden, die es als PK-Werte nicht gibt! (Siehe nächste Frage)

### Welche Folge hat einen Eintrag eines Fremdschlüsselwertes, der als PK-Wert in der verbundenen Tabelle nicht vorhanden ist? 

- Folge: Keine ref. Integrität mehr, falls der DS gespeichert wird!
 
- a) *mit* Contraint-Anweisung: <br> Fehlermeldung und das Einfügen des gesamten Datensatzes wird verhindert.  
- b) *ohne* Contraint-Anweisung: Werte werden nicht überprüft, darum wird die DB inkonsistent!