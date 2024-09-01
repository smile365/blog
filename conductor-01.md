---
title: "conductor DAG 的完整支持改造(3)-入门指南"
heading:  
date: 2023-03-17T06:17:45.498Z
categories: ["code"]
tags: 
description:  
---



## conductor 系列入门指南
1. 为什么需要 conductor

原来：  下订单、算积分、短信通知、邮件通知、http 通知

垂直的一条服务，假设其他功能也需要短信通知、邮件通知、http 通知。那得重写一遍。有可能其他服务的参数不一样，且顺序不一样，还有就是可能不需要部分服务。


把这些服务拆成原子化的，然后通过 conductor 就可以随意组合拼接这些服务。执行完一个节点后，conductor 会自动启动下一个节点。

2. 搭建 conductor 服务


3. hello word

4. 定义任务
小方块（工人）

5. 定义工作流（编排任务）
拿一个或多个小方块拼接成一个整体（流水线）

6. 任务的流程控制 [workflow-operators](https://conductor.netflix.com/documentation/configuration/workflowdef/operators/index.html)

Do-While
Dynamic
Dynamic Fork
Fork
Join
Set Variable
Start Workflow
Sub Workflow
Switch
Terminate


7. 实战
