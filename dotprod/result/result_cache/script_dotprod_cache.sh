#!/bin/bash

#Dotprod GCC 
make clean
make CC=gcc OFLAGS=-O1

taskset -c 2 ./dotprod 15 800 > result_gcc/gcc_cache_O1.dat


make clean
make CC=gcc OFLAGS=-O2

taskset -c 2 ./dotprod 15 800 > result_gcc/gcc_cache_O2.dat

make clean
make CC=gcc OFLAGS=-O3

taskset -c 2 ./dotprod 15 800 > result_gcc/gcc_cache_O3.dat

make clean
make CC=gcc OFLAGS=-Ofast

taskset -c 2 ./dotprod 15 800 > result_gcc/gcc_cache_Ofast.dat

#Dotprod clang
make clean
make CC=clang OFLAGS=-O1
taskset -c 2 ./dotprod 15 800 > result_clang/clang_cache_O1.dat

make clean
make CC=clang OFLAGS=-O2
taskset -c 2 ./dotprod 15 800 > result_clang/clang_cache_O2.dat

make clean
make CC=clang OFLAGS=-O3
taskset -c 2 ./dotprod 15 800 > result_clang/clang_cache_O3.dat

make clean
make CC=clang OFLAGS=-Ofast
taskset -c 2 ./dotprod 15 800 > result_clang/clang_cache_Ofast.dat
