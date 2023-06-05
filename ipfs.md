---
title:  ipfs
heading: 
date: 2022-07-25T16:46:23.029Z
categories: ["code"]
tags: 
description: 
---

## IPFS 介绍

星际文件系统（InterPlanetary File System，缩写为IPFS）是一个旨在实现文件的分布式存储、共享和持久化的网络传输协议。该技术诞生于 2014 年，由协议实验室（Protocol Labs）创建，IPFS 整合了最先进的网络技术，如（BitTorrent、DHT、Git、SFS等）。

## IPFS 用途
参考
- [24个IPFS应用项目](https://www.163.com/dy/article/GJPIJU3O0552EI9F.html)
- [使用案例](https://zh.wikipedia.org/wiki/%E6%98%9F%E9%99%85%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F#%E4%BD%BF%E7%94%A8%E6%A1%88%E4%BE%8B)
- [玩转 ipfs](https://zhuanlan.zhihu.com/p/93803533)

## 安装
参考 [在 docker 中安装 ipfs](https://docs.ipfs.tech/install/run-ipfs-inside-docker/#set-up)

Start a container running ipfs and expose ports 4001 (P2P TCP/QUIC transports), 5001 (RPC API) and 8080 (Gateway):

```bash
docker pull ipfs/kubo
docker run -d --name ipfs -p 4001:4001 -p 4001:4001/udp -p 8080:8080 -p 5001:5001 ipfs/kubo
docker logs -f ipfs

docker exec ipfs ipfs swarm peers

```

```yaml

version: '3'

services:
  ipfs:
    image: ipfs/kubo
    restart: always
    ports:
      #- "4001:4001"  # P2P TCP/QUIC transports
      #- "8080:8080"  # Gateway
      - "5001:5001"   # RPC API
```

## 在 spring boot 项目使用 ipfs 存储 Java 对象

当做序列化存储的后端。

创建一个 Java spring boot 项目，引入依赖
```xml
    <dependency>
        <groupId>com.github.ipfs</groupId>
        <artifactId>java-ipfs-api</artifactId>
        <version>v1.4.0</version>
    </dependency>

    <dependency>
        <groupId>com.alibaba.fastjson2</groupId>
        <artifactId>fastjson2</artifactId>
        <version>2.0.22</version>
    </dependency>
```

创建一个 Person 类
```java
public class Person {
    private String name;
    private String address;

    public Person(String name, String address) {
        this.name = name;
        this.address = address;
    }

    public Person() {
    }
}
```

创建一个测试类
```java

public class IPFSdemo {
    private static IPFS ipfs = new IPFS("/ip4/127.0.0.1/tcp/5001");

    public static String saveToIpfs(Person person) throws IOException {
        MerkleNode put = ipfs.dag.put("json", JSON.toJSONString(person).getBytes());
        return put.hash.toString();
    }

    public static Person getFromIpfs(String hash) throws IOException {
        Cid expected = Cid.decode(hash);
        byte[] get = ipfs.dag.get(expected);
        return JSON.parseObject(get,Person.class);
    }


    public static void main(String[] args) throws IOException {
        String hash = saveToIpfs(new Person("SongYangCong","KunMing"));
        System.out.println("hash:"+hash);
        Person p = getFromIpfs(hash);
        System.out.println(p.toString());
    }
}
```


## 问题解决
1. 无法连接到IPFS API,Unable to connect to the provided IPFS API address

这是 kubo UI 的 bug。




参考连接：
- [IPFS的配置记录](https://www.cnblogs.com/milton/p/13100209.html)
- [kubo](https://github.com/ipfs/kubo)
- [IPFS私有网络集群搭建](https://yuanxuxu.com/2020/01/09/ipfs%E7%A7%81%E6%9C%89%E7%BD%91%E7%BB%9C%E9%9B%86%E7%BE%A4%E6%90%AD%E5%BB%BA/)

