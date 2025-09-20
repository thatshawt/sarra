clang-21 \
  --target=wasm32 \
  -O3 \
  -nostdlib \
  -Wl,--no-entry \
  -Wl,--allow-undefined \
  -Wl,--export-all \
  -Wl,--no-gc-sections \
  -Wl,--strip-debug \
  -o add.wasm \
  add.c

wasm2wat add.wasm -o add.wat