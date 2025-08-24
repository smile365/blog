---
title:  wifi 密码破解研究
heading: 
date: 2021-11-23T13:37:23.761Z
categories: ["code"]
tags: 
description: wifi-crack
---
## 前言

关于破解的方法和思路参考[渗透测试之构建高效WiFi破解字典](https://www.anquanke.com/post/id/219315)


常见软件工具：  

- [bully](https://www.kali.org/tools/bully/)
- [reaver](https://www.kali.org/tools/reaver/)
- [aircrack-ng](https://www.aircrack-ng.org/doku.php?id=install_aircrack#installing_on_mac_osx)


## mac 自带的 wifi 扫描工具

airport 为早期 os 版本自带工具
```
airport -s
sudo rm -rf /tmp/airport*
sudo airport en0 sniff 3
ls -lh /tmp/airport*
aircrack-ng -w top100.txt -M 100 -f 80 -1 -a 2 -b 0c:5c:b5:c8:04:eb /tmp/airportSniff*.cap
```

新版 macos 会提示
```bash
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s
WARNING: The airport command line tool is deprecated and will be removed in a future release.
For diagnosing Wi-Fi related issues, use the Wireless Diagnostics app or wdutil command line tool.
```

需要使用 wdutil 代替
```bash?linenums
sudo wdutil scan -i 5
```
> **较新的 macOS 版本**（Big Sur 之后），Apple 把 `wdutil` 的很多调试功能收缩了，只留下了日志、诊断、dump 等功能，**已经不能直接扫描 Wi-Fi**。



## mac 上安装 aircrack-ng

参考程[aircrack-ng](https://github.com/aircrack-ng/aircrack-ng)教安装
``` 
brew install autoconf automake libtool openssl shtool pkg-config hwloc pcre sqlite3 libpcap cmocka
```
下载[aircrack-ng.tar.gz](https://www.aircrack-ng.org/doku.php?id=install_aircrack#installing_on_mac_osx)

解压后安装
```bash
 cd aircrack-ng-1.6
 autoreconf -i
 ./configure --with-experimental
 gmake
 gmake install
 ldconfig
```


## 树莓派上安装 aircrack-ng

查看[无线网卡](https://zhuanlan.zhihu.com/p/138202947)是否支持监听模式
```bash
# 查看树莓派型号
cat /proc/device-tree/model
# Raspberry Pi 3 Model B Plus Rev 1.3

# 查看 Supported interface modes
# 是否有 monitor 模式
iw list | grep "Supported interface modes" -A 7
# 没有 monitor 则不支持，后面就不用看了
```

mac shell ssh 连接树莓派[中文乱码](https://monsoir.github.io/Notes/RaspberryPie/raspberry-ssh-locale.html)

查看配置
···
```bash
locale
# 输出
locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_MESSAGES to default locale: No such file or directory
locale: Cannot set LC_ALL to default locale: No such file or directory
cat /etc/default/locale
```


修改配置[locale](https://askubuntu.com/questions/599808/cannot-set-lc-ctype-to-default-locale-no-such-file-or-directory)
```bash
grep "^[^#]" /etc/ssh/sshd_config
sudo vi /etc/ssh/sshd_config
# 注释掉以下行
# AcceptEnv LANG LC_*
systemctl restart sshd
echo "export LC_ALL=en_US.UTF-8" >> /etc/.bash_profile
echo "export LANG=en_US.UTF-8" >> /etc/.bash_profile

grep "^[^#]" /etc/locale.gen
# 注释以下行
# en_US.UTF-8 UTF-8
sudo locale-gen
# 查看是否正常
locale
# 或者重新配置默认语音
# sudo dpkg-reconfigure locales
```

安装依赖
```bash
sudo apt-get update
sudo apt-get install -y libpcap-dev libsqlite3-dev sqlite3 libpcap0.8-dev libssl-dev build-essential iw tshark subversion ethtool
sudo apt-get install -y libnl-3-200 libnl-3-dev libnl-genl-3-dev libnl-genl-3-200
```

通过编译的方式[安装](https://www.aircrack-ng.org/doku.php?id=install_aircrack#compiling_and_installing) 
```bash
wget https://download.aircrack-ng.org/aircrack-ng-1.6.tar.gz
tar -zxvf aircrack-ng-1.6.tar.gz
cd aircrack-ng-1.6
autoreconf -i
./configure --with-experimental
make
make install
ldconfig
```

## Aircrack-ng 使用

使用Aircrack-ng工具，依次输入以下命令

```bash
# 杀死占用网卡的进程  
# 如果为空则证明没占用，有进程则需要手动关闭
1.airmon-ng check kill  
查看无线网卡状态
2.ifconfig/iwconfig -a
加载无线网卡，已加载则忽略
3.ifconfig wlan0 up
激活网卡
4.airmon-ng start wlan0
探测无线网络
5.airodump-ng mon0
```

无法关闭 avahi-daemon
```
# 提示
# stopping avahi-daemon.service but it can still be activated by
# 移出
apt-get remove avahi-daemon
```

无法设置监听模式
```bash
iwconfig wlan0 mode monitor
# out 
Error for wireless request "Set Mode" (8B06) :
    SET failed on device wlan0 ; Operation not supported
```

参考  
- [WiFi 安全与攻击案例分析](https://paper.seebug.org/1159/)
- [cracking-wifi-at-scale-with-one-simple-trick](https://www.cyberark.com/resources/threat-research-blog/cracking-wifi-at-scale-with-one-simple-trick)
- [wifi-attack-tools](https://linuxhint.com/wireless-attack-tools-kali-linux/)
- [wifi密码破解方法记录](https://www.jianshu.com/p/44d54b5369d8)
- [Mac上使用aircrack-ng破解Wi-Fi密码](https://uare.github.io/2016/cracking-wifi-by-aircrack-ng-on-mac)
- [近源渗透，超低成本打造自定义专属钓鱼WIFI](https://www.freebuf.com/articles/wireless/272733.html)
- [无线局域网攻防之Wi-Fi破解](https://www.freebuf.com/articles/wireless/280568.html)
- [知道创宇研发技能表v3](https://blog.knownsec.com/Knownsec_RD_Checklist/index.html)