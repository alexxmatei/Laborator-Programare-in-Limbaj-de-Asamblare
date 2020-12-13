#include <stdio.h> 

long fact(int n){       
    if(n==0) return 1;    //conditia de oprire
    return n*fact(n-1);    //apel recursiv: n!=n(n-1)! 
} 
void main(){  
    int n;       
    scanf("%d",&n);       //citire n       
    printf("%ld",fact(n)); //afisare n! 
} 