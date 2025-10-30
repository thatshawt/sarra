#include "utils.h"
#include "poopstrings.h"

void memset_i32(s32* start, int size, s32 value)
{
    for(int i=0;i<size;i++){
        i32STORE(start+i, value);
    }
}

void memset_i8(u8* start, int size, u8 value)
{
    for(int i=0;i<size;i++){
        i8STORE(start+i, value);
    }
}

__attribute__((optnone))
__attribute__((noinline))
s64 hxh_parse_execute(){
    return import_e_t_get(9999);
}

// __attribute__((optnone))
__attribute__((noinline))
s64 hxh_reset(){
    return import_e_t_get(9998);
}

// __attribute__((optnone))
__attribute__((noinline))
s64 hxh_push_microcode_literal(s64 value)
{
    s64 status = hxh_extended_literals_status();
    if(status == TRUE){
        return import_e_t_get(value);
    }else{
        return import_e_t_get(10000L+((s64)value));
    }
}
__attribute__((noinline))
void hxh_extended_literals_on(){
    import_e_t_get(9997L);
}

__attribute__((noinline))
void hxh_extended_literals_off(){
    import_e_t_get(9996L);
}

__attribute__((noinline))
s64 hxh_extended_literals_status(){
    return import_e_t_get(9995L);
}

void hxh_console_log_char_string(u8* str, s32 size)
{
    hxh_push_microcode_literal(3);
    _hxh_add_char_string_microcode(str, size);
    hxh_parse_execute();
}

void hxh_console_log_literal(s64 value)
{
    hxh_push_microcode_literal(HXH_ARRAY_CONSOLE_LOG);
    hxh_push_microcode_literal(value);
    hxh_parse_execute();
}

#pragma clang diagnostic push
//TODO: how do i remove the warning -Wpointer-to-int-cast :sob:
#pragma clang diagnostic ignored "-Wpointer-to-int-cast"
#pragma clang diagnostic ignored "-Wpointer-sign"
char* memcpy_i8_to_arras_memory(char* dest, char* src, int n){
    unsigned char *d = dest;
	const unsigned char *s = src;

	for (int i=0;i<n;i++){
        int dval = special_arras_memory_i32_load((int)dest + (i/4)*4);
        int sval = (int)*s++;

        switch(i % 4){
            case 0:
                dval = (dval & 0xFFFFFF00) | (sval << 0);
                break;
            case 1:
                dval = (dval & 0xFFFF00FF) | (sval << 8);
                break;
            case 2:
                dval = (dval & 0xFF00FFFF) | (sval << 16);
                break;
            case 3:
                dval = (dval & 0x00FFFFFF) | (sval << 24);
                break;
        }

        special_arras_memory_i32_store((int)dest + (i/4)*4, dval);
    } 

    hxh_parse_execute();

	return dest;
}
#pragma clang diagnostic pop


void _hxh_add_char_string_microcode(u8* value, s32 size)
{
    for(int i=0;i<size;i++){
        hxh_push_microcode_literal(*(value+i));
    }
}

void _hxh_add_int_string_microcode(int* value, int size){
    for(int i=0;i<size;i++){
        hxh_push_microcode_literal(*(value+i));
    }
}

void _hxh_breakpoint(){
    hxh_push_microcode_literal(6);
    hxh_parse_execute();
}

struct{s32 what_the_sigma;}nothing_state;
__attribute__((noinline))
void export_nothing(s32 a){
    //what does it really do... i dont know...
    nothing_state.what_the_sigma += special_arras_memory_i32_load(123456) + a;
}