---
title:  mongodb的视图功能createView
heading: 
date: 2021-01-19T08:49:56.134Z
categories: ["code"]
tags: 
description: mongodb-createView
---


![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1611046301342.png)


一本电子课件有多个媒体资源，每一个资源需要经过很多轮审核，如何设计数据模型？




方案一：数据放到课件上，计数。上传、删除、替换、审核、退回、整体通过、整体退回。快，逻辑复杂，扩展性差，数据容易出错。
方案二：数据放到资源上，统计。慢，准确，逻辑简单。
方案三：使用 mongodb 视图
方案四：使用 mongodb 按需视图

