---
title:  holocubic
heading: 
date: 2022-03-04T14:12:35.613Z
categories: ["other"]
tags: 
description: 
---

[HoloCubic](https://github.com/peng-zhihui/HoloCubic)项目介绍

软件介绍
- **git**, 下载代码
- **Altium Designer**，设计电路板的软件
- **VSCode**，打开代码
- **Fusion 360**，

## 成本 
- 打印电路板 40
- 打印 3d 模型底座  15
- 购买分光棱镜 90
- 购买电子元器件 120
- 购买焊接工具 400

**购买焊接工具** 

| 名称       | 型号 | 规格      | 价格 |
| ---------- | ---- | --------- | ---- |
| 有铅焊锡膏 |      | 30g       | 25   |
| 镊子       |      |           | 20   |
| 拆焊台     |      |           | 20   |
| 电烙铁     |      |           | 100  |
| 焊锡丝     |      |           | 20   |
| 洗板水     |      |           | 20   |
| 万用表     | 众仪ZT-Y2     |           | 100  |
合计 400 元


 



步骤：
1. 下载项目文件
2. 打开电路板设计文件，发给厂家生产
3. 购买电子原件
4. 购买焊接工具
5. 把电子原件焊接到电路板上
6. 用 Fusion 360 打开 3d 模型设计文件，发给[3d打印厂商](https://www.sanweihou.com/)，生产底座。
7. 


需要安装的软件
- git ，[下载](https://git-scm.com/downloads)
- Altium Designer, [下载](https://pan.baidu.com/share/init?surl=Pv9k0FPlfHzJUIcYQFhbew), 密码 lh74。仅支持 Windows。Mac 替代方案 [kicad](https://www.kicad.org/)。
- VSCode, [下载](https://code.visualstudio.com/)
- Fusion360,  [下载](https://www.autodesk.com.cn/products/fusion-360/free-trial?trial=trialdownloads-f360), 需要注册

参考[思维导图]([软件](https://www.canva.cn/design/DAEw1e4CEyc/X1hiJK5UU0n6zFql7MuHDA/view?utm_content=DAEw1e4CEyc&utm_campaign=designshare&utm_medium=link&utm_source=publishshareli#3))


用 Altium  Designer 打开项目生成 gerber 文件，上传到 [嘉立创](https://www.jlc.com/)，生产出电路板。（也可以发送 pcb 文件）

**电路板**：电子元器件的家。

用 Altium Designer 打开项目生成 bom 表（元器件清单），按照列表到[立创商城](https://www.szlcsc.com/)购买所需元器件。参考[购买教程](https://www.bilibili.com/video/BV11h41147iJ?p=3&spm_id_from=pageDriver)，清单 2:10,购买记录 12:15。忘买的补充，[屏幕](https://www.bilibili.com/video/BV11h41147iJ?p=8&spm_id_from=pageDriver)

到淘宝购买[焊接工具](https://www.bilibili.com/video/BV11h41147iJ?p=4&spm_id_from=pageDriver)等工具。
- 有铅锡膏
- 镊子，
- 拆焊台 20元
- 焊锡膏
- 电烙铁
- 焊锡丝
- 洗板水，
- 分光棱镜 25 毫米, 85元。
- 万用表 [使用教程](https://www.bilibili.com/video/BV11h41147iJ?p=11),  时间轴 5:38

焊接，组装成硬件。[焊接教程](https://www.bilibili.com/video/BV11h41147iJ?p=11)


注入灵魂（固件）


用 vs code 打开项目代码，[编译成固件](https://www.bilibili.com/video/BV11h41147iJ?p=5&spm_id_from=pageDriver)。


如果需要改显示的东西，那么可以先[在电脑上模拟](https://www.bilibili.com/video/BV11h41147iJ?p=6&spm_id_from=pageDriver)再烧录到硬件里，用到下面两个软件。

vs code 安装插件 PlatformIO IDE，[创建一个项目](https://www.bilibili.com/video/BV11h41147iJ?p=5),时间轴 1:10 。


[platform io 模拟器](https://github.com/lvgl/lv_platformio)

[platfrmioSimLvgl](https://github.com/Sakulaczx/platfrmioSimLvgl)


[其他固件](https://github.com/ClimbSnail/HoloCubic_AIO)


发给厂商，或者去淘宝 3 d 打印，[3d打印底座](https://www.bilibili.com/video/BV11h41147iJ?p=7&spm_id_from=pageDriver), 3：39


