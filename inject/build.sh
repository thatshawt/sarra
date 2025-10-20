clang-21 \
  --target=wasm32 \
  -O3 \
  -nostdlib \
  -D__DATE2__="\"$(date)\"" \
  --include-directory include \
  -Wno-incompatible-library-redeclaration \
  -Wl,--no-entry \
  -Wl,--allow-undefined \
  -Wl,--export-all \
  -Wl,--strip-debug \
  -Wl,--initial-memory=$((65536*5))\
  -o /tmp/inject.wasm \
  src/*.c \
 && wasm2wat /tmp/inject.wasm -o inject.wat