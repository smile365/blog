---
title:  python-shell
heading: 
date: 2022-03-09T14:28:18.324Z
categories: ["other"]
tags: 
description: 
---

## 方法一：os.system

[os.system](https://docs.python.org/3/library/os.html#os.system) 只能执行命令，无法获取执行的结果。并打印输出结果，返回值仅返回是否成功，成功返回 0 ，否则返回非零数字。

```python
import os
a = os.system("pwd") # a = 0
b = os.system("cd xxx") # b = 256
```


## 方法二：subprocess.run

官方建议使用[subprocess](https://docs.python.org/3/library/subprocess.html#module-subprocess)替换 os.system。subprocess 允许您生成新进程，连接到它们的输入/输出/错误管道，并获取它们的返回码。执行后返回的是  

[subprocess.run](https://docs.python.org/3/library/subprocess.html#subprocess.run) 执行完毕后返回的是 [CompletedProcess](https://docs.python.org/3/library/subprocess.html#subprocess.CompletedProcess) 的一个实例。

```python
import subprocess
completedProcess = subprocess.run(["ls", "-l"])
print(list_files) # completedProcess
```

## 方法三：subprocess.call

运行 [subprocess.call](https://docs.python.org/3/library/subprocess.html#subprocess.call)  命令 完成后返回 returncode 属性。也取不到返回值。


