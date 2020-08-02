---
title:  scrapy-splash与scrapy-redis的使用
heading:  
date: 2020-07-24T06:35:35.553Z
categories: ["code"]
tags: 
description: scrapy-splash
---

先安装[docker](http://sxy91.com/posts/docker) 
安装并运行splash：  
```bash
docker pull scrapinghub/splash
docker run -dit -p 8050:8050 --name splash scrapinghub/splash
```

pip install scrapy-redis

运行一个测试项目
```
pip install scrapy
pip install scrapy-splash
git clone https://github.com/Python3WebSpider/ScrapySplashTest
cd ScrapySplashTest
# 修改splash地址和mongo地址
vim scrapysplashtest/settings.py
# 运行
scrapy crawl taobao
```



