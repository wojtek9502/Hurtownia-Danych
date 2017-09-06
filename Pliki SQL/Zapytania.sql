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


---w jakim gabinecie jaki dentysta wykonal jaki zabieg
SELECT  Nvl(To_Char(id_gabinetu),'SUMA GABINET') AS id_gabinetu,
        Nvl(To_Char(id_dentysty),'SUMA DENTYSTA') AS id_dentysty,
        Nvl(To_Char(nazwa_zabiegu),'WSZYSTKICH ZABIEGOW') AS  nazwa_zabiegu,
        Count(id_zabiegu) AS ilosc_obsluzonych
        FROM zabieg
GROUP BY cube(id_gabinetu,id_dentysty,nazwa_zabiegu)
ORDER BY id_gabinetu asc,id_dentysty asc,nazwa_zabiegu ASC;


---ile zarobil dany gabinet na jakim zabiegu
SELECT Nvl(To_Char(id_gabinetu),'SUMA GABINET') AS id_gabinetu,
       Nvl(To_Char(nazwa_zabiegu),'WSZYSTKICH ZABIEGOW') AS  nazwa_zabiegu,
       Sum(cena) AS suma_zysku
       FROM zabieg
GROUP BY cube(id_gabinetu,nazwa_zabiegu);



SELECT Count(id_dentysty) FROM dentysta;





---ktory dentysta zarobil najwiecej
SELECT id_dentysty,
       SUM(cena) AS ilosc_zabiegow,
       Rank() OVER (PARTITION BY NULL ORDER BY Sum(cena) desc) AS ranking
FROM zabieg
GROUP BY id_dentysty;


---w ktorym gabinecie bylo najwiecej pacjentow
SELECT id_gabinetu,
       Count(id_pacjenta) AS ilosc_pacjentow,
       Rank() OVER (PARTITION BY NULL ORDER BY Count(id_pacjenta)desc) AS ranking
FROM zabieg
GROUP BY id_gabinetu;
