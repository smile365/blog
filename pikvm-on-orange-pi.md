---
title:  pikvm-on-orange-pi
heading:  
date: 2023-11-19T08:20:08.237Z
categories: ["code"]
tags: 
description:  
---


## 所需硬件
- [Orange Pi Zero3](http://www.orangepi.cn/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-Zero-3.html) (本次为 1GB 版本)
- TF 卡（8G+）& 读卡器
- 2 条 usb 线，至少有一条是 type-c 接口。
- 1.5 的十字螺丝刀
- 杜邦线
- 继电器
- 打火机
- 剥线钳/刀
- 直径 1mm~1.5mm 的热缩管


## 所需软件
 操作环境为 MacBook air m2，其他软件：
- [Armbian 系统](https://github.com/leeboby/armbian-images),（本次为 ubuntu22.04 server）
- [pikvm](https://github.com/jacobbar/fruity-pikvm)，任何基于 debian 的发行版例如 Ubuntu、Debian、Armbian 等都可以安装。
- [etcher](https://etcher.balena.io/)

## 给 Zero3 安装系统
使用 etcher 把下载好的 Armbian 系统烧录到 tf 卡，然后插入 Zero3，接入网线，上电。输入默认账号密码为 root/1234 之后开始初始化配置系统。


## 安装 pikvm
安装 [armbian](https://docs.armbian.com/User-Guide_Getting-Started/#how-to-boot) 系统之后，用 ssh 命令登录系统。 账号 root，密码 1234。 

```bash
ssh root@192.168.0.107

armbian-config

apt update 
```

1. 把软件源改成 [tsinghua](https://mirrors.tuna.tsinghua.edu.cn/help/armbian/) 

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



2. 设置代理

从 github 下载 pikvm 容易被墙，可以设置代理

```
# export http_proxy=http://127.0.0.1:8087
sudo ./install.sh
# 或者修改 install.sh 的 wget 参数 
# wget -e "http_proxy=http://192.168.0.161:1080" 
或者修改 /etc/hosts

140.82.113.4 github.com
199.232.69.194 github.global.ssl.fastly.net
185.199.108.133 raw.githubusercontent.com
185.199.109.133 raw.githubusercontent.com
185.199.110.133 raw.githubusercontent.com
185.199.111.133 raw.githubusercontent.com

```

3. 安装 fruity-pikvm
```bash
sudo apt install -y git
git clone http://github.com/jacobbar/fruity-pikvm
cd fruity-pikvm

# 依赖 python3.10 如果没有则会自动安装
sudo ./install.sh

```


登录[your_pi_ip](https://192.168.0.107/) 账号密码 admin/admin，查看服务是否正常。


## 配置 piKVM


```bash
apt install -y vim
```

配置开机键，在 `vim /etc/kvmd/override.yaml` 增加内容
```yaml
kvmd:
    msd:
        type: disabled
    atx:  
        type: gpio
        power_led_pin: 227
        hdd_led_pin: 226
        power_switch_pin: 72
        reset_switch_pin: 69
```

重启并查看日志
```bash
systemctl restart kvmd kvmd-nginx
journalctl -u kvmd -f
```

如果 override.yaml 配置错误，[pikvm](https://192.168.0.107/) 网页端会出现 500 错误，网页打不开。


## 其他镜像尝试
1. 官方镜像[Orangepizero3_1.0.2_ubuntu_jammy_server_linux6.1.31](https://drive.google.com/drive/folders/1CJYrhHyyje9dEY4-t7JhcZBJfdAFBJro)
安装 pi-kvm 成功，但无法运行，报错：orangepizero3 kvmd[2678]: PermissionError: [Errno 13] Permission denied。

2. [Armbian-ubuntu22.04 server](https://github.com/leeboby/armbian-images)
可以正常运行，单 reboot 之后无法进入系统。


## 参考文档
- [硬件级远程控制PiKVM](https://www.bilibili.com/video/BV1VN4y1971c)
- [gpio](https://docs.pikvm.org/gpio/)
- [atx_board](https://docs.pikvm.org/atx_board/?h=atx)
- [opi-gpio](https://opi-gpio.readthedocs.io/en/latest/api-documentation.html)
- [树莓派使用python+继电器控制220V灯泡](https://www.cnblogs.com/ejiyuan/p/15365792.html)
- [树莓派4B点亮LED](https://blog.csdn.net/weixin_51245887/article/details/123491767)
- [STM32 引脚分类](https://zhuanlan.zhihu.com/p/67412073)
- [Github国内访问超时解决办法](https://blog.csdn.net/unstorm/article/details/121532868)
- [github_连接超时问题time out(host修改流程)](https://blog.51cto.com/u_15672212/5382054)


