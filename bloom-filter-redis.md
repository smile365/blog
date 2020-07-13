---
title:  redis配置布隆过滤器bloom-filter-redis
date: 2019-08-06T07:12:55.203Z
tags: 
categories: ["code"]
draft: true
description: 
---



推荐阅读[Redis 高级主题之布隆过滤器(BloomFilter)](https://juejin.im/post/5cfd060ee51d4556f76e8067)

```bash

git clone https://github.com/RedisBloom/RedisBloom.git redisbloom
cd redisbloom
make
mkdir -p /opt/redismodules/
mv redisbloom.so /opt/redismodules/

# Assuming you have a redis build from the unstable branch:
redis-server --loadmodule /opt/redismodules/redisbloom.so

#查看默认配置 
awk -F: '/^[^#]/ {print}' /etc/redis.conf
```

`vim /etc/redis.conf`
```conf
loadmodule /opt/redismodules/redisbloom.so
```

`redis-cli`
```shell
MODULE LOAD /opt/redismodules/redisbloom.so
```


参考  

- [ReBloom](https://oss.redislabs.com/redisbloom/Quick_Start/)
- [redisbloom-py](https://github.com/RedisBloom/redisbloom-py)
- [Redis的BloomFilter](https://redislabs.com/blog/rebloom-bloom-filter-datatype-redis/)
- [redis-module](https://segmentfault.com/a/1190000015976157)
- [redis-modules-hub](https://redislabs.com/community/redis-modules-hub/)