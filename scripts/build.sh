cd ../src
wget https://arras.io
wget https://arras.io/app.wasm

wasm2c app.wasm > app.c

cd ..

doxygen Doxygen
