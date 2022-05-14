---
title:  使用 samba 实现电视播放自己想看的高清电影 
heading: 
date: 2022-04-30T08:04:25.258Z
categories: ["code"]
tags: 
description: debian-samba
---

收拾屋子找到一台旧电脑，内存 6g，搭建一个 debian 系统，安装 transmission 实现自动下载电影，安装 samba 让电视可以播放 debian 系统里的电影。


安装 [docker](https://docs.docker.com/engine/install/debian/)

配置 [docker-hub](https://gitee.com/smile365/blog/blob/master/docker.md) 加速器

## vnc server
如果安装的是 debian 桌面版系统，可以安装
[VNC Server](http://www.yl-blog.com/article/915.html)实现远程桌面。



## 安装系统自带的 samba
```
apt install samba
systemctl start smbd
systemctl status smbd
# smb 自动启动
systemctl enable smbd
vi /etc/samba/smb.conf

```



## 安装基于 docker 的 samba

```
sudo docker run -it --name samba -p 139:139 -p 445:445 \
            -v /data/share:/data \
            -d dperson/samba -p
            
            
# 进入容器 配置共享目录
# vi /etc/samba/smb.conf
# 末尾增加
[data]
  comment = server data
  path = /data
  browseable = yes
  writable = yes
# 增加下面配置则为公开访问，无需账号密码
  public=yes
  writable = yes
  create mask=0775
  directory mask=0775
  available = yes
```            
            
## transmission

1. 安装 [transmission](https://hub.docker.com/r/linuxserver/transmission)

```
docker run -d \
  --name=transmission \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /data/share:/downloads \
  --restart unless-stopped \
  linuxserver/transmission
  
```

2. 安装[transmission-web](https://github.com/ronggang/transmission-web-control)

```bash
/bin/bash install-tr-control-cn.sh
mv /usr/share/transmission/web /usr/share/transmission/webbak
cp -r transmission-web-control /usr/share/transmission/web
```


## jackett

```
docker run -d \
  --name=jackett \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Shanghai \
  -p 9117:9117 \
  --restart unless-stopped \
  linuxserver/jackett:latest
```
