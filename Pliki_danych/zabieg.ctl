LOAD DATA
INFILE 'zabieg.csv'
BADFILE 'zabieg.bad'
DISCARDFILE 'zabieg.dsc'
REPLACE INTO TABLE Zabieg 
FIELDS TERMINATED BY "," TRAILING NULLCOLS
(id_zabiegu, id_pacjenta, id_dentysty, id_gabinetu, id_dnia, nazwa_zabiegu, cena, refundowany )