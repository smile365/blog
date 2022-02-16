---
title: alpine 
heading: 
date: 2022-02-16T03:32:29.694Z
categories: ["other"]
tags: 
description: 
---

下载VIRTUAL 版本下的[ alpine-virt-x86_64.iso](https://alpinelinux.org/downloads/) 镜像文件。


用 pve 创建一个虚拟机，挂载刚刚下载的镜像。（别忘了增加串口0）

![enter description here](https://gitee.com/smile365/blogimg/raw/master/小书匠/1644983838329.png)


网页上的 console 不方便粘贴复制命令，启动后，在 pve 机器终端用 qm 命令连接 alpine 的终端。然后参考 [安装 alpine 教程](https://zhuanlan.zhihu.com/p/107963371)进行安装。 
```
qm terminal 101 -iface serial0
# 回车
setup-alpine
cn

# 镜像选择 
Available mirrors:
1) dl-cdn.alpinelinux.org
2) uk.alpinelinux.org
3) dl-4.alpinelinux.org
4) dl-5.alpinelinux.org
5) mirror.yandex.ru
6) mirrors.gigenet.com
7) mirror1.hs-esslingen.de
8) mirror.leaseweb.com
9) mirror.fit.cvut.cz
10) alpine.mirror.far.fi
11) alpine.mirror.wearetriple.com
12) mirror.clarkson.edu
13) mirror.aarnet.edu.au
14) mirrors.dotsrc.org
15) ftp.halifax.rwth-aachen.de
16) mirrors.tuna.tsinghua.edu.cn
17) mirrors.ustc.edu.cn
18) mirrors.nju.edu.cn
19) mirror.lzu.edu.cn
20) ftp.acc.umu.se
21) mirror.xtom.com.hk
22) mirror.csclub.uwaterloo.ca
23) alpinelinux.mirror.iweb.com
24) pkg.adfinis.com
25) mirror.ps.kz
26) mirror.rise.ph
27) mirror.operationtulip.com
28) mirrors.ircam.fr
29) alpine.42.fr
30) mirror.math.princeton.edu
31) mirrors.sjtug.sjtu.edu.cn
32) ftp.icm.edu.pl
33) mirror.ungleich.ch
34) sjc.edge.kernel.org
35) ewr.edge.kernel.org
36) ams.edge.kernel.org
37) download.nus.edu.sg
38) alpine.yourlabs.org
39) mirror.pit.teraswitch.com
40) mirror.reenigne.net
41) quantum-mirror.hu
42) tux.rainside.sk
43) alpine.cs.nctu.edu.tw
44) mirror.ihost.md
45) mirror.ette.biz
46) mirror.lagoon.nc
47) alpinelinux.c3sl.ufpr.br
48) foobar.turbo.net.id
49) alpine.ccns.ncku.edu.tw
50) mirror.dst.ca
51) mirror.kumi.systems
52) mirror.sabay.com.kh
53) alpine.northrepo.ca
54) alpine.bardia.tech
55) mirrors.ocf.berkeley.edu
56) mirrors.pardisco.co
57) mirrors.aliyun.com
58) mirror.alwyzon.net
59) mirror1.ku.ac.th
60) mirrors.bfsu.edu.cn
61) ftpmirror2.infania.net
62) repo.iut.ac.ir


r) 从上面的列表中添加随机数
f) 从上面的列表中检测并添加最快的镜像
e) 使用文本编辑器编辑 /etc/apk/repositories

选择 f 会所有镜像测一遍，比较慢。直接输入 16 或者 57

16) mirrors.tuna.tsinghua.edu.cn # 清华
57) mirrors.aliyun.com # 阿里云

最后是否格式化 sda 选择 y。否则会安装失败。
 
# 重启
reboot

```


如需开机启动，在 pve 的 options 界面中把 start at boot 设置成 yes。 

后期如需更改源，请参考[教程](https://mirrors.tuna.tsinghua.edu.cn/help/alpine/)


安装 软件
```bash
# 开启 root 用户远程管理
echo "PermitRootLogin  yes" >> /etc/ssh/sshd_config
# 安装 vim、nginx
apk add vim nginx nginx-mod-stream
# 需要手动安装 stream 模块
# 否则报错 nginx: [emerg] unknown directive "stream" in

cd /etc/nginx
# 备份文件
mv nginx.conf nginx.conf.bak
# 方便修改去掉注释行
grep -v "#" nginx.conf.bak > nginx.conf 
# 最后增加一行
mkdir tcp.d
echo "include /etc/nginx/tcp.d/*.conf;" >> nginx.conf 
```

```bash
# vi tcp.d/pve.conf
# pve.conf
stream{
    upstream pve{
        hash $remote_addr consistent;
        server 	10.0.0.113:8006 max_fails=3 fail_timeout=10s;  
    }
    server{
        listen 8006;
        proxy_connect_timeout 20s;
        proxy_timeout 5m;
        proxy_pass pve;
    }
}
```


http 反向代理
```pf.conf
# cat http.d/default.conf
server{
    listen 5000; # dsm
    location / {
            proxy_pass http://10.0.0.117:5000;
    }
}

server{                                          
    listen 9117; # JackettAPI     
    location / {     
            proxy_pass http://10.0.0.117:9117;
    }                               
} 
```

重启 nginx
```bash
nginx -t
nginx -s reload

apk add -U wireguard-tools

cd /etc/wireguard && wg genkey | tee privatekey | wg pubkey > publickey
cat /etc/wireguard/publickey 
vi wg0.conf

[Interface]
Address = 10.0.8.2
SaveConfig = true
ListenPort = 49152
PrivateKey = 当前私钥

[Peer]
PublicKey = 公网的公钥
Endpoint = 你的公网:49152
AllowedIPs = 10.0.8.0/24        
```


Alpine 没有 systemc 之类的工具，相似的工具是 [awall](https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-with-awall-on-alpine-linux/)
```bash
# apk update && apk upgrade
## Install both IPv4 and IPv6 version of IPtables ##
# apk add ip6tables iptables
## Install awall ##
# apk add -u awall
## Verify it ##
# apk version awall
```

让 [wireguard开机启动](https://www.cyberciti.biz/faq/how-to-set-up-wireguard-vpn-server-on-alpine-linux/) 

配置 nginx udp [端口转发](https://blog.51cto.com/moerjinrong/2287680)
