#include "arras_utils.h"

void inject_func_all(int funcNum, int b, long c){
  import_js_debug(funcNum);
  // special_clear_locals();
  // return 1;
}

#define FOR(a,b) for(int a=0;a<100;a++){b; nothing(a);}
extern void nothing(int a);
void testFunction(int hithere){
  FOR(a,FOR(b,FOR(c,FOR(d,FOR(e,nothing(1))))));
  import_js_debug(hithere);
}