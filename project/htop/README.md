使用说明
========

## 编译

### 缺少terminfo环境变量

* 运行htop出现如下问题

```
  $ htop
  Error opening terminal: vt102.
  $
```

* 查看以下两个变量

```
  $ echo $TERM
  $ echo $TERMINFO
```

* 增加环境变量

```
  $ vi /etc/profile
  export TERM=vt102
  export TERMINFO=/usr/share/terminfo
```
> note: 确保在/usr/share/terminfo/v/下，存在vt102这个文件

## 使用技巧

