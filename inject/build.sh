clang-21 \
  --target=wasm32 \
  -O3 \
  -nostdlib \
  -Wl,--no-entry \
  -Wl,--allow-undefined \
  -Wl,--export-all \
  -o add.wasm \
  add.c