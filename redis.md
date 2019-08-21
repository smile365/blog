---
title:  redis
date: 2019-04-12T01:50:53.440Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

安装最新版redis请参考[install-redis-from-REMI](https://computingforgeeks.com/how-to-install-latest-redis-on-centos-7/)

```bash
yum -y install redis
systemctl enable redis
#查看默认配置 
awk -F: '/^[^#]/ {print}' /etc/redis.conf
```


建议修改以下几项配置`vim /etc/redis.conf`  

```yaml
bind 0.0.0.0 #ip地址
requirepass yourpass # 密码
logfile "your path log" # 日志文件路径
save "" # 关闭rdb快照
dir "your path" # 数据文件路径
maxmemory # 建议不超过机器最大内存的80%
appendonly yes  # 使用aof方式持久化
appendfilename "appendonly.aof" # aof文件名(只能是文件名，路径为上方配置的dir)
no-appendfsync-on-rewrite yes #异步方式写 由系统决定写入磁盘的时间
auto-aof-rewrite-percentage 100 # 超过100%会把aof文件重写
auto-aof-rewrite-min-size 30G # 第一次超过多大会重写，建议配置成机器内存大小
```

重启  

```shell
systemctl restart redis
#或者通过"redis-server --help"启动
systemctl status  redis
redis-cli
auth yourpass

```


参考  
- [redis-cli config](https://www.zhihu.com/question/46220824)
- [RDB、AOF](https://www.jianshu.com/p/a91329ae210c)
- [save、Bgsave](http://www.runoob.com/redis/redis-backup.html)
- [Redis导致OOM Killer的问题](https://emacsist.github.io/2016/09/06/%E7%94%9F%E4%BA%A7%E7%8E%AF%E5%A2%83%E4%B8%80%E6%AC%A1redis%E5%AF%BC%E8%87%B4oom-killer%E7%9A%84%E9%97%AE%E9%A2%98/)
- [Redis的持久化之AOF](https://my.oschina.net/happyBKs/blog/1579757)
