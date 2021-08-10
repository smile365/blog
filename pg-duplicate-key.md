---
title:  pg-duplicate-key
heading: pg 遇到唯一性约束错误如何解决
date: 2021-08-10T03:17:37.435Z
categories: ["other"]
tags: 
description: 
---

报错信息
```
duplicate key value violates unique constraint "IDX_3bd1c1761646a6ec2a23c1bc11"
```

如何查是哪个表，建立的什么索引

```sql
select * from pg_indexes
WHERE indexname = 'IDX_3bd1c1761646a6ec2a23c1bc11';
```

结果如下
```sql
CREATE UNIQUE INDEX "IDX_3bd1c1761646a6ec2a23c1bc11" ON public.users USING btree (appid, openid, user_id)
```


