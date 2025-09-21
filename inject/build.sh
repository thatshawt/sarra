clang-21 \
  --target=wasm32 \
  -O3 \
  -nostdlib \
  -Wl,--no-entry \
  -Wl,--allow-undefined \
  -Wl,--export-all \
  -Wl,--strip-debug \
  -o /tmp/inject.wasm \
  inject.c \
 && wasm2wat /tmp/inject.wasm -o inject.wat