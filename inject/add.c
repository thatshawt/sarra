extern void arras_malloc(int a, int b);

int add(int a, int b) {
  return a*a + b;
}

void stuff(){
  /*    i32.const 599468
    i32.const 1886351216
    i32.store

    i32.const 165514
    i32.const 1885693298
    i32.store*/
    int* loc1 = (int*)599468;
    int* loc2 = (int*)165514;

    loc1[0] = 1886351216;
    loc2[0] = 1885693298;

    arras_malloc(1,2);
}