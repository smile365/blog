---
title:  centos安装kafka
date: 2018-08-08T09:56:42.699Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

安装java
```shell
java -version

su -c "yum install java-1.8.0-openjdk"
```

[去镜像站下载kafka](https://www.apache.org/dyn/closer.cgi?path=/kafka/2.0.0/kafka_2.11-2.0.0.tgz)

```shell
wget http://mirrors.hust.edu.cn/apache/kafka/2.0.0/kafka_2.11-2.0.0.tgz

bin/zookeeper-server-start.sh config/zookeeper.properties
```



参考
- [kafka](https://kafka.apache.org/quickstart)
- [kafka中文教程](http://orchome.com/kafka/index)
- [install-kafka](https://www.mtyun.com/library/how-to-install-kafka-on-centos7)
- [安装kafka](https://segmentfault.com/a/1190000012730949)
- [Confluent-platform](https://my.oschina.net/guol/blog/822980)
- [kafka-python](https://github.com/confluentinc/confluent-kafka-python)
- 