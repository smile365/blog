---
title:  CDH-kafka创建主题
heading: 基于cdh安装的kafka集群如何在Cloudera Manager管理界面创建主题topic
date: 2020-06-03T03:00:16.652Z
categories: ["code"]
tags: ["Cloudera Manager","kafka","topic"]
description: 大数据平台相关 kafka 工具的使用教程
---

目前官网cdh最新版为：Cloudera Manager 7.1.1，不知道是否提供创建kafka主题的便捷操作界面。

我用的版本为：CDH 6.2.0，打开网页端：`http://localhost:7180/`的管理界面，并没有找到创建主题的按钮或者工具，只能通过命令创建。以下是通过命令创建topic的方法，非常简单。

通过cdh找到kafka集群

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1591154106521.png)

打开实例，找到主机，选择任何一个节点然后ssh到服务器。
```bash
ssh name@yourserver
# 看是把kafka-topics的命令增加到了环境变量
which kafka-topics
# 如果没有则找以下命令执行脚本在哪里
sudo find / -name "kafka-topics"
# 然后创建主题
kafka-topics --create --zookeeper server01:2181/kafka --replication-factor 1 --partitions 20 --topic test_data  
```

创建一个名为`test_data`的主题，副本1份，分区20个。

--zookeeper参数怎么来呢

依次在cdh管理界面打开“集群--kafka--配置”，可以看到`/kafka`。

![zookeeper-kafka](https://gitee.com/smile365/blogimg/raw/master/sxy91/1591154539132.png)

点击“集群--ZooKeeper--实例”，可以看到主机`server01`，然后点击“配置--端口和地址”，可以看到端口`2181`

如果有多个ZooKeeper节点，填写一个就行，填写多个可以如下填写
```bash
kafka-topics --create --zookeeper server02:2181,server06:2181,server01:2181/kafka --replication-factor 1 --partitions 20 --topic test_data 
```

创建成功后可以通过cdh查看主题列表

![kafka-topics](https://gitee.com/smile365/blogimg/raw/master/sxy91/1591162014832.png)

或者通过命令行查看
```bash
kafka-topics --list --zookeeper server02:2181
```

参考文献：
- [kafka快速安装与配置部署教程](https://www.sxy91.com/posts/kafka/)