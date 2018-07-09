---
title:  Python项目部署说明
date: 2018-07-09T05:52:14.245Z
tags: ["交接文档"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

部署路径：/home/songxueyan/project
项目如下:
>打新：daxin
财经新闻：news
自选股导入：ocr
识别中签图片(巩俐男)：stockocr
打新验证码识别(巩俐男)：luckyocr
vip卡券：vipcard
快有：kuaiyou

配置文件：base/config.py

发布（以daxin为例）
cd /home/songxueyan/project/
nohup python3 daxin/app.py 1>daxin/log/out.log 2>daxin/log/err.log &

调试启动
cd daxin
python3 app.py