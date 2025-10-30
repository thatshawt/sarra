#include "special.h"

void _special_printargs_begin()
{
    hxh_push_microcode_literal(0);
}

__attribute__((noinline))
void _special_printargs_per_arg_i32(s32 a)
{
    hxh_push_microcode_literal((int)a);
}

__attribute__((noinline))
void _special_printargs_per_arg_i64(s64 a)
{
    hxh_push_microcode_literal(789789);
    hxh_push_microcode_literal((int)a);
}
__attribute__((noinline))
void _special_printargs_per_arg_f32(f32 a)
{
    hxh_push_microcode_literal(123123);
    hxh_push_microcode_literal((int)a);
}
__attribute__((noinline))
void _special_printargs_per_arg_f64(f64 a)
{
    hxh_push_microcode_literal(456456);
    hxh_push_microcode_literal((int)a);
}

void _special_printargs_end()
{
    hxh_parse_execute();
}



#define MAX_I32_LOCALS 500
#define MAX_I64_LOCALS 500
#define MAX_F32_LOCALS 500
#define MAX_F64_LOCALS 500

struct{
    s32 i32Locals[MAX_I32_LOCALS];
    f32 f32Locals[MAX_F32_LOCALS];
    s64 i64Locals[MAX_I64_LOCALS];
    f64 f64Locals[MAX_F64_LOCALS];
}locals_struct;

void _special_bigfunc_localset_i32(s32 index, s32 value){
    locals_struct.i32Locals[index] = value;
}
void _special_bigfunc_localset_i64(s32 index, s64 value){
    locals_struct.i64Locals[index] = value;
}
void _special_bigfunc_localset_f32(s32 index, f32 value){
    locals_struct.f32Locals[index] = value;
}
void _special_bigfunc_localset_f64(s32 index, f64 value){
    locals_struct.f64Locals[index] = value;
}

s32 special_bigfunc_localget_i32(s32 index){
    return locals_struct.i32Locals[index];
}
s64 special_bigfunc_localget_i64(s32 index){
    return locals_struct.i64Locals[index];
}
f32 special_bigfunc_localget_f32(s32 index){
    return locals_struct.f32Locals[index];
}
f64 special_bigfunc_localget_f64(s32 index){
    return locals_struct.f64Locals[index];
}