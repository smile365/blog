---
title:  postgresql使用
date: 2019-06-04T08:13:00.474Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

安装  
```shell
yum install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum -y install postgresql11
/usr/pgsql-11/bin/postgresql-11-setup initdb
systemctl enable postgresql-11
systemctl start postgresql-11
sudo -u postgres /usr/pgsql-10/bin/psql -c "SELECT version();"
```

参考  
- [postgresql](https://www.postgresql.org/download/linux/redhat/)
- [install](https://linuxize.com/post/how-to-install-postgresql-on-centos-7/)
