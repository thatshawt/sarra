#include "poopmath.h"

int absi(int a)
{
    if(a < 0)return -1*a;
    else return a;
}

i32 max_i32(i32 a, i32 b)
{
    return a > b ? a:b;
}

i32 min_i32(i32 a, i32 b)
{
    return a < b ? a:b;
}

i32 pow_i32(i32 a, i32 b){
    if(b == 0) return 1;
    i32 result = a;
    for(int i=1;i<b;i++){
        result *= a;
    }
    return result;
}

int digits10(int num)
{
    int i = 0;
    int powerTen = 1;
    while(num/powerTen != 0){
        powerTen *= 10;
        i++;
    }
    return i;
}

int ithDigit10(int num, int i)
{
    return absi(num/(int)pow_i32(10,i) % 10);
}

char digitCharMap[] = "0123456789";
int int_to_str(char* dest, int num)
{
    const int digits = digits10(num);
    int j = 0;
    
    if(num < 0){
        dest[j++] = '-';
    }
    
    for(int i=digits-1; i>=0; i--){
        char theDigitChar = '?';
        int theDigit = ithDigit10(num, i);
        theDigitChar = digitCharMap[theDigit];
        dest[j++] = theDigitChar;
    }

    return j;
}
