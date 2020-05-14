---
title:  es修改mapping字段类型
heading: elasticsearch修改mapping类型
date: 2020-05-13T08:21:39.713Z
categories: ["code"]
tags: ["es修改mapping字段类型","es修改映射","es修改索引字段属性"]
description: Elasticsearch 修改索引名,elasticsearch 修改 mapping 类型,elasticsearch change mapping type,es mapping field type 修改方法。
---


es首次创建设置mapping请参考教程[](https://sxy91.com/posts/elasticsearch)


Es 修改 mapping 字段

es mapping field type 修改方法教程


es删除索引

ES update mapping

Elasticsearch index 设置



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



es修改mapping字段类型		es为什么不能修改索引		es首次创建设置mapping
es修改映射		es创建mapping		查看es索引的mapping
elasticsearch修改mapping		es修改索引字段属性		es删除mapping