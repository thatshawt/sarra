#define i32LOAD(address) (*((int*)address))
#define i32STORE(address, value) ((*((int*)address)) = value)

// (t) => {
//   e[t] = null;
// },
// extern void import_e_t_set_null(int t);

// (t) => e[t],
extern int import_e_t_get(int t);

// (t) => e[t](),
extern int import_e_t_call(int t);

// this should be handled by the injection scripts and will be string replaced with some other code that clears all the locals of a function...
// TODO implement later
extern void special_clear_locals();

#define hxh_PARSE_EXECUTE() (import_e_t_get(9999))
#define hxh_PUSH_MICROCODE_LITERAL(value) (import_e_t_get(10000+(value)))
// #define hxh_PUSH_MICROCODE_VALUE(value) (import_e_t_get(10000##value))
#define hxh_LOAD_INTO_VAR(a, address)    hxh_PUSH_MICROCODE_LITERAL(1); \
    hxh_PUSH_MICROCODE_LITERAL(address); \
    a = (int)hxh_PARSE_EXECUTE();

#define hxh_STORE(address, value) hxh_PUSH_MICROCODE_LITERAL(2); \
    hxh_PUSH_MICROCODE_LITERAL(address); \
    hxh_PUSH_MICROCODE_LITERAL(value); \
    hxh_PARSE_EXECUTE();

// TODO allow multiple values
#define hxh_CONSOLE_LOG(value) hxh_PUSH_MICROCODE_LITERAL(0); \
    hxh_PUSH_MICROCODE_LITERAL(value); \
    hxh_PARSE_EXECUTE();