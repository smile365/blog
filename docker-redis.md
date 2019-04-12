---
title:  docker安装redis
date: 2018-08-02T08:04:58.261Z
tags: ["docker","redis"]
series: ["blog"]
categories: ["code"]
description:
---

安装最新版redis请参考[install-redis-from-REMI](https://computingforgeeks.com/how-to-install-latest-redis-on-centos-7/)

#### 基于docker安装redis
创建文件
挂在的目录存放conf/data/rdb/aof
```shell
mkdir -p redis/conf
mkdir -p redis/data
cd redis/conf
wget http://download.redis.io/redis-stable/redis.conf
```

[redis.conf](https://redis.io/topics/config)配置文件建议修改一下项

```nginx
bind 0.0.0.0
requirepass sxy91

pidfile /data/redis_6379.pid
logfile ""
save ""
dir /data
appendonly yes
```

使用docker安装redis

```shell
docker run -d -ti -p 6379:6379 -v /home/soft/redis/conf/redis.conf:/etc/redis/redis.conf -v /home/soft/redis/db:/data --restart always --name redis redis redis-server /etc/redis/redis.conf
docker ps
docker exec -it redis redis-cli -h 127.0.0.1 -p 6379 -a sxy91
```

### 查看docker里的redis日志
```docker
docker logs redis
```

#### mac 安装redis客户端

```shell
brew tap ringohub/redis-cli
brew update && brew doctor
brew install redis-cli
```

修改hosts

```shell
#注意更改为自己的ip
192.168.31.68 my1.com my1
```

使用redis-cli

```shell
redis-cli -h my1 -a mypass
```

参考

- [Linux-Tutorial](https://github.com/judasn/Linux-Tutorial)
- [homebrew的tap功能](https://segmentfault.com/a/1190000012826983)
- [homebrew-redis-cli](https://github.com/ringohub/homebrew-redis-cli)
- [mac修改hosts](https://blog.csdn.net/u012460084/article/details/40186973)