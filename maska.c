// //Oskar Siorek
// char* encode(char* buf, unsigned int mask, int operation, int character);
//
// Ogólnie trzeba było zrobić funkcję która zmieni cyfry w stringu (tylko te gdzie maska ma bit ustawiony na 1) w sposób zgodny z podaną operacją.
//
// Buf to był wskaźnik na stringa, w masce liczyło się tylko 10 najmłodszych bitów, każdy bit oznaczał czy wykonać operacją na danej cyfrze, np. jak tylko najmłodszy bit był 1 to zmieniamy tylko cyfrę 0. Operacja mogła wynosić od 0 do 3 (jak się potem w testach okazało może być jakakolwiek i wtedy powinna zostać obsłużona jako 0, nie pamiętam żeby na kolosie to mówił).
//
// Dla 0 nie robimy nic.
// Dla 1 usuwamy cyfrę
// Dla 2 robimy jak on to nazwał "transpozycję" - zamieniamy 0 na 9, 1 na 8, 2 na 7 itp
// Dla 3 podmieniamy cyfrę znakiem przekazanym jako 4 argument

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *encode1(char *buf, unsigned int mask, int operation, int character);

int main(){

	int mask = 1023;
	//int mask = 1023;
	int operation = 3;
	int character = 0;

	char *f = malloc(sizeof(char)*10);
	strcpy(f, "0a1433b11c2d0f0");

	char *d = malloc(sizeof(char)*10);
	strcpy(d, "0a1433b11c2d0f0");


	printf("string: %s \nencoded: %s \n", f, encode1(d, mask, operation, 'u'));
	//printf("string: %s \n", encode1(d, mask, 1 ,0));


}
