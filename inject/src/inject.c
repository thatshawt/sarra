#include "utils.h"
#include "poopstrings.h"
#include "poopmath.h"

#define DEBUG_BLACKLIST_SIZE 50
#define DEBUG_MAX_COUNT 500

#define STATS_FREQUENCIES_SIZE 600
#define STATS_MAX_COUNT_CONSIDERED 5000

#define BIGFUNC_TRACE_MAX_LINES 500

#define CHACHA_MAX_TOTAL 1
#define CHACHA_BUFFER_SIZE 2000

struct{
  s32 debug_enabled;
  s32 debug_count;
  s32 debug_max_count;
  s32 debug_blacklist[DEBUG_BLACKLIST_SIZE];

  s32 bigfunc_trace_enabled;
  s32 bigfunc_trace_count;
  s32 bigfunc_trace_max_count;
  
  s32 bigfunc_chacha_enabled;
  s32 bigfunc_chacha_count;
  s32 bigfunc_chacha_count_total;
  u8 bigfunc_chacha_buffer[CHACHA_BUFFER_SIZE];
  // s32 bigfunc_chacha_buffer_i;
  s32 bigfunc_chacha_firstbyte;
  s32 bigfunc_chacha_firstaddress;
  s32 bigfunc_chacha_lastaddress;
  s32 bigfunc_chacha_byte_i;
  s32 bigfunc_chacha_header;

  s32 stats_enabled;
  s32 stats_total_count;
  s32 stats_max_count;
  s32 stats_max_encountered_funcnum;
  s32 stats_frequencies[STATS_FREQUENCIES_SIZE];
}poopState;

void _reset_stats(){
  poopState.stats_enabled = FALSE;
  poopState.stats_max_count = STATS_MAX_COUNT_CONSIDERED;
  memset_i32(poopState.stats_frequencies, STATS_FREQUENCIES_SIZE, 0);
  poopState.stats_total_count = 0;
  poopState.stats_max_encountered_funcnum = 0;
}

void _reset_debug(){
  poopState.debug_enabled = 0;
  memset_i32(poopState.debug_blacklist, DEBUG_BLACKLIST_SIZE, 0);
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
  // poopState.bigfunc_chacha_buffer_i = 0;
  memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
  poopState.bigfunc_chacha_byte_i = 0;
  poopState.bigfunc_chacha_firstbyte = 0;
  poopState.bigfunc_chacha_header = 0;
}

void _init_all_the_things(){
  poopf((u8*)"Welcome to Bananan Turd Labs. \nCompiled: '%s'", __DATETIME__);

  poopf((u8*)"what da-|%d %d %l|-number!?", (s32)123, (s32)-1234, (s64)123456789123123123);

  _reset_debug();
  _reset_stats();
  _reset_bigfunc_trace();
  _reset_chacha();

  hxh_push_microcode_literal(HXH_WINDOW_POOP_SET_NULL);
  hxh_parse_execute();
  
  // hxh_reset();
  // poopf("aint no way?! |%c%c%c%c|", 'H','I','!','!');
  // poopf("what the |%s|?!", "FISHY WISHY");
}

void export_enable_stats(){
  _reset_stats();
  poopState.stats_enabled = TRUE;
}

void export_chacha_enable(int pleaseWork){
  _reset_chacha();
  poopState.bigfunc_chacha_enabled = TRUE;
  poopState.bigfunc_chacha_header = pleaseWork;
  hxh_console_log_literal(poopState.bigfunc_chacha_header);
}

void export_enable_debug(){
  // hxh_CONSOLE_LOG_CHAR_STRING("", 15);
  _reset_debug();
  poopState.debug_enabled = TRUE;
}

void export_enable_bigfunc_trace(){
  _reset_bigfunc_trace();
  _reset_debug();
  poopState.bigfunc_trace_enabled = TRUE;
  poopState.debug_enabled = TRUE;
}

void export_wasm_arras_memsize(){
  hxh_console_log_literal(special_arras_memory_memory_size());
}

#define VALID_ARRAS_MEMLOCATION(x) ( ((x) > 0) && ((x) < special_arras_memory_memory_size()*PAGESIZE_BYTES) )



