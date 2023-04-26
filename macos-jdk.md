---
title:  macos-jdk
heading:  
date: 2022-12-30T06:07:14.246Z
tags: 
categories: ["code"]
Description:  
---

## 安装 openjdk 11
在 [jdk-archive](https://jdk.java.net/archive/) 页面下载 Mac/x64	的 tar.gz 压缩包。
```bash
$ tar -xvf openjdk-13.0.1_osx-x64_bin.tar.gz
$ sudo mv jdk-13.0.1.jdk /Library/Java/JavaVirtualMachines/

# 或者通过 brew 安装
brew install openjdk@11
```


## 安装 oracle-jdk
在 [Java SE downloads](https://www.oracle.com/java/technologies/downloads/archive/)找到所需版本，下载 [xxx-macosx-x64.dmg]（intel 芯片）(https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html) 的文件。或者[xxx-macos-aarch64_bin.dmg](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html#license-lightbox)(apple 芯片)

需要登录 Oracle 账号，这边分享一个账号，方便下载：  
账户：3028064308@qq.com
密码：OraclePassword123!



## 安装 jenv
```bash
brew install jenv
mkdir ~/.jenv/version
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
```

## 使用
```bash
 # 查看 jenv 管理的 jdk 版本
 jenv versions
 
 # 切换jdk版本有三个作用域，分别是global、local、shell。
 jenv local 11.0
 # java -version
 
```



参考文档：
- [mac安装JDK8](https://www.jianshu.com/p/26db5674d1f9)
- [jdk-archive](https://www.oracle.com/java/technologies/downloads/archive/)
- [使用 jenv 进行 JDK 版本管理](https://juejin.cn/post/7107836705771618334)