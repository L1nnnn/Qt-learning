#cmake 版本
cmake_minimum_required(VERSION 3.0.0)
#设置库名称
set(COMPILENAME COMPILE)
project(${COMPILENAME})

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/qmake)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/cmake)

