#include "utils.h"
#include "poopstrings.h"
#include "poopmath.h"
#include "special.h"

#define DEBUG_BLACKLIST_SIZE 50
#define DEBUG_MAX_COUNT 5000

#define STATS_FREQUENCIES_SIZE 600
#define STATS_MAX_COUNT_CONSIDERED 5000

#define BIGFUNC_TRACE_MAX_LINES 100

#define CHACHA_MAX_TOTAL 1
#define CHACHA_BUFFER_SIZE 2000

#define BIGFUNC_INDEX_CALL_MAX 10

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
  s32 bigfunc_chacha_firstbyte;
  s32 bigfunc_chacha_firstaddress;
  s32 bigfunc_chacha_lastaddress;
  s32 bigfunc_chacha_byte_i;
  s32 bigfunc_chacha_header;

  s32 bigfunc_index_count_enabled;
  s32 bigfunc_index_count_counter;
  s32 bigfunc_index_call_count_counter;
  s32 bigfunc_index_call_count_max;
  
  s32 stats_enabled;
  s32 stats_total_count;
  s32 stats_max_count;
  s32 stats_max_encountered_funcnum;
  s32 stats_frequencies[STATS_FREQUENCIES_SIZE];
}poopState;

void export_datenow(){
  f64 datenow = import_datenow();
  _poopf("Date.now() %l", (s64)datenow );
}

void export_do_mem0(){
  u32 mem_loc = 0;
  s32 val = special_arras_memory_i32_load(mem_loc);
  hxh_console_log_literal(val);
  special_arras_memory_i32_store(mem_loc, val+1);
}

void _reset_bigfunc_index_counter(){
  poopState.bigfunc_index_count_enabled = FALSE;
  poopState.bigfunc_index_count_counter = 0;
  poopState.bigfunc_index_call_count_counter = 0;
  poopState.bigfunc_index_call_count_max = BIGFUNC_INDEX_CALL_MAX;
}

void export_bigfunc_index_count_enable(){
  _reset_bigfunc_index_counter();
  poopState.bigfunc_index_count_enabled = TRUE;
}

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

//comes from tests.c
extern void do_all_tests();

void _init_all_the_things(){
  _poopf("Welcome to Bananan Turd Labs. \nCompiled: '%s'", __DATETIME__);

  _poopf("here is a float: %f, and a double: %z", (f32)123.456, (f64)123.4567890123456789);
  _poopf("just a float: %f", (f32)3.1415926);
  _poopf("just a double: %z", (f64)3.14159265358979323846);
  // do_all_tests();

  // _poopf("what da-|%d %d %l|-number!?", (s32)123, (s32)-1234, (s64)123456789123123123);

  // hxh_console_log_literal(special_global_get_i32_1());

  _reset_debug();
  _reset_stats();
  _reset_bigfunc_trace();
  _reset_bigfunc_index_counter();
  _reset_chacha();

  // poopState.debug_enabled = TRUE;
  // poopState.bigfunc_index_count_enabled = TRUE;

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

extern struct LocalsStruct locals_struct;

int _special_bigfunc_beforebranch(s32 index){
  UNIQUEIFER;

  // hxh_console_log_literal(123);
  // poopf("homie");

  if(poopState.bigfunc_index_count_enabled){
    poopState.bigfunc_index_count_counter++;
  }

  if(poopState.bigfunc_trace_enabled){
    locals_struct.enabled = TRUE;
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
      
      // hxh_console_log_literal(123);
      // u8* hithere = "hi there";
      // _poopf("%d %d %d %d", (s32)123, (s32)456, (s32)789, (s32)123);

      hxh_reset();

      u8 n_point[150] = {0};
      u8 g_point[150] = {0};
      u8 xd_point[150] = {0};
      u8 faPlusNPoint[150] = {0};
      u8 initalY[150] = {0};

      if(VALID_ARRAS_MEMLOCATION(var_n)){
        s32 npointval = special_arras_memory_i32_load(var_n);
        int_to_str(n_point, npointval);

        int_to_str(faPlusNPoint, var_fa+npointval);
        int_to_str(initalY, (var_fa+npointval) / 1625 + 2640625);
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
      // hxh_console_log_literal(special_global_get_i32_1());
      // _poopf("fa test=%d, digits=%d, global.get 1: %d", var_fa,  digits10(var_fa), special_global_get_i32_1());

      // poopf("got this far");
      _poopf("bigf %d, y=%d, r=%d, n=%d, y0=%s, *n+fa=%s, fa=%d, *n=%s, g=%d, *g=%s, xd=%l, *xd=%s",
        poopState.bigfunc_trace_count,
        var_y, var_r,
        var_n, initalY, faPlusNPoint,
        var_fa, n_point,
        var_g, g_point,
        var_xd, xd_point
      );

      poopState.bigfunc_trace_count++;
      
      // if(index == 550){
      //   _hxh_breakpoint();
      // }
    }
  }else{
    locals_struct.enabled = FALSE;
  }

  return index;
}

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
  // if(poopState.bigfunc_chacha_enabled == TRUE){
    add_chacha_byte(address, the_byte);
  // }

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
  memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
}

