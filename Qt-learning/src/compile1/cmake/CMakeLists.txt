#cmake 版本
cmake_minimum_required(VERSION 3.0.0)
#设置库名称
set(LIBNAME TESTLIB)
project(${LIBNAME})

#标准ｃ++标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED true)



add_library(TESTLIB test.cpp)
