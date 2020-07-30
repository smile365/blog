---
title:  cookies
heading: 用js/pyppeteer/splash/request_html设置cookies的方法
date: 2020-07-30T01:46:47.778Z
categories: ["code"]
tags: 
description: 
---

部分网站需要cookies才能显示特定信息，比如不登录的情况下看不到`https://github.com/smile365`的邮箱信息。

#### 用JavaScript设置和获取网站的cookies

用chrome打开网站，按f12点击console，然后输入代码
```javascript
// 获取cookies
document.cookie
```

同理可以用JavaScript设置cookies
```javascript
// 设置cookeis
Cookies ="_octo=GH1.1.1911316843.1574215196; _ga=GA1.2.86110170.1574215236; _device_id=26f4400b5e70fff5b84f47da276ffe20; tz=Asia%2FShanghai; _gat=1; has_recent_activity=1; user_session=zORKjgUUZSzRcxjNm8BMHvEmQcMLLiG3dbPET-3NpGTRSB0R; __Host-user_session_same_site=zORKjgUUZSzRcxjNm8BMHvEmQcMLLiG3dbPET-3NpGTRSB0R; logged_in=yes; dotcom_user=sxy91;"
c = Cookies.split(";")
for(var i in c){
	document.cookie = c[i].trim(); // 需要“name=value”的字符串形式
}
```

#### 用pyppeteer和chromium设置cookies

pyppeteer是一个python库，代码如下：

```python
import asyncio
from pyppeteer import launch
Cookies ="_octo=GH1.1.1911316843.1574215196; _ga=GA1.2.86110170.1574215236; _device_id=26f4400b5e70fff5b84f47da276ffe20; tz=Asia%2FShanghai; _gat=1; has_recent_activity=1; user_session=zORKjgUUZSzRcxjNm8BMHvEmQcMLLiG3dbPET-3NpGTRSB0R; __Host-user_session_same_site=zORKjgUUZSzRcxjNm8BMHvEmQcMLLiG3dbPET-3NpGTRSB0R; logged_in=yes; dotcom_user=sxy91;"

async def test_cookies():
	browser = await launch(devtools=True, args=['--no-sandbox'])
	page = await self.browser.newPage()
	for c in Cookies.split(";"):
		v = c.split("=")
		ck = {"name":v[0].strip(),"value":v[1].strip(),'domain':'.github.com'}
		await page.setCookie(ck)
	await page.goto('https://sxy91.com/post/javscript',{'timeout':60*1000})
	await asyncio.sleep(100)
	
def test():
	asyncio.get_event_loop().run_until_complete(test_cookies())
	
if __name__ == '__main__':
	test()
```

若出现错误：
```accesslog
pyppeteer.errors.NetworkError: Protocol error (Network.deleteCookies): At least one of the url and domain needs to be specified
```

解决方法
> page.setCookie的必须要有domain,如：{'name': '_octo', 'value': 'GH1.', 'domain': '.sxy91.com'}

若网页加载较慢，则在`用pyppeteer.page.goto`的参数中增加超时时间`{'timeout':60*1000}`,单位为毫秒。

#### 使用splash设置cookies

```python
import requests

Cookies ="_octo=GH1.1.1911316843.1574215196;_ga=GA1.2.86110170.1574215236;_device_id=26f4400b5e70fff5b84f47da276ffe20; "

init_cookies= '''
function main(splash, args)
	splash:set_user_agent("%s")
	splash:init_cookies({
		%s
	})
	splash:go(args.url)
    return splash:html()
end
'''

cks = []
for c in Cookies.split(";"):
	v = c.split("=")
	#ck = {"name":v[0].strip(),"value":v[1].strip(),'domain':'.github.com'}
	ck = '''{name="%s", value="%s",domain=".github.com"}''' % (v[0].strip(),v[1].strip())
	cks.append(ck)

ckstr = ",".join(cks)

lua_script = init_cookies %(useragent,ckstr)


def pageDownload(url):
	payload = {'wait':2,'timeout':90,'url':url,'lua_source':lua_script}
	r = requests.get(SPLASH_URL,params=payload)
	log.info('pageDownload:{},{}',url,r.status_code)
	if r.status_code == requests.codes.ok:
		return r.text

t = pageDownload("https://sxy91.com/posts/cookies/")
print(t)
```