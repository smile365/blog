---
title:  定时任务与消息队列说明
date: 2018-07-09T06:13:18.529Z
tags: ["交接文档"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

定时任务
使用用户songxueyan
```shell
#从同花顺集思录抓取新股
0,15,35 09,10,11,13,15 * * * python3 /home/songxueyan/project/daxin/base/getstock.py 

#每隔10小时更新一次个推token
00 09,20 * * * python3 /home/songxueyan/project/daxin/getui_sign.py 

#每隔15分钟从黄总接口获取一次资讯
*/15 * * * * python3 /home/songxueyan/project/news/base/news.py

#每天凌晨2点从正式服务器获取用户到测试服务器
0 2 * * * python3 /home/songxueyan/project/daxin/base/sync_users.py 

#每天15点30获取沃牛1号的实盘交易净值曲线
30,50 15 * * * python3 /home/songxueyan/project/daxin/base/trade_api.py 

#每天凌晨4点更新打新统计
0 4 * * * python3 /home/songxueyan/project/daxin/base/result_task.py 
```

消息队列
更新用户的自选股新闻
cd /home/songxueyan/project/
nohup python3 news/base/pubsub.py 1>news/base/pubsub.log 2>news/base/pubsub.err &