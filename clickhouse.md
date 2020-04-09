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

```

修改[服务器配置项](https://clickhouse.tech/docs/en/operations/server_settings/settings/#server_settings-listen_host)，监听内网ip和配置数据目录。
`vim /etc/clickhouse-server/config.xml`
```xml
<listen_host>192.168.1.135</listen_host>
<path>/var/lib/clickhouse/</path>
<tmp_path>/var/lib/clickhouse/tmp/</tmp_path>
```

修改[用户配置项](https://clickhouse.tech/docs/en/operations/settings/query_complexity/#settings_max_memory_usage),调整可用最大内存。
`vim /etc/clickhouse-server/users.xml`
```xml
<max_memory_usage>20000000000</max_memory_usage>
```

启动服务器和客户端
```bash
systemctl start clickhouse-server
clickhouse-client -h 192.168.1.135
```

创建数据库和表  
```sql
CREATE DATABASE IF NOT EXISTS indexsysdb;
-- use indexsysdb;
CREATE TABLE indexsysdb.keyword1h \
(keyword String,\
dtime DateTime('Asia/Shanghai'),\
source1 String,\
source2 String,\
mood Int8,\
category Int8,\
amount UInt64) \
ENGINE = SummingMergeTree(amount) \
PARTITION BY toYYYYMM(dtime) \
ORDER BY (dtime, keyword, source1, source2,mood,category)
```

下面来解释下[各关键字](https://clickhouse.tech/docs/en/operations/table_engines/mergetree/)的意思：

- ENGINE：[表引擎](https://clickhouse.tech/docs/en/operations/table_engines/)
- PARTITION BY：[分区规则](https://clickhouse.tech/docs/zh/operations/table_engines/custom_partitioning_key/)，按天分区可用[toYYYYMMDD](https://clickhouse.tech/docs/en/query_language/functions/date_time_functions/#toyyyymmdd)，按月分区可用[toYYYYMM](https://clickhouse.tech/docs/en/query_language/functions/date_time_functions/#toyyyymm)
- ORDER BY：聚合的条件


插入测试数据

```sql
insert into keyword1h(keyword,dtime,source1,source2,mood,category,amount) values ('宋洋葱','2020-03-30 10:00:00','video','youtube',1,1,1), ('宋洋葱','2020-03-30 10:00:00','video','youtube',1,1,1);

select keyword,dtime,source1,source2,mood,category,sum(amount) from keyword1h group by keyword,dtime,source1,source2,mood,category
```

安装python[客户端](https://clickhouse.tech/docs/en/interfaces/third-party/client_libraries/)  
```bash
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple clickhouse-driver[lz4]
```

插入测试数据
```python
from clickhouse_driver import Client
from datetime import datetime, timedelta, timezone


client = Client(host='192.168.1.135',database='indexsysdb')
insert_keyword1h = 'insert into keyword1h (keyword,dtime,source1,source2,mood,category,amount) VALUES'

tz_utc_8 = timezone(timedelta(hours=8)) # 创建时区UTC+8:00

data = [{'source1': 'video', 'source2': 'youtube', 'mood': 3, 'category': 4, 'amount': 1, 'keyword': '宋洋葱'}, {'source1': 'overseas', 'source2': 'facebook', 'mood': 3, 'category': 4, 'amount': 1, 'keyword': '宋洋葱'}]
tm = datetime.now()
dtime = datetime(tm.year, tm.month, tm.day, tm.hour,tzinfo=tz_utc_8)
rows = []
for x in data:
	x['dtime'] = dtime
	rows.append(x)

client.execute(insert_keyword1h,rows)
```
> 注：DateTime类型的数据带有时区信息，python中需要用timezone指定。使用字符串格式的时间则会出现错误：` clickhouse AttributeError: str object has no attribute tzinfo`。


聚合查询测试  
```sql
--- 查询昨天0点到现在的数据
select keyword,dtime,sum(amount) from keyword1h where keyword='冠状病毒' and dtime > toDate(now())-1 group by keyword,dtime order by dtime
```

结果如下
```
┌─keyword──┬───────────────dtime─┬─sum(amount)─┐
│ 冠状病毒 │ 2020-03-27 00:00:00 │           6 │
│ 冠状病毒 │ 2020-03-27 01:00:00 │           4 │
│ 冠状病毒 │ 2020-03-27 02:00:00 │           2 │
│ 冠状病毒 │ 2020-03-27 03:00:00 │           3 │
│ 冠状病毒 │ 2020-03-27 05:00:00 │           4 │
│ 冠状病毒 │ 2020-03-27 06:00:00 │           8 │
│ 冠状病毒 │ 2020-03-27 07:00:00 │          19 │
│ 冠状病毒 │ 2020-03-27 08:00:00 │          18 │
│ 冠状病毒 │ 2020-03-27 09:00:00 │          14 │
│ 冠状病毒 │ 2020-03-27 10:00:00 │          39 │
│ 冠状病毒 │ 2020-03-27 11:00:00 │          43 │
│ 冠状病毒 │ 2020-03-27 12:00:00 │          25 │
│ 冠状病毒 │ 2020-03-27 13:00:00 │          35 │
│ 冠状病毒 │ 2020-03-27 14:00:00 │          54 │
│ 冠状病毒 │ 2020-03-27 15:00:00 │          53 │
│ 冠状病毒 │ 2020-03-27 16:00:00 │          33 │
│ 冠状病毒 │ 2020-03-27 17:00:00 │          52 │
│ 冠状病毒 │ 2020-03-27 18:00:00 │          39 │
│ 冠状病毒 │ 2020-03-27 19:00:00 │          28 │
│ 冠状病毒 │ 2020-03-27 20:00:00 │          16 │
└──────────┴─────────────────────┴─────────────┘

20 rows in set. Elapsed: 0.059 sec. Processed 1.34 million rows, 24.48 MB (22.55 million rows/s., 412.69 MB/s.) 
```

聚合了20行结果，耗时：0.059秒。 处理了134万行，24.48 MB（2255万行/秒，412.69 MB /秒）。速度快的令人尖叫。

参考

- [ClickHouse使用](https://www.zouyesheng.com/clickhouse.html)
- [ClickHouse表引擎及作用](http://liangfan.tech/2019/01/03/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3ClickHouse%E4%B9%8B6-%E8%A1%A8%E5%BC%95%E6%93%8E%E5%8F%8A%E4%BD%9C%E7%94%A8/)
- [clickhouse-python](https://clickhouse-driver.readthedocs.io/en/latest/)
- [clickhouse性能测试](https://www.jianshu.com/p/f9a54193dc63)
- [clickhouse物化视图](https://blog.lzzrpi.xin/index.php/archives/205/)