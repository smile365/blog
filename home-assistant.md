---
title: Home Assistant 使用教程
heading:  
date: 2025-02-22T12:24:18.678Z
tags: 
categories: ["code"]
Description:  在 pve（Proxmox Virtual Environment 8.3.4）环境安装 Home Assistant 教程指南。
---

## 安装

ha 支持很多硬件，本次使用 Proxmox Virtual Environment 8.3.4 环境来体验。

1. 首先在 pve 的 Storage 开启 Import 功能，这样通过 ova 文件直接创建虚拟机。


![enter description here](https://cdn.sxy21.cn/static/imgs/1740227476342.png)
2. 下载 ova 文件。通过 ha 官方 github 的 release 页面下载 [haos_ova-14.2.ova](https://github.com/home-assistant/operating-system/releases) 文件，然后上传到 pve。
![enter description here](https://cdn.sxy21.cn/static/imgs/1740227873989.png)


上传成功后，双击 ova 文件名即可创建虚拟机。根据自己需要可适当调高 CPU 和 内存的值。

3. 浏览器通过 ip:8123 或者 访问 http://homeassistant.local:8123 即可开始初始化 ha 系统，根据提示创建一个初始管理用户，大约 20 分钟即可完成初始化。

## 入门

1. 开启 ssh 访问
依次点击 设置 加载项 加载项商店 搜索 ssh。出现 **Advanced SSH & Web Terminal** 可点击安装并启动。

若一直启动失败，提示：Advanced SSH & Web Terminal
> 加载项似乎尚未准备就绪，它可能仍在启动中。您想重试吗

是因为 ssh 没有配置密码，点击 Advanced SSH & Web Terminal 右上方的配置，在 选项 处配置 password 即可（注意不需要冒号）。然后就可以启动成功。

此时即可通过终端用 ssh 连接到 ha。如:
```bash
ssh root@192.168.1.115
```

2. 安装 Home Assistant Community Store （<abbr title="Home Assistant Community Store">[HACS](https://www.hacs.xyz/docs/use/download/download/#to-download-hacs)</abbr>），这是 Home Assistant 的一个社区商店，用来管理第三方集成和插件。

  可以通过点击 [这个链接](https://my.home-assistant.io/redirect/supervisor_addon/?addon=cb646a50_get&repository_url=https%3A%2F%2Fgithub.com%2Fhacs%2Faddons) 直接安装 hacs，建议修改 **Your instance URL:** http://homeassistant.local:8123 
成 ip:8123 的形式，否则可能安装失败。

[失败原因](https://www.hacs.xyz/docs/use/download/prerequisites/)大多数可能是无法访问 github。
> Connecting to raw.githubusercontent... failed: Connection refused.

解决办法是通过  [ipaddress](https://www.ipaddress.com/website/raw.githubusercontent.com/ ) 查询可访问的 ip，并配置到 ha 主机的 hosts 文件内。
```bash
echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts
```

也可以通过命令行安装（Advanced SSH & Web Terminal -> 打开网页界面）：
```bah
wget -O - https://get.hacs.xyz | bash -
```
安装完成后重启 ha。然后点击 设置 -> 设备与服务 -> 添加集成，搜索 hacs 后点击 hacs 。需要全选条款，点击「提交」，然后复制授权码，点击给出的 github 链接，粘贴刚刚复制的验证码 。完成后左侧菜单栏即可出现 hacs 按钮。


