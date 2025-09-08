nix-shell -p wabt curl wget doxygen \
 graphviz bc prettierd creduce binaryen \
 git mitmproxy emscripten \
 llvmPackages_21.bintools-unwrapped \
 llvmPackages_21.clang-unwrapped \
 "(python3.withPackages (python-pkgs: [ \
    ]))"