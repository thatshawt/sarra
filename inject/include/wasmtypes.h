#ifndef WASMTYPES_H
#define WASMTYPES_H

typedef __INT8_TYPE__ int8_t;
typedef __UINT8_TYPE__ uint8_t;

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

#define INT8_MIN         ((s8)(-127 - 1))
#define INT16_MIN        ((s16)(-32767 - 1))
#define INT32_MIN        ((s32)(-2147483647 - 1))
#define INT64_MIN        ((s64)(-9223372036854775807 - 1))
#define INT8_MAX         ((s8)127)
#define INT16_MAX        ((s16)32767)
#define INT32_MAX        ((s32)2147483647)
#define INT64_MAX        ((s64)9223372036854775807)
#define UINT8_MAX        ((u8)0xff)
#define UINT16_MAX       ((u16)0xffff)
#define UINT32_MAX       ((u32)0xffffffff)
#define UINT64_MAX       ((u64)0xffffffffffffffff)

#endif