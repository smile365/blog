---
title: modem-H-PON01
heading:  
date: 2024-02-22T06:29:27.781Z
categories: ["code"]
tags: 
description:  把光猫改成桥接模式，4 口千兆交换机。
---


## 前言
每次装宽带都送光猫+电视盒子，有好多废弃的光猫，索性改成千兆交换机使用。

**改光猫的桥接模式需要超级管理员账户和密码。**

**获取超级密码方法：**
1. 联系当时上门安装宽带的师傅，说明需求，让他给你超级管理员密码。
2. 网上搜索
3. 破解


**设备**
- 名称：中国移动智能家庭网关
- 地区：云南昆明
- 型号：H-PON01
- 生产日期：2022-06-20
- 用户名：user
- 普通密码：cwnpbiC#
- LOID: 0871GDHe90106c147   password: ? 
- MAC:  643172346315
- 设备标识号:	643172HISI72346315
- GPON SN:	HISI72346315
- 硬件版本:	V1.0
- 软件版本:	V1.0.02




## 一.获取超级管理员密码记录

参考 [移动光猫H-PON01开启Telnet](https://blog.csdn.net/qq_42294237/article/details/132025846) 失败
```
# 404 Not Found
http:/192.168.1.1/bd/hide.asp  
```

参考  [移动光猫获取超级密码](https://www.bilibili.com/read/cv21044770/) 失败
```
# 500 Server Error
http:/192.168.1.1/cgi-bin/telnetenable.cgi?telnetenable=1&key=643172346315
```

参考 [搞定移动光猫超级密码](https://post.smzdm.com/p/a5orwrpk/) 失败
```
# 404 Not Found
192.168.1.1/webcmcc/gui_device_info.html?password=cwnpbiC#&username=user 
```

- 超级用户： CMCCAdmin
- 超级密码：aDm8H%MdA



## 二. 光猫改桥接模式
1. 光猫通电、一根网线连接电脑
2. 登录管理后台： 管理 -> 恢复配置 -> 恢复默认配置。




## 参考资料
