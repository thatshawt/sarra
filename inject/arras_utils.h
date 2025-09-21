#define i32LOAD(address) (*((int*)address))
#define i32STORE(address, value) ((*((int*)address)) = value)

// this is the thing i made and yea
extern void import_js_debug(int a);

// this should be handled by the injection scripts and will be string replaced with some other code that clears all the locals of a function...

extern void special_clear_locals();