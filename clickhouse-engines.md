---
title:  clickhouse-engines
heading: clickhouse中文教程
date: 2020-05-26T07:47:50.130Z
categories: ["code"]
tags: ["clickhouse中文教程"]
description: clickhouse 中文 教程
---

clickhouse最重要的部分大概是表格引擎，选择合适的引擎可以达到意想不到的效果。在上篇的[clickhouse入门教程](https://www.sxy91.com/posts/clickhouse/)中使用了`SummingMergeTree`这个引擎，主要用来归档，求和。可以把多条数据，求和后只保存一条数据。占用空间小，且计算快。适用场景类似于时许数据库，把一段时间内的数据求和后存储。


上次`SummingMergeTree`实现了一个类似百度指数的功能，这次把要求改变一下，要求对多个关键词计算。比如：最近8小时同时谈到`视频`和`直播`的文章数量有多少。


创建表并使用`MergeTree`引擎,`keywords`为String数组，保存新闻分词后的所有关键词，数据根据`dtime`按天分区。最后三个字段分别为情绪、分类、评价。

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

插入测试数据
```sql
insert into analytics(keywords,dtime,source1,source2,mood,category,comment) values (['宋洋葱','clickhouse'],'2020-03-30 10:00:00','video','youtube',1,1,1);
```


clickhouse错误代码
- **243**：Cannot reserve 1.00 MiB，服务器磁盘空间不足，迁移存储路径
- **62**：一般为sql写错

数据迁移
```bash
#创建目录
mkdir -p /mnt/data2/chdata
#停止clickhouse
systemctl stop clickhouse-server
systemctl status clickhouse-server
# 迁移数据文件
mv /var/lib/clickhouse/* /mnt/data2/chdata/
# 修改配置文件
vim /etc/clickhouse-server/config.xml
# path --> /mnt/data2/chdata
# tmp_path --> /mnt/data2/chdata/tmp
# user_files_path
# format_schema_path
# 建议修改logger节点，把日志放到其他目录
# 重启
systemctl start clickhouse-server
systemctl status clickhouse-server
```

日志

```bash
tail -f /var/log/clickhouse-server/clickhouse-server.log
tail -f /var/log/clickhouse-server/clickhouse-server.err.log
```

若遇到Access to file denied，需要给权限：`chown clickhouse:clickhouse /mnt/data2/chdata`

若看不到日志可直接使用`service clickhouse-server start`启动。

聚合查询语句
```sql
--- 按月统计数据量
select toYYYYMM(dtime) as date,count(date) as num from analytics group by date;
--- 统计5月份每天的数据量
select toYYYYMMDD(dtime) as date,count(date) as num from analytics where dtime >= '2020-05-01 00:00:00' and dtime < '2020-06-01 00:00:00'  group by date order by date;

```

