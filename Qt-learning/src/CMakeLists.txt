#cmake 版本
cmake_minimum_required(VERSION 3.0.0)
#设置库名称
set(SRCNAME SRC)
project(${SRCNAME})

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/compile1)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/qtwidget)

