---
title:  es修改mapping字段类型
heading: elasticsearch修改mapping类型
date: 2020-05-13T08:21:39.713Z
categories: ["code"]
tags: ["es修改mapping字段类型","es修改映射","es修改索引字段属性"]
description: Elasticsearch 修改索引名,elasticsearch 修改 mapping 类型,elasticsearch change mapping type,es mapping field type 修改方法。
---


es首次创建设置mapping请参考教程[elasticsearch简单入门教程](https://sxy91.com/posts/elasticsearch)


上篇文章创建mapping时忘了给source1、source2字段设置type，数据入es时它自动给设置成了text类型。

es不支持对已有数据的字段修改type，只能通过重新创建一个新的index，然后把旧index的数据拷贝过来。



以下是Es修改mapping字段的间接方法。

先创建一个新的index
```json
PUT /wd-analytics-v2
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
```


然后把原来指向v1的alis改成指向v2,
```json
POST /_aliases
{  
    "actions": [  
        { "remove": {  
            "alias": "wd-analytics",  
            "index": "wd-analytics-v1"  
        }},  
        { "add": {  
            "alias": "wd-analytics",  
            "index": "wd-analytics-v2"  
        }}  
    ]  
}  
```

然后把旧的数据重新复制到新的索引上，数据量大的话记得加上wait_for_completion=false参数。
```json
POST _reindex?wait_for_completion=false
{
  "source": {
    "index": "wd-analytics"
  },
  "dest": {
    "index": "wd-analytics1"
  }
}
```


最后在es里删除旧的索引
```
DELETE /wd-analytics-v1
```
