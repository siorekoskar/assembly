// Funkcja otrzymuje tablice liczb poprzez wska ́znik tab, gdzie n to liczba element ́ow tablicy.
// Dodatkowo przekazywane  sa  dwa  wska ́zniki,  dla  ktorych  ma  byc  zarezerwowane
// miejsce  na  jeden  element  w  C.  Po  zakonczeniu
// dzialania funkcji, w pamieci wskazuwanej przez
// even count, ma znajdowac sie ilosc liczb parzystych wystepu-
// jacych  w  tablicy.   W neg count ma  sie  znalezc  ilosc  liczb  ujemnych  w  tablicy.
// I  teraz  wisienka  na  torcie.
// Funkcja po wykonaniu, ma zwrocic indeks elementu tablicy
// ktory posiada najwieksza liczbe jedynek w swojej
// reprezentacji binarnej.

#include <stdio.h>
#include <stdlib.h>

long long max_1_ind(long long * tab, long long n, long long *even_count, long long *neg_count);

int main(){
  //printf("%ld", sizeof(long long)); - 8
  long long tab [ 7 ] = {-1,2,-3,4,5,-6,-7};
  long long* a = malloc(sizeof(long long));
  long long* b = malloc(sizeof(long long));
  long long max = max_1_ind(tab, 7, a, b);
  printf("%lld, %lld, %lld\n", *a, *b, max);

}
