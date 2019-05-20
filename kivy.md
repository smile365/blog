---
title:  kivy的安装与使用
date: 2019-05-17T04:53:01.726Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

**安装kivy **
```shell

pip install kivy
```

**开发并测试**
```python
import kivy
from kivy.app import App
from kivy.uix.label import Label

class MyApp(App):

    def build(self):
        return Label(text='Hello world')

if __name__ == '__main__':
    MyApp().run()
```

**构建成apk**
构建所需的环境比较复杂，官方提供了打包好的虚拟镜像。下载[Buildozer.7z](https://kivy.org/downloads/android/)导入到vmware或者virtualbox进行构建。     

buildozer -v android debug

需要下载sdk，建议配置国内[Proxy Server](http://mirrors.zzu.edu.cn/wiki/android.html)

参考  
- [kivy-downloads](https://kivy.org/downloads/)
- [kivy-doc](https://kivy.org/doc/stable/gettingstarted/intro.html#)
- [linux-android-sdk-Proxy](https://stackoverflow.com/questions/10634202/android-sdk-manager-proxy-settings-in-linux)
- [android-sdk-mirros](https://github.com/renfeng/android-repository/wiki/Known-Mirrors)