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
```sql
CREATE SERVER foreign_server
        FOREIGN DATA WRAPPER postgres_fdw
        OPTIONS (host 'sxy21.com', port '5432', dbname 'foreign_db');

--- 查看创建的服务
--- SELECT * FROM pg_foreign_server;

--- 修改创建的服务
ALTER SERVER foreign_server
OPTIONS (SET host 'new_host');
OPTIONS (SET host 'new_host',SET port '15432');

```

3. 使用 CREATE USER MAPPING 定义一个本地数据库用户 postgres 与远程数据库用户 foreign_user 的映射。
```sql
CREATE USER MAPPING FOR local_user
        SERVER foreign_server
        OPTIONS (user 'foreign_user', password 'password');


--- 查看创建的用户
SELECT umid, srvname, usename, umoptions
FROM pg_user_mappings;

--- 删除用户映射（创建后无法修改，只能删除后重建）
DROP USER MAPPING FOR local_user SERVER pg_foreign_server;

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