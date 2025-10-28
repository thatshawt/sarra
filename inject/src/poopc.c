#include "utils.h"
#include "poopmath.h"
#include "poopstrings.h"

// o yea
char printf_buffer[5000] = {0};
// aint no way...
// borrowed from this website some code https://jameshfisher.com/2016/11/23/c-varargs/
void vspoopf(char* dest, int max, char* format, __builtin_va_list argp)
{
    // memset_i8(printf_buffer, sizeof(printf_buffer), 0);
    int outi = 0;
    // __builtin_va_start(argp, format);
    while (*format != '\0' && outi < max) {
        if (*format == '%') {
            format++;
            if (*format == '%') {
                dest[outi++] = '%';
            } else if (*format == 'c') {
                char char_to_print = __builtin_va_arg(argp, int);
                dest[outi++] = char_to_print;
            } else if(*format == 's'){
                char* string_to_print = __builtin_va_arg(argp, char*);
                const int string_length = strlen(string_to_print);
                strcat(dest+outi, string_to_print);
                outi += string_length;
            }else if(*format == 'd'){ //i32
                int the_int = __builtin_va_arg(argp, i32);
                //put the number here i guess fam
                int printed = int_to_str(dest+outi, the_int);
                // const int digits = digits10(the_int);
                outi += printed;
            }else if(*format == 'l'){ //i64
                i64 the_i64 = __builtin_va_arg(argp, i64);
                int printed = i64_to_str(dest+outi, the_i64);
                outi += printed;
            } else {
            // fputs("Not implemented", stdout);
            // idk vro :skull:
            }
        } else {
            dest[outi++] = *format;
        }

        format++;
    }
}

void _spoopf(char* dest, int max, char* format, ...)
{
    // hxh_CONSOLE_LOG_CHAR_STRING("spoopf called",13);
    __builtin_va_list argp;
    __builtin_va_start(argp, format);

    // take out the 0 that we put with the macro
    __builtin_va_arg(argp, i32);

    vspoopf(dest, max, format, argp);

    __builtin_va_end(argp);
}

void _poopf(char* format, ...)
{
    // hxh_CONSOLE_LOG_CHAR_STRING("poopf called",13);
    __builtin_va_list argp;
    __builtin_va_start(argp, format);
    // take out the 0 that we put with the macro
    __builtin_va_arg(argp, i32);

    memset_i8(printf_buffer, sizeof(printf_buffer), 0);

    // hxh_CONSOLE_LOG_CHAR_STRING("now calling vspoopf",20);

    vspoopf(printf_buffer, sizeof(printf_buffer)-1, format, argp);

    // hxh_CONSOLE_LOG_CHAR_STRING("after vspoopf call",19);

    __builtin_va_end(argp);
    hxh_reset();
    hxh_CONSOLE_LOG_CHAR_STRING(printf_buffer, strlen(printf_buffer));
    memset_i8(printf_buffer, sizeof(printf_buffer), 0);
}