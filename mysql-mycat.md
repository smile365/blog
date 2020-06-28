---
title:   mysql-mycat
heading: 
date: 2020-06-28T09:35:49.503Z
categories: ["code"]
tags: 
description:  mysql高可用
---


mysql高可用架构图：
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1593337095908.png)


安装步骤如下：

- 1.在W和R节点分别安装docker
- 2.在docker中安装3套mysql双主，一共6个mysql节点
- 3.在W和R安装负载均衡中间件mycat
- 4.在W和R安装高可用keepalived抢占vip

mycat：6个mysql节点的代理，对所有mysql进行心跳检测，只会把数据发送到存活的mysql，当查询量大时负责流量的分发及负载均衡。
keepalived：抢占虚拟ip，当W和R其中任意一个宕机或者mycat异常，都会导致虚拟ip漂移到另外一台服务器。
docker：方便安装多个mysql，对mysql进行虚拟化。

 

需要的配置文件：

/etc/keepalived/keepalived.conf

/home/soft/mycat/conf

/home/mysql/conf

 

定时检测脚本

/home/mysql/script/mycat_check.sh

当检测到mycat无法提供服务时杀死keepalived，让vip漂移到另外一台服务器


经排查，之前搭建的高可用mysql集群，因数据写满磁盘挂了一台，没及时处理，造成从库数据丢失。因从库的docker等相关环境被删除，需要迁移到新的服务器，相当于重新搭建高可用集群。

整个工作处理需要如下步骤
- 1、从库安装keepalived
- 2、从库安装mycat
- 3、关闭主库的数据push、stock、news
- 4、导出主库的数据push、stock、news
- 5、关闭主库的主从复制。
- 6、在从库建立push、stock、news数据库。
- 7、把从主库导出的数据push、stock、news导入从库。
- 8、在主库开启主从复制。
- 9、在从库开启主从复制。
- 10、配置mycat与keepalived。

最短耗时预计需要1天。




把从库迁移到新的服务器，

，需要重新搭建高可用集群。
处理步骤如下
在keepalived