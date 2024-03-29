---
title: personal-media-center 
heading: 
date: 2022-01-26T10:51:31.900Z
categories: ["other"]
tags: 
description: 打造家庭媒体中心，Personal Media Center
---


## 需求
随时随地都能添加标准和非标准

- 设备类型：支持公网、手机、电脑、平板
- 媒体类型
    - 标准媒体：公开发行的电影、电视剧、动漫
    - 非标准：你懂的

![enter description here](https://cdn.sxy21.cn/static/imgs/1675331715839.png)


思路：Proxmox Virtual Environment 安装黑群晖、路由器、Linux虚拟机等。


## 安装 PVE


Proxmox VE 是一个基于 Debian 的开源服务器虚拟化环境Linux发行版，使用基于Ubuntu的定制内核，包含安装程序、网页控制台和命令行工具。

下载[pve-iso](https://www.proxmox.com/en/downloads/category/iso-images-pve)镜像后，参考[PVE安装教程](https://www.10bests.com/install-proxmox-ve/)进行安装。简易用迅雷 bt 下载，官方下载很慢。


把 iso 文件用 [etcher](https://www.balena.io/etcher/) 写入 u 盘即可。（注：mac下 容量会变小，且会被分区成三份）

安装时最好设备插入网线，否则配置网络特别麻烦，若无法上网，请查阅官方[关于网络配置的文档](https://pve.proxmox.com/wiki/Network_Configuration#_choosing_a_network_configuration)

安装完，插上网线，修改网络配置`nano /etc/network/interfaces`
```bash
auto lo
iface lo inet loopback

iface enp5s0 inet dhcp

auto vmbr0
iface vmbr0 inet dhcp
	#address 192.168.100.2/24
	#gateway 192.168.100.1
	bridge-ports enp5s0
	bridge-stp off
	bridge-fd 0

iface wlp9s0 inet dhcp
```

修改成自动获取 ip，然后重启网络 `systemctl restart networking.service`

然后浏览器打开: https://10.0.0.113:8006

mac os 下 使用 etcher 刻录系统以后 U 盘容量变小，可通过 `diskutil` 命令恢复。

```bash
# 查看磁盘列表，找到 external physical 外部物理磁盘即为 U 盘。
diskutil list
# 取消挂载
diskutil umountDisk /dev/disk3
# 使用0覆盖所有扇区（比较慢，可不执行）
# diskutil zeroDisk /dev/disk3
# 格式化
diskutil eraseDisk ExFAT myupan /dev/disk3 
```

这里主要用到 `diskutil eraseDisk` 命令
```bash
diskutil eraseDisk format name [APM | MBR | GPT] device
```

diskutil eraseDisk 可选项说明：
 - format：指定抹掉后的文件系统（如 FAT32、ExFAT、APFS）
- name：抹掉后磁盘的名称
- APM|MBR|GPT：磁盘的类型（可不填）
- device：设备ID



更新镜像源 [Debian 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/debian/)
```
mv /etc/apt/sources.list /etc/apt/sources.list.bak
nano /etc/apt/sources.list
apt-get update
apt-get upgrade
```


安装[wpa_supplicant](https://wiki.archlinux.org/title/wpa_supplicant)，并参考[教程](https://linuxconfig.org/how-to-connect-to-wifi-from-the-cli-on-debian-10-buster)配置 WIFI。

```bash
apt-get install wireless-tools
iwconfig
ifup wlp9s0
iwlist wlp9s0 scan | grep ESSID
apt-get install wpasupplicant
wpa_passphrase CMCC-sxy 123456 > /etc/wpa_supplicant/wpa_supplicant.conf


```

编辑文件 `nano /etc/wpa_supplicant/wpa_supplicant.conf` 在首行增加以下内容：
```
ctrl_interface=/run/wpa_supplicant
ctrl_interface_group=netdev
update_config=1
ap_scan=1
```

启动网卡
```bash
# 测试执行
wpa_supplicant -B -i wlp9s0 -c /etc/wpa_supplicant/wpa_supplicant.conf

# 重启 wpa_supplicant
systemctl restart wpa_supplicant

# 重启网卡
ifdown wlp9s0
ifup wlp9s0

# 获取动态ip
dhclient
```


或者使用图形界面[nmtui](https://howtoinstall.co/en/network-manager)



## 使用 PVE 安装黑群晖


从[网盘](https://foxi.buduanwang.vip/pan/%E8%BD%AF%E4%BB%B6%E6%94%B6%E9%9B%86/%E9%BB%91%E7%BE%A4%E6%99%96/)下载所需文件
- 群晖引导：DS3617-1.03b_boot.qcow2
- 群晖固件：DSM_DS3617xs_25426.pat

参考教程创建一个[虚拟机](https://foxi.buduanwang.vip/virtualization/1353.html/)
- OS：not use any media
- system
    - Machine: q35
    - scsi controller: virtio scsi single
- netwok
    - model： Intel E1000

然后删除 CD 驱动和硬盘。
![enter description here](https://cdn.sxy21.cn/static/imgs/1675321048916.png)

把 DS3617-1.03b_boot.qcow2 上传到 PVE 的 /root 目录下

在 pve 的终端执行 [qm 命令](https://pve.proxmox.com/pve-docs/qm.1.html)：
```bash
qm importdisk 100 DS3617-1.03b_boot.qcow2 local-lvm --format=qcow2
```

此时会出现未使用的磁盘0，点编辑改成 sata。
再增加一个 sata 磁盘，容量随意，简易 32G 以上。
编辑 options 启动项改成 sata0，点击启动，然后打开终端。

此时会出现 http://find.synology.com/ 等字样，打开网站继续安装即可。若提示“局域网内未找到 DiskStation”，可以查看路由器新增的 ip，然后直接访问 ip:5000
		

手动安装，选择 `DSM_DS3617xs_25426.pat` 


## 群晖安装 docker

控制面板--高级--应用和程序--终端机：启用 ssh  
文件管理：创建存储池、存储空间  
套件中心：搜索 docker 并[安装 docker](https://zhuanlan.zhihu.com/p/146175822)  

到阿里云申请一个[加速器地址](https://cr.console.aliyun.com/cn-qingdao/instances/mirrors)
 
 通过 ssh 登录群晖，修改 docker 配置文件，通过[synoservicecfg](https://www.itfanr.cc/2017/11/17/playing-synology-nas-of-docker-accelerator/)查看和重启 docker。
 ```bash
 # 切换到 root 用户
 sudo -i
 # 修改 dockerd.json
 vim /var/packages/Docker/etc/dockerd.json
 # 查看 docker 服务
 synoservicecfg --list |grep ocker
 # 重启
 synoservice --restart pkgctl-Docker
 # 检查是否有加速器地址
 docker info |grep irror
 ```

## 影视相关工具
| 名称                                                                             | 介绍                                                                          | 网址 | 安装方式 |
| -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ---- | -------- |
| [Jackett](https://registry.hub.docker.com/r/linuxserver/jackett/)                | 种子搜索的聚合器。把上百个种子搜索网站做成了 API 形式，以供别的程序使用。     |      |          |
| [Radarr](https://registry.hub.docker.com/r/linuxserver/radarr/)                  | 电影下载和管理工具。根据你的电影名到电影网站查找电影相关信息。                |      |          |
| [Sonarr](https://registry.hub.docker.com/r/linuxserver/sonarr)                   | 电视连续剧下载和管理[工具](https://www.shengchulai.com/blog-OWNEuwyeqZ.htm)。 |      |          |
| [emby](https://registry.hub.docker.com/r/emby/embyserver/)                       |                                                                               |      |          |
| [qBittorrent](https://registry.hub.docker.com/r/linuxserver/qbittorrent/)        | 种子下载器。                                                                  |      |          |
| [Trakt](https://trakt.tv/)                                                       | 待看清单列表。                                                                |      |          |
| [transmission](https://registry.hub.docker.com/r/linuxserver/transmission)       | 另一个种子下载器                                                              |      |          |
| [transmission-web-control](https://github.com/ronggang/transmission-web-control) | transmission 的 web 管理界面。官方的原版很简陋，比较难用。                    |      |          |



### 创建目录

在群晖的文件管理中创建对应的工具软件目录，保存每个软件的配置文件、缓存等信息。

```
- docker
-- xxx # 软件名 映射为 config
- media
-- downloads # 下载文件
-- tvshows # tv
-- movies # 电影
```

## 安装过程

### transmission
参考 [SSH 安装方式](https://github.com/ronggang/transmission-web-control/wiki/Linux-Installation-CN)
```bash           
docker exec -it linuxserver-transmission1  /bin/bash
apk add wget
# 下载
wget https://gitee.com/culturist/transmission-web-control/raw/master/release/install-tr-control-gitee.sh
# 安装
bash install-tr-control-cn.sh /usr/share/transmission/web/
```


## 遇到的问题

### transmission 无法下载

Tracker returned an error: Tracker gave HTTP response code 0  (No Response)
原因：一般是网络延迟过于严重，或服务器时间和本地时间不同步。



### libQt5Core

如果遇到 [libQt5Core](https://github.com/linuxserver/docker-qbittorrent/issues/103) 问题，则如下解决：
```bash
# 也有中文修改版
# docker pull superng6/qbittorrentee
docker exec -it linuxserver-qbittorrent1 /bin/bash
apt update
apt install -y binutils
strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5

# 重启容器
```


### qBittorrent 无法搜索

登录 dsm 修改,根据之前映射的文件，找到 qBittorrent 的配置文件
```
ssh dsm
sudo find / -name "jackett.json"
# 根据上一步配置，我的配置文件路径是
vim /volume1/docker/qb/qBittorrent/data/nova3/engines/jackett.json
# 修改 api_key、url
{
    "api_key": "YOUR_API_KEY_HERE",
    "tracker_first": false,
    "url": "http://127.0.0.1:9117"
}
```
进入 dsm 系统，重启 qBittorrent 容器即可。





KODI、jellyfin、emby、plex



配置群晖，参考[教程](https://gitmind.cn/app/doc/1e57138160015b5fd23e76b9a2fc61ed)

多媒体信息来源于 https://www.themoviedb.org/ ，保证群晖能访问。

开启 ssh ，获取 id，1026 。


uid=1026(dsm) gid=100(users) groups=100(users),101(administrators)

注册并登录 https://trakt.tv/ 新建电影、电视剧清单。

建立共享文件夹



注册表搜索 superng 安装 [qbittorrentee](https://registry.hub.docker.com/r/superng6/qbittorrentee/)

配置[套件源](https://www.ruoyer.com/dsm_crt.html)

https://packages.synocommunity.com/

通过套件安装 Jackett、Radarr、Sonarr、Emby

套件版本的软件比较老，以上软件也可以通过 docker 安装 [Radarr](https://post.smzdm.com/p/a9g2w0qp/)

```bash
ipkg install lsof
docker pull linuxserver/qbittorrent
docker pull linuxserver/jackett
docker pull linuxserver/radarr
docker pull linuxserver/transmission
docker pull emby/embyserver
```

## 网址导航

安装的软件登录端口：  
 - [PVE:8006](https://10.0.0.117:8006/)
 - [DSM:5000](http://10.0.0.117:5000/)
 - [qbittorrentee:8080](http://10.0.0.117:8080/) 
 - [Jackett:9117](http://10.0.0.117:9117/)
 - [Radarr:7878](http://10.0.0.117:7878/)
 - [emby:8096](http://10.0.0.117:8096/)
 - [transmission:9091](http://10.0.0.117:9091/)



## Radarr 配置
配置搜刮器、下载器

字幕工具：Bazarr、SubFinder、[chinesesubfinder](https://sleele.com/2021/06/25/docker-chinesesubfinder-%E4%B8%AD%E6%96%87%E5%AD%97%E5%B9%95%E8%87%AA%E5%8A%A8%E4%B8%8B%E8%BD%BD/)


## 电视上看

## ipad 上看

## 手机上看

smbstatus -V


[PVE 玩转 ARM](https://www.proxmox.wiki/?thread-54.htm)

[在PVE中安装安卓x86](https://foxi.buduanwang.vip/virtualization/pve/567.html/)

## 共享文件夹
WebDav
smb


## 参考文档    
- [年轻人的第一个全自动个人影音库-效果展示](https://www.bilibili.com/video/BV19S4y1Q7nB)
- [追剧全流程自动化Jackett Sonarr Radarr Bazarr qBittorrent Emby Plex](https://sleele.com/2020/03/16/%E9%AB%98%E9%98%B6%E6%95%99%E7%A8%8B-%E8%BF%BD%E5%89%A7%E5%85%A8%E6%B5%81%E7%A8%8B%E8%87%AA%E5%8A%A8%E5%8C%96/comment-page-2/)
- [群晖搭建基于Plex的自动追剧媒体中心](https://www.jianshu.com/p/99708c9d2fda)
- [利用NAS实现全自动观影追剧](https://leishi.io/blog/posts/2021-12/home-nas-media-center/#3-radarrsonarr-%E8%B5%84%E6%BA%90%E5%91%A8%E8%BD%AC%E4%B8%AD%E5%BF%83)
- [Mac 上将U盘格式化为 ExFAT](https://sspai.com/post/68573)
- [MAC OS 烧录ISO文件到U盘](https://blog.csdn.net/Aria_Miazzy/article/details/104321607)
- [Mac 使用终端彻底格式化U盘](https://blog.csdn.net/chenhao_c_h/article/details/102552874)
- [macOS下磁盘管理diskutil命令详解](https://blog.csdn.net/weixin_41136293/article/details/108766145)
- [Debian 网络配置](https://pan-xiao.gitbook.io/debian/config/network)
- [在pve上安装黑群晖](https://foxi.buduanwang.vip/virtualization/1353.html/)
- [高阶教程-追剧全流程自动化](https://post.smzdm.com/p/a3gvpn27/)
- [synocommunity](https://github.com/SynoCommunity/spksrc/issues/4897#issuecomment-937376994)
- [BT蚂蚁磁力搜索](https://btmayi.cc/)
- [群晖包管理器 ipkg](https://cloud.tencent.com/developer/article/1405675)
- [opkg](https://github.com/Entware/Entware/wiki)
- [群晖占用的端口](https://kb.synology.cn/zh-cn/DSM/tutorial/What_network_ports_are_used_by_Synology_services)
- [射手网字幕](https://assrt.net/api/doc)
- [主流平台访问samba共享文件夹方法总结](https://github.com/wupanhao/wupanhao.github.io/issues/1)
- [Proxmox6.0-cn 中文手册](http://files.elvin.vip/doc/Proxmox6.0-cn.pdf)
- [在PVE中安装安卓x86+清华大学镜像站](http://loves.im/?id=43)
- [访问群晖nas文件](https://zhuanlan.zhihu.com/p/369355795)
- [利用NAS实现全自动观影追剧的几种方案对比](https://fairysen.com/788.html)

