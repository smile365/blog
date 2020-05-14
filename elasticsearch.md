---
title:  elasticsearch简单入门教程
heading:
date: 2020-05-09T06:42:21.580Z
categories: ["code"]
tags: 
description: 
---


按照官方文档在centos安装完[elasticsearch7](https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html)之后.

两个常用python客户端： 
- [elasticsearch-py](https://elasticsearch-py.readthedocs.io/en/master/index.html)，Elasticsearch的官方最原始客户端，方便扩展。对于入库推荐使用此模块下的[批处理](https://elasticsearch-py.readthedocs.io/en/master/helpers.html)来批量入库。
- [elasticsearch-dsl](https://elasticsearch-dsl.readthedocs.io/en/latest/index.html)，Elasticsearch DSL是一个封装程度更高的库。`elasticsearch-py`用来dict来检索数据，写出来非常冗余不易修改且容易写错。`elasticsearch-dsl`定义了映射，检索和保存文档等类，将文档数据包装在用户定义的类中，写起来容易理解且代码量很少。比较合适用来检索分析聚合等方面。



Elasticsearch 基本介绍及其与 Python 的对接实现

elasticsearch python create index mapping


[创建索引](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-create-index.html#indices-create-api-example)

[定义mapping](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping.html#create-mapping)

[日期格式定义](https://www.elastic.co/guide/en/elasticsearch/reference/current/date.html)

设置[分片和副本](https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-create-index.html)。

[字段数据类型](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-types.html)



创建索引前要考虑好各个字段的类型，创建后不支持修改，但可以新增字段。使用kibana的控制台创建索引如下： 
```json
# 创建索引
PUT /wd-analytics-v1
{
	"settings" : {
        "index" : {
            "number_of_shards": 5, 
            "number_of_replicas" : 2 
        }
    },
    "mappings" : {
        "properties" : {
            "date": {
		        "type":   "date",
		        "format": "yyyy-MM-dd HH"
		    },
		    "source1": {"type":  "keyword"},
		    "source2": {"type":  "keyword"},
		    "keywords": {"type":  "keyword"},
		    "mood":{"type":"short"},
		    "comment":{"type":"short"},
		    "category":{"type":"short"}
        }
    }
}

# 创建一个别名
POST /_aliases
{
    "actions" : [
        { "add" : { "index" : "wd-analytics-v1", "alias" : "wd-analytics" } }
    ]
}

# 查看创建索引的信息
GET /wd-analytics/
```


插入测试数据
```json
# 插入
PUT /wd-analytics/_doc/test1
{
	"source1":"wechat",
	"source2":"wechat",
	"keywords":["疫情","武汉"],
	"date":"2020-05-09 07",
	"mood":5,
	"comment":3,
	"category":5
}

#更新数据
POST test/_update/1
{
    "script" : "ctx._source.source1 = 'weibo'"
}

# 获取
GET /wd-analytics/_doc/test1
# 统计总文档数
GET /wd-analytics/_count
# 搜索
GET /wd-analytics/_search
```

使用python客户端获取

```python
# pip install elasticsearch
from elasticsearch import Elasticsearch
es = Elasticsearch(hosts=['192.168.1.3:9200','192.168.1.4:9200'])
res = es.get(index="wd-analytics", id="test1")
print(res)
```

出现错误： 
```python
raise HTTP_EXCEPTIONS.get(status_code, TransportError)(
elasticsearch.exceptions.AuthenticationException: AuthenticationException(401, 'security_exception', 'missing authentication credentials for REST request [/_bulk]')
```

因为没有登录授权，使用如下连接方式:
```python
es = Elasticsearch(hosts=['username:password@192.168.1.3:9200','username:password@192.168.1.4:9200'])
```


聚合统计
统计新闻资讯中每个小时的新闻数量，关键词需同时包含`疫情`和`武汉`，时间范围需从2020-04-22 0点到2020-05-22 0点，聚合后的结果按照时间升序排序。

```json
POST /wd-analytics/_search
{
  "size": 0,
  "query": {
    "bool": {
      "filter": [
        {
          "range": {
            "date": {
              "gt": "2020-04-22 00",
              "lt": "2020-05-22 00"
            }
          }
        },
        {
          "terms": {
            "keywords" : ["疫情","武汉"]
          }
        }
      ]
    }
  },
  "aggs": {
    "count_by_date": {
      "terms": {
        "field": "date",
        "order": {
          "_key": "asc"
        },
        "size":1000
      }
    }
  }
}
```


上面的查询语句改成用elasticsearch-dsl的python客户端聚合如下  
```python
s = Search(using=client, index="wd-analytics").extra(size=0)\
	.filter('range', date={'gt': '2020-04-22 00', 'lt' : '2020-05-22 00'})\
	.filter("terms", keywords=["疫情","武汉"])

s.aggs.bucket('count_by_date','terms',field='date',order={'_key': 'asc'},size=1000)
```