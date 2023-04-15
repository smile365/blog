---
title: personal-media-center-v0.2
heading:  
date: 2023-04-15T05:47:42.629Z
categories: ["code"]
tags: 
description:  
---

docker-compose.yml 

```yml
---
version: "3"
services:
  emby:
    image: emby/embyserver
    container_name: emby
    network_mode: host
    restart: unless-stopped
    volumes:
      - /etc/docker/emby:/config
      - /share:/share

  # plex:
  #   image: lscr.io/linuxserver/plex
  #   container_name: plex
  #   network_mode: host
  #   restart: unless-stopped
  #   environment:
  #     - VERSION=docker
  #   volumes:
  #     - /etc/docker/plex:/config
  #     - /share/tv:/tv
  #     - /share/movies:/movies

  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent
    container_name: qbittorrent
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/qbittorrent:/config
      - /share/downloads:/downloads   

  # nzbget:
  #   image: lscr.io/linuxserver/nzbget
  #   container_name: nzbget
  #   restart: unless-stopped
  #   network_mode: host
  #   volumes:
  #     - /etc/docker/nzbget:/config
  #     - /share/downloads:/downloads     

  transmission:
    image: lscr.io/linuxserver/transmission
    container_name: transmission
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/transmission:/config
      - /share/downloads:/downloads


  # #SABnzbd -- 自动Usenet下载工具
  # sabnzbd:
  #     image: lscr.io/linuxserver/sabnzbd
  #     container_name: sabnzbd
  #     restart: unless-stopped
  #     network_mode: host
  #     volumes:
  #       - /etc/docker/sabnzbd:/config
  #       - /share/downloads:/downloads

  prowlarr:
    image: ghcr.io/linuxserver/prowlarr:develop
    container_name: prowlarr
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/prowlarr:/config
      - /share:/share
    # ports:
    #   - 9696:9696



  jackett:
    image: lscr.io/linuxserver/jackett
    container_name: jackett
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/jackett:/config
      - /share:/share


  radarr:
    image: lscr.io/linuxserver/radarr
    container_name: radarr
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/radarr:/config
      - /share:/share
    # ports:
    #   - 7878:7878


  sonarr:
    image: lscr.io/linuxserver/sonarr
    container_name: sonarr
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/sonarr:/config
      - /share:/share

  # #= ombi
  # overseerr:
  #   image: lscr.io/linuxserver/overseerr
  #   container_name: overseerr
  #   restart: unless-stopped
  #   volumes:
  #     - /etc/docker/overseerr:/app/config


  ombi:
    image: lscr.io/linuxserver/ombi
    container_name: ombi
    restart: unless-stopped
    network_mode: host
    volumes:
      - /etc/docker/ombi:/config


  chinesesubfinder:
    image: allanpk716/chinesesubfinder:latest
    container_name: chinesesubfinder
    environment:
      - TZ=Asia/Shanghai
    restart: unless-stopped
    volumes:
      - /etc/docker/chinesesubfinder:/config
      - /share/browser:/root/.cache/rod/browser    # 容器重启后无需再次下载 chrome，除非 go-rod 更新
      - /share:/share
    ports:
      - 19035:19035
      - 19037:19037

  # 字幕下载
  bazarr:
    image: lscr.io/linuxserver/bazarr
    container_name: bazarr
    restart: unless-stopped
    environment:
      - TZ=Asia/Shanghai
    volumes:
      - /etc/docker/bazarr:/config
      - /share:/share
    ports:
      - 6767:6767

  nastools:
    image: jxxghp/nas-tools:latest
    container_name: nastools
    hostname: nastools
    ports:
      - 3000:3000        # 默认的webui控制端口
    volumes:
      - /etc/docker/nastools:/config   # 冒号左边请修改为你想保存配置的路径
      - /share/downloads:/share/Download # 映射数据目录
      #- /你的媒体目录:/你想设置的容器内能见到的目录   # 媒体目录，多个目录需要分别映射进来
    environment:
      - TZ=Asia/Shanghai
     #- REPO_URL=https://ghproxy.com/https://github.com/jxxghp/nas-tools.git  # 访问github困难的用户，可以取消本行注释，用以加速访问github
    restart: always 


```