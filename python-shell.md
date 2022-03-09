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

## 方法二：subprocess.call

官方建议使用[subprocess](https://docs.python.org/3/library/subprocess.html#module-subprocess)替换 os.system。

运行 [subprocess.call](https://docs.python.org/3/library/subprocess.html#subprocess.call)  命令 完成后返回 returncode 属性。也取不到返回值。



## 方法三：subprocess.run

subprocess 允许您生成新进程，连接到它们。执行后返回的是  

[subprocess.run](https://docs.python.org/3/library/subprocess.html#subprocess.run)可以控制输入/输出/错误管道，执行完毕后可获取它们的输出和返回码。其返回值为 [CompletedProcess](https://docs.python.org/3/library/subprocess.html#subprocess.CompletedProcess) 的一个实例。

```python
import subprocess
list_files = subprocess.run(["ls", "-l"])
print(list_files) # completedProcess
```

定义 stdout=subprocess.PIPE 和 text=True 即可获取字符串形式的执行结果。

```python
import subprocess
list_files = subprocess.run(["ls", "-l"],stdout=subprocess.PIPE, text=True)
useless_cat_call = subprocess.run(["cat"], 
print(list_files.stdout)  #
```

## 方法四：subprocess.Popen

相当于异步执行


## 总结

如果您需要运行一个或几个简单的命令并且不介意它们的输出是否发送到控制台，您可以使用该os.system()命令。如果要管理 shell 命令的输入和输出，请使用subprocess.run(). 如果要运行命令并在执行时继续执行其他工作，请使用subprocess.Popen