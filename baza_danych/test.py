from contextlib import contextmanager
import sqlite3

# !! oczywiscie trzeba u siebie ustawic prawidlowa scieszke !!
DB_PATH = r'C:\Users\zuzan\ProgramowanieGier\Aplikacja_korepetycyjna\baza_danych\baza_danych.db' 
@contextmanager
def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.execute("PRAGMA foreign_keys = ON")
    try:
        yield conn
        conn.commit()
    except Exception:
        conn.rollback()
        raise
    finally:
        conn.close()

def przyznacz_zestaw_do_grupy(_zestaw_id, _grupa_id):
    with get_db_connection() as conn: 
        cursor = conn.cursor()
        id_tworcy_zestawu=cursor.execute("SELECT id_tworcy FROM zestawy WHERE id=?",_zestaw_id)
        id_tworcy_grupy=cursor.execute("SELECT id_prowadzacy FROM grupy WHERE id=?",_grupa_id)
        if (id_tworcy_zestawu==id_tworcy_grupy):
            #przylaczenie zestawu do grupy
            if cursor.execute("SELECT id_zestaw FROM zestawy_grupy WHERE id_zestaw=? AND id_grupa=?",(_zestaw_id,_grupa_id)) is None:
                cursor.execute("INSERT INTO zestawy_grupy(id_zestaw, id_grupa) VALUES(?,?)",(_zestaw_id,_grupa_id))
            else: print("juz istnieje polaczenie zestawu i grupy")
            #znalezienie studentow nalezacych do grupy
            cursor.execute("SELECT GS.id_student FROM grupy_student GS " \
                            "WHERE GS.id_grupa=?" ,(_grupa_id))
            studenci=cursor.fetchall()
            #znalezienie zadan i przydzielenie ich studentom
            cursor.execute("SELECT ZF.id_fiszki FROM zestawy_fiszki ZF WHERE ZF.id_zestaw=?" ,(_zestaw_id))
            fiszki=cursor.fetchall()
            cursor.execute("SELECT ZO.id_zadanie_otwarte FROM zestawy_zadania_otwarte ZO WHERE ZO.id_zestaw=?" ,(_zestaw_id))
            zadania_o=cursor.fetchall()
            cursor.execute("SELECT ZZ.id_zadanie_zamkniete FROM zestawy_zadania_zamkniete ZZ WHERE ZZ.id_zestaw=?" ,(_zestaw_id))
            zadania_z=cursor.fetchall()
                        
            for s in studenci:
                for f in fiszki:
                    cursor.execute("INSERT OR IGNORE INTO zadania_fiszki_student(id_fiszki, id_student,id_zestaw) VALUES(?,?,?)",(f[0],s[0],_zestaw_id))
                for zo in zadania_o:
                    cursor.execute("INSERT OR IGNORE INTO zadania_otwarte_student(id_zadanie_otwarte, id_student,id_zestaw,czy_oddane) VALUES(?,?,?,?)",(zo[0],s[0],_zestaw_id,0))
                for zz in zadania_z:
                    cursor.execute("INSERT OR IGNORE INTO zadania_zamkniete_student(id_zadanie_zamkniete, id_student,id_zestaw,czy_oddane) VALUES(?,?,?,?)",(zz[0],s[0],_zestaw_id,0))
        else: (print("tworca zestawu nie jest prowadzacym grupy"))
        cursor.close()


def reset_dane():
    with open(r'baza_danych\reset_danych_testowych.sql') as sql_file:
        sql_script = sql_file.read()
    with get_db_connection() as conn:
        cursor=conn.cursor()
        cursor.executescript(sql_script)
        cursor.execute('SELECT id_zestaw, id_grupa  FROM zestawy_grupy')
        temp=cursor.fetchall()
        for t in temp: 
            przyznacz_zestaw_do_grupy(str(t[0]),str(t[1]))

def main():
    reset_dane()

if __name__ == "__main__":
    main()