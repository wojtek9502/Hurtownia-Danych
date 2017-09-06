#include <iostream>
#include "generate_lib.h"
#include <fstream>
#include <sstream>

using namespace std;



void generuj_dentystow(int p_ile_dent, int p_ile_zw_dent)
{
    string sciezka = "..\\dentysta.csv";
    fstream fplik;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);
    if(fplik.good()==true)
    {
       for( int i=0; i<p_ile_dent; i++)
       {
           fplik << i+1 << ",";
           fplik << generate_name("ek","ski","ka","ska") << ",";
           fplik << generate_address("ska") << ",";
           fplik << generate_phone_number() << ",";
           fplik << generate_title() << ",";
           fplik << ( (rand()%3)+2 ) * 1000 << ","; ///pensja
           fplik << generate_hours() << ",";
           fplik << generate_date(2006,2015) << ",";
           ///czasem ma date zwolnienia czasem nie
           if (i<p_ile_zw_dent)
              fplik << generate_date(2016,2017);

           fplik << ",";


           fplik << endl; ///koniec rekordu
       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }
}

void generuj_przychodnie(int p_ile_przychodni)
{
    string sciezka = "..\\przychodnia.csv";
    fstream fplik;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);
    if(fplik.good()==true)
    {
       for(int i=0; i<p_ile_przychodni; i++)
       {
           fplik << i+1 << ",";
           fplik << generate_address("ska") << ",";
           fplik << "Kielce" << ",";
           fplik << generate_phone_number() << ",";
           fplik << ( (rand()%3)+2 ) * 15 << ","; ///pacjentów miesiecznie
           fplik << endl; ///koniec rekordu
       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }
}

int generuj_gabinety(int p_ile_przychodni)
{
    string sciezka = "..\\gabinet.csv";
    fstream fplik;
    int ile_gabinetow_w_kazdej = 5;             ///ile gabinetow w kazdej przychodni
    int gabinety_counter=0;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);

    if(fplik.good()==true)
    {
       for(int i=0; i<p_ile_przychodni; i++)
       {
           for(int j=0; j<ile_gabinetow_w_kazdej; j++)
           {
               fplik << ++gabinety_counter << ",";    ///nr gabinetu
               fplik << i+1 << ",";                  ///nr przychodni
               fplik << (rand()%100)+1 << ",";        ///nr pokoju
               fplik << (rand()%3)+1;                 ///nr pietra
               fplik << endl; ///koniec rekordu
           }

       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
       return gabinety_counter;

    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
       return -1;
    }
}

void generuj_ubezpieczenia(int p_ile_ubezpieczen)
{
    string sciezka = "..\\ubezpieczenie.csv";
    fstream fplik;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);


    if(fplik.good()==true)
    {
       for(int i=0; i<p_ile_ubezpieczen; i++)
       {
          fplik << i+1 << ",";
          fplik << 1000000+i << ",";

          ///czy ubezpieczony
          if(i<10)
            fplik << "NIE";
          else
            fplik << "TAK";
          fplik << ",";

          fplik << ( ( (rand()%3)+2 ) * 30 ) + rand()%9 << ",";  ///skladki miesiecznie
          fplik << endl;            ///koniec rekordu
       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }
}


void generuj_pacjentow(int p_ile_pacjentow)
{
    string sciezka = "..\\pacjent.csv";
    fstream fplik;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);


    if(fplik.good()==true)
    {
       for(int i=0; i<p_ile_pacjentow; i++)
       {
          fplik << i+1 << ",";
          fplik << i+1 << ",";
          fplik << generate_name("ek","ski","ka","ska") << ",";
          fplik << generate_date(1939,2010) << ",";
          fplik << generate_pesel()  << ",";
          fplik << generate_address("ska") << ",";
          fplik << generate_phone_number();
          fplik << endl;            ///koniec rekordu
       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }
}

int generuj_lata(int rok_poczatkowy, int ile_lat)
{
    string sciezka = "..\\rok.csv";
    fstream fplik;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);
    if(fplik.good()==true)
    {
       for(int i=0; i<ile_lat; i++)
       {
           fplik << i+1 << ",";
           fplik << rok_poczatkowy;

           fplik << endl; ///koniec rekordu
           rok_poczatkowy++;
       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
       return ile_lat;
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }
}

