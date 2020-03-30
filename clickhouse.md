---
title:  clickhouse教程
heading: 
date: 2020-03-12T03:06:50.536Z
categories: ["code"]
tags: 
description: 
---

`CentOS 7`换成[清华的镜像](https://mirrors.tuna.tsinghua.edu.cn/help/centos/)或者[阿里云的镜像](https://developer.aliyun.com/mirror/centos?spm=a2c6h.13651102.0.0.3e221b11XBR0VU)

```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
yum makecache
```

> 若出现`Couldn't resolve host 'mirrors.cloud.aliyuncs.com'`、`Could not resolve host: mirrors.aliyun.com; 未知的错误`、`Could not resolve host: mirrors.tuna.tsinghua.edu.cn; 未知的错误`等，运行`echo "nameserver 8.8.8.8" >> /etc/resolv.conf` 即可。


安装[clickhouse](https://clickhouse.tech/#quick-start)
```bash
yum install -y yum-utils
rpm --import https://repo.yandex.ru/clickhouse/CLICKHOUSE-KEY.GPG
yum-config-manager --add-repo https://repo.yandex.ru/clickhouse/rpm/stable/x86_64
yum install -y clickhouse-server clickhouse-client
systemctl start clickhouse-server
clickhouse-client
```


创建数据库和表  
```sql
CREATE DATABASE IF NOT EXISTS indexsysdb;

CREATE TABLE indexsysdb.keyword1h
(`keyword` String,
`dtime` DateTime('Asia/Shanghai'),
`source1` String,
`source2` String,
`mood` Int8,
`category` Int8,
`amount` UInt64)
ENGINE = SummingMergeTree(amount)
PARTITION BY toYYYYMM(dtime)
ORDER BY (dtime, keyword, source1, source2,mood,category)
```

下面来解释下[各关键字](https://clickhouse.tech/docs/en/operations/table_engines/mergetree/)的意思：

- ENGINE：[表引擎](https://clickhouse.tech/docs/en/operations/table_engines/)
- PARTITION BY：[分区规则](https://clickhouse.tech/docs/zh/operations/table_engines/custom_partitioning_key/)，按天分区可用[toYYYYMMDD](https://clickhouse.tech/docs/en/query_language/functions/date_time_functions/#toyyyymmdd)，按月分区可用[toYYYYMM](https://clickhouse.tech/docs/en/query_language/functions/date_time_functions/#toyyyymm)
- ORDER BY：聚合的条件

python客户端
```bash
pip install clickhouse-driver
```


参考

- [ClickHouse使用](https://www.zouyesheng.com/clickhouse.html)
- [ClickHouse表引擎及作用](http://liangfan.tech/2019/01/03/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3ClickHouse%E4%B9%8B6-%E8%A1%A8%E5%BC%95%E6%93%8E%E5%8F%8A%E4%BD%9C%E7%94%A8/)
- [clickhouse-python](https://clickhouse-driver.readthedocs.io/en/latest/)
- [clickhouse性能测试](https://www.jianshu.com/p/f9a54193dc63)
- [clickhouse物化视图](https://blog.lzzrpi.xin/index.php/archives/205/)