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

#define TRUE 1
#define FALSE 0

// (t) => {
//   e[t] = null;
// },
// extern void import_e_t_set_null(int t);

// (t) => e[t],
extern int import_e_t_get(int t);

// (t) => e[t](),
extern int import_e_t_call(int t);



extern void special_printargs();

extern void special_clear_locals();
extern int special_local_get_6();

void _special_bigfunc_localset_i32(i32 index, i32 value);
void _special_bigfunc_localset_i64(i32 index, i64 value);
void _special_bigfunc_localset_f32(i32 index, f32 value);
void _special_bigfunc_localset_f64(i32 index, f64 value);

i32 special_bigfunc_localget_i32(i32 index);
i64 special_bigfunc_localget_i64(i32 index);
f32 special_bigfunc_localget_f32(i32 index);
f64 special_bigfunc_localget_f64(i32 index);

extern i64 special_i64_const_10000();
extern i64 special_i64_const_9999();
extern i64 special_i64_const_9998();

// these are memory instructions that work with arras memory and not my memory
extern i32 special_arras_memory_i32_load(i32 address); // i32.load
extern i64 special_arras_memory_i64_load(i32 address); // i64.load
extern void special_arras_memory_i32_store(i32 address, int value); // i32.store
extern void special_arras_memory_i32_store8(i32 address, int value);// i32.store8
extern i32 special_arras_memory_memory_size(); // memory.size

extern int special_func_number();
extern int special_start_func_number();
extern int special_bigfunc_num();


#define UNIQUEIFER export_nothing(__LINE__)

#define HXH_ARRAY_CONSOLE_LOG 0
#define HXH_WINDOW_POOP_SET_NULL 5

void _hxh_breakpoint();
void export_nothing(int a);
void _hxh_add_int_string_microcode(int* value, int size);
void _hxh_add_char_string_microcode(char* value, int size);

i32 max_i32(i32 a, i32 b);
i32 min_i32(i32 a, i32 b);
void memset_i32(int* start, int size, int value);
void memset_i8(char* start, int size, char value);

char* memcpy_i8_to_arras_memory(char* dest, char* src, int n);



int hxh_parse_execute();
#define hxh_PARSE_EXECUTE() (hxh_parse_execute())
int hxh_reset();
#define hxh_RESET() (hxh_reset())

int hxh_push_microcode_literal(long value);
#define hxh_PUSH_MICROCODE_LITERAL(value) (hxh_push_microcode_literal(value))
// #define hxh_PUSH_MICROCODE_VALUE(value) (import_e_t_get(10000##value))
#define hxh_LOAD_INTO_VAR(a, address)    hxh_PUSH_MICROCODE_LITERAL(1); \
    hxh_PUSH_MICROCODE_LITERAL(address); \
    a = (int)hxh_PARSE_EXECUTE();

#define hxh_STORE(address, value) hxh_PUSH_MICROCODE_LITERAL(2); \
    hxh_PUSH_MICROCODE_LITERAL(address); \
    hxh_PUSH_MICROCODE_LITERAL(value); \
    hxh_PARSE_EXECUTE();

// TODO allow multiple values
#define hxh_CONSOLE_LOG_LITERAL(value) hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG); \
    hxh_PUSH_MICROCODE_LITERAL(value); \
    hxh_PARSE_EXECUTE();

#define hxh_CONSOLE_LOG_INT_STRING(value, size) hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG); \
    _hxh_add_int_string_microcode(value, size); \
    hxh_PARSE_EXECUTE();

#define hxh_CONSOLE_LOG_CHAR_STRING(value, size) hxh_PUSH_MICROCODE_LITERAL(3); \
    _hxh_add_char_string_microcode(value, size); \
    hxh_PARSE_EXECUTE();


