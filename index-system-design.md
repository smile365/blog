---
title:  指数产品数据建模
heading: 
date: 2020-03-12T01:46:28.623Z
categories: ["code"]
draft: true
tags: 
description: 
---

提供一级分类、二级分类、三级分类的对应关系
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1583980256508.png)

这里看到的与页面不一致
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1583980312641.png)

最好是sql数据或者redis。


关键词、时间、数据源（27个）、评价（3个）、类别（5个）。
评价（积极、中级、消极）
类别（社会时政、健康医疗、投资理财、健康养生、娱乐明星）

influxdb

时间、tag(关键词/数据源一级分类/数据源二级分类/评价/类别) values（新闻数量、词权重）

time,tags(word/source1/source2/mood/category),values(amount,rank)

select time,word,source1,sum(amount),sum(rank) from table_1h where word = 'a' and time > now() - -8h group by word,source1;

保留策略
非聚合的，保留24h，默认。表：wordcount
聚合成按小时，保留24小时。表：wordcount_1h
聚合成按天的，保留365天。表：wordcount_1d


即三个MEASUREMENTS，两个保留策略。
```sql
create database "indexsystem";
use "indexsystem";
CREATE RETENTION POLICY "rp24h" ON "indexsystem" DURATION 1w REPLICATION 1 DEFAULT;
CREATE RETENTION POLICY "rp365d" ON "indexsystem" DURATION 365d REPLICATION 1

-- 连续查询（CQ）聚合1小时的数据,使用默认RP
CREATE CONTINUOUS QUERY "cq_wordcount_1h" ON "indexsystem"
BEGIN
  SELECT sum(*) INTO "wordcount_1h" FROM "wordcount" GROUP BY *,time(1h) tz('Asia/Shanghai')
END

-- CQ连续查询 聚合1天的数据，使用名为rp365d的RP
CREATE CONTINUOUS QUERY "cq_wordcount_1d" ON "indexsystem"
BEGIN
  SELECT sum(*) INTO "rp365d"."wordcount_1d" FROM "wordcount_1h" GROUP BY *,time(1d) tz('Asia/Shanghai')
END

-- 查看连续查询
SHOW CONTINUOUS QUERIES
```

**1、解决词库动态添加/减少的问题**

table:words

词库使用：[清华大学开放中文词库](http://thuocl.thunlp.org/sendMessage)、[github-中文分词词库整理](https://github.com/fighting41love/funNLP)

使用数据库pg保存关键词列表，可以动态添加/删除(非物理删除)。【id、关键词、词频、词性、是否删除、添加日期、删除日期】，id从1开始自增，关键词建立索引，唯一。

后台提供web管理界面，有变化时，往key:words添加变化。一个定时任务，定期检测并同步变化。

key:words
使用redis保存一个list关键词，位置就是关键词的id，使用,号分隔关键词、词频、词性。value格式：[+-,]word,freq,tag。

初始时结巴分词直接从key:words添加词库，初始化接触保存总量。运行时检查总量是否变化,若变化，从初始化结束的位置开始动态改变。

**2、解决动态分类问题**

使用hashmap保存多级分类。

key: interface
field：三级
value：二级,一级

可使用pg保存一份数据，方便管理，增删改查。

**3、解决词频问题**

每搜索一次进行增加一次词频，不直接改变redis，等定时任务再改。

