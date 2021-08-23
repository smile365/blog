---
title:  rsync-scp
heading: rsync 与 scp 命令
date: 2021-08-23T06:14:29.870Z
categories: ["other"]
tags: 
description: 
---


```bash
rsync -av . username@ssh-host:/root/sxy --exclude='.git'
```



参考文献：
- [rsync 用法教程](https://www.ruanyifeng.com/blog/2020/08/rsync.html)