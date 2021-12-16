#cmake 版本
cmake_minimum_required(VERSION 3.0.0)
#设置库名称
set(LIBNAME QMAKETEST)
project(${LIBNAME})

#标准ｃ++标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED true)

message(${CMAKE_CURRENT_LIST_DIR})
add_executable(QMAKETEST qmakedoc.cpp main.cpp)
