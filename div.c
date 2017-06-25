// unsigned long check_div(long a, long b,long c);
// Jeśli c równe zero to
// a)zwraca 1 jeśli a podzielne przez b
// b)zwraca 0 jeśli a niepodzielne przez b.
// Jeśli c różne od 0 to dzieli a przez liczby z zakresu 1..64
// i ustawia odpowiednio bity np. jeśli a podzielne przez 1 to
// najmłodszy bit równy 1, jeśli a niepodzielne przez 2 to kolejny bit równy 0 itd.

#include <stdio.h>

unsigned long check_div(long a, long b, long c);

int main(){
  unsigned long wyn1 = check_div(5, 5, 0);
  unsigned long wyn2 = check_div(5, 4, 0);
  unsigned long wyn3 = check_div(5, 4, 1);

  printf("%lu\n", wyn1);
  printf("%lu\n", wyn2);
  printf("%lu\n", wyn3);
}
