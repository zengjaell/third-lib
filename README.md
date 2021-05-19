# README

<!-- vim-markdown-toc GFM -->

* [项目说明](#项目说明)
  - [项目特点](#项目特点)
  - [项目组成](#项目组成)
* [使用说明](#使用说明)
  - [编译](#编译)
  - [增加新的项目](#增加新的项目)
* [相关说明文档](#相关说明文档)

<!-- vim-markdown-toc -->

## 项目说明

该项目旨在更加方便的编译(交叉编译)第三方库。

### 项目特点

* 使用`Makefile`组织，用`make`进行编译
* 抽离出跟平台相关的配置信息，如`gcc`

### 项目组成

```txt
.
├── build                               // 编译输出目录
├── configs
│   ├── common_var.mk
│   ├── platform                        // 每一种gcc对应一个文件
│   │   ├── arm-himix200-linux.mk
│   │   ├── arm-hisiv510-linux.mk
│   │   ├── platform_config.mk          // 平台配置文件
│   │   └── x86_64.mk
│   ├── sub_target
│   │   ├── check_lib.mk
│   │   ├── common_sub_target.mk
│   │   ├── common_target.mk
│   │   └── define_func.mk
│   └── utils
│       └── cmd.mk
├── LICENSE
├── Makefile                            // 项目顶层Makefile
├── project
│   ├── htop
│   │   ├── Makefile                    // 第三方库编译Makefile
│   │   └── README.md
│   └── zlib
│       └── Makefile
├── README.md
├── src
└── SUMMARY.md
```

## 使用说明

### 编译

* 在`platform_config.mk`中配置对应的平台

```shell
# 可选的平台有: 
#       x86_64
#       r328
#       rk3308
#       unione
#       x1830
#       ats3607d
#       arm-hisiv510-linux
#       arm-himix200-linux
platform := x86_64
```

> 如果没有对应的平台，可以增加相应的平台配置文件

* 在根目录下执行`make`，获取相关信息

```shell
$ make              // 获取相关命令
$ make test         // 测试gcc的路径和版本信息
$ make list         // 获取所有可编译的第三方库
$ make clean        // 清除build目录下的所有编译文件
$ make distclean    // 清除build和src目录的所有文件
```

* 编译`zlib`

```shell
$ make project=zlib             // 编译zlib
$ make project=zlib V=1         // 编译zlib，并输出详细的编译信息
$ make project=zlib_clean       // 清除build下zlib相关文件
$ make project=zlib_distclan    // 清除src和build下zlib相关文件
```

### 增加新的项目

* 在project目录下创建对应的目录

* 在创建的目录下建立`Makefile`文件 

```makefile
ifndef top_dir
top_dir     := $(shell pwd)/../..
endif

project_target          := demo     // 填写项目名称
target_version          := x.x.x    // 填写项目版本
target_download_path    := url      // 填写项目url

include $(top_dir)/configs/common_var.mk

all: depend_lib $(target_dir)-strip-make

include $(sub_target_path)/common_sub_target.mk

depend_lib: xxx_check               // 填写项目依赖的第三方库的检查

$(target_dir)-config: $(target_dir)-gz-src
ifneq ($(config_ok_path), $(wildcard $(config_ok_path)))
    $(MKDIR) $(build_path)/$(@:-config=)

    // 项目的配置信息
    cd $(build_path)/$(@:-config=) &&               \
        $(src_path)/$(@:-config=)/configure         \
            CC=$(GCC) CXX=$(CXX)                    \
            CPPFLAGS="$(cppflags_com)"              \
            CFLAGS="$(cflags_com)"                  \
            CXXFLAGS="$(cxxflags_com)"              \
            LDFLAGS="$(ldflags_com)"                \
            LIBS="$(libs_com) -lz"                  \
            PKG_CONFIG_PATH="$(pkg_config_path)"    \
            --prefix=$(prefix_path)                 \
            --build=$(build)                        \
            --host=$(host)                          \
            --target=$(host)

    $(TOUCH) $(config_ok_path)
endif

.PHONY: all clean distclean list
```

## 相关说明文档

[详见`SUMMARY.md`](SUMMARY.md)

