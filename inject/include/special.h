#ifndef SPECIAL_H
#define SPECIAL_H
#include "wasmtypes.h"

enum Param_Type{PARAM_T_NIL, PARAM_T_I32, PARAM_T_I64, PARAM_T_F32, PARAM_T_F64};

#define MAX_PARAM_STRUCT_PARAMS 50

struct Params_Struct{ // simple as a pimple
    s32 i32params[MAX_PARAM_STRUCT_PARAMS];
    s64 i64params[MAX_PARAM_STRUCT_PARAMS];
    f32 f32params[MAX_PARAM_STRUCT_PARAMS];
    f64 f64params[MAX_PARAM_STRUCT_PARAMS];
    s32 param_i;
    enum Param_Type paramTypes[MAX_PARAM_STRUCT_PARAMS];
};

void _special_updateparams_begin();
void _special_updateparams_perarg_i32(s32 arg);
void _special_updateparams_perarg_i64(s64 arg);
void _special_updateparams_perarg_f32(f32 arg);
void _special_updateparams_perarg_f64(f64 arg);
void _special_updateparams_end();

void _special_printargs_begin(); // TODO this isnt used?
void _special_printargs_per_arg_i32(s32 a);
void _special_printargs_per_arg_i64(s64 a);
void _special_printargs_per_arg_f32(f32 a);
void _special_printargs_per_arg_f64(f64 a);
void _special_printargs_end();


#define MAX_LOCALS_STRUCT_LOCALS 500

struct LocalsStruct{
    s32 i32Locals[MAX_LOCALS_STRUCT_LOCALS];
    f32 f32Locals[MAX_LOCALS_STRUCT_LOCALS];
    s64 i64Locals[MAX_LOCALS_STRUCT_LOCALS];
    f64 f64Locals[MAX_LOCALS_STRUCT_LOCALS];
    s32 enabled;
};

#endif