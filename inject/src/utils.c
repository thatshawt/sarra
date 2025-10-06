#include "utils.h"

i32 max_i32(i32 a, i32 b)
{
    return a > b ? a:b;
}

i32 min_i32(i32 a, i32 b)
{
    return a < b ? a:b;
}

void memset_i32(int* start, int size, int value)
{
    for(int i=0;i<size;i++){
        i32STORE(start+i, value);
    }
}

void memset_i8(char* start, int size, char value)
{
    for(int i=0;i<size;i++){
        i8STORE(start+i, value);
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpointer-sign"
char* memcpy_i8_to_arras_memory(char* dest, char* src, int n){
    unsigned char *d = dest;
	const unsigned char *s = src;

    // hxh_RESET();
    // hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG);

    int a = 0;
	for (int i=0;i<n;i++){
        //*d++ = *s++;
        int dval = special_arras_memory_i32_load((int)dest + (i/4)*4);
        int sval = (int)*s++;

        // hxh_PUSH_MICROCODE_LITERAL(dval);
        // hxh_PUSH_MICROCODE_LITERAL(sval);

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
        // hxh_PUSH_MICROCODE_LITERAL(dval);

        special_arras_memory_i32_store((int)dest + (i/4)*4, dval);
        // d++;

        if(i % 4 == 0)a++;
    } 

    hxh_PARSE_EXECUTE();

	return dest;
}
#pragma clang diagnostic pop


void _hxh_add_char_string_microcode(char* value, int size){
    for(int i=0;i<size;i++){
        hxh_PUSH_MICROCODE_LITERAL(*(value+i));
    }
}

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