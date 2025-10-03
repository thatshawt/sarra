#include "utils.h"

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

void _hxh_breakpoint(){
    hxh_PUSH_MICROCODE_LITERAL(6);
    hxh_PARSE_EXECUTE();
}

struct{int what_the_sigma;}nothing_state;
__attribute__((noinline)) void export_nothing(int a){
    //what does it really do... i dont know...
    nothing_state.what_the_sigma += special_arras_memory_i32_load(123456) + a;
}