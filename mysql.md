---
title:  后台mysql高可用架构说明
date: 2018-7-5
tags: ["mysql","mycat","keepalived"]
series: ["blog"]
categories: ["code"]
draft: true
Description: 
---

![mysql高可用](https://i.loli.net/2018/07/05/5b3d73b2145da.jpg)

安装步骤如下：
1. 在W和R节点分别安装docker
2. 在docker中安装3套mysql双主，一共6个mysql节点
3. 在W和R安装负载均衡中间件mycat
4. 在W和R安装高可用keepalived抢占vip


mycat：6个mysql节点的代理，对所有mysql进行心跳检测，只会把数据发送到存活的mysql，当查询量大时负责流量的分发。
keepalived：抢占虚拟ip，当W和R其中任意一个宕机或者mycat异常，都会导致虚拟ip漂移到另外一台服务器。
docker：方便安装多个mysql，对mysql进行虚拟化。

