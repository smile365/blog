---
title:  从0到1开发claok|day2
heading: 
date: 2020-07-15T13:28:43.275Z
categories: ["code"]
tags: 
description: 
---

上篇文章讲述了[用cloak技术系统来跑fb广告的原理](https://www.c1oak.com/)，本篇继续

既然有了访问者的指纹，那么接下来就是处理这些指纹是否符合访问要求。

其中最重要的可使用的有亮相，一项是访问者ip、一项是user agent。

有了ip即可确定访问者的地理位置，有了user agent就能确定访问者是机器还是真人。
因为真实的用户user agent大概长这样
```
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36

```

机器爬虫或者spy工具、bot等的user agent大概长这样
```
compatible; MJ12bot/v1.4.8;
compatible; Googlebot/2.1;
```

根据这些值差不多能做出一个简单的[Affiliate Cloak屏蔽系统](https://www.c1oak.com/)，当审核人员访问时，显示一个页面，其他普通访客访问时，显示另一个页面。

虽然都是同样的url，但是不同特征的人看到的内容不同。

接下来就是考验[cloak系统如何根据ip确定地理位置](https://www.c1oak.com/)，虽然功能差不多，比拼的是谁有能力获取更全的ip地址数据库。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1594820733852.png)

因为做大数据平台的原因，接触到了600百万级别的ip地址。

如有需要欢迎索取测试。








