#include "utils.h"
#include "poopstrings.h"

#define DEBUG_BLACKLIST_SIZE 50
#define DEBUG_MAX_COUNT 500

#define STATS_FREQUENCIES_SIZE 600
#define STATS_MAX_COUNT_CONSIDERED 5000

#define BIGFUNC_TRACE_MAX_LINES 500

#define CHACHA_MAX_TOTAL 1
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
  int bigfunc_chacha_firstbyte;
  int bigfunc_chacha_firstaddress;
  int bigfunc_chacha_lastaddress;
  int bigfunc_chacha_byte_i;
  int bigfunc_chacha_header;

  int stats_enabled;
  int stats_total_count;
  int stats_max_count;
  int stats_max_encountered_funcnum;
  int stats_frequencies[STATS_FREQUENCIES_SIZE];
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
  poopState.bigfunc_chacha_buffer_i = 0;
  memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
  poopState.bigfunc_chacha_byte_i = 0;
  poopState.bigfunc_chacha_firstbyte = 0;
  poopState.bigfunc_chacha_header = 0;
}

void _init_all_the_things(){
  char beginningMessage[] = "Banna Turd Labs. ";
  char dateStr[] = __DATETIME__;

  char dateTimeStr[sizeof(beginningMessage) + sizeof(dateStr)] = {0};

  strcat(dateTimeStr,beginningMessage);
  strcat(dateTimeStr, dateStr);

  hxh_CONSOLE_LOG_CHAR_STRING(dateTimeStr, strlen(dateTimeStr));

  // hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG);
  // hxh_PUSH_MICROCODE_LITERAL(strncmp("123123","123123",6));
  // hxh_PUSH_MICROCODE_LITERAL((int)strstr("123123","abdcef"));
  // hxh_PARSE_EXECUTE();

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

void export_chacha_enable(int pleaseWork){
  _reset_chacha();
  poopState.bigfunc_chacha_enabled = TRUE;
  poopState.bigfunc_chacha_header = pleaseWork;
  hxh_CONSOLE_LOG_LITERAL(poopState.bigfunc_chacha_header);
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

int _special_bigfunc_beforebranch(int index){
  UNIQUEIFER;
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
        
        if(index == 391){
          _hxh_breakpoint();
        }
      }
    }

  return index;
}

// __attribute__((optnone))
// int inject_bigfunc_beforebranch(int index){
//   UNIQUEIFER;
//   return _special_bigfunc_beforebranch(index);
// }

// void _special_bigfunc_chachabyte_2(int address, int the_byte);
void _special_bigfunc_chachabyte_1(int address, int the_byte){
  UNIQUEIFER;
  special_arras_memory_i32_store8(address, the_byte);
  // _special_bigfunc_chachabyte_2(address, the_byte);
}

void _special_bigfunc_chachabyte_2(int address, int the_byte){
  UNIQUEIFER;
  if(poopState.bigfunc_chacha_enabled == TRUE){
    if(poopState.bigfunc_chacha_byte_i == 0){
      hxh_RESET();
      poopState.bigfunc_chacha_firstbyte = the_byte;
      poopState.bigfunc_chacha_firstaddress = address;
      hxh_PUSH_MICROCODE_LITERAL(HXH_ARRAY_CONSOLE_LOG);
    }
    hxh_PUSH_MICROCODE_LITERAL(the_byte);
    poopState.bigfunc_chacha_buffer[poopState.bigfunc_chacha_byte_i % CHACHA_BUFFER_SIZE] = the_byte;
    poopState.bigfunc_chacha_byte_i++;
    poopState.bigfunc_chacha_lastaddress = address;
  }

  special_arras_memory_i32_store8(address, the_byte);
}

void _special_bigfunc_chachafinish_2();

void _special_bigfunc_chachafinish_1(){
  UNIQUEIFER;
  // if(poopState.bigfunc_chacha_enabled && poopState.bigfunc_chacha_byte_i > 0){
    //   hxh_PARSE_EXECUTE();
    //   hxh_CONSOLE_LOG_CHAR_STRING("Behold the bytes1", 17);
  //   poopState.bigfunc_chacha_byte_i = 0;
  //   if(poopState.bigfunc_chacha_count++ >= poopState.bigfunc_chacha_count_total){
  //       _reset_chacha();
  //   }
  // }
  // _special_bigfunc_chachafinish_2();
  // if(poopState.bigfunc_chacha_enabled){
    poopState.bigfunc_chacha_byte_i = 0;
    poopState.bigfunc_chacha_firstbyte = 0;
    hxh_RESET();
    memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
  // }
}

void _special_bigfunc_chachafinish_2(){
  UNIQUEIFER;

  if(poopState.bigfunc_chacha_enabled){
    // char* result = strstr(poopState.bigfunc_chacha_buffer, "123456789");
    const int firstByte = poopState.bigfunc_chacha_firstbyte;
    if(
      // (firstByte != 98 && firstByte != 117 && firstByte != 112)
      (firstByte == poopState.bigfunc_chacha_header)
      && poopState.bigfunc_chacha_byte_i > 0){
      hxh_PARSE_EXECUTE();
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
    hxh_RESET();
    memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
    // if(poopState.bigfunc_chacha_count++ >= poopState.bigfunc_chacha_count_total){
    //   _reset_chacha();
    // }

  }
}

void inject_all(){
  UNIQUEIFER;

  int func_num = special_func_number();

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

