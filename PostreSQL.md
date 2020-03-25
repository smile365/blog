---
title:  PostgreSQL教程
heading: 
date: 2020-03-25T05:38:15.360Z
categories: ["life"]
draft: true
tags: 
description: 
---

安装   
```
wget https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum install -y pgdg-redhat-repo-latest.noarch.rpm epel-release 
yum install -y postgresql12-server postgresql12
/usr/pgsql-12/bin/postgresql-12-setup initdb
systemctl enable --now postgresql-12
systemctl status postgresql-12


mkdir -p /mnt/data1/pgdata
chown -R postgres:postgres /mnt/data1/pgdata
sudo su - postgres
initdb -D /mnt/data1/pgdata
exit
```

参考配置 
- 系统：centos7
- 内存：32G
- 核：2cpu*2cores

配置`vim /etc/postgresql/11/main/postgresql.conf`
```
listen_addresses = '0.0.0.0'
fsync no
shared_buffers 8GB
work_mem 100MB
effective_cache_size 16GB
maintenance_work_mem 160MB
```

配置 `vim pg_hba.conf`



参考 

- [postgresql.org](https://www.postgresql.org/download/linux/redhat/)
- [PostgreSQL新手入门](http://www.ruanyifeng.com/blog/2013/12/getting_started_with_postgresql.html)
- [PostgreSQL data directory](https://www.digitalocean.com/community/tutorials/how-to-move-a-postgresql-data-directory-to-a-new-location-on-ubuntu-16-04)
- [配置postgresql.conf](https://github.com/digoal/blog/blob/master/201611/20161121_01.md)
- [PostgreSQL性能优化](https://www.jianshu.com/p/cc5e21a64027)