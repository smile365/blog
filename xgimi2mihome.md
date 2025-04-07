---
title: xgimi2mihome
heading:  
date: 2025-04-07T12:53:49.491Z
tags: 
categories: ["code"]
Description:  米家控制极米投影仪
---

## 前言
入了米家的坑，折腾的越来越多。目前想实现对小爱音箱说“想看电影”的时候，自动关灯，关闭阳台纱帘，下降幕布，打开 nas 的飞牛系统，打开极米投影仪。

## 思路
咨询极米客服得知极米遥控是蓝牙的，且投影仪没接入米家。小爱音箱仅支持红外遥控。下载极米 app 后可以把手机当做遥控（手机模拟蓝牙遥控）。

极米的蓝牙遥控器其实相当于蓝牙键盘，开机键是广播数据，其他按键为连接投影仪后才能操作。所以最终目的是模拟蓝牙键盘的开机键，只要能发送开机的蓝牙广播数据就行。


**目前可行的方案如下：**
1. 买一个红外转 usb 的设备，价格 40~80￥都有。相当于把红外信号转成了 usb 键盘的一个按键。刚好小爱音箱支持红外功能。
2. iclick 小飞碟 6，支持 wifi/蓝牙/射频/红外等常见无线协议，算是大满贯设备，但价格比较贵 359￥。
3. 苹果手机可以设置快捷命令，算是 0 成本。就是比较慢，相当代替人打开极米 app，然后按「开机」按钮。
4. 对极米的蓝牙 app 进行抓包，分析蓝牙数据包，用程序模拟一个蓝牙开机的数据包广播给投影仪。用一块蓝牙芯片（比如 esp32）成本很低，10 块钱以内。
5. 改造极米遥控，使用一块米家的芯片，相当于把遥控改造后接入米家。成本差不多也是 10 块钱以内。但不想拆极米遥控器。万一遥控电路被搞坏了，就不好玩了。

## 环境
- MacBookAir（m1）
- 极米 Z6X (第五代)
- 极米 app
- 小爱音箱 pro
- vivo x60
- [Android-nRF-Connect](https://github.com/NordicSemiconductor/Android-nRF-Connect/releases)
- [Bluetooth Smart Discover](https://bluetooth-smart-discover.en.uptodown.com/android/download)
- [ Wireshark](https://www.wireshark.org/download.html)

## 步骤
1.  手机安装极米 app，测试是否可以通过手机遥控极米投影仪开机。
2.  投影仪关机，用另一个手机记录测试的时间，方便等会查找数据包。
3.  设置 --> 开发者选项 --> 启用蓝牙HCI信息手机日志，然后极米 app 点击开机。
4.  关闭蓝牙，使用命令导出蓝牙日志。
```bash
adb bugreport ~/Downloads/
# 日志文件目录在 /FS/data/misc/bluetooth/logs/ 下
```
5. 把 cfa 日志文件直接拖入到 Wireshark 进行分析。


## 参考文档
1. [小爱同学控制极米投影仪的简单方案](https://zhuanlan.zhihu.com/p/590017292)
2. [极米new Z6X接入米家](https://www.znds.com/tv-1244090-1-1.html)
3. [极米投影仪的相关 api 远程控制关机](https://www.znds.com/tv-1244116-1-1.html) 
4. [如何抓取Android手机蓝牙HCI](https://zhuanlan.zhihu.com/p/629790490)
5. [使用xposed框架实现蓝牙BLE抓包](https://github.com/albert2lyu/XposedBLE)
6. [蓝牙知识总结](https://github.com/SuperTao/Bluetooth)
7. [Android Bluetooth HCI log 详解](https://www.jianshu.com/p/73f7366161d1)


