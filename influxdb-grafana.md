---
title:  使用influxdb+grafana解决数据统计及99%的服务器监控报警问题
date: 2019-09-03T07:19:42.179Z
tags: 
categories:
draft: true
description: 
---

```sql
SELECT sum("sum_total") as "total" , sum("sum_repeat") as "repeat",  sum("sum_total") -  sum("sum_repeat")  as "unique"   FROM "sum_source_1h" where time > now() - 8d GROUP BY time(1d)  tz('Asia/Shanghai')
```

