---
title: personal-media-center-v0.1
heading:  
date: 2023-09-02T05:47:42.629Z
categories: ["code"]
tags: 
description:
---


## 需求
- 手动下载
- 可拷贝
- 可 smba 观看


## docker-compose

```yaml
---
version: "3"
services:
  samba:
    image: crazymax/samba
    container_name: samba
    volumes:
      - "/etc/samba:/etc/samba"
      - "/etc/docker/samba:/data"
      - "/share:/share"
    environment:
      - "TZ=Asia/Shanghais"
      - "SAMBA_LOG_LEVEL=0"
    ports:
     - 445:445
    restart: always


  transmission:
    image: lscr.io/linuxserver/transmission
    container_name: transmission
    restart: unless-stopped
    volumes:
      - /etc/docker/transmission:/config
      - /share/downloads:/downloads
    ports:
      - 30307:9091
      - 30308:51413
      - 30308:51413/udp
```

