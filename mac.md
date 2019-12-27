---
title: 新手mac配置指南
date: 2018-07-25T02:18:57.330Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

[安装brew](https://brew.sh/index_zh-cn)

用来安装非gui程序。

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


安装[Homebrew Cask](https://github.com/Homebrew/homebrew-cask)

用来安装gui程序。
> 安装完最新版Homebrew自带Homebrew Cask，或者执行`brew cask`命令自动安装

测试

```bash
brew -v

#显示如下
#Homebrew 2.2.2
#Homebrew/homebrew-core (git revision c78f; last commit 2019-12-26)
#Homebrew/homebrew-cask (git revision 7d57; last commit 2019-12-27)
```

使用[Homebrew镜像](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)

```bash
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git

brew update

echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile
```



python3

sublimetext

git



[Mac微信2.0聊天记录备份路径](https://www.zhihu.com/question/50022284):`~/Library/Containers/com.tencent.xinWeChat/Data/Library/Application\  Support/com.tencent.xinWeChat/2.0b4.0.9/Backup`

压缩文件：`zip -r smile8365-20181029.zip .`
浏览器刷新：`command+R`
强制刷新： `command+shift+R`

在终端中使用sublime


参考
- [给alias的命令传递自定义参数](https://blog.csdn.net/zhangxinrun/article/details/5709940)
- [在终端中使用sublime](https://www.jianshu.com/p/592a5ede266f)
- [中科大brew镜像](https://lug.ustc.edu.cn/wiki/mirrors/help/brew.git)