cd ../src
    echo "Downloading index.html and app.wasm..."
    wget https://arras.io
    wget https://arras.io/app.wasm

    python3 ../scripts/beautifyIndexHtml1.py
    sh ../scripts/beautifyHtml.sh
    python3 ../scripts/beautifyIndexHtml2.py

    echo "Generating app stuff"
    wasm2c app.wasm -o app.c
    wasm2wat app.wasm -o app.wat
    wasm-decompile app.wasm -o app.decomp

    mkdir -p ~/sarra
    wat2wasm -v app.wat 2> ~/sarra/app.watv
    cp ~/sarra/app.watv ./app.watv

    wasm-objdump -h app.wasm > app.sections
    wasm-objdump -x -j import app.wasm > app.section.import
    wasm-objdump -x -j type app.wasm >  app.section.type
    wasm-objdump -x -j function app.wasm >  app.section.function
    wasm-objdump -x -j export app.wasm >  app.section.export
    wasm-objdump -x -j code app.wasm >  app.section.code

    sha256sum app.wasm > app.wasm.sha256checksum

    # python3 ../scripts/generateHeaderFile.py
    
    # python3 ../scripts/preprocessAppC.py > app.c2
    # rm -f app.c
    # mv app.c2 app.c

cd ..
    echo "Generating Doxygen for app.c..."
    doxygen Doxygen

    echo "Done"
