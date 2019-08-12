---
title:  pyppeteer-and-chromium
date: 2019-07-01T02:11:34.220Z
tags: 
 - pyppeteer
 - chromium
draft: true
---


安装
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
	browser = await launch(executablePath='/usr/bin/chromium-browser',args=['--no-sandbox'])
	page = await browser.newPage()
	await page.goto('https://sxy91.com')
	await page.screenshot({'path': 'sxy.png'})
	await asyncio.sleep(30)
	title = await page.title()
	print(title)

asyncio.get_event_loop().run_until_complete(main())
```

会话关闭的解决办法
==
20秒不操作后会话关闭，会出现错误:`Session closed. Most likely the page has been closed`
pyppeteer的开发团队似乎比较忙，还没修复。可参考[pyppeteer#159](https://github.com/miyakogi/pyppeteer/pull/160/files),修改源码`pyppeteer/connection.py`
```git 
- self._url, max_size=None, loop=self._loop)
+ self._url, max_size=None, loop=self._loop,ping_interval=None, ping_timeout=None)
```


参考  

- [Pyppeteer:比selenium更高效的利器](https://mp.weixin.qq.com/s/PnKdH_wq2sWKr-Wq55fy-A)
- [install-chromium](https://www.technig.com/install-chromium-on-centos/)
- [selenium-and-chrome](https://github.com/smile365/blog/blob/master/selenium.md)
- [Session-closed-error](https://blog.csdn.net/weixin_39198406/article/details/86719814)