#include "wasmtypes.h"

int absi(int a);

i32 max_i32(i32 a, i32 b);
i32 min_i32(i32 a, i32 b);

i32 pow_i32(i32 a, i32 b);
i64 pow_i64(i64 a, i64 b);

int digits10(int num);
int digits10i64(i64 num);
int ithDigit10(int num, int i);
int ithDigit10i64(i64 num, int i);

int int_to_str(char* dest, int num);
int i64_to_str(char* dest, i64 num);