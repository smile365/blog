---
title:  python-shell
heading: 
date: 2022-03-09T14:28:18.324Z
categories: ["other"]
tags: 
description: 
---

方法一：os.system

os.system 只能执行程序，并打印输出结果，返回值仅返回是否成功，成功返回 0 ，否则返回非零数字。

```python
a = os.system("pwd") # a = 0
b = os.system("cd xxx") # b = 256
```

