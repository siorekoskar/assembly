//
// ; Czwartek 12.30: unsigned int check_tab(int* tab, int n, int* max)
// ;  Na wejsciu tablica n elementow z zewnatrz; sprawdzic elementy tablicy
// ;  pod katem występowania wrtosci od 0 do 63, nastepnie policzyc ile
// ;   razy ktorys tam element sie pojawil, np 0 pojawilo sie iles razy,
// ;   dwojka iles razy (zliczamy wystapienia), poprzez wskaznik przekazany
// ;    w trzecim argumencie zwrocic maksimum wystapień;
// ;  Funckja ma zwrocic wartosc w postaci 64 bitow - kazdy bit okresla
// ; wystapienie liczby odpowiadajacej temu bitowi, np jesli byla dwojka w
// ; tablicy to ma sie pojawic jedynka na pozycji 3, ostatni bit odpowiada za liczbe 63
// ; (wynik funkcji - ktore liczby sie pojawily, maks mowi o tym ile razy
// ; pojawila sie najczesciej wystepujaca liczba).

#include <stdio.h>
#include <stdlib.h>

unsigned int check_tab(int* tab, int n, int* max);

int main(){
  int *tab = malloc(sizeof(int)*8);
  tab[0] = 1;
  tab[1] = 1;
  tab[2] = 1;
  tab[3] = 2;
  tab[4] = 3;
  tab[5] = 3;
  tab[6] = 3;
  tab[7] = 5;
  int n = 8;
  int *max = malloc(sizeof(int));
   //*max = 5;

  printf("%d \n", check_tab(tab,n,max));
  printf("%d\n", *max);
}
