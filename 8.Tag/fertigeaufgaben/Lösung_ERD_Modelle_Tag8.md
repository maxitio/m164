# ERD-Diagramme (Mermaid) für Tag 8 (Normalisierung)

## 1. Freifächer (Logisches / Physisches ERD)
Ausgangslage: Die unnormalisierte Excel-Tabelle musste in die 3. Normalform gebracht werden. Dies resultiert typischerweise in den Entitäten `Schueler`, `Klasse`, `Freifach`, `Lehrer` und der Zuordnungstabelle `Schueler_Freifach`.

```mermaid
erDiagram
    KLASSE {
        int id PK
        string bezeichnung "z.B. 3A"
    }
    
    SCHUELER {
        int id PK
        string vorname
        string nachname
        date geburtsdatum
        int klasse_id FK
    }
    
    LEHRER {
        int id PK
        string vorname
        string nachname
    }
    
    FREIFACH {
        int id PK
        string bezeichnung
        int lehrer_id FK
    }
    
    SCHUELER_FREIFACH {
        int schueler_id PK, FK
        int freifach_id PK, FK
    }

    KLASSE ||--o{ SCHUELER : "hat"
    LEHRER ||--o{ FREIFACH : "unterrichtet"
    SCHUELER ||--o{ SCHUELER_FREIFACH : "besucht"
    FREIFACH ||--o{ SCHUELER_FREIFACH : "wird besucht von"
```

## 2. Opendata Steuerdaten Stadt Zürich (Physisches ERD)
Ausgangslage: Aus einer flachen CSV-Datei mussten die redundanten Daten in ein relationales Modell überführt werden. Laut Lösungsdokument (`8T_Loes.md`) fließen diese Daten in vier Tabellen: `Jahr`, `Quartier`, `Steuertarif` und die Faktentabelle `Steuern`.

```mermaid
erDiagram
    JAHR {
        int id PK
        int jahr
    }
    
    QUARTIER {
        int id PK
        string name "z.B. Fluntern"
    }
    
    STEUERTARIF {
        int id PK
        string bezeichnung "z.B. Grundtarif, Verheiratetentarif"
    }
    
    STEUERN {
        int id PK
        int jahr_id FK
        int quartier_id FK
        int steuertarif_id FK
        float p25
        float p50
        float p75
    }

    JAHR ||--o{ STEUERN : "gilt für"
    QUARTIER ||--o{ STEUERN : "gehört zu"
    STEUERTARIF ||--o{ STEUERN : "wird referenziert in"
```
