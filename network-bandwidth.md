---
title: network-bandwidth
heading:  如何估算网络带宽需求
date: 2023-02-16T13:53:39.439Z
categories: ["code"]
tags: 
description:  
---

## 带宽单位
- Mbps ( Million bits per second )： 每秒传输百万位(比特)数量的数据
- Mb/s：
- MB/s：
- M/s：


> 1 Byte(字节)=8bit(比特/位)，即 1B = 8b



## 费用举例
场景： 1 百万个客户端，每秒传输 1Kb 数据。
- 按月付费：带宽是 `1M**1Kb/s**1024*8=8192 Mbps`,按月付费的带宽费用为 `125.0+(8192-5)*80=655085.0` 约 65 万元/月。
- 按量付费（1 月按 30 天）：发送数据大小 `30d*24h/d*60m/h*60s/h*100*10000*1Kb/1024/1024=2471923Gb`，费用约为 197 万/月
> 带宽大于 6Mbps 的月度带宽费用计算公式 125.0+(n-5)*80，参考 [阿里云](https://help.aliyun.com/document_detail/27767.htm?spm=a2c4g.11186623.0.0.3524662fBGKgCE#task-2240237)
> 按量付费公式  0.80（元/GB）



参考文档
- [阿里云带宽计费](https://help.aliyun.com/document_detail/27767.htm?spm=a2c4g.11186623.0.0.3524662fBGKgCE#task-2240237)
- [带宽单位：Mbps、Mb/s、MB/s、M/s](https://zhuanlan.zhihu.com/p/362556907)