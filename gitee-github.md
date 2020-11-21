---
title:  实现gitee作为主仓库，github作为从仓库。
heading: gitee作为主仓库，github作为从仓库，双库同步更新。
date: 2020-06-16T12:09:09.298Z
categories: ["code"]
tags: 
description: gitee和github两个仓库同步更新
---

为了保持github和gitee两个仓库的同步更新，可以做如下操作。

一般来说我们需要从gitee拉取，因为速度快，但同时需要同步到github。此时可以配置两个远程仓库，只从gitee拉取，同时推送到gitee和github。

先在gitee和github创建同名的空仓库：dsxsapp。

然后执行如下命令：

```bash
#1.进入已存在的项目
cd dsxsapp 
#2.初始化
git init 
#3.添加文件
git add .
#4.提交
git commit -m "first commit"
#5.增加添加远程仓库
git remote add origin git@gitee.com:smile365/dsxsapp.git
#6.增加一个推送的地址
git remote set-url --add origin git@github.com:smile365/dsxsapp.git
#7.查看远程仓库
git remote -v
#输出如下：
#origin	git@gitee.com:smile365/dsxsapp.git (fetch) #拉取
#origin	git@gitee.com:smile365/dsxsapp.git (push) #推送
#origin	git@github.com:smile365/dsxsapp.git (push) #推送
#8.同时推送到两个远程仓库
git push -u origin master
```

下次push的时候就能做到gitee和github两个仓库同步更新了。

