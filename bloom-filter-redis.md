---
title:  bloom-filter-redis
date: 2019-08-06T07:12:55.203Z
tags: 
categories:
draft: true
description: 
---

config方式
MODULE LOAD /opt/redismodules/redisbloom.so

命令方式
redis-server --loadmodule /opt/redismodules/redisbloom.so

参考  

- [ReBloom](https://oss.redislabs.com/redisbloom/Quick_Start/)
- [redisbloom-py](https://github.com/RedisBloom/redisbloom-py)
- [Redis的BloomFilter](https://redislabs.com/blog/rebloom-bloom-filter-datatype-redis/)
- [redis-module](https://segmentfault.com/a/1190000015976157)
- [redis-modules-hub](https://redislabs.com/community/redis-modules-hub/)