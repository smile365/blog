---
title:  XiaoMi-Route-4A
heading: 
date: 2022-10-08T09:32:10.680Z
categories: ["code"]
tags: 
description: 小米路由器 4A 刷机 OpenWRT，Mi Router 4A (MIR4A)
---

## 准备
mac 系统下对小米路由器 4a 刷机。

环境：
- macOS 12.4
- Python 3.7
- 小米路由器 4A 千兆版(R4A)	MiWiFi 稳定版 2.28.58

所需工具：
- [OpenWRTInvasion](https://github.com/acecilia/OpenWRTInvasion)，获取 shell 和 root 权限。
- ~~[Breed](https://breed.hackpascal.net/)，嵌入式设备的引导和恢复环境 (BREED)。~~  变砖了，不用此方法。
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


## 刷入 Breed （无需此步骤）
（20221014 更新，获取 shell 之后可以直接更具 openwrt 官网教程刷入 openwrt，无需 breed）

** 可直接跳到 「刷入 openwrt（成功）」查看正确方法

1. 下载 [breed-mt7621-pbr-m1.bin](https://breed.hackpascal.net/)
2. 使用 Viper FTP 上传到路由器的 /tmp 目录下 
3. 刷入 breed
```bash
cd /tmp && mtd write breed-mt7621-pbr-m1.bin Bootloader
reboot #重启路由器
```


## 刷入 openwrt （变砖）
1. 进入 [openwrt](https://downloads.openwrt.org/) 官网，进入 ram 架构芯片为 mt7621 的文件目录，搜索 xiaomi_mi-router-4a-100m。
2. 下载 [xiaomi_mi-router-4a-100m-squashfs-sysupgrade.bin](https://downloads.openwrt.org/releases/22.03.0/targets/ramips/mt76x8/openwrt-22.03.0-ramips-mt76x8-xiaomi_mi-router-4a-100m-squashfs-sysupgrade.bin)
3. 在 [Breed](http://192.168.1.1/) 界面上传固件并更新（等待一分钟左右，电脑重新获取 ip 即更新完成）
![](./images/1665246809221.png)

（未完待续，变砖了）
按重启键无效，蓝灯常亮，可自动获取 ip，但是获取不到路由器，应该是变成交换机模式了。

查了资料听说是刷错固件了，估计把 breed 的地址给重写了。需要买一个[CH341A 编程器](https://post.smzdm.com/p/ar08wxl7/) 来救砖。
（难道是用编程器固件那个界面？）

## 小米路由器变砖救回之路
CH341A 编程器有 macos 下的[驱动](https://www.wch.cn/downloads/CH341SER_MAC_ZIP.html)，但是没找到烧写固件的程序。只能在 Windows 平台操作。但手头没有 win 电脑，不过有 pve，使用 pve 创建了一个 Windows 11，然后在 win11 下完成以下教程。

![enter description here](https://cdn.sxy21.cn/static/imgs/1665571022085.png)
1. 按照教程 [ch341a编程器使用方法](https://www.bilibili.com/video/BV1LP411L7QF/?spm_id_from=333.337.search-card.all.click&vd_source=a5a0da63345a36acb4d6179637e1fcb6)组装好硬件和安装软件，刷入之前备份的 all.bin 文件。
2. 烧录完成后启动路由器进入 192.168.31.1 看到官方路由器界面，成功。
3. 或者用编程器刷入固件  breed-mt7621-pbr-m1.bin
4. 即可救回。

**失败案例**
救回后使用 breed 刷入 openwrt 官网提供的固件失败。
一、经过测试直接用编程器刷入以下固件失败（现象是笔记本电脑无法获取 ip 正确地址）
1. openwrt-22.03.0-ramips-mt76x8-xiaomi_mi-router-4a-100m-squashfs-sysupgrade.bin
2. openwrt-21.02.3-ramips-mt7621-xiaomi_mi-router-4a-gigabit-squashfs-sysupgrade.bin 
3. openwrt-22.03.0-ramips-mt7621-xiaomi_mi-router-4a-gigabit-initramfs-kernel.bin
所以该用哪个版本，如何刷固件？

二、刷好 breed 然后依次刷 eeprom.bin、openwrt-22.03.0-ramips-mt7621-xiaomi_mi-router-4a-gigabit-squashfs-sysupgrade.bin 失败。现象是不停重启（电缆以拔出、已连接循环）

**半成功案例**
使用  breed 同时刷入 eeprom.bin 和 GitHub 提供的[固件](https://github.com/Plutonium141/XiaoMi-R4A-Gigabit-Actions-OpenWrt/releases) 竟然成功了。但是这个固件的分区不合理
，启动后 root 分区完全没剩余了，导致进行一些操作会提示 no space。
```bash
文件系统	挂载点	可用	已用	卸载分区
/dev/root	/rom	0.00 B / 12.00 MB	100% (12.00 MB) 
tmpfs		/tmp	58.54 MB / 59.31 MB	1% (788.00 KB)
/dev/mtdblock6	/overlay	976.00 KB / 1.25 MB	24% (304.00 KB)
overlayfs:/overlay	/	976.00 KB / 1.25 MB	24% (304.00 KB)
tmpfs	/dev	512.00 KB / 512.00 KB	0% (0.00 B)

opkg install kcptun-client_20210103-1_mipsel_24kc.ipk
Installing kcptun-client (20210103-1) to root...
Collected errors:
 * verify_pkg_installable: Only have 976kb available on filesystem /overlay, pkg kcptun-client needs 2163
 * opkg_install_cmd: Cannot install package kcptun-client.
```

登录 openwrt 依次点击 系统-> 备份/升级 更换固件为 openwrt-22.03.0-ramips-mt7621-xiaomi_mi-router-4a-gigabit-squashfs-sysupgrade.bin，此时又变砖了。


## 刷入 openwrt（成功）
折腾半天，其实 openwrt 官网有更简单的[教程](https://openwrt.org/inbox/toh/xiaomi/xiaomi_mi_router_4a_gigabit_edition)。
1. 根据教程下载固件 [openwrt-22.03.1-ramips-mt7621-xiaomi_mi-router-4a-gigabit-squashfs-sysupgrade.bin](https://openwrt.org/inbox/toh/xiaomi/xiaomi_mi_router_4a_gigabit_edition) 
2. 使用 ftp 工具（我用的是 viper ftp）上传到 /tmp/mnt 目录，改名为 openwrt.bin 。
3. 使用 `telnet miwifi` 登录路由器的 shell 环境并到固件目录  `cd /tmp/mnt`
4. 使用如下命令烧录固件：
```bash
mtd -e OS1 -r write openwrt.bin OS1
```

## openwrt 后台语言改为中文
通过 system -> administration -> ssh 打开 ssh
```bash
#更改软件源
cp /etc/opkg/distfeeds.conf /etc/opkg/distfeeds.conf.bak
sed -i 's_downloads.openwrt.org_mirrors.tuna.tsinghua.edu.cn/openwrt_' /etc/opkg/distfeeds.conf
opkg update

opkg install luci-i18n-base-zh-cn luci-app-opkg luci-i18n-opkg-zh-cn
```

也可以通过管理面板安装，选择「System」->「Software」点击 Update lists，然后搜索并安装以下软件：
- luci-i18n-base-zh-cn
- luci-app-opkg
- luci-i18n-opkg-zh-cn



在 系统 -> 系统属性 -> 常规设置 :
- 时区设置成 「Asia/Shanghai」
- 语言改为「 简体中文」


## ss

```bash
# 查看  CPU 架构
opkg print-architecture
# arch mipsel_24kc 10
# 安装 ss
# opkg install luci luci-base luci-compat
opkg install shadowsocks-libev-ss-local shadowsocks-libev-ss-redir shadowsocks-libev-ss-rules shadowsocks-libev-ss-tunnel
# 安装 ui
opkg install luci-app-shadowsocks-libev luci-i18n-shadowsocks-libev-zh-cn
```


## passwall
注释掉 option check_signature
```bash
cat /etc/opkg.conf
dest root /
dest ram /tmp
lists_dir ext /var/opkg-lists
option overlay_root /overlay
#option check_signature
```


点击 系统 -> 软件包 -> 配置 opkg，custom 处增加一行：
```
src/gz openwrt_kiddin9 https://op.supes.top/packages/mipsel_24kc
```

安装的时候提示挂载点 overlay 空间不足：
```bash
# Only have 268kb available on filesystem /overlay, pkg luci-app-passwall needs 960
# 查看挂载点容量
root@OpenWrt:~# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/root                 3.8M      3.8M         0 100% /rom
tmpfs                    59.0M      2.1M     56.8M   4% /tmp
/dev/mtdblock10           8.3M      8.2M    140.0K  98% /overlay
overlayfs:/overlay        8.3M      8.2M    140.0K  98% /
tmpfs                   512.0K         0    512.0K   0% /dev
```

安装 cfdisk 扩容，提示 No space left on device
```bash
# opkg install cfdisk
Collected errors:
 * wfopen: //usr/lib/opkg/info/libuuid1.control: No space left on device.
 * wfopen: //usr/lib/opkg/info/libuuid1.postinst: No space left on device.
 * wfopen: //usr/lib/opkg/info/libuuid1.prerm: No space left on device.
 * extract_archive: Cannot create symlink from ./usr/lib/libuuid.so.1 to 'libuuid.so.1.3.0': No space left on device.
 * pkg_write_filelist: Failed to open //usr/lib/opkg/info/libblkid1.list: No space left on device.
 * opkg_install_pkg: Failed to extract data files for libblkid1. Package debris may remain!
 * opkg_install_cmd: Cannot install package cfdisk.
 * opkg_conf_write_status_files: Can't open status file //usr/lib/opkg/status: No space left on device.
```



```bash
opkg install dns2socks dns2tcp microsocks tcping ipt2socks shadowsocksr-libev-ssr-local shadowsocksr-libev-ssr-redir simple-obfs trojan-plus
```
Collected errors:
 * pkg_hash_check_unresolved: cannot find dependency dns2socks for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency dns2tcp for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency microsocks for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency tcping for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency ipt2socks for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency shadowsocksr-libev-ssr-local for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency shadowsocksr-libev-ssr-redir for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency simple-obfs for luci-app-passwall
 * pkg_hash_check_unresolved: cannot find dependency trojan-plus for luci-app-passwall
 * pkg_hash_fetch_best_installation_candidate: Packages for luci-app-passwall found, but incompatible with the architectures configured





## kcptun

```bash
opkg install kcptun-client
```





结果是 mipsel_24kc ，所需工具：
1. [shadowsocks-libev_3.3.5-1_mips_24kc.ipk](https://github.com/shadowsocks/openwrt-shadowsocks)
2. [luci-app-shadowsocks_2.1.1-1_all.ipk](https://github.com/shadowsocks/luci-app-shadowsocks/releases)
3. [kcptun-client_mipsel_24kc.ipk](https://github.com/kuoruan/openwrt-kcptun/releases)
4. [luci-app-kcptun_1.5.3_all.ipk](https://github.com/kuoruan/luci-app-kcptun/releases),luci-i18n-kcptun-zh*.ipk 是中文语言包


把下载的 ipk 文件上传到路由器
```bash
# 路由器存储比较少，/tmp 空余存储比较多
mkdir -p /tmp/ipk
#
scp ~/Downloads/*.ipk root@192.168.1.1:/tmp/ipk
cd /tmp/ipk
```



## 参考文档
- [Win10下对小米路由器刷Openwrt](https://article.itxueyuan.com/W1XE4A)
- [小米路由器4A千兆版](https://cn.jetapple.com/routers/xiaomi-mir4a/)
- [小米路由器4A 刷入 Breed 与 Padavan ](https://wuuconix.link/2021/09/08/padavan/)
- [ch341a编程器使用方法](https://www.bilibili.com/video/BV1LP411L7QF/?spm_id_from=333.337.search-card.all.click&vd_source=a5a0da63345a36acb4d6179637e1fcb6)

