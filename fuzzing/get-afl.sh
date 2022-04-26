#!/usr/bin/env bash
cd "${0%/*}"
rm afl-latest.tgz 2> /dev/null
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz || exit
tar -xzvf afl-latest.tgz
rm afl-latest.tgz
cd afl-*
make || exit
cd llvm_mode
# may need to prepend LLVM_CONFIG=/usr/bin/llvm-config-3.8 or similar, depending on the system
LLVM_CONFIG=/usr/bin/llvm-config-10 make 
cd ../..
rm -rf afl
mv afl-* afl