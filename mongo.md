---
title:  centos7安装mongo
date: 2018-08-13T02:55:14.439Z
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

配置软件的安装源


```shell
#1、备份
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup

#2、下载新的CentOS-Base.repo 到/etc/yum.repos.d/CentOS 7

wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

#3、之后运行yum makecache生成缓存
yum makecache
```

配置mongo的repo源`vi /etc/yum.repos.d/mongodb-org-3.4.repo`

内容如下：
```ini
[mongodb-org-3.4]
name=MongoDB Repository
#baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/
baseurl=https://mirrors.aliyun.com/mongodb/yum/redhat/7Server/mongodb-org/3.4/x86_64/
#gpgcheck=1
gpgcheck=0
enabled=1
#gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc
```

运行命令安装`yum install -y mongodb-org`

>设置密码：密码不要使用@

启动服务`mongod -f /etc/mongod.conf`
>不能使用 systemctl 启动


创建用户
```javascript
use admin
db.createUser({user:'sxyadmin',pwd:'s**%m%d ',roles: [ { role: "userAdminAnyDatabase", db: "admin" }]})
```

启用用户认证`vi /etc/mongod.conf`
```yaml
security:
  authorization: enabled
```


重启mongod
```shell
systemctl stop mongod
mongod -f /etc/mongod.conf
```

登录认证
> use admin
> db.auth('sxyadmin','s**%m%d')



mongo 日志 文件
/var/log/mongodb/mongod.log

4、配置访问控制
编辑  /etc/mongod.conf
注释掉一行：bindIp: 127.0.0.1


systemctl enable mongod

systemctl restart mongod


mongo -host 192.168.31.66 -port 47017

正常关闭
use admin
db.shutdownServer()
参考：
mongodb启动不了：child process failed, exited with error number 100


rm -f /var/lib/mongo/mongod.lock
mongod -f /etc/mongod.conf

yum remove mongodb*
rm -rf /var/log/mongodb
rm -rf /var/lib/mongo
yum install -y mongodb-org
 vi /etc/mongod.conf


配置软件的安装源： http://mirrors.aliyun.com/help/centos
使用阿里云的mongodb源：http://blog.csdn.net/liaoyundababe/article/details/71303039
安装mongodb：https://www.linode.com/docs/databases/mongodb/install-mongodb-on-centos-7
官方文档：https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/

设置密码：https://docs.mongodb.com/manual/tutorial/enable-authentication/

参考

- [mongodb-manual](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)
- 