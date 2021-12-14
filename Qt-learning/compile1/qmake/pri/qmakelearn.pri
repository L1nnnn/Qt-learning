#Ｑt学习日志－Ｑt编译构建工具之QMake
#１.自己的理解：qmake工具是qt自带的构建工具，通过pro文件可以逐层生成对应的makefile编译自身应用，对于qt自带的工具moc(元对象编译器)
#uic(ui编译器),rcc(资源编译器)起到触发作用。
#2. 命令行使用：
#            qmake xxx.pro 生成对应的makefile
#            qmake -project　根据对应的ui,h,cpp文件生成文件名和目录相同指定的pro文件
#            qmake -spec xxx xxx.pro 显示指定具体平台具体的编译器编译pro文件，具体的可以在Ｑt目录中的mkspec目录下查看
#　　　　　　　qmake -query 查询qmake一些默认配置　qmake -set xxx:xxx 设置qmake的一些默认配置
#            qmake -tp vc xxx.pro 编译生成基于ｖs的.vcproj文件
#3. 具体介绍：
#             官方文档是宝库：qmake官方介绍　https://doc.qt.io/qt-6/qmake-overview.html
#          (1): 变量：
#                   >常用变量:SOURCES 源文件
#                            HEADERS 头文件
#                            FORMS   ui文件
#                            CONFIG  增加一些配置例如debug release staticlib dll
#                            TEMPLATE 文件模板，大概有这么几种　app(应用程序)、lib(库)、subdirs(编译子目录文件)
#                            SUBDIRS　根据子目录pro文件添加子目录
#                            DEFINES  定义一些预编译的参数
#                            TARGET  构建出来的二进制程序
#                            INCLUDEPATH 需要用到的头文件
#                            INSTALLS 安装　指定path file...
#                            QT 指定一些所需要的Ｑt模块
#                            PKGCONFIG 指定一些第三方库
#                            LIBS  指定要链接的库和库地址
#                            ...(其他具体查看Ｑt帮助手册看)
#                     >自定义变量： $$xxx (引用变量)
#                                 $$[QT_XXX](引用Ｑt配置)
#                                 $$(xxxx)qmake期间环境变量
#                                 $(xxx)执行makefile期间环境变量
#                     >变量操作符：　xxx+=xxx 增加
#                                　xxx－=xxx 减少
#                                　xxx=xxx 赋值　（带空格的需要加引号）
#                                　xxx*=xxx 要求被添加的不在列表中，否则不添加
#                                　xxx~=xxx 替换


#        （2）:　判断版本和内置函数：
#                      >判断系统版本：win32{
#                                   }
#                                   unix{
#                                   }
#                                    else{
#                                   }
#                                   unix:debug{
#                                   }
#                       >内置函数: config(debug,debug|release){//调试的时候执行
#                                   }
#                                 message() 打印
#                                 system() 系统执行
#                                 exist()是否存在
#                                 include(xxx.pri) 如果一个qmake需要多次利用，可以添加一个xxx.pri，并通过include()包含
#

# qmake项目大致流程如下：
CONFIG += c++11 link_pkgconfig
QT+= core gui printsupport dbus
TEMPLATE =app
VERSION = 1.1.1
PKGCONFIG += RapidJSON
INCLUDEPATH += /usr/include
LIBS +=$$(PWD)/xxx

custom_headers += xxx.h
custom_sources += xxx.cpp \
                  xxx1.cpp
HEADERS += $$custom_headers
SOURCES += $$custom_sources

TARGET = test
target.path=$$(PWD)/xxx
INSTALLS += target

