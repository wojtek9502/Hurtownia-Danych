LOAD DATA
INFILE 'ubezpieczenie.csv'
BADFILE 'ubezpieczenie.bad'
DISCARDFILE 'ubezpieczenie.dsc'
REPLACE INTO TABLE Ubezpieczenie 
FIELDS TERMINATED BY "," TRAILING NULLCOLS
(id_ubezpieczenia, nr_ubezpieczenia, oplacone, wysokosc_skladki )