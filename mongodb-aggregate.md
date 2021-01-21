---
title:  mongodb-aggregate
heading:
date: 2021-01-21T07:51:12.260Z
categories: ["other"]
tags: 
description: 
---

有一份数据记录了每个人对 6 种宠物的喜欢程度，如下图

数组依次表示猫、狗、鼠、兔、鱼、鸟的喜欢程度，-1 表示不喜欢，0 表示都可以，1 表示喜欢。

![宠物爱好](https://gitee.com/smile365/blogimg/raw/master/sxy91/1611215725024.png)

需要统计不同城市中，对不同宠物爱好的人数，如下图。

![统计](https://gitee.com/smile365/blogimg/raw/master/sxy91/1611215812237.png)


如何设计数据的存储模型，以及如何实现这样的功能。



