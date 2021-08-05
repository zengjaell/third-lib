# 编译qt5

[详细编译步骤](https://github.com/gnsyxiang/compile-qt)

### 指定交叉gcc路径

* `linux-arm-hisi-g++`

修改`linux-arm-hisi-g++/qmake.conf`文件下的gcc路径

```txt
HISI_GCC_NAME = arm-himix200-linux
HISI_GCC_PATH = /opt/data/opt/toolchains/hisi/$${HISI_GCC_NAME}/bin/$${HISI_GCC_NAME}-
```

* `linux-arm-linaro-g++`

修改`linux-arm-linaro-g++/qmake.conf`文件下的gcc路径

```txt
HISI_GCC_NAME = gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu
LINARO_GCC_PATH = /opt/toolchains/linaro/$${HISI_GCC_NAME}/bin/aarch64-linux-gnu-
```

