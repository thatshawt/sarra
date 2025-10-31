# What is this
This is an experimental modding project for arrasio. Right now what seems to be happening is the addition of features that are needed from the "injecting compiler" (one huge python script generatePatchedAppWasm.py) and also writing C source code.

## What it happening with the c code and stuff?
The c code (in inject/src) is compiled down to wasm using clang (see inject/build.sh). The inject.wasm is then "injected" into arrasio's app.wasm using the big python script (see scripts/injectBuild.sh and generatePatchedAppWasm.py). All this stuff is considered building and it happens by running `sh injectBuild.sh` inside the script directory.

# Development
1. First thing I do is get into a nix shell with all the packages that i want `sh scripts/shell.sh`.
2. Next you run `sh scripts/mitmproxy.sh` so we can override arrasio's app.wasm and index.html with out own. Those are in the `mitmoverride` directory. You have to change your browser's settings to point to the mitmproxy (see [Mitmproxy Getting Started](https://docs.mitmproxy.org/stable/overview/getting-started/)).
3. Next (in a new terminal cus the other one has mitmproxy open), if im making changes to any injected code i run `sh injectBuild.sh` inside the scripts directory to rebuild the app.wasm and index.html.
4. Go back to 3.
5. ???
6. Profit.


## Helpful Readings

* [Compiling C to WebAssembly without Emscripten](https://surma.dev/things/c-to-webassembly/) by Surma (this one was a godsend)
* [What’s in that .wasm? Introducing: wasm-decompile](https://v8.dev/blog/wasm-decompile) by Wouter van Oortmerssen
* [coderundebug.com/learn/wat/introduction](https://coderundebug.com/learn/wat/introduction/) by Stephen Paul Hassall
# Copyright Stuff

I copied portions of code from musl. I put that code into these files: inject/src/poopstrings.c|poopmath.c, inject/include/poopstrings.h|poopint.h|poopmath.h.

The copyright notice that musl provided is in the file "MUSL_COPYRIGHT".