u8 n_point[100] = {0};
u8 g_point[100] = {0};
u8 xd_point[100] = {0};
int _special_bigfunc_beforebranch(s32 index){
  UNIQUEIFER;

  // hxh_console_log_literal(123);
  // poopf("homie");

  if(poopState.bigfunc_trace_enabled){
    if(poopState.bigfunc_trace_count >= poopState.bigfunc_trace_max_count){
      _reset_bigfunc_trace();
      _reset_debug();
    }else{
      
      s32 var_r = special_bigfunc_localget_i32(17);
      s32 var_y = special_bigfunc_localget_i32(24);
      s32 var_fa = special_bigfunc_localget_i32(31);
      s32 var_n = special_bigfunc_localget_i32(13);
      
      s32 var_g = special_bigfunc_localget_i32(6);
      s64 var_xd = special_bigfunc_localget_i64(127);
      
      hxh_console_log_literal(123);
      // u8* hithere = "hi there";
      _poopf("%d %d %d %d", (s32)123, (s32)456, (s32)789, (s32)123);

      hxh_reset();

      memset(n_point, 0, sizeof(n_point));
      memset(g_point, 0, sizeof(g_point));
      memset(xd_point, 0, sizeof(xd_point));

      if(VALID_ARRAS_MEMLOCATION(var_n)){
        int_to_str(n_point, special_arras_memory_i32_load(var_n));
      }
      // else{
      //   strcat(n_point, "nothing");
      // }

      // poopf("loaded n");

      if(VALID_ARRAS_MEMLOCATION(var_g)){
        int_to_str(g_point, special_arras_memory_i32_load(var_g));
      }
      // else{
      //   strcat(g_point, "nothing");
      // }

      // poopf("loaded g");

      if(VALID_ARRAS_MEMLOCATION((s32)var_xd)){
        int_to_str(xd_point, special_arras_memory_i32_load((s32)var_xd));
      }
      // else{
      //   strcat(xd_point, "nothing");
      // }

      // poopf("loaded xd");
      
      poopf("fa test=%d, digits=%d, ", var_fa,  digits10(var_fa));

      // // poopf("got this far");
      // poopf((u8*)"%d| fa=%d, y=%d, r=%d, n=%d, *n=%s, g=%d, *g=%s, xd=%l, *xd=%s",
      //   poopState.bigfunc_trace_count,
      //   var_fa, var_y, var_r,
      //   var_n, n_point,
      //   var_g, g_point,
      //   var_xd, xd_point
      // );

      poopState.bigfunc_trace_count++;
      
      // if(index == 550){
      //   _hxh_breakpoint();
      // }
    }
  }

  return index;
}

// __attribute__((optnone))
// int inject_bigfunc_beforebranch(int index){
//   UNIQUEIFER;
//   return _special_bigfunc_beforebranch(index);
// }

void add_chacha_byte(int address, int the_byte){
  if(poopState.bigfunc_chacha_byte_i == 0){
      // hxh_reset();
      poopState.bigfunc_chacha_firstbyte = the_byte;
      poopState.bigfunc_chacha_firstaddress = address;
      // hxh_push_microcode_literal(HXH_ARRAY_CONSOLE_LOG);
    }
    // hxh_push_microcode_literal(the_byte);
    poopState.bigfunc_chacha_buffer[poopState.bigfunc_chacha_byte_i % CHACHA_BUFFER_SIZE] = the_byte;
    poopState.bigfunc_chacha_byte_i++;
    poopState.bigfunc_chacha_lastaddress = address;
}

// void _special_bigfunc_chachabyte_2(int address, int the_byte);
void _special_bigfunc_chachabyte_1(s32 address, s32 the_byte){
  UNIQUEIFER;

  // hxh_reset();
  // hxh_CONSOLE_LOG_CHAR_STRING("Behold the bytes1", 17);

  // if(poopState.bigfunc_chacha_enabled){
  //   hxh_CONSOLE_LOG_CHAR_STRING("Behold the bytes1", 17);
  //   _reset_chacha();
  // }
  add_chacha_byte(address, the_byte);
  special_arras_memory_i32_store8(address, the_byte);
  // hxh_reset();
  // _special_bigfunc_chachabyte_2(address, the_byte);
}

void _special_bigfunc_chachabyte_2(s32 address, s32 the_byte){
  UNIQUEIFER;
  if(poopState.bigfunc_chacha_enabled == TRUE){
    add_chacha_byte(address, the_byte);
  }

  special_arras_memory_i32_store8(address, the_byte);
  // hxh_reset();
}

void _special_bigfunc_chachafinish_2();

void _special_bigfunc_chachafinish_1(){
  UNIQUEIFER;
  // if(poopState.bigfunc_chacha_enabled && poopState.bigfunc_chacha_byte_i > 0){
  //   hxh_parse_execute();
  //   hxh_CONSOLE_LOG_CHAR_STRING("Behold the bytes!!", 19);
  //   poopState.bigfunc_chacha_byte_i = 0;
  //   // if(poopState.bigfunc_chacha_count++ >= poopState.bigfunc_chacha_count_total){
  //       _reset_chacha();
  //   // }
  // }
  // _special_bigfunc_chachafinish_2();
  // if(poopState.bigfunc_chacha_enabled){
  // if(poopState.bigfunc_chacha_firstbyte == 'M'){
  //   hxh_console_log_literal(poopState.bigfunc_chacha_byte_i);
  // }
  // if(poopState.bigfunc_chacha_firstbyte == 'M' && (poopState.bigfunc_chacha_byte_i == 17)){

  //   }
  // }

  poopState.bigfunc_chacha_byte_i = 0;
  poopState.bigfunc_chacha_firstbyte = 0;
  // hxh_reset();
  memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
  // }
}

