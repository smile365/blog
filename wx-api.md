---
title:  微信公众号管理系统wx-api部署教程
heading: 使用wx-api管理微信公众号
date: 2020-05-19T08:40:28.316Z
categories: ["code"]
tags: 
description: 
---

微信公众号管理系统，包含公众号菜单管理、自动回复、素材管理、模板消息、粉丝管理️等功，适合已经认证成功的微信订阅号，个人非认证号暂不支持（没有api的权限，因此无法部署成功）。

项目：
- [后端wx-api](https://github.com/niefy/wx-api)
- [前端wx-manage](https://github.com/niefy/wx-manage)


使用docker安装mysql或MariaDB。
```bash
#创建容器
docker run --name myname -p 3306:3306 -e MYSQL_ROOT_PASSWORD=yourpass -d  mariadb

# 把主机的 sql 文件拷贝到容器内
docker cp mysql-2020-05-10.sql myname:/home/db.sql

#进入容器
docker exec -it myname /bin/bash
```

> **参数说明** -p:外面端口:里面端口, -p:主机端口:容器端口

创建数据库wx，数据库字符集utf8mb4，编码规则utf8mb4_general_ci，并导入数据
```sql
mysql -u root -p;
SELECT VERSION();
SHOW CHARACTER SET;
CREATE DATABASE wx CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
show databases;
use wx;
source /home/db.sql
```


服务器增加一个二级域名dev.sxy91.com并解析到sxy91.com，然后配置nginx。
```dsconfig
server {
    listen 80;
	server_name dev.sxy91.com;
	location / {
        proxy_pass http://127.0.0.1:8087;
    }
}
```

使用ssh隧道反向代理8088端口
```bash
ssh -R 8091:127.0.0.1:8088 root@sxy91.com
```

使用[测试版微信公众号](https://mp.weixin.qq.com/debug/cgi-bin/sandboxinfo?action=showinfo&t=sandbox/index)配置测试信息。

启动wx-api进行测试。

修改配置：src/main/resources/application-dev.yml
修改日志文件的路径：src/main/resources/logback-spring.
wx-api/


运行前端
```
cnpm install
cnpm run serve
```

#### 如何打包

项目名上右键
- 1. 打开模块设置
- 2. Artfacts
- 3. 选择Jar，from module
- 4. Directory目录建议改成/xxx/target

#### 如何运行
略


#### 数据导入导出
```bash
# 先配置密码
MYSQL_ROOT_PASSWORD=yourpass
# 导出数据
docker exec myname sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > /some/path/on/your/host/all-databases.sql
# 导入数据
docker exec -i myname sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < /some/path/on/your/host/all-databases.sql

```

参考  
- [idea工具将SpringBoot工程打包成 jar或war](https://blog.csdn.net/WillJGL/article/details/75125801)