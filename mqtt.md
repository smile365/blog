---
title: MQTT入门指南
heading:  
date: 2025-08-08T06:42:12.713Z
tags: 
categories: ["code"]
Description:  
---

## 前言

开发一套农产品溯源系统，需要实时显示农场的温湿度。

实现方案
1. 温湿度传感器 ---mqtt协议-- mqtt服务器
2. 从 mqtt 服务器获取温湿度数据


## mqtt 服务器技术选型

### 在线服务
1. [百度云 lot](https://cloud.baidu.com/product-price/iotre.html)
每月 消息数 < 100万 免费。百度云 lot 不支持 mqtt 5.0 协议，且运维管理的日志服务延迟 30 分钟左右，若不使用时序数据库（收费）则无法实时查看 mqtt 客户端发送的内容，不过可通过配置转发规则把接受到的数据转发到自己的 http api 处理。

2. [emqx](https://www.emqx.com/zh/pricing)  
同样也提供免费额度，每月 1 GB 流量。他们家的客户端 [mqttx](https://mqttx.app/zh) 很好用。

3. 提供免费试用的还有： Eclipse、Mosquitto、HiveMQ

4. 提供收费的还有 阿里云等

### 开源方案

自用或快速测试推荐使用 docker 部署 [nanomq](https://nanomq.io/docs/zh/latest/installation/docker.html)，小巧快速。生产环境简易使用 docker 部署 [emqx](https://docs.emqx.com/zh/emqx/latest/deploy/install-docker.html)

1.  [emqx](https://www.emqx.com/zh/downloads-and-install/broker)  支持除了 windows 基本都支持，可通过 docker 部署。
2. [nanomq](https://nanomq.io/zh/downloads?os=Windows) Docker、Linux、Windows。
3. [Eclipse Mosquitto](https://mosquitto.org/download/)  Docker、Linux、Windows、Mac。
5. [VerneMQ](https://vernemq.com/downloads/index.html) Docker、Linux


### 客户端
[mqttx](https://mqttx.app/zh/downloads) 支持 Windows、Mac、Linux、Docker 及在线 [web 端](https://mqttx.app/web-client)。



## 部署服务器

```bash
docker pull emqx/emqx
docker run -d --name emqx -p 1883:1883 -p 8083:8083 -p 8084:8084 -p 8883:8883 -p 18083:18083 emqx/emqx
```

访问 http:/your_ip:18083/   账号 admin 密码 public 可进入 emqx 的 web 管理界面。




## 参考文档
1. [MQTT 服务器（MQTT Broker）：工作原理与快速入门指南](https://www.emqx.com/zh/blog/the-ultimate-guide-to-mqtt-broker-comparison)