---
title:  wx-api
heading:
date: 2020-05-19T08:40:28.316Z
categories: ["code"]
tags: 
description: 
---

项目：
- [后端wx-api](https://github.com/niefy/wx-api)
- [前端wx-manage](https://github.com/niefy/wx-manage)


使用docker安装mysql或MariaDB。
```bash
#创建容器
docker run --name dbname -p 3306:3306 -e MYSQL_ROOT_PASSWORD=yourpass -d  mariadb
#进入容器
docker exec -it dbname /bin/bash
#数据导入导出
MYSQL_ROOT_PASSWORD=yourpass
# 导出数据
docker exec dbname sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
# 导入数据
docker exec -i dbname sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql
```

创建数据库wx，数据库字符集utf8mb4，编码规则utf8mb4_general_ci
```sql
mysql -u root -p;
SELECT VERSION();
CREATE DATABASE wxapi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
show databases;
```



