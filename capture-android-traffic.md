---
title: 2021年如何对安卓app抓包教程
heading: 
date: 2021-03-02T02:06:59.414Z
categories: ["code"]
tags: 
description: 'android https capture,Intercept HTTPS Traffic from Android App,Capture and decrypt HTTPS traffic from any android app,How to: Capture Android Traffic with Fiddler - Telerik,capture-android-traffic，Android 抓包 2021  '
---

## 前言

对 Android app 抓包，主要解决 APP 验证 https 整书问题。

可能用到的抓包工具
- [Charles](https://www.macwk.com/soft/charles)
- [wireshark]()


## 非 root 环境

### 方案 1：把需要抓包的 app 装到一个虚拟环境。

工具
- [太极app](https://github.com/taichi-framework/TaiChi/releases) 或 [VirtualXposed](https://github.com/android-hacker/VirtualXposed/releases)
- [JustTrustMe-v0.4](https://github.com/pengwei1024/JustTrustMe/releases)
 
说明：在 VirtualXposed 安装目标 app 和 JustTrustMe 后，与电脑在同一 wifi，并按照 Charles 配置代理即可，无需在手机上安装证书。
缺点：大部分 app 在太极中无法运行，但可以在 VirtualXposed 中运行，少部分 app 在 vx 中无法运行。


### 方案2：逆向 app，去掉 https 验证 

工具
：[apk-mitm](https://github.com/shroudedcode/apk-mitm)
```
sudo npm install -g apk-mitm
npx apk-mitm xiakele.apk
# 会生成 ./xiakele-patched.apk
```
缺点：可能出现无法运行、闪退


## root 环境

root 手机应该是终极解决方案，一切无法抓包的问题都迎刃而解。



参考链接
- [抓包移动端app的https请求的流程](https://book.crifan.com/books/app_capture_package_tool_charles/website/how_capture_app/complex_https/)
- [JustTrustMe不生效](https://github.com/taichi-framework/TaiChi/issues/538)
- [Charles 配置证书](https://juejin.cn/post/6844904128104103943)
