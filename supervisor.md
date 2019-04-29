---
title:  supervisor
date: 2019-04-29T08:29:53.151Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

安装
```shell
yum -y  install supervisor
systemctl enable supervisord
vim /etc/supervisord.d/myprogram.ini
```

编辑配置文件
```ini
[program:db2db]
directory=/root/project
command=/usr/bin/python db2db.py
stderr_logfile=/root/project/err.log
```

重启
```shell
systemctl restart supervisord
supervisorctl
```

参考  
- [supervisor](http://supervisord.org/installing.html)