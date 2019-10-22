---
title: loguru比logging更优雅的python日志记录工具 
date: 2019-10-22T06:51:43.672Z
tags: 
categories:
draft: true
description: 
---

### 日志需求如下
- 同时输出到控制台和日志文件
- 文件按天分割，最多保存7天的日志
- 日志格式：时间 | 级别 |文件名:代码行 - 消息
- 日志举例：2019-10-22 13:34:06 | INFO | log.py:56 - this is a test message

### 代码如下
```python
from loguru import logger as log
import sys

#日志格式
format="{time:YYYY-MM-DD HH:mm:ss} | {level} | {file}:{line} - {message}"

#修改默认的日志格式
log.configure(handlers=[
	dict(sink=sys.stderr,format=format)])

#增加一个文件日志，每天0点创建新的日志文件，保存最近7天的日志。
log.add('out.log',format=format,rotation="00:00",retention="7 days")
log.info('this is a test message')
```


参考

- [loguru-github](https://github.com/Delgan/loguru)