#include "wasmtypes.h"

s32 absi(s32 a);

s32 max_i32(s32 a, s32 b);
s32 min_i32(s32 a, s32 b);

s32 pow_i32(s32 a, s32 b);
s64 pow_i64(s64 a, s64 b);

s32 digits10(s32 num);
s64 digits10i64(s64 num);
s32 ithDigit10(s32 num, s32 i);
s64 ithDigit10i64(s64 num, s64 i);

s32 int_to_str(u8* dest, s32 num);
s32 i64_to_str(u8* dest, s64 num);
s32 f32_to_str(u8* dest, f32 num);
s32 f64_to_str(u8* dest, f64 num);

int modulo_Euclidean(int a, int b);