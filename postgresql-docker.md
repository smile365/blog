---
title:  使用 docker 安装 PostgreSQL 数据库
heading: 
date: 2023-06-27T22:13:00.474Z
tags: ["PostgreSQL教程","postgresql安装教程"]
categories: ["code"] 
---


## 准备工作

1. 创建配置文件
```yaml
version: "3"
services:
  pg:
    image: postgres
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    restart: always
    ports:
      - 5432:5432

```

 2. 启动
```bash
# 使用 dc 命令代替 docker compose （下同）
 dc up -d pg
```

 3. 创建数据库
 ```bash
dc exec -it pg psql -U postgres
CREATE DATABASE mydatabase;
# 列出数据库
\l
 ```