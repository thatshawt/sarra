#define i32LOAD(address) (*((int*)(address)))
#define i32STORE(address, value) ((*((int*)(address))) = value)

#define i8LOAD(address) (*((char*)(address)))
#define i8STORE(address, value) ((*((char*)(address))) = value)

typedef int i32;
typedef long long i64;
typedef float f32;
typedef double f64;

typedef unsigned int size_t;

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

extern void special_clear_locals();
extern int special_func_number();
extern int special_start_func_number();

// these are memory instructions that work with arras memory and not my memory
extern int special_arras_memory_i32_load(int address); // this turns into i32.load
extern void special_arras_memory_i32_store(int address, int value); // i32.store
extern void special_arras_memory_i32_store8(int address, int value);// i32.store8

#define UNIQUEIFER export_nothing(__LINE__)

#define HXH_ARRAY_CONSOLE_LOG 0
#define HXH_WINDOW_POOP_SET_NULL 5

#define hxh_PARSE_EXECUTE() (import_e_t_get(9999))
#define hxh_RESET() (import_e_t_get(9998))
#define hxh_PUSH_MICROCODE_LITERAL(value) (import_e_t_get(10000+(value)))
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

extern void special_printargs();

