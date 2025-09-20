extern void js_special_debug(int funcNum);

// int add(int a, int b) {
//   return a*a + b;
// }

static int poop = 42;

// void stuff () asm ("HITHERE");
void stuff(){
  js_special_debug(123456);
}