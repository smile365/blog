---
title:  pyppeteer简明教程
heading: 爬虫神器pyppeteer的使用教程方法
date: 2019-07-01T02:11:34.220Z
tags: ["pyppeteer的使用","pyppeteer淘宝","pyppeteer微博","puppeteer python"]
categories: ["code"]  
---

Puppeteer它是一个Node库，提供了一个高级的API来控制DevTools协议上的无头版Chrome，可以自动化控制浏览器运行。pyppeteer是python版的实现。

centos7安装[pyppeteer](https://miyakogi.github.io/pyppeteer/)
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
	browser = await launch()
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
pyppeteer的开发团队似乎比较忙，还没修复。可参考[pyppeteer#159](https://github.com/miyakogi/pyppeteer/pull/160/files),修改源码`pyppeteer/connection.py`，替换第44行源码。
```git 
self._ws = websockets.client.connect(
- self._url, max_size=None, loop=self._loop)
+ self._url, max_size=None, loop=self._loop,ping_interval=None, ping_timeout=None)
```

使用pyppeteer自动发送微博的例子
```python
import asyncio
from pyppeteer import launch

home_url = 'https://weibo.com/'
ua = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'
CHROME_PATH = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

img = '/Users/songyangcong/Pictures/6781573623694_.pic.jpg'

async def sendimg(path,headless=False,devtools=False):
	browser = await launch(executablePath=path,headless=headless,devtools=devtools,userDataDir='./tmp/userdata',args=['--no-sandbox','--disable-infobars'])
	pages  = await browser.pages()
	if len(pages) < 1:
		page = await self.browser.newPage()
	else:
		page = pages[0]
	await page.setViewport({'width':1366,'height':768})
	await page.setUserAgent(ua)	
	await page.goto(home_url)
	await asyncio.sleep(15)  # 等待15秒，先手动登录一下
	await page.type('textarea',"测试微博自动发送内容")
	fileInput = await page.J('input[type=file]')
	await fileInput.uploadFile(img)	# pyppeteer upload image 发布图片
	await asyncio.sleep(2)
	await page.click('a[node-type="submit"]')	# 点击发布
	#await page.click('a[node-type="submit"]') 
	await asyncio.sleep(100)
	
def test():
	asyncio.get_event_loop().run_until_complete(sendimg(CHROME_PATH))
	
if __name__ == '__main__':
	test()
```

常用参数说明
- **executablePath**：运行Chromium或Chrome可执行文件的路径，而不是默认捆绑的Chromium
- **headless**：是否使用无头模式（无界面）运行
- **devtools**：是否打开开发者调试工具，打开后忽略headless参数自动改成False
- **userDataDir**：自动保存浏览器数据到磁盘，登录一次后可免登录（记录cookies）



参考  

- [Pyppeteer:比selenium更高效的利器](https://mp.weixin.qq.com/s/i1Sr5xIURsoaSJK8ajGEqw)
- [install-chromium](https://www.technig.com/install-chromium-on-centos/)
- [selenium-and-chrome](https://github.com/smile365/blog/blob/master/selenium.md)
- [Session-closed-error](https://blog.csdn.net/weixin_39198406/article/details/86719814)