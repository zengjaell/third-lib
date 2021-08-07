# valgrind


## 介绍

## demo

### 互斥量、读写锁长占时

* demo-mutex: 互斥量

`valgrind --tool=drd --exclusive-threshold=10 ./main -i 20`

> `--exclusive-threshold=10`: 检查所有独占锁占用10ms已上的场景

```txt
==697911== drd, a thread error detector
==697911== Copyright (C) 2006-2017, and GNU GPL'd, by Bart Van Assche.
==697911== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==697911== Command: ./main -i 20
==697911== 
Locking mutex ...
==697911== Acquired at:
==697911==    at 0x484582C: pthread_mutex_lock (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==697911==    by 0x10942B: double_lock_mutex (main.c:29)
==697911==    by 0x109500: main (main.c:52)


==697911== Lock on mutex 0x1ffefff7e0 was held during 23 ms (threshold: 10 ms).
显示互斥量占用了23ms


==697911==    at 0x484687C: pthread_mutex_unlock (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==697911==    by 0x109459: double_lock_mutex (main.c:33)
==697911==    by 0x109500: main (main.c:52)
==697911== mutex 0x1ffefff7e0 was first observed at:
==697911==    at 0x4844C36: pthread_mutex_init (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==697911==    by 0x109413: double_lock_mutex (main.c:27)
==697911==    by 0x109500: main (main.c:52)
==697911== 
Done.
==697911== 
==697911== For lists of detected and suppressed errors, rerun with: -s
==697911== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

* demo-rwlock: 写锁

`valgrind --tool=drd --exclusive-threshold=10 ./main -i 20`

> `--exclusive-threshold=10`: 检查所有独占锁占用10ms已上的场景

```txt
==698489== drd, a thread error detector
==698489== Copyright (C) 2006-2017, and GNU GPL'd, by Bart Van Assche.
==698489== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==698489== Command: ./main -i 20
==698489== 
Locking rwlock exclusively ...
==698489== Acquired at:
==698489==    at 0x484DECB: pthread_rwlock_wrlock (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==698489==    by 0x1093A0: write_lock (main.c:25)
==698489==    by 0x10945D: main (main.c:46)


==698489== Lock on rwlock 0x1ffefff7d0 was held during 22 ms (threshold: 10 ms).
显示写锁占用了22ms


==698489==    at 0x484F3FB: pthread_rwlock_unlock (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==698489==    by 0x1093B6: write_lock (main.c:27)
==698489==    by 0x10945D: main (main.c:46)
==698489== rwlock 0x1ffefff7d0 was first observed at:
==698489==    at 0x484D0EB: pthread_rwlock_init (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==698489==    by 0x109394: write_lock (main.c:24)
==698489==    by 0x10945D: main (main.c:46)
==698489== 
Done.
==698489== 
==698489== For lists of detected and suppressed errors, rerun with: -s
==698489== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

* demo-rwlock-read: 读锁(共享锁)

`valgrind --tool=drd --shared-threshold=10 ./hold_lock -i 20`

> note: `--shared-threshold=10`: 检查所有共享锁占用10ms已上的场景

```txt
==699174== drd, a thread error detector
==699174== Copyright (C) 2006-2017, and GNU GPL'd, by Bart Van Assche.
==699174== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==699174== Command: ./main -i 20
==699174== 
Locking rwlock shared ...
==699174== Acquired at:
==699174==    at 0x484DA7B: pthread_rwlock_rdlock (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==699174==    by 0x1093A0: read_lock (main.c:25)
==699174==    by 0x109475: main (main.c:48)


==699174== Lock on rwlock 0x1ffefff7c0 was held during 22 ms (threshold: 10 ms).
显示读锁占用了22ms


==699174==    at 0x484F3FB: pthread_rwlock_unlock (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==699174==    by 0x1093CE: read_lock (main.c:29)
==699174==    by 0x109475: main (main.c:48)
==699174== rwlock 0x1ffefff7c0 was first observed at:
==699174==    at 0x484D0EB: pthread_rwlock_init (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==699174==    by 0x109394: read_lock (main.c:24)
==699174==    by 0x109475: main (main.c:48)
==699174== 
Done.
==699174== 
==699174== For lists of detected and suppressed errors, rerun with: -s
==699174== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

* demo-deadlock: 死锁检测

死锁检测

```txt
==696235== drd, a thread error detector
==696235== Copyright (C) 2006-2017, and GNU GPL'd, by Bart Van Assche.
==696235== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==696235== Command: ./main
==696235== 
==696235== [1] mutex_init      mutex 0x10c040
==696235== [1] mutex_init      mutex 0x10c0a0
==696235== [1] mutex_init      mutex 0x1ffefff790
==696235== [1] mutex_ignore_ordering mutex 0x1ffefff790
==696235== [1] mutex_trylock   mutex 0x1ffefff790 rc 0 owner 0
==696235== [1] post_mutex_lock mutex 0x1ffefff790 rc 0 owner 0
==696235== [1] mutex_unlock    mutex 0x1ffefff790 rc 1
==696235== [2] mutex_trylock   mutex 0x1ffefff790 rc 0 owner 1
==696235== [2] post_mutex_lock mutex 0x1ffefff790 rc 0 owner 1
==696235== [2] mutex_unlock    mutex 0x1ffefff790 rc 1
==696235== [2] mutex_trylock   mutex 0x10c040 rc 0 owner 0
==696235== [2] post_mutex_lock mutex 0x10c040 rc 0 owner 0
==696235== [1] cond_post_wait  mutex 0x1ffefff790 rc 0 owner 2
==696235== [1] mutex_unlock    mutex 0x1ffefff790 rc 1
==696235== [1] mutex_destroy   mutex 0x1ffefff790 rc 0 owner 1
==696235== [1] mutex_trylock   mutex 0x10c0a0 rc 0 owner 0
==696235== [1] post_mutex_lock mutex 0x10c0a0 rc 0 owner 0


==696235== [2] mutex_trylock   mutex 0x10c0a0 rc 1 owner 1
线程2试图给`0x10c0a0`上锁，但是该锁被线程1拥有

==696235== [1] mutex_trylock   mutex 0x10c040 rc 1 owner 2
线程1试图给`0x10c040`上锁，但是该锁被线程2拥有


^C==696235== 
==696235== Process terminating with default action of signal 2 (SIGINT)
==696235==    at 0x488B170: __lll_lock_wait (lowlevellock.c:52)
==696235==    by 0x48830A2: pthread_mutex_lock (pthread_mutex_lock.c:80)
==696235==    by 0x48457CE: pthread_mutex_lock (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_drd-amd64-linux.so)
==696235==    by 0x1092B4: lock (main.c:13)
==696235==    by 0x10939F: main (main.c:39)
==696235== 
==696235== For lists of detected and suppressed errors, rerun with: -s
==696235== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 12 from 8)
make: *** [makefile:42: main-main] Interrupt
```

死锁位置检测

```txt
==696984== Helgrind, a thread error detector
==696984== Copyright (C) 2007-2017, and GNU GPL'd, by OpenWorks LLP et al.
==696984== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==696984== Command: ./main
==696984== 
^C==696984== 
==696984== Process terminating with default action of signal 2 (SIGINT)
==696984==    at 0x487F170: __lll_lock_wait (lowlevellock.c:52)
==696984==    by 0x48770A2: pthread_mutex_lock (pthread_mutex_lock.c:80)
==696984==    by 0x483FE78: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)


==696984==    by 0x1092B4: lock (main.c:13)
死锁发生位置`main.c:13`


==696984==    by 0x10939F: main (main.c:39)
==696984== ---Thread-Announcement------------------------------------------
==696984== 
==696984== Thread #2 was created
==696984==    at 0x49B0282: clone (clone.S:71)
==696984==    by 0x48732EB: create_thread (createthread.c:101)
==696984==    by 0x4874E0F: pthread_create@@GLIBC_2.2.5 (pthread_create.c:817)
==696984==    by 0x4842917: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)
==696984==    by 0x109395: main (main.c:37)
==696984== 
==696984== ----------------------------------------------------------------
==696984== 
==696984== Thread #2: Exiting thread still holds 1 lock
==696984==    at 0x487F170: __lll_lock_wait (lowlevellock.c:52)
==696984==    by 0x48770A2: pthread_mutex_lock (pthread_mutex_lock.c:80)
==696984==    by 0x483FE78: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)


