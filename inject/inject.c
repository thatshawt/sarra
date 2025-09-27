#include "arras_utils.h"

struct{
  int a;
  int b;
  int c;
} caca;

struct{
  int enabled;
}debug_state;

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

// __attribute__((noinline)) void _hellnaw(){

// }

// __attribute__((optnone))
__attribute__((noinline)) void inject_all(){
  int func_num = special_func_number();
  if(debug_state.enabled){
    if(func_num != 264){
      hxh_PUSH_MICROCODE_LITERAL(0);
      hxh_PUSH_MICROCODE_LITERAL(func_num);
      special_printargs();
      hxh_PARSE_EXECUTE();
    }
  }
  special_clear_locals();
}

// __attribute__((optnone))
__attribute__((noinline)) void inject_271(unsigned int a){
  // if(debug_state.enabled){
  //   hxh_PUSH_MICROCODE_LITERAL(0);
  //   hxh_PUSH_MICROCODE_LITERAL(special_func_number());
  //   special_printargs();
  //   // hxh_PUSH_MICROCODE_LITERAL(a);
  //   hxh_PARSE_EXECUTE();
  // }
}

void export_toggle_debug_mode(){
  // hxh_CONSOLE_LOG_CHAR_STRING("", 15);
  debug_state.enabled = !debug_state.enabled;
  if(debug_state.enabled){
    hxh_PUSH_MICROCODE_LITERAL(4);
    hxh_PARSE_EXECUTE();
  }else{
    hxh_PUSH_MICROCODE_LITERAL(5);
    hxh_PARSE_EXECUTE();
  }
}

void _init_all_the_things(){
  hxh_CONSOLE_LOG_CHAR_STRING("Behold!! Poo poop fart v3.1415!!...", 35);

  debug_state.enabled = 0;
  hxh_PUSH_MICROCODE_LITERAL(5);
  hxh_PARSE_EXECUTE();
}

void inject_start(){
  _init_all_the_things();
}