---
title: centos搭建软件安装镜像站
date: 2019-05-29T06:21:08.071Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

下载[tunasync-linux-bin.tar.gz](https://github.com/tuna/tunasync/releases)
解压：`tar vxzf tunasync-linux-bin.tar.gz`

工作目录  
`cd /home/softdata/tunasync`  

创建目录  
`mkdir data && mkdir conf && mkdir log`  

编辑配置文件  
conf/worker.conf  
```ini
[global]
name = "test_worker"
log_dir = "/home/softdata/tunasync/log/{{.Name}}"
mirror_dir = "/home/softdata/tunasync/data"
concurrent = 10
interval = 1

[manager]
api_base = "http://localhost:12345"

[cgroup]
enable = false
base_path = "/sys/fs/cgroup"
group = "tunasync"

[server]
hostname = "localhost"
listen_addr = "127.0.0.1"
listen_port = 6000

[[mirrors]]
name = "centos"
provider = "rsync"
upstream = "rsync://mirrors.tuna.tsinghua.edu.cn/centos/"
use_ipv6 = false
```

conf/manager.conf
```ini
debug = false

[server]
addr = "127.0.0.1"
port = 12345

[files]
db_type = "bolt"
db_file = "/home/softdata/tunasync/manager.db"
```

Nginx打开目录浏览功能
在nginx的配置文件中添加
```nginx
server {
    listen 80;
    server_name mirrors.yourname.com;
    autoindex on;
    root /home/softdata/tunasync/data;
}

```

**同步完成后测试**  
编辑host  
`echo "192.168.1.176 mirrors.yourname.com" >> /etc/hosts`

参考[使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/centos/)，改`/etc/yum.repos.d/CentOS-Base.repo`文件
```ini
[base]
name=CentOS-$releasever - Base
baseurl=https://mirrors.yourname.com/centos/$releasever/os/$basearch/
gpgcheck=0

[updates]
name=CentOS-$releasever - Updates
baseurl=https://mirrors.yourname.com/centos/$releasever/updates/$basearch/
gpgcheck=0

[extras]
name=CentOS-$releasever - Extras
baseurl=https://mirrors.yourname.com/centos/$releasever/extras/$basearch/
gpgcheck=0

[centosplus]
name=CentOS-$releasever - Plus
baseurl=https://mirrors.yourname.com/centos/$releasever/centosplus/$basearch/
gpgcheck=0
enabled=0
```
更新软件包缓存 `sudo yum makecache`  
测试一下速度 `yum udpate`



参考  
- [清华大学TUNA镜像源](https://github.com/tuna/tunasync/blob/master/docs/zh_CN/get_started.md)
- [何搭建一个镜像站](http://v.colinlee.fish/posts/how-to-set-up-a-centos-mirror-site.html)
- [科大开源软件镜像是怎样炼成的](https://ring0.me/2013/09/how-ustc-mirror-works/)
- [开源镜像站的维护](https://www.zhihu.com/question/19719790)
- [使用tunasync搭建开源镜像站](http://weyo.me/pages/techs/how-to-make-a-mirror-site/)