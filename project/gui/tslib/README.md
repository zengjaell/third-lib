# tslib编译


## 编译选项

### `--enable-input-evdev`

增加`libevdev`支持

* 编译出现如下错误

```c
/bin/bash ../libtool  --tag=CC   --mode=compile /opt/data/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc -DHAVE_CONFIG_H -I. -I/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins -I..  -I/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/src  -I/home/uos/data/install/hisi-linux/arm-himix200-linux/include/libevdev-1.0/ -DGCC_HASCLASSVISIBILITY -O2 -Wall -W -fPIC -c -o input_evdev_la-input-evdev-raw.lo `test -f 'input-evdev-raw.c' || echo '/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins/'`input-evdev-raw.c
libtool: compile:  /opt/data/opt/toolchains/hisi-linux/arm-himix200-linux/bin/arm-himix200-linux-gcc -DHAVE_CONFIG_H -I. -I/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins -I.. -I/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/src -I/home/uos/data/install/hisi-linux/arm-himix200-linux/include/libevdev-1.0/ -DGCC_HASCLASSVISIBILITY -O2 -Wall -W -fPIC -c /opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins/input-evdev-raw.c  -fPIC -DPIC -o .libs/input_evdev_la-input-evdev-raw.o
/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins/input-evdev-raw.c: In function 'ts_input_read_mt':
/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins/input-evdev-raw.c:781:9: error: 'ABS_MT_TOOL_X' undeclared (first use in this function)
    case ABS_MT_TOOL_X:
         ^~~~~~~~~~~~~
/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins/input-evdev-raw.c:781:9: note: each undeclared identifier is reported only once for each function it appears in
/opt/data/office/xia/3rd-lib/project/tslib/../../src/tslib-1.22/plugins/input-evdev-raw.c:789:9: error: 'ABS_MT_TOOL_Y' undeclared (first use in this function)
    case ABS_MT_TOOL_Y:
         ^~~~~~~~~~~~~
```

上述两个宏定义在`linux/input.h`, 但是有的`gcc`中`input.h`文件中没有定义这两个宏。

如果使用的`gcc`中有这两个宏，但是还是会出现如上的错误，因为编译的`input-evdev-raw.c`文件没有引用`linux/input.h`头文件

综合以上两种情况，这里在编译之前增加这两个宏定义到`config.h`文件中。

```shell
	cd $(build_path)/$(@:-config=) && \
		sed -i '/#define VERSION/a #define ABS_MT_TOOL_Y 0x3d' config.h && \
		sed -i '/#define VERSION/a #define ABS_MT_TOOL_X 0x3c' config.h
```

详见[`Makefile`](Makefile)




