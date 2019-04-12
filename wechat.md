---
title: 微信pc端和移动端多开技术的研究 
date: 2018-08-10T06:32:54.129Z
tags: ["多开"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

mac 微信记录备份。
每次备份都会追加到原来的文件上，建议每次备份后都删除备份文件。
```shell
> cd ~/Library/Containers/com.tencent.xinWeChat/Data/Library/Application\ Support/com.tencent.xinWeChat/2.0b4.0.9/Backup

# 仅压缩 微信号-开始-结束
> zip -r smile8365-181025-190108.zip . 
# 压缩并删除
> zip -rm smile8365-181025-190108.zip .

```
使用Sandboxie实现windows应用程序的多开。

下载

点击微信右键

再创建一个容器

参考  
- [Mac微信聊天记录备份位置](https://www.zhihu.com/question/50022284/answer/123677875)
- [接触禁止复制](https://zhuanlan.zhihu.com/p/32155254)
- [应用隔离](https://www.zhihu.com/question/25395183/answer/79937376)