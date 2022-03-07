---
title:  android-backup
heading: 
date: 2022-03-07T08:35:34.397Z
categories: ["other"]
tags: 
description: 
---

默认情况下安卓可以通过 `adb backup ` 命令[备份应用的数据](https://blog.csdn.net/qq_41730930/article/details/88074992)，但是几乎大多数应用都在 [AndroidManifest.xml](https://segmentfault.com/a/1190000002590577) 中吧 android:allowBackup 属性设置成 false 了。

简单的方法就是安装前[修改 apk 的安装包](https://forum.xda-developers.com/t/guide-how-to-enable-adb-backup-for-any-app-changing-android-allowbackup.3495117/)，安装的时候就把这个设置改掉。

```
# 备份
adb shell pm list packages "qq"
adb shell
su
cd /data/data 
ls grep "qq"
tar -czvf test.tar.gz com.tencent.qq
mv test.tar.gz /sdcard/Download/
# 恢复
adb install /Users/songyangcong/Downloads/qq.apk
adb shell
su
cd /data/data/
mv com.tencent.qq com.tencent.qq.bak
tar -zxvf test.tar.gz
ls -lh |grep qq                                         
# drwx------  4 u0_a279        u0_a279   
chmod -R go-xwr com.tencent.qq
chown -R u0_a280:u0_a280 com.tencent.qq
# chmod -R u+xwr  com.tencent.qq

```



-c或--create 建立新的备份文件。
-f<备份文件>或--file=<备份文件> 指定备份文件。
-v或--verbose 显示指令执行过程。
-z或--gzip或--ungzip 通过gzip指令处理备份文件。
-x或--extract或--get 从备份文件中还原文件。
-C<目的目录>或--directory=<目的目录> 切换到指定的目录。


应用内的数据仅应用能访问，一般存储在 /data/data/app_packge_name 下，公开的数据一般存储在 /sdcard/xxx 下。





参考文档:
- [Android 属性 allowBackup 安全风险浅析](https://segmentfault.com/a/1190000002590577)
- [Android 数据备份方案值得了解](https://sspai.com/post/54075)
- [还在用钛备份？来看看这两款应用](https://sspai.com/post/60521)
- [录备份和恢复（旧机迁移至新机）](https://blog.csdn.net/qq_41730930/article/details/99314231)
