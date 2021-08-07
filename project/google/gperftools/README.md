# gperftools

## 介绍

## demo

* 链接指定库

`-Wl,--no-as-needed -lprofiler`

* 指定prof生成路径

`CPUPROFILE=cpu_perf.prof ./main`

* 生成相关信息

`pprof --text ./main main.prof`: 生成text信息

`pprof --callgrind ./main main.prof > main.out`: 生成图形相关信息, 用`kcachegrind`打开main.out