int generuj_miesiace(int ile_lat)
{
    string sciezka = "..\\miesiac.csv";
    fstream fplik;
    int id_roku=1;
    int nr_miesiaca=1;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);
    if(fplik.good()==true)
    {
       for(int i=0; i<ile_lat*12; i++)
       {
           fplik << i+1 << ",";

           if(nr_miesiaca>12)
           {
              nr_miesiaca=1;
              id_roku++;
           }

           fplik << id_roku << ",";
           fplik << nr_miesiaca;
           nr_miesiaca++;

           fplik << endl; ///koniec rekordu
       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
       return ile_lat*12;
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }

}


unsigned int generuj_dni(int ile_miesiecy)
{
    string sciezka = "..\\dzien.csv";
    fstream fplik;
    int id_miesiaca=1;
    int nr_dnia=1;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);
    if(fplik.good()==true)
    {
       for(int i=0; i<ile_miesiecy*28; i++)
       {
           fplik << i+1 << ",";

           if(nr_dnia>28)
           {
              nr_dnia=1;
              id_miesiaca++;
           }

           fplik << id_miesiaca << ",";
           fplik << nr_dnia;
           nr_dnia++;

           fplik << endl; ///koniec rekordu
       }
       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
       return ile_miesiecy*28;
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }

}

void generuj_zabiegi(int l_pacjentow, int l_dent, int l_dent_zw, int l_gabinetow, int l_dni)
{
    string sciezka = "..\\zabieg.csv";
    fstream fplik;
    fplik.open(sciezka.c_str(),ios::in | ios::out | ios::trunc);
    int id=0;
    int dent_count = 0;
    string lista_zabiegow[] = {"Przeglad uzebienia", "Usuniecie zeba jednokorzeniowego", "Usuniecie zeba mlecznego", "Zdjecie panoramiczne",
                                "Wypelnienie zeba", "Proteza calkowita", "Wszczepienie implantu", "Piaskowanie", "Fluoryzacja", "Usuniecie zeba" };



    if(fplik.good()==true)
    {
        ///w kazdym dniu (365) po 10 pacjentow w kazdym gabinecie
        for(int i=0; i<l_dni; i++)
            {
                for(int k=0; k<l_gabinetow; k++)
                {
                  dent_count++;
                    for(int j=0; j<10; j++) ///10 pacjentow na kazdy gabinet
                    {
                        fplik << ++id << ",";
                        fplik << (rand()%l_pacjentow)+1 << ","; ///id pacjenta
                        fplik << ((dent_count)%27)+1 << ","; ///id dentysty
                        fplik << k+1 << ","; ///id gabinetu
                        fplik << i+1 << ","; ///id dnia


                        ///nazwa zabiegu
                        int r = rand()%10;
                        fplik << lista_zabiegow[r] << ",";

                        ///cena
                        fplik << ( (rand()%3)+2 ) * 100 << ",";

                        ///czy ubezpieczony
                        if(rand()%10==0)
                            fplik << "NIE";
                        else
                            fplik << "TAK";
                        fplik << ",";

                        fplik << endl; ///koniec rekordu
                    }
                }
            }

       cout << "Dane wygenerowane do pliku " << sciezka.c_str() << endl;
       fplik.close();
    }
    else
    {
       ///gdyby nie bylo pliku to utworzy
       ofstream utworz_plik;
       utworz_plik.open(sciezka.c_str());
       utworz_plik.close();
       cout << "Nie ma pliku lub jest otwarty w innym programie";
    }
}




int main()
{
    int l_dent = 30;
    int l_dent_zw = 3;
    int l_przychodni = 10;
    int l_gabinetow = 0;
    int l_ubezpieczen = 1000; ///tyle ile pacjentow
    int l_pacjentow = l_ubezpieczen;

    srand(time(NULL));
    generuj_dentystow(l_dent,l_dent_zw);
    generuj_przychodnie(l_przychodni);
    l_gabinetow = generuj_gabinety(l_przychodni);
    ///cout << endl << l_gabinetow;
    generuj_ubezpieczenia(l_ubezpieczen);
    generuj_pacjentow(l_pacjentow);

    int l_lat = generuj_lata(2012,1);
    int l_miesiecy = generuj_miesiace(l_lat);
    int l_dni = generuj_dni(l_miesiecy);
    generuj_zabiegi(l_pacjentow,l_dent,l_dent_zw,l_gabinetow,30);

    return 0;
}
