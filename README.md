# project status
this is on hold for now because i have been busy lately. if anyone wants to continue this work or has any questions im free to answer questions.

# About
This is an experimental modding project for arrasio.

# Features
Reading/writing packets functionality.
- [X] Read incoming packets.
- [X] Modify incoming packets. cant make packet longer though :(
- [ ] Send arbritrary packets at any time.
- [ ] Modify incoming packets "arbritrarily".

idk
- [ ] Provide a mechanism for rendering extra gui on the screen like buttons, text, text input box.

QOL toggle various gui things feature.
- [ ] Intercept keyboard/mouse input.
- [ ] Figure out how to toggle the stuff like minimap, leaderboard, and player bar.
- [ ] Press M to toggle minimap.
- [ ] Press L to toggle leaderboard.
- [ ] Press N to toggle player bar.

QOL dim feature.
- [ ] Read information about player, like what color you are.
- [ ] Make tanks of same color as you dimmer.

# Low-Level Goals
* Figure out how the big function branches works...
* Figure out what are the first things to happen when arras boots up...
* How do i modify packets to a different length...
* Make a mechanism to detect keyboard/mouse input.
* Make a mechanism to render stuff on screen.
* Make a simple heap allocator.
* Make a tool that replaces a region of arras memory with some custom data and then can return it back to how it was before replacing it.
* Object oriented stuff?
* Make a custom packet parser/writer?
* Upgrade the injection script so its very easy to inject any code...

# Development
This project uses nix to handle package dependencies, so your gonna need to install nix before doing any development. Any time I open a new terminal i run `sh scripts/shell.sh` so it adds all the packages i need to the environment path. "Just do it"®.
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
