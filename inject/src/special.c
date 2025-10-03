#include "utils.h"

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