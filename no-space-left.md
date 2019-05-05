---
title:  
date: 2019-05-05T03:26:43.089Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---



-bash: cannot create temp file for here-document: No space left on device

无法为立即文档创建临时文件: 设备上没有空间

根目录 磁盘占用100%

df -h
![enter description here](https://i.loli.net/2019/05/05/5cce5839406f5.jpg)

  

查看占用超过1g的目录:
`du -sh * |grep -E 'G|T'`
![enter description here](https://i.loli.net/2019/05/05/5cce639bdd203.jpg)

>不在上图中挂载点的目录(usr/var/root)都属于/挂载点 

大多数情况为数据/日志等文件过多造成的。
![enter description here](https://i.loli.net/2019/05/05/5cce641f9412a.jpg)


查看mongo配置文件：`cat /etc/mongod.conf`

停止mongo服务：

迁移数据文件：

修改配置文件：
```yaml
# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  #path: /var/log/mongodb/mongod.log
  path: /var/log/mongodb/mongod.log

# Where and how to store data.
storage:
  #dbPath: /var/lib/mongo
  dbPath: /var/lib/mongo
```
重启服务

检查

总结：
使用yum install方式安装的文件需要注意日志文件/数据文件等的路径，安装前配置一个容量大的目录。


参考  
- [](https://blog.csdn.net/nciasd/article/details/51497817)
