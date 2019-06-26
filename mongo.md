---
title:  centos7安装mongo
date: 2018-08-13T02:55:14.439Z
tags: 
 - mongo
draft: true
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

在[mongo官网](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)找到repo源,并添加`vi /etc/yum.repos.d/mongodb-org-4.0.repo`

把地址改为阿里的：
```ini
[mongodb-org-4.0]
name=MongoDB Repository
#baseurl = https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.0/x86_64/ 
baseurl=https://mirrors.aliyun.com/mongodb/yum/redhat/7Server/mongodb-org/4.0/x86_64/
#gpgcheck=1
gpgcheck=0
enabled=1
#gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc
```
> 奇数版本为开发版(如3.5)，不建议生产环境使用

运行命令安装`yum install -y mongodb-org`


启动服务`mongod -f /etc/mongod.conf`
>不能使用 systemctl 启动


创建管理员
```javascript
use admin
db.createUser(
  {
    user: "sxy",
    pwd: "sxy91.com",
    roles: [ { role: "root", db: "admin" } ]
  }
);
exit;
```
>设置密码：不要含有@

启用用户认证，并配置日志路径`vi /etc/mongod.conf`
```yaml
systemLog:
  path: /var/log/mongodb/mongod.log
net:
  port: 47017 #监听端口
  bindIp: 0.0.0.0
security:
  authorization: enabled #启用安全认证
```


重启mongod
```shell
systemctl stop mongod
mongod -f /etc/mongod.conf
```



创建其他用户
```javascript
use mydb
db.createUser({user:'myuser',pwd:'sxy91.com',roles: [ { role: "readWrite", db: "mydb" }]})
```

使用mongo shell连接
```shell
mongo 192.168.31.93:47017/mydb -u user -p pass
```

正常关闭
```javascript
use admin
db.shutdownServer()
```


参考

- [mongodb-manual](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)
- [enable-authentication](https://docs.mongodb.com/manual/tutorial/enable-authentication/)
- [安装MongoDB](http://blog.csdn.net/liaoyundababe/article/details/71303039)
- [Ubuntu镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/mongodb/)