---
title:  简易的git命令入门教程
heading:
date: 2019-12-04T06:24:34.427Z
categories: ["code"]
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

如何修复 master 分支的 bug 并应用到dev分支
```bash
# 1.切换到master分支
git checkout master
# 2.从masther创建一个修复分支名叫 fix-some-thing
git checkout -b fix-some-thing
# 3.做修复工作
# do some thing
# 4.提交修复到 fix-some-thing
git commit -m "fix: fix content"
# 5.切换到master分支
git switch master
# 6.把fix-some-thing合并到master分支
git merge --no-ff -m "fix: bug fix from fix-some-thing" fix-some-thing
# 7.切换到dev分支
git checkout devolop
# 7.查找第四步的 commit id 为 4c805e2，把第四步的修改同步到dev分支。
git cherry-pick 4c805e2
```

>注：Cherry pick 支持一次转移多个提交。`git cherry-pick <HashA> <HashB>`
或者转移多次连续的提交 `git cherry-pick A^..B `

也可以直接在 dev 分支上修复 bug ，然后切换到 master 分支，通过 `git cherry-pick` 命令把修改同步到 master 分支。


参考文献: 
- [git-如何修复 master 分支的bug](https://www.liaoxuefeng.com/wiki/896043488029600/900388704535136)
- [git-如何放弃未push的commit](https://www.liaoxuefeng.com/wiki/896043488029600/897013573512192)
- [git cherry-pick 教程](https://www.ruanyifeng.com/blog/2020/04/git-cherry-pick.html)

