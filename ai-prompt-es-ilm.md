---
title: ai-prompt-es-ilm
heading:  
date: 2023-10-30T02:53:12.544Z
categories: ["code"]
tags: 
description:  ai chatgpt prompt es ilm 。使用 AI 验证 es 的 ILM 功能。 Open-AI chatgpt-4 、 讯飞-星火 、百度-文心一言 、 阿里-通义千问 使用体验和评测对比。
---

## 前言


ILM 有什么要求
版本？
节点数量？
硬件要求？
其他未知


## prompt
1. 在 es 中启用 index lifecycle management (ILM) 功能需要什么条件？

| chatgpt-4                                               | 讯飞-星火                                               | 百度-文心一言                                           | 阿里-通义千问                                           |
| ------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- | ------------------------------------------------------- |
| ![](https://cdn.sxy21.cn/static/imgs/1698637512861.png) | ![](https://cdn.sxy21.cn/static/imgs/1698637550186.png) | ![](https://cdn.sxy21.cn/static/imgs/1698637567443.png) | ![](https://cdn.sxy21.cn/static/imgs/1698637623782.png) |
总结：chatgpt、星火、通义千问提供了版本要求，文心一言没有提供有信息。但通义千问的版本是错的。 

有效信息：Elasticsearch 版本至少为6.7或更高即可。

2. 启用 ILM 功能是否有版本、节点数量、内存要求？有的话请列出具体明细。

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638070343.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638088236.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638106114.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638119862.png)|

总结：同上，除了第一次提问的，基本没要求。

3. 单节点的 Elasticsearch 是否可以启用 index lifecycle management (ILM) 功能？

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638224393.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638212414.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638201871.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638191259.png) |
总结：都说单节点可以使用 ILM 功能，但 chatgpt 提供了单节点下的限制条件。

4. 如果在单节点的 Elasticsearch 启用 index lifecycle management (ILM) 功能，有哪些限制？

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638394987.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638371151.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638354368.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638343754.png) |

总结：chatgpt 最准确；星火说到了一部分，但不全面；文心一言和通义千问可以说没提供有心信息。

5. 如何使用 docker 部署一个节点的 Elasticsearch 8.10。

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698638672782.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698638702881.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698638779749.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698638801594.png) |

6. 如何在一个节点的 Elasticsearch 8.10 中创建 ILM 策略实现以下需求： 
	- 当文档数大于 20 触发滚动策略。
	- 当文档年龄超过 20 分钟触发删除。

| chatgpt-4 | 讯飞-星火 | 百度-文心一言 | 阿里-通义千问 |
| --------- | --------- | ------------- | ------------- |
| ![chatgpt-4](https://cdn.sxy21.cn/static/imgs/1698639344221.png) | ![讯飞-星火](https://cdn.sxy21.cn/static/imgs/1698639285940.png) | ![百度-文心一言](https://cdn.sxy21.cn/static/imgs/1698639394754.png) | ![阿里-通义千问](https://cdn.sxy21.cn/static/imgs/1698639428606.png) |


7. 总结
百度-文心一言
讯飞-星火
阿里-通义千问
chatgpt

创造性 or 确定性
复杂 or 简单
步骤多 or 步骤简单


针对有创造性、复杂、步骤多的任务，需要你充当导师的角色，需要有能力自己实现，且知道和检查正确性，让 AI 做一些快速、且简单的工作，主要提升的是效率。比如写一个 yaml 部署文件，一个启动 es 的命令，各种配置，这些工作由人来做比较慢，但由 ai 来做就很快。



## 验证步骤






