// typedef int i32;
// typedef long long i64;
// typedef float f32;
// typedef double f64;

// #include <stdint.h>

// #ifndef WASM_RT_CORE_TYPES_DEFINED
// #define WASM_RT_CORE_TYPES_DEFINED

// #ifdef __INT8_TYPE__
// #ifndef __int8_t_defined  /* glibc sys/types.h also defines int8_t*/
typedef __INT8_TYPE__ int8_t;
// #endif /* __int8_t_defined */
typedef __UINT8_TYPE__ uint8_t;
// # undef __int_least8_t
// # define __int_least8_t int8_t
// # undef __uint_least8_t
// # define __uint_least8_t uint8_t
// #endif /* __INT8_TYPE__ */

typedef __INT16_TYPE__ int16_t;
typedef __UINT16_TYPE__ uint16_t;

typedef __INT32_TYPE__ int32_t;
typedef __UINT32_TYPE__ uint32_t;

typedef __INT64_TYPE__ int64_t;
typedef __UINT64_TYPE__ uint64_t;

typedef unsigned int size_t;
typedef unsigned int uintptr_t;

typedef uint8_t u8;
typedef int8_t s8;
typedef uint16_t u16;
typedef int16_t s16;
typedef uint32_t u32;
typedef int32_t s32;
typedef uint64_t u64;
typedef int64_t s64;
typedef float f32;
typedef double f64;
// #endif