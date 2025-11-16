#include "special.h"
#include "poopstrings.h"
#include "utils.h"

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

struct Params_Struct params_struct;

__attribute__((noinline))
void param_struct_reset()
{
    memset(params_struct.i32params, 0, sizeof(params_struct.i32params));
    memset(params_struct.i64params, 0, sizeof(params_struct.i64params));
    memset(params_struct.f32params, 0, sizeof(params_struct.f32params));
    memset(params_struct.f64params, 0, sizeof(params_struct.f64params));

    params_struct.param_i = 0;

    memset(params_struct.paramTypes, 0, sizeof(params_struct.paramTypes));
}

void _special_updateparams_begin()
{
    UNIQUEIFER;
    param_struct_reset();
}
void _special_updateparams_perarg_i32(s32 arg)
{
    s32 parami = params_struct.param_i;
    params_struct.i32params[parami] = arg;
    
    params_struct.paramTypes[parami] = PARAM_T_I32;

    params_struct.param_i++;
}
void _special_updateparams_perarg_i64(s64 arg)
{
    s32 parami = params_struct.param_i;
    params_struct.i64params[parami] = arg;
    
    params_struct.paramTypes[parami] = PARAM_T_I64;

    params_struct.param_i++;
}
void _special_updateparams_perarg_f32(f32 arg)
{
    s32 parami = params_struct.param_i;
    params_struct.f32params[parami] = arg;
    
    params_struct.paramTypes[parami] = PARAM_T_F32;

    params_struct.param_i++;
}
void _special_updateparams_perarg_f64(f64 arg)
{
    s32 parami = params_struct.param_i;
    params_struct.f64params[parami] = arg;
    
    params_struct.paramTypes[parami] = PARAM_T_F64;

    params_struct.param_i++;
}
void _special_updateparams_end()
{
    UNIQUEIFER;
    //do nothing i think
}


// #define MAX_I32_LOCALS 500
// #define MAX_I64_LOCALS 500
// #define MAX_F32_LOCALS 500
// #define MAX_F64_LOCALS 500

struct LocalsStruct locals_struct;

s32 _special_bigfunc_localset_enabled(){
    return locals_struct.enabled;
}

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