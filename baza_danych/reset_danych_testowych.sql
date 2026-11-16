PRAGMA foreign_key_check;
--^mozna sprawdzac czy istniejace dane sa poprawne 

PRAGMA foreign_keys = ON;

DELETE FROM spotkania_student;
DELETE FROM spotkania;
DELETE FROM zadania_fiszki_student;
DELETE FROM zadania_otwarte_student;
DELETE FROM zadania_zamkniete_student;
DELETE FROM zestawy_fiszki;
DELETE FROM zestawy_zadania_otwarte;
DELETE FROM zestawy_zadania_zamkniete; 
DELETE FROM zadania_fiszki;
DELETE FROM zadania_zamkniete;
DELETE FROM zadania_otwarte;

DELETE FROM zestawy_grupy;
DELETE FROM zestawy;
DELETE FROM grupy_dzialy;
DELETE FROM grupy_student;
DELETE FROM grupy;
DELETE FROM users;
DELETE FROM dzialy;
DELETE FROM przedmioty;
DELETE FROM sqlite_sequence;




INSERT INTO users (
    nauczyciel_student,
    imie,
    nazwisko,
    email,
    data_zalozenia,
    token_google
)
VALUES 
(1, 'Adam', 'Kowalski', 'adam@test.pl', CURRENT_TIMESTAMP,'temp'),
(1, 'Ewa', 'Kowalska', 'ewa@test.pl', CURRENT_TIMESTAMP,'temp1'),
(0, 'Malgorzata', 'Janowak', 'MJ@test.pl', CURRENT_TIMESTAMP,'temp2'),
(0, 'Barbara', 'Waszynska', 'BW@test.pl', CURRENT_TIMESTAMP,'temp3'),
(0, 'Joanna', 'Kowalska', 'JK@test.pl', CURRENT_TIMESTAMP,'temp4'),
(0, 'Elzbieta', 'Polakowska', 'EPm@test.pl', CURRENT_TIMESTAMP,'temp5'),
(0, 'Aleksandra', 'Nowakowska', 'AN@test.pl', CURRENT_TIMESTAMP,'temp6'),
(0, 'Teresa', 'Sowa', 'TS@test.pl', CURRENT_TIMESTAMP,'temp7'),
(0, 'Adam', 'Fraza', 'AF@test.pl', CURRENT_TIMESTAMP,'temp8'),
(0, 'Marytna', 'Kowalska', 'MK@test.pl', CURRENT_TIMESTAMP,'temp9'),
(0, 'Karolina', 'Szpakowska', 'KS@test.pl', CURRENT_TIMESTAMP,'temp10'),
(0, 'Iwona', 'Wita', 'IW@test.pl', CURRENT_TIMESTAMP,'temp11')
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
    id_przedmiot,
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

