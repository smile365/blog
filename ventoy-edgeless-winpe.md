---
title: ventoy-edgeless-winpe
heading: 
date: 2022-04-29T10:56:08.974Z
categories: ["other"]
tags: 
description: winPE
---



[u 盘工具箱](https://post.smzdm.com/p/a25dx0rp/)

## 常见的 PE 系统
- [ventoy](https://www.ventoy.net/cn/index.html)
- [edgeless](https://home.edgeless.top/)
- [Hikari PE](https://hikaripe-sc.hikaricalyx.com/)
- 优启通
- 微PE
- 深度
- 一个不知道叫什么好的U盘启动集
- 老毛桃
- 大白菜


## mac osx 下制作 edgeless 

edgeless 提供 Windows 下的 U 盘自动制作工具，mac os 或 Linux 需要通过
[ventoy Linux工具](https://wiki.edgeless.top/v2/guide/burn_manual.html)来制作。

1. 下载依赖文件
从以下链接下载依赖文件：

- [ventoy-xxx-linux.tar.gz](https://gitee.com/longpanda/Ventoy/releases/)
- [ventoy wim插件](https://pineapple.edgeless.top/api/v2/info/ventoy_plugin_addr)
- [Edgeless ISO镜像](https://pineapple.edgeless.top/api/v2/info/iso_addr)

解压 ventoy-xxx-linux.tar.gz

2. 安装Ventoy

```
# 1. 插入 u 盘，查看挂载的路径
df -h
# /dev/disk2s1    14Gi  5.8Gi  8.5Gi    41%     100    8873624    0%   /Volumes/U深度U盘

# 2. 安装
ventoy2disk.sh -i /dev/disk2s1
```



## mac osx 下制作 ventoy
[ventoy](https://github.com/ventoy/Ventoy/issues/3) 不支持 mac 系统，会报错，开发者也不打算支持。
```
chmod: -R: No such file or directory
./tool/ventoy_lib.sh: line 55: ./tool/x86_64/hexdump: cannot execute binary file
```


## linux 下制作 
下载[ventoy-linux.tar.gz
](https://gitee.com/longpanda/Ventoy/releases/)
```
wget https://gitee.com/longpanda/Ventoy/attach_files/1047852/download/ventoy-1.0.74-linux.tar.gz
tar -xzvf *.tar.gz

# 查看磁盘
lsblk 
# 是否挂载
df -h
# 取消挂载
umount /dev/sdc1
# 写入 u 盘
sudo /bin/bash Ventoy2Disk.sh -i /dev/sdc
```



