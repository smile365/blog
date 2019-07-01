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
	await browser.close()

asyncio.get_event_loop().run_until_complete(main())
```

参考  

- [Pyppeteer:比selenium更高效的利器](https://mp.weixin.qq.com/s/PnKdH_wq2sWKr-Wq55fy-A)
- [install-chromium](https://www.technig.com/install-chromium-on-centos/)
- [selenium-and-chrome](https://github.com/smile365/blog/blob/master/selenium.md)