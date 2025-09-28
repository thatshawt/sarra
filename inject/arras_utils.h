#define i32LOAD(address) (*((int*)(address)))
#define i32STORE(address, value) ((*((int*)(address))) = value)

typedef int i32;
typedef long long i64;
typedef float f32;
typedef double f64;

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

i32 max_i32(i32 a, i32 b){
    return a > b ? a:b;
}

i32 min_i32(i32 a, i32 b){
    return a < b ? a:b;
}

void _memset_i32(int* start, int numberOfInts, int value){
    for(int i=0;i<numberOfInts;i++){
        i32STORE(start+i, value);
    }
}

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

extern int special_arras_memory_i32_load(int address);
extern void special_arras_memory_i32_store(int address, int value);

#define hxh_PARSE_EXECUTE() (import_e_t_get(9999))
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
#define hxh_CONSOLE_LOG_LITERAL(value) hxh_PUSH_MICROCODE_LITERAL(0); \
    hxh_PUSH_MICROCODE_LITERAL(value); \
    hxh_PARSE_EXECUTE();

void _hxh_add_char_string_microcode(char* value, int size){
    for(int i=0;i<size;i++){
        hxh_PUSH_MICROCODE_LITERAL(*(value+i));
    }
}
#define hxh_CONSOLE_LOG_CHAR_STRING(value, size) hxh_PUSH_MICROCODE_LITERAL(3); \
    _hxh_add_char_string_microcode(value, size); \
    hxh_PARSE_EXECUTE();


void _hxh_add_int_string_microcode(int* value, int size){
    for(int i=0;i<size;i++){
        hxh_PUSH_MICROCODE_LITERAL(*(value+i));
    }
}
#define hxh_CONSOLE_LOG_INT_STRING(value, size) hxh_PUSH_MICROCODE_LITERAL(0); \
    _hxh_add_int_string_microcode(value, size); \
    hxh_PARSE_EXECUTE();

extern void special_printargs();

void _special_printargs_begin(){
    hxh_PUSH_MICROCODE_LITERAL(0);
}

__attribute__((noinline)) void _special_printargs_per_arg_i32(i32 a){
    hxh_PUSH_MICROCODE_LITERAL((int)a);
}

__attribute__((noinline)) void _special_printargs_per_arg_i64(i64 a){
    hxh_PUSH_MICROCODE_LITERAL(789789);
    hxh_PUSH_MICROCODE_LITERAL((int)a);
}
__attribute__((noinline)) void _special_printargs_per_arg_f32(f32 a){
    hxh_PUSH_MICROCODE_LITERAL(123123);
    hxh_PUSH_MICROCODE_LITERAL((int)a);
}
__attribute__((noinline)) void _special_printargs_per_arg_f64(f64 a){
    hxh_PUSH_MICROCODE_LITERAL(456456);
    hxh_PUSH_MICROCODE_LITERAL((int)a);
}

void _special_printargs_end(){
    hxh_PARSE_EXECUTE();
}