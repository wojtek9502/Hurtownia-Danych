LOAD DATA
INFILE 'rok.csv'
BADFILE 'rok.bad'
DISCARDFILE 'rok.dsc'
REPLACE INTO TABLE Rok 
FIELDS TERMINATED BY "," TRAILING NULLCOLS
( id_roku, rok )