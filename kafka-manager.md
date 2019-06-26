---
title:  kafka-manager安装
date: 2018-08-31T03:15:13.262Z
tags:
 - kafka
categories: 
 - code
description:
---

#### 先安装java8、scala、sbt
```shell
sudo yum install java-1.8.0-openjdk
sudo yum install java-1.8.0-openjdk-devel

wget https://downloads.lightbend.com/scala/2.12.2/scala-2.12.2.rpm
sudo yum localinstall -y scala-2.12.2.rpm

curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo
sudo yum install sbt
```

#### 配置sbt(scala-build-tools)的镜像:`vi ~/.sbt/repositories`
```nginxconf
[repositories]
  local
  aliyun: http://maven.aliyun.com/nexus/content/groups/public/
  central: http://repo1.maven.org/maven2/
```

#### 构建
```shell
git clone https://github.com/yahoo/kafka-manager.git
cd ./kafka-manager
sbt clean dist  

unzip target/universal/kafka-manager-1.3.3.8.zip  # unzip a.zpi /des/a

./bin/kafka-manager -Dkafka-manager.zkhosts="localhost:2181"  
```

#### 配置context的访问路径，方便nginx代理`vi conf/application.conf`
```ini
play.http.context = "/kafka/"

./bin/kafka-manager -Dkafka-manager.zkhosts="localhost:2181"

#http://localhost:9000/kafka

```

#### 添加Cluster
点击【Cluster】>【Add Cluster】：
输入集群的名字（如Kafka-Cluster-1）和 Zookeeper 服务器地址（如localhost:2181），点击save。

### 后台运行
```shell
nohup ./bin/kafka-manager -Dkafka-manager.zkhosts="localhost:2181" >/dev/null 2>&1 &

#输出日志：nohup ./bin/kafka-manager -Dkafka-manager.zkhosts="localhost:2181" 1>out.log 2>err.log &
```

参考

- [Kafka-Manager（fq）](https://medium.com/@FrissonAI/yahoos-kafka-manager-installation-82fdc4bd1222)
- [Kafka-manager安装](https://blog.csdn.net/yuan_xw/article/details/79188565)
- [Kafka三款监控工具比较](https://blog.csdn.net/xbs1019/article/details/54949324)
- [kafka-monitor vs kafka-manager](https://stackoverflow.com/questions/49276785/monitoring-ui-for-apache-kafka-kafka-manager-vs-kafka-monitor/49292872)