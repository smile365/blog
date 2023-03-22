---
title: Kafka Streams
heading:  
date: 2023-03-22T06:46:41.235Z
categories: ["code"]
tags: 
description:  
---

## 环境
- kafka
- Java
- maven

用 docker-compose.yml 启动一个测试的 kafka
```yaml
version: "3"
services:
  zookeeper:
    image: 'bitnami/zookeeper'
    ports:
      - '2181:2181'
    environment:
      - ALLOW_ANONYMOUS_LOGIN=yes

  kafka:
    image: 'bitnami/kafka'
    ports:
      - '9092:9092'
    environment:
      - KAFKA_BROKER_ID=1
      - KAFKA_CFG_LISTENERS=PLAINTEXT://:9092
      - KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181
      - ALLOW_PLAINTEXT_LISTENER=yes
      - KAFKA_CFG_LOG_RETENTION_HOURS=2
    depends_on:
      - zookeeper

```


创建一个 srping boot 项目，pom.xml 配置依赖
```xml
	<dependency>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-web</artifactId>
	</dependency>
	<dependency>
		<groupId>org.apache.kafka</groupId>
		<artifactId>kafka-streams</artifactId>
	</dependency>
	<dependency>
		<groupId>org.springframework.kafka</groupId>
		<artifactId>spring-kafka</artifactId>
	</dependency>
```

在 application.yml 配置 kafka 信息：
```yml
spring:
  kafka:
    streams:
      bootstrap-servers: 192.168.0.143:9092
      application-id: first_streams_app_id

```

场景举例：
- 主题为 input.words 接收一个或多个单词输入
- 监听input.words ，当输入的单词总长度大于  5，则把单词全部大写，然后输出到 output.words

代码如下：
```java
@Slf4j
@Component
@EnableKafkaStreams
public class KfkStreamDemo1 {
    private final static String SOURCE_TOPIC = "input.words";
    private final static String TARTGET_TOPIC = "output.words";

    @Bean
    public KStream<String,String> KStream(StreamsBuilder streamsBuilder){
        KStream<String,String> stream = streamsBuilder.stream(SOURCE_TOPIC,Consumed.with(Serdes.String(),Serdes.String()));

        stream.peek((k,v) -> log.info("pre v={}",v), Named.as("pre-transform-peek"))
            .filter((k,v) -> v!=null && v.length()>5, Named.as("fillter-processor"))
            .mapValues((k,v) -> v.toUpperCase(), Named.as("map-processor"))
            .peek((k,v) -> log.info("post v={}",v),Named.as("post-transform-peek"))
            .to(TARTGET_TOPIC, Produced.with(Serdes.String(),Serdes.String()));
        return stream;
    }
}
```

在控制台启动一个生产者：
```bash
docker exec -it kfk-kafka-1 /opt/bitnami/kafka/bin/kafka-console-producer.sh --bootstrap-server 127.0.0.1:9092 --topic input.words

# 输入单词测试
hello 
song yang cong
```


## 参考文档
- [Kafka Streams ](https://www.cnblogs.com/edisonchou/p/kafka_study_notes_part7.html)
- [Spring Boot 集成 Kafka Stream](https://juejin.cn/post/6936058742052126734)
- [Kafka Stream实时统计](https://www.51cto.com/article/678168.html)
- 





