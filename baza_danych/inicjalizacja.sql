
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
    token_google TEXT UNIQUE NOT NULL,
       

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
    nazwa_grupy text NOT NULL,

    CONSTRAINT check_prowadzacy
        CHECK (czy_nauczyciel = 1),

    CONSTRAINT fk_prowadzacy
        FOREIGN KEY (id_prowadzacy, czy_nauczyciel)
        REFERENCES users(id, nauczyciel_student)
)STRICT;



-- 
CREATE TABLE dzialy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_przedmiot INTEGER NOT NULL,
    id_parent_dzial INTEGER DEFAULT NULL,
    nazwa text NOT NULL,
    --parent_dzial wskazuje na dzial ktorego jest podzialem. 
    --Np jakis dzial 2.1 i dzial 2.2 wskazuja na ID dzialu 2. 
    --Jeśli nie ma parent, to NULL 

    CONSTRAINT fk_przedmiot
        FOREIGN KEY (id_przedmiot)
        REFERENCES przedmioty(id),

    CONSTRAINT fk_parent_dzial
        FOREIGN KEY (id_parent_dzial)
        REFERENCES dzialy(id)
)STRICT;




CREATE TABLE grupy_student (
    id_grupa INTEGER NOT NULL,
    id_student INTEGER NOT NULL,

    CONSTRAINT pk_grupy_student
        PRIMARY KEY (id_grupa, id_student),

    CONSTRAINT fk_grupa
        FOREIGN KEY (id_grupa)
        REFERENCES grupy(id),

    CONSTRAINT fk_student
        FOREIGN KEY (id_student)
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

CREATE TABLE zadania_fiszki (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_dzial INTEGER,
    id_tworcy INTEGER NOT NULL,
    tytul TEXT,

    pojecie TEXT NOT NULL,
    definicja TEXT NOT NULL,

    data_zalozenia TEXT NOT NULL
    CHECK (datetime(data_zalozenia) IS NOT NULL),

    CONSTRAINT fk_zadania_tworca
        FOREIGN KEY (id_tworcy)
        REFERENCES users(id),

    CONSTRAINT fk_dzial
        FOREIGN KEY (id_dzial)
        REFERENCES dzialy(id)
)STRICT;

CREATE TABLE zadania_fiszki_student ( 
    id_fiszki INTEGER NOT NULL, 
    id_student INTEGER NOT NULL,
    id_zestaw INTEGER DEFAULT NULL, 
    --id zestawu dodajemy gdy pytanie jest czesc zestawu, np
    --jesli student dostaje 2 zestawy które oba mają to samo zadanie, to 
    --trzeba je odroznic. 

    CONSTRAINT pk_zadania_fiszki_student
        PRIMARY KEY (id_fiszki, id_student),
    CONSTRAINT fk_fiszki
        FOREIGN KEY (id_fiszki)
        REFERENCES zadania_fiszki(id),
    CONSTRAINT fk_student 
        FOREIGN KEY (id_student)
        REFERENCES users(id),
    CONSTRAINT fk_zestaw
        FOREIGN KEY(id_zestaw)
        REFERENCES zestawy(id),

    CONSTRAINT unique_fiszki_student_zestaw
        UNIQUE(id_fiszki,id_student,id_zestaw)
    
)STRICT; 

CREATE TABLE zadania_otwarte (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    id_dzial INTEGER,
    id_tworcy INTEGER NOT NULL,
    tytul TEXT,
    zadanie TEXT NOT NULL, 

    data_zalozenia TEXT NOT NULL
    CHECK (datetime(data_zalozenia) IS NOT NULL),


    CONSTRAINT fk_tworca
        FOREIGN KEY (id_tworcy)
        REFERENCES users(id),

    CONSTRAINT fk_dzial
        FOREIGN KEY (id_dzial)
        REFERENCES dzialy(id)


) STRICT;

CREATE TABLE zadania_otwarte_student(
    id_zadanie_otwarte INTEGER NOT NULL, 
    id_student INTEGER NOT NULL, 
    id_zestaw INTEGER DEFAULT NULL,

    odpowiedz TEXT, 
    ocena REAL, 
    notatka TEXT,
    czy_oddane INTEGER NOT NULL
        --0- nie oddane, 1-oddane 
        CHECK (czy_oddane IN (0,1)),

    od_kiedy TEXT
        CHECK (od_kiedy IS NULL OR datetime(od_kiedy) IS NOT NULL),
    do_kiedy TEXT
        CHECK (do_kiedy IS NULL OR datetime(do_kiedy) IS NOT NULL),

    CONSTRAINT pk_zadania_otwarte_student 
        PRIMARY KEY(id_zadanie_otwarte,id_student),
    CONSTRAINT fk_zadanie_otwarte 
        FOREIGN KEY(id_zadanie_otwarte)
        REFERENCES zadania_otwarte(id),
    CONSTRAINT fk_id_student
        FOREIGN KEY(id_student)
        REFERENCES users(id),
    CONSTRAINT fk_zestaw
        FOREIGN KEY(id_zestaw)
        REFERENCES zestawy(id),

    CONSTRAINT unique_zadanie_otwarte_student_zestaw
        UNIQUE(id_zadanie_otwarte,id_student,id_zestaw)
) STRICT; 

ALTER TABLE zadania_otwarte MODIFY id_dzialu INTEGER NULL;

CREATE TABLE zadania_zamkniete (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_dzialu INTEGER, 
    id_tworcy INTEGER NOT NULL,

    data_zalozenia TEXT NOT NULL
    CHECK (datetime(data_zalozenia) IS NOT NULL),

    zadanie TEXT NOT NULL, 
    poprawna_odpowiedz TEXT NOT NULL, 
    niepoprawne_odpowiedzi TEXT NOT NULL, 

    CONSTRAINT fk_zadania_tworca
        FOREIGN KEY (id_tworcy)
        REFERENCES users(id),

    CONSTRAINT fk_zadania_dzial
        FOREIGN KEY (id_dzialu)
        REFERENCES dzialy(id)
)STRICT; 

CREATE TABLE zadania_zamkniete_student (
    id_zadanie_zamkniete INTEGER NOT NULL, 
    id_student INTEGER NOT NULL, 
    id_zestaw INTEGER DEFAULT NULL,
    
    odpowiedz_studenta TEXT, 
    ocena REAL, 
    notatka TEXT,
    czy_oddane INTEGER NOT NULL
        --0- nie oddane, 1-oddane 
        CHECK (czy_oddane IN (0,1)),

    od_kiedy TEXT
        CHECK (od_kiedy IS NULL OR datetime(od_kiedy) IS NOT NULL),
    do_kiedy TEXT
        CHECK (do_kiedy IS NULL OR datetime(do_kiedy) IS NOT NULL),

    CONSTRAINT pk_zadania_zamkniete_student 
        PRIMARY KEY (id_zadanie_zamkniete, id_student),

    CONSTRAINT fk_zadanie_zamkniete
        FOREIGN KEY (id_zadanie_zamkniete)
        REFERENCES zadania_zamkniete(id),

    CONSTRAINT fk_student 
        FOREIGN KEY (id_student)
        REFERENCES users(id),
    CONSTRAINT fk_zestaw
        FOREIGN KEY(id_zestaw)
        REFERENCES zestawy(id),

     CONSTRAINT unique_zadanie_zamkniete_student_zestaw
        UNIQUE(id_zadanie_zamkniete,id_student,id_zestaw)
)STRICT;

CREATE TABLE spotkania (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_spotkania TEXT NOT NULL
        CHECK (datetime(data_spotkania) IS NOT NULL),
    id_prowadzacy TEXT NOT NULL, 
    nazwa_spotkania TEXT NOT NULL, 
    CONSTRAINT fk_prowadzacy
        FOREIGN KEY (id_prowadzacy)
        REFERENCES users(id)
)STRICT; 

CREATE TABLE spotkania_student (
    id_student INTEGER NOT NULL, 
    id_spotkanie INTEGER NOT NULL, 
    CONSTRAINT pk_spotkania_student 
        PRIMARY KEY(id_student,id_spotkanie), 
    CONSTRAINT fk_id_student
        FOREIGN KEY(id_student)
        REFERENCES users(id), 
    CONSTRAINT fk_id_spotkanie
        FOREIGN KEY(id_spotkanie)
        REFERENCES spotkania(id)
)STRICT;

CREATE TABLE zestawy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nazwa TEXT NOT NULL,
    data_zalozenia TEXT NOT NULL 
        CHECK (datetime(data_zalozenia)IS NOT NULL),
    id_tworcy INTEGER NOT NULL,
    id_dzialu INTEGER DEFAULT NULL,

    CONSTRAINT unique_tworca_nazwa
        UNIQUE(id_tworcy,nazwa)
)STRICT;

