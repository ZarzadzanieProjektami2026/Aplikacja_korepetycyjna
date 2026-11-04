DELETE FROM grupy_dzialy;
DELETE FROM grupy_uzytkownicy;
DELETE FROM zadania;

DELETE FROM grupy;
DELETE FROM users;
DELETE FROM dzialy;

DELETE FROM przedmioty;
DELETE FROM sqlite_sequence;


--WAZNE! przy inicjalizacji polaczenia z BD
PRAGMA foreign_keys = ON;
--^uruchomic przy laczeniu
PRAGMA foreign_keys;
--^powinno w konsoli byc 1
PRAGMA foreign_key_check;
--^mozna sprawdzac czy istniejace dane sa poprawne 

INSERT INTO users (
    nauczyciel_student,
    imie,
    nazwisko,
    email,
    data_zalozenia
)
VALUES 
(1, 'Adam', 'Kowalski', 'adam@test.pl', CURRENT_TIMESTAMP),
(1, 'Ewa', 'Kowalska', 'ewa@test.pl', CURRENT_TIMESTAMP),
(0, 'Malgorzata', 'Janowak', 'MJ@test.pl', CURRENT_TIMESTAMP),
(0, 'Barbara', 'Waszynska', 'BW@test.pl', CURRENT_TIMESTAMP),
(0, 'Joanna', 'Kowalska', 'JK@test.pl', CURRENT_TIMESTAMP),
(0, 'Elzbieta', 'Polakowska', 'EPm@test.pl', CURRENT_TIMESTAMP),
(0, 'Aleksandra', 'Nowakowska', 'AN@test.pl', CURRENT_TIMESTAMP),
(0, 'Teresa', 'Sowa', 'TS@test.pl', CURRENT_TIMESTAMP),
(0, 'Adam', 'Fraza', 'AF@test.pl', CURRENT_TIMESTAMP),
(0, 'Marytna', 'Kowalska', 'MK@test.pl', CURRENT_TIMESTAMP),
(0, 'Karolina', 'Szpakowska', 'KS@test.pl', CURRENT_TIMESTAMP),
(0, 'Iwona', 'Wita', 'IW@test.pl', CURRENT_TIMESTAMP)
;
INSERT INTO przedmioty (
    nazwa
)
VALUES  ('Matematyka'),
('Geografia'),
('Angielski'),
('Polski'),
('Fizyka');

INSERT INTO grupy (
    id_prowadzacy,
    nazwa_grupy
)
VALUES  (1,'Matematyka2026'),
(2,'Fizyka_2026'),
(2,'Angielski_semestrI'),
(1,'Angielski_semestrII');

INSERT INTO dzialy (
    id_przedmiotu,
    id_parent_dzial,
    nazwa
)
VALUES  (1,NULL,'Funkcja Kwadratowa'),
(2,NULL,'Zroznicowanie srodowiska przyrodniczego Polski'),
(2,NULL,'Ludnosc i urbanizacja w Polsce'),
(2,NULL,'Gospodarka Polski'),
(1,NULL,'Wielomiany'),
(1,NULL,'Funkcje Wymierne'),
(3,NULL,'Module 1'),
(3,NULL,'Module 2'),
(1,1,'Wykres funkcji'),
(1,1,'Postac Kanoniczna'),
(1,1,'Nierownosci kwadratowe'),
(2,3,'Polozenie i obszar Polski'),
(2,3,'Budowa geologiczna Polski'),
(2,3,'Surowce mineralne'),
(2,3,'Klimat Polski'),
(2,4,'Warunki rozwoju rolnictwa w Polsce'),
(2,4,'Rolnictwo ekologiczne w Polsce'),
(1,5,'Mnozenie wielomianow'),
(1,5,'Rownania wielomianowe'),
(1,5,'Wielomiany-zastosowania');

INSERT INTO grupy_dzialy (
    id_grupa,
    id_dzial
)
VALUES
(1,1),
(1,18),
(1,19),
(3,7),
(4,8);

INSERT INTO grupy_uzytkownicy (
    id_grupa,
    id_uzytkownik
)
VALUES
(1,10),
(1,12),
(1,9),
(1,6),
(1,3),
(1,4),
(1,5),

(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(2,8),

(3,2),
(3,3),
(3,12),

(4,6),
(4,7),
(4,8);

INSERT INTO zadania (
    id_dzialu,
    id_tworcy,
    nazwa,
    zadanie,
    od_kiedy,
    do_kiedy,
    data_zalozenia
)
VALUES
(13,1,'przyklad','text', CURRENT_TIMESTAMP, NULL,CURRENT_TIMESTAMP),
(13,1,'przyklad2','text', '2026-04-10 10:00:00', '2026-04-12 12:00:00',CURRENT_TIMESTAMP);
