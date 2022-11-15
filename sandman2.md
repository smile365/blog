---
title:  sandman2
heading: 
date: 2022-03-22T08:41:29.892Z
categories: ["other"]
tags: 
description: 
---

[sandman2](https://github.com/jeffknupp/sandman2) 使用教程

在 python3.6 下比较稳定

mysql to RESTful api


sandman2自动从现有数据库生成 RESTful API 服务，无需您编写一行代码。

不需要写一行代码，直接把 MySQL 数据库变成 RESTful API 服务。 支持数据库：
MySQL
PostgreSQL
Oracle
Microsoft SQL Server
SQLite
Sybase
Drizzle
Firebird




```bash
# 安装
# pip3 install pymysql
pip3 install sandman2

# sandman2ctl 'sqlite+pysqlite:///path/to/sqlite/database.db'

# sandman2ctl 'mysql+pymysql://username:password@localhost:3306/mydb'

# pip install psycopg2 psycopg2-binary
sandman2ctl postgresql+psycopg2://user:password@localhost/mydatabase
```

如果密码中有特殊字符，需要使用 [ URL 编码](https://docs.sqlalchemy.org/en/20/core/engines.html)

访问： http://127.0.0.1:5000/admin/