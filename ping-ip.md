---
title:  Linux命令之多线程ping一个ip段
heading: Linux命令一次性批量多线程ping一个ip段所有ip
date: 2021-01-12T08:29:28.741Z
categories: ["code"]
tags: 
description: linux 一次性批量多线程ping一个ip段所有ip,ping-ip
---



vi ip_ping.sh
```bash
#!/bin/bash
date
date
ip=10.3.1
port=22
for ((i=2;i<=254;i++))
do
{
        #ping $ip.$i -c 2 | grep -q "ttl=" && echo "$ip.$i yes"
        curl $ip.$i:$port -m 3 2>&1 | grep -q "SSH" && echo "$ip.$i:$port yes"
}&    
done    
wait 
date
```

可以 ping ip 段，也可以测试端口是否可用，大约 3~6 秒即可全部测试完成。

