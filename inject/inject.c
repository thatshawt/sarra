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
#define CHACHA_MAX_TOTAL 1000
#define CHACHA_BUFFER_SIZE 2000
struct{
  int debug_enabled;
  int debug_count;
  int debug_max_count;
  int debug_blacklist[DEBUG_BLACKLIST_SIZE];

  int bigfunc_trace_enabled;
  int bigfunc_trace_count;
  int bigfunc_trace_max_count;

  
  int bigfunc_chacha_enabled;
  int bigfunc_chacha_count;
  int bigfunc_chacha_count_total;
  char bigfunc_chacha_buffer[CHACHA_BUFFER_SIZE];
  int bigfunc_chacha_buffer_i;

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

void _reset_chacha(){
  poopState.bigfunc_chacha_enabled = FALSE;
  poopState.bigfunc_chacha_count = 0;
  poopState.bigfunc_chacha_count_total = CHACHA_MAX_TOTAL;
  poopState.bigfunc_chacha_buffer_i = 0;
  _memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
}

void _init_all_the_things(){
  hxh_CONSOLE_LOG_CHAR_STRING("Banna Turd Labs", 15);

  _reset_debug();
  _reset_stats();
  _reset_bigfunc_trace();
  _reset_chacha();

  hxh_PUSH_MICROCODE_LITERAL(HXH_WINDOW_POOP_SET_NULL);
  hxh_PARSE_EXECUTE();
}

void export_enable_stats(){
  _reset_stats();
  poopState.stats_enabled = TRUE;
}

void export_chacha_enable(){
  _reset_chacha();
  poopState.bigfunc_chacha_enabled = TRUE;
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

__attribute__((noinline))
int _do_bigfunc_stuff(int index){
  if(poopState.bigfunc_trace_enabled){
      if(poopState.bigfunc_trace_count >= poopState.bigfunc_trace_max_count){
        _reset_bigfunc_trace();
        _reset_debug();
      }else{
        hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG);
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
  UNIQUEIFER;
  return _do_bigfunc_stuff(index);
}

int _special_bigfunc_chachabyte_1(int the_byte){
  UNIQUEIFER;

  if(poopState.bigfunc_chacha_enabled){
    if(poopState.bigfunc_chacha_count >= poopState.bigfunc_chacha_count_total){
      _reset_chacha();
    }else{
      poopState.bigfunc_chacha_buffer[poopState.bigfunc_chacha_buffer_i++] = the_byte;

      if(poopState.bigfunc_chacha_buffer_i == CHACHA_BUFFER_SIZE){
        _hxh_breakpoint();
        _reset_chacha();
        // // hxh_CONSOLE_LOG_CHAR_STRING(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE);

        // poopState.bigfunc_chacha_buffer_i = 0;
        // _memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
        // poopState.bigfunc_chacha_count++;
      }
    }
  }

  return the_byte;
}

int _special_bigfunc_chachabyte_2(int the_byte){
  UNIQUEIFER;
  return _special_bigfunc_chachabyte_1(the_byte);
}

// __attribute__((noinline))
// int _bigfunc_chachabyte_1(int the_byte){
//   export_nothing(212);
//   return the_byte;
// }

// // __attribute__((noinline))
// int inject_bigfunc_chachabyte_1(int the_byte){
//   return _bigfunc_chachabyte_1(the_byte);
// }

// __attribute__((noinline)) void inject_start(){
//   _init_all_the_things();
// }

// __attribute__((noinline)) void inject_271(){
  
// }

// __attribute__((optnone))
__attribute__((noinline)) void inject_all(){
  int func_num = special_func_number();

  if(func_num == special_start_func_number()){
    // _hxh_breakpoint();
    _init_all_the_things();
  }

  if(func_num == 271 && poopState.debug_enabled){
    _hxh_breakpoint();
  }

  if(poopState.debug_enabled){
    if(TRUE){//blacklist check
      if(poopState.debug_count >= poopState.debug_max_count){
        _reset_debug();
        hxh_PUSH_MICROCODE_LITERAL(HXH_WINDOW_POOP_SET_NULL);
        hxh_PARSE_EXECUTE();
      }else{
        hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG);
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
      hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG);
      hxh_PUSH_MICROCODE_LITERAL(poopState.stats_total_count);
      hxh_PARSE_EXECUTE();
      for(int i=0;i<STATS_FREQUENCIES_SIZE;i++){
        int freq = poopState.stats_frequencies[i];
        if(freq > 0){
          hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG);
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

