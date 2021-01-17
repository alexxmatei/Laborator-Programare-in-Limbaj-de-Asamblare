#include <stdio.h>
#include <inttypes.h>

/* inceput declarare prototipuri functii */
void adunNr32b (uint32_t x1, uint32_t x2, uint64_t * rez);
/* sfarsit declarare prototipuri functii */

int main()
{
	uint64_t rez = 0x0;
	uint32_t x1 = 0xFFFFFFFFu;
	uint32_t x2 = 0xFFFFFFFFu;

	adunNr32b (x1, x2, &rez);
	(void)printf("x1  = %I32u\n", x1);
	(void)printf("x1  = %I32u\n", x2);
	(void)printf("rez = %I64u", rez);

	return 0;
}

void adunNr32b (uint32_t x1, uint32_t x2, uint64_t * rez)
{
	*rez = (uint64_t)x1 + (uint64_t)x2;
}