void _special_bigfunc_chachafinish_2(){
  UNIQUEIFER;

  const int firstByte = poopState.bigfunc_chacha_firstbyte;

  //we about to go cra cra now
  if(firstByte == 'M' && poopState.bigfunc_chacha_byte_i == 16){
    const u8 customPacket1[] = {77, 240, 70, 64, 202, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 1};
    const u8 customPacket2[] = {77, 240, 70, 64, 202, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 1};
    // _poopf("before, packetaddress: %d", poopState.bigfunc_chacha_firstaddress);
    // _hxh_breakpoint();
    // memcpy_i8_to_arras_memory(
    //     (char*)poopState.bigfunc_chacha_firstaddress+5,
    //     (char*)customPacket1+5,
    //     (sizeof customPacket1)-5-1
    // );
    memset_i8_to_arras_memory(
        (char*)poopState.bigfunc_chacha_firstaddress+5,
        '\n',
        10
    );
    // _poopf("right after");
    // _hxh_breakpoint();
  }

  if(poopState.bigfunc_chacha_enabled){
    // char* result = strstr(poopState.bigfunc_chacha_buffer, "123456789");

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
        // if(poopState.bigfunc_chacha_byte_i == 16){
        //   const char forbiddenStrHeehee[] = {91,1,68,105,103,105,116,49,1,93};
        //   int chatStrOffset = 4;
        //   memcpy(poopState.bigfunc_chacha_buffer+chatStrOffset, forbiddenStrHeehee, 10);
        //   memcpy_i8_to_arras_memory((char*) poopState.bigfunc_chacha_firstaddress+chatStrOffset,
        //     poopState.bigfunc_chacha_buffer+chatStrOffset, 10);
        // }
      // }

      // hxh_CONSOLE_LOG_CHAR_STRING("chatmessage", 11);
      // memcpy(result, "hi there!", 9);
      // memcpy_i8_to_arras_memory(poopState.bigfunc_chacha_firstaddress+(result-(int)poopState.bigfunc_chacha_buffer),result,9);
      // _hxh_breakpoint();


      // hxh_console_log_literal(special_global_get_i32_1());

      _reset_debug();
      _reset_bigfunc_trace();
      poopState.debug_enabled = TRUE;
      poopState.bigfunc_trace_enabled = TRUE;

      if(++poopState.bigfunc_chacha_count >= poopState.bigfunc_chacha_count_total){
        _reset_chacha();
      }
    }

    // if(poopState.bigfunc_chacha_count++ >= poopState.bigfunc_chacha_count_total){
      //   _reset_chacha();
      // }
  }
  poopState.bigfunc_chacha_byte_i = 0;
  poopState.bigfunc_chacha_firstbyte = 0;
  hxh_reset();
  memset_i8(poopState.bigfunc_chacha_buffer, CHACHA_BUFFER_SIZE, 0);
}

//from special.c
extern struct Params_Struct params_struct;
//from function_name_map.c
extern const char* nameMap(int func_num);

