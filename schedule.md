---
title:  定义定时任务框架优劣势对比
heading:  
date: 2022-12-30T14:40:41.101Z
tags: 
categories: ["code"]
Description:  
---



## 单机定时任务
### 1. Spring Task
通过 Spring 提供的 `@Scheduled` 注解即可定义定时任务.
```bash
/**
 * cron：使用Cron表达式。 每分钟的1，2秒运行
 */
@Scheduled(cron = "1-2 * * * * ? ")
public void reportCurrentTimeWithCronExpression() {
  log.info("Cron Expression: The time is now {}", dateFormat.format(new Date()));
}
```

### 2. node-schedule

```javascript
const schedule = require('node-schedule');
const  scheduleCronstyle = ()=>{ 
    schedule.scheduleJob('30 * * * * *',()=>{console.log('scheduleCronstyle:' + new Date());}); 
}
scheduleCronstyle();
```

## 分布式
### 1. Quartz
不考虑：使用繁琐，只能依靠 API，不够优雅。分布式支持不友好，没有内置 UI 管理控制台、使用麻烦。

### 2. TBSchedule
不考虑：基于 Java 中的 Timer 实现，一个 Timer 一个线程，这就导致 Timer 的任务的执行只能串行执行，一个任务执行时间过长的话会影响其他任务（性能非常差）。

### 3. Elastic-Job
最初由当当网开源，之后成为 Apache ShardingSphere 的子项目。

### 4. Saturn
Saturn 是唯品会在当当开源的 Elastic Job 基础上开发而来。

### 5. XXL-JOB
学习简单、轻量级，但问题比较多。

### 6. PowerJob
无锁化设计、基于时间轮实现，性能高。提供分布式计算、工作流等额外功能。


## 优劣势对比

|                | xxl-job                                  | Saturn                                                                        | Elastic-Job                                                                   | PowerJob                                                   |
| -------------- | ---------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------------------- |
| 定时类型       | CRON                                     | CRON                                                                          | CRON                                                                          | CRON、固定频率、固定延迟、OpenAPI                          |
| 任务类型       | 内置Java、GLUE Java、Shell、Python等脚本 | 内置Java、Java/Go/C++/PHP/Python/Ruby/shell等脚本                             | 内置Java、Shell、Python等脚本                                                 | 内置Java、外置Java（容器）、Shell、Python等脚本            |
| 分布式任务     | 静态分片                                 | 静态分片                                                                      | 静态分片                                                                      | MapReduce 动态分片                                         |
| 在线任务治理   | 支持                                     |                                                                               | cloud 版本支持                                                                | 支持                                                       |
| 日志白屏化     | 支持                                     |                                                                               | 不支持                                                                        | 支持                                                       |
| 调度方式及性能 | 基于数据库锁，有性能瓶颈                 | 基于数据库锁，有性能瓶颈                                                      | 基于数据库锁，有性能瓶颈                                                      | 无锁化设计，性能强劲无上限                                 |
| 报警监控       | 邮件                                     |                                                                               | 邮件、企业微信、钉钉                                                          | 邮件，提供接口允许开发者扩展                               |
| 系统依赖       | MySQL                                    | JDK 7 or 8<br/>Maven <br/>node.js <br/>npm<br/>docker<br/>ZooKeeper<br/>MySQL | zk\java\maven                                                                 | 任意 Spring Data Jpa支持的关系型数据库（MySQL、Oracle...） |
| DAG 工作流     | 不支持                                   | 不支持                                                                        | 不支持                                                                        | 支持                                                       |
| 最新开源版本   | 近 7 月内                                | 2020 年                                                                       | 近 2 个月内                                                                   | 近 2 个月内                                                |
| star 数        | 23.3k                                    |                                                                               | 7.8k                                                                          | 4.4k                                                       |
| 优点           |                                          | 1. 运维成本高<br/>2. 最新版到 2020 年                                         | 1. 接入简单，仅依赖 zk。<br/>2. 比较稳定，bug 少。<br/>3. 背靠 Apache 和 当当 | 接入业务非常方便，几乎不需要额外开发。                     |
| 缺点           |                                          | 需要部署独立的运维平台                                                        | 1. 仅提供 sdk 接入业务需要一定的开发量                                        | 个人开源项目（前阿里 SchedulerX 主力开发）                 |



## 参考文档
1. [Java 定时任务框架大揭秘](https://zhuanlan.zhihu.com/p/414296662)
2. [使用 Scheduler](https://www.liaoxuefeng.com/wiki/1252599548343744/1282385878450210)
3. [java 中的定时任务框架](https://juejin.cn/post/7043966654534909988)
4. [tbschedule 由 Alibaba 开源的分布式调度框架](https://github.com/nmyphp/tbschedule)
5. [分布式定时任务框架选型](https://www.modb.pro/db/239247)

