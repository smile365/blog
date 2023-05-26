---
title: 在 macbook 模拟 Mifare NFC 白卡即飞加密卡的简明造作指南教程
heading: 通过手机的 NFC 功能模拟小区门禁卡
date: 2023-05-26T20:18:42.169Z
categories: ["code"]
tags: 
description: 在苹果电脑的 osx 系统下实现手机和手环模拟加密门禁卡的教程
---

## 用到的硬件
- 环境： macbook air 2022（m2）
- nfc 读卡器： PN532

## 用到的软件
- [libnfc](https://github.com/nfc-tools/libnfc), 可对 MIFARE Classic RFID 标签进行读取、写入、分析等操作
- [mfdread](https://github.com/zhovner/mfdread), 格式化展示 dump.mfd 文件内容的工具
- 与libnfc 相似的软件
    - [mfoc](https://github.com/nfc-tools/mfoc)  
    - [nfc-tools](https://github.com/nfc-tools/nfc-tools)
    - [proxmark3](https://github.com/Proxmark/proxmark3)

## 安装 libnfc

```bash
brew install libnfc
nfc-list -v
```

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
brew install mfoc

LIBNFC_LOG_LEVEL=3 nfc-list
ls /opt/homebrew/Cellar/libnfc/1.8.0/etc/nfc/
echo "allow_intrusive_scan=yes" > /opt/homebrew/Cellar/libnfc/1.8.0/etc/nfc/libnfc.conf
echo "allow_autoscan=yes" > /opt/homebrew/Cellar/libnfc/1.8.0/etc/nfc/libnfc.conf

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