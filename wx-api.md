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
docker run --name myname -p 3306:3306 -e MYSQL_ROOT_PASSWORD=yourpass -d  mariadb
#进入容器
docker exec -it myname /bin/bash
#数据导入导出
MYSQL_ROOT_PASSWORD=yourpass
# 导出数据
docker exec myname sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
# 导入数据
docker exec -i myname sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql
# 拷贝数据
docker cp mysql-2020-05-10.sql myname:/home/db.sql
```

创建数据库wx，数据库字符集utf8mb4，编码规则utf8mb4_general_ci，并导入数据
```sql
mysql -u root -p;
SELECT VERSION();
SHOW CHARACTER SET;
CREATE DATABASE wx CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
show databases;
source /home/db.sql
```


服务器增加一个二级域名dev.sxy91.com并解析到sxy91.com，然后配置nginx。
```dsconfig
server {
    listen 80;
	server_name dev.sxy91.com;
	location / {
        proxy_pass http://127.0.0.1:8088;
    }
}
```

使用ssh隧道反向代理8088端口
```bash
ssh -R 8088:127.0.0.1:8088 root@sxy91.com
```

使用[测试版微信公众号](https://mp.weixin.qq.com/debug/cgi-bin/sandboxinfo?action=showinfo&t=sandbox/index)配置测试信息。

启动wx-api进行测试。

修改配置：src/main/resources/application-dev.yml
修改日志文件的路径：src/main/resources/logback-spring.
wx-api/


