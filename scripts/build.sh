cd ../src
wget https://arras.io
wget https://arras.io/app.wasm

wasm2c app.wasm > app.c
wasm-decompile app.wasm > app.decomp

sha256sum app.wasm > app.wasm.sha256checksum

# cd ..
# doxygen Doxygen
