---
title:  sealos
heading:
date: 2022-11-02T02:35:11.591Z
categories: ["code"]
tags: 
description:  sealos 安装和使用教程
---
## 前言
[sealos](https://www.sealos.io/zh-Hans/docs/getting-started/prerequisites) 可以快速安装 k8s ，管理集群也非常容易。刚好最近需要调研 [vanus](https://docs.linkall.com/introduction/what-is-vanus) ，以下是用 sealos 来安装 vanus 的过程。

环境说明：
- debian 11（bullseye）
- 




## 错误解决

1. xxx
> error Applied to cluster error: failed to run checker: checker: failed to reverse timestamp /bin/bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)1667360958

解决过程：
```bash
# 配置时区
timedatectl list-timezones |grep Shanghai
timedatectl set-timezone Asia/Shanghai
timedatectl

apt install -y locales locales-all r-base
```


2. CGROUPS 检查项缺失
>missing required cgroups: cpu
CGROUPS_CPU: missing
CGROUPS_BLKIO: missing
```bash

解决过程：
```
apt install -y vim 
vim /etc/default/grub
GRUB_CMDLINE_LINUX="cgroup_enable=cpu"

vim /boot/cmdline.txt 
cgroup_enable=cpu 
cgroup_cpu=1
```
