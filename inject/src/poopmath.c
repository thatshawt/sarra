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

s32 f32_to_str(u8* dest, f32 num)
{
    int j = 0;
    
    // Handle zero
    if(num == 0.0f){
        dest[j++] = '0';
        dest[j++] = '.';
        dest[j++] = '0';
        return j;
    }
    
    // Handle negative
    if(num < 0.0f){
        dest[j++] = '-';
        num = -num;
    }
    
    // Extract integer and fractional parts
    // Cast to integer to get integer part (truncates towards zero)
    s32 int_part = (s32)num;
    // Calculate fractional part
    f32 frac_part = num - (f32)int_part;
    // Ensure fractional part is positive (handle any rounding issues)
    if(frac_part < 0.0f) frac_part = -frac_part;
    
    // Convert integer part manually (to avoid issues with int_to_str)
    if(int_part == 0){
        dest[j++] = '0';
    } else {
        // Count digits
        s32 temp = int_part;
        s32 digit_count = 0;
        while(temp > 0){
            temp /= 10;
            digit_count++;
        }
        
        // Extract and write digits
        temp = int_part;
        if(temp < 0) temp = -temp;  // Ensure positive for extraction
        u8 digits[32];
        for(s32 i = digit_count - 1; i >= 0; i--){
            s32 digit = temp % 10;
            digits[i] = digitCharMap[digit];
            temp /= 10;
        }
        for(s32 i = 0; i < digit_count; i++){
            dest[j++] = digits[i];
        }
    }
    
    // Add decimal point
    dest[j++] = '.';
    
    // Convert fractional part (6 decimal places for float)
    const int precision = 6;
    for(int i = 0; i < precision; i++){
        frac_part *= 10.0f;
        s32 digit = (s32)frac_part;
        if(digit < 0) digit = 0;
        if(digit > 9) digit = 9;
        dest[j++] = digitCharMap[digit];
        frac_part -= (f32)digit;
    }
    
    return j;
}

s32 f64_to_str(u8* dest, f64 num)
{
    int j = 0;
    
    // Handle zero
    if(num == 0.0){
        dest[j++] = '0';
        dest[j++] = '.';
        dest[j++] = '0';
        return j;
    }
    
    // Handle negative
    if(num < 0.0){
        dest[j++] = '-';
        num = -num;
    }
    
    // Extract integer and fractional parts
    // Cast to integer to get integer part (truncates towards zero)
    s64 int_part = (s64)num;
    // Calculate fractional part
    f64 frac_part = num - (f64)int_part;
    // Ensure fractional part is positive (handle any rounding issues)
    if(frac_part < 0.0) frac_part = -frac_part;
    
    // Convert integer part manually (to avoid issues with i64_to_str)
    if(int_part == 0){
        dest[j++] = '0';
    } else {
        // Count digits
        s64 temp = int_part;
        s32 digit_count = 0;
        while(temp > 0){
            temp /= 10;
            digit_count++;
        }
        
        // Extract and write digits
        temp = int_part;
        if(temp < 0) temp = -temp;  // Ensure positive for extraction
        u8 digits[32];
        for(s32 i = digit_count - 1; i >= 0; i--){
            s64 digit = temp % 10;
            digits[i] = digitCharMap[digit];
            temp /= 10;
        }
        for(s32 i = 0; i < digit_count; i++){
            dest[j++] = digits[i];
        }
    }
    
    // Add decimal point
    dest[j++] = '.';
    
    // Convert fractional part (15 decimal places for double)
    const int precision = 15;
    for(int i = 0; i < precision; i++){
        frac_part *= 10.0;
        s64 digit = (s64)frac_part;
        if(digit < 0) digit = 0;
        if(digit > 9) digit = 9;
        dest[j++] = digitCharMap[digit];
        frac_part -= (f64)digit;
    }
    
    return j;
}
