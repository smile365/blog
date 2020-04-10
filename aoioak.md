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
wget https://gitee.com/apioak/apioak/attach_files/369211/download
sudo yum -y install aoioak*.rpm
#导入数据库配置文件到 MySQL 或 MariaDB 中，配置文件路径 /path/conf/apioak.sql。
#编辑 APIOAK 配置文件中 database 项的数据库连接信息，配置文件路径 /path/conf/apioak.yaml
sudo apioak start
# http://127.0.0.1:10080/apioak/dashboard 即可访问控制台管理面板
```

