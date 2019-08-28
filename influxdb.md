---
title:  influxdb
date: 2019-08-27T07:56:11.769Z
tags: 
categories:
draft: true
description: 
---

使用[influxdata](https://docs.influxdata.com/influxdb/v1.7/introduction/installation/)的源进行安装

```shell
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF

yum -y install influxdb
systemctl start influxdb
# 进入infulx
influx
```

创建数据库

```sql
> CREATE DATABASE "sxydb"
> show databases

```

数据保留策略

连续查询




参考  

- [influxdb的数据重复性问题](https://docs.influxdata.com/influxdb/v1.7/troubleshooting/frequently-asked-questions/#how-does-influxdb-handle-duplicate-points)
- [InfluxDB中文文档](https://jasper-zhang1.gitbooks.io/influxdb/content/)