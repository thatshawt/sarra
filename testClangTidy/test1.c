#include "stdbool.h"
// #include "__stdarg_va_list.h"

#include <stdint.h>

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

#define IS_SINGLE_UNSHARED_MEMORY 1

// Computes a pointer to an object of the given size in a little-endian memory.
//
// On a little-endian host, this is just &mem->data[addr] - the object's size is
// unused. On a big-endian host, it's &mem->data[mem->size - addr - n], where n
// is the object's size.
//
// Note that mem may be evaluated multiple times.
//
// Parameters:
// mem - The memory.
// addr - The address.
// n - The size of the object.
//
// Result:
// A pointer for an object of size n.
#if WABT_BIG_ENDIAN
#define MEM_ADDR(mem, addr, n) &(mem)->data[(mem)->size - (addr) - (n)]
#else
#define MEM_ADDR(mem, addr, n) &(mem)->data[addr]
#endif

// We can only use Segue for this module if it uses a single unshared imported
// or exported memory
#if WASM_RT_USE_SEGUE && IS_SINGLE_UNSHARED_MEMORY
#define WASM_RT_USE_SEGUE_FOR_THIS_MODULE 1
#else
#define WASM_RT_USE_SEGUE_FOR_THIS_MODULE 0
#endif

#if WASM_RT_USE_SEGUE_FOR_THIS_MODULE
// POSIX uses FS for TLS, GS is free
static inline void* wasm_rt_segue_read_base() {
  if (wasm_rt_fsgsbase_inst_supported) {
    return (void*)__builtin_ia32_rdgsbase64();
  } else {
    return wasm_rt_syscall_get_segue_base();
  }
}
static inline void wasm_rt_segue_write_base(void* base) {
#if WASM_RT_SEGUE_FREE_SEGMENT
  if (wasm_rt_last_segment_val == base) {
    return;
  }

  wasm_rt_last_segment_val = base;
#endif

  if (wasm_rt_fsgsbase_inst_supported) {
    __builtin_ia32_wrgsbase64((uintptr_t)base);
  } else {
    wasm_rt_syscall_set_segue_base(base);
  }
}
#define MEM_ADDR_MEMOP(mem, addr, n) ((uint8_t __seg_gs*)(uintptr_t)addr)
#else
#define MEM_ADDR_MEMOP(mem, addr, n) MEM_ADDR(mem, addr, n)
#endif

#define TRAP(x) (wasm_rt_trap(WASM_RT_TRAP_##x), 0)

#if WASM_RT_STACK_DEPTH_COUNT
#define FUNC_PROLOGUE                                            \
  if (++wasm_rt_call_stack_depth > WASM_RT_MAX_CALL_STACK_DEPTH) \
    TRAP(EXHAUSTION);

#define FUNC_EPILOGUE --wasm_rt_call_stack_depth
#else
#define FUNC_PROLOGUE

#define FUNC_EPILOGUE
#endif

#define UNREACHABLE TRAP(UNREACHABLE)

static inline bool func_types_eq(const wasm_rt_func_type_t a,
                                 const wasm_rt_func_type_t b) {
  return (a == b) || LIKELY(a && b && !memcmp(a, b, 32));
}

#define CHECK_CALL_INDIRECT(table, ft, x)                \
  (LIKELY((x) < table.size && table.data[x].func &&      \
          func_types_eq(ft, table.data[x].func_type)) || \
   TRAP(CALL_INDIRECT))

#define DO_CALL_INDIRECT(table, t, x, ...) ((t)table.data[x].func)(__VA_ARGS__)

#define CALL_INDIRECT(table, t, ft, x, ...) \
  (CHECK_CALL_INDIRECT(table, ft, x),       \
   DO_CALL_INDIRECT(table, t, x, __VA_ARGS__))

static inline bool add_overflow(uint64_t a, uint64_t b, uint64_t* resptr) {
#if __has_builtin(__builtin_add_overflow)
  return __builtin_add_overflow(a, b, resptr);
#elif defined(_MSC_VER)
  return _addcarry_u64(0, a, b, resptr);
#else
#error "Missing implementation of __builtin_add_overflow or _addcarry_u64"
#endif
}

#define RANGE_CHECK(mem, offset, len)              \
  do {                                             \
    uint64_t res;                                  \
    if (UNLIKELY(add_overflow(offset, len, &res))) \
      TRAP(OOB);                                   \
    if (UNLIKELY(res > mem->size))                 \
      TRAP(OOB);                                   \
  } while (0);

#if WASM_RT_USE_SEGUE_FOR_THIS_MODULE && WASM_RT_SANITY_CHECKS
#include <stdio.h>
#define WASM_RT_CHECK_BASE(mem)                                               \
  if (((uintptr_t)((mem)->data)) != ((uintptr_t)wasm_rt_segue_read_base())) { \
    puts("Segment register mismatch\n");                                      \
    abort();                                                                  \
  }
