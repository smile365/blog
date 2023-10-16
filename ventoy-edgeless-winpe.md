---
title: ventoy-edgeless-winpe
heading: 
date: 2022-04-29T10:56:08.974Z
categories: ["other"]
tags: 
description: winPE
---

## 前言
经常需要装机，可以通过 [ventoy](https://wiki.edgeless.top/v2/guide/burn_manual.html) 工具来制作一个万能的系统安装 u 盘。
只需要把 iso 镜像文件拷贝进入到 u 盘里，从 u 盘安装系统时，ventoy 会扫描 U 盘里的所有 iso 系统文件，以供选择进行安装。
然后把 edgeless 这款 winPE 工具烧录进 u 盘，就成为一个安装系统和维护系统的万能 U 盘。


## 制作 U 盘启动的 PE 或工具
- [ventoy](https://www.ventoy.net/cn/index.html)，u 盘烧录工具
- [edgeless](https://home.edgeless.top/)，强大且优雅无广告半开源的 pe 工具
- [Hikari PE](https://hikaripe-sc.hikaricalyx.com/)
- 优启通
- 微PE
- 深度
- 一个不知道叫什么好的U盘启动集
- 老毛桃
- 大白菜


## 安装 ventoy 到 u 盘
到网站查最新版 ventoy 链接 [ventoy-xxx-linux.tar.gz](https://gitee.com/longpanda/Ventoy/releases/)，然后安装。
```
wget https://gitee.com/longpanda/Ventoy/attach_files/1047852/download/ventoy-1.0.74-linux.tar.gz
tar -xzvf *.tar.gz

# 插入 u 盘，查看挂载的路径
lsblk 
# 是否挂载
df -h
# 取消挂载
umount /dev/sdc1
# 写入 u 盘
cd ventoy*
# 依赖 mkfs.vfat 命令
apt install dosfstools
sudo /bin/bash Ventoy2Disk.sh -i /dev/sdc
```

ventoy 安装完成后，会格式化成[两个分区](https://www.ventoy.net/cn/doc_disk_layout.html)
```bash
# 查看 u 盘分区
lsblk 
```


## 写入 Edgeless 到 U 盘

edgeless 提供 Windows 下的 U 盘启动制作工具， Linux 需要通过 ventoy Linux工具来制作，可参考官方教程 [如何手动写入Edgeless到U盘](https://wiki.edgeless.top/v2/guide/burn_manual.html)。


1. 在 U 盘内新建一个 ventoy 文件夹，下载 [ventoy_wimboot.img](https://pineapple.edgeless.top/api/v2/info/ventoy_plugin_addr) 到此文件夹内。


2. 下载 [Edgeless_xxxx_xxx.iso](https://pineapple.edgeless.top/api/v2/info/iso_add)，将其中的 sources/boot.wim 复制到 U 盘根目录，然后将其重命名为 Edgeless_xxxx_xxx.wim，复制其中的 Edgeless 文件夹到 U 盘根目录

3. 如果需要使用插件， 将 [edgeless](https://zfile.edgeless.top/%E6%8F%92%E4%BB%B6%E5%8C%85) 插件包放置在 U盘:\Edgeless\Resource 目录下即可.



##  mac osx 下制作 ventoy 启动盘
[ventoy](https://github.com/ventoy/Ventoy/issues/3) 不支持 mac 系统，会报错，开发者近期也不打算支持。
```
chmod: -R: No such file or directory
./tool/ventoy_lib.sh: line 55: ./tool/x86_64/hexdump: cannot execute binary file
```

可以通过 VirtualBox 安装一个 Linux 虚拟机来实现。

- 下载 [ventoy-xxx-livecd.iso](https://ventoy.net/en/download.html) 
- 下载 [VirtualBox OS X hosts](https://www.virtualbox.org/wiki/Downloads)
- 下载 [ VirtualBox Extension Pack](https://download.virtualbox.org/virtualbox/6.1.38/Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack)

### 安装 VirtualBox

双击 VirtualBox-6.1.38-153438-OSX.dmg 进行安装，之后点击 VirtualBox -> 偏好设置 -> 扩展 -> 添加扩展，选择刚刚下载的扩展包安装，以便让 VirtualBox 的虚拟机读取宿主机的 USB 设备。

### 使用 ventoy 制作 u 盘启动
1. 点击新建，依次填写名称/文件夹位置/类型/版本/内存/磁盘，如： ventoy-livecd、linux、other linux(64)、2048、不添加虚拟磁盘
2. 点击刚刚创建的虚拟机 设置 -> 存储 -> 分配光驱 -> 选择刚刚下载的文件 ventoy-xxx-livecd.iso
3. 点击 端口 -> usb 设备 -> 启用 usb 控制器 -> usb 3.0 ， 然后点击启动。
4. 启动后点击右下角的 usb 图标，挂载需要制作的 u 盘，然后点击安装即可。

> 注：如果出现 `Kernel driver not installed (rc=-1908) ` 错误，可按照[教程](https://stackoverflow.com/questions/65149373/kernel-driver-not-installed-rc-1908-getting-errors-in-macos-big-sur-11-0-1)解决



## 参考文档
- [u 盘工具箱](https://post.smzdm.com/p/a25dx0rp/)
