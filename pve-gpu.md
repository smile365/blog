---
title: pve-gpu
heading:  pve 显卡直通
date: 2023-04-14T09:26:22.517Z
categories: ["code"]
draft: true
tags: 
description:  
---

## 前言


## 环境

硬件环境：
- CPU	INTEL E5-2696v4
- 主板	华南 X99-F8 
- 固态硬盘	海康威视C2000PRO 2TB SSD M.2
- 机械硬盘	希捷 16T
- 内存	三星 32G 2133MHz
- 电源	长城 G6 全模组 650W
- 显卡	微星 gt1030 AERO ITX 2G d4
- 机箱	撒哈拉 C360 ATX 中塔背线机箱
- 散热	杂牌 X99 CPU散热器

软件环境：
- Virtual Environment 7.2-3


查看显卡 ID
```
# 
lspci -nn |grep NVIDIA
# VGA NVIDIA  rev a1
03:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP108 [GeForce GT 1030] [10de:1d01] (rev a1)
# 10de:1d01
```

