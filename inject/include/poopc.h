#include "utils.h"

// #include <string.h>

// the misfit of demon king academy
// Demon King Daimao, 12 episode masterpiece

#ifndef POOPC_IMPL
#define POOPC_IMPL
int strncmp(const char *_l, const char *_r, size_t n)
{
	const unsigned char *l=(void *)_l, *r=(void *)_r;
	if (!n--) return 0;
	for (; *l && *r && n && *l == *r ; l++, r++, n--);
	return *l - *r;
}

i32 _max_i32(i32 a, i32 b){
    return a > b ? a:b;
}

i32 _min_i32(i32 a, i32 b){
    return a < b ? a:b;
}

void _memset_i32(int* start, int size, int value){
    for(int i=0;i<size;i++){
        i32STORE(start+i, value);
    }
}

void _memset_i8(char* start, int size, char value){
    for(int i=0;i<size;i++){
        i8STORE(start+i, value);
    }
}

#endif