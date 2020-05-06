---
title:  图片转文字，视频转文字，音频转文字教程
heading: 
date: 2020-05-06T07:05:00.537Z
categories: ["code"]
tags: 
description: 
---


#### 图片转文字

即图片ocr识别，使用超轻量级中文ocr[chineseocr_lite](https://github.com/ouyanghuiyu/chineseocr_lite)识别文字（支持竖排文字识别）。


#### 视频转文字

先使用[FFmpeg](https://github.com/FFmpeg/FFmpeg)，FFmpeg是用于处理多媒体内容（例如音频，视频，字幕和相关元数据）的库和工具的集合。使用教程参考[ffmpeg常用操作](https://gist.github.com/biezhi/6115ca2dac43b52fb0a349158d8f5086)，把视频转成音频。

然后使用基于深度学习的中文语音识别系统[ASRT_SpeechRecognition](https://github.com/nl8590687/ASRT_SpeechRecognition),把音频转为文字。具有相似功能的开源项目还有[masr](https://github.com/libai3/masr)



#### install ffmpeg on centos 7

先添加[RPM Fusion](https://rpmfusion.org/)，如果是centos8请替换相应链接。  

```bash
sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
```

然后安装ffmpeg  
```bash
yum install ffmpeg ffmpeg-devel
ffmpeg -version
# ffmpeg version 3.4.7 Copyright (c) 2000-2019 the FFmpeg developers
```

下载[asrt](https://asrt.ailemon.me/download.html)  

```bash 
unzip ASRT_v0.6.1.zip
cd ASRT_v0.6.1
```

使用pip安装python[所需依赖](https://github.com/nl8590687/ASRT_SpeechRecognition#python-import)

```bash
# vi requirements.txt
python_speech_features
TensorFlow
Keras
Numpy
wave
matplotlib
math
Scipy
h5py
http
urllib
#  pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

