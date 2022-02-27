---
title:  Kali-Linux安全渗透教程
date: 2019-01-10T07:32:18.188Z
categories: ["code"]
draft: true
description:
---

## 在 mac os 下制作 kali Linux usb 启动盘（live）

> 📝注：kali-live 启动后无法使用 mac 的触摸板和自带键盘，需要自备外接键盘。（mac 的键盘和触摸板是独有的硬件，只有苹果官方有驱动，kali 没有驱动，因此无法使用，安装完成也无法使用）

下载 [kali iso ](https://www.kali.org/get-kali/#kali-live) 并用 [etcher](https://www.balena.io/etcher/) 烧录到 u 盘。也可以用[命令模式](https://www.kali.org/docs/usb/live-usb-install-with-mac/) 。

mac os 因为[启动安全性实用工具](https://support.apple.com/zh-cn/HT208198)，无法从 u 盘启动。可以参考[教程](https://zhuanlan.zhihu.com/p/110385099)修改。


打开设备电源，然后在看到 Apple 标志后立即按住 Command (⌘)-R 键。

修改“启动安全性实用工具”的设置项为：
- 无安全性
- 外部启动

关机重启，立即按住 Option 键，可调出启动菜单。









参考  
- [Kali-Linux安全渗透教程](https://wizardforcel.gitbooks.io/daxueba-kali-linux-tutorial/content/)
- [Android远控DroidJack+SpyNote](https://zhuanlan.zhihu.com/p/26516555)
- [手机木马远程控制复现](https://blog.csdn.net/qq_29647709/article/details/79530468)
- [msfvenom 介绍](http://www.ko0zh1.cc/2017/07/27/msfvenom%E8%AF%A6%E8%A7%A3/)
- [kali-linux-msfvenom](https://zhuanlan.zhihu.com/p/27008235)
- [MAC如何修改启动安全性实用工具-禁止或允许其他磁盘启动其他系统](https://www.cnblogs.com/PowerTips/p/12158110.html)
