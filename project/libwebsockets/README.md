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

* 使用外部mbedtls

```txt
-DLWS_WITH_LWSWS:BOOL=ON -DLWS_WITH_MBEDTLS:BOOL=ON -DLWS_MBEDTLS_LIBRARIES="$(prefix_path)/lib/libmbedcrypto.so;$(prefix_path)/lib/libmbedtls.so;$(prefix_path)/lib/libmbedx509.so" -DLWS_MBEDTLS_INCLUDE_DIRS="$(prefix_path)/include"
```
> note: 如果openssl库同时存在时，会编译失败

