# taskset


## 介绍

### demo

#### demo: 显示线程在不同核心上执行

* 输出信息如下:

```txt
pre:-1, cur:2
pre:2, cur:0
pre:0, cur:2
pre:2, cur:3
pre:3, cur:2
pre:2, cur:0
pre:0, cur:3
pre:3, cur:0
pre:0, cur:3
pre:3, cur:0
pre:0, cur:1
pre:1, cur:2
pre:2, cur:0
pre:0, cur:1
pre:1, cur:0
pre:0, cur:3
pre:3, cur:0
pre:0, cur:1
pre:1, cur:2
pre:2, cur:1
pre:1, cur:3
pre:3, cur:0
```

* 指定核心运行: `taskset -c 0,1 ./main`

```txt
pre:-1, cur:0
pre:0, cur:1
pre:1, cur:0
pre:0, cur:1
pre:1, cur:0
pre:0, cur:1
pre:1, cur:0
pre:0, cur:1
pre:1, cur:0
pre:0, cur:1
pre:1, cur:0
```

#### demo-test: 测试在单核和多核的处理能力

* 不绑定cpu

```txt
./main
a:1341228023	b:1342412986
```

* 绑定0号核心

```txt
taskset -c 0 ./main
a:687240345	b:695860576
```

* 绑定0,1号核心

```txt
taskset -c 0,1 ./main
a:1345677471	b:1351535700
```

* 绑定0,1,2号核心

```txt
taskset -c 0,1,2 ./main
a:1358079171	b:1358465948
```

> note:  可以看到，当启动两个线程时，绑定一个核心的处理能力是绑定两个核心的处理能力的一半左右。而绑定的核心数超过线程数时（如绑定到0,1,2号逻辑核心），其效率并没有明显提高。当然上述结论有个前提：这是CPU资源密集型的场景。


