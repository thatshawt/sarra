#include "utils.h"
#include "poopmath.h"
#include "poopstrings.h"

// o yea
char printf_buffer[500] = {0};
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
            }else if(*format == 'd'){ //i32 i guess
                int the_int = __builtin_va_arg(argp, int);
                //put the number here i guess fam
                int printed = int_to_str(dest+outi, the_int);
                // const int digits = digits10(the_int);
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

void spoopf(char* dest, int max, char* format, ...)
{
    __builtin_va_list argp;
    __builtin_va_start(argp, format);

    vspoopf(dest, max, format, argp);

    __builtin_va_end(argp);
}

void poopf(char* format, ...)
{
    __builtin_va_list argp;
    __builtin_va_start(argp, format);
    memset_i8(printf_buffer, sizeof(printf_buffer), 0);

    vspoopf(printf_buffer, sizeof(printf_buffer)-1, format, argp);

    __builtin_va_end(argp);
    hxh_CONSOLE_LOG_CHAR_STRING(printf_buffer, strlen(printf_buffer));
    memset_i8(printf_buffer, sizeof(printf_buffer), 0);
}