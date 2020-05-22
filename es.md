---
title:  es
heading:
date: 2020-05-22T13:47:16.917Z
categories: ["code"]
tags: 
description: 
---

数据格式如下:
```json
{"keywords":["以上","乖乖","注意","下酒菜"],"date":"2019-05-29 13","mood":2,"comment":1,"category":4,"source1":"overseas","source2":"facebook"}
```
字段说明
- keywords：文章的所有关键词
- date：新闻的日期，年月日 时
- mood：情绪
- comment：评价
- category：分类
- source1：一级分类
- source2：二级分类

#### 情绪趋势
统计5月份关键词包含`视频`**和**`直播`每天的情绪变化：
```json
{"size":0,"query":{"bool":{"filter":[{"term":{"keywords":"直播"}},{"term":{"keywords":"视频"}},{"range":{"date":{"gte":"2020-05-01","lte":"2020-05-22","format":"yyyy-MM-dd"}}}]}},"aggs":{"bykey":{"date_histogram":{"field":"date","calendar_interval":"day","format":"yyyy-MM-dd"},"aggs":{"NAME":{"terms":{"field":"mood"}}}}}}
```

#### 态势分析

统计5月份不同来源每天包含`视频`**或**`直播`的新闻数量：
```json
{"size":0,"query":{"bool":{"filter":[{"terms":{"keywords":["视频","直播"]}},{"range":{"date":{"gte":"2020-05-01","lte":"2020-06-01","format":"yyyy-MM-dd"}}}]}},"aggs":{"bykey":{"date_histogram":{"field":"date","calendar_interval":"day","format":"yyyy-MM-dd"},"aggs":{"bysource1":{"terms":{"field":"source1"}}}}}}
```

#### 评价分析

统计5月份关键词包含`视频`**和**`直播`的每天不同评价的新闻数量：

```json
{"size":0,"query":{"bool":{"filter":[{"terms":{"keywords":["视频","直播"]}},{"range":{"date":{"gte":"2020-05-01","lte":"2020-06-01","format":"yyyy-MM-dd"}}}]}},"aggs":{"bykey":{"date_histogram":{"field":"date","calendar_interval":"day","format":"yyyy-MM-dd"},"aggs":{"bysource1":{"terms":{"field":"comment"}}}}}}
```

#### 类别分析
统计5月份关键词包含`视频`**和**`直播`的不同类别的新闻数量占比：

{"size":0,"query":{"bool":{"filter":[{"term":{"keywords":"直播"}},{"term":{"keywords":"视频"}},{"range":{"date":{"gte":"2020-05-01","lte":"2020-06-01","format":"yyyy-MM-dd"}}}]}},"aggs":{"NAME":{"terms":{"field":"category"}}}}

