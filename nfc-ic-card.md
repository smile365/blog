---
title: nfc-ic-card
heading: 通过手机的 NFC 功能模拟加密的门禁卡
date: 2021-09-04T01:08:42.169Z
categories: ["other"]
tags: 
description: proxmark3 pm3 
---

## 导言

换了一个新的住址，社区给了一张门禁卡，刚好小米手机支持模拟实体门禁卡，试了一下，只能开小区的大门，单元门没法开，电梯没法开。好奇为什么，索性研究了下如何解决这个问题。网上找了一圈，没有发现 mac 电脑上的教程，经过一番研究，实现了在 mac os x 下破解加密卡，在此记录一下破解过程。

需要购买的硬件
- CUID卡
- PN532 读卡器

可能需要的软件
- [mfoc](https://github.com/nfc-tools/mfoc)
- [mfcuk](https://github.com/nfc-tools/mfcuk)
- [MifareClassicTool](https://github.com/ikarus23/MifareClassicTool)
- [proxmark3](https://github.com/Proxmark/proxmark3)
- [Mifare dumps parser](https://github.com/zhovner/mfdread)


## 一、编译 mfoc 并安装
```
git clone https://github.com/nfc-tools/mfoc.git
cd mfoc 
brew install libnfc pkg-config automake autoconf
./configure
make && sudo make install
mfoc -h
```

## 二、mac osx 连接到 pn532

```bash
$> nfc-list
No NFC device found.

```
打开调试模式
```
$> LIBNFC_LOG_LEVEL=3 nfc-list
# 输出如下：
debug	libnfc.config	Unable to open directory: /usr/local/Cellar/libnfc/1.8.0/etc/nfc/devices.d
debug	libnfc.general	log_level is set to 3
debug	libnfc.general	allow_autoscan is set to true
debug	libnfc.general	allow_intrusive_scan is set to false
debug	libnfc.general	0 device(s) defined by user
nfc-list uses libnfc 1.8.0
debug	libnfc.general	0 device(s) found using acr122_usb driver
debug	libnfc.general	0 device(s) found using acr122_pcsc driver
debug	libnfc.general	0 device(s) found using pcsc driver
debug	libnfc.general	0 device(s) found using pn53x_usb driver
No NFC device found.
```

查看配置文件 `cat /usr/local/Cellar/libnfc/1.8.0/etc/nfc/`
需要配置成：
```
allow_intrusive_scan=yes
allow_autoscan = true
```

再次执行 `nfc-list` 结果为
```
nfc-list uses libnfc 1.8.0
NFC device: pn532_uart:/dev/tty.usbserial-14120 opened
```
这就表示已经连接上 pn532 了，把卡片放到 pn532 后再次执行 `nfc-list` 如果识别到卡片，会出现
```bash
nfc-list uses libnfc 1.8.0
NFC device: pn532_uart:/dev/tty.usbserial-14120 opened
1 ISO14443A passive target(s) found:
ISO/IEC 14443A (106 kbps) target:
    ATQA (SENS_RES): 00  04  
       UID (NFCID1): ca  9e  cf  18  
      SAK (SEL_RES): 08  
```
看到 UID 就证明已经识别到卡片了，没有看到就多试试角度，或者换个钥匙扣类型的卡片。



## 三、破解密钥
执行 `mfoc -P 500 -O mycard.mfd` 会看到以下输出：
```
  Found Key: A [1ed2dfd37623]
  Data read with Key A revealed Key B: [1ed2dfd37623] - checking Auth: OK
Auth with all sectors succeeded, dumping keys to a file!
```



## 把数据写入手环

### 第一步 复制 UID

MifareClassicTool -> 克隆 UID -> 门禁卡 --> 计算0块并克隆 --> 空白卡

使用手环的模拟功能把这张空白卡模拟一下

### 第二步 获取解密数据

打开 MifareClassicTool -> 编辑/新建密钥，新建一个密钥，把刚刚破解出来的密钥和默认密钥粘贴进去。
```
# Standard Keys
FFFFFFFFFFFF
# your card
1ed2dfd3762
```

然后点击【读标签】选择刚刚创建的密钥文件，门禁卡靠近手机，点击【开始映射并读取标签】读取成功后【保存】转储文件。

### 第三步 把数据写入手环

手环靠近手机，然后 MifareClassicTool -> 编辑/分析转储文件 --> 刚保存的文件 -> 打开转储文件 -> 写转储 。

取消 0 扇区。



## 把数据写入手机

### 第一步 复制 UID

MifareClassicTool -> 克隆 UID -> 门禁卡 --> 计算0块并克隆 --> 空白卡

使用手机的模拟功能把这张空白卡模拟一下


### 第二步 获取空白卡密钥
把手机刚刚模拟成功的卡片放到 nfc 读卡器上，然后执行
```bash
mfoc -O old_cuid.mfd
```

### 第三步 把数据写入手环

```
nfc-mfclassic w a u mycard.mfd old_cuid.mfd f
```




这里用别人写好的 Python 脚本查看破解的数据
```bash
pip install bitstring
git clone git@github.com:zhovner/mfdread.git
python mfdread/mfdread.py mycard.mfd
```

```bash
# 用默认密码格式化空白卡
nfc-mfclassic f a u blank.mfd
# 
```



## 问题记录

编译过程中的问题记录。

### mfoc 安装失败的解决方法

```
# 问题1
autoreconf: command not found
# 解决办法：安装 autoconf
brew install autoconf

# 问题2
Can't exec "aclocal": No such file or directory at
# 解决问题，安装 automake
brew install automake

# 问题3
configure.ac:17: error: possibly undefined macro: AC_MSG_ERROR
# 解决办法 安装 pkg-config 
brew install pkg-config 

# 问题4
configure: error: libnfc >= 1.7.0 is mandatory.
# 解决办法 安装 libnfc
brew install libnfc

```

### mfoc 破解失败的解决办法

执行`mfoc -O mycard.mfd`命令后，mfoc 会以每次20的探测数探测数据，并会检测出加密情况。
```
Sector 00 - Found   Key A: ffffffffffff Found   Key B: ffffffffffff
Sector 01 - Unknown Key A               Unknown Key B
Sector 02 - Found   Key A: ffffffffffff Found   Key B: ffffffffffff
...
```

其中出现“Found   Key”的行证明是发现了默认密钥，如果所有扇区的密钥都是 ffffffffffff 默认密钥的话，证明此卡没加密。 

“Unknown Key”的行就是没发现密钥，如果全都是“Unknown Key”，那么此卡就是全加密卡，使用 mfoc 工具就无法破解。

如果有 “Found   Key” 也有 “Unknown Key” 证明是半加密卡，mfoc 可以破解这种卡。


不加参数的情况下，一般需要等很久才能看到结果，甚至执行 20 分钟后发现失败。
```
mfoc: ERROR: No success, maybe you should increase the probes
```

可以改成 `mfoc -P 500 -O mycard.mfd` 加快速度。不出意外的话就可以看到成功字样了。



## 后记

疑问，为什么 mfoc 和 mfcuk 没有安卓版本？既然手机相当于读卡器，为什么直接用手机破解呢？




mfoc 知道一张卡的一个密钥（部分加密）
mfcuk 一个也不知道（全加密）

16的12次方=16*10^12≈2.8e+14≈两百八十万亿。


相关工具


[PN532](https://www.nxp.com.cn/docs/en/nxp/data-sheets/PN532_C1.pdf) 是高度集成的收发器模块，用于非接触式通信
13.56 MHz 基于 80C51 微控制器内核。

80C51：单片机、微控制器

80C51 单片机属于MCS-51系列单片机，由Intel公司开发.

参考文献：
- [Linux 下攻击 Mifare NFC 卡片的简明指南](https://www.ducksoft.site/%E5%AE%89%E5%85%A8/mifare-crack-guide.html)
- [复制MIFARE Classic小区门禁卡记录](https://zohead.com/archives/copy-mifare-classic/)
- [使用pm3及变色龙获取加密卡信息写入小米手环NFC版](https://post.smzdm.com/p/777188/)
- [手环NFC复制加密卡，门禁卡，饭卡全过程](https://post.smzdm.com/p/aqnlper7/)
- [记Macbook Pro配合FT232使用PN532模块](https://www.jianshu.com/p/7a0bf015e06c)

扩展阅读：
- [Mifare Classic card(M1卡)破解过程记录](https://www.123455.xyz/2021/05/m1.html)
- [RFID基础概念梳理及攻击方法](https://www.freebuf.com/column/223864.html)
- [NFC相关卡片基础知识](https://hceng.cn/2019/07/12/NFC%E6%89%8B%E6%9C%BA%E6%A8%A1%E6%8B%9F%E5%8A%A0%E5%AF%86%E9%97%A8%E7%A6%81%E5%8D%A1/)
- [常见RFID卡片介绍-破解思路](https://ulyc.github.io/2020/01/18/%E5%B8%B8%E8%A7%81RFID%E5%8D%A1%E7%89%87%E4%BB%8B%E7%BB%8D-%E7%A0%B4%E8%A7%A3%E6%80%9D%E8%B7%AF-%E5%8F%8A-Proxmark3%E7%AE%80%E4%BB%8B/)
- [学习嵌入式要学哪些课程？](https://blog.csdn.net/qq_36948778/article/details/77480401)
- [嵌入式工程师出路之我见](https://www.eet-china.com/mp/a17205.html)
- [如何系统地入门学习stm32？](https://www.zhihu.com/question/46616925) 
- [RFID 破解基础详解](https://www.xazlsec.com/index.php/archives/1003/)
- [Android中主机卡模拟的编辑功能](https://stackoverflow.com/questions/28409934/editing-functionality-of-host-card-emulation-in-android) 
- [Proxmark3（PM3）硬件简单拆解与介绍](https://www.wasyoung.com/2019/11/30/337/)
- [MIFARE系列7《安全》](https://itnewbee.org/mifare%E7%B3%BB%E5%88%977%E3%80%8A%E5%AE%89%E5%85%A8%E3%80%8B/)
- [更快的攻击攻击手段](http://62.234.115.194/ask/122013874.html)




