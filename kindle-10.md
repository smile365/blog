---
title: kindle-kpw4 最新版越狱及安装 MRPI、KUAL、KOReader
heading:  
date: 2025-03-14T13:57:25.462Z
tags: 
categories: ["code"]
Description:   Kindle Paperwhite 4 (KPW4)
---


## 前言
kindle 退出中国，虽然可以通过切换登录账号到美亚地区使用，但还是想切换成微信读书。主要是微信读书有排行榜，读书更有动力。所以打算把 kindle 刷机成 Android 系统，然后安装微信读书使用。路径倒也简单： 越狱 Kindle > 安装 MRPI 和 KUAL > 安装 uboot > 刷入 Android > 安装微信读书墨水屏版。


## 操作环境
- [Kindle Paperwhite 4](https://bookfere.com/post/1145.html) (KPW4，第 10 代)，固件版本（5.17.1.0.3）
- MacBook Air m2
- [SendToKindleForMac](https://www.amazon.com/gp/help/customer/display.html/ref=hp_Connect_USB_MTP?nodeId=TCUBEdEkbIhK07ysFu) 
-  [WinterBreak](https://github.com/KindleModding/WinterBreak/releases/latest) v1.5.0
-  [KindleModdingHotfix](https://github.com/KindleModding/Hotfix) v1.13.0


## 准备
1. Kindle 必须注册了亚马逊账号并登录到美亚等其他地区。
先网页上登录 亚马逊账号，然后切换到美国。kindle 恢复出厂设置，先选择英语登录。登录成功后查看 设置 我的账户，若发送到 kindle 的电子邮箱是 .com 结尾即可。
2. 确保 kindle 连接的 wifi 可以访问美亚地区的商店（正常访问一遍 Kindle 商店，确保看到首页）。
3. 下载 [WinterBreak](https://github.com/KindleModding/WinterBreak/releases/latest) 并解压，进入目录后确保能看到隐藏文件夹 **.active_content_sandbox** （快捷键 Command + Shift + .），删除 readme.md 和 .git开头的文件。
4. 下载  [KindleModdingHotfix](https://github.com/KindleModding/Hotfix) 并解压
5.  下载 [SendToKindleForMac](https://www.amazon.com/gp/help/customer/display.html/ref=hp_Connect_USB_MTP?nodeId=TCUBEdEkbIhK07ysFu) 并安装



## 一、越狱

严格按照步骤操作。不要使用 cp 等命令，有可能会忽略隐藏文件。可以多试几次。

1. 用 USB 数据线将 Kindle 设备连接到电脑；将之前解压得到的文件和文件夹拷贝到根目录（如果提示已存在，直接覆盖）；再次确认 Kindle 根目录有以下 5 个文件夹和文件；
	- .active_content_sandbox
	- apps
	- jb.sh
	- mesquito
	- patchedUks.sqsh
2. 弹出 Kindle 磁盘并拔掉 USB 数据线；重启 Kindle 设备；
3. 进入 Kindle 后点击商店图标：
4. 按提示关闭飞行模式
5. 正常情况下会看到Kindle WinterBreak 页面；点击 WinterBreak；
6. 越狱完毕。

## 二、安装补丁

热修复补丁的具体安装步骤如下：

1.  用 USB 数据线将你的 Kindle 连接到电脑；
2.  将下载到的 Update_hotfix_universal.bin 文件拷贝到 Kindle 根目录；
3.  弹出 Kindle 磁盘并断开 USB 数据线连接；
4.  点击 `设置` > `更新您的 Kindle` 安装热修复补丁
5.  等待 Kindle 自动重新启动；
6.  进入 Kindle 后点击名为“Run Hotfix”的电子书。

> 注：以上步骤全部操作完成后，就可以将上述步骤中拷贝到 Kindle 越狱文件全部删除掉了，尤其是要删除 .active_content_sandbox 这个文件夹，以免无法正常访问 Kindle 商店。

## 三、安装 MRPI、KUAL、KOReader
MobileRead Package Installer（MRPI），用来安装插件。KUAL (即 Kindle Unified Application Launcher)，插件启动器。

  1. 下载 [MRPI](https://fw.notmarek.com/khf/#:~:text=MRPI%20%2D%20modified%20to%20support%20HF)、[KUAL](https://storage.gra.cloud.ovh.net/v1/AUTH_2ac4bfee353948ec8ea7fd1710574097/mr-public/KUAL/KUAL-f190a38-20240104.tar.xz)、[KOReader](https://fw.notmarek.com/khf/koreader/)；
  2. 把 Update_KUALBooklet_xxxx_install.bin 拷贝到 MRPI 的 mrpackages 文件夹中；
  3. 把文件夹 extensions 中的内容拷贝到 MRPI 的 mrpackages 文件夹中；
  4. 把文件 koreader 拷贝到 MRPI 目录下(与 mrpackages 同一目录)；
  5. 把 MRPI 目录下的所有文件夹拷贝到 kindle 根目录（拷贝前注意确认 kindle 根目录没有 extensions 文件夹）。
  6. 在 kindle 的搜索栏输入 `;log mrpi` 安装以上插件，安装完成后会自动重启，重启后会出现 KUAL。

> 注意，如果 kindle 根目录已有 extensions 这个文件夹，可以只把解压得到的 extensions 文件夹中的内容拷贝到 Kindle 根目录原有的 extensions 文件夹内，以避免原文件夹内的其它文件被删除。

## 四、安装 uboot 刷入 Android

结果搞到这里的时候发现找不到适合我 Kindle 型号的 CracKDroid。（作者分享的链接都失效了，哭死😭，就此作罢）。有人找到了 CracKDroid 可以分享给我下不？

## 参考文档

- [2025 Kindle 越狱教程：不限 Kindle 型号，不限固件版本](https://bookfere.com/post/1145.html#google_vignette)
- [Kindle 越狱插件 MRPI\KUAL\Koreader 等安装](https://bookfere.com/post/311.html)
- [KOReader：适用于 Kindle 的全能第三方电子书阅读器插件](https://bookfere.com/post/39.html)
- [如何在 Kindle 上优雅的使用微信阅读](https://donutblogs.com/posts/CracKDroid)

