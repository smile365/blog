---
title:  pyppeteer简明教程
heading: 爬虫神器pyppeteer的使用教程方法
date: 2019-07-01T02:11:34.220Z
tags: ["pyppeteer的使用","pyppeteer淘宝","pyppeteer微博","puppeteer python"]
categories: ["code"]  
---

Puppeteer它是一个Node库，提供了一个高级的API来控制DevTools协议上的无头版Chrome，可以自动化控制浏览器运行。pyppeteer是python版的实现。

centos7安装pyppeteer
==

```sh
yum -y install chromium
python3 -m pip install pyppeteer
```

测试  
==
```python
import asyncio
from pyppeteer import launch

async def main():
	browser = await launch(executablePath='/usr/bin/chromium-browser',headless=True,devtools=False)
	page = await browser.newPage()
	await page.goto('https://sxy91.com')
	await page.screenshot({'path': 'sxy.png'})
	await asyncio.sleep(30)
	title = await page.title()
	print(title)

asyncio.get_event_loop().run_until_complete(main())
```
参数说明
- **executablePath**：运行Chromium或Chrome可执行文件的路径，而不是默认捆绑的Chromium
- **headless**：是否使用无头模式（无界面）运行
- **devtools**：是否打开开发者调试工具，打开后忽略headless参数自动改成False

会话关闭的解决办法
==
20秒不操作后会话关闭，会出现错误:`Session closed. Most likely the page has been closed`  
pyppeteer的开发团队似乎比较忙，还没修复。可参考[pyppeteer#159](https://github.com/miyakogi/pyppeteer/pull/160/files),修改源码`pyppeteer/connection.py`，替换第44行源码。
```git 
self._ws = websockets.client.connect(
- self._url, max_size=None, loop=self._loop)
+ self._url, max_size=None, loop=self._loop,ping_interval=None, ping_timeout=None)
```


参考  

- [Pyppeteer:比selenium更高效的利器](https://mp.weixin.qq.com/s/i1Sr5xIURsoaSJK8ajGEqw)
- [install-chromium](https://www.technig.com/install-chromium-on-centos/)
- [selenium-and-chrome](https://github.com/smile365/blog/blob/master/selenium.md)
- [Session-closed-error](https://blog.csdn.net/weixin_39198406/article/details/86719814)