---
title:  ping-ip
heading:
date: 2021-01-12T08:29:28.741Z
categories: ["code"]
tags: 
description: linux 一次性批量多线程ping一个ip段所有ip
---


vi ip_ping.sh
```bash
#!/bin/bash
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
```

