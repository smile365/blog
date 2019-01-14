---
title:  
date: 2019-01-08T02:43:30.643Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

### 做到深圳采集规模所需资源预估

目前深圳团队Facebook数据规模为日均6千万post、以及post相关的coments，并提供查询小组与个人资料的api。预估所需的资源如下：
- 账号：100个(非新号)
- 服务器：7台
- 外网代理：若干
- 群控系统：10台手机+群控服务器+usb集线器+手机支架
- 人员：4人

**估算方法一**：6千万post/(24*60*60)秒≈694psot/秒，即每秒最高694次请求。每个账号每秒最多10次请求，最低需要70个账户。

**估算方法二**：需要抓取734万账号/(24*60*60)秒≈85/秒。即需要85个账户。

**需要开发的模**块：token分发、uid分发、post-id分发、post-scrapy、comments-scrapy、token失效刷新、任务失败处理、查询接口、数据推送。

**账号购买**
根据账号质量(注册时间、资料真实性等)，单价从$0.1至$40不等。

参考  
- [buyaccs](https://buyaccs.com/en/buy-bulk-facebook-accounts.php)
