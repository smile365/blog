---
title: Ubuntu 防火墙
heading: Ubuntu使用防火墙UFW查看开放的端口列表
date: 2021-07-28T05:02:44.701Z
categories: ["other"]
tags: 
description: Ubuntu 18.04.4 LTS 防火墙
---

Ubuntu 随附了一个称为 UFW（非复杂防火墙）的防火墙配置工具。 UFW是用于管理iptables防火墙规则的用户友好型前端，其主要目标是使管理防火墙规则更容易，或者名称不复杂。


查看防火墙状态
```bash
ufw status
# inactive 禁用状态
# active 启用状态
```

若果发现防火墙是关闭状态，但部分端口还是无法访问，那可能是用了云服务器的[虚拟防火墙](https://developer.aliyun.com/article/767328)，需要登录到云服务器的控制台去开启。


