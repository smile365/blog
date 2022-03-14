---
title:  android-backup
heading: 
date: 2022-03-07T08:35:34.397Z
categories: ["other"]
tags: 
description: 
---

## 使用 adb 命令备份手机数据

默认情况下安卓可以通过 `adb backup ` 命令[备份应用的数据](https://blog.csdn.net/qq_41730930/article/details/88074992)。

比如备份短信
```bash
adb shell pm list packages "telephony"
# com.android.providers.telephony
adb backup -f ~/Downloads/mmssms.db com.android.providers.telephony
# 在手机上点击“确定”
```


但是几乎大多数应用都在 [AndroidManifest.xml](https://segmentfault.com/a/1190000002590577) 中把 android:allowBackup 属性设置成 false 了, 这样就无法备份，命令执行完发现数据基本不超过 1k，比如备份通讯录。
```bash
adb backup -f ~/Downloads/contacts.db com.android.providers.contacts
```

想要修改 android:allowBackup，简单的方法就是安装前[修改 apk 的安装包](https://forum.xda-developers.com/t/guide-how-to-enable-adb-backup-for-any-app-changing-android-allowbackup.3495117/)，安装的时候就把这个设置改掉。

## root 之后备份手机数据

app 的数据大体分为 3 部分：
- 应用内存储，一般存储在 /data/data/app_packge_name，仅应用能访问。
- 公共存储，一般在 /sdcard，可公开访问。
- /data/app/xxx，安装包。

安装应用的时候，如果已经存在，则覆盖 /data/app/xxx，如果不存在则创建 /data/data/app_packge_name 的应用目录，用户和组会随机生成，比如腾讯的应用：
```bash
dipper:/data/data # ls -lh /data/data |grep tencent                                                                                              
drwx------ 37 u0_a248        u0_a248        4.0K 2022-03-02 09:21 com.tencent.android.qqdownloader
drwx------ 17 u0_a244        u0_a244        4.0K 2022-02-14 23:44 com.tencent.androidqqmail
drwx------ 41 u0_a204        u0_a204        4.0K 2022-03-05 16:03 com.tencent.map
drwx------ 61 u0_a227        u0_a227        4.0K 2022-02-18 23:24 com.tencent.mm
drwx------ 43 u0_a268        u0_a268        4.0K 2022-02-08 10:40 com.tencent.qqmusic
drwx------ 17 u0_a259        u0_a259        4.0K 2022-01-20 15:58 com.tencent.wemeet.app
drwx------ 18 u0_a236        u0_a236        4.0K 2022-02-10 01:18 com.tencent.weread
```

了解原理后即可备份应用数据。大多数应用的数据都存在 应用目录的[databases](https://www.cnblogs.com/slankka/p/9158599.html) 目录下。
```
# 备份
adb shell pm list packages "qq"
adb shell
su
cd /data/data 
ls grep "qq"
tar -czvf test.tar.gz com.tencent.qq
mv test.tar.gz /sdcard/Download/

# 也可以只备份应用下的这几个文件夹
# databases
# files
# shared_prefs


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

tar 命令说明：
 - -c或--create 建立新的备份文件。
 - -f<备份文件>或--file=<备份文件> 指定备份文件。
 - -v或--verbose 显示指令执行过程。
 - -z或--gzip或--ungzip 通过gzip指令处理备份文件。
 - -x或--extract或--get 从备份文件中还原文件。
 - -C<目的目录>或--directory=<目的目录> 切换到指定的目录。

## 增量备份
root 之后通过备份 /data/data/xxx 目录的方式缺点是无法增量备份。可以写个面具插件，当读取 app 的 allowBackup 属性时返回 true 即可。(此思路正在测试中)


也可通过第三方程序备份,比如[ Swift Backup](https://sspai.com/post/55454), 
[下载地址1:apkpure](https://apkpure.com/swift-backup/org.swiftapps.swiftbackup),[下载地址2:uptodown](https://swift-backup.cn.uptodown.com/android)


## 备份微信数据

微信在本地将应用数据存储在一个名为“EnMicroMsg.db”的加密 SQLite 数据库中。该数据库位于应用程序数据目录内的“MicroMsg”子文件夹中（通常类似于“/data/data/com.tencent.mm”）。数据库使用 [SQLCipher 进行加密](https://developer.aliyun.com/article/234032)，SQLCipher是 SQLite 的一个开源扩展，可提供完整的数据库加密，解密过程可参考[数据库的解密](https://www.jianshu.com/p/93bbcda3133a)


关键的数据如下： 
```bash
# wechat files
/data/data/com.tencent.mm # du -sh *
# 4.0K  .auth_cache # 没有这个数据就当做新设备
# 2.8G	MicroMsg # 聊天数据
# 576M	files
# 12K	account.bin
# 2.2M	databases
# 1.1M	shared_prefs
```

Android 9 之后 adb 无法以 root 权限运行，也有方法[](https://stackoverflow.com/questions/25271878/android-adbd-cannot-run-as-root-in-production-builds)可以解决。这样就可以直接 pull 文件了。




参考文档:
- [Android 属性 allowBackup 安全风险浅析](https://segmentfault.com/a/1190000002590577)
- [Android 数据备份方案值得了解](https://sspai.com/post/54075)
- [还在用钛备份？来看看这两款应用](https://sspai.com/post/60521)
- [录备份和恢复（旧机迁移至新机）](https://blog.csdn.net/qq_41730930/article/details/99314231)
- [xwalk是什么](https://dlmu2001.github.io/android/2016/11/24/use-crosswalk.html)
- [微信本地文件名逆向](https://ujoy.net/topics/2757429)
