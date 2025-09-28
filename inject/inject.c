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


#define DEBUG_BLACKLIST_SIZE 50
#define DEBUG_MAX_COUNT 500

#define STATS_FREQUENCIES_SIZE 600
#define STATS_MAX_COUNT_CONSIDERED 5000

#define BIGFUNC_TRACE_MAX_LINES 2000
struct{
  int debug_enabled;
  int debug_count;
  int debug_max_count;
  int debug_blacklist[DEBUG_BLACKLIST_SIZE];

  int bigfunc_trace_enabled;
  int bigfunc_trace_count;
  int bigfunc_trace_max_count;

  int stats_enabled;
  int stats_total_count;
  int stats_max_count;
  int stats_max_encountered_funcnum;
  int stats_frequencies[STATS_FREQUENCIES_SIZE];
}poopState;

void _reset_stats(){
  poopState.stats_enabled = FALSE;
  poopState.stats_max_count = STATS_MAX_COUNT_CONSIDERED;
  _memset_i32(poopState.stats_frequencies, STATS_FREQUENCIES_SIZE, 0);
  poopState.stats_total_count = 0;
  poopState.stats_max_encountered_funcnum = 0;
}

void _reset_debug(){
  poopState.debug_enabled = 0;
  _memset_i32(poopState.debug_blacklist, DEBUG_BLACKLIST_SIZE, 0);
  poopState.debug_count = 0;
  poopState.debug_max_count = DEBUG_MAX_COUNT;
}

void _reset_bigfunc_trace(){
  poopState.bigfunc_trace_count = 0;
  poopState.bigfunc_trace_max_count = BIGFUNC_TRACE_MAX_LINES;
  poopState.bigfunc_trace_enabled = FALSE;
}

void _init_all_the_things(){
  hxh_CONSOLE_LOG_CHAR_STRING("Behold!! Poo poop fart v3.1415!!...", 35);

  _reset_debug();
  _reset_stats();
  _reset_bigfunc_trace();

  hxh_PUSH_MICROCODE_LITERAL(5);
  hxh_PARSE_EXECUTE();
}

void export_enable_stats(){
  _reset_stats();
  poopState.stats_enabled = TRUE;
}

void export_enable_debug(){
  // hxh_CONSOLE_LOG_CHAR_STRING("", 15);
  _reset_debug();
  poopState.debug_enabled = TRUE;
  // if(poopState.debug_enabled){
  //   hxh_PUSH_MICROCODE_LITERAL(4);
  //   hxh_PARSE_EXECUTE();
  // }else{
  //   hxh_PUSH_MICROCODE_LITERAL(5);
  //   hxh_PARSE_EXECUTE();
  // }
}

void export_enable_bigfunc_trace(){
  _reset_bigfunc_trace();
  _reset_debug();
  poopState.bigfunc_trace_enabled = TRUE;
  poopState.debug_enabled = TRUE;
}

int _do_bigfunc_stuff(int index){
  if(poopState.bigfunc_trace_enabled){
      if(poopState.bigfunc_trace_count >= poopState.bigfunc_trace_max_count){
        _reset_bigfunc_trace();
        _reset_debug();
      }else{
        hxh_PUSH_MICROCODE_LITERAL(0);
        hxh_PUSH_MICROCODE_LITERAL(poopState.bigfunc_trace_count);
        hxh_PUSH_MICROCODE_LITERAL(index);
        hxh_PARSE_EXECUTE();

        poopState.bigfunc_trace_count++;
      }
  }
  return index;
}

__attribute__((optnone))
int inject_bigfunc_beforebranch(int index){
  return _do_bigfunc_stuff(index);
}

__attribute__((noinline)) void inject_start(){
  _init_all_the_things();
}



// __attribute__((optnone))
__attribute__((noinline)) void inject_all(){
  int func_num = special_func_number();
  if(poopState.debug_enabled){
    if(TRUE){//blacklist check
      if(poopState.debug_count >= poopState.debug_max_count){
        _reset_debug();
        hxh_PUSH_MICROCODE_LITERAL(5);
        hxh_PARSE_EXECUTE();
      }else{
        hxh_PUSH_MICROCODE_LITERAL(0);
        hxh_PUSH_MICROCODE_LITERAL(poopState.debug_count);
        hxh_PUSH_MICROCODE_LITERAL(func_num);
        special_printargs();
        hxh_PARSE_EXECUTE();
        poopState.debug_count++;
      }
    }
  }
  if(poopState.stats_enabled){
    if(poopState.stats_total_count >= poopState.stats_max_count){
      poopState.stats_enabled = FALSE;
      //print out all the frequencies?
      hxh_CONSOLE_LOG_CHAR_STRING("The total is...", 15);
      hxh_PUSH_MICROCODE_LITERAL(0);
      hxh_PUSH_MICROCODE_LITERAL(poopState.stats_total_count);
      hxh_PARSE_EXECUTE();
      for(int i=0;i<STATS_FREQUENCIES_SIZE;i++){
        int freq = poopState.stats_frequencies[i];
        if(freq > 0){
          hxh_PUSH_MICROCODE_LITERAL(0);
          hxh_PUSH_MICROCODE_LITERAL(i);
          hxh_PUSH_MICROCODE_LITERAL(freq);
          hxh_PARSE_EXECUTE();
        }
      }
    }else{
      poopState.stats_frequencies[func_num]++;
      poopState.stats_total_count++;
      poopState.stats_max_encountered_funcnum = max_i32(poopState.stats_max_encountered_funcnum, func_num);
    }
  }
  special_clear_locals();
}

// __attribute__((optnone))
// __attribute__((noinline))
// void inject_271(unsigned int a){

// }

