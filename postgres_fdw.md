---
title:  使用 postgres_fdw 关联外部数据库的表
heading: 
date: 2023-08-23T18:16:05.490Z
categories: ["code"]
tags: 
description: 
---

## postgres_fdw 的安装和使用
1. 使用 psql 命令安装扩展 postgres_fdw
```bash
CREATE EXTENSION postgres_fdw;
```

2. 然后使用 `CREATE SERVER` 创建一个外部服务器，取名为 foreign_server，连接远程 foreign_db 数据库。
```bash
CREATE SERVER foreign_server
        FOREIGN DATA WRAPPER postgres_fdw
        OPTIONS (host 'sxy21.com', port '5432', dbname 'foreign_db');
```

3. 使用 CREATE USER MAPPING 定义一个本地数据库用户 postgres 与远程数据库用户 foreign_user 的映射。
```bash
CREATE USER MAPPING FOR local_user
        SERVER foreign_server
        OPTIONS (user 'foreign_user', password 'password');
```
4. 使用 IMPORT FOREIGN SCHEMA 导入远程数据库 public 模式下的 users 表到本地数据库的 public 模式下。
```bash
IMPORT FOREIGN SCHEMA public LIMIT TO (users)
    FROM SERVER foreign_server INTO public;
```

5. 测试
```bash
# 查看外部的表
# List of foreign tables
\det+

# 查询
select count(*) from users;
```


## 参考文档
- [postgres-fdw 官网文档](http://www.postgres.cn/docs/14/postgres-fdw.html#id-1.11.7.44.16)