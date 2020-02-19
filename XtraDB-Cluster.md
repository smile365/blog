---
title: CentOS7安装Percona XtraDB Cluster实现mysql高可用  
date: 2018-09-05T02:51:39.093Z
tags: ["mysql"]
categories: ["code"]
description: Percona XtraDB Cluster with config /etc/sysconfig/mysql.bootstrap

[Percona XtraDB Cluster](https://www.percona.com/doc/percona-xtradb-cluster/5.7/index.html) 是MySQL数据库集群解决方案。具有高可用性，能避免单点故障和数据丢失，并支持线性扩展。
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


## 三台CentOS 7
Node|Host|IP|
---|---|---
test1 | test1.com	|192.168.31.93
test2 | test2.com	|192.168.31.119
test3 | test3.com	|192.168.31.165

## 安装：
1，配置防火墙和开启端口
```
systemctl start firewalld
firewall-cmd --zone=public --add-service=mysql --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --zone=public --add-port=4567/tcp --permanent
firewall-cmd --zone=public --add-port=4568/tcp --permanent
firewall-cmd --zone=public --add-port=4444/tcp --permanent
firewall-cmd --zone=public --add-port=4567/udp --permanent
firewall-cmd --reload
firewall-cmd --list-all
```

 2、配置安装源
 ```shell
sudo yum install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
```

 3、使用yum安装 [Percona XtraDB Cluster 5.7](https://www.percona.com/doc/percona-xtradb-cluster/5.7/install/yum.html#yum )
 ```shell
sudo yum install Percona-XtraDB-Cluster-full-57
#启动服务
sudo service mysql start
#查看自动生成的密码
sudo grep 'temporary password' /var/log/mysqld.log
#登陆
mysql -u root -p
#修改密码
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootPass';
#创建sst账户并赋予权限
mysql> CREATE USER 'sstuser'@'localhost' IDENTIFIED BY 'passw0rd';
mysql> GRANT RELOAD, LOCK TABLES, PROCESS, REPLICATION CLIENT ON *.* TO 'sstuser'@'localhost';
mysql> FLUSH PRIVILEGES;
退出
mysql> exit
 ```
 
 ## 配置集群
1、先关闭服务
sudo service mysql stop

2、[编辑配置文件](https://www.percona.com/doc/percona-xtradb-cluster/5.7/configure.html)：
vi /etc/percona-xtradb-cluster.conf.d/wsrep.cnf
```
#共同配置
wsrep_cluster_name=pxc-cluster
wsrep_cluster_address=gcomm://192.168.31.93,192.168.31.119,192.168.31.165
wsrep_sst_auth=sstuser:passw0rd

#节点1
wsrep_node_name=pxc1
wsrep_node_address=192.168.31.93

节点2
wsrep_node_name=pxc2
wsrep_node_address=192.168.31.119

节点3
wsrep_node_name=pxc3
wsrep_node_address=192.168.31.165
```

## 启动第一个节点
[启动主节点](https://www.percona.com/doc/percona-xtradb-cluster/5.7/bootstrap.html)
```
#确保mysql停止
sudo service mysql stop 
#主节点启动命令
systemctl start mysql@bootstrap.service
登陆：
mysql -uroot -prootPass
#检查配置是否正确
show status like 'wsrep%';
```

## 把其他节点加入集群
[启动从节点](https://www.percona.com/doc/percona-xtradb-cluster/5.7/add-node.html)
```
#启动从节点
systemctl start mysql
```










