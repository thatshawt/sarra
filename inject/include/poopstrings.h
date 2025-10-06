#include "poopint.h"

void *memset(void *dest, int c, size_t n);
int memcmp(const void *vl, const void *vr, size_t n);
void *memchr(const void *src, int c, size_t n);
void *memcpy(void *restrict dest, const void *restrict src, size_t n);

size_t strlen(const char *s);
size_t strcspn(const char *s, const char *c);
int strncmp(const char *_l, const char *_r, size_t n);
char *strpbrk(const char *s, const char *b);
char *strchr(const char *s, int c);
char *strstr(const char *h, const char *n);
