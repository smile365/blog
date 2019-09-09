---
title:  使用hive对hbase数据进行统计分析
date: 2019-09-09T08:34:33.270Z
tags: 
categories:
draft: true
description: 
---


成功安装hive后输入`hive`进入命令行环境

查看表  
```sql
hive> show tables;
```

创建表  
```sql
CREATE EXTERNAL TABLE test_data (rowkey string, source string, id string,url string,pdate int,pid string,pname string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,data:interface,data:id,data:url,data:publishDate,data:posterOriginId,data:posterScreenName")
TBLPROPERTIES ("hbase.table.name" = "test_data_hb", "hbase.mapred.output.outputtable" = "test_data)");
```




参考  

- [hive-docs](https://cwiki.apache.org/confluence/display/Hive/GettingStarted#GettingStarted-CreatingHiveTables)
- [hive与hbase集成](https://cwiki.apache.org/confluence/display/Hive/HBaseIntegration)