#else
#define WASM_RT_CHECK_BASE(mem)
#endif

// MEMCHECK_DEFAULT32 is an "accelerated" MEMCHECK used only for
// default-page-size, 32-bit memories. It may do nothing at all
// (if hardware bounds-checking is enabled via guard pages)
// or it may do a slightly faster RANGE_CHECK.
#if WASM_RT_MEMCHECK_GUARD_PAGES
#define MEMCHECK_DEFAULT32(mem, a, t) WASM_RT_CHECK_BASE(mem);
#else
#define MEMCHECK_DEFAULT32(mem, a, t)                \
  WASM_RT_CHECK_BASE(mem);                           \
  if (UNLIKELY(a + (uint64_t)sizeof(t) > mem->size)) \
    TRAP(OOB);
#endif

// MEMCHECK_GENERAL can be used for any memory
#define MEMCHECK_GENERAL(mem, a, t) \
  WASM_RT_CHECK_BASE(mem);          \
  RANGE_CHECK(mem, a, sizeof(t));

#ifdef __GNUC__
#define FORCE_READ_INT(var) __asm__("" ::"r"(var));
// Clang on Mips requires "f" constraints on floats
// See https://github.com/llvm/llvm-project/issues/64241
#if defined(__clang__) && \
    (defined(mips) || defined(__mips__) || defined(__mips))
#define FORCE_READ_FLOAT(var) __asm__("" ::"f"(var));
#else
#define FORCE_READ_FLOAT(var) __asm__("" ::"r"(var));
#endif
#else
#define FORCE_READ_INT(var)
#define FORCE_READ_FLOAT(var)
#endif

static inline void load_data(void* dest, const void* src, size_t n) {
  if (!n) {
    return;
  }
  wasm_rt_memcpy(dest, src, n);
#if WABT_BIG_ENDIAN
  u8* dest_chars = dest;
  for (size_t i = 0; i < (n >> 1); i++) {
    u8 cursor = dest_chars[i];
    dest_chars[i] = dest_chars[n - i - 1];
    dest_chars[n - i - 1] = cursor;
  }
#endif
}

#define LOAD_DATA(m, o, i, s)            \
  do {                                   \
    RANGE_CHECK((&m), o, s);             \
    load_data(MEM_ADDR(&m, o, s), i, s); \
  } while (0)

#define DEF_MEM_CHECKS0(name, shared, mem_type, ret_kw, return_type)         \
  static inline return_type name##_default32(wasm_rt##shared##memory_t* mem, \
                                             u64 addr) {                     \
    MEMCHECK_DEFAULT32(mem, addr, mem_type);                                 \
    ret_kw name##_unchecked(mem, addr);                                      \
  }                                                                          \
  static inline return_type name(wasm_rt##shared##memory_t* mem, u64 addr) { \
    MEMCHECK_GENERAL(mem, addr, mem_type);                                   \
    ret_kw name##_unchecked(mem, addr);                                      \
  }

#define DEF_MEM_CHECKS1(name, shared, mem_type, ret_kw, return_type,         \
                        val_type1)                                           \
  static inline return_type name##_default32(wasm_rt##shared##memory_t* mem, \
                                             u64 addr, val_type1 val1) {     \
    MEMCHECK_DEFAULT32(mem, addr, mem_type);                                 \
    ret_kw name##_unchecked(mem, addr, val1);                                \
  }                                                                          \
  static inline return_type name(wasm_rt##shared##memory_t* mem, u64 addr,   \
                                 val_type1 val1) {                           \
    MEMCHECK_GENERAL(mem, addr, mem_type);                                   \
    ret_kw name##_unchecked(mem, addr, val1);                                \
  }

#define DEF_MEM_CHECKS2(name, shared, mem_type, ret_kw, return_type,         \
                        val_type1, val_type2)                                \
  static inline return_type name##_default32(wasm_rt##shared##memory_t* mem, \
                                             u64 addr, val_type1 val1,       \
                                             val_type2 val2) {               \
    MEMCHECK_DEFAULT32(mem, addr, mem_type);                                 \
    ret_kw name##_unchecked(mem, addr, val1, val2);                          \
  }                                                                          \
  static inline return_type name(wasm_rt##shared##memory_t* mem, u64 addr,   \
                                 val_type1 val1, val_type2 val2) {           \
    MEMCHECK_GENERAL(mem, addr, mem_type);                                   \
    ret_kw name##_unchecked(mem, addr, val1, val2);                          \
  }

