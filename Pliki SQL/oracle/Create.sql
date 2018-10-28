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
id_dentysty NUMBER CONSTRAINT Dentysta PRIMARY KEY,
imie VARCHAR2(200) NOT NULL,
nazwisko VARCHAR2(300) NOT NULL,
adres VARCHAR2(400) NOT NULL,
telefon VARCHAR2(22) NOT NULL,
tytul VARCHAR2(100) NOT NULL,
wynagrodzenie NUMBER NOT NULL,
godziny_pracy VARCHAR2(30) NOT NULL,
data_przyjecia DATE NOT NULL,
data_zwolnienia DATE
);


CREATE TABLE Przychodnia (
id_przychodni NUMBER CONSTRAINT Przychodnia PRIMARY KEY,
adres VARCHAR2(300) NOT NULL,
miasto VARCHAR2(150) NOT NULL,
telefon VARCHAR2(20) NOT NULL,
pacjentow_miesiecznie NUMBER
);

CREATE TABLE Gabinet (
id_gabinetu NUMBER CONSTRAINT Gabinet PRIMARY KEY,
id_przychodni NUMBER NOT NULL,
nr_pokoju NUMBER NOT NULL,
pietro NUMBER,

CONSTRAINT gabinet_przychodnia_fk FOREIGN KEY(id_przychodni) REFERENCES Przychodnia(id_przychodni)
);


CREATE TABLE Ubezpieczenie (
id_ubezpieczenia NUMBER CONSTRAINT Ubezpieczenie PRIMARY KEY,
nr_ubezpieczenia NUMBER NOT NULL,
oplacone VARCHAR2(3) NOT NULL,
wysokosc_skladki NUMBER NOT null
);

CREATE TABLE Pacjent (
id_pacjenta NUMBER CONSTRAINT Pacjent PRIMARY KEY,
id_ubezpieczenia NUMBER NOT NULL,
imie VARCHAR2(200) NOT NULL,
nazwisko VARCHAR2(300) NOT NULL,
data_urodzenia DATE NOT NULL,
pesel VARCHAR2(11) NOT NULL,
adres VARCHAR2(400) NOT NULL,
telefon VARCHAR2(20) NOT NULL,

CONSTRAINT pacjent_ubezpieczenie_fk FOREIGN KEY(id_ubezpieczenia) REFERENCES Ubezpieczenie(id_ubezpieczenia)
);


CREATE TABLE Rok (
id_roku NUMBER NOT NULL CONSTRAINT rok_pk PRIMARY KEY,
rok NUMBER NOT NULL
);

CREATE TABLE Miesiac (
id_miesiaca NUMBER NOT NULL CONSTRAINT miesiac_pk PRIMARY KEY,
id_roku NUMBER NOT NULL,
miesiac NUMBER NOT NULL,

CONSTRAINT miesiac_rok_fk FOREIGN KEY(id_roku) REFERENCES rok(id_roku)
);


CREATE TABLE Dzien (
id_dnia NUMBER NOT NULL CONSTRAINT dzien_pk PRIMARY KEY,
id_miesiaca NUMBER NOT NULL,
dzien NUMBER,

CONSTRAINT dzien_miesiac_fk FOREIGN KEY(id_miesiaca) REFERENCES miesiac(id_miesiaca)
);




CREATE TABLE Zabieg (
id_zabiegu NUMBER CONSTRAINT Zabieg PRIMARY KEY,
id_pacjenta NUMBER NOT NULL,
id_dentysty NUMBER NOT NULL,
id_gabinetu NUMBER NOT NULL,
id_dnia NUMBER NOT NULL,
nazwa_zabiegu VARCHAR2(300) NOT NULL,
cena NUMBER NOT NULL,
refundowany VARCHAR2(3) NOT NULL,

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
