#!/usr/bin/env bash
cd "${0%/*}"
rm afl-latest.tgz 2> /dev/null
wget http://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz || exit
tar -xzvf afl-latest.tgz
rm afl-latest.tgz

cd afl-*
make
cd llvm_mode
LLVM_CONFIG=/usr/bin/llvm-config-10 make 

cd ../..
rm -rf afl
mv afl-* afl