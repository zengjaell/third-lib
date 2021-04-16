# 编译libwebsockets

## 配置

修改目录下的`Makefile`对应的选项

* 选择版本

```txt
TARGET_VERSION 			:= 4.1.6
```

* 使用外部zlib

```txt
-DLWS_WITH_ZLIB=1 -DLWS_ZLIB_INCLUDE_DIRS=inc_path -DLWS_ZLIB_LIBRARIES=lib_path
```

* 使用外部openssl

```txt
-DLWS_WITH_HTTP2=1 -DLWS_OPENSSL_INCLUDE_DIRS=inc_path -DLWS_OPENSSL_LIBRARIES=lib_path
```

