LOAD DATA
INFILE 'pacjent.csv'
BADFILE 'pacjent.bad'
DISCARDFILE 'pacjent.dsc'
REPLACE INTO TABLE Pacjent 
FIELDS TERMINATED BY "," TRAILING NULLCOLS
(id_pacjenta, id_ubezpieczenia, imie, nazwisko, data_urodzenia  DATE "YYYY-MM-DD", pesel, adres, telefon )