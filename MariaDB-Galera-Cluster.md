---
title:  CentOS7安装MariaDB Galera Cluster实现mysql高可用
date: 2018-09-05T02:54:20.227Z
tags: ["mysql"]
series: ["blog"]
categories: ["code"]
description:
---


## 介绍

[MariaDB Galera Cluster](https://mariadb.com/resources/blog/getting-started-mariadb-galera-and-mariadb-maxscale-centos)与[Percona XtraDB Cluster](https://www.percona.com/doc/percona-xtradb-cluster/5.7/index.html)一样，都是基于wsrep做的。
* 优点：
	* 同步复制：数据会同时写入所有节点。
	* 多主复制：任何节点都可以触发数据更新。
	* 并行复制：多个线程同时执行复制，无延迟。
	* 扩展容易：添加新节点自动同步，失效节点自动剔除。
* 局限：
	* 只支持InnoDB引擎。
	* 所有表都要有主键。
	* 不支持LOCK TABLE等显式锁操作。
	* 至少3节点。


## 禁用防火墙
```
vi /etc/selinux/config
SELINUX=disabled
sudo systemctl disable firewalld
reboot
sestatus
systemctl status firewalld
```


## 安装软件

curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
sudo yum -y install MariaDB-server
sudo yum -y install maxscale
sudo yum -y install MariaDB-client

## 配置 `vi /etc/my.cnf.d/server.cnf`
```nginx
wsrep_on=ON
wsrep_provider=/usr/lib64/galera/libgalera_smm.so
wsrep_cluster_address=gcomm://192.168.31.93,192.168.31.119,192.168.31.165
binlog_format=row
default_storage_engine=InnoDB
innodb_autoinc_lock_mode=2
```

## 启动
```shell
#主节点
sudo galera_new_cluster

#从节点
sudo systemctl start mariadb.service

```
