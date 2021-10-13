---
title:  2021年树莓派最新安装和使用教程（无需鼠标键盘显示器等外设）
heading: 
date: 2019-07-02T10:35:01.080Z
tags: 
categories: ["code"]
description: 无需显示器\鼠标\键盘\网线的情况下，如何自动开启WIFI、SHH、VNC 远程连接。
---

Mac OS 的触摸板非常好用，基本告别了鼠标键盘，买了个 树莓派，笔记本用的是 WIFI 网络，手上也没有鼠标、键盘、网线、显示器，如何如何安装系统并自动配置 WIFI 和 SSH 呢。

可以在烧录树莓派系统的时候就指定 WIFI 名称和密码，并打开 SSH 开关，这样就可以通过远程连接树莓派，无需鼠标键盘和显示器，以下是详细教程：


#### 安装系统
Raspberry Pi OS（原为Raspbian）是为树莓派基于Debian开发的操作系统。到官网下载[Raspberry Pi Imager](https://www.raspberrypi.org/software/)这个安装工具并安装到电脑上，然后选择需要烧录的 sd 卡和需要烧录的系统，工具会自动下载 Raspberry Pi OS ，并烧录到 sd 卡上，只需要简单 3 步。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610547292645.png)

#### 配置 WIFI
若果没有鼠标、键盘、显示器、网线，只有一个 wifi ，烧录的时候可以把 wifi 密码直接写入 sd 卡，让树莓派启动时自动连接 wifi。

在SD卡的根目录下添加一个名为 wpa_supplicant.conf的文件，然后在该文件内添加以下的内容 ： 
```
country=CN
update_config=1
ctrl_interface=/var/run/wpa_supplicant
network={
 scan_ssid=1
 ssid="WIFI名称"
 psk="WIFI密码"
}
```

#### 启用 SSH

ssh 默认关闭，只需在 SD 的根目录新建一个名为 ssh 文件即可开启 ssh

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610548512219.png)


#### 找到树莓派 ip

先查自己电脑 ip
```bash
ifconfig |grep "inet "
	inet 127.0.0.1 netmask 0xff000000 
	inet 192.168.1.21 netmask 0xffffff00 broadcast 10.3.1.255
```

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

登录之后可以通过命令开启远程桌面，打开 VNC 即可。
```bash
sudo raspi-config 
# 选择 Interfacing Options
# Interfacing Options  Configure connections to peripherals  
# 然后可以开启或关闭 SSH 和 VNC，
# SSH 已经开启了，所以这里打开 VNC，即远程桌面                  │ 
# VNC         Enable/Disable graphical remote access to your Pi using RealVNC     
```
![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610549575434.png)


#### 远程桌面连接 树莓派


vnc 连接需要安装 [vnc 客户端](https://www.realvnc.com/en/connect/download/viewer/)，之后输入 ip 地址即可连接。

#### 让树莓派支持有线连接

树莓派默认禁用了有线网卡，所以使用 `ifconfig -a` 无法显示 `eth0`

![eth0](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610551042645.png)


通过 VNC 连接远程桌面后，设置国家即可启用有线网卡。

![vnc 树莓派](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610889767815.png)

使用命令 `ifconfig -a` 可以查看到已经有了 `eth0`，但即使插了网线也没有 ip 地址。

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610551347561.png)

需要重启下网卡或直接重启系统
```bash
reboot
# 若无效可以关机，等待 5 秒拔掉电源再重新插上电源。
# shutdown -t 0
```

之后即可查看到有线网卡，已经有了 ip 地址

![enter description here](https://gitee.com/smile365/blogimg/raw/master/sxy91/1610551675046.png)

#### 其他用法

vi 编辑器不太好用，nano 编辑器命令不太熟悉，安装 vim 编辑器

sudo apt-get install vim

配置镜像



测试 ssh 连接
```bash
ssh pi@your_ip
# 树莓派默认登录名和密码是：pi, raspberry
```


#### 可能遇到的问题

1. 无法上网
问题：插上网线，上不了网，ifconfig 不显示有线网络的地址。  
原因：树莓派的有线网卡没开启。  
解决办法：sudo nano /etc/network/interfaces
iface eth0 inet dhcp   


2. 无线重启
若树莓派无限重启，一般是电源电压不够（可能是充电头或电源线）。

3. 网络配置失败

wifi配置失败，网线配置失败，如何配置树莓派
网络（有线、无线），插网线无反应，WIFI不自动连接。

查看无线网络配置
cat /etc/wpa_supplicant/wpa_supplicant.conf

4. 使用了 VGA 转 HDMI，显示器没反应

大部分屏幕还是 VGA。需要买带电源的 HDMI 转 VGA 接头。   
5. 其他命令

查看系统版本：uname -a

查看硬件版本： pinout


参考链接：   
- [开启有线网卡](http://www.nrjs.cn/ctt/11120032.html)
- [nano教程](https://www.vpser.net/manage/nano.html)
- [树莓派花屏或自动重启](http://www.raspigeek.com/index.php?c=read&id=98&page=1)
- [让树莓派启动直接连接WIFI](http://sonicguo.com/2019/Initialize-RaspBerry-3-with-wifi/)