INSERT INTO grupy_student (
    id_grupa,
    id_student
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

INSERT INTO zadania_fiszki (
    id_dzial,
    id_tworcy,
    pojecie,
    definicja,
    data_zalozenia
)
VALUES
(7,1,'pies','dog' ,CURRENT_TIMESTAMP),
(7,1,'kot','cat' ,CURRENT_TIMESTAMP),
(7,2,'pies2','dog2' ,CURRENT_TIMESTAMP),
(7,2,'kot2','cat2' ,CURRENT_TIMESTAMP),
(8,1,'niebieski pies','bue dog' ,CURRENT_TIMESTAMP),
(8,1,'czerwony kot','red cat' ,CURRENT_TIMESTAMP),
(8,2,'niebieski pies2','blue dog2' ,CURRENT_TIMESTAMP),
(8,2,'czerwony kot2','red cat2' ,CURRENT_TIMESTAMP);

INSERT INTO zadania_otwarte(
    id_dzial, id_tworcy, zadanie,data_zalozenia
)
VALUES
(7,2,'Jak jest pies po angielsku?',CURRENT_TIMESTAMP),
(7,2,'Jak jest kot po angielsku?',CURRENT_TIMESTAMP),
(8,2,'Jak jest czerwony lis po angielsku?',CURRENT_TIMESTAMP),
(8,2,'Jak jest niebieska wydra po angielsku?',CURRENT_TIMESTAMP),
(7,1,'_Jak jest pies po angielsku?',CURRENT_TIMESTAMP),
(7,1,'_Jak jest kot po angielsku?',CURRENT_TIMESTAMP),
(8,1,'_Jak jest czerwony lis po angielsku?',CURRENT_TIMESTAMP),
(8,1,'_Jak jest niebieska wydra po angielsku?',CURRENT_TIMESTAMP);

INSERT INTO zadania_zamkniete( 
    id_dzialu,id_tworcy,data_zalozenia,zadanie,poprawna_odpowiedz,niepoprawne_odpowiedzi
)
VALUES
(7,2,CURRENT_TIMESTAMP,'Ktore slowo oznacza pies?','dog','cat;bird;snake'),
(7,2,CURRENT_TIMESTAMP,'Ktore slowo oznacza kot?','cat','dog;bird;snake'),
(7,1,CURRENT_TIMESTAMP,'2_Ktore slowo oznacza pies?','2_dog','2_cat;2_bird;2_snake'),
(7,1,CURRENT_TIMESTAMP,'2_Ktore slowo oznacza kot?','2_cat','2_dog;2_bird;2_snake'),
(8,2,CURRENT_TIMESTAMP,'Ktore slowo oznacza czerowny pies?','red dog','blue dog;red bird;pink snake'),
(8,2,CURRENT_TIMESTAMP,'Ktore slowo oznacza niebieski kot?','blue cat','purple dog;blue bird;red snake'),
(8,1,CURRENT_TIMESTAMP,'2_Ktore slowo oznacza czerowny pies?','2_red dog','2_blue dog;2_red bird;2_pink snake'),
(8,1,CURRENT_TIMESTAMP,'2_Ktore slowo oznacza niebieski kot?','2_blue cat','2_purple dog;2_blue bird;2_red snake');

INSERT INTO zestawy(
    id_tworcy,
    nazwa,
    data_zalozenia,
    id_dzialu
)
VALUES
((SELECT id FROM users WHERE imie='Ewa'and nazwisko='Kowalska'and nauczyciel_student=1),'zestaw modulo 1',CURRENT_TIMESTAMP,(SELECT id FROM dzialy WHERE nazwa='Module 1')),
((SELECT id FROM users WHERE imie='Ewa'and nazwisko='Kowalska' and nauczyciel_student=1),'zestaw modulo 2',CURRENT_TIMESTAMP,(SELECT id FROM dzialy WHERE nazwa='Module 2')),
((SELECT id FROM users WHERE imie='Adam'and nazwisko='Kowalski' and nauczyciel_student=1),'zestaw modulo 2',CURRENT_TIMESTAMP,(SELECT id FROM dzialy WHERE nazwa='Module 2')),
((SELECT id FROM users WHERE imie='Adam'and nazwisko='Kowalski' and nauczyciel_student=1),'zestaw mieszany',CURRENT_TIMESTAMP,null);

INSERT INTO zestawy_grupy(id_zestaw, id_grupa,od_kiedy,do_kiedy)
VALUES
((SELECT id FROM zestawy 
    WHERE nazwa='zestaw modulo 1'
    AND id_tworcy=(SELECT id from users  WHERE email='ewa@test.pl')),
(SELECT id FROM grupy 
    WHERE nazwa_grupy='Angielski_semestrI' 
    AND id_prowadzacy=(SELECT id from users WHERE email='ewa@test.pl')),
'2026-01-01 00:00:00',
'2027-01-01 00:00:00'),

((SELECT id FROM zestawy 
    WHERE nazwa='zestaw modulo 2'
    AND id_tworcy=(SELECT id from users WHERE email='ewa@test.pl')),
(SELECT id FROM grupy 
    WHERE nazwa_grupy='Angielski_semestrI' 
    AND id_prowadzacy=(SELECT id from users WHERE email='ewa@test.pl')),
'2026-01-01 00:00:00',
'2027-01-01 00:00:00'),

((SELECT id FROM zestawy 
    WHERE nazwa='zestaw modulo 2'
    AND id_tworcy=(SELECT id from users WHERE email='adam@test.pl')),
(SELECT id FROM grupy 
    WHERE nazwa_grupy='Angielski_semestrII' 
    AND id_prowadzacy=(SELECT id from users WHERE email='adam@test.pl')),
'2026-01-01 00:00:00',
'2027-01-01 00:00:00'),

((SELECT id FROM zestawy 
    WHERE nazwa='zestaw mieszany'
    AND id_tworcy=(SELECT id from users WHERE email='adam@test.pl')),
(SELECT id FROM grupy 
    WHERE nazwa_grupy='Angielski_semestrII' 
    AND id_prowadzacy=(SELECT id from users WHERE email='adam@test.pl')),
'2026-01-01 00:00:00',
'2027-01-01 00:00:00');

INSERT INTO zestawy_fiszki (id_fiszki,id_zestaw)
VALUES 
((SELECT id FROM zadania_fiszki WHERE pojecie='pies2' AND id_tworcy=2),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 1' AND id_tworcy=2)),
((SELECT id FROM zadania_fiszki WHERE pojecie='kot2' AND id_tworcy=2),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 1' AND id_tworcy=2)),

((SELECT id FROM zadania_fiszki WHERE pojecie='pies' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 2' AND id_tworcy=1)),
((SELECT id FROM zadania_fiszki WHERE pojecie='kot' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 2' AND id_tworcy=1)),

((SELECT id FROM zadania_fiszki WHERE pojecie='kot' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw mieszany' AND id_tworcy=1)),
((SELECT id FROM zadania_fiszki WHERE pojecie='czerwony kot' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw mieszany' AND id_tworcy=1)); 

INSERT INTO zestawy_zadania_otwarte (id_zadanie_otwarte,id_zestaw)
VALUES 
((SELECT id FROM zadania_otwarte WHERE zadanie='Jak jest pies po angielsku?' AND id_tworcy=2),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 1' AND id_tworcy=2)),
((SELECT id FROM zadania_otwarte WHERE zadanie='Jak jest kot po angielsku?' AND id_tworcy=2),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 1' AND id_tworcy=2)),

((SELECT id FROM zadania_otwarte WHERE zadanie='_Jak jest pies po angielsku?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 2' AND id_tworcy=1)),
((SELECT id FROM zadania_otwarte WHERE zadanie='_Jak jest kot po angielsku?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 2' AND id_tworcy=1)),

((SELECT id FROM zadania_otwarte WHERE zadanie='_Jak jest czerwony lis po angielsku?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw mieszany' AND id_tworcy=1)),
((SELECT id FROM zadania_otwarte WHERE zadanie='_Jak jest niebieska wydra po angielsku?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw mieszany' AND id_tworcy=1)); 

INSERT INTO zestawy_zadania_zamkniete (id_zadanie_zamkniete,id_zestaw)
VALUES 
((SELECT id FROM zadania_zamkniete WHERE zadanie='Ktore slowo oznacza pies?' AND id_tworcy=2),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 1' AND id_tworcy=2)),
((SELECT id FROM zadania_zamkniete WHERE zadanie='Ktore slowo oznacza kot?' AND id_tworcy=2),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 1' AND id_tworcy=2)),

((SELECT id FROM zadania_zamkniete WHERE zadanie='2_Ktore slowo oznacza pies?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 2' AND id_tworcy=1)),
((SELECT id FROM zadania_zamkniete WHERE zadanie='2_Ktore slowo oznacza kot?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw modulo 2' AND id_tworcy=1)),

((SELECT id FROM zadania_zamkniete WHERE zadanie='2_Ktore slowo oznacza czerowny pies?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw mieszany' AND id_tworcy=1)),
((SELECT id FROM zadania_zamkniete WHERE zadanie='2_Ktore slowo oznacza kot?' AND id_tworcy=1),(SELECT id FROM zestawy WHERE nazwa='zestaw mieszany' AND id_tworcy=1)); 

INSERT INTO spotkania(data_spotkania,id_prowadzacy,nazwa_spotkania)
VALUES 
('2027-01-01 00:00:00',2,'spotkanie nowo roczne'),
('2026-12-06 00:00:00',2,'mikolajki');

INSERT INTO spotkania_student(id_student,id_spotkanie)
VALUES 
(9,1),(9,2),(8,1),(3,2);