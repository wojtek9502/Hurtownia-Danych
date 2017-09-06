--------ile w danym dniu obsluzono pacjentow w danym gabinecie
SELECT Nvl(To_Char(id_dnia),'Wszystkie dni') AS id_dnia,
       Nvl(To_Char(id_gabinetu),'SUMA') AS id_gabinetu,
       Count(id_pacjenta) AS liczba_obluzonych
FROM zabieg
GROUP BY rollup (id_dnia, id_gabinetu);


---ile w danym dniu wykona³ zabiegów kazdy z dentystów
SELECT Nvl(To_Char(id_dnia),'Wszystkie dni') AS id_dnia,
       Nvl(To_Char(id_dentysty),'SUMA') AS id_dentysty,
       Count(id_zabiegu) AS liczba_zabiegow
FROM zabieg
GROUP BY rollup (id_dnia, id_dentysty);


