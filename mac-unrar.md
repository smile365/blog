---
title:  mac 系统不安装解压软件解压 rar 文件教程
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


编辑用户环境的命令`vim ~/.bash_profile`，增加一个别名
```bash
alias unrar="unrar x "
```
此时用命令 `unrar 文件名.rar` 即可解压文件。此方式解压到了运行 shell 命令的目录，这怎么能忍，继续改造。

因为 alias 不支持获取参数，我们可以通过 shell 的 function 实现参数获取。编辑用户环境文件 `vim ~/.bash_profile` 增加一个方法如下：
```bash
rar() {
    unrar x "$1" "${1%/*}"
}
```

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1611049793203.png)

保存后重新打开 shell。

之后使用就比较方便了，先 `command c` 直接复制文件路径，然后新打开一个 shell 可以用 `rar` 解压文件，此时不用输入解压目录即可解压到文件所在的目录，而不是 shell 的运行目录。
```bash
rar /Users/songyangcong/Downloads/express_sample.rar
```

另外，使用alias也可以设置应用程序的别名，方便在terminal打开应用程序，如
```bash
# 打开 Sublime Text
alias st="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
```

