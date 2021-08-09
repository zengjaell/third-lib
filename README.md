# Cross-compiling third-party libraries(交叉编译第三方库)

<!-- vim-markdown-toc GFM -->

* [项目说明](#项目说明)
  - [项目特点](#项目特点)
  - [项目组成](#项目组成)
* [使用说明](#使用说明)
  - [编译](#编译)
  - [增加新的项目](#增加新的项目)
  - [编译指定版本](#编译指定版本)
  - [手动下载大软件包](#手动下载大软件包)
* [相关说明文档](#相关说明文档)
* [thanks](#thanks)

<!-- vim-markdown-toc -->

## 项目说明

* 该项目旨在更加方便的编译(交叉编译)第三方库
* 学习`autotools`，`cmake`，`Makefile`的使用方法
* 把第三方库的编译集中到一起，避免重复劳动提供效率

### 项目特点

* 使用`Makefile`组织，用`make`进行编译
* 抽离出跟平台相关的配置信息，如`gcc`
* `一键编译`(只需要指定软件版本，框架会去官方下载版本并编译，然后安装到指定的目录)

### 项目组成

```txt
.
├── build                               // 编译输出目录
│   ├── hisi
│   │   ├── htop-2.2.0
│   │   └── zlib-1.2.11
│   └── pc
│       ├── htop-2.2.0
│       └── zlib-1.2.11
├── configs
│   ├── cmd.mk
│   ├── common_var.mk
│   ├── makefile
│   │   ├── check_lib.mk
│   │   ├── common_sub_target.mk
│   │   ├── common_target.mk
│   │   └── define_func.mk
│   └── vender                          // gcc相关信息
│       ├── ats3607d.mk
│       ├── fulhan.mk
│       ├── hisi.mk                     // 海思平台gcc配置信息
│       ├── linaro.mk
│       ├── mstar.mk
│       ├── pc.mk                       // pc平台gcc配置信息
│       ├── platform_config.mk          // 平台配置文件
│       ├── platform_config_tmp.mk      // 平台配置文件，覆盖上面文件的相关变量
│       ├── r328.mk
│       ├── rk3308.mk
│       ├── unione.mk
│       └── x1830.mk
├── LICENSE
├── Makefile                            // 顶层Makefile
├── project
│   ├── htop
│   │   ├── Makefile                    // 第三方库编译Makefile
│   │   └── README.md
│   └── zlib
│       ├── Makefile
│       └── README.md
├── README.md
├── src                                 // 源码目录
│   ├── htop-2.2.0
│   └── zlib-1.2.11
└── SUMMARY.md
```

## 使用说明

### 编译

* 配置对应的厂商

```shell
vim configs/vender/platform_config.mk

# 可选的厂商有: 
#       pc
#       hisi
#       fulhan
#       mstar
#       linaro
vender := pc
```

> 如果没有对应的厂商，可以增加相应的厂商配置文件

* 默认为编译pc版本

```makefile
vim configs/vender/pc.mk

gcc_version         := x86_64-linux-gnu

toolchains_path     :=
gcc_prefix          :=
host                := x86_64-linux-gnu

cppflags_com        :=
cflags_com          :=
cxxflags_com        :=
ldflags_com         :=
libs_com            := 

prefix_path         ?= $(base_prefix_path)/$(vender)/$(gcc_version)         // 安装目录
```

> note:
>
> 1, host应该和build一样 (我这里使用的是`x86_64-linux-gnu`，系统版本是`20.04.1-Ubuntu-x86_64`)
>
> 2, 需要更改安装路径 (上面是我默认的安装目录)

* 修改gcc配置

```makefile
vim configs/vender/hisi.mk

# arm-himix200-linux, arm-hisiv510-linux
gcc_version         := arm-himix200-linux

toolchains_path     := $(base_toolchains_path)/$(vender)/$(gcc_version)/bin // gcc路径
gcc_prefix          := arm-himix200-linux-
program_prefix      := arm-himix200-linux-
host                := arm-himix200-linux

cppflags_com        :=
cflags_com          :=
cxxflags_com        :=
ldflags_com         :=
libs_com            := 

prefix_path         ?= $(base_prefix_path)/$(vender)/$(gcc_version)         // 安装路径
```

> note: 
>
> 1, gcc的安装目录最好按照上述格式，避免修改过程中或增加新的gcc编译不通过
>
> 2, 变量`base_toolchains_path`和`vender`在`platform_config.mk`中定义

* 在`platform_config_tmp.mk`中配置的信息会覆盖`platform_config.mk`相关变量

```txt
prefix_path := 指定最终的安装路径
```

> note: prefix_path只会修改最终的安装路径，方便交叉编译的部署，体系中的相关依赖不会改变


* 在根目录下执行`make`，获取相关信息

```shell
$ make              // 获取相关命令
$ make test         // 测试gcc的路径和版本信息
$ make list         // 获取所有可编译的第三方库
$ make clean        // 清除build目录下的所有编译文件
$ make distclean    // 清除build和src目录的所有文件
```

* 在根目录下编译`zlib`

```shell
$ make project=zlib             // 编译zlib
$ make project=zlib V=1         // 编译zlib，并输出详细的编译信息
$ make project=zlib_clean       // 清除build下zlib相关文件
$ make project=zlib_distclan    // 清除src和build下zlib相关文件
```

* 在项目目录下编译

```shell
$ cd project/zlib
$ make             // 编译zlib
$ make V=1         // 编译zlib，并输出详细的编译信息
$ make clean       // 清除build下zlib相关文件
$ make distclan    // 清除src和build下zlib相关文件
```

> note: 
>
> 1, 在项目目录下编译，可以少写关于项目的指定
>
> 2, 编译各个环节中出现奇怪的问题，都可以使用`make distclean`清除所有信息，然后重新开始

### 增加新的项目

* 在project目录下创建对应的目录

* 在创建的目录下建立`Makefile`文件 

```makefile
ifndef top_dir
top_dir := $(shell pwd)/../..       // 项目相对于根目录的路径
endif

project                 := demo     // 填写项目名称
project_version         := x.x.x    // 填写项目版本
project_download_url    := url      // 填写项目url

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: xxx_check               // 填写项目依赖的第三方库的检查

$(target_dir)-config: $(target_dir)-gz-src      // 后面依赖要看压缩包类型，如gz/xz/bz2
ifneq ($(config_ok_mark_path), $(wildcard $(config_ok_mark_path)))
    $(MKDIR) $(build_path)/$(@:-config=)

    // 项目的配置信息

    $(TOUCH) $(config_ok_mark_path)
endif

.PHONY: all clean distclean list
```
> note:
>
> 1, 参考实例见`project/template`，根据项目的编译系统，选择对应的目录作为参考
>
> 2, 需要注意`top_dir`目录的定义，根据创建目录深度的不同而不同


### 编译指定版本

* 打开`project/zlib/Makefile`，修改`project_version`字段

```makefile
project                 := zlib
project_version         := 1.2.9    // 修改成需要的版本(指定的版本必须是存在的，不能自己定义一个版本，否则下载将失败)
project_download_url    := https://nchc.dl.sourceforge.net/project/libpng/zlib/$(project_version)/zlib-$(project_version).tar.gz
```

![compile_specified_version](img/compile_specified_version.png)

* 按照上面的编译步骤编译

> note: 不同的版本编译可能会失败，因为源码的修改或者依赖库的修改，都需要修改配置选项


### 手动下载大软件包

* 通过下载工具下载大源码包，比如迅雷下载

* 把下载好的源码包放到`src`目录下

* 执行上面的编译步骤

> 事先下载源码包的情况:
>
> 1, 源码包较大的情况下，如qt
>
> 2, 一些源码包下载速度很忙，出现多次掉线的情况下
>
> 3，编译机器所在的网络不好，可以从其他地方下载
>
> 4, 所在机器没有网络

## 相关说明文档

[现有支持编译的项目](SUMMARY.md)

## thanks

欢迎大家提交`PR`或`Issues`

能给一个`Start`就是对我最大的鼓励^_^...


