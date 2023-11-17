#!/bin/bash

#Dgemm GCC 
make clean
make CC=gcc OFLAGS=-O1

taskset -c 2 ./dgemm 15 800 > result_gcc/gcc_O1.dat


make clean
make CC=gcc OFLAGS=-O2

taskset -c 2 ./dgemm 15 800 > result_gcc/gcc_O2.dat

make clean
make CC=gcc OFLAGS=-O3

taskset -c 2 ./dgemm 15 800 > result_gcc/gcc_O3.dat

make clean
make CC=gcc OFLAGS=-Ofast

taskset -c 2 ./dgemm 15 800 > result_gcc/gcc_Ofast.dat

#Dgemm clang
make clean
make CC=clang OFLAGS=-O1
taskset -c 2 ./dgemm 15 800 > result_clang/clang_O1.dat

make clean
make CC=clang OFLAGS=-O2
taskset -c 2 ./dgemm 15 800 > result_clang/clang_O2.dat

make clean
make CC=clang OFLAGS=-O3
taskset -c 2 ./dgemm 15 800 > result_clang/clang_O3.dat

make clean
make CC=clang OFLAGS=-Ofast
taskset -c 2 ./dgemm 15 800 > result_clang/clang_Ofast.dat

