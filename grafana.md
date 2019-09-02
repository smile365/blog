---
title:  grafana
date: 2019-09-02T08:39:36.785Z
tags: 
categories:
draft: true
description: 
---



```bash
yum install grafana
systemctl start grafana-server
systemctl enable grafana-server
```

编辑配置文件：`vim /etc/grafana/grafana.ini`

```pf.conf
[server]
domain = localhost
root_url = http://localhost:3000/grafana/
```

nginx配置

```nginx
  location /grafana/ {
     proxy_pass http://localhost:3000/;
  }
```


参考

- [grafana-docs](https://grafana.com/docs/)