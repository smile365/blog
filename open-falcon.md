---
title:  OpenFalcon
date: 2019-04-08T05:38:43.535Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

### 安装mysql
```shell
yum -y install mariadb-server
systemctl start mariadb
systemctl status mariadb
systemctl enable mariadb
#mysql_secure_installation #设置root密码
mysqladmin -u root -p version
```

### 安装rdis
```shell
yum -y install redis
#vim /etc/redis.conf 改端口和密码
systemctl start redis
systemctl enable redis
redis-cli
auth
```

### 安装falcon后端
```shell
#安装后端
cd /tmp/ && git clone https://github.com/open-falcon/falcon-plus.git 
cd /tmp/falcon-plus/scripts/mysql/db_schema/

# mysql 密码
PASSWORD=root  
mysql -h 127.0.0.1 -uroot -p$PASSWORD < 1_uic-db-schema.sql
mysql -h 127.0.0.1 -uroot -p$PASSWORD < 2_portal-db-schema.sql
mysql -h 127.0.0.1 -uroot -p$PASSWORD < 3_dashboard-db-schema.sql
mysql -h 127.0.0.1 -uroot -p$PASSWORD < 4_graph-db-schema.sql
mysql -h 127.0.0.1 -uroot -p$PASSWORD < 5_alarms-db-schema.sql
rm -rf /tmp/falcon-plus/

wget https://github.com/open-falcon/falcon-plus/releases/download/v0.2.1/open-falcon-v0.2.1.tar.gz
export FALCON_HOME=/home/work
export WORKSPACE=$FALCON_HOME/open-falcon
mkdir -p $WORKSPACE
tar -xzvf open-falcon-v0.2.1.tar.gz -C $WORKSPACE
cd $WORKSPACE

# 改配置文件的密码
# sed 's/要被取代的字串/新的字串/g'
grep -Ilr 3306  ./ | xargs -n1 -- sed -i 's/root:/root:$PASSWORD/g'

# 启动
./open-falcon start
# 检查所有模块的启动状况
./open-falcon check

# 建议开放内网端口
# firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address=192.168.1.0/24 accept'
firewall-cmd --add-rich-rule='rule family=ipv4 source address=192.168.1.0/24 accept'

```

### 安装falcon前端
```shell
yum install -y epel-release git python-virtualenv python-devel openldap-devel mysql-devel
yum -y groupinstall "Development tools"
git clone https://github.com/open-falcon/dashboard.git
cd $WORKSPACE/dashboard/
virtualenv ./env
./env/bin/pip install -r pip_requirements.txt -i https://pypi.douban.com/simple

# 修改数据库配置文件 cat rrd/config.py |grep DB
vim rrd/config.py

# 修改falcon的web端口
cat ./gunicorn.conf 
# 启动falcon前端
bash control start
```

### 关闭注册账号功能 
```shell
#1.打开浏览器注册root账号
#2.然后将signup_disable配置项修改为true
cat api/config/cfg.json |grep signup_disable
#3.重启 api
./open-falcon restart api
```

### 其他服务器安装agent
```
export WORKSPACE=/home/soft/open-falcon
mkdir -p $WORKSPACE
tar -xzvf open-falcon-v0.2.1.tar.gz -C $WORKSPACE
cd $WORKSPACE

#修改heartbeat与transfer的ip地址 改为实际的后端地址
cat agent/config/cfg.json |grep addrs
# 启动
./open-falcon start agent
# 查看日志
tail -f agent/logs/agent.log 
```


参考  
- [open-falcon](http://open-falcon.org/)
- [mariadb](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-centos-7)

