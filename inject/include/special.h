#include "utils.h"

void _special_printargs_begin();
void _special_printargs_per_arg_i32(i32 a);
void _special_printargs_per_arg_i64(i64 a);
void _special_printargs_per_arg_f32(f32 a);
void _special_printargs_per_arg_f64(f64 a);
void _special_printargs_end();


// TODO: implement this 
void _special_bigfunc_localset_i32(i32 index, i32 value);
void _special_bigfunc_localset_i64(i32 index, i64 value);
void _special_bigfunc_localset_f32(i32 index, f32 value);
void _special_bigfunc_localset_f64(i32 index, f64 value);

i32 special_bigfunc_localget_i32(i32 index);
i64 special_bigfunc_localget_i64(i32 index);
f32 special_bigfunc_localget_f32(i32 index);
f64 special_bigfunc_localget_f64(i32 index);