==696984==    by 0x109303: thread_routine (main.c:24)
死锁发生位置`main.c:24`


==696984==    by 0x4842B1A: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)
==696984==    by 0x4874608: start_thread (pthread_create.c:477)
==696984==    by 0x49B0292: clone (clone.S:95)
==696984== 
==696984== ---Thread-Announcement------------------------------------------
==696984== 
==696984== Thread #1 is the program's root thread
==696984== 
==696984== ----------------------------------------------------------------
==696984== 
==696984== Thread #1: Exiting thread still holds 1 lock
==696984==    at 0x487F170: __lll_lock_wait (lowlevellock.c:52)
==696984==    by 0x48770A2: pthread_mutex_lock (pthread_mutex_lock.c:80)
==696984==    by 0x483FE78: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)
==696984==    by 0x1092B4: lock (main.c:13)
==696984==    by 0x10939F: main (main.c:39)
==696984== 
==696984== 
==696984== Use --history-level=approx or =none to gain increased speed, at
==696984== the cost of reduced accuracy of conflicting-access information
==696984== For lists of detected and suppressed errors, rerun with: -s
==696984== ERROR SUMMARY: 2 errors from 2 contexts (suppressed: 0 from 0)
```

### 动态执行流程分析和性能瓶颈分析

* demo-callgrind: 性能分析

产生检测信息

`valgrind --tool=callgrind --separate-threads=yes ./main`

> note: `--separate-threads=yes`多线程需要开启

```txt
-rw------- 1 uos uos      0 8月   6 20:33 callgrind.out.700924      // 进程信息
-rw------- 1 uos uos 115185 8月   6 20:33 callgrind.out.700924-01   // 主线程信息
-rw------- 1 uos uos   6227 8月   6 20:33 callgrind.out.700924-02   // 子线程信息
-rw------- 1 uos uos   8336 8月   6 20:33 callgrind.out.700924-03   // 子线程信息
```

定位性能瓶颈

`kcachegrind`打开进程信息

> note: sudo apt install -y kcachegrind

### 内存检测

* demo-mem: 读写越界，变量未初始化

```txt
==829457== Memcheck, a memory error detector
==829457== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==829457== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==829457== Command: ./main
==829457== 
==829457== Invalid write of size 4


