#include "utils.h"
#include "poopstrings.h"
#include "poopmath.h"
#include "special.h"

#define STATS_FREQUENCIES_SIZE 700
#define STATS_MAX_COUNT_CONSIDERED 50

#define BIGFUNC_TRACE_MAX_LINES 500

#define CHACHA_MAX_TOTAL 50
#define CHACHA_BUFFER_SIZE 2000

#define BIGFUNC_INDEX_CALL_MAX 10

#define DEBUG_BLACKLIST_SIZE 50

#define DEBUG_MAX_COUNT 500

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
  _poopf("bigfunc num is %d", special_bigfunc_num());

  // _poopf("here is a float: %f, and a double: %z", (f32)123.456123, (f64)123.4567890123456789);
  
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

extern const char* indexNameMap(int index_num);

typedef struct {
  int whitelist[1000];
  int whitelistSize;
  int whitelist_enabled;

  char* whitelistDebugArgStr;

  char last_arg_str[1000];
  int same_arg_str_counter;
  int last_func_num;
} debug_state_t;

debug_state_t debug_state;

void debugstate_whitelist_enable(){
  debug_state.whitelist_enabled = TRUE;
}

void debugstate_whitelist_disable(){
  debug_state.whitelist_enabled = FALSE;
}

int debugstate_whitelist_check(int funcNum){
  for(int i=0;i<debug_state.whitelistSize;i++){
      if(debug_state.whitelist[i] == funcNum)return TRUE;
  }
  return FALSE;
}

int debugstate_whitelist_add(int funcNum){
  debug_state.whitelist[debug_state.whitelistSize++] = funcNum;
}

void debugstate_whitelist_setdebugstr(char* debugstr){
  debug_state.whitelistDebugArgStr = debugstr;
}

int debugstate_whitelist_checkstr(char* debugstr){
  if(debug_state.whitelistDebugArgStr == NULL)
    return FALSE;

  return strcmp(debugstr, debug_state.whitelistDebugArgStr) == 0;
}

int debugstate_whitelist_zero(){
  debug_state.whitelistSize = 0;
  debug_state.whitelistDebugArgStr = 0;
}


#define DEBUG_RING_BUFF_LINES 50
#define DEBUG_RING_BUFF_LINE_SIZE 100
typedef struct{
  char buffer[DEBUG_RING_BUFF_LINES][DEBUG_RING_BUFF_LINE_SIZE+1];
  int index;
} debug_ring_buffer_t;
debug_ring_buffer_t debugRingBuff;

void debugringbuff_zero(){
  debugRingBuff.index = 0;

  for(int line=0; line<DEBUG_RING_BUFF_LINES; line++){
    for(int linei=0; linei<DEBUG_RING_BUFF_LINE_SIZE+1; linei++){
      // debugRingBuff.buffer[line][linei] = 'a';
      debugRingBuff.buffer[line][linei] = 0;
    }
    // debugRingBuff.buffer[line][DEBUG_RING_BUFF_LINE_SIZE] = 0;
  }
}

__attribute__((noinline))
void debugringbuff_add_line(char* lineStr){
  const int index = debugRingBuff.index;

  char* debugBuffStr = debugRingBuff.buffer[index];

  memcpy(debugBuffStr, lineStr, strlen(lineStr)+1);
  
  debugRingBuff.index++;
  debugRingBuff.index = debugRingBuff.index % DEBUG_RING_BUFF_LINES;
}

void debugringbuff_print_lines(){
  for(int line=0; line<DEBUG_RING_BUFF_LINES; line++){
    char* lineStr = debugRingBuff.buffer[(debugRingBuff.index + line) % DEBUG_RING_BUFF_LINES];
    if(lineStr[0] != 0) _poopf("%s", lineStr);
  }
}

char* debugringbuff_getlast(){
  int index = modulo_Euclidean(debugRingBuff.index-1, DEBUG_RING_BUFF_LINES);
  char* lineStr = debugRingBuff.buffer[index];
  return lineStr;
}


