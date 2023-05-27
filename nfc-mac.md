---
title: 在 macbook 模拟 NFC 卡门禁卡的简明操作指南教程
heading: 
date: 2023-05-26T20:18:42.169Z
categories: ["code"]
tags: 
description: 在苹果电脑的 osx 系统下实现模拟加密门禁卡的教程
---

## 用到的硬件
- 环境： macbook air 2022（m2）
- nfc 读卡器： PN532

## 用到的软件
- [mfoc](https://github.com/nfc-tools/mfoc)  ,“离线嵌套”攻击的开源实现，该程序允许从 MIFARE 经典卡恢复身份验证密钥。
- [mfdread](https://github.com/zhovner/mfdread)（非必须）, 格式化展示 dump.mfd 文件内容的工具，想看 nfc 卡里面的数据可以用这个工具。

## 安装 mfoc
1. 安装 mfoc 会自动安装[libnfc](https://github.com/nfc-tools/libnfc)（可对 nfc 标签进行读取和写入）
```bash
brew install mfoc
# 如果 nfc 卡为白卡（非加密卡），则安装 libnfc 就可以。
# brew install libnfc  # 安装完可以使用 nfc-list 和 nfc-mfclassic 命令

# nfc 读卡器链接电脑并放上 nfc 卡
mfoc -h
nfc-list -v
```

2. 修改配置文件

```bash
# 查找配置文件
LIBNFC_LOG_LEVEL=3 nfc-list
ls /opt/homebrew/Cellar/libnfc/1.8.0/etc/nfc/
# 没有的话创建，有就修改
echo "allow_intrusive_scan=yes" > /opt/homebrew/Cellar/libnfc/1.8.0/etc/nfc/libnfc.conf
echo "allow_autoscan=yes" > /opt/homebrew/Cellar/libnfc/1.8.0/etc/nfc/libnfc.conf
```
> 没有以上两项配置，当执行命令 `nfc-list` 会出现错误 “No NFC device found.”。执行命令 `nfc-mfclassic` 会出现错误 “ERROR: Error opening NFC reader”。


## 安装 mfdread
```bash
pip install bitstring
git clone https://github.com/zhovner/mfdread.git
cd mfdread
python3 mfdread.py ./dump.mfd
```

## 复制
1. 把小区门禁卡放在 nfc 读卡器上
```bash

# 读取小区门禁卡
mfoc -P 500 -O mycard.mf
# 读取空白卡
mfoc -P 500 -O card_nothing.mf
# 复制 id
nfc-mfclassic W a u mycard.mf card_nothing.mf
# 复制内容
nfc-mfclassic w a u mycard.mf mycard2.mf f
# 查看 id
nfc-list
# 查看另一张 id
nfc-list
```