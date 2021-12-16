#cmake 版本
cmake_minimum_required(VERSION 3.0.0)
#设置项目名称
set(EXE QT_LEARNING)
project(${EXE})
#设置项目版本
if (NOT DEFINED VERSION)
    set(VERSION 1.0.0)
endif ()

#标准c/ｃ++标准
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_VERBOSE_MAKEFILE ON) #要显示执行构建过程中详细的信息(比如为了得到更详细的出错信息)
set(CMAKE_AUTOMOC ON) #打开全局moc
set(CMAKE_AUTORCC ON) #打开全局rcc
#添加子目录
add_subdirectory(${PROJECT_SOURCE_DIR}/src)
#查找外部三方库
find_package(Qt5 COMPONENTS Core REQUIRED)
find_package(Qt5 COMPONENTS Gui REQUIRED)
find_package(Qt5 COMPONENTS Widgets REQUIRED)
#生成可执行程序
add_executable(${EXE} main.cpp)

#指定编译所要包含的目录
target_include_directories(${EXE} PUBLIC ${PROJECT_BINARY_DIR} ${PROJECT_SOURCE_DIR}/src/compile1/cmake)
#链接指定的库
target_link_libraries(${EXE} PUBLIC TESTLIB  ${Qt5Widgets_LIBRARIES} )
