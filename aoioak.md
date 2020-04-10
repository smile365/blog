---
title:  apioak安装使用教程
heading:
date: 2020-04-10T06:36:10.884Z
categories: ["code"]
tags: 
description: 
---

centos 7 安装[apioak](https://gitee.com/apioak/apioak)

安装 OpenResty 和其他必需的依赖项

```bash
# 添加 OpenResty 镜像源。

sudo yum -y install yum-utils
sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo

# 安装 OpenResty 和依赖项。

sudo yum -y install gcc \
                    gcc-c++ \
                    git \
                    curl \
                    wget \
                    openresty \
                    openresty-resty \
                    automake \
                    autoconf \
                    luarocks \
                    lua-devel \
                    libtool \

```

安装MariaDB
```
# 添加 MariaDB 镜像源。

sudo cat > /etc/yum.repos.d/MariaDB.repo <<EOF
[mariadb]
name = MariaDB
baseurl = https://mirrors.aliyun.com/mariadb/yum/10.2/centos7-amd64/
gpgkey=https://mirrors.aliyun.com/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF

# 安装 MariaDB 服务器和客户端。
sudo yum -y install MariaDB-server MariaDB-client

# 启动 MariaDB 服务器。
sudo systemctl start mariadb

# 初始化 MariaDB 并设置 root 密码。
sudo mysql_secure_installation
```

安装aoioak
```bash
#到发行页面下载安装包 https://gitee.com/apioak/apioak/releases
yum install -y apioak-0.4.0-1.el7.x86_64.rpm
```

导入数据
```sql
mysql -uroot -proot -e"show databases;"
mysql -uroot -proot -e"create database aoioak;"
mysql -uroot -proot -Daoioak < /usr/local/apioak/conf/apioak.sql
mysql -uroot -proot -Daoioak -e"show tables;"
```

修改数据库链接信息并启动
```bash
vim /usr/local/apioak/conf/apioak.yaml
sudo apioak start
# http://127.0.0.1:10080/apioak/dashboard 即可访问控制台管理面板
```

