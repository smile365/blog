---
title:  "U盘遇到“DiskPart 遇到错误: 拒绝访问”的处理方法"
heading: 
date: 2020-08-13T10:19:51.141Z
categories: ["code"]
tags: 
description:  "DiskPart 遇到错误: 拒绝访问。"
---


用u盘做了一个系统启动盘，手贱直接从电脑拔掉u盘，插到台式机电脑，磁盘管理能看到u盘和盘符，但我的电脑死活找不到u盘。用系统的磁盘管理删除分区，格式化，重新分配盘符，结果无法设定盘符，提示“系统找不到指定的文件”。

按照方法操作如下

操作步骤：

win+r 打开运行，输入：C:\Windows\System32\diskpart.exe 运行diskpart.exe。
依次输入以下命令：
```bash
DISKPART> sel
DISKPART> list disk
DISKPART> sel disk 1
DISKPART> clean
```

我遇到的问题是，输入clean命令后，提示：
```bash
DiskPart 遇到错误: 拒绝访问。
有关详细信息，请参阅系统事件日志。 
```

发现是因为装机过程中u盘已经写入了临时文件在保护分区。

解救步骤如下：
- 1.安装diskgenius
- 2.找到u盘，点击“清除保留扇区”。
- 3.点击新建分区，然后在分区下面点击指派新的驱动器号，自动格式化后就可以用了。

安装系统发现无法选择ssd固态硬盘。拆开主机，把ssd拆下来放到带有usb的硬盘盒里。

硬盘盒连到mac，发现未初始化，点击擦除，一直停留在“正在等待分区激活”。
硬盘盒连到windows，显示“磁盘1 未知 没有初始化”，点击初始化，没有反应。

打开diskgenius，检测坏道与修复，检测完发现全是优秀和良好，没有发现坏道。

使用diskgenius“清除扇区数据”，（可以不等它完成就取消）。结果出现“diskgenius保存分区表时出现错误00000032不支持该请求”。

磁盘上点击右键，再点击清除扇区数据即可解决问题。




参考文献
- [磁盘管理疑难解答](https://docs.microsoft.com/zh-cn/windows-server/storage/disk-management/troubleshooting-disk-management#disks-that-are-missing-or-not-initialized-plus-general-troubleshooting-steps)
- [Attribute "partition" not found](https://askubuntu.com/questions/946638/attribute-partition-not-found-error-when-formatting-usb-flash-drive)
- [如何在Linux中创建磁盘分区](https://www.linuxidc.com/Linux/2019-05/158492.htm)