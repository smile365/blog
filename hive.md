---
title:  使用hive对hbase数据进行统计分析
date: 2019-09-09T08:34:33.270Z
tags: 
categories:
description: 
---


成功安装hive后输入`hive`进入命令行环境

查询时显示表的列名(默认为false)

```sql
hive> set hive.cli.print.header=true;
```

创建表  
```sql
CREATE EXTERNAL TABLE test_data (rowkey string, source string, id string,url string,pdate int,pid string,pname string)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,data:interface,data:id,data:url,data:publishDate,data:posterOriginId,data:posterScreenName")
TBLPROPERTIES ("hbase.table.name" = "test_data_hb", "hbase.mapred.output.outputtable" = "test_data)");
```

若提示:`ermission denied: user=root`,因为`hive` 是hdfs创建的，在hadoop里hdfs才是超级管理员。所以需要hdfs用户来执行hive命令：`sudo -su hdfs`.

把查询的结果放入另一临时表中

```sql
create table data_weixin as select * from test_data where source = "post/weixin";
```


参考  

- [hive-docs](https://cwiki.apache.org/confluence/display/Hive/GettingStarted#GettingStarted-CreatingHiveTables)
- [hive与hbase集成](https://cwiki.apache.org/confluence/display/Hive/HBaseIntegration)
- [Hive的数据类型](https://cwiki.apache.org/confluence/display/Hive/LanguageManual+Types)