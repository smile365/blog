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

