---
title:  clickhouse
heading: 
date: 2020-03-12T03:06:50.536Z
categories: ["code"]
draft: true
tags: 
description: 
---

`CentOS 7`换成[清华的镜像](https://mirrors.tuna.tsinghua.edu.cn/help/centos/)或者[阿里云的镜像](https://developer.aliyun.com/mirror/centos?spm=a2c6h.13651102.0.0.3e221b11XBR0VU)

```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
yum makecache
```

> 若出现`Couldn't resolve host 'mirrors.cloud.aliyuncs.com'`、`Could not resolve host: mirrors.aliyun.com; 未知的错误`、`Could not resolve host: mirrors.tuna.tsinghua.edu.cn; 未知的错误`等，运行`echo "nameserver 8.8.8.8" >> /etc/resolv.conf` 即可。


安装[clickhouse](https://clickhouse.tech/#quick-start)
```bash
sudo yum install -y yum-utils
sudo rpm --import https://repo.yandex.ru/clickhouse/CLICKHOUSE-KEY.GPG
sudo yum-config-manager --add-repo https://repo.yandex.ru/clickhouse/rpm/stable/x86_64
sudo yum install -y clickhouse-server clickhouse-client
sudo /etc/init.d/clickhouse-server start
clickhouse-client
```

参考

- [ClickHouse使用](https://www.zouyesheng.com/clickhouse.html)
- [ClickHouse表引擎及作用](http://liangfan.tech/2019/01/03/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3ClickHouse%E4%B9%8B6-%E8%A1%A8%E5%BC%95%E6%93%8E%E5%8F%8A%E4%BD%9C%E7%94%A8/)
- [clickhouse-python](https://clickhouse-driver.readthedocs.io/en/latest/)
- [clickhouse性能测试](https://www.jianshu.com/p/f9a54193dc63)