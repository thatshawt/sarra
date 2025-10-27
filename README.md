# Whats going on
This is me attempting to make a mod for the online browser game "arras.io". There are a lot of moving parts here and its mostly experimental. As of now I can run injected C code into the arras.io wasm binary. I have provided a way to access the raw received and sent packets which is nice :). I add stuff to the TODO that I need to do or am currently working on.

# Copyright Stuff

I copied portions of code from musl. I put that code into these files: inject/src/poopstrings.c|poopmath.c, inject/include/poopstrings.h|poopint.h|poopmath.h.

The copyright notice that musl provided is in the file "MUSL_COPYRIGHT".