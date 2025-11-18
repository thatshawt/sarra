#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpointer-sign"

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

// #define FORCE_EVAL(x) do {                        \
// 	if (sizeof(x) == sizeof(f32)) {         \
// 		fp_force_evalf(x);                \
// 	} else if (sizeof(x) == sizeof(f64)) { \
// 		fp_force_eval(x);                 \
// 	} else {                                  \
// 		fp_force_evall(x);                \
// 	}                                         \
// } while(0)

float floorf(float x)
{
	union {float f; uint32_t i;} u = {x};
	int e = (int)(u.i >> 23 & 0xff) - 0x7f;
	uint32_t m;

	if (e >= 23)
		return x;
	if (e >= 0) {
		m = 0x007fffff >> e;
		if ((u.i & m) == 0)
			return x;
		// FORCE_EVAL(x + 0x1p120f);
		if (u.i >> 31)
			u.i += m;
		u.i &= ~m;
	} else {
		// FORCE_EVAL(x + 0x1p120f);
		if (u.i >> 31 == 0)
			u.i = 0;
		else if (u.i << 1)
			u.f = -1.0;
	}
	return u.f;
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
    const s32 debug_enabled = FALSE;
    // This function converts a single-precision (f32) float to a string (null-terminated).
    // Returns number of characters written, not including the null terminator.

    s32 j = 0;

    // Handle NaN and infinities
    if (num != num) {
        if(debug_enabled) _poopf("[f32_to_str] num is NaN");
        dest[j++] = 'n'; dest[j++] = 'a'; dest[j++] = 'n';
        dest[j] = 0;
        return j;
    }
    if (num > 3.4e38f) {
        if(debug_enabled) _poopf("[f32_to_str] num is +inf");
        dest[j++] = 'i'; dest[j++] = 'n'; dest[j++] = 'f';
        dest[j] = 0;
        return j;
    }
    if (num < -3.4e38f) {
        if(debug_enabled) _poopf("[f32_to_str] num is -inf");
        dest[j++] = '-'; dest[j++] = 'i'; dest[j++] = 'n'; dest[j++] = 'f';
        dest[j] = 0;
        return j;
    }

    // Handle negative numbers
    if(num < 0.0f){
        if(debug_enabled) _poopf("[f32_to_str] num is negative, flipping sign.");
        dest[j++] = '-';
        num = -num;
        if(debug_enabled) _poopf("[f32_to_str] num abs");
    }

    // Separate integer and fractional part (use floorf to get correct integer portion)
    s32 int_part = (s32)floorf(num);
    f32 frac_part = num - (f32)int_part;
    if(debug_enabled) _poopf("[f32_to_str] int_part = %d", int_part);
    if(frac_part < 0.0f) {
        if(debug_enabled) _poopf("[f32_to_str] frac_part was negative, flipping.");
        frac_part = -frac_part;
    }

    // Convert integer part
    if(int_part == 0) {
        dest[j++] = '0';
        if(debug_enabled) _poopf("[f32_to_str] int_part is zero");
    } else {
        // Count digits
        s32 temp = int_part;
        s32 digit_count = 0;
        while(temp > 0){
            temp /= 10;
            digit_count++;
        }
        if(debug_enabled) _poopf("[f32_to_str] digit_count for int_part = %d", digit_count);
        // Write digits in reverse
        for(s32 i=digit_count-1; i>=0; i--){
            s32 power = 1;
            for(s32 k=0; k<i; k++) power *= 10;
            s32 digit = (int_part / power) % 10;
            if(debug_enabled) _poopf("[f32_to_str] digit at pos %d: %d", i, digit);
            dest[j++] = (u8)('0' + digit);
        }
    }

    // Precision for the fractional part (up to 7 digits for f32)
    s32 frac_digits = 7;

    // Only add fractional part if required
    if(frac_digits > 0){
        dest[j++] = '.';
        if(debug_enabled) _poopf("[f32_to_str] Starting fractional part conversion");
        for(s32 i=0; i<frac_digits; i++){
            frac_part *= 10.0f;
            s32 digit = (s32)frac_part;
            if(debug_enabled) _poopf("[f32_to_str] frac digit %d: %d", i, digit);
            dest[j++] = (u8)('0' + digit);
            frac_part -= digit;

            // Optionally trim trailing zeros (stop if next digits are all zero)
            if(i >= 1 && frac_part < 1e-6f) {
                if(debug_enabled) _poopf("[f32_to_str] Breaking fractional digits at position %d, trailing zeros.", i);
                break;
            }
        }
    }

    dest[j] = 0; // null termination

    if(debug_enabled) _poopf("[f32_to_str] output string");

    return j;
}

s32 f64_to_str(u8* dest, f64 num)
{
    // This function mimics f32_to_str but for f64 (double) types.
    // Assumes enough space in dest.

    // Optionally, add debug flag
    extern int debug_enabled;
    s32 j = 0;

    // Handle negative numbers
    if(num < 0.0) {
        dest[j++] = '-';
        num = -num;
    }

    // Get integer part
    s64 int_part = (s64)num;

    // Get fractional part
    f64 frac_part = num - (f64)int_part;

    if(debug_enabled) _poopf("[f64_to_str] num: %z", num);
    if(debug_enabled) _poopf("[f64_to_str] int_part: %l", int_part);
    if(debug_enabled) _poopf("[f64_to_str] frac_part: %z", frac_part);

    // Handle integer part (zero special case)
    if(int_part == 0) {
        dest[j++] = '0';
    } else {
        // Count digits in integer part
        s64 temp = int_part;
        s32 digit_count = 0;
        while(temp > 0) {
            temp /= 10;
            digit_count++;
        }
        if(debug_enabled) _poopf("[f64_to_str] digit_count for int_part = %d", digit_count);
        // Write digits in order
        for(s32 i = digit_count - 1; i >= 0; i--) {
            s64 power = 1;
            for(s32 k = 0; k < i; k++) power *= 10;
            s64 digit = (int_part / power) % 10;
            if(debug_enabled) _poopf("[f64_to_str] digit at pos %d: %d", i, (s32)digit);
            dest[j++] = (u8)('0' + digit);
        }
    }

    // Up to 12 digits for double
    s32 frac_digits = 12;

    // Only add fractional part if required
    if(frac_digits > 0) {
        dest[j++] = '.';
        if(debug_enabled) _poopf("[f64_to_str] Starting fractional part conversion");
        for(s32 i = 0; i < frac_digits; i++) {
            frac_part *= 10.0;
            s32 digit = (s32)frac_part;
            if(debug_enabled) _poopf("[f64_to_str] frac digit %d: %d", i, digit);
            dest[j++] = (u8)('0' + digit);
            frac_part -= digit;

            // Optionally trim trailing zeros
            if(i >= 1 && frac_part < 1e-10) {
                if(debug_enabled) _poopf("[f64_to_str] Breaking fractional digits at position %d, trailing zeros.", i);
                break;
            }
        }
    }

    dest[j] = 0; // null termination

    if(debug_enabled) _poopf("[f64_to_str] output string");

    return j;
}

#pragma clang diagnostic pop