---
title: mac安装java11
heading: jdk-8u212-macosx-x64.dmg 下载
date: 2020-01-10T03:10:28.254Z
categories: ["code"]
draft: true
tags: 
description: 
---

不需要注册即可下载jdk的网站有如下几个：
- [cn.azul.com](https://cn.azul.com/downloads/zulu-community/?&architecture=x86-64-bit&package=jdk#)
- [github](https://github.com/frekele/oracle-java/releases)
- [csdn](https://download.csdn.net/download/tan3739/11143317)
- [baidu云](https://blog.csdn.net/weixin_40990991/article/details/99831728)


也可以使用brew安装jdk11，[可参考教程](https://stackoverflow.com/questions/52524112/how-do-i-install-java-on-mac-osx-allowing-version-switching/52524114?r=SearchResults#52524114)
```bash
# 添加源
brew tap homebrew/cask-versions
# 搜索可安装的版本
brew search java  
# 将要安装的版本详细信息
brew info java
# 安装最新版本
# brew install java
# 安装特定版本
brew install java11
```

> 注：brew安装的版本为oracle发行的openjdk版本，与商业版oracle-jdk有所不同。open版本不提供安全更新和漏洞修复支持。

安装maven之前需要安装java

```bash
brew install maven
```


