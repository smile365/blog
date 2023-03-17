---
title: conductor-03
heading:  
date: 2023-03-17T07:16:30.731Z
categories: ["code"]
tags: 
description:  基于 Java sdk 实现自定义 worker
---

## 基于 Java sdk 实现自定义 worker

hello world

### 依赖
- 已经搭建完成 conductor-server
- 有 conductor-ui


### 新建 spring-boot 项目引入依赖

```xml
<dependency>
    <groupId>com.netflix.conductor</groupId>
    <artifactId>conductor-client-spring</artifactId>
    <version>3.3.6</version>
</dependency>
<dependency>
    <groupId>com.netflix.conductor</groupId>
    <artifactId>conductor-common</artifactId>
    <version>3.3.6</version>
</dependency>
<dependency>
    <groupId>com.netflix.conductor</groupId>
    <artifactId>conductor-client</artifactId>
    <version>3.3.6</version>
</dependency>
```


### 配置 conductor

在  application.yml 中配置 conductor-server 的 api 地址

```yaml
conductor:
  worker:
    pollingInterval: 2
  client:
    rootURI: http://127.0.0.1:8080/api/
    threadCount: 2
```


 ### 实现一个 worker
 比如开发一个邮件通知的 worker。写一个Java 类并实现 Worker 接口中的 getTaskDefName 和 execute 方法即可。
 ```java
 public class EmailWorker implements Worker {
    @Override
    public String getTaskDefName() {
		// 返回 worker 的名字（唯一标识）
        return "email_notification";
    }

    @Override
    public TaskResult execute(Task task) {
		// 具体执行逻辑
        log.info("start EmailWorker");
        TaskResult result = new TaskResult(task);
        result.setStatus(TaskResult.Status.COMPLETED);
        log.info("do some thing by EmailWorker"));
        return result;
    }
}
 ```
 
 
同理定义完成邮件通知和 http 通知的 worker 
 ```java
 public class SmsWorker implements Worker
 //...
 
 public class HttpWorker implements Worker
 //...
 ```
 
 
### 把 worker 注册到 conductor
通过 conductor-server 的 api 接口提交 worker 的定义

请求地址：POST /api/metadata/taskdefs
请求体 json 如下：
```json
[
  {
    "name": "email_notification",
    "retryCount": 1,
    "retryLogic": "FIXED",
    "retryDelaySeconds": 10,
    "timeoutSeconds": 300,
    "timeoutPolicy": "TIME_OUT_WF",
    "responseTimeoutSeconds": 180,
    "ownerEmail": "me@sxy21.cn"
  },
  {
    "name": "sms_notification",
    "retryCount": 1,
    "retryLogic": "FIXED",
    "retryDelaySeconds": 10,
    "timeoutSeconds": 300,
    "timeoutPolicy": "TIME_OUT_WF",
    "responseTimeoutSeconds": 180,
    "ownerEmail": "me@sxy21.cn"
  },
  {
    "name": "http_notification",
    "retryCount": 1,
    "retryLogic": "FIXED",
    "retryDelaySeconds": 10,
    "timeoutSeconds": 300,
    "timeoutPolicy": "TIME_OUT_WF",
    "responseTimeoutSeconds": 180,
    "ownerEmail": "me@sxy21.cn"
  }
]
```
 
如果安装了 conductor-ui 的话，也可以通过界面操作.
![enter description here](https://cdn.sxy21.cn/static/imgs/1679038860153.png)


 
### 创建一个工作流
假设有个业务，需要按顺序一次执行 sms 通知用户、email 通知用户、http 通知另一个业务系统。

请求地址：POST /api/metadata/workflow
请求体：
```json
{
  "name": "notification_in_order",
  "description": "notification inorder",
  "version": 1,
  "schemaVersion": 2,
  "ownerEmail": "me@sxy21.cn",
  "tasks": [
    {
      "name": "sms_notification",
      "inputParameters": {},
      "taskReferenceName": "sms_notification",
      "type": "SIMPLE"
    },
    {
      "name": "email_notification",
      "inputParameters": {},
      "taskReferenceName": "email_notification",
      "type": "SIMPLE"
    },
    {
      "name": "http_notification",
      "inputParameters": {},
      "taskReferenceName": "http_notification",
      "type": "SIMPLE"
    }
  ]
}
```

同理也可以通过 conductor-ui 界面来定义 workflow
![enter description here](https://cdn.sxy21.cn/static/imgs/1679039538415.png)
![enter description here](https://cdn.sxy21.cn/static/imgs/1679039677131.png)




### 启动工作流
 请求地址:
 请求体:
 ```json
 
 ```
 
 
 也可以通过 conductor-ui 的界面启动工作流
 ![enter description here](https://cdn.sxy21.cn/static/imgs/1679039957002.png)



### 查看执行情况

通过界面查看
![enter description here](https://cdn.sxy21.cn/static/imgs/1679040252095.png)


通过程序的日志查看
```
2023-03-17 16:00:39.748  INFO 18650 --- [rkflow-worker-1] cn.sxy21.test_conductor.join.SmsWorker   : start SmsWorker

2023-03-17 16:00:42.375  INFO 18650 --- [rkflow-worker-2] c.sxy21.test_conductor.join.EmailWorker  : start EmailWorker

2023-03-17 16:00:43.373  INFO 18650 --- [rkflow-worker-1] cn.sxy21.test_conductor.join.HttpWorker  : start HttpWorker
```