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
2.ifconfig/iwconfig/ifconfig -a
加载无线网卡，已加载则忽略
3.ifconfig wlan0 up
激活网卡
4.airmon-ng start wlan0
探测无线网络
5.airodump-ng mon0

作者：宋叫兽
链接：https://www.jianshu.com/p/44d54b5369d8
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

参考  
- [WiFi 安全与攻击案例分析](https://paper.seebug.org/1159/)
- [cracking-wifi-at-scale-with-one-simple-trick](https://www.cyberark.com/resources/threat-research-blog/cracking-wifi-at-scale-with-one-simple-trick)
- [wifi-attack-tools](https://linuxhint.com/wireless-attack-tools-kali-linux/)
- [wifi密码破解方法记录](https://www.jianshu.com/p/44d54b5369d8)
- [Mac上使用aircrack-ng破解Wi-Fi密码](https://uare.github.io/2016/cracking-wifi-by-aircrack-ng-on-mac)