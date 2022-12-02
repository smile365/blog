---
title:  mac-AmorphousDiskMark
date: 2022-11-23
series: ["blog"]
categories: ["code"]
Description:  Mac下的测速软件AmorphousDiskMark初试
---
硬盘盒：ITGZ  m.2 JMS583  2230 硬盘盒 （66 元）
2230 固态： 镁光 2230 512G （某鱼 245 元）格式化成 [APFS](https://evestorm.github.io/posts/33677/)格式

![enter description here](https://cdn.sxy21.cn/static/imgs/1669186717752.png)


2019 mac air 自带硬盘 
![enter description here](https://cdn.sxy21.cn/static/imgs/1669187655393.png)

感觉写入特别低，可能是我们硬盘满了，只剩 6G 可用空间。


删除了一些文件，剩余空间 15G，再次测试
![enter description here](https://cdn.sxy21.cn/static/imgs/1669188907356.png)

提升还是挺明显的，但写入依旧没到 1000 MB/s，难道还是剩余空间不够？


对比一下我 usb2.0 的 u 盘
![enter description here](https://cdn.sxy21.cn/static/imgs/1669190236680.png)


这速度不能忍，拷贝一个 1 G 的文件进去要 3 分多钟，而 2230 固态只需要 1 秒。


对比 2014 年买的希捷 1T HDD（机械） 移动硬盘

![enter description here](https://cdn.sxy21.cn/static/imgs/1669260111160.png)



三星 128G TF 卡，用 3.0 的读卡器。难道是读卡器不行？官方宣传的读取速度是 130MB/s ，写入速度是 60MB/s 。
![enter description here](https://cdn.sxy21.cn/static/imgs/1669269057667.png)

换了一个质量和的读卡器，速度提升了一倍。确实跟读卡器有关系。
![enter description here](https://cdn.sxy21.cn/static/imgs/1669269791003.png)






金士顿 3.0 32G U盘

![enter description here](https://cdn.sxy21.cn/static/imgs/1669274820114.png)



总结一下：
- usb 2.0 的存储设备都可以淘汰了，速度奇慢，无法忍受。
- hdd （机械移动硬盘）也可以淘汰了，和 usb 2.0 相差不大。
- 2230 固态+硬盘盒是绝配，读取速度和电脑内置固态硬盘不相上下。而且小巧轻便，才两个拇指大小，只有普通移动硬盘的六分之一大小。
