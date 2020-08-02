---
title:  requests-html简单入门教程
heading: requests-html简单入门教程
date: 2020-07-29T07:42:43.699Z
categories: ["code"]
tags: 
description: 
---

requests与requests-html的区别是，前者比较方面处理如何发送请求，后者比较方面如何处理响应的内容（网页内容）

比如选取网页的某些元素，把网页内结构化等等。



安装
```bash
# 先把pyppeteer升级到最新版
pip install pyppeteer -U -i https://mirrors.163.com/pypi/simple/
pip install requests-html

```

> 注：requests-html仅支持Python 3.6及更高版本。不同pyppeteer版本安装的chromium版本不同。


运行
```python
from requests_html import HTMLSession

session = HTMLSession()
r = session.get('http://sxy91.com/posts/requests-html /')
print(r.html.absolute_links)
```




默认是获取静态网页的内容。

部分网页的内容由js动态生成，requests_html也支持获取js渲染后的内容。获取内容之前调用`r.html.render()`即可

requests_html通过pyppeteer调用Chromium来渲染网页。

若电脑上检测不到Chromium，第一次调用r.html.render()的时候会自动下载。linux下载路径为`~/.pyppeteer/`,mac路径为`～/Library/Application Support/pyppeteer/local-chromium`





