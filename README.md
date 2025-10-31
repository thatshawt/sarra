# About
This is an experimental modding project for arrasio.

# High-Level Goals/Features
* Read/Write received packets.
* Read/Write sent packets.
* Render extra gui on the screen like buttons, text, text input box.
* Intercept keyboard, mouse inputs.
* Easy for users to create mods of their own.

# Low-Level Goals
* Figure out how the big function branches works...
* Figure out where packets are sent before encrypted.

## What it happening with the c code and stuff?
The c code (in inject/src) is compiled down to wasm using clang (see inject/build.sh). The inject.wasm is then "injected" into arrasio's app.wasm using the big python script (see scripts/injectBuild.sh and generatePatchedAppWasm.py). All this stuff is considered building and it happens by running `sh injectBuild.sh` inside the script directory.

# Development
This project uses nix to handle package dependencies, so your gonna need to install nix before doing any development. Any time I open a new terminal i run `sh scripts/shell.sh` so it adds all the packages i need to the environment path. Just do it. Not because nike said so.
1. Next you run `sh scripts/mitmproxy.sh` so we can override arrasio's app.wasm and index.html with out own. Those are in the `mitmoverride` directory. You have to change your browser's settings to point to the mitmproxy and do some extra stuff to intercept https traffic (which you need for arrasio. see [Mitmproxy Getting Started](https://docs.mitmproxy.org/stable/overview/getting-started/)).
2. Next (in a new terminal cus the other one has mitmproxy open), if im making changes to any injected code i run `sh injectBuild.sh` inside the scripts directory to rebuild the app.wasm and index.html.
3. Go back to 2.
4. ???
5. Profit.


# Helpful Readings

* [Compiling C to WebAssembly without Emscripten](https://surma.dev/things/c-to-webassembly/) by Surma (this one was a godsend): Some explanations about clang and compiling to web assembly.

* [WebAssembly Specification](https://webassembly.github.io/spec/core/): This is useful for clarifying any details about web assembly `*.wat`(text format) and `*.wasm`(binary format) files.

* [What’s in that .wasm? Introducing: wasm-decompile](https://v8.dev/blog/wasm-decompile) by Wouter van Oortmerssen: An explanation of how to read `src/app.decomp`(see `scripts/build.sh` to see how it is generated).

* [coderundebug.com/learn/wat/introduction](https://coderundebug.com/learn/wat/introduction/) by Stephen Paul Hassall: This has some simple explanations for some web assembly concepts/instructions.

# Copyright Stuff

I copied portions of code from musl. I put that code into these files: inject/src/poopstrings.c|poopmath.c, inject/include/poopstrings.h|poopint.h|poopmath.h.

The copyright notice that musl provided is in the file "MUSL_COPYRIGHT".