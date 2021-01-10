#include <stdio.h>
#include <stdlib.h>
extern int adun_asm(void);
extern int var_asm;
int var_C = 10;
int adun_C(int a, int b)
{
    return a + b;
}

void afis()
{
    printf( "\nValoarea din C - %d adunata cu cea din ASM - %d = %d\n", var_C, var_asm, adun_asm() );
}