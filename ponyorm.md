---
title:  ponyorm简单入门教程
heading: 
date: 2020-05-21T08:40:59.435Z
categories: ["code"]
tags: 
description: 
---

安装： `pip install pony`

[实体的定义](https://docs.ponyorm.org/entities.html)

pony自动检测更新，当含有db_session装饰的方法执行完毕后，pony会检测对象是否有更新，如果有更新会自动更新到数据库。

缺点：不支持修改表结构。


如果使用 PostgreSQL 数据库的话需要安装 [psycopg2](https://pypi.org/project/psycopg2/)

```
# 通过 pip 安装(实时编译)
pip install postgresql

# 也可以安装编译好的
pip install psycopg2-binary

# mac 系统也可通过 brew 安装
brew install postgresql
```

参考 
- [psycopg](https://www.psycopg.org/docs/)