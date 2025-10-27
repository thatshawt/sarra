#include "utils.h"
#include "poopstrings.h"

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

// o yea
char printf_buffer[500] = {0};
// aint no way...
// borrowed from this website some code https://jameshfisher.com/2016/11/23/c-varargs/
void poopf(char* format, ...)
{
    int outi = 0;
  __builtin_va_list argp;
  __builtin_va_start(argp, format);
  while (*format != '\0' && outi < sizeof(printf_buffer)) {
    if (*format == '%') {
      format++;
      if (*format == '%') {
        printf_buffer[outi++] = '%';
      } else if (*format == 'c') {
        char char_to_print = __builtin_va_arg(argp, int);
        printf_buffer[outi++] = char_to_print;
      } else if(*format == 's'){
        char* string_to_print = __builtin_va_arg(argp, char*);
        const int string_length = strlen(string_to_print);
        strcat(printf_buffer+(outi), string_to_print);
        outi += string_length;
      } else {
        // fputs("Not implemented", stdout);
        // idk vro :skull:
      }
    } else {
        printf_buffer[outi++] = *format;
    }
    format++;
  }

  hxh_CONSOLE_LOG_CHAR_STRING(printf_buffer, outi);

  __builtin_va_end(argp);
  memset_i8(printf_buffer, sizeof(printf_buffer), 0);
}

__attribute__((optnone))
__attribute__((noinline))
int hxh_parse_execute(){
    return import_e_t_get(9999);
}

// __attribute__((optnone))
__attribute__((noinline))
int hxh_reset(){
    return import_e_t_get(9998);
}

// __attribute__((optnone))
__attribute__((noinline))
int hxh_push_microcode_literal(long value){
    int status = hxh_extended_literals_status();
    if(status == TRUE){
        return import_e_t_get(value);
    }else{
        return import_e_t_get(10000+((long)value));
    }
}
__attribute__((noinline))
void hxh_extended_literals_on(){
    import_e_t_get(9997);
}

__attribute__((noinline))
void hxh_extended_literals_off(){
    import_e_t_get(9996);
}

__attribute__((noinline))
int hxh_extended_literals_status(){
    return import_e_t_get(9995);
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
__attribute__((noinline))
void export_nothing(int a){
    //what does it really do... i dont know...
    nothing_state.what_the_sigma += special_arras_memory_i32_load(123456) + a;
}