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

```shell
mkdir -p redis/conf
mkdir -p redis/data
vi redis/conf/redis.conf
```

[redis.conf](https://redis.io/topics/config)配置文件如下

```nginx
bind 0.0.0.0
requirepass sxy91
protected-mode yes
port 6379
tcp-backlog 511
timeout 0
tcp-keepalive 300
daemonize no
supervised no
pidfile /data/redis_6379.pid
loglevel notice
logfile ""
databases 16
save 900 1
save 300 10
save 60 10000
stop-writes-on-bgsave-error yes
rdbcompression yes
rdbchecksum yes
dbfilename dump.rdb
dir /data
slave-serve-stale-data yes
slave-read-only yes
repl-diskless-sync no
repl-diskless-sync-delay 5
repl-disable-tcp-nodelay no
slave-priority 100
appendonly no
appendfilename "appendonly.aof"
appendfsync everysec
no-appendfsync-on-rewrite no
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
aof-load-truncated yes
lua-time-limit 5000
slowlog-log-slower-than 10000
slowlog-max-len 128
latency-monitor-threshold 0
notify-keyspace-events ""
hash-max-ziplist-entries 512
hash-max-ziplist-value 64
list-max-ziplist-size -2
list-compress-depth 0
set-max-intset-entries 512
zset-max-ziplist-entries 128
zset-max-ziplist-value 64
hll-sparse-max-bytes 3000
activerehashing yes
client-output-buffer-limit normal 0 0 0
client-output-buffer-limit slave 256mb 64mb 60
client-output-buffer-limit pubsub 32mb 8mb 60
hz 10
aof-rewrite-incremental-fsync yes
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