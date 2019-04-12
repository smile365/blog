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
安装后建议关闭rdb开启aof。


**redis优化**关注点
- maxmemory 
- maxmemory-policy volatile-lru
- appendonly yes
- no-appendfsync-on-rewrite yes

需要深入了解这几项的工作原理，结合自己的业务需求进行配置。

>- rdb
进行bgszve会fork子进程，消耗大量内存，容易造成oom问题。
>- aof
aof重写也会消耗部分内存，需要配置相应策略。

我们的业务特点是redis的key数量比较均衡，丢失数据对业务影响不大，最重要的是保证redis稳定运行。因此redis的优化方案如下：
- 配置最大内存=机器内存的75%
- 关闭rdb，开启aof
- 如果还遇到oom问题，则关闭aof重写
- 如果磁盘io性能下降，则fsync策略使用no
- 对于redis只增不减的key迁移到mongo里

如果使用rdb方式，建议的优化方案如下
- 仅开启rdb
- 配置最大内存
- rdb错误不暂停服务
- 关闭bgsave的策略，改为使用脚步监测redis。
- 当redis或者系统内存空闲多的时候进行save。

备注：
如果redis在线上运行，更改配置尽可能使用命令更改，如：`redis-cli config set appendonly yes`


参考  
- [redis-cli config](https://www.zhihu.com/question/46220824)
- [RDB、AOF](https://www.jianshu.com/p/a91329ae210c)
- [save、Bgsave](http://www.runoob.com/redis/redis-backup.html)
- 
