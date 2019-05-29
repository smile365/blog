---
title: centos搭建软件安装镜像
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
    listen 8989;
    autoindex on;
    root /home/softdata/tunasync/data;
}
```

测试
```shell
#若是目录，url最后必须有/
curl localhost:8989/
curl localhost:8989/centos/
```

参考  
- [清华大学TUNA镜像源](https://github.com/tuna/tunasync/blob/master/docs/zh_CN/get_started.md)
- [何搭建一个镜像站](http://v.colinlee.fish/posts/how-to-set-up-a-centos-mirror-site.html)
- [科大开源软件镜像是怎样炼成的](https://ring0.me/2013/09/how-ustc-mirror-works/)
- [开源镜像站的维护](https://www.zhihu.com/question/19719790)
- [使用tunasync搭建开源镜像站](http://weyo.me/pages/techs/how-to-make-a-mirror-site/)