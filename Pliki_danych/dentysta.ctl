LOAD DATA
INFILE 'dentysta.csv'
BADFILE 'dentysta.bad'
DISCARDFILE 'dentysta.dsc'
REPLACE INTO TABLE Dentysta 
FIELDS TERMINATED BY "," TRAILING NULLCOLS
( id_dentysty, imie, nazwisko, adres, telefon, tytul, wynagrodzenie, godziny_pracy, data_przyjecia DATE "YYYY-MM-DD", data_zwolnienia DATE "YYYY-MM-DD" )