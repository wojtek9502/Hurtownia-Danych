DROP TABLE Zabieg CASCADE CONSTRAINTS;
DROP TABLE Dzien CASCADE CONSTRAINTS;
DROP TABLE Miesiac CASCADE CONSTRAINTS;
DROP TABLE Rok CASCADE CONSTRAINTS;
DROP TABLE Pacjent CASCADE CONSTRAINTS;
DROP TABLE Ubezpieczenie CASCADE CONSTRAINTS;
DROP TABLE Gabinet CASCADE CONSTRAINTS;
DROP TABLE Przychodnia CASCADE CONSTRAINTS;
DROP TABLE Dentysta CASCADE CONSTRAINTS;

CREATE TABLE Dentysta (
id_dentysty BIGINT CONSTRAINT dentysta_pk PRIMARY KEY,
imie VARCHAR(200) NOT NULL,
nazwisko VARCHAR(300) NOT NULL,
adres VARCHAR(400) NOT NULL,
telefon VARCHAR(22) NOT NULL,
tytul VARCHAR(100) NOT NULL,
wynagrodzenie BIGINT NOT NULL,
godziny_pracy VARCHAR(30) NOT NULL,
data_przyjecia DATETIME NOT NULL,
data_zwolnienia DATETIME
);


CREATE TABLE Przychodnia (
id_przychodni BIGINT CONSTRAINT przychodnia_pk PRIMARY KEY,
adres VARCHAR(300) NOT NULL,
miasto VARCHAR(150) NOT NULL,
telefon VARCHAR(20) NOT NULL,
pacjentow_miesiecznie BIGINT
);

CREATE TABLE Gabinet (
id_gabinetu BIGINT CONSTRAINT gabinet_pk PRIMARY KEY,
id_przychodni BIGINT NOT NULL,
nr_pokoju BIGINT NOT NULL,
pietro BIGINT,

CONSTRAINT gabinet_przychodnia_fk FOREIGN KEY(id_przychodni) REFERENCES Przychodnia(id_przychodni)
);


CREATE TABLE Ubezpieczenie (
id_ubezpieczenia BIGINT CONSTRAINT ubezpieczenie_pk PRIMARY KEY,
nr_ubezpieczenia BIGINT NOT NULL,
oplacone VARCHAR(3) NOT NULL,
wysokosc_skladki BIGINT NOT null
);

CREATE TABLE Pacjent (
id_pacjenta BIGINT CONSTRAINT pacjent_pk PRIMARY KEY,
id_ubezpieczenia BIGINT NOT NULL,
imie VARCHAR(200) NOT NULL,
nazwisko VARCHAR(300) NOT NULL,
data_urodzenia DATETIME NOT NULL,
pesel VARCHAR(11) NOT NULL,
adres VARCHAR(400) NOT NULL,
telefon VARCHAR(20) NOT NULL,

CONSTRAINT pacjent_ubezpieczenie_fk FOREIGN KEY(id_ubezpieczenia) REFERENCES Ubezpieczenie(id_ubezpieczenia)
);


CREATE TABLE Rok (
id_roku BIGINT NOT NULL CONSTRAINT rok_pk PRIMARY KEY,
rok BIGINT NOT NULL
);

CREATE TABLE Miesiac (
id_miesiaca BIGINT NOT NULL CONSTRAINT miesiac_pk PRIMARY KEY,
id_roku BIGINT NOT NULL,
miesiac BIGINT NOT NULL,

CONSTRAINT miesiac_rok_fk FOREIGN KEY(id_roku) REFERENCES rok(id_roku)
);


CREATE TABLE Dzien (
id_dnia BIGINT NOT NULL CONSTRAINT dzien_pk PRIMARY KEY,
id_miesiaca BIGINT NOT NULL,
dzien BIGINT,

CONSTRAINT dzien_miesiac_fk FOREIGN KEY(id_miesiaca) REFERENCES miesiac(id_miesiaca)
);




CREATE TABLE Zabieg (
id_zabiegu BIGINT CONSTRAINT zabieg_pk PRIMARY KEY,
id_pacjenta BIGINT NOT NULL,
id_dentysty BIGINT NOT NULL,
id_gabinetu BIGINT NOT NULL,
id_dnia BIGINT NOT NULL,
nazwa_zabiegu VARCHAR(300) NOT NULL,
cena BIGINT NOT NULL,
refundowany VARCHAR(3) NOT NULL,

CONSTRAINT zabieg_pacjent_fk FOREIGN KEY(id_pacjenta) REFERENCES Pacjent(id_pacjenta),
CONSTRAINT zabieg_dentysta_fk FOREIGN KEY(id_dentysty) REFERENCES Dentysta(id_dentysty),
CONSTRAINT zabieg_gabinet_fk FOREIGN KEY(id_gabinetu) REFERENCES Gabinet(id_gabinetu),
CONSTRAINT zabieg_dzien_fk FOREIGN KEY(id_dnia) REFERENCES Dzien(id_dnia)
);

SELECT * FROM zabieg;
SELECT * FROM dzien;
SELECT * FROM miesiac;
SELECT * FROM rok;
SELECT * FROM pacjent;
SELECT * FROM ubezpieczenie;
SELECT * FROM gabinet;
SELECT * FROM przychodnia;
SELECT * FROM dentysta;

