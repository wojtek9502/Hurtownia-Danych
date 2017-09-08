SELECT Nvl(To_Char(id_dnia),'Wszystkie dni') AS id_dnia,
       Nvl(To_Char(id_gabinetu),'SUMA') AS id_gabinetu,
       Count(id_pacjenta) AS liczba_obluzonych
FROM zabieg
GROUP BY rollup (id_dnia, id_gabinetu);


SELECT Nvl(To_Char(id_dnia),'Wszystkie dni') AS id_dnia,
       Nvl(To_Char(id_dentysty),'SUMA') AS id_dentysty,
       Count(id_zabiegu) AS liczba_zabiegow
FROM zabieg
GROUP BY rollup (id_dnia, id_dentysty);


SELECT  Nvl(To_Char(id_gabinetu),'SUMA GABINET') AS id_gabinetu,
        Nvl(To_Char(id_dentysty),'SUMA DENTYSTA') AS id_dentysty,
        Nvl(To_Char(nazwa_zabiegu),'WSZYSTKICH ZABIEGOW') AS  nazwa_zabiegu,
        Count(id_zabiegu) AS ilosc_zabiegow
        FROM zabieg
GROUP BY cube(id_gabinetu,id_dentysty,nazwa_zabiegu)
ORDER BY id_gabinetu asc,id_dentysty asc,nazwa_zabiegu ASC;


SELECT Nvl(To_Char(id_gabinetu),'SUMA GABINET') AS id_gabinetu,
       Nvl(To_Char(nazwa_zabiegu),'WSZYSTKICH ZABIEGOW') AS  nazwa_zabiegu,
       Sum(cena) AS suma_zysku
       FROM zabieg
GROUP BY cube(id_gabinetu,nazwa_zabiegu);



SELECT  Nvl(To_Char(id_gabinetu),'SUMA GABINET') AS id_gabinetu,
        Nvl(To_Char(id_dnia),'SUMA DNI') AS id_dnia,
        Sum(cena) AS suma_zysku
       FROM zabieg
GROUP BY Grouping sets ((id_gabinetu,id_dnia), id_dnia ,())
ORDER BY id_gabinetu desc, id_dnia;



SELECT Nvl(To_Char(id_dentysty),'SUMA DENTYSTA') AS id_dentysty,
       Nvl(To_Char(id_dnia),'SUMA DNI') AS id_dnia,
       Nvl(To_Char(nazwa_zabiegu),'WSZYSTKICH ZABIEGOW') AS  nazwa_zabiegu,
       Count(id_zabiegu) AS liczba_zabiegow
       FROM zabieg
GROUP BY Grouping sets ((id_dentysty,id_dnia,nazwa_zabiegu),(id_dentysty, nazwa_zabiegu), id_dnia ,())
ORDER BY id_dentysty desc , id_dnia;


SELECT distinct id_gabinetu, id_dnia,
Sum(cena) OVER(
                    PARTITION BY id_gabinetu
                    ORDER BY id_dnia
                    RANGE BETWEEN unbounded preceding  AND CURRENT ROW
                    ) AS zarobek
FROM zabieg
WHERE id_dnia <29
ORDER BY id_gabinetu;


SELECT distinct id_gabinetu, id_dentysty, id_pacjenta, id_dnia,
Count(id_zabiegu) OVER(
                    PARTITION BY id_gabinetu,id_dentysty
                    ORDER BY id_dnia
                    RANGE BETWEEN unbounded preceding  AND CURRENT ROW
                    ) AS liczba_wykonanych_zabiegow
FROM zabieg
ORDER BY id_gabinetu,id_dentysty;


SELECT id_dentysty,
       SUM() AS ilosc_zabiegow,
       Rank() OVER (PARTITION BY NULL ORDER BY Sum(cena) desc) AS ranking
FROM zabieg
GROUP BY id_dentysty;


SELECT id_gabinetu,
       Count(id_pacjenta) AS ilosc_pacjentow,
       Rank() OVER (PARTITION BY NULL ORDER BY Count(id_pacjenta)desc) AS ranking
FROM zabieg
GROUP BY id_gabinetu;
