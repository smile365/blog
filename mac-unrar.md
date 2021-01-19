---
title:  mac-unrar
heading: mac-unrar
date: 2021-01-19T09:10:32.561Z
categories: ["code"]
tags: 
description:  mac 系统 解压 rar 文件。
---


安装 unrar
```bash
brew install unrar
```

解压文件
```bash
unrar x file.rar /path
# 默认解压到执行当前命令的目录 
```

每次都容易敲错命令，目标文件和路径老是记反了，有时把 x 输成 -x，崩溃。

解决办法如下：


编辑用户环境的命令

增加一个别名

