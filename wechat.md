---
title: 微信pc端和移动端多开的几种方法 
date: 2018-08-10T06:32:54.129Z
tags: ["微信多开"]
series: ["blog"]
categories: ["code"]
description: 微信多开
---


## 微信数据备份
### mac 端微信聊天记录备份

每次备份都会追加到原来的文件上，建议每次备份后都删除备份文件。

```shell
> cd ~/Library/Containers/com.tencent.xinWeChat/Data/Library/Application\ Support/com.tencent.xinWeChat/2.0b4.0.9/Backup

# 压缩并删除
zip -rm smile8365-$(date "+%y%m%d-%H%M").zip .

# 移动到下载
mv *.zip ~/Downloads/

# 还原unzip test.zip -d /dir

# 如果登录了两个微信号，可以使用微信id来备份 zip -r we1.zip xxxx (我的是1eb36d0ea2f1dbc5d9e9976637facc10)
# 仅压缩 微信号-开始-结束
> zip -r smile8365-181025-190108.zip . 
# 压缩并删除
> zip -rm smile8365-181025-190108.zip .
# 获取时间
# time=$(date "+%y%m%d-%H%M")

```

### 相册备份  
Linux 下可以使用 sync  命令同步仅不存在的文件，存在的自动跳过。
但 Android 的 adb shell 没有类似 Linux 下的 sync 命令，可以通过一个小哥写的[ python 脚本](https://github.com/google/adb-sync) 实现这个功能。实现的原理是，同步前做一次检查。



```bash
cd ~/project/adb-sync
mkdir -p ~/Downloads/DCIM$(date "+%y%m%d")
./adb-sync --reverse /sdcard/DCIM/ ~/Downloads/DCIM$(date "+%y%m%d")/

# 也可以使用正则匹配符
# ./adb-sync --reverse /sdcard/DCIM/ Camera/VID_2021092*.mp4 ~/Downloads/mp4/
```

### 使用条件备份多个文件
```bash
# 所有 mp4 文件
# 先 cd 到需要保存的文件夹下
adb shell 'ls /sdcard/DCIM/Camera/*.mp4' | tr -d '\r' | xargs -n1 adb pull
```

### 使用adb 备份 app

```bash
mkdir backup
cd backup
adb pull /sdcard/DCIM .
mkdir apks
cd apks
for i in $(adb shell pm list packages | awk -F':' '{print $2}'); do adb pull "$(adb shell pm path $i | awk -F':' '{print $2}')"; mv base.apk $i.apk 2&> /dev/null ;done
```



## mac 微信多开

1. 使用命令

```
# 不能关闭命令窗口
open -n /Applications/WeChat.app/Contents/MacOS/WeChat

# 可关闭
nohup /Applications/WeChat.app/Contents/MacOS/WeChat > /dev/null 2>&1 &
```
-n参数表示Open a new instance of the application(s) even if one is already running，也就是开启另外一个实例，哪怕这个程序已经再运行了。

2. 安装时保留两者

重新下载一个 mac 端的微信按照包，安装时选择“*保留两者*”，如果选替换，会把之前的微信给覆盖掉

#### mac 微信防撤回（可多开）

使用 mac 的微信扩展插件

可以通过[WeChatExtension](https://github.com/MustangYM/WeChatExtension-ForMac)插件实现多开，它的功能比较多，除了多开，还有防撤回，换主题等功能。有人制作了一键安装脚本回[Oh-My-WeChat](https://github.com/lmk123/oh-my-wechat)，安装方法如下：
```bash
git clone https://github.com/lmk123/oh-my-wechat.git
cd oh-my-wechat
/bin/bash main.sh
```



## Windows 微信多开

1. 使用Sandboxie

Sandboxie 是一款可提供虚拟环境的工具，按照在虚拟环境里的软件互不干扰，也就实现了 windows 应用程序的多开。

下载，点击微信右键，再创建一个容器




参考  
- [Mac微信聊天记录备份位置](https://www.zhihu.com/question/50022284/answer/123677875)
- [接触禁止复制](https://zhuanlan.zhihu.com/p/32155254)
- [应用隔离](https://www.zhihu.com/question/25395183/answer/79937376)
- [mac 微信多开](https://www.zhihu.com/question/60153484)