---
title: install-android-studio-on-mac 
heading: 2022年 mac 安装 Android Studio
date: 2022-01-11T12:08:36.108Z
categories: ["other"]
tags: 
description: 
---

下载[Android Studio](https://developer.android.com/studio)，根据[使用文档](https://developer.android.com/studio/install)安装和配置。


安装[gradle](https://gradle.org/install/)

使用 brew 安装
```
brew install gradle
```

或者下载二进制安装包安装
```bash
$ mkdir /usr/local/opt/gradle
$ unzip -d /usr/local/opt/gradle gradle-7.3.3-bin.zip
$ ls /usr/local/opt/gradle/gradle-7.3.3/
LICENSE  NOTICE  bin  getting-started.html  init.d  lib  medi
$ export PATH=$PATH:/usr/local/opt/gradle/gradle-7.3.3/bin
$ gradle -v
```


