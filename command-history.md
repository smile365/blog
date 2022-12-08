---
title:  linux history 操作记录和审计日志
date: 2022-12-8
tags: ["code","it"]
series: ["blog"]
categories: ["code"]
Description: 
---



[snoopy](https://github.com/a2o/snoopy/blob/master/doc/INSTALL.md)提供了 5 种安装方式
```bash
wget -O install-snoopy.sh https://github.com/a2o/snoopy/raw/install/install/install-snoopy.sh
chmod 755 install-snoopy.sh
sudo ./install-snoopy.sh stable

# 启用
/usr/local/snoopy/snoopyctl enable
# 查看是否启用（没启用需要重启）
cat /etc/ld.so.preload
# /usr/local/snoopy/lib/libsnoopy.so
# 或者用 ldd 查看
ldd /bin/pwd
# /usr/local/snoopy/lib/libsnoopy.so
```


Linux 终端 操作记录


参考文档
- [linux下用户操作记录审计环境的部署记录](https://developer.aliyun.com/article/346761)
- [LINUX终端记录神器---Script命令](https://cloud.tencent.com/developer/article/1902079)
- [如何防止丢失任何 bash 历史命令](https://felixc.at/2013/09/how-to-avoid-losing-any-history-lines/)
- [LINUX下用户操作记录审计-history](https://blog.51cto.com/lwm666/2174734)
- [审计 Linux 系统的操作行为的 5 种方案对比](http://blog.arstercz.com/how-to-audit-linux-system-operation/#snoopy-%E8%AE%B0%E5%BD%95%E6%96%B9%E5%BC%8F)
- [snoopy命令日志审计](https://www.jianshu.com/p/d2c79950b32e)