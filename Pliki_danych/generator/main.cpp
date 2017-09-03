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
       for(unsigned int i=0; i<p_ile_dent; i++)
       {
           fplik << i+1 << ",";
           fplik << generate_name("ek","ski","ka","ska") << ",";
           fplik << generate_address("ska") << ",";
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
       for(unsigned int i=0; i<p_ile_przychodni; i++)
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
       for(unsigned int i=0; i<p_ile_przychodni; i++)
       {
           for(unsigned int j=0; j<ile_gabinetow_w_kazdej; j++)
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

int main()
{
    int l_dent = 30;
    int l_dent_zw = 3;
    int l_przychodni = 10;
    int l_gabinetow = 0;
    int l_ubezpieczen = 1000; ///tyle ile pacjentow

    srand(time(NULL));
    generuj_dentystow(l_dent,l_dent_zw);
    generuj_przychodnie(l_przychodni);
    l_gabinetow = generuj_gabinety(l_przychodni);
    ///cout << endl << l_gabinetow;
    generuj_ubezpieczenia(l_ubezpieczen);
    return 0;
}
