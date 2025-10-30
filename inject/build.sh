clang-21 \
  --target=wasm32 \
  -O3 \
  -nostdlib \
  -D__DATETIME__="\"$(date)\"" \
  --include-directory include \
  -Wno-incompatible-library-redeclaration \
  -Wl,--no-entry \
  -Wl,--allow-undefined \
  -Wl,--export-all \
  -Wl,--strip-debug \
  -Wl,-z,stack-size=$[(65536 * 20 * 5)/10] \
  -Wl,--initial-heap=$[(65536 * 20 * 5)/10] \
  -o /tmp/inject.wasm \
  src/*.c \
 && echo "Turning inject.wasm into inject.wat..." && \
 wasm2wat --enable-memory64 /tmp/inject.wasm -o inject.wat && \
 true