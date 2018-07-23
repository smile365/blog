---
title:  mac 安装java环境jdk
date: 2018-07-16T08:08:01.613Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

先安装[homebrew](https://brew.sh/index_zh-cn)


使用brew安装jdk
`brew cask install java8`
> 注：目前Android sdk最高支持到java8使用9或10会报错

brew install maven
brew install gradle
brew cask install android-sdk

安装idea
`brew cask install intellij-idea`

sdkmanger --help 查看帮助

使用镜像更新Android sdk

sdkmanager "platforms;android-19"  --proxy_host="mirrors.neusoft.edu.cn"

sdkmanager --list --no_https --proxy=http --proxy_host=mirrors.dormforce.net --proxy_port=80

sdkmanager "platforms;android-19" --no_https --proxy=http --proxy_host=mirrors.dormforce.net --proxy_port=80

sdkmanager --proxy_host="mirrors.neusoft.edu.cn" "platforms;android-19"

    --proxy=<http | socks>: Connect via a proxy of the given type.

    --proxy_host=<IP or DNS address>: IP or DNS address of the proxy to use.

    --proxy_port=<port #>: Proxy port to connect to.

    --verbose: Enable verbose output.

参考
- [Mac-Setup-Guide4OCD](https://github.com/macdao/ocds-guide-to-setting-up-mac)
- [brew和brew-cask的区别](https://www.zhihu.com/question/22624898)
- [idea-android-brew-mac](https://www.soupwaylee.com/2017/09/02/android-setup.html)
