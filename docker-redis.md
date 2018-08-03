---
title:  docker安装redis
date: 2018-08-02T08:04:58.261Z
tags: ["redis"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---


创建文件

```shell
mkdir -p redis/conf
mkdir -p redis/data
vi redis/conf/redis.conf
```

redis.conf配置文件如下

```nginx
bind 0.0.0.0
requirepass sxy91
protected-mode yes
port 6379
```

使用docker安装redis

```shell
docker run -d -ti -p 6379:6379 -v /home/soft/redis/conf/redis.conf:/etc/redis/redis.conf -v /home/soft/redis/db:/data --restart always --name redis redis:3.2 redis-server /etc/redis/redis.conf
docker ps
docker exec -it redis redis-cli -h 127.0.0.1 -p 6379 -a sxy91
```

参考

- [Linux-Tutorial](https://github.com/judasn/Linux-Tutorial)