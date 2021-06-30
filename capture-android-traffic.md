---
title: 2021年如何对安卓app抓包教程
heading: 
date: 2021-03-02T02:06:59.414Z
categories: ["code"]
tags: 
description: 'android https capture,Intercept HTTPS Traffic from Android App,Capture and decrypt HTTPS traffic from any android app,How to: Capture Android Traffic with Fiddler - Telerik,capture-android-traffic，Android 抓包 2021  '
---

APP 接收数据的过程：
网站通过私钥对数据进行加密，发送给 APP，APP 通过网址获取网站的公钥对数据进行解密。

APP 发送数据的过程：
APP 获取网站的公钥对要发送的数据进行加密，发送给网站。网站通过私钥对数据进行解密。

非 root 环境下抓取 app 包

解决 APP 验证 https 整书问题

抓包工具
- [Charles](https://www.macwk.com/soft/charles)
- [wireshark]()

方案一：
- [太极app](https://github.com/taichi-framework/TaiChi/releases) 或 [VirtualXposed](https://github.com/android-hacker/VirtualXposed/releases)
- [JustTrustMe-v0.4](https://github.com/pengwei1024/JustTrustMe/releases)
- 
说明：在 VirtualXposed 安装目标 app 和 JustTrustMe 后，与电脑在同一 wifi，并按照 Charles 配置代理即可，无需在手机上安装证书。
缺点：大部分 app 在太极中无法运行，但可以在 VirtualXposed 中运行，少部分 app 在 vx 中无法运行。


方案二：[apk-mitm](https://github.com/shroudedcode/apk-mitm)
```
sudo npm install -g apk-mitm
npx apk-mitm xiakele.apk
# 会生成 ./xiakele-patched.apk
```
缺点：可能出现无法运行、闪退

方案三：刷机



参考链接
- [抓包移动端app的https请求的流程](https://book.crifan.com/books/app_capture_package_tool_charles/website/how_capture_app/complex_https/)
- [JustTrustMe不生效](https://github.com/taichi-framework/TaiChi/issues/538)
- [Charles 配置证书](https://juejin.cn/post/6844904128104103943)
