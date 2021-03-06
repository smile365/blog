---
title:  centos7安装mongo
date: 2018-08-13T02:55:14.439Z
tags: 
 - mongo
categories: ["code"]
---

**配置软件的安装源**


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

**安装及启动**  
```
yum install -y mongodb-org
```
编辑配置文：`vi /etc/mongod.conf` 

件建议修改日志文件路径/数据存储路径/端口/及启用密码。
 
```yaml
systemLog:
  path: /var/log/mongodb/mongod.log
storage:
  dbPath: /var/lib/mongo 
net:
  port: 47017 #监听端口
  bindIp: 0.0.0.0
security:
  authorization: enabled #启用安全认证
```

启动服务（不能使用systemctl启动）：`mongod -f /etc/mongod.conf`

**数据库管理**

创建数据库用户及分配权限:`mongo localhost:47017`  
```javascript
//创建管理员
use admin
db.createUser(
  {
    user: "sxy",
    pwd: "sxy91.com",
    roles: [ { role: "root", db: "admin" } ]
  }
);
//管理员认证
db.auth("sxy","sxy91.com")

//创建其他用户
use dbtest
db.createUser(
  {
    user: "dbuser",
    pwd: "sxy91.com",
    roles: [ { role: "readWrite", db: "dbtest" } ]
  }
);

exit;
```

重启mongod
```shell
systemctl stop mongod
mongod -f /etc/mongod.conf
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

统计Collection的数据量  
```javascript
use test
db.getCollectionNames().forEach(function(x){print(x+":"+db[x].count())})
```

**使用pymongo的python客户端**
```python
from pymongo import MongoClient
client = MongoClient("mongodb://[username:password@]host[:port][/[database][?options]]")

# 若用户名和密码中包含保留字符（如‘:’,‘/’,‘+’,‘@’ 等）必须按照RFC 2396进行百分比编码：
from urllib.parse import quote_plus
uri = "mongodb://%s:%s@%s:%s/%s" % (quote_plus(user),quote_plus(password),host,port,database)
client = MongoClient(uri)

client.dbname.tablename.insert_one({'_id':'a1','name':'test1'})
amount = client.dbname.tablename.count()
print(amount)

```


更多用法参考文档：

- [mongodb-manual](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/)
- [enable-authentication](https://docs.mongodb.com/manual/tutorial/enable-authentication/)
- [安装MongoDB](http://blog.csdn.net/liaoyundababe/article/details/71303039)
- [Ubuntu镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/mongodb/)
- [listCollections](https://stackoverflow.com/questions/8866041/how-to-list-all-collections-in-the-mongo-shell)
- [PyMongo-doc](https://api.mongodb.com/python/current/tutorial.html)
- [mongo-uri](https://docs.mongodb.com/manual/reference/connection-string/)