==829457==    at 0x1091C5: write_illegal (main.c:12)
写越界了, 在main:12


==829457==    by 0x1092C3: main (main.c:39)
==829457==  Address 0x4a5b050 is 0 bytes after a block of size 16 alloc'd
==829457==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==829457==    by 0x1091AC: write_illegal (main.c:11)
==829457==    by 0x1092C3: main (main.c:39)
==829457== 
==829457== Invalid read of size 4


==829457==    at 0x10921A: read_illegal (main.c:21)
读越界了, 在main:21


==829457==    by 0x1092CD: main (main.c:40)
==829457==  Address 0x4a5b0a0 is 0 bytes after a block of size 16 alloc'd
==829457==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==829457==    by 0x109201: read_illegal (main.c:20)
==829457==    by 0x1092CD: main (main.c:40)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48E0AD8: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)


==829457==    by 0x109282: uninitialised_value (main.c:29)
堆上变量没有初始化, 在main.c:29


==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Use of uninitialised value of size 8
==829457==    at 0x48C481B: _itoa_word (_itoa.c:179)
==829457==    by 0x48E06F4: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x109282: uninitialised_value (main.c:29)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48C482D: _itoa_word (_itoa.c:179)
==829457==    by 0x48E06F4: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x109282: uninitialised_value (main.c:29)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48E13A8: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x109282: uninitialised_value (main.c:29)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48E086E: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x109282: uninitialised_value (main.c:29)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48E0AD8: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)


==829457==    by 0x1092A4: uninitialised_value (main.c:33)
堆上变量没有初始化, 在main.c:29


==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Use of uninitialised value of size 8
==829457==    at 0x48C481B: _itoa_word (_itoa.c:179)
==829457==    by 0x48E06F4: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x1092A4: uninitialised_value (main.c:33)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48C482D: _itoa_word (_itoa.c:179)
==829457==    by 0x48E06F4: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x1092A4: uninitialised_value (main.c:33)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48E13A8: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x1092A4: uninitialised_value (main.c:33)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
==829457== Conditional jump or move depends on uninitialised value(s)
==829457==    at 0x48E086E: __vfprintf_internal (vfprintf-internal.c:1687)
==829457==    by 0x48CAEBE: printf (printf.c:33)
==829457==    by 0x1092A4: uninitialised_value (main.c:33)
==829457==    by 0x1092D7: main (main.c:41)
==829457== 
00==829457== 
==829457== HEAP SUMMARY:
==829457==     in use at exit: 0 bytes in 0 blocks
==829457==   total heap usage: 4 allocs, 4 frees, 1,072 bytes allocated
==829457== 
==829457== All heap blocks were freed -- no leaks are possible
==829457== 
==829457== Use --track-origins=yes to see where uninitialised values come from
==829457== For lists of detected and suppressed errors, rerun with: -s
==829457== ERROR SUMMARY: 12 errors from 12 contexts (suppressed: 0 from 0)
```

* demo-mem-free: 释放内存空间

```txt
==831837== Memcheck, a memory error detector
==831837== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==831837== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==831837== Command: ./main
==831837== 
==831837== Invalid free() / delete / delete[] / realloc()
==831837==    at 0x483CA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)


==831837==    by 0x1091E8: doubule_free (main.c:13)
内存重复释放


==831837==    by 0x1092EE: main (main.c:39)
==831837==  Address 0x4a5b040 is 0 bytes inside a block of size 16 free'd
==831837==    at 0x483CA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==831837==    by 0x1091DC: doubule_free (main.c:12)
==831837==    by 0x1092EE: main (main.c:39)
==831837==  Block was alloc'd at
==831837==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==831837==    by 0x1091CC: doubule_free (main.c:11)
==831837==    by 0x1092EE: main (main.c:39)
==831837== 
==831837== Invalid free() / delete / delete[] / realloc()
==831837==    at 0x483CA3F: free (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)


