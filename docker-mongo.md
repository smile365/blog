---
title:  docker-mongo
date: 2018-11-02T07:16:11.158Z
tags: ["docker","mongo"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

docker run —name rds -d redis

mkdir -p ~/mongo/data
chcon -Rt svirt_sandbox_file_t ~/mongo
docker run -p 47017:27017 --name daxindb -v /home/daxin/mongo/:/data/db -d mongo:3.4 --replSet "rs0"


官方文档：
https://docs.docker.com/samples/library/mongo/#mongoversion

参考：http://www.runoob.com/docker/docker-install-mongodb.html