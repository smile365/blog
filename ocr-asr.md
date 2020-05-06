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




