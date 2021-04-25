# 编译htop

<!-- vim-markdown-toc GFM -->

* [介绍](#介绍)
* [源码](#源码)
* [编译`ubuntu`版本](#编译ubuntu版本)
* [交叉编译`arm-himix200-linux`版本](#交叉编译arm-himix200-linux版本)
* [总结](#总结)

<!-- vim-markdown-toc -->

## 介绍

`htop`是一个Linux下的交互式的进程浏览器，可以用来替换Linux下的`top`命令。

## 源码

* 下载源码

这里选择最新版本[2.2.0](http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz)。
下载完成后解压源码，并建立如下相关目录

```shell
$ pwd
/opt/htop
$ ls
_build  htop-2.2.0  htop-2.2.0.tar.gz
$ tree
.
├── _build
│   ├── arm-himix200-linux
│   └── ubuntu
├── htop-2.2.0
└── htop-2.2.0.tar.gz
```

* 配置源码

进入到源码目录下，执行如下命令，生成`configure`

```shell
$ pwd
/opt/htop/htop-2.2.0
$ ./autogen.sh
```

## 编译`ubuntu`版本

```shell
$ pwd
/opt/htop/htop-2.2.0
$ cd ../_build/ubuntu/
$ ../../htop-2.2.0/configure --prefix=`pwd`/install
$ make
```

* 出现如下错误:

```txt
/usr/bin/ld: Process.o: in function `Process_writeField':
/opt/htop/_build/ubuntu/../../htop-2.2.0/Process.c:473: undefined reference to `minor'
/usr/bin/ld: /opt/htop/_build/ubuntu/../../htop-2.2.0/Process.c:473: undefined reference to `major'
/usr/bin/ld: linux/LinuxProcessList.o: in function `LinuxProcessList_updateTtyDevice':
/opt/htop/_build/ubuntu/../../htop-2.2.0/linux/LinuxProcessList.c:718: undefined reference to `major'
/usr/bin/ld: /opt/htop/_build/ubuntu/../../htop-2.2.0/linux/LinuxProcessList.c:719: undefined reference to `minor'
/usr/bin/ld: /opt/htop/_build/ubuntu/../../htop-2.2.0/linux/LinuxProcessList.c:742: undefined reference to `minor'
/usr/bin/ld: /opt/htop/_build/ubuntu/../../htop-2.2.0/linux/LinuxProcessList.c:746: undefined reference to `major'
/usr/bin/ld: /opt/htop/_build/ubuntu/../../htop-2.2.0/linux/LinuxProcessList.c:742: undefined reference to `major'
/usr/bin/ld: /opt/htop/_build/ubuntu/../../htop-2.2.0/linux/LinuxProcessList.c:746: undefined reference to `minor'
collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:821: htop] Error 1
make[1]: Leaving directory '/opt/htop/_build/ubuntu'
make: *** [Makefile:603: all] Error 2
````

从网上得知是缺少相关头文件`<sys/sysmacros.h>`

打开编译出问题的源文件

```shell
$ pwd
/opt/htop/htop-2.2.0

$ vim linux/LinuxProcessList.c

#ifdef MAJOR_IN_MKDEV
#include <sys/mkdev.h>
#elif defined(MAJOR_IN_SYSMACROS) || \
   (defined(HAVE_SYS_SYSMACROS_H) && HAVE_SYS_SYSMACROS_H)
#include <sys/sysmacros.h>
#endif
```

从上面的信息获知有两个宏`MAJOR_IN_MKDEV`和`MAJOR_IN_SYSMACROS`，结合网上的质料分析应该是后面宏没有开启导致的。

在源码中搜索

```shell
$ pwd
/opt/htop/htop-2.2.0

$ ag MAJOR_IN_SYSMACROS
Process.h
13:#elif defined(MAJOR_IN_SYSMACROS) || \

linux/LinuxProcessList.c
31:#elif defined(MAJOR_IN_SYSMACROS) || \

linux/LinuxProcessList.h
13:#elif defined(MAJOR_IN_SYSMACROS) || \

config.h.in
161:#undef MAJOR_IN_SYSMACROS

configure
4945:$as_echo "#define MAJOR_IN_SYSMACROS 1" >>confdefs.h
4957:$as_echo "#define MAJOR_IN_SYSMACROS 1" >>confdefs.h

config.h
162:/* #undef MAJOR_IN_SYSMACROS */

configure.ac
73:   AC_CHECK_HEADER(sys/sysmacros.h, [AC_DEFINE(MAJOR_IN_SYSMACROS, 1,

Process.c
33:#elif defined(MAJOR_IN_SYSMACROS) || \
```

发现在`configure.ac`中出现该宏，就推断在`configure`侦测系统过程中有设置该宏，然后生成`config.h`文件

打开编译目录下`config.h`文件

```shell
$ pwd
/opt/htop/_build/ubuntu

$ vim config.h

/* Define to 1 if `major', `minor', and `makedev' are declared in
   <sys/sysmacros.h>. */
#define MAJOR_IN_SYSMACROS 1
```

发现定义了该宏，但是从编译结果上看似乎该宏没有生效。

找到gcc的编译信息

```txt
gcc -DHAVE_CONFIG_H -I. -I../../htop-2.2.0  -DNDEBUG  -pedantic -Wall -Wextra -std=c99 -D_XOPEN_SOURCE_EXTENDED -DSYSCONFDIR=\"/opt/htop/_build/ubuntu/install/etc\" -I"../../htop-2.2.0/linux" -rdynamic -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -g -O2 -MT linux/Battery.o -MD -MP -MF $depbase.Tpo -c -o linux/Battery.o ../../htop-2.2.0/linux/Battery.c &&\
mv -f $depbase.Tpo $depbase.Po
```

发现有三处地方引用的头文件 `-I.` `-I../../htop-2.2.0` `-I"../../htop-2.2.0/linux"`，
第一处是编译目录，后面两处是源码目录。

然后就到源码目录下再次查找`MAJOR_IN_SYSMACROS`

```shell
$ pwd
/opt/htop/htop-2.2.0

$ ag MAJOR_IN_SYSMACROS
Process.c
33:#elif defined(MAJOR_IN_SYSMACROS) || \

Process.h
13:#elif defined(MAJOR_IN_SYSMACROS) || \

configure.ac
73:   AC_CHECK_HEADER(sys/sysmacros.h, [AC_DEFINE(MAJOR_IN_SYSMACROS, 1,

config.h.in
161:#undef MAJOR_IN_SYSMACROS

linux/LinuxProcessList.c
31:#elif defined(MAJOR_IN_SYSMACROS) || \

linux/LinuxProcessList.h
13:#elif defined(MAJOR_IN_SYSMACROS) || \

config.h
162:/* #undef MAJOR_IN_SYSMACROS */

configure
4945:$as_echo "#define MAJOR_IN_SYSMACROS 1" >>confdefs.h
4957:$as_echo "#define MAJOR_IN_SYSMACROS 1" >>confdefs.h
```

发现在源码目录下也有一个`config.h`文件，并且该宏没有被定义。

从上面的分析中，可以断定是源码目录下的`config.h`头文件引起的。
因为此处进行了影子编译，侦测系统生成的`config.h`文件没有覆盖源码中的`config.h`文件,
从三处引用头文件的地方，优先使用了源码目录下的`config.h`文件。

验证上面的猜想，打开`LinuxProcessList.Po`文件

```shell
$ pwd
/opt/htop/htop-2.2.0

$ vim linux/.deps/LinuxProcessList.Po

../../htop-2.2.0/config.h /usr/include/ctype.h /usr/include/features.h \
../../htop-2.2.0/config.h:
```

从该文件中证实了上面的猜想，删掉源码目录下的`config.h`文件，继续进行编译。

```shell
$ pwd
/opt/htop/htop-2.2.0

$ rm config.h
$ cd ../_build/ubuntu/
$ ../../htop-2.2.0/configure --prefix=`pwd`/install
$ make
$ make install
```

## 交叉编译`arm-himix200-linux`版本

> 前提是编译好了`ncurses`，这边把编译好的库放在`/opt/htop/_build/arm-himix200-linux/install`目录下

```shell
$ pwd
/opt/htop/htop-2.2.0
$ cd ../_build/arm-himix200-linux/
$ ../../htop-2.2.0/configure --prefix=`pwd`/install --build=x86_64-linux-gnu --host=arm-himix200-linux CC=/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc CXX=/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-g++ --disable-unicode
```

出现如下错误

```txt
checking for ncurses/curses.h... no
checking ncurses/ncurses.h usability... no
checking ncurses/ncurses.h presence... no
checking for ncurses/ncurses.h... no
checking ncurses.h usability... no
checking ncurses.h presence... no
checking for ncurses.h... no
configure: error: missing libraries:  libncurses
```

打开`config.log`查看详细信息

```shell
$ pwd
/opt/htop/_build/arm-himix200-linux

$ vim config.log

configure:6097: checking for refresh in -lncurses6
configure:6122: /opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc -o conftest -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -g -O2  -Wl,-Bsymbolic-functions -lncurses -ltinfo  conftest.c -lncurses6  -lm  >&5
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -lncurses
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -ltinfo
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -lncurses6
collect2: error: ld returned 1 exit status

configure:6165: checking for refresh in -lncurses
configure:6190: /opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc -o conftest -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -g -O2  -Wl,-Bsymbolic-functions -lncurses -ltinfo  conftest.c -lncurses  -lm  >&5
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -lncurses
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -ltinfo
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -lncurses
collect2: error: ld returned 1 exit status
```

>从上面的错误信息中得知，`configure`会侦测系统两个库`libncurses.so`和`libncurses6.so`。所以网上有些需要建立`ln -s libncurses.so.6.1 libncurses6.so`软连接的方法，其实是没有那个必要的。

找不到库文件，增加`PKG_CONFIG_PATH`配置，重新配置源码

```shell
$ pwd
/opt/htop/_build/arm-himix200-linux
$ ../../htop-2.2.0/configure --prefix=`pwd`/install --build=x86_64-linux-gnu --host=arm-himix200-linux CC=/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc CXX=/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-g++ --disable-unicode PKG_CONFIG_PATH=`pwd`/install/lib/pkgconfig
```

还是出现如上的错误，打开`config.log`文件查看详细信息

```shell
$ pwd
/opt/htop/_build/arm-himix200-linux

$ vim config.log

configure:6165: checking for refresh in -lncurses
configure:6190: /opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc -o conftest -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -g -O2  -Wl,-Bsymbolic-functions -lncurses -ltinfo  conftest.c -lncurses  -lm  >&5
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -lncurses
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -ltinfo
/home/uname/data/opt/toolchains/hisi-linux/arm-himix200-linux/host_bin/../lib/gcc/arm-linux-gnueabi/6.3.0/../../../../arm-linux-gnueabi/bin/ld: cannot find -lncurses
collect2: error: ld returned 1 exit status
```

从上面的log中发现配置了`PKG_CONFIG_PATH`，但是没有出现指定的路径。

再次确定`PKG_CONFIG_PATH`是否配置成功，在`config.log`中查找

```shell
$ pwd
/opt/htop/_build/arm-himix200-linux

$ vim config.log

ac_cv_env_PKG_CONFIG_PATH_set=set
ac_cv_env_PKG_CONFIG_PATH_value=/opt/htop/_build/arm-himix200-linux/install/lib/pkgconfig
```

从log中发现引用了`-ltinfo`库，觉得很奇怪，这个库是哪里来的？为什么指定了`PKG_CONFIG_PATH`，侦测系统时却没有出现相应的路径？

于是开始研究`configure`生成的过程，看哪里出现了问题

通过如下`config.log`定位`configure`

```txt
$ pwd
/opt/htop/_build/arm-himix200-linux

$ vim config.log

configure:6131: result: no
configure:6165: checking for refresh in -lncurses

$ cd ../../htop-2.2.0
$ vim vim configure +6131

   if test ! -z "$HTOP_NCURSES_CONFIG_SCRIPT"; then
      # to be used to set the path to ncurses*-config when cross-compiling
      htop_config_script_libs=$($HTOP_NCURSES_CONFIG_SCRIPT --libs 2> /dev/null)
      htop_config_script_cflags=$($HTOP_NCURSES_CONFIG_SCRIPT --cflags 2> /dev/null)
   else
      htop_config_script_libs=$("ncurses5-config" --libs 2> /dev/null)
      htop_config_script_cflags=$("ncurses5-config" --cflags 2> /dev/null)
   fi
```

发现如上信息，根据上面的注释，如果交叉编译需要指定`$HTOP_NCURSES_CONFIG_SCRIPT`的路径，否则使用系统的。

做如下实验

```shell
$ pwd
/opt/htop/_build/arm-himix200-linux/install/bin

$ ncurses6-config --libs
-Wl,-Bsymbolic-functions -lncurses -ltinfo

$ ./ncurses6-config --libs
-L/home/uname/data/install/hisi-linux/arm-himix200-linux/lib -lncurses
```

出现可恶的`-ltinfo`和期望出现的交叉编译路劲了

增加`HTOP_NCURSES_CONFIG_SCRIPT`配置，重新配置源码

```shell
$ pwd
/opt/htop/_build/arm-himix200-linux
$ ../../htop-2.2.0/configure --prefix=`pwd`/install --build=x86_64-linux-gnu --host=arm-himix200-linux CC=/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc CXX=/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-g++ --disable-unicode PKG_CONFIG_PATH=`pwd`/install/lib/pkgconfig HTOP_NCURSES_CONFIG_SCRIPT=`pwd`/install/bin/ncurses6-config
$ make
$ make install
```

## 总结

两个大坑，一个是影子编译造成的，一个是使用`cnurses`库时，需要指定`ncurses6-config`对应的脚本。

**填坑继续中...**

