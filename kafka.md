---
title:  centos安装kafka
date: 2018-08-08T09:56:42.699Z
tags: ["kafka"]
series: ["blog"]
categories: ["code"]
description:
---

安装java
```shell
java -version

su -c "yum install java-1.8.0-openjdk"
```

[去镜像站下载kafka](https://www.apache.org/dyn/closer.cgi?path=/kafka/2.0.0/kafka_2.11-2.0.0.tgz)

```shell
> wget http://mirrors.hust.edu.cn/apache/kafka/2.0.0/kafka_2.11-2.0.0.tgz

> tar -xzf kafka_2.11-2.0.0.tgz
> cd kafka_2.11-2.0.0

> bin/zookeeper-server-start.sh config/zookeeper.properties

> bin/kafka-server-start.sh config/server.properties

> bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

> bin/kafka-topics.sh --list --zookeeper localhost:2181

> bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

> bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

```
> 使用 -daemon 参数可以在后台运行，如：`zookeeper-server-start.sh -daemon zookeeper.properties`

查看group.id

```shell
cat config/consumer.properties |grep "group"
```


使用confluent-kafka-python测试消费者
```python
#!/usr/bin/python
from confluent_kafka import Consumer, KafkaError

c = Consumer({
    'bootstrap.servers': '192.168.31.193 :9092',
    'group.id': 'test-consumer-group'
})

c.subscribe(['test'])

while True:
    msg = c.poll(1.0)
    if msg is None:
        continue
    if msg.error():
        if msg.error().code() == KafkaError._PARTITION_EOF:
            continue
        else:
            print(msg.error())
            break
    print('Received message: {}'.format(msg.value().decode('utf-8')))

c.close()


```


**参考**

- [kafka](https://kafka.apache.org/quickstart)
- [kafka中文教程](http://orchome.com/kafka/index)
- [install-kafka](https://www.mtyun.com/library/how-to-install-kafka-on-centos7)
- [安装kafka](https://segmentfault.com/a/1190000012730949)
- [kafka-python](https://github.com/confluentinc/confluent-kafka-python)
- [kafka-error](https://stackoverflow.com/questions/28184194/kafka-consumer-error-xxxx-nodename-nor-servname-provided-or-not-known)