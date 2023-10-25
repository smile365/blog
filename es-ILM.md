---
title:  es-ILM 
heading:  
date: 2023-02-03T09:02:37.492Z
tags: 
categories: ["code"]
Description:  index lifecycle management (ILM)
---

## 前言


index lifecycle management (ILM)，功能可已实现。

## 安装 es 和 kibana

参考官网使用 [docker 安装 es 和 kibana](https://www.elastic.co/guide/en/kibana/current/docker.html)

```yaml
version: '3'  
services:  
  elasticsearch:  
    image: docker.elastic.co/elasticsearch/elasticsearch:8.10.4 
    ports:  
      - "9200:9200"  
    environment:  
      - ELASTICSEARCH_HOST=0.0.0.0  
      - ELASTICSEARCH_PORT=9200
  kibana:  
    image: docker.elastic.co/kibana/kibana:8.10.4
    ports:
      - "5601:5601"  
    environment:  
      - ELASTICSEARCH_HOST=elasticsearch  
      - ELASTICSEARCH_PORT=9200  
    depends_on:  
      - elasticsearch  
```

先 [create-enrollment-token](https://www.elastic.co/guide/en/elasticsearch/reference/current/create-enrollment-token.html) 然后配置 kibana

```
docker compose exec -it bin/elasticsearch-create-enrollment-token -s kibana --url "https://172.0.0.3:9200"

# 把生成的 token 填入 kibana 网站
docker compose logs kibana -f
# Your verification code is:  830 810 

# 自动生成密码
docker compose exec -it elasticsearch bin/elasticsearch-reset-password -u elastic
# 用此密码登录 kibana
```

## 验证 ILM

1. 创建索引策略
参考 [创建索引策略](https://juejin.cn/post/7170097149491806222#heading-3) ，使用 kibana 创建索引策略。



2. 创建索引模版







## 参考
- [Elasticsearch索引生命周期管理](https://juejin.cn/post/7170097149491806222)