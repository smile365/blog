---
title:  git上不显示贡献度的解决办法
heading: 如何把github仓库项目迁移到gitee并保留历史贡献度
date: 2020-04-08T06:41:57.794Z
categories: ["code"]
tags: ["commit email","git 贡献度","gitee贡献度统计"]
description:  码云提交不显示贡献度问题，git账户提交（贡献度）没记录
---


## 从 github 导入 gitee 的项目无法记录贡献度
在码云(gitee)【新建仓库-->导入已有仓库】,输入github仓库地址，此时导入的项目commit并没有被统计到人主页的贡献度里。

经过搜索发现，gitee的贡献度是按照commit的邮箱来统计的。因为github账号使用的是gmail邮箱，gitee使用的账号是qq邮箱，所以
必须在[多邮箱管理](https://blog.gitee.com/2019/02/21/gitee-multiple-email/)界面绑定过的邮箱才纳入统计。

删除导入的仓库，添加邮箱后重新操作一遍，发现历史的commit还是没被统计到主页的贡献度里。

使用 git log 命令查看commit历史邮箱记录，发现确实已经在[多邮箱管理](https://blog.gitee.com/2019/02/21/gitee-multiple-email/)界面绑定过里。

再次经过一番搜索才发现，只有push操作才能触发贡献度统计。

那好说，修改个文件，commit，push，发现不行。
增加个文件，commit，push，还是不行。


折腾一番发现，若要保留历史贡献，正确的操作方法把所有commit都push一下。以下把github仓库`https://github.com/smile365/blog`导入到gitee的`https://gitee.com/smile365/blog`仓库为例，github已经有1千多次commit，gitee还没有建立仓库。

## 正确操作
在gitee建立一个与github同名的空仓库（不需要任何初始化没，不用导入仓库）

```bash
git clone git@github.com:smile365/blog.git
cd blog/
git remote -v
# 若不想保持两边仓库同步，可不加 add 参数
git remote set-url --add origin git@gitee.com:smile365/blog.git
git remote -v
git push
```

此时发现个人主页的贡献度已经发生变化了，终于成功了啊。

> 注：`git remote set-url --add`这条语句的一次是推送的时候同时推送到两个地址，改变的是本地git的config配置，origin端的配置已经不会改变，重新clone会初始化成clone地址相对应的配置。

若要保持gitee和github贡献度同步，可以在github的[邮箱配置](https://github.com/settings/emails)也填写一致，增加在gitee填写的邮箱即可。





