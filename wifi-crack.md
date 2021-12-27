---
title:  wifi-crack
heading: 
date: 2021-11-23T13:37:23.761Z
categories: ["other"]
tags: 
description: 
---

常见工具：  

- [bully](https://www.kali.org/tools/bully/)
- [reaver](https://www.kali.org/tools/reaver/)
- [aircrack-ng](https://www.aircrack-ng.org/doku.php?id=install_aircrack#installing_on_mac_osx)


 
brew install autoconf automake libtool openssl shtool pkg-config


使用Aircrack-ng工具，依次输入以下命令
防止设备繁忙
1.airmon-ng check kill
查看无线网卡状态
2.ifconfig/iwconfig -a
加载无线网卡，已加载则忽略
3.ifconfig wlan0 up
激活网卡
4.airmon-ng start wlan0
探测无线网络
5.airodump-ng mon0


参考  
- [WiFi 安全与攻击案例分析](https://paper.seebug.org/1159/)
- [cracking-wifi-at-scale-with-one-simple-trick](https://www.cyberark.com/resources/threat-research-blog/cracking-wifi-at-scale-with-one-simple-trick)
- [wifi-attack-tools](https://linuxhint.com/wireless-attack-tools-kali-linux/)
- [wifi密码破解方法记录](https://www.jianshu.com/p/44d54b5369d8)
- [Mac上使用aircrack-ng破解Wi-Fi密码](https://uare.github.io/2016/cracking-wifi-by-aircrack-ng-on-mac)
- [近源渗透，超低成本打造自定义专属钓鱼WIFI](https://www.freebuf.com/articles/wireless/272733.html)
- [无线局域网攻防之Wi-Fi破解](https://www.freebuf.com/articles/wireless/280568.html)
- [知道创宇研发技能表v3](https://blog.knownsec.com/Knownsec_RD_Checklist/index.html)