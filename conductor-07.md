---
title:  conductor fork and join
heading:  
date: 2023-03-17T08:13:23.993Z
categories: ["code"]
tags: 
description:  conductor Fork and join
---



假设执行问 sms 通知后，并行执行 email 通知和 http 通知

```bash
{
  "name": "notification_in_parallel",
  "description": "notification in parallel",
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
    "name": "fork_join",
    "taskReferenceName": "my_fork_join_ref",
    "type": "FORK_JOIN",
    "inputParameters": {},
    "forkTasks": [
      [
        {
          "name": "email_notification",
          "taskReferenceName": "email_notification_ref",
          "type": "SIMPLE"
        }
      ],
      [
        {
          "name": "http_notification",
          "taskReferenceName": "http_notification_ref",
          "type": "SIMPLE"
        }
      ]
    ]
  }
  ]
}
```

fork 类型的任务必须有 join 任务，否则会报错：
```prolog
Fork task definition is not followed by a join task. Check the blueprint
```

在 fork_join 任务之后再增加一个 join 类型的任务即可，找到 xx ，重新恭喜工作流的定义即可。
```json
{
  "name": "notification_in_parallel",
  "description": "notification in parallel",
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
    "name": "fork_join",
    "taskReferenceName": "my_fork_join_ref",
    "type": "FORK_JOIN",
    "inputParameters": {},
    "forkTasks": [
      [
        {
          "name": "email_notification",
          "taskReferenceName": "email_notification_ref",
          "type": "SIMPLE"
        }
      ],
      [
        {
          "name": "http_notification",
          "taskReferenceName": "http_notification_ref",
          "type": "SIMPLE"
        }
      ]
    ]
  },
  {
	"name": "notification_join",
	"taskReferenceName": "notification_join_ref",
	"inputParameters": {},
	"type": "JOIN",
	"joinOn": [
	  "email_notification_ref",
	  "http_notification_ref"
	]
	}
  ]
}
```

> 并行并不代表“同时”，joinOn 的数量可以少于总数，0~n。
> 如果 joinOn 为空，则这个工作流在 conductor 的 Executions 界面一将会一直在 RUNNING 状态，但在详情内是 COMPLETED 状态。

