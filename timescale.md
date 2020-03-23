---
title:  timescale教程
heading: 
date: 2020-03-23T05:41:03.912Z
categories: ["life"]
draft: true
tags: 
description: 
---

安装环境：

- centos7
- PostgreSQL 12
- TimescaleDB 

安装脚本  
```bash
wget https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum install -y pgdg-redhat-repo-latest.noarch.rpm epel-release 
yum update
yum install -y postgresql12-server postgresql12
/usr/pgsql-12/bin/postgresql-12-setup initdb
awk -F: '/^[^#]/ {print}' /var/lib/pgsql/12/data/postgresql.conf
systemctl start postgresql
systemctl enable postgresql

```


参考 
- [install-postgresql-12](https://computingforgeeks.com/how-to-install-postgresql-12-on-centos-7/)
- [postgresql-docs](https://www.postgresql.org/docs/12/index.html)
- 