CREATE TABLE zestawy_fiszki (
    id_zestaw INTEGER NOT NULL, 
    id_fiszki INTEGER NOT NULL, 
    CONSTRAINT pk_zestawy_fiszki
        PRIMARY KEY (id_zestaw, id_fiszki),
    CONSTRAINT fk_id_zestaw 
        FOREIGN KEY(id_zestaw)
        REFERENCES zestawy(id), 
    CONSTRAINT fk_id_fiszki 
        FOREIGN KEY(id_fiszki)
        REFERENCES zadania_fiszki(id)
)STRICT; 

CREATE TABLE zestawy_zadania_otwarte(
    id_zestaw INTEGER NOT NULL, 
    id_zadanie_otwarte INTEGER NOT NULL, 
    CONSTRAINT pk_zestawy_zadania_otwarte 
        PRIMARY KEY(id_zestaw, id_zadanie_otwarte),
    CONSTRAINT fk_zadanie_otwarte 
        FOREIGN KEY(id_zadanie_otwarte)
        REFERENCES zadania_otwarte(id),
    CONSTRAINT fk_zestaw 
            FOREIGN KEY(id_zestaw)
            REFERENCES zestawy(id)
)STRICT; 

CREATE TABLE zestawy_zadania_zamkniete(
    id_zestaw INTEGER NOT NULL, 
    id_zadanie_zamkniete INTEGER NOT NULL, 

    CONSTRAINT unique_zestaw_zadanie
        UNIQUE (id_zestaw,id_zadanie_zamkniete),

    CONSTRAINT pk_zestaw_zadanie_zamkniete 
        PRIMARY KEY(id_zestaw, id_zadanie_zamkniete), 
    CONSTRAINT fk_zestaw 
        FOREIGN KEY(id_zestaw)
        REFERENCES zestawy(id), 
    CONSTRAINT fk_zadanie_zamkniete 
        FOREIGN KEY(id_zadanie_zamkniete)
        REFERENCES zadania_zamkniete(id)
)STRICT; 

CREATE TABLE zestawy_grupy( 
    id_zestaw INTEGER NOT NULL,
    id_grupa INTEGER NOT NULL, 

    od_kiedy TEXT 
        CHECK (od_kiedy IS NULL OR datetime(od_kiedy) IS NOT NULL),
    do_kiedy TEXT 
        CHECK (do_kiedy IS NULL OR datetime(do_kiedy) IS NOT NULL),

    CONSTRAINT unique_zestaw_grupa 
        UNIQUE(id_zestaw,id_grupa),

    CONSTRAINT pk_zestaw_grupa 
        PRIMARY KEY(id_zestaw, id_grupa), 
    CONSTRAINT fk_zestaw
        FOREIGN KEY (id_zestaw)
        REFERENCES zestawy(id),
    CONSTRAINT fk_grupa 
        FOREIGN KEY(id_grupa)
        REFERENCES grupy(id)
)STRICT;