void every_func_preamble(s32 func_num){
  if(func_num == special_start_func_number()){
    // _hxh_breakpoint();
    _init_all_the_things();
  }

  // if(func_num == 271 && poopState.debug_enabled){
  //   _hxh_breakpoint();
  // }

  if(func_num == special_bigfunc_num()){
    if(poopState.bigfunc_index_count_enabled){
      if(poopState.bigfunc_index_call_count_counter++ >= poopState.bigfunc_index_call_count_max){
        _reset_bigfunc_index_counter();
      }else{
        _poopf("bigfunc called. indexes previously visited %d times.",
          poopState.bigfunc_index_count_counter);

        //enable trace to see what first few indexes do
        _reset_bigfunc_trace();
        // poopState.bigfunc_trace_enabled = TRUE;
  
        poopState.bigfunc_index_count_counter = 0;
      }

    }
  }


  if(poopState.debug_enabled){
    if(TRUE){//blacklist check
      if(poopState.debug_count >= poopState.debug_max_count){
        _reset_debug();
        hxh_push_microcode_literal(HXH_WINDOW_POOP_SET_NULL);
        hxh_parse_execute();
      }else{
        // func 274 is the only one that uses import_sendpacket.
        // other than bigfunc.
        // {
        //   if(func_num != 274)return;
        //   s32 firstParam = params_struct.i32params[0];
        //   s32 secondParam = params_struct.i32params[1];
        //   s32 thirdParam = params_struct.i32params[2];
        //   if(thirdParam < 2)return;
        //   if(VALID_ARRAS_MEMLOCATION(secondParam)){
        //     u8 firstByte = special_arras_memory_i32_load8_u(secondParam);
        //     if(firstByte != 'M')return;
        //   }
        // }

        //print out args
        u8 args_str[1000] = {0};
        for(int i=0;i<params_struct.param_i;i++){
          enum Param_Type param_type = params_struct.paramTypes[i];
          u8 temp_buffer_1[250] = {0};
          switch(param_type){
            case PARAM_T_NIL: //error right here
              break;
            case PARAM_T_I32:
              int_to_str(temp_buffer_1, params_struct.i32params[i]);
              break;
            case PARAM_T_I64:
              i64_to_str(temp_buffer_1, params_struct.i64params[i]);
              break;
            case PARAM_T_F32://TODO implement this :sob:
              strcat(temp_buffer_1, "an f32");
              break;
            case PARAM_T_F64://TODO implement this :sob:
              strcat(temp_buffer_1, "an f64");
              break;
          }
          strcat(args_str, temp_buffer_1);
          if(i != params_struct.param_i-1)
            strcat(args_str, ", ");
        }

        const char* func_name = nameMap(func_num);
        if(func_name != NULL){
          _poopf("call %d, %d|%s(%s)", poopState.debug_count, func_num, func_name, args_str);
        }else{
          _poopf("call %d, %d(%s)", poopState.debug_count, func_num, args_str);
        }

        // _poopf("call %d, %d(%s)", poopState.debug_count, func_num, args_str);

        // {
        //   s32 chatMessageOffset = 2;
        //   if(thirdParam > 31+2) chatMessageOffset = 4;
        //   s32 chatMessageLength = thirdParam-chatMessageOffset;
        //   // memset_i8_to_arras_memory((char*)secondParam+chatMessageOffset, '*', chatMessageLength);
        //   if(chatMessageLength >= 10){
        //     const char forbiddenStrHeehee[] = {91,1,68,105,103,105,116,49,1,93};
        //     // memcpy(secondParam+chatMessageOffset, forbiddenStrHeehee, 10);
        //     memcpy_i8_to_arras_memory((char*) secondParam+chatMessageOffset,
        //       forbiddenStrHeehee, 10);
        //   }
        //   _hxh_breakpoint();
        // }

        poopState.debug_count++;
      }
    }
  }
  if(poopState.stats_enabled){
    if(poopState.stats_total_count >= poopState.stats_max_count){
      poopState.stats_enabled = FALSE;
      _poopf("total is %d", poopState.stats_total_count);
      for(s32 i=0;i<STATS_FREQUENCIES_SIZE;i++){
        s32 freq = poopState.stats_frequencies[i];
        if(freq > 0){
          _poopf("%d %d", i, freq);
        }
      }
    }else{
      poopState.stats_frequencies[func_num]++;
      poopState.stats_total_count++;
      poopState.stats_max_encountered_funcnum = max_i32(poopState.stats_max_encountered_funcnum, func_num);
    }
  }

}

void inject_all(){
  UNIQUEIFER;

  // grab func number for the function this gets injected into.
  s32 func_num = special_func_number();

  // load all the parameters into some thing.
  special_update_param_struct();

  // do everything else.
  // i put this in its own function because inject_all has a bug that happens
  // if there is too much complex code in it.
  // this is my workaround so yea it works.
  // the bug does something with global 1 if i remember...
  every_func_preamble(func_num);

  //TODO: should i clear locals here still?
}