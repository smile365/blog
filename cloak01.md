---
title:  从0到1开发一套claok系统|day1
heading: cloak技术策略，如何用cloak系统来跑Facebook广告
date: 2020-07-15T06:15:39.400Z
categories: ["code"]
tags: 
description: 
---

[cloak技术](https://www.c1oak.com/)策略-如何用cloak系统来跑Facebook广告


跨境电商绕不开Google/Facebook/Twitter等几大流量平台，在这些平台推广商品规则众多，部分商品一不小心就触犯了平台方的广告推广规则，轻则无效，重则关小黑屋。

另外，网络世界的流量相当巨大，除了爬虫Spider、还有spy工具等非人类用户。如何防止爬虫模拟真实用户去抓你的Banner或者Landing Page。

这时候就需要[cloak技术](https://www.c1oak.com/)来帮助推广人员推广产品。

cloak系统本质上就是一个程序，主要功能就是检测访问广告的用户，如果是目标用户就展示想要推广的商品内容，如果是广告平台的爬虫或者审核人员，就展示合规的内容。达到快速过审的目的。

![cloak](https://gitee.com/smile365/blogimg/raw/master/sxy91/1594815390698.png)

本质上是一种技术上的对抗和隐藏。

原理上如何做到的呢。

只要浏览网页，就必须留下足迹。

打开网站的服务器日志,就能看到如下实时信息：
```accesslog
182.254.52.17 - - [15/Jul/2020:19:03:58 +0800] "GET http://49.232.54.229/ HTTP/1.1" 301 185 "-" "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:57.0) Gecko/20100101 Firefox/57.0" "-"
182.254.52.17 - - [15/Jul/2020:19:03:58 +0800] "GET / HTTP/1.1" 200 9510 "http://49.232.54.229/" "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:57.0) Gecko/20100101 Firefox/57.0" "-"
```

这种日志格式包含了如下关键信息
```nginx
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;
```

主要是访问者ip，设备指纹，访问时间，是机器人还是真人，设备类型等等内容。

[cloak系统](https://www.c1oak.com/)就是根据这些特征判断访问者是不是一个目标用户。


Cloak系统应对的流量多且咋，因此难于设计，造成了Cloak程序员很贵，设计出的效果却不怎么理想。可以承诺7天退款的都算是良心卖家！！！


设计过亿级别的网络爬虫，破解过fb的app，逆向过fb的数据。对fb/twitter/google等平台的技术检测对抗了解很深。决心给跨境电商的小伙伴提供一款稳定准确的cloak系统。





Cloak技术简介
是什么，为什么需要，需求是什么，如何实现

先记录，ip、访客时间、访客硬件指纹


