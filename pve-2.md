---
title: pve-2
heading:  
date: 2023-02-12T08:13:02.861Z
categories: ["code"]
tags: 
description:  pve 系列教程
---

## usb 安装 pve

## 创建虚拟机
- debian
- windows 11
- alpine
- xxx

## 虚拟机磁盘类型介绍
 IDE、SATA、VirtIO、Block SCSI 
IDE 和 Block SCSI  性能低下不推荐，如果需要使用硬盘直通则使用 SATA 否则推荐使用 VirtIO



## 使用模板创建虚拟机

## 给虚拟机挂载超过 2T 的磁盘
参考[fdisk到底支不支持2T以上容量的硬盘分区](https://steemit.com/cn/@oflyhigh/-fdisk2t-2019-11-05)
```bash
root@debian11:~/docker/nas# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda      8:0    0  128G  0 disk 
├─sda1   8:1    0  127G  0 part /
├─sda2   8:2    0    1K  0 part 
└─sda5   8:5    0  975M  0 part [SWAP]
sdb      8:16   0    4T  0 disk 
```

sdb 为新增的磁盘
```bash
fdisk /dev/sdb
# 依次输入
m # 提示
g # 创建 GPT 类型的分区表（默认是 dos 类型，dos 类型最大支持 2T）
p # 打印分区表信息
n # 创建分区
... # 一路默认（回车）
w # 保存
```

挂载到指定目录，参考[Linux配置硬盘自动挂载](https://www.jianshu.com/p/336758411dbf)
```bash
# 格式化分区
mkfs -t ext4 /dev/sdb1
# 创建需要挂载的目录
mkdir /share
# 挂载
mount /dev/sdb1 /share
# 检查是否挂载成功 
df -h

# 开机自动挂载 
echo /dev/sdb1 /share ext4 defaults 0 0 >> /etc/fstab
# 0 0 表示是否检查磁盘 默认为 0
```



## usb 设备直通

## 网卡直通
参考
- [PVE设置显卡直通](https://www.wangsansan.com/archives/181/)
- [硬件虚拟化 显卡直通](https://www.wangsansan.com/archives/181/)
- [显卡直通](https://github.com/firemakergk/aquar-build-helper/blob/master/details/pve%E8%99%9A%E6%8B%9F%E6%9C%BA%E8%AE%BE%E7%BD%AE%E5%8F%8A%E7%8B%AC%E6%98%BE%E7%9B%B4%E9%80%9A.md#%E5%87%86%E5%A4%87)
- [intel 虚拟化 VT-d VT-x VT-c 有什么区别](https://www.d3tt.com/view/111)
- [pve虚拟机显卡直通](https://blog.timzhong.top/2020/09/27/pve-direct-pcie/)

## 证书


## zfs 

## Ceph

## 如何提高 pve 虚拟机的读写性能


## 参考文档
- [Cockpit - 基于 Web 的 Linux 管理工具](https://www.hangge.com/blog/cache/detail_3024.html)
- [XFS 文件系统简介](https://www.cnblogs.com/orange-CC/p/12711078.html)
- [分布式存储 Ceph](https://www.infoq.cn/article/brjtisyrudhgec4odexh)
- [ pve 开启分布式存储](https://www.cnblogs.com/varden/p/15209401.html)
- [Proxmox Virtual Environment 介绍 ](https://www.cnblogs.com/varden/p/15193466.html)
- [PVE+TrueNAS+ZFS+10G内网方案](https://foxi.buduanwang.vip/virtualization/pve/1183.html/)
- [KVM性能优化之磁盘IO优化](https://www.cnblogs.com/tcicy/p/10193613.html)
- [PVE虚拟机直通SATA硬盘](https://v2rayssr.com/pve-nas.html)
- [PVE系统设置硬盘直通](https://foxi.buduanwang.vip/virtualization/1754.html/)
- [黑群晖支持 SCSI 类型硬盘](https://www.jianshu.com/p/e358dfd654e9)
- [PVE+TrueNAS+ZFS+10G内网方案](https://foxi.buduanwang.vip/virtualization/pve/1183.html/)
- [PVE 上部署 TrueNAS](https://www.cnblogs.com/Pyrokine/p/14646478.html)
- [FreeBSD vs Linux：哪个开源操作系统更强大](https://blog.vvzero.com/2022/05/25/freebsd-vs-linux-which-open-source-os-is-superior/)