void _special_bigfunc_chachafinish_2(){
  UNIQUEIFER;

  // _special_bigfunc_chachafinish_1();

  if(poopState.bigfunc_chacha_enabled){
    // char* result = strstr(poopState.bigfunc_chacha_buffer, "123456789");
    const int firstByte = poopState.bigfunc_chacha_firstbyte;
    if(
      // (firstByte != 98 && firstByte != 117 && firstByte != 112)
      (firstByte == poopState.bigfunc_chacha_header)
      && poopState.bigfunc_chacha_byte_i > 0){
      // hxh_parse_execute();
      // hxh_console_log_literal(poopState.bigfunc_chacha_byte_i);

      // just makes me reload my game...
      // if(firstByte == 'M'){
      //   char msg[] = "did it";
      //   hxh_CONSOLE_LOG_CHAR_STRING(msg, strlen(msg));
      //   //[77, 240, 70, 64, 202, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 1]
      //   if(poopState.bigfunc_chacha_byte_i == 16){
      //     const char forbiddenStrHeehee[] = {91,1,68,105,103,105,116,49,1,93};
      //     int chatStrOffset = 4;
      //     memcpy(poopState.bigfunc_chacha_buffer+chatStrOffset, forbiddenStrHeehee, 10);
      //     memcpy_i8_to_arras_memory((char*) poopState.bigfunc_chacha_firstaddress+chatStrOffset,
      //       poopState.bigfunc_chacha_buffer+chatStrOffset, 10);
      //   }
      // }

      // hxh_CONSOLE_LOG_CHAR_STRING("chatmessage", 11);
      // memcpy(result, "hi there!", 9);
      // memcpy_i8_to_arras_memory(poopState.bigfunc_chacha_firstaddress+(result-(int)poopState.bigfunc_chacha_buffer),result,9);
      // _hxh_breakpoint();

      _reset_debug();
      _reset_bigfunc_trace();
      poopState.debug_enabled = TRUE;
      poopState.bigfunc_trace_enabled = TRUE;

      if(++poopState.bigfunc_chacha_count >= poopState.bigfunc_chacha_count_total){
        _reset_chacha();
      }
    }

    poopState.bigfunc_chacha_byte_i = 0;
    poopState.bigfunc_chacha_firstbyte = 0;
    hxh_reset();
    memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
    // if(poopState.bigfunc_chacha_count++ >= poopState.bigfunc_chacha_count_total){
    //   _reset_chacha();
    // }

  }
}

void inject_all(){
  UNIQUEIFER;

  s32 func_num = special_func_number();

  if(func_num == special_start_func_number()){
    // _hxh_breakpoint();
    _init_all_the_things();
  }

  // if(func_num == 271 && poopState.debug_enabled){
  //   _hxh_breakpoint();
  // }

  if(poopState.debug_enabled){
    if(TRUE){//blacklist check
      if(poopState.debug_count >= poopState.debug_max_count){
        _reset_debug();
        hxh_push_microcode_literal(HXH_WINDOW_POOP_SET_NULL);
        hxh_parse_execute();
      }else{
        hxh_push_microcode_literal(HXH_ARRAY_CONSOLE_LOG);
        hxh_push_microcode_literal(poopState.debug_count);
        hxh_push_microcode_literal(func_num);
        special_printargs();
        hxh_parse_execute();
        poopState.debug_count++;
      }
    }
  }
  // if(poopState.stats_enabled){
  //   if(poopState.stats_total_count >= poopState.stats_max_count){
  //     poopState.stats_enabled = FALSE;
  //     //print out all the frequencies?
  //     hxh_CONSOLE_LOG_CHAR_STRING("The total is...", 15);
  //     hxh_push_microcode_literal(HXH_ARRAY_CONSOLE_LOG);
  //     hxh_push_microcode_literal(poopState.stats_total_count);
  //     hxh_parse_execute();
  //     for(s32 i=0;i<STATS_FREQUENCIES_SIZE;i++){
  //       s32 freq = poopState.stats_frequencies[i];
  //       if(freq > 0){
  //         hxh_push_microcode_literal(HXH_ARRAY_CONSOLE_LOG);
  //         hxh_push_microcode_literal(i);
  //         hxh_push_microcode_literal(freq);
  //         hxh_parse_execute();
  //       }
  //     }
  //   }else{
  //     poopState.stats_frequencies[func_num]++;
  //     poopState.stats_total_count++;
  //     poopState.stats_max_encountered_funcnum = max_i32(poopState.stats_max_encountered_funcnum, func_num);
  //   }
  // }
  special_clear_locals();
}

