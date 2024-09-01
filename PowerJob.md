---
title: ”PowerJob 分布式任务调度与计算框架“
heading:  
date: 2022-12-30T09:13:22.765Z
tags: 
categories: ["code"]
Description:  
---
## 环境
-PostgreSQL 14
- JDK 11
- Maven 
 

## idea 运行 PowerJob Server

pg 14 不需要配置方言 [PowerJobPGDialect](https://www.yuque.com/powerjob/guidence/problem#DYCZ9)，否则会出现 [SQL Error ERROR](https://github.com/PowerJob/PowerJob/issues/509) 错误


application-daily.properties 配置文件如下：
```properties
oms.env=DAILY
logging.config=classpath:logback-dev.xml

spring.datasource.core.driver-class-name=org.postgresql.Driver
spring.datasource.core.jdbc-url=jdbc:postgresql://127.0.0.1:30132/powerjob-daily
spring.datasource.core.username=postgres
spring.datasource.core.password=xxx
spring.datasource.core.hikari.maximum-pool-size=20
spring.datasource.core.hikari.minimum-idle=5


oms.instanceinfo.retention=1
oms.container.retention.local=1
oms.container.retention.remote=-1

oms.instance.metadata.cache.size=1024
oms.accurate.select.server.percentage = 50

```

## Docker 运行 PowerJob Server

```bash
docker run -d --restart=always \
       --name powerjob-server \
       -p 7700:7700 -p 10086:10086 \
       -e TZ="Asia/Shanghai" \
       -e JVMOPTIONS="" \
       -e PARAMS="--spring.profiles.active=product \
       --spring.datasource.core.driver-class-name=org.postgresql.Driver \
       --spring.datasource.core.jdbc-url=jdbc:postgresql://localhost:5432/powerjob-product \
       --spring.datasource.core.username=postgres \
       --spring.datasource.core.password=postgres" \
       tjqq/powerjob-server:latest
```

## docker-compose 运行 PowerJob

新建一个 `docker-compose.yml` 文件，内容如下：
```yml
version: '3'
services:
  powerjob-db:
    image: postgres
    environment:
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_USER=postgres
      - POSTGRES_DB=powerjob-product
    ports:
      - "5432:5432"

  powerjob-server:
    image: tjqq/powerjob-server:latest
    depends_on:
      - powerjob-db
    environment:
      PARAMS: "--oms.mongodb.enable=false
                --spring.datasource.core.driver-class-name=org.postgresql.Driver
                --spring.datasource.core.jdbc-url=jdbc:postgresql://powerjob-db:5432/powerjob-product
                --spring.datasource.core.username=postgres
                --spring.datasource.core.password=postgres"
    ports:
      - "7700:7700"
      - "10086:10086"
```

在配置文件所在目录运行 `docker-compose up -d`

## k8s 运行 powerjob
配置文件
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: powerjob-server
  namespace: powerjob-ns
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0
      maxSurge: 1
  replicas: 2
  selector:
    matchLabels:
      app.kubernetes.io/name: powerjob-server
      app.kubernetes.io/part-of: powerjob-server
  template:
    metadata:
      labels:
        app.kubernetes.io/name: powerjob-server
        app.kubernetes.io/part-of: powerjob-server
    spec:
      containers:
        - name: powerjob-server
          ports:
            - containerPort: 7700
              protocol: TCP
            - containerPort: 10086
              protocol: TCP
          image: tjqq/powerjob-server:latest
          imagePullPolicy: Always
          env:
            - name: PARAMS
              value: "--oms.mongodb.enable=false
                --spring.datasource.core.driver-class-name=org.postgresql.Driver
                --spring.datasource.core.jdbc-url=jdbc:postgresql://powerjob-db:5432/powerjob-product
                --spring.datasource.core.username=postgres
                --spring.datasource.core.password=postgres"
          resources:
            limits:
              cpu: 1000m
              memory: 2048Mi
            requests:
              cpu: 500m
              memory: 1024Mi
---
apiVersion: v1
kind: Service
metadata:
  name: powerjob-server
  namespace: powerjob-ns
  labels:
    app.kubernetes.io/name: powerjob-server
    app.kubernetes.io/part-of: powerjob-server
spec:
  type: NodePort
  selector:
    app.kubernetes.io/name: powerjob-server
    app.kubernetes.io/part-of: powerjob-server
  ports:
    - name: http
      port: 7700
      targetPort: 7700
      nodePort: 30177
    - name: akka
      port: 10086
      targetPort: 10086
      nodePort: 30186
```

## 参考文档
- [powerjob-使用 pg 出现的错误](https://github.com/PowerJob/PowerJob/issues/153#issuecomment-812771783)
