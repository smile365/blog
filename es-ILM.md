---
title: "es-ILM 按条件自动删除或归档 es 中的索引"
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

也可以使用 api 创建索引策略 `PUT _ilm/policy/my_policy`
```json
{
  "policy": {
    "phases": {
      "hot": {
        "min_age": "0ms",
        "actions": {
          "rollover": {
            "max_age": "1m"
          },
          "set_priority": {
            "priority": 100
          }
        }
      },
      "warm": {
        "min_age": "3m",
        "actions": {
          "set_priority": {
            "priority": 50
          }
        }
      },
      "cold": {
        "min_age": "6m",
        "actions": {
          "set_priority": {
            "priority": 0
          }
        }
      },
      "delete": {
        "min_age": "9m",
        "actions": {
          "delete": {
            "delete_searchable_snapshot": true
          }
        }
      }
    }
  }
}
```


2. 创建索引模版

![](https://cdn.sxy21.cn/static/imgs/1698221835453.png)
或者使用 api `PUT _index_template/my_template`
```json
{
  "index_patterns": ["my-*"],
  "template":{
     "settings": {
      "number_of_shards": 3,
      "number_of_replicas": 0,
      "index.lifecycle.name": "my_policy",    
      "index.lifecycle.rollover_alias": "myindex" ,    "index.routing.allocation.require.node_type":"hot"
    }
  }
}
```

3. 创建索引并设置别名 `PUT /my-index/`

```json
{
  "settings": {
    "number_of_shards": 3,
    "number_of_replicas": 0
  },
  "aliases": {
    "myindex": {}
  }
}
```


4. 创建测试数据 `POST /myindex/_doc`
```json
{
  "id":"id-001",
  "content":"ilm alias insert content"
}
```



## 参考
- [Elasticsearch索引生命周期管理](https://juejin.cn/post/7170097149491806222)
- [Elasticsearch集群健康状态显示为yellow排查](https://www.cnblogs.com/charles101/p/14488609.html)
- 