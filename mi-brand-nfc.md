---
title: 小米手环模拟非加密门禁卡
heading: 
date: 2021-10-27T03:15:19.225Z
categories: ["other"]
tags: 
description: 小米手环模拟非加密门禁卡,mi-brand-nfc
---

## 模拟 nfc

有一张长方形的非加密的门禁卡，经常忘带，刚好买了一个支持nfc模拟的手环。想通过手环来刷门禁。

设备：
- 小米手环6NFC 版
- 小米手机 8


操作路径
小米运动-我的-小米手环6 nfc 版--卡包--门卡--非加密门卡模拟

模拟成功后发现没法使用，刷门禁根本没反应。

## 查找问题
经测试发现，门禁卡的0扇区是：
```bash
B70A4862970804006263646566676869
00000000000000000000000000000000
00000000000000000000000000000000
FFFFFFFFFFFFFF078069FFFFFFFFFFFF
```

模拟成功后发现手环的0扇区（不可用）：
```bash
B70A486297080400D200000100000000
00000000000000000000000000000000
00000000000000000000000000000000
FFFFFFFFFFFFFF078069FFFFFFFFFFFF
```

发现除了前面 16 位是相同的，后 16 位完全不同。难倒刷卡器还识别厂商信息？

第0扇区相比其他扇区稍有特殊，块0为绝对地址块，在卡片出厂时被锁死不可更改，前4个字节为整个RFID系统中唯一的UID号（B70A4862），第5个字节为BCC校验位（97），数值由UID的4个字节异或运算得出，第6字节为卡片的SAK值（08），第7到8字节时智能卡的ATQA值（0400），剩余的部分（后16位）是制造商出厂时设定好的信息，不会影响到卡的使用。块2和块3一般为空，不存放用户数据，在大部分RFID系统中读卡器需首先验证0扇区0块数据的正确性，如果验证失败将不会访问其他扇区。

然后使用小米手机模拟门禁卡，0扇区如下（可用）：
```bash
B70A486297080400D200000100000000
00000000000000000000000000000000
00000000000000000000000000000000
FFFFFFFFFFFFFF078069FFFFFFFFFFFF
```

这次手机的0扇区与手环一模一样，后 16 位与门禁卡也不同，但手机可以刷开门禁。证明读卡器确实不检测厂商信息。这么说只能是手环的问题。


## 尝试解决

### 失败1
升级小米运动app，再重复试一次，也不行。

### 失败2
使用[网上的方法](https://zhuanlan.zhihu.com/p/362356658)，先用手机模拟成功（可开门禁），然后模拟时用手环模拟手机里的卡，也不成功。

### 失败3
升级小米手环，再次重试，也不行


### 失败4
猜测会不会小米运动的模拟功能有bug呢。经过一番搜索发现小米运动是华米开发的，小米穿戴是小米自己开发的。所以使用小米穿戴试试。

手环--设置--回复出厂设置
手机--小米穿戴--添加设备-小米手环6

### 失败5

小米穿戴--卡包--添加新门卡--模拟门禁卡--设备读取。




