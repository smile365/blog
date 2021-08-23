---
title:  简易的git命令入门教程
heading:
date: 2019-12-04T06:24:34.427Z
draft: true
categories: ["code","life","tools","read"]
tags: 
description: 
---

Git 全局设置:

```bash
git config --global user.name "本草洋葱"
git config --global user.email "sxy9103@gmail.com"
```

创建 git 仓库:
```bash
mkdir mobilectl
cd mobilectl
git init
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:smile365/mblog.git
git push -u origin master
```

已有仓库?
```bash
cd existing_git_repo
git remote add origin git@github.com:smile365/mblog.git
git push -u origin master
```



参考文献
- [git-如何修复 master 分支的bug](https://www.liaoxuefeng.com/wiki/896043488029600/900388704535136)
- [git-如何放弃未push的commit](https://www.liaoxuefeng.com/wiki/896043488029600/897013573512192)
