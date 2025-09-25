#include "arras_utils.h"

#define FOR(a,b) for(int a=0;a<100;a++){b; import_e_t_get(a);}
void seperate_func_hithere(int hithere){
  FOR(a,FOR(b,FOR(c,FOR(d,FOR(e,import_e_t_get(hithere))))));
  // import_js_debug(hithere);
}

// __attribute__((optnone))
void inject_func_all(int funcNum, int b, long c){
  // import_e_t_get(funcNum+9999);
  // seperate_func_hithere(1234);
  // special_clear_locals();
  // return 1;
}

__attribute__((noinline))
void seperate_func_hellnaw(){
  int a;
  hxh_LOAD_INTO_VAR(a, 0);
  hxh_STORE(0, a+314);
  hxh_CONSOLE_LOG(a);
}

// __attribute__((optnone))
__attribute__((noinline))
void inject_func_486(){
  seperate_func_hellnaw();
}

