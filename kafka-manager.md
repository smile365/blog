---
title:  kafka-manager安装
date: 2018-08-31T03:15:13.262Z
tags: ["kafka"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

先安装java8、scala、sbt
```shell
sudo yum install java-1.8.0-openjdk
sudo yum install java-1.8.0-openjdk-devel

wget https://downloads.lightbend.com/scala/2.12.2/scala-2.12.2.rpm
sudo yum localinstall -y scala-2.12.2.rpm


curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo
sudo yum install sbt
```

配置sbt(scala-build-tools)的镜像`vi ~/.sbt/repositories`
```nginxconf
[repositories]
  local
  aliyun: http://maven.aliyun.com/nexus/content/groups/public/
  central: http://repo1.maven.org/maven2/
```

构建
```
git clone https://github.com/yahoo/kafka-manager.git
cd ./kafka-manager
sbt clean dist  

unzip target/universal/kafka-manager-1.3.3.8.zip  # unzip a.zpi /des/a

./bin/kafka-manager -Dkafka-manager.zkhosts="localhost:2181"  
view raw

```

参考

- [](https://medium.com/@FrissonAI/yahoos-kafka-manager-installation-82fdc4bd1222)