#define DEFINE_LOAD(name, t1, t2, t3, force_read)                      \
  static inline t3 name##_unchecked(wasm_rt_memory_t* mem, u64 addr) { \
    t1 result;                                                         \
    wasm_rt_memcpy(&result, MEM_ADDR_MEMOP(mem, addr, sizeof(t1)),     \
                   sizeof(t1));                                        \
    force_read(result);                                                \
    return (t3)(t2)result;                                             \
  }                                                                    \
  DEF_MEM_CHECKS0(name, _, t1, return, t3)

#define DEFINE_STORE(name, t1, t2)                                     \
  static inline void name##_unchecked(wasm_rt_memory_t* mem, u64 addr, \
                                      t2 value) {                      \
    t1 wrapped = (t1)value;                                            \
    wasm_rt_memcpy(MEM_ADDR_MEMOP(mem, addr, sizeof(t1)), &wrapped,    \
                   sizeof(t1));                                        \
  }                                                                    \
  DEF_MEM_CHECKS1(name, _, t1, , void, t2)

DEFINE_LOAD(i32_load, u32, u32, u32, FORCE_READ_INT)
DEFINE_LOAD(i64_load, u64, u64, u64, FORCE_READ_INT)
DEFINE_LOAD(f32_load, f32, f32, f32, FORCE_READ_FLOAT)
DEFINE_LOAD(f64_load, f64, f64, f64, FORCE_READ_FLOAT)
DEFINE_LOAD(i32_load8_s, s8, s32, u32, FORCE_READ_INT)
DEFINE_LOAD(i64_load8_s, s8, s64, u64, FORCE_READ_INT)
DEFINE_LOAD(i32_load8_u, u8, u32, u32, FORCE_READ_INT)
DEFINE_LOAD(i64_load8_u, u8, u64, u64, FORCE_READ_INT)
DEFINE_LOAD(i32_load16_s, s16, s32, u32, FORCE_READ_INT)
DEFINE_LOAD(i64_load16_s, s16, s64, u64, FORCE_READ_INT)
DEFINE_LOAD(i32_load16_u, u16, u32, u32, FORCE_READ_INT)
DEFINE_LOAD(i64_load16_u, u16, u64, u64, FORCE_READ_INT)
DEFINE_LOAD(i64_load32_s, s32, s64, u64, FORCE_READ_INT)
DEFINE_LOAD(i64_load32_u, u32, u64, u64, FORCE_READ_INT)
DEFINE_STORE(i32_store, u32, u32)
DEFINE_STORE(i64_store, u64, u64)
DEFINE_STORE(f32_store, f32, f32)
DEFINE_STORE(f64_store, f64, f64)
DEFINE_STORE(i32_store8, u8, u32)
DEFINE_STORE(i32_store16, u16, u32)
DEFINE_STORE(i64_store8, u8, u64)
DEFINE_STORE(i64_store16, u16, u64)
DEFINE_STORE(i64_store32, u32, u64)

// void w2c__f199(w2c_* instance, u32 var_p0, u32 var_p1) {
void stuff(u32 var_p0, u32 var_p1){
    u32 var_l2 = 0;
    u32 var_l3 = 0;
    u32 var_l4 = 0;
    u32 var_l5 = 0;
    u32 var_l6 = 0;
    u32 var_l7 = 0;
    u32 var_l8 = 0;
    u32 var_l9 = 0;
    u32 var_l10 = 0;
    u32 var_l11 = 0;
    u32 var_l12 = 0;
    u32 var_l13 = 0;
    u32 var_l14 = 0;
    u32 var_l15 = 0;
    u64 var_l23 = 0;
    u64 var_l24 = 0;
    u64 var_l25 = 0;
    u64 var_l26 = 0;
    f64 var_l16 = 0;
    f64 var_l17 = 0;
    f64 var_l18 = 0;
    f64 var_l19 = 0;
    f64 var_l20 = 0;
    f64 var_l21 = 0;
    f64 var_l22 = 0;
    // FUNC_PROLOGUE;
    u32 var_i0;
    u32 var_i1;
    u32 var_i2;
    u32 var_i3;
    u32 var_i4;
    u32 var_i5;
    u64 var_j0;
    u64 var_j1;
    u64 var_j2;
    u64 var_j3;
    u64 var_j4;
    f64 var_d0;
    f64 var_d1;
    f64 var_d2;
    f64 var_d3;

    var_i0 = var_p0;
    var_i0 = i32_load_default32(&instance->w2c_g, (u64)(var_i0) + 444U);
    var_i1 = var_l3;
    var_i2 = 56U;
    var_i1 *= var_i2;
    var_i0 += var_i1;
    var_p1 = var_i0;
    var_j1 = var_l23;
    i64_store_default32(&instance->w2c_g, (u64)(var_i0) + 48, var_j1);
    var_i0 = var_p1;
    var_d1 = var_l21;
    var_d2 = var_l16;
    var_d1 *= var_d2;
}