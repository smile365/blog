---
title:  raspberrypi
date: 2019-07-02T10:35:01.080Z
tags: 
categories:
draft: true
description: 2021年树莓派最新安装使用教程
---

#### 安装系统
Raspberry Pi OS（原为Raspbian）是为树莓派基于Debian开发的操作系统。到官网下载[Raspberry Pi Imager](https://www.raspberrypi.org/software/)这个安装工具并安装到电脑上，选择需要烧录的内存和需要的系统，工具会自动下载系统，并安装到 sd 卡上，只需要简单 3 步。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610547292645.png)

#### 配置 WIFI
若果没有鼠标、键盘、显示器、网线，只有一个 wifi ，烧录的时候可以把 wifi 密码直接写入 sd 卡，让树莓派启动时自动连接 wifi。

在SD卡的根目录下添加一个名为 wpa_supplicant.conf的文件，然后在该文件内添加以下的内容 ： 
```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
network={
  ssid="WIFI名"
  psk="WIFI密码"
}
```

#### 启用 SSH

ssh 默认关闭，只需在 SD 的根目录新建一个名为 ssh 文件即可开启 ssh

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610548512219.png)


#### 找到树莓派 ip

写一个 [shell 脚本](https://sxy91.com/posts/ping-ip/) ping 一下 ip 或者扫描一下 22 端口。编写 ip_ping.sh 内容如下：
```bash
#!/bin/bash
ip=192.168.1
port=22
for ((i=2;i<=254;i++))
do
{
        curl $ip.$i:$port -m 3 2>&1 | grep -q "SSH" && echo "$ip.$i:$port yes"
}&    
done    
wait 
```

运行 `/bin/bash ip_ping.sh`

输出
```bash
192.168.1.29:22 yes
```

#### 登录树莓派

默认用户是 pi ，密码为 raspberry

```bash
ssh pi@192.168.1.29
```



3. [让树莓派启动直接连接WIFI](http://sonicguo.com/2019/Initialize-RaspBerry-3-with-wifi/)


vi 编辑器不太好用，nano 编辑器命令不太熟悉，安装 vim 编辑器

sudo apt-get install vim

配置镜像

开启远程桌面和 ssh 连接。
```bash
sudo raspi-config 
# 选择第 5 项
# 5 Interfacing Options  Configure connections to peripherals  
# 依次设置 P2、P3
# P2 SSH         Enable/Disable remote command line access to your Pi using SSH                      │ 
# P3 VNC         Enable/Disable graphical remote access to your Pi using RealVNC     
```

也可以使用桌面方式配置
![依次点击](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610433840402.png) 


测试 ssh 连接
```bash
ssh pi@your_ip
# 树莓派默认登录名和密码是：pi, raspberry
```


vnc 连接需要安装 [vnc 客户端](https://www.realvnc.com/en/connect/download/viewer/)。


![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1605523846409.png)


插上网线，上不了网，ifconfig 不显示有线网络的地址。原因时树莓派的有线网卡没开启。

sudo nano /etc/network/interfaces
iface eth0 inet dhcp

查看无线网络配置
cat /etc/wpa_supplicant/wpa_supplicant.conf


若树莓派无限重启，一般是电源电压不够（可能是充电头或电源线）。

wifi配置失败，网线配置失败，如何配置树莓派
网络（有线、无线）：插网线无反应，WIFI不自动连接。
鼠标、键盘：没有鼠标键盘
显示器：没有显示器
HDMI，输出，大部分屏幕还是 VGA。买 HDMI 转 VGA 的需要带电源。


查看系统版本
uname -a

查看硬件版本
pinout


参考链接
- [开启有线网卡](http://www.nrjs.cn/ctt/11120032.html)
- [nano教程](https://www.vpser.net/manage/nano.html)
- [树莓派花屏或自动重启](http://www.raspigeek.com/index.php?c=read&id=98&page=1)