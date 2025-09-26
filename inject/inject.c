#include "arras_utils.h"

struct{
  int a;
  int b;
  int c;
} caca;

#define FOR(a,b) for(int a=0;a<100;a++){b; import_e_t_get(a);}
void _hithere(int hithere){
  // FOR(a,FOR(b,FOR(c,FOR(d,FOR(e,import_e_t_get(hithere))))));
  caca.a = i32LOAD(123);
  caca.b = i32LOAD(456);
  caca.c = i32LOAD(789);
  i32STORE(123, caca.a + caca.b + caca.c);

  caca.a = special_arras_memory_i32_load(123);
  special_arras_memory_i32_store(123, 3);

  // import_js_debug(hithere);
}

// __attribute__((optnone))
void inject_func_all(int funcNum, int b, long c){
  // i32STORE(123, i32LOAD(123)+1);
  // import_e_t_get(funcNum+9999);
  // seperate_func_hithere(1234);
  // special_clear_locals();
  // return 1;
}

__attribute__((noinline))
void _hellnaw(unsigned int a){
  // hxh_CONSOLE_LOG_CHAR_STRING("whats there o.O", 15);
  // unsigned int result = special_arras_memory_i32_load(a);
  // struct int32_char_view bytes = (struct int32_char_view)value;
  hxh_PUSH_MICROCODE_LITERAL(3);
  for(int i=0;i<4;i++){
    int value = special_arras_memory_i32_load(a+(i*4));
    value = SWAP_ENDIAN_32(value);
    hxh_PUSH_MICROCODE_LITERAL(INT32_BYTE0(value));
    hxh_PUSH_MICROCODE_LITERAL(INT32_BYTE1(value));
    hxh_PUSH_MICROCODE_LITERAL(INT32_BYTE2(value));
    hxh_PUSH_MICROCODE_LITERAL(INT32_BYTE3(value));
  }
  hxh_PARSE_EXECUTE();
}

// __attribute__((optnone))
__attribute__((noinline))
void inject_func_271(unsigned int a){
  _hellnaw(a);
}

