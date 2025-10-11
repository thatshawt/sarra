cd ../inject
echo "building inject.wat..."
sh build.sh || exit 1

cd ..
echo "running app.wat patching script..."
wasm2wat src/app.wasm -o /tmp/app.wat && \
python3 scripts/generatePatchedAppWasm.py -w /tmp/app.wat -f src/index.html -i inject/inject.wat -o1 mitmoverride/app.wat.patched -o2 mitmoverride/index.html.patched && \
 wat2wasm mitmoverride/app.wat.patched --enable-multi-memory -o mitmoverride/app.wasm && \
 mv mitmoverride/index.html mitmoverride/index.html.old && \
 cp mitmoverride/index.html.patched mitmoverride/index.html