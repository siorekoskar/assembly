//---------------------------------------------------------------
// Test program - grupa C
//---------------------------------------------------------------

/*

unsigned long fun(unsigned long a, int b, int *pcs, int *count);

a = a63 .. a0
     64 ..  1

b = 1: suma xi = ai * (i+1)
    2: iloczyn xi = ai * (i+1)
    else : 0

pos = max i : ai =/= 0

count = sum 1 : ai =/= 0
        0: else

Funkcje dostaje 2 parametry wejściowe, 2 wyjściowe.
Pierwszy parametr to liczba 64 bitowa, ciąg bitów o wartosci 0 lub 1.
Jezeli 1 pojawia się na bicie najmniej znaczącym to interesuje nas 1.

a - jakie liczby
b - co z nimi zrobic, jak 1 to zsumowac, jak 2 to przez sb pomnorzyc, jak inna to zwracamy 0 (dla kazdego i suma/ mnozenie -> (ai+(i+1))) xi od 0 do 63, ich suma albo iloczyn

pcs -> pozycja ostatniego bitu w liczbie a róznego od 0, przy cyfrze 7 jest to 2 ( maksymalna pozycja na ktorym jedynka sie pojawiła)

count -> liczba bitow rownych 1

min musi zwrocic count i pos

Prawid³owe wyniki:
----------------------------------------------------------------------
Res = 0,   pos = 1/2* count = 2
Res = 3,   pos = 1/2  count = 2
Res = 0,   pos = 1/2  count = 2
Res = 0,   pos = 1/2  count = 2
Res = 15,  pos = 4/5  count = 5
Res = 120, pos = 4/5  count = 5
Res = 4,   pos = 3/4  count = 1
Res = 4,   pos = 3/4  count = 1

* - dopuszczalne dwie mo¿liwoci (numerowanie od 0 lub 1)

 */

#include <stdio.h>

unsigned long long int fun(unsigned long a, int b, int* pcs, int* count);

void main( void )
{
  int pos = -1;
  int count = -1;
  unsigned long long int result;

  result = fun(3,0,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(3,1,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(3,3,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(3,4,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(31,1,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(31,2,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(8,1,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);

  result = fun(8,2,&pos,&count);
  printf("Res = %lld, pos = %d count = %d\n", result, pos, count);
}