int _special_bigfunc_beforebranch(s32 index){
  UNIQUEIFER;

  // hxh_console_log_literal(123);
  // poopf("homie");

  if(index == 586 && poopState.debug_enabled){
    _poopf("print debugringbuff");
    debugringbuff_print_lines();
    _poopf("before bigfunc index 586");
    debugringbuff_zero();
  }

  if(poopState.bigfunc_index_count_enabled){
    poopState.bigfunc_index_count_counter++;
  }

  if(poopState.bigfunc_trace_enabled){
    locals_struct.enabled = TRUE;
    if(poopState.bigfunc_trace_count >= poopState.bigfunc_trace_max_count){
      _reset_bigfunc_trace();
      _reset_debug();
    }else{
      //TODO update these as well... they probs changed ngl.
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
      _poopf("bigf %d '%s', y=%d, r=%d, n=%d, y0=%s, *n+fa=%s, fa=%d, *n=%s, g=%d, *g=%s, xd=%l, *xd=%s",
        poopState.bigfunc_trace_count,
        "",// indexNameMap(index), //TODO gotta update as well indexNameMap, search up nameMap TODO for more info.
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

void add_chacha_byte(s32 address, s32 the_byte){
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

  // this is a test to modify a packet's content when it is sent.
  // it is limited however because you cant increase the packet's length.
  // so this test makes it so that chat messages of length 10 will be replaced
  // with another message when you send them.
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
        (u8)127,
        10
    );
    // _poopf("right after");
    // _hxh_breakpoint();
  }

  if(poopState.bigfunc_chacha_enabled){
    // char* result = strstr(poopState.bigfunc_chacha_buffer, "123456789");

    if(
      (firstByte != 98 && firstByte != 117 && firstByte != 112)
      // (firstByte == poopState.bigfunc_chacha_header)
      && (poopState.bigfunc_chacha_byte_i > 0)
      ){

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

      //print out the buffer
      u8 temp_buffer[1000] = {0};
      strcat(temp_buffer, "[");
      for(int i = 0; i < poopState.bigfunc_chacha_byte_i; ++i){
        char byte_str[12] = {0};
        u8 theByte = poopState.bigfunc_chacha_buffer[i];
        int_to_str(byte_str, theByte);
        strcat(temp_buffer, byte_str);
        strcat(temp_buffer, ", ");
      }
      strcat(temp_buffer, "]");
      _poopf("buffer: %s", temp_buffer);

      // _reset_debug();
      // _reset_bigfunc_trace();
      // poopState.debug_enabled = TRUE;
      // poopState.bigfunc_trace_enabled = TRUE;

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

  if(!poopState.debug_enabled){
    debugstate_whitelist_zero();
  //   debugstate_whitelist_add(398);
  //   // debugstate_whitelist_setdebugstr("call 421(990892, 226868, 24)");
  //   //TODO how does 398 end up getting called...
  //   // what arethe bigfunc indexes before 398 is called?
  //   // are they the same every time?
  //   // how far until they differ?
  //   /// what functions other than bigfunc are called before 398?
    debugstate_whitelist_enable();
    debugringbuff_zero();
  }

  if(poopState.debug_enabled){
    // debugstate_blacklist_zero();
    // debugstate_blacklist_add(398);
    // debugstate_blacklist_add(230);
    // debugstate_blacklist_add(258);
    // debugstate_blacklist_add(333);
    // debugstate_blacklist_add(349);

          // && func_num != 421
      // && func_num != 507
      // && func_num != 267
      // && func_num != 264
      // && func_num != 400

      // && func_num != 449
      // && func_num != 418
      // && func_num != 328
      // && func_num != 357
      // && func_num != 546
      // && func_num != 569
      // && func_num != 472
      // && func_num != 492
      // && func_num != 325
      // && func_num != 285
    if(debug_state.whitelist_enabled == TRUE
      // && func_num != 427
      // && func_num != 335
      // && func_num != 453
      // && func_num != 532
      // && func_num != 508
      // && func_num != 275
      // && func_num != 250
      // && func_num != 209
      // && func_num != 288
      // && func_num != 425
      // && func_num != 326
      // && func_num != 517
      // && func_num != 214
      // && func_num != 512
      // && func_num != 216
      // && func_num != 487
      // && func_num != 513
      // && func_num != 395
      // && func_num != 555
      // && func_num != 421

      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
      // && func_num != 555
    ){
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
            f32_to_str(temp_buffer_1, params_struct.f32params[i]);
            break;
          case PARAM_T_F64://TODO implement this :sob:
            f64_to_str(temp_buffer_1, params_struct.f64params[i]);
            break;
        }
        strcat(args_str, temp_buffer_1);
        if(i != params_struct.param_i-1)
          strcat(args_str, ", ");
      }

      // int differntFuncNumOrArgs = strcmp(args_str, debug_state.last_arg_str) != 0 || func_num != debug_state.last_func_num;

      // if(poopState.debug_count == 0){
      //   strcpy(debug_state.last_arg_str, args_str);
      //   debug_state.last_func_num = func_num;
      // }

      // if(differntFuncNumOrArgs){
        char tempBuff[DEBUG_RING_BUFF_LINE_SIZE] = {0};
        _spoopf(tempBuff, DEBUG_RING_BUFF_LINE_SIZE-2, "call %d(%s)",
          func_num, args_str
        );
        // _poopf("call %d(%s)",
        //   func_num, args_str
        // );
        // debug_state.same_arg_str_counter = 0;

        debugringbuff_add_line(tempBuff);
      // }else{
      //   debug_state.same_arg_str_counter++;
      //   // poopState.debug_count--; // decrement this so we dont count this one
      // }

      // update last arg str
      // strcpy(debug_state.last_arg_str, args_str);
      // debug_state.last_func_num = func_num;
    }

    if(
      (debug_state.whitelist_enabled && 
        (debugstate_whitelist_check(func_num)
        || debugstate_whitelist_checkstr(debugringbuff_getlast()))
      )
      || !debug_state.whitelist_enabled
    ){
      debugstate_whitelist_disable();
      if(poopState.debug_count >= poopState.debug_max_count){
        _reset_debug();
        hxh_push_microcode_literal(HXH_WINDOW_POOP_SET_NULL);
        hxh_parse_execute();
      }else{
        if(
          func_num == 393
          || func_num == 264
          || func_num == 449
        ){
          return;
        }
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
              f32_to_str(temp_buffer_1, params_struct.f32params[i]);
              break;
            case PARAM_T_F64://TODO implement this :sob:
              f64_to_str(temp_buffer_1, params_struct.f64params[i]);
              break;
          }
          strcat(args_str, temp_buffer_1);
          if(i != params_struct.param_i-1)
            strcat(args_str, ", ");
        }

        int differntFuncNumOrArgs = strcmp(args_str, debug_state.last_arg_str) != 0 || func_num != debug_state.last_func_num;

        if(poopState.debug_count == 0){
          strcpy(debug_state.last_arg_str, args_str);
          debug_state.last_func_num = func_num;
        }

        if(differntFuncNumOrArgs){
          // _poopf("printing debug ring buffer:");
          debugringbuff_print_lines();
          debugringbuff_zero();
          _poopf("call %d %d(%s)",
            //poopState.debug_count,
            debug_state.same_arg_str_counter,
            debug_state.last_func_num, debug_state.last_arg_str
          );
          debug_state.same_arg_str_counter = 0;
        }else{
          debug_state.same_arg_str_counter++;
          poopState.debug_count--; // decrement this so we dont count this one
        }

        // update last arg str
        strcpy(debug_state.last_arg_str, args_str);
        debug_state.last_func_num = func_num;

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
    }else if(
      (func_num != 421) 
      && (func_num != 512) 
      && (func_num != 569) 
      && (func_num != 507) 
      && (func_num != 466) 
      && (func_num != 472) 
      && (func_num != 418) 
      && (func_num != 264) 
      && (func_num != 267) 
      && (func_num != 275) 
      && (func_num != 288) 
      && (func_num != 296) 
      && (func_num != 209) 
      && (func_num != 210)
      && (func_num != 385)
      && (func_num != 400)
      && (func_num != 409)
      && (func_num != 430)
      && (func_num != 449)
      && (func_num != 464)
      && (func_num != 496)
      && (func_num != 508)
      && (func_num != 560)
      && (func_num != 271)
      && (func_num != 274)
      && (func_num != 292)
      && (func_num != 293)
      && (func_num != 328)
      && (func_num != 357)
      && (func_num != 411)
      && (func_num != 502)
      && (func_num != 517)
      && (func_num != 529)
      && (func_num != 533)
      && (func_num != 540)
      && (func_num != 546)
      && (func_num != 205)
      && (func_num != 214)
      && (func_num != 216)
      && (func_num != 217)
      && (func_num != 220)
      && (func_num != 225)
      && (func_num != 229)
      && (func_num != 236)
      && (func_num != 250)
      && (func_num != 325)
      && (func_num != 341)
      && (func_num != 440)
      && (func_num != 453)
      && (func_num != 470)
      && (func_num != 506)
      && (func_num != 519)
      && (func_num != 532)
      && (func_num != 555)
      && (func_num != 219)
      && (func_num != 245)
      && (func_num != 280)
      && (func_num != 302)
      && (func_num != 315)
      && (func_num != 326)
      && (func_num != 335)
      && (func_num != 354)
      && (func_num != 353)
      && (func_num != 356)
      && (func_num != 358)
      && (func_num != 369)
      && (func_num != 378)
      && (func_num != 387)
      && (func_num != 396)
      && (func_num != 405)
      && (func_num != 410)
      && (func_num != 414)
      && (func_num != 435)
      && (func_num != 437)
      && (func_num != 446)
      && (func_num != 516)
      && (func_num != 531)
      && (func_num != 218)
      && (func_num != 221)
      && (func_num != 222)
      && (func_num != 237)
      && (func_num != 239)
      && (func_num != 243)
      && (func_num != 257)
      && (func_num != 260)
      && (func_num != 415)
      && (func_num != 416)
      && (func_num != 426)
      && (func_num != 427)
      && (func_num != 441)
      && (func_num != 452)
      && (func_num != 499)
      && (func_num != 505)
      && (func_num != 511)
      && (func_num != 518)
      && (func_num != 526)
      && (func_num != 551)
      && (func_num != 557)
      && (func_num != 570)
      && (func_num != 316)
      && (func_num != 391)
      && (func_num != 393)
      && (func_num != 408)
      && (func_num != 423)
      && (func_num != 438)
      && (func_num != 442)
      && (func_num != 456)
      && (func_num != 468)
      && (func_num != 509)
      && (func_num != 536)
      && (func_num != 537)
      && (func_num != 539)
      && (func_num != 554)
      && (func_num != 558)
      && (func_num != 563)
      && (func_num != 206)
      && (func_num != 238)
      && (func_num != 254)
      && (func_num != 255)
      && (func_num != 270)
      && (func_num != 295)
      && (func_num != 313)
      && (func_num != 329)
      && (func_num != 360)
      && (func_num != 361)
      && (func_num != 367)
      && (func_num != 368)
      && (func_num != 384)
      && (func_num != 394)
      && (func_num != 420)
      && (func_num != 428)
      && (func_num != 433)
      && (func_num != 460)
      && (func_num != 477)
      && (func_num != 482)
      && (func_num != 493)
      && (func_num != 553)
      && (func_num != 425)
      && (func_num != 375)
      && (func_num != 364)
      && (func_num != 343)
      && (func_num != 330)
      && (func_num != 310)
      && (func_num != 281)
      && (func_num != 248)
      && (func_num != 279)
      && (func_num != 504)
      && (func_num != 451)
      && (func_num != 332)
      && (func_num != 351)
      && (func_num != 352)
      && (func_num != 321)
      && (func_num != 306)
      && (func_num != 397)

      && (func_num != 213)
      && (func_num != 374)
      && (func_num != 541)

      && (func_num != 203)
      && (func_num != 207)
      && (func_num != 362)
      && (func_num != 383)
      && (func_num != 389)
      && (func_num != 483)

      && (func_num != 246)
      && (func_num != 491)
      && (func_num != 547)
    ){
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