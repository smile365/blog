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

> bin/zookeeper-server-start.sh -daemon config/zookeeper.properties

> bin/kafka-server-start.sh -daemon config/server.properties

> bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

> bin/kafka-topics.sh --list --zookeeper localhost:2181

> bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

> bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning

```
> 使用 -daemon 参数可以在后台运行，去掉后可调试运行`

查看group.id

```shell
cat config/consumer.properties |grep "group"
```


使用confluent-kafka-python测试消费者：`pip install confluent-kafka`

```python
#!/usr/bin/python
from confluent_kafka import Consumer, KafkaError,Producer
p = Producer({'bootstrap.servers': '192.168.31.174:9092'})
c = Consumer({
    'bootstrap.servers': '192.168.31.174:9092',
    'group.id': 'test-consumer-group'
})

def test_consumer():
    '''
    测试消费者
    :return:
    '''
    c.subscribe(['test'])
    for x in range(5):
        msg = c.poll(5) #超时5秒
        if msg is None:
            print('none')
            continue
        if msg.error():
            if msg.error().code() == KafkaError._PARTITION_EOF:
                continue
            else:
                print(msg.error())
                break
        print('Received message: {}'.format(msg.value().decode('utf-8')))
    c.close()


def delivery_report(err, msg):
    """ Called once for each message produced to indicate delivery result.
        Triggered by poll() or flush(). """
    if err is not None:
        print('Message delivery failed: {}'.format(err))
    else:
        print('Message delivered to {} [{}]'.format(msg.topic(), msg.partition()))

def test_send():
    '''
    测试生产者
    :return:
    '''
    test_url = ["http://localhost/"+str(x) for x in range(10)]
    for data in test_url:
        p.poll(1) #超时1秒
        p.produce('test', data.encode('utf-8'), callback=delivery_report)
    p.flush()

if __name__ == '__main__':
    test_send()
    test_consumer()

```

kafka出现`nodename nor servname provided, or not known`的解决

原因：kafka的brokers会通过配置advertised.listeners广播自己，client端需要能解析这个地址。

方法1：在client端增加一条host记录

方法2：修改`config/server.properties`中的值为服务器端的ip`advertised.listeners=PLAINTEXT://192.168.31.174:9092`

查看最新的offset
```
bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic test --time -1
```


**参考**

- [kafka](https://kafka.apache.org/quickstart)
- [kafka中文教程](http://orchome.com/kafka/index)
- [install-kafka](https://www.mtyun.com/library/how-to-install-kafka-on-centos7)
- [安装kafka](https://segmentfault.com/a/1190000012730949)
- [kafka-python](https://github.com/confluentinc/confluent-kafka-python)
- [kafka-error](https://stackoverflow.com/questions/28184194/kafka-consumer-error-xxxx-nodename-nor-servname-provided-or-not-known)
- [kafka-failed](https://stackoverflow.com/questions/43103167/failed-to-resolve-kafka9092-name-or-service-not-known-docker-php-rdkafka)
- [Advertised.Listeners](https://www.jianshu.com/p/71b295e1df4f)
- [如何确定Kafka的分区数](https://www.cnblogs.com/huxi2b/p/4757098.html)
- [重新分配partition](http://wzktravel.github.io/2015/12/31/kafka-reassign/)