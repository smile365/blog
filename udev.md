---
title:  udev
heading:
date: 2022-04-27T12:07:14.760Z
categories: ["code"]
tags: 
description: 
---

## Udev 是什么

[Udev](zh.wikipedia.org/wiki/Udev) 是一个 Linux 内核设备管理器，

udev 是一个通用的内核设备管理器。它以 udevd 守护进程的方式运行于 Linux 系统，并监听在新设备初始化或设备从系统中移除时，内核（通过netlink socket）所发出 uevent 事件。udev 提供一套匹配规则，当规则命中时，可调起用户提供的处理程序。udevadm 是此系统对应的管理命令。 


## 如何查看 udev 的日志


## udev 规则如何编写

### 规则说明

[udev 规则](http://reactivated.net/writing_udev_rules.html)存储在 `/etc/udev/rules.d/ ` 目录下，按文件名排序依次执行。以“#”开头的行被视为注释。每隔一个非空行是一条规则。规则不能跨越多行。

每条规则都应包含至少一个匹配键（==或!-）和至少一个分配键（=或+=），可以理解成 `当` 什么的时候 `执行` 什么

**匹配键可以匹配的项**：
- `KERNEL(S)`，匹配（父级）设备的内核名称
- `SUBSYSTEM(s)`，匹配（父级）设备的子系统
- `DRIVER(S)`， 匹配（父级）设备的驱动程序名称
- `ATTR(s)`， 匹配（父级）设备的属性，如：厂商代码、确切产品编号、序列号、存储容量、分区数量等。
- ACTION， 匹配设备连接状态，如：add（添加），remove（删除）。
- ENV 匹配当前环境变量
- 

**分配键：**
- NAME 创建设备名称
- SYMLINK 创建符号链接
- RUN 运行外部脚本
- GROUP 给设备分组
- OWNER 给设备分配所有者
- MODE 给设备分配读写权限
- PROGRAM 运行外部程序获取结果(%c)后给其他分配键使用
- ENV 改变环境变量
- OPTIONS 其他选项
    - all_partitions - 为块设备创建所有可能的分区，而不仅仅是最初检测到的分区
    - ignore_device - 完全忽略事件
    - last_rule - 确保后面的规则没有任何影响

### 模式匹配

可以精确匹配，udev 也可以使用像正则一样的通配符匹配：
- `*` ， 匹配任何字符，零次或多次
- `?` ， 匹配前面的字符零次或一次
- `[]` ，匹配括号中指定的任何单个字符

### 使用匹配的结果

写分配键的时候，可以用 `%K` 代替当前匹配到的 `内核名称`,如匹配设备为 /dev/sda3，那么 %K 就是 sda3。可以用 `%n` 代替当前匹配到的 `设备分区编号`， 内核编号（存储设备的分区编号），例如设备是 /dev/sda3，那么 %n 就是 3 。

## udev 规则示例

假定 `device_namer.sh` 脚本的 输出由设备名称、符号链接组成。可以通过 %c{N} 取出输出的第 N 部分：

KERNEL=="hda", PROGRAM="/bin/device_namer %k", NAME="%c{1}", SYMLINK+="%c{2}"



## 外部 .sh 等 shell 脚本不执行的原因

执行/usr/bin/my_program 时，udev 环境的各个部分都可用作环境变量，包括SUBSYSTEM等键值。您还可以使用ACTION环境变量来检测设备是连接还是断开 - ACTION 将分别是“添加”或“删除”。

udev 不会在任何活动终端上运行这些程序，也不会在 shell 的上下文中执行它们。确保您的程序被标记为可执行，如果它是一个 shell 脚本，请确保它以适当的shebang（例如#!/bin/sh）开头，并且不要期望任何标准输出出现在您的终端上。


