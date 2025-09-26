#define i32LOAD(address) (*((int*)address))
#define i32STORE(address, value) ((*((int*)address)) = value)

#define SWAP_ENDIAN_32(num) ((((num)>>24)&0xff) | \
                    (((num)<<8)&0xff0000) | \
                    (((num)>>8)&0xff00) | \
                    (((num)<<24)&0xff000000))

#define INT32_BYTE0(n) ((n >> 24) & 0xFF)
#define INT32_BYTE1(n) ((n >> 16) & 0xFF)
#define INT32_BYTE2(n) ((n >> 8) & 0xFF)
#define INT32_BYTE3(n) (n & 0xFF)

// (t) => {
//   e[t] = null;
// },
// extern void import_e_t_set_null(int t);

// (t) => e[t],
extern int import_e_t_get(int t);

// (t) => e[t](),
extern int import_e_t_call(int t);

// this should be handled by the injection scripts and will be string replaced with some other code that clears all the locals of a function...
// TODO implement later
extern void special_clear_locals();

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