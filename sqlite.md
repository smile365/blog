---
title:  sqlite简洁教程
heading: 如何打开.db文件，用什么软件打开.db文件
date: 2020-07-17T06:18:32.125Z
categories: ["code"]
tags: 
description:  如何打开.db文件
---

sqlite数据库简洁，仅仅有一个c文件，方便嵌入大多数语言或者嵌入式设备。

sqlite的数据结构与mysql不同，导出的.db数据文件无法直接导入到其他数据库。

可以写一个python脚本进行转换。

在linux环境下可以如下调用:
```bash
sqlite3 sample.db .dump | python dump_for_mysql.py > dump.sql
```

常用命令
```sql
# 打开数据库 
sqlite3 your.db
# 查看表
sqlite> .tables
# 查看表结构
sqlite> .schema table_name
```

更多命令请参考[sqlite](https://www.sqlite.org/cli.html)
