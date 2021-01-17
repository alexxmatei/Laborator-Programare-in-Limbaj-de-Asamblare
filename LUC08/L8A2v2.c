#include <stdio.h>

/* inceput declarare prototipuri functii */
void adunNr32b (unsigned long x1, unsigned long x2, unsigned long long * rez);
/* sfarsit declarare prototipuri functii */

int main()
{
  /* nu recunoaste tip de date pe 64 biti */
	unsigned long long rez = 0x0;
	unsigned long x1 = 0xFFFFFFFFu;
	unsigned long x2 = 0xFFFFFFFFu;

	adunNr32b (x1, x2, &rez);
	(void)printf("x1  = %lu\n", x1);
	(void)printf("x1  = %lu\n", x2);
	(void)printf("rez = %llu", rez);

	return 0;
}

void adunNr32b (unsigned long x1, unsigned long x2, unsigned long long * rez)
{
	*rez = (unsigned long long)x1 + (unsigned long long)x2;
}
