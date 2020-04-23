---
title:  git从远程仓库的恢复已经删除的文件
heading: git恢复被删除的文件
date: 2020-04-23T05:16:32.739Z
categories: ["code"]
tags: ["git恢复被删除的文件"]
description: git recover deleted file from origin branch
---

使用命令查看工作区情况`git status`：
```bash
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

发现工作区是干净的，查看最近2次提交`git log -2`：
```bash
commit e262899fc41bd8277bb2bb0efc81f6b7c03faa3a (HEAD -> master, origin/master, origin/HEAD)
Author: 本草洋葱 <sxy9103@qq.com>
Date:   Thu Apr 23 10:54:32 2020 +0800

    删除文件 //mac-xattr.md

commit fa23030b59030d7ec4562b923afafd4e4817652e
Author: 本草洋葱 <sxy9103@qq.com>
Date:   Wed Apr 22 12:59:01 2020 +0800

    创建文件 //mac-xattr.md
```

想恢复文件mac-xattr.md，所以`git checkout e262899 mac-xattr.md`:
```bash
error: pathspec 'mac-xattr.md' did not match any file(s) known to git
```

提示说git没有找到匹配的任何文件。

这个版本号e262899里已经删除了文件mac-xattr.md，所以肯定找不到。我们需要用未删除之前的版本号fa23030来恢复，所以是`git checkout fa23030 mac-xattr.md`，敲完没有提示错误表示已经恢复成功。

使用`git status`查看
```bash
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	new file:   mac-xattr.md
```

发现又多了这个文件，而且是新的。`git checkout commit_id file`这个命令的意思是从含有该文件的旧版本号里把该文件拿出来，放到现版本里，版本号不改变。
`git reset --hard commit_id`是把记录的头heard回退到commit_id这个版本号。reset命令要慎用，类似于恢复出厂设置。

然后继续提交到远程分支即可
```bash
git add .
git commit -m "restore file mac-xattr.md"
git pull
git push
```

参考 

- [可能是目前为止最好的git教程](https://learngitbranching.js.org/?locale=zh_CN)