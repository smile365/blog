---
title:  Selenium使用
date: 2018-08-27T05:37:22.077Z
tags: ["selenium"]
series: ["blog"]
categories: ["code"]
draft: true
description:
---

Selenium:网页自动化测试工具(通过各个浏览器的drive控制浏览器的行为)，给开发者提供控制浏览器的api，类似于sdk。
PhantomJS:没有页面的浏览器

### 使用selenium控制chrome
#### 安装selenium
selenium支持JAVA、Python等常用语言开发。这里选择python版本安装
```shell
pip install selenium
```
#### 安装chorme-drive
[下载驱动安装](http://chromedriver.chromium.org/downloads)，并把Chrome浏览器和驱动配置在环境变量里：`sudo mv ~/Downloads/chromedriver /usr/bin/`

#### 测试
```python
from selenium import webdriver
browser = webdriver.Chrome()
browser.get('https://sxy91.com/')
```

### 使用selenium控制PhantomJS
[下载PhantomJS](http://phantomjs.org/download.html)，并把执行路径配置到环境变量里：sudo mv ~/Downloads/phantomjs-2.1.1-macosx/bin/phantomjs /usr/bin/`

#### 测试
```python
from selenium import webdriver
driver = webdriver.PhantomJS()
driver.get('https://sxy91.com/')
print(driver.title)
```


参考：
- [Selenium的用法](https://cuiqingcai.com/2599.html)
