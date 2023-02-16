---
title:  如何为 Github 开源项目贡献代码
heading: 
date: 2022-04-15T11:25:18.427Z
categories: ["code"]
tags: 
description:  如何为 Github 开源项目贡献代码
---
## 什么是 pr（pull request）
参考 [Pull Request 的命令行管理](http://www.ruanyifeng.com/blog/2017/07/pull_request.html)

>"Pull Request 是 github 的一种通知机制。你修改了他人的代码，将你的修改通知原来的作者，希望他合并你的修改，这就是 Pull Request。"



## 一、fork 原作者的项目
假设 someone 有个项目 demo

由于没有对 demo 的直接 push 权限，我们需要先对 demo 库进行 fork，然后从自己的地址 clone。
```bash
git clone git@github.com:yourname/demo.git
someone
```


## 二、与原作者仓库进行拉取和推送关联
为了保证我的代码和原作者实时同步（原作者的改动我们也能拉取，我们的修改也能推送到原作者仓库），需要进行 关联。

clone 项目到本地后，进入 demo 目录，添加一个新的推送地址，取名叫 upstream（代表原作者的仓库） 。
```bash
cd ~/demo
git remote add upstream git@github.com:someone/demo.git
```

使用 `git remote -v` 查看此时有两个推送和拉取地址。
```
origin	git@github.com:username/demo.git (fetch)
origin	git@github.com:username/demo.git (push)
upstream	git@github.com:someone/demo.git (fetch)
upstream	git@github.com:someone/demo.git (push)
```
## 三、切换 dev 分支

根据原作者的说明，一般需要在 dev 分支进行修改和提交 pr。

先查看远程仓库里有哪些分支 `git branch -r`
```
  origin/HEAD -> origin/master
  origin/develop
  origin/master
  upstream/develop
  upstream/master
```


切换到 develop 分支，并跟踪远程分支。

git checkout --track origin/develop

> `--track` 参数的作用是，下次 push 的时候直接推送到与你关联的远程分支上，不用再次指定了。否则会推送到 HEAD 指定的分支上。
> 也可以直接用 `-t` 参数


当前也许你 clone 之后好几天没动代码，此时原作者仓库可能已经有变动了，如果想拉取原作者的变动，那我们可以使用 `git fetch upstream` 命令

使用 `git` 终端切换分支需要敲很多命令，推荐使用 gui 程序拉取和切换分支，比如 `sourcetree`。

## 四、修改代码并提交

```
git add -A
git commit -m “你提交的说明”
git push 
# 如果 checkout 的时候没有 -t 参数，那么 push 的时候需要指定远程分支名称 
# git push origin develop
```

## 五、填写 pr 的说明

 到 github 项目的仓库地址即可查看到有 pr 可以填写，一般需要填写为什么改动，改动了哪些地方等信息，填写完之后保存，原作者即可收到合并提交的请求，如果他同意，那么你的代码将会合并。

## 六、仅提交部分修改到上游仓库

参考[github pr提交单一或指定文件到远程仓库的方法](https://www.jeeinn.com/2019/01/631/)

## 参考文档 
- [github中origin和upstream的区别](https://blog.csdn.net/liuchaoxuan/article/details/80656145)
- [如何给开源项目贡献代码](https://gist.github.com/zxhfighter/62847a087a2a8031fbdf)
- [【翻译】如何为 Github 开源项目贡献代码？](https://github.com/shaodahong/dahong/issues/20)
- [github fork仓库发起Pull Request合入全流程](https://juejin.cn/post/6932300709987614728)
