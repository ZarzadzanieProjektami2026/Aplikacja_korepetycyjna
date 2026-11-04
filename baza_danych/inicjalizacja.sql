
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    -- student = 0, nauczyciel =1
    nauczyciel_student INTEGER NOT NULL  
        CHECK (nauczyciel_student IN (0, 1)),
    imie text NOT NULL,
    nazwisko text NOT NULL,
    email text UNIQUE NOT NULL,
    data_zalozenia TEXT NOT NULL
        CHECK (datetime(data_zalozenia) IS NOT NULL),

    CONSTRAINT unique_nauczyciel_student
        UNIQUE (id, nauczyciel_student)
)STRICT; 

CREATE TABLE przedmioty (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nazwa text NOT NULL UNIQUE
)STRICT;


--tylko nauczyciel moze byc prowadzacy grupy

CREATE TABLE grupy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_prowadzacy INTEGER NOT NULL,
    czy_nauczyciel INTEGER NOT NULL DEFAULT 1,
    nazwa_grupy text,

    CONSTRAINT check_prowadzacy
        CHECK (czy_nauczyciel = 1),

    CONSTRAINT fk_grupy_prowadzacy
        FOREIGN KEY (id_prowadzacy, czy_nauczyciel)
        REFERENCES users(id, nauczyciel_student)
)STRICT;



-- 
CREATE TABLE dzialy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_przedmiotu INTEGER NOT NULL,
    id_parent_dzial INTEGER DEFAULT -1,
    nazwa text UNIQUE NOT NULL,
    --parent_dzial wskazuje na dzial ktorego jest podzialem. 
    --Np jakis dzial 2.1 i dzial 2.2 wskazuja na ID dzialu 2. 
    --Jeśli nie ma parent, to NULL 

    CONSTRAINT fk_dzialy_przedmiot
        FOREIGN KEY (id_przedmiotu)
        REFERENCES przedmioty(id),

    CONSTRAINT fk_dzialy_parent
        FOREIGN KEY (id_parent_dzial)
        REFERENCES dzialy(id)
)STRICT;


CREATE TABLE zadania (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_dzialu INTEGER NOT NULL,
    id_tworcy INTEGER NOT NULL,
    nazwa text,
    zadanie TEXT,
    od_kiedy TEXT
        CHECK (od_kiedy IS NULL OR datetime(od_kiedy) IS NOT NULL),
    do_kiedy TEXT
        CHECK (do_kiedy IS NULL OR datetime(do_kiedy) IS NOT NULL),
    data_zalozenia TEXT NOT NULL
    CHECK (datetime(data_zalozenia) IS NOT NULL),

    CONSTRAINT fk_zadania_tworca
        FOREIGN KEY (id_tworcy)
        REFERENCES users(id),

    CONSTRAINT fk_zadania_dzial
        FOREIGN KEY (id_dzialu)
        REFERENCES dzialy(id)
)STRICT;

CREATE TABLE grupy_uzytkownicy (
    id_grupa INTEGER NOT NULL,
    id_uzytkownik INTEGER NOT NULL,

    CONSTRAINT pk_grupy_uzytkownicy
        PRIMARY KEY (id_grupa, id_uzytkownik),

    CONSTRAINT fk_grupy_uzytkownicy_grupa
        FOREIGN KEY (id_grupa)
        REFERENCES grupy(id),

    CONSTRAINT fk_grupy_uzytkownicy_user
        FOREIGN KEY (id_uzytkownik)
        REFERENCES users(id)
)STRICT;

CREATE TABLE grupy_dzialy (
    id_grupa INTEGER NOT NULL,
    id_dzial INTEGER NOT NULL,

    CONSTRAINT pk_grupy_dzialy
        PRIMARY KEY (id_grupa, id_dzial),

    CONSTRAINT fk_grupy_dzialy_grupa
        FOREIGN KEY (id_grupa)
        REFERENCES grupy(id),

    CONSTRAINT fk_grupy_dzialy_dzial
        FOREIGN KEY (id_dzial)
        REFERENCES dzialy(id)
)STRICT;

