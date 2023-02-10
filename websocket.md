---
title:  websocket
heading:  
date: 2023-02-09T01:32:46.548Z
tags: 
categories: ["code"]
Description:  
---
## 前言


## 实现 websocket 鉴权、安全、心跳检测

## 解决浏览器端连接数 255 限制

## 解决服务器端连接数 65535 限制

## 性能评估

不同的技术栈实现，所耗费的 CPU、内存、带宽资源有所不同，[参考这里](https://juejin.cn/post/6844903783575584776)。

一台 AWS C3.4xlarge (16 cores, 32G memory)作为应用服务器，两台 AWS C3.2xlarge (8 cores, 16G memory) 服务器作为客户端。这两台机器作为测试客户端绰绰有余，每台客户端机器创建了十个内网虚拟 IP, 每个 IP 创建 60000 个 websocket 连，共计 120w 连接。

| 技术栈   | 仅连接内存占用 | 广播 20 字节(网络带宽/耗时) |
| -------- | -------------- | --------------------------- |
| Netty    | 18G            | 10M/15s                     |
| Spray    | 25G            | 46M/8s                      |
| Undertow | 21G            | ?/15s                       |
根据业务不同，推送形式（广播、组播、单播）的不同，内存和 CPU 又会比较大的差异。具体根据自身情况分析。

## 带宽预估
解决完连接数的限制后，最大连接数仅取决于服务器内存和 CPU 的硬件规格，假设硬件资源无限，服务器给客户端推送消息的瓶颈就来到了服务器的带宽大小上。带宽大小取决于推送消息的连接数、推送比、推送频率、消息大小。

假设一百万连接中有 20% 是活跃的, 每个连接每秒传输 1KB 的数据, 那么需要的网络带宽是 0.2M x 1KB/s x 8 = 1.6Gbps, 要求服务器至少是万兆网卡(10Gbps)。



## 实战 demo
鉴权
spring boot + websocket+ jwt+
推送 demo




##  参考文档
- [WebSocket 鉴权授权方案](https://zhuanlan.zhihu.com/p/495501853)
- [Spring Boot+Netty+Websocket](https://blog.51cto.com/u_15430445/5761543)
- [鉴权、安全、心跳 ](https://github.com/HXWfromDJTU/blog/issues/15)
- [Spring Boot 集成 WebSocket](https://www.cnblogs.com/wupeixuan/p/13389757.html)
- [认识 Netty](https://www.jianshu.com/p/b9f3f6a16911)
- [廖雪峰-使用 WebSocket](https://www.liaoxuefeng.com/wiki/1252599548343744/1282384966189089)
- [LVS 三种负载均衡模式 NAT、TUN、DR ](https://zhuanlan.zhihu.com/p/87109094)
- [LVS 负载均衡之 DR 模式](https://www.cnblogs.com/Courage129/p/14332902.html)
- [浏览器只能建立256 个 WebSocket 连接](https://zhuanlan.zhihu.com/p/103289590)
- [常见浏览器的最大 WebSocket 连接数量 ](https://blog.csdn.net/weixin_41217541/article/details/106231171)
- [单台服务器服务端仅支持 6 万多个 websocket 长连接](https://www.jianshu.com/p/4878ff3ed4a5)
- [石墨文档 Websocket 百万长连接技术实践](https://www.infoq.cn/article/gymhabqvro214qo44jhd)
- [百万级 WebSockets 在 Mail.Ru 中的应用](https://colobu.com/2017/12/13/A-Million-WebSockets-and-Go/)
- [WebSockets 连接数从 1w 到 100w 遇到的问题](https://shibd.github.io/message-center-3/#%E7%AA%81%E7%A0%B41W%EF%BC%88%E6%9B%B4%E6%8D%A2Spring%E7%9A%84Web%E5%AE%B9%E5%99%A8%EF%BC%89)
- [小爱接入层单机百万长连接技术演进](https://www.zhihu.com/question/20831000/answer/2401861700)
- [爱奇艺 WebSocket 实时推送网关技术实践](http://www.52im.net/thread-3539-1-1.html)
- [Websocket 能否自定义请求头](https://hgl2.com/2021/websocket-request-header/)
- [Websocket 能否自定义请求头](https://hgl2.com/2021/websocket-request-header/)
- [websocket-security](https://devcenter.heroku.com/articles/websocket-security)

