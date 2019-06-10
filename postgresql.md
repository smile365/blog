---
title:  postgresql使用
date: 2019-06-04T08:13:00.474Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

使用[官网的rpm](https://www.postgresql.org/download/linux/redhat/)包安装  
```shell
yum install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum -y install postgresql11-server
/usr/pgsql-11/bin/postgresql-11-setup initdb
systemctl enable postgresql-11
systemctl start postgresql-11
sudo -u postgres psql -c "SELECT version();"
```

创建角色和数据库: `sudo -u postgres psql`  
```sql
CREATE ROLE sxy LOGIN PASSWORD 'sxy';
create database sxydb;
grant all privileges on database sxydb to sxy;
```

开启远程访问  
```shell
echo -e "host \t sxydb \t\t sxy \t\t 0.0.0.0/0 \t\t md5" >> /var/lib/pgsql/11/data/pg_hba.conf
echo "listen_addresses = '*'" >> /var/lib/pgsql/11/data/postgresql.conf
sudo systemctl restart postgresql-11
```



[postgresql的应用场景举例](https://github.com/digoal/blog/blob/master/201611/20161124_02.md)


参考  
- [postgresql](https://www.postgresql.org/download/linux/redhat/)
- [install](https://linuxize.com/post/how-to-install-postgresql-on-centos-7/)
- [use](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-7)
- [tutorial](https://www.postgresql.org/docs/11/index.html)
- [digoal](https://github.com/digoal/blog/blob/master/201706/20170601_02.md)