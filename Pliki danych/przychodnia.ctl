LOAD DATA
INFILE 'przychodnia.csv'
BADFILE 'przychodnia.bad'
DISCARDFILE 'przychodnia.dsc'
REPLACE INTO TABLE Przychodnia 
FIELDS TERMINATED BY "," TRAILING NULLCOLS
( id_przychodni, adres, miasto, telefon, pacjentow_miesiecznie )