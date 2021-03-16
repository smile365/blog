---
title:  参与app的Java后端开发过程中遇到的疑难杂症
heading: 参与app的Java后端开发过程中遇到的疑难杂症
date: 2021-03-16T12:43:59.634Z
categories: ["code"]
tags: 
description: app-java-difficulty
---

**参与app的Java后端开发过程中遇到的疑难杂症**

**情况一**：MySQL连接数超过最大值，拒绝新的连接，造成大部分api无法提供服务
解决办法：
- 梳理所有使用MySQL连接的实例，改成单例模式。
- 使用 druid 数据库连接池。
- 更改 MySQL 的默认配置，增加数据库连接数量。

**情况二**：三个后端开发人员，共用一个 MySQL 库，经常造成其中一个把整个数据库搞挂。
解决办法：
- 基于 docker 搭建多个 MySQL 的微服务，按业务垂直拆分表到不同的数据库，不同后端使用不同的数据库，互不影响。

**情况三**：由于机房故障、断电、断网、网络抖动等原因，造成MySQL所在的服务器宕机，所有服务无法使用。
解决办法：
- 基于 docker、mycat、keepalive 等技术，搭建 MySQL 高可用环境，在多台服务器部署多个 MySQL 实例。
- 多个 MySQL 配置双主，任何一台服务器宕机都会有其他服务器继续提供数据服务。
- 增加多个从库，解决读的负载压力。

**情况四**：10万用户，每个用户每天至少产生 10 条以上不同类别的消息，半年后数据量达千万级别，造成用户中心无法快速从 MySQL 查询到自己的消息。
解决办法：
- 改用消息队列服务，每个用户有自己的队列，最大存储 30 天的消息。
- 用户取走消息后客户端负责保存，服务器不在存储全量消息。（类似微信消息，卸载后重新安装不再从服务器同步）

**情况五**：财经新闻分类众多，每天采集百万条，总量千万级，每次从千万级的数据中查询与个股相关或特定分类的最新新闻，速度奇慢。
解决办法：
- 使用 redis 作为缓存。
- 使用 zset 按时间存储各个分类或个股的最近 100 条新闻。
- 后端 api 只从 redis 获取最新数据，不读取数据库。

**情况六**：redis 存储数据量过多，内存占用过多，redis 服务终止。
解决办法：
- 更改 redis 的默认配置，修改可用内存为机器内存的 80%。
- 根据业务的适当配置内存置换策略（如 volatile-lru）
- 给 key 配置自动过期时间



