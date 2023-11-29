---
title: 在 macbook 模拟 NFC 卡门禁卡的简明操作指南教程
heading: 
date: 2023-05-26T20:18:42.169Z
categories: ["code"]
tags: 
description: 在苹果电脑的 osx 系统下实现模拟加密门禁卡的教程
---

## 前言
- IC 卡（也称 M1 卡）：0 扇区不可以修改，其他扇区可反复擦写，电梯卡、门禁卡等智能卡发卡商所使用的都是 M1 卡。
- UID 卡：可以修改任意扇区，全兼容mifare 1k 卡片。一般某宝能买到。遇到带有防火墙的读卡器就会失效。
- CUID 卡：可擦写防屏蔽卡，可以重复擦写所有扇区，UID卡复制无效的情况下使用，可以绕过防火墙。
- FUID 卡：不可擦写防屏蔽卡，此卡的特点 0 扇区只能写入一次，写入一次变成 M1 卡，CUID 复制没用的情况下使用，可以绕过防火墙。
- UFUID 卡：高级复制卡，提供封卡操作，不封卡就是 UID 卡，封卡后就变为 M1 卡。

## 用到的硬件
- 环境： macbook air 2022（m2）
- nfc 读卡器： PN532
- 一张 IC 卡：小区的门禁卡
- 一张 UID 卡：某宝买的空白卡，0 扇区可写入。

## 用到的软件
- [mfoc](https://github.com/nfc-tools/mfoc), 可破解半加密卡，用默认密码破解其他加密扇区的密钥。
- [mfcuk](https://github.com/nfc-tools/mfcuk), 可破解全加密卡，暴利破解一个扇区的密钥，比较慢。
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


## 使用 mfcuk 破解全加密卡

如果使用 mfoc 显示如下信息：
```
mfoc: ERROR: 
No sector encrypted with the default key has been found, exiting.
```
证明此卡片没有任何默认的 key。可以使用[mfcuk](https://github.com/nfc-tools/mfcuk) 破解出第一个 key。

```bash
# 安装 mfcuk
brew install mfcuk

# 破解（看运气，20 分钟到 1 小时不等）
mfcuk -C -R 0:A -v 2
# mfcuk -C -R 0:A -s 50 -S 100 -v 2

# 上一步得到的 k，如 3c5d7f1e
mfoc -k 3c5d7f1e -O bak.mfd
```

mfcuk 参数说明：
- C: 连接 nfc 读卡器。
- R: 「需要恢复的扇区编号:密钥类型」。-1 表示所有。如：0:A, 2:B, -1:C。
- s: 参数 SLEEP_AT_FIELD_OFF 休眠的毫秒数，默认 10。
- S: 参数 SLEEP_AFTER_FIELD_ON 休眠的毫秒数，默认 50。
- v: 日志级别（0~3），默认 0。


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
# 获取 UID
nfc-list | grep UID | awk -F':' '{print $2}' | tr -d ' '
# 读取小区门禁卡
mfoc -P 500 -O mycard-xxxx.mfd
# 读取空白卡
mfoc -P 500 -O card_nothing.mfd
# 复制 id 和内容。复制 mycard 的内容，使用 card_nothing.mfd 的 key 作为验证。
nfc-mfclassic W a u mycard.mfd card_nothing.mfd
# 仅复制内容（部分卡无法复制 id）
nfc-mfclassic w a u mycard.mfd mycard2.mfd f
# 查看 id
nfc-list
# 查看另一张 id
nfc-list
```


## 参考链接
- [Mac 下 PN532 利用mfoc,mfcuk工具复制门禁卡](https://www.jianshu.com/p/d9ac226df5e4)
- [RFID on PN532](https://ya0guang.com/hack/rfid-on-rpi/)
- [MIFARE系列 1~7 篇](https://www.cnblogs.com/iplus/p/4467177.html)