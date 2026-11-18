--PRZYKLAD: wypisywanie dzialow przyznaczonych do grupy o id 1
SELECT D.nazwa, GG.nazwa_grupy FROM dzialy D 
INNER JOIN grupy_dzialy G ON G.id_dzial=D.id
INNER JOIN grupy GG ON GG.id=G.id_grupa
WHERE id_grupa = 1 --z grupy_dzialy

--przyklad wypisywania grup i ich dzialow 
SELECT GG.nazwa_grupy, D.nazwa FROM dzialy D 
INNER JOIN grupy_dzialy G ON G.id_dzial=D.id
INNER JOIN grupy GG ON GG.id=G.id_grupa

--wypisanie wszyskich studentow ktorzy ucza sie przedmiotu angielskiego
SELECT U.imie, G.nazwa_grupy FROM users U
INNER JOIN grupy_student GS ON GS.id_student=U.id
INNER JOIN grupy G ON G.id=GS.id_grupa
INNER JOIN grupy_dzialy GD ON GD.id_grupa=G.id
INNER JOIN dzialy D ON D.id=GD.id_dzial
INNER JOIN przedmioty P ON D.id_przedmiot=P.id
WHERE P.nazwa='Angielski'

--PRZYKLAD DODAWANIA ZESTAWU DO GRUPY
INSERT INTO zestawy_grupy(id_zestaw, id_grupa,od_kiedy,do_kiedy)
VALUES
((SELECT id FROM zestawy 
    WHERE nazwa='zestaw modulo 1'
    AND id_tworcy=(SELECT id from users  WHERE email='ewa@test.pl')),
(SELECT id FROM grupy 
    WHERE nazwa_grupy='Angielski_semestrI' 
    AND id_prowadzacy=(SELECT id from users WHERE email='ewa@test.pl')),
'2026-01-01 00:00:00',
'2027-01-01 00:00:00');
--PRZYDZIELENIE ZADAN DO UCZNIOW NA POSTAWIE ZESTAWU
-- (iteracja po wszyskich uczniach w grupie i przydzielanie im kolejno fiszki/zadania otwarte/zakmniete z tagiem zestawu)
-- (columna 'zestaw' jest wazna w razie gdy student dostaje to samo zadanie w kilku roznych zestawach)


