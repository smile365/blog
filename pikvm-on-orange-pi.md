---
title:  pikvm-on-orange-pi
heading:  
date: 2023-11-19T08:20:08.237Z
categories: ["code"]
tags: 
description:  
---


## 所需硬件
- [Orange Pi Zero3](http://www.orangepi.cn/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-Zero-3.html)
- TF 卡（8G+）& 读卡器
- 2 条 usb 线，至少有一条是 type-c 接口。
- 1.5 的十字螺丝刀
- 杜邦线
- 继电器
- 打火机
- 剥线钳/刀
- 直径 1mm~1.5mm 的热缩管


## 所需软件
- [Armbian 系统](https://github.com/leeboby/armbian-images)
- [pikvm](https://github.com/jacobbar/fruity-pikvm)


## 安装 pikvm
安装 [armbian](https://docs.armbian.com/User-Guide_Getting-Started/#how-to-boot) 系统之后，用 ssh 命令登录系统。 账号 root，密码 1234。 

```bash
ssh root@192.168.0.107

armbian-config

apt update 
```

把软件源改成 [tsinghua](https://mirrors.tuna.tsinghua.edu.cn/help/armbian/) 

```bash
# 备份
cp /etc/apt/sources.list.d/armbian.list /etc/apt/sources.list.d/armbian.list.bak
# 替换
sed -i.bak 's#http://apt.armbian.com#https://mirrors.tuna.tsinghua.edu.cn/armbian#g' /etc/apt/sources.list.d/armbian.list
# 更新源
apt update
# 升级系统
apt upgrade 
```
或者运行 armbian-config -> Personal -> Mirrors -> 选择镜像站。

然后参考 [fruity-pikvm](https://github.com/jacobbar/fruity-pikvm) 安装 OrangePi 版本的 pikvm


```bash
sudo apt install -y git
git clone http://github.com/jacobbar/fruity-pikvm
cd fruity-pikvm

# 查看 Python 版本
python -V

# 如果不是 3.10 则先卸载，否则会出现 No module named 'kvmd' No module named 'apt_pkg' 等问题。
apt remove python3-apt
apt autoremove
apt autoclean


# 依赖 python3.10 如果没有则会自动安装
# 从 github 下载 pikvm 容易被墙，可以设置代理
# export http_proxy=http://127.0.0.1:8087
sudo ./install.sh
# 或者修改 install.sh 的 wget 参数 
# wget -e "http_proxy=http://192.168.0.161:1080" 

```


## 参考文档
- [硬件级远程控制PiKVM](https://www.bilibili.com/video/BV1VN4y1971c)