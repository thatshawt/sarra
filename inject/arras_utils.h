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

extern void special_clear_locals();