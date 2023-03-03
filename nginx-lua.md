---
title: nginx-lua
heading:  在 nginx 中使用 lua 实现动态端口转发
date: 2023-03-03T03:50:21.605Z
categories: ["code"]
tags: 
description:  
---

草稿

 ip 地址形式为 x.x.x.x，共有四部分 0~255 组成（10进制）   ，若使用  36 进制表示， 2 个字符串可代表一个 ip 地址，8 个字符串 即可表示任意 ip 地址。比如：192.168.1.100 可用 5c4o012s 表示 （不足 2 位用 0 补足）
 
 
同理计算机端口范围 0~65535 ，一共 65536 个，使用  36 进制表示，4 个字符即可够用。

所以一共 12 个字符就可以代替任意 ip+端口

这样设计扩展性是强了，但使用不方便，每次输入 12 个字符很麻烦，也不方便记忆。
 正常情况也不可能反向代理这么多 ip 和端口，
 
 
 
 只开放 36个 ip，36 个端口。只需要用两个字符

规定 端口永远是 10100~10135  代表0~z

xx.km.sxy21.cn


所以两个字符就能满足需要了。

下面是实战环节：



推荐使用 OpenResty 代替 nginx+lua


## 配置泛域名解析

## 配置反向代理

## 参考文档
- [nginx lua api解读](https://juejin.cn/post/6844903545494323208)
- [set_by_lua 使用](https://www.jianshu.com/p/3ea9312a619a)
- [基于 Nginx 与 Lua 的高性能 Web 平台](https://openresty.org/cn/)