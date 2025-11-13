#include "wasmtypes.h"

#define PAGESIZE_BYTES (65536)

#define i32LOAD(address) (*((int*)(address)))
#define i32STORE(address, value) ((*((int*)(address))) = value)

#define i8LOAD(address) (*((char*)(address)))
#define i8STORE(address, value) ((*((char*)(address))) = value)

#define SWAP_ENDIAN_32(num) ((((num)>>24)&0xff) | \
                    (((num)<<8)&0xff0000) | \
                    (((num)>>8)&0xff00) | \
                    (((num)<<24)&0xff000000))

#define INT32_BYTE0(n) ((n >> 24) & 0xFF)
#define INT32_BYTE1(n) ((n >> 16) & 0xFF)
#define INT32_BYTE2(n) ((n >> 8) & 0xFF)
#define INT32_BYTE3(n) (n & 0xFF)

#define TRUE ((s32)1)
#define FALSE ((s32)0)

//a is between inclusive b and c.
#define BETWEEN_INC(a,b,c) ((a>=b) && (a<=c))

// (t) => {
//   e[t] = null;
// },
// extern void import_e_t_set_null(int t);

// (t) => e[t],
extern s32 import_e_t_get(s32 t);

// (t) => e[t](),
extern s32 import_e_t_call(s32 t);

//TODO. give the parameters names and see if calling this works...
extern s32 import_sendpacket(s32 a, s32 b, s32 c);


extern void special_update_param_struct();

//deprecated
extern void special_printargs();

extern void special_clear_locals();
extern int special_local_get_6();

extern s32 special_global_get_i32_0();
extern s32 special_global_get_i32_1();

extern s64 special_global_get_i64_0();
extern f32 special_global_get_f32_0();
extern f64 special_global_get_f64_0();


// TODO
// extern void special_global_set_i32_0(s32 value);
// extern void special_global_set_i64_0(s64 value);
// extern void special_global_set_f32_0(f32 value);
// extern void special_global_set_f64_0(f64 value);

void _special_bigfunc_localset_i32(s32 index, s32 value);
void _special_bigfunc_localset_i64(s32 index, s64 value);
void _special_bigfunc_localset_f32(s32 index, f32 value);
void _special_bigfunc_localset_f64(s32 index, f64 value);

s32 special_bigfunc_localget_i32(s32 index);
s64 special_bigfunc_localget_i64(s32 index);
f32 special_bigfunc_localget_f32(s32 index);
f64 special_bigfunc_localget_f64(s32 index);

extern s64 special_i64_const_10000();
extern s64 special_i64_const_9999();
extern s64 special_i64_const_9998();

// these are memory instructions that work with arras memory and not my memory
extern s32 special_arras_memory_i32_load(s32 address); // i32.load
extern s8 special_arras_memory_i32_load8_s(s32 address); // i32.load8_s
extern u8 special_arras_memory_i32_load8_u(s32 address); // i32.load8_u
extern s64 special_arras_memory_i64_load(s32 address); // i64.load
extern void special_arras_memory_i32_store(s32 address, int value); // i32.store
extern void special_arras_memory_i32_store8(s32 address, int value);// i32.store8
extern s32 special_arras_memory_memory_size(); // memory.size

extern s32 special_func_number();
extern s32 special_start_func_number();
extern s32 special_bigfunc_num();



#define UNIQUEIFER export_nothing((s32) __LINE__)

#define HXH_ARRAY_CONSOLE_LOG 0
#define HXH_WINDOW_POOP_SET_NULL 5

void _hxh_breakpoint();
void export_nothing(s32 a);
void _hxh_add_int_string_microcode(s32* value, s32 size);
void _hxh_add_char_string_microcode(u8* value, s32 size);

void memset_i32(s32* start, s32 size, s32 value);
void memset_i8(u8* start, s32 size, u8 value);

//the one and only
void _poopf(u8* format, ...);
// #define poopf(format, ...) _poopf((format), (s32)0, ##__VA_ARGS__)

void _spoopf(u8* dest, s32 max, u8* format, ...);
#define spoopf(dest, max, format, ...) _spoopf((dest), (max), (format), (s32)0, ##__VA_ARGS__)
void vspoopf(u8* dest, int max, u8* format, __builtin_va_list argp);

char* memcpy_i8_to_arras_memory(char* dest, char* src, int n);
char* memset_i8_to_arras_memory(char* dest, u8 val, int n);

s64 hxh_parse_execute();
s64 hxh_reset();

void hxh_extended_literals_on();
void hxh_extended_literals_off();
s64 hxh_extended_literals_status();

s64 hxh_push_microcode_literal(s64 value);
void hxh_console_log_literal(s64 value);

void hxh_console_log_char_string(u8* str, s32 size);


