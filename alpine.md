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


#开启 root 用户远程管理
echo "PermitRootLogin  yes" >> /etc/ssh/sshd_config

```


如需开机启动，在 pve 的 options 界面中把 start at boot 设置成 yes。 

后期如需更改源，请参考[教程](https://mirrors.tuna.tsinghua.edu.cn/help/alpine/)


