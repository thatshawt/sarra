cd ../src

# clang-tidy --fix --fix-errors --quiet --checks='modernize-*,readability-*,misc-*' app.c -- -Wno-return-mismatch &> log2.txt
clang-tidy --fix --fix-errors --quiet --checks='misc-*' app.c -- -Wno-return-mismatch &> log2.txt