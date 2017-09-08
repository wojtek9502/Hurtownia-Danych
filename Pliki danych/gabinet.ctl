LOAD DATA
INFILE 'gabinet.csv'
BADFILE 'gabinet.bad'
DISCARDFILE 'gabinet.dsc'
REPLACE INTO TABLE Gabinet 
FIELDS TERMINATED BY "," TRAILING NULLCOLS
(id_gabinetu, id_przychodni, nr_pokoju, pietro )