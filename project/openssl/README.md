# 编译openssl

## 配置

详细配置见源码目录下的`INSTALL`文件

修改目录下的`Makefile`对应的选项

* 选择版本

```txt
project_version 			:= 1.1.1i
```

* 编译平台: 

```txt
linux-x86_64, linux-generic32, linux-armv4
```

* 不使用GNU的ucontext库

```txt
no-async
```

* 不跑测试程序

```txt
no-tests
```

* 生成动态连接库

```txt
shared
```

交叉编译工具

```txt
–-cross-compile-prefix=
```

* 使用外部zlib

```txt
zlib --with-zlib-include=dir --with-zlib-lib=dir
```

* 去掉docs文档安装

```txt
sed -i 's/^install: install_sw install_ssldirs install_docs/install: install_sw install_ssldirs/' build/$(@:-config=)/Makefile
```

