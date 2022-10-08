---
title:  XiaoMi-Route-4A
heading: 
date: 2022-10-08T09:32:10.680Z
categories: ["code"]
tags: 
description: 小米路由器 4A 刷机 OpenWRT
---

## 准备
mac 系统下对小米路由器 4a 刷机。

环境：
- macOS 12.4
- Python 3.7
- 小米路由器 4A 千兆版(R4A)	MiWiFi 稳定版 2.28.58

所需工具：
- [OpenWRTInvasion](https://github.com/acecilia/OpenWRTInvasion)，获取 shell 和 root 权限。
- [Breed](https://breed.hackpascal.net/)，嵌入式设备的引导和恢复环境 (BREED)。
- [OpenWrt](https://downloads.openwrt.org/)，开源路由器固件。


## 获取 shell
1. 下载  [OpenWRTInvasion](https://github.com/acecilia/OpenWRTInvasion)
2. 保证路由器能上网，用网线连接路由器 lan 口和 macbook 。
3. 进入 OpenWRTInvasion 执行命令
```bash
cd OpenWRTInvasion 
pip3 install -r requirements.txt # Install requirements
python3 remote_command_execution_vulnerability.py # Run the script
```

结束后提示 (user: root, password: root)，执行过程：
```
Router IP address [press enter for using the default 'miwifi.com']: 
Enter router admin password: sxy112233
There two options to provide the files needed for invasion:
   1. Use a local TCP file server runing on random port to provide files in local directory `script_tools`.
   2. Download needed files from remote github repository. (choose this option only if github is accessable inside router device.)
Which option do you prefer? (default: 1)
****************
router_ip_address: miwifi.com
stok: 902b6116aa3959fb4467b357ee868e45
file provider: local file server
****************
start uploading config file...
start exec command...
local file server is runing on 0.0.0.0:51505. root='script_tools'
local file server is getting 'busybox-mipsel' for 192.168.31.1.
local file server is getting 'dropbearStaticMipsel.tar.bz2' for 192.168.31.1.
done! Now you can connect to the router using several options: (user: root, password: root)
* telnet miwifi.com
* ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c 3des-cbc -o UserKnownHostsFile=/dev/null root@miwifi.com
* ftp: using a program like cyberduck

```

登录方式：
1. telnet
```
telnet miwifi.com
```

2. ssh
```
ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 -c 3des-cbc -o UserKnownHostsFile=/dev/null root@miwifi.com
```
注
- -o：指定配置选项
- -c：选择所加密的密码型式 

5. 登录路由器并查看硬件信息

路由器芯片是 MT7621
```
telnet miwifi.com  # root / root
root@XiaoQiang:~# cat /proc/cpuinfo
system type             : MT7621
machine                 : Unknown
processor               : 0
cpu model               : MIPS 1004Kc V2.15
BogoMIPS                : 577.53
wait instruction        : yes
microsecond timers      : yes
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa                     : mips1 mips2 mips32r1 mips32r2
ASEs implemented        : mips16 dsp mt
shadow register sets    : 1
kscratch registers      : 0
core                    : 0
VPE                     : 0
VCED exceptions         : not available
VCEI exceptions         : not available

processor               : 1
cpu model               : MIPS 1004Kc V2.15
BogoMIPS                : 577.53
wait instruction        : yes
microsecond timers      : yes
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa                     : mips1 mips2 mips32r1 mips32r2
ASEs implemented        : mips16 dsp mt
shadow register sets    : 1
kscratch registers      : 0
core                    : 0
VPE                     : 1
VCED exceptions         : not available
VCEI exceptions         : not available

processor               : 2
cpu model               : MIPS 1004Kc V2.15
BogoMIPS                : 577.53
wait instruction        : yes
microsecond timers      : yes
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa                     : mips1 mips2 mips32r1 mips32r2
ASEs implemented        : mips16 dsp mt
shadow register sets    : 1
kscratch registers      : 0
core                    : 1
VPE                     : 0
VCED exceptions         : not available
VCEI exceptions         : not available

processor               : 3
cpu model               : MIPS 1004Kc V2.15
BogoMIPS                : 577.53
wait instruction        : yes
microsecond timers      : yes
tlb_entries             : 32
extra interrupt vector  : yes
hardware watchpoint     : yes, count: 4, address/irw mask: [0x0ffc, 0x0ffc, 0x0ffb, 0x0ffb]
isa                     : mips1 mips2 mips32r1 mips32r2
ASEs implemented        : mips16 dsp mt
shadow register sets    : 1
kscratch registers      : 0
core                    : 1
VPE                     : 1
VCED exceptions         : not available
VCEI exceptions         : not available
```


## 备份原固件
- /dev/mtd0，磁盘分区
- /dev/mtd2，Bootloader
- /dev/mtd3，Eeprom（路由器 mac 地址、序列号、网卡地址、无线信号参数等信息）

```bash
dd if=/dev/mtd0 of=/tmp/all.bin
dd if=/dev/mtd2 of=/tmp/bootloader.bin
dd if=/dev/mtd3 of=/tmp/eeprom.bin
```
路由器没有 sftp（scp）,默认开启了 ftp，可以通过 Viper FTP 工具把备份文件拷贝到电脑。


## 刷入 Breed
1. 下载 [breed-mt7621-pbr-m1.bin](https://breed.hackpascal.net/)
2. 使用 Viper FTP 上传到路由器的 /tmp 目录下 
3. 刷入 breed
```bash
cd /tmp && mtd write breed-mt7621-pbr-m1.bin Bootloader
reboot #重启路由器
```


## 刷入 openwrt
1. 进入 [openwrt](https://downloads.openwrt.org/) 官网，进入 ram 架构芯片为 mt7621 的文件目录，搜索 xiaomi_mi-router-4a-100m。
2. 下载 [xiaomi_mi-router-4a-100m-squashfs-sysupgrade.bin](https://downloads.openwrt.org/releases/22.03.0/targets/ramips/mt76x8/openwrt-22.03.0-ramips-mt76x8-xiaomi_mi-router-4a-100m-squashfs-sysupgrade.bin)
3. 在 [Breed](http://192.168.1.1/) 界面上传固件并更新（等待一分钟左右，电脑重新获取 ip 即更新完成）
![](./images/1665246809221.png)

## 参考文档
- [Win10下对小米路由器刷Openwrt](https://article.itxueyuan.com/W1XE4A)
- [小米路由器4A千兆版](https://cn.jetapple.com/routers/xiaomi-mir4a/)
- [小米路由器4A 刷入 Breed 与 Padavan ](https://wuuconix.link/2021/09/08/padavan/)

