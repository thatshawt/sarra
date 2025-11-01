#include "poopmath.h"
#include "utils.h"

s32 absi(s32 a)
{
    if(a < 0)return -1*a;
    else return a;
}

s64 absi64(s64 a)
{
    if(a < 0)return -1*a;
    else return a;
}

s32 max_i32(s32 a, s32 b)
{
    return a > b ? a:b;
}

s32 min_i32(s32 a, s32 b)
{
    return a < b ? a:b;
}

s32 pow_i32(s32 a, s32 b)
{
    if(b == 0) return 1;
    s32 result = a;
    for(int i=1;i<b;i++){
        result *= a;
    }
    return result;
}

s64 pow_i64(s64 a, s64 b)
{
    if(b == 0) return 1;
    s64 result = a;
    for(int i=1;i<b;i++){
        result *= a;
    }
    return result;
}

s32 digits10(s32 num)
{
    if(num == 0)return 1;
    s32 i = 0;
    s64 powerTen = 1;
    while((s64)num/powerTen != 0){
        powerTen *= 10;
        i++;
    }
    return i;
}

s64 digits10i64(s64 num)
{
    if(num == 0)return 1;
    if(BETWEEN_INC(num, 1000000000000000000, INT64_MAX))return 19;
    if(BETWEEN_INC(num, INT64_MIN, -1000000000000000000))return 19;

    s32 i = 0;
    s64 powerTen = 1;
    while((s64)num/powerTen != 0){
        powerTen *= 10;
        i++;
    }
    return i;
}

s32 ithDigit10(s32 num, s32 i)
{
    return absi(num/pow_i32(10,i) % 10);
}

s64 ithDigit10i64(s64 num, s64 i)
{
    return absi64(num/pow_i64(10,(s64)i) % 10);
}

u8 digitCharMap[] = "0123456789";
s32 int_to_str(u8* dest, s32 num)
{
    int j = 0;
    
    if(num == 0){
        dest[j++] = '0';
        return j;
    }

    const int digits = digits10(num);
    
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

s32 i64_to_str(u8* dest, s64 num)
{
    const int digits = digits10i64(num);
    int j = 0;

    if(num == 0){
        dest[j++] = '0';
        return j;
    }
    
    if(num < 0){
        dest[j++] = '-';
    }
    
    for(int i=digits-1; i>=0; i--){
        char theDigitChar = '?';
        s64 theDigit = ithDigit10i64(num, i);
        theDigitChar = digitCharMap[theDigit];
        dest[j++] = theDigitChar;
    }

    return j;
}
