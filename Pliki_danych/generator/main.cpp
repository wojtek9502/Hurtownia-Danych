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


int main()
{
    int l_dent = 30;
    int l_dent_zw = 3;

    srand(time(NULL));
    generuj_dentystow(l_dent,l_dent_zw);
    return 0;
}
