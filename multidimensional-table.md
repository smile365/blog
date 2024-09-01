---
title: "类似飞书的开源多维表格 nocodb 搭建"
heading:  
date: 2023-03-10T03:14:00.609Z
categories: ["code"]
tags: 
description:  搭建属于自己的在线多维表格
---

某些私密的数据不适合放在网上


## nocodb 搭建
使用 docker 或者 docker compose 可以方便的搭建 [nocodb](https://github.com/nocodb/nocodb) 
```bash
# 没有指定数据库则使用内嵌的 sqlite
docker run -d --name nocodb -p 30303:8080 nocodb/nocodb:latest
```

## apitable 搭建
vika.cn 维格表的社区版，地表至强的开源低代码、多维表格工具，Airtable 的开源免费替代。

可使用 [安装脚本](https://gitee.com/apitable/APITable#%E5%AE%89%E8%A3%85) 一键安装 [apitable](https://github.com/apitable/apitable/blob/develop/docs/readme/zh-CN/README.md#%E5%AE%89%E8%A3%85)




## 参考文档
- [apitable--vika.cn 维格表社区开源版](https://github.com/apitable/apitable)
- [基于 nocodb 搭建自己的飞书多维表格](https://juejin.cn/post/6976139576347721741)
- [AFFiNE- 协作知识库，类飞书文档开源产品](https://github.com/toeverything/AFFiNE)
- [多维表格产品盘点](https://www.zhihu.com/question/466375296)
- [AppFlowy - Notion 的开源替代品](https://www.bilibili.com/read/cv19508051?from=search)