==831837==    by 0x109225: no_heap (main.c:20)
释放非堆内存


==831837==    by 0x1092F8: main (main.c:40)
==831837==  Address 0x1ffefff7ec is on thread 1's stack
==831837==  in frame #1, created by no_heap (main.c:17)
==831837== 
==831837== Argument 'size' of function malloc has a fishy (possibly negative) value: -1
==831837==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)


==831837==    by 0x1092BA: test (main.c:32)
可疑参数


==831837==    by 0x10930C: main (main.c:42)
==831837== 
==831837== 
==831837== HEAP SUMMARY:
==831837==     in use at exit: 0 bytes in 0 blocks
==831837==   total heap usage: 1 allocs, 3 frees, 16 bytes allocated
==831837== 
==831837== All heap blocks were freed -- no leaks are possible
==831837== 
==831837== For lists of detected and suppressed errors, rerun with: -s
==831837== ERROR SUMMARY: 3 errors from 3 contexts (suppressed: 0 from 0)
```

* demo-mem-leak: 内存泄露

```txt
==832906== Memcheck, a memory error detector
==832906== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==832906== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==832906== Command: ./main
==832906== 
==832906== 
==832906== HEAP SUMMARY:
==832906==     in use at exit: 32 bytes in 1 blocks
==832906==   total heap usage: 1 allocs, 0 frees, 32 bytes allocated
==832906== 
==832906== 32 bytes in 1 blocks are definitely lost in loss record 1 of 1
==832906==    at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)


==832906==    by 0x109168: mem_leak (main.c:11)
发生内存泄露的地方


==832906==    by 0x109190: main (main.c:17)
==832906== 
==832906== LEAK SUMMARY:
==832906==    definitely lost: 32 bytes in 1 blocks
==832906==    indirectly lost: 0 bytes in 0 blocks
==832906==      possibly lost: 0 bytes in 0 blocks
==832906==    still reachable: 0 bytes in 0 blocks
==832906==         suppressed: 0 bytes in 0 blocks
==832906== 
==832906== For lists of detected and suppressed errors, rerun with: -s
==832906== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

* demo-mem-leak-1: 内存泄露

`sudo apt install massif-visualizer -y`

`valgrind --tool=massif --time-unit=B --detailed-freq=1`

* demo-data_race: 数据竞争

```txt
==835971== Helgrind, a thread error detector
==835971== Copyright (C) 2007-2017, and GNU GPL'd, by OpenWorks LLP et al.
==835971== Using Valgrind-3.15.0 and LibVEX; rerun with -h for copyright info
==835971== Command: ./main
==835971== 
==835971== ---Thread-Announcement------------------------------------------
==835971== 
==835971== Thread #3 was created
==835971==    at 0x49B1282: clone (clone.S:71)
==835971==    by 0x48742EB: create_thread (createthread.c:101)
==835971==    by 0x4875E0F: pthread_create@@GLIBC_2.2.5 (pthread_create.c:817)
==835971==    by 0x4842917: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)
==835971==    by 0x109395: main (main.c:29)
==835971== 
==835971== ---Thread-Announcement------------------------------------------
==835971== 
==835971== Thread #2 was created
==835971==    at 0x49B1282: clone (clone.S:71)
==835971==    by 0x48742EB: create_thread (createthread.c:101)
==835971==    by 0x4875E0F: pthread_create@@GLIBC_2.2.5 (pthread_create.c:817)
==835971==    by 0x4842917: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)
==835971==    by 0x109378: main (main.c:28)
==835971== 
==835971== ----------------------------------------------------------------
==835971== 


==835971== Possible data race during write of size 4 at 0x10C078 by thread #3
==835971== Locks held: none
存在数据竞争


==835971==    at 0x109306: thread_func (main.c:17)
==835971==    by 0x4842B1A: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)
==835971==    by 0x4875608: start_thread (pthread_create.c:477)
==835971==    by 0x49B1292: clone (clone.S:95)
==835971== 


==835971== This conflicts with a previous write of size 4 by thread #2
==835971== Locks held: none
存在数据竞争


==835971==    at 0x109306: thread_func (main.c:17)
==835971==    by 0x4842B1A: ??? (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_helgrind-amd64-linux.so)
==835971==    by 0x4875608: start_thread (pthread_create.c:477)
==835971==    by 0x49B1292: clone (clone.S:95)
==835971==  Address 0x10c078 is 0 bytes inside data symbol "s_racy"
==835971== 
Result: 2
==835971== 
==835971== Use --history-level=approx or =none to gain increased speed, at
==835971== the cost of reduced accuracy of conflicting-access information
==835971== For lists of detected and suppressed errors, rerun with: -s
==835971== ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)
```

