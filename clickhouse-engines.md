---
title:  clickhouse-engines
heading:
date: 2020-05-26T07:47:50.130Z
categories: ["code"]
tags: 
description: 
---

clickhouse最重要的部分大概是表格引擎，选择合适的引擎可以达到意想不到的效果。在上次教程中使用了`SummingMergeTree`这个引擎，主要用来归档，求和。可以把多条数据，求和后只保存一条数据。占用空间小，且计算快。适用场景类似于时许数据库，把一段时间内的数据求和后存储。


上次`SummingMergeTree`实现了一个类似百度指数的功能，这次把要求改变一下，要求对多个关键词计算。比如：最近8小时同时谈到`视频`和`直播`的文章数量有多少。


创建表并使用`MergeTree`引擎,`keywords`为String数组，保存新闻分词后的所有关键词，数据根据`dtime`按天分区。

```sql
CREATE TABLE indexsysdb.analytics \
(keywords Array(String),\
dtime DateTime('Asia/Shanghai'),\
source1 String,\
source2 String,\
mood Int8,\
category Int8,\
comment Int8)\
ENGINE = MergeTree() \
PARTITION BY toYYYYMMDD(dtime) \
ORDER BY (dtime,keywords,source1,source2,mood,